; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58544 () Bool)

(assert start!58544)

(declare-fun b!646390 () Bool)

(declare-fun e!370522 () Bool)

(declare-fun e!370527 () Bool)

(assert (=> b!646390 (= e!370522 e!370527)))

(declare-fun res!418828 () Bool)

(assert (=> b!646390 (=> (not res!418828) (not e!370527))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6890 0))(
  ( (MissingZero!6890 (index!29898 (_ BitVec 32))) (Found!6890 (index!29899 (_ BitVec 32))) (Intermediate!6890 (undefined!7702 Bool) (index!29900 (_ BitVec 32)) (x!58676 (_ BitVec 32))) (Undefined!6890) (MissingVacant!6890 (index!29901 (_ BitVec 32))) )
))
(declare-fun lt!299878 () SeekEntryResult!6890)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38479 0))(
  ( (array!38480 (arr!18450 (Array (_ BitVec 32) (_ BitVec 64))) (size!18814 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38479)

(assert (=> b!646390 (= res!418828 (and (= lt!299878 (Found!6890 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18450 a!2986) index!984) (select (arr!18450 a!2986) j!136))) (not (= (select (arr!18450 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38479 (_ BitVec 32)) SeekEntryResult!6890)

(assert (=> b!646390 (= lt!299878 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18450 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646391 () Bool)

(declare-fun res!418827 () Bool)

(declare-fun e!370521 () Bool)

(assert (=> b!646391 (=> (not res!418827) (not e!370521))))

(assert (=> b!646391 (= res!418827 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18450 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646392 () Bool)

(declare-datatypes ((Unit!21966 0))(
  ( (Unit!21967) )
))
(declare-fun e!370524 () Unit!21966)

(declare-fun Unit!21968 () Unit!21966)

(assert (=> b!646392 (= e!370524 Unit!21968)))

(declare-fun lt!299876 () array!38479)

(declare-fun b!646393 () Bool)

(declare-fun e!370530 () Bool)

(declare-fun arrayContainsKey!0 (array!38479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646393 (= e!370530 (arrayContainsKey!0 lt!299876 (select (arr!18450 a!2986) j!136) index!984))))

(declare-fun b!646394 () Bool)

(declare-fun e!370516 () Bool)

(declare-fun lt!299874 () SeekEntryResult!6890)

(assert (=> b!646394 (= e!370516 (= lt!299878 lt!299874))))

(declare-fun b!646395 () Bool)

(declare-fun res!418817 () Bool)

(assert (=> b!646395 (=> (not res!418817) (not e!370521))))

(declare-datatypes ((List!12491 0))(
  ( (Nil!12488) (Cons!12487 (h!13532 (_ BitVec 64)) (t!18719 List!12491)) )
))
(declare-fun arrayNoDuplicates!0 (array!38479 (_ BitVec 32) List!12491) Bool)

(assert (=> b!646395 (= res!418817 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12488))))

(declare-fun b!646396 () Bool)

(declare-fun res!418829 () Bool)

(assert (=> b!646396 (=> (not res!418829) (not e!370521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38479 (_ BitVec 32)) Bool)

(assert (=> b!646396 (= res!418829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646397 () Bool)

(declare-fun e!370517 () Bool)

(declare-fun e!370523 () Bool)

(assert (=> b!646397 (= e!370517 e!370523)))

(declare-fun res!418819 () Bool)

(assert (=> b!646397 (=> res!418819 e!370523)))

(assert (=> b!646397 (= res!418819 (bvsge index!984 j!136))))

(declare-fun lt!299882 () Unit!21966)

(declare-fun e!370518 () Unit!21966)

(assert (=> b!646397 (= lt!299882 e!370518)))

(declare-fun c!74155 () Bool)

(assert (=> b!646397 (= c!74155 (bvslt j!136 index!984))))

(declare-fun b!646398 () Bool)

(declare-fun Unit!21969 () Unit!21966)

(assert (=> b!646398 (= e!370524 Unit!21969)))

(assert (=> b!646398 false))

(declare-fun b!646399 () Bool)

(declare-fun res!418831 () Bool)

(declare-fun e!370520 () Bool)

(assert (=> b!646399 (=> (not res!418831) (not e!370520))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646399 (= res!418831 (validKeyInArray!0 k!1786))))

(declare-fun b!646400 () Bool)

(declare-fun res!418822 () Bool)

(assert (=> b!646400 (=> (not res!418822) (not e!370520))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!646400 (= res!418822 (and (= (size!18814 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18814 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18814 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646401 () Bool)

(assert (=> b!646401 (= e!370520 e!370521)))

(declare-fun res!418820 () Bool)

(assert (=> b!646401 (=> (not res!418820) (not e!370521))))

(declare-fun lt!299886 () SeekEntryResult!6890)

(assert (=> b!646401 (= res!418820 (or (= lt!299886 (MissingZero!6890 i!1108)) (= lt!299886 (MissingVacant!6890 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38479 (_ BitVec 32)) SeekEntryResult!6890)

(assert (=> b!646401 (= lt!299886 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!646402 () Bool)

(declare-fun e!370529 () Bool)

(assert (=> b!646402 (= e!370529 e!370517)))

(declare-fun res!418821 () Bool)

(assert (=> b!646402 (=> res!418821 e!370517)))

(declare-fun lt!299884 () (_ BitVec 64))

(declare-fun lt!299887 () (_ BitVec 64))

(assert (=> b!646402 (= res!418821 (or (not (= (select (arr!18450 a!2986) j!136) lt!299887)) (not (= (select (arr!18450 a!2986) j!136) lt!299884))))))

(declare-fun e!370526 () Bool)

(assert (=> b!646402 e!370526))

(declare-fun res!418825 () Bool)

(assert (=> b!646402 (=> (not res!418825) (not e!370526))))

(assert (=> b!646402 (= res!418825 (= lt!299884 (select (arr!18450 a!2986) j!136)))))

(assert (=> b!646402 (= lt!299884 (select (store (arr!18450 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!646403 () Bool)

(declare-fun e!370525 () Bool)

(assert (=> b!646403 (= e!370526 e!370525)))

(declare-fun res!418815 () Bool)

(assert (=> b!646403 (=> res!418815 e!370525)))

(assert (=> b!646403 (= res!418815 (or (not (= (select (arr!18450 a!2986) j!136) lt!299887)) (not (= (select (arr!18450 a!2986) j!136) lt!299884)) (bvsge j!136 index!984)))))

(declare-fun b!646404 () Bool)

(assert (=> b!646404 (= e!370527 (not e!370529))))

(declare-fun res!418824 () Bool)

(assert (=> b!646404 (=> res!418824 e!370529)))

(declare-fun lt!299879 () SeekEntryResult!6890)

(assert (=> b!646404 (= res!418824 (not (= lt!299879 (Found!6890 index!984))))))

(declare-fun lt!299885 () Unit!21966)

(assert (=> b!646404 (= lt!299885 e!370524)))

(declare-fun c!74156 () Bool)

(assert (=> b!646404 (= c!74156 (= lt!299879 Undefined!6890))))

(assert (=> b!646404 (= lt!299879 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299887 lt!299876 mask!3053))))

(assert (=> b!646404 e!370516))

(declare-fun res!418826 () Bool)

(assert (=> b!646404 (=> (not res!418826) (not e!370516))))

(declare-fun lt!299877 () (_ BitVec 32))

(assert (=> b!646404 (= res!418826 (= lt!299874 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299877 vacantSpotIndex!68 lt!299887 lt!299876 mask!3053)))))

(assert (=> b!646404 (= lt!299874 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299877 vacantSpotIndex!68 (select (arr!18450 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646404 (= lt!299887 (select (store (arr!18450 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299883 () Unit!21966)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38479 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21966)

(assert (=> b!646404 (= lt!299883 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299877 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646404 (= lt!299877 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!646405 () Bool)

(assert (=> b!646405 (= e!370523 (or (bvsge (size!18814 a!2986) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!18814 a!2986))))))

(assert (=> b!646405 (arrayContainsKey!0 lt!299876 (select (arr!18450 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299873 () Unit!21966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21966)

(assert (=> b!646405 (= lt!299873 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299876 (select (arr!18450 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!646405 e!370530))

(declare-fun res!418832 () Bool)

(assert (=> b!646405 (=> (not res!418832) (not e!370530))))

(assert (=> b!646405 (= res!418832 (arrayContainsKey!0 lt!299876 (select (arr!18450 a!2986) j!136) j!136))))

(declare-fun b!646406 () Bool)

(declare-fun e!370519 () Bool)

(assert (=> b!646406 (= e!370519 (arrayContainsKey!0 lt!299876 (select (arr!18450 a!2986) j!136) index!984))))

(declare-fun b!646407 () Bool)

(declare-fun Unit!21970 () Unit!21966)

(assert (=> b!646407 (= e!370518 Unit!21970)))

(declare-fun lt!299875 () Unit!21966)

(assert (=> b!646407 (= lt!299875 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299876 (select (arr!18450 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646407 (arrayContainsKey!0 lt!299876 (select (arr!18450 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299881 () Unit!21966)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12491) Unit!21966)

(assert (=> b!646407 (= lt!299881 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12488))))

(assert (=> b!646407 (arrayNoDuplicates!0 lt!299876 #b00000000000000000000000000000000 Nil!12488)))

(declare-fun lt!299880 () Unit!21966)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38479 (_ BitVec 32) (_ BitVec 32)) Unit!21966)

(assert (=> b!646407 (= lt!299880 (lemmaNoDuplicateFromThenFromBigger!0 lt!299876 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646407 (arrayNoDuplicates!0 lt!299876 j!136 Nil!12488)))

(declare-fun lt!299872 () Unit!21966)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38479 (_ BitVec 64) (_ BitVec 32) List!12491) Unit!21966)

(assert (=> b!646407 (= lt!299872 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299876 (select (arr!18450 a!2986) j!136) j!136 Nil!12488))))

(assert (=> b!646407 false))

(declare-fun res!418814 () Bool)

(assert (=> start!58544 (=> (not res!418814) (not e!370520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58544 (= res!418814 (validMask!0 mask!3053))))

(assert (=> start!58544 e!370520))

(assert (=> start!58544 true))

(declare-fun array_inv!14246 (array!38479) Bool)

(assert (=> start!58544 (array_inv!14246 a!2986)))

(declare-fun b!646408 () Bool)

(declare-fun res!418818 () Bool)

(assert (=> b!646408 (=> (not res!418818) (not e!370520))))

(assert (=> b!646408 (= res!418818 (validKeyInArray!0 (select (arr!18450 a!2986) j!136)))))

(declare-fun b!646409 () Bool)

(assert (=> b!646409 (= e!370521 e!370522)))

(declare-fun res!418816 () Bool)

(assert (=> b!646409 (=> (not res!418816) (not e!370522))))

(assert (=> b!646409 (= res!418816 (= (select (store (arr!18450 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646409 (= lt!299876 (array!38480 (store (arr!18450 a!2986) i!1108 k!1786) (size!18814 a!2986)))))

(declare-fun b!646410 () Bool)

(declare-fun Unit!21971 () Unit!21966)

(assert (=> b!646410 (= e!370518 Unit!21971)))

(declare-fun b!646411 () Bool)

(assert (=> b!646411 (= e!370525 e!370519)))

(declare-fun res!418830 () Bool)

(assert (=> b!646411 (=> (not res!418830) (not e!370519))))

(assert (=> b!646411 (= res!418830 (arrayContainsKey!0 lt!299876 (select (arr!18450 a!2986) j!136) j!136))))

(declare-fun b!646412 () Bool)

(declare-fun res!418823 () Bool)

(assert (=> b!646412 (=> (not res!418823) (not e!370520))))

(assert (=> b!646412 (= res!418823 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!58544 res!418814) b!646400))

(assert (= (and b!646400 res!418822) b!646408))

(assert (= (and b!646408 res!418818) b!646399))

(assert (= (and b!646399 res!418831) b!646412))

(assert (= (and b!646412 res!418823) b!646401))

(assert (= (and b!646401 res!418820) b!646396))

(assert (= (and b!646396 res!418829) b!646395))

(assert (= (and b!646395 res!418817) b!646391))

(assert (= (and b!646391 res!418827) b!646409))

(assert (= (and b!646409 res!418816) b!646390))

(assert (= (and b!646390 res!418828) b!646404))

(assert (= (and b!646404 res!418826) b!646394))

(assert (= (and b!646404 c!74156) b!646398))

(assert (= (and b!646404 (not c!74156)) b!646392))

(assert (= (and b!646404 (not res!418824)) b!646402))

(assert (= (and b!646402 res!418825) b!646403))

(assert (= (and b!646403 (not res!418815)) b!646411))

(assert (= (and b!646411 res!418830) b!646406))

(assert (= (and b!646402 (not res!418821)) b!646397))

(assert (= (and b!646397 c!74155) b!646407))

(assert (= (and b!646397 (not c!74155)) b!646410))

(assert (= (and b!646397 (not res!418819)) b!646405))

(assert (= (and b!646405 res!418832) b!646393))

(declare-fun m!619859 () Bool)

(assert (=> b!646390 m!619859))

(declare-fun m!619861 () Bool)

(assert (=> b!646390 m!619861))

(assert (=> b!646390 m!619861))

(declare-fun m!619863 () Bool)

(assert (=> b!646390 m!619863))

(declare-fun m!619865 () Bool)

(assert (=> b!646391 m!619865))

(declare-fun m!619867 () Bool)

(assert (=> b!646396 m!619867))

(declare-fun m!619869 () Bool)

(assert (=> b!646401 m!619869))

(assert (=> b!646411 m!619861))

(assert (=> b!646411 m!619861))

(declare-fun m!619871 () Bool)

(assert (=> b!646411 m!619871))

(declare-fun m!619873 () Bool)

(assert (=> b!646404 m!619873))

(declare-fun m!619875 () Bool)

(assert (=> b!646404 m!619875))

(assert (=> b!646404 m!619861))

(assert (=> b!646404 m!619861))

(declare-fun m!619877 () Bool)

(assert (=> b!646404 m!619877))

(declare-fun m!619879 () Bool)

(assert (=> b!646404 m!619879))

(declare-fun m!619881 () Bool)

(assert (=> b!646404 m!619881))

(declare-fun m!619883 () Bool)

(assert (=> b!646404 m!619883))

(declare-fun m!619885 () Bool)

(assert (=> b!646404 m!619885))

(assert (=> b!646393 m!619861))

(assert (=> b!646393 m!619861))

(declare-fun m!619887 () Bool)

(assert (=> b!646393 m!619887))

(declare-fun m!619889 () Bool)

(assert (=> b!646412 m!619889))

(assert (=> b!646403 m!619861))

(assert (=> b!646406 m!619861))

(assert (=> b!646406 m!619861))

(assert (=> b!646406 m!619887))

(declare-fun m!619891 () Bool)

(assert (=> b!646395 m!619891))

(assert (=> b!646408 m!619861))

(assert (=> b!646408 m!619861))

(declare-fun m!619893 () Bool)

(assert (=> b!646408 m!619893))

(assert (=> b!646402 m!619861))

(assert (=> b!646402 m!619885))

(declare-fun m!619895 () Bool)

(assert (=> b!646402 m!619895))

(declare-fun m!619897 () Bool)

(assert (=> start!58544 m!619897))

(declare-fun m!619899 () Bool)

(assert (=> start!58544 m!619899))

(assert (=> b!646407 m!619861))

(declare-fun m!619901 () Bool)

(assert (=> b!646407 m!619901))

(declare-fun m!619903 () Bool)

(assert (=> b!646407 m!619903))

(assert (=> b!646407 m!619861))

(declare-fun m!619905 () Bool)

(assert (=> b!646407 m!619905))

(assert (=> b!646407 m!619861))

(declare-fun m!619907 () Bool)

(assert (=> b!646407 m!619907))

(assert (=> b!646407 m!619861))

(declare-fun m!619909 () Bool)

(assert (=> b!646407 m!619909))

(declare-fun m!619911 () Bool)

(assert (=> b!646407 m!619911))

(declare-fun m!619913 () Bool)

(assert (=> b!646407 m!619913))

(assert (=> b!646409 m!619885))

(declare-fun m!619915 () Bool)

(assert (=> b!646409 m!619915))

(assert (=> b!646405 m!619861))

(assert (=> b!646405 m!619861))

(declare-fun m!619917 () Bool)

(assert (=> b!646405 m!619917))

(assert (=> b!646405 m!619861))

(declare-fun m!619919 () Bool)

(assert (=> b!646405 m!619919))

(assert (=> b!646405 m!619861))

(assert (=> b!646405 m!619871))

(declare-fun m!619921 () Bool)

(assert (=> b!646399 m!619921))

(push 1)

