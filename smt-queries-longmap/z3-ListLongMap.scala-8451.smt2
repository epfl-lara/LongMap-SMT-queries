; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102842 () Bool)

(assert start!102842)

(declare-fun b!1236115 () Bool)

(declare-fun res!824125 () Bool)

(declare-fun e!700712 () Bool)

(assert (=> b!1236115 (=> (not res!824125) (not e!700712))))

(declare-datatypes ((array!79687 0))(
  ( (array!79688 (arr!38451 (Array (_ BitVec 32) (_ BitVec 64))) (size!38987 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79687)

(declare-datatypes ((List!27224 0))(
  ( (Nil!27221) (Cons!27220 (h!28429 (_ BitVec 64)) (t!40687 List!27224)) )
))
(declare-fun acc!846 () List!27224)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79687 (_ BitVec 32) List!27224) Bool)

(assert (=> b!1236115 (= res!824125 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236116 () Bool)

(declare-fun res!824129 () Bool)

(assert (=> b!1236116 (=> (not res!824129) (not e!700712))))

(declare-fun noDuplicate!1883 (List!27224) Bool)

(assert (=> b!1236116 (= res!824129 (noDuplicate!1883 acc!846))))

(declare-fun b!1236117 () Bool)

(declare-fun e!700710 () Bool)

(assert (=> b!1236117 (= e!700710 (not true))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1236117 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-datatypes ((Unit!40997 0))(
  ( (Unit!40998) )
))
(declare-fun lt!560693 () Unit!40997)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79687 (_ BitVec 32) (_ BitVec 64) List!27224) Unit!40997)

(assert (=> b!1236117 (= lt!560693 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1236118 () Bool)

(declare-fun res!824127 () Bool)

(assert (=> b!1236118 (=> (not res!824127) (not e!700712))))

(declare-fun contains!7286 (List!27224 (_ BitVec 64)) Bool)

(assert (=> b!1236118 (= res!824127 (contains!7286 acc!846 k0!2925))))

(declare-fun b!1236119 () Bool)

(declare-fun res!824124 () Bool)

(assert (=> b!1236119 (=> (not res!824124) (not e!700712))))

(assert (=> b!1236119 (= res!824124 (not (contains!7286 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236120 () Bool)

(declare-fun e!700711 () Unit!40997)

(declare-fun lt!560688 () Unit!40997)

(assert (=> b!1236120 (= e!700711 lt!560688)))

(declare-fun lt!560689 () List!27224)

(assert (=> b!1236120 (= lt!560689 (Cons!27220 (select (arr!38451 a!3835) from!3213) acc!846))))

(declare-fun lt!560692 () Unit!40997)

(declare-fun lemmaListSubSeqRefl!0 (List!27224) Unit!40997)

(assert (=> b!1236120 (= lt!560692 (lemmaListSubSeqRefl!0 lt!560689))))

(declare-fun subseq!558 (List!27224 List!27224) Bool)

(assert (=> b!1236120 (subseq!558 lt!560689 lt!560689)))

(declare-fun lt!560691 () Unit!40997)

(declare-fun subseqTail!51 (List!27224 List!27224) Unit!40997)

(assert (=> b!1236120 (= lt!560691 (subseqTail!51 lt!560689 lt!560689))))

(assert (=> b!1236120 (subseq!558 acc!846 lt!560689)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79687 List!27224 List!27224 (_ BitVec 32)) Unit!40997)

(assert (=> b!1236120 (= lt!560688 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560689 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1236120 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!824131 () Bool)

(assert (=> start!102842 (=> (not res!824131) (not e!700712))))

(assert (=> start!102842 (= res!824131 (and (bvslt (size!38987 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38987 a!3835))))))

(assert (=> start!102842 e!700712))

(declare-fun array_inv!29299 (array!79687) Bool)

(assert (=> start!102842 (array_inv!29299 a!3835)))

(assert (=> start!102842 true))

(declare-fun b!1236121 () Bool)

(declare-fun Unit!40999 () Unit!40997)

(assert (=> b!1236121 (= e!700711 Unit!40999)))

(declare-fun b!1236122 () Bool)

(declare-fun res!824128 () Bool)

(assert (=> b!1236122 (=> (not res!824128) (not e!700712))))

(assert (=> b!1236122 (= res!824128 (not (= from!3213 (bvsub (size!38987 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236123 () Bool)

(declare-fun res!824130 () Bool)

(assert (=> b!1236123 (=> (not res!824130) (not e!700710))))

(assert (=> b!1236123 (= res!824130 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236124 () Bool)

(declare-fun res!824126 () Bool)

(assert (=> b!1236124 (=> (not res!824126) (not e!700712))))

(assert (=> b!1236124 (= res!824126 (not (contains!7286 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236125 () Bool)

(assert (=> b!1236125 (= e!700712 e!700710)))

(declare-fun res!824123 () Bool)

(assert (=> b!1236125 (=> (not res!824123) (not e!700710))))

(assert (=> b!1236125 (= res!824123 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38987 a!3835))))))

(declare-fun lt!560690 () Unit!40997)

(assert (=> b!1236125 (= lt!560690 e!700711)))

(declare-fun c!120856 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236125 (= c!120856 (validKeyInArray!0 (select (arr!38451 a!3835) from!3213)))))

(assert (= (and start!102842 res!824131) b!1236116))

(assert (= (and b!1236116 res!824129) b!1236124))

(assert (= (and b!1236124 res!824126) b!1236119))

(assert (= (and b!1236119 res!824124) b!1236115))

(assert (= (and b!1236115 res!824125) b!1236118))

(assert (= (and b!1236118 res!824127) b!1236122))

(assert (= (and b!1236122 res!824128) b!1236125))

(assert (= (and b!1236125 c!120856) b!1236120))

(assert (= (and b!1236125 (not c!120856)) b!1236121))

(assert (= (and b!1236125 res!824123) b!1236123))

(assert (= (and b!1236123 res!824130) b!1236117))

(declare-fun m!1139955 () Bool)

(assert (=> start!102842 m!1139955))

(declare-fun m!1139957 () Bool)

(assert (=> b!1236125 m!1139957))

(assert (=> b!1236125 m!1139957))

(declare-fun m!1139959 () Bool)

(assert (=> b!1236125 m!1139959))

(declare-fun m!1139961 () Bool)

(assert (=> b!1236120 m!1139961))

(declare-fun m!1139963 () Bool)

(assert (=> b!1236120 m!1139963))

(declare-fun m!1139965 () Bool)

(assert (=> b!1236120 m!1139965))

(declare-fun m!1139967 () Bool)

(assert (=> b!1236120 m!1139967))

(declare-fun m!1139969 () Bool)

(assert (=> b!1236120 m!1139969))

(declare-fun m!1139971 () Bool)

(assert (=> b!1236120 m!1139971))

(assert (=> b!1236120 m!1139957))

(declare-fun m!1139973 () Bool)

(assert (=> b!1236115 m!1139973))

(declare-fun m!1139975 () Bool)

(assert (=> b!1236118 m!1139975))

(declare-fun m!1139977 () Bool)

(assert (=> b!1236119 m!1139977))

(assert (=> b!1236123 m!1139969))

(declare-fun m!1139979 () Bool)

(assert (=> b!1236117 m!1139979))

(declare-fun m!1139981 () Bool)

(assert (=> b!1236117 m!1139981))

(declare-fun m!1139983 () Bool)

(assert (=> b!1236116 m!1139983))

(declare-fun m!1139985 () Bool)

(assert (=> b!1236124 m!1139985))

(check-sat (not b!1236125) (not b!1236118) (not b!1236123) (not b!1236115) (not b!1236120) (not start!102842) (not b!1236116) (not b!1236117) (not b!1236119) (not b!1236124))
(check-sat)
