; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63520 () Bool)

(assert start!63520)

(declare-fun b!715678 () Bool)

(declare-fun res!478653 () Bool)

(declare-fun e!401890 () Bool)

(assert (=> b!715678 (=> (not res!478653) (not e!401890))))

(declare-datatypes ((array!40534 0))(
  ( (array!40535 (arr!19404 (Array (_ BitVec 32) (_ BitVec 64))) (size!19820 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40534)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715678 (= res!478653 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715679 () Bool)

(declare-fun res!478658 () Bool)

(assert (=> b!715679 (=> (not res!478658) (not e!401890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715679 (= res!478658 (not (validKeyInArray!0 (select (arr!19404 a!3591) from!2969))))))

(declare-fun b!715680 () Bool)

(declare-fun res!478666 () Bool)

(assert (=> b!715680 (=> (not res!478666) (not e!401890))))

(assert (=> b!715680 (= res!478666 (validKeyInArray!0 k!2824))))

(declare-fun b!715681 () Bool)

(declare-fun res!478661 () Bool)

(assert (=> b!715681 (=> (not res!478661) (not e!401890))))

(declare-datatypes ((List!13445 0))(
  ( (Nil!13442) (Cons!13441 (h!14486 (_ BitVec 64)) (t!19760 List!13445)) )
))
(declare-fun acc!652 () List!13445)

(declare-fun newAcc!49 () List!13445)

(declare-fun subseq!467 (List!13445 List!13445) Bool)

(assert (=> b!715681 (= res!478661 (subseq!467 acc!652 newAcc!49))))

(declare-fun b!715682 () Bool)

(declare-fun res!478652 () Bool)

(assert (=> b!715682 (=> (not res!478652) (not e!401890))))

(assert (=> b!715682 (= res!478652 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19820 a!3591)))))

(declare-fun b!715683 () Bool)

(declare-fun res!478662 () Bool)

(assert (=> b!715683 (=> (not res!478662) (not e!401890))))

(assert (=> b!715683 (= res!478662 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715684 () Bool)

(declare-fun res!478665 () Bool)

(assert (=> b!715684 (=> (not res!478665) (not e!401890))))

(assert (=> b!715684 (= res!478665 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715685 () Bool)

(declare-fun res!478660 () Bool)

(assert (=> b!715685 (=> (not res!478660) (not e!401890))))

(declare-fun contains!4022 (List!13445 (_ BitVec 64)) Bool)

(assert (=> b!715685 (= res!478660 (not (contains!4022 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715686 () Bool)

(declare-fun res!478651 () Bool)

(assert (=> b!715686 (=> (not res!478651) (not e!401890))))

(assert (=> b!715686 (= res!478651 (contains!4022 newAcc!49 k!2824))))

(declare-fun b!715687 () Bool)

(declare-fun res!478648 () Bool)

(assert (=> b!715687 (=> (not res!478648) (not e!401890))))

(assert (=> b!715687 (= res!478648 (not (contains!4022 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715688 () Bool)

(declare-fun res!478664 () Bool)

(assert (=> b!715688 (=> (not res!478664) (not e!401890))))

(assert (=> b!715688 (= res!478664 (not (contains!4022 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715689 () Bool)

(declare-fun res!478649 () Bool)

(assert (=> b!715689 (=> (not res!478649) (not e!401890))))

(declare-fun -!432 (List!13445 (_ BitVec 64)) List!13445)

(assert (=> b!715689 (= res!478649 (= (-!432 newAcc!49 k!2824) acc!652))))

(declare-fun b!715690 () Bool)

(declare-fun res!478659 () Bool)

(assert (=> b!715690 (=> (not res!478659) (not e!401890))))

(declare-fun noDuplicate!1269 (List!13445) Bool)

(assert (=> b!715690 (= res!478659 (noDuplicate!1269 acc!652))))

(declare-fun b!715691 () Bool)

(declare-fun res!478656 () Bool)

(assert (=> b!715691 (=> (not res!478656) (not e!401890))))

(declare-fun arrayNoDuplicates!0 (array!40534 (_ BitVec 32) List!13445) Bool)

(assert (=> b!715691 (= res!478656 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun res!478657 () Bool)

(assert (=> start!63520 (=> (not res!478657) (not e!401890))))

(assert (=> start!63520 (= res!478657 (and (bvslt (size!19820 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19820 a!3591))))))

(assert (=> start!63520 e!401890))

(assert (=> start!63520 true))

(declare-fun array_inv!15200 (array!40534) Bool)

(assert (=> start!63520 (array_inv!15200 a!3591)))

(declare-fun b!715692 () Bool)

(assert (=> b!715692 (= e!401890 (bvsge (bvsub (size!19820 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) (bvsub (size!19820 a!3591) from!2969)))))

(declare-fun b!715693 () Bool)

(declare-fun res!478650 () Bool)

(assert (=> b!715693 (=> (not res!478650) (not e!401890))))

(assert (=> b!715693 (= res!478650 (noDuplicate!1269 newAcc!49))))

(declare-fun b!715694 () Bool)

(declare-fun res!478654 () Bool)

(assert (=> b!715694 (=> (not res!478654) (not e!401890))))

(assert (=> b!715694 (= res!478654 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715695 () Bool)

(declare-fun res!478655 () Bool)

(assert (=> b!715695 (=> (not res!478655) (not e!401890))))

(assert (=> b!715695 (= res!478655 (not (contains!4022 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715696 () Bool)

(declare-fun res!478663 () Bool)

(assert (=> b!715696 (=> (not res!478663) (not e!401890))))

(assert (=> b!715696 (= res!478663 (not (contains!4022 acc!652 k!2824)))))

(assert (= (and start!63520 res!478657) b!715690))

(assert (= (and b!715690 res!478659) b!715693))

(assert (= (and b!715693 res!478650) b!715688))

(assert (= (and b!715688 res!478664) b!715687))

(assert (= (and b!715687 res!478648) b!715678))

(assert (= (and b!715678 res!478653) b!715696))

(assert (= (and b!715696 res!478663) b!715680))

(assert (= (and b!715680 res!478666) b!715694))

(assert (= (and b!715694 res!478654) b!715681))

(assert (= (and b!715681 res!478661) b!715686))

(assert (= (and b!715686 res!478651) b!715689))

(assert (= (and b!715689 res!478649) b!715685))

(assert (= (and b!715685 res!478660) b!715695))

(assert (= (and b!715695 res!478655) b!715682))

(assert (= (and b!715682 res!478652) b!715679))

(assert (= (and b!715679 res!478658) b!715683))

(assert (= (and b!715683 res!478662) b!715684))

(assert (= (and b!715684 res!478665) b!715691))

(assert (= (and b!715691 res!478656) b!715692))

(declare-fun m!671839 () Bool)

(assert (=> b!715684 m!671839))

(declare-fun m!671841 () Bool)

(assert (=> start!63520 m!671841))

(declare-fun m!671843 () Bool)

(assert (=> b!715678 m!671843))

(declare-fun m!671845 () Bool)

(assert (=> b!715696 m!671845))

(declare-fun m!671847 () Bool)

(assert (=> b!715686 m!671847))

(declare-fun m!671849 () Bool)

(assert (=> b!715695 m!671849))

(declare-fun m!671851 () Bool)

(assert (=> b!715680 m!671851))

(declare-fun m!671853 () Bool)

(assert (=> b!715681 m!671853))

(declare-fun m!671855 () Bool)

(assert (=> b!715689 m!671855))

(declare-fun m!671857 () Bool)

(assert (=> b!715691 m!671857))

(declare-fun m!671859 () Bool)

(assert (=> b!715687 m!671859))

(declare-fun m!671861 () Bool)

(assert (=> b!715694 m!671861))

(declare-fun m!671863 () Bool)

(assert (=> b!715679 m!671863))

(assert (=> b!715679 m!671863))

(declare-fun m!671865 () Bool)

(assert (=> b!715679 m!671865))

(declare-fun m!671867 () Bool)

(assert (=> b!715688 m!671867))

(declare-fun m!671869 () Bool)

(assert (=> b!715690 m!671869))

(declare-fun m!671871 () Bool)

(assert (=> b!715693 m!671871))

(declare-fun m!671873 () Bool)

(assert (=> b!715685 m!671873))

(push 1)

(assert (not start!63520))

(assert (not b!715695))

(assert (not b!715686))

(assert (not b!715688))

(assert (not b!715681))

(assert (not b!715694))

(assert (not b!715696))

(assert (not b!715684))

(assert (not b!715690))

(assert (not b!715680))

(assert (not b!715689))

(assert (not b!715691))

(assert (not b!715678))

(assert (not b!715693))

(assert (not b!715687))

(assert (not b!715685))

(assert (not b!715679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

