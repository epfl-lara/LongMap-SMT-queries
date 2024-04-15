; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58538 () Bool)

(assert start!58538)

(declare-fun b!646303 () Bool)

(declare-fun res!418852 () Bool)

(declare-fun e!370476 () Bool)

(assert (=> b!646303 (=> (not res!418852) (not e!370476))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646303 (= res!418852 (validKeyInArray!0 k0!1786))))

(declare-fun b!646304 () Bool)

(declare-fun e!370468 () Bool)

(assert (=> b!646304 (= e!370476 e!370468)))

(declare-fun res!418866 () Bool)

(assert (=> b!646304 (=> (not res!418866) (not e!370468))))

(declare-datatypes ((SeekEntryResult!6889 0))(
  ( (MissingZero!6889 (index!29894 (_ BitVec 32))) (Found!6889 (index!29895 (_ BitVec 32))) (Intermediate!6889 (undefined!7701 Bool) (index!29896 (_ BitVec 32)) (x!58678 (_ BitVec 32))) (Undefined!6889) (MissingVacant!6889 (index!29897 (_ BitVec 32))) )
))
(declare-fun lt!299760 () SeekEntryResult!6889)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!646304 (= res!418866 (or (= lt!299760 (MissingZero!6889 i!1108)) (= lt!299760 (MissingVacant!6889 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!38484 0))(
  ( (array!38485 (arr!18452 (Array (_ BitVec 32) (_ BitVec 64))) (size!18817 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38484)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38484 (_ BitVec 32)) SeekEntryResult!6889)

(assert (=> b!646304 (= lt!299760 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!646305 () Bool)

(declare-datatypes ((Unit!21962 0))(
  ( (Unit!21963) )
))
(declare-fun e!370466 () Unit!21962)

(declare-fun Unit!21964 () Unit!21962)

(assert (=> b!646305 (= e!370466 Unit!21964)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!299762 () array!38484)

(declare-fun lt!299774 () Unit!21962)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21962)

(assert (=> b!646305 (= lt!299774 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299762 (select (arr!18452 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646305 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299773 () Unit!21962)

(declare-datatypes ((List!12532 0))(
  ( (Nil!12529) (Cons!12528 (h!13573 (_ BitVec 64)) (t!18751 List!12532)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12532) Unit!21962)

(assert (=> b!646305 (= lt!299773 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12529))))

(declare-fun arrayNoDuplicates!0 (array!38484 (_ BitVec 32) List!12532) Bool)

(assert (=> b!646305 (arrayNoDuplicates!0 lt!299762 #b00000000000000000000000000000000 Nil!12529)))

(declare-fun lt!299765 () Unit!21962)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38484 (_ BitVec 32) (_ BitVec 32)) Unit!21962)

(assert (=> b!646305 (= lt!299765 (lemmaNoDuplicateFromThenFromBigger!0 lt!299762 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646305 (arrayNoDuplicates!0 lt!299762 j!136 Nil!12529)))

(declare-fun lt!299763 () Unit!21962)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38484 (_ BitVec 64) (_ BitVec 32) List!12532) Unit!21962)

(assert (=> b!646305 (= lt!299763 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299762 (select (arr!18452 a!2986) j!136) j!136 Nil!12529))))

(assert (=> b!646305 false))

(declare-fun b!646306 () Bool)

(declare-fun e!370465 () Bool)

(assert (=> b!646306 (= e!370468 e!370465)))

(declare-fun res!418855 () Bool)

(assert (=> b!646306 (=> (not res!418855) (not e!370465))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!646306 (= res!418855 (= (select (store (arr!18452 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646306 (= lt!299762 (array!38485 (store (arr!18452 a!2986) i!1108 k0!1786) (size!18817 a!2986)))))

(declare-fun b!646307 () Bool)

(declare-fun Unit!21965 () Unit!21962)

(assert (=> b!646307 (= e!370466 Unit!21965)))

(declare-fun b!646308 () Bool)

(declare-fun e!370475 () Bool)

(declare-fun noDuplicate!416 (List!12532) Bool)

(assert (=> b!646308 (= e!370475 (noDuplicate!416 Nil!12529))))

(declare-fun b!646309 () Bool)

(declare-fun e!370464 () Bool)

(assert (=> b!646309 (= e!370464 e!370475)))

(declare-fun res!418854 () Bool)

(assert (=> b!646309 (=> res!418854 e!370475)))

(assert (=> b!646309 (= res!418854 (or (bvsge (size!18817 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18817 a!2986))))))

(assert (=> b!646309 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299775 () Unit!21962)

(assert (=> b!646309 (= lt!299775 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299762 (select (arr!18452 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370469 () Bool)

(assert (=> b!646309 e!370469))

(declare-fun res!418862 () Bool)

(assert (=> b!646309 (=> (not res!418862) (not e!370469))))

(assert (=> b!646309 (= res!418862 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) j!136))))

(declare-fun b!646310 () Bool)

(declare-fun res!418860 () Bool)

(assert (=> b!646310 (=> (not res!418860) (not e!370476))))

(assert (=> b!646310 (= res!418860 (and (= (size!18817 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18817 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18817 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646311 () Bool)

(assert (=> b!646311 (= e!370469 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) index!984))))

(declare-fun b!646312 () Bool)

(declare-fun e!370474 () Unit!21962)

(declare-fun Unit!21966 () Unit!21962)

(assert (=> b!646312 (= e!370474 Unit!21966)))

(assert (=> b!646312 false))

(declare-fun b!646313 () Bool)

(declare-fun Unit!21967 () Unit!21962)

(assert (=> b!646313 (= e!370474 Unit!21967)))

(declare-fun res!418861 () Bool)

(assert (=> start!58538 (=> (not res!418861) (not e!370476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58538 (= res!418861 (validMask!0 mask!3053))))

(assert (=> start!58538 e!370476))

(assert (=> start!58538 true))

(declare-fun array_inv!14335 (array!38484) Bool)

(assert (=> start!58538 (array_inv!14335 a!2986)))

(declare-fun b!646314 () Bool)

(declare-fun e!370471 () Bool)

(declare-fun e!370467 () Bool)

(assert (=> b!646314 (= e!370471 (not e!370467))))

(declare-fun res!418851 () Bool)

(assert (=> b!646314 (=> res!418851 e!370467)))

(declare-fun lt!299772 () SeekEntryResult!6889)

(assert (=> b!646314 (= res!418851 (not (= lt!299772 (Found!6889 index!984))))))

(declare-fun lt!299767 () Unit!21962)

(assert (=> b!646314 (= lt!299767 e!370474)))

(declare-fun c!74093 () Bool)

(assert (=> b!646314 (= c!74093 (= lt!299772 Undefined!6889))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!299771 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38484 (_ BitVec 32)) SeekEntryResult!6889)

(assert (=> b!646314 (= lt!299772 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299771 lt!299762 mask!3053))))

(declare-fun e!370463 () Bool)

(assert (=> b!646314 e!370463))

(declare-fun res!418870 () Bool)

(assert (=> b!646314 (=> (not res!418870) (not e!370463))))

(declare-fun lt!299770 () SeekEntryResult!6889)

(declare-fun lt!299761 () (_ BitVec 32))

(assert (=> b!646314 (= res!418870 (= lt!299770 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299761 vacantSpotIndex!68 lt!299771 lt!299762 mask!3053)))))

(assert (=> b!646314 (= lt!299770 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299761 vacantSpotIndex!68 (select (arr!18452 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646314 (= lt!299771 (select (store (arr!18452 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299769 () Unit!21962)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21962)

(assert (=> b!646314 (= lt!299769 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299761 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646314 (= lt!299761 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!646315 () Bool)

(declare-fun e!370470 () Bool)

(assert (=> b!646315 (= e!370467 e!370470)))

(declare-fun res!418856 () Bool)

(assert (=> b!646315 (=> res!418856 e!370470)))

(declare-fun lt!299764 () (_ BitVec 64))

(assert (=> b!646315 (= res!418856 (or (not (= (select (arr!18452 a!2986) j!136) lt!299771)) (not (= (select (arr!18452 a!2986) j!136) lt!299764))))))

(declare-fun e!370477 () Bool)

(assert (=> b!646315 e!370477))

(declare-fun res!418865 () Bool)

(assert (=> b!646315 (=> (not res!418865) (not e!370477))))

(assert (=> b!646315 (= res!418865 (= lt!299764 (select (arr!18452 a!2986) j!136)))))

(assert (=> b!646315 (= lt!299764 (select (store (arr!18452 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!646316 () Bool)

(assert (=> b!646316 (= e!370465 e!370471)))

(declare-fun res!418859 () Bool)

(assert (=> b!646316 (=> (not res!418859) (not e!370471))))

(declare-fun lt!299768 () SeekEntryResult!6889)

(assert (=> b!646316 (= res!418859 (and (= lt!299768 (Found!6889 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18452 a!2986) index!984) (select (arr!18452 a!2986) j!136))) (not (= (select (arr!18452 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646316 (= lt!299768 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18452 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646317 () Bool)

(declare-fun res!418858 () Bool)

(assert (=> b!646317 (=> (not res!418858) (not e!370476))))

(assert (=> b!646317 (= res!418858 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646318 () Bool)

(assert (=> b!646318 (= e!370463 (= lt!299768 lt!299770))))

(declare-fun b!646319 () Bool)

(declare-fun res!418869 () Bool)

(assert (=> b!646319 (=> (not res!418869) (not e!370476))))

(assert (=> b!646319 (= res!418869 (validKeyInArray!0 (select (arr!18452 a!2986) j!136)))))

(declare-fun b!646320 () Bool)

(declare-fun e!370473 () Bool)

(assert (=> b!646320 (= e!370477 e!370473)))

(declare-fun res!418867 () Bool)

(assert (=> b!646320 (=> res!418867 e!370473)))

(assert (=> b!646320 (= res!418867 (or (not (= (select (arr!18452 a!2986) j!136) lt!299771)) (not (= (select (arr!18452 a!2986) j!136) lt!299764)) (bvsge j!136 index!984)))))

(declare-fun b!646321 () Bool)

(declare-fun e!370478 () Bool)

(assert (=> b!646321 (= e!370473 e!370478)))

(declare-fun res!418863 () Bool)

(assert (=> b!646321 (=> (not res!418863) (not e!370478))))

(assert (=> b!646321 (= res!418863 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) j!136))))

(declare-fun b!646322 () Bool)

(declare-fun res!418868 () Bool)

(assert (=> b!646322 (=> (not res!418868) (not e!370468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38484 (_ BitVec 32)) Bool)

(assert (=> b!646322 (= res!418868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646323 () Bool)

(assert (=> b!646323 (= e!370478 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) index!984))))

(declare-fun b!646324 () Bool)

(declare-fun res!418857 () Bool)

(assert (=> b!646324 (=> (not res!418857) (not e!370468))))

(assert (=> b!646324 (= res!418857 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12529))))

(declare-fun b!646325 () Bool)

(declare-fun res!418853 () Bool)

(assert (=> b!646325 (=> (not res!418853) (not e!370468))))

(assert (=> b!646325 (= res!418853 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18452 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646326 () Bool)

(assert (=> b!646326 (= e!370470 e!370464)))

(declare-fun res!418864 () Bool)

(assert (=> b!646326 (=> res!418864 e!370464)))

(assert (=> b!646326 (= res!418864 (bvsge index!984 j!136))))

(declare-fun lt!299766 () Unit!21962)

(assert (=> b!646326 (= lt!299766 e!370466)))

(declare-fun c!74094 () Bool)

(assert (=> b!646326 (= c!74094 (bvslt j!136 index!984))))

(assert (= (and start!58538 res!418861) b!646310))

(assert (= (and b!646310 res!418860) b!646319))

(assert (= (and b!646319 res!418869) b!646303))

(assert (= (and b!646303 res!418852) b!646317))

(assert (= (and b!646317 res!418858) b!646304))

(assert (= (and b!646304 res!418866) b!646322))

(assert (= (and b!646322 res!418868) b!646324))

(assert (= (and b!646324 res!418857) b!646325))

(assert (= (and b!646325 res!418853) b!646306))

(assert (= (and b!646306 res!418855) b!646316))

(assert (= (and b!646316 res!418859) b!646314))

(assert (= (and b!646314 res!418870) b!646318))

(assert (= (and b!646314 c!74093) b!646312))

(assert (= (and b!646314 (not c!74093)) b!646313))

(assert (= (and b!646314 (not res!418851)) b!646315))

(assert (= (and b!646315 res!418865) b!646320))

(assert (= (and b!646320 (not res!418867)) b!646321))

(assert (= (and b!646321 res!418863) b!646323))

(assert (= (and b!646315 (not res!418856)) b!646326))

(assert (= (and b!646326 c!74094) b!646305))

(assert (= (and b!646326 (not c!74094)) b!646307))

(assert (= (and b!646326 (not res!418864)) b!646309))

(assert (= (and b!646309 res!418862) b!646311))

(assert (= (and b!646309 (not res!418854)) b!646308))

(declare-fun m!619269 () Bool)

(assert (=> b!646303 m!619269))

(declare-fun m!619271 () Bool)

(assert (=> b!646317 m!619271))

(declare-fun m!619273 () Bool)

(assert (=> b!646311 m!619273))

(assert (=> b!646311 m!619273))

(declare-fun m!619275 () Bool)

(assert (=> b!646311 m!619275))

(assert (=> b!646320 m!619273))

(declare-fun m!619277 () Bool)

(assert (=> b!646304 m!619277))

(declare-fun m!619279 () Bool)

(assert (=> b!646306 m!619279))

(declare-fun m!619281 () Bool)

(assert (=> b!646306 m!619281))

(declare-fun m!619283 () Bool)

(assert (=> b!646324 m!619283))

(declare-fun m!619285 () Bool)

(assert (=> b!646325 m!619285))

(assert (=> b!646305 m!619273))

(declare-fun m!619287 () Bool)

(assert (=> b!646305 m!619287))

(assert (=> b!646305 m!619273))

(declare-fun m!619289 () Bool)

(assert (=> b!646305 m!619289))

(assert (=> b!646305 m!619273))

(declare-fun m!619291 () Bool)

(assert (=> b!646305 m!619291))

(declare-fun m!619293 () Bool)

(assert (=> b!646305 m!619293))

(assert (=> b!646305 m!619273))

(declare-fun m!619295 () Bool)

(assert (=> b!646305 m!619295))

(declare-fun m!619297 () Bool)

(assert (=> b!646305 m!619297))

(declare-fun m!619299 () Bool)

(assert (=> b!646305 m!619299))

(assert (=> b!646319 m!619273))

(assert (=> b!646319 m!619273))

(declare-fun m!619301 () Bool)

(assert (=> b!646319 m!619301))

(assert (=> b!646315 m!619273))

(assert (=> b!646315 m!619279))

(declare-fun m!619303 () Bool)

(assert (=> b!646315 m!619303))

(declare-fun m!619305 () Bool)

(assert (=> b!646316 m!619305))

(assert (=> b!646316 m!619273))

(assert (=> b!646316 m!619273))

(declare-fun m!619307 () Bool)

(assert (=> b!646316 m!619307))

(assert (=> b!646323 m!619273))

(assert (=> b!646323 m!619273))

(assert (=> b!646323 m!619275))

(declare-fun m!619309 () Bool)

(assert (=> b!646322 m!619309))

(declare-fun m!619311 () Bool)

(assert (=> b!646308 m!619311))

(declare-fun m!619313 () Bool)

(assert (=> b!646314 m!619313))

(declare-fun m!619315 () Bool)

(assert (=> b!646314 m!619315))

(assert (=> b!646314 m!619273))

(declare-fun m!619317 () Bool)

(assert (=> b!646314 m!619317))

(declare-fun m!619319 () Bool)

(assert (=> b!646314 m!619319))

(assert (=> b!646314 m!619279))

(declare-fun m!619321 () Bool)

(assert (=> b!646314 m!619321))

(assert (=> b!646314 m!619273))

(declare-fun m!619323 () Bool)

(assert (=> b!646314 m!619323))

(declare-fun m!619325 () Bool)

(assert (=> start!58538 m!619325))

(declare-fun m!619327 () Bool)

(assert (=> start!58538 m!619327))

(assert (=> b!646321 m!619273))

(assert (=> b!646321 m!619273))

(declare-fun m!619329 () Bool)

(assert (=> b!646321 m!619329))

(assert (=> b!646309 m!619273))

(assert (=> b!646309 m!619273))

(declare-fun m!619331 () Bool)

(assert (=> b!646309 m!619331))

(assert (=> b!646309 m!619273))

(declare-fun m!619333 () Bool)

(assert (=> b!646309 m!619333))

(assert (=> b!646309 m!619273))

(assert (=> b!646309 m!619329))

(check-sat (not start!58538) (not b!646324) (not b!646308) (not b!646322) (not b!646311) (not b!646303) (not b!646316) (not b!646304) (not b!646309) (not b!646317) (not b!646321) (not b!646323) (not b!646305) (not b!646319) (not b!646314))
(check-sat)
(get-model)

(declare-fun b!646481 () Bool)

(declare-fun e!370585 () Bool)

(declare-fun call!33631 () Bool)

(assert (=> b!646481 (= e!370585 call!33631)))

(declare-fun b!646482 () Bool)

(declare-fun e!370584 () Bool)

(declare-fun contains!3133 (List!12532 (_ BitVec 64)) Bool)

(assert (=> b!646482 (= e!370584 (contains!3133 Nil!12529 (select (arr!18452 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!646483 () Bool)

(declare-fun e!370586 () Bool)

(declare-fun e!370583 () Bool)

(assert (=> b!646483 (= e!370586 e!370583)))

(declare-fun res!418999 () Bool)

(assert (=> b!646483 (=> (not res!418999) (not e!370583))))

(assert (=> b!646483 (= res!418999 (not e!370584))))

(declare-fun res!418998 () Bool)

(assert (=> b!646483 (=> (not res!418998) (not e!370584))))

(assert (=> b!646483 (= res!418998 (validKeyInArray!0 (select (arr!18452 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33628 () Bool)

(declare-fun c!74109 () Bool)

(assert (=> bm!33628 (= call!33631 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74109 (Cons!12528 (select (arr!18452 a!2986) #b00000000000000000000000000000000) Nil!12529) Nil!12529)))))

(declare-fun b!646484 () Bool)

(assert (=> b!646484 (= e!370583 e!370585)))

(assert (=> b!646484 (= c!74109 (validKeyInArray!0 (select (arr!18452 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91157 () Bool)

(declare-fun res!418997 () Bool)

(assert (=> d!91157 (=> res!418997 e!370586)))

(assert (=> d!91157 (= res!418997 (bvsge #b00000000000000000000000000000000 (size!18817 a!2986)))))

(assert (=> d!91157 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12529) e!370586)))

(declare-fun b!646485 () Bool)

(assert (=> b!646485 (= e!370585 call!33631)))

(assert (= (and d!91157 (not res!418997)) b!646483))

(assert (= (and b!646483 res!418998) b!646482))

(assert (= (and b!646483 res!418999) b!646484))

(assert (= (and b!646484 c!74109) b!646481))

(assert (= (and b!646484 (not c!74109)) b!646485))

(assert (= (or b!646481 b!646485) bm!33628))

(declare-fun m!619467 () Bool)

(assert (=> b!646482 m!619467))

(assert (=> b!646482 m!619467))

(declare-fun m!619469 () Bool)

(assert (=> b!646482 m!619469))

(assert (=> b!646483 m!619467))

(assert (=> b!646483 m!619467))

(declare-fun m!619471 () Bool)

(assert (=> b!646483 m!619471))

(assert (=> bm!33628 m!619467))

(declare-fun m!619473 () Bool)

(assert (=> bm!33628 m!619473))

(assert (=> b!646484 m!619467))

(assert (=> b!646484 m!619467))

(assert (=> b!646484 m!619471))

(assert (=> b!646324 d!91157))

(declare-fun d!91159 () Bool)

(assert (=> d!91159 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!646303 d!91159))

(declare-fun b!646498 () Bool)

(declare-fun e!370593 () SeekEntryResult!6889)

(declare-fun e!370595 () SeekEntryResult!6889)

(assert (=> b!646498 (= e!370593 e!370595)))

(declare-fun c!74118 () Bool)

(declare-fun lt!299877 () (_ BitVec 64))

(assert (=> b!646498 (= c!74118 (= lt!299877 lt!299771))))

(declare-fun b!646499 () Bool)

(declare-fun c!74116 () Bool)

(assert (=> b!646499 (= c!74116 (= lt!299877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370594 () SeekEntryResult!6889)

(assert (=> b!646499 (= e!370595 e!370594)))

(declare-fun b!646500 () Bool)

(assert (=> b!646500 (= e!370594 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299761 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!299771 lt!299762 mask!3053))))

(declare-fun lt!299876 () SeekEntryResult!6889)

(declare-fun d!91161 () Bool)

(get-info :version)

(assert (=> d!91161 (and (or ((_ is Undefined!6889) lt!299876) (not ((_ is Found!6889) lt!299876)) (and (bvsge (index!29895 lt!299876) #b00000000000000000000000000000000) (bvslt (index!29895 lt!299876) (size!18817 lt!299762)))) (or ((_ is Undefined!6889) lt!299876) ((_ is Found!6889) lt!299876) (not ((_ is MissingVacant!6889) lt!299876)) (not (= (index!29897 lt!299876) vacantSpotIndex!68)) (and (bvsge (index!29897 lt!299876) #b00000000000000000000000000000000) (bvslt (index!29897 lt!299876) (size!18817 lt!299762)))) (or ((_ is Undefined!6889) lt!299876) (ite ((_ is Found!6889) lt!299876) (= (select (arr!18452 lt!299762) (index!29895 lt!299876)) lt!299771) (and ((_ is MissingVacant!6889) lt!299876) (= (index!29897 lt!299876) vacantSpotIndex!68) (= (select (arr!18452 lt!299762) (index!29897 lt!299876)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91161 (= lt!299876 e!370593)))

(declare-fun c!74117 () Bool)

(assert (=> d!91161 (= c!74117 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91161 (= lt!299877 (select (arr!18452 lt!299762) lt!299761))))

(assert (=> d!91161 (validMask!0 mask!3053)))

(assert (=> d!91161 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299761 vacantSpotIndex!68 lt!299771 lt!299762 mask!3053) lt!299876)))

(declare-fun b!646501 () Bool)

(assert (=> b!646501 (= e!370595 (Found!6889 lt!299761))))

(declare-fun b!646502 () Bool)

(assert (=> b!646502 (= e!370594 (MissingVacant!6889 vacantSpotIndex!68))))

(declare-fun b!646503 () Bool)

(assert (=> b!646503 (= e!370593 Undefined!6889)))

(assert (= (and d!91161 c!74117) b!646503))

(assert (= (and d!91161 (not c!74117)) b!646498))

(assert (= (and b!646498 c!74118) b!646501))

(assert (= (and b!646498 (not c!74118)) b!646499))

(assert (= (and b!646499 c!74116) b!646502))

(assert (= (and b!646499 (not c!74116)) b!646500))

(declare-fun m!619475 () Bool)

(assert (=> b!646500 m!619475))

(assert (=> b!646500 m!619475))

(declare-fun m!619477 () Bool)

(assert (=> b!646500 m!619477))

(declare-fun m!619479 () Bool)

(assert (=> d!91161 m!619479))

(declare-fun m!619481 () Bool)

(assert (=> d!91161 m!619481))

(declare-fun m!619483 () Bool)

(assert (=> d!91161 m!619483))

(assert (=> d!91161 m!619325))

(assert (=> b!646314 d!91161))

(declare-fun b!646504 () Bool)

(declare-fun e!370596 () SeekEntryResult!6889)

(declare-fun e!370598 () SeekEntryResult!6889)

(assert (=> b!646504 (= e!370596 e!370598)))

(declare-fun c!74121 () Bool)

(declare-fun lt!299879 () (_ BitVec 64))

(assert (=> b!646504 (= c!74121 (= lt!299879 lt!299771))))

(declare-fun b!646505 () Bool)

(declare-fun c!74119 () Bool)

(assert (=> b!646505 (= c!74119 (= lt!299879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370597 () SeekEntryResult!6889)

(assert (=> b!646505 (= e!370598 e!370597)))

(declare-fun b!646506 () Bool)

(assert (=> b!646506 (= e!370597 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!299771 lt!299762 mask!3053))))

(declare-fun lt!299878 () SeekEntryResult!6889)

(declare-fun d!91163 () Bool)

(assert (=> d!91163 (and (or ((_ is Undefined!6889) lt!299878) (not ((_ is Found!6889) lt!299878)) (and (bvsge (index!29895 lt!299878) #b00000000000000000000000000000000) (bvslt (index!29895 lt!299878) (size!18817 lt!299762)))) (or ((_ is Undefined!6889) lt!299878) ((_ is Found!6889) lt!299878) (not ((_ is MissingVacant!6889) lt!299878)) (not (= (index!29897 lt!299878) vacantSpotIndex!68)) (and (bvsge (index!29897 lt!299878) #b00000000000000000000000000000000) (bvslt (index!29897 lt!299878) (size!18817 lt!299762)))) (or ((_ is Undefined!6889) lt!299878) (ite ((_ is Found!6889) lt!299878) (= (select (arr!18452 lt!299762) (index!29895 lt!299878)) lt!299771) (and ((_ is MissingVacant!6889) lt!299878) (= (index!29897 lt!299878) vacantSpotIndex!68) (= (select (arr!18452 lt!299762) (index!29897 lt!299878)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91163 (= lt!299878 e!370596)))

(declare-fun c!74120 () Bool)

(assert (=> d!91163 (= c!74120 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91163 (= lt!299879 (select (arr!18452 lt!299762) index!984))))

(assert (=> d!91163 (validMask!0 mask!3053)))

(assert (=> d!91163 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299771 lt!299762 mask!3053) lt!299878)))

(declare-fun b!646507 () Bool)

(assert (=> b!646507 (= e!370598 (Found!6889 index!984))))

(declare-fun b!646508 () Bool)

(assert (=> b!646508 (= e!370597 (MissingVacant!6889 vacantSpotIndex!68))))

(declare-fun b!646509 () Bool)

(assert (=> b!646509 (= e!370596 Undefined!6889)))

(assert (= (and d!91163 c!74120) b!646509))

(assert (= (and d!91163 (not c!74120)) b!646504))

(assert (= (and b!646504 c!74121) b!646507))

(assert (= (and b!646504 (not c!74121)) b!646505))

(assert (= (and b!646505 c!74119) b!646508))

(assert (= (and b!646505 (not c!74119)) b!646506))

(assert (=> b!646506 m!619313))

(assert (=> b!646506 m!619313))

(declare-fun m!619485 () Bool)

(assert (=> b!646506 m!619485))

(declare-fun m!619487 () Bool)

(assert (=> d!91163 m!619487))

(declare-fun m!619489 () Bool)

(assert (=> d!91163 m!619489))

(declare-fun m!619491 () Bool)

(assert (=> d!91163 m!619491))

(assert (=> d!91163 m!619325))

(assert (=> b!646314 d!91163))

(declare-fun b!646510 () Bool)

(declare-fun e!370599 () SeekEntryResult!6889)

(declare-fun e!370601 () SeekEntryResult!6889)

(assert (=> b!646510 (= e!370599 e!370601)))

(declare-fun c!74124 () Bool)

(declare-fun lt!299881 () (_ BitVec 64))

(assert (=> b!646510 (= c!74124 (= lt!299881 (select (arr!18452 a!2986) j!136)))))

(declare-fun b!646511 () Bool)

(declare-fun c!74122 () Bool)

(assert (=> b!646511 (= c!74122 (= lt!299881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370600 () SeekEntryResult!6889)

(assert (=> b!646511 (= e!370601 e!370600)))

(declare-fun b!646512 () Bool)

(assert (=> b!646512 (= e!370600 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299761 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18452 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!299880 () SeekEntryResult!6889)

(declare-fun d!91165 () Bool)

(assert (=> d!91165 (and (or ((_ is Undefined!6889) lt!299880) (not ((_ is Found!6889) lt!299880)) (and (bvsge (index!29895 lt!299880) #b00000000000000000000000000000000) (bvslt (index!29895 lt!299880) (size!18817 a!2986)))) (or ((_ is Undefined!6889) lt!299880) ((_ is Found!6889) lt!299880) (not ((_ is MissingVacant!6889) lt!299880)) (not (= (index!29897 lt!299880) vacantSpotIndex!68)) (and (bvsge (index!29897 lt!299880) #b00000000000000000000000000000000) (bvslt (index!29897 lt!299880) (size!18817 a!2986)))) (or ((_ is Undefined!6889) lt!299880) (ite ((_ is Found!6889) lt!299880) (= (select (arr!18452 a!2986) (index!29895 lt!299880)) (select (arr!18452 a!2986) j!136)) (and ((_ is MissingVacant!6889) lt!299880) (= (index!29897 lt!299880) vacantSpotIndex!68) (= (select (arr!18452 a!2986) (index!29897 lt!299880)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91165 (= lt!299880 e!370599)))

(declare-fun c!74123 () Bool)

(assert (=> d!91165 (= c!74123 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91165 (= lt!299881 (select (arr!18452 a!2986) lt!299761))))

(assert (=> d!91165 (validMask!0 mask!3053)))

(assert (=> d!91165 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299761 vacantSpotIndex!68 (select (arr!18452 a!2986) j!136) a!2986 mask!3053) lt!299880)))

(declare-fun b!646513 () Bool)

(assert (=> b!646513 (= e!370601 (Found!6889 lt!299761))))

(declare-fun b!646514 () Bool)

(assert (=> b!646514 (= e!370600 (MissingVacant!6889 vacantSpotIndex!68))))

(declare-fun b!646515 () Bool)

(assert (=> b!646515 (= e!370599 Undefined!6889)))

(assert (= (and d!91165 c!74123) b!646515))

(assert (= (and d!91165 (not c!74123)) b!646510))

(assert (= (and b!646510 c!74124) b!646513))

(assert (= (and b!646510 (not c!74124)) b!646511))

(assert (= (and b!646511 c!74122) b!646514))

(assert (= (and b!646511 (not c!74122)) b!646512))

(assert (=> b!646512 m!619475))

(assert (=> b!646512 m!619475))

(assert (=> b!646512 m!619273))

(declare-fun m!619493 () Bool)

(assert (=> b!646512 m!619493))

(declare-fun m!619495 () Bool)

(assert (=> d!91165 m!619495))

(declare-fun m!619497 () Bool)

(assert (=> d!91165 m!619497))

(declare-fun m!619499 () Bool)

(assert (=> d!91165 m!619499))

(assert (=> d!91165 m!619325))

(assert (=> b!646314 d!91165))

(declare-fun d!91167 () Bool)

(declare-fun lt!299884 () (_ BitVec 32))

(assert (=> d!91167 (and (bvsge lt!299884 #b00000000000000000000000000000000) (bvslt lt!299884 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91167 (= lt!299884 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91167 (validMask!0 mask!3053)))

(assert (=> d!91167 (= (nextIndex!0 index!984 x!910 mask!3053) lt!299884)))

(declare-fun bs!19287 () Bool)

(assert (= bs!19287 d!91167))

(declare-fun m!619501 () Bool)

(assert (=> bs!19287 m!619501))

(assert (=> bs!19287 m!619325))

(assert (=> b!646314 d!91167))

(declare-fun d!91169 () Bool)

(declare-fun e!370604 () Bool)

(assert (=> d!91169 e!370604))

(declare-fun res!419002 () Bool)

(assert (=> d!91169 (=> (not res!419002) (not e!370604))))

(assert (=> d!91169 (= res!419002 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18817 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18817 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18817 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18817 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18817 a!2986))))))

(declare-fun lt!299887 () Unit!21962)

(declare-fun choose!9 (array!38484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21962)

(assert (=> d!91169 (= lt!299887 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299761 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91169 (validMask!0 mask!3053)))

(assert (=> d!91169 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299761 vacantSpotIndex!68 mask!3053) lt!299887)))

(declare-fun b!646518 () Bool)

(assert (=> b!646518 (= e!370604 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299761 vacantSpotIndex!68 (select (arr!18452 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299761 vacantSpotIndex!68 (select (store (arr!18452 a!2986) i!1108 k0!1786) j!136) (array!38485 (store (arr!18452 a!2986) i!1108 k0!1786) (size!18817 a!2986)) mask!3053)))))

(assert (= (and d!91169 res!419002) b!646518))

(declare-fun m!619503 () Bool)

(assert (=> d!91169 m!619503))

(assert (=> d!91169 m!619325))

(assert (=> b!646518 m!619279))

(assert (=> b!646518 m!619315))

(assert (=> b!646518 m!619273))

(assert (=> b!646518 m!619323))

(assert (=> b!646518 m!619315))

(declare-fun m!619505 () Bool)

(assert (=> b!646518 m!619505))

(assert (=> b!646518 m!619273))

(assert (=> b!646314 d!91169))

(declare-fun d!91171 () Bool)

(declare-fun res!419007 () Bool)

(declare-fun e!370609 () Bool)

(assert (=> d!91171 (=> res!419007 e!370609)))

(assert (=> d!91171 (= res!419007 (= (select (arr!18452 lt!299762) index!984) (select (arr!18452 a!2986) j!136)))))

(assert (=> d!91171 (= (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) index!984) e!370609)))

(declare-fun b!646523 () Bool)

(declare-fun e!370610 () Bool)

(assert (=> b!646523 (= e!370609 e!370610)))

(declare-fun res!419008 () Bool)

(assert (=> b!646523 (=> (not res!419008) (not e!370610))))

(assert (=> b!646523 (= res!419008 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18817 lt!299762)))))

(declare-fun b!646524 () Bool)

(assert (=> b!646524 (= e!370610 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91171 (not res!419007)) b!646523))

(assert (= (and b!646523 res!419008) b!646524))

(assert (=> d!91171 m!619491))

(assert (=> b!646524 m!619273))

(declare-fun m!619507 () Bool)

(assert (=> b!646524 m!619507))

(assert (=> b!646323 d!91171))

(assert (=> b!646311 d!91171))

(declare-fun bm!33631 () Bool)

(declare-fun call!33634 () Bool)

(assert (=> bm!33631 (= call!33634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!91173 () Bool)

(declare-fun res!419013 () Bool)

(declare-fun e!370619 () Bool)

(assert (=> d!91173 (=> res!419013 e!370619)))

(assert (=> d!91173 (= res!419013 (bvsge #b00000000000000000000000000000000 (size!18817 a!2986)))))

(assert (=> d!91173 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!370619)))

(declare-fun b!646533 () Bool)

(declare-fun e!370618 () Bool)

(assert (=> b!646533 (= e!370618 call!33634)))

(declare-fun b!646534 () Bool)

(declare-fun e!370617 () Bool)

(assert (=> b!646534 (= e!370618 e!370617)))

(declare-fun lt!299895 () (_ BitVec 64))

(assert (=> b!646534 (= lt!299895 (select (arr!18452 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!299896 () Unit!21962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38484 (_ BitVec 64) (_ BitVec 32)) Unit!21962)

(assert (=> b!646534 (= lt!299896 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!299895 #b00000000000000000000000000000000))))

(assert (=> b!646534 (arrayContainsKey!0 a!2986 lt!299895 #b00000000000000000000000000000000)))

(declare-fun lt!299894 () Unit!21962)

(assert (=> b!646534 (= lt!299894 lt!299896)))

(declare-fun res!419014 () Bool)

(assert (=> b!646534 (= res!419014 (= (seekEntryOrOpen!0 (select (arr!18452 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6889 #b00000000000000000000000000000000)))))

(assert (=> b!646534 (=> (not res!419014) (not e!370617))))

(declare-fun b!646535 () Bool)

(assert (=> b!646535 (= e!370617 call!33634)))

(declare-fun b!646536 () Bool)

(assert (=> b!646536 (= e!370619 e!370618)))

(declare-fun c!74127 () Bool)

(assert (=> b!646536 (= c!74127 (validKeyInArray!0 (select (arr!18452 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91173 (not res!419013)) b!646536))

(assert (= (and b!646536 c!74127) b!646534))

(assert (= (and b!646536 (not c!74127)) b!646533))

(assert (= (and b!646534 res!419014) b!646535))

(assert (= (or b!646535 b!646533) bm!33631))

(declare-fun m!619509 () Bool)

(assert (=> bm!33631 m!619509))

(assert (=> b!646534 m!619467))

(declare-fun m!619511 () Bool)

(assert (=> b!646534 m!619511))

(declare-fun m!619513 () Bool)

(assert (=> b!646534 m!619513))

(assert (=> b!646534 m!619467))

(declare-fun m!619515 () Bool)

(assert (=> b!646534 m!619515))

(assert (=> b!646536 m!619467))

(assert (=> b!646536 m!619467))

(assert (=> b!646536 m!619471))

(assert (=> b!646322 d!91173))

(declare-fun d!91177 () Bool)

(declare-fun res!419015 () Bool)

(declare-fun e!370620 () Bool)

(assert (=> d!91177 (=> res!419015 e!370620)))

(assert (=> d!91177 (= res!419015 (= (select (arr!18452 lt!299762) j!136) (select (arr!18452 a!2986) j!136)))))

(assert (=> d!91177 (= (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) j!136) e!370620)))

(declare-fun b!646537 () Bool)

(declare-fun e!370621 () Bool)

(assert (=> b!646537 (= e!370620 e!370621)))

(declare-fun res!419016 () Bool)

(assert (=> b!646537 (=> (not res!419016) (not e!370621))))

(assert (=> b!646537 (= res!419016 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18817 lt!299762)))))

(declare-fun b!646538 () Bool)

(assert (=> b!646538 (= e!370621 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91177 (not res!419015)) b!646537))

(assert (= (and b!646537 res!419016) b!646538))

(declare-fun m!619517 () Bool)

(assert (=> d!91177 m!619517))

(assert (=> b!646538 m!619273))

(declare-fun m!619519 () Bool)

(assert (=> b!646538 m!619519))

(assert (=> b!646321 d!91177))

(declare-fun d!91179 () Bool)

(declare-fun res!419021 () Bool)

(declare-fun e!370626 () Bool)

(assert (=> d!91179 (=> res!419021 e!370626)))

(assert (=> d!91179 (= res!419021 ((_ is Nil!12529) Nil!12529))))

(assert (=> d!91179 (= (noDuplicate!416 Nil!12529) e!370626)))

(declare-fun b!646543 () Bool)

(declare-fun e!370627 () Bool)

(assert (=> b!646543 (= e!370626 e!370627)))

(declare-fun res!419022 () Bool)

(assert (=> b!646543 (=> (not res!419022) (not e!370627))))

(assert (=> b!646543 (= res!419022 (not (contains!3133 (t!18751 Nil!12529) (h!13573 Nil!12529))))))

(declare-fun b!646544 () Bool)

(assert (=> b!646544 (= e!370627 (noDuplicate!416 (t!18751 Nil!12529)))))

(assert (= (and d!91179 (not res!419021)) b!646543))

(assert (= (and b!646543 res!419022) b!646544))

(declare-fun m!619525 () Bool)

(assert (=> b!646543 m!619525))

(declare-fun m!619527 () Bool)

(assert (=> b!646544 m!619527))

(assert (=> b!646308 d!91179))

(declare-fun d!91185 () Bool)

(assert (=> d!91185 (= (validKeyInArray!0 (select (arr!18452 a!2986) j!136)) (and (not (= (select (arr!18452 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18452 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!646319 d!91185))

(declare-fun d!91187 () Bool)

(declare-fun res!419023 () Bool)

(declare-fun e!370628 () Bool)

(assert (=> d!91187 (=> res!419023 e!370628)))

(assert (=> d!91187 (= res!419023 (= (select (arr!18452 lt!299762) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18452 a!2986) j!136)))))

(assert (=> d!91187 (= (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!370628)))

(declare-fun b!646545 () Bool)

(declare-fun e!370629 () Bool)

(assert (=> b!646545 (= e!370628 e!370629)))

(declare-fun res!419024 () Bool)

(assert (=> b!646545 (=> (not res!419024) (not e!370629))))

(assert (=> b!646545 (= res!419024 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18817 lt!299762)))))

(declare-fun b!646546 () Bool)

(assert (=> b!646546 (= e!370629 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91187 (not res!419023)) b!646545))

(assert (= (and b!646545 res!419024) b!646546))

(declare-fun m!619529 () Bool)

(assert (=> d!91187 m!619529))

(assert (=> b!646546 m!619273))

(declare-fun m!619531 () Bool)

(assert (=> b!646546 m!619531))

(assert (=> b!646309 d!91187))

(declare-fun d!91189 () Bool)

(assert (=> d!91189 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299902 () Unit!21962)

(declare-fun choose!114 (array!38484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21962)

(assert (=> d!91189 (= lt!299902 (choose!114 lt!299762 (select (arr!18452 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91189 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91189 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299762 (select (arr!18452 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!299902)))

(declare-fun bs!19289 () Bool)

(assert (= bs!19289 d!91189))

(assert (=> bs!19289 m!619273))

(assert (=> bs!19289 m!619331))

(assert (=> bs!19289 m!619273))

(declare-fun m!619533 () Bool)

(assert (=> bs!19289 m!619533))

(assert (=> b!646309 d!91189))

(assert (=> b!646309 d!91177))

(declare-fun b!646557 () Bool)

(declare-fun e!370638 () SeekEntryResult!6889)

(declare-fun e!370640 () SeekEntryResult!6889)

(assert (=> b!646557 (= e!370638 e!370640)))

(declare-fun lt!299904 () (_ BitVec 64))

(declare-fun c!74132 () Bool)

(assert (=> b!646557 (= c!74132 (= lt!299904 (select (arr!18452 a!2986) j!136)))))

(declare-fun b!646558 () Bool)

(declare-fun c!74130 () Bool)

(assert (=> b!646558 (= c!74130 (= lt!299904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370639 () SeekEntryResult!6889)

(assert (=> b!646558 (= e!370640 e!370639)))

(declare-fun b!646559 () Bool)

(assert (=> b!646559 (= e!370639 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18452 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!299903 () SeekEntryResult!6889)

(declare-fun d!91191 () Bool)

(assert (=> d!91191 (and (or ((_ is Undefined!6889) lt!299903) (not ((_ is Found!6889) lt!299903)) (and (bvsge (index!29895 lt!299903) #b00000000000000000000000000000000) (bvslt (index!29895 lt!299903) (size!18817 a!2986)))) (or ((_ is Undefined!6889) lt!299903) ((_ is Found!6889) lt!299903) (not ((_ is MissingVacant!6889) lt!299903)) (not (= (index!29897 lt!299903) vacantSpotIndex!68)) (and (bvsge (index!29897 lt!299903) #b00000000000000000000000000000000) (bvslt (index!29897 lt!299903) (size!18817 a!2986)))) (or ((_ is Undefined!6889) lt!299903) (ite ((_ is Found!6889) lt!299903) (= (select (arr!18452 a!2986) (index!29895 lt!299903)) (select (arr!18452 a!2986) j!136)) (and ((_ is MissingVacant!6889) lt!299903) (= (index!29897 lt!299903) vacantSpotIndex!68) (= (select (arr!18452 a!2986) (index!29897 lt!299903)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91191 (= lt!299903 e!370638)))

(declare-fun c!74131 () Bool)

(assert (=> d!91191 (= c!74131 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91191 (= lt!299904 (select (arr!18452 a!2986) index!984))))

(assert (=> d!91191 (validMask!0 mask!3053)))

(assert (=> d!91191 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18452 a!2986) j!136) a!2986 mask!3053) lt!299903)))

(declare-fun b!646560 () Bool)

(assert (=> b!646560 (= e!370640 (Found!6889 index!984))))

(declare-fun b!646561 () Bool)

(assert (=> b!646561 (= e!370639 (MissingVacant!6889 vacantSpotIndex!68))))

(declare-fun b!646562 () Bool)

(assert (=> b!646562 (= e!370638 Undefined!6889)))

(assert (= (and d!91191 c!74131) b!646562))

(assert (= (and d!91191 (not c!74131)) b!646557))

(assert (= (and b!646557 c!74132) b!646560))

(assert (= (and b!646557 (not c!74132)) b!646558))

(assert (= (and b!646558 c!74130) b!646561))

(assert (= (and b!646558 (not c!74130)) b!646559))

(assert (=> b!646559 m!619313))

(assert (=> b!646559 m!619313))

(assert (=> b!646559 m!619273))

(declare-fun m!619535 () Bool)

(assert (=> b!646559 m!619535))

(declare-fun m!619537 () Bool)

(assert (=> d!91191 m!619537))

(declare-fun m!619539 () Bool)

(assert (=> d!91191 m!619539))

(assert (=> d!91191 m!619305))

(assert (=> d!91191 m!619325))

(assert (=> b!646316 d!91191))

(declare-fun d!91193 () Bool)

(assert (=> d!91193 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58538 d!91193))

(declare-fun d!91203 () Bool)

(assert (=> d!91203 (= (array_inv!14335 a!2986) (bvsge (size!18817 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58538 d!91203))

(declare-fun d!91207 () Bool)

(declare-fun res!419049 () Bool)

(declare-fun e!370663 () Bool)

(assert (=> d!91207 (=> res!419049 e!370663)))

(assert (=> d!91207 (= res!419049 (= (select (arr!18452 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91207 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!370663)))

(declare-fun b!646589 () Bool)

(declare-fun e!370664 () Bool)

(assert (=> b!646589 (= e!370663 e!370664)))

(declare-fun res!419050 () Bool)

(assert (=> b!646589 (=> (not res!419050) (not e!370664))))

(assert (=> b!646589 (= res!419050 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18817 a!2986)))))

(declare-fun b!646590 () Bool)

(assert (=> b!646590 (= e!370664 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91207 (not res!419049)) b!646589))

(assert (= (and b!646589 res!419050) b!646590))

(assert (=> d!91207 m!619467))

(declare-fun m!619565 () Bool)

(assert (=> b!646590 m!619565))

(assert (=> b!646317 d!91207))

(declare-fun b!646643 () Bool)

(declare-fun e!370703 () SeekEntryResult!6889)

(assert (=> b!646643 (= e!370703 Undefined!6889)))

(declare-fun b!646644 () Bool)

(declare-fun e!370705 () SeekEntryResult!6889)

(declare-fun lt!299936 () SeekEntryResult!6889)

(assert (=> b!646644 (= e!370705 (Found!6889 (index!29896 lt!299936)))))

(declare-fun b!646645 () Bool)

(assert (=> b!646645 (= e!370703 e!370705)))

(declare-fun lt!299938 () (_ BitVec 64))

(assert (=> b!646645 (= lt!299938 (select (arr!18452 a!2986) (index!29896 lt!299936)))))

(declare-fun c!74153 () Bool)

(assert (=> b!646645 (= c!74153 (= lt!299938 k0!1786))))

(declare-fun b!646646 () Bool)

(declare-fun e!370704 () SeekEntryResult!6889)

(assert (=> b!646646 (= e!370704 (MissingZero!6889 (index!29896 lt!299936)))))

(declare-fun d!91209 () Bool)

(declare-fun lt!299937 () SeekEntryResult!6889)

(assert (=> d!91209 (and (or ((_ is Undefined!6889) lt!299937) (not ((_ is Found!6889) lt!299937)) (and (bvsge (index!29895 lt!299937) #b00000000000000000000000000000000) (bvslt (index!29895 lt!299937) (size!18817 a!2986)))) (or ((_ is Undefined!6889) lt!299937) ((_ is Found!6889) lt!299937) (not ((_ is MissingZero!6889) lt!299937)) (and (bvsge (index!29894 lt!299937) #b00000000000000000000000000000000) (bvslt (index!29894 lt!299937) (size!18817 a!2986)))) (or ((_ is Undefined!6889) lt!299937) ((_ is Found!6889) lt!299937) ((_ is MissingZero!6889) lt!299937) (not ((_ is MissingVacant!6889) lt!299937)) (and (bvsge (index!29897 lt!299937) #b00000000000000000000000000000000) (bvslt (index!29897 lt!299937) (size!18817 a!2986)))) (or ((_ is Undefined!6889) lt!299937) (ite ((_ is Found!6889) lt!299937) (= (select (arr!18452 a!2986) (index!29895 lt!299937)) k0!1786) (ite ((_ is MissingZero!6889) lt!299937) (= (select (arr!18452 a!2986) (index!29894 lt!299937)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6889) lt!299937) (= (select (arr!18452 a!2986) (index!29897 lt!299937)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91209 (= lt!299937 e!370703)))

(declare-fun c!74152 () Bool)

(assert (=> d!91209 (= c!74152 (and ((_ is Intermediate!6889) lt!299936) (undefined!7701 lt!299936)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38484 (_ BitVec 32)) SeekEntryResult!6889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91209 (= lt!299936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91209 (validMask!0 mask!3053)))

(assert (=> d!91209 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!299937)))

(declare-fun b!646647 () Bool)

(assert (=> b!646647 (= e!370704 (seekKeyOrZeroReturnVacant!0 (x!58678 lt!299936) (index!29896 lt!299936) (index!29896 lt!299936) k0!1786 a!2986 mask!3053))))

(declare-fun b!646648 () Bool)

(declare-fun c!74151 () Bool)

(assert (=> b!646648 (= c!74151 (= lt!299938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646648 (= e!370705 e!370704)))

(assert (= (and d!91209 c!74152) b!646643))

(assert (= (and d!91209 (not c!74152)) b!646645))

(assert (= (and b!646645 c!74153) b!646644))

(assert (= (and b!646645 (not c!74153)) b!646648))

(assert (= (and b!646648 c!74151) b!646646))

(assert (= (and b!646648 (not c!74151)) b!646647))

(declare-fun m!619603 () Bool)

(assert (=> b!646645 m!619603))

(declare-fun m!619605 () Bool)

(assert (=> d!91209 m!619605))

(assert (=> d!91209 m!619325))

(declare-fun m!619607 () Bool)

(assert (=> d!91209 m!619607))

(declare-fun m!619609 () Bool)

(assert (=> d!91209 m!619609))

(declare-fun m!619611 () Bool)

(assert (=> d!91209 m!619611))

(assert (=> d!91209 m!619607))

(declare-fun m!619613 () Bool)

(assert (=> d!91209 m!619613))

(declare-fun m!619615 () Bool)

(assert (=> b!646647 m!619615))

(assert (=> b!646304 d!91209))

(declare-fun d!91229 () Bool)

(assert (=> d!91229 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299939 () Unit!21962)

(assert (=> d!91229 (= lt!299939 (choose!114 lt!299762 (select (arr!18452 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91229 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91229 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299762 (select (arr!18452 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!299939)))

(declare-fun bs!19295 () Bool)

(assert (= bs!19295 d!91229))

(assert (=> bs!19295 m!619273))

(assert (=> bs!19295 m!619287))

(assert (=> bs!19295 m!619273))

(declare-fun m!619617 () Bool)

(assert (=> bs!19295 m!619617))

(assert (=> b!646305 d!91229))

(declare-fun b!646649 () Bool)

(declare-fun e!370708 () Bool)

(declare-fun call!33643 () Bool)

(assert (=> b!646649 (= e!370708 call!33643)))

(declare-fun b!646650 () Bool)

(declare-fun e!370707 () Bool)

(assert (=> b!646650 (= e!370707 (contains!3133 Nil!12529 (select (arr!18452 lt!299762) j!136)))))

(declare-fun b!646651 () Bool)

(declare-fun e!370709 () Bool)

(declare-fun e!370706 () Bool)

(assert (=> b!646651 (= e!370709 e!370706)))

(declare-fun res!419077 () Bool)

(assert (=> b!646651 (=> (not res!419077) (not e!370706))))

(assert (=> b!646651 (= res!419077 (not e!370707))))

(declare-fun res!419076 () Bool)

(assert (=> b!646651 (=> (not res!419076) (not e!370707))))

(assert (=> b!646651 (= res!419076 (validKeyInArray!0 (select (arr!18452 lt!299762) j!136)))))

(declare-fun c!74154 () Bool)

(declare-fun bm!33640 () Bool)

(assert (=> bm!33640 (= call!33643 (arrayNoDuplicates!0 lt!299762 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74154 (Cons!12528 (select (arr!18452 lt!299762) j!136) Nil!12529) Nil!12529)))))

(declare-fun b!646652 () Bool)

(assert (=> b!646652 (= e!370706 e!370708)))

(assert (=> b!646652 (= c!74154 (validKeyInArray!0 (select (arr!18452 lt!299762) j!136)))))

(declare-fun d!91231 () Bool)

(declare-fun res!419075 () Bool)

(assert (=> d!91231 (=> res!419075 e!370709)))

(assert (=> d!91231 (= res!419075 (bvsge j!136 (size!18817 lt!299762)))))

(assert (=> d!91231 (= (arrayNoDuplicates!0 lt!299762 j!136 Nil!12529) e!370709)))

(declare-fun b!646653 () Bool)

(assert (=> b!646653 (= e!370708 call!33643)))

(assert (= (and d!91231 (not res!419075)) b!646651))

(assert (= (and b!646651 res!419076) b!646650))

(assert (= (and b!646651 res!419077) b!646652))

(assert (= (and b!646652 c!74154) b!646649))

(assert (= (and b!646652 (not c!74154)) b!646653))

(assert (= (or b!646649 b!646653) bm!33640))

(assert (=> b!646650 m!619517))

(assert (=> b!646650 m!619517))

(declare-fun m!619619 () Bool)

(assert (=> b!646650 m!619619))

(assert (=> b!646651 m!619517))

(assert (=> b!646651 m!619517))

(declare-fun m!619621 () Bool)

(assert (=> b!646651 m!619621))

(assert (=> bm!33640 m!619517))

(declare-fun m!619623 () Bool)

(assert (=> bm!33640 m!619623))

(assert (=> b!646652 m!619517))

(assert (=> b!646652 m!619517))

(assert (=> b!646652 m!619621))

(assert (=> b!646305 d!91231))

(declare-fun b!646668 () Bool)

(declare-fun e!370721 () Bool)

(declare-fun call!33644 () Bool)

(assert (=> b!646668 (= e!370721 call!33644)))

(declare-fun b!646669 () Bool)

(declare-fun e!370720 () Bool)

(assert (=> b!646669 (= e!370720 (contains!3133 Nil!12529 (select (arr!18452 lt!299762) #b00000000000000000000000000000000)))))

(declare-fun b!646670 () Bool)

(declare-fun e!370722 () Bool)

(declare-fun e!370719 () Bool)

(assert (=> b!646670 (= e!370722 e!370719)))

(declare-fun res!419084 () Bool)

(assert (=> b!646670 (=> (not res!419084) (not e!370719))))

(assert (=> b!646670 (= res!419084 (not e!370720))))

(declare-fun res!419083 () Bool)

(assert (=> b!646670 (=> (not res!419083) (not e!370720))))

(assert (=> b!646670 (= res!419083 (validKeyInArray!0 (select (arr!18452 lt!299762) #b00000000000000000000000000000000)))))

(declare-fun bm!33641 () Bool)

(declare-fun c!74160 () Bool)

(assert (=> bm!33641 (= call!33644 (arrayNoDuplicates!0 lt!299762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74160 (Cons!12528 (select (arr!18452 lt!299762) #b00000000000000000000000000000000) Nil!12529) Nil!12529)))))

(declare-fun b!646671 () Bool)

(assert (=> b!646671 (= e!370719 e!370721)))

(assert (=> b!646671 (= c!74160 (validKeyInArray!0 (select (arr!18452 lt!299762) #b00000000000000000000000000000000)))))

(declare-fun d!91233 () Bool)

(declare-fun res!419082 () Bool)

(assert (=> d!91233 (=> res!419082 e!370722)))

(assert (=> d!91233 (= res!419082 (bvsge #b00000000000000000000000000000000 (size!18817 lt!299762)))))

(assert (=> d!91233 (= (arrayNoDuplicates!0 lt!299762 #b00000000000000000000000000000000 Nil!12529) e!370722)))

(declare-fun b!646672 () Bool)

(assert (=> b!646672 (= e!370721 call!33644)))

(assert (= (and d!91233 (not res!419082)) b!646670))

(assert (= (and b!646670 res!419083) b!646669))

(assert (= (and b!646670 res!419084) b!646671))

(assert (= (and b!646671 c!74160) b!646668))

(assert (= (and b!646671 (not c!74160)) b!646672))

(assert (= (or b!646668 b!646672) bm!33641))

(declare-fun m!619631 () Bool)

(assert (=> b!646669 m!619631))

(assert (=> b!646669 m!619631))

(declare-fun m!619633 () Bool)

(assert (=> b!646669 m!619633))

(assert (=> b!646670 m!619631))

(assert (=> b!646670 m!619631))

(declare-fun m!619635 () Bool)

(assert (=> b!646670 m!619635))

(assert (=> bm!33641 m!619631))

(declare-fun m!619637 () Bool)

(assert (=> bm!33641 m!619637))

(assert (=> b!646671 m!619631))

(assert (=> b!646671 m!619631))

(assert (=> b!646671 m!619635))

(assert (=> b!646305 d!91233))

(declare-fun d!91237 () Bool)

(declare-fun res!419085 () Bool)

(declare-fun e!370723 () Bool)

(assert (=> d!91237 (=> res!419085 e!370723)))

(assert (=> d!91237 (= res!419085 (= (select (arr!18452 lt!299762) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18452 a!2986) j!136)))))

(assert (=> d!91237 (= (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!370723)))

(declare-fun b!646673 () Bool)

(declare-fun e!370724 () Bool)

(assert (=> b!646673 (= e!370723 e!370724)))

(declare-fun res!419086 () Bool)

(assert (=> b!646673 (=> (not res!419086) (not e!370724))))

(assert (=> b!646673 (= res!419086 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18817 lt!299762)))))

(declare-fun b!646674 () Bool)

(assert (=> b!646674 (= e!370724 (arrayContainsKey!0 lt!299762 (select (arr!18452 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91237 (not res!419085)) b!646673))

(assert (= (and b!646673 res!419086) b!646674))

(declare-fun m!619639 () Bool)

(assert (=> d!91237 m!619639))

(assert (=> b!646674 m!619273))

(declare-fun m!619641 () Bool)

(assert (=> b!646674 m!619641))

(assert (=> b!646305 d!91237))

(declare-fun d!91239 () Bool)

(assert (=> d!91239 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18817 lt!299762)) (not (= (select (arr!18452 lt!299762) j!136) (select (arr!18452 a!2986) j!136))))))

(declare-fun lt!299953 () Unit!21962)

(declare-fun choose!21 (array!38484 (_ BitVec 64) (_ BitVec 32) List!12532) Unit!21962)

(assert (=> d!91239 (= lt!299953 (choose!21 lt!299762 (select (arr!18452 a!2986) j!136) j!136 Nil!12529))))

(assert (=> d!91239 (bvslt (size!18817 lt!299762) #b01111111111111111111111111111111)))

(assert (=> d!91239 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299762 (select (arr!18452 a!2986) j!136) j!136 Nil!12529) lt!299953)))

(declare-fun bs!19296 () Bool)

(assert (= bs!19296 d!91239))

(assert (=> bs!19296 m!619517))

(assert (=> bs!19296 m!619273))

(declare-fun m!619657 () Bool)

(assert (=> bs!19296 m!619657))

(assert (=> b!646305 d!91239))

(declare-fun d!91245 () Bool)

(assert (=> d!91245 (arrayNoDuplicates!0 lt!299762 j!136 Nil!12529)))

(declare-fun lt!299956 () Unit!21962)

(declare-fun choose!39 (array!38484 (_ BitVec 32) (_ BitVec 32)) Unit!21962)

(assert (=> d!91245 (= lt!299956 (choose!39 lt!299762 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91245 (bvslt (size!18817 lt!299762) #b01111111111111111111111111111111)))

(assert (=> d!91245 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!299762 #b00000000000000000000000000000000 j!136) lt!299956)))

(declare-fun bs!19297 () Bool)

(assert (= bs!19297 d!91245))

(assert (=> bs!19297 m!619293))

(declare-fun m!619659 () Bool)

(assert (=> bs!19297 m!619659))

(assert (=> b!646305 d!91245))

(declare-fun d!91247 () Bool)

(declare-fun e!370732 () Bool)

(assert (=> d!91247 e!370732))

(declare-fun res!419093 () Bool)

(assert (=> d!91247 (=> (not res!419093) (not e!370732))))

(assert (=> d!91247 (= res!419093 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18817 a!2986))))))

(declare-fun lt!299959 () Unit!21962)

(declare-fun choose!41 (array!38484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12532) Unit!21962)

(assert (=> d!91247 (= lt!299959 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12529))))

(assert (=> d!91247 (bvslt (size!18817 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91247 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12529) lt!299959)))

(declare-fun b!646683 () Bool)

(assert (=> b!646683 (= e!370732 (arrayNoDuplicates!0 (array!38485 (store (arr!18452 a!2986) i!1108 k0!1786) (size!18817 a!2986)) #b00000000000000000000000000000000 Nil!12529))))

(assert (= (and d!91247 res!419093) b!646683))

(declare-fun m!619661 () Bool)

(assert (=> d!91247 m!619661))

(assert (=> b!646683 m!619279))

(declare-fun m!619663 () Bool)

(assert (=> b!646683 m!619663))

(assert (=> b!646305 d!91247))

(check-sat (not d!91209) (not b!646518) (not d!91169) (not bm!33640) (not b!646559) (not b!646500) (not b!646524) (not d!91239) (not b!646683) (not d!91245) (not b!646544) (not b!646546) (not b!646512) (not b!646669) (not b!646671) (not b!646484) (not b!646674) (not bm!33641) (not b!646590) (not d!91163) (not b!646534) (not b!646483) (not d!91167) (not d!91161) (not bm!33631) (not d!91229) (not b!646652) (not b!646670) (not b!646647) (not d!91247) (not d!91165) (not b!646506) (not b!646536) (not d!91189) (not b!646543) (not bm!33628) (not b!646650) (not b!646482) (not b!646538) (not d!91191) (not b!646651))
(check-sat)
