; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92688 () Bool)

(assert start!92688)

(declare-fun b!1052530 () Bool)

(declare-fun res!700857 () Bool)

(declare-fun e!597522 () Bool)

(assert (=> b!1052530 (=> (not res!700857) (not e!597522))))

(declare-datatypes ((array!66304 0))(
  ( (array!66305 (arr!31885 (Array (_ BitVec 32) (_ BitVec 64))) (size!32422 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66304)

(declare-datatypes ((List!22167 0))(
  ( (Nil!22164) (Cons!22163 (h!23381 (_ BitVec 64)) (t!31466 List!22167)) )
))
(declare-fun arrayNoDuplicates!0 (array!66304 (_ BitVec 32) List!22167) Bool)

(assert (=> b!1052530 (= res!700857 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22164))))

(declare-fun b!1052531 () Bool)

(declare-fun e!597523 () Bool)

(assert (=> b!1052531 (= e!597522 e!597523)))

(declare-fun res!700851 () Bool)

(assert (=> b!1052531 (=> (not res!700851) (not e!597523))))

(declare-fun lt!464713 () array!66304)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052531 (= res!700851 (arrayContainsKey!0 lt!464713 k0!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052531 (= lt!464713 (array!66305 (store (arr!31885 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32422 a!3488)))))

(declare-fun e!597521 () Bool)

(declare-fun b!1052532 () Bool)

(assert (=> b!1052532 (= e!597521 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052534 () Bool)

(declare-fun res!700855 () Bool)

(assert (=> b!1052534 (=> (not res!700855) (not e!597522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052534 (= res!700855 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052535 () Bool)

(declare-fun e!597520 () Bool)

(assert (=> b!1052535 (= e!597520 true)))

(declare-fun lt!464712 () (_ BitVec 32))

(assert (=> b!1052535 (arrayNoDuplicates!0 a!3488 lt!464712 Nil!22164)))

(declare-datatypes ((Unit!34411 0))(
  ( (Unit!34412) )
))
(declare-fun lt!464714 () Unit!34411)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66304 (_ BitVec 32) (_ BitVec 32)) Unit!34411)

(assert (=> b!1052535 (= lt!464714 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464712))))

(declare-fun b!1052536 () Bool)

(declare-fun res!700856 () Bool)

(assert (=> b!1052536 (=> (not res!700856) (not e!597522))))

(assert (=> b!1052536 (= res!700856 (= (select (arr!31885 a!3488) i!1381) k0!2747))))

(declare-fun b!1052537 () Bool)

(declare-fun e!597519 () Bool)

(assert (=> b!1052537 (= e!597523 e!597519)))

(declare-fun res!700858 () Bool)

(assert (=> b!1052537 (=> (not res!700858) (not e!597519))))

(assert (=> b!1052537 (= res!700858 (not (= lt!464712 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66304 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052537 (= lt!464712 (arrayScanForKey!0 lt!464713 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052538 () Bool)

(declare-fun e!597517 () Bool)

(assert (=> b!1052538 (= e!597517 e!597521)))

(declare-fun res!700852 () Bool)

(assert (=> b!1052538 (=> res!700852 e!597521)))

(assert (=> b!1052538 (= res!700852 (or (bvsgt lt!464712 i!1381) (bvsle i!1381 lt!464712)))))

(declare-fun res!700853 () Bool)

(assert (=> start!92688 (=> (not res!700853) (not e!597522))))

(assert (=> start!92688 (= res!700853 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32422 a!3488)) (bvslt (size!32422 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92688 e!597522))

(assert (=> start!92688 true))

(declare-fun array_inv!24667 (array!66304) Bool)

(assert (=> start!92688 (array_inv!24667 a!3488)))

(declare-fun b!1052533 () Bool)

(assert (=> b!1052533 (= e!597519 (not e!597520))))

(declare-fun res!700854 () Bool)

(assert (=> b!1052533 (=> res!700854 e!597520)))

(assert (=> b!1052533 (= res!700854 (or (bvsgt lt!464712 i!1381) (bvsle i!1381 lt!464712)))))

(assert (=> b!1052533 e!597517))

(declare-fun res!700859 () Bool)

(assert (=> b!1052533 (=> (not res!700859) (not e!597517))))

(assert (=> b!1052533 (= res!700859 (= (select (store (arr!31885 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464712) k0!2747))))

(assert (= (and start!92688 res!700853) b!1052530))

(assert (= (and b!1052530 res!700857) b!1052534))

(assert (= (and b!1052534 res!700855) b!1052536))

(assert (= (and b!1052536 res!700856) b!1052531))

(assert (= (and b!1052531 res!700851) b!1052537))

(assert (= (and b!1052537 res!700858) b!1052533))

(assert (= (and b!1052533 res!700859) b!1052538))

(assert (= (and b!1052538 (not res!700852)) b!1052532))

(assert (= (and b!1052533 (not res!700854)) b!1052535))

(declare-fun m!973427 () Bool)

(assert (=> b!1052534 m!973427))

(declare-fun m!973429 () Bool)

(assert (=> b!1052533 m!973429))

(declare-fun m!973431 () Bool)

(assert (=> b!1052533 m!973431))

(declare-fun m!973433 () Bool)

(assert (=> b!1052531 m!973433))

(assert (=> b!1052531 m!973429))

(declare-fun m!973435 () Bool)

(assert (=> start!92688 m!973435))

(declare-fun m!973437 () Bool)

(assert (=> b!1052532 m!973437))

(declare-fun m!973439 () Bool)

(assert (=> b!1052535 m!973439))

(declare-fun m!973441 () Bool)

(assert (=> b!1052535 m!973441))

(declare-fun m!973443 () Bool)

(assert (=> b!1052536 m!973443))

(declare-fun m!973445 () Bool)

(assert (=> b!1052530 m!973445))

(declare-fun m!973447 () Bool)

(assert (=> b!1052537 m!973447))

(check-sat (not b!1052534) (not b!1052537) (not b!1052532) (not start!92688) (not b!1052531) (not b!1052535) (not b!1052530))
(check-sat)
