; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54540 () Bool)

(assert start!54540)

(declare-fun b!596280 () Bool)

(declare-fun e!340662 () Bool)

(assert (=> b!596280 (= e!340662 true)))

(declare-fun lt!270718 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!11851 0))(
  ( (Nil!11848) (Cons!11847 (h!12892 (_ BitVec 64)) (t!18070 List!11851)) )
))
(declare-fun contains!2935 (List!11851 (_ BitVec 64)) Bool)

(assert (=> b!596280 (= lt!270718 (contains!2935 Nil!11848 k0!1786))))

(declare-fun b!596281 () Bool)

(declare-fun res!382213 () Bool)

(declare-fun e!340663 () Bool)

(assert (=> b!596281 (=> (not res!382213) (not e!340663))))

(declare-datatypes ((array!37014 0))(
  ( (array!37015 (arr!17771 (Array (_ BitVec 32) (_ BitVec 64))) (size!18136 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37014)

(declare-fun arrayContainsKey!0 (array!37014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596281 (= res!382213 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596282 () Bool)

(declare-fun res!382209 () Bool)

(assert (=> b!596282 (=> res!382209 e!340662)))

(assert (=> b!596282 (= res!382209 (contains!2935 Nil!11848 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596283 () Bool)

(declare-fun e!340656 () Bool)

(declare-fun e!340665 () Bool)

(assert (=> b!596283 (= e!340656 e!340665)))

(declare-fun res!382219 () Bool)

(assert (=> b!596283 (=> res!382219 e!340665)))

(declare-fun lt!270723 () (_ BitVec 64))

(declare-fun lt!270719 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596283 (= res!382219 (or (not (= (select (arr!17771 a!2986) j!136) lt!270719)) (not (= (select (arr!17771 a!2986) j!136) lt!270723)) (bvsge j!136 index!984)))))

(declare-fun b!596284 () Bool)

(declare-fun res!382207 () Bool)

(assert (=> b!596284 (=> (not res!382207) (not e!340663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596284 (= res!382207 (validKeyInArray!0 k0!1786))))

(declare-fun b!596285 () Bool)

(declare-datatypes ((Unit!18744 0))(
  ( (Unit!18745) )
))
(declare-fun e!340657 () Unit!18744)

(declare-fun Unit!18746 () Unit!18744)

(assert (=> b!596285 (= e!340657 Unit!18746)))

(assert (=> b!596285 false))

(declare-fun b!596286 () Bool)

(declare-fun res!382202 () Bool)

(declare-fun e!340660 () Bool)

(assert (=> b!596286 (=> (not res!382202) (not e!340660))))

(declare-fun arrayNoDuplicates!0 (array!37014 (_ BitVec 32) List!11851) Bool)

(assert (=> b!596286 (= res!382202 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11848))))

(declare-fun b!596287 () Bool)

(declare-fun res!382211 () Bool)

(assert (=> b!596287 (=> res!382211 e!340662)))

(assert (=> b!596287 (= res!382211 (contains!2935 Nil!11848 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!382216 () Bool)

(assert (=> start!54540 (=> (not res!382216) (not e!340663))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54540 (= res!382216 (validMask!0 mask!3053))))

(assert (=> start!54540 e!340663))

(assert (=> start!54540 true))

(declare-fun array_inv!13654 (array!37014) Bool)

(assert (=> start!54540 (array_inv!13654 a!2986)))

(declare-fun b!596288 () Bool)

(declare-fun res!382200 () Bool)

(assert (=> b!596288 (=> (not res!382200) (not e!340663))))

(assert (=> b!596288 (= res!382200 (validKeyInArray!0 (select (arr!17771 a!2986) j!136)))))

(declare-fun b!596289 () Bool)

(declare-fun res!382215 () Bool)

(assert (=> b!596289 (=> res!382215 e!340662)))

(declare-fun noDuplicate!272 (List!11851) Bool)

(assert (=> b!596289 (= res!382215 (not (noDuplicate!272 Nil!11848)))))

(declare-fun b!596290 () Bool)

(assert (=> b!596290 (= e!340663 e!340660)))

(declare-fun res!382212 () Bool)

(assert (=> b!596290 (=> (not res!382212) (not e!340660))))

(declare-datatypes ((SeekEntryResult!6208 0))(
  ( (MissingZero!6208 (index!27080 (_ BitVec 32))) (Found!6208 (index!27081 (_ BitVec 32))) (Intermediate!6208 (undefined!7020 Bool) (index!27082 (_ BitVec 32)) (x!55887 (_ BitVec 32))) (Undefined!6208) (MissingVacant!6208 (index!27083 (_ BitVec 32))) )
))
(declare-fun lt!270716 () SeekEntryResult!6208)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596290 (= res!382212 (or (= lt!270716 (MissingZero!6208 i!1108)) (= lt!270716 (MissingVacant!6208 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37014 (_ BitVec 32)) SeekEntryResult!6208)

(assert (=> b!596290 (= lt!270716 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596291 () Bool)

(declare-fun res!382210 () Bool)

(assert (=> b!596291 (=> (not res!382210) (not e!340663))))

(assert (=> b!596291 (= res!382210 (and (= (size!18136 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18136 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18136 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596292 () Bool)

(declare-fun e!340668 () Bool)

(declare-fun lt!270726 () SeekEntryResult!6208)

(declare-fun lt!270720 () SeekEntryResult!6208)

(assert (=> b!596292 (= e!340668 (= lt!270726 lt!270720))))

(declare-fun b!596293 () Bool)

(declare-fun e!340667 () Bool)

(assert (=> b!596293 (= e!340660 e!340667)))

(declare-fun res!382220 () Bool)

(assert (=> b!596293 (=> (not res!382220) (not e!340667))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!596293 (= res!382220 (= (select (store (arr!17771 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270721 () array!37014)

(assert (=> b!596293 (= lt!270721 (array!37015 (store (arr!17771 a!2986) i!1108 k0!1786) (size!18136 a!2986)))))

(declare-fun b!596294 () Bool)

(declare-fun e!340659 () Bool)

(assert (=> b!596294 (= e!340659 e!340662)))

(declare-fun res!382201 () Bool)

(assert (=> b!596294 (=> res!382201 e!340662)))

(assert (=> b!596294 (= res!382201 (or (bvsge (size!18136 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18136 a!2986))))))

(assert (=> b!596294 (arrayContainsKey!0 lt!270721 (select (arr!17771 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270722 () Unit!18744)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37014 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18744)

(assert (=> b!596294 (= lt!270722 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270721 (select (arr!17771 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596295 () Bool)

(declare-fun e!340658 () Bool)

(assert (=> b!596295 (= e!340665 e!340658)))

(declare-fun res!382203 () Bool)

(assert (=> b!596295 (=> (not res!382203) (not e!340658))))

(assert (=> b!596295 (= res!382203 (arrayContainsKey!0 lt!270721 (select (arr!17771 a!2986) j!136) j!136))))

(declare-fun b!596296 () Bool)

(declare-fun Unit!18747 () Unit!18744)

(assert (=> b!596296 (= e!340657 Unit!18747)))

(declare-fun b!596297 () Bool)

(declare-fun e!340664 () Bool)

(declare-fun e!340666 () Bool)

(assert (=> b!596297 (= e!340664 (not e!340666))))

(declare-fun res!382205 () Bool)

(assert (=> b!596297 (=> res!382205 e!340666)))

(declare-fun lt!270725 () SeekEntryResult!6208)

(assert (=> b!596297 (= res!382205 (not (= lt!270725 (Found!6208 index!984))))))

(declare-fun lt!270724 () Unit!18744)

(assert (=> b!596297 (= lt!270724 e!340657)))

(declare-fun c!67407 () Bool)

(assert (=> b!596297 (= c!67407 (= lt!270725 Undefined!6208))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37014 (_ BitVec 32)) SeekEntryResult!6208)

(assert (=> b!596297 (= lt!270725 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270719 lt!270721 mask!3053))))

(assert (=> b!596297 e!340668))

(declare-fun res!382217 () Bool)

(assert (=> b!596297 (=> (not res!382217) (not e!340668))))

(declare-fun lt!270727 () (_ BitVec 32))

(assert (=> b!596297 (= res!382217 (= lt!270720 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270727 vacantSpotIndex!68 lt!270719 lt!270721 mask!3053)))))

(assert (=> b!596297 (= lt!270720 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270727 vacantSpotIndex!68 (select (arr!17771 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596297 (= lt!270719 (select (store (arr!17771 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270717 () Unit!18744)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37014 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18744)

(assert (=> b!596297 (= lt!270717 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270727 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596297 (= lt!270727 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596298 () Bool)

(assert (=> b!596298 (= e!340667 e!340664)))

(declare-fun res!382218 () Bool)

(assert (=> b!596298 (=> (not res!382218) (not e!340664))))

(assert (=> b!596298 (= res!382218 (and (= lt!270726 (Found!6208 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17771 a!2986) index!984) (select (arr!17771 a!2986) j!136))) (not (= (select (arr!17771 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596298 (= lt!270726 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17771 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596299 () Bool)

(assert (=> b!596299 (= e!340658 (arrayContainsKey!0 lt!270721 (select (arr!17771 a!2986) j!136) index!984))))

(declare-fun b!596300 () Bool)

(assert (=> b!596300 (= e!340666 e!340659)))

(declare-fun res!382204 () Bool)

(assert (=> b!596300 (=> res!382204 e!340659)))

(assert (=> b!596300 (= res!382204 (or (not (= (select (arr!17771 a!2986) j!136) lt!270719)) (not (= (select (arr!17771 a!2986) j!136) lt!270723)) (bvsge j!136 index!984)))))

(assert (=> b!596300 e!340656))

(declare-fun res!382208 () Bool)

(assert (=> b!596300 (=> (not res!382208) (not e!340656))))

(assert (=> b!596300 (= res!382208 (= lt!270723 (select (arr!17771 a!2986) j!136)))))

(assert (=> b!596300 (= lt!270723 (select (store (arr!17771 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596301 () Bool)

(declare-fun res!382206 () Bool)

(assert (=> b!596301 (=> (not res!382206) (not e!340660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37014 (_ BitVec 32)) Bool)

(assert (=> b!596301 (= res!382206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596302 () Bool)

(declare-fun res!382214 () Bool)

(assert (=> b!596302 (=> (not res!382214) (not e!340660))))

(assert (=> b!596302 (= res!382214 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17771 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54540 res!382216) b!596291))

(assert (= (and b!596291 res!382210) b!596288))

(assert (= (and b!596288 res!382200) b!596284))

(assert (= (and b!596284 res!382207) b!596281))

(assert (= (and b!596281 res!382213) b!596290))

(assert (= (and b!596290 res!382212) b!596301))

(assert (= (and b!596301 res!382206) b!596286))

(assert (= (and b!596286 res!382202) b!596302))

(assert (= (and b!596302 res!382214) b!596293))

(assert (= (and b!596293 res!382220) b!596298))

(assert (= (and b!596298 res!382218) b!596297))

(assert (= (and b!596297 res!382217) b!596292))

(assert (= (and b!596297 c!67407) b!596285))

(assert (= (and b!596297 (not c!67407)) b!596296))

(assert (= (and b!596297 (not res!382205)) b!596300))

(assert (= (and b!596300 res!382208) b!596283))

(assert (= (and b!596283 (not res!382219)) b!596295))

(assert (= (and b!596295 res!382203) b!596299))

(assert (= (and b!596300 (not res!382204)) b!596294))

(assert (= (and b!596294 (not res!382201)) b!596289))

(assert (= (and b!596289 (not res!382215)) b!596282))

(assert (= (and b!596282 (not res!382209)) b!596287))

(assert (= (and b!596287 (not res!382211)) b!596280))

(declare-fun m!573253 () Bool)

(assert (=> b!596281 m!573253))

(declare-fun m!573255 () Bool)

(assert (=> start!54540 m!573255))

(declare-fun m!573257 () Bool)

(assert (=> start!54540 m!573257))

(declare-fun m!573259 () Bool)

(assert (=> b!596302 m!573259))

(declare-fun m!573261 () Bool)

(assert (=> b!596286 m!573261))

(declare-fun m!573263 () Bool)

(assert (=> b!596287 m!573263))

(declare-fun m!573265 () Bool)

(assert (=> b!596280 m!573265))

(declare-fun m!573267 () Bool)

(assert (=> b!596298 m!573267))

(declare-fun m!573269 () Bool)

(assert (=> b!596298 m!573269))

(assert (=> b!596298 m!573269))

(declare-fun m!573271 () Bool)

(assert (=> b!596298 m!573271))

(declare-fun m!573273 () Bool)

(assert (=> b!596289 m!573273))

(declare-fun m!573275 () Bool)

(assert (=> b!596301 m!573275))

(assert (=> b!596295 m!573269))

(assert (=> b!596295 m!573269))

(declare-fun m!573277 () Bool)

(assert (=> b!596295 m!573277))

(assert (=> b!596283 m!573269))

(declare-fun m!573279 () Bool)

(assert (=> b!596284 m!573279))

(assert (=> b!596294 m!573269))

(assert (=> b!596294 m!573269))

(declare-fun m!573281 () Bool)

(assert (=> b!596294 m!573281))

(assert (=> b!596294 m!573269))

(declare-fun m!573283 () Bool)

(assert (=> b!596294 m!573283))

(declare-fun m!573285 () Bool)

(assert (=> b!596297 m!573285))

(declare-fun m!573287 () Bool)

(assert (=> b!596297 m!573287))

(assert (=> b!596297 m!573269))

(declare-fun m!573289 () Bool)

(assert (=> b!596297 m!573289))

(declare-fun m!573291 () Bool)

(assert (=> b!596297 m!573291))

(declare-fun m!573293 () Bool)

(assert (=> b!596297 m!573293))

(declare-fun m!573295 () Bool)

(assert (=> b!596297 m!573295))

(declare-fun m!573297 () Bool)

(assert (=> b!596297 m!573297))

(assert (=> b!596297 m!573269))

(assert (=> b!596300 m!573269))

(assert (=> b!596300 m!573295))

(declare-fun m!573299 () Bool)

(assert (=> b!596300 m!573299))

(assert (=> b!596299 m!573269))

(assert (=> b!596299 m!573269))

(declare-fun m!573301 () Bool)

(assert (=> b!596299 m!573301))

(declare-fun m!573303 () Bool)

(assert (=> b!596282 m!573303))

(assert (=> b!596288 m!573269))

(assert (=> b!596288 m!573269))

(declare-fun m!573305 () Bool)

(assert (=> b!596288 m!573305))

(declare-fun m!573307 () Bool)

(assert (=> b!596290 m!573307))

(assert (=> b!596293 m!573295))

(declare-fun m!573309 () Bool)

(assert (=> b!596293 m!573309))

(check-sat (not b!596288) (not b!596290) (not b!596295) (not b!596287) (not b!596298) (not b!596280) (not b!596282) (not b!596281) (not b!596297) (not b!596301) (not b!596289) (not start!54540) (not b!596284) (not b!596286) (not b!596294) (not b!596299))
(check-sat)
