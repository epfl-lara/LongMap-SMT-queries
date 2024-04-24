; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54936 () Bool)

(assert start!54936)

(declare-fun b!600724 () Bool)

(declare-fun e!343477 () Bool)

(assert (=> b!600724 (= e!343477 true)))

(declare-fun lt!273285 () Bool)

(declare-datatypes ((List!11763 0))(
  ( (Nil!11760) (Cons!11759 (h!12807 (_ BitVec 64)) (t!17983 List!11763)) )
))
(declare-fun contains!2953 (List!11763 (_ BitVec 64)) Bool)

(assert (=> b!600724 (= lt!273285 (contains!2953 Nil!11760 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600725 () Bool)

(declare-fun e!343476 () Bool)

(declare-fun e!343475 () Bool)

(assert (=> b!600725 (= e!343476 (not e!343475))))

(declare-fun res!385510 () Bool)

(assert (=> b!600725 (=> res!385510 e!343475)))

(declare-datatypes ((SeekEntryResult!6211 0))(
  ( (MissingZero!6211 (index!27101 (_ BitVec 32))) (Found!6211 (index!27102 (_ BitVec 32))) (Intermediate!6211 (undefined!7023 Bool) (index!27103 (_ BitVec 32)) (x!56053 (_ BitVec 32))) (Undefined!6211) (MissingVacant!6211 (index!27104 (_ BitVec 32))) )
))
(declare-fun lt!273288 () SeekEntryResult!6211)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600725 (= res!385510 (not (= lt!273288 (Found!6211 index!984))))))

(declare-datatypes ((Unit!18937 0))(
  ( (Unit!18938) )
))
(declare-fun lt!273293 () Unit!18937)

(declare-fun e!343467 () Unit!18937)

(assert (=> b!600725 (= lt!273293 e!343467)))

(declare-fun c!67982 () Bool)

(assert (=> b!600725 (= c!67982 (= lt!273288 Undefined!6211))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37116 0))(
  ( (array!37117 (arr!17815 (Array (_ BitVec 32) (_ BitVec 64))) (size!18179 (_ BitVec 32))) )
))
(declare-fun lt!273290 () array!37116)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!273286 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37116 (_ BitVec 32)) SeekEntryResult!6211)

(assert (=> b!600725 (= lt!273288 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273286 lt!273290 mask!3053))))

(declare-fun e!343478 () Bool)

(assert (=> b!600725 e!343478))

(declare-fun res!385513 () Bool)

(assert (=> b!600725 (=> (not res!385513) (not e!343478))))

(declare-fun lt!273282 () SeekEntryResult!6211)

(declare-fun lt!273284 () (_ BitVec 32))

(assert (=> b!600725 (= res!385513 (= lt!273282 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273284 vacantSpotIndex!68 lt!273286 lt!273290 mask!3053)))))

