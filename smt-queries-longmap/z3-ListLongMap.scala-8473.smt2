; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103196 () Bool)

(assert start!103196)

(declare-fun b!1238758 () Bool)

(declare-fun res!826375 () Bool)

(declare-fun e!702065 () Bool)

(assert (=> b!1238758 (=> (not res!826375) (not e!702065))))

(declare-datatypes ((array!79831 0))(
  ( (array!79832 (arr!38517 (Array (_ BitVec 32) (_ BitVec 64))) (size!39053 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79831)

(declare-datatypes ((List!27290 0))(
  ( (Nil!27287) (Cons!27286 (h!28495 (_ BitVec 64)) (t!40753 List!27290)) )
))
(declare-fun acc!846 () List!27290)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79831 (_ BitVec 32) List!27290) Bool)

(assert (=> b!1238758 (= res!826375 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238759 () Bool)

(declare-fun res!826376 () Bool)

(assert (=> b!1238759 (=> (not res!826376) (not e!702065))))

(declare-fun contains!7352 (List!27290 (_ BitVec 64)) Bool)

(assert (=> b!1238759 (= res!826376 (not (contains!7352 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238760 () Bool)

(declare-fun res!826380 () Bool)

(assert (=> b!1238760 (=> (not res!826380) (not e!702065))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1238760 (= res!826380 (contains!7352 acc!846 k0!2925))))

(declare-fun b!1238761 () Bool)

(declare-datatypes ((Unit!41128 0))(
  ( (Unit!41129) )
))
(declare-fun e!702066 () Unit!41128)

(declare-fun Unit!41130 () Unit!41128)

(assert (=> b!1238761 (= e!702066 Unit!41130)))

(declare-fun b!1238762 () Bool)

(declare-fun lt!561412 () Unit!41128)

(assert (=> b!1238762 (= e!702066 lt!561412)))

(declare-fun lt!561414 () List!27290)

(assert (=> b!1238762 (= lt!561414 (Cons!27286 (select (arr!38517 a!3835) from!3213) acc!846))))

(declare-fun lt!561413 () Unit!41128)

(declare-fun lemmaListSubSeqRefl!0 (List!27290) Unit!41128)

(assert (=> b!1238762 (= lt!561413 (lemmaListSubSeqRefl!0 lt!561414))))

(declare-fun subseq!606 (List!27290 List!27290) Bool)

(assert (=> b!1238762 (subseq!606 lt!561414 lt!561414)))

(declare-fun lt!561415 () Unit!41128)

(declare-fun subseqTail!93 (List!27290 List!27290) Unit!41128)

(assert (=> b!1238762 (= lt!561415 (subseqTail!93 lt!561414 lt!561414))))

(assert (=> b!1238762 (subseq!606 acc!846 lt!561414)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79831 List!27290 List!27290 (_ BitVec 32)) Unit!41128)

(assert (=> b!1238762 (= lt!561412 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561414 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1238762 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238763 () Bool)

(declare-fun res!826379 () Bool)

(assert (=> b!1238763 (=> (not res!826379) (not e!702065))))

(declare-fun noDuplicate!1949 (List!27290) Bool)

(assert (=> b!1238763 (= res!826379 (noDuplicate!1949 acc!846))))

(declare-fun b!1238764 () Bool)

(declare-fun res!826378 () Bool)

(assert (=> b!1238764 (=> (not res!826378) (not e!702065))))

(assert (=> b!1238764 (= res!826378 (not (= from!3213 (bvsub (size!39053 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238765 () Bool)

(declare-fun res!826381 () Bool)

(assert (=> b!1238765 (=> (not res!826381) (not e!702065))))

(assert (=> b!1238765 (= res!826381 (not (contains!7352 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!826377 () Bool)

(assert (=> start!103196 (=> (not res!826377) (not e!702065))))

(assert (=> start!103196 (= res!826377 (and (bvslt (size!39053 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39053 a!3835))))))

(assert (=> start!103196 e!702065))

(declare-fun array_inv!29365 (array!79831) Bool)

(assert (=> start!103196 (array_inv!29365 a!3835)))

(assert (=> start!103196 true))

(declare-fun b!1238757 () Bool)

(assert (=> b!1238757 (= e!702065 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!561416 () Unit!41128)

(assert (=> b!1238757 (= lt!561416 e!702066)))

(declare-fun c!121051 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238757 (= c!121051 (validKeyInArray!0 (select (arr!38517 a!3835) from!3213)))))

(assert (= (and start!103196 res!826377) b!1238763))

(assert (= (and b!1238763 res!826379) b!1238765))

(assert (= (and b!1238765 res!826381) b!1238759))

(assert (= (and b!1238759 res!826376) b!1238758))

(assert (= (and b!1238758 res!826375) b!1238760))

(assert (= (and b!1238760 res!826380) b!1238764))

(assert (= (and b!1238764 res!826378) b!1238757))

(assert (= (and b!1238757 c!121051) b!1238762))

(assert (= (and b!1238757 (not c!121051)) b!1238761))

(declare-fun m!1142267 () Bool)

(assert (=> b!1238763 m!1142267))

(declare-fun m!1142269 () Bool)

(assert (=> start!103196 m!1142269))

(declare-fun m!1142271 () Bool)

(assert (=> b!1238757 m!1142271))

(assert (=> b!1238757 m!1142271))

(declare-fun m!1142273 () Bool)

(assert (=> b!1238757 m!1142273))

(declare-fun m!1142275 () Bool)

(assert (=> b!1238762 m!1142275))

(declare-fun m!1142277 () Bool)

(assert (=> b!1238762 m!1142277))

(declare-fun m!1142279 () Bool)

(assert (=> b!1238762 m!1142279))

(declare-fun m!1142281 () Bool)

(assert (=> b!1238762 m!1142281))

(assert (=> b!1238762 m!1142271))

(declare-fun m!1142283 () Bool)

(assert (=> b!1238762 m!1142283))

(declare-fun m!1142285 () Bool)

(assert (=> b!1238762 m!1142285))

(declare-fun m!1142287 () Bool)

(assert (=> b!1238759 m!1142287))

(declare-fun m!1142289 () Bool)

(assert (=> b!1238758 m!1142289))

(declare-fun m!1142291 () Bool)

(assert (=> b!1238760 m!1142291))

(declare-fun m!1142293 () Bool)

(assert (=> b!1238765 m!1142293))

(check-sat (not b!1238758) (not b!1238765) (not b!1238757) (not b!1238763) (not b!1238762) (not start!103196) (not b!1238760) (not b!1238759))
(check-sat)
