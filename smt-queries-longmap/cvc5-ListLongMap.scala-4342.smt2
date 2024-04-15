; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60072 () Bool)

(assert start!60072)

(declare-fun b!669432 () Bool)

(declare-fun res!436452 () Bool)

(declare-fun e!382838 () Bool)

(assert (=> b!669432 (=> (not res!436452) (not e!382838))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39130 0))(
  ( (array!39131 (arr!18757 (Array (_ BitVec 32) (_ BitVec 64))) (size!19122 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39130)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!669432 (= res!436452 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19122 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669433 () Bool)

(declare-fun res!436455 () Bool)

(declare-fun e!382837 () Bool)

(assert (=> b!669433 (=> res!436455 e!382837)))

(declare-datatypes ((List!12837 0))(
  ( (Nil!12834) (Cons!12833 (h!13878 (_ BitVec 64)) (t!19056 List!12837)) )
))
(declare-fun lt!311487 () List!12837)

(declare-fun noDuplicate!628 (List!12837) Bool)

(assert (=> b!669433 (= res!436455 (not (noDuplicate!628 lt!311487)))))

(declare-fun b!669434 () Bool)

(declare-datatypes ((Unit!23493 0))(
  ( (Unit!23494) )
))
(declare-fun e!382844 () Unit!23493)

(declare-fun Unit!23495 () Unit!23493)

(assert (=> b!669434 (= e!382844 Unit!23495)))

(declare-fun b!669435 () Bool)

(declare-fun e!382836 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3359 (List!12837 (_ BitVec 64)) Bool)

(assert (=> b!669435 (= e!382836 (not (contains!3359 lt!311487 k!2843)))))

(declare-fun b!669436 () Bool)

(declare-fun e!382842 () Bool)

(declare-fun e!382843 () Bool)

(assert (=> b!669436 (= e!382842 e!382843)))

(declare-fun res!436453 () Bool)

(assert (=> b!669436 (=> (not res!436453) (not e!382843))))

(assert (=> b!669436 (= res!436453 (bvsle from!3004 i!1382))))

(declare-fun b!669437 () Bool)

(declare-fun e!382841 () Unit!23493)

(declare-fun lt!311478 () Unit!23493)

(assert (=> b!669437 (= e!382841 lt!311478)))

(declare-fun lt!311483 () Unit!23493)

(declare-fun acc!681 () List!12837)

(declare-fun lemmaListSubSeqRefl!0 (List!12837) Unit!23493)

(assert (=> b!669437 (= lt!311483 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!115 (List!12837 List!12837) Bool)

(assert (=> b!669437 (subseq!115 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39130 List!12837 List!12837 (_ BitVec 32)) Unit!23493)

(declare-fun $colon$colon!246 (List!12837 (_ BitVec 64)) List!12837)

(assert (=> b!669437 (= lt!311478 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!246 acc!681 (select (arr!18757 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39130 (_ BitVec 32) List!12837) Bool)

(assert (=> b!669437 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669438 () Bool)

(assert (=> b!669438 (= e!382838 (not e!382837))))

(declare-fun res!436440 () Bool)

(assert (=> b!669438 (=> res!436440 e!382837)))

(assert (=> b!669438 (= res!436440 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669438 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311487)))

(declare-fun lt!311481 () Unit!23493)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39130 (_ BitVec 64) (_ BitVec 32) List!12837 List!12837) Unit!23493)

(assert (=> b!669438 (= lt!311481 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311487))))

(declare-fun -!113 (List!12837 (_ BitVec 64)) List!12837)

(assert (=> b!669438 (= (-!113 lt!311487 k!2843) acc!681)))

(assert (=> b!669438 (= lt!311487 ($colon$colon!246 acc!681 k!2843))))

(declare-fun lt!311482 () Unit!23493)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12837) Unit!23493)

(assert (=> b!669438 (= lt!311482 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!669438 (subseq!115 acc!681 acc!681)))

(declare-fun lt!311479 () Unit!23493)

(assert (=> b!669438 (= lt!311479 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669438 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311486 () Unit!23493)

(assert (=> b!669438 (= lt!311486 e!382841)))

(declare-fun c!76865 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669438 (= c!76865 (validKeyInArray!0 (select (arr!18757 a!3626) from!3004)))))

(declare-fun lt!311485 () Unit!23493)

(assert (=> b!669438 (= lt!311485 e!382844)))

(declare-fun c!76866 () Bool)

(declare-fun arrayContainsKey!0 (array!39130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669438 (= c!76866 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669438 (arrayContainsKey!0 (array!39131 (store (arr!18757 a!3626) i!1382 k!2843) (size!19122 a!3626)) k!2843 from!3004)))

(declare-fun b!669439 () Bool)

(declare-fun res!436441 () Bool)

(assert (=> b!669439 (=> (not res!436441) (not e!382838))))

(assert (=> b!669439 (= res!436441 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669440 () Bool)

(declare-fun res!436450 () Bool)

(assert (=> b!669440 (=> (not res!436450) (not e!382838))))

(assert (=> b!669440 (= res!436450 (validKeyInArray!0 k!2843))))

(declare-fun b!669442 () Bool)

(declare-fun res!436443 () Bool)

(assert (=> b!669442 (=> (not res!436443) (not e!382838))))

(assert (=> b!669442 (= res!436443 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19122 a!3626))))))

(declare-fun b!669443 () Bool)

(declare-fun e!382834 () Bool)

(assert (=> b!669443 (= e!382834 (contains!3359 acc!681 k!2843))))

(declare-fun b!669444 () Bool)

(declare-fun e!382840 () Bool)

(assert (=> b!669444 (= e!382840 e!382836)))

(declare-fun res!436438 () Bool)

(assert (=> b!669444 (=> (not res!436438) (not e!382836))))

(assert (=> b!669444 (= res!436438 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669445 () Bool)

(declare-fun res!436444 () Bool)

(assert (=> b!669445 (=> (not res!436444) (not e!382838))))

(assert (=> b!669445 (= res!436444 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669446 () Bool)

(declare-fun res!436456 () Bool)

(assert (=> b!669446 (=> (not res!436456) (not e!382838))))

(assert (=> b!669446 (= res!436456 e!382842)))

(declare-fun res!436439 () Bool)

(assert (=> b!669446 (=> res!436439 e!382842)))

(assert (=> b!669446 (= res!436439 e!382834)))

(declare-fun res!436442 () Bool)

(assert (=> b!669446 (=> (not res!436442) (not e!382834))))

(assert (=> b!669446 (= res!436442 (bvsgt from!3004 i!1382))))

(declare-fun b!669447 () Bool)

(declare-fun Unit!23496 () Unit!23493)

(assert (=> b!669447 (= e!382841 Unit!23496)))

(declare-fun b!669448 () Bool)

(declare-fun res!436447 () Bool)

(assert (=> b!669448 (=> res!436447 e!382837)))

(assert (=> b!669448 (= res!436447 (contains!3359 lt!311487 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669449 () Bool)

(declare-fun e!382835 () Bool)

(assert (=> b!669449 (= e!382835 (contains!3359 lt!311487 k!2843))))

(declare-fun b!669450 () Bool)

(declare-fun res!436437 () Bool)

(assert (=> b!669450 (=> (not res!436437) (not e!382838))))

(assert (=> b!669450 (= res!436437 (not (contains!3359 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669441 () Bool)

(declare-fun res!436454 () Bool)

(assert (=> b!669441 (=> (not res!436454) (not e!382838))))

(assert (=> b!669441 (= res!436454 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12834))))

(declare-fun res!436448 () Bool)

(assert (=> start!60072 (=> (not res!436448) (not e!382838))))

(assert (=> start!60072 (= res!436448 (and (bvslt (size!19122 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19122 a!3626))))))

(assert (=> start!60072 e!382838))

(assert (=> start!60072 true))

(declare-fun array_inv!14640 (array!39130) Bool)

(assert (=> start!60072 (array_inv!14640 a!3626)))

(declare-fun b!669451 () Bool)

(declare-fun res!436451 () Bool)

(assert (=> b!669451 (=> res!436451 e!382837)))

(assert (=> b!669451 (= res!436451 (contains!3359 lt!311487 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669452 () Bool)

(declare-fun res!436446 () Bool)

(assert (=> b!669452 (=> (not res!436446) (not e!382838))))

(assert (=> b!669452 (= res!436446 (not (contains!3359 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669453 () Bool)

(assert (=> b!669453 (= e!382843 (not (contains!3359 acc!681 k!2843)))))

(declare-fun b!669454 () Bool)

(assert (=> b!669454 (= e!382837 true)))

(declare-fun lt!311480 () Bool)

(assert (=> b!669454 (= lt!311480 e!382840)))

(declare-fun res!436436 () Bool)

(assert (=> b!669454 (=> res!436436 e!382840)))

(assert (=> b!669454 (= res!436436 e!382835)))

(declare-fun res!436445 () Bool)

(assert (=> b!669454 (=> (not res!436445) (not e!382835))))

(assert (=> b!669454 (= res!436445 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669455 () Bool)

(declare-fun Unit!23497 () Unit!23493)

(assert (=> b!669455 (= e!382844 Unit!23497)))

(declare-fun lt!311484 () Unit!23493)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39130 (_ BitVec 64) (_ BitVec 32)) Unit!23493)

(assert (=> b!669455 (= lt!311484 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669455 false))

(declare-fun b!669456 () Bool)

(declare-fun res!436449 () Bool)

(assert (=> b!669456 (=> (not res!436449) (not e!382838))))

(assert (=> b!669456 (= res!436449 (noDuplicate!628 acc!681))))

(assert (= (and start!60072 res!436448) b!669456))

(assert (= (and b!669456 res!436449) b!669452))

(assert (= (and b!669452 res!436446) b!669450))

(assert (= (and b!669450 res!436437) b!669446))

(assert (= (and b!669446 res!436442) b!669443))

(assert (= (and b!669446 (not res!436439)) b!669436))

(assert (= (and b!669436 res!436453) b!669453))

(assert (= (and b!669446 res!436456) b!669441))

(assert (= (and b!669441 res!436454) b!669439))

(assert (= (and b!669439 res!436441) b!669442))

(assert (= (and b!669442 res!436443) b!669440))

(assert (= (and b!669440 res!436450) b!669445))

(assert (= (and b!669445 res!436444) b!669432))

(assert (= (and b!669432 res!436452) b!669438))

(assert (= (and b!669438 c!76866) b!669455))

(assert (= (and b!669438 (not c!76866)) b!669434))

(assert (= (and b!669438 c!76865) b!669437))

(assert (= (and b!669438 (not c!76865)) b!669447))

(assert (= (and b!669438 (not res!436440)) b!669433))

(assert (= (and b!669433 (not res!436455)) b!669451))

(assert (= (and b!669451 (not res!436451)) b!669448))

(assert (= (and b!669448 (not res!436447)) b!669454))

(assert (= (and b!669454 res!436445) b!669449))

(assert (= (and b!669454 (not res!436436)) b!669444))

(assert (= (and b!669444 res!436438) b!669435))

(declare-fun m!638975 () Bool)

(assert (=> b!669450 m!638975))

(declare-fun m!638977 () Bool)

(assert (=> b!669440 m!638977))

(declare-fun m!638979 () Bool)

(assert (=> b!669452 m!638979))

(declare-fun m!638981 () Bool)

(assert (=> b!669445 m!638981))

(declare-fun m!638983 () Bool)

(assert (=> b!669451 m!638983))

(declare-fun m!638985 () Bool)

(assert (=> b!669437 m!638985))

(declare-fun m!638987 () Bool)

(assert (=> b!669437 m!638987))

(declare-fun m!638989 () Bool)

(assert (=> b!669437 m!638989))

(declare-fun m!638991 () Bool)

(assert (=> b!669437 m!638991))

(assert (=> b!669437 m!638987))

(assert (=> b!669437 m!638989))

(declare-fun m!638993 () Bool)

(assert (=> b!669437 m!638993))

(declare-fun m!638995 () Bool)

(assert (=> b!669437 m!638995))

(declare-fun m!638997 () Bool)

(assert (=> b!669453 m!638997))

(declare-fun m!638999 () Bool)

(assert (=> b!669439 m!638999))

(declare-fun m!639001 () Bool)

(assert (=> b!669456 m!639001))

(declare-fun m!639003 () Bool)

(assert (=> b!669448 m!639003))

(declare-fun m!639005 () Bool)

(assert (=> b!669441 m!639005))

(declare-fun m!639007 () Bool)

(assert (=> b!669433 m!639007))

(assert (=> b!669443 m!638997))

(declare-fun m!639009 () Bool)

(assert (=> b!669435 m!639009))

(assert (=> b!669449 m!639009))

(declare-fun m!639011 () Bool)

(assert (=> b!669455 m!639011))

(declare-fun m!639013 () Bool)

(assert (=> start!60072 m!639013))

(assert (=> b!669438 m!638985))

(assert (=> b!669438 m!638987))

(declare-fun m!639015 () Bool)

(assert (=> b!669438 m!639015))

(declare-fun m!639017 () Bool)

(assert (=> b!669438 m!639017))

(declare-fun m!639019 () Bool)

(assert (=> b!669438 m!639019))

(declare-fun m!639021 () Bool)

(assert (=> b!669438 m!639021))

(declare-fun m!639023 () Bool)

(assert (=> b!669438 m!639023))

(assert (=> b!669438 m!638993))

(declare-fun m!639025 () Bool)

(assert (=> b!669438 m!639025))

(declare-fun m!639027 () Bool)

(assert (=> b!669438 m!639027))

(assert (=> b!669438 m!638987))

(declare-fun m!639029 () Bool)

(assert (=> b!669438 m!639029))

(declare-fun m!639031 () Bool)

(assert (=> b!669438 m!639031))

(assert (=> b!669438 m!638995))

(push 1)

(assert (not b!669435))

(assert (not b!669456))

(assert (not b!669445))

(assert (not b!669453))

(assert (not start!60072))

(assert (not b!669455))

(assert (not b!669443))

(assert (not b!669449))

(assert (not b!669439))

(assert (not b!669448))

(assert (not b!669433))

(assert (not b!669438))

(assert (not b!669451))

(assert (not b!669452))

(assert (not b!669441))

(assert (not b!669450))

(assert (not b!669440))

(assert (not b!669437))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

