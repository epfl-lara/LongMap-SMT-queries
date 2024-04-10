; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102832 () Bool)

(assert start!102832)

(declare-fun b!1235951 () Bool)

(declare-fun e!700650 () Bool)

(declare-fun e!700651 () Bool)

(assert (=> b!1235951 (= e!700650 e!700651)))

(declare-fun res!823994 () Bool)

(assert (=> b!1235951 (=> (not res!823994) (not e!700651))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79677 0))(
  ( (array!79678 (arr!38446 (Array (_ BitVec 32) (_ BitVec 64))) (size!38982 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79677)

(assert (=> b!1235951 (= res!823994 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38982 a!3835))))))

(declare-datatypes ((Unit!40982 0))(
  ( (Unit!40983) )
))
(declare-fun lt!560602 () Unit!40982)

(declare-fun e!700652 () Unit!40982)

(assert (=> b!1235951 (= lt!560602 e!700652)))

(declare-fun c!120841 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235951 (= c!120841 (validKeyInArray!0 (select (arr!38446 a!3835) from!3213)))))

(declare-fun b!1235952 () Bool)

(declare-fun res!823996 () Bool)

(assert (=> b!1235952 (=> (not res!823996) (not e!700650))))

(declare-datatypes ((List!27219 0))(
  ( (Nil!27216) (Cons!27215 (h!28424 (_ BitVec 64)) (t!40682 List!27219)) )
))
(declare-fun acc!846 () List!27219)

(declare-fun contains!7281 (List!27219 (_ BitVec 64)) Bool)

(assert (=> b!1235952 (= res!823996 (not (contains!7281 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235953 () Bool)

(declare-fun res!823989 () Bool)

(assert (=> b!1235953 (=> (not res!823989) (not e!700650))))

(declare-fun arrayNoDuplicates!0 (array!79677 (_ BitVec 32) List!27219) Bool)

(assert (=> b!1235953 (= res!823989 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235954 () Bool)

(declare-fun res!823993 () Bool)

(assert (=> b!1235954 (=> (not res!823993) (not e!700650))))

(declare-fun noDuplicate!1878 (List!27219) Bool)

(assert (=> b!1235954 (= res!823993 (noDuplicate!1878 acc!846))))

(declare-fun b!1235955 () Bool)

(declare-fun Unit!40984 () Unit!40982)

(assert (=> b!1235955 (= e!700652 Unit!40984)))

(declare-fun b!1235956 () Bool)

(declare-fun lt!560601 () Unit!40982)

(assert (=> b!1235956 (= e!700652 lt!560601)))

(declare-fun lt!560598 () List!27219)

(assert (=> b!1235956 (= lt!560598 (Cons!27215 (select (arr!38446 a!3835) from!3213) acc!846))))

(declare-fun lt!560603 () Unit!40982)

(declare-fun lemmaListSubSeqRefl!0 (List!27219) Unit!40982)

(assert (=> b!1235956 (= lt!560603 (lemmaListSubSeqRefl!0 lt!560598))))

(declare-fun subseq!553 (List!27219 List!27219) Bool)

(assert (=> b!1235956 (subseq!553 lt!560598 lt!560598)))

(declare-fun lt!560599 () Unit!40982)

(declare-fun subseqTail!46 (List!27219 List!27219) Unit!40982)

(assert (=> b!1235956 (= lt!560599 (subseqTail!46 lt!560598 lt!560598))))

(assert (=> b!1235956 (subseq!553 acc!846 lt!560598)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79677 List!27219 List!27219 (_ BitVec 32)) Unit!40982)

(assert (=> b!1235956 (= lt!560601 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560598 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235956 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235957 () Bool)

(declare-fun res!823990 () Bool)

(assert (=> b!1235957 (=> (not res!823990) (not e!700650))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235957 (= res!823990 (contains!7281 acc!846 k!2925))))

(declare-fun b!1235958 () Bool)

(declare-fun res!823995 () Bool)

(assert (=> b!1235958 (=> (not res!823995) (not e!700650))))

(assert (=> b!1235958 (= res!823995 (not (contains!7281 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!823992 () Bool)

(assert (=> start!102832 (=> (not res!823992) (not e!700650))))

(assert (=> start!102832 (= res!823992 (and (bvslt (size!38982 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38982 a!3835))))))

(assert (=> start!102832 e!700650))

(declare-fun array_inv!29294 (array!79677) Bool)

(assert (=> start!102832 (array_inv!29294 a!3835)))

(assert (=> start!102832 true))

(declare-fun b!1235959 () Bool)

(declare-fun res!823991 () Bool)

(assert (=> b!1235959 (=> (not res!823991) (not e!700650))))

(assert (=> b!1235959 (= res!823991 (not (= from!3213 (bvsub (size!38982 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235960 () Bool)

(assert (=> b!1235960 (= e!700651 false)))

(declare-fun lt!560600 () Bool)

(assert (=> b!1235960 (= lt!560600 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(assert (= (and start!102832 res!823992) b!1235954))

(assert (= (and b!1235954 res!823993) b!1235952))

(assert (= (and b!1235952 res!823996) b!1235958))

(assert (= (and b!1235958 res!823995) b!1235953))

(assert (= (and b!1235953 res!823989) b!1235957))

(assert (= (and b!1235957 res!823990) b!1235959))

(assert (= (and b!1235959 res!823991) b!1235951))

(assert (= (and b!1235951 c!120841) b!1235956))

(assert (= (and b!1235951 (not c!120841)) b!1235955))

(assert (= (and b!1235951 res!823994) b!1235960))

(declare-fun m!1139799 () Bool)

(assert (=> b!1235958 m!1139799))

(declare-fun m!1139801 () Bool)

(assert (=> b!1235953 m!1139801))

(declare-fun m!1139803 () Bool)

(assert (=> b!1235957 m!1139803))

(declare-fun m!1139805 () Bool)

(assert (=> b!1235954 m!1139805))

(declare-fun m!1139807 () Bool)

(assert (=> start!102832 m!1139807))

(declare-fun m!1139809 () Bool)

(assert (=> b!1235951 m!1139809))

(assert (=> b!1235951 m!1139809))

(declare-fun m!1139811 () Bool)

(assert (=> b!1235951 m!1139811))

(declare-fun m!1139813 () Bool)

(assert (=> b!1235952 m!1139813))

(declare-fun m!1139815 () Bool)

(assert (=> b!1235956 m!1139815))

(declare-fun m!1139817 () Bool)

(assert (=> b!1235956 m!1139817))

(declare-fun m!1139819 () Bool)

(assert (=> b!1235956 m!1139819))

(declare-fun m!1139821 () Bool)

(assert (=> b!1235956 m!1139821))

(declare-fun m!1139823 () Bool)

(assert (=> b!1235956 m!1139823))

(declare-fun m!1139825 () Bool)

(assert (=> b!1235956 m!1139825))

(assert (=> b!1235956 m!1139809))

(assert (=> b!1235960 m!1139823))

(push 1)

(assert (not b!1235957))

(assert (not b!1235960))

(assert (not b!1235954))

(assert (not start!102832))

(assert (not b!1235958))

