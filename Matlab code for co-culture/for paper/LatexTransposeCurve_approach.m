% for i=1:N
% DataArrayTestTransposed(1,2*i-1)=DataArrayTest(i,1);
% end
% 
% for j=1:N
% DataArrayTestTransposed(1,2*j)=DataArrayTest(j,2);
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defl. Invols in {nm/V}
DeflInvols = 70.18;
% Spring constant in {nN/nm}
k = 0.0738;

N=size(ApproachData,1);
ApproachDataF=zeros(size(ApproachData,1),size(ApproachData,2));

% Convert retract data in Ind-Volts {m-V} to Ind-Force {um-nN}
% (Ind. originally in m. We multiply by 10^6 to pass to um) 
% (Force originally in nN. We leave it like that - the multiplication by 10^-9 in main code was to go to N)
for i=1:N
ApproachDataF(i,1) = ApproachData(i,1).*10^6;   
ApproachDataF(i,2) = ApproachData(i,2).*DeflInvols.*k;
end

for j=1:N
    ApproachDataF_Transposed(1,6*j-5)="(";
    ApproachDataF_Transposed(1,6*j-4)=ApproachDataF(j,1);
    ApproachDataF_Transposed(1,6*j-3)=",";
    ApproachDataF_Transposed(1,6*j-2)=ApproachDataF(j,2);
    ApproachDataF_Transposed(1,6*j-1)=")";
    ApproachDataF_Transposed(1,6*j)=" ";
end

ApproachDataF_LatexCoordinates = strjoin(ApproachDataF_Transposed);