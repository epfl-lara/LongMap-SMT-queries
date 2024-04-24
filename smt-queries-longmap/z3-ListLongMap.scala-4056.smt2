; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55614 () Bool)

(assert start!55614)

(declare-fun b!608234 () Bool)

(declare-fun res!390881 () Bool)

(declare-fun e!348334 () Bool)

(assert (=> b!608234 (=> (not res!390881) (not e!348334))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37290 0))(
  ( (array!37291 (arr!17893 (Array (_ BitVec 32) (_ BitVec 64))) (size!18257 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37290)

(assert (=> b!608234 (= res!390881 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17893 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608236 () Bool)

(declare-fun e!348331 () Bool)

(declare-datatypes ((SeekEntryResult!6289 0))(
  ( (MissingZero!6289 (index!27431 (_ BitVec 32))) (Found!6289 (index!27432 (_ BitVec 32))) (Intermediate!6289 (undefined!7101 Bool) (index!27433 (_ BitVec 32)) (x!56393 (_ BitVec 32))) (Undefined!6289) (MissingVacant!6289 (index!27434 (_ BitVec 32))) )
))
(declare-fun lt!277810 () SeekEntryResult!6289)

(declare-fun lt!277801 () SeekEntryResult!6289)

(assert (=> b!608236 (= e!348331 (= lt!277810 lt!277801))))

(declare-fun b!608237 () Bool)

(declare-fun e!348342 () Bool)

(declare-fun e!348337 () Bool)

(assert (=> b!608237 (= e!348342 e!348337)))

(declare-fun res!390864 () Bool)

(assert (=> b!608237 (=> res!390864 e!348337)))

(declare-fun lt!277799 () (_ BitVec 64))

(declare-fun lt!277797 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!608237 (= res!390864 (or (not (= (select (arr!17893 a!2986) j!136) lt!277797)) (not (= (select (arr!17893 a!2986) j!136) lt!277799)) (bvsge j!136 index!984)))))

(declare-fun b!608238 () Bool)

(declare-fun res!390878 () Bool)

(declare-fun e!348329 () Bool)

(assert (=> b!608238 (=> (not res!390878) (not e!348329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608238 (= res!390878 (validKeyInArray!0 (select (arr!17893 a!2986) j!136)))))

(declare-fun b!608239 () Bool)

(declare-fun res!390872 () Bool)

(declare-fun e!348336 () Bool)

(assert (=> b!608239 (=> res!390872 e!348336)))

(declare-datatypes ((List!11841 0))(
  ( (Nil!11838) (Cons!11837 (h!12885 (_ BitVec 64)) (t!18061 List!11841)) )
))
(declare-fun contains!2991 (List!11841 (_ BitVec 64)) Bool)

(assert (=> b!608239 (= res!390872 (contains!2991 Nil!11838 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!277807 () array!37290)

(declare-fun e!348333 () Bool)

(declare-fun b!608240 () Bool)

(declare-fun arrayContainsKey!0 (array!37290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608240 (= e!348333 (arrayContainsKey!0 lt!277807 (select (arr!17893 a!2986) j!136) index!984))))

(declare-fun b!608241 () Bool)

(declare-fun res!390877 () Bool)

(assert (=> b!608241 (=> (not res!390877) (not e!348329))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!608241 (= res!390877 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608242 () Bool)

(declare-fun res!390883 () Bool)

(assert (=> b!608242 (=> res!390883 e!348336)))

(declare-fun noDuplicate!325 (List!11841) Bool)

(assert (=> b!608242 (= res!390883 (not (noDuplicate!325 Nil!11838)))))

(declare-fun b!608243 () Bool)

(declare-fun res!390879 () Bool)

(assert (=> b!608243 (=> (not res!390879) (not e!348329))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!608243 (= res!390879 (and (= (size!18257 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18257 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18257 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608244 () Bool)

(declare-fun e!348332 () Bool)

(declare-fun e!348338 () Bool)

(assert (=> b!608244 (= e!348332 (not e!348338))))

(declare-fun res!390876 () Bool)

(assert (=> b!608244 (=> res!390876 e!348338)))

(declare-fun lt!277798 () SeekEntryResult!6289)

(assert (=> b!608244 (= res!390876 (not (= lt!277798 (Found!6289 index!984))))))

(declare-datatypes ((Unit!19387 0))(
  ( (Unit!19388) )
))
(declare-fun lt!277806 () Unit!19387)

(declare-fun e!348327 () Unit!19387)

(assert (=> b!608244 (= lt!277806 e!348327)))

(declare-fun c!69056 () Bool)

(assert (=> b!608244 (= c!69056 (= lt!277798 Undefined!6289))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37290 (_ BitVec 32)) SeekEntryResult!6289)

(assert (=> b!608244 (= lt!277798 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277797 lt!277807 mask!3053))))

(assert (=> b!608244 e!348331))

(declare-fun res!390871 () Bool)

(assert (=> b!608244 (=> (not res!390871) (not e!348331))))

(declare-fun lt!277796 () (_ BitVec 32))

(assert (=> b!608244 (= res!390871 (= lt!277801 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277796 vacantSpotIndex!68 lt!277797 lt!277807 mask!3053)))))

(assert (=> b!608244 (= lt!277801 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277796 vacantSpotIndex!68 (select (arr!17893 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608244 (= lt!277797 (select (store (arr!17893 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277795 () Unit!19387)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37290 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19387)

(assert (=> b!608244 (= lt!277795 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277796 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608244 (= lt!277796 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!608245 () Bool)

(declare-fun e!348330 () Bool)

(declare-fun e!348328 () Bool)

(assert (=> b!608245 (= e!348330 e!348328)))

(declare-fun res!390866 () Bool)

(assert (=> b!608245 (=> res!390866 e!348328)))

(assert (=> b!608245 (= res!390866 (bvsge index!984 j!136))))

(declare-fun lt!277804 () Unit!19387)

(declare-fun e!348339 () Unit!19387)

(assert (=> b!608245 (= lt!277804 e!348339)))

(declare-fun c!69055 () Bool)

(assert (=> b!608245 (= c!69055 (bvslt j!136 index!984))))

(declare-fun b!608246 () Bool)

(declare-fun res!390863 () Bool)

(assert (=> b!608246 (=> (not res!390863) (not e!348334))))

(declare-fun arrayNoDuplicates!0 (array!37290 (_ BitVec 32) List!11841) Bool)

(assert (=> b!608246 (= res!390863 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11838))))

(declare-fun b!608247 () Bool)

(declare-fun res!390861 () Bool)

(assert (=> b!608247 (=> (not res!390861) (not e!348334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37290 (_ BitVec 32)) Bool)

(assert (=> b!608247 (= res!390861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!390869 () Bool)

(assert (=> start!55614 (=> (not res!390869) (not e!348329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55614 (= res!390869 (validMask!0 mask!3053))))

(assert (=> start!55614 e!348329))

(assert (=> start!55614 true))

(declare-fun array_inv!13752 (array!37290) Bool)

(assert (=> start!55614 (array_inv!13752 a!2986)))

(declare-fun b!608235 () Bool)

(assert (=> b!608235 (= e!348337 e!348333)))

(declare-fun res!390882 () Bool)

(assert (=> b!608235 (=> (not res!390882) (not e!348333))))

(assert (=> b!608235 (= res!390882 (arrayContainsKey!0 lt!277807 (select (arr!17893 a!2986) j!136) j!136))))

(declare-fun b!608248 () Bool)

(declare-fun Unit!19389 () Unit!19387)

(assert (=> b!608248 (= e!348339 Unit!19389)))

(declare-fun lt!277802 () Unit!19387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37290 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19387)

(assert (=> b!608248 (= lt!277802 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277807 (select (arr!17893 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608248 (arrayContainsKey!0 lt!277807 (select (arr!17893 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277809 () Unit!19387)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37290 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11841) Unit!19387)

(assert (=> b!608248 (= lt!277809 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11838))))

(assert (=> b!608248 (arrayNoDuplicates!0 lt!277807 #b00000000000000000000000000000000 Nil!11838)))

(declare-fun lt!277805 () Unit!19387)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37290 (_ BitVec 32) (_ BitVec 32)) Unit!19387)

(assert (=> b!608248 (= lt!277805 (lemmaNoDuplicateFromThenFromBigger!0 lt!277807 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608248 (arrayNoDuplicates!0 lt!277807 j!136 Nil!11838)))

(declare-fun lt!277794 () Unit!19387)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37290 (_ BitVec 64) (_ BitVec 32) List!11841) Unit!19387)

(assert (=> b!608248 (= lt!277794 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277807 (select (arr!17893 a!2986) j!136) j!136 Nil!11838))))

(assert (=> b!608248 false))

(declare-fun b!608249 () Bool)

(assert (=> b!608249 (= e!348328 e!348336)))

(declare-fun res!390880 () Bool)

(assert (=> b!608249 (=> res!390880 e!348336)))

(assert (=> b!608249 (= res!390880 (or (bvsge (size!18257 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18257 a!2986))))))

(assert (=> b!608249 (arrayContainsKey!0 lt!277807 (select (arr!17893 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277803 () Unit!19387)

(assert (=> b!608249 (= lt!277803 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277807 (select (arr!17893 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348341 () Bool)

(assert (=> b!608249 e!348341))

(declare-fun res!390865 () Bool)

(assert (=> b!608249 (=> (not res!390865) (not e!348341))))

(assert (=> b!608249 (= res!390865 (arrayContainsKey!0 lt!277807 (select (arr!17893 a!2986) j!136) j!136))))

(declare-fun b!608250 () Bool)

(declare-fun e!348335 () Bool)

(assert (=> b!608250 (= e!348334 e!348335)))

(declare-fun res!390868 () Bool)

(assert (=> b!608250 (=> (not res!390868) (not e!348335))))

(assert (=> b!608250 (= res!390868 (= (select (store (arr!17893 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608250 (= lt!277807 (array!37291 (store (arr!17893 a!2986) i!1108 k0!1786) (size!18257 a!2986)))))

(declare-fun b!608251 () Bool)

(assert (=> b!608251 (= e!348341 (arrayContainsKey!0 lt!277807 (select (arr!17893 a!2986) j!136) index!984))))

(declare-fun b!608252 () Bool)

(declare-fun Unit!19390 () Unit!19387)

(assert (=> b!608252 (= e!348327 Unit!19390)))

(declare-fun b!608253 () Bool)

(assert (=> b!608253 (= e!348329 e!348334)))

(declare-fun res!390874 () Bool)

(assert (=> b!608253 (=> (not res!390874) (not e!348334))))

(declare-fun lt!277808 () SeekEntryResult!6289)

(assert (=> b!608253 (= res!390874 (or (= lt!277808 (MissingZero!6289 i!1108)) (= lt!277808 (MissingVacant!6289 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37290 (_ BitVec 32)) SeekEntryResult!6289)

(assert (=> b!608253 (= lt!277808 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608254 () Bool)

(declare-fun res!390870 () Bool)

(assert (=> b!608254 (=> res!390870 e!348336)))

(assert (=> b!608254 (= res!390870 (contains!2991 Nil!11838 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608255 () Bool)

(declare-fun res!390867 () Bool)

(assert (=> b!608255 (=> (not res!390867) (not e!348329))))

(assert (=> b!608255 (= res!390867 (validKeyInArray!0 k0!1786))))

(declare-fun b!608256 () Bool)

(declare-fun Unit!19391 () Unit!19387)

(assert (=> b!608256 (= e!348339 Unit!19391)))

(declare-fun b!608257 () Bool)

(assert (=> b!608257 (= e!348335 e!348332)))

(declare-fun res!390873 () Bool)

(assert (=> b!608257 (=> (not res!390873) (not e!348332))))

(assert (=> b!608257 (= res!390873 (and (= lt!277810 (Found!6289 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17893 a!2986) index!984) (select (arr!17893 a!2986) j!136))) (not (= (select (arr!17893 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608257 (= lt!277810 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17893 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608258 () Bool)

(assert (=> b!608258 (= e!348336 true)))

(declare-fun lt!277800 () Bool)

(assert (=> b!608258 (= lt!277800 (contains!2991 Nil!11838 k0!1786))))

(declare-fun b!608259 () Bool)

(assert (=> b!608259 (= e!348338 e!348330)))

(declare-fun res!390875 () Bool)

(assert (=> b!608259 (=> res!390875 e!348330)))

(assert (=> b!608259 (= res!390875 (or (not (= (select (arr!17893 a!2986) j!136) lt!277797)) (not (= (select (arr!17893 a!2986) j!136) lt!277799))))))

(assert (=> b!608259 e!348342))

(declare-fun res!390862 () Bool)

(assert (=> b!608259 (=> (not res!390862) (not e!348342))))

(assert (=> b!608259 (= res!390862 (= lt!277799 (select (arr!17893 a!2986) j!136)))))

(assert (=> b!608259 (= lt!277799 (select (store (arr!17893 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608260 () Bool)

(declare-fun Unit!19392 () Unit!19387)

(assert (=> b!608260 (= e!348327 Unit!19392)))

(assert (=> b!608260 false))

(assert (= (and start!55614 res!390869) b!608243))

(assert (= (and b!608243 res!390879) b!608238))

(assert (= (and b!608238 res!390878) b!608255))

(assert (= (and b!608255 res!390867) b!608241))

(assert (= (and b!608241 res!390877) b!608253))

(assert (= (and b!608253 res!390874) b!608247))

(assert (= (and b!608247 res!390861) b!608246))

(assert (= (and b!608246 res!390863) b!608234))

(assert (= (and b!608234 res!390881) b!608250))

(assert (= (and b!608250 res!390868) b!608257))

(assert (= (and b!608257 res!390873) b!608244))

(assert (= (and b!608244 res!390871) b!608236))

(assert (= (and b!608244 c!69056) b!608260))

(assert (= (and b!608244 (not c!69056)) b!608252))

(assert (= (and b!608244 (not res!390876)) b!608259))

(assert (= (and b!608259 res!390862) b!608237))

(assert (= (and b!608237 (not res!390864)) b!608235))

(assert (= (and b!608235 res!390882) b!608240))

(assert (= (and b!608259 (not res!390875)) b!608245))

(assert (= (and b!608245 c!69055) b!608248))

(assert (= (and b!608245 (not c!69055)) b!608256))

(assert (= (and b!608245 (not res!390866)) b!608249))

(assert (= (and b!608249 res!390865) b!608251))

(assert (= (and b!608249 (not res!390880)) b!608242))

(assert (= (and b!608242 (not res!390883)) b!608239))

(assert (= (and b!608239 (not res!390872)) b!608254))

(assert (= (and b!608254 (not res!390870)) b!608258))

(declare-fun m!585167 () Bool)

(assert (=> b!608238 m!585167))

(assert (=> b!608238 m!585167))

(declare-fun m!585169 () Bool)

(assert (=> b!608238 m!585169))

(declare-fun m!585171 () Bool)

(assert (=> b!608247 m!585171))

(declare-fun m!585173 () Bool)

(assert (=> b!608250 m!585173))

(declare-fun m!585175 () Bool)

(assert (=> b!608250 m!585175))

(declare-fun m!585177 () Bool)

(assert (=> b!608255 m!585177))

(assert (=> b!608240 m!585167))

(assert (=> b!608240 m!585167))

(declare-fun m!585179 () Bool)

(assert (=> b!608240 m!585179))

(assert (=> b!608249 m!585167))

(assert (=> b!608249 m!585167))

(declare-fun m!585181 () Bool)

(assert (=> b!608249 m!585181))

(assert (=> b!608249 m!585167))

(declare-fun m!585183 () Bool)

(assert (=> b!608249 m!585183))

(assert (=> b!608249 m!585167))

(declare-fun m!585185 () Bool)

(assert (=> b!608249 m!585185))

(assert (=> b!608248 m!585167))

(declare-fun m!585187 () Bool)

(assert (=> b!608248 m!585187))

(assert (=> b!608248 m!585167))

(declare-fun m!585189 () Bool)

(assert (=> b!608248 m!585189))

(assert (=> b!608248 m!585167))

(declare-fun m!585191 () Bool)

(assert (=> b!608248 m!585191))

(declare-fun m!585193 () Bool)

(assert (=> b!608248 m!585193))

(declare-fun m!585195 () Bool)

(assert (=> b!608248 m!585195))

(assert (=> b!608248 m!585167))

(declare-fun m!585197 () Bool)

(assert (=> b!608248 m!585197))

(declare-fun m!585199 () Bool)

(assert (=> b!608248 m!585199))

(declare-fun m!585201 () Bool)

(assert (=> b!608234 m!585201))

(assert (=> b!608235 m!585167))

(assert (=> b!608235 m!585167))

(assert (=> b!608235 m!585185))

(declare-fun m!585203 () Bool)

(assert (=> b!608246 m!585203))

(assert (=> b!608237 m!585167))

(declare-fun m!585205 () Bool)

(assert (=> b!608254 m!585205))

(declare-fun m!585207 () Bool)

(assert (=> start!55614 m!585207))

(declare-fun m!585209 () Bool)

(assert (=> start!55614 m!585209))

(assert (=> b!608259 m!585167))

(assert (=> b!608259 m!585173))

(declare-fun m!585211 () Bool)

(assert (=> b!608259 m!585211))

(declare-fun m!585213 () Bool)

(assert (=> b!608244 m!585213))

(assert (=> b!608244 m!585173))

(declare-fun m!585215 () Bool)

(assert (=> b!608244 m!585215))

(assert (=> b!608244 m!585167))

(declare-fun m!585217 () Bool)

(assert (=> b!608244 m!585217))

(declare-fun m!585219 () Bool)

(assert (=> b!608244 m!585219))

(declare-fun m!585221 () Bool)

(assert (=> b!608244 m!585221))

(assert (=> b!608244 m!585167))

(declare-fun m!585223 () Bool)

(assert (=> b!608244 m!585223))

(declare-fun m!585225 () Bool)

(assert (=> b!608253 m!585225))

(declare-fun m!585227 () Bool)

(assert (=> b!608242 m!585227))

(declare-fun m!585229 () Bool)

(assert (=> b!608257 m!585229))

(assert (=> b!608257 m!585167))

(assert (=> b!608257 m!585167))

(declare-fun m!585231 () Bool)

(assert (=> b!608257 m!585231))

(declare-fun m!585233 () Bool)

(assert (=> b!608239 m!585233))

(declare-fun m!585235 () Bool)

(assert (=> b!608241 m!585235))

(assert (=> b!608251 m!585167))

(assert (=> b!608251 m!585167))

(assert (=> b!608251 m!585179))

(declare-fun m!585237 () Bool)

(assert (=> b!608258 m!585237))

(check-sat (not b!608235) (not b!608255) (not start!55614) (not b!608242) (not b!608239) (not b!608246) (not b!608253) (not b!608258) (not b!608249) (not b!608238) (not b!608257) (not b!608240) (not b!608244) (not b!608251) (not b!608254) (not b!608248) (not b!608247) (not b!608241))
(check-sat)
