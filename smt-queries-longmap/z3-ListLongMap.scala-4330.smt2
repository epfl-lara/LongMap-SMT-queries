; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60010 () Bool)

(assert start!60010)

(declare-fun b!666953 () Bool)

(declare-fun e!381844 () Bool)

(declare-datatypes ((List!12762 0))(
  ( (Nil!12759) (Cons!12758 (h!13803 (_ BitVec 64)) (t!18990 List!12762)) )
))
(declare-fun acc!681 () List!12762)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3339 (List!12762 (_ BitVec 64)) Bool)

(assert (=> b!666953 (= e!381844 (contains!3339 acc!681 k0!2843))))

(declare-fun b!666954 () Bool)

(declare-fun res!434249 () Bool)

(declare-fun e!381848 () Bool)

(assert (=> b!666954 (=> res!434249 e!381848)))

(declare-fun lt!310632 () Bool)

(assert (=> b!666954 (= res!434249 lt!310632)))

(declare-fun b!666955 () Bool)

(declare-fun res!434245 () Bool)

(assert (=> b!666955 (=> res!434245 e!381848)))

(declare-fun lt!310631 () List!12762)

(assert (=> b!666955 (= res!434245 (not (contains!3339 lt!310631 k0!2843)))))

(declare-fun b!666956 () Bool)

(declare-fun res!434252 () Bool)

(declare-fun e!381846 () Bool)

(assert (=> b!666956 (=> (not res!434252) (not e!381846))))

