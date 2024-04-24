; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103072 () Bool)

(assert start!103072)

(declare-fun res!824550 () Bool)

(declare-fun e!701527 () Bool)

(assert (=> start!103072 (=> (not res!824550) (not e!701527))))

(declare-datatypes ((array!79715 0))(
  ( (array!79716 (arr!38459 (Array (_ BitVec 32) (_ BitVec 64))) (size!38996 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79715)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103072 (= res!824550 (and (bvslt (size!38996 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38996 a!3835))))))

(assert (=> start!103072 e!701527))

(declare-fun array_inv!29397 (array!79715) Bool)

(assert (=> start!103072 (array_inv!29397 a!3835)))

(assert (=> start!103072 true))

(declare-fun b!1237307 () Bool)

(declare-fun e!701526 () Bool)

(assert (=> b!1237307 (= e!701526 (not true))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1237307 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-datatypes ((Unit!40958 0))(
  ( (Unit!40959) )
))
(declare-fun lt!561102 () Unit!40958)

(declare-datatypes ((List!27245 0))(
  ( (Nil!27242) (Cons!27241 (h!28459 (_ BitVec 64)) (t!40700 List!27245)) )
))
(declare-fun acc!846 () List!27245)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79715 (_ BitVec 32) (_ BitVec 64) List!27245) Unit!40958)

(assert (=> b!1237307 (= lt!561102 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1237308 () Bool)

(declare-fun res!824551 () Bool)

(assert (=> b!1237308 (=> (not res!824551) (not e!701526))))

(declare-fun arrayNoDuplicates!0 (array!79715 (_ BitVec 32) List!27245) Bool)

(assert (=> b!1237308 (= res!824551 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1237309 () Bool)

(declare-fun res!824548 () Bool)

(assert (=> b!1237309 (=> (not res!824548) (not e!701527))))

(assert (=> b!1237309 (= res!824548 (not (= from!3213 (bvsub (size!38996 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237310 () Bool)

(declare-fun res!824556 () Bool)

(assert (=> b!1237310 (=> (not res!824556) (not e!701527))))

(declare-fun noDuplicate!1897 (List!27245) Bool)

(assert (=> b!1237310 (= res!824556 (noDuplicate!1897 acc!846))))

(declare-fun b!1237311 () Bool)

(declare-fun e!701528 () Unit!40958)

(declare-fun lt!561103 () Unit!40958)

(assert (=> b!1237311 (= e!701528 lt!561103)))

(declare-fun lt!561106 () List!27245)

(assert (=> b!1237311 (= lt!561106 (Cons!27241 (select (arr!38459 a!3835) from!3213) acc!846))))

(declare-fun lt!561107 () Unit!40958)

(declare-fun lemmaListSubSeqRefl!0 (List!27245) Unit!40958)

(assert (=> b!1237311 (= lt!561107 (lemmaListSubSeqRefl!0 lt!561106))))

(declare-fun subseq!554 (List!27245 List!27245) Bool)

(assert (=> b!1237311 (subseq!554 lt!561106 lt!561106)))

(declare-fun lt!561104 () Unit!40958)

(declare-fun subseqTail!47 (List!27245 List!27245) Unit!40958)

(assert (=> b!1237311 (= lt!561104 (subseqTail!47 lt!561106 lt!561106))))

(assert (=> b!1237311 (subseq!554 acc!846 lt!561106)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79715 List!27245 List!27245 (_ BitVec 32)) Unit!40958)

(assert (=> b!1237311 (= lt!561103 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561106 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1237311 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1237312 () Bool)

(declare-fun res!824554 () Bool)

(assert (=> b!1237312 (=> (not res!824554) (not e!701527))))

(declare-fun contains!7316 (List!27245 (_ BitVec 64)) Bool)

(assert (=> b!1237312 (= res!824554 (not (contains!7316 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237313 () Bool)

(declare-fun res!824552 () Bool)

(assert (=> b!1237313 (=> (not res!824552) (not e!701527))))

(assert (=> b!1237313 (= res!824552 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237314 () Bool)

(assert (=> b!1237314 (= e!701527 e!701526)))

(declare-fun res!824553 () Bool)

(assert (=> b!1237314 (=> (not res!824553) (not e!701526))))

(assert (=> b!1237314 (= res!824553 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38996 a!3835))))))

(declare-fun lt!561105 () Unit!40958)

(assert (=> b!1237314 (= lt!561105 e!701528)))

(declare-fun c!121247 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237314 (= c!121247 (validKeyInArray!0 (select (arr!38459 a!3835) from!3213)))))

(declare-fun b!1237315 () Bool)

(declare-fun res!824555 () Bool)

(assert (=> b!1237315 (=> (not res!824555) (not e!701527))))

(assert (=> b!1237315 (= res!824555 (not (contains!7316 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237316 () Bool)

(declare-fun Unit!40960 () Unit!40958)

(assert (=> b!1237316 (= e!701528 Unit!40960)))

(declare-fun b!1237317 () Bool)

(declare-fun res!824549 () Bool)

(assert (=> b!1237317 (=> (not res!824549) (not e!701527))))

(assert (=> b!1237317 (= res!824549 (contains!7316 acc!846 k0!2925))))

(assert (= (and start!103072 res!824550) b!1237310))

(assert (= (and b!1237310 res!824556) b!1237312))

(assert (= (and b!1237312 res!824554) b!1237315))

(assert (= (and b!1237315 res!824555) b!1237313))

(assert (= (and b!1237313 res!824552) b!1237317))

(assert (= (and b!1237317 res!824549) b!1237309))

(assert (= (and b!1237309 res!824548) b!1237314))

(assert (= (and b!1237314 c!121247) b!1237311))

(assert (= (and b!1237314 (not c!121247)) b!1237316))

(assert (= (and b!1237314 res!824553) b!1237308))

(assert (= (and b!1237308 res!824551) b!1237307))

(declare-fun m!1141475 () Bool)

(assert (=> b!1237312 m!1141475))

(declare-fun m!1141477 () Bool)

(assert (=> b!1237315 m!1141477))

(declare-fun m!1141479 () Bool)

(assert (=> start!103072 m!1141479))

(declare-fun m!1141481 () Bool)

(assert (=> b!1237313 m!1141481))

(declare-fun m!1141483 () Bool)

(assert (=> b!1237311 m!1141483))

(declare-fun m!1141485 () Bool)

(assert (=> b!1237311 m!1141485))

(declare-fun m!1141487 () Bool)

(assert (=> b!1237311 m!1141487))

(declare-fun m!1141489 () Bool)

(assert (=> b!1237311 m!1141489))

(declare-fun m!1141491 () Bool)

(assert (=> b!1237311 m!1141491))

(declare-fun m!1141493 () Bool)

(assert (=> b!1237311 m!1141493))

(declare-fun m!1141495 () Bool)

(assert (=> b!1237311 m!1141495))

(declare-fun m!1141497 () Bool)

(assert (=> b!1237317 m!1141497))

(declare-fun m!1141499 () Bool)

(assert (=> b!1237307 m!1141499))

(declare-fun m!1141501 () Bool)

(assert (=> b!1237307 m!1141501))

(declare-fun m!1141503 () Bool)

(assert (=> b!1237310 m!1141503))

(assert (=> b!1237314 m!1141493))

(assert (=> b!1237314 m!1141493))

(declare-fun m!1141505 () Bool)

(assert (=> b!1237314 m!1141505))

(assert (=> b!1237308 m!1141491))

(check-sat (not b!1237308) (not b!1237314) (not b!1237310) (not start!103072) (not b!1237317) (not b!1237311) (not b!1237312) (not b!1237315) (not b!1237313) (not b!1237307))
(check-sat)
