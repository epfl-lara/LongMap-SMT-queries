; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59854 () Bool)

(assert start!59854)

(declare-fun b!661678 () Bool)

(declare-fun res!429748 () Bool)

(declare-fun e!380027 () Bool)

(assert (=> b!661678 (=> (not res!429748) (not e!380027))))

(declare-datatypes ((List!12684 0))(
  ( (Nil!12681) (Cons!12680 (h!13725 (_ BitVec 64)) (t!18912 List!12684)) )
))
(declare-fun acc!681 () List!12684)

(declare-fun contains!3261 (List!12684 (_ BitVec 64)) Bool)

(assert (=> b!661678 (= res!429748 (not (contains!3261 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661679 () Bool)

(declare-fun res!429755 () Bool)

(assert (=> b!661679 (=> (not res!429755) (not e!380027))))

(assert (=> b!661679 (= res!429755 (not (contains!3261 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661680 () Bool)

(declare-fun res!429745 () Bool)

(assert (=> b!661680 (=> (not res!429745) (not e!380027))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38901 0))(
  ( (array!38902 (arr!18643 (Array (_ BitVec 32) (_ BitVec 64))) (size!19007 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38901)

(assert (=> b!661680 (= res!429745 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19007 a!3626))))))

(declare-fun b!661681 () Bool)

(declare-fun res!429742 () Bool)

(assert (=> b!661681 (=> (not res!429742) (not e!380027))))

(declare-fun arrayNoDuplicates!0 (array!38901 (_ BitVec 32) List!12684) Bool)

(assert (=> b!661681 (= res!429742 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12681))))

(declare-fun b!661682 () Bool)

(declare-fun res!429754 () Bool)

(assert (=> b!661682 (=> (not res!429754) (not e!380027))))

(declare-fun e!380030 () Bool)

(assert (=> b!661682 (= res!429754 e!380030)))

(declare-fun res!429747 () Bool)

(assert (=> b!661682 (=> res!429747 e!380030)))

(declare-fun e!380031 () Bool)

(assert (=> b!661682 (= res!429747 e!380031)))

(declare-fun res!429751 () Bool)

(assert (=> b!661682 (=> (not res!429751) (not e!380031))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!661682 (= res!429751 (bvsgt from!3004 i!1382))))

(declare-fun b!661683 () Bool)

(declare-fun e!380029 () Bool)

(assert (=> b!661683 (= e!380030 e!380029)))

(declare-fun res!429750 () Bool)

(assert (=> b!661683 (=> (not res!429750) (not e!380029))))

(assert (=> b!661683 (= res!429750 (bvsle from!3004 i!1382))))

(declare-fun b!661684 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!661684 (= e!380031 (contains!3261 acc!681 k0!2843))))

(declare-fun res!429749 () Bool)

(assert (=> start!59854 (=> (not res!429749) (not e!380027))))

(assert (=> start!59854 (= res!429749 (and (bvslt (size!19007 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19007 a!3626))))))

(assert (=> start!59854 e!380027))

(assert (=> start!59854 true))

(declare-fun array_inv!14439 (array!38901) Bool)

(assert (=> start!59854 (array_inv!14439 a!3626)))

(declare-fun b!661685 () Bool)

(declare-fun res!429743 () Bool)

(assert (=> b!661685 (=> (not res!429743) (not e!380027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661685 (= res!429743 (validKeyInArray!0 k0!2843))))

(declare-fun b!661686 () Bool)

(assert (=> b!661686 (= e!380027 (not true))))

(declare-fun arrayContainsKey!0 (array!38901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661686 (arrayContainsKey!0 (array!38902 (store (arr!18643 a!3626) i!1382 k0!2843) (size!19007 a!3626)) k0!2843 from!3004)))

(declare-fun b!661687 () Bool)

(assert (=> b!661687 (= e!380029 (not (contains!3261 acc!681 k0!2843)))))

(declare-fun b!661688 () Bool)

(declare-fun res!429753 () Bool)

(assert (=> b!661688 (=> (not res!429753) (not e!380027))))

(declare-fun noDuplicate!508 (List!12684) Bool)

(assert (=> b!661688 (= res!429753 (noDuplicate!508 acc!681))))

(declare-fun b!661689 () Bool)

(declare-fun res!429744 () Bool)

(assert (=> b!661689 (=> (not res!429744) (not e!380027))))

(assert (=> b!661689 (= res!429744 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661690 () Bool)

(declare-fun res!429752 () Bool)

(assert (=> b!661690 (=> (not res!429752) (not e!380027))))

(assert (=> b!661690 (= res!429752 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19007 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661691 () Bool)

(declare-fun res!429746 () Bool)

(assert (=> b!661691 (=> (not res!429746) (not e!380027))))

(assert (=> b!661691 (= res!429746 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!59854 res!429749) b!661688))

(assert (= (and b!661688 res!429753) b!661679))

(assert (= (and b!661679 res!429755) b!661678))

(assert (= (and b!661678 res!429748) b!661682))

(assert (= (and b!661682 res!429751) b!661684))

(assert (= (and b!661682 (not res!429747)) b!661683))

(assert (= (and b!661683 res!429750) b!661687))

(assert (= (and b!661682 res!429754) b!661681))

(assert (= (and b!661681 res!429742) b!661689))

(assert (= (and b!661689 res!429744) b!661680))

(assert (= (and b!661680 res!429745) b!661685))

(assert (= (and b!661685 res!429743) b!661691))

(assert (= (and b!661691 res!429746) b!661690))

(assert (= (and b!661690 res!429752) b!661686))

(declare-fun m!633753 () Bool)

(assert (=> start!59854 m!633753))

(declare-fun m!633755 () Bool)

(assert (=> b!661686 m!633755))

(declare-fun m!633757 () Bool)

(assert (=> b!661686 m!633757))

(declare-fun m!633759 () Bool)

(assert (=> b!661679 m!633759))

(declare-fun m!633761 () Bool)

(assert (=> b!661691 m!633761))

(declare-fun m!633763 () Bool)

(assert (=> b!661678 m!633763))

(declare-fun m!633765 () Bool)

(assert (=> b!661681 m!633765))

(declare-fun m!633767 () Bool)

(assert (=> b!661685 m!633767))

(declare-fun m!633769 () Bool)

(assert (=> b!661687 m!633769))

(assert (=> b!661684 m!633769))

(declare-fun m!633771 () Bool)

(assert (=> b!661689 m!633771))

(declare-fun m!633773 () Bool)

(assert (=> b!661688 m!633773))

(check-sat (not start!59854) (not b!661691) (not b!661681) (not b!661686) (not b!661689) (not b!661679) (not b!661685) (not b!661687) (not b!661684) (not b!661688) (not b!661678))
(check-sat)