(declare-datatypes ((array!39057 0))(
  ( (array!39058 (arr!18721 (Array (_ BitVec 32) (_ BitVec 64))) (size!19085 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39057)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39057 (_ BitVec 32) List!12762) Bool)

(assert (=> b!666956 (= res!434252 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666957 () Bool)

(declare-fun e!381842 () Bool)

(declare-fun e!381843 () Bool)

(assert (=> b!666957 (= e!381842 e!381843)))

(declare-fun res!434243 () Bool)

(assert (=> b!666957 (=> (not res!434243) (not e!381843))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666957 (= res!434243 (bvsle from!3004 i!1382))))

(declare-fun b!666958 () Bool)

(assert (=> b!666958 (= e!381843 (not (contains!3339 acc!681 k0!2843)))))

(declare-fun b!666959 () Bool)

(declare-fun res!434242 () Bool)

(assert (=> b!666959 (=> (not res!434242) (not e!381846))))

(assert (=> b!666959 (= res!434242 (not (contains!3339 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666960 () Bool)

(declare-fun res!434247 () Bool)

(assert (=> b!666960 (=> (not res!434247) (not e!381846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666960 (= res!434247 (validKeyInArray!0 k0!2843))))

(declare-fun b!666962 () Bool)

(declare-fun res!434253 () Bool)

(assert (=> b!666962 (=> res!434253 e!381848)))

(assert (=> b!666962 (= res!434253 (contains!3339 acc!681 k0!2843))))

(declare-fun b!666963 () Bool)

(declare-datatypes ((Unit!23330 0))(
  ( (Unit!23331) )
))
(declare-fun e!381847 () Unit!23330)

(declare-fun Unit!23332 () Unit!23330)

(assert (=> b!666963 (= e!381847 Unit!23332)))

(declare-fun b!666964 () Bool)

(declare-fun res!434241 () Bool)

(assert (=> b!666964 (=> (not res!434241) (not e!381846))))

(assert (=> b!666964 (= res!434241 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19085 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666965 () Bool)

(declare-fun res!434250 () Bool)

(assert (=> b!666965 (=> (not res!434250) (not e!381846))))

(assert (=> b!666965 (= res!434250 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19085 a!3626))))))

(declare-fun b!666966 () Bool)

(declare-fun res!434260 () Bool)

(assert (=> b!666966 (=> res!434260 e!381848)))

(declare-fun noDuplicate!586 (List!12762) Bool)

(assert (=> b!666966 (= res!434260 (not (noDuplicate!586 lt!310631)))))

(declare-fun b!666967 () Bool)

(declare-fun res!434261 () Bool)

(assert (=> b!666967 (=> (not res!434261) (not e!381846))))

(declare-fun arrayContainsKey!0 (array!39057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666967 (= res!434261 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666968 () Bool)

(declare-fun lt!310625 () Unit!23330)

(assert (=> b!666968 (= e!381847 lt!310625)))

(declare-fun lt!310630 () Unit!23330)

(declare-fun lemmaListSubSeqRefl!0 (List!12762) Unit!23330)

(assert (=> b!666968 (= lt!310630 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!78 (List!12762 List!12762) Bool)

(assert (=> b!666968 (subseq!78 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39057 List!12762 List!12762 (_ BitVec 32)) Unit!23330)

(declare-fun $colon$colon!210 (List!12762 (_ BitVec 64)) List!12762)

(assert (=> b!666968 (= lt!310625 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!210 acc!681 (select (arr!18721 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666968 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666969 () Bool)

(declare-fun res!434248 () Bool)

(assert (=> b!666969 (=> (not res!434248) (not e!381846))))

(assert (=> b!666969 (= res!434248 (noDuplicate!586 acc!681))))

(declare-fun b!666970 () Bool)

(declare-fun res!434246 () Bool)

(assert (=> b!666970 (=> (not res!434246) (not e!381846))))

(assert (=> b!666970 (= res!434246 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12759))))

(declare-fun b!666971 () Bool)

(declare-fun e!381845 () Unit!23330)

(declare-fun Unit!23333 () Unit!23330)

(assert (=> b!666971 (= e!381845 Unit!23333)))

(declare-fun res!434256 () Bool)

(assert (=> start!60010 (=> (not res!434256) (not e!381846))))

(assert (=> start!60010 (= res!434256 (and (bvslt (size!19085 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19085 a!3626))))))

(assert (=> start!60010 e!381846))

(assert (=> start!60010 true))

(declare-fun array_inv!14517 (array!39057) Bool)

(assert (=> start!60010 (array_inv!14517 a!3626)))

(declare-fun b!666961 () Bool)

(assert (=> b!666961 (= e!381848 true)))

(declare-fun lt!310633 () Bool)

(assert (=> b!666961 (= lt!310633 (contains!3339 lt!310631 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666972 () Bool)

(declare-fun res!434258 () Bool)

(assert (=> b!666972 (=> res!434258 e!381848)))

(assert (=> b!666972 (= res!434258 (not (subseq!78 acc!681 lt!310631)))))

(declare-fun b!666973 () Bool)

(declare-fun res!434254 () Bool)

(assert (=> b!666973 (=> (not res!434254) (not e!381846))))

(assert (=> b!666973 (= res!434254 (not (contains!3339 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666974 () Bool)

(declare-fun res!434255 () Bool)

(assert (=> b!666974 (=> res!434255 e!381848)))

(assert (=> b!666974 (= res!434255 (contains!3339 lt!310631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666975 () Bool)

(declare-fun res!434257 () Bool)

(assert (=> b!666975 (=> (not res!434257) (not e!381846))))

(assert (=> b!666975 (= res!434257 e!381842)))

(declare-fun res!434259 () Bool)

(assert (=> b!666975 (=> res!434259 e!381842)))

(assert (=> b!666975 (= res!434259 e!381844)))

(declare-fun res!434244 () Bool)

(assert (=> b!666975 (=> (not res!434244) (not e!381844))))

(assert (=> b!666975 (= res!434244 (bvsgt from!3004 i!1382))))

(declare-fun b!666976 () Bool)

(assert (=> b!666976 (= e!381846 (not e!381848))))

(declare-fun res!434251 () Bool)

(assert (=> b!666976 (=> res!434251 e!381848)))

(assert (=> b!666976 (= res!434251 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!76 (List!12762 (_ BitVec 64)) List!12762)

(assert (=> b!666976 (= (-!76 lt!310631 k0!2843) acc!681)))

(assert (=> b!666976 (= lt!310631 ($colon$colon!210 acc!681 k0!2843))))

(declare-fun lt!310627 () Unit!23330)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12762) Unit!23330)

(assert (=> b!666976 (= lt!310627 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!666976 (subseq!78 acc!681 acc!681)))

(declare-fun lt!310626 () Unit!23330)

(assert (=> b!666976 (= lt!310626 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666976 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310628 () Unit!23330)

(assert (=> b!666976 (= lt!310628 e!381847)))

(declare-fun c!76723 () Bool)

(assert (=> b!666976 (= c!76723 (validKeyInArray!0 (select (arr!18721 a!3626) from!3004)))))

(declare-fun lt!310629 () Unit!23330)

(assert (=> b!666976 (= lt!310629 e!381845)))

(declare-fun c!76724 () Bool)

(assert (=> b!666976 (= c!76724 lt!310632)))

(assert (=> b!666976 (= lt!310632 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666976 (arrayContainsKey!0 (array!39058 (store (arr!18721 a!3626) i!1382 k0!2843) (size!19085 a!3626)) k0!2843 from!3004)))

(declare-fun b!666977 () Bool)

(declare-fun Unit!23334 () Unit!23330)

(assert (=> b!666977 (= e!381845 Unit!23334)))

(declare-fun lt!310624 () Unit!23330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39057 (_ BitVec 64) (_ BitVec 32)) Unit!23330)

(assert (=> b!666977 (= lt!310624 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!666977 false))

(assert (= (and start!60010 res!434256) b!666969))

(assert (= (and b!666969 res!434248) b!666959))

(assert (= (and b!666959 res!434242) b!666973))

(assert (= (and b!666973 res!434254) b!666975))

(assert (= (and b!666975 res!434244) b!666953))

(assert (= (and b!666975 (not res!434259)) b!666957))

(assert (= (and b!666957 res!434243) b!666958))

(assert (= (and b!666975 res!434257) b!666970))

(assert (= (and b!666970 res!434246) b!666956))

(assert (= (and b!666956 res!434252) b!666965))

(assert (= (and b!666965 res!434250) b!666960))

(assert (= (and b!666960 res!434247) b!666967))

(assert (= (and b!666967 res!434261) b!666964))

(assert (= (and b!666964 res!434241) b!666976))

(assert (= (and b!666976 c!76724) b!666977))

(assert (= (and b!666976 (not c!76724)) b!666971))

(assert (= (and b!666976 c!76723) b!666968))

(assert (= (and b!666976 (not c!76723)) b!666963))

(assert (= (and b!666976 (not res!434251)) b!666966))

(assert (= (and b!666966 (not res!434260)) b!666954))

(assert (= (and b!666954 (not res!434249)) b!666962))

(assert (= (and b!666962 (not res!434253)) b!666972))

(assert (= (and b!666972 (not res!434258)) b!666955))

(assert (= (and b!666955 (not res!434245)) b!666974))

(assert (= (and b!666974 (not res!434255)) b!666961))

(declare-fun m!637621 () Bool)

(assert (=> b!666958 m!637621))

(declare-fun m!637623 () Bool)

(assert (=> b!666961 m!637623))

(declare-fun m!637625 () Bool)

(assert (=> b!666970 m!637625))

(declare-fun m!637627 () Bool)

(assert (=> b!666976 m!637627))

(declare-fun m!637629 () Bool)

(assert (=> b!666976 m!637629))

(declare-fun m!637631 () Bool)

(assert (=> b!666976 m!637631))

(declare-fun m!637633 () Bool)

(assert (=> b!666976 m!637633))

(declare-fun m!637635 () Bool)

(assert (=> b!666976 m!637635))

(declare-fun m!637637 () Bool)

(assert (=> b!666976 m!637637))

(declare-fun m!637639 () Bool)

(assert (=> b!666976 m!637639))

(declare-fun m!637641 () Bool)

(assert (=> b!666976 m!637641))

(assert (=> b!666976 m!637629))

(declare-fun m!637643 () Bool)

(assert (=> b!666976 m!637643))

(declare-fun m!637645 () Bool)

(assert (=> b!666976 m!637645))

(declare-fun m!637647 () Bool)

(assert (=> b!666976 m!637647))

(declare-fun m!637649 () Bool)

(assert (=> start!60010 m!637649))

(declare-fun m!637651 () Bool)

(assert (=> b!666966 m!637651))

(declare-fun m!637653 () Bool)

(assert (=> b!666969 m!637653))

(declare-fun m!637655 () Bool)

(assert (=> b!666972 m!637655))

(assert (=> b!666968 m!637627))

(assert (=> b!666968 m!637629))

(declare-fun m!637657 () Bool)

(assert (=> b!666968 m!637657))

(declare-fun m!637659 () Bool)

(assert (=> b!666968 m!637659))

(assert (=> b!666968 m!637629))

(assert (=> b!666968 m!637657))

(assert (=> b!666968 m!637637))

(assert (=> b!666968 m!637647))

(declare-fun m!637661 () Bool)

(assert (=> b!666974 m!637661))

(declare-fun m!637663 () Bool)

(assert (=> b!666977 m!637663))

(declare-fun m!637665 () Bool)

(assert (=> b!666959 m!637665))

(assert (=> b!666962 m!637621))

(declare-fun m!637667 () Bool)

(assert (=> b!666973 m!637667))

(declare-fun m!637669 () Bool)

(assert (=> b!666960 m!637669))

(assert (=> b!666953 m!637621))

(declare-fun m!637671 () Bool)

(assert (=> b!666967 m!637671))

(declare-fun m!637673 () Bool)

(assert (=> b!666956 m!637673))

(declare-fun m!637675 () Bool)

(assert (=> b!666955 m!637675))

(check-sat (not b!666970) (not b!666959) (not b!666968) (not b!666974) (not b!666962) (not b!666958) (not b!666966) (not b!666961) (not start!60010) (not b!666953) (not b!666976) (not b!666977) (not b!666956) (not b!666960) (not b!666969) (not b!666955) (not b!666973) (not b!666967) (not b!666972))
(check-sat)
