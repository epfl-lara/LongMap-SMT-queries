; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60066 () Bool)

(assert start!60066)

(declare-fun b!669207 () Bool)

(declare-fun res!436248 () Bool)

(declare-fun e!382736 () Bool)

(assert (=> b!669207 (=> (not res!436248) (not e!382736))))

(declare-fun e!382741 () Bool)

(assert (=> b!669207 (= res!436248 e!382741)))

(declare-fun res!436252 () Bool)

(assert (=> b!669207 (=> res!436252 e!382741)))

(declare-fun e!382735 () Bool)

(assert (=> b!669207 (= res!436252 e!382735)))

(declare-fun res!436262 () Bool)

(assert (=> b!669207 (=> (not res!436262) (not e!382735))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669207 (= res!436262 (bvsgt from!3004 i!1382))))

(declare-fun b!669208 () Bool)

(declare-fun e!382739 () Bool)

(declare-datatypes ((List!12834 0))(
  ( (Nil!12831) (Cons!12830 (h!13875 (_ BitVec 64)) (t!19053 List!12834)) )
))
(declare-fun acc!681 () List!12834)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3356 (List!12834 (_ BitVec 64)) Bool)

(assert (=> b!669208 (= e!382739 (not (contains!3356 acc!681 k!2843)))))

(declare-fun b!669209 () Bool)

(assert (=> b!669209 (= e!382741 e!382739)))

(declare-fun res!436251 () Bool)

(assert (=> b!669209 (=> (not res!436251) (not e!382739))))

(assert (=> b!669209 (= res!436251 (bvsle from!3004 i!1382))))

(declare-fun b!669210 () Bool)

(declare-fun res!436267 () Bool)

(assert (=> b!669210 (=> (not res!436267) (not e!382736))))

(declare-datatypes ((array!39124 0))(
  ( (array!39125 (arr!18754 (Array (_ BitVec 32) (_ BitVec 64))) (size!19119 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39124)

(declare-fun arrayNoDuplicates!0 (array!39124 (_ BitVec 32) List!12834) Bool)

(assert (=> b!669210 (= res!436267 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12831))))

(declare-fun b!669212 () Bool)

(declare-fun res!436265 () Bool)

(assert (=> b!669212 (=> (not res!436265) (not e!382736))))

(assert (=> b!669212 (= res!436265 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19119 a!3626))))))

(declare-fun b!669213 () Bool)

(declare-fun res!436258 () Bool)

