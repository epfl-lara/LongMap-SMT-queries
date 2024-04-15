; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61578 () Bool)

(assert start!61578)

(declare-fun b!689264 () Bool)

(declare-fun e!392411 () Bool)

(declare-datatypes ((List!13116 0))(
  ( (Nil!13113) (Cons!13112 (h!14157 (_ BitVec 64)) (t!19371 List!13116)) )
))
(declare-fun acc!681 () List!13116)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3638 (List!13116 (_ BitVec 64)) Bool)

(assert (=> b!689264 (= e!392411 (not (contains!3638 acc!681 k!2843)))))

(declare-fun b!689265 () Bool)

(declare-fun res!453963 () Bool)

(declare-fun e!392405 () Bool)

(assert (=> b!689265 (=> (not res!453963) (not e!392405))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39730 0))(
  ( (array!39731 (arr!19036 (Array (_ BitVec 32) (_ BitVec 64))) (size!19417 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39730)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!689265 (= res!453963 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19417 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689266 () Bool)

(declare-fun res!453956 () Bool)

(declare-fun e!392406 () Bool)

(assert (=> b!689266 (=> res!453956 e!392406)))

(declare-fun e!392412 () Bool)

(assert (=> b!689266 (= res!453956 e!392412)))

(declare-fun res!453969 () Bool)

(assert (=> b!689266 (=> (not res!453969) (not e!392412))))

(declare-fun e!392408 () Bool)

(assert (=> b!689266 (= res!453969 e!392408)))

(declare-fun res!453968 () Bool)

(assert (=> b!689266 (=> res!453968 e!392408)))

(assert (=> b!689266 (= res!453968 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689267 () Bool)

(declare-fun e!392404 () Bool)

(assert (=> b!689267 (= e!392412 e!392404)))

(declare-fun res!453960 () Bool)

(assert (=> b!689267 (=> res!453960 e!392404)))

(assert (=> b!689267 (= res!453960 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689268 () Bool)

(assert (=> b!689268 (= e!392405 (not e!392406))))

(declare-fun res!453958 () Bool)

(assert (=> b!689268 (=> res!453958 e!392406)))

(assert (=> b!689268 (= res!453958 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!315962 () List!13116)

(declare-fun arrayNoDuplicates!0 (array!39730 (_ BitVec 32) List!13116) Bool)

(assert (=> b!689268 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315962)))

(declare-datatypes ((Unit!24330 0))(
  ( (Unit!24331) )
))
(declare-fun lt!315956 () Unit!24330)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39730 (_ BitVec 64) (_ BitVec 32) List!13116 List!13116) Unit!24330)

(assert (=> b!689268 (= lt!315956 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315962))))

(declare-fun -!206 (List!13116 (_ BitVec 64)) List!13116)

(assert (=> b!689268 (= (-!206 lt!315962 k!2843) acc!681)))

(declare-fun $colon$colon!405 (List!13116 (_ BitVec 64)) List!13116)

(assert (=> b!689268 (= lt!315962 ($colon$colon!405 acc!681 k!2843))))

(declare-fun lt!315955 () Unit!24330)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13116) Unit!24330)

(assert (=> b!689268 (= lt!315955 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!241 (List!13116 List!13116) Bool)

(assert (=> b!689268 (subseq!241 acc!681 acc!681)))

(declare-fun lt!315957 () Unit!24330)

(declare-fun lemmaListSubSeqRefl!0 (List!13116) Unit!24330)

(assert (=> b!689268 (= lt!315957 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689268 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315959 () Unit!24330)

(declare-fun e!392409 () Unit!24330)

(assert (=> b!689268 (= lt!315959 e!392409)))

(declare-fun c!78023 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689268 (= c!78023 (validKeyInArray!0 (select (arr!19036 a!3626) from!3004)))))

(declare-fun lt!315963 () Unit!24330)

(declare-fun e!392410 () Unit!24330)

(assert (=> b!689268 (= lt!315963 e!392410)))

(declare-fun c!78024 () Bool)

(declare-fun arrayContainsKey!0 (array!39730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689268 (= c!78024 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!315958 () array!39730)

(assert (=> b!689268 (arrayContainsKey!0 lt!315958 k!2843 from!3004)))

(assert (=> b!689268 (= lt!315958 (array!39731 (store (arr!19036 a!3626) i!1382 k!2843) (size!19417 a!3626)))))

(declare-fun b!689269 () Bool)

(declare-fun e!392413 () Bool)

(assert (=> b!689269 (= e!392413 (contains!3638 acc!681 k!2843))))

(declare-fun b!689270 () Bool)

(declare-fun Unit!24332 () Unit!24330)

(assert (=> b!689270 (= e!392409 Unit!24332)))

(declare-fun b!689271 () Bool)

(declare-fun res!453965 () Bool)

(assert (=> b!689271 (=> (not res!453965) (not e!392405))))

(assert (=> b!689271 (= res!453965 (not (contains!3638 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689272 () Bool)

(declare-fun res!453966 () Bool)

(assert (=> b!689272 (=> res!453966 e!392406)))

(assert (=> b!689272 (= res!453966 (contains!3638 lt!315962 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689273 () Bool)

(declare-fun Unit!24333 () Unit!24330)

(assert (=> b!689273 (= e!392410 Unit!24333)))

(declare-fun lt!315960 () Unit!24330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39730 (_ BitVec 64) (_ BitVec 32)) Unit!24330)

(assert (=> b!689273 (= lt!315960 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!689273 false))

(declare-fun b!689274 () Bool)

(declare-fun lt!315961 () Unit!24330)

(assert (=> b!689274 (= e!392409 lt!315961)))

(declare-fun lt!315953 () Unit!24330)

(assert (=> b!689274 (= lt!315953 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689274 (subseq!241 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39730 List!13116 List!13116 (_ BitVec 32)) Unit!24330)

(assert (=> b!689274 (= lt!315961 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!405 acc!681 (select (arr!19036 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689274 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689275 () Bool)

(declare-fun res!453959 () Bool)

(assert (=> b!689275 (=> (not res!453959) (not e!392405))))

(assert (=> b!689275 (= res!453959 (validKeyInArray!0 k!2843))))

(declare-fun b!689276 () Bool)

(declare-fun res!453953 () Bool)

(assert (=> b!689276 (=> (not res!453953) (not e!392405))))

(assert (=> b!689276 (= res!453953 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13113))))

(declare-fun b!689277 () Bool)

(declare-fun Unit!24334 () Unit!24330)

(assert (=> b!689277 (= e!392410 Unit!24334)))

(declare-fun b!689278 () Bool)

(declare-fun res!453967 () Bool)

(assert (=> b!689278 (=> res!453967 e!392406)))

(declare-fun noDuplicate!907 (List!13116) Bool)

(assert (=> b!689278 (= res!453967 (not (noDuplicate!907 lt!315962)))))

(declare-fun b!689279 () Bool)

(declare-fun res!453973 () Bool)

(assert (=> b!689279 (=> (not res!453973) (not e!392405))))

(assert (=> b!689279 (= res!453973 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689280 () Bool)

(declare-fun res!453952 () Bool)

(assert (=> b!689280 (=> (not res!453952) (not e!392405))))

(assert (=> b!689280 (= res!453952 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19417 a!3626))))))

(declare-fun b!689281 () Bool)

(declare-fun res!453957 () Bool)

(assert (=> b!689281 (=> (not res!453957) (not e!392405))))

(assert (=> b!689281 (= res!453957 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689282 () Bool)

(declare-fun e!392414 () Bool)

(assert (=> b!689282 (= e!392414 e!392411)))

(declare-fun res!453955 () Bool)

(assert (=> b!689282 (=> (not res!453955) (not e!392411))))

(assert (=> b!689282 (= res!453955 (bvsle from!3004 i!1382))))

(declare-fun b!689283 () Bool)

(declare-fun res!453964 () Bool)

(assert (=> b!689283 (=> (not res!453964) (not e!392405))))

(assert (=> b!689283 (= res!453964 (not (contains!3638 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689284 () Bool)

(assert (=> b!689284 (= e!392404 (contains!3638 lt!315962 k!2843))))

(declare-fun b!689285 () Bool)

(declare-fun res!453971 () Bool)

(assert (=> b!689285 (=> res!453971 e!392406)))

(assert (=> b!689285 (= res!453971 (contains!3638 lt!315962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689286 () Bool)

(assert (=> b!689286 (= e!392408 (not (contains!3638 lt!315962 k!2843)))))

(declare-fun res!453954 () Bool)

(assert (=> start!61578 (=> (not res!453954) (not e!392405))))

(assert (=> start!61578 (= res!453954 (and (bvslt (size!19417 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19417 a!3626))))))

(assert (=> start!61578 e!392405))

(assert (=> start!61578 true))

(declare-fun array_inv!14919 (array!39730) Bool)

(assert (=> start!61578 (array_inv!14919 a!3626)))

(declare-fun b!689287 () Bool)

(declare-fun res!453962 () Bool)

(assert (=> b!689287 (=> (not res!453962) (not e!392405))))

(assert (=> b!689287 (= res!453962 (noDuplicate!907 acc!681))))

(declare-fun b!689288 () Bool)

(declare-fun res!453970 () Bool)

(assert (=> b!689288 (=> (not res!453970) (not e!392405))))

(assert (=> b!689288 (= res!453970 e!392414)))

(declare-fun res!453972 () Bool)

(assert (=> b!689288 (=> res!453972 e!392414)))

(assert (=> b!689288 (= res!453972 e!392413)))

(declare-fun res!453961 () Bool)

(assert (=> b!689288 (=> (not res!453961) (not e!392413))))

(assert (=> b!689288 (= res!453961 (bvsgt from!3004 i!1382))))

(declare-fun b!689289 () Bool)

(assert (=> b!689289 (= e!392406 true)))

(assert (=> b!689289 (arrayNoDuplicates!0 lt!315958 (bvadd #b00000000000000000000000000000001 from!3004) lt!315962)))

(declare-fun lt!315954 () Unit!24330)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39730 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13116) Unit!24330)

(assert (=> b!689289 (= lt!315954 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!315962))))

(assert (= (and start!61578 res!453954) b!689287))

(assert (= (and b!689287 res!453962) b!689283))

(assert (= (and b!689283 res!453964) b!689271))

(assert (= (and b!689271 res!453965) b!689288))

(assert (= (and b!689288 res!453961) b!689269))

(assert (= (and b!689288 (not res!453972)) b!689282))

(assert (= (and b!689282 res!453955) b!689264))

(assert (= (and b!689288 res!453970) b!689276))

(assert (= (and b!689276 res!453953) b!689279))

(assert (= (and b!689279 res!453973) b!689280))

(assert (= (and b!689280 res!453952) b!689275))

(assert (= (and b!689275 res!453959) b!689281))

(assert (= (and b!689281 res!453957) b!689265))

(assert (= (and b!689265 res!453963) b!689268))

(assert (= (and b!689268 c!78024) b!689273))

(assert (= (and b!689268 (not c!78024)) b!689277))

(assert (= (and b!689268 c!78023) b!689274))

(assert (= (and b!689268 (not c!78023)) b!689270))

(assert (= (and b!689268 (not res!453958)) b!689278))

(assert (= (and b!689278 (not res!453967)) b!689285))

(assert (= (and b!689285 (not res!453971)) b!689272))

(assert (= (and b!689272 (not res!453966)) b!689266))

(assert (= (and b!689266 (not res!453968)) b!689286))

(assert (= (and b!689266 res!453969) b!689267))

(assert (= (and b!689267 (not res!453960)) b!689284))

(assert (= (and b!689266 (not res!453956)) b!689289))

(declare-fun m!652411 () Bool)

(assert (=> b!689269 m!652411))

(declare-fun m!652413 () Bool)

(assert (=> b!689276 m!652413))

(declare-fun m!652415 () Bool)

(assert (=> b!689285 m!652415))

(declare-fun m!652417 () Bool)

(assert (=> b!689275 m!652417))

(declare-fun m!652419 () Bool)

(assert (=> b!689279 m!652419))

(declare-fun m!652421 () Bool)

(assert (=> b!689272 m!652421))

(declare-fun m!652423 () Bool)

(assert (=> b!689286 m!652423))

(declare-fun m!652425 () Bool)

(assert (=> b!689281 m!652425))

(assert (=> b!689284 m!652423))

(declare-fun m!652427 () Bool)

(assert (=> b!689268 m!652427))

(declare-fun m!652429 () Bool)

(assert (=> b!689268 m!652429))

(declare-fun m!652431 () Bool)

(assert (=> b!689268 m!652431))

(declare-fun m!652433 () Bool)

(assert (=> b!689268 m!652433))

(declare-fun m!652435 () Bool)

(assert (=> b!689268 m!652435))

(declare-fun m!652437 () Bool)

(assert (=> b!689268 m!652437))

(declare-fun m!652439 () Bool)

(assert (=> b!689268 m!652439))

(declare-fun m!652441 () Bool)

(assert (=> b!689268 m!652441))

(declare-fun m!652443 () Bool)

(assert (=> b!689268 m!652443))

(declare-fun m!652445 () Bool)

(assert (=> b!689268 m!652445))

(declare-fun m!652447 () Bool)

(assert (=> b!689268 m!652447))

(assert (=> b!689268 m!652431))

(declare-fun m!652449 () Bool)

(assert (=> b!689268 m!652449))

(declare-fun m!652451 () Bool)

(assert (=> b!689268 m!652451))

(declare-fun m!652453 () Bool)

(assert (=> b!689289 m!652453))

(declare-fun m!652455 () Bool)

(assert (=> b!689289 m!652455))

(assert (=> b!689264 m!652411))

(declare-fun m!652457 () Bool)

(assert (=> start!61578 m!652457))

(declare-fun m!652459 () Bool)

(assert (=> b!689283 m!652459))

(declare-fun m!652461 () Bool)

(assert (=> b!689271 m!652461))

(assert (=> b!689274 m!652429))

(assert (=> b!689274 m!652431))

(declare-fun m!652463 () Bool)

(assert (=> b!689274 m!652463))

(declare-fun m!652465 () Bool)

(assert (=> b!689274 m!652465))

(assert (=> b!689274 m!652431))

(assert (=> b!689274 m!652463))

(assert (=> b!689274 m!652441))

(assert (=> b!689274 m!652451))

(declare-fun m!652467 () Bool)

(assert (=> b!689287 m!652467))

(declare-fun m!652469 () Bool)

(assert (=> b!689278 m!652469))

(declare-fun m!652471 () Bool)

(assert (=> b!689273 m!652471))

(push 1)

(assert (not b!689279))

(assert (not b!689272))

(assert (not b!689281))

(assert (not b!689283))

(assert (not b!689286))

(assert (not b!689273))

(assert (not b!689274))

(assert (not b!689271))

(assert (not b!689268))

(assert (not b!689264))

(assert (not b!689287))

(assert (not b!689275))

(assert (not b!689289))

(assert (not b!689278))

(assert (not start!61578))

(assert (not b!689284))

(assert (not b!689269))

(assert (not b!689276))

(assert (not b!689285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

