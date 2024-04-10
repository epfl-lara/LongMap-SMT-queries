; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102648 () Bool)

(assert start!102648)

(declare-fun b!1233936 () Bool)

(declare-fun res!822119 () Bool)

(declare-fun e!699921 () Bool)

(assert (=> b!1233936 (=> (not res!822119) (not e!699921))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233936 (= res!822119 (validKeyInArray!0 k!2913))))

(declare-fun b!1233937 () Bool)

(declare-fun res!822123 () Bool)

(assert (=> b!1233937 (=> (not res!822123) (not e!699921))))

(declare-datatypes ((array!79538 0))(
  ( (array!79539 (arr!38378 (Array (_ BitVec 32) (_ BitVec 64))) (size!38914 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79538)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233937 (= res!822123 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233938 () Bool)

(declare-fun res!822124 () Bool)

(assert (=> b!1233938 (=> (not res!822124) (not e!699921))))

(declare-datatypes ((List!27151 0))(
  ( (Nil!27148) (Cons!27147 (h!28356 (_ BitVec 64)) (t!40614 List!27151)) )
))
(declare-fun acc!823 () List!27151)

(declare-fun contains!7213 (List!27151 (_ BitVec 64)) Bool)

(assert (=> b!1233938 (= res!822124 (not (contains!7213 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233939 () Bool)

(declare-fun res!822118 () Bool)

(assert (=> b!1233939 (=> (not res!822118) (not e!699921))))

(declare-fun arrayNoDuplicates!0 (array!79538 (_ BitVec 32) List!27151) Bool)

(assert (=> b!1233939 (= res!822118 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233940 () Bool)

(declare-fun res!822115 () Bool)

(assert (=> b!1233940 (=> (not res!822115) (not e!699921))))

(declare-fun noDuplicate!1810 (List!27151) Bool)

(assert (=> b!1233940 (= res!822115 (noDuplicate!1810 acc!823))))

(declare-fun b!1233941 () Bool)

(declare-fun res!822116 () Bool)

(assert (=> b!1233941 (=> (not res!822116) (not e!699921))))

(assert (=> b!1233941 (= res!822116 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38914 a!3806)) (bvslt from!3184 (size!38914 a!3806))))))

(declare-fun b!1233942 () Bool)

(declare-fun e!699920 () Bool)

(assert (=> b!1233942 (= e!699920 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27147 (select (arr!38378 a!3806) from!3184) Nil!27148)))))

(declare-fun res!822121 () Bool)

(assert (=> start!102648 (=> (not res!822121) (not e!699921))))

(assert (=> start!102648 (= res!822121 (bvslt (size!38914 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102648 e!699921))

(declare-fun array_inv!29226 (array!79538) Bool)

(assert (=> start!102648 (array_inv!29226 a!3806)))

(assert (=> start!102648 true))

(declare-fun b!1233935 () Bool)

(assert (=> b!1233935 (= e!699921 (not (not (= (select (arr!38378 a!3806) from!3184) k!2913))))))

(assert (=> b!1233935 (not (arrayContainsKey!0 a!3806 (select (arr!38378 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40862 0))(
  ( (Unit!40863) )
))
(declare-fun lt!559775 () Unit!40862)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79538 (_ BitVec 32) (_ BitVec 64) List!27151) Unit!40862)

(assert (=> b!1233935 (= lt!559775 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38378 a!3806) from!3184) (Cons!27147 (select (arr!38378 a!3806) from!3184) Nil!27148)))))

(assert (=> b!1233935 e!699920))

(declare-fun res!822120 () Bool)

(assert (=> b!1233935 (=> (not res!822120) (not e!699920))))

(assert (=> b!1233935 (= res!822120 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27148))))

(declare-fun lt!559774 () Unit!40862)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79538 List!27151 List!27151 (_ BitVec 32)) Unit!40862)

(assert (=> b!1233935 (= lt!559774 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27148 from!3184))))

(assert (=> b!1233935 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27147 (select (arr!38378 a!3806) from!3184) acc!823))))

(declare-fun b!1233943 () Bool)

(declare-fun res!822117 () Bool)

(assert (=> b!1233943 (=> (not res!822117) (not e!699921))))

(assert (=> b!1233943 (= res!822117 (not (contains!7213 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233944 () Bool)

(declare-fun res!822122 () Bool)

(assert (=> b!1233944 (=> (not res!822122) (not e!699921))))

(assert (=> b!1233944 (= res!822122 (validKeyInArray!0 (select (arr!38378 a!3806) from!3184)))))

(assert (= (and start!102648 res!822121) b!1233936))

(assert (= (and b!1233936 res!822119) b!1233941))

(assert (= (and b!1233941 res!822116) b!1233940))

(assert (= (and b!1233940 res!822115) b!1233938))

(assert (= (and b!1233938 res!822124) b!1233943))

(assert (= (and b!1233943 res!822117) b!1233937))

(assert (= (and b!1233937 res!822123) b!1233939))

(assert (= (and b!1233939 res!822118) b!1233944))

(assert (= (and b!1233944 res!822122) b!1233935))

(assert (= (and b!1233935 res!822120) b!1233942))

(declare-fun m!1137991 () Bool)

(assert (=> b!1233939 m!1137991))

(declare-fun m!1137993 () Bool)

(assert (=> b!1233943 m!1137993))

(declare-fun m!1137995 () Bool)

(assert (=> start!102648 m!1137995))

(declare-fun m!1137997 () Bool)

(assert (=> b!1233935 m!1137997))

(declare-fun m!1137999 () Bool)

(assert (=> b!1233935 m!1137999))

(declare-fun m!1138001 () Bool)

(assert (=> b!1233935 m!1138001))

(declare-fun m!1138003 () Bool)

(assert (=> b!1233935 m!1138003))

(assert (=> b!1233935 m!1138001))

(declare-fun m!1138005 () Bool)

(assert (=> b!1233935 m!1138005))

(assert (=> b!1233935 m!1138001))

(declare-fun m!1138007 () Bool)

(assert (=> b!1233935 m!1138007))

(declare-fun m!1138009 () Bool)

(assert (=> b!1233937 m!1138009))

(assert (=> b!1233944 m!1138001))

(assert (=> b!1233944 m!1138001))

(declare-fun m!1138011 () Bool)

(assert (=> b!1233944 m!1138011))

(declare-fun m!1138013 () Bool)

(assert (=> b!1233936 m!1138013))

(assert (=> b!1233942 m!1138001))

(declare-fun m!1138015 () Bool)

(assert (=> b!1233942 m!1138015))

(declare-fun m!1138017 () Bool)

(assert (=> b!1233940 m!1138017))

(declare-fun m!1138019 () Bool)

(assert (=> b!1233938 m!1138019))

(push 1)

