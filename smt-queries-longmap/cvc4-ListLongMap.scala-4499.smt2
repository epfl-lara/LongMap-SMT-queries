; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62466 () Bool)

(assert start!62466)

(declare-fun b!702575 () Bool)

(declare-fun res!466389 () Bool)

(declare-fun e!397518 () Bool)

(assert (=> b!702575 (=> (not res!466389) (not e!397518))))

(declare-datatypes ((array!40145 0))(
  ( (array!40146 (arr!19229 (Array (_ BitVec 32) (_ BitVec 64))) (size!19614 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40145)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702575 (= res!466389 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702576 () Bool)

(declare-fun res!466405 () Bool)

(declare-fun e!397517 () Bool)

(assert (=> b!702576 (=> (not res!466405) (not e!397517))))

(declare-datatypes ((List!13270 0))(
  ( (Nil!13267) (Cons!13266 (h!14311 (_ BitVec 64)) (t!19552 List!13270)) )
))
(declare-fun acc!652 () List!13270)

(declare-fun newAcc!49 () List!13270)

(declare-fun -!257 (List!13270 (_ BitVec 64)) List!13270)

(assert (=> b!702576 (= res!466405 (= (-!257 newAcc!49 k!2824) acc!652))))

(declare-fun b!702577 () Bool)

(declare-fun res!466388 () Bool)

(assert (=> b!702577 (=> (not res!466388) (not e!397517))))

(declare-fun contains!3847 (List!13270 (_ BitVec 64)) Bool)

(assert (=> b!702577 (= res!466388 (contains!3847 newAcc!49 k!2824))))

(declare-fun b!702578 () Bool)

(declare-fun res!466400 () Bool)

(assert (=> b!702578 (=> (not res!466400) (not e!397517))))

(declare-fun arrayNoDuplicates!0 (array!40145 (_ BitVec 32) List!13270) Bool)

(assert (=> b!702578 (= res!466400 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702579 () Bool)

(declare-fun res!466394 () Bool)

(assert (=> b!702579 (=> (not res!466394) (not e!397517))))

(assert (=> b!702579 (= res!466394 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19614 a!3591)))))

(declare-fun b!702580 () Bool)

(declare-fun res!466409 () Bool)

(assert (=> b!702580 (=> (not res!466409) (not e!397517))))

(declare-fun subseq!292 (List!13270 List!13270) Bool)

(assert (=> b!702580 (= res!466409 (subseq!292 acc!652 newAcc!49))))

(declare-fun b!702581 () Bool)

(declare-fun res!466397 () Bool)

(assert (=> b!702581 (=> (not res!466397) (not e!397517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702581 (= res!466397 (validKeyInArray!0 (select (arr!19229 a!3591) from!2969)))))

(declare-fun b!702582 () Bool)

(declare-fun res!466387 () Bool)

(assert (=> b!702582 (=> (not res!466387) (not e!397517))))

(assert (=> b!702582 (= res!466387 (validKeyInArray!0 k!2824))))

(declare-fun b!702584 () Bool)

(declare-fun res!466393 () Bool)

(assert (=> b!702584 (=> (not res!466393) (not e!397517))))

(assert (=> b!702584 (= res!466393 (not (contains!3847 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702585 () Bool)

(declare-fun res!466413 () Bool)

(assert (=> b!702585 (=> (not res!466413) (not e!397518))))

(declare-fun lt!317715 () List!13270)

(assert (=> b!702585 (= res!466413 (not (contains!3847 lt!317715 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702586 () Bool)

(declare-fun res!466411 () Bool)

(assert (=> b!702586 (=> (not res!466411) (not e!397517))))

(declare-fun noDuplicate!1094 (List!13270) Bool)

(assert (=> b!702586 (= res!466411 (noDuplicate!1094 acc!652))))

(declare-fun b!702587 () Bool)

(declare-fun res!466402 () Bool)

(assert (=> b!702587 (=> (not res!466402) (not e!397518))))

(assert (=> b!702587 (= res!466402 (noDuplicate!1094 lt!317715))))

(declare-fun b!702588 () Bool)

(declare-fun res!466410 () Bool)

(assert (=> b!702588 (=> (not res!466410) (not e!397518))))

(declare-fun lt!317714 () List!13270)

(assert (=> b!702588 (= res!466410 (noDuplicate!1094 lt!317714))))

(declare-fun b!702589 () Bool)

(declare-fun res!466386 () Bool)

(assert (=> b!702589 (=> (not res!466386) (not e!397518))))

(assert (=> b!702589 (= res!466386 (contains!3847 lt!317714 k!2824))))

(declare-fun b!702590 () Bool)

(declare-fun res!466404 () Bool)

(assert (=> b!702590 (=> (not res!466404) (not e!397518))))

(assert (=> b!702590 (= res!466404 (not (contains!3847 lt!317715 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702591 () Bool)

(assert (=> b!702591 (= e!397517 e!397518)))

(declare-fun res!466392 () Bool)

(assert (=> b!702591 (=> (not res!466392) (not e!397518))))

(assert (=> b!702591 (= res!466392 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!490 (List!13270 (_ BitVec 64)) List!13270)

(assert (=> b!702591 (= lt!317714 ($colon$colon!490 newAcc!49 (select (arr!19229 a!3591) from!2969)))))

(assert (=> b!702591 (= lt!317715 ($colon$colon!490 acc!652 (select (arr!19229 a!3591) from!2969)))))

(declare-fun b!702592 () Bool)

(declare-fun res!466390 () Bool)

(assert (=> b!702592 (=> (not res!466390) (not e!397518))))

(assert (=> b!702592 (= res!466390 (not (contains!3847 lt!317714 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702593 () Bool)

(declare-fun res!466391 () Bool)

(assert (=> b!702593 (=> (not res!466391) (not e!397517))))

(assert (=> b!702593 (= res!466391 (not (contains!3847 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702594 () Bool)

(declare-fun res!466412 () Bool)

(assert (=> b!702594 (=> (not res!466412) (not e!397517))))

(assert (=> b!702594 (= res!466412 (not (contains!3847 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702595 () Bool)

(assert (=> b!702595 (= e!397518 (not true))))

(assert (=> b!702595 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317714)))

(declare-datatypes ((Unit!24592 0))(
  ( (Unit!24593) )
))
(declare-fun lt!317713 () Unit!24592)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40145 (_ BitVec 64) (_ BitVec 32) List!13270 List!13270) Unit!24592)

(assert (=> b!702595 (= lt!317713 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317715 lt!317714))))

(declare-fun b!702596 () Bool)

(declare-fun res!466395 () Bool)

(assert (=> b!702596 (=> (not res!466395) (not e!397517))))

(assert (=> b!702596 (= res!466395 (not (contains!3847 acc!652 k!2824)))))

(declare-fun b!702597 () Bool)

(declare-fun res!466385 () Bool)

(assert (=> b!702597 (=> (not res!466385) (not e!397518))))

(assert (=> b!702597 (= res!466385 (not (contains!3847 lt!317715 k!2824)))))

(declare-fun b!702598 () Bool)

(declare-fun res!466396 () Bool)

(assert (=> b!702598 (=> (not res!466396) (not e!397517))))

(assert (=> b!702598 (= res!466396 (not (contains!3847 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702599 () Bool)

(declare-fun res!466399 () Bool)

(assert (=> b!702599 (=> (not res!466399) (not e!397518))))

(assert (=> b!702599 (= res!466399 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317715))))

(declare-fun b!702600 () Bool)

(declare-fun res!466401 () Bool)

(assert (=> b!702600 (=> (not res!466401) (not e!397518))))

(assert (=> b!702600 (= res!466401 (= (-!257 lt!317714 k!2824) lt!317715))))

(declare-fun b!702601 () Bool)

(declare-fun res!466408 () Bool)

(assert (=> b!702601 (=> (not res!466408) (not e!397517))))

(assert (=> b!702601 (= res!466408 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!702583 () Bool)

(declare-fun res!466406 () Bool)

(assert (=> b!702583 (=> (not res!466406) (not e!397518))))

(assert (=> b!702583 (= res!466406 (not (contains!3847 lt!317714 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!466398 () Bool)

(assert (=> start!62466 (=> (not res!466398) (not e!397517))))

(assert (=> start!62466 (= res!466398 (and (bvslt (size!19614 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19614 a!3591))))))

(assert (=> start!62466 e!397517))

(assert (=> start!62466 true))

(declare-fun array_inv!15025 (array!40145) Bool)

(assert (=> start!62466 (array_inv!15025 a!3591)))

(declare-fun b!702602 () Bool)

(declare-fun res!466403 () Bool)

(assert (=> b!702602 (=> (not res!466403) (not e!397518))))

(assert (=> b!702602 (= res!466403 (subseq!292 lt!317715 lt!317714))))

(declare-fun b!702603 () Bool)

(declare-fun res!466407 () Bool)

(assert (=> b!702603 (=> (not res!466407) (not e!397517))))

(assert (=> b!702603 (= res!466407 (noDuplicate!1094 newAcc!49))))

(assert (= (and start!62466 res!466398) b!702586))

(assert (= (and b!702586 res!466411) b!702603))

(assert (= (and b!702603 res!466407) b!702598))

(assert (= (and b!702598 res!466396) b!702594))

(assert (= (and b!702594 res!466412) b!702601))

(assert (= (and b!702601 res!466408) b!702596))

(assert (= (and b!702596 res!466395) b!702582))

(assert (= (and b!702582 res!466387) b!702578))

(assert (= (and b!702578 res!466400) b!702580))

(assert (= (and b!702580 res!466409) b!702577))

(assert (= (and b!702577 res!466388) b!702576))

(assert (= (and b!702576 res!466405) b!702584))

(assert (= (and b!702584 res!466393) b!702593))

(assert (= (and b!702593 res!466391) b!702579))

(assert (= (and b!702579 res!466394) b!702581))

(assert (= (and b!702581 res!466397) b!702591))

(assert (= (and b!702591 res!466392) b!702587))

(assert (= (and b!702587 res!466402) b!702588))

(assert (= (and b!702588 res!466410) b!702585))

(assert (= (and b!702585 res!466413) b!702590))

(assert (= (and b!702590 res!466404) b!702575))

(assert (= (and b!702575 res!466389) b!702597))

(assert (= (and b!702597 res!466385) b!702599))

(assert (= (and b!702599 res!466399) b!702602))

(assert (= (and b!702602 res!466403) b!702589))

(assert (= (and b!702589 res!466386) b!702600))

(assert (= (and b!702600 res!466401) b!702583))

(assert (= (and b!702583 res!466406) b!702592))

(assert (= (and b!702592 res!466390) b!702595))

(declare-fun m!661635 () Bool)

(assert (=> b!702577 m!661635))

(declare-fun m!661637 () Bool)

(assert (=> b!702581 m!661637))

(assert (=> b!702581 m!661637))

(declare-fun m!661639 () Bool)

(assert (=> b!702581 m!661639))

(declare-fun m!661641 () Bool)

(assert (=> b!702596 m!661641))

(declare-fun m!661643 () Bool)

(assert (=> b!702602 m!661643))

(declare-fun m!661645 () Bool)

(assert (=> b!702578 m!661645))

(declare-fun m!661647 () Bool)

(assert (=> b!702589 m!661647))

(declare-fun m!661649 () Bool)

(assert (=> b!702599 m!661649))

(declare-fun m!661651 () Bool)

(assert (=> b!702587 m!661651))

(declare-fun m!661653 () Bool)

(assert (=> b!702603 m!661653))

(declare-fun m!661655 () Bool)

(assert (=> b!702598 m!661655))

(declare-fun m!661657 () Bool)

(assert (=> b!702597 m!661657))

(declare-fun m!661659 () Bool)

(assert (=> b!702600 m!661659))

(assert (=> b!702591 m!661637))

(assert (=> b!702591 m!661637))

(declare-fun m!661661 () Bool)

(assert (=> b!702591 m!661661))

(assert (=> b!702591 m!661637))

(declare-fun m!661663 () Bool)

(assert (=> b!702591 m!661663))

(declare-fun m!661665 () Bool)

(assert (=> b!702594 m!661665))

(declare-fun m!661667 () Bool)

(assert (=> start!62466 m!661667))

(declare-fun m!661669 () Bool)

(assert (=> b!702575 m!661669))

(declare-fun m!661671 () Bool)

(assert (=> b!702601 m!661671))

(declare-fun m!661673 () Bool)

(assert (=> b!702583 m!661673))

(declare-fun m!661675 () Bool)

(assert (=> b!702593 m!661675))

(declare-fun m!661677 () Bool)

(assert (=> b!702590 m!661677))

(declare-fun m!661679 () Bool)

(assert (=> b!702576 m!661679))

(declare-fun m!661681 () Bool)

(assert (=> b!702588 m!661681))

(declare-fun m!661683 () Bool)

(assert (=> b!702582 m!661683))

(declare-fun m!661685 () Bool)

(assert (=> b!702595 m!661685))

(declare-fun m!661687 () Bool)

(assert (=> b!702595 m!661687))

(declare-fun m!661689 () Bool)

(assert (=> b!702586 m!661689))

(declare-fun m!661691 () Bool)

(assert (=> b!702592 m!661691))

(declare-fun m!661693 () Bool)

(assert (=> b!702585 m!661693))

(declare-fun m!661695 () Bool)

(assert (=> b!702584 m!661695))

(declare-fun m!661697 () Bool)

(assert (=> b!702580 m!661697))

(push 1)

