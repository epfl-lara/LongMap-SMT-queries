; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59980 () Bool)

(assert start!59980)

(declare-fun res!431717 () Bool)

(declare-fun e!380946 () Bool)

(assert (=> start!59980 (=> (not res!431717) (not e!380946))))

(declare-datatypes ((array!38965 0))(
  ( (array!38966 (arr!18672 (Array (_ BitVec 32) (_ BitVec 64))) (size!19036 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38965)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59980 (= res!431717 (and (bvslt (size!19036 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19036 a!3626))))))

(assert (=> start!59980 e!380946))

(assert (=> start!59980 true))

(declare-fun array_inv!14531 (array!38965) Bool)

(assert (=> start!59980 (array_inv!14531 a!3626)))

(declare-fun b!664010 () Bool)

(declare-fun e!380950 () Bool)

(declare-datatypes ((List!12620 0))(
  ( (Nil!12617) (Cons!12616 (h!13664 (_ BitVec 64)) (t!18840 List!12620)) )
))
(declare-fun acc!681 () List!12620)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3272 (List!12620 (_ BitVec 64)) Bool)

(assert (=> b!664010 (= e!380950 (contains!3272 acc!681 k!2843))))

(declare-fun b!664011 () Bool)

(declare-fun res!431716 () Bool)

(assert (=> b!664011 (=> (not res!431716) (not e!380946))))

(declare-fun arrayContainsKey!0 (array!38965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664011 (= res!431716 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664012 () Bool)

(declare-fun res!431726 () Bool)

(assert (=> b!664012 (=> (not res!431726) (not e!380946))))

(declare-fun e!380952 () Bool)

(assert (=> b!664012 (= res!431726 e!380952)))

(declare-fun res!431719 () Bool)

(assert (=> b!664012 (=> res!431719 e!380952)))

(assert (=> b!664012 (= res!431719 e!380950)))

(declare-fun res!431722 () Bool)

(assert (=> b!664012 (=> (not res!431722) (not e!380950))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664012 (= res!431722 (bvsgt from!3004 i!1382))))

(declare-fun b!664013 () Bool)

(declare-fun e!380947 () Bool)

(assert (=> b!664013 (= e!380952 e!380947)))

(declare-fun res!431724 () Bool)

(assert (=> b!664013 (=> (not res!431724) (not e!380947))))

(assert (=> b!664013 (= res!431724 (bvsle from!3004 i!1382))))

(declare-fun b!664014 () Bool)

(declare-fun res!431715 () Bool)

(assert (=> b!664014 (=> (not res!431715) (not e!380946))))

(assert (=> b!664014 (= res!431715 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19036 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664015 () Bool)

(declare-datatypes ((Unit!23089 0))(
  ( (Unit!23090) )
))
(declare-fun e!380949 () Unit!23089)

(declare-fun lt!309483 () Unit!23089)

(assert (=> b!664015 (= e!380949 lt!309483)))

(declare-fun lt!309484 () Unit!23089)

(declare-fun lemmaListSubSeqRefl!0 (List!12620) Unit!23089)

(assert (=> b!664015 (= lt!309484 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!34 (List!12620 List!12620) Bool)

(assert (=> b!664015 (subseq!34 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38965 List!12620 List!12620 (_ BitVec 32)) Unit!23089)

(declare-fun $colon$colon!163 (List!12620 (_ BitVec 64)) List!12620)

(assert (=> b!664015 (= lt!309483 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!163 acc!681 (select (arr!18672 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38965 (_ BitVec 32) List!12620) Bool)

(assert (=> b!664015 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664016 () Bool)

(declare-fun res!431728 () Bool)

(assert (=> b!664016 (=> (not res!431728) (not e!380946))))

(assert (=> b!664016 (= res!431728 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19036 a!3626))))))

(declare-fun b!664017 () Bool)

(assert (=> b!664017 (= e!380947 (not (contains!3272 acc!681 k!2843)))))

(declare-fun b!664018 () Bool)

(declare-fun res!431727 () Bool)

(assert (=> b!664018 (=> (not res!431727) (not e!380946))))

(assert (=> b!664018 (= res!431727 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664019 () Bool)

(declare-fun res!431723 () Bool)

(assert (=> b!664019 (=> (not res!431723) (not e!380946))))

(declare-fun noDuplicate!546 (List!12620) Bool)

(assert (=> b!664019 (= res!431723 (noDuplicate!546 acc!681))))

(declare-fun b!664020 () Bool)

(declare-fun res!431721 () Bool)

(assert (=> b!664020 (=> (not res!431721) (not e!380946))))

(assert (=> b!664020 (= res!431721 (not (contains!3272 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664021 () Bool)

(declare-fun e!380948 () Unit!23089)

(declare-fun Unit!23091 () Unit!23089)

(assert (=> b!664021 (= e!380948 Unit!23091)))

(declare-fun lt!309486 () Unit!23089)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38965 (_ BitVec 64) (_ BitVec 32)) Unit!23089)

(assert (=> b!664021 (= lt!309486 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664021 false))

(declare-fun b!664022 () Bool)

(assert (=> b!664022 (= e!380946 (not true))))

(declare-fun lt!309485 () Unit!23089)

(assert (=> b!664022 (= lt!309485 e!380949)))

(declare-fun c!76517 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664022 (= c!76517 (validKeyInArray!0 (select (arr!18672 a!3626) from!3004)))))

(declare-fun lt!309487 () Unit!23089)

(assert (=> b!664022 (= lt!309487 e!380948)))

(declare-fun c!76516 () Bool)

(assert (=> b!664022 (= c!76516 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664022 (arrayContainsKey!0 (array!38966 (store (arr!18672 a!3626) i!1382 k!2843) (size!19036 a!3626)) k!2843 from!3004)))

(declare-fun b!664023 () Bool)

(declare-fun res!431720 () Bool)

(assert (=> b!664023 (=> (not res!431720) (not e!380946))))

(assert (=> b!664023 (= res!431720 (not (contains!3272 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664024 () Bool)

(declare-fun Unit!23092 () Unit!23089)

(assert (=> b!664024 (= e!380948 Unit!23092)))

(declare-fun b!664025 () Bool)

(declare-fun res!431718 () Bool)

(assert (=> b!664025 (=> (not res!431718) (not e!380946))))

(assert (=> b!664025 (= res!431718 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12617))))

(declare-fun b!664026 () Bool)

(declare-fun res!431725 () Bool)

(assert (=> b!664026 (=> (not res!431725) (not e!380946))))

(assert (=> b!664026 (= res!431725 (validKeyInArray!0 k!2843))))

(declare-fun b!664027 () Bool)

(declare-fun Unit!23093 () Unit!23089)

(assert (=> b!664027 (= e!380949 Unit!23093)))

(assert (= (and start!59980 res!431717) b!664019))

(assert (= (and b!664019 res!431723) b!664023))

(assert (= (and b!664023 res!431720) b!664020))

(assert (= (and b!664020 res!431721) b!664012))

(assert (= (and b!664012 res!431722) b!664010))

(assert (= (and b!664012 (not res!431719)) b!664013))

(assert (= (and b!664013 res!431724) b!664017))

(assert (= (and b!664012 res!431726) b!664025))

(assert (= (and b!664025 res!431718) b!664018))

(assert (= (and b!664018 res!431727) b!664016))

(assert (= (and b!664016 res!431728) b!664026))

(assert (= (and b!664026 res!431725) b!664011))

(assert (= (and b!664011 res!431716) b!664014))

(assert (= (and b!664014 res!431715) b!664022))

(assert (= (and b!664022 c!76516) b!664021))

(assert (= (and b!664022 (not c!76516)) b!664024))

(assert (= (and b!664022 c!76517) b!664015))

(assert (= (and b!664022 (not c!76517)) b!664027))

(declare-fun m!635967 () Bool)

(assert (=> b!664025 m!635967))

(declare-fun m!635969 () Bool)

(assert (=> b!664021 m!635969))

(declare-fun m!635971 () Bool)

(assert (=> b!664011 m!635971))

(declare-fun m!635973 () Bool)

(assert (=> b!664023 m!635973))

(declare-fun m!635975 () Bool)

(assert (=> b!664020 m!635975))

(declare-fun m!635977 () Bool)

(assert (=> b!664015 m!635977))

(declare-fun m!635979 () Bool)

(assert (=> b!664015 m!635979))

(declare-fun m!635981 () Bool)

(assert (=> b!664015 m!635981))

(declare-fun m!635983 () Bool)

(assert (=> b!664015 m!635983))

(assert (=> b!664015 m!635979))

(assert (=> b!664015 m!635981))

(declare-fun m!635985 () Bool)

(assert (=> b!664015 m!635985))

(declare-fun m!635987 () Bool)

(assert (=> b!664015 m!635987))

(declare-fun m!635989 () Bool)

(assert (=> start!59980 m!635989))

(declare-fun m!635991 () Bool)

(assert (=> b!664018 m!635991))

(declare-fun m!635993 () Bool)

(assert (=> b!664010 m!635993))

(assert (=> b!664022 m!635979))

(declare-fun m!635995 () Bool)

(assert (=> b!664022 m!635995))

(declare-fun m!635997 () Bool)

(assert (=> b!664022 m!635997))

(assert (=> b!664022 m!635979))

(declare-fun m!635999 () Bool)

(assert (=> b!664022 m!635999))

(declare-fun m!636001 () Bool)

(assert (=> b!664022 m!636001))

(declare-fun m!636003 () Bool)

(assert (=> b!664019 m!636003))

(assert (=> b!664017 m!635993))

(declare-fun m!636005 () Bool)

(assert (=> b!664026 m!636005))

(push 1)

(assert (not b!664026))

(assert (not b!664015))

(assert (not b!664018))

(assert (not b!664025))

(assert (not b!664017))

(assert (not b!664023))

(assert (not start!59980))

(assert (not b!664011))

(assert (not b!664010))

(assert (not b!664020))

(assert (not b!664021))

(assert (not b!664022))

(assert (not b!664019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

