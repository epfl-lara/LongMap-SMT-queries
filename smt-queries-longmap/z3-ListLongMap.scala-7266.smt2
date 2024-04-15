; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92776 () Bool)

(assert start!92776)

(declare-fun b!1053714 () Bool)

(declare-fun res!702784 () Bool)

(declare-fun e!598514 () Bool)

(assert (=> b!1053714 (=> (not res!702784) (not e!598514))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053714 (= res!702784 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053715 () Bool)

(declare-fun res!702780 () Bool)

(assert (=> b!1053715 (=> (not res!702780) (not e!598514))))

(declare-datatypes ((array!66410 0))(
  ( (array!66411 (arr!31938 (Array (_ BitVec 32) (_ BitVec 64))) (size!32476 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66410)

(declare-datatypes ((List!22309 0))(
  ( (Nil!22306) (Cons!22305 (h!23514 (_ BitVec 64)) (t!31607 List!22309)) )
))
(declare-fun arrayNoDuplicates!0 (array!66410 (_ BitVec 32) List!22309) Bool)

(assert (=> b!1053715 (= res!702780 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22306))))

(declare-fun b!1053716 () Bool)

(declare-fun e!598517 () Bool)

(assert (=> b!1053716 (= e!598517 (not true))))

(declare-fun e!598518 () Bool)

(assert (=> b!1053716 e!598518))

(declare-fun res!702786 () Bool)

(assert (=> b!1053716 (=> (not res!702786) (not e!598518))))

(declare-fun lt!465040 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053716 (= res!702786 (= (select (store (arr!31938 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465040) k0!2747))))

(declare-fun b!1053717 () Bool)

(declare-fun e!598516 () Bool)

(assert (=> b!1053717 (= e!598514 e!598516)))

(declare-fun res!702782 () Bool)

(assert (=> b!1053717 (=> (not res!702782) (not e!598516))))

(declare-fun lt!465039 () array!66410)

(declare-fun arrayContainsKey!0 (array!66410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053717 (= res!702782 (arrayContainsKey!0 lt!465039 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053717 (= lt!465039 (array!66411 (store (arr!31938 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32476 a!3488)))))

(declare-fun b!1053719 () Bool)

(assert (=> b!1053719 (= e!598516 e!598517)))

(declare-fun res!702785 () Bool)

(assert (=> b!1053719 (=> (not res!702785) (not e!598517))))

(assert (=> b!1053719 (= res!702785 (not (= lt!465040 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66410 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053719 (= lt!465040 (arrayScanForKey!0 lt!465039 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053720 () Bool)

(declare-fun res!702787 () Bool)

(assert (=> b!1053720 (=> (not res!702787) (not e!598514))))

(assert (=> b!1053720 (= res!702787 (= (select (arr!31938 a!3488) i!1381) k0!2747))))

(declare-fun b!1053721 () Bool)

(declare-fun e!598515 () Bool)

(assert (=> b!1053721 (= e!598518 e!598515)))

(declare-fun res!702781 () Bool)

(assert (=> b!1053721 (=> res!702781 e!598515)))

(assert (=> b!1053721 (= res!702781 (bvsle lt!465040 i!1381))))

(declare-fun b!1053718 () Bool)

(assert (=> b!1053718 (= e!598515 (arrayContainsKey!0 a!3488 k0!2747 lt!465040))))

(declare-fun res!702783 () Bool)

(assert (=> start!92776 (=> (not res!702783) (not e!598514))))

(assert (=> start!92776 (= res!702783 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32476 a!3488)) (bvslt (size!32476 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92776 e!598514))

(assert (=> start!92776 true))

(declare-fun array_inv!24721 (array!66410) Bool)

(assert (=> start!92776 (array_inv!24721 a!3488)))

(assert (= (and start!92776 res!702783) b!1053715))

(assert (= (and b!1053715 res!702780) b!1053714))

(assert (= (and b!1053714 res!702784) b!1053720))

(assert (= (and b!1053720 res!702787) b!1053717))

(assert (= (and b!1053717 res!702782) b!1053719))

(assert (= (and b!1053719 res!702785) b!1053716))

(assert (= (and b!1053716 res!702786) b!1053721))

(assert (= (and b!1053721 (not res!702781)) b!1053718))

(declare-fun m!973429 () Bool)

(assert (=> b!1053720 m!973429))

(declare-fun m!973431 () Bool)

(assert (=> b!1053719 m!973431))

(declare-fun m!973433 () Bool)

(assert (=> start!92776 m!973433))

(declare-fun m!973435 () Bool)

(assert (=> b!1053714 m!973435))

(declare-fun m!973437 () Bool)

(assert (=> b!1053716 m!973437))

(declare-fun m!973439 () Bool)

(assert (=> b!1053716 m!973439))

(declare-fun m!973441 () Bool)

(assert (=> b!1053715 m!973441))

(declare-fun m!973443 () Bool)

(assert (=> b!1053717 m!973443))

(assert (=> b!1053717 m!973437))

(declare-fun m!973445 () Bool)

(assert (=> b!1053718 m!973445))

(check-sat (not b!1053714) (not start!92776) (not b!1053718) (not b!1053715) (not b!1053717) (not b!1053719))
(check-sat)