(assert (=> b!669213 (=> (not res!436258) (not e!382736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669213 (= res!436258 (validKeyInArray!0 k!2843))))

(declare-fun b!669214 () Bool)

(declare-fun res!436263 () Bool)

(assert (=> b!669214 (=> (not res!436263) (not e!382736))))

(declare-fun arrayContainsKey!0 (array!39124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669214 (= res!436263 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669215 () Bool)

(declare-fun e!382738 () Bool)

(declare-fun e!382743 () Bool)

(assert (=> b!669215 (= e!382738 e!382743)))

(declare-fun res!436249 () Bool)

(assert (=> b!669215 (=> (not res!436249) (not e!382743))))

(assert (=> b!669215 (= res!436249 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669216 () Bool)

(declare-fun res!436257 () Bool)

(assert (=> b!669216 (=> (not res!436257) (not e!382736))))

(assert (=> b!669216 (= res!436257 (not (contains!3356 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669217 () Bool)

(declare-fun e!382740 () Bool)

(declare-fun lt!311396 () List!12834)

(assert (=> b!669217 (= e!382740 (contains!3356 lt!311396 k!2843))))

(declare-fun b!669218 () Bool)

(assert (=> b!669218 (= e!382735 (contains!3356 acc!681 k!2843))))

(declare-fun b!669219 () Bool)

(declare-datatypes ((Unit!23478 0))(
  ( (Unit!23479) )
))
(declare-fun e!382744 () Unit!23478)

(declare-fun Unit!23480 () Unit!23478)

(assert (=> b!669219 (= e!382744 Unit!23480)))

(declare-fun b!669220 () Bool)

(declare-fun res!436250 () Bool)

(declare-fun e!382742 () Bool)

(assert (=> b!669220 (=> res!436250 e!382742)))

(assert (=> b!669220 (= res!436250 (contains!3356 lt!311396 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669221 () Bool)

(declare-fun res!436253 () Bool)

(assert (=> b!669221 (=> res!436253 e!382742)))

(assert (=> b!669221 (= res!436253 (contains!3356 lt!311396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669222 () Bool)

(declare-fun e!382745 () Unit!23478)

(declare-fun Unit!23481 () Unit!23478)

(assert (=> b!669222 (= e!382745 Unit!23481)))

(declare-fun res!436264 () Bool)

(assert (=> start!60066 (=> (not res!436264) (not e!382736))))

(assert (=> start!60066 (= res!436264 (and (bvslt (size!19119 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19119 a!3626))))))

(assert (=> start!60066 e!382736))

(assert (=> start!60066 true))

(declare-fun array_inv!14637 (array!39124) Bool)

(assert (=> start!60066 (array_inv!14637 a!3626)))

(declare-fun b!669211 () Bool)

(declare-fun res!436247 () Bool)

(assert (=> b!669211 (=> (not res!436247) (not e!382736))))

(assert (=> b!669211 (= res!436247 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19119 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669223 () Bool)

(declare-fun res!436260 () Bool)

(assert (=> b!669223 (=> (not res!436260) (not e!382736))))

(declare-fun noDuplicate!625 (List!12834) Bool)

(assert (=> b!669223 (= res!436260 (noDuplicate!625 acc!681))))

(declare-fun b!669224 () Bool)

(declare-fun Unit!23482 () Unit!23478)

(assert (=> b!669224 (= e!382745 Unit!23482)))

(declare-fun lt!311392 () Unit!23478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39124 (_ BitVec 64) (_ BitVec 32)) Unit!23478)

(assert (=> b!669224 (= lt!311392 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669224 false))

(declare-fun b!669225 () Bool)

(declare-fun lt!311393 () Unit!23478)

(assert (=> b!669225 (= e!382744 lt!311393)))

(declare-fun lt!311397 () Unit!23478)

(declare-fun lemmaListSubSeqRefl!0 (List!12834) Unit!23478)

(assert (=> b!669225 (= lt!311397 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!112 (List!12834 List!12834) Bool)

(assert (=> b!669225 (subseq!112 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39124 List!12834 List!12834 (_ BitVec 32)) Unit!23478)

(declare-fun $colon$colon!243 (List!12834 (_ BitVec 64)) List!12834)

(assert (=> b!669225 (= lt!311393 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!243 acc!681 (select (arr!18754 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669225 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669226 () Bool)

(declare-fun res!436266 () Bool)

(assert (=> b!669226 (=> (not res!436266) (not e!382736))))

(assert (=> b!669226 (= res!436266 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669227 () Bool)

(assert (=> b!669227 (= e!382736 (not e!382742))))

(declare-fun res!436259 () Bool)

(assert (=> b!669227 (=> res!436259 e!382742)))

(assert (=> b!669227 (= res!436259 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669227 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311396)))

(declare-fun lt!311394 () Unit!23478)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39124 (_ BitVec 64) (_ BitVec 32) List!12834 List!12834) Unit!23478)

(assert (=> b!669227 (= lt!311394 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311396))))

(declare-fun -!110 (List!12834 (_ BitVec 64)) List!12834)

(assert (=> b!669227 (= (-!110 lt!311396 k!2843) acc!681)))

(assert (=> b!669227 (= lt!311396 ($colon$colon!243 acc!681 k!2843))))

(declare-fun lt!311388 () Unit!23478)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12834) Unit!23478)

(assert (=> b!669227 (= lt!311388 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!669227 (subseq!112 acc!681 acc!681)))

(declare-fun lt!311391 () Unit!23478)

(assert (=> b!669227 (= lt!311391 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669227 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311390 () Unit!23478)

(assert (=> b!669227 (= lt!311390 e!382744)))

(declare-fun c!76847 () Bool)

(assert (=> b!669227 (= c!76847 (validKeyInArray!0 (select (arr!18754 a!3626) from!3004)))))

(declare-fun lt!311389 () Unit!23478)

(assert (=> b!669227 (= lt!311389 e!382745)))

(declare-fun c!76848 () Bool)

(assert (=> b!669227 (= c!76848 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669227 (arrayContainsKey!0 (array!39125 (store (arr!18754 a!3626) i!1382 k!2843) (size!19119 a!3626)) k!2843 from!3004)))

(declare-fun b!669228 () Bool)

(assert (=> b!669228 (= e!382743 (not (contains!3356 lt!311396 k!2843)))))

(declare-fun b!669229 () Bool)

(declare-fun res!436261 () Bool)

(assert (=> b!669229 (=> res!436261 e!382742)))

(assert (=> b!669229 (= res!436261 (not (noDuplicate!625 lt!311396)))))

(declare-fun b!669230 () Bool)

(declare-fun res!436256 () Bool)

(assert (=> b!669230 (=> (not res!436256) (not e!382736))))

(assert (=> b!669230 (= res!436256 (not (contains!3356 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669231 () Bool)

(assert (=> b!669231 (= e!382742 true)))

(declare-fun lt!311395 () Bool)

(assert (=> b!669231 (= lt!311395 e!382738)))

(declare-fun res!436255 () Bool)

(assert (=> b!669231 (=> res!436255 e!382738)))

(assert (=> b!669231 (= res!436255 e!382740)))

(declare-fun res!436254 () Bool)

(assert (=> b!669231 (=> (not res!436254) (not e!382740))))

(assert (=> b!669231 (= res!436254 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60066 res!436264) b!669223))

(assert (= (and b!669223 res!436260) b!669216))

(assert (= (and b!669216 res!436257) b!669230))

(assert (= (and b!669230 res!436256) b!669207))

(assert (= (and b!669207 res!436262) b!669218))

(assert (= (and b!669207 (not res!436252)) b!669209))

(assert (= (and b!669209 res!436251) b!669208))

(assert (= (and b!669207 res!436248) b!669210))

(assert (= (and b!669210 res!436267) b!669226))

(assert (= (and b!669226 res!436266) b!669212))

(assert (= (and b!669212 res!436265) b!669213))

(assert (= (and b!669213 res!436258) b!669214))

(assert (= (and b!669214 res!436263) b!669211))

(assert (= (and b!669211 res!436247) b!669227))

(assert (= (and b!669227 c!76848) b!669224))

(assert (= (and b!669227 (not c!76848)) b!669222))

(assert (= (and b!669227 c!76847) b!669225))

(assert (= (and b!669227 (not c!76847)) b!669219))

(assert (= (and b!669227 (not res!436259)) b!669229))

(assert (= (and b!669229 (not res!436261)) b!669221))

(assert (= (and b!669221 (not res!436253)) b!669220))

(assert (= (and b!669220 (not res!436250)) b!669231))

(assert (= (and b!669231 res!436254) b!669217))

(assert (= (and b!669231 (not res!436255)) b!669215))

(assert (= (and b!669215 res!436249) b!669228))

(declare-fun m!638801 () Bool)

(assert (=> b!669224 m!638801))

(declare-fun m!638803 () Bool)

(assert (=> b!669217 m!638803))

(declare-fun m!638805 () Bool)

(assert (=> b!669208 m!638805))

(declare-fun m!638807 () Bool)

(assert (=> b!669220 m!638807))

(declare-fun m!638809 () Bool)

(assert (=> b!669210 m!638809))

(declare-fun m!638811 () Bool)

(assert (=> b!669223 m!638811))

(declare-fun m!638813 () Bool)

(assert (=> b!669221 m!638813))

(declare-fun m!638815 () Bool)

(assert (=> b!669229 m!638815))

(declare-fun m!638817 () Bool)

(assert (=> b!669225 m!638817))

(declare-fun m!638819 () Bool)

(assert (=> b!669225 m!638819))

(declare-fun m!638821 () Bool)

(assert (=> b!669225 m!638821))

(declare-fun m!638823 () Bool)

(assert (=> b!669225 m!638823))

(assert (=> b!669225 m!638819))

(assert (=> b!669225 m!638821))

(declare-fun m!638825 () Bool)

(assert (=> b!669225 m!638825))

(declare-fun m!638827 () Bool)

(assert (=> b!669225 m!638827))

(declare-fun m!638829 () Bool)

(assert (=> b!669214 m!638829))

(declare-fun m!638831 () Bool)

(assert (=> start!60066 m!638831))

(declare-fun m!638833 () Bool)

(assert (=> b!669227 m!638833))

(assert (=> b!669227 m!638817))

(assert (=> b!669227 m!638819))

(declare-fun m!638835 () Bool)

(assert (=> b!669227 m!638835))

(declare-fun m!638837 () Bool)

(assert (=> b!669227 m!638837))

(declare-fun m!638839 () Bool)

(assert (=> b!669227 m!638839))

(assert (=> b!669227 m!638825))

(declare-fun m!638841 () Bool)

(assert (=> b!669227 m!638841))

(declare-fun m!638843 () Bool)

(assert (=> b!669227 m!638843))

(declare-fun m!638845 () Bool)

(assert (=> b!669227 m!638845))

(assert (=> b!669227 m!638819))

(declare-fun m!638847 () Bool)

(assert (=> b!669227 m!638847))

(declare-fun m!638849 () Bool)

(assert (=> b!669227 m!638849))

(assert (=> b!669227 m!638827))

(declare-fun m!638851 () Bool)

(assert (=> b!669226 m!638851))

(declare-fun m!638853 () Bool)

(assert (=> b!669230 m!638853))

(declare-fun m!638855 () Bool)

(assert (=> b!669216 m!638855))

(declare-fun m!638857 () Bool)

(assert (=> b!669213 m!638857))

(assert (=> b!669228 m!638803))

(assert (=> b!669218 m!638805))

(push 1)

(assert (not start!60066))

(assert (not b!669217))

(assert (not b!669229))

(assert (not b!669208))

(assert (not b!669213))

(assert (not b!669218))

(assert (not b!669221))

(assert (not b!669210))

(assert (not b!669214))

(assert (not b!669225))

(assert (not b!669216))

(assert (not b!669223))

(assert (not b!669227))

(assert (not b!669226))

(assert (not b!669224))

(assert (not b!669220))

(assert (not b!669230))

(assert (not b!669228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

