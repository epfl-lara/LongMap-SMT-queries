; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58506 () Bool)

(assert start!58506)

(declare-fun b!645867 () Bool)

(declare-datatypes ((Unit!21909 0))(
  ( (Unit!21910) )
))
(declare-fun e!370163 () Unit!21909)

(declare-fun Unit!21911 () Unit!21909)

(assert (=> b!645867 (= e!370163 Unit!21911)))

(declare-datatypes ((array!38460 0))(
  ( (array!38461 (arr!18439 (Array (_ BitVec 32) (_ BitVec 64))) (size!18803 (_ BitVec 32))) )
))
(declare-fun lt!299543 () array!38460)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!645868 () Bool)

(declare-fun e!370169 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38460)

(declare-fun arrayContainsKey!0 (array!38460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645868 (= e!370169 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) index!984))))

(declare-fun b!645869 () Bool)

(declare-fun e!370164 () Bool)

(declare-fun e!370172 () Bool)

(assert (=> b!645869 (= e!370164 e!370172)))

(declare-fun res!418471 () Bool)

(assert (=> b!645869 (=> res!418471 e!370172)))

(assert (=> b!645869 (= res!418471 (bvsge index!984 j!136))))

(declare-fun lt!299546 () Unit!21909)

(assert (=> b!645869 (= lt!299546 e!370163)))

(declare-fun c!74072 () Bool)

(assert (=> b!645869 (= c!74072 (bvslt j!136 index!984))))

(declare-fun b!645870 () Bool)

(declare-fun e!370161 () Bool)

(declare-datatypes ((SeekEntryResult!6835 0))(
  ( (MissingZero!6835 (index!29675 (_ BitVec 32))) (Found!6835 (index!29676 (_ BitVec 32))) (Intermediate!6835 (undefined!7647 Bool) (index!29677 (_ BitVec 32)) (x!58599 (_ BitVec 32))) (Undefined!6835) (MissingVacant!6835 (index!29678 (_ BitVec 32))) )
))
(declare-fun lt!299542 () SeekEntryResult!6835)

(declare-fun lt!299547 () SeekEntryResult!6835)

(assert (=> b!645870 (= e!370161 (= lt!299542 lt!299547))))

(declare-fun b!645872 () Bool)

(declare-fun res!418463 () Bool)

(declare-fun e!370160 () Bool)

(assert (=> b!645872 (=> (not res!418463) (not e!370160))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645872 (= res!418463 (validKeyInArray!0 k0!1786))))

(declare-fun b!645873 () Bool)

(declare-fun e!370159 () Bool)

(declare-fun e!370162 () Bool)

(assert (=> b!645873 (= e!370159 e!370162)))

(declare-fun res!418475 () Bool)

