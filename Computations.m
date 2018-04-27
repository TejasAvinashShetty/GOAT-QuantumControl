function [Gradients,UT] = Computations(A, B)

% final value of Unitary evolution operator during each round 
% of optimization is computed and stored
global self
self.A = A;
self.B = B;

U = eye(4);
M0 =zeros(16 + (2 * 16 * self.num_c * self.num_har),1);
M0(1:16)=U(:);

[~,M] = ode45(@(t,M) Evolution(t,M, self.A , self.B), self.tspan, M0);

self.Uv = M(:,1:16);
UTv = self.Uv(self.steps,:);
UT = reshape(UTv, 4, 4);
self.UT = UT;

self.Grad = M(:,17:end);
self.GradT = M(self.steps,:);
count = 1;
i = 1;
for k = 1:2* self.num_c * self.num_har
    
    temp = self.GradT(count:count+15);
    self.Gradients{i} = reshape(temp,4,4);
    i = i + 1;
    count = count + 16;
end
Gradients = self.Gradients;

end
