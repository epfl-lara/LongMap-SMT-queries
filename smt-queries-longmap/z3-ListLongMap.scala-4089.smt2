; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56082 () Bool)

(assert start!56082)

(declare-fun b!616732 () Bool)

(declare-fun res!397257 () Bool)

(declare-fun e!353640 () Bool)

(assert (=> b!616732 (=> (not res!397257) (not e!353640))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37497 0))(
  ( (array!37498 (arr!17992 (Array (_ BitVec 32) (_ BitVec 64))) (size!18356 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37497)

(assert (=> b!616732 (= res!397257 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17992 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616733 () Bool)

(declare-fun res!397253 () Bool)

(assert (=> b!616733 (=> (not res!397253) (not e!353640))))

(declare-datatypes ((List!11940 0))(
  ( (Nil!11937) (Cons!11936 (h!12984 (_ BitVec 64)) (t!18160 List!11940)) )
))
(declare-fun arrayNoDuplicates!0 (array!37497 (_ BitVec 32) List!11940) Bool)

(assert (=> b!616733 (= res!397253 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11937))))

(declare-fun b!616735 () Bool)

(declare-datatypes ((Unit!20077 0))(
  ( (Unit!20078) )
))
(declare-fun e!353644 () Unit!20077)

(declare-fun Unit!20079 () Unit!20077)

(assert (=> b!616735 (= e!353644 Unit!20079)))

(declare-fun b!616736 () Bool)

(declare-fun res!397254 () Bool)

(declare-fun e!353635 () Bool)

(assert (=> b!616736 (=> (not res!397254) (not e!353635))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!616736 (= res!397254 (and (= (size!18356 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18356 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18356 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616737 () Bool)

(declare-fun res!397251 () Bool)

(assert (=> b!616737 (=> (not res!397251) (not e!353635))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616737 (= res!397251 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616738 () Bool)

(declare-fun e!353634 () Bool)

(assert (=> b!616738 (= e!353640 e!353634)))

(declare-fun res!397258 () Bool)

(assert (=> b!616738 (=> (not res!397258) (not e!353634))))

(assert (=> b!616738 (= res!397258 (= (select (store (arr!17992 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!283696 () array!37497)

(assert (=> b!616738 (= lt!283696 (array!37498 (store (arr!17992 a!2986) i!1108 k0!1786) (size!18356 a!2986)))))

(declare-fun b!616739 () Bool)

(assert (=> b!616739 false))

(declare-fun lt!283699 () Unit!20077)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37497 (_ BitVec 64) (_ BitVec 32) List!11940) Unit!20077)

(assert (=> b!616739 (= lt!283699 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283696 (select (arr!17992 a!2986) j!136) index!984 Nil!11937))))

(assert (=> b!616739 (arrayNoDuplicates!0 lt!283696 index!984 Nil!11937)))

(declare-fun lt!283692 () Unit!20077)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37497 (_ BitVec 32) (_ BitVec 32)) Unit!20077)

(assert (=> b!616739 (= lt!283692 (lemmaNoDuplicateFromThenFromBigger!0 lt!283696 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616739 (arrayNoDuplicates!0 lt!283696 #b00000000000000000000000000000000 Nil!11937)))

(declare-fun lt!283685 () Unit!20077)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37497 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11940) Unit!20077)

(assert (=> b!616739 (= lt!283685 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11937))))

(assert (=> b!616739 (arrayContainsKey!0 lt!283696 (select (arr!17992 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283695 () Unit!20077)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37497 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20077)

(assert (=> b!616739 (= lt!283695 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283696 (select (arr!17992 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353645 () Bool)

(assert (=> b!616739 e!353645))

(declare-fun res!397259 () Bool)

(assert (=> b!616739 (=> (not res!397259) (not e!353645))))

(assert (=> b!616739 (= res!397259 (arrayContainsKey!0 lt!283696 (select (arr!17992 a!2986) j!136) j!136))))

(declare-fun e!353633 () Unit!20077)

(declare-fun Unit!20080 () Unit!20077)

(assert (=> b!616739 (= e!353633 Unit!20080)))

(declare-fun b!616740 () Bool)

(declare-fun e!353637 () Bool)

(assert (=> b!616740 (= e!353637 true)))

(assert (=> b!616740 (= (select (store (arr!17992 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616741 () Bool)

(declare-fun e!353646 () Unit!20077)

(declare-fun Unit!20081 () Unit!20077)

(assert (=> b!616741 (= e!353646 Unit!20081)))

(declare-fun b!616742 () Bool)

(assert (=> b!616742 (= e!353635 e!353640)))

(declare-fun res!397252 () Bool)

(assert (=> b!616742 (=> (not res!397252) (not e!353640))))

(declare-datatypes ((SeekEntryResult!6388 0))(
  ( (MissingZero!6388 (index!27836 (_ BitVec 32))) (Found!6388 (index!27837 (_ BitVec 32))) (Intermediate!6388 (undefined!7200 Bool) (index!27838 (_ BitVec 32)) (x!56783 (_ BitVec 32))) (Undefined!6388) (MissingVacant!6388 (index!27839 (_ BitVec 32))) )
))
(declare-fun lt!283690 () SeekEntryResult!6388)

(assert (=> b!616742 (= res!397252 (or (= lt!283690 (MissingZero!6388 i!1108)) (= lt!283690 (MissingVacant!6388 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37497 (_ BitVec 32)) SeekEntryResult!6388)

(assert (=> b!616742 (= lt!283690 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!353638 () Bool)

(declare-fun b!616743 () Bool)

(assert (=> b!616743 (= e!353638 (arrayContainsKey!0 lt!283696 (select (arr!17992 a!2986) j!136) index!984))))

(declare-fun b!616744 () Bool)

(declare-fun e!353632 () Unit!20077)

(declare-fun Unit!20082 () Unit!20077)

(assert (=> b!616744 (= e!353632 Unit!20082)))

(assert (=> b!616744 false))

(declare-fun b!616745 () Bool)

(declare-fun res!397246 () Bool)

(assert (=> b!616745 (= res!397246 (bvsge j!136 index!984))))

(declare-fun e!353643 () Bool)

(assert (=> b!616745 (=> res!397246 e!353643)))

(declare-fun e!353639 () Bool)

(assert (=> b!616745 (= e!353639 e!353643)))

(declare-fun b!616746 () Bool)

(declare-fun e!353641 () Bool)

(assert (=> b!616746 (= e!353634 e!353641)))

(declare-fun res!397256 () Bool)

(assert (=> b!616746 (=> (not res!397256) (not e!353641))))

(declare-fun lt!283682 () SeekEntryResult!6388)

(assert (=> b!616746 (= res!397256 (and (= lt!283682 (Found!6388 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17992 a!2986) index!984) (select (arr!17992 a!2986) j!136))) (not (= (select (arr!17992 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37497 (_ BitVec 32)) SeekEntryResult!6388)

(assert (=> b!616746 (= lt!283682 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17992 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616747 () Bool)

(declare-fun res!397260 () Bool)

(assert (=> b!616747 (= res!397260 (arrayContainsKey!0 lt!283696 (select (arr!17992 a!2986) j!136) j!136))))

(assert (=> b!616747 (=> (not res!397260) (not e!353638))))

(assert (=> b!616747 (= e!353643 e!353638)))

(declare-fun b!616748 () Bool)

(declare-fun res!397247 () Bool)

(assert (=> b!616748 (=> (not res!397247) (not e!353635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616748 (= res!397247 (validKeyInArray!0 (select (arr!17992 a!2986) j!136)))))

(declare-fun b!616749 () Bool)

(assert (=> b!616749 (= e!353641 (not e!353637))))

(declare-fun res!397255 () Bool)

(assert (=> b!616749 (=> res!397255 e!353637)))

(declare-fun lt!283694 () SeekEntryResult!6388)

(assert (=> b!616749 (= res!397255 (not (= lt!283694 (MissingVacant!6388 vacantSpotIndex!68))))))

(declare-fun lt!283689 () Unit!20077)

(assert (=> b!616749 (= lt!283689 e!353644)))

(declare-fun c!70115 () Bool)

(assert (=> b!616749 (= c!70115 (= lt!283694 (Found!6388 index!984)))))

(declare-fun lt!283683 () Unit!20077)

(assert (=> b!616749 (= lt!283683 e!353632)))

(declare-fun c!70114 () Bool)

(assert (=> b!616749 (= c!70114 (= lt!283694 Undefined!6388))))

(declare-fun lt!283697 () (_ BitVec 64))

(assert (=> b!616749 (= lt!283694 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283697 lt!283696 mask!3053))))

(declare-fun e!353642 () Bool)

(assert (=> b!616749 e!353642))

(declare-fun res!397248 () Bool)

(assert (=> b!616749 (=> (not res!397248) (not e!353642))))

(declare-fun lt!283698 () SeekEntryResult!6388)

(declare-fun lt!283688 () (_ BitVec 32))

(assert (=> b!616749 (= res!397248 (= lt!283698 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283688 vacantSpotIndex!68 lt!283697 lt!283696 mask!3053)))))

(assert (=> b!616749 (= lt!283698 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283688 vacantSpotIndex!68 (select (arr!17992 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616749 (= lt!283697 (select (store (arr!17992 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283681 () Unit!20077)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20077)

(assert (=> b!616749 (= lt!283681 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283688 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616749 (= lt!283688 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!616750 () Bool)

(declare-fun Unit!20083 () Unit!20077)

(assert (=> b!616750 (= e!353632 Unit!20083)))

(declare-fun b!616734 () Bool)

(assert (=> b!616734 (= e!353642 (= lt!283682 lt!283698))))

(declare-fun res!397250 () Bool)

(assert (=> start!56082 (=> (not res!397250) (not e!353635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56082 (= res!397250 (validMask!0 mask!3053))))

(assert (=> start!56082 e!353635))

(assert (=> start!56082 true))

(declare-fun array_inv!13851 (array!37497) Bool)

(assert (=> start!56082 (array_inv!13851 a!2986)))

(declare-fun b!616751 () Bool)

(declare-fun Unit!20084 () Unit!20077)

(assert (=> b!616751 (= e!353633 Unit!20084)))

(declare-fun b!616752 () Bool)

(declare-fun res!397245 () Bool)

(assert (=> b!616752 (=> (not res!397245) (not e!353640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37497 (_ BitVec 32)) Bool)

(assert (=> b!616752 (= res!397245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616753 () Bool)

(assert (=> b!616753 false))

(declare-fun lt!283680 () Unit!20077)

(assert (=> b!616753 (= lt!283680 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283696 (select (arr!17992 a!2986) j!136) j!136 Nil!11937))))

(assert (=> b!616753 (arrayNoDuplicates!0 lt!283696 j!136 Nil!11937)))

(declare-fun lt!283687 () Unit!20077)

(assert (=> b!616753 (= lt!283687 (lemmaNoDuplicateFromThenFromBigger!0 lt!283696 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616753 (arrayNoDuplicates!0 lt!283696 #b00000000000000000000000000000000 Nil!11937)))

(declare-fun lt!283684 () Unit!20077)

(assert (=> b!616753 (= lt!283684 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11937))))

(assert (=> b!616753 (arrayContainsKey!0 lt!283696 (select (arr!17992 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283686 () Unit!20077)

(assert (=> b!616753 (= lt!283686 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283696 (select (arr!17992 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20085 () Unit!20077)

(assert (=> b!616753 (= e!353646 Unit!20085)))

(declare-fun b!616754 () Bool)

(declare-fun res!397261 () Bool)

(assert (=> b!616754 (=> (not res!397261) (not e!353635))))

(assert (=> b!616754 (= res!397261 (validKeyInArray!0 k0!1786))))

(declare-fun b!616755 () Bool)

(assert (=> b!616755 (= e!353645 (arrayContainsKey!0 lt!283696 (select (arr!17992 a!2986) j!136) index!984))))

(declare-fun b!616756 () Bool)

(declare-fun Unit!20086 () Unit!20077)

(assert (=> b!616756 (= e!353644 Unit!20086)))

(declare-fun res!397249 () Bool)

(assert (=> b!616756 (= res!397249 (= (select (store (arr!17992 a!2986) i!1108 k0!1786) index!984) (select (arr!17992 a!2986) j!136)))))

(assert (=> b!616756 (=> (not res!397249) (not e!353639))))

(assert (=> b!616756 e!353639))

(declare-fun c!70112 () Bool)

(assert (=> b!616756 (= c!70112 (bvslt j!136 index!984))))

(declare-fun lt!283691 () Unit!20077)

(assert (=> b!616756 (= lt!283691 e!353646)))

(declare-fun c!70113 () Bool)

(assert (=> b!616756 (= c!70113 (bvslt index!984 j!136))))

(declare-fun lt!283693 () Unit!20077)

(assert (=> b!616756 (= lt!283693 e!353633)))

(assert (=> b!616756 false))

(assert (= (and start!56082 res!397250) b!616736))

(assert (= (and b!616736 res!397254) b!616748))

(assert (= (and b!616748 res!397247) b!616754))

(assert (= (and b!616754 res!397261) b!616737))

(assert (= (and b!616737 res!397251) b!616742))

(assert (= (and b!616742 res!397252) b!616752))

(assert (= (and b!616752 res!397245) b!616733))

(assert (= (and b!616733 res!397253) b!616732))

(assert (= (and b!616732 res!397257) b!616738))

(assert (= (and b!616738 res!397258) b!616746))

(assert (= (and b!616746 res!397256) b!616749))

(assert (= (and b!616749 res!397248) b!616734))

(assert (= (and b!616749 c!70114) b!616744))

(assert (= (and b!616749 (not c!70114)) b!616750))

(assert (= (and b!616749 c!70115) b!616756))

(assert (= (and b!616749 (not c!70115)) b!616735))

(assert (= (and b!616756 res!397249) b!616745))

(assert (= (and b!616745 (not res!397246)) b!616747))

(assert (= (and b!616747 res!397260) b!616743))

(assert (= (and b!616756 c!70112) b!616753))

(assert (= (and b!616756 (not c!70112)) b!616741))

(assert (= (and b!616756 c!70113) b!616739))

(assert (= (and b!616756 (not c!70113)) b!616751))

(assert (= (and b!616739 res!397259) b!616755))

(assert (= (and b!616749 (not res!397255)) b!616740))

(declare-fun m!593177 () Bool)

(assert (=> b!616742 m!593177))

(declare-fun m!593179 () Bool)

(assert (=> b!616739 m!593179))

(declare-fun m!593181 () Bool)

(assert (=> b!616739 m!593181))

(assert (=> b!616739 m!593181))

(declare-fun m!593183 () Bool)

(assert (=> b!616739 m!593183))

(assert (=> b!616739 m!593181))

(declare-fun m!593185 () Bool)

(assert (=> b!616739 m!593185))

(assert (=> b!616739 m!593181))

(declare-fun m!593187 () Bool)

(assert (=> b!616739 m!593187))

(declare-fun m!593189 () Bool)

(assert (=> b!616739 m!593189))

(declare-fun m!593191 () Bool)

(assert (=> b!616739 m!593191))

(assert (=> b!616739 m!593181))

(declare-fun m!593193 () Bool)

(assert (=> b!616739 m!593193))

(declare-fun m!593195 () Bool)

(assert (=> b!616739 m!593195))

(declare-fun m!593197 () Bool)

(assert (=> b!616733 m!593197))

(declare-fun m!593199 () Bool)

(assert (=> b!616754 m!593199))

(declare-fun m!593201 () Bool)

(assert (=> start!56082 m!593201))

(declare-fun m!593203 () Bool)

(assert (=> start!56082 m!593203))

(assert (=> b!616755 m!593181))

(assert (=> b!616755 m!593181))

(declare-fun m!593205 () Bool)

(assert (=> b!616755 m!593205))

(declare-fun m!593207 () Bool)

(assert (=> b!616737 m!593207))

(assert (=> b!616753 m!593181))

(assert (=> b!616753 m!593181))

(declare-fun m!593209 () Bool)

(assert (=> b!616753 m!593209))

(assert (=> b!616753 m!593181))

(declare-fun m!593211 () Bool)

(assert (=> b!616753 m!593211))

(declare-fun m!593213 () Bool)

(assert (=> b!616753 m!593213))

(declare-fun m!593215 () Bool)

(assert (=> b!616753 m!593215))

(assert (=> b!616753 m!593181))

(declare-fun m!593217 () Bool)

(assert (=> b!616753 m!593217))

(assert (=> b!616753 m!593191))

(assert (=> b!616753 m!593195))

(declare-fun m!593219 () Bool)

(assert (=> b!616746 m!593219))

(assert (=> b!616746 m!593181))

(assert (=> b!616746 m!593181))

(declare-fun m!593221 () Bool)

(assert (=> b!616746 m!593221))

(declare-fun m!593223 () Bool)

(assert (=> b!616752 m!593223))

(assert (=> b!616748 m!593181))

(assert (=> b!616748 m!593181))

(declare-fun m!593225 () Bool)

(assert (=> b!616748 m!593225))

(assert (=> b!616747 m!593181))

(assert (=> b!616747 m!593181))

(assert (=> b!616747 m!593193))

(declare-fun m!593227 () Bool)

(assert (=> b!616756 m!593227))

(declare-fun m!593229 () Bool)

(assert (=> b!616756 m!593229))

(assert (=> b!616756 m!593181))

(assert (=> b!616743 m!593181))

(assert (=> b!616743 m!593181))

(assert (=> b!616743 m!593205))

(declare-fun m!593231 () Bool)

(assert (=> b!616732 m!593231))

(assert (=> b!616738 m!593227))

(declare-fun m!593233 () Bool)

(assert (=> b!616738 m!593233))

(declare-fun m!593235 () Bool)

(assert (=> b!616749 m!593235))

(declare-fun m!593237 () Bool)

(assert (=> b!616749 m!593237))

(assert (=> b!616749 m!593181))

(declare-fun m!593239 () Bool)

(assert (=> b!616749 m!593239))

(assert (=> b!616749 m!593227))

(declare-fun m!593241 () Bool)

(assert (=> b!616749 m!593241))

(declare-fun m!593243 () Bool)

(assert (=> b!616749 m!593243))

(assert (=> b!616749 m!593181))

(declare-fun m!593245 () Bool)

(assert (=> b!616749 m!593245))

(assert (=> b!616740 m!593227))

(assert (=> b!616740 m!593229))

(check-sat (not b!616743) (not b!616747) (not b!616753) (not b!616737) (not b!616746) (not b!616749) (not b!616739) (not b!616748) (not b!616755) (not b!616754) (not start!56082) (not b!616742) (not b!616752) (not b!616733))
(check-sat)
