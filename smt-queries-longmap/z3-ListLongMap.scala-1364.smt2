; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26744 () Bool)

(assert start!26744)

(declare-fun b!277661 () Bool)

(declare-datatypes ((Unit!8736 0))(
  ( (Unit!8737) )
))
(declare-fun e!177107 () Unit!8736)

(declare-fun lt!137889 () Unit!8736)

(assert (=> b!277661 (= e!177107 lt!137889)))

(declare-datatypes ((array!13830 0))(
  ( (array!13831 (arr!6564 (Array (_ BitVec 32) (_ BitVec 64))) (size!6917 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13830)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13830 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8736)

(assert (=> b!277661 (= lt!137889 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!137891 () array!13830)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13830 (_ BitVec 32)) Bool)

(assert (=> b!277661 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!137891 mask!3868)))

(declare-fun b!277662 () Bool)

(declare-fun Unit!8738 () Unit!8736)

(assert (=> b!277662 (= e!177107 Unit!8738)))

(declare-fun b!277663 () Bool)

(declare-fun res!141544 () Bool)

(declare-fun e!177110 () Bool)

(assert (=> b!277663 (=> (not res!141544) (not e!177110))))

(assert (=> b!277663 (= res!141544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277664 () Bool)

(declare-fun e!177111 () Bool)

(assert (=> b!277664 (= e!177111 e!177110)))

(declare-fun res!141542 () Bool)

(assert (=> b!277664 (=> (not res!141542) (not e!177110))))

(declare-datatypes ((SeekEntryResult!1721 0))(
  ( (MissingZero!1721 (index!9054 (_ BitVec 32))) (Found!1721 (index!9055 (_ BitVec 32))) (Intermediate!1721 (undefined!2533 Bool) (index!9056 (_ BitVec 32)) (x!27317 (_ BitVec 32))) (Undefined!1721) (MissingVacant!1721 (index!9057 (_ BitVec 32))) )
))
(declare-fun lt!137890 () SeekEntryResult!1721)

(assert (=> b!277664 (= res!141542 (or (= lt!137890 (MissingZero!1721 i!1267)) (= lt!137890 (MissingVacant!1721 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13830 (_ BitVec 32)) SeekEntryResult!1721)

(assert (=> b!277664 (= lt!137890 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277665 () Bool)

(declare-fun res!141537 () Bool)

(assert (=> b!277665 (=> (not res!141537) (not e!177111))))

(assert (=> b!277665 (= res!141537 (and (= (size!6917 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6917 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6917 a!3325))))))

(declare-fun b!277666 () Bool)

(declare-fun res!141538 () Bool)

(assert (=> b!277666 (=> (not res!141538) (not e!177111))))

(declare-datatypes ((List!4345 0))(
  ( (Nil!4342) (Cons!4341 (h!5008 (_ BitVec 64)) (t!9418 List!4345)) )
))
(declare-fun arrayNoDuplicates!0 (array!13830 (_ BitVec 32) List!4345) Bool)

(assert (=> b!277666 (= res!141538 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4342))))

(declare-fun b!277667 () Bool)

(declare-fun e!177109 () Bool)

(assert (=> b!277667 (= e!177109 (not true))))

(assert (=> b!277667 (= (seekEntryOrOpen!0 k0!2581 lt!137891 mask!3868) (Found!1721 i!1267))))

(declare-fun lt!137888 () Unit!8736)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13830 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8736)

(assert (=> b!277667 (= lt!137888 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!137892 () Unit!8736)

(assert (=> b!277667 (= lt!137892 e!177107)))

(declare-fun c!45613 () Bool)

(assert (=> b!277667 (= c!45613 (bvslt startIndex!26 (bvsub (size!6917 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141539 () Bool)

(assert (=> start!26744 (=> (not res!141539) (not e!177111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26744 (= res!141539 (validMask!0 mask!3868))))

(assert (=> start!26744 e!177111))

(declare-fun array_inv!4536 (array!13830) Bool)

(assert (=> start!26744 (array_inv!4536 a!3325)))

(assert (=> start!26744 true))

(declare-fun b!277668 () Bool)

(assert (=> b!277668 (= e!177110 e!177109)))

(declare-fun res!141543 () Bool)

(assert (=> b!277668 (=> (not res!141543) (not e!177109))))

(assert (=> b!277668 (= res!141543 (= startIndex!26 i!1267))))

(assert (=> b!277668 (= lt!137891 (array!13831 (store (arr!6564 a!3325) i!1267 k0!2581) (size!6917 a!3325)))))

(declare-fun b!277669 () Bool)

(declare-fun res!141540 () Bool)

(assert (=> b!277669 (=> (not res!141540) (not e!177111))))

(declare-fun arrayContainsKey!0 (array!13830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277669 (= res!141540 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277670 () Bool)

(declare-fun res!141541 () Bool)

(assert (=> b!277670 (=> (not res!141541) (not e!177111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277670 (= res!141541 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26744 res!141539) b!277665))

(assert (= (and b!277665 res!141537) b!277670))

(assert (= (and b!277670 res!141541) b!277666))

(assert (= (and b!277666 res!141538) b!277669))

(assert (= (and b!277669 res!141540) b!277664))

(assert (= (and b!277664 res!141542) b!277663))

(assert (= (and b!277663 res!141544) b!277668))

(assert (= (and b!277668 res!141543) b!277667))

(assert (= (and b!277667 c!45613) b!277661))

(assert (= (and b!277667 (not c!45613)) b!277662))

(declare-fun m!292151 () Bool)

(assert (=> b!277666 m!292151))

(declare-fun m!292153 () Bool)

(assert (=> b!277670 m!292153))

(declare-fun m!292155 () Bool)

(assert (=> b!277668 m!292155))

(declare-fun m!292157 () Bool)

(assert (=> b!277661 m!292157))

(declare-fun m!292159 () Bool)

(assert (=> b!277661 m!292159))

(declare-fun m!292161 () Bool)

(assert (=> b!277664 m!292161))

(declare-fun m!292163 () Bool)

(assert (=> b!277667 m!292163))

(declare-fun m!292165 () Bool)

(assert (=> b!277667 m!292165))

(declare-fun m!292167 () Bool)

(assert (=> b!277669 m!292167))

(declare-fun m!292169 () Bool)

(assert (=> b!277663 m!292169))

(declare-fun m!292171 () Bool)

(assert (=> start!26744 m!292171))

(declare-fun m!292173 () Bool)

(assert (=> start!26744 m!292173))

(check-sat (not b!277664) (not start!26744) (not b!277669) (not b!277663) (not b!277661) (not b!277666) (not b!277670) (not b!277667))
(check-sat)
