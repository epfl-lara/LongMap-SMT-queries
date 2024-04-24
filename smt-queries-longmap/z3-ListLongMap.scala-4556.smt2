; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63568 () Bool)

(assert start!63568)

(declare-fun b!715613 () Bool)

(declare-fun res!478468 () Bool)

(declare-fun e!402026 () Bool)

(assert (=> b!715613 (=> (not res!478468) (not e!402026))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!715613 (= res!478468 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715614 () Bool)

(assert (=> b!715614 (= e!402026 false)))

(declare-datatypes ((array!40518 0))(
  ( (array!40519 (arr!19393 (Array (_ BitVec 32) (_ BitVec 64))) (size!19808 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40518)

(declare-fun lt!318951 () Bool)

(declare-datatypes ((List!13341 0))(
  ( (Nil!13338) (Cons!13337 (h!14385 (_ BitVec 64)) (t!19648 List!13341)) )
))
(declare-fun acc!652 () List!13341)

(declare-fun arrayNoDuplicates!0 (array!40518 (_ BitVec 32) List!13341) Bool)

(assert (=> b!715614 (= lt!318951 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715615 () Bool)

(declare-fun res!478464 () Bool)

(assert (=> b!715615 (=> (not res!478464) (not e!402026))))

(declare-fun contains!3993 (List!13341 (_ BitVec 64)) Bool)

(assert (=> b!715615 (= res!478464 (not (contains!3993 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715616 () Bool)

(declare-fun res!478475 () Bool)

(assert (=> b!715616 (=> (not res!478475) (not e!402026))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715616 (= res!478475 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715617 () Bool)

(declare-fun res!478466 () Bool)

(assert (=> b!715617 (=> (not res!478466) (not e!402026))))

(declare-fun newAcc!49 () List!13341)

(assert (=> b!715617 (= res!478466 (not (contains!3993 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!478460 () Bool)

(assert (=> start!63568 (=> (not res!478460) (not e!402026))))

(assert (=> start!63568 (= res!478460 (and (bvslt (size!19808 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19808 a!3591))))))

(assert (=> start!63568 e!402026))

(assert (=> start!63568 true))

(declare-fun array_inv!15252 (array!40518) Bool)

(assert (=> start!63568 (array_inv!15252 a!3591)))

(declare-fun b!715618 () Bool)

(declare-fun res!478471 () Bool)

(assert (=> b!715618 (=> (not res!478471) (not e!402026))))

(assert (=> b!715618 (= res!478471 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715619 () Bool)

(declare-fun res!478461 () Bool)

(assert (=> b!715619 (=> (not res!478461) (not e!402026))))

(assert (=> b!715619 (= res!478461 (not (contains!3993 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715620 () Bool)

(declare-fun res!478477 () Bool)

(assert (=> b!715620 (=> (not res!478477) (not e!402026))))

(assert (=> b!715620 (= res!478477 (contains!3993 newAcc!49 k0!2824))))

(declare-fun b!715621 () Bool)

(declare-fun res!478474 () Bool)

(assert (=> b!715621 (=> (not res!478474) (not e!402026))))

(assert (=> b!715621 (= res!478474 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19808 a!3591)))))

(declare-fun b!715622 () Bool)

(declare-fun res!478470 () Bool)

(assert (=> b!715622 (=> (not res!478470) (not e!402026))))

(assert (=> b!715622 (= res!478470 (not (contains!3993 acc!652 k0!2824)))))

(declare-fun b!715623 () Bool)

(declare-fun res!478469 () Bool)

(assert (=> b!715623 (=> (not res!478469) (not e!402026))))

(assert (=> b!715623 (= res!478469 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715624 () Bool)

(declare-fun res!478473 () Bool)

(assert (=> b!715624 (=> (not res!478473) (not e!402026))))

(declare-fun subseq!461 (List!13341 List!13341) Bool)

(assert (=> b!715624 (= res!478473 (subseq!461 acc!652 newAcc!49))))

(declare-fun b!715625 () Bool)

(declare-fun res!478463 () Bool)

(assert (=> b!715625 (=> (not res!478463) (not e!402026))))

(declare-fun -!425 (List!13341 (_ BitVec 64)) List!13341)

(assert (=> b!715625 (= res!478463 (= (-!425 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715626 () Bool)

(declare-fun res!478472 () Bool)

(assert (=> b!715626 (=> (not res!478472) (not e!402026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715626 (= res!478472 (not (validKeyInArray!0 (select (arr!19393 a!3591) from!2969))))))

(declare-fun b!715627 () Bool)

(declare-fun res!478476 () Bool)

(assert (=> b!715627 (=> (not res!478476) (not e!402026))))

(declare-fun noDuplicate!1267 (List!13341) Bool)

(assert (=> b!715627 (= res!478476 (noDuplicate!1267 acc!652))))

(declare-fun b!715628 () Bool)

(declare-fun res!478465 () Bool)

(assert (=> b!715628 (=> (not res!478465) (not e!402026))))

(assert (=> b!715628 (= res!478465 (validKeyInArray!0 k0!2824))))

(declare-fun b!715629 () Bool)

(declare-fun res!478462 () Bool)

(assert (=> b!715629 (=> (not res!478462) (not e!402026))))

(assert (=> b!715629 (= res!478462 (not (contains!3993 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715630 () Bool)

(declare-fun res!478467 () Bool)

(assert (=> b!715630 (=> (not res!478467) (not e!402026))))

(assert (=> b!715630 (= res!478467 (noDuplicate!1267 newAcc!49))))

(assert (= (and start!63568 res!478460) b!715627))

(assert (= (and b!715627 res!478476) b!715630))

(assert (= (and b!715630 res!478467) b!715619))

(assert (= (and b!715619 res!478461) b!715615))

(assert (= (and b!715615 res!478464) b!715616))

(assert (= (and b!715616 res!478475) b!715622))

(assert (= (and b!715622 res!478470) b!715628))

(assert (= (and b!715628 res!478465) b!715623))

(assert (= (and b!715623 res!478469) b!715624))

(assert (= (and b!715624 res!478473) b!715620))

(assert (= (and b!715620 res!478477) b!715625))

(assert (= (and b!715625 res!478463) b!715629))

(assert (= (and b!715629 res!478462) b!715617))

(assert (= (and b!715617 res!478466) b!715621))

(assert (= (and b!715621 res!478474) b!715626))

(assert (= (and b!715626 res!478472) b!715613))

(assert (= (and b!715613 res!478468) b!715618))

(assert (= (and b!715618 res!478471) b!715614))

(declare-fun m!672381 () Bool)

(assert (=> b!715616 m!672381))

(declare-fun m!672383 () Bool)

(assert (=> b!715626 m!672383))

(assert (=> b!715626 m!672383))

(declare-fun m!672385 () Bool)

(assert (=> b!715626 m!672385))

(declare-fun m!672387 () Bool)

(assert (=> b!715630 m!672387))

(declare-fun m!672389 () Bool)

(assert (=> b!715628 m!672389))

(declare-fun m!672391 () Bool)

(assert (=> start!63568 m!672391))

(declare-fun m!672393 () Bool)

(assert (=> b!715619 m!672393))

(declare-fun m!672395 () Bool)

(assert (=> b!715629 m!672395))

(declare-fun m!672397 () Bool)

(assert (=> b!715622 m!672397))

(declare-fun m!672399 () Bool)

(assert (=> b!715625 m!672399))

(declare-fun m!672401 () Bool)

(assert (=> b!715614 m!672401))

(declare-fun m!672403 () Bool)

(assert (=> b!715618 m!672403))

(declare-fun m!672405 () Bool)

(assert (=> b!715623 m!672405))

(declare-fun m!672407 () Bool)

(assert (=> b!715627 m!672407))

(declare-fun m!672409 () Bool)

(assert (=> b!715620 m!672409))

(declare-fun m!672411 () Bool)

(assert (=> b!715624 m!672411))

(declare-fun m!672413 () Bool)

(assert (=> b!715617 m!672413))

(declare-fun m!672415 () Bool)

(assert (=> b!715615 m!672415))

(check-sat (not b!715617) (not b!715622) (not b!715623) (not b!715624) (not b!715616) (not b!715628) (not b!715626) (not b!715625) (not b!715627) (not b!715630) (not b!715629) (not b!715620) (not b!715618) (not b!715615) (not start!63568) (not b!715614) (not b!715619))
(check-sat)
