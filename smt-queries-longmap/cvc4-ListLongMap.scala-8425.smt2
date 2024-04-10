; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102640 () Bool)

(assert start!102640)

(declare-fun b!1233816 () Bool)

(declare-fun res!822000 () Bool)

(declare-fun e!699885 () Bool)

(assert (=> b!1233816 (=> (not res!822000) (not e!699885))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233816 (= res!822000 (validKeyInArray!0 k!2913))))

(declare-fun b!1233817 () Bool)

(declare-fun res!821995 () Bool)

(assert (=> b!1233817 (=> (not res!821995) (not e!699885))))

(declare-datatypes ((List!27147 0))(
  ( (Nil!27144) (Cons!27143 (h!28352 (_ BitVec 64)) (t!40610 List!27147)) )
))
(declare-fun acc!823 () List!27147)

(declare-fun contains!7209 (List!27147 (_ BitVec 64)) Bool)

(assert (=> b!1233817 (= res!821995 (not (contains!7209 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233818 () Bool)

(declare-fun e!699884 () Bool)

(declare-datatypes ((array!79530 0))(
  ( (array!79531 (arr!38374 (Array (_ BitVec 32) (_ BitVec 64))) (size!38910 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79530)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79530 (_ BitVec 32) List!27147) Bool)

(assert (=> b!1233818 (= e!699884 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27143 (select (arr!38374 a!3806) from!3184) Nil!27144)))))

(declare-fun b!1233819 () Bool)

(declare-fun res!822004 () Bool)

(assert (=> b!1233819 (=> (not res!822004) (not e!699885))))

(assert (=> b!1233819 (= res!822004 (not (contains!7209 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233820 () Bool)

(declare-fun res!822001 () Bool)

(assert (=> b!1233820 (=> (not res!822001) (not e!699885))))

(assert (=> b!1233820 (= res!822001 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233821 () Bool)

(declare-fun res!821997 () Bool)

(assert (=> b!1233821 (=> (not res!821997) (not e!699885))))

(assert (=> b!1233821 (= res!821997 (validKeyInArray!0 (select (arr!38374 a!3806) from!3184)))))

(declare-fun b!1233822 () Bool)

(declare-fun res!821999 () Bool)

(assert (=> b!1233822 (=> (not res!821999) (not e!699885))))

(declare-fun noDuplicate!1806 (List!27147) Bool)

(assert (=> b!1233822 (= res!821999 (noDuplicate!1806 acc!823))))

(declare-fun res!821998 () Bool)

(assert (=> start!102640 (=> (not res!821998) (not e!699885))))

(assert (=> start!102640 (= res!821998 (bvslt (size!38910 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102640 e!699885))

(declare-fun array_inv!29222 (array!79530) Bool)

(assert (=> start!102640 (array_inv!29222 a!3806)))

(assert (=> start!102640 true))

(declare-fun b!1233815 () Bool)

(declare-fun res!822002 () Bool)

(assert (=> b!1233815 (=> (not res!822002) (not e!699885))))

(declare-fun arrayContainsKey!0 (array!79530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233815 (= res!822002 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233823 () Bool)

(declare-fun res!821996 () Bool)

(assert (=> b!1233823 (=> (not res!821996) (not e!699885))))

(assert (=> b!1233823 (= res!821996 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38910 a!3806)) (bvslt from!3184 (size!38910 a!3806))))))

(declare-fun b!1233824 () Bool)

(assert (=> b!1233824 (= e!699885 (not true))))

(assert (=> b!1233824 (not (arrayContainsKey!0 a!3806 (select (arr!38374 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40854 0))(
  ( (Unit!40855) )
))
(declare-fun lt!559751 () Unit!40854)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79530 (_ BitVec 32) (_ BitVec 64) List!27147) Unit!40854)

(assert (=> b!1233824 (= lt!559751 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38374 a!3806) from!3184) (Cons!27143 (select (arr!38374 a!3806) from!3184) Nil!27144)))))

(assert (=> b!1233824 e!699884))

(declare-fun res!822003 () Bool)

(assert (=> b!1233824 (=> (not res!822003) (not e!699884))))

(assert (=> b!1233824 (= res!822003 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27144))))

(declare-fun lt!559750 () Unit!40854)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79530 List!27147 List!27147 (_ BitVec 32)) Unit!40854)

(assert (=> b!1233824 (= lt!559750 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27144 from!3184))))

(assert (=> b!1233824 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27143 (select (arr!38374 a!3806) from!3184) acc!823))))

(assert (= (and start!102640 res!821998) b!1233816))

(assert (= (and b!1233816 res!822000) b!1233823))

(assert (= (and b!1233823 res!821996) b!1233822))

(assert (= (and b!1233822 res!821999) b!1233819))

(assert (= (and b!1233819 res!822004) b!1233817))

(assert (= (and b!1233817 res!821995) b!1233815))

(assert (= (and b!1233815 res!822002) b!1233820))

(assert (= (and b!1233820 res!822001) b!1233821))

(assert (= (and b!1233821 res!821997) b!1233824))

(assert (= (and b!1233824 res!822003) b!1233818))

(declare-fun m!1137871 () Bool)

(assert (=> b!1233824 m!1137871))

(declare-fun m!1137873 () Bool)

(assert (=> b!1233824 m!1137873))

(declare-fun m!1137875 () Bool)

(assert (=> b!1233824 m!1137875))

(declare-fun m!1137877 () Bool)

(assert (=> b!1233824 m!1137877))

(assert (=> b!1233824 m!1137875))

(declare-fun m!1137879 () Bool)

(assert (=> b!1233824 m!1137879))

(assert (=> b!1233824 m!1137875))

(declare-fun m!1137881 () Bool)

(assert (=> b!1233824 m!1137881))

(declare-fun m!1137883 () Bool)

(assert (=> b!1233819 m!1137883))

(declare-fun m!1137885 () Bool)

(assert (=> b!1233817 m!1137885))

(assert (=> b!1233818 m!1137875))

(declare-fun m!1137887 () Bool)

(assert (=> b!1233818 m!1137887))

(assert (=> b!1233821 m!1137875))

(assert (=> b!1233821 m!1137875))

(declare-fun m!1137889 () Bool)

(assert (=> b!1233821 m!1137889))

(declare-fun m!1137891 () Bool)

(assert (=> start!102640 m!1137891))

(declare-fun m!1137893 () Bool)

(assert (=> b!1233816 m!1137893))

(declare-fun m!1137895 () Bool)

(assert (=> b!1233822 m!1137895))

(declare-fun m!1137897 () Bool)

(assert (=> b!1233815 m!1137897))

(declare-fun m!1137899 () Bool)

(assert (=> b!1233820 m!1137899))

(push 1)

(assert (not b!1233819))

(assert (not b!1233817))

(assert (not start!102640))

(assert (not b!1233824))

(assert (not b!1233822))

(assert (not b!1233821))

(assert (not b!1233815))

(assert (not b!1233816))

(assert (not b!1233820))

(assert (not b!1233818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

