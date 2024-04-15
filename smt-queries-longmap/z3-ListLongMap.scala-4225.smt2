; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58106 () Bool)

(assert start!58106)

(declare-fun b!641745 () Bool)

(declare-fun res!415674 () Bool)

(declare-fun e!367490 () Bool)

(assert (=> b!641745 (=> res!415674 e!367490)))

(declare-datatypes ((List!12484 0))(
  ( (Nil!12481) (Cons!12480 (h!13525 (_ BitVec 64)) (t!18703 List!12484)) )
))
(declare-fun contains!3117 (List!12484 (_ BitVec 64)) Bool)

(assert (=> b!641745 (= res!415674 (contains!3117 Nil!12481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!641746 () Bool)

(declare-fun res!415675 () Bool)

(declare-fun e!367494 () Bool)

(assert (=> b!641746 (=> (not res!415675) (not e!367494))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38376 0))(
  ( (array!38377 (arr!18404 (Array (_ BitVec 32) (_ BitVec 64))) (size!18769 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38376)

(assert (=> b!641746 (= res!415675 (and (= (size!18769 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18769 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18769 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!641747 () Bool)

(declare-fun e!367484 () Bool)

(declare-fun e!367495 () Bool)

(assert (=> b!641747 (= e!367484 e!367495)))

(declare-fun res!415676 () Bool)

(assert (=> b!641747 (=> (not res!415676) (not e!367495))))

(declare-fun lt!297004 () array!38376)

(declare-fun arrayContainsKey!0 (array!38376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!641747 (= res!415676 (arrayContainsKey!0 lt!297004 (select (arr!18404 a!2986) j!136) j!136))))

(declare-fun b!641748 () Bool)

(declare-fun e!367496 () Bool)

(declare-fun e!367485 () Bool)

(assert (=> b!641748 (= e!367496 e!367485)))

(declare-fun res!415663 () Bool)

(assert (=> b!641748 (=> res!415663 e!367485)))

(declare-fun lt!297008 () (_ BitVec 64))

(declare-fun lt!297001 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!641748 (= res!415663 (or (not (= (select (arr!18404 a!2986) j!136) lt!297008)) (not (= (select (arr!18404 a!2986) j!136) lt!297001)) (bvsge j!136 index!984)))))

(declare-fun e!367486 () Bool)

(assert (=> b!641748 e!367486))

(declare-fun res!415669 () Bool)

(assert (=> b!641748 (=> (not res!415669) (not e!367486))))

(assert (=> b!641748 (= res!415669 (= lt!297001 (select (arr!18404 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!641748 (= lt!297001 (select (store (arr!18404 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!641749 () Bool)

(declare-datatypes ((Unit!21692 0))(
  ( (Unit!21693) )
))
(declare-fun e!367487 () Unit!21692)

(declare-fun Unit!21694 () Unit!21692)

(assert (=> b!641749 (= e!367487 Unit!21694)))

(declare-fun b!641750 () Bool)

(declare-fun res!415673 () Bool)

(declare-fun e!367489 () Bool)

(assert (=> b!641750 (=> (not res!415673) (not e!367489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38376 (_ BitVec 32)) Bool)

(assert (=> b!641750 (= res!415673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!641751 () Bool)

(declare-fun res!415666 () Bool)

(assert (=> b!641751 (=> (not res!415666) (not e!367494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641751 (= res!415666 (validKeyInArray!0 (select (arr!18404 a!2986) j!136)))))

(declare-fun b!641752 () Bool)

(assert (=> b!641752 (= e!367494 e!367489)))

(declare-fun res!415664 () Bool)

(assert (=> b!641752 (=> (not res!415664) (not e!367489))))

(declare-datatypes ((SeekEntryResult!6841 0))(
  ( (MissingZero!6841 (index!29690 (_ BitVec 32))) (Found!6841 (index!29691 (_ BitVec 32))) (Intermediate!6841 (undefined!7653 Bool) (index!29692 (_ BitVec 32)) (x!58466 (_ BitVec 32))) (Undefined!6841) (MissingVacant!6841 (index!29693 (_ BitVec 32))) )
))
(declare-fun lt!297006 () SeekEntryResult!6841)

(assert (=> b!641752 (= res!415664 (or (= lt!297006 (MissingZero!6841 i!1108)) (= lt!297006 (MissingVacant!6841 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38376 (_ BitVec 32)) SeekEntryResult!6841)

(assert (=> b!641752 (= lt!297006 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!641753 () Bool)

(declare-fun res!415672 () Bool)

(assert (=> b!641753 (=> (not res!415672) (not e!367494))))

(assert (=> b!641753 (= res!415672 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641754 () Bool)

(declare-fun res!415668 () Bool)

(assert (=> b!641754 (=> (not res!415668) (not e!367494))))

(assert (=> b!641754 (= res!415668 (validKeyInArray!0 k0!1786))))

(declare-fun b!641755 () Bool)

(declare-fun res!415659 () Bool)

(assert (=> b!641755 (=> (not res!415659) (not e!367489))))

(declare-fun arrayNoDuplicates!0 (array!38376 (_ BitVec 32) List!12484) Bool)

(assert (=> b!641755 (= res!415659 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12481))))

(declare-fun b!641756 () Bool)

(declare-fun e!367493 () Bool)

(assert (=> b!641756 (= e!367493 (not e!367496))))

(declare-fun res!415677 () Bool)

(assert (=> b!641756 (=> res!415677 e!367496)))

(declare-fun lt!296999 () SeekEntryResult!6841)

(assert (=> b!641756 (= res!415677 (not (= lt!296999 (Found!6841 index!984))))))

(declare-fun lt!297005 () Unit!21692)

(assert (=> b!641756 (= lt!297005 e!367487)))

(declare-fun c!73410 () Bool)

(assert (=> b!641756 (= c!73410 (= lt!296999 Undefined!6841))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38376 (_ BitVec 32)) SeekEntryResult!6841)

(assert (=> b!641756 (= lt!296999 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297008 lt!297004 mask!3053))))

(declare-fun e!367488 () Bool)

(assert (=> b!641756 e!367488))

(declare-fun res!415662 () Bool)

(assert (=> b!641756 (=> (not res!415662) (not e!367488))))

(declare-fun lt!297011 () SeekEntryResult!6841)

(declare-fun lt!297000 () (_ BitVec 32))

(assert (=> b!641756 (= res!415662 (= lt!297011 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297000 vacantSpotIndex!68 lt!297008 lt!297004 mask!3053)))))

(assert (=> b!641756 (= lt!297011 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297000 vacantSpotIndex!68 (select (arr!18404 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!641756 (= lt!297008 (select (store (arr!18404 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297002 () Unit!21692)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38376 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21692)

(assert (=> b!641756 (= lt!297002 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297000 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641756 (= lt!297000 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!641758 () Bool)

(declare-fun e!367491 () Bool)

(assert (=> b!641758 (= e!367491 e!367493)))

(declare-fun res!415665 () Bool)

(assert (=> b!641758 (=> (not res!415665) (not e!367493))))

(declare-fun lt!297009 () SeekEntryResult!6841)

(assert (=> b!641758 (= res!415665 (and (= lt!297009 (Found!6841 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18404 a!2986) index!984) (select (arr!18404 a!2986) j!136))) (not (= (select (arr!18404 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!641758 (= lt!297009 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18404 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641759 () Bool)

(assert (=> b!641759 (= e!367486 e!367484)))

(declare-fun res!415671 () Bool)

(assert (=> b!641759 (=> res!415671 e!367484)))

(assert (=> b!641759 (= res!415671 (or (not (= (select (arr!18404 a!2986) j!136) lt!297008)) (not (= (select (arr!18404 a!2986) j!136) lt!297001)) (bvsge j!136 index!984)))))

(declare-fun b!641760 () Bool)

(assert (=> b!641760 (= e!367490 true)))

(declare-fun lt!297003 () Bool)

(assert (=> b!641760 (= lt!297003 (contains!3117 Nil!12481 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!641761 () Bool)

(declare-fun res!415678 () Bool)

(assert (=> b!641761 (=> (not res!415678) (not e!367489))))

(assert (=> b!641761 (= res!415678 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18404 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641762 () Bool)

(assert (=> b!641762 (= e!367495 (arrayContainsKey!0 lt!297004 (select (arr!18404 a!2986) j!136) index!984))))

(declare-fun b!641763 () Bool)

(assert (=> b!641763 (= e!367489 e!367491)))

(declare-fun res!415670 () Bool)

(assert (=> b!641763 (=> (not res!415670) (not e!367491))))

(assert (=> b!641763 (= res!415670 (= (select (store (arr!18404 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641763 (= lt!297004 (array!38377 (store (arr!18404 a!2986) i!1108 k0!1786) (size!18769 a!2986)))))

(declare-fun b!641764 () Bool)

(declare-fun res!415660 () Bool)

(assert (=> b!641764 (=> res!415660 e!367490)))

(declare-fun noDuplicate!410 (List!12484) Bool)

(assert (=> b!641764 (= res!415660 (not (noDuplicate!410 Nil!12481)))))

(declare-fun res!415661 () Bool)

(assert (=> start!58106 (=> (not res!415661) (not e!367494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58106 (= res!415661 (validMask!0 mask!3053))))

(assert (=> start!58106 e!367494))

(assert (=> start!58106 true))

(declare-fun array_inv!14287 (array!38376) Bool)

(assert (=> start!58106 (array_inv!14287 a!2986)))

(declare-fun b!641757 () Bool)

(declare-fun Unit!21695 () Unit!21692)

(assert (=> b!641757 (= e!367487 Unit!21695)))

(assert (=> b!641757 false))

(declare-fun b!641765 () Bool)

(assert (=> b!641765 (= e!367485 e!367490)))

(declare-fun res!415667 () Bool)

(assert (=> b!641765 (=> res!415667 e!367490)))

(assert (=> b!641765 (= res!415667 (or (bvsge (size!18769 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18769 a!2986))))))

(assert (=> b!641765 (arrayNoDuplicates!0 lt!297004 j!136 Nil!12481)))

(declare-fun lt!297012 () Unit!21692)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38376 (_ BitVec 32) (_ BitVec 32)) Unit!21692)

(assert (=> b!641765 (= lt!297012 (lemmaNoDuplicateFromThenFromBigger!0 lt!297004 #b00000000000000000000000000000000 j!136))))

(assert (=> b!641765 (arrayNoDuplicates!0 lt!297004 #b00000000000000000000000000000000 Nil!12481)))

(declare-fun lt!297007 () Unit!21692)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12484) Unit!21692)

(assert (=> b!641765 (= lt!297007 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12481))))

(assert (=> b!641765 (arrayContainsKey!0 lt!297004 (select (arr!18404 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297010 () Unit!21692)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21692)

(assert (=> b!641765 (= lt!297010 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297004 (select (arr!18404 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!641766 () Bool)

(assert (=> b!641766 (= e!367488 (= lt!297009 lt!297011))))

(assert (= (and start!58106 res!415661) b!641746))

(assert (= (and b!641746 res!415675) b!641751))

(assert (= (and b!641751 res!415666) b!641754))

(assert (= (and b!641754 res!415668) b!641753))

(assert (= (and b!641753 res!415672) b!641752))

(assert (= (and b!641752 res!415664) b!641750))

(assert (= (and b!641750 res!415673) b!641755))

(assert (= (and b!641755 res!415659) b!641761))

(assert (= (and b!641761 res!415678) b!641763))

(assert (= (and b!641763 res!415670) b!641758))

(assert (= (and b!641758 res!415665) b!641756))

(assert (= (and b!641756 res!415662) b!641766))

(assert (= (and b!641756 c!73410) b!641757))

(assert (= (and b!641756 (not c!73410)) b!641749))

(assert (= (and b!641756 (not res!415677)) b!641748))

(assert (= (and b!641748 res!415669) b!641759))

(assert (= (and b!641759 (not res!415671)) b!641747))

(assert (= (and b!641747 res!415676) b!641762))

(assert (= (and b!641748 (not res!415663)) b!641765))

(assert (= (and b!641765 (not res!415667)) b!641764))

(assert (= (and b!641764 (not res!415660)) b!641745))

(assert (= (and b!641745 (not res!415674)) b!641760))

(declare-fun m!615039 () Bool)

(assert (=> start!58106 m!615039))

(declare-fun m!615041 () Bool)

(assert (=> start!58106 m!615041))

(declare-fun m!615043 () Bool)

(assert (=> b!641745 m!615043))

(declare-fun m!615045 () Bool)

(assert (=> b!641752 m!615045))

(declare-fun m!615047 () Bool)

(assert (=> b!641762 m!615047))

(assert (=> b!641762 m!615047))

(declare-fun m!615049 () Bool)

(assert (=> b!641762 m!615049))

(declare-fun m!615051 () Bool)

(assert (=> b!641753 m!615051))

(declare-fun m!615053 () Bool)

(assert (=> b!641758 m!615053))

(assert (=> b!641758 m!615047))

(assert (=> b!641758 m!615047))

(declare-fun m!615055 () Bool)

(assert (=> b!641758 m!615055))

(declare-fun m!615057 () Bool)

(assert (=> b!641764 m!615057))

(assert (=> b!641759 m!615047))

(declare-fun m!615059 () Bool)

(assert (=> b!641761 m!615059))

(declare-fun m!615061 () Bool)

(assert (=> b!641756 m!615061))

(declare-fun m!615063 () Bool)

(assert (=> b!641756 m!615063))

(declare-fun m!615065 () Bool)

(assert (=> b!641756 m!615065))

(assert (=> b!641756 m!615047))

(declare-fun m!615067 () Bool)

(assert (=> b!641756 m!615067))

(declare-fun m!615069 () Bool)

(assert (=> b!641756 m!615069))

(assert (=> b!641756 m!615047))

(declare-fun m!615071 () Bool)

(assert (=> b!641756 m!615071))

(declare-fun m!615073 () Bool)

(assert (=> b!641756 m!615073))

(declare-fun m!615075 () Bool)

(assert (=> b!641760 m!615075))

(declare-fun m!615077 () Bool)

(assert (=> b!641754 m!615077))

(assert (=> b!641765 m!615047))

(declare-fun m!615079 () Bool)

(assert (=> b!641765 m!615079))

(declare-fun m!615081 () Bool)

(assert (=> b!641765 m!615081))

(assert (=> b!641765 m!615047))

(declare-fun m!615083 () Bool)

(assert (=> b!641765 m!615083))

(declare-fun m!615085 () Bool)

(assert (=> b!641765 m!615085))

(assert (=> b!641765 m!615047))

(declare-fun m!615087 () Bool)

(assert (=> b!641765 m!615087))

(declare-fun m!615089 () Bool)

(assert (=> b!641765 m!615089))

(assert (=> b!641763 m!615067))

(declare-fun m!615091 () Bool)

(assert (=> b!641763 m!615091))

(declare-fun m!615093 () Bool)

(assert (=> b!641750 m!615093))

(assert (=> b!641747 m!615047))

(assert (=> b!641747 m!615047))

(declare-fun m!615095 () Bool)

(assert (=> b!641747 m!615095))

(assert (=> b!641751 m!615047))

(assert (=> b!641751 m!615047))

(declare-fun m!615097 () Bool)

(assert (=> b!641751 m!615097))

(declare-fun m!615099 () Bool)

(assert (=> b!641755 m!615099))

(assert (=> b!641748 m!615047))

(assert (=> b!641748 m!615067))

(declare-fun m!615101 () Bool)

(assert (=> b!641748 m!615101))

(check-sat (not b!641750) (not b!641754) (not b!641751) (not b!641762) (not b!641758) (not b!641765) (not b!641752) (not b!641753) (not start!58106) (not b!641760) (not b!641747) (not b!641756) (not b!641764) (not b!641745) (not b!641755))
(check-sat)
