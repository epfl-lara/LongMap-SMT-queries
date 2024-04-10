; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114988 () Bool)

(assert start!114988)

(declare-fun b!1363002 () Bool)

(declare-fun res!906891 () Bool)

(declare-fun e!773038 () Bool)

(assert (=> b!1363002 (=> (not res!906891) (not e!773038))))

(declare-datatypes ((List!31807 0))(
  ( (Nil!31804) (Cons!31803 (h!33012 (_ BitVec 64)) (t!46495 List!31807)) )
))
(declare-fun acc!759 () List!31807)

(declare-fun noDuplicate!2373 (List!31807) Bool)

(assert (=> b!1363002 (= res!906891 (noDuplicate!2373 acc!759))))

(declare-fun b!1363003 () Bool)

(declare-fun res!906896 () Bool)

(assert (=> b!1363003 (=> (not res!906896) (not e!773038))))

(declare-datatypes ((array!92666 0))(
  ( (array!92667 (arr!44766 (Array (_ BitVec 32) (_ BitVec 64))) (size!45316 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92666)

(declare-fun arrayNoDuplicates!0 (array!92666 (_ BitVec 32) List!31807) Bool)

(assert (=> b!1363003 (= res!906896 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31804))))

(declare-fun res!906897 () Bool)

(assert (=> start!114988 (=> (not res!906897) (not e!773038))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114988 (= res!906897 (and (bvslt (size!45316 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45316 a!3742))))))

(assert (=> start!114988 e!773038))

(assert (=> start!114988 true))

(declare-fun array_inv!33794 (array!92666) Bool)

(assert (=> start!114988 (array_inv!33794 a!3742)))

(declare-fun b!1363004 () Bool)

(declare-fun res!906894 () Bool)

(assert (=> b!1363004 (=> (not res!906894) (not e!773038))))

(assert (=> b!1363004 (= res!906894 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363005 () Bool)

(declare-fun res!906898 () Bool)

(assert (=> b!1363005 (=> (not res!906898) (not e!773038))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363005 (= res!906898 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363006 () Bool)

(assert (=> b!1363006 (= e!773038 false)))

(declare-datatypes ((Unit!44958 0))(
  ( (Unit!44959) )
))
(declare-fun lt!600647 () Unit!44958)

(declare-fun e!773036 () Unit!44958)

(assert (=> b!1363006 (= lt!600647 e!773036)))

(declare-fun c!127496 () Bool)

(assert (=> b!1363006 (= c!127496 (validKeyInArray!0 (select (arr!44766 a!3742) from!3120)))))

(declare-fun b!1363007 () Bool)

(declare-fun res!906890 () Bool)

(assert (=> b!1363007 (=> (not res!906890) (not e!773038))))

(declare-fun contains!9516 (List!31807 (_ BitVec 64)) Bool)

(assert (=> b!1363007 (= res!906890 (not (contains!9516 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363008 () Bool)

(declare-fun lt!600648 () Unit!44958)

(assert (=> b!1363008 (= e!773036 lt!600648)))

(declare-fun lt!600649 () Unit!44958)

(declare-fun lemmaListSubSeqRefl!0 (List!31807) Unit!44958)

(assert (=> b!1363008 (= lt!600649 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!918 (List!31807 List!31807) Bool)

(assert (=> b!1363008 (subseq!918 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92666 List!31807 List!31807 (_ BitVec 32)) Unit!44958)

(declare-fun $colon$colon!921 (List!31807 (_ BitVec 64)) List!31807)

(assert (=> b!1363008 (= lt!600648 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!921 acc!759 (select (arr!44766 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363008 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363009 () Bool)

(declare-fun res!906892 () Bool)

(assert (=> b!1363009 (=> (not res!906892) (not e!773038))))

(assert (=> b!1363009 (= res!906892 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45316 a!3742)))))

(declare-fun b!1363010 () Bool)

(declare-fun res!906895 () Bool)

(assert (=> b!1363010 (=> (not res!906895) (not e!773038))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363010 (= res!906895 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45316 a!3742))))))

(declare-fun b!1363011 () Bool)

(declare-fun Unit!44960 () Unit!44958)

(assert (=> b!1363011 (= e!773036 Unit!44960)))

(declare-fun b!1363012 () Bool)

(declare-fun res!906893 () Bool)

(assert (=> b!1363012 (=> (not res!906893) (not e!773038))))

(assert (=> b!1363012 (= res!906893 (not (contains!9516 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114988 res!906897) b!1363002))

(assert (= (and b!1363002 res!906891) b!1363007))

(assert (= (and b!1363007 res!906890) b!1363012))

(assert (= (and b!1363012 res!906893) b!1363003))

(assert (= (and b!1363003 res!906896) b!1363004))

(assert (= (and b!1363004 res!906894) b!1363010))

(assert (= (and b!1363010 res!906895) b!1363005))

(assert (= (and b!1363005 res!906898) b!1363009))

(assert (= (and b!1363009 res!906892) b!1363006))

(assert (= (and b!1363006 c!127496) b!1363008))

(assert (= (and b!1363006 (not c!127496)) b!1363011))

(declare-fun m!1247891 () Bool)

(assert (=> start!114988 m!1247891))

(declare-fun m!1247893 () Bool)

(assert (=> b!1363008 m!1247893))

(declare-fun m!1247895 () Bool)

(assert (=> b!1363008 m!1247895))

(declare-fun m!1247897 () Bool)

(assert (=> b!1363008 m!1247897))

(declare-fun m!1247899 () Bool)

(assert (=> b!1363008 m!1247899))

(declare-fun m!1247901 () Bool)

(assert (=> b!1363008 m!1247901))

(assert (=> b!1363008 m!1247895))

(assert (=> b!1363008 m!1247897))

(declare-fun m!1247903 () Bool)

(assert (=> b!1363008 m!1247903))

(declare-fun m!1247905 () Bool)

(assert (=> b!1363003 m!1247905))

(declare-fun m!1247907 () Bool)

(assert (=> b!1363005 m!1247907))

(assert (=> b!1363006 m!1247895))

(assert (=> b!1363006 m!1247895))

(declare-fun m!1247909 () Bool)

(assert (=> b!1363006 m!1247909))

(declare-fun m!1247911 () Bool)

(assert (=> b!1363004 m!1247911))

(declare-fun m!1247913 () Bool)

(assert (=> b!1363007 m!1247913))

(declare-fun m!1247915 () Bool)

(assert (=> b!1363002 m!1247915))

(declare-fun m!1247917 () Bool)

(assert (=> b!1363012 m!1247917))

(check-sat (not b!1363008) (not b!1363006) (not b!1363007) (not b!1363005) (not b!1363002) (not b!1363012) (not start!114988) (not b!1363003) (not b!1363004))
(check-sat)
