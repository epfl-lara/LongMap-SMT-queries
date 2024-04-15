; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102170 () Bool)

(assert start!102170)

(declare-fun b!1229912 () Bool)

(declare-fun res!818446 () Bool)

(declare-fun e!697936 () Bool)

(assert (=> b!1229912 (=> res!818446 e!697936)))

(declare-datatypes ((List!27128 0))(
  ( (Nil!27125) (Cons!27124 (h!28333 (_ BitVec 64)) (t!40582 List!27128)) )
))
(declare-fun lt!559122 () List!27128)

(declare-fun noDuplicate!1743 (List!27128) Bool)

(assert (=> b!1229912 (= res!818446 (not (noDuplicate!1743 lt!559122)))))

(declare-fun b!1229913 () Bool)

(declare-fun res!818435 () Bool)

(declare-fun e!697937 () Bool)

(assert (=> b!1229913 (=> (not res!818435) (not e!697937))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229913 (= res!818435 (validKeyInArray!0 k!2913))))

(declare-fun b!1229914 () Bool)

(assert (=> b!1229914 (= e!697936 true)))

(declare-datatypes ((array!79268 0))(
  ( (array!79269 (arr!38254 (Array (_ BitVec 32) (_ BitVec 64))) (size!38792 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79268)

(declare-fun lt!559123 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun contains!7100 (List!27128 (_ BitVec 64)) Bool)

(assert (=> b!1229914 (= lt!559123 (contains!7100 lt!559122 (select (arr!38254 a!3806) from!3184)))))

(declare-fun b!1229915 () Bool)

(declare-fun res!818436 () Bool)

(assert (=> b!1229915 (=> (not res!818436) (not e!697937))))

(assert (=> b!1229915 (= res!818436 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38792 a!3806)) (bvslt from!3184 (size!38792 a!3806))))))

(declare-fun b!1229916 () Bool)

(declare-fun res!818441 () Bool)

(assert (=> b!1229916 (=> (not res!818441) (not e!697937))))

(declare-fun acc!823 () List!27128)

(assert (=> b!1229916 (= res!818441 (not (contains!7100 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229917 () Bool)

(declare-fun res!818447 () Bool)

(assert (=> b!1229917 (=> (not res!818447) (not e!697937))))

(assert (=> b!1229917 (= res!818447 (validKeyInArray!0 (select (arr!38254 a!3806) from!3184)))))

(declare-fun b!1229918 () Bool)

(declare-fun e!697935 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79268 (_ BitVec 32) List!27128) Bool)

(assert (=> b!1229918 (= e!697935 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27124 (select (arr!38254 a!3806) from!3184) Nil!27125)))))

(declare-fun b!1229919 () Bool)

(declare-fun res!818443 () Bool)

(assert (=> b!1229919 (=> (not res!818443) (not e!697937))))

(assert (=> b!1229919 (= res!818443 (noDuplicate!1743 acc!823))))

(declare-fun b!1229920 () Bool)

(declare-fun res!818438 () Bool)

(assert (=> b!1229920 (=> (not res!818438) (not e!697937))))

(assert (=> b!1229920 (= res!818438 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229921 () Bool)

(declare-fun res!818442 () Bool)

(assert (=> b!1229921 (=> res!818442 e!697936)))

(assert (=> b!1229921 (= res!818442 (contains!7100 lt!559122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229922 () Bool)

(declare-fun res!818439 () Bool)

(assert (=> b!1229922 (=> res!818439 e!697936)))

(assert (=> b!1229922 (= res!818439 (contains!7100 lt!559122 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229923 () Bool)

(assert (=> b!1229923 (= e!697937 (not e!697936))))

(declare-fun res!818437 () Bool)

(assert (=> b!1229923 (=> res!818437 e!697936)))

(assert (=> b!1229923 (= res!818437 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229923 (= lt!559122 (Cons!27124 (select (arr!38254 a!3806) from!3184) Nil!27125))))

(assert (=> b!1229923 e!697935))

(declare-fun res!818440 () Bool)

(assert (=> b!1229923 (=> (not res!818440) (not e!697935))))

(assert (=> b!1229923 (= res!818440 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27125))))

(declare-datatypes ((Unit!40599 0))(
  ( (Unit!40600) )
))
(declare-fun lt!559124 () Unit!40599)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79268 List!27128 List!27128 (_ BitVec 32)) Unit!40599)

(assert (=> b!1229923 (= lt!559124 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27125 from!3184))))

(assert (=> b!1229923 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27124 (select (arr!38254 a!3806) from!3184) acc!823))))

(declare-fun res!818444 () Bool)

(assert (=> start!102170 (=> (not res!818444) (not e!697937))))

(assert (=> start!102170 (= res!818444 (bvslt (size!38792 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102170 e!697937))

(declare-fun array_inv!29237 (array!79268) Bool)

(assert (=> start!102170 (array_inv!29237 a!3806)))

(assert (=> start!102170 true))

(declare-fun b!1229924 () Bool)

(declare-fun res!818445 () Bool)

(assert (=> b!1229924 (=> (not res!818445) (not e!697937))))

(declare-fun arrayContainsKey!0 (array!79268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229924 (= res!818445 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229925 () Bool)

(declare-fun res!818434 () Bool)

(assert (=> b!1229925 (=> (not res!818434) (not e!697937))))

(assert (=> b!1229925 (= res!818434 (not (contains!7100 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102170 res!818444) b!1229913))

(assert (= (and b!1229913 res!818435) b!1229915))

(assert (= (and b!1229915 res!818436) b!1229919))

(assert (= (and b!1229919 res!818443) b!1229925))

(assert (= (and b!1229925 res!818434) b!1229916))

(assert (= (and b!1229916 res!818441) b!1229924))

(assert (= (and b!1229924 res!818445) b!1229920))

(assert (= (and b!1229920 res!818438) b!1229917))

(assert (= (and b!1229917 res!818447) b!1229923))

(assert (= (and b!1229923 res!818440) b!1229918))

(assert (= (and b!1229923 (not res!818437)) b!1229912))

(assert (= (and b!1229912 (not res!818446)) b!1229921))

(assert (= (and b!1229921 (not res!818442)) b!1229922))

(assert (= (and b!1229922 (not res!818439)) b!1229914))

(declare-fun m!1133939 () Bool)

(assert (=> b!1229919 m!1133939))

(declare-fun m!1133941 () Bool)

(assert (=> b!1229918 m!1133941))

(declare-fun m!1133943 () Bool)

(assert (=> b!1229918 m!1133943))

(assert (=> b!1229914 m!1133941))

(assert (=> b!1229914 m!1133941))

(declare-fun m!1133945 () Bool)

(assert (=> b!1229914 m!1133945))

(declare-fun m!1133947 () Bool)

(assert (=> b!1229922 m!1133947))

(declare-fun m!1133949 () Bool)

(assert (=> b!1229925 m!1133949))

(declare-fun m!1133951 () Bool)

(assert (=> b!1229916 m!1133951))

(declare-fun m!1133953 () Bool)

(assert (=> b!1229913 m!1133953))

(declare-fun m!1133955 () Bool)

(assert (=> b!1229920 m!1133955))

(declare-fun m!1133957 () Bool)

(assert (=> b!1229921 m!1133957))

(declare-fun m!1133959 () Bool)

(assert (=> b!1229924 m!1133959))

(assert (=> b!1229917 m!1133941))

(assert (=> b!1229917 m!1133941))

(declare-fun m!1133961 () Bool)

(assert (=> b!1229917 m!1133961))

(declare-fun m!1133963 () Bool)

(assert (=> b!1229912 m!1133963))

(assert (=> b!1229923 m!1133941))

(declare-fun m!1133965 () Bool)

(assert (=> b!1229923 m!1133965))

(declare-fun m!1133967 () Bool)

(assert (=> b!1229923 m!1133967))

(declare-fun m!1133969 () Bool)

(assert (=> b!1229923 m!1133969))

(declare-fun m!1133971 () Bool)

(assert (=> start!102170 m!1133971))

(push 1)

(assert (not b!1229922))

(assert (not b!1229919))

(assert (not b!1229920))

(assert (not b!1229923))

(assert (not b!1229916))

(assert (not b!1229925))

(assert (not b!1229914))

(assert (not b!1229924))

(assert (not b!1229912))

(assert (not b!1229917))

(assert (not b!1229913))

(assert (not b!1229921))

(assert (not start!102170))

(assert (not b!1229918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

