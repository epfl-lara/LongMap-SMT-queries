; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26144 () Bool)

(assert start!26144)

(declare-fun b!269909 () Bool)

(declare-fun res!134019 () Bool)

(declare-fun e!174050 () Bool)

(assert (=> b!269909 (=> (not res!134019) (not e!174050))))

(declare-datatypes ((array!13241 0))(
  ( (array!13242 (arr!6270 (Array (_ BitVec 32) (_ BitVec 64))) (size!6622 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13241)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269909 (= res!134019 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269910 () Bool)

(declare-fun res!134017 () Bool)

(declare-fun e!174049 () Bool)

(assert (=> b!269910 (=> (not res!134017) (not e!174049))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13241 (_ BitVec 32)) Bool)

(assert (=> b!269910 (= res!134017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269912 () Bool)

(declare-fun res!134015 () Bool)

(assert (=> b!269912 (=> (not res!134015) (not e!174050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269912 (= res!134015 (validKeyInArray!0 k0!2581))))

(declare-fun b!269913 () Bool)

(declare-fun res!134018 () Bool)

(assert (=> b!269913 (=> (not res!134018) (not e!174050))))

(declare-datatypes ((List!4078 0))(
  ( (Nil!4075) (Cons!4074 (h!4741 (_ BitVec 64)) (t!9160 List!4078)) )
))
(declare-fun arrayNoDuplicates!0 (array!13241 (_ BitVec 32) List!4078) Bool)

(assert (=> b!269913 (= res!134018 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4075))))

(declare-fun b!269914 () Bool)

(declare-datatypes ((Unit!8389 0))(
  ( (Unit!8390) )
))
(declare-fun e!174048 () Unit!8389)

(declare-fun lt!135367 () Unit!8389)

(assert (=> b!269914 (= e!174048 lt!135367)))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8389)

(assert (=> b!269914 (= lt!135367 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135370 () array!13241)

(assert (=> b!269914 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135370 mask!3868)))

(declare-fun res!134020 () Bool)

(assert (=> start!26144 (=> (not res!134020) (not e!174050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26144 (= res!134020 (validMask!0 mask!3868))))

(assert (=> start!26144 e!174050))

(declare-fun array_inv!4233 (array!13241) Bool)

(assert (=> start!26144 (array_inv!4233 a!3325)))

(assert (=> start!26144 true))

(declare-fun b!269911 () Bool)

(declare-fun e!174047 () Bool)

(assert (=> b!269911 (= e!174047 (not (bvsge mask!3868 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!1428 0))(
  ( (MissingZero!1428 (index!7882 (_ BitVec 32))) (Found!1428 (index!7883 (_ BitVec 32))) (Intermediate!1428 (undefined!2240 Bool) (index!7884 (_ BitVec 32)) (x!26225 (_ BitVec 32))) (Undefined!1428) (MissingVacant!1428 (index!7885 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13241 (_ BitVec 32)) SeekEntryResult!1428)

(assert (=> b!269911 (= (seekEntryOrOpen!0 k0!2581 lt!135370 mask!3868) (Found!1428 i!1267))))

(declare-fun lt!135366 () Unit!8389)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8389)

(assert (=> b!269911 (= lt!135366 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135368 () Unit!8389)

(assert (=> b!269911 (= lt!135368 e!174048)))

(declare-fun c!45498 () Bool)

(assert (=> b!269911 (= c!45498 (bvslt startIndex!26 (bvsub (size!6622 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269915 () Bool)

(declare-fun res!134016 () Bool)

(assert (=> b!269915 (=> (not res!134016) (not e!174050))))

(assert (=> b!269915 (= res!134016 (and (= (size!6622 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6622 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6622 a!3325))))))

(declare-fun b!269916 () Bool)

(assert (=> b!269916 (= e!174050 e!174049)))

(declare-fun res!134022 () Bool)

(assert (=> b!269916 (=> (not res!134022) (not e!174049))))

(declare-fun lt!135369 () SeekEntryResult!1428)

(assert (=> b!269916 (= res!134022 (or (= lt!135369 (MissingZero!1428 i!1267)) (= lt!135369 (MissingVacant!1428 i!1267))))))

(assert (=> b!269916 (= lt!135369 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269917 () Bool)

(assert (=> b!269917 (= e!174049 e!174047)))

(declare-fun res!134021 () Bool)

(assert (=> b!269917 (=> (not res!134021) (not e!174047))))

(assert (=> b!269917 (= res!134021 (= startIndex!26 i!1267))))

(assert (=> b!269917 (= lt!135370 (array!13242 (store (arr!6270 a!3325) i!1267 k0!2581) (size!6622 a!3325)))))

(declare-fun b!269918 () Bool)

(declare-fun Unit!8391 () Unit!8389)

(assert (=> b!269918 (= e!174048 Unit!8391)))

(assert (= (and start!26144 res!134020) b!269915))

(assert (= (and b!269915 res!134016) b!269912))

(assert (= (and b!269912 res!134015) b!269913))

(assert (= (and b!269913 res!134018) b!269909))

(assert (= (and b!269909 res!134019) b!269916))

(assert (= (and b!269916 res!134022) b!269910))

(assert (= (and b!269910 res!134017) b!269917))

(assert (= (and b!269917 res!134021) b!269911))

(assert (= (and b!269911 c!45498) b!269914))

(assert (= (and b!269911 (not c!45498)) b!269918))

(declare-fun m!285627 () Bool)

(assert (=> b!269913 m!285627))

(declare-fun m!285629 () Bool)

(assert (=> b!269909 m!285629))

(declare-fun m!285631 () Bool)

(assert (=> b!269917 m!285631))

(declare-fun m!285633 () Bool)

(assert (=> start!26144 m!285633))

(declare-fun m!285635 () Bool)

(assert (=> start!26144 m!285635))

(declare-fun m!285637 () Bool)

(assert (=> b!269911 m!285637))

(declare-fun m!285639 () Bool)

(assert (=> b!269911 m!285639))

(declare-fun m!285641 () Bool)

(assert (=> b!269910 m!285641))

(declare-fun m!285643 () Bool)

(assert (=> b!269912 m!285643))

(declare-fun m!285645 () Bool)

(assert (=> b!269914 m!285645))

(declare-fun m!285647 () Bool)

(assert (=> b!269914 m!285647))

(declare-fun m!285649 () Bool)

(assert (=> b!269916 m!285649))

(check-sat (not b!269909) (not b!269914) (not b!269916) (not b!269913) (not b!269910) (not b!269912) (not start!26144) (not b!269911))
(check-sat)
