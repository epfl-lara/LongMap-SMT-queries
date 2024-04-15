; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26138 () Bool)

(assert start!26138)

(declare-fun b!269642 () Bool)

(declare-fun res!133825 () Bool)

(declare-fun e!173889 () Bool)

(assert (=> b!269642 (=> (not res!133825) (not e!173889))))

(declare-datatypes ((array!13224 0))(
  ( (array!13225 (arr!6261 (Array (_ BitVec 32) (_ BitVec 64))) (size!6614 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13224)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269642 (= res!133825 (and (= (size!6614 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6614 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6614 a!3325))))))

(declare-fun b!269643 () Bool)

(declare-fun res!133826 () Bool)

(assert (=> b!269643 (=> (not res!133826) (not e!173889))))

(declare-datatypes ((List!4042 0))(
  ( (Nil!4039) (Cons!4038 (h!4705 (_ BitVec 64)) (t!9115 List!4042)) )
))
(declare-fun arrayNoDuplicates!0 (array!13224 (_ BitVec 32) List!4042) Bool)

(assert (=> b!269643 (= res!133826 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4039))))

(declare-fun b!269644 () Bool)

(declare-datatypes ((Unit!8331 0))(
  ( (Unit!8332) )
))
(declare-fun e!173886 () Unit!8331)

(declare-fun Unit!8333 () Unit!8331)

(assert (=> b!269644 (= e!173886 Unit!8333)))

(declare-fun b!269645 () Bool)

(declare-fun e!173887 () Bool)

(assert (=> b!269645 (= e!173889 e!173887)))

(declare-fun res!133830 () Bool)

(assert (=> b!269645 (=> (not res!133830) (not e!173887))))

(declare-datatypes ((SeekEntryResult!1418 0))(
  ( (MissingZero!1418 (index!7842 (_ BitVec 32))) (Found!1418 (index!7843 (_ BitVec 32))) (Intermediate!1418 (undefined!2230 Bool) (index!7844 (_ BitVec 32)) (x!26206 (_ BitVec 32))) (Undefined!1418) (MissingVacant!1418 (index!7845 (_ BitVec 32))) )
))
(declare-fun lt!135129 () SeekEntryResult!1418)

(assert (=> b!269645 (= res!133830 (or (= lt!135129 (MissingZero!1418 i!1267)) (= lt!135129 (MissingVacant!1418 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13224 (_ BitVec 32)) SeekEntryResult!1418)

(assert (=> b!269645 (= lt!135129 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269646 () Bool)

(declare-fun res!133831 () Bool)

(assert (=> b!269646 (=> (not res!133831) (not e!173889))))

(declare-fun arrayContainsKey!0 (array!13224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269646 (= res!133831 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269647 () Bool)

(declare-fun lt!135128 () Unit!8331)

(assert (=> b!269647 (= e!173886 lt!135128)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13224 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8331)

(assert (=> b!269647 (= lt!135128 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135125 () array!13224)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13224 (_ BitVec 32)) Bool)

(assert (=> b!269647 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135125 mask!3868)))

(declare-fun b!269648 () Bool)

(declare-fun res!133824 () Bool)

(assert (=> b!269648 (=> (not res!133824) (not e!173889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269648 (= res!133824 (validKeyInArray!0 k0!2581))))

(declare-fun b!269650 () Bool)

(declare-fun res!133829 () Bool)

(assert (=> b!269650 (=> (not res!133829) (not e!173887))))

(assert (=> b!269650 (= res!133829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269651 () Bool)

(declare-fun e!173885 () Bool)

(assert (=> b!269651 (= e!173885 (not true))))

(assert (=> b!269651 (= (seekEntryOrOpen!0 k0!2581 lt!135125 mask!3868) (Found!1418 i!1267))))

(declare-fun lt!135127 () Unit!8331)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13224 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8331)

(assert (=> b!269651 (= lt!135127 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135126 () Unit!8331)

(assert (=> b!269651 (= lt!135126 e!173886)))

(declare-fun c!45460 () Bool)

(assert (=> b!269651 (= c!45460 (bvslt startIndex!26 (bvsub (size!6614 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269649 () Bool)

(assert (=> b!269649 (= e!173887 e!173885)))

(declare-fun res!133827 () Bool)

(assert (=> b!269649 (=> (not res!133827) (not e!173885))))

(assert (=> b!269649 (= res!133827 (= startIndex!26 i!1267))))

(assert (=> b!269649 (= lt!135125 (array!13225 (store (arr!6261 a!3325) i!1267 k0!2581) (size!6614 a!3325)))))

(declare-fun res!133828 () Bool)

(assert (=> start!26138 (=> (not res!133828) (not e!173889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26138 (= res!133828 (validMask!0 mask!3868))))

(assert (=> start!26138 e!173889))

(declare-fun array_inv!4233 (array!13224) Bool)

(assert (=> start!26138 (array_inv!4233 a!3325)))

(assert (=> start!26138 true))

(assert (= (and start!26138 res!133828) b!269642))

(assert (= (and b!269642 res!133825) b!269648))

(assert (= (and b!269648 res!133824) b!269643))

(assert (= (and b!269643 res!133826) b!269646))

(assert (= (and b!269646 res!133831) b!269645))

(assert (= (and b!269645 res!133830) b!269650))

(assert (= (and b!269650 res!133829) b!269649))

(assert (= (and b!269649 res!133827) b!269651))

(assert (= (and b!269651 c!45460) b!269647))

(assert (= (and b!269651 (not c!45460)) b!269644))

(declare-fun m!284939 () Bool)

(assert (=> b!269650 m!284939))

(declare-fun m!284941 () Bool)

(assert (=> b!269647 m!284941))

(declare-fun m!284943 () Bool)

(assert (=> b!269647 m!284943))

(declare-fun m!284945 () Bool)

(assert (=> b!269643 m!284945))

(declare-fun m!284947 () Bool)

(assert (=> b!269645 m!284947))

(declare-fun m!284949 () Bool)

(assert (=> b!269651 m!284949))

(declare-fun m!284951 () Bool)

(assert (=> b!269651 m!284951))

(declare-fun m!284953 () Bool)

(assert (=> start!26138 m!284953))

(declare-fun m!284955 () Bool)

(assert (=> start!26138 m!284955))

(declare-fun m!284957 () Bool)

(assert (=> b!269646 m!284957))

(declare-fun m!284959 () Bool)

(assert (=> b!269648 m!284959))

(declare-fun m!284961 () Bool)

(assert (=> b!269649 m!284961))

(check-sat (not b!269647) (not b!269646) (not start!26138) (not b!269648) (not b!269650) (not b!269645) (not b!269651) (not b!269643))
(check-sat)
