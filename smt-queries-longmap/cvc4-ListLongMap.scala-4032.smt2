; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54902 () Bool)

(assert start!54902)

(declare-fun b!601043 () Bool)

(declare-fun e!343651 () Bool)

(declare-fun e!343656 () Bool)

(assert (=> b!601043 (= e!343651 e!343656)))

(declare-fun res!385874 () Bool)

(assert (=> b!601043 (=> (not res!385874) (not e!343656))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37137 0))(
  ( (array!37138 (arr!17828 (Array (_ BitVec 32) (_ BitVec 64))) (size!18192 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37137)

(assert (=> b!601043 (= res!385874 (= (select (store (arr!17828 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!273518 () array!37137)

(assert (=> b!601043 (= lt!273518 (array!37138 (store (arr!17828 a!2986) i!1108 k!1786) (size!18192 a!2986)))))

(declare-fun b!601044 () Bool)

(declare-fun e!343654 () Bool)

(declare-fun e!343657 () Bool)

(assert (=> b!601044 (= e!343654 (not e!343657))))

(declare-fun res!385887 () Bool)

(assert (=> b!601044 (=> res!385887 e!343657)))

(declare-datatypes ((SeekEntryResult!6268 0))(
  ( (MissingZero!6268 (index!27329 (_ BitVec 32))) (Found!6268 (index!27330 (_ BitVec 32))) (Intermediate!6268 (undefined!7080 Bool) (index!27331 (_ BitVec 32)) (x!56123 (_ BitVec 32))) (Undefined!6268) (MissingVacant!6268 (index!27332 (_ BitVec 32))) )
))
(declare-fun lt!273527 () SeekEntryResult!6268)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!601044 (= res!385887 (not (= lt!273527 (Found!6268 index!984))))))

(declare-datatypes ((Unit!18990 0))(
  ( (Unit!18991) )
))
(declare-fun lt!273529 () Unit!18990)

(declare-fun e!343652 () Unit!18990)

(assert (=> b!601044 (= lt!273529 e!343652)))

(declare-fun c!67952 () Bool)

(assert (=> b!601044 (= c!67952 (= lt!273527 Undefined!6268))))

(declare-fun lt!273516 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37137 (_ BitVec 32)) SeekEntryResult!6268)

(assert (=> b!601044 (= lt!273527 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273516 lt!273518 mask!3053))))

(declare-fun e!343650 () Bool)

(assert (=> b!601044 e!343650))

(declare-fun res!385882 () Bool)

(assert (=> b!601044 (=> (not res!385882) (not e!343650))))

(declare-fun lt!273523 () (_ BitVec 32))

(declare-fun lt!273521 () SeekEntryResult!6268)

(assert (=> b!601044 (= res!385882 (= lt!273521 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273523 vacantSpotIndex!68 lt!273516 lt!273518 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!601044 (= lt!273521 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273523 vacantSpotIndex!68 (select (arr!17828 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601044 (= lt!273516 (select (store (arr!17828 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273524 () Unit!18990)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18990)

(assert (=> b!601044 (= lt!273524 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273523 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601044 (= lt!273523 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601045 () Bool)

(declare-fun e!343659 () Bool)

(assert (=> b!601045 (= e!343657 e!343659)))

(declare-fun res!385875 () Bool)

(assert (=> b!601045 (=> res!385875 e!343659)))

(declare-fun lt!273528 () (_ BitVec 64))

(assert (=> b!601045 (= res!385875 (or (not (= (select (arr!17828 a!2986) j!136) lt!273516)) (not (= (select (arr!17828 a!2986) j!136) lt!273528)) (bvsge j!136 index!984)))))

(declare-fun e!343662 () Bool)

(assert (=> b!601045 e!343662))

(declare-fun res!385886 () Bool)

(assert (=> b!601045 (=> (not res!385886) (not e!343662))))

(assert (=> b!601045 (= res!385886 (= lt!273528 (select (arr!17828 a!2986) j!136)))))

(assert (=> b!601045 (= lt!273528 (select (store (arr!17828 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!601046 () Bool)

(declare-fun e!343655 () Bool)

(assert (=> b!601046 (= e!343655 e!343651)))

(declare-fun res!385878 () Bool)

(assert (=> b!601046 (=> (not res!385878) (not e!343651))))

(declare-fun lt!273520 () SeekEntryResult!6268)

(assert (=> b!601046 (= res!385878 (or (= lt!273520 (MissingZero!6268 i!1108)) (= lt!273520 (MissingVacant!6268 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37137 (_ BitVec 32)) SeekEntryResult!6268)

(assert (=> b!601046 (= lt!273520 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!601047 () Bool)

(declare-fun res!385891 () Bool)

(assert (=> b!601047 (=> (not res!385891) (not e!343651))))

(assert (=> b!601047 (= res!385891 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17828 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601048 () Bool)

(declare-fun res!385892 () Bool)

(assert (=> b!601048 (=> (not res!385892) (not e!343655))))

(assert (=> b!601048 (= res!385892 (and (= (size!18192 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18192 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18192 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601049 () Bool)

(declare-fun res!385890 () Bool)

(declare-fun e!343653 () Bool)

(assert (=> b!601049 (=> res!385890 e!343653)))

(declare-datatypes ((List!11869 0))(
  ( (Nil!11866) (Cons!11865 (h!12910 (_ BitVec 64)) (t!18097 List!11869)) )
))
(declare-fun contains!2985 (List!11869 (_ BitVec 64)) Bool)

(assert (=> b!601049 (= res!385890 (contains!2985 Nil!11866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!601050 () Bool)

(declare-fun res!385879 () Bool)

(assert (=> b!601050 (=> res!385879 e!343653)))

(declare-fun noDuplicate!302 (List!11869) Bool)

(assert (=> b!601050 (= res!385879 (not (noDuplicate!302 Nil!11866)))))

(declare-fun e!343661 () Bool)

(declare-fun b!601051 () Bool)

(declare-fun arrayContainsKey!0 (array!37137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601051 (= e!343661 (arrayContainsKey!0 lt!273518 (select (arr!17828 a!2986) j!136) index!984))))

(declare-fun b!601053 () Bool)

(declare-fun res!385880 () Bool)

(assert (=> b!601053 (=> (not res!385880) (not e!343651))))

(declare-fun arrayNoDuplicates!0 (array!37137 (_ BitVec 32) List!11869) Bool)

(assert (=> b!601053 (= res!385880 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11866))))

(declare-fun b!601054 () Bool)

(declare-fun res!385883 () Bool)

(assert (=> b!601054 (=> (not res!385883) (not e!343655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601054 (= res!385883 (validKeyInArray!0 (select (arr!17828 a!2986) j!136)))))

(declare-fun b!601055 () Bool)

(declare-fun res!385885 () Bool)

(assert (=> b!601055 (=> (not res!385885) (not e!343655))))

(assert (=> b!601055 (= res!385885 (validKeyInArray!0 k!1786))))

(declare-fun b!601056 () Bool)

(declare-fun res!385877 () Bool)

(assert (=> b!601056 (=> (not res!385877) (not e!343651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37137 (_ BitVec 32)) Bool)

(assert (=> b!601056 (= res!385877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601057 () Bool)

(declare-fun Unit!18992 () Unit!18990)

(assert (=> b!601057 (= e!343652 Unit!18992)))

(assert (=> b!601057 false))

(declare-fun b!601058 () Bool)

(assert (=> b!601058 (= e!343659 e!343653)))

(declare-fun res!385884 () Bool)

(assert (=> b!601058 (=> res!385884 e!343653)))

(assert (=> b!601058 (= res!385884 (or (bvsge (size!18192 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18192 a!2986))))))

(assert (=> b!601058 (arrayNoDuplicates!0 lt!273518 j!136 Nil!11866)))

(declare-fun lt!273525 () Unit!18990)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37137 (_ BitVec 32) (_ BitVec 32)) Unit!18990)

(assert (=> b!601058 (= lt!273525 (lemmaNoDuplicateFromThenFromBigger!0 lt!273518 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601058 (arrayNoDuplicates!0 lt!273518 #b00000000000000000000000000000000 Nil!11866)))

(declare-fun lt!273519 () Unit!18990)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37137 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11869) Unit!18990)

(assert (=> b!601058 (= lt!273519 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11866))))

(assert (=> b!601058 (arrayContainsKey!0 lt!273518 (select (arr!17828 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273522 () Unit!18990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37137 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18990)

(assert (=> b!601058 (= lt!273522 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273518 (select (arr!17828 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!601059 () Bool)

(declare-fun Unit!18993 () Unit!18990)

(assert (=> b!601059 (= e!343652 Unit!18993)))

(declare-fun b!601060 () Bool)

(assert (=> b!601060 (= e!343656 e!343654)))

(declare-fun res!385881 () Bool)

(assert (=> b!601060 (=> (not res!385881) (not e!343654))))

(declare-fun lt!273526 () SeekEntryResult!6268)

(assert (=> b!601060 (= res!385881 (and (= lt!273526 (Found!6268 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17828 a!2986) index!984) (select (arr!17828 a!2986) j!136))) (not (= (select (arr!17828 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601060 (= lt!273526 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17828 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601061 () Bool)

(assert (=> b!601061 (= e!343653 true)))

(declare-fun lt!273517 () Bool)

(assert (=> b!601061 (= lt!273517 (contains!2985 Nil!11866 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!601062 () Bool)

(declare-fun e!343660 () Bool)

(assert (=> b!601062 (= e!343662 e!343660)))

(declare-fun res!385888 () Bool)

(assert (=> b!601062 (=> res!385888 e!343660)))

(assert (=> b!601062 (= res!385888 (or (not (= (select (arr!17828 a!2986) j!136) lt!273516)) (not (= (select (arr!17828 a!2986) j!136) lt!273528)) (bvsge j!136 index!984)))))

(declare-fun b!601063 () Bool)

(assert (=> b!601063 (= e!343650 (= lt!273526 lt!273521))))

(declare-fun b!601064 () Bool)

(declare-fun res!385889 () Bool)

(assert (=> b!601064 (=> (not res!385889) (not e!343655))))

(assert (=> b!601064 (= res!385889 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!385876 () Bool)

(assert (=> start!54902 (=> (not res!385876) (not e!343655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54902 (= res!385876 (validMask!0 mask!3053))))

(assert (=> start!54902 e!343655))

(assert (=> start!54902 true))

(declare-fun array_inv!13624 (array!37137) Bool)

(assert (=> start!54902 (array_inv!13624 a!2986)))

(declare-fun b!601052 () Bool)

(assert (=> b!601052 (= e!343660 e!343661)))

(declare-fun res!385873 () Bool)

(assert (=> b!601052 (=> (not res!385873) (not e!343661))))

(assert (=> b!601052 (= res!385873 (arrayContainsKey!0 lt!273518 (select (arr!17828 a!2986) j!136) j!136))))

(assert (= (and start!54902 res!385876) b!601048))

(assert (= (and b!601048 res!385892) b!601054))

(assert (= (and b!601054 res!385883) b!601055))

(assert (= (and b!601055 res!385885) b!601064))

(assert (= (and b!601064 res!385889) b!601046))

(assert (= (and b!601046 res!385878) b!601056))

(assert (= (and b!601056 res!385877) b!601053))

(assert (= (and b!601053 res!385880) b!601047))

(assert (= (and b!601047 res!385891) b!601043))

(assert (= (and b!601043 res!385874) b!601060))

(assert (= (and b!601060 res!385881) b!601044))

(assert (= (and b!601044 res!385882) b!601063))

(assert (= (and b!601044 c!67952) b!601057))

(assert (= (and b!601044 (not c!67952)) b!601059))

(assert (= (and b!601044 (not res!385887)) b!601045))

(assert (= (and b!601045 res!385886) b!601062))

(assert (= (and b!601062 (not res!385888)) b!601052))

(assert (= (and b!601052 res!385873) b!601051))

(assert (= (and b!601045 (not res!385875)) b!601058))

(assert (= (and b!601058 (not res!385884)) b!601050))

(assert (= (and b!601050 (not res!385879)) b!601049))

(assert (= (and b!601049 (not res!385890)) b!601061))

(declare-fun m!578245 () Bool)

(assert (=> b!601044 m!578245))

(declare-fun m!578247 () Bool)

(assert (=> b!601044 m!578247))

(declare-fun m!578249 () Bool)

(assert (=> b!601044 m!578249))

(declare-fun m!578251 () Bool)

(assert (=> b!601044 m!578251))

(declare-fun m!578253 () Bool)

(assert (=> b!601044 m!578253))

(declare-fun m!578255 () Bool)

(assert (=> b!601044 m!578255))

(declare-fun m!578257 () Bool)

(assert (=> b!601044 m!578257))

(assert (=> b!601044 m!578249))

(declare-fun m!578259 () Bool)

(assert (=> b!601044 m!578259))

(assert (=> b!601058 m!578249))

(declare-fun m!578261 () Bool)

(assert (=> b!601058 m!578261))

(assert (=> b!601058 m!578249))

(declare-fun m!578263 () Bool)

(assert (=> b!601058 m!578263))

(declare-fun m!578265 () Bool)

(assert (=> b!601058 m!578265))

(declare-fun m!578267 () Bool)

(assert (=> b!601058 m!578267))

(assert (=> b!601058 m!578249))

(declare-fun m!578269 () Bool)

(assert (=> b!601058 m!578269))

(declare-fun m!578271 () Bool)

(assert (=> b!601058 m!578271))

(declare-fun m!578273 () Bool)

(assert (=> b!601047 m!578273))

(declare-fun m!578275 () Bool)

(assert (=> b!601046 m!578275))

(assert (=> b!601051 m!578249))

(assert (=> b!601051 m!578249))

(declare-fun m!578277 () Bool)

(assert (=> b!601051 m!578277))

(declare-fun m!578279 () Bool)

(assert (=> b!601049 m!578279))

(assert (=> b!601045 m!578249))

(assert (=> b!601045 m!578253))

(declare-fun m!578281 () Bool)

(assert (=> b!601045 m!578281))

(assert (=> b!601054 m!578249))

(assert (=> b!601054 m!578249))

(declare-fun m!578283 () Bool)

(assert (=> b!601054 m!578283))

(assert (=> b!601052 m!578249))

(assert (=> b!601052 m!578249))

(declare-fun m!578285 () Bool)

(assert (=> b!601052 m!578285))

(declare-fun m!578287 () Bool)

(assert (=> b!601060 m!578287))

(assert (=> b!601060 m!578249))

(assert (=> b!601060 m!578249))

(declare-fun m!578289 () Bool)

(assert (=> b!601060 m!578289))

(declare-fun m!578291 () Bool)

(assert (=> b!601050 m!578291))

(declare-fun m!578293 () Bool)

(assert (=> b!601056 m!578293))

(declare-fun m!578295 () Bool)

(assert (=> b!601055 m!578295))

(declare-fun m!578297 () Bool)

(assert (=> b!601064 m!578297))

(assert (=> b!601043 m!578253))

(declare-fun m!578299 () Bool)

(assert (=> b!601043 m!578299))

(declare-fun m!578301 () Bool)

(assert (=> b!601053 m!578301))

(declare-fun m!578303 () Bool)

(assert (=> start!54902 m!578303))

(declare-fun m!578305 () Bool)

(assert (=> start!54902 m!578305))

(assert (=> b!601062 m!578249))

(declare-fun m!578307 () Bool)

(assert (=> b!601061 m!578307))

(push 1)

