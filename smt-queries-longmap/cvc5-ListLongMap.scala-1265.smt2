; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26148 () Bool)

(assert start!26148)

(declare-fun b!269969 () Bool)

(declare-datatypes ((Unit!8395 0))(
  ( (Unit!8396) )
))
(declare-fun e!174079 () Unit!8395)

(declare-fun lt!135398 () Unit!8395)

(assert (=> b!269969 (= e!174079 lt!135398)))

(declare-datatypes ((array!13245 0))(
  ( (array!13246 (arr!6272 (Array (_ BitVec 32) (_ BitVec 64))) (size!6624 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13245)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13245 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8395)

(assert (=> b!269969 (= lt!135398 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135397 () array!13245)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13245 (_ BitVec 32)) Bool)

(assert (=> b!269969 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135397 mask!3868)))

(declare-fun b!269970 () Bool)

(declare-fun res!134066 () Bool)

(declare-fun e!174078 () Bool)

(assert (=> b!269970 (=> (not res!134066) (not e!174078))))

(assert (=> b!269970 (= res!134066 (and (= (size!6624 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6624 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6624 a!3325))))))

(declare-fun b!269971 () Bool)

(declare-fun Unit!8397 () Unit!8395)

(assert (=> b!269971 (= e!174079 Unit!8397)))

(declare-fun b!269972 () Bool)

(declare-fun res!134068 () Bool)

(assert (=> b!269972 (=> (not res!134068) (not e!174078))))

(declare-datatypes ((List!4080 0))(
  ( (Nil!4077) (Cons!4076 (h!4743 (_ BitVec 64)) (t!9162 List!4080)) )
))
(declare-fun arrayNoDuplicates!0 (array!13245 (_ BitVec 32) List!4080) Bool)

(assert (=> b!269972 (= res!134068 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4077))))

(declare-fun b!269973 () Bool)

(declare-fun res!134064 () Bool)

(assert (=> b!269973 (=> (not res!134064) (not e!174078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269973 (= res!134064 (validKeyInArray!0 k!2581))))

(declare-fun b!269974 () Bool)

(declare-fun res!134069 () Bool)

(assert (=> b!269974 (=> (not res!134069) (not e!174078))))

(declare-fun arrayContainsKey!0 (array!13245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269974 (= res!134069 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269975 () Bool)

(declare-fun e!174076 () Bool)

(assert (=> b!269975 (= e!174078 e!174076)))

(declare-fun res!134063 () Bool)

(assert (=> b!269975 (=> (not res!134063) (not e!174076))))

(declare-datatypes ((SeekEntryResult!1430 0))(
  ( (MissingZero!1430 (index!7890 (_ BitVec 32))) (Found!1430 (index!7891 (_ BitVec 32))) (Intermediate!1430 (undefined!2242 Bool) (index!7892 (_ BitVec 32)) (x!26235 (_ BitVec 32))) (Undefined!1430) (MissingVacant!1430 (index!7893 (_ BitVec 32))) )
))
(declare-fun lt!135396 () SeekEntryResult!1430)

(assert (=> b!269975 (= res!134063 (or (= lt!135396 (MissingZero!1430 i!1267)) (= lt!135396 (MissingVacant!1430 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13245 (_ BitVec 32)) SeekEntryResult!1430)

(assert (=> b!269975 (= lt!135396 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269977 () Bool)

(declare-fun e!174077 () Bool)

(assert (=> b!269977 (= e!174077 (not true))))

(assert (=> b!269977 (= (seekEntryOrOpen!0 k!2581 lt!135397 mask!3868) (Found!1430 i!1267))))

(declare-fun lt!135399 () Unit!8395)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13245 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8395)

(assert (=> b!269977 (= lt!135399 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135400 () Unit!8395)

(assert (=> b!269977 (= lt!135400 e!174079)))

(declare-fun c!45504 () Bool)

(assert (=> b!269977 (= c!45504 (bvslt startIndex!26 (bvsub (size!6624 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269978 () Bool)

(declare-fun res!134070 () Bool)

(assert (=> b!269978 (=> (not res!134070) (not e!174076))))

(assert (=> b!269978 (= res!134070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!134065 () Bool)

(assert (=> start!26148 (=> (not res!134065) (not e!174078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26148 (= res!134065 (validMask!0 mask!3868))))

(assert (=> start!26148 e!174078))

(declare-fun array_inv!4235 (array!13245) Bool)

(assert (=> start!26148 (array_inv!4235 a!3325)))

(assert (=> start!26148 true))

(declare-fun b!269976 () Bool)

(assert (=> b!269976 (= e!174076 e!174077)))

(declare-fun res!134067 () Bool)

(assert (=> b!269976 (=> (not res!134067) (not e!174077))))

(assert (=> b!269976 (= res!134067 (= startIndex!26 i!1267))))

(assert (=> b!269976 (= lt!135397 (array!13246 (store (arr!6272 a!3325) i!1267 k!2581) (size!6624 a!3325)))))

(assert (= (and start!26148 res!134065) b!269970))

(assert (= (and b!269970 res!134066) b!269973))

(assert (= (and b!269973 res!134064) b!269972))

(assert (= (and b!269972 res!134068) b!269974))

(assert (= (and b!269974 res!134069) b!269975))

(assert (= (and b!269975 res!134063) b!269978))

(assert (= (and b!269978 res!134070) b!269976))

(assert (= (and b!269976 res!134067) b!269977))

(assert (= (and b!269977 c!45504) b!269969))

(assert (= (and b!269977 (not c!45504)) b!269971))

(declare-fun m!285675 () Bool)

(assert (=> b!269977 m!285675))

(declare-fun m!285677 () Bool)

(assert (=> b!269977 m!285677))

(declare-fun m!285679 () Bool)

(assert (=> b!269972 m!285679))

(declare-fun m!285681 () Bool)

(assert (=> b!269974 m!285681))

(declare-fun m!285683 () Bool)

(assert (=> b!269975 m!285683))

(declare-fun m!285685 () Bool)

(assert (=> b!269976 m!285685))

(declare-fun m!285687 () Bool)

(assert (=> start!26148 m!285687))

(declare-fun m!285689 () Bool)

(assert (=> start!26148 m!285689))

(declare-fun m!285691 () Bool)

(assert (=> b!269978 m!285691))

(declare-fun m!285693 () Bool)

(assert (=> b!269969 m!285693))

(declare-fun m!285695 () Bool)

(assert (=> b!269969 m!285695))

(declare-fun m!285697 () Bool)

(assert (=> b!269973 m!285697))

(push 1)

