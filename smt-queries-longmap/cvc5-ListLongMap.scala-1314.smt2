; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26442 () Bool)

(assert start!26442)

(declare-fun b!274406 () Bool)

(declare-fun e!175697 () Bool)

(assert (=> b!274406 (= e!175697 true)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13539 0))(
  ( (array!13540 (arr!6419 (Array (_ BitVec 32) (_ BitVec 64))) (size!6771 (_ BitVec 32))) )
))
(declare-fun lt!136931 () array!13539)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13539 (_ BitVec 32)) Bool)

(assert (=> b!274406 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136931 mask!3868)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((Unit!8641 0))(
  ( (Unit!8642) )
))
(declare-fun lt!136933 () Unit!8641)

(declare-fun a!3325 () array!13539)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13539 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8641)

(assert (=> b!274406 (= lt!136933 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274407 () Bool)

(declare-fun res!138404 () Bool)

(declare-fun e!175696 () Bool)

(assert (=> b!274407 (=> (not res!138404) (not e!175696))))

(declare-fun arrayContainsKey!0 (array!13539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274407 (= res!138404 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274408 () Bool)

(declare-fun e!175699 () Bool)

(declare-fun e!175698 () Bool)

(assert (=> b!274408 (= e!175699 e!175698)))

(declare-fun res!138403 () Bool)

(assert (=> b!274408 (=> (not res!138403) (not e!175698))))

(assert (=> b!274408 (= res!138403 (not (= startIndex!26 i!1267)))))

(assert (=> b!274408 (= lt!136931 (array!13540 (store (arr!6419 a!3325) i!1267 k!2581) (size!6771 a!3325)))))

(declare-fun b!274409 () Bool)

(declare-fun res!138405 () Bool)

(assert (=> b!274409 (=> (not res!138405) (not e!175696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274409 (= res!138405 (validKeyInArray!0 k!2581))))

(declare-fun res!138397 () Bool)

(assert (=> start!26442 (=> (not res!138397) (not e!175696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26442 (= res!138397 (validMask!0 mask!3868))))

(assert (=> start!26442 e!175696))

(declare-fun array_inv!4382 (array!13539) Bool)

(assert (=> start!26442 (array_inv!4382 a!3325)))

(assert (=> start!26442 true))

(declare-fun b!274410 () Bool)

(declare-fun res!138400 () Bool)

(assert (=> b!274410 (=> (not res!138400) (not e!175696))))

(declare-datatypes ((List!4227 0))(
  ( (Nil!4224) (Cons!4223 (h!4890 (_ BitVec 64)) (t!9309 List!4227)) )
))
(declare-fun arrayNoDuplicates!0 (array!13539 (_ BitVec 32) List!4227) Bool)

(assert (=> b!274410 (= res!138400 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4224))))

(declare-fun b!274411 () Bool)

(assert (=> b!274411 (= e!175698 (not e!175697))))

(declare-fun res!138402 () Bool)

(assert (=> b!274411 (=> res!138402 e!175697)))

(assert (=> b!274411 (= res!138402 (or (bvsge startIndex!26 (bvsub (size!6771 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274411 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!136930 () Unit!8641)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8641)

(assert (=> b!274411 (= lt!136930 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1577 0))(
  ( (MissingZero!1577 (index!8478 (_ BitVec 32))) (Found!1577 (index!8479 (_ BitVec 32))) (Intermediate!1577 (undefined!2389 Bool) (index!8480 (_ BitVec 32)) (x!26774 (_ BitVec 32))) (Undefined!1577) (MissingVacant!1577 (index!8481 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13539 (_ BitVec 32)) SeekEntryResult!1577)

(assert (=> b!274411 (= (seekEntryOrOpen!0 (select (arr!6419 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6419 a!3325) i!1267 k!2581) startIndex!26) lt!136931 mask!3868))))

(declare-fun lt!136929 () Unit!8641)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13539 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8641)

(assert (=> b!274411 (= lt!136929 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!274411 (arrayNoDuplicates!0 lt!136931 #b00000000000000000000000000000000 Nil!4224)))

(declare-fun lt!136928 () Unit!8641)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13539 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4227) Unit!8641)

(assert (=> b!274411 (= lt!136928 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4224))))

(declare-fun b!274412 () Bool)

(declare-fun res!138396 () Bool)

(assert (=> b!274412 (=> (not res!138396) (not e!175696))))

(assert (=> b!274412 (= res!138396 (and (= (size!6771 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6771 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6771 a!3325))))))

(declare-fun b!274413 () Bool)

(declare-fun res!138399 () Bool)

(assert (=> b!274413 (=> (not res!138399) (not e!175698))))

(assert (=> b!274413 (= res!138399 (validKeyInArray!0 (select (arr!6419 a!3325) startIndex!26)))))

(declare-fun b!274414 () Bool)

(declare-fun res!138398 () Bool)

(assert (=> b!274414 (=> (not res!138398) (not e!175699))))

(assert (=> b!274414 (= res!138398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274415 () Bool)

(assert (=> b!274415 (= e!175696 e!175699)))

(declare-fun res!138401 () Bool)

(assert (=> b!274415 (=> (not res!138401) (not e!175699))))

(declare-fun lt!136932 () SeekEntryResult!1577)

(assert (=> b!274415 (= res!138401 (or (= lt!136932 (MissingZero!1577 i!1267)) (= lt!136932 (MissingVacant!1577 i!1267))))))

(assert (=> b!274415 (= lt!136932 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26442 res!138397) b!274412))

(assert (= (and b!274412 res!138396) b!274409))

(assert (= (and b!274409 res!138405) b!274410))

(assert (= (and b!274410 res!138400) b!274407))

(assert (= (and b!274407 res!138404) b!274415))

(assert (= (and b!274415 res!138401) b!274414))

(assert (= (and b!274414 res!138398) b!274408))

(assert (= (and b!274408 res!138403) b!274413))

(assert (= (and b!274413 res!138399) b!274411))

(assert (= (and b!274411 (not res!138402)) b!274406))

(declare-fun m!289917 () Bool)

(assert (=> b!274415 m!289917))

(declare-fun m!289919 () Bool)

(assert (=> start!26442 m!289919))

(declare-fun m!289921 () Bool)

(assert (=> start!26442 m!289921))

(declare-fun m!289923 () Bool)

(assert (=> b!274408 m!289923))

(declare-fun m!289925 () Bool)

(assert (=> b!274410 m!289925))

(declare-fun m!289927 () Bool)

(assert (=> b!274414 m!289927))

(declare-fun m!289929 () Bool)

(assert (=> b!274411 m!289929))

(declare-fun m!289931 () Bool)

(assert (=> b!274411 m!289931))

(declare-fun m!289933 () Bool)

(assert (=> b!274411 m!289933))

(assert (=> b!274411 m!289931))

(declare-fun m!289935 () Bool)

(assert (=> b!274411 m!289935))

(assert (=> b!274411 m!289923))

(declare-fun m!289937 () Bool)

(assert (=> b!274411 m!289937))

(declare-fun m!289939 () Bool)

(assert (=> b!274411 m!289939))

(declare-fun m!289941 () Bool)

(assert (=> b!274411 m!289941))

(declare-fun m!289943 () Bool)

(assert (=> b!274411 m!289943))

(assert (=> b!274411 m!289939))

(declare-fun m!289945 () Bool)

(assert (=> b!274411 m!289945))

(declare-fun m!289947 () Bool)

(assert (=> b!274406 m!289947))

(declare-fun m!289949 () Bool)

(assert (=> b!274406 m!289949))

(declare-fun m!289951 () Bool)

(assert (=> b!274409 m!289951))

(assert (=> b!274413 m!289939))

(assert (=> b!274413 m!289939))

(declare-fun m!289953 () Bool)

(assert (=> b!274413 m!289953))

(declare-fun m!289955 () Bool)

(assert (=> b!274407 m!289955))

(push 1)

