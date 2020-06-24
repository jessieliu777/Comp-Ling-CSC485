% Heng Liu, liuheng7, 1004076493

% types
bot sub [s, vpsg, vppl, pp, npsg, nppl, np, vsg, vpl, p, nprp, det, nsg, npl].
    s sub [].
    vpsg sub [].
    vppl sub [].
    pp sub [].
    npsg sub [].
    nppl sub [].
    np sub [].
    vsg sub [].
    vpl sub [].
    p sub [].
    nprp sub [].
    det sub [].
    nsg sub [].
    npl sub [].

% grammar rules
% S: NPsg + VPsg
npsg_vpsg__s rule
s ===> 
cat> npsg,
cat> vpsg.

% S: NPpl + VPpl
nppl_vppl__s rule
s ===> 
cat> nppl,
cat> vppl.

% VPsg: Vsg + NP
vsg_np__vspg rule
vpsg ===> 
cat> vsg,
cat> np.

% VPsg: Vsg + NP + PP
vsg_np_pp__vpsg rule
vpsg ===> 
cat> vsg,
cat> np,
cat> pp.

% VPpl: Vpl + NP
vpl_np__vppl rule
vppl ===> 
cat> vpl,
cat> np.

% VPpl: Vpl + NP + PP
vpl_np_pp__vppl rule
vppl ===> 
cat> vpl,
cat> np,
cat> pp.

% PP: P + NP
p_np__pp rule
pp ===>
cat> p,
cat> np.

% NPsg: NPRP
nprp__npsg rule
npsg ===>
cat> nprp.

% NPsg: det + Nsg
det_nsg__npsg rule
npsg ===>
cat> det,
cat> nsg.

% NPpl: det + Npl
det_npl__nppl rule
nppl ===>
cat> det,
cat> npl.

% NPpl: Npl
npl__nppl rule
nppl ===>
cat> npl.

% NP: NPsg
npsg__np rule
np ===>
cat> npsg.

% NP: NPpl
nppl__np rule
np ===>
cat> nppl.

% lexica
biscuits ---> npl.
dog ---> nsg.
feed ---> vpl.
feeds ---> vsg.
fred ---> nprp.
the ---> det.
puppies ---> npl.
with ---> p.