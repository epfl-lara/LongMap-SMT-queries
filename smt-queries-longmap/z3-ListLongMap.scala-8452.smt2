; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102844 () Bool)

(assert start!102844)

(declare-fun b!1236113 () Bool)

(declare-datatypes ((Unit!40850 0))(
  ( (Unit!40851) )
))
(declare-fun e!700701 () Unit!40850)

(declare-fun lt!560551 () Unit!40850)

(assert (=> b!1236113 (= e!700701 lt!560551)))

(declare-datatypes ((array!79612 0))(
  ( (array!79613 (arr!38414 (Array (_ BitVec 32) (_ BitVec 64))) (size!38952 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79612)

(declare-datatypes ((List!27288 0))(
  ( (Nil!27285) (Cons!27284 (h!28493 (_ BitVec 64)) (t!40742 List!27288)) )
))
(declare-fun acc!846 () List!27288)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!560553 () List!27288)

(assert (=> b!1236113 (= lt!560553 (Cons!27284 (select (arr!38414 a!3835) from!3213) acc!846))))

(declare-fun lt!560555 () Unit!40850)

(declare-fun lemmaListSubSeqRefl!0 (List!27288) Unit!40850)

(assert (=> b!1236113 (= lt!560555 (lemmaListSubSeqRefl!0 lt!560553))))

(declare-fun subseq!560 (List!27288 List!27288) Bool)

(assert (=> b!1236113 (subseq!560 lt!560553 lt!560553)))

(declare-fun lt!560554 () Unit!40850)

(declare-fun subseqTail!53 (List!27288 List!27288) Unit!40850)

(assert (=> b!1236113 (= lt!560554 (subseqTail!53 lt!560553 lt!560553))))

(assert (=> b!1236113 (subseq!560 acc!846 lt!560553)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79612 List!27288 List!27288 (_ BitVec 32)) Unit!40850)

(assert (=> b!1236113 (= lt!560551 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560553 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79612 (_ BitVec 32) List!27288) Bool)

(assert (=> b!1236113 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236114 () Bool)

(declare-fun e!700702 () Bool)

(assert (=> b!1236114 (= e!700702 (not true))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1236114 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!560552 () Unit!40850)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79612 (_ BitVec 32) (_ BitVec 64) List!27288) Unit!40850)

(assert (=> b!1236114 (= lt!560552 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1236115 () Bool)

(declare-fun res!824148 () Bool)

(declare-fun e!700700 () Bool)

(assert (=> b!1236115 (=> (not res!824148) (not e!700700))))

(assert (=> b!1236115 (= res!824148 (not (= from!3213 (bvsub (size!38952 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236116 () Bool)

(declare-fun res!824152 () Bool)

(assert (=> b!1236116 (=> (not res!824152) (not e!700702))))

(assert (=> b!1236116 (= res!824152 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236117 () Bool)

(declare-fun res!824146 () Bool)

(assert (=> b!1236117 (=> (not res!824146) (not e!700700))))

(assert (=> b!1236117 (= res!824146 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236118 () Bool)

(declare-fun res!824153 () Bool)

(assert (=> b!1236118 (=> (not res!824153) (not e!700700))))

(declare-fun contains!7260 (List!27288 (_ BitVec 64)) Bool)

(assert (=> b!1236118 (= res!824153 (not (contains!7260 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236119 () Bool)

(declare-fun res!824150 () Bool)

(assert (=> b!1236119 (=> (not res!824150) (not e!700700))))

(assert (=> b!1236119 (= res!824150 (not (contains!7260 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236121 () Bool)

(assert (=> b!1236121 (= e!700700 e!700702)))

(declare-fun res!824145 () Bool)

(assert (=> b!1236121 (=> (not res!824145) (not e!700702))))

(assert (=> b!1236121 (= res!824145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38952 a!3835))))))

(declare-fun lt!560550 () Unit!40850)

(assert (=> b!1236121 (= lt!560550 e!700701)))

(declare-fun c!120847 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236121 (= c!120847 (validKeyInArray!0 (select (arr!38414 a!3835) from!3213)))))

(declare-fun b!1236122 () Bool)

(declare-fun Unit!40852 () Unit!40850)

(assert (=> b!1236122 (= e!700701 Unit!40852)))

(declare-fun b!1236123 () Bool)

(declare-fun res!824147 () Bool)

(assert (=> b!1236123 (=> (not res!824147) (not e!700700))))

(declare-fun noDuplicate!1903 (List!27288) Bool)

(assert (=> b!1236123 (= res!824147 (noDuplicate!1903 acc!846))))

(declare-fun res!824149 () Bool)

(assert (=> start!102844 (=> (not res!824149) (not e!700700))))

(assert (=> start!102844 (= res!824149 (and (bvslt (size!38952 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38952 a!3835))))))

(assert (=> start!102844 e!700700))

(declare-fun array_inv!29397 (array!79612) Bool)

(assert (=> start!102844 (array_inv!29397 a!3835)))

(assert (=> start!102844 true))

(declare-fun b!1236120 () Bool)

(declare-fun res!824151 () Bool)

(assert (=> b!1236120 (=> (not res!824151) (not e!700700))))

(assert (=> b!1236120 (= res!824151 (contains!7260 acc!846 k0!2925))))

(assert (= (and start!102844 res!824149) b!1236123))

(assert (= (and b!1236123 res!824147) b!1236119))

(assert (= (and b!1236119 res!824150) b!1236118))

(assert (= (and b!1236118 res!824153) b!1236117))

(assert (= (and b!1236117 res!824146) b!1236120))

(assert (= (and b!1236120 res!824151) b!1236115))

(assert (= (and b!1236115 res!824148) b!1236121))

(assert (= (and b!1236121 c!120847) b!1236113))

(assert (= (and b!1236121 (not c!120847)) b!1236122))

(assert (= (and b!1236121 res!824145) b!1236116))

(assert (= (and b!1236116 res!824152) b!1236114))

(declare-fun m!1139523 () Bool)

(assert (=> b!1236118 m!1139523))

(declare-fun m!1139525 () Bool)

(assert (=> b!1236113 m!1139525))

(declare-fun m!1139527 () Bool)

(assert (=> b!1236113 m!1139527))

(declare-fun m!1139529 () Bool)

(assert (=> b!1236113 m!1139529))

(declare-fun m!1139531 () Bool)

(assert (=> b!1236113 m!1139531))

(declare-fun m!1139533 () Bool)

(assert (=> b!1236113 m!1139533))

(declare-fun m!1139535 () Bool)

(assert (=> b!1236113 m!1139535))

(declare-fun m!1139537 () Bool)

(assert (=> b!1236113 m!1139537))

(declare-fun m!1139539 () Bool)

(assert (=> b!1236120 m!1139539))

(declare-fun m!1139541 () Bool)

(assert (=> start!102844 m!1139541))

(declare-fun m!1139543 () Bool)

(assert (=> b!1236123 m!1139543))

(declare-fun m!1139545 () Bool)

(assert (=> b!1236119 m!1139545))

(declare-fun m!1139547 () Bool)

(assert (=> b!1236114 m!1139547))

(declare-fun m!1139549 () Bool)

(assert (=> b!1236114 m!1139549))

(assert (=> b!1236116 m!1139533))

(declare-fun m!1139551 () Bool)

(assert (=> b!1236117 m!1139551))

(assert (=> b!1236121 m!1139535))

(assert (=> b!1236121 m!1139535))

(declare-fun m!1139553 () Bool)

(assert (=> b!1236121 m!1139553))

(check-sat (not b!1236121) (not start!102844) (not b!1236113) (not b!1236120) (not b!1236123) (not b!1236114) (not b!1236118) (not b!1236119) (not b!1236117) (not b!1236116))
(check-sat)
