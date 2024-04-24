; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92952 () Bool)

(assert start!92952)

(declare-fun b!1054740 () Bool)

(declare-fun e!599117 () Bool)

(declare-fun e!599118 () Bool)

(assert (=> b!1054740 (= e!599117 (not e!599118))))

(declare-fun res!702954 () Bool)

(assert (=> b!1054740 (=> res!702954 e!599118)))

(declare-fun lt!465655 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054740 (= res!702954 (bvsle lt!465655 i!1381))))

(declare-datatypes ((array!66487 0))(
  ( (array!66488 (arr!31972 (Array (_ BitVec 32) (_ BitVec 64))) (size!32509 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66487)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1054740 (= (select (store (arr!31972 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465655) k0!2747)))

(declare-fun res!702956 () Bool)

(declare-fun e!599115 () Bool)

(assert (=> start!92952 (=> (not res!702956) (not e!599115))))

(assert (=> start!92952 (= res!702956 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32509 a!3488)) (bvslt (size!32509 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92952 e!599115))

(assert (=> start!92952 true))

(declare-fun array_inv!24754 (array!66487) Bool)

(assert (=> start!92952 (array_inv!24754 a!3488)))

(declare-fun b!1054741 () Bool)

(declare-fun res!702955 () Bool)

(assert (=> b!1054741 (=> (not res!702955) (not e!599115))))

(declare-datatypes ((List!22254 0))(
  ( (Nil!22251) (Cons!22250 (h!23468 (_ BitVec 64)) (t!31553 List!22254)) )
))
(declare-fun arrayNoDuplicates!0 (array!66487 (_ BitVec 32) List!22254) Bool)

(assert (=> b!1054741 (= res!702955 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22251))))

(declare-fun b!1054742 () Bool)

(declare-fun arrayContainsKey!0 (array!66487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054742 (= e!599118 (arrayContainsKey!0 a!3488 k0!2747 lt!465655))))

(declare-fun b!1054743 () Bool)

(declare-fun e!599119 () Bool)

(assert (=> b!1054743 (= e!599119 e!599117)))

(declare-fun res!702953 () Bool)

(assert (=> b!1054743 (=> (not res!702953) (not e!599117))))

(assert (=> b!1054743 (= res!702953 (not (= lt!465655 i!1381)))))

(declare-fun lt!465656 () array!66487)

(declare-fun arrayScanForKey!0 (array!66487 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054743 (= lt!465655 (arrayScanForKey!0 lt!465656 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054744 () Bool)

(declare-fun res!702958 () Bool)

(assert (=> b!1054744 (=> (not res!702958) (not e!599115))))

(assert (=> b!1054744 (= res!702958 (= (select (arr!31972 a!3488) i!1381) k0!2747))))

(declare-fun b!1054745 () Bool)

(declare-fun res!702957 () Bool)

(assert (=> b!1054745 (=> (not res!702957) (not e!599115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054745 (= res!702957 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054746 () Bool)

(assert (=> b!1054746 (= e!599115 e!599119)))

(declare-fun res!702959 () Bool)

(assert (=> b!1054746 (=> (not res!702959) (not e!599119))))

(assert (=> b!1054746 (= res!702959 (arrayContainsKey!0 lt!465656 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054746 (= lt!465656 (array!66488 (store (arr!31972 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32509 a!3488)))))

(assert (= (and start!92952 res!702956) b!1054741))

(assert (= (and b!1054741 res!702955) b!1054745))

(assert (= (and b!1054745 res!702957) b!1054744))

(assert (= (and b!1054744 res!702958) b!1054746))

(assert (= (and b!1054746 res!702959) b!1054743))

(assert (= (and b!1054743 res!702953) b!1054740))

(assert (= (and b!1054740 (not res!702954)) b!1054742))

(declare-fun m!975383 () Bool)

(assert (=> b!1054745 m!975383))

(declare-fun m!975385 () Bool)

(assert (=> b!1054743 m!975385))

(declare-fun m!975387 () Bool)

(assert (=> b!1054746 m!975387))

(declare-fun m!975389 () Bool)

(assert (=> b!1054746 m!975389))

(declare-fun m!975391 () Bool)

(assert (=> b!1054741 m!975391))

(declare-fun m!975393 () Bool)

(assert (=> start!92952 m!975393))

(declare-fun m!975395 () Bool)

(assert (=> b!1054744 m!975395))

(assert (=> b!1054740 m!975389))

(declare-fun m!975397 () Bool)

(assert (=> b!1054740 m!975397))

(declare-fun m!975399 () Bool)

(assert (=> b!1054742 m!975399))

(check-sat (not b!1054743) (not b!1054742) (not b!1054746) (not b!1054745) (not b!1054741) (not start!92952))
(check-sat)
(get-model)

(declare-fun d!128365 () Bool)

(declare-fun lt!465671 () (_ BitVec 32))

(assert (=> d!128365 (and (or (bvslt lt!465671 #b00000000000000000000000000000000) (bvsge lt!465671 (size!32509 lt!465656)) (and (bvsge lt!465671 #b00000000000000000000000000000000) (bvslt lt!465671 (size!32509 lt!465656)))) (bvsge lt!465671 #b00000000000000000000000000000000) (bvslt lt!465671 (size!32509 lt!465656)) (= (select (arr!31972 lt!465656) lt!465671) k0!2747))))

(declare-fun e!599152 () (_ BitVec 32))

(assert (=> d!128365 (= lt!465671 e!599152)))

(declare-fun c!107363 () Bool)

(assert (=> d!128365 (= c!107363 (= (select (arr!31972 lt!465656) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128365 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32509 lt!465656)) (bvslt (size!32509 lt!465656) #b01111111111111111111111111111111))))

(assert (=> d!128365 (= (arrayScanForKey!0 lt!465656 k0!2747 #b00000000000000000000000000000000) lt!465671)))

(declare-fun b!1054793 () Bool)

(assert (=> b!1054793 (= e!599152 #b00000000000000000000000000000000)))

(declare-fun b!1054794 () Bool)

(assert (=> b!1054794 (= e!599152 (arrayScanForKey!0 lt!465656 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128365 c!107363) b!1054793))

(assert (= (and d!128365 (not c!107363)) b!1054794))

(declare-fun m!975437 () Bool)

(assert (=> d!128365 m!975437))

(declare-fun m!975439 () Bool)

(assert (=> d!128365 m!975439))

(declare-fun m!975441 () Bool)

(assert (=> b!1054794 m!975441))

(assert (=> b!1054743 d!128365))

(declare-fun d!128369 () Bool)

(assert (=> d!128369 (= (array_inv!24754 a!3488) (bvsge (size!32509 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92952 d!128369))

(declare-fun d!128371 () Bool)

(declare-fun res!703012 () Bool)

(declare-fun e!599163 () Bool)

(assert (=> d!128371 (=> res!703012 e!599163)))

(assert (=> d!128371 (= res!703012 (= (select (arr!31972 a!3488) lt!465655) k0!2747))))

(assert (=> d!128371 (= (arrayContainsKey!0 a!3488 k0!2747 lt!465655) e!599163)))

(declare-fun b!1054805 () Bool)

(declare-fun e!599164 () Bool)

(assert (=> b!1054805 (= e!599163 e!599164)))

(declare-fun res!703013 () Bool)

(assert (=> b!1054805 (=> (not res!703013) (not e!599164))))

(assert (=> b!1054805 (= res!703013 (bvslt (bvadd lt!465655 #b00000000000000000000000000000001) (size!32509 a!3488)))))

(declare-fun b!1054806 () Bool)

(assert (=> b!1054806 (= e!599164 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!465655 #b00000000000000000000000000000001)))))

(assert (= (and d!128371 (not res!703012)) b!1054805))

(assert (= (and b!1054805 res!703013) b!1054806))

(declare-fun m!975447 () Bool)

(assert (=> d!128371 m!975447))

(declare-fun m!975449 () Bool)

(assert (=> b!1054806 m!975449))

(assert (=> b!1054742 d!128371))

(declare-fun bm!44818 () Bool)

(declare-fun call!44821 () Bool)

(declare-fun c!107371 () Bool)

(assert (=> bm!44818 (= call!44821 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107371 (Cons!22250 (select (arr!31972 a!3488) #b00000000000000000000000000000000) Nil!22251) Nil!22251)))))

(declare-fun b!1054833 () Bool)

(declare-fun e!599185 () Bool)

(declare-fun e!599187 () Bool)

(assert (=> b!1054833 (= e!599185 e!599187)))

(declare-fun res!703027 () Bool)

(assert (=> b!1054833 (=> (not res!703027) (not e!599187))))

(declare-fun e!599186 () Bool)

(assert (=> b!1054833 (= res!703027 (not e!599186))))

(declare-fun res!703028 () Bool)

(assert (=> b!1054833 (=> (not res!703028) (not e!599186))))

(assert (=> b!1054833 (= res!703028 (validKeyInArray!0 (select (arr!31972 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054834 () Bool)

(declare-fun e!599184 () Bool)

(assert (=> b!1054834 (= e!599184 call!44821)))

(declare-fun b!1054836 () Bool)

(assert (=> b!1054836 (= e!599187 e!599184)))

(assert (=> b!1054836 (= c!107371 (validKeyInArray!0 (select (arr!31972 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054837 () Bool)

(assert (=> b!1054837 (= e!599184 call!44821)))

(declare-fun b!1054835 () Bool)

(declare-fun contains!6194 (List!22254 (_ BitVec 64)) Bool)

(assert (=> b!1054835 (= e!599186 (contains!6194 Nil!22251 (select (arr!31972 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128377 () Bool)

(declare-fun res!703026 () Bool)

(assert (=> d!128377 (=> res!703026 e!599185)))

(assert (=> d!128377 (= res!703026 (bvsge #b00000000000000000000000000000000 (size!32509 a!3488)))))

(assert (=> d!128377 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22251) e!599185)))

(assert (= (and d!128377 (not res!703026)) b!1054833))

(assert (= (and b!1054833 res!703028) b!1054835))

(assert (= (and b!1054833 res!703027) b!1054836))

(assert (= (and b!1054836 c!107371) b!1054837))

(assert (= (and b!1054836 (not c!107371)) b!1054834))

(assert (= (or b!1054837 b!1054834) bm!44818))

(declare-fun m!975457 () Bool)

(assert (=> bm!44818 m!975457))

(declare-fun m!975459 () Bool)

(assert (=> bm!44818 m!975459))

(assert (=> b!1054833 m!975457))

(assert (=> b!1054833 m!975457))

(declare-fun m!975461 () Bool)

(assert (=> b!1054833 m!975461))

(assert (=> b!1054836 m!975457))

(assert (=> b!1054836 m!975457))

(assert (=> b!1054836 m!975461))

(assert (=> b!1054835 m!975457))

(assert (=> b!1054835 m!975457))

(declare-fun m!975463 () Bool)

(assert (=> b!1054835 m!975463))

(assert (=> b!1054741 d!128377))

(declare-fun d!128383 () Bool)

(declare-fun res!703032 () Bool)

(declare-fun e!599192 () Bool)

(assert (=> d!128383 (=> res!703032 e!599192)))

(assert (=> d!128383 (= res!703032 (= (select (arr!31972 lt!465656) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128383 (= (arrayContainsKey!0 lt!465656 k0!2747 #b00000000000000000000000000000000) e!599192)))

(declare-fun b!1054843 () Bool)

(declare-fun e!599193 () Bool)

(assert (=> b!1054843 (= e!599192 e!599193)))

(declare-fun res!703033 () Bool)

(assert (=> b!1054843 (=> (not res!703033) (not e!599193))))

(assert (=> b!1054843 (= res!703033 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32509 lt!465656)))))

(declare-fun b!1054844 () Bool)

(assert (=> b!1054844 (= e!599193 (arrayContainsKey!0 lt!465656 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128383 (not res!703032)) b!1054843))

(assert (= (and b!1054843 res!703033) b!1054844))

(assert (=> d!128383 m!975439))

(declare-fun m!975469 () Bool)

(assert (=> b!1054844 m!975469))

(assert (=> b!1054746 d!128383))

(declare-fun d!128385 () Bool)

(assert (=> d!128385 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054745 d!128385))

(check-sat (not b!1054794) (not b!1054806) (not b!1054835) (not b!1054833) (not b!1054844) (not bm!44818) (not b!1054836))
(check-sat)
