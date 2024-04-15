; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57710 () Bool)

(assert start!57710)

(declare-fun b!638298 () Bool)

(declare-fun res!413274 () Bool)

(declare-fun e!365231 () Bool)

(assert (=> b!638298 (=> (not res!413274) (not e!365231))))

(declare-datatypes ((array!38292 0))(
  ( (array!38293 (arr!18368 (Array (_ BitVec 32) (_ BitVec 64))) (size!18733 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38292)

(declare-datatypes ((List!12448 0))(
  ( (Nil!12445) (Cons!12444 (h!13489 (_ BitVec 64)) (t!18667 List!12448)) )
))
(declare-fun arrayNoDuplicates!0 (array!38292 (_ BitVec 32) List!12448) Bool)

(assert (=> b!638298 (= res!413274 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12445))))

(declare-fun b!638299 () Bool)

(declare-fun res!413266 () Bool)

(assert (=> b!638299 (=> (not res!413266) (not e!365231))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638299 (= res!413266 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18368 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638300 () Bool)

(declare-fun e!365226 () Bool)

(declare-datatypes ((SeekEntryResult!6805 0))(
  ( (MissingZero!6805 (index!29534 (_ BitVec 32))) (Found!6805 (index!29535 (_ BitVec 32))) (Intermediate!6805 (undefined!7617 Bool) (index!29536 (_ BitVec 32)) (x!58298 (_ BitVec 32))) (Undefined!6805) (MissingVacant!6805 (index!29537 (_ BitVec 32))) )
))
(declare-fun lt!295101 () SeekEntryResult!6805)

(declare-fun lt!295098 () SeekEntryResult!6805)

(assert (=> b!638300 (= e!365226 (= lt!295101 lt!295098))))

(declare-fun b!638301 () Bool)

(declare-datatypes ((Unit!21548 0))(
  ( (Unit!21549) )
))
(declare-fun e!365229 () Unit!21548)

(declare-fun Unit!21550 () Unit!21548)

(assert (=> b!638301 (= e!365229 Unit!21550)))

(assert (=> b!638301 false))

(declare-fun b!638302 () Bool)

(declare-fun e!365232 () Bool)

(assert (=> b!638302 (= e!365232 (bvslt (size!18733 a!2986) #b01111111111111111111111111111111))))

(declare-fun lt!295097 () array!38292)

(assert (=> b!638302 (arrayNoDuplicates!0 lt!295097 #b00000000000000000000000000000000 Nil!12445)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!295102 () Unit!21548)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38292 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12448) Unit!21548)

(assert (=> b!638302 (= lt!295102 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12445))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638302 (arrayContainsKey!0 lt!295097 (select (arr!18368 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295104 () Unit!21548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38292 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21548)

(assert (=> b!638302 (= lt!295104 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295097 (select (arr!18368 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638303 () Bool)

(declare-fun res!413269 () Bool)

(declare-fun e!365227 () Bool)

(assert (=> b!638303 (=> (not res!413269) (not e!365227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638303 (= res!413269 (validKeyInArray!0 k0!1786))))

(declare-fun b!638304 () Bool)

(declare-fun e!365224 () Bool)

(assert (=> b!638304 (= e!365231 e!365224)))

(declare-fun res!413270 () Bool)

(assert (=> b!638304 (=> (not res!413270) (not e!365224))))

(assert (=> b!638304 (= res!413270 (= (select (store (arr!18368 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638304 (= lt!295097 (array!38293 (store (arr!18368 a!2986) i!1108 k0!1786) (size!18733 a!2986)))))

(declare-fun b!638305 () Bool)

(declare-fun e!365234 () Bool)

(declare-fun e!365233 () Bool)

(assert (=> b!638305 (= e!365234 (not e!365233))))

(declare-fun res!413276 () Bool)

(assert (=> b!638305 (=> res!413276 e!365233)))

(declare-fun lt!295093 () SeekEntryResult!6805)

(assert (=> b!638305 (= res!413276 (not (= lt!295093 (Found!6805 index!984))))))

(declare-fun lt!295094 () Unit!21548)

(assert (=> b!638305 (= lt!295094 e!365229)))

(declare-fun c!72885 () Bool)

(assert (=> b!638305 (= c!72885 (= lt!295093 Undefined!6805))))

(declare-fun lt!295099 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38292 (_ BitVec 32)) SeekEntryResult!6805)

(assert (=> b!638305 (= lt!295093 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295099 lt!295097 mask!3053))))

(assert (=> b!638305 e!365226))

(declare-fun res!413262 () Bool)

(assert (=> b!638305 (=> (not res!413262) (not e!365226))))

(declare-fun lt!295095 () (_ BitVec 32))

(assert (=> b!638305 (= res!413262 (= lt!295098 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295095 vacantSpotIndex!68 lt!295099 lt!295097 mask!3053)))))

(assert (=> b!638305 (= lt!295098 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295095 vacantSpotIndex!68 (select (arr!18368 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638305 (= lt!295099 (select (store (arr!18368 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295103 () Unit!21548)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38292 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21548)

(assert (=> b!638305 (= lt!295103 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295095 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638305 (= lt!295095 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638306 () Bool)

(declare-fun Unit!21551 () Unit!21548)

(assert (=> b!638306 (= e!365229 Unit!21551)))

(declare-fun res!413273 () Bool)

(assert (=> start!57710 (=> (not res!413273) (not e!365227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57710 (= res!413273 (validMask!0 mask!3053))))

(assert (=> start!57710 e!365227))

(assert (=> start!57710 true))

(declare-fun array_inv!14251 (array!38292) Bool)

(assert (=> start!57710 (array_inv!14251 a!2986)))

(declare-fun b!638307 () Bool)

(declare-fun e!365228 () Bool)

(declare-fun e!365230 () Bool)

(assert (=> b!638307 (= e!365228 e!365230)))

(declare-fun res!413264 () Bool)

(assert (=> b!638307 (=> (not res!413264) (not e!365230))))

(assert (=> b!638307 (= res!413264 (arrayContainsKey!0 lt!295097 (select (arr!18368 a!2986) j!136) j!136))))

(declare-fun b!638308 () Bool)

(assert (=> b!638308 (= e!365230 (arrayContainsKey!0 lt!295097 (select (arr!18368 a!2986) j!136) index!984))))

(declare-fun b!638309 () Bool)

(declare-fun res!413272 () Bool)

(assert (=> b!638309 (=> (not res!413272) (not e!365227))))

(assert (=> b!638309 (= res!413272 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638310 () Bool)

(assert (=> b!638310 (= e!365224 e!365234)))

(declare-fun res!413265 () Bool)

(assert (=> b!638310 (=> (not res!413265) (not e!365234))))

(assert (=> b!638310 (= res!413265 (and (= lt!295101 (Found!6805 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18368 a!2986) index!984) (select (arr!18368 a!2986) j!136))) (not (= (select (arr!18368 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!638310 (= lt!295101 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18368 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638311 () Bool)

(assert (=> b!638311 (= e!365233 e!365232)))

(declare-fun res!413277 () Bool)

(assert (=> b!638311 (=> res!413277 e!365232)))

(declare-fun lt!295096 () (_ BitVec 64))

(assert (=> b!638311 (= res!413277 (or (not (= (select (arr!18368 a!2986) j!136) lt!295099)) (not (= (select (arr!18368 a!2986) j!136) lt!295096)) (bvsge j!136 index!984)))))

(declare-fun e!365225 () Bool)

(assert (=> b!638311 e!365225))

(declare-fun res!413271 () Bool)

(assert (=> b!638311 (=> (not res!413271) (not e!365225))))

(assert (=> b!638311 (= res!413271 (= lt!295096 (select (arr!18368 a!2986) j!136)))))

(assert (=> b!638311 (= lt!295096 (select (store (arr!18368 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638312 () Bool)

(declare-fun res!413268 () Bool)

(assert (=> b!638312 (=> (not res!413268) (not e!365231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38292 (_ BitVec 32)) Bool)

(assert (=> b!638312 (= res!413268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638313 () Bool)

(assert (=> b!638313 (= e!365225 e!365228)))

(declare-fun res!413275 () Bool)

(assert (=> b!638313 (=> res!413275 e!365228)))

(assert (=> b!638313 (= res!413275 (or (not (= (select (arr!18368 a!2986) j!136) lt!295099)) (not (= (select (arr!18368 a!2986) j!136) lt!295096)) (bvsge j!136 index!984)))))

(declare-fun b!638314 () Bool)

(declare-fun res!413278 () Bool)

(assert (=> b!638314 (=> (not res!413278) (not e!365227))))

(assert (=> b!638314 (= res!413278 (validKeyInArray!0 (select (arr!18368 a!2986) j!136)))))

(declare-fun b!638315 () Bool)

(declare-fun res!413267 () Bool)

(assert (=> b!638315 (=> (not res!413267) (not e!365227))))

(assert (=> b!638315 (= res!413267 (and (= (size!18733 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18733 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18733 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638316 () Bool)

(assert (=> b!638316 (= e!365227 e!365231)))

(declare-fun res!413263 () Bool)

(assert (=> b!638316 (=> (not res!413263) (not e!365231))))

(declare-fun lt!295100 () SeekEntryResult!6805)

(assert (=> b!638316 (= res!413263 (or (= lt!295100 (MissingZero!6805 i!1108)) (= lt!295100 (MissingVacant!6805 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38292 (_ BitVec 32)) SeekEntryResult!6805)

(assert (=> b!638316 (= lt!295100 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!57710 res!413273) b!638315))

(assert (= (and b!638315 res!413267) b!638314))

(assert (= (and b!638314 res!413278) b!638303))

(assert (= (and b!638303 res!413269) b!638309))

(assert (= (and b!638309 res!413272) b!638316))

(assert (= (and b!638316 res!413263) b!638312))

(assert (= (and b!638312 res!413268) b!638298))

(assert (= (and b!638298 res!413274) b!638299))

(assert (= (and b!638299 res!413266) b!638304))

(assert (= (and b!638304 res!413270) b!638310))

(assert (= (and b!638310 res!413265) b!638305))

(assert (= (and b!638305 res!413262) b!638300))

(assert (= (and b!638305 c!72885) b!638301))

(assert (= (and b!638305 (not c!72885)) b!638306))

(assert (= (and b!638305 (not res!413276)) b!638311))

(assert (= (and b!638311 res!413271) b!638313))

(assert (= (and b!638313 (not res!413275)) b!638307))

(assert (= (and b!638307 res!413264) b!638308))

(assert (= (and b!638311 (not res!413277)) b!638302))

(declare-fun m!611733 () Bool)

(assert (=> start!57710 m!611733))

(declare-fun m!611735 () Bool)

(assert (=> start!57710 m!611735))

(declare-fun m!611737 () Bool)

(assert (=> b!638299 m!611737))

(declare-fun m!611739 () Bool)

(assert (=> b!638310 m!611739))

(declare-fun m!611741 () Bool)

(assert (=> b!638310 m!611741))

(assert (=> b!638310 m!611741))

(declare-fun m!611743 () Bool)

(assert (=> b!638310 m!611743))

(assert (=> b!638307 m!611741))

(assert (=> b!638307 m!611741))

(declare-fun m!611745 () Bool)

(assert (=> b!638307 m!611745))

(assert (=> b!638311 m!611741))

(declare-fun m!611747 () Bool)

(assert (=> b!638311 m!611747))

(declare-fun m!611749 () Bool)

(assert (=> b!638311 m!611749))

(declare-fun m!611751 () Bool)

(assert (=> b!638312 m!611751))

(assert (=> b!638308 m!611741))

(assert (=> b!638308 m!611741))

(declare-fun m!611753 () Bool)

(assert (=> b!638308 m!611753))

(assert (=> b!638314 m!611741))

(assert (=> b!638314 m!611741))

(declare-fun m!611755 () Bool)

(assert (=> b!638314 m!611755))

(assert (=> b!638313 m!611741))

(assert (=> b!638302 m!611741))

(assert (=> b!638302 m!611741))

(declare-fun m!611757 () Bool)

(assert (=> b!638302 m!611757))

(declare-fun m!611759 () Bool)

(assert (=> b!638302 m!611759))

(assert (=> b!638302 m!611741))

(declare-fun m!611761 () Bool)

(assert (=> b!638302 m!611761))

(declare-fun m!611763 () Bool)

(assert (=> b!638302 m!611763))

(declare-fun m!611765 () Bool)

(assert (=> b!638298 m!611765))

(declare-fun m!611767 () Bool)

(assert (=> b!638303 m!611767))

(assert (=> b!638304 m!611747))

(declare-fun m!611769 () Bool)

(assert (=> b!638304 m!611769))

(declare-fun m!611771 () Bool)

(assert (=> b!638316 m!611771))

(declare-fun m!611773 () Bool)

(assert (=> b!638309 m!611773))

(declare-fun m!611775 () Bool)

(assert (=> b!638305 m!611775))

(declare-fun m!611777 () Bool)

(assert (=> b!638305 m!611777))

(assert (=> b!638305 m!611741))

(declare-fun m!611779 () Bool)

(assert (=> b!638305 m!611779))

(assert (=> b!638305 m!611747))

(declare-fun m!611781 () Bool)

(assert (=> b!638305 m!611781))

(declare-fun m!611783 () Bool)

(assert (=> b!638305 m!611783))

(assert (=> b!638305 m!611741))

(declare-fun m!611785 () Bool)

(assert (=> b!638305 m!611785))

(check-sat (not b!638303) (not b!638310) (not b!638307) (not start!57710) (not b!638309) (not b!638316) (not b!638314) (not b!638298) (not b!638308) (not b!638302) (not b!638312) (not b!638305))
(check-sat)
(get-model)

(declare-fun d!89997 () Bool)

(declare-fun res!413385 () Bool)

(declare-fun e!365311 () Bool)

(assert (=> d!89997 (=> res!413385 e!365311)))

(assert (=> d!89997 (= res!413385 (= (select (arr!18368 lt!295097) index!984) (select (arr!18368 a!2986) j!136)))))

(assert (=> d!89997 (= (arrayContainsKey!0 lt!295097 (select (arr!18368 a!2986) j!136) index!984) e!365311)))

(declare-fun b!638435 () Bool)

(declare-fun e!365312 () Bool)

(assert (=> b!638435 (= e!365311 e!365312)))

(declare-fun res!413386 () Bool)

(assert (=> b!638435 (=> (not res!413386) (not e!365312))))

(assert (=> b!638435 (= res!413386 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18733 lt!295097)))))

(declare-fun b!638436 () Bool)

(assert (=> b!638436 (= e!365312 (arrayContainsKey!0 lt!295097 (select (arr!18368 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89997 (not res!413385)) b!638435))

(assert (= (and b!638435 res!413386) b!638436))

(declare-fun m!611895 () Bool)

(assert (=> d!89997 m!611895))

(assert (=> b!638436 m!611741))

(declare-fun m!611897 () Bool)

(assert (=> b!638436 m!611897))

(assert (=> b!638308 d!89997))

(declare-fun d!89999 () Bool)

(declare-fun res!413387 () Bool)

(declare-fun e!365313 () Bool)

(assert (=> d!89999 (=> res!413387 e!365313)))

(assert (=> d!89999 (= res!413387 (= (select (arr!18368 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89999 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!365313)))

(declare-fun b!638437 () Bool)

(declare-fun e!365314 () Bool)

(assert (=> b!638437 (= e!365313 e!365314)))

(declare-fun res!413388 () Bool)

(assert (=> b!638437 (=> (not res!413388) (not e!365314))))

(assert (=> b!638437 (= res!413388 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18733 a!2986)))))

(declare-fun b!638438 () Bool)

(assert (=> b!638438 (= e!365314 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89999 (not res!413387)) b!638437))

(assert (= (and b!638437 res!413388) b!638438))

(declare-fun m!611899 () Bool)

(assert (=> d!89999 m!611899))

(declare-fun m!611901 () Bool)

(assert (=> b!638438 m!611901))

(assert (=> b!638309 d!89999))

(declare-fun b!638449 () Bool)

(declare-fun e!365326 () Bool)

(declare-fun contains!3105 (List!12448 (_ BitVec 64)) Bool)

(assert (=> b!638449 (= e!365326 (contains!3105 Nil!12445 (select (arr!18368 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!638450 () Bool)

(declare-fun e!365325 () Bool)

(declare-fun e!365324 () Bool)

(assert (=> b!638450 (= e!365325 e!365324)))

(declare-fun res!413397 () Bool)

(assert (=> b!638450 (=> (not res!413397) (not e!365324))))

(assert (=> b!638450 (= res!413397 (not e!365326))))

(declare-fun res!413396 () Bool)

(assert (=> b!638450 (=> (not res!413396) (not e!365326))))

(assert (=> b!638450 (= res!413396 (validKeyInArray!0 (select (arr!18368 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33439 () Bool)

(declare-fun call!33442 () Bool)

(declare-fun c!72894 () Bool)

(assert (=> bm!33439 (= call!33442 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72894 (Cons!12444 (select (arr!18368 a!2986) #b00000000000000000000000000000000) Nil!12445) Nil!12445)))))

(declare-fun b!638452 () Bool)

(declare-fun e!365323 () Bool)

(assert (=> b!638452 (= e!365323 call!33442)))

(declare-fun b!638453 () Bool)

(assert (=> b!638453 (= e!365323 call!33442)))

(declare-fun d!90001 () Bool)

(declare-fun res!413395 () Bool)

(assert (=> d!90001 (=> res!413395 e!365325)))

(assert (=> d!90001 (= res!413395 (bvsge #b00000000000000000000000000000000 (size!18733 a!2986)))))

(assert (=> d!90001 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12445) e!365325)))

(declare-fun b!638451 () Bool)

(assert (=> b!638451 (= e!365324 e!365323)))

(assert (=> b!638451 (= c!72894 (validKeyInArray!0 (select (arr!18368 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90001 (not res!413395)) b!638450))

(assert (= (and b!638450 res!413396) b!638449))

(assert (= (and b!638450 res!413397) b!638451))

(assert (= (and b!638451 c!72894) b!638452))

(assert (= (and b!638451 (not c!72894)) b!638453))

(assert (= (or b!638452 b!638453) bm!33439))

(assert (=> b!638449 m!611899))

(assert (=> b!638449 m!611899))

(declare-fun m!611903 () Bool)

(assert (=> b!638449 m!611903))

(assert (=> b!638450 m!611899))

(assert (=> b!638450 m!611899))

(declare-fun m!611905 () Bool)

(assert (=> b!638450 m!611905))

(assert (=> bm!33439 m!611899))

(declare-fun m!611907 () Bool)

(assert (=> bm!33439 m!611907))

(assert (=> b!638451 m!611899))

(assert (=> b!638451 m!611899))

(assert (=> b!638451 m!611905))

(assert (=> b!638298 d!90001))

(declare-fun d!90003 () Bool)

(declare-fun lt!295181 () SeekEntryResult!6805)

(get-info :version)

(assert (=> d!90003 (and (or ((_ is Undefined!6805) lt!295181) (not ((_ is Found!6805) lt!295181)) (and (bvsge (index!29535 lt!295181) #b00000000000000000000000000000000) (bvslt (index!29535 lt!295181) (size!18733 a!2986)))) (or ((_ is Undefined!6805) lt!295181) ((_ is Found!6805) lt!295181) (not ((_ is MissingVacant!6805) lt!295181)) (not (= (index!29537 lt!295181) vacantSpotIndex!68)) (and (bvsge (index!29537 lt!295181) #b00000000000000000000000000000000) (bvslt (index!29537 lt!295181) (size!18733 a!2986)))) (or ((_ is Undefined!6805) lt!295181) (ite ((_ is Found!6805) lt!295181) (= (select (arr!18368 a!2986) (index!29535 lt!295181)) (select (arr!18368 a!2986) j!136)) (and ((_ is MissingVacant!6805) lt!295181) (= (index!29537 lt!295181) vacantSpotIndex!68) (= (select (arr!18368 a!2986) (index!29537 lt!295181)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!365333 () SeekEntryResult!6805)

(assert (=> d!90003 (= lt!295181 e!365333)))

(declare-fun c!72903 () Bool)

(assert (=> d!90003 (= c!72903 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!295182 () (_ BitVec 64))

(assert (=> d!90003 (= lt!295182 (select (arr!18368 a!2986) index!984))))

(assert (=> d!90003 (validMask!0 mask!3053)))

(assert (=> d!90003 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18368 a!2986) j!136) a!2986 mask!3053) lt!295181)))

(declare-fun b!638466 () Bool)

(assert (=> b!638466 (= e!365333 Undefined!6805)))

(declare-fun b!638467 () Bool)

(declare-fun e!365335 () SeekEntryResult!6805)

(assert (=> b!638467 (= e!365335 (Found!6805 index!984))))

(declare-fun b!638468 () Bool)

(declare-fun e!365334 () SeekEntryResult!6805)

(assert (=> b!638468 (= e!365334 (MissingVacant!6805 vacantSpotIndex!68))))

(declare-fun b!638469 () Bool)

(assert (=> b!638469 (= e!365334 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18368 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638470 () Bool)

(declare-fun c!72902 () Bool)

(assert (=> b!638470 (= c!72902 (= lt!295182 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638470 (= e!365335 e!365334)))

(declare-fun b!638471 () Bool)

(assert (=> b!638471 (= e!365333 e!365335)))

(declare-fun c!72901 () Bool)

(assert (=> b!638471 (= c!72901 (= lt!295182 (select (arr!18368 a!2986) j!136)))))

(assert (= (and d!90003 c!72903) b!638466))

(assert (= (and d!90003 (not c!72903)) b!638471))

(assert (= (and b!638471 c!72901) b!638467))

(assert (= (and b!638471 (not c!72901)) b!638470))

(assert (= (and b!638470 c!72902) b!638468))

(assert (= (and b!638470 (not c!72902)) b!638469))

(declare-fun m!611909 () Bool)

(assert (=> d!90003 m!611909))

(declare-fun m!611911 () Bool)

(assert (=> d!90003 m!611911))

(assert (=> d!90003 m!611739))

(assert (=> d!90003 m!611733))

(assert (=> b!638469 m!611775))

(assert (=> b!638469 m!611775))

(assert (=> b!638469 m!611741))

(declare-fun m!611913 () Bool)

(assert (=> b!638469 m!611913))

(assert (=> b!638310 d!90003))

(declare-fun d!90005 () Bool)

(declare-fun res!413415 () Bool)

(declare-fun e!365356 () Bool)

(assert (=> d!90005 (=> res!413415 e!365356)))

(assert (=> d!90005 (= res!413415 (bvsge #b00000000000000000000000000000000 (size!18733 a!2986)))))

(assert (=> d!90005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!365356)))

(declare-fun b!638496 () Bool)

(declare-fun e!365357 () Bool)

(declare-fun call!33447 () Bool)

(assert (=> b!638496 (= e!365357 call!33447)))

(declare-fun b!638497 () Bool)

(declare-fun e!365358 () Bool)

(assert (=> b!638497 (= e!365357 e!365358)))

(declare-fun lt!295197 () (_ BitVec 64))

(assert (=> b!638497 (= lt!295197 (select (arr!18368 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!295196 () Unit!21548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38292 (_ BitVec 64) (_ BitVec 32)) Unit!21548)

(assert (=> b!638497 (= lt!295196 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!295197 #b00000000000000000000000000000000))))

(assert (=> b!638497 (arrayContainsKey!0 a!2986 lt!295197 #b00000000000000000000000000000000)))

(declare-fun lt!295195 () Unit!21548)

(assert (=> b!638497 (= lt!295195 lt!295196)))

(declare-fun res!413414 () Bool)

(assert (=> b!638497 (= res!413414 (= (seekEntryOrOpen!0 (select (arr!18368 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6805 #b00000000000000000000000000000000)))))

(assert (=> b!638497 (=> (not res!413414) (not e!365358))))

(declare-fun b!638498 () Bool)

(assert (=> b!638498 (= e!365358 call!33447)))

(declare-fun bm!33444 () Bool)

(assert (=> bm!33444 (= call!33447 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!638499 () Bool)

(assert (=> b!638499 (= e!365356 e!365357)))

(declare-fun c!72908 () Bool)

(assert (=> b!638499 (= c!72908 (validKeyInArray!0 (select (arr!18368 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90005 (not res!413415)) b!638499))

(assert (= (and b!638499 c!72908) b!638497))

(assert (= (and b!638499 (not c!72908)) b!638496))

(assert (= (and b!638497 res!413414) b!638498))

(assert (= (or b!638498 b!638496) bm!33444))

(assert (=> b!638497 m!611899))

(declare-fun m!611923 () Bool)

(assert (=> b!638497 m!611923))

(declare-fun m!611925 () Bool)

(assert (=> b!638497 m!611925))

(assert (=> b!638497 m!611899))

(declare-fun m!611927 () Bool)

(assert (=> b!638497 m!611927))

(declare-fun m!611929 () Bool)

(assert (=> bm!33444 m!611929))

(assert (=> b!638499 m!611899))

(assert (=> b!638499 m!611899))

(assert (=> b!638499 m!611905))

(assert (=> b!638312 d!90005))

(declare-fun d!90015 () Bool)

(assert (=> d!90015 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!638303 d!90015))

(declare-fun d!90017 () Bool)

(assert (=> d!90017 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57710 d!90017))

(declare-fun d!90023 () Bool)

(assert (=> d!90023 (= (array_inv!14251 a!2986) (bvsge (size!18733 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57710 d!90023))

(declare-fun b!638518 () Bool)

(declare-fun e!365376 () Bool)

(assert (=> b!638518 (= e!365376 (contains!3105 Nil!12445 (select (arr!18368 lt!295097) #b00000000000000000000000000000000)))))

(declare-fun b!638519 () Bool)

(declare-fun e!365375 () Bool)

(declare-fun e!365374 () Bool)

(assert (=> b!638519 (= e!365375 e!365374)))

(declare-fun res!413428 () Bool)

(assert (=> b!638519 (=> (not res!413428) (not e!365374))))

(assert (=> b!638519 (= res!413428 (not e!365376))))

(declare-fun res!413427 () Bool)

(assert (=> b!638519 (=> (not res!413427) (not e!365376))))

(assert (=> b!638519 (= res!413427 (validKeyInArray!0 (select (arr!18368 lt!295097) #b00000000000000000000000000000000)))))

(declare-fun bm!33449 () Bool)

(declare-fun call!33452 () Bool)

(declare-fun c!72913 () Bool)

(assert (=> bm!33449 (= call!33452 (arrayNoDuplicates!0 lt!295097 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72913 (Cons!12444 (select (arr!18368 lt!295097) #b00000000000000000000000000000000) Nil!12445) Nil!12445)))))

(declare-fun b!638521 () Bool)

(declare-fun e!365373 () Bool)

(assert (=> b!638521 (= e!365373 call!33452)))

(declare-fun b!638522 () Bool)

(assert (=> b!638522 (= e!365373 call!33452)))

(declare-fun d!90025 () Bool)

(declare-fun res!413426 () Bool)

(assert (=> d!90025 (=> res!413426 e!365375)))

(assert (=> d!90025 (= res!413426 (bvsge #b00000000000000000000000000000000 (size!18733 lt!295097)))))

(assert (=> d!90025 (= (arrayNoDuplicates!0 lt!295097 #b00000000000000000000000000000000 Nil!12445) e!365375)))

(declare-fun b!638520 () Bool)

(assert (=> b!638520 (= e!365374 e!365373)))

(assert (=> b!638520 (= c!72913 (validKeyInArray!0 (select (arr!18368 lt!295097) #b00000000000000000000000000000000)))))

(assert (= (and d!90025 (not res!413426)) b!638519))

(assert (= (and b!638519 res!413427) b!638518))

(assert (= (and b!638519 res!413428) b!638520))

(assert (= (and b!638520 c!72913) b!638521))

(assert (= (and b!638520 (not c!72913)) b!638522))

(assert (= (or b!638521 b!638522) bm!33449))

(declare-fun m!611953 () Bool)

(assert (=> b!638518 m!611953))

(assert (=> b!638518 m!611953))

(declare-fun m!611955 () Bool)

(assert (=> b!638518 m!611955))

(assert (=> b!638519 m!611953))

(assert (=> b!638519 m!611953))

(declare-fun m!611957 () Bool)

(assert (=> b!638519 m!611957))

(assert (=> bm!33449 m!611953))

(declare-fun m!611959 () Bool)

(assert (=> bm!33449 m!611959))

(assert (=> b!638520 m!611953))

(assert (=> b!638520 m!611953))

(assert (=> b!638520 m!611957))

(assert (=> b!638302 d!90025))

(declare-fun d!90027 () Bool)

(declare-fun e!365380 () Bool)

(assert (=> d!90027 e!365380))

(declare-fun res!413432 () Bool)

(assert (=> d!90027 (=> (not res!413432) (not e!365380))))

(assert (=> d!90027 (= res!413432 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18733 a!2986))))))

(declare-fun lt!295215 () Unit!21548)

(declare-fun choose!41 (array!38292 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12448) Unit!21548)

(assert (=> d!90027 (= lt!295215 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12445))))

(assert (=> d!90027 (bvslt (size!18733 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90027 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12445) lt!295215)))

(declare-fun b!638526 () Bool)

(assert (=> b!638526 (= e!365380 (arrayNoDuplicates!0 (array!38293 (store (arr!18368 a!2986) i!1108 k0!1786) (size!18733 a!2986)) #b00000000000000000000000000000000 Nil!12445))))

(assert (= (and d!90027 res!413432) b!638526))

(declare-fun m!611965 () Bool)

(assert (=> d!90027 m!611965))

(assert (=> b!638526 m!611747))

(declare-fun m!611967 () Bool)

(assert (=> b!638526 m!611967))

(assert (=> b!638302 d!90027))

(declare-fun d!90035 () Bool)

(declare-fun res!413433 () Bool)

(declare-fun e!365381 () Bool)

(assert (=> d!90035 (=> res!413433 e!365381)))

(assert (=> d!90035 (= res!413433 (= (select (arr!18368 lt!295097) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18368 a!2986) j!136)))))

(assert (=> d!90035 (= (arrayContainsKey!0 lt!295097 (select (arr!18368 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!365381)))

(declare-fun b!638527 () Bool)

(declare-fun e!365382 () Bool)

(assert (=> b!638527 (= e!365381 e!365382)))

(declare-fun res!413434 () Bool)

(assert (=> b!638527 (=> (not res!413434) (not e!365382))))

(assert (=> b!638527 (= res!413434 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18733 lt!295097)))))

(declare-fun b!638528 () Bool)

(assert (=> b!638528 (= e!365382 (arrayContainsKey!0 lt!295097 (select (arr!18368 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90035 (not res!413433)) b!638527))

(assert (= (and b!638527 res!413434) b!638528))

(declare-fun m!611969 () Bool)

(assert (=> d!90035 m!611969))

(assert (=> b!638528 m!611741))

(declare-fun m!611971 () Bool)

(assert (=> b!638528 m!611971))

(assert (=> b!638302 d!90035))

(declare-fun d!90037 () Bool)

(assert (=> d!90037 (arrayContainsKey!0 lt!295097 (select (arr!18368 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295218 () Unit!21548)

(declare-fun choose!114 (array!38292 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21548)

(assert (=> d!90037 (= lt!295218 (choose!114 lt!295097 (select (arr!18368 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90037 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90037 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295097 (select (arr!18368 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!295218)))

(declare-fun bs!19119 () Bool)

(assert (= bs!19119 d!90037))

(assert (=> bs!19119 m!611741))

(assert (=> bs!19119 m!611761))

(assert (=> bs!19119 m!611741))

(declare-fun m!611973 () Bool)

(assert (=> bs!19119 m!611973))

(assert (=> b!638302 d!90037))

(declare-fun d!90039 () Bool)

(assert (=> d!90039 (= (validKeyInArray!0 (select (arr!18368 a!2986) j!136)) (and (not (= (select (arr!18368 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18368 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!638314 d!90039))

(declare-fun lt!295248 () SeekEntryResult!6805)

(declare-fun e!365448 () SeekEntryResult!6805)

(declare-fun b!638629 () Bool)

(assert (=> b!638629 (= e!365448 (seekKeyOrZeroReturnVacant!0 (x!58298 lt!295248) (index!29536 lt!295248) (index!29536 lt!295248) k0!1786 a!2986 mask!3053))))

(declare-fun b!638630 () Bool)

(declare-fun e!365447 () SeekEntryResult!6805)

(declare-fun e!365449 () SeekEntryResult!6805)

(assert (=> b!638630 (= e!365447 e!365449)))

(declare-fun lt!295249 () (_ BitVec 64))

(assert (=> b!638630 (= lt!295249 (select (arr!18368 a!2986) (index!29536 lt!295248)))))

(declare-fun c!72951 () Bool)

(assert (=> b!638630 (= c!72951 (= lt!295249 k0!1786))))

(declare-fun d!90041 () Bool)

(declare-fun lt!295247 () SeekEntryResult!6805)

(assert (=> d!90041 (and (or ((_ is Undefined!6805) lt!295247) (not ((_ is Found!6805) lt!295247)) (and (bvsge (index!29535 lt!295247) #b00000000000000000000000000000000) (bvslt (index!29535 lt!295247) (size!18733 a!2986)))) (or ((_ is Undefined!6805) lt!295247) ((_ is Found!6805) lt!295247) (not ((_ is MissingZero!6805) lt!295247)) (and (bvsge (index!29534 lt!295247) #b00000000000000000000000000000000) (bvslt (index!29534 lt!295247) (size!18733 a!2986)))) (or ((_ is Undefined!6805) lt!295247) ((_ is Found!6805) lt!295247) ((_ is MissingZero!6805) lt!295247) (not ((_ is MissingVacant!6805) lt!295247)) (and (bvsge (index!29537 lt!295247) #b00000000000000000000000000000000) (bvslt (index!29537 lt!295247) (size!18733 a!2986)))) (or ((_ is Undefined!6805) lt!295247) (ite ((_ is Found!6805) lt!295247) (= (select (arr!18368 a!2986) (index!29535 lt!295247)) k0!1786) (ite ((_ is MissingZero!6805) lt!295247) (= (select (arr!18368 a!2986) (index!29534 lt!295247)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6805) lt!295247) (= (select (arr!18368 a!2986) (index!29537 lt!295247)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90041 (= lt!295247 e!365447)))

(declare-fun c!72952 () Bool)

(assert (=> d!90041 (= c!72952 (and ((_ is Intermediate!6805) lt!295248) (undefined!7617 lt!295248)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38292 (_ BitVec 32)) SeekEntryResult!6805)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90041 (= lt!295248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90041 (validMask!0 mask!3053)))

(assert (=> d!90041 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!295247)))

(declare-fun b!638631 () Bool)

(assert (=> b!638631 (= e!365448 (MissingZero!6805 (index!29536 lt!295248)))))

(declare-fun b!638632 () Bool)

(assert (=> b!638632 (= e!365449 (Found!6805 (index!29536 lt!295248)))))

(declare-fun b!638633 () Bool)

(declare-fun c!72950 () Bool)

(assert (=> b!638633 (= c!72950 (= lt!295249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638633 (= e!365449 e!365448)))

(declare-fun b!638634 () Bool)

(assert (=> b!638634 (= e!365447 Undefined!6805)))

(assert (= (and d!90041 c!72952) b!638634))

(assert (= (and d!90041 (not c!72952)) b!638630))

(assert (= (and b!638630 c!72951) b!638632))

(assert (= (and b!638630 (not c!72951)) b!638633))

(assert (= (and b!638633 c!72950) b!638631))

(assert (= (and b!638633 (not c!72950)) b!638629))

(declare-fun m!612037 () Bool)

(assert (=> b!638629 m!612037))

(declare-fun m!612039 () Bool)

(assert (=> b!638630 m!612039))

(declare-fun m!612041 () Bool)

(assert (=> d!90041 m!612041))

(declare-fun m!612043 () Bool)

(assert (=> d!90041 m!612043))

(declare-fun m!612045 () Bool)

(assert (=> d!90041 m!612045))

(declare-fun m!612047 () Bool)

(assert (=> d!90041 m!612047))

(declare-fun m!612049 () Bool)

(assert (=> d!90041 m!612049))

(assert (=> d!90041 m!611733))

(assert (=> d!90041 m!612043))

(assert (=> b!638316 d!90041))

(declare-fun lt!295252 () SeekEntryResult!6805)

(declare-fun d!90067 () Bool)

(assert (=> d!90067 (and (or ((_ is Undefined!6805) lt!295252) (not ((_ is Found!6805) lt!295252)) (and (bvsge (index!29535 lt!295252) #b00000000000000000000000000000000) (bvslt (index!29535 lt!295252) (size!18733 lt!295097)))) (or ((_ is Undefined!6805) lt!295252) ((_ is Found!6805) lt!295252) (not ((_ is MissingVacant!6805) lt!295252)) (not (= (index!29537 lt!295252) vacantSpotIndex!68)) (and (bvsge (index!29537 lt!295252) #b00000000000000000000000000000000) (bvslt (index!29537 lt!295252) (size!18733 lt!295097)))) (or ((_ is Undefined!6805) lt!295252) (ite ((_ is Found!6805) lt!295252) (= (select (arr!18368 lt!295097) (index!29535 lt!295252)) lt!295099) (and ((_ is MissingVacant!6805) lt!295252) (= (index!29537 lt!295252) vacantSpotIndex!68) (= (select (arr!18368 lt!295097) (index!29537 lt!295252)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!365452 () SeekEntryResult!6805)

(assert (=> d!90067 (= lt!295252 e!365452)))

(declare-fun c!72955 () Bool)

(assert (=> d!90067 (= c!72955 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!295253 () (_ BitVec 64))

(assert (=> d!90067 (= lt!295253 (select (arr!18368 lt!295097) lt!295095))))

(assert (=> d!90067 (validMask!0 mask!3053)))

(assert (=> d!90067 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295095 vacantSpotIndex!68 lt!295099 lt!295097 mask!3053) lt!295252)))

(declare-fun b!638637 () Bool)

(assert (=> b!638637 (= e!365452 Undefined!6805)))

(declare-fun b!638638 () Bool)

(declare-fun e!365454 () SeekEntryResult!6805)

(assert (=> b!638638 (= e!365454 (Found!6805 lt!295095))))

(declare-fun b!638639 () Bool)

(declare-fun e!365453 () SeekEntryResult!6805)

(assert (=> b!638639 (= e!365453 (MissingVacant!6805 vacantSpotIndex!68))))

(declare-fun b!638640 () Bool)

(assert (=> b!638640 (= e!365453 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!295095 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!295099 lt!295097 mask!3053))))

(declare-fun b!638641 () Bool)

(declare-fun c!72954 () Bool)

(assert (=> b!638641 (= c!72954 (= lt!295253 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638641 (= e!365454 e!365453)))

(declare-fun b!638642 () Bool)

(assert (=> b!638642 (= e!365452 e!365454)))

(declare-fun c!72953 () Bool)

(assert (=> b!638642 (= c!72953 (= lt!295253 lt!295099))))

(assert (= (and d!90067 c!72955) b!638637))

(assert (= (and d!90067 (not c!72955)) b!638642))

(assert (= (and b!638642 c!72953) b!638638))

(assert (= (and b!638642 (not c!72953)) b!638641))

(assert (= (and b!638641 c!72954) b!638639))

(assert (= (and b!638641 (not c!72954)) b!638640))

(declare-fun m!612051 () Bool)

(assert (=> d!90067 m!612051))

(declare-fun m!612053 () Bool)

(assert (=> d!90067 m!612053))

(declare-fun m!612055 () Bool)

(assert (=> d!90067 m!612055))

(assert (=> d!90067 m!611733))

(declare-fun m!612057 () Bool)

(assert (=> b!638640 m!612057))

(assert (=> b!638640 m!612057))

(declare-fun m!612059 () Bool)

(assert (=> b!638640 m!612059))

(assert (=> b!638305 d!90067))

(declare-fun d!90069 () Bool)

(declare-fun e!365472 () Bool)

(assert (=> d!90069 e!365472))

(declare-fun res!413470 () Bool)

(assert (=> d!90069 (=> (not res!413470) (not e!365472))))

(assert (=> d!90069 (= res!413470 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18733 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18733 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18733 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18733 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18733 a!2986))))))

(declare-fun lt!295271 () Unit!21548)

(declare-fun choose!9 (array!38292 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21548)

(assert (=> d!90069 (= lt!295271 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295095 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90069 (validMask!0 mask!3053)))

(assert (=> d!90069 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295095 vacantSpotIndex!68 mask!3053) lt!295271)))

(declare-fun b!638672 () Bool)

(assert (=> b!638672 (= e!365472 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295095 vacantSpotIndex!68 (select (arr!18368 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295095 vacantSpotIndex!68 (select (store (arr!18368 a!2986) i!1108 k0!1786) j!136) (array!38293 (store (arr!18368 a!2986) i!1108 k0!1786) (size!18733 a!2986)) mask!3053)))))

(assert (= (and d!90069 res!413470) b!638672))

(declare-fun m!612091 () Bool)

(assert (=> d!90069 m!612091))

(assert (=> d!90069 m!611733))

(assert (=> b!638672 m!611777))

(declare-fun m!612093 () Bool)

(assert (=> b!638672 m!612093))

(assert (=> b!638672 m!611747))

(assert (=> b!638672 m!611741))

(assert (=> b!638672 m!611785))

(assert (=> b!638672 m!611741))

(assert (=> b!638672 m!611777))

(assert (=> b!638305 d!90069))

(declare-fun d!90087 () Bool)

(declare-fun lt!295272 () SeekEntryResult!6805)

(assert (=> d!90087 (and (or ((_ is Undefined!6805) lt!295272) (not ((_ is Found!6805) lt!295272)) (and (bvsge (index!29535 lt!295272) #b00000000000000000000000000000000) (bvslt (index!29535 lt!295272) (size!18733 a!2986)))) (or ((_ is Undefined!6805) lt!295272) ((_ is Found!6805) lt!295272) (not ((_ is MissingVacant!6805) lt!295272)) (not (= (index!29537 lt!295272) vacantSpotIndex!68)) (and (bvsge (index!29537 lt!295272) #b00000000000000000000000000000000) (bvslt (index!29537 lt!295272) (size!18733 a!2986)))) (or ((_ is Undefined!6805) lt!295272) (ite ((_ is Found!6805) lt!295272) (= (select (arr!18368 a!2986) (index!29535 lt!295272)) (select (arr!18368 a!2986) j!136)) (and ((_ is MissingVacant!6805) lt!295272) (= (index!29537 lt!295272) vacantSpotIndex!68) (= (select (arr!18368 a!2986) (index!29537 lt!295272)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!365473 () SeekEntryResult!6805)

(assert (=> d!90087 (= lt!295272 e!365473)))

(declare-fun c!72970 () Bool)

(assert (=> d!90087 (= c!72970 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!295273 () (_ BitVec 64))

(assert (=> d!90087 (= lt!295273 (select (arr!18368 a!2986) lt!295095))))

(assert (=> d!90087 (validMask!0 mask!3053)))

(assert (=> d!90087 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295095 vacantSpotIndex!68 (select (arr!18368 a!2986) j!136) a!2986 mask!3053) lt!295272)))

(declare-fun b!638673 () Bool)

(assert (=> b!638673 (= e!365473 Undefined!6805)))

(declare-fun b!638674 () Bool)

(declare-fun e!365475 () SeekEntryResult!6805)

(assert (=> b!638674 (= e!365475 (Found!6805 lt!295095))))

(declare-fun b!638675 () Bool)

(declare-fun e!365474 () SeekEntryResult!6805)

(assert (=> b!638675 (= e!365474 (MissingVacant!6805 vacantSpotIndex!68))))

(declare-fun b!638676 () Bool)

(assert (=> b!638676 (= e!365474 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!295095 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18368 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638677 () Bool)

(declare-fun c!72969 () Bool)

(assert (=> b!638677 (= c!72969 (= lt!295273 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638677 (= e!365475 e!365474)))

(declare-fun b!638678 () Bool)

(assert (=> b!638678 (= e!365473 e!365475)))

(declare-fun c!72968 () Bool)

(assert (=> b!638678 (= c!72968 (= lt!295273 (select (arr!18368 a!2986) j!136)))))

(assert (= (and d!90087 c!72970) b!638673))

(assert (= (and d!90087 (not c!72970)) b!638678))

(assert (= (and b!638678 c!72968) b!638674))

(assert (= (and b!638678 (not c!72968)) b!638677))

(assert (= (and b!638677 c!72969) b!638675))

(assert (= (and b!638677 (not c!72969)) b!638676))

(declare-fun m!612095 () Bool)

(assert (=> d!90087 m!612095))

(declare-fun m!612097 () Bool)

(assert (=> d!90087 m!612097))

(declare-fun m!612099 () Bool)

(assert (=> d!90087 m!612099))

(assert (=> d!90087 m!611733))

(assert (=> b!638676 m!612057))

(assert (=> b!638676 m!612057))

(assert (=> b!638676 m!611741))

(declare-fun m!612101 () Bool)

(assert (=> b!638676 m!612101))

(assert (=> b!638305 d!90087))

(declare-fun d!90089 () Bool)

(declare-fun lt!295276 () (_ BitVec 32))

(assert (=> d!90089 (and (bvsge lt!295276 #b00000000000000000000000000000000) (bvslt lt!295276 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90089 (= lt!295276 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90089 (validMask!0 mask!3053)))

(assert (=> d!90089 (= (nextIndex!0 index!984 x!910 mask!3053) lt!295276)))

(declare-fun bs!19123 () Bool)

(assert (= bs!19123 d!90089))

(declare-fun m!612103 () Bool)

(assert (=> bs!19123 m!612103))

(assert (=> bs!19123 m!611733))

(assert (=> b!638305 d!90089))

(declare-fun d!90091 () Bool)

(declare-fun lt!295277 () SeekEntryResult!6805)

(assert (=> d!90091 (and (or ((_ is Undefined!6805) lt!295277) (not ((_ is Found!6805) lt!295277)) (and (bvsge (index!29535 lt!295277) #b00000000000000000000000000000000) (bvslt (index!29535 lt!295277) (size!18733 lt!295097)))) (or ((_ is Undefined!6805) lt!295277) ((_ is Found!6805) lt!295277) (not ((_ is MissingVacant!6805) lt!295277)) (not (= (index!29537 lt!295277) vacantSpotIndex!68)) (and (bvsge (index!29537 lt!295277) #b00000000000000000000000000000000) (bvslt (index!29537 lt!295277) (size!18733 lt!295097)))) (or ((_ is Undefined!6805) lt!295277) (ite ((_ is Found!6805) lt!295277) (= (select (arr!18368 lt!295097) (index!29535 lt!295277)) lt!295099) (and ((_ is MissingVacant!6805) lt!295277) (= (index!29537 lt!295277) vacantSpotIndex!68) (= (select (arr!18368 lt!295097) (index!29537 lt!295277)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!365476 () SeekEntryResult!6805)

(assert (=> d!90091 (= lt!295277 e!365476)))

(declare-fun c!72973 () Bool)

(assert (=> d!90091 (= c!72973 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!295278 () (_ BitVec 64))

(assert (=> d!90091 (= lt!295278 (select (arr!18368 lt!295097) index!984))))

(assert (=> d!90091 (validMask!0 mask!3053)))

(assert (=> d!90091 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295099 lt!295097 mask!3053) lt!295277)))

(declare-fun b!638679 () Bool)

(assert (=> b!638679 (= e!365476 Undefined!6805)))

(declare-fun b!638680 () Bool)

(declare-fun e!365478 () SeekEntryResult!6805)

(assert (=> b!638680 (= e!365478 (Found!6805 index!984))))

(declare-fun b!638681 () Bool)

(declare-fun e!365477 () SeekEntryResult!6805)

(assert (=> b!638681 (= e!365477 (MissingVacant!6805 vacantSpotIndex!68))))

(declare-fun b!638682 () Bool)

(assert (=> b!638682 (= e!365477 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!295099 lt!295097 mask!3053))))

(declare-fun b!638683 () Bool)

(declare-fun c!72972 () Bool)

(assert (=> b!638683 (= c!72972 (= lt!295278 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638683 (= e!365478 e!365477)))

(declare-fun b!638684 () Bool)

(assert (=> b!638684 (= e!365476 e!365478)))

(declare-fun c!72971 () Bool)

(assert (=> b!638684 (= c!72971 (= lt!295278 lt!295099))))

(assert (= (and d!90091 c!72973) b!638679))

(assert (= (and d!90091 (not c!72973)) b!638684))

(assert (= (and b!638684 c!72971) b!638680))

(assert (= (and b!638684 (not c!72971)) b!638683))

(assert (= (and b!638683 c!72972) b!638681))

(assert (= (and b!638683 (not c!72972)) b!638682))

(declare-fun m!612105 () Bool)

(assert (=> d!90091 m!612105))

(declare-fun m!612107 () Bool)

(assert (=> d!90091 m!612107))

(assert (=> d!90091 m!611895))

(assert (=> d!90091 m!611733))

(assert (=> b!638682 m!611775))

(assert (=> b!638682 m!611775))

(declare-fun m!612109 () Bool)

(assert (=> b!638682 m!612109))

(assert (=> b!638305 d!90091))

(declare-fun d!90093 () Bool)

(declare-fun res!413471 () Bool)

(declare-fun e!365479 () Bool)

(assert (=> d!90093 (=> res!413471 e!365479)))

(assert (=> d!90093 (= res!413471 (= (select (arr!18368 lt!295097) j!136) (select (arr!18368 a!2986) j!136)))))

(assert (=> d!90093 (= (arrayContainsKey!0 lt!295097 (select (arr!18368 a!2986) j!136) j!136) e!365479)))

(declare-fun b!638685 () Bool)

(declare-fun e!365480 () Bool)

(assert (=> b!638685 (= e!365479 e!365480)))

(declare-fun res!413472 () Bool)

(assert (=> b!638685 (=> (not res!413472) (not e!365480))))

(assert (=> b!638685 (= res!413472 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18733 lt!295097)))))

(declare-fun b!638686 () Bool)

(assert (=> b!638686 (= e!365480 (arrayContainsKey!0 lt!295097 (select (arr!18368 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90093 (not res!413471)) b!638685))

(assert (= (and b!638685 res!413472) b!638686))

(declare-fun m!612111 () Bool)

(assert (=> d!90093 m!612111))

(assert (=> b!638686 m!611741))

(declare-fun m!612113 () Bool)

(assert (=> b!638686 m!612113))

(assert (=> b!638307 d!90093))

(check-sat (not d!90037) (not bm!33449) (not b!638519) (not bm!33444) (not d!90089) (not b!638450) (not b!638640) (not b!638676) (not b!638438) (not d!90091) (not b!638528) (not d!90027) (not d!90003) (not d!90067) (not b!638499) (not b!638526) (not d!90087) (not b!638449) (not b!638497) (not b!638518) (not b!638436) (not b!638451) (not b!638629) (not b!638672) (not b!638686) (not d!90069) (not b!638682) (not d!90041) (not b!638469) (not bm!33439) (not b!638520))
(check-sat)
