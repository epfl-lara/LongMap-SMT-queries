; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62962 () Bool)

(assert start!62962)

(declare-fun b!709471 () Bool)

(declare-fun res!472894 () Bool)

(declare-fun e!399327 () Bool)

(assert (=> b!709471 (=> (not res!472894) (not e!399327))))

(declare-datatypes ((List!13278 0))(
  ( (Nil!13275) (Cons!13274 (h!14322 (_ BitVec 64)) (t!19564 List!13278)) )
))
(declare-fun newAcc!49 () List!13278)

(declare-fun noDuplicate!1204 (List!13278) Bool)

(assert (=> b!709471 (= res!472894 (noDuplicate!1204 newAcc!49))))

(declare-fun b!709472 () Bool)

(declare-fun res!472900 () Bool)

(assert (=> b!709472 (=> (not res!472900) (not e!399327))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3930 (List!13278 (_ BitVec 64)) Bool)

(assert (=> b!709472 (= res!472900 (contains!3930 newAcc!49 k0!2824))))

(declare-fun b!709473 () Bool)

(declare-fun res!472909 () Bool)

(assert (=> b!709473 (=> (not res!472909) (not e!399327))))

(declare-fun acc!652 () List!13278)

(declare-fun subseq!398 (List!13278 List!13278) Bool)

(assert (=> b!709473 (= res!472909 (subseq!398 acc!652 newAcc!49))))

(declare-fun b!709474 () Bool)

(declare-fun res!472907 () Bool)

(assert (=> b!709474 (=> (not res!472907) (not e!399327))))

(declare-datatypes ((array!40365 0))(
  ( (array!40366 (arr!19330 (Array (_ BitVec 32) (_ BitVec 64))) (size!19725 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40365)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40365 (_ BitVec 32) List!13278) Bool)

(assert (=> b!709474 (= res!472907 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709475 () Bool)

(declare-fun res!472895 () Bool)

(assert (=> b!709475 (=> (not res!472895) (not e!399327))))

(assert (=> b!709475 (= res!472895 (noDuplicate!1204 acc!652))))

(declare-fun b!709476 () Bool)

(declare-fun res!472913 () Bool)

(assert (=> b!709476 (=> (not res!472913) (not e!399327))))

(assert (=> b!709476 (= res!472913 (not (contains!3930 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709477 () Bool)

(declare-fun e!399325 () Bool)

(declare-fun lt!318315 () List!13278)

(assert (=> b!709477 (= e!399325 (contains!3930 lt!318315 k0!2824))))

(declare-fun b!709478 () Bool)

(declare-fun res!472899 () Bool)

(assert (=> b!709478 (=> (not res!472899) (not e!399327))))

(assert (=> b!709478 (= res!472899 (not (contains!3930 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709479 () Bool)

(assert (=> b!709479 (= e!399327 e!399325)))

(declare-fun res!472896 () Bool)

(assert (=> b!709479 (=> (not res!472896) (not e!399325))))

(assert (=> b!709479 (= res!472896 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!506 (List!13278 (_ BitVec 64)) List!13278)

(assert (=> b!709479 (= lt!318315 ($colon$colon!506 acc!652 (select (arr!19330 a!3591) from!2969)))))

(declare-fun b!709480 () Bool)

(declare-fun res!472898 () Bool)

(assert (=> b!709480 (=> (not res!472898) (not e!399325))))

(assert (=> b!709480 (= res!472898 (not (contains!3930 lt!318315 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709481 () Bool)

(declare-fun res!472906 () Bool)

(assert (=> b!709481 (=> (not res!472906) (not e!399325))))

(declare-fun arrayContainsKey!0 (array!40365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709481 (= res!472906 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709482 () Bool)

(declare-fun res!472901 () Bool)

(assert (=> b!709482 (=> (not res!472901) (not e!399325))))

(assert (=> b!709482 (= res!472901 (noDuplicate!1204 lt!318315))))

(declare-fun b!709483 () Bool)

(declare-fun res!472908 () Bool)

(assert (=> b!709483 (=> (not res!472908) (not e!399325))))

(assert (=> b!709483 (= res!472908 (not (contains!3930 lt!318315 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709484 () Bool)

(declare-fun res!472902 () Bool)

(assert (=> b!709484 (=> (not res!472902) (not e!399327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709484 (= res!472902 (validKeyInArray!0 k0!2824))))

(declare-fun b!709485 () Bool)

(declare-fun res!472912 () Bool)

(assert (=> b!709485 (=> (not res!472912) (not e!399327))))

(assert (=> b!709485 (= res!472912 (not (contains!3930 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!472897 () Bool)

(assert (=> start!62962 (=> (not res!472897) (not e!399327))))

(assert (=> start!62962 (= res!472897 (and (bvslt (size!19725 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19725 a!3591))))))

(assert (=> start!62962 e!399327))

(assert (=> start!62962 true))

(declare-fun array_inv!15189 (array!40365) Bool)

(assert (=> start!62962 (array_inv!15189 a!3591)))

(declare-fun b!709486 () Bool)

(declare-fun res!472905 () Bool)

(assert (=> b!709486 (=> (not res!472905) (not e!399327))))

(assert (=> b!709486 (= res!472905 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!709487 () Bool)

(declare-fun res!472914 () Bool)

(assert (=> b!709487 (=> (not res!472914) (not e!399327))))

(assert (=> b!709487 (= res!472914 (not (contains!3930 acc!652 k0!2824)))))

(declare-fun b!709488 () Bool)

(declare-fun res!472910 () Bool)

(assert (=> b!709488 (=> (not res!472910) (not e!399327))))

(assert (=> b!709488 (= res!472910 (not (contains!3930 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709489 () Bool)

(declare-fun res!472915 () Bool)

(assert (=> b!709489 (=> (not res!472915) (not e!399327))))

(assert (=> b!709489 (= res!472915 (validKeyInArray!0 (select (arr!19330 a!3591) from!2969)))))

(declare-fun b!709490 () Bool)

(declare-fun res!472903 () Bool)

(assert (=> b!709490 (=> (not res!472903) (not e!399327))))

(assert (=> b!709490 (= res!472903 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19725 a!3591)))))

(declare-fun b!709491 () Bool)

(declare-fun res!472904 () Bool)

(assert (=> b!709491 (=> (not res!472904) (not e!399325))))

(assert (=> b!709491 (= res!472904 (noDuplicate!1204 ($colon$colon!506 newAcc!49 (select (arr!19330 a!3591) from!2969))))))

(declare-fun b!709492 () Bool)

(declare-fun res!472911 () Bool)

(assert (=> b!709492 (=> (not res!472911) (not e!399327))))

(declare-fun -!362 (List!13278 (_ BitVec 64)) List!13278)

(assert (=> b!709492 (= res!472911 (= (-!362 newAcc!49 k0!2824) acc!652))))

(assert (= (and start!62962 res!472897) b!709475))

(assert (= (and b!709475 res!472895) b!709471))

(assert (= (and b!709471 res!472894) b!709485))

(assert (= (and b!709485 res!472912) b!709478))

(assert (= (and b!709478 res!472899) b!709486))

(assert (= (and b!709486 res!472905) b!709487))

(assert (= (and b!709487 res!472914) b!709484))

(assert (= (and b!709484 res!472902) b!709474))

(assert (= (and b!709474 res!472907) b!709473))

(assert (= (and b!709473 res!472909) b!709472))

(assert (= (and b!709472 res!472900) b!709492))

(assert (= (and b!709492 res!472911) b!709476))

(assert (= (and b!709476 res!472913) b!709488))

(assert (= (and b!709488 res!472910) b!709490))

(assert (= (and b!709490 res!472903) b!709489))

(assert (= (and b!709489 res!472915) b!709479))

(assert (= (and b!709479 res!472896) b!709482))

(assert (= (and b!709482 res!472901) b!709491))

(assert (= (and b!709491 res!472904) b!709480))

(assert (= (and b!709480 res!472898) b!709483))

(assert (= (and b!709483 res!472908) b!709481))

(assert (= (and b!709481 res!472906) b!709477))

(declare-fun m!667299 () Bool)

(assert (=> b!709486 m!667299))

(declare-fun m!667301 () Bool)

(assert (=> b!709474 m!667301))

(declare-fun m!667303 () Bool)

(assert (=> b!709471 m!667303))

(declare-fun m!667305 () Bool)

(assert (=> b!709481 m!667305))

(declare-fun m!667307 () Bool)

(assert (=> b!709473 m!667307))

(declare-fun m!667309 () Bool)

(assert (=> b!709478 m!667309))

(declare-fun m!667311 () Bool)

(assert (=> b!709475 m!667311))

(declare-fun m!667313 () Bool)

(assert (=> b!709479 m!667313))

(assert (=> b!709479 m!667313))

(declare-fun m!667315 () Bool)

(assert (=> b!709479 m!667315))

(declare-fun m!667317 () Bool)

(assert (=> b!709477 m!667317))

(declare-fun m!667319 () Bool)

(assert (=> start!62962 m!667319))

(declare-fun m!667321 () Bool)

(assert (=> b!709476 m!667321))

(declare-fun m!667323 () Bool)

(assert (=> b!709492 m!667323))

(declare-fun m!667325 () Bool)

(assert (=> b!709472 m!667325))

(assert (=> b!709489 m!667313))

(assert (=> b!709489 m!667313))

(declare-fun m!667327 () Bool)

(assert (=> b!709489 m!667327))

(declare-fun m!667329 () Bool)

(assert (=> b!709484 m!667329))

(declare-fun m!667331 () Bool)

(assert (=> b!709483 m!667331))

(declare-fun m!667333 () Bool)

(assert (=> b!709482 m!667333))

(declare-fun m!667335 () Bool)

(assert (=> b!709485 m!667335))

(declare-fun m!667337 () Bool)

(assert (=> b!709487 m!667337))

(assert (=> b!709491 m!667313))

(assert (=> b!709491 m!667313))

(declare-fun m!667339 () Bool)

(assert (=> b!709491 m!667339))

(assert (=> b!709491 m!667339))

(declare-fun m!667341 () Bool)

(assert (=> b!709491 m!667341))

(declare-fun m!667343 () Bool)

(assert (=> b!709488 m!667343))

(declare-fun m!667345 () Bool)

(assert (=> b!709480 m!667345))

(check-sat (not b!709478) (not b!709487) (not start!62962) (not b!709492) (not b!709488) (not b!709484) (not b!709479) (not b!709486) (not b!709481) (not b!709489) (not b!709473) (not b!709474) (not b!709475) (not b!709485) (not b!709477) (not b!709472) (not b!709483) (not b!709482) (not b!709476) (not b!709480) (not b!709471) (not b!709491))
(check-sat)
(get-model)

(declare-fun d!97229 () Bool)

(declare-fun lt!318324 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!344 (List!13278) (InoxSet (_ BitVec 64)))

(assert (=> d!97229 (= lt!318324 (select (content!344 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399350 () Bool)

(assert (=> d!97229 (= lt!318324 e!399350)))

(declare-fun res!473052 () Bool)

(assert (=> d!97229 (=> (not res!473052) (not e!399350))))

(get-info :version)

(assert (=> d!97229 (= res!473052 ((_ is Cons!13274) newAcc!49))))

(assert (=> d!97229 (= (contains!3930 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318324)))

(declare-fun b!709629 () Bool)

(declare-fun e!399351 () Bool)

(assert (=> b!709629 (= e!399350 e!399351)))

(declare-fun res!473053 () Bool)

(assert (=> b!709629 (=> res!473053 e!399351)))

(assert (=> b!709629 (= res!473053 (= (h!14322 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709630 () Bool)

(assert (=> b!709630 (= e!399351 (contains!3930 (t!19564 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97229 res!473052) b!709629))

(assert (= (and b!709629 (not res!473053)) b!709630))

(declare-fun m!667443 () Bool)

(assert (=> d!97229 m!667443))

(declare-fun m!667445 () Bool)

(assert (=> d!97229 m!667445))

(declare-fun m!667447 () Bool)

(assert (=> b!709630 m!667447))

(assert (=> b!709488 d!97229))

(declare-fun d!97231 () Bool)

(declare-fun lt!318325 () Bool)

(assert (=> d!97231 (= lt!318325 (select (content!344 lt!318315) k0!2824))))

(declare-fun e!399352 () Bool)

(assert (=> d!97231 (= lt!318325 e!399352)))

(declare-fun res!473054 () Bool)

(assert (=> d!97231 (=> (not res!473054) (not e!399352))))

(assert (=> d!97231 (= res!473054 ((_ is Cons!13274) lt!318315))))

(assert (=> d!97231 (= (contains!3930 lt!318315 k0!2824) lt!318325)))

(declare-fun b!709631 () Bool)

(declare-fun e!399353 () Bool)

(assert (=> b!709631 (= e!399352 e!399353)))

(declare-fun res!473055 () Bool)

(assert (=> b!709631 (=> res!473055 e!399353)))

(assert (=> b!709631 (= res!473055 (= (h!14322 lt!318315) k0!2824))))

(declare-fun b!709632 () Bool)

(assert (=> b!709632 (= e!399353 (contains!3930 (t!19564 lt!318315) k0!2824))))

(assert (= (and d!97231 res!473054) b!709631))

(assert (= (and b!709631 (not res!473055)) b!709632))

(declare-fun m!667449 () Bool)

(assert (=> d!97231 m!667449))

(declare-fun m!667451 () Bool)

(assert (=> d!97231 m!667451))

(declare-fun m!667453 () Bool)

(assert (=> b!709632 m!667453))

(assert (=> b!709477 d!97231))

(declare-fun d!97233 () Bool)

(declare-fun lt!318326 () Bool)

(assert (=> d!97233 (= lt!318326 (select (content!344 acc!652) k0!2824))))

(declare-fun e!399354 () Bool)

(assert (=> d!97233 (= lt!318326 e!399354)))

(declare-fun res!473056 () Bool)

(assert (=> d!97233 (=> (not res!473056) (not e!399354))))

(assert (=> d!97233 (= res!473056 ((_ is Cons!13274) acc!652))))

(assert (=> d!97233 (= (contains!3930 acc!652 k0!2824) lt!318326)))

(declare-fun b!709633 () Bool)

(declare-fun e!399355 () Bool)

(assert (=> b!709633 (= e!399354 e!399355)))

(declare-fun res!473057 () Bool)

(assert (=> b!709633 (=> res!473057 e!399355)))

(assert (=> b!709633 (= res!473057 (= (h!14322 acc!652) k0!2824))))

(declare-fun b!709634 () Bool)

(assert (=> b!709634 (= e!399355 (contains!3930 (t!19564 acc!652) k0!2824))))

(assert (= (and d!97233 res!473056) b!709633))

(assert (= (and b!709633 (not res!473057)) b!709634))

(declare-fun m!667455 () Bool)

(assert (=> d!97233 m!667455))

(declare-fun m!667457 () Bool)

(assert (=> d!97233 m!667457))

(declare-fun m!667459 () Bool)

(assert (=> b!709634 m!667459))

(assert (=> b!709487 d!97233))

(declare-fun d!97235 () Bool)

(declare-fun lt!318327 () Bool)

(assert (=> d!97235 (= lt!318327 (select (content!344 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399356 () Bool)

(assert (=> d!97235 (= lt!318327 e!399356)))

(declare-fun res!473058 () Bool)

(assert (=> d!97235 (=> (not res!473058) (not e!399356))))

(assert (=> d!97235 (= res!473058 ((_ is Cons!13274) newAcc!49))))

(assert (=> d!97235 (= (contains!3930 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318327)))

(declare-fun b!709635 () Bool)

(declare-fun e!399357 () Bool)

(assert (=> b!709635 (= e!399356 e!399357)))

(declare-fun res!473059 () Bool)

(assert (=> b!709635 (=> res!473059 e!399357)))

(assert (=> b!709635 (= res!473059 (= (h!14322 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709636 () Bool)

(assert (=> b!709636 (= e!399357 (contains!3930 (t!19564 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97235 res!473058) b!709635))

(assert (= (and b!709635 (not res!473059)) b!709636))

(assert (=> d!97235 m!667443))

(declare-fun m!667461 () Bool)

(assert (=> d!97235 m!667461))

(declare-fun m!667463 () Bool)

(assert (=> b!709636 m!667463))

(assert (=> b!709476 d!97235))

(declare-fun d!97237 () Bool)

(assert (=> d!97237 (= (array_inv!15189 a!3591) (bvsge (size!19725 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62962 d!97237))

(declare-fun d!97239 () Bool)

(declare-fun res!473064 () Bool)

(declare-fun e!399362 () Bool)

(assert (=> d!97239 (=> res!473064 e!399362)))

(assert (=> d!97239 (= res!473064 (= (select (arr!19330 a!3591) from!2969) k0!2824))))

(assert (=> d!97239 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!399362)))

(declare-fun b!709641 () Bool)

(declare-fun e!399363 () Bool)

(assert (=> b!709641 (= e!399362 e!399363)))

(declare-fun res!473065 () Bool)

(assert (=> b!709641 (=> (not res!473065) (not e!399363))))

(assert (=> b!709641 (= res!473065 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19725 a!3591)))))

(declare-fun b!709642 () Bool)

(assert (=> b!709642 (= e!399363 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97239 (not res!473064)) b!709641))

(assert (= (and b!709641 res!473065) b!709642))

(assert (=> d!97239 m!667313))

(declare-fun m!667465 () Bool)

(assert (=> b!709642 m!667465))

(assert (=> b!709486 d!97239))

(declare-fun d!97241 () Bool)

(declare-fun res!473070 () Bool)

(declare-fun e!399368 () Bool)

(assert (=> d!97241 (=> res!473070 e!399368)))

(assert (=> d!97241 (= res!473070 ((_ is Nil!13275) acc!652))))

(assert (=> d!97241 (= (noDuplicate!1204 acc!652) e!399368)))

(declare-fun b!709647 () Bool)

(declare-fun e!399369 () Bool)

(assert (=> b!709647 (= e!399368 e!399369)))

(declare-fun res!473071 () Bool)

(assert (=> b!709647 (=> (not res!473071) (not e!399369))))

(assert (=> b!709647 (= res!473071 (not (contains!3930 (t!19564 acc!652) (h!14322 acc!652))))))

(declare-fun b!709648 () Bool)

(assert (=> b!709648 (= e!399369 (noDuplicate!1204 (t!19564 acc!652)))))

(assert (= (and d!97241 (not res!473070)) b!709647))

(assert (= (and b!709647 res!473071) b!709648))

(declare-fun m!667467 () Bool)

(assert (=> b!709647 m!667467))

(declare-fun m!667469 () Bool)

(assert (=> b!709648 m!667469))

(assert (=> b!709475 d!97241))

(declare-fun d!97243 () Bool)

(declare-fun lt!318328 () Bool)

(assert (=> d!97243 (= lt!318328 (select (content!344 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399370 () Bool)

(assert (=> d!97243 (= lt!318328 e!399370)))

(declare-fun res!473072 () Bool)

(assert (=> d!97243 (=> (not res!473072) (not e!399370))))

(assert (=> d!97243 (= res!473072 ((_ is Cons!13274) acc!652))))

(assert (=> d!97243 (= (contains!3930 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318328)))

(declare-fun b!709649 () Bool)

(declare-fun e!399371 () Bool)

(assert (=> b!709649 (= e!399370 e!399371)))

(declare-fun res!473073 () Bool)

(assert (=> b!709649 (=> res!473073 e!399371)))

(assert (=> b!709649 (= res!473073 (= (h!14322 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709650 () Bool)

(assert (=> b!709650 (= e!399371 (contains!3930 (t!19564 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97243 res!473072) b!709649))

(assert (= (and b!709649 (not res!473073)) b!709650))

(assert (=> d!97243 m!667455))

(declare-fun m!667471 () Bool)

(assert (=> d!97243 m!667471))

(declare-fun m!667473 () Bool)

(assert (=> b!709650 m!667473))

(assert (=> b!709485 d!97243))

(declare-fun b!709671 () Bool)

(declare-fun e!399390 () Bool)

(declare-fun e!399393 () Bool)

(assert (=> b!709671 (= e!399390 e!399393)))

(declare-fun c!78659 () Bool)

(assert (=> b!709671 (= c!78659 (validKeyInArray!0 (select (arr!19330 a!3591) from!2969)))))

(declare-fun d!97245 () Bool)

(declare-fun res!473090 () Bool)

(declare-fun e!399391 () Bool)

(assert (=> d!97245 (=> res!473090 e!399391)))

(assert (=> d!97245 (= res!473090 (bvsge from!2969 (size!19725 a!3591)))))

(assert (=> d!97245 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399391)))

(declare-fun b!709672 () Bool)

(declare-fun call!34443 () Bool)

(assert (=> b!709672 (= e!399393 call!34443)))

(declare-fun b!709673 () Bool)

(declare-fun e!399392 () Bool)

(assert (=> b!709673 (= e!399392 (contains!3930 acc!652 (select (arr!19330 a!3591) from!2969)))))

(declare-fun b!709674 () Bool)

(assert (=> b!709674 (= e!399391 e!399390)))

(declare-fun res!473092 () Bool)

(assert (=> b!709674 (=> (not res!473092) (not e!399390))))

(assert (=> b!709674 (= res!473092 (not e!399392))))

(declare-fun res!473091 () Bool)

(assert (=> b!709674 (=> (not res!473091) (not e!399392))))

(assert (=> b!709674 (= res!473091 (validKeyInArray!0 (select (arr!19330 a!3591) from!2969)))))

(declare-fun bm!34440 () Bool)

(assert (=> bm!34440 (= call!34443 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78659 (Cons!13274 (select (arr!19330 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!709675 () Bool)

(assert (=> b!709675 (= e!399393 call!34443)))

(assert (= (and d!97245 (not res!473090)) b!709674))

(assert (= (and b!709674 res!473091) b!709673))

(assert (= (and b!709674 res!473092) b!709671))

(assert (= (and b!709671 c!78659) b!709675))

(assert (= (and b!709671 (not c!78659)) b!709672))

(assert (= (or b!709675 b!709672) bm!34440))

(assert (=> b!709671 m!667313))

(assert (=> b!709671 m!667313))

(assert (=> b!709671 m!667327))

(assert (=> b!709673 m!667313))

(assert (=> b!709673 m!667313))

(declare-fun m!667487 () Bool)

(assert (=> b!709673 m!667487))

(assert (=> b!709674 m!667313))

(assert (=> b!709674 m!667313))

(assert (=> b!709674 m!667327))

(assert (=> bm!34440 m!667313))

(declare-fun m!667489 () Bool)

(assert (=> bm!34440 m!667489))

(assert (=> b!709474 d!97245))

(declare-fun d!97257 () Bool)

(assert (=> d!97257 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709484 d!97257))

(declare-fun b!709716 () Bool)

(declare-fun e!399437 () Bool)

(assert (=> b!709716 (= e!399437 (subseq!398 (t!19564 acc!652) (t!19564 newAcc!49)))))

(declare-fun b!709714 () Bool)

(declare-fun e!399432 () Bool)

(declare-fun e!399435 () Bool)

(assert (=> b!709714 (= e!399432 e!399435)))

(declare-fun res!473131 () Bool)

(assert (=> b!709714 (=> (not res!473131) (not e!399435))))

(assert (=> b!709714 (= res!473131 ((_ is Cons!13274) newAcc!49))))

(declare-fun b!709717 () Bool)

(declare-fun e!399436 () Bool)

(assert (=> b!709717 (= e!399436 (subseq!398 acc!652 (t!19564 newAcc!49)))))

(declare-fun b!709715 () Bool)

(assert (=> b!709715 (= e!399435 e!399436)))

(declare-fun res!473134 () Bool)

(assert (=> b!709715 (=> res!473134 e!399436)))

(assert (=> b!709715 (= res!473134 e!399437)))

(declare-fun res!473135 () Bool)

(assert (=> b!709715 (=> (not res!473135) (not e!399437))))

(assert (=> b!709715 (= res!473135 (= (h!14322 acc!652) (h!14322 newAcc!49)))))

(declare-fun d!97259 () Bool)

(declare-fun res!473136 () Bool)

(assert (=> d!97259 (=> res!473136 e!399432)))

(assert (=> d!97259 (= res!473136 ((_ is Nil!13275) acc!652))))

(assert (=> d!97259 (= (subseq!398 acc!652 newAcc!49) e!399432)))

(assert (= (and d!97259 (not res!473136)) b!709714))

(assert (= (and b!709714 res!473131) b!709715))

(assert (= (and b!709715 res!473135) b!709716))

(assert (= (and b!709715 (not res!473134)) b!709717))

(declare-fun m!667527 () Bool)

(assert (=> b!709716 m!667527))

(declare-fun m!667529 () Bool)

(assert (=> b!709717 m!667529))

(assert (=> b!709473 d!97259))

(declare-fun d!97279 () Bool)

(declare-fun lt!318339 () Bool)

(assert (=> d!97279 (= lt!318339 (select (content!344 lt!318315) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399440 () Bool)

(assert (=> d!97279 (= lt!318339 e!399440)))

(declare-fun res!473139 () Bool)

(assert (=> d!97279 (=> (not res!473139) (not e!399440))))

(assert (=> d!97279 (= res!473139 ((_ is Cons!13274) lt!318315))))

(assert (=> d!97279 (= (contains!3930 lt!318315 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318339)))

(declare-fun b!709722 () Bool)

(declare-fun e!399441 () Bool)

(assert (=> b!709722 (= e!399440 e!399441)))

(declare-fun res!473140 () Bool)

(assert (=> b!709722 (=> res!473140 e!399441)))

(assert (=> b!709722 (= res!473140 (= (h!14322 lt!318315) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709723 () Bool)

(assert (=> b!709723 (= e!399441 (contains!3930 (t!19564 lt!318315) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97279 res!473139) b!709722))

(assert (= (and b!709722 (not res!473140)) b!709723))

(assert (=> d!97279 m!667449))

(declare-fun m!667531 () Bool)

(assert (=> d!97279 m!667531))

(declare-fun m!667533 () Bool)

(assert (=> b!709723 m!667533))

(assert (=> b!709483 d!97279))

(declare-fun d!97281 () Bool)

(declare-fun lt!318340 () Bool)

(assert (=> d!97281 (= lt!318340 (select (content!344 newAcc!49) k0!2824))))

(declare-fun e!399442 () Bool)

(assert (=> d!97281 (= lt!318340 e!399442)))

(declare-fun res!473141 () Bool)

(assert (=> d!97281 (=> (not res!473141) (not e!399442))))

(assert (=> d!97281 (= res!473141 ((_ is Cons!13274) newAcc!49))))

(assert (=> d!97281 (= (contains!3930 newAcc!49 k0!2824) lt!318340)))

(declare-fun b!709724 () Bool)

(declare-fun e!399443 () Bool)

(assert (=> b!709724 (= e!399442 e!399443)))

(declare-fun res!473142 () Bool)

(assert (=> b!709724 (=> res!473142 e!399443)))

(assert (=> b!709724 (= res!473142 (= (h!14322 newAcc!49) k0!2824))))

(declare-fun b!709725 () Bool)

(assert (=> b!709725 (= e!399443 (contains!3930 (t!19564 newAcc!49) k0!2824))))

(assert (= (and d!97281 res!473141) b!709724))

(assert (= (and b!709724 (not res!473142)) b!709725))

(assert (=> d!97281 m!667443))

(declare-fun m!667535 () Bool)

(assert (=> d!97281 m!667535))

(declare-fun m!667537 () Bool)

(assert (=> b!709725 m!667537))

(assert (=> b!709472 d!97281))

(declare-fun d!97283 () Bool)

(declare-fun res!473143 () Bool)

(declare-fun e!399444 () Bool)

(assert (=> d!97283 (=> res!473143 e!399444)))

(assert (=> d!97283 (= res!473143 ((_ is Nil!13275) lt!318315))))

(assert (=> d!97283 (= (noDuplicate!1204 lt!318315) e!399444)))

(declare-fun b!709726 () Bool)

(declare-fun e!399445 () Bool)

(assert (=> b!709726 (= e!399444 e!399445)))

(declare-fun res!473144 () Bool)

(assert (=> b!709726 (=> (not res!473144) (not e!399445))))

(assert (=> b!709726 (= res!473144 (not (contains!3930 (t!19564 lt!318315) (h!14322 lt!318315))))))

(declare-fun b!709727 () Bool)

(assert (=> b!709727 (= e!399445 (noDuplicate!1204 (t!19564 lt!318315)))))

(assert (= (and d!97283 (not res!473143)) b!709726))

(assert (= (and b!709726 res!473144) b!709727))

(declare-fun m!667539 () Bool)

(assert (=> b!709726 m!667539))

(declare-fun m!667541 () Bool)

(assert (=> b!709727 m!667541))

(assert (=> b!709482 d!97283))

(declare-fun d!97285 () Bool)

(declare-fun res!473146 () Bool)

(declare-fun e!399446 () Bool)

(assert (=> d!97285 (=> res!473146 e!399446)))

(assert (=> d!97285 (= res!473146 ((_ is Nil!13275) newAcc!49))))

(assert (=> d!97285 (= (noDuplicate!1204 newAcc!49) e!399446)))

(declare-fun b!709728 () Bool)

(declare-fun e!399448 () Bool)

(assert (=> b!709728 (= e!399446 e!399448)))

(declare-fun res!473148 () Bool)

(assert (=> b!709728 (=> (not res!473148) (not e!399448))))

(assert (=> b!709728 (= res!473148 (not (contains!3930 (t!19564 newAcc!49) (h!14322 newAcc!49))))))

(declare-fun b!709729 () Bool)

(assert (=> b!709729 (= e!399448 (noDuplicate!1204 (t!19564 newAcc!49)))))

(assert (= (and d!97285 (not res!473146)) b!709728))

(assert (= (and b!709728 res!473148) b!709729))

(declare-fun m!667543 () Bool)

(assert (=> b!709728 m!667543))

(declare-fun m!667545 () Bool)

(assert (=> b!709729 m!667545))

(assert (=> b!709471 d!97285))

(declare-fun b!709777 () Bool)

(declare-fun e!399487 () List!13278)

(declare-fun call!34449 () List!13278)

(assert (=> b!709777 (= e!399487 call!34449)))

(declare-fun b!709778 () Bool)

(declare-fun e!399488 () List!13278)

(assert (=> b!709778 (= e!399488 Nil!13275)))

(declare-fun b!709779 () Bool)

(assert (=> b!709779 (= e!399488 e!399487)))

(declare-fun c!78671 () Bool)

(assert (=> b!709779 (= c!78671 (= k0!2824 (h!14322 newAcc!49)))))

(declare-fun d!97287 () Bool)

(declare-fun e!399489 () Bool)

(assert (=> d!97287 e!399489))

(declare-fun res!473174 () Bool)

(assert (=> d!97287 (=> (not res!473174) (not e!399489))))

(declare-fun lt!318351 () List!13278)

(declare-fun size!19728 (List!13278) Int)

(assert (=> d!97287 (= res!473174 (<= (size!19728 lt!318351) (size!19728 newAcc!49)))))

(assert (=> d!97287 (= lt!318351 e!399488)))

(declare-fun c!78670 () Bool)

(assert (=> d!97287 (= c!78670 ((_ is Cons!13274) newAcc!49))))

(assert (=> d!97287 (= (-!362 newAcc!49 k0!2824) lt!318351)))

(declare-fun b!709780 () Bool)

(assert (=> b!709780 (= e!399487 (Cons!13274 (h!14322 newAcc!49) call!34449))))

(declare-fun b!709781 () Bool)

(assert (=> b!709781 (= e!399489 (= (content!344 lt!318351) ((_ map and) (content!344 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun bm!34446 () Bool)

(assert (=> bm!34446 (= call!34449 (-!362 (t!19564 newAcc!49) k0!2824))))

(assert (= (and d!97287 c!78670) b!709779))

(assert (= (and d!97287 (not c!78670)) b!709778))

(assert (= (and b!709779 c!78671) b!709777))

(assert (= (and b!709779 (not c!78671)) b!709780))

(assert (= (or b!709777 b!709780) bm!34446))

(assert (= (and d!97287 res!473174) b!709781))

(declare-fun m!667593 () Bool)

(assert (=> d!97287 m!667593))

(declare-fun m!667595 () Bool)

(assert (=> d!97287 m!667595))

(declare-fun m!667597 () Bool)

(assert (=> b!709781 m!667597))

(assert (=> b!709781 m!667443))

(declare-fun m!667599 () Bool)

(assert (=> b!709781 m!667599))

(declare-fun m!667601 () Bool)

(assert (=> bm!34446 m!667601))

(assert (=> b!709492 d!97287))

(declare-fun d!97311 () Bool)

(declare-fun res!473177 () Bool)

(declare-fun e!399492 () Bool)

(assert (=> d!97311 (=> res!473177 e!399492)))

(assert (=> d!97311 (= res!473177 (= (select (arr!19330 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97311 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399492)))

(declare-fun b!709784 () Bool)

(declare-fun e!399493 () Bool)

(assert (=> b!709784 (= e!399492 e!399493)))

(declare-fun res!473178 () Bool)

(assert (=> b!709784 (=> (not res!473178) (not e!399493))))

(assert (=> b!709784 (= res!473178 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19725 a!3591)))))

(declare-fun b!709785 () Bool)

(assert (=> b!709785 (= e!399493 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97311 (not res!473177)) b!709784))

(assert (= (and b!709784 res!473178) b!709785))

(declare-fun m!667607 () Bool)

(assert (=> d!97311 m!667607))

(declare-fun m!667609 () Bool)

(assert (=> b!709785 m!667609))

(assert (=> b!709481 d!97311))

(declare-fun d!97317 () Bool)

(declare-fun res!473181 () Bool)

(declare-fun e!399496 () Bool)

(assert (=> d!97317 (=> res!473181 e!399496)))

(assert (=> d!97317 (= res!473181 ((_ is Nil!13275) ($colon$colon!506 newAcc!49 (select (arr!19330 a!3591) from!2969))))))

(assert (=> d!97317 (= (noDuplicate!1204 ($colon$colon!506 newAcc!49 (select (arr!19330 a!3591) from!2969))) e!399496)))

(declare-fun b!709788 () Bool)

(declare-fun e!399497 () Bool)

(assert (=> b!709788 (= e!399496 e!399497)))

(declare-fun res!473182 () Bool)

(assert (=> b!709788 (=> (not res!473182) (not e!399497))))

(assert (=> b!709788 (= res!473182 (not (contains!3930 (t!19564 ($colon$colon!506 newAcc!49 (select (arr!19330 a!3591) from!2969))) (h!14322 ($colon$colon!506 newAcc!49 (select (arr!19330 a!3591) from!2969))))))))

(declare-fun b!709789 () Bool)

(assert (=> b!709789 (= e!399497 (noDuplicate!1204 (t!19564 ($colon$colon!506 newAcc!49 (select (arr!19330 a!3591) from!2969)))))))

(assert (= (and d!97317 (not res!473181)) b!709788))

(assert (= (and b!709788 res!473182) b!709789))

(declare-fun m!667615 () Bool)

(assert (=> b!709788 m!667615))

(declare-fun m!667617 () Bool)

(assert (=> b!709789 m!667617))

(assert (=> b!709491 d!97317))

(declare-fun d!97321 () Bool)

(assert (=> d!97321 (= ($colon$colon!506 newAcc!49 (select (arr!19330 a!3591) from!2969)) (Cons!13274 (select (arr!19330 a!3591) from!2969) newAcc!49))))

(assert (=> b!709491 d!97321))

(declare-fun d!97325 () Bool)

(declare-fun lt!318353 () Bool)

(assert (=> d!97325 (= lt!318353 (select (content!344 lt!318315) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399508 () Bool)

(assert (=> d!97325 (= lt!318353 e!399508)))

(declare-fun res!473193 () Bool)

(assert (=> d!97325 (=> (not res!473193) (not e!399508))))

(assert (=> d!97325 (= res!473193 ((_ is Cons!13274) lt!318315))))

(assert (=> d!97325 (= (contains!3930 lt!318315 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318353)))

(declare-fun b!709800 () Bool)

(declare-fun e!399509 () Bool)

(assert (=> b!709800 (= e!399508 e!399509)))

(declare-fun res!473194 () Bool)

(assert (=> b!709800 (=> res!473194 e!399509)))

(assert (=> b!709800 (= res!473194 (= (h!14322 lt!318315) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709801 () Bool)

(assert (=> b!709801 (= e!399509 (contains!3930 (t!19564 lt!318315) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97325 res!473193) b!709800))

(assert (= (and b!709800 (not res!473194)) b!709801))

(assert (=> d!97325 m!667449))

(declare-fun m!667623 () Bool)

(assert (=> d!97325 m!667623))

(declare-fun m!667625 () Bool)

(assert (=> b!709801 m!667625))

(assert (=> b!709480 d!97325))

(declare-fun d!97327 () Bool)

(assert (=> d!97327 (= ($colon$colon!506 acc!652 (select (arr!19330 a!3591) from!2969)) (Cons!13274 (select (arr!19330 a!3591) from!2969) acc!652))))

(assert (=> b!709479 d!97327))

(declare-fun d!97329 () Bool)

(assert (=> d!97329 (= (validKeyInArray!0 (select (arr!19330 a!3591) from!2969)) (and (not (= (select (arr!19330 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19330 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709489 d!97329))

(declare-fun d!97331 () Bool)

(declare-fun lt!318354 () Bool)

(assert (=> d!97331 (= lt!318354 (select (content!344 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399510 () Bool)

(assert (=> d!97331 (= lt!318354 e!399510)))

(declare-fun res!473195 () Bool)

(assert (=> d!97331 (=> (not res!473195) (not e!399510))))

(assert (=> d!97331 (= res!473195 ((_ is Cons!13274) acc!652))))

(assert (=> d!97331 (= (contains!3930 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318354)))

(declare-fun b!709802 () Bool)

(declare-fun e!399511 () Bool)

(assert (=> b!709802 (= e!399510 e!399511)))

(declare-fun res!473196 () Bool)

(assert (=> b!709802 (=> res!473196 e!399511)))

(assert (=> b!709802 (= res!473196 (= (h!14322 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709803 () Bool)

(assert (=> b!709803 (= e!399511 (contains!3930 (t!19564 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97331 res!473195) b!709802))

(assert (= (and b!709802 (not res!473196)) b!709803))

(assert (=> d!97331 m!667455))

(declare-fun m!667627 () Bool)

(assert (=> d!97331 m!667627))

(declare-fun m!667629 () Bool)

(assert (=> b!709803 m!667629))

(assert (=> b!709478 d!97331))

(check-sat (not b!709716) (not b!709728) (not b!709647) (not b!709781) (not b!709727) (not b!709803) (not b!709789) (not d!97229) (not b!709650) (not b!709801) (not d!97287) (not b!709632) (not b!709634) (not bm!34446) (not b!709723) (not d!97231) (not d!97233) (not b!709630) (not bm!34440) (not d!97331) (not d!97279) (not b!709788) (not b!709717) (not b!709642) (not d!97325) (not d!97235) (not b!709726) (not b!709674) (not b!709648) (not b!709725) (not d!97243) (not b!709729) (not b!709785) (not b!709636) (not d!97281) (not b!709671) (not b!709673))
(check-sat)
