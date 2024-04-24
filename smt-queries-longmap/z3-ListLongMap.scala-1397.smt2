; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27234 () Bool)

(assert start!27234)

(declare-fun res!145076 () Bool)

(declare-fun e!179137 () Bool)

(assert (=> start!27234 (=> (not res!145076) (not e!179137))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27234 (= res!145076 (validMask!0 mask!3868))))

(assert (=> start!27234 e!179137))

(declare-datatypes ((array!14051 0))(
  ( (array!14052 (arr!6667 (Array (_ BitVec 32) (_ BitVec 64))) (size!7019 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14051)

(declare-fun array_inv!4617 (array!14051) Bool)

(assert (=> start!27234 (array_inv!4617 a!3325)))

(assert (=> start!27234 true))

(declare-fun b!282032 () Bool)

(declare-fun res!145082 () Bool)

(assert (=> b!282032 (=> (not res!145082) (not e!179137))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282032 (= res!145082 (and (= (size!7019 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7019 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7019 a!3325))))))

(declare-fun b!282033 () Bool)

(declare-fun res!145075 () Bool)

(declare-fun e!179138 () Bool)

(assert (=> b!282033 (=> (not res!145075) (not e!179138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14051 (_ BitVec 32)) Bool)

(assert (=> b!282033 (= res!145075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282034 () Bool)

(declare-fun e!179135 () Bool)

(assert (=> b!282034 (= e!179138 e!179135)))

(declare-fun res!145081 () Bool)

(assert (=> b!282034 (=> (not res!145081) (not e!179135))))

(assert (=> b!282034 (= res!145081 (not (= startIndex!26 i!1267)))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139352 () array!14051)

(assert (=> b!282034 (= lt!139352 (array!14052 (store (arr!6667 a!3325) i!1267 k0!2581) (size!7019 a!3325)))))

(declare-fun b!282035 () Bool)

(declare-fun res!145077 () Bool)

(assert (=> b!282035 (=> (not res!145077) (not e!179137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282035 (= res!145077 (validKeyInArray!0 k0!2581))))

(declare-fun b!282036 () Bool)

(assert (=> b!282036 (= e!179137 e!179138)))

(declare-fun res!145079 () Bool)

(assert (=> b!282036 (=> (not res!145079) (not e!179138))))

(declare-datatypes ((SeekEntryResult!1790 0))(
  ( (MissingZero!1790 (index!9330 (_ BitVec 32))) (Found!1790 (index!9331 (_ BitVec 32))) (Intermediate!1790 (undefined!2602 Bool) (index!9332 (_ BitVec 32)) (x!27660 (_ BitVec 32))) (Undefined!1790) (MissingVacant!1790 (index!9333 (_ BitVec 32))) )
))
(declare-fun lt!139356 () SeekEntryResult!1790)

(assert (=> b!282036 (= res!145079 (or (= lt!139356 (MissingZero!1790 i!1267)) (= lt!139356 (MissingVacant!1790 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14051 (_ BitVec 32)) SeekEntryResult!1790)

(assert (=> b!282036 (= lt!139356 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282037 () Bool)

(declare-fun res!145080 () Bool)

(assert (=> b!282037 (=> (not res!145080) (not e!179137))))

(declare-datatypes ((List!4388 0))(
  ( (Nil!4385) (Cons!4384 (h!5054 (_ BitVec 64)) (t!9462 List!4388)) )
))
(declare-fun arrayNoDuplicates!0 (array!14051 (_ BitVec 32) List!4388) Bool)

(assert (=> b!282037 (= res!145080 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4385))))

(declare-fun b!282038 () Bool)

(declare-fun res!145083 () Bool)

(assert (=> b!282038 (=> (not res!145083) (not e!179135))))

(assert (=> b!282038 (= res!145083 (validKeyInArray!0 (select (arr!6667 a!3325) startIndex!26)))))

(declare-fun b!282039 () Bool)

(assert (=> b!282039 (= e!179135 (not true))))

(assert (=> b!282039 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8910 0))(
  ( (Unit!8911) )
))
(declare-fun lt!139353 () Unit!8910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8910)

(assert (=> b!282039 (= lt!139353 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282039 (= (seekEntryOrOpen!0 (select (arr!6667 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6667 a!3325) i!1267 k0!2581) startIndex!26) lt!139352 mask!3868))))

(declare-fun lt!139355 () Unit!8910)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14051 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8910)

(assert (=> b!282039 (= lt!139355 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282039 (arrayNoDuplicates!0 lt!139352 #b00000000000000000000000000000000 Nil!4385)))

(declare-fun lt!139354 () Unit!8910)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14051 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4388) Unit!8910)

(assert (=> b!282039 (= lt!139354 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4385))))

(declare-fun b!282040 () Bool)

(declare-fun res!145078 () Bool)

(assert (=> b!282040 (=> (not res!145078) (not e!179137))))

(declare-fun arrayContainsKey!0 (array!14051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282040 (= res!145078 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27234 res!145076) b!282032))

(assert (= (and b!282032 res!145082) b!282035))

(assert (= (and b!282035 res!145077) b!282037))

(assert (= (and b!282037 res!145080) b!282040))

(assert (= (and b!282040 res!145078) b!282036))

(assert (= (and b!282036 res!145079) b!282033))

(assert (= (and b!282033 res!145075) b!282034))

(assert (= (and b!282034 res!145081) b!282038))

(assert (= (and b!282038 res!145083) b!282039))

(declare-fun m!296609 () Bool)

(assert (=> b!282040 m!296609))

(declare-fun m!296611 () Bool)

(assert (=> start!27234 m!296611))

(declare-fun m!296613 () Bool)

(assert (=> start!27234 m!296613))

(declare-fun m!296615 () Bool)

(assert (=> b!282035 m!296615))

(declare-fun m!296617 () Bool)

(assert (=> b!282038 m!296617))

(assert (=> b!282038 m!296617))

(declare-fun m!296619 () Bool)

(assert (=> b!282038 m!296619))

(declare-fun m!296621 () Bool)

(assert (=> b!282033 m!296621))

(declare-fun m!296623 () Bool)

(assert (=> b!282039 m!296623))

(declare-fun m!296625 () Bool)

(assert (=> b!282039 m!296625))

(declare-fun m!296627 () Bool)

(assert (=> b!282039 m!296627))

(assert (=> b!282039 m!296617))

(declare-fun m!296629 () Bool)

(assert (=> b!282039 m!296629))

(declare-fun m!296631 () Bool)

(assert (=> b!282039 m!296631))

(declare-fun m!296633 () Bool)

(assert (=> b!282039 m!296633))

(declare-fun m!296635 () Bool)

(assert (=> b!282039 m!296635))

(assert (=> b!282039 m!296617))

(declare-fun m!296637 () Bool)

(assert (=> b!282039 m!296637))

(assert (=> b!282039 m!296625))

(declare-fun m!296639 () Bool)

(assert (=> b!282039 m!296639))

(declare-fun m!296641 () Bool)

(assert (=> b!282036 m!296641))

(assert (=> b!282034 m!296635))

(declare-fun m!296643 () Bool)

(assert (=> b!282037 m!296643))

(check-sat (not b!282040) (not b!282033) (not b!282038) (not b!282035) (not b!282037) (not start!27234) (not b!282036) (not b!282039))
(check-sat)
