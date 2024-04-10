; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58440 () Bool)

(assert start!58440)

(declare-fun b!645367 () Bool)

(declare-fun e!369845 () Bool)

(declare-fun e!369839 () Bool)

(assert (=> b!645367 (= e!369845 e!369839)))

(declare-fun res!418130 () Bool)

(assert (=> b!645367 (=> res!418130 e!369839)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!299258 () (_ BitVec 64))

(declare-datatypes ((array!38456 0))(
  ( (array!38457 (arr!18440 (Array (_ BitVec 32) (_ BitVec 64))) (size!18804 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38456)

(declare-fun lt!299252 () (_ BitVec 64))

(assert (=> b!645367 (= res!418130 (or (not (= (select (arr!18440 a!2986) j!136) lt!299258)) (not (= (select (arr!18440 a!2986) j!136) lt!299252))))))

(declare-fun e!369842 () Bool)

(assert (=> b!645367 e!369842))

(declare-fun res!418139 () Bool)

(assert (=> b!645367 (=> (not res!418139) (not e!369842))))

(assert (=> b!645367 (= res!418139 (= lt!299252 (select (arr!18440 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!645367 (= lt!299252 (select (store (arr!18440 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!645368 () Bool)

(declare-datatypes ((Unit!21906 0))(
  ( (Unit!21907) )
))
(declare-fun e!369850 () Unit!21906)

(declare-fun Unit!21908 () Unit!21906)

(assert (=> b!645368 (= e!369850 Unit!21908)))

(declare-fun b!645369 () Bool)

(declare-fun res!418124 () Bool)

(declare-fun e!369838 () Bool)

(assert (=> b!645369 (=> (not res!418124) (not e!369838))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!645369 (= res!418124 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18440 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645370 () Bool)

(declare-fun lt!299248 () array!38456)

(declare-fun e!369849 () Bool)

(declare-fun arrayContainsKey!0 (array!38456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645370 (= e!369849 (arrayContainsKey!0 lt!299248 (select (arr!18440 a!2986) j!136) index!984))))

(declare-fun b!645371 () Bool)

(declare-fun res!418123 () Bool)

(declare-fun e!369848 () Bool)

(assert (=> b!645371 (=> (not res!418123) (not e!369848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645371 (= res!418123 (validKeyInArray!0 k!1786))))

(declare-fun b!645372 () Bool)

(declare-fun e!369846 () Bool)

(assert (=> b!645372 (= e!369838 e!369846)))

(declare-fun res!418122 () Bool)

(assert (=> b!645372 (=> (not res!418122) (not e!369846))))

(assert (=> b!645372 (= res!418122 (= (select (store (arr!18440 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645372 (= lt!299248 (array!38457 (store (arr!18440 a!2986) i!1108 k!1786) (size!18804 a!2986)))))

(declare-fun b!645373 () Bool)

(declare-fun e!369843 () Unit!21906)

(declare-fun Unit!21909 () Unit!21906)

(assert (=> b!645373 (= e!369843 Unit!21909)))

(declare-fun b!645374 () Bool)

(declare-fun e!369844 () Bool)

(assert (=> b!645374 (= e!369839 e!369844)))

(declare-fun res!418129 () Bool)

(assert (=> b!645374 (=> res!418129 e!369844)))

(assert (=> b!645374 (= res!418129 (bvsge index!984 j!136))))

(declare-fun lt!299250 () Unit!21906)

(assert (=> b!645374 (= lt!299250 e!369850)))

(declare-fun c!73991 () Bool)

(assert (=> b!645374 (= c!73991 (bvslt j!136 index!984))))

(declare-fun b!645375 () Bool)

(assert (=> b!645375 (= e!369844 true)))

(assert (=> b!645375 (arrayContainsKey!0 lt!299248 (select (arr!18440 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299256 () Unit!21906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38456 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21906)

(assert (=> b!645375 (= lt!299256 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299248 (select (arr!18440 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!645375 e!369849))

(declare-fun res!418127 () Bool)

(assert (=> b!645375 (=> (not res!418127) (not e!369849))))

(assert (=> b!645375 (= res!418127 (arrayContainsKey!0 lt!299248 (select (arr!18440 a!2986) j!136) j!136))))

(declare-fun b!645376 () Bool)

(declare-fun e!369841 () Bool)

(declare-datatypes ((SeekEntryResult!6880 0))(
  ( (MissingZero!6880 (index!29855 (_ BitVec 32))) (Found!6880 (index!29856 (_ BitVec 32))) (Intermediate!6880 (undefined!7692 Bool) (index!29857 (_ BitVec 32)) (x!58625 (_ BitVec 32))) (Undefined!6880) (MissingVacant!6880 (index!29858 (_ BitVec 32))) )
))
(declare-fun lt!299257 () SeekEntryResult!6880)

(declare-fun lt!299251 () SeekEntryResult!6880)

(assert (=> b!645376 (= e!369841 (= lt!299257 lt!299251))))

(declare-fun b!645377 () Bool)

(declare-fun res!418132 () Bool)

(assert (=> b!645377 (=> (not res!418132) (not e!369838))))

(declare-datatypes ((List!12481 0))(
  ( (Nil!12478) (Cons!12477 (h!13522 (_ BitVec 64)) (t!18709 List!12481)) )
))
(declare-fun arrayNoDuplicates!0 (array!38456 (_ BitVec 32) List!12481) Bool)

(assert (=> b!645377 (= res!418132 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12478))))

(declare-fun b!645378 () Bool)

(assert (=> b!645378 (= e!369848 e!369838)))

(declare-fun res!418126 () Bool)

(assert (=> b!645378 (=> (not res!418126) (not e!369838))))

(declare-fun lt!299253 () SeekEntryResult!6880)

(assert (=> b!645378 (= res!418126 (or (= lt!299253 (MissingZero!6880 i!1108)) (= lt!299253 (MissingVacant!6880 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38456 (_ BitVec 32)) SeekEntryResult!6880)

(assert (=> b!645378 (= lt!299253 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!645379 () Bool)

(declare-fun res!418133 () Bool)

(assert (=> b!645379 (=> (not res!418133) (not e!369848))))

(assert (=> b!645379 (= res!418133 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!418135 () Bool)

(assert (=> start!58440 (=> (not res!418135) (not e!369848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58440 (= res!418135 (validMask!0 mask!3053))))

(assert (=> start!58440 e!369848))

(assert (=> start!58440 true))

(declare-fun array_inv!14236 (array!38456) Bool)

(assert (=> start!58440 (array_inv!14236 a!2986)))

(declare-fun b!645380 () Bool)

(declare-fun e!369851 () Bool)

(assert (=> b!645380 (= e!369851 (not e!369845))))

(declare-fun res!418121 () Bool)

(assert (=> b!645380 (=> res!418121 e!369845)))

(declare-fun lt!299255 () SeekEntryResult!6880)

(assert (=> b!645380 (= res!418121 (not (= lt!299255 (Found!6880 index!984))))))

(declare-fun lt!299249 () Unit!21906)

(assert (=> b!645380 (= lt!299249 e!369843)))

(declare-fun c!73990 () Bool)

(assert (=> b!645380 (= c!73990 (= lt!299255 Undefined!6880))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38456 (_ BitVec 32)) SeekEntryResult!6880)

(assert (=> b!645380 (= lt!299255 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299258 lt!299248 mask!3053))))

(assert (=> b!645380 e!369841))

(declare-fun res!418134 () Bool)

(assert (=> b!645380 (=> (not res!418134) (not e!369841))))

(declare-fun lt!299259 () (_ BitVec 32))

(assert (=> b!645380 (= res!418134 (= lt!299251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299259 vacantSpotIndex!68 lt!299258 lt!299248 mask!3053)))))

(assert (=> b!645380 (= lt!299251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299259 vacantSpotIndex!68 (select (arr!18440 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645380 (= lt!299258 (select (store (arr!18440 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299254 () Unit!21906)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38456 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21906)

(assert (=> b!645380 (= lt!299254 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299259 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645380 (= lt!299259 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645381 () Bool)

(declare-fun Unit!21910 () Unit!21906)

(assert (=> b!645381 (= e!369850 Unit!21910)))

(declare-fun lt!299247 () Unit!21906)

(assert (=> b!645381 (= lt!299247 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299248 (select (arr!18440 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645381 (arrayContainsKey!0 lt!299248 (select (arr!18440 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299260 () Unit!21906)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38456 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12481) Unit!21906)

(assert (=> b!645381 (= lt!299260 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12478))))

(assert (=> b!645381 (arrayNoDuplicates!0 lt!299248 #b00000000000000000000000000000000 Nil!12478)))

(declare-fun lt!299246 () Unit!21906)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38456 (_ BitVec 32) (_ BitVec 32)) Unit!21906)

(assert (=> b!645381 (= lt!299246 (lemmaNoDuplicateFromThenFromBigger!0 lt!299248 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645381 (arrayNoDuplicates!0 lt!299248 j!136 Nil!12478)))

(declare-fun lt!299245 () Unit!21906)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38456 (_ BitVec 64) (_ BitVec 32) List!12481) Unit!21906)

(assert (=> b!645381 (= lt!299245 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299248 (select (arr!18440 a!2986) j!136) j!136 Nil!12478))))

(assert (=> b!645381 false))

(declare-fun b!645382 () Bool)

(assert (=> b!645382 (= e!369846 e!369851)))

(declare-fun res!418131 () Bool)

(assert (=> b!645382 (=> (not res!418131) (not e!369851))))

(assert (=> b!645382 (= res!418131 (and (= lt!299257 (Found!6880 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18440 a!2986) index!984) (select (arr!18440 a!2986) j!136))) (not (= (select (arr!18440 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645382 (= lt!299257 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18440 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645383 () Bool)

(declare-fun res!418136 () Bool)

(assert (=> b!645383 (=> (not res!418136) (not e!369838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38456 (_ BitVec 32)) Bool)

(assert (=> b!645383 (= res!418136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645384 () Bool)

(declare-fun e!369840 () Bool)

(declare-fun e!369847 () Bool)

(assert (=> b!645384 (= e!369840 e!369847)))

(declare-fun res!418125 () Bool)

(assert (=> b!645384 (=> (not res!418125) (not e!369847))))

(assert (=> b!645384 (= res!418125 (arrayContainsKey!0 lt!299248 (select (arr!18440 a!2986) j!136) j!136))))

(declare-fun b!645385 () Bool)

(assert (=> b!645385 (= e!369842 e!369840)))

(declare-fun res!418138 () Bool)

(assert (=> b!645385 (=> res!418138 e!369840)))

(assert (=> b!645385 (= res!418138 (or (not (= (select (arr!18440 a!2986) j!136) lt!299258)) (not (= (select (arr!18440 a!2986) j!136) lt!299252)) (bvsge j!136 index!984)))))

(declare-fun b!645386 () Bool)

(declare-fun res!418128 () Bool)

(assert (=> b!645386 (=> (not res!418128) (not e!369848))))

(assert (=> b!645386 (= res!418128 (validKeyInArray!0 (select (arr!18440 a!2986) j!136)))))

(declare-fun b!645387 () Bool)

(declare-fun Unit!21911 () Unit!21906)

(assert (=> b!645387 (= e!369843 Unit!21911)))

(assert (=> b!645387 false))

(declare-fun b!645388 () Bool)

(assert (=> b!645388 (= e!369847 (arrayContainsKey!0 lt!299248 (select (arr!18440 a!2986) j!136) index!984))))

(declare-fun b!645389 () Bool)

(declare-fun res!418137 () Bool)

(assert (=> b!645389 (=> (not res!418137) (not e!369848))))

(assert (=> b!645389 (= res!418137 (and (= (size!18804 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18804 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18804 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!58440 res!418135) b!645389))

(assert (= (and b!645389 res!418137) b!645386))

(assert (= (and b!645386 res!418128) b!645371))

(assert (= (and b!645371 res!418123) b!645379))

(assert (= (and b!645379 res!418133) b!645378))

(assert (= (and b!645378 res!418126) b!645383))

(assert (= (and b!645383 res!418136) b!645377))

(assert (= (and b!645377 res!418132) b!645369))

(assert (= (and b!645369 res!418124) b!645372))

(assert (= (and b!645372 res!418122) b!645382))

(assert (= (and b!645382 res!418131) b!645380))

(assert (= (and b!645380 res!418134) b!645376))

(assert (= (and b!645380 c!73990) b!645387))

(assert (= (and b!645380 (not c!73990)) b!645373))

(assert (= (and b!645380 (not res!418121)) b!645367))

(assert (= (and b!645367 res!418139) b!645385))

(assert (= (and b!645385 (not res!418138)) b!645384))

(assert (= (and b!645384 res!418125) b!645388))

(assert (= (and b!645367 (not res!418130)) b!645374))

(assert (= (and b!645374 c!73991) b!645381))

(assert (= (and b!645374 (not c!73991)) b!645368))

(assert (= (and b!645374 (not res!418129)) b!645375))

(assert (= (and b!645375 res!418127) b!645370))

(declare-fun m!618889 () Bool)

(assert (=> b!645375 m!618889))

(assert (=> b!645375 m!618889))

(declare-fun m!618891 () Bool)

(assert (=> b!645375 m!618891))

(assert (=> b!645375 m!618889))

(declare-fun m!618893 () Bool)

(assert (=> b!645375 m!618893))

(assert (=> b!645375 m!618889))

(declare-fun m!618895 () Bool)

(assert (=> b!645375 m!618895))

(assert (=> b!645384 m!618889))

(assert (=> b!645384 m!618889))

(assert (=> b!645384 m!618895))

(assert (=> b!645381 m!618889))

(declare-fun m!618897 () Bool)

(assert (=> b!645381 m!618897))

(assert (=> b!645381 m!618889))

(declare-fun m!618899 () Bool)

(assert (=> b!645381 m!618899))

(assert (=> b!645381 m!618889))

(declare-fun m!618901 () Bool)

(assert (=> b!645381 m!618901))

(assert (=> b!645381 m!618889))

(declare-fun m!618903 () Bool)

(assert (=> b!645381 m!618903))

(declare-fun m!618905 () Bool)

(assert (=> b!645381 m!618905))

(declare-fun m!618907 () Bool)

(assert (=> b!645381 m!618907))

(declare-fun m!618909 () Bool)

(assert (=> b!645381 m!618909))

(declare-fun m!618911 () Bool)

(assert (=> b!645382 m!618911))

(assert (=> b!645382 m!618889))

(assert (=> b!645382 m!618889))

(declare-fun m!618913 () Bool)

(assert (=> b!645382 m!618913))

(assert (=> b!645370 m!618889))

(assert (=> b!645370 m!618889))

(declare-fun m!618915 () Bool)

(assert (=> b!645370 m!618915))

(assert (=> b!645386 m!618889))

(assert (=> b!645386 m!618889))

(declare-fun m!618917 () Bool)

(assert (=> b!645386 m!618917))

(assert (=> b!645388 m!618889))

(assert (=> b!645388 m!618889))

(assert (=> b!645388 m!618915))

(declare-fun m!618919 () Bool)

(assert (=> b!645377 m!618919))

(declare-fun m!618921 () Bool)

(assert (=> b!645383 m!618921))

(declare-fun m!618923 () Bool)

(assert (=> b!645379 m!618923))

(declare-fun m!618925 () Bool)

(assert (=> b!645371 m!618925))

(declare-fun m!618927 () Bool)

(assert (=> start!58440 m!618927))

(declare-fun m!618929 () Bool)

(assert (=> start!58440 m!618929))

(declare-fun m!618931 () Bool)

(assert (=> b!645372 m!618931))

(declare-fun m!618933 () Bool)

(assert (=> b!645372 m!618933))

(declare-fun m!618935 () Bool)

(assert (=> b!645378 m!618935))

(assert (=> b!645367 m!618889))

(assert (=> b!645367 m!618931))

(declare-fun m!618937 () Bool)

(assert (=> b!645367 m!618937))

(declare-fun m!618939 () Bool)

(assert (=> b!645380 m!618939))

(declare-fun m!618941 () Bool)

(assert (=> b!645380 m!618941))

(declare-fun m!618943 () Bool)

(assert (=> b!645380 m!618943))

(assert (=> b!645380 m!618931))

(declare-fun m!618945 () Bool)

(assert (=> b!645380 m!618945))

(assert (=> b!645380 m!618889))

(declare-fun m!618947 () Bool)

(assert (=> b!645380 m!618947))

(assert (=> b!645380 m!618889))

(declare-fun m!618949 () Bool)

(assert (=> b!645380 m!618949))

(assert (=> b!645385 m!618889))

(declare-fun m!618951 () Bool)

(assert (=> b!645369 m!618951))

(push 1)

