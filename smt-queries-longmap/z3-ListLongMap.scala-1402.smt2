; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27266 () Bool)

(assert start!27266)

(declare-fun b!282243 () Bool)

(declare-fun res!145369 () Bool)

(declare-fun e!179192 () Bool)

(assert (=> b!282243 (=> (not res!145369) (not e!179192))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282243 (= res!145369 (validKeyInArray!0 k0!2581))))

(declare-fun res!145367 () Bool)

(assert (=> start!27266 (=> (not res!145367) (not e!179192))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27266 (= res!145367 (validMask!0 mask!3868))))

(assert (=> start!27266 e!179192))

(declare-datatypes ((array!14073 0))(
  ( (array!14074 (arr!6678 (Array (_ BitVec 32) (_ BitVec 64))) (size!7031 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14073)

(declare-fun array_inv!4650 (array!14073) Bool)

(assert (=> start!27266 (array_inv!4650 a!3325)))

(assert (=> start!27266 true))

(declare-fun b!282244 () Bool)

(declare-fun e!179193 () Bool)

(assert (=> b!282244 (= e!179193 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14073 (_ BitVec 32)) Bool)

(assert (=> b!282244 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8916 0))(
  ( (Unit!8917) )
))
(declare-fun lt!139338 () Unit!8916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8916)

(assert (=> b!282244 (= lt!139338 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139339 () array!14073)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1835 0))(
  ( (MissingZero!1835 (index!9510 (_ BitVec 32))) (Found!1835 (index!9511 (_ BitVec 32))) (Intermediate!1835 (undefined!2647 Bool) (index!9512 (_ BitVec 32)) (x!27744 (_ BitVec 32))) (Undefined!1835) (MissingVacant!1835 (index!9513 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14073 (_ BitVec 32)) SeekEntryResult!1835)

(assert (=> b!282244 (= (seekEntryOrOpen!0 (select (arr!6678 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6678 a!3325) i!1267 k0!2581) startIndex!26) lt!139339 mask!3868))))

(declare-fun lt!139337 () Unit!8916)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8916)

(assert (=> b!282244 (= lt!139337 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4459 0))(
  ( (Nil!4456) (Cons!4455 (h!5125 (_ BitVec 64)) (t!9532 List!4459)) )
))
(declare-fun arrayNoDuplicates!0 (array!14073 (_ BitVec 32) List!4459) Bool)

(assert (=> b!282244 (arrayNoDuplicates!0 lt!139339 #b00000000000000000000000000000000 Nil!4456)))

(declare-fun lt!139341 () Unit!8916)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14073 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4459) Unit!8916)

(assert (=> b!282244 (= lt!139341 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4456))))

(declare-fun b!282245 () Bool)

(declare-fun res!145370 () Bool)

(assert (=> b!282245 (=> (not res!145370) (not e!179192))))

(declare-fun arrayContainsKey!0 (array!14073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282245 (= res!145370 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282246 () Bool)

(declare-fun e!179190 () Bool)

(assert (=> b!282246 (= e!179192 e!179190)))

(declare-fun res!145365 () Bool)

(assert (=> b!282246 (=> (not res!145365) (not e!179190))))

(declare-fun lt!139340 () SeekEntryResult!1835)

(assert (=> b!282246 (= res!145365 (or (= lt!139340 (MissingZero!1835 i!1267)) (= lt!139340 (MissingVacant!1835 i!1267))))))

(assert (=> b!282246 (= lt!139340 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282247 () Bool)

(declare-fun res!145364 () Bool)

(assert (=> b!282247 (=> (not res!145364) (not e!179190))))

(assert (=> b!282247 (= res!145364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282248 () Bool)

(assert (=> b!282248 (= e!179190 e!179193)))

(declare-fun res!145366 () Bool)

(assert (=> b!282248 (=> (not res!145366) (not e!179193))))

(assert (=> b!282248 (= res!145366 (not (= startIndex!26 i!1267)))))

(assert (=> b!282248 (= lt!139339 (array!14074 (store (arr!6678 a!3325) i!1267 k0!2581) (size!7031 a!3325)))))

(declare-fun b!282249 () Bool)

(declare-fun res!145368 () Bool)

(assert (=> b!282249 (=> (not res!145368) (not e!179192))))

(assert (=> b!282249 (= res!145368 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4456))))

(declare-fun b!282250 () Bool)

(declare-fun res!145371 () Bool)

(assert (=> b!282250 (=> (not res!145371) (not e!179193))))

(assert (=> b!282250 (= res!145371 (validKeyInArray!0 (select (arr!6678 a!3325) startIndex!26)))))

(declare-fun b!282251 () Bool)

(declare-fun res!145372 () Bool)

(assert (=> b!282251 (=> (not res!145372) (not e!179192))))

(assert (=> b!282251 (= res!145372 (and (= (size!7031 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7031 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7031 a!3325))))))

(assert (= (and start!27266 res!145367) b!282251))

(assert (= (and b!282251 res!145372) b!282243))

(assert (= (and b!282243 res!145369) b!282249))

(assert (= (and b!282249 res!145368) b!282245))

(assert (= (and b!282245 res!145370) b!282246))

(assert (= (and b!282246 res!145365) b!282247))

(assert (= (and b!282247 res!145364) b!282248))

(assert (= (and b!282248 res!145366) b!282250))

(assert (= (and b!282250 res!145371) b!282244))

(declare-fun m!296351 () Bool)

(assert (=> b!282249 m!296351))

(declare-fun m!296353 () Bool)

(assert (=> b!282244 m!296353))

(declare-fun m!296355 () Bool)

(assert (=> b!282244 m!296355))

(declare-fun m!296357 () Bool)

(assert (=> b!282244 m!296357))

(declare-fun m!296359 () Bool)

(assert (=> b!282244 m!296359))

(assert (=> b!282244 m!296355))

(declare-fun m!296361 () Bool)

(assert (=> b!282244 m!296361))

(declare-fun m!296363 () Bool)

(assert (=> b!282244 m!296363))

(declare-fun m!296365 () Bool)

(assert (=> b!282244 m!296365))

(declare-fun m!296367 () Bool)

(assert (=> b!282244 m!296367))

(assert (=> b!282244 m!296363))

(declare-fun m!296369 () Bool)

(assert (=> b!282244 m!296369))

(declare-fun m!296371 () Bool)

(assert (=> b!282244 m!296371))

(assert (=> b!282250 m!296363))

(assert (=> b!282250 m!296363))

(declare-fun m!296373 () Bool)

(assert (=> b!282250 m!296373))

(declare-fun m!296375 () Bool)

(assert (=> b!282243 m!296375))

(assert (=> b!282248 m!296357))

(declare-fun m!296377 () Bool)

(assert (=> start!27266 m!296377))

(declare-fun m!296379 () Bool)

(assert (=> start!27266 m!296379))

(declare-fun m!296381 () Bool)

(assert (=> b!282246 m!296381))

(declare-fun m!296383 () Bool)

(assert (=> b!282247 m!296383))

(declare-fun m!296385 () Bool)

(assert (=> b!282245 m!296385))

(check-sat (not b!282246) (not b!282243) (not b!282250) (not b!282245) (not b!282247) (not b!282244) (not start!27266) (not b!282249))
(check-sat)
