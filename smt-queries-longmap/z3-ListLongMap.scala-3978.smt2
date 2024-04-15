; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53922 () Bool)

(assert start!53922)

(declare-fun b!588474 () Bool)

(declare-fun res!376239 () Bool)

(declare-fun e!335998 () Bool)

(assert (=> b!588474 (=> (not res!376239) (not e!335998))))

(declare-datatypes ((array!36780 0))(
  ( (array!36781 (arr!17663 (Array (_ BitVec 32) (_ BitVec 64))) (size!18028 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36780)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588474 (= res!376239 (validKeyInArray!0 (select (arr!17663 a!2986) j!136)))))

(declare-fun b!588476 () Bool)

(declare-fun res!376233 () Bool)

(assert (=> b!588476 (=> (not res!376233) (not e!335998))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588476 (= res!376233 (and (= (size!18028 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18028 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18028 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588477 () Bool)

(declare-fun e!336001 () Bool)

(assert (=> b!588477 (= e!336001 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18312 0))(
  ( (Unit!18313) )
))
(declare-fun lt!266716 () Unit!18312)

(declare-fun e!336000 () Unit!18312)

(assert (=> b!588477 (= lt!266716 e!336000)))

(declare-fun c!66489 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!266709 () array!36780)

(declare-fun lt!266715 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6100 0))(
  ( (MissingZero!6100 (index!26630 (_ BitVec 32))) (Found!6100 (index!26631 (_ BitVec 32))) (Intermediate!6100 (undefined!6912 Bool) (index!26632 (_ BitVec 32)) (x!55437 (_ BitVec 32))) (Undefined!6100) (MissingVacant!6100 (index!26633 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36780 (_ BitVec 32)) SeekEntryResult!6100)

(assert (=> b!588477 (= c!66489 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266715 lt!266709 mask!3053) Undefined!6100))))

(declare-fun e!335999 () Bool)

(assert (=> b!588477 e!335999))

(declare-fun res!376235 () Bool)

(assert (=> b!588477 (=> (not res!376235) (not e!335999))))

(declare-fun lt!266711 () SeekEntryResult!6100)

(declare-fun lt!266710 () (_ BitVec 32))

(assert (=> b!588477 (= res!376235 (= lt!266711 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266710 vacantSpotIndex!68 lt!266715 lt!266709 mask!3053)))))

(assert (=> b!588477 (= lt!266711 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266710 vacantSpotIndex!68 (select (arr!17663 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!588477 (= lt!266715 (select (store (arr!17663 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!266712 () Unit!18312)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36780 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18312)

(assert (=> b!588477 (= lt!266712 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266710 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588477 (= lt!266710 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588478 () Bool)

(declare-fun e!336002 () Bool)

(assert (=> b!588478 (= e!336002 e!336001)))

(declare-fun res!376238 () Bool)

(assert (=> b!588478 (=> (not res!376238) (not e!336001))))

(declare-fun lt!266713 () SeekEntryResult!6100)

(assert (=> b!588478 (= res!376238 (and (= lt!266713 (Found!6100 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17663 a!2986) index!984) (select (arr!17663 a!2986) j!136))) (not (= (select (arr!17663 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588478 (= lt!266713 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17663 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588479 () Bool)

(declare-fun res!376230 () Bool)

(declare-fun e!335997 () Bool)

(assert (=> b!588479 (=> (not res!376230) (not e!335997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36780 (_ BitVec 32)) Bool)

(assert (=> b!588479 (= res!376230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588480 () Bool)

(declare-fun res!376241 () Bool)

(assert (=> b!588480 (=> (not res!376241) (not e!335998))))

(declare-fun arrayContainsKey!0 (array!36780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588480 (= res!376241 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588481 () Bool)

(assert (=> b!588481 (= e!335998 e!335997)))

(declare-fun res!376232 () Bool)

(assert (=> b!588481 (=> (not res!376232) (not e!335997))))

(declare-fun lt!266714 () SeekEntryResult!6100)

(assert (=> b!588481 (= res!376232 (or (= lt!266714 (MissingZero!6100 i!1108)) (= lt!266714 (MissingVacant!6100 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36780 (_ BitVec 32)) SeekEntryResult!6100)

(assert (=> b!588481 (= lt!266714 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588482 () Bool)

(declare-fun res!376240 () Bool)

(assert (=> b!588482 (=> (not res!376240) (not e!335997))))

(declare-datatypes ((List!11743 0))(
  ( (Nil!11740) (Cons!11739 (h!12784 (_ BitVec 64)) (t!17962 List!11743)) )
))
(declare-fun arrayNoDuplicates!0 (array!36780 (_ BitVec 32) List!11743) Bool)

(assert (=> b!588482 (= res!376240 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11740))))

(declare-fun b!588483 () Bool)

(declare-fun Unit!18314 () Unit!18312)

(assert (=> b!588483 (= e!336000 Unit!18314)))

(assert (=> b!588483 false))

(declare-fun b!588484 () Bool)

(declare-fun res!376237 () Bool)

(assert (=> b!588484 (=> (not res!376237) (not e!335997))))

(assert (=> b!588484 (= res!376237 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17663 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588485 () Bool)

(declare-fun res!376234 () Bool)

(assert (=> b!588485 (=> (not res!376234) (not e!335998))))

(assert (=> b!588485 (= res!376234 (validKeyInArray!0 k0!1786))))

(declare-fun b!588475 () Bool)

(assert (=> b!588475 (= e!335999 (= lt!266713 lt!266711))))

(declare-fun res!376231 () Bool)

(assert (=> start!53922 (=> (not res!376231) (not e!335998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53922 (= res!376231 (validMask!0 mask!3053))))

(assert (=> start!53922 e!335998))

(assert (=> start!53922 true))

(declare-fun array_inv!13546 (array!36780) Bool)

(assert (=> start!53922 (array_inv!13546 a!2986)))

(declare-fun b!588486 () Bool)

(assert (=> b!588486 (= e!335997 e!336002)))

(declare-fun res!376236 () Bool)

(assert (=> b!588486 (=> (not res!376236) (not e!336002))))

(assert (=> b!588486 (= res!376236 (= (select (store (arr!17663 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!588486 (= lt!266709 (array!36781 (store (arr!17663 a!2986) i!1108 k0!1786) (size!18028 a!2986)))))

(declare-fun b!588487 () Bool)

(declare-fun Unit!18315 () Unit!18312)

(assert (=> b!588487 (= e!336000 Unit!18315)))

(assert (= (and start!53922 res!376231) b!588476))

(assert (= (and b!588476 res!376233) b!588474))

(assert (= (and b!588474 res!376239) b!588485))

(assert (= (and b!588485 res!376234) b!588480))

(assert (= (and b!588480 res!376241) b!588481))

(assert (= (and b!588481 res!376232) b!588479))

(assert (= (and b!588479 res!376230) b!588482))

(assert (= (and b!588482 res!376240) b!588484))

(assert (= (and b!588484 res!376237) b!588486))

(assert (= (and b!588486 res!376236) b!588478))

(assert (= (and b!588478 res!376238) b!588477))

(assert (= (and b!588477 res!376235) b!588475))

(assert (= (and b!588477 c!66489) b!588483))

(assert (= (and b!588477 (not c!66489)) b!588487))

(declare-fun m!566521 () Bool)

(assert (=> b!588481 m!566521))

(declare-fun m!566523 () Bool)

(assert (=> b!588484 m!566523))

(declare-fun m!566525 () Bool)

(assert (=> b!588479 m!566525))

(declare-fun m!566527 () Bool)

(assert (=> b!588480 m!566527))

(declare-fun m!566529 () Bool)

(assert (=> b!588474 m!566529))

(assert (=> b!588474 m!566529))

(declare-fun m!566531 () Bool)

(assert (=> b!588474 m!566531))

(declare-fun m!566533 () Bool)

(assert (=> b!588486 m!566533))

(declare-fun m!566535 () Bool)

(assert (=> b!588486 m!566535))

(declare-fun m!566537 () Bool)

(assert (=> b!588477 m!566537))

(declare-fun m!566539 () Bool)

(assert (=> b!588477 m!566539))

(assert (=> b!588477 m!566529))

(assert (=> b!588477 m!566533))

(declare-fun m!566541 () Bool)

(assert (=> b!588477 m!566541))

(assert (=> b!588477 m!566529))

(declare-fun m!566543 () Bool)

(assert (=> b!588477 m!566543))

(declare-fun m!566545 () Bool)

(assert (=> b!588477 m!566545))

(declare-fun m!566547 () Bool)

(assert (=> b!588477 m!566547))

(declare-fun m!566549 () Bool)

(assert (=> b!588482 m!566549))

(declare-fun m!566551 () Bool)

(assert (=> start!53922 m!566551))

(declare-fun m!566553 () Bool)

(assert (=> start!53922 m!566553))

(declare-fun m!566555 () Bool)

(assert (=> b!588478 m!566555))

(assert (=> b!588478 m!566529))

(assert (=> b!588478 m!566529))

(declare-fun m!566557 () Bool)

(assert (=> b!588478 m!566557))

(declare-fun m!566559 () Bool)

(assert (=> b!588485 m!566559))

(check-sat (not b!588474) (not b!588485) (not b!588482) (not b!588480) (not b!588479) (not start!53922) (not b!588478) (not b!588477) (not b!588481))
(check-sat)
