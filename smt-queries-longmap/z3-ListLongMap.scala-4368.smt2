; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60224 () Bool)

(assert start!60224)

(declare-fun b!674569 () Bool)

(declare-datatypes ((Unit!23726 0))(
  ( (Unit!23727) )
))
(declare-fun e!384966 () Unit!23726)

(declare-fun Unit!23728 () Unit!23726)

(assert (=> b!674569 (= e!384966 Unit!23728)))

(declare-fun b!674570 () Bool)

(declare-fun res!441174 () Bool)

(declare-fun e!384974 () Bool)

(assert (=> b!674570 (=> (not res!441174) (not e!384974))))

(declare-datatypes ((List!12913 0))(
  ( (Nil!12910) (Cons!12909 (h!13954 (_ BitVec 64)) (t!19132 List!12913)) )
))
(declare-fun acc!681 () List!12913)

(declare-fun noDuplicate!704 (List!12913) Bool)

(assert (=> b!674570 (= res!441174 (noDuplicate!704 acc!681))))

(declare-fun b!674571 () Bool)

(declare-fun res!441181 () Bool)

(declare-fun e!384973 () Bool)

(assert (=> b!674571 (=> (not res!441181) (not e!384973))))

(declare-fun lt!312424 () List!12913)

(declare-datatypes ((array!39282 0))(
  ( (array!39283 (arr!18833 (Array (_ BitVec 32) (_ BitVec 64))) (size!19198 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39282)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39282 (_ BitVec 32) List!12913) Bool)

(assert (=> b!674571 (= res!441181 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312424))))

(declare-fun b!674572 () Bool)

(declare-fun res!441175 () Bool)

(assert (=> b!674572 (=> (not res!441175) (not e!384974))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674572 (= res!441175 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19198 a!3626))))))

(declare-fun b!674573 () Bool)

(declare-fun res!441185 () Bool)

(assert (=> b!674573 (=> (not res!441185) (not e!384974))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674573 (= res!441185 (validKeyInArray!0 k0!2843))))

(declare-fun b!674575 () Bool)

(declare-fun res!441190 () Bool)

(assert (=> b!674575 (=> (not res!441190) (not e!384974))))

