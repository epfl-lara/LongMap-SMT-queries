; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92766 () Bool)

(assert start!92766)

(declare-fun b!1053826 () Bool)

(declare-fun e!598417 () Bool)

(assert (=> b!1053826 (= e!598417 true)))

(declare-datatypes ((array!66382 0))(
  ( (array!66383 (arr!31924 (Array (_ BitVec 32) (_ BitVec 64))) (size!32461 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66382)

(declare-fun lt!465317 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1053826 (not (= (select (arr!31924 a!3488) lt!465317) k0!2747))))

(declare-datatypes ((Unit!34489 0))(
  ( (Unit!34490) )
))
(declare-fun lt!465313 () Unit!34489)

(declare-datatypes ((List!22206 0))(
  ( (Nil!22203) (Cons!22202 (h!23420 (_ BitVec 64)) (t!31505 List!22206)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66382 (_ BitVec 64) (_ BitVec 32) List!22206) Unit!34489)

(assert (=> b!1053826 (= lt!465313 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!465317 Nil!22203))))

(declare-fun lt!465312 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053826 (arrayContainsKey!0 a!3488 k0!2747 lt!465312)))

(declare-fun lt!465316 () Unit!34489)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66382 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34489)

(assert (=> b!1053826 (= lt!465316 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!465312))))

(assert (=> b!1053826 (= lt!465312 (bvadd #b00000000000000000000000000000001 lt!465317))))

(declare-fun arrayNoDuplicates!0 (array!66382 (_ BitVec 32) List!22206) Bool)

(assert (=> b!1053826 (arrayNoDuplicates!0 a!3488 lt!465317 Nil!22203)))

(declare-fun lt!465315 () Unit!34489)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66382 (_ BitVec 32) (_ BitVec 32)) Unit!34489)

(assert (=> b!1053826 (= lt!465315 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465317))))

(declare-fun b!1053827 () Bool)

(declare-fun e!598421 () Bool)

(assert (=> b!1053827 (= e!598421 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1053829 () Bool)

(declare-fun e!598418 () Bool)

(assert (=> b!1053829 (= e!598418 e!598421)))

(declare-fun res!702150 () Bool)

(assert (=> b!1053829 (=> res!702150 e!598421)))

(assert (=> b!1053829 (= res!702150 (or (bvsgt lt!465317 i!1381) (bvsle i!1381 lt!465317)))))

(declare-fun b!1053830 () Bool)

(declare-fun res!702148 () Bool)

(declare-fun e!598420 () Bool)

(assert (=> b!1053830 (=> (not res!702148) (not e!598420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053830 (= res!702148 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053831 () Bool)

(declare-fun e!598419 () Bool)

(assert (=> b!1053831 (= e!598419 (not e!598417))))

(declare-fun res!702154 () Bool)

(assert (=> b!1053831 (=> res!702154 e!598417)))

(assert (=> b!1053831 (= res!702154 (or (bvsgt lt!465317 i!1381) (bvsle i!1381 lt!465317)))))

(assert (=> b!1053831 e!598418))

(declare-fun res!702153 () Bool)

(assert (=> b!1053831 (=> (not res!702153) (not e!598418))))

(assert (=> b!1053831 (= res!702153 (= (select (store (arr!31924 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465317) k0!2747))))

(declare-fun b!1053832 () Bool)

(declare-fun res!702151 () Bool)

(assert (=> b!1053832 (=> (not res!702151) (not e!598420))))

(assert (=> b!1053832 (= res!702151 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22203))))

(declare-fun b!1053833 () Bool)

(declare-fun res!702147 () Bool)

(assert (=> b!1053833 (=> (not res!702147) (not e!598420))))

(assert (=> b!1053833 (= res!702147 (= (select (arr!31924 a!3488) i!1381) k0!2747))))

(declare-fun b!1053834 () Bool)

(declare-fun e!598423 () Bool)

(assert (=> b!1053834 (= e!598420 e!598423)))

(declare-fun res!702152 () Bool)

(assert (=> b!1053834 (=> (not res!702152) (not e!598423))))

(declare-fun lt!465314 () array!66382)

(assert (=> b!1053834 (= res!702152 (arrayContainsKey!0 lt!465314 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053834 (= lt!465314 (array!66383 (store (arr!31924 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32461 a!3488)))))

(declare-fun b!1053828 () Bool)

(assert (=> b!1053828 (= e!598423 e!598419)))

(declare-fun res!702155 () Bool)

(assert (=> b!1053828 (=> (not res!702155) (not e!598419))))

(assert (=> b!1053828 (= res!702155 (not (= lt!465317 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66382 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053828 (= lt!465317 (arrayScanForKey!0 lt!465314 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!702149 () Bool)

(assert (=> start!92766 (=> (not res!702149) (not e!598420))))

(assert (=> start!92766 (= res!702149 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32461 a!3488)) (bvslt (size!32461 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92766 e!598420))

(assert (=> start!92766 true))

(declare-fun array_inv!24706 (array!66382) Bool)

(assert (=> start!92766 (array_inv!24706 a!3488)))

(assert (= (and start!92766 res!702149) b!1053832))

(assert (= (and b!1053832 res!702151) b!1053830))

(assert (= (and b!1053830 res!702148) b!1053833))

(assert (= (and b!1053833 res!702147) b!1053834))

(assert (= (and b!1053834 res!702152) b!1053828))

(assert (= (and b!1053828 res!702155) b!1053831))

(assert (= (and b!1053831 res!702153) b!1053829))

(assert (= (and b!1053829 (not res!702150)) b!1053827))

(assert (= (and b!1053831 (not res!702154)) b!1053826))

(declare-fun m!974555 () Bool)

(assert (=> b!1053831 m!974555))

(declare-fun m!974557 () Bool)

(assert (=> b!1053831 m!974557))

(declare-fun m!974559 () Bool)

(assert (=> b!1053828 m!974559))

(declare-fun m!974561 () Bool)

(assert (=> b!1053830 m!974561))

(declare-fun m!974563 () Bool)

(assert (=> b!1053832 m!974563))

(declare-fun m!974565 () Bool)

(assert (=> b!1053826 m!974565))

(declare-fun m!974567 () Bool)

(assert (=> b!1053826 m!974567))

(declare-fun m!974569 () Bool)

(assert (=> b!1053826 m!974569))

(declare-fun m!974571 () Bool)

(assert (=> b!1053826 m!974571))

(declare-fun m!974573 () Bool)

(assert (=> b!1053826 m!974573))

(declare-fun m!974575 () Bool)

(assert (=> b!1053826 m!974575))

(declare-fun m!974577 () Bool)

(assert (=> b!1053833 m!974577))

(declare-fun m!974579 () Bool)

(assert (=> b!1053827 m!974579))

(declare-fun m!974581 () Bool)

(assert (=> start!92766 m!974581))

(declare-fun m!974583 () Bool)

(assert (=> b!1053834 m!974583))

(assert (=> b!1053834 m!974555))

(check-sat (not b!1053834) (not b!1053827) (not b!1053830) (not b!1053828) (not start!92766) (not b!1053832) (not b!1053826))
(check-sat)
