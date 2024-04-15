; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59450 () Bool)

(assert start!59450)

(declare-fun b!656235 () Bool)

(declare-datatypes ((Unit!22622 0))(
  ( (Unit!22623) )
))
(declare-fun e!376899 () Unit!22622)

(declare-fun Unit!22624 () Unit!22622)

(assert (=> b!656235 (= e!376899 Unit!22624)))

(declare-fun b!656236 () Bool)

(declare-fun e!376896 () Unit!22622)

(declare-fun Unit!22625 () Unit!22622)

(assert (=> b!656236 (= e!376896 Unit!22625)))

(assert (=> b!656236 false))

(declare-fun b!656237 () Bool)

(declare-fun res!425679 () Bool)

(declare-fun e!376893 () Bool)

(assert (=> b!656237 (=> (not res!425679) (not e!376893))))

(declare-datatypes ((array!38700 0))(
  ( (array!38701 (arr!18548 (Array (_ BitVec 32) (_ BitVec 64))) (size!18913 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38700)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38700 (_ BitVec 32)) Bool)

(assert (=> b!656237 (= res!425679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!656238 () Bool)

(declare-fun e!376903 () Unit!22622)

(declare-fun Unit!22626 () Unit!22622)

(assert (=> b!656238 (= e!376903 Unit!22626)))

(declare-fun res!425678 () Bool)

(declare-fun lt!306210 () array!38700)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!656239 () Bool)

(declare-fun arrayContainsKey!0 (array!38700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!656239 (= res!425678 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) j!136))))

(declare-fun e!376898 () Bool)

(assert (=> b!656239 (=> (not res!425678) (not e!376898))))

(declare-fun e!376894 () Bool)

(assert (=> b!656239 (= e!376894 e!376898)))

(declare-fun b!656240 () Bool)

(declare-fun res!425670 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!656240 (= res!425670 (bvsge j!136 index!984))))

(assert (=> b!656240 (=> res!425670 e!376894)))

(declare-fun e!376895 () Bool)

(assert (=> b!656240 (= e!376895 e!376894)))

(declare-fun b!656241 () Bool)

(declare-fun Unit!22627 () Unit!22622)

(assert (=> b!656241 (= e!376896 Unit!22627)))

(declare-fun b!656242 () Bool)

(declare-fun e!376905 () Bool)

(declare-fun e!376904 () Bool)

(assert (=> b!656242 (= e!376905 (not e!376904))))

(declare-fun res!425682 () Bool)

(assert (=> b!656242 (=> res!425682 e!376904)))

(declare-datatypes ((SeekEntryResult!6985 0))(
  ( (MissingZero!6985 (index!30302 (_ BitVec 32))) (Found!6985 (index!30303 (_ BitVec 32))) (Intermediate!6985 (undefined!7797 Bool) (index!30304 (_ BitVec 32)) (x!59102 (_ BitVec 32))) (Undefined!6985) (MissingVacant!6985 (index!30305 (_ BitVec 32))) )
))
(declare-fun lt!306214 () SeekEntryResult!6985)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!656242 (= res!425682 (not (= lt!306214 (MissingVacant!6985 vacantSpotIndex!68))))))

(declare-fun lt!306209 () Unit!22622)

(declare-fun e!376906 () Unit!22622)

(assert (=> b!656242 (= lt!306209 e!376906)))

(declare-fun c!75653 () Bool)

(assert (=> b!656242 (= c!75653 (= lt!306214 (Found!6985 index!984)))))

(declare-fun lt!306201 () Unit!22622)

(assert (=> b!656242 (= lt!306201 e!376896)))

(declare-fun c!75651 () Bool)

(assert (=> b!656242 (= c!75651 (= lt!306214 Undefined!6985))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!306207 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38700 (_ BitVec 32)) SeekEntryResult!6985)

(assert (=> b!656242 (= lt!306214 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306207 lt!306210 mask!3053))))

(declare-fun e!376901 () Bool)

(assert (=> b!656242 e!376901))

(declare-fun res!425669 () Bool)

(assert (=> b!656242 (=> (not res!425669) (not e!376901))))

(declare-fun lt!306211 () (_ BitVec 32))

(declare-fun lt!306202 () SeekEntryResult!6985)

(assert (=> b!656242 (= res!425669 (= lt!306202 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306211 vacantSpotIndex!68 lt!306207 lt!306210 mask!3053)))))

