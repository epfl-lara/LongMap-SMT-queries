; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26582 () Bool)

(assert start!26582)

(declare-fun b!275982 () Bool)

(declare-fun res!139977 () Bool)

(declare-fun e!176395 () Bool)

(assert (=> b!275982 (=> (not res!139977) (not e!176395))))

(declare-datatypes ((array!13679 0))(
  ( (array!13680 (arr!6489 (Array (_ BitVec 32) (_ BitVec 64))) (size!6841 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13679)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275982 (= res!139977 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275983 () Bool)

(declare-fun e!176394 () Bool)

(assert (=> b!275983 (= e!176394 false)))

(declare-fun lt!137520 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13679 (_ BitVec 32)) Bool)

(assert (=> b!275983 (= lt!137520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139975 () Bool)

(assert (=> start!26582 (=> (not res!139975) (not e!176395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26582 (= res!139975 (validMask!0 mask!3868))))

(assert (=> start!26582 e!176395))

(declare-fun array_inv!4452 (array!13679) Bool)

(assert (=> start!26582 (array_inv!4452 a!3325)))

(assert (=> start!26582 true))

(declare-fun b!275984 () Bool)

(declare-fun res!139972 () Bool)

(assert (=> b!275984 (=> (not res!139972) (not e!176395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275984 (= res!139972 (validKeyInArray!0 k0!2581))))

(declare-fun b!275985 () Bool)

(declare-fun res!139974 () Bool)

(assert (=> b!275985 (=> (not res!139974) (not e!176395))))

(declare-datatypes ((List!4297 0))(
  ( (Nil!4294) (Cons!4293 (h!4960 (_ BitVec 64)) (t!9379 List!4297)) )
))
(declare-fun arrayNoDuplicates!0 (array!13679 (_ BitVec 32) List!4297) Bool)

(assert (=> b!275985 (= res!139974 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4294))))

(declare-fun b!275986 () Bool)

(declare-fun res!139973 () Bool)

(assert (=> b!275986 (=> (not res!139973) (not e!176395))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275986 (= res!139973 (and (= (size!6841 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6841 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6841 a!3325))))))

(declare-fun b!275987 () Bool)

(assert (=> b!275987 (= e!176395 e!176394)))

(declare-fun res!139976 () Bool)

(assert (=> b!275987 (=> (not res!139976) (not e!176394))))

(declare-datatypes ((SeekEntryResult!1647 0))(
  ( (MissingZero!1647 (index!8758 (_ BitVec 32))) (Found!1647 (index!8759 (_ BitVec 32))) (Intermediate!1647 (undefined!2459 Bool) (index!8760 (_ BitVec 32)) (x!27028 (_ BitVec 32))) (Undefined!1647) (MissingVacant!1647 (index!8761 (_ BitVec 32))) )
))
(declare-fun lt!137521 () SeekEntryResult!1647)

(assert (=> b!275987 (= res!139976 (or (= lt!137521 (MissingZero!1647 i!1267)) (= lt!137521 (MissingVacant!1647 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13679 (_ BitVec 32)) SeekEntryResult!1647)

(assert (=> b!275987 (= lt!137521 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26582 res!139975) b!275986))

(assert (= (and b!275986 res!139973) b!275984))

(assert (= (and b!275984 res!139972) b!275985))

(assert (= (and b!275985 res!139974) b!275982))

(assert (= (and b!275982 res!139977) b!275987))

(assert (= (and b!275987 res!139976) b!275983))

(declare-fun m!291437 () Bool)

(assert (=> b!275982 m!291437))

(declare-fun m!291439 () Bool)

(assert (=> b!275983 m!291439))

(declare-fun m!291441 () Bool)

(assert (=> b!275987 m!291441))

(declare-fun m!291443 () Bool)

(assert (=> b!275984 m!291443))

(declare-fun m!291445 () Bool)

(assert (=> b!275985 m!291445))

(declare-fun m!291447 () Bool)

(assert (=> start!26582 m!291447))

(declare-fun m!291449 () Bool)

(assert (=> start!26582 m!291449))

(check-sat (not b!275984) (not b!275985) (not b!275987) (not start!26582) (not b!275982) (not b!275983))
(check-sat)
