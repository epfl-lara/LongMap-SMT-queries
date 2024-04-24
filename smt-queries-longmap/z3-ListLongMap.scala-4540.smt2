; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63208 () Bool)

(assert start!63208)

(declare-fun b!711606 () Bool)

(declare-fun res!474808 () Bool)

(declare-fun e!400438 () Bool)

(assert (=> b!711606 (=> (not res!474808) (not e!400438))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!711606 (= res!474808 (validKeyInArray!0 k0!2824))))

(declare-fun b!711607 () Bool)

(declare-fun res!474817 () Bool)

(assert (=> b!711607 (=> (not res!474817) (not e!400438))))

(declare-datatypes ((List!13293 0))(
  ( (Nil!13290) (Cons!13289 (h!14337 (_ BitVec 64)) (t!19591 List!13293)) )
))
(declare-fun newAcc!49 () List!13293)

(declare-fun contains!3945 (List!13293 (_ BitVec 64)) Bool)

(assert (=> b!711607 (= res!474817 (not (contains!3945 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711608 () Bool)

(declare-fun res!474807 () Bool)

(declare-fun e!400440 () Bool)

(assert (=> b!711608 (=> (not res!474807) (not e!400440))))

(declare-fun lt!318560 () List!13293)

(assert (=> b!711608 (= res!474807 (contains!3945 lt!318560 k0!2824))))

(declare-fun b!711609 () Bool)

(declare-fun res!474809 () Bool)

(assert (=> b!711609 (=> (not res!474809) (not e!400438))))

(declare-fun acc!652 () List!13293)

(declare-fun noDuplicate!1219 (List!13293) Bool)

(assert (=> b!711609 (= res!474809 (noDuplicate!1219 acc!652))))

(declare-fun b!711610 () Bool)

(declare-fun res!474815 () Bool)

(assert (=> b!711610 (=> (not res!474815) (not e!400440))))

(assert (=> b!711610 (= res!474815 (noDuplicate!1219 lt!318560))))

(declare-fun b!711611 () Bool)

(declare-fun res!474803 () Bool)

(assert (=> b!711611 (=> (not res!474803) (not e!400438))))

(declare-fun subseq!413 (List!13293 List!13293) Bool)

(assert (=> b!711611 (= res!474803 (subseq!413 acc!652 newAcc!49))))

(declare-fun b!711612 () Bool)

(declare-fun res!474796 () Bool)

(assert (=> b!711612 (=> (not res!474796) (not e!400440))))

(declare-fun lt!318561 () List!13293)

(assert (=> b!711612 (= res!474796 (subseq!413 lt!318561 lt!318560))))

(declare-fun b!711613 () Bool)

(declare-fun res!474819 () Bool)

(assert (=> b!711613 (=> (not res!474819) (not e!400440))))

(assert (=> b!711613 (= res!474819 (not (contains!3945 lt!318561 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!474816 () Bool)

(assert (=> start!63208 (=> (not res!474816) (not e!400438))))

(declare-datatypes ((array!40407 0))(
  ( (array!40408 (arr!19345 (Array (_ BitVec 32) (_ BitVec 64))) (size!19749 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40407)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63208 (= res!474816 (and (bvslt (size!19749 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19749 a!3591))))))

(assert (=> start!63208 e!400438))

(assert (=> start!63208 true))

(declare-fun array_inv!15204 (array!40407) Bool)

(assert (=> start!63208 (array_inv!15204 a!3591)))

(declare-fun b!711614 () Bool)

(declare-fun res!474810 () Bool)

(assert (=> b!711614 (=> (not res!474810) (not e!400438))))

(declare-fun arrayContainsKey!0 (array!40407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!711614 (= res!474810 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!711615 () Bool)

(declare-fun res!474798 () Bool)

(assert (=> b!711615 (=> (not res!474798) (not e!400438))))

(assert (=> b!711615 (= res!474798 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19749 a!3591)))))

(declare-fun b!711616 () Bool)

(declare-fun -!377 (List!13293 (_ BitVec 64)) List!13293)

(assert (=> b!711616 (= e!400440 (not (= (-!377 lt!318560 k0!2824) lt!318561)))))

(declare-fun b!711617 () Bool)

(declare-fun res!474799 () Bool)

(assert (=> b!711617 (=> (not res!474799) (not e!400440))))

(assert (=> b!711617 (= res!474799 (not (contains!3945 lt!318561 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711618 () Bool)

(declare-fun res!474812 () Bool)

(assert (=> b!711618 (=> (not res!474812) (not e!400438))))

(assert (=> b!711618 (= res!474812 (not (contains!3945 acc!652 k0!2824)))))

(declare-fun b!711619 () Bool)

(declare-fun res!474820 () Bool)

(assert (=> b!711619 (=> (not res!474820) (not e!400438))))

(assert (=> b!711619 (= res!474820 (validKeyInArray!0 (select (arr!19345 a!3591) from!2969)))))

(declare-fun b!711620 () Bool)

(declare-fun res!474806 () Bool)

(assert (=> b!711620 (=> (not res!474806) (not e!400440))))

(assert (=> b!711620 (= res!474806 (noDuplicate!1219 lt!318561))))

(declare-fun b!711621 () Bool)

(declare-fun res!474801 () Bool)

(assert (=> b!711621 (=> (not res!474801) (not e!400438))))

(assert (=> b!711621 (= res!474801 (not (contains!3945 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711622 () Bool)

(declare-fun res!474797 () Bool)

(assert (=> b!711622 (=> (not res!474797) (not e!400438))))

(assert (=> b!711622 (= res!474797 (noDuplicate!1219 newAcc!49))))

(declare-fun b!711623 () Bool)

(declare-fun res!474805 () Bool)

(assert (=> b!711623 (=> (not res!474805) (not e!400438))))

(assert (=> b!711623 (= res!474805 (not (contains!3945 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711624 () Bool)

(declare-fun res!474804 () Bool)

(assert (=> b!711624 (=> (not res!474804) (not e!400438))))

(assert (=> b!711624 (= res!474804 (not (contains!3945 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711625 () Bool)

(assert (=> b!711625 (= e!400438 e!400440)))

(declare-fun res!474814 () Bool)

(assert (=> b!711625 (=> (not res!474814) (not e!400440))))

(assert (=> b!711625 (= res!474814 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!521 (List!13293 (_ BitVec 64)) List!13293)

(assert (=> b!711625 (= lt!318560 ($colon$colon!521 newAcc!49 (select (arr!19345 a!3591) from!2969)))))

(assert (=> b!711625 (= lt!318561 ($colon$colon!521 acc!652 (select (arr!19345 a!3591) from!2969)))))

(declare-fun b!711626 () Bool)

(declare-fun res!474818 () Bool)

(assert (=> b!711626 (=> (not res!474818) (not e!400438))))

(declare-fun arrayNoDuplicates!0 (array!40407 (_ BitVec 32) List!13293) Bool)

(assert (=> b!711626 (= res!474818 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!711627 () Bool)

(declare-fun res!474802 () Bool)

(assert (=> b!711627 (=> (not res!474802) (not e!400438))))

(assert (=> b!711627 (= res!474802 (= (-!377 newAcc!49 k0!2824) acc!652))))

(declare-fun b!711628 () Bool)

(declare-fun res!474795 () Bool)

(assert (=> b!711628 (=> (not res!474795) (not e!400440))))

(assert (=> b!711628 (= res!474795 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318561))))

(declare-fun b!711629 () Bool)

(declare-fun res!474813 () Bool)

(assert (=> b!711629 (=> (not res!474813) (not e!400440))))

(assert (=> b!711629 (= res!474813 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711630 () Bool)

(declare-fun res!474811 () Bool)

(assert (=> b!711630 (=> (not res!474811) (not e!400438))))

(assert (=> b!711630 (= res!474811 (contains!3945 newAcc!49 k0!2824))))

(declare-fun b!711631 () Bool)

(declare-fun res!474800 () Bool)

(assert (=> b!711631 (=> (not res!474800) (not e!400440))))

(assert (=> b!711631 (= res!474800 (not (contains!3945 lt!318561 k0!2824)))))

(assert (= (and start!63208 res!474816) b!711609))

(assert (= (and b!711609 res!474809) b!711622))

(assert (= (and b!711622 res!474797) b!711623))

(assert (= (and b!711623 res!474805) b!711621))

(assert (= (and b!711621 res!474801) b!711614))

(assert (= (and b!711614 res!474810) b!711618))

(assert (= (and b!711618 res!474812) b!711606))

(assert (= (and b!711606 res!474808) b!711626))

(assert (= (and b!711626 res!474818) b!711611))

(assert (= (and b!711611 res!474803) b!711630))

(assert (= (and b!711630 res!474811) b!711627))

(assert (= (and b!711627 res!474802) b!711624))

(assert (= (and b!711624 res!474804) b!711607))

(assert (= (and b!711607 res!474817) b!711615))

(assert (= (and b!711615 res!474798) b!711619))

(assert (= (and b!711619 res!474820) b!711625))

(assert (= (and b!711625 res!474814) b!711620))

(assert (= (and b!711620 res!474806) b!711610))

(assert (= (and b!711610 res!474815) b!711613))

(assert (= (and b!711613 res!474819) b!711617))

(assert (= (and b!711617 res!474799) b!711629))

(assert (= (and b!711629 res!474813) b!711631))

(assert (= (and b!711631 res!474800) b!711628))

(assert (= (and b!711628 res!474795) b!711612))

(assert (= (and b!711612 res!474796) b!711608))

(assert (= (and b!711608 res!474807) b!711616))

(declare-fun m!669135 () Bool)

(assert (=> b!711629 m!669135))

(declare-fun m!669137 () Bool)

(assert (=> b!711618 m!669137))

(declare-fun m!669139 () Bool)

(assert (=> b!711623 m!669139))

(declare-fun m!669141 () Bool)

(assert (=> b!711630 m!669141))

(declare-fun m!669143 () Bool)

(assert (=> b!711608 m!669143))

(declare-fun m!669145 () Bool)

(assert (=> b!711620 m!669145))

(declare-fun m!669147 () Bool)

(assert (=> b!711613 m!669147))

(declare-fun m!669149 () Bool)

(assert (=> b!711614 m!669149))

(declare-fun m!669151 () Bool)

(assert (=> b!711621 m!669151))

(declare-fun m!669153 () Bool)

(assert (=> b!711606 m!669153))

(declare-fun m!669155 () Bool)

(assert (=> b!711625 m!669155))

(assert (=> b!711625 m!669155))

(declare-fun m!669157 () Bool)

(assert (=> b!711625 m!669157))

(assert (=> b!711625 m!669155))

(declare-fun m!669159 () Bool)

(assert (=> b!711625 m!669159))

(declare-fun m!669161 () Bool)

(assert (=> b!711609 m!669161))

(declare-fun m!669163 () Bool)

(assert (=> b!711622 m!669163))

(declare-fun m!669165 () Bool)

(assert (=> b!711616 m!669165))

(declare-fun m!669167 () Bool)

(assert (=> b!711627 m!669167))

(declare-fun m!669169 () Bool)

(assert (=> b!711628 m!669169))

(declare-fun m!669171 () Bool)

(assert (=> b!711617 m!669171))

(assert (=> b!711619 m!669155))

(assert (=> b!711619 m!669155))

(declare-fun m!669173 () Bool)

(assert (=> b!711619 m!669173))

(declare-fun m!669175 () Bool)

(assert (=> start!63208 m!669175))

(declare-fun m!669177 () Bool)

(assert (=> b!711631 m!669177))

(declare-fun m!669179 () Bool)

(assert (=> b!711626 m!669179))

(declare-fun m!669181 () Bool)

(assert (=> b!711610 m!669181))

(declare-fun m!669183 () Bool)

(assert (=> b!711611 m!669183))

(declare-fun m!669185 () Bool)

(assert (=> b!711607 m!669185))

(declare-fun m!669187 () Bool)

(assert (=> b!711624 m!669187))

(declare-fun m!669189 () Bool)

(assert (=> b!711612 m!669189))

(check-sat (not b!711606) (not b!711624) (not b!711630) (not b!711620) (not b!711617) (not b!711622) (not b!711631) (not b!711608) (not b!711621) (not b!711609) (not b!711611) (not b!711607) (not b!711614) (not b!711619) (not start!63208) (not b!711610) (not b!711625) (not b!711623) (not b!711626) (not b!711613) (not b!711628) (not b!711629) (not b!711612) (not b!711618) (not b!711616) (not b!711627))
(check-sat)
(get-model)

(declare-fun d!97827 () Bool)

(declare-fun res!474981 () Bool)

(declare-fun e!400463 () Bool)

(assert (=> d!97827 (=> res!474981 e!400463)))

(assert (=> d!97827 (= res!474981 (= (select (arr!19345 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97827 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!400463)))

(declare-fun b!711792 () Bool)

(declare-fun e!400464 () Bool)

(assert (=> b!711792 (= e!400463 e!400464)))

(declare-fun res!474982 () Bool)

(assert (=> b!711792 (=> (not res!474982) (not e!400464))))

(assert (=> b!711792 (= res!474982 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19749 a!3591)))))

(declare-fun b!711793 () Bool)

(assert (=> b!711793 (= e!400464 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97827 (not res!474981)) b!711792))

(assert (= (and b!711792 res!474982) b!711793))

(declare-fun m!669303 () Bool)

(assert (=> d!97827 m!669303))

(declare-fun m!669305 () Bool)

(assert (=> b!711793 m!669305))

(assert (=> b!711629 d!97827))

(declare-fun b!711804 () Bool)

(declare-fun e!400474 () Bool)

(declare-fun e!400475 () Bool)

(assert (=> b!711804 (= e!400474 e!400475)))

(declare-fun c!78776 () Bool)

(assert (=> b!711804 (= c!78776 (validKeyInArray!0 (select (arr!19345 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun bm!34521 () Bool)

(declare-fun call!34524 () Bool)

(assert (=> bm!34521 (= call!34524 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78776 (Cons!13289 (select (arr!19345 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318561) lt!318561)))))

(declare-fun b!711805 () Bool)

(assert (=> b!711805 (= e!400475 call!34524)))

(declare-fun b!711806 () Bool)

(declare-fun e!400473 () Bool)

(assert (=> b!711806 (= e!400473 e!400474)))

(declare-fun res!474990 () Bool)

(assert (=> b!711806 (=> (not res!474990) (not e!400474))))

(declare-fun e!400476 () Bool)

(assert (=> b!711806 (= res!474990 (not e!400476))))

(declare-fun res!474991 () Bool)

(assert (=> b!711806 (=> (not res!474991) (not e!400476))))

(assert (=> b!711806 (= res!474991 (validKeyInArray!0 (select (arr!19345 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711807 () Bool)

(assert (=> b!711807 (= e!400476 (contains!3945 lt!318561 (select (arr!19345 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711808 () Bool)

(assert (=> b!711808 (= e!400475 call!34524)))

(declare-fun d!97829 () Bool)

(declare-fun res!474989 () Bool)

(assert (=> d!97829 (=> res!474989 e!400473)))

(assert (=> d!97829 (= res!474989 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19749 a!3591)))))

(assert (=> d!97829 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318561) e!400473)))

(assert (= (and d!97829 (not res!474989)) b!711806))

(assert (= (and b!711806 res!474991) b!711807))

(assert (= (and b!711806 res!474990) b!711804))

(assert (= (and b!711804 c!78776) b!711805))

(assert (= (and b!711804 (not c!78776)) b!711808))

(assert (= (or b!711805 b!711808) bm!34521))

(assert (=> b!711804 m!669303))

(assert (=> b!711804 m!669303))

(declare-fun m!669307 () Bool)

(assert (=> b!711804 m!669307))

(assert (=> bm!34521 m!669303))

(declare-fun m!669309 () Bool)

(assert (=> bm!34521 m!669309))

(assert (=> b!711806 m!669303))

(assert (=> b!711806 m!669303))

(assert (=> b!711806 m!669307))

(assert (=> b!711807 m!669303))

(assert (=> b!711807 m!669303))

(declare-fun m!669311 () Bool)

(assert (=> b!711807 m!669311))

(assert (=> b!711628 d!97829))

(declare-fun d!97831 () Bool)

(declare-fun lt!318576 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!356 (List!13293) (InoxSet (_ BitVec 64)))

(assert (=> d!97831 (= lt!318576 (select (content!356 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400481 () Bool)

(assert (=> d!97831 (= lt!318576 e!400481)))

(declare-fun res!474997 () Bool)

(assert (=> d!97831 (=> (not res!474997) (not e!400481))))

(get-info :version)

(assert (=> d!97831 (= res!474997 ((_ is Cons!13289) newAcc!49))))

(assert (=> d!97831 (= (contains!3945 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318576)))

(declare-fun b!711813 () Bool)

(declare-fun e!400482 () Bool)

(assert (=> b!711813 (= e!400481 e!400482)))

(declare-fun res!474996 () Bool)

(assert (=> b!711813 (=> res!474996 e!400482)))

(assert (=> b!711813 (= res!474996 (= (h!14337 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711814 () Bool)

(assert (=> b!711814 (= e!400482 (contains!3945 (t!19591 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97831 res!474997) b!711813))

(assert (= (and b!711813 (not res!474996)) b!711814))

(declare-fun m!669313 () Bool)

(assert (=> d!97831 m!669313))

(declare-fun m!669315 () Bool)

(assert (=> d!97831 m!669315))

(declare-fun m!669317 () Bool)

(assert (=> b!711814 m!669317))

(assert (=> b!711607 d!97831))

(declare-fun d!97833 () Bool)

(assert (=> d!97833 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711606 d!97833))

(declare-fun b!711841 () Bool)

(declare-fun e!400505 () List!13293)

(declare-fun e!400504 () List!13293)

(assert (=> b!711841 (= e!400505 e!400504)))

(declare-fun c!78786 () Bool)

(assert (=> b!711841 (= c!78786 (= k0!2824 (h!14337 newAcc!49)))))

(declare-fun b!711842 () Bool)

(declare-fun call!34529 () List!13293)

(assert (=> b!711842 (= e!400504 (Cons!13289 (h!14337 newAcc!49) call!34529))))

(declare-fun b!711843 () Bool)

(assert (=> b!711843 (= e!400504 call!34529)))

(declare-fun b!711844 () Bool)

(assert (=> b!711844 (= e!400505 Nil!13290)))

(declare-fun bm!34526 () Bool)

(assert (=> bm!34526 (= call!34529 (-!377 (t!19591 newAcc!49) k0!2824))))

(declare-fun d!97837 () Bool)

(declare-fun e!400503 () Bool)

(assert (=> d!97837 e!400503))

(declare-fun res!475008 () Bool)

(assert (=> d!97837 (=> (not res!475008) (not e!400503))))

(declare-fun lt!318584 () List!13293)

(declare-fun size!19752 (List!13293) Int)

(assert (=> d!97837 (= res!475008 (<= (size!19752 lt!318584) (size!19752 newAcc!49)))))

(assert (=> d!97837 (= lt!318584 e!400505)))

(declare-fun c!78785 () Bool)

(assert (=> d!97837 (= c!78785 ((_ is Cons!13289) newAcc!49))))

(assert (=> d!97837 (= (-!377 newAcc!49 k0!2824) lt!318584)))

(declare-fun b!711845 () Bool)

(assert (=> b!711845 (= e!400503 (= (content!356 lt!318584) ((_ map and) (content!356 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(assert (= (and d!97837 c!78785) b!711841))

(assert (= (and d!97837 (not c!78785)) b!711844))

(assert (= (and b!711841 c!78786) b!711843))

(assert (= (and b!711841 (not c!78786)) b!711842))

(assert (= (or b!711843 b!711842) bm!34526))

(assert (= (and d!97837 res!475008) b!711845))

(declare-fun m!669325 () Bool)

(assert (=> bm!34526 m!669325))

(declare-fun m!669327 () Bool)

(assert (=> d!97837 m!669327))

(declare-fun m!669329 () Bool)

(assert (=> d!97837 m!669329))

(declare-fun m!669331 () Bool)

(assert (=> b!711845 m!669331))

(assert (=> b!711845 m!669313))

(declare-fun m!669333 () Bool)

(assert (=> b!711845 m!669333))

(assert (=> b!711627 d!97837))

(declare-fun d!97847 () Bool)

(declare-fun res!475024 () Bool)

(declare-fun e!400523 () Bool)

(assert (=> d!97847 (=> res!475024 e!400523)))

(assert (=> d!97847 (= res!475024 ((_ is Nil!13290) lt!318560))))

(assert (=> d!97847 (= (noDuplicate!1219 lt!318560) e!400523)))

(declare-fun b!711865 () Bool)

(declare-fun e!400524 () Bool)

(assert (=> b!711865 (= e!400523 e!400524)))

(declare-fun res!475025 () Bool)

(assert (=> b!711865 (=> (not res!475025) (not e!400524))))

(assert (=> b!711865 (= res!475025 (not (contains!3945 (t!19591 lt!318560) (h!14337 lt!318560))))))

(declare-fun b!711866 () Bool)

(assert (=> b!711866 (= e!400524 (noDuplicate!1219 (t!19591 lt!318560)))))

(assert (= (and d!97847 (not res!475024)) b!711865))

(assert (= (and b!711865 res!475025) b!711866))

(declare-fun m!669349 () Bool)

(assert (=> b!711865 m!669349))

(declare-fun m!669351 () Bool)

(assert (=> b!711866 m!669351))

(assert (=> b!711610 d!97847))

(declare-fun d!97853 () Bool)

(assert (=> d!97853 (= (array_inv!15204 a!3591) (bvsge (size!19749 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63208 d!97853))

(declare-fun d!97859 () Bool)

(declare-fun lt!318587 () Bool)

(assert (=> d!97859 (= lt!318587 (select (content!356 lt!318561) k0!2824))))

(declare-fun e!400529 () Bool)

(assert (=> d!97859 (= lt!318587 e!400529)))

(declare-fun res!475031 () Bool)

(assert (=> d!97859 (=> (not res!475031) (not e!400529))))

(assert (=> d!97859 (= res!475031 ((_ is Cons!13289) lt!318561))))

(assert (=> d!97859 (= (contains!3945 lt!318561 k0!2824) lt!318587)))

(declare-fun b!711871 () Bool)

(declare-fun e!400530 () Bool)

(assert (=> b!711871 (= e!400529 e!400530)))

(declare-fun res!475030 () Bool)

(assert (=> b!711871 (=> res!475030 e!400530)))

(assert (=> b!711871 (= res!475030 (= (h!14337 lt!318561) k0!2824))))

(declare-fun b!711872 () Bool)

(assert (=> b!711872 (= e!400530 (contains!3945 (t!19591 lt!318561) k0!2824))))

(assert (= (and d!97859 res!475031) b!711871))

(assert (= (and b!711871 (not res!475030)) b!711872))

(declare-fun m!669363 () Bool)

(assert (=> d!97859 m!669363))

(declare-fun m!669365 () Bool)

(assert (=> d!97859 m!669365))

(declare-fun m!669367 () Bool)

(assert (=> b!711872 m!669367))

(assert (=> b!711631 d!97859))

(declare-fun d!97863 () Bool)

(declare-fun lt!318588 () Bool)

(assert (=> d!97863 (= lt!318588 (select (content!356 newAcc!49) k0!2824))))

(declare-fun e!400531 () Bool)

(assert (=> d!97863 (= lt!318588 e!400531)))

(declare-fun res!475033 () Bool)

(assert (=> d!97863 (=> (not res!475033) (not e!400531))))

(assert (=> d!97863 (= res!475033 ((_ is Cons!13289) newAcc!49))))

(assert (=> d!97863 (= (contains!3945 newAcc!49 k0!2824) lt!318588)))

(declare-fun b!711873 () Bool)

(declare-fun e!400532 () Bool)

(assert (=> b!711873 (= e!400531 e!400532)))

(declare-fun res!475032 () Bool)

(assert (=> b!711873 (=> res!475032 e!400532)))

(assert (=> b!711873 (= res!475032 (= (h!14337 newAcc!49) k0!2824))))

(declare-fun b!711874 () Bool)

(assert (=> b!711874 (= e!400532 (contains!3945 (t!19591 newAcc!49) k0!2824))))

(assert (= (and d!97863 res!475033) b!711873))

(assert (= (and b!711873 (not res!475032)) b!711874))

(assert (=> d!97863 m!669313))

(declare-fun m!669369 () Bool)

(assert (=> d!97863 m!669369))

(declare-fun m!669371 () Bool)

(assert (=> b!711874 m!669371))

(assert (=> b!711630 d!97863))

(declare-fun d!97865 () Bool)

(declare-fun res!475034 () Bool)

(declare-fun e!400533 () Bool)

(assert (=> d!97865 (=> res!475034 e!400533)))

(assert (=> d!97865 (= res!475034 ((_ is Nil!13290) acc!652))))

(assert (=> d!97865 (= (noDuplicate!1219 acc!652) e!400533)))

(declare-fun b!711875 () Bool)

(declare-fun e!400534 () Bool)

(assert (=> b!711875 (= e!400533 e!400534)))

(declare-fun res!475035 () Bool)

(assert (=> b!711875 (=> (not res!475035) (not e!400534))))

(assert (=> b!711875 (= res!475035 (not (contains!3945 (t!19591 acc!652) (h!14337 acc!652))))))

(declare-fun b!711876 () Bool)

(assert (=> b!711876 (= e!400534 (noDuplicate!1219 (t!19591 acc!652)))))

(assert (= (and d!97865 (not res!475034)) b!711875))

(assert (= (and b!711875 res!475035) b!711876))

(declare-fun m!669373 () Bool)

(assert (=> b!711875 m!669373))

(declare-fun m!669375 () Bool)

(assert (=> b!711876 m!669375))

(assert (=> b!711609 d!97865))

(declare-fun d!97867 () Bool)

(declare-fun lt!318589 () Bool)

(assert (=> d!97867 (= lt!318589 (select (content!356 lt!318560) k0!2824))))

(declare-fun e!400535 () Bool)

(assert (=> d!97867 (= lt!318589 e!400535)))

(declare-fun res!475037 () Bool)

(assert (=> d!97867 (=> (not res!475037) (not e!400535))))

(assert (=> d!97867 (= res!475037 ((_ is Cons!13289) lt!318560))))

(assert (=> d!97867 (= (contains!3945 lt!318560 k0!2824) lt!318589)))

(declare-fun b!711877 () Bool)

(declare-fun e!400536 () Bool)

(assert (=> b!711877 (= e!400535 e!400536)))

(declare-fun res!475036 () Bool)

(assert (=> b!711877 (=> res!475036 e!400536)))

(assert (=> b!711877 (= res!475036 (= (h!14337 lt!318560) k0!2824))))

(declare-fun b!711878 () Bool)

(assert (=> b!711878 (= e!400536 (contains!3945 (t!19591 lt!318560) k0!2824))))

(assert (= (and d!97867 res!475037) b!711877))

(assert (= (and b!711877 (not res!475036)) b!711878))

(declare-fun m!669377 () Bool)

(assert (=> d!97867 m!669377))

(declare-fun m!669379 () Bool)

(assert (=> d!97867 m!669379))

(declare-fun m!669381 () Bool)

(assert (=> b!711878 m!669381))

(assert (=> b!711608 d!97867))

(declare-fun d!97869 () Bool)

(declare-fun lt!318590 () Bool)

(assert (=> d!97869 (= lt!318590 (select (content!356 lt!318561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400537 () Bool)

(assert (=> d!97869 (= lt!318590 e!400537)))

(declare-fun res!475039 () Bool)

(assert (=> d!97869 (=> (not res!475039) (not e!400537))))

(assert (=> d!97869 (= res!475039 ((_ is Cons!13289) lt!318561))))

(assert (=> d!97869 (= (contains!3945 lt!318561 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318590)))

(declare-fun b!711879 () Bool)

(declare-fun e!400538 () Bool)

(assert (=> b!711879 (= e!400537 e!400538)))

(declare-fun res!475038 () Bool)

(assert (=> b!711879 (=> res!475038 e!400538)))

(assert (=> b!711879 (= res!475038 (= (h!14337 lt!318561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711880 () Bool)

(assert (=> b!711880 (= e!400538 (contains!3945 (t!19591 lt!318561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97869 res!475039) b!711879))

(assert (= (and b!711879 (not res!475038)) b!711880))

(assert (=> d!97869 m!669363))

(declare-fun m!669383 () Bool)

(assert (=> d!97869 m!669383))

(declare-fun m!669385 () Bool)

(assert (=> b!711880 m!669385))

(assert (=> b!711613 d!97869))

(declare-fun d!97871 () Bool)

(declare-fun res!475058 () Bool)

(declare-fun e!400563 () Bool)

(assert (=> d!97871 (=> res!475058 e!400563)))

(assert (=> d!97871 (= res!475058 ((_ is Nil!13290) lt!318561))))

(assert (=> d!97871 (= (subseq!413 lt!318561 lt!318560) e!400563)))

(declare-fun b!711912 () Bool)

(declare-fun e!400562 () Bool)

(assert (=> b!711912 (= e!400562 (subseq!413 lt!318561 (t!19591 lt!318560)))))

(declare-fun b!711909 () Bool)

(declare-fun e!400565 () Bool)

(assert (=> b!711909 (= e!400563 e!400565)))

(declare-fun res!475056 () Bool)

(assert (=> b!711909 (=> (not res!475056) (not e!400565))))

(assert (=> b!711909 (= res!475056 ((_ is Cons!13289) lt!318560))))

(declare-fun b!711911 () Bool)

(declare-fun e!400564 () Bool)

(assert (=> b!711911 (= e!400564 (subseq!413 (t!19591 lt!318561) (t!19591 lt!318560)))))

(declare-fun b!711910 () Bool)

(assert (=> b!711910 (= e!400565 e!400562)))

(declare-fun res!475059 () Bool)

(assert (=> b!711910 (=> res!475059 e!400562)))

(assert (=> b!711910 (= res!475059 e!400564)))

(declare-fun res!475057 () Bool)

(assert (=> b!711910 (=> (not res!475057) (not e!400564))))

(assert (=> b!711910 (= res!475057 (= (h!14337 lt!318561) (h!14337 lt!318560)))))

(assert (= (and d!97871 (not res!475058)) b!711909))

(assert (= (and b!711909 res!475056) b!711910))

(assert (= (and b!711910 res!475057) b!711911))

(assert (= (and b!711910 (not res!475059)) b!711912))

(declare-fun m!669387 () Bool)

(assert (=> b!711912 m!669387))

(declare-fun m!669389 () Bool)

(assert (=> b!711911 m!669389))

(assert (=> b!711612 d!97871))

(declare-fun d!97873 () Bool)

(declare-fun res!475063 () Bool)

(declare-fun e!400570 () Bool)

(assert (=> d!97873 (=> res!475063 e!400570)))

(assert (=> d!97873 (= res!475063 ((_ is Nil!13290) acc!652))))

(assert (=> d!97873 (= (subseq!413 acc!652 newAcc!49) e!400570)))

(declare-fun b!711921 () Bool)

(declare-fun e!400569 () Bool)

(assert (=> b!711921 (= e!400569 (subseq!413 acc!652 (t!19591 newAcc!49)))))

(declare-fun b!711918 () Bool)

(declare-fun e!400572 () Bool)

(assert (=> b!711918 (= e!400570 e!400572)))

(declare-fun res!475061 () Bool)

(assert (=> b!711918 (=> (not res!475061) (not e!400572))))

(assert (=> b!711918 (= res!475061 ((_ is Cons!13289) newAcc!49))))

(declare-fun b!711920 () Bool)

(declare-fun e!400571 () Bool)

(assert (=> b!711920 (= e!400571 (subseq!413 (t!19591 acc!652) (t!19591 newAcc!49)))))

(declare-fun b!711919 () Bool)

(assert (=> b!711919 (= e!400572 e!400569)))

(declare-fun res!475064 () Bool)

(assert (=> b!711919 (=> res!475064 e!400569)))

(assert (=> b!711919 (= res!475064 e!400571)))

(declare-fun res!475062 () Bool)

(assert (=> b!711919 (=> (not res!475062) (not e!400571))))

(assert (=> b!711919 (= res!475062 (= (h!14337 acc!652) (h!14337 newAcc!49)))))

(assert (= (and d!97873 (not res!475063)) b!711918))

(assert (= (and b!711918 res!475061) b!711919))

(assert (= (and b!711919 res!475062) b!711920))

(assert (= (and b!711919 (not res!475064)) b!711921))

(declare-fun m!669391 () Bool)

(assert (=> b!711921 m!669391))

(declare-fun m!669395 () Bool)

(assert (=> b!711920 m!669395))

(assert (=> b!711611 d!97873))

(declare-fun d!97875 () Bool)

(declare-fun res!475068 () Bool)

(declare-fun e!400577 () Bool)

(assert (=> d!97875 (=> res!475068 e!400577)))

(assert (=> d!97875 (= res!475068 (= (select (arr!19345 a!3591) from!2969) k0!2824))))

(assert (=> d!97875 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!400577)))

(declare-fun b!711927 () Bool)

(declare-fun e!400578 () Bool)

(assert (=> b!711927 (= e!400577 e!400578)))

(declare-fun res!475069 () Bool)

(assert (=> b!711927 (=> (not res!475069) (not e!400578))))

(assert (=> b!711927 (= res!475069 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19749 a!3591)))))

(declare-fun b!711928 () Bool)

(assert (=> b!711928 (= e!400578 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97875 (not res!475068)) b!711927))

(assert (= (and b!711927 res!475069) b!711928))

(assert (=> d!97875 m!669155))

(declare-fun m!669407 () Bool)

(assert (=> b!711928 m!669407))

(assert (=> b!711614 d!97875))

(declare-fun d!97879 () Bool)

(declare-fun lt!318595 () Bool)

(assert (=> d!97879 (= lt!318595 (select (content!356 acc!652) k0!2824))))

(declare-fun e!400582 () Bool)

(assert (=> d!97879 (= lt!318595 e!400582)))

(declare-fun res!475072 () Bool)

(assert (=> d!97879 (=> (not res!475072) (not e!400582))))

(assert (=> d!97879 (= res!475072 ((_ is Cons!13289) acc!652))))

(assert (=> d!97879 (= (contains!3945 acc!652 k0!2824) lt!318595)))

(declare-fun b!711934 () Bool)

(declare-fun e!400583 () Bool)

(assert (=> b!711934 (= e!400582 e!400583)))

(declare-fun res!475071 () Bool)

(assert (=> b!711934 (=> res!475071 e!400583)))

(assert (=> b!711934 (= res!475071 (= (h!14337 acc!652) k0!2824))))

(declare-fun b!711935 () Bool)

(assert (=> b!711935 (= e!400583 (contains!3945 (t!19591 acc!652) k0!2824))))

(assert (= (and d!97879 res!475072) b!711934))

(assert (= (and b!711934 (not res!475071)) b!711935))

(declare-fun m!669416 () Bool)

(assert (=> d!97879 m!669416))

(declare-fun m!669421 () Bool)

(assert (=> d!97879 m!669421))

(declare-fun m!669427 () Bool)

(assert (=> b!711935 m!669427))

(assert (=> b!711618 d!97879))

(declare-fun d!97883 () Bool)

(declare-fun lt!318596 () Bool)

(assert (=> d!97883 (= lt!318596 (select (content!356 lt!318561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400584 () Bool)

(assert (=> d!97883 (= lt!318596 e!400584)))

(declare-fun res!475074 () Bool)

(assert (=> d!97883 (=> (not res!475074) (not e!400584))))

(assert (=> d!97883 (= res!475074 ((_ is Cons!13289) lt!318561))))

(assert (=> d!97883 (= (contains!3945 lt!318561 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318596)))

(declare-fun b!711936 () Bool)

(declare-fun e!400585 () Bool)

(assert (=> b!711936 (= e!400584 e!400585)))

(declare-fun res!475073 () Bool)

(assert (=> b!711936 (=> res!475073 e!400585)))

(assert (=> b!711936 (= res!475073 (= (h!14337 lt!318561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711937 () Bool)

(assert (=> b!711937 (= e!400585 (contains!3945 (t!19591 lt!318561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97883 res!475074) b!711936))

(assert (= (and b!711936 (not res!475073)) b!711937))

(assert (=> d!97883 m!669363))

(declare-fun m!669429 () Bool)

(assert (=> d!97883 m!669429))

(declare-fun m!669431 () Bool)

(assert (=> b!711937 m!669431))

(assert (=> b!711617 d!97883))

(declare-fun b!711940 () Bool)

(declare-fun e!400590 () List!13293)

(declare-fun e!400589 () List!13293)

(assert (=> b!711940 (= e!400590 e!400589)))

(declare-fun c!78801 () Bool)

(assert (=> b!711940 (= c!78801 (= k0!2824 (h!14337 lt!318560)))))

(declare-fun b!711941 () Bool)

(declare-fun call!34538 () List!13293)

(assert (=> b!711941 (= e!400589 (Cons!13289 (h!14337 lt!318560) call!34538))))

(declare-fun b!711942 () Bool)

(assert (=> b!711942 (= e!400589 call!34538)))

(declare-fun b!711943 () Bool)

(assert (=> b!711943 (= e!400590 Nil!13290)))

(declare-fun bm!34535 () Bool)

(assert (=> bm!34535 (= call!34538 (-!377 (t!19591 lt!318560) k0!2824))))

(declare-fun d!97887 () Bool)

(declare-fun e!400588 () Bool)

(assert (=> d!97887 e!400588))

(declare-fun res!475077 () Bool)

(assert (=> d!97887 (=> (not res!475077) (not e!400588))))

(declare-fun lt!318597 () List!13293)

(assert (=> d!97887 (= res!475077 (<= (size!19752 lt!318597) (size!19752 lt!318560)))))

(assert (=> d!97887 (= lt!318597 e!400590)))

(declare-fun c!78800 () Bool)

(assert (=> d!97887 (= c!78800 ((_ is Cons!13289) lt!318560))))

(assert (=> d!97887 (= (-!377 lt!318560 k0!2824) lt!318597)))

(declare-fun b!711944 () Bool)

(assert (=> b!711944 (= e!400588 (= (content!356 lt!318597) ((_ map and) (content!356 lt!318560) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(assert (= (and d!97887 c!78800) b!711940))

(assert (= (and d!97887 (not c!78800)) b!711943))

(assert (= (and b!711940 c!78801) b!711942))

(assert (= (and b!711940 (not c!78801)) b!711941))

(assert (= (or b!711942 b!711941) bm!34535))

(assert (= (and d!97887 res!475077) b!711944))

(declare-fun m!669437 () Bool)

(assert (=> bm!34535 m!669437))

(declare-fun m!669439 () Bool)

(assert (=> d!97887 m!669439))

(declare-fun m!669441 () Bool)

(assert (=> d!97887 m!669441))

(declare-fun m!669443 () Bool)

(assert (=> b!711944 m!669443))

(assert (=> b!711944 m!669377))

(assert (=> b!711944 m!669333))

(assert (=> b!711616 d!97887))

(declare-fun d!97891 () Bool)

(declare-fun lt!318598 () Bool)

(assert (=> d!97891 (= lt!318598 (select (content!356 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400591 () Bool)

(assert (=> d!97891 (= lt!318598 e!400591)))

(declare-fun res!475079 () Bool)

(assert (=> d!97891 (=> (not res!475079) (not e!400591))))

(assert (=> d!97891 (= res!475079 ((_ is Cons!13289) acc!652))))

(assert (=> d!97891 (= (contains!3945 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318598)))

(declare-fun b!711945 () Bool)

(declare-fun e!400592 () Bool)

(assert (=> b!711945 (= e!400591 e!400592)))

(declare-fun res!475078 () Bool)

(assert (=> b!711945 (=> res!475078 e!400592)))

(assert (=> b!711945 (= res!475078 (= (h!14337 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711946 () Bool)

(assert (=> b!711946 (= e!400592 (contains!3945 (t!19591 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97891 res!475079) b!711945))

(assert (= (and b!711945 (not res!475078)) b!711946))

(assert (=> d!97891 m!669416))

(declare-fun m!669445 () Bool)

(assert (=> d!97891 m!669445))

(declare-fun m!669447 () Bool)

(assert (=> b!711946 m!669447))

(assert (=> b!711621 d!97891))

(declare-fun d!97893 () Bool)

(declare-fun res!475084 () Bool)

(declare-fun e!400597 () Bool)

(assert (=> d!97893 (=> res!475084 e!400597)))

(assert (=> d!97893 (= res!475084 ((_ is Nil!13290) lt!318561))))

(assert (=> d!97893 (= (noDuplicate!1219 lt!318561) e!400597)))

(declare-fun b!711951 () Bool)

(declare-fun e!400598 () Bool)

(assert (=> b!711951 (= e!400597 e!400598)))

(declare-fun res!475085 () Bool)

(assert (=> b!711951 (=> (not res!475085) (not e!400598))))

(assert (=> b!711951 (= res!475085 (not (contains!3945 (t!19591 lt!318561) (h!14337 lt!318561))))))

(declare-fun b!711952 () Bool)

(assert (=> b!711952 (= e!400598 (noDuplicate!1219 (t!19591 lt!318561)))))

(assert (= (and d!97893 (not res!475084)) b!711951))

(assert (= (and b!711951 res!475085) b!711952))

(declare-fun m!669449 () Bool)

(assert (=> b!711951 m!669449))

(declare-fun m!669451 () Bool)

(assert (=> b!711952 m!669451))

(assert (=> b!711620 d!97893))

(declare-fun d!97895 () Bool)

(assert (=> d!97895 (= (validKeyInArray!0 (select (arr!19345 a!3591) from!2969)) (and (not (= (select (arr!19345 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19345 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711619 d!97895))

(declare-fun d!97897 () Bool)

(declare-fun lt!318599 () Bool)

(assert (=> d!97897 (= lt!318599 (select (content!356 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400599 () Bool)

(assert (=> d!97897 (= lt!318599 e!400599)))

(declare-fun res!475087 () Bool)

(assert (=> d!97897 (=> (not res!475087) (not e!400599))))

(assert (=> d!97897 (= res!475087 ((_ is Cons!13289) acc!652))))

(assert (=> d!97897 (= (contains!3945 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318599)))

(declare-fun b!711953 () Bool)

(declare-fun e!400600 () Bool)

(assert (=> b!711953 (= e!400599 e!400600)))

(declare-fun res!475086 () Bool)

(assert (=> b!711953 (=> res!475086 e!400600)))

(assert (=> b!711953 (= res!475086 (= (h!14337 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711954 () Bool)

(assert (=> b!711954 (= e!400600 (contains!3945 (t!19591 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97897 res!475087) b!711953))

(assert (= (and b!711953 (not res!475086)) b!711954))

(assert (=> d!97897 m!669416))

(declare-fun m!669453 () Bool)

(assert (=> d!97897 m!669453))

(declare-fun m!669455 () Bool)

(assert (=> b!711954 m!669455))

(assert (=> b!711623 d!97897))

(declare-fun d!97899 () Bool)

(declare-fun res!475088 () Bool)

(declare-fun e!400601 () Bool)

(assert (=> d!97899 (=> res!475088 e!400601)))

(assert (=> d!97899 (= res!475088 ((_ is Nil!13290) newAcc!49))))

(assert (=> d!97899 (= (noDuplicate!1219 newAcc!49) e!400601)))

(declare-fun b!711955 () Bool)

(declare-fun e!400602 () Bool)

(assert (=> b!711955 (= e!400601 e!400602)))

(declare-fun res!475089 () Bool)

(assert (=> b!711955 (=> (not res!475089) (not e!400602))))

(assert (=> b!711955 (= res!475089 (not (contains!3945 (t!19591 newAcc!49) (h!14337 newAcc!49))))))

(declare-fun b!711956 () Bool)

(assert (=> b!711956 (= e!400602 (noDuplicate!1219 (t!19591 newAcc!49)))))

(assert (= (and d!97899 (not res!475088)) b!711955))

(assert (= (and b!711955 res!475089) b!711956))

(declare-fun m!669457 () Bool)

(assert (=> b!711955 m!669457))

(declare-fun m!669459 () Bool)

(assert (=> b!711956 m!669459))

(assert (=> b!711622 d!97899))

(declare-fun b!711959 () Bool)

(declare-fun e!400606 () Bool)

(declare-fun e!400607 () Bool)

(assert (=> b!711959 (= e!400606 e!400607)))

(declare-fun c!78802 () Bool)

(assert (=> b!711959 (= c!78802 (validKeyInArray!0 (select (arr!19345 a!3591) from!2969)))))

(declare-fun bm!34536 () Bool)

(declare-fun call!34539 () Bool)

(assert (=> bm!34536 (= call!34539 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78802 (Cons!13289 (select (arr!19345 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!711960 () Bool)

(assert (=> b!711960 (= e!400607 call!34539)))

(declare-fun b!711961 () Bool)

(declare-fun e!400605 () Bool)

(assert (=> b!711961 (= e!400605 e!400606)))

(declare-fun res!475093 () Bool)

(assert (=> b!711961 (=> (not res!475093) (not e!400606))))

(declare-fun e!400608 () Bool)

(assert (=> b!711961 (= res!475093 (not e!400608))))

(declare-fun res!475094 () Bool)

(assert (=> b!711961 (=> (not res!475094) (not e!400608))))

(assert (=> b!711961 (= res!475094 (validKeyInArray!0 (select (arr!19345 a!3591) from!2969)))))

(declare-fun b!711962 () Bool)

(assert (=> b!711962 (= e!400608 (contains!3945 acc!652 (select (arr!19345 a!3591) from!2969)))))

(declare-fun b!711963 () Bool)

(assert (=> b!711963 (= e!400607 call!34539)))

(declare-fun d!97901 () Bool)

(declare-fun res!475092 () Bool)

(assert (=> d!97901 (=> res!475092 e!400605)))

(assert (=> d!97901 (= res!475092 (bvsge from!2969 (size!19749 a!3591)))))

(assert (=> d!97901 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400605)))

(assert (= (and d!97901 (not res!475092)) b!711961))

(assert (= (and b!711961 res!475094) b!711962))

(assert (= (and b!711961 res!475093) b!711959))

(assert (= (and b!711959 c!78802) b!711960))

(assert (= (and b!711959 (not c!78802)) b!711963))

(assert (= (or b!711960 b!711963) bm!34536))

(assert (=> b!711959 m!669155))

(assert (=> b!711959 m!669155))

(assert (=> b!711959 m!669173))

(assert (=> bm!34536 m!669155))

(declare-fun m!669463 () Bool)

(assert (=> bm!34536 m!669463))

(assert (=> b!711961 m!669155))

(assert (=> b!711961 m!669155))

(assert (=> b!711961 m!669173))

(assert (=> b!711962 m!669155))

(assert (=> b!711962 m!669155))

(declare-fun m!669469 () Bool)

(assert (=> b!711962 m!669469))

(assert (=> b!711626 d!97901))

(declare-fun d!97905 () Bool)

(assert (=> d!97905 (= ($colon$colon!521 newAcc!49 (select (arr!19345 a!3591) from!2969)) (Cons!13289 (select (arr!19345 a!3591) from!2969) newAcc!49))))

(assert (=> b!711625 d!97905))

(declare-fun d!97909 () Bool)

(assert (=> d!97909 (= ($colon$colon!521 acc!652 (select (arr!19345 a!3591) from!2969)) (Cons!13289 (select (arr!19345 a!3591) from!2969) acc!652))))

(assert (=> b!711625 d!97909))

(declare-fun d!97911 () Bool)

(declare-fun lt!318600 () Bool)

(assert (=> d!97911 (= lt!318600 (select (content!356 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400621 () Bool)

(assert (=> d!97911 (= lt!318600 e!400621)))

(declare-fun res!475105 () Bool)

(assert (=> d!97911 (=> (not res!475105) (not e!400621))))

(assert (=> d!97911 (= res!475105 ((_ is Cons!13289) newAcc!49))))

(assert (=> d!97911 (= (contains!3945 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318600)))

(declare-fun b!711979 () Bool)

(declare-fun e!400622 () Bool)

(assert (=> b!711979 (= e!400621 e!400622)))

(declare-fun res!475104 () Bool)

(assert (=> b!711979 (=> res!475104 e!400622)))

(assert (=> b!711979 (= res!475104 (= (h!14337 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711980 () Bool)

(assert (=> b!711980 (= e!400622 (contains!3945 (t!19591 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97911 res!475105) b!711979))

(assert (= (and b!711979 (not res!475104)) b!711980))

(assert (=> d!97911 m!669313))

(declare-fun m!669475 () Bool)

(assert (=> d!97911 m!669475))

(declare-fun m!669477 () Bool)

(assert (=> b!711980 m!669477))

(assert (=> b!711624 d!97911))

(check-sat (not b!711912) (not b!711946) (not bm!34536) (not b!711944) (not b!711880) (not d!97863) (not b!711875) (not d!97837) (not b!711876) (not d!97897) (not b!711804) (not b!711961) (not b!711874) (not d!97911) (not b!711793) (not b!711956) (not b!711951) (not b!711959) (not b!711845) (not b!711814) (not d!97879) (not b!711921) (not d!97867) (not b!711954) (not b!711928) (not d!97883) (not b!711866) (not b!711807) (not b!711937) (not d!97859) (not b!711872) (not b!711865) (not b!711920) (not d!97831) (not b!711955) (not b!711806) (not b!711911) (not bm!34526) (not d!97869) (not b!711980) (not bm!34535) (not bm!34521) (not d!97891) (not b!711962) (not b!711935) (not d!97887) (not b!711878) (not b!711952))
(check-sat)
