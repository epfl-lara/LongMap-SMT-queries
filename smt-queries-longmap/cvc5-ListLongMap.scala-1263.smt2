; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26136 () Bool)

(assert start!26136)

(declare-fun b!269789 () Bool)

(declare-fun e!173990 () Bool)

(declare-fun e!173988 () Bool)

(assert (=> b!269789 (= e!173990 e!173988)))

(declare-fun res!133926 () Bool)

(assert (=> b!269789 (=> (not res!133926) (not e!173988))))

(declare-datatypes ((SeekEntryResult!1424 0))(
  ( (MissingZero!1424 (index!7866 (_ BitVec 32))) (Found!1424 (index!7867 (_ BitVec 32))) (Intermediate!1424 (undefined!2236 Bool) (index!7868 (_ BitVec 32)) (x!26213 (_ BitVec 32))) (Undefined!1424) (MissingVacant!1424 (index!7869 (_ BitVec 32))) )
))
(declare-fun lt!135310 () SeekEntryResult!1424)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269789 (= res!133926 (or (= lt!135310 (MissingZero!1424 i!1267)) (= lt!135310 (MissingVacant!1424 i!1267))))))

(declare-datatypes ((array!13233 0))(
  ( (array!13234 (arr!6266 (Array (_ BitVec 32) (_ BitVec 64))) (size!6618 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13233)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13233 (_ BitVec 32)) SeekEntryResult!1424)

(assert (=> b!269789 (= lt!135310 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269790 () Bool)

(declare-fun e!173987 () Bool)

(assert (=> b!269790 (= e!173987 (not true))))

(declare-fun lt!135309 () array!13233)

(assert (=> b!269790 (= (seekEntryOrOpen!0 k!2581 lt!135309 mask!3868) (Found!1424 i!1267))))

(declare-datatypes ((Unit!8377 0))(
  ( (Unit!8378) )
))
(declare-fun lt!135307 () Unit!8377)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8377)

(assert (=> b!269790 (= lt!135307 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135308 () Unit!8377)

(declare-fun e!173986 () Unit!8377)

(assert (=> b!269790 (= lt!135308 e!173986)))

(declare-fun c!45486 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269790 (= c!45486 (bvslt startIndex!26 (bvsub (size!6618 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269791 () Bool)

(declare-fun res!133920 () Bool)

(assert (=> b!269791 (=> (not res!133920) (not e!173990))))

(declare-fun arrayContainsKey!0 (array!13233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269791 (= res!133920 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269792 () Bool)

(declare-fun lt!135306 () Unit!8377)

(assert (=> b!269792 (= e!173986 lt!135306)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8377)

(assert (=> b!269792 (= lt!135306 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13233 (_ BitVec 32)) Bool)

(assert (=> b!269792 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135309 mask!3868)))

(declare-fun b!269793 () Bool)

(declare-fun res!133922 () Bool)

(assert (=> b!269793 (=> (not res!133922) (not e!173990))))

(declare-datatypes ((List!4074 0))(
  ( (Nil!4071) (Cons!4070 (h!4737 (_ BitVec 64)) (t!9156 List!4074)) )
))
(declare-fun arrayNoDuplicates!0 (array!13233 (_ BitVec 32) List!4074) Bool)

(assert (=> b!269793 (= res!133922 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4071))))

(declare-fun res!133923 () Bool)

(assert (=> start!26136 (=> (not res!133923) (not e!173990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26136 (= res!133923 (validMask!0 mask!3868))))

(assert (=> start!26136 e!173990))

(declare-fun array_inv!4229 (array!13233) Bool)

(assert (=> start!26136 (array_inv!4229 a!3325)))

(assert (=> start!26136 true))

(declare-fun b!269794 () Bool)

(declare-fun Unit!8379 () Unit!8377)

(assert (=> b!269794 (= e!173986 Unit!8379)))

(declare-fun b!269795 () Bool)

(declare-fun res!133925 () Bool)

(assert (=> b!269795 (=> (not res!133925) (not e!173988))))

(assert (=> b!269795 (= res!133925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269796 () Bool)

(declare-fun res!133919 () Bool)

(assert (=> b!269796 (=> (not res!133919) (not e!173990))))

(assert (=> b!269796 (= res!133919 (and (= (size!6618 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6618 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6618 a!3325))))))

(declare-fun b!269797 () Bool)

(declare-fun res!133924 () Bool)

(assert (=> b!269797 (=> (not res!133924) (not e!173990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269797 (= res!133924 (validKeyInArray!0 k!2581))))

(declare-fun b!269798 () Bool)

(assert (=> b!269798 (= e!173988 e!173987)))

(declare-fun res!133921 () Bool)

(assert (=> b!269798 (=> (not res!133921) (not e!173987))))

(assert (=> b!269798 (= res!133921 (= startIndex!26 i!1267))))

(assert (=> b!269798 (= lt!135309 (array!13234 (store (arr!6266 a!3325) i!1267 k!2581) (size!6618 a!3325)))))

(assert (= (and start!26136 res!133923) b!269796))

(assert (= (and b!269796 res!133919) b!269797))

(assert (= (and b!269797 res!133924) b!269793))

(assert (= (and b!269793 res!133922) b!269791))

(assert (= (and b!269791 res!133920) b!269789))

(assert (= (and b!269789 res!133926) b!269795))

(assert (= (and b!269795 res!133925) b!269798))

(assert (= (and b!269798 res!133921) b!269790))

(assert (= (and b!269790 c!45486) b!269792))

(assert (= (and b!269790 (not c!45486)) b!269794))

(declare-fun m!285531 () Bool)

(assert (=> b!269793 m!285531))

(declare-fun m!285533 () Bool)

(assert (=> b!269789 m!285533))

(declare-fun m!285535 () Bool)

(assert (=> b!269791 m!285535))

(declare-fun m!285537 () Bool)

(assert (=> b!269797 m!285537))

(declare-fun m!285539 () Bool)

(assert (=> b!269790 m!285539))

(declare-fun m!285541 () Bool)

(assert (=> b!269790 m!285541))

(declare-fun m!285543 () Bool)

(assert (=> start!26136 m!285543))

(declare-fun m!285545 () Bool)

(assert (=> start!26136 m!285545))

(declare-fun m!285547 () Bool)

(assert (=> b!269792 m!285547))

(declare-fun m!285549 () Bool)

(assert (=> b!269792 m!285549))

(declare-fun m!285551 () Bool)

(assert (=> b!269795 m!285551))

(declare-fun m!285553 () Bool)

(assert (=> b!269798 m!285553))

(push 1)

