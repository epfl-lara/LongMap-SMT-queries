; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92694 () Bool)

(assert start!92694)

(declare-fun b!1052612 () Bool)

(declare-fun e!597586 () Bool)

(declare-fun e!597585 () Bool)

(assert (=> b!1052612 (= e!597586 (not e!597585))))

(declare-fun res!700934 () Bool)

(assert (=> b!1052612 (=> res!700934 e!597585)))

(declare-fun lt!464740 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052612 (= res!700934 (or (bvsgt lt!464740 i!1381) (bvsle i!1381 lt!464740)))))

(declare-fun e!597582 () Bool)

(assert (=> b!1052612 e!597582))

(declare-fun res!700937 () Bool)

(assert (=> b!1052612 (=> (not res!700937) (not e!597582))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-datatypes ((array!66310 0))(
  ( (array!66311 (arr!31888 (Array (_ BitVec 32) (_ BitVec 64))) (size!32425 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66310)

(assert (=> b!1052612 (= res!700937 (= (select (store (arr!31888 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464740) k0!2747))))

(declare-fun b!1052613 () Bool)

(declare-fun e!597580 () Bool)

(declare-fun e!597581 () Bool)

(assert (=> b!1052613 (= e!597580 e!597581)))

(declare-fun res!700933 () Bool)

(assert (=> b!1052613 (=> (not res!700933) (not e!597581))))

(declare-fun lt!464739 () array!66310)

(declare-fun arrayContainsKey!0 (array!66310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052613 (= res!700933 (arrayContainsKey!0 lt!464739 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052613 (= lt!464739 (array!66311 (store (arr!31888 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32425 a!3488)))))

(declare-fun b!1052614 () Bool)

(assert (=> b!1052614 (= e!597581 e!597586)))

(declare-fun res!700940 () Bool)

(assert (=> b!1052614 (=> (not res!700940) (not e!597586))))

(assert (=> b!1052614 (= res!700940 (not (= lt!464740 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66310 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052614 (= lt!464740 (arrayScanForKey!0 lt!464739 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052615 () Bool)

(declare-fun e!597584 () Bool)

(assert (=> b!1052615 (= e!597584 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!700932 () Bool)

(assert (=> start!92694 (=> (not res!700932) (not e!597580))))

(assert (=> start!92694 (= res!700932 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32425 a!3488)) (bvslt (size!32425 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92694 e!597580))

(assert (=> start!92694 true))

(declare-fun array_inv!24670 (array!66310) Bool)

(assert (=> start!92694 (array_inv!24670 a!3488)))

(declare-fun b!1052611 () Bool)

(declare-fun res!700936 () Bool)

(assert (=> b!1052611 (=> (not res!700936) (not e!597580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052611 (= res!700936 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052616 () Bool)

(declare-fun res!700935 () Bool)

(assert (=> b!1052616 (=> (not res!700935) (not e!597580))))

(assert (=> b!1052616 (= res!700935 (= (select (arr!31888 a!3488) i!1381) k0!2747))))

(declare-fun b!1052617 () Bool)

(assert (=> b!1052617 (= e!597582 e!597584)))

(declare-fun res!700939 () Bool)

(assert (=> b!1052617 (=> res!700939 e!597584)))

(assert (=> b!1052617 (= res!700939 (or (bvsgt lt!464740 i!1381) (bvsle i!1381 lt!464740)))))

(declare-fun b!1052618 () Bool)

(assert (=> b!1052618 (= e!597585 true)))

(declare-datatypes ((List!22170 0))(
  ( (Nil!22167) (Cons!22166 (h!23384 (_ BitVec 64)) (t!31469 List!22170)) )
))
(declare-fun arrayNoDuplicates!0 (array!66310 (_ BitVec 32) List!22170) Bool)

(assert (=> b!1052618 (arrayNoDuplicates!0 a!3488 lt!464740 Nil!22167)))

(declare-datatypes ((Unit!34417 0))(
  ( (Unit!34418) )
))
(declare-fun lt!464741 () Unit!34417)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66310 (_ BitVec 32) (_ BitVec 32)) Unit!34417)

(assert (=> b!1052618 (= lt!464741 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464740))))

(declare-fun b!1052619 () Bool)

(declare-fun res!700938 () Bool)

(assert (=> b!1052619 (=> (not res!700938) (not e!597580))))

(assert (=> b!1052619 (= res!700938 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22167))))

(assert (= (and start!92694 res!700932) b!1052619))

(assert (= (and b!1052619 res!700938) b!1052611))

(assert (= (and b!1052611 res!700936) b!1052616))

(assert (= (and b!1052616 res!700935) b!1052613))

(assert (= (and b!1052613 res!700933) b!1052614))

(assert (= (and b!1052614 res!700940) b!1052612))

(assert (= (and b!1052612 res!700937) b!1052617))

(assert (= (and b!1052617 (not res!700939)) b!1052615))

(assert (= (and b!1052612 (not res!700934)) b!1052618))

(declare-fun m!973493 () Bool)

(assert (=> b!1052614 m!973493))

(declare-fun m!973495 () Bool)

(assert (=> b!1052619 m!973495))

(declare-fun m!973497 () Bool)

(assert (=> b!1052618 m!973497))

(declare-fun m!973499 () Bool)

(assert (=> b!1052618 m!973499))

(declare-fun m!973501 () Bool)

(assert (=> start!92694 m!973501))

(declare-fun m!973503 () Bool)

(assert (=> b!1052616 m!973503))

(declare-fun m!973505 () Bool)

(assert (=> b!1052611 m!973505))

(declare-fun m!973507 () Bool)

(assert (=> b!1052615 m!973507))

(declare-fun m!973509 () Bool)

(assert (=> b!1052612 m!973509))

(declare-fun m!973511 () Bool)

(assert (=> b!1052612 m!973511))

(declare-fun m!973513 () Bool)

(assert (=> b!1052613 m!973513))

(assert (=> b!1052613 m!973509))

(check-sat (not b!1052614) (not b!1052615) (not b!1052619) (not b!1052611) (not b!1052613) (not start!92694) (not b!1052618))
(check-sat)
