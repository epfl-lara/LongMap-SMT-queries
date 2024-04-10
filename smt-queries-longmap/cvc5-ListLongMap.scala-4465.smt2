; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62138 () Bool)

(assert start!62138)

(declare-fun b!695742 () Bool)

(declare-fun e!395698 () Bool)

(declare-datatypes ((List!13166 0))(
  ( (Nil!13163) (Cons!13162 (h!14207 (_ BitVec 64)) (t!19448 List!13166)) )
))
(declare-fun acc!681 () List!13166)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3743 (List!13166 (_ BitVec 64)) Bool)

(assert (=> b!695742 (= e!395698 (contains!3743 acc!681 k!2843))))

(declare-fun b!695743 () Bool)

(declare-fun res!459695 () Bool)

(declare-fun e!395696 () Bool)

(assert (=> b!695743 (=> (not res!459695) (not e!395696))))

(declare-fun e!395699 () Bool)

(assert (=> b!695743 (= res!459695 e!395699)))

(declare-fun res!459696 () Bool)

(assert (=> b!695743 (=> res!459696 e!395699)))

(assert (=> b!695743 (= res!459696 e!395698)))

(declare-fun res!459691 () Bool)

(assert (=> b!695743 (=> (not res!459691) (not e!395698))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695743 (= res!459691 (bvsgt from!3004 i!1382))))

(declare-fun b!695745 () Bool)

(declare-fun res!459697 () Bool)

(assert (=> b!695745 (=> (not res!459697) (not e!395696))))

(declare-fun noDuplicate!990 (List!13166) Bool)

(assert (=> b!695745 (= res!459697 (noDuplicate!990 acc!681))))

(declare-fun b!695746 () Bool)

(assert (=> b!695746 (= e!395696 false)))

(declare-datatypes ((array!39928 0))(
  ( (array!39929 (arr!19125 (Array (_ BitVec 32) (_ BitVec 64))) (size!19510 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39928)

(declare-fun lt!317080 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39928 (_ BitVec 32) List!13166) Bool)

(assert (=> b!695746 (= lt!317080 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695747 () Bool)

(declare-fun res!459693 () Bool)

(assert (=> b!695747 (=> (not res!459693) (not e!395696))))

(assert (=> b!695747 (= res!459693 (not (contains!3743 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695748 () Bool)

(declare-fun res!459694 () Bool)

(assert (=> b!695748 (=> (not res!459694) (not e!395696))))

(assert (=> b!695748 (= res!459694 (not (contains!3743 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695749 () Bool)

(declare-fun e!395697 () Bool)

(assert (=> b!695749 (= e!395699 e!395697)))

(declare-fun res!459698 () Bool)

(assert (=> b!695749 (=> (not res!459698) (not e!395697))))

(assert (=> b!695749 (= res!459698 (bvsle from!3004 i!1382))))

(declare-fun b!695750 () Bool)

(declare-fun res!459692 () Bool)

(assert (=> b!695750 (=> (not res!459692) (not e!395696))))

(assert (=> b!695750 (= res!459692 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13163))))

(declare-fun b!695744 () Bool)

(assert (=> b!695744 (= e!395697 (not (contains!3743 acc!681 k!2843)))))

(declare-fun res!459690 () Bool)

(assert (=> start!62138 (=> (not res!459690) (not e!395696))))

(assert (=> start!62138 (= res!459690 (and (bvslt (size!19510 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19510 a!3626))))))

(assert (=> start!62138 e!395696))

(assert (=> start!62138 true))

(declare-fun array_inv!14921 (array!39928) Bool)

(assert (=> start!62138 (array_inv!14921 a!3626)))

(assert (= (and start!62138 res!459690) b!695745))

(assert (= (and b!695745 res!459697) b!695747))

(assert (= (and b!695747 res!459693) b!695748))

(assert (= (and b!695748 res!459694) b!695743))

(assert (= (and b!695743 res!459691) b!695742))

(assert (= (and b!695743 (not res!459696)) b!695749))

(assert (= (and b!695749 res!459698) b!695744))

(assert (= (and b!695743 res!459695) b!695750))

(assert (= (and b!695750 res!459692) b!695746))

(declare-fun m!657101 () Bool)

(assert (=> b!695744 m!657101))

(declare-fun m!657103 () Bool)

(assert (=> b!695748 m!657103))

(declare-fun m!657105 () Bool)

(assert (=> b!695745 m!657105))

(declare-fun m!657107 () Bool)

(assert (=> b!695747 m!657107))

(declare-fun m!657109 () Bool)

(assert (=> b!695750 m!657109))

(assert (=> b!695742 m!657101))

(declare-fun m!657111 () Bool)

(assert (=> start!62138 m!657111))

(declare-fun m!657113 () Bool)

(assert (=> b!695746 m!657113))

(push 1)

(assert (not b!695742))

(assert (not b!695747))

(assert (not b!695748))

(assert (not b!695746))

(assert (not start!62138))

(assert (not b!695750))

(assert (not b!695744))

(assert (not b!695745))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

