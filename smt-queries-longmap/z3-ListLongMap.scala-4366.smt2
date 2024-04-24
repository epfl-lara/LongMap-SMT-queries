; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60282 () Bool)

(assert start!60282)

(declare-fun b!674603 () Bool)

(declare-fun res!440988 () Bool)

(declare-fun e!385098 () Bool)

(assert (=> b!674603 (=> (not res!440988) (not e!385098))))

(declare-datatypes ((List!12771 0))(
  ( (Nil!12768) (Cons!12767 (h!13815 (_ BitVec 64)) (t!18991 List!12771)) )
))
(declare-fun lt!312711 () List!12771)

(declare-fun contains!3423 (List!12771 (_ BitVec 64)) Bool)

(assert (=> b!674603 (= res!440988 (not (contains!3423 lt!312711 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674604 () Bool)

(declare-fun res!440981 () Bool)

(declare-fun e!385104 () Bool)

(assert (=> b!674604 (=> (not res!440981) (not e!385104))))

(declare-datatypes ((array!39267 0))(
  ( (array!39268 (arr!18823 (Array (_ BitVec 32) (_ BitVec 64))) (size!19187 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39267)

(declare-fun arrayNoDuplicates!0 (array!39267 (_ BitVec 32) List!12771) Bool)

(assert (=> b!674604 (= res!440981 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12768))))

(declare-fun b!674605 () Bool)

(declare-fun e!385102 () Bool)

(declare-fun e!385099 () Bool)

(assert (=> b!674605 (= e!385102 e!385099)))

(declare-fun res!440972 () Bool)

(assert (=> b!674605 (=> (not res!440972) (not e!385099))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674605 (= res!440972 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674606 () Bool)

(declare-fun e!385101 () Bool)

(assert (=> b!674606 (= e!385101 e!385098)))

(declare-fun res!440979 () Bool)

(assert (=> b!674606 (=> (not res!440979) (not e!385098))))

(assert (=> b!674606 (= res!440979 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun acc!681 () List!12771)

(declare-fun $colon$colon!293 (List!12771 (_ BitVec 64)) List!12771)

(assert (=> b!674606 (= lt!312711 ($colon$colon!293 acc!681 (select (arr!18823 a!3626) from!3004)))))

(declare-fun b!674607 () Bool)

(declare-fun res!440970 () Bool)

(assert (=> b!674607 (=> (not res!440970) (not e!385104))))

(assert (=> b!674607 (= res!440970 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19187 a!3626))))))

(declare-fun b!674608 () Bool)

(declare-fun res!440973 () Bool)

(assert (=> b!674608 (=> (not res!440973) (not e!385104))))

(assert (=> b!674608 (= res!440973 (not (contains!3423 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674609 () Bool)

(declare-fun res!440978 () Bool)

(assert (=> b!674609 (=> (not res!440978) (not e!385104))))

(assert (=> b!674609 (= res!440978 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19187 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674610 () Bool)

(declare-fun res!440971 () Bool)

(assert (=> b!674610 (=> (not res!440971) (not e!385098))))

(assert (=> b!674610 (= res!440971 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312711))))

(declare-fun res!440986 () Bool)

(assert (=> start!60282 (=> (not res!440986) (not e!385104))))

(assert (=> start!60282 (= res!440986 (and (bvslt (size!19187 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19187 a!3626))))))

(assert (=> start!60282 e!385104))

(assert (=> start!60282 true))

(declare-fun array_inv!14682 (array!39267) Bool)

(assert (=> start!60282 (array_inv!14682 a!3626)))

(declare-fun b!674611 () Bool)

(declare-fun res!440969 () Bool)

(assert (=> b!674611 (=> (not res!440969) (not e!385104))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674611 (= res!440969 (validKeyInArray!0 k0!2843))))

(declare-fun b!674612 () Bool)

(declare-fun e!385105 () Bool)

(assert (=> b!674612 (= e!385105 (contains!3423 acc!681 k0!2843))))

(declare-fun b!674613 () Bool)

(declare-fun res!440987 () Bool)

(assert (=> b!674613 (=> (not res!440987) (not e!385098))))

(declare-fun noDuplicate!697 (List!12771) Bool)

(assert (=> b!674613 (= res!440987 (noDuplicate!697 lt!312711))))

(declare-fun b!674614 () Bool)

(declare-fun res!440974 () Bool)

(assert (=> b!674614 (=> (not res!440974) (not e!385104))))

(declare-fun e!385097 () Bool)

(assert (=> b!674614 (= res!440974 e!385097)))

(declare-fun res!440985 () Bool)

(assert (=> b!674614 (=> res!440985 e!385097)))

(assert (=> b!674614 (= res!440985 e!385105)))

(declare-fun res!440989 () Bool)

(assert (=> b!674614 (=> (not res!440989) (not e!385105))))

(assert (=> b!674614 (= res!440989 (bvsgt from!3004 i!1382))))

(declare-fun b!674615 () Bool)

(declare-datatypes ((Unit!23703 0))(
  ( (Unit!23704) )
))
(declare-fun e!385100 () Unit!23703)

(declare-fun Unit!23705 () Unit!23703)

(assert (=> b!674615 (= e!385100 Unit!23705)))

(declare-fun b!674616 () Bool)

(assert (=> b!674616 (= e!385098 (not true))))

(assert (=> b!674616 (arrayNoDuplicates!0 (array!39268 (store (arr!18823 a!3626) i!1382 k0!2843) (size!19187 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312711)))

(declare-fun lt!312712 () Unit!23703)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39267 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12771) Unit!23703)

(assert (=> b!674616 (= lt!312712 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312711))))

(declare-fun b!674617 () Bool)

(assert (=> b!674617 (= e!385104 e!385101)))

(declare-fun res!440990 () Bool)

(assert (=> b!674617 (=> (not res!440990) (not e!385101))))

(assert (=> b!674617 (= res!440990 (not (= (select (arr!18823 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312710 () Unit!23703)

(assert (=> b!674617 (= lt!312710 e!385100)))

(declare-fun c!77186 () Bool)

(assert (=> b!674617 (= c!77186 (= (select (arr!18823 a!3626) from!3004) k0!2843))))

(declare-fun b!674618 () Bool)

(declare-fun e!385106 () Bool)

(assert (=> b!674618 (= e!385106 (not (contains!3423 acc!681 k0!2843)))))

(declare-fun b!674619 () Bool)

(declare-fun res!440976 () Bool)

(assert (=> b!674619 (=> (not res!440976) (not e!385098))))

(assert (=> b!674619 (= res!440976 (not (contains!3423 lt!312711 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674620 () Bool)

(declare-fun res!440975 () Bool)

(assert (=> b!674620 (=> (not res!440975) (not e!385104))))

(declare-fun arrayContainsKey!0 (array!39267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674620 (= res!440975 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674621 () Bool)

(declare-fun res!440984 () Bool)

(assert (=> b!674621 (=> (not res!440984) (not e!385104))))

(assert (=> b!674621 (= res!440984 (not (contains!3423 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674622 () Bool)

(declare-fun res!440968 () Bool)

(assert (=> b!674622 (=> (not res!440968) (not e!385104))))

(assert (=> b!674622 (= res!440968 (noDuplicate!697 acc!681))))

(declare-fun b!674623 () Bool)

(assert (=> b!674623 (= e!385099 (not (contains!3423 lt!312711 k0!2843)))))

(declare-fun b!674624 () Bool)

(declare-fun Unit!23706 () Unit!23703)

(assert (=> b!674624 (= e!385100 Unit!23706)))

(assert (=> b!674624 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312709 () Unit!23703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39267 (_ BitVec 64) (_ BitVec 32)) Unit!23703)

(assert (=> b!674624 (= lt!312709 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674624 false))

(declare-fun b!674625 () Bool)

(declare-fun e!385107 () Bool)

(assert (=> b!674625 (= e!385107 (contains!3423 lt!312711 k0!2843))))

(declare-fun b!674626 () Bool)

(declare-fun res!440977 () Bool)

(assert (=> b!674626 (=> (not res!440977) (not e!385098))))

(assert (=> b!674626 (= res!440977 e!385102)))

(declare-fun res!440982 () Bool)

(assert (=> b!674626 (=> res!440982 e!385102)))

(assert (=> b!674626 (= res!440982 e!385107)))

(declare-fun res!440980 () Bool)

(assert (=> b!674626 (=> (not res!440980) (not e!385107))))

(assert (=> b!674626 (= res!440980 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674627 () Bool)

(declare-fun res!440991 () Bool)

(assert (=> b!674627 (=> (not res!440991) (not e!385104))))

(assert (=> b!674627 (= res!440991 (validKeyInArray!0 (select (arr!18823 a!3626) from!3004)))))

(declare-fun b!674628 () Bool)

(assert (=> b!674628 (= e!385097 e!385106)))

(declare-fun res!440983 () Bool)

(assert (=> b!674628 (=> (not res!440983) (not e!385106))))

(assert (=> b!674628 (= res!440983 (bvsle from!3004 i!1382))))

(declare-fun b!674629 () Bool)

(declare-fun res!440992 () Bool)

(assert (=> b!674629 (=> (not res!440992) (not e!385104))))

(assert (=> b!674629 (= res!440992 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60282 res!440986) b!674622))

(assert (= (and b!674622 res!440968) b!674621))

(assert (= (and b!674621 res!440984) b!674608))

(assert (= (and b!674608 res!440973) b!674614))

(assert (= (and b!674614 res!440989) b!674612))

(assert (= (and b!674614 (not res!440985)) b!674628))

(assert (= (and b!674628 res!440983) b!674618))

(assert (= (and b!674614 res!440974) b!674604))

(assert (= (and b!674604 res!440981) b!674629))

(assert (= (and b!674629 res!440992) b!674607))

(assert (= (and b!674607 res!440970) b!674611))

(assert (= (and b!674611 res!440969) b!674620))

(assert (= (and b!674620 res!440975) b!674609))

(assert (= (and b!674609 res!440978) b!674627))

(assert (= (and b!674627 res!440991) b!674617))

(assert (= (and b!674617 c!77186) b!674624))

(assert (= (and b!674617 (not c!77186)) b!674615))

(assert (= (and b!674617 res!440990) b!674606))

(assert (= (and b!674606 res!440979) b!674613))

(assert (= (and b!674613 res!440987) b!674619))

(assert (= (and b!674619 res!440976) b!674603))

(assert (= (and b!674603 res!440988) b!674626))

(assert (= (and b!674626 res!440980) b!674625))

(assert (= (and b!674626 (not res!440982)) b!674605))

(assert (= (and b!674605 res!440972) b!674623))

(assert (= (and b!674626 res!440977) b!674610))

(assert (= (and b!674610 res!440971) b!674616))

(declare-fun m!643057 () Bool)

(assert (=> b!674606 m!643057))

(assert (=> b!674606 m!643057))

(declare-fun m!643059 () Bool)

(assert (=> b!674606 m!643059))

(declare-fun m!643061 () Bool)

(assert (=> b!674613 m!643061))

(declare-fun m!643063 () Bool)

(assert (=> b!674623 m!643063))

(declare-fun m!643065 () Bool)

(assert (=> b!674621 m!643065))

(declare-fun m!643067 () Bool)

(assert (=> b!674622 m!643067))

(declare-fun m!643069 () Bool)

(assert (=> b!674610 m!643069))

(declare-fun m!643071 () Bool)

(assert (=> b!674608 m!643071))

(declare-fun m!643073 () Bool)

(assert (=> b!674604 m!643073))

(declare-fun m!643075 () Bool)

(assert (=> b!674618 m!643075))

(declare-fun m!643077 () Bool)

(assert (=> start!60282 m!643077))

(declare-fun m!643079 () Bool)

(assert (=> b!674629 m!643079))

(declare-fun m!643081 () Bool)

(assert (=> b!674611 m!643081))

(declare-fun m!643083 () Bool)

(assert (=> b!674616 m!643083))

(declare-fun m!643085 () Bool)

(assert (=> b!674616 m!643085))

(declare-fun m!643087 () Bool)

(assert (=> b!674616 m!643087))

(assert (=> b!674617 m!643057))

(assert (=> b!674612 m!643075))

(assert (=> b!674625 m!643063))

(assert (=> b!674627 m!643057))

(assert (=> b!674627 m!643057))

(declare-fun m!643089 () Bool)

(assert (=> b!674627 m!643089))

(declare-fun m!643091 () Bool)

(assert (=> b!674624 m!643091))

(declare-fun m!643093 () Bool)

(assert (=> b!674624 m!643093))

(declare-fun m!643095 () Bool)

(assert (=> b!674620 m!643095))

(declare-fun m!643097 () Bool)

(assert (=> b!674619 m!643097))

(declare-fun m!643099 () Bool)

(assert (=> b!674603 m!643099))

(check-sat (not b!674629) (not b!674622) (not b!674606) (not b!674616) (not b!674603) (not b!674619) (not b!674608) (not b!674604) (not b!674612) (not b!674611) (not b!674625) (not b!674621) (not start!60282) (not b!674620) (not b!674627) (not b!674624) (not b!674623) (not b!674618) (not b!674613) (not b!674610))
(check-sat)
