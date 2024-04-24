; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27258 () Bool)

(assert start!27258)

(declare-fun b!282356 () Bool)

(declare-fun res!145399 () Bool)

(declare-fun e!179282 () Bool)

(assert (=> b!282356 (=> (not res!145399) (not e!179282))))

(declare-datatypes ((array!14075 0))(
  ( (array!14076 (arr!6679 (Array (_ BitVec 32) (_ BitVec 64))) (size!7031 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14075)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282356 (= res!145399 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282357 () Bool)

(declare-fun res!145402 () Bool)

(assert (=> b!282357 (=> (not res!145402) (not e!179282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282357 (= res!145402 (validKeyInArray!0 k0!2581))))

(declare-fun b!282358 () Bool)

(declare-fun res!145400 () Bool)

(declare-fun e!179279 () Bool)

(assert (=> b!282358 (=> (not res!145400) (not e!179279))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282358 (= res!145400 (validKeyInArray!0 (select (arr!6679 a!3325) startIndex!26)))))

(declare-fun res!145405 () Bool)

(assert (=> start!27258 (=> (not res!145405) (not e!179282))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27258 (= res!145405 (validMask!0 mask!3868))))

(assert (=> start!27258 e!179282))

(declare-fun array_inv!4629 (array!14075) Bool)

(assert (=> start!27258 (array_inv!4629 a!3325)))

(assert (=> start!27258 true))

(declare-fun b!282359 () Bool)

(declare-fun res!145403 () Bool)

(declare-fun e!179281 () Bool)

(assert (=> b!282359 (=> (not res!145403) (not e!179281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14075 (_ BitVec 32)) Bool)

(assert (=> b!282359 (= res!145403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282360 () Bool)

(assert (=> b!282360 (= e!179281 e!179279)))

(declare-fun res!145407 () Bool)

(assert (=> b!282360 (=> (not res!145407) (not e!179279))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282360 (= res!145407 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139534 () array!14075)

(assert (=> b!282360 (= lt!139534 (array!14076 (store (arr!6679 a!3325) i!1267 k0!2581) (size!7031 a!3325)))))

(declare-fun b!282361 () Bool)

(declare-fun res!145406 () Bool)

(assert (=> b!282361 (=> (not res!145406) (not e!179282))))

(assert (=> b!282361 (= res!145406 (and (= (size!7031 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7031 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7031 a!3325))))))

(declare-fun b!282362 () Bool)

(assert (=> b!282362 (= e!179282 e!179281)))

(declare-fun res!145401 () Bool)

(assert (=> b!282362 (=> (not res!145401) (not e!179281))))

(declare-datatypes ((SeekEntryResult!1802 0))(
  ( (MissingZero!1802 (index!9378 (_ BitVec 32))) (Found!1802 (index!9379 (_ BitVec 32))) (Intermediate!1802 (undefined!2614 Bool) (index!9380 (_ BitVec 32)) (x!27704 (_ BitVec 32))) (Undefined!1802) (MissingVacant!1802 (index!9381 (_ BitVec 32))) )
))
(declare-fun lt!139532 () SeekEntryResult!1802)

(assert (=> b!282362 (= res!145401 (or (= lt!139532 (MissingZero!1802 i!1267)) (= lt!139532 (MissingVacant!1802 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14075 (_ BitVec 32)) SeekEntryResult!1802)

(assert (=> b!282362 (= lt!139532 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282363 () Bool)

(declare-fun res!145404 () Bool)

(assert (=> b!282363 (=> (not res!145404) (not e!179282))))

(declare-datatypes ((List!4400 0))(
  ( (Nil!4397) (Cons!4396 (h!5066 (_ BitVec 64)) (t!9474 List!4400)) )
))
(declare-fun arrayNoDuplicates!0 (array!14075 (_ BitVec 32) List!4400) Bool)

(assert (=> b!282363 (= res!145404 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4397))))

(declare-fun b!282364 () Bool)

(assert (=> b!282364 (= e!179279 (not true))))

(assert (=> b!282364 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8934 0))(
  ( (Unit!8935) )
))
(declare-fun lt!139536 () Unit!8934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8934)

(assert (=> b!282364 (= lt!139536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282364 (= (seekEntryOrOpen!0 (select (arr!6679 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6679 a!3325) i!1267 k0!2581) startIndex!26) lt!139534 mask!3868))))

(declare-fun lt!139533 () Unit!8934)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14075 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8934)

(assert (=> b!282364 (= lt!139533 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282364 (arrayNoDuplicates!0 lt!139534 #b00000000000000000000000000000000 Nil!4397)))

(declare-fun lt!139535 () Unit!8934)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14075 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4400) Unit!8934)

(assert (=> b!282364 (= lt!139535 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4397))))

(assert (= (and start!27258 res!145405) b!282361))

(assert (= (and b!282361 res!145406) b!282357))

(assert (= (and b!282357 res!145402) b!282363))

(assert (= (and b!282363 res!145404) b!282356))

(assert (= (and b!282356 res!145399) b!282362))

(assert (= (and b!282362 res!145401) b!282359))

(assert (= (and b!282359 res!145403) b!282360))

(assert (= (and b!282360 res!145407) b!282358))

(assert (= (and b!282358 res!145400) b!282364))

(declare-fun m!297041 () Bool)

(assert (=> b!282362 m!297041))

(declare-fun m!297043 () Bool)

(assert (=> b!282364 m!297043))

(declare-fun m!297045 () Bool)

(assert (=> b!282364 m!297045))

(declare-fun m!297047 () Bool)

(assert (=> b!282364 m!297047))

(assert (=> b!282364 m!297045))

(declare-fun m!297049 () Bool)

(assert (=> b!282364 m!297049))

(declare-fun m!297051 () Bool)

(assert (=> b!282364 m!297051))

(declare-fun m!297053 () Bool)

(assert (=> b!282364 m!297053))

(declare-fun m!297055 () Bool)

(assert (=> b!282364 m!297055))

(declare-fun m!297057 () Bool)

(assert (=> b!282364 m!297057))

(declare-fun m!297059 () Bool)

(assert (=> b!282364 m!297059))

(assert (=> b!282364 m!297055))

(declare-fun m!297061 () Bool)

(assert (=> b!282364 m!297061))

(declare-fun m!297063 () Bool)

(assert (=> start!27258 m!297063))

(declare-fun m!297065 () Bool)

(assert (=> start!27258 m!297065))

(assert (=> b!282360 m!297049))

(declare-fun m!297067 () Bool)

(assert (=> b!282357 m!297067))

(declare-fun m!297069 () Bool)

(assert (=> b!282363 m!297069))

(declare-fun m!297071 () Bool)

(assert (=> b!282356 m!297071))

(assert (=> b!282358 m!297055))

(assert (=> b!282358 m!297055))

(declare-fun m!297073 () Bool)

(assert (=> b!282358 m!297073))

(declare-fun m!297075 () Bool)

(assert (=> b!282359 m!297075))

(check-sat (not b!282358) (not b!282356) (not b!282359) (not b!282364) (not b!282362) (not b!282363) (not start!27258) (not b!282357))
(check-sat)
