; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61748 () Bool)

(assert start!61748)

(declare-fun b!690746 () Bool)

(declare-fun e!393287 () Bool)

(declare-datatypes ((List!13094 0))(
  ( (Nil!13091) (Cons!13090 (h!14135 (_ BitVec 64)) (t!19361 List!13094)) )
))
(declare-fun acc!681 () List!13094)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3671 (List!13094 (_ BitVec 64)) Bool)

(assert (=> b!690746 (= e!393287 (contains!3671 acc!681 k!2843))))

(declare-fun b!690747 () Bool)

(declare-fun res!455130 () Bool)

(declare-fun e!393289 () Bool)

(assert (=> b!690747 (=> (not res!455130) (not e!393289))))

(assert (=> b!690747 (= res!455130 (not (contains!3671 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690748 () Bool)

(declare-fun res!455132 () Bool)

(assert (=> b!690748 (=> (not res!455132) (not e!393289))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39769 0))(
  ( (array!39770 (arr!19053 (Array (_ BitVec 32) (_ BitVec 64))) (size!19438 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39769)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!690748 (= res!455132 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19438 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690749 () Bool)

(declare-fun res!455138 () Bool)

(assert (=> b!690749 (=> (not res!455138) (not e!393289))))

(declare-fun noDuplicate!918 (List!13094) Bool)

(assert (=> b!690749 (= res!455138 (noDuplicate!918 acc!681))))

(declare-fun b!690750 () Bool)

(declare-fun res!455135 () Bool)

(assert (=> b!690750 (=> (not res!455135) (not e!393289))))

(declare-fun arrayContainsKey!0 (array!39769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690750 (= res!455135 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690751 () Bool)

(declare-fun res!455131 () Bool)

(assert (=> b!690751 (=> (not res!455131) (not e!393289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690751 (= res!455131 (validKeyInArray!0 (select (arr!19053 a!3626) from!3004)))))

(declare-fun b!690752 () Bool)

(assert (=> b!690752 (= e!393289 (not true))))

(assert (=> b!690752 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!690753 () Bool)

(declare-fun res!455141 () Bool)

(assert (=> b!690753 (=> (not res!455141) (not e!393289))))

(declare-fun arrayNoDuplicates!0 (array!39769 (_ BitVec 32) List!13094) Bool)

(assert (=> b!690753 (= res!455141 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690754 () Bool)

(declare-fun res!455128 () Bool)

(assert (=> b!690754 (=> (not res!455128) (not e!393289))))

(assert (=> b!690754 (= res!455128 (not (contains!3671 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690755 () Bool)

(declare-fun e!393290 () Bool)

(declare-fun e!393291 () Bool)

(assert (=> b!690755 (= e!393290 e!393291)))

(declare-fun res!455133 () Bool)

(assert (=> b!690755 (=> (not res!455133) (not e!393291))))

(assert (=> b!690755 (= res!455133 (bvsle from!3004 i!1382))))

(declare-fun b!690757 () Bool)

(declare-fun res!455127 () Bool)

(assert (=> b!690757 (=> (not res!455127) (not e!393289))))

(assert (=> b!690757 (= res!455127 (validKeyInArray!0 k!2843))))

(declare-fun b!690758 () Bool)

(assert (=> b!690758 (= e!393291 (not (contains!3671 acc!681 k!2843)))))

(declare-fun b!690759 () Bool)

(declare-fun res!455134 () Bool)

(assert (=> b!690759 (=> (not res!455134) (not e!393289))))

(assert (=> b!690759 (= res!455134 (= (select (arr!19053 a!3626) from!3004) k!2843))))

(declare-fun b!690760 () Bool)

(declare-fun res!455139 () Bool)

(assert (=> b!690760 (=> (not res!455139) (not e!393289))))

(assert (=> b!690760 (= res!455139 e!393290)))

(declare-fun res!455137 () Bool)

(assert (=> b!690760 (=> res!455137 e!393290)))

(assert (=> b!690760 (= res!455137 e!393287)))

(declare-fun res!455126 () Bool)

(assert (=> b!690760 (=> (not res!455126) (not e!393287))))

(assert (=> b!690760 (= res!455126 (bvsgt from!3004 i!1382))))

(declare-fun b!690761 () Bool)

(declare-fun res!455136 () Bool)

(assert (=> b!690761 (=> (not res!455136) (not e!393289))))

(assert (=> b!690761 (= res!455136 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19438 a!3626))))))

(declare-fun res!455140 () Bool)

(assert (=> start!61748 (=> (not res!455140) (not e!393289))))

(assert (=> start!61748 (= res!455140 (and (bvslt (size!19438 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19438 a!3626))))))

(assert (=> start!61748 e!393289))

(assert (=> start!61748 true))

(declare-fun array_inv!14849 (array!39769) Bool)

(assert (=> start!61748 (array_inv!14849 a!3626)))

(declare-fun b!690756 () Bool)

(declare-fun res!455129 () Bool)

(assert (=> b!690756 (=> (not res!455129) (not e!393289))))

(assert (=> b!690756 (= res!455129 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13091))))

(assert (= (and start!61748 res!455140) b!690749))

(assert (= (and b!690749 res!455138) b!690754))

(assert (= (and b!690754 res!455128) b!690747))

(assert (= (and b!690747 res!455130) b!690760))

(assert (= (and b!690760 res!455126) b!690746))

(assert (= (and b!690760 (not res!455137)) b!690755))

(assert (= (and b!690755 res!455133) b!690758))

(assert (= (and b!690760 res!455139) b!690756))

(assert (= (and b!690756 res!455129) b!690753))

(assert (= (and b!690753 res!455141) b!690761))

(assert (= (and b!690761 res!455136) b!690757))

(assert (= (and b!690757 res!455127) b!690750))

(assert (= (and b!690750 res!455135) b!690748))

(assert (= (and b!690748 res!455132) b!690751))

(assert (= (and b!690751 res!455131) b!690759))

(assert (= (and b!690759 res!455134) b!690752))

(declare-fun m!654113 () Bool)

(assert (=> b!690753 m!654113))

(declare-fun m!654115 () Bool)

(assert (=> b!690756 m!654115))

(declare-fun m!654117 () Bool)

(assert (=> b!690750 m!654117))

(declare-fun m!654119 () Bool)

(assert (=> start!61748 m!654119))

(declare-fun m!654121 () Bool)

(assert (=> b!690757 m!654121))

(declare-fun m!654123 () Bool)

(assert (=> b!690752 m!654123))

(declare-fun m!654125 () Bool)

(assert (=> b!690749 m!654125))

(declare-fun m!654127 () Bool)

(assert (=> b!690759 m!654127))

(declare-fun m!654129 () Bool)

(assert (=> b!690758 m!654129))

(assert (=> b!690751 m!654127))

(assert (=> b!690751 m!654127))

(declare-fun m!654131 () Bool)

(assert (=> b!690751 m!654131))

(declare-fun m!654133 () Bool)

(assert (=> b!690747 m!654133))

(declare-fun m!654135 () Bool)

(assert (=> b!690754 m!654135))

(assert (=> b!690746 m!654129))

(push 1)

(assert (not b!690754))

(assert (not b!690751))

(assert (not b!690750))

(assert (not b!690753))

(assert (not b!690752))

(assert (not b!690756))

(assert (not b!690757))

(assert (not b!690749))

(assert (not b!690746))

(assert (not start!61748))

(assert (not b!690747))

(assert (not b!690758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

