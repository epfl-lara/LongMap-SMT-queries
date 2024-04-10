; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92768 () Bool)

(assert start!92768)

(declare-fun b!1053745 () Bool)

(declare-fun e!598516 () Bool)

(declare-fun e!598514 () Bool)

(assert (=> b!1053745 (= e!598516 e!598514)))

(declare-fun res!702734 () Bool)

(assert (=> b!1053745 (=> (not res!702734) (not e!598514))))

(declare-fun lt!465209 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053745 (= res!702734 (not (= lt!465209 i!1381)))))

(declare-datatypes ((array!66461 0))(
  ( (array!66462 (arr!31964 (Array (_ BitVec 32) (_ BitVec 64))) (size!32500 (_ BitVec 32))) )
))
(declare-fun lt!465210 () array!66461)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66461 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053745 (= lt!465209 (arrayScanForKey!0 lt!465210 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053746 () Bool)

(declare-fun a!3488 () array!66461)

(assert (=> b!1053746 (= e!598514 (not (or (bvsle lt!465209 i!1381) (bvsle #b00000000000000000000000000000000 (size!32500 a!3488)))))))

(declare-fun e!598517 () Bool)

(assert (=> b!1053746 e!598517))

(declare-fun res!702727 () Bool)

(assert (=> b!1053746 (=> (not res!702727) (not e!598517))))

(assert (=> b!1053746 (= res!702727 (= (select (store (arr!31964 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465209) k0!2747))))

(declare-fun b!1053747 () Bool)

(declare-fun res!702728 () Bool)

(declare-fun e!598515 () Bool)

(assert (=> b!1053747 (=> (not res!702728) (not e!598515))))

(declare-datatypes ((List!22276 0))(
  ( (Nil!22273) (Cons!22272 (h!23481 (_ BitVec 64)) (t!31583 List!22276)) )
))
(declare-fun arrayNoDuplicates!0 (array!66461 (_ BitVec 32) List!22276) Bool)

(assert (=> b!1053747 (= res!702728 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22273))))

(declare-fun res!702730 () Bool)

(assert (=> start!92768 (=> (not res!702730) (not e!598515))))

(assert (=> start!92768 (= res!702730 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32500 a!3488)) (bvslt (size!32500 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92768 e!598515))

(assert (=> start!92768 true))

(declare-fun array_inv!24744 (array!66461) Bool)

(assert (=> start!92768 (array_inv!24744 a!3488)))

(declare-fun b!1053748 () Bool)

(declare-fun e!598518 () Bool)

(assert (=> b!1053748 (= e!598517 e!598518)))

(declare-fun res!702732 () Bool)

(assert (=> b!1053748 (=> res!702732 e!598518)))

(assert (=> b!1053748 (= res!702732 (bvsle lt!465209 i!1381))))

(declare-fun b!1053749 () Bool)

(declare-fun arrayContainsKey!0 (array!66461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053749 (= e!598518 (arrayContainsKey!0 a!3488 k0!2747 lt!465209))))

(declare-fun b!1053750 () Bool)

(declare-fun res!702733 () Bool)

(assert (=> b!1053750 (=> (not res!702733) (not e!598515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053750 (= res!702733 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053751 () Bool)

(assert (=> b!1053751 (= e!598515 e!598516)))

(declare-fun res!702729 () Bool)

(assert (=> b!1053751 (=> (not res!702729) (not e!598516))))

(assert (=> b!1053751 (= res!702729 (arrayContainsKey!0 lt!465210 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053751 (= lt!465210 (array!66462 (store (arr!31964 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32500 a!3488)))))

(declare-fun b!1053752 () Bool)

(declare-fun res!702731 () Bool)

(assert (=> b!1053752 (=> (not res!702731) (not e!598515))))

(assert (=> b!1053752 (= res!702731 (= (select (arr!31964 a!3488) i!1381) k0!2747))))

(assert (= (and start!92768 res!702730) b!1053747))

(assert (= (and b!1053747 res!702728) b!1053750))

(assert (= (and b!1053750 res!702733) b!1053752))

(assert (= (and b!1053752 res!702731) b!1053751))

(assert (= (and b!1053751 res!702729) b!1053745))

(assert (= (and b!1053745 res!702734) b!1053746))

(assert (= (and b!1053746 res!702727) b!1053748))

(assert (= (and b!1053748 (not res!702732)) b!1053749))

(declare-fun m!973955 () Bool)

(assert (=> b!1053745 m!973955))

(declare-fun m!973957 () Bool)

(assert (=> b!1053747 m!973957))

(declare-fun m!973959 () Bool)

(assert (=> b!1053750 m!973959))

(declare-fun m!973961 () Bool)

(assert (=> start!92768 m!973961))

(declare-fun m!973963 () Bool)

(assert (=> b!1053751 m!973963))

(declare-fun m!973965 () Bool)

(assert (=> b!1053751 m!973965))

(assert (=> b!1053746 m!973965))

(declare-fun m!973967 () Bool)

(assert (=> b!1053746 m!973967))

(declare-fun m!973969 () Bool)

(assert (=> b!1053752 m!973969))

(declare-fun m!973971 () Bool)

(assert (=> b!1053749 m!973971))

(check-sat (not b!1053750) (not b!1053745) (not b!1053751) (not b!1053747) (not b!1053749) (not start!92768))
(check-sat)
