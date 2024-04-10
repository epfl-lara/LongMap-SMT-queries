; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60048 () Bool)

(assert start!60048)

(declare-fun b!668378 () Bool)

(declare-fun res!435455 () Bool)

(declare-fun e!382432 () Bool)

(assert (=> b!668378 (=> (not res!435455) (not e!382432))))

(declare-datatypes ((array!39095 0))(
  ( (array!39096 (arr!18740 (Array (_ BitVec 32) (_ BitVec 64))) (size!19104 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39095)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12781 0))(
  ( (Nil!12778) (Cons!12777 (h!13822 (_ BitVec 64)) (t!19009 List!12781)) )
))
(declare-fun acc!681 () List!12781)

(declare-fun arrayNoDuplicates!0 (array!39095 (_ BitVec 32) List!12781) Bool)

(assert (=> b!668378 (= res!435455 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668379 () Bool)

(declare-fun e!382431 () Bool)

(declare-fun e!382434 () Bool)

(assert (=> b!668379 (= e!382431 e!382434)))

(declare-fun res!435445 () Bool)

(assert (=> b!668379 (=> (not res!435445) (not e!382434))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668379 (= res!435445 (bvsle from!3004 i!1382))))

(declare-fun b!668380 () Bool)

(declare-fun res!435442 () Bool)

(assert (=> b!668380 (=> (not res!435442) (not e!382432))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668380 (= res!435442 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668381 () Bool)

(declare-fun res!435444 () Bool)

(assert (=> b!668381 (=> (not res!435444) (not e!382432))))

(assert (=> b!668381 (= res!435444 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12778))))

(declare-fun b!668382 () Bool)

(declare-fun res!435440 () Bool)

(assert (=> b!668382 (=> (not res!435440) (not e!382432))))

(declare-fun noDuplicate!605 (List!12781) Bool)

(assert (=> b!668382 (= res!435440 (noDuplicate!605 acc!681))))

(declare-fun b!668383 () Bool)

(declare-datatypes ((Unit!23425 0))(
  ( (Unit!23426) )
))
(declare-fun e!382440 () Unit!23425)

(declare-fun Unit!23427 () Unit!23425)

(assert (=> b!668383 (= e!382440 Unit!23427)))

(declare-fun b!668384 () Bool)

(declare-fun res!435441 () Bool)

(declare-fun e!382430 () Bool)

(assert (=> b!668384 (=> res!435441 e!382430)))

(declare-fun lt!311203 () List!12781)

(declare-fun contains!3358 (List!12781 (_ BitVec 64)) Bool)

(assert (=> b!668384 (= res!435441 (contains!3358 lt!311203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668385 () Bool)

(assert (=> b!668385 (= e!382434 (not (contains!3358 acc!681 k!2843)))))

(declare-fun b!668386 () Bool)

(assert (=> b!668386 (= e!382432 (not e!382430))))

(declare-fun res!435438 () Bool)

(assert (=> b!668386 (=> res!435438 e!382430)))

(assert (=> b!668386 (= res!435438 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668386 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311203)))

(declare-fun lt!311194 () Unit!23425)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39095 (_ BitVec 64) (_ BitVec 32) List!12781 List!12781) Unit!23425)

(assert (=> b!668386 (= lt!311194 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311203))))

(declare-fun -!95 (List!12781 (_ BitVec 64)) List!12781)

(assert (=> b!668386 (= (-!95 lt!311203 k!2843) acc!681)))

(declare-fun $colon$colon!229 (List!12781 (_ BitVec 64)) List!12781)

(assert (=> b!668386 (= lt!311203 ($colon$colon!229 acc!681 k!2843))))

(declare-fun lt!311195 () Unit!23425)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12781) Unit!23425)

(assert (=> b!668386 (= lt!311195 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!97 (List!12781 List!12781) Bool)

(assert (=> b!668386 (subseq!97 acc!681 acc!681)))

(declare-fun lt!311197 () Unit!23425)

(declare-fun lemmaListSubSeqRefl!0 (List!12781) Unit!23425)

(assert (=> b!668386 (= lt!311197 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668386 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311200 () Unit!23425)

(declare-fun e!382435 () Unit!23425)

(assert (=> b!668386 (= lt!311200 e!382435)))

(declare-fun c!76838 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668386 (= c!76838 (validKeyInArray!0 (select (arr!18740 a!3626) from!3004)))))

(declare-fun lt!311196 () Unit!23425)

(assert (=> b!668386 (= lt!311196 e!382440)))

(declare-fun c!76837 () Bool)

(assert (=> b!668386 (= c!76837 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668386 (arrayContainsKey!0 (array!39096 (store (arr!18740 a!3626) i!1382 k!2843) (size!19104 a!3626)) k!2843 from!3004)))

(declare-fun b!668387 () Bool)

(assert (=> b!668387 (= e!382430 true)))

(declare-fun lt!311201 () Bool)

(declare-fun e!382438 () Bool)

(assert (=> b!668387 (= lt!311201 e!382438)))

(declare-fun res!435458 () Bool)

(assert (=> b!668387 (=> res!435458 e!382438)))

(declare-fun e!382439 () Bool)

(assert (=> b!668387 (= res!435458 e!382439)))

(declare-fun res!435446 () Bool)

(assert (=> b!668387 (=> (not res!435446) (not e!382439))))

(assert (=> b!668387 (= res!435446 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668388 () Bool)

(declare-fun res!435454 () Bool)

(assert (=> b!668388 (=> res!435454 e!382430)))

(assert (=> b!668388 (= res!435454 (contains!3358 lt!311203 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668389 () Bool)

(assert (=> b!668389 (= e!382439 (contains!3358 lt!311203 k!2843))))

(declare-fun b!668390 () Bool)

(declare-fun Unit!23428 () Unit!23425)

(assert (=> b!668390 (= e!382440 Unit!23428)))

(declare-fun lt!311198 () Unit!23425)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39095 (_ BitVec 64) (_ BitVec 32)) Unit!23425)

(assert (=> b!668390 (= lt!311198 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668390 false))

(declare-fun res!435443 () Bool)

(assert (=> start!60048 (=> (not res!435443) (not e!382432))))

(assert (=> start!60048 (= res!435443 (and (bvslt (size!19104 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19104 a!3626))))))

(assert (=> start!60048 e!382432))

(assert (=> start!60048 true))

(declare-fun array_inv!14536 (array!39095) Bool)

(assert (=> start!60048 (array_inv!14536 a!3626)))

(declare-fun b!668391 () Bool)

(declare-fun res!435456 () Bool)

(assert (=> b!668391 (=> res!435456 e!382430)))

(assert (=> b!668391 (= res!435456 (not (noDuplicate!605 lt!311203)))))

(declare-fun b!668392 () Bool)

(declare-fun res!435452 () Bool)

(assert (=> b!668392 (=> (not res!435452) (not e!382432))))

(assert (=> b!668392 (= res!435452 (not (contains!3358 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668393 () Bool)

(declare-fun Unit!23429 () Unit!23425)

(assert (=> b!668393 (= e!382435 Unit!23429)))

(declare-fun b!668394 () Bool)

(declare-fun e!382437 () Bool)

(assert (=> b!668394 (= e!382438 e!382437)))

(declare-fun res!435447 () Bool)

(assert (=> b!668394 (=> (not res!435447) (not e!382437))))

(assert (=> b!668394 (= res!435447 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668395 () Bool)

(declare-fun e!382433 () Bool)

(assert (=> b!668395 (= e!382433 (contains!3358 acc!681 k!2843))))

(declare-fun b!668396 () Bool)

(declare-fun res!435453 () Bool)

(assert (=> b!668396 (=> (not res!435453) (not e!382432))))

(assert (=> b!668396 (= res!435453 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19104 a!3626))))))

(declare-fun b!668397 () Bool)

(declare-fun res!435449 () Bool)

(assert (=> b!668397 (=> (not res!435449) (not e!382432))))

(assert (=> b!668397 (= res!435449 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19104 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668398 () Bool)

(declare-fun res!435451 () Bool)

(assert (=> b!668398 (=> (not res!435451) (not e!382432))))

(assert (=> b!668398 (= res!435451 (not (contains!3358 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668399 () Bool)

(declare-fun res!435439 () Bool)

(assert (=> b!668399 (=> (not res!435439) (not e!382432))))

(assert (=> b!668399 (= res!435439 (validKeyInArray!0 k!2843))))

(declare-fun b!668400 () Bool)

(assert (=> b!668400 (= e!382437 (not (contains!3358 lt!311203 k!2843)))))

(declare-fun b!668401 () Bool)

(declare-fun res!435457 () Bool)

(assert (=> b!668401 (=> (not res!435457) (not e!382432))))

(assert (=> b!668401 (= res!435457 e!382431)))

(declare-fun res!435448 () Bool)

(assert (=> b!668401 (=> res!435448 e!382431)))

(assert (=> b!668401 (= res!435448 e!382433)))

(declare-fun res!435450 () Bool)

(assert (=> b!668401 (=> (not res!435450) (not e!382433))))

(assert (=> b!668401 (= res!435450 (bvsgt from!3004 i!1382))))

(declare-fun b!668402 () Bool)

(declare-fun lt!311202 () Unit!23425)

(assert (=> b!668402 (= e!382435 lt!311202)))

(declare-fun lt!311199 () Unit!23425)

(assert (=> b!668402 (= lt!311199 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668402 (subseq!97 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39095 List!12781 List!12781 (_ BitVec 32)) Unit!23425)

(assert (=> b!668402 (= lt!311202 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!229 acc!681 (select (arr!18740 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668402 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!60048 res!435443) b!668382))

(assert (= (and b!668382 res!435440) b!668392))

(assert (= (and b!668392 res!435452) b!668398))

(assert (= (and b!668398 res!435451) b!668401))

(assert (= (and b!668401 res!435450) b!668395))

(assert (= (and b!668401 (not res!435448)) b!668379))

(assert (= (and b!668379 res!435445) b!668385))

(assert (= (and b!668401 res!435457) b!668381))

(assert (= (and b!668381 res!435444) b!668378))

(assert (= (and b!668378 res!435455) b!668396))

(assert (= (and b!668396 res!435453) b!668399))

(assert (= (and b!668399 res!435439) b!668380))

(assert (= (and b!668380 res!435442) b!668397))

(assert (= (and b!668397 res!435449) b!668386))

(assert (= (and b!668386 c!76837) b!668390))

(assert (= (and b!668386 (not c!76837)) b!668383))

(assert (= (and b!668386 c!76838) b!668402))

(assert (= (and b!668386 (not c!76838)) b!668393))

(assert (= (and b!668386 (not res!435438)) b!668391))

(assert (= (and b!668391 (not res!435456)) b!668384))

(assert (= (and b!668384 (not res!435441)) b!668388))

(assert (= (and b!668388 (not res!435454)) b!668387))

(assert (= (and b!668387 res!435446) b!668389))

(assert (= (and b!668387 (not res!435458)) b!668394))

(assert (= (and b!668394 res!435447) b!668400))

(declare-fun m!638713 () Bool)

(assert (=> b!668380 m!638713))

(declare-fun m!638715 () Bool)

(assert (=> b!668382 m!638715))

(declare-fun m!638717 () Bool)

(assert (=> b!668391 m!638717))

(declare-fun m!638719 () Bool)

(assert (=> b!668399 m!638719))

(declare-fun m!638721 () Bool)

(assert (=> b!668388 m!638721))

(declare-fun m!638723 () Bool)

(assert (=> b!668389 m!638723))

(assert (=> b!668400 m!638723))

(declare-fun m!638725 () Bool)

(assert (=> b!668392 m!638725))

(declare-fun m!638727 () Bool)

(assert (=> b!668386 m!638727))

(declare-fun m!638729 () Bool)

(assert (=> b!668386 m!638729))

(declare-fun m!638731 () Bool)

(assert (=> b!668386 m!638731))

(declare-fun m!638733 () Bool)

(assert (=> b!668386 m!638733))

(declare-fun m!638735 () Bool)

(assert (=> b!668386 m!638735))

(declare-fun m!638737 () Bool)

(assert (=> b!668386 m!638737))

(declare-fun m!638739 () Bool)

(assert (=> b!668386 m!638739))

(declare-fun m!638741 () Bool)

(assert (=> b!668386 m!638741))

(assert (=> b!668386 m!638729))

(declare-fun m!638743 () Bool)

(assert (=> b!668386 m!638743))

(declare-fun m!638745 () Bool)

(assert (=> b!668386 m!638745))

(declare-fun m!638747 () Bool)

(assert (=> b!668386 m!638747))

(declare-fun m!638749 () Bool)

(assert (=> b!668386 m!638749))

(declare-fun m!638751 () Bool)

(assert (=> b!668386 m!638751))

(declare-fun m!638753 () Bool)

(assert (=> start!60048 m!638753))

(assert (=> b!668402 m!638727))

(assert (=> b!668402 m!638729))

(declare-fun m!638755 () Bool)

(assert (=> b!668402 m!638755))

(declare-fun m!638757 () Bool)

(assert (=> b!668402 m!638757))

(assert (=> b!668402 m!638729))

(assert (=> b!668402 m!638755))

(assert (=> b!668402 m!638737))

(assert (=> b!668402 m!638749))

(declare-fun m!638759 () Bool)

(assert (=> b!668385 m!638759))

(declare-fun m!638761 () Bool)

(assert (=> b!668390 m!638761))

(declare-fun m!638763 () Bool)

(assert (=> b!668381 m!638763))

(declare-fun m!638765 () Bool)

(assert (=> b!668384 m!638765))

(declare-fun m!638767 () Bool)

(assert (=> b!668398 m!638767))

(assert (=> b!668395 m!638759))

(declare-fun m!638769 () Bool)

(assert (=> b!668378 m!638769))

(push 1)

(assert (not b!668400))

(assert (not b!668378))

(assert (not b!668385))

(assert (not b!668380))

(assert (not b!668398))

(assert (not b!668388))

(assert (not b!668382))

(assert (not b!668389))

(assert (not b!668399))

(assert (not start!60048))

(assert (not b!668384))

(assert (not b!668381))

(assert (not b!668392))

(assert (not b!668395))

(assert (not b!668402))

(assert (not b!668391))

(assert (not b!668390))

(assert (not b!668386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

