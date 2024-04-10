; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63268 () Bool)

(assert start!63268)

(declare-fun b!712449 () Bool)

(declare-fun res!475642 () Bool)

(declare-fun e!400876 () Bool)

(assert (=> b!712449 (=> (not res!475642) (not e!400876))))

(declare-datatypes ((List!13397 0))(
  ( (Nil!13394) (Cons!13393 (h!14438 (_ BitVec 64)) (t!19709 List!13397)) )
))
(declare-fun acc!652 () List!13397)

(declare-fun newAcc!49 () List!13397)

(declare-fun subseq!419 (List!13397 List!13397) Bool)

(assert (=> b!712449 (= res!475642 (subseq!419 acc!652 newAcc!49))))

(declare-fun b!712450 () Bool)

(declare-fun res!475626 () Bool)

(assert (=> b!712450 (=> (not res!475626) (not e!400876))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3974 (List!13397 (_ BitVec 64)) Bool)

(assert (=> b!712450 (= res!475626 (not (contains!3974 acc!652 k!2824)))))

(declare-fun b!712451 () Bool)

(declare-fun res!475633 () Bool)

(assert (=> b!712451 (=> (not res!475633) (not e!400876))))

(assert (=> b!712451 (= res!475633 (not (contains!3974 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712452 () Bool)

(declare-fun res!475635 () Bool)

(assert (=> b!712452 (=> (not res!475635) (not e!400876))))

(declare-fun noDuplicate!1221 (List!13397) Bool)

(assert (=> b!712452 (= res!475635 (noDuplicate!1221 newAcc!49))))

(declare-fun b!712453 () Bool)

(declare-fun res!475634 () Bool)

(declare-fun e!400875 () Bool)

(assert (=> b!712453 (=> (not res!475634) (not e!400875))))

(declare-fun lt!318584 () List!13397)

(assert (=> b!712453 (= res!475634 (noDuplicate!1221 lt!318584))))

(declare-fun b!712454 () Bool)

(declare-fun res!475632 () Bool)

(assert (=> b!712454 (=> (not res!475632) (not e!400876))))

(assert (=> b!712454 (= res!475632 (noDuplicate!1221 acc!652))))

(declare-fun b!712455 () Bool)

(declare-fun res!475627 () Bool)

(assert (=> b!712455 (=> (not res!475627) (not e!400875))))

(declare-datatypes ((array!40429 0))(
  ( (array!40430 (arr!19356 (Array (_ BitVec 32) (_ BitVec 64))) (size!19764 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40429)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40429 (_ BitVec 32) List!13397) Bool)

(assert (=> b!712455 (= res!475627 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318584))))

(declare-fun b!712456 () Bool)

(declare-fun res!475638 () Bool)

(assert (=> b!712456 (=> (not res!475638) (not e!400875))))

(declare-fun lt!318583 () List!13397)

(assert (=> b!712456 (= res!475638 (subseq!419 lt!318584 lt!318583))))

(declare-fun b!712457 () Bool)

(declare-fun res!475640 () Bool)

(assert (=> b!712457 (=> (not res!475640) (not e!400875))))

(assert (=> b!712457 (= res!475640 (not (contains!3974 lt!318584 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712458 () Bool)

(declare-fun res!475631 () Bool)

(assert (=> b!712458 (=> (not res!475631) (not e!400875))))

(assert (=> b!712458 (= res!475631 (not (contains!3974 lt!318584 k!2824)))))

(declare-fun b!712459 () Bool)

(declare-fun res!475628 () Bool)

(assert (=> b!712459 (=> (not res!475628) (not e!400876))))

(assert (=> b!712459 (= res!475628 (contains!3974 newAcc!49 k!2824))))

(declare-fun b!712460 () Bool)

(declare-fun res!475623 () Bool)

(assert (=> b!712460 (=> (not res!475623) (not e!400875))))

(assert (=> b!712460 (= res!475623 (not (contains!3974 lt!318584 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712461 () Bool)

(declare-fun res!475641 () Bool)

(assert (=> b!712461 (=> (not res!475641) (not e!400876))))

(assert (=> b!712461 (= res!475641 (not (contains!3974 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712462 () Bool)

(declare-fun res!475622 () Bool)

(assert (=> b!712462 (=> (not res!475622) (not e!400876))))

(assert (=> b!712462 (= res!475622 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19764 a!3591)))))

(declare-fun b!712463 () Bool)

(declare-fun res!475619 () Bool)

(assert (=> b!712463 (=> (not res!475619) (not e!400876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712463 (= res!475619 (validKeyInArray!0 (select (arr!19356 a!3591) from!2969)))))

(declare-fun b!712464 () Bool)

(declare-fun res!475625 () Bool)

(assert (=> b!712464 (=> (not res!475625) (not e!400875))))

(declare-fun arrayContainsKey!0 (array!40429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712464 (= res!475625 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712465 () Bool)

(declare-fun res!475630 () Bool)

(assert (=> b!712465 (=> (not res!475630) (not e!400876))))

(assert (=> b!712465 (= res!475630 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!712466 () Bool)

(declare-fun res!475644 () Bool)

(assert (=> b!712466 (=> (not res!475644) (not e!400876))))

(declare-fun -!384 (List!13397 (_ BitVec 64)) List!13397)

(assert (=> b!712466 (= res!475644 (= (-!384 newAcc!49 k!2824) acc!652))))

(declare-fun b!712467 () Bool)

(declare-fun res!475617 () Bool)

(assert (=> b!712467 (=> (not res!475617) (not e!400876))))

(assert (=> b!712467 (= res!475617 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712468 () Bool)

(declare-fun res!475639 () Bool)

(assert (=> b!712468 (=> (not res!475639) (not e!400875))))

(assert (=> b!712468 (= res!475639 (= (-!384 lt!318583 k!2824) lt!318584))))

(declare-fun b!712469 () Bool)

(declare-fun res!475637 () Bool)

(assert (=> b!712469 (=> (not res!475637) (not e!400876))))

(assert (=> b!712469 (= res!475637 (validKeyInArray!0 k!2824))))

(declare-fun b!712470 () Bool)

(assert (=> b!712470 (= e!400876 e!400875)))

(declare-fun res!475621 () Bool)

(assert (=> b!712470 (=> (not res!475621) (not e!400875))))

(assert (=> b!712470 (= res!475621 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!530 (List!13397 (_ BitVec 64)) List!13397)

(assert (=> b!712470 (= lt!318583 ($colon$colon!530 newAcc!49 (select (arr!19356 a!3591) from!2969)))))

(assert (=> b!712470 (= lt!318584 ($colon$colon!530 acc!652 (select (arr!19356 a!3591) from!2969)))))

(declare-fun b!712471 () Bool)

(declare-fun res!475636 () Bool)

(assert (=> b!712471 (=> (not res!475636) (not e!400875))))

(assert (=> b!712471 (= res!475636 (contains!3974 lt!318583 k!2824))))

(declare-fun b!712472 () Bool)

(assert (=> b!712472 (= e!400875 (bvsge (bvsub (size!19764 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) (bvsub (size!19764 a!3591) from!2969)))))

(declare-fun res!475624 () Bool)

(assert (=> start!63268 (=> (not res!475624) (not e!400876))))

(assert (=> start!63268 (= res!475624 (and (bvslt (size!19764 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19764 a!3591))))))

(assert (=> start!63268 e!400876))

(assert (=> start!63268 true))

(declare-fun array_inv!15152 (array!40429) Bool)

(assert (=> start!63268 (array_inv!15152 a!3591)))

(declare-fun b!712473 () Bool)

(declare-fun res!475645 () Bool)

(assert (=> b!712473 (=> (not res!475645) (not e!400876))))

(assert (=> b!712473 (= res!475645 (not (contains!3974 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712474 () Bool)

(declare-fun res!475618 () Bool)

(assert (=> b!712474 (=> (not res!475618) (not e!400875))))

(assert (=> b!712474 (= res!475618 (not (contains!3974 lt!318583 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712475 () Bool)

(declare-fun res!475643 () Bool)

(assert (=> b!712475 (=> (not res!475643) (not e!400875))))

(assert (=> b!712475 (= res!475643 (not (contains!3974 lt!318583 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712476 () Bool)

(declare-fun res!475620 () Bool)

(assert (=> b!712476 (=> (not res!475620) (not e!400875))))

(assert (=> b!712476 (= res!475620 (noDuplicate!1221 lt!318583))))

(declare-fun b!712477 () Bool)

(declare-fun res!475629 () Bool)

(assert (=> b!712477 (=> (not res!475629) (not e!400876))))

(assert (=> b!712477 (= res!475629 (not (contains!3974 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63268 res!475624) b!712454))

(assert (= (and b!712454 res!475632) b!712452))

(assert (= (and b!712452 res!475635) b!712477))

(assert (= (and b!712477 res!475629) b!712461))

(assert (= (and b!712461 res!475641) b!712465))

(assert (= (and b!712465 res!475630) b!712450))

(assert (= (and b!712450 res!475626) b!712469))

(assert (= (and b!712469 res!475637) b!712467))

(assert (= (and b!712467 res!475617) b!712449))

(assert (= (and b!712449 res!475642) b!712459))

(assert (= (and b!712459 res!475628) b!712466))

(assert (= (and b!712466 res!475644) b!712473))

(assert (= (and b!712473 res!475645) b!712451))

(assert (= (and b!712451 res!475633) b!712462))

(assert (= (and b!712462 res!475622) b!712463))

(assert (= (and b!712463 res!475619) b!712470))

(assert (= (and b!712470 res!475621) b!712453))

(assert (= (and b!712453 res!475634) b!712476))

(assert (= (and b!712476 res!475620) b!712460))

(assert (= (and b!712460 res!475623) b!712457))

(assert (= (and b!712457 res!475640) b!712464))

(assert (= (and b!712464 res!475625) b!712458))

(assert (= (and b!712458 res!475631) b!712455))

(assert (= (and b!712455 res!475627) b!712456))

(assert (= (and b!712456 res!475638) b!712471))

(assert (= (and b!712471 res!475636) b!712468))

(assert (= (and b!712468 res!475639) b!712475))

(assert (= (and b!712475 res!475643) b!712474))

(assert (= (and b!712474 res!475618) b!712472))

(declare-fun m!669385 () Bool)

(assert (=> b!712457 m!669385))

(declare-fun m!669387 () Bool)

(assert (=> b!712466 m!669387))

(declare-fun m!669389 () Bool)

(assert (=> b!712469 m!669389))

(declare-fun m!669391 () Bool)

(assert (=> b!712454 m!669391))

(declare-fun m!669393 () Bool)

(assert (=> b!712459 m!669393))

(declare-fun m!669395 () Bool)

(assert (=> b!712453 m!669395))

(declare-fun m!669397 () Bool)

(assert (=> b!712468 m!669397))

(declare-fun m!669399 () Bool)

(assert (=> start!63268 m!669399))

(declare-fun m!669401 () Bool)

(assert (=> b!712465 m!669401))

(declare-fun m!669403 () Bool)

(assert (=> b!712452 m!669403))

(declare-fun m!669405 () Bool)

(assert (=> b!712463 m!669405))

(assert (=> b!712463 m!669405))

(declare-fun m!669407 () Bool)

(assert (=> b!712463 m!669407))

(declare-fun m!669409 () Bool)

(assert (=> b!712458 m!669409))

(declare-fun m!669411 () Bool)

(assert (=> b!712467 m!669411))

(declare-fun m!669413 () Bool)

(assert (=> b!712450 m!669413))

(declare-fun m!669415 () Bool)

(assert (=> b!712476 m!669415))

(declare-fun m!669417 () Bool)

(assert (=> b!712449 m!669417))

(declare-fun m!669419 () Bool)

(assert (=> b!712473 m!669419))

(declare-fun m!669421 () Bool)

(assert (=> b!712475 m!669421))

(declare-fun m!669423 () Bool)

(assert (=> b!712471 m!669423))

(declare-fun m!669425 () Bool)

(assert (=> b!712460 m!669425))

(assert (=> b!712470 m!669405))

(assert (=> b!712470 m!669405))

(declare-fun m!669427 () Bool)

(assert (=> b!712470 m!669427))

(assert (=> b!712470 m!669405))

(declare-fun m!669429 () Bool)

(assert (=> b!712470 m!669429))

(declare-fun m!669431 () Bool)

(assert (=> b!712464 m!669431))

(declare-fun m!669433 () Bool)

(assert (=> b!712451 m!669433))

(declare-fun m!669435 () Bool)

(assert (=> b!712477 m!669435))

(declare-fun m!669437 () Bool)

(assert (=> b!712461 m!669437))

(declare-fun m!669439 () Bool)

(assert (=> b!712456 m!669439))

(declare-fun m!669441 () Bool)

(assert (=> b!712474 m!669441))

(declare-fun m!669443 () Bool)

(assert (=> b!712455 m!669443))

(push 1)

