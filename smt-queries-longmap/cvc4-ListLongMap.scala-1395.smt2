; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27226 () Bool)

(assert start!27226)

(declare-fun b!281877 () Bool)

(declare-fun res!144952 () Bool)

(declare-fun e!179065 () Bool)

(assert (=> b!281877 (=> (not res!144952) (not e!179065))))

(declare-datatypes ((array!14044 0))(
  ( (array!14045 (arr!6664 (Array (_ BitVec 32) (_ BitVec 64))) (size!7016 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14044)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14044 (_ BitVec 32)) Bool)

(assert (=> b!281877 (= res!144952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!144953 () Bool)

(declare-fun e!179066 () Bool)

(assert (=> start!27226 (=> (not res!144953) (not e!179066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27226 (= res!144953 (validMask!0 mask!3868))))

(assert (=> start!27226 e!179066))

(declare-fun array_inv!4627 (array!14044) Bool)

(assert (=> start!27226 (array_inv!4627 a!3325)))

(assert (=> start!27226 true))

(declare-fun b!281878 () Bool)

(declare-fun e!179063 () Bool)

(assert (=> b!281878 (= e!179063 (not true))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!139234 () array!14044)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1822 0))(
  ( (MissingZero!1822 (index!9458 (_ BitVec 32))) (Found!1822 (index!9459 (_ BitVec 32))) (Intermediate!1822 (undefined!2634 Bool) (index!9460 (_ BitVec 32)) (x!27676 (_ BitVec 32))) (Undefined!1822) (MissingVacant!1822 (index!9461 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14044 (_ BitVec 32)) SeekEntryResult!1822)

(assert (=> b!281878 (= (seekEntryOrOpen!0 (select (arr!6664 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6664 a!3325) i!1267 k!2581) startIndex!26) lt!139234 mask!3868))))

(declare-datatypes ((Unit!8928 0))(
  ( (Unit!8929) )
))
(declare-fun lt!139235 () Unit!8928)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14044 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8928)

(assert (=> b!281878 (= lt!139235 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4472 0))(
  ( (Nil!4469) (Cons!4468 (h!5138 (_ BitVec 64)) (t!9554 List!4472)) )
))
(declare-fun arrayNoDuplicates!0 (array!14044 (_ BitVec 32) List!4472) Bool)

(assert (=> b!281878 (arrayNoDuplicates!0 lt!139234 #b00000000000000000000000000000000 Nil!4469)))

(declare-fun lt!139236 () Unit!8928)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14044 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4472) Unit!8928)

(assert (=> b!281878 (= lt!139236 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4469))))

(declare-fun b!281879 () Bool)

(declare-fun res!144946 () Bool)

(assert (=> b!281879 (=> (not res!144946) (not e!179066))))

(declare-fun arrayContainsKey!0 (array!14044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281879 (= res!144946 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281880 () Bool)

(declare-fun res!144949 () Bool)

(assert (=> b!281880 (=> (not res!144949) (not e!179063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281880 (= res!144949 (validKeyInArray!0 (select (arr!6664 a!3325) startIndex!26)))))

(declare-fun b!281881 () Bool)

(assert (=> b!281881 (= e!179066 e!179065)))

(declare-fun res!144950 () Bool)

(assert (=> b!281881 (=> (not res!144950) (not e!179065))))

(declare-fun lt!139237 () SeekEntryResult!1822)

(assert (=> b!281881 (= res!144950 (or (= lt!139237 (MissingZero!1822 i!1267)) (= lt!139237 (MissingVacant!1822 i!1267))))))

(assert (=> b!281881 (= lt!139237 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281882 () Bool)

(declare-fun res!144951 () Bool)

(assert (=> b!281882 (=> (not res!144951) (not e!179066))))

(assert (=> b!281882 (= res!144951 (validKeyInArray!0 k!2581))))

(declare-fun b!281883 () Bool)

(declare-fun res!144948 () Bool)

(assert (=> b!281883 (=> (not res!144948) (not e!179066))))

(assert (=> b!281883 (= res!144948 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4469))))

(declare-fun b!281884 () Bool)

(assert (=> b!281884 (= e!179065 e!179063)))

(declare-fun res!144954 () Bool)

(assert (=> b!281884 (=> (not res!144954) (not e!179063))))

(assert (=> b!281884 (= res!144954 (not (= startIndex!26 i!1267)))))

(assert (=> b!281884 (= lt!139234 (array!14045 (store (arr!6664 a!3325) i!1267 k!2581) (size!7016 a!3325)))))

(declare-fun b!281885 () Bool)

(declare-fun res!144947 () Bool)

(assert (=> b!281885 (=> (not res!144947) (not e!179066))))

(assert (=> b!281885 (= res!144947 (and (= (size!7016 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7016 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7016 a!3325))))))

(assert (= (and start!27226 res!144953) b!281885))

(assert (= (and b!281885 res!144947) b!281882))

(assert (= (and b!281882 res!144951) b!281883))

(assert (= (and b!281883 res!144948) b!281879))

(assert (= (and b!281879 res!144946) b!281881))

(assert (= (and b!281881 res!144950) b!281877))

(assert (= (and b!281877 res!144952) b!281884))

(assert (= (and b!281884 res!144954) b!281880))

(assert (= (and b!281880 res!144949) b!281878))

(declare-fun m!296263 () Bool)

(assert (=> b!281879 m!296263))

(declare-fun m!296265 () Bool)

(assert (=> b!281882 m!296265))

(declare-fun m!296267 () Bool)

(assert (=> b!281877 m!296267))

(declare-fun m!296269 () Bool)

(assert (=> b!281881 m!296269))

(declare-fun m!296271 () Bool)

(assert (=> b!281884 m!296271))

(declare-fun m!296273 () Bool)

(assert (=> b!281880 m!296273))

(assert (=> b!281880 m!296273))

(declare-fun m!296275 () Bool)

(assert (=> b!281880 m!296275))

(declare-fun m!296277 () Bool)

(assert (=> start!27226 m!296277))

(declare-fun m!296279 () Bool)

(assert (=> start!27226 m!296279))

(declare-fun m!296281 () Bool)

(assert (=> b!281883 m!296281))

(declare-fun m!296283 () Bool)

(assert (=> b!281878 m!296283))

(declare-fun m!296285 () Bool)

(assert (=> b!281878 m!296285))

(assert (=> b!281878 m!296271))

(assert (=> b!281878 m!296273))

(declare-fun m!296287 () Bool)

(assert (=> b!281878 m!296287))

(declare-fun m!296289 () Bool)

(assert (=> b!281878 m!296289))

(assert (=> b!281878 m!296285))

(declare-fun m!296291 () Bool)

(assert (=> b!281878 m!296291))

(assert (=> b!281878 m!296273))

(declare-fun m!296293 () Bool)

(assert (=> b!281878 m!296293))

(push 1)

(assert (not b!281882))

(assert (not b!281878))

(assert (not b!281883))

(assert (not b!281877))

(assert (not b!281881))

(assert (not start!27226))

(assert (not b!281880))

(assert (not b!281879))

