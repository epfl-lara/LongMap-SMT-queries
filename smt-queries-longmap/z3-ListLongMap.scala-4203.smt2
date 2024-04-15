; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57422 () Bool)

(assert start!57422)

(declare-fun b!635364 () Bool)

(declare-fun e!363391 () Bool)

(declare-fun e!363387 () Bool)

(assert (=> b!635364 (= e!363391 e!363387)))

(declare-fun res!411116 () Bool)

(assert (=> b!635364 (=> (not res!411116) (not e!363387))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38223 0))(
  ( (array!38224 (arr!18338 (Array (_ BitVec 32) (_ BitVec 64))) (size!18703 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38223)

(assert (=> b!635364 (= res!411116 (= (select (store (arr!18338 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293670 () array!38223)

(assert (=> b!635364 (= lt!293670 (array!38224 (store (arr!18338 a!2986) i!1108 k0!1786) (size!18703 a!2986)))))

(declare-fun b!635365 () Bool)

(declare-fun e!363393 () Bool)

(declare-datatypes ((SeekEntryResult!6775 0))(
  ( (MissingZero!6775 (index!29405 (_ BitVec 32))) (Found!6775 (index!29406 (_ BitVec 32))) (Intermediate!6775 (undefined!7587 Bool) (index!29407 (_ BitVec 32)) (x!58161 (_ BitVec 32))) (Undefined!6775) (MissingVacant!6775 (index!29408 (_ BitVec 32))) )
))
(declare-fun lt!293676 () SeekEntryResult!6775)

(declare-fun lt!293669 () SeekEntryResult!6775)

(assert (=> b!635365 (= e!363393 (= lt!293676 lt!293669))))

(declare-fun b!635366 () Bool)

(declare-fun res!411115 () Bool)

(declare-fun e!363392 () Bool)

(assert (=> b!635366 (=> (not res!411115) (not e!363392))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635366 (= res!411115 (validKeyInArray!0 (select (arr!18338 a!2986) j!136)))))

(declare-fun b!635367 () Bool)

(declare-fun res!411112 () Bool)

(assert (=> b!635367 (=> (not res!411112) (not e!363392))))

(assert (=> b!635367 (= res!411112 (validKeyInArray!0 k0!1786))))

(declare-fun b!635368 () Bool)

(declare-fun e!363396 () Bool)

(declare-fun e!363397 () Bool)

(assert (=> b!635368 (= e!363396 (not e!363397))))

(declare-fun res!411111 () Bool)

(assert (=> b!635368 (=> res!411111 e!363397)))

(declare-fun lt!293672 () SeekEntryResult!6775)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635368 (= res!411111 (not (= lt!293672 (Found!6775 index!984))))))

(declare-datatypes ((Unit!21428 0))(
  ( (Unit!21429) )
))
(declare-fun lt!293679 () Unit!21428)

(declare-fun e!363395 () Unit!21428)

(assert (=> b!635368 (= lt!293679 e!363395)))

(declare-fun c!72498 () Bool)

(assert (=> b!635368 (= c!72498 (= lt!293672 Undefined!6775))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!293673 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38223 (_ BitVec 32)) SeekEntryResult!6775)

(assert (=> b!635368 (= lt!293672 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293673 lt!293670 mask!3053))))

(assert (=> b!635368 e!363393))

(declare-fun res!411118 () Bool)

(assert (=> b!635368 (=> (not res!411118) (not e!363393))))

(declare-fun lt!293671 () (_ BitVec 32))

(assert (=> b!635368 (= res!411118 (= lt!293669 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293671 vacantSpotIndex!68 lt!293673 lt!293670 mask!3053)))))

(assert (=> b!635368 (= lt!293669 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293671 vacantSpotIndex!68 (select (arr!18338 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635368 (= lt!293673 (select (store (arr!18338 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293675 () Unit!21428)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38223 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21428)

(assert (=> b!635368 (= lt!293675 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293671 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635368 (= lt!293671 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635369 () Bool)

(declare-fun res!411109 () Bool)

(assert (=> b!635369 (=> (not res!411109) (not e!363392))))

(assert (=> b!635369 (= res!411109 (and (= (size!18703 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18703 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18703 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635370 () Bool)

(declare-fun res!411102 () Bool)

(assert (=> b!635370 (=> (not res!411102) (not e!363391))))

(assert (=> b!635370 (= res!411102 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18338 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635371 () Bool)

(declare-fun Unit!21430 () Unit!21428)

(assert (=> b!635371 (= e!363395 Unit!21430)))

(assert (=> b!635371 false))

(declare-fun b!635372 () Bool)

(declare-fun res!411113 () Bool)

(assert (=> b!635372 (=> (not res!411113) (not e!363392))))

(declare-fun arrayContainsKey!0 (array!38223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635372 (= res!411113 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635373 () Bool)

(declare-fun res!411117 () Bool)

(assert (=> b!635373 (=> (not res!411117) (not e!363391))))

(declare-datatypes ((List!12418 0))(
  ( (Nil!12415) (Cons!12414 (h!13459 (_ BitVec 64)) (t!18637 List!12418)) )
))
(declare-fun arrayNoDuplicates!0 (array!38223 (_ BitVec 32) List!12418) Bool)

(assert (=> b!635373 (= res!411117 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12415))))

(declare-fun b!635374 () Bool)

(declare-fun Unit!21431 () Unit!21428)

(assert (=> b!635374 (= e!363395 Unit!21431)))

(declare-fun b!635375 () Bool)

(declare-fun e!363390 () Bool)

(declare-fun e!363394 () Bool)

(assert (=> b!635375 (= e!363390 e!363394)))

(declare-fun res!411104 () Bool)

(assert (=> b!635375 (=> (not res!411104) (not e!363394))))

(assert (=> b!635375 (= res!411104 (arrayContainsKey!0 lt!293670 (select (arr!18338 a!2986) j!136) j!136))))

(declare-fun res!411106 () Bool)

(assert (=> start!57422 (=> (not res!411106) (not e!363392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57422 (= res!411106 (validMask!0 mask!3053))))

(assert (=> start!57422 e!363392))

(assert (=> start!57422 true))

(declare-fun array_inv!14221 (array!38223) Bool)

(assert (=> start!57422 (array_inv!14221 a!2986)))

(declare-fun b!635376 () Bool)

(declare-fun e!363388 () Bool)

(assert (=> b!635376 (= e!363397 e!363388)))

(declare-fun res!411105 () Bool)

(assert (=> b!635376 (=> res!411105 e!363388)))

(declare-fun lt!293677 () (_ BitVec 64))

(assert (=> b!635376 (= res!411105 (or (not (= (select (arr!18338 a!2986) j!136) lt!293673)) (not (= (select (arr!18338 a!2986) j!136) lt!293677)) (bvsge j!136 index!984)))))

(declare-fun e!363398 () Bool)

(assert (=> b!635376 e!363398))

(declare-fun res!411103 () Bool)

(assert (=> b!635376 (=> (not res!411103) (not e!363398))))

(assert (=> b!635376 (= res!411103 (= lt!293677 (select (arr!18338 a!2986) j!136)))))

(assert (=> b!635376 (= lt!293677 (select (store (arr!18338 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!635377 () Bool)

(assert (=> b!635377 (= e!363394 (arrayContainsKey!0 lt!293670 (select (arr!18338 a!2986) j!136) index!984))))

(declare-fun b!635378 () Bool)

(assert (=> b!635378 (= e!363387 e!363396)))

(declare-fun res!411107 () Bool)

(assert (=> b!635378 (=> (not res!411107) (not e!363396))))

(assert (=> b!635378 (= res!411107 (and (= lt!293676 (Found!6775 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18338 a!2986) index!984) (select (arr!18338 a!2986) j!136))) (not (= (select (arr!18338 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635378 (= lt!293676 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18338 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635379 () Bool)

(assert (=> b!635379 (= e!363392 e!363391)))

(declare-fun res!411114 () Bool)

(assert (=> b!635379 (=> (not res!411114) (not e!363391))))

(declare-fun lt!293674 () SeekEntryResult!6775)

(assert (=> b!635379 (= res!411114 (or (= lt!293674 (MissingZero!6775 i!1108)) (= lt!293674 (MissingVacant!6775 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38223 (_ BitVec 32)) SeekEntryResult!6775)

(assert (=> b!635379 (= lt!293674 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!635380 () Bool)

(assert (=> b!635380 (= e!363388 (or (bvsge (size!18703 a!2986) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!18703 a!2986))))))

(assert (=> b!635380 (arrayContainsKey!0 lt!293670 (select (arr!18338 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293678 () Unit!21428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38223 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21428)

(assert (=> b!635380 (= lt!293678 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293670 (select (arr!18338 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635381 () Bool)

(assert (=> b!635381 (= e!363398 e!363390)))

(declare-fun res!411108 () Bool)

(assert (=> b!635381 (=> res!411108 e!363390)))

(assert (=> b!635381 (= res!411108 (or (not (= (select (arr!18338 a!2986) j!136) lt!293673)) (not (= (select (arr!18338 a!2986) j!136) lt!293677)) (bvsge j!136 index!984)))))

(declare-fun b!635382 () Bool)

(declare-fun res!411110 () Bool)

(assert (=> b!635382 (=> (not res!411110) (not e!363391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38223 (_ BitVec 32)) Bool)

(assert (=> b!635382 (= res!411110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!57422 res!411106) b!635369))

(assert (= (and b!635369 res!411109) b!635366))

(assert (= (and b!635366 res!411115) b!635367))

(assert (= (and b!635367 res!411112) b!635372))

(assert (= (and b!635372 res!411113) b!635379))

(assert (= (and b!635379 res!411114) b!635382))

(assert (= (and b!635382 res!411110) b!635373))

(assert (= (and b!635373 res!411117) b!635370))

(assert (= (and b!635370 res!411102) b!635364))

(assert (= (and b!635364 res!411116) b!635378))

(assert (= (and b!635378 res!411107) b!635368))

(assert (= (and b!635368 res!411118) b!635365))

(assert (= (and b!635368 c!72498) b!635371))

(assert (= (and b!635368 (not c!72498)) b!635374))

(assert (= (and b!635368 (not res!411111)) b!635376))

(assert (= (and b!635376 res!411103) b!635381))

(assert (= (and b!635381 (not res!411108)) b!635375))

(assert (= (and b!635375 res!411104) b!635377))

(assert (= (and b!635376 (not res!411105)) b!635380))

(declare-fun m!609207 () Bool)

(assert (=> b!635372 m!609207))

(declare-fun m!609209 () Bool)

(assert (=> b!635373 m!609209))

(declare-fun m!609211 () Bool)

(assert (=> b!635382 m!609211))

(declare-fun m!609213 () Bool)

(assert (=> b!635367 m!609213))

(declare-fun m!609215 () Bool)

(assert (=> b!635370 m!609215))

(declare-fun m!609217 () Bool)

(assert (=> b!635377 m!609217))

(assert (=> b!635377 m!609217))

(declare-fun m!609219 () Bool)

(assert (=> b!635377 m!609219))

(declare-fun m!609221 () Bool)

(assert (=> b!635368 m!609221))

(declare-fun m!609223 () Bool)

(assert (=> b!635368 m!609223))

(declare-fun m!609225 () Bool)

(assert (=> b!635368 m!609225))

(assert (=> b!635368 m!609217))

(declare-fun m!609227 () Bool)

(assert (=> b!635368 m!609227))

(declare-fun m!609229 () Bool)

(assert (=> b!635368 m!609229))

(declare-fun m!609231 () Bool)

(assert (=> b!635368 m!609231))

(assert (=> b!635368 m!609217))

(declare-fun m!609233 () Bool)

(assert (=> b!635368 m!609233))

(assert (=> b!635366 m!609217))

(assert (=> b!635366 m!609217))

(declare-fun m!609235 () Bool)

(assert (=> b!635366 m!609235))

(declare-fun m!609237 () Bool)

(assert (=> b!635379 m!609237))

(assert (=> b!635364 m!609227))

(declare-fun m!609239 () Bool)

(assert (=> b!635364 m!609239))

(assert (=> b!635381 m!609217))

(assert (=> b!635380 m!609217))

(assert (=> b!635380 m!609217))

(declare-fun m!609241 () Bool)

(assert (=> b!635380 m!609241))

(assert (=> b!635380 m!609217))

(declare-fun m!609243 () Bool)

(assert (=> b!635380 m!609243))

(declare-fun m!609245 () Bool)

(assert (=> start!57422 m!609245))

(declare-fun m!609247 () Bool)

(assert (=> start!57422 m!609247))

(declare-fun m!609249 () Bool)

(assert (=> b!635378 m!609249))

(assert (=> b!635378 m!609217))

(assert (=> b!635378 m!609217))

(declare-fun m!609251 () Bool)

(assert (=> b!635378 m!609251))

(assert (=> b!635376 m!609217))

(assert (=> b!635376 m!609227))

(declare-fun m!609253 () Bool)

(assert (=> b!635376 m!609253))

(assert (=> b!635375 m!609217))

(assert (=> b!635375 m!609217))

(declare-fun m!609255 () Bool)

(assert (=> b!635375 m!609255))

(check-sat (not b!635378) (not b!635372) (not b!635373) (not b!635379) (not b!635367) (not b!635375) (not b!635377) (not b!635368) (not start!57422) (not b!635382) (not b!635380) (not b!635366))
(check-sat)