(assert (=> b!656242 (= lt!306202 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306211 vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!656242 (= lt!306207 (select (store (arr!18548 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306204 () Unit!22622)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38700 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22622)

(assert (=> b!656242 (= lt!306204 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306211 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!656242 (= lt!306211 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!656243 () Bool)

(declare-fun e!376907 () Bool)

(assert (=> b!656243 (= e!376893 e!376907)))

(declare-fun res!425674 () Bool)

(assert (=> b!656243 (=> (not res!425674) (not e!376907))))

(assert (=> b!656243 (= res!425674 (= (select (store (arr!18548 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656243 (= lt!306210 (array!38701 (store (arr!18548 a!2986) i!1108 k0!1786) (size!18913 a!2986)))))

(declare-fun b!656245 () Bool)

(declare-fun res!425681 () Bool)

(declare-fun e!376900 () Bool)

(assert (=> b!656245 (=> (not res!425681) (not e!376900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!656245 (= res!425681 (validKeyInArray!0 k0!1786))))

(declare-fun b!656246 () Bool)

(declare-fun res!425673 () Bool)

(assert (=> b!656246 (=> (not res!425673) (not e!376900))))

(assert (=> b!656246 (= res!425673 (validKeyInArray!0 (select (arr!18548 a!2986) j!136)))))

(declare-fun b!656247 () Bool)

(assert (=> b!656247 (= e!376904 false)))

(assert (=> b!656247 (= (select (store (arr!18548 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!656248 () Bool)

(declare-fun res!425680 () Bool)

(assert (=> b!656248 (=> (not res!425680) (not e!376900))))

(assert (=> b!656248 (= res!425680 (and (= (size!18913 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18913 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18913 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!656249 () Bool)

(assert (=> b!656249 (= e!376898 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) index!984))))

(declare-fun b!656250 () Bool)

(declare-fun Unit!22628 () Unit!22622)

(assert (=> b!656250 (= e!376906 Unit!22628)))

(declare-fun b!656251 () Bool)

(assert (=> b!656251 (= e!376907 e!376905)))

(declare-fun res!425675 () Bool)

(assert (=> b!656251 (=> (not res!425675) (not e!376905))))

(declare-fun lt!306215 () SeekEntryResult!6985)

(assert (=> b!656251 (= res!425675 (and (= lt!306215 (Found!6985 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18548 a!2986) index!984) (select (arr!18548 a!2986) j!136))) (not (= (select (arr!18548 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!656251 (= lt!306215 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656252 () Bool)

(assert (=> b!656252 (= e!376901 (= lt!306215 lt!306202))))

(declare-fun b!656253 () Bool)

(assert (=> b!656253 false))

(declare-fun lt!306218 () Unit!22622)

(declare-datatypes ((List!12628 0))(
  ( (Nil!12625) (Cons!12624 (h!13669 (_ BitVec 64)) (t!18847 List!12628)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38700 (_ BitVec 64) (_ BitVec 32) List!12628) Unit!22622)

(assert (=> b!656253 (= lt!306218 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306210 (select (arr!18548 a!2986) j!136) j!136 Nil!12625))))

(declare-fun arrayNoDuplicates!0 (array!38700 (_ BitVec 32) List!12628) Bool)

(assert (=> b!656253 (arrayNoDuplicates!0 lt!306210 j!136 Nil!12625)))

(declare-fun lt!306206 () Unit!22622)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38700 (_ BitVec 32) (_ BitVec 32)) Unit!22622)

(assert (=> b!656253 (= lt!306206 (lemmaNoDuplicateFromThenFromBigger!0 lt!306210 #b00000000000000000000000000000000 j!136))))

(assert (=> b!656253 (arrayNoDuplicates!0 lt!306210 #b00000000000000000000000000000000 Nil!12625)))

(declare-fun lt!306212 () Unit!22622)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38700 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12628) Unit!22622)

(assert (=> b!656253 (= lt!306212 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12625))))

(assert (=> b!656253 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306200 () Unit!22622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38700 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22622)

(assert (=> b!656253 (= lt!306200 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306210 (select (arr!18548 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22629 () Unit!22622)

(assert (=> b!656253 (= e!376903 Unit!22629)))

(declare-fun b!656254 () Bool)

(declare-fun Unit!22630 () Unit!22622)

(assert (=> b!656254 (= e!376906 Unit!22630)))

(declare-fun res!425667 () Bool)

(assert (=> b!656254 (= res!425667 (= (select (store (arr!18548 a!2986) i!1108 k0!1786) index!984) (select (arr!18548 a!2986) j!136)))))

(assert (=> b!656254 (=> (not res!425667) (not e!376895))))

(assert (=> b!656254 e!376895))

(declare-fun c!75652 () Bool)

(assert (=> b!656254 (= c!75652 (bvslt j!136 index!984))))

(declare-fun lt!306203 () Unit!22622)

(assert (=> b!656254 (= lt!306203 e!376903)))

(declare-fun c!75654 () Bool)

(assert (=> b!656254 (= c!75654 (bvslt index!984 j!136))))

(declare-fun lt!306219 () Unit!22622)

(assert (=> b!656254 (= lt!306219 e!376899)))

(assert (=> b!656254 false))

(declare-fun b!656255 () Bool)

(declare-fun res!425668 () Bool)

(assert (=> b!656255 (=> (not res!425668) (not e!376900))))

(assert (=> b!656255 (= res!425668 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!656244 () Bool)

(declare-fun res!425677 () Bool)

(assert (=> b!656244 (=> (not res!425677) (not e!376893))))

(assert (=> b!656244 (= res!425677 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12625))))

(declare-fun res!425672 () Bool)

(assert (=> start!59450 (=> (not res!425672) (not e!376900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59450 (= res!425672 (validMask!0 mask!3053))))

(assert (=> start!59450 e!376900))

(assert (=> start!59450 true))

(declare-fun array_inv!14431 (array!38700) Bool)

(assert (=> start!59450 (array_inv!14431 a!2986)))

(declare-fun b!656256 () Bool)

(assert (=> b!656256 false))

(declare-fun lt!306205 () Unit!22622)

(assert (=> b!656256 (= lt!306205 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306210 (select (arr!18548 a!2986) j!136) index!984 Nil!12625))))

(assert (=> b!656256 (arrayNoDuplicates!0 lt!306210 index!984 Nil!12625)))

(declare-fun lt!306208 () Unit!22622)

(assert (=> b!656256 (= lt!306208 (lemmaNoDuplicateFromThenFromBigger!0 lt!306210 #b00000000000000000000000000000000 index!984))))

(assert (=> b!656256 (arrayNoDuplicates!0 lt!306210 #b00000000000000000000000000000000 Nil!12625)))

(declare-fun lt!306217 () Unit!22622)

(assert (=> b!656256 (= lt!306217 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12625))))

(assert (=> b!656256 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306213 () Unit!22622)

(assert (=> b!656256 (= lt!306213 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306210 (select (arr!18548 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376897 () Bool)

(assert (=> b!656256 e!376897))

(declare-fun res!425683 () Bool)

(assert (=> b!656256 (=> (not res!425683) (not e!376897))))

(assert (=> b!656256 (= res!425683 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) j!136))))

(declare-fun Unit!22631 () Unit!22622)

(assert (=> b!656256 (= e!376899 Unit!22631)))

(declare-fun b!656257 () Bool)

(assert (=> b!656257 (= e!376900 e!376893)))

(declare-fun res!425676 () Bool)

(assert (=> b!656257 (=> (not res!425676) (not e!376893))))

(declare-fun lt!306216 () SeekEntryResult!6985)

(assert (=> b!656257 (= res!425676 (or (= lt!306216 (MissingZero!6985 i!1108)) (= lt!306216 (MissingVacant!6985 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38700 (_ BitVec 32)) SeekEntryResult!6985)

(assert (=> b!656257 (= lt!306216 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!656258 () Bool)

(assert (=> b!656258 (= e!376897 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) index!984))))

(declare-fun b!656259 () Bool)

(declare-fun res!425671 () Bool)

(assert (=> b!656259 (=> (not res!425671) (not e!376893))))

(assert (=> b!656259 (= res!425671 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18548 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59450 res!425672) b!656248))

(assert (= (and b!656248 res!425680) b!656246))

(assert (= (and b!656246 res!425673) b!656245))

(assert (= (and b!656245 res!425681) b!656255))

(assert (= (and b!656255 res!425668) b!656257))

(assert (= (and b!656257 res!425676) b!656237))

(assert (= (and b!656237 res!425679) b!656244))

(assert (= (and b!656244 res!425677) b!656259))

(assert (= (and b!656259 res!425671) b!656243))

(assert (= (and b!656243 res!425674) b!656251))

(assert (= (and b!656251 res!425675) b!656242))

(assert (= (and b!656242 res!425669) b!656252))

(assert (= (and b!656242 c!75651) b!656236))

(assert (= (and b!656242 (not c!75651)) b!656241))

(assert (= (and b!656242 c!75653) b!656254))

(assert (= (and b!656242 (not c!75653)) b!656250))

(assert (= (and b!656254 res!425667) b!656240))

(assert (= (and b!656240 (not res!425670)) b!656239))

(assert (= (and b!656239 res!425678) b!656249))

(assert (= (and b!656254 c!75652) b!656253))

(assert (= (and b!656254 (not c!75652)) b!656238))

(assert (= (and b!656254 c!75654) b!656256))

(assert (= (and b!656254 (not c!75654)) b!656235))

(assert (= (and b!656256 res!425683) b!656258))

(assert (= (and b!656242 (not res!425682)) b!656247))

(declare-fun m!628815 () Bool)

(assert (=> b!656253 m!628815))

(declare-fun m!628817 () Bool)

(assert (=> b!656253 m!628817))

(assert (=> b!656253 m!628815))

(declare-fun m!628819 () Bool)

(assert (=> b!656253 m!628819))

(declare-fun m!628821 () Bool)

(assert (=> b!656253 m!628821))

(assert (=> b!656253 m!628815))

(declare-fun m!628823 () Bool)

(assert (=> b!656253 m!628823))

(declare-fun m!628825 () Bool)

(assert (=> b!656253 m!628825))

(declare-fun m!628827 () Bool)

(assert (=> b!656253 m!628827))

(assert (=> b!656253 m!628815))

(declare-fun m!628829 () Bool)

(assert (=> b!656253 m!628829))

(assert (=> b!656258 m!628815))

(assert (=> b!656258 m!628815))

(declare-fun m!628831 () Bool)

(assert (=> b!656258 m!628831))

(assert (=> b!656239 m!628815))

(assert (=> b!656239 m!628815))

(declare-fun m!628833 () Bool)

(assert (=> b!656239 m!628833))

(declare-fun m!628835 () Bool)

(assert (=> b!656254 m!628835))

(declare-fun m!628837 () Bool)

(assert (=> b!656254 m!628837))

(assert (=> b!656254 m!628815))

(declare-fun m!628839 () Bool)

(assert (=> b!656245 m!628839))

(assert (=> b!656246 m!628815))

(assert (=> b!656246 m!628815))

(declare-fun m!628841 () Bool)

(assert (=> b!656246 m!628841))

(assert (=> b!656249 m!628815))

(assert (=> b!656249 m!628815))

(assert (=> b!656249 m!628831))

(declare-fun m!628843 () Bool)

(assert (=> b!656244 m!628843))

(declare-fun m!628845 () Bool)

(assert (=> start!59450 m!628845))

(declare-fun m!628847 () Bool)

(assert (=> start!59450 m!628847))

(declare-fun m!628849 () Bool)

(assert (=> b!656255 m!628849))

(declare-fun m!628851 () Bool)

(assert (=> b!656242 m!628851))

(declare-fun m!628853 () Bool)

(assert (=> b!656242 m!628853))

(assert (=> b!656242 m!628815))

(assert (=> b!656242 m!628835))

(declare-fun m!628855 () Bool)

(assert (=> b!656242 m!628855))

(declare-fun m!628857 () Bool)

(assert (=> b!656242 m!628857))

(assert (=> b!656242 m!628815))

(declare-fun m!628859 () Bool)

(assert (=> b!656242 m!628859))

(declare-fun m!628861 () Bool)

(assert (=> b!656242 m!628861))

(declare-fun m!628863 () Bool)

(assert (=> b!656257 m!628863))

(declare-fun m!628865 () Bool)

(assert (=> b!656237 m!628865))

(assert (=> b!656243 m!628835))

(declare-fun m!628867 () Bool)

(assert (=> b!656243 m!628867))

(declare-fun m!628869 () Bool)

(assert (=> b!656251 m!628869))

(assert (=> b!656251 m!628815))

(assert (=> b!656251 m!628815))

(declare-fun m!628871 () Bool)

(assert (=> b!656251 m!628871))

(assert (=> b!656256 m!628815))

(assert (=> b!656256 m!628833))

(assert (=> b!656256 m!628815))

(declare-fun m!628873 () Bool)

(assert (=> b!656256 m!628873))

(assert (=> b!656256 m!628815))

(declare-fun m!628875 () Bool)

(assert (=> b!656256 m!628875))

(assert (=> b!656256 m!628827))

(declare-fun m!628877 () Bool)

(assert (=> b!656256 m!628877))

(assert (=> b!656256 m!628815))

(declare-fun m!628879 () Bool)

(assert (=> b!656256 m!628879))

(assert (=> b!656256 m!628815))

(declare-fun m!628881 () Bool)

(assert (=> b!656256 m!628881))

(assert (=> b!656256 m!628825))

(assert (=> b!656247 m!628835))

(assert (=> b!656247 m!628837))

(declare-fun m!628883 () Bool)

(assert (=> b!656259 m!628883))

(check-sat (not b!656242) (not b!656245) (not b!656246) (not start!59450) (not b!656249) (not b!656257) (not b!656251) (not b!656237) (not b!656253) (not b!656244) (not b!656239) (not b!656255) (not b!656258) (not b!656256))
(check-sat)
(get-model)

(declare-fun d!92547 () Bool)

(declare-fun lt!306346 () SeekEntryResult!6985)

(get-info :version)

(assert (=> d!92547 (and (or ((_ is Undefined!6985) lt!306346) (not ((_ is Found!6985) lt!306346)) (and (bvsge (index!30303 lt!306346) #b00000000000000000000000000000000) (bvslt (index!30303 lt!306346) (size!18913 a!2986)))) (or ((_ is Undefined!6985) lt!306346) ((_ is Found!6985) lt!306346) (not ((_ is MissingZero!6985) lt!306346)) (and (bvsge (index!30302 lt!306346) #b00000000000000000000000000000000) (bvslt (index!30302 lt!306346) (size!18913 a!2986)))) (or ((_ is Undefined!6985) lt!306346) ((_ is Found!6985) lt!306346) ((_ is MissingZero!6985) lt!306346) (not ((_ is MissingVacant!6985) lt!306346)) (and (bvsge (index!30305 lt!306346) #b00000000000000000000000000000000) (bvslt (index!30305 lt!306346) (size!18913 a!2986)))) (or ((_ is Undefined!6985) lt!306346) (ite ((_ is Found!6985) lt!306346) (= (select (arr!18548 a!2986) (index!30303 lt!306346)) k0!1786) (ite ((_ is MissingZero!6985) lt!306346) (= (select (arr!18548 a!2986) (index!30302 lt!306346)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6985) lt!306346) (= (select (arr!18548 a!2986) (index!30305 lt!306346)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!377004 () SeekEntryResult!6985)

(assert (=> d!92547 (= lt!306346 e!377004)))

(declare-fun c!75685 () Bool)

(declare-fun lt!306348 () SeekEntryResult!6985)

(assert (=> d!92547 (= c!75685 (and ((_ is Intermediate!6985) lt!306348) (undefined!7797 lt!306348)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38700 (_ BitVec 32)) SeekEntryResult!6985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92547 (= lt!306348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92547 (validMask!0 mask!3053)))

(assert (=> d!92547 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!306346)))

(declare-fun e!377006 () SeekEntryResult!6985)

(declare-fun b!656422 () Bool)

(assert (=> b!656422 (= e!377006 (seekKeyOrZeroReturnVacant!0 (x!59102 lt!306348) (index!30304 lt!306348) (index!30304 lt!306348) k0!1786 a!2986 mask!3053))))

(declare-fun b!656423 () Bool)

(assert (=> b!656423 (= e!377004 Undefined!6985)))

(declare-fun b!656424 () Bool)

(declare-fun c!75686 () Bool)

(declare-fun lt!306347 () (_ BitVec 64))

(assert (=> b!656424 (= c!75686 (= lt!306347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!377005 () SeekEntryResult!6985)

(assert (=> b!656424 (= e!377005 e!377006)))

(declare-fun b!656425 () Bool)

(assert (=> b!656425 (= e!377004 e!377005)))

(assert (=> b!656425 (= lt!306347 (select (arr!18548 a!2986) (index!30304 lt!306348)))))

(declare-fun c!75687 () Bool)

(assert (=> b!656425 (= c!75687 (= lt!306347 k0!1786))))

(declare-fun b!656426 () Bool)

(assert (=> b!656426 (= e!377006 (MissingZero!6985 (index!30304 lt!306348)))))

(declare-fun b!656427 () Bool)

(assert (=> b!656427 (= e!377005 (Found!6985 (index!30304 lt!306348)))))

(assert (= (and d!92547 c!75685) b!656423))

(assert (= (and d!92547 (not c!75685)) b!656425))

(assert (= (and b!656425 c!75687) b!656427))

(assert (= (and b!656425 (not c!75687)) b!656424))

(assert (= (and b!656424 c!75686) b!656426))

(assert (= (and b!656424 (not c!75686)) b!656422))

(declare-fun m!629025 () Bool)

(assert (=> d!92547 m!629025))

(declare-fun m!629027 () Bool)

(assert (=> d!92547 m!629027))

(assert (=> d!92547 m!628845))

(declare-fun m!629029 () Bool)

(assert (=> d!92547 m!629029))

(declare-fun m!629031 () Bool)

(assert (=> d!92547 m!629031))

(assert (=> d!92547 m!629025))

(declare-fun m!629033 () Bool)

(assert (=> d!92547 m!629033))

(declare-fun m!629035 () Bool)

(assert (=> b!656422 m!629035))

(declare-fun m!629037 () Bool)

(assert (=> b!656425 m!629037))

(assert (=> b!656257 d!92547))

(declare-fun d!92549 () Bool)

(assert (=> d!92549 (= (validKeyInArray!0 (select (arr!18548 a!2986) j!136)) (and (not (= (select (arr!18548 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18548 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656246 d!92549))

(declare-fun d!92551 () Bool)

(declare-fun res!425790 () Bool)

(declare-fun e!377011 () Bool)

(assert (=> d!92551 (=> res!425790 e!377011)))

(assert (=> d!92551 (= res!425790 (= (select (arr!18548 lt!306210) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18548 a!2986) j!136)))))

(assert (=> d!92551 (= (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!377011)))

(declare-fun b!656432 () Bool)

(declare-fun e!377012 () Bool)

(assert (=> b!656432 (= e!377011 e!377012)))

(declare-fun res!425791 () Bool)

(assert (=> b!656432 (=> (not res!425791) (not e!377012))))

(assert (=> b!656432 (= res!425791 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18913 lt!306210)))))

(declare-fun b!656433 () Bool)

(assert (=> b!656433 (= e!377012 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92551 (not res!425790)) b!656432))

(assert (= (and b!656432 res!425791) b!656433))

(declare-fun m!629039 () Bool)

(assert (=> d!92551 m!629039))

(assert (=> b!656433 m!628815))

(declare-fun m!629041 () Bool)

(assert (=> b!656433 m!629041))

(assert (=> b!656256 d!92551))

(declare-fun d!92553 () Bool)

(declare-fun res!425792 () Bool)

(declare-fun e!377013 () Bool)

(assert (=> d!92553 (=> res!425792 e!377013)))

(assert (=> d!92553 (= res!425792 (= (select (arr!18548 lt!306210) j!136) (select (arr!18548 a!2986) j!136)))))

(assert (=> d!92553 (= (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) j!136) e!377013)))

(declare-fun b!656434 () Bool)

(declare-fun e!377014 () Bool)

(assert (=> b!656434 (= e!377013 e!377014)))

(declare-fun res!425793 () Bool)

(assert (=> b!656434 (=> (not res!425793) (not e!377014))))

(assert (=> b!656434 (= res!425793 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18913 lt!306210)))))

(declare-fun b!656435 () Bool)

(assert (=> b!656435 (= e!377014 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92553 (not res!425792)) b!656434))

(assert (= (and b!656434 res!425793) b!656435))

(declare-fun m!629043 () Bool)

(assert (=> d!92553 m!629043))

(assert (=> b!656435 m!628815))

(declare-fun m!629045 () Bool)

(assert (=> b!656435 m!629045))

(assert (=> b!656256 d!92553))

(declare-fun bm!33834 () Bool)

(declare-fun call!33837 () Bool)

(declare-fun c!75692 () Bool)

(assert (=> bm!33834 (= call!33837 (arrayNoDuplicates!0 lt!306210 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75692 (Cons!12624 (select (arr!18548 lt!306210) #b00000000000000000000000000000000) Nil!12625) Nil!12625)))))

(declare-fun b!656456 () Bool)

(declare-fun e!377034 () Bool)

(declare-fun contains!3178 (List!12628 (_ BitVec 64)) Bool)

(assert (=> b!656456 (= e!377034 (contains!3178 Nil!12625 (select (arr!18548 lt!306210) #b00000000000000000000000000000000)))))

(declare-fun b!656457 () Bool)

(declare-fun e!377033 () Bool)

(assert (=> b!656457 (= e!377033 call!33837)))

(declare-fun b!656458 () Bool)

(assert (=> b!656458 (= e!377033 call!33837)))

(declare-fun b!656459 () Bool)

(declare-fun e!377032 () Bool)

(assert (=> b!656459 (= e!377032 e!377033)))

(assert (=> b!656459 (= c!75692 (validKeyInArray!0 (select (arr!18548 lt!306210) #b00000000000000000000000000000000)))))

(declare-fun b!656460 () Bool)

(declare-fun e!377031 () Bool)

(assert (=> b!656460 (= e!377031 e!377032)))

(declare-fun res!425807 () Bool)

(assert (=> b!656460 (=> (not res!425807) (not e!377032))))

(assert (=> b!656460 (= res!425807 (not e!377034))))

(declare-fun res!425806 () Bool)

(assert (=> b!656460 (=> (not res!425806) (not e!377034))))

(assert (=> b!656460 (= res!425806 (validKeyInArray!0 (select (arr!18548 lt!306210) #b00000000000000000000000000000000)))))

(declare-fun d!92555 () Bool)

(declare-fun res!425808 () Bool)

(assert (=> d!92555 (=> res!425808 e!377031)))

(assert (=> d!92555 (= res!425808 (bvsge #b00000000000000000000000000000000 (size!18913 lt!306210)))))

(assert (=> d!92555 (= (arrayNoDuplicates!0 lt!306210 #b00000000000000000000000000000000 Nil!12625) e!377031)))

(assert (= (and d!92555 (not res!425808)) b!656460))

(assert (= (and b!656460 res!425806) b!656456))

(assert (= (and b!656460 res!425807) b!656459))

(assert (= (and b!656459 c!75692) b!656458))

(assert (= (and b!656459 (not c!75692)) b!656457))

(assert (= (or b!656458 b!656457) bm!33834))

(declare-fun m!629047 () Bool)

(assert (=> bm!33834 m!629047))

(declare-fun m!629049 () Bool)

(assert (=> bm!33834 m!629049))

(assert (=> b!656456 m!629047))

(assert (=> b!656456 m!629047))

(declare-fun m!629051 () Bool)

(assert (=> b!656456 m!629051))

(assert (=> b!656459 m!629047))

(assert (=> b!656459 m!629047))

(declare-fun m!629053 () Bool)

(assert (=> b!656459 m!629053))

(assert (=> b!656460 m!629047))

(assert (=> b!656460 m!629047))

(assert (=> b!656460 m!629053))

(assert (=> b!656256 d!92555))

(declare-fun d!92559 () Bool)

(assert (=> d!92559 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18913 lt!306210)) (not (= (select (arr!18548 lt!306210) index!984) (select (arr!18548 a!2986) j!136))))))

(declare-fun lt!306351 () Unit!22622)

(declare-fun choose!21 (array!38700 (_ BitVec 64) (_ BitVec 32) List!12628) Unit!22622)

(assert (=> d!92559 (= lt!306351 (choose!21 lt!306210 (select (arr!18548 a!2986) j!136) index!984 Nil!12625))))

(assert (=> d!92559 (bvslt (size!18913 lt!306210) #b01111111111111111111111111111111)))

(assert (=> d!92559 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306210 (select (arr!18548 a!2986) j!136) index!984 Nil!12625) lt!306351)))

(declare-fun bs!19518 () Bool)

(assert (= bs!19518 d!92559))

(declare-fun m!629063 () Bool)

(assert (=> bs!19518 m!629063))

(assert (=> bs!19518 m!628815))

(declare-fun m!629065 () Bool)

(assert (=> bs!19518 m!629065))

(assert (=> b!656256 d!92559))

(declare-fun d!92563 () Bool)

(assert (=> d!92563 (arrayNoDuplicates!0 lt!306210 index!984 Nil!12625)))

(declare-fun lt!306354 () Unit!22622)

(declare-fun choose!39 (array!38700 (_ BitVec 32) (_ BitVec 32)) Unit!22622)

(assert (=> d!92563 (= lt!306354 (choose!39 lt!306210 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92563 (bvslt (size!18913 lt!306210) #b01111111111111111111111111111111)))

(assert (=> d!92563 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306210 #b00000000000000000000000000000000 index!984) lt!306354)))

(declare-fun bs!19519 () Bool)

(assert (= bs!19519 d!92563))

(assert (=> bs!19519 m!628873))

(declare-fun m!629067 () Bool)

(assert (=> bs!19519 m!629067))

(assert (=> b!656256 d!92563))

(declare-fun d!92567 () Bool)

(assert (=> d!92567 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306357 () Unit!22622)

(declare-fun choose!114 (array!38700 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22622)

(assert (=> d!92567 (= lt!306357 (choose!114 lt!306210 (select (arr!18548 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92567 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92567 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306210 (select (arr!18548 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!306357)))

(declare-fun bs!19520 () Bool)

(assert (= bs!19520 d!92567))

(assert (=> bs!19520 m!628815))

(assert (=> bs!19520 m!628881))

(assert (=> bs!19520 m!628815))

(declare-fun m!629073 () Bool)

(assert (=> bs!19520 m!629073))

(assert (=> b!656256 d!92567))

(declare-fun c!75694 () Bool)

(declare-fun bm!33836 () Bool)

(declare-fun call!33839 () Bool)

(assert (=> bm!33836 (= call!33839 (arrayNoDuplicates!0 lt!306210 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75694 (Cons!12624 (select (arr!18548 lt!306210) index!984) Nil!12625) Nil!12625)))))

(declare-fun b!656472 () Bool)

(declare-fun e!377048 () Bool)

(assert (=> b!656472 (= e!377048 (contains!3178 Nil!12625 (select (arr!18548 lt!306210) index!984)))))

(declare-fun b!656473 () Bool)

(declare-fun e!377047 () Bool)

(assert (=> b!656473 (= e!377047 call!33839)))

(declare-fun b!656474 () Bool)

(assert (=> b!656474 (= e!377047 call!33839)))

(declare-fun b!656475 () Bool)

(declare-fun e!377046 () Bool)

(assert (=> b!656475 (= e!377046 e!377047)))

(assert (=> b!656475 (= c!75694 (validKeyInArray!0 (select (arr!18548 lt!306210) index!984)))))

(declare-fun b!656476 () Bool)

(declare-fun e!377045 () Bool)

(assert (=> b!656476 (= e!377045 e!377046)))

(declare-fun res!425819 () Bool)

(assert (=> b!656476 (=> (not res!425819) (not e!377046))))

(assert (=> b!656476 (= res!425819 (not e!377048))))

(declare-fun res!425818 () Bool)

(assert (=> b!656476 (=> (not res!425818) (not e!377048))))

(assert (=> b!656476 (= res!425818 (validKeyInArray!0 (select (arr!18548 lt!306210) index!984)))))

(declare-fun d!92571 () Bool)

(declare-fun res!425820 () Bool)

(assert (=> d!92571 (=> res!425820 e!377045)))

(assert (=> d!92571 (= res!425820 (bvsge index!984 (size!18913 lt!306210)))))

(assert (=> d!92571 (= (arrayNoDuplicates!0 lt!306210 index!984 Nil!12625) e!377045)))

(assert (= (and d!92571 (not res!425820)) b!656476))

(assert (= (and b!656476 res!425818) b!656472))

(assert (= (and b!656476 res!425819) b!656475))

(assert (= (and b!656475 c!75694) b!656474))

(assert (= (and b!656475 (not c!75694)) b!656473))

(assert (= (or b!656474 b!656473) bm!33836))

(assert (=> bm!33836 m!629063))

(declare-fun m!629075 () Bool)

(assert (=> bm!33836 m!629075))

(assert (=> b!656472 m!629063))

(assert (=> b!656472 m!629063))

(declare-fun m!629077 () Bool)

(assert (=> b!656472 m!629077))

(assert (=> b!656475 m!629063))

(assert (=> b!656475 m!629063))

(declare-fun m!629079 () Bool)

(assert (=> b!656475 m!629079))

(assert (=> b!656476 m!629063))

(assert (=> b!656476 m!629063))

(assert (=> b!656476 m!629079))

(assert (=> b!656256 d!92571))

(declare-fun d!92573 () Bool)

(declare-fun e!377051 () Bool)

(assert (=> d!92573 e!377051))

(declare-fun res!425823 () Bool)

(assert (=> d!92573 (=> (not res!425823) (not e!377051))))

(assert (=> d!92573 (= res!425823 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18913 a!2986))))))

(declare-fun lt!306362 () Unit!22622)

(declare-fun choose!41 (array!38700 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12628) Unit!22622)

(assert (=> d!92573 (= lt!306362 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12625))))

(assert (=> d!92573 (bvslt (size!18913 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92573 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12625) lt!306362)))

(declare-fun b!656479 () Bool)

(assert (=> b!656479 (= e!377051 (arrayNoDuplicates!0 (array!38701 (store (arr!18548 a!2986) i!1108 k0!1786) (size!18913 a!2986)) #b00000000000000000000000000000000 Nil!12625))))

(assert (= (and d!92573 res!425823) b!656479))

(declare-fun m!629081 () Bool)

(assert (=> d!92573 m!629081))

(assert (=> b!656479 m!628835))

(declare-fun m!629085 () Bool)

(assert (=> b!656479 m!629085))

(assert (=> b!656256 d!92573))

(declare-fun b!656516 () Bool)

(declare-fun e!377078 () Bool)

(declare-fun call!33843 () Bool)

(assert (=> b!656516 (= e!377078 call!33843)))

(declare-fun d!92581 () Bool)

(declare-fun res!425835 () Bool)

(declare-fun e!377075 () Bool)

(assert (=> d!92581 (=> res!425835 e!377075)))

(assert (=> d!92581 (= res!425835 (bvsge #b00000000000000000000000000000000 (size!18913 a!2986)))))

(assert (=> d!92581 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!377075)))

(declare-fun bm!33840 () Bool)

(assert (=> bm!33840 (= call!33843 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!656517 () Bool)

(declare-fun e!377077 () Bool)

(assert (=> b!656517 (= e!377077 call!33843)))

(declare-fun b!656518 () Bool)

(assert (=> b!656518 (= e!377078 e!377077)))

(declare-fun lt!306385 () (_ BitVec 64))

(assert (=> b!656518 (= lt!306385 (select (arr!18548 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!306386 () Unit!22622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38700 (_ BitVec 64) (_ BitVec 32)) Unit!22622)

(assert (=> b!656518 (= lt!306386 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!306385 #b00000000000000000000000000000000))))

(assert (=> b!656518 (arrayContainsKey!0 a!2986 lt!306385 #b00000000000000000000000000000000)))

(declare-fun lt!306387 () Unit!22622)

(assert (=> b!656518 (= lt!306387 lt!306386)))

(declare-fun res!425836 () Bool)

(assert (=> b!656518 (= res!425836 (= (seekEntryOrOpen!0 (select (arr!18548 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6985 #b00000000000000000000000000000000)))))

(assert (=> b!656518 (=> (not res!425836) (not e!377077))))

(declare-fun b!656519 () Bool)

(assert (=> b!656519 (= e!377075 e!377078)))

(declare-fun c!75707 () Bool)

(assert (=> b!656519 (= c!75707 (validKeyInArray!0 (select (arr!18548 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92581 (not res!425835)) b!656519))

(assert (= (and b!656519 c!75707) b!656518))

(assert (= (and b!656519 (not c!75707)) b!656516))

(assert (= (and b!656518 res!425836) b!656517))

(assert (= (or b!656517 b!656516) bm!33840))

(declare-fun m!629113 () Bool)

(assert (=> bm!33840 m!629113))

(declare-fun m!629115 () Bool)

(assert (=> b!656518 m!629115))

(declare-fun m!629117 () Bool)

(assert (=> b!656518 m!629117))

(declare-fun m!629119 () Bool)

(assert (=> b!656518 m!629119))

(assert (=> b!656518 m!629115))

(declare-fun m!629121 () Bool)

(assert (=> b!656518 m!629121))

(assert (=> b!656519 m!629115))

(assert (=> b!656519 m!629115))

(declare-fun m!629123 () Bool)

(assert (=> b!656519 m!629123))

(assert (=> b!656237 d!92581))

(declare-fun d!92595 () Bool)

(declare-fun res!425838 () Bool)

(declare-fun e!377079 () Bool)

(assert (=> d!92595 (=> res!425838 e!377079)))

(assert (=> d!92595 (= res!425838 (= (select (arr!18548 lt!306210) index!984) (select (arr!18548 a!2986) j!136)))))

(assert (=> d!92595 (= (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) index!984) e!377079)))

(declare-fun b!656520 () Bool)

(declare-fun e!377080 () Bool)

(assert (=> b!656520 (= e!377079 e!377080)))

(declare-fun res!425839 () Bool)

(assert (=> b!656520 (=> (not res!425839) (not e!377080))))

(assert (=> b!656520 (= res!425839 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18913 lt!306210)))))

(declare-fun b!656521 () Bool)

(assert (=> b!656521 (= e!377080 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92595 (not res!425838)) b!656520))

(assert (= (and b!656520 res!425839) b!656521))

(assert (=> d!92595 m!629063))

(assert (=> b!656521 m!628815))

(declare-fun m!629125 () Bool)

(assert (=> b!656521 m!629125))

(assert (=> b!656258 d!92595))

(declare-fun d!92597 () Bool)

(assert (=> d!92597 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656245 d!92597))

(declare-fun d!92599 () Bool)

(declare-fun res!425840 () Bool)

(declare-fun e!377081 () Bool)

(assert (=> d!92599 (=> res!425840 e!377081)))

(assert (=> d!92599 (= res!425840 (= (select (arr!18548 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92599 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!377081)))

(declare-fun b!656522 () Bool)

(declare-fun e!377082 () Bool)

(assert (=> b!656522 (= e!377081 e!377082)))

(declare-fun res!425841 () Bool)

(assert (=> b!656522 (=> (not res!425841) (not e!377082))))

(assert (=> b!656522 (= res!425841 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18913 a!2986)))))

(declare-fun b!656523 () Bool)

(assert (=> b!656523 (= e!377082 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92599 (not res!425840)) b!656522))

(assert (= (and b!656522 res!425841) b!656523))

(assert (=> d!92599 m!629115))

(declare-fun m!629127 () Bool)

(assert (=> b!656523 m!629127))

(assert (=> b!656255 d!92599))

(declare-fun bm!33841 () Bool)

(declare-fun call!33844 () Bool)

(declare-fun c!75708 () Bool)

(assert (=> bm!33841 (= call!33844 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75708 (Cons!12624 (select (arr!18548 a!2986) #b00000000000000000000000000000000) Nil!12625) Nil!12625)))))

(declare-fun b!656528 () Bool)

(declare-fun e!377090 () Bool)

(assert (=> b!656528 (= e!377090 (contains!3178 Nil!12625 (select (arr!18548 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656529 () Bool)

(declare-fun e!377089 () Bool)

(assert (=> b!656529 (= e!377089 call!33844)))

(declare-fun b!656530 () Bool)

(assert (=> b!656530 (= e!377089 call!33844)))

(declare-fun b!656531 () Bool)

(declare-fun e!377088 () Bool)

(assert (=> b!656531 (= e!377088 e!377089)))

(assert (=> b!656531 (= c!75708 (validKeyInArray!0 (select (arr!18548 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656532 () Bool)

(declare-fun e!377087 () Bool)

(assert (=> b!656532 (= e!377087 e!377088)))

(declare-fun res!425847 () Bool)

(assert (=> b!656532 (=> (not res!425847) (not e!377088))))

(assert (=> b!656532 (= res!425847 (not e!377090))))

(declare-fun res!425846 () Bool)

(assert (=> b!656532 (=> (not res!425846) (not e!377090))))

(assert (=> b!656532 (= res!425846 (validKeyInArray!0 (select (arr!18548 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92601 () Bool)

(declare-fun res!425848 () Bool)

(assert (=> d!92601 (=> res!425848 e!377087)))

(assert (=> d!92601 (= res!425848 (bvsge #b00000000000000000000000000000000 (size!18913 a!2986)))))

(assert (=> d!92601 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12625) e!377087)))

(assert (= (and d!92601 (not res!425848)) b!656532))

(assert (= (and b!656532 res!425846) b!656528))

(assert (= (and b!656532 res!425847) b!656531))

(assert (= (and b!656531 c!75708) b!656530))

(assert (= (and b!656531 (not c!75708)) b!656529))

(assert (= (or b!656530 b!656529) bm!33841))

(assert (=> bm!33841 m!629115))

(declare-fun m!629129 () Bool)

(assert (=> bm!33841 m!629129))

(assert (=> b!656528 m!629115))

(assert (=> b!656528 m!629115))

(declare-fun m!629131 () Bool)

(assert (=> b!656528 m!629131))

(assert (=> b!656531 m!629115))

(assert (=> b!656531 m!629115))

(assert (=> b!656531 m!629123))

(assert (=> b!656532 m!629115))

(assert (=> b!656532 m!629115))

(assert (=> b!656532 m!629123))

(assert (=> b!656244 d!92601))

(declare-fun b!656592 () Bool)

(declare-fun e!377128 () SeekEntryResult!6985)

(assert (=> b!656592 (= e!377128 (Found!6985 index!984))))

(declare-fun b!656593 () Bool)

(declare-fun e!377129 () SeekEntryResult!6985)

(assert (=> b!656593 (= e!377129 (MissingVacant!6985 vacantSpotIndex!68))))

(declare-fun b!656594 () Bool)

(declare-fun e!377130 () SeekEntryResult!6985)

(assert (=> b!656594 (= e!377130 e!377128)))

(declare-fun lt!306412 () (_ BitVec 64))

(declare-fun c!75731 () Bool)

(assert (=> b!656594 (= c!75731 (= lt!306412 (select (arr!18548 a!2986) j!136)))))

(declare-fun b!656595 () Bool)

(declare-fun c!75732 () Bool)

(assert (=> b!656595 (= c!75732 (= lt!306412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656595 (= e!377128 e!377129)))

(declare-fun b!656596 () Bool)

(assert (=> b!656596 (= e!377130 Undefined!6985)))

(declare-fun b!656597 () Bool)

(assert (=> b!656597 (= e!377129 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!92603 () Bool)

(declare-fun lt!306411 () SeekEntryResult!6985)

(assert (=> d!92603 (and (or ((_ is Undefined!6985) lt!306411) (not ((_ is Found!6985) lt!306411)) (and (bvsge (index!30303 lt!306411) #b00000000000000000000000000000000) (bvslt (index!30303 lt!306411) (size!18913 a!2986)))) (or ((_ is Undefined!6985) lt!306411) ((_ is Found!6985) lt!306411) (not ((_ is MissingVacant!6985) lt!306411)) (not (= (index!30305 lt!306411) vacantSpotIndex!68)) (and (bvsge (index!30305 lt!306411) #b00000000000000000000000000000000) (bvslt (index!30305 lt!306411) (size!18913 a!2986)))) (or ((_ is Undefined!6985) lt!306411) (ite ((_ is Found!6985) lt!306411) (= (select (arr!18548 a!2986) (index!30303 lt!306411)) (select (arr!18548 a!2986) j!136)) (and ((_ is MissingVacant!6985) lt!306411) (= (index!30305 lt!306411) vacantSpotIndex!68) (= (select (arr!18548 a!2986) (index!30305 lt!306411)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92603 (= lt!306411 e!377130)))

(declare-fun c!75733 () Bool)

(assert (=> d!92603 (= c!75733 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92603 (= lt!306412 (select (arr!18548 a!2986) index!984))))

(assert (=> d!92603 (validMask!0 mask!3053)))

(assert (=> d!92603 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053) lt!306411)))

(assert (= (and d!92603 c!75733) b!656596))

(assert (= (and d!92603 (not c!75733)) b!656594))

(assert (= (and b!656594 c!75731) b!656592))

(assert (= (and b!656594 (not c!75731)) b!656595))

(assert (= (and b!656595 c!75732) b!656593))

(assert (= (and b!656595 (not c!75732)) b!656597))

(assert (=> b!656597 m!628851))

(assert (=> b!656597 m!628851))

(assert (=> b!656597 m!628815))

(declare-fun m!629181 () Bool)

(assert (=> b!656597 m!629181))

(declare-fun m!629183 () Bool)

(assert (=> d!92603 m!629183))

(declare-fun m!629185 () Bool)

(assert (=> d!92603 m!629185))

(assert (=> d!92603 m!628869))

(assert (=> d!92603 m!628845))

(assert (=> b!656251 d!92603))

(declare-fun d!92625 () Bool)

(assert (=> d!92625 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59450 d!92625))

(declare-fun d!92647 () Bool)

(assert (=> d!92647 (= (array_inv!14431 a!2986) (bvsge (size!18913 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59450 d!92647))

(declare-fun d!92649 () Bool)

(declare-fun res!425872 () Bool)

(declare-fun e!377146 () Bool)

(assert (=> d!92649 (=> res!425872 e!377146)))

(assert (=> d!92649 (= res!425872 (= (select (arr!18548 lt!306210) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18548 a!2986) j!136)))))

(assert (=> d!92649 (= (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!377146)))

(declare-fun b!656620 () Bool)

(declare-fun e!377147 () Bool)

(assert (=> b!656620 (= e!377146 e!377147)))

(declare-fun res!425873 () Bool)

(assert (=> b!656620 (=> (not res!425873) (not e!377147))))

(assert (=> b!656620 (= res!425873 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18913 lt!306210)))))

(declare-fun b!656621 () Bool)

(assert (=> b!656621 (= e!377147 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92649 (not res!425872)) b!656620))

(assert (= (and b!656620 res!425873) b!656621))

(declare-fun m!629221 () Bool)

(assert (=> d!92649 m!629221))

(assert (=> b!656621 m!628815))

(declare-fun m!629223 () Bool)

(assert (=> b!656621 m!629223))

(assert (=> b!656253 d!92649))

(assert (=> b!656253 d!92555))

(declare-fun bm!33847 () Bool)

(declare-fun call!33850 () Bool)

(declare-fun c!75741 () Bool)

(assert (=> bm!33847 (= call!33850 (arrayNoDuplicates!0 lt!306210 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75741 (Cons!12624 (select (arr!18548 lt!306210) j!136) Nil!12625) Nil!12625)))))

(declare-fun b!656622 () Bool)

(declare-fun e!377151 () Bool)

(assert (=> b!656622 (= e!377151 (contains!3178 Nil!12625 (select (arr!18548 lt!306210) j!136)))))

(declare-fun b!656623 () Bool)

(declare-fun e!377150 () Bool)

(assert (=> b!656623 (= e!377150 call!33850)))

(declare-fun b!656624 () Bool)

(assert (=> b!656624 (= e!377150 call!33850)))

(declare-fun b!656625 () Bool)

(declare-fun e!377149 () Bool)

(assert (=> b!656625 (= e!377149 e!377150)))

(assert (=> b!656625 (= c!75741 (validKeyInArray!0 (select (arr!18548 lt!306210) j!136)))))

(declare-fun b!656626 () Bool)

(declare-fun e!377148 () Bool)

(assert (=> b!656626 (= e!377148 e!377149)))

(declare-fun res!425875 () Bool)

(assert (=> b!656626 (=> (not res!425875) (not e!377149))))

(assert (=> b!656626 (= res!425875 (not e!377151))))

(declare-fun res!425874 () Bool)

(assert (=> b!656626 (=> (not res!425874) (not e!377151))))

(assert (=> b!656626 (= res!425874 (validKeyInArray!0 (select (arr!18548 lt!306210) j!136)))))

(declare-fun d!92651 () Bool)

(declare-fun res!425876 () Bool)

(assert (=> d!92651 (=> res!425876 e!377148)))

(assert (=> d!92651 (= res!425876 (bvsge j!136 (size!18913 lt!306210)))))

(assert (=> d!92651 (= (arrayNoDuplicates!0 lt!306210 j!136 Nil!12625) e!377148)))

(assert (= (and d!92651 (not res!425876)) b!656626))

(assert (= (and b!656626 res!425874) b!656622))

(assert (= (and b!656626 res!425875) b!656625))

(assert (= (and b!656625 c!75741) b!656624))

(assert (= (and b!656625 (not c!75741)) b!656623))

(assert (= (or b!656624 b!656623) bm!33847))

(assert (=> bm!33847 m!629043))

(declare-fun m!629225 () Bool)

(assert (=> bm!33847 m!629225))

(assert (=> b!656622 m!629043))

(assert (=> b!656622 m!629043))

(declare-fun m!629227 () Bool)

(assert (=> b!656622 m!629227))

(assert (=> b!656625 m!629043))

(assert (=> b!656625 m!629043))

(declare-fun m!629229 () Bool)

(assert (=> b!656625 m!629229))

(assert (=> b!656626 m!629043))

(assert (=> b!656626 m!629043))

(assert (=> b!656626 m!629229))

(assert (=> b!656253 d!92651))

(declare-fun d!92653 () Bool)

(assert (=> d!92653 (arrayNoDuplicates!0 lt!306210 j!136 Nil!12625)))

(declare-fun lt!306424 () Unit!22622)

(assert (=> d!92653 (= lt!306424 (choose!39 lt!306210 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92653 (bvslt (size!18913 lt!306210) #b01111111111111111111111111111111)))

(assert (=> d!92653 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306210 #b00000000000000000000000000000000 j!136) lt!306424)))

(declare-fun bs!19528 () Bool)

(assert (= bs!19528 d!92653))

(assert (=> bs!19528 m!628821))

(declare-fun m!629231 () Bool)

(assert (=> bs!19528 m!629231))

(assert (=> b!656253 d!92653))

(assert (=> b!656253 d!92573))

(declare-fun d!92655 () Bool)

(assert (=> d!92655 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18913 lt!306210)) (not (= (select (arr!18548 lt!306210) j!136) (select (arr!18548 a!2986) j!136))))))

(declare-fun lt!306425 () Unit!22622)

(assert (=> d!92655 (= lt!306425 (choose!21 lt!306210 (select (arr!18548 a!2986) j!136) j!136 Nil!12625))))

(assert (=> d!92655 (bvslt (size!18913 lt!306210) #b01111111111111111111111111111111)))

(assert (=> d!92655 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306210 (select (arr!18548 a!2986) j!136) j!136 Nil!12625) lt!306425)))

(declare-fun bs!19529 () Bool)

(assert (= bs!19529 d!92655))

(assert (=> bs!19529 m!629043))

(assert (=> bs!19529 m!628815))

(declare-fun m!629233 () Bool)

(assert (=> bs!19529 m!629233))

(assert (=> b!656253 d!92655))

(declare-fun d!92657 () Bool)

(assert (=> d!92657 (arrayContainsKey!0 lt!306210 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306426 () Unit!22622)

(assert (=> d!92657 (= lt!306426 (choose!114 lt!306210 (select (arr!18548 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92657 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92657 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306210 (select (arr!18548 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!306426)))

(declare-fun bs!19530 () Bool)

(assert (= bs!19530 d!92657))

(assert (=> bs!19530 m!628815))

(assert (=> bs!19530 m!628829))

(assert (=> bs!19530 m!628815))

(declare-fun m!629235 () Bool)

(assert (=> bs!19530 m!629235))

(assert (=> b!656253 d!92657))

(declare-fun b!656627 () Bool)

(declare-fun e!377152 () SeekEntryResult!6985)

(assert (=> b!656627 (= e!377152 (Found!6985 index!984))))

(declare-fun b!656628 () Bool)

(declare-fun e!377153 () SeekEntryResult!6985)

(assert (=> b!656628 (= e!377153 (MissingVacant!6985 vacantSpotIndex!68))))

(declare-fun b!656629 () Bool)

(declare-fun e!377154 () SeekEntryResult!6985)

(assert (=> b!656629 (= e!377154 e!377152)))

(declare-fun c!75742 () Bool)

(declare-fun lt!306428 () (_ BitVec 64))

(assert (=> b!656629 (= c!75742 (= lt!306428 lt!306207))))

(declare-fun b!656630 () Bool)

(declare-fun c!75743 () Bool)

(assert (=> b!656630 (= c!75743 (= lt!306428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656630 (= e!377152 e!377153)))

(declare-fun b!656631 () Bool)

(assert (=> b!656631 (= e!377154 Undefined!6985)))

(declare-fun b!656632 () Bool)

(assert (=> b!656632 (= e!377153 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!306207 lt!306210 mask!3053))))

(declare-fun lt!306427 () SeekEntryResult!6985)

(declare-fun d!92659 () Bool)

(assert (=> d!92659 (and (or ((_ is Undefined!6985) lt!306427) (not ((_ is Found!6985) lt!306427)) (and (bvsge (index!30303 lt!306427) #b00000000000000000000000000000000) (bvslt (index!30303 lt!306427) (size!18913 lt!306210)))) (or ((_ is Undefined!6985) lt!306427) ((_ is Found!6985) lt!306427) (not ((_ is MissingVacant!6985) lt!306427)) (not (= (index!30305 lt!306427) vacantSpotIndex!68)) (and (bvsge (index!30305 lt!306427) #b00000000000000000000000000000000) (bvslt (index!30305 lt!306427) (size!18913 lt!306210)))) (or ((_ is Undefined!6985) lt!306427) (ite ((_ is Found!6985) lt!306427) (= (select (arr!18548 lt!306210) (index!30303 lt!306427)) lt!306207) (and ((_ is MissingVacant!6985) lt!306427) (= (index!30305 lt!306427) vacantSpotIndex!68) (= (select (arr!18548 lt!306210) (index!30305 lt!306427)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92659 (= lt!306427 e!377154)))

(declare-fun c!75744 () Bool)

(assert (=> d!92659 (= c!75744 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92659 (= lt!306428 (select (arr!18548 lt!306210) index!984))))

(assert (=> d!92659 (validMask!0 mask!3053)))

(assert (=> d!92659 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306207 lt!306210 mask!3053) lt!306427)))

(assert (= (and d!92659 c!75744) b!656631))

(assert (= (and d!92659 (not c!75744)) b!656629))

(assert (= (and b!656629 c!75742) b!656627))

(assert (= (and b!656629 (not c!75742)) b!656630))

(assert (= (and b!656630 c!75743) b!656628))

(assert (= (and b!656630 (not c!75743)) b!656632))

(assert (=> b!656632 m!628851))

(assert (=> b!656632 m!628851))

(declare-fun m!629237 () Bool)

(assert (=> b!656632 m!629237))

(declare-fun m!629239 () Bool)

(assert (=> d!92659 m!629239))

(declare-fun m!629241 () Bool)

(assert (=> d!92659 m!629241))

(assert (=> d!92659 m!629063))

(assert (=> d!92659 m!628845))

(assert (=> b!656242 d!92659))

(declare-fun d!92665 () Bool)

(declare-fun lt!306437 () (_ BitVec 32))

(assert (=> d!92665 (and (bvsge lt!306437 #b00000000000000000000000000000000) (bvslt lt!306437 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92665 (= lt!306437 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92665 (validMask!0 mask!3053)))

(assert (=> d!92665 (= (nextIndex!0 index!984 x!910 mask!3053) lt!306437)))

(declare-fun bs!19531 () Bool)

(assert (= bs!19531 d!92665))

(declare-fun m!629243 () Bool)

(assert (=> bs!19531 m!629243))

(assert (=> bs!19531 m!628845))

(assert (=> b!656242 d!92665))

(declare-fun b!656655 () Bool)

(declare-fun e!377169 () SeekEntryResult!6985)

(assert (=> b!656655 (= e!377169 (Found!6985 lt!306211))))

(declare-fun b!656656 () Bool)

(declare-fun e!377170 () SeekEntryResult!6985)

(assert (=> b!656656 (= e!377170 (MissingVacant!6985 vacantSpotIndex!68))))

(declare-fun b!656657 () Bool)

(declare-fun e!377171 () SeekEntryResult!6985)

(assert (=> b!656657 (= e!377171 e!377169)))

(declare-fun c!75753 () Bool)

(declare-fun lt!306439 () (_ BitVec 64))

(assert (=> b!656657 (= c!75753 (= lt!306439 lt!306207))))

(declare-fun b!656658 () Bool)

(declare-fun c!75754 () Bool)

(assert (=> b!656658 (= c!75754 (= lt!306439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656658 (= e!377169 e!377170)))

(declare-fun b!656659 () Bool)

(assert (=> b!656659 (= e!377171 Undefined!6985)))

(declare-fun b!656660 () Bool)

(assert (=> b!656660 (= e!377170 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306211 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!306207 lt!306210 mask!3053))))

(declare-fun d!92667 () Bool)

(declare-fun lt!306438 () SeekEntryResult!6985)

(assert (=> d!92667 (and (or ((_ is Undefined!6985) lt!306438) (not ((_ is Found!6985) lt!306438)) (and (bvsge (index!30303 lt!306438) #b00000000000000000000000000000000) (bvslt (index!30303 lt!306438) (size!18913 lt!306210)))) (or ((_ is Undefined!6985) lt!306438) ((_ is Found!6985) lt!306438) (not ((_ is MissingVacant!6985) lt!306438)) (not (= (index!30305 lt!306438) vacantSpotIndex!68)) (and (bvsge (index!30305 lt!306438) #b00000000000000000000000000000000) (bvslt (index!30305 lt!306438) (size!18913 lt!306210)))) (or ((_ is Undefined!6985) lt!306438) (ite ((_ is Found!6985) lt!306438) (= (select (arr!18548 lt!306210) (index!30303 lt!306438)) lt!306207) (and ((_ is MissingVacant!6985) lt!306438) (= (index!30305 lt!306438) vacantSpotIndex!68) (= (select (arr!18548 lt!306210) (index!30305 lt!306438)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92667 (= lt!306438 e!377171)))

(declare-fun c!75755 () Bool)

(assert (=> d!92667 (= c!75755 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92667 (= lt!306439 (select (arr!18548 lt!306210) lt!306211))))

(assert (=> d!92667 (validMask!0 mask!3053)))

(assert (=> d!92667 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306211 vacantSpotIndex!68 lt!306207 lt!306210 mask!3053) lt!306438)))

(assert (= (and d!92667 c!75755) b!656659))

(assert (= (and d!92667 (not c!75755)) b!656657))

(assert (= (and b!656657 c!75753) b!656655))

(assert (= (and b!656657 (not c!75753)) b!656658))

(assert (= (and b!656658 c!75754) b!656656))

(assert (= (and b!656658 (not c!75754)) b!656660))

(declare-fun m!629245 () Bool)

(assert (=> b!656660 m!629245))

(assert (=> b!656660 m!629245))

(declare-fun m!629247 () Bool)

(assert (=> b!656660 m!629247))

(declare-fun m!629249 () Bool)

(assert (=> d!92667 m!629249))

(declare-fun m!629251 () Bool)

(assert (=> d!92667 m!629251))

(declare-fun m!629253 () Bool)

(assert (=> d!92667 m!629253))

(assert (=> d!92667 m!628845))

(assert (=> b!656242 d!92667))

(declare-fun d!92669 () Bool)

(declare-fun e!377204 () Bool)

(assert (=> d!92669 e!377204))

(declare-fun res!425906 () Bool)

(assert (=> d!92669 (=> (not res!425906) (not e!377204))))

(assert (=> d!92669 (= res!425906 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18913 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18913 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18913 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18913 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18913 a!2986))))))

(declare-fun lt!306463 () Unit!22622)

(declare-fun choose!9 (array!38700 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22622)

(assert (=> d!92669 (= lt!306463 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306211 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92669 (validMask!0 mask!3053)))

(assert (=> d!92669 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306211 vacantSpotIndex!68 mask!3053) lt!306463)))

(declare-fun b!656702 () Bool)

(assert (=> b!656702 (= e!377204 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306211 vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306211 vacantSpotIndex!68 (select (store (arr!18548 a!2986) i!1108 k0!1786) j!136) (array!38701 (store (arr!18548 a!2986) i!1108 k0!1786) (size!18913 a!2986)) mask!3053)))))

(assert (= (and d!92669 res!425906) b!656702))

(declare-fun m!629309 () Bool)

(assert (=> d!92669 m!629309))

(assert (=> d!92669 m!628845))

(assert (=> b!656702 m!628835))

(assert (=> b!656702 m!628853))

(declare-fun m!629311 () Bool)

(assert (=> b!656702 m!629311))

(assert (=> b!656702 m!628815))

(assert (=> b!656702 m!628815))

(assert (=> b!656702 m!628859))

(assert (=> b!656702 m!628853))

(assert (=> b!656242 d!92669))

(declare-fun b!656705 () Bool)

(declare-fun e!377207 () SeekEntryResult!6985)

(assert (=> b!656705 (= e!377207 (Found!6985 lt!306211))))

(declare-fun b!656706 () Bool)

(declare-fun e!377208 () SeekEntryResult!6985)

(assert (=> b!656706 (= e!377208 (MissingVacant!6985 vacantSpotIndex!68))))

(declare-fun b!656707 () Bool)

(declare-fun e!377209 () SeekEntryResult!6985)

(assert (=> b!656707 (= e!377209 e!377207)))

(declare-fun c!75765 () Bool)

(declare-fun lt!306467 () (_ BitVec 64))

(assert (=> b!656707 (= c!75765 (= lt!306467 (select (arr!18548 a!2986) j!136)))))

(declare-fun b!656708 () Bool)

(declare-fun c!75766 () Bool)

(assert (=> b!656708 (= c!75766 (= lt!306467 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656708 (= e!377207 e!377208)))

(declare-fun b!656709 () Bool)

(assert (=> b!656709 (= e!377209 Undefined!6985)))

(declare-fun b!656710 () Bool)

(assert (=> b!656710 (= e!377208 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306211 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!92693 () Bool)

(declare-fun lt!306466 () SeekEntryResult!6985)

(assert (=> d!92693 (and (or ((_ is Undefined!6985) lt!306466) (not ((_ is Found!6985) lt!306466)) (and (bvsge (index!30303 lt!306466) #b00000000000000000000000000000000) (bvslt (index!30303 lt!306466) (size!18913 a!2986)))) (or ((_ is Undefined!6985) lt!306466) ((_ is Found!6985) lt!306466) (not ((_ is MissingVacant!6985) lt!306466)) (not (= (index!30305 lt!306466) vacantSpotIndex!68)) (and (bvsge (index!30305 lt!306466) #b00000000000000000000000000000000) (bvslt (index!30305 lt!306466) (size!18913 a!2986)))) (or ((_ is Undefined!6985) lt!306466) (ite ((_ is Found!6985) lt!306466) (= (select (arr!18548 a!2986) (index!30303 lt!306466)) (select (arr!18548 a!2986) j!136)) (and ((_ is MissingVacant!6985) lt!306466) (= (index!30305 lt!306466) vacantSpotIndex!68) (= (select (arr!18548 a!2986) (index!30305 lt!306466)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92693 (= lt!306466 e!377209)))

(declare-fun c!75767 () Bool)

(assert (=> d!92693 (= c!75767 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92693 (= lt!306467 (select (arr!18548 a!2986) lt!306211))))

(assert (=> d!92693 (validMask!0 mask!3053)))

(assert (=> d!92693 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306211 vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053) lt!306466)))

(assert (= (and d!92693 c!75767) b!656709))

(assert (= (and d!92693 (not c!75767)) b!656707))

(assert (= (and b!656707 c!75765) b!656705))

(assert (= (and b!656707 (not c!75765)) b!656708))

(assert (= (and b!656708 c!75766) b!656706))

(assert (= (and b!656708 (not c!75766)) b!656710))

(assert (=> b!656710 m!629245))

(assert (=> b!656710 m!629245))

(assert (=> b!656710 m!628815))

(declare-fun m!629317 () Bool)

(assert (=> b!656710 m!629317))

(declare-fun m!629319 () Bool)

(assert (=> d!92693 m!629319))

(declare-fun m!629321 () Bool)

(assert (=> d!92693 m!629321))

(declare-fun m!629323 () Bool)

(assert (=> d!92693 m!629323))

(assert (=> d!92693 m!628845))

(assert (=> b!656242 d!92693))

(assert (=> b!656249 d!92595))

(assert (=> b!656239 d!92553))

(check-sat (not d!92603) (not b!656479) (not d!92669) (not b!656523) (not b!656597) (not b!656456) (not b!656521) (not d!92563) (not d!92567) (not b!656422) (not d!92693) (not bm!33840) (not b!656531) (not b!656476) (not b!656475) (not d!92667) (not b!656528) (not b!656532) (not d!92547) (not d!92559) (not d!92653) (not bm!33847) (not bm!33836) (not bm!33834) (not b!656702) (not d!92659) (not d!92665) (not b!656710) (not b!656621) (not b!656660) (not d!92573) (not b!656622) (not b!656459) (not b!656632) (not b!656518) (not bm!33841) (not d!92655) (not b!656435) (not d!92657) (not b!656626) (not b!656460) (not b!656472) (not b!656625) (not b!656519) (not b!656433))
(check-sat)
