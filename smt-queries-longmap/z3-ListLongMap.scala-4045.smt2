; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55146 () Bool)

(assert start!55146)

(declare-fun b!604237 () Bool)

(declare-fun res!388208 () Bool)

(declare-fun e!345727 () Bool)

(assert (=> b!604237 (=> (not res!388208) (not e!345727))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37219 0))(
  ( (array!37220 (arr!17866 (Array (_ BitVec 32) (_ BitVec 64))) (size!18230 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37219)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!604237 (= res!388208 (and (= (size!18230 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18230 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18230 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604238 () Bool)

(declare-fun res!388193 () Bool)

(assert (=> b!604238 (=> (not res!388193) (not e!345727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604238 (= res!388193 (validKeyInArray!0 (select (arr!17866 a!2986) j!136)))))

(declare-fun e!345725 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun b!604239 () Bool)

(declare-fun lt!275530 () array!37219)

(declare-fun arrayContainsKey!0 (array!37219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604239 (= e!345725 (arrayContainsKey!0 lt!275530 (select (arr!17866 a!2986) j!136) index!984))))

(declare-fun b!604240 () Bool)

(declare-fun res!388206 () Bool)

(declare-fun e!345722 () Bool)

(assert (=> b!604240 (=> (not res!388206) (not e!345722))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!604240 (= res!388206 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17866 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604241 () Bool)

(declare-fun e!345733 () Bool)

(declare-fun e!345729 () Bool)

(assert (=> b!604241 (= e!345733 (not e!345729))))

(declare-fun res!388210 () Bool)

(assert (=> b!604241 (=> res!388210 e!345729)))

(declare-datatypes ((SeekEntryResult!6306 0))(
  ( (MissingZero!6306 (index!27487 (_ BitVec 32))) (Found!6306 (index!27488 (_ BitVec 32))) (Intermediate!6306 (undefined!7118 Bool) (index!27489 (_ BitVec 32)) (x!56283 (_ BitVec 32))) (Undefined!6306) (MissingVacant!6306 (index!27490 (_ BitVec 32))) )
))
(declare-fun lt!275518 () SeekEntryResult!6306)

(assert (=> b!604241 (= res!388210 (not (= lt!275518 (Found!6306 index!984))))))

(declare-datatypes ((Unit!19216 0))(
  ( (Unit!19217) )
))
(declare-fun lt!275521 () Unit!19216)

(declare-fun e!345735 () Unit!19216)

(assert (=> b!604241 (= lt!275521 e!345735)))

(declare-fun c!68390 () Bool)

(assert (=> b!604241 (= c!68390 (= lt!275518 Undefined!6306))))

(declare-fun lt!275522 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37219 (_ BitVec 32)) SeekEntryResult!6306)

(assert (=> b!604241 (= lt!275518 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275522 lt!275530 mask!3053))))

(declare-fun e!345723 () Bool)

(assert (=> b!604241 e!345723))

(declare-fun res!388205 () Bool)

(assert (=> b!604241 (=> (not res!388205) (not e!345723))))

(declare-fun lt!275527 () SeekEntryResult!6306)

(declare-fun lt!275523 () (_ BitVec 32))

(assert (=> b!604241 (= res!388205 (= lt!275527 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275523 vacantSpotIndex!68 lt!275522 lt!275530 mask!3053)))))

(assert (=> b!604241 (= lt!275527 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275523 vacantSpotIndex!68 (select (arr!17866 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!604241 (= lt!275522 (select (store (arr!17866 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275528 () Unit!19216)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37219 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19216)

(assert (=> b!604241 (= lt!275528 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275523 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604241 (= lt!275523 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604243 () Bool)

(declare-fun res!388198 () Bool)

(assert (=> b!604243 (=> (not res!388198) (not e!345727))))

(assert (=> b!604243 (= res!388198 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604244 () Bool)

(declare-fun res!388194 () Bool)

(assert (=> b!604244 (=> (not res!388194) (not e!345722))))

(declare-datatypes ((List!11907 0))(
  ( (Nil!11904) (Cons!11903 (h!12948 (_ BitVec 64)) (t!18135 List!11907)) )
))
(declare-fun arrayNoDuplicates!0 (array!37219 (_ BitVec 32) List!11907) Bool)

(assert (=> b!604244 (= res!388194 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11904))))

(declare-fun b!604245 () Bool)

(declare-fun Unit!19218 () Unit!19216)

(assert (=> b!604245 (= e!345735 Unit!19218)))

(declare-fun b!604246 () Bool)

(declare-fun lt!275532 () SeekEntryResult!6306)

(assert (=> b!604246 (= e!345723 (= lt!275532 lt!275527))))

(declare-fun b!604247 () Bool)

(assert (=> b!604247 (= e!345727 e!345722)))

(declare-fun res!388204 () Bool)

(assert (=> b!604247 (=> (not res!388204) (not e!345722))))

(declare-fun lt!275520 () SeekEntryResult!6306)

(assert (=> b!604247 (= res!388204 (or (= lt!275520 (MissingZero!6306 i!1108)) (= lt!275520 (MissingVacant!6306 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37219 (_ BitVec 32)) SeekEntryResult!6306)

(assert (=> b!604247 (= lt!275520 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!604248 () Bool)

(declare-fun e!345724 () Bool)

(declare-fun e!345732 () Bool)

(assert (=> b!604248 (= e!345724 e!345732)))

(declare-fun res!388202 () Bool)

(assert (=> b!604248 (=> res!388202 e!345732)))

(assert (=> b!604248 (= res!388202 (bvsge index!984 j!136))))

(declare-fun lt!275533 () Unit!19216)

(declare-fun e!345728 () Unit!19216)

(assert (=> b!604248 (= lt!275533 e!345728)))

(declare-fun c!68389 () Bool)

(assert (=> b!604248 (= c!68389 (bvslt j!136 index!984))))

(declare-fun b!604249 () Bool)

(assert (=> b!604249 (= e!345732 (bvsge (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000))))

(assert (=> b!604249 (arrayContainsKey!0 lt!275530 (select (arr!17866 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275524 () Unit!19216)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37219 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19216)

(assert (=> b!604249 (= lt!275524 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275530 (select (arr!17866 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!604249 e!345725))

(declare-fun res!388209 () Bool)

(assert (=> b!604249 (=> (not res!388209) (not e!345725))))

(assert (=> b!604249 (= res!388209 (arrayContainsKey!0 lt!275530 (select (arr!17866 a!2986) j!136) j!136))))

(declare-fun b!604250 () Bool)

(assert (=> b!604250 (= e!345729 e!345724)))

(declare-fun res!388200 () Bool)

(assert (=> b!604250 (=> res!388200 e!345724)))

(declare-fun lt!275526 () (_ BitVec 64))

(assert (=> b!604250 (= res!388200 (or (not (= (select (arr!17866 a!2986) j!136) lt!275522)) (not (= (select (arr!17866 a!2986) j!136) lt!275526))))))

(declare-fun e!345734 () Bool)

(assert (=> b!604250 e!345734))

(declare-fun res!388207 () Bool)

(assert (=> b!604250 (=> (not res!388207) (not e!345734))))

(assert (=> b!604250 (= res!388207 (= lt!275526 (select (arr!17866 a!2986) j!136)))))

(assert (=> b!604250 (= lt!275526 (select (store (arr!17866 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604251 () Bool)

(declare-fun Unit!19219 () Unit!19216)

(assert (=> b!604251 (= e!345728 Unit!19219)))

(declare-fun b!604252 () Bool)

(declare-fun e!345731 () Bool)

(assert (=> b!604252 (= e!345722 e!345731)))

(declare-fun res!388211 () Bool)

(assert (=> b!604252 (=> (not res!388211) (not e!345731))))

(assert (=> b!604252 (= res!388211 (= (select (store (arr!17866 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604252 (= lt!275530 (array!37220 (store (arr!17866 a!2986) i!1108 k0!1786) (size!18230 a!2986)))))

(declare-fun b!604253 () Bool)

(declare-fun res!388203 () Bool)

(assert (=> b!604253 (=> (not res!388203) (not e!345722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37219 (_ BitVec 32)) Bool)

(assert (=> b!604253 (= res!388203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604254 () Bool)

(declare-fun e!345721 () Bool)

(assert (=> b!604254 (= e!345734 e!345721)))

(declare-fun res!388201 () Bool)

(assert (=> b!604254 (=> res!388201 e!345721)))

(assert (=> b!604254 (= res!388201 (or (not (= (select (arr!17866 a!2986) j!136) lt!275522)) (not (= (select (arr!17866 a!2986) j!136) lt!275526)) (bvsge j!136 index!984)))))

(declare-fun b!604255 () Bool)

(declare-fun Unit!19220 () Unit!19216)

(assert (=> b!604255 (= e!345735 Unit!19220)))

(assert (=> b!604255 false))

(declare-fun b!604256 () Bool)

(assert (=> b!604256 (= e!345731 e!345733)))

(declare-fun res!388197 () Bool)

(assert (=> b!604256 (=> (not res!388197) (not e!345733))))

(assert (=> b!604256 (= res!388197 (and (= lt!275532 (Found!6306 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17866 a!2986) index!984) (select (arr!17866 a!2986) j!136))) (not (= (select (arr!17866 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604256 (= lt!275532 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17866 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604257 () Bool)

(declare-fun res!388199 () Bool)

(assert (=> b!604257 (=> (not res!388199) (not e!345727))))

(assert (=> b!604257 (= res!388199 (validKeyInArray!0 k0!1786))))

(declare-fun b!604242 () Bool)

(declare-fun Unit!19221 () Unit!19216)

(assert (=> b!604242 (= e!345728 Unit!19221)))

(declare-fun lt!275519 () Unit!19216)

(assert (=> b!604242 (= lt!275519 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275530 (select (arr!17866 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604242 (arrayContainsKey!0 lt!275530 (select (arr!17866 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275531 () Unit!19216)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37219 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11907) Unit!19216)

(assert (=> b!604242 (= lt!275531 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11904))))

(assert (=> b!604242 (arrayNoDuplicates!0 lt!275530 #b00000000000000000000000000000000 Nil!11904)))

(declare-fun lt!275525 () Unit!19216)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37219 (_ BitVec 32) (_ BitVec 32)) Unit!19216)

(assert (=> b!604242 (= lt!275525 (lemmaNoDuplicateFromThenFromBigger!0 lt!275530 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604242 (arrayNoDuplicates!0 lt!275530 j!136 Nil!11904)))

(declare-fun lt!275529 () Unit!19216)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37219 (_ BitVec 64) (_ BitVec 32) List!11907) Unit!19216)

(assert (=> b!604242 (= lt!275529 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275530 (select (arr!17866 a!2986) j!136) j!136 Nil!11904))))

(assert (=> b!604242 false))

(declare-fun res!388195 () Bool)

(assert (=> start!55146 (=> (not res!388195) (not e!345727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55146 (= res!388195 (validMask!0 mask!3053))))

(assert (=> start!55146 e!345727))

(assert (=> start!55146 true))

(declare-fun array_inv!13662 (array!37219) Bool)

(assert (=> start!55146 (array_inv!13662 a!2986)))

(declare-fun b!604258 () Bool)

(declare-fun e!345730 () Bool)

(assert (=> b!604258 (= e!345721 e!345730)))

(declare-fun res!388196 () Bool)

(assert (=> b!604258 (=> (not res!388196) (not e!345730))))

(assert (=> b!604258 (= res!388196 (arrayContainsKey!0 lt!275530 (select (arr!17866 a!2986) j!136) j!136))))

(declare-fun b!604259 () Bool)

(assert (=> b!604259 (= e!345730 (arrayContainsKey!0 lt!275530 (select (arr!17866 a!2986) j!136) index!984))))

(assert (= (and start!55146 res!388195) b!604237))

(assert (= (and b!604237 res!388208) b!604238))

(assert (= (and b!604238 res!388193) b!604257))

(assert (= (and b!604257 res!388199) b!604243))

(assert (= (and b!604243 res!388198) b!604247))

(assert (= (and b!604247 res!388204) b!604253))

(assert (= (and b!604253 res!388203) b!604244))

(assert (= (and b!604244 res!388194) b!604240))

(assert (= (and b!604240 res!388206) b!604252))

(assert (= (and b!604252 res!388211) b!604256))

(assert (= (and b!604256 res!388197) b!604241))

(assert (= (and b!604241 res!388205) b!604246))

(assert (= (and b!604241 c!68390) b!604255))

(assert (= (and b!604241 (not c!68390)) b!604245))

(assert (= (and b!604241 (not res!388210)) b!604250))

(assert (= (and b!604250 res!388207) b!604254))

(assert (= (and b!604254 (not res!388201)) b!604258))

(assert (= (and b!604258 res!388196) b!604259))

(assert (= (and b!604250 (not res!388200)) b!604248))

(assert (= (and b!604248 c!68389) b!604242))

(assert (= (and b!604248 (not c!68389)) b!604251))

(assert (= (and b!604248 (not res!388202)) b!604249))

(assert (= (and b!604249 res!388209) b!604239))

(declare-fun m!581157 () Bool)

(assert (=> b!604247 m!581157))

(declare-fun m!581159 () Bool)

(assert (=> start!55146 m!581159))

(declare-fun m!581161 () Bool)

(assert (=> start!55146 m!581161))

(declare-fun m!581163 () Bool)

(assert (=> b!604240 m!581163))

(declare-fun m!581165 () Bool)

(assert (=> b!604238 m!581165))

(assert (=> b!604238 m!581165))

(declare-fun m!581167 () Bool)

(assert (=> b!604238 m!581167))

(assert (=> b!604242 m!581165))

(declare-fun m!581169 () Bool)

(assert (=> b!604242 m!581169))

(assert (=> b!604242 m!581165))

(assert (=> b!604242 m!581165))

(declare-fun m!581171 () Bool)

(assert (=> b!604242 m!581171))

(declare-fun m!581173 () Bool)

(assert (=> b!604242 m!581173))

(assert (=> b!604242 m!581165))

(declare-fun m!581175 () Bool)

(assert (=> b!604242 m!581175))

(declare-fun m!581177 () Bool)

(assert (=> b!604242 m!581177))

(declare-fun m!581179 () Bool)

(assert (=> b!604242 m!581179))

(declare-fun m!581181 () Bool)

(assert (=> b!604242 m!581181))

(assert (=> b!604250 m!581165))

(declare-fun m!581183 () Bool)

(assert (=> b!604250 m!581183))

(declare-fun m!581185 () Bool)

(assert (=> b!604250 m!581185))

(assert (=> b!604252 m!581183))

(declare-fun m!581187 () Bool)

(assert (=> b!604252 m!581187))

(assert (=> b!604259 m!581165))

(assert (=> b!604259 m!581165))

(declare-fun m!581189 () Bool)

(assert (=> b!604259 m!581189))

(declare-fun m!581191 () Bool)

(assert (=> b!604253 m!581191))

(assert (=> b!604258 m!581165))

(assert (=> b!604258 m!581165))

(declare-fun m!581193 () Bool)

(assert (=> b!604258 m!581193))

(assert (=> b!604239 m!581165))

(assert (=> b!604239 m!581165))

(assert (=> b!604239 m!581189))

(assert (=> b!604249 m!581165))

(assert (=> b!604249 m!581165))

(declare-fun m!581195 () Bool)

(assert (=> b!604249 m!581195))

(assert (=> b!604249 m!581165))

(declare-fun m!581197 () Bool)

(assert (=> b!604249 m!581197))

(assert (=> b!604249 m!581165))

(assert (=> b!604249 m!581193))

(declare-fun m!581199 () Bool)

(assert (=> b!604257 m!581199))

(declare-fun m!581201 () Bool)

(assert (=> b!604243 m!581201))

(assert (=> b!604254 m!581165))

(declare-fun m!581203 () Bool)

(assert (=> b!604241 m!581203))

(declare-fun m!581205 () Bool)

(assert (=> b!604241 m!581205))

(assert (=> b!604241 m!581165))

(assert (=> b!604241 m!581183))

(declare-fun m!581207 () Bool)

(assert (=> b!604241 m!581207))

(assert (=> b!604241 m!581165))

(declare-fun m!581209 () Bool)

(assert (=> b!604241 m!581209))

(declare-fun m!581211 () Bool)

(assert (=> b!604241 m!581211))

(declare-fun m!581213 () Bool)

(assert (=> b!604241 m!581213))

(declare-fun m!581215 () Bool)

(assert (=> b!604244 m!581215))

(declare-fun m!581217 () Bool)

(assert (=> b!604256 m!581217))

(assert (=> b!604256 m!581165))

(assert (=> b!604256 m!581165))

(declare-fun m!581219 () Bool)

(assert (=> b!604256 m!581219))

(check-sat (not b!604247) (not b!604249) (not start!55146) (not b!604244) (not b!604259) (not b!604242) (not b!604238) (not b!604258) (not b!604241) (not b!604253) (not b!604239) (not b!604243) (not b!604257) (not b!604256))
(check-sat)
