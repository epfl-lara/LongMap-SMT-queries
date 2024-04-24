; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54018 () Bool)

(assert start!54018)

(declare-fun b!589584 () Bool)

(declare-fun res!377005 () Bool)

(declare-fun e!336621 () Bool)

(assert (=> b!589584 (=> (not res!377005) (not e!336621))))

(declare-datatypes ((array!36807 0))(
  ( (array!36808 (arr!17674 (Array (_ BitVec 32) (_ BitVec 64))) (size!18038 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36807)

(declare-datatypes ((List!11622 0))(
  ( (Nil!11619) (Cons!11618 (h!12666 (_ BitVec 64)) (t!17842 List!11622)) )
))
(declare-fun arrayNoDuplicates!0 (array!36807 (_ BitVec 32) List!11622) Bool)

(assert (=> b!589584 (= res!377005 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11619))))

(declare-fun b!589585 () Bool)

(declare-datatypes ((Unit!18373 0))(
  ( (Unit!18374) )
))
(declare-fun e!336620 () Unit!18373)

(declare-fun Unit!18375 () Unit!18373)

(assert (=> b!589585 (= e!336620 Unit!18375)))

(declare-fun b!589586 () Bool)

(declare-fun e!336616 () Bool)

(declare-datatypes ((SeekEntryResult!6070 0))(
  ( (MissingZero!6070 (index!26510 (_ BitVec 32))) (Found!6070 (index!26511 (_ BitVec 32))) (Intermediate!6070 (undefined!6882 Bool) (index!26512 (_ BitVec 32)) (x!55455 (_ BitVec 32))) (Undefined!6070) (MissingVacant!6070 (index!26513 (_ BitVec 32))) )
))
(declare-fun lt!267408 () SeekEntryResult!6070)

(declare-fun lt!267410 () SeekEntryResult!6070)

(assert (=> b!589586 (= e!336616 (= lt!267408 lt!267410))))

(declare-fun b!589587 () Bool)

(declare-fun e!336619 () Bool)

(assert (=> b!589587 (= e!336621 e!336619)))

(declare-fun res!377012 () Bool)

(assert (=> b!589587 (=> (not res!377012) (not e!336619))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!589587 (= res!377012 (= (select (store (arr!17674 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267409 () array!36807)

(assert (=> b!589587 (= lt!267409 (array!36808 (store (arr!17674 a!2986) i!1108 k0!1786) (size!18038 a!2986)))))

(declare-fun b!589588 () Bool)

(declare-fun res!377011 () Bool)

(declare-fun e!336615 () Bool)

(assert (=> b!589588 (=> (not res!377011) (not e!336615))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589588 (= res!377011 (validKeyInArray!0 (select (arr!17674 a!2986) j!136)))))

(declare-fun b!589589 () Bool)

(assert (=> b!589589 (= e!336615 e!336621)))

(declare-fun res!377007 () Bool)

(assert (=> b!589589 (=> (not res!377007) (not e!336621))))

(declare-fun lt!267405 () SeekEntryResult!6070)

(assert (=> b!589589 (= res!377007 (or (= lt!267405 (MissingZero!6070 i!1108)) (= lt!267405 (MissingVacant!6070 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36807 (_ BitVec 32)) SeekEntryResult!6070)

(assert (=> b!589589 (= lt!267405 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589590 () Bool)

(declare-fun res!377009 () Bool)

(assert (=> b!589590 (=> (not res!377009) (not e!336615))))

(assert (=> b!589590 (= res!377009 (and (= (size!18038 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18038 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18038 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589591 () Bool)

(declare-fun res!377003 () Bool)

(assert (=> b!589591 (=> (not res!377003) (not e!336621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36807 (_ BitVec 32)) Bool)

(assert (=> b!589591 (= res!377003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589592 () Bool)

(declare-fun res!377006 () Bool)

(assert (=> b!589592 (=> (not res!377006) (not e!336621))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589592 (= res!377006 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17674 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589593 () Bool)

(declare-fun res!377004 () Bool)

(assert (=> b!589593 (=> (not res!377004) (not e!336615))))

(declare-fun arrayContainsKey!0 (array!36807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589593 (= res!377004 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589594 () Bool)

(declare-fun res!377013 () Bool)

(assert (=> b!589594 (=> (not res!377013) (not e!336615))))

(assert (=> b!589594 (= res!377013 (validKeyInArray!0 k0!1786))))

(declare-fun b!589595 () Bool)

(declare-fun Unit!18376 () Unit!18373)

(assert (=> b!589595 (= e!336620 Unit!18376)))

(assert (=> b!589595 false))

(declare-fun b!589596 () Bool)

(declare-fun e!336618 () Bool)

(assert (=> b!589596 (= e!336619 e!336618)))

(declare-fun res!377014 () Bool)

(assert (=> b!589596 (=> (not res!377014) (not e!336618))))

(assert (=> b!589596 (= res!377014 (and (= lt!267408 (Found!6070 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17674 a!2986) index!984) (select (arr!17674 a!2986) j!136))) (not (= (select (arr!17674 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36807 (_ BitVec 32)) SeekEntryResult!6070)

(assert (=> b!589596 (= lt!267408 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17674 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!377010 () Bool)

(assert (=> start!54018 (=> (not res!377010) (not e!336615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54018 (= res!377010 (validMask!0 mask!3053))))

(assert (=> start!54018 e!336615))

(assert (=> start!54018 true))

(declare-fun array_inv!13533 (array!36807) Bool)

(assert (=> start!54018 (array_inv!13533 a!2986)))

(declare-fun b!589597 () Bool)

(assert (=> b!589597 (= e!336618 (not true))))

(declare-fun lt!267411 () Unit!18373)

(assert (=> b!589597 (= lt!267411 e!336620)))

(declare-fun lt!267406 () (_ BitVec 64))

(declare-fun c!66659 () Bool)

(assert (=> b!589597 (= c!66659 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267406 lt!267409 mask!3053) Undefined!6070))))

(assert (=> b!589597 e!336616))

(declare-fun res!377008 () Bool)

(assert (=> b!589597 (=> (not res!377008) (not e!336616))))

(declare-fun lt!267412 () (_ BitVec 32))

(assert (=> b!589597 (= res!377008 (= lt!267410 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267412 vacantSpotIndex!68 lt!267406 lt!267409 mask!3053)))))

(assert (=> b!589597 (= lt!267410 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267412 vacantSpotIndex!68 (select (arr!17674 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589597 (= lt!267406 (select (store (arr!17674 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267407 () Unit!18373)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36807 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18373)

(assert (=> b!589597 (= lt!267407 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267412 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589597 (= lt!267412 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!54018 res!377010) b!589590))

(assert (= (and b!589590 res!377009) b!589588))

(assert (= (and b!589588 res!377011) b!589594))

(assert (= (and b!589594 res!377013) b!589593))

(assert (= (and b!589593 res!377004) b!589589))

(assert (= (and b!589589 res!377007) b!589591))

(assert (= (and b!589591 res!377003) b!589584))

(assert (= (and b!589584 res!377005) b!589592))

(assert (= (and b!589592 res!377006) b!589587))

(assert (= (and b!589587 res!377012) b!589596))

(assert (= (and b!589596 res!377014) b!589597))

(assert (= (and b!589597 res!377008) b!589586))

(assert (= (and b!589597 c!66659) b!589595))

(assert (= (and b!589597 (not c!66659)) b!589585))

(declare-fun m!568271 () Bool)

(assert (=> b!589584 m!568271))

(declare-fun m!568273 () Bool)

(assert (=> b!589591 m!568273))

(declare-fun m!568275 () Bool)

(assert (=> b!589593 m!568275))

(declare-fun m!568277 () Bool)

(assert (=> b!589596 m!568277))

(declare-fun m!568279 () Bool)

(assert (=> b!589596 m!568279))

(assert (=> b!589596 m!568279))

(declare-fun m!568281 () Bool)

(assert (=> b!589596 m!568281))

(declare-fun m!568283 () Bool)

(assert (=> b!589597 m!568283))

(declare-fun m!568285 () Bool)

(assert (=> b!589597 m!568285))

(assert (=> b!589597 m!568279))

(declare-fun m!568287 () Bool)

(assert (=> b!589597 m!568287))

(assert (=> b!589597 m!568279))

(declare-fun m!568289 () Bool)

(assert (=> b!589597 m!568289))

(declare-fun m!568291 () Bool)

(assert (=> b!589597 m!568291))

(declare-fun m!568293 () Bool)

(assert (=> b!589597 m!568293))

(declare-fun m!568295 () Bool)

(assert (=> b!589597 m!568295))

(declare-fun m!568297 () Bool)

(assert (=> b!589592 m!568297))

(assert (=> b!589587 m!568295))

(declare-fun m!568299 () Bool)

(assert (=> b!589587 m!568299))

(declare-fun m!568301 () Bool)

(assert (=> b!589589 m!568301))

(assert (=> b!589588 m!568279))

(assert (=> b!589588 m!568279))

(declare-fun m!568303 () Bool)

(assert (=> b!589588 m!568303))

(declare-fun m!568305 () Bool)

(assert (=> b!589594 m!568305))

(declare-fun m!568307 () Bool)

(assert (=> start!54018 m!568307))

(declare-fun m!568309 () Bool)

(assert (=> start!54018 m!568309))

(check-sat (not b!589584) (not start!54018) (not b!589588) (not b!589596) (not b!589597) (not b!589593) (not b!589589) (not b!589594) (not b!589591))
(check-sat)
