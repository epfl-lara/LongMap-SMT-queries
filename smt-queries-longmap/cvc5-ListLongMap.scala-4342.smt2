; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60142 () Bool)

(assert start!60142)

(declare-fun b!669952 () Bool)

(declare-fun e!383168 () Bool)

(declare-datatypes ((List!12701 0))(
  ( (Nil!12698) (Cons!12697 (h!13745 (_ BitVec 64)) (t!18921 List!12701)) )
))
(declare-fun acc!681 () List!12701)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3353 (List!12701 (_ BitVec 64)) Bool)

(assert (=> b!669952 (= e!383168 (not (contains!3353 acc!681 k!2843)))))

(declare-fun b!669953 () Bool)

(declare-fun res!436692 () Bool)

(declare-fun e!383170 () Bool)

(assert (=> b!669953 (=> res!436692 e!383170)))

(declare-fun lt!311842 () List!12701)

(declare-fun noDuplicate!627 (List!12701) Bool)

(assert (=> b!669953 (= res!436692 (not (noDuplicate!627 lt!311842)))))

(declare-fun b!669954 () Bool)

(declare-fun res!436691 () Bool)

(assert (=> b!669954 (=> res!436691 e!383170)))

(assert (=> b!669954 (= res!436691 (contains!3353 lt!311842 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669955 () Bool)

(declare-fun res!436697 () Bool)

(declare-fun e!383165 () Bool)

(assert (=> b!669955 (=> (not res!436697) (not e!383165))))

(declare-fun e!383166 () Bool)

(assert (=> b!669955 (= res!436697 e!383166)))

(declare-fun res!436685 () Bool)

(assert (=> b!669955 (=> res!436685 e!383166)))

(declare-fun e!383173 () Bool)

(assert (=> b!669955 (= res!436685 e!383173)))

(declare-fun res!436703 () Bool)

(assert (=> b!669955 (=> (not res!436703) (not e!383173))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669955 (= res!436703 (bvsgt from!3004 i!1382))))

(declare-fun b!669956 () Bool)

(declare-datatypes ((Unit!23494 0))(
  ( (Unit!23495) )
))
(declare-fun e!383171 () Unit!23494)

(declare-fun Unit!23496 () Unit!23494)

(assert (=> b!669956 (= e!383171 Unit!23496)))

(declare-fun b!669957 () Bool)

(declare-fun res!436690 () Bool)

(assert (=> b!669957 (=> (not res!436690) (not e!383165))))

(declare-datatypes ((array!39127 0))(
  ( (array!39128 (arr!18753 (Array (_ BitVec 32) (_ BitVec 64))) (size!19117 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39127)

(declare-fun arrayNoDuplicates!0 (array!39127 (_ BitVec 32) List!12701) Bool)

(assert (=> b!669957 (= res!436690 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669958 () Bool)

(declare-fun res!436702 () Bool)

(assert (=> b!669958 (=> (not res!436702) (not e!383165))))

(assert (=> b!669958 (= res!436702 (noDuplicate!627 acc!681))))

(declare-fun b!669959 () Bool)

(declare-fun e!383172 () Bool)

(assert (=> b!669959 (= e!383172 (not (contains!3353 lt!311842 k!2843)))))

(declare-fun b!669960 () Bool)

(declare-fun res!436701 () Bool)

(assert (=> b!669960 (=> (not res!436701) (not e!383165))))

(declare-fun arrayContainsKey!0 (array!39127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669960 (= res!436701 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669961 () Bool)

(assert (=> b!669961 (= e!383166 e!383168)))

(declare-fun res!436689 () Bool)

(assert (=> b!669961 (=> (not res!436689) (not e!383168))))

(assert (=> b!669961 (= res!436689 (bvsle from!3004 i!1382))))

(declare-fun b!669962 () Bool)

(declare-fun res!436705 () Bool)

(assert (=> b!669962 (=> (not res!436705) (not e!383165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669962 (= res!436705 (validKeyInArray!0 k!2843))))

(declare-fun b!669963 () Bool)

(declare-fun res!436693 () Bool)

(assert (=> b!669963 (=> (not res!436693) (not e!383165))))

(assert (=> b!669963 (= res!436693 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19117 a!3626))))))

(declare-fun b!669964 () Bool)

(declare-fun res!436694 () Bool)

(assert (=> b!669964 (=> (not res!436694) (not e!383165))))

(assert (=> b!669964 (= res!436694 (not (contains!3353 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669966 () Bool)

(declare-fun e!383175 () Bool)

(assert (=> b!669966 (= e!383175 e!383172)))

(declare-fun res!436704 () Bool)

(assert (=> b!669966 (=> (not res!436704) (not e!383172))))

(assert (=> b!669966 (= res!436704 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669967 () Bool)

(declare-fun Unit!23497 () Unit!23494)

(assert (=> b!669967 (= e!383171 Unit!23497)))

(declare-fun lt!311844 () Unit!23494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39127 (_ BitVec 64) (_ BitVec 32)) Unit!23494)

(assert (=> b!669967 (= lt!311844 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669967 false))

(declare-fun b!669968 () Bool)

(declare-fun res!436688 () Bool)

(assert (=> b!669968 (=> res!436688 e!383170)))

(assert (=> b!669968 (= res!436688 (contains!3353 lt!311842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669969 () Bool)

(declare-fun res!436686 () Bool)

(assert (=> b!669969 (=> (not res!436686) (not e!383165))))

(assert (=> b!669969 (= res!436686 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19117 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669970 () Bool)

(assert (=> b!669970 (= e!383173 (contains!3353 acc!681 k!2843))))

(declare-fun b!669971 () Bool)

(assert (=> b!669971 (= e!383170 true)))

(declare-fun lt!311840 () Bool)

(assert (=> b!669971 (= lt!311840 e!383175)))

(declare-fun res!436696 () Bool)

(assert (=> b!669971 (=> res!436696 e!383175)))

(declare-fun e!383167 () Bool)

(assert (=> b!669971 (= res!436696 e!383167)))

(declare-fun res!436700 () Bool)

(assert (=> b!669971 (=> (not res!436700) (not e!383167))))

(assert (=> b!669971 (= res!436700 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669972 () Bool)

(declare-fun e!383169 () Unit!23494)

(declare-fun Unit!23498 () Unit!23494)

(assert (=> b!669972 (= e!383169 Unit!23498)))

(declare-fun b!669973 () Bool)

(assert (=> b!669973 (= e!383165 (not e!383170))))

(declare-fun res!436698 () Bool)

(assert (=> b!669973 (=> res!436698 e!383170)))

(assert (=> b!669973 (= res!436698 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669973 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311842)))

(declare-fun lt!311841 () Unit!23494)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39127 (_ BitVec 64) (_ BitVec 32) List!12701 List!12701) Unit!23494)

(assert (=> b!669973 (= lt!311841 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311842))))

(declare-fun -!112 (List!12701 (_ BitVec 64)) List!12701)

(assert (=> b!669973 (= (-!112 lt!311842 k!2843) acc!681)))

(declare-fun $colon$colon!244 (List!12701 (_ BitVec 64)) List!12701)

(assert (=> b!669973 (= lt!311842 ($colon$colon!244 acc!681 k!2843))))

(declare-fun lt!311838 () Unit!23494)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12701) Unit!23494)

(assert (=> b!669973 (= lt!311838 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!115 (List!12701 List!12701) Bool)

(assert (=> b!669973 (subseq!115 acc!681 acc!681)))

(declare-fun lt!311836 () Unit!23494)

(declare-fun lemmaListSubSeqRefl!0 (List!12701) Unit!23494)

(assert (=> b!669973 (= lt!311836 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669973 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311839 () Unit!23494)

(assert (=> b!669973 (= lt!311839 e!383169)))

(declare-fun c!77002 () Bool)

(assert (=> b!669973 (= c!77002 (validKeyInArray!0 (select (arr!18753 a!3626) from!3004)))))

(declare-fun lt!311837 () Unit!23494)

(assert (=> b!669973 (= lt!311837 e!383171)))

(declare-fun c!77003 () Bool)

(assert (=> b!669973 (= c!77003 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669973 (arrayContainsKey!0 (array!39128 (store (arr!18753 a!3626) i!1382 k!2843) (size!19117 a!3626)) k!2843 from!3004)))

(declare-fun b!669974 () Bool)

(assert (=> b!669974 (= e!383167 (contains!3353 lt!311842 k!2843))))

(declare-fun res!436695 () Bool)

(assert (=> start!60142 (=> (not res!436695) (not e!383165))))

(assert (=> start!60142 (= res!436695 (and (bvslt (size!19117 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19117 a!3626))))))

(assert (=> start!60142 e!383165))

(assert (=> start!60142 true))

(declare-fun array_inv!14612 (array!39127) Bool)

(assert (=> start!60142 (array_inv!14612 a!3626)))

(declare-fun b!669965 () Bool)

(declare-fun res!436687 () Bool)

(assert (=> b!669965 (=> (not res!436687) (not e!383165))))

(assert (=> b!669965 (= res!436687 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12698))))

(declare-fun b!669975 () Bool)

(declare-fun lt!311843 () Unit!23494)

(assert (=> b!669975 (= e!383169 lt!311843)))

(declare-fun lt!311845 () Unit!23494)

(assert (=> b!669975 (= lt!311845 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669975 (subseq!115 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39127 List!12701 List!12701 (_ BitVec 32)) Unit!23494)

(assert (=> b!669975 (= lt!311843 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!244 acc!681 (select (arr!18753 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669975 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669976 () Bool)

(declare-fun res!436699 () Bool)

(assert (=> b!669976 (=> (not res!436699) (not e!383165))))

(assert (=> b!669976 (= res!436699 (not (contains!3353 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60142 res!436695) b!669958))

(assert (= (and b!669958 res!436702) b!669964))

(assert (= (and b!669964 res!436694) b!669976))

(assert (= (and b!669976 res!436699) b!669955))

(assert (= (and b!669955 res!436703) b!669970))

(assert (= (and b!669955 (not res!436685)) b!669961))

(assert (= (and b!669961 res!436689) b!669952))

(assert (= (and b!669955 res!436697) b!669965))

(assert (= (and b!669965 res!436687) b!669957))

(assert (= (and b!669957 res!436690) b!669963))

(assert (= (and b!669963 res!436693) b!669962))

(assert (= (and b!669962 res!436705) b!669960))

(assert (= (and b!669960 res!436701) b!669969))

(assert (= (and b!669969 res!436686) b!669973))

(assert (= (and b!669973 c!77003) b!669967))

(assert (= (and b!669973 (not c!77003)) b!669956))

(assert (= (and b!669973 c!77002) b!669975))

(assert (= (and b!669973 (not c!77002)) b!669972))

(assert (= (and b!669973 (not res!436698)) b!669953))

(assert (= (and b!669953 (not res!436692)) b!669968))

(assert (= (and b!669968 (not res!436688)) b!669954))

(assert (= (and b!669954 (not res!436691)) b!669971))

(assert (= (and b!669971 res!436700) b!669974))

(assert (= (and b!669971 (not res!436696)) b!669966))

(assert (= (and b!669966 res!436704) b!669959))

(declare-fun m!640455 () Bool)

(assert (=> b!669960 m!640455))

(declare-fun m!640457 () Bool)

(assert (=> b!669976 m!640457))

(declare-fun m!640459 () Bool)

(assert (=> b!669954 m!640459))

(declare-fun m!640461 () Bool)

(assert (=> b!669959 m!640461))

(declare-fun m!640463 () Bool)

(assert (=> b!669965 m!640463))

(declare-fun m!640465 () Bool)

(assert (=> b!669967 m!640465))

(declare-fun m!640467 () Bool)

(assert (=> b!669953 m!640467))

(declare-fun m!640469 () Bool)

(assert (=> b!669975 m!640469))

(declare-fun m!640471 () Bool)

(assert (=> b!669975 m!640471))

(declare-fun m!640473 () Bool)

(assert (=> b!669975 m!640473))

(declare-fun m!640475 () Bool)

(assert (=> b!669975 m!640475))

(assert (=> b!669975 m!640471))

(assert (=> b!669975 m!640473))

(declare-fun m!640477 () Bool)

(assert (=> b!669975 m!640477))

(declare-fun m!640479 () Bool)

(assert (=> b!669975 m!640479))

(declare-fun m!640481 () Bool)

(assert (=> b!669964 m!640481))

(assert (=> b!669974 m!640461))

(declare-fun m!640483 () Bool)

(assert (=> b!669958 m!640483))

(declare-fun m!640485 () Bool)

(assert (=> b!669952 m!640485))

(assert (=> b!669970 m!640485))

(declare-fun m!640487 () Bool)

(assert (=> b!669968 m!640487))

(declare-fun m!640489 () Bool)

(assert (=> b!669973 m!640489))

(assert (=> b!669973 m!640469))

(assert (=> b!669973 m!640471))

(declare-fun m!640491 () Bool)

(assert (=> b!669973 m!640491))

(declare-fun m!640493 () Bool)

(assert (=> b!669973 m!640493))

(assert (=> b!669973 m!640477))

(declare-fun m!640495 () Bool)

(assert (=> b!669973 m!640495))

(declare-fun m!640497 () Bool)

(assert (=> b!669973 m!640497))

(assert (=> b!669973 m!640471))

(declare-fun m!640499 () Bool)

(assert (=> b!669973 m!640499))

(declare-fun m!640501 () Bool)

(assert (=> b!669973 m!640501))

(declare-fun m!640503 () Bool)

(assert (=> b!669973 m!640503))

(declare-fun m!640505 () Bool)

(assert (=> b!669973 m!640505))

(assert (=> b!669973 m!640479))

(declare-fun m!640507 () Bool)

(assert (=> b!669957 m!640507))

(declare-fun m!640509 () Bool)

(assert (=> start!60142 m!640509))

(declare-fun m!640511 () Bool)

(assert (=> b!669962 m!640511))

(push 1)

(assert (not b!669959))

(assert (not start!60142))

(assert (not b!669965))

(assert (not b!669962))

(assert (not b!669974))

(assert (not b!669954))

(assert (not b!669976))

(assert (not b!669964))

(assert (not b!669958))

(assert (not b!669975))

(assert (not b!669960))

(assert (not b!669952))

(assert (not b!669957))

(assert (not b!669967))

(assert (not b!669970))

(assert (not b!669953))

(assert (not b!669973))

(assert (not b!669968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

