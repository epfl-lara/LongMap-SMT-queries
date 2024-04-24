; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58374 () Bool)

(assert start!58374)

(declare-fun b!643884 () Bool)

(declare-datatypes ((Unit!21765 0))(
  ( (Unit!21766) )
))
(declare-fun e!368865 () Unit!21765)

(declare-fun Unit!21767 () Unit!21765)

(assert (=> b!643884 (= e!368865 Unit!21767)))

(assert (=> b!643884 false))

(declare-fun b!643885 () Bool)

(declare-fun res!416980 () Bool)

(declare-fun e!368866 () Bool)

(assert (=> b!643885 (=> (not res!416980) (not e!368866))))

(declare-datatypes ((array!38409 0))(
  ( (array!38410 (arr!18415 (Array (_ BitVec 32) (_ BitVec 64))) (size!18779 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38409)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38409 (_ BitVec 32)) Bool)

(assert (=> b!643885 (= res!416980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!643886 () Bool)

(declare-fun e!368863 () Bool)

(declare-fun lt!298297 () array!38409)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643886 (= e!368863 (arrayContainsKey!0 lt!298297 (select (arr!18415 a!2986) j!136) index!984))))

(declare-fun b!643887 () Bool)

(declare-fun e!368860 () Bool)

(assert (=> b!643887 (= e!368860 true)))

(declare-fun e!368864 () Bool)

(assert (=> b!643887 e!368864))

(declare-fun res!416989 () Bool)

(assert (=> b!643887 (=> (not res!416989) (not e!368864))))

(assert (=> b!643887 (= res!416989 (arrayContainsKey!0 lt!298297 (select (arr!18415 a!2986) j!136) j!136))))

(declare-fun b!643888 () Bool)

(declare-fun e!368871 () Bool)

(assert (=> b!643888 (= e!368871 e!368866)))

(declare-fun res!416978 () Bool)

(assert (=> b!643888 (=> (not res!416978) (not e!368866))))

(declare-datatypes ((SeekEntryResult!6811 0))(
  ( (MissingZero!6811 (index!29576 (_ BitVec 32))) (Found!6811 (index!29577 (_ BitVec 32))) (Intermediate!6811 (undefined!7623 Bool) (index!29578 (_ BitVec 32)) (x!58502 (_ BitVec 32))) (Undefined!6811) (MissingVacant!6811 (index!29579 (_ BitVec 32))) )
))
(declare-fun lt!298307 () SeekEntryResult!6811)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!643888 (= res!416978 (or (= lt!298307 (MissingZero!6811 i!1108)) (= lt!298307 (MissingVacant!6811 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38409 (_ BitVec 32)) SeekEntryResult!6811)

(assert (=> b!643888 (= lt!298307 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!643889 () Bool)

(declare-fun Unit!21768 () Unit!21765)

(assert (=> b!643889 (= e!368865 Unit!21768)))

(declare-fun b!643890 () Bool)

(declare-fun e!368862 () Bool)

(declare-fun e!368858 () Bool)

(assert (=> b!643890 (= e!368862 e!368858)))

(declare-fun res!416986 () Bool)

(assert (=> b!643890 (=> (not res!416986) (not e!368858))))

(declare-fun lt!298303 () SeekEntryResult!6811)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!643890 (= res!416986 (and (= lt!298303 (Found!6811 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18415 a!2986) index!984) (select (arr!18415 a!2986) j!136))) (not (= (select (arr!18415 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38409 (_ BitVec 32)) SeekEntryResult!6811)

(assert (=> b!643890 (= lt!298303 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18415 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643891 () Bool)

(declare-fun res!416981 () Bool)

(assert (=> b!643891 (=> (not res!416981) (not e!368871))))

(assert (=> b!643891 (= res!416981 (and (= (size!18779 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18779 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18779 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643892 () Bool)

(declare-fun res!416991 () Bool)

(assert (=> b!643892 (=> (not res!416991) (not e!368871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643892 (= res!416991 (validKeyInArray!0 (select (arr!18415 a!2986) j!136)))))

(declare-fun b!643894 () Bool)

(declare-fun e!368867 () Bool)

(declare-fun e!368868 () Bool)

(assert (=> b!643894 (= e!368867 e!368868)))

(declare-fun res!416984 () Bool)

(assert (=> b!643894 (=> res!416984 e!368868)))

(declare-fun lt!298298 () (_ BitVec 64))

(declare-fun lt!298300 () (_ BitVec 64))

(assert (=> b!643894 (= res!416984 (or (not (= (select (arr!18415 a!2986) j!136) lt!298300)) (not (= (select (arr!18415 a!2986) j!136) lt!298298))))))

(declare-fun e!368861 () Bool)

(assert (=> b!643894 e!368861))

(declare-fun res!416977 () Bool)

(assert (=> b!643894 (=> (not res!416977) (not e!368861))))

(assert (=> b!643894 (= res!416977 (= lt!298298 (select (arr!18415 a!2986) j!136)))))

(assert (=> b!643894 (= lt!298298 (select (store (arr!18415 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!643895 () Bool)

(assert (=> b!643895 (= e!368858 (not e!368867))))

(declare-fun res!416992 () Bool)

(assert (=> b!643895 (=> res!416992 e!368867)))

(declare-fun lt!298305 () SeekEntryResult!6811)

(assert (=> b!643895 (= res!416992 (not (= lt!298305 (Found!6811 index!984))))))

(declare-fun lt!298304 () Unit!21765)

(assert (=> b!643895 (= lt!298304 e!368865)))

(declare-fun c!73822 () Bool)

(assert (=> b!643895 (= c!73822 (= lt!298305 Undefined!6811))))

(assert (=> b!643895 (= lt!298305 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298300 lt!298297 mask!3053))))

(declare-fun e!368869 () Bool)

(assert (=> b!643895 e!368869))

(declare-fun res!416990 () Bool)

(assert (=> b!643895 (=> (not res!416990) (not e!368869))))

(declare-fun lt!298302 () (_ BitVec 32))

(declare-fun lt!298309 () SeekEntryResult!6811)

(assert (=> b!643895 (= res!416990 (= lt!298309 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298302 vacantSpotIndex!68 lt!298300 lt!298297 mask!3053)))))

(assert (=> b!643895 (= lt!298309 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298302 vacantSpotIndex!68 (select (arr!18415 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643895 (= lt!298300 (select (store (arr!18415 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298295 () Unit!21765)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21765)

(assert (=> b!643895 (= lt!298295 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298302 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643895 (= lt!298302 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!643896 () Bool)

(declare-fun e!368857 () Unit!21765)

(declare-fun Unit!21769 () Unit!21765)

(assert (=> b!643896 (= e!368857 Unit!21769)))

(declare-fun lt!298296 () Unit!21765)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38409 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21765)

(assert (=> b!643896 (= lt!298296 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298297 (select (arr!18415 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643896 (arrayContainsKey!0 lt!298297 (select (arr!18415 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298299 () Unit!21765)

(declare-datatypes ((List!12363 0))(
  ( (Nil!12360) (Cons!12359 (h!13407 (_ BitVec 64)) (t!18583 List!12363)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38409 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12363) Unit!21765)

(assert (=> b!643896 (= lt!298299 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12360))))

(declare-fun arrayNoDuplicates!0 (array!38409 (_ BitVec 32) List!12363) Bool)

(assert (=> b!643896 (arrayNoDuplicates!0 lt!298297 #b00000000000000000000000000000000 Nil!12360)))

(declare-fun lt!298301 () Unit!21765)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38409 (_ BitVec 32) (_ BitVec 32)) Unit!21765)

(assert (=> b!643896 (= lt!298301 (lemmaNoDuplicateFromThenFromBigger!0 lt!298297 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643896 (arrayNoDuplicates!0 lt!298297 j!136 Nil!12360)))

(declare-fun lt!298308 () Unit!21765)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38409 (_ BitVec 64) (_ BitVec 32) List!12363) Unit!21765)

(assert (=> b!643896 (= lt!298308 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298297 (select (arr!18415 a!2986) j!136) j!136 Nil!12360))))

(assert (=> b!643896 false))

(declare-fun b!643897 () Bool)

(assert (=> b!643897 (= e!368864 (arrayContainsKey!0 lt!298297 (select (arr!18415 a!2986) j!136) index!984))))

(declare-fun b!643898 () Bool)

(declare-fun e!368859 () Bool)

(assert (=> b!643898 (= e!368861 e!368859)))

(declare-fun res!416993 () Bool)

(assert (=> b!643898 (=> res!416993 e!368859)))

(assert (=> b!643898 (= res!416993 (or (not (= (select (arr!18415 a!2986) j!136) lt!298300)) (not (= (select (arr!18415 a!2986) j!136) lt!298298)) (bvsge j!136 index!984)))))

(declare-fun b!643899 () Bool)

(declare-fun res!416988 () Bool)

(assert (=> b!643899 (=> (not res!416988) (not e!368866))))

(assert (=> b!643899 (= res!416988 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12360))))

(declare-fun b!643900 () Bool)

(declare-fun res!416994 () Bool)

(assert (=> b!643900 (=> (not res!416994) (not e!368871))))

(assert (=> b!643900 (= res!416994 (validKeyInArray!0 k0!1786))))

(declare-fun b!643901 () Bool)

(declare-fun Unit!21770 () Unit!21765)

(assert (=> b!643901 (= e!368857 Unit!21770)))

(declare-fun b!643902 () Bool)

(declare-fun res!416982 () Bool)

(assert (=> b!643902 (=> (not res!416982) (not e!368866))))

(assert (=> b!643902 (= res!416982 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18415 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643903 () Bool)

(assert (=> b!643903 (= e!368866 e!368862)))

(declare-fun res!416987 () Bool)

(assert (=> b!643903 (=> (not res!416987) (not e!368862))))

(assert (=> b!643903 (= res!416987 (= (select (store (arr!18415 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643903 (= lt!298297 (array!38410 (store (arr!18415 a!2986) i!1108 k0!1786) (size!18779 a!2986)))))

(declare-fun b!643904 () Bool)

(assert (=> b!643904 (= e!368868 e!368860)))

(declare-fun res!416985 () Bool)

(assert (=> b!643904 (=> res!416985 e!368860)))

(assert (=> b!643904 (= res!416985 (bvsge index!984 j!136))))

(declare-fun lt!298306 () Unit!21765)

(assert (=> b!643904 (= lt!298306 e!368857)))

(declare-fun c!73823 () Bool)

(assert (=> b!643904 (= c!73823 (bvslt j!136 index!984))))

(declare-fun b!643893 () Bool)

(declare-fun res!416983 () Bool)

(assert (=> b!643893 (=> (not res!416983) (not e!368871))))

(assert (=> b!643893 (= res!416983 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!416979 () Bool)

(assert (=> start!58374 (=> (not res!416979) (not e!368871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58374 (= res!416979 (validMask!0 mask!3053))))

(assert (=> start!58374 e!368871))

(assert (=> start!58374 true))

(declare-fun array_inv!14274 (array!38409) Bool)

(assert (=> start!58374 (array_inv!14274 a!2986)))

(declare-fun b!643905 () Bool)

(assert (=> b!643905 (= e!368869 (= lt!298303 lt!298309))))

(declare-fun b!643906 () Bool)

(assert (=> b!643906 (= e!368859 e!368863)))

(declare-fun res!416995 () Bool)

(assert (=> b!643906 (=> (not res!416995) (not e!368863))))

(assert (=> b!643906 (= res!416995 (arrayContainsKey!0 lt!298297 (select (arr!18415 a!2986) j!136) j!136))))

(assert (= (and start!58374 res!416979) b!643891))

(assert (= (and b!643891 res!416981) b!643892))

(assert (= (and b!643892 res!416991) b!643900))

(assert (= (and b!643900 res!416994) b!643893))

(assert (= (and b!643893 res!416983) b!643888))

(assert (= (and b!643888 res!416978) b!643885))

(assert (= (and b!643885 res!416980) b!643899))

(assert (= (and b!643899 res!416988) b!643902))

(assert (= (and b!643902 res!416982) b!643903))

(assert (= (and b!643903 res!416987) b!643890))

(assert (= (and b!643890 res!416986) b!643895))

(assert (= (and b!643895 res!416990) b!643905))

(assert (= (and b!643895 c!73822) b!643884))

(assert (= (and b!643895 (not c!73822)) b!643889))

(assert (= (and b!643895 (not res!416992)) b!643894))

(assert (= (and b!643894 res!416977) b!643898))

(assert (= (and b!643898 (not res!416993)) b!643906))

(assert (= (and b!643906 res!416995) b!643886))

(assert (= (and b!643894 (not res!416984)) b!643904))

(assert (= (and b!643904 c!73823) b!643896))

(assert (= (and b!643904 (not c!73823)) b!643901))

(assert (= (and b!643904 (not res!416985)) b!643887))

(assert (= (and b!643887 res!416989) b!643897))

(declare-fun m!617995 () Bool)

(assert (=> b!643902 m!617995))

(declare-fun m!617997 () Bool)

(assert (=> b!643887 m!617997))

(assert (=> b!643887 m!617997))

(declare-fun m!617999 () Bool)

(assert (=> b!643887 m!617999))

(assert (=> b!643897 m!617997))

(assert (=> b!643897 m!617997))

(declare-fun m!618001 () Bool)

(assert (=> b!643897 m!618001))

(assert (=> b!643886 m!617997))

(assert (=> b!643886 m!617997))

(assert (=> b!643886 m!618001))

(declare-fun m!618003 () Bool)

(assert (=> b!643900 m!618003))

(declare-fun m!618005 () Bool)

(assert (=> b!643888 m!618005))

(assert (=> b!643894 m!617997))

(declare-fun m!618007 () Bool)

(assert (=> b!643894 m!618007))

(declare-fun m!618009 () Bool)

(assert (=> b!643894 m!618009))

(assert (=> b!643896 m!617997))

(declare-fun m!618011 () Bool)

(assert (=> b!643896 m!618011))

(declare-fun m!618013 () Bool)

(assert (=> b!643896 m!618013))

(assert (=> b!643896 m!617997))

(declare-fun m!618015 () Bool)

(assert (=> b!643896 m!618015))

(declare-fun m!618017 () Bool)

(assert (=> b!643896 m!618017))

(assert (=> b!643896 m!617997))

(declare-fun m!618019 () Bool)

(assert (=> b!643896 m!618019))

(declare-fun m!618021 () Bool)

(assert (=> b!643896 m!618021))

(declare-fun m!618023 () Bool)

(assert (=> b!643896 m!618023))

(assert (=> b!643896 m!617997))

(declare-fun m!618025 () Bool)

(assert (=> b!643895 m!618025))

(declare-fun m!618027 () Bool)

(assert (=> b!643895 m!618027))

(declare-fun m!618029 () Bool)

(assert (=> b!643895 m!618029))

(assert (=> b!643895 m!617997))

(assert (=> b!643895 m!618007))

(assert (=> b!643895 m!617997))

(declare-fun m!618031 () Bool)

(assert (=> b!643895 m!618031))

(declare-fun m!618033 () Bool)

(assert (=> b!643895 m!618033))

(declare-fun m!618035 () Bool)

(assert (=> b!643895 m!618035))

(declare-fun m!618037 () Bool)

(assert (=> b!643893 m!618037))

(assert (=> b!643903 m!618007))

(declare-fun m!618039 () Bool)

(assert (=> b!643903 m!618039))

(declare-fun m!618041 () Bool)

(assert (=> b!643890 m!618041))

(assert (=> b!643890 m!617997))

(assert (=> b!643890 m!617997))

(declare-fun m!618043 () Bool)

(assert (=> b!643890 m!618043))

(assert (=> b!643898 m!617997))

(declare-fun m!618045 () Bool)

(assert (=> start!58374 m!618045))

(declare-fun m!618047 () Bool)

(assert (=> start!58374 m!618047))

(assert (=> b!643892 m!617997))

(assert (=> b!643892 m!617997))

(declare-fun m!618049 () Bool)

(assert (=> b!643892 m!618049))

(assert (=> b!643906 m!617997))

(assert (=> b!643906 m!617997))

(assert (=> b!643906 m!617999))

(declare-fun m!618051 () Bool)

(assert (=> b!643899 m!618051))

(declare-fun m!618053 () Bool)

(assert (=> b!643885 m!618053))

(check-sat (not b!643900) (not b!643899) (not b!643885) (not b!643895) (not b!643887) (not b!643896) (not b!643888) (not b!643893) (not b!643886) (not b!643892) (not b!643897) (not b!643890) (not b!643906) (not start!58374))
(check-sat)
