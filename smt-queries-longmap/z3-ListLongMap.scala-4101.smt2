; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56154 () Bool)

(assert start!56154)

(declare-fun b!619432 () Bool)

(declare-datatypes ((Unit!20437 0))(
  ( (Unit!20438) )
))
(declare-fun e!355256 () Unit!20437)

(declare-fun Unit!20439 () Unit!20437)

(assert (=> b!619432 (= e!355256 Unit!20439)))

(declare-fun b!619433 () Bool)

(assert (=> b!619433 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37569 0))(
  ( (array!37570 (arr!18028 (Array (_ BitVec 32) (_ BitVec 64))) (size!18392 (_ BitVec 32))) )
))
(declare-fun lt!285859 () array!37569)

(declare-fun lt!285852 () Unit!20437)

(declare-fun a!2986 () array!37569)

(declare-datatypes ((List!11976 0))(
  ( (Nil!11973) (Cons!11972 (h!13020 (_ BitVec 64)) (t!18196 List!11976)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37569 (_ BitVec 64) (_ BitVec 32) List!11976) Unit!20437)

(assert (=> b!619433 (= lt!285852 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285859 (select (arr!18028 a!2986) j!136) j!136 Nil!11973))))

(declare-fun arrayNoDuplicates!0 (array!37569 (_ BitVec 32) List!11976) Bool)

(assert (=> b!619433 (arrayNoDuplicates!0 lt!285859 j!136 Nil!11973)))

(declare-fun lt!285842 () Unit!20437)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37569 (_ BitVec 32) (_ BitVec 32)) Unit!20437)

