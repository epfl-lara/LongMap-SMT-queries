; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54510 () Bool)

(assert start!54510)

(declare-fun b!595245 () Bool)

(declare-fun e!340071 () Bool)

(declare-fun e!340082 () Bool)

(assert (=> b!595245 (= e!340071 e!340082)))

(declare-fun res!381275 () Bool)

(assert (=> b!595245 (=> (not res!381275) (not e!340082))))

(declare-datatypes ((SeekEntryResult!6193 0))(
  ( (MissingZero!6193 (index!27020 (_ BitVec 32))) (Found!6193 (index!27021 (_ BitVec 32))) (Intermediate!6193 (undefined!7005 Bool) (index!27022 (_ BitVec 32)) (x!55832 (_ BitVec 32))) (Undefined!6193) (MissingVacant!6193 (index!27023 (_ BitVec 32))) )
))
(declare-fun lt!270184 () SeekEntryResult!6193)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595245 (= res!381275 (or (= lt!270184 (MissingZero!6193 i!1108)) (= lt!270184 (MissingVacant!6193 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36984 0))(
  ( (array!36985 (arr!17756 (Array (_ BitVec 32) (_ BitVec 64))) (size!18121 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36984)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36984 (_ BitVec 32)) SeekEntryResult!6193)

(assert (=> b!595245 (= lt!270184 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595246 () Bool)

(declare-fun e!340079 () Bool)

(assert (=> b!595246 (= e!340079 true)))

(declare-fun lt!270185 () Bool)

(declare-datatypes ((List!11836 0))(
  ( (Nil!11833) (Cons!11832 (h!12877 (_ BitVec 64)) (t!18055 List!11836)) )
))
(declare-fun contains!2920 (List!11836 (_ BitVec 64)) Bool)

(assert (=> b!595246 (= lt!270185 (contains!2920 Nil!11833 k0!1786))))

(declare-fun b!595247 () Bool)

(declare-fun res!381269 () Bool)

(assert (=> b!595247 (=> (not res!381269) (not e!340071))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!595247 (= res!381269 (and (= (size!18121 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18121 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18121 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595248 () Bool)

(declare-fun res!381271 () Bool)

(assert (=> b!595248 (=> res!381271 e!340079)))

(assert (=> b!595248 (= res!381271 (contains!2920 Nil!11833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595249 () Bool)

(declare-fun e!340074 () Bool)

(declare-fun e!340080 () Bool)

(assert (=> b!595249 (= e!340074 e!340080)))

(declare-fun res!381263 () Bool)

(assert (=> b!595249 (=> (not res!381263) (not e!340080))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!270187 () SeekEntryResult!6193)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!595249 (= res!381263 (and (= lt!270187 (Found!6193 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17756 a!2986) index!984) (select (arr!17756 a!2986) j!136))) (not (= (select (arr!17756 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36984 (_ BitVec 32)) SeekEntryResult!6193)

(assert (=> b!595249 (= lt!270187 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17756 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595250 () Bool)

(declare-fun res!381258 () Bool)

(assert (=> b!595250 (=> (not res!381258) (not e!340082))))

(declare-fun arrayNoDuplicates!0 (array!36984 (_ BitVec 32) List!11836) Bool)

(assert (=> b!595250 (= res!381258 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11833))))

(declare-fun res!381266 () Bool)

(assert (=> start!54510 (=> (not res!381266) (not e!340071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54510 (= res!381266 (validMask!0 mask!3053))))

(assert (=> start!54510 e!340071))

(assert (=> start!54510 true))

(declare-fun array_inv!13639 (array!36984) Bool)

(assert (=> start!54510 (array_inv!13639 a!2986)))

(declare-fun b!595251 () Bool)

(declare-fun e!340083 () Bool)

(declare-fun e!340073 () Bool)

(assert (=> b!595251 (= e!340083 e!340073)))

(declare-fun res!381273 () Bool)

(assert (=> b!595251 (=> res!381273 e!340073)))

(declare-fun lt!270186 () (_ BitVec 64))

(declare-fun lt!270177 () (_ BitVec 64))

(assert (=> b!595251 (= res!381273 (or (not (= (select (arr!17756 a!2986) j!136) lt!270177)) (not (= (select (arr!17756 a!2986) j!136) lt!270186)) (bvsge j!136 index!984)))))

(declare-fun e!340081 () Bool)

(assert (=> b!595251 e!340081))

(declare-fun res!381256 () Bool)

(assert (=> b!595251 (=> (not res!381256) (not e!340081))))

(assert (=> b!595251 (= res!381256 (= lt!270186 (select (arr!17756 a!2986) j!136)))))

(assert (=> b!595251 (= lt!270186 (select (store (arr!17756 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595252 () Bool)

(declare-fun res!381255 () Bool)

(assert (=> b!595252 (=> res!381255 e!340079)))

(declare-fun noDuplicate!257 (List!11836) Bool)

(assert (=> b!595252 (= res!381255 (not (noDuplicate!257 Nil!11833)))))

(declare-fun b!595253 () Bool)

(assert (=> b!595253 (= e!340082 e!340074)))

(declare-fun res!381272 () Bool)

(assert (=> b!595253 (=> (not res!381272) (not e!340074))))

(assert (=> b!595253 (= res!381272 (= (select (store (arr!17756 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270182 () array!36984)

(assert (=> b!595253 (= lt!270182 (array!36985 (store (arr!17756 a!2986) i!1108 k0!1786) (size!18121 a!2986)))))

(declare-fun b!595254 () Bool)

(declare-fun res!381265 () Bool)

(assert (=> b!595254 (=> res!381265 e!340079)))

(assert (=> b!595254 (= res!381265 (contains!2920 Nil!11833 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595255 () Bool)

(declare-datatypes ((Unit!18684 0))(
  ( (Unit!18685) )
))
(declare-fun e!340078 () Unit!18684)

(declare-fun Unit!18686 () Unit!18684)

(assert (=> b!595255 (= e!340078 Unit!18686)))

(assert (=> b!595255 false))

(declare-fun b!595256 () Bool)

(declare-fun res!381267 () Bool)

(assert (=> b!595256 (=> (not res!381267) (not e!340082))))

(assert (=> b!595256 (= res!381267 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17756 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595257 () Bool)

(assert (=> b!595257 (= e!340073 e!340079)))

(declare-fun res!381268 () Bool)

(assert (=> b!595257 (=> res!381268 e!340079)))

(assert (=> b!595257 (= res!381268 (or (bvsge (size!18121 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18121 a!2986))))))

(declare-fun arrayContainsKey!0 (array!36984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595257 (arrayContainsKey!0 lt!270182 (select (arr!17756 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270178 () Unit!18684)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36984 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18684)

(assert (=> b!595257 (= lt!270178 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270182 (select (arr!17756 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595258 () Bool)

(assert (=> b!595258 (= e!340080 (not e!340083))))

(declare-fun res!381274 () Bool)

(assert (=> b!595258 (=> res!381274 e!340083)))

(declare-fun lt!270181 () SeekEntryResult!6193)

(assert (=> b!595258 (= res!381274 (not (= lt!270181 (Found!6193 index!984))))))

(declare-fun lt!270183 () Unit!18684)

(assert (=> b!595258 (= lt!270183 e!340078)))

(declare-fun c!67362 () Bool)

(assert (=> b!595258 (= c!67362 (= lt!270181 Undefined!6193))))

(assert (=> b!595258 (= lt!270181 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270177 lt!270182 mask!3053))))

(declare-fun e!340075 () Bool)

(assert (=> b!595258 e!340075))

(declare-fun res!381270 () Bool)

(assert (=> b!595258 (=> (not res!381270) (not e!340075))))

(declare-fun lt!270179 () (_ BitVec 32))

(declare-fun lt!270180 () SeekEntryResult!6193)

(assert (=> b!595258 (= res!381270 (= lt!270180 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270179 vacantSpotIndex!68 lt!270177 lt!270182 mask!3053)))))

(assert (=> b!595258 (= lt!270180 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270179 vacantSpotIndex!68 (select (arr!17756 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595258 (= lt!270177 (select (store (arr!17756 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270176 () Unit!18684)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36984 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18684)

(assert (=> b!595258 (= lt!270176 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270179 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595258 (= lt!270179 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595259 () Bool)

(declare-fun res!381261 () Bool)

(assert (=> b!595259 (=> (not res!381261) (not e!340082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36984 (_ BitVec 32)) Bool)

(assert (=> b!595259 (= res!381261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595260 () Bool)

(declare-fun res!381262 () Bool)

(assert (=> b!595260 (=> (not res!381262) (not e!340071))))

(assert (=> b!595260 (= res!381262 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595261 () Bool)

(declare-fun e!340077 () Bool)

(declare-fun e!340072 () Bool)

(assert (=> b!595261 (= e!340077 e!340072)))

(declare-fun res!381257 () Bool)

(assert (=> b!595261 (=> (not res!381257) (not e!340072))))

(assert (=> b!595261 (= res!381257 (arrayContainsKey!0 lt!270182 (select (arr!17756 a!2986) j!136) j!136))))

(declare-fun b!595262 () Bool)

(declare-fun Unit!18687 () Unit!18684)

(assert (=> b!595262 (= e!340078 Unit!18687)))

(declare-fun b!595263 () Bool)

(declare-fun res!381260 () Bool)

(assert (=> b!595263 (=> (not res!381260) (not e!340071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595263 (= res!381260 (validKeyInArray!0 (select (arr!17756 a!2986) j!136)))))

(declare-fun b!595264 () Bool)

(assert (=> b!595264 (= e!340072 (arrayContainsKey!0 lt!270182 (select (arr!17756 a!2986) j!136) index!984))))

(declare-fun b!595265 () Bool)

(declare-fun res!381264 () Bool)

(assert (=> b!595265 (=> (not res!381264) (not e!340071))))

(assert (=> b!595265 (= res!381264 (validKeyInArray!0 k0!1786))))

(declare-fun b!595266 () Bool)

(assert (=> b!595266 (= e!340075 (= lt!270187 lt!270180))))

(declare-fun b!595267 () Bool)

(assert (=> b!595267 (= e!340081 e!340077)))

(declare-fun res!381259 () Bool)

(assert (=> b!595267 (=> res!381259 e!340077)))

(assert (=> b!595267 (= res!381259 (or (not (= (select (arr!17756 a!2986) j!136) lt!270177)) (not (= (select (arr!17756 a!2986) j!136) lt!270186)) (bvsge j!136 index!984)))))

(assert (= (and start!54510 res!381266) b!595247))

(assert (= (and b!595247 res!381269) b!595263))

(assert (= (and b!595263 res!381260) b!595265))

(assert (= (and b!595265 res!381264) b!595260))

(assert (= (and b!595260 res!381262) b!595245))

(assert (= (and b!595245 res!381275) b!595259))

(assert (= (and b!595259 res!381261) b!595250))

(assert (= (and b!595250 res!381258) b!595256))

(assert (= (and b!595256 res!381267) b!595253))

(assert (= (and b!595253 res!381272) b!595249))

(assert (= (and b!595249 res!381263) b!595258))

(assert (= (and b!595258 res!381270) b!595266))

(assert (= (and b!595258 c!67362) b!595255))

(assert (= (and b!595258 (not c!67362)) b!595262))

(assert (= (and b!595258 (not res!381274)) b!595251))

(assert (= (and b!595251 res!381256) b!595267))

(assert (= (and b!595267 (not res!381259)) b!595261))

(assert (= (and b!595261 res!381257) b!595264))

(assert (= (and b!595251 (not res!381273)) b!595257))

(assert (= (and b!595257 (not res!381268)) b!595252))

(assert (= (and b!595252 (not res!381255)) b!595248))

(assert (= (and b!595248 (not res!381271)) b!595254))

(assert (= (and b!595254 (not res!381265)) b!595246))

(declare-fun m!572383 () Bool)

(assert (=> b!595245 m!572383))

(declare-fun m!572385 () Bool)

(assert (=> b!595261 m!572385))

(assert (=> b!595261 m!572385))

(declare-fun m!572387 () Bool)

(assert (=> b!595261 m!572387))

(declare-fun m!572389 () Bool)

(assert (=> b!595246 m!572389))

(declare-fun m!572391 () Bool)

(assert (=> b!595252 m!572391))

(declare-fun m!572393 () Bool)

(assert (=> b!595249 m!572393))

(assert (=> b!595249 m!572385))

(assert (=> b!595249 m!572385))

(declare-fun m!572395 () Bool)

(assert (=> b!595249 m!572395))

(assert (=> b!595263 m!572385))

(assert (=> b!595263 m!572385))

(declare-fun m!572397 () Bool)

(assert (=> b!595263 m!572397))

(declare-fun m!572399 () Bool)

(assert (=> b!595254 m!572399))

(declare-fun m!572401 () Bool)

(assert (=> b!595260 m!572401))

(assert (=> b!595257 m!572385))

(assert (=> b!595257 m!572385))

(declare-fun m!572403 () Bool)

(assert (=> b!595257 m!572403))

(assert (=> b!595257 m!572385))

(declare-fun m!572405 () Bool)

(assert (=> b!595257 m!572405))

(assert (=> b!595264 m!572385))

(assert (=> b!595264 m!572385))

(declare-fun m!572407 () Bool)

(assert (=> b!595264 m!572407))

(declare-fun m!572409 () Bool)

(assert (=> b!595253 m!572409))

(declare-fun m!572411 () Bool)

(assert (=> b!595253 m!572411))

(declare-fun m!572413 () Bool)

(assert (=> b!595265 m!572413))

(assert (=> b!595251 m!572385))

(assert (=> b!595251 m!572409))

(declare-fun m!572415 () Bool)

(assert (=> b!595251 m!572415))

(declare-fun m!572417 () Bool)

(assert (=> b!595250 m!572417))

(declare-fun m!572419 () Bool)

(assert (=> b!595258 m!572419))

(declare-fun m!572421 () Bool)

(assert (=> b!595258 m!572421))

(assert (=> b!595258 m!572385))

(assert (=> b!595258 m!572385))

(declare-fun m!572423 () Bool)

(assert (=> b!595258 m!572423))

(declare-fun m!572425 () Bool)

(assert (=> b!595258 m!572425))

(declare-fun m!572427 () Bool)

(assert (=> b!595258 m!572427))

(declare-fun m!572429 () Bool)

(assert (=> b!595258 m!572429))

(assert (=> b!595258 m!572409))

(declare-fun m!572431 () Bool)

(assert (=> start!54510 m!572431))

(declare-fun m!572433 () Bool)

(assert (=> start!54510 m!572433))

(declare-fun m!572435 () Bool)

(assert (=> b!595259 m!572435))

(assert (=> b!595267 m!572385))

(declare-fun m!572437 () Bool)

(assert (=> b!595248 m!572437))

(declare-fun m!572439 () Bool)

(assert (=> b!595256 m!572439))

(check-sat (not b!595246) (not b!595250) (not b!595258) (not start!54510) (not b!595260) (not b!595264) (not b!595254) (not b!595261) (not b!595257) (not b!595265) (not b!595249) (not b!595259) (not b!595248) (not b!595252) (not b!595263) (not b!595245))
(check-sat)
