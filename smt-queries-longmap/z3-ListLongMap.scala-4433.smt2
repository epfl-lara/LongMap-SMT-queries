; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61632 () Bool)

(assert start!61632)

(declare-fun b!689167 () Bool)

(declare-fun res!453687 () Bool)

(declare-fun e!392472 () Bool)

(assert (=> b!689167 (=> res!453687 e!392472)))

(declare-datatypes ((List!12972 0))(
  ( (Nil!12969) (Cons!12968 (h!14016 (_ BitVec 64)) (t!19228 List!12972)) )
))
(declare-fun lt!316076 () List!12972)

(declare-fun contains!3624 (List!12972 (_ BitVec 64)) Bool)

(assert (=> b!689167 (= res!453687 (contains!3624 lt!316076 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689168 () Bool)

(declare-fun e!392481 () Bool)

(declare-fun e!392477 () Bool)

(assert (=> b!689168 (= e!392481 e!392477)))

(declare-fun res!453699 () Bool)

(assert (=> b!689168 (=> (not res!453699) (not e!392477))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689168 (= res!453699 (bvsle from!3004 i!1382))))

(declare-fun b!689169 () Bool)

(declare-fun e!392475 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!689169 (= e!392475 (not (contains!3624 lt!316076 k0!2843)))))

(declare-fun b!689170 () Bool)

(declare-fun res!453688 () Bool)

(declare-fun e!392471 () Bool)

(assert (=> b!689170 (=> (not res!453688) (not e!392471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689170 (= res!453688 (validKeyInArray!0 k0!2843))))

(declare-fun b!689171 () Bool)

(declare-fun res!453686 () Bool)

(assert (=> b!689171 (=> (not res!453686) (not e!392471))))

(declare-datatypes ((array!39711 0))(
  ( (array!39712 (arr!19024 (Array (_ BitVec 32) (_ BitVec 64))) (size!19404 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39711)

(declare-fun arrayNoDuplicates!0 (array!39711 (_ BitVec 32) List!12972) Bool)

(assert (=> b!689171 (= res!453686 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12969))))

(declare-fun b!689172 () Bool)

(declare-fun res!453684 () Bool)

(assert (=> b!689172 (=> (not res!453684) (not e!392471))))

(declare-fun acc!681 () List!12972)

(assert (=> b!689172 (= res!453684 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689173 () Bool)

(declare-fun res!453700 () Bool)

(assert (=> b!689173 (=> (not res!453700) (not e!392471))))

(assert (=> b!689173 (= res!453700 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19404 a!3626))))))

(declare-fun b!689174 () Bool)

(declare-fun e!392473 () Bool)

(assert (=> b!689174 (= e!392473 (contains!3624 acc!681 k0!2843))))

(declare-fun b!689175 () Bool)

(assert (=> b!689175 (= e!392477 (not (contains!3624 acc!681 k0!2843)))))

(declare-fun b!689176 () Bool)

(declare-fun res!453692 () Bool)

(assert (=> b!689176 (=> res!453692 e!392472)))

(declare-fun noDuplicate!898 (List!12972) Bool)

(assert (=> b!689176 (= res!453692 (not (noDuplicate!898 lt!316076)))))

(declare-fun b!689177 () Bool)

(declare-fun e!392474 () Bool)

(assert (=> b!689177 (= e!392474 (contains!3624 lt!316076 k0!2843))))

(declare-fun b!689178 () Bool)

(declare-fun res!453685 () Bool)

(assert (=> b!689178 (=> (not res!453685) (not e!392471))))

(declare-fun arrayContainsKey!0 (array!39711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689178 (= res!453685 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689179 () Bool)

(assert (=> b!689179 (= e!392471 (not e!392472))))

(declare-fun res!453683 () Bool)

(assert (=> b!689179 (=> res!453683 e!392472)))

(assert (=> b!689179 (= res!453683 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689179 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316076)))

(declare-datatypes ((Unit!24291 0))(
  ( (Unit!24292) )
))
(declare-fun lt!316072 () Unit!24291)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39711 (_ BitVec 64) (_ BitVec 32) List!12972 List!12972) Unit!24291)

(assert (=> b!689179 (= lt!316072 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316076))))

(declare-fun -!197 (List!12972 (_ BitVec 64)) List!12972)

(assert (=> b!689179 (= (-!197 lt!316076 k0!2843) acc!681)))

(declare-fun $colon$colon!395 (List!12972 (_ BitVec 64)) List!12972)

(assert (=> b!689179 (= lt!316076 ($colon$colon!395 acc!681 k0!2843))))

(declare-fun lt!316079 () Unit!24291)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12972) Unit!24291)

(assert (=> b!689179 (= lt!316079 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!233 (List!12972 List!12972) Bool)

(assert (=> b!689179 (subseq!233 acc!681 acc!681)))

(declare-fun lt!316075 () Unit!24291)

(declare-fun lemmaListSubSeqRefl!0 (List!12972) Unit!24291)

(assert (=> b!689179 (= lt!316075 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689179 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316074 () Unit!24291)

(declare-fun e!392480 () Unit!24291)

(assert (=> b!689179 (= lt!316074 e!392480)))

(declare-fun c!78113 () Bool)

(assert (=> b!689179 (= c!78113 (validKeyInArray!0 (select (arr!19024 a!3626) from!3004)))))

(declare-fun lt!316080 () Unit!24291)

(declare-fun e!392479 () Unit!24291)

(assert (=> b!689179 (= lt!316080 e!392479)))

(declare-fun c!78112 () Bool)

(assert (=> b!689179 (= c!78112 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689179 (arrayContainsKey!0 (array!39712 (store (arr!19024 a!3626) i!1382 k0!2843) (size!19404 a!3626)) k0!2843 from!3004)))

(declare-fun b!689180 () Bool)

(declare-fun res!453694 () Bool)

(assert (=> b!689180 (=> (not res!453694) (not e!392471))))

(assert (=> b!689180 (= res!453694 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19404 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689181 () Bool)

(declare-fun Unit!24293 () Unit!24291)

(assert (=> b!689181 (= e!392479 Unit!24293)))

(declare-fun b!689182 () Bool)

(declare-fun res!453690 () Bool)

(assert (=> b!689182 (=> res!453690 e!392472)))

(assert (=> b!689182 (= res!453690 (contains!3624 lt!316076 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689183 () Bool)

(declare-fun res!453682 () Bool)

(assert (=> b!689183 (=> (not res!453682) (not e!392471))))

(assert (=> b!689183 (= res!453682 (not (contains!3624 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689184 () Bool)

(declare-fun lt!316078 () Unit!24291)

(assert (=> b!689184 (= e!392480 lt!316078)))

(declare-fun lt!316077 () Unit!24291)

(assert (=> b!689184 (= lt!316077 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689184 (subseq!233 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39711 List!12972 List!12972 (_ BitVec 32)) Unit!24291)

(assert (=> b!689184 (= lt!316078 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!395 acc!681 (select (arr!19024 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689184 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689185 () Bool)

(declare-fun res!453693 () Bool)

(assert (=> b!689185 (=> (not res!453693) (not e!392471))))

(assert (=> b!689185 (= res!453693 (not (contains!3624 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!453698 () Bool)

(assert (=> start!61632 (=> (not res!453698) (not e!392471))))

(assert (=> start!61632 (= res!453698 (and (bvslt (size!19404 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19404 a!3626))))))

(assert (=> start!61632 e!392471))

(assert (=> start!61632 true))

(declare-fun array_inv!14883 (array!39711) Bool)

(assert (=> start!61632 (array_inv!14883 a!3626)))

(declare-fun b!689186 () Bool)

(assert (=> b!689186 (= e!392472 true)))

(declare-fun lt!316073 () Bool)

(declare-fun e!392478 () Bool)

(assert (=> b!689186 (= lt!316073 e!392478)))

(declare-fun res!453689 () Bool)

(assert (=> b!689186 (=> res!453689 e!392478)))

(assert (=> b!689186 (= res!453689 e!392474)))

(declare-fun res!453696 () Bool)

(assert (=> b!689186 (=> (not res!453696) (not e!392474))))

(assert (=> b!689186 (= res!453696 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689187 () Bool)

(declare-fun res!453681 () Bool)

(assert (=> b!689187 (=> (not res!453681) (not e!392471))))

(assert (=> b!689187 (= res!453681 e!392481)))

(declare-fun res!453695 () Bool)

(assert (=> b!689187 (=> res!453695 e!392481)))

(assert (=> b!689187 (= res!453695 e!392473)))

(declare-fun res!453691 () Bool)

(assert (=> b!689187 (=> (not res!453691) (not e!392473))))

(assert (=> b!689187 (= res!453691 (bvsgt from!3004 i!1382))))

(declare-fun b!689188 () Bool)

(declare-fun Unit!24294 () Unit!24291)

(assert (=> b!689188 (= e!392479 Unit!24294)))

(declare-fun lt!316081 () Unit!24291)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39711 (_ BitVec 64) (_ BitVec 32)) Unit!24291)

(assert (=> b!689188 (= lt!316081 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!689188 false))

(declare-fun b!689189 () Bool)

(declare-fun Unit!24295 () Unit!24291)

(assert (=> b!689189 (= e!392480 Unit!24295)))

(declare-fun b!689190 () Bool)

(assert (=> b!689190 (= e!392478 e!392475)))

(declare-fun res!453697 () Bool)

(assert (=> b!689190 (=> (not res!453697) (not e!392475))))

(assert (=> b!689190 (= res!453697 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689191 () Bool)

(declare-fun res!453680 () Bool)

(assert (=> b!689191 (=> (not res!453680) (not e!392471))))

(assert (=> b!689191 (= res!453680 (noDuplicate!898 acc!681))))

(assert (= (and start!61632 res!453698) b!689191))

(assert (= (and b!689191 res!453680) b!689185))

(assert (= (and b!689185 res!453693) b!689183))

(assert (= (and b!689183 res!453682) b!689187))

(assert (= (and b!689187 res!453691) b!689174))

(assert (= (and b!689187 (not res!453695)) b!689168))

(assert (= (and b!689168 res!453699) b!689175))

(assert (= (and b!689187 res!453681) b!689171))

(assert (= (and b!689171 res!453686) b!689172))

(assert (= (and b!689172 res!453684) b!689173))

(assert (= (and b!689173 res!453700) b!689170))

(assert (= (and b!689170 res!453688) b!689178))

(assert (= (and b!689178 res!453685) b!689180))

(assert (= (and b!689180 res!453694) b!689179))

(assert (= (and b!689179 c!78112) b!689188))

(assert (= (and b!689179 (not c!78112)) b!689181))

(assert (= (and b!689179 c!78113) b!689184))

(assert (= (and b!689179 (not c!78113)) b!689189))

(assert (= (and b!689179 (not res!453683)) b!689176))

(assert (= (and b!689176 (not res!453692)) b!689167))

(assert (= (and b!689167 (not res!453687)) b!689182))

(assert (= (and b!689182 (not res!453690)) b!689186))

(assert (= (and b!689186 res!453696) b!689177))

(assert (= (and b!689186 (not res!453689)) b!689190))

(assert (= (and b!689190 res!453697) b!689169))

(declare-fun m!653419 () Bool)

(assert (=> b!689170 m!653419))

(declare-fun m!653421 () Bool)

(assert (=> b!689172 m!653421))

(declare-fun m!653423 () Bool)

(assert (=> b!689175 m!653423))

(declare-fun m!653425 () Bool)

(assert (=> start!61632 m!653425))

(declare-fun m!653427 () Bool)

(assert (=> b!689167 m!653427))

(declare-fun m!653429 () Bool)

(assert (=> b!689184 m!653429))

(declare-fun m!653431 () Bool)

(assert (=> b!689184 m!653431))

(declare-fun m!653433 () Bool)

(assert (=> b!689184 m!653433))

(declare-fun m!653435 () Bool)

(assert (=> b!689184 m!653435))

(assert (=> b!689184 m!653431))

(assert (=> b!689184 m!653433))

(declare-fun m!653437 () Bool)

(assert (=> b!689184 m!653437))

(declare-fun m!653439 () Bool)

(assert (=> b!689184 m!653439))

(declare-fun m!653441 () Bool)

(assert (=> b!689191 m!653441))

(assert (=> b!689179 m!653429))

(assert (=> b!689179 m!653431))

(declare-fun m!653443 () Bool)

(assert (=> b!689179 m!653443))

(declare-fun m!653445 () Bool)

(assert (=> b!689179 m!653445))

(assert (=> b!689179 m!653437))

(declare-fun m!653447 () Bool)

(assert (=> b!689179 m!653447))

(assert (=> b!689179 m!653431))

(declare-fun m!653449 () Bool)

(assert (=> b!689179 m!653449))

(declare-fun m!653451 () Bool)

(assert (=> b!689179 m!653451))

(declare-fun m!653453 () Bool)

(assert (=> b!689179 m!653453))

(declare-fun m!653455 () Bool)

(assert (=> b!689179 m!653455))

(declare-fun m!653457 () Bool)

(assert (=> b!689179 m!653457))

(declare-fun m!653459 () Bool)

(assert (=> b!689179 m!653459))

(assert (=> b!689179 m!653439))

(declare-fun m!653461 () Bool)

(assert (=> b!689171 m!653461))

(declare-fun m!653463 () Bool)

(assert (=> b!689169 m!653463))

(assert (=> b!689174 m!653423))

(declare-fun m!653465 () Bool)

(assert (=> b!689183 m!653465))

(declare-fun m!653467 () Bool)

(assert (=> b!689182 m!653467))

(declare-fun m!653469 () Bool)

(assert (=> b!689178 m!653469))

(declare-fun m!653471 () Bool)

(assert (=> b!689176 m!653471))

(assert (=> b!689177 m!653463))

(declare-fun m!653473 () Bool)

(assert (=> b!689188 m!653473))

(declare-fun m!653475 () Bool)

(assert (=> b!689185 m!653475))

(check-sat (not b!689179) (not start!61632) (not b!689191) (not b!689185) (not b!689183) (not b!689170) (not b!689182) (not b!689174) (not b!689171) (not b!689188) (not b!689172) (not b!689176) (not b!689169) (not b!689178) (not b!689175) (not b!689177) (not b!689167) (not b!689184))
(check-sat)
