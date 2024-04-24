; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58914 () Bool)

(assert start!58914)

(declare-fun b!648872 () Bool)

(declare-fun e!372185 () Bool)

(declare-fun e!372172 () Bool)

(assert (=> b!648872 (= e!372185 e!372172)))

(declare-fun res!420397 () Bool)

(assert (=> b!648872 (=> (not res!420397) (not e!372172))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6856 0))(
  ( (MissingZero!6856 (index!29771 (_ BitVec 32))) (Found!6856 (index!29772 (_ BitVec 32))) (Intermediate!6856 (undefined!7668 Bool) (index!29773 (_ BitVec 32)) (x!58712 (_ BitVec 32))) (Undefined!6856) (MissingVacant!6856 (index!29774 (_ BitVec 32))) )
))
(declare-fun lt!301176 () SeekEntryResult!6856)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38514 0))(
  ( (array!38515 (arr!18460 (Array (_ BitVec 32) (_ BitVec 64))) (size!18824 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38514)

(assert (=> b!648872 (= res!420397 (and (= lt!301176 (Found!6856 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18460 a!2986) index!984) (select (arr!18460 a!2986) j!136))) (not (= (select (arr!18460 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38514 (_ BitVec 32)) SeekEntryResult!6856)

(assert (=> b!648872 (= lt!301176 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18460 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648873 () Bool)

(declare-datatypes ((Unit!22035 0))(
  ( (Unit!22036) )
))
(declare-fun e!372179 () Unit!22035)

(declare-fun Unit!22037 () Unit!22035)

(assert (=> b!648873 (= e!372179 Unit!22037)))

(declare-fun lt!301187 () array!38514)

(declare-fun e!372171 () Bool)

(declare-fun b!648874 () Bool)

(declare-fun arrayContainsKey!0 (array!38514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648874 (= e!372171 (arrayContainsKey!0 lt!301187 (select (arr!18460 a!2986) j!136) index!984))))

(declare-fun b!648875 () Bool)

(declare-fun res!420383 () Bool)

(declare-fun e!372175 () Bool)

(assert (=> b!648875 (=> (not res!420383) (not e!372175))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648875 (= res!420383 (validKeyInArray!0 k0!1786))))

(declare-fun b!648876 () Bool)

(declare-fun e!372186 () Bool)

(assert (=> b!648876 (= e!372186 (arrayContainsKey!0 lt!301187 (select (arr!18460 a!2986) j!136) index!984))))

(declare-fun b!648877 () Bool)

(declare-fun res!420381 () Bool)

(declare-fun e!372178 () Bool)

(assert (=> b!648877 (=> res!420381 e!372178)))

(declare-datatypes ((List!12408 0))(
  ( (Nil!12405) (Cons!12404 (h!13452 (_ BitVec 64)) (t!18628 List!12408)) )
))
(declare-fun noDuplicate!427 (List!12408) Bool)

(assert (=> b!648877 (= res!420381 (not (noDuplicate!427 Nil!12405)))))

(declare-fun res!420384 () Bool)

(assert (=> start!58914 (=> (not res!420384) (not e!372175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58914 (= res!420384 (validMask!0 mask!3053))))

(assert (=> start!58914 e!372175))

(assert (=> start!58914 true))

(declare-fun array_inv!14319 (array!38514) Bool)

(assert (=> start!58914 (array_inv!14319 a!2986)))

(declare-fun b!648878 () Bool)

(declare-fun Unit!22038 () Unit!22035)

(assert (=> b!648878 (= e!372179 Unit!22038)))

(declare-fun lt!301186 () Unit!22035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38514 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22035)

(assert (=> b!648878 (= lt!301186 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301187 (select (arr!18460 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648878 (arrayContainsKey!0 lt!301187 (select (arr!18460 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!301174 () Unit!22035)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38514 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12408) Unit!22035)

(assert (=> b!648878 (= lt!301174 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12405))))

(declare-fun arrayNoDuplicates!0 (array!38514 (_ BitVec 32) List!12408) Bool)

(assert (=> b!648878 (arrayNoDuplicates!0 lt!301187 #b00000000000000000000000000000000 Nil!12405)))

(declare-fun lt!301180 () Unit!22035)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38514 (_ BitVec 32) (_ BitVec 32)) Unit!22035)

(assert (=> b!648878 (= lt!301180 (lemmaNoDuplicateFromThenFromBigger!0 lt!301187 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648878 (arrayNoDuplicates!0 lt!301187 j!136 Nil!12405)))

(declare-fun lt!301181 () Unit!22035)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38514 (_ BitVec 64) (_ BitVec 32) List!12408) Unit!22035)

(assert (=> b!648878 (= lt!301181 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301187 (select (arr!18460 a!2986) j!136) j!136 Nil!12405))))

(assert (=> b!648878 false))

(declare-fun b!648879 () Bool)

(declare-fun res!420376 () Bool)

(declare-fun e!372176 () Bool)

(assert (=> b!648879 (=> (not res!420376) (not e!372176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38514 (_ BitVec 32)) Bool)

(assert (=> b!648879 (= res!420376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648880 () Bool)

(declare-fun res!420394 () Bool)

(assert (=> b!648880 (=> (not res!420394) (not e!372176))))

(assert (=> b!648880 (= res!420394 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18460 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648881 () Bool)

(declare-fun e!372173 () Bool)

(assert (=> b!648881 (= e!372172 (not e!372173))))

(declare-fun res!420389 () Bool)

(assert (=> b!648881 (=> res!420389 e!372173)))

(declare-fun lt!301185 () SeekEntryResult!6856)

(assert (=> b!648881 (= res!420389 (not (= lt!301185 (Found!6856 index!984))))))

(declare-fun lt!301175 () Unit!22035)

(declare-fun e!372184 () Unit!22035)

(assert (=> b!648881 (= lt!301175 e!372184)))

(declare-fun c!74618 () Bool)

(assert (=> b!648881 (= c!74618 (= lt!301185 Undefined!6856))))

(declare-fun lt!301182 () (_ BitVec 64))

(assert (=> b!648881 (= lt!301185 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301182 lt!301187 mask!3053))))

(declare-fun e!372182 () Bool)

(assert (=> b!648881 e!372182))

(declare-fun res!420379 () Bool)

(assert (=> b!648881 (=> (not res!420379) (not e!372182))))

(declare-fun lt!301173 () SeekEntryResult!6856)

(declare-fun lt!301183 () (_ BitVec 32))

(assert (=> b!648881 (= res!420379 (= lt!301173 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301183 vacantSpotIndex!68 lt!301182 lt!301187 mask!3053)))))

(assert (=> b!648881 (= lt!301173 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301183 vacantSpotIndex!68 (select (arr!18460 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648881 (= lt!301182 (select (store (arr!18460 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301184 () Unit!22035)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22035)

(assert (=> b!648881 (= lt!301184 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301183 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648881 (= lt!301183 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!648882 () Bool)

(declare-fun res!420385 () Bool)

(assert (=> b!648882 (=> (not res!420385) (not e!372175))))

(assert (=> b!648882 (= res!420385 (validKeyInArray!0 (select (arr!18460 a!2986) j!136)))))

(declare-fun b!648883 () Bool)

(declare-fun res!420390 () Bool)

(assert (=> b!648883 (=> (not res!420390) (not e!372176))))

(assert (=> b!648883 (= res!420390 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12405))))

(declare-fun b!648884 () Bool)

(declare-fun e!372177 () Bool)

(assert (=> b!648884 (= e!372173 e!372177)))

(declare-fun res!420382 () Bool)

(assert (=> b!648884 (=> res!420382 e!372177)))

(declare-fun lt!301178 () (_ BitVec 64))

(assert (=> b!648884 (= res!420382 (or (not (= (select (arr!18460 a!2986) j!136) lt!301182)) (not (= (select (arr!18460 a!2986) j!136) lt!301178))))))

(declare-fun e!372181 () Bool)

(assert (=> b!648884 e!372181))

(declare-fun res!420396 () Bool)

(assert (=> b!648884 (=> (not res!420396) (not e!372181))))

(assert (=> b!648884 (= res!420396 (= lt!301178 (select (arr!18460 a!2986) j!136)))))

(assert (=> b!648884 (= lt!301178 (select (store (arr!18460 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!648885 () Bool)

(declare-fun e!372180 () Bool)

(assert (=> b!648885 (= e!372177 e!372180)))

(declare-fun res!420393 () Bool)

(assert (=> b!648885 (=> res!420393 e!372180)))

(assert (=> b!648885 (= res!420393 (bvsge index!984 j!136))))

(declare-fun lt!301179 () Unit!22035)

(assert (=> b!648885 (= lt!301179 e!372179)))

(declare-fun c!74617 () Bool)

(assert (=> b!648885 (= c!74617 (bvslt j!136 index!984))))

(declare-fun b!648886 () Bool)

(assert (=> b!648886 (= e!372176 e!372185)))

(declare-fun res!420377 () Bool)

(assert (=> b!648886 (=> (not res!420377) (not e!372185))))

(assert (=> b!648886 (= res!420377 (= (select (store (arr!18460 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648886 (= lt!301187 (array!38515 (store (arr!18460 a!2986) i!1108 k0!1786) (size!18824 a!2986)))))

(declare-fun b!648887 () Bool)

(declare-fun Unit!22039 () Unit!22035)

(assert (=> b!648887 (= e!372184 Unit!22039)))

(declare-fun b!648888 () Bool)

(declare-fun res!420392 () Bool)

(assert (=> b!648888 (=> res!420392 e!372178)))

(declare-fun contains!3140 (List!12408 (_ BitVec 64)) Bool)

(assert (=> b!648888 (= res!420392 (contains!3140 Nil!12405 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648889 () Bool)

(declare-fun e!372174 () Bool)

(assert (=> b!648889 (= e!372181 e!372174)))

(declare-fun res!420378 () Bool)

(assert (=> b!648889 (=> res!420378 e!372174)))

(assert (=> b!648889 (= res!420378 (or (not (= (select (arr!18460 a!2986) j!136) lt!301182)) (not (= (select (arr!18460 a!2986) j!136) lt!301178)) (bvsge j!136 index!984)))))

(declare-fun b!648890 () Bool)

(assert (=> b!648890 (= e!372178 true)))

(declare-fun lt!301188 () Bool)

(assert (=> b!648890 (= lt!301188 (contains!3140 Nil!12405 k0!1786))))

(declare-fun b!648891 () Bool)

(assert (=> b!648891 (= e!372180 e!372178)))

(declare-fun res!420395 () Bool)

(assert (=> b!648891 (=> res!420395 e!372178)))

(assert (=> b!648891 (= res!420395 (or (bvsge (size!18824 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18824 a!2986))))))

(assert (=> b!648891 (arrayContainsKey!0 lt!301187 (select (arr!18460 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301177 () Unit!22035)

(assert (=> b!648891 (= lt!301177 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301187 (select (arr!18460 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!648891 e!372186))

(declare-fun res!420391 () Bool)

(assert (=> b!648891 (=> (not res!420391) (not e!372186))))

(assert (=> b!648891 (= res!420391 (arrayContainsKey!0 lt!301187 (select (arr!18460 a!2986) j!136) j!136))))

(declare-fun b!648892 () Bool)

(declare-fun res!420375 () Bool)

(assert (=> b!648892 (=> (not res!420375) (not e!372175))))

(assert (=> b!648892 (= res!420375 (and (= (size!18824 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18824 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18824 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648893 () Bool)

(declare-fun res!420380 () Bool)

(assert (=> b!648893 (=> res!420380 e!372178)))

(assert (=> b!648893 (= res!420380 (contains!3140 Nil!12405 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648894 () Bool)

(declare-fun Unit!22040 () Unit!22035)

(assert (=> b!648894 (= e!372184 Unit!22040)))

(assert (=> b!648894 false))

(declare-fun b!648895 () Bool)

(declare-fun res!420386 () Bool)

(assert (=> b!648895 (=> (not res!420386) (not e!372175))))

(assert (=> b!648895 (= res!420386 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648896 () Bool)

(assert (=> b!648896 (= e!372174 e!372171)))

(declare-fun res!420387 () Bool)

(assert (=> b!648896 (=> (not res!420387) (not e!372171))))

(assert (=> b!648896 (= res!420387 (arrayContainsKey!0 lt!301187 (select (arr!18460 a!2986) j!136) j!136))))

(declare-fun b!648897 () Bool)

(assert (=> b!648897 (= e!372182 (= lt!301176 lt!301173))))

(declare-fun b!648898 () Bool)

(assert (=> b!648898 (= e!372175 e!372176)))

(declare-fun res!420388 () Bool)

(assert (=> b!648898 (=> (not res!420388) (not e!372176))))

(declare-fun lt!301189 () SeekEntryResult!6856)

(assert (=> b!648898 (= res!420388 (or (= lt!301189 (MissingZero!6856 i!1108)) (= lt!301189 (MissingVacant!6856 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38514 (_ BitVec 32)) SeekEntryResult!6856)

(assert (=> b!648898 (= lt!301189 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!58914 res!420384) b!648892))

(assert (= (and b!648892 res!420375) b!648882))

(assert (= (and b!648882 res!420385) b!648875))

(assert (= (and b!648875 res!420383) b!648895))

(assert (= (and b!648895 res!420386) b!648898))

(assert (= (and b!648898 res!420388) b!648879))

(assert (= (and b!648879 res!420376) b!648883))

(assert (= (and b!648883 res!420390) b!648880))

(assert (= (and b!648880 res!420394) b!648886))

(assert (= (and b!648886 res!420377) b!648872))

(assert (= (and b!648872 res!420397) b!648881))

(assert (= (and b!648881 res!420379) b!648897))

(assert (= (and b!648881 c!74618) b!648894))

(assert (= (and b!648881 (not c!74618)) b!648887))

(assert (= (and b!648881 (not res!420389)) b!648884))

(assert (= (and b!648884 res!420396) b!648889))

(assert (= (and b!648889 (not res!420378)) b!648896))

(assert (= (and b!648896 res!420387) b!648874))

(assert (= (and b!648884 (not res!420382)) b!648885))

(assert (= (and b!648885 c!74617) b!648878))

(assert (= (and b!648885 (not c!74617)) b!648873))

(assert (= (and b!648885 (not res!420393)) b!648891))

(assert (= (and b!648891 res!420391) b!648876))

(assert (= (and b!648891 (not res!420395)) b!648877))

(assert (= (and b!648877 (not res!420381)) b!648893))

(assert (= (and b!648893 (not res!420380)) b!648888))

(assert (= (and b!648888 (not res!420392)) b!648890))

(declare-fun m!622645 () Bool)

(assert (=> b!648891 m!622645))

(assert (=> b!648891 m!622645))

(declare-fun m!622647 () Bool)

(assert (=> b!648891 m!622647))

(assert (=> b!648891 m!622645))

(declare-fun m!622649 () Bool)

(assert (=> b!648891 m!622649))

(assert (=> b!648891 m!622645))

(declare-fun m!622651 () Bool)

(assert (=> b!648891 m!622651))

(declare-fun m!622653 () Bool)

(assert (=> b!648893 m!622653))

(assert (=> b!648876 m!622645))

(assert (=> b!648876 m!622645))

(declare-fun m!622655 () Bool)

(assert (=> b!648876 m!622655))

(declare-fun m!622657 () Bool)

(assert (=> b!648879 m!622657))

(assert (=> b!648882 m!622645))

(assert (=> b!648882 m!622645))

(declare-fun m!622659 () Bool)

(assert (=> b!648882 m!622659))

(declare-fun m!622661 () Bool)

(assert (=> b!648880 m!622661))

(declare-fun m!622663 () Bool)

(assert (=> b!648886 m!622663))

(declare-fun m!622665 () Bool)

(assert (=> b!648886 m!622665))

(declare-fun m!622667 () Bool)

(assert (=> b!648898 m!622667))

(assert (=> b!648878 m!622645))

(declare-fun m!622669 () Bool)

(assert (=> b!648878 m!622669))

(assert (=> b!648878 m!622645))

(declare-fun m!622671 () Bool)

(assert (=> b!648878 m!622671))

(assert (=> b!648878 m!622645))

(declare-fun m!622673 () Bool)

(assert (=> b!648878 m!622673))

(declare-fun m!622675 () Bool)

(assert (=> b!648878 m!622675))

(declare-fun m!622677 () Bool)

(assert (=> b!648878 m!622677))

(declare-fun m!622679 () Bool)

(assert (=> b!648878 m!622679))

(assert (=> b!648878 m!622645))

(declare-fun m!622681 () Bool)

(assert (=> b!648878 m!622681))

(declare-fun m!622683 () Bool)

(assert (=> b!648888 m!622683))

(declare-fun m!622685 () Bool)

(assert (=> b!648883 m!622685))

(declare-fun m!622687 () Bool)

(assert (=> b!648881 m!622687))

(declare-fun m!622689 () Bool)

(assert (=> b!648881 m!622689))

(assert (=> b!648881 m!622645))

(declare-fun m!622691 () Bool)

(assert (=> b!648881 m!622691))

(assert (=> b!648881 m!622645))

(assert (=> b!648881 m!622663))

(declare-fun m!622693 () Bool)

(assert (=> b!648881 m!622693))

(declare-fun m!622695 () Bool)

(assert (=> b!648881 m!622695))

(declare-fun m!622697 () Bool)

(assert (=> b!648881 m!622697))

(assert (=> b!648889 m!622645))

(declare-fun m!622699 () Bool)

(assert (=> b!648895 m!622699))

(declare-fun m!622701 () Bool)

(assert (=> b!648890 m!622701))

(assert (=> b!648874 m!622645))

(assert (=> b!648874 m!622645))

(assert (=> b!648874 m!622655))

(assert (=> b!648884 m!622645))

(assert (=> b!648884 m!622663))

(declare-fun m!622703 () Bool)

(assert (=> b!648884 m!622703))

(assert (=> b!648896 m!622645))

(assert (=> b!648896 m!622645))

(assert (=> b!648896 m!622651))

(declare-fun m!622705 () Bool)

(assert (=> b!648872 m!622705))

(assert (=> b!648872 m!622645))

(assert (=> b!648872 m!622645))

(declare-fun m!622707 () Bool)

(assert (=> b!648872 m!622707))

(declare-fun m!622709 () Bool)

(assert (=> b!648877 m!622709))

(declare-fun m!622711 () Bool)

(assert (=> start!58914 m!622711))

(declare-fun m!622713 () Bool)

(assert (=> start!58914 m!622713))

(declare-fun m!622715 () Bool)

(assert (=> b!648875 m!622715))

(check-sat (not b!648890) (not b!648881) (not b!648877) (not b!648898) (not b!648874) (not b!648895) (not b!648876) (not b!648872) (not b!648882) (not b!648891) (not b!648879) (not b!648896) (not b!648878) (not b!648875) (not b!648893) (not start!58914) (not b!648883) (not b!648888))
(check-sat)
