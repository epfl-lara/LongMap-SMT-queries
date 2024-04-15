; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58424 () Bool)

(assert start!58424)

(declare-fun b!644933 () Bool)

(declare-fun e!369568 () Bool)

(declare-fun e!369561 () Bool)

(assert (=> b!644933 (= e!369568 e!369561)))

(declare-fun res!417888 () Bool)

(assert (=> b!644933 (=> (not res!417888) (not e!369561))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6874 0))(
  ( (MissingZero!6874 (index!29831 (_ BitVec 32))) (Found!6874 (index!29832 (_ BitVec 32))) (Intermediate!6874 (undefined!7686 Bool) (index!29833 (_ BitVec 32)) (x!58614 (_ BitVec 32))) (Undefined!6874) (MissingVacant!6874 (index!29834 (_ BitVec 32))) )
))
(declare-fun lt!298898 () SeekEntryResult!6874)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38451 0))(
  ( (array!38452 (arr!18437 (Array (_ BitVec 32) (_ BitVec 64))) (size!18802 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38451)

(assert (=> b!644933 (= res!417888 (and (= lt!298898 (Found!6874 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18437 a!2986) index!984) (select (arr!18437 a!2986) j!136))) (not (= (select (arr!18437 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38451 (_ BitVec 32)) SeekEntryResult!6874)

(assert (=> b!644933 (= lt!298898 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18437 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644934 () Bool)

(declare-fun res!417871 () Bool)

(declare-fun e!369558 () Bool)

(assert (=> b!644934 (=> (not res!417871) (not e!369558))))

(declare-datatypes ((List!12517 0))(
  ( (Nil!12514) (Cons!12513 (h!13558 (_ BitVec 64)) (t!18736 List!12517)) )
))
(declare-fun arrayNoDuplicates!0 (array!38451 (_ BitVec 32) List!12517) Bool)

(assert (=> b!644934 (= res!417871 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12514))))

(declare-fun b!644935 () Bool)

(declare-fun res!417889 () Bool)

(assert (=> b!644935 (=> (not res!417889) (not e!369558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38451 (_ BitVec 32)) Bool)

(assert (=> b!644935 (= res!417889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644936 () Bool)

(declare-fun e!369569 () Bool)

(declare-fun e!369567 () Bool)

(assert (=> b!644936 (= e!369569 e!369567)))

(declare-fun res!417879 () Bool)

(assert (=> b!644936 (=> res!417879 e!369567)))

(declare-fun lt!298906 () (_ BitVec 64))

(declare-fun lt!298907 () (_ BitVec 64))

(assert (=> b!644936 (= res!417879 (or (not (= (select (arr!18437 a!2986) j!136) lt!298907)) (not (= (select (arr!18437 a!2986) j!136) lt!298906)) (bvsge j!136 index!984)))))

(declare-fun res!417877 () Bool)

(declare-fun e!369564 () Bool)

(assert (=> start!58424 (=> (not res!417877) (not e!369564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58424 (= res!417877 (validMask!0 mask!3053))))

(assert (=> start!58424 e!369564))

(assert (=> start!58424 true))

(declare-fun array_inv!14320 (array!38451) Bool)

(assert (=> start!58424 (array_inv!14320 a!2986)))

(declare-fun b!644937 () Bool)

(declare-datatypes ((Unit!21872 0))(
  ( (Unit!21873) )
))
(declare-fun e!369562 () Unit!21872)

(declare-fun Unit!21874 () Unit!21872)

(assert (=> b!644937 (= e!369562 Unit!21874)))

(declare-fun b!644938 () Bool)

(declare-fun Unit!21875 () Unit!21872)

(assert (=> b!644938 (= e!369562 Unit!21875)))

(declare-fun lt!298908 () array!38451)

(declare-fun lt!298893 () Unit!21872)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38451 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21872)

(assert (=> b!644938 (= lt!298893 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298908 (select (arr!18437 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644938 (arrayContainsKey!0 lt!298908 (select (arr!18437 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298896 () Unit!21872)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38451 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12517) Unit!21872)

(assert (=> b!644938 (= lt!298896 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12514))))

(assert (=> b!644938 (arrayNoDuplicates!0 lt!298908 #b00000000000000000000000000000000 Nil!12514)))

(declare-fun lt!298897 () Unit!21872)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38451 (_ BitVec 32) (_ BitVec 32)) Unit!21872)

(assert (=> b!644938 (= lt!298897 (lemmaNoDuplicateFromThenFromBigger!0 lt!298908 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644938 (arrayNoDuplicates!0 lt!298908 j!136 Nil!12514)))

(declare-fun lt!298904 () Unit!21872)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38451 (_ BitVec 64) (_ BitVec 32) List!12517) Unit!21872)

(assert (=> b!644938 (= lt!298904 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298908 (select (arr!18437 a!2986) j!136) j!136 Nil!12514))))

(assert (=> b!644938 false))

(declare-fun b!644939 () Bool)

(declare-fun res!417885 () Bool)

(assert (=> b!644939 (=> (not res!417885) (not e!369564))))

(assert (=> b!644939 (= res!417885 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644940 () Bool)

(declare-fun e!369570 () Bool)

(assert (=> b!644940 (= e!369570 true)))

(assert (=> b!644940 (arrayContainsKey!0 lt!298908 (select (arr!18437 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!298900 () Unit!21872)

(assert (=> b!644940 (= lt!298900 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298908 (select (arr!18437 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!369563 () Bool)

(assert (=> b!644940 e!369563))

(declare-fun res!417880 () Bool)

(assert (=> b!644940 (=> (not res!417880) (not e!369563))))

(assert (=> b!644940 (= res!417880 (arrayContainsKey!0 lt!298908 (select (arr!18437 a!2986) j!136) j!136))))

(declare-fun b!644941 () Bool)

(declare-fun e!369559 () Bool)

(declare-fun e!369572 () Bool)

(assert (=> b!644941 (= e!369559 e!369572)))

(declare-fun res!417875 () Bool)

(assert (=> b!644941 (=> res!417875 e!369572)))

(assert (=> b!644941 (= res!417875 (or (not (= (select (arr!18437 a!2986) j!136) lt!298907)) (not (= (select (arr!18437 a!2986) j!136) lt!298906))))))

(assert (=> b!644941 e!369569))

(declare-fun res!417881 () Bool)

(assert (=> b!644941 (=> (not res!417881) (not e!369569))))

(assert (=> b!644941 (= res!417881 (= lt!298906 (select (arr!18437 a!2986) j!136)))))

(assert (=> b!644941 (= lt!298906 (select (store (arr!18437 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!644942 () Bool)

(assert (=> b!644942 (= e!369564 e!369558)))

(declare-fun res!417886 () Bool)

(assert (=> b!644942 (=> (not res!417886) (not e!369558))))

(declare-fun lt!298905 () SeekEntryResult!6874)

(assert (=> b!644942 (= res!417886 (or (= lt!298905 (MissingZero!6874 i!1108)) (= lt!298905 (MissingVacant!6874 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38451 (_ BitVec 32)) SeekEntryResult!6874)

(assert (=> b!644942 (= lt!298905 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!369560 () Bool)

(declare-fun b!644943 () Bool)

(assert (=> b!644943 (= e!369560 (arrayContainsKey!0 lt!298908 (select (arr!18437 a!2986) j!136) index!984))))

(declare-fun b!644944 () Bool)

(declare-fun e!369566 () Bool)

(declare-fun lt!298901 () SeekEntryResult!6874)

(assert (=> b!644944 (= e!369566 (= lt!298898 lt!298901))))

(declare-fun b!644945 () Bool)

(assert (=> b!644945 (= e!369572 e!369570)))

(declare-fun res!417887 () Bool)

(assert (=> b!644945 (=> res!417887 e!369570)))

(assert (=> b!644945 (= res!417887 (bvsge index!984 j!136))))

(declare-fun lt!298895 () Unit!21872)

(assert (=> b!644945 (= lt!298895 e!369562)))

(declare-fun c!73899 () Bool)

(assert (=> b!644945 (= c!73899 (bvslt j!136 index!984))))

(declare-fun b!644946 () Bool)

(assert (=> b!644946 (= e!369567 e!369560)))

(declare-fun res!417876 () Bool)

(assert (=> b!644946 (=> (not res!417876) (not e!369560))))

(assert (=> b!644946 (= res!417876 (arrayContainsKey!0 lt!298908 (select (arr!18437 a!2986) j!136) j!136))))

(declare-fun b!644947 () Bool)

(assert (=> b!644947 (= e!369563 (arrayContainsKey!0 lt!298908 (select (arr!18437 a!2986) j!136) index!984))))

(declare-fun b!644948 () Bool)

(declare-fun res!417873 () Bool)

(assert (=> b!644948 (=> (not res!417873) (not e!369564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644948 (= res!417873 (validKeyInArray!0 k0!1786))))

(declare-fun b!644949 () Bool)

(declare-fun e!369571 () Unit!21872)

(declare-fun Unit!21876 () Unit!21872)

(assert (=> b!644949 (= e!369571 Unit!21876)))

(assert (=> b!644949 false))

(declare-fun b!644950 () Bool)

(declare-fun res!417882 () Bool)

(assert (=> b!644950 (=> (not res!417882) (not e!369558))))

(assert (=> b!644950 (= res!417882 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18437 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644951 () Bool)

(declare-fun res!417872 () Bool)

(assert (=> b!644951 (=> (not res!417872) (not e!369564))))

(assert (=> b!644951 (= res!417872 (validKeyInArray!0 (select (arr!18437 a!2986) j!136)))))

(declare-fun b!644952 () Bool)

(assert (=> b!644952 (= e!369561 (not e!369559))))

(declare-fun res!417884 () Bool)

(assert (=> b!644952 (=> res!417884 e!369559)))

(declare-fun lt!298902 () SeekEntryResult!6874)

(assert (=> b!644952 (= res!417884 (not (= lt!298902 (Found!6874 index!984))))))

(declare-fun lt!298894 () Unit!21872)

(assert (=> b!644952 (= lt!298894 e!369571)))

(declare-fun c!73898 () Bool)

(assert (=> b!644952 (= c!73898 (= lt!298902 Undefined!6874))))

(assert (=> b!644952 (= lt!298902 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298907 lt!298908 mask!3053))))

(assert (=> b!644952 e!369566))

(declare-fun res!417878 () Bool)

(assert (=> b!644952 (=> (not res!417878) (not e!369566))))

(declare-fun lt!298899 () (_ BitVec 32))

(assert (=> b!644952 (= res!417878 (= lt!298901 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298899 vacantSpotIndex!68 lt!298907 lt!298908 mask!3053)))))

(assert (=> b!644952 (= lt!298901 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298899 vacantSpotIndex!68 (select (arr!18437 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644952 (= lt!298907 (select (store (arr!18437 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298903 () Unit!21872)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21872)

(assert (=> b!644952 (= lt!298903 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298899 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644952 (= lt!298899 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644953 () Bool)

(declare-fun res!417874 () Bool)

(assert (=> b!644953 (=> (not res!417874) (not e!369564))))

(assert (=> b!644953 (= res!417874 (and (= (size!18802 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18802 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18802 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644954 () Bool)

(declare-fun Unit!21877 () Unit!21872)

(assert (=> b!644954 (= e!369571 Unit!21877)))

(declare-fun b!644955 () Bool)

(assert (=> b!644955 (= e!369558 e!369568)))

(declare-fun res!417883 () Bool)

(assert (=> b!644955 (=> (not res!417883) (not e!369568))))

(assert (=> b!644955 (= res!417883 (= (select (store (arr!18437 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644955 (= lt!298908 (array!38452 (store (arr!18437 a!2986) i!1108 k0!1786) (size!18802 a!2986)))))

(assert (= (and start!58424 res!417877) b!644953))

(assert (= (and b!644953 res!417874) b!644951))

(assert (= (and b!644951 res!417872) b!644948))

(assert (= (and b!644948 res!417873) b!644939))

(assert (= (and b!644939 res!417885) b!644942))

(assert (= (and b!644942 res!417886) b!644935))

(assert (= (and b!644935 res!417889) b!644934))

(assert (= (and b!644934 res!417871) b!644950))

(assert (= (and b!644950 res!417882) b!644955))

(assert (= (and b!644955 res!417883) b!644933))

(assert (= (and b!644933 res!417888) b!644952))

(assert (= (and b!644952 res!417878) b!644944))

(assert (= (and b!644952 c!73898) b!644949))

(assert (= (and b!644952 (not c!73898)) b!644954))

(assert (= (and b!644952 (not res!417884)) b!644941))

(assert (= (and b!644941 res!417881) b!644936))

(assert (= (and b!644936 (not res!417879)) b!644946))

(assert (= (and b!644946 res!417876) b!644943))

(assert (= (and b!644941 (not res!417875)) b!644945))

(assert (= (and b!644945 c!73899) b!644938))

(assert (= (and b!644945 (not c!73899)) b!644937))

(assert (= (and b!644945 (not res!417887)) b!644940))

(assert (= (and b!644940 res!417880) b!644947))

(declare-fun m!617979 () Bool)

(assert (=> b!644943 m!617979))

(assert (=> b!644943 m!617979))

(declare-fun m!617981 () Bool)

(assert (=> b!644943 m!617981))

(assert (=> b!644941 m!617979))

(declare-fun m!617983 () Bool)

(assert (=> b!644941 m!617983))

(declare-fun m!617985 () Bool)

(assert (=> b!644941 m!617985))

(assert (=> b!644940 m!617979))

(assert (=> b!644940 m!617979))

(declare-fun m!617987 () Bool)

(assert (=> b!644940 m!617987))

(assert (=> b!644940 m!617979))

(declare-fun m!617989 () Bool)

(assert (=> b!644940 m!617989))

(assert (=> b!644940 m!617979))

(declare-fun m!617991 () Bool)

(assert (=> b!644940 m!617991))

(declare-fun m!617993 () Bool)

(assert (=> b!644942 m!617993))

(assert (=> b!644936 m!617979))

(declare-fun m!617995 () Bool)

(assert (=> b!644939 m!617995))

(declare-fun m!617997 () Bool)

(assert (=> b!644948 m!617997))

(declare-fun m!617999 () Bool)

(assert (=> start!58424 m!617999))

(declare-fun m!618001 () Bool)

(assert (=> start!58424 m!618001))

(assert (=> b!644938 m!617979))

(declare-fun m!618003 () Bool)

(assert (=> b!644938 m!618003))

(declare-fun m!618005 () Bool)

(assert (=> b!644938 m!618005))

(assert (=> b!644938 m!617979))

(declare-fun m!618007 () Bool)

(assert (=> b!644938 m!618007))

(assert (=> b!644938 m!617979))

(declare-fun m!618009 () Bool)

(assert (=> b!644938 m!618009))

(declare-fun m!618011 () Bool)

(assert (=> b!644938 m!618011))

(assert (=> b!644938 m!617979))

(declare-fun m!618013 () Bool)

(assert (=> b!644938 m!618013))

(declare-fun m!618015 () Bool)

(assert (=> b!644938 m!618015))

(declare-fun m!618017 () Bool)

(assert (=> b!644952 m!618017))

(assert (=> b!644952 m!617979))

(assert (=> b!644952 m!617983))

(declare-fun m!618019 () Bool)

(assert (=> b!644952 m!618019))

(declare-fun m!618021 () Bool)

(assert (=> b!644952 m!618021))

(declare-fun m!618023 () Bool)

(assert (=> b!644952 m!618023))

(assert (=> b!644952 m!617979))

(declare-fun m!618025 () Bool)

(assert (=> b!644952 m!618025))

(declare-fun m!618027 () Bool)

(assert (=> b!644952 m!618027))

(assert (=> b!644955 m!617983))

(declare-fun m!618029 () Bool)

(assert (=> b!644955 m!618029))

(assert (=> b!644946 m!617979))

(assert (=> b!644946 m!617979))

(assert (=> b!644946 m!617991))

(declare-fun m!618031 () Bool)

(assert (=> b!644950 m!618031))

(declare-fun m!618033 () Bool)

(assert (=> b!644934 m!618033))

(declare-fun m!618035 () Bool)

(assert (=> b!644933 m!618035))

(assert (=> b!644933 m!617979))

(assert (=> b!644933 m!617979))

(declare-fun m!618037 () Bool)

(assert (=> b!644933 m!618037))

(assert (=> b!644951 m!617979))

(assert (=> b!644951 m!617979))

(declare-fun m!618039 () Bool)

(assert (=> b!644951 m!618039))

(assert (=> b!644947 m!617979))

(assert (=> b!644947 m!617979))

(assert (=> b!644947 m!617981))

(declare-fun m!618041 () Bool)

(assert (=> b!644935 m!618041))

(check-sat (not b!644946) (not b!644942) (not b!644951) (not b!644948) (not b!644939) (not b!644943) (not b!644934) (not b!644940) (not b!644935) (not start!58424) (not b!644933) (not b!644947) (not b!644952) (not b!644938))
(check-sat)
