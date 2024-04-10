; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27230 () Bool)

(assert start!27230)

(declare-fun res!145005 () Bool)

(declare-fun e!179090 () Bool)

(assert (=> start!27230 (=> (not res!145005) (not e!179090))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27230 (= res!145005 (validMask!0 mask!3868))))

(assert (=> start!27230 e!179090))

(declare-datatypes ((array!14048 0))(
  ( (array!14049 (arr!6666 (Array (_ BitVec 32) (_ BitVec 64))) (size!7018 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14048)

(declare-fun array_inv!4629 (array!14048) Bool)

(assert (=> start!27230 (array_inv!4629 a!3325)))

(assert (=> start!27230 true))

(declare-fun b!281931 () Bool)

(declare-fun e!179088 () Bool)

(assert (=> b!281931 (= e!179088 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14048 (_ BitVec 32)) Bool)

(assert (=> b!281931 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8932 0))(
  ( (Unit!8933) )
))
(declare-fun lt!139263 () Unit!8932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8932)

(assert (=> b!281931 (= lt!139263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139267 () array!14048)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1824 0))(
  ( (MissingZero!1824 (index!9466 (_ BitVec 32))) (Found!1824 (index!9467 (_ BitVec 32))) (Intermediate!1824 (undefined!2636 Bool) (index!9468 (_ BitVec 32)) (x!27686 (_ BitVec 32))) (Undefined!1824) (MissingVacant!1824 (index!9469 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14048 (_ BitVec 32)) SeekEntryResult!1824)

(assert (=> b!281931 (= (seekEntryOrOpen!0 (select (arr!6666 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6666 a!3325) i!1267 k0!2581) startIndex!26) lt!139267 mask!3868))))

(declare-fun lt!139266 () Unit!8932)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14048 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8932)

(assert (=> b!281931 (= lt!139266 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4474 0))(
  ( (Nil!4471) (Cons!4470 (h!5140 (_ BitVec 64)) (t!9556 List!4474)) )
))
(declare-fun arrayNoDuplicates!0 (array!14048 (_ BitVec 32) List!4474) Bool)

(assert (=> b!281931 (arrayNoDuplicates!0 lt!139267 #b00000000000000000000000000000000 Nil!4471)))

(declare-fun lt!139264 () Unit!8932)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14048 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4474) Unit!8932)

(assert (=> b!281931 (= lt!139264 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4471))))

(declare-fun b!281932 () Bool)

(declare-fun res!145003 () Bool)

(assert (=> b!281932 (=> (not res!145003) (not e!179088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281932 (= res!145003 (validKeyInArray!0 (select (arr!6666 a!3325) startIndex!26)))))

(declare-fun b!281933 () Bool)

(declare-fun e!179089 () Bool)

(assert (=> b!281933 (= e!179089 e!179088)))

(declare-fun res!145001 () Bool)

(assert (=> b!281933 (=> (not res!145001) (not e!179088))))

(assert (=> b!281933 (= res!145001 (not (= startIndex!26 i!1267)))))

(assert (=> b!281933 (= lt!139267 (array!14049 (store (arr!6666 a!3325) i!1267 k0!2581) (size!7018 a!3325)))))

(declare-fun b!281934 () Bool)

(declare-fun res!145008 () Bool)

(assert (=> b!281934 (=> (not res!145008) (not e!179089))))

(assert (=> b!281934 (= res!145008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281935 () Bool)

(assert (=> b!281935 (= e!179090 e!179089)))

(declare-fun res!145006 () Bool)

(assert (=> b!281935 (=> (not res!145006) (not e!179089))))

(declare-fun lt!139265 () SeekEntryResult!1824)

(assert (=> b!281935 (= res!145006 (or (= lt!139265 (MissingZero!1824 i!1267)) (= lt!139265 (MissingVacant!1824 i!1267))))))

(assert (=> b!281935 (= lt!139265 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281936 () Bool)

(declare-fun res!145002 () Bool)

(assert (=> b!281936 (=> (not res!145002) (not e!179090))))

(assert (=> b!281936 (= res!145002 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4471))))

(declare-fun b!281937 () Bool)

(declare-fun res!145004 () Bool)

(assert (=> b!281937 (=> (not res!145004) (not e!179090))))

(declare-fun arrayContainsKey!0 (array!14048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281937 (= res!145004 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281938 () Bool)

(declare-fun res!145007 () Bool)

(assert (=> b!281938 (=> (not res!145007) (not e!179090))))

(assert (=> b!281938 (= res!145007 (and (= (size!7018 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7018 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7018 a!3325))))))

(declare-fun b!281939 () Bool)

(declare-fun res!145000 () Bool)

(assert (=> b!281939 (=> (not res!145000) (not e!179090))))

(assert (=> b!281939 (= res!145000 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27230 res!145005) b!281938))

(assert (= (and b!281938 res!145007) b!281939))

(assert (= (and b!281939 res!145000) b!281936))

(assert (= (and b!281936 res!145002) b!281937))

(assert (= (and b!281937 res!145004) b!281935))

(assert (= (and b!281935 res!145006) b!281934))

(assert (= (and b!281934 res!145008) b!281933))

(assert (= (and b!281933 res!145001) b!281932))

(assert (= (and b!281932 res!145003) b!281931))

(declare-fun m!296331 () Bool)

(assert (=> b!281933 m!296331))

(declare-fun m!296333 () Bool)

(assert (=> b!281937 m!296333))

(declare-fun m!296335 () Bool)

(assert (=> b!281939 m!296335))

(declare-fun m!296337 () Bool)

(assert (=> b!281932 m!296337))

(assert (=> b!281932 m!296337))

(declare-fun m!296339 () Bool)

(assert (=> b!281932 m!296339))

(declare-fun m!296341 () Bool)

(assert (=> start!27230 m!296341))

(declare-fun m!296343 () Bool)

(assert (=> start!27230 m!296343))

(declare-fun m!296345 () Bool)

(assert (=> b!281931 m!296345))

(declare-fun m!296347 () Bool)

(assert (=> b!281931 m!296347))

(declare-fun m!296349 () Bool)

(assert (=> b!281931 m!296349))

(assert (=> b!281931 m!296347))

(assert (=> b!281931 m!296331))

(declare-fun m!296351 () Bool)

(assert (=> b!281931 m!296351))

(assert (=> b!281931 m!296337))

(declare-fun m!296353 () Bool)

(assert (=> b!281931 m!296353))

(declare-fun m!296355 () Bool)

(assert (=> b!281931 m!296355))

(assert (=> b!281931 m!296337))

(declare-fun m!296357 () Bool)

(assert (=> b!281931 m!296357))

(declare-fun m!296359 () Bool)

(assert (=> b!281931 m!296359))

(declare-fun m!296361 () Bool)

(assert (=> b!281936 m!296361))

(declare-fun m!296363 () Bool)

(assert (=> b!281934 m!296363))

(declare-fun m!296365 () Bool)

(assert (=> b!281935 m!296365))

(check-sat (not b!281936) (not b!281935) (not b!281934) (not b!281932) (not start!27230) (not b!281931) (not b!281937) (not b!281939))
(check-sat)
