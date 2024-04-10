; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59994 () Bool)

(assert start!59994)

(declare-fun b!666353 () Bool)

(declare-fun res!433755 () Bool)

(declare-fun e!381656 () Bool)

(assert (=> b!666353 (=> (not res!433755) (not e!381656))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39041 0))(
  ( (array!39042 (arr!18713 (Array (_ BitVec 32) (_ BitVec 64))) (size!19077 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39041)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!666353 (= res!433755 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19077 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!433746 () Bool)

(assert (=> start!59994 (=> (not res!433746) (not e!381656))))

(assert (=> start!59994 (= res!433746 (and (bvslt (size!19077 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19077 a!3626))))))

(assert (=> start!59994 e!381656))

(assert (=> start!59994 true))

(declare-fun array_inv!14509 (array!39041) Bool)

(assert (=> start!59994 (array_inv!14509 a!3626)))

(declare-fun b!666354 () Bool)

(declare-fun res!433741 () Bool)

(assert (=> b!666354 (=> (not res!433741) (not e!381656))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666354 (= res!433741 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666355 () Bool)

(declare-fun e!381657 () Bool)

(assert (=> b!666355 (= e!381656 (not e!381657))))

(declare-fun res!433747 () Bool)

(assert (=> b!666355 (=> res!433747 e!381657)))

(assert (=> b!666355 (= res!433747 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12754 0))(
  ( (Nil!12751) (Cons!12750 (h!13795 (_ BitVec 64)) (t!18982 List!12754)) )
))
(declare-fun lt!310391 () List!12754)

(declare-fun acc!681 () List!12754)

(declare-fun -!68 (List!12754 (_ BitVec 64)) List!12754)

(assert (=> b!666355 (= (-!68 lt!310391 k!2843) acc!681)))

(declare-fun $colon$colon!202 (List!12754 (_ BitVec 64)) List!12754)

(assert (=> b!666355 (= lt!310391 ($colon$colon!202 acc!681 k!2843))))

(declare-datatypes ((Unit!23290 0))(
  ( (Unit!23291) )
))
(declare-fun lt!310384 () Unit!23290)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12754) Unit!23290)

(assert (=> b!666355 (= lt!310384 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!70 (List!12754 List!12754) Bool)

(assert (=> b!666355 (subseq!70 acc!681 acc!681)))

(declare-fun lt!310386 () Unit!23290)

(declare-fun lemmaListSubSeqRefl!0 (List!12754) Unit!23290)

(assert (=> b!666355 (= lt!310386 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39041 (_ BitVec 32) List!12754) Bool)

(assert (=> b!666355 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310387 () Unit!23290)

(declare-fun e!381650 () Unit!23290)

(assert (=> b!666355 (= lt!310387 e!381650)))

(declare-fun c!76675 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666355 (= c!76675 (validKeyInArray!0 (select (arr!18713 a!3626) from!3004)))))

(declare-fun lt!310390 () Unit!23290)

(declare-fun e!381652 () Unit!23290)

(assert (=> b!666355 (= lt!310390 e!381652)))

(declare-fun c!76676 () Bool)

(declare-fun lt!310385 () Bool)

(assert (=> b!666355 (= c!76676 lt!310385)))

(assert (=> b!666355 (= lt!310385 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666355 (arrayContainsKey!0 (array!39042 (store (arr!18713 a!3626) i!1382 k!2843) (size!19077 a!3626)) k!2843 from!3004)))

(declare-fun b!666356 () Bool)

(declare-fun res!433740 () Bool)

(assert (=> b!666356 (=> (not res!433740) (not e!381656))))

(assert (=> b!666356 (= res!433740 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19077 a!3626))))))

(declare-fun b!666357 () Bool)

(declare-fun e!381655 () Bool)

(declare-fun contains!3331 (List!12754 (_ BitVec 64)) Bool)

(assert (=> b!666357 (= e!381655 (contains!3331 acc!681 k!2843))))

(declare-fun b!666358 () Bool)

(declare-fun Unit!23292 () Unit!23290)

(assert (=> b!666358 (= e!381652 Unit!23292)))

(declare-fun lt!310389 () Unit!23290)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39041 (_ BitVec 64) (_ BitVec 32)) Unit!23290)

(assert (=> b!666358 (= lt!310389 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666358 false))

(declare-fun b!666359 () Bool)

(declare-fun res!433744 () Bool)

(assert (=> b!666359 (=> (not res!433744) (not e!381656))))

(assert (=> b!666359 (= res!433744 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666360 () Bool)

(declare-fun res!433750 () Bool)

(assert (=> b!666360 (=> (not res!433750) (not e!381656))))

(assert (=> b!666360 (= res!433750 (validKeyInArray!0 k!2843))))

(declare-fun b!666361 () Bool)

(declare-fun res!433745 () Bool)

(assert (=> b!666361 (=> (not res!433745) (not e!381656))))

(assert (=> b!666361 (= res!433745 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12751))))

(declare-fun b!666362 () Bool)

(declare-fun lt!310392 () Unit!23290)

(assert (=> b!666362 (= e!381650 lt!310392)))

(declare-fun lt!310393 () Unit!23290)

(assert (=> b!666362 (= lt!310393 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666362 (subseq!70 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39041 List!12754 List!12754 (_ BitVec 32)) Unit!23290)

(assert (=> b!666362 (= lt!310392 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!202 acc!681 (select (arr!18713 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666362 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666363 () Bool)

(declare-fun res!433754 () Bool)

(assert (=> b!666363 (=> res!433754 e!381657)))

(assert (=> b!666363 (= res!433754 lt!310385)))

(declare-fun b!666364 () Bool)

(declare-fun e!381651 () Bool)

(assert (=> b!666364 (= e!381651 (not (contains!3331 acc!681 k!2843)))))

(declare-fun b!666365 () Bool)

(declare-fun res!433743 () Bool)

(assert (=> b!666365 (=> res!433743 e!381657)))

(assert (=> b!666365 (= res!433743 (contains!3331 lt!310391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666366 () Bool)

(assert (=> b!666366 (= e!381657 true)))

(declare-fun lt!310388 () Bool)

(assert (=> b!666366 (= lt!310388 (contains!3331 lt!310391 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666367 () Bool)

(declare-fun Unit!23293 () Unit!23290)

(assert (=> b!666367 (= e!381652 Unit!23293)))

(declare-fun b!666368 () Bool)

(declare-fun res!433742 () Bool)

(assert (=> b!666368 (=> (not res!433742) (not e!381656))))

(declare-fun e!381653 () Bool)

(assert (=> b!666368 (= res!433742 e!381653)))

(declare-fun res!433753 () Bool)

(assert (=> b!666368 (=> res!433753 e!381653)))

(assert (=> b!666368 (= res!433753 e!381655)))

(declare-fun res!433748 () Bool)

(assert (=> b!666368 (=> (not res!433748) (not e!381655))))

(assert (=> b!666368 (= res!433748 (bvsgt from!3004 i!1382))))

(declare-fun b!666369 () Bool)

(assert (=> b!666369 (= e!381653 e!381651)))

(declare-fun res!433752 () Bool)

(assert (=> b!666369 (=> (not res!433752) (not e!381651))))

(assert (=> b!666369 (= res!433752 (bvsle from!3004 i!1382))))

(declare-fun b!666370 () Bool)

(declare-fun res!433757 () Bool)

(assert (=> b!666370 (=> res!433757 e!381657)))

(declare-fun noDuplicate!578 (List!12754) Bool)

(assert (=> b!666370 (= res!433757 (not (noDuplicate!578 lt!310391)))))

(declare-fun b!666371 () Bool)

(declare-fun res!433751 () Bool)

(assert (=> b!666371 (=> (not res!433751) (not e!381656))))

(assert (=> b!666371 (= res!433751 (noDuplicate!578 acc!681))))

(declare-fun b!666372 () Bool)

(declare-fun Unit!23294 () Unit!23290)

(assert (=> b!666372 (= e!381650 Unit!23294)))

(declare-fun b!666373 () Bool)

(declare-fun res!433737 () Bool)

(assert (=> b!666373 (=> (not res!433737) (not e!381656))))

(assert (=> b!666373 (= res!433737 (not (contains!3331 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666374 () Bool)

(declare-fun res!433756 () Bool)

(assert (=> b!666374 (=> res!433756 e!381657)))

(assert (=> b!666374 (= res!433756 (not (subseq!70 acc!681 lt!310391)))))

(declare-fun b!666375 () Bool)

(declare-fun res!433739 () Bool)

(assert (=> b!666375 (=> res!433739 e!381657)))

(assert (=> b!666375 (= res!433739 (contains!3331 acc!681 k!2843))))

(declare-fun b!666376 () Bool)

(declare-fun res!433749 () Bool)

(assert (=> b!666376 (=> (not res!433749) (not e!381656))))

(assert (=> b!666376 (= res!433749 (not (contains!3331 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666377 () Bool)

(declare-fun res!433738 () Bool)

(assert (=> b!666377 (=> res!433738 e!381657)))

(assert (=> b!666377 (= res!433738 (not (contains!3331 lt!310391 k!2843)))))

(assert (= (and start!59994 res!433746) b!666371))

(assert (= (and b!666371 res!433751) b!666376))

(assert (= (and b!666376 res!433749) b!666373))

(assert (= (and b!666373 res!433737) b!666368))

(assert (= (and b!666368 res!433748) b!666357))

(assert (= (and b!666368 (not res!433753)) b!666369))

(assert (= (and b!666369 res!433752) b!666364))

(assert (= (and b!666368 res!433742) b!666361))

(assert (= (and b!666361 res!433745) b!666359))

(assert (= (and b!666359 res!433744) b!666356))

(assert (= (and b!666356 res!433740) b!666360))

(assert (= (and b!666360 res!433750) b!666354))

(assert (= (and b!666354 res!433741) b!666353))

(assert (= (and b!666353 res!433755) b!666355))

(assert (= (and b!666355 c!76676) b!666358))

(assert (= (and b!666355 (not c!76676)) b!666367))

(assert (= (and b!666355 c!76675) b!666362))

(assert (= (and b!666355 (not c!76675)) b!666372))

(assert (= (and b!666355 (not res!433747)) b!666370))

(assert (= (and b!666370 (not res!433757)) b!666363))

(assert (= (and b!666363 (not res!433754)) b!666375))

(assert (= (and b!666375 (not res!433739)) b!666374))

(assert (= (and b!666374 (not res!433756)) b!666377))

(assert (= (and b!666377 (not res!433738)) b!666365))

(assert (= (and b!666365 (not res!433743)) b!666366))

(declare-fun m!637173 () Bool)

(assert (=> b!666354 m!637173))

(declare-fun m!637175 () Bool)

(assert (=> b!666374 m!637175))

(declare-fun m!637177 () Bool)

(assert (=> b!666360 m!637177))

(declare-fun m!637179 () Bool)

(assert (=> b!666355 m!637179))

(declare-fun m!637181 () Bool)

(assert (=> b!666355 m!637181))

(declare-fun m!637183 () Bool)

(assert (=> b!666355 m!637183))

(declare-fun m!637185 () Bool)

(assert (=> b!666355 m!637185))

(declare-fun m!637187 () Bool)

(assert (=> b!666355 m!637187))

(declare-fun m!637189 () Bool)

(assert (=> b!666355 m!637189))

(declare-fun m!637191 () Bool)

(assert (=> b!666355 m!637191))

(declare-fun m!637193 () Bool)

(assert (=> b!666355 m!637193))

(assert (=> b!666355 m!637183))

(declare-fun m!637195 () Bool)

(assert (=> b!666355 m!637195))

(declare-fun m!637197 () Bool)

(assert (=> b!666355 m!637197))

(declare-fun m!637199 () Bool)

(assert (=> b!666355 m!637199))

(declare-fun m!637201 () Bool)

(assert (=> b!666359 m!637201))

(declare-fun m!637203 () Bool)

(assert (=> b!666365 m!637203))

(declare-fun m!637205 () Bool)

(assert (=> b!666371 m!637205))

(declare-fun m!637207 () Bool)

(assert (=> b!666376 m!637207))

(declare-fun m!637209 () Bool)

(assert (=> b!666373 m!637209))

(declare-fun m!637211 () Bool)

(assert (=> b!666357 m!637211))

(declare-fun m!637213 () Bool)

(assert (=> b!666377 m!637213))

(declare-fun m!637215 () Bool)

(assert (=> b!666361 m!637215))

(assert (=> b!666362 m!637181))

(assert (=> b!666362 m!637183))

(declare-fun m!637217 () Bool)

(assert (=> b!666362 m!637217))

(declare-fun m!637219 () Bool)

(assert (=> b!666362 m!637219))

(assert (=> b!666362 m!637183))

(assert (=> b!666362 m!637217))

(assert (=> b!666362 m!637189))

(assert (=> b!666362 m!637199))

(declare-fun m!637221 () Bool)

(assert (=> b!666370 m!637221))

(assert (=> b!666364 m!637211))

(declare-fun m!637223 () Bool)

(assert (=> b!666358 m!637223))

(declare-fun m!637225 () Bool)

(assert (=> start!59994 m!637225))

(declare-fun m!637227 () Bool)

(assert (=> b!666366 m!637227))

(assert (=> b!666375 m!637211))

(push 1)

(assert (not b!666358))

(assert (not b!666376))

(assert (not b!666374))

(assert (not start!59994))

(assert (not b!666360))

(assert (not b!666373))

(assert (not b!666366))

(assert (not b!666354))

(assert (not b!666357))

(assert (not b!666361))

(assert (not b!666377))

(assert (not b!666364))

(assert (not b!666365))

(assert (not b!666359))

(assert (not b!666371))

(assert (not b!666355))

(assert (not b!666370))

(assert (not b!666362))

(assert (not b!666375))

(check-sat)

(pop 1)

