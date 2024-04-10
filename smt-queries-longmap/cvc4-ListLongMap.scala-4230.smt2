; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58320 () Bool)

(assert start!58320)

(declare-fun b!643798 () Bool)

(declare-datatypes ((Unit!21798 0))(
  ( (Unit!21799) )
))
(declare-fun e!368812 () Unit!21798)

(declare-fun Unit!21800 () Unit!21798)

(assert (=> b!643798 (= e!368812 Unit!21800)))

(declare-fun b!643799 () Bool)

(declare-fun e!368810 () Unit!21798)

(declare-fun Unit!21801 () Unit!21798)

(assert (=> b!643799 (= e!368810 Unit!21801)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38417 0))(
  ( (array!38418 (arr!18422 (Array (_ BitVec 32) (_ BitVec 64))) (size!18786 (_ BitVec 32))) )
))
(declare-fun lt!298287 () array!38417)

(declare-fun lt!298291 () Unit!21798)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38417 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21798)

(assert (=> b!643799 (= lt!298291 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298287 (select (arr!18422 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643799 (arrayContainsKey!0 lt!298287 (select (arr!18422 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!298285 () Unit!21798)

(declare-datatypes ((List!12463 0))(
  ( (Nil!12460) (Cons!12459 (h!13504 (_ BitVec 64)) (t!18691 List!12463)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38417 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12463) Unit!21798)

(assert (=> b!643799 (= lt!298285 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12460))))

(declare-fun arrayNoDuplicates!0 (array!38417 (_ BitVec 32) List!12463) Bool)

(assert (=> b!643799 (arrayNoDuplicates!0 lt!298287 #b00000000000000000000000000000000 Nil!12460)))

(declare-fun lt!298292 () Unit!21798)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38417 (_ BitVec 32) (_ BitVec 32)) Unit!21798)

(assert (=> b!643799 (= lt!298292 (lemmaNoDuplicateFromThenFromBigger!0 lt!298287 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643799 (arrayNoDuplicates!0 lt!298287 j!136 Nil!12460)))

(declare-fun lt!298284 () Unit!21798)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38417 (_ BitVec 64) (_ BitVec 32) List!12463) Unit!21798)

(assert (=> b!643799 (= lt!298284 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298287 (select (arr!18422 a!2986) j!136) j!136 Nil!12460))))

(assert (=> b!643799 false))

(declare-fun b!643800 () Bool)

(declare-fun res!416996 () Bool)

(declare-fun e!368819 () Bool)

(assert (=> b!643800 (=> (not res!416996) (not e!368819))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!643800 (= res!416996 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18422 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643801 () Bool)

(declare-fun res!416978 () Bool)

(assert (=> b!643801 (=> (not res!416978) (not e!368819))))

(assert (=> b!643801 (= res!416978 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12460))))

(declare-fun b!643802 () Bool)

(declare-fun res!416980 () Bool)

(assert (=> b!643802 (=> (not res!416980) (not e!368819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38417 (_ BitVec 32)) Bool)

(assert (=> b!643802 (= res!416980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643803 () Bool)

(declare-fun e!368820 () Bool)

(assert (=> b!643803 (= e!368820 (arrayContainsKey!0 lt!298287 (select (arr!18422 a!2986) j!136) index!984))))

(declare-fun b!643804 () Bool)

(declare-fun e!368814 () Bool)

(declare-fun e!368809 () Bool)

(assert (=> b!643804 (= e!368814 e!368809)))

(declare-fun res!416991 () Bool)

(assert (=> b!643804 (=> (not res!416991) (not e!368809))))

(assert (=> b!643804 (= res!416991 (arrayContainsKey!0 lt!298287 (select (arr!18422 a!2986) j!136) j!136))))

(declare-fun res!416990 () Bool)

(declare-fun e!368813 () Bool)

(assert (=> start!58320 (=> (not res!416990) (not e!368813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58320 (= res!416990 (validMask!0 mask!3053))))

(assert (=> start!58320 e!368813))

(assert (=> start!58320 true))

(declare-fun array_inv!14218 (array!38417) Bool)

(assert (=> start!58320 (array_inv!14218 a!2986)))

(declare-fun b!643805 () Bool)

(declare-fun e!368818 () Bool)

(declare-fun e!368817 () Bool)

(assert (=> b!643805 (= e!368818 e!368817)))

(declare-fun res!416992 () Bool)

(assert (=> b!643805 (=> res!416992 e!368817)))

(assert (=> b!643805 (= res!416992 (bvsge index!984 j!136))))

(declare-fun lt!298289 () Unit!21798)

(assert (=> b!643805 (= lt!298289 e!368810)))

(declare-fun c!73777 () Bool)

(assert (=> b!643805 (= c!73777 (bvslt j!136 index!984))))

(declare-fun b!643806 () Bool)

(declare-fun e!368816 () Bool)

(assert (=> b!643806 (= e!368816 e!368818)))

(declare-fun res!416995 () Bool)

(assert (=> b!643806 (=> res!416995 e!368818)))

(declare-fun lt!298283 () (_ BitVec 64))

(declare-fun lt!298286 () (_ BitVec 64))

(assert (=> b!643806 (= res!416995 (or (not (= (select (arr!18422 a!2986) j!136) lt!298283)) (not (= (select (arr!18422 a!2986) j!136) lt!298286))))))

(declare-fun e!368811 () Bool)

(assert (=> b!643806 e!368811))

(declare-fun res!416984 () Bool)

(assert (=> b!643806 (=> (not res!416984) (not e!368811))))

(assert (=> b!643806 (= res!416984 (= lt!298286 (select (arr!18422 a!2986) j!136)))))

(assert (=> b!643806 (= lt!298286 (select (store (arr!18422 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!643807 () Bool)

(declare-fun e!368806 () Bool)

(declare-fun e!368808 () Bool)

(assert (=> b!643807 (= e!368806 e!368808)))

(declare-fun res!416985 () Bool)

(assert (=> b!643807 (=> (not res!416985) (not e!368808))))

(declare-datatypes ((SeekEntryResult!6862 0))(
  ( (MissingZero!6862 (index!29780 (_ BitVec 32))) (Found!6862 (index!29781 (_ BitVec 32))) (Intermediate!6862 (undefined!7674 Bool) (index!29782 (_ BitVec 32)) (x!58550 (_ BitVec 32))) (Undefined!6862) (MissingVacant!6862 (index!29783 (_ BitVec 32))) )
))
(declare-fun lt!298296 () SeekEntryResult!6862)

(assert (=> b!643807 (= res!416985 (and (= lt!298296 (Found!6862 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18422 a!2986) index!984) (select (arr!18422 a!2986) j!136))) (not (= (select (arr!18422 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38417 (_ BitVec 32)) SeekEntryResult!6862)

(assert (=> b!643807 (= lt!298296 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18422 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643808 () Bool)

(assert (=> b!643808 (= e!368817 true)))

(assert (=> b!643808 e!368820))

(declare-fun res!416982 () Bool)

(assert (=> b!643808 (=> (not res!416982) (not e!368820))))

(assert (=> b!643808 (= res!416982 (arrayContainsKey!0 lt!298287 (select (arr!18422 a!2986) j!136) j!136))))

(declare-fun b!643809 () Bool)

(assert (=> b!643809 (= e!368809 (arrayContainsKey!0 lt!298287 (select (arr!18422 a!2986) j!136) index!984))))

(declare-fun b!643810 () Bool)

(declare-fun res!416993 () Bool)

(assert (=> b!643810 (=> (not res!416993) (not e!368813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643810 (= res!416993 (validKeyInArray!0 (select (arr!18422 a!2986) j!136)))))

(declare-fun b!643811 () Bool)

(assert (=> b!643811 (= e!368811 e!368814)))

(declare-fun res!416994 () Bool)

(assert (=> b!643811 (=> res!416994 e!368814)))

(assert (=> b!643811 (= res!416994 (or (not (= (select (arr!18422 a!2986) j!136) lt!298283)) (not (= (select (arr!18422 a!2986) j!136) lt!298286)) (bvsge j!136 index!984)))))

(declare-fun b!643812 () Bool)

(declare-fun res!416983 () Bool)

(assert (=> b!643812 (=> (not res!416983) (not e!368813))))

(assert (=> b!643812 (= res!416983 (and (= (size!18786 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18786 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18786 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643813 () Bool)

(declare-fun res!416979 () Bool)

(assert (=> b!643813 (=> (not res!416979) (not e!368813))))

(assert (=> b!643813 (= res!416979 (validKeyInArray!0 k!1786))))

(declare-fun b!643814 () Bool)

(assert (=> b!643814 (= e!368808 (not e!368816))))

(declare-fun res!416987 () Bool)

(assert (=> b!643814 (=> res!416987 e!368816)))

(declare-fun lt!298294 () SeekEntryResult!6862)

(assert (=> b!643814 (= res!416987 (not (= lt!298294 (Found!6862 index!984))))))

(declare-fun lt!298293 () Unit!21798)

(assert (=> b!643814 (= lt!298293 e!368812)))

(declare-fun c!73778 () Bool)

(assert (=> b!643814 (= c!73778 (= lt!298294 Undefined!6862))))

(assert (=> b!643814 (= lt!298294 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298283 lt!298287 mask!3053))))

(declare-fun e!368807 () Bool)

(assert (=> b!643814 e!368807))

(declare-fun res!416981 () Bool)

(assert (=> b!643814 (=> (not res!416981) (not e!368807))))

(declare-fun lt!298295 () (_ BitVec 32))

(declare-fun lt!298290 () SeekEntryResult!6862)

(assert (=> b!643814 (= res!416981 (= lt!298290 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298295 vacantSpotIndex!68 lt!298283 lt!298287 mask!3053)))))

(assert (=> b!643814 (= lt!298290 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298295 vacantSpotIndex!68 (select (arr!18422 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643814 (= lt!298283 (select (store (arr!18422 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298288 () Unit!21798)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21798)

(assert (=> b!643814 (= lt!298288 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298295 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643814 (= lt!298295 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!643815 () Bool)

(assert (=> b!643815 (= e!368807 (= lt!298296 lt!298290))))

(declare-fun b!643816 () Bool)

(declare-fun Unit!21802 () Unit!21798)

(assert (=> b!643816 (= e!368810 Unit!21802)))

(declare-fun b!643817 () Bool)

(assert (=> b!643817 (= e!368819 e!368806)))

(declare-fun res!416989 () Bool)

(assert (=> b!643817 (=> (not res!416989) (not e!368806))))

(assert (=> b!643817 (= res!416989 (= (select (store (arr!18422 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643817 (= lt!298287 (array!38418 (store (arr!18422 a!2986) i!1108 k!1786) (size!18786 a!2986)))))

(declare-fun b!643818 () Bool)

(declare-fun res!416986 () Bool)

(assert (=> b!643818 (=> (not res!416986) (not e!368813))))

(assert (=> b!643818 (= res!416986 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!643819 () Bool)

(declare-fun Unit!21803 () Unit!21798)

(assert (=> b!643819 (= e!368812 Unit!21803)))

(assert (=> b!643819 false))

(declare-fun b!643820 () Bool)

(assert (=> b!643820 (= e!368813 e!368819)))

(declare-fun res!416988 () Bool)

(assert (=> b!643820 (=> (not res!416988) (not e!368819))))

(declare-fun lt!298297 () SeekEntryResult!6862)

(assert (=> b!643820 (= res!416988 (or (= lt!298297 (MissingZero!6862 i!1108)) (= lt!298297 (MissingVacant!6862 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38417 (_ BitVec 32)) SeekEntryResult!6862)

(assert (=> b!643820 (= lt!298297 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!58320 res!416990) b!643812))

(assert (= (and b!643812 res!416983) b!643810))

(assert (= (and b!643810 res!416993) b!643813))

(assert (= (and b!643813 res!416979) b!643818))

(assert (= (and b!643818 res!416986) b!643820))

(assert (= (and b!643820 res!416988) b!643802))

(assert (= (and b!643802 res!416980) b!643801))

(assert (= (and b!643801 res!416978) b!643800))

(assert (= (and b!643800 res!416996) b!643817))

(assert (= (and b!643817 res!416989) b!643807))

(assert (= (and b!643807 res!416985) b!643814))

(assert (= (and b!643814 res!416981) b!643815))

(assert (= (and b!643814 c!73778) b!643819))

(assert (= (and b!643814 (not c!73778)) b!643798))

(assert (= (and b!643814 (not res!416987)) b!643806))

(assert (= (and b!643806 res!416984) b!643811))

(assert (= (and b!643811 (not res!416994)) b!643804))

(assert (= (and b!643804 res!416991) b!643809))

(assert (= (and b!643806 (not res!416995)) b!643805))

(assert (= (and b!643805 c!73777) b!643799))

(assert (= (and b!643805 (not c!73777)) b!643816))

(assert (= (and b!643805 (not res!416992)) b!643808))

(assert (= (and b!643808 res!416982) b!643803))

(declare-fun m!617489 () Bool)

(assert (=> b!643804 m!617489))

(assert (=> b!643804 m!617489))

(declare-fun m!617491 () Bool)

(assert (=> b!643804 m!617491))

(declare-fun m!617493 () Bool)

(assert (=> b!643801 m!617493))

(declare-fun m!617495 () Bool)

(assert (=> b!643802 m!617495))

(declare-fun m!617497 () Bool)

(assert (=> b!643813 m!617497))

(assert (=> b!643809 m!617489))

(assert (=> b!643809 m!617489))

(declare-fun m!617499 () Bool)

(assert (=> b!643809 m!617499))

(declare-fun m!617501 () Bool)

(assert (=> b!643820 m!617501))

(declare-fun m!617503 () Bool)

(assert (=> b!643817 m!617503))

(declare-fun m!617505 () Bool)

(assert (=> b!643817 m!617505))

(assert (=> b!643806 m!617489))

(assert (=> b!643806 m!617503))

(declare-fun m!617507 () Bool)

(assert (=> b!643806 m!617507))

(declare-fun m!617509 () Bool)

(assert (=> b!643800 m!617509))

(declare-fun m!617511 () Bool)

(assert (=> b!643818 m!617511))

(declare-fun m!617513 () Bool)

(assert (=> start!58320 m!617513))

(declare-fun m!617515 () Bool)

(assert (=> start!58320 m!617515))

(declare-fun m!617517 () Bool)

(assert (=> b!643799 m!617517))

(assert (=> b!643799 m!617489))

(declare-fun m!617519 () Bool)

(assert (=> b!643799 m!617519))

(assert (=> b!643799 m!617489))

(declare-fun m!617521 () Bool)

(assert (=> b!643799 m!617521))

(declare-fun m!617523 () Bool)

(assert (=> b!643799 m!617523))

(assert (=> b!643799 m!617489))

(declare-fun m!617525 () Bool)

(assert (=> b!643799 m!617525))

(assert (=> b!643799 m!617489))

(declare-fun m!617527 () Bool)

(assert (=> b!643799 m!617527))

(declare-fun m!617529 () Bool)

(assert (=> b!643799 m!617529))

(declare-fun m!617531 () Bool)

(assert (=> b!643807 m!617531))

(assert (=> b!643807 m!617489))

(assert (=> b!643807 m!617489))

(declare-fun m!617533 () Bool)

(assert (=> b!643807 m!617533))

(assert (=> b!643808 m!617489))

(assert (=> b!643808 m!617489))

(assert (=> b!643808 m!617491))

(declare-fun m!617535 () Bool)

(assert (=> b!643814 m!617535))

(declare-fun m!617537 () Bool)

(assert (=> b!643814 m!617537))

(assert (=> b!643814 m!617489))

(assert (=> b!643814 m!617503))

(declare-fun m!617539 () Bool)

(assert (=> b!643814 m!617539))

(declare-fun m!617541 () Bool)

(assert (=> b!643814 m!617541))

(assert (=> b!643814 m!617489))

(declare-fun m!617543 () Bool)

(assert (=> b!643814 m!617543))

(declare-fun m!617545 () Bool)

(assert (=> b!643814 m!617545))

(assert (=> b!643811 m!617489))

(assert (=> b!643810 m!617489))

(assert (=> b!643810 m!617489))

(declare-fun m!617547 () Bool)

(assert (=> b!643810 m!617547))

(assert (=> b!643803 m!617489))

(assert (=> b!643803 m!617489))

(assert (=> b!643803 m!617499))

(push 1)

