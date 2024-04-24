; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59842 () Bool)

(assert start!59842)

(declare-fun b!660635 () Bool)

(declare-fun e!379647 () Bool)

(declare-datatypes ((List!12551 0))(
  ( (Nil!12548) (Cons!12547 (h!13595 (_ BitVec 64)) (t!18771 List!12551)) )
))
(declare-fun acc!681 () List!12551)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3203 (List!12551 (_ BitVec 64)) Bool)

(assert (=> b!660635 (= e!379647 (not (contains!3203 acc!681 k!2843)))))

(declare-fun b!660636 () Bool)

(declare-fun e!379645 () Bool)

(assert (=> b!660636 (= e!379645 e!379647)))

(declare-fun res!428594 () Bool)

(assert (=> b!660636 (=> (not res!428594) (not e!379647))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660636 (= res!428594 (bvsle from!3004 i!1382))))

(declare-fun b!660637 () Bool)

(declare-fun e!379643 () Bool)

(assert (=> b!660637 (= e!379643 false)))

(declare-datatypes ((array!38827 0))(
  ( (array!38828 (arr!18603 (Array (_ BitVec 32) (_ BitVec 64))) (size!18967 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38827)

(declare-fun lt!308884 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38827 (_ BitVec 32) List!12551) Bool)

(assert (=> b!660637 (= lt!308884 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660638 () Bool)

(declare-fun res!428589 () Bool)

(assert (=> b!660638 (=> (not res!428589) (not e!379643))))

(assert (=> b!660638 (= res!428589 e!379645)))

(declare-fun res!428591 () Bool)

(assert (=> b!660638 (=> res!428591 e!379645)))

(declare-fun e!379644 () Bool)

(assert (=> b!660638 (= res!428591 e!379644)))

(declare-fun res!428593 () Bool)

(assert (=> b!660638 (=> (not res!428593) (not e!379644))))

(assert (=> b!660638 (= res!428593 (bvsgt from!3004 i!1382))))

(declare-fun b!660639 () Bool)

(declare-fun res!428596 () Bool)

(assert (=> b!660639 (=> (not res!428596) (not e!379643))))

(assert (=> b!660639 (= res!428596 (not (contains!3203 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660640 () Bool)

(declare-fun res!428590 () Bool)

(assert (=> b!660640 (=> (not res!428590) (not e!379643))))

(declare-fun noDuplicate!477 (List!12551) Bool)

(assert (=> b!660640 (= res!428590 (noDuplicate!477 acc!681))))

(declare-fun b!660641 () Bool)

(declare-fun res!428595 () Bool)

(assert (=> b!660641 (=> (not res!428595) (not e!379643))))

(assert (=> b!660641 (= res!428595 (not (contains!3203 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660642 () Bool)

(assert (=> b!660642 (= e!379644 (contains!3203 acc!681 k!2843))))

(declare-fun b!660643 () Bool)

(declare-fun res!428592 () Bool)

(assert (=> b!660643 (=> (not res!428592) (not e!379643))))

(assert (=> b!660643 (= res!428592 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12548))))

(declare-fun res!428588 () Bool)

(assert (=> start!59842 (=> (not res!428588) (not e!379643))))

(assert (=> start!59842 (= res!428588 (and (bvslt (size!18967 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18967 a!3626))))))

(assert (=> start!59842 e!379643))

(assert (=> start!59842 true))

(declare-fun array_inv!14462 (array!38827) Bool)

(assert (=> start!59842 (array_inv!14462 a!3626)))

(assert (= (and start!59842 res!428588) b!660640))

(assert (= (and b!660640 res!428590) b!660641))

(assert (= (and b!660641 res!428595) b!660639))

(assert (= (and b!660639 res!428596) b!660638))

(assert (= (and b!660638 res!428593) b!660642))

(assert (= (and b!660638 (not res!428591)) b!660636))

(assert (= (and b!660636 res!428594) b!660635))

(assert (= (and b!660638 res!428589) b!660643))

(assert (= (and b!660643 res!428592) b!660637))

(declare-fun m!633803 () Bool)

(assert (=> b!660641 m!633803))

(declare-fun m!633805 () Bool)

(assert (=> start!59842 m!633805))

(declare-fun m!633807 () Bool)

(assert (=> b!660640 m!633807))

(declare-fun m!633809 () Bool)

(assert (=> b!660639 m!633809))

(declare-fun m!633811 () Bool)

(assert (=> b!660635 m!633811))

(declare-fun m!633813 () Bool)

(assert (=> b!660637 m!633813))

(assert (=> b!660642 m!633811))

(declare-fun m!633815 () Bool)

(assert (=> b!660643 m!633815))

(push 1)

(assert (not b!660637))

(assert (not b!660639))

(assert (not b!660640))

(assert (not b!660635))

(assert (not b!660643))

(assert (not start!59842))

(assert (not b!660641))

(assert (not b!660642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

