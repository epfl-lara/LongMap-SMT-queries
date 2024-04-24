; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59400 () Bool)

(assert start!59400)

(declare-fun b!655109 () Bool)

(declare-fun res!424925 () Bool)

(declare-fun e!376238 () Bool)

(assert (=> b!655109 (=> (not res!424925) (not e!376238))))

(declare-datatypes ((array!38658 0))(
  ( (array!38659 (arr!18526 (Array (_ BitVec 32) (_ BitVec 64))) (size!18890 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38658)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655109 (= res!424925 (validKeyInArray!0 (select (arr!18526 a!2986) j!136)))))

(declare-fun b!655110 () Bool)

(assert (=> b!655110 false))

(declare-fun lt!305341 () array!38658)

(declare-datatypes ((Unit!22443 0))(
  ( (Unit!22444) )
))
(declare-fun lt!305326 () Unit!22443)

(declare-datatypes ((List!12474 0))(
  ( (Nil!12471) (Cons!12470 (h!13518 (_ BitVec 64)) (t!18694 List!12474)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38658 (_ BitVec 64) (_ BitVec 32) List!12474) Unit!22443)

(assert (=> b!655110 (= lt!305326 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305341 (select (arr!18526 a!2986) j!136) j!136 Nil!12471))))

(declare-fun arrayNoDuplicates!0 (array!38658 (_ BitVec 32) List!12474) Bool)

(assert (=> b!655110 (arrayNoDuplicates!0 lt!305341 j!136 Nil!12471)))

(declare-fun lt!305329 () Unit!22443)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38658 (_ BitVec 32) (_ BitVec 32)) Unit!22443)

(assert (=> b!655110 (= lt!305329 (lemmaNoDuplicateFromThenFromBigger!0 lt!305341 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655110 (arrayNoDuplicates!0 lt!305341 #b00000000000000000000000000000000 Nil!12471)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!305335 () Unit!22443)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12474) Unit!22443)

(assert (=> b!655110 (= lt!305335 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12471))))

(declare-fun arrayContainsKey!0 (array!38658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655110 (arrayContainsKey!0 lt!305341 (select (arr!18526 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305336 () Unit!22443)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22443)

(assert (=> b!655110 (= lt!305336 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305341 (select (arr!18526 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!376227 () Unit!22443)

(declare-fun Unit!22445 () Unit!22443)

(assert (=> b!655110 (= e!376227 Unit!22445)))

(declare-fun b!655111 () Bool)

(declare-fun res!424921 () Bool)

(assert (=> b!655111 (= res!424921 (bvsge j!136 index!984))))

(declare-fun e!376235 () Bool)

(assert (=> b!655111 (=> res!424921 e!376235)))

(declare-fun e!376228 () Bool)

(assert (=> b!655111 (= e!376228 e!376235)))

(declare-fun b!655112 () Bool)

(declare-fun e!376232 () Unit!22443)

(declare-fun Unit!22446 () Unit!22443)

(assert (=> b!655112 (= e!376232 Unit!22446)))

(declare-fun b!655113 () Bool)

(declare-fun e!376234 () Bool)

(assert (=> b!655113 (= e!376234 (arrayContainsKey!0 lt!305341 (select (arr!18526 a!2986) j!136) index!984))))

(declare-fun b!655114 () Bool)

(assert (=> b!655114 false))

(declare-fun lt!305330 () Unit!22443)

(assert (=> b!655114 (= lt!305330 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305341 (select (arr!18526 a!2986) j!136) index!984 Nil!12471))))

(assert (=> b!655114 (arrayNoDuplicates!0 lt!305341 index!984 Nil!12471)))

(declare-fun lt!305334 () Unit!22443)

(assert (=> b!655114 (= lt!305334 (lemmaNoDuplicateFromThenFromBigger!0 lt!305341 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655114 (arrayNoDuplicates!0 lt!305341 #b00000000000000000000000000000000 Nil!12471)))

(declare-fun lt!305339 () Unit!22443)

(assert (=> b!655114 (= lt!305339 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12471))))

(assert (=> b!655114 (arrayContainsKey!0 lt!305341 (select (arr!18526 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305331 () Unit!22443)

(assert (=> b!655114 (= lt!305331 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305341 (select (arr!18526 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376226 () Bool)

(assert (=> b!655114 e!376226))

(declare-fun res!424932 () Bool)

(assert (=> b!655114 (=> (not res!424932) (not e!376226))))

(assert (=> b!655114 (= res!424932 (arrayContainsKey!0 lt!305341 (select (arr!18526 a!2986) j!136) j!136))))

(declare-fun e!376231 () Unit!22443)

(declare-fun Unit!22447 () Unit!22443)

(assert (=> b!655114 (= e!376231 Unit!22447)))

(declare-fun b!655115 () Bool)

(assert (=> b!655115 (= e!376226 (arrayContainsKey!0 lt!305341 (select (arr!18526 a!2986) j!136) index!984))))

(declare-fun b!655116 () Bool)

(declare-fun e!376229 () Bool)

(assert (=> b!655116 (= e!376229 (not true))))

(declare-fun lt!305327 () Unit!22443)

(declare-fun e!376233 () Unit!22443)

(assert (=> b!655116 (= lt!305327 e!376233)))

(declare-fun c!75465 () Bool)

(declare-datatypes ((SeekEntryResult!6922 0))(
  ( (MissingZero!6922 (index!30047 (_ BitVec 32))) (Found!6922 (index!30048 (_ BitVec 32))) (Intermediate!6922 (undefined!7734 Bool) (index!30049 (_ BitVec 32)) (x!58990 (_ BitVec 32))) (Undefined!6922) (MissingVacant!6922 (index!30050 (_ BitVec 32))) )
))
(declare-fun lt!305340 () SeekEntryResult!6922)

(assert (=> b!655116 (= c!75465 (= lt!305340 (Found!6922 index!984)))))

(declare-fun lt!305344 () Unit!22443)

(assert (=> b!655116 (= lt!305344 e!376232)))

(declare-fun c!75467 () Bool)

(assert (=> b!655116 (= c!75467 (= lt!305340 Undefined!6922))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!305337 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38658 (_ BitVec 32)) SeekEntryResult!6922)

(assert (=> b!655116 (= lt!305340 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305337 lt!305341 mask!3053))))

(declare-fun e!376236 () Bool)

(assert (=> b!655116 e!376236))

(declare-fun res!424927 () Bool)

(assert (=> b!655116 (=> (not res!424927) (not e!376236))))

(declare-fun lt!305325 () SeekEntryResult!6922)

(declare-fun lt!305342 () (_ BitVec 32))

(assert (=> b!655116 (= res!424927 (= lt!305325 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305342 vacantSpotIndex!68 lt!305337 lt!305341 mask!3053)))))

(assert (=> b!655116 (= lt!305325 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305342 vacantSpotIndex!68 (select (arr!18526 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655116 (= lt!305337 (select (store (arr!18526 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305328 () Unit!22443)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38658 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22443)

(assert (=> b!655116 (= lt!305328 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305342 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655116 (= lt!305342 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!655117 () Bool)

(declare-fun res!424930 () Bool)

(declare-fun e!376230 () Bool)

(assert (=> b!655117 (=> (not res!424930) (not e!376230))))

(assert (=> b!655117 (= res!424930 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18526 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655118 () Bool)

(declare-fun res!424920 () Bool)

(assert (=> b!655118 (=> (not res!424920) (not e!376238))))

(assert (=> b!655118 (= res!424920 (and (= (size!18890 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18890 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18890 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!424924 () Bool)

(assert (=> start!59400 (=> (not res!424924) (not e!376238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59400 (= res!424924 (validMask!0 mask!3053))))

(assert (=> start!59400 e!376238))

(assert (=> start!59400 true))

(declare-fun array_inv!14385 (array!38658) Bool)

(assert (=> start!59400 (array_inv!14385 a!2986)))

(declare-fun b!655119 () Bool)

(declare-fun Unit!22448 () Unit!22443)

(assert (=> b!655119 (= e!376233 Unit!22448)))

(declare-fun b!655120 () Bool)

(declare-fun res!424926 () Bool)

(assert (=> b!655120 (=> (not res!424926) (not e!376230))))

(assert (=> b!655120 (= res!424926 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12471))))

(declare-fun b!655121 () Bool)

(declare-fun Unit!22449 () Unit!22443)

(assert (=> b!655121 (= e!376231 Unit!22449)))

(declare-fun b!655122 () Bool)

(declare-fun res!424931 () Bool)

(assert (=> b!655122 (= res!424931 (arrayContainsKey!0 lt!305341 (select (arr!18526 a!2986) j!136) j!136))))

(assert (=> b!655122 (=> (not res!424931) (not e!376234))))

(assert (=> b!655122 (= e!376235 e!376234)))

(declare-fun b!655123 () Bool)

(declare-fun res!424919 () Bool)

(assert (=> b!655123 (=> (not res!424919) (not e!376238))))

(assert (=> b!655123 (= res!424919 (validKeyInArray!0 k0!1786))))

(declare-fun b!655124 () Bool)

(declare-fun Unit!22450 () Unit!22443)

(assert (=> b!655124 (= e!376233 Unit!22450)))

(declare-fun res!424922 () Bool)

(assert (=> b!655124 (= res!424922 (= (select (store (arr!18526 a!2986) i!1108 k0!1786) index!984) (select (arr!18526 a!2986) j!136)))))

(assert (=> b!655124 (=> (not res!424922) (not e!376228))))

(assert (=> b!655124 e!376228))

(declare-fun c!75464 () Bool)

(assert (=> b!655124 (= c!75464 (bvslt j!136 index!984))))

(declare-fun lt!305332 () Unit!22443)

(assert (=> b!655124 (= lt!305332 e!376227)))

(declare-fun c!75466 () Bool)

(assert (=> b!655124 (= c!75466 (bvslt index!984 j!136))))

(declare-fun lt!305333 () Unit!22443)

(assert (=> b!655124 (= lt!305333 e!376231)))

(assert (=> b!655124 false))

(declare-fun b!655125 () Bool)

(declare-fun res!424918 () Bool)

(assert (=> b!655125 (=> (not res!424918) (not e!376230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38658 (_ BitVec 32)) Bool)

(assert (=> b!655125 (= res!424918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655126 () Bool)

(declare-fun res!424923 () Bool)

(assert (=> b!655126 (=> (not res!424923) (not e!376238))))

(assert (=> b!655126 (= res!424923 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655127 () Bool)

(declare-fun e!376239 () Bool)

(assert (=> b!655127 (= e!376239 e!376229)))

(declare-fun res!424928 () Bool)

(assert (=> b!655127 (=> (not res!424928) (not e!376229))))

(declare-fun lt!305343 () SeekEntryResult!6922)

(assert (=> b!655127 (= res!424928 (and (= lt!305343 (Found!6922 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18526 a!2986) index!984) (select (arr!18526 a!2986) j!136))) (not (= (select (arr!18526 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!655127 (= lt!305343 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18526 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655128 () Bool)

(assert (=> b!655128 (= e!376230 e!376239)))

(declare-fun res!424933 () Bool)

(assert (=> b!655128 (=> (not res!424933) (not e!376239))))

(assert (=> b!655128 (= res!424933 (= (select (store (arr!18526 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655128 (= lt!305341 (array!38659 (store (arr!18526 a!2986) i!1108 k0!1786) (size!18890 a!2986)))))

(declare-fun b!655129 () Bool)

(declare-fun Unit!22451 () Unit!22443)

(assert (=> b!655129 (= e!376227 Unit!22451)))

(declare-fun b!655130 () Bool)

(declare-fun Unit!22452 () Unit!22443)

(assert (=> b!655130 (= e!376232 Unit!22452)))

(assert (=> b!655130 false))

(declare-fun b!655131 () Bool)

(assert (=> b!655131 (= e!376238 e!376230)))

(declare-fun res!424929 () Bool)

(assert (=> b!655131 (=> (not res!424929) (not e!376230))))

(declare-fun lt!305338 () SeekEntryResult!6922)

(assert (=> b!655131 (= res!424929 (or (= lt!305338 (MissingZero!6922 i!1108)) (= lt!305338 (MissingVacant!6922 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38658 (_ BitVec 32)) SeekEntryResult!6922)

(assert (=> b!655131 (= lt!305338 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655132 () Bool)

(assert (=> b!655132 (= e!376236 (= lt!305343 lt!305325))))

(assert (= (and start!59400 res!424924) b!655118))

(assert (= (and b!655118 res!424920) b!655109))

(assert (= (and b!655109 res!424925) b!655123))

(assert (= (and b!655123 res!424919) b!655126))

(assert (= (and b!655126 res!424923) b!655131))

(assert (= (and b!655131 res!424929) b!655125))

(assert (= (and b!655125 res!424918) b!655120))

(assert (= (and b!655120 res!424926) b!655117))

(assert (= (and b!655117 res!424930) b!655128))

(assert (= (and b!655128 res!424933) b!655127))

(assert (= (and b!655127 res!424928) b!655116))

(assert (= (and b!655116 res!424927) b!655132))

(assert (= (and b!655116 c!75467) b!655130))

(assert (= (and b!655116 (not c!75467)) b!655112))

(assert (= (and b!655116 c!75465) b!655124))

(assert (= (and b!655116 (not c!75465)) b!655119))

(assert (= (and b!655124 res!424922) b!655111))

(assert (= (and b!655111 (not res!424921)) b!655122))

(assert (= (and b!655122 res!424931) b!655113))

(assert (= (and b!655124 c!75464) b!655110))

(assert (= (and b!655124 (not c!75464)) b!655129))

(assert (= (and b!655124 c!75466) b!655114))

(assert (= (and b!655124 (not c!75466)) b!655121))

(assert (= (and b!655114 res!424932) b!655115))

(declare-fun m!628657 () Bool)

(assert (=> b!655117 m!628657))

(declare-fun m!628659 () Bool)

(assert (=> b!655110 m!628659))

(declare-fun m!628661 () Bool)

(assert (=> b!655110 m!628661))

(assert (=> b!655110 m!628659))

(declare-fun m!628663 () Bool)

(assert (=> b!655110 m!628663))

(assert (=> b!655110 m!628659))

(declare-fun m!628665 () Bool)

(assert (=> b!655110 m!628665))

(assert (=> b!655110 m!628659))

(declare-fun m!628667 () Bool)

(assert (=> b!655110 m!628667))

(declare-fun m!628669 () Bool)

(assert (=> b!655110 m!628669))

(declare-fun m!628671 () Bool)

(assert (=> b!655110 m!628671))

(declare-fun m!628673 () Bool)

(assert (=> b!655110 m!628673))

(declare-fun m!628675 () Bool)

(assert (=> start!59400 m!628675))

(declare-fun m!628677 () Bool)

(assert (=> start!59400 m!628677))

(declare-fun m!628679 () Bool)

(assert (=> b!655124 m!628679))

(declare-fun m!628681 () Bool)

(assert (=> b!655124 m!628681))

(assert (=> b!655124 m!628659))

(assert (=> b!655113 m!628659))

(assert (=> b!655113 m!628659))

(declare-fun m!628683 () Bool)

(assert (=> b!655113 m!628683))

(declare-fun m!628685 () Bool)

(assert (=> b!655125 m!628685))

(declare-fun m!628687 () Bool)

(assert (=> b!655123 m!628687))

(declare-fun m!628689 () Bool)

(assert (=> b!655116 m!628689))

(declare-fun m!628691 () Bool)

(assert (=> b!655116 m!628691))

(declare-fun m!628693 () Bool)

(assert (=> b!655116 m!628693))

(assert (=> b!655116 m!628659))

(assert (=> b!655116 m!628679))

(assert (=> b!655116 m!628659))

(declare-fun m!628695 () Bool)

(assert (=> b!655116 m!628695))

(declare-fun m!628697 () Bool)

(assert (=> b!655116 m!628697))

(declare-fun m!628699 () Bool)

(assert (=> b!655116 m!628699))

(declare-fun m!628701 () Bool)

(assert (=> b!655126 m!628701))

(assert (=> b!655122 m!628659))

(assert (=> b!655122 m!628659))

(declare-fun m!628703 () Bool)

(assert (=> b!655122 m!628703))

(assert (=> b!655114 m!628659))

(declare-fun m!628705 () Bool)

(assert (=> b!655114 m!628705))

(assert (=> b!655114 m!628659))

(declare-fun m!628707 () Bool)

(assert (=> b!655114 m!628707))

(assert (=> b!655114 m!628659))

(declare-fun m!628709 () Bool)

(assert (=> b!655114 m!628709))

(declare-fun m!628711 () Bool)

(assert (=> b!655114 m!628711))

(assert (=> b!655114 m!628659))

(declare-fun m!628713 () Bool)

(assert (=> b!655114 m!628713))

(assert (=> b!655114 m!628669))

(assert (=> b!655114 m!628659))

(assert (=> b!655114 m!628703))

(assert (=> b!655114 m!628673))

(declare-fun m!628715 () Bool)

(assert (=> b!655131 m!628715))

(declare-fun m!628717 () Bool)

(assert (=> b!655120 m!628717))

(assert (=> b!655109 m!628659))

(assert (=> b!655109 m!628659))

(declare-fun m!628719 () Bool)

(assert (=> b!655109 m!628719))

(assert (=> b!655115 m!628659))

(assert (=> b!655115 m!628659))

(assert (=> b!655115 m!628683))

(declare-fun m!628721 () Bool)

(assert (=> b!655127 m!628721))

(assert (=> b!655127 m!628659))

(assert (=> b!655127 m!628659))

(declare-fun m!628723 () Bool)

(assert (=> b!655127 m!628723))

(assert (=> b!655128 m!628679))

(declare-fun m!628725 () Bool)

(assert (=> b!655128 m!628725))

(check-sat (not b!655123) (not b!655125) (not b!655115) (not b!655126) (not start!59400) (not b!655122) (not b!655109) (not b!655114) (not b!655127) (not b!655120) (not b!655116) (not b!655113) (not b!655110) (not b!655131))
(check-sat)
