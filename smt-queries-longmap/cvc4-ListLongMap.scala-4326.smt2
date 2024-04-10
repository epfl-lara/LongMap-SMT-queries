; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59988 () Bool)

(assert start!59988)

(declare-fun b!666128 () Bool)

(declare-fun res!433551 () Bool)

(declare-fun e!381579 () Bool)

(assert (=> b!666128 (=> (not res!433551) (not e!381579))))

(declare-datatypes ((array!39035 0))(
  ( (array!39036 (arr!18710 (Array (_ BitVec 32) (_ BitVec 64))) (size!19074 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39035)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12751 0))(
  ( (Nil!12748) (Cons!12747 (h!13792 (_ BitVec 64)) (t!18979 List!12751)) )
))
(declare-fun acc!681 () List!12751)

(declare-fun arrayNoDuplicates!0 (array!39035 (_ BitVec 32) List!12751) Bool)

(assert (=> b!666128 (= res!433551 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666129 () Bool)

(declare-fun res!433563 () Bool)

(declare-fun e!381581 () Bool)

(assert (=> b!666129 (=> res!433563 e!381581)))

(declare-fun lt!310299 () List!12751)

(declare-fun subseq!67 (List!12751 List!12751) Bool)

(assert (=> b!666129 (= res!433563 (not (subseq!67 acc!681 lt!310299)))))

(declare-fun b!666130 () Bool)

(declare-fun e!381583 () Bool)

(declare-fun e!381578 () Bool)

(assert (=> b!666130 (= e!381583 e!381578)))

(declare-fun res!433561 () Bool)

(assert (=> b!666130 (=> (not res!433561) (not e!381578))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666130 (= res!433561 (bvsle from!3004 i!1382))))

(declare-fun b!666131 () Bool)

(declare-fun res!433560 () Bool)

(assert (=> b!666131 (=> res!433560 e!381581)))

(declare-fun noDuplicate!575 (List!12751) Bool)

(assert (=> b!666131 (= res!433560 (not (noDuplicate!575 lt!310299)))))

(declare-fun b!666132 () Bool)

(declare-datatypes ((Unit!23275 0))(
  ( (Unit!23276) )
))
(declare-fun e!381580 () Unit!23275)

(declare-fun Unit!23277 () Unit!23275)

(assert (=> b!666132 (= e!381580 Unit!23277)))

(declare-fun b!666133 () Bool)

(declare-fun res!433568 () Bool)

(assert (=> b!666133 (=> (not res!433568) (not e!381579))))

(declare-fun contains!3328 (List!12751 (_ BitVec 64)) Bool)

(assert (=> b!666133 (= res!433568 (not (contains!3328 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666134 () Bool)

(declare-fun res!433562 () Bool)

(assert (=> b!666134 (=> (not res!433562) (not e!381579))))

(assert (=> b!666134 (= res!433562 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12748))))

(declare-fun b!666135 () Bool)

(declare-fun e!381584 () Unit!23275)

(declare-fun Unit!23278 () Unit!23275)

(assert (=> b!666135 (= e!381584 Unit!23278)))

(declare-fun b!666136 () Bool)

(declare-fun res!433548 () Bool)

(assert (=> b!666136 (=> res!433548 e!381581)))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!666136 (= res!433548 (contains!3328 acc!681 k!2843))))

(declare-fun b!666137 () Bool)

(declare-fun res!433556 () Bool)

(assert (=> b!666137 (=> res!433556 e!381581)))

(assert (=> b!666137 (= res!433556 (contains!3328 lt!310299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666138 () Bool)

(declare-fun res!433549 () Bool)

(assert (=> b!666138 (=> res!433549 e!381581)))

(declare-fun lt!310300 () Bool)

(assert (=> b!666138 (= res!433549 lt!310300)))

(declare-fun b!666139 () Bool)

(declare-fun res!433565 () Bool)

(assert (=> b!666139 (=> (not res!433565) (not e!381579))))

(assert (=> b!666139 (= res!433565 (noDuplicate!575 acc!681))))

(declare-fun b!666140 () Bool)

(declare-fun res!433559 () Bool)

(assert (=> b!666140 (=> (not res!433559) (not e!381579))))

(assert (=> b!666140 (= res!433559 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19074 a!3626))))))

(declare-fun b!666141 () Bool)

(declare-fun res!433567 () Bool)

(assert (=> b!666141 (=> (not res!433567) (not e!381579))))

(declare-fun arrayContainsKey!0 (array!39035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666141 (= res!433567 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666142 () Bool)

(declare-fun e!381582 () Bool)

(assert (=> b!666142 (= e!381582 (contains!3328 acc!681 k!2843))))

(declare-fun b!666143 () Bool)

(declare-fun lt!310303 () Unit!23275)

(assert (=> b!666143 (= e!381584 lt!310303)))

(declare-fun lt!310302 () Unit!23275)

(declare-fun lemmaListSubSeqRefl!0 (List!12751) Unit!23275)

(assert (=> b!666143 (= lt!310302 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666143 (subseq!67 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39035 List!12751 List!12751 (_ BitVec 32)) Unit!23275)

(declare-fun $colon$colon!199 (List!12751 (_ BitVec 64)) List!12751)

(assert (=> b!666143 (= lt!310303 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!199 acc!681 (select (arr!18710 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666143 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666144 () Bool)

(declare-fun res!433558 () Bool)

(assert (=> b!666144 (=> (not res!433558) (not e!381579))))

(assert (=> b!666144 (= res!433558 (not (contains!3328 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666145 () Bool)

(declare-fun res!433557 () Bool)

(assert (=> b!666145 (=> res!433557 e!381581)))

(assert (=> b!666145 (= res!433557 (not (contains!3328 lt!310299 k!2843)))))

(declare-fun b!666146 () Bool)

(declare-fun Unit!23279 () Unit!23275)

(assert (=> b!666146 (= e!381580 Unit!23279)))

(declare-fun lt!310294 () Unit!23275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39035 (_ BitVec 64) (_ BitVec 32)) Unit!23275)

(assert (=> b!666146 (= lt!310294 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666146 false))

(declare-fun b!666147 () Bool)

(assert (=> b!666147 (= e!381581 true)))

(declare-fun lt!310297 () Bool)

(assert (=> b!666147 (= lt!310297 (contains!3328 lt!310299 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!433553 () Bool)

(assert (=> start!59988 (=> (not res!433553) (not e!381579))))

(assert (=> start!59988 (= res!433553 (and (bvslt (size!19074 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19074 a!3626))))))

(assert (=> start!59988 e!381579))

(assert (=> start!59988 true))

(declare-fun array_inv!14506 (array!39035) Bool)

(assert (=> start!59988 (array_inv!14506 a!3626)))

(declare-fun b!666148 () Bool)

(declare-fun res!433554 () Bool)

(assert (=> b!666148 (=> (not res!433554) (not e!381579))))

(assert (=> b!666148 (= res!433554 e!381583)))

(declare-fun res!433566 () Bool)

(assert (=> b!666148 (=> res!433566 e!381583)))

(assert (=> b!666148 (= res!433566 e!381582)))

(declare-fun res!433564 () Bool)

(assert (=> b!666148 (=> (not res!433564) (not e!381582))))

(assert (=> b!666148 (= res!433564 (bvsgt from!3004 i!1382))))

(declare-fun b!666149 () Bool)

(declare-fun res!433555 () Bool)

(assert (=> b!666149 (=> (not res!433555) (not e!381579))))

(assert (=> b!666149 (= res!433555 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19074 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666150 () Bool)

(assert (=> b!666150 (= e!381578 (not (contains!3328 acc!681 k!2843)))))

(declare-fun b!666151 () Bool)

(declare-fun res!433552 () Bool)

(assert (=> b!666151 (=> (not res!433552) (not e!381579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666151 (= res!433552 (validKeyInArray!0 k!2843))))

(declare-fun b!666152 () Bool)

(assert (=> b!666152 (= e!381579 (not e!381581))))

(declare-fun res!433550 () Bool)

(assert (=> b!666152 (=> res!433550 e!381581)))

(assert (=> b!666152 (= res!433550 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!65 (List!12751 (_ BitVec 64)) List!12751)

(assert (=> b!666152 (= (-!65 lt!310299 k!2843) acc!681)))

(assert (=> b!666152 (= lt!310299 ($colon$colon!199 acc!681 k!2843))))

(declare-fun lt!310301 () Unit!23275)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12751) Unit!23275)

(assert (=> b!666152 (= lt!310301 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!666152 (subseq!67 acc!681 acc!681)))

(declare-fun lt!310296 () Unit!23275)

(assert (=> b!666152 (= lt!310296 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666152 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310295 () Unit!23275)

(assert (=> b!666152 (= lt!310295 e!381584)))

(declare-fun c!76657 () Bool)

(assert (=> b!666152 (= c!76657 (validKeyInArray!0 (select (arr!18710 a!3626) from!3004)))))

(declare-fun lt!310298 () Unit!23275)

(assert (=> b!666152 (= lt!310298 e!381580)))

(declare-fun c!76658 () Bool)

(assert (=> b!666152 (= c!76658 lt!310300)))

(assert (=> b!666152 (= lt!310300 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666152 (arrayContainsKey!0 (array!39036 (store (arr!18710 a!3626) i!1382 k!2843) (size!19074 a!3626)) k!2843 from!3004)))

(assert (= (and start!59988 res!433553) b!666139))

(assert (= (and b!666139 res!433565) b!666133))

(assert (= (and b!666133 res!433568) b!666144))

(assert (= (and b!666144 res!433558) b!666148))

(assert (= (and b!666148 res!433564) b!666142))

(assert (= (and b!666148 (not res!433566)) b!666130))

(assert (= (and b!666130 res!433561) b!666150))

(assert (= (and b!666148 res!433554) b!666134))

(assert (= (and b!666134 res!433562) b!666128))

(assert (= (and b!666128 res!433551) b!666140))

(assert (= (and b!666140 res!433559) b!666151))

(assert (= (and b!666151 res!433552) b!666141))

(assert (= (and b!666141 res!433567) b!666149))

(assert (= (and b!666149 res!433555) b!666152))

(assert (= (and b!666152 c!76658) b!666146))

(assert (= (and b!666152 (not c!76658)) b!666132))

(assert (= (and b!666152 c!76657) b!666143))

(assert (= (and b!666152 (not c!76657)) b!666135))

(assert (= (and b!666152 (not res!433550)) b!666131))

(assert (= (and b!666131 (not res!433560)) b!666138))

(assert (= (and b!666138 (not res!433549)) b!666136))

(assert (= (and b!666136 (not res!433548)) b!666129))

(assert (= (and b!666129 (not res!433563)) b!666145))

(assert (= (and b!666145 (not res!433557)) b!666137))

(assert (= (and b!666137 (not res!433556)) b!666147))

(declare-fun m!637005 () Bool)

(assert (=> b!666129 m!637005))

(declare-fun m!637007 () Bool)

(assert (=> b!666134 m!637007))

(declare-fun m!637009 () Bool)

(assert (=> b!666143 m!637009))

(declare-fun m!637011 () Bool)

(assert (=> b!666143 m!637011))

(declare-fun m!637013 () Bool)

(assert (=> b!666143 m!637013))

(declare-fun m!637015 () Bool)

(assert (=> b!666143 m!637015))

(assert (=> b!666143 m!637011))

(assert (=> b!666143 m!637013))

(declare-fun m!637017 () Bool)

(assert (=> b!666143 m!637017))

(declare-fun m!637019 () Bool)

(assert (=> b!666143 m!637019))

(declare-fun m!637021 () Bool)

(assert (=> b!666145 m!637021))

(assert (=> b!666152 m!637009))

(assert (=> b!666152 m!637011))

(declare-fun m!637023 () Bool)

(assert (=> b!666152 m!637023))

(declare-fun m!637025 () Bool)

(assert (=> b!666152 m!637025))

(assert (=> b!666152 m!637017))

(declare-fun m!637027 () Bool)

(assert (=> b!666152 m!637027))

(declare-fun m!637029 () Bool)

(assert (=> b!666152 m!637029))

(assert (=> b!666152 m!637011))

(declare-fun m!637031 () Bool)

(assert (=> b!666152 m!637031))

(declare-fun m!637033 () Bool)

(assert (=> b!666152 m!637033))

(declare-fun m!637035 () Bool)

(assert (=> b!666152 m!637035))

(assert (=> b!666152 m!637019))

(declare-fun m!637037 () Bool)

(assert (=> b!666151 m!637037))

(declare-fun m!637039 () Bool)

(assert (=> b!666131 m!637039))

(declare-fun m!637041 () Bool)

(assert (=> b!666139 m!637041))

(declare-fun m!637043 () Bool)

(assert (=> b!666128 m!637043))

(declare-fun m!637045 () Bool)

(assert (=> start!59988 m!637045))

(declare-fun m!637047 () Bool)

(assert (=> b!666150 m!637047))

(declare-fun m!637049 () Bool)

(assert (=> b!666147 m!637049))

(declare-fun m!637051 () Bool)

(assert (=> b!666133 m!637051))

(assert (=> b!666136 m!637047))

(declare-fun m!637053 () Bool)

(assert (=> b!666146 m!637053))

(assert (=> b!666142 m!637047))

(declare-fun m!637055 () Bool)

(assert (=> b!666137 m!637055))

(declare-fun m!637057 () Bool)

(assert (=> b!666144 m!637057))

(declare-fun m!637059 () Bool)

(assert (=> b!666141 m!637059))

(push 1)

(assert (not b!666143))

(assert (not b!666144))

(assert (not b!666139))

(assert (not b!666134))

(assert (not b!666150))

(assert (not b!666136))

(assert (not b!666151))

(assert (not b!666131))

(assert (not b!666141))

(assert (not b!666145))

(assert (not b!666128))

(assert (not b!666152))

(assert (not b!666137))

(assert (not b!666147))

(assert (not b!666129))

(assert (not b!666133))

(assert (not b!666142))

(assert (not start!59988))

(assert (not b!666146))

(check-sat)

