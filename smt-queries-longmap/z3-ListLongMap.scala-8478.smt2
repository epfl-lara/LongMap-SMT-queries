; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103276 () Bool)

(assert start!103276)

(declare-fun b!1239297 () Bool)

(declare-fun e!702349 () Bool)

(assert (=> b!1239297 (= e!702349 false)))

(declare-datatypes ((array!79783 0))(
  ( (array!79784 (arr!38492 (Array (_ BitVec 32) (_ BitVec 64))) (size!39030 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79783)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!561494 () Bool)

(declare-datatypes ((List!27366 0))(
  ( (Nil!27363) (Cons!27362 (h!28571 (_ BitVec 64)) (t!40820 List!27366)) )
))
(declare-fun acc!846 () List!27366)

(declare-fun arrayNoDuplicates!0 (array!79783 (_ BitVec 32) List!27366) Bool)

(assert (=> b!1239297 (= lt!561494 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1239298 () Bool)

(declare-datatypes ((Unit!41019 0))(
  ( (Unit!41020) )
))
(declare-fun e!702350 () Unit!41019)

(declare-fun Unit!41021 () Unit!41019)

(assert (=> b!1239298 (= e!702350 Unit!41021)))

(declare-fun b!1239299 () Bool)

(declare-fun res!826793 () Bool)

(declare-fun e!702347 () Bool)

(assert (=> b!1239299 (=> (not res!826793) (not e!702347))))

(assert (=> b!1239299 (= res!826793 (not (= from!3213 (bvsub (size!39030 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239300 () Bool)

(declare-fun lt!561493 () Unit!41019)

(assert (=> b!1239300 (= e!702350 lt!561493)))

(declare-fun lt!561496 () List!27366)

(assert (=> b!1239300 (= lt!561496 (Cons!27362 (select (arr!38492 a!3835) from!3213) acc!846))))

(declare-fun lt!561497 () Unit!41019)

(declare-fun lemmaListSubSeqRefl!0 (List!27366) Unit!41019)

(assert (=> b!1239300 (= lt!561497 (lemmaListSubSeqRefl!0 lt!561496))))

(declare-fun subseq!620 (List!27366 List!27366) Bool)

(assert (=> b!1239300 (subseq!620 lt!561496 lt!561496)))

(declare-fun lt!561492 () Unit!41019)

(declare-fun subseqTail!107 (List!27366 List!27366) Unit!41019)

(assert (=> b!1239300 (= lt!561492 (subseqTail!107 lt!561496 lt!561496))))

(assert (=> b!1239300 (subseq!620 acc!846 lt!561496)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79783 List!27366 List!27366 (_ BitVec 32)) Unit!41019)

(assert (=> b!1239300 (= lt!561493 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561496 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239300 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239301 () Bool)

(declare-fun res!826792 () Bool)

(assert (=> b!1239301 (=> (not res!826792) (not e!702347))))

(assert (=> b!1239301 (= res!826792 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239302 () Bool)

(declare-fun res!826790 () Bool)

(assert (=> b!1239302 (=> (not res!826790) (not e!702347))))

(declare-fun contains!7338 (List!27366 (_ BitVec 64)) Bool)

(assert (=> b!1239302 (= res!826790 (not (contains!7338 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239303 () Bool)

(declare-fun res!826789 () Bool)

(assert (=> b!1239303 (=> (not res!826789) (not e!702347))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1239303 (= res!826789 (contains!7338 acc!846 k0!2925))))

(declare-fun res!826791 () Bool)

(assert (=> start!103276 (=> (not res!826791) (not e!702347))))

(assert (=> start!103276 (= res!826791 (and (bvslt (size!39030 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39030 a!3835))))))

(assert (=> start!103276 e!702347))

(declare-fun array_inv!29475 (array!79783) Bool)

(assert (=> start!103276 (array_inv!29475 a!3835)))

(assert (=> start!103276 true))

(declare-fun b!1239304 () Bool)

(assert (=> b!1239304 (= e!702347 e!702349)))

(declare-fun res!826794 () Bool)

(assert (=> b!1239304 (=> (not res!826794) (not e!702349))))

(assert (=> b!1239304 (= res!826794 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39030 a!3835))))))

(declare-fun lt!561495 () Unit!41019)

(assert (=> b!1239304 (= lt!561495 e!702350)))

(declare-fun c!121117 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239304 (= c!121117 (validKeyInArray!0 (select (arr!38492 a!3835) from!3213)))))

(declare-fun b!1239305 () Bool)

(declare-fun res!826796 () Bool)

(assert (=> b!1239305 (=> (not res!826796) (not e!702347))))

(declare-fun noDuplicate!1981 (List!27366) Bool)

(assert (=> b!1239305 (= res!826796 (noDuplicate!1981 acc!846))))

(declare-fun b!1239306 () Bool)

(declare-fun res!826795 () Bool)

(assert (=> b!1239306 (=> (not res!826795) (not e!702347))))

(assert (=> b!1239306 (= res!826795 (not (contains!7338 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103276 res!826791) b!1239305))

(assert (= (and b!1239305 res!826796) b!1239302))

(assert (= (and b!1239302 res!826790) b!1239306))

(assert (= (and b!1239306 res!826795) b!1239301))

(assert (= (and b!1239301 res!826792) b!1239303))

(assert (= (and b!1239303 res!826789) b!1239299))

(assert (= (and b!1239299 res!826793) b!1239304))

(assert (= (and b!1239304 c!121117) b!1239300))

(assert (= (and b!1239304 (not c!121117)) b!1239298))

(assert (= (and b!1239304 res!826794) b!1239297))

(declare-fun m!1142319 () Bool)

(assert (=> b!1239305 m!1142319))

(declare-fun m!1142321 () Bool)

(assert (=> b!1239297 m!1142321))

(declare-fun m!1142323 () Bool)

(assert (=> b!1239304 m!1142323))

(assert (=> b!1239304 m!1142323))

(declare-fun m!1142325 () Bool)

(assert (=> b!1239304 m!1142325))

(declare-fun m!1142327 () Bool)

(assert (=> b!1239306 m!1142327))

(declare-fun m!1142329 () Bool)

(assert (=> b!1239302 m!1142329))

(declare-fun m!1142331 () Bool)

(assert (=> b!1239300 m!1142331))

(declare-fun m!1142333 () Bool)

(assert (=> b!1239300 m!1142333))

(declare-fun m!1142335 () Bool)

(assert (=> b!1239300 m!1142335))

(declare-fun m!1142337 () Bool)

(assert (=> b!1239300 m!1142337))

(declare-fun m!1142339 () Bool)

(assert (=> b!1239300 m!1142339))

(assert (=> b!1239300 m!1142321))

(assert (=> b!1239300 m!1142323))

(declare-fun m!1142341 () Bool)

(assert (=> start!103276 m!1142341))

(declare-fun m!1142343 () Bool)

(assert (=> b!1239301 m!1142343))

(declare-fun m!1142345 () Bool)

(assert (=> b!1239303 m!1142345))

(check-sat (not b!1239303) (not b!1239305) (not b!1239300) (not b!1239302) (not b!1239297) (not b!1239304) (not b!1239306) (not b!1239301) (not start!103276))
(check-sat)
