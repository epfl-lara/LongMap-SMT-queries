; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27236 () Bool)

(assert start!27236)

(declare-fun res!145083 () Bool)

(declare-fun e!179125 () Bool)

(assert (=> start!27236 (=> (not res!145083) (not e!179125))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27236 (= res!145083 (validMask!0 mask!3868))))

(assert (=> start!27236 e!179125))

(declare-datatypes ((array!14054 0))(
  ( (array!14055 (arr!6669 (Array (_ BitVec 32) (_ BitVec 64))) (size!7021 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14054)

(declare-fun array_inv!4632 (array!14054) Bool)

(assert (=> start!27236 (array_inv!4632 a!3325)))

(assert (=> start!27236 true))

(declare-fun b!282012 () Bool)

(declare-fun res!145085 () Bool)

(assert (=> b!282012 (=> (not res!145085) (not e!179125))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282012 (= res!145085 (validKeyInArray!0 k0!2581))))

(declare-fun b!282013 () Bool)

(declare-fun res!145081 () Bool)

(assert (=> b!282013 (=> (not res!145081) (not e!179125))))

(declare-datatypes ((List!4477 0))(
  ( (Nil!4474) (Cons!4473 (h!5143 (_ BitVec 64)) (t!9559 List!4477)) )
))
(declare-fun arrayNoDuplicates!0 (array!14054 (_ BitVec 32) List!4477) Bool)

(assert (=> b!282013 (= res!145081 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4474))))

(declare-fun b!282014 () Bool)

(declare-fun res!145089 () Bool)

(declare-fun e!179126 () Bool)

(assert (=> b!282014 (=> (not res!145089) (not e!179126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14054 (_ BitVec 32)) Bool)

(assert (=> b!282014 (= res!145089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282015 () Bool)

(declare-fun e!179124 () Bool)

(assert (=> b!282015 (= e!179126 e!179124)))

(declare-fun res!145082 () Bool)

(assert (=> b!282015 (=> (not res!145082) (not e!179124))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282015 (= res!145082 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139309 () array!14054)

(assert (=> b!282015 (= lt!139309 (array!14055 (store (arr!6669 a!3325) i!1267 k0!2581) (size!7021 a!3325)))))

(declare-fun b!282016 () Bool)

(declare-fun res!145084 () Bool)

(assert (=> b!282016 (=> (not res!145084) (not e!179125))))

(assert (=> b!282016 (= res!145084 (and (= (size!7021 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7021 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7021 a!3325))))))

(declare-fun b!282017 () Bool)

(assert (=> b!282017 (= e!179124 (not true))))

(assert (=> b!282017 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8938 0))(
  ( (Unit!8939) )
))
(declare-fun lt!139308 () Unit!8938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8938)

(assert (=> b!282017 (= lt!139308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1827 0))(
  ( (MissingZero!1827 (index!9478 (_ BitVec 32))) (Found!1827 (index!9479 (_ BitVec 32))) (Intermediate!1827 (undefined!2639 Bool) (index!9480 (_ BitVec 32)) (x!27697 (_ BitVec 32))) (Undefined!1827) (MissingVacant!1827 (index!9481 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14054 (_ BitVec 32)) SeekEntryResult!1827)

(assert (=> b!282017 (= (seekEntryOrOpen!0 (select (arr!6669 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6669 a!3325) i!1267 k0!2581) startIndex!26) lt!139309 mask!3868))))

(declare-fun lt!139312 () Unit!8938)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14054 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8938)

(assert (=> b!282017 (= lt!139312 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282017 (arrayNoDuplicates!0 lt!139309 #b00000000000000000000000000000000 Nil!4474)))

(declare-fun lt!139310 () Unit!8938)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14054 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4477) Unit!8938)

(assert (=> b!282017 (= lt!139310 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4474))))

(declare-fun b!282018 () Bool)

(declare-fun res!145088 () Bool)

(assert (=> b!282018 (=> (not res!145088) (not e!179125))))

(declare-fun arrayContainsKey!0 (array!14054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282018 (= res!145088 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282019 () Bool)

(assert (=> b!282019 (= e!179125 e!179126)))

(declare-fun res!145086 () Bool)

(assert (=> b!282019 (=> (not res!145086) (not e!179126))))

(declare-fun lt!139311 () SeekEntryResult!1827)

(assert (=> b!282019 (= res!145086 (or (= lt!139311 (MissingZero!1827 i!1267)) (= lt!139311 (MissingVacant!1827 i!1267))))))

(assert (=> b!282019 (= lt!139311 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282020 () Bool)

(declare-fun res!145087 () Bool)

(assert (=> b!282020 (=> (not res!145087) (not e!179124))))

(assert (=> b!282020 (= res!145087 (validKeyInArray!0 (select (arr!6669 a!3325) startIndex!26)))))

(assert (= (and start!27236 res!145083) b!282016))

(assert (= (and b!282016 res!145084) b!282012))

(assert (= (and b!282012 res!145085) b!282013))

(assert (= (and b!282013 res!145081) b!282018))

(assert (= (and b!282018 res!145088) b!282019))

(assert (= (and b!282019 res!145086) b!282014))

(assert (= (and b!282014 res!145089) b!282015))

(assert (= (and b!282015 res!145082) b!282020))

(assert (= (and b!282020 res!145087) b!282017))

(declare-fun m!296439 () Bool)

(assert (=> b!282014 m!296439))

(declare-fun m!296441 () Bool)

(assert (=> b!282019 m!296441))

(declare-fun m!296443 () Bool)

(assert (=> b!282015 m!296443))

(declare-fun m!296445 () Bool)

(assert (=> b!282020 m!296445))

(assert (=> b!282020 m!296445))

(declare-fun m!296447 () Bool)

(assert (=> b!282020 m!296447))

(declare-fun m!296449 () Bool)

(assert (=> b!282013 m!296449))

(declare-fun m!296451 () Bool)

(assert (=> b!282017 m!296451))

(declare-fun m!296453 () Bool)

(assert (=> b!282017 m!296453))

(declare-fun m!296455 () Bool)

(assert (=> b!282017 m!296455))

(assert (=> b!282017 m!296443))

(declare-fun m!296457 () Bool)

(assert (=> b!282017 m!296457))

(assert (=> b!282017 m!296445))

(declare-fun m!296459 () Bool)

(assert (=> b!282017 m!296459))

(declare-fun m!296461 () Bool)

(assert (=> b!282017 m!296461))

(assert (=> b!282017 m!296445))

(declare-fun m!296463 () Bool)

(assert (=> b!282017 m!296463))

(assert (=> b!282017 m!296455))

(declare-fun m!296465 () Bool)

(assert (=> b!282017 m!296465))

(declare-fun m!296467 () Bool)

(assert (=> b!282012 m!296467))

(declare-fun m!296469 () Bool)

(assert (=> b!282018 m!296469))

(declare-fun m!296471 () Bool)

(assert (=> start!27236 m!296471))

(declare-fun m!296473 () Bool)

(assert (=> start!27236 m!296473))

(check-sat (not b!282012) (not b!282017) (not b!282020) (not b!282014) (not b!282019) (not b!282013) (not b!282018) (not start!27236))
(check-sat)
