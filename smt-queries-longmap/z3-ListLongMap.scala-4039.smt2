; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55092 () Bool)

(assert start!55092)

(declare-fun b!602655 () Bool)

(declare-fun e!344701 () Bool)

(declare-fun e!344700 () Bool)

(assert (=> b!602655 (= e!344701 e!344700)))

(declare-fun res!386994 () Bool)

(assert (=> b!602655 (=> (not res!386994) (not e!344700))))

(declare-datatypes ((SeekEntryResult!6283 0))(
  ( (MissingZero!6283 (index!27395 (_ BitVec 32))) (Found!6283 (index!27396 (_ BitVec 32))) (Intermediate!6283 (undefined!7095 Bool) (index!27397 (_ BitVec 32)) (x!56207 (_ BitVec 32))) (Undefined!6283) (MissingVacant!6283 (index!27398 (_ BitVec 32))) )
))
(declare-fun lt!274427 () SeekEntryResult!6283)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!602655 (= res!386994 (or (= lt!274427 (MissingZero!6283 i!1108)) (= lt!274427 (MissingVacant!6283 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37179 0))(
  ( (array!37180 (arr!17846 (Array (_ BitVec 32) (_ BitVec 64))) (size!18211 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37179)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37179 (_ BitVec 32)) SeekEntryResult!6283)

(assert (=> b!602655 (= lt!274427 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!602656 () Bool)

(declare-datatypes ((Unit!19080 0))(
  ( (Unit!19081) )
))
(declare-fun e!344702 () Unit!19080)

(declare-fun Unit!19082 () Unit!19080)

(assert (=> b!602656 (= e!344702 Unit!19082)))

(declare-fun b!602657 () Bool)

(declare-fun e!344695 () Bool)

(declare-fun lt!274431 () SeekEntryResult!6283)

(declare-fun lt!274432 () SeekEntryResult!6283)

(assert (=> b!602657 (= e!344695 (= lt!274431 lt!274432))))

(declare-fun b!602658 () Bool)

(declare-fun e!344698 () Bool)

(declare-fun e!344704 () Bool)

(assert (=> b!602658 (= e!344698 e!344704)))

(declare-fun res!386990 () Bool)

(assert (=> b!602658 (=> res!386990 e!344704)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!602658 (= res!386990 (bvsge index!984 j!136))))

(declare-fun lt!274435 () Unit!19080)

(assert (=> b!602658 (= lt!274435 e!344702)))

(declare-fun c!68204 () Bool)

(assert (=> b!602658 (= c!68204 (bvslt j!136 index!984))))

(declare-fun b!602660 () Bool)

(declare-fun Unit!19083 () Unit!19080)

(assert (=> b!602660 (= e!344702 Unit!19083)))

(declare-fun lt!274433 () array!37179)

(declare-fun lt!274434 () Unit!19080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37179 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19080)

(assert (=> b!602660 (= lt!274434 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274433 (select (arr!17846 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602660 (arrayContainsKey!0 lt!274433 (select (arr!17846 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274428 () Unit!19080)

(declare-datatypes ((List!11926 0))(
  ( (Nil!11923) (Cons!11922 (h!12967 (_ BitVec 64)) (t!18145 List!11926)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37179 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11926) Unit!19080)

(assert (=> b!602660 (= lt!274428 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11923))))

(declare-fun arrayNoDuplicates!0 (array!37179 (_ BitVec 32) List!11926) Bool)

(assert (=> b!602660 (arrayNoDuplicates!0 lt!274433 #b00000000000000000000000000000000 Nil!11923)))

(declare-fun lt!274425 () Unit!19080)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37179 (_ BitVec 32) (_ BitVec 32)) Unit!19080)

(assert (=> b!602660 (= lt!274425 (lemmaNoDuplicateFromThenFromBigger!0 lt!274433 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602660 (arrayNoDuplicates!0 lt!274433 j!136 Nil!11923)))

(declare-fun lt!274426 () Unit!19080)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37179 (_ BitVec 64) (_ BitVec 32) List!11926) Unit!19080)

(assert (=> b!602660 (= lt!274426 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274433 (select (arr!17846 a!2986) j!136) j!136 Nil!11923))))

(assert (=> b!602660 false))

(declare-fun b!602661 () Bool)

(declare-fun res!386989 () Bool)

(assert (=> b!602661 (=> (not res!386989) (not e!344701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602661 (= res!386989 (validKeyInArray!0 (select (arr!17846 a!2986) j!136)))))

(declare-fun b!602662 () Bool)

(declare-fun res!386985 () Bool)

(assert (=> b!602662 (=> (not res!386985) (not e!344701))))

(assert (=> b!602662 (= res!386985 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602663 () Bool)

(declare-fun res!386992 () Bool)

(assert (=> b!602663 (=> (not res!386992) (not e!344701))))

(assert (=> b!602663 (= res!386992 (validKeyInArray!0 k0!1786))))

(declare-fun b!602664 () Bool)

(declare-fun e!344705 () Unit!19080)

(declare-fun Unit!19084 () Unit!19080)

(assert (=> b!602664 (= e!344705 Unit!19084)))

(declare-fun b!602665 () Bool)

(declare-fun res!386983 () Bool)

(assert (=> b!602665 (=> (not res!386983) (not e!344700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37179 (_ BitVec 32)) Bool)

(assert (=> b!602665 (= res!386983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602666 () Bool)

(declare-fun res!386988 () Bool)

(assert (=> b!602666 (=> (not res!386988) (not e!344700))))

(assert (=> b!602666 (= res!386988 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11923))))

(declare-fun b!602667 () Bool)

(declare-fun res!386987 () Bool)

(assert (=> b!602667 (=> (not res!386987) (not e!344701))))

(assert (=> b!602667 (= res!386987 (and (= (size!18211 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18211 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18211 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602668 () Bool)

(declare-fun e!344699 () Bool)

(declare-fun e!344693 () Bool)

(assert (=> b!602668 (= e!344699 e!344693)))

(declare-fun res!386997 () Bool)

(assert (=> b!602668 (=> (not res!386997) (not e!344693))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!602668 (= res!386997 (and (= lt!274431 (Found!6283 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17846 a!2986) index!984) (select (arr!17846 a!2986) j!136))) (not (= (select (arr!17846 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37179 (_ BitVec 32)) SeekEntryResult!6283)

(assert (=> b!602668 (= lt!274431 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17846 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602669 () Bool)

(declare-fun e!344697 () Bool)

(declare-fun e!344694 () Bool)

(assert (=> b!602669 (= e!344697 e!344694)))

(declare-fun res!386998 () Bool)

(assert (=> b!602669 (=> (not res!386998) (not e!344694))))

(assert (=> b!602669 (= res!386998 (arrayContainsKey!0 lt!274433 (select (arr!17846 a!2986) j!136) j!136))))

(declare-fun b!602670 () Bool)

(assert (=> b!602670 (= e!344694 (arrayContainsKey!0 lt!274433 (select (arr!17846 a!2986) j!136) index!984))))

(declare-fun e!344696 () Bool)

(declare-fun b!602671 () Bool)

(assert (=> b!602671 (= e!344696 (arrayContainsKey!0 lt!274433 (select (arr!17846 a!2986) j!136) index!984))))

(declare-fun b!602672 () Bool)

(declare-fun res!386996 () Bool)

(assert (=> b!602672 (=> (not res!386996) (not e!344700))))

(assert (=> b!602672 (= res!386996 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17846 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602659 () Bool)

(declare-fun e!344703 () Bool)

(assert (=> b!602659 (= e!344703 e!344697)))

(declare-fun res!386993 () Bool)

(assert (=> b!602659 (=> res!386993 e!344697)))

(declare-fun lt!274430 () (_ BitVec 64))

(declare-fun lt!274429 () (_ BitVec 64))

(assert (=> b!602659 (= res!386993 (or (not (= (select (arr!17846 a!2986) j!136) lt!274429)) (not (= (select (arr!17846 a!2986) j!136) lt!274430)) (bvsge j!136 index!984)))))

(declare-fun res!386984 () Bool)

(assert (=> start!55092 (=> (not res!386984) (not e!344701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55092 (= res!386984 (validMask!0 mask!3053))))

(assert (=> start!55092 e!344701))

(assert (=> start!55092 true))

(declare-fun array_inv!13729 (array!37179) Bool)

(assert (=> start!55092 (array_inv!13729 a!2986)))

(declare-fun b!602673 () Bool)

(declare-fun Unit!19085 () Unit!19080)

(assert (=> b!602673 (= e!344705 Unit!19085)))

(assert (=> b!602673 false))

(declare-fun b!602674 () Bool)

(assert (=> b!602674 (= e!344700 e!344699)))

(declare-fun res!386981 () Bool)

(assert (=> b!602674 (=> (not res!386981) (not e!344699))))

(assert (=> b!602674 (= res!386981 (= (select (store (arr!17846 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602674 (= lt!274433 (array!37180 (store (arr!17846 a!2986) i!1108 k0!1786) (size!18211 a!2986)))))

(declare-fun b!602675 () Bool)

(declare-fun e!344692 () Bool)

(assert (=> b!602675 (= e!344693 (not e!344692))))

(declare-fun res!386986 () Bool)

(assert (=> b!602675 (=> res!386986 e!344692)))

(declare-fun lt!274437 () SeekEntryResult!6283)

(assert (=> b!602675 (= res!386986 (not (= lt!274437 (Found!6283 index!984))))))

(declare-fun lt!274438 () Unit!19080)

(assert (=> b!602675 (= lt!274438 e!344705)))

(declare-fun c!68205 () Bool)

(assert (=> b!602675 (= c!68205 (= lt!274437 Undefined!6283))))

(assert (=> b!602675 (= lt!274437 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274429 lt!274433 mask!3053))))

(assert (=> b!602675 e!344695))

(declare-fun res!386999 () Bool)

(assert (=> b!602675 (=> (not res!386999) (not e!344695))))

(declare-fun lt!274436 () (_ BitVec 32))

(assert (=> b!602675 (= res!386999 (= lt!274432 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274436 vacantSpotIndex!68 lt!274429 lt!274433 mask!3053)))))

(assert (=> b!602675 (= lt!274432 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274436 vacantSpotIndex!68 (select (arr!17846 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602675 (= lt!274429 (select (store (arr!17846 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274424 () Unit!19080)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37179 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19080)

(assert (=> b!602675 (= lt!274424 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274436 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602675 (= lt!274436 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602676 () Bool)

(assert (=> b!602676 (= e!344692 e!344698)))

(declare-fun res!386982 () Bool)

(assert (=> b!602676 (=> res!386982 e!344698)))

(assert (=> b!602676 (= res!386982 (or (not (= (select (arr!17846 a!2986) j!136) lt!274429)) (not (= (select (arr!17846 a!2986) j!136) lt!274430))))))

(assert (=> b!602676 e!344703))

(declare-fun res!386995 () Bool)

(assert (=> b!602676 (=> (not res!386995) (not e!344703))))

(assert (=> b!602676 (= res!386995 (= lt!274430 (select (arr!17846 a!2986) j!136)))))

(assert (=> b!602676 (= lt!274430 (select (store (arr!17846 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!602677 () Bool)

(assert (=> b!602677 (= e!344704 true)))

(assert (=> b!602677 e!344696))

(declare-fun res!386991 () Bool)

(assert (=> b!602677 (=> (not res!386991) (not e!344696))))

(assert (=> b!602677 (= res!386991 (arrayContainsKey!0 lt!274433 (select (arr!17846 a!2986) j!136) j!136))))

(assert (= (and start!55092 res!386984) b!602667))

(assert (= (and b!602667 res!386987) b!602661))

(assert (= (and b!602661 res!386989) b!602663))

(assert (= (and b!602663 res!386992) b!602662))

(assert (= (and b!602662 res!386985) b!602655))

(assert (= (and b!602655 res!386994) b!602665))

(assert (= (and b!602665 res!386983) b!602666))

(assert (= (and b!602666 res!386988) b!602672))

(assert (= (and b!602672 res!386996) b!602674))

(assert (= (and b!602674 res!386981) b!602668))

(assert (= (and b!602668 res!386997) b!602675))

(assert (= (and b!602675 res!386999) b!602657))

(assert (= (and b!602675 c!68205) b!602673))

(assert (= (and b!602675 (not c!68205)) b!602664))

(assert (= (and b!602675 (not res!386986)) b!602676))

(assert (= (and b!602676 res!386995) b!602659))

(assert (= (and b!602659 (not res!386993)) b!602669))

(assert (= (and b!602669 res!386998) b!602670))

(assert (= (and b!602676 (not res!386982)) b!602658))

(assert (= (and b!602658 c!68204) b!602660))

(assert (= (and b!602658 (not c!68204)) b!602656))

(assert (= (and b!602658 (not res!386990)) b!602677))

(assert (= (and b!602677 res!386991) b!602671))

(declare-fun m!579241 () Bool)

(assert (=> start!55092 m!579241))

(declare-fun m!579243 () Bool)

(assert (=> start!55092 m!579243))

(declare-fun m!579245 () Bool)

(assert (=> b!602672 m!579245))

(declare-fun m!579247 () Bool)

(assert (=> b!602677 m!579247))

(assert (=> b!602677 m!579247))

(declare-fun m!579249 () Bool)

(assert (=> b!602677 m!579249))

(declare-fun m!579251 () Bool)

(assert (=> b!602675 m!579251))

(declare-fun m!579253 () Bool)

(assert (=> b!602675 m!579253))

(assert (=> b!602675 m!579247))

(declare-fun m!579255 () Bool)

(assert (=> b!602675 m!579255))

(declare-fun m!579257 () Bool)

(assert (=> b!602675 m!579257))

(assert (=> b!602675 m!579247))

(declare-fun m!579259 () Bool)

(assert (=> b!602675 m!579259))

(declare-fun m!579261 () Bool)

(assert (=> b!602675 m!579261))

(declare-fun m!579263 () Bool)

(assert (=> b!602675 m!579263))

(assert (=> b!602674 m!579257))

(declare-fun m!579265 () Bool)

(assert (=> b!602674 m!579265))

(declare-fun m!579267 () Bool)

(assert (=> b!602665 m!579267))

(declare-fun m!579269 () Bool)

(assert (=> b!602662 m!579269))

(assert (=> b!602676 m!579247))

(assert (=> b!602676 m!579257))

(declare-fun m!579271 () Bool)

(assert (=> b!602676 m!579271))

(assert (=> b!602671 m!579247))

(assert (=> b!602671 m!579247))

(declare-fun m!579273 () Bool)

(assert (=> b!602671 m!579273))

(assert (=> b!602669 m!579247))

(assert (=> b!602669 m!579247))

(assert (=> b!602669 m!579249))

(declare-fun m!579275 () Bool)

(assert (=> b!602655 m!579275))

(declare-fun m!579277 () Bool)

(assert (=> b!602668 m!579277))

(assert (=> b!602668 m!579247))

(assert (=> b!602668 m!579247))

(declare-fun m!579279 () Bool)

(assert (=> b!602668 m!579279))

(assert (=> b!602661 m!579247))

(assert (=> b!602661 m!579247))

(declare-fun m!579281 () Bool)

(assert (=> b!602661 m!579281))

(assert (=> b!602670 m!579247))

(assert (=> b!602670 m!579247))

(assert (=> b!602670 m!579273))

(assert (=> b!602659 m!579247))

(declare-fun m!579283 () Bool)

(assert (=> b!602666 m!579283))

(declare-fun m!579285 () Bool)

(assert (=> b!602663 m!579285))

(assert (=> b!602660 m!579247))

(declare-fun m!579287 () Bool)

(assert (=> b!602660 m!579287))

(assert (=> b!602660 m!579247))

(declare-fun m!579289 () Bool)

(assert (=> b!602660 m!579289))

(assert (=> b!602660 m!579247))

(declare-fun m!579291 () Bool)

(assert (=> b!602660 m!579291))

(declare-fun m!579293 () Bool)

(assert (=> b!602660 m!579293))

(declare-fun m!579295 () Bool)

(assert (=> b!602660 m!579295))

(assert (=> b!602660 m!579247))

(declare-fun m!579297 () Bool)

(assert (=> b!602660 m!579297))

(declare-fun m!579299 () Bool)

(assert (=> b!602660 m!579299))

(check-sat (not b!602661) (not b!602668) (not b!602669) (not b!602655) (not b!602660) (not b!602671) (not start!55092) (not b!602663) (not b!602670) (not b!602677) (not b!602662) (not b!602675) (not b!602665) (not b!602666))
(check-sat)