(assert (=> b!619433 (= lt!285842 (lemmaNoDuplicateFromThenFromBigger!0 lt!285859 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619433 (arrayNoDuplicates!0 lt!285859 #b00000000000000000000000000000000 Nil!11973)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!285848 () Unit!20437)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11976) Unit!20437)

(assert (=> b!619433 (= lt!285848 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11973))))

(declare-fun arrayContainsKey!0 (array!37569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619433 (arrayContainsKey!0 lt!285859 (select (arr!18028 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285846 () Unit!20437)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20437)

(assert (=> b!619433 (= lt!285846 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285859 (select (arr!18028 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355259 () Unit!20437)

(declare-fun Unit!20440 () Unit!20437)

(assert (=> b!619433 (= e!355259 Unit!20440)))

(declare-fun b!619434 () Bool)

(declare-fun res!399085 () Bool)

(declare-fun e!355257 () Bool)

(assert (=> b!619434 (=> (not res!399085) (not e!355257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619434 (= res!399085 (validKeyInArray!0 k0!1786))))

(declare-fun b!619435 () Bool)

(declare-fun e!355261 () Bool)

(assert (=> b!619435 (= e!355257 e!355261)))

(declare-fun res!399087 () Bool)

(assert (=> b!619435 (=> (not res!399087) (not e!355261))))

(declare-datatypes ((SeekEntryResult!6424 0))(
  ( (MissingZero!6424 (index!27980 (_ BitVec 32))) (Found!6424 (index!27981 (_ BitVec 32))) (Intermediate!6424 (undefined!7236 Bool) (index!27982 (_ BitVec 32)) (x!56915 (_ BitVec 32))) (Undefined!6424) (MissingVacant!6424 (index!27983 (_ BitVec 32))) )
))
(declare-fun lt!285857 () SeekEntryResult!6424)

(assert (=> b!619435 (= res!399087 (or (= lt!285857 (MissingZero!6424 i!1108)) (= lt!285857 (MissingVacant!6424 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37569 (_ BitVec 32)) SeekEntryResult!6424)

(assert (=> b!619435 (= lt!285857 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619436 () Bool)

(declare-fun e!355260 () Bool)

(declare-fun e!355265 () Bool)

(assert (=> b!619436 (= e!355260 (not e!355265))))

(declare-fun res!399090 () Bool)

(assert (=> b!619436 (=> res!399090 e!355265)))

(declare-fun lt!285849 () SeekEntryResult!6424)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619436 (= res!399090 (not (= lt!285849 (MissingVacant!6424 vacantSpotIndex!68))))))

(declare-fun lt!285850 () Unit!20437)

(declare-fun e!355255 () Unit!20437)

(assert (=> b!619436 (= lt!285850 e!355255)))

(declare-fun c!70545 () Bool)

(assert (=> b!619436 (= c!70545 (= lt!285849 (Found!6424 index!984)))))

(declare-fun lt!285853 () Unit!20437)

(declare-fun e!355263 () Unit!20437)

(assert (=> b!619436 (= lt!285853 e!355263)))

(declare-fun c!70547 () Bool)

(assert (=> b!619436 (= c!70547 (= lt!285849 Undefined!6424))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!285843 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37569 (_ BitVec 32)) SeekEntryResult!6424)

(assert (=> b!619436 (= lt!285849 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285843 lt!285859 mask!3053))))

(declare-fun e!355254 () Bool)

(assert (=> b!619436 e!355254))

(declare-fun res!399088 () Bool)

(assert (=> b!619436 (=> (not res!399088) (not e!355254))))

(declare-fun lt!285840 () (_ BitVec 32))

(declare-fun lt!285844 () SeekEntryResult!6424)

(assert (=> b!619436 (= res!399088 (= lt!285844 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285840 vacantSpotIndex!68 lt!285843 lt!285859 mask!3053)))))

(assert (=> b!619436 (= lt!285844 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285840 vacantSpotIndex!68 (select (arr!18028 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619436 (= lt!285843 (select (store (arr!18028 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285856 () Unit!20437)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20437)

(assert (=> b!619436 (= lt!285856 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285840 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619436 (= lt!285840 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!619437 () Bool)

(assert (=> b!619437 false))

(declare-fun lt!285851 () Unit!20437)

(assert (=> b!619437 (= lt!285851 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285859 (select (arr!18028 a!2986) j!136) index!984 Nil!11973))))

(assert (=> b!619437 (arrayNoDuplicates!0 lt!285859 index!984 Nil!11973)))

(declare-fun lt!285841 () Unit!20437)

(assert (=> b!619437 (= lt!285841 (lemmaNoDuplicateFromThenFromBigger!0 lt!285859 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619437 (arrayNoDuplicates!0 lt!285859 #b00000000000000000000000000000000 Nil!11973)))

(declare-fun lt!285854 () Unit!20437)

(assert (=> b!619437 (= lt!285854 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11973))))

(assert (=> b!619437 (arrayContainsKey!0 lt!285859 (select (arr!18028 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285855 () Unit!20437)

(assert (=> b!619437 (= lt!285855 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285859 (select (arr!18028 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355252 () Bool)

(assert (=> b!619437 e!355252))

(declare-fun res!399091 () Bool)

(assert (=> b!619437 (=> (not res!399091) (not e!355252))))

(assert (=> b!619437 (= res!399091 (arrayContainsKey!0 lt!285859 (select (arr!18028 a!2986) j!136) j!136))))

(declare-fun Unit!20441 () Unit!20437)

(assert (=> b!619437 (= e!355256 Unit!20441)))

(declare-fun b!619438 () Bool)

(declare-fun Unit!20442 () Unit!20437)

(assert (=> b!619438 (= e!355255 Unit!20442)))

(declare-fun res!399094 () Bool)

(assert (=> b!619438 (= res!399094 (= (select (store (arr!18028 a!2986) i!1108 k0!1786) index!984) (select (arr!18028 a!2986) j!136)))))

(declare-fun e!355253 () Bool)

(assert (=> b!619438 (=> (not res!399094) (not e!355253))))

(assert (=> b!619438 e!355253))

(declare-fun c!70544 () Bool)

(assert (=> b!619438 (= c!70544 (bvslt j!136 index!984))))

(declare-fun lt!285858 () Unit!20437)

(assert (=> b!619438 (= lt!285858 e!355259)))

(declare-fun c!70546 () Bool)

(assert (=> b!619438 (= c!70546 (bvslt index!984 j!136))))

(declare-fun lt!285845 () Unit!20437)

(assert (=> b!619438 (= lt!285845 e!355256)))

(assert (=> b!619438 false))

(declare-fun b!619440 () Bool)

(declare-fun res!399089 () Bool)

(assert (=> b!619440 (=> (not res!399089) (not e!355261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37569 (_ BitVec 32)) Bool)

(assert (=> b!619440 (= res!399089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619441 () Bool)

(declare-fun res!399082 () Bool)

(assert (=> b!619441 (=> (not res!399082) (not e!355261))))

(assert (=> b!619441 (= res!399082 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11973))))

(declare-fun b!619442 () Bool)

(declare-fun Unit!20443 () Unit!20437)

(assert (=> b!619442 (= e!355263 Unit!20443)))

(assert (=> b!619442 false))

(declare-fun b!619443 () Bool)

(assert (=> b!619443 (= e!355252 (arrayContainsKey!0 lt!285859 (select (arr!18028 a!2986) j!136) index!984))))

(declare-fun b!619444 () Bool)

(declare-fun Unit!20444 () Unit!20437)

(assert (=> b!619444 (= e!355263 Unit!20444)))

(declare-fun b!619445 () Bool)

(declare-fun res!399096 () Bool)

(assert (=> b!619445 (=> (not res!399096) (not e!355257))))

(assert (=> b!619445 (= res!399096 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619446 () Bool)

(declare-fun Unit!20445 () Unit!20437)

(assert (=> b!619446 (= e!355255 Unit!20445)))

(declare-fun b!619447 () Bool)

(declare-fun res!399084 () Bool)

(assert (=> b!619447 (= res!399084 (bvsge j!136 index!984))))

(declare-fun e!355262 () Bool)

(assert (=> b!619447 (=> res!399084 e!355262)))

(assert (=> b!619447 (= e!355253 e!355262)))

(declare-fun b!619448 () Bool)

(declare-fun e!355258 () Bool)

(assert (=> b!619448 (= e!355261 e!355258)))

(declare-fun res!399083 () Bool)

(assert (=> b!619448 (=> (not res!399083) (not e!355258))))

(assert (=> b!619448 (= res!399083 (= (select (store (arr!18028 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619448 (= lt!285859 (array!37570 (store (arr!18028 a!2986) i!1108 k0!1786) (size!18392 a!2986)))))

(declare-fun b!619439 () Bool)

(assert (=> b!619439 (= e!355258 e!355260)))

(declare-fun res!399081 () Bool)

(assert (=> b!619439 (=> (not res!399081) (not e!355260))))

(declare-fun lt!285847 () SeekEntryResult!6424)

(assert (=> b!619439 (= res!399081 (and (= lt!285847 (Found!6424 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18028 a!2986) index!984) (select (arr!18028 a!2986) j!136))) (not (= (select (arr!18028 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619439 (= lt!285847 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18028 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!399097 () Bool)

(assert (=> start!56154 (=> (not res!399097) (not e!355257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56154 (= res!399097 (validMask!0 mask!3053))))

(assert (=> start!56154 e!355257))

(assert (=> start!56154 true))

(declare-fun array_inv!13887 (array!37569) Bool)

(assert (=> start!56154 (array_inv!13887 a!2986)))

(declare-fun e!355264 () Bool)

(declare-fun b!619449 () Bool)

(assert (=> b!619449 (= e!355264 (arrayContainsKey!0 lt!285859 (select (arr!18028 a!2986) j!136) index!984))))

(declare-fun b!619450 () Bool)

(assert (=> b!619450 (= e!355265 true)))

(assert (=> b!619450 (= (select (store (arr!18028 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619451 () Bool)

(assert (=> b!619451 (= e!355254 (= lt!285847 lt!285844))))

(declare-fun b!619452 () Bool)

(declare-fun res!399086 () Bool)

(assert (=> b!619452 (= res!399086 (arrayContainsKey!0 lt!285859 (select (arr!18028 a!2986) j!136) j!136))))

(assert (=> b!619452 (=> (not res!399086) (not e!355264))))

(assert (=> b!619452 (= e!355262 e!355264)))

(declare-fun b!619453 () Bool)

(declare-fun res!399092 () Bool)

(assert (=> b!619453 (=> (not res!399092) (not e!355261))))

(assert (=> b!619453 (= res!399092 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18028 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619454 () Bool)

(declare-fun res!399093 () Bool)

(assert (=> b!619454 (=> (not res!399093) (not e!355257))))

(assert (=> b!619454 (= res!399093 (and (= (size!18392 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18392 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18392 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619455 () Bool)

(declare-fun res!399095 () Bool)

(assert (=> b!619455 (=> (not res!399095) (not e!355257))))

(assert (=> b!619455 (= res!399095 (validKeyInArray!0 (select (arr!18028 a!2986) j!136)))))

(declare-fun b!619456 () Bool)

(declare-fun Unit!20446 () Unit!20437)

(assert (=> b!619456 (= e!355259 Unit!20446)))

(assert (= (and start!56154 res!399097) b!619454))

(assert (= (and b!619454 res!399093) b!619455))

(assert (= (and b!619455 res!399095) b!619434))

(assert (= (and b!619434 res!399085) b!619445))

(assert (= (and b!619445 res!399096) b!619435))

(assert (= (and b!619435 res!399087) b!619440))

(assert (= (and b!619440 res!399089) b!619441))

(assert (= (and b!619441 res!399082) b!619453))

(assert (= (and b!619453 res!399092) b!619448))

(assert (= (and b!619448 res!399083) b!619439))

(assert (= (and b!619439 res!399081) b!619436))

(assert (= (and b!619436 res!399088) b!619451))

(assert (= (and b!619436 c!70547) b!619442))

(assert (= (and b!619436 (not c!70547)) b!619444))

(assert (= (and b!619436 c!70545) b!619438))

(assert (= (and b!619436 (not c!70545)) b!619446))

(assert (= (and b!619438 res!399094) b!619447))

(assert (= (and b!619447 (not res!399084)) b!619452))

(assert (= (and b!619452 res!399086) b!619449))

(assert (= (and b!619438 c!70544) b!619433))

(assert (= (and b!619438 (not c!70544)) b!619456))

(assert (= (and b!619438 c!70546) b!619437))

(assert (= (and b!619438 (not c!70546)) b!619432))

(assert (= (and b!619437 res!399091) b!619443))

(assert (= (and b!619436 (not res!399090)) b!619450))

(declare-fun m!595697 () Bool)

(assert (=> b!619433 m!595697))

(declare-fun m!595699 () Bool)

(assert (=> b!619433 m!595699))

(assert (=> b!619433 m!595697))

(declare-fun m!595701 () Bool)

(assert (=> b!619433 m!595701))

(declare-fun m!595703 () Bool)

(assert (=> b!619433 m!595703))

(assert (=> b!619433 m!595697))

(declare-fun m!595705 () Bool)

(assert (=> b!619433 m!595705))

(declare-fun m!595707 () Bool)

(assert (=> b!619433 m!595707))

(assert (=> b!619433 m!595697))

(declare-fun m!595709 () Bool)

(assert (=> b!619433 m!595709))

(declare-fun m!595711 () Bool)

(assert (=> b!619433 m!595711))

(declare-fun m!595713 () Bool)

(assert (=> b!619438 m!595713))

(declare-fun m!595715 () Bool)

(assert (=> b!619438 m!595715))

(assert (=> b!619438 m!595697))

(declare-fun m!595717 () Bool)

(assert (=> b!619445 m!595717))

(declare-fun m!595719 () Bool)

(assert (=> b!619434 m!595719))

(declare-fun m!595721 () Bool)

(assert (=> b!619437 m!595721))

(declare-fun m!595723 () Bool)

(assert (=> b!619437 m!595723))

(assert (=> b!619437 m!595697))

(declare-fun m!595725 () Bool)

(assert (=> b!619437 m!595725))

(assert (=> b!619437 m!595697))

(declare-fun m!595727 () Bool)

(assert (=> b!619437 m!595727))

(assert (=> b!619437 m!595703))

(assert (=> b!619437 m!595697))

(declare-fun m!595729 () Bool)

(assert (=> b!619437 m!595729))

(assert (=> b!619437 m!595711))

(assert (=> b!619437 m!595697))

(assert (=> b!619437 m!595697))

(declare-fun m!595731 () Bool)

(assert (=> b!619437 m!595731))

(declare-fun m!595733 () Bool)

(assert (=> start!56154 m!595733))

(declare-fun m!595735 () Bool)

(assert (=> start!56154 m!595735))

(declare-fun m!595737 () Bool)

(assert (=> b!619440 m!595737))

(assert (=> b!619455 m!595697))

(assert (=> b!619455 m!595697))

(declare-fun m!595739 () Bool)

(assert (=> b!619455 m!595739))

(assert (=> b!619443 m!595697))

(assert (=> b!619443 m!595697))

(declare-fun m!595741 () Bool)

(assert (=> b!619443 m!595741))

(assert (=> b!619452 m!595697))

(assert (=> b!619452 m!595697))

(assert (=> b!619452 m!595727))

(declare-fun m!595743 () Bool)

(assert (=> b!619435 m!595743))

(assert (=> b!619449 m!595697))

(assert (=> b!619449 m!595697))

(assert (=> b!619449 m!595741))

(declare-fun m!595745 () Bool)

(assert (=> b!619441 m!595745))

(assert (=> b!619450 m!595713))

(assert (=> b!619450 m!595715))

(assert (=> b!619448 m!595713))

(declare-fun m!595747 () Bool)

(assert (=> b!619448 m!595747))

(declare-fun m!595749 () Bool)

(assert (=> b!619453 m!595749))

(declare-fun m!595751 () Bool)

(assert (=> b!619439 m!595751))

(assert (=> b!619439 m!595697))

(assert (=> b!619439 m!595697))

(declare-fun m!595753 () Bool)

(assert (=> b!619439 m!595753))

(declare-fun m!595755 () Bool)

(assert (=> b!619436 m!595755))

(declare-fun m!595757 () Bool)

(assert (=> b!619436 m!595757))

(assert (=> b!619436 m!595697))

(assert (=> b!619436 m!595697))

(declare-fun m!595759 () Bool)

(assert (=> b!619436 m!595759))

(declare-fun m!595761 () Bool)

(assert (=> b!619436 m!595761))

(declare-fun m!595763 () Bool)

(assert (=> b!619436 m!595763))

(declare-fun m!595765 () Bool)

(assert (=> b!619436 m!595765))

(assert (=> b!619436 m!595713))

(check-sat (not b!619455) (not b!619433) (not b!619445) (not b!619435) (not b!619437) (not b!619449) (not b!619440) (not b!619434) (not b!619441) (not b!619443) (not b!619452) (not b!619439) (not b!619436) (not start!56154))
(check-sat)
