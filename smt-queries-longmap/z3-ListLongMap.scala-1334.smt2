; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26562 () Bool)

(assert start!26562)

(declare-fun b!275785 () Bool)

(declare-fun e!176330 () Bool)

(assert (=> b!275785 (= e!176330 (not true))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((array!13658 0))(
  ( (array!13659 (arr!6478 (Array (_ BitVec 32) (_ BitVec 64))) (size!6830 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13658)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13658 (_ BitVec 32)) Bool)

(assert (=> b!275785 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13659 (store (arr!6478 a!3325) i!1267 k0!2581) (size!6830 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8669 0))(
  ( (Unit!8670) )
))
(declare-fun lt!137519 () Unit!8669)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13658 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8669)

(assert (=> b!275785 (= lt!137519 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275786 () Bool)

(declare-fun res!139755 () Bool)

(assert (=> b!275786 (=> (not res!139755) (not e!176330))))

(assert (=> b!275786 (= res!139755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275787 () Bool)

(declare-fun res!139757 () Bool)

(assert (=> b!275787 (=> (not res!139757) (not e!176330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275787 (= res!139757 (not (validKeyInArray!0 (select (arr!6478 a!3325) startIndex!26))))))

(declare-fun res!139750 () Bool)

(declare-fun e!176329 () Bool)

(assert (=> start!26562 (=> (not res!139750) (not e!176329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26562 (= res!139750 (validMask!0 mask!3868))))

(assert (=> start!26562 e!176329))

(declare-fun array_inv!4428 (array!13658) Bool)

(assert (=> start!26562 (array_inv!4428 a!3325)))

(assert (=> start!26562 true))

(declare-fun b!275788 () Bool)

(declare-fun res!139752 () Bool)

(assert (=> b!275788 (=> (not res!139752) (not e!176329))))

(declare-datatypes ((List!4199 0))(
  ( (Nil!4196) (Cons!4195 (h!4862 (_ BitVec 64)) (t!9273 List!4199)) )
))
(declare-fun arrayNoDuplicates!0 (array!13658 (_ BitVec 32) List!4199) Bool)

(assert (=> b!275788 (= res!139752 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4196))))

(declare-fun b!275789 () Bool)

(declare-fun res!139754 () Bool)

(assert (=> b!275789 (=> (not res!139754) (not e!176329))))

(assert (=> b!275789 (= res!139754 (validKeyInArray!0 k0!2581))))

(declare-fun b!275790 () Bool)

(declare-fun res!139758 () Bool)

(assert (=> b!275790 (=> (not res!139758) (not e!176330))))

(assert (=> b!275790 (= res!139758 (not (= startIndex!26 i!1267)))))

(declare-fun b!275791 () Bool)

(assert (=> b!275791 (= e!176329 e!176330)))

(declare-fun res!139753 () Bool)

(assert (=> b!275791 (=> (not res!139753) (not e!176330))))

(declare-datatypes ((SeekEntryResult!1601 0))(
  ( (MissingZero!1601 (index!8574 (_ BitVec 32))) (Found!1601 (index!8575 (_ BitVec 32))) (Intermediate!1601 (undefined!2413 Bool) (index!8576 (_ BitVec 32)) (x!26958 (_ BitVec 32))) (Undefined!1601) (MissingVacant!1601 (index!8577 (_ BitVec 32))) )
))
(declare-fun lt!137520 () SeekEntryResult!1601)

(assert (=> b!275791 (= res!139753 (or (= lt!137520 (MissingZero!1601 i!1267)) (= lt!137520 (MissingVacant!1601 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13658 (_ BitVec 32)) SeekEntryResult!1601)

(assert (=> b!275791 (= lt!137520 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275792 () Bool)

(declare-fun res!139756 () Bool)

(assert (=> b!275792 (=> (not res!139756) (not e!176330))))

(assert (=> b!275792 (= res!139756 (and (bvslt startIndex!26 (bvsub (size!6830 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275793 () Bool)

(declare-fun res!139751 () Bool)

(assert (=> b!275793 (=> (not res!139751) (not e!176329))))

(declare-fun arrayContainsKey!0 (array!13658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275793 (= res!139751 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275794 () Bool)

(declare-fun res!139749 () Bool)

(assert (=> b!275794 (=> (not res!139749) (not e!176329))))

(assert (=> b!275794 (= res!139749 (and (= (size!6830 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6830 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6830 a!3325))))))

(assert (= (and start!26562 res!139750) b!275794))

(assert (= (and b!275794 res!139749) b!275789))

(assert (= (and b!275789 res!139754) b!275788))

(assert (= (and b!275788 res!139752) b!275793))

(assert (= (and b!275793 res!139751) b!275791))

(assert (= (and b!275791 res!139753) b!275786))

(assert (= (and b!275786 res!139755) b!275790))

(assert (= (and b!275790 res!139758) b!275787))

(assert (= (and b!275787 res!139757) b!275792))

(assert (= (and b!275792 res!139756) b!275785))

(declare-fun m!291443 () Bool)

(assert (=> b!275793 m!291443))

(declare-fun m!291445 () Bool)

(assert (=> b!275786 m!291445))

(declare-fun m!291447 () Bool)

(assert (=> b!275791 m!291447))

(declare-fun m!291449 () Bool)

(assert (=> b!275788 m!291449))

(declare-fun m!291451 () Bool)

(assert (=> b!275789 m!291451))

(declare-fun m!291453 () Bool)

(assert (=> b!275787 m!291453))

(assert (=> b!275787 m!291453))

(declare-fun m!291455 () Bool)

(assert (=> b!275787 m!291455))

(declare-fun m!291457 () Bool)

(assert (=> b!275785 m!291457))

(declare-fun m!291459 () Bool)

(assert (=> b!275785 m!291459))

(declare-fun m!291461 () Bool)

(assert (=> b!275785 m!291461))

(declare-fun m!291463 () Bool)

(assert (=> start!26562 m!291463))

(declare-fun m!291465 () Bool)

(assert (=> start!26562 m!291465))

(check-sat (not b!275793) (not b!275785) (not start!26562) (not b!275791) (not b!275788) (not b!275786) (not b!275789) (not b!275787))
(check-sat)
