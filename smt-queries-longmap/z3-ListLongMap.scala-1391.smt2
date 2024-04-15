; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27200 () Bool)

(assert start!27200)

(declare-fun res!144475 () Bool)

(declare-fun e!178797 () Bool)

(assert (=> start!27200 (=> (not res!144475) (not e!178797))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27200 (= res!144475 (validMask!0 mask!3868))))

(assert (=> start!27200 e!178797))

(declare-datatypes ((array!14007 0))(
  ( (array!14008 (arr!6645 (Array (_ BitVec 32) (_ BitVec 64))) (size!6998 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14007)

(declare-fun array_inv!4617 (array!14007) Bool)

(assert (=> start!27200 (array_inv!4617 a!3325)))

(assert (=> start!27200 true))

(declare-fun b!281352 () Bool)

(declare-fun res!144478 () Bool)

(declare-fun e!178796 () Bool)

(assert (=> b!281352 (=> (not res!144478) (not e!178796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14007 (_ BitVec 32)) Bool)

(assert (=> b!281352 (= res!144478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281353 () Bool)

(declare-fun res!144480 () Bool)

(declare-fun e!178795 () Bool)

(assert (=> b!281353 (=> (not res!144480) (not e!178795))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281353 (= res!144480 (validKeyInArray!0 (select (arr!6645 a!3325) startIndex!26)))))

(declare-fun b!281354 () Bool)

(declare-fun res!144476 () Bool)

(assert (=> b!281354 (=> (not res!144476) (not e!178797))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281354 (= res!144476 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281355 () Bool)

(declare-fun res!144477 () Bool)

(assert (=> b!281355 (=> (not res!144477) (not e!178797))))

(assert (=> b!281355 (= res!144477 (validKeyInArray!0 k0!2581))))

(declare-fun b!281356 () Bool)

(declare-fun res!144481 () Bool)

(assert (=> b!281356 (=> (not res!144481) (not e!178797))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281356 (= res!144481 (and (= (size!6998 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6998 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6998 a!3325))))))

(declare-fun b!281357 () Bool)

(assert (=> b!281357 (= e!178797 e!178796)))

(declare-fun res!144473 () Bool)

(assert (=> b!281357 (=> (not res!144473) (not e!178796))))

(declare-datatypes ((SeekEntryResult!1802 0))(
  ( (MissingZero!1802 (index!9378 (_ BitVec 32))) (Found!1802 (index!9379 (_ BitVec 32))) (Intermediate!1802 (undefined!2614 Bool) (index!9380 (_ BitVec 32)) (x!27623 (_ BitVec 32))) (Undefined!1802) (MissingVacant!1802 (index!9381 (_ BitVec 32))) )
))
(declare-fun lt!138885 () SeekEntryResult!1802)

(assert (=> b!281357 (= res!144473 (or (= lt!138885 (MissingZero!1802 i!1267)) (= lt!138885 (MissingVacant!1802 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14007 (_ BitVec 32)) SeekEntryResult!1802)

(assert (=> b!281357 (= lt!138885 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281358 () Bool)

(assert (=> b!281358 (= e!178795 (not true))))

(declare-fun lt!138888 () array!14007)

(assert (=> b!281358 (= (seekEntryOrOpen!0 (select (arr!6645 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6645 a!3325) i!1267 k0!2581) startIndex!26) lt!138888 mask!3868))))

(declare-datatypes ((Unit!8850 0))(
  ( (Unit!8851) )
))
(declare-fun lt!138887 () Unit!8850)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14007 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8850)

(assert (=> b!281358 (= lt!138887 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4426 0))(
  ( (Nil!4423) (Cons!4422 (h!5092 (_ BitVec 64)) (t!9499 List!4426)) )
))
(declare-fun arrayNoDuplicates!0 (array!14007 (_ BitVec 32) List!4426) Bool)

(assert (=> b!281358 (arrayNoDuplicates!0 lt!138888 #b00000000000000000000000000000000 Nil!4423)))

(declare-fun lt!138886 () Unit!8850)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14007 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4426) Unit!8850)

(assert (=> b!281358 (= lt!138886 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4423))))

(declare-fun b!281359 () Bool)

(assert (=> b!281359 (= e!178796 e!178795)))

(declare-fun res!144479 () Bool)

(assert (=> b!281359 (=> (not res!144479) (not e!178795))))

(assert (=> b!281359 (= res!144479 (not (= startIndex!26 i!1267)))))

(assert (=> b!281359 (= lt!138888 (array!14008 (store (arr!6645 a!3325) i!1267 k0!2581) (size!6998 a!3325)))))

(declare-fun b!281360 () Bool)

(declare-fun res!144474 () Bool)

(assert (=> b!281360 (=> (not res!144474) (not e!178797))))

(assert (=> b!281360 (= res!144474 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4423))))

(assert (= (and start!27200 res!144475) b!281356))

(assert (= (and b!281356 res!144481) b!281355))

(assert (= (and b!281355 res!144477) b!281360))

(assert (= (and b!281360 res!144474) b!281354))

(assert (= (and b!281354 res!144476) b!281357))

(assert (= (and b!281357 res!144473) b!281352))

(assert (= (and b!281352 res!144478) b!281359))

(assert (= (and b!281359 res!144479) b!281353))

(assert (= (and b!281353 res!144480) b!281358))

(declare-fun m!295223 () Bool)

(assert (=> b!281354 m!295223))

(declare-fun m!295225 () Bool)

(assert (=> start!27200 m!295225))

(declare-fun m!295227 () Bool)

(assert (=> start!27200 m!295227))

(declare-fun m!295229 () Bool)

(assert (=> b!281357 m!295229))

(declare-fun m!295231 () Bool)

(assert (=> b!281352 m!295231))

(declare-fun m!295233 () Bool)

(assert (=> b!281359 m!295233))

(declare-fun m!295235 () Bool)

(assert (=> b!281358 m!295235))

(assert (=> b!281358 m!295235))

(declare-fun m!295237 () Bool)

(assert (=> b!281358 m!295237))

(assert (=> b!281358 m!295233))

(declare-fun m!295239 () Bool)

(assert (=> b!281358 m!295239))

(declare-fun m!295241 () Bool)

(assert (=> b!281358 m!295241))

(declare-fun m!295243 () Bool)

(assert (=> b!281358 m!295243))

(assert (=> b!281358 m!295239))

(declare-fun m!295245 () Bool)

(assert (=> b!281358 m!295245))

(declare-fun m!295247 () Bool)

(assert (=> b!281358 m!295247))

(assert (=> b!281353 m!295239))

(assert (=> b!281353 m!295239))

(declare-fun m!295249 () Bool)

(assert (=> b!281353 m!295249))

(declare-fun m!295251 () Bool)

(assert (=> b!281355 m!295251))

(declare-fun m!295253 () Bool)

(assert (=> b!281360 m!295253))

(check-sat (not b!281360) (not b!281357) (not b!281353) (not b!281358) (not b!281354) (not b!281352) (not start!27200) (not b!281355))
(check-sat)
