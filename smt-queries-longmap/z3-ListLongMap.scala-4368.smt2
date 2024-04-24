; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60294 () Bool)

(assert start!60294)

(declare-fun b!675089 () Bool)

(declare-fun res!441431 () Bool)

(declare-fun e!385303 () Bool)

(assert (=> b!675089 (=> (not res!441431) (not e!385303))))

(declare-datatypes ((array!39279 0))(
  ( (array!39280 (arr!18829 (Array (_ BitVec 32) (_ BitVec 64))) (size!19193 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39279)

(declare-datatypes ((List!12777 0))(
  ( (Nil!12774) (Cons!12773 (h!13821 (_ BitVec 64)) (t!18997 List!12777)) )
))
(declare-fun arrayNoDuplicates!0 (array!39279 (_ BitVec 32) List!12777) Bool)

(assert (=> b!675089 (= res!441431 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12774))))

(declare-fun b!675090 () Bool)

(declare-fun res!441442 () Bool)

(declare-fun e!385304 () Bool)

(assert (=> b!675090 (=> (not res!441442) (not e!385304))))

(declare-fun lt!312781 () List!12777)

(declare-fun contains!3429 (List!12777 (_ BitVec 64)) Bool)

(assert (=> b!675090 (= res!441442 (not (contains!3429 lt!312781 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675091 () Bool)

(declare-fun res!441426 () Bool)

(assert (=> b!675091 (=> (not res!441426) (not e!385303))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675091 (= res!441426 (validKeyInArray!0 k0!2843))))

(declare-fun b!675092 () Bool)

(declare-datatypes ((Unit!23727 0))(
  ( (Unit!23728) )
))
(declare-fun e!385305 () Unit!23727)

(declare-fun Unit!23729 () Unit!23727)

(assert (=> b!675092 (= e!385305 Unit!23729)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675092 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312782 () Unit!23727)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39279 (_ BitVec 64) (_ BitVec 32)) Unit!23727)

(assert (=> b!675092 (= lt!312782 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!675092 false))

(declare-fun b!675093 () Bool)

(declare-fun e!385298 () Bool)

(declare-fun e!385302 () Bool)

(assert (=> b!675093 (= e!385298 e!385302)))

(declare-fun res!441434 () Bool)

(assert (=> b!675093 (=> (not res!441434) (not e!385302))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675093 (= res!441434 (bvsle from!3004 i!1382))))

(declare-fun b!675094 () Bool)

(declare-fun res!441421 () Bool)

(assert (=> b!675094 (=> (not res!441421) (not e!385303))))

(assert (=> b!675094 (= res!441421 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675095 () Bool)

(declare-fun res!441437 () Bool)

(assert (=> b!675095 (=> (not res!441437) (not e!385303))))

(declare-fun acc!681 () List!12777)

(assert (=> b!675095 (= res!441437 (not (contains!3429 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675096 () Bool)

(declare-fun res!441438 () Bool)

(assert (=> b!675096 (=> (not res!441438) (not e!385304))))

(assert (=> b!675096 (= res!441438 (not (contains!3429 lt!312781 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675097 () Bool)

(declare-fun e!385296 () Bool)

(declare-fun e!385301 () Bool)

(assert (=> b!675097 (= e!385296 e!385301)))

(declare-fun res!441433 () Bool)

(assert (=> b!675097 (=> (not res!441433) (not e!385301))))

(assert (=> b!675097 (= res!441433 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675098 () Bool)

(declare-fun res!441439 () Bool)

(assert (=> b!675098 (=> (not res!441439) (not e!385303))))

(assert (=> b!675098 (= res!441439 (not (contains!3429 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675099 () Bool)

(declare-fun e!385299 () Bool)

(assert (=> b!675099 (= e!385299 (contains!3429 lt!312781 k0!2843))))

(declare-fun b!675101 () Bool)

(declare-fun res!441425 () Bool)

(assert (=> b!675101 (=> (not res!441425) (not e!385303))))

(declare-fun noDuplicate!703 (List!12777) Bool)

(assert (=> b!675101 (= res!441425 (noDuplicate!703 acc!681))))

(declare-fun b!675102 () Bool)

(declare-fun res!441440 () Bool)

(assert (=> b!675102 (=> (not res!441440) (not e!385303))))

(assert (=> b!675102 (= res!441440 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675103 () Bool)

(declare-fun res!441429 () Bool)

(assert (=> b!675103 (=> (not res!441429) (not e!385304))))

(assert (=> b!675103 (= res!441429 e!385296)))

(declare-fun res!441436 () Bool)

(assert (=> b!675103 (=> res!441436 e!385296)))

(assert (=> b!675103 (= res!441436 e!385299)))

(declare-fun res!441419 () Bool)

(assert (=> b!675103 (=> (not res!441419) (not e!385299))))

(assert (=> b!675103 (= res!441419 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675104 () Bool)

(assert (=> b!675104 (= e!385301 (not (contains!3429 lt!312781 k0!2843)))))

(declare-fun b!675105 () Bool)

(declare-fun res!441418 () Bool)

(assert (=> b!675105 (=> (not res!441418) (not e!385303))))

(assert (=> b!675105 (= res!441418 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19193 a!3626))))))

(declare-fun b!675106 () Bool)

(declare-fun res!441423 () Bool)

(assert (=> b!675106 (=> (not res!441423) (not e!385303))))

(assert (=> b!675106 (= res!441423 (validKeyInArray!0 (select (arr!18829 a!3626) from!3004)))))

(declare-fun b!675107 () Bool)

(declare-fun e!385300 () Bool)

(assert (=> b!675107 (= e!385300 e!385304)))

(declare-fun res!441424 () Bool)

(assert (=> b!675107 (=> (not res!441424) (not e!385304))))

(assert (=> b!675107 (= res!441424 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!299 (List!12777 (_ BitVec 64)) List!12777)

(assert (=> b!675107 (= lt!312781 ($colon$colon!299 acc!681 (select (arr!18829 a!3626) from!3004)))))

(declare-fun b!675108 () Bool)

(declare-fun res!441435 () Bool)

(assert (=> b!675108 (=> (not res!441435) (not e!385303))))

(assert (=> b!675108 (= res!441435 e!385298)))

(declare-fun res!441422 () Bool)

(assert (=> b!675108 (=> res!441422 e!385298)))

(declare-fun e!385295 () Bool)

(assert (=> b!675108 (= res!441422 e!385295)))

(declare-fun res!441441 () Bool)

(assert (=> b!675108 (=> (not res!441441) (not e!385295))))

(assert (=> b!675108 (= res!441441 (bvsgt from!3004 i!1382))))

(declare-fun b!675109 () Bool)

(assert (=> b!675109 (= e!385295 (contains!3429 acc!681 k0!2843))))

(declare-fun res!441420 () Bool)

(assert (=> start!60294 (=> (not res!441420) (not e!385303))))

(assert (=> start!60294 (= res!441420 (and (bvslt (size!19193 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19193 a!3626))))))

(assert (=> start!60294 e!385303))

(assert (=> start!60294 true))

(declare-fun array_inv!14688 (array!39279) Bool)

(assert (=> start!60294 (array_inv!14688 a!3626)))

(declare-fun b!675100 () Bool)

(assert (=> b!675100 (= e!385304 (not true))))

(assert (=> b!675100 (arrayNoDuplicates!0 (array!39280 (store (arr!18829 a!3626) i!1382 k0!2843) (size!19193 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312781)))

(declare-fun lt!312783 () Unit!23727)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39279 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12777) Unit!23727)

(assert (=> b!675100 (= lt!312783 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312781))))

(declare-fun b!675110 () Bool)

(declare-fun res!441432 () Bool)

(assert (=> b!675110 (=> (not res!441432) (not e!385303))))

(assert (=> b!675110 (= res!441432 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19193 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675111 () Bool)

(assert (=> b!675111 (= e!385302 (not (contains!3429 acc!681 k0!2843)))))

(declare-fun b!675112 () Bool)

(assert (=> b!675112 (= e!385303 e!385300)))

(declare-fun res!441427 () Bool)

(assert (=> b!675112 (=> (not res!441427) (not e!385300))))

(assert (=> b!675112 (= res!441427 (not (= (select (arr!18829 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312784 () Unit!23727)

(assert (=> b!675112 (= lt!312784 e!385305)))

(declare-fun c!77204 () Bool)

(assert (=> b!675112 (= c!77204 (= (select (arr!18829 a!3626) from!3004) k0!2843))))

(declare-fun b!675113 () Bool)

(declare-fun res!441430 () Bool)

(assert (=> b!675113 (=> (not res!441430) (not e!385304))))

(assert (=> b!675113 (= res!441430 (noDuplicate!703 lt!312781))))

(declare-fun b!675114 () Bool)

(declare-fun res!441428 () Bool)

(assert (=> b!675114 (=> (not res!441428) (not e!385304))))

(assert (=> b!675114 (= res!441428 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312781))))

(declare-fun b!675115 () Bool)

(declare-fun Unit!23730 () Unit!23727)

(assert (=> b!675115 (= e!385305 Unit!23730)))

(assert (= (and start!60294 res!441420) b!675101))

(assert (= (and b!675101 res!441425) b!675098))

(assert (= (and b!675098 res!441439) b!675095))

(assert (= (and b!675095 res!441437) b!675108))

(assert (= (and b!675108 res!441441) b!675109))

(assert (= (and b!675108 (not res!441422)) b!675093))

(assert (= (and b!675093 res!441434) b!675111))

(assert (= (and b!675108 res!441435) b!675089))

(assert (= (and b!675089 res!441431) b!675102))

(assert (= (and b!675102 res!441440) b!675105))

(assert (= (and b!675105 res!441418) b!675091))

(assert (= (and b!675091 res!441426) b!675094))

(assert (= (and b!675094 res!441421) b!675110))

(assert (= (and b!675110 res!441432) b!675106))

(assert (= (and b!675106 res!441423) b!675112))

(assert (= (and b!675112 c!77204) b!675092))

(assert (= (and b!675112 (not c!77204)) b!675115))

(assert (= (and b!675112 res!441427) b!675107))

(assert (= (and b!675107 res!441424) b!675113))

(assert (= (and b!675113 res!441430) b!675090))

(assert (= (and b!675090 res!441442) b!675096))

(assert (= (and b!675096 res!441438) b!675103))

(assert (= (and b!675103 res!441419) b!675099))

(assert (= (and b!675103 (not res!441436)) b!675097))

(assert (= (and b!675097 res!441433) b!675104))

(assert (= (and b!675103 res!441429) b!675114))

(assert (= (and b!675114 res!441428) b!675100))

(declare-fun m!643321 () Bool)

(assert (=> b!675099 m!643321))

(declare-fun m!643323 () Bool)

(assert (=> b!675113 m!643323))

(declare-fun m!643325 () Bool)

(assert (=> b!675106 m!643325))

(assert (=> b!675106 m!643325))

(declare-fun m!643327 () Bool)

(assert (=> b!675106 m!643327))

(assert (=> b!675112 m!643325))

(declare-fun m!643329 () Bool)

(assert (=> b!675114 m!643329))

(declare-fun m!643331 () Bool)

(assert (=> b!675100 m!643331))

(declare-fun m!643333 () Bool)

(assert (=> b!675100 m!643333))

(declare-fun m!643335 () Bool)

(assert (=> b!675100 m!643335))

(declare-fun m!643337 () Bool)

(assert (=> b!675109 m!643337))

(assert (=> b!675111 m!643337))

(declare-fun m!643339 () Bool)

(assert (=> b!675090 m!643339))

(assert (=> b!675107 m!643325))

(assert (=> b!675107 m!643325))

(declare-fun m!643341 () Bool)

(assert (=> b!675107 m!643341))

(declare-fun m!643343 () Bool)

(assert (=> b!675098 m!643343))

(declare-fun m!643345 () Bool)

(assert (=> b!675091 m!643345))

(declare-fun m!643347 () Bool)

(assert (=> b!675101 m!643347))

(declare-fun m!643349 () Bool)

(assert (=> b!675102 m!643349))

(declare-fun m!643351 () Bool)

(assert (=> start!60294 m!643351))

(declare-fun m!643353 () Bool)

(assert (=> b!675096 m!643353))

(declare-fun m!643355 () Bool)

(assert (=> b!675089 m!643355))

(declare-fun m!643357 () Bool)

(assert (=> b!675095 m!643357))

(declare-fun m!643359 () Bool)

(assert (=> b!675092 m!643359))

(declare-fun m!643361 () Bool)

(assert (=> b!675092 m!643361))

(assert (=> b!675104 m!643321))

(declare-fun m!643363 () Bool)

(assert (=> b!675094 m!643363))

(check-sat (not b!675100) (not b!675114) (not b!675091) (not b!675109) (not b!675104) (not b!675106) (not b!675102) (not b!675107) (not b!675095) (not b!675098) (not b!675113) (not b!675111) (not b!675092) (not b!675099) (not b!675094) (not b!675089) (not b!675090) (not start!60294) (not b!675096) (not b!675101))
(check-sat)
