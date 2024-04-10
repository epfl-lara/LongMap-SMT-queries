; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59936 () Bool)

(assert start!59936)

(declare-fun b!664178 () Bool)

(declare-fun res!431914 () Bool)

(declare-fun e!380957 () Bool)

(assert (=> b!664178 (=> (not res!431914) (not e!380957))))

(declare-datatypes ((List!12725 0))(
  ( (Nil!12722) (Cons!12721 (h!13766 (_ BitVec 64)) (t!18953 List!12725)) )
))
(declare-fun acc!681 () List!12725)

(declare-fun contains!3302 (List!12725 (_ BitVec 64)) Bool)

(assert (=> b!664178 (= res!431914 (not (contains!3302 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664179 () Bool)

(declare-fun res!431913 () Bool)

(declare-fun e!380961 () Bool)

(assert (=> b!664179 (=> res!431913 e!380961)))

(declare-fun lt!309520 () Bool)

(assert (=> b!664179 (= res!431913 lt!309520)))

(declare-fun b!664180 () Bool)

(declare-fun res!431930 () Bool)

(assert (=> b!664180 (=> (not res!431930) (not e!380957))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38983 0))(
  ( (array!38984 (arr!18684 (Array (_ BitVec 32) (_ BitVec 64))) (size!19048 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38983)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664180 (= res!431930 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19048 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664181 () Bool)

(assert (=> b!664181 (= e!380957 (not e!380961))))

(declare-fun res!431926 () Bool)

(assert (=> b!664181 (=> res!431926 e!380961)))

(assert (=> b!664181 (= res!431926 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!309521 () List!12725)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun -!39 (List!12725 (_ BitVec 64)) List!12725)

(assert (=> b!664181 (= (-!39 lt!309521 k!2843) acc!681)))

(declare-fun $colon$colon!173 (List!12725 (_ BitVec 64)) List!12725)

(assert (=> b!664181 (= lt!309521 ($colon$colon!173 acc!681 k!2843))))

(declare-datatypes ((Unit!23145 0))(
  ( (Unit!23146) )
))
(declare-fun lt!309516 () Unit!23145)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12725) Unit!23145)

(assert (=> b!664181 (= lt!309516 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!41 (List!12725 List!12725) Bool)

(assert (=> b!664181 (subseq!41 acc!681 acc!681)))

(declare-fun lt!309519 () Unit!23145)

(declare-fun lemmaListSubSeqRefl!0 (List!12725) Unit!23145)

(assert (=> b!664181 (= lt!309519 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!38983 (_ BitVec 32) List!12725) Bool)

(assert (=> b!664181 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309514 () Unit!23145)

(declare-fun e!380958 () Unit!23145)

(assert (=> b!664181 (= lt!309514 e!380958)))

(declare-fun c!76501 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664181 (= c!76501 (validKeyInArray!0 (select (arr!18684 a!3626) from!3004)))))

(declare-fun lt!309517 () Unit!23145)

(declare-fun e!380956 () Unit!23145)

(assert (=> b!664181 (= lt!309517 e!380956)))

(declare-fun c!76502 () Bool)

(assert (=> b!664181 (= c!76502 lt!309520)))

(declare-fun arrayContainsKey!0 (array!38983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664181 (= lt!309520 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664181 (arrayContainsKey!0 (array!38984 (store (arr!18684 a!3626) i!1382 k!2843) (size!19048 a!3626)) k!2843 from!3004)))

(declare-fun b!664182 () Bool)

(declare-fun res!431920 () Bool)

(assert (=> b!664182 (=> res!431920 e!380961)))

(assert (=> b!664182 (= res!431920 (contains!3302 acc!681 k!2843))))

(declare-fun b!664183 () Bool)

(declare-fun res!431923 () Bool)

(assert (=> b!664183 (=> res!431923 e!380961)))

(assert (=> b!664183 (= res!431923 (contains!3302 lt!309521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664184 () Bool)

(declare-fun e!380954 () Bool)

(assert (=> b!664184 (= e!380954 (contains!3302 acc!681 k!2843))))

(declare-fun b!664186 () Bool)

(declare-fun Unit!23147 () Unit!23145)

(assert (=> b!664186 (= e!380958 Unit!23147)))

(declare-fun b!664187 () Bool)

(declare-fun res!431922 () Bool)

(assert (=> b!664187 (=> (not res!431922) (not e!380957))))

(declare-fun e!380955 () Bool)

(assert (=> b!664187 (= res!431922 e!380955)))

(declare-fun res!431911 () Bool)

(assert (=> b!664187 (=> res!431911 e!380955)))

(assert (=> b!664187 (= res!431911 e!380954)))

(declare-fun res!431918 () Bool)

(assert (=> b!664187 (=> (not res!431918) (not e!380954))))

(assert (=> b!664187 (= res!431918 (bvsgt from!3004 i!1382))))

(declare-fun b!664188 () Bool)

(declare-fun lt!309515 () Unit!23145)

(assert (=> b!664188 (= e!380958 lt!309515)))

(declare-fun lt!309522 () Unit!23145)

(assert (=> b!664188 (= lt!309522 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664188 (subseq!41 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38983 List!12725 List!12725 (_ BitVec 32)) Unit!23145)

(assert (=> b!664188 (= lt!309515 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!173 acc!681 (select (arr!18684 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664188 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664189 () Bool)

(declare-fun res!431910 () Bool)

(assert (=> b!664189 (=> (not res!431910) (not e!380957))))

(assert (=> b!664189 (= res!431910 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19048 a!3626))))))

(declare-fun b!664190 () Bool)

(declare-fun res!431924 () Bool)

(assert (=> b!664190 (=> res!431924 e!380961)))

(declare-fun noDuplicate!549 (List!12725) Bool)

(assert (=> b!664190 (= res!431924 (not (noDuplicate!549 lt!309521)))))

(declare-fun b!664191 () Bool)

(declare-fun Unit!23148 () Unit!23145)

(assert (=> b!664191 (= e!380956 Unit!23148)))

(declare-fun b!664192 () Bool)

(declare-fun res!431915 () Bool)

(assert (=> b!664192 (=> (not res!431915) (not e!380957))))

(assert (=> b!664192 (= res!431915 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12722))))

(declare-fun b!664193 () Bool)

(assert (=> b!664193 (= e!380961 true)))

(declare-fun lt!309518 () Bool)

(assert (=> b!664193 (= lt!309518 (contains!3302 lt!309521 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664194 () Bool)

(declare-fun res!431928 () Bool)

(assert (=> b!664194 (=> (not res!431928) (not e!380957))))

(assert (=> b!664194 (= res!431928 (validKeyInArray!0 k!2843))))

(declare-fun res!431912 () Bool)

(assert (=> start!59936 (=> (not res!431912) (not e!380957))))

(assert (=> start!59936 (= res!431912 (and (bvslt (size!19048 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19048 a!3626))))))

(assert (=> start!59936 e!380957))

(assert (=> start!59936 true))

(declare-fun array_inv!14480 (array!38983) Bool)

(assert (=> start!59936 (array_inv!14480 a!3626)))

(declare-fun b!664185 () Bool)

(declare-fun res!431919 () Bool)

(assert (=> b!664185 (=> res!431919 e!380961)))

(assert (=> b!664185 (= res!431919 (not (subseq!41 acc!681 lt!309521)))))

(declare-fun b!664195 () Bool)

(declare-fun res!431929 () Bool)

(assert (=> b!664195 (=> (not res!431929) (not e!380957))))

(assert (=> b!664195 (= res!431929 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664196 () Bool)

(declare-fun e!380960 () Bool)

(assert (=> b!664196 (= e!380955 e!380960)))

(declare-fun res!431916 () Bool)

(assert (=> b!664196 (=> (not res!431916) (not e!380960))))

(assert (=> b!664196 (= res!431916 (bvsle from!3004 i!1382))))

(declare-fun b!664197 () Bool)

(declare-fun Unit!23149 () Unit!23145)

(assert (=> b!664197 (= e!380956 Unit!23149)))

(declare-fun lt!309523 () Unit!23145)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38983 (_ BitVec 64) (_ BitVec 32)) Unit!23145)

(assert (=> b!664197 (= lt!309523 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664197 false))

(declare-fun b!664198 () Bool)

(declare-fun res!431917 () Bool)

(assert (=> b!664198 (=> res!431917 e!380961)))

(assert (=> b!664198 (= res!431917 (not (contains!3302 lt!309521 k!2843)))))

(declare-fun b!664199 () Bool)

(assert (=> b!664199 (= e!380960 (not (contains!3302 acc!681 k!2843)))))

(declare-fun b!664200 () Bool)

(declare-fun res!431921 () Bool)

(assert (=> b!664200 (=> (not res!431921) (not e!380957))))

(assert (=> b!664200 (= res!431921 (not (contains!3302 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664201 () Bool)

(declare-fun res!431927 () Bool)

(assert (=> b!664201 (=> (not res!431927) (not e!380957))))

(assert (=> b!664201 (= res!431927 (noDuplicate!549 acc!681))))

(declare-fun b!664202 () Bool)

(declare-fun res!431925 () Bool)

(assert (=> b!664202 (=> (not res!431925) (not e!380957))))

(assert (=> b!664202 (= res!431925 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!59936 res!431912) b!664201))

(assert (= (and b!664201 res!431927) b!664178))

(assert (= (and b!664178 res!431914) b!664200))

(assert (= (and b!664200 res!431921) b!664187))

(assert (= (and b!664187 res!431918) b!664184))

(assert (= (and b!664187 (not res!431911)) b!664196))

(assert (= (and b!664196 res!431916) b!664199))

(assert (= (and b!664187 res!431922) b!664192))

(assert (= (and b!664192 res!431915) b!664202))

(assert (= (and b!664202 res!431925) b!664189))

(assert (= (and b!664189 res!431910) b!664194))

(assert (= (and b!664194 res!431928) b!664195))

(assert (= (and b!664195 res!431929) b!664180))

(assert (= (and b!664180 res!431930) b!664181))

(assert (= (and b!664181 c!76502) b!664197))

(assert (= (and b!664181 (not c!76502)) b!664191))

(assert (= (and b!664181 c!76501) b!664188))

(assert (= (and b!664181 (not c!76501)) b!664186))

(assert (= (and b!664181 (not res!431926)) b!664190))

(assert (= (and b!664190 (not res!431924)) b!664179))

(assert (= (and b!664179 (not res!431913)) b!664182))

(assert (= (and b!664182 (not res!431920)) b!664185))

(assert (= (and b!664185 (not res!431919)) b!664198))

(assert (= (and b!664198 (not res!431917)) b!664183))

(assert (= (and b!664183 (not res!431923)) b!664193))

(declare-fun m!635549 () Bool)

(assert (=> b!664182 m!635549))

(declare-fun m!635551 () Bool)

(assert (=> b!664194 m!635551))

(declare-fun m!635553 () Bool)

(assert (=> b!664185 m!635553))

(assert (=> b!664199 m!635549))

(declare-fun m!635555 () Bool)

(assert (=> b!664193 m!635555))

(declare-fun m!635557 () Bool)

(assert (=> b!664195 m!635557))

(declare-fun m!635559 () Bool)

(assert (=> b!664178 m!635559))

(declare-fun m!635561 () Bool)

(assert (=> b!664201 m!635561))

(declare-fun m!635563 () Bool)

(assert (=> b!664183 m!635563))

(declare-fun m!635565 () Bool)

(assert (=> b!664200 m!635565))

(declare-fun m!635567 () Bool)

(assert (=> b!664192 m!635567))

(assert (=> b!664184 m!635549))

(declare-fun m!635569 () Bool)

(assert (=> b!664188 m!635569))

(declare-fun m!635571 () Bool)

(assert (=> b!664188 m!635571))

(declare-fun m!635573 () Bool)

(assert (=> b!664188 m!635573))

(declare-fun m!635575 () Bool)

(assert (=> b!664188 m!635575))

(assert (=> b!664188 m!635571))

(assert (=> b!664188 m!635573))

(declare-fun m!635577 () Bool)

(assert (=> b!664188 m!635577))

(declare-fun m!635579 () Bool)

(assert (=> b!664188 m!635579))

(declare-fun m!635581 () Bool)

(assert (=> b!664198 m!635581))

(declare-fun m!635583 () Bool)

(assert (=> b!664190 m!635583))

(declare-fun m!635585 () Bool)

(assert (=> b!664197 m!635585))

(declare-fun m!635587 () Bool)

(assert (=> b!664202 m!635587))

(declare-fun m!635589 () Bool)

(assert (=> start!59936 m!635589))

(assert (=> b!664181 m!635571))

(declare-fun m!635591 () Bool)

(assert (=> b!664181 m!635591))

(declare-fun m!635593 () Bool)

(assert (=> b!664181 m!635593))

(assert (=> b!664181 m!635577))

(declare-fun m!635595 () Bool)

(assert (=> b!664181 m!635595))

(declare-fun m!635597 () Bool)

(assert (=> b!664181 m!635597))

(assert (=> b!664181 m!635571))

(declare-fun m!635599 () Bool)

(assert (=> b!664181 m!635599))

(assert (=> b!664181 m!635569))

(declare-fun m!635601 () Bool)

(assert (=> b!664181 m!635601))

(declare-fun m!635603 () Bool)

(assert (=> b!664181 m!635603))

(assert (=> b!664181 m!635579))

(push 1)

(assert (not b!664182))

(assert (not b!664188))

(assert (not b!664178))

(assert (not start!59936))

(assert (not b!664185))

(assert (not b!664184))

(assert (not b!664195))

(assert (not b!664194))

(assert (not b!664198))

(assert (not b!664197))

(assert (not b!664192))

(assert (not b!664190))

(assert (not b!664202))

(assert (not b!664181))

(assert (not b!664200))

(assert (not b!664193))

(assert (not b!664199))

(assert (not b!664183))

(assert (not b!664201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

