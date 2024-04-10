; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102642 () Bool)

(assert start!102642)

(declare-fun b!1233845 () Bool)

(declare-fun res!822034 () Bool)

(declare-fun e!699892 () Bool)

(assert (=> b!1233845 (=> (not res!822034) (not e!699892))))

(declare-datatypes ((List!27148 0))(
  ( (Nil!27145) (Cons!27144 (h!28353 (_ BitVec 64)) (t!40611 List!27148)) )
))
(declare-fun acc!823 () List!27148)

(declare-fun contains!7210 (List!27148 (_ BitVec 64)) Bool)

(assert (=> b!1233845 (= res!822034 (not (contains!7210 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233846 () Bool)

(declare-fun res!822025 () Bool)

(assert (=> b!1233846 (=> (not res!822025) (not e!699892))))

(declare-datatypes ((array!79532 0))(
  ( (array!79533 (arr!38375 (Array (_ BitVec 32) (_ BitVec 64))) (size!38911 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79532)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79532 (_ BitVec 32) List!27148) Bool)

(assert (=> b!1233846 (= res!822025 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233847 () Bool)

(declare-fun e!699893 () Bool)

(assert (=> b!1233847 (= e!699893 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27144 (select (arr!38375 a!3806) from!3184) Nil!27145)))))

(declare-fun b!1233848 () Bool)

(declare-fun res!822030 () Bool)

(assert (=> b!1233848 (=> (not res!822030) (not e!699892))))

(declare-fun noDuplicate!1807 (List!27148) Bool)

(assert (=> b!1233848 (= res!822030 (noDuplicate!1807 acc!823))))

(declare-fun b!1233849 () Bool)

(declare-fun res!822027 () Bool)

(assert (=> b!1233849 (=> (not res!822027) (not e!699892))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233849 (= res!822027 (validKeyInArray!0 k!2913))))

(declare-fun b!1233850 () Bool)

(declare-fun res!822033 () Bool)

(assert (=> b!1233850 (=> (not res!822033) (not e!699892))))

(assert (=> b!1233850 (= res!822033 (validKeyInArray!0 (select (arr!38375 a!3806) from!3184)))))

(declare-fun b!1233851 () Bool)

(declare-fun res!822031 () Bool)

(assert (=> b!1233851 (=> (not res!822031) (not e!699892))))

(assert (=> b!1233851 (= res!822031 (not (contains!7210 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233852 () Bool)

(declare-fun res!822032 () Bool)

(assert (=> b!1233852 (=> (not res!822032) (not e!699892))))

(declare-fun arrayContainsKey!0 (array!79532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233852 (= res!822032 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233853 () Bool)

(declare-fun res!822029 () Bool)

(assert (=> b!1233853 (=> (not res!822029) (not e!699892))))

(assert (=> b!1233853 (= res!822029 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38911 a!3806)) (bvslt from!3184 (size!38911 a!3806))))))

(declare-fun b!1233854 () Bool)

(assert (=> b!1233854 (= e!699892 (not true))))

(assert (=> b!1233854 (not (arrayContainsKey!0 a!3806 (select (arr!38375 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40856 0))(
  ( (Unit!40857) )
))
(declare-fun lt!559756 () Unit!40856)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79532 (_ BitVec 32) (_ BitVec 64) List!27148) Unit!40856)

(assert (=> b!1233854 (= lt!559756 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38375 a!3806) from!3184) (Cons!27144 (select (arr!38375 a!3806) from!3184) Nil!27145)))))

(assert (=> b!1233854 e!699893))

(declare-fun res!822028 () Bool)

(assert (=> b!1233854 (=> (not res!822028) (not e!699893))))

(assert (=> b!1233854 (= res!822028 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27145))))

(declare-fun lt!559757 () Unit!40856)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79532 List!27148 List!27148 (_ BitVec 32)) Unit!40856)

(assert (=> b!1233854 (= lt!559757 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27145 from!3184))))

(assert (=> b!1233854 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27144 (select (arr!38375 a!3806) from!3184) acc!823))))

(declare-fun res!822026 () Bool)

(assert (=> start!102642 (=> (not res!822026) (not e!699892))))

(assert (=> start!102642 (= res!822026 (bvslt (size!38911 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102642 e!699892))

(declare-fun array_inv!29223 (array!79532) Bool)

(assert (=> start!102642 (array_inv!29223 a!3806)))

(assert (=> start!102642 true))

(assert (= (and start!102642 res!822026) b!1233849))

(assert (= (and b!1233849 res!822027) b!1233853))

(assert (= (and b!1233853 res!822029) b!1233848))

(assert (= (and b!1233848 res!822030) b!1233851))

(assert (= (and b!1233851 res!822031) b!1233845))

(assert (= (and b!1233845 res!822034) b!1233852))

(assert (= (and b!1233852 res!822032) b!1233846))

(assert (= (and b!1233846 res!822025) b!1233850))

(assert (= (and b!1233850 res!822033) b!1233854))

(assert (= (and b!1233854 res!822028) b!1233847))

(declare-fun m!1137901 () Bool)

(assert (=> b!1233845 m!1137901))

(declare-fun m!1137903 () Bool)

(assert (=> b!1233846 m!1137903))

(declare-fun m!1137905 () Bool)

(assert (=> b!1233847 m!1137905))

(declare-fun m!1137907 () Bool)

(assert (=> b!1233847 m!1137907))

(declare-fun m!1137909 () Bool)

(assert (=> b!1233852 m!1137909))

(declare-fun m!1137911 () Bool)

(assert (=> b!1233848 m!1137911))

(declare-fun m!1137913 () Bool)

(assert (=> b!1233849 m!1137913))

(declare-fun m!1137915 () Bool)

(assert (=> b!1233854 m!1137915))

(declare-fun m!1137917 () Bool)

(assert (=> b!1233854 m!1137917))

(assert (=> b!1233854 m!1137905))

(declare-fun m!1137919 () Bool)

(assert (=> b!1233854 m!1137919))

(assert (=> b!1233854 m!1137905))

(declare-fun m!1137921 () Bool)

(assert (=> b!1233854 m!1137921))

(assert (=> b!1233854 m!1137905))

(declare-fun m!1137923 () Bool)

(assert (=> b!1233854 m!1137923))

(declare-fun m!1137925 () Bool)

(assert (=> start!102642 m!1137925))

(declare-fun m!1137927 () Bool)

(assert (=> b!1233851 m!1137927))

(assert (=> b!1233850 m!1137905))

(assert (=> b!1233850 m!1137905))

(declare-fun m!1137929 () Bool)

(assert (=> b!1233850 m!1137929))

(push 1)

(assert (not b!1233854))

(assert (not start!102642))

(assert (not b!1233849))

(assert (not b!1233851))

(assert (not b!1233852))

(assert (not b!1233848))

(assert (not b!1233846))

(assert (not b!1233847))

(assert (not b!1233850))

(assert (not b!1233845))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

