; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60076 () Bool)

(assert start!60076)

(declare-fun b!669429 () Bool)

(declare-fun res!436329 () Bool)

(declare-fun e!382892 () Bool)

(assert (=> b!669429 (=> (not res!436329) (not e!382892))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39123 0))(
  ( (array!39124 (arr!18754 (Array (_ BitVec 32) (_ BitVec 64))) (size!19118 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39123)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!669429 (= res!436329 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19118 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669430 () Bool)

(declare-fun e!382900 () Bool)

(assert (=> b!669430 (= e!382900 true)))

(declare-fun lt!311615 () Bool)

(declare-fun e!382901 () Bool)

(assert (=> b!669430 (= lt!311615 e!382901)))

(declare-fun res!436337 () Bool)

(assert (=> b!669430 (=> res!436337 e!382901)))

(declare-fun e!382895 () Bool)

(assert (=> b!669430 (= res!436337 e!382895)))

(declare-fun res!436323 () Bool)

(assert (=> b!669430 (=> (not res!436323) (not e!382895))))

(assert (=> b!669430 (= res!436323 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669431 () Bool)

(declare-fun res!436324 () Bool)

(assert (=> b!669431 (=> (not res!436324) (not e!382892))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669431 (= res!436324 (validKeyInArray!0 k0!2843))))

(declare-fun b!669432 () Bool)

(declare-datatypes ((Unit!23495 0))(
  ( (Unit!23496) )
))
(declare-fun e!382898 () Unit!23495)

(declare-fun lt!311619 () Unit!23495)

(assert (=> b!669432 (= e!382898 lt!311619)))

(declare-fun lt!311620 () Unit!23495)

(declare-datatypes ((List!12795 0))(
  ( (Nil!12792) (Cons!12791 (h!13836 (_ BitVec 64)) (t!19023 List!12795)) )
))
(declare-fun acc!681 () List!12795)

(declare-fun lemmaListSubSeqRefl!0 (List!12795) Unit!23495)

(assert (=> b!669432 (= lt!311620 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!111 (List!12795 List!12795) Bool)

(assert (=> b!669432 (subseq!111 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39123 List!12795 List!12795 (_ BitVec 32)) Unit!23495)

(declare-fun $colon$colon!243 (List!12795 (_ BitVec 64)) List!12795)

(assert (=> b!669432 (= lt!311619 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!243 acc!681 (select (arr!18754 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39123 (_ BitVec 32) List!12795) Bool)

(assert (=> b!669432 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669433 () Bool)

(declare-fun res!436326 () Bool)

(assert (=> b!669433 (=> (not res!436326) (not e!382892))))

(declare-fun contains!3372 (List!12795 (_ BitVec 64)) Bool)

(assert (=> b!669433 (= res!436326 (not (contains!3372 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669434 () Bool)

(declare-fun e!382897 () Bool)

(declare-fun e!382902 () Bool)

(assert (=> b!669434 (= e!382897 e!382902)))

(declare-fun res!436330 () Bool)

(assert (=> b!669434 (=> (not res!436330) (not e!382902))))

(assert (=> b!669434 (= res!436330 (bvsle from!3004 i!1382))))

(declare-fun b!669435 () Bool)

(declare-fun res!436339 () Bool)

(assert (=> b!669435 (=> (not res!436339) (not e!382892))))

(assert (=> b!669435 (= res!436339 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12792))))

(declare-fun b!669436 () Bool)

(assert (=> b!669436 (= e!382892 (not e!382900))))

(declare-fun res!436331 () Bool)

(assert (=> b!669436 (=> res!436331 e!382900)))

(assert (=> b!669436 (= res!436331 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!311623 () List!12795)

(assert (=> b!669436 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311623)))

(declare-fun lt!311617 () Unit!23495)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39123 (_ BitVec 64) (_ BitVec 32) List!12795 List!12795) Unit!23495)

(assert (=> b!669436 (= lt!311617 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311623))))

(declare-fun -!109 (List!12795 (_ BitVec 64)) List!12795)

(assert (=> b!669436 (= (-!109 lt!311623 k0!2843) acc!681)))

(assert (=> b!669436 (= lt!311623 ($colon$colon!243 acc!681 k0!2843))))

(declare-fun lt!311616 () Unit!23495)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12795) Unit!23495)

(assert (=> b!669436 (= lt!311616 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!669436 (subseq!111 acc!681 acc!681)))

(declare-fun lt!311614 () Unit!23495)

(assert (=> b!669436 (= lt!311614 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669436 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311622 () Unit!23495)

(assert (=> b!669436 (= lt!311622 e!382898)))

(declare-fun c!76922 () Bool)

(assert (=> b!669436 (= c!76922 (validKeyInArray!0 (select (arr!18754 a!3626) from!3004)))))

(declare-fun lt!311621 () Unit!23495)

(declare-fun e!382896 () Unit!23495)

(assert (=> b!669436 (= lt!311621 e!382896)))

(declare-fun c!76921 () Bool)

(declare-fun arrayContainsKey!0 (array!39123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669436 (= c!76921 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669436 (arrayContainsKey!0 (array!39124 (store (arr!18754 a!3626) i!1382 k0!2843) (size!19118 a!3626)) k0!2843 from!3004)))

(declare-fun b!669428 () Bool)

(declare-fun res!436340 () Bool)

(assert (=> b!669428 (=> (not res!436340) (not e!382892))))

(assert (=> b!669428 (= res!436340 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!436333 () Bool)

(assert (=> start!60076 (=> (not res!436333) (not e!382892))))

(assert (=> start!60076 (= res!436333 (and (bvslt (size!19118 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19118 a!3626))))))

(assert (=> start!60076 e!382892))

(assert (=> start!60076 true))

(declare-fun array_inv!14550 (array!39123) Bool)

(assert (=> start!60076 (array_inv!14550 a!3626)))

(declare-fun b!669437 () Bool)

(declare-fun Unit!23497 () Unit!23495)

(assert (=> b!669437 (= e!382896 Unit!23497)))

(declare-fun b!669438 () Bool)

(declare-fun res!436325 () Bool)

(assert (=> b!669438 (=> res!436325 e!382900)))

(assert (=> b!669438 (= res!436325 (contains!3372 lt!311623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669439 () Bool)

(declare-fun Unit!23498 () Unit!23495)

(assert (=> b!669439 (= e!382898 Unit!23498)))

(declare-fun b!669440 () Bool)

(declare-fun e!382894 () Bool)

(assert (=> b!669440 (= e!382894 (contains!3372 acc!681 k0!2843))))

(declare-fun b!669441 () Bool)

(declare-fun Unit!23499 () Unit!23495)

(assert (=> b!669441 (= e!382896 Unit!23499)))

(declare-fun lt!311618 () Unit!23495)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39123 (_ BitVec 64) (_ BitVec 32)) Unit!23495)

(assert (=> b!669441 (= lt!311618 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!669441 false))

(declare-fun b!669442 () Bool)

(declare-fun res!436335 () Bool)

(assert (=> b!669442 (=> (not res!436335) (not e!382892))))

(assert (=> b!669442 (= res!436335 e!382897)))

(declare-fun res!436328 () Bool)

(assert (=> b!669442 (=> res!436328 e!382897)))

(assert (=> b!669442 (= res!436328 e!382894)))

(declare-fun res!436332 () Bool)

(assert (=> b!669442 (=> (not res!436332) (not e!382894))))

(assert (=> b!669442 (= res!436332 (bvsgt from!3004 i!1382))))

(declare-fun b!669443 () Bool)

(declare-fun res!436336 () Bool)

(assert (=> b!669443 (=> (not res!436336) (not e!382892))))

(assert (=> b!669443 (= res!436336 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669444 () Bool)

(declare-fun e!382899 () Bool)

(assert (=> b!669444 (= e!382899 (not (contains!3372 lt!311623 k0!2843)))))

(declare-fun b!669445 () Bool)

(declare-fun res!436327 () Bool)

(assert (=> b!669445 (=> (not res!436327) (not e!382892))))

(assert (=> b!669445 (= res!436327 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19118 a!3626))))))

(declare-fun b!669446 () Bool)

(declare-fun res!436338 () Bool)

(assert (=> b!669446 (=> (not res!436338) (not e!382892))))

(assert (=> b!669446 (= res!436338 (not (contains!3372 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669447 () Bool)

(declare-fun res!436334 () Bool)

(assert (=> b!669447 (=> res!436334 e!382900)))

(declare-fun noDuplicate!619 (List!12795) Bool)

(assert (=> b!669447 (= res!436334 (not (noDuplicate!619 lt!311623)))))

(declare-fun b!669448 () Bool)

(assert (=> b!669448 (= e!382902 (not (contains!3372 acc!681 k0!2843)))))

(declare-fun b!669449 () Bool)

(declare-fun res!436322 () Bool)

(assert (=> b!669449 (=> (not res!436322) (not e!382892))))

(assert (=> b!669449 (= res!436322 (noDuplicate!619 acc!681))))

(declare-fun b!669450 () Bool)

(declare-fun res!436320 () Bool)

(assert (=> b!669450 (=> res!436320 e!382900)))

(assert (=> b!669450 (= res!436320 (contains!3372 lt!311623 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669451 () Bool)

(assert (=> b!669451 (= e!382895 (contains!3372 lt!311623 k0!2843))))

(declare-fun b!669452 () Bool)

(assert (=> b!669452 (= e!382901 e!382899)))

(declare-fun res!436321 () Bool)

(assert (=> b!669452 (=> (not res!436321) (not e!382899))))

(assert (=> b!669452 (= res!436321 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60076 res!436333) b!669449))

(assert (= (and b!669449 res!436322) b!669433))

(assert (= (and b!669433 res!436326) b!669446))

(assert (= (and b!669446 res!436338) b!669442))

(assert (= (and b!669442 res!436332) b!669440))

(assert (= (and b!669442 (not res!436328)) b!669434))

(assert (= (and b!669434 res!436330) b!669448))

(assert (= (and b!669442 res!436335) b!669435))

(assert (= (and b!669435 res!436339) b!669443))

(assert (= (and b!669443 res!436336) b!669445))

(assert (= (and b!669445 res!436327) b!669431))

(assert (= (and b!669431 res!436324) b!669428))

(assert (= (and b!669428 res!436340) b!669429))

(assert (= (and b!669429 res!436329) b!669436))

(assert (= (and b!669436 c!76921) b!669441))

(assert (= (and b!669436 (not c!76921)) b!669437))

(assert (= (and b!669436 c!76922) b!669432))

(assert (= (and b!669436 (not c!76922)) b!669439))

(assert (= (and b!669436 (not res!436331)) b!669447))

(assert (= (and b!669447 (not res!436334)) b!669438))

(assert (= (and b!669438 (not res!436325)) b!669450))

(assert (= (and b!669450 (not res!436320)) b!669430))

(assert (= (and b!669430 res!436323) b!669451))

(assert (= (and b!669430 (not res!436337)) b!669452))

(assert (= (and b!669452 res!436321) b!669444))

(declare-fun m!639525 () Bool)

(assert (=> b!669431 m!639525))

(declare-fun m!639527 () Bool)

(assert (=> b!669444 m!639527))

(assert (=> b!669451 m!639527))

(declare-fun m!639529 () Bool)

(assert (=> b!669449 m!639529))

(declare-fun m!639531 () Bool)

(assert (=> b!669428 m!639531))

(declare-fun m!639533 () Bool)

(assert (=> b!669435 m!639533))

(declare-fun m!639535 () Bool)

(assert (=> b!669432 m!639535))

(declare-fun m!639537 () Bool)

(assert (=> b!669432 m!639537))

(declare-fun m!639539 () Bool)

(assert (=> b!669432 m!639539))

(declare-fun m!639541 () Bool)

(assert (=> b!669432 m!639541))

(assert (=> b!669432 m!639537))

(assert (=> b!669432 m!639539))

(declare-fun m!639543 () Bool)

(assert (=> b!669432 m!639543))

(declare-fun m!639545 () Bool)

(assert (=> b!669432 m!639545))

(declare-fun m!639547 () Bool)

(assert (=> b!669443 m!639547))

(declare-fun m!639549 () Bool)

(assert (=> b!669438 m!639549))

(declare-fun m!639551 () Bool)

(assert (=> b!669440 m!639551))

(declare-fun m!639553 () Bool)

(assert (=> b!669441 m!639553))

(declare-fun m!639555 () Bool)

(assert (=> b!669446 m!639555))

(declare-fun m!639557 () Bool)

(assert (=> b!669436 m!639557))

(assert (=> b!669436 m!639535))

(declare-fun m!639559 () Bool)

(assert (=> b!669436 m!639559))

(assert (=> b!669436 m!639537))

(declare-fun m!639561 () Bool)

(assert (=> b!669436 m!639561))

(declare-fun m!639563 () Bool)

(assert (=> b!669436 m!639563))

(declare-fun m!639565 () Bool)

(assert (=> b!669436 m!639565))

(assert (=> b!669436 m!639543))

(declare-fun m!639567 () Bool)

(assert (=> b!669436 m!639567))

(declare-fun m!639569 () Bool)

(assert (=> b!669436 m!639569))

(assert (=> b!669436 m!639537))

(declare-fun m!639571 () Bool)

(assert (=> b!669436 m!639571))

(declare-fun m!639573 () Bool)

(assert (=> b!669436 m!639573))

(assert (=> b!669436 m!639545))

(declare-fun m!639575 () Bool)

(assert (=> b!669433 m!639575))

(declare-fun m!639577 () Bool)

(assert (=> start!60076 m!639577))

(declare-fun m!639579 () Bool)

(assert (=> b!669447 m!639579))

(declare-fun m!639581 () Bool)

(assert (=> b!669450 m!639581))

(assert (=> b!669448 m!639551))

(check-sat (not b!669435) (not start!60076) (not b!669428) (not b!669432) (not b!669443) (not b!669449) (not b!669446) (not b!669441) (not b!669448) (not b!669440) (not b!669451) (not b!669433) (not b!669444) (not b!669431) (not b!669447) (not b!669438) (not b!669436) (not b!669450))
(check-sat)
