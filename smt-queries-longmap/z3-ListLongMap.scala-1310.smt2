; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26420 () Bool)

(assert start!26420)

(declare-fun b!274089 () Bool)

(declare-fun res!138084 () Bool)

(declare-fun e!175547 () Bool)

(assert (=> b!274089 (=> (not res!138084) (not e!175547))))

(declare-datatypes ((array!13517 0))(
  ( (array!13518 (arr!6408 (Array (_ BitVec 32) (_ BitVec 64))) (size!6760 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13517)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274089 (= res!138084 (validKeyInArray!0 (select (arr!6408 a!3325) startIndex!26)))))

(declare-fun b!274090 () Bool)

(declare-fun e!175544 () Bool)

(assert (=> b!274090 (= e!175544 e!175547)))

(declare-fun res!138083 () Bool)

(assert (=> b!274090 (=> (not res!138083) (not e!175547))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274090 (= res!138083 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136747 () array!13517)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!274090 (= lt!136747 (array!13518 (store (arr!6408 a!3325) i!1267 k0!2581) (size!6760 a!3325)))))

(declare-fun b!274091 () Bool)

(declare-fun res!138079 () Bool)

(declare-fun e!175546 () Bool)

(assert (=> b!274091 (=> (not res!138079) (not e!175546))))

(assert (=> b!274091 (= res!138079 (validKeyInArray!0 k0!2581))))

(declare-fun b!274092 () Bool)

(declare-fun res!138081 () Bool)

(assert (=> b!274092 (=> (not res!138081) (not e!175546))))

(declare-datatypes ((List!4216 0))(
  ( (Nil!4213) (Cons!4212 (h!4879 (_ BitVec 64)) (t!9298 List!4216)) )
))
(declare-fun arrayNoDuplicates!0 (array!13517 (_ BitVec 32) List!4216) Bool)

(assert (=> b!274092 (= res!138081 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4213))))

(declare-fun res!138082 () Bool)

(assert (=> start!26420 (=> (not res!138082) (not e!175546))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26420 (= res!138082 (validMask!0 mask!3868))))

(assert (=> start!26420 e!175546))

(declare-fun array_inv!4371 (array!13517) Bool)

(assert (=> start!26420 (array_inv!4371 a!3325)))

(assert (=> start!26420 true))

(declare-fun b!274093 () Bool)

(assert (=> b!274093 (= e!175546 e!175544)))

(declare-fun res!138080 () Bool)

(assert (=> b!274093 (=> (not res!138080) (not e!175544))))

(declare-datatypes ((SeekEntryResult!1566 0))(
  ( (MissingZero!1566 (index!8434 (_ BitVec 32))) (Found!1566 (index!8435 (_ BitVec 32))) (Intermediate!1566 (undefined!2378 Bool) (index!8436 (_ BitVec 32)) (x!26731 (_ BitVec 32))) (Undefined!1566) (MissingVacant!1566 (index!8437 (_ BitVec 32))) )
))
(declare-fun lt!136743 () SeekEntryResult!1566)

(assert (=> b!274093 (= res!138080 (or (= lt!136743 (MissingZero!1566 i!1267)) (= lt!136743 (MissingVacant!1566 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13517 (_ BitVec 32)) SeekEntryResult!1566)

(assert (=> b!274093 (= lt!136743 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274094 () Bool)

(declare-fun res!138086 () Bool)

(assert (=> b!274094 (=> (not res!138086) (not e!175544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13517 (_ BitVec 32)) Bool)

(assert (=> b!274094 (= res!138086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274095 () Bool)

(declare-fun res!138085 () Bool)

(assert (=> b!274095 (=> (not res!138085) (not e!175546))))

(assert (=> b!274095 (= res!138085 (and (= (size!6760 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6760 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6760 a!3325))))))

(declare-fun b!274096 () Bool)

(declare-fun res!138087 () Bool)

(assert (=> b!274096 (=> (not res!138087) (not e!175546))))

(declare-fun arrayContainsKey!0 (array!13517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274096 (= res!138087 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274097 () Bool)

(assert (=> b!274097 (= e!175547 (not true))))

(assert (=> b!274097 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8619 0))(
  ( (Unit!8620) )
))
(declare-fun lt!136745 () Unit!8619)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8619)

(assert (=> b!274097 (= lt!136745 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274097 (= (seekEntryOrOpen!0 (select (arr!6408 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6408 a!3325) i!1267 k0!2581) startIndex!26) lt!136747 mask!3868))))

(declare-fun lt!136746 () Unit!8619)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13517 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8619)

(assert (=> b!274097 (= lt!136746 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274097 (arrayNoDuplicates!0 lt!136747 #b00000000000000000000000000000000 Nil!4213)))

(declare-fun lt!136744 () Unit!8619)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13517 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4216) Unit!8619)

(assert (=> b!274097 (= lt!136744 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4213))))

(assert (= (and start!26420 res!138082) b!274095))

(assert (= (and b!274095 res!138085) b!274091))

(assert (= (and b!274091 res!138079) b!274092))

(assert (= (and b!274092 res!138081) b!274096))

(assert (= (and b!274096 res!138087) b!274093))

(assert (= (and b!274093 res!138080) b!274094))

(assert (= (and b!274094 res!138086) b!274090))

(assert (= (and b!274090 res!138083) b!274089))

(assert (= (and b!274089 res!138084) b!274097))

(declare-fun m!289497 () Bool)

(assert (=> b!274089 m!289497))

(assert (=> b!274089 m!289497))

(declare-fun m!289499 () Bool)

(assert (=> b!274089 m!289499))

(declare-fun m!289501 () Bool)

(assert (=> b!274093 m!289501))

(declare-fun m!289503 () Bool)

(assert (=> b!274090 m!289503))

(declare-fun m!289505 () Bool)

(assert (=> b!274096 m!289505))

(declare-fun m!289507 () Bool)

(assert (=> b!274091 m!289507))

(declare-fun m!289509 () Bool)

(assert (=> start!26420 m!289509))

(declare-fun m!289511 () Bool)

(assert (=> start!26420 m!289511))

(declare-fun m!289513 () Bool)

(assert (=> b!274097 m!289513))

(declare-fun m!289515 () Bool)

(assert (=> b!274097 m!289515))

(declare-fun m!289517 () Bool)

(assert (=> b!274097 m!289517))

(declare-fun m!289519 () Bool)

(assert (=> b!274097 m!289519))

(assert (=> b!274097 m!289517))

(assert (=> b!274097 m!289503))

(declare-fun m!289521 () Bool)

(assert (=> b!274097 m!289521))

(assert (=> b!274097 m!289497))

(declare-fun m!289523 () Bool)

(assert (=> b!274097 m!289523))

(declare-fun m!289525 () Bool)

(assert (=> b!274097 m!289525))

(assert (=> b!274097 m!289497))

(declare-fun m!289527 () Bool)

(assert (=> b!274097 m!289527))

(declare-fun m!289529 () Bool)

(assert (=> b!274092 m!289529))

(declare-fun m!289531 () Bool)

(assert (=> b!274094 m!289531))

(check-sat (not b!274092) (not start!26420) (not b!274091) (not b!274089) (not b!274094) (not b!274093) (not b!274096) (not b!274097))
(check-sat)
