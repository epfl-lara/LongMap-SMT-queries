; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61324 () Bool)

(assert start!61324)

(declare-fun b!686495 () Bool)

(declare-fun res!451567 () Bool)

(declare-fun e!390981 () Bool)

(assert (=> b!686495 (=> (not res!451567) (not e!390981))))

(declare-datatypes ((List!12944 0))(
  ( (Nil!12941) (Cons!12940 (h!13988 (_ BitVec 64)) (t!19191 List!12944)) )
))
(declare-fun acc!681 () List!12944)

(declare-fun contains!3596 (List!12944 (_ BitVec 64)) Bool)

(assert (=> b!686495 (= res!451567 (not (contains!3596 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686496 () Bool)

(declare-datatypes ((Unit!24151 0))(
  ( (Unit!24152) )
))
(declare-fun e!390983 () Unit!24151)

(declare-fun lt!315058 () Unit!24151)

(assert (=> b!686496 (= e!390983 lt!315058)))

(declare-fun lt!315061 () Unit!24151)

(declare-fun lemmaListSubSeqRefl!0 (List!12944) Unit!24151)

(assert (=> b!686496 (= lt!315061 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!205 (List!12944 List!12944) Bool)

(assert (=> b!686496 (subseq!205 acc!681 acc!681)))

(declare-datatypes ((array!39646 0))(
  ( (array!39647 (arr!18996 (Array (_ BitVec 32) (_ BitVec 64))) (size!19371 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39646)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39646 List!12944 List!12944 (_ BitVec 32)) Unit!24151)

(declare-fun $colon$colon!367 (List!12944 (_ BitVec 64)) List!12944)

(assert (=> b!686496 (= lt!315058 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!367 acc!681 (select (arr!18996 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39646 (_ BitVec 32) List!12944) Bool)

(assert (=> b!686496 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686497 () Bool)

(declare-fun res!451565 () Bool)

(assert (=> b!686497 (=> (not res!451565) (not e!390981))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686497 (= res!451565 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19371 a!3626))))))

(declare-fun b!686498 () Bool)

(assert (=> b!686498 (= e!390981 (not true))))

(declare-fun lt!315062 () List!12944)

(assert (=> b!686498 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315062)))

(declare-fun lt!315060 () Unit!24151)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39646 (_ BitVec 64) (_ BitVec 32) List!12944 List!12944) Unit!24151)

(assert (=> b!686498 (= lt!315060 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315062))))

(declare-fun -!169 (List!12944 (_ BitVec 64)) List!12944)

(assert (=> b!686498 (= (-!169 lt!315062 k!2843) acc!681)))

(assert (=> b!686498 (= lt!315062 ($colon$colon!367 acc!681 k!2843))))

(declare-fun lt!315063 () Unit!24151)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12944) Unit!24151)

(assert (=> b!686498 (= lt!315063 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!686498 (subseq!205 acc!681 acc!681)))

(declare-fun lt!315056 () Unit!24151)

(assert (=> b!686498 (= lt!315056 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686498 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315057 () Unit!24151)

(assert (=> b!686498 (= lt!315057 e!390983)))

(declare-fun c!77836 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686498 (= c!77836 (validKeyInArray!0 (select (arr!18996 a!3626) from!3004)))))

(declare-fun lt!315059 () Unit!24151)

(declare-fun e!390982 () Unit!24151)

(assert (=> b!686498 (= lt!315059 e!390982)))

(declare-fun c!77837 () Bool)

(declare-fun arrayContainsKey!0 (array!39646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686498 (= c!77837 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686498 (arrayContainsKey!0 (array!39647 (store (arr!18996 a!3626) i!1382 k!2843) (size!19371 a!3626)) k!2843 from!3004)))

(declare-fun res!451563 () Bool)

(assert (=> start!61324 (=> (not res!451563) (not e!390981))))

(assert (=> start!61324 (= res!451563 (and (bvslt (size!19371 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19371 a!3626))))))

(assert (=> start!61324 e!390981))

(assert (=> start!61324 true))

(declare-fun array_inv!14855 (array!39646) Bool)

(assert (=> start!61324 (array_inv!14855 a!3626)))

(declare-fun b!686499 () Bool)

(declare-fun res!451573 () Bool)

(assert (=> b!686499 (=> (not res!451573) (not e!390981))))

(assert (=> b!686499 (= res!451573 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686500 () Bool)

(declare-fun Unit!24153 () Unit!24151)

(assert (=> b!686500 (= e!390982 Unit!24153)))

(declare-fun b!686501 () Bool)

(declare-fun res!451564 () Bool)

(assert (=> b!686501 (=> (not res!451564) (not e!390981))))

(declare-fun noDuplicate!870 (List!12944) Bool)

(assert (=> b!686501 (= res!451564 (noDuplicate!870 acc!681))))

(declare-fun b!686502 () Bool)

(declare-fun Unit!24154 () Unit!24151)

(assert (=> b!686502 (= e!390983 Unit!24154)))

(declare-fun b!686503 () Bool)

(declare-fun res!451571 () Bool)

(assert (=> b!686503 (=> (not res!451571) (not e!390981))))

(assert (=> b!686503 (= res!451571 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12941))))

(declare-fun b!686504 () Bool)

(declare-fun res!451572 () Bool)

(assert (=> b!686504 (=> (not res!451572) (not e!390981))))

(assert (=> b!686504 (= res!451572 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686505 () Bool)

(declare-fun e!390984 () Bool)

(declare-fun e!390987 () Bool)

(assert (=> b!686505 (= e!390984 e!390987)))

(declare-fun res!451560 () Bool)

(assert (=> b!686505 (=> (not res!451560) (not e!390987))))

(assert (=> b!686505 (= res!451560 (bvsle from!3004 i!1382))))

(declare-fun b!686506 () Bool)

(declare-fun res!451569 () Bool)

(assert (=> b!686506 (=> (not res!451569) (not e!390981))))

(assert (=> b!686506 (= res!451569 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19371 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686507 () Bool)

(declare-fun Unit!24155 () Unit!24151)

(assert (=> b!686507 (= e!390982 Unit!24155)))

(declare-fun lt!315064 () Unit!24151)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39646 (_ BitVec 64) (_ BitVec 32)) Unit!24151)

(assert (=> b!686507 (= lt!315064 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!686507 false))

(declare-fun b!686508 () Bool)

(declare-fun res!451562 () Bool)

(assert (=> b!686508 (=> (not res!451562) (not e!390981))))

(assert (=> b!686508 (= res!451562 e!390984)))

(declare-fun res!451570 () Bool)

(assert (=> b!686508 (=> res!451570 e!390984)))

(declare-fun e!390986 () Bool)

(assert (=> b!686508 (= res!451570 e!390986)))

(declare-fun res!451568 () Bool)

(assert (=> b!686508 (=> (not res!451568) (not e!390986))))

(assert (=> b!686508 (= res!451568 (bvsgt from!3004 i!1382))))

(declare-fun b!686509 () Bool)

(declare-fun res!451566 () Bool)

(assert (=> b!686509 (=> (not res!451566) (not e!390981))))

(assert (=> b!686509 (= res!451566 (not (contains!3596 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686510 () Bool)

(assert (=> b!686510 (= e!390986 (contains!3596 acc!681 k!2843))))

(declare-fun b!686511 () Bool)

(assert (=> b!686511 (= e!390987 (not (contains!3596 acc!681 k!2843)))))

(declare-fun b!686512 () Bool)

(declare-fun res!451561 () Bool)

(assert (=> b!686512 (=> (not res!451561) (not e!390981))))

(assert (=> b!686512 (= res!451561 (validKeyInArray!0 k!2843))))

(assert (= (and start!61324 res!451563) b!686501))

(assert (= (and b!686501 res!451564) b!686495))

(assert (= (and b!686495 res!451567) b!686509))

(assert (= (and b!686509 res!451566) b!686508))

(assert (= (and b!686508 res!451568) b!686510))

(assert (= (and b!686508 (not res!451570)) b!686505))

(assert (= (and b!686505 res!451560) b!686511))

(assert (= (and b!686508 res!451562) b!686503))

(assert (= (and b!686503 res!451571) b!686504))

(assert (= (and b!686504 res!451572) b!686497))

(assert (= (and b!686497 res!451565) b!686512))

(assert (= (and b!686512 res!451561) b!686499))

(assert (= (and b!686499 res!451573) b!686506))

(assert (= (and b!686506 res!451569) b!686498))

(assert (= (and b!686498 c!77837) b!686507))

(assert (= (and b!686498 (not c!77837)) b!686500))

(assert (= (and b!686498 c!77836) b!686496))

(assert (= (and b!686498 (not c!77836)) b!686502))

(declare-fun m!651077 () Bool)

(assert (=> b!686512 m!651077))

(declare-fun m!651079 () Bool)

(assert (=> b!686501 m!651079))

(declare-fun m!651081 () Bool)

(assert (=> b!686496 m!651081))

(declare-fun m!651083 () Bool)

(assert (=> b!686496 m!651083))

(declare-fun m!651085 () Bool)

(assert (=> b!686496 m!651085))

(declare-fun m!651087 () Bool)

(assert (=> b!686496 m!651087))

(assert (=> b!686496 m!651083))

(assert (=> b!686496 m!651085))

(declare-fun m!651089 () Bool)

(assert (=> b!686496 m!651089))

(declare-fun m!651091 () Bool)

(assert (=> b!686496 m!651091))

(declare-fun m!651093 () Bool)

(assert (=> b!686507 m!651093))

(declare-fun m!651095 () Bool)

(assert (=> b!686504 m!651095))

(declare-fun m!651097 () Bool)

(assert (=> b!686499 m!651097))

(declare-fun m!651099 () Bool)

(assert (=> start!61324 m!651099))

(declare-fun m!651101 () Bool)

(assert (=> b!686495 m!651101))

(declare-fun m!651103 () Bool)

(assert (=> b!686510 m!651103))

(assert (=> b!686511 m!651103))

(declare-fun m!651105 () Bool)

(assert (=> b!686498 m!651105))

(assert (=> b!686498 m!651081))

(assert (=> b!686498 m!651083))

(declare-fun m!651107 () Bool)

(assert (=> b!686498 m!651107))

(declare-fun m!651109 () Bool)

(assert (=> b!686498 m!651109))

(declare-fun m!651111 () Bool)

(assert (=> b!686498 m!651111))

(assert (=> b!686498 m!651089))

(declare-fun m!651113 () Bool)

(assert (=> b!686498 m!651113))

(declare-fun m!651115 () Bool)

(assert (=> b!686498 m!651115))

(declare-fun m!651117 () Bool)

(assert (=> b!686498 m!651117))

(assert (=> b!686498 m!651083))

(declare-fun m!651119 () Bool)

(assert (=> b!686498 m!651119))

(declare-fun m!651121 () Bool)

(assert (=> b!686498 m!651121))

(assert (=> b!686498 m!651091))

(declare-fun m!651123 () Bool)

(assert (=> b!686503 m!651123))

(declare-fun m!651125 () Bool)

(assert (=> b!686509 m!651125))

(push 1)

(assert (not start!61324))

(assert (not b!686501))

(assert (not b!686509))

(assert (not b!686503))

(assert (not b!686496))

(assert (not b!686495))

(assert (not b!686507))

(assert (not b!686510))

(assert (not b!686512))

(assert (not b!686511))

(assert (not b!686499))

(assert (not b!686498))

(assert (not b!686504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

