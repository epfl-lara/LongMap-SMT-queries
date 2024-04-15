; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60240 () Bool)

(assert start!60240)

(declare-fun b!675098 () Bool)

(declare-fun res!441701 () Bool)

(declare-fun e!385182 () Bool)

(assert (=> b!675098 (=> (not res!441701) (not e!385182))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39298 0))(
  ( (array!39299 (arr!18841 (Array (_ BitVec 32) (_ BitVec 64))) (size!19206 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39298)

(assert (=> b!675098 (= res!441701 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19206 a!3626))))))

(declare-fun b!675099 () Bool)

(declare-fun res!441688 () Bool)

(assert (=> b!675099 (=> (not res!441688) (not e!385182))))

(declare-datatypes ((List!12921 0))(
  ( (Nil!12918) (Cons!12917 (h!13962 (_ BitVec 64)) (t!19140 List!12921)) )
))
(declare-fun acc!681 () List!12921)

(declare-fun contains!3443 (List!12921 (_ BitVec 64)) Bool)

(assert (=> b!675099 (= res!441688 (not (contains!3443 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675100 () Bool)

(declare-fun res!441699 () Bool)

(assert (=> b!675100 (=> (not res!441699) (not e!385182))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39298 (_ BitVec 32) List!12921) Bool)

(assert (=> b!675100 (= res!441699 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675101 () Bool)

(declare-fun res!441697 () Bool)

(assert (=> b!675101 (=> (not res!441697) (not e!385182))))

(declare-fun e!385178 () Bool)

(assert (=> b!675101 (= res!441697 e!385178)))

(declare-fun res!441698 () Bool)

(assert (=> b!675101 (=> res!441698 e!385178)))

(declare-fun e!385179 () Bool)

(assert (=> b!675101 (= res!441698 e!385179)))

(declare-fun res!441693 () Bool)

(assert (=> b!675101 (=> (not res!441693) (not e!385179))))

(assert (=> b!675101 (= res!441693 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675102 () Bool)

(declare-fun res!441694 () Bool)

(assert (=> b!675102 (=> (not res!441694) (not e!385182))))

(declare-fun e!385177 () Bool)

(assert (=> b!675102 (= res!441694 e!385177)))

(declare-fun res!441700 () Bool)

(assert (=> b!675102 (=> res!441700 e!385177)))

(declare-fun e!385183 () Bool)

(assert (=> b!675102 (= res!441700 e!385183)))

(declare-fun res!441687 () Bool)

(assert (=> b!675102 (=> (not res!441687) (not e!385183))))

(assert (=> b!675102 (= res!441687 (bvsgt from!3004 i!1382))))

(declare-fun b!675103 () Bool)

(declare-fun res!441684 () Bool)

(assert (=> b!675103 (=> (not res!441684) (not e!385182))))

(assert (=> b!675103 (= res!441684 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun res!441702 () Bool)

(assert (=> start!60240 (=> (not res!441702) (not e!385182))))

(assert (=> start!60240 (= res!441702 (and (bvslt (size!19206 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19206 a!3626))))))

(assert (=> start!60240 e!385182))

(assert (=> start!60240 true))

(declare-fun array_inv!14724 (array!39298) Bool)

(assert (=> start!60240 (array_inv!14724 a!3626)))

(declare-fun b!675104 () Bool)

(declare-fun res!441691 () Bool)

(assert (=> b!675104 (=> (not res!441691) (not e!385182))))

(assert (=> b!675104 (= res!441691 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19206 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675105 () Bool)

(declare-fun e!385181 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!675105 (= e!385181 (not (contains!3443 acc!681 k!2843)))))

(declare-fun b!675106 () Bool)

(declare-fun e!385180 () Bool)

(assert (=> b!675106 (= e!385177 e!385180)))

(declare-fun res!441703 () Bool)

(assert (=> b!675106 (=> (not res!441703) (not e!385180))))

(assert (=> b!675106 (= res!441703 (bvsle from!3004 i!1382))))

(declare-fun b!675107 () Bool)

(assert (=> b!675107 (= e!385179 (contains!3443 acc!681 k!2843))))

(declare-fun b!675108 () Bool)

(declare-fun res!441689 () Bool)

(assert (=> b!675108 (=> (not res!441689) (not e!385182))))

(declare-fun arrayContainsKey!0 (array!39298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675108 (= res!441689 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675109 () Bool)

(declare-fun res!441695 () Bool)

(assert (=> b!675109 (=> (not res!441695) (not e!385182))))

(assert (=> b!675109 (= res!441695 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12918))))

(declare-fun b!675110 () Bool)

(assert (=> b!675110 (= e!385178 e!385181)))

(declare-fun res!441696 () Bool)

(assert (=> b!675110 (=> (not res!441696) (not e!385181))))

(assert (=> b!675110 (= res!441696 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675111 () Bool)

(assert (=> b!675111 (= e!385180 (not (contains!3443 acc!681 k!2843)))))

(declare-fun b!675112 () Bool)

(declare-fun res!441690 () Bool)

(assert (=> b!675112 (=> (not res!441690) (not e!385182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675112 (= res!441690 (not (validKeyInArray!0 (select (arr!18841 a!3626) from!3004))))))

(declare-fun b!675113 () Bool)

(declare-fun res!441685 () Bool)

(assert (=> b!675113 (=> (not res!441685) (not e!385182))))

(assert (=> b!675113 (= res!441685 (validKeyInArray!0 k!2843))))

(declare-fun b!675114 () Bool)

(assert (=> b!675114 (= e!385182 false)))

(declare-fun lt!312468 () Bool)

(assert (=> b!675114 (= lt!312468 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675115 () Bool)

(declare-fun res!441686 () Bool)

(assert (=> b!675115 (=> (not res!441686) (not e!385182))))

(declare-fun noDuplicate!712 (List!12921) Bool)

(assert (=> b!675115 (= res!441686 (noDuplicate!712 acc!681))))

(declare-fun b!675116 () Bool)

(declare-fun res!441692 () Bool)

(assert (=> b!675116 (=> (not res!441692) (not e!385182))))

(assert (=> b!675116 (= res!441692 (not (contains!3443 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675117 () Bool)

(assert (=> b!675117 (= e!385183 (contains!3443 acc!681 k!2843))))

(assert (= (and start!60240 res!441702) b!675115))

(assert (= (and b!675115 res!441686) b!675099))

(assert (= (and b!675099 res!441688) b!675116))

(assert (= (and b!675116 res!441692) b!675102))

(assert (= (and b!675102 res!441687) b!675117))

(assert (= (and b!675102 (not res!441700)) b!675106))

(assert (= (and b!675106 res!441703) b!675111))

(assert (= (and b!675102 res!441694) b!675109))

(assert (= (and b!675109 res!441695) b!675100))

(assert (= (and b!675100 res!441699) b!675098))

(assert (= (and b!675098 res!441701) b!675113))

(assert (= (and b!675113 res!441685) b!675108))

(assert (= (and b!675108 res!441689) b!675104))

(assert (= (and b!675104 res!441691) b!675112))

(assert (= (and b!675112 res!441690) b!675103))

(assert (= (and b!675103 res!441684) b!675101))

(assert (= (and b!675101 res!441693) b!675107))

(assert (= (and b!675101 (not res!441698)) b!675110))

(assert (= (and b!675110 res!441696) b!675105))

(assert (= (and b!675101 res!441697) b!675114))

(declare-fun m!642093 () Bool)

(assert (=> start!60240 m!642093))

(declare-fun m!642095 () Bool)

(assert (=> b!675105 m!642095))

(assert (=> b!675111 m!642095))

(assert (=> b!675117 m!642095))

(declare-fun m!642097 () Bool)

(assert (=> b!675114 m!642097))

(assert (=> b!675107 m!642095))

(declare-fun m!642099 () Bool)

(assert (=> b!675113 m!642099))

(declare-fun m!642101 () Bool)

(assert (=> b!675109 m!642101))

(declare-fun m!642103 () Bool)

(assert (=> b!675108 m!642103))

(declare-fun m!642105 () Bool)

(assert (=> b!675099 m!642105))

(declare-fun m!642107 () Bool)

(assert (=> b!675116 m!642107))

(declare-fun m!642109 () Bool)

(assert (=> b!675100 m!642109))

(declare-fun m!642111 () Bool)

(assert (=> b!675115 m!642111))

(declare-fun m!642113 () Bool)

(assert (=> b!675112 m!642113))

(assert (=> b!675112 m!642113))

(declare-fun m!642115 () Bool)

(assert (=> b!675112 m!642115))

(push 1)

(assert (not b!675115))

(assert (not b!675117))

(assert (not b!675108))

(assert (not b!675105))

(assert (not b!675100))

(assert (not b!675107))

(assert (not b!675114))

(assert (not b!675109))

(assert (not b!675112))

(assert (not b!675113))

(assert (not b!675111))

(assert (not b!675116))

(assert (not b!675099))

(assert (not start!60240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

