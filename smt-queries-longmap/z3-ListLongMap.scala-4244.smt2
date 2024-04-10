; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58852 () Bool)

(assert start!58852)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!371945 () Bool)

(declare-fun b!648487 () Bool)

(declare-datatypes ((array!38514 0))(
  ( (array!38515 (arr!18463 (Array (_ BitVec 32) (_ BitVec 64))) (size!18827 (_ BitVec 32))) )
))
(declare-fun lt!300972 () array!38514)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38514)

(declare-fun arrayContainsKey!0 (array!38514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648487 (= e!371945 (arrayContainsKey!0 lt!300972 (select (arr!18463 a!2986) j!136) index!984))))

(declare-fun b!648488 () Bool)

(declare-datatypes ((Unit!22044 0))(
  ( (Unit!22045) )
))
(declare-fun e!371949 () Unit!22044)

(declare-fun Unit!22046 () Unit!22044)

(assert (=> b!648488 (= e!371949 Unit!22046)))

(assert (=> b!648488 false))

(declare-fun b!648489 () Bool)

(declare-fun res!420136 () Bool)

(declare-fun e!371934 () Bool)

(assert (=> b!648489 (=> res!420136 e!371934)))

(declare-datatypes ((List!12504 0))(
  ( (Nil!12501) (Cons!12500 (h!13545 (_ BitVec 64)) (t!18732 List!12504)) )
))
(declare-fun contains!3159 (List!12504 (_ BitVec 64)) Bool)

