; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103060 () Bool)

(assert start!103060)

(declare-fun b!1237125 () Bool)

(declare-fun res!824405 () Bool)

(declare-fun e!701456 () Bool)

(assert (=> b!1237125 (=> (not res!824405) (not e!701456))))

(declare-datatypes ((List!27239 0))(
  ( (Nil!27236) (Cons!27235 (h!28453 (_ BitVec 64)) (t!40694 List!27239)) )
))
(declare-fun acc!846 () List!27239)

(declare-fun contains!7310 (List!27239 (_ BitVec 64)) Bool)

(assert (=> b!1237125 (= res!824405 (not (contains!7310 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237126 () Bool)

(declare-fun res!824408 () Bool)

(assert (=> b!1237126 (=> (not res!824408) (not e!701456))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79703 0))(
  ( (array!79704 (arr!38453 (Array (_ BitVec 32) (_ BitVec 64))) (size!38990 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79703)

(assert (=> b!1237126 (= res!824408 (not (= from!3213 (bvsub (size!38990 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237127 () Bool)

(declare-fun e!701454 () Bool)

(assert (=> b!1237127 (= e!701456 e!701454)))

(declare-fun res!824407 () Bool)

(assert (=> b!1237127 (=> (not res!824407) (not e!701454))))

(assert (=> b!1237127 (= res!824407 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38990 a!3835))))))

(declare-datatypes ((Unit!40940 0))(
  ( (Unit!40941) )
))
(declare-fun lt!560999 () Unit!40940)

(declare-fun e!701453 () Unit!40940)

(assert (=> b!1237127 (= lt!560999 e!701453)))

(declare-fun c!121229 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237127 (= c!121229 (validKeyInArray!0 (select (arr!38453 a!3835) from!3213)))))

(declare-fun b!1237128 () Bool)

(declare-fun res!824404 () Bool)

(assert (=> b!1237128 (=> (not res!824404) (not e!701456))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237128 (= res!824404 (contains!7310 acc!846 k0!2925))))

(declare-fun b!1237129 () Bool)

(declare-fun res!824402 () Bool)

(assert (=> b!1237129 (=> (not res!824402) (not e!701456))))

(assert (=> b!1237129 (= res!824402 (not (contains!7310 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237130 () Bool)

(declare-fun res!824409 () Bool)

(assert (=> b!1237130 (=> (not res!824409) (not e!701456))))

(declare-fun noDuplicate!1891 (List!27239) Bool)

(assert (=> b!1237130 (= res!824409 (noDuplicate!1891 acc!846))))

(declare-fun res!824403 () Bool)

(assert (=> start!103060 (=> (not res!824403) (not e!701456))))

(assert (=> start!103060 (= res!824403 (and (bvslt (size!38990 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38990 a!3835))))))

(assert (=> start!103060 e!701456))

(declare-fun array_inv!29391 (array!79703) Bool)

(assert (=> start!103060 (array_inv!29391 a!3835)))

(assert (=> start!103060 true))

(declare-fun b!1237131 () Bool)

(declare-fun Unit!40942 () Unit!40940)

(assert (=> b!1237131 (= e!701453 Unit!40942)))

(declare-fun b!1237132 () Bool)

(declare-fun lt!560994 () Unit!40940)

(assert (=> b!1237132 (= e!701453 lt!560994)))

(declare-fun lt!560995 () List!27239)

(assert (=> b!1237132 (= lt!560995 (Cons!27235 (select (arr!38453 a!3835) from!3213) acc!846))))

(declare-fun lt!560998 () Unit!40940)

(declare-fun lemmaListSubSeqRefl!0 (List!27239) Unit!40940)

(assert (=> b!1237132 (= lt!560998 (lemmaListSubSeqRefl!0 lt!560995))))

(declare-fun subseq!548 (List!27239 List!27239) Bool)

(assert (=> b!1237132 (subseq!548 lt!560995 lt!560995)))

(declare-fun lt!560996 () Unit!40940)

(declare-fun subseqTail!41 (List!27239 List!27239) Unit!40940)

(assert (=> b!1237132 (= lt!560996 (subseqTail!41 lt!560995 lt!560995))))

(assert (=> b!1237132 (subseq!548 acc!846 lt!560995)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79703 List!27239 List!27239 (_ BitVec 32)) Unit!40940)

(assert (=> b!1237132 (= lt!560994 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560995 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79703 (_ BitVec 32) List!27239) Bool)

(assert (=> b!1237132 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1237133 () Bool)

(assert (=> b!1237133 (= e!701454 false)))

(declare-fun lt!560997 () Bool)

(assert (=> b!1237133 (= lt!560997 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1237134 () Bool)

(declare-fun res!824406 () Bool)

(assert (=> b!1237134 (=> (not res!824406) (not e!701456))))

(assert (=> b!1237134 (= res!824406 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!103060 res!824403) b!1237130))

(assert (= (and b!1237130 res!824409) b!1237125))

(assert (= (and b!1237125 res!824405) b!1237129))

(assert (= (and b!1237129 res!824402) b!1237134))

(assert (= (and b!1237134 res!824406) b!1237128))

(assert (= (and b!1237128 res!824404) b!1237126))

(assert (= (and b!1237126 res!824408) b!1237127))

(assert (= (and b!1237127 c!121229) b!1237132))

(assert (= (and b!1237127 (not c!121229)) b!1237131))

(assert (= (and b!1237127 res!824407) b!1237133))

(declare-fun m!1141307 () Bool)

(assert (=> b!1237132 m!1141307))

(declare-fun m!1141309 () Bool)

(assert (=> b!1237132 m!1141309))

(declare-fun m!1141311 () Bool)

(assert (=> b!1237132 m!1141311))

(declare-fun m!1141313 () Bool)

(assert (=> b!1237132 m!1141313))

(declare-fun m!1141315 () Bool)

(assert (=> b!1237132 m!1141315))

(declare-fun m!1141317 () Bool)

(assert (=> b!1237132 m!1141317))

(declare-fun m!1141319 () Bool)

(assert (=> b!1237132 m!1141319))

(assert (=> b!1237133 m!1141317))

(declare-fun m!1141321 () Bool)

(assert (=> b!1237125 m!1141321))

(declare-fun m!1141323 () Bool)

(assert (=> b!1237129 m!1141323))

(assert (=> b!1237127 m!1141319))

(assert (=> b!1237127 m!1141319))

(declare-fun m!1141325 () Bool)

(assert (=> b!1237127 m!1141325))

(declare-fun m!1141327 () Bool)

(assert (=> b!1237134 m!1141327))

(declare-fun m!1141329 () Bool)

(assert (=> start!103060 m!1141329))

(declare-fun m!1141331 () Bool)

(assert (=> b!1237130 m!1141331))

(declare-fun m!1141333 () Bool)

(assert (=> b!1237128 m!1141333))

(check-sat (not b!1237127) (not start!103060) (not b!1237129) (not b!1237132) (not b!1237125) (not b!1237134) (not b!1237130) (not b!1237128) (not b!1237133))
(check-sat)
