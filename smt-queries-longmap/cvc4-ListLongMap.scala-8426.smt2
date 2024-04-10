; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102646 () Bool)

(assert start!102646)

(declare-fun b!1233905 () Bool)

(declare-fun res!822091 () Bool)

(declare-fun e!699912 () Bool)

(assert (=> b!1233905 (=> (not res!822091) (not e!699912))))

(declare-datatypes ((List!27150 0))(
  ( (Nil!27147) (Cons!27146 (h!28355 (_ BitVec 64)) (t!40613 List!27150)) )
))
(declare-fun acc!823 () List!27150)

(declare-fun contains!7212 (List!27150 (_ BitVec 64)) Bool)

(assert (=> b!1233905 (= res!822091 (not (contains!7212 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233906 () Bool)

(declare-fun res!822093 () Bool)

(assert (=> b!1233906 (=> (not res!822093) (not e!699912))))

(declare-fun noDuplicate!1809 (List!27150) Bool)

(assert (=> b!1233906 (= res!822093 (noDuplicate!1809 acc!823))))

(declare-fun b!1233907 () Bool)

(declare-fun e!699910 () Bool)

(declare-datatypes ((array!79536 0))(
  ( (array!79537 (arr!38377 (Array (_ BitVec 32) (_ BitVec 64))) (size!38913 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79536)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79536 (_ BitVec 32) List!27150) Bool)

(assert (=> b!1233907 (= e!699910 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27146 (select (arr!38377 a!3806) from!3184) Nil!27147)))))

(declare-fun b!1233908 () Bool)

(declare-fun res!822089 () Bool)

(assert (=> b!1233908 (=> (not res!822089) (not e!699912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233908 (= res!822089 (validKeyInArray!0 (select (arr!38377 a!3806) from!3184)))))

(declare-fun b!1233909 () Bool)

(declare-fun res!822088 () Bool)

(assert (=> b!1233909 (=> (not res!822088) (not e!699912))))

(assert (=> b!1233909 (= res!822088 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38913 a!3806)) (bvslt from!3184 (size!38913 a!3806))))))

(declare-fun b!1233910 () Bool)

(declare-fun res!822090 () Bool)

(assert (=> b!1233910 (=> (not res!822090) (not e!699912))))

(assert (=> b!1233910 (= res!822090 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233911 () Bool)

(declare-fun res!822085 () Bool)

(assert (=> b!1233911 (=> (not res!822085) (not e!699912))))

(assert (=> b!1233911 (= res!822085 (not (contains!7212 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233912 () Bool)

(declare-fun res!822087 () Bool)

(assert (=> b!1233912 (=> (not res!822087) (not e!699912))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233912 (= res!822087 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233913 () Bool)

(assert (=> b!1233913 (= e!699912 (not true))))

(assert (=> b!1233913 (not (arrayContainsKey!0 a!3806 (select (arr!38377 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40860 0))(
  ( (Unit!40861) )
))
(declare-fun lt!559768 () Unit!40860)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79536 (_ BitVec 32) (_ BitVec 64) List!27150) Unit!40860)

(assert (=> b!1233913 (= lt!559768 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38377 a!3806) from!3184) (Cons!27146 (select (arr!38377 a!3806) from!3184) Nil!27147)))))

(assert (=> b!1233913 e!699910))

(declare-fun res!822094 () Bool)

(assert (=> b!1233913 (=> (not res!822094) (not e!699910))))

(assert (=> b!1233913 (= res!822094 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27147))))

(declare-fun lt!559769 () Unit!40860)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79536 List!27150 List!27150 (_ BitVec 32)) Unit!40860)

(assert (=> b!1233913 (= lt!559769 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27147 from!3184))))

(assert (=> b!1233913 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27146 (select (arr!38377 a!3806) from!3184) acc!823))))

(declare-fun b!1233914 () Bool)

(declare-fun res!822086 () Bool)

(assert (=> b!1233914 (=> (not res!822086) (not e!699912))))

(assert (=> b!1233914 (= res!822086 (validKeyInArray!0 k!2913))))

(declare-fun res!822092 () Bool)

(assert (=> start!102646 (=> (not res!822092) (not e!699912))))

(assert (=> start!102646 (= res!822092 (bvslt (size!38913 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102646 e!699912))

(declare-fun array_inv!29225 (array!79536) Bool)

(assert (=> start!102646 (array_inv!29225 a!3806)))

(assert (=> start!102646 true))

(assert (= (and start!102646 res!822092) b!1233914))

(assert (= (and b!1233914 res!822086) b!1233909))

(assert (= (and b!1233909 res!822088) b!1233906))

(assert (= (and b!1233906 res!822093) b!1233911))

(assert (= (and b!1233911 res!822085) b!1233905))

(assert (= (and b!1233905 res!822091) b!1233912))

(assert (= (and b!1233912 res!822087) b!1233910))

(assert (= (and b!1233910 res!822090) b!1233908))

(assert (= (and b!1233908 res!822089) b!1233913))

(assert (= (and b!1233913 res!822094) b!1233907))

(declare-fun m!1137961 () Bool)

(assert (=> b!1233908 m!1137961))

(assert (=> b!1233908 m!1137961))

(declare-fun m!1137963 () Bool)

(assert (=> b!1233908 m!1137963))

(declare-fun m!1137965 () Bool)

(assert (=> b!1233910 m!1137965))

(declare-fun m!1137967 () Bool)

(assert (=> b!1233914 m!1137967))

(declare-fun m!1137969 () Bool)

(assert (=> b!1233905 m!1137969))

(declare-fun m!1137971 () Bool)

(assert (=> b!1233906 m!1137971))

(declare-fun m!1137973 () Bool)

(assert (=> b!1233913 m!1137973))

(declare-fun m!1137975 () Bool)

(assert (=> b!1233913 m!1137975))

(assert (=> b!1233913 m!1137961))

(declare-fun m!1137977 () Bool)

(assert (=> b!1233913 m!1137977))

(assert (=> b!1233913 m!1137961))

(declare-fun m!1137979 () Bool)

(assert (=> b!1233913 m!1137979))

(assert (=> b!1233913 m!1137961))

(declare-fun m!1137981 () Bool)

(assert (=> b!1233913 m!1137981))

(declare-fun m!1137983 () Bool)

(assert (=> start!102646 m!1137983))

(assert (=> b!1233907 m!1137961))

(declare-fun m!1137985 () Bool)

(assert (=> b!1233907 m!1137985))

(declare-fun m!1137987 () Bool)

(assert (=> b!1233911 m!1137987))

(declare-fun m!1137989 () Bool)

(assert (=> b!1233912 m!1137989))

(push 1)

(assert (not b!1233907))

(assert (not b!1233911))

(assert (not b!1233906))

(assert (not b!1233905))

(assert (not b!1233913))

(assert (not start!102646))

(assert (not b!1233908))

(assert (not b!1233912))

(assert (not b!1233910))

(assert (not b!1233914))

(check-sat)