(assert (=> b!648489 (= res!420136 (contains!3159 Nil!12501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648490 () Bool)

(declare-fun e!371935 () Bool)

(assert (=> b!648490 (= e!371935 e!371934)))

(declare-fun res!420124 () Bool)

(assert (=> b!648490 (=> res!420124 e!371934)))

(assert (=> b!648490 (= res!420124 (or (bvsge (size!18827 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18827 a!2986))))))

(assert (=> b!648490 (arrayContainsKey!0 lt!300972 (select (arr!18463 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300982 () Unit!22044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38514 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22044)

(assert (=> b!648490 (= lt!300982 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300972 (select (arr!18463 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!371947 () Bool)

(assert (=> b!648490 e!371947))

(declare-fun res!420130 () Bool)

(assert (=> b!648490 (=> (not res!420130) (not e!371947))))

(assert (=> b!648490 (= res!420130 (arrayContainsKey!0 lt!300972 (select (arr!18463 a!2986) j!136) j!136))))

(declare-fun b!648491 () Bool)

(declare-fun e!371941 () Unit!22044)

(declare-fun Unit!22047 () Unit!22044)

(assert (=> b!648491 (= e!371941 Unit!22047)))

(declare-fun b!648492 () Bool)

(declare-fun Unit!22048 () Unit!22044)

(assert (=> b!648492 (= e!371941 Unit!22048)))

(declare-fun lt!300985 () Unit!22044)

(assert (=> b!648492 (= lt!300985 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300972 (select (arr!18463 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648492 (arrayContainsKey!0 lt!300972 (select (arr!18463 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300974 () Unit!22044)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38514 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12504) Unit!22044)

(assert (=> b!648492 (= lt!300974 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12501))))

(declare-fun arrayNoDuplicates!0 (array!38514 (_ BitVec 32) List!12504) Bool)

(assert (=> b!648492 (arrayNoDuplicates!0 lt!300972 #b00000000000000000000000000000000 Nil!12501)))

(declare-fun lt!300979 () Unit!22044)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38514 (_ BitVec 32) (_ BitVec 32)) Unit!22044)

(assert (=> b!648492 (= lt!300979 (lemmaNoDuplicateFromThenFromBigger!0 lt!300972 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648492 (arrayNoDuplicates!0 lt!300972 j!136 Nil!12501)))

(declare-fun lt!300973 () Unit!22044)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38514 (_ BitVec 64) (_ BitVec 32) List!12504) Unit!22044)

(assert (=> b!648492 (= lt!300973 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300972 (select (arr!18463 a!2986) j!136) j!136 Nil!12501))))

(assert (=> b!648492 false))

(declare-fun b!648493 () Bool)

(declare-fun res!420132 () Bool)

(declare-fun e!371948 () Bool)

(assert (=> b!648493 (=> (not res!420132) (not e!371948))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!648493 (= res!420132 (and (= (size!18827 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18827 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18827 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648494 () Bool)

(declare-fun res!420134 () Bool)

(assert (=> b!648494 (=> (not res!420134) (not e!371948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648494 (= res!420134 (validKeyInArray!0 (select (arr!18463 a!2986) j!136)))))

(declare-fun b!648495 () Bool)

(declare-fun e!371942 () Bool)

(assert (=> b!648495 (= e!371942 e!371945)))

(declare-fun res!420144 () Bool)

(assert (=> b!648495 (=> (not res!420144) (not e!371945))))

(assert (=> b!648495 (= res!420144 (arrayContainsKey!0 lt!300972 (select (arr!18463 a!2986) j!136) j!136))))

(declare-fun b!648496 () Bool)

(declare-fun res!420129 () Bool)

(assert (=> b!648496 (=> (not res!420129) (not e!371948))))

(assert (=> b!648496 (= res!420129 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648497 () Bool)

(declare-fun e!371936 () Bool)

(declare-fun e!371939 () Bool)

(assert (=> b!648497 (= e!371936 (not e!371939))))

(declare-fun res!420128 () Bool)

(assert (=> b!648497 (=> res!420128 e!371939)))

(declare-datatypes ((SeekEntryResult!6903 0))(
  ( (MissingZero!6903 (index!29959 (_ BitVec 32))) (Found!6903 (index!29960 (_ BitVec 32))) (Intermediate!6903 (undefined!7715 Bool) (index!29961 (_ BitVec 32)) (x!58748 (_ BitVec 32))) (Undefined!6903) (MissingVacant!6903 (index!29962 (_ BitVec 32))) )
))
(declare-fun lt!300970 () SeekEntryResult!6903)

(assert (=> b!648497 (= res!420128 (not (= lt!300970 (Found!6903 index!984))))))

(declare-fun lt!300980 () Unit!22044)

(assert (=> b!648497 (= lt!300980 e!371949)))

(declare-fun c!74549 () Bool)

(assert (=> b!648497 (= c!74549 (= lt!300970 Undefined!6903))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!300971 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38514 (_ BitVec 32)) SeekEntryResult!6903)

(assert (=> b!648497 (= lt!300970 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300971 lt!300972 mask!3053))))

(declare-fun e!371943 () Bool)

(assert (=> b!648497 e!371943))

(declare-fun res!420133 () Bool)

(assert (=> b!648497 (=> (not res!420133) (not e!371943))))

(declare-fun lt!300977 () (_ BitVec 32))

(declare-fun lt!300969 () SeekEntryResult!6903)

(assert (=> b!648497 (= res!420133 (= lt!300969 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300977 vacantSpotIndex!68 lt!300971 lt!300972 mask!3053)))))

(assert (=> b!648497 (= lt!300969 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300977 vacantSpotIndex!68 (select (arr!18463 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648497 (= lt!300971 (select (store (arr!18463 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300978 () Unit!22044)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22044)

(assert (=> b!648497 (= lt!300978 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300977 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648497 (= lt!300977 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!420139 () Bool)

(assert (=> start!58852 (=> (not res!420139) (not e!371948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58852 (= res!420139 (validMask!0 mask!3053))))

(assert (=> start!58852 e!371948))

(assert (=> start!58852 true))

(declare-fun array_inv!14259 (array!38514) Bool)

(assert (=> start!58852 (array_inv!14259 a!2986)))

(declare-fun b!648486 () Bool)

(assert (=> b!648486 (= e!371947 (arrayContainsKey!0 lt!300972 (select (arr!18463 a!2986) j!136) index!984))))

(declare-fun b!648498 () Bool)

(declare-fun Unit!22049 () Unit!22044)

(assert (=> b!648498 (= e!371949 Unit!22049)))

(declare-fun b!648499 () Bool)

(declare-fun e!371946 () Bool)

(assert (=> b!648499 (= e!371946 e!371936)))

(declare-fun res!420141 () Bool)

(assert (=> b!648499 (=> (not res!420141) (not e!371936))))

(declare-fun lt!300981 () SeekEntryResult!6903)

(assert (=> b!648499 (= res!420141 (and (= lt!300981 (Found!6903 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18463 a!2986) index!984) (select (arr!18463 a!2986) j!136))) (not (= (select (arr!18463 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!648499 (= lt!300981 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18463 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648500 () Bool)

(declare-fun res!420146 () Bool)

(assert (=> b!648500 (=> res!420146 e!371934)))

(declare-fun noDuplicate!421 (List!12504) Bool)

(assert (=> b!648500 (= res!420146 (not (noDuplicate!421 Nil!12501)))))

(declare-fun b!648501 () Bool)

(declare-fun res!420127 () Bool)

(declare-fun e!371940 () Bool)

(assert (=> b!648501 (=> (not res!420127) (not e!371940))))

(assert (=> b!648501 (= res!420127 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18463 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648502 () Bool)

(declare-fun e!371938 () Bool)

(assert (=> b!648502 (= e!371938 e!371935)))

(declare-fun res!420125 () Bool)

(assert (=> b!648502 (=> res!420125 e!371935)))

(assert (=> b!648502 (= res!420125 (bvsge index!984 j!136))))

(declare-fun lt!300975 () Unit!22044)

(assert (=> b!648502 (= lt!300975 e!371941)))

(declare-fun c!74548 () Bool)

(assert (=> b!648502 (= c!74548 (bvslt j!136 index!984))))

(declare-fun b!648503 () Bool)

(assert (=> b!648503 (= e!371934 true)))

(declare-fun lt!300983 () Bool)

(assert (=> b!648503 (= lt!300983 (contains!3159 Nil!12501 k0!1786))))

(declare-fun b!648504 () Bool)

(declare-fun res!420126 () Bool)

(assert (=> b!648504 (=> (not res!420126) (not e!371940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38514 (_ BitVec 32)) Bool)

(assert (=> b!648504 (= res!420126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648505 () Bool)

(assert (=> b!648505 (= e!371940 e!371946)))

(declare-fun res!420135 () Bool)

(assert (=> b!648505 (=> (not res!420135) (not e!371946))))

(assert (=> b!648505 (= res!420135 (= (select (store (arr!18463 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648505 (= lt!300972 (array!38515 (store (arr!18463 a!2986) i!1108 k0!1786) (size!18827 a!2986)))))

(declare-fun b!648506 () Bool)

(assert (=> b!648506 (= e!371939 e!371938)))

(declare-fun res!420131 () Bool)

(assert (=> b!648506 (=> res!420131 e!371938)))

(declare-fun lt!300984 () (_ BitVec 64))

(assert (=> b!648506 (= res!420131 (or (not (= (select (arr!18463 a!2986) j!136) lt!300971)) (not (= (select (arr!18463 a!2986) j!136) lt!300984))))))

(declare-fun e!371937 () Bool)

(assert (=> b!648506 e!371937))

(declare-fun res!420145 () Bool)

(assert (=> b!648506 (=> (not res!420145) (not e!371937))))

(assert (=> b!648506 (= res!420145 (= lt!300984 (select (arr!18463 a!2986) j!136)))))

(assert (=> b!648506 (= lt!300984 (select (store (arr!18463 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!648507 () Bool)

(declare-fun res!420140 () Bool)

(assert (=> b!648507 (=> (not res!420140) (not e!371948))))

(assert (=> b!648507 (= res!420140 (validKeyInArray!0 k0!1786))))

(declare-fun b!648508 () Bool)

(declare-fun res!420137 () Bool)

(assert (=> b!648508 (=> res!420137 e!371934)))

(assert (=> b!648508 (= res!420137 (contains!3159 Nil!12501 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648509 () Bool)

(declare-fun res!420143 () Bool)

(assert (=> b!648509 (=> (not res!420143) (not e!371940))))

(assert (=> b!648509 (= res!420143 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12501))))

(declare-fun b!648510 () Bool)

(assert (=> b!648510 (= e!371943 (= lt!300981 lt!300969))))

(declare-fun b!648511 () Bool)

(assert (=> b!648511 (= e!371948 e!371940)))

(declare-fun res!420142 () Bool)

(assert (=> b!648511 (=> (not res!420142) (not e!371940))))

(declare-fun lt!300976 () SeekEntryResult!6903)

(assert (=> b!648511 (= res!420142 (or (= lt!300976 (MissingZero!6903 i!1108)) (= lt!300976 (MissingVacant!6903 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38514 (_ BitVec 32)) SeekEntryResult!6903)

(assert (=> b!648511 (= lt!300976 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!648512 () Bool)

(assert (=> b!648512 (= e!371937 e!371942)))

(declare-fun res!420138 () Bool)

(assert (=> b!648512 (=> res!420138 e!371942)))

(assert (=> b!648512 (= res!420138 (or (not (= (select (arr!18463 a!2986) j!136) lt!300971)) (not (= (select (arr!18463 a!2986) j!136) lt!300984)) (bvsge j!136 index!984)))))

(assert (= (and start!58852 res!420139) b!648493))

(assert (= (and b!648493 res!420132) b!648494))

(assert (= (and b!648494 res!420134) b!648507))

(assert (= (and b!648507 res!420140) b!648496))

(assert (= (and b!648496 res!420129) b!648511))

(assert (= (and b!648511 res!420142) b!648504))

(assert (= (and b!648504 res!420126) b!648509))

(assert (= (and b!648509 res!420143) b!648501))

(assert (= (and b!648501 res!420127) b!648505))

(assert (= (and b!648505 res!420135) b!648499))

(assert (= (and b!648499 res!420141) b!648497))

(assert (= (and b!648497 res!420133) b!648510))

(assert (= (and b!648497 c!74549) b!648488))

(assert (= (and b!648497 (not c!74549)) b!648498))

(assert (= (and b!648497 (not res!420128)) b!648506))

(assert (= (and b!648506 res!420145) b!648512))

(assert (= (and b!648512 (not res!420138)) b!648495))

(assert (= (and b!648495 res!420144) b!648487))

(assert (= (and b!648506 (not res!420131)) b!648502))

(assert (= (and b!648502 c!74548) b!648492))

(assert (= (and b!648502 (not c!74548)) b!648491))

(assert (= (and b!648502 (not res!420125)) b!648490))

(assert (= (and b!648490 res!420130) b!648486))

(assert (= (and b!648490 (not res!420124)) b!648500))

(assert (= (and b!648500 (not res!420146)) b!648489))

(assert (= (and b!648489 (not res!420136)) b!648508))

(assert (= (and b!648508 (not res!420137)) b!648503))

(declare-fun m!621845 () Bool)

(assert (=> b!648507 m!621845))

(declare-fun m!621847 () Bool)

(assert (=> b!648486 m!621847))

(assert (=> b!648486 m!621847))

(declare-fun m!621849 () Bool)

(assert (=> b!648486 m!621849))

(assert (=> b!648494 m!621847))

(assert (=> b!648494 m!621847))

(declare-fun m!621851 () Bool)

(assert (=> b!648494 m!621851))

(declare-fun m!621853 () Bool)

(assert (=> b!648509 m!621853))

(assert (=> b!648506 m!621847))

(declare-fun m!621855 () Bool)

(assert (=> b!648506 m!621855))

(declare-fun m!621857 () Bool)

(assert (=> b!648506 m!621857))

(assert (=> b!648505 m!621855))

(declare-fun m!621859 () Bool)

(assert (=> b!648505 m!621859))

(declare-fun m!621861 () Bool)

(assert (=> b!648500 m!621861))

(assert (=> b!648487 m!621847))

(assert (=> b!648487 m!621847))

(assert (=> b!648487 m!621849))

(declare-fun m!621863 () Bool)

(assert (=> b!648503 m!621863))

(declare-fun m!621865 () Bool)

(assert (=> b!648496 m!621865))

(assert (=> b!648495 m!621847))

(assert (=> b!648495 m!621847))

(declare-fun m!621867 () Bool)

(assert (=> b!648495 m!621867))

(declare-fun m!621869 () Bool)

(assert (=> b!648497 m!621869))

(declare-fun m!621871 () Bool)

(assert (=> b!648497 m!621871))

(declare-fun m!621873 () Bool)

(assert (=> b!648497 m!621873))

(assert (=> b!648497 m!621847))

(declare-fun m!621875 () Bool)

(assert (=> b!648497 m!621875))

(assert (=> b!648497 m!621847))

(declare-fun m!621877 () Bool)

(assert (=> b!648497 m!621877))

(assert (=> b!648497 m!621855))

(declare-fun m!621879 () Bool)

(assert (=> b!648497 m!621879))

(assert (=> b!648492 m!621847))

(declare-fun m!621881 () Bool)

(assert (=> b!648492 m!621881))

(declare-fun m!621883 () Bool)

(assert (=> b!648492 m!621883))

(assert (=> b!648492 m!621847))

(assert (=> b!648492 m!621847))

(declare-fun m!621885 () Bool)

(assert (=> b!648492 m!621885))

(assert (=> b!648492 m!621847))

(declare-fun m!621887 () Bool)

(assert (=> b!648492 m!621887))

(declare-fun m!621889 () Bool)

(assert (=> b!648492 m!621889))

(declare-fun m!621891 () Bool)

(assert (=> b!648492 m!621891))

(declare-fun m!621893 () Bool)

(assert (=> b!648492 m!621893))

(declare-fun m!621895 () Bool)

(assert (=> b!648499 m!621895))

(assert (=> b!648499 m!621847))

(assert (=> b!648499 m!621847))

(declare-fun m!621897 () Bool)

(assert (=> b!648499 m!621897))

(declare-fun m!621899 () Bool)

(assert (=> b!648489 m!621899))

(declare-fun m!621901 () Bool)

(assert (=> b!648501 m!621901))

(declare-fun m!621903 () Bool)

(assert (=> b!648511 m!621903))

(assert (=> b!648512 m!621847))

(declare-fun m!621905 () Bool)

(assert (=> start!58852 m!621905))

(declare-fun m!621907 () Bool)

(assert (=> start!58852 m!621907))

(assert (=> b!648490 m!621847))

(assert (=> b!648490 m!621847))

(declare-fun m!621909 () Bool)

(assert (=> b!648490 m!621909))

(assert (=> b!648490 m!621847))

(declare-fun m!621911 () Bool)

(assert (=> b!648490 m!621911))

(assert (=> b!648490 m!621847))

(assert (=> b!648490 m!621867))

(declare-fun m!621913 () Bool)

(assert (=> b!648504 m!621913))

(declare-fun m!621915 () Bool)

(assert (=> b!648508 m!621915))

(check-sat (not b!648499) (not b!648507) (not b!648489) (not b!648508) (not b!648509) (not b!648487) (not b!648503) (not b!648486) (not start!58852) (not b!648500) (not b!648495) (not b!648496) (not b!648492) (not b!648494) (not b!648490) (not b!648511) (not b!648497) (not b!648504))
(check-sat)
