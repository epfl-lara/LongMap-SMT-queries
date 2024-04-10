; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62208 () Bool)

(assert start!62208)

(declare-fun b!696808 () Bool)

(declare-fun res!460735 () Bool)

(declare-fun e!396201 () Bool)

(assert (=> b!696808 (=> (not res!460735) (not e!396201))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!696808 (= res!460735 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696809 () Bool)

(declare-fun res!460741 () Bool)

(assert (=> b!696809 (=> (not res!460741) (not e!396201))))

(declare-datatypes ((List!13183 0))(
  ( (Nil!13180) (Cons!13179 (h!14224 (_ BitVec 64)) (t!19465 List!13183)) )
))
(declare-fun acc!681 () List!13183)

(declare-fun noDuplicate!1007 (List!13183) Bool)

(assert (=> b!696809 (= res!460741 (noDuplicate!1007 acc!681))))

(declare-fun b!696810 () Bool)

(declare-fun res!460740 () Bool)

(assert (=> b!696810 (=> (not res!460740) (not e!396201))))

(declare-fun contains!3760 (List!13183 (_ BitVec 64)) Bool)

(assert (=> b!696810 (= res!460740 (not (contains!3760 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696811 () Bool)

(declare-fun res!460738 () Bool)

(assert (=> b!696811 (=> (not res!460738) (not e!396201))))

(declare-datatypes ((array!39965 0))(
  ( (array!39966 (arr!19142 (Array (_ BitVec 32) (_ BitVec 64))) (size!19527 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39965)

(declare-fun arrayNoDuplicates!0 (array!39965 (_ BitVec 32) List!13183) Bool)

(assert (=> b!696811 (= res!460738 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13180))))

(declare-fun b!696812 () Bool)

(declare-fun res!460733 () Bool)

(assert (=> b!696812 (=> (not res!460733) (not e!396201))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696812 (= res!460733 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696813 () Bool)

(declare-fun e!396202 () Bool)

(declare-fun e!396203 () Bool)

(assert (=> b!696813 (= e!396202 e!396203)))

(declare-fun res!460734 () Bool)

(assert (=> b!696813 (=> (not res!460734) (not e!396203))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696813 (= res!460734 (bvsle from!3004 i!1382))))

(declare-fun b!696814 () Bool)

(declare-fun res!460728 () Bool)

(assert (=> b!696814 (=> (not res!460728) (not e!396201))))

(assert (=> b!696814 (= res!460728 (not (contains!3760 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696815 () Bool)

(declare-fun res!460742 () Bool)

(assert (=> b!696815 (=> (not res!460742) (not e!396201))))

(assert (=> b!696815 (= res!460742 e!396202)))

(declare-fun res!460729 () Bool)

(assert (=> b!696815 (=> res!460729 e!396202)))

(declare-fun e!396200 () Bool)

(assert (=> b!696815 (= res!460729 e!396200)))

(declare-fun res!460737 () Bool)

(assert (=> b!696815 (=> (not res!460737) (not e!396200))))

(assert (=> b!696815 (= res!460737 (bvsgt from!3004 i!1382))))

(declare-fun b!696816 () Bool)

(declare-fun e!396206 () Bool)

(assert (=> b!696816 (= e!396206 (contains!3760 acc!681 k!2843))))

(declare-fun b!696817 () Bool)

(declare-fun res!460736 () Bool)

(assert (=> b!696817 (=> (not res!460736) (not e!396201))))

(declare-fun e!396207 () Bool)

(assert (=> b!696817 (= res!460736 e!396207)))

(declare-fun res!460731 () Bool)

(assert (=> b!696817 (=> res!460731 e!396207)))

(assert (=> b!696817 (= res!460731 e!396206)))

(declare-fun res!460744 () Bool)

(assert (=> b!696817 (=> (not res!460744) (not e!396206))))

(assert (=> b!696817 (= res!460744 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696818 () Bool)

(declare-fun res!460726 () Bool)

(assert (=> b!696818 (=> (not res!460726) (not e!396201))))

(assert (=> b!696818 (= res!460726 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19527 a!3626))))))

(declare-fun b!696819 () Bool)

(assert (=> b!696819 (= e!396200 (contains!3760 acc!681 k!2843))))

(declare-fun b!696820 () Bool)

(declare-fun res!460743 () Bool)

(assert (=> b!696820 (=> (not res!460743) (not e!396201))))

(assert (=> b!696820 (= res!460743 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696821 () Bool)

(declare-fun e!396204 () Bool)

(assert (=> b!696821 (= e!396204 (not (contains!3760 acc!681 k!2843)))))

(declare-fun b!696822 () Bool)

(declare-fun res!460732 () Bool)

(assert (=> b!696822 (=> (not res!460732) (not e!396201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696822 (= res!460732 (validKeyInArray!0 k!2843))))

(declare-fun b!696823 () Bool)

(assert (=> b!696823 (= e!396203 (not (contains!3760 acc!681 k!2843)))))

(declare-fun res!460727 () Bool)

(assert (=> start!62208 (=> (not res!460727) (not e!396201))))

(assert (=> start!62208 (= res!460727 (and (bvslt (size!19527 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19527 a!3626))))))

(assert (=> start!62208 e!396201))

(assert (=> start!62208 true))

(declare-fun array_inv!14938 (array!39965) Bool)

(assert (=> start!62208 (array_inv!14938 a!3626)))

(declare-fun b!696824 () Bool)

(declare-fun res!460730 () Bool)

(assert (=> b!696824 (=> (not res!460730) (not e!396201))))

(assert (=> b!696824 (= res!460730 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19527 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696825 () Bool)

(assert (=> b!696825 (= e!396201 false)))

(declare-fun lt!317128 () Bool)

(assert (=> b!696825 (= lt!317128 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!696826 () Bool)

(assert (=> b!696826 (= e!396207 e!396204)))

(declare-fun res!460745 () Bool)

(assert (=> b!696826 (=> (not res!460745) (not e!396204))))

(assert (=> b!696826 (= res!460745 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696827 () Bool)

(declare-fun res!460739 () Bool)

(assert (=> b!696827 (=> (not res!460739) (not e!396201))))

(assert (=> b!696827 (= res!460739 (not (validKeyInArray!0 (select (arr!19142 a!3626) from!3004))))))

(assert (= (and start!62208 res!460727) b!696809))

(assert (= (and b!696809 res!460741) b!696814))

(assert (= (and b!696814 res!460728) b!696810))

(assert (= (and b!696810 res!460740) b!696815))

(assert (= (and b!696815 res!460737) b!696819))

(assert (= (and b!696815 (not res!460729)) b!696813))

(assert (= (and b!696813 res!460734) b!696823))

(assert (= (and b!696815 res!460742) b!696811))

(assert (= (and b!696811 res!460738) b!696820))

(assert (= (and b!696820 res!460743) b!696818))

(assert (= (and b!696818 res!460726) b!696822))

(assert (= (and b!696822 res!460732) b!696812))

(assert (= (and b!696812 res!460733) b!696824))

(assert (= (and b!696824 res!460730) b!696827))

(assert (= (and b!696827 res!460739) b!696808))

(assert (= (and b!696808 res!460735) b!696817))

(assert (= (and b!696817 res!460744) b!696816))

(assert (= (and b!696817 (not res!460731)) b!696826))

(assert (= (and b!696826 res!460745) b!696821))

(assert (= (and b!696817 res!460736) b!696825))

(declare-fun m!657587 () Bool)

(assert (=> b!696809 m!657587))

(declare-fun m!657589 () Bool)

(assert (=> b!696812 m!657589))

(declare-fun m!657591 () Bool)

(assert (=> start!62208 m!657591))

(declare-fun m!657593 () Bool)

(assert (=> b!696825 m!657593))

(declare-fun m!657595 () Bool)

(assert (=> b!696811 m!657595))

(declare-fun m!657597 () Bool)

(assert (=> b!696823 m!657597))

(declare-fun m!657599 () Bool)

(assert (=> b!696820 m!657599))

(declare-fun m!657601 () Bool)

(assert (=> b!696827 m!657601))

(assert (=> b!696827 m!657601))

(declare-fun m!657603 () Bool)

(assert (=> b!696827 m!657603))

(assert (=> b!696819 m!657597))

(declare-fun m!657605 () Bool)

(assert (=> b!696822 m!657605))

(declare-fun m!657607 () Bool)

(assert (=> b!696810 m!657607))

(assert (=> b!696816 m!657597))

(assert (=> b!696821 m!657597))

(declare-fun m!657609 () Bool)

(assert (=> b!696814 m!657609))

(push 1)

(assert (not b!696827))

(assert (not b!696811))

(assert (not b!696825))

(assert (not b!696814))

(assert (not start!62208))

(assert (not b!696816))

(assert (not b!696820))

(assert (not b!696812))

(assert (not b!696819))

(assert (not b!696809))

(assert (not b!696823))

(assert (not b!696810))

(assert (not b!696821))

(assert (not b!696822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

