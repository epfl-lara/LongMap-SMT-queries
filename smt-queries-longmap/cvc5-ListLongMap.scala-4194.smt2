; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57248 () Bool)

(assert start!57248)

(declare-fun b!633426 () Bool)

(declare-fun e!362174 () Bool)

(declare-fun e!362170 () Bool)

(assert (=> b!633426 (= e!362174 (not e!362170))))

(declare-fun res!409708 () Bool)

(assert (=> b!633426 (=> res!409708 e!362170)))

(declare-datatypes ((SeekEntryResult!6750 0))(
  ( (MissingZero!6750 (index!29299 (_ BitVec 32))) (Found!6750 (index!29300 (_ BitVec 32))) (Intermediate!6750 (undefined!7562 Bool) (index!29301 (_ BitVec 32)) (x!58046 (_ BitVec 32))) (Undefined!6750) (MissingVacant!6750 (index!29302 (_ BitVec 32))) )
))
(declare-fun lt!292674 () SeekEntryResult!6750)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633426 (= res!409708 (not (= lt!292674 (Found!6750 index!984))))))

(declare-datatypes ((Unit!21328 0))(
  ( (Unit!21329) )
))
(declare-fun lt!292673 () Unit!21328)

(declare-fun e!362168 () Unit!21328)

(assert (=> b!633426 (= lt!292673 e!362168)))

(declare-fun c!72231 () Bool)

(assert (=> b!633426 (= c!72231 (= lt!292674 Undefined!6750))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38167 0))(
  ( (array!38168 (arr!18313 (Array (_ BitVec 32) (_ BitVec 64))) (size!18678 (_ BitVec 32))) )
))
(declare-fun lt!292675 () array!38167)

(declare-fun lt!292676 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38167 (_ BitVec 32)) SeekEntryResult!6750)

(assert (=> b!633426 (= lt!292674 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292676 lt!292675 mask!3053))))

(declare-fun e!362169 () Bool)

(assert (=> b!633426 e!362169))

(declare-fun res!409710 () Bool)

(assert (=> b!633426 (=> (not res!409710) (not e!362169))))

(declare-fun lt!292669 () SeekEntryResult!6750)

(declare-fun lt!292668 () (_ BitVec 32))

