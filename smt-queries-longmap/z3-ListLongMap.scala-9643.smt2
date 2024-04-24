; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114220 () Bool)

(assert start!114220)

(declare-fun b!1353893 () Bool)

(declare-datatypes ((Unit!44291 0))(
  ( (Unit!44292) )
))
(declare-fun e!769704 () Unit!44291)

(declare-fun lt!598071 () Unit!44291)

(assert (=> b!1353893 (= e!769704 lt!598071)))

(declare-fun lt!598072 () Unit!44291)

(declare-datatypes ((List!31618 0))(
  ( (Nil!31615) (Cons!31614 (h!32832 (_ BitVec 64)) (t!46268 List!31618)) )
))
(declare-fun acc!759 () List!31618)

(declare-fun lemmaListSubSeqRefl!0 (List!31618) Unit!44291)

(assert (=> b!1353893 (= lt!598072 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!707 (List!31618 List!31618) Bool)

(assert (=> b!1353893 (subseq!707 acc!759 acc!759)))

(declare-datatypes ((array!92293 0))(
  ( (array!92294 (arr!44590 (Array (_ BitVec 32) (_ BitVec 64))) (size!45141 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92293)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92293 List!31618 List!31618 (_ BitVec 32)) Unit!44291)

(declare-fun $colon$colon!721 (List!31618 (_ BitVec 64)) List!31618)

(assert (=> b!1353893 (= lt!598071 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!721 acc!759 (select (arr!44590 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92293 (_ BitVec 32) List!31618) Bool)

(assert (=> b!1353893 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353894 () Bool)

(declare-fun res!898430 () Bool)

(declare-fun e!769705 () Bool)

(assert (=> b!1353894 (=> (not res!898430) (not e!769705))))

(declare-fun noDuplicate!2161 (List!31618) Bool)

(assert (=> b!1353894 (= res!898430 (noDuplicate!2161 acc!759))))

(declare-fun b!1353895 () Bool)

(declare-fun res!898424 () Bool)

(assert (=> b!1353895 (=> (not res!898424) (not e!769705))))

(assert (=> b!1353895 (= res!898424 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45141 a!3742)))))

(declare-fun b!1353896 () Bool)

(declare-fun e!769703 () Bool)

(assert (=> b!1353896 (= e!769703 false)))

(declare-fun lt!598074 () Bool)

(assert (=> b!1353896 (= lt!598074 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353898 () Bool)

(declare-fun res!898425 () Bool)

(assert (=> b!1353898 (=> (not res!898425) (not e!769705))))

(declare-fun contains!9330 (List!31618 (_ BitVec 64)) Bool)

(assert (=> b!1353898 (= res!898425 (not (contains!9330 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353899 () Bool)

(declare-fun res!898423 () Bool)

(assert (=> b!1353899 (=> (not res!898423) (not e!769705))))

(assert (=> b!1353899 (= res!898423 (not (contains!9330 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353900 () Bool)

(declare-fun res!898428 () Bool)

(assert (=> b!1353900 (=> (not res!898428) (not e!769705))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353900 (= res!898428 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45141 a!3742))))))

(declare-fun b!1353897 () Bool)

(declare-fun Unit!44293 () Unit!44291)

(assert (=> b!1353897 (= e!769704 Unit!44293)))

(declare-fun res!898431 () Bool)

(assert (=> start!114220 (=> (not res!898431) (not e!769705))))

(assert (=> start!114220 (= res!898431 (and (bvslt (size!45141 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45141 a!3742))))))

(assert (=> start!114220 e!769705))

(assert (=> start!114220 true))

(declare-fun array_inv!33871 (array!92293) Bool)

(assert (=> start!114220 (array_inv!33871 a!3742)))

(declare-fun b!1353901 () Bool)

(assert (=> b!1353901 (= e!769705 e!769703)))

(declare-fun res!898427 () Bool)

(assert (=> b!1353901 (=> (not res!898427) (not e!769703))))

(assert (=> b!1353901 (= res!898427 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598073 () Unit!44291)

(assert (=> b!1353901 (= lt!598073 e!769704)))

(declare-fun c!127183 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353901 (= c!127183 (validKeyInArray!0 (select (arr!44590 a!3742) from!3120)))))

(declare-fun b!1353902 () Bool)

(declare-fun res!898422 () Bool)

(assert (=> b!1353902 (=> (not res!898422) (not e!769705))))

(assert (=> b!1353902 (= res!898422 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31615))))

(declare-fun b!1353903 () Bool)

(declare-fun res!898429 () Bool)

(assert (=> b!1353903 (=> (not res!898429) (not e!769705))))

(assert (=> b!1353903 (= res!898429 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353904 () Bool)

(declare-fun res!898426 () Bool)

(assert (=> b!1353904 (=> (not res!898426) (not e!769705))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353904 (= res!898426 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114220 res!898431) b!1353894))

(assert (= (and b!1353894 res!898430) b!1353899))

(assert (= (and b!1353899 res!898423) b!1353898))

(assert (= (and b!1353898 res!898425) b!1353902))

(assert (= (and b!1353902 res!898422) b!1353903))

(assert (= (and b!1353903 res!898429) b!1353900))

(assert (= (and b!1353900 res!898428) b!1353904))

(assert (= (and b!1353904 res!898426) b!1353895))

(assert (= (and b!1353895 res!898424) b!1353901))

(assert (= (and b!1353901 c!127183) b!1353893))

(assert (= (and b!1353901 (not c!127183)) b!1353897))

(assert (= (and b!1353901 res!898427) b!1353896))

(declare-fun m!1240969 () Bool)

(assert (=> b!1353901 m!1240969))

(assert (=> b!1353901 m!1240969))

(declare-fun m!1240971 () Bool)

(assert (=> b!1353901 m!1240971))

(declare-fun m!1240973 () Bool)

(assert (=> b!1353902 m!1240973))

(declare-fun m!1240975 () Bool)

(assert (=> b!1353893 m!1240975))

(assert (=> b!1353893 m!1240969))

(declare-fun m!1240977 () Bool)

(assert (=> b!1353893 m!1240977))

(declare-fun m!1240979 () Bool)

(assert (=> b!1353893 m!1240979))

(declare-fun m!1240981 () Bool)

(assert (=> b!1353893 m!1240981))

(assert (=> b!1353893 m!1240969))

(assert (=> b!1353893 m!1240977))

(declare-fun m!1240983 () Bool)

(assert (=> b!1353893 m!1240983))

(assert (=> b!1353896 m!1240981))

(declare-fun m!1240985 () Bool)

(assert (=> start!114220 m!1240985))

(declare-fun m!1240987 () Bool)

(assert (=> b!1353899 m!1240987))

(declare-fun m!1240989 () Bool)

(assert (=> b!1353904 m!1240989))

(declare-fun m!1240991 () Bool)

(assert (=> b!1353903 m!1240991))

(declare-fun m!1240993 () Bool)

(assert (=> b!1353898 m!1240993))

(declare-fun m!1240995 () Bool)

(assert (=> b!1353894 m!1240995))

(check-sat (not b!1353898) (not b!1353896) (not start!114220) (not b!1353894) (not b!1353904) (not b!1353901) (not b!1353899) (not b!1353903) (not b!1353902) (not b!1353893))
(check-sat)
