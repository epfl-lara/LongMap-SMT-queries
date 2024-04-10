; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114994 () Bool)

(assert start!114994)

(declare-fun b!1363101 () Bool)

(declare-fun res!906973 () Bool)

(declare-fun e!773065 () Bool)

(assert (=> b!1363101 (=> (not res!906973) (not e!773065))))

(declare-datatypes ((array!92672 0))(
  ( (array!92673 (arr!44769 (Array (_ BitVec 32) (_ BitVec 64))) (size!45319 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92672)

(declare-datatypes ((List!31810 0))(
  ( (Nil!31807) (Cons!31806 (h!33015 (_ BitVec 64)) (t!46498 List!31810)) )
))
(declare-fun arrayNoDuplicates!0 (array!92672 (_ BitVec 32) List!31810) Bool)

(assert (=> b!1363101 (= res!906973 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31807))))

(declare-fun b!1363102 () Bool)

(assert (=> b!1363102 (= e!773065 false)))

(declare-datatypes ((Unit!44967 0))(
  ( (Unit!44968) )
))
(declare-fun lt!600674 () Unit!44967)

(declare-fun e!773064 () Unit!44967)

(assert (=> b!1363102 (= lt!600674 e!773064)))

(declare-fun c!127505 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363102 (= c!127505 (validKeyInArray!0 (select (arr!44769 a!3742) from!3120)))))

(declare-fun b!1363103 () Bool)

(declare-fun res!906971 () Bool)

(assert (=> b!1363103 (=> (not res!906971) (not e!773065))))

(declare-fun acc!759 () List!31810)

(declare-fun noDuplicate!2376 (List!31810) Bool)

(assert (=> b!1363103 (= res!906971 (noDuplicate!2376 acc!759))))

(declare-fun b!1363104 () Bool)

(declare-fun res!906972 () Bool)

(assert (=> b!1363104 (=> (not res!906972) (not e!773065))))

(assert (=> b!1363104 (= res!906972 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363105 () Bool)

(declare-fun lt!600676 () Unit!44967)

(assert (=> b!1363105 (= e!773064 lt!600676)))

(declare-fun lt!600675 () Unit!44967)

(declare-fun lemmaListSubSeqRefl!0 (List!31810) Unit!44967)

(assert (=> b!1363105 (= lt!600675 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!921 (List!31810 List!31810) Bool)

(assert (=> b!1363105 (subseq!921 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92672 List!31810 List!31810 (_ BitVec 32)) Unit!44967)

(declare-fun $colon$colon!924 (List!31810 (_ BitVec 64)) List!31810)

(assert (=> b!1363105 (= lt!600676 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!924 acc!759 (select (arr!44769 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363105 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!906974 () Bool)

(assert (=> start!114994 (=> (not res!906974) (not e!773065))))

(assert (=> start!114994 (= res!906974 (and (bvslt (size!45319 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45319 a!3742))))))

(assert (=> start!114994 e!773065))

(assert (=> start!114994 true))

(declare-fun array_inv!33797 (array!92672) Bool)

(assert (=> start!114994 (array_inv!33797 a!3742)))

(declare-fun b!1363106 () Bool)

(declare-fun res!906975 () Bool)

(assert (=> b!1363106 (=> (not res!906975) (not e!773065))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363106 (= res!906975 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45319 a!3742))))))

(declare-fun b!1363107 () Bool)

(declare-fun res!906976 () Bool)

(assert (=> b!1363107 (=> (not res!906976) (not e!773065))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363107 (= res!906976 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363108 () Bool)

(declare-fun res!906979 () Bool)

(assert (=> b!1363108 (=> (not res!906979) (not e!773065))))

(declare-fun contains!9519 (List!31810 (_ BitVec 64)) Bool)

(assert (=> b!1363108 (= res!906979 (not (contains!9519 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363109 () Bool)

(declare-fun Unit!44969 () Unit!44967)

(assert (=> b!1363109 (= e!773064 Unit!44969)))

(declare-fun b!1363110 () Bool)

(declare-fun res!906978 () Bool)

(assert (=> b!1363110 (=> (not res!906978) (not e!773065))))

(assert (=> b!1363110 (= res!906978 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45319 a!3742)))))

(declare-fun b!1363111 () Bool)

(declare-fun res!906977 () Bool)

(assert (=> b!1363111 (=> (not res!906977) (not e!773065))))

(assert (=> b!1363111 (= res!906977 (not (contains!9519 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114994 res!906974) b!1363103))

(assert (= (and b!1363103 res!906971) b!1363108))

(assert (= (and b!1363108 res!906979) b!1363111))

(assert (= (and b!1363111 res!906977) b!1363101))

(assert (= (and b!1363101 res!906973) b!1363104))

(assert (= (and b!1363104 res!906972) b!1363106))

(assert (= (and b!1363106 res!906975) b!1363107))

(assert (= (and b!1363107 res!906976) b!1363110))

(assert (= (and b!1363110 res!906978) b!1363102))

(assert (= (and b!1363102 c!127505) b!1363105))

(assert (= (and b!1363102 (not c!127505)) b!1363109))

(declare-fun m!1247975 () Bool)

(assert (=> b!1363102 m!1247975))

(assert (=> b!1363102 m!1247975))

(declare-fun m!1247977 () Bool)

(assert (=> b!1363102 m!1247977))

(declare-fun m!1247979 () Bool)

(assert (=> b!1363105 m!1247979))

(assert (=> b!1363105 m!1247975))

(declare-fun m!1247981 () Bool)

(assert (=> b!1363105 m!1247981))

(declare-fun m!1247983 () Bool)

(assert (=> b!1363105 m!1247983))

(declare-fun m!1247985 () Bool)

(assert (=> b!1363105 m!1247985))

(assert (=> b!1363105 m!1247975))

(assert (=> b!1363105 m!1247981))

(declare-fun m!1247987 () Bool)

(assert (=> b!1363105 m!1247987))

(declare-fun m!1247989 () Bool)

(assert (=> b!1363107 m!1247989))

(declare-fun m!1247991 () Bool)

(assert (=> b!1363111 m!1247991))

(declare-fun m!1247993 () Bool)

(assert (=> b!1363103 m!1247993))

(declare-fun m!1247995 () Bool)

(assert (=> b!1363108 m!1247995))

(declare-fun m!1247997 () Bool)

(assert (=> b!1363101 m!1247997))

(declare-fun m!1247999 () Bool)

(assert (=> start!114994 m!1247999))

(declare-fun m!1248001 () Bool)

(assert (=> b!1363104 m!1248001))

(check-sat (not b!1363102) (not b!1363111) (not b!1363108) (not b!1363103) (not b!1363107) (not b!1363105) (not b!1363104) (not b!1363101) (not start!114994))
(check-sat)
