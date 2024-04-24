; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58284 () Bool)

(assert start!58284)

(declare-fun b!643357 () Bool)

(declare-fun res!416697 () Bool)

(declare-fun e!368511 () Bool)

(assert (=> b!643357 (=> (not res!416697) (not e!368511))))

(declare-datatypes ((array!38400 0))(
  ( (array!38401 (arr!18412 (Array (_ BitVec 32) (_ BitVec 64))) (size!18776 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38400)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38400 (_ BitVec 32)) Bool)

(assert (=> b!643357 (= res!416697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643358 () Bool)

(declare-fun e!368520 () Bool)

(declare-fun e!368507 () Bool)

(assert (=> b!643358 (= e!368520 e!368507)))

(declare-fun res!416713 () Bool)

(assert (=> b!643358 (=> res!416713 e!368507)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!643358 (= res!416713 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21747 0))(
  ( (Unit!21748) )
))
(declare-fun lt!298027 () Unit!21747)

(declare-fun e!368515 () Unit!21747)

(assert (=> b!643358 (= lt!298027 e!368515)))

(declare-fun c!73700 () Bool)

(assert (=> b!643358 (= c!73700 (bvslt j!136 index!984))))

(declare-fun b!643359 () Bool)

(declare-fun e!368519 () Bool)

(assert (=> b!643359 (= e!368519 e!368511)))

(declare-fun res!416704 () Bool)

(assert (=> b!643359 (=> (not res!416704) (not e!368511))))

(declare-datatypes ((SeekEntryResult!6808 0))(
  ( (MissingZero!6808 (index!29561 (_ BitVec 32))) (Found!6808 (index!29562 (_ BitVec 32))) (Intermediate!6808 (undefined!7620 Bool) (index!29563 (_ BitVec 32)) (x!58482 (_ BitVec 32))) (Undefined!6808) (MissingVacant!6808 (index!29564 (_ BitVec 32))) )
))
(declare-fun lt!298023 () SeekEntryResult!6808)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!643359 (= res!416704 (or (= lt!298023 (MissingZero!6808 i!1108)) (= lt!298023 (MissingVacant!6808 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38400 (_ BitVec 32)) SeekEntryResult!6808)

(assert (=> b!643359 (= lt!298023 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!643360 () Bool)

(declare-fun e!368509 () Bool)

(declare-fun e!368512 () Bool)

(assert (=> b!643360 (= e!368509 e!368512)))

(declare-fun res!416705 () Bool)

(assert (=> b!643360 (=> (not res!416705) (not e!368512))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!298029 () SeekEntryResult!6808)

(assert (=> b!643360 (= res!416705 (and (= lt!298029 (Found!6808 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18412 a!2986) index!984) (select (arr!18412 a!2986) j!136))) (not (= (select (arr!18412 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38400 (_ BitVec 32)) SeekEntryResult!6808)

(assert (=> b!643360 (= lt!298029 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18412 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643361 () Bool)

(declare-fun e!368514 () Bool)

(declare-fun lt!298017 () SeekEntryResult!6808)

(assert (=> b!643361 (= e!368514 (= lt!298029 lt!298017))))

(declare-fun b!643362 () Bool)

(declare-fun e!368510 () Unit!21747)

(declare-fun Unit!21749 () Unit!21747)

(assert (=> b!643362 (= e!368510 Unit!21749)))

(assert (=> b!643362 false))

(declare-fun b!643363 () Bool)

(declare-fun lt!298016 () array!38400)

(declare-fun e!368518 () Bool)

(declare-fun arrayContainsKey!0 (array!38400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643363 (= e!368518 (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) index!984))))

(declare-fun b!643364 () Bool)

(assert (=> b!643364 (= e!368511 e!368509)))

(declare-fun res!416707 () Bool)

(assert (=> b!643364 (=> (not res!416707) (not e!368509))))

(assert (=> b!643364 (= res!416707 (= (select (store (arr!18412 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643364 (= lt!298016 (array!38401 (store (arr!18412 a!2986) i!1108 k0!1786) (size!18776 a!2986)))))

(declare-fun b!643365 () Bool)

(declare-fun res!416706 () Bool)

(assert (=> b!643365 (=> (not res!416706) (not e!368519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643365 (= res!416706 (validKeyInArray!0 k0!1786))))

(declare-fun b!643366 () Bool)

(declare-fun Unit!21750 () Unit!21747)

(assert (=> b!643366 (= e!368515 Unit!21750)))

(declare-fun lt!298021 () Unit!21747)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38400 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21747)

(assert (=> b!643366 (= lt!298021 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298016 (select (arr!18412 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643366 (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298022 () Unit!21747)

(declare-datatypes ((List!12360 0))(
  ( (Nil!12357) (Cons!12356 (h!13404 (_ BitVec 64)) (t!18580 List!12360)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38400 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12360) Unit!21747)

(assert (=> b!643366 (= lt!298022 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12357))))

(declare-fun arrayNoDuplicates!0 (array!38400 (_ BitVec 32) List!12360) Bool)

(assert (=> b!643366 (arrayNoDuplicates!0 lt!298016 #b00000000000000000000000000000000 Nil!12357)))

(declare-fun lt!298020 () Unit!21747)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38400 (_ BitVec 32) (_ BitVec 32)) Unit!21747)

(assert (=> b!643366 (= lt!298020 (lemmaNoDuplicateFromThenFromBigger!0 lt!298016 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643366 (arrayNoDuplicates!0 lt!298016 j!136 Nil!12357)))

(declare-fun lt!298030 () Unit!21747)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38400 (_ BitVec 64) (_ BitVec 32) List!12360) Unit!21747)

(assert (=> b!643366 (= lt!298030 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298016 (select (arr!18412 a!2986) j!136) j!136 Nil!12357))))

(assert (=> b!643366 false))

(declare-fun b!643367 () Bool)

(declare-fun res!416709 () Bool)

(assert (=> b!643367 (=> (not res!416709) (not e!368519))))

(assert (=> b!643367 (= res!416709 (validKeyInArray!0 (select (arr!18412 a!2986) j!136)))))

(declare-fun b!643368 () Bool)

(declare-fun res!416701 () Bool)

(assert (=> b!643368 (=> (not res!416701) (not e!368511))))

(assert (=> b!643368 (= res!416701 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12357))))

(declare-fun b!643369 () Bool)

(declare-fun e!368517 () Bool)

(assert (=> b!643369 (= e!368517 e!368520)))

(declare-fun res!416699 () Bool)

(assert (=> b!643369 (=> res!416699 e!368520)))

(declare-fun lt!298024 () (_ BitVec 64))

(declare-fun lt!298026 () (_ BitVec 64))

(assert (=> b!643369 (= res!416699 (or (not (= (select (arr!18412 a!2986) j!136) lt!298024)) (not (= (select (arr!18412 a!2986) j!136) lt!298026))))))

(declare-fun e!368513 () Bool)

(assert (=> b!643369 e!368513))

(declare-fun res!416702 () Bool)

(assert (=> b!643369 (=> (not res!416702) (not e!368513))))

(assert (=> b!643369 (= res!416702 (= lt!298026 (select (arr!18412 a!2986) j!136)))))

(assert (=> b!643369 (= lt!298026 (select (store (arr!18412 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!643370 () Bool)

(declare-fun e!368516 () Bool)

(assert (=> b!643370 (= e!368513 e!368516)))

(declare-fun res!416708 () Bool)

(assert (=> b!643370 (=> res!416708 e!368516)))

(assert (=> b!643370 (= res!416708 (or (not (= (select (arr!18412 a!2986) j!136) lt!298024)) (not (= (select (arr!18412 a!2986) j!136) lt!298026)) (bvsge j!136 index!984)))))

(declare-fun b!643371 () Bool)

(declare-fun res!416711 () Bool)

(assert (=> b!643371 (=> (not res!416711) (not e!368519))))

(assert (=> b!643371 (= res!416711 (and (= (size!18776 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18776 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18776 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643372 () Bool)

(declare-fun Unit!21751 () Unit!21747)

(assert (=> b!643372 (= e!368510 Unit!21751)))

(declare-fun b!643373 () Bool)

(declare-fun Unit!21752 () Unit!21747)

(assert (=> b!643373 (= e!368515 Unit!21752)))

(declare-fun b!643374 () Bool)

(assert (=> b!643374 (= e!368512 (not e!368517))))

(declare-fun res!416696 () Bool)

(assert (=> b!643374 (=> res!416696 e!368517)))

(declare-fun lt!298018 () SeekEntryResult!6808)

(assert (=> b!643374 (= res!416696 (not (= lt!298018 (Found!6808 index!984))))))

(declare-fun lt!298025 () Unit!21747)

(assert (=> b!643374 (= lt!298025 e!368510)))

(declare-fun c!73699 () Bool)

(assert (=> b!643374 (= c!73699 (= lt!298018 Undefined!6808))))

(assert (=> b!643374 (= lt!298018 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298024 lt!298016 mask!3053))))

(assert (=> b!643374 e!368514))

(declare-fun res!416710 () Bool)

(assert (=> b!643374 (=> (not res!416710) (not e!368514))))

(declare-fun lt!298019 () (_ BitVec 32))

(assert (=> b!643374 (= res!416710 (= lt!298017 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298019 vacantSpotIndex!68 lt!298024 lt!298016 mask!3053)))))

(assert (=> b!643374 (= lt!298017 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298019 vacantSpotIndex!68 (select (arr!18412 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643374 (= lt!298024 (select (store (arr!18412 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298028 () Unit!21747)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38400 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21747)

(assert (=> b!643374 (= lt!298028 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298019 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643374 (= lt!298019 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!416700 () Bool)

(assert (=> start!58284 (=> (not res!416700) (not e!368519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58284 (= res!416700 (validMask!0 mask!3053))))

(assert (=> start!58284 e!368519))

(assert (=> start!58284 true))

(declare-fun array_inv!14271 (array!38400) Bool)

(assert (=> start!58284 (array_inv!14271 a!2986)))

(declare-fun b!643375 () Bool)

(declare-fun res!416698 () Bool)

(assert (=> b!643375 (=> (not res!416698) (not e!368511))))

(assert (=> b!643375 (= res!416698 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18412 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643376 () Bool)

(assert (=> b!643376 (= e!368507 (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) index!984))))

(assert (=> b!643376 (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) j!136)))

(declare-fun b!643377 () Bool)

(declare-fun res!416712 () Bool)

(assert (=> b!643377 (=> (not res!416712) (not e!368519))))

(assert (=> b!643377 (= res!416712 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!643378 () Bool)

(assert (=> b!643378 (= e!368516 e!368518)))

(declare-fun res!416703 () Bool)

(assert (=> b!643378 (=> (not res!416703) (not e!368518))))

(assert (=> b!643378 (= res!416703 (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) j!136))))

(assert (= (and start!58284 res!416700) b!643371))

(assert (= (and b!643371 res!416711) b!643367))

(assert (= (and b!643367 res!416709) b!643365))

(assert (= (and b!643365 res!416706) b!643377))

(assert (= (and b!643377 res!416712) b!643359))

(assert (= (and b!643359 res!416704) b!643357))

(assert (= (and b!643357 res!416697) b!643368))

(assert (= (and b!643368 res!416701) b!643375))

(assert (= (and b!643375 res!416698) b!643364))

(assert (= (and b!643364 res!416707) b!643360))

(assert (= (and b!643360 res!416705) b!643374))

(assert (= (and b!643374 res!416710) b!643361))

(assert (= (and b!643374 c!73699) b!643362))

(assert (= (and b!643374 (not c!73699)) b!643372))

(assert (= (and b!643374 (not res!416696)) b!643369))

(assert (= (and b!643369 res!416702) b!643370))

(assert (= (and b!643370 (not res!416708)) b!643378))

(assert (= (and b!643378 res!416703) b!643363))

(assert (= (and b!643369 (not res!416699)) b!643358))

(assert (= (and b!643358 c!73700) b!643366))

(assert (= (and b!643358 (not c!73700)) b!643373))

(assert (= (and b!643358 (not res!416713)) b!643376))

(declare-fun m!617497 () Bool)

(assert (=> b!643357 m!617497))

(declare-fun m!617499 () Bool)

(assert (=> b!643377 m!617499))

(declare-fun m!617501 () Bool)

(assert (=> b!643360 m!617501))

(declare-fun m!617503 () Bool)

(assert (=> b!643360 m!617503))

(assert (=> b!643360 m!617503))

(declare-fun m!617505 () Bool)

(assert (=> b!643360 m!617505))

(assert (=> b!643378 m!617503))

(assert (=> b!643378 m!617503))

(declare-fun m!617507 () Bool)

(assert (=> b!643378 m!617507))

(declare-fun m!617509 () Bool)

(assert (=> b!643359 m!617509))

(assert (=> b!643363 m!617503))

(assert (=> b!643363 m!617503))

(declare-fun m!617511 () Bool)

(assert (=> b!643363 m!617511))

(declare-fun m!617513 () Bool)

(assert (=> b!643365 m!617513))

(declare-fun m!617515 () Bool)

(assert (=> b!643364 m!617515))

(declare-fun m!617517 () Bool)

(assert (=> b!643364 m!617517))

(declare-fun m!617519 () Bool)

(assert (=> start!58284 m!617519))

(declare-fun m!617521 () Bool)

(assert (=> start!58284 m!617521))

(declare-fun m!617523 () Bool)

(assert (=> b!643375 m!617523))

(assert (=> b!643369 m!617503))

(assert (=> b!643369 m!617515))

(declare-fun m!617525 () Bool)

(assert (=> b!643369 m!617525))

(assert (=> b!643366 m!617503))

(declare-fun m!617527 () Bool)

(assert (=> b!643366 m!617527))

(assert (=> b!643366 m!617503))

(assert (=> b!643366 m!617503))

(declare-fun m!617529 () Bool)

(assert (=> b!643366 m!617529))

(assert (=> b!643366 m!617503))

(declare-fun m!617531 () Bool)

(assert (=> b!643366 m!617531))

(declare-fun m!617533 () Bool)

(assert (=> b!643366 m!617533))

(declare-fun m!617535 () Bool)

(assert (=> b!643366 m!617535))

(declare-fun m!617537 () Bool)

(assert (=> b!643366 m!617537))

(declare-fun m!617539 () Bool)

(assert (=> b!643366 m!617539))

(assert (=> b!643367 m!617503))

(assert (=> b!643367 m!617503))

(declare-fun m!617541 () Bool)

(assert (=> b!643367 m!617541))

(assert (=> b!643376 m!617503))

(assert (=> b!643376 m!617503))

(assert (=> b!643376 m!617511))

(assert (=> b!643376 m!617503))

(assert (=> b!643376 m!617507))

(declare-fun m!617543 () Bool)

(assert (=> b!643374 m!617543))

(declare-fun m!617545 () Bool)

(assert (=> b!643374 m!617545))

(assert (=> b!643374 m!617503))

(declare-fun m!617547 () Bool)

(assert (=> b!643374 m!617547))

(assert (=> b!643374 m!617503))

(declare-fun m!617549 () Bool)

(assert (=> b!643374 m!617549))

(assert (=> b!643374 m!617515))

(declare-fun m!617551 () Bool)

(assert (=> b!643374 m!617551))

(declare-fun m!617553 () Bool)

(assert (=> b!643374 m!617553))

(declare-fun m!617555 () Bool)

(assert (=> b!643368 m!617555))

(assert (=> b!643370 m!617503))

(check-sat (not b!643363) (not b!643376) (not b!643368) (not b!643365) (not b!643357) (not b!643366) (not b!643360) (not b!643378) (not b!643377) (not b!643359) (not start!58284) (not b!643374) (not b!643367))
(check-sat)
(get-model)

(declare-fun d!91045 () Bool)

(declare-fun res!416826 () Bool)

(declare-fun e!368609 () Bool)

(assert (=> d!91045 (=> res!416826 e!368609)))

(assert (=> d!91045 (= res!416826 (= (select (arr!18412 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91045 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!368609)))

(declare-fun b!643515 () Bool)

(declare-fun e!368610 () Bool)

(assert (=> b!643515 (= e!368609 e!368610)))

(declare-fun res!416827 () Bool)

(assert (=> b!643515 (=> (not res!416827) (not e!368610))))

(assert (=> b!643515 (= res!416827 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18776 a!2986)))))

(declare-fun b!643516 () Bool)

(assert (=> b!643516 (= e!368610 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91045 (not res!416826)) b!643515))

(assert (= (and b!643515 res!416827) b!643516))

(declare-fun m!617677 () Bool)

(assert (=> d!91045 m!617677))

(declare-fun m!617679 () Bool)

(assert (=> b!643516 m!617679))

(assert (=> b!643377 d!91045))

(declare-fun d!91047 () Bool)

(declare-fun res!416828 () Bool)

(declare-fun e!368611 () Bool)

(assert (=> d!91047 (=> res!416828 e!368611)))

(assert (=> d!91047 (= res!416828 (= (select (arr!18412 lt!298016) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18412 a!2986) j!136)))))

(assert (=> d!91047 (= (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!368611)))

(declare-fun b!643517 () Bool)

(declare-fun e!368612 () Bool)

(assert (=> b!643517 (= e!368611 e!368612)))

(declare-fun res!416829 () Bool)

(assert (=> b!643517 (=> (not res!416829) (not e!368612))))

(assert (=> b!643517 (= res!416829 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18776 lt!298016)))))

(declare-fun b!643518 () Bool)

(assert (=> b!643518 (= e!368612 (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91047 (not res!416828)) b!643517))

(assert (= (and b!643517 res!416829) b!643518))

(declare-fun m!617681 () Bool)

(assert (=> d!91047 m!617681))

(assert (=> b!643518 m!617503))

(declare-fun m!617683 () Bool)

(assert (=> b!643518 m!617683))

(assert (=> b!643366 d!91047))

(declare-fun d!91049 () Bool)

(assert (=> d!91049 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18776 lt!298016)) (not (= (select (arr!18412 lt!298016) j!136) (select (arr!18412 a!2986) j!136))))))

(declare-fun lt!298123 () Unit!21747)

(declare-fun choose!21 (array!38400 (_ BitVec 64) (_ BitVec 32) List!12360) Unit!21747)

(assert (=> d!91049 (= lt!298123 (choose!21 lt!298016 (select (arr!18412 a!2986) j!136) j!136 Nil!12357))))

(assert (=> d!91049 (bvslt (size!18776 lt!298016) #b01111111111111111111111111111111)))

(assert (=> d!91049 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298016 (select (arr!18412 a!2986) j!136) j!136 Nil!12357) lt!298123)))

(declare-fun bs!19262 () Bool)

(assert (= bs!19262 d!91049))

(declare-fun m!617685 () Bool)

(assert (=> bs!19262 m!617685))

(assert (=> bs!19262 m!617503))

(declare-fun m!617687 () Bool)

(assert (=> bs!19262 m!617687))

(assert (=> b!643366 d!91049))

(declare-fun b!643529 () Bool)

(declare-fun e!368622 () Bool)

(declare-fun e!368624 () Bool)

(assert (=> b!643529 (= e!368622 e!368624)))

(declare-fun res!416838 () Bool)

(assert (=> b!643529 (=> (not res!416838) (not e!368624))))

(declare-fun e!368623 () Bool)

(assert (=> b!643529 (= res!416838 (not e!368623))))

(declare-fun res!416836 () Bool)

(assert (=> b!643529 (=> (not res!416836) (not e!368623))))

(assert (=> b!643529 (= res!416836 (validKeyInArray!0 (select (arr!18412 lt!298016) j!136)))))

(declare-fun b!643530 () Bool)

(declare-fun e!368621 () Bool)

(declare-fun call!33594 () Bool)

(assert (=> b!643530 (= e!368621 call!33594)))

(declare-fun b!643531 () Bool)

(declare-fun contains!3121 (List!12360 (_ BitVec 64)) Bool)

(assert (=> b!643531 (= e!368623 (contains!3121 Nil!12357 (select (arr!18412 lt!298016) j!136)))))

(declare-fun d!91051 () Bool)

(declare-fun res!416837 () Bool)

(assert (=> d!91051 (=> res!416837 e!368622)))

(assert (=> d!91051 (= res!416837 (bvsge j!136 (size!18776 lt!298016)))))

(assert (=> d!91051 (= (arrayNoDuplicates!0 lt!298016 j!136 Nil!12357) e!368622)))

(declare-fun b!643532 () Bool)

(assert (=> b!643532 (= e!368624 e!368621)))

(declare-fun c!73715 () Bool)

(assert (=> b!643532 (= c!73715 (validKeyInArray!0 (select (arr!18412 lt!298016) j!136)))))

(declare-fun b!643533 () Bool)

(assert (=> b!643533 (= e!368621 call!33594)))

(declare-fun bm!33591 () Bool)

(assert (=> bm!33591 (= call!33594 (arrayNoDuplicates!0 lt!298016 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73715 (Cons!12356 (select (arr!18412 lt!298016) j!136) Nil!12357) Nil!12357)))))

(assert (= (and d!91051 (not res!416837)) b!643529))

(assert (= (and b!643529 res!416836) b!643531))

(assert (= (and b!643529 res!416838) b!643532))

(assert (= (and b!643532 c!73715) b!643530))

(assert (= (and b!643532 (not c!73715)) b!643533))

(assert (= (or b!643530 b!643533) bm!33591))

(assert (=> b!643529 m!617685))

(assert (=> b!643529 m!617685))

(declare-fun m!617689 () Bool)

(assert (=> b!643529 m!617689))

(assert (=> b!643531 m!617685))

(assert (=> b!643531 m!617685))

(declare-fun m!617691 () Bool)

(assert (=> b!643531 m!617691))

(assert (=> b!643532 m!617685))

(assert (=> b!643532 m!617685))

(assert (=> b!643532 m!617689))

(assert (=> bm!33591 m!617685))

(declare-fun m!617693 () Bool)

(assert (=> bm!33591 m!617693))

(assert (=> b!643366 d!91051))

(declare-fun d!91053 () Bool)

(assert (=> d!91053 (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298126 () Unit!21747)

(declare-fun choose!114 (array!38400 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21747)

(assert (=> d!91053 (= lt!298126 (choose!114 lt!298016 (select (arr!18412 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91053 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91053 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298016 (select (arr!18412 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!298126)))

(declare-fun bs!19263 () Bool)

(assert (= bs!19263 d!91053))

(assert (=> bs!19263 m!617503))

(assert (=> bs!19263 m!617527))

(assert (=> bs!19263 m!617503))

(declare-fun m!617695 () Bool)

(assert (=> bs!19263 m!617695))

(assert (=> b!643366 d!91053))

(declare-fun d!91055 () Bool)

(declare-fun e!368627 () Bool)

(assert (=> d!91055 e!368627))

(declare-fun res!416841 () Bool)

(assert (=> d!91055 (=> (not res!416841) (not e!368627))))

(assert (=> d!91055 (= res!416841 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18776 a!2986))))))

(declare-fun lt!298129 () Unit!21747)

(declare-fun choose!41 (array!38400 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12360) Unit!21747)

(assert (=> d!91055 (= lt!298129 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12357))))

(assert (=> d!91055 (bvslt (size!18776 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91055 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12357) lt!298129)))

(declare-fun b!643536 () Bool)

(assert (=> b!643536 (= e!368627 (arrayNoDuplicates!0 (array!38401 (store (arr!18412 a!2986) i!1108 k0!1786) (size!18776 a!2986)) #b00000000000000000000000000000000 Nil!12357))))

(assert (= (and d!91055 res!416841) b!643536))

(declare-fun m!617697 () Bool)

(assert (=> d!91055 m!617697))

(assert (=> b!643536 m!617515))

(declare-fun m!617699 () Bool)

(assert (=> b!643536 m!617699))

(assert (=> b!643366 d!91055))

(declare-fun d!91057 () Bool)

(assert (=> d!91057 (arrayNoDuplicates!0 lt!298016 j!136 Nil!12357)))

(declare-fun lt!298132 () Unit!21747)

(declare-fun choose!39 (array!38400 (_ BitVec 32) (_ BitVec 32)) Unit!21747)

(assert (=> d!91057 (= lt!298132 (choose!39 lt!298016 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91057 (bvslt (size!18776 lt!298016) #b01111111111111111111111111111111)))

(assert (=> d!91057 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!298016 #b00000000000000000000000000000000 j!136) lt!298132)))

(declare-fun bs!19264 () Bool)

(assert (= bs!19264 d!91057))

(assert (=> bs!19264 m!617535))

(declare-fun m!617701 () Bool)

(assert (=> bs!19264 m!617701))

(assert (=> b!643366 d!91057))

(declare-fun b!643537 () Bool)

(declare-fun e!368629 () Bool)

(declare-fun e!368631 () Bool)

(assert (=> b!643537 (= e!368629 e!368631)))

(declare-fun res!416844 () Bool)

(assert (=> b!643537 (=> (not res!416844) (not e!368631))))

(declare-fun e!368630 () Bool)

(assert (=> b!643537 (= res!416844 (not e!368630))))

(declare-fun res!416842 () Bool)

(assert (=> b!643537 (=> (not res!416842) (not e!368630))))

(assert (=> b!643537 (= res!416842 (validKeyInArray!0 (select (arr!18412 lt!298016) #b00000000000000000000000000000000)))))

(declare-fun b!643538 () Bool)

(declare-fun e!368628 () Bool)

(declare-fun call!33595 () Bool)

(assert (=> b!643538 (= e!368628 call!33595)))

(declare-fun b!643539 () Bool)

(assert (=> b!643539 (= e!368630 (contains!3121 Nil!12357 (select (arr!18412 lt!298016) #b00000000000000000000000000000000)))))

(declare-fun d!91059 () Bool)

(declare-fun res!416843 () Bool)

(assert (=> d!91059 (=> res!416843 e!368629)))

(assert (=> d!91059 (= res!416843 (bvsge #b00000000000000000000000000000000 (size!18776 lt!298016)))))

(assert (=> d!91059 (= (arrayNoDuplicates!0 lt!298016 #b00000000000000000000000000000000 Nil!12357) e!368629)))

(declare-fun b!643540 () Bool)

(assert (=> b!643540 (= e!368631 e!368628)))

(declare-fun c!73716 () Bool)

(assert (=> b!643540 (= c!73716 (validKeyInArray!0 (select (arr!18412 lt!298016) #b00000000000000000000000000000000)))))

(declare-fun b!643541 () Bool)

(assert (=> b!643541 (= e!368628 call!33595)))

(declare-fun bm!33592 () Bool)

(assert (=> bm!33592 (= call!33595 (arrayNoDuplicates!0 lt!298016 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73716 (Cons!12356 (select (arr!18412 lt!298016) #b00000000000000000000000000000000) Nil!12357) Nil!12357)))))

(assert (= (and d!91059 (not res!416843)) b!643537))

(assert (= (and b!643537 res!416842) b!643539))

(assert (= (and b!643537 res!416844) b!643540))

(assert (= (and b!643540 c!73716) b!643538))

(assert (= (and b!643540 (not c!73716)) b!643541))

(assert (= (or b!643538 b!643541) bm!33592))

(declare-fun m!617703 () Bool)

(assert (=> b!643537 m!617703))

(assert (=> b!643537 m!617703))

(declare-fun m!617705 () Bool)

(assert (=> b!643537 m!617705))

(assert (=> b!643539 m!617703))

(assert (=> b!643539 m!617703))

(declare-fun m!617707 () Bool)

(assert (=> b!643539 m!617707))

(assert (=> b!643540 m!617703))

(assert (=> b!643540 m!617703))

(assert (=> b!643540 m!617705))

(assert (=> bm!33592 m!617703))

(declare-fun m!617709 () Bool)

(assert (=> bm!33592 m!617709))

(assert (=> b!643366 d!91059))

(declare-fun d!91061 () Bool)

(declare-fun res!416845 () Bool)

(declare-fun e!368632 () Bool)

(assert (=> d!91061 (=> res!416845 e!368632)))

(assert (=> d!91061 (= res!416845 (= (select (arr!18412 lt!298016) index!984) (select (arr!18412 a!2986) j!136)))))

(assert (=> d!91061 (= (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) index!984) e!368632)))

(declare-fun b!643542 () Bool)

(declare-fun e!368633 () Bool)

(assert (=> b!643542 (= e!368632 e!368633)))

(declare-fun res!416846 () Bool)

(assert (=> b!643542 (=> (not res!416846) (not e!368633))))

(assert (=> b!643542 (= res!416846 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18776 lt!298016)))))

(declare-fun b!643543 () Bool)

(assert (=> b!643543 (= e!368633 (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91061 (not res!416845)) b!643542))

(assert (= (and b!643542 res!416846) b!643543))

(declare-fun m!617711 () Bool)

(assert (=> d!91061 m!617711))

(assert (=> b!643543 m!617503))

(declare-fun m!617713 () Bool)

(assert (=> b!643543 m!617713))

(assert (=> b!643376 d!91061))

(declare-fun d!91063 () Bool)

(declare-fun res!416847 () Bool)

(declare-fun e!368634 () Bool)

(assert (=> d!91063 (=> res!416847 e!368634)))

(assert (=> d!91063 (= res!416847 (= (select (arr!18412 lt!298016) j!136) (select (arr!18412 a!2986) j!136)))))

(assert (=> d!91063 (= (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) j!136) e!368634)))

(declare-fun b!643544 () Bool)

(declare-fun e!368635 () Bool)

(assert (=> b!643544 (= e!368634 e!368635)))

(declare-fun res!416848 () Bool)

(assert (=> b!643544 (=> (not res!416848) (not e!368635))))

(assert (=> b!643544 (= res!416848 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18776 lt!298016)))))

(declare-fun b!643545 () Bool)

(assert (=> b!643545 (= e!368635 (arrayContainsKey!0 lt!298016 (select (arr!18412 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91063 (not res!416847)) b!643544))

(assert (= (and b!643544 res!416848) b!643545))

(assert (=> d!91063 m!617685))

(assert (=> b!643545 m!617503))

(declare-fun m!617715 () Bool)

(assert (=> b!643545 m!617715))

(assert (=> b!643376 d!91063))

(declare-fun b!643554 () Bool)

(declare-fun e!368644 () Bool)

(declare-fun call!33598 () Bool)

(assert (=> b!643554 (= e!368644 call!33598)))

(declare-fun b!643555 () Bool)

(declare-fun e!368642 () Bool)

(assert (=> b!643555 (= e!368642 e!368644)))

(declare-fun lt!298141 () (_ BitVec 64))

(assert (=> b!643555 (= lt!298141 (select (arr!18412 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!298139 () Unit!21747)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38400 (_ BitVec 64) (_ BitVec 32)) Unit!21747)

(assert (=> b!643555 (= lt!298139 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!298141 #b00000000000000000000000000000000))))

(assert (=> b!643555 (arrayContainsKey!0 a!2986 lt!298141 #b00000000000000000000000000000000)))

(declare-fun lt!298140 () Unit!21747)

(assert (=> b!643555 (= lt!298140 lt!298139)))

(declare-fun res!416854 () Bool)

(assert (=> b!643555 (= res!416854 (= (seekEntryOrOpen!0 (select (arr!18412 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6808 #b00000000000000000000000000000000)))))

(assert (=> b!643555 (=> (not res!416854) (not e!368644))))

(declare-fun d!91065 () Bool)

(declare-fun res!416853 () Bool)

(declare-fun e!368643 () Bool)

(assert (=> d!91065 (=> res!416853 e!368643)))

(assert (=> d!91065 (= res!416853 (bvsge #b00000000000000000000000000000000 (size!18776 a!2986)))))

(assert (=> d!91065 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!368643)))

(declare-fun b!643556 () Bool)

(assert (=> b!643556 (= e!368642 call!33598)))

(declare-fun bm!33595 () Bool)

(assert (=> bm!33595 (= call!33598 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!643557 () Bool)

(assert (=> b!643557 (= e!368643 e!368642)))

(declare-fun c!73719 () Bool)

(assert (=> b!643557 (= c!73719 (validKeyInArray!0 (select (arr!18412 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91065 (not res!416853)) b!643557))

(assert (= (and b!643557 c!73719) b!643555))

(assert (= (and b!643557 (not c!73719)) b!643556))

(assert (= (and b!643555 res!416854) b!643554))

(assert (= (or b!643554 b!643556) bm!33595))

(assert (=> b!643555 m!617677))

(declare-fun m!617717 () Bool)

(assert (=> b!643555 m!617717))

(declare-fun m!617719 () Bool)

(assert (=> b!643555 m!617719))

(assert (=> b!643555 m!617677))

(declare-fun m!617721 () Bool)

(assert (=> b!643555 m!617721))

(declare-fun m!617723 () Bool)

(assert (=> bm!33595 m!617723))

(assert (=> b!643557 m!617677))

(assert (=> b!643557 m!617677))

(declare-fun m!617725 () Bool)

(assert (=> b!643557 m!617725))

(assert (=> b!643357 d!91065))

(declare-fun d!91067 () Bool)

(assert (=> d!91067 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58284 d!91067))

(declare-fun d!91069 () Bool)

(assert (=> d!91069 (= (array_inv!14271 a!2986) (bvsge (size!18776 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58284 d!91069))

(assert (=> b!643378 d!91063))

(declare-fun d!91071 () Bool)

(assert (=> d!91071 (= (validKeyInArray!0 (select (arr!18412 a!2986) j!136)) (and (not (= (select (arr!18412 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18412 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!643367 d!91071))

(declare-fun lt!298155 () SeekEntryResult!6808)

(declare-fun d!91073 () Bool)

(get-info :version)

(assert (=> d!91073 (and (or ((_ is Undefined!6808) lt!298155) (not ((_ is Found!6808) lt!298155)) (and (bvsge (index!29562 lt!298155) #b00000000000000000000000000000000) (bvslt (index!29562 lt!298155) (size!18776 a!2986)))) (or ((_ is Undefined!6808) lt!298155) ((_ is Found!6808) lt!298155) (not ((_ is MissingVacant!6808) lt!298155)) (not (= (index!29564 lt!298155) vacantSpotIndex!68)) (and (bvsge (index!29564 lt!298155) #b00000000000000000000000000000000) (bvslt (index!29564 lt!298155) (size!18776 a!2986)))) (or ((_ is Undefined!6808) lt!298155) (ite ((_ is Found!6808) lt!298155) (= (select (arr!18412 a!2986) (index!29562 lt!298155)) (select (arr!18412 a!2986) j!136)) (and ((_ is MissingVacant!6808) lt!298155) (= (index!29564 lt!298155) vacantSpotIndex!68) (= (select (arr!18412 a!2986) (index!29564 lt!298155)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368674 () SeekEntryResult!6808)

(assert (=> d!91073 (= lt!298155 e!368674)))

(declare-fun c!73729 () Bool)

(assert (=> d!91073 (= c!73729 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!298156 () (_ BitVec 64))

(assert (=> d!91073 (= lt!298156 (select (arr!18412 a!2986) lt!298019))))

(assert (=> d!91073 (validMask!0 mask!3053)))

(assert (=> d!91073 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298019 vacantSpotIndex!68 (select (arr!18412 a!2986) j!136) a!2986 mask!3053) lt!298155)))

(declare-fun b!643594 () Bool)

(declare-fun e!368673 () SeekEntryResult!6808)

(assert (=> b!643594 (= e!368673 (MissingVacant!6808 vacantSpotIndex!68))))

(declare-fun b!643595 () Bool)

(declare-fun e!368672 () SeekEntryResult!6808)

(assert (=> b!643595 (= e!368672 (Found!6808 lt!298019))))

(declare-fun b!643596 () Bool)

(assert (=> b!643596 (= e!368673 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!298019 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18412 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643597 () Bool)

(assert (=> b!643597 (= e!368674 Undefined!6808)))

(declare-fun b!643598 () Bool)

(declare-fun c!73730 () Bool)

(assert (=> b!643598 (= c!73730 (= lt!298156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643598 (= e!368672 e!368673)))

(declare-fun b!643599 () Bool)

(assert (=> b!643599 (= e!368674 e!368672)))

(declare-fun c!73731 () Bool)

(assert (=> b!643599 (= c!73731 (= lt!298156 (select (arr!18412 a!2986) j!136)))))

(assert (= (and d!91073 c!73729) b!643597))

(assert (= (and d!91073 (not c!73729)) b!643599))

(assert (= (and b!643599 c!73731) b!643595))

(assert (= (and b!643599 (not c!73731)) b!643598))

(assert (= (and b!643598 c!73730) b!643594))

(assert (= (and b!643598 (not c!73730)) b!643596))

(declare-fun m!617751 () Bool)

(assert (=> d!91073 m!617751))

(declare-fun m!617753 () Bool)

(assert (=> d!91073 m!617753))

(declare-fun m!617755 () Bool)

(assert (=> d!91073 m!617755))

(assert (=> d!91073 m!617519))

(declare-fun m!617757 () Bool)

(assert (=> b!643596 m!617757))

(assert (=> b!643596 m!617757))

(assert (=> b!643596 m!617503))

(declare-fun m!617759 () Bool)

(assert (=> b!643596 m!617759))

(assert (=> b!643374 d!91073))

(declare-fun d!91089 () Bool)

(declare-fun e!368685 () Bool)

(assert (=> d!91089 e!368685))

(declare-fun res!416877 () Bool)

(assert (=> d!91089 (=> (not res!416877) (not e!368685))))

(assert (=> d!91089 (= res!416877 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18776 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18776 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18776 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18776 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18776 a!2986))))))

(declare-fun lt!298163 () Unit!21747)

(declare-fun choose!9 (array!38400 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21747)

(assert (=> d!91089 (= lt!298163 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298019 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91089 (validMask!0 mask!3053)))

(assert (=> d!91089 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298019 vacantSpotIndex!68 mask!3053) lt!298163)))

(declare-fun b!643616 () Bool)

(assert (=> b!643616 (= e!368685 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298019 vacantSpotIndex!68 (select (arr!18412 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298019 vacantSpotIndex!68 (select (store (arr!18412 a!2986) i!1108 k0!1786) j!136) (array!38401 (store (arr!18412 a!2986) i!1108 k0!1786) (size!18776 a!2986)) mask!3053)))))

(assert (= (and d!91089 res!416877) b!643616))

(declare-fun m!617761 () Bool)

(assert (=> d!91089 m!617761))

(assert (=> d!91089 m!617519))

(assert (=> b!643616 m!617503))

(assert (=> b!643616 m!617545))

(declare-fun m!617763 () Bool)

(assert (=> b!643616 m!617763))

(assert (=> b!643616 m!617503))

(assert (=> b!643616 m!617547))

(assert (=> b!643616 m!617515))

(assert (=> b!643616 m!617545))

(assert (=> b!643374 d!91089))

(declare-fun lt!298168 () SeekEntryResult!6808)

(declare-fun d!91095 () Bool)

(assert (=> d!91095 (and (or ((_ is Undefined!6808) lt!298168) (not ((_ is Found!6808) lt!298168)) (and (bvsge (index!29562 lt!298168) #b00000000000000000000000000000000) (bvslt (index!29562 lt!298168) (size!18776 lt!298016)))) (or ((_ is Undefined!6808) lt!298168) ((_ is Found!6808) lt!298168) (not ((_ is MissingVacant!6808) lt!298168)) (not (= (index!29564 lt!298168) vacantSpotIndex!68)) (and (bvsge (index!29564 lt!298168) #b00000000000000000000000000000000) (bvslt (index!29564 lt!298168) (size!18776 lt!298016)))) (or ((_ is Undefined!6808) lt!298168) (ite ((_ is Found!6808) lt!298168) (= (select (arr!18412 lt!298016) (index!29562 lt!298168)) lt!298024) (and ((_ is MissingVacant!6808) lt!298168) (= (index!29564 lt!298168) vacantSpotIndex!68) (= (select (arr!18412 lt!298016) (index!29564 lt!298168)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368688 () SeekEntryResult!6808)

(assert (=> d!91095 (= lt!298168 e!368688)))

(declare-fun c!73738 () Bool)

(assert (=> d!91095 (= c!73738 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!298169 () (_ BitVec 64))

(assert (=> d!91095 (= lt!298169 (select (arr!18412 lt!298016) lt!298019))))

(assert (=> d!91095 (validMask!0 mask!3053)))

(assert (=> d!91095 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298019 vacantSpotIndex!68 lt!298024 lt!298016 mask!3053) lt!298168)))

(declare-fun b!643619 () Bool)

(declare-fun e!368687 () SeekEntryResult!6808)

(assert (=> b!643619 (= e!368687 (MissingVacant!6808 vacantSpotIndex!68))))

(declare-fun b!643620 () Bool)

(declare-fun e!368686 () SeekEntryResult!6808)

(assert (=> b!643620 (= e!368686 (Found!6808 lt!298019))))

(declare-fun b!643621 () Bool)

(assert (=> b!643621 (= e!368687 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!298019 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!298024 lt!298016 mask!3053))))

(declare-fun b!643622 () Bool)

(assert (=> b!643622 (= e!368688 Undefined!6808)))

(declare-fun b!643623 () Bool)

(declare-fun c!73739 () Bool)

(assert (=> b!643623 (= c!73739 (= lt!298169 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643623 (= e!368686 e!368687)))

(declare-fun b!643624 () Bool)

(assert (=> b!643624 (= e!368688 e!368686)))

(declare-fun c!73740 () Bool)

(assert (=> b!643624 (= c!73740 (= lt!298169 lt!298024))))

(assert (= (and d!91095 c!73738) b!643622))

(assert (= (and d!91095 (not c!73738)) b!643624))

(assert (= (and b!643624 c!73740) b!643620))

(assert (= (and b!643624 (not c!73740)) b!643623))

(assert (= (and b!643623 c!73739) b!643619))

(assert (= (and b!643623 (not c!73739)) b!643621))

(declare-fun m!617765 () Bool)

(assert (=> d!91095 m!617765))

(declare-fun m!617767 () Bool)

(assert (=> d!91095 m!617767))

(declare-fun m!617769 () Bool)

(assert (=> d!91095 m!617769))

(assert (=> d!91095 m!617519))

(assert (=> b!643621 m!617757))

(assert (=> b!643621 m!617757))

(declare-fun m!617771 () Bool)

(assert (=> b!643621 m!617771))

(assert (=> b!643374 d!91095))

(declare-fun d!91097 () Bool)

(declare-fun lt!298170 () SeekEntryResult!6808)

(assert (=> d!91097 (and (or ((_ is Undefined!6808) lt!298170) (not ((_ is Found!6808) lt!298170)) (and (bvsge (index!29562 lt!298170) #b00000000000000000000000000000000) (bvslt (index!29562 lt!298170) (size!18776 lt!298016)))) (or ((_ is Undefined!6808) lt!298170) ((_ is Found!6808) lt!298170) (not ((_ is MissingVacant!6808) lt!298170)) (not (= (index!29564 lt!298170) vacantSpotIndex!68)) (and (bvsge (index!29564 lt!298170) #b00000000000000000000000000000000) (bvslt (index!29564 lt!298170) (size!18776 lt!298016)))) (or ((_ is Undefined!6808) lt!298170) (ite ((_ is Found!6808) lt!298170) (= (select (arr!18412 lt!298016) (index!29562 lt!298170)) lt!298024) (and ((_ is MissingVacant!6808) lt!298170) (= (index!29564 lt!298170) vacantSpotIndex!68) (= (select (arr!18412 lt!298016) (index!29564 lt!298170)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368697 () SeekEntryResult!6808)

(assert (=> d!91097 (= lt!298170 e!368697)))

(declare-fun c!73747 () Bool)

(assert (=> d!91097 (= c!73747 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!298171 () (_ BitVec 64))

(assert (=> d!91097 (= lt!298171 (select (arr!18412 lt!298016) index!984))))

(assert (=> d!91097 (validMask!0 mask!3053)))

(assert (=> d!91097 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298024 lt!298016 mask!3053) lt!298170)))

(declare-fun b!643635 () Bool)

(declare-fun e!368696 () SeekEntryResult!6808)

(assert (=> b!643635 (= e!368696 (MissingVacant!6808 vacantSpotIndex!68))))

(declare-fun b!643636 () Bool)

(declare-fun e!368695 () SeekEntryResult!6808)

(assert (=> b!643636 (= e!368695 (Found!6808 index!984))))

(declare-fun b!643637 () Bool)

(assert (=> b!643637 (= e!368696 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!298024 lt!298016 mask!3053))))

(declare-fun b!643638 () Bool)

(assert (=> b!643638 (= e!368697 Undefined!6808)))

(declare-fun b!643639 () Bool)

(declare-fun c!73748 () Bool)

(assert (=> b!643639 (= c!73748 (= lt!298171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643639 (= e!368695 e!368696)))

(declare-fun b!643640 () Bool)

(assert (=> b!643640 (= e!368697 e!368695)))

(declare-fun c!73749 () Bool)

(assert (=> b!643640 (= c!73749 (= lt!298171 lt!298024))))

(assert (= (and d!91097 c!73747) b!643638))

(assert (= (and d!91097 (not c!73747)) b!643640))

(assert (= (and b!643640 c!73749) b!643636))

(assert (= (and b!643640 (not c!73749)) b!643639))

(assert (= (and b!643639 c!73748) b!643635))

(assert (= (and b!643639 (not c!73748)) b!643637))

(declare-fun m!617773 () Bool)

(assert (=> d!91097 m!617773))

(declare-fun m!617775 () Bool)

(assert (=> d!91097 m!617775))

(assert (=> d!91097 m!617711))

(assert (=> d!91097 m!617519))

(declare-fun m!617777 () Bool)

(assert (=> b!643637 m!617777))

(assert (=> b!643637 m!617777))

(declare-fun m!617781 () Bool)

(assert (=> b!643637 m!617781))

(assert (=> b!643374 d!91097))

(declare-fun d!91099 () Bool)

(declare-fun lt!298178 () (_ BitVec 32))

(assert (=> d!91099 (and (bvsge lt!298178 #b00000000000000000000000000000000) (bvslt lt!298178 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91099 (= lt!298178 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!91099 (validMask!0 mask!3053)))

(assert (=> d!91099 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!298178)))

(declare-fun bs!19265 () Bool)

(assert (= bs!19265 d!91099))

(declare-fun m!617793 () Bool)

(assert (=> bs!19265 m!617793))

(assert (=> bs!19265 m!617519))

(assert (=> b!643374 d!91099))

(assert (=> b!643363 d!91061))

(declare-fun d!91105 () Bool)

(assert (=> d!91105 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!643365 d!91105))

(declare-fun d!91107 () Bool)

(declare-fun lt!298179 () SeekEntryResult!6808)

(assert (=> d!91107 (and (or ((_ is Undefined!6808) lt!298179) (not ((_ is Found!6808) lt!298179)) (and (bvsge (index!29562 lt!298179) #b00000000000000000000000000000000) (bvslt (index!29562 lt!298179) (size!18776 a!2986)))) (or ((_ is Undefined!6808) lt!298179) ((_ is Found!6808) lt!298179) (not ((_ is MissingVacant!6808) lt!298179)) (not (= (index!29564 lt!298179) vacantSpotIndex!68)) (and (bvsge (index!29564 lt!298179) #b00000000000000000000000000000000) (bvslt (index!29564 lt!298179) (size!18776 a!2986)))) (or ((_ is Undefined!6808) lt!298179) (ite ((_ is Found!6808) lt!298179) (= (select (arr!18412 a!2986) (index!29562 lt!298179)) (select (arr!18412 a!2986) j!136)) (and ((_ is MissingVacant!6808) lt!298179) (= (index!29564 lt!298179) vacantSpotIndex!68) (= (select (arr!18412 a!2986) (index!29564 lt!298179)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368708 () SeekEntryResult!6808)

(assert (=> d!91107 (= lt!298179 e!368708)))

(declare-fun c!73756 () Bool)

(assert (=> d!91107 (= c!73756 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!298180 () (_ BitVec 64))

(assert (=> d!91107 (= lt!298180 (select (arr!18412 a!2986) index!984))))

(assert (=> d!91107 (validMask!0 mask!3053)))

(assert (=> d!91107 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18412 a!2986) j!136) a!2986 mask!3053) lt!298179)))

(declare-fun b!643655 () Bool)

(declare-fun e!368707 () SeekEntryResult!6808)

(assert (=> b!643655 (= e!368707 (MissingVacant!6808 vacantSpotIndex!68))))

(declare-fun b!643656 () Bool)

(declare-fun e!368706 () SeekEntryResult!6808)

(assert (=> b!643656 (= e!368706 (Found!6808 index!984))))

(declare-fun b!643657 () Bool)

(assert (=> b!643657 (= e!368707 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18412 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643658 () Bool)

(assert (=> b!643658 (= e!368708 Undefined!6808)))

(declare-fun b!643659 () Bool)

(declare-fun c!73757 () Bool)

(assert (=> b!643659 (= c!73757 (= lt!298180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643659 (= e!368706 e!368707)))

(declare-fun b!643660 () Bool)

(assert (=> b!643660 (= e!368708 e!368706)))

(declare-fun c!73758 () Bool)

(assert (=> b!643660 (= c!73758 (= lt!298180 (select (arr!18412 a!2986) j!136)))))

(assert (= (and d!91107 c!73756) b!643658))

(assert (= (and d!91107 (not c!73756)) b!643660))

(assert (= (and b!643660 c!73758) b!643656))

(assert (= (and b!643660 (not c!73758)) b!643659))

(assert (= (and b!643659 c!73757) b!643655))

(assert (= (and b!643659 (not c!73757)) b!643657))

(declare-fun m!617803 () Bool)

(assert (=> d!91107 m!617803))

(declare-fun m!617805 () Bool)

(assert (=> d!91107 m!617805))

(assert (=> d!91107 m!617501))

(assert (=> d!91107 m!617519))

(assert (=> b!643657 m!617777))

(assert (=> b!643657 m!617777))

(assert (=> b!643657 m!617503))

(declare-fun m!617807 () Bool)

(assert (=> b!643657 m!617807))

(assert (=> b!643360 d!91107))

(declare-fun b!643667 () Bool)

(declare-fun e!368713 () Bool)

(declare-fun e!368715 () Bool)

(assert (=> b!643667 (= e!368713 e!368715)))

(declare-fun res!416882 () Bool)

(assert (=> b!643667 (=> (not res!416882) (not e!368715))))

(declare-fun e!368714 () Bool)

(assert (=> b!643667 (= res!416882 (not e!368714))))

(declare-fun res!416880 () Bool)

(assert (=> b!643667 (=> (not res!416880) (not e!368714))))

(assert (=> b!643667 (= res!416880 (validKeyInArray!0 (select (arr!18412 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643668 () Bool)

(declare-fun e!368712 () Bool)

(declare-fun call!33602 () Bool)

(assert (=> b!643668 (= e!368712 call!33602)))

(declare-fun b!643669 () Bool)

(assert (=> b!643669 (= e!368714 (contains!3121 Nil!12357 (select (arr!18412 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91111 () Bool)

(declare-fun res!416881 () Bool)

(assert (=> d!91111 (=> res!416881 e!368713)))

(assert (=> d!91111 (= res!416881 (bvsge #b00000000000000000000000000000000 (size!18776 a!2986)))))

(assert (=> d!91111 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12357) e!368713)))

(declare-fun b!643670 () Bool)

(assert (=> b!643670 (= e!368715 e!368712)))

(declare-fun c!73762 () Bool)

(assert (=> b!643670 (= c!73762 (validKeyInArray!0 (select (arr!18412 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643671 () Bool)

(assert (=> b!643671 (= e!368712 call!33602)))

(declare-fun bm!33599 () Bool)

(assert (=> bm!33599 (= call!33602 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73762 (Cons!12356 (select (arr!18412 a!2986) #b00000000000000000000000000000000) Nil!12357) Nil!12357)))))

(assert (= (and d!91111 (not res!416881)) b!643667))

(assert (= (and b!643667 res!416880) b!643669))

(assert (= (and b!643667 res!416882) b!643670))

(assert (= (and b!643670 c!73762) b!643668))

(assert (= (and b!643670 (not c!73762)) b!643671))

(assert (= (or b!643668 b!643671) bm!33599))

(assert (=> b!643667 m!617677))

(assert (=> b!643667 m!617677))

(assert (=> b!643667 m!617725))

(assert (=> b!643669 m!617677))

(assert (=> b!643669 m!617677))

(declare-fun m!617821 () Bool)

(assert (=> b!643669 m!617821))

(assert (=> b!643670 m!617677))

(assert (=> b!643670 m!617677))

(assert (=> b!643670 m!617725))

(assert (=> bm!33599 m!617677))

(declare-fun m!617823 () Bool)

(assert (=> bm!33599 m!617823))

(assert (=> b!643368 d!91111))

(declare-fun b!643733 () Bool)

(declare-fun e!368762 () SeekEntryResult!6808)

(declare-fun e!368760 () SeekEntryResult!6808)

(assert (=> b!643733 (= e!368762 e!368760)))

(declare-fun lt!298211 () (_ BitVec 64))

(declare-fun lt!298212 () SeekEntryResult!6808)

(assert (=> b!643733 (= lt!298211 (select (arr!18412 a!2986) (index!29563 lt!298212)))))

(declare-fun c!73781 () Bool)

(assert (=> b!643733 (= c!73781 (= lt!298211 k0!1786))))

(declare-fun d!91117 () Bool)

(declare-fun lt!298213 () SeekEntryResult!6808)

(assert (=> d!91117 (and (or ((_ is Undefined!6808) lt!298213) (not ((_ is Found!6808) lt!298213)) (and (bvsge (index!29562 lt!298213) #b00000000000000000000000000000000) (bvslt (index!29562 lt!298213) (size!18776 a!2986)))) (or ((_ is Undefined!6808) lt!298213) ((_ is Found!6808) lt!298213) (not ((_ is MissingZero!6808) lt!298213)) (and (bvsge (index!29561 lt!298213) #b00000000000000000000000000000000) (bvslt (index!29561 lt!298213) (size!18776 a!2986)))) (or ((_ is Undefined!6808) lt!298213) ((_ is Found!6808) lt!298213) ((_ is MissingZero!6808) lt!298213) (not ((_ is MissingVacant!6808) lt!298213)) (and (bvsge (index!29564 lt!298213) #b00000000000000000000000000000000) (bvslt (index!29564 lt!298213) (size!18776 a!2986)))) (or ((_ is Undefined!6808) lt!298213) (ite ((_ is Found!6808) lt!298213) (= (select (arr!18412 a!2986) (index!29562 lt!298213)) k0!1786) (ite ((_ is MissingZero!6808) lt!298213) (= (select (arr!18412 a!2986) (index!29561 lt!298213)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6808) lt!298213) (= (select (arr!18412 a!2986) (index!29564 lt!298213)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91117 (= lt!298213 e!368762)))

(declare-fun c!73782 () Bool)

(assert (=> d!91117 (= c!73782 (and ((_ is Intermediate!6808) lt!298212) (undefined!7620 lt!298212)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38400 (_ BitVec 32)) SeekEntryResult!6808)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91117 (= lt!298212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91117 (validMask!0 mask!3053)))

(assert (=> d!91117 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!298213)))

(declare-fun b!643734 () Bool)

(assert (=> b!643734 (= e!368762 Undefined!6808)))

(declare-fun e!368761 () SeekEntryResult!6808)

(declare-fun b!643735 () Bool)

(assert (=> b!643735 (= e!368761 (seekKeyOrZeroReturnVacant!0 (x!58482 lt!298212) (index!29563 lt!298212) (index!29563 lt!298212) k0!1786 a!2986 mask!3053))))

(declare-fun b!643736 () Bool)

(declare-fun c!73780 () Bool)

(assert (=> b!643736 (= c!73780 (= lt!298211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643736 (= e!368760 e!368761)))

(declare-fun b!643737 () Bool)

(assert (=> b!643737 (= e!368761 (MissingZero!6808 (index!29563 lt!298212)))))

(declare-fun b!643738 () Bool)

(assert (=> b!643738 (= e!368760 (Found!6808 (index!29563 lt!298212)))))

(assert (= (and d!91117 c!73782) b!643734))

(assert (= (and d!91117 (not c!73782)) b!643733))

(assert (= (and b!643733 c!73781) b!643738))

(assert (= (and b!643733 (not c!73781)) b!643736))

(assert (= (and b!643736 c!73780) b!643737))

(assert (= (and b!643736 (not c!73780)) b!643735))

(declare-fun m!617881 () Bool)

(assert (=> b!643733 m!617881))

(assert (=> d!91117 m!617519))

(declare-fun m!617883 () Bool)

(assert (=> d!91117 m!617883))

(declare-fun m!617885 () Bool)

(assert (=> d!91117 m!617885))

(declare-fun m!617887 () Bool)

(assert (=> d!91117 m!617887))

(declare-fun m!617889 () Bool)

(assert (=> d!91117 m!617889))

(assert (=> d!91117 m!617889))

(declare-fun m!617891 () Bool)

(assert (=> d!91117 m!617891))

(declare-fun m!617893 () Bool)

(assert (=> b!643735 m!617893))

(assert (=> b!643359 d!91117))

(check-sat (not b!643539) (not d!91053) (not b!643536) (not d!91055) (not d!91107) (not bm!33599) (not b!643596) (not b!643670) (not b!643545) (not d!91073) (not b!643555) (not b!643531) (not b!643735) (not b!643657) (not b!643543) (not b!643532) (not d!91097) (not b!643540) (not bm!33591) (not b!643616) (not bm!33595) (not d!91117) (not d!91089) (not b!643537) (not d!91099) (not d!91049) (not b!643557) (not b!643667) (not b!643669) (not b!643621) (not b!643516) (not b!643637) (not d!91095) (not bm!33592) (not b!643518) (not d!91057) (not b!643529))
(check-sat)