(declare-fun a!2986 () array!37116)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!600725 (= lt!273282 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273284 vacantSpotIndex!68 (select (arr!17815 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!600725 (= lt!273286 (select (store (arr!17815 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273283 () Unit!18937)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37116 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18937)

(assert (=> b!600725 (= lt!273283 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273284 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600725 (= lt!273284 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!600726 () Bool)

(declare-fun e!343468 () Bool)

(assert (=> b!600726 (= e!343475 e!343468)))

(declare-fun res!385508 () Bool)

(assert (=> b!600726 (=> res!385508 e!343468)))

(declare-fun lt!273295 () (_ BitVec 64))

(assert (=> b!600726 (= res!385508 (or (not (= (select (arr!17815 a!2986) j!136) lt!273286)) (not (= (select (arr!17815 a!2986) j!136) lt!273295)) (bvsge j!136 index!984)))))

(declare-fun e!343472 () Bool)

(assert (=> b!600726 e!343472))

(declare-fun res!385507 () Bool)

(assert (=> b!600726 (=> (not res!385507) (not e!343472))))

(assert (=> b!600726 (= res!385507 (= lt!273295 (select (arr!17815 a!2986) j!136)))))

(assert (=> b!600726 (= lt!273295 (select (store (arr!17815 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600727 () Bool)

(declare-fun Unit!18939 () Unit!18937)

(assert (=> b!600727 (= e!343467 Unit!18939)))

(assert (=> b!600727 false))

(declare-fun b!600728 () Bool)

(declare-fun e!343470 () Bool)

(declare-fun e!343473 () Bool)

(assert (=> b!600728 (= e!343470 e!343473)))

(declare-fun res!385516 () Bool)

(assert (=> b!600728 (=> (not res!385516) (not e!343473))))

(assert (=> b!600728 (= res!385516 (= (select (store (arr!17815 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600728 (= lt!273290 (array!37117 (store (arr!17815 a!2986) i!1108 k0!1786) (size!18179 a!2986)))))

(declare-fun b!600729 () Bool)

(assert (=> b!600729 (= e!343473 e!343476)))

(declare-fun res!385501 () Bool)

(assert (=> b!600729 (=> (not res!385501) (not e!343476))))

(declare-fun lt!273292 () SeekEntryResult!6211)

(assert (=> b!600729 (= res!385501 (and (= lt!273292 (Found!6211 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17815 a!2986) index!984) (select (arr!17815 a!2986) j!136))) (not (= (select (arr!17815 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600729 (= lt!273292 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17815 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600731 () Bool)

(declare-fun e!343469 () Bool)

(assert (=> b!600731 (= e!343469 e!343470)))

(declare-fun res!385506 () Bool)

(assert (=> b!600731 (=> (not res!385506) (not e!343470))))

(declare-fun lt!273291 () SeekEntryResult!6211)

(assert (=> b!600731 (= res!385506 (or (= lt!273291 (MissingZero!6211 i!1108)) (= lt!273291 (MissingVacant!6211 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37116 (_ BitVec 32)) SeekEntryResult!6211)

(assert (=> b!600731 (= lt!273291 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600732 () Bool)

(declare-fun res!385502 () Bool)

(assert (=> b!600732 (=> (not res!385502) (not e!343469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600732 (= res!385502 (validKeyInArray!0 k0!1786))))

(declare-fun b!600733 () Bool)

(declare-fun res!385514 () Bool)

(assert (=> b!600733 (=> (not res!385514) (not e!343470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37116 (_ BitVec 32)) Bool)

(assert (=> b!600733 (= res!385514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600734 () Bool)

(assert (=> b!600734 (= e!343478 (= lt!273292 lt!273282))))

(declare-fun b!600735 () Bool)

(declare-fun res!385505 () Bool)

(assert (=> b!600735 (=> (not res!385505) (not e!343469))))

(declare-fun arrayContainsKey!0 (array!37116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600735 (= res!385505 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600736 () Bool)

(declare-fun e!343471 () Bool)

(declare-fun e!343474 () Bool)

(assert (=> b!600736 (= e!343471 e!343474)))

(declare-fun res!385503 () Bool)

(assert (=> b!600736 (=> (not res!385503) (not e!343474))))

(assert (=> b!600736 (= res!385503 (arrayContainsKey!0 lt!273290 (select (arr!17815 a!2986) j!136) j!136))))

(declare-fun b!600737 () Bool)

(declare-fun res!385497 () Bool)

(assert (=> b!600737 (=> res!385497 e!343477)))

(declare-fun noDuplicate!298 (List!11763) Bool)

(assert (=> b!600737 (= res!385497 (not (noDuplicate!298 Nil!11760)))))

(declare-fun b!600738 () Bool)

(declare-fun res!385512 () Bool)

(assert (=> b!600738 (=> (not res!385512) (not e!343469))))

(assert (=> b!600738 (= res!385512 (and (= (size!18179 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18179 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18179 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600739 () Bool)

(declare-fun res!385515 () Bool)

(assert (=> b!600739 (=> (not res!385515) (not e!343470))))

(assert (=> b!600739 (= res!385515 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17815 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600740 () Bool)

(assert (=> b!600740 (= e!343472 e!343471)))

(declare-fun res!385498 () Bool)

(assert (=> b!600740 (=> res!385498 e!343471)))

(assert (=> b!600740 (= res!385498 (or (not (= (select (arr!17815 a!2986) j!136) lt!273286)) (not (= (select (arr!17815 a!2986) j!136) lt!273295)) (bvsge j!136 index!984)))))

(declare-fun b!600741 () Bool)

(declare-fun res!385504 () Bool)

(assert (=> b!600741 (=> (not res!385504) (not e!343469))))

(assert (=> b!600741 (= res!385504 (validKeyInArray!0 (select (arr!17815 a!2986) j!136)))))

(declare-fun b!600742 () Bool)

(declare-fun res!385500 () Bool)

(assert (=> b!600742 (=> res!385500 e!343477)))

(assert (=> b!600742 (= res!385500 (contains!2953 Nil!11760 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600743 () Bool)

(declare-fun Unit!18940 () Unit!18937)

(assert (=> b!600743 (= e!343467 Unit!18940)))

(declare-fun res!385509 () Bool)

(assert (=> start!54936 (=> (not res!385509) (not e!343469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54936 (= res!385509 (validMask!0 mask!3053))))

(assert (=> start!54936 e!343469))

(assert (=> start!54936 true))

(declare-fun array_inv!13674 (array!37116) Bool)

(assert (=> start!54936 (array_inv!13674 a!2986)))

(declare-fun b!600730 () Bool)

(declare-fun res!385499 () Bool)

(assert (=> b!600730 (=> (not res!385499) (not e!343470))))

(declare-fun arrayNoDuplicates!0 (array!37116 (_ BitVec 32) List!11763) Bool)

(assert (=> b!600730 (= res!385499 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11760))))

(declare-fun b!600744 () Bool)

(assert (=> b!600744 (= e!343474 (arrayContainsKey!0 lt!273290 (select (arr!17815 a!2986) j!136) index!984))))

(declare-fun b!600745 () Bool)

(assert (=> b!600745 (= e!343468 e!343477)))

(declare-fun res!385511 () Bool)

(assert (=> b!600745 (=> res!385511 e!343477)))

(assert (=> b!600745 (= res!385511 (or (bvsge (size!18179 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18179 a!2986))))))

(assert (=> b!600745 (arrayNoDuplicates!0 lt!273290 j!136 Nil!11760)))

(declare-fun lt!273289 () Unit!18937)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37116 (_ BitVec 32) (_ BitVec 32)) Unit!18937)

(assert (=> b!600745 (= lt!273289 (lemmaNoDuplicateFromThenFromBigger!0 lt!273290 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600745 (arrayNoDuplicates!0 lt!273290 #b00000000000000000000000000000000 Nil!11760)))

(declare-fun lt!273294 () Unit!18937)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37116 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11763) Unit!18937)

(assert (=> b!600745 (= lt!273294 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11760))))

(assert (=> b!600745 (arrayContainsKey!0 lt!273290 (select (arr!17815 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273287 () Unit!18937)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37116 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18937)

(assert (=> b!600745 (= lt!273287 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273290 (select (arr!17815 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54936 res!385509) b!600738))

(assert (= (and b!600738 res!385512) b!600741))

(assert (= (and b!600741 res!385504) b!600732))

(assert (= (and b!600732 res!385502) b!600735))

(assert (= (and b!600735 res!385505) b!600731))

(assert (= (and b!600731 res!385506) b!600733))

(assert (= (and b!600733 res!385514) b!600730))

(assert (= (and b!600730 res!385499) b!600739))

(assert (= (and b!600739 res!385515) b!600728))

(assert (= (and b!600728 res!385516) b!600729))

(assert (= (and b!600729 res!385501) b!600725))

(assert (= (and b!600725 res!385513) b!600734))

(assert (= (and b!600725 c!67982) b!600727))

(assert (= (and b!600725 (not c!67982)) b!600743))

(assert (= (and b!600725 (not res!385510)) b!600726))

(assert (= (and b!600726 res!385507) b!600740))

(assert (= (and b!600740 (not res!385498)) b!600736))

(assert (= (and b!600736 res!385503) b!600744))

(assert (= (and b!600726 (not res!385508)) b!600745))

(assert (= (and b!600745 (not res!385511)) b!600737))

(assert (= (and b!600737 (not res!385497)) b!600742))

(assert (= (and b!600742 (not res!385500)) b!600724))

(declare-fun m!578165 () Bool)

(assert (=> b!600732 m!578165))

(declare-fun m!578167 () Bool)

(assert (=> start!54936 m!578167))

(declare-fun m!578169 () Bool)

(assert (=> start!54936 m!578169))

(declare-fun m!578171 () Bool)

(assert (=> b!600745 m!578171))

(declare-fun m!578173 () Bool)

(assert (=> b!600745 m!578173))

(declare-fun m!578175 () Bool)

(assert (=> b!600745 m!578175))

(assert (=> b!600745 m!578171))

(declare-fun m!578177 () Bool)

(assert (=> b!600745 m!578177))

(declare-fun m!578179 () Bool)

(assert (=> b!600745 m!578179))

(declare-fun m!578181 () Bool)

(assert (=> b!600745 m!578181))

(assert (=> b!600745 m!578171))

(declare-fun m!578183 () Bool)

(assert (=> b!600745 m!578183))

(declare-fun m!578185 () Bool)

(assert (=> b!600728 m!578185))

(declare-fun m!578187 () Bool)

(assert (=> b!600728 m!578187))

(declare-fun m!578189 () Bool)

(assert (=> b!600735 m!578189))

(declare-fun m!578191 () Bool)

(assert (=> b!600739 m!578191))

(declare-fun m!578193 () Bool)

(assert (=> b!600724 m!578193))

(assert (=> b!600744 m!578171))

(assert (=> b!600744 m!578171))

(declare-fun m!578195 () Bool)

(assert (=> b!600744 m!578195))

(declare-fun m!578197 () Bool)

(assert (=> b!600733 m!578197))

(assert (=> b!600736 m!578171))

(assert (=> b!600736 m!578171))

(declare-fun m!578199 () Bool)

(assert (=> b!600736 m!578199))

(declare-fun m!578201 () Bool)

(assert (=> b!600737 m!578201))

(declare-fun m!578203 () Bool)

(assert (=> b!600730 m!578203))

(declare-fun m!578205 () Bool)

(assert (=> b!600742 m!578205))

(assert (=> b!600726 m!578171))

(assert (=> b!600726 m!578185))

(declare-fun m!578207 () Bool)

(assert (=> b!600726 m!578207))

(declare-fun m!578209 () Bool)

(assert (=> b!600729 m!578209))

(assert (=> b!600729 m!578171))

(assert (=> b!600729 m!578171))

(declare-fun m!578211 () Bool)

(assert (=> b!600729 m!578211))

(declare-fun m!578213 () Bool)

(assert (=> b!600725 m!578213))

(declare-fun m!578215 () Bool)

(assert (=> b!600725 m!578215))

(declare-fun m!578217 () Bool)

(assert (=> b!600725 m!578217))

(assert (=> b!600725 m!578171))

(assert (=> b!600725 m!578185))

(declare-fun m!578219 () Bool)

(assert (=> b!600725 m!578219))

(declare-fun m!578221 () Bool)

(assert (=> b!600725 m!578221))

(assert (=> b!600725 m!578171))

(declare-fun m!578223 () Bool)

(assert (=> b!600725 m!578223))

(declare-fun m!578225 () Bool)

(assert (=> b!600731 m!578225))

(assert (=> b!600740 m!578171))

(assert (=> b!600741 m!578171))

(assert (=> b!600741 m!578171))

(declare-fun m!578227 () Bool)

(assert (=> b!600741 m!578227))

(check-sat (not b!600725) (not b!600742) (not b!600737) (not b!600733) (not b!600744) (not b!600732) (not b!600745) (not start!54936) (not b!600735) (not b!600724) (not b!600741) (not b!600730) (not b!600736) (not b!600731) (not b!600729))
(check-sat)