(assert (=> b!674575 (= res!441190 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674576 () Bool)

(assert (=> b!674576 (= e!384973 (not true))))

(assert (=> b!674576 (arrayNoDuplicates!0 (array!39283 (store (arr!18833 a!3626) i!1382 k0!2843) (size!19198 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312424)))

(declare-fun lt!312425 () Unit!23726)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39282 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12913) Unit!23726)

(assert (=> b!674576 (= lt!312425 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312424))))

(declare-fun b!674577 () Bool)

(declare-fun res!441188 () Bool)

(assert (=> b!674577 (=> (not res!441188) (not e!384974))))

(declare-fun arrayContainsKey!0 (array!39282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674577 (= res!441188 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674578 () Bool)

(declare-fun res!441171 () Bool)

(assert (=> b!674578 (=> (not res!441171) (not e!384974))))

(declare-fun contains!3435 (List!12913 (_ BitVec 64)) Bool)

(assert (=> b!674578 (= res!441171 (not (contains!3435 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674579 () Bool)

(declare-fun e!384964 () Bool)

(assert (=> b!674579 (= e!384974 e!384964)))

(declare-fun res!441172 () Bool)

(assert (=> b!674579 (=> (not res!441172) (not e!384964))))

(assert (=> b!674579 (= res!441172 (not (= (select (arr!18833 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312423 () Unit!23726)

(assert (=> b!674579 (= lt!312423 e!384966)))

(declare-fun c!77067 () Bool)

(assert (=> b!674579 (= c!77067 (= (select (arr!18833 a!3626) from!3004) k0!2843))))

(declare-fun b!674580 () Bool)

(assert (=> b!674580 (= e!384964 e!384973)))

(declare-fun res!441176 () Bool)

(assert (=> b!674580 (=> (not res!441176) (not e!384973))))

(assert (=> b!674580 (= res!441176 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!301 (List!12913 (_ BitVec 64)) List!12913)

(assert (=> b!674580 (= lt!312424 ($colon$colon!301 acc!681 (select (arr!18833 a!3626) from!3004)))))

(declare-fun b!674581 () Bool)

(declare-fun e!384969 () Bool)

(declare-fun e!384965 () Bool)

(assert (=> b!674581 (= e!384969 e!384965)))

(declare-fun res!441178 () Bool)

(assert (=> b!674581 (=> (not res!441178) (not e!384965))))

(assert (=> b!674581 (= res!441178 (bvsle from!3004 i!1382))))

(declare-fun b!674582 () Bool)

(declare-fun res!441187 () Bool)

(assert (=> b!674582 (=> (not res!441187) (not e!384973))))

(assert (=> b!674582 (= res!441187 (not (contains!3435 lt!312424 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674583 () Bool)

(declare-fun Unit!23729 () Unit!23726)

(assert (=> b!674583 (= e!384966 Unit!23729)))

(assert (=> b!674583 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312426 () Unit!23726)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39282 (_ BitVec 64) (_ BitVec 32)) Unit!23726)

(assert (=> b!674583 (= lt!312426 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674583 false))

(declare-fun res!441186 () Bool)

(assert (=> start!60224 (=> (not res!441186) (not e!384974))))

(assert (=> start!60224 (= res!441186 (and (bvslt (size!19198 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19198 a!3626))))))

(assert (=> start!60224 e!384974))

(assert (=> start!60224 true))

(declare-fun array_inv!14716 (array!39282) Bool)

(assert (=> start!60224 (array_inv!14716 a!3626)))

(declare-fun b!674574 () Bool)

(declare-fun res!441177 () Bool)

(assert (=> b!674574 (=> (not res!441177) (not e!384974))))

(assert (=> b!674574 (= res!441177 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12910))))

(declare-fun b!674584 () Bool)

(declare-fun res!441192 () Bool)

(assert (=> b!674584 (=> (not res!441192) (not e!384974))))

(assert (=> b!674584 (= res!441192 (not (contains!3435 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674585 () Bool)

(declare-fun res!441169 () Bool)

(assert (=> b!674585 (=> (not res!441169) (not e!384974))))

(assert (=> b!674585 (= res!441169 (validKeyInArray!0 (select (arr!18833 a!3626) from!3004)))))

(declare-fun b!674586 () Bool)

(declare-fun res!441191 () Bool)

(assert (=> b!674586 (=> (not res!441191) (not e!384973))))

(assert (=> b!674586 (= res!441191 (not (contains!3435 lt!312424 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674587 () Bool)

(declare-fun res!441193 () Bool)

(assert (=> b!674587 (=> (not res!441193) (not e!384973))))

(declare-fun e!384971 () Bool)

(assert (=> b!674587 (= res!441193 e!384971)))

(declare-fun res!441180 () Bool)

(assert (=> b!674587 (=> res!441180 e!384971)))

(declare-fun e!384967 () Bool)

(assert (=> b!674587 (= res!441180 e!384967)))

(declare-fun res!441182 () Bool)

(assert (=> b!674587 (=> (not res!441182) (not e!384967))))

(assert (=> b!674587 (= res!441182 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674588 () Bool)

(assert (=> b!674588 (= e!384967 (contains!3435 lt!312424 k0!2843))))

(declare-fun b!674589 () Bool)

(declare-fun e!384970 () Bool)

(assert (=> b!674589 (= e!384970 (contains!3435 acc!681 k0!2843))))

(declare-fun b!674590 () Bool)

(declare-fun e!384972 () Bool)

(assert (=> b!674590 (= e!384972 (not (contains!3435 lt!312424 k0!2843)))))

(declare-fun b!674591 () Bool)

(declare-fun res!441173 () Bool)

(assert (=> b!674591 (=> (not res!441173) (not e!384973))))

(assert (=> b!674591 (= res!441173 (noDuplicate!704 lt!312424))))

(declare-fun b!674592 () Bool)

(declare-fun res!441183 () Bool)

(assert (=> b!674592 (=> (not res!441183) (not e!384974))))

(assert (=> b!674592 (= res!441183 e!384969)))

(declare-fun res!441184 () Bool)

(assert (=> b!674592 (=> res!441184 e!384969)))

(assert (=> b!674592 (= res!441184 e!384970)))

(declare-fun res!441179 () Bool)

(assert (=> b!674592 (=> (not res!441179) (not e!384970))))

(assert (=> b!674592 (= res!441179 (bvsgt from!3004 i!1382))))

(declare-fun b!674593 () Bool)

(declare-fun res!441189 () Bool)

(assert (=> b!674593 (=> (not res!441189) (not e!384974))))

(assert (=> b!674593 (= res!441189 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19198 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674594 () Bool)

(assert (=> b!674594 (= e!384965 (not (contains!3435 acc!681 k0!2843)))))

(declare-fun b!674595 () Bool)

(assert (=> b!674595 (= e!384971 e!384972)))

(declare-fun res!441170 () Bool)

(assert (=> b!674595 (=> (not res!441170) (not e!384972))))

(assert (=> b!674595 (= res!441170 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60224 res!441186) b!674570))

(assert (= (and b!674570 res!441174) b!674584))

(assert (= (and b!674584 res!441192) b!674578))

(assert (= (and b!674578 res!441171) b!674592))

(assert (= (and b!674592 res!441179) b!674589))

(assert (= (and b!674592 (not res!441184)) b!674581))

(assert (= (and b!674581 res!441178) b!674594))

(assert (= (and b!674592 res!441183) b!674574))

(assert (= (and b!674574 res!441177) b!674575))

(assert (= (and b!674575 res!441190) b!674572))

(assert (= (and b!674572 res!441175) b!674573))

(assert (= (and b!674573 res!441185) b!674577))

(assert (= (and b!674577 res!441188) b!674593))

(assert (= (and b!674593 res!441189) b!674585))

(assert (= (and b!674585 res!441169) b!674579))

(assert (= (and b!674579 c!77067) b!674583))

(assert (= (and b!674579 (not c!77067)) b!674569))

(assert (= (and b!674579 res!441172) b!674580))

(assert (= (and b!674580 res!441176) b!674591))

(assert (= (and b!674591 res!441173) b!674582))

(assert (= (and b!674582 res!441187) b!674586))

(assert (= (and b!674586 res!441191) b!674587))

(assert (= (and b!674587 res!441182) b!674588))

(assert (= (and b!674587 (not res!441180)) b!674595))

(assert (= (and b!674595 res!441170) b!674590))

(assert (= (and b!674587 res!441193) b!674571))

(assert (= (and b!674571 res!441181) b!674576))

(declare-fun m!641841 () Bool)

(assert (=> start!60224 m!641841))

(declare-fun m!641843 () Bool)

(assert (=> b!674589 m!641843))

(declare-fun m!641845 () Bool)

(assert (=> b!674570 m!641845))

(declare-fun m!641847 () Bool)

(assert (=> b!674591 m!641847))

(declare-fun m!641849 () Bool)

(assert (=> b!674576 m!641849))

(declare-fun m!641851 () Bool)

(assert (=> b!674576 m!641851))

(declare-fun m!641853 () Bool)

(assert (=> b!674576 m!641853))

(declare-fun m!641855 () Bool)

(assert (=> b!674583 m!641855))

(declare-fun m!641857 () Bool)

(assert (=> b!674583 m!641857))

(declare-fun m!641859 () Bool)

(assert (=> b!674580 m!641859))

(assert (=> b!674580 m!641859))

(declare-fun m!641861 () Bool)

(assert (=> b!674580 m!641861))

(assert (=> b!674579 m!641859))

(declare-fun m!641863 () Bool)

(assert (=> b!674577 m!641863))

(declare-fun m!641865 () Bool)

(assert (=> b!674571 m!641865))

(declare-fun m!641867 () Bool)

(assert (=> b!674590 m!641867))

(declare-fun m!641869 () Bool)

(assert (=> b!674573 m!641869))

(declare-fun m!641871 () Bool)

(assert (=> b!674575 m!641871))

(assert (=> b!674588 m!641867))

(declare-fun m!641873 () Bool)

(assert (=> b!674584 m!641873))

(assert (=> b!674594 m!641843))

(declare-fun m!641875 () Bool)

(assert (=> b!674574 m!641875))

(declare-fun m!641877 () Bool)

(assert (=> b!674578 m!641877))

(declare-fun m!641879 () Bool)

(assert (=> b!674582 m!641879))

(assert (=> b!674585 m!641859))

(assert (=> b!674585 m!641859))

(declare-fun m!641881 () Bool)

(assert (=> b!674585 m!641881))

(declare-fun m!641883 () Bool)

(assert (=> b!674586 m!641883))

(check-sat (not b!674578) (not b!674574) (not b!674570) (not b!674582) (not start!60224) (not b!674573) (not b!674576) (not b!674591) (not b!674571) (not b!674584) (not b!674586) (not b!674583) (not b!674594) (not b!674580) (not b!674585) (not b!674590) (not b!674575) (not b!674588) (not b!674577) (not b!674589))
(check-sat)
