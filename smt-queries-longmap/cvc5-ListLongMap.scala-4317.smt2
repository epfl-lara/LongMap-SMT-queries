; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59992 () Bool)

(assert start!59992)

(declare-fun b!664334 () Bool)

(declare-fun res!431980 () Bool)

(declare-fun e!381072 () Bool)

(assert (=> b!664334 (=> (not res!431980) (not e!381072))))

(declare-datatypes ((array!38977 0))(
  ( (array!38978 (arr!18678 (Array (_ BitVec 32) (_ BitVec 64))) (size!19042 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38977)

(declare-datatypes ((List!12626 0))(
  ( (Nil!12623) (Cons!12622 (h!13670 (_ BitVec 64)) (t!18846 List!12626)) )
))
(declare-fun arrayNoDuplicates!0 (array!38977 (_ BitVec 32) List!12626) Bool)

(assert (=> b!664334 (= res!431980 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12623))))

(declare-fun b!664335 () Bool)

(declare-datatypes ((Unit!23119 0))(
  ( (Unit!23120) )
))
(declare-fun e!381073 () Unit!23119)

(declare-fun lt!309591 () Unit!23119)

(assert (=> b!664335 (= e!381073 lt!309591)))

(declare-fun lt!309594 () Unit!23119)

(declare-fun acc!681 () List!12626)

(declare-fun lemmaListSubSeqRefl!0 (List!12626) Unit!23119)

(assert (=> b!664335 (= lt!309594 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!40 (List!12626 List!12626) Bool)

(assert (=> b!664335 (subseq!40 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38977 List!12626 List!12626 (_ BitVec 32)) Unit!23119)

(declare-fun $colon$colon!169 (List!12626 (_ BitVec 64)) List!12626)

(assert (=> b!664335 (= lt!309591 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!169 acc!681 (select (arr!18678 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664335 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664336 () Bool)

(declare-fun res!431975 () Bool)

(assert (=> b!664336 (=> (not res!431975) (not e!381072))))

(declare-fun contains!3278 (List!12626 (_ BitVec 64)) Bool)

(assert (=> b!664336 (= res!431975 (not (contains!3278 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664337 () Bool)

(declare-fun Unit!23121 () Unit!23119)

(assert (=> b!664337 (= e!381073 Unit!23121)))

(declare-fun b!664338 () Bool)

(declare-fun res!431971 () Bool)

(assert (=> b!664338 (=> (not res!431971) (not e!381072))))

(declare-fun e!381078 () Bool)

(assert (=> b!664338 (= res!431971 e!381078)))

(declare-fun res!431973 () Bool)

(assert (=> b!664338 (=> res!431973 e!381078)))

(declare-fun e!381075 () Bool)

(assert (=> b!664338 (= res!431973 e!381075)))

(declare-fun res!431976 () Bool)

(assert (=> b!664338 (=> (not res!431976) (not e!381075))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664338 (= res!431976 (bvsgt from!3004 i!1382))))

(declare-fun b!664339 () Bool)

(declare-fun res!431979 () Bool)

(assert (=> b!664339 (=> (not res!431979) (not e!381072))))

(assert (=> b!664339 (= res!431979 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19042 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664340 () Bool)

(declare-fun res!431978 () Bool)

(assert (=> b!664340 (=> (not res!431978) (not e!381072))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664340 (= res!431978 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664341 () Bool)

(declare-fun e!381074 () Unit!23119)

(declare-fun Unit!23122 () Unit!23119)

(assert (=> b!664341 (= e!381074 Unit!23122)))

(declare-fun b!664342 () Bool)

(assert (=> b!664342 (= e!381072 (not true))))

(declare-fun lt!309590 () Bool)

(assert (=> b!664342 (= lt!309590 (contains!3278 acc!681 k!2843))))

(assert (=> b!664342 (subseq!40 acc!681 acc!681)))

(declare-fun lt!309589 () Unit!23119)

(assert (=> b!664342 (= lt!309589 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664342 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309592 () Unit!23119)

(assert (=> b!664342 (= lt!309592 e!381073)))

(declare-fun c!76552 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664342 (= c!76552 (validKeyInArray!0 (select (arr!18678 a!3626) from!3004)))))

(declare-fun lt!309593 () Unit!23119)

(assert (=> b!664342 (= lt!309593 e!381074)))

(declare-fun c!76553 () Bool)

(assert (=> b!664342 (= c!76553 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664342 (arrayContainsKey!0 (array!38978 (store (arr!18678 a!3626) i!1382 k!2843) (size!19042 a!3626)) k!2843 from!3004)))

(declare-fun b!664343 () Bool)

(declare-fun res!431969 () Bool)

(assert (=> b!664343 (=> (not res!431969) (not e!381072))))

(assert (=> b!664343 (= res!431969 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!431967 () Bool)

(assert (=> start!59992 (=> (not res!431967) (not e!381072))))

(assert (=> start!59992 (= res!431967 (and (bvslt (size!19042 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19042 a!3626))))))

(assert (=> start!59992 e!381072))

(assert (=> start!59992 true))

(declare-fun array_inv!14537 (array!38977) Bool)

(assert (=> start!59992 (array_inv!14537 a!3626)))

(declare-fun b!664344 () Bool)

(declare-fun res!431970 () Bool)

(assert (=> b!664344 (=> (not res!431970) (not e!381072))))

(declare-fun noDuplicate!552 (List!12626) Bool)

(assert (=> b!664344 (= res!431970 (noDuplicate!552 acc!681))))

(declare-fun b!664345 () Bool)

(declare-fun Unit!23123 () Unit!23119)

(assert (=> b!664345 (= e!381074 Unit!23123)))

(declare-fun lt!309595 () Unit!23119)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38977 (_ BitVec 64) (_ BitVec 32)) Unit!23119)

(assert (=> b!664345 (= lt!309595 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664345 false))

(declare-fun b!664346 () Bool)

(declare-fun res!431968 () Bool)

(assert (=> b!664346 (=> (not res!431968) (not e!381072))))

(assert (=> b!664346 (= res!431968 (validKeyInArray!0 k!2843))))

(declare-fun b!664347 () Bool)

(declare-fun res!431974 () Bool)

(assert (=> b!664347 (=> (not res!431974) (not e!381072))))

(assert (=> b!664347 (= res!431974 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19042 a!3626))))))

(declare-fun b!664348 () Bool)

(declare-fun res!431977 () Bool)

(assert (=> b!664348 (=> (not res!431977) (not e!381072))))

(assert (=> b!664348 (= res!431977 (not (contains!3278 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664349 () Bool)

(declare-fun e!381076 () Bool)

(assert (=> b!664349 (= e!381078 e!381076)))

(declare-fun res!431972 () Bool)

(assert (=> b!664349 (=> (not res!431972) (not e!381076))))

(assert (=> b!664349 (= res!431972 (bvsle from!3004 i!1382))))

(declare-fun b!664350 () Bool)

(assert (=> b!664350 (= e!381075 (contains!3278 acc!681 k!2843))))

(declare-fun b!664351 () Bool)

(assert (=> b!664351 (= e!381076 (not (contains!3278 acc!681 k!2843)))))

(assert (= (and start!59992 res!431967) b!664344))

(assert (= (and b!664344 res!431970) b!664348))

(assert (= (and b!664348 res!431977) b!664336))

(assert (= (and b!664336 res!431975) b!664338))

(assert (= (and b!664338 res!431976) b!664350))

(assert (= (and b!664338 (not res!431973)) b!664349))

(assert (= (and b!664349 res!431972) b!664351))

(assert (= (and b!664338 res!431971) b!664334))

(assert (= (and b!664334 res!431980) b!664343))

(assert (= (and b!664343 res!431969) b!664347))

(assert (= (and b!664347 res!431974) b!664346))

(assert (= (and b!664346 res!431968) b!664340))

(assert (= (and b!664340 res!431978) b!664339))

(assert (= (and b!664339 res!431979) b!664342))

(assert (= (and b!664342 c!76553) b!664345))

(assert (= (and b!664342 (not c!76553)) b!664341))

(assert (= (and b!664342 c!76552) b!664335))

(assert (= (and b!664342 (not c!76552)) b!664337))

(declare-fun m!636207 () Bool)

(assert (=> b!664334 m!636207))

(declare-fun m!636209 () Bool)

(assert (=> b!664348 m!636209))

(declare-fun m!636211 () Bool)

(assert (=> b!664344 m!636211))

(declare-fun m!636213 () Bool)

(assert (=> b!664343 m!636213))

(declare-fun m!636215 () Bool)

(assert (=> b!664342 m!636215))

(declare-fun m!636217 () Bool)

(assert (=> b!664342 m!636217))

(declare-fun m!636219 () Bool)

(assert (=> b!664342 m!636219))

(declare-fun m!636221 () Bool)

(assert (=> b!664342 m!636221))

(declare-fun m!636223 () Bool)

(assert (=> b!664342 m!636223))

(declare-fun m!636225 () Bool)

(assert (=> b!664342 m!636225))

(assert (=> b!664342 m!636217))

(declare-fun m!636227 () Bool)

(assert (=> b!664342 m!636227))

(declare-fun m!636229 () Bool)

(assert (=> b!664342 m!636229))

(declare-fun m!636231 () Bool)

(assert (=> b!664342 m!636231))

(assert (=> b!664351 m!636219))

(assert (=> b!664335 m!636215))

(assert (=> b!664335 m!636217))

(declare-fun m!636233 () Bool)

(assert (=> b!664335 m!636233))

(declare-fun m!636235 () Bool)

(assert (=> b!664335 m!636235))

(assert (=> b!664335 m!636217))

(assert (=> b!664335 m!636233))

(assert (=> b!664335 m!636223))

(assert (=> b!664335 m!636231))

(declare-fun m!636237 () Bool)

(assert (=> b!664340 m!636237))

(declare-fun m!636239 () Bool)

(assert (=> start!59992 m!636239))

(declare-fun m!636241 () Bool)

(assert (=> b!664336 m!636241))

(declare-fun m!636243 () Bool)

(assert (=> b!664345 m!636243))

(assert (=> b!664350 m!636219))

(declare-fun m!636245 () Bool)

(assert (=> b!664346 m!636245))

(push 1)

(assert (not b!664334))

(assert (not b!664340))

(assert (not b!664336))

(assert (not b!664342))

(assert (not b!664351))

(assert (not b!664345))

(assert (not b!664350))

(assert (not start!59992))

(assert (not b!664344))

(assert (not b!664348))

(assert (not b!664343))

(assert (not b!664335))

(assert (not b!664346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

