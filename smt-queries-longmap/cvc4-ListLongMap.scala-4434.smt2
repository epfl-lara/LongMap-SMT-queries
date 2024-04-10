; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61584 () Bool)

(assert start!61584)

(declare-fun b!689326 () Bool)

(declare-fun res!453906 () Bool)

(declare-fun e!392496 () Bool)

(assert (=> b!689326 (=> (not res!453906) (not e!392496))))

(declare-datatypes ((array!39725 0))(
  ( (array!39726 (arr!19034 (Array (_ BitVec 32) (_ BitVec 64))) (size!19416 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39725)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13075 0))(
  ( (Nil!13072) (Cons!13071 (h!14116 (_ BitVec 64)) (t!19339 List!13075)) )
))
(declare-fun acc!681 () List!13075)

(declare-fun arrayNoDuplicates!0 (array!39725 (_ BitVec 32) List!13075) Bool)

(assert (=> b!689326 (= res!453906 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689327 () Bool)

(declare-fun e!392502 () Bool)

(declare-fun lt!316112 () List!13075)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3652 (List!13075 (_ BitVec 64)) Bool)

(assert (=> b!689327 (= e!392502 (contains!3652 lt!316112 k!2843))))

(declare-fun res!453897 () Bool)

(assert (=> start!61584 (=> (not res!453897) (not e!392496))))

(assert (=> start!61584 (= res!453897 (and (bvslt (size!19416 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19416 a!3626))))))

(assert (=> start!61584 e!392496))

(assert (=> start!61584 true))

(declare-fun array_inv!14830 (array!39725) Bool)

(assert (=> start!61584 (array_inv!14830 a!3626)))

(declare-fun b!689328 () Bool)

(declare-fun res!453892 () Bool)

(declare-fun e!392503 () Bool)

(assert (=> b!689328 (=> res!453892 e!392503)))

(assert (=> b!689328 (= res!453892 (contains!3652 lt!316112 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689329 () Bool)

(declare-fun res!453907 () Bool)

(assert (=> b!689329 (=> (not res!453907) (not e!392496))))

(assert (=> b!689329 (= res!453907 (not (contains!3652 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689330 () Bool)

(declare-fun res!453910 () Bool)

(assert (=> b!689330 (=> (not res!453910) (not e!392496))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689330 (= res!453910 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19416 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689331 () Bool)

(declare-fun e!392500 () Bool)

(assert (=> b!689331 (= e!392500 (not (contains!3652 acc!681 k!2843)))))

(declare-fun b!689332 () Bool)

(declare-fun res!453896 () Bool)

(assert (=> b!689332 (=> res!453896 e!392503)))

(declare-fun noDuplicate!899 (List!13075) Bool)

(assert (=> b!689332 (= res!453896 (not (noDuplicate!899 lt!316112)))))

(declare-fun b!689333 () Bool)

(declare-fun res!453901 () Bool)

(assert (=> b!689333 (=> (not res!453901) (not e!392496))))

(declare-fun arrayContainsKey!0 (array!39725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689333 (= res!453901 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689334 () Bool)

(declare-fun e!392499 () Bool)

(assert (=> b!689334 (= e!392499 e!392502)))

(declare-fun res!453899 () Bool)

(assert (=> b!689334 (=> res!453899 e!392502)))

(assert (=> b!689334 (= res!453899 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689335 () Bool)

(declare-fun e!392497 () Bool)

(assert (=> b!689335 (= e!392497 e!392500)))

(declare-fun res!453905 () Bool)

(assert (=> b!689335 (=> (not res!453905) (not e!392500))))

(assert (=> b!689335 (= res!453905 (bvsle from!3004 i!1382))))

(declare-fun b!689336 () Bool)

(declare-datatypes ((Unit!24337 0))(
  ( (Unit!24338) )
))
(declare-fun e!392501 () Unit!24337)

(declare-fun Unit!24339 () Unit!24337)

(assert (=> b!689336 (= e!392501 Unit!24339)))

(declare-fun b!689337 () Bool)

(declare-fun e!392495 () Bool)

(assert (=> b!689337 (= e!392495 (not (contains!3652 lt!316112 k!2843)))))

(declare-fun b!689338 () Bool)

(assert (=> b!689338 (= e!392503 (bvslt (bvsub (size!19416 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19416 a!3626) from!3004)))))

(declare-fun b!689339 () Bool)

(declare-fun res!453904 () Bool)

(assert (=> b!689339 (=> res!453904 e!392503)))

(assert (=> b!689339 (= res!453904 (contains!3652 lt!316112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689340 () Bool)

(declare-fun res!453900 () Bool)

(assert (=> b!689340 (=> (not res!453900) (not e!392496))))

(assert (=> b!689340 (= res!453900 e!392497)))

(declare-fun res!453893 () Bool)

(assert (=> b!689340 (=> res!453893 e!392497)))

(declare-fun e!392498 () Bool)

(assert (=> b!689340 (= res!453893 e!392498)))

(declare-fun res!453898 () Bool)

(assert (=> b!689340 (=> (not res!453898) (not e!392498))))

(assert (=> b!689340 (= res!453898 (bvsgt from!3004 i!1382))))

(declare-fun b!689341 () Bool)

(assert (=> b!689341 (= e!392498 (contains!3652 acc!681 k!2843))))

(declare-fun b!689342 () Bool)

(declare-fun res!453890 () Bool)

(assert (=> b!689342 (=> (not res!453890) (not e!392496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689342 (= res!453890 (validKeyInArray!0 k!2843))))

(declare-fun b!689343 () Bool)

(declare-fun Unit!24340 () Unit!24337)

(assert (=> b!689343 (= e!392501 Unit!24340)))

(declare-fun lt!316119 () Unit!24337)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39725 (_ BitVec 64) (_ BitVec 32)) Unit!24337)

(assert (=> b!689343 (= lt!316119 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!689343 false))

(declare-fun b!689344 () Bool)

(declare-fun res!453894 () Bool)

(assert (=> b!689344 (=> (not res!453894) (not e!392496))))

(assert (=> b!689344 (= res!453894 (not (contains!3652 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689345 () Bool)

(declare-fun res!453895 () Bool)

(assert (=> b!689345 (=> (not res!453895) (not e!392496))))

(assert (=> b!689345 (= res!453895 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13072))))

(declare-fun b!689346 () Bool)

(declare-fun e!392505 () Unit!24337)

(declare-fun Unit!24341 () Unit!24337)

(assert (=> b!689346 (= e!392505 Unit!24341)))

(declare-fun b!689347 () Bool)

(declare-fun res!453903 () Bool)

(assert (=> b!689347 (=> (not res!453903) (not e!392496))))

(assert (=> b!689347 (= res!453903 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19416 a!3626))))))

(declare-fun b!689348 () Bool)

(assert (=> b!689348 (= e!392496 (not e!392503))))

(declare-fun res!453911 () Bool)

(assert (=> b!689348 (=> res!453911 e!392503)))

(assert (=> b!689348 (= res!453911 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689348 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316112)))

(declare-fun lt!316116 () Unit!24337)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39725 (_ BitVec 64) (_ BitVec 32) List!13075 List!13075) Unit!24337)

(assert (=> b!689348 (= lt!316116 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316112))))

(declare-fun -!203 (List!13075 (_ BitVec 64)) List!13075)

(assert (=> b!689348 (= (-!203 lt!316112 k!2843) acc!681)))

(declare-fun $colon$colon!403 (List!13075 (_ BitVec 64)) List!13075)

(assert (=> b!689348 (= lt!316112 ($colon$colon!403 acc!681 k!2843))))

(declare-fun lt!316118 () Unit!24337)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13075) Unit!24337)

(assert (=> b!689348 (= lt!316118 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!238 (List!13075 List!13075) Bool)

(assert (=> b!689348 (subseq!238 acc!681 acc!681)))

(declare-fun lt!316114 () Unit!24337)

(declare-fun lemmaListSubSeqRefl!0 (List!13075) Unit!24337)

(assert (=> b!689348 (= lt!316114 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689348 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316113 () Unit!24337)

(assert (=> b!689348 (= lt!316113 e!392505)))

(declare-fun c!78086 () Bool)

(assert (=> b!689348 (= c!78086 (validKeyInArray!0 (select (arr!19034 a!3626) from!3004)))))

(declare-fun lt!316115 () Unit!24337)

(assert (=> b!689348 (= lt!316115 e!392501)))

(declare-fun c!78085 () Bool)

(assert (=> b!689348 (= c!78085 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689348 (arrayContainsKey!0 (array!39726 (store (arr!19034 a!3626) i!1382 k!2843) (size!19416 a!3626)) k!2843 from!3004)))

(declare-fun b!689349 () Bool)

(declare-fun lt!316117 () Unit!24337)

(assert (=> b!689349 (= e!392505 lt!316117)))

(declare-fun lt!316120 () Unit!24337)

(assert (=> b!689349 (= lt!316120 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689349 (subseq!238 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39725 List!13075 List!13075 (_ BitVec 32)) Unit!24337)

(assert (=> b!689349 (= lt!316117 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!403 acc!681 (select (arr!19034 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689349 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689350 () Bool)

(declare-fun res!453908 () Bool)

(assert (=> b!689350 (=> (not res!453908) (not e!392496))))

(assert (=> b!689350 (= res!453908 (noDuplicate!899 acc!681))))

(declare-fun b!689351 () Bool)

(declare-fun res!453891 () Bool)

(assert (=> b!689351 (=> res!453891 e!392503)))

(assert (=> b!689351 (= res!453891 e!392499)))

(declare-fun res!453902 () Bool)

(assert (=> b!689351 (=> (not res!453902) (not e!392499))))

(assert (=> b!689351 (= res!453902 e!392495)))

(declare-fun res!453909 () Bool)

(assert (=> b!689351 (=> res!453909 e!392495)))

(assert (=> b!689351 (= res!453909 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!61584 res!453897) b!689350))

(assert (= (and b!689350 res!453908) b!689329))

(assert (= (and b!689329 res!453907) b!689344))

(assert (= (and b!689344 res!453894) b!689340))

(assert (= (and b!689340 res!453898) b!689341))

(assert (= (and b!689340 (not res!453893)) b!689335))

(assert (= (and b!689335 res!453905) b!689331))

(assert (= (and b!689340 res!453900) b!689345))

(assert (= (and b!689345 res!453895) b!689326))

(assert (= (and b!689326 res!453906) b!689347))

(assert (= (and b!689347 res!453903) b!689342))

(assert (= (and b!689342 res!453890) b!689333))

(assert (= (and b!689333 res!453901) b!689330))

(assert (= (and b!689330 res!453910) b!689348))

(assert (= (and b!689348 c!78085) b!689343))

(assert (= (and b!689348 (not c!78085)) b!689336))

(assert (= (and b!689348 c!78086) b!689349))

(assert (= (and b!689348 (not c!78086)) b!689346))

(assert (= (and b!689348 (not res!453911)) b!689332))

(assert (= (and b!689332 (not res!453896)) b!689339))

(assert (= (and b!689339 (not res!453904)) b!689328))

(assert (= (and b!689328 (not res!453892)) b!689351))

(assert (= (and b!689351 (not res!453909)) b!689337))

(assert (= (and b!689351 res!453902) b!689334))

(assert (= (and b!689334 (not res!453899)) b!689327))

(assert (= (and b!689351 (not res!453891)) b!689338))

(declare-fun m!653011 () Bool)

(assert (=> start!61584 m!653011))

(declare-fun m!653013 () Bool)

(assert (=> b!689337 m!653013))

(declare-fun m!653015 () Bool)

(assert (=> b!689343 m!653015))

(declare-fun m!653017 () Bool)

(assert (=> b!689333 m!653017))

(declare-fun m!653019 () Bool)

(assert (=> b!689342 m!653019))

(declare-fun m!653021 () Bool)

(assert (=> b!689331 m!653021))

(declare-fun m!653023 () Bool)

(assert (=> b!689328 m!653023))

(assert (=> b!689327 m!653013))

(declare-fun m!653025 () Bool)

(assert (=> b!689348 m!653025))

(declare-fun m!653027 () Bool)

(assert (=> b!689348 m!653027))

(declare-fun m!653029 () Bool)

(assert (=> b!689348 m!653029))

(declare-fun m!653031 () Bool)

(assert (=> b!689348 m!653031))

(declare-fun m!653033 () Bool)

(assert (=> b!689348 m!653033))

(declare-fun m!653035 () Bool)

(assert (=> b!689348 m!653035))

(declare-fun m!653037 () Bool)

(assert (=> b!689348 m!653037))

(declare-fun m!653039 () Bool)

(assert (=> b!689348 m!653039))

(declare-fun m!653041 () Bool)

(assert (=> b!689348 m!653041))

(declare-fun m!653043 () Bool)

(assert (=> b!689348 m!653043))

(assert (=> b!689348 m!653031))

(declare-fun m!653045 () Bool)

(assert (=> b!689348 m!653045))

(declare-fun m!653047 () Bool)

(assert (=> b!689348 m!653047))

(declare-fun m!653049 () Bool)

(assert (=> b!689348 m!653049))

(declare-fun m!653051 () Bool)

(assert (=> b!689345 m!653051))

(declare-fun m!653053 () Bool)

(assert (=> b!689332 m!653053))

(declare-fun m!653055 () Bool)

(assert (=> b!689339 m!653055))

(assert (=> b!689341 m!653021))

(assert (=> b!689349 m!653029))

(assert (=> b!689349 m!653031))

(declare-fun m!653057 () Bool)

(assert (=> b!689349 m!653057))

(declare-fun m!653059 () Bool)

(assert (=> b!689349 m!653059))

(assert (=> b!689349 m!653031))

(assert (=> b!689349 m!653057))

(assert (=> b!689349 m!653037))

(assert (=> b!689349 m!653049))

(declare-fun m!653061 () Bool)

(assert (=> b!689326 m!653061))

(declare-fun m!653063 () Bool)

(assert (=> b!689344 m!653063))

(declare-fun m!653065 () Bool)

(assert (=> b!689329 m!653065))

(declare-fun m!653067 () Bool)

(assert (=> b!689350 m!653067))

(push 1)

(assert (not b!689328))

(assert (not b!689339))

(assert (not b!689332))

(assert (not b!689349))

(assert (not b!689345))

(assert (not b!689348))

(assert (not b!689341))

(assert (not b!689329))

(assert (not b!689331))

(assert (not b!689333))

(assert (not b!689342))

(assert (not b!689337))

(assert (not b!689343))

(assert (not b!689326))

(assert (not start!61584))

(assert (not b!689344))

(assert (not b!689327))

(assert (not b!689350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

