; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26140 () Bool)

(assert start!26140)

(declare-fun b!269849 () Bool)

(declare-datatypes ((Unit!8383 0))(
  ( (Unit!8384) )
))
(declare-fun e!174018 () Unit!8383)

(declare-fun Unit!8385 () Unit!8383)

(assert (=> b!269849 (= e!174018 Unit!8385)))

(declare-fun b!269850 () Bool)

(declare-fun e!174016 () Bool)

(assert (=> b!269850 (= e!174016 (not true))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((array!13237 0))(
  ( (array!13238 (arr!6268 (Array (_ BitVec 32) (_ BitVec 64))) (size!6620 (_ BitVec 32))) )
))
(declare-fun lt!135336 () array!13237)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1426 0))(
  ( (MissingZero!1426 (index!7874 (_ BitVec 32))) (Found!1426 (index!7875 (_ BitVec 32))) (Intermediate!1426 (undefined!2238 Bool) (index!7876 (_ BitVec 32)) (x!26215 (_ BitVec 32))) (Undefined!1426) (MissingVacant!1426 (index!7877 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13237 (_ BitVec 32)) SeekEntryResult!1426)

(assert (=> b!269850 (= (seekEntryOrOpen!0 k!2581 lt!135336 mask!3868) (Found!1426 i!1267))))

(declare-fun a!3325 () array!13237)

(declare-fun lt!135338 () Unit!8383)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13237 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8383)

(assert (=> b!269850 (= lt!135338 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135339 () Unit!8383)

(assert (=> b!269850 (= lt!135339 e!174018)))

(declare-fun c!45492 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269850 (= c!45492 (bvslt startIndex!26 (bvsub (size!6620 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269851 () Bool)

(declare-fun e!174020 () Bool)

(declare-fun e!174019 () Bool)

(assert (=> b!269851 (= e!174020 e!174019)))

(declare-fun res!133973 () Bool)

(assert (=> b!269851 (=> (not res!133973) (not e!174019))))

(declare-fun lt!135337 () SeekEntryResult!1426)

(assert (=> b!269851 (= res!133973 (or (= lt!135337 (MissingZero!1426 i!1267)) (= lt!135337 (MissingVacant!1426 i!1267))))))

(assert (=> b!269851 (= lt!135337 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269852 () Bool)

(declare-fun res!133967 () Bool)

(assert (=> b!269852 (=> (not res!133967) (not e!174019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13237 (_ BitVec 32)) Bool)

(assert (=> b!269852 (= res!133967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269854 () Bool)

(declare-fun res!133970 () Bool)

(assert (=> b!269854 (=> (not res!133970) (not e!174020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269854 (= res!133970 (validKeyInArray!0 k!2581))))

(declare-fun b!269855 () Bool)

(declare-fun lt!135340 () Unit!8383)

(assert (=> b!269855 (= e!174018 lt!135340)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13237 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8383)

(assert (=> b!269855 (= lt!135340 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269855 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135336 mask!3868)))

(declare-fun b!269856 () Bool)

(assert (=> b!269856 (= e!174019 e!174016)))

(declare-fun res!133971 () Bool)

(assert (=> b!269856 (=> (not res!133971) (not e!174016))))

(assert (=> b!269856 (= res!133971 (= startIndex!26 i!1267))))

(assert (=> b!269856 (= lt!135336 (array!13238 (store (arr!6268 a!3325) i!1267 k!2581) (size!6620 a!3325)))))

(declare-fun res!133969 () Bool)

(assert (=> start!26140 (=> (not res!133969) (not e!174020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26140 (= res!133969 (validMask!0 mask!3868))))

(assert (=> start!26140 e!174020))

(declare-fun array_inv!4231 (array!13237) Bool)

(assert (=> start!26140 (array_inv!4231 a!3325)))

(assert (=> start!26140 true))

(declare-fun b!269853 () Bool)

(declare-fun res!133974 () Bool)

(assert (=> b!269853 (=> (not res!133974) (not e!174020))))

(assert (=> b!269853 (= res!133974 (and (= (size!6620 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6620 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6620 a!3325))))))

(declare-fun b!269857 () Bool)

(declare-fun res!133972 () Bool)

(assert (=> b!269857 (=> (not res!133972) (not e!174020))))

(declare-fun arrayContainsKey!0 (array!13237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269857 (= res!133972 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269858 () Bool)

(declare-fun res!133968 () Bool)

(assert (=> b!269858 (=> (not res!133968) (not e!174020))))

(declare-datatypes ((List!4076 0))(
  ( (Nil!4073) (Cons!4072 (h!4739 (_ BitVec 64)) (t!9158 List!4076)) )
))
(declare-fun arrayNoDuplicates!0 (array!13237 (_ BitVec 32) List!4076) Bool)

(assert (=> b!269858 (= res!133968 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4073))))

(assert (= (and start!26140 res!133969) b!269853))

(assert (= (and b!269853 res!133974) b!269854))

(assert (= (and b!269854 res!133970) b!269858))

(assert (= (and b!269858 res!133968) b!269857))

(assert (= (and b!269857 res!133972) b!269851))

(assert (= (and b!269851 res!133973) b!269852))

(assert (= (and b!269852 res!133967) b!269856))

(assert (= (and b!269856 res!133971) b!269850))

(assert (= (and b!269850 c!45492) b!269855))

(assert (= (and b!269850 (not c!45492)) b!269849))

(declare-fun m!285579 () Bool)

(assert (=> b!269858 m!285579))

(declare-fun m!285581 () Bool)

(assert (=> b!269852 m!285581))

(declare-fun m!285583 () Bool)

(assert (=> b!269856 m!285583))

(declare-fun m!285585 () Bool)

(assert (=> b!269855 m!285585))

(declare-fun m!285587 () Bool)

(assert (=> b!269855 m!285587))

(declare-fun m!285589 () Bool)

(assert (=> b!269857 m!285589))

(declare-fun m!285591 () Bool)

(assert (=> start!26140 m!285591))

(declare-fun m!285593 () Bool)

(assert (=> start!26140 m!285593))

(declare-fun m!285595 () Bool)

(assert (=> b!269854 m!285595))

(declare-fun m!285597 () Bool)

(assert (=> b!269850 m!285597))

(declare-fun m!285599 () Bool)

(assert (=> b!269850 m!285599))

(declare-fun m!285601 () Bool)

(assert (=> b!269851 m!285601))

(push 1)

(assert (not b!269858))

(assert (not b!269857))

(assert (not start!26140))

(assert (not b!269852))

(assert (not b!269851))

(assert (not b!269855))

