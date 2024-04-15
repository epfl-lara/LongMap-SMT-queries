; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60040 () Bool)

(assert start!60040)

(declare-fun b!668232 () Bool)

(declare-fun res!435430 () Bool)

(declare-fun e!382306 () Bool)

(assert (=> b!668232 (=> res!435430 e!382306)))

(declare-datatypes ((List!12821 0))(
  ( (Nil!12818) (Cons!12817 (h!13862 (_ BitVec 64)) (t!19040 List!12821)) )
))
(declare-fun lt!311007 () List!12821)

(declare-fun contains!3343 (List!12821 (_ BitVec 64)) Bool)

(assert (=> b!668232 (= res!435430 (contains!3343 lt!311007 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668233 () Bool)

(declare-fun res!435429 () Bool)

(assert (=> b!668233 (=> res!435429 e!382306)))

(assert (=> b!668233 (= res!435429 (contains!3343 lt!311007 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668234 () Bool)

(declare-fun res!435437 () Bool)

(declare-fun e!382310 () Bool)

(assert (=> b!668234 (=> (not res!435437) (not e!382310))))

(declare-fun acc!681 () List!12821)

(declare-fun noDuplicate!612 (List!12821) Bool)

(assert (=> b!668234 (= res!435437 (noDuplicate!612 acc!681))))

(declare-fun b!668235 () Bool)

(declare-fun e!382311 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!668235 (= e!382311 (contains!3343 acc!681 k!2843))))

(declare-fun b!668236 () Bool)

(declare-fun e!382309 () Bool)

(assert (=> b!668236 (= e!382309 (contains!3343 lt!311007 k!2843))))

(declare-fun b!668237 () Bool)

(declare-fun e!382307 () Bool)

(assert (=> b!668237 (= e!382307 (not (contains!3343 acc!681 k!2843)))))

(declare-fun b!668238 () Bool)

(declare-fun res!435428 () Bool)

(assert (=> b!668238 (=> (not res!435428) (not e!382310))))

(declare-fun e!382315 () Bool)

(assert (=> b!668238 (= res!435428 e!382315)))

(declare-fun res!435444 () Bool)

(assert (=> b!668238 (=> res!435444 e!382315)))

(assert (=> b!668238 (= res!435444 e!382311)))

(declare-fun res!435432 () Bool)

(assert (=> b!668238 (=> (not res!435432) (not e!382311))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668238 (= res!435432 (bvsgt from!3004 i!1382))))

(declare-fun b!668239 () Bool)

(declare-fun res!435443 () Bool)

(assert (=> b!668239 (=> (not res!435443) (not e!382310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668239 (= res!435443 (validKeyInArray!0 k!2843))))

(declare-fun b!668240 () Bool)

(declare-datatypes ((Unit!23413 0))(
  ( (Unit!23414) )
))
(declare-fun e!382316 () Unit!23413)

(declare-fun Unit!23415 () Unit!23413)

(assert (=> b!668240 (= e!382316 Unit!23415)))

(declare-fun b!668241 () Bool)

(declare-fun res!435446 () Bool)

(assert (=> b!668241 (=> (not res!435446) (not e!382310))))

(declare-datatypes ((array!39098 0))(
  ( (array!39099 (arr!18741 (Array (_ BitVec 32) (_ BitVec 64))) (size!19106 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39098)

(declare-fun arrayNoDuplicates!0 (array!39098 (_ BitVec 32) List!12821) Bool)

(assert (=> b!668241 (= res!435446 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12818))))

(declare-fun b!668242 () Bool)

(declare-fun res!435431 () Bool)

(assert (=> b!668242 (=> res!435431 e!382306)))

(assert (=> b!668242 (= res!435431 (not (noDuplicate!612 lt!311007)))))

(declare-fun res!435435 () Bool)

(assert (=> start!60040 (=> (not res!435435) (not e!382310))))

(assert (=> start!60040 (= res!435435 (and (bvslt (size!19106 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19106 a!3626))))))

(assert (=> start!60040 e!382310))

(assert (=> start!60040 true))

(declare-fun array_inv!14624 (array!39098) Bool)

(assert (=> start!60040 (array_inv!14624 a!3626)))

(declare-fun b!668243 () Bool)

(declare-fun e!382312 () Bool)

(declare-fun e!382308 () Bool)

(assert (=> b!668243 (= e!382312 e!382308)))

(declare-fun res!435439 () Bool)

(assert (=> b!668243 (=> (not res!435439) (not e!382308))))

(assert (=> b!668243 (= res!435439 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668244 () Bool)

(assert (=> b!668244 (= e!382306 true)))

(declare-fun lt!311001 () Bool)

(assert (=> b!668244 (= lt!311001 e!382312)))

(declare-fun res!435436 () Bool)

(assert (=> b!668244 (=> res!435436 e!382312)))

(assert (=> b!668244 (= res!435436 e!382309)))

(declare-fun res!435447 () Bool)

(assert (=> b!668244 (=> (not res!435447) (not e!382309))))

(assert (=> b!668244 (= res!435447 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668245 () Bool)

(declare-fun res!435442 () Bool)

(assert (=> b!668245 (=> (not res!435442) (not e!382310))))

(assert (=> b!668245 (= res!435442 (not (contains!3343 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668246 () Bool)

(declare-fun res!435440 () Bool)

(assert (=> b!668246 (=> (not res!435440) (not e!382310))))

(assert (=> b!668246 (= res!435440 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19106 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668247 () Bool)

(declare-fun res!435434 () Bool)

(assert (=> b!668247 (=> (not res!435434) (not e!382310))))

(assert (=> b!668247 (= res!435434 (not (contains!3343 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668248 () Bool)

(assert (=> b!668248 (= e!382308 (not (contains!3343 lt!311007 k!2843)))))

(declare-fun b!668249 () Bool)

(assert (=> b!668249 (= e!382310 (not e!382306))))

(declare-fun res!435445 () Bool)

(assert (=> b!668249 (=> res!435445 e!382306)))

(assert (=> b!668249 (= res!435445 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668249 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311007)))

(declare-fun lt!311002 () Unit!23413)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39098 (_ BitVec 64) (_ BitVec 32) List!12821 List!12821) Unit!23413)

(assert (=> b!668249 (= lt!311002 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311007))))

(declare-fun -!97 (List!12821 (_ BitVec 64)) List!12821)

(assert (=> b!668249 (= (-!97 lt!311007 k!2843) acc!681)))

(declare-fun $colon$colon!230 (List!12821 (_ BitVec 64)) List!12821)

(assert (=> b!668249 (= lt!311007 ($colon$colon!230 acc!681 k!2843))))

(declare-fun lt!310998 () Unit!23413)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12821) Unit!23413)

(assert (=> b!668249 (= lt!310998 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!99 (List!12821 List!12821) Bool)

(assert (=> b!668249 (subseq!99 acc!681 acc!681)))

(declare-fun lt!311003 () Unit!23413)

(declare-fun lemmaListSubSeqRefl!0 (List!12821) Unit!23413)

(assert (=> b!668249 (= lt!311003 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668249 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311004 () Unit!23413)

(declare-fun e!382313 () Unit!23413)

(assert (=> b!668249 (= lt!311004 e!382313)))

(declare-fun c!76770 () Bool)

(assert (=> b!668249 (= c!76770 (validKeyInArray!0 (select (arr!18741 a!3626) from!3004)))))

(declare-fun lt!310999 () Unit!23413)

(assert (=> b!668249 (= lt!310999 e!382316)))

(declare-fun c!76769 () Bool)

(declare-fun arrayContainsKey!0 (array!39098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668249 (= c!76769 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668249 (arrayContainsKey!0 (array!39099 (store (arr!18741 a!3626) i!1382 k!2843) (size!19106 a!3626)) k!2843 from!3004)))

(declare-fun b!668250 () Bool)

(declare-fun res!435448 () Bool)

(assert (=> b!668250 (=> (not res!435448) (not e!382310))))

(assert (=> b!668250 (= res!435448 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19106 a!3626))))))

(declare-fun b!668251 () Bool)

(declare-fun Unit!23416 () Unit!23413)

(assert (=> b!668251 (= e!382313 Unit!23416)))

(declare-fun b!668252 () Bool)

(declare-fun Unit!23417 () Unit!23413)

(assert (=> b!668252 (= e!382316 Unit!23417)))

(declare-fun lt!311005 () Unit!23413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39098 (_ BitVec 64) (_ BitVec 32)) Unit!23413)

(assert (=> b!668252 (= lt!311005 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668252 false))

(declare-fun b!668253 () Bool)

(declare-fun lt!311006 () Unit!23413)

(assert (=> b!668253 (= e!382313 lt!311006)))

(declare-fun lt!311000 () Unit!23413)

(assert (=> b!668253 (= lt!311000 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668253 (subseq!99 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39098 List!12821 List!12821 (_ BitVec 32)) Unit!23413)

(assert (=> b!668253 (= lt!311006 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!230 acc!681 (select (arr!18741 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668253 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668254 () Bool)

(assert (=> b!668254 (= e!382315 e!382307)))

(declare-fun res!435441 () Bool)

(assert (=> b!668254 (=> (not res!435441) (not e!382307))))

(assert (=> b!668254 (= res!435441 (bvsle from!3004 i!1382))))

(declare-fun b!668255 () Bool)

(declare-fun res!435433 () Bool)

(assert (=> b!668255 (=> (not res!435433) (not e!382310))))

(assert (=> b!668255 (= res!435433 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668256 () Bool)

(declare-fun res!435438 () Bool)

(assert (=> b!668256 (=> (not res!435438) (not e!382310))))

(assert (=> b!668256 (= res!435438 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60040 res!435435) b!668234))

(assert (= (and b!668234 res!435437) b!668247))

(assert (= (and b!668247 res!435434) b!668245))

(assert (= (and b!668245 res!435442) b!668238))

(assert (= (and b!668238 res!435432) b!668235))

(assert (= (and b!668238 (not res!435444)) b!668254))

(assert (= (and b!668254 res!435441) b!668237))

(assert (= (and b!668238 res!435428) b!668241))

(assert (= (and b!668241 res!435446) b!668255))

(assert (= (and b!668255 res!435433) b!668250))

(assert (= (and b!668250 res!435448) b!668239))

(assert (= (and b!668239 res!435443) b!668256))

(assert (= (and b!668256 res!435438) b!668246))

(assert (= (and b!668246 res!435440) b!668249))

(assert (= (and b!668249 c!76769) b!668252))

(assert (= (and b!668249 (not c!76769)) b!668240))

(assert (= (and b!668249 c!76770) b!668253))

(assert (= (and b!668249 (not c!76770)) b!668251))

(assert (= (and b!668249 (not res!435445)) b!668242))

(assert (= (and b!668242 (not res!435431)) b!668232))

(assert (= (and b!668232 (not res!435430)) b!668233))

(assert (= (and b!668233 (not res!435429)) b!668244))

(assert (= (and b!668244 res!435447) b!668236))

(assert (= (and b!668244 (not res!435436)) b!668243))

(assert (= (and b!668243 res!435439) b!668248))

(declare-fun m!638047 () Bool)

(assert (=> b!668247 m!638047))

(declare-fun m!638049 () Bool)

(assert (=> b!668242 m!638049))

(declare-fun m!638051 () Bool)

(assert (=> start!60040 m!638051))

(declare-fun m!638053 () Bool)

(assert (=> b!668237 m!638053))

(declare-fun m!638055 () Bool)

(assert (=> b!668232 m!638055))

(declare-fun m!638057 () Bool)

(assert (=> b!668236 m!638057))

(declare-fun m!638059 () Bool)

(assert (=> b!668241 m!638059))

(declare-fun m!638061 () Bool)

(assert (=> b!668233 m!638061))

(declare-fun m!638063 () Bool)

(assert (=> b!668239 m!638063))

(declare-fun m!638065 () Bool)

(assert (=> b!668234 m!638065))

(declare-fun m!638067 () Bool)

(assert (=> b!668256 m!638067))

(declare-fun m!638069 () Bool)

(assert (=> b!668255 m!638069))

(assert (=> b!668248 m!638057))

(assert (=> b!668235 m!638053))

(declare-fun m!638071 () Bool)

(assert (=> b!668249 m!638071))

(declare-fun m!638073 () Bool)

(assert (=> b!668249 m!638073))

(declare-fun m!638075 () Bool)

(assert (=> b!668249 m!638075))

(declare-fun m!638077 () Bool)

(assert (=> b!668249 m!638077))

(declare-fun m!638079 () Bool)

(assert (=> b!668249 m!638079))

(declare-fun m!638081 () Bool)

(assert (=> b!668249 m!638081))

(declare-fun m!638083 () Bool)

(assert (=> b!668249 m!638083))

(declare-fun m!638085 () Bool)

(assert (=> b!668249 m!638085))

(assert (=> b!668249 m!638073))

(declare-fun m!638087 () Bool)

(assert (=> b!668249 m!638087))

(declare-fun m!638089 () Bool)

(assert (=> b!668249 m!638089))

(declare-fun m!638091 () Bool)

(assert (=> b!668249 m!638091))

(declare-fun m!638093 () Bool)

(assert (=> b!668249 m!638093))

(declare-fun m!638095 () Bool)

(assert (=> b!668249 m!638095))

(declare-fun m!638097 () Bool)

(assert (=> b!668245 m!638097))

(assert (=> b!668253 m!638071))

(assert (=> b!668253 m!638073))

(declare-fun m!638099 () Bool)

(assert (=> b!668253 m!638099))

(declare-fun m!638101 () Bool)

(assert (=> b!668253 m!638101))

(assert (=> b!668253 m!638073))

(assert (=> b!668253 m!638099))

(assert (=> b!668253 m!638081))

(assert (=> b!668253 m!638095))

(declare-fun m!638103 () Bool)

(assert (=> b!668252 m!638103))

(push 1)

(assert (not b!668252))

(assert (not b!668239))

(assert (not b!668256))

(assert (not b!668236))

(assert (not b!668242))

(assert (not b!668253))

(assert (not b!668232))

(assert (not start!60040))

(assert (not b!668233))

(assert (not b!668237))

(assert (not b!668247))

(assert (not b!668235))

(assert (not b!668241))

(assert (not b!668255))

(assert (not b!668249))

(assert (not b!668245))

(assert (not b!668234))

(assert (not b!668248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

