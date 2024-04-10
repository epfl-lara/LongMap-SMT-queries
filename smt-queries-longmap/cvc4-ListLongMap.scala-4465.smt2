; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62142 () Bool)

(assert start!62142)

(declare-fun res!459752 () Bool)

(declare-fun e!395728 () Bool)

(assert (=> start!62142 (=> (not res!459752) (not e!395728))))

(declare-datatypes ((array!39932 0))(
  ( (array!39933 (arr!19127 (Array (_ BitVec 32) (_ BitVec 64))) (size!19512 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39932)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62142 (= res!459752 (and (bvslt (size!19512 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19512 a!3626))))))

(assert (=> start!62142 e!395728))

(assert (=> start!62142 true))

(declare-fun array_inv!14923 (array!39932) Bool)

(assert (=> start!62142 (array_inv!14923 a!3626)))

(declare-fun b!695796 () Bool)

(declare-fun res!459748 () Bool)

(assert (=> b!695796 (=> (not res!459748) (not e!395728))))

(declare-datatypes ((List!13168 0))(
  ( (Nil!13165) (Cons!13164 (h!14209 (_ BitVec 64)) (t!19450 List!13168)) )
))
(declare-fun acc!681 () List!13168)

(declare-fun contains!3745 (List!13168 (_ BitVec 64)) Bool)

(assert (=> b!695796 (= res!459748 (not (contains!3745 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695797 () Bool)

(declare-fun e!395726 () Bool)

(declare-fun e!395730 () Bool)

(assert (=> b!695797 (= e!395726 e!395730)))

(declare-fun res!459749 () Bool)

(assert (=> b!695797 (=> (not res!459749) (not e!395730))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695797 (= res!459749 (bvsle from!3004 i!1382))))

(declare-fun b!695798 () Bool)

(declare-fun res!459745 () Bool)

(assert (=> b!695798 (=> (not res!459745) (not e!395728))))

(assert (=> b!695798 (= res!459745 (not (contains!3745 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695799 () Bool)

(declare-fun res!459750 () Bool)

(assert (=> b!695799 (=> (not res!459750) (not e!395728))))

(declare-fun arrayNoDuplicates!0 (array!39932 (_ BitVec 32) List!13168) Bool)

(assert (=> b!695799 (= res!459750 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13165))))

(declare-fun b!695800 () Bool)

(declare-fun res!459747 () Bool)

(assert (=> b!695800 (=> (not res!459747) (not e!395728))))

(assert (=> b!695800 (= res!459747 e!395726)))

(declare-fun res!459744 () Bool)

(assert (=> b!695800 (=> res!459744 e!395726)))

(declare-fun e!395729 () Bool)

(assert (=> b!695800 (= res!459744 e!395729)))

(declare-fun res!459751 () Bool)

(assert (=> b!695800 (=> (not res!459751) (not e!395729))))

(assert (=> b!695800 (= res!459751 (bvsgt from!3004 i!1382))))

(declare-fun b!695801 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!695801 (= e!395730 (not (contains!3745 acc!681 k!2843)))))

(declare-fun b!695802 () Bool)

(assert (=> b!695802 (= e!395729 (contains!3745 acc!681 k!2843))))

(declare-fun b!695803 () Bool)

(declare-fun res!459746 () Bool)

(assert (=> b!695803 (=> (not res!459746) (not e!395728))))

(declare-fun noDuplicate!992 (List!13168) Bool)

(assert (=> b!695803 (= res!459746 (noDuplicate!992 acc!681))))

(declare-fun b!695804 () Bool)

(assert (=> b!695804 (= e!395728 false)))

(declare-fun lt!317086 () Bool)

(assert (=> b!695804 (= lt!317086 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!62142 res!459752) b!695803))

(assert (= (and b!695803 res!459746) b!695796))

(assert (= (and b!695796 res!459748) b!695798))

(assert (= (and b!695798 res!459745) b!695800))

(assert (= (and b!695800 res!459751) b!695802))

(assert (= (and b!695800 (not res!459744)) b!695797))

(assert (= (and b!695797 res!459749) b!695801))

(assert (= (and b!695800 res!459747) b!695799))

(assert (= (and b!695799 res!459750) b!695804))

(declare-fun m!657129 () Bool)

(assert (=> b!695802 m!657129))

(declare-fun m!657131 () Bool)

(assert (=> b!695804 m!657131))

(declare-fun m!657133 () Bool)

(assert (=> b!695796 m!657133))

(declare-fun m!657135 () Bool)

(assert (=> start!62142 m!657135))

(declare-fun m!657137 () Bool)

(assert (=> b!695799 m!657137))

(declare-fun m!657139 () Bool)

(assert (=> b!695803 m!657139))

(declare-fun m!657141 () Bool)

(assert (=> b!695798 m!657141))

(assert (=> b!695801 m!657129))

(push 1)

(assert (not b!695798))

(assert (not b!695799))

(assert (not b!695802))

(assert (not b!695803))

(assert (not b!695801))

(assert (not b!695796))

(assert (not start!62142))

(assert (not b!695804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

