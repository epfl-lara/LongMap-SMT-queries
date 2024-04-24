; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26742 () Bool)

(assert start!26742)

(declare-fun b!277855 () Bool)

(declare-fun res!141660 () Bool)

(declare-fun e!177236 () Bool)

(assert (=> b!277855 (=> (not res!141660) (not e!177236))))

(declare-datatypes ((array!13838 0))(
  ( (array!13839 (arr!6568 (Array (_ BitVec 32) (_ BitVec 64))) (size!6920 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13838)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277855 (= res!141660 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!141655 () Bool)

(assert (=> start!26742 (=> (not res!141655) (not e!177236))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26742 (= res!141655 (validMask!0 mask!3868))))

(assert (=> start!26742 e!177236))

(declare-fun array_inv!4518 (array!13838) Bool)

(assert (=> start!26742 (array_inv!4518 a!3325)))

(assert (=> start!26742 true))

(declare-fun b!277856 () Bool)

(declare-fun e!177234 () Bool)

(assert (=> b!277856 (= e!177236 e!177234)))

(declare-fun res!141659 () Bool)

(assert (=> b!277856 (=> (not res!141659) (not e!177234))))

(declare-datatypes ((SeekEntryResult!1691 0))(
  ( (MissingZero!1691 (index!8934 (_ BitVec 32))) (Found!1691 (index!8935 (_ BitVec 32))) (Intermediate!1691 (undefined!2503 Bool) (index!8936 (_ BitVec 32)) (x!27288 (_ BitVec 32))) (Undefined!1691) (MissingVacant!1691 (index!8937 (_ BitVec 32))) )
))
(declare-fun lt!138130 () SeekEntryResult!1691)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277856 (= res!141659 (or (= lt!138130 (MissingZero!1691 i!1267)) (= lt!138130 (MissingVacant!1691 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13838 (_ BitVec 32)) SeekEntryResult!1691)

(assert (=> b!277856 (= lt!138130 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277857 () Bool)

(declare-datatypes ((Unit!8762 0))(
  ( (Unit!8763) )
))
(declare-fun e!177235 () Unit!8762)

(declare-fun Unit!8764 () Unit!8762)

(assert (=> b!277857 (= e!177235 Unit!8764)))

(declare-fun b!277858 () Bool)

(declare-fun res!141654 () Bool)

(assert (=> b!277858 (=> (not res!141654) (not e!177234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13838 (_ BitVec 32)) Bool)

(assert (=> b!277858 (= res!141654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277859 () Bool)

(declare-fun e!177232 () Bool)

(assert (=> b!277859 (= e!177234 e!177232)))

(declare-fun res!141653 () Bool)

(assert (=> b!277859 (=> (not res!141653) (not e!177232))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!277859 (= res!141653 (= startIndex!26 i!1267))))

(declare-fun lt!138129 () array!13838)

(assert (=> b!277859 (= lt!138129 (array!13839 (store (arr!6568 a!3325) i!1267 k0!2581) (size!6920 a!3325)))))

(declare-fun b!277860 () Bool)

(declare-fun res!141656 () Bool)

(assert (=> b!277860 (=> (not res!141656) (not e!177236))))

(declare-datatypes ((List!4289 0))(
  ( (Nil!4286) (Cons!4285 (h!4952 (_ BitVec 64)) (t!9363 List!4289)) )
))
(declare-fun arrayNoDuplicates!0 (array!13838 (_ BitVec 32) List!4289) Bool)

(assert (=> b!277860 (= res!141656 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4286))))

(declare-fun b!277861 () Bool)

(assert (=> b!277861 (= e!177232 (not true))))

(assert (=> b!277861 (= (seekEntryOrOpen!0 k0!2581 lt!138129 mask!3868) (Found!1691 i!1267))))

(declare-fun lt!138131 () Unit!8762)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13838 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8762)

(assert (=> b!277861 (= lt!138131 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!138128 () Unit!8762)

(assert (=> b!277861 (= lt!138128 e!177235)))

(declare-fun c!45652 () Bool)

(assert (=> b!277861 (= c!45652 (bvslt startIndex!26 (bvsub (size!6920 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277862 () Bool)

(declare-fun lt!138132 () Unit!8762)

(assert (=> b!277862 (= e!177235 lt!138132)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13838 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8762)

(assert (=> b!277862 (= lt!138132 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277862 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138129 mask!3868)))

(declare-fun b!277863 () Bool)

(declare-fun res!141658 () Bool)

(assert (=> b!277863 (=> (not res!141658) (not e!177236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277863 (= res!141658 (validKeyInArray!0 k0!2581))))

(declare-fun b!277864 () Bool)

(declare-fun res!141657 () Bool)

(assert (=> b!277864 (=> (not res!141657) (not e!177236))))

(assert (=> b!277864 (= res!141657 (and (= (size!6920 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6920 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6920 a!3325))))))

(assert (= (and start!26742 res!141655) b!277864))

(assert (= (and b!277864 res!141657) b!277863))

(assert (= (and b!277863 res!141658) b!277860))

(assert (= (and b!277860 res!141656) b!277855))

(assert (= (and b!277855 res!141660) b!277856))

(assert (= (and b!277856 res!141659) b!277858))

(assert (= (and b!277858 res!141654) b!277859))

(assert (= (and b!277859 res!141653) b!277861))

(assert (= (and b!277861 c!45652) b!277862))

(assert (= (and b!277861 (not c!45652)) b!277857))

(declare-fun m!292949 () Bool)

(assert (=> b!277859 m!292949))

(declare-fun m!292951 () Bool)

(assert (=> b!277856 m!292951))

(declare-fun m!292953 () Bool)

(assert (=> b!277863 m!292953))

(declare-fun m!292955 () Bool)

(assert (=> start!26742 m!292955))

(declare-fun m!292957 () Bool)

(assert (=> start!26742 m!292957))

(declare-fun m!292959 () Bool)

(assert (=> b!277855 m!292959))

(declare-fun m!292961 () Bool)

(assert (=> b!277860 m!292961))

(declare-fun m!292963 () Bool)

(assert (=> b!277861 m!292963))

(declare-fun m!292965 () Bool)

(assert (=> b!277861 m!292965))

(declare-fun m!292967 () Bool)

(assert (=> b!277862 m!292967))

(declare-fun m!292969 () Bool)

(assert (=> b!277862 m!292969))

(declare-fun m!292971 () Bool)

(assert (=> b!277858 m!292971))

(check-sat (not b!277856) (not b!277860) (not b!277861) (not b!277862) (not start!26742) (not b!277855) (not b!277858) (not b!277863))
(check-sat)
