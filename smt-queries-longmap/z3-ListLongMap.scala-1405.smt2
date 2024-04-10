; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27284 () Bool)

(assert start!27284)

(declare-fun b!282660 () Bool)

(declare-fun e!179412 () Bool)

(declare-fun e!179411 () Bool)

(assert (=> b!282660 (= e!179412 e!179411)))

(declare-fun res!145737 () Bool)

(assert (=> b!282660 (=> (not res!145737) (not e!179411))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282660 (= res!145737 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14102 0))(
  ( (array!14103 (arr!6693 (Array (_ BitVec 32) (_ BitVec 64))) (size!7045 (_ BitVec 32))) )
))
(declare-fun lt!139670 () array!14102)

(declare-fun a!3325 () array!14102)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!282660 (= lt!139670 (array!14103 (store (arr!6693 a!3325) i!1267 k0!2581) (size!7045 a!3325)))))

(declare-fun b!282661 () Bool)

(declare-fun res!145734 () Bool)

(declare-fun e!179414 () Bool)

(assert (=> b!282661 (=> (not res!145734) (not e!179414))))

(declare-fun arrayContainsKey!0 (array!14102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282661 (= res!145734 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282662 () Bool)

(declare-fun res!145736 () Bool)

(assert (=> b!282662 (=> (not res!145736) (not e!179411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282662 (= res!145736 (validKeyInArray!0 (select (arr!6693 a!3325) startIndex!26)))))

(declare-fun b!282663 () Bool)

(declare-fun res!145732 () Bool)

(assert (=> b!282663 (=> (not res!145732) (not e!179412))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14102 (_ BitVec 32)) Bool)

(assert (=> b!282663 (= res!145732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282664 () Bool)

(assert (=> b!282664 (= e!179411 (not true))))

(assert (=> b!282664 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8986 0))(
  ( (Unit!8987) )
))
(declare-fun lt!139668 () Unit!8986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8986)

(assert (=> b!282664 (= lt!139668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1851 0))(
  ( (MissingZero!1851 (index!9574 (_ BitVec 32))) (Found!1851 (index!9575 (_ BitVec 32))) (Intermediate!1851 (undefined!2663 Bool) (index!9576 (_ BitVec 32)) (x!27785 (_ BitVec 32))) (Undefined!1851) (MissingVacant!1851 (index!9577 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14102 (_ BitVec 32)) SeekEntryResult!1851)

(assert (=> b!282664 (= (seekEntryOrOpen!0 (select (arr!6693 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6693 a!3325) i!1267 k0!2581) startIndex!26) lt!139670 mask!3868))))

(declare-fun lt!139672 () Unit!8986)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14102 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8986)

(assert (=> b!282664 (= lt!139672 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4501 0))(
  ( (Nil!4498) (Cons!4497 (h!5167 (_ BitVec 64)) (t!9583 List!4501)) )
))
(declare-fun arrayNoDuplicates!0 (array!14102 (_ BitVec 32) List!4501) Bool)

(assert (=> b!282664 (arrayNoDuplicates!0 lt!139670 #b00000000000000000000000000000000 Nil!4498)))

(declare-fun lt!139671 () Unit!8986)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14102 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4501) Unit!8986)

(assert (=> b!282664 (= lt!139671 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4498))))

(declare-fun res!145730 () Bool)

(assert (=> start!27284 (=> (not res!145730) (not e!179414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27284 (= res!145730 (validMask!0 mask!3868))))

(assert (=> start!27284 e!179414))

(declare-fun array_inv!4656 (array!14102) Bool)

(assert (=> start!27284 (array_inv!4656 a!3325)))

(assert (=> start!27284 true))

(declare-fun b!282665 () Bool)

(declare-fun res!145735 () Bool)

(assert (=> b!282665 (=> (not res!145735) (not e!179414))))

(assert (=> b!282665 (= res!145735 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4498))))

(declare-fun b!282666 () Bool)

(declare-fun res!145731 () Bool)

(assert (=> b!282666 (=> (not res!145731) (not e!179414))))

(assert (=> b!282666 (= res!145731 (and (= (size!7045 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7045 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7045 a!3325))))))

(declare-fun b!282667 () Bool)

(assert (=> b!282667 (= e!179414 e!179412)))

(declare-fun res!145733 () Bool)

(assert (=> b!282667 (=> (not res!145733) (not e!179412))))

(declare-fun lt!139669 () SeekEntryResult!1851)

(assert (=> b!282667 (= res!145733 (or (= lt!139669 (MissingZero!1851 i!1267)) (= lt!139669 (MissingVacant!1851 i!1267))))))

(assert (=> b!282667 (= lt!139669 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282668 () Bool)

(declare-fun res!145729 () Bool)

(assert (=> b!282668 (=> (not res!145729) (not e!179414))))

(assert (=> b!282668 (= res!145729 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27284 res!145730) b!282666))

(assert (= (and b!282666 res!145731) b!282668))

(assert (= (and b!282668 res!145729) b!282665))

(assert (= (and b!282665 res!145735) b!282661))

(assert (= (and b!282661 res!145734) b!282667))

(assert (= (and b!282667 res!145733) b!282663))

(assert (= (and b!282663 res!145732) b!282660))

(assert (= (and b!282660 res!145737) b!282662))

(assert (= (and b!282662 res!145736) b!282664))

(declare-fun m!297303 () Bool)

(assert (=> b!282661 m!297303))

(declare-fun m!297305 () Bool)

(assert (=> b!282668 m!297305))

(declare-fun m!297307 () Bool)

(assert (=> b!282662 m!297307))

(assert (=> b!282662 m!297307))

(declare-fun m!297309 () Bool)

(assert (=> b!282662 m!297309))

(declare-fun m!297311 () Bool)

(assert (=> b!282660 m!297311))

(declare-fun m!297313 () Bool)

(assert (=> b!282664 m!297313))

(declare-fun m!297315 () Bool)

(assert (=> b!282664 m!297315))

(declare-fun m!297317 () Bool)

(assert (=> b!282664 m!297317))

(assert (=> b!282664 m!297315))

(assert (=> b!282664 m!297311))

(assert (=> b!282664 m!297307))

(declare-fun m!297319 () Bool)

(assert (=> b!282664 m!297319))

(declare-fun m!297321 () Bool)

(assert (=> b!282664 m!297321))

(assert (=> b!282664 m!297307))

(declare-fun m!297323 () Bool)

(assert (=> b!282664 m!297323))

(declare-fun m!297325 () Bool)

(assert (=> b!282664 m!297325))

(declare-fun m!297327 () Bool)

(assert (=> b!282664 m!297327))

(declare-fun m!297329 () Bool)

(assert (=> b!282665 m!297329))

(declare-fun m!297331 () Bool)

(assert (=> b!282667 m!297331))

(declare-fun m!297333 () Bool)

(assert (=> start!27284 m!297333))

(declare-fun m!297335 () Bool)

(assert (=> start!27284 m!297335))

(declare-fun m!297337 () Bool)

(assert (=> b!282663 m!297337))

(check-sat (not b!282662) (not b!282665) (not b!282661) (not start!27284) (not b!282664) (not b!282667) (not b!282663) (not b!282668))
(check-sat)
