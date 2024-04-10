; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60434 () Bool)

(assert start!60434)

(declare-fun b!679167 () Bool)

(declare-fun res!445557 () Bool)

(declare-fun e!386948 () Bool)

(assert (=> b!679167 (=> (not res!445557) (not e!386948))))

(declare-datatypes ((List!12956 0))(
  ( (Nil!12953) (Cons!12952 (h!13997 (_ BitVec 64)) (t!19184 List!12956)) )
))
(declare-fun acc!681 () List!12956)

(declare-fun contains!3533 (List!12956 (_ BitVec 64)) Bool)

(assert (=> b!679167 (= res!445557 (not (contains!3533 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679168 () Bool)

(declare-fun res!445553 () Bool)

(assert (=> b!679168 (=> (not res!445553) (not e!386948))))

(declare-datatypes ((array!39448 0))(
  ( (array!39449 (arr!18915 (Array (_ BitVec 32) (_ BitVec 64))) (size!19279 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39448)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679168 (= res!445553 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679169 () Bool)

(declare-fun res!445562 () Bool)

(assert (=> b!679169 (=> (not res!445562) (not e!386948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679169 (= res!445562 (validKeyInArray!0 k!2843))))

(declare-fun b!679170 () Bool)

(declare-fun e!386950 () Bool)

(assert (=> b!679170 (= e!386950 (contains!3533 acc!681 k!2843))))

(declare-fun b!679171 () Bool)

(declare-fun e!386951 () Bool)

(assert (=> b!679171 (= e!386951 (not (contains!3533 acc!681 k!2843)))))

(declare-fun res!445561 () Bool)

(assert (=> start!60434 (=> (not res!445561) (not e!386948))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60434 (= res!445561 (and (bvslt (size!19279 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19279 a!3626))))))

(assert (=> start!60434 e!386948))

(assert (=> start!60434 true))

(declare-fun array_inv!14711 (array!39448) Bool)

(assert (=> start!60434 (array_inv!14711 a!3626)))

(declare-fun b!679172 () Bool)

(declare-fun res!445551 () Bool)

(assert (=> b!679172 (=> (not res!445551) (not e!386948))))

(assert (=> b!679172 (= res!445551 (not (contains!3533 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679173 () Bool)

(declare-fun res!445565 () Bool)

(assert (=> b!679173 (=> (not res!445565) (not e!386948))))

(declare-fun arrayNoDuplicates!0 (array!39448 (_ BitVec 32) List!12956) Bool)

(assert (=> b!679173 (= res!445565 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679174 () Bool)

(declare-fun e!386952 () Bool)

(assert (=> b!679174 (= e!386952 e!386951)))

(declare-fun res!445558 () Bool)

(assert (=> b!679174 (=> (not res!445558) (not e!386951))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679174 (= res!445558 (bvsle from!3004 i!1382))))

(declare-fun b!679175 () Bool)

(declare-fun res!445559 () Bool)

(assert (=> b!679175 (=> (not res!445559) (not e!386948))))

(assert (=> b!679175 (= res!445559 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19279 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679176 () Bool)

(declare-fun res!445560 () Bool)

(assert (=> b!679176 (=> (not res!445560) (not e!386948))))

(assert (=> b!679176 (= res!445560 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19279 a!3626))))))

(declare-fun b!679177 () Bool)

(declare-fun e!386949 () Bool)

(assert (=> b!679177 (= e!386949 (arrayContainsKey!0 a!3626 k!2843 from!3004))))

(declare-fun b!679178 () Bool)

(assert (=> b!679178 (= e!386948 (not e!386949))))

(declare-fun res!445555 () Bool)

(assert (=> b!679178 (=> res!445555 e!386949)))

(assert (=> b!679178 (= res!445555 (not (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (=> b!679178 (arrayContainsKey!0 (array!39449 (store (arr!18915 a!3626) i!1382 k!2843) (size!19279 a!3626)) k!2843 from!3004)))

(declare-fun b!679179 () Bool)

(declare-fun res!445563 () Bool)

(assert (=> b!679179 (=> (not res!445563) (not e!386948))))

(assert (=> b!679179 (= res!445563 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12953))))

(declare-fun b!679180 () Bool)

(declare-fun res!445552 () Bool)

(assert (=> b!679180 (=> (not res!445552) (not e!386948))))

(assert (=> b!679180 (= res!445552 e!386952)))

(declare-fun res!445554 () Bool)

(assert (=> b!679180 (=> res!445554 e!386952)))

(assert (=> b!679180 (= res!445554 e!386950)))

(declare-fun res!445564 () Bool)

(assert (=> b!679180 (=> (not res!445564) (not e!386950))))

(assert (=> b!679180 (= res!445564 (bvsgt from!3004 i!1382))))

(declare-fun b!679181 () Bool)

(declare-fun res!445556 () Bool)

(assert (=> b!679181 (=> (not res!445556) (not e!386948))))

(declare-fun noDuplicate!780 (List!12956) Bool)

(assert (=> b!679181 (= res!445556 (noDuplicate!780 acc!681))))

(assert (= (and start!60434 res!445561) b!679181))

(assert (= (and b!679181 res!445556) b!679172))

(assert (= (and b!679172 res!445551) b!679167))

(assert (= (and b!679167 res!445557) b!679180))

(assert (= (and b!679180 res!445564) b!679170))

(assert (= (and b!679180 (not res!445554)) b!679174))

(assert (= (and b!679174 res!445558) b!679171))

(assert (= (and b!679180 res!445552) b!679179))

(assert (= (and b!679179 res!445563) b!679173))

(assert (= (and b!679173 res!445565) b!679176))

(assert (= (and b!679176 res!445560) b!679169))

(assert (= (and b!679169 res!445562) b!679168))

(assert (= (and b!679168 res!445553) b!679175))

(assert (= (and b!679175 res!445559) b!679178))

(assert (= (and b!679178 (not res!445555)) b!679177))

(declare-fun m!644645 () Bool)

(assert (=> b!679179 m!644645))

(declare-fun m!644647 () Bool)

(assert (=> b!679181 m!644647))

(declare-fun m!644649 () Bool)

(assert (=> b!679168 m!644649))

(declare-fun m!644651 () Bool)

(assert (=> b!679177 m!644651))

(declare-fun m!644653 () Bool)

(assert (=> b!679167 m!644653))

(declare-fun m!644655 () Bool)

(assert (=> b!679170 m!644655))

(assert (=> b!679171 m!644655))

(declare-fun m!644657 () Bool)

(assert (=> b!679172 m!644657))

(declare-fun m!644659 () Bool)

(assert (=> start!60434 m!644659))

(declare-fun m!644661 () Bool)

(assert (=> b!679173 m!644661))

(declare-fun m!644663 () Bool)

(assert (=> b!679178 m!644663))

(declare-fun m!644665 () Bool)

(assert (=> b!679178 m!644665))

(declare-fun m!644667 () Bool)

(assert (=> b!679178 m!644667))

(declare-fun m!644669 () Bool)

(assert (=> b!679169 m!644669))

(push 1)

(assert (not b!679179))

(assert (not b!679169))

(assert (not b!679178))

(assert (not b!679171))

(assert (not b!679181))

(assert (not b!679167))

(assert (not b!679170))

(assert (not b!679177))

(assert (not b!679172))

(assert (not start!60434))

(assert (not b!679173))

(assert (not b!679168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93499 () Bool)

(declare-fun lt!312921 () Bool)

(declare-fun content!266 (List!12956) (Set (_ BitVec 64)))

(assert (=> d!93499 (= lt!312921 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!266 acc!681)))))

(declare-fun e!387051 () Bool)

(assert (=> d!93499 (= lt!312921 e!387051)))

(declare-fun res!445711 () Bool)

(assert (=> d!93499 (=> (not res!445711) (not e!387051))))

(assert (=> d!93499 (= res!445711 (is-Cons!12952 acc!681))))

(assert (=> d!93499 (= (contains!3533 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!312921)))

(declare-fun b!679341 () Bool)

(declare-fun e!387052 () Bool)

(assert (=> b!679341 (= e!387051 e!387052)))

(declare-fun res!445712 () Bool)

(assert (=> b!679341 (=> res!445712 e!387052)))

(assert (=> b!679341 (= res!445712 (= (h!13997 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!679342 () Bool)

(assert (=> b!679342 (= e!387052 (contains!3533 (t!19184 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93499 res!445711) b!679341))

(assert (= (and b!679341 (not res!445712)) b!679342))

(declare-fun m!644775 () Bool)

(assert (=> d!93499 m!644775))

(declare-fun m!644777 () Bool)

(assert (=> d!93499 m!644777))

(declare-fun m!644779 () Bool)

(assert (=> b!679342 m!644779))

(assert (=> b!679172 d!93499))

(declare-fun bm!33933 () Bool)

(declare-fun c!77184 () Bool)

(declare-fun call!33936 () Bool)

(assert (=> bm!33933 (= call!33936 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77184 (Cons!12952 (select (arr!18915 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!679377 () Bool)

(declare-fun e!387085 () Bool)

(declare-fun e!387088 () Bool)

(assert (=> b!679377 (= e!387085 e!387088)))

(declare-fun res!445744 () Bool)

(assert (=> b!679377 (=> (not res!445744) (not e!387088))))

(declare-fun e!387087 () Bool)

(assert (=> b!679377 (= res!445744 (not e!387087))))

(declare-fun res!445743 () Bool)

(assert (=> b!679377 (=> (not res!445743) (not e!387087))))

(assert (=> b!679377 (= res!445743 (validKeyInArray!0 (select (arr!18915 a!3626) from!3004)))))

(declare-fun b!679379 () Bool)

(declare-fun e!387086 () Bool)

(assert (=> b!679379 (= e!387086 call!33936)))

(declare-fun b!679381 () Bool)

(assert (=> b!679381 (= e!387087 (contains!3533 acc!681 (select (arr!18915 a!3626) from!3004)))))

(declare-fun b!679382 () Bool)

(assert (=> b!679382 (= e!387086 call!33936)))

(declare-fun b!679383 () Bool)

(assert (=> b!679383 (= e!387088 e!387086)))

(assert (=> b!679383 (= c!77184 (validKeyInArray!0 (select (arr!18915 a!3626) from!3004)))))

(declare-fun d!93513 () Bool)

(declare-fun res!445746 () Bool)

(assert (=> d!93513 (=> res!445746 e!387085)))

(assert (=> d!93513 (= res!445746 (bvsge from!3004 (size!19279 a!3626)))))

(assert (=> d!93513 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387085)))

(assert (= (and d!93513 (not res!445746)) b!679377))

(assert (= (and b!679377 res!445743) b!679381))

(assert (= (and b!679377 res!445744) b!679383))

(assert (= (and b!679383 c!77184) b!679379))

(assert (= (and b!679383 (not c!77184)) b!679382))

(assert (= (or b!679379 b!679382) bm!33933))

(declare-fun m!644815 () Bool)

(assert (=> bm!33933 m!644815))

(declare-fun m!644817 () Bool)

(assert (=> bm!33933 m!644817))

(assert (=> b!679377 m!644815))

(assert (=> b!679377 m!644815))

(declare-fun m!644819 () Bool)

(assert (=> b!679377 m!644819))

(assert (=> b!679381 m!644815))

(assert (=> b!679381 m!644815))

(declare-fun m!644821 () Bool)

(assert (=> b!679381 m!644821))

(assert (=> b!679383 m!644815))

(assert (=> b!679383 m!644815))

(assert (=> b!679383 m!644819))

(assert (=> b!679173 d!93513))

(declare-fun d!93537 () Bool)

(assert (=> d!93537 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!679169 d!93537))

(declare-fun d!93541 () Bool)

(assert (=> d!93541 (= (array_inv!14711 a!3626) (bvsge (size!19279 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60434 d!93541))

(declare-fun d!93543 () Bool)

(declare-fun lt!312924 () Bool)

(assert (=> d!93543 (= lt!312924 (set.member k!2843 (content!266 acc!681)))))

(declare-fun e!387095 () Bool)

(assert (=> d!93543 (= lt!312924 e!387095)))

(declare-fun res!445751 () Bool)

(assert (=> d!93543 (=> (not res!445751) (not e!387095))))

(assert (=> d!93543 (= res!445751 (is-Cons!12952 acc!681))))

(assert (=> d!93543 (= (contains!3533 acc!681 k!2843) lt!312924)))

(declare-fun b!679389 () Bool)

(declare-fun e!387096 () Bool)

(assert (=> b!679389 (= e!387095 e!387096)))

(declare-fun res!445752 () Bool)

(assert (=> b!679389 (=> res!445752 e!387096)))

(assert (=> b!679389 (= res!445752 (= (h!13997 acc!681) k!2843))))

(declare-fun b!679390 () Bool)

(assert (=> b!679390 (= e!387096 (contains!3533 (t!19184 acc!681) k!2843))))

(assert (= (and d!93543 res!445751) b!679389))

(assert (= (and b!679389 (not res!445752)) b!679390))

(assert (=> d!93543 m!644775))

(declare-fun m!644829 () Bool)

(assert (=> d!93543 m!644829))

(declare-fun m!644831 () Bool)

(assert (=> b!679390 m!644831))

(assert (=> b!679171 d!93543))

(declare-fun d!93545 () Bool)

(declare-fun res!445757 () Bool)

(declare-fun e!387101 () Bool)

(assert (=> d!93545 (=> res!445757 e!387101)))

(assert (=> d!93545 (= res!445757 (is-Nil!12953 acc!681))))

(assert (=> d!93545 (= (noDuplicate!780 acc!681) e!387101)))

(declare-fun b!679395 () Bool)

(declare-fun e!387102 () Bool)

(assert (=> b!679395 (= e!387101 e!387102)))

(declare-fun res!445758 () Bool)

(assert (=> b!679395 (=> (not res!445758) (not e!387102))))

(assert (=> b!679395 (= res!445758 (not (contains!3533 (t!19184 acc!681) (h!13997 acc!681))))))

(declare-fun b!679396 () Bool)

(assert (=> b!679396 (= e!387102 (noDuplicate!780 (t!19184 acc!681)))))

(assert (= (and d!93545 (not res!445757)) b!679395))

(assert (= (and b!679395 res!445758) b!679396))

(declare-fun m!644833 () Bool)

(assert (=> b!679395 m!644833))

(declare-fun m!644835 () Bool)

(assert (=> b!679396 m!644835))

(assert (=> b!679181 d!93545))

(assert (=> b!679170 d!93543))

(declare-fun d!93547 () Bool)

(declare-fun lt!312925 () Bool)

(assert (=> d!93547 (= lt!312925 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!266 acc!681)))))

(declare-fun e!387103 () Bool)

(assert (=> d!93547 (= lt!312925 e!387103)))

(declare-fun res!445759 () Bool)

(assert (=> d!93547 (=> (not res!445759) (not e!387103))))

(assert (=> d!93547 (= res!445759 (is-Cons!12952 acc!681))))

(assert (=> d!93547 (= (contains!3533 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!312925)))

(declare-fun b!679397 () Bool)

(declare-fun e!387104 () Bool)

(assert (=> b!679397 (= e!387103 e!387104)))

(declare-fun res!445760 () Bool)

(assert (=> b!679397 (=> res!445760 e!387104)))

(assert (=> b!679397 (= res!445760 (= (h!13997 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!679398 () Bool)

(assert (=> b!679398 (= e!387104 (contains!3533 (t!19184 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93547 res!445759) b!679397))

(assert (= (and b!679397 (not res!445760)) b!679398))

(assert (=> d!93547 m!644775))

(declare-fun m!644837 () Bool)

(assert (=> d!93547 m!644837))

(declare-fun m!644839 () Bool)

(assert (=> b!679398 m!644839))

(assert (=> b!679167 d!93547))

(declare-fun d!93549 () Bool)

(declare-fun res!445765 () Bool)

(declare-fun e!387109 () Bool)

(assert (=> d!93549 (=> res!445765 e!387109)))

(assert (=> d!93549 (= res!445765 (= (select (arr!18915 a!3626) from!3004) k!2843))))

(assert (=> d!93549 (= (arrayContainsKey!0 a!3626 k!2843 from!3004) e!387109)))

(declare-fun b!679403 () Bool)

(declare-fun e!387110 () Bool)

(assert (=> b!679403 (= e!387109 e!387110)))

(declare-fun res!445766 () Bool)

(assert (=> b!679403 (=> (not res!445766) (not e!387110))))

(assert (=> b!679403 (= res!445766 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19279 a!3626)))))

(declare-fun b!679404 () Bool)

(assert (=> b!679404 (= e!387110 (arrayContainsKey!0 a!3626 k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93549 (not res!445765)) b!679403))

(assert (= (and b!679403 res!445766) b!679404))

(assert (=> d!93549 m!644815))

(declare-fun m!644841 () Bool)

(assert (=> b!679404 m!644841))

(assert (=> b!679177 d!93549))