(assert (=> b!633426 (= res!409710 (= lt!292669 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292668 vacantSpotIndex!68 lt!292676 lt!292675 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38167)

(assert (=> b!633426 (= lt!292669 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292668 vacantSpotIndex!68 (select (arr!18313 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!633426 (= lt!292676 (select (store (arr!18313 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292672 () Unit!21328)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38167 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21328)

(assert (=> b!633426 (= lt!292672 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292668 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633426 (= lt!292668 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633427 () Bool)

(declare-fun e!362176 () Bool)

(declare-fun e!362166 () Bool)

(assert (=> b!633427 (= e!362176 e!362166)))

(declare-fun res!409709 () Bool)

(assert (=> b!633427 (=> res!409709 e!362166)))

(declare-fun lt!292670 () (_ BitVec 64))

(assert (=> b!633427 (= res!409709 (or (not (= (select (arr!18313 a!2986) j!136) lt!292676)) (not (= (select (arr!18313 a!2986) j!136) lt!292670)) (bvsge j!136 index!984)))))

(declare-fun e!362167 () Bool)

(declare-fun b!633428 () Bool)

(declare-fun arrayContainsKey!0 (array!38167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633428 (= e!362167 (arrayContainsKey!0 lt!292675 (select (arr!18313 a!2986) j!136) index!984))))

(declare-fun b!633429 () Bool)

(declare-fun res!409712 () Bool)

(declare-fun e!362175 () Bool)

(assert (=> b!633429 (=> (not res!409712) (not e!362175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633429 (= res!409712 (validKeyInArray!0 k!1786))))

(declare-fun b!633430 () Bool)

(declare-fun lt!292671 () SeekEntryResult!6750)

(assert (=> b!633430 (= e!362169 (= lt!292671 lt!292669))))

(declare-fun b!633431 () Bool)

(declare-fun e!362172 () Bool)

(assert (=> b!633431 (= e!362175 e!362172)))

(declare-fun res!409705 () Bool)

(assert (=> b!633431 (=> (not res!409705) (not e!362172))))

(declare-fun lt!292667 () SeekEntryResult!6750)

(assert (=> b!633431 (= res!409705 (or (= lt!292667 (MissingZero!6750 i!1108)) (= lt!292667 (MissingVacant!6750 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38167 (_ BitVec 32)) SeekEntryResult!6750)

(assert (=> b!633431 (= lt!292667 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!633432 () Bool)

(declare-fun e!362173 () Bool)

(assert (=> b!633432 (= e!362173 e!362174)))

(declare-fun res!409706 () Bool)

(assert (=> b!633432 (=> (not res!409706) (not e!362174))))

(assert (=> b!633432 (= res!409706 (and (= lt!292671 (Found!6750 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18313 a!2986) index!984) (select (arr!18313 a!2986) j!136))) (not (= (select (arr!18313 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!633432 (= lt!292671 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18313 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633433 () Bool)

(assert (=> b!633433 (= e!362170 (or (not (= (select (arr!18313 a!2986) j!136) lt!292676)) (not (= (select (arr!18313 a!2986) j!136) lt!292670)) (bvsge j!136 index!984) (bvslt index!984 (size!18678 a!2986))))))

(assert (=> b!633433 e!362176))

(declare-fun res!409702 () Bool)

(assert (=> b!633433 (=> (not res!409702) (not e!362176))))

(assert (=> b!633433 (= res!409702 (= lt!292670 (select (arr!18313 a!2986) j!136)))))

(assert (=> b!633433 (= lt!292670 (select (store (arr!18313 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!633434 () Bool)

(declare-fun res!409698 () Bool)

(assert (=> b!633434 (=> (not res!409698) (not e!362172))))

(assert (=> b!633434 (= res!409698 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18313 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633435 () Bool)

(declare-fun res!409703 () Bool)

(assert (=> b!633435 (=> (not res!409703) (not e!362175))))

(assert (=> b!633435 (= res!409703 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!409711 () Bool)

(assert (=> start!57248 (=> (not res!409711) (not e!362175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57248 (= res!409711 (validMask!0 mask!3053))))

(assert (=> start!57248 e!362175))

(assert (=> start!57248 true))

(declare-fun array_inv!14196 (array!38167) Bool)

(assert (=> start!57248 (array_inv!14196 a!2986)))

(declare-fun b!633436 () Bool)

(declare-fun res!409700 () Bool)

(assert (=> b!633436 (=> (not res!409700) (not e!362172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38167 (_ BitVec 32)) Bool)

(assert (=> b!633436 (= res!409700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633437 () Bool)

(assert (=> b!633437 (= e!362166 e!362167)))

(declare-fun res!409713 () Bool)

(assert (=> b!633437 (=> (not res!409713) (not e!362167))))

(assert (=> b!633437 (= res!409713 (arrayContainsKey!0 lt!292675 (select (arr!18313 a!2986) j!136) j!136))))

(declare-fun b!633438 () Bool)

(assert (=> b!633438 (= e!362172 e!362173)))

(declare-fun res!409699 () Bool)

(assert (=> b!633438 (=> (not res!409699) (not e!362173))))

(assert (=> b!633438 (= res!409699 (= (select (store (arr!18313 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633438 (= lt!292675 (array!38168 (store (arr!18313 a!2986) i!1108 k!1786) (size!18678 a!2986)))))

(declare-fun b!633439 () Bool)

(declare-fun Unit!21330 () Unit!21328)

(assert (=> b!633439 (= e!362168 Unit!21330)))

(assert (=> b!633439 false))

(declare-fun b!633440 () Bool)

(declare-fun Unit!21331 () Unit!21328)

(assert (=> b!633440 (= e!362168 Unit!21331)))

(declare-fun b!633441 () Bool)

(declare-fun res!409704 () Bool)

(assert (=> b!633441 (=> (not res!409704) (not e!362175))))

(assert (=> b!633441 (= res!409704 (validKeyInArray!0 (select (arr!18313 a!2986) j!136)))))

(declare-fun b!633442 () Bool)

(declare-fun res!409707 () Bool)

(assert (=> b!633442 (=> (not res!409707) (not e!362172))))

(declare-datatypes ((List!12393 0))(
  ( (Nil!12390) (Cons!12389 (h!13434 (_ BitVec 64)) (t!18612 List!12393)) )
))
(declare-fun arrayNoDuplicates!0 (array!38167 (_ BitVec 32) List!12393) Bool)

(assert (=> b!633442 (= res!409707 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12390))))

(declare-fun b!633443 () Bool)

(declare-fun res!409701 () Bool)

(assert (=> b!633443 (=> (not res!409701) (not e!362175))))

(assert (=> b!633443 (= res!409701 (and (= (size!18678 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18678 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18678 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!57248 res!409711) b!633443))

(assert (= (and b!633443 res!409701) b!633441))

(assert (= (and b!633441 res!409704) b!633429))

(assert (= (and b!633429 res!409712) b!633435))

(assert (= (and b!633435 res!409703) b!633431))

(assert (= (and b!633431 res!409705) b!633436))

(assert (= (and b!633436 res!409700) b!633442))

(assert (= (and b!633442 res!409707) b!633434))

(assert (= (and b!633434 res!409698) b!633438))

(assert (= (and b!633438 res!409699) b!633432))

(assert (= (and b!633432 res!409706) b!633426))

(assert (= (and b!633426 res!409710) b!633430))

(assert (= (and b!633426 c!72231) b!633439))

(assert (= (and b!633426 (not c!72231)) b!633440))

(assert (= (and b!633426 (not res!409708)) b!633433))

(assert (= (and b!633433 res!409702) b!633427))

(assert (= (and b!633427 (not res!409709)) b!633437))

(assert (= (and b!633437 res!409713) b!633428))

(declare-fun m!607561 () Bool)

(assert (=> b!633428 m!607561))

(assert (=> b!633428 m!607561))

(declare-fun m!607563 () Bool)

(assert (=> b!633428 m!607563))

(declare-fun m!607565 () Bool)

(assert (=> b!633426 m!607565))

(declare-fun m!607567 () Bool)

(assert (=> b!633426 m!607567))

(assert (=> b!633426 m!607561))

(declare-fun m!607569 () Bool)

(assert (=> b!633426 m!607569))

(declare-fun m!607571 () Bool)

(assert (=> b!633426 m!607571))

(declare-fun m!607573 () Bool)

(assert (=> b!633426 m!607573))

(declare-fun m!607575 () Bool)

(assert (=> b!633426 m!607575))

(declare-fun m!607577 () Bool)

(assert (=> b!633426 m!607577))

(assert (=> b!633426 m!607561))

(assert (=> b!633437 m!607561))

(assert (=> b!633437 m!607561))

(declare-fun m!607579 () Bool)

(assert (=> b!633437 m!607579))

(assert (=> b!633427 m!607561))

(declare-fun m!607581 () Bool)

(assert (=> start!57248 m!607581))

(declare-fun m!607583 () Bool)

(assert (=> start!57248 m!607583))

(declare-fun m!607585 () Bool)

(assert (=> b!633442 m!607585))

(declare-fun m!607587 () Bool)

(assert (=> b!633431 m!607587))

(assert (=> b!633438 m!607567))

(declare-fun m!607589 () Bool)

(assert (=> b!633438 m!607589))

(assert (=> b!633433 m!607561))

(assert (=> b!633433 m!607567))

(declare-fun m!607591 () Bool)

(assert (=> b!633433 m!607591))

(declare-fun m!607593 () Bool)

(assert (=> b!633429 m!607593))

(declare-fun m!607595 () Bool)

(assert (=> b!633432 m!607595))

(assert (=> b!633432 m!607561))

(assert (=> b!633432 m!607561))

(declare-fun m!607597 () Bool)

(assert (=> b!633432 m!607597))

(declare-fun m!607599 () Bool)

(assert (=> b!633436 m!607599))

(assert (=> b!633441 m!607561))

(assert (=> b!633441 m!607561))

(declare-fun m!607601 () Bool)

(assert (=> b!633441 m!607601))

(declare-fun m!607603 () Bool)

(assert (=> b!633434 m!607603))

(declare-fun m!607605 () Bool)

(assert (=> b!633435 m!607605))

(push 1)

(assert (not start!57248))

(assert (not b!633432))

(assert (not b!633429))

(assert (not b!633431))

(assert (not b!633437))

(assert (not b!633426))

(assert (not b!633436))

(assert (not b!633442))

(assert (not b!633428))

(assert (not b!633441))

(assert (not b!633435))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

