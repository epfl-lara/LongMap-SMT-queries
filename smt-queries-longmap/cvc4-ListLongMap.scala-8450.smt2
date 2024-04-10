; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102838 () Bool)

(assert start!102838)

(declare-fun b!1236049 () Bool)

(declare-fun res!824070 () Bool)

(declare-fun e!700687 () Bool)

(assert (=> b!1236049 (=> (not res!824070) (not e!700687))))

(declare-datatypes ((List!27222 0))(
  ( (Nil!27219) (Cons!27218 (h!28427 (_ BitVec 64)) (t!40685 List!27222)) )
))
(declare-fun acc!846 () List!27222)

(declare-fun contains!7284 (List!27222 (_ BitVec 64)) Bool)

(assert (=> b!1236049 (= res!824070 (not (contains!7284 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236050 () Bool)

(declare-fun e!700686 () Bool)

(assert (=> b!1236050 (= e!700686 (not true))))

(declare-datatypes ((array!79683 0))(
  ( (array!79684 (arr!38449 (Array (_ BitVec 32) (_ BitVec 64))) (size!38985 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79683)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1236050 (not (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-datatypes ((Unit!40991 0))(
  ( (Unit!40992) )
))
(declare-fun lt!560654 () Unit!40991)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79683 (_ BitVec 32) (_ BitVec 64) List!27222) Unit!40991)

(assert (=> b!1236050 (= lt!560654 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846))))

(declare-fun b!1236051 () Bool)

(declare-fun res!824069 () Bool)

(assert (=> b!1236051 (=> (not res!824069) (not e!700687))))

(declare-fun arrayNoDuplicates!0 (array!79683 (_ BitVec 32) List!27222) Bool)

(assert (=> b!1236051 (= res!824069 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236052 () Bool)

(declare-fun res!824076 () Bool)

(assert (=> b!1236052 (=> (not res!824076) (not e!700687))))

(assert (=> b!1236052 (= res!824076 (contains!7284 acc!846 k!2925))))

(declare-fun b!1236053 () Bool)

(declare-fun res!824075 () Bool)

(assert (=> b!1236053 (=> (not res!824075) (not e!700687))))

(assert (=> b!1236053 (= res!824075 (not (= from!3213 (bvsub (size!38985 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236054 () Bool)

(assert (=> b!1236054 (= e!700687 e!700686)))

(declare-fun res!824071 () Bool)

(assert (=> b!1236054 (=> (not res!824071) (not e!700686))))

(assert (=> b!1236054 (= res!824071 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38985 a!3835))))))

(declare-fun lt!560657 () Unit!40991)

(declare-fun e!700689 () Unit!40991)

(assert (=> b!1236054 (= lt!560657 e!700689)))

(declare-fun c!120850 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236054 (= c!120850 (validKeyInArray!0 (select (arr!38449 a!3835) from!3213)))))

(declare-fun b!1236055 () Bool)

(declare-fun lt!560652 () Unit!40991)

(assert (=> b!1236055 (= e!700689 lt!560652)))

(declare-fun lt!560656 () List!27222)

(assert (=> b!1236055 (= lt!560656 (Cons!27218 (select (arr!38449 a!3835) from!3213) acc!846))))

(declare-fun lt!560655 () Unit!40991)

(declare-fun lemmaListSubSeqRefl!0 (List!27222) Unit!40991)

(assert (=> b!1236055 (= lt!560655 (lemmaListSubSeqRefl!0 lt!560656))))

(declare-fun subseq!556 (List!27222 List!27222) Bool)

(assert (=> b!1236055 (subseq!556 lt!560656 lt!560656)))

(declare-fun lt!560653 () Unit!40991)

(declare-fun subseqTail!49 (List!27222 List!27222) Unit!40991)

(assert (=> b!1236055 (= lt!560653 (subseqTail!49 lt!560656 lt!560656))))

(assert (=> b!1236055 (subseq!556 acc!846 lt!560656)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79683 List!27222 List!27222 (_ BitVec 32)) Unit!40991)

(assert (=> b!1236055 (= lt!560652 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560656 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1236055 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!824073 () Bool)

(assert (=> start!102838 (=> (not res!824073) (not e!700687))))

(assert (=> start!102838 (= res!824073 (and (bvslt (size!38985 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38985 a!3835))))))

(assert (=> start!102838 e!700687))

(declare-fun array_inv!29297 (array!79683) Bool)

(assert (=> start!102838 (array_inv!29297 a!3835)))

(assert (=> start!102838 true))

(declare-fun b!1236056 () Bool)

(declare-fun res!824074 () Bool)

(assert (=> b!1236056 (=> (not res!824074) (not e!700687))))

(declare-fun noDuplicate!1881 (List!27222) Bool)

(assert (=> b!1236056 (= res!824074 (noDuplicate!1881 acc!846))))

(declare-fun b!1236057 () Bool)

(declare-fun res!824072 () Bool)

(assert (=> b!1236057 (=> (not res!824072) (not e!700687))))

(assert (=> b!1236057 (= res!824072 (not (contains!7284 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236058 () Bool)

(declare-fun Unit!40993 () Unit!40991)

(assert (=> b!1236058 (= e!700689 Unit!40993)))

(declare-fun b!1236059 () Bool)

(declare-fun res!824077 () Bool)

(assert (=> b!1236059 (=> (not res!824077) (not e!700686))))

(assert (=> b!1236059 (= res!824077 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(assert (= (and start!102838 res!824073) b!1236056))

(assert (= (and b!1236056 res!824074) b!1236057))

(assert (= (and b!1236057 res!824072) b!1236049))

(assert (= (and b!1236049 res!824070) b!1236051))

(assert (= (and b!1236051 res!824069) b!1236052))

(assert (= (and b!1236052 res!824076) b!1236053))

(assert (= (and b!1236053 res!824075) b!1236054))

(assert (= (and b!1236054 c!120850) b!1236055))

(assert (= (and b!1236054 (not c!120850)) b!1236058))

(assert (= (and b!1236054 res!824071) b!1236059))

(assert (= (and b!1236059 res!824077) b!1236050))

(declare-fun m!1139891 () Bool)

(assert (=> start!102838 m!1139891))

(declare-fun m!1139893 () Bool)

(assert (=> b!1236051 m!1139893))

(declare-fun m!1139895 () Bool)

(assert (=> b!1236059 m!1139895))

(declare-fun m!1139897 () Bool)

(assert (=> b!1236055 m!1139897))

(declare-fun m!1139899 () Bool)

(assert (=> b!1236055 m!1139899))

(declare-fun m!1139901 () Bool)

(assert (=> b!1236055 m!1139901))

(declare-fun m!1139903 () Bool)

(assert (=> b!1236055 m!1139903))

(declare-fun m!1139905 () Bool)

(assert (=> b!1236055 m!1139905))

(assert (=> b!1236055 m!1139895))

(declare-fun m!1139907 () Bool)

(assert (=> b!1236055 m!1139907))

(declare-fun m!1139909 () Bool)

(assert (=> b!1236049 m!1139909))

(declare-fun m!1139911 () Bool)

(assert (=> b!1236050 m!1139911))

(declare-fun m!1139913 () Bool)

(assert (=> b!1236050 m!1139913))

(declare-fun m!1139915 () Bool)

(assert (=> b!1236052 m!1139915))

(assert (=> b!1236054 m!1139907))

(assert (=> b!1236054 m!1139907))

(declare-fun m!1139917 () Bool)

(assert (=> b!1236054 m!1139917))

(declare-fun m!1139919 () Bool)

(assert (=> b!1236056 m!1139919))

(declare-fun m!1139921 () Bool)

(assert (=> b!1236057 m!1139921))

(push 1)

