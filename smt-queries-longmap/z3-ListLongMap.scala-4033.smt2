; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54954 () Bool)

(assert start!54954)

(declare-fun b!601316 () Bool)

(declare-fun res!386040 () Bool)

(declare-fun e!343821 () Bool)

(assert (=> b!601316 (=> (not res!386040) (not e!343821))))

(declare-datatypes ((array!37134 0))(
  ( (array!37135 (arr!17824 (Array (_ BitVec 32) (_ BitVec 64))) (size!18188 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37134)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37134 (_ BitVec 32)) Bool)

(assert (=> b!601316 (= res!386040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601317 () Bool)

(declare-datatypes ((Unit!18973 0))(
  ( (Unit!18974) )
))
(declare-fun e!343825 () Unit!18973)

(declare-fun Unit!18975 () Unit!18973)

(assert (=> b!601317 (= e!343825 Unit!18975)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!273674 () Unit!18973)

(declare-fun lt!273668 () array!37134)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37134 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18973)

(assert (=> b!601317 (= lt!273674 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273668 (select (arr!17824 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601317 (arrayContainsKey!0 lt!273668 (select (arr!17824 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!273676 () Unit!18973)

(declare-datatypes ((List!11772 0))(
  ( (Nil!11769) (Cons!11768 (h!12816 (_ BitVec 64)) (t!17992 List!11772)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37134 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11772) Unit!18973)

(assert (=> b!601317 (= lt!273676 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11769))))

(declare-fun arrayNoDuplicates!0 (array!37134 (_ BitVec 32) List!11772) Bool)

(assert (=> b!601317 (arrayNoDuplicates!0 lt!273668 #b00000000000000000000000000000000 Nil!11769)))

(declare-fun lt!273665 () Unit!18973)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37134 (_ BitVec 32) (_ BitVec 32)) Unit!18973)

(assert (=> b!601317 (= lt!273665 (lemmaNoDuplicateFromThenFromBigger!0 lt!273668 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601317 (arrayNoDuplicates!0 lt!273668 j!136 Nil!11769)))

(declare-fun lt!273664 () Unit!18973)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37134 (_ BitVec 64) (_ BitVec 32) List!11772) Unit!18973)

(assert (=> b!601317 (= lt!273664 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273668 (select (arr!17824 a!2986) j!136) j!136 Nil!11769))))

(assert (=> b!601317 false))

(declare-fun b!601318 () Bool)

(declare-fun Unit!18976 () Unit!18973)

(assert (=> b!601318 (= e!343825 Unit!18976)))

(declare-fun b!601319 () Bool)

(declare-fun res!386044 () Bool)

(declare-fun e!343826 () Bool)

(assert (=> b!601319 (=> (not res!386044) (not e!343826))))

(assert (=> b!601319 (= res!386044 (and (= (size!18188 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18188 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18188 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601320 () Bool)

(declare-fun res!386043 () Bool)

(assert (=> b!601320 (=> (not res!386043) (not e!343826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601320 (= res!386043 (validKeyInArray!0 k0!1786))))

(declare-fun b!601321 () Bool)

(declare-fun res!386047 () Bool)

(assert (=> b!601321 (=> (not res!386047) (not e!343821))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!601321 (= res!386047 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17824 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601322 () Bool)

(declare-fun e!343828 () Bool)

(assert (=> b!601322 (= e!343828 true)))

(declare-fun lt!273663 () Unit!18973)

(assert (=> b!601322 (= lt!273663 e!343825)))

(declare-fun c!68012 () Bool)

(assert (=> b!601322 (= c!68012 (bvslt j!136 index!984))))

(declare-fun b!601323 () Bool)

(declare-fun e!343818 () Bool)

(declare-fun e!343822 () Bool)

(assert (=> b!601323 (= e!343818 (not e!343822))))

(declare-fun res!386031 () Bool)

(assert (=> b!601323 (=> res!386031 e!343822)))

(declare-datatypes ((SeekEntryResult!6220 0))(
  ( (MissingZero!6220 (index!27137 (_ BitVec 32))) (Found!6220 (index!27138 (_ BitVec 32))) (Intermediate!6220 (undefined!7032 Bool) (index!27139 (_ BitVec 32)) (x!56086 (_ BitVec 32))) (Undefined!6220) (MissingVacant!6220 (index!27140 (_ BitVec 32))) )
))
(declare-fun lt!273662 () SeekEntryResult!6220)

(assert (=> b!601323 (= res!386031 (not (= lt!273662 (Found!6220 index!984))))))

(declare-fun lt!273673 () Unit!18973)

(declare-fun e!343830 () Unit!18973)

(assert (=> b!601323 (= lt!273673 e!343830)))

(declare-fun c!68011 () Bool)

(assert (=> b!601323 (= c!68011 (= lt!273662 Undefined!6220))))

(declare-fun lt!273672 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37134 (_ BitVec 32)) SeekEntryResult!6220)

(assert (=> b!601323 (= lt!273662 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273672 lt!273668 mask!3053))))

(declare-fun e!343820 () Bool)

(assert (=> b!601323 e!343820))

(declare-fun res!386034 () Bool)

(assert (=> b!601323 (=> (not res!386034) (not e!343820))))

(declare-fun lt!273667 () (_ BitVec 32))

(declare-fun lt!273670 () SeekEntryResult!6220)

(assert (=> b!601323 (= res!386034 (= lt!273670 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273667 vacantSpotIndex!68 lt!273672 lt!273668 mask!3053)))))

(assert (=> b!601323 (= lt!273670 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273667 vacantSpotIndex!68 (select (arr!17824 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601323 (= lt!273672 (select (store (arr!17824 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273669 () Unit!18973)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37134 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18973)

(assert (=> b!601323 (= lt!273669 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273667 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601323 (= lt!273667 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!601324 () Bool)

(declare-fun e!343827 () Bool)

(assert (=> b!601324 (= e!343827 e!343818)))

(declare-fun res!386033 () Bool)

(assert (=> b!601324 (=> (not res!386033) (not e!343818))))

(declare-fun lt!273666 () SeekEntryResult!6220)

(assert (=> b!601324 (= res!386033 (and (= lt!273666 (Found!6220 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17824 a!2986) index!984) (select (arr!17824 a!2986) j!136))) (not (= (select (arr!17824 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601324 (= lt!273666 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17824 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601325 () Bool)

(declare-fun res!386037 () Bool)

(assert (=> b!601325 (=> (not res!386037) (not e!343826))))

(assert (=> b!601325 (= res!386037 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601326 () Bool)

(declare-fun res!386035 () Bool)

(assert (=> b!601326 (=> (not res!386035) (not e!343826))))

(assert (=> b!601326 (= res!386035 (validKeyInArray!0 (select (arr!17824 a!2986) j!136)))))

(declare-fun b!601327 () Bool)

(declare-fun e!343823 () Bool)

(declare-fun e!343824 () Bool)

(assert (=> b!601327 (= e!343823 e!343824)))

(declare-fun res!386036 () Bool)

(assert (=> b!601327 (=> (not res!386036) (not e!343824))))

(assert (=> b!601327 (= res!386036 (arrayContainsKey!0 lt!273668 (select (arr!17824 a!2986) j!136) j!136))))

(declare-fun b!601328 () Bool)

(assert (=> b!601328 (= e!343824 (arrayContainsKey!0 lt!273668 (select (arr!17824 a!2986) j!136) index!984))))

(declare-fun b!601329 () Bool)

(assert (=> b!601329 (= e!343826 e!343821)))

(declare-fun res!386032 () Bool)

(assert (=> b!601329 (=> (not res!386032) (not e!343821))))

(declare-fun lt!273675 () SeekEntryResult!6220)

(assert (=> b!601329 (= res!386032 (or (= lt!273675 (MissingZero!6220 i!1108)) (= lt!273675 (MissingVacant!6220 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37134 (_ BitVec 32)) SeekEntryResult!6220)

(assert (=> b!601329 (= lt!273675 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!386038 () Bool)

(assert (=> start!54954 (=> (not res!386038) (not e!343826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54954 (= res!386038 (validMask!0 mask!3053))))

(assert (=> start!54954 e!343826))

(assert (=> start!54954 true))

(declare-fun array_inv!13683 (array!37134) Bool)

(assert (=> start!54954 (array_inv!13683 a!2986)))

(declare-fun b!601330 () Bool)

(assert (=> b!601330 (= e!343821 e!343827)))

(declare-fun res!386041 () Bool)

(assert (=> b!601330 (=> (not res!386041) (not e!343827))))

(assert (=> b!601330 (= res!386041 (= (select (store (arr!17824 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601330 (= lt!273668 (array!37135 (store (arr!17824 a!2986) i!1108 k0!1786) (size!18188 a!2986)))))

(declare-fun b!601331 () Bool)

(declare-fun e!343819 () Bool)

(assert (=> b!601331 (= e!343819 e!343823)))

(declare-fun res!386039 () Bool)

(assert (=> b!601331 (=> res!386039 e!343823)))

(declare-fun lt!273671 () (_ BitVec 64))

(assert (=> b!601331 (= res!386039 (or (not (= (select (arr!17824 a!2986) j!136) lt!273672)) (not (= (select (arr!17824 a!2986) j!136) lt!273671)) (bvsge j!136 index!984)))))

(declare-fun b!601332 () Bool)

(assert (=> b!601332 (= e!343822 e!343828)))

(declare-fun res!386046 () Bool)

(assert (=> b!601332 (=> res!386046 e!343828)))

(assert (=> b!601332 (= res!386046 (or (not (= (select (arr!17824 a!2986) j!136) lt!273672)) (not (= (select (arr!17824 a!2986) j!136) lt!273671))))))

(assert (=> b!601332 e!343819))

(declare-fun res!386045 () Bool)

(assert (=> b!601332 (=> (not res!386045) (not e!343819))))

(assert (=> b!601332 (= res!386045 (= lt!273671 (select (arr!17824 a!2986) j!136)))))

(assert (=> b!601332 (= lt!273671 (select (store (arr!17824 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!601333 () Bool)

(declare-fun res!386042 () Bool)

(assert (=> b!601333 (=> (not res!386042) (not e!343821))))

(assert (=> b!601333 (= res!386042 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11769))))

(declare-fun b!601334 () Bool)

(assert (=> b!601334 (= e!343820 (= lt!273666 lt!273670))))

(declare-fun b!601335 () Bool)

(declare-fun Unit!18977 () Unit!18973)

(assert (=> b!601335 (= e!343830 Unit!18977)))

(assert (=> b!601335 false))

(declare-fun b!601336 () Bool)

(declare-fun Unit!18978 () Unit!18973)

(assert (=> b!601336 (= e!343830 Unit!18978)))

(assert (= (and start!54954 res!386038) b!601319))

(assert (= (and b!601319 res!386044) b!601326))

(assert (= (and b!601326 res!386035) b!601320))

(assert (= (and b!601320 res!386043) b!601325))

(assert (= (and b!601325 res!386037) b!601329))

(assert (= (and b!601329 res!386032) b!601316))

(assert (= (and b!601316 res!386040) b!601333))

(assert (= (and b!601333 res!386042) b!601321))

(assert (= (and b!601321 res!386047) b!601330))

(assert (= (and b!601330 res!386041) b!601324))

(assert (= (and b!601324 res!386033) b!601323))

(assert (= (and b!601323 res!386034) b!601334))

(assert (= (and b!601323 c!68011) b!601335))

(assert (= (and b!601323 (not c!68011)) b!601336))

(assert (= (and b!601323 (not res!386031)) b!601332))

(assert (= (and b!601332 res!386045) b!601331))

(assert (= (and b!601331 (not res!386039)) b!601327))

(assert (= (and b!601327 res!386036) b!601328))

(assert (= (and b!601332 (not res!386046)) b!601322))

(assert (= (and b!601322 c!68012) b!601317))

(assert (= (and b!601322 (not c!68012)) b!601318))

(declare-fun m!578741 () Bool)

(assert (=> b!601327 m!578741))

(assert (=> b!601327 m!578741))

(declare-fun m!578743 () Bool)

(assert (=> b!601327 m!578743))

(declare-fun m!578745 () Bool)

(assert (=> b!601330 m!578745))

(declare-fun m!578747 () Bool)

(assert (=> b!601330 m!578747))

(declare-fun m!578749 () Bool)

(assert (=> b!601317 m!578749))

(assert (=> b!601317 m!578741))

(declare-fun m!578751 () Bool)

(assert (=> b!601317 m!578751))

(assert (=> b!601317 m!578741))

(declare-fun m!578753 () Bool)

(assert (=> b!601317 m!578753))

(assert (=> b!601317 m!578741))

(declare-fun m!578755 () Bool)

(assert (=> b!601317 m!578755))

(declare-fun m!578757 () Bool)

(assert (=> b!601317 m!578757))

(assert (=> b!601317 m!578741))

(declare-fun m!578759 () Bool)

(assert (=> b!601317 m!578759))

(declare-fun m!578761 () Bool)

(assert (=> b!601317 m!578761))

(assert (=> b!601331 m!578741))

(assert (=> b!601332 m!578741))

(assert (=> b!601332 m!578745))

(declare-fun m!578763 () Bool)

(assert (=> b!601332 m!578763))

(declare-fun m!578765 () Bool)

(assert (=> b!601329 m!578765))

(assert (=> b!601328 m!578741))

(assert (=> b!601328 m!578741))

(declare-fun m!578767 () Bool)

(assert (=> b!601328 m!578767))

(declare-fun m!578769 () Bool)

(assert (=> b!601316 m!578769))

(assert (=> b!601326 m!578741))

(assert (=> b!601326 m!578741))

(declare-fun m!578771 () Bool)

(assert (=> b!601326 m!578771))

(declare-fun m!578773 () Bool)

(assert (=> b!601323 m!578773))

(assert (=> b!601323 m!578741))

(declare-fun m!578775 () Bool)

(assert (=> b!601323 m!578775))

(assert (=> b!601323 m!578745))

(assert (=> b!601323 m!578741))

(declare-fun m!578777 () Bool)

(assert (=> b!601323 m!578777))

(declare-fun m!578779 () Bool)

(assert (=> b!601323 m!578779))

(declare-fun m!578781 () Bool)

(assert (=> b!601323 m!578781))

(declare-fun m!578783 () Bool)

(assert (=> b!601323 m!578783))

(declare-fun m!578785 () Bool)

(assert (=> b!601325 m!578785))

(declare-fun m!578787 () Bool)

(assert (=> b!601324 m!578787))

(assert (=> b!601324 m!578741))

(assert (=> b!601324 m!578741))

(declare-fun m!578789 () Bool)

(assert (=> b!601324 m!578789))

(declare-fun m!578791 () Bool)

(assert (=> start!54954 m!578791))

(declare-fun m!578793 () Bool)

(assert (=> start!54954 m!578793))

(declare-fun m!578795 () Bool)

(assert (=> b!601320 m!578795))

(declare-fun m!578797 () Bool)

(assert (=> b!601321 m!578797))

(declare-fun m!578799 () Bool)

(assert (=> b!601333 m!578799))

(check-sat (not b!601327) (not b!601333) (not b!601326) (not start!54954) (not b!601320) (not b!601324) (not b!601317) (not b!601325) (not b!601323) (not b!601316) (not b!601329) (not b!601328))
(check-sat)
