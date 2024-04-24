; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56130 () Bool)

(assert start!56130)

(declare-fun b!618533 () Bool)

(assert (=> b!618533 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20317 0))(
  ( (Unit!20318) )
))
(declare-fun lt!285130 () Unit!20317)

(declare-datatypes ((array!37545 0))(
  ( (array!37546 (arr!18016 (Array (_ BitVec 32) (_ BitVec 64))) (size!18380 (_ BitVec 32))) )
))
(declare-fun lt!285136 () array!37545)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37545)

(declare-datatypes ((List!11964 0))(
  ( (Nil!11961) (Cons!11960 (h!13008 (_ BitVec 64)) (t!18184 List!11964)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37545 (_ BitVec 64) (_ BitVec 32) List!11964) Unit!20317)

(assert (=> b!618533 (= lt!285130 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285136 (select (arr!18016 a!2986) j!136) index!984 Nil!11961))))

(declare-fun arrayNoDuplicates!0 (array!37545 (_ BitVec 32) List!11964) Bool)

(assert (=> b!618533 (arrayNoDuplicates!0 lt!285136 index!984 Nil!11961)))

(declare-fun lt!285127 () Unit!20317)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37545 (_ BitVec 32) (_ BitVec 32)) Unit!20317)

(assert (=> b!618533 (= lt!285127 (lemmaNoDuplicateFromThenFromBigger!0 lt!285136 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618533 (arrayNoDuplicates!0 lt!285136 #b00000000000000000000000000000000 Nil!11961)))

(declare-fun lt!285123 () Unit!20317)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37545 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11964) Unit!20317)

(assert (=> b!618533 (= lt!285123 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11961))))

(declare-fun arrayContainsKey!0 (array!37545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618533 (arrayContainsKey!0 lt!285136 (select (arr!18016 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285124 () Unit!20317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37545 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20317)

(assert (=> b!618533 (= lt!285124 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285136 (select (arr!18016 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354726 () Bool)

(assert (=> b!618533 e!354726))

(declare-fun res!398473 () Bool)

(assert (=> b!618533 (=> (not res!398473) (not e!354726))))

(assert (=> b!618533 (= res!398473 (arrayContainsKey!0 lt!285136 (select (arr!18016 a!2986) j!136) j!136))))

(declare-fun e!354718 () Unit!20317)

(declare-fun Unit!20319 () Unit!20317)

(assert (=> b!618533 (= e!354718 Unit!20319)))

(declare-fun b!618534 () Bool)

(declare-fun res!398476 () Bool)

(declare-fun e!354720 () Bool)

(assert (=> b!618534 (=> (not res!398476) (not e!354720))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!618534 (= res!398476 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18016 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618535 () Bool)

(declare-fun e!354714 () Unit!20317)

(declare-fun Unit!20320 () Unit!20317)

(assert (=> b!618535 (= e!354714 Unit!20320)))

(declare-fun b!618536 () Bool)

(declare-fun res!398477 () Bool)

(declare-fun e!354716 () Bool)

(assert (=> b!618536 (=> (not res!398477) (not e!354716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618536 (= res!398477 (validKeyInArray!0 (select (arr!18016 a!2986) j!136)))))

(declare-fun b!618537 () Bool)

(declare-fun e!354717 () Unit!20317)

(declare-fun Unit!20321 () Unit!20317)

(assert (=> b!618537 (= e!354717 Unit!20321)))

(declare-fun res!398469 () Bool)

(assert (=> b!618537 (= res!398469 (= (select (store (arr!18016 a!2986) i!1108 k0!1786) index!984) (select (arr!18016 a!2986) j!136)))))

(declare-fun e!354725 () Bool)

(assert (=> b!618537 (=> (not res!398469) (not e!354725))))

(assert (=> b!618537 e!354725))

(declare-fun c!70401 () Bool)

(assert (=> b!618537 (= c!70401 (bvslt j!136 index!984))))

(declare-fun lt!285121 () Unit!20317)

(declare-fun e!354722 () Unit!20317)

(assert (=> b!618537 (= lt!285121 e!354722)))

(declare-fun c!70403 () Bool)

(assert (=> b!618537 (= c!70403 (bvslt index!984 j!136))))

(declare-fun lt!285128 () Unit!20317)

(assert (=> b!618537 (= lt!285128 e!354718)))

(assert (=> b!618537 false))

(declare-fun b!618538 () Bool)

(declare-fun res!398485 () Bool)

(assert (=> b!618538 (=> (not res!398485) (not e!354720))))

(assert (=> b!618538 (= res!398485 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11961))))

(declare-fun b!618539 () Bool)

(declare-fun e!354713 () Bool)

(declare-datatypes ((SeekEntryResult!6412 0))(
  ( (MissingZero!6412 (index!27932 (_ BitVec 32))) (Found!6412 (index!27933 (_ BitVec 32))) (Intermediate!6412 (undefined!7224 Bool) (index!27934 (_ BitVec 32)) (x!56871 (_ BitVec 32))) (Undefined!6412) (MissingVacant!6412 (index!27935 (_ BitVec 32))) )
))
(declare-fun lt!285135 () SeekEntryResult!6412)

(declare-fun lt!285133 () SeekEntryResult!6412)

(assert (=> b!618539 (= e!354713 (= lt!285135 lt!285133))))

(declare-fun b!618540 () Bool)

(declare-fun res!398482 () Bool)

(assert (=> b!618540 (=> (not res!398482) (not e!354716))))

(assert (=> b!618540 (= res!398482 (validKeyInArray!0 k0!1786))))

(declare-fun b!618541 () Bool)

(declare-fun Unit!20322 () Unit!20317)

(assert (=> b!618541 (= e!354714 Unit!20322)))

(assert (=> b!618541 false))

(declare-fun b!618542 () Bool)

(declare-fun res!398474 () Bool)

(assert (=> b!618542 (= res!398474 (arrayContainsKey!0 lt!285136 (select (arr!18016 a!2986) j!136) j!136))))

(declare-fun e!354723 () Bool)

(assert (=> b!618542 (=> (not res!398474) (not e!354723))))

(declare-fun e!354715 () Bool)

(assert (=> b!618542 (= e!354715 e!354723)))

(declare-fun b!618543 () Bool)

(declare-fun res!398483 () Bool)

(assert (=> b!618543 (=> (not res!398483) (not e!354720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37545 (_ BitVec 32)) Bool)

(assert (=> b!618543 (= res!398483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618544 () Bool)

(declare-fun e!354721 () Bool)

(assert (=> b!618544 (= e!354720 e!354721)))

(declare-fun res!398480 () Bool)

(assert (=> b!618544 (=> (not res!398480) (not e!354721))))

(assert (=> b!618544 (= res!398480 (= (select (store (arr!18016 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618544 (= lt!285136 (array!37546 (store (arr!18016 a!2986) i!1108 k0!1786) (size!18380 a!2986)))))

(declare-fun b!618545 () Bool)

(declare-fun Unit!20323 () Unit!20317)

(assert (=> b!618545 (= e!354717 Unit!20323)))

(declare-fun b!618546 () Bool)

(assert (=> b!618546 false))

(declare-fun lt!285131 () Unit!20317)

(assert (=> b!618546 (= lt!285131 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285136 (select (arr!18016 a!2986) j!136) j!136 Nil!11961))))

(assert (=> b!618546 (arrayNoDuplicates!0 lt!285136 j!136 Nil!11961)))

(declare-fun lt!285126 () Unit!20317)

(assert (=> b!618546 (= lt!285126 (lemmaNoDuplicateFromThenFromBigger!0 lt!285136 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618546 (arrayNoDuplicates!0 lt!285136 #b00000000000000000000000000000000 Nil!11961)))

(declare-fun lt!285125 () Unit!20317)

(assert (=> b!618546 (= lt!285125 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11961))))

(assert (=> b!618546 (arrayContainsKey!0 lt!285136 (select (arr!18016 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285120 () Unit!20317)

(assert (=> b!618546 (= lt!285120 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285136 (select (arr!18016 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20324 () Unit!20317)

(assert (=> b!618546 (= e!354722 Unit!20324)))

(declare-fun b!618532 () Bool)

(declare-fun res!398472 () Bool)

(assert (=> b!618532 (= res!398472 (bvsge j!136 index!984))))

(assert (=> b!618532 (=> res!398472 e!354715)))

(assert (=> b!618532 (= e!354725 e!354715)))

(declare-fun res!398471 () Bool)

(assert (=> start!56130 (=> (not res!398471) (not e!354716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56130 (= res!398471 (validMask!0 mask!3053))))

(assert (=> start!56130 e!354716))

(assert (=> start!56130 true))

(declare-fun array_inv!13875 (array!37545) Bool)

(assert (=> start!56130 (array_inv!13875 a!2986)))

(declare-fun b!618547 () Bool)

(assert (=> b!618547 (= e!354726 (arrayContainsKey!0 lt!285136 (select (arr!18016 a!2986) j!136) index!984))))

(declare-fun b!618548 () Bool)

(declare-fun Unit!20325 () Unit!20317)

(assert (=> b!618548 (= e!354722 Unit!20325)))

(declare-fun b!618549 () Bool)

(declare-fun e!354712 () Bool)

(assert (=> b!618549 (= e!354712 true)))

(assert (=> b!618549 (= (select (store (arr!18016 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618550 () Bool)

(assert (=> b!618550 (= e!354716 e!354720)))

(declare-fun res!398478 () Bool)

(assert (=> b!618550 (=> (not res!398478) (not e!354720))))

(declare-fun lt!285129 () SeekEntryResult!6412)

(assert (=> b!618550 (= res!398478 (or (= lt!285129 (MissingZero!6412 i!1108)) (= lt!285129 (MissingVacant!6412 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37545 (_ BitVec 32)) SeekEntryResult!6412)

(assert (=> b!618550 (= lt!285129 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618551 () Bool)

(declare-fun res!398484 () Bool)

(assert (=> b!618551 (=> (not res!398484) (not e!354716))))

(assert (=> b!618551 (= res!398484 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618552 () Bool)

(declare-fun e!354719 () Bool)

(assert (=> b!618552 (= e!354721 e!354719)))

(declare-fun res!398470 () Bool)

(assert (=> b!618552 (=> (not res!398470) (not e!354719))))

(assert (=> b!618552 (= res!398470 (and (= lt!285135 (Found!6412 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18016 a!2986) index!984) (select (arr!18016 a!2986) j!136))) (not (= (select (arr!18016 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37545 (_ BitVec 32)) SeekEntryResult!6412)

(assert (=> b!618552 (= lt!285135 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18016 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618553 () Bool)

(declare-fun res!398479 () Bool)

(assert (=> b!618553 (=> (not res!398479) (not e!354716))))

(assert (=> b!618553 (= res!398479 (and (= (size!18380 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18380 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18380 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618554 () Bool)

(assert (=> b!618554 (= e!354719 (not e!354712))))

(declare-fun res!398481 () Bool)

(assert (=> b!618554 (=> res!398481 e!354712)))

(declare-fun lt!285138 () SeekEntryResult!6412)

(assert (=> b!618554 (= res!398481 (not (= lt!285138 (MissingVacant!6412 vacantSpotIndex!68))))))

(declare-fun lt!285132 () Unit!20317)

(assert (=> b!618554 (= lt!285132 e!354717)))

(declare-fun c!70400 () Bool)

(assert (=> b!618554 (= c!70400 (= lt!285138 (Found!6412 index!984)))))

(declare-fun lt!285134 () Unit!20317)

(assert (=> b!618554 (= lt!285134 e!354714)))

(declare-fun c!70402 () Bool)

(assert (=> b!618554 (= c!70402 (= lt!285138 Undefined!6412))))

(declare-fun lt!285137 () (_ BitVec 64))

(assert (=> b!618554 (= lt!285138 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285137 lt!285136 mask!3053))))

(assert (=> b!618554 e!354713))

(declare-fun res!398475 () Bool)

(assert (=> b!618554 (=> (not res!398475) (not e!354713))))

(declare-fun lt!285122 () (_ BitVec 32))

(assert (=> b!618554 (= res!398475 (= lt!285133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285122 vacantSpotIndex!68 lt!285137 lt!285136 mask!3053)))))

(assert (=> b!618554 (= lt!285133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285122 vacantSpotIndex!68 (select (arr!18016 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618554 (= lt!285137 (select (store (arr!18016 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285139 () Unit!20317)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20317)

(assert (=> b!618554 (= lt!285139 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285122 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618554 (= lt!285122 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!618555 () Bool)

(assert (=> b!618555 (= e!354723 (arrayContainsKey!0 lt!285136 (select (arr!18016 a!2986) j!136) index!984))))

(declare-fun b!618556 () Bool)

(declare-fun Unit!20326 () Unit!20317)

(assert (=> b!618556 (= e!354718 Unit!20326)))

(assert (= (and start!56130 res!398471) b!618553))

(assert (= (and b!618553 res!398479) b!618536))

(assert (= (and b!618536 res!398477) b!618540))

(assert (= (and b!618540 res!398482) b!618551))

(assert (= (and b!618551 res!398484) b!618550))

(assert (= (and b!618550 res!398478) b!618543))

(assert (= (and b!618543 res!398483) b!618538))

(assert (= (and b!618538 res!398485) b!618534))

(assert (= (and b!618534 res!398476) b!618544))

(assert (= (and b!618544 res!398480) b!618552))

(assert (= (and b!618552 res!398470) b!618554))

(assert (= (and b!618554 res!398475) b!618539))

(assert (= (and b!618554 c!70402) b!618541))

(assert (= (and b!618554 (not c!70402)) b!618535))

(assert (= (and b!618554 c!70400) b!618537))

(assert (= (and b!618554 (not c!70400)) b!618545))

(assert (= (and b!618537 res!398469) b!618532))

(assert (= (and b!618532 (not res!398472)) b!618542))

(assert (= (and b!618542 res!398474) b!618555))

(assert (= (and b!618537 c!70401) b!618546))

(assert (= (and b!618537 (not c!70401)) b!618548))

(assert (= (and b!618537 c!70403) b!618533))

(assert (= (and b!618537 (not c!70403)) b!618556))

(assert (= (and b!618533 res!398473) b!618547))

(assert (= (and b!618554 (not res!398481)) b!618549))

(declare-fun m!594857 () Bool)

(assert (=> b!618546 m!594857))

(declare-fun m!594859 () Bool)

(assert (=> b!618546 m!594859))

(assert (=> b!618546 m!594857))

(assert (=> b!618546 m!594857))

(declare-fun m!594861 () Bool)

(assert (=> b!618546 m!594861))

(declare-fun m!594863 () Bool)

(assert (=> b!618546 m!594863))

(declare-fun m!594865 () Bool)

(assert (=> b!618546 m!594865))

(assert (=> b!618546 m!594857))

(declare-fun m!594867 () Bool)

(assert (=> b!618546 m!594867))

(declare-fun m!594869 () Bool)

(assert (=> b!618546 m!594869))

(declare-fun m!594871 () Bool)

(assert (=> b!618546 m!594871))

(declare-fun m!594873 () Bool)

(assert (=> b!618534 m!594873))

(assert (=> b!618542 m!594857))

(assert (=> b!618542 m!594857))

(declare-fun m!594875 () Bool)

(assert (=> b!618542 m!594875))

(assert (=> b!618555 m!594857))

(assert (=> b!618555 m!594857))

(declare-fun m!594877 () Bool)

(assert (=> b!618555 m!594877))

(declare-fun m!594879 () Bool)

(assert (=> b!618550 m!594879))

(declare-fun m!594881 () Bool)

(assert (=> b!618537 m!594881))

(declare-fun m!594883 () Bool)

(assert (=> b!618537 m!594883))

(assert (=> b!618537 m!594857))

(declare-fun m!594885 () Bool)

(assert (=> b!618552 m!594885))

(assert (=> b!618552 m!594857))

(assert (=> b!618552 m!594857))

(declare-fun m!594887 () Bool)

(assert (=> b!618552 m!594887))

(assert (=> b!618547 m!594857))

(assert (=> b!618547 m!594857))

(assert (=> b!618547 m!594877))

(declare-fun m!594889 () Bool)

(assert (=> b!618551 m!594889))

(declare-fun m!594891 () Bool)

(assert (=> start!56130 m!594891))

(declare-fun m!594893 () Bool)

(assert (=> start!56130 m!594893))

(declare-fun m!594895 () Bool)

(assert (=> b!618540 m!594895))

(declare-fun m!594897 () Bool)

(assert (=> b!618538 m!594897))

(assert (=> b!618536 m!594857))

(assert (=> b!618536 m!594857))

(declare-fun m!594899 () Bool)

(assert (=> b!618536 m!594899))

(declare-fun m!594901 () Bool)

(assert (=> b!618543 m!594901))

(declare-fun m!594903 () Bool)

(assert (=> b!618554 m!594903))

(declare-fun m!594905 () Bool)

(assert (=> b!618554 m!594905))

(assert (=> b!618554 m!594857))

(declare-fun m!594907 () Bool)

(assert (=> b!618554 m!594907))

(assert (=> b!618554 m!594857))

(assert (=> b!618554 m!594881))

(declare-fun m!594909 () Bool)

(assert (=> b!618554 m!594909))

(declare-fun m!594911 () Bool)

(assert (=> b!618554 m!594911))

(declare-fun m!594913 () Bool)

(assert (=> b!618554 m!594913))

(assert (=> b!618533 m!594857))

(assert (=> b!618533 m!594857))

(declare-fun m!594915 () Bool)

(assert (=> b!618533 m!594915))

(declare-fun m!594917 () Bool)

(assert (=> b!618533 m!594917))

(assert (=> b!618533 m!594857))

(assert (=> b!618533 m!594875))

(assert (=> b!618533 m!594863))

(assert (=> b!618533 m!594857))

(declare-fun m!594919 () Bool)

(assert (=> b!618533 m!594919))

(assert (=> b!618533 m!594857))

(declare-fun m!594921 () Bool)

(assert (=> b!618533 m!594921))

(declare-fun m!594923 () Bool)

(assert (=> b!618533 m!594923))

(assert (=> b!618533 m!594871))

(assert (=> b!618544 m!594881))

(declare-fun m!594925 () Bool)

(assert (=> b!618544 m!594925))

(assert (=> b!618549 m!594881))

(assert (=> b!618549 m!594883))

(check-sat (not b!618540) (not b!618555) (not b!618552) (not b!618533) (not start!56130) (not b!618538) (not b!618543) (not b!618546) (not b!618554) (not b!618536) (not b!618550) (not b!618542) (not b!618547) (not b!618551))
(check-sat)
