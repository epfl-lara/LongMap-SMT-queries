; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62528 () Bool)

(assert start!62528)

(declare-fun b!704494 () Bool)

(declare-fun res!468464 () Bool)

(declare-fun e!397577 () Bool)

(assert (=> b!704494 (=> (not res!468464) (not e!397577))))

(declare-datatypes ((array!40218 0))(
  ( (array!40219 (arr!19265 (Array (_ BitVec 32) (_ BitVec 64))) (size!19647 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40218)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704494 (= res!468464 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704495 () Bool)

(declare-fun res!468472 () Bool)

(assert (=> b!704495 (=> (not res!468472) (not e!397577))))

(declare-datatypes ((List!13345 0))(
  ( (Nil!13342) (Cons!13341 (h!14386 (_ BitVec 64)) (t!19618 List!13345)) )
))
(declare-fun acc!652 () List!13345)

(declare-fun contains!3867 (List!13345 (_ BitVec 64)) Bool)

(assert (=> b!704495 (= res!468472 (not (contains!3867 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704496 () Bool)

(declare-fun res!468470 () Bool)

(assert (=> b!704496 (=> (not res!468470) (not e!397577))))

(assert (=> b!704496 (= res!468470 (not (contains!3867 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704497 () Bool)

(declare-fun res!468473 () Bool)

(assert (=> b!704497 (=> (not res!468473) (not e!397577))))

(declare-fun newAcc!49 () List!13345)

(assert (=> b!704497 (= res!468473 (not (contains!3867 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704498 () Bool)

(declare-fun res!468480 () Bool)

(assert (=> b!704498 (=> (not res!468480) (not e!397577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704498 (= res!468480 (not (validKeyInArray!0 (select (arr!19265 a!3591) from!2969))))))

(declare-fun b!704499 () Bool)

(declare-fun res!468474 () Bool)

(assert (=> b!704499 (=> (not res!468474) (not e!397577))))

(assert (=> b!704499 (= res!468474 (not (contains!3867 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704500 () Bool)

(assert (=> b!704500 (= e!397577 false)))

(declare-fun lt!317610 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40218 (_ BitVec 32) List!13345) Bool)

(assert (=> b!704500 (= lt!317610 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704501 () Bool)

(declare-fun res!468469 () Bool)

(assert (=> b!704501 (=> (not res!468469) (not e!397577))))

(assert (=> b!704501 (= res!468469 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704503 () Bool)

(declare-fun res!468468 () Bool)

(assert (=> b!704503 (=> (not res!468468) (not e!397577))))

(assert (=> b!704503 (= res!468468 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704504 () Bool)

(declare-fun res!468467 () Bool)

(assert (=> b!704504 (=> (not res!468467) (not e!397577))))

(declare-fun subseq!329 (List!13345 List!13345) Bool)

(assert (=> b!704504 (= res!468467 (subseq!329 acc!652 newAcc!49))))

(declare-fun b!704505 () Bool)

(declare-fun res!468475 () Bool)

(assert (=> b!704505 (=> (not res!468475) (not e!397577))))

(assert (=> b!704505 (= res!468475 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19647 a!3591)))))

(declare-fun b!704506 () Bool)

(declare-fun res!468466 () Bool)

(assert (=> b!704506 (=> (not res!468466) (not e!397577))))

(assert (=> b!704506 (= res!468466 (not (contains!3867 acc!652 k0!2824)))))

(declare-fun b!704507 () Bool)

(declare-fun res!468476 () Bool)

(assert (=> b!704507 (=> (not res!468476) (not e!397577))))

(assert (=> b!704507 (= res!468476 (validKeyInArray!0 k0!2824))))

(declare-fun b!704508 () Bool)

(declare-fun res!468481 () Bool)

(assert (=> b!704508 (=> (not res!468481) (not e!397577))))

(declare-fun noDuplicate!1136 (List!13345) Bool)

(assert (=> b!704508 (= res!468481 (noDuplicate!1136 acc!652))))

(declare-fun b!704509 () Bool)

(declare-fun res!468479 () Bool)

(assert (=> b!704509 (=> (not res!468479) (not e!397577))))

(assert (=> b!704509 (= res!468479 (noDuplicate!1136 newAcc!49))))

(declare-fun b!704510 () Bool)

(declare-fun res!468478 () Bool)

(assert (=> b!704510 (=> (not res!468478) (not e!397577))))

(declare-fun -!294 (List!13345 (_ BitVec 64)) List!13345)

(assert (=> b!704510 (= res!468478 (= (-!294 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704511 () Bool)

(declare-fun res!468471 () Bool)

(assert (=> b!704511 (=> (not res!468471) (not e!397577))))

(assert (=> b!704511 (= res!468471 (contains!3867 newAcc!49 k0!2824))))

(declare-fun res!468465 () Bool)

(assert (=> start!62528 (=> (not res!468465) (not e!397577))))

(assert (=> start!62528 (= res!468465 (and (bvslt (size!19647 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19647 a!3591))))))

(assert (=> start!62528 e!397577))

(assert (=> start!62528 true))

(declare-fun array_inv!15148 (array!40218) Bool)

(assert (=> start!62528 (array_inv!15148 a!3591)))

(declare-fun b!704502 () Bool)

(declare-fun res!468477 () Bool)

(assert (=> b!704502 (=> (not res!468477) (not e!397577))))

(assert (=> b!704502 (= res!468477 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (= (and start!62528 res!468465) b!704508))

(assert (= (and b!704508 res!468481) b!704509))

(assert (= (and b!704509 res!468479) b!704496))

(assert (= (and b!704496 res!468470) b!704495))

(assert (= (and b!704495 res!468472) b!704501))

(assert (= (and b!704501 res!468469) b!704506))

(assert (= (and b!704506 res!468466) b!704507))

(assert (= (and b!704507 res!468476) b!704503))

(assert (= (and b!704503 res!468468) b!704504))

(assert (= (and b!704504 res!468467) b!704511))

(assert (= (and b!704511 res!468471) b!704510))

(assert (= (and b!704510 res!468478) b!704499))

(assert (= (and b!704499 res!468474) b!704497))

(assert (= (and b!704497 res!468473) b!704505))

(assert (= (and b!704505 res!468475) b!704498))

(assert (= (and b!704498 res!468480) b!704502))

(assert (= (and b!704502 res!468477) b!704494))

(assert (= (and b!704494 res!468464) b!704500))

(declare-fun m!662403 () Bool)

(assert (=> b!704504 m!662403))

(declare-fun m!662405 () Bool)

(assert (=> b!704497 m!662405))

(declare-fun m!662407 () Bool)

(assert (=> b!704507 m!662407))

(declare-fun m!662409 () Bool)

(assert (=> b!704499 m!662409))

(declare-fun m!662411 () Bool)

(assert (=> b!704495 m!662411))

(declare-fun m!662413 () Bool)

(assert (=> b!704508 m!662413))

(declare-fun m!662415 () Bool)

(assert (=> b!704509 m!662415))

(declare-fun m!662417 () Bool)

(assert (=> b!704510 m!662417))

(declare-fun m!662419 () Bool)

(assert (=> b!704501 m!662419))

(declare-fun m!662421 () Bool)

(assert (=> b!704500 m!662421))

(declare-fun m!662423 () Bool)

(assert (=> b!704498 m!662423))

(assert (=> b!704498 m!662423))

(declare-fun m!662425 () Bool)

(assert (=> b!704498 m!662425))

(declare-fun m!662427 () Bool)

(assert (=> b!704494 m!662427))

(declare-fun m!662429 () Bool)

(assert (=> start!62528 m!662429))

(declare-fun m!662431 () Bool)

(assert (=> b!704503 m!662431))

(declare-fun m!662433 () Bool)

(assert (=> b!704496 m!662433))

(declare-fun m!662435 () Bool)

(assert (=> b!704506 m!662435))

(declare-fun m!662437 () Bool)

(assert (=> b!704511 m!662437))

(check-sat (not b!704497) (not b!704498) (not b!704506) (not b!704510) (not b!704496) (not b!704503) (not start!62528) (not b!704494) (not b!704509) (not b!704504) (not b!704507) (not b!704495) (not b!704511) (not b!704500) (not b!704499) (not b!704501) (not b!704508))
(check-sat)
