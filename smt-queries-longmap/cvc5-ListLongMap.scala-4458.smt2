; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62042 () Bool)

(assert start!62042)

(declare-fun b!694461 () Bool)

(declare-fun res!458505 () Bool)

(declare-fun e!395050 () Bool)

(assert (=> b!694461 (=> (not res!458505) (not e!395050))))

(declare-datatypes ((List!13145 0))(
  ( (Nil!13142) (Cons!13141 (h!14186 (_ BitVec 64)) (t!19424 List!13145)) )
))
(declare-fun lt!316907 () List!13145)

(declare-fun contains!3722 (List!13145 (_ BitVec 64)) Bool)

(assert (=> b!694461 (= res!458505 (not (contains!3722 lt!316907 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694462 () Bool)

(declare-fun res!458525 () Bool)

(assert (=> b!694462 (=> (not res!458525) (not e!395050))))

(declare-fun e!395043 () Bool)

(assert (=> b!694462 (= res!458525 e!395043)))

(declare-fun res!458511 () Bool)

(assert (=> b!694462 (=> res!458511 e!395043)))

(declare-fun e!395044 () Bool)

(assert (=> b!694462 (= res!458511 e!395044)))

(declare-fun res!458520 () Bool)

(assert (=> b!694462 (=> (not res!458520) (not e!395044))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694462 (= res!458520 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694463 () Bool)

(declare-fun e!395042 () Bool)

(declare-fun e!395049 () Bool)

(assert (=> b!694463 (= e!395042 e!395049)))

(declare-fun res!458516 () Bool)

(assert (=> b!694463 (=> (not res!458516) (not e!395049))))

(assert (=> b!694463 (= res!458516 (bvsle from!3004 i!1382))))

(declare-fun b!694464 () Bool)

(declare-fun res!458524 () Bool)

(declare-fun e!395047 () Bool)

(assert (=> b!694464 (=> (not res!458524) (not e!395047))))

(declare-fun acc!681 () List!13145)

(assert (=> b!694464 (= res!458524 (not (contains!3722 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694465 () Bool)

(declare-fun res!458515 () Bool)

(assert (=> b!694465 (=> (not res!458515) (not e!395047))))

(declare-datatypes ((array!39883 0))(
  ( (array!39884 (arr!19104 (Array (_ BitVec 32) (_ BitVec 64))) (size!19489 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39883)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694465 (= res!458515 (validKeyInArray!0 (select (arr!19104 a!3626) from!3004)))))

(declare-fun b!694466 () Bool)

(declare-fun res!458514 () Bool)

(assert (=> b!694466 (=> (not res!458514) (not e!395047))))

(assert (=> b!694466 (= res!458514 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19489 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694468 () Bool)

(declare-fun res!458501 () Bool)

(assert (=> b!694468 (=> (not res!458501) (not e!395047))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694468 (= res!458501 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694469 () Bool)

(declare-fun e!395051 () Bool)

(assert (=> b!694469 (= e!395051 e!395050)))

(declare-fun res!458521 () Bool)

(assert (=> b!694469 (=> (not res!458521) (not e!395050))))

(assert (=> b!694469 (= res!458521 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!434 (List!13145 (_ BitVec 64)) List!13145)

(assert (=> b!694469 (= lt!316907 ($colon$colon!434 acc!681 (select (arr!19104 a!3626) from!3004)))))

(declare-fun b!694470 () Bool)

(declare-fun res!458503 () Bool)

(assert (=> b!694470 (=> (not res!458503) (not e!395047))))

(declare-fun arrayNoDuplicates!0 (array!39883 (_ BitVec 32) List!13145) Bool)

(assert (=> b!694470 (= res!458503 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694471 () Bool)

(declare-fun res!458508 () Bool)

(assert (=> b!694471 (=> (not res!458508) (not e!395047))))

(assert (=> b!694471 (= res!458508 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19489 a!3626))))))

(declare-fun b!694472 () Bool)

(declare-fun res!458523 () Bool)

(assert (=> b!694472 (=> (not res!458523) (not e!395047))))

(declare-fun noDuplicate!969 (List!13145) Bool)

(assert (=> b!694472 (= res!458523 (noDuplicate!969 acc!681))))

(declare-fun b!694473 () Bool)

(assert (=> b!694473 (= e!395050 (bvsge (bvsub (size!19489 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19489 a!3626) from!3004)))))

(declare-fun b!694474 () Bool)

(declare-fun res!458506 () Bool)

(assert (=> b!694474 (=> (not res!458506) (not e!395047))))

(assert (=> b!694474 (= res!458506 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13142))))

(declare-fun b!694475 () Bool)

(declare-fun res!458509 () Bool)

(assert (=> b!694475 (=> (not res!458509) (not e!395047))))

(assert (=> b!694475 (= res!458509 (validKeyInArray!0 k!2843))))

(declare-fun b!694476 () Bool)

(declare-fun e!395052 () Bool)

(assert (=> b!694476 (= e!395043 e!395052)))

(declare-fun res!458519 () Bool)

(assert (=> b!694476 (=> (not res!458519) (not e!395052))))

(assert (=> b!694476 (= res!458519 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694477 () Bool)

(assert (=> b!694477 (= e!395052 (not (contains!3722 lt!316907 k!2843)))))

(declare-fun b!694478 () Bool)

(declare-fun e!395048 () Bool)

(assert (=> b!694478 (= e!395048 (contains!3722 acc!681 k!2843))))

(declare-fun b!694479 () Bool)

(declare-fun res!458510 () Bool)

(assert (=> b!694479 (=> (not res!458510) (not e!395050))))

(assert (=> b!694479 (= res!458510 (noDuplicate!969 lt!316907))))

(declare-fun b!694480 () Bool)

(declare-fun res!458513 () Bool)

(assert (=> b!694480 (=> (not res!458513) (not e!395047))))

(assert (=> b!694480 (= res!458513 e!395042)))

(declare-fun res!458502 () Bool)

(assert (=> b!694480 (=> res!458502 e!395042)))

(assert (=> b!694480 (= res!458502 e!395048)))

(declare-fun res!458518 () Bool)

(assert (=> b!694480 (=> (not res!458518) (not e!395048))))

(assert (=> b!694480 (= res!458518 (bvsgt from!3004 i!1382))))

(declare-fun b!694481 () Bool)

(declare-fun res!458512 () Bool)

(assert (=> b!694481 (=> (not res!458512) (not e!395050))))

(assert (=> b!694481 (= res!458512 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316907))))

(declare-fun b!694482 () Bool)

(declare-datatypes ((Unit!24534 0))(
  ( (Unit!24535) )
))
(declare-fun e!395045 () Unit!24534)

(declare-fun Unit!24536 () Unit!24534)

(assert (=> b!694482 (= e!395045 Unit!24536)))

(assert (=> b!694482 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316909 () Unit!24534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39883 (_ BitVec 64) (_ BitVec 32)) Unit!24534)

(assert (=> b!694482 (= lt!316909 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!694482 false))

(declare-fun b!694483 () Bool)

(declare-fun res!458507 () Bool)

(assert (=> b!694483 (=> (not res!458507) (not e!395050))))

(assert (=> b!694483 (= res!458507 (not (contains!3722 lt!316907 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694467 () Bool)

(declare-fun Unit!24537 () Unit!24534)

(assert (=> b!694467 (= e!395045 Unit!24537)))

(declare-fun res!458504 () Bool)

(assert (=> start!62042 (=> (not res!458504) (not e!395047))))

(assert (=> start!62042 (= res!458504 (and (bvslt (size!19489 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19489 a!3626))))))

(assert (=> start!62042 e!395047))

(assert (=> start!62042 true))

(declare-fun array_inv!14900 (array!39883) Bool)

(assert (=> start!62042 (array_inv!14900 a!3626)))

(declare-fun b!694484 () Bool)

(assert (=> b!694484 (= e!395047 e!395051)))

(declare-fun res!458522 () Bool)

(assert (=> b!694484 (=> (not res!458522) (not e!395051))))

(assert (=> b!694484 (= res!458522 (not (= (select (arr!19104 a!3626) from!3004) k!2843)))))

(declare-fun lt!316908 () Unit!24534)

(assert (=> b!694484 (= lt!316908 e!395045)))

(declare-fun c!78347 () Bool)

(assert (=> b!694484 (= c!78347 (= (select (arr!19104 a!3626) from!3004) k!2843))))

(declare-fun b!694485 () Bool)

(assert (=> b!694485 (= e!395049 (not (contains!3722 acc!681 k!2843)))))

(declare-fun b!694486 () Bool)

(declare-fun res!458517 () Bool)

(assert (=> b!694486 (=> (not res!458517) (not e!395047))))

(assert (=> b!694486 (= res!458517 (not (contains!3722 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694487 () Bool)

(assert (=> b!694487 (= e!395044 (contains!3722 lt!316907 k!2843))))

(assert (= (and start!62042 res!458504) b!694472))

(assert (= (and b!694472 res!458523) b!694486))

(assert (= (and b!694486 res!458517) b!694464))

(assert (= (and b!694464 res!458524) b!694480))

(assert (= (and b!694480 res!458518) b!694478))

(assert (= (and b!694480 (not res!458502)) b!694463))

(assert (= (and b!694463 res!458516) b!694485))

(assert (= (and b!694480 res!458513) b!694474))

(assert (= (and b!694474 res!458506) b!694470))

(assert (= (and b!694470 res!458503) b!694471))

(assert (= (and b!694471 res!458508) b!694475))

(assert (= (and b!694475 res!458509) b!694468))

(assert (= (and b!694468 res!458501) b!694466))

(assert (= (and b!694466 res!458514) b!694465))

(assert (= (and b!694465 res!458515) b!694484))

(assert (= (and b!694484 c!78347) b!694482))

(assert (= (and b!694484 (not c!78347)) b!694467))

(assert (= (and b!694484 res!458522) b!694469))

(assert (= (and b!694469 res!458521) b!694479))

(assert (= (and b!694479 res!458510) b!694483))

(assert (= (and b!694483 res!458507) b!694461))

(assert (= (and b!694461 res!458505) b!694462))

(assert (= (and b!694462 res!458520) b!694487))

(assert (= (and b!694462 (not res!458511)) b!694476))

(assert (= (and b!694476 res!458519) b!694477))

(assert (= (and b!694462 res!458525) b!694481))

(assert (= (and b!694481 res!458512) b!694473))

(declare-fun m!656279 () Bool)

(assert (=> start!62042 m!656279))

(declare-fun m!656281 () Bool)

(assert (=> b!694464 m!656281))

(declare-fun m!656283 () Bool)

(assert (=> b!694482 m!656283))

(declare-fun m!656285 () Bool)

(assert (=> b!694482 m!656285))

(declare-fun m!656287 () Bool)

(assert (=> b!694479 m!656287))

(declare-fun m!656289 () Bool)

(assert (=> b!694468 m!656289))

(declare-fun m!656291 () Bool)

(assert (=> b!694486 m!656291))

(declare-fun m!656293 () Bool)

(assert (=> b!694469 m!656293))

(assert (=> b!694469 m!656293))

(declare-fun m!656295 () Bool)

(assert (=> b!694469 m!656295))

(declare-fun m!656297 () Bool)

(assert (=> b!694485 m!656297))

(declare-fun m!656299 () Bool)

(assert (=> b!694474 m!656299))

(assert (=> b!694484 m!656293))

(assert (=> b!694465 m!656293))

(assert (=> b!694465 m!656293))

(declare-fun m!656301 () Bool)

(assert (=> b!694465 m!656301))

(declare-fun m!656303 () Bool)

(assert (=> b!694472 m!656303))

(declare-fun m!656305 () Bool)

(assert (=> b!694475 m!656305))

(declare-fun m!656307 () Bool)

(assert (=> b!694470 m!656307))

(declare-fun m!656309 () Bool)

(assert (=> b!694487 m!656309))

(declare-fun m!656311 () Bool)

(assert (=> b!694483 m!656311))

(declare-fun m!656313 () Bool)

(assert (=> b!694481 m!656313))

(assert (=> b!694477 m!656309))

(declare-fun m!656315 () Bool)

(assert (=> b!694461 m!656315))

(assert (=> b!694478 m!656297))

(push 1)

(assert (not b!694464))

(assert (not b!694478))

(assert (not b!694472))

(assert (not b!694486))

(assert (not b!694482))

(assert (not b!694475))

(assert (not b!694477))

(assert (not b!694474))

(assert (not b!694487))

(assert (not b!694468))

(assert (not b!694461))

(assert (not b!694485))

(assert (not b!694469))

(assert (not start!62042))

(assert (not b!694479))

(assert (not b!694481))

(assert (not b!694465))

(assert (not b!694470))

(assert (not b!694483))

(check-sat)

(pop 1)

(push 1)

(check-sat)

