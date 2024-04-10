; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92534 () Bool)

(assert start!92534)

(declare-fun b!1052538 () Bool)

(declare-fun e!597596 () Bool)

(declare-fun e!597598 () Bool)

(assert (=> b!1052538 (= e!597596 e!597598)))

(declare-fun res!701670 () Bool)

(assert (=> b!1052538 (=> (not res!701670) (not e!597598))))

(declare-datatypes ((array!66335 0))(
  ( (array!66336 (arr!31907 (Array (_ BitVec 32) (_ BitVec 64))) (size!32443 (_ BitVec 32))) )
))
(declare-fun lt!464818 () array!66335)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052538 (= res!701670 (arrayContainsKey!0 lt!464818 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66335)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052538 (= lt!464818 (array!66336 (store (arr!31907 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32443 a!3488)))))

(declare-fun b!1052539 () Bool)

(declare-fun e!597597 () Bool)

(assert (=> b!1052539 (= e!597597 true)))

(declare-fun lt!464820 () (_ BitVec 32))

(assert (=> b!1052539 (not (= (select (arr!31907 a!3488) lt!464820) k0!2747))))

(declare-datatypes ((Unit!34486 0))(
  ( (Unit!34487) )
))
(declare-fun lt!464815 () Unit!34486)

(declare-datatypes ((List!22219 0))(
  ( (Nil!22216) (Cons!22215 (h!23424 (_ BitVec 64)) (t!31526 List!22219)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66335 (_ BitVec 64) (_ BitVec 32) List!22219) Unit!34486)

(assert (=> b!1052539 (= lt!464815 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!464820 Nil!22216))))

(declare-fun lt!464819 () (_ BitVec 32))

(assert (=> b!1052539 (arrayContainsKey!0 a!3488 k0!2747 lt!464819)))

(declare-fun lt!464817 () Unit!34486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66335 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34486)

(assert (=> b!1052539 (= lt!464817 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464819))))

(assert (=> b!1052539 (= lt!464819 (bvadd #b00000000000000000000000000000001 lt!464820))))

(declare-fun arrayNoDuplicates!0 (array!66335 (_ BitVec 32) List!22219) Bool)

(assert (=> b!1052539 (arrayNoDuplicates!0 a!3488 lt!464820 Nil!22216)))

(declare-fun lt!464816 () Unit!34486)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66335 (_ BitVec 32) (_ BitVec 32)) Unit!34486)

(assert (=> b!1052539 (= lt!464816 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464820))))

(declare-fun b!1052540 () Bool)

(declare-fun e!597601 () Bool)

(assert (=> b!1052540 (= e!597598 e!597601)))

(declare-fun res!701672 () Bool)

(assert (=> b!1052540 (=> (not res!701672) (not e!597601))))

(assert (=> b!1052540 (= res!701672 (not (= lt!464820 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66335 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052540 (= lt!464820 (arrayScanForKey!0 lt!464818 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052541 () Bool)

(declare-fun res!701667 () Bool)

(assert (=> b!1052541 (=> (not res!701667) (not e!597596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052541 (= res!701667 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052542 () Bool)

(declare-fun e!597595 () Bool)

(assert (=> b!1052542 (= e!597595 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052543 () Bool)

(declare-fun e!597600 () Bool)

(assert (=> b!1052543 (= e!597600 e!597595)))

(declare-fun res!701671 () Bool)

(assert (=> b!1052543 (=> res!701671 e!597595)))

(assert (=> b!1052543 (= res!701671 (or (bvsgt lt!464820 i!1381) (bvsle i!1381 lt!464820)))))

(declare-fun res!701669 () Bool)

(assert (=> start!92534 (=> (not res!701669) (not e!597596))))

(assert (=> start!92534 (= res!701669 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32443 a!3488)) (bvslt (size!32443 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92534 e!597596))

(assert (=> start!92534 true))

(declare-fun array_inv!24687 (array!66335) Bool)

(assert (=> start!92534 (array_inv!24687 a!3488)))

(declare-fun b!1052544 () Bool)

(assert (=> b!1052544 (= e!597601 (not e!597597))))

(declare-fun res!701664 () Bool)

(assert (=> b!1052544 (=> res!701664 e!597597)))

(assert (=> b!1052544 (= res!701664 (or (bvsgt lt!464820 i!1381) (bvsle i!1381 lt!464820)))))

(assert (=> b!1052544 e!597600))

(declare-fun res!701665 () Bool)

(assert (=> b!1052544 (=> (not res!701665) (not e!597600))))

(assert (=> b!1052544 (= res!701665 (= (select (store (arr!31907 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464820) k0!2747))))

(declare-fun b!1052545 () Bool)

(declare-fun res!701668 () Bool)

(assert (=> b!1052545 (=> (not res!701668) (not e!597596))))

(assert (=> b!1052545 (= res!701668 (= (select (arr!31907 a!3488) i!1381) k0!2747))))

(declare-fun b!1052546 () Bool)

(declare-fun res!701666 () Bool)

(assert (=> b!1052546 (=> (not res!701666) (not e!597596))))

(assert (=> b!1052546 (= res!701666 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22216))))

(assert (= (and start!92534 res!701669) b!1052546))

(assert (= (and b!1052546 res!701666) b!1052541))

(assert (= (and b!1052541 res!701667) b!1052545))

(assert (= (and b!1052545 res!701668) b!1052538))

(assert (= (and b!1052538 res!701670) b!1052540))

(assert (= (and b!1052540 res!701672) b!1052544))

(assert (= (and b!1052544 res!701665) b!1052543))

(assert (= (and b!1052543 (not res!701671)) b!1052542))

(assert (= (and b!1052544 (not res!701664)) b!1052539))

(declare-fun m!972917 () Bool)

(assert (=> start!92534 m!972917))

(declare-fun m!972919 () Bool)

(assert (=> b!1052538 m!972919))

(declare-fun m!972921 () Bool)

(assert (=> b!1052538 m!972921))

(declare-fun m!972923 () Bool)

(assert (=> b!1052546 m!972923))

(declare-fun m!972925 () Bool)

(assert (=> b!1052541 m!972925))

(declare-fun m!972927 () Bool)

(assert (=> b!1052542 m!972927))

(declare-fun m!972929 () Bool)

(assert (=> b!1052539 m!972929))

(declare-fun m!972931 () Bool)

(assert (=> b!1052539 m!972931))

(declare-fun m!972933 () Bool)

(assert (=> b!1052539 m!972933))

(declare-fun m!972935 () Bool)

(assert (=> b!1052539 m!972935))

(declare-fun m!972937 () Bool)

(assert (=> b!1052539 m!972937))

(declare-fun m!972939 () Bool)

(assert (=> b!1052539 m!972939))

(assert (=> b!1052544 m!972921))

(declare-fun m!972941 () Bool)

(assert (=> b!1052544 m!972941))

(declare-fun m!972943 () Bool)

(assert (=> b!1052545 m!972943))

(declare-fun m!972945 () Bool)

(assert (=> b!1052540 m!972945))

(check-sat (not b!1052540) (not b!1052539) (not b!1052538) (not start!92534) (not b!1052541) (not b!1052542) (not b!1052546))
(check-sat)
