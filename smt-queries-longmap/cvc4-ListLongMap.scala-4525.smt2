; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62622 () Bool)

(assert start!62622)

(declare-fun b!706785 () Bool)

(declare-fun res!470597 () Bool)

(declare-fun e!398005 () Bool)

(assert (=> b!706785 (=> (not res!470597) (not e!398005))))

(declare-datatypes ((List!13348 0))(
  ( (Nil!13345) (Cons!13344 (h!14389 (_ BitVec 64)) (t!19630 List!13348)) )
))
(declare-fun acc!652 () List!13348)

(declare-fun newAcc!49 () List!13348)

(declare-fun subseq!370 (List!13348 List!13348) Bool)

(assert (=> b!706785 (= res!470597 (subseq!370 acc!652 newAcc!49))))

(declare-fun res!470606 () Bool)

(assert (=> start!62622 (=> (not res!470606) (not e!398005))))

(declare-datatypes ((array!40301 0))(
  ( (array!40302 (arr!19307 (Array (_ BitVec 32) (_ BitVec 64))) (size!19692 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40301)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62622 (= res!470606 (and (bvslt (size!19692 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19692 a!3591))))))

(assert (=> start!62622 e!398005))

(assert (=> start!62622 true))

(declare-fun array_inv!15103 (array!40301) Bool)

(assert (=> start!62622 (array_inv!15103 a!3591)))

(declare-fun b!706786 () Bool)

(declare-fun res!470605 () Bool)

(assert (=> b!706786 (=> (not res!470605) (not e!398005))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3925 (List!13348 (_ BitVec 64)) Bool)

(assert (=> b!706786 (= res!470605 (contains!3925 newAcc!49 k!2824))))

(declare-fun b!706787 () Bool)

(declare-fun res!470603 () Bool)

(assert (=> b!706787 (=> (not res!470603) (not e!398005))))

(declare-fun -!335 (List!13348 (_ BitVec 64)) List!13348)

(assert (=> b!706787 (= res!470603 (= (-!335 newAcc!49 k!2824) acc!652))))

(declare-fun b!706788 () Bool)

(assert (=> b!706788 (= e!398005 false)))

(declare-fun lt!317967 () Bool)

(assert (=> b!706788 (= lt!317967 (contains!3925 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706789 () Bool)

(declare-fun res!470598 () Bool)

(assert (=> b!706789 (=> (not res!470598) (not e!398005))))

(declare-fun arrayNoDuplicates!0 (array!40301 (_ BitVec 32) List!13348) Bool)

(assert (=> b!706789 (= res!470598 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706790 () Bool)

(declare-fun res!470596 () Bool)

(assert (=> b!706790 (=> (not res!470596) (not e!398005))))

(assert (=> b!706790 (= res!470596 (not (contains!3925 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706791 () Bool)

(declare-fun res!470604 () Bool)

(assert (=> b!706791 (=> (not res!470604) (not e!398005))))

(declare-fun noDuplicate!1172 (List!13348) Bool)

(assert (=> b!706791 (= res!470604 (noDuplicate!1172 acc!652))))

(declare-fun b!706792 () Bool)

(declare-fun res!470595 () Bool)

(assert (=> b!706792 (=> (not res!470595) (not e!398005))))

(assert (=> b!706792 (= res!470595 (not (contains!3925 acc!652 k!2824)))))

(declare-fun b!706793 () Bool)

(declare-fun res!470607 () Bool)

(assert (=> b!706793 (=> (not res!470607) (not e!398005))))

(assert (=> b!706793 (= res!470607 (not (contains!3925 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706794 () Bool)

(declare-fun res!470599 () Bool)

(assert (=> b!706794 (=> (not res!470599) (not e!398005))))

(assert (=> b!706794 (= res!470599 (noDuplicate!1172 newAcc!49))))

(declare-fun b!706795 () Bool)

(declare-fun res!470600 () Bool)

(assert (=> b!706795 (=> (not res!470600) (not e!398005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706795 (= res!470600 (validKeyInArray!0 k!2824))))

(declare-fun b!706796 () Bool)

(declare-fun res!470601 () Bool)

(assert (=> b!706796 (=> (not res!470601) (not e!398005))))

(assert (=> b!706796 (= res!470601 (not (contains!3925 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706797 () Bool)

(declare-fun res!470602 () Bool)

(assert (=> b!706797 (=> (not res!470602) (not e!398005))))

(declare-fun arrayContainsKey!0 (array!40301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706797 (= res!470602 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(assert (= (and start!62622 res!470606) b!706791))

(assert (= (and b!706791 res!470604) b!706794))

(assert (= (and b!706794 res!470599) b!706796))

(assert (= (and b!706796 res!470601) b!706790))

(assert (= (and b!706790 res!470596) b!706797))

(assert (= (and b!706797 res!470602) b!706792))

(assert (= (and b!706792 res!470595) b!706795))

(assert (= (and b!706795 res!470600) b!706789))

(assert (= (and b!706789 res!470598) b!706785))

(assert (= (and b!706785 res!470597) b!706786))

(assert (= (and b!706786 res!470605) b!706787))

(assert (= (and b!706787 res!470603) b!706793))

(assert (= (and b!706793 res!470607) b!706788))

(declare-fun m!664551 () Bool)

(assert (=> b!706796 m!664551))

(declare-fun m!664553 () Bool)

(assert (=> b!706790 m!664553))

(declare-fun m!664555 () Bool)

(assert (=> b!706785 m!664555))

(declare-fun m!664557 () Bool)

(assert (=> b!706787 m!664557))

(declare-fun m!664559 () Bool)

(assert (=> b!706797 m!664559))

(declare-fun m!664561 () Bool)

(assert (=> b!706794 m!664561))

(declare-fun m!664563 () Bool)

(assert (=> b!706788 m!664563))

(declare-fun m!664565 () Bool)

(assert (=> b!706786 m!664565))

(declare-fun m!664567 () Bool)

(assert (=> b!706789 m!664567))

(declare-fun m!664569 () Bool)

(assert (=> b!706792 m!664569))

(declare-fun m!664571 () Bool)

(assert (=> start!62622 m!664571))

(declare-fun m!664573 () Bool)

(assert (=> b!706791 m!664573))

(declare-fun m!664575 () Bool)

(assert (=> b!706793 m!664575))

(declare-fun m!664577 () Bool)

(assert (=> b!706795 m!664577))

(push 1)

(assert (not start!62622))

(assert (not b!706797))

(assert (not b!706796))

(assert (not b!706790))

(assert (not b!706795))

(assert (not b!706789))

(assert (not b!706785))

(assert (not b!706788))

(assert (not b!706792))

(assert (not b!706787))

(assert (not b!706786))

(assert (not b!706793))

(assert (not b!706794))

