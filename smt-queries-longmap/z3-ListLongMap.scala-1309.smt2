; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26414 () Bool)

(assert start!26414)

(declare-fun b!274008 () Bool)

(declare-fun res!138001 () Bool)

(declare-fun e!175509 () Bool)

(assert (=> b!274008 (=> (not res!138001) (not e!175509))))

(declare-datatypes ((array!13511 0))(
  ( (array!13512 (arr!6405 (Array (_ BitVec 32) (_ BitVec 64))) (size!6757 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13511)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!274008 (= res!138001 (and (= (size!6757 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6757 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6757 a!3325))))))

(declare-fun b!274009 () Bool)

(declare-fun res!137998 () Bool)

(declare-fun e!175508 () Bool)

(assert (=> b!274009 (=> (not res!137998) (not e!175508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274009 (= res!137998 (validKeyInArray!0 (select (arr!6405 a!3325) startIndex!26)))))

(declare-fun b!274010 () Bool)

(declare-fun res!138004 () Bool)

(assert (=> b!274010 (=> (not res!138004) (not e!175509))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!274010 (= res!138004 (validKeyInArray!0 k0!2581))))

(declare-fun res!138006 () Bool)

(assert (=> start!26414 (=> (not res!138006) (not e!175509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26414 (= res!138006 (validMask!0 mask!3868))))

(assert (=> start!26414 e!175509))

(declare-fun array_inv!4368 (array!13511) Bool)

(assert (=> start!26414 (array_inv!4368 a!3325)))

(assert (=> start!26414 true))

(declare-fun b!274011 () Bool)

(declare-fun res!138003 () Bool)

(declare-fun e!175510 () Bool)

(assert (=> b!274011 (=> (not res!138003) (not e!175510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13511 (_ BitVec 32)) Bool)

(assert (=> b!274011 (= res!138003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274012 () Bool)

(declare-fun res!138002 () Bool)

(assert (=> b!274012 (=> (not res!138002) (not e!175509))))

(declare-fun arrayContainsKey!0 (array!13511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274012 (= res!138002 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274013 () Bool)

(assert (=> b!274013 (= e!175509 e!175510)))

(declare-fun res!138005 () Bool)

(assert (=> b!274013 (=> (not res!138005) (not e!175510))))

(declare-datatypes ((SeekEntryResult!1563 0))(
  ( (MissingZero!1563 (index!8422 (_ BitVec 32))) (Found!1563 (index!8423 (_ BitVec 32))) (Intermediate!1563 (undefined!2375 Bool) (index!8424 (_ BitVec 32)) (x!26720 (_ BitVec 32))) (Undefined!1563) (MissingVacant!1563 (index!8425 (_ BitVec 32))) )
))
(declare-fun lt!136698 () SeekEntryResult!1563)

(assert (=> b!274013 (= res!138005 (or (= lt!136698 (MissingZero!1563 i!1267)) (= lt!136698 (MissingVacant!1563 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13511 (_ BitVec 32)) SeekEntryResult!1563)

(assert (=> b!274013 (= lt!136698 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274014 () Bool)

(assert (=> b!274014 (= e!175508 (not true))))

(assert (=> b!274014 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8613 0))(
  ( (Unit!8614) )
))
(declare-fun lt!136700 () Unit!8613)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8613)

(assert (=> b!274014 (= lt!136700 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136699 () array!13511)

(assert (=> b!274014 (= (seekEntryOrOpen!0 (select (arr!6405 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6405 a!3325) i!1267 k0!2581) startIndex!26) lt!136699 mask!3868))))

(declare-fun lt!136702 () Unit!8613)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13511 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8613)

(assert (=> b!274014 (= lt!136702 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4213 0))(
  ( (Nil!4210) (Cons!4209 (h!4876 (_ BitVec 64)) (t!9295 List!4213)) )
))
(declare-fun arrayNoDuplicates!0 (array!13511 (_ BitVec 32) List!4213) Bool)

(assert (=> b!274014 (arrayNoDuplicates!0 lt!136699 #b00000000000000000000000000000000 Nil!4210)))

(declare-fun lt!136701 () Unit!8613)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13511 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4213) Unit!8613)

(assert (=> b!274014 (= lt!136701 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4210))))

(declare-fun b!274015 () Bool)

(assert (=> b!274015 (= e!175510 e!175508)))

(declare-fun res!138000 () Bool)

(assert (=> b!274015 (=> (not res!138000) (not e!175508))))

(assert (=> b!274015 (= res!138000 (not (= startIndex!26 i!1267)))))

(assert (=> b!274015 (= lt!136699 (array!13512 (store (arr!6405 a!3325) i!1267 k0!2581) (size!6757 a!3325)))))

(declare-fun b!274016 () Bool)

(declare-fun res!137999 () Bool)

(assert (=> b!274016 (=> (not res!137999) (not e!175509))))

(assert (=> b!274016 (= res!137999 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4210))))

(assert (= (and start!26414 res!138006) b!274008))

(assert (= (and b!274008 res!138001) b!274010))

(assert (= (and b!274010 res!138004) b!274016))

(assert (= (and b!274016 res!137999) b!274012))

(assert (= (and b!274012 res!138002) b!274013))

(assert (= (and b!274013 res!138005) b!274011))

(assert (= (and b!274011 res!138003) b!274015))

(assert (= (and b!274015 res!138000) b!274009))

(assert (= (and b!274009 res!137998) b!274014))

(declare-fun m!289389 () Bool)

(assert (=> b!274016 m!289389))

(declare-fun m!289391 () Bool)

(assert (=> b!274014 m!289391))

(declare-fun m!289393 () Bool)

(assert (=> b!274014 m!289393))

(declare-fun m!289395 () Bool)

(assert (=> b!274014 m!289395))

(assert (=> b!274014 m!289393))

(declare-fun m!289397 () Bool)

(assert (=> b!274014 m!289397))

(declare-fun m!289399 () Bool)

(assert (=> b!274014 m!289399))

(declare-fun m!289401 () Bool)

(assert (=> b!274014 m!289401))

(declare-fun m!289403 () Bool)

(assert (=> b!274014 m!289403))

(declare-fun m!289405 () Bool)

(assert (=> b!274014 m!289405))

(declare-fun m!289407 () Bool)

(assert (=> b!274014 m!289407))

(assert (=> b!274014 m!289403))

(declare-fun m!289409 () Bool)

(assert (=> b!274014 m!289409))

(declare-fun m!289411 () Bool)

(assert (=> b!274010 m!289411))

(declare-fun m!289413 () Bool)

(assert (=> b!274012 m!289413))

(assert (=> b!274015 m!289399))

(declare-fun m!289415 () Bool)

(assert (=> b!274011 m!289415))

(declare-fun m!289417 () Bool)

(assert (=> start!26414 m!289417))

(declare-fun m!289419 () Bool)

(assert (=> start!26414 m!289419))

(assert (=> b!274009 m!289403))

(assert (=> b!274009 m!289403))

(declare-fun m!289421 () Bool)

(assert (=> b!274009 m!289421))

(declare-fun m!289423 () Bool)

(assert (=> b!274013 m!289423))

(check-sat (not b!274012) (not b!274016) (not start!26414) (not b!274011) (not b!274013) (not b!274014) (not b!274009) (not b!274010))
(check-sat)
