; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59960 () Bool)

(assert start!59960)

(declare-fun b!665078 () Bool)

(declare-fun res!432678 () Bool)

(declare-fun e!381245 () Bool)

(assert (=> b!665078 (=> res!432678 e!381245)))

(declare-fun lt!309880 () Bool)

(assert (=> b!665078 (= res!432678 lt!309880)))

(declare-fun b!665079 () Bool)

(declare-fun res!432680 () Bool)

(declare-fun e!381243 () Bool)

(assert (=> b!665079 (=> (not res!432680) (not e!381243))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665079 (= res!432680 (validKeyInArray!0 k!2843))))

(declare-fun b!665080 () Bool)

(declare-fun res!432674 () Bool)

(assert (=> b!665080 (=> (not res!432674) (not e!381243))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39007 0))(
  ( (array!39008 (arr!18696 (Array (_ BitVec 32) (_ BitVec 64))) (size!19060 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39007)

(assert (=> b!665080 (= res!432674 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19060 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665081 () Bool)

(declare-fun res!432682 () Bool)

(assert (=> b!665081 (=> (not res!432682) (not e!381243))))

(declare-datatypes ((List!12737 0))(
  ( (Nil!12734) (Cons!12733 (h!13778 (_ BitVec 64)) (t!18965 List!12737)) )
))
(declare-fun acc!681 () List!12737)

(declare-fun noDuplicate!561 (List!12737) Bool)

(assert (=> b!665081 (= res!432682 (noDuplicate!561 acc!681))))

(declare-fun b!665082 () Bool)

(declare-fun e!381244 () Bool)

(declare-fun contains!3314 (List!12737 (_ BitVec 64)) Bool)

(assert (=> b!665082 (= e!381244 (not (contains!3314 acc!681 k!2843)))))

(declare-fun res!432681 () Bool)

(assert (=> start!59960 (=> (not res!432681) (not e!381243))))

(assert (=> start!59960 (= res!432681 (and (bvslt (size!19060 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19060 a!3626))))))

(assert (=> start!59960 e!381243))

(assert (=> start!59960 true))

(declare-fun array_inv!14492 (array!39007) Bool)

(assert (=> start!59960 (array_inv!14492 a!3626)))

(declare-fun b!665083 () Bool)

(declare-fun res!432669 () Bool)

(assert (=> b!665083 (=> (not res!432669) (not e!381243))))

(assert (=> b!665083 (= res!432669 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19060 a!3626))))))

(declare-fun b!665084 () Bool)

(declare-datatypes ((Unit!23205 0))(
  ( (Unit!23206) )
))
(declare-fun e!381249 () Unit!23205)

(declare-fun lt!309874 () Unit!23205)

(assert (=> b!665084 (= e!381249 lt!309874)))

(declare-fun lt!309883 () Unit!23205)

(declare-fun lemmaListSubSeqRefl!0 (List!12737) Unit!23205)

(assert (=> b!665084 (= lt!309883 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!53 (List!12737 List!12737) Bool)

(assert (=> b!665084 (subseq!53 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39007 List!12737 List!12737 (_ BitVec 32)) Unit!23205)

(declare-fun $colon$colon!185 (List!12737 (_ BitVec 64)) List!12737)

(assert (=> b!665084 (= lt!309874 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!185 acc!681 (select (arr!18696 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39007 (_ BitVec 32) List!12737) Bool)

(assert (=> b!665084 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665085 () Bool)

(declare-fun e!381248 () Bool)

(assert (=> b!665085 (= e!381248 e!381244)))

(declare-fun res!432670 () Bool)

(assert (=> b!665085 (=> (not res!432670) (not e!381244))))

(assert (=> b!665085 (= res!432670 (bvsle from!3004 i!1382))))

(declare-fun b!665086 () Bool)

(declare-fun res!432675 () Bool)

(assert (=> b!665086 (=> (not res!432675) (not e!381243))))

(assert (=> b!665086 (= res!432675 e!381248)))

(declare-fun res!432667 () Bool)

(assert (=> b!665086 (=> res!432667 e!381248)))

(declare-fun e!381246 () Bool)

(assert (=> b!665086 (= res!432667 e!381246)))

(declare-fun res!432686 () Bool)

(assert (=> b!665086 (=> (not res!432686) (not e!381246))))

(assert (=> b!665086 (= res!432686 (bvsgt from!3004 i!1382))))

(declare-fun b!665087 () Bool)

(declare-fun res!432666 () Bool)

(assert (=> b!665087 (=> res!432666 e!381245)))

(declare-fun lt!309876 () List!12737)

(assert (=> b!665087 (= res!432666 (not (subseq!53 acc!681 lt!309876)))))

(declare-fun b!665088 () Bool)

(declare-fun res!432668 () Bool)

(assert (=> b!665088 (=> (not res!432668) (not e!381243))))

(assert (=> b!665088 (= res!432668 (not (contains!3314 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665089 () Bool)

(declare-fun e!381242 () Unit!23205)

(declare-fun Unit!23207 () Unit!23205)

(assert (=> b!665089 (= e!381242 Unit!23207)))

(declare-fun b!665090 () Bool)

(declare-fun res!432672 () Bool)

(assert (=> b!665090 (=> (not res!432672) (not e!381243))))

(assert (=> b!665090 (= res!432672 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12734))))

(declare-fun b!665091 () Bool)

(assert (=> b!665091 (= e!381243 (not e!381245))))

(declare-fun res!432676 () Bool)

(assert (=> b!665091 (=> res!432676 e!381245)))

(assert (=> b!665091 (= res!432676 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!51 (List!12737 (_ BitVec 64)) List!12737)

(assert (=> b!665091 (= (-!51 lt!309876 k!2843) acc!681)))

(assert (=> b!665091 (= lt!309876 ($colon$colon!185 acc!681 k!2843))))

(declare-fun lt!309877 () Unit!23205)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12737) Unit!23205)

(assert (=> b!665091 (= lt!309877 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!665091 (subseq!53 acc!681 acc!681)))

(declare-fun lt!309882 () Unit!23205)

(assert (=> b!665091 (= lt!309882 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665091 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309879 () Unit!23205)

(assert (=> b!665091 (= lt!309879 e!381249)))

(declare-fun c!76574 () Bool)

(assert (=> b!665091 (= c!76574 (validKeyInArray!0 (select (arr!18696 a!3626) from!3004)))))

(declare-fun lt!309878 () Unit!23205)

(assert (=> b!665091 (= lt!309878 e!381242)))

(declare-fun c!76573 () Bool)

(assert (=> b!665091 (= c!76573 lt!309880)))

(declare-fun arrayContainsKey!0 (array!39007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665091 (= lt!309880 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665091 (arrayContainsKey!0 (array!39008 (store (arr!18696 a!3626) i!1382 k!2843) (size!19060 a!3626)) k!2843 from!3004)))

(declare-fun b!665092 () Bool)

(declare-fun res!432677 () Bool)

(assert (=> b!665092 (=> res!432677 e!381245)))

(assert (=> b!665092 (= res!432677 (contains!3314 acc!681 k!2843))))

(declare-fun b!665093 () Bool)

(declare-fun res!432671 () Bool)

(assert (=> b!665093 (=> res!432671 e!381245)))

(assert (=> b!665093 (= res!432671 (not (contains!3314 lt!309876 k!2843)))))

(declare-fun b!665094 () Bool)

(declare-fun res!432673 () Bool)

(assert (=> b!665094 (=> res!432673 e!381245)))

(assert (=> b!665094 (= res!432673 (not (noDuplicate!561 lt!309876)))))

(declare-fun b!665095 () Bool)

(assert (=> b!665095 (= e!381246 (contains!3314 acc!681 k!2843))))

(declare-fun b!665096 () Bool)

(declare-fun res!432683 () Bool)

(assert (=> b!665096 (=> (not res!432683) (not e!381243))))

(assert (=> b!665096 (= res!432683 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665097 () Bool)

(declare-fun res!432679 () Bool)

(assert (=> b!665097 (=> (not res!432679) (not e!381243))))

(assert (=> b!665097 (= res!432679 (not (contains!3314 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665098 () Bool)

(declare-fun res!432684 () Bool)

(assert (=> b!665098 (=> (not res!432684) (not e!381243))))

(assert (=> b!665098 (= res!432684 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665099 () Bool)

(declare-fun res!432685 () Bool)

(assert (=> b!665099 (=> res!432685 e!381245)))

(assert (=> b!665099 (= res!432685 (contains!3314 lt!309876 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665100 () Bool)

(declare-fun Unit!23208 () Unit!23205)

(assert (=> b!665100 (= e!381242 Unit!23208)))

(declare-fun lt!309875 () Unit!23205)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39007 (_ BitVec 64) (_ BitVec 32)) Unit!23205)

(assert (=> b!665100 (= lt!309875 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665100 false))

(declare-fun b!665101 () Bool)

(declare-fun Unit!23209 () Unit!23205)

(assert (=> b!665101 (= e!381249 Unit!23209)))

(declare-fun b!665102 () Bool)

(assert (=> b!665102 (= e!381245 true)))

(declare-fun lt!309881 () Bool)

(assert (=> b!665102 (= lt!309881 (contains!3314 lt!309876 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!59960 res!432681) b!665081))

(assert (= (and b!665081 res!432682) b!665088))

(assert (= (and b!665088 res!432668) b!665097))

(assert (= (and b!665097 res!432679) b!665086))

(assert (= (and b!665086 res!432686) b!665095))

(assert (= (and b!665086 (not res!432667)) b!665085))

(assert (= (and b!665085 res!432670) b!665082))

(assert (= (and b!665086 res!432675) b!665090))

(assert (= (and b!665090 res!432672) b!665098))

(assert (= (and b!665098 res!432684) b!665083))

(assert (= (and b!665083 res!432669) b!665079))

(assert (= (and b!665079 res!432680) b!665096))

(assert (= (and b!665096 res!432683) b!665080))

(assert (= (and b!665080 res!432674) b!665091))

(assert (= (and b!665091 c!76573) b!665100))

(assert (= (and b!665091 (not c!76573)) b!665089))

(assert (= (and b!665091 c!76574) b!665084))

(assert (= (and b!665091 (not c!76574)) b!665101))

(assert (= (and b!665091 (not res!432676)) b!665094))

(assert (= (and b!665094 (not res!432673)) b!665078))

(assert (= (and b!665078 (not res!432678)) b!665092))

(assert (= (and b!665092 (not res!432677)) b!665087))

(assert (= (and b!665087 (not res!432666)) b!665093))

(assert (= (and b!665093 (not res!432671)) b!665099))

(assert (= (and b!665099 (not res!432685)) b!665102))

(declare-fun m!636221 () Bool)

(assert (=> b!665079 m!636221))

(declare-fun m!636223 () Bool)

(assert (=> b!665102 m!636223))

(declare-fun m!636225 () Bool)

(assert (=> b!665100 m!636225))

(declare-fun m!636227 () Bool)

(assert (=> start!59960 m!636227))

(declare-fun m!636229 () Bool)

(assert (=> b!665081 m!636229))

(declare-fun m!636231 () Bool)

(assert (=> b!665093 m!636231))

(declare-fun m!636233 () Bool)

(assert (=> b!665098 m!636233))

(declare-fun m!636235 () Bool)

(assert (=> b!665088 m!636235))

(declare-fun m!636237 () Bool)

(assert (=> b!665082 m!636237))

(declare-fun m!636239 () Bool)

(assert (=> b!665087 m!636239))

(declare-fun m!636241 () Bool)

(assert (=> b!665099 m!636241))

(declare-fun m!636243 () Bool)

(assert (=> b!665097 m!636243))

(declare-fun m!636245 () Bool)

(assert (=> b!665091 m!636245))

(declare-fun m!636247 () Bool)

(assert (=> b!665091 m!636247))

(declare-fun m!636249 () Bool)

(assert (=> b!665091 m!636249))

(declare-fun m!636251 () Bool)

(assert (=> b!665091 m!636251))

(declare-fun m!636253 () Bool)

(assert (=> b!665091 m!636253))

(declare-fun m!636255 () Bool)

(assert (=> b!665091 m!636255))

(declare-fun m!636257 () Bool)

(assert (=> b!665091 m!636257))

(declare-fun m!636259 () Bool)

(assert (=> b!665091 m!636259))

(assert (=> b!665091 m!636249))

(declare-fun m!636261 () Bool)

(assert (=> b!665091 m!636261))

(declare-fun m!636263 () Bool)

(assert (=> b!665091 m!636263))

(declare-fun m!636265 () Bool)

(assert (=> b!665091 m!636265))

(assert (=> b!665092 m!636237))

(declare-fun m!636267 () Bool)

(assert (=> b!665090 m!636267))

(declare-fun m!636269 () Bool)

(assert (=> b!665094 m!636269))

(assert (=> b!665095 m!636237))

(assert (=> b!665084 m!636247))

(assert (=> b!665084 m!636249))

(declare-fun m!636271 () Bool)

(assert (=> b!665084 m!636271))

(declare-fun m!636273 () Bool)

(assert (=> b!665084 m!636273))

(assert (=> b!665084 m!636249))

(assert (=> b!665084 m!636271))

(assert (=> b!665084 m!636255))

(assert (=> b!665084 m!636265))

(declare-fun m!636275 () Bool)

(assert (=> b!665096 m!636275))

(push 1)

(assert (not b!665087))

(assert (not b!665088))

(assert (not b!665098))

(assert (not b!665097))

(assert (not b!665081))

(assert (not b!665090))

(assert (not b!665095))

(assert (not b!665091))

(assert (not b!665082))

(assert (not b!665084))

(assert (not start!59960))

(assert (not b!665093))

(assert (not b!665096))

(assert (not b!665099))

(assert (not b!665100))

(assert (not b!665094))

(assert (not b!665092))

(assert (not b!665079))

(assert (not b!665102))

(check-sat)

