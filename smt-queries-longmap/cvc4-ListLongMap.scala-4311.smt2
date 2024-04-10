; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59898 () Bool)

(assert start!59898)

(declare-fun b!663098 () Bool)

(declare-fun res!431042 () Bool)

(declare-fun e!380543 () Bool)

(assert (=> b!663098 (=> res!431042 e!380543)))

(declare-datatypes ((List!12706 0))(
  ( (Nil!12703) (Cons!12702 (h!13747 (_ BitVec 64)) (t!18934 List!12706)) )
))
(declare-fun lt!309191 () List!12706)

(declare-fun contains!3283 (List!12706 (_ BitVec 64)) Bool)

(assert (=> b!663098 (= res!431042 (contains!3283 lt!309191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663099 () Bool)

(declare-fun e!380546 () Bool)

(declare-fun e!380548 () Bool)

(assert (=> b!663099 (= e!380546 e!380548)))

(declare-fun res!431051 () Bool)

(assert (=> b!663099 (=> (not res!431051) (not e!380548))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663099 (= res!431051 (bvsle from!3004 i!1382))))

(declare-fun b!663100 () Bool)

(declare-fun res!431048 () Bool)

(declare-fun e!380545 () Bool)

(assert (=> b!663100 (=> (not res!431048) (not e!380545))))

(declare-datatypes ((array!38945 0))(
  ( (array!38946 (arr!18665 (Array (_ BitVec 32) (_ BitVec 64))) (size!19029 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38945)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663100 (= res!431048 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663101 () Bool)

(declare-fun res!431053 () Bool)

(assert (=> b!663101 (=> (not res!431053) (not e!380545))))

(assert (=> b!663101 (= res!431053 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19029 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663102 () Bool)

(declare-fun res!431055 () Bool)

(assert (=> b!663102 (=> (not res!431055) (not e!380545))))

(declare-fun arrayNoDuplicates!0 (array!38945 (_ BitVec 32) List!12706) Bool)

(assert (=> b!663102 (= res!431055 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12703))))

(declare-fun b!663103 () Bool)

(declare-fun res!431045 () Bool)

(assert (=> b!663103 (=> (not res!431045) (not e!380545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663103 (= res!431045 (validKeyInArray!0 k!2843))))

(declare-fun b!663104 () Bool)

(declare-datatypes ((Unit!23054 0))(
  ( (Unit!23055) )
))
(declare-fun e!380544 () Unit!23054)

(declare-fun Unit!23056 () Unit!23054)

(assert (=> b!663104 (= e!380544 Unit!23056)))

(declare-fun b!663105 () Bool)

(declare-fun res!431054 () Bool)

(assert (=> b!663105 (=> (not res!431054) (not e!380545))))

(declare-fun acc!681 () List!12706)

(declare-fun noDuplicate!530 (List!12706) Bool)

(assert (=> b!663105 (= res!431054 (noDuplicate!530 acc!681))))

(declare-fun b!663106 () Bool)

(declare-fun res!431044 () Bool)

(assert (=> b!663106 (=> (not res!431044) (not e!380545))))

(assert (=> b!663106 (= res!431044 (not (contains!3283 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663107 () Bool)

(declare-fun res!431039 () Bool)

(assert (=> b!663107 (=> res!431039 e!380543)))

(assert (=> b!663107 (= res!431039 (not (noDuplicate!530 lt!309191)))))

(declare-fun res!431041 () Bool)

(assert (=> start!59898 (=> (not res!431041) (not e!380545))))

(assert (=> start!59898 (= res!431041 (and (bvslt (size!19029 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19029 a!3626))))))

(assert (=> start!59898 e!380545))

(assert (=> start!59898 true))

(declare-fun array_inv!14461 (array!38945) Bool)

(assert (=> start!59898 (array_inv!14461 a!3626)))

(declare-fun b!663108 () Bool)

(assert (=> b!663108 (= e!380543 true)))

(declare-fun lt!309195 () Bool)

(assert (=> b!663108 (= lt!309195 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309191))))

(declare-fun lt!309192 () Unit!23054)

(declare-fun noDuplicateSubseq!22 (List!12706 List!12706) Unit!23054)

(assert (=> b!663108 (= lt!309192 (noDuplicateSubseq!22 acc!681 lt!309191))))

(declare-fun b!663109 () Bool)

(declare-fun res!431056 () Bool)

(assert (=> b!663109 (=> (not res!431056) (not e!380545))))

(assert (=> b!663109 (= res!431056 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663110 () Bool)

(declare-fun res!431050 () Bool)

(assert (=> b!663110 (=> (not res!431050) (not e!380545))))

(assert (=> b!663110 (= res!431050 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19029 a!3626))))))

(declare-fun b!663111 () Bool)

(declare-fun Unit!23057 () Unit!23054)

(assert (=> b!663111 (= e!380544 Unit!23057)))

(declare-fun lt!309194 () Unit!23054)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38945 (_ BitVec 64) (_ BitVec 32)) Unit!23054)

(assert (=> b!663111 (= lt!309194 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663111 false))

(declare-fun b!663112 () Bool)

(declare-fun e!380549 () Bool)

(assert (=> b!663112 (= e!380549 (contains!3283 acc!681 k!2843))))

(declare-fun b!663113 () Bool)

(declare-fun e!380547 () Bool)

(assert (=> b!663113 (= e!380547 e!380543)))

(declare-fun res!431046 () Bool)

(assert (=> b!663113 (=> res!431046 e!380543)))

(assert (=> b!663113 (= res!431046 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!154 (List!12706 (_ BitVec 64)) List!12706)

(assert (=> b!663113 (= lt!309191 ($colon$colon!154 acc!681 (select (arr!18665 a!3626) from!3004)))))

(declare-fun subseq!22 (List!12706 List!12706) Bool)

(assert (=> b!663113 (subseq!22 acc!681 acc!681)))

(declare-fun lt!309196 () Unit!23054)

(declare-fun lemmaListSubSeqRefl!0 (List!12706) Unit!23054)

(assert (=> b!663113 (= lt!309196 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!663114 () Bool)

(declare-fun res!431049 () Bool)

(assert (=> b!663114 (=> res!431049 e!380543)))

(assert (=> b!663114 (= res!431049 (contains!3283 lt!309191 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663115 () Bool)

(assert (=> b!663115 (= e!380548 (not (contains!3283 acc!681 k!2843)))))

(declare-fun b!663116 () Bool)

(assert (=> b!663116 (= e!380545 (not e!380547))))

(declare-fun res!431043 () Bool)

(assert (=> b!663116 (=> res!431043 e!380547)))

(assert (=> b!663116 (= res!431043 (not (validKeyInArray!0 (select (arr!18665 a!3626) from!3004))))))

(declare-fun lt!309193 () Unit!23054)

(assert (=> b!663116 (= lt!309193 e!380544)))

(declare-fun c!76397 () Bool)

(assert (=> b!663116 (= c!76397 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663116 (arrayContainsKey!0 (array!38946 (store (arr!18665 a!3626) i!1382 k!2843) (size!19029 a!3626)) k!2843 from!3004)))

(declare-fun b!663117 () Bool)

(declare-fun res!431052 () Bool)

(assert (=> b!663117 (=> (not res!431052) (not e!380545))))

(assert (=> b!663117 (= res!431052 (not (contains!3283 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663118 () Bool)

(declare-fun res!431040 () Bool)

(assert (=> b!663118 (=> (not res!431040) (not e!380545))))

(assert (=> b!663118 (= res!431040 e!380546)))

(declare-fun res!431057 () Bool)

(assert (=> b!663118 (=> res!431057 e!380546)))

(assert (=> b!663118 (= res!431057 e!380549)))

(declare-fun res!431038 () Bool)

(assert (=> b!663118 (=> (not res!431038) (not e!380549))))

(assert (=> b!663118 (= res!431038 (bvsgt from!3004 i!1382))))

(declare-fun b!663119 () Bool)

(declare-fun res!431047 () Bool)

(assert (=> b!663119 (=> res!431047 e!380543)))

(assert (=> b!663119 (= res!431047 (not (subseq!22 acc!681 lt!309191)))))

(assert (= (and start!59898 res!431041) b!663105))

(assert (= (and b!663105 res!431054) b!663106))

(assert (= (and b!663106 res!431044) b!663117))

(assert (= (and b!663117 res!431052) b!663118))

(assert (= (and b!663118 res!431038) b!663112))

(assert (= (and b!663118 (not res!431057)) b!663099))

(assert (= (and b!663099 res!431051) b!663115))

(assert (= (and b!663118 res!431040) b!663102))

(assert (= (and b!663102 res!431055) b!663109))

(assert (= (and b!663109 res!431056) b!663110))

(assert (= (and b!663110 res!431050) b!663103))

(assert (= (and b!663103 res!431045) b!663100))

(assert (= (and b!663100 res!431048) b!663101))

(assert (= (and b!663101 res!431053) b!663116))

(assert (= (and b!663116 c!76397) b!663111))

(assert (= (and b!663116 (not c!76397)) b!663104))

(assert (= (and b!663116 (not res!431043)) b!663113))

(assert (= (and b!663113 (not res!431046)) b!663107))

(assert (= (and b!663107 (not res!431039)) b!663098))

(assert (= (and b!663098 (not res!431042)) b!663114))

(assert (= (and b!663114 (not res!431049)) b!663119))

(assert (= (and b!663119 (not res!431047)) b!663108))

(declare-fun m!634757 () Bool)

(assert (=> b!663107 m!634757))

(declare-fun m!634759 () Bool)

(assert (=> b!663115 m!634759))

(declare-fun m!634761 () Bool)

(assert (=> b!663111 m!634761))

(declare-fun m!634763 () Bool)

(assert (=> b!663113 m!634763))

(assert (=> b!663113 m!634763))

(declare-fun m!634765 () Bool)

(assert (=> b!663113 m!634765))

(declare-fun m!634767 () Bool)

(assert (=> b!663113 m!634767))

(declare-fun m!634769 () Bool)

(assert (=> b!663113 m!634769))

(declare-fun m!634771 () Bool)

(assert (=> b!663100 m!634771))

(assert (=> b!663116 m!634763))

(declare-fun m!634773 () Bool)

(assert (=> b!663116 m!634773))

(declare-fun m!634775 () Bool)

(assert (=> b!663116 m!634775))

(assert (=> b!663116 m!634763))

(declare-fun m!634777 () Bool)

(assert (=> b!663116 m!634777))

(declare-fun m!634779 () Bool)

(assert (=> b!663116 m!634779))

(declare-fun m!634781 () Bool)

(assert (=> b!663102 m!634781))

(declare-fun m!634783 () Bool)

(assert (=> start!59898 m!634783))

(declare-fun m!634785 () Bool)

(assert (=> b!663108 m!634785))

(declare-fun m!634787 () Bool)

(assert (=> b!663108 m!634787))

(declare-fun m!634789 () Bool)

(assert (=> b!663106 m!634789))

(declare-fun m!634791 () Bool)

(assert (=> b!663103 m!634791))

(declare-fun m!634793 () Bool)

(assert (=> b!663105 m!634793))

(declare-fun m!634795 () Bool)

(assert (=> b!663114 m!634795))

(declare-fun m!634797 () Bool)

(assert (=> b!663119 m!634797))

(declare-fun m!634799 () Bool)

(assert (=> b!663117 m!634799))

(declare-fun m!634801 () Bool)

(assert (=> b!663098 m!634801))

(declare-fun m!634803 () Bool)

(assert (=> b!663109 m!634803))

(assert (=> b!663112 m!634759))

(push 1)

