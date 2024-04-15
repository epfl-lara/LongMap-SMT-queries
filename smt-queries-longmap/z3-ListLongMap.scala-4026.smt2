; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54846 () Bool)

(assert start!54846)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!599452 () Bool)

(declare-fun e!342708 () Bool)

(declare-datatypes ((array!37095 0))(
  ( (array!37096 (arr!17807 (Array (_ BitVec 32) (_ BitVec 64))) (size!18172 (_ BitVec 32))) )
))
(declare-fun lt!272451 () array!37095)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37095)

(declare-fun arrayContainsKey!0 (array!37095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599452 (= e!342708 (arrayContainsKey!0 lt!272451 (select (arr!17807 a!2986) j!136) index!984))))

(declare-fun b!599453 () Bool)

(declare-fun res!384551 () Bool)

(declare-fun e!342706 () Bool)

(assert (=> b!599453 (=> (not res!384551) (not e!342706))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599453 (= res!384551 (and (= (size!18172 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18172 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18172 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599454 () Bool)

(declare-fun res!384560 () Bool)

(declare-fun e!342704 () Bool)

(assert (=> b!599454 (=> res!384560 e!342704)))

(declare-datatypes ((List!11887 0))(
  ( (Nil!11884) (Cons!11883 (h!12928 (_ BitVec 64)) (t!18106 List!11887)) )
))
(declare-fun noDuplicate!287 (List!11887) Bool)

(assert (=> b!599454 (= res!384560 (not (noDuplicate!287 Nil!11884)))))

(declare-fun b!599456 () Bool)

(declare-fun e!342707 () Bool)

(declare-datatypes ((SeekEntryResult!6244 0))(
  ( (MissingZero!6244 (index!27233 (_ BitVec 32))) (Found!6244 (index!27234 (_ BitVec 32))) (Intermediate!6244 (undefined!7056 Bool) (index!27235 (_ BitVec 32)) (x!56046 (_ BitVec 32))) (Undefined!6244) (MissingVacant!6244 (index!27236 (_ BitVec 32))) )
))
(declare-fun lt!272454 () SeekEntryResult!6244)

(declare-fun lt!272453 () SeekEntryResult!6244)

(assert (=> b!599456 (= e!342707 (= lt!272454 lt!272453))))

(declare-fun b!599457 () Bool)

(declare-fun e!342700 () Bool)

(declare-fun e!342701 () Bool)

(assert (=> b!599457 (= e!342700 e!342701)))

(declare-fun res!384553 () Bool)

(assert (=> b!599457 (=> res!384553 e!342701)))

(declare-fun lt!272449 () (_ BitVec 64))

(declare-fun lt!272445 () (_ BitVec 64))

(assert (=> b!599457 (= res!384553 (or (not (= (select (arr!17807 a!2986) j!136) lt!272449)) (not (= (select (arr!17807 a!2986) j!136) lt!272445)) (bvsge j!136 index!984)))))

(declare-fun e!342699 () Bool)

(assert (=> b!599457 e!342699))

(declare-fun res!384547 () Bool)

(assert (=> b!599457 (=> (not res!384547) (not e!342699))))

(assert (=> b!599457 (= res!384547 (= lt!272445 (select (arr!17807 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!599457 (= lt!272445 (select (store (arr!17807 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599458 () Bool)

(declare-fun e!342697 () Bool)

(assert (=> b!599458 (= e!342699 e!342697)))

(declare-fun res!384554 () Bool)

(assert (=> b!599458 (=> res!384554 e!342697)))

(assert (=> b!599458 (= res!384554 (or (not (= (select (arr!17807 a!2986) j!136) lt!272449)) (not (= (select (arr!17807 a!2986) j!136) lt!272445)) (bvsge j!136 index!984)))))

(declare-fun b!599459 () Bool)

(declare-fun e!342702 () Bool)

(declare-fun e!342698 () Bool)

(assert (=> b!599459 (= e!342702 e!342698)))

(declare-fun res!384550 () Bool)

(assert (=> b!599459 (=> (not res!384550) (not e!342698))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599459 (= res!384550 (and (= lt!272454 (Found!6244 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17807 a!2986) index!984) (select (arr!17807 a!2986) j!136))) (not (= (select (arr!17807 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37095 (_ BitVec 32)) SeekEntryResult!6244)

(assert (=> b!599459 (= lt!272454 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17807 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599460 () Bool)

(declare-fun res!384562 () Bool)

(declare-fun e!342696 () Bool)

(assert (=> b!599460 (=> (not res!384562) (not e!342696))))

(declare-fun arrayNoDuplicates!0 (array!37095 (_ BitVec 32) List!11887) Bool)

(assert (=> b!599460 (= res!384562 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11884))))

(declare-fun b!599461 () Bool)

(declare-fun res!384549 () Bool)

(assert (=> b!599461 (=> (not res!384549) (not e!342706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599461 (= res!384549 (validKeyInArray!0 k0!1786))))

(declare-fun b!599462 () Bool)

(assert (=> b!599462 (= e!342697 e!342708)))

(declare-fun res!384546 () Bool)

(assert (=> b!599462 (=> (not res!384546) (not e!342708))))

(assert (=> b!599462 (= res!384546 (arrayContainsKey!0 lt!272451 (select (arr!17807 a!2986) j!136) j!136))))

(declare-fun b!599463 () Bool)

(declare-fun res!384563 () Bool)

(assert (=> b!599463 (=> (not res!384563) (not e!342696))))

(assert (=> b!599463 (= res!384563 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17807 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599464 () Bool)

(declare-fun res!384552 () Bool)

(assert (=> b!599464 (=> (not res!384552) (not e!342706))))

(assert (=> b!599464 (= res!384552 (validKeyInArray!0 (select (arr!17807 a!2986) j!136)))))

(declare-fun b!599465 () Bool)

(assert (=> b!599465 (= e!342701 e!342704)))

(declare-fun res!384548 () Bool)

(assert (=> b!599465 (=> res!384548 e!342704)))

(assert (=> b!599465 (= res!384548 (or (bvsge (size!18172 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18172 a!2986))))))

(assert (=> b!599465 (arrayNoDuplicates!0 lt!272451 j!136 Nil!11884)))

(declare-datatypes ((Unit!18888 0))(
  ( (Unit!18889) )
))
(declare-fun lt!272448 () Unit!18888)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37095 (_ BitVec 32) (_ BitVec 32)) Unit!18888)

(assert (=> b!599465 (= lt!272448 (lemmaNoDuplicateFromThenFromBigger!0 lt!272451 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599465 (arrayNoDuplicates!0 lt!272451 #b00000000000000000000000000000000 Nil!11884)))

(declare-fun lt!272444 () Unit!18888)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37095 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11887) Unit!18888)

(assert (=> b!599465 (= lt!272444 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11884))))

(assert (=> b!599465 (arrayContainsKey!0 lt!272451 (select (arr!17807 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272452 () Unit!18888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37095 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18888)

(assert (=> b!599465 (= lt!272452 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272451 (select (arr!17807 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599466 () Bool)

(declare-fun res!384555 () Bool)

(assert (=> b!599466 (=> (not res!384555) (not e!342696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37095 (_ BitVec 32)) Bool)

(assert (=> b!599466 (= res!384555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599467 () Bool)

(declare-fun e!342703 () Unit!18888)

(declare-fun Unit!18890 () Unit!18888)

(assert (=> b!599467 (= e!342703 Unit!18890)))

(assert (=> b!599467 false))

(declare-fun b!599468 () Bool)

(assert (=> b!599468 (= e!342696 e!342702)))

(declare-fun res!384557 () Bool)

(assert (=> b!599468 (=> (not res!384557) (not e!342702))))

(assert (=> b!599468 (= res!384557 (= (select (store (arr!17807 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599468 (= lt!272451 (array!37096 (store (arr!17807 a!2986) i!1108 k0!1786) (size!18172 a!2986)))))

(declare-fun b!599469 () Bool)

(declare-fun res!384558 () Bool)

(assert (=> b!599469 (=> res!384558 e!342704)))

(declare-fun contains!2952 (List!11887 (_ BitVec 64)) Bool)

(assert (=> b!599469 (= res!384558 (contains!2952 Nil!11884 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!384544 () Bool)

(assert (=> start!54846 (=> (not res!384544) (not e!342706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54846 (= res!384544 (validMask!0 mask!3053))))

(assert (=> start!54846 e!342706))

(assert (=> start!54846 true))

(declare-fun array_inv!13690 (array!37095) Bool)

(assert (=> start!54846 (array_inv!13690 a!2986)))

(declare-fun b!599455 () Bool)

(declare-fun res!384556 () Bool)

(assert (=> b!599455 (=> (not res!384556) (not e!342706))))

(assert (=> b!599455 (= res!384556 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599470 () Bool)

(assert (=> b!599470 (= e!342698 (not e!342700))))

(declare-fun res!384561 () Bool)

(assert (=> b!599470 (=> res!384561 e!342700)))

(declare-fun lt!272455 () SeekEntryResult!6244)

(assert (=> b!599470 (= res!384561 (not (= lt!272455 (Found!6244 index!984))))))

(declare-fun lt!272446 () Unit!18888)

(assert (=> b!599470 (= lt!272446 e!342703)))

(declare-fun c!67821 () Bool)

(assert (=> b!599470 (= c!67821 (= lt!272455 Undefined!6244))))

(assert (=> b!599470 (= lt!272455 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272449 lt!272451 mask!3053))))

(assert (=> b!599470 e!342707))

(declare-fun res!384545 () Bool)

(assert (=> b!599470 (=> (not res!384545) (not e!342707))))

(declare-fun lt!272443 () (_ BitVec 32))

(assert (=> b!599470 (= res!384545 (= lt!272453 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272443 vacantSpotIndex!68 lt!272449 lt!272451 mask!3053)))))

(assert (=> b!599470 (= lt!272453 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272443 vacantSpotIndex!68 (select (arr!17807 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599470 (= lt!272449 (select (store (arr!17807 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272450 () Unit!18888)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37095 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18888)

(assert (=> b!599470 (= lt!272450 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272443 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599470 (= lt!272443 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599471 () Bool)

(assert (=> b!599471 (= e!342706 e!342696)))

(declare-fun res!384559 () Bool)

(assert (=> b!599471 (=> (not res!384559) (not e!342696))))

(declare-fun lt!272447 () SeekEntryResult!6244)

(assert (=> b!599471 (= res!384559 (or (= lt!272447 (MissingZero!6244 i!1108)) (= lt!272447 (MissingVacant!6244 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37095 (_ BitVec 32)) SeekEntryResult!6244)

(assert (=> b!599471 (= lt!272447 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599472 () Bool)

(assert (=> b!599472 (= e!342704 true)))

(declare-fun lt!272442 () Bool)

(assert (=> b!599472 (= lt!272442 (contains!2952 Nil!11884 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599473 () Bool)

(declare-fun Unit!18891 () Unit!18888)

(assert (=> b!599473 (= e!342703 Unit!18891)))

(assert (= (and start!54846 res!384544) b!599453))

(assert (= (and b!599453 res!384551) b!599464))

(assert (= (and b!599464 res!384552) b!599461))

(assert (= (and b!599461 res!384549) b!599455))

(assert (= (and b!599455 res!384556) b!599471))

(assert (= (and b!599471 res!384559) b!599466))

(assert (= (and b!599466 res!384555) b!599460))

(assert (= (and b!599460 res!384562) b!599463))

(assert (= (and b!599463 res!384563) b!599468))

(assert (= (and b!599468 res!384557) b!599459))

(assert (= (and b!599459 res!384550) b!599470))

(assert (= (and b!599470 res!384545) b!599456))

(assert (= (and b!599470 c!67821) b!599467))

(assert (= (and b!599470 (not c!67821)) b!599473))

(assert (= (and b!599470 (not res!384561)) b!599457))

(assert (= (and b!599457 res!384547) b!599458))

(assert (= (and b!599458 (not res!384554)) b!599462))

(assert (= (and b!599462 res!384546) b!599452))

(assert (= (and b!599457 (not res!384553)) b!599465))

(assert (= (and b!599465 (not res!384548)) b!599454))

(assert (= (and b!599454 (not res!384560)) b!599469))

(assert (= (and b!599469 (not res!384558)) b!599472))

(declare-fun m!576193 () Bool)

(assert (=> b!599462 m!576193))

(assert (=> b!599462 m!576193))

(declare-fun m!576195 () Bool)

(assert (=> b!599462 m!576195))

(declare-fun m!576197 () Bool)

(assert (=> b!599463 m!576197))

(declare-fun m!576199 () Bool)

(assert (=> start!54846 m!576199))

(declare-fun m!576201 () Bool)

(assert (=> start!54846 m!576201))

(declare-fun m!576203 () Bool)

(assert (=> b!599455 m!576203))

(declare-fun m!576205 () Bool)

(assert (=> b!599460 m!576205))

(declare-fun m!576207 () Bool)

(assert (=> b!599468 m!576207))

(declare-fun m!576209 () Bool)

(assert (=> b!599468 m!576209))

(assert (=> b!599464 m!576193))

(assert (=> b!599464 m!576193))

(declare-fun m!576211 () Bool)

(assert (=> b!599464 m!576211))

(declare-fun m!576213 () Bool)

(assert (=> b!599454 m!576213))

(declare-fun m!576215 () Bool)

(assert (=> b!599469 m!576215))

(assert (=> b!599457 m!576193))

(assert (=> b!599457 m!576207))

(declare-fun m!576217 () Bool)

(assert (=> b!599457 m!576217))

(assert (=> b!599458 m!576193))

(declare-fun m!576219 () Bool)

(assert (=> b!599471 m!576219))

(declare-fun m!576221 () Bool)

(assert (=> b!599470 m!576221))

(assert (=> b!599470 m!576193))

(assert (=> b!599470 m!576207))

(assert (=> b!599470 m!576193))

(declare-fun m!576223 () Bool)

(assert (=> b!599470 m!576223))

(declare-fun m!576225 () Bool)

(assert (=> b!599470 m!576225))

(declare-fun m!576227 () Bool)

(assert (=> b!599470 m!576227))

(declare-fun m!576229 () Bool)

(assert (=> b!599470 m!576229))

(declare-fun m!576231 () Bool)

(assert (=> b!599470 m!576231))

(assert (=> b!599465 m!576193))

(declare-fun m!576233 () Bool)

(assert (=> b!599465 m!576233))

(declare-fun m!576235 () Bool)

(assert (=> b!599465 m!576235))

(declare-fun m!576237 () Bool)

(assert (=> b!599465 m!576237))

(assert (=> b!599465 m!576193))

(declare-fun m!576239 () Bool)

(assert (=> b!599465 m!576239))

(declare-fun m!576241 () Bool)

(assert (=> b!599465 m!576241))

(assert (=> b!599465 m!576193))

(declare-fun m!576243 () Bool)

(assert (=> b!599465 m!576243))

(declare-fun m!576245 () Bool)

(assert (=> b!599466 m!576245))

(declare-fun m!576247 () Bool)

(assert (=> b!599461 m!576247))

(declare-fun m!576249 () Bool)

(assert (=> b!599472 m!576249))

(declare-fun m!576251 () Bool)

(assert (=> b!599459 m!576251))

(assert (=> b!599459 m!576193))

(assert (=> b!599459 m!576193))

(declare-fun m!576253 () Bool)

(assert (=> b!599459 m!576253))

(assert (=> b!599452 m!576193))

(assert (=> b!599452 m!576193))

(declare-fun m!576255 () Bool)

(assert (=> b!599452 m!576255))

(check-sat (not b!599464) (not b!599455) (not b!599469) (not b!599466) (not b!599471) (not b!599470) (not b!599452) (not b!599472) (not start!54846) (not b!599454) (not b!599461) (not b!599459) (not b!599462) (not b!599460) (not b!599465))
(check-sat)
