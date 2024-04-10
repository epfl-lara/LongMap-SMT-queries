; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62468 () Bool)

(assert start!62468)

(declare-fun b!702662 () Bool)

(declare-fun res!466493 () Bool)

(declare-fun e!397528 () Bool)

(assert (=> b!702662 (=> (not res!466493) (not e!397528))))

(declare-datatypes ((List!13271 0))(
  ( (Nil!13268) (Cons!13267 (h!14312 (_ BitVec 64)) (t!19553 List!13271)) )
))
(declare-fun newAcc!49 () List!13271)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3848 (List!13271 (_ BitVec 64)) Bool)

(assert (=> b!702662 (= res!466493 (contains!3848 newAcc!49 k!2824))))

(declare-fun b!702663 () Bool)

(declare-fun res!466479 () Bool)

(assert (=> b!702663 (=> (not res!466479) (not e!397528))))

(declare-fun acc!652 () List!13271)

(assert (=> b!702663 (= res!466479 (not (contains!3848 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702664 () Bool)

(declare-fun res!466490 () Bool)

(declare-fun e!397527 () Bool)

(assert (=> b!702664 (=> (not res!466490) (not e!397527))))

(declare-fun lt!317722 () List!13271)

(assert (=> b!702664 (= res!466490 (not (contains!3848 lt!317722 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702665 () Bool)

(declare-fun res!466474 () Bool)

(assert (=> b!702665 (=> (not res!466474) (not e!397528))))

(declare-datatypes ((array!40147 0))(
  ( (array!40148 (arr!19230 (Array (_ BitVec 32) (_ BitVec 64))) (size!19615 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40147)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702665 (= res!466474 (validKeyInArray!0 (select (arr!19230 a!3591) from!2969)))))

(declare-fun b!702666 () Bool)

(declare-fun res!466473 () Bool)

(assert (=> b!702666 (=> (not res!466473) (not e!397527))))

(declare-fun lt!317724 () List!13271)

(declare-fun noDuplicate!1095 (List!13271) Bool)

(assert (=> b!702666 (= res!466473 (noDuplicate!1095 lt!317724))))

(declare-fun b!702667 () Bool)

(declare-fun res!466498 () Bool)

(assert (=> b!702667 (=> (not res!466498) (not e!397527))))

(assert (=> b!702667 (= res!466498 (not (contains!3848 lt!317724 k!2824)))))

(declare-fun b!702669 () Bool)

(declare-fun res!466500 () Bool)

(assert (=> b!702669 (=> (not res!466500) (not e!397528))))

(assert (=> b!702669 (= res!466500 (not (contains!3848 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702670 () Bool)

(declare-fun res!466492 () Bool)

(assert (=> b!702670 (=> (not res!466492) (not e!397528))))

(assert (=> b!702670 (= res!466492 (not (contains!3848 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702671 () Bool)

(assert (=> b!702671 (= e!397528 e!397527)))

(declare-fun res!466489 () Bool)

(assert (=> b!702671 (=> (not res!466489) (not e!397527))))

(assert (=> b!702671 (= res!466489 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!491 (List!13271 (_ BitVec 64)) List!13271)

(assert (=> b!702671 (= lt!317722 ($colon$colon!491 newAcc!49 (select (arr!19230 a!3591) from!2969)))))

(assert (=> b!702671 (= lt!317724 ($colon$colon!491 acc!652 (select (arr!19230 a!3591) from!2969)))))

(declare-fun b!702672 () Bool)

(declare-fun res!466491 () Bool)

(assert (=> b!702672 (=> (not res!466491) (not e!397528))))

(assert (=> b!702672 (= res!466491 (noDuplicate!1095 acc!652))))

(declare-fun b!702673 () Bool)

(declare-fun res!466477 () Bool)

(assert (=> b!702673 (=> (not res!466477) (not e!397527))))

(declare-fun subseq!293 (List!13271 List!13271) Bool)

(assert (=> b!702673 (= res!466477 (subseq!293 lt!317724 lt!317722))))

(declare-fun b!702674 () Bool)

(declare-fun res!466497 () Bool)

(assert (=> b!702674 (=> (not res!466497) (not e!397527))))

(assert (=> b!702674 (= res!466497 (contains!3848 lt!317722 k!2824))))

(declare-fun b!702675 () Bool)

(declare-fun res!466480 () Bool)

(assert (=> b!702675 (=> (not res!466480) (not e!397527))))

(declare-fun arrayNoDuplicates!0 (array!40147 (_ BitVec 32) List!13271) Bool)

(assert (=> b!702675 (= res!466480 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317724))))

(declare-fun b!702676 () Bool)

(declare-fun res!466472 () Bool)

(assert (=> b!702676 (=> (not res!466472) (not e!397528))))

(assert (=> b!702676 (= res!466472 (not (contains!3848 acc!652 k!2824)))))

(declare-fun b!702677 () Bool)

(declare-fun res!466482 () Bool)

(assert (=> b!702677 (=> (not res!466482) (not e!397527))))

(assert (=> b!702677 (= res!466482 (noDuplicate!1095 lt!317722))))

(declare-fun b!702678 () Bool)

(declare-fun res!466478 () Bool)

(assert (=> b!702678 (=> (not res!466478) (not e!397528))))

(declare-fun -!258 (List!13271 (_ BitVec 64)) List!13271)

(assert (=> b!702678 (= res!466478 (= (-!258 newAcc!49 k!2824) acc!652))))

(declare-fun b!702679 () Bool)

(declare-fun res!466485 () Bool)

(assert (=> b!702679 (=> (not res!466485) (not e!397527))))

(assert (=> b!702679 (= res!466485 (not (contains!3848 lt!317724 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702680 () Bool)

(declare-fun res!466484 () Bool)

(assert (=> b!702680 (=> (not res!466484) (not e!397527))))

(assert (=> b!702680 (= res!466484 (= (-!258 lt!317722 k!2824) lt!317724))))

(declare-fun b!702681 () Bool)

(declare-fun res!466476 () Bool)

(assert (=> b!702681 (=> (not res!466476) (not e!397527))))

(assert (=> b!702681 (= res!466476 (not (contains!3848 lt!317724 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702682 () Bool)

(declare-fun res!466486 () Bool)

(assert (=> b!702682 (=> (not res!466486) (not e!397528))))

(assert (=> b!702682 (= res!466486 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19615 a!3591)))))

(declare-fun res!466481 () Bool)

(assert (=> start!62468 (=> (not res!466481) (not e!397528))))

(assert (=> start!62468 (= res!466481 (and (bvslt (size!19615 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19615 a!3591))))))

(assert (=> start!62468 e!397528))

(assert (=> start!62468 true))

(declare-fun array_inv!15026 (array!40147) Bool)

(assert (=> start!62468 (array_inv!15026 a!3591)))

(declare-fun b!702668 () Bool)

(declare-fun res!466483 () Bool)

(assert (=> b!702668 (=> (not res!466483) (not e!397528))))

(assert (=> b!702668 (= res!466483 (subseq!293 acc!652 newAcc!49))))

(declare-fun b!702683 () Bool)

(declare-fun res!466488 () Bool)

(assert (=> b!702683 (=> (not res!466488) (not e!397528))))

(assert (=> b!702683 (= res!466488 (validKeyInArray!0 k!2824))))

(declare-fun b!702684 () Bool)

(assert (=> b!702684 (= e!397527 (not true))))

(assert (=> b!702684 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317722)))

(declare-datatypes ((Unit!24594 0))(
  ( (Unit!24595) )
))
(declare-fun lt!317723 () Unit!24594)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40147 (_ BitVec 64) (_ BitVec 32) List!13271 List!13271) Unit!24594)

(assert (=> b!702684 (= lt!317723 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317724 lt!317722))))

(declare-fun b!702685 () Bool)

(declare-fun res!466475 () Bool)

(assert (=> b!702685 (=> (not res!466475) (not e!397527))))

(assert (=> b!702685 (= res!466475 (not (contains!3848 lt!317722 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702686 () Bool)

(declare-fun res!466495 () Bool)

(assert (=> b!702686 (=> (not res!466495) (not e!397528))))

(assert (=> b!702686 (= res!466495 (not (contains!3848 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702687 () Bool)

(declare-fun res!466494 () Bool)

(assert (=> b!702687 (=> (not res!466494) (not e!397528))))

(declare-fun arrayContainsKey!0 (array!40147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702687 (= res!466494 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!702688 () Bool)

(declare-fun res!466487 () Bool)

(assert (=> b!702688 (=> (not res!466487) (not e!397528))))

(assert (=> b!702688 (= res!466487 (noDuplicate!1095 newAcc!49))))

(declare-fun b!702689 () Bool)

(declare-fun res!466499 () Bool)

(assert (=> b!702689 (=> (not res!466499) (not e!397527))))

(assert (=> b!702689 (= res!466499 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702690 () Bool)

(declare-fun res!466496 () Bool)

(assert (=> b!702690 (=> (not res!466496) (not e!397528))))

(assert (=> b!702690 (= res!466496 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62468 res!466481) b!702672))

(assert (= (and b!702672 res!466491) b!702688))

(assert (= (and b!702688 res!466487) b!702663))

(assert (= (and b!702663 res!466479) b!702669))

(assert (= (and b!702669 res!466500) b!702687))

(assert (= (and b!702687 res!466494) b!702676))

(assert (= (and b!702676 res!466472) b!702683))

(assert (= (and b!702683 res!466488) b!702690))

(assert (= (and b!702690 res!466496) b!702668))

(assert (= (and b!702668 res!466483) b!702662))

(assert (= (and b!702662 res!466493) b!702678))

(assert (= (and b!702678 res!466478) b!702686))

(assert (= (and b!702686 res!466495) b!702670))

(assert (= (and b!702670 res!466492) b!702682))

(assert (= (and b!702682 res!466486) b!702665))

(assert (= (and b!702665 res!466474) b!702671))

(assert (= (and b!702671 res!466489) b!702666))

(assert (= (and b!702666 res!466473) b!702677))

(assert (= (and b!702677 res!466482) b!702681))

(assert (= (and b!702681 res!466476) b!702679))

(assert (= (and b!702679 res!466485) b!702689))

(assert (= (and b!702689 res!466499) b!702667))

(assert (= (and b!702667 res!466498) b!702675))

(assert (= (and b!702675 res!466480) b!702673))

(assert (= (and b!702673 res!466477) b!702674))

(assert (= (and b!702674 res!466497) b!702680))

(assert (= (and b!702680 res!466484) b!702685))

(assert (= (and b!702685 res!466475) b!702664))

(assert (= (and b!702664 res!466490) b!702684))

(declare-fun m!661699 () Bool)

(assert (=> b!702680 m!661699))

(declare-fun m!661701 () Bool)

(assert (=> b!702681 m!661701))

(declare-fun m!661703 () Bool)

(assert (=> b!702677 m!661703))

(declare-fun m!661705 () Bool)

(assert (=> b!702689 m!661705))

(declare-fun m!661707 () Bool)

(assert (=> b!702688 m!661707))

(declare-fun m!661709 () Bool)

(assert (=> b!702687 m!661709))

(declare-fun m!661711 () Bool)

(assert (=> start!62468 m!661711))

(declare-fun m!661713 () Bool)

(assert (=> b!702665 m!661713))

(assert (=> b!702665 m!661713))

(declare-fun m!661715 () Bool)

(assert (=> b!702665 m!661715))

(declare-fun m!661717 () Bool)

(assert (=> b!702675 m!661717))

(declare-fun m!661719 () Bool)

(assert (=> b!702669 m!661719))

(declare-fun m!661721 () Bool)

(assert (=> b!702666 m!661721))

(declare-fun m!661723 () Bool)

(assert (=> b!702673 m!661723))

(declare-fun m!661725 () Bool)

(assert (=> b!702664 m!661725))

(assert (=> b!702671 m!661713))

(assert (=> b!702671 m!661713))

(declare-fun m!661727 () Bool)

(assert (=> b!702671 m!661727))

(assert (=> b!702671 m!661713))

(declare-fun m!661729 () Bool)

(assert (=> b!702671 m!661729))

(declare-fun m!661731 () Bool)

(assert (=> b!702679 m!661731))

(declare-fun m!661733 () Bool)

(assert (=> b!702678 m!661733))

(declare-fun m!661735 () Bool)

(assert (=> b!702663 m!661735))

(declare-fun m!661737 () Bool)

(assert (=> b!702685 m!661737))

(declare-fun m!661739 () Bool)

(assert (=> b!702668 m!661739))

(declare-fun m!661741 () Bool)

(assert (=> b!702684 m!661741))

(declare-fun m!661743 () Bool)

(assert (=> b!702684 m!661743))

(declare-fun m!661745 () Bool)

(assert (=> b!702690 m!661745))

(declare-fun m!661747 () Bool)

(assert (=> b!702686 m!661747))

(declare-fun m!661749 () Bool)

(assert (=> b!702676 m!661749))

(declare-fun m!661751 () Bool)

(assert (=> b!702667 m!661751))

(declare-fun m!661753 () Bool)

(assert (=> b!702662 m!661753))

(declare-fun m!661755 () Bool)

(assert (=> b!702670 m!661755))

(declare-fun m!661757 () Bool)

(assert (=> b!702683 m!661757))

(declare-fun m!661759 () Bool)

(assert (=> b!702672 m!661759))

(declare-fun m!661761 () Bool)

(assert (=> b!702674 m!661761))

(push 1)

