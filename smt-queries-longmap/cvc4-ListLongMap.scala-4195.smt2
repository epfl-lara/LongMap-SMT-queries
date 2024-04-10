; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57264 () Bool)

(assert start!57264)

(declare-fun b!633864 () Bool)

(declare-fun res!409983 () Bool)

(declare-fun e!362446 () Bool)

(assert (=> b!633864 (=> (not res!409983) (not e!362446))))

(declare-datatypes ((array!38174 0))(
  ( (array!38175 (arr!18317 (Array (_ BitVec 32) (_ BitVec 64))) (size!18681 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38174)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633864 (= res!409983 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633865 () Bool)

(declare-fun res!409975 () Bool)

(assert (=> b!633865 (=> (not res!409975) (not e!362446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633865 (= res!409975 (validKeyInArray!0 k!1786))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!633866 () Bool)

(declare-fun e!362443 () Bool)

(declare-fun lt!293004 () (_ BitVec 64))

(declare-fun lt!293007 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633866 (= e!362443 (or (not (= (select (arr!18317 a!2986) j!136) lt!293007)) (not (= (select (arr!18317 a!2986) j!136) lt!293004)) (bvsge j!136 index!984) (bvsge index!984 (size!18681 a!2986)) (bvsge (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000)))))

(declare-fun e!362449 () Bool)

(assert (=> b!633866 e!362449))

(declare-fun res!409980 () Bool)

(assert (=> b!633866 (=> (not res!409980) (not e!362449))))

(assert (=> b!633866 (= res!409980 (= lt!293004 (select (arr!18317 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633866 (= lt!293004 (select (store (arr!18317 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!633867 () Bool)

(declare-fun e!362451 () Bool)

(assert (=> b!633867 (= e!362451 (not e!362443))))

(declare-fun res!409984 () Bool)

(assert (=> b!633867 (=> res!409984 e!362443)))

(declare-datatypes ((SeekEntryResult!6757 0))(
  ( (MissingZero!6757 (index!29327 (_ BitVec 32))) (Found!6757 (index!29328 (_ BitVec 32))) (Intermediate!6757 (undefined!7569 Bool) (index!29329 (_ BitVec 32)) (x!58066 (_ BitVec 32))) (Undefined!6757) (MissingVacant!6757 (index!29330 (_ BitVec 32))) )
))
(declare-fun lt!293003 () SeekEntryResult!6757)

(assert (=> b!633867 (= res!409984 (not (= lt!293003 (Found!6757 index!984))))))

(declare-datatypes ((Unit!21362 0))(
  ( (Unit!21363) )
))
(declare-fun lt!293010 () Unit!21362)

(declare-fun e!362444 () Unit!21362)

(assert (=> b!633867 (= lt!293010 e!362444)))

(declare-fun c!72314 () Bool)

(assert (=> b!633867 (= c!72314 (= lt!293003 Undefined!6757))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!293009 () array!38174)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38174 (_ BitVec 32)) SeekEntryResult!6757)

(assert (=> b!633867 (= lt!293003 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293007 lt!293009 mask!3053))))

(declare-fun e!362441 () Bool)

(assert (=> b!633867 e!362441))

(declare-fun res!409978 () Bool)

(assert (=> b!633867 (=> (not res!409978) (not e!362441))))

(declare-fun lt!293005 () SeekEntryResult!6757)

(declare-fun lt!293002 () (_ BitVec 32))

(assert (=> b!633867 (= res!409978 (= lt!293005 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293002 vacantSpotIndex!68 lt!293007 lt!293009 mask!3053)))))

(assert (=> b!633867 (= lt!293005 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293002 vacantSpotIndex!68 (select (arr!18317 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633867 (= lt!293007 (select (store (arr!18317 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293011 () Unit!21362)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38174 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21362)

(assert (=> b!633867 (= lt!293011 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293002 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633867 (= lt!293002 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633868 () Bool)

(declare-fun e!362450 () Bool)

(assert (=> b!633868 (= e!362446 e!362450)))

(declare-fun res!409973 () Bool)

(assert (=> b!633868 (=> (not res!409973) (not e!362450))))

(declare-fun lt!293008 () SeekEntryResult!6757)

(assert (=> b!633868 (= res!409973 (or (= lt!293008 (MissingZero!6757 i!1108)) (= lt!293008 (MissingVacant!6757 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38174 (_ BitVec 32)) SeekEntryResult!6757)

(assert (=> b!633868 (= lt!293008 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!633869 () Bool)

(declare-fun Unit!21364 () Unit!21362)

(assert (=> b!633869 (= e!362444 Unit!21364)))

(declare-fun b!633870 () Bool)

(declare-fun e!362442 () Bool)

(declare-fun e!362448 () Bool)

(assert (=> b!633870 (= e!362442 e!362448)))

(declare-fun res!409970 () Bool)

(assert (=> b!633870 (=> (not res!409970) (not e!362448))))

(assert (=> b!633870 (= res!409970 (arrayContainsKey!0 lt!293009 (select (arr!18317 a!2986) j!136) j!136))))

(declare-fun b!633871 () Bool)

(declare-fun res!409974 () Bool)

(assert (=> b!633871 (=> (not res!409974) (not e!362450))))

(declare-datatypes ((List!12358 0))(
  ( (Nil!12355) (Cons!12354 (h!13399 (_ BitVec 64)) (t!18586 List!12358)) )
))
(declare-fun arrayNoDuplicates!0 (array!38174 (_ BitVec 32) List!12358) Bool)

(assert (=> b!633871 (= res!409974 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12355))))

(declare-fun b!633872 () Bool)

(declare-fun res!409972 () Bool)

(assert (=> b!633872 (=> (not res!409972) (not e!362446))))

(assert (=> b!633872 (= res!409972 (and (= (size!18681 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18681 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18681 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633873 () Bool)

(assert (=> b!633873 (= e!362449 e!362442)))

(declare-fun res!409976 () Bool)

(assert (=> b!633873 (=> res!409976 e!362442)))

(assert (=> b!633873 (= res!409976 (or (not (= (select (arr!18317 a!2986) j!136) lt!293007)) (not (= (select (arr!18317 a!2986) j!136) lt!293004)) (bvsge j!136 index!984)))))

(declare-fun b!633874 () Bool)

(declare-fun e!362445 () Bool)

(assert (=> b!633874 (= e!362450 e!362445)))

(declare-fun res!409979 () Bool)

(assert (=> b!633874 (=> (not res!409979) (not e!362445))))

(assert (=> b!633874 (= res!409979 (= (select (store (arr!18317 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633874 (= lt!293009 (array!38175 (store (arr!18317 a!2986) i!1108 k!1786) (size!18681 a!2986)))))

(declare-fun res!409977 () Bool)

(assert (=> start!57264 (=> (not res!409977) (not e!362446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57264 (= res!409977 (validMask!0 mask!3053))))

(assert (=> start!57264 e!362446))

(assert (=> start!57264 true))

(declare-fun array_inv!14113 (array!38174) Bool)

(assert (=> start!57264 (array_inv!14113 a!2986)))

(declare-fun b!633875 () Bool)

(declare-fun Unit!21365 () Unit!21362)

(assert (=> b!633875 (= e!362444 Unit!21365)))

(assert (=> b!633875 false))

(declare-fun b!633876 () Bool)

(declare-fun res!409985 () Bool)

(assert (=> b!633876 (=> (not res!409985) (not e!362450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38174 (_ BitVec 32)) Bool)

(assert (=> b!633876 (= res!409985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633877 () Bool)

(declare-fun res!409981 () Bool)

(assert (=> b!633877 (=> (not res!409981) (not e!362450))))

(assert (=> b!633877 (= res!409981 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18317 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633878 () Bool)

(assert (=> b!633878 (= e!362445 e!362451)))

(declare-fun res!409971 () Bool)

(assert (=> b!633878 (=> (not res!409971) (not e!362451))))

(declare-fun lt!293006 () SeekEntryResult!6757)

(assert (=> b!633878 (= res!409971 (and (= lt!293006 (Found!6757 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18317 a!2986) index!984) (select (arr!18317 a!2986) j!136))) (not (= (select (arr!18317 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!633878 (= lt!293006 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18317 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633879 () Bool)

(assert (=> b!633879 (= e!362448 (arrayContainsKey!0 lt!293009 (select (arr!18317 a!2986) j!136) index!984))))

(declare-fun b!633880 () Bool)

(assert (=> b!633880 (= e!362441 (= lt!293006 lt!293005))))

(declare-fun b!633881 () Bool)

(declare-fun res!409982 () Bool)

(assert (=> b!633881 (=> (not res!409982) (not e!362446))))

(assert (=> b!633881 (= res!409982 (validKeyInArray!0 (select (arr!18317 a!2986) j!136)))))

(assert (= (and start!57264 res!409977) b!633872))

(assert (= (and b!633872 res!409972) b!633881))

(assert (= (and b!633881 res!409982) b!633865))

(assert (= (and b!633865 res!409975) b!633864))

(assert (= (and b!633864 res!409983) b!633868))

(assert (= (and b!633868 res!409973) b!633876))

(assert (= (and b!633876 res!409985) b!633871))

(assert (= (and b!633871 res!409974) b!633877))

(assert (= (and b!633877 res!409981) b!633874))

(assert (= (and b!633874 res!409979) b!633878))

(assert (= (and b!633878 res!409971) b!633867))

(assert (= (and b!633867 res!409978) b!633880))

(assert (= (and b!633867 c!72314) b!633875))

(assert (= (and b!633867 (not c!72314)) b!633869))

(assert (= (and b!633867 (not res!409984)) b!633866))

(assert (= (and b!633866 res!409980) b!633873))

(assert (= (and b!633873 (not res!409976)) b!633870))

(assert (= (and b!633870 res!409970) b!633879))

(declare-fun m!608455 () Bool)

(assert (=> b!633866 m!608455))

(declare-fun m!608457 () Bool)

(assert (=> b!633866 m!608457))

(declare-fun m!608459 () Bool)

(assert (=> b!633866 m!608459))

(declare-fun m!608461 () Bool)

(assert (=> b!633868 m!608461))

(declare-fun m!608463 () Bool)

(assert (=> start!57264 m!608463))

(declare-fun m!608465 () Bool)

(assert (=> start!57264 m!608465))

(declare-fun m!608467 () Bool)

(assert (=> b!633867 m!608467))

(declare-fun m!608469 () Bool)

(assert (=> b!633867 m!608469))

(declare-fun m!608471 () Bool)

(assert (=> b!633867 m!608471))

(assert (=> b!633867 m!608455))

(assert (=> b!633867 m!608457))

(declare-fun m!608473 () Bool)

(assert (=> b!633867 m!608473))

(assert (=> b!633867 m!608455))

(declare-fun m!608475 () Bool)

(assert (=> b!633867 m!608475))

(declare-fun m!608477 () Bool)

(assert (=> b!633867 m!608477))

(declare-fun m!608479 () Bool)

(assert (=> b!633876 m!608479))

(declare-fun m!608481 () Bool)

(assert (=> b!633865 m!608481))

(declare-fun m!608483 () Bool)

(assert (=> b!633871 m!608483))

(assert (=> b!633881 m!608455))

(assert (=> b!633881 m!608455))

(declare-fun m!608485 () Bool)

(assert (=> b!633881 m!608485))

(assert (=> b!633874 m!608457))

(declare-fun m!608487 () Bool)

(assert (=> b!633874 m!608487))

(declare-fun m!608489 () Bool)

(assert (=> b!633878 m!608489))

(assert (=> b!633878 m!608455))

(assert (=> b!633878 m!608455))

(declare-fun m!608491 () Bool)

(assert (=> b!633878 m!608491))

(declare-fun m!608493 () Bool)

(assert (=> b!633864 m!608493))

(declare-fun m!608495 () Bool)

(assert (=> b!633877 m!608495))

(assert (=> b!633879 m!608455))

(assert (=> b!633879 m!608455))

(declare-fun m!608497 () Bool)

(assert (=> b!633879 m!608497))

(assert (=> b!633873 m!608455))

(assert (=> b!633870 m!608455))

(assert (=> b!633870 m!608455))

(declare-fun m!608499 () Bool)

(assert (=> b!633870 m!608499))

(push 1)

