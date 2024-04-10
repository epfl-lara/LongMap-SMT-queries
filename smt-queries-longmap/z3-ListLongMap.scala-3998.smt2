; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54180 () Bool)

(assert start!54180)

(declare-fun b!592256 () Bool)

(declare-fun e!338212 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!36910 0))(
  ( (array!36911 (arr!17725 (Array (_ BitVec 32) (_ BitVec 64))) (size!18089 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36910)

(assert (=> b!592256 (= e!338212 (or (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 j!136) (size!18089 a!2986))))))

(declare-fun lt!268836 () array!36910)

(declare-fun arrayContainsKey!0 (array!36910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592256 (arrayContainsKey!0 lt!268836 (select (arr!17725 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18578 0))(
  ( (Unit!18579) )
))
(declare-fun lt!268835 () Unit!18578)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36910 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18578)

(assert (=> b!592256 (= lt!268835 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268836 (select (arr!17725 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592257 () Bool)

(declare-fun res!379114 () Bool)

(declare-fun e!338209 () Bool)

(assert (=> b!592257 (=> (not res!379114) (not e!338209))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!592257 (= res!379114 (and (= (size!18089 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18089 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18089 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592258 () Bool)

(declare-fun e!338206 () Bool)

(declare-fun e!338204 () Bool)

(assert (=> b!592258 (= e!338206 e!338204)))

(declare-fun res!379123 () Bool)

(assert (=> b!592258 (=> (not res!379123) (not e!338204))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!592258 (= res!379123 (= (select (store (arr!17725 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592258 (= lt!268836 (array!36911 (store (arr!17725 a!2986) i!1108 k0!1786) (size!18089 a!2986)))))

(declare-fun b!592259 () Bool)

(declare-fun res!379113 () Bool)

(assert (=> b!592259 (=> (not res!379113) (not e!338206))))

(declare-datatypes ((List!11766 0))(
  ( (Nil!11763) (Cons!11762 (h!12807 (_ BitVec 64)) (t!17994 List!11766)) )
))
(declare-fun arrayNoDuplicates!0 (array!36910 (_ BitVec 32) List!11766) Bool)

(assert (=> b!592259 (= res!379113 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11763))))

(declare-fun b!592260 () Bool)

(declare-fun e!338211 () Bool)

(declare-datatypes ((SeekEntryResult!6165 0))(
  ( (MissingZero!6165 (index!26896 (_ BitVec 32))) (Found!6165 (index!26897 (_ BitVec 32))) (Intermediate!6165 (undefined!6977 Bool) (index!26898 (_ BitVec 32)) (x!55685 (_ BitVec 32))) (Undefined!6165) (MissingVacant!6165 (index!26899 (_ BitVec 32))) )
))
(declare-fun lt!268830 () SeekEntryResult!6165)

(declare-fun lt!268828 () SeekEntryResult!6165)

(assert (=> b!592260 (= e!338211 (= lt!268830 lt!268828))))

(declare-fun b!592261 () Bool)

(declare-fun e!338207 () Bool)

(declare-fun e!338213 () Bool)

(assert (=> b!592261 (= e!338207 (not e!338213))))

(declare-fun res!379122 () Bool)

(assert (=> b!592261 (=> res!379122 e!338213)))

(declare-fun lt!268831 () SeekEntryResult!6165)

(assert (=> b!592261 (= res!379122 (not (= lt!268831 (Found!6165 index!984))))))

(declare-fun lt!268837 () Unit!18578)

(declare-fun e!338203 () Unit!18578)

(assert (=> b!592261 (= lt!268837 e!338203)))

(declare-fun c!66941 () Bool)

(assert (=> b!592261 (= c!66941 (= lt!268831 Undefined!6165))))

(declare-fun lt!268829 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36910 (_ BitVec 32)) SeekEntryResult!6165)

(assert (=> b!592261 (= lt!268831 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268829 lt!268836 mask!3053))))

(assert (=> b!592261 e!338211))

(declare-fun res!379111 () Bool)

(assert (=> b!592261 (=> (not res!379111) (not e!338211))))

(declare-fun lt!268832 () (_ BitVec 32))

(assert (=> b!592261 (= res!379111 (= lt!268828 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268832 vacantSpotIndex!68 lt!268829 lt!268836 mask!3053)))))

(assert (=> b!592261 (= lt!268828 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268832 vacantSpotIndex!68 (select (arr!17725 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592261 (= lt!268829 (select (store (arr!17725 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268833 () Unit!18578)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36910 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18578)

(assert (=> b!592261 (= lt!268833 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268832 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592261 (= lt!268832 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592262 () Bool)

(declare-fun e!338208 () Bool)

(assert (=> b!592262 (= e!338208 (arrayContainsKey!0 lt!268836 (select (arr!17725 a!2986) j!136) index!984))))

(declare-fun b!592263 () Bool)

(declare-fun Unit!18580 () Unit!18578)

(assert (=> b!592263 (= e!338203 Unit!18580)))

(assert (=> b!592263 false))

(declare-fun res!379116 () Bool)

(assert (=> start!54180 (=> (not res!379116) (not e!338209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54180 (= res!379116 (validMask!0 mask!3053))))

(assert (=> start!54180 e!338209))

(assert (=> start!54180 true))

(declare-fun array_inv!13521 (array!36910) Bool)

(assert (=> start!54180 (array_inv!13521 a!2986)))

(declare-fun b!592264 () Bool)

(assert (=> b!592264 (= e!338209 e!338206)))

(declare-fun res!379118 () Bool)

(assert (=> b!592264 (=> (not res!379118) (not e!338206))))

(declare-fun lt!268827 () SeekEntryResult!6165)

(assert (=> b!592264 (= res!379118 (or (= lt!268827 (MissingZero!6165 i!1108)) (= lt!268827 (MissingVacant!6165 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36910 (_ BitVec 32)) SeekEntryResult!6165)

(assert (=> b!592264 (= lt!268827 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!592265 () Bool)

(declare-fun Unit!18581 () Unit!18578)

(assert (=> b!592265 (= e!338203 Unit!18581)))

(declare-fun b!592266 () Bool)

(declare-fun res!379110 () Bool)

(assert (=> b!592266 (=> (not res!379110) (not e!338209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592266 (= res!379110 (validKeyInArray!0 k0!1786))))

(declare-fun b!592267 () Bool)

(declare-fun res!379119 () Bool)

(assert (=> b!592267 (=> (not res!379119) (not e!338206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36910 (_ BitVec 32)) Bool)

(assert (=> b!592267 (= res!379119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592268 () Bool)

(assert (=> b!592268 (= e!338204 e!338207)))

(declare-fun res!379124 () Bool)

(assert (=> b!592268 (=> (not res!379124) (not e!338207))))

(assert (=> b!592268 (= res!379124 (and (= lt!268830 (Found!6165 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17725 a!2986) index!984) (select (arr!17725 a!2986) j!136))) (not (= (select (arr!17725 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592268 (= lt!268830 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17725 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592269 () Bool)

(declare-fun res!379112 () Bool)

(assert (=> b!592269 (=> (not res!379112) (not e!338209))))

(assert (=> b!592269 (= res!379112 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592270 () Bool)

(declare-fun e!338205 () Bool)

(declare-fun e!338210 () Bool)

(assert (=> b!592270 (= e!338205 e!338210)))

(declare-fun res!379120 () Bool)

(assert (=> b!592270 (=> res!379120 e!338210)))

(declare-fun lt!268834 () (_ BitVec 64))

(assert (=> b!592270 (= res!379120 (or (not (= (select (arr!17725 a!2986) j!136) lt!268829)) (not (= (select (arr!17725 a!2986) j!136) lt!268834)) (bvsge j!136 index!984)))))

(declare-fun b!592271 () Bool)

(assert (=> b!592271 (= e!338213 e!338212)))

(declare-fun res!379121 () Bool)

(assert (=> b!592271 (=> res!379121 e!338212)))

(assert (=> b!592271 (= res!379121 (or (not (= (select (arr!17725 a!2986) j!136) lt!268829)) (not (= (select (arr!17725 a!2986) j!136) lt!268834)) (bvsge j!136 index!984)))))

(assert (=> b!592271 e!338205))

(declare-fun res!379108 () Bool)

(assert (=> b!592271 (=> (not res!379108) (not e!338205))))

(assert (=> b!592271 (= res!379108 (= lt!268834 (select (arr!17725 a!2986) j!136)))))

(assert (=> b!592271 (= lt!268834 (select (store (arr!17725 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!592272 () Bool)

(assert (=> b!592272 (= e!338210 e!338208)))

(declare-fun res!379115 () Bool)

(assert (=> b!592272 (=> (not res!379115) (not e!338208))))

(assert (=> b!592272 (= res!379115 (arrayContainsKey!0 lt!268836 (select (arr!17725 a!2986) j!136) j!136))))

(declare-fun b!592273 () Bool)

(declare-fun res!379117 () Bool)

(assert (=> b!592273 (=> (not res!379117) (not e!338206))))

(assert (=> b!592273 (= res!379117 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17725 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592274 () Bool)

(declare-fun res!379109 () Bool)

(assert (=> b!592274 (=> (not res!379109) (not e!338209))))

(assert (=> b!592274 (= res!379109 (validKeyInArray!0 (select (arr!17725 a!2986) j!136)))))

(assert (= (and start!54180 res!379116) b!592257))

(assert (= (and b!592257 res!379114) b!592274))

(assert (= (and b!592274 res!379109) b!592266))

(assert (= (and b!592266 res!379110) b!592269))

(assert (= (and b!592269 res!379112) b!592264))

(assert (= (and b!592264 res!379118) b!592267))

(assert (= (and b!592267 res!379119) b!592259))

(assert (= (and b!592259 res!379113) b!592273))

(assert (= (and b!592273 res!379117) b!592258))

(assert (= (and b!592258 res!379123) b!592268))

(assert (= (and b!592268 res!379124) b!592261))

(assert (= (and b!592261 res!379111) b!592260))

(assert (= (and b!592261 c!66941) b!592263))

(assert (= (and b!592261 (not c!66941)) b!592265))

(assert (= (and b!592261 (not res!379122)) b!592271))

(assert (= (and b!592271 res!379108) b!592270))

(assert (= (and b!592270 (not res!379120)) b!592272))

(assert (= (and b!592272 res!379115) b!592262))

(assert (= (and b!592271 (not res!379121)) b!592256))

(declare-fun m!570387 () Bool)

(assert (=> b!592272 m!570387))

(assert (=> b!592272 m!570387))

(declare-fun m!570389 () Bool)

(assert (=> b!592272 m!570389))

(assert (=> b!592271 m!570387))

(declare-fun m!570391 () Bool)

(assert (=> b!592271 m!570391))

(declare-fun m!570393 () Bool)

(assert (=> b!592271 m!570393))

(declare-fun m!570395 () Bool)

(assert (=> b!592267 m!570395))

(declare-fun m!570397 () Bool)

(assert (=> b!592259 m!570397))

(declare-fun m!570399 () Bool)

(assert (=> b!592269 m!570399))

(assert (=> b!592256 m!570387))

(assert (=> b!592256 m!570387))

(declare-fun m!570401 () Bool)

(assert (=> b!592256 m!570401))

(assert (=> b!592256 m!570387))

(declare-fun m!570403 () Bool)

(assert (=> b!592256 m!570403))

(declare-fun m!570405 () Bool)

(assert (=> b!592261 m!570405))

(declare-fun m!570407 () Bool)

(assert (=> b!592261 m!570407))

(declare-fun m!570409 () Bool)

(assert (=> b!592261 m!570409))

(assert (=> b!592261 m!570387))

(assert (=> b!592261 m!570387))

(declare-fun m!570411 () Bool)

(assert (=> b!592261 m!570411))

(assert (=> b!592261 m!570391))

(declare-fun m!570413 () Bool)

(assert (=> b!592261 m!570413))

(declare-fun m!570415 () Bool)

(assert (=> b!592261 m!570415))

(declare-fun m!570417 () Bool)

(assert (=> b!592273 m!570417))

(assert (=> b!592258 m!570391))

(declare-fun m!570419 () Bool)

(assert (=> b!592258 m!570419))

(declare-fun m!570421 () Bool)

(assert (=> b!592266 m!570421))

(declare-fun m!570423 () Bool)

(assert (=> b!592268 m!570423))

(assert (=> b!592268 m!570387))

(assert (=> b!592268 m!570387))

(declare-fun m!570425 () Bool)

(assert (=> b!592268 m!570425))

(declare-fun m!570427 () Bool)

(assert (=> b!592264 m!570427))

(assert (=> b!592274 m!570387))

(assert (=> b!592274 m!570387))

(declare-fun m!570429 () Bool)

(assert (=> b!592274 m!570429))

(assert (=> b!592270 m!570387))

(assert (=> b!592262 m!570387))

(assert (=> b!592262 m!570387))

(declare-fun m!570431 () Bool)

(assert (=> b!592262 m!570431))

(declare-fun m!570433 () Bool)

(assert (=> start!54180 m!570433))

(declare-fun m!570435 () Bool)

(assert (=> start!54180 m!570435))

(check-sat (not b!592268) (not b!592264) (not b!592259) (not b!592274) (not start!54180) (not b!592256) (not b!592267) (not b!592262) (not b!592261) (not b!592272) (not b!592269) (not b!592266))
(check-sat)
