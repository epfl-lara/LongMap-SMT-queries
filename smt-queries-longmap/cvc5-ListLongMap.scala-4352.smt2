; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60132 () Bool)

(assert start!60132)

(declare-fun res!437923 () Bool)

(declare-fun e!383509 () Bool)

(assert (=> start!60132 (=> (not res!437923) (not e!383509))))

(declare-datatypes ((array!39190 0))(
  ( (array!39191 (arr!18787 (Array (_ BitVec 32) (_ BitVec 64))) (size!19152 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39190)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60132 (= res!437923 (and (bvslt (size!19152 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19152 a!3626))))))

(assert (=> start!60132 e!383509))

(assert (=> start!60132 true))

(declare-fun array_inv!14670 (array!39190) Bool)

(assert (=> start!60132 (array_inv!14670 a!3626)))

(declare-fun b!671052 () Bool)

(declare-fun res!437922 () Bool)

(assert (=> b!671052 (=> (not res!437922) (not e!383509))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671052 (= res!437922 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19152 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671053 () Bool)

(declare-fun res!437910 () Bool)

(assert (=> b!671053 (=> (not res!437910) (not e!383509))))

(assert (=> b!671053 (= res!437910 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19152 a!3626))))))

(declare-fun b!671054 () Bool)

(declare-fun res!437919 () Bool)

(assert (=> b!671054 (=> (not res!437919) (not e!383509))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671054 (= res!437919 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671055 () Bool)

(declare-fun res!437909 () Bool)

(assert (=> b!671055 (=> (not res!437909) (not e!383509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671055 (= res!437909 (validKeyInArray!0 k!2843))))

(declare-fun b!671056 () Bool)

(declare-fun e!383506 () Bool)

(declare-datatypes ((List!12867 0))(
  ( (Nil!12864) (Cons!12863 (h!13908 (_ BitVec 64)) (t!19086 List!12867)) )
))
(declare-fun acc!681 () List!12867)

(declare-fun contains!3389 (List!12867 (_ BitVec 64)) Bool)

(assert (=> b!671056 (= e!383506 (contains!3389 acc!681 k!2843))))

(declare-fun b!671057 () Bool)

(declare-fun res!437908 () Bool)

(assert (=> b!671057 (=> (not res!437908) (not e!383509))))

(assert (=> b!671057 (= res!437908 (not (contains!3389 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671058 () Bool)

(declare-fun res!437916 () Bool)

(assert (=> b!671058 (=> (not res!437916) (not e!383509))))

(declare-fun arrayNoDuplicates!0 (array!39190 (_ BitVec 32) List!12867) Bool)

(assert (=> b!671058 (= res!437916 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671059 () Bool)

(declare-fun res!437911 () Bool)

(assert (=> b!671059 (=> (not res!437911) (not e!383509))))

(declare-fun e!383508 () Bool)

(assert (=> b!671059 (= res!437911 e!383508)))

(declare-fun res!437912 () Bool)

(assert (=> b!671059 (=> res!437912 e!383508)))

(assert (=> b!671059 (= res!437912 e!383506)))

(declare-fun res!437915 () Bool)

(assert (=> b!671059 (=> (not res!437915) (not e!383506))))

(assert (=> b!671059 (= res!437915 (bvsgt from!3004 i!1382))))

(declare-fun b!671060 () Bool)

(declare-fun e!383510 () Bool)

(assert (=> b!671060 (= e!383510 (not (contains!3389 acc!681 k!2843)))))

(declare-fun b!671061 () Bool)

(declare-fun res!437918 () Bool)

(assert (=> b!671061 (=> (not res!437918) (not e!383509))))

(assert (=> b!671061 (= res!437918 (not (contains!3389 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671062 () Bool)

(assert (=> b!671062 (= e!383509 (not true))))

(assert (=> b!671062 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671063 () Bool)

(declare-fun res!437913 () Bool)

(assert (=> b!671063 (=> (not res!437913) (not e!383509))))

(assert (=> b!671063 (= res!437913 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12864))))

(declare-fun b!671064 () Bool)

(declare-fun res!437920 () Bool)

(assert (=> b!671064 (=> (not res!437920) (not e!383509))))

(declare-fun noDuplicate!658 (List!12867) Bool)

(assert (=> b!671064 (= res!437920 (noDuplicate!658 acc!681))))

(declare-fun b!671065 () Bool)

(declare-fun res!437914 () Bool)

(assert (=> b!671065 (=> (not res!437914) (not e!383509))))

(assert (=> b!671065 (= res!437914 (= (select (arr!18787 a!3626) from!3004) k!2843))))

(declare-fun b!671066 () Bool)

(declare-fun res!437921 () Bool)

(assert (=> b!671066 (=> (not res!437921) (not e!383509))))

(assert (=> b!671066 (= res!437921 (validKeyInArray!0 (select (arr!18787 a!3626) from!3004)))))

(declare-fun b!671067 () Bool)

(assert (=> b!671067 (= e!383508 e!383510)))

(declare-fun res!437917 () Bool)

(assert (=> b!671067 (=> (not res!437917) (not e!383510))))

(assert (=> b!671067 (= res!437917 (bvsle from!3004 i!1382))))

(assert (= (and start!60132 res!437923) b!671064))

(assert (= (and b!671064 res!437920) b!671061))

(assert (= (and b!671061 res!437918) b!671057))

(assert (= (and b!671057 res!437908) b!671059))

(assert (= (and b!671059 res!437915) b!671056))

(assert (= (and b!671059 (not res!437912)) b!671067))

(assert (= (and b!671067 res!437917) b!671060))

(assert (= (and b!671059 res!437911) b!671063))

(assert (= (and b!671063 res!437913) b!671058))

(assert (= (and b!671058 res!437916) b!671053))

(assert (= (and b!671053 res!437910) b!671055))

(assert (= (and b!671055 res!437909) b!671054))

(assert (= (and b!671054 res!437919) b!671052))

(assert (= (and b!671052 res!437922) b!671066))

(assert (= (and b!671066 res!437921) b!671065))

(assert (= (and b!671065 res!437914) b!671062))

(declare-fun m!640095 () Bool)

(assert (=> b!671061 m!640095))

(declare-fun m!640097 () Bool)

(assert (=> b!671063 m!640097))

(declare-fun m!640099 () Bool)

(assert (=> b!671056 m!640099))

(declare-fun m!640101 () Bool)

(assert (=> b!671065 m!640101))

(assert (=> b!671066 m!640101))

(assert (=> b!671066 m!640101))

(declare-fun m!640103 () Bool)

(assert (=> b!671066 m!640103))

(declare-fun m!640105 () Bool)

(assert (=> b!671062 m!640105))

(declare-fun m!640107 () Bool)

(assert (=> start!60132 m!640107))

(declare-fun m!640109 () Bool)

(assert (=> b!671057 m!640109))

(declare-fun m!640111 () Bool)

(assert (=> b!671054 m!640111))

(assert (=> b!671060 m!640099))

(declare-fun m!640113 () Bool)

(assert (=> b!671058 m!640113))

(declare-fun m!640115 () Bool)

(assert (=> b!671064 m!640115))

(declare-fun m!640117 () Bool)

(assert (=> b!671055 m!640117))

(push 1)

(assert (not b!671056))

(assert (not b!671061))

(assert (not b!671054))

(assert (not b!671062))

(assert (not b!671058))

(assert (not b!671060))

(assert (not b!671057))

(assert (not b!671063))

(assert (not b!671066))

(assert (not b!671064))

(assert (not b!671055))

(assert (not start!60132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

