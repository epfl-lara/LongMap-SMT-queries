; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58230 () Bool)

(assert start!58230)

(declare-fun b!643265 () Bool)

(declare-fun res!416692 () Bool)

(declare-fun e!368463 () Bool)

(assert (=> b!643265 (=> (not res!416692) (not e!368463))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643265 (= res!416692 (validKeyInArray!0 k!1786))))

(declare-fun b!643266 () Bool)

(declare-datatypes ((Unit!21780 0))(
  ( (Unit!21781) )
))
(declare-fun e!368462 () Unit!21780)

(declare-fun Unit!21782 () Unit!21780)

(assert (=> b!643266 (= e!368462 Unit!21782)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!298010 () Unit!21780)

(declare-datatypes ((array!38408 0))(
  ( (array!38409 (arr!18419 (Array (_ BitVec 32) (_ BitVec 64))) (size!18783 (_ BitVec 32))) )
))
(declare-fun lt!298017 () array!38408)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38408 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21780)

(assert (=> b!643266 (= lt!298010 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298017 (select (arr!18419 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643266 (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!298018 () Unit!21780)

(declare-datatypes ((List!12460 0))(
  ( (Nil!12457) (Cons!12456 (h!13501 (_ BitVec 64)) (t!18688 List!12460)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38408 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12460) Unit!21780)

(assert (=> b!643266 (= lt!298018 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12457))))

(declare-fun arrayNoDuplicates!0 (array!38408 (_ BitVec 32) List!12460) Bool)

(assert (=> b!643266 (arrayNoDuplicates!0 lt!298017 #b00000000000000000000000000000000 Nil!12457)))

(declare-fun lt!298009 () Unit!21780)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38408 (_ BitVec 32) (_ BitVec 32)) Unit!21780)

(assert (=> b!643266 (= lt!298009 (lemmaNoDuplicateFromThenFromBigger!0 lt!298017 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643266 (arrayNoDuplicates!0 lt!298017 j!136 Nil!12457)))

(declare-fun lt!298013 () Unit!21780)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38408 (_ BitVec 64) (_ BitVec 32) List!12460) Unit!21780)

(assert (=> b!643266 (= lt!298013 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298017 (select (arr!18419 a!2986) j!136) j!136 Nil!12457))))

(assert (=> b!643266 false))

(declare-fun b!643267 () Bool)

(declare-fun e!368450 () Bool)

(declare-fun e!368461 () Bool)

(assert (=> b!643267 (= e!368450 (not e!368461))))

(declare-fun res!416708 () Bool)

(assert (=> b!643267 (=> res!416708 e!368461)))

(declare-datatypes ((SeekEntryResult!6859 0))(
  ( (MissingZero!6859 (index!29765 (_ BitVec 32))) (Found!6859 (index!29766 (_ BitVec 32))) (Intermediate!6859 (undefined!7671 Bool) (index!29767 (_ BitVec 32)) (x!58530 (_ BitVec 32))) (Undefined!6859) (MissingVacant!6859 (index!29768 (_ BitVec 32))) )
))
(declare-fun lt!298008 () SeekEntryResult!6859)

(assert (=> b!643267 (= res!416708 (not (= lt!298008 (Found!6859 index!984))))))

(declare-fun lt!298016 () Unit!21780)

(declare-fun e!368454 () Unit!21780)

(assert (=> b!643267 (= lt!298016 e!368454)))

(declare-fun c!73655 () Bool)

(assert (=> b!643267 (= c!73655 (= lt!298008 Undefined!6859))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!298005 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38408 (_ BitVec 32)) SeekEntryResult!6859)

(assert (=> b!643267 (= lt!298008 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298005 lt!298017 mask!3053))))

(declare-fun e!368460 () Bool)

(assert (=> b!643267 e!368460))

(declare-fun res!416704 () Bool)

(assert (=> b!643267 (=> (not res!416704) (not e!368460))))

(declare-fun lt!298012 () (_ BitVec 32))

(declare-fun lt!298006 () SeekEntryResult!6859)

(assert (=> b!643267 (= res!416704 (= lt!298006 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298012 vacantSpotIndex!68 lt!298005 lt!298017 mask!3053)))))

(assert (=> b!643267 (= lt!298006 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298012 vacantSpotIndex!68 (select (arr!18419 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643267 (= lt!298005 (select (store (arr!18419 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298011 () Unit!21780)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38408 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21780)

(assert (=> b!643267 (= lt!298011 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298012 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643267 (= lt!298012 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!643268 () Bool)

(declare-fun e!368459 () Bool)

(assert (=> b!643268 (= e!368459 (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) index!984))))

(declare-fun b!643269 () Bool)

(declare-fun res!416698 () Bool)

(assert (=> b!643269 (=> (not res!416698) (not e!368463))))

(assert (=> b!643269 (= res!416698 (validKeyInArray!0 (select (arr!18419 a!2986) j!136)))))

(declare-fun b!643270 () Bool)

(declare-fun e!368456 () Bool)

(declare-fun e!368452 () Bool)

(assert (=> b!643270 (= e!368456 e!368452)))

(declare-fun res!416694 () Bool)

(assert (=> b!643270 (=> res!416694 e!368452)))

(assert (=> b!643270 (= res!416694 (bvsge index!984 j!136))))

(declare-fun lt!298007 () Unit!21780)

(assert (=> b!643270 (= lt!298007 e!368462)))

(declare-fun c!73654 () Bool)

(assert (=> b!643270 (= c!73654 (bvslt j!136 index!984))))

(declare-fun b!643271 () Bool)

(declare-fun res!416701 () Bool)

(declare-fun e!368451 () Bool)

(assert (=> b!643271 (=> (not res!416701) (not e!368451))))

(assert (=> b!643271 (= res!416701 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12457))))

(declare-fun b!643273 () Bool)

(declare-fun lt!298015 () SeekEntryResult!6859)

(assert (=> b!643273 (= e!368460 (= lt!298015 lt!298006))))

(declare-fun b!643274 () Bool)

(declare-fun e!368455 () Bool)

(assert (=> b!643274 (= e!368451 e!368455)))

(declare-fun res!416697 () Bool)

(assert (=> b!643274 (=> (not res!416697) (not e!368455))))

(assert (=> b!643274 (= res!416697 (= (select (store (arr!18419 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643274 (= lt!298017 (array!38409 (store (arr!18419 a!2986) i!1108 k!1786) (size!18783 a!2986)))))

(declare-fun b!643275 () Bool)

(declare-fun res!416702 () Bool)

(assert (=> b!643275 (=> (not res!416702) (not e!368451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38408 (_ BitVec 32)) Bool)

(assert (=> b!643275 (= res!416702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643276 () Bool)

(declare-fun e!368453 () Bool)

(declare-fun e!368458 () Bool)

(assert (=> b!643276 (= e!368453 e!368458)))

(declare-fun res!416706 () Bool)

(assert (=> b!643276 (=> res!416706 e!368458)))

(declare-fun lt!298004 () (_ BitVec 64))

(assert (=> b!643276 (= res!416706 (or (not (= (select (arr!18419 a!2986) j!136) lt!298005)) (not (= (select (arr!18419 a!2986) j!136) lt!298004)) (bvsge j!136 index!984)))))

(declare-fun b!643277 () Bool)

(assert (=> b!643277 (= e!368463 e!368451)))

(declare-fun res!416703 () Bool)

(assert (=> b!643277 (=> (not res!416703) (not e!368451))))

(declare-fun lt!298014 () SeekEntryResult!6859)

(assert (=> b!643277 (= res!416703 (or (= lt!298014 (MissingZero!6859 i!1108)) (= lt!298014 (MissingVacant!6859 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38408 (_ BitVec 32)) SeekEntryResult!6859)

(assert (=> b!643277 (= lt!298014 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!643278 () Bool)

(declare-fun res!416693 () Bool)

(assert (=> b!643278 (=> (not res!416693) (not e!368451))))

(assert (=> b!643278 (= res!416693 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18419 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643279 () Bool)

(assert (=> b!643279 (= e!368461 e!368456)))

(declare-fun res!416691 () Bool)

(assert (=> b!643279 (=> res!416691 e!368456)))

(assert (=> b!643279 (= res!416691 (or (not (= (select (arr!18419 a!2986) j!136) lt!298005)) (not (= (select (arr!18419 a!2986) j!136) lt!298004))))))

(assert (=> b!643279 e!368453))

(declare-fun res!416699 () Bool)

(assert (=> b!643279 (=> (not res!416699) (not e!368453))))

(assert (=> b!643279 (= res!416699 (= lt!298004 (select (arr!18419 a!2986) j!136)))))

(assert (=> b!643279 (= lt!298004 (select (store (arr!18419 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!643280 () Bool)

(declare-fun Unit!21783 () Unit!21780)

(assert (=> b!643280 (= e!368462 Unit!21783)))

(declare-fun b!643281 () Bool)

(assert (=> b!643281 (= e!368458 e!368459)))

(declare-fun res!416707 () Bool)

(assert (=> b!643281 (=> (not res!416707) (not e!368459))))

(assert (=> b!643281 (= res!416707 (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) j!136))))

(declare-fun b!643282 () Bool)

(declare-fun res!416695 () Bool)

(assert (=> b!643282 (=> (not res!416695) (not e!368463))))

(assert (=> b!643282 (= res!416695 (and (= (size!18783 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18783 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18783 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!416700 () Bool)

(assert (=> start!58230 (=> (not res!416700) (not e!368463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58230 (= res!416700 (validMask!0 mask!3053))))

(assert (=> start!58230 e!368463))

(assert (=> start!58230 true))

(declare-fun array_inv!14215 (array!38408) Bool)

(assert (=> start!58230 (array_inv!14215 a!2986)))

(declare-fun b!643272 () Bool)

(assert (=> b!643272 (= e!368452 (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) index!984))))

(assert (=> b!643272 (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) j!136)))

(declare-fun b!643283 () Bool)

(declare-fun Unit!21784 () Unit!21780)

(assert (=> b!643283 (= e!368454 Unit!21784)))

(assert (=> b!643283 false))

(declare-fun b!643284 () Bool)

(declare-fun res!416696 () Bool)

(assert (=> b!643284 (=> (not res!416696) (not e!368463))))

(assert (=> b!643284 (= res!416696 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!643285 () Bool)

(assert (=> b!643285 (= e!368455 e!368450)))

(declare-fun res!416705 () Bool)

(assert (=> b!643285 (=> (not res!416705) (not e!368450))))

(assert (=> b!643285 (= res!416705 (and (= lt!298015 (Found!6859 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18419 a!2986) index!984) (select (arr!18419 a!2986) j!136))) (not (= (select (arr!18419 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!643285 (= lt!298015 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18419 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643286 () Bool)

(declare-fun Unit!21785 () Unit!21780)

(assert (=> b!643286 (= e!368454 Unit!21785)))

(assert (= (and start!58230 res!416700) b!643282))

(assert (= (and b!643282 res!416695) b!643269))

(assert (= (and b!643269 res!416698) b!643265))

(assert (= (and b!643265 res!416692) b!643284))

(assert (= (and b!643284 res!416696) b!643277))

(assert (= (and b!643277 res!416703) b!643275))

(assert (= (and b!643275 res!416702) b!643271))

(assert (= (and b!643271 res!416701) b!643278))

(assert (= (and b!643278 res!416693) b!643274))

(assert (= (and b!643274 res!416697) b!643285))

(assert (= (and b!643285 res!416705) b!643267))

(assert (= (and b!643267 res!416704) b!643273))

(assert (= (and b!643267 c!73655) b!643283))

(assert (= (and b!643267 (not c!73655)) b!643286))

(assert (= (and b!643267 (not res!416708)) b!643279))

(assert (= (and b!643279 res!416699) b!643276))

(assert (= (and b!643276 (not res!416706)) b!643281))

(assert (= (and b!643281 res!416707) b!643268))

(assert (= (and b!643279 (not res!416691)) b!643270))

(assert (= (and b!643270 c!73654) b!643266))

(assert (= (and b!643270 (not c!73654)) b!643280))

(assert (= (and b!643270 (not res!416694)) b!643272))

(declare-fun m!616997 () Bool)

(assert (=> b!643274 m!616997))

(declare-fun m!616999 () Bool)

(assert (=> b!643274 m!616999))

(declare-fun m!617001 () Bool)

(assert (=> b!643271 m!617001))

(declare-fun m!617003 () Bool)

(assert (=> b!643269 m!617003))

(assert (=> b!643269 m!617003))

(declare-fun m!617005 () Bool)

(assert (=> b!643269 m!617005))

(assert (=> b!643272 m!617003))

(assert (=> b!643272 m!617003))

(declare-fun m!617007 () Bool)

(assert (=> b!643272 m!617007))

(assert (=> b!643272 m!617003))

(declare-fun m!617009 () Bool)

(assert (=> b!643272 m!617009))

(assert (=> b!643279 m!617003))

(assert (=> b!643279 m!616997))

(declare-fun m!617011 () Bool)

(assert (=> b!643279 m!617011))

(assert (=> b!643276 m!617003))

(declare-fun m!617013 () Bool)

(assert (=> b!643265 m!617013))

(declare-fun m!617015 () Bool)

(assert (=> b!643277 m!617015))

(declare-fun m!617017 () Bool)

(assert (=> b!643285 m!617017))

(assert (=> b!643285 m!617003))

(assert (=> b!643285 m!617003))

(declare-fun m!617019 () Bool)

(assert (=> b!643285 m!617019))

(declare-fun m!617021 () Bool)

(assert (=> b!643284 m!617021))

(declare-fun m!617023 () Bool)

(assert (=> start!58230 m!617023))

(declare-fun m!617025 () Bool)

(assert (=> start!58230 m!617025))

(declare-fun m!617027 () Bool)

(assert (=> b!643275 m!617027))

(assert (=> b!643268 m!617003))

(assert (=> b!643268 m!617003))

(assert (=> b!643268 m!617007))

(declare-fun m!617029 () Bool)

(assert (=> b!643267 m!617029))

(assert (=> b!643267 m!617003))

(declare-fun m!617031 () Bool)

(assert (=> b!643267 m!617031))

(assert (=> b!643267 m!616997))

(assert (=> b!643267 m!617003))

(declare-fun m!617033 () Bool)

(assert (=> b!643267 m!617033))

(declare-fun m!617035 () Bool)

(assert (=> b!643267 m!617035))

(declare-fun m!617037 () Bool)

(assert (=> b!643267 m!617037))

(declare-fun m!617039 () Bool)

(assert (=> b!643267 m!617039))

(assert (=> b!643281 m!617003))

(assert (=> b!643281 m!617003))

(assert (=> b!643281 m!617009))

(declare-fun m!617041 () Bool)

(assert (=> b!643278 m!617041))

(assert (=> b!643266 m!617003))

(declare-fun m!617043 () Bool)

(assert (=> b!643266 m!617043))

(assert (=> b!643266 m!617003))

(declare-fun m!617045 () Bool)

(assert (=> b!643266 m!617045))

(assert (=> b!643266 m!617003))

(declare-fun m!617047 () Bool)

(assert (=> b!643266 m!617047))

(declare-fun m!617049 () Bool)

(assert (=> b!643266 m!617049))

(declare-fun m!617051 () Bool)

(assert (=> b!643266 m!617051))

(assert (=> b!643266 m!617003))

(declare-fun m!617053 () Bool)

(assert (=> b!643266 m!617053))

(declare-fun m!617055 () Bool)

(assert (=> b!643266 m!617055))

(push 1)

(assert (not b!643275))

(assert (not b!643269))

(assert (not b!643271))

(assert (not b!643285))

(assert (not b!643266))

(assert (not b!643272))

(assert (not b!643268))

(assert (not b!643267))

(assert (not b!643277))

(assert (not b!643265))

(assert (not b!643284))

(assert (not b!643281))

(assert (not start!58230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!643362 () Bool)

(declare-fun e!368517 () Bool)

(declare-fun contains!3142 (List!12460 (_ BitVec 64)) Bool)

(assert (=> b!643362 (= e!368517 (contains!3142 Nil!12457 (select (arr!18419 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643363 () Bool)

(declare-fun e!368516 () Bool)

(declare-fun call!33591 () Bool)

(assert (=> b!643363 (= e!368516 call!33591)))

(declare-fun b!643365 () Bool)

(declare-fun e!368518 () Bool)

(declare-fun e!368515 () Bool)

(assert (=> b!643365 (= e!368518 e!368515)))

(declare-fun res!416738 () Bool)

(assert (=> b!643365 (=> (not res!416738) (not e!368515))))

(assert (=> b!643365 (= res!416738 (not e!368517))))

(declare-fun res!416736 () Bool)

(assert (=> b!643365 (=> (not res!416736) (not e!368517))))

(assert (=> b!643365 (= res!416736 (validKeyInArray!0 (select (arr!18419 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33588 () Bool)

(declare-fun c!73680 () Bool)

(assert (=> bm!33588 (= call!33591 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73680 (Cons!12456 (select (arr!18419 a!2986) #b00000000000000000000000000000000) Nil!12457) Nil!12457)))))

(declare-fun b!643366 () Bool)

(assert (=> b!643366 (= e!368515 e!368516)))

(assert (=> b!643366 (= c!73680 (validKeyInArray!0 (select (arr!18419 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90935 () Bool)

(declare-fun res!416737 () Bool)

(assert (=> d!90935 (=> res!416737 e!368518)))

(assert (=> d!90935 (= res!416737 (bvsge #b00000000000000000000000000000000 (size!18783 a!2986)))))

(assert (=> d!90935 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12457) e!368518)))

(declare-fun b!643364 () Bool)

(assert (=> b!643364 (= e!368516 call!33591)))

(assert (= (and d!90935 (not res!416737)) b!643365))

(assert (= (and b!643365 res!416736) b!643362))

(assert (= (and b!643365 res!416738) b!643366))

(assert (= (and b!643366 c!73680) b!643364))

(assert (= (and b!643366 (not c!73680)) b!643363))

(assert (= (or b!643364 b!643363) bm!33588))

(declare-fun m!617103 () Bool)

(assert (=> b!643362 m!617103))

(assert (=> b!643362 m!617103))

(declare-fun m!617105 () Bool)

(assert (=> b!643362 m!617105))

(assert (=> b!643365 m!617103))

(assert (=> b!643365 m!617103))

(declare-fun m!617107 () Bool)

(assert (=> b!643365 m!617107))

(assert (=> bm!33588 m!617103))

(declare-fun m!617109 () Bool)

(assert (=> bm!33588 m!617109))

(assert (=> b!643366 m!617103))

(assert (=> b!643366 m!617103))

(assert (=> b!643366 m!617107))

(assert (=> b!643271 d!90935))

(declare-fun d!90949 () Bool)

(declare-fun res!416749 () Bool)

(declare-fun e!368535 () Bool)

(assert (=> d!90949 (=> res!416749 e!368535)))

(assert (=> d!90949 (= res!416749 (= (select (arr!18419 lt!298017) index!984) (select (arr!18419 a!2986) j!136)))))

(assert (=> d!90949 (= (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) index!984) e!368535)))

(declare-fun b!643389 () Bool)

(declare-fun e!368536 () Bool)

(assert (=> b!643389 (= e!368535 e!368536)))

(declare-fun res!416750 () Bool)

(assert (=> b!643389 (=> (not res!416750) (not e!368536))))

(assert (=> b!643389 (= res!416750 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18783 lt!298017)))))

(declare-fun b!643390 () Bool)

(assert (=> b!643390 (= e!368536 (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90949 (not res!416749)) b!643389))

(assert (= (and b!643389 res!416750) b!643390))

(declare-fun m!617117 () Bool)

(assert (=> d!90949 m!617117))

(assert (=> b!643390 m!617003))

(declare-fun m!617119 () Bool)

(assert (=> b!643390 m!617119))

(assert (=> b!643272 d!90949))

(declare-fun d!90955 () Bool)

(declare-fun res!416751 () Bool)

(declare-fun e!368537 () Bool)

(assert (=> d!90955 (=> res!416751 e!368537)))

(assert (=> d!90955 (= res!416751 (= (select (arr!18419 lt!298017) j!136) (select (arr!18419 a!2986) j!136)))))

(assert (=> d!90955 (= (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) j!136) e!368537)))

(declare-fun b!643391 () Bool)

(declare-fun e!368538 () Bool)

(assert (=> b!643391 (= e!368537 e!368538)))

(declare-fun res!416752 () Bool)

(assert (=> b!643391 (=> (not res!416752) (not e!368538))))

(assert (=> b!643391 (= res!416752 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18783 lt!298017)))))

(declare-fun b!643392 () Bool)

(assert (=> b!643392 (= e!368538 (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90955 (not res!416751)) b!643391))

(assert (= (and b!643391 res!416752) b!643392))

(declare-fun m!617121 () Bool)

(assert (=> d!90955 m!617121))

(assert (=> b!643392 m!617003))

(declare-fun m!617123 () Bool)

(assert (=> b!643392 m!617123))

(assert (=> b!643272 d!90955))

(declare-fun d!90957 () Bool)

(assert (=> d!90957 (= (validKeyInArray!0 (select (arr!18419 a!2986) j!136)) (and (not (= (select (arr!18419 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18419 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!643269 d!90957))

(assert (=> b!643268 d!90949))

(assert (=> b!643281 d!90955))

(declare-fun b!643464 () Bool)

(declare-fun e!368583 () SeekEntryResult!6859)

(declare-fun lt!298086 () SeekEntryResult!6859)

(assert (=> b!643464 (= e!368583 (MissingZero!6859 (index!29767 lt!298086)))))

(declare-fun d!90959 () Bool)

(declare-fun lt!298087 () SeekEntryResult!6859)

(assert (=> d!90959 (and (or (is-Undefined!6859 lt!298087) (not (is-Found!6859 lt!298087)) (and (bvsge (index!29766 lt!298087) #b00000000000000000000000000000000) (bvslt (index!29766 lt!298087) (size!18783 a!2986)))) (or (is-Undefined!6859 lt!298087) (is-Found!6859 lt!298087) (not (is-MissingZero!6859 lt!298087)) (and (bvsge (index!29765 lt!298087) #b00000000000000000000000000000000) (bvslt (index!29765 lt!298087) (size!18783 a!2986)))) (or (is-Undefined!6859 lt!298087) (is-Found!6859 lt!298087) (is-MissingZero!6859 lt!298087) (not (is-MissingVacant!6859 lt!298087)) (and (bvsge (index!29768 lt!298087) #b00000000000000000000000000000000) (bvslt (index!29768 lt!298087) (size!18783 a!2986)))) (or (is-Undefined!6859 lt!298087) (ite (is-Found!6859 lt!298087) (= (select (arr!18419 a!2986) (index!29766 lt!298087)) k!1786) (ite (is-MissingZero!6859 lt!298087) (= (select (arr!18419 a!2986) (index!29765 lt!298087)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6859 lt!298087) (= (select (arr!18419 a!2986) (index!29768 lt!298087)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!368584 () SeekEntryResult!6859)

(assert (=> d!90959 (= lt!298087 e!368584)))

(declare-fun c!73717 () Bool)

(assert (=> d!90959 (= c!73717 (and (is-Intermediate!6859 lt!298086) (undefined!7671 lt!298086)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38408 (_ BitVec 32)) SeekEntryResult!6859)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90959 (= lt!298086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90959 (validMask!0 mask!3053)))

(assert (=> d!90959 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!298087)))

(declare-fun b!643465 () Bool)

(declare-fun e!368582 () SeekEntryResult!6859)

(assert (=> b!643465 (= e!368584 e!368582)))

(declare-fun lt!298085 () (_ BitVec 64))

(assert (=> b!643465 (= lt!298085 (select (arr!18419 a!2986) (index!29767 lt!298086)))))

(declare-fun c!73715 () Bool)

(assert (=> b!643465 (= c!73715 (= lt!298085 k!1786))))

(declare-fun b!643466 () Bool)

(assert (=> b!643466 (= e!368583 (seekKeyOrZeroReturnVacant!0 (x!58530 lt!298086) (index!29767 lt!298086) (index!29767 lt!298086) k!1786 a!2986 mask!3053))))

(declare-fun b!643467 () Bool)

(declare-fun c!73716 () Bool)

(assert (=> b!643467 (= c!73716 (= lt!298085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643467 (= e!368582 e!368583)))

(declare-fun b!643468 () Bool)

(assert (=> b!643468 (= e!368582 (Found!6859 (index!29767 lt!298086)))))

(declare-fun b!643469 () Bool)

(assert (=> b!643469 (= e!368584 Undefined!6859)))

(assert (= (and d!90959 c!73717) b!643469))

(assert (= (and d!90959 (not c!73717)) b!643465))

(assert (= (and b!643465 c!73715) b!643468))

(assert (= (and b!643465 (not c!73715)) b!643467))

(assert (= (and b!643467 c!73716) b!643464))

(assert (= (and b!643467 (not c!73716)) b!643466))

(declare-fun m!617193 () Bool)

(assert (=> d!90959 m!617193))

(assert (=> d!90959 m!617193))

(declare-fun m!617195 () Bool)

(assert (=> d!90959 m!617195))

(declare-fun m!617197 () Bool)

(assert (=> d!90959 m!617197))

(declare-fun m!617199 () Bool)

(assert (=> d!90959 m!617199))

(assert (=> d!90959 m!617023))

(declare-fun m!617201 () Bool)

(assert (=> d!90959 m!617201))

(declare-fun m!617203 () Bool)

(assert (=> b!643465 m!617203))

(declare-fun m!617205 () Bool)

(assert (=> b!643466 m!617205))

(assert (=> b!643277 d!90959))

(declare-fun d!90987 () Bool)

(declare-fun res!416770 () Bool)

(declare-fun e!368587 () Bool)

(assert (=> d!90987 (=> res!416770 e!368587)))

(assert (=> d!90987 (= res!416770 (= (select (arr!18419 lt!298017) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18419 a!2986) j!136)))))

(assert (=> d!90987 (= (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!368587)))

(declare-fun b!643472 () Bool)

(declare-fun e!368588 () Bool)

(assert (=> b!643472 (= e!368587 e!368588)))

(declare-fun res!416771 () Bool)

(assert (=> b!643472 (=> (not res!416771) (not e!368588))))

(assert (=> b!643472 (= res!416771 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18783 lt!298017)))))

(declare-fun b!643473 () Bool)

(assert (=> b!643473 (= e!368588 (arrayContainsKey!0 lt!298017 (select (arr!18419 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90987 (not res!416770)) b!643472))

(assert (= (and b!643472 res!416771) b!643473))

(declare-fun m!617207 () Bool)

(assert (=> d!90987 m!617207))

(assert (=> b!643473 m!617003))

(declare-fun m!617209 () Bool)

(assert (=> b!643473 m!617209))

(assert (=> b!643266 d!90987))

(declare-fun b!643474 () Bool)

(declare-fun e!368591 () Bool)

(assert (=> b!643474 (= e!368591 (contains!3142 Nil!12457 (select (arr!18419 lt!298017) #b00000000000000000000000000000000)))))

(declare-fun b!643475 () Bool)

(declare-fun e!368590 () Bool)

(declare-fun call!33596 () Bool)

(assert (=> b!643475 (= e!368590 call!33596)))

(declare-fun b!643477 () Bool)

(declare-fun e!368592 () Bool)

(declare-fun e!368589 () Bool)

(assert (=> b!643477 (= e!368592 e!368589)))

(declare-fun res!416774 () Bool)

(assert (=> b!643477 (=> (not res!416774) (not e!368589))))

(assert (=> b!643477 (= res!416774 (not e!368591))))

(declare-fun res!416772 () Bool)

(assert (=> b!643477 (=> (not res!416772) (not e!368591))))

(assert (=> b!643477 (= res!416772 (validKeyInArray!0 (select (arr!18419 lt!298017) #b00000000000000000000000000000000)))))

(declare-fun bm!33593 () Bool)

(declare-fun c!73718 () Bool)

(assert (=> bm!33593 (= call!33596 (arrayNoDuplicates!0 lt!298017 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73718 (Cons!12456 (select (arr!18419 lt!298017) #b00000000000000000000000000000000) Nil!12457) Nil!12457)))))

