; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60106 () Bool)

(assert start!60106)

(declare-fun b!668602 () Bool)

(declare-fun e!382574 () Bool)

(declare-datatypes ((List!12683 0))(
  ( (Nil!12680) (Cons!12679 (h!13727 (_ BitVec 64)) (t!18903 List!12683)) )
))
(declare-fun acc!681 () List!12683)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3335 (List!12683 (_ BitVec 64)) Bool)

(assert (=> b!668602 (= e!382574 (contains!3335 acc!681 k!2843))))

(declare-fun b!668604 () Bool)

(declare-fun res!435567 () Bool)

(declare-fun e!382581 () Bool)

(assert (=> b!668604 (=> (not res!435567) (not e!382581))))

(assert (=> b!668604 (= res!435567 (not (contains!3335 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668605 () Bool)

(declare-fun e!382571 () Bool)

(declare-fun lt!311305 () List!12683)

(assert (=> b!668605 (= e!382571 (not (contains!3335 lt!311305 k!2843)))))

(declare-fun b!668606 () Bool)

(declare-fun res!435557 () Bool)

(assert (=> b!668606 (=> (not res!435557) (not e!382581))))

(assert (=> b!668606 (= res!435557 (not (contains!3335 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668607 () Bool)

(declare-fun res!435563 () Bool)

(declare-fun e!382575 () Bool)

(assert (=> b!668607 (=> res!435563 e!382575)))

(assert (=> b!668607 (= res!435563 (contains!3335 lt!311305 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668608 () Bool)

(declare-fun res!435552 () Bool)

(assert (=> b!668608 (=> (not res!435552) (not e!382581))))

(declare-datatypes ((array!39091 0))(
  ( (array!39092 (arr!18735 (Array (_ BitVec 32) (_ BitVec 64))) (size!19099 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39091)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39091 (_ BitVec 32) List!12683) Bool)

(assert (=> b!668608 (= res!435552 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668609 () Bool)

(declare-datatypes ((Unit!23404 0))(
  ( (Unit!23405) )
))
(declare-fun e!382578 () Unit!23404)

(declare-fun lt!311298 () Unit!23404)

(assert (=> b!668609 (= e!382578 lt!311298)))

(declare-fun lt!311302 () Unit!23404)

(declare-fun lemmaListSubSeqRefl!0 (List!12683) Unit!23404)

(assert (=> b!668609 (= lt!311302 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!97 (List!12683 List!12683) Bool)

(assert (=> b!668609 (subseq!97 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39091 List!12683 List!12683 (_ BitVec 32)) Unit!23404)

(declare-fun $colon$colon!226 (List!12683 (_ BitVec 64)) List!12683)

(assert (=> b!668609 (= lt!311298 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!226 acc!681 (select (arr!18735 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668609 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668610 () Bool)

(declare-fun res!435558 () Bool)

(assert (=> b!668610 (=> (not res!435558) (not e!382581))))

(declare-fun arrayContainsKey!0 (array!39091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668610 (= res!435558 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668611 () Bool)

(declare-fun e!382579 () Bool)

(assert (=> b!668611 (= e!382579 (not (contains!3335 acc!681 k!2843)))))

(declare-fun b!668612 () Bool)

(declare-fun res!435553 () Bool)

(assert (=> b!668612 (=> res!435553 e!382575)))

(declare-fun noDuplicate!609 (List!12683) Bool)

(assert (=> b!668612 (= res!435553 (not (noDuplicate!609 lt!311305)))))

(declare-fun b!668613 () Bool)

(declare-fun res!435560 () Bool)

(assert (=> b!668613 (=> (not res!435560) (not e!382581))))

(declare-fun e!382573 () Bool)

(assert (=> b!668613 (= res!435560 e!382573)))

(declare-fun res!435564 () Bool)

(assert (=> b!668613 (=> res!435564 e!382573)))

(assert (=> b!668613 (= res!435564 e!382574)))

(declare-fun res!435565 () Bool)

(assert (=> b!668613 (=> (not res!435565) (not e!382574))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668613 (= res!435565 (bvsgt from!3004 i!1382))))

(declare-fun b!668614 () Bool)

(declare-fun e!382576 () Bool)

(assert (=> b!668614 (= e!382576 (contains!3335 lt!311305 k!2843))))

(declare-fun b!668615 () Bool)

(declare-fun res!435556 () Bool)

(assert (=> b!668615 (=> (not res!435556) (not e!382581))))

(assert (=> b!668615 (= res!435556 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19099 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668616 () Bool)

(declare-fun e!382572 () Unit!23404)

(declare-fun Unit!23406 () Unit!23404)

(assert (=> b!668616 (= e!382572 Unit!23406)))

(declare-fun b!668617 () Bool)

(declare-fun res!435559 () Bool)

(assert (=> b!668617 (=> (not res!435559) (not e!382581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668617 (= res!435559 (validKeyInArray!0 k!2843))))

(declare-fun b!668618 () Bool)

(declare-fun e!382577 () Bool)

(assert (=> b!668618 (= e!382577 e!382571)))

(declare-fun res!435551 () Bool)

(assert (=> b!668618 (=> (not res!435551) (not e!382571))))

(assert (=> b!668618 (= res!435551 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668619 () Bool)

(declare-fun Unit!23407 () Unit!23404)

(assert (=> b!668619 (= e!382572 Unit!23407)))

(declare-fun lt!311297 () Unit!23404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39091 (_ BitVec 64) (_ BitVec 32)) Unit!23404)

(assert (=> b!668619 (= lt!311297 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668619 false))

(declare-fun b!668620 () Bool)

(declare-fun res!435554 () Bool)

(assert (=> b!668620 (=> (not res!435554) (not e!382581))))

(assert (=> b!668620 (= res!435554 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12680))))

(declare-fun b!668603 () Bool)

(declare-fun res!435569 () Bool)

(assert (=> b!668603 (=> res!435569 e!382575)))

(assert (=> b!668603 (= res!435569 (contains!3335 lt!311305 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!435562 () Bool)

(assert (=> start!60106 (=> (not res!435562) (not e!382581))))

(assert (=> start!60106 (= res!435562 (and (bvslt (size!19099 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19099 a!3626))))))

(assert (=> start!60106 e!382581))

(assert (=> start!60106 true))

(declare-fun array_inv!14594 (array!39091) Bool)

(assert (=> start!60106 (array_inv!14594 a!3626)))

(declare-fun b!668621 () Bool)

(assert (=> b!668621 (= e!382575 true)))

(declare-fun lt!311296 () Bool)

(assert (=> b!668621 (= lt!311296 e!382577)))

(declare-fun res!435571 () Bool)

(assert (=> b!668621 (=> res!435571 e!382577)))

(assert (=> b!668621 (= res!435571 e!382576)))

(declare-fun res!435568 () Bool)

(assert (=> b!668621 (=> (not res!435568) (not e!382576))))

(assert (=> b!668621 (= res!435568 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668622 () Bool)

(declare-fun Unit!23408 () Unit!23404)

(assert (=> b!668622 (= e!382578 Unit!23408)))

(declare-fun b!668623 () Bool)

(declare-fun res!435561 () Bool)

(assert (=> b!668623 (=> (not res!435561) (not e!382581))))

(assert (=> b!668623 (= res!435561 (noDuplicate!609 acc!681))))

(declare-fun b!668624 () Bool)

(assert (=> b!668624 (= e!382581 (not e!382575))))

(declare-fun res!435555 () Bool)

(assert (=> b!668624 (=> res!435555 e!382575)))

(assert (=> b!668624 (= res!435555 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668624 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311305)))

(declare-fun lt!311301 () Unit!23404)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39091 (_ BitVec 64) (_ BitVec 32) List!12683 List!12683) Unit!23404)

(assert (=> b!668624 (= lt!311301 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311305))))

(declare-fun -!94 (List!12683 (_ BitVec 64)) List!12683)

(assert (=> b!668624 (= (-!94 lt!311305 k!2843) acc!681)))

(assert (=> b!668624 (= lt!311305 ($colon$colon!226 acc!681 k!2843))))

(declare-fun lt!311303 () Unit!23404)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12683) Unit!23404)

(assert (=> b!668624 (= lt!311303 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!668624 (subseq!97 acc!681 acc!681)))

(declare-fun lt!311299 () Unit!23404)

(assert (=> b!668624 (= lt!311299 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668624 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311300 () Unit!23404)

(assert (=> b!668624 (= lt!311300 e!382578)))

(declare-fun c!76894 () Bool)

(assert (=> b!668624 (= c!76894 (validKeyInArray!0 (select (arr!18735 a!3626) from!3004)))))

(declare-fun lt!311304 () Unit!23404)

(assert (=> b!668624 (= lt!311304 e!382572)))

(declare-fun c!76895 () Bool)

(assert (=> b!668624 (= c!76895 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668624 (arrayContainsKey!0 (array!39092 (store (arr!18735 a!3626) i!1382 k!2843) (size!19099 a!3626)) k!2843 from!3004)))

(declare-fun b!668625 () Bool)

(declare-fun res!435566 () Bool)

(assert (=> b!668625 (=> (not res!435566) (not e!382581))))

(assert (=> b!668625 (= res!435566 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19099 a!3626))))))

(declare-fun b!668626 () Bool)

(assert (=> b!668626 (= e!382573 e!382579)))

(declare-fun res!435570 () Bool)

(assert (=> b!668626 (=> (not res!435570) (not e!382579))))

(assert (=> b!668626 (= res!435570 (bvsle from!3004 i!1382))))

(assert (= (and start!60106 res!435562) b!668623))

(assert (= (and b!668623 res!435561) b!668604))

(assert (= (and b!668604 res!435567) b!668606))

(assert (= (and b!668606 res!435557) b!668613))

(assert (= (and b!668613 res!435565) b!668602))

(assert (= (and b!668613 (not res!435564)) b!668626))

(assert (= (and b!668626 res!435570) b!668611))

(assert (= (and b!668613 res!435560) b!668620))

(assert (= (and b!668620 res!435554) b!668608))

(assert (= (and b!668608 res!435552) b!668625))

(assert (= (and b!668625 res!435566) b!668617))

(assert (= (and b!668617 res!435559) b!668610))

(assert (= (and b!668610 res!435558) b!668615))

(assert (= (and b!668615 res!435556) b!668624))

(assert (= (and b!668624 c!76895) b!668619))

(assert (= (and b!668624 (not c!76895)) b!668616))

(assert (= (and b!668624 c!76894) b!668609))

(assert (= (and b!668624 (not c!76894)) b!668622))

(assert (= (and b!668624 (not res!435555)) b!668612))

(assert (= (and b!668612 (not res!435553)) b!668603))

(assert (= (and b!668603 (not res!435569)) b!668607))

(assert (= (and b!668607 (not res!435563)) b!668621))

(assert (= (and b!668621 res!435568) b!668614))

(assert (= (and b!668621 (not res!435571)) b!668618))

(assert (= (and b!668618 res!435551) b!668605))

(declare-fun m!639411 () Bool)

(assert (=> b!668620 m!639411))

(declare-fun m!639413 () Bool)

(assert (=> b!668617 m!639413))

(declare-fun m!639415 () Bool)

(assert (=> b!668606 m!639415))

(declare-fun m!639417 () Bool)

(assert (=> b!668602 m!639417))

(declare-fun m!639419 () Bool)

(assert (=> b!668605 m!639419))

(declare-fun m!639421 () Bool)

(assert (=> b!668604 m!639421))

(declare-fun m!639423 () Bool)

(assert (=> b!668603 m!639423))

(declare-fun m!639425 () Bool)

(assert (=> b!668607 m!639425))

(declare-fun m!639427 () Bool)

(assert (=> b!668612 m!639427))

(assert (=> b!668614 m!639419))

(declare-fun m!639429 () Bool)

(assert (=> b!668623 m!639429))

(assert (=> b!668611 m!639417))

(declare-fun m!639431 () Bool)

(assert (=> start!60106 m!639431))

(declare-fun m!639433 () Bool)

(assert (=> b!668608 m!639433))

(declare-fun m!639435 () Bool)

(assert (=> b!668609 m!639435))

(declare-fun m!639437 () Bool)

(assert (=> b!668609 m!639437))

(declare-fun m!639439 () Bool)

(assert (=> b!668609 m!639439))

(declare-fun m!639441 () Bool)

(assert (=> b!668609 m!639441))

(assert (=> b!668609 m!639437))

(assert (=> b!668609 m!639439))

(declare-fun m!639443 () Bool)

(assert (=> b!668609 m!639443))

(declare-fun m!639445 () Bool)

(assert (=> b!668609 m!639445))

(declare-fun m!639447 () Bool)

(assert (=> b!668610 m!639447))

(declare-fun m!639449 () Bool)

(assert (=> b!668619 m!639449))

(declare-fun m!639451 () Bool)

(assert (=> b!668624 m!639451))

(assert (=> b!668624 m!639435))

(assert (=> b!668624 m!639437))

(declare-fun m!639453 () Bool)

(assert (=> b!668624 m!639453))

(declare-fun m!639455 () Bool)

(assert (=> b!668624 m!639455))

(declare-fun m!639457 () Bool)

(assert (=> b!668624 m!639457))

(declare-fun m!639459 () Bool)

(assert (=> b!668624 m!639459))

(assert (=> b!668624 m!639443))

(declare-fun m!639461 () Bool)

(assert (=> b!668624 m!639461))

(declare-fun m!639463 () Bool)

(assert (=> b!668624 m!639463))

(assert (=> b!668624 m!639437))

(declare-fun m!639465 () Bool)

(assert (=> b!668624 m!639465))

(declare-fun m!639467 () Bool)

(assert (=> b!668624 m!639467))

(assert (=> b!668624 m!639445))

(push 1)

(assert (not b!668608))

(assert (not b!668617))

(assert (not b!668609))

(assert (not b!668604))

(assert (not b!668606))

(assert (not b!668605))

(assert (not b!668620))

(assert (not b!668602))

(assert (not start!60106))

(assert (not b!668607))

(assert (not b!668623))

(assert (not b!668610))

(assert (not b!668614))

(assert (not b!668624))

(assert (not b!668619))

(assert (not b!668611))

(assert (not b!668612))

(assert (not b!668603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

