; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56986 () Bool)

(assert start!56986)

(declare-fun b!630655 () Bool)

(declare-fun res!407663 () Bool)

(declare-fun e!360619 () Bool)

(assert (=> b!630655 (=> (not res!407663) (not e!360619))))

(declare-datatypes ((array!38062 0))(
  ( (array!38063 (arr!18265 (Array (_ BitVec 32) (_ BitVec 64))) (size!18629 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38062)

(declare-datatypes ((List!12306 0))(
  ( (Nil!12303) (Cons!12302 (h!13347 (_ BitVec 64)) (t!18534 List!12306)) )
))
(declare-fun arrayNoDuplicates!0 (array!38062 (_ BitVec 32) List!12306) Bool)

(assert (=> b!630655 (= res!407663 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12303))))

(declare-fun b!630656 () Bool)

(declare-fun res!407669 () Bool)

(assert (=> b!630656 (=> (not res!407669) (not e!360619))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38062 (_ BitVec 32)) Bool)

(assert (=> b!630656 (= res!407669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630657 () Bool)

(declare-fun res!407667 () Bool)

(assert (=> b!630657 (=> (not res!407667) (not e!360619))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630657 (= res!407667 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18265 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630658 () Bool)

(declare-fun e!360618 () Bool)

(assert (=> b!630658 (= e!360618 (not true))))

(declare-datatypes ((Unit!21154 0))(
  ( (Unit!21155) )
))
(declare-fun lt!291286 () Unit!21154)

(declare-fun e!360624 () Unit!21154)

(assert (=> b!630658 (= lt!291286 e!360624)))

(declare-fun lt!291282 () (_ BitVec 64))

(declare-fun c!71864 () Bool)

(declare-fun lt!291281 () array!38062)

(declare-datatypes ((SeekEntryResult!6705 0))(
  ( (MissingZero!6705 (index!29110 (_ BitVec 32))) (Found!6705 (index!29111 (_ BitVec 32))) (Intermediate!6705 (undefined!7517 Bool) (index!29112 (_ BitVec 32)) (x!57851 (_ BitVec 32))) (Undefined!6705) (MissingVacant!6705 (index!29113 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38062 (_ BitVec 32)) SeekEntryResult!6705)

(assert (=> b!630658 (= c!71864 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291282 lt!291281 mask!3053) Undefined!6705))))

(declare-fun e!360622 () Bool)

(assert (=> b!630658 e!360622))

(declare-fun res!407668 () Bool)

(assert (=> b!630658 (=> (not res!407668) (not e!360622))))

(declare-fun lt!291283 () SeekEntryResult!6705)

(declare-fun lt!291280 () (_ BitVec 32))

(assert (=> b!630658 (= res!407668 (= lt!291283 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291280 vacantSpotIndex!68 lt!291282 lt!291281 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!630658 (= lt!291283 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291280 vacantSpotIndex!68 (select (arr!18265 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!630658 (= lt!291282 (select (store (arr!18265 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291284 () Unit!21154)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38062 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21154)

(assert (=> b!630658 (= lt!291284 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291280 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630658 (= lt!291280 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630659 () Bool)

(declare-fun Unit!21156 () Unit!21154)

(assert (=> b!630659 (= e!360624 Unit!21156)))

(declare-fun b!630660 () Bool)

(declare-fun res!407665 () Bool)

(declare-fun e!360621 () Bool)

(assert (=> b!630660 (=> (not res!407665) (not e!360621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630660 (= res!407665 (validKeyInArray!0 k0!1786))))

(declare-fun b!630661 () Bool)

(declare-fun e!360620 () Bool)

(assert (=> b!630661 (= e!360619 e!360620)))

(declare-fun res!407664 () Bool)

(assert (=> b!630661 (=> (not res!407664) (not e!360620))))

(assert (=> b!630661 (= res!407664 (= (select (store (arr!18265 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630661 (= lt!291281 (array!38063 (store (arr!18265 a!2986) i!1108 k0!1786) (size!18629 a!2986)))))

(declare-fun b!630662 () Bool)

(declare-fun res!407661 () Bool)

(assert (=> b!630662 (=> (not res!407661) (not e!360621))))

(assert (=> b!630662 (= res!407661 (validKeyInArray!0 (select (arr!18265 a!2986) j!136)))))

(declare-fun b!630663 () Bool)

(declare-fun res!407666 () Bool)

(assert (=> b!630663 (=> (not res!407666) (not e!360621))))

(assert (=> b!630663 (= res!407666 (and (= (size!18629 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18629 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18629 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630664 () Bool)

(declare-fun lt!291285 () SeekEntryResult!6705)

(assert (=> b!630664 (= e!360622 (= lt!291285 lt!291283))))

(declare-fun res!407670 () Bool)

(assert (=> start!56986 (=> (not res!407670) (not e!360621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56986 (= res!407670 (validMask!0 mask!3053))))

(assert (=> start!56986 e!360621))

(assert (=> start!56986 true))

(declare-fun array_inv!14061 (array!38062) Bool)

(assert (=> start!56986 (array_inv!14061 a!2986)))

(declare-fun b!630665 () Bool)

(declare-fun res!407671 () Bool)

(assert (=> b!630665 (=> (not res!407671) (not e!360621))))

(declare-fun arrayContainsKey!0 (array!38062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630665 (= res!407671 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630666 () Bool)

(assert (=> b!630666 (= e!360620 e!360618)))

(declare-fun res!407672 () Bool)

(assert (=> b!630666 (=> (not res!407672) (not e!360618))))

(assert (=> b!630666 (= res!407672 (and (= lt!291285 (Found!6705 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18265 a!2986) index!984) (select (arr!18265 a!2986) j!136))) (not (= (select (arr!18265 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630666 (= lt!291285 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18265 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630667 () Bool)

(declare-fun Unit!21157 () Unit!21154)

(assert (=> b!630667 (= e!360624 Unit!21157)))

(assert (=> b!630667 false))

(declare-fun b!630668 () Bool)

(assert (=> b!630668 (= e!360621 e!360619)))

(declare-fun res!407662 () Bool)

(assert (=> b!630668 (=> (not res!407662) (not e!360619))))

(declare-fun lt!291279 () SeekEntryResult!6705)

(assert (=> b!630668 (= res!407662 (or (= lt!291279 (MissingZero!6705 i!1108)) (= lt!291279 (MissingVacant!6705 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38062 (_ BitVec 32)) SeekEntryResult!6705)

(assert (=> b!630668 (= lt!291279 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56986 res!407670) b!630663))

(assert (= (and b!630663 res!407666) b!630662))

(assert (= (and b!630662 res!407661) b!630660))

(assert (= (and b!630660 res!407665) b!630665))

(assert (= (and b!630665 res!407671) b!630668))

(assert (= (and b!630668 res!407662) b!630656))

(assert (= (and b!630656 res!407669) b!630655))

(assert (= (and b!630655 res!407663) b!630657))

(assert (= (and b!630657 res!407667) b!630661))

(assert (= (and b!630661 res!407664) b!630666))

(assert (= (and b!630666 res!407672) b!630658))

(assert (= (and b!630658 res!407668) b!630664))

(assert (= (and b!630658 c!71864) b!630667))

(assert (= (and b!630658 (not c!71864)) b!630659))

(declare-fun m!605623 () Bool)

(assert (=> b!630655 m!605623))

(declare-fun m!605625 () Bool)

(assert (=> b!630668 m!605625))

(declare-fun m!605627 () Bool)

(assert (=> b!630665 m!605627))

(declare-fun m!605629 () Bool)

(assert (=> b!630662 m!605629))

(assert (=> b!630662 m!605629))

(declare-fun m!605631 () Bool)

(assert (=> b!630662 m!605631))

(declare-fun m!605633 () Bool)

(assert (=> b!630656 m!605633))

(declare-fun m!605635 () Bool)

(assert (=> b!630658 m!605635))

(declare-fun m!605637 () Bool)

(assert (=> b!630658 m!605637))

(assert (=> b!630658 m!605629))

(declare-fun m!605639 () Bool)

(assert (=> b!630658 m!605639))

(declare-fun m!605641 () Bool)

(assert (=> b!630658 m!605641))

(assert (=> b!630658 m!605629))

(declare-fun m!605643 () Bool)

(assert (=> b!630658 m!605643))

(declare-fun m!605645 () Bool)

(assert (=> b!630658 m!605645))

(declare-fun m!605647 () Bool)

(assert (=> b!630658 m!605647))

(declare-fun m!605649 () Bool)

(assert (=> b!630666 m!605649))

(assert (=> b!630666 m!605629))

(assert (=> b!630666 m!605629))

(declare-fun m!605651 () Bool)

(assert (=> b!630666 m!605651))

(assert (=> b!630661 m!605639))

(declare-fun m!605653 () Bool)

(assert (=> b!630661 m!605653))

(declare-fun m!605655 () Bool)

(assert (=> b!630660 m!605655))

(declare-fun m!605657 () Bool)

(assert (=> b!630657 m!605657))

(declare-fun m!605659 () Bool)

(assert (=> start!56986 m!605659))

(declare-fun m!605661 () Bool)

(assert (=> start!56986 m!605661))

(check-sat (not b!630656) (not b!630655) (not b!630658) (not b!630666) (not b!630662) (not b!630668) (not b!630660) (not start!56986) (not b!630665))
(check-sat)
