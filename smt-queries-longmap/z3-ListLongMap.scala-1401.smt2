; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27260 () Bool)

(assert start!27260)

(declare-fun res!145410 () Bool)

(declare-fun e!179268 () Bool)

(assert (=> start!27260 (=> (not res!145410) (not e!179268))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27260 (= res!145410 (validMask!0 mask!3868))))

(assert (=> start!27260 e!179268))

(declare-datatypes ((array!14078 0))(
  ( (array!14079 (arr!6681 (Array (_ BitVec 32) (_ BitVec 64))) (size!7033 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14078)

(declare-fun array_inv!4644 (array!14078) Bool)

(assert (=> start!27260 (array_inv!4644 a!3325)))

(assert (=> start!27260 true))

(declare-fun b!282336 () Bool)

(declare-fun res!145411 () Bool)

(declare-fun e!179269 () Bool)

(assert (=> b!282336 (=> (not res!145411) (not e!179269))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282336 (= res!145411 (validKeyInArray!0 (select (arr!6681 a!3325) startIndex!26)))))

(declare-fun b!282337 () Bool)

(declare-fun res!145412 () Bool)

(assert (=> b!282337 (=> (not res!145412) (not e!179268))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!282337 (= res!145412 (validKeyInArray!0 k0!2581))))

(declare-fun b!282338 () Bool)

(declare-fun res!145407 () Bool)

(declare-fun e!179270 () Bool)

(assert (=> b!282338 (=> (not res!145407) (not e!179270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14078 (_ BitVec 32)) Bool)

(assert (=> b!282338 (= res!145407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282339 () Bool)

(assert (=> b!282339 (= e!179270 e!179269)))

(declare-fun res!145405 () Bool)

(assert (=> b!282339 (=> (not res!145405) (not e!179269))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282339 (= res!145405 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139490 () array!14078)

(assert (=> b!282339 (= lt!139490 (array!14079 (store (arr!6681 a!3325) i!1267 k0!2581) (size!7033 a!3325)))))

(declare-fun b!282340 () Bool)

(assert (=> b!282340 (= e!179268 e!179270)))

(declare-fun res!145406 () Bool)

(assert (=> b!282340 (=> (not res!145406) (not e!179270))))

(declare-datatypes ((SeekEntryResult!1839 0))(
  ( (MissingZero!1839 (index!9526 (_ BitVec 32))) (Found!1839 (index!9527 (_ BitVec 32))) (Intermediate!1839 (undefined!2651 Bool) (index!9528 (_ BitVec 32)) (x!27741 (_ BitVec 32))) (Undefined!1839) (MissingVacant!1839 (index!9529 (_ BitVec 32))) )
))
(declare-fun lt!139492 () SeekEntryResult!1839)

(assert (=> b!282340 (= res!145406 (or (= lt!139492 (MissingZero!1839 i!1267)) (= lt!139492 (MissingVacant!1839 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14078 (_ BitVec 32)) SeekEntryResult!1839)

(assert (=> b!282340 (= lt!139492 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282341 () Bool)

(declare-fun res!145408 () Bool)

(assert (=> b!282341 (=> (not res!145408) (not e!179268))))

(declare-datatypes ((List!4489 0))(
  ( (Nil!4486) (Cons!4485 (h!5155 (_ BitVec 64)) (t!9571 List!4489)) )
))
(declare-fun arrayNoDuplicates!0 (array!14078 (_ BitVec 32) List!4489) Bool)

(assert (=> b!282341 (= res!145408 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4486))))

(declare-fun b!282342 () Bool)

(assert (=> b!282342 (= e!179269 (not true))))

(assert (=> b!282342 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8962 0))(
  ( (Unit!8963) )
))
(declare-fun lt!139488 () Unit!8962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8962)

(assert (=> b!282342 (= lt!139488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282342 (= (seekEntryOrOpen!0 (select (arr!6681 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6681 a!3325) i!1267 k0!2581) startIndex!26) lt!139490 mask!3868))))

(declare-fun lt!139491 () Unit!8962)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14078 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8962)

(assert (=> b!282342 (= lt!139491 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282342 (arrayNoDuplicates!0 lt!139490 #b00000000000000000000000000000000 Nil!4486)))

(declare-fun lt!139489 () Unit!8962)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14078 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4489) Unit!8962)

(assert (=> b!282342 (= lt!139489 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4486))))

(declare-fun b!282343 () Bool)

(declare-fun res!145413 () Bool)

(assert (=> b!282343 (=> (not res!145413) (not e!179268))))

(assert (=> b!282343 (= res!145413 (and (= (size!7033 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7033 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7033 a!3325))))))

(declare-fun b!282344 () Bool)

(declare-fun res!145409 () Bool)

(assert (=> b!282344 (=> (not res!145409) (not e!179268))))

(declare-fun arrayContainsKey!0 (array!14078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282344 (= res!145409 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27260 res!145410) b!282343))

(assert (= (and b!282343 res!145413) b!282337))

(assert (= (and b!282337 res!145412) b!282341))

(assert (= (and b!282341 res!145408) b!282344))

(assert (= (and b!282344 res!145409) b!282340))

(assert (= (and b!282340 res!145406) b!282338))

(assert (= (and b!282338 res!145407) b!282339))

(assert (= (and b!282339 res!145405) b!282336))

(assert (= (and b!282336 res!145411) b!282342))

(declare-fun m!296871 () Bool)

(assert (=> b!282338 m!296871))

(declare-fun m!296873 () Bool)

(assert (=> b!282339 m!296873))

(declare-fun m!296875 () Bool)

(assert (=> start!27260 m!296875))

(declare-fun m!296877 () Bool)

(assert (=> start!27260 m!296877))

(declare-fun m!296879 () Bool)

(assert (=> b!282336 m!296879))

(assert (=> b!282336 m!296879))

(declare-fun m!296881 () Bool)

(assert (=> b!282336 m!296881))

(declare-fun m!296883 () Bool)

(assert (=> b!282337 m!296883))

(declare-fun m!296885 () Bool)

(assert (=> b!282342 m!296885))

(declare-fun m!296887 () Bool)

(assert (=> b!282342 m!296887))

(declare-fun m!296889 () Bool)

(assert (=> b!282342 m!296889))

(declare-fun m!296891 () Bool)

(assert (=> b!282342 m!296891))

(assert (=> b!282342 m!296887))

(assert (=> b!282342 m!296873))

(declare-fun m!296893 () Bool)

(assert (=> b!282342 m!296893))

(assert (=> b!282342 m!296879))

(declare-fun m!296895 () Bool)

(assert (=> b!282342 m!296895))

(declare-fun m!296897 () Bool)

(assert (=> b!282342 m!296897))

(assert (=> b!282342 m!296879))

(declare-fun m!296899 () Bool)

(assert (=> b!282342 m!296899))

(declare-fun m!296901 () Bool)

(assert (=> b!282341 m!296901))

(declare-fun m!296903 () Bool)

(assert (=> b!282344 m!296903))

(declare-fun m!296905 () Bool)

(assert (=> b!282340 m!296905))

(check-sat (not b!282341) (not start!27260) (not b!282344) (not b!282338) (not b!282342) (not b!282337) (not b!282336) (not b!282340))
(check-sat)
