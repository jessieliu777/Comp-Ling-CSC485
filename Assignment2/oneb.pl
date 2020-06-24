% Heng Liu, liuheng7, 1004076493

% types
bot sub [cat, number, type].
    number sub [sg, pl]. % feature to denote singular/plural
    type sub [prp, not_prp]. % feature to denote pronoun/not pronoun
    cat sub [det, s, p, pp, has_number].
        % has_number is a group of items that can be singular/plural 
        has_number sub [n, np, v, vp] intro [number:number].
            n sub [].
            np sub [] intro [type:type].
            v sub [].
            vp sub [].
        det sub [].
        s sub [].
        p sub [].
        pp sub [].
	

% grammar rules
% singular S: NP + VP
npsg_vpsg__s rule
    s ===>
    cat> (np, number:sg), % the number have to be both singular
    cat> (vp, number:sg).

% plural S: NP + VP
nppl_vppl__s rule
    s ===>
    cat> (np, number:pl), % the number have to be both plural
    cat> (vp, number:pl).

% VP: V + NP
v_np__vp rule
    (vp, number:Num) ===>
    cat> (v, number:Num), % the the number of VP, and the V have to agree
    cat> np.

% VP: V + NP + PP
v_np_pp__vp rule
    (vp, number:Num) ===>
    cat> (v, number:Num), % the the number of VP, and the V have to agree
    cat> np,
    cat> pp.

% PP: P + NP
p_np__pp rule
    pp ===>
    cat> p,
    cat> np.

% NP: pronoun
nprp__np rule
    (np, type:prp) ===>
    cat> (n, type:prp).

% NP: plural N
nppl__np rule
    (np, number:pl, type:not_prp) ===> % plural noun cannot be pronoun
    cat> (n, number:pl).

% NP: det + N  
det_n__np rule
    (np, number:Num, type:not_prp) ===> % det cannot be used with pronoun
    cat> det,
    cat> (n, number:Num).

% lexica
biscuits ---> (n, number:pl).
dog ---> (n, number:sg).
feed ---> (v, number:pl).
feeds ---> (v, number:sg).
fred ---> (np, number:sg, type:prp).
the ---> det.
puppies ---> (n, number:pl).
with ---> p.