(assert (=> b!645873 (=> (not res!418475) (not e!370162))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!645873 (= res!418475 (and (= lt!299542 (Found!6835 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18439 a!2986) index!984) (select (arr!18439 a!2986) j!136))) (not (= (select (arr!18439 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38460 (_ BitVec 32)) SeekEntryResult!6835)

(assert (=> b!645873 (= lt!299542 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18439 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645874 () Bool)

(declare-fun res!418476 () Bool)

(assert (=> b!645874 (=> (not res!418476) (not e!370160))))

(assert (=> b!645874 (= res!418476 (validKeyInArray!0 (select (arr!18439 a!2986) j!136)))))

(declare-fun b!645875 () Bool)

(declare-fun e!370166 () Bool)

(assert (=> b!645875 (= e!370166 e!370164)))

(declare-fun res!418467 () Bool)

(assert (=> b!645875 (=> res!418467 e!370164)))

(declare-fun lt!299545 () (_ BitVec 64))

(declare-fun lt!299541 () (_ BitVec 64))

(assert (=> b!645875 (= res!418467 (or (not (= (select (arr!18439 a!2986) j!136) lt!299541)) (not (= (select (arr!18439 a!2986) j!136) lt!299545))))))

(declare-fun e!370173 () Bool)

(assert (=> b!645875 e!370173))

(declare-fun res!418480 () Bool)

(assert (=> b!645875 (=> (not res!418480) (not e!370173))))

(assert (=> b!645875 (= res!418480 (= lt!299545 (select (arr!18439 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!645875 (= lt!299545 (select (store (arr!18439 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!645876 () Bool)

(declare-fun e!370165 () Bool)

(assert (=> b!645876 (= e!370173 e!370165)))

(declare-fun res!418478 () Bool)

(assert (=> b!645876 (=> res!418478 e!370165)))

(assert (=> b!645876 (= res!418478 (or (not (= (select (arr!18439 a!2986) j!136) lt!299541)) (not (= (select (arr!18439 a!2986) j!136) lt!299545)) (bvsge j!136 index!984)))))

(declare-fun b!645877 () Bool)

(assert (=> b!645877 (= e!370162 (not e!370166))))

(declare-fun res!418470 () Bool)

(assert (=> b!645877 (=> res!418470 e!370166)))

(declare-fun lt!299544 () SeekEntryResult!6835)

(assert (=> b!645877 (= res!418470 (not (= lt!299544 (Found!6835 index!984))))))

(declare-fun lt!299553 () Unit!21909)

(declare-fun e!370168 () Unit!21909)

(assert (=> b!645877 (= lt!299553 e!370168)))

(declare-fun c!74071 () Bool)

(assert (=> b!645877 (= c!74071 (= lt!299544 Undefined!6835))))

(assert (=> b!645877 (= lt!299544 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299541 lt!299543 mask!3053))))

(assert (=> b!645877 e!370161))

(declare-fun res!418479 () Bool)

(assert (=> b!645877 (=> (not res!418479) (not e!370161))))

(declare-fun lt!299540 () (_ BitVec 32))

(assert (=> b!645877 (= res!418479 (= lt!299547 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299540 vacantSpotIndex!68 lt!299541 lt!299543 mask!3053)))))

(assert (=> b!645877 (= lt!299547 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299540 vacantSpotIndex!68 (select (arr!18439 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645877 (= lt!299541 (select (store (arr!18439 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299548 () Unit!21909)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38460 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21909)

(assert (=> b!645877 (= lt!299548 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299540 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645877 (= lt!299540 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!645878 () Bool)

(declare-fun res!418466 () Bool)

(declare-fun e!370170 () Bool)

(assert (=> b!645878 (=> (not res!418466) (not e!370170))))

(assert (=> b!645878 (= res!418466 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18439 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645879 () Bool)

(assert (=> b!645879 (= e!370172 (bvslt (size!18803 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!645879 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299550 () Unit!21909)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21909)

(assert (=> b!645879 (= lt!299550 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299543 (select (arr!18439 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370171 () Bool)

(assert (=> b!645879 e!370171))

(declare-fun res!418468 () Bool)

(assert (=> b!645879 (=> (not res!418468) (not e!370171))))

(assert (=> b!645879 (= res!418468 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) j!136))))

(declare-fun b!645880 () Bool)

(declare-fun res!418472 () Bool)

(assert (=> b!645880 (=> (not res!418472) (not e!370160))))

(assert (=> b!645880 (= res!418472 (and (= (size!18803 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18803 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18803 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645881 () Bool)

(declare-fun Unit!21912 () Unit!21909)

(assert (=> b!645881 (= e!370168 Unit!21912)))

(declare-fun b!645882 () Bool)

(declare-fun res!418462 () Bool)

(assert (=> b!645882 (=> (not res!418462) (not e!370170))))

(declare-datatypes ((List!12387 0))(
  ( (Nil!12384) (Cons!12383 (h!13431 (_ BitVec 64)) (t!18607 List!12387)) )
))
(declare-fun arrayNoDuplicates!0 (array!38460 (_ BitVec 32) List!12387) Bool)

(assert (=> b!645882 (= res!418462 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12384))))

(declare-fun b!645871 () Bool)

(declare-fun res!418474 () Bool)

(assert (=> b!645871 (=> (not res!418474) (not e!370160))))

(assert (=> b!645871 (= res!418474 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!418469 () Bool)

(assert (=> start!58506 (=> (not res!418469) (not e!370160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58506 (= res!418469 (validMask!0 mask!3053))))

(assert (=> start!58506 e!370160))

(assert (=> start!58506 true))

(declare-fun array_inv!14298 (array!38460) Bool)

(assert (=> start!58506 (array_inv!14298 a!2986)))

(declare-fun b!645883 () Bool)

(declare-fun res!418464 () Bool)

(assert (=> b!645883 (=> (not res!418464) (not e!370170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38460 (_ BitVec 32)) Bool)

(assert (=> b!645883 (= res!418464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645884 () Bool)

(declare-fun Unit!21913 () Unit!21909)

(assert (=> b!645884 (= e!370163 Unit!21913)))

(declare-fun lt!299551 () Unit!21909)

(assert (=> b!645884 (= lt!299551 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299543 (select (arr!18439 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645884 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299554 () Unit!21909)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12387) Unit!21909)

(assert (=> b!645884 (= lt!299554 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12384))))

(assert (=> b!645884 (arrayNoDuplicates!0 lt!299543 #b00000000000000000000000000000000 Nil!12384)))

(declare-fun lt!299549 () Unit!21909)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38460 (_ BitVec 32) (_ BitVec 32)) Unit!21909)

(assert (=> b!645884 (= lt!299549 (lemmaNoDuplicateFromThenFromBigger!0 lt!299543 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645884 (arrayNoDuplicates!0 lt!299543 j!136 Nil!12384)))

(declare-fun lt!299552 () Unit!21909)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38460 (_ BitVec 64) (_ BitVec 32) List!12387) Unit!21909)

(assert (=> b!645884 (= lt!299552 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299543 (select (arr!18439 a!2986) j!136) j!136 Nil!12384))))

(assert (=> b!645884 false))

(declare-fun b!645885 () Bool)

(declare-fun Unit!21914 () Unit!21909)

(assert (=> b!645885 (= e!370168 Unit!21914)))

(assert (=> b!645885 false))

(declare-fun b!645886 () Bool)

(assert (=> b!645886 (= e!370170 e!370159)))

(declare-fun res!418473 () Bool)

(assert (=> b!645886 (=> (not res!418473) (not e!370159))))

(assert (=> b!645886 (= res!418473 (= (select (store (arr!18439 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645886 (= lt!299543 (array!38461 (store (arr!18439 a!2986) i!1108 k0!1786) (size!18803 a!2986)))))

(declare-fun b!645887 () Bool)

(assert (=> b!645887 (= e!370165 e!370169)))

(declare-fun res!418465 () Bool)

(assert (=> b!645887 (=> (not res!418465) (not e!370169))))

(assert (=> b!645887 (= res!418465 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) j!136))))

(declare-fun b!645888 () Bool)

(assert (=> b!645888 (= e!370160 e!370170)))

(declare-fun res!418477 () Bool)

(assert (=> b!645888 (=> (not res!418477) (not e!370170))))

(declare-fun lt!299539 () SeekEntryResult!6835)

(assert (=> b!645888 (= res!418477 (or (= lt!299539 (MissingZero!6835 i!1108)) (= lt!299539 (MissingVacant!6835 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38460 (_ BitVec 32)) SeekEntryResult!6835)

(assert (=> b!645888 (= lt!299539 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!645889 () Bool)

(assert (=> b!645889 (= e!370171 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) index!984))))

(assert (= (and start!58506 res!418469) b!645880))

(assert (= (and b!645880 res!418472) b!645874))

(assert (= (and b!645874 res!418476) b!645872))

(assert (= (and b!645872 res!418463) b!645871))

(assert (= (and b!645871 res!418474) b!645888))

(assert (= (and b!645888 res!418477) b!645883))

(assert (= (and b!645883 res!418464) b!645882))

(assert (= (and b!645882 res!418462) b!645878))

(assert (= (and b!645878 res!418466) b!645886))

(assert (= (and b!645886 res!418473) b!645873))

(assert (= (and b!645873 res!418475) b!645877))

(assert (= (and b!645877 res!418479) b!645870))

(assert (= (and b!645877 c!74071) b!645885))

(assert (= (and b!645877 (not c!74071)) b!645881))

(assert (= (and b!645877 (not res!418470)) b!645875))

(assert (= (and b!645875 res!418480) b!645876))

(assert (= (and b!645876 (not res!418478)) b!645887))

(assert (= (and b!645887 res!418465) b!645868))

(assert (= (and b!645875 (not res!418467)) b!645869))

(assert (= (and b!645869 c!74072) b!645884))

(assert (= (and b!645869 (not c!74072)) b!645867))

(assert (= (and b!645869 (not res!418471)) b!645879))

(assert (= (and b!645879 res!418468) b!645889))

(declare-fun m!619777 () Bool)

(assert (=> b!645874 m!619777))

(assert (=> b!645874 m!619777))

(declare-fun m!619779 () Bool)

(assert (=> b!645874 m!619779))

(assert (=> b!645889 m!619777))

(assert (=> b!645889 m!619777))

(declare-fun m!619781 () Bool)

(assert (=> b!645889 m!619781))

(declare-fun m!619783 () Bool)

(assert (=> b!645886 m!619783))

(declare-fun m!619785 () Bool)

(assert (=> b!645886 m!619785))

(declare-fun m!619787 () Bool)

(assert (=> b!645883 m!619787))

(declare-fun m!619789 () Bool)

(assert (=> b!645888 m!619789))

(assert (=> b!645876 m!619777))

(assert (=> b!645879 m!619777))

(assert (=> b!645879 m!619777))

(declare-fun m!619791 () Bool)

(assert (=> b!645879 m!619791))

(assert (=> b!645879 m!619777))

(declare-fun m!619793 () Bool)

(assert (=> b!645879 m!619793))

(assert (=> b!645879 m!619777))

(declare-fun m!619795 () Bool)

(assert (=> b!645879 m!619795))

(declare-fun m!619797 () Bool)

(assert (=> b!645872 m!619797))

(declare-fun m!619799 () Bool)

(assert (=> b!645878 m!619799))

(assert (=> b!645887 m!619777))

(assert (=> b!645887 m!619777))

(assert (=> b!645887 m!619795))

(declare-fun m!619801 () Bool)

(assert (=> b!645877 m!619801))

(declare-fun m!619803 () Bool)

(assert (=> b!645877 m!619803))

(assert (=> b!645877 m!619777))

(assert (=> b!645877 m!619783))

(declare-fun m!619805 () Bool)

(assert (=> b!645877 m!619805))

(declare-fun m!619807 () Bool)

(assert (=> b!645877 m!619807))

(declare-fun m!619809 () Bool)

(assert (=> b!645877 m!619809))

(assert (=> b!645877 m!619777))

(declare-fun m!619811 () Bool)

(assert (=> b!645877 m!619811))

(assert (=> b!645868 m!619777))

(assert (=> b!645868 m!619777))

(assert (=> b!645868 m!619781))

(declare-fun m!619813 () Bool)

(assert (=> b!645873 m!619813))

(assert (=> b!645873 m!619777))

(assert (=> b!645873 m!619777))

(declare-fun m!619815 () Bool)

(assert (=> b!645873 m!619815))

(declare-fun m!619817 () Bool)

(assert (=> start!58506 m!619817))

(declare-fun m!619819 () Bool)

(assert (=> start!58506 m!619819))

(declare-fun m!619821 () Bool)

(assert (=> b!645871 m!619821))

(declare-fun m!619823 () Bool)

(assert (=> b!645884 m!619823))

(assert (=> b!645884 m!619777))

(declare-fun m!619825 () Bool)

(assert (=> b!645884 m!619825))

(assert (=> b!645884 m!619777))

(declare-fun m!619827 () Bool)

(assert (=> b!645884 m!619827))

(declare-fun m!619829 () Bool)

(assert (=> b!645884 m!619829))

(assert (=> b!645884 m!619777))

(declare-fun m!619831 () Bool)

(assert (=> b!645884 m!619831))

(declare-fun m!619833 () Bool)

(assert (=> b!645884 m!619833))

(declare-fun m!619835 () Bool)

(assert (=> b!645884 m!619835))

(assert (=> b!645884 m!619777))

(assert (=> b!645875 m!619777))

(assert (=> b!645875 m!619783))

(declare-fun m!619837 () Bool)

(assert (=> b!645875 m!619837))

(declare-fun m!619839 () Bool)

(assert (=> b!645882 m!619839))

(check-sat (not b!645868) (not b!645882) (not b!645872) (not b!645888) (not b!645871) (not b!645883) (not b!645873) (not b!645874) (not start!58506) (not b!645889) (not b!645877) (not b!645887) (not b!645884) (not b!645879))
(check-sat)
(get-model)

(declare-fun d!91339 () Bool)

(declare-fun res!418599 () Bool)

(declare-fun e!370268 () Bool)

(assert (=> d!91339 (=> res!418599 e!370268)))

(assert (=> d!91339 (= res!418599 (= (select (arr!18439 lt!299543) j!136) (select (arr!18439 a!2986) j!136)))))

(assert (=> d!91339 (= (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) j!136) e!370268)))

(declare-fun b!646032 () Bool)

(declare-fun e!370269 () Bool)

(assert (=> b!646032 (= e!370268 e!370269)))

(declare-fun res!418600 () Bool)

(assert (=> b!646032 (=> (not res!418600) (not e!370269))))

(assert (=> b!646032 (= res!418600 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18803 lt!299543)))))

(declare-fun b!646033 () Bool)

(assert (=> b!646033 (= e!370269 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91339 (not res!418599)) b!646032))

(assert (= (and b!646032 res!418600) b!646033))

(declare-fun m!619969 () Bool)

(assert (=> d!91339 m!619969))

(assert (=> b!646033 m!619777))

(declare-fun m!619971 () Bool)

(assert (=> b!646033 m!619971))

(assert (=> b!645887 d!91339))

(declare-fun d!91341 () Bool)

(assert (=> d!91341 (= (validKeyInArray!0 (select (arr!18439 a!2986) j!136)) (and (not (= (select (arr!18439 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18439 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!645874 d!91341))

(declare-fun d!91343 () Bool)

(assert (=> d!91343 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299653 () Unit!21909)

(declare-fun choose!114 (array!38460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21909)

(assert (=> d!91343 (= lt!299653 (choose!114 lt!299543 (select (arr!18439 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91343 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91343 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299543 (select (arr!18439 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!299653)))

(declare-fun bs!19313 () Bool)

(assert (= bs!19313 d!91343))

(assert (=> bs!19313 m!619777))

(assert (=> bs!19313 m!619831))

(assert (=> bs!19313 m!619777))

(declare-fun m!619973 () Bool)

(assert (=> bs!19313 m!619973))

(assert (=> b!645884 d!91343))

(declare-fun d!91345 () Bool)

(declare-fun res!418601 () Bool)

(declare-fun e!370270 () Bool)

(assert (=> d!91345 (=> res!418601 e!370270)))

(assert (=> d!91345 (= res!418601 (= (select (arr!18439 lt!299543) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18439 a!2986) j!136)))))

(assert (=> d!91345 (= (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!370270)))

(declare-fun b!646034 () Bool)

(declare-fun e!370271 () Bool)

(assert (=> b!646034 (= e!370270 e!370271)))

(declare-fun res!418602 () Bool)

(assert (=> b!646034 (=> (not res!418602) (not e!370271))))

(assert (=> b!646034 (= res!418602 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18803 lt!299543)))))

(declare-fun b!646035 () Bool)

(assert (=> b!646035 (= e!370271 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91345 (not res!418601)) b!646034))

(assert (= (and b!646034 res!418602) b!646035))

(declare-fun m!619975 () Bool)

(assert (=> d!91345 m!619975))

(assert (=> b!646035 m!619777))

(declare-fun m!619977 () Bool)

(assert (=> b!646035 m!619977))

(assert (=> b!645884 d!91345))

(declare-fun d!91347 () Bool)

(assert (=> d!91347 (arrayNoDuplicates!0 lt!299543 j!136 Nil!12384)))

(declare-fun lt!299656 () Unit!21909)

(declare-fun choose!39 (array!38460 (_ BitVec 32) (_ BitVec 32)) Unit!21909)

(assert (=> d!91347 (= lt!299656 (choose!39 lt!299543 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91347 (bvslt (size!18803 lt!299543) #b01111111111111111111111111111111)))

(assert (=> d!91347 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!299543 #b00000000000000000000000000000000 j!136) lt!299656)))

(declare-fun bs!19314 () Bool)

(assert (= bs!19314 d!91347))

(assert (=> bs!19314 m!619829))

(declare-fun m!619979 () Bool)

(assert (=> bs!19314 m!619979))

(assert (=> b!645884 d!91347))

(declare-fun d!91349 () Bool)

(assert (=> d!91349 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18803 lt!299543)) (not (= (select (arr!18439 lt!299543) j!136) (select (arr!18439 a!2986) j!136))))))

(declare-fun lt!299659 () Unit!21909)

(declare-fun choose!21 (array!38460 (_ BitVec 64) (_ BitVec 32) List!12387) Unit!21909)

(assert (=> d!91349 (= lt!299659 (choose!21 lt!299543 (select (arr!18439 a!2986) j!136) j!136 Nil!12384))))

(assert (=> d!91349 (bvslt (size!18803 lt!299543) #b01111111111111111111111111111111)))

(assert (=> d!91349 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299543 (select (arr!18439 a!2986) j!136) j!136 Nil!12384) lt!299659)))

(declare-fun bs!19315 () Bool)

(assert (= bs!19315 d!91349))

(assert (=> bs!19315 m!619969))

(assert (=> bs!19315 m!619777))

(declare-fun m!619981 () Bool)

(assert (=> bs!19315 m!619981))

(assert (=> b!645884 d!91349))

(declare-fun d!91351 () Bool)

(declare-fun res!418610 () Bool)

(declare-fun e!370280 () Bool)

(assert (=> d!91351 (=> res!418610 e!370280)))

(assert (=> d!91351 (= res!418610 (bvsge #b00000000000000000000000000000000 (size!18803 lt!299543)))))

(assert (=> d!91351 (= (arrayNoDuplicates!0 lt!299543 #b00000000000000000000000000000000 Nil!12384) e!370280)))

(declare-fun b!646046 () Bool)

(declare-fun e!370283 () Bool)

(declare-fun contains!3126 (List!12387 (_ BitVec 64)) Bool)

(assert (=> b!646046 (= e!370283 (contains!3126 Nil!12384 (select (arr!18439 lt!299543) #b00000000000000000000000000000000)))))

(declare-fun b!646047 () Bool)

(declare-fun e!370281 () Bool)

(assert (=> b!646047 (= e!370280 e!370281)))

(declare-fun res!418609 () Bool)

(assert (=> b!646047 (=> (not res!418609) (not e!370281))))

(assert (=> b!646047 (= res!418609 (not e!370283))))

(declare-fun res!418611 () Bool)

(assert (=> b!646047 (=> (not res!418611) (not e!370283))))

(assert (=> b!646047 (= res!418611 (validKeyInArray!0 (select (arr!18439 lt!299543) #b00000000000000000000000000000000)))))

(declare-fun b!646048 () Bool)

(declare-fun e!370282 () Bool)

(declare-fun call!33642 () Bool)

(assert (=> b!646048 (= e!370282 call!33642)))

(declare-fun b!646049 () Bool)

(assert (=> b!646049 (= e!370282 call!33642)))

(declare-fun b!646050 () Bool)

(assert (=> b!646050 (= e!370281 e!370282)))

(declare-fun c!74087 () Bool)

(assert (=> b!646050 (= c!74087 (validKeyInArray!0 (select (arr!18439 lt!299543) #b00000000000000000000000000000000)))))

(declare-fun bm!33639 () Bool)

(assert (=> bm!33639 (= call!33642 (arrayNoDuplicates!0 lt!299543 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74087 (Cons!12383 (select (arr!18439 lt!299543) #b00000000000000000000000000000000) Nil!12384) Nil!12384)))))

(assert (= (and d!91351 (not res!418610)) b!646047))

(assert (= (and b!646047 res!418611) b!646046))

(assert (= (and b!646047 res!418609) b!646050))

(assert (= (and b!646050 c!74087) b!646049))

(assert (= (and b!646050 (not c!74087)) b!646048))

(assert (= (or b!646049 b!646048) bm!33639))

(declare-fun m!619983 () Bool)

(assert (=> b!646046 m!619983))

(assert (=> b!646046 m!619983))

(declare-fun m!619985 () Bool)

(assert (=> b!646046 m!619985))

(assert (=> b!646047 m!619983))

(assert (=> b!646047 m!619983))

(declare-fun m!619987 () Bool)

(assert (=> b!646047 m!619987))

(assert (=> b!646050 m!619983))

(assert (=> b!646050 m!619983))

(assert (=> b!646050 m!619987))

(assert (=> bm!33639 m!619983))

(declare-fun m!619989 () Bool)

(assert (=> bm!33639 m!619989))

(assert (=> b!645884 d!91351))

(declare-fun d!91353 () Bool)

(declare-fun res!418613 () Bool)

(declare-fun e!370284 () Bool)

(assert (=> d!91353 (=> res!418613 e!370284)))

(assert (=> d!91353 (= res!418613 (bvsge j!136 (size!18803 lt!299543)))))

(assert (=> d!91353 (= (arrayNoDuplicates!0 lt!299543 j!136 Nil!12384) e!370284)))

(declare-fun b!646051 () Bool)

(declare-fun e!370287 () Bool)

(assert (=> b!646051 (= e!370287 (contains!3126 Nil!12384 (select (arr!18439 lt!299543) j!136)))))

(declare-fun b!646052 () Bool)

(declare-fun e!370285 () Bool)

(assert (=> b!646052 (= e!370284 e!370285)))

(declare-fun res!418612 () Bool)

(assert (=> b!646052 (=> (not res!418612) (not e!370285))))

(assert (=> b!646052 (= res!418612 (not e!370287))))

(declare-fun res!418614 () Bool)

(assert (=> b!646052 (=> (not res!418614) (not e!370287))))

(assert (=> b!646052 (= res!418614 (validKeyInArray!0 (select (arr!18439 lt!299543) j!136)))))

(declare-fun b!646053 () Bool)

(declare-fun e!370286 () Bool)

(declare-fun call!33643 () Bool)

(assert (=> b!646053 (= e!370286 call!33643)))

(declare-fun b!646054 () Bool)

(assert (=> b!646054 (= e!370286 call!33643)))

(declare-fun b!646055 () Bool)

(assert (=> b!646055 (= e!370285 e!370286)))

(declare-fun c!74088 () Bool)

(assert (=> b!646055 (= c!74088 (validKeyInArray!0 (select (arr!18439 lt!299543) j!136)))))

(declare-fun bm!33640 () Bool)

(assert (=> bm!33640 (= call!33643 (arrayNoDuplicates!0 lt!299543 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74088 (Cons!12383 (select (arr!18439 lt!299543) j!136) Nil!12384) Nil!12384)))))

(assert (= (and d!91353 (not res!418613)) b!646052))

(assert (= (and b!646052 res!418614) b!646051))

(assert (= (and b!646052 res!418612) b!646055))

(assert (= (and b!646055 c!74088) b!646054))

(assert (= (and b!646055 (not c!74088)) b!646053))

(assert (= (or b!646054 b!646053) bm!33640))

(assert (=> b!646051 m!619969))

(assert (=> b!646051 m!619969))

(declare-fun m!619991 () Bool)

(assert (=> b!646051 m!619991))

(assert (=> b!646052 m!619969))

(assert (=> b!646052 m!619969))

(declare-fun m!619993 () Bool)

(assert (=> b!646052 m!619993))

(assert (=> b!646055 m!619969))

(assert (=> b!646055 m!619969))

(assert (=> b!646055 m!619993))

(assert (=> bm!33640 m!619969))

(declare-fun m!619995 () Bool)

(assert (=> bm!33640 m!619995))

(assert (=> b!645884 d!91353))

(declare-fun d!91355 () Bool)

(declare-fun e!370290 () Bool)

(assert (=> d!91355 e!370290))

(declare-fun res!418617 () Bool)

(assert (=> d!91355 (=> (not res!418617) (not e!370290))))

(assert (=> d!91355 (= res!418617 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18803 a!2986))))))

(declare-fun lt!299662 () Unit!21909)

(declare-fun choose!41 (array!38460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12387) Unit!21909)

(assert (=> d!91355 (= lt!299662 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12384))))

(assert (=> d!91355 (bvslt (size!18803 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91355 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12384) lt!299662)))

(declare-fun b!646058 () Bool)

(assert (=> b!646058 (= e!370290 (arrayNoDuplicates!0 (array!38461 (store (arr!18439 a!2986) i!1108 k0!1786) (size!18803 a!2986)) #b00000000000000000000000000000000 Nil!12384))))

(assert (= (and d!91355 res!418617) b!646058))

(declare-fun m!619997 () Bool)

(assert (=> d!91355 m!619997))

(assert (=> b!646058 m!619783))

(declare-fun m!619999 () Bool)

(assert (=> b!646058 m!619999))

(assert (=> b!645884 d!91355))

(declare-fun b!646071 () Bool)

(declare-fun e!370297 () SeekEntryResult!6835)

(assert (=> b!646071 (= e!370297 (Found!6835 index!984))))

(declare-fun e!370298 () SeekEntryResult!6835)

(declare-fun b!646072 () Bool)

(assert (=> b!646072 (= e!370298 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18439 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!91357 () Bool)

(declare-fun lt!299667 () SeekEntryResult!6835)

(get-info :version)

(assert (=> d!91357 (and (or ((_ is Undefined!6835) lt!299667) (not ((_ is Found!6835) lt!299667)) (and (bvsge (index!29676 lt!299667) #b00000000000000000000000000000000) (bvslt (index!29676 lt!299667) (size!18803 a!2986)))) (or ((_ is Undefined!6835) lt!299667) ((_ is Found!6835) lt!299667) (not ((_ is MissingVacant!6835) lt!299667)) (not (= (index!29678 lt!299667) vacantSpotIndex!68)) (and (bvsge (index!29678 lt!299667) #b00000000000000000000000000000000) (bvslt (index!29678 lt!299667) (size!18803 a!2986)))) (or ((_ is Undefined!6835) lt!299667) (ite ((_ is Found!6835) lt!299667) (= (select (arr!18439 a!2986) (index!29676 lt!299667)) (select (arr!18439 a!2986) j!136)) (and ((_ is MissingVacant!6835) lt!299667) (= (index!29678 lt!299667) vacantSpotIndex!68) (= (select (arr!18439 a!2986) (index!29678 lt!299667)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370299 () SeekEntryResult!6835)

(assert (=> d!91357 (= lt!299667 e!370299)))

(declare-fun c!74096 () Bool)

(assert (=> d!91357 (= c!74096 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!299668 () (_ BitVec 64))

(assert (=> d!91357 (= lt!299668 (select (arr!18439 a!2986) index!984))))

(assert (=> d!91357 (validMask!0 mask!3053)))

(assert (=> d!91357 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18439 a!2986) j!136) a!2986 mask!3053) lt!299667)))

(declare-fun b!646073 () Bool)

(declare-fun c!74095 () Bool)

(assert (=> b!646073 (= c!74095 (= lt!299668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646073 (= e!370297 e!370298)))

(declare-fun b!646074 () Bool)

(assert (=> b!646074 (= e!370299 Undefined!6835)))

(declare-fun b!646075 () Bool)

(assert (=> b!646075 (= e!370298 (MissingVacant!6835 vacantSpotIndex!68))))

(declare-fun b!646076 () Bool)

(assert (=> b!646076 (= e!370299 e!370297)))

(declare-fun c!74097 () Bool)

(assert (=> b!646076 (= c!74097 (= lt!299668 (select (arr!18439 a!2986) j!136)))))

(assert (= (and d!91357 c!74096) b!646074))

(assert (= (and d!91357 (not c!74096)) b!646076))

(assert (= (and b!646076 c!74097) b!646071))

(assert (= (and b!646076 (not c!74097)) b!646073))

(assert (= (and b!646073 c!74095) b!646075))

(assert (= (and b!646073 (not c!74095)) b!646072))

(declare-fun m!620001 () Bool)

(assert (=> b!646072 m!620001))

(assert (=> b!646072 m!620001))

(assert (=> b!646072 m!619777))

(declare-fun m!620003 () Bool)

(assert (=> b!646072 m!620003))

(declare-fun m!620005 () Bool)

(assert (=> d!91357 m!620005))

(declare-fun m!620007 () Bool)

(assert (=> d!91357 m!620007))

(assert (=> d!91357 m!619813))

(assert (=> d!91357 m!619817))

(assert (=> b!645873 d!91357))

(declare-fun bm!33643 () Bool)

(declare-fun call!33646 () Bool)

(assert (=> bm!33643 (= call!33646 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!646089 () Bool)

(declare-fun e!370312 () Bool)

(declare-fun e!370310 () Bool)

(assert (=> b!646089 (= e!370312 e!370310)))

(declare-fun c!74100 () Bool)

(assert (=> b!646089 (= c!74100 (validKeyInArray!0 (select (arr!18439 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!646090 () Bool)

(assert (=> b!646090 (= e!370310 call!33646)))

(declare-fun d!91359 () Bool)

(declare-fun res!418627 () Bool)

(assert (=> d!91359 (=> res!418627 e!370312)))

(assert (=> d!91359 (= res!418627 (bvsge #b00000000000000000000000000000000 (size!18803 a!2986)))))

(assert (=> d!91359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!370312)))

(declare-fun b!646091 () Bool)

(declare-fun e!370311 () Bool)

(assert (=> b!646091 (= e!370311 call!33646)))

(declare-fun b!646092 () Bool)

(assert (=> b!646092 (= e!370310 e!370311)))

(declare-fun lt!299677 () (_ BitVec 64))

(assert (=> b!646092 (= lt!299677 (select (arr!18439 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!299675 () Unit!21909)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38460 (_ BitVec 64) (_ BitVec 32)) Unit!21909)

(assert (=> b!646092 (= lt!299675 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!299677 #b00000000000000000000000000000000))))

(assert (=> b!646092 (arrayContainsKey!0 a!2986 lt!299677 #b00000000000000000000000000000000)))

(declare-fun lt!299676 () Unit!21909)

(assert (=> b!646092 (= lt!299676 lt!299675)))

(declare-fun res!418626 () Bool)

(assert (=> b!646092 (= res!418626 (= (seekEntryOrOpen!0 (select (arr!18439 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6835 #b00000000000000000000000000000000)))))

(assert (=> b!646092 (=> (not res!418626) (not e!370311))))

(assert (= (and d!91359 (not res!418627)) b!646089))

(assert (= (and b!646089 c!74100) b!646092))

(assert (= (and b!646089 (not c!74100)) b!646090))

(assert (= (and b!646092 res!418626) b!646091))

(assert (= (or b!646091 b!646090) bm!33643))

(declare-fun m!620009 () Bool)

(assert (=> bm!33643 m!620009))

(declare-fun m!620011 () Bool)

(assert (=> b!646089 m!620011))

(assert (=> b!646089 m!620011))

(declare-fun m!620013 () Bool)

(assert (=> b!646089 m!620013))

(assert (=> b!646092 m!620011))

(declare-fun m!620015 () Bool)

(assert (=> b!646092 m!620015))

(declare-fun m!620017 () Bool)

(assert (=> b!646092 m!620017))

(assert (=> b!646092 m!620011))

(declare-fun m!620021 () Bool)

(assert (=> b!646092 m!620021))

(assert (=> b!645883 d!91359))

(declare-fun d!91367 () Bool)

(assert (=> d!91367 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!645872 d!91367))

(declare-fun d!91369 () Bool)

(declare-fun res!418631 () Bool)

(declare-fun e!370315 () Bool)

(assert (=> d!91369 (=> res!418631 e!370315)))

(assert (=> d!91369 (= res!418631 (bvsge #b00000000000000000000000000000000 (size!18803 a!2986)))))

(assert (=> d!91369 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12384) e!370315)))

(declare-fun b!646095 () Bool)

(declare-fun e!370318 () Bool)

(assert (=> b!646095 (= e!370318 (contains!3126 Nil!12384 (select (arr!18439 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!646096 () Bool)

(declare-fun e!370316 () Bool)

(assert (=> b!646096 (= e!370315 e!370316)))

(declare-fun res!418630 () Bool)

(assert (=> b!646096 (=> (not res!418630) (not e!370316))))

(assert (=> b!646096 (= res!418630 (not e!370318))))

(declare-fun res!418632 () Bool)

(assert (=> b!646096 (=> (not res!418632) (not e!370318))))

(assert (=> b!646096 (= res!418632 (validKeyInArray!0 (select (arr!18439 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!646097 () Bool)

(declare-fun e!370317 () Bool)

(declare-fun call!33647 () Bool)

(assert (=> b!646097 (= e!370317 call!33647)))

(declare-fun b!646098 () Bool)

(assert (=> b!646098 (= e!370317 call!33647)))

(declare-fun b!646099 () Bool)

(assert (=> b!646099 (= e!370316 e!370317)))

(declare-fun c!74101 () Bool)

(assert (=> b!646099 (= c!74101 (validKeyInArray!0 (select (arr!18439 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33644 () Bool)

(assert (=> bm!33644 (= call!33647 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74101 (Cons!12383 (select (arr!18439 a!2986) #b00000000000000000000000000000000) Nil!12384) Nil!12384)))))

(assert (= (and d!91369 (not res!418631)) b!646096))

(assert (= (and b!646096 res!418632) b!646095))

(assert (= (and b!646096 res!418630) b!646099))

(assert (= (and b!646099 c!74101) b!646098))

(assert (= (and b!646099 (not c!74101)) b!646097))

(assert (= (or b!646098 b!646097) bm!33644))

(assert (=> b!646095 m!620011))

(assert (=> b!646095 m!620011))

(declare-fun m!620025 () Bool)

(assert (=> b!646095 m!620025))

(assert (=> b!646096 m!620011))

(assert (=> b!646096 m!620011))

(assert (=> b!646096 m!620013))

(assert (=> b!646099 m!620011))

(assert (=> b!646099 m!620011))

(assert (=> b!646099 m!620013))

(assert (=> bm!33644 m!620011))

(declare-fun m!620027 () Bool)

(assert (=> bm!33644 m!620027))

(assert (=> b!645882 d!91369))

(declare-fun d!91371 () Bool)

(declare-fun res!418633 () Bool)

(declare-fun e!370319 () Bool)

(assert (=> d!91371 (=> res!418633 e!370319)))

(assert (=> d!91371 (= res!418633 (= (select (arr!18439 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91371 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!370319)))

(declare-fun b!646100 () Bool)

(declare-fun e!370320 () Bool)

(assert (=> b!646100 (= e!370319 e!370320)))

(declare-fun res!418634 () Bool)

(assert (=> b!646100 (=> (not res!418634) (not e!370320))))

(assert (=> b!646100 (= res!418634 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18803 a!2986)))))

(declare-fun b!646101 () Bool)

(assert (=> b!646101 (= e!370320 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91371 (not res!418633)) b!646100))

(assert (= (and b!646100 res!418634) b!646101))

(assert (=> d!91371 m!620011))

(declare-fun m!620029 () Bool)

(assert (=> b!646101 m!620029))

(assert (=> b!645871 d!91371))

(declare-fun d!91373 () Bool)

(declare-fun res!418635 () Bool)

(declare-fun e!370321 () Bool)

(assert (=> d!91373 (=> res!418635 e!370321)))

(assert (=> d!91373 (= res!418635 (= (select (arr!18439 lt!299543) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18439 a!2986) j!136)))))

(assert (=> d!91373 (= (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!370321)))

(declare-fun b!646102 () Bool)

(declare-fun e!370322 () Bool)

(assert (=> b!646102 (= e!370321 e!370322)))

(declare-fun res!418636 () Bool)

(assert (=> b!646102 (=> (not res!418636) (not e!370322))))

(assert (=> b!646102 (= res!418636 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18803 lt!299543)))))

(declare-fun b!646103 () Bool)

(assert (=> b!646103 (= e!370322 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91373 (not res!418635)) b!646102))

(assert (= (and b!646102 res!418636) b!646103))

(declare-fun m!620031 () Bool)

(assert (=> d!91373 m!620031))

(assert (=> b!646103 m!619777))

(declare-fun m!620033 () Bool)

(assert (=> b!646103 m!620033))

(assert (=> b!645879 d!91373))

(declare-fun d!91375 () Bool)

(assert (=> d!91375 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299678 () Unit!21909)

(assert (=> d!91375 (= lt!299678 (choose!114 lt!299543 (select (arr!18439 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91375 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91375 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299543 (select (arr!18439 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!299678)))

(declare-fun bs!19316 () Bool)

(assert (= bs!19316 d!91375))

(assert (=> bs!19316 m!619777))

(assert (=> bs!19316 m!619791))

(assert (=> bs!19316 m!619777))

(declare-fun m!620035 () Bool)

(assert (=> bs!19316 m!620035))

(assert (=> b!645879 d!91375))

(assert (=> b!645879 d!91339))

(declare-fun d!91377 () Bool)

(declare-fun res!418643 () Bool)

(declare-fun e!370331 () Bool)

(assert (=> d!91377 (=> res!418643 e!370331)))

(assert (=> d!91377 (= res!418643 (= (select (arr!18439 lt!299543) index!984) (select (arr!18439 a!2986) j!136)))))

(assert (=> d!91377 (= (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) index!984) e!370331)))

(declare-fun b!646114 () Bool)

(declare-fun e!370332 () Bool)

(assert (=> b!646114 (= e!370331 e!370332)))

(declare-fun res!418644 () Bool)

(assert (=> b!646114 (=> (not res!418644) (not e!370332))))

(assert (=> b!646114 (= res!418644 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18803 lt!299543)))))

(declare-fun b!646115 () Bool)

(assert (=> b!646115 (= e!370332 (arrayContainsKey!0 lt!299543 (select (arr!18439 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91377 (not res!418643)) b!646114))

(assert (= (and b!646114 res!418644) b!646115))

(declare-fun m!620037 () Bool)

(assert (=> d!91377 m!620037))

(assert (=> b!646115 m!619777))

(declare-fun m!620039 () Bool)

(assert (=> b!646115 m!620039))

(assert (=> b!645868 d!91377))

(assert (=> b!645889 d!91377))

(declare-fun d!91379 () Bool)

(declare-fun lt!299704 () SeekEntryResult!6835)

(assert (=> d!91379 (and (or ((_ is Undefined!6835) lt!299704) (not ((_ is Found!6835) lt!299704)) (and (bvsge (index!29676 lt!299704) #b00000000000000000000000000000000) (bvslt (index!29676 lt!299704) (size!18803 a!2986)))) (or ((_ is Undefined!6835) lt!299704) ((_ is Found!6835) lt!299704) (not ((_ is MissingZero!6835) lt!299704)) (and (bvsge (index!29675 lt!299704) #b00000000000000000000000000000000) (bvslt (index!29675 lt!299704) (size!18803 a!2986)))) (or ((_ is Undefined!6835) lt!299704) ((_ is Found!6835) lt!299704) ((_ is MissingZero!6835) lt!299704) (not ((_ is MissingVacant!6835) lt!299704)) (and (bvsge (index!29678 lt!299704) #b00000000000000000000000000000000) (bvslt (index!29678 lt!299704) (size!18803 a!2986)))) (or ((_ is Undefined!6835) lt!299704) (ite ((_ is Found!6835) lt!299704) (= (select (arr!18439 a!2986) (index!29676 lt!299704)) k0!1786) (ite ((_ is MissingZero!6835) lt!299704) (= (select (arr!18439 a!2986) (index!29675 lt!299704)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6835) lt!299704) (= (select (arr!18439 a!2986) (index!29678 lt!299704)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!370368 () SeekEntryResult!6835)

(assert (=> d!91379 (= lt!299704 e!370368)))

(declare-fun c!74122 () Bool)

(declare-fun lt!299703 () SeekEntryResult!6835)

(assert (=> d!91379 (= c!74122 (and ((_ is Intermediate!6835) lt!299703) (undefined!7647 lt!299703)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38460 (_ BitVec 32)) SeekEntryResult!6835)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91379 (= lt!299703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91379 (validMask!0 mask!3053)))

(assert (=> d!91379 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!299704)))

(declare-fun b!646169 () Bool)

(declare-fun e!370369 () SeekEntryResult!6835)

(assert (=> b!646169 (= e!370369 (Found!6835 (index!29677 lt!299703)))))

(declare-fun b!646170 () Bool)

(assert (=> b!646170 (= e!370368 Undefined!6835)))

(declare-fun b!646171 () Bool)

(declare-fun e!370370 () SeekEntryResult!6835)

(assert (=> b!646171 (= e!370370 (seekKeyOrZeroReturnVacant!0 (x!58599 lt!299703) (index!29677 lt!299703) (index!29677 lt!299703) k0!1786 a!2986 mask!3053))))

(declare-fun b!646172 () Bool)

(assert (=> b!646172 (= e!370368 e!370369)))

(declare-fun lt!299705 () (_ BitVec 64))

(assert (=> b!646172 (= lt!299705 (select (arr!18439 a!2986) (index!29677 lt!299703)))))

(declare-fun c!74124 () Bool)

(assert (=> b!646172 (= c!74124 (= lt!299705 k0!1786))))

(declare-fun b!646173 () Bool)

(assert (=> b!646173 (= e!370370 (MissingZero!6835 (index!29677 lt!299703)))))

(declare-fun b!646174 () Bool)

(declare-fun c!74123 () Bool)

(assert (=> b!646174 (= c!74123 (= lt!299705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646174 (= e!370369 e!370370)))

(assert (= (and d!91379 c!74122) b!646170))

(assert (= (and d!91379 (not c!74122)) b!646172))

(assert (= (and b!646172 c!74124) b!646169))

(assert (= (and b!646172 (not c!74124)) b!646174))

(assert (= (and b!646174 c!74123) b!646173))

(assert (= (and b!646174 (not c!74123)) b!646171))

(declare-fun m!620075 () Bool)

(assert (=> d!91379 m!620075))

(declare-fun m!620077 () Bool)

(assert (=> d!91379 m!620077))

(declare-fun m!620079 () Bool)

(assert (=> d!91379 m!620079))

(declare-fun m!620081 () Bool)

(assert (=> d!91379 m!620081))

(assert (=> d!91379 m!620075))

(declare-fun m!620083 () Bool)

(assert (=> d!91379 m!620083))

(assert (=> d!91379 m!619817))

(declare-fun m!620085 () Bool)

(assert (=> b!646171 m!620085))

(declare-fun m!620087 () Bool)

(assert (=> b!646172 m!620087))

(assert (=> b!645888 d!91379))

(declare-fun d!91399 () Bool)

(assert (=> d!91399 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58506 d!91399))

(declare-fun d!91409 () Bool)

(assert (=> d!91409 (= (array_inv!14298 a!2986) (bvsge (size!18803 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58506 d!91409))

(declare-fun b!646199 () Bool)

(declare-fun e!370385 () SeekEntryResult!6835)

(assert (=> b!646199 (= e!370385 (Found!6835 index!984))))

(declare-fun e!370386 () SeekEntryResult!6835)

(declare-fun b!646200 () Bool)

(assert (=> b!646200 (= e!370386 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!299541 lt!299543 mask!3053))))

(declare-fun lt!299718 () SeekEntryResult!6835)

(declare-fun d!91413 () Bool)

(assert (=> d!91413 (and (or ((_ is Undefined!6835) lt!299718) (not ((_ is Found!6835) lt!299718)) (and (bvsge (index!29676 lt!299718) #b00000000000000000000000000000000) (bvslt (index!29676 lt!299718) (size!18803 lt!299543)))) (or ((_ is Undefined!6835) lt!299718) ((_ is Found!6835) lt!299718) (not ((_ is MissingVacant!6835) lt!299718)) (not (= (index!29678 lt!299718) vacantSpotIndex!68)) (and (bvsge (index!29678 lt!299718) #b00000000000000000000000000000000) (bvslt (index!29678 lt!299718) (size!18803 lt!299543)))) (or ((_ is Undefined!6835) lt!299718) (ite ((_ is Found!6835) lt!299718) (= (select (arr!18439 lt!299543) (index!29676 lt!299718)) lt!299541) (and ((_ is MissingVacant!6835) lt!299718) (= (index!29678 lt!299718) vacantSpotIndex!68) (= (select (arr!18439 lt!299543) (index!29678 lt!299718)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370387 () SeekEntryResult!6835)

(assert (=> d!91413 (= lt!299718 e!370387)))

(declare-fun c!74136 () Bool)

(assert (=> d!91413 (= c!74136 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!299719 () (_ BitVec 64))

(assert (=> d!91413 (= lt!299719 (select (arr!18439 lt!299543) index!984))))

(assert (=> d!91413 (validMask!0 mask!3053)))

(assert (=> d!91413 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299541 lt!299543 mask!3053) lt!299718)))

(declare-fun b!646201 () Bool)

(declare-fun c!74135 () Bool)

(assert (=> b!646201 (= c!74135 (= lt!299719 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646201 (= e!370385 e!370386)))

(declare-fun b!646202 () Bool)

(assert (=> b!646202 (= e!370387 Undefined!6835)))

(declare-fun b!646203 () Bool)

(assert (=> b!646203 (= e!370386 (MissingVacant!6835 vacantSpotIndex!68))))

(declare-fun b!646204 () Bool)

(assert (=> b!646204 (= e!370387 e!370385)))

(declare-fun c!74137 () Bool)

(assert (=> b!646204 (= c!74137 (= lt!299719 lt!299541))))

(assert (= (and d!91413 c!74136) b!646202))

(assert (= (and d!91413 (not c!74136)) b!646204))

(assert (= (and b!646204 c!74137) b!646199))

(assert (= (and b!646204 (not c!74137)) b!646201))

(assert (= (and b!646201 c!74135) b!646203))

(assert (= (and b!646201 (not c!74135)) b!646200))

(assert (=> b!646200 m!620001))

(assert (=> b!646200 m!620001))

(declare-fun m!620115 () Bool)

(assert (=> b!646200 m!620115))

(declare-fun m!620117 () Bool)

(assert (=> d!91413 m!620117))

(declare-fun m!620119 () Bool)

(assert (=> d!91413 m!620119))

(assert (=> d!91413 m!620037))

(assert (=> d!91413 m!619817))

(assert (=> b!645877 d!91413))

(declare-fun b!646205 () Bool)

(declare-fun e!370388 () SeekEntryResult!6835)

(assert (=> b!646205 (= e!370388 (Found!6835 lt!299540))))

(declare-fun b!646206 () Bool)

(declare-fun e!370389 () SeekEntryResult!6835)

(assert (=> b!646206 (= e!370389 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299540 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18439 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!91415 () Bool)

(declare-fun lt!299720 () SeekEntryResult!6835)

(assert (=> d!91415 (and (or ((_ is Undefined!6835) lt!299720) (not ((_ is Found!6835) lt!299720)) (and (bvsge (index!29676 lt!299720) #b00000000000000000000000000000000) (bvslt (index!29676 lt!299720) (size!18803 a!2986)))) (or ((_ is Undefined!6835) lt!299720) ((_ is Found!6835) lt!299720) (not ((_ is MissingVacant!6835) lt!299720)) (not (= (index!29678 lt!299720) vacantSpotIndex!68)) (and (bvsge (index!29678 lt!299720) #b00000000000000000000000000000000) (bvslt (index!29678 lt!299720) (size!18803 a!2986)))) (or ((_ is Undefined!6835) lt!299720) (ite ((_ is Found!6835) lt!299720) (= (select (arr!18439 a!2986) (index!29676 lt!299720)) (select (arr!18439 a!2986) j!136)) (and ((_ is MissingVacant!6835) lt!299720) (= (index!29678 lt!299720) vacantSpotIndex!68) (= (select (arr!18439 a!2986) (index!29678 lt!299720)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370390 () SeekEntryResult!6835)

(assert (=> d!91415 (= lt!299720 e!370390)))

(declare-fun c!74139 () Bool)

(assert (=> d!91415 (= c!74139 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!299721 () (_ BitVec 64))

(assert (=> d!91415 (= lt!299721 (select (arr!18439 a!2986) lt!299540))))

(assert (=> d!91415 (validMask!0 mask!3053)))

(assert (=> d!91415 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299540 vacantSpotIndex!68 (select (arr!18439 a!2986) j!136) a!2986 mask!3053) lt!299720)))

(declare-fun b!646207 () Bool)

(declare-fun c!74138 () Bool)

(assert (=> b!646207 (= c!74138 (= lt!299721 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646207 (= e!370388 e!370389)))

(declare-fun b!646208 () Bool)

(assert (=> b!646208 (= e!370390 Undefined!6835)))

(declare-fun b!646209 () Bool)

(assert (=> b!646209 (= e!370389 (MissingVacant!6835 vacantSpotIndex!68))))

(declare-fun b!646210 () Bool)

(assert (=> b!646210 (= e!370390 e!370388)))

(declare-fun c!74140 () Bool)

(assert (=> b!646210 (= c!74140 (= lt!299721 (select (arr!18439 a!2986) j!136)))))

(assert (= (and d!91415 c!74139) b!646208))

(assert (= (and d!91415 (not c!74139)) b!646210))

(assert (= (and b!646210 c!74140) b!646205))

(assert (= (and b!646210 (not c!74140)) b!646207))

(assert (= (and b!646207 c!74138) b!646209))

(assert (= (and b!646207 (not c!74138)) b!646206))

(declare-fun m!620121 () Bool)

(assert (=> b!646206 m!620121))

(assert (=> b!646206 m!620121))

(assert (=> b!646206 m!619777))

(declare-fun m!620123 () Bool)

(assert (=> b!646206 m!620123))

(declare-fun m!620125 () Bool)

(assert (=> d!91415 m!620125))

(declare-fun m!620127 () Bool)

(assert (=> d!91415 m!620127))

(declare-fun m!620129 () Bool)

(assert (=> d!91415 m!620129))

(assert (=> d!91415 m!619817))

(assert (=> b!645877 d!91415))

(declare-fun d!91417 () Bool)

(declare-fun lt!299726 () (_ BitVec 32))

(assert (=> d!91417 (and (bvsge lt!299726 #b00000000000000000000000000000000) (bvslt lt!299726 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91417 (= lt!299726 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!91417 (validMask!0 mask!3053)))

(assert (=> d!91417 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!299726)))

(declare-fun bs!19318 () Bool)

(assert (= bs!19318 d!91417))

(declare-fun m!620131 () Bool)

(assert (=> bs!19318 m!620131))

(assert (=> bs!19318 m!619817))

(assert (=> b!645877 d!91417))

(declare-fun d!91419 () Bool)

(declare-fun e!370422 () Bool)

(assert (=> d!91419 e!370422))

(declare-fun res!418679 () Bool)

(assert (=> d!91419 (=> (not res!418679) (not e!370422))))

(assert (=> d!91419 (= res!418679 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18803 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18803 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18803 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18803 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18803 a!2986))))))

(declare-fun lt!299749 () Unit!21909)

(declare-fun choose!9 (array!38460 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21909)

(assert (=> d!91419 (= lt!299749 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299540 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91419 (validMask!0 mask!3053)))

(assert (=> d!91419 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299540 vacantSpotIndex!68 mask!3053) lt!299749)))

(declare-fun b!646260 () Bool)

(assert (=> b!646260 (= e!370422 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299540 vacantSpotIndex!68 (select (arr!18439 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299540 vacantSpotIndex!68 (select (store (arr!18439 a!2986) i!1108 k0!1786) j!136) (array!38461 (store (arr!18439 a!2986) i!1108 k0!1786) (size!18803 a!2986)) mask!3053)))))

(assert (= (and d!91419 res!418679) b!646260))

(declare-fun m!620177 () Bool)

(assert (=> d!91419 m!620177))

(assert (=> d!91419 m!619817))

(assert (=> b!646260 m!619777))

(assert (=> b!646260 m!619803))

(assert (=> b!646260 m!619783))

(assert (=> b!646260 m!619777))

(assert (=> b!646260 m!619811))

(assert (=> b!646260 m!619803))

(declare-fun m!620181 () Bool)

(assert (=> b!646260 m!620181))

(assert (=> b!645877 d!91419))

(declare-fun b!646266 () Bool)

(declare-fun e!370427 () SeekEntryResult!6835)

(assert (=> b!646266 (= e!370427 (Found!6835 lt!299540))))

(declare-fun b!646267 () Bool)

(declare-fun e!370428 () SeekEntryResult!6835)

(assert (=> b!646267 (= e!370428 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299540 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!299541 lt!299543 mask!3053))))

(declare-fun d!91437 () Bool)

(declare-fun lt!299753 () SeekEntryResult!6835)

(assert (=> d!91437 (and (or ((_ is Undefined!6835) lt!299753) (not ((_ is Found!6835) lt!299753)) (and (bvsge (index!29676 lt!299753) #b00000000000000000000000000000000) (bvslt (index!29676 lt!299753) (size!18803 lt!299543)))) (or ((_ is Undefined!6835) lt!299753) ((_ is Found!6835) lt!299753) (not ((_ is MissingVacant!6835) lt!299753)) (not (= (index!29678 lt!299753) vacantSpotIndex!68)) (and (bvsge (index!29678 lt!299753) #b00000000000000000000000000000000) (bvslt (index!29678 lt!299753) (size!18803 lt!299543)))) (or ((_ is Undefined!6835) lt!299753) (ite ((_ is Found!6835) lt!299753) (= (select (arr!18439 lt!299543) (index!29676 lt!299753)) lt!299541) (and ((_ is MissingVacant!6835) lt!299753) (= (index!29678 lt!299753) vacantSpotIndex!68) (= (select (arr!18439 lt!299543) (index!29678 lt!299753)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370429 () SeekEntryResult!6835)

(assert (=> d!91437 (= lt!299753 e!370429)))

(declare-fun c!74161 () Bool)

(assert (=> d!91437 (= c!74161 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!299754 () (_ BitVec 64))

(assert (=> d!91437 (= lt!299754 (select (arr!18439 lt!299543) lt!299540))))

(assert (=> d!91437 (validMask!0 mask!3053)))

(assert (=> d!91437 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299540 vacantSpotIndex!68 lt!299541 lt!299543 mask!3053) lt!299753)))

(declare-fun b!646268 () Bool)

(declare-fun c!74160 () Bool)

(assert (=> b!646268 (= c!74160 (= lt!299754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646268 (= e!370427 e!370428)))

(declare-fun b!646269 () Bool)

(assert (=> b!646269 (= e!370429 Undefined!6835)))

(declare-fun b!646270 () Bool)

(assert (=> b!646270 (= e!370428 (MissingVacant!6835 vacantSpotIndex!68))))

(declare-fun b!646271 () Bool)

(assert (=> b!646271 (= e!370429 e!370427)))

(declare-fun c!74162 () Bool)

(assert (=> b!646271 (= c!74162 (= lt!299754 lt!299541))))

(assert (= (and d!91437 c!74161) b!646269))

(assert (= (and d!91437 (not c!74161)) b!646271))

(assert (= (and b!646271 c!74162) b!646266))

(assert (= (and b!646271 (not c!74162)) b!646268))

(assert (= (and b!646268 c!74160) b!646270))

(assert (= (and b!646268 (not c!74160)) b!646267))

(assert (=> b!646267 m!620121))

(assert (=> b!646267 m!620121))

(declare-fun m!620191 () Bool)

(assert (=> b!646267 m!620191))

(declare-fun m!620195 () Bool)

(assert (=> d!91437 m!620195))

(declare-fun m!620199 () Bool)

(assert (=> d!91437 m!620199))

(declare-fun m!620201 () Bool)

(assert (=> d!91437 m!620201))

(assert (=> d!91437 m!619817))

(assert (=> b!645877 d!91437))

(check-sat (not b!646260) (not bm!33639) (not b!646101) (not d!91349) (not bm!33644) (not b!646033) (not b!646052) (not d!91343) (not b!646200) (not b!646055) (not b!646115) (not d!91375) (not b!646047) (not bm!33640) (not b!646095) (not d!91355) (not b!646092) (not d!91357) (not d!91419) (not b!646171) (not d!91347) (not b!646089) (not b!646267) (not b!646096) (not d!91413) (not d!91417) (not b!646051) (not b!646050) (not d!91379) (not b!646099) (not b!646058) (not bm!33643) (not b!646072) (not b!646206) (not b!646046) (not b!646035) (not b!646103) (not d!91437) (not d!91415))
(check-sat)
