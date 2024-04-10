; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102692 () Bool)

(assert start!102692)

(declare-fun b!1234306 () Bool)

(declare-fun res!822487 () Bool)

(declare-fun e!700059 () Bool)

(assert (=> b!1234306 (=> (not res!822487) (not e!700059))))

(declare-datatypes ((List!27173 0))(
  ( (Nil!27170) (Cons!27169 (h!28378 (_ BitVec 64)) (t!40636 List!27173)) )
))
(declare-fun acc!846 () List!27173)

(declare-fun contains!7235 (List!27173 (_ BitVec 64)) Bool)

(assert (=> b!1234306 (= res!822487 (not (contains!7235 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234307 () Bool)

(declare-fun res!822486 () Bool)

(assert (=> b!1234307 (=> (not res!822486) (not e!700059))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1234307 (= res!822486 (contains!7235 acc!846 k0!2925))))

(declare-fun b!1234308 () Bool)

(declare-fun res!822491 () Bool)

(assert (=> b!1234308 (=> (not res!822491) (not e!700059))))

(declare-datatypes ((array!79582 0))(
  ( (array!79583 (arr!38400 (Array (_ BitVec 32) (_ BitVec 64))) (size!38936 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79582)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234308 (= res!822491 (validKeyInArray!0 (select (arr!38400 a!3835) from!3213)))))

(declare-fun b!1234309 () Bool)

(declare-fun res!822492 () Bool)

(assert (=> b!1234309 (=> (not res!822492) (not e!700059))))

(assert (=> b!1234309 (= res!822492 (not (= from!3213 (bvsub (size!38936 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234310 () Bool)

(declare-fun res!822489 () Bool)

(assert (=> b!1234310 (=> (not res!822489) (not e!700059))))

(declare-fun noDuplicate!1832 (List!27173) Bool)

(assert (=> b!1234310 (= res!822489 (noDuplicate!1832 acc!846))))

(declare-fun b!1234311 () Bool)

(declare-fun res!822490 () Bool)

(assert (=> b!1234311 (=> (not res!822490) (not e!700059))))

(assert (=> b!1234311 (= res!822490 (not (contains!7235 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234313 () Bool)

(declare-fun lt!559835 () List!27173)

(declare-fun isEmpty!1004 (List!27173) Bool)

(assert (=> b!1234313 (= e!700059 (not (not (isEmpty!1004 lt!559835))))))

(declare-fun subseq!507 (List!27173 List!27173) Bool)

(assert (=> b!1234313 (subseq!507 lt!559835 lt!559835)))

(declare-datatypes ((Unit!40870 0))(
  ( (Unit!40871) )
))
(declare-fun lt!559834 () Unit!40870)

(declare-fun lemmaListSubSeqRefl!0 (List!27173) Unit!40870)

(assert (=> b!1234313 (= lt!559834 (lemmaListSubSeqRefl!0 lt!559835))))

(assert (=> b!1234313 (= lt!559835 (Cons!27169 (select (arr!38400 a!3835) from!3213) acc!846))))

(declare-fun res!822488 () Bool)

(assert (=> start!102692 (=> (not res!822488) (not e!700059))))

(assert (=> start!102692 (= res!822488 (and (bvslt (size!38936 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38936 a!3835))))))

(assert (=> start!102692 e!700059))

(declare-fun array_inv!29248 (array!79582) Bool)

(assert (=> start!102692 (array_inv!29248 a!3835)))

(assert (=> start!102692 true))

(declare-fun b!1234312 () Bool)

(declare-fun res!822493 () Bool)

(assert (=> b!1234312 (=> (not res!822493) (not e!700059))))

(declare-fun arrayNoDuplicates!0 (array!79582 (_ BitVec 32) List!27173) Bool)

(assert (=> b!1234312 (= res!822493 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102692 res!822488) b!1234310))

(assert (= (and b!1234310 res!822489) b!1234311))

(assert (= (and b!1234311 res!822490) b!1234306))

(assert (= (and b!1234306 res!822487) b!1234312))

(assert (= (and b!1234312 res!822493) b!1234307))

(assert (= (and b!1234307 res!822486) b!1234309))

(assert (= (and b!1234309 res!822492) b!1234308))

(assert (= (and b!1234308 res!822491) b!1234313))

(declare-fun m!1138295 () Bool)

(assert (=> b!1234313 m!1138295))

(declare-fun m!1138297 () Bool)

(assert (=> b!1234313 m!1138297))

(declare-fun m!1138299 () Bool)

(assert (=> b!1234313 m!1138299))

(declare-fun m!1138301 () Bool)

(assert (=> b!1234313 m!1138301))

(declare-fun m!1138303 () Bool)

(assert (=> b!1234306 m!1138303))

(declare-fun m!1138305 () Bool)

(assert (=> b!1234312 m!1138305))

(declare-fun m!1138307 () Bool)

(assert (=> b!1234307 m!1138307))

(declare-fun m!1138309 () Bool)

(assert (=> b!1234311 m!1138309))

(assert (=> b!1234308 m!1138301))

(assert (=> b!1234308 m!1138301))

(declare-fun m!1138311 () Bool)

(assert (=> b!1234308 m!1138311))

(declare-fun m!1138313 () Bool)

(assert (=> start!102692 m!1138313))

(declare-fun m!1138315 () Bool)

(assert (=> b!1234310 m!1138315))

(check-sat (not b!1234312) (not b!1234308) (not b!1234310) (not b!1234307) (not start!102692) (not b!1234313) (not b!1234306) (not b!1234311))
(check-sat)
(get-model)

(declare-fun d!135387 () Bool)

(get-info :version)

(assert (=> d!135387 (= (isEmpty!1004 lt!559835) ((_ is Nil!27170) lt!559835))))

(assert (=> b!1234313 d!135387))

(declare-fun b!1234352 () Bool)

(declare-fun e!700078 () Bool)

(assert (=> b!1234352 (= e!700078 (subseq!507 (t!40636 lt!559835) (t!40636 lt!559835)))))

(declare-fun b!1234353 () Bool)

(declare-fun e!700079 () Bool)

(assert (=> b!1234353 (= e!700079 (subseq!507 lt!559835 (t!40636 lt!559835)))))

(declare-fun d!135389 () Bool)

(declare-fun res!822530 () Bool)

(declare-fun e!700080 () Bool)

(assert (=> d!135389 (=> res!822530 e!700080)))

(assert (=> d!135389 (= res!822530 ((_ is Nil!27170) lt!559835))))

(assert (=> d!135389 (= (subseq!507 lt!559835 lt!559835) e!700080)))

(declare-fun b!1234351 () Bool)

(declare-fun e!700081 () Bool)

(assert (=> b!1234351 (= e!700081 e!700079)))

(declare-fun res!822532 () Bool)

(assert (=> b!1234351 (=> res!822532 e!700079)))

(assert (=> b!1234351 (= res!822532 e!700078)))

(declare-fun res!822533 () Bool)

(assert (=> b!1234351 (=> (not res!822533) (not e!700078))))

(assert (=> b!1234351 (= res!822533 (= (h!28378 lt!559835) (h!28378 lt!559835)))))

(declare-fun b!1234350 () Bool)

(assert (=> b!1234350 (= e!700080 e!700081)))

(declare-fun res!822531 () Bool)

(assert (=> b!1234350 (=> (not res!822531) (not e!700081))))

(assert (=> b!1234350 (= res!822531 ((_ is Cons!27169) lt!559835))))

(assert (= (and d!135389 (not res!822530)) b!1234350))

(assert (= (and b!1234350 res!822531) b!1234351))

(assert (= (and b!1234351 res!822533) b!1234352))

(assert (= (and b!1234351 (not res!822532)) b!1234353))

(declare-fun m!1138339 () Bool)

(assert (=> b!1234352 m!1138339))

(declare-fun m!1138341 () Bool)

(assert (=> b!1234353 m!1138341))

(assert (=> b!1234313 d!135389))

(declare-fun d!135397 () Bool)

(assert (=> d!135397 (subseq!507 lt!559835 lt!559835)))

(declare-fun lt!559850 () Unit!40870)

(declare-fun choose!36 (List!27173) Unit!40870)

(assert (=> d!135397 (= lt!559850 (choose!36 lt!559835))))

(assert (=> d!135397 (= (lemmaListSubSeqRefl!0 lt!559835) lt!559850)))

(declare-fun bs!34694 () Bool)

(assert (= bs!34694 d!135397))

(assert (=> bs!34694 m!1138297))

(declare-fun m!1138349 () Bool)

(assert (=> bs!34694 m!1138349))

(assert (=> b!1234313 d!135397))

(declare-fun bm!60990 () Bool)

(declare-fun c!120777 () Bool)

(declare-fun call!60993 () Bool)

(assert (=> bm!60990 (= call!60993 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120777 (Cons!27169 (select (arr!38400 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1234401 () Bool)

(declare-fun e!700124 () Bool)

(assert (=> b!1234401 (= e!700124 call!60993)))

(declare-fun b!1234402 () Bool)

(assert (=> b!1234402 (= e!700124 call!60993)))

(declare-fun d!135403 () Bool)

(declare-fun res!822567 () Bool)

(declare-fun e!700125 () Bool)

(assert (=> d!135403 (=> res!822567 e!700125)))

(assert (=> d!135403 (= res!822567 (bvsge from!3213 (size!38936 a!3835)))))

(assert (=> d!135403 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!700125)))

(declare-fun b!1234403 () Bool)

(declare-fun e!700122 () Bool)

(assert (=> b!1234403 (= e!700125 e!700122)))

(declare-fun res!822569 () Bool)

(assert (=> b!1234403 (=> (not res!822569) (not e!700122))))

(declare-fun e!700123 () Bool)

(assert (=> b!1234403 (= res!822569 (not e!700123))))

(declare-fun res!822568 () Bool)

(assert (=> b!1234403 (=> (not res!822568) (not e!700123))))

(assert (=> b!1234403 (= res!822568 (validKeyInArray!0 (select (arr!38400 a!3835) from!3213)))))

(declare-fun b!1234404 () Bool)

(assert (=> b!1234404 (= e!700122 e!700124)))

(assert (=> b!1234404 (= c!120777 (validKeyInArray!0 (select (arr!38400 a!3835) from!3213)))))

(declare-fun b!1234405 () Bool)

(assert (=> b!1234405 (= e!700123 (contains!7235 acc!846 (select (arr!38400 a!3835) from!3213)))))

(assert (= (and d!135403 (not res!822567)) b!1234403))

(assert (= (and b!1234403 res!822568) b!1234405))

(assert (= (and b!1234403 res!822569) b!1234404))

(assert (= (and b!1234404 c!120777) b!1234402))

(assert (= (and b!1234404 (not c!120777)) b!1234401))

(assert (= (or b!1234402 b!1234401) bm!60990))

(assert (=> bm!60990 m!1138301))

(declare-fun m!1138369 () Bool)

(assert (=> bm!60990 m!1138369))

(assert (=> b!1234403 m!1138301))

(assert (=> b!1234403 m!1138301))

(assert (=> b!1234403 m!1138311))

(assert (=> b!1234404 m!1138301))

(assert (=> b!1234404 m!1138301))

(assert (=> b!1234404 m!1138311))

(assert (=> b!1234405 m!1138301))

(assert (=> b!1234405 m!1138301))

(declare-fun m!1138371 () Bool)

(assert (=> b!1234405 m!1138371))

(assert (=> b!1234312 d!135403))

(declare-fun d!135415 () Bool)

(declare-fun lt!559856 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!580 (List!27173) (InoxSet (_ BitVec 64)))

(assert (=> d!135415 (= lt!559856 (select (content!580 acc!846) k0!2925))))

(declare-fun e!700147 () Bool)

(assert (=> d!135415 (= lt!559856 e!700147)))

(declare-fun res!822589 () Bool)

(assert (=> d!135415 (=> (not res!822589) (not e!700147))))

(assert (=> d!135415 (= res!822589 ((_ is Cons!27169) acc!846))))

(assert (=> d!135415 (= (contains!7235 acc!846 k0!2925) lt!559856)))

(declare-fun b!1234427 () Bool)

(declare-fun e!700146 () Bool)

(assert (=> b!1234427 (= e!700147 e!700146)))

(declare-fun res!822590 () Bool)

(assert (=> b!1234427 (=> res!822590 e!700146)))

(assert (=> b!1234427 (= res!822590 (= (h!28378 acc!846) k0!2925))))

(declare-fun b!1234428 () Bool)

(assert (=> b!1234428 (= e!700146 (contains!7235 (t!40636 acc!846) k0!2925))))

(assert (= (and d!135415 res!822589) b!1234427))

(assert (= (and b!1234427 (not res!822590)) b!1234428))

(declare-fun m!1138385 () Bool)

(assert (=> d!135415 m!1138385))

(declare-fun m!1138387 () Bool)

(assert (=> d!135415 m!1138387))

(declare-fun m!1138389 () Bool)

(assert (=> b!1234428 m!1138389))

(assert (=> b!1234307 d!135415))

(declare-fun d!135425 () Bool)

(assert (=> d!135425 (= (validKeyInArray!0 (select (arr!38400 a!3835) from!3213)) (and (not (= (select (arr!38400 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38400 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1234308 d!135425))

(declare-fun d!135431 () Bool)

(declare-fun res!822605 () Bool)

(declare-fun e!700162 () Bool)

(assert (=> d!135431 (=> res!822605 e!700162)))

(assert (=> d!135431 (= res!822605 ((_ is Nil!27170) acc!846))))

(assert (=> d!135431 (= (noDuplicate!1832 acc!846) e!700162)))

(declare-fun b!1234443 () Bool)

(declare-fun e!700163 () Bool)

(assert (=> b!1234443 (= e!700162 e!700163)))

(declare-fun res!822606 () Bool)

(assert (=> b!1234443 (=> (not res!822606) (not e!700163))))

(assert (=> b!1234443 (= res!822606 (not (contains!7235 (t!40636 acc!846) (h!28378 acc!846))))))

(declare-fun b!1234444 () Bool)

(assert (=> b!1234444 (= e!700163 (noDuplicate!1832 (t!40636 acc!846)))))

(assert (= (and d!135431 (not res!822605)) b!1234443))

(assert (= (and b!1234443 res!822606) b!1234444))

(declare-fun m!1138395 () Bool)

(assert (=> b!1234443 m!1138395))

(declare-fun m!1138397 () Bool)

(assert (=> b!1234444 m!1138397))

(assert (=> b!1234310 d!135431))

(declare-fun d!135435 () Bool)

(declare-fun lt!559857 () Bool)

(assert (=> d!135435 (= lt!559857 (select (content!580 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700173 () Bool)

(assert (=> d!135435 (= lt!559857 e!700173)))

(declare-fun res!822615 () Bool)

(assert (=> d!135435 (=> (not res!822615) (not e!700173))))

(assert (=> d!135435 (= res!822615 ((_ is Cons!27169) acc!846))))

(assert (=> d!135435 (= (contains!7235 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559857)))

(declare-fun b!1234453 () Bool)

(declare-fun e!700172 () Bool)

(assert (=> b!1234453 (= e!700173 e!700172)))

(declare-fun res!822616 () Bool)

(assert (=> b!1234453 (=> res!822616 e!700172)))

(assert (=> b!1234453 (= res!822616 (= (h!28378 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234454 () Bool)

(assert (=> b!1234454 (= e!700172 (contains!7235 (t!40636 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135435 res!822615) b!1234453))

(assert (= (and b!1234453 (not res!822616)) b!1234454))

(assert (=> d!135435 m!1138385))

(declare-fun m!1138399 () Bool)

(assert (=> d!135435 m!1138399))

(declare-fun m!1138401 () Bool)

(assert (=> b!1234454 m!1138401))

(assert (=> b!1234306 d!135435))

(declare-fun d!135437 () Bool)

(assert (=> d!135437 (= (array_inv!29248 a!3835) (bvsge (size!38936 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!102692 d!135437))

(declare-fun d!135439 () Bool)

(declare-fun lt!559858 () Bool)

(assert (=> d!135439 (= lt!559858 (select (content!580 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700179 () Bool)

(assert (=> d!135439 (= lt!559858 e!700179)))

(declare-fun res!822621 () Bool)

(assert (=> d!135439 (=> (not res!822621) (not e!700179))))

(assert (=> d!135439 (= res!822621 ((_ is Cons!27169) acc!846))))

(assert (=> d!135439 (= (contains!7235 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559858)))

(declare-fun b!1234459 () Bool)

(declare-fun e!700178 () Bool)

(assert (=> b!1234459 (= e!700179 e!700178)))

(declare-fun res!822622 () Bool)

(assert (=> b!1234459 (=> res!822622 e!700178)))

(assert (=> b!1234459 (= res!822622 (= (h!28378 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234460 () Bool)

(assert (=> b!1234460 (= e!700178 (contains!7235 (t!40636 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135439 res!822621) b!1234459))

(assert (= (and b!1234459 (not res!822622)) b!1234460))

(assert (=> d!135439 m!1138385))

(declare-fun m!1138407 () Bool)

(assert (=> d!135439 m!1138407))

(declare-fun m!1138409 () Bool)

(assert (=> b!1234460 m!1138409))

(assert (=> b!1234311 d!135439))

(check-sat (not d!135439) (not b!1234460) (not b!1234353) (not b!1234352) (not d!135415) (not d!135397) (not bm!60990) (not b!1234454) (not b!1234403) (not b!1234404) (not d!135435) (not b!1234444) (not b!1234405) (not b!1234443) (not b!1234428))
(check-sat)
