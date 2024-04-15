; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92782 () Bool)

(assert start!92782)

(declare-fun e!598571 () Bool)

(declare-fun b!1053788 () Bool)

(declare-datatypes ((array!66416 0))(
  ( (array!66417 (arr!31941 (Array (_ BitVec 32) (_ BitVec 64))) (size!32479 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66416)

(declare-fun lt!465061 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053788 (= e!598571 (arrayContainsKey!0 a!3488 k0!2747 lt!465061))))

(declare-fun b!1053790 () Bool)

(declare-fun res!702862 () Bool)

(declare-fun e!598570 () Bool)

(assert (=> b!1053790 (=> (not res!702862) (not e!598570))))

(declare-datatypes ((List!22312 0))(
  ( (Nil!22309) (Cons!22308 (h!23517 (_ BitVec 64)) (t!31610 List!22312)) )
))
(declare-fun arrayNoDuplicates!0 (array!66416 (_ BitVec 32) List!22312) Bool)

(assert (=> b!1053790 (= res!702862 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22309))))

(declare-fun b!1053791 () Bool)

(declare-fun e!598574 () Bool)

(assert (=> b!1053791 (= e!598574 (bvsge lt!465061 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053791 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22309)))

(declare-datatypes ((Unit!34373 0))(
  ( (Unit!34374) )
))
(declare-fun lt!465059 () Unit!34373)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66416 (_ BitVec 32) (_ BitVec 32)) Unit!34373)

(assert (=> b!1053791 (= lt!465059 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1053792 () Bool)

(declare-fun res!702854 () Bool)

(assert (=> b!1053792 (=> (not res!702854) (not e!598570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053792 (= res!702854 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053793 () Bool)

(declare-fun e!598573 () Bool)

(assert (=> b!1053793 (= e!598570 e!598573)))

(declare-fun res!702861 () Bool)

(assert (=> b!1053793 (=> (not res!702861) (not e!598573))))

(declare-fun lt!465060 () array!66416)

(assert (=> b!1053793 (= res!702861 (arrayContainsKey!0 lt!465060 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053793 (= lt!465060 (array!66417 (store (arr!31941 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32479 a!3488)))))

(declare-fun b!1053794 () Bool)

(declare-fun res!702857 () Bool)

(assert (=> b!1053794 (=> (not res!702857) (not e!598570))))

(assert (=> b!1053794 (= res!702857 (= (select (arr!31941 a!3488) i!1381) k0!2747))))

(declare-fun b!1053795 () Bool)

(declare-fun e!598575 () Bool)

(assert (=> b!1053795 (= e!598575 (not e!598574))))

(declare-fun res!702856 () Bool)

(assert (=> b!1053795 (=> res!702856 e!598574)))

(assert (=> b!1053795 (= res!702856 (bvsle lt!465061 i!1381))))

(declare-fun e!598569 () Bool)

(assert (=> b!1053795 e!598569))

(declare-fun res!702858 () Bool)

(assert (=> b!1053795 (=> (not res!702858) (not e!598569))))

(assert (=> b!1053795 (= res!702858 (= (select (store (arr!31941 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465061) k0!2747))))

(declare-fun b!1053796 () Bool)

(assert (=> b!1053796 (= e!598573 e!598575)))

(declare-fun res!702859 () Bool)

(assert (=> b!1053796 (=> (not res!702859) (not e!598575))))

(assert (=> b!1053796 (= res!702859 (not (= lt!465061 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66416 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053796 (= lt!465061 (arrayScanForKey!0 lt!465060 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053789 () Bool)

(assert (=> b!1053789 (= e!598569 e!598571)))

(declare-fun res!702860 () Bool)

(assert (=> b!1053789 (=> res!702860 e!598571)))

(assert (=> b!1053789 (= res!702860 (bvsle lt!465061 i!1381))))

(declare-fun res!702855 () Bool)

(assert (=> start!92782 (=> (not res!702855) (not e!598570))))

(assert (=> start!92782 (= res!702855 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32479 a!3488)) (bvslt (size!32479 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92782 e!598570))

(assert (=> start!92782 true))

(declare-fun array_inv!24724 (array!66416) Bool)

(assert (=> start!92782 (array_inv!24724 a!3488)))

(assert (= (and start!92782 res!702855) b!1053790))

(assert (= (and b!1053790 res!702862) b!1053792))

(assert (= (and b!1053792 res!702854) b!1053794))

(assert (= (and b!1053794 res!702857) b!1053793))

(assert (= (and b!1053793 res!702861) b!1053796))

(assert (= (and b!1053796 res!702859) b!1053795))

(assert (= (and b!1053795 res!702858) b!1053789))

(assert (= (and b!1053789 (not res!702860)) b!1053788))

(assert (= (and b!1053795 (not res!702856)) b!1053791))

(declare-fun m!973483 () Bool)

(assert (=> b!1053790 m!973483))

(declare-fun m!973485 () Bool)

(assert (=> b!1053788 m!973485))

(declare-fun m!973487 () Bool)

(assert (=> b!1053793 m!973487))

(declare-fun m!973489 () Bool)

(assert (=> b!1053793 m!973489))

(declare-fun m!973491 () Bool)

(assert (=> b!1053796 m!973491))

(assert (=> b!1053795 m!973489))

(declare-fun m!973493 () Bool)

(assert (=> b!1053795 m!973493))

(declare-fun m!973495 () Bool)

(assert (=> b!1053794 m!973495))

(declare-fun m!973497 () Bool)

(assert (=> start!92782 m!973497))

(declare-fun m!973499 () Bool)

(assert (=> b!1053791 m!973499))

(declare-fun m!973501 () Bool)

(assert (=> b!1053791 m!973501))

(declare-fun m!973503 () Bool)

(assert (=> b!1053792 m!973503))

(check-sat (not b!1053788) (not b!1053796) (not b!1053791) (not b!1053790) (not b!1053793) (not b!1053792) (not start!92782))
(check-sat)
