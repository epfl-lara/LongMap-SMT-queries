; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114890 () Bool)

(assert start!114890)

(declare-fun b!1361984 () Bool)

(declare-fun res!906078 () Bool)

(declare-fun e!772600 () Bool)

(assert (=> b!1361984 (=> (not res!906078) (not e!772600))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361984 (= res!906078 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361985 () Bool)

(declare-datatypes ((Unit!44742 0))(
  ( (Unit!44743) )
))
(declare-fun e!772602 () Unit!44742)

(declare-fun lt!600182 () Unit!44742)

(assert (=> b!1361985 (= e!772602 lt!600182)))

(declare-fun lt!600180 () Unit!44742)

(declare-datatypes ((List!31841 0))(
  ( (Nil!31838) (Cons!31837 (h!33046 (_ BitVec 64)) (t!46518 List!31841)) )
))
(declare-fun acc!759 () List!31841)

(declare-fun lemmaListSubSeqRefl!0 (List!31841) Unit!44742)

(assert (=> b!1361985 (= lt!600180 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!899 (List!31841 List!31841) Bool)

(assert (=> b!1361985 (subseq!899 acc!759 acc!759)))

(declare-datatypes ((array!92574 0))(
  ( (array!92575 (arr!44722 (Array (_ BitVec 32) (_ BitVec 64))) (size!45274 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92574)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92574 List!31841 List!31841 (_ BitVec 32)) Unit!44742)

(declare-fun $colon$colon!904 (List!31841 (_ BitVec 64)) List!31841)

(assert (=> b!1361985 (= lt!600182 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!904 acc!759 (select (arr!44722 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92574 (_ BitVec 32) List!31841) Bool)

(assert (=> b!1361985 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361986 () Bool)

(declare-fun res!906083 () Bool)

(assert (=> b!1361986 (=> (not res!906083) (not e!772600))))

(declare-fun contains!9461 (List!31841 (_ BitVec 64)) Bool)

(assert (=> b!1361986 (= res!906083 (not (contains!9461 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361987 () Bool)

(declare-fun res!906075 () Bool)

(assert (=> b!1361987 (=> (not res!906075) (not e!772600))))

(assert (=> b!1361987 (= res!906075 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31838))))

(declare-fun b!1361988 () Bool)

(declare-fun res!906085 () Bool)

(declare-fun e!772601 () Bool)

(assert (=> b!1361988 (=> (not res!906085) (not e!772601))))

(declare-fun lt!600179 () List!31841)

(declare-fun noDuplicate!2376 (List!31841) Bool)

(assert (=> b!1361988 (= res!906085 (noDuplicate!2376 lt!600179))))

(declare-fun b!1361989 () Bool)

(declare-fun e!772599 () Bool)

(assert (=> b!1361989 (= e!772599 e!772601)))

(declare-fun res!906080 () Bool)

(assert (=> b!1361989 (=> (not res!906080) (not e!772601))))

(assert (=> b!1361989 (= res!906080 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1361989 (= lt!600179 ($colon$colon!904 acc!759 (select (arr!44722 a!3742) from!3120)))))

(declare-fun b!1361990 () Bool)

(declare-fun res!906082 () Bool)

(assert (=> b!1361990 (=> (not res!906082) (not e!772601))))

(assert (=> b!1361990 (= res!906082 (not (contains!9461 lt!600179 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361991 () Bool)

(declare-fun Unit!44744 () Unit!44742)

(assert (=> b!1361991 (= e!772602 Unit!44744)))

(declare-fun b!1361992 () Bool)

(assert (=> b!1361992 (= e!772600 e!772599)))

(declare-fun res!906077 () Bool)

(assert (=> b!1361992 (=> (not res!906077) (not e!772599))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!600181 () Bool)

(assert (=> b!1361992 (= res!906077 (and (not (= from!3120 i!1404)) lt!600181))))

(declare-fun lt!600184 () Unit!44742)

(assert (=> b!1361992 (= lt!600184 e!772602)))

(declare-fun c!127397 () Bool)

(assert (=> b!1361992 (= c!127397 lt!600181)))

(assert (=> b!1361992 (= lt!600181 (validKeyInArray!0 (select (arr!44722 a!3742) from!3120)))))

(declare-fun b!1361993 () Bool)

(declare-fun res!906076 () Bool)

(assert (=> b!1361993 (=> (not res!906076) (not e!772601))))

(assert (=> b!1361993 (= res!906076 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600179))))

(declare-fun b!1361994 () Bool)

(declare-fun res!906086 () Bool)

(assert (=> b!1361994 (=> (not res!906086) (not e!772600))))

(assert (=> b!1361994 (= res!906086 (not (contains!9461 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!906088 () Bool)

(assert (=> start!114890 (=> (not res!906088) (not e!772600))))

(assert (=> start!114890 (= res!906088 (and (bvslt (size!45274 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45274 a!3742))))))

(assert (=> start!114890 e!772600))

(assert (=> start!114890 true))

(declare-fun array_inv!33955 (array!92574) Bool)

(assert (=> start!114890 (array_inv!33955 a!3742)))

(declare-fun b!1361995 () Bool)

(declare-fun res!906089 () Bool)

(assert (=> b!1361995 (=> (not res!906089) (not e!772600))))

(assert (=> b!1361995 (= res!906089 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45274 a!3742))))))

(declare-fun b!1361996 () Bool)

(declare-fun res!906081 () Bool)

(assert (=> b!1361996 (=> (not res!906081) (not e!772600))))

(assert (=> b!1361996 (= res!906081 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45274 a!3742)))))

(declare-fun b!1361997 () Bool)

(declare-fun res!906087 () Bool)

(assert (=> b!1361997 (=> (not res!906087) (not e!772600))))

(assert (=> b!1361997 (= res!906087 (noDuplicate!2376 acc!759))))

(declare-fun b!1361998 () Bool)

(assert (=> b!1361998 (= e!772601 (not true))))

(assert (=> b!1361998 (arrayNoDuplicates!0 (array!92575 (store (arr!44722 a!3742) i!1404 l!3587) (size!45274 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!600179)))

(declare-fun lt!600183 () Unit!44742)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92574 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31841) Unit!44742)

(assert (=> b!1361998 (= lt!600183 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600179))))

(declare-fun b!1361999 () Bool)

(declare-fun res!906084 () Bool)

(assert (=> b!1361999 (=> (not res!906084) (not e!772601))))

(assert (=> b!1361999 (= res!906084 (not (contains!9461 lt!600179 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362000 () Bool)

(declare-fun res!906079 () Bool)

(assert (=> b!1362000 (=> (not res!906079) (not e!772600))))

(assert (=> b!1362000 (= res!906079 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114890 res!906088) b!1361997))

(assert (= (and b!1361997 res!906087) b!1361986))

(assert (= (and b!1361986 res!906083) b!1361994))

(assert (= (and b!1361994 res!906086) b!1361987))

(assert (= (and b!1361987 res!906075) b!1362000))

(assert (= (and b!1362000 res!906079) b!1361995))

(assert (= (and b!1361995 res!906089) b!1361984))

(assert (= (and b!1361984 res!906078) b!1361996))

(assert (= (and b!1361996 res!906081) b!1361992))

(assert (= (and b!1361992 c!127397) b!1361985))

(assert (= (and b!1361992 (not c!127397)) b!1361991))

(assert (= (and b!1361992 res!906077) b!1361989))

(assert (= (and b!1361989 res!906080) b!1361988))

(assert (= (and b!1361988 res!906085) b!1361999))

(assert (= (and b!1361999 res!906084) b!1361990))

(assert (= (and b!1361990 res!906082) b!1361993))

(assert (= (and b!1361993 res!906076) b!1361998))

(declare-fun m!1246513 () Bool)

(assert (=> b!1361988 m!1246513))

(declare-fun m!1246515 () Bool)

(assert (=> b!1361997 m!1246515))

(declare-fun m!1246517 () Bool)

(assert (=> b!1361989 m!1246517))

(assert (=> b!1361989 m!1246517))

(declare-fun m!1246519 () Bool)

(assert (=> b!1361989 m!1246519))

(declare-fun m!1246521 () Bool)

(assert (=> b!1361998 m!1246521))

(declare-fun m!1246523 () Bool)

(assert (=> b!1361998 m!1246523))

(declare-fun m!1246525 () Bool)

(assert (=> b!1361998 m!1246525))

(declare-fun m!1246527 () Bool)

(assert (=> b!1361985 m!1246527))

(assert (=> b!1361985 m!1246517))

(assert (=> b!1361985 m!1246519))

(declare-fun m!1246529 () Bool)

(assert (=> b!1361985 m!1246529))

(declare-fun m!1246531 () Bool)

(assert (=> b!1361985 m!1246531))

(assert (=> b!1361985 m!1246517))

(assert (=> b!1361985 m!1246519))

(declare-fun m!1246533 () Bool)

(assert (=> b!1361985 m!1246533))

(declare-fun m!1246535 () Bool)

(assert (=> start!114890 m!1246535))

(declare-fun m!1246537 () Bool)

(assert (=> b!1361986 m!1246537))

(declare-fun m!1246539 () Bool)

(assert (=> b!1361999 m!1246539))

(declare-fun m!1246541 () Bool)

(assert (=> b!1361994 m!1246541))

(declare-fun m!1246543 () Bool)

(assert (=> b!1361990 m!1246543))

(declare-fun m!1246545 () Bool)

(assert (=> b!1361993 m!1246545))

(declare-fun m!1246547 () Bool)

(assert (=> b!1361987 m!1246547))

(assert (=> b!1361992 m!1246517))

(assert (=> b!1361992 m!1246517))

(declare-fun m!1246549 () Bool)

(assert (=> b!1361992 m!1246549))

(declare-fun m!1246551 () Bool)

(assert (=> b!1361984 m!1246551))

(declare-fun m!1246553 () Bool)

(assert (=> b!1362000 m!1246553))

(check-sat (not b!1361990) (not b!1361984) (not b!1361988) (not b!1361989) (not b!1361997) (not b!1361992) (not start!114890) (not b!1361987) (not b!1362000) (not b!1361985) (not b!1361998) (not b!1361986) (not b!1361999) (not b!1361993) (not b!1361994))
(check-sat)
