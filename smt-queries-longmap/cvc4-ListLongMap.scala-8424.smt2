; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102634 () Bool)

(assert start!102634)

(declare-fun res!821908 () Bool)

(declare-fun e!699857 () Bool)

(assert (=> start!102634 (=> (not res!821908) (not e!699857))))

(declare-datatypes ((array!79524 0))(
  ( (array!79525 (arr!38371 (Array (_ BitVec 32) (_ BitVec 64))) (size!38907 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79524)

(assert (=> start!102634 (= res!821908 (bvslt (size!38907 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102634 e!699857))

(declare-fun array_inv!29219 (array!79524) Bool)

(assert (=> start!102634 (array_inv!29219 a!3806)))

(assert (=> start!102634 true))

(declare-fun b!1233725 () Bool)

(declare-fun res!821913 () Bool)

(assert (=> b!1233725 (=> (not res!821913) (not e!699857))))

(declare-datatypes ((List!27144 0))(
  ( (Nil!27141) (Cons!27140 (h!28349 (_ BitVec 64)) (t!40607 List!27144)) )
))
(declare-fun acc!823 () List!27144)

(declare-fun contains!7206 (List!27144 (_ BitVec 64)) Bool)

(assert (=> b!1233725 (= res!821913 (not (contains!7206 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233726 () Bool)

(declare-fun res!821912 () Bool)

(assert (=> b!1233726 (=> (not res!821912) (not e!699857))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233726 (= res!821912 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233727 () Bool)

(declare-fun res!821906 () Bool)

(assert (=> b!1233727 (=> (not res!821906) (not e!699857))))

(declare-fun arrayNoDuplicates!0 (array!79524 (_ BitVec 32) List!27144) Bool)

(assert (=> b!1233727 (= res!821906 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233728 () Bool)

(declare-fun e!699856 () Bool)

(assert (=> b!1233728 (= e!699856 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27140 (select (arr!38371 a!3806) from!3184) Nil!27141)))))

(declare-fun b!1233729 () Bool)

(declare-fun res!821909 () Bool)

(assert (=> b!1233729 (=> (not res!821909) (not e!699857))))

(declare-fun noDuplicate!1803 (List!27144) Bool)

(assert (=> b!1233729 (= res!821909 (noDuplicate!1803 acc!823))))

(declare-fun b!1233730 () Bool)

(declare-fun res!821910 () Bool)

(assert (=> b!1233730 (=> (not res!821910) (not e!699857))))

(assert (=> b!1233730 (= res!821910 (not (contains!7206 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233731 () Bool)

(declare-fun res!821905 () Bool)

(assert (=> b!1233731 (=> (not res!821905) (not e!699857))))

(assert (=> b!1233731 (= res!821905 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38907 a!3806)) (bvslt from!3184 (size!38907 a!3806))))))

(declare-fun b!1233732 () Bool)

(declare-fun res!821911 () Bool)

(assert (=> b!1233732 (=> (not res!821911) (not e!699857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233732 (= res!821911 (validKeyInArray!0 k!2913))))

(declare-fun b!1233733 () Bool)

(assert (=> b!1233733 (= e!699857 (not true))))

(assert (=> b!1233733 (not (arrayContainsKey!0 a!3806 (select (arr!38371 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40848 0))(
  ( (Unit!40849) )
))
(declare-fun lt!559732 () Unit!40848)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79524 (_ BitVec 32) (_ BitVec 64) List!27144) Unit!40848)

(assert (=> b!1233733 (= lt!559732 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38371 a!3806) from!3184) (Cons!27140 (select (arr!38371 a!3806) from!3184) Nil!27141)))))

(assert (=> b!1233733 e!699856))

(declare-fun res!821907 () Bool)

(assert (=> b!1233733 (=> (not res!821907) (not e!699856))))

(assert (=> b!1233733 (= res!821907 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27141))))

(declare-fun lt!559733 () Unit!40848)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79524 List!27144 List!27144 (_ BitVec 32)) Unit!40848)

(assert (=> b!1233733 (= lt!559733 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27141 from!3184))))

(assert (=> b!1233733 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27140 (select (arr!38371 a!3806) from!3184) acc!823))))

(declare-fun b!1233734 () Bool)

(declare-fun res!821914 () Bool)

(assert (=> b!1233734 (=> (not res!821914) (not e!699857))))

(assert (=> b!1233734 (= res!821914 (validKeyInArray!0 (select (arr!38371 a!3806) from!3184)))))

(assert (= (and start!102634 res!821908) b!1233732))

(assert (= (and b!1233732 res!821911) b!1233731))

(assert (= (and b!1233731 res!821905) b!1233729))

(assert (= (and b!1233729 res!821909) b!1233725))

(assert (= (and b!1233725 res!821913) b!1233730))

(assert (= (and b!1233730 res!821910) b!1233726))

(assert (= (and b!1233726 res!821912) b!1233727))

(assert (= (and b!1233727 res!821906) b!1233734))

(assert (= (and b!1233734 res!821914) b!1233733))

(assert (= (and b!1233733 res!821907) b!1233728))

(declare-fun m!1137781 () Bool)

(assert (=> start!102634 m!1137781))

(declare-fun m!1137783 () Bool)

(assert (=> b!1233730 m!1137783))

(declare-fun m!1137785 () Bool)

(assert (=> b!1233726 m!1137785))

(declare-fun m!1137787 () Bool)

(assert (=> b!1233733 m!1137787))

(declare-fun m!1137789 () Bool)

(assert (=> b!1233733 m!1137789))

(declare-fun m!1137791 () Bool)

(assert (=> b!1233733 m!1137791))

(declare-fun m!1137793 () Bool)

(assert (=> b!1233733 m!1137793))

(assert (=> b!1233733 m!1137791))

(declare-fun m!1137795 () Bool)

(assert (=> b!1233733 m!1137795))

(assert (=> b!1233733 m!1137791))

(declare-fun m!1137797 () Bool)

(assert (=> b!1233733 m!1137797))

(declare-fun m!1137799 () Bool)

(assert (=> b!1233727 m!1137799))

(declare-fun m!1137801 () Bool)

(assert (=> b!1233725 m!1137801))

(assert (=> b!1233734 m!1137791))

(assert (=> b!1233734 m!1137791))

(declare-fun m!1137803 () Bool)

(assert (=> b!1233734 m!1137803))

(assert (=> b!1233728 m!1137791))

(declare-fun m!1137805 () Bool)

(assert (=> b!1233728 m!1137805))

(declare-fun m!1137807 () Bool)

(assert (=> b!1233729 m!1137807))

(declare-fun m!1137809 () Bool)

(assert (=> b!1233732 m!1137809))

(push 1)

(assert (not b!1233732))

(assert (not b!1233726))

(assert (not b!1233733))

(assert (not b!1233730))

(assert (not b!1233727))

(assert (not b!1233725))

(assert (not start!102634))

(assert (not b!1233734))

(assert (not b!1233728))

(assert (not b!1233729))

(check-sat)

(pop 1)

(push 1)

