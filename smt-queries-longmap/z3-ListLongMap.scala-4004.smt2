; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54480 () Bool)

(assert start!54480)

(declare-fun b!594210 () Bool)

(declare-fun res!380319 () Bool)

(declare-fun e!339486 () Bool)

(assert (=> b!594210 (=> res!380319 e!339486)))

(declare-datatypes ((List!11821 0))(
  ( (Nil!11818) (Cons!11817 (h!12862 (_ BitVec 64)) (t!18040 List!11821)) )
))
(declare-fun contains!2905 (List!11821 (_ BitVec 64)) Bool)

(assert (=> b!594210 (= res!380319 (contains!2905 Nil!11818 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594211 () Bool)

(declare-fun res!380318 () Bool)

(declare-fun e!339490 () Bool)

(assert (=> b!594211 (=> (not res!380318) (not e!339490))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36954 0))(
  ( (array!36955 (arr!17741 (Array (_ BitVec 32) (_ BitVec 64))) (size!18106 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36954)

(assert (=> b!594211 (= res!380318 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17741 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594212 () Bool)

(declare-fun res!380322 () Bool)

(declare-fun e!339495 () Bool)

(assert (=> b!594212 (=> (not res!380322) (not e!339495))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594212 (= res!380322 (and (= (size!18106 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18106 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18106 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594213 () Bool)

(assert (=> b!594213 (= e!339486 true)))

(declare-fun lt!269642 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!594213 (= lt!269642 (contains!2905 Nil!11818 k0!1786))))

(declare-fun b!594215 () Bool)

(declare-fun res!380312 () Bool)

(assert (=> b!594215 (=> res!380312 e!339486)))

(declare-fun noDuplicate!242 (List!11821) Bool)

(assert (=> b!594215 (= res!380312 (not (noDuplicate!242 Nil!11818)))))

(declare-fun b!594216 () Bool)

(declare-fun e!339488 () Bool)

(assert (=> b!594216 (= e!339490 e!339488)))

(declare-fun res!380320 () Bool)

(assert (=> b!594216 (=> (not res!380320) (not e!339488))))

(assert (=> b!594216 (= res!380320 (= (select (store (arr!17741 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!269647 () array!36954)

(assert (=> b!594216 (= lt!269647 (array!36955 (store (arr!17741 a!2986) i!1108 k0!1786) (size!18106 a!2986)))))

(declare-fun b!594217 () Bool)

(declare-datatypes ((Unit!18624 0))(
  ( (Unit!18625) )
))
(declare-fun e!339493 () Unit!18624)

(declare-fun Unit!18626 () Unit!18624)

(assert (=> b!594217 (= e!339493 Unit!18626)))

(assert (=> b!594217 false))

(declare-fun b!594218 () Bool)

(declare-fun res!380328 () Bool)

(assert (=> b!594218 (=> (not res!380328) (not e!339495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594218 (= res!380328 (validKeyInArray!0 (select (arr!17741 a!2986) j!136)))))

(declare-fun e!339491 () Bool)

(declare-fun b!594219 () Bool)

(declare-fun arrayContainsKey!0 (array!36954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594219 (= e!339491 (arrayContainsKey!0 lt!269647 (select (arr!17741 a!2986) j!136) index!984))))

(declare-fun b!594220 () Bool)

(assert (=> b!594220 (= e!339495 e!339490)))

(declare-fun res!380327 () Bool)

(assert (=> b!594220 (=> (not res!380327) (not e!339490))))

(declare-datatypes ((SeekEntryResult!6178 0))(
  ( (MissingZero!6178 (index!26960 (_ BitVec 32))) (Found!6178 (index!26961 (_ BitVec 32))) (Intermediate!6178 (undefined!6990 Bool) (index!26962 (_ BitVec 32)) (x!55777 (_ BitVec 32))) (Undefined!6178) (MissingVacant!6178 (index!26963 (_ BitVec 32))) )
))
(declare-fun lt!269636 () SeekEntryResult!6178)

(assert (=> b!594220 (= res!380327 (or (= lt!269636 (MissingZero!6178 i!1108)) (= lt!269636 (MissingVacant!6178 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36954 (_ BitVec 32)) SeekEntryResult!6178)

(assert (=> b!594220 (= lt!269636 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594221 () Bool)

(declare-fun res!380323 () Bool)

(assert (=> b!594221 (=> res!380323 e!339486)))

(assert (=> b!594221 (= res!380323 (contains!2905 Nil!11818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594222 () Bool)

(declare-fun res!380311 () Bool)

(assert (=> b!594222 (=> (not res!380311) (not e!339495))))

(assert (=> b!594222 (= res!380311 (validKeyInArray!0 k0!1786))))

(declare-fun b!594223 () Bool)

(declare-fun Unit!18627 () Unit!18624)

(assert (=> b!594223 (= e!339493 Unit!18627)))

(declare-fun b!594224 () Bool)

(declare-fun e!339497 () Bool)

(assert (=> b!594224 (= e!339497 e!339486)))

(declare-fun res!380310 () Bool)

(assert (=> b!594224 (=> res!380310 e!339486)))

(assert (=> b!594224 (= res!380310 (or (bvsge (size!18106 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18106 a!2986))))))

(assert (=> b!594224 (arrayContainsKey!0 lt!269647 (select (arr!17741 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269638 () Unit!18624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36954 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18624)

(assert (=> b!594224 (= lt!269638 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269647 (select (arr!17741 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594225 () Bool)

(declare-fun res!380330 () Bool)

(assert (=> b!594225 (=> (not res!380330) (not e!339495))))

(assert (=> b!594225 (= res!380330 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594226 () Bool)

(declare-fun res!380321 () Bool)

(assert (=> b!594226 (=> (not res!380321) (not e!339490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36954 (_ BitVec 32)) Bool)

(assert (=> b!594226 (= res!380321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594227 () Bool)

(declare-fun e!339496 () Bool)

(declare-fun e!339489 () Bool)

(assert (=> b!594227 (= e!339496 (not e!339489))))

(declare-fun res!380313 () Bool)

(assert (=> b!594227 (=> res!380313 e!339489)))

(declare-fun lt!269645 () SeekEntryResult!6178)

(assert (=> b!594227 (= res!380313 (not (= lt!269645 (Found!6178 index!984))))))

(declare-fun lt!269646 () Unit!18624)

(assert (=> b!594227 (= lt!269646 e!339493)))

(declare-fun c!67317 () Bool)

(assert (=> b!594227 (= c!67317 (= lt!269645 Undefined!6178))))

(declare-fun lt!269637 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36954 (_ BitVec 32)) SeekEntryResult!6178)

(assert (=> b!594227 (= lt!269645 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269637 lt!269647 mask!3053))))

(declare-fun e!339492 () Bool)

(assert (=> b!594227 e!339492))

(declare-fun res!380326 () Bool)

(assert (=> b!594227 (=> (not res!380326) (not e!339492))))

(declare-fun lt!269644 () (_ BitVec 32))

(declare-fun lt!269639 () SeekEntryResult!6178)

(assert (=> b!594227 (= res!380326 (= lt!269639 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269644 vacantSpotIndex!68 lt!269637 lt!269647 mask!3053)))))

(assert (=> b!594227 (= lt!269639 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269644 vacantSpotIndex!68 (select (arr!17741 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594227 (= lt!269637 (select (store (arr!17741 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269640 () Unit!18624)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36954 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18624)

(assert (=> b!594227 (= lt!269640 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269644 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594227 (= lt!269644 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594228 () Bool)

(assert (=> b!594228 (= e!339489 e!339497)))

(declare-fun res!380324 () Bool)

(assert (=> b!594228 (=> res!380324 e!339497)))

(declare-fun lt!269643 () (_ BitVec 64))

(assert (=> b!594228 (= res!380324 (or (not (= (select (arr!17741 a!2986) j!136) lt!269637)) (not (= (select (arr!17741 a!2986) j!136) lt!269643)) (bvsge j!136 index!984)))))

(declare-fun e!339487 () Bool)

(assert (=> b!594228 e!339487))

(declare-fun res!380317 () Bool)

(assert (=> b!594228 (=> (not res!380317) (not e!339487))))

(assert (=> b!594228 (= res!380317 (= lt!269643 (select (arr!17741 a!2986) j!136)))))

(assert (=> b!594228 (= lt!269643 (select (store (arr!17741 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!380315 () Bool)

(assert (=> start!54480 (=> (not res!380315) (not e!339495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54480 (= res!380315 (validMask!0 mask!3053))))

(assert (=> start!54480 e!339495))

(assert (=> start!54480 true))

(declare-fun array_inv!13624 (array!36954) Bool)

(assert (=> start!54480 (array_inv!13624 a!2986)))

(declare-fun b!594214 () Bool)

(assert (=> b!594214 (= e!339488 e!339496)))

(declare-fun res!380325 () Bool)

(assert (=> b!594214 (=> (not res!380325) (not e!339496))))

(declare-fun lt!269641 () SeekEntryResult!6178)

(assert (=> b!594214 (= res!380325 (and (= lt!269641 (Found!6178 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17741 a!2986) index!984) (select (arr!17741 a!2986) j!136))) (not (= (select (arr!17741 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!594214 (= lt!269641 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17741 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594229 () Bool)

(declare-fun e!339494 () Bool)

(assert (=> b!594229 (= e!339494 e!339491)))

(declare-fun res!380329 () Bool)

(assert (=> b!594229 (=> (not res!380329) (not e!339491))))

(assert (=> b!594229 (= res!380329 (arrayContainsKey!0 lt!269647 (select (arr!17741 a!2986) j!136) j!136))))

(declare-fun b!594230 () Bool)

(assert (=> b!594230 (= e!339492 (= lt!269641 lt!269639))))

(declare-fun b!594231 () Bool)

(declare-fun res!380314 () Bool)

(assert (=> b!594231 (=> (not res!380314) (not e!339490))))

(declare-fun arrayNoDuplicates!0 (array!36954 (_ BitVec 32) List!11821) Bool)

(assert (=> b!594231 (= res!380314 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11818))))

(declare-fun b!594232 () Bool)

(assert (=> b!594232 (= e!339487 e!339494)))

(declare-fun res!380316 () Bool)

(assert (=> b!594232 (=> res!380316 e!339494)))

(assert (=> b!594232 (= res!380316 (or (not (= (select (arr!17741 a!2986) j!136) lt!269637)) (not (= (select (arr!17741 a!2986) j!136) lt!269643)) (bvsge j!136 index!984)))))

(assert (= (and start!54480 res!380315) b!594212))

(assert (= (and b!594212 res!380322) b!594218))

(assert (= (and b!594218 res!380328) b!594222))

(assert (= (and b!594222 res!380311) b!594225))

(assert (= (and b!594225 res!380330) b!594220))

(assert (= (and b!594220 res!380327) b!594226))

(assert (= (and b!594226 res!380321) b!594231))

(assert (= (and b!594231 res!380314) b!594211))

(assert (= (and b!594211 res!380318) b!594216))

(assert (= (and b!594216 res!380320) b!594214))

(assert (= (and b!594214 res!380325) b!594227))

(assert (= (and b!594227 res!380326) b!594230))

(assert (= (and b!594227 c!67317) b!594217))

(assert (= (and b!594227 (not c!67317)) b!594223))

(assert (= (and b!594227 (not res!380313)) b!594228))

(assert (= (and b!594228 res!380317) b!594232))

(assert (= (and b!594232 (not res!380316)) b!594229))

(assert (= (and b!594229 res!380329) b!594219))

(assert (= (and b!594228 (not res!380324)) b!594224))

(assert (= (and b!594224 (not res!380310)) b!594215))

(assert (= (and b!594215 (not res!380312)) b!594221))

(assert (= (and b!594221 (not res!380323)) b!594210))

(assert (= (and b!594210 (not res!380319)) b!594213))

(declare-fun m!571513 () Bool)

(assert (=> b!594219 m!571513))

(assert (=> b!594219 m!571513))

(declare-fun m!571515 () Bool)

(assert (=> b!594219 m!571515))

(declare-fun m!571517 () Bool)

(assert (=> b!594215 m!571517))

(declare-fun m!571519 () Bool)

(assert (=> b!594226 m!571519))

(declare-fun m!571521 () Bool)

(assert (=> b!594225 m!571521))

(assert (=> b!594229 m!571513))

(assert (=> b!594229 m!571513))

(declare-fun m!571523 () Bool)

(assert (=> b!594229 m!571523))

(declare-fun m!571525 () Bool)

(assert (=> b!594216 m!571525))

(declare-fun m!571527 () Bool)

(assert (=> b!594216 m!571527))

(assert (=> b!594218 m!571513))

(assert (=> b!594218 m!571513))

(declare-fun m!571529 () Bool)

(assert (=> b!594218 m!571529))

(assert (=> b!594232 m!571513))

(declare-fun m!571531 () Bool)

(assert (=> b!594220 m!571531))

(declare-fun m!571533 () Bool)

(assert (=> b!594214 m!571533))

(assert (=> b!594214 m!571513))

(assert (=> b!594214 m!571513))

(declare-fun m!571535 () Bool)

(assert (=> b!594214 m!571535))

(assert (=> b!594224 m!571513))

(assert (=> b!594224 m!571513))

(declare-fun m!571537 () Bool)

(assert (=> b!594224 m!571537))

(assert (=> b!594224 m!571513))

(declare-fun m!571539 () Bool)

(assert (=> b!594224 m!571539))

(declare-fun m!571541 () Bool)

(assert (=> b!594222 m!571541))

(assert (=> b!594228 m!571513))

(assert (=> b!594228 m!571525))

(declare-fun m!571543 () Bool)

(assert (=> b!594228 m!571543))

(declare-fun m!571545 () Bool)

(assert (=> b!594227 m!571545))

(declare-fun m!571547 () Bool)

(assert (=> b!594227 m!571547))

(assert (=> b!594227 m!571513))

(assert (=> b!594227 m!571513))

(declare-fun m!571549 () Bool)

(assert (=> b!594227 m!571549))

(assert (=> b!594227 m!571525))

(declare-fun m!571551 () Bool)

(assert (=> b!594227 m!571551))

(declare-fun m!571553 () Bool)

(assert (=> b!594227 m!571553))

(declare-fun m!571555 () Bool)

(assert (=> b!594227 m!571555))

(declare-fun m!571557 () Bool)

(assert (=> b!594213 m!571557))

(declare-fun m!571559 () Bool)

(assert (=> b!594231 m!571559))

(declare-fun m!571561 () Bool)

(assert (=> start!54480 m!571561))

(declare-fun m!571563 () Bool)

(assert (=> start!54480 m!571563))

(declare-fun m!571565 () Bool)

(assert (=> b!594210 m!571565))

(declare-fun m!571567 () Bool)

(assert (=> b!594211 m!571567))

(declare-fun m!571569 () Bool)

(assert (=> b!594221 m!571569))

(check-sat (not b!594226) (not b!594219) (not b!594221) (not b!594214) (not b!594222) (not b!594225) (not start!54480) (not b!594229) (not b!594213) (not b!594215) (not b!594227) (not b!594224) (not b!594220) (not b!594218) (not b!594210) (not b!594231))
(check-sat)
