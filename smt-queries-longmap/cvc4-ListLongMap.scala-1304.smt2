; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26386 () Bool)

(assert start!26386)

(declare-fun b!273630 () Bool)

(declare-fun e!175342 () Bool)

(declare-fun e!175343 () Bool)

(assert (=> b!273630 (= e!175342 e!175343)))

(declare-fun res!137625 () Bool)

(assert (=> b!273630 (=> (not res!137625) (not e!175343))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273630 (= res!137625 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13483 0))(
  ( (array!13484 (arr!6391 (Array (_ BitVec 32) (_ BitVec 64))) (size!6743 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13483)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!136491 () array!13483)

(assert (=> b!273630 (= lt!136491 (array!13484 (store (arr!6391 a!3325) i!1267 k!2581) (size!6743 a!3325)))))

(declare-fun b!273631 () Bool)

(declare-fun res!137623 () Bool)

(assert (=> b!273631 (=> (not res!137623) (not e!175343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273631 (= res!137623 (validKeyInArray!0 (select (arr!6391 a!3325) startIndex!26)))))

(declare-fun b!273632 () Bool)

(declare-fun res!137627 () Bool)

(declare-fun e!175341 () Bool)

(assert (=> b!273632 (=> (not res!137627) (not e!175341))))

(assert (=> b!273632 (= res!137627 (validKeyInArray!0 k!2581))))

(declare-fun b!273633 () Bool)

(declare-fun res!137622 () Bool)

(assert (=> b!273633 (=> (not res!137622) (not e!175341))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273633 (= res!137622 (and (= (size!6743 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6743 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6743 a!3325))))))

(declare-fun b!273634 () Bool)

(declare-fun res!137621 () Bool)

(assert (=> b!273634 (=> (not res!137621) (not e!175341))))

(declare-datatypes ((List!4199 0))(
  ( (Nil!4196) (Cons!4195 (h!4862 (_ BitVec 64)) (t!9281 List!4199)) )
))
(declare-fun arrayNoDuplicates!0 (array!13483 (_ BitVec 32) List!4199) Bool)

(assert (=> b!273634 (= res!137621 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4196))))

(declare-fun b!273635 () Bool)

(assert (=> b!273635 (= e!175341 e!175342)))

(declare-fun res!137620 () Bool)

(assert (=> b!273635 (=> (not res!137620) (not e!175342))))

(declare-datatypes ((SeekEntryResult!1549 0))(
  ( (MissingZero!1549 (index!8366 (_ BitVec 32))) (Found!1549 (index!8367 (_ BitVec 32))) (Intermediate!1549 (undefined!2361 Bool) (index!8368 (_ BitVec 32)) (x!26666 (_ BitVec 32))) (Undefined!1549) (MissingVacant!1549 (index!8369 (_ BitVec 32))) )
))
(declare-fun lt!136492 () SeekEntryResult!1549)

(assert (=> b!273635 (= res!137620 (or (= lt!136492 (MissingZero!1549 i!1267)) (= lt!136492 (MissingVacant!1549 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13483 (_ BitVec 32)) SeekEntryResult!1549)

(assert (=> b!273635 (= lt!136492 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!137624 () Bool)

(assert (=> start!26386 (=> (not res!137624) (not e!175341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26386 (= res!137624 (validMask!0 mask!3868))))

(assert (=> start!26386 e!175341))

(declare-fun array_inv!4354 (array!13483) Bool)

(assert (=> start!26386 (array_inv!4354 a!3325)))

(assert (=> start!26386 true))

(declare-fun b!273636 () Bool)

(declare-fun res!137628 () Bool)

(assert (=> b!273636 (=> (not res!137628) (not e!175342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13483 (_ BitVec 32)) Bool)

(assert (=> b!273636 (= res!137628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273637 () Bool)

(assert (=> b!273637 (= e!175343 (not true))))

(assert (=> b!273637 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8585 0))(
  ( (Unit!8586) )
))
(declare-fun lt!136490 () Unit!8585)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8585)

(assert (=> b!273637 (= lt!136490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273637 (= (seekEntryOrOpen!0 (select (arr!6391 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6391 a!3325) i!1267 k!2581) startIndex!26) lt!136491 mask!3868))))

(declare-fun lt!136488 () Unit!8585)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13483 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8585)

(assert (=> b!273637 (= lt!136488 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273637 (arrayNoDuplicates!0 lt!136491 #b00000000000000000000000000000000 Nil!4196)))

(declare-fun lt!136489 () Unit!8585)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13483 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4199) Unit!8585)

(assert (=> b!273637 (= lt!136489 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4196))))

(declare-fun b!273638 () Bool)

(declare-fun res!137626 () Bool)

(assert (=> b!273638 (=> (not res!137626) (not e!175341))))

(declare-fun arrayContainsKey!0 (array!13483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273638 (= res!137626 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26386 res!137624) b!273633))

(assert (= (and b!273633 res!137622) b!273632))

(assert (= (and b!273632 res!137627) b!273634))

(assert (= (and b!273634 res!137621) b!273638))

(assert (= (and b!273638 res!137626) b!273635))

(assert (= (and b!273635 res!137620) b!273636))

(assert (= (and b!273636 res!137628) b!273630))

(assert (= (and b!273630 res!137625) b!273631))

(assert (= (and b!273631 res!137623) b!273637))

(declare-fun m!288885 () Bool)

(assert (=> b!273632 m!288885))

(declare-fun m!288887 () Bool)

(assert (=> start!26386 m!288887))

(declare-fun m!288889 () Bool)

(assert (=> start!26386 m!288889))

(declare-fun m!288891 () Bool)

(assert (=> b!273635 m!288891))

(declare-fun m!288893 () Bool)

(assert (=> b!273638 m!288893))

(declare-fun m!288895 () Bool)

(assert (=> b!273636 m!288895))

(declare-fun m!288897 () Bool)

(assert (=> b!273634 m!288897))

(declare-fun m!288899 () Bool)

(assert (=> b!273630 m!288899))

(declare-fun m!288901 () Bool)

(assert (=> b!273637 m!288901))

(declare-fun m!288903 () Bool)

(assert (=> b!273637 m!288903))

(declare-fun m!288905 () Bool)

(assert (=> b!273637 m!288905))

(assert (=> b!273637 m!288905))

(declare-fun m!288907 () Bool)

(assert (=> b!273637 m!288907))

(assert (=> b!273637 m!288899))

(declare-fun m!288909 () Bool)

(assert (=> b!273637 m!288909))

(declare-fun m!288911 () Bool)

(assert (=> b!273637 m!288911))

(declare-fun m!288913 () Bool)

(assert (=> b!273637 m!288913))

(declare-fun m!288915 () Bool)

(assert (=> b!273637 m!288915))

(assert (=> b!273637 m!288911))

(declare-fun m!288917 () Bool)

(assert (=> b!273637 m!288917))

(assert (=> b!273631 m!288911))

(assert (=> b!273631 m!288911))

(declare-fun m!288919 () Bool)

(assert (=> b!273631 m!288919))

(push 1)

