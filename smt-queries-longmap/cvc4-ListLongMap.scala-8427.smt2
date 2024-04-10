; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102652 () Bool)

(assert start!102652)

(declare-fun res!822180 () Bool)

(declare-fun e!699938 () Bool)

(assert (=> start!102652 (=> (not res!822180) (not e!699938))))

(declare-datatypes ((array!79542 0))(
  ( (array!79543 (arr!38380 (Array (_ BitVec 32) (_ BitVec 64))) (size!38916 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79542)

(assert (=> start!102652 (= res!822180 (bvslt (size!38916 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102652 e!699938))

(declare-fun array_inv!29228 (array!79542) Bool)

(assert (=> start!102652 (array_inv!29228 a!3806)))

(assert (=> start!102652 true))

(declare-fun b!1233995 () Bool)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1233995 (= e!699938 (not (not (= (select (arr!38380 a!3806) from!3184) k!2913))))))

(declare-fun arrayContainsKey!0 (array!79542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233995 (not (arrayContainsKey!0 a!3806 (select (arr!38380 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40866 0))(
  ( (Unit!40867) )
))
(declare-fun lt!559786 () Unit!40866)

(declare-datatypes ((List!27153 0))(
  ( (Nil!27150) (Cons!27149 (h!28358 (_ BitVec 64)) (t!40616 List!27153)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79542 (_ BitVec 32) (_ BitVec 64) List!27153) Unit!40866)

(assert (=> b!1233995 (= lt!559786 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38380 a!3806) from!3184) (Cons!27149 (select (arr!38380 a!3806) from!3184) Nil!27150)))))

(declare-fun e!699937 () Bool)

(assert (=> b!1233995 e!699937))

(declare-fun res!822177 () Bool)

(assert (=> b!1233995 (=> (not res!822177) (not e!699937))))

(declare-fun arrayNoDuplicates!0 (array!79542 (_ BitVec 32) List!27153) Bool)

(assert (=> b!1233995 (= res!822177 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27150))))

(declare-fun lt!559787 () Unit!40866)

(declare-fun acc!823 () List!27153)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79542 List!27153 List!27153 (_ BitVec 32)) Unit!40866)

(assert (=> b!1233995 (= lt!559787 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27150 from!3184))))

(assert (=> b!1233995 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27149 (select (arr!38380 a!3806) from!3184) acc!823))))

(declare-fun b!1233996 () Bool)

(declare-fun res!822183 () Bool)

(assert (=> b!1233996 (=> (not res!822183) (not e!699938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233996 (= res!822183 (validKeyInArray!0 k!2913))))

(declare-fun b!1233997 () Bool)

(declare-fun res!822179 () Bool)

(assert (=> b!1233997 (=> (not res!822179) (not e!699938))))

(assert (=> b!1233997 (= res!822179 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233998 () Bool)

(assert (=> b!1233998 (= e!699937 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27149 (select (arr!38380 a!3806) from!3184) Nil!27150)))))

(declare-fun b!1233999 () Bool)

(declare-fun res!822178 () Bool)

(assert (=> b!1233999 (=> (not res!822178) (not e!699938))))

(declare-fun noDuplicate!1812 (List!27153) Bool)

(assert (=> b!1233999 (= res!822178 (noDuplicate!1812 acc!823))))

(declare-fun b!1234000 () Bool)

(declare-fun res!822175 () Bool)

(assert (=> b!1234000 (=> (not res!822175) (not e!699938))))

(assert (=> b!1234000 (= res!822175 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38916 a!3806)) (bvslt from!3184 (size!38916 a!3806))))))

(declare-fun b!1234001 () Bool)

(declare-fun res!822184 () Bool)

(assert (=> b!1234001 (=> (not res!822184) (not e!699938))))

(declare-fun contains!7215 (List!27153 (_ BitVec 64)) Bool)

(assert (=> b!1234001 (= res!822184 (not (contains!7215 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234002 () Bool)

(declare-fun res!822181 () Bool)

(assert (=> b!1234002 (=> (not res!822181) (not e!699938))))

(assert (=> b!1234002 (= res!822181 (validKeyInArray!0 (select (arr!38380 a!3806) from!3184)))))

(declare-fun b!1234003 () Bool)

(declare-fun res!822176 () Bool)

(assert (=> b!1234003 (=> (not res!822176) (not e!699938))))

(assert (=> b!1234003 (= res!822176 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1234004 () Bool)

(declare-fun res!822182 () Bool)

(assert (=> b!1234004 (=> (not res!822182) (not e!699938))))

(assert (=> b!1234004 (= res!822182 (not (contains!7215 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102652 res!822180) b!1233996))

(assert (= (and b!1233996 res!822183) b!1234000))

(assert (= (and b!1234000 res!822175) b!1233999))

(assert (= (and b!1233999 res!822178) b!1234004))

(assert (= (and b!1234004 res!822182) b!1234001))

(assert (= (and b!1234001 res!822184) b!1233997))

(assert (= (and b!1233997 res!822179) b!1234003))

(assert (= (and b!1234003 res!822176) b!1234002))

(assert (= (and b!1234002 res!822181) b!1233995))

(assert (= (and b!1233995 res!822177) b!1233998))

(declare-fun m!1138051 () Bool)

(assert (=> b!1233998 m!1138051))

(declare-fun m!1138053 () Bool)

(assert (=> b!1233998 m!1138053))

(declare-fun m!1138055 () Bool)

(assert (=> start!102652 m!1138055))

(declare-fun m!1138057 () Bool)

(assert (=> b!1233996 m!1138057))

(declare-fun m!1138059 () Bool)

(assert (=> b!1233999 m!1138059))

(declare-fun m!1138061 () Bool)

(assert (=> b!1234004 m!1138061))

(declare-fun m!1138063 () Bool)

(assert (=> b!1234003 m!1138063))

(declare-fun m!1138065 () Bool)

(assert (=> b!1233997 m!1138065))

(declare-fun m!1138067 () Bool)

(assert (=> b!1234001 m!1138067))

(declare-fun m!1138069 () Bool)

(assert (=> b!1233995 m!1138069))

(declare-fun m!1138071 () Bool)

(assert (=> b!1233995 m!1138071))

(assert (=> b!1233995 m!1138051))

(declare-fun m!1138073 () Bool)

(assert (=> b!1233995 m!1138073))

(assert (=> b!1233995 m!1138051))

(declare-fun m!1138075 () Bool)

(assert (=> b!1233995 m!1138075))

(assert (=> b!1233995 m!1138051))

(declare-fun m!1138077 () Bool)

(assert (=> b!1233995 m!1138077))

(assert (=> b!1234002 m!1138051))

(assert (=> b!1234002 m!1138051))

(declare-fun m!1138079 () Bool)

(assert (=> b!1234002 m!1138079))

(push 1)

(assert (not b!1233997))

(assert (not b!1233998))

(assert (not b!1234002))

(assert (not b!1234001))

