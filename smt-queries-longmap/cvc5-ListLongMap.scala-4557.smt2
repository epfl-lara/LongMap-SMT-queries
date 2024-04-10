; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63514 () Bool)

(assert start!63514)

(declare-fun b!715514 () Bool)

(declare-fun res!478501 () Bool)

(declare-fun e!401873 () Bool)

(assert (=> b!715514 (=> (not res!478501) (not e!401873))))

(declare-datatypes ((array!40528 0))(
  ( (array!40529 (arr!19401 (Array (_ BitVec 32) (_ BitVec 64))) (size!19817 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40528)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13442 0))(
  ( (Nil!13439) (Cons!13438 (h!14483 (_ BitVec 64)) (t!19757 List!13442)) )
))
(declare-fun acc!652 () List!13442)

(declare-fun arrayNoDuplicates!0 (array!40528 (_ BitVec 32) List!13442) Bool)

(assert (=> b!715514 (= res!478501 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715515 () Bool)

(declare-fun res!478499 () Bool)

(assert (=> b!715515 (=> (not res!478499) (not e!401873))))

(assert (=> b!715515 (= res!478499 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715516 () Bool)

(declare-fun res!478494 () Bool)

(assert (=> b!715516 (=> (not res!478494) (not e!401873))))

(declare-fun newAcc!49 () List!13442)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!429 (List!13442 (_ BitVec 64)) List!13442)

(assert (=> b!715516 (= res!478494 (= (-!429 newAcc!49 k!2824) acc!652))))

(declare-fun b!715517 () Bool)

(declare-fun res!478487 () Bool)

(assert (=> b!715517 (=> (not res!478487) (not e!401873))))

(declare-fun contains!4019 (List!13442 (_ BitVec 64)) Bool)

(assert (=> b!715517 (= res!478487 (not (contains!4019 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715518 () Bool)

(declare-fun res!478486 () Bool)

(assert (=> b!715518 (=> (not res!478486) (not e!401873))))

(assert (=> b!715518 (= res!478486 (not (contains!4019 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715519 () Bool)

(declare-fun res!478500 () Bool)

(assert (=> b!715519 (=> (not res!478500) (not e!401873))))

(declare-fun noDuplicate!1266 (List!13442) Bool)

(assert (=> b!715519 (= res!478500 (noDuplicate!1266 newAcc!49))))

(declare-fun b!715520 () Bool)

(declare-fun res!478495 () Bool)

(assert (=> b!715520 (=> (not res!478495) (not e!401873))))

(assert (=> b!715520 (= res!478495 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19817 a!3591)))))

(declare-fun b!715521 () Bool)

(declare-fun res!478492 () Bool)

(assert (=> b!715521 (=> (not res!478492) (not e!401873))))

(declare-fun subseq!464 (List!13442 List!13442) Bool)

(assert (=> b!715521 (= res!478492 (subseq!464 acc!652 newAcc!49))))

(declare-fun b!715522 () Bool)

(declare-fun res!478484 () Bool)

(assert (=> b!715522 (=> (not res!478484) (not e!401873))))

(assert (=> b!715522 (= res!478484 (not (contains!4019 acc!652 k!2824)))))

(declare-fun b!715523 () Bool)

(declare-fun res!478490 () Bool)

(assert (=> b!715523 (=> (not res!478490) (not e!401873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715523 (= res!478490 (validKeyInArray!0 k!2824))))

(declare-fun b!715525 () Bool)

(declare-fun res!478489 () Bool)

(assert (=> b!715525 (=> (not res!478489) (not e!401873))))

(assert (=> b!715525 (= res!478489 (not (contains!4019 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715526 () Bool)

(declare-fun res!478488 () Bool)

(assert (=> b!715526 (=> (not res!478488) (not e!401873))))

(declare-fun arrayContainsKey!0 (array!40528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715526 (= res!478488 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715527 () Bool)

(declare-fun res!478485 () Bool)

(assert (=> b!715527 (=> (not res!478485) (not e!401873))))

(assert (=> b!715527 (= res!478485 (not (validKeyInArray!0 (select (arr!19401 a!3591) from!2969))))))

(declare-fun b!715528 () Bool)

(declare-fun res!478497 () Bool)

(assert (=> b!715528 (=> (not res!478497) (not e!401873))))

(assert (=> b!715528 (= res!478497 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715529 () Bool)

(declare-fun res!478491 () Bool)

(assert (=> b!715529 (=> (not res!478491) (not e!401873))))

(assert (=> b!715529 (= res!478491 (noDuplicate!1266 acc!652))))

(declare-fun res!478496 () Bool)

(assert (=> start!63514 (=> (not res!478496) (not e!401873))))

(assert (=> start!63514 (= res!478496 (and (bvslt (size!19817 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19817 a!3591))))))

(assert (=> start!63514 e!401873))

(assert (=> start!63514 true))

(declare-fun array_inv!15197 (array!40528) Bool)

(assert (=> start!63514 (array_inv!15197 a!3591)))

(declare-fun b!715524 () Bool)

(declare-fun res!478498 () Bool)

(assert (=> b!715524 (=> (not res!478498) (not e!401873))))

(assert (=> b!715524 (= res!478498 (contains!4019 newAcc!49 k!2824))))

(declare-fun b!715530 () Bool)

(assert (=> b!715530 (= e!401873 false)))

(declare-fun lt!318845 () Bool)

(assert (=> b!715530 (= lt!318845 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715531 () Bool)

(declare-fun res!478493 () Bool)

(assert (=> b!715531 (=> (not res!478493) (not e!401873))))

(assert (=> b!715531 (= res!478493 (not (contains!4019 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63514 res!478496) b!715529))

(assert (= (and b!715529 res!478491) b!715519))

(assert (= (and b!715519 res!478500) b!715531))

(assert (= (and b!715531 res!478493) b!715525))

(assert (= (and b!715525 res!478489) b!715526))

(assert (= (and b!715526 res!478488) b!715522))

(assert (= (and b!715522 res!478484) b!715523))

(assert (= (and b!715523 res!478490) b!715514))

(assert (= (and b!715514 res!478501) b!715521))

(assert (= (and b!715521 res!478492) b!715524))

(assert (= (and b!715524 res!478498) b!715516))

(assert (= (and b!715516 res!478494) b!715518))

(assert (= (and b!715518 res!478486) b!715517))

(assert (= (and b!715517 res!478487) b!715520))

(assert (= (and b!715520 res!478495) b!715527))

(assert (= (and b!715527 res!478485) b!715515))

(assert (= (and b!715515 res!478499) b!715528))

(assert (= (and b!715528 res!478497) b!715530))

(declare-fun m!671731 () Bool)

(assert (=> b!715514 m!671731))

(declare-fun m!671733 () Bool)

(assert (=> b!715523 m!671733))

(declare-fun m!671735 () Bool)

(assert (=> b!715531 m!671735))

(declare-fun m!671737 () Bool)

(assert (=> b!715518 m!671737))

(declare-fun m!671739 () Bool)

(assert (=> b!715521 m!671739))

(declare-fun m!671741 () Bool)

(assert (=> b!715526 m!671741))

(declare-fun m!671743 () Bool)

(assert (=> b!715519 m!671743))

(declare-fun m!671745 () Bool)

(assert (=> b!715524 m!671745))

(declare-fun m!671747 () Bool)

(assert (=> b!715525 m!671747))

(declare-fun m!671749 () Bool)

(assert (=> b!715528 m!671749))

(declare-fun m!671751 () Bool)

(assert (=> b!715517 m!671751))

(declare-fun m!671753 () Bool)

(assert (=> start!63514 m!671753))

(declare-fun m!671755 () Bool)

(assert (=> b!715530 m!671755))

(declare-fun m!671757 () Bool)

(assert (=> b!715527 m!671757))

(assert (=> b!715527 m!671757))

(declare-fun m!671759 () Bool)

(assert (=> b!715527 m!671759))

(declare-fun m!671761 () Bool)

(assert (=> b!715522 m!671761))

(declare-fun m!671763 () Bool)

(assert (=> b!715529 m!671763))

(declare-fun m!671765 () Bool)

(assert (=> b!715516 m!671765))

(push 1)

(assert (not b!715524))

(assert (not b!715526))

(assert (not b!715527))

(assert (not b!715518))

(assert (not b!715522))

(assert (not b!715525))

(assert (not b!715521))

(assert (not b!715531))

(assert (not b!715530))

(assert (not b!715528))

(assert (not b!715517))

(assert (not b!715519))

(assert (not b!715523))

(assert (not b!715516))

(assert (not b!715529))

(assert (not start!63514))

(assert (not b!715514))

(check-sat)

(pop 1)

