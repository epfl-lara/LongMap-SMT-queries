; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60998 () Bool)

(assert start!60998)

(declare-fun b!684363 () Bool)

(declare-fun res!449943 () Bool)

(declare-fun e!389747 () Bool)

(assert (=> b!684363 (=> (not res!449943) (not e!389747))))

(declare-datatypes ((List!13025 0))(
  ( (Nil!13022) (Cons!13021 (h!14066 (_ BitVec 64)) (t!19271 List!13025)) )
))
(declare-fun acc!681 () List!13025)

(declare-fun contains!3602 (List!13025 (_ BitVec 64)) Bool)

(assert (=> b!684363 (= res!449943 (not (contains!3602 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684364 () Bool)

(declare-fun res!449950 () Bool)

(assert (=> b!684364 (=> (not res!449950) (not e!389747))))

(declare-fun e!389744 () Bool)

(assert (=> b!684364 (= res!449950 e!389744)))

(declare-fun res!449944 () Bool)

(assert (=> b!684364 (=> res!449944 e!389744)))

(declare-fun e!389746 () Bool)

(assert (=> b!684364 (= res!449944 e!389746)))

(declare-fun res!449949 () Bool)

(assert (=> b!684364 (=> (not res!449949) (not e!389746))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684364 (= res!449949 (bvsgt from!3004 i!1382))))

(declare-fun b!684365 () Bool)

(declare-fun res!449942 () Bool)

(assert (=> b!684365 (=> (not res!449942) (not e!389747))))

(assert (=> b!684365 (= res!449942 (not (contains!3602 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684366 () Bool)

(declare-fun res!449953 () Bool)

(declare-fun e!389748 () Bool)

(assert (=> b!684366 (=> res!449953 e!389748)))

(declare-fun lt!314288 () Bool)

(assert (=> b!684366 (= res!449953 lt!314288)))

(declare-fun b!684367 () Bool)

(declare-fun res!449941 () Bool)

(assert (=> b!684367 (=> (not res!449941) (not e!389747))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684367 (= res!449941 (validKeyInArray!0 k!2843))))

(declare-fun b!684368 () Bool)

(declare-datatypes ((Unit!24087 0))(
  ( (Unit!24088) )
))
(declare-fun e!389741 () Unit!24087)

(declare-fun Unit!24089 () Unit!24087)

(assert (=> b!684368 (= e!389741 Unit!24089)))

(declare-fun lt!314291 () Unit!24087)

(declare-datatypes ((array!39607 0))(
  ( (array!39608 (arr!18984 (Array (_ BitVec 32) (_ BitVec 64))) (size!19351 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39607)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39607 (_ BitVec 64) (_ BitVec 32)) Unit!24087)

(assert (=> b!684368 (= lt!314291 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!684368 false))

(declare-fun b!684369 () Bool)

(declare-fun e!389743 () Unit!24087)

(declare-fun lt!314293 () Unit!24087)

(assert (=> b!684369 (= e!389743 lt!314293)))

(declare-fun lt!314289 () Unit!24087)

(declare-fun lemmaListSubSeqRefl!0 (List!13025) Unit!24087)

(assert (=> b!684369 (= lt!314289 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!188 (List!13025 List!13025) Bool)

(assert (=> b!684369 (subseq!188 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39607 List!13025 List!13025 (_ BitVec 32)) Unit!24087)

(declare-fun $colon$colon!353 (List!13025 (_ BitVec 64)) List!13025)

(assert (=> b!684369 (= lt!314293 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!353 acc!681 (select (arr!18984 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39607 (_ BitVec 32) List!13025) Bool)

(assert (=> b!684369 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684370 () Bool)

(declare-fun Unit!24090 () Unit!24087)

(assert (=> b!684370 (= e!389743 Unit!24090)))

(declare-fun b!684371 () Bool)

(declare-fun res!449952 () Bool)

(assert (=> b!684371 (=> (not res!449952) (not e!389747))))

(assert (=> b!684371 (= res!449952 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684372 () Bool)

(declare-fun res!449948 () Bool)

(assert (=> b!684372 (=> (not res!449948) (not e!389747))))

(assert (=> b!684372 (= res!449948 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19351 a!3626))))))

(declare-fun b!684373 () Bool)

(declare-fun res!449951 () Bool)

(assert (=> b!684373 (=> (not res!449951) (not e!389747))))

(declare-fun noDuplicate!849 (List!13025) Bool)

(assert (=> b!684373 (= res!449951 (noDuplicate!849 acc!681))))

(declare-fun b!684374 () Bool)

(declare-fun Unit!24091 () Unit!24087)

(assert (=> b!684374 (= e!389741 Unit!24091)))

(declare-fun res!449946 () Bool)

(assert (=> start!60998 (=> (not res!449946) (not e!389747))))

(assert (=> start!60998 (= res!449946 (and (bvslt (size!19351 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19351 a!3626))))))

(assert (=> start!60998 e!389747))

(assert (=> start!60998 true))

(declare-fun array_inv!14780 (array!39607) Bool)

(assert (=> start!60998 (array_inv!14780 a!3626)))

(declare-fun b!684375 () Bool)

(declare-fun res!449954 () Bool)

(assert (=> b!684375 (=> res!449954 e!389748)))

(declare-fun lt!314296 () List!13025)

(assert (=> b!684375 (= res!449954 (not (noDuplicate!849 lt!314296)))))

(declare-fun b!684376 () Bool)

(declare-fun res!449947 () Bool)

(assert (=> b!684376 (=> (not res!449947) (not e!389747))))

(declare-fun arrayContainsKey!0 (array!39607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684376 (= res!449947 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684377 () Bool)

(declare-fun res!449956 () Bool)

(assert (=> b!684377 (=> (not res!449956) (not e!389747))))

(assert (=> b!684377 (= res!449956 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19351 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684378 () Bool)

(assert (=> b!684378 (= e!389746 (contains!3602 acc!681 k!2843))))

(declare-fun b!684379 () Bool)

(declare-fun e!389745 () Bool)

(assert (=> b!684379 (= e!389744 e!389745)))

(declare-fun res!449957 () Bool)

(assert (=> b!684379 (=> (not res!449957) (not e!389745))))

(assert (=> b!684379 (= res!449957 (bvsle from!3004 i!1382))))

(declare-fun b!684380 () Bool)

(assert (=> b!684380 (= e!389748 true)))

(declare-fun lt!314287 () Bool)

(assert (=> b!684380 (= lt!314287 (contains!3602 acc!681 k!2843))))

(declare-fun b!684381 () Bool)

(declare-fun res!449945 () Bool)

(assert (=> b!684381 (=> (not res!449945) (not e!389747))))

(assert (=> b!684381 (= res!449945 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13022))))

(declare-fun b!684382 () Bool)

(assert (=> b!684382 (= e!389747 (not e!389748))))

(declare-fun res!449955 () Bool)

(assert (=> b!684382 (=> res!449955 e!389748)))

(assert (=> b!684382 (= res!449955 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!153 (List!13025 (_ BitVec 64)) List!13025)

(assert (=> b!684382 (= (-!153 lt!314296 k!2843) acc!681)))

(assert (=> b!684382 (= lt!314296 ($colon$colon!353 acc!681 k!2843))))

(declare-fun lt!314294 () Unit!24087)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13025) Unit!24087)

(assert (=> b!684382 (= lt!314294 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!684382 (subseq!188 acc!681 acc!681)))

(declare-fun lt!314295 () Unit!24087)

(assert (=> b!684382 (= lt!314295 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684382 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314292 () Unit!24087)

(assert (=> b!684382 (= lt!314292 e!389743)))

(declare-fun c!77578 () Bool)

(assert (=> b!684382 (= c!77578 (validKeyInArray!0 (select (arr!18984 a!3626) from!3004)))))

(declare-fun lt!314290 () Unit!24087)

(assert (=> b!684382 (= lt!314290 e!389741)))

(declare-fun c!77579 () Bool)

(assert (=> b!684382 (= c!77579 lt!314288)))

(assert (=> b!684382 (= lt!314288 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684382 (arrayContainsKey!0 (array!39608 (store (arr!18984 a!3626) i!1382 k!2843) (size!19351 a!3626)) k!2843 from!3004)))

(declare-fun b!684383 () Bool)

(assert (=> b!684383 (= e!389745 (not (contains!3602 acc!681 k!2843)))))

(assert (= (and start!60998 res!449946) b!684373))

(assert (= (and b!684373 res!449951) b!684365))

(assert (= (and b!684365 res!449942) b!684363))

(assert (= (and b!684363 res!449943) b!684364))

(assert (= (and b!684364 res!449949) b!684378))

(assert (= (and b!684364 (not res!449944)) b!684379))

(assert (= (and b!684379 res!449957) b!684383))

(assert (= (and b!684364 res!449950) b!684381))

(assert (= (and b!684381 res!449945) b!684371))

(assert (= (and b!684371 res!449952) b!684372))

(assert (= (and b!684372 res!449948) b!684367))

(assert (= (and b!684367 res!449941) b!684376))

(assert (= (and b!684376 res!449947) b!684377))

(assert (= (and b!684377 res!449956) b!684382))

(assert (= (and b!684382 c!77579) b!684368))

(assert (= (and b!684382 (not c!77579)) b!684374))

(assert (= (and b!684382 c!77578) b!684369))

(assert (= (and b!684382 (not c!77578)) b!684370))

(assert (= (and b!684382 (not res!449955)) b!684375))

(assert (= (and b!684375 (not res!449954)) b!684366))

(assert (= (and b!684366 (not res!449953)) b!684380))

(declare-fun m!648737 () Bool)

(assert (=> b!684382 m!648737))

(declare-fun m!648739 () Bool)

(assert (=> b!684382 m!648739))

(declare-fun m!648741 () Bool)

(assert (=> b!684382 m!648741))

(declare-fun m!648743 () Bool)

(assert (=> b!684382 m!648743))

(declare-fun m!648745 () Bool)

(assert (=> b!684382 m!648745))

(declare-fun m!648747 () Bool)

(assert (=> b!684382 m!648747))

(declare-fun m!648749 () Bool)

(assert (=> b!684382 m!648749))

(assert (=> b!684382 m!648739))

(declare-fun m!648751 () Bool)

(assert (=> b!684382 m!648751))

(declare-fun m!648753 () Bool)

(assert (=> b!684382 m!648753))

(declare-fun m!648755 () Bool)

(assert (=> b!684382 m!648755))

(declare-fun m!648757 () Bool)

(assert (=> b!684382 m!648757))

(declare-fun m!648759 () Bool)

(assert (=> b!684371 m!648759))

(declare-fun m!648761 () Bool)

(assert (=> b!684363 m!648761))

(declare-fun m!648763 () Bool)

(assert (=> b!684367 m!648763))

(declare-fun m!648765 () Bool)

(assert (=> b!684376 m!648765))

(declare-fun m!648767 () Bool)

(assert (=> b!684378 m!648767))

(assert (=> b!684369 m!648737))

(assert (=> b!684369 m!648739))

(declare-fun m!648769 () Bool)

(assert (=> b!684369 m!648769))

(declare-fun m!648771 () Bool)

(assert (=> b!684369 m!648771))

(assert (=> b!684369 m!648739))

(assert (=> b!684369 m!648769))

(assert (=> b!684369 m!648745))

(assert (=> b!684369 m!648753))

(declare-fun m!648773 () Bool)

(assert (=> b!684365 m!648773))

(declare-fun m!648775 () Bool)

(assert (=> b!684375 m!648775))

(assert (=> b!684380 m!648767))

(declare-fun m!648777 () Bool)

(assert (=> start!60998 m!648777))

(declare-fun m!648779 () Bool)

(assert (=> b!684373 m!648779))

(declare-fun m!648781 () Bool)

(assert (=> b!684381 m!648781))

(assert (=> b!684383 m!648767))

(declare-fun m!648783 () Bool)

(assert (=> b!684368 m!648783))

(push 1)

(assert (not b!684382))

(assert (not b!684367))

(assert (not b!684369))

(assert (not b!684376))

(assert (not b!684363))

(assert (not b!684371))

(assert (not start!60998))

(assert (not b!684365))

(assert (not b!684381))

(assert (not b!684368))

(assert (not b!684375))

(assert (not b!684383))

(assert (not b!684380))

(assert (not b!684378))

(assert (not b!684373))

