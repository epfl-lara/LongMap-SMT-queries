; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59904 () Bool)

(assert start!59904)

(declare-fun b!663296 () Bool)

(declare-fun res!431222 () Bool)

(declare-fun e!380616 () Bool)

(assert (=> b!663296 (=> (not res!431222) (not e!380616))))

(declare-datatypes ((List!12709 0))(
  ( (Nil!12706) (Cons!12705 (h!13750 (_ BitVec 64)) (t!18937 List!12709)) )
))
(declare-fun acc!681 () List!12709)

(declare-fun contains!3286 (List!12709 (_ BitVec 64)) Bool)

(assert (=> b!663296 (= res!431222 (not (contains!3286 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663297 () Bool)

(declare-fun res!431219 () Bool)

(declare-fun e!380621 () Bool)

(assert (=> b!663297 (=> res!431219 e!380621)))

(declare-fun lt!309247 () List!12709)

(declare-fun subseq!25 (List!12709 List!12709) Bool)

(assert (=> b!663297 (= res!431219 (not (subseq!25 acc!681 lt!309247)))))

(declare-fun b!663298 () Bool)

(declare-datatypes ((Unit!23066 0))(
  ( (Unit!23067) )
))
(declare-fun e!380620 () Unit!23066)

(declare-fun Unit!23068 () Unit!23066)

(assert (=> b!663298 (= e!380620 Unit!23068)))

(declare-fun lt!309249 () Unit!23066)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!38951 0))(
  ( (array!38952 (arr!18668 (Array (_ BitVec 32) (_ BitVec 64))) (size!19032 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38951)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38951 (_ BitVec 64) (_ BitVec 32)) Unit!23066)

(assert (=> b!663298 (= lt!309249 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663298 false))

(declare-fun b!663299 () Bool)

(declare-fun res!431233 () Bool)

(assert (=> b!663299 (=> res!431233 e!380621)))

(assert (=> b!663299 (= res!431233 (contains!3286 lt!309247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663300 () Bool)

(declare-fun res!431226 () Bool)

(assert (=> b!663300 (=> (not res!431226) (not e!380616))))

(declare-fun arrayContainsKey!0 (array!38951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663300 (= res!431226 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!431236 () Bool)

(assert (=> start!59904 (=> (not res!431236) (not e!380616))))

(assert (=> start!59904 (= res!431236 (and (bvslt (size!19032 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19032 a!3626))))))

(assert (=> start!59904 e!380616))

(assert (=> start!59904 true))

(declare-fun array_inv!14464 (array!38951) Bool)

(assert (=> start!59904 (array_inv!14464 a!3626)))

(declare-fun b!663301 () Bool)

(declare-fun res!431232 () Bool)

(assert (=> b!663301 (=> res!431232 e!380621)))

(declare-fun noDuplicate!533 (List!12709) Bool)

(assert (=> b!663301 (= res!431232 (not (noDuplicate!533 lt!309247)))))

(declare-fun b!663302 () Bool)

(declare-fun res!431227 () Bool)

(assert (=> b!663302 (=> (not res!431227) (not e!380616))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663302 (= res!431227 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19032 a!3626))))))

(declare-fun b!663303 () Bool)

(declare-fun e!380619 () Bool)

(assert (=> b!663303 (= e!380619 (contains!3286 acc!681 k!2843))))

(declare-fun b!663304 () Bool)

(declare-fun Unit!23069 () Unit!23066)

(assert (=> b!663304 (= e!380620 Unit!23069)))

(declare-fun b!663305 () Bool)

(declare-fun e!380617 () Bool)

(declare-fun e!380618 () Bool)

(assert (=> b!663305 (= e!380617 e!380618)))

(declare-fun res!431237 () Bool)

(assert (=> b!663305 (=> (not res!431237) (not e!380618))))

(assert (=> b!663305 (= res!431237 (bvsle from!3004 i!1382))))

(declare-fun b!663306 () Bool)

(declare-fun res!431228 () Bool)

(assert (=> b!663306 (=> (not res!431228) (not e!380616))))

(declare-fun arrayNoDuplicates!0 (array!38951 (_ BitVec 32) List!12709) Bool)

(assert (=> b!663306 (= res!431228 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12706))))

(declare-fun b!663307 () Bool)

(declare-fun res!431218 () Bool)

(assert (=> b!663307 (=> (not res!431218) (not e!380616))))

(assert (=> b!663307 (= res!431218 (not (contains!3286 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663308 () Bool)

(assert (=> b!663308 (= e!380618 (not (contains!3286 acc!681 k!2843)))))

(declare-fun b!663309 () Bool)

(declare-fun e!380622 () Bool)

(assert (=> b!663309 (= e!380622 e!380621)))

(declare-fun res!431224 () Bool)

(assert (=> b!663309 (=> res!431224 e!380621)))

(assert (=> b!663309 (= res!431224 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!157 (List!12709 (_ BitVec 64)) List!12709)

(assert (=> b!663309 (= lt!309247 ($colon$colon!157 acc!681 (select (arr!18668 a!3626) from!3004)))))

(assert (=> b!663309 (subseq!25 acc!681 acc!681)))

(declare-fun lt!309246 () Unit!23066)

(declare-fun lemmaListSubSeqRefl!0 (List!12709) Unit!23066)

(assert (=> b!663309 (= lt!309246 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!663310 () Bool)

(declare-fun res!431234 () Bool)

(assert (=> b!663310 (=> (not res!431234) (not e!380616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663310 (= res!431234 (validKeyInArray!0 k!2843))))

(declare-fun b!663311 () Bool)

(declare-fun res!431221 () Bool)

(assert (=> b!663311 (=> (not res!431221) (not e!380616))))

(assert (=> b!663311 (= res!431221 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19032 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663312 () Bool)

(declare-fun res!431230 () Bool)

(assert (=> b!663312 (=> (not res!431230) (not e!380616))))

(assert (=> b!663312 (= res!431230 (noDuplicate!533 acc!681))))

(declare-fun b!663313 () Bool)

(declare-fun res!431235 () Bool)

(assert (=> b!663313 (=> res!431235 e!380621)))

(assert (=> b!663313 (= res!431235 (contains!3286 lt!309247 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663314 () Bool)

(declare-fun res!431223 () Bool)

(assert (=> b!663314 (=> (not res!431223) (not e!380616))))

(assert (=> b!663314 (= res!431223 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663315 () Bool)

(declare-fun res!431231 () Bool)

(assert (=> b!663315 (=> (not res!431231) (not e!380616))))

(assert (=> b!663315 (= res!431231 e!380617)))

(declare-fun res!431225 () Bool)

(assert (=> b!663315 (=> res!431225 e!380617)))

(assert (=> b!663315 (= res!431225 e!380619)))

(declare-fun res!431220 () Bool)

(assert (=> b!663315 (=> (not res!431220) (not e!380619))))

(assert (=> b!663315 (= res!431220 (bvsgt from!3004 i!1382))))

(declare-fun b!663316 () Bool)

(assert (=> b!663316 (= e!380621 true)))

(declare-fun lt!309245 () Bool)

(assert (=> b!663316 (= lt!309245 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309247))))

(declare-fun lt!309250 () Unit!23066)

(declare-fun noDuplicateSubseq!25 (List!12709 List!12709) Unit!23066)

(assert (=> b!663316 (= lt!309250 (noDuplicateSubseq!25 acc!681 lt!309247))))

(declare-fun b!663317 () Bool)

(assert (=> b!663317 (= e!380616 (not e!380622))))

(declare-fun res!431229 () Bool)

(assert (=> b!663317 (=> res!431229 e!380622)))

(assert (=> b!663317 (= res!431229 (not (validKeyInArray!0 (select (arr!18668 a!3626) from!3004))))))

(declare-fun lt!309248 () Unit!23066)

(assert (=> b!663317 (= lt!309248 e!380620)))

(declare-fun c!76406 () Bool)

(assert (=> b!663317 (= c!76406 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663317 (arrayContainsKey!0 (array!38952 (store (arr!18668 a!3626) i!1382 k!2843) (size!19032 a!3626)) k!2843 from!3004)))

(assert (= (and start!59904 res!431236) b!663312))

(assert (= (and b!663312 res!431230) b!663296))

(assert (= (and b!663296 res!431222) b!663307))

(assert (= (and b!663307 res!431218) b!663315))

(assert (= (and b!663315 res!431220) b!663303))

(assert (= (and b!663315 (not res!431225)) b!663305))

(assert (= (and b!663305 res!431237) b!663308))

(assert (= (and b!663315 res!431231) b!663306))

(assert (= (and b!663306 res!431228) b!663314))

(assert (= (and b!663314 res!431223) b!663302))

(assert (= (and b!663302 res!431227) b!663310))

(assert (= (and b!663310 res!431234) b!663300))

(assert (= (and b!663300 res!431226) b!663311))

(assert (= (and b!663311 res!431221) b!663317))

(assert (= (and b!663317 c!76406) b!663298))

(assert (= (and b!663317 (not c!76406)) b!663304))

(assert (= (and b!663317 (not res!431229)) b!663309))

(assert (= (and b!663309 (not res!431224)) b!663301))

(assert (= (and b!663301 (not res!431232)) b!663299))

(assert (= (and b!663299 (not res!431233)) b!663313))

(assert (= (and b!663313 (not res!431235)) b!663297))

(assert (= (and b!663297 (not res!431219)) b!663316))

(declare-fun m!634901 () Bool)

(assert (=> b!663301 m!634901))

(declare-fun m!634903 () Bool)

(assert (=> b!663309 m!634903))

(assert (=> b!663309 m!634903))

(declare-fun m!634905 () Bool)

(assert (=> b!663309 m!634905))

(declare-fun m!634907 () Bool)

(assert (=> b!663309 m!634907))

(declare-fun m!634909 () Bool)

(assert (=> b!663309 m!634909))

(declare-fun m!634911 () Bool)

(assert (=> b!663312 m!634911))

(declare-fun m!634913 () Bool)

(assert (=> b!663299 m!634913))

(declare-fun m!634915 () Bool)

(assert (=> b!663303 m!634915))

(assert (=> b!663308 m!634915))

(declare-fun m!634917 () Bool)

(assert (=> b!663296 m!634917))

(declare-fun m!634919 () Bool)

(assert (=> b!663298 m!634919))

(declare-fun m!634921 () Bool)

(assert (=> b!663307 m!634921))

(declare-fun m!634923 () Bool)

(assert (=> b!663297 m!634923))

(declare-fun m!634925 () Bool)

(assert (=> start!59904 m!634925))

(declare-fun m!634927 () Bool)

(assert (=> b!663316 m!634927))

(declare-fun m!634929 () Bool)

(assert (=> b!663316 m!634929))

(declare-fun m!634931 () Bool)

(assert (=> b!663300 m!634931))

(declare-fun m!634933 () Bool)

(assert (=> b!663314 m!634933))

(declare-fun m!634935 () Bool)

(assert (=> b!663310 m!634935))

(declare-fun m!634937 () Bool)

(assert (=> b!663313 m!634937))

(declare-fun m!634939 () Bool)

(assert (=> b!663306 m!634939))

(assert (=> b!663317 m!634903))

(declare-fun m!634941 () Bool)

(assert (=> b!663317 m!634941))

(declare-fun m!634943 () Bool)

(assert (=> b!663317 m!634943))

(assert (=> b!663317 m!634903))

(declare-fun m!634945 () Bool)

(assert (=> b!663317 m!634945))

(declare-fun m!634947 () Bool)

(assert (=> b!663317 m!634947))

(push 1)

