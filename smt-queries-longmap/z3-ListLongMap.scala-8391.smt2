; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102070 () Bool)

(assert start!102070)

(declare-fun b!1228666 () Bool)

(declare-fun e!697402 () Bool)

(declare-fun e!697403 () Bool)

(assert (=> b!1228666 (= e!697402 e!697403)))

(declare-fun res!817263 () Bool)

(assert (=> b!1228666 (=> (not res!817263) (not e!697403))))

(declare-datatypes ((List!27105 0))(
  ( (Nil!27102) (Cons!27101 (h!28310 (_ BitVec 64)) (t!40559 List!27105)) )
))
(declare-fun lt!558868 () List!27105)

(declare-fun contains!7077 (List!27105 (_ BitVec 64)) Bool)

(assert (=> b!1228666 (= res!817263 (not (contains!7077 lt!558868 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228667 () Bool)

(declare-fun res!817264 () Bool)

(declare-fun e!697400 () Bool)

(assert (=> b!1228667 (=> (not res!817264) (not e!697400))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228667 (= res!817264 (validKeyInArray!0 k0!2913))))

(declare-fun b!1228668 () Bool)

(declare-fun res!817266 () Bool)

(assert (=> b!1228668 (=> (not res!817266) (not e!697400))))

(declare-fun acc!823 () List!27105)

(declare-fun noDuplicate!1720 (List!27105) Bool)

(assert (=> b!1228668 (= res!817266 (noDuplicate!1720 acc!823))))

(declare-fun b!1228669 () Bool)

(declare-fun res!817270 () Bool)

(assert (=> b!1228669 (=> (not res!817270) (not e!697400))))

(assert (=> b!1228669 (= res!817270 (not (contains!7077 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228670 () Bool)

(declare-fun res!817267 () Bool)

(assert (=> b!1228670 (=> res!817267 e!697402)))

(assert (=> b!1228670 (= res!817267 (not (noDuplicate!1720 lt!558868)))))

(declare-fun res!817271 () Bool)

(assert (=> start!102070 (=> (not res!817271) (not e!697400))))

(declare-datatypes ((array!79219 0))(
  ( (array!79220 (arr!38231 (Array (_ BitVec 32) (_ BitVec 64))) (size!38769 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79219)

(assert (=> start!102070 (= res!817271 (bvslt (size!38769 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102070 e!697400))

(declare-fun array_inv!29214 (array!79219) Bool)

(assert (=> start!102070 (array_inv!29214 a!3806)))

(assert (=> start!102070 true))

(declare-fun b!1228671 () Bool)

(declare-fun res!817269 () Bool)

(assert (=> b!1228671 (=> (not res!817269) (not e!697400))))

(assert (=> b!1228671 (= res!817269 (not (contains!7077 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228672 () Bool)

(assert (=> b!1228672 (= e!697400 (not e!697402))))

(declare-fun res!817268 () Bool)

(assert (=> b!1228672 (=> res!817268 e!697402)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1228672 (= res!817268 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1228672 (= lt!558868 (Cons!27101 (select (arr!38231 a!3806) from!3184) Nil!27102))))

(declare-fun arrayNoDuplicates!0 (array!79219 (_ BitVec 32) List!27105) Bool)

(assert (=> b!1228672 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27102)))

(declare-datatypes ((Unit!40553 0))(
  ( (Unit!40554) )
))
(declare-fun lt!558869 () Unit!40553)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79219 List!27105 List!27105 (_ BitVec 32)) Unit!40553)

(assert (=> b!1228672 (= lt!558869 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27102 from!3184))))

(assert (=> b!1228672 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823))))

(declare-fun b!1228673 () Bool)

(declare-fun res!817265 () Bool)

(assert (=> b!1228673 (=> (not res!817265) (not e!697400))))

(declare-fun arrayContainsKey!0 (array!79219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228673 (= res!817265 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228674 () Bool)

(assert (=> b!1228674 (= e!697403 (not (contains!7077 lt!558868 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228675 () Bool)

(declare-fun res!817262 () Bool)

(assert (=> b!1228675 (=> (not res!817262) (not e!697400))))

(assert (=> b!1228675 (= res!817262 (validKeyInArray!0 (select (arr!38231 a!3806) from!3184)))))

(declare-fun b!1228676 () Bool)

(declare-fun res!817261 () Bool)

(assert (=> b!1228676 (=> (not res!817261) (not e!697400))))

(assert (=> b!1228676 (= res!817261 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228677 () Bool)

(declare-fun res!817260 () Bool)

(assert (=> b!1228677 (=> (not res!817260) (not e!697400))))

(assert (=> b!1228677 (= res!817260 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38769 a!3806)) (bvslt from!3184 (size!38769 a!3806))))))

(assert (= (and start!102070 res!817271) b!1228667))

(assert (= (and b!1228667 res!817264) b!1228677))

(assert (= (and b!1228677 res!817260) b!1228668))

(assert (= (and b!1228668 res!817266) b!1228669))

(assert (= (and b!1228669 res!817270) b!1228671))

(assert (= (and b!1228671 res!817269) b!1228673))

(assert (= (and b!1228673 res!817265) b!1228676))

(assert (= (and b!1228676 res!817261) b!1228675))

(assert (= (and b!1228675 res!817262) b!1228672))

(assert (= (and b!1228672 (not res!817268)) b!1228670))

(assert (= (and b!1228670 (not res!817267)) b!1228666))

(assert (= (and b!1228666 res!817263) b!1228674))

(declare-fun m!1132791 () Bool)

(assert (=> b!1228672 m!1132791))

(declare-fun m!1132793 () Bool)

(assert (=> b!1228672 m!1132793))

(declare-fun m!1132795 () Bool)

(assert (=> b!1228672 m!1132795))

(declare-fun m!1132797 () Bool)

(assert (=> b!1228672 m!1132797))

(declare-fun m!1132799 () Bool)

(assert (=> b!1228670 m!1132799))

(declare-fun m!1132801 () Bool)

(assert (=> b!1228668 m!1132801))

(declare-fun m!1132803 () Bool)

(assert (=> b!1228673 m!1132803))

(declare-fun m!1132805 () Bool)

(assert (=> b!1228676 m!1132805))

(declare-fun m!1132807 () Bool)

(assert (=> b!1228666 m!1132807))

(declare-fun m!1132809 () Bool)

(assert (=> b!1228667 m!1132809))

(declare-fun m!1132811 () Bool)

(assert (=> b!1228674 m!1132811))

(assert (=> b!1228675 m!1132791))

(assert (=> b!1228675 m!1132791))

(declare-fun m!1132813 () Bool)

(assert (=> b!1228675 m!1132813))

(declare-fun m!1132815 () Bool)

(assert (=> start!102070 m!1132815))

(declare-fun m!1132817 () Bool)

(assert (=> b!1228671 m!1132817))

(declare-fun m!1132819 () Bool)

(assert (=> b!1228669 m!1132819))

(check-sat (not start!102070) (not b!1228669) (not b!1228673) (not b!1228675) (not b!1228674) (not b!1228666) (not b!1228667) (not b!1228670) (not b!1228668) (not b!1228672) (not b!1228671) (not b!1228676))
(check-sat)
(get-model)

(declare-fun b!1228760 () Bool)

(declare-fun e!697439 () Bool)

(assert (=> b!1228760 (= e!697439 (contains!7077 acc!823 (select (arr!38231 a!3806) from!3184)))))

(declare-fun b!1228761 () Bool)

(declare-fun e!697438 () Bool)

(declare-fun call!60813 () Bool)

(assert (=> b!1228761 (= e!697438 call!60813)))

(declare-fun d!134225 () Bool)

(declare-fun res!817350 () Bool)

(declare-fun e!697436 () Bool)

(assert (=> d!134225 (=> res!817350 e!697436)))

(assert (=> d!134225 (= res!817350 (bvsge from!3184 (size!38769 a!3806)))))

(assert (=> d!134225 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!697436)))

(declare-fun b!1228762 () Bool)

(declare-fun e!697437 () Bool)

(assert (=> b!1228762 (= e!697436 e!697437)))

(declare-fun res!817351 () Bool)

(assert (=> b!1228762 (=> (not res!817351) (not e!697437))))

(assert (=> b!1228762 (= res!817351 (not e!697439))))

(declare-fun res!817352 () Bool)

(assert (=> b!1228762 (=> (not res!817352) (not e!697439))))

(assert (=> b!1228762 (= res!817352 (validKeyInArray!0 (select (arr!38231 a!3806) from!3184)))))

(declare-fun b!1228763 () Bool)

(assert (=> b!1228763 (= e!697437 e!697438)))

(declare-fun c!120568 () Bool)

(assert (=> b!1228763 (= c!120568 (validKeyInArray!0 (select (arr!38231 a!3806) from!3184)))))

(declare-fun bm!60810 () Bool)

(assert (=> bm!60810 (= call!60813 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120568 (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1228764 () Bool)

(assert (=> b!1228764 (= e!697438 call!60813)))

(assert (= (and d!134225 (not res!817350)) b!1228762))

(assert (= (and b!1228762 res!817352) b!1228760))

(assert (= (and b!1228762 res!817351) b!1228763))

(assert (= (and b!1228763 c!120568) b!1228764))

(assert (= (and b!1228763 (not c!120568)) b!1228761))

(assert (= (or b!1228764 b!1228761) bm!60810))

(assert (=> b!1228760 m!1132791))

(assert (=> b!1228760 m!1132791))

(declare-fun m!1132881 () Bool)

(assert (=> b!1228760 m!1132881))

(assert (=> b!1228762 m!1132791))

(assert (=> b!1228762 m!1132791))

(assert (=> b!1228762 m!1132813))

(assert (=> b!1228763 m!1132791))

(assert (=> b!1228763 m!1132791))

(assert (=> b!1228763 m!1132813))

(assert (=> bm!60810 m!1132791))

(declare-fun m!1132883 () Bool)

(assert (=> bm!60810 m!1132883))

(assert (=> b!1228676 d!134225))

(declare-fun d!134227 () Bool)

(assert (=> d!134227 (= (validKeyInArray!0 (select (arr!38231 a!3806) from!3184)) (and (not (= (select (arr!38231 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38231 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228675 d!134227))

(declare-fun d!134231 () Bool)

(declare-fun lt!558886 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!555 (List!27105) (InoxSet (_ BitVec 64)))

(assert (=> d!134231 (= lt!558886 (select (content!555 lt!558868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697454 () Bool)

(assert (=> d!134231 (= lt!558886 e!697454)))

(declare-fun res!817365 () Bool)

(assert (=> d!134231 (=> (not res!817365) (not e!697454))))

(get-info :version)

(assert (=> d!134231 (= res!817365 ((_ is Cons!27101) lt!558868))))

(assert (=> d!134231 (= (contains!7077 lt!558868 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558886)))

(declare-fun b!1228777 () Bool)

(declare-fun e!697455 () Bool)

(assert (=> b!1228777 (= e!697454 e!697455)))

(declare-fun res!817366 () Bool)

(assert (=> b!1228777 (=> res!817366 e!697455)))

(assert (=> b!1228777 (= res!817366 (= (h!28310 lt!558868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228778 () Bool)

(assert (=> b!1228778 (= e!697455 (contains!7077 (t!40559 lt!558868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134231 res!817365) b!1228777))

(assert (= (and b!1228777 (not res!817366)) b!1228778))

(declare-fun m!1132889 () Bool)

(assert (=> d!134231 m!1132889))

(declare-fun m!1132891 () Bool)

(assert (=> d!134231 m!1132891))

(declare-fun m!1132893 () Bool)

(assert (=> b!1228778 m!1132893))

(assert (=> b!1228674 d!134231))

(declare-fun d!134237 () Bool)

(declare-fun res!817381 () Bool)

(declare-fun e!697468 () Bool)

(assert (=> d!134237 (=> res!817381 e!697468)))

(assert (=> d!134237 (= res!817381 ((_ is Nil!27102) acc!823))))

(assert (=> d!134237 (= (noDuplicate!1720 acc!823) e!697468)))

(declare-fun b!1228793 () Bool)

(declare-fun e!697469 () Bool)

(assert (=> b!1228793 (= e!697468 e!697469)))

(declare-fun res!817382 () Bool)

(assert (=> b!1228793 (=> (not res!817382) (not e!697469))))

(assert (=> b!1228793 (= res!817382 (not (contains!7077 (t!40559 acc!823) (h!28310 acc!823))))))

(declare-fun b!1228794 () Bool)

(assert (=> b!1228794 (= e!697469 (noDuplicate!1720 (t!40559 acc!823)))))

(assert (= (and d!134237 (not res!817381)) b!1228793))

(assert (= (and b!1228793 res!817382) b!1228794))

(declare-fun m!1132907 () Bool)

(assert (=> b!1228793 m!1132907))

(declare-fun m!1132911 () Bool)

(assert (=> b!1228794 m!1132911))

(assert (=> b!1228668 d!134237))

(declare-fun d!134243 () Bool)

(assert (=> d!134243 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228667 d!134243))

(declare-fun d!134247 () Bool)

(declare-fun lt!558892 () Bool)

(assert (=> d!134247 (= lt!558892 (select (content!555 lt!558868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697472 () Bool)

(assert (=> d!134247 (= lt!558892 e!697472)))

(declare-fun res!817385 () Bool)

(assert (=> d!134247 (=> (not res!817385) (not e!697472))))

(assert (=> d!134247 (= res!817385 ((_ is Cons!27101) lt!558868))))

(assert (=> d!134247 (= (contains!7077 lt!558868 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558892)))

(declare-fun b!1228797 () Bool)

(declare-fun e!697473 () Bool)

(assert (=> b!1228797 (= e!697472 e!697473)))

(declare-fun res!817386 () Bool)

(assert (=> b!1228797 (=> res!817386 e!697473)))

(assert (=> b!1228797 (= res!817386 (= (h!28310 lt!558868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228798 () Bool)

(assert (=> b!1228798 (= e!697473 (contains!7077 (t!40559 lt!558868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134247 res!817385) b!1228797))

(assert (= (and b!1228797 (not res!817386)) b!1228798))

(assert (=> d!134247 m!1132889))

(declare-fun m!1132917 () Bool)

(assert (=> d!134247 m!1132917))

(declare-fun m!1132919 () Bool)

(assert (=> b!1228798 m!1132919))

(assert (=> b!1228666 d!134247))

(declare-fun d!134249 () Bool)

(declare-fun res!817387 () Bool)

(declare-fun e!697474 () Bool)

(assert (=> d!134249 (=> res!817387 e!697474)))

(assert (=> d!134249 (= res!817387 ((_ is Nil!27102) lt!558868))))

(assert (=> d!134249 (= (noDuplicate!1720 lt!558868) e!697474)))

(declare-fun b!1228799 () Bool)

(declare-fun e!697475 () Bool)

(assert (=> b!1228799 (= e!697474 e!697475)))

(declare-fun res!817388 () Bool)

(assert (=> b!1228799 (=> (not res!817388) (not e!697475))))

(assert (=> b!1228799 (= res!817388 (not (contains!7077 (t!40559 lt!558868) (h!28310 lt!558868))))))

(declare-fun b!1228800 () Bool)

(assert (=> b!1228800 (= e!697475 (noDuplicate!1720 (t!40559 lt!558868)))))

(assert (= (and d!134249 (not res!817387)) b!1228799))

(assert (= (and b!1228799 res!817388) b!1228800))

(declare-fun m!1132921 () Bool)

(assert (=> b!1228799 m!1132921))

(declare-fun m!1132923 () Bool)

(assert (=> b!1228800 m!1132923))

(assert (=> b!1228670 d!134249))

(declare-fun d!134253 () Bool)

(declare-fun lt!558893 () Bool)

(assert (=> d!134253 (= lt!558893 (select (content!555 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697478 () Bool)

(assert (=> d!134253 (= lt!558893 e!697478)))

(declare-fun res!817391 () Bool)

(assert (=> d!134253 (=> (not res!817391) (not e!697478))))

(assert (=> d!134253 (= res!817391 ((_ is Cons!27101) acc!823))))

(assert (=> d!134253 (= (contains!7077 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558893)))

(declare-fun b!1228803 () Bool)

(declare-fun e!697479 () Bool)

(assert (=> b!1228803 (= e!697478 e!697479)))

(declare-fun res!817392 () Bool)

(assert (=> b!1228803 (=> res!817392 e!697479)))

(assert (=> b!1228803 (= res!817392 (= (h!28310 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228804 () Bool)

(assert (=> b!1228804 (= e!697479 (contains!7077 (t!40559 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134253 res!817391) b!1228803))

(assert (= (and b!1228803 (not res!817392)) b!1228804))

(declare-fun m!1132929 () Bool)

(assert (=> d!134253 m!1132929))

(declare-fun m!1132931 () Bool)

(assert (=> d!134253 m!1132931))

(declare-fun m!1132933 () Bool)

(assert (=> b!1228804 m!1132933))

(assert (=> b!1228669 d!134253))

(declare-fun d!134257 () Bool)

(declare-fun res!817409 () Bool)

(declare-fun e!697498 () Bool)

(assert (=> d!134257 (=> res!817409 e!697498)))

(assert (=> d!134257 (= res!817409 (= (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134257 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!697498)))

(declare-fun b!1228825 () Bool)

(declare-fun e!697499 () Bool)

(assert (=> b!1228825 (= e!697498 e!697499)))

(declare-fun res!817410 () Bool)

(assert (=> b!1228825 (=> (not res!817410) (not e!697499))))

(assert (=> b!1228825 (= res!817410 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38769 a!3806)))))

(declare-fun b!1228826 () Bool)

(assert (=> b!1228826 (= e!697499 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134257 (not res!817409)) b!1228825))

(assert (= (and b!1228825 res!817410) b!1228826))

(declare-fun m!1132939 () Bool)

(assert (=> d!134257 m!1132939))

(declare-fun m!1132941 () Bool)

(assert (=> b!1228826 m!1132941))

(assert (=> b!1228673 d!134257))

(declare-fun d!134261 () Bool)

(assert (=> d!134261 (= (array_inv!29214 a!3806) (bvsge (size!38769 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102070 d!134261))

(declare-fun b!1228827 () Bool)

(declare-fun e!697503 () Bool)

(assert (=> b!1228827 (= e!697503 (contains!7077 Nil!27102 (select (arr!38231 a!3806) from!3184)))))

(declare-fun b!1228828 () Bool)

(declare-fun e!697502 () Bool)

(declare-fun call!60816 () Bool)

(assert (=> b!1228828 (= e!697502 call!60816)))

(declare-fun d!134263 () Bool)

(declare-fun res!817411 () Bool)

(declare-fun e!697500 () Bool)

(assert (=> d!134263 (=> res!817411 e!697500)))

(assert (=> d!134263 (= res!817411 (bvsge from!3184 (size!38769 a!3806)))))

(assert (=> d!134263 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27102) e!697500)))

(declare-fun b!1228829 () Bool)

(declare-fun e!697501 () Bool)

(assert (=> b!1228829 (= e!697500 e!697501)))

(declare-fun res!817412 () Bool)

(assert (=> b!1228829 (=> (not res!817412) (not e!697501))))

(assert (=> b!1228829 (= res!817412 (not e!697503))))

(declare-fun res!817413 () Bool)

(assert (=> b!1228829 (=> (not res!817413) (not e!697503))))

(assert (=> b!1228829 (= res!817413 (validKeyInArray!0 (select (arr!38231 a!3806) from!3184)))))

(declare-fun b!1228830 () Bool)

(assert (=> b!1228830 (= e!697501 e!697502)))

(declare-fun c!120571 () Bool)

(assert (=> b!1228830 (= c!120571 (validKeyInArray!0 (select (arr!38231 a!3806) from!3184)))))

(declare-fun bm!60813 () Bool)

(assert (=> bm!60813 (= call!60816 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120571 (Cons!27101 (select (arr!38231 a!3806) from!3184) Nil!27102) Nil!27102)))))

(declare-fun b!1228831 () Bool)

(assert (=> b!1228831 (= e!697502 call!60816)))

(assert (= (and d!134263 (not res!817411)) b!1228829))

(assert (= (and b!1228829 res!817413) b!1228827))

(assert (= (and b!1228829 res!817412) b!1228830))

(assert (= (and b!1228830 c!120571) b!1228831))

(assert (= (and b!1228830 (not c!120571)) b!1228828))

(assert (= (or b!1228831 b!1228828) bm!60813))

(assert (=> b!1228827 m!1132791))

(assert (=> b!1228827 m!1132791))

(declare-fun m!1132943 () Bool)

(assert (=> b!1228827 m!1132943))

(assert (=> b!1228829 m!1132791))

(assert (=> b!1228829 m!1132791))

(assert (=> b!1228829 m!1132813))

(assert (=> b!1228830 m!1132791))

(assert (=> b!1228830 m!1132791))

(assert (=> b!1228830 m!1132813))

(assert (=> bm!60813 m!1132791))

(declare-fun m!1132945 () Bool)

(assert (=> bm!60813 m!1132945))

(assert (=> b!1228672 d!134263))

(declare-fun d!134265 () Bool)

(assert (=> d!134265 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27102)))

(declare-fun lt!558898 () Unit!40553)

(declare-fun choose!80 (array!79219 List!27105 List!27105 (_ BitVec 32)) Unit!40553)

(assert (=> d!134265 (= lt!558898 (choose!80 a!3806 acc!823 Nil!27102 from!3184))))

(assert (=> d!134265 (bvslt (size!38769 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134265 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27102 from!3184) lt!558898)))

(declare-fun bs!34513 () Bool)

(assert (= bs!34513 d!134265))

(assert (=> bs!34513 m!1132793))

(declare-fun m!1132951 () Bool)

(assert (=> bs!34513 m!1132951))

(assert (=> b!1228672 d!134265))

(declare-fun b!1228847 () Bool)

(declare-fun e!697519 () Bool)

(assert (=> b!1228847 (= e!697519 (contains!7077 (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823) (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228848 () Bool)

(declare-fun e!697518 () Bool)

(declare-fun call!60820 () Bool)

(assert (=> b!1228848 (= e!697518 call!60820)))

(declare-fun d!134269 () Bool)

(declare-fun res!817423 () Bool)

(declare-fun e!697516 () Bool)

(assert (=> d!134269 (=> res!817423 e!697516)))

(assert (=> d!134269 (= res!817423 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38769 a!3806)))))

(assert (=> d!134269 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)) e!697516)))

(declare-fun b!1228849 () Bool)

(declare-fun e!697517 () Bool)

(assert (=> b!1228849 (= e!697516 e!697517)))

(declare-fun res!817424 () Bool)

(assert (=> b!1228849 (=> (not res!817424) (not e!697517))))

(assert (=> b!1228849 (= res!817424 (not e!697519))))

(declare-fun res!817425 () Bool)

(assert (=> b!1228849 (=> (not res!817425) (not e!697519))))

(assert (=> b!1228849 (= res!817425 (validKeyInArray!0 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228850 () Bool)

(assert (=> b!1228850 (= e!697517 e!697518)))

(declare-fun c!120575 () Bool)

(assert (=> b!1228850 (= c!120575 (validKeyInArray!0 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60817 () Bool)

(assert (=> bm!60817 (= call!60820 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120575 (Cons!27101 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823))))))

(declare-fun b!1228851 () Bool)

(assert (=> b!1228851 (= e!697518 call!60820)))

(assert (= (and d!134269 (not res!817423)) b!1228849))

(assert (= (and b!1228849 res!817425) b!1228847))

(assert (= (and b!1228849 res!817424) b!1228850))

(assert (= (and b!1228850 c!120575) b!1228851))

(assert (= (and b!1228850 (not c!120575)) b!1228848))

(assert (= (or b!1228851 b!1228848) bm!60817))

(assert (=> b!1228847 m!1132939))

(assert (=> b!1228847 m!1132939))

(declare-fun m!1132955 () Bool)

(assert (=> b!1228847 m!1132955))

(assert (=> b!1228849 m!1132939))

(assert (=> b!1228849 m!1132939))

(declare-fun m!1132957 () Bool)

(assert (=> b!1228849 m!1132957))

(assert (=> b!1228850 m!1132939))

(assert (=> b!1228850 m!1132939))

(assert (=> b!1228850 m!1132957))

(assert (=> bm!60817 m!1132939))

(declare-fun m!1132963 () Bool)

(assert (=> bm!60817 m!1132963))

(assert (=> b!1228672 d!134269))

(declare-fun d!134273 () Bool)

(declare-fun lt!558900 () Bool)

(assert (=> d!134273 (= lt!558900 (select (content!555 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697524 () Bool)

(assert (=> d!134273 (= lt!558900 e!697524)))

(declare-fun res!817429 () Bool)

(assert (=> d!134273 (=> (not res!817429) (not e!697524))))

(assert (=> d!134273 (= res!817429 ((_ is Cons!27101) acc!823))))

(assert (=> d!134273 (= (contains!7077 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558900)))

(declare-fun b!1228857 () Bool)

(declare-fun e!697525 () Bool)

(assert (=> b!1228857 (= e!697524 e!697525)))

(declare-fun res!817430 () Bool)

(assert (=> b!1228857 (=> res!817430 e!697525)))

(assert (=> b!1228857 (= res!817430 (= (h!28310 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228858 () Bool)

(assert (=> b!1228858 (= e!697525 (contains!7077 (t!40559 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134273 res!817429) b!1228857))

(assert (= (and b!1228857 (not res!817430)) b!1228858))

(assert (=> d!134273 m!1132929))

(declare-fun m!1132969 () Bool)

(assert (=> d!134273 m!1132969))

(declare-fun m!1132971 () Bool)

(assert (=> b!1228858 m!1132971))

(assert (=> b!1228671 d!134273))

(check-sat (not d!134273) (not b!1228762) (not b!1228830) (not d!134247) (not b!1228858) (not bm!60810) (not b!1228800) (not b!1228794) (not b!1228799) (not b!1228793) (not b!1228826) (not b!1228850) (not b!1228804) (not b!1228827) (not d!134253) (not bm!60813) (not b!1228763) (not b!1228778) (not b!1228849) (not bm!60817) (not b!1228798) (not b!1228847) (not d!134231) (not d!134265) (not b!1228760) (not b!1228829))
(check-sat)
(get-model)

(declare-fun d!134309 () Bool)

(declare-fun lt!558909 () Bool)

(assert (=> d!134309 (= lt!558909 (select (content!555 (t!40559 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697566 () Bool)

(assert (=> d!134309 (= lt!558909 e!697566)))

(declare-fun res!817467 () Bool)

(assert (=> d!134309 (=> (not res!817467) (not e!697566))))

(assert (=> d!134309 (= res!817467 ((_ is Cons!27101) (t!40559 acc!823)))))

(assert (=> d!134309 (= (contains!7077 (t!40559 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!558909)))

(declare-fun b!1228903 () Bool)

(declare-fun e!697567 () Bool)

(assert (=> b!1228903 (= e!697566 e!697567)))

(declare-fun res!817468 () Bool)

(assert (=> b!1228903 (=> res!817468 e!697567)))

(assert (=> b!1228903 (= res!817468 (= (h!28310 (t!40559 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228904 () Bool)

(assert (=> b!1228904 (= e!697567 (contains!7077 (t!40559 (t!40559 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134309 res!817467) b!1228903))

(assert (= (and b!1228903 (not res!817468)) b!1228904))

(declare-fun m!1133025 () Bool)

(assert (=> d!134309 m!1133025))

(declare-fun m!1133027 () Bool)

(assert (=> d!134309 m!1133027))

(declare-fun m!1133029 () Bool)

(assert (=> b!1228904 m!1133029))

(assert (=> b!1228804 d!134309))

(declare-fun d!134311 () Bool)

(declare-fun res!817469 () Bool)

(declare-fun e!697568 () Bool)

(assert (=> d!134311 (=> res!817469 e!697568)))

(assert (=> d!134311 (= res!817469 ((_ is Nil!27102) (t!40559 lt!558868)))))

(assert (=> d!134311 (= (noDuplicate!1720 (t!40559 lt!558868)) e!697568)))

(declare-fun b!1228905 () Bool)

(declare-fun e!697569 () Bool)

(assert (=> b!1228905 (= e!697568 e!697569)))

(declare-fun res!817470 () Bool)

(assert (=> b!1228905 (=> (not res!817470) (not e!697569))))

(assert (=> b!1228905 (= res!817470 (not (contains!7077 (t!40559 (t!40559 lt!558868)) (h!28310 (t!40559 lt!558868)))))))

(declare-fun b!1228906 () Bool)

(assert (=> b!1228906 (= e!697569 (noDuplicate!1720 (t!40559 (t!40559 lt!558868))))))

(assert (= (and d!134311 (not res!817469)) b!1228905))

(assert (= (and b!1228905 res!817470) b!1228906))

(declare-fun m!1133031 () Bool)

(assert (=> b!1228905 m!1133031))

(declare-fun m!1133033 () Bool)

(assert (=> b!1228906 m!1133033))

(assert (=> b!1228800 d!134311))

(declare-fun d!134313 () Bool)

(declare-fun lt!558910 () Bool)

(assert (=> d!134313 (= lt!558910 (select (content!555 (t!40559 lt!558868)) (h!28310 lt!558868)))))

(declare-fun e!697570 () Bool)

(assert (=> d!134313 (= lt!558910 e!697570)))

(declare-fun res!817471 () Bool)

(assert (=> d!134313 (=> (not res!817471) (not e!697570))))

(assert (=> d!134313 (= res!817471 ((_ is Cons!27101) (t!40559 lt!558868)))))

(assert (=> d!134313 (= (contains!7077 (t!40559 lt!558868) (h!28310 lt!558868)) lt!558910)))

(declare-fun b!1228907 () Bool)

(declare-fun e!697571 () Bool)

(assert (=> b!1228907 (= e!697570 e!697571)))

(declare-fun res!817472 () Bool)

(assert (=> b!1228907 (=> res!817472 e!697571)))

(assert (=> b!1228907 (= res!817472 (= (h!28310 (t!40559 lt!558868)) (h!28310 lt!558868)))))

(declare-fun b!1228908 () Bool)

(assert (=> b!1228908 (= e!697571 (contains!7077 (t!40559 (t!40559 lt!558868)) (h!28310 lt!558868)))))

(assert (= (and d!134313 res!817471) b!1228907))

(assert (= (and b!1228907 (not res!817472)) b!1228908))

(declare-fun m!1133035 () Bool)

(assert (=> d!134313 m!1133035))

(declare-fun m!1133037 () Bool)

(assert (=> d!134313 m!1133037))

(declare-fun m!1133039 () Bool)

(assert (=> b!1228908 m!1133039))

(assert (=> b!1228799 d!134313))

(declare-fun d!134315 () Bool)

(declare-fun c!120583 () Bool)

(assert (=> d!134315 (= c!120583 ((_ is Nil!27102) lt!558868))))

(declare-fun e!697574 () (InoxSet (_ BitVec 64)))

(assert (=> d!134315 (= (content!555 lt!558868) e!697574)))

(declare-fun b!1228913 () Bool)

(assert (=> b!1228913 (= e!697574 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1228914 () Bool)

(assert (=> b!1228914 (= e!697574 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28310 lt!558868) true) (content!555 (t!40559 lt!558868))))))

(assert (= (and d!134315 c!120583) b!1228913))

(assert (= (and d!134315 (not c!120583)) b!1228914))

(declare-fun m!1133041 () Bool)

(assert (=> b!1228914 m!1133041))

(assert (=> b!1228914 m!1133035))

(assert (=> d!134247 d!134315))

(assert (=> d!134265 d!134263))

(declare-fun d!134317 () Bool)

(assert (=> d!134317 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27102)))

(assert (=> d!134317 true))

(declare-fun _$70!83 () Unit!40553)

(assert (=> d!134317 (= (choose!80 a!3806 acc!823 Nil!27102 from!3184) _$70!83)))

(declare-fun bs!34516 () Bool)

(assert (= bs!34516 d!134317))

(assert (=> bs!34516 m!1132793))

(assert (=> d!134265 d!134317))

(declare-fun d!134319 () Bool)

(declare-fun res!817473 () Bool)

(declare-fun e!697575 () Bool)

(assert (=> d!134319 (=> res!817473 e!697575)))

(assert (=> d!134319 (= res!817473 ((_ is Nil!27102) (t!40559 acc!823)))))

(assert (=> d!134319 (= (noDuplicate!1720 (t!40559 acc!823)) e!697575)))

(declare-fun b!1228915 () Bool)

(declare-fun e!697576 () Bool)

(assert (=> b!1228915 (= e!697575 e!697576)))

(declare-fun res!817474 () Bool)

(assert (=> b!1228915 (=> (not res!817474) (not e!697576))))

(assert (=> b!1228915 (= res!817474 (not (contains!7077 (t!40559 (t!40559 acc!823)) (h!28310 (t!40559 acc!823)))))))

(declare-fun b!1228916 () Bool)

(assert (=> b!1228916 (= e!697576 (noDuplicate!1720 (t!40559 (t!40559 acc!823))))))

(assert (= (and d!134319 (not res!817473)) b!1228915))

(assert (= (and b!1228915 res!817474) b!1228916))

(declare-fun m!1133043 () Bool)

(assert (=> b!1228915 m!1133043))

(declare-fun m!1133045 () Bool)

(assert (=> b!1228916 m!1133045))

(assert (=> b!1228794 d!134319))

(declare-fun d!134321 () Bool)

(declare-fun lt!558911 () Bool)

(assert (=> d!134321 (= lt!558911 (select (content!555 (t!40559 acc!823)) (h!28310 acc!823)))))

(declare-fun e!697577 () Bool)

(assert (=> d!134321 (= lt!558911 e!697577)))

(declare-fun res!817475 () Bool)

(assert (=> d!134321 (=> (not res!817475) (not e!697577))))

(assert (=> d!134321 (= res!817475 ((_ is Cons!27101) (t!40559 acc!823)))))

(assert (=> d!134321 (= (contains!7077 (t!40559 acc!823) (h!28310 acc!823)) lt!558911)))

(declare-fun b!1228917 () Bool)

(declare-fun e!697578 () Bool)

(assert (=> b!1228917 (= e!697577 e!697578)))

(declare-fun res!817476 () Bool)

(assert (=> b!1228917 (=> res!817476 e!697578)))

(assert (=> b!1228917 (= res!817476 (= (h!28310 (t!40559 acc!823)) (h!28310 acc!823)))))

(declare-fun b!1228918 () Bool)

(assert (=> b!1228918 (= e!697578 (contains!7077 (t!40559 (t!40559 acc!823)) (h!28310 acc!823)))))

(assert (= (and d!134321 res!817475) b!1228917))

(assert (= (and b!1228917 (not res!817476)) b!1228918))

(assert (=> d!134321 m!1133025))

(declare-fun m!1133047 () Bool)

(assert (=> d!134321 m!1133047))

(declare-fun m!1133049 () Bool)

(assert (=> b!1228918 m!1133049))

(assert (=> b!1228793 d!134321))

(declare-fun e!697582 () Bool)

(declare-fun b!1228919 () Bool)

(assert (=> b!1228919 (= e!697582 (contains!7077 (ite c!120571 (Cons!27101 (select (arr!38231 a!3806) from!3184) Nil!27102) Nil!27102) (select (arr!38231 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228920 () Bool)

(declare-fun e!697581 () Bool)

(declare-fun call!60826 () Bool)

(assert (=> b!1228920 (= e!697581 call!60826)))

(declare-fun d!134323 () Bool)

(declare-fun res!817477 () Bool)

(declare-fun e!697579 () Bool)

(assert (=> d!134323 (=> res!817477 e!697579)))

(assert (=> d!134323 (= res!817477 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38769 a!3806)))))

(assert (=> d!134323 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120571 (Cons!27101 (select (arr!38231 a!3806) from!3184) Nil!27102) Nil!27102)) e!697579)))

(declare-fun b!1228921 () Bool)

(declare-fun e!697580 () Bool)

(assert (=> b!1228921 (= e!697579 e!697580)))

(declare-fun res!817478 () Bool)

(assert (=> b!1228921 (=> (not res!817478) (not e!697580))))

(assert (=> b!1228921 (= res!817478 (not e!697582))))

(declare-fun res!817479 () Bool)

(assert (=> b!1228921 (=> (not res!817479) (not e!697582))))

(assert (=> b!1228921 (= res!817479 (validKeyInArray!0 (select (arr!38231 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228922 () Bool)

(assert (=> b!1228922 (= e!697580 e!697581)))

(declare-fun c!120584 () Bool)

(assert (=> b!1228922 (= c!120584 (validKeyInArray!0 (select (arr!38231 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun bm!60823 () Bool)

(assert (=> bm!60823 (= call!60826 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120584 (Cons!27101 (select (arr!38231 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120571 (Cons!27101 (select (arr!38231 a!3806) from!3184) Nil!27102) Nil!27102)) (ite c!120571 (Cons!27101 (select (arr!38231 a!3806) from!3184) Nil!27102) Nil!27102))))))

(declare-fun b!1228923 () Bool)

(assert (=> b!1228923 (= e!697581 call!60826)))

(assert (= (and d!134323 (not res!817477)) b!1228921))

(assert (= (and b!1228921 res!817479) b!1228919))

(assert (= (and b!1228921 res!817478) b!1228922))

(assert (= (and b!1228922 c!120584) b!1228923))

(assert (= (and b!1228922 (not c!120584)) b!1228920))

(assert (= (or b!1228923 b!1228920) bm!60823))

(declare-fun m!1133051 () Bool)

(assert (=> b!1228919 m!1133051))

(assert (=> b!1228919 m!1133051))

(declare-fun m!1133053 () Bool)

(assert (=> b!1228919 m!1133053))

(assert (=> b!1228921 m!1133051))

(assert (=> b!1228921 m!1133051))

(declare-fun m!1133055 () Bool)

(assert (=> b!1228921 m!1133055))

(assert (=> b!1228922 m!1133051))

(assert (=> b!1228922 m!1133051))

(assert (=> b!1228922 m!1133055))

(assert (=> bm!60823 m!1133051))

(declare-fun m!1133057 () Bool)

(assert (=> bm!60823 m!1133057))

(assert (=> bm!60813 d!134323))

(assert (=> d!134231 d!134315))

(declare-fun d!134325 () Bool)

(declare-fun c!120585 () Bool)

(assert (=> d!134325 (= c!120585 ((_ is Nil!27102) acc!823))))

(declare-fun e!697583 () (InoxSet (_ BitVec 64)))

(assert (=> d!134325 (= (content!555 acc!823) e!697583)))

(declare-fun b!1228924 () Bool)

(assert (=> b!1228924 (= e!697583 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1228925 () Bool)

(assert (=> b!1228925 (= e!697583 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28310 acc!823) true) (content!555 (t!40559 acc!823))))))

(assert (= (and d!134325 c!120585) b!1228924))

(assert (= (and d!134325 (not c!120585)) b!1228925))

(declare-fun m!1133059 () Bool)

(assert (=> b!1228925 m!1133059))

(assert (=> b!1228925 m!1133025))

(assert (=> d!134273 d!134325))

(declare-fun d!134327 () Bool)

(declare-fun lt!558912 () Bool)

(assert (=> d!134327 (= lt!558912 (select (content!555 acc!823) (select (arr!38231 a!3806) from!3184)))))

(declare-fun e!697584 () Bool)

(assert (=> d!134327 (= lt!558912 e!697584)))

(declare-fun res!817480 () Bool)

(assert (=> d!134327 (=> (not res!817480) (not e!697584))))

(assert (=> d!134327 (= res!817480 ((_ is Cons!27101) acc!823))))

(assert (=> d!134327 (= (contains!7077 acc!823 (select (arr!38231 a!3806) from!3184)) lt!558912)))

(declare-fun b!1228926 () Bool)

(declare-fun e!697585 () Bool)

(assert (=> b!1228926 (= e!697584 e!697585)))

(declare-fun res!817481 () Bool)

(assert (=> b!1228926 (=> res!817481 e!697585)))

(assert (=> b!1228926 (= res!817481 (= (h!28310 acc!823) (select (arr!38231 a!3806) from!3184)))))

(declare-fun b!1228927 () Bool)

(assert (=> b!1228927 (= e!697585 (contains!7077 (t!40559 acc!823) (select (arr!38231 a!3806) from!3184)))))

(assert (= (and d!134327 res!817480) b!1228926))

(assert (= (and b!1228926 (not res!817481)) b!1228927))

(assert (=> d!134327 m!1132929))

(assert (=> d!134327 m!1132791))

(declare-fun m!1133061 () Bool)

(assert (=> d!134327 m!1133061))

(assert (=> b!1228927 m!1132791))

(declare-fun m!1133063 () Bool)

(assert (=> b!1228927 m!1133063))

(assert (=> b!1228760 d!134327))

(declare-fun e!697589 () Bool)

(declare-fun b!1228928 () Bool)

(assert (=> b!1228928 (= e!697589 (contains!7077 (ite c!120568 (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823) acc!823) (select (arr!38231 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228929 () Bool)

(declare-fun e!697588 () Bool)

(declare-fun call!60827 () Bool)

(assert (=> b!1228929 (= e!697588 call!60827)))

(declare-fun d!134329 () Bool)

(declare-fun res!817482 () Bool)

(declare-fun e!697586 () Bool)

(assert (=> d!134329 (=> res!817482 e!697586)))

(assert (=> d!134329 (= res!817482 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38769 a!3806)))))

(assert (=> d!134329 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120568 (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823) acc!823)) e!697586)))

(declare-fun b!1228930 () Bool)

(declare-fun e!697587 () Bool)

(assert (=> b!1228930 (= e!697586 e!697587)))

(declare-fun res!817483 () Bool)

(assert (=> b!1228930 (=> (not res!817483) (not e!697587))))

(assert (=> b!1228930 (= res!817483 (not e!697589))))

(declare-fun res!817484 () Bool)

(assert (=> b!1228930 (=> (not res!817484) (not e!697589))))

(assert (=> b!1228930 (= res!817484 (validKeyInArray!0 (select (arr!38231 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228931 () Bool)

(assert (=> b!1228931 (= e!697587 e!697588)))

(declare-fun c!120586 () Bool)

(assert (=> b!1228931 (= c!120586 (validKeyInArray!0 (select (arr!38231 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun bm!60824 () Bool)

(assert (=> bm!60824 (= call!60827 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120586 (Cons!27101 (select (arr!38231 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120568 (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823) acc!823)) (ite c!120568 (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun b!1228932 () Bool)

(assert (=> b!1228932 (= e!697588 call!60827)))

(assert (= (and d!134329 (not res!817482)) b!1228930))

(assert (= (and b!1228930 res!817484) b!1228928))

(assert (= (and b!1228930 res!817483) b!1228931))

(assert (= (and b!1228931 c!120586) b!1228932))

(assert (= (and b!1228931 (not c!120586)) b!1228929))

(assert (= (or b!1228932 b!1228929) bm!60824))

(assert (=> b!1228928 m!1133051))

(assert (=> b!1228928 m!1133051))

(declare-fun m!1133065 () Bool)

(assert (=> b!1228928 m!1133065))

(assert (=> b!1228930 m!1133051))

(assert (=> b!1228930 m!1133051))

(assert (=> b!1228930 m!1133055))

(assert (=> b!1228931 m!1133051))

(assert (=> b!1228931 m!1133051))

(assert (=> b!1228931 m!1133055))

(assert (=> bm!60824 m!1133051))

(declare-fun m!1133067 () Bool)

(assert (=> bm!60824 m!1133067))

(assert (=> bm!60810 d!134329))

(assert (=> b!1228763 d!134227))

(declare-fun d!134331 () Bool)

(declare-fun lt!558913 () Bool)

(assert (=> d!134331 (= lt!558913 (select (content!555 (t!40559 lt!558868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697590 () Bool)

(assert (=> d!134331 (= lt!558913 e!697590)))

(declare-fun res!817485 () Bool)

(assert (=> d!134331 (=> (not res!817485) (not e!697590))))

(assert (=> d!134331 (= res!817485 ((_ is Cons!27101) (t!40559 lt!558868)))))

(assert (=> d!134331 (= (contains!7077 (t!40559 lt!558868) #b1000000000000000000000000000000000000000000000000000000000000000) lt!558913)))

(declare-fun b!1228933 () Bool)

(declare-fun e!697591 () Bool)

(assert (=> b!1228933 (= e!697590 e!697591)))

(declare-fun res!817486 () Bool)

(assert (=> b!1228933 (=> res!817486 e!697591)))

(assert (=> b!1228933 (= res!817486 (= (h!28310 (t!40559 lt!558868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228934 () Bool)

(assert (=> b!1228934 (= e!697591 (contains!7077 (t!40559 (t!40559 lt!558868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134331 res!817485) b!1228933))

(assert (= (and b!1228933 (not res!817486)) b!1228934))

(assert (=> d!134331 m!1133035))

(declare-fun m!1133069 () Bool)

(assert (=> d!134331 m!1133069))

(declare-fun m!1133071 () Bool)

(assert (=> b!1228934 m!1133071))

(assert (=> b!1228778 d!134331))

(assert (=> b!1228762 d!134227))

(declare-fun d!134333 () Bool)

(declare-fun lt!558914 () Bool)

(assert (=> d!134333 (= lt!558914 (select (content!555 (t!40559 lt!558868)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697592 () Bool)

(assert (=> d!134333 (= lt!558914 e!697592)))

(declare-fun res!817487 () Bool)

(assert (=> d!134333 (=> (not res!817487) (not e!697592))))

(assert (=> d!134333 (= res!817487 ((_ is Cons!27101) (t!40559 lt!558868)))))

(assert (=> d!134333 (= (contains!7077 (t!40559 lt!558868) #b0000000000000000000000000000000000000000000000000000000000000000) lt!558914)))

(declare-fun b!1228935 () Bool)

(declare-fun e!697593 () Bool)

(assert (=> b!1228935 (= e!697592 e!697593)))

(declare-fun res!817488 () Bool)

(assert (=> b!1228935 (=> res!817488 e!697593)))

(assert (=> b!1228935 (= res!817488 (= (h!28310 (t!40559 lt!558868)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228936 () Bool)

(assert (=> b!1228936 (= e!697593 (contains!7077 (t!40559 (t!40559 lt!558868)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134333 res!817487) b!1228935))

(assert (= (and b!1228935 (not res!817488)) b!1228936))

(assert (=> d!134333 m!1133035))

(declare-fun m!1133073 () Bool)

(assert (=> d!134333 m!1133073))

(declare-fun m!1133075 () Bool)

(assert (=> b!1228936 m!1133075))

(assert (=> b!1228798 d!134333))

(declare-fun d!134335 () Bool)

(assert (=> d!134335 (= (validKeyInArray!0 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228849 d!134335))

(declare-fun d!134337 () Bool)

(declare-fun res!817489 () Bool)

(declare-fun e!697594 () Bool)

(assert (=> d!134337 (=> res!817489 e!697594)))

(assert (=> d!134337 (= res!817489 (= (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k0!2913))))

(assert (=> d!134337 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!697594)))

(declare-fun b!1228937 () Bool)

(declare-fun e!697595 () Bool)

(assert (=> b!1228937 (= e!697594 e!697595)))

(declare-fun res!817490 () Bool)

(assert (=> b!1228937 (=> (not res!817490) (not e!697595))))

(assert (=> b!1228937 (= res!817490 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38769 a!3806)))))

(declare-fun b!1228938 () Bool)

(assert (=> b!1228938 (= e!697595 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!134337 (not res!817489)) b!1228937))

(assert (= (and b!1228937 res!817490) b!1228938))

(declare-fun m!1133077 () Bool)

(assert (=> d!134337 m!1133077))

(declare-fun m!1133079 () Bool)

(assert (=> b!1228938 m!1133079))

(assert (=> b!1228826 d!134337))

(declare-fun lt!558915 () Bool)

(declare-fun d!134339 () Bool)

(assert (=> d!134339 (= lt!558915 (select (content!555 (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)) (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!697596 () Bool)

(assert (=> d!134339 (= lt!558915 e!697596)))

(declare-fun res!817491 () Bool)

(assert (=> d!134339 (=> (not res!817491) (not e!697596))))

(assert (=> d!134339 (= res!817491 ((_ is Cons!27101) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)))))

(assert (=> d!134339 (= (contains!7077 (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823) (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!558915)))

(declare-fun b!1228939 () Bool)

(declare-fun e!697597 () Bool)

(assert (=> b!1228939 (= e!697596 e!697597)))

(declare-fun res!817492 () Bool)

(assert (=> b!1228939 (=> res!817492 e!697597)))

(assert (=> b!1228939 (= res!817492 (= (h!28310 (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)) (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228940 () Bool)

(assert (=> b!1228940 (= e!697597 (contains!7077 (t!40559 (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)) (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134339 res!817491) b!1228939))

(assert (= (and b!1228939 (not res!817492)) b!1228940))

(declare-fun m!1133081 () Bool)

(assert (=> d!134339 m!1133081))

(assert (=> d!134339 m!1132939))

(declare-fun m!1133083 () Bool)

(assert (=> d!134339 m!1133083))

(assert (=> b!1228940 m!1132939))

(declare-fun m!1133085 () Bool)

(assert (=> b!1228940 m!1133085))

(assert (=> b!1228847 d!134339))

(declare-fun e!697601 () Bool)

(declare-fun b!1228941 () Bool)

(assert (=> b!1228941 (= e!697601 (contains!7077 (ite c!120575 (Cons!27101 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)) (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228942 () Bool)

(declare-fun e!697600 () Bool)

(declare-fun call!60828 () Bool)

(assert (=> b!1228942 (= e!697600 call!60828)))

(declare-fun d!134341 () Bool)

(declare-fun res!817493 () Bool)

(declare-fun e!697598 () Bool)

(assert (=> d!134341 (=> res!817493 e!697598)))

(assert (=> d!134341 (= res!817493 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38769 a!3806)))))

(assert (=> d!134341 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120575 (Cons!27101 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823))) e!697598)))

(declare-fun b!1228943 () Bool)

(declare-fun e!697599 () Bool)

(assert (=> b!1228943 (= e!697598 e!697599)))

(declare-fun res!817494 () Bool)

(assert (=> b!1228943 (=> (not res!817494) (not e!697599))))

(assert (=> b!1228943 (= res!817494 (not e!697601))))

(declare-fun res!817495 () Bool)

(assert (=> b!1228943 (=> (not res!817495) (not e!697601))))

(assert (=> b!1228943 (= res!817495 (validKeyInArray!0 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228944 () Bool)

(assert (=> b!1228944 (= e!697599 e!697600)))

(declare-fun c!120587 () Bool)

(assert (=> b!1228944 (= c!120587 (validKeyInArray!0 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun bm!60825 () Bool)

(assert (=> bm!60825 (= call!60828 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120587 (Cons!27101 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120575 (Cons!27101 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823))) (ite c!120575 (Cons!27101 (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)) (Cons!27101 (select (arr!38231 a!3806) from!3184) acc!823)))))))

(declare-fun b!1228945 () Bool)

(assert (=> b!1228945 (= e!697600 call!60828)))

(assert (= (and d!134341 (not res!817493)) b!1228943))

(assert (= (and b!1228943 res!817495) b!1228941))

(assert (= (and b!1228943 res!817494) b!1228944))

(assert (= (and b!1228944 c!120587) b!1228945))

(assert (= (and b!1228944 (not c!120587)) b!1228942))

(assert (= (or b!1228945 b!1228942) bm!60825))

(assert (=> b!1228941 m!1133077))

(assert (=> b!1228941 m!1133077))

(declare-fun m!1133087 () Bool)

(assert (=> b!1228941 m!1133087))

(assert (=> b!1228943 m!1133077))

(assert (=> b!1228943 m!1133077))

(declare-fun m!1133089 () Bool)

(assert (=> b!1228943 m!1133089))

(assert (=> b!1228944 m!1133077))

(assert (=> b!1228944 m!1133077))

(assert (=> b!1228944 m!1133089))

(assert (=> bm!60825 m!1133077))

(declare-fun m!1133091 () Bool)

(assert (=> bm!60825 m!1133091))

(assert (=> bm!60817 d!134341))

(declare-fun d!134343 () Bool)

(declare-fun lt!558916 () Bool)

(assert (=> d!134343 (= lt!558916 (select (content!555 (t!40559 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697602 () Bool)

(assert (=> d!134343 (= lt!558916 e!697602)))

(declare-fun res!817496 () Bool)

(assert (=> d!134343 (=> (not res!817496) (not e!697602))))

(assert (=> d!134343 (= res!817496 ((_ is Cons!27101) (t!40559 acc!823)))))

(assert (=> d!134343 (= (contains!7077 (t!40559 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000) lt!558916)))

(declare-fun b!1228946 () Bool)

(declare-fun e!697603 () Bool)

(assert (=> b!1228946 (= e!697602 e!697603)))

(declare-fun res!817497 () Bool)

(assert (=> b!1228946 (=> res!817497 e!697603)))

(assert (=> b!1228946 (= res!817497 (= (h!28310 (t!40559 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228947 () Bool)

(assert (=> b!1228947 (= e!697603 (contains!7077 (t!40559 (t!40559 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134343 res!817496) b!1228946))

(assert (= (and b!1228946 (not res!817497)) b!1228947))

(assert (=> d!134343 m!1133025))

(declare-fun m!1133093 () Bool)

(assert (=> d!134343 m!1133093))

(declare-fun m!1133095 () Bool)

(assert (=> b!1228947 m!1133095))

(assert (=> b!1228858 d!134343))

(assert (=> b!1228850 d!134335))

(declare-fun d!134345 () Bool)

(declare-fun lt!558917 () Bool)

(assert (=> d!134345 (= lt!558917 (select (content!555 Nil!27102) (select (arr!38231 a!3806) from!3184)))))

(declare-fun e!697604 () Bool)

(assert (=> d!134345 (= lt!558917 e!697604)))

(declare-fun res!817498 () Bool)

(assert (=> d!134345 (=> (not res!817498) (not e!697604))))

(assert (=> d!134345 (= res!817498 ((_ is Cons!27101) Nil!27102))))

(assert (=> d!134345 (= (contains!7077 Nil!27102 (select (arr!38231 a!3806) from!3184)) lt!558917)))

(declare-fun b!1228948 () Bool)

(declare-fun e!697605 () Bool)

(assert (=> b!1228948 (= e!697604 e!697605)))

(declare-fun res!817499 () Bool)

(assert (=> b!1228948 (=> res!817499 e!697605)))

(assert (=> b!1228948 (= res!817499 (= (h!28310 Nil!27102) (select (arr!38231 a!3806) from!3184)))))

(declare-fun b!1228949 () Bool)

(assert (=> b!1228949 (= e!697605 (contains!7077 (t!40559 Nil!27102) (select (arr!38231 a!3806) from!3184)))))

(assert (= (and d!134345 res!817498) b!1228948))

(assert (= (and b!1228948 (not res!817499)) b!1228949))

(declare-fun m!1133097 () Bool)

(assert (=> d!134345 m!1133097))

(assert (=> d!134345 m!1132791))

(declare-fun m!1133099 () Bool)

(assert (=> d!134345 m!1133099))

(assert (=> b!1228949 m!1132791))

(declare-fun m!1133101 () Bool)

(assert (=> b!1228949 m!1133101))

(assert (=> b!1228827 d!134345))

(assert (=> d!134253 d!134325))

(assert (=> b!1228830 d!134227))

(assert (=> b!1228829 d!134227))

(check-sat (not d!134327) (not b!1228916) (not b!1228941) (not b!1228906) (not d!134317) (not b!1228943) (not d!134309) (not d!134339) (not b!1228921) (not d!134343) (not b!1228934) (not d!134345) (not b!1228930) (not b!1228904) (not b!1228949) (not b!1228931) (not b!1228918) (not d!134331) (not b!1228944) (not b!1228922) (not b!1228905) (not b!1228938) (not b!1228919) (not d!134321) (not b!1228940) (not b!1228914) (not bm!60825) (not b!1228936) (not b!1228928) (not d!134333) (not b!1228908) (not bm!60823) (not bm!60824) (not b!1228947) (not b!1228925) (not b!1228927) (not d!134313) (not b!1228915))
(check-sat)
