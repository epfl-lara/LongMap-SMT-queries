; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26150 () Bool)

(assert start!26150)

(declare-fun b!269823 () Bool)

(declare-fun e!173976 () Bool)

(declare-fun e!173977 () Bool)

(assert (=> b!269823 (= e!173976 e!173977)))

(declare-fun res!133968 () Bool)

(assert (=> b!269823 (=> (not res!133968) (not e!173977))))

(declare-datatypes ((SeekEntryResult!1424 0))(
  ( (MissingZero!1424 (index!7866 (_ BitVec 32))) (Found!1424 (index!7867 (_ BitVec 32))) (Intermediate!1424 (undefined!2236 Bool) (index!7868 (_ BitVec 32)) (x!26228 (_ BitVec 32))) (Undefined!1424) (MissingVacant!1424 (index!7869 (_ BitVec 32))) )
))
(declare-fun lt!135216 () SeekEntryResult!1424)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269823 (= res!133968 (or (= lt!135216 (MissingZero!1424 i!1267)) (= lt!135216 (MissingVacant!1424 i!1267))))))

(declare-datatypes ((array!13236 0))(
  ( (array!13237 (arr!6267 (Array (_ BitVec 32) (_ BitVec 64))) (size!6620 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13236)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13236 (_ BitVec 32)) SeekEntryResult!1424)

(assert (=> b!269823 (= lt!135216 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269824 () Bool)

(declare-fun e!173978 () Bool)

(assert (=> b!269824 (= e!173978 (not true))))

(declare-fun lt!135217 () array!13236)

(assert (=> b!269824 (= (seekEntryOrOpen!0 k0!2581 lt!135217 mask!3868) (Found!1424 i!1267))))

(declare-datatypes ((Unit!8349 0))(
  ( (Unit!8350) )
))
(declare-fun lt!135219 () Unit!8349)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13236 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8349)

(assert (=> b!269824 (= lt!135219 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135218 () Unit!8349)

(declare-fun e!173979 () Unit!8349)

(assert (=> b!269824 (= lt!135218 e!173979)))

(declare-fun c!45478 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269824 (= c!45478 (bvslt startIndex!26 (bvsub (size!6620 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269825 () Bool)

(declare-fun res!133970 () Bool)

(assert (=> b!269825 (=> (not res!133970) (not e!173976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269825 (= res!133970 (validKeyInArray!0 k0!2581))))

(declare-fun b!269826 () Bool)

(declare-fun res!133975 () Bool)

(assert (=> b!269826 (=> (not res!133975) (not e!173976))))

(declare-datatypes ((List!4048 0))(
  ( (Nil!4045) (Cons!4044 (h!4711 (_ BitVec 64)) (t!9121 List!4048)) )
))
(declare-fun arrayNoDuplicates!0 (array!13236 (_ BitVec 32) List!4048) Bool)

(assert (=> b!269826 (= res!133975 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4045))))

(declare-fun b!269827 () Bool)

(declare-fun Unit!8351 () Unit!8349)

(assert (=> b!269827 (= e!173979 Unit!8351)))

(declare-fun b!269828 () Bool)

(declare-fun res!133972 () Bool)

(assert (=> b!269828 (=> (not res!133972) (not e!173977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13236 (_ BitVec 32)) Bool)

(assert (=> b!269828 (= res!133972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269829 () Bool)

(assert (=> b!269829 (= e!173977 e!173978)))

(declare-fun res!133971 () Bool)

(assert (=> b!269829 (=> (not res!133971) (not e!173978))))

(assert (=> b!269829 (= res!133971 (= startIndex!26 i!1267))))

(assert (=> b!269829 (= lt!135217 (array!13237 (store (arr!6267 a!3325) i!1267 k0!2581) (size!6620 a!3325)))))

(declare-fun b!269830 () Bool)

(declare-fun res!133974 () Bool)

(assert (=> b!269830 (=> (not res!133974) (not e!173976))))

(declare-fun arrayContainsKey!0 (array!13236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269830 (= res!133974 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269831 () Bool)

(declare-fun res!133969 () Bool)

(assert (=> b!269831 (=> (not res!133969) (not e!173976))))

(assert (=> b!269831 (= res!133969 (and (= (size!6620 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6620 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6620 a!3325))))))

(declare-fun res!133973 () Bool)

(assert (=> start!26150 (=> (not res!133973) (not e!173976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26150 (= res!133973 (validMask!0 mask!3868))))

(assert (=> start!26150 e!173976))

(declare-fun array_inv!4239 (array!13236) Bool)

(assert (=> start!26150 (array_inv!4239 a!3325)))

(assert (=> start!26150 true))

(declare-fun b!269822 () Bool)

(declare-fun lt!135215 () Unit!8349)

(assert (=> b!269822 (= e!173979 lt!135215)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13236 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8349)

(assert (=> b!269822 (= lt!135215 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269822 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135217 mask!3868)))

(assert (= (and start!26150 res!133973) b!269831))

(assert (= (and b!269831 res!133969) b!269825))

(assert (= (and b!269825 res!133970) b!269826))

(assert (= (and b!269826 res!133975) b!269830))

(assert (= (and b!269830 res!133974) b!269823))

(assert (= (and b!269823 res!133968) b!269828))

(assert (= (and b!269828 res!133972) b!269829))

(assert (= (and b!269829 res!133971) b!269824))

(assert (= (and b!269824 c!45478) b!269822))

(assert (= (and b!269824 (not c!45478)) b!269827))

(declare-fun m!285083 () Bool)

(assert (=> b!269829 m!285083))

(declare-fun m!285085 () Bool)

(assert (=> start!26150 m!285085))

(declare-fun m!285087 () Bool)

(assert (=> start!26150 m!285087))

(declare-fun m!285089 () Bool)

(assert (=> b!269823 m!285089))

(declare-fun m!285091 () Bool)

(assert (=> b!269830 m!285091))

(declare-fun m!285093 () Bool)

(assert (=> b!269825 m!285093))

(declare-fun m!285095 () Bool)

(assert (=> b!269828 m!285095))

(declare-fun m!285097 () Bool)

(assert (=> b!269826 m!285097))

(declare-fun m!285099 () Bool)

(assert (=> b!269824 m!285099))

(declare-fun m!285101 () Bool)

(assert (=> b!269824 m!285101))

(declare-fun m!285103 () Bool)

(assert (=> b!269822 m!285103))

(declare-fun m!285105 () Bool)

(assert (=> b!269822 m!285105))

(check-sat (not b!269824) (not b!269828) (not start!26150) (not b!269826) (not b!269822) (not b!269823) (not b!269830) (not b!269825))
(check-sat)
