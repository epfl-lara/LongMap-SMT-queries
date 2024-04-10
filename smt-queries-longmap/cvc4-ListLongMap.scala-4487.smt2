; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62394 () Bool)

(assert start!62394)

(declare-fun b!699534 () Bool)

(declare-fun res!463361 () Bool)

(declare-fun e!397195 () Bool)

(assert (=> b!699534 (=> (not res!463361) (not e!397195))))

(declare-datatypes ((List!13234 0))(
  ( (Nil!13231) (Cons!13230 (h!14275 (_ BitVec 64)) (t!19516 List!13234)) )
))
(declare-fun acc!652 () List!13234)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3811 (List!13234 (_ BitVec 64)) Bool)

(assert (=> b!699534 (= res!463361 (not (contains!3811 acc!652 k!2824)))))

(declare-fun b!699535 () Bool)

(declare-fun res!463355 () Bool)

(declare-fun e!397194 () Bool)

(assert (=> b!699535 (=> (not res!463355) (not e!397194))))

(declare-fun lt!317390 () List!13234)

(assert (=> b!699535 (= res!463355 (not (contains!3811 lt!317390 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699536 () Bool)

(declare-fun res!463369 () Bool)

(assert (=> b!699536 (=> (not res!463369) (not e!397195))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40073 0))(
  ( (array!40074 (arr!19193 (Array (_ BitVec 32) (_ BitVec 64))) (size!19578 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40073)

(assert (=> b!699536 (= res!463369 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19578 a!3591)))))

(declare-fun b!699537 () Bool)

(declare-fun res!463353 () Bool)

(assert (=> b!699537 (=> (not res!463353) (not e!397194))))

(declare-fun lt!317389 () List!13234)

(declare-fun -!221 (List!13234 (_ BitVec 64)) List!13234)

(assert (=> b!699537 (= res!463353 (= (-!221 lt!317390 k!2824) lt!317389))))

(declare-fun b!699538 () Bool)

(declare-fun res!463344 () Bool)

(assert (=> b!699538 (=> (not res!463344) (not e!397195))))

(declare-fun newAcc!49 () List!13234)

(assert (=> b!699538 (= res!463344 (contains!3811 newAcc!49 k!2824))))

(declare-fun b!699539 () Bool)

(declare-fun res!463368 () Bool)

(assert (=> b!699539 (=> (not res!463368) (not e!397195))))

(declare-fun subseq!256 (List!13234 List!13234) Bool)

(assert (=> b!699539 (= res!463368 (subseq!256 acc!652 newAcc!49))))

(declare-fun b!699540 () Bool)

(declare-fun res!463346 () Bool)

(assert (=> b!699540 (=> (not res!463346) (not e!397195))))

(declare-fun noDuplicate!1058 (List!13234) Bool)

(assert (=> b!699540 (= res!463346 (noDuplicate!1058 acc!652))))

(declare-fun b!699541 () Bool)

(declare-fun res!463362 () Bool)

(assert (=> b!699541 (=> (not res!463362) (not e!397195))))

(declare-fun arrayContainsKey!0 (array!40073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!699541 (= res!463362 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!699542 () Bool)

(declare-fun res!463364 () Bool)

(assert (=> b!699542 (=> (not res!463364) (not e!397195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!699542 (= res!463364 (validKeyInArray!0 (select (arr!19193 a!3591) from!2969)))))

(declare-fun b!699543 () Bool)

(declare-fun res!463367 () Bool)

(assert (=> b!699543 (=> (not res!463367) (not e!397195))))

(assert (=> b!699543 (= res!463367 (validKeyInArray!0 k!2824))))

(declare-fun b!699544 () Bool)

(declare-fun res!463357 () Bool)

(assert (=> b!699544 (=> (not res!463357) (not e!397194))))

(assert (=> b!699544 (= res!463357 (not (contains!3811 lt!317389 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699545 () Bool)

(assert (=> b!699545 (= e!397194 false)))

(declare-fun lt!317391 () Bool)

(assert (=> b!699545 (= lt!317391 (contains!3811 lt!317390 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!699546 () Bool)

(declare-fun res!463347 () Bool)

(assert (=> b!699546 (=> (not res!463347) (not e!397195))))

(assert (=> b!699546 (= res!463347 (not (contains!3811 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699547 () Bool)

(declare-fun res!463352 () Bool)

(assert (=> b!699547 (=> (not res!463352) (not e!397194))))

(assert (=> b!699547 (= res!463352 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!699548 () Bool)

(declare-fun res!463365 () Bool)

(assert (=> b!699548 (=> (not res!463365) (not e!397195))))

(assert (=> b!699548 (= res!463365 (not (contains!3811 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699549 () Bool)

(declare-fun res!463350 () Bool)

(assert (=> b!699549 (=> (not res!463350) (not e!397194))))

(assert (=> b!699549 (= res!463350 (contains!3811 lt!317390 k!2824))))

(declare-fun b!699550 () Bool)

(declare-fun res!463351 () Bool)

(assert (=> b!699550 (=> (not res!463351) (not e!397194))))

(assert (=> b!699550 (= res!463351 (noDuplicate!1058 lt!317389))))

(declare-fun b!699551 () Bool)

(declare-fun res!463349 () Bool)

(assert (=> b!699551 (=> (not res!463349) (not e!397194))))

(assert (=> b!699551 (= res!463349 (subseq!256 lt!317389 lt!317390))))

(declare-fun b!699552 () Bool)

(declare-fun res!463370 () Bool)

(assert (=> b!699552 (=> (not res!463370) (not e!397195))))

(assert (=> b!699552 (= res!463370 (noDuplicate!1058 newAcc!49))))

(declare-fun b!699553 () Bool)

(declare-fun res!463345 () Bool)

(assert (=> b!699553 (=> (not res!463345) (not e!397194))))

(assert (=> b!699553 (= res!463345 (noDuplicate!1058 lt!317390))))

(declare-fun b!699554 () Bool)

(declare-fun res!463363 () Bool)

(assert (=> b!699554 (=> (not res!463363) (not e!397194))))

(assert (=> b!699554 (= res!463363 (not (contains!3811 lt!317389 k!2824)))))

(declare-fun res!463360 () Bool)

(assert (=> start!62394 (=> (not res!463360) (not e!397195))))

(assert (=> start!62394 (= res!463360 (and (bvslt (size!19578 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19578 a!3591))))))

(assert (=> start!62394 e!397195))

(assert (=> start!62394 true))

(declare-fun array_inv!14989 (array!40073) Bool)

(assert (=> start!62394 (array_inv!14989 a!3591)))

(declare-fun b!699555 () Bool)

(declare-fun res!463356 () Bool)

(assert (=> b!699555 (=> (not res!463356) (not e!397195))))

(assert (=> b!699555 (= res!463356 (not (contains!3811 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699556 () Bool)

(declare-fun res!463366 () Bool)

(assert (=> b!699556 (=> (not res!463366) (not e!397195))))

(assert (=> b!699556 (= res!463366 (not (contains!3811 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699557 () Bool)

(declare-fun res!463354 () Bool)

(assert (=> b!699557 (=> (not res!463354) (not e!397194))))

(declare-fun arrayNoDuplicates!0 (array!40073 (_ BitVec 32) List!13234) Bool)

(assert (=> b!699557 (= res!463354 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317389))))

(declare-fun b!699558 () Bool)

(declare-fun res!463348 () Bool)

(assert (=> b!699558 (=> (not res!463348) (not e!397195))))

(assert (=> b!699558 (= res!463348 (= (-!221 newAcc!49 k!2824) acc!652))))

(declare-fun b!699559 () Bool)

(assert (=> b!699559 (= e!397195 e!397194)))

(declare-fun res!463359 () Bool)

(assert (=> b!699559 (=> (not res!463359) (not e!397194))))

(assert (=> b!699559 (= res!463359 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!454 (List!13234 (_ BitVec 64)) List!13234)

(assert (=> b!699559 (= lt!317390 ($colon$colon!454 newAcc!49 (select (arr!19193 a!3591) from!2969)))))

(assert (=> b!699559 (= lt!317389 ($colon$colon!454 acc!652 (select (arr!19193 a!3591) from!2969)))))

(declare-fun b!699560 () Bool)

(declare-fun res!463358 () Bool)

(assert (=> b!699560 (=> (not res!463358) (not e!397194))))

(assert (=> b!699560 (= res!463358 (not (contains!3811 lt!317389 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699561 () Bool)

(declare-fun res!463371 () Bool)

(assert (=> b!699561 (=> (not res!463371) (not e!397195))))

(assert (=> b!699561 (= res!463371 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62394 res!463360) b!699540))

(assert (= (and b!699540 res!463346) b!699552))

(assert (= (and b!699552 res!463370) b!699546))

(assert (= (and b!699546 res!463347) b!699555))

(assert (= (and b!699555 res!463356) b!699541))

(assert (= (and b!699541 res!463362) b!699534))

(assert (= (and b!699534 res!463361) b!699543))

(assert (= (and b!699543 res!463367) b!699561))

(assert (= (and b!699561 res!463371) b!699539))

(assert (= (and b!699539 res!463368) b!699538))

(assert (= (and b!699538 res!463344) b!699558))

(assert (= (and b!699558 res!463348) b!699556))

(assert (= (and b!699556 res!463366) b!699548))

(assert (= (and b!699548 res!463365) b!699536))

(assert (= (and b!699536 res!463369) b!699542))

(assert (= (and b!699542 res!463364) b!699559))

(assert (= (and b!699559 res!463359) b!699550))

(assert (= (and b!699550 res!463351) b!699553))

(assert (= (and b!699553 res!463345) b!699544))

(assert (= (and b!699544 res!463357) b!699560))

(assert (= (and b!699560 res!463358) b!699547))

(assert (= (and b!699547 res!463352) b!699554))

(assert (= (and b!699554 res!463363) b!699557))

(assert (= (and b!699557 res!463354) b!699551))

(assert (= (and b!699551 res!463349) b!699549))

(assert (= (and b!699549 res!463350) b!699537))

(assert (= (and b!699537 res!463353) b!699535))

(assert (= (and b!699535 res!463355) b!699545))

(declare-fun m!659455 () Bool)

(assert (=> b!699545 m!659455))

(declare-fun m!659457 () Bool)

(assert (=> b!699541 m!659457))

(declare-fun m!659459 () Bool)

(assert (=> b!699534 m!659459))

(declare-fun m!659461 () Bool)

(assert (=> b!699555 m!659461))

(declare-fun m!659463 () Bool)

(assert (=> b!699561 m!659463))

(declare-fun m!659465 () Bool)

(assert (=> b!699552 m!659465))

(declare-fun m!659467 () Bool)

(assert (=> start!62394 m!659467))

(declare-fun m!659469 () Bool)

(assert (=> b!699539 m!659469))

(declare-fun m!659471 () Bool)

(assert (=> b!699559 m!659471))

(assert (=> b!699559 m!659471))

(declare-fun m!659473 () Bool)

(assert (=> b!699559 m!659473))

(assert (=> b!699559 m!659471))

(declare-fun m!659475 () Bool)

(assert (=> b!699559 m!659475))

(declare-fun m!659477 () Bool)

(assert (=> b!699538 m!659477))

(declare-fun m!659479 () Bool)

(assert (=> b!699558 m!659479))

(declare-fun m!659481 () Bool)

(assert (=> b!699550 m!659481))

(declare-fun m!659483 () Bool)

(assert (=> b!699549 m!659483))

(declare-fun m!659485 () Bool)

(assert (=> b!699547 m!659485))

(assert (=> b!699542 m!659471))

(assert (=> b!699542 m!659471))

(declare-fun m!659487 () Bool)

(assert (=> b!699542 m!659487))

(declare-fun m!659489 () Bool)

(assert (=> b!699543 m!659489))

(declare-fun m!659491 () Bool)

(assert (=> b!699551 m!659491))

(declare-fun m!659493 () Bool)

(assert (=> b!699540 m!659493))

(declare-fun m!659495 () Bool)

(assert (=> b!699553 m!659495))

(declare-fun m!659497 () Bool)

(assert (=> b!699546 m!659497))

(declare-fun m!659499 () Bool)

(assert (=> b!699544 m!659499))

(declare-fun m!659501 () Bool)

(assert (=> b!699535 m!659501))

(declare-fun m!659503 () Bool)

(assert (=> b!699556 m!659503))

(declare-fun m!659505 () Bool)

(assert (=> b!699548 m!659505))

(declare-fun m!659507 () Bool)

(assert (=> b!699560 m!659507))

(declare-fun m!659509 () Bool)

(assert (=> b!699554 m!659509))

(declare-fun m!659511 () Bool)

(assert (=> b!699557 m!659511))

(declare-fun m!659513 () Bool)

(assert (=> b!699537 m!659513))

(push 1)

