; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102138 () Bool)

(assert start!102138)

(declare-fun b!1229266 () Bool)

(declare-fun res!817762 () Bool)

(declare-fun e!697764 () Bool)

(assert (=> b!1229266 (=> (not res!817762) (not e!697764))))

(declare-datatypes ((array!79313 0))(
  ( (array!79314 (arr!38276 (Array (_ BitVec 32) (_ BitVec 64))) (size!38812 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79313)

(declare-datatypes ((List!27049 0))(
  ( (Nil!27046) (Cons!27045 (h!28254 (_ BitVec 64)) (t!40512 List!27049)) )
))
(declare-fun acc!823 () List!27049)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79313 (_ BitVec 32) List!27049) Bool)

(assert (=> b!1229266 (= res!817762 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229267 () Bool)

(declare-fun res!817757 () Bool)

(assert (=> b!1229267 (=> (not res!817757) (not e!697764))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229267 (= res!817757 (validKeyInArray!0 k!2913))))

(declare-fun b!1229268 () Bool)

(declare-fun res!817758 () Bool)

(assert (=> b!1229268 (=> (not res!817758) (not e!697764))))

(assert (=> b!1229268 (= res!817758 (validKeyInArray!0 (select (arr!38276 a!3806) from!3184)))))

(declare-fun b!1229269 () Bool)

(declare-fun res!817764 () Bool)

(declare-fun e!697765 () Bool)

(assert (=> b!1229269 (=> res!817764 e!697765)))

(declare-fun lt!559144 () List!27049)

(declare-fun contains!7111 (List!27049 (_ BitVec 64)) Bool)

(assert (=> b!1229269 (= res!817764 (contains!7111 lt!559144 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!817755 () Bool)

(assert (=> start!102138 (=> (not res!817755) (not e!697764))))

(assert (=> start!102138 (= res!817755 (bvslt (size!38812 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102138 e!697764))

(declare-fun array_inv!29124 (array!79313) Bool)

(assert (=> start!102138 (array_inv!29124 a!3806)))

(assert (=> start!102138 true))

(declare-fun b!1229270 () Bool)

(declare-fun res!817760 () Bool)

(assert (=> b!1229270 (=> (not res!817760) (not e!697764))))

(assert (=> b!1229270 (= res!817760 (not (contains!7111 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229271 () Bool)

(assert (=> b!1229271 (= e!697765 true)))

(declare-fun lt!559143 () Bool)

(assert (=> b!1229271 (= lt!559143 (contains!7111 lt!559144 (select (arr!38276 a!3806) from!3184)))))

(declare-fun b!1229272 () Bool)

(declare-fun res!817761 () Bool)

(assert (=> b!1229272 (=> (not res!817761) (not e!697764))))

(declare-fun noDuplicate!1708 (List!27049) Bool)

(assert (=> b!1229272 (= res!817761 (noDuplicate!1708 acc!823))))

(declare-fun b!1229273 () Bool)

(declare-fun res!817756 () Bool)

(assert (=> b!1229273 (=> res!817756 e!697765)))

(assert (=> b!1229273 (= res!817756 (contains!7111 lt!559144 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229274 () Bool)

(declare-fun res!817763 () Bool)

(assert (=> b!1229274 (=> (not res!817763) (not e!697764))))

(assert (=> b!1229274 (= res!817763 (not (contains!7111 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229275 () Bool)

(declare-fun res!817759 () Bool)

(assert (=> b!1229275 (=> res!817759 e!697765)))

(assert (=> b!1229275 (= res!817759 (not (noDuplicate!1708 lt!559144)))))

(declare-fun b!1229276 () Bool)

(assert (=> b!1229276 (= e!697764 (not e!697765))))

(declare-fun res!817753 () Bool)

(assert (=> b!1229276 (=> res!817753 e!697765)))

(assert (=> b!1229276 (= res!817753 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229276 (= lt!559144 (Cons!27045 (select (arr!38276 a!3806) from!3184) Nil!27046))))

(declare-fun e!697766 () Bool)

(assert (=> b!1229276 e!697766))

(declare-fun res!817765 () Bool)

(assert (=> b!1229276 (=> (not res!817765) (not e!697766))))

(assert (=> b!1229276 (= res!817765 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27046))))

(declare-datatypes ((Unit!40718 0))(
  ( (Unit!40719) )
))
(declare-fun lt!559145 () Unit!40718)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79313 List!27049 List!27049 (_ BitVec 32)) Unit!40718)

(assert (=> b!1229276 (= lt!559145 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27046 from!3184))))

(assert (=> b!1229276 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27045 (select (arr!38276 a!3806) from!3184) acc!823))))

(declare-fun b!1229277 () Bool)

(declare-fun res!817754 () Bool)

(assert (=> b!1229277 (=> (not res!817754) (not e!697764))))

(declare-fun arrayContainsKey!0 (array!79313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229277 (= res!817754 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229278 () Bool)

(declare-fun res!817752 () Bool)

(assert (=> b!1229278 (=> (not res!817752) (not e!697764))))

(assert (=> b!1229278 (= res!817752 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38812 a!3806)) (bvslt from!3184 (size!38812 a!3806))))))

(declare-fun b!1229279 () Bool)

(assert (=> b!1229279 (= e!697766 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27045 (select (arr!38276 a!3806) from!3184) Nil!27046)))))

(assert (= (and start!102138 res!817755) b!1229267))

(assert (= (and b!1229267 res!817757) b!1229278))

(assert (= (and b!1229278 res!817752) b!1229272))

(assert (= (and b!1229272 res!817761) b!1229274))

(assert (= (and b!1229274 res!817763) b!1229270))

(assert (= (and b!1229270 res!817760) b!1229277))

(assert (= (and b!1229277 res!817754) b!1229266))

(assert (= (and b!1229266 res!817762) b!1229268))

(assert (= (and b!1229268 res!817758) b!1229276))

(assert (= (and b!1229276 res!817765) b!1229279))

(assert (= (and b!1229276 (not res!817753)) b!1229275))

(assert (= (and b!1229275 (not res!817759)) b!1229269))

(assert (= (and b!1229269 (not res!817764)) b!1229273))

(assert (= (and b!1229273 (not res!817756)) b!1229271))

(declare-fun m!1133857 () Bool)

(assert (=> b!1229277 m!1133857))

(declare-fun m!1133859 () Bool)

(assert (=> b!1229270 m!1133859))

(declare-fun m!1133861 () Bool)

(assert (=> b!1229276 m!1133861))

(declare-fun m!1133863 () Bool)

(assert (=> b!1229276 m!1133863))

(declare-fun m!1133865 () Bool)

(assert (=> b!1229276 m!1133865))

(declare-fun m!1133867 () Bool)

(assert (=> b!1229276 m!1133867))

(assert (=> b!1229271 m!1133861))

(assert (=> b!1229271 m!1133861))

(declare-fun m!1133869 () Bool)

(assert (=> b!1229271 m!1133869))

(declare-fun m!1133871 () Bool)

(assert (=> b!1229272 m!1133871))

(assert (=> b!1229279 m!1133861))

(declare-fun m!1133873 () Bool)

(assert (=> b!1229279 m!1133873))

(declare-fun m!1133875 () Bool)

(assert (=> b!1229274 m!1133875))

(declare-fun m!1133877 () Bool)

(assert (=> b!1229266 m!1133877))

(declare-fun m!1133879 () Bool)

(assert (=> b!1229275 m!1133879))

(declare-fun m!1133881 () Bool)

(assert (=> b!1229267 m!1133881))

(declare-fun m!1133883 () Bool)

(assert (=> start!102138 m!1133883))

(assert (=> b!1229268 m!1133861))

(assert (=> b!1229268 m!1133861))

(declare-fun m!1133885 () Bool)

(assert (=> b!1229268 m!1133885))

(declare-fun m!1133887 () Bool)

(assert (=> b!1229269 m!1133887))

(declare-fun m!1133889 () Bool)

(assert (=> b!1229273 m!1133889))

(push 1)

(assert (not b!1229275))

(assert (not b!1229268))

(assert (not b!1229274))

(assert (not b!1229271))

(assert (not b!1229272))

(assert (not b!1229273))

(assert (not start!102138))

(assert (not b!1229279))

(assert (not b!1229267))

(assert (not b!1229270))

(assert (not b!1229269))

(assert (not b!1229276))

(assert (not b!1229277))

(assert (not b!1229266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

