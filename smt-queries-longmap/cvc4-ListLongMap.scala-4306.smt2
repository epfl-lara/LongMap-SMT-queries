; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59868 () Bool)

(assert start!59868)

(declare-fun b!662108 () Bool)

(declare-fun res!430148 () Bool)

(declare-fun e!380190 () Bool)

(assert (=> b!662108 (=> (not res!430148) (not e!380190))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38915 0))(
  ( (array!38916 (arr!18650 (Array (_ BitVec 32) (_ BitVec 64))) (size!19014 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38915)

(assert (=> b!662108 (= res!430148 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19014 a!3626))))))

(declare-fun b!662109 () Bool)

(declare-datatypes ((Unit!22994 0))(
  ( (Unit!22995) )
))
(declare-fun e!380189 () Unit!22994)

(declare-fun Unit!22996 () Unit!22994)

(assert (=> b!662109 (= e!380189 Unit!22996)))

(declare-fun lt!308926 () Unit!22994)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38915 (_ BitVec 64) (_ BitVec 32)) Unit!22994)

(assert (=> b!662109 (= lt!308926 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!662109 false))

(declare-fun b!662110 () Bool)

(declare-fun res!430156 () Bool)

(assert (=> b!662110 (=> (not res!430156) (not e!380190))))

(declare-datatypes ((List!12691 0))(
  ( (Nil!12688) (Cons!12687 (h!13732 (_ BitVec 64)) (t!18919 List!12691)) )
))
(declare-fun acc!681 () List!12691)

(declare-fun contains!3268 (List!12691 (_ BitVec 64)) Bool)

(assert (=> b!662110 (= res!430156 (not (contains!3268 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662111 () Bool)

(declare-fun res!430138 () Bool)

(assert (=> b!662111 (=> (not res!430138) (not e!380190))))

(declare-fun arrayNoDuplicates!0 (array!38915 (_ BitVec 32) List!12691) Bool)

(assert (=> b!662111 (= res!430138 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12688))))

(declare-fun b!662112 () Bool)

(declare-fun e!380185 () Bool)

(declare-fun e!380183 () Bool)

(assert (=> b!662112 (= e!380185 e!380183)))

(declare-fun res!430147 () Bool)

(assert (=> b!662112 (=> res!430147 e!380183)))

(assert (=> b!662112 (= res!430147 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!308923 () List!12691)

(declare-fun $colon$colon!139 (List!12691 (_ BitVec 64)) List!12691)

(assert (=> b!662112 (= lt!308923 ($colon$colon!139 acc!681 (select (arr!18650 a!3626) from!3004)))))

(declare-fun subseq!7 (List!12691 List!12691) Bool)

(assert (=> b!662112 (subseq!7 acc!681 acc!681)))

(declare-fun lt!308921 () Unit!22994)

(declare-fun lemmaListSubSeqRefl!0 (List!12691) Unit!22994)

(assert (=> b!662112 (= lt!308921 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662113 () Bool)

(declare-fun res!430152 () Bool)

(assert (=> b!662113 (=> (not res!430152) (not e!380190))))

(declare-fun noDuplicate!515 (List!12691) Bool)

(assert (=> b!662113 (= res!430152 (noDuplicate!515 acc!681))))

(declare-fun b!662114 () Bool)

(declare-fun res!430141 () Bool)

(assert (=> b!662114 (=> res!430141 e!380183)))

(assert (=> b!662114 (= res!430141 (not (subseq!7 acc!681 lt!308923)))))

(declare-fun b!662116 () Bool)

(declare-fun e!380188 () Bool)

(assert (=> b!662116 (= e!380188 (not (contains!3268 acc!681 k!2843)))))

(declare-fun b!662117 () Bool)

(declare-fun res!430144 () Bool)

(assert (=> b!662117 (=> res!430144 e!380183)))

(assert (=> b!662117 (= res!430144 (contains!3268 lt!308923 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662118 () Bool)

(assert (=> b!662118 (= e!380183 true)))

(declare-fun lt!308925 () Bool)

(assert (=> b!662118 (= lt!308925 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308923))))

(declare-fun lt!308924 () Unit!22994)

(declare-fun noDuplicateSubseq!7 (List!12691 List!12691) Unit!22994)

(assert (=> b!662118 (= lt!308924 (noDuplicateSubseq!7 acc!681 lt!308923))))

(declare-fun b!662119 () Bool)

(declare-fun res!430139 () Bool)

(assert (=> b!662119 (=> (not res!430139) (not e!380190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662119 (= res!430139 (validKeyInArray!0 k!2843))))

(declare-fun res!430157 () Bool)

(assert (=> start!59868 (=> (not res!430157) (not e!380190))))

(assert (=> start!59868 (= res!430157 (and (bvslt (size!19014 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19014 a!3626))))))

(assert (=> start!59868 e!380190))

(assert (=> start!59868 true))

(declare-fun array_inv!14446 (array!38915) Bool)

(assert (=> start!59868 (array_inv!14446 a!3626)))

(declare-fun b!662115 () Bool)

(declare-fun res!430143 () Bool)

(assert (=> b!662115 (=> (not res!430143) (not e!380190))))

(declare-fun e!380187 () Bool)

(assert (=> b!662115 (= res!430143 e!380187)))

(declare-fun res!430142 () Bool)

(assert (=> b!662115 (=> res!430142 e!380187)))

(declare-fun e!380184 () Bool)

(assert (=> b!662115 (= res!430142 e!380184)))

(declare-fun res!430151 () Bool)

(assert (=> b!662115 (=> (not res!430151) (not e!380184))))

(assert (=> b!662115 (= res!430151 (bvsgt from!3004 i!1382))))

(declare-fun b!662120 () Bool)

(assert (=> b!662120 (= e!380187 e!380188)))

(declare-fun res!430150 () Bool)

(assert (=> b!662120 (=> (not res!430150) (not e!380188))))

(assert (=> b!662120 (= res!430150 (bvsle from!3004 i!1382))))

(declare-fun b!662121 () Bool)

(assert (=> b!662121 (= e!380184 (contains!3268 acc!681 k!2843))))

(declare-fun b!662122 () Bool)

(declare-fun res!430154 () Bool)

(assert (=> b!662122 (=> res!430154 e!380183)))

(assert (=> b!662122 (= res!430154 (contains!3268 lt!308923 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662123 () Bool)

(declare-fun Unit!22997 () Unit!22994)

(assert (=> b!662123 (= e!380189 Unit!22997)))

(declare-fun b!662124 () Bool)

(declare-fun res!430146 () Bool)

(assert (=> b!662124 (=> (not res!430146) (not e!380190))))

(assert (=> b!662124 (= res!430146 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662125 () Bool)

(assert (=> b!662125 (= e!380190 (not e!380185))))

(declare-fun res!430149 () Bool)

(assert (=> b!662125 (=> res!430149 e!380185)))

(assert (=> b!662125 (= res!430149 (not (validKeyInArray!0 (select (arr!18650 a!3626) from!3004))))))

(declare-fun lt!308922 () Unit!22994)

(assert (=> b!662125 (= lt!308922 e!380189)))

(declare-fun c!76352 () Bool)

(declare-fun arrayContainsKey!0 (array!38915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662125 (= c!76352 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662125 (arrayContainsKey!0 (array!38916 (store (arr!18650 a!3626) i!1382 k!2843) (size!19014 a!3626)) k!2843 from!3004)))

(declare-fun b!662126 () Bool)

(declare-fun res!430145 () Bool)

(assert (=> b!662126 (=> res!430145 e!380183)))

(assert (=> b!662126 (= res!430145 (not (noDuplicate!515 lt!308923)))))

(declare-fun b!662127 () Bool)

(declare-fun res!430140 () Bool)

(assert (=> b!662127 (=> (not res!430140) (not e!380190))))

(assert (=> b!662127 (= res!430140 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19014 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662128 () Bool)

(declare-fun res!430155 () Bool)

(assert (=> b!662128 (=> (not res!430155) (not e!380190))))

(assert (=> b!662128 (= res!430155 (not (contains!3268 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662129 () Bool)

(declare-fun res!430153 () Bool)

(assert (=> b!662129 (=> (not res!430153) (not e!380190))))

(assert (=> b!662129 (= res!430153 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!59868 res!430157) b!662113))

(assert (= (and b!662113 res!430152) b!662110))

(assert (= (and b!662110 res!430156) b!662128))

(assert (= (and b!662128 res!430155) b!662115))

(assert (= (and b!662115 res!430151) b!662121))

(assert (= (and b!662115 (not res!430142)) b!662120))

(assert (= (and b!662120 res!430150) b!662116))

(assert (= (and b!662115 res!430143) b!662111))

(assert (= (and b!662111 res!430138) b!662124))

(assert (= (and b!662124 res!430146) b!662108))

(assert (= (and b!662108 res!430148) b!662119))

(assert (= (and b!662119 res!430139) b!662129))

(assert (= (and b!662129 res!430153) b!662127))

(assert (= (and b!662127 res!430140) b!662125))

(assert (= (and b!662125 c!76352) b!662109))

(assert (= (and b!662125 (not c!76352)) b!662123))

(assert (= (and b!662125 (not res!430149)) b!662112))

(assert (= (and b!662112 (not res!430147)) b!662126))

(assert (= (and b!662126 (not res!430145)) b!662117))

(assert (= (and b!662117 (not res!430144)) b!662122))

(assert (= (and b!662122 (not res!430154)) b!662114))

(assert (= (and b!662114 (not res!430141)) b!662118))

(declare-fun m!634037 () Bool)

(assert (=> b!662112 m!634037))

(assert (=> b!662112 m!634037))

(declare-fun m!634039 () Bool)

(assert (=> b!662112 m!634039))

(declare-fun m!634041 () Bool)

(assert (=> b!662112 m!634041))

(declare-fun m!634043 () Bool)

(assert (=> b!662112 m!634043))

(declare-fun m!634045 () Bool)

(assert (=> b!662114 m!634045))

(declare-fun m!634047 () Bool)

(assert (=> b!662121 m!634047))

(declare-fun m!634049 () Bool)

(assert (=> b!662113 m!634049))

(declare-fun m!634051 () Bool)

(assert (=> b!662126 m!634051))

(declare-fun m!634053 () Bool)

(assert (=> b!662129 m!634053))

(declare-fun m!634055 () Bool)

(assert (=> b!662122 m!634055))

(declare-fun m!634057 () Bool)

(assert (=> b!662109 m!634057))

(declare-fun m!634059 () Bool)

(assert (=> b!662117 m!634059))

(assert (=> b!662125 m!634037))

(declare-fun m!634061 () Bool)

(assert (=> b!662125 m!634061))

(declare-fun m!634063 () Bool)

(assert (=> b!662125 m!634063))

(assert (=> b!662125 m!634037))

(declare-fun m!634065 () Bool)

(assert (=> b!662125 m!634065))

(declare-fun m!634067 () Bool)

(assert (=> b!662125 m!634067))

(assert (=> b!662116 m!634047))

(declare-fun m!634069 () Bool)

(assert (=> b!662124 m!634069))

(declare-fun m!634071 () Bool)

(assert (=> b!662118 m!634071))

(declare-fun m!634073 () Bool)

(assert (=> b!662118 m!634073))

(declare-fun m!634075 () Bool)

(assert (=> b!662111 m!634075))

(declare-fun m!634077 () Bool)

(assert (=> b!662128 m!634077))

(declare-fun m!634079 () Bool)

(assert (=> b!662110 m!634079))

(declare-fun m!634081 () Bool)

(assert (=> start!59868 m!634081))

(declare-fun m!634083 () Bool)

(assert (=> b!662119 m!634083))

(push 1)

