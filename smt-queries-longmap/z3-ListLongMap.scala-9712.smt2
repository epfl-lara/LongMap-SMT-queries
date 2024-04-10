; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114886 () Bool)

(assert start!114886)

(declare-fun b!1361952 () Bool)

(declare-fun res!906019 () Bool)

(declare-fun e!772602 () Bool)

(assert (=> b!1361952 (=> (not res!906019) (not e!772602))))

(declare-datatypes ((List!31786 0))(
  ( (Nil!31783) (Cons!31782 (h!32991 (_ BitVec 64)) (t!46471 List!31786)) )
))
(declare-fun lt!600337 () List!31786)

(declare-fun contains!9495 (List!31786 (_ BitVec 64)) Bool)

(assert (=> b!1361952 (= res!906019 (not (contains!9495 lt!600337 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361953 () Bool)

(declare-fun res!906017 () Bool)

(assert (=> b!1361953 (=> (not res!906017) (not e!772602))))

(declare-fun noDuplicate!2352 (List!31786) Bool)

(assert (=> b!1361953 (= res!906017 (noDuplicate!2352 lt!600337))))

(declare-fun b!1361954 () Bool)

(declare-fun res!906016 () Bool)

(declare-fun e!772603 () Bool)

(assert (=> b!1361954 (=> (not res!906016) (not e!772603))))

(declare-fun acc!759 () List!31786)

(assert (=> b!1361954 (= res!906016 (not (contains!9495 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361955 () Bool)

(declare-fun res!906022 () Bool)

(assert (=> b!1361955 (=> (not res!906022) (not e!772603))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92621 0))(
  ( (array!92622 (arr!44745 (Array (_ BitVec 32) (_ BitVec 64))) (size!45295 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92621)

(assert (=> b!1361955 (= res!906022 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45295 a!3742)))))

(declare-fun b!1361956 () Bool)

(declare-fun res!906020 () Bool)

(assert (=> b!1361956 (=> (not res!906020) (not e!772603))))

(assert (=> b!1361956 (= res!906020 (noDuplicate!2352 acc!759))))

(declare-fun b!1361957 () Bool)

(declare-fun res!906018 () Bool)

(assert (=> b!1361957 (=> (not res!906018) (not e!772603))))

(assert (=> b!1361957 (= res!906018 (not (contains!9495 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361958 () Bool)

(declare-fun res!906026 () Bool)

(assert (=> b!1361958 (=> (not res!906026) (not e!772603))))

(declare-fun arrayNoDuplicates!0 (array!92621 (_ BitVec 32) List!31786) Bool)

(assert (=> b!1361958 (= res!906026 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31783))))

(declare-fun b!1361959 () Bool)

(declare-fun res!906023 () Bool)

(assert (=> b!1361959 (=> (not res!906023) (not e!772603))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361959 (= res!906023 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361960 () Bool)

(declare-fun res!906014 () Bool)

(assert (=> b!1361960 (=> (not res!906014) (not e!772602))))

(assert (=> b!1361960 (= res!906014 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600337))))

(declare-fun b!1361961 () Bool)

(declare-fun e!772605 () Bool)

(assert (=> b!1361961 (= e!772605 e!772602)))

(declare-fun res!906021 () Bool)

(assert (=> b!1361961 (=> (not res!906021) (not e!772602))))

(assert (=> b!1361961 (= res!906021 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!900 (List!31786 (_ BitVec 64)) List!31786)

(assert (=> b!1361961 (= lt!600337 ($colon$colon!900 acc!759 (select (arr!44745 a!3742) from!3120)))))

(declare-fun res!906025 () Bool)

(assert (=> start!114886 (=> (not res!906025) (not e!772603))))

(assert (=> start!114886 (= res!906025 (and (bvslt (size!45295 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45295 a!3742))))))

(assert (=> start!114886 e!772603))

(assert (=> start!114886 true))

(declare-fun array_inv!33773 (array!92621) Bool)

(assert (=> start!114886 (array_inv!33773 a!3742)))

(declare-fun b!1361962 () Bool)

(declare-fun res!906027 () Bool)

(assert (=> b!1361962 (=> (not res!906027) (not e!772603))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361962 (= res!906027 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45295 a!3742))))))

(declare-fun b!1361963 () Bool)

(declare-fun res!906028 () Bool)

(assert (=> b!1361963 (=> (not res!906028) (not e!772602))))

(assert (=> b!1361963 (= res!906028 (not (contains!9495 lt!600337 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361964 () Bool)

(declare-datatypes ((Unit!44895 0))(
  ( (Unit!44896) )
))
(declare-fun e!772606 () Unit!44895)

(declare-fun lt!600334 () Unit!44895)

(assert (=> b!1361964 (= e!772606 lt!600334)))

(declare-fun lt!600335 () Unit!44895)

(declare-fun lemmaListSubSeqRefl!0 (List!31786) Unit!44895)

(assert (=> b!1361964 (= lt!600335 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!897 (List!31786 List!31786) Bool)

(assert (=> b!1361964 (subseq!897 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92621 List!31786 List!31786 (_ BitVec 32)) Unit!44895)

(assert (=> b!1361964 (= lt!600334 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!900 acc!759 (select (arr!44745 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361964 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361965 () Bool)

(assert (=> b!1361965 (= e!772602 (bvsge (bvsub (size!45295 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45295 a!3742) from!3120)))))

(declare-fun b!1361966 () Bool)

(declare-fun res!906024 () Bool)

(assert (=> b!1361966 (=> (not res!906024) (not e!772603))))

(assert (=> b!1361966 (= res!906024 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361967 () Bool)

(declare-fun Unit!44897 () Unit!44895)

(assert (=> b!1361967 (= e!772606 Unit!44897)))

(declare-fun b!1361968 () Bool)

(assert (=> b!1361968 (= e!772603 e!772605)))

(declare-fun res!906015 () Bool)

(assert (=> b!1361968 (=> (not res!906015) (not e!772605))))

(declare-fun lt!600336 () Bool)

(assert (=> b!1361968 (= res!906015 (and (not (= from!3120 i!1404)) lt!600336))))

(declare-fun lt!600333 () Unit!44895)

(assert (=> b!1361968 (= lt!600333 e!772606)))

(declare-fun c!127409 () Bool)

(assert (=> b!1361968 (= c!127409 lt!600336)))

(assert (=> b!1361968 (= lt!600336 (validKeyInArray!0 (select (arr!44745 a!3742) from!3120)))))

(assert (= (and start!114886 res!906025) b!1361956))

(assert (= (and b!1361956 res!906020) b!1361957))

(assert (= (and b!1361957 res!906018) b!1361954))

(assert (= (and b!1361954 res!906016) b!1361958))

(assert (= (and b!1361958 res!906026) b!1361966))

(assert (= (and b!1361966 res!906024) b!1361962))

(assert (= (and b!1361962 res!906027) b!1361959))

(assert (= (and b!1361959 res!906023) b!1361955))

(assert (= (and b!1361955 res!906022) b!1361968))

(assert (= (and b!1361968 c!127409) b!1361964))

(assert (= (and b!1361968 (not c!127409)) b!1361967))

(assert (= (and b!1361968 res!906015) b!1361961))

(assert (= (and b!1361961 res!906021) b!1361953))

(assert (= (and b!1361953 res!906017) b!1361963))

(assert (= (and b!1361963 res!906028) b!1361952))

(assert (= (and b!1361952 res!906019) b!1361960))

(assert (= (and b!1361960 res!906014) b!1361965))

(declare-fun m!1246957 () Bool)

(assert (=> b!1361954 m!1246957))

(declare-fun m!1246959 () Bool)

(assert (=> b!1361963 m!1246959))

(declare-fun m!1246961 () Bool)

(assert (=> b!1361960 m!1246961))

(declare-fun m!1246963 () Bool)

(assert (=> b!1361956 m!1246963))

(declare-fun m!1246965 () Bool)

(assert (=> b!1361952 m!1246965))

(declare-fun m!1246967 () Bool)

(assert (=> b!1361961 m!1246967))

(assert (=> b!1361961 m!1246967))

(declare-fun m!1246969 () Bool)

(assert (=> b!1361961 m!1246969))

(declare-fun m!1246971 () Bool)

(assert (=> b!1361966 m!1246971))

(declare-fun m!1246973 () Bool)

(assert (=> b!1361959 m!1246973))

(declare-fun m!1246975 () Bool)

(assert (=> b!1361957 m!1246975))

(assert (=> b!1361968 m!1246967))

(assert (=> b!1361968 m!1246967))

(declare-fun m!1246977 () Bool)

(assert (=> b!1361968 m!1246977))

(declare-fun m!1246979 () Bool)

(assert (=> b!1361953 m!1246979))

(declare-fun m!1246981 () Bool)

(assert (=> b!1361964 m!1246981))

(assert (=> b!1361964 m!1246967))

(assert (=> b!1361964 m!1246969))

(declare-fun m!1246983 () Bool)

(assert (=> b!1361964 m!1246983))

(declare-fun m!1246985 () Bool)

(assert (=> b!1361964 m!1246985))

(assert (=> b!1361964 m!1246967))

(assert (=> b!1361964 m!1246969))

(declare-fun m!1246987 () Bool)

(assert (=> b!1361964 m!1246987))

(declare-fun m!1246989 () Bool)

(assert (=> b!1361958 m!1246989))

(declare-fun m!1246991 () Bool)

(assert (=> start!114886 m!1246991))

(check-sat (not b!1361959) (not b!1361963) (not start!114886) (not b!1361968) (not b!1361954) (not b!1361953) (not b!1361957) (not b!1361961) (not b!1361966) (not b!1361952) (not b!1361964) (not b!1361956) (not b!1361958) (not b!1361960))
(check-sat)
