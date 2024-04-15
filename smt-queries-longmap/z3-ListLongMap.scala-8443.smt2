; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102790 () Bool)

(assert start!102790)

(declare-fun res!823480 () Bool)

(declare-fun e!700377 () Bool)

(assert (=> start!102790 (=> (not res!823480) (not e!700377))))

(declare-datatypes ((array!79558 0))(
  ( (array!79559 (arr!38387 (Array (_ BitVec 32) (_ BitVec 64))) (size!38925 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79558)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102790 (= res!823480 (and (bvslt (size!38925 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38925 a!3835))))))

(assert (=> start!102790 e!700377))

(declare-fun array_inv!29370 (array!79558) Bool)

(assert (=> start!102790 (array_inv!29370 a!3835)))

(assert (=> start!102790 true))

(declare-fun b!1235283 () Bool)

(declare-datatypes ((Unit!40769 0))(
  ( (Unit!40770) )
))
(declare-fun e!700379 () Unit!40769)

(declare-fun lt!560064 () Unit!40769)

(assert (=> b!1235283 (= e!700379 lt!560064)))

(declare-datatypes ((List!27261 0))(
  ( (Nil!27258) (Cons!27257 (h!28466 (_ BitVec 64)) (t!40715 List!27261)) )
))
(declare-fun acc!846 () List!27261)

(declare-fun lt!560067 () List!27261)

(assert (=> b!1235283 (= lt!560067 (Cons!27257 (select (arr!38387 a!3835) from!3213) acc!846))))

(declare-fun lt!560066 () Unit!40769)

(declare-fun lemmaListSubSeqRefl!0 (List!27261) Unit!40769)

(assert (=> b!1235283 (= lt!560066 (lemmaListSubSeqRefl!0 lt!560067))))

(declare-fun subseq!533 (List!27261 List!27261) Bool)

(assert (=> b!1235283 (subseq!533 lt!560067 lt!560067)))

(declare-fun lt!560069 () Unit!40769)

(declare-fun subseqTail!26 (List!27261 List!27261) Unit!40769)

(assert (=> b!1235283 (= lt!560069 (subseqTail!26 lt!560067 lt!560067))))

(assert (=> b!1235283 (subseq!533 acc!846 lt!560067)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79558 List!27261 List!27261 (_ BitVec 32)) Unit!40769)

(assert (=> b!1235283 (= lt!560064 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560067 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79558 (_ BitVec 32) List!27261) Bool)

(assert (=> b!1235283 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235284 () Bool)

(declare-fun e!700376 () Bool)

(assert (=> b!1235284 (= e!700376 false)))

(declare-fun lt!560065 () Bool)

(assert (=> b!1235284 (= lt!560065 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235285 () Bool)

(declare-fun res!823484 () Bool)

(assert (=> b!1235285 (=> (not res!823484) (not e!700377))))

(declare-fun contains!7233 (List!27261 (_ BitVec 64)) Bool)

(assert (=> b!1235285 (= res!823484 (not (contains!7233 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235286 () Bool)

(declare-fun res!823479 () Bool)

(assert (=> b!1235286 (=> (not res!823479) (not e!700377))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235286 (= res!823479 (contains!7233 acc!846 k0!2925))))

(declare-fun b!1235287 () Bool)

(declare-fun res!823483 () Bool)

(assert (=> b!1235287 (=> (not res!823483) (not e!700377))))

(assert (=> b!1235287 (= res!823483 (not (= from!3213 (bvsub (size!38925 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235288 () Bool)

(declare-fun res!823478 () Bool)

(assert (=> b!1235288 (=> (not res!823478) (not e!700377))))

(assert (=> b!1235288 (= res!823478 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235289 () Bool)

(assert (=> b!1235289 (= e!700377 e!700376)))

(declare-fun res!823481 () Bool)

(assert (=> b!1235289 (=> (not res!823481) (not e!700376))))

(assert (=> b!1235289 (= res!823481 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38925 a!3835))))))

(declare-fun lt!560068 () Unit!40769)

(assert (=> b!1235289 (= lt!560068 e!700379)))

(declare-fun c!120766 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235289 (= c!120766 (validKeyInArray!0 (select (arr!38387 a!3835) from!3213)))))

(declare-fun b!1235290 () Bool)

(declare-fun res!823482 () Bool)

(assert (=> b!1235290 (=> (not res!823482) (not e!700377))))

(assert (=> b!1235290 (= res!823482 (not (contains!7233 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235291 () Bool)

(declare-fun Unit!40771 () Unit!40769)

(assert (=> b!1235291 (= e!700379 Unit!40771)))

(declare-fun b!1235292 () Bool)

(declare-fun res!823477 () Bool)

(assert (=> b!1235292 (=> (not res!823477) (not e!700377))))

(declare-fun noDuplicate!1876 (List!27261) Bool)

(assert (=> b!1235292 (= res!823477 (noDuplicate!1876 acc!846))))

(assert (= (and start!102790 res!823480) b!1235292))

(assert (= (and b!1235292 res!823477) b!1235290))

(assert (= (and b!1235290 res!823482) b!1235285))

(assert (= (and b!1235285 res!823484) b!1235288))

(assert (= (and b!1235288 res!823478) b!1235286))

(assert (= (and b!1235286 res!823479) b!1235287))

(assert (= (and b!1235287 res!823483) b!1235289))

(assert (= (and b!1235289 c!120766) b!1235283))

(assert (= (and b!1235289 (not c!120766)) b!1235291))

(assert (= (and b!1235289 res!823481) b!1235284))

(declare-fun m!1138743 () Bool)

(assert (=> b!1235283 m!1138743))

(declare-fun m!1138745 () Bool)

(assert (=> b!1235283 m!1138745))

(declare-fun m!1138747 () Bool)

(assert (=> b!1235283 m!1138747))

(declare-fun m!1138749 () Bool)

(assert (=> b!1235283 m!1138749))

(declare-fun m!1138751 () Bool)

(assert (=> b!1235283 m!1138751))

(declare-fun m!1138753 () Bool)

(assert (=> b!1235283 m!1138753))

(declare-fun m!1138755 () Bool)

(assert (=> b!1235283 m!1138755))

(declare-fun m!1138757 () Bool)

(assert (=> start!102790 m!1138757))

(declare-fun m!1138759 () Bool)

(assert (=> b!1235286 m!1138759))

(assert (=> b!1235289 m!1138755))

(assert (=> b!1235289 m!1138755))

(declare-fun m!1138761 () Bool)

(assert (=> b!1235289 m!1138761))

(assert (=> b!1235284 m!1138753))

(declare-fun m!1138763 () Bool)

(assert (=> b!1235292 m!1138763))

(declare-fun m!1138765 () Bool)

(assert (=> b!1235288 m!1138765))

(declare-fun m!1138767 () Bool)

(assert (=> b!1235290 m!1138767))

(declare-fun m!1138769 () Bool)

(assert (=> b!1235285 m!1138769))

(check-sat (not b!1235289) (not b!1235286) (not b!1235292) (not b!1235288) (not start!102790) (not b!1235283) (not b!1235285) (not b!1235290) (not b!1235284))
(check-sat)
