; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62770 () Bool)

(assert start!62770)

(declare-fun b!708014 () Bool)

(declare-fun res!471679 () Bool)

(declare-fun e!398432 () Bool)

(assert (=> b!708014 (=> (not res!471679) (not e!398432))))

(declare-datatypes ((array!40338 0))(
  ( (array!40339 (arr!19321 (Array (_ BitVec 32) (_ BitVec 64))) (size!19707 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40338)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708014 (= res!471679 (validKeyInArray!0 (select (arr!19321 a!3591) from!2969)))))

(declare-fun b!708015 () Bool)

(declare-fun res!471684 () Bool)

(assert (=> b!708015 (=> (not res!471684) (not e!398432))))

(assert (=> b!708015 (= res!471684 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!708016 () Bool)

(declare-fun res!471675 () Bool)

(assert (=> b!708016 (=> (not res!471675) (not e!398432))))

(declare-datatypes ((List!13269 0))(
  ( (Nil!13266) (Cons!13265 (h!14313 (_ BitVec 64)) (t!19546 List!13269)) )
))
(declare-fun newAcc!49 () List!13269)

(declare-fun contains!3921 (List!13269 (_ BitVec 64)) Bool)

(assert (=> b!708016 (= res!471675 (not (contains!3921 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708017 () Bool)

(declare-fun res!471682 () Bool)

(assert (=> b!708017 (=> (not res!471682) (not e!398432))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708017 (= res!471682 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!708018 () Bool)

(declare-fun res!471681 () Bool)

(assert (=> b!708018 (=> (not res!471681) (not e!398432))))

(declare-fun acc!652 () List!13269)

(assert (=> b!708018 (= res!471681 (not (contains!3921 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708019 () Bool)

(declare-fun res!471673 () Bool)

(assert (=> b!708019 (=> (not res!471673) (not e!398432))))

(declare-fun subseq!389 (List!13269 List!13269) Bool)

(assert (=> b!708019 (= res!471673 (subseq!389 acc!652 newAcc!49))))

(declare-fun b!708020 () Bool)

(declare-fun res!471672 () Bool)

(assert (=> b!708020 (=> (not res!471672) (not e!398432))))

(assert (=> b!708020 (= res!471672 (contains!3921 newAcc!49 k0!2824))))

(declare-fun b!708021 () Bool)

(declare-fun res!471674 () Bool)

(assert (=> b!708021 (=> (not res!471674) (not e!398432))))

(assert (=> b!708021 (= res!471674 (not (contains!3921 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708022 () Bool)

(declare-fun res!471678 () Bool)

(assert (=> b!708022 (=> (not res!471678) (not e!398432))))

(assert (=> b!708022 (= res!471678 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19707 a!3591)))))

(declare-fun b!708023 () Bool)

(declare-fun res!471686 () Bool)

(assert (=> b!708023 (=> (not res!471686) (not e!398432))))

(declare-fun arrayNoDuplicates!0 (array!40338 (_ BitVec 32) List!13269) Bool)

(assert (=> b!708023 (= res!471686 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!471680 () Bool)

(assert (=> start!62770 (=> (not res!471680) (not e!398432))))

(assert (=> start!62770 (= res!471680 (and (bvslt (size!19707 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19707 a!3591))))))

(assert (=> start!62770 e!398432))

(assert (=> start!62770 true))

(declare-fun array_inv!15180 (array!40338) Bool)

(assert (=> start!62770 (array_inv!15180 a!3591)))

(declare-fun b!708024 () Bool)

(declare-fun res!471683 () Bool)

(assert (=> b!708024 (=> (not res!471683) (not e!398432))))

(assert (=> b!708024 (= res!471683 (not (contains!3921 acc!652 k0!2824)))))

(declare-fun b!708025 () Bool)

(declare-fun res!471688 () Bool)

(assert (=> b!708025 (=> (not res!471688) (not e!398432))))

(declare-fun -!353 (List!13269 (_ BitVec 64)) List!13269)

(assert (=> b!708025 (= res!471688 (= (-!353 newAcc!49 k0!2824) acc!652))))

(declare-fun b!708026 () Bool)

(declare-fun res!471676 () Bool)

(assert (=> b!708026 (=> (not res!471676) (not e!398432))))

(assert (=> b!708026 (= res!471676 (validKeyInArray!0 k0!2824))))

(declare-fun b!708027 () Bool)

(declare-fun res!471671 () Bool)

(assert (=> b!708027 (=> (not res!471671) (not e!398432))))

(declare-fun noDuplicate!1195 (List!13269) Bool)

(assert (=> b!708027 (= res!471671 (noDuplicate!1195 acc!652))))

(declare-fun b!708028 () Bool)

(declare-fun res!471677 () Bool)

(assert (=> b!708028 (=> (not res!471677) (not e!398432))))

(assert (=> b!708028 (= res!471677 (not (contains!3921 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708029 () Bool)

(declare-fun $colon$colon!497 (List!13269 (_ BitVec 64)) List!13269)

(assert (=> b!708029 (= e!398432 (not (noDuplicate!1195 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))))))

(declare-fun b!708030 () Bool)

(declare-fun res!471687 () Bool)

(assert (=> b!708030 (=> (not res!471687) (not e!398432))))

(assert (=> b!708030 (= res!471687 (noDuplicate!1195 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969))))))

(declare-fun b!708031 () Bool)

(declare-fun res!471685 () Bool)

(assert (=> b!708031 (=> (not res!471685) (not e!398432))))

(assert (=> b!708031 (= res!471685 (noDuplicate!1195 newAcc!49))))

(assert (= (and start!62770 res!471680) b!708027))

(assert (= (and b!708027 res!471671) b!708031))

(assert (= (and b!708031 res!471685) b!708028))

(assert (= (and b!708028 res!471677) b!708018))

(assert (= (and b!708018 res!471681) b!708017))

(assert (= (and b!708017 res!471682) b!708024))

(assert (= (and b!708024 res!471683) b!708026))

(assert (= (and b!708026 res!471676) b!708023))

(assert (= (and b!708023 res!471686) b!708019))

(assert (= (and b!708019 res!471673) b!708020))

(assert (= (and b!708020 res!471672) b!708025))

(assert (= (and b!708025 res!471688) b!708021))

(assert (= (and b!708021 res!471674) b!708016))

(assert (= (and b!708016 res!471675) b!708022))

(assert (= (and b!708022 res!471678) b!708014))

(assert (= (and b!708014 res!471679) b!708015))

(assert (= (and b!708015 res!471684) b!708030))

(assert (= (and b!708030 res!471687) b!708029))

(declare-fun m!665955 () Bool)

(assert (=> b!708031 m!665955))

(declare-fun m!665957 () Bool)

(assert (=> b!708029 m!665957))

(assert (=> b!708029 m!665957))

(declare-fun m!665959 () Bool)

(assert (=> b!708029 m!665959))

(assert (=> b!708029 m!665959))

(declare-fun m!665961 () Bool)

(assert (=> b!708029 m!665961))

(declare-fun m!665963 () Bool)

(assert (=> b!708018 m!665963))

(declare-fun m!665965 () Bool)

(assert (=> b!708027 m!665965))

(declare-fun m!665967 () Bool)

(assert (=> b!708020 m!665967))

(declare-fun m!665969 () Bool)

(assert (=> b!708025 m!665969))

(declare-fun m!665971 () Bool)

(assert (=> b!708016 m!665971))

(declare-fun m!665973 () Bool)

(assert (=> b!708024 m!665973))

(declare-fun m!665975 () Bool)

(assert (=> start!62770 m!665975))

(declare-fun m!665977 () Bool)

(assert (=> b!708021 m!665977))

(assert (=> b!708014 m!665957))

(assert (=> b!708014 m!665957))

(declare-fun m!665979 () Bool)

(assert (=> b!708014 m!665979))

(assert (=> b!708030 m!665957))

(assert (=> b!708030 m!665957))

(declare-fun m!665981 () Bool)

(assert (=> b!708030 m!665981))

(assert (=> b!708030 m!665981))

(declare-fun m!665983 () Bool)

(assert (=> b!708030 m!665983))

(declare-fun m!665985 () Bool)

(assert (=> b!708023 m!665985))

(declare-fun m!665987 () Bool)

(assert (=> b!708026 m!665987))

(declare-fun m!665989 () Bool)

(assert (=> b!708017 m!665989))

(declare-fun m!665991 () Bool)

(assert (=> b!708019 m!665991))

(declare-fun m!665993 () Bool)

(assert (=> b!708028 m!665993))

(check-sat (not b!708014) (not b!708017) (not b!708027) (not b!708020) (not b!708031) (not b!708029) (not b!708016) (not b!708026) (not start!62770) (not b!708018) (not b!708030) (not b!708028) (not b!708024) (not b!708019) (not b!708021) (not b!708025) (not b!708023))
(check-sat)
(get-model)

(declare-fun b!708150 () Bool)

(declare-fun e!398456 () Bool)

(declare-fun call!34383 () Bool)

(assert (=> b!708150 (= e!398456 call!34383)))

(declare-fun b!708151 () Bool)

(assert (=> b!708151 (= e!398456 call!34383)))

(declare-fun d!96701 () Bool)

(declare-fun res!471803 () Bool)

(declare-fun e!398455 () Bool)

(assert (=> d!96701 (=> res!471803 e!398455)))

(assert (=> d!96701 (= res!471803 (bvsge from!2969 (size!19707 a!3591)))))

(assert (=> d!96701 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398455)))

(declare-fun b!708152 () Bool)

(declare-fun e!398457 () Bool)

(assert (=> b!708152 (= e!398457 e!398456)))

(declare-fun c!78542 () Bool)

(assert (=> b!708152 (= c!78542 (validKeyInArray!0 (select (arr!19321 a!3591) from!2969)))))

(declare-fun bm!34380 () Bool)

(assert (=> bm!34380 (= call!34383 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78542 (Cons!13265 (select (arr!19321 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!708153 () Bool)

(assert (=> b!708153 (= e!398455 e!398457)))

(declare-fun res!471804 () Bool)

(assert (=> b!708153 (=> (not res!471804) (not e!398457))))

(declare-fun e!398454 () Bool)

(assert (=> b!708153 (= res!471804 (not e!398454))))

(declare-fun res!471805 () Bool)

(assert (=> b!708153 (=> (not res!471805) (not e!398454))))

(assert (=> b!708153 (= res!471805 (validKeyInArray!0 (select (arr!19321 a!3591) from!2969)))))

(declare-fun b!708154 () Bool)

(assert (=> b!708154 (= e!398454 (contains!3921 acc!652 (select (arr!19321 a!3591) from!2969)))))

(assert (= (and d!96701 (not res!471803)) b!708153))

(assert (= (and b!708153 res!471805) b!708154))

(assert (= (and b!708153 res!471804) b!708152))

(assert (= (and b!708152 c!78542) b!708150))

(assert (= (and b!708152 (not c!78542)) b!708151))

(assert (= (or b!708150 b!708151) bm!34380))

(assert (=> b!708152 m!665957))

(assert (=> b!708152 m!665957))

(assert (=> b!708152 m!665979))

(assert (=> bm!34380 m!665957))

(declare-fun m!666075 () Bool)

(assert (=> bm!34380 m!666075))

(assert (=> b!708153 m!665957))

(assert (=> b!708153 m!665957))

(assert (=> b!708153 m!665979))

(assert (=> b!708154 m!665957))

(assert (=> b!708154 m!665957))

(declare-fun m!666077 () Bool)

(assert (=> b!708154 m!666077))

(assert (=> b!708023 d!96701))

(declare-fun d!96703 () Bool)

(declare-fun lt!318138 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!335 (List!13269) (InoxSet (_ BitVec 64)))

(assert (=> d!96703 (= lt!318138 (select (content!335 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398463 () Bool)

(assert (=> d!96703 (= lt!318138 e!398463)))

(declare-fun res!471810 () Bool)

(assert (=> d!96703 (=> (not res!471810) (not e!398463))))

(get-info :version)

(assert (=> d!96703 (= res!471810 ((_ is Cons!13265) newAcc!49))))

(assert (=> d!96703 (= (contains!3921 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318138)))

(declare-fun b!708159 () Bool)

(declare-fun e!398462 () Bool)

(assert (=> b!708159 (= e!398463 e!398462)))

(declare-fun res!471811 () Bool)

(assert (=> b!708159 (=> res!471811 e!398462)))

(assert (=> b!708159 (= res!471811 (= (h!14313 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708160 () Bool)

(assert (=> b!708160 (= e!398462 (contains!3921 (t!19546 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96703 res!471810) b!708159))

(assert (= (and b!708159 (not res!471811)) b!708160))

(declare-fun m!666079 () Bool)

(assert (=> d!96703 m!666079))

(declare-fun m!666081 () Bool)

(assert (=> d!96703 m!666081))

(declare-fun m!666083 () Bool)

(assert (=> b!708160 m!666083))

(assert (=> b!708021 d!96703))

(declare-fun b!708201 () Bool)

(declare-fun e!398501 () List!13269)

(declare-fun call!34388 () List!13269)

(assert (=> b!708201 (= e!398501 call!34388)))

(declare-fun b!708202 () Bool)

(declare-fun lt!318145 () List!13269)

(declare-fun e!398500 () Bool)

(assert (=> b!708202 (= e!398500 (= (content!335 lt!318145) ((_ map and) (content!335 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!708203 () Bool)

(assert (=> b!708203 (= e!398501 (Cons!13265 (h!14313 newAcc!49) call!34388))))

(declare-fun b!708204 () Bool)

(declare-fun e!398499 () List!13269)

(assert (=> b!708204 (= e!398499 Nil!13266)))

(declare-fun b!708205 () Bool)

(assert (=> b!708205 (= e!398499 e!398501)))

(declare-fun c!78550 () Bool)

(assert (=> b!708205 (= c!78550 (= k0!2824 (h!14313 newAcc!49)))))

(declare-fun bm!34385 () Bool)

(assert (=> bm!34385 (= call!34388 (-!353 (t!19546 newAcc!49) k0!2824))))

(declare-fun d!96709 () Bool)

(assert (=> d!96709 e!398500))

(declare-fun res!471840 () Bool)

(assert (=> d!96709 (=> (not res!471840) (not e!398500))))

(declare-fun size!19710 (List!13269) Int)

(assert (=> d!96709 (= res!471840 (<= (size!19710 lt!318145) (size!19710 newAcc!49)))))

(assert (=> d!96709 (= lt!318145 e!398499)))

(declare-fun c!78549 () Bool)

(assert (=> d!96709 (= c!78549 ((_ is Cons!13265) newAcc!49))))

(assert (=> d!96709 (= (-!353 newAcc!49 k0!2824) lt!318145)))

(assert (= (and d!96709 c!78549) b!708205))

(assert (= (and d!96709 (not c!78549)) b!708204))

(assert (= (and b!708205 c!78550) b!708201))

(assert (= (and b!708205 (not c!78550)) b!708203))

(assert (= (or b!708201 b!708203) bm!34385))

(assert (= (and d!96709 res!471840) b!708202))

(declare-fun m!666103 () Bool)

(assert (=> b!708202 m!666103))

(assert (=> b!708202 m!666079))

(declare-fun m!666105 () Bool)

(assert (=> b!708202 m!666105))

(declare-fun m!666107 () Bool)

(assert (=> bm!34385 m!666107))

(declare-fun m!666109 () Bool)

(assert (=> d!96709 m!666109))

(declare-fun m!666111 () Bool)

(assert (=> d!96709 m!666111))

(assert (=> b!708025 d!96709))

(declare-fun d!96723 () Bool)

(assert (=> d!96723 (= (validKeyInArray!0 (select (arr!19321 a!3591) from!2969)) (and (not (= (select (arr!19321 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19321 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708014 d!96723))

(declare-fun d!96729 () Bool)

(assert (=> d!96729 (= (array_inv!15180 a!3591) (bvsge (size!19707 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62770 d!96729))

(declare-fun d!96733 () Bool)

(declare-fun lt!318148 () Bool)

(assert (=> d!96733 (= lt!318148 (select (content!335 acc!652) k0!2824))))

(declare-fun e!398511 () Bool)

(assert (=> d!96733 (= lt!318148 e!398511)))

(declare-fun res!471848 () Bool)

(assert (=> d!96733 (=> (not res!471848) (not e!398511))))

(assert (=> d!96733 (= res!471848 ((_ is Cons!13265) acc!652))))

(assert (=> d!96733 (= (contains!3921 acc!652 k0!2824) lt!318148)))

(declare-fun b!708215 () Bool)

(declare-fun e!398510 () Bool)

(assert (=> b!708215 (= e!398511 e!398510)))

(declare-fun res!471849 () Bool)

(assert (=> b!708215 (=> res!471849 e!398510)))

(assert (=> b!708215 (= res!471849 (= (h!14313 acc!652) k0!2824))))

(declare-fun b!708216 () Bool)

(assert (=> b!708216 (= e!398510 (contains!3921 (t!19546 acc!652) k0!2824))))

(assert (= (and d!96733 res!471848) b!708215))

(assert (= (and b!708215 (not res!471849)) b!708216))

(declare-fun m!666121 () Bool)

(assert (=> d!96733 m!666121))

(declare-fun m!666123 () Bool)

(assert (=> d!96733 m!666123))

(declare-fun m!666127 () Bool)

(assert (=> b!708216 m!666127))

(assert (=> b!708024 d!96733))

(declare-fun d!96737 () Bool)

(declare-fun res!471862 () Bool)

(declare-fun e!398524 () Bool)

(assert (=> d!96737 (=> res!471862 e!398524)))

(assert (=> d!96737 (= res!471862 (= (select (arr!19321 a!3591) from!2969) k0!2824))))

(assert (=> d!96737 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398524)))

(declare-fun b!708229 () Bool)

(declare-fun e!398525 () Bool)

(assert (=> b!708229 (= e!398524 e!398525)))

(declare-fun res!471863 () Bool)

(assert (=> b!708229 (=> (not res!471863) (not e!398525))))

(assert (=> b!708229 (= res!471863 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19707 a!3591)))))

(declare-fun b!708230 () Bool)

(assert (=> b!708230 (= e!398525 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96737 (not res!471862)) b!708229))

(assert (= (and b!708229 res!471863) b!708230))

(assert (=> d!96737 m!665957))

(declare-fun m!666139 () Bool)

(assert (=> b!708230 m!666139))

(assert (=> b!708017 d!96737))

(declare-fun d!96745 () Bool)

(declare-fun lt!318150 () Bool)

(assert (=> d!96745 (= lt!318150 (select (content!335 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398535 () Bool)

(assert (=> d!96745 (= lt!318150 e!398535)))

(declare-fun res!471872 () Bool)

(assert (=> d!96745 (=> (not res!471872) (not e!398535))))

(assert (=> d!96745 (= res!471872 ((_ is Cons!13265) acc!652))))

(assert (=> d!96745 (= (contains!3921 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318150)))

(declare-fun b!708237 () Bool)

(declare-fun e!398534 () Bool)

(assert (=> b!708237 (= e!398535 e!398534)))

(declare-fun res!471873 () Bool)

(assert (=> b!708237 (=> res!471873 e!398534)))

(assert (=> b!708237 (= res!471873 (= (h!14313 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708238 () Bool)

(assert (=> b!708238 (= e!398534 (contains!3921 (t!19546 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96745 res!471872) b!708237))

(assert (= (and b!708237 (not res!471873)) b!708238))

(assert (=> d!96745 m!666121))

(declare-fun m!666141 () Bool)

(assert (=> d!96745 m!666141))

(declare-fun m!666143 () Bool)

(assert (=> b!708238 m!666143))

(assert (=> b!708028 d!96745))

(declare-fun d!96747 () Bool)

(assert (=> d!96747 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708026 d!96747))

(declare-fun d!96749 () Bool)

(declare-fun res!471886 () Bool)

(declare-fun e!398548 () Bool)

(assert (=> d!96749 (=> res!471886 e!398548)))

(assert (=> d!96749 (= res!471886 ((_ is Nil!13266) acc!652))))

(assert (=> d!96749 (= (noDuplicate!1195 acc!652) e!398548)))

(declare-fun b!708253 () Bool)

(declare-fun e!398549 () Bool)

(assert (=> b!708253 (= e!398548 e!398549)))

(declare-fun res!471887 () Bool)

(assert (=> b!708253 (=> (not res!471887) (not e!398549))))

(assert (=> b!708253 (= res!471887 (not (contains!3921 (t!19546 acc!652) (h!14313 acc!652))))))

(declare-fun b!708254 () Bool)

(assert (=> b!708254 (= e!398549 (noDuplicate!1195 (t!19546 acc!652)))))

(assert (= (and d!96749 (not res!471886)) b!708253))

(assert (= (and b!708253 res!471887) b!708254))

(declare-fun m!666155 () Bool)

(assert (=> b!708253 m!666155))

(declare-fun m!666157 () Bool)

(assert (=> b!708254 m!666157))

(assert (=> b!708027 d!96749))

(declare-fun d!96757 () Bool)

(declare-fun lt!318151 () Bool)

(assert (=> d!96757 (= lt!318151 (select (content!335 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398551 () Bool)

(assert (=> d!96757 (= lt!318151 e!398551)))

(declare-fun res!471888 () Bool)

(assert (=> d!96757 (=> (not res!471888) (not e!398551))))

(assert (=> d!96757 (= res!471888 ((_ is Cons!13265) newAcc!49))))

(assert (=> d!96757 (= (contains!3921 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318151)))

(declare-fun b!708255 () Bool)

(declare-fun e!398550 () Bool)

(assert (=> b!708255 (= e!398551 e!398550)))

(declare-fun res!471889 () Bool)

(assert (=> b!708255 (=> res!471889 e!398550)))

(assert (=> b!708255 (= res!471889 (= (h!14313 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708256 () Bool)

(assert (=> b!708256 (= e!398550 (contains!3921 (t!19546 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96757 res!471888) b!708255))

(assert (= (and b!708255 (not res!471889)) b!708256))

(assert (=> d!96757 m!666079))

(declare-fun m!666159 () Bool)

(assert (=> d!96757 m!666159))

(declare-fun m!666161 () Bool)

(assert (=> b!708256 m!666161))

(assert (=> b!708016 d!96757))

(declare-fun d!96759 () Bool)

(declare-fun res!471894 () Bool)

(declare-fun e!398556 () Bool)

(assert (=> d!96759 (=> res!471894 e!398556)))

(assert (=> d!96759 (= res!471894 ((_ is Nil!13266) ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969))))))

(assert (=> d!96759 (= (noDuplicate!1195 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969))) e!398556)))

(declare-fun b!708261 () Bool)

(declare-fun e!398557 () Bool)

(assert (=> b!708261 (= e!398556 e!398557)))

(declare-fun res!471895 () Bool)

(assert (=> b!708261 (=> (not res!471895) (not e!398557))))

(assert (=> b!708261 (= res!471895 (not (contains!3921 (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969))) (h!14313 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969))))))))

(declare-fun b!708262 () Bool)

(assert (=> b!708262 (= e!398557 (noDuplicate!1195 (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))))))

(assert (= (and d!96759 (not res!471894)) b!708261))

(assert (= (and b!708261 res!471895) b!708262))

(declare-fun m!666163 () Bool)

(assert (=> b!708261 m!666163))

(declare-fun m!666165 () Bool)

(assert (=> b!708262 m!666165))

(assert (=> b!708030 d!96759))

(declare-fun d!96761 () Bool)

(assert (=> d!96761 (= ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)) (Cons!13265 (select (arr!19321 a!3591) from!2969) acc!652))))

(assert (=> b!708030 d!96761))

(declare-fun d!96763 () Bool)

(declare-fun res!471904 () Bool)

(declare-fun e!398568 () Bool)

(assert (=> d!96763 (=> res!471904 e!398568)))

(assert (=> d!96763 (= res!471904 ((_ is Nil!13266) newAcc!49))))

(assert (=> d!96763 (= (noDuplicate!1195 newAcc!49) e!398568)))

(declare-fun b!708275 () Bool)

(declare-fun e!398569 () Bool)

(assert (=> b!708275 (= e!398568 e!398569)))

(declare-fun res!471905 () Bool)

(assert (=> b!708275 (=> (not res!471905) (not e!398569))))

(assert (=> b!708275 (= res!471905 (not (contains!3921 (t!19546 newAcc!49) (h!14313 newAcc!49))))))

(declare-fun b!708276 () Bool)

(assert (=> b!708276 (= e!398569 (noDuplicate!1195 (t!19546 newAcc!49)))))

(assert (= (and d!96763 (not res!471904)) b!708275))

(assert (= (and b!708275 res!471905) b!708276))

(declare-fun m!666171 () Bool)

(assert (=> b!708275 m!666171))

(declare-fun m!666173 () Bool)

(assert (=> b!708276 m!666173))

(assert (=> b!708031 d!96763))

(declare-fun d!96767 () Bool)

(declare-fun lt!318152 () Bool)

(assert (=> d!96767 (= lt!318152 (select (content!335 newAcc!49) k0!2824))))

(declare-fun e!398573 () Bool)

(assert (=> d!96767 (= lt!318152 e!398573)))

(declare-fun res!471908 () Bool)

(assert (=> d!96767 (=> (not res!471908) (not e!398573))))

(assert (=> d!96767 (= res!471908 ((_ is Cons!13265) newAcc!49))))

(assert (=> d!96767 (= (contains!3921 newAcc!49 k0!2824) lt!318152)))

(declare-fun b!708279 () Bool)

(declare-fun e!398572 () Bool)

(assert (=> b!708279 (= e!398573 e!398572)))

(declare-fun res!471909 () Bool)

(assert (=> b!708279 (=> res!471909 e!398572)))

(assert (=> b!708279 (= res!471909 (= (h!14313 newAcc!49) k0!2824))))

(declare-fun b!708280 () Bool)

(assert (=> b!708280 (= e!398572 (contains!3921 (t!19546 newAcc!49) k0!2824))))

(assert (= (and d!96767 res!471908) b!708279))

(assert (= (and b!708279 (not res!471909)) b!708280))

(assert (=> d!96767 m!666079))

(declare-fun m!666179 () Bool)

(assert (=> d!96767 m!666179))

(declare-fun m!666181 () Bool)

(assert (=> b!708280 m!666181))

(assert (=> b!708020 d!96767))

(declare-fun d!96771 () Bool)

(declare-fun res!471910 () Bool)

(declare-fun e!398574 () Bool)

(assert (=> d!96771 (=> res!471910 e!398574)))

(assert (=> d!96771 (= res!471910 ((_ is Nil!13266) ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969))))))

(assert (=> d!96771 (= (noDuplicate!1195 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969))) e!398574)))

(declare-fun b!708281 () Bool)

(declare-fun e!398575 () Bool)

(assert (=> b!708281 (= e!398574 e!398575)))

(declare-fun res!471911 () Bool)

(assert (=> b!708281 (=> (not res!471911) (not e!398575))))

(assert (=> b!708281 (= res!471911 (not (contains!3921 (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969))) (h!14313 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969))))))))

(declare-fun b!708282 () Bool)

(assert (=> b!708282 (= e!398575 (noDuplicate!1195 (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))))))

(assert (= (and d!96771 (not res!471910)) b!708281))

(assert (= (and b!708281 res!471911) b!708282))

(declare-fun m!666183 () Bool)

(assert (=> b!708281 m!666183))

(declare-fun m!666185 () Bool)

(assert (=> b!708282 m!666185))

(assert (=> b!708029 d!96771))

(declare-fun d!96773 () Bool)

(assert (=> d!96773 (= ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)) (Cons!13265 (select (arr!19321 a!3591) from!2969) newAcc!49))))

(assert (=> b!708029 d!96773))

(declare-fun d!96775 () Bool)

(declare-fun lt!318153 () Bool)

(assert (=> d!96775 (= lt!318153 (select (content!335 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398577 () Bool)

(assert (=> d!96775 (= lt!318153 e!398577)))

(declare-fun res!471912 () Bool)

(assert (=> d!96775 (=> (not res!471912) (not e!398577))))

(assert (=> d!96775 (= res!471912 ((_ is Cons!13265) acc!652))))

(assert (=> d!96775 (= (contains!3921 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318153)))

(declare-fun b!708283 () Bool)

(declare-fun e!398576 () Bool)

(assert (=> b!708283 (= e!398577 e!398576)))

(declare-fun res!471913 () Bool)

(assert (=> b!708283 (=> res!471913 e!398576)))

(assert (=> b!708283 (= res!471913 (= (h!14313 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708284 () Bool)

(assert (=> b!708284 (= e!398576 (contains!3921 (t!19546 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96775 res!471912) b!708283))

(assert (= (and b!708283 (not res!471913)) b!708284))

(assert (=> d!96775 m!666121))

(declare-fun m!666187 () Bool)

(assert (=> d!96775 m!666187))

(declare-fun m!666189 () Bool)

(assert (=> b!708284 m!666189))

(assert (=> b!708018 d!96775))

(declare-fun b!708313 () Bool)

(declare-fun e!398603 () Bool)

(declare-fun e!398604 () Bool)

(assert (=> b!708313 (= e!398603 e!398604)))

(declare-fun res!471932 () Bool)

(assert (=> b!708313 (=> res!471932 e!398604)))

(declare-fun e!398602 () Bool)

(assert (=> b!708313 (= res!471932 e!398602)))

(declare-fun res!471931 () Bool)

(assert (=> b!708313 (=> (not res!471931) (not e!398602))))

(assert (=> b!708313 (= res!471931 (= (h!14313 acc!652) (h!14313 newAcc!49)))))

(declare-fun d!96777 () Bool)

(declare-fun res!471933 () Bool)

(declare-fun e!398601 () Bool)

(assert (=> d!96777 (=> res!471933 e!398601)))

(assert (=> d!96777 (= res!471933 ((_ is Nil!13266) acc!652))))

(assert (=> d!96777 (= (subseq!389 acc!652 newAcc!49) e!398601)))

(declare-fun b!708314 () Bool)

(assert (=> b!708314 (= e!398602 (subseq!389 (t!19546 acc!652) (t!19546 newAcc!49)))))

(declare-fun b!708312 () Bool)

(assert (=> b!708312 (= e!398601 e!398603)))

(declare-fun res!471934 () Bool)

(assert (=> b!708312 (=> (not res!471934) (not e!398603))))

(assert (=> b!708312 (= res!471934 ((_ is Cons!13265) newAcc!49))))

(declare-fun b!708315 () Bool)

(assert (=> b!708315 (= e!398604 (subseq!389 acc!652 (t!19546 newAcc!49)))))

(assert (= (and d!96777 (not res!471933)) b!708312))

(assert (= (and b!708312 res!471934) b!708313))

(assert (= (and b!708313 res!471931) b!708314))

(assert (= (and b!708313 (not res!471932)) b!708315))

(declare-fun m!666203 () Bool)

(assert (=> b!708314 m!666203))

(declare-fun m!666205 () Bool)

(assert (=> b!708315 m!666205))

(assert (=> b!708019 d!96777))

(check-sat (not d!96767) (not b!708253) (not b!708261) (not b!708314) (not d!96757) (not d!96703) (not b!708202) (not b!708282) (not b!708276) (not bm!34380) (not b!708281) (not d!96733) (not b!708154) (not b!708216) (not b!708284) (not b!708315) (not b!708238) (not b!708280) (not bm!34385) (not b!708230) (not b!708153) (not b!708262) (not b!708275) (not d!96709) (not b!708152) (not b!708256) (not b!708160) (not b!708254) (not d!96775) (not d!96745))
(check-sat)
(get-model)

(declare-fun d!96815 () Bool)

(declare-fun c!78569 () Bool)

(assert (=> d!96815 (= c!78569 ((_ is Nil!13266) acc!652))))

(declare-fun e!398652 () (InoxSet (_ BitVec 64)))

(assert (=> d!96815 (= (content!335 acc!652) e!398652)))

(declare-fun b!708372 () Bool)

(assert (=> b!708372 (= e!398652 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!708373 () Bool)

(assert (=> b!708373 (= e!398652 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!14313 acc!652) true) (content!335 (t!19546 acc!652))))))

(assert (= (and d!96815 c!78569) b!708372))

(assert (= (and d!96815 (not c!78569)) b!708373))

(declare-fun m!666267 () Bool)

(assert (=> b!708373 m!666267))

(declare-fun m!666269 () Bool)

(assert (=> b!708373 m!666269))

(assert (=> d!96745 d!96815))

(declare-fun d!96817 () Bool)

(declare-fun res!471971 () Bool)

(declare-fun e!398653 () Bool)

(assert (=> d!96817 (=> res!471971 e!398653)))

(assert (=> d!96817 (= res!471971 ((_ is Nil!13266) (t!19546 acc!652)))))

(assert (=> d!96817 (= (noDuplicate!1195 (t!19546 acc!652)) e!398653)))

(declare-fun b!708374 () Bool)

(declare-fun e!398654 () Bool)

(assert (=> b!708374 (= e!398653 e!398654)))

(declare-fun res!471972 () Bool)

(assert (=> b!708374 (=> (not res!471972) (not e!398654))))

(assert (=> b!708374 (= res!471972 (not (contains!3921 (t!19546 (t!19546 acc!652)) (h!14313 (t!19546 acc!652)))))))

(declare-fun b!708375 () Bool)

(assert (=> b!708375 (= e!398654 (noDuplicate!1195 (t!19546 (t!19546 acc!652))))))

(assert (= (and d!96817 (not res!471971)) b!708374))

(assert (= (and b!708374 res!471972) b!708375))

(declare-fun m!666271 () Bool)

(assert (=> b!708374 m!666271))

(declare-fun m!666273 () Bool)

(assert (=> b!708375 m!666273))

(assert (=> b!708254 d!96817))

(assert (=> d!96775 d!96815))

(declare-fun d!96819 () Bool)

(declare-fun c!78570 () Bool)

(assert (=> d!96819 (= c!78570 ((_ is Nil!13266) lt!318145))))

(declare-fun e!398655 () (InoxSet (_ BitVec 64)))

(assert (=> d!96819 (= (content!335 lt!318145) e!398655)))

(declare-fun b!708376 () Bool)

(assert (=> b!708376 (= e!398655 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!708377 () Bool)

(assert (=> b!708377 (= e!398655 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!14313 lt!318145) true) (content!335 (t!19546 lt!318145))))))

(assert (= (and d!96819 c!78570) b!708376))

(assert (= (and d!96819 (not c!78570)) b!708377))

(declare-fun m!666275 () Bool)

(assert (=> b!708377 m!666275))

(declare-fun m!666277 () Bool)

(assert (=> b!708377 m!666277))

(assert (=> b!708202 d!96819))

(declare-fun d!96821 () Bool)

(declare-fun c!78571 () Bool)

(assert (=> d!96821 (= c!78571 ((_ is Nil!13266) newAcc!49))))

(declare-fun e!398656 () (InoxSet (_ BitVec 64)))

(assert (=> d!96821 (= (content!335 newAcc!49) e!398656)))

(declare-fun b!708378 () Bool)

(assert (=> b!708378 (= e!398656 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!708379 () Bool)

(assert (=> b!708379 (= e!398656 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!14313 newAcc!49) true) (content!335 (t!19546 newAcc!49))))))

(assert (= (and d!96821 c!78571) b!708378))

(assert (= (and d!96821 (not c!78571)) b!708379))

(declare-fun m!666279 () Bool)

(assert (=> b!708379 m!666279))

(declare-fun m!666281 () Bool)

(assert (=> b!708379 m!666281))

(assert (=> b!708202 d!96821))

(declare-fun b!708381 () Bool)

(declare-fun e!398659 () Bool)

(declare-fun e!398660 () Bool)

(assert (=> b!708381 (= e!398659 e!398660)))

(declare-fun res!471974 () Bool)

(assert (=> b!708381 (=> res!471974 e!398660)))

(declare-fun e!398658 () Bool)

(assert (=> b!708381 (= res!471974 e!398658)))

(declare-fun res!471973 () Bool)

(assert (=> b!708381 (=> (not res!471973) (not e!398658))))

(assert (=> b!708381 (= res!471973 (= (h!14313 (t!19546 acc!652)) (h!14313 (t!19546 newAcc!49))))))

(declare-fun d!96823 () Bool)

(declare-fun res!471975 () Bool)

(declare-fun e!398657 () Bool)

(assert (=> d!96823 (=> res!471975 e!398657)))

(assert (=> d!96823 (= res!471975 ((_ is Nil!13266) (t!19546 acc!652)))))

(assert (=> d!96823 (= (subseq!389 (t!19546 acc!652) (t!19546 newAcc!49)) e!398657)))

(declare-fun b!708382 () Bool)

(assert (=> b!708382 (= e!398658 (subseq!389 (t!19546 (t!19546 acc!652)) (t!19546 (t!19546 newAcc!49))))))

(declare-fun b!708380 () Bool)

(assert (=> b!708380 (= e!398657 e!398659)))

(declare-fun res!471976 () Bool)

(assert (=> b!708380 (=> (not res!471976) (not e!398659))))

(assert (=> b!708380 (= res!471976 ((_ is Cons!13265) (t!19546 newAcc!49)))))

(declare-fun b!708383 () Bool)

(assert (=> b!708383 (= e!398660 (subseq!389 (t!19546 acc!652) (t!19546 (t!19546 newAcc!49))))))

(assert (= (and d!96823 (not res!471975)) b!708380))

(assert (= (and b!708380 res!471976) b!708381))

(assert (= (and b!708381 res!471973) b!708382))

(assert (= (and b!708381 (not res!471974)) b!708383))

(declare-fun m!666283 () Bool)

(assert (=> b!708382 m!666283))

(declare-fun m!666285 () Bool)

(assert (=> b!708383 m!666285))

(assert (=> b!708314 d!96823))

(declare-fun d!96825 () Bool)

(declare-fun lt!318169 () Bool)

(assert (=> d!96825 (= lt!318169 (select (content!335 (t!19546 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398662 () Bool)

(assert (=> d!96825 (= lt!318169 e!398662)))

(declare-fun res!471977 () Bool)

(assert (=> d!96825 (=> (not res!471977) (not e!398662))))

(assert (=> d!96825 (= res!471977 ((_ is Cons!13265) (t!19546 newAcc!49)))))

(assert (=> d!96825 (= (contains!3921 (t!19546 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000) lt!318169)))

(declare-fun b!708384 () Bool)

(declare-fun e!398661 () Bool)

(assert (=> b!708384 (= e!398662 e!398661)))

(declare-fun res!471978 () Bool)

(assert (=> b!708384 (=> res!471978 e!398661)))

(assert (=> b!708384 (= res!471978 (= (h!14313 (t!19546 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708385 () Bool)

(assert (=> b!708385 (= e!398661 (contains!3921 (t!19546 (t!19546 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96825 res!471977) b!708384))

(assert (= (and b!708384 (not res!471978)) b!708385))

(assert (=> d!96825 m!666281))

(declare-fun m!666287 () Bool)

(assert (=> d!96825 m!666287))

(declare-fun m!666289 () Bool)

(assert (=> b!708385 m!666289))

(assert (=> b!708160 d!96825))

(assert (=> d!96703 d!96821))

(declare-fun d!96827 () Bool)

(declare-fun lt!318170 () Bool)

(assert (=> d!96827 (= lt!318170 (select (content!335 (t!19546 newAcc!49)) k0!2824))))

(declare-fun e!398664 () Bool)

(assert (=> d!96827 (= lt!318170 e!398664)))

(declare-fun res!471979 () Bool)

(assert (=> d!96827 (=> (not res!471979) (not e!398664))))

(assert (=> d!96827 (= res!471979 ((_ is Cons!13265) (t!19546 newAcc!49)))))

(assert (=> d!96827 (= (contains!3921 (t!19546 newAcc!49) k0!2824) lt!318170)))

(declare-fun b!708386 () Bool)

(declare-fun e!398663 () Bool)

(assert (=> b!708386 (= e!398664 e!398663)))

(declare-fun res!471980 () Bool)

(assert (=> b!708386 (=> res!471980 e!398663)))

(assert (=> b!708386 (= res!471980 (= (h!14313 (t!19546 newAcc!49)) k0!2824))))

(declare-fun b!708387 () Bool)

(assert (=> b!708387 (= e!398663 (contains!3921 (t!19546 (t!19546 newAcc!49)) k0!2824))))

(assert (= (and d!96827 res!471979) b!708386))

(assert (= (and b!708386 (not res!471980)) b!708387))

(assert (=> d!96827 m!666281))

(declare-fun m!666291 () Bool)

(assert (=> d!96827 m!666291))

(declare-fun m!666293 () Bool)

(assert (=> b!708387 m!666293))

(assert (=> b!708280 d!96827))

(assert (=> d!96733 d!96815))

(declare-fun lt!318171 () Bool)

(declare-fun d!96829 () Bool)

(assert (=> d!96829 (= lt!318171 (select (content!335 (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))) (h!14313 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))))))

(declare-fun e!398666 () Bool)

(assert (=> d!96829 (= lt!318171 e!398666)))

(declare-fun res!471981 () Bool)

(assert (=> d!96829 (=> (not res!471981) (not e!398666))))

(assert (=> d!96829 (= res!471981 ((_ is Cons!13265) (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))))))

(assert (=> d!96829 (= (contains!3921 (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969))) (h!14313 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))) lt!318171)))

(declare-fun b!708388 () Bool)

(declare-fun e!398665 () Bool)

(assert (=> b!708388 (= e!398666 e!398665)))

(declare-fun res!471982 () Bool)

(assert (=> b!708388 (=> res!471982 e!398665)))

(assert (=> b!708388 (= res!471982 (= (h!14313 (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))) (h!14313 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))))))

(declare-fun b!708389 () Bool)

(assert (=> b!708389 (= e!398665 (contains!3921 (t!19546 (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))) (h!14313 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))))))

(assert (= (and d!96829 res!471981) b!708388))

(assert (= (and b!708388 (not res!471982)) b!708389))

(declare-fun m!666295 () Bool)

(assert (=> d!96829 m!666295))

(declare-fun m!666297 () Bool)

(assert (=> d!96829 m!666297))

(declare-fun m!666299 () Bool)

(assert (=> b!708389 m!666299))

(assert (=> b!708261 d!96829))

(declare-fun d!96831 () Bool)

(declare-fun lt!318172 () Bool)

(assert (=> d!96831 (= lt!318172 (select (content!335 (t!19546 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398668 () Bool)

(assert (=> d!96831 (= lt!318172 e!398668)))

(declare-fun res!471983 () Bool)

(assert (=> d!96831 (=> (not res!471983) (not e!398668))))

(assert (=> d!96831 (= res!471983 ((_ is Cons!13265) (t!19546 newAcc!49)))))

(assert (=> d!96831 (= (contains!3921 (t!19546 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000) lt!318172)))

(declare-fun b!708390 () Bool)

(declare-fun e!398667 () Bool)

(assert (=> b!708390 (= e!398668 e!398667)))

(declare-fun res!471984 () Bool)

(assert (=> b!708390 (=> res!471984 e!398667)))

(assert (=> b!708390 (= res!471984 (= (h!14313 (t!19546 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708391 () Bool)

(assert (=> b!708391 (= e!398667 (contains!3921 (t!19546 (t!19546 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96831 res!471983) b!708390))

(assert (= (and b!708390 (not res!471984)) b!708391))

(assert (=> d!96831 m!666281))

(declare-fun m!666301 () Bool)

(assert (=> d!96831 m!666301))

(declare-fun m!666303 () Bool)

(assert (=> b!708391 m!666303))

(assert (=> b!708256 d!96831))

(declare-fun d!96833 () Bool)

(declare-fun res!471985 () Bool)

(declare-fun e!398669 () Bool)

(assert (=> d!96833 (=> res!471985 e!398669)))

(assert (=> d!96833 (= res!471985 (= (select (arr!19321 a!3591) (bvadd from!2969 #b00000000000000000000000000000001)) k0!2824))))

(assert (=> d!96833 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)) e!398669)))

(declare-fun b!708392 () Bool)

(declare-fun e!398670 () Bool)

(assert (=> b!708392 (= e!398669 e!398670)))

(declare-fun res!471986 () Bool)

(assert (=> b!708392 (=> (not res!471986) (not e!398670))))

(assert (=> b!708392 (= res!471986 (bvslt (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!19707 a!3591)))))

(declare-fun b!708393 () Bool)

(assert (=> b!708393 (= e!398670 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!96833 (not res!471985)) b!708392))

(assert (= (and b!708392 res!471986) b!708393))

(declare-fun m!666305 () Bool)

(assert (=> d!96833 m!666305))

(declare-fun m!666307 () Bool)

(assert (=> b!708393 m!666307))

(assert (=> b!708230 d!96833))

(declare-fun d!96835 () Bool)

(declare-fun lt!318173 () Bool)

(assert (=> d!96835 (= lt!318173 (select (content!335 (t!19546 acc!652)) (h!14313 acc!652)))))

(declare-fun e!398672 () Bool)

(assert (=> d!96835 (= lt!318173 e!398672)))

(declare-fun res!471987 () Bool)

(assert (=> d!96835 (=> (not res!471987) (not e!398672))))

(assert (=> d!96835 (= res!471987 ((_ is Cons!13265) (t!19546 acc!652)))))

(assert (=> d!96835 (= (contains!3921 (t!19546 acc!652) (h!14313 acc!652)) lt!318173)))

(declare-fun b!708394 () Bool)

(declare-fun e!398671 () Bool)

(assert (=> b!708394 (= e!398672 e!398671)))

(declare-fun res!471988 () Bool)

(assert (=> b!708394 (=> res!471988 e!398671)))

(assert (=> b!708394 (= res!471988 (= (h!14313 (t!19546 acc!652)) (h!14313 acc!652)))))

(declare-fun b!708395 () Bool)

(assert (=> b!708395 (= e!398671 (contains!3921 (t!19546 (t!19546 acc!652)) (h!14313 acc!652)))))

(assert (= (and d!96835 res!471987) b!708394))

(assert (= (and b!708394 (not res!471988)) b!708395))

(assert (=> d!96835 m!666269))

(declare-fun m!666309 () Bool)

(assert (=> d!96835 m!666309))

(declare-fun m!666311 () Bool)

(assert (=> b!708395 m!666311))

(assert (=> b!708253 d!96835))

(declare-fun d!96837 () Bool)

(declare-fun res!471989 () Bool)

(declare-fun e!398673 () Bool)

(assert (=> d!96837 (=> res!471989 e!398673)))

(assert (=> d!96837 (= res!471989 ((_ is Nil!13266) (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))))))

(assert (=> d!96837 (= (noDuplicate!1195 (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))) e!398673)))

(declare-fun b!708396 () Bool)

(declare-fun e!398674 () Bool)

(assert (=> b!708396 (= e!398673 e!398674)))

(declare-fun res!471990 () Bool)

(assert (=> b!708396 (=> (not res!471990) (not e!398674))))

(assert (=> b!708396 (= res!471990 (not (contains!3921 (t!19546 (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))) (h!14313 (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969)))))))))

(declare-fun b!708397 () Bool)

(assert (=> b!708397 (= e!398674 (noDuplicate!1195 (t!19546 (t!19546 ($colon$colon!497 acc!652 (select (arr!19321 a!3591) from!2969))))))))

(assert (= (and d!96837 (not res!471989)) b!708396))

(assert (= (and b!708396 res!471990) b!708397))

(declare-fun m!666313 () Bool)

(assert (=> b!708396 m!666313))

(declare-fun m!666315 () Bool)

(assert (=> b!708397 m!666315))

(assert (=> b!708262 d!96837))

(assert (=> d!96767 d!96821))

(declare-fun d!96839 () Bool)

(declare-fun lt!318176 () Int)

(assert (=> d!96839 (>= lt!318176 0)))

(declare-fun e!398677 () Int)

(assert (=> d!96839 (= lt!318176 e!398677)))

(declare-fun c!78574 () Bool)

(assert (=> d!96839 (= c!78574 ((_ is Nil!13266) lt!318145))))

(assert (=> d!96839 (= (size!19710 lt!318145) lt!318176)))

(declare-fun b!708402 () Bool)

(assert (=> b!708402 (= e!398677 0)))

(declare-fun b!708403 () Bool)

(assert (=> b!708403 (= e!398677 (+ 1 (size!19710 (t!19546 lt!318145))))))

(assert (= (and d!96839 c!78574) b!708402))

(assert (= (and d!96839 (not c!78574)) b!708403))

(declare-fun m!666317 () Bool)

(assert (=> b!708403 m!666317))

(assert (=> d!96709 d!96839))

(declare-fun d!96841 () Bool)

(declare-fun lt!318177 () Int)

(assert (=> d!96841 (>= lt!318177 0)))

(declare-fun e!398678 () Int)

(assert (=> d!96841 (= lt!318177 e!398678)))

(declare-fun c!78575 () Bool)

(assert (=> d!96841 (= c!78575 ((_ is Nil!13266) newAcc!49))))

(assert (=> d!96841 (= (size!19710 newAcc!49) lt!318177)))

(declare-fun b!708404 () Bool)

(assert (=> b!708404 (= e!398678 0)))

(declare-fun b!708405 () Bool)

(assert (=> b!708405 (= e!398678 (+ 1 (size!19710 (t!19546 newAcc!49))))))

(assert (= (and d!96841 c!78575) b!708404))

(assert (= (and d!96841 (not c!78575)) b!708405))

(declare-fun m!666319 () Bool)

(assert (=> b!708405 m!666319))

(assert (=> d!96709 d!96841))

(declare-fun lt!318178 () Bool)

(declare-fun d!96843 () Bool)

(assert (=> d!96843 (= lt!318178 (select (content!335 acc!652) (select (arr!19321 a!3591) from!2969)))))

(declare-fun e!398680 () Bool)

(assert (=> d!96843 (= lt!318178 e!398680)))

(declare-fun res!471991 () Bool)

(assert (=> d!96843 (=> (not res!471991) (not e!398680))))

(assert (=> d!96843 (= res!471991 ((_ is Cons!13265) acc!652))))

(assert (=> d!96843 (= (contains!3921 acc!652 (select (arr!19321 a!3591) from!2969)) lt!318178)))

(declare-fun b!708406 () Bool)

(declare-fun e!398679 () Bool)

(assert (=> b!708406 (= e!398680 e!398679)))

(declare-fun res!471992 () Bool)

(assert (=> b!708406 (=> res!471992 e!398679)))

(assert (=> b!708406 (= res!471992 (= (h!14313 acc!652) (select (arr!19321 a!3591) from!2969)))))

(declare-fun b!708407 () Bool)

(assert (=> b!708407 (= e!398679 (contains!3921 (t!19546 acc!652) (select (arr!19321 a!3591) from!2969)))))

(assert (= (and d!96843 res!471991) b!708406))

(assert (= (and b!708406 (not res!471992)) b!708407))

(assert (=> d!96843 m!666121))

(assert (=> d!96843 m!665957))

(declare-fun m!666321 () Bool)

(assert (=> d!96843 m!666321))

(assert (=> b!708407 m!665957))

(declare-fun m!666323 () Bool)

(assert (=> b!708407 m!666323))

(assert (=> b!708154 d!96843))

(declare-fun d!96845 () Bool)

(declare-fun lt!318179 () Bool)

(assert (=> d!96845 (= lt!318179 (select (content!335 (t!19546 acc!652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398682 () Bool)

(assert (=> d!96845 (= lt!318179 e!398682)))

(declare-fun res!471993 () Bool)

(assert (=> d!96845 (=> (not res!471993) (not e!398682))))

(assert (=> d!96845 (= res!471993 ((_ is Cons!13265) (t!19546 acc!652)))))

(assert (=> d!96845 (= (contains!3921 (t!19546 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000) lt!318179)))

(declare-fun b!708408 () Bool)

(declare-fun e!398681 () Bool)

(assert (=> b!708408 (= e!398682 e!398681)))

(declare-fun res!471994 () Bool)

(assert (=> b!708408 (=> res!471994 e!398681)))

(assert (=> b!708408 (= res!471994 (= (h!14313 (t!19546 acc!652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708409 () Bool)

(assert (=> b!708409 (= e!398681 (contains!3921 (t!19546 (t!19546 acc!652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96845 res!471993) b!708408))

(assert (= (and b!708408 (not res!471994)) b!708409))

(assert (=> d!96845 m!666269))

(declare-fun m!666325 () Bool)

(assert (=> d!96845 m!666325))

(declare-fun m!666327 () Bool)

(assert (=> b!708409 m!666327))

(assert (=> b!708238 d!96845))

(declare-fun d!96847 () Bool)

(declare-fun lt!318180 () Bool)

(assert (=> d!96847 (= lt!318180 (select (content!335 (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))) (h!14313 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))))))

(declare-fun e!398684 () Bool)

(assert (=> d!96847 (= lt!318180 e!398684)))

(declare-fun res!471995 () Bool)

(assert (=> d!96847 (=> (not res!471995) (not e!398684))))

(assert (=> d!96847 (= res!471995 ((_ is Cons!13265) (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))))))

(assert (=> d!96847 (= (contains!3921 (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969))) (h!14313 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))) lt!318180)))

(declare-fun b!708410 () Bool)

(declare-fun e!398683 () Bool)

(assert (=> b!708410 (= e!398684 e!398683)))

(declare-fun res!471996 () Bool)

(assert (=> b!708410 (=> res!471996 e!398683)))

(assert (=> b!708410 (= res!471996 (= (h!14313 (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))) (h!14313 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))))))

(declare-fun b!708411 () Bool)

(assert (=> b!708411 (= e!398683 (contains!3921 (t!19546 (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))) (h!14313 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))))))

(assert (= (and d!96847 res!471995) b!708410))

(assert (= (and b!708410 (not res!471996)) b!708411))

(declare-fun m!666329 () Bool)

(assert (=> d!96847 m!666329))

(declare-fun m!666331 () Bool)

(assert (=> d!96847 m!666331))

(declare-fun m!666333 () Bool)

(assert (=> b!708411 m!666333))

(assert (=> b!708281 d!96847))

(declare-fun d!96849 () Bool)

(declare-fun res!471997 () Bool)

(declare-fun e!398685 () Bool)

(assert (=> d!96849 (=> res!471997 e!398685)))

(assert (=> d!96849 (= res!471997 ((_ is Nil!13266) (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))))))

(assert (=> d!96849 (= (noDuplicate!1195 (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))) e!398685)))

(declare-fun b!708412 () Bool)

(declare-fun e!398686 () Bool)

(assert (=> b!708412 (= e!398685 e!398686)))

(declare-fun res!471998 () Bool)

(assert (=> b!708412 (=> (not res!471998) (not e!398686))))

(assert (=> b!708412 (= res!471998 (not (contains!3921 (t!19546 (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))) (h!14313 (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969)))))))))

(declare-fun b!708413 () Bool)

(assert (=> b!708413 (= e!398686 (noDuplicate!1195 (t!19546 (t!19546 ($colon$colon!497 newAcc!49 (select (arr!19321 a!3591) from!2969))))))))

(assert (= (and d!96849 (not res!471997)) b!708412))

(assert (= (and b!708412 res!471998) b!708413))

(declare-fun m!666335 () Bool)

(assert (=> b!708412 m!666335))

(declare-fun m!666337 () Bool)

(assert (=> b!708413 m!666337))

(assert (=> b!708282 d!96849))

(declare-fun d!96851 () Bool)

(declare-fun lt!318181 () Bool)

(assert (=> d!96851 (= lt!318181 (select (content!335 (t!19546 acc!652)) k0!2824))))

(declare-fun e!398688 () Bool)

(assert (=> d!96851 (= lt!318181 e!398688)))

(declare-fun res!471999 () Bool)

(assert (=> d!96851 (=> (not res!471999) (not e!398688))))

(assert (=> d!96851 (= res!471999 ((_ is Cons!13265) (t!19546 acc!652)))))

(assert (=> d!96851 (= (contains!3921 (t!19546 acc!652) k0!2824) lt!318181)))

(declare-fun b!708414 () Bool)

(declare-fun e!398687 () Bool)

(assert (=> b!708414 (= e!398688 e!398687)))

(declare-fun res!472000 () Bool)

(assert (=> b!708414 (=> res!472000 e!398687)))

(assert (=> b!708414 (= res!472000 (= (h!14313 (t!19546 acc!652)) k0!2824))))

(declare-fun b!708415 () Bool)

(assert (=> b!708415 (= e!398687 (contains!3921 (t!19546 (t!19546 acc!652)) k0!2824))))

(assert (= (and d!96851 res!471999) b!708414))

(assert (= (and b!708414 (not res!472000)) b!708415))

(assert (=> d!96851 m!666269))

(declare-fun m!666339 () Bool)

(assert (=> d!96851 m!666339))

(declare-fun m!666341 () Bool)

(assert (=> b!708415 m!666341))

(assert (=> b!708216 d!96851))

(declare-fun b!708417 () Bool)

(declare-fun e!398691 () Bool)

(declare-fun e!398692 () Bool)

(assert (=> b!708417 (= e!398691 e!398692)))

(declare-fun res!472002 () Bool)

(assert (=> b!708417 (=> res!472002 e!398692)))

(declare-fun e!398690 () Bool)

(assert (=> b!708417 (= res!472002 e!398690)))

(declare-fun res!472001 () Bool)

(assert (=> b!708417 (=> (not res!472001) (not e!398690))))

(assert (=> b!708417 (= res!472001 (= (h!14313 acc!652) (h!14313 (t!19546 newAcc!49))))))

(declare-fun d!96853 () Bool)

(declare-fun res!472003 () Bool)

(declare-fun e!398689 () Bool)

(assert (=> d!96853 (=> res!472003 e!398689)))

(assert (=> d!96853 (= res!472003 ((_ is Nil!13266) acc!652))))

(assert (=> d!96853 (= (subseq!389 acc!652 (t!19546 newAcc!49)) e!398689)))

(declare-fun b!708418 () Bool)

(assert (=> b!708418 (= e!398690 (subseq!389 (t!19546 acc!652) (t!19546 (t!19546 newAcc!49))))))

(declare-fun b!708416 () Bool)

(assert (=> b!708416 (= e!398689 e!398691)))

(declare-fun res!472004 () Bool)

(assert (=> b!708416 (=> (not res!472004) (not e!398691))))

(assert (=> b!708416 (= res!472004 ((_ is Cons!13265) (t!19546 newAcc!49)))))

(declare-fun b!708419 () Bool)

(assert (=> b!708419 (= e!398692 (subseq!389 acc!652 (t!19546 (t!19546 newAcc!49))))))

(assert (= (and d!96853 (not res!472003)) b!708416))

(assert (= (and b!708416 res!472004) b!708417))

(assert (= (and b!708417 res!472001) b!708418))

(assert (= (and b!708417 (not res!472002)) b!708419))

(assert (=> b!708418 m!666285))

(declare-fun m!666343 () Bool)

(assert (=> b!708419 m!666343))

(assert (=> b!708315 d!96853))

(assert (=> d!96757 d!96821))

(declare-fun b!708420 () Bool)

(declare-fun e!398695 () Bool)

(declare-fun call!34399 () Bool)

(assert (=> b!708420 (= e!398695 call!34399)))

(declare-fun b!708421 () Bool)

(assert (=> b!708421 (= e!398695 call!34399)))

(declare-fun d!96855 () Bool)

(declare-fun res!472005 () Bool)

(declare-fun e!398694 () Bool)

(assert (=> d!96855 (=> res!472005 e!398694)))

(assert (=> d!96855 (= res!472005 (bvsge (bvadd from!2969 #b00000000000000000000000000000001) (size!19707 a!3591)))))

(assert (=> d!96855 (= (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78542 (Cons!13265 (select (arr!19321 a!3591) from!2969) acc!652) acc!652)) e!398694)))

(declare-fun b!708422 () Bool)

(declare-fun e!398696 () Bool)

(assert (=> b!708422 (= e!398696 e!398695)))

(declare-fun c!78576 () Bool)

(assert (=> b!708422 (= c!78576 (validKeyInArray!0 (select (arr!19321 a!3591) (bvadd from!2969 #b00000000000000000000000000000001))))))

(declare-fun bm!34396 () Bool)

(assert (=> bm!34396 (= call!34399 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!78576 (Cons!13265 (select (arr!19321 a!3591) (bvadd from!2969 #b00000000000000000000000000000001)) (ite c!78542 (Cons!13265 (select (arr!19321 a!3591) from!2969) acc!652) acc!652)) (ite c!78542 (Cons!13265 (select (arr!19321 a!3591) from!2969) acc!652) acc!652))))))

(declare-fun b!708423 () Bool)

(assert (=> b!708423 (= e!398694 e!398696)))

(declare-fun res!472006 () Bool)

(assert (=> b!708423 (=> (not res!472006) (not e!398696))))

(declare-fun e!398693 () Bool)

(assert (=> b!708423 (= res!472006 (not e!398693))))

(declare-fun res!472007 () Bool)

(assert (=> b!708423 (=> (not res!472007) (not e!398693))))

(assert (=> b!708423 (= res!472007 (validKeyInArray!0 (select (arr!19321 a!3591) (bvadd from!2969 #b00000000000000000000000000000001))))))

(declare-fun b!708424 () Bool)

(assert (=> b!708424 (= e!398693 (contains!3921 (ite c!78542 (Cons!13265 (select (arr!19321 a!3591) from!2969) acc!652) acc!652) (select (arr!19321 a!3591) (bvadd from!2969 #b00000000000000000000000000000001))))))

(assert (= (and d!96855 (not res!472005)) b!708423))

(assert (= (and b!708423 res!472007) b!708424))

(assert (= (and b!708423 res!472006) b!708422))

(assert (= (and b!708422 c!78576) b!708420))

(assert (= (and b!708422 (not c!78576)) b!708421))

(assert (= (or b!708420 b!708421) bm!34396))

(assert (=> b!708422 m!666305))

(assert (=> b!708422 m!666305))

(declare-fun m!666345 () Bool)

(assert (=> b!708422 m!666345))

(assert (=> bm!34396 m!666305))

(declare-fun m!666347 () Bool)

(assert (=> bm!34396 m!666347))

(assert (=> b!708423 m!666305))

(assert (=> b!708423 m!666305))

(assert (=> b!708423 m!666345))

(assert (=> b!708424 m!666305))

(assert (=> b!708424 m!666305))

(declare-fun m!666349 () Bool)

(assert (=> b!708424 m!666349))

(assert (=> bm!34380 d!96855))

(assert (=> b!708153 d!96723))

(declare-fun d!96857 () Bool)

(declare-fun res!472008 () Bool)

(declare-fun e!398697 () Bool)

(assert (=> d!96857 (=> res!472008 e!398697)))

(assert (=> d!96857 (= res!472008 ((_ is Nil!13266) (t!19546 newAcc!49)))))

(assert (=> d!96857 (= (noDuplicate!1195 (t!19546 newAcc!49)) e!398697)))

(declare-fun b!708425 () Bool)

(declare-fun e!398698 () Bool)

(assert (=> b!708425 (= e!398697 e!398698)))

(declare-fun res!472009 () Bool)

(assert (=> b!708425 (=> (not res!472009) (not e!398698))))

(assert (=> b!708425 (= res!472009 (not (contains!3921 (t!19546 (t!19546 newAcc!49)) (h!14313 (t!19546 newAcc!49)))))))

(declare-fun b!708426 () Bool)

(assert (=> b!708426 (= e!398698 (noDuplicate!1195 (t!19546 (t!19546 newAcc!49))))))

(assert (= (and d!96857 (not res!472008)) b!708425))

(assert (= (and b!708425 res!472009) b!708426))

(declare-fun m!666351 () Bool)

(assert (=> b!708425 m!666351))

(declare-fun m!666353 () Bool)

(assert (=> b!708426 m!666353))

(assert (=> b!708276 d!96857))

(assert (=> b!708152 d!96723))

(declare-fun d!96859 () Bool)

(declare-fun lt!318182 () Bool)

(assert (=> d!96859 (= lt!318182 (select (content!335 (t!19546 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398700 () Bool)

(assert (=> d!96859 (= lt!318182 e!398700)))

(declare-fun res!472010 () Bool)

(assert (=> d!96859 (=> (not res!472010) (not e!398700))))

(assert (=> d!96859 (= res!472010 ((_ is Cons!13265) (t!19546 acc!652)))))

(assert (=> d!96859 (= (contains!3921 (t!19546 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000) lt!318182)))

(declare-fun b!708427 () Bool)

(declare-fun e!398699 () Bool)

(assert (=> b!708427 (= e!398700 e!398699)))

(declare-fun res!472011 () Bool)

(assert (=> b!708427 (=> res!472011 e!398699)))

(assert (=> b!708427 (= res!472011 (= (h!14313 (t!19546 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708428 () Bool)

(assert (=> b!708428 (= e!398699 (contains!3921 (t!19546 (t!19546 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96859 res!472010) b!708427))

(assert (= (and b!708427 (not res!472011)) b!708428))

(assert (=> d!96859 m!666269))

(declare-fun m!666355 () Bool)

(assert (=> d!96859 m!666355))

(declare-fun m!666357 () Bool)

(assert (=> b!708428 m!666357))

(assert (=> b!708284 d!96859))

(declare-fun b!708429 () Bool)

(declare-fun e!398703 () List!13269)

(declare-fun call!34400 () List!13269)

(assert (=> b!708429 (= e!398703 call!34400)))

(declare-fun lt!318183 () List!13269)

(declare-fun e!398702 () Bool)

(declare-fun b!708430 () Bool)

(assert (=> b!708430 (= e!398702 (= (content!335 lt!318183) ((_ map and) (content!335 (t!19546 newAcc!49)) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!708431 () Bool)

(assert (=> b!708431 (= e!398703 (Cons!13265 (h!14313 (t!19546 newAcc!49)) call!34400))))

(declare-fun b!708432 () Bool)

(declare-fun e!398701 () List!13269)

(assert (=> b!708432 (= e!398701 Nil!13266)))

(declare-fun b!708433 () Bool)

(assert (=> b!708433 (= e!398701 e!398703)))

(declare-fun c!78578 () Bool)

(assert (=> b!708433 (= c!78578 (= k0!2824 (h!14313 (t!19546 newAcc!49))))))

(declare-fun bm!34397 () Bool)

(assert (=> bm!34397 (= call!34400 (-!353 (t!19546 (t!19546 newAcc!49)) k0!2824))))

(declare-fun d!96861 () Bool)

(assert (=> d!96861 e!398702))

(declare-fun res!472012 () Bool)

(assert (=> d!96861 (=> (not res!472012) (not e!398702))))

(assert (=> d!96861 (= res!472012 (<= (size!19710 lt!318183) (size!19710 (t!19546 newAcc!49))))))

(assert (=> d!96861 (= lt!318183 e!398701)))

(declare-fun c!78577 () Bool)

(assert (=> d!96861 (= c!78577 ((_ is Cons!13265) (t!19546 newAcc!49)))))

(assert (=> d!96861 (= (-!353 (t!19546 newAcc!49) k0!2824) lt!318183)))

(assert (= (and d!96861 c!78577) b!708433))

(assert (= (and d!96861 (not c!78577)) b!708432))

(assert (= (and b!708433 c!78578) b!708429))

(assert (= (and b!708433 (not c!78578)) b!708431))

(assert (= (or b!708429 b!708431) bm!34397))

(assert (= (and d!96861 res!472012) b!708430))

(declare-fun m!666359 () Bool)

(assert (=> b!708430 m!666359))

(assert (=> b!708430 m!666281))

(assert (=> b!708430 m!666105))

(declare-fun m!666361 () Bool)

(assert (=> bm!34397 m!666361))

(declare-fun m!666363 () Bool)

(assert (=> d!96861 m!666363))

(assert (=> d!96861 m!666319))

(assert (=> bm!34385 d!96861))

(declare-fun d!96863 () Bool)

(declare-fun lt!318184 () Bool)

(assert (=> d!96863 (= lt!318184 (select (content!335 (t!19546 newAcc!49)) (h!14313 newAcc!49)))))

(declare-fun e!398705 () Bool)

(assert (=> d!96863 (= lt!318184 e!398705)))

(declare-fun res!472013 () Bool)

(assert (=> d!96863 (=> (not res!472013) (not e!398705))))

(assert (=> d!96863 (= res!472013 ((_ is Cons!13265) (t!19546 newAcc!49)))))

(assert (=> d!96863 (= (contains!3921 (t!19546 newAcc!49) (h!14313 newAcc!49)) lt!318184)))

(declare-fun b!708434 () Bool)

(declare-fun e!398704 () Bool)

(assert (=> b!708434 (= e!398705 e!398704)))

(declare-fun res!472014 () Bool)

(assert (=> b!708434 (=> res!472014 e!398704)))

(assert (=> b!708434 (= res!472014 (= (h!14313 (t!19546 newAcc!49)) (h!14313 newAcc!49)))))

(declare-fun b!708435 () Bool)

(assert (=> b!708435 (= e!398704 (contains!3921 (t!19546 (t!19546 newAcc!49)) (h!14313 newAcc!49)))))

(assert (= (and d!96863 res!472013) b!708434))

(assert (= (and b!708434 (not res!472014)) b!708435))

(assert (=> d!96863 m!666281))

(declare-fun m!666365 () Bool)

(assert (=> d!96863 m!666365))

(declare-fun m!666367 () Bool)

(assert (=> b!708435 m!666367))

(assert (=> b!708275 d!96863))

(check-sat (not b!708374) (not b!708428) (not d!96831) (not d!96843) (not b!708422) (not b!708407) (not d!96835) (not b!708435) (not b!708430) (not b!708377) (not d!96851) (not d!96829) (not d!96845) (not b!708379) (not b!708382) (not b!708389) (not b!708373) (not b!708405) (not b!708391) (not b!708383) (not b!708419) (not b!708418) (not b!708425) (not b!708411) (not b!708397) (not b!708423) (not b!708413) (not b!708409) (not b!708375) (not bm!34396) (not b!708403) (not b!708393) (not b!708395) (not d!96863) (not b!708387) (not d!96859) (not b!708424) (not d!96825) (not b!708415) (not b!708412) (not d!96847) (not b!708385) (not b!708396) (not bm!34397) (not d!96827) (not d!96861) (not b!708426))
(check-sat)
