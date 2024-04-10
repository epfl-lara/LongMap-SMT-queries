; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102206 () Bool)

(assert start!102206)

(declare-fun b!1230435 () Bool)

(declare-fun res!818929 () Bool)

(declare-fun e!698099 () Bool)

(assert (=> b!1230435 (=> (not res!818929) (not e!698099))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230435 (= res!818929 (validKeyInArray!0 k0!2913))))

(declare-datatypes ((array!79381 0))(
  ( (array!79382 (arr!38310 (Array (_ BitVec 32) (_ BitVec 64))) (size!38846 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79381)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27083 0))(
  ( (Nil!27080) (Cons!27079 (h!28288 (_ BitVec 64)) (t!40546 List!27083)) )
))
(declare-fun acc!823 () List!27083)

(declare-fun b!1230436 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79381 (_ BitVec 32) List!27083) Bool)

(assert (=> b!1230436 (= e!698099 (not (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27079 (select (arr!38310 a!3806) from!3184) acc!823))))))

(declare-fun b!1230437 () Bool)

(declare-fun res!818927 () Bool)

(assert (=> b!1230437 (=> (not res!818927) (not e!698099))))

(assert (=> b!1230437 (= res!818927 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230438 () Bool)

(declare-fun res!818923 () Bool)

(assert (=> b!1230438 (=> (not res!818923) (not e!698099))))

(declare-fun contains!7145 (List!27083 (_ BitVec 64)) Bool)

(assert (=> b!1230438 (= res!818923 (not (contains!7145 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!818922 () Bool)

(assert (=> start!102206 (=> (not res!818922) (not e!698099))))

(assert (=> start!102206 (= res!818922 (bvslt (size!38846 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102206 e!698099))

(declare-fun array_inv!29158 (array!79381) Bool)

(assert (=> start!102206 (array_inv!29158 a!3806)))

(assert (=> start!102206 true))

(declare-fun b!1230439 () Bool)

(declare-fun res!818925 () Bool)

(assert (=> b!1230439 (=> (not res!818925) (not e!698099))))

(assert (=> b!1230439 (= res!818925 (not (contains!7145 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230440 () Bool)

(declare-fun res!818926 () Bool)

(assert (=> b!1230440 (=> (not res!818926) (not e!698099))))

(assert (=> b!1230440 (= res!818926 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38846 a!3806)) (bvslt from!3184 (size!38846 a!3806))))))

(declare-fun b!1230441 () Bool)

(declare-fun res!818928 () Bool)

(assert (=> b!1230441 (=> (not res!818928) (not e!698099))))

(declare-fun noDuplicate!1742 (List!27083) Bool)

(assert (=> b!1230441 (= res!818928 (noDuplicate!1742 acc!823))))

(declare-fun b!1230442 () Bool)

(declare-fun res!818924 () Bool)

(assert (=> b!1230442 (=> (not res!818924) (not e!698099))))

(declare-fun arrayContainsKey!0 (array!79381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230442 (= res!818924 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230443 () Bool)

(declare-fun res!818921 () Bool)

(assert (=> b!1230443 (=> (not res!818921) (not e!698099))))

(assert (=> b!1230443 (= res!818921 (validKeyInArray!0 (select (arr!38310 a!3806) from!3184)))))

(assert (= (and start!102206 res!818922) b!1230435))

(assert (= (and b!1230435 res!818929) b!1230440))

(assert (= (and b!1230440 res!818926) b!1230441))

(assert (= (and b!1230441 res!818928) b!1230438))

(assert (= (and b!1230438 res!818923) b!1230439))

(assert (= (and b!1230439 res!818925) b!1230442))

(assert (= (and b!1230442 res!818924) b!1230437))

(assert (= (and b!1230437 res!818927) b!1230443))

(assert (= (and b!1230443 res!818921) b!1230436))

(declare-fun m!1134843 () Bool)

(assert (=> start!102206 m!1134843))

(declare-fun m!1134845 () Bool)

(assert (=> b!1230437 m!1134845))

(declare-fun m!1134847 () Bool)

(assert (=> b!1230435 m!1134847))

(declare-fun m!1134849 () Bool)

(assert (=> b!1230441 m!1134849))

(declare-fun m!1134851 () Bool)

(assert (=> b!1230436 m!1134851))

(declare-fun m!1134853 () Bool)

(assert (=> b!1230436 m!1134853))

(assert (=> b!1230443 m!1134851))

(assert (=> b!1230443 m!1134851))

(declare-fun m!1134855 () Bool)

(assert (=> b!1230443 m!1134855))

(declare-fun m!1134857 () Bool)

(assert (=> b!1230439 m!1134857))

(declare-fun m!1134859 () Bool)

(assert (=> b!1230438 m!1134859))

(declare-fun m!1134861 () Bool)

(assert (=> b!1230442 m!1134861))

(check-sat (not b!1230435) (not b!1230442) (not b!1230438) (not b!1230437) (not b!1230436) (not start!102206) (not b!1230439) (not b!1230443) (not b!1230441))
(check-sat)
(get-model)

(declare-fun d!134565 () Bool)

(declare-fun res!818961 () Bool)

(declare-fun e!698111 () Bool)

(assert (=> d!134565 (=> res!818961 e!698111)))

(get-info :version)

(assert (=> d!134565 (= res!818961 ((_ is Nil!27080) acc!823))))

(assert (=> d!134565 (= (noDuplicate!1742 acc!823) e!698111)))

(declare-fun b!1230475 () Bool)

(declare-fun e!698112 () Bool)

(assert (=> b!1230475 (= e!698111 e!698112)))

(declare-fun res!818962 () Bool)

(assert (=> b!1230475 (=> (not res!818962) (not e!698112))))

(assert (=> b!1230475 (= res!818962 (not (contains!7145 (t!40546 acc!823) (h!28288 acc!823))))))

(declare-fun b!1230476 () Bool)

(assert (=> b!1230476 (= e!698112 (noDuplicate!1742 (t!40546 acc!823)))))

(assert (= (and d!134565 (not res!818961)) b!1230475))

(assert (= (and b!1230475 res!818962) b!1230476))

(declare-fun m!1134883 () Bool)

(assert (=> b!1230475 m!1134883))

(declare-fun m!1134885 () Bool)

(assert (=> b!1230476 m!1134885))

(assert (=> b!1230441 d!134565))

(declare-fun d!134567 () Bool)

(declare-fun res!818970 () Bool)

(declare-fun e!698123 () Bool)

(assert (=> d!134567 (=> res!818970 e!698123)))

(assert (=> d!134567 (= res!818970 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38846 a!3806)))))

(assert (=> d!134567 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27079 (select (arr!38310 a!3806) from!3184) acc!823)) e!698123)))

(declare-fun b!1230487 () Bool)

(declare-fun e!698124 () Bool)

(declare-fun call!60856 () Bool)

(assert (=> b!1230487 (= e!698124 call!60856)))

(declare-fun bm!60853 () Bool)

(declare-fun c!120619 () Bool)

(assert (=> bm!60853 (= call!60856 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120619 (Cons!27079 (select (arr!38310 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27079 (select (arr!38310 a!3806) from!3184) acc!823)) (Cons!27079 (select (arr!38310 a!3806) from!3184) acc!823))))))

(declare-fun b!1230488 () Bool)

(declare-fun e!698121 () Bool)

(assert (=> b!1230488 (= e!698121 (contains!7145 (Cons!27079 (select (arr!38310 a!3806) from!3184) acc!823) (select (arr!38310 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1230489 () Bool)

(declare-fun e!698122 () Bool)

(assert (=> b!1230489 (= e!698123 e!698122)))

(declare-fun res!818971 () Bool)

(assert (=> b!1230489 (=> (not res!818971) (not e!698122))))

(assert (=> b!1230489 (= res!818971 (not e!698121))))

(declare-fun res!818969 () Bool)

(assert (=> b!1230489 (=> (not res!818969) (not e!698121))))

(assert (=> b!1230489 (= res!818969 (validKeyInArray!0 (select (arr!38310 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1230490 () Bool)

(assert (=> b!1230490 (= e!698124 call!60856)))

(declare-fun b!1230491 () Bool)

(assert (=> b!1230491 (= e!698122 e!698124)))

(assert (=> b!1230491 (= c!120619 (validKeyInArray!0 (select (arr!38310 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134567 (not res!818970)) b!1230489))

(assert (= (and b!1230489 res!818969) b!1230488))

(assert (= (and b!1230489 res!818971) b!1230491))

(assert (= (and b!1230491 c!120619) b!1230487))

(assert (= (and b!1230491 (not c!120619)) b!1230490))

(assert (= (or b!1230487 b!1230490) bm!60853))

(declare-fun m!1134887 () Bool)

(assert (=> bm!60853 m!1134887))

(declare-fun m!1134889 () Bool)

(assert (=> bm!60853 m!1134889))

(assert (=> b!1230488 m!1134887))

(assert (=> b!1230488 m!1134887))

(declare-fun m!1134891 () Bool)

(assert (=> b!1230488 m!1134891))

(assert (=> b!1230489 m!1134887))

(assert (=> b!1230489 m!1134887))

(declare-fun m!1134893 () Bool)

(assert (=> b!1230489 m!1134893))

(assert (=> b!1230491 m!1134887))

(assert (=> b!1230491 m!1134887))

(assert (=> b!1230491 m!1134893))

(assert (=> b!1230436 d!134567))

(declare-fun d!134573 () Bool)

(assert (=> d!134573 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1230435 d!134573))

(declare-fun d!134577 () Bool)

(declare-fun lt!559373 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!559 (List!27083) (InoxSet (_ BitVec 64)))

(assert (=> d!134577 (= lt!559373 (select (content!559 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698149 () Bool)

(assert (=> d!134577 (= lt!559373 e!698149)))

(declare-fun res!818995 () Bool)

(assert (=> d!134577 (=> (not res!818995) (not e!698149))))

(assert (=> d!134577 (= res!818995 ((_ is Cons!27079) acc!823))))

(assert (=> d!134577 (= (contains!7145 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559373)))

(declare-fun b!1230518 () Bool)

(declare-fun e!698150 () Bool)

(assert (=> b!1230518 (= e!698149 e!698150)))

(declare-fun res!818994 () Bool)

(assert (=> b!1230518 (=> res!818994 e!698150)))

(assert (=> b!1230518 (= res!818994 (= (h!28288 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230519 () Bool)

(assert (=> b!1230519 (= e!698150 (contains!7145 (t!40546 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134577 res!818995) b!1230518))

(assert (= (and b!1230518 (not res!818994)) b!1230519))

(declare-fun m!1134903 () Bool)

(assert (=> d!134577 m!1134903))

(declare-fun m!1134905 () Bool)

(assert (=> d!134577 m!1134905))

(declare-fun m!1134907 () Bool)

(assert (=> b!1230519 m!1134907))

(assert (=> b!1230439 d!134577))

(declare-fun d!134581 () Bool)

(assert (=> d!134581 (= (validKeyInArray!0 (select (arr!38310 a!3806) from!3184)) (and (not (= (select (arr!38310 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38310 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1230443 d!134581))

(declare-fun d!134583 () Bool)

(declare-fun lt!559374 () Bool)

(assert (=> d!134583 (= lt!559374 (select (content!559 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698157 () Bool)

(assert (=> d!134583 (= lt!559374 e!698157)))

(declare-fun res!819003 () Bool)

(assert (=> d!134583 (=> (not res!819003) (not e!698157))))

(assert (=> d!134583 (= res!819003 ((_ is Cons!27079) acc!823))))

(assert (=> d!134583 (= (contains!7145 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559374)))

(declare-fun b!1230528 () Bool)

(declare-fun e!698158 () Bool)

(assert (=> b!1230528 (= e!698157 e!698158)))

(declare-fun res!819002 () Bool)

(assert (=> b!1230528 (=> res!819002 e!698158)))

(assert (=> b!1230528 (= res!819002 (= (h!28288 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230529 () Bool)

(assert (=> b!1230529 (= e!698158 (contains!7145 (t!40546 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134583 res!819003) b!1230528))

(assert (= (and b!1230528 (not res!819002)) b!1230529))

(assert (=> d!134583 m!1134903))

(declare-fun m!1134909 () Bool)

(assert (=> d!134583 m!1134909))

(declare-fun m!1134911 () Bool)

(assert (=> b!1230529 m!1134911))

(assert (=> b!1230438 d!134583))

(declare-fun d!134585 () Bool)

(declare-fun res!819005 () Bool)

(declare-fun e!698163 () Bool)

(assert (=> d!134585 (=> res!819005 e!698163)))

(assert (=> d!134585 (= res!819005 (bvsge from!3184 (size!38846 a!3806)))))

(assert (=> d!134585 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698163)))

(declare-fun b!1230532 () Bool)

(declare-fun e!698164 () Bool)

(declare-fun call!60861 () Bool)

(assert (=> b!1230532 (= e!698164 call!60861)))

(declare-fun c!120624 () Bool)

(declare-fun bm!60858 () Bool)

(assert (=> bm!60858 (= call!60861 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120624 (Cons!27079 (select (arr!38310 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun e!698161 () Bool)

(declare-fun b!1230533 () Bool)

(assert (=> b!1230533 (= e!698161 (contains!7145 acc!823 (select (arr!38310 a!3806) from!3184)))))

(declare-fun b!1230534 () Bool)

(declare-fun e!698162 () Bool)

(assert (=> b!1230534 (= e!698163 e!698162)))

(declare-fun res!819006 () Bool)

(assert (=> b!1230534 (=> (not res!819006) (not e!698162))))

(assert (=> b!1230534 (= res!819006 (not e!698161))))

(declare-fun res!819004 () Bool)

(assert (=> b!1230534 (=> (not res!819004) (not e!698161))))

(assert (=> b!1230534 (= res!819004 (validKeyInArray!0 (select (arr!38310 a!3806) from!3184)))))

(declare-fun b!1230535 () Bool)

(assert (=> b!1230535 (= e!698164 call!60861)))

(declare-fun b!1230536 () Bool)

(assert (=> b!1230536 (= e!698162 e!698164)))

(assert (=> b!1230536 (= c!120624 (validKeyInArray!0 (select (arr!38310 a!3806) from!3184)))))

(assert (= (and d!134585 (not res!819005)) b!1230534))

(assert (= (and b!1230534 res!819004) b!1230533))

(assert (= (and b!1230534 res!819006) b!1230536))

(assert (= (and b!1230536 c!120624) b!1230532))

(assert (= (and b!1230536 (not c!120624)) b!1230535))

(assert (= (or b!1230532 b!1230535) bm!60858))

(assert (=> bm!60858 m!1134851))

(declare-fun m!1134913 () Bool)

(assert (=> bm!60858 m!1134913))

(assert (=> b!1230533 m!1134851))

(assert (=> b!1230533 m!1134851))

(declare-fun m!1134915 () Bool)

(assert (=> b!1230533 m!1134915))

(assert (=> b!1230534 m!1134851))

(assert (=> b!1230534 m!1134851))

(assert (=> b!1230534 m!1134855))

(assert (=> b!1230536 m!1134851))

(assert (=> b!1230536 m!1134851))

(assert (=> b!1230536 m!1134855))

(assert (=> b!1230437 d!134585))

(declare-fun d!134587 () Bool)

(assert (=> d!134587 (= (array_inv!29158 a!3806) (bvsge (size!38846 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102206 d!134587))

(declare-fun d!134589 () Bool)

(declare-fun res!819023 () Bool)

(declare-fun e!698185 () Bool)

(assert (=> d!134589 (=> res!819023 e!698185)))

(assert (=> d!134589 (= res!819023 (= (select (arr!38310 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134589 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698185)))

(declare-fun b!1230561 () Bool)

(declare-fun e!698186 () Bool)

(assert (=> b!1230561 (= e!698185 e!698186)))

(declare-fun res!819024 () Bool)

(assert (=> b!1230561 (=> (not res!819024) (not e!698186))))

(assert (=> b!1230561 (= res!819024 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38846 a!3806)))))

(declare-fun b!1230562 () Bool)

(assert (=> b!1230562 (= e!698186 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134589 (not res!819023)) b!1230561))

(assert (= (and b!1230561 res!819024) b!1230562))

(assert (=> d!134589 m!1134887))

(declare-fun m!1134937 () Bool)

(assert (=> b!1230562 m!1134937))

(assert (=> b!1230442 d!134589))

(check-sat (not b!1230533) (not d!134583) (not b!1230536) (not bm!60858) (not b!1230562) (not bm!60853) (not b!1230534) (not b!1230475) (not b!1230488) (not b!1230491) (not b!1230476) (not b!1230489) (not b!1230529) (not d!134577) (not b!1230519))
(check-sat)
