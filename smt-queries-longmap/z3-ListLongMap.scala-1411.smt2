; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27386 () Bool)

(assert start!27386)

(declare-fun b!283431 () Bool)

(declare-fun e!179838 () Bool)

(declare-fun e!179840 () Bool)

(assert (=> b!283431 (= e!179838 e!179840)))

(declare-fun res!146357 () Bool)

(assert (=> b!283431 (=> (not res!146357) (not e!179840))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!283431 (= res!146357 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14141 0))(
  ( (array!14142 (arr!6711 (Array (_ BitVec 32) (_ BitVec 64))) (size!7063 (_ BitVec 32))) )
))
(declare-fun lt!140094 () array!14141)

(declare-fun a!3325 () array!14141)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!283431 (= lt!140094 (array!14142 (store (arr!6711 a!3325) i!1267 k0!2581) (size!7063 a!3325)))))

(declare-fun res!146355 () Bool)

(declare-fun e!179837 () Bool)

(assert (=> start!27386 (=> (not res!146355) (not e!179837))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27386 (= res!146355 (validMask!0 mask!3868))))

(assert (=> start!27386 e!179837))

(declare-fun array_inv!4674 (array!14141) Bool)

(assert (=> start!27386 (array_inv!4674 a!3325)))

(assert (=> start!27386 true))

(declare-fun b!283432 () Bool)

(declare-fun res!146352 () Bool)

(assert (=> b!283432 (=> (not res!146352) (not e!179837))))

(declare-datatypes ((List!4519 0))(
  ( (Nil!4516) (Cons!4515 (h!5185 (_ BitVec 64)) (t!9601 List!4519)) )
))
(declare-fun arrayNoDuplicates!0 (array!14141 (_ BitVec 32) List!4519) Bool)

(assert (=> b!283432 (= res!146352 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4516))))

(declare-fun b!283433 () Bool)

(declare-fun res!146356 () Bool)

(assert (=> b!283433 (=> (not res!146356) (not e!179837))))

(declare-fun arrayContainsKey!0 (array!14141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283433 (= res!146356 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283434 () Bool)

(declare-fun res!146354 () Bool)

(assert (=> b!283434 (=> (not res!146354) (not e!179837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283434 (= res!146354 (validKeyInArray!0 k0!2581))))

(declare-fun b!283435 () Bool)

(declare-fun res!146353 () Bool)

(assert (=> b!283435 (=> (not res!146353) (not e!179837))))

(assert (=> b!283435 (= res!146353 (and (= (size!7063 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7063 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7063 a!3325))))))

(declare-fun b!283436 () Bool)

(assert (=> b!283436 (= e!179840 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14141 (_ BitVec 32)) Bool)

(assert (=> b!283436 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9022 0))(
  ( (Unit!9023) )
))
(declare-fun lt!140095 () Unit!9022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9022)

(assert (=> b!283436 (= lt!140095 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1869 0))(
  ( (MissingZero!1869 (index!9646 (_ BitVec 32))) (Found!1869 (index!9647 (_ BitVec 32))) (Intermediate!1869 (undefined!2681 Bool) (index!9648 (_ BitVec 32)) (x!27851 (_ BitVec 32))) (Undefined!1869) (MissingVacant!1869 (index!9649 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14141 (_ BitVec 32)) SeekEntryResult!1869)

(assert (=> b!283436 (= (seekEntryOrOpen!0 (select (arr!6711 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6711 a!3325) i!1267 k0!2581) startIndex!26) lt!140094 mask!3868))))

(declare-fun lt!140092 () Unit!9022)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14141 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9022)

(assert (=> b!283436 (= lt!140092 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!283436 (arrayNoDuplicates!0 lt!140094 #b00000000000000000000000000000000 Nil!4516)))

(declare-fun lt!140093 () Unit!9022)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14141 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4519) Unit!9022)

(assert (=> b!283436 (= lt!140093 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4516))))

(declare-fun b!283437 () Bool)

(declare-fun res!146358 () Bool)

(assert (=> b!283437 (=> (not res!146358) (not e!179840))))

(assert (=> b!283437 (= res!146358 (validKeyInArray!0 (select (arr!6711 a!3325) startIndex!26)))))

(declare-fun b!283438 () Bool)

(declare-fun res!146351 () Bool)

(assert (=> b!283438 (=> (not res!146351) (not e!179838))))

(assert (=> b!283438 (= res!146351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283439 () Bool)

(assert (=> b!283439 (= e!179837 e!179838)))

(declare-fun res!146350 () Bool)

(assert (=> b!283439 (=> (not res!146350) (not e!179838))))

(declare-fun lt!140091 () SeekEntryResult!1869)

(assert (=> b!283439 (= res!146350 (or (= lt!140091 (MissingZero!1869 i!1267)) (= lt!140091 (MissingVacant!1869 i!1267))))))

(assert (=> b!283439 (= lt!140091 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27386 res!146355) b!283435))

(assert (= (and b!283435 res!146353) b!283434))

(assert (= (and b!283434 res!146354) b!283432))

(assert (= (and b!283432 res!146352) b!283433))

(assert (= (and b!283433 res!146356) b!283439))

(assert (= (and b!283439 res!146350) b!283438))

(assert (= (and b!283438 res!146351) b!283431))

(assert (= (and b!283431 res!146357) b!283437))

(assert (= (and b!283437 res!146358) b!283436))

(declare-fun m!298317 () Bool)

(assert (=> b!283431 m!298317))

(declare-fun m!298319 () Bool)

(assert (=> start!27386 m!298319))

(declare-fun m!298321 () Bool)

(assert (=> start!27386 m!298321))

(declare-fun m!298323 () Bool)

(assert (=> b!283432 m!298323))

(declare-fun m!298325 () Bool)

(assert (=> b!283436 m!298325))

(assert (=> b!283436 m!298317))

(declare-fun m!298327 () Bool)

(assert (=> b!283436 m!298327))

(declare-fun m!298329 () Bool)

(assert (=> b!283436 m!298329))

(declare-fun m!298331 () Bool)

(assert (=> b!283436 m!298331))

(declare-fun m!298333 () Bool)

(assert (=> b!283436 m!298333))

(declare-fun m!298335 () Bool)

(assert (=> b!283436 m!298335))

(assert (=> b!283436 m!298331))

(declare-fun m!298337 () Bool)

(assert (=> b!283436 m!298337))

(declare-fun m!298339 () Bool)

(assert (=> b!283436 m!298339))

(assert (=> b!283436 m!298339))

(declare-fun m!298341 () Bool)

(assert (=> b!283436 m!298341))

(declare-fun m!298343 () Bool)

(assert (=> b!283438 m!298343))

(declare-fun m!298345 () Bool)

(assert (=> b!283439 m!298345))

(declare-fun m!298347 () Bool)

(assert (=> b!283433 m!298347))

(assert (=> b!283437 m!298331))

(assert (=> b!283437 m!298331))

(declare-fun m!298349 () Bool)

(assert (=> b!283437 m!298349))

(declare-fun m!298351 () Bool)

(assert (=> b!283434 m!298351))

(check-sat (not start!27386) (not b!283433) (not b!283439) (not b!283434) (not b!283438) (not b!283432) (not b!283437) (not b!283436))
(check-sat)
