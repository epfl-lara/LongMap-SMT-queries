; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53976 () Bool)

(assert start!53976)

(declare-fun b!589548 () Bool)

(declare-datatypes ((Unit!18410 0))(
  ( (Unit!18411) )
))
(declare-fun e!336575 () Unit!18410)

(declare-fun Unit!18412 () Unit!18410)

(assert (=> b!589548 (= e!336575 Unit!18412)))

(declare-fun b!589549 () Bool)

(declare-fun res!377051 () Bool)

(declare-fun e!336579 () Bool)

(assert (=> b!589549 (=> (not res!377051) (not e!336579))))

(declare-datatypes ((array!36820 0))(
  ( (array!36821 (arr!17683 (Array (_ BitVec 32) (_ BitVec 64))) (size!18047 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36820)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589549 (= res!377051 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589550 () Bool)

(declare-fun res!377060 () Bool)

(assert (=> b!589550 (=> (not res!377060) (not e!336579))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589550 (= res!377060 (and (= (size!18047 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18047 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18047 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589551 () Bool)

(declare-fun res!377052 () Bool)

(assert (=> b!589551 (=> (not res!377052) (not e!336579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589551 (= res!377052 (validKeyInArray!0 (select (arr!17683 a!2986) j!136)))))

(declare-fun b!589552 () Bool)

(declare-fun e!336578 () Bool)

(declare-fun e!336581 () Bool)

(assert (=> b!589552 (= e!336578 e!336581)))

(declare-fun res!377057 () Bool)

(assert (=> b!589552 (=> (not res!377057) (not e!336581))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!589552 (= res!377057 (= (select (store (arr!17683 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267406 () array!36820)

(assert (=> b!589552 (= lt!267406 (array!36821 (store (arr!17683 a!2986) i!1108 k0!1786) (size!18047 a!2986)))))

(declare-fun b!589553 () Bool)

(declare-fun res!377058 () Bool)

(assert (=> b!589553 (=> (not res!377058) (not e!336578))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589553 (= res!377058 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17683 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589555 () Bool)

(declare-fun e!336577 () Bool)

(assert (=> b!589555 (= e!336581 e!336577)))

(declare-fun res!377050 () Bool)

(assert (=> b!589555 (=> (not res!377050) (not e!336577))))

(declare-datatypes ((SeekEntryResult!6123 0))(
  ( (MissingZero!6123 (index!26722 (_ BitVec 32))) (Found!6123 (index!26723 (_ BitVec 32))) (Intermediate!6123 (undefined!6935 Bool) (index!26724 (_ BitVec 32)) (x!55513 (_ BitVec 32))) (Undefined!6123) (MissingVacant!6123 (index!26725 (_ BitVec 32))) )
))
(declare-fun lt!267403 () SeekEntryResult!6123)

(assert (=> b!589555 (= res!377050 (and (= lt!267403 (Found!6123 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17683 a!2986) index!984) (select (arr!17683 a!2986) j!136))) (not (= (select (arr!17683 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36820 (_ BitVec 32)) SeekEntryResult!6123)

(assert (=> b!589555 (= lt!267403 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17683 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589556 () Bool)

(declare-fun res!377049 () Bool)

(assert (=> b!589556 (=> (not res!377049) (not e!336578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36820 (_ BitVec 32)) Bool)

(assert (=> b!589556 (= res!377049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589557 () Bool)

(declare-fun Unit!18413 () Unit!18410)

(assert (=> b!589557 (= e!336575 Unit!18413)))

(assert (=> b!589557 false))

(declare-fun b!589558 () Bool)

(declare-fun e!336582 () Bool)

(assert (=> b!589558 (= e!336577 (not e!336582))))

(declare-fun res!377056 () Bool)

(assert (=> b!589558 (=> res!377056 e!336582)))

(assert (=> b!589558 (= res!377056 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun lt!267401 () Unit!18410)

(assert (=> b!589558 (= lt!267401 e!336575)))

(declare-fun lt!267405 () (_ BitVec 64))

(declare-fun c!66617 () Bool)

(assert (=> b!589558 (= c!66617 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267405 lt!267406 mask!3053) Undefined!6123))))

(declare-fun e!336576 () Bool)

(assert (=> b!589558 e!336576))

(declare-fun res!377059 () Bool)

(assert (=> b!589558 (=> (not res!377059) (not e!336576))))

(declare-fun lt!267399 () SeekEntryResult!6123)

(declare-fun lt!267400 () (_ BitVec 32))

(assert (=> b!589558 (= res!377059 (= lt!267399 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267400 vacantSpotIndex!68 lt!267405 lt!267406 mask!3053)))))

(assert (=> b!589558 (= lt!267399 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267400 vacantSpotIndex!68 (select (arr!17683 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589558 (= lt!267405 (select (store (arr!17683 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267402 () Unit!18410)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36820 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18410)

(assert (=> b!589558 (= lt!267402 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267400 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589558 (= lt!267400 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589559 () Bool)

(assert (=> b!589559 (= e!336576 (= lt!267403 lt!267399))))

(declare-fun b!589560 () Bool)

(declare-fun res!377053 () Bool)

(assert (=> b!589560 (=> (not res!377053) (not e!336579))))

(assert (=> b!589560 (= res!377053 (validKeyInArray!0 k0!1786))))

(declare-fun b!589561 () Bool)

(assert (=> b!589561 (= e!336579 e!336578)))

(declare-fun res!377048 () Bool)

(assert (=> b!589561 (=> (not res!377048) (not e!336578))))

(declare-fun lt!267404 () SeekEntryResult!6123)

(assert (=> b!589561 (= res!377048 (or (= lt!267404 (MissingZero!6123 i!1108)) (= lt!267404 (MissingVacant!6123 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36820 (_ BitVec 32)) SeekEntryResult!6123)

(assert (=> b!589561 (= lt!267404 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589562 () Bool)

(assert (=> b!589562 (= e!336582 (validKeyInArray!0 lt!267405))))

(declare-fun b!589554 () Bool)

(declare-fun res!377055 () Bool)

(assert (=> b!589554 (=> (not res!377055) (not e!336578))))

(declare-datatypes ((List!11724 0))(
  ( (Nil!11721) (Cons!11720 (h!12765 (_ BitVec 64)) (t!17952 List!11724)) )
))
(declare-fun arrayNoDuplicates!0 (array!36820 (_ BitVec 32) List!11724) Bool)

(assert (=> b!589554 (= res!377055 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11721))))

(declare-fun res!377054 () Bool)

(assert (=> start!53976 (=> (not res!377054) (not e!336579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53976 (= res!377054 (validMask!0 mask!3053))))

(assert (=> start!53976 e!336579))

(assert (=> start!53976 true))

(declare-fun array_inv!13479 (array!36820) Bool)

(assert (=> start!53976 (array_inv!13479 a!2986)))

(assert (= (and start!53976 res!377054) b!589550))

(assert (= (and b!589550 res!377060) b!589551))

(assert (= (and b!589551 res!377052) b!589560))

(assert (= (and b!589560 res!377053) b!589549))

(assert (= (and b!589549 res!377051) b!589561))

(assert (= (and b!589561 res!377048) b!589556))

(assert (= (and b!589556 res!377049) b!589554))

(assert (= (and b!589554 res!377055) b!589553))

(assert (= (and b!589553 res!377058) b!589552))

(assert (= (and b!589552 res!377057) b!589555))

(assert (= (and b!589555 res!377050) b!589558))

(assert (= (and b!589558 res!377059) b!589559))

(assert (= (and b!589558 c!66617) b!589557))

(assert (= (and b!589558 (not c!66617)) b!589548))

(assert (= (and b!589558 (not res!377056)) b!589562))

(declare-fun m!568069 () Bool)

(assert (=> b!589560 m!568069))

(declare-fun m!568071 () Bool)

(assert (=> b!589556 m!568071))

(declare-fun m!568073 () Bool)

(assert (=> b!589549 m!568073))

(declare-fun m!568075 () Bool)

(assert (=> b!589558 m!568075))

(declare-fun m!568077 () Bool)

(assert (=> b!589558 m!568077))

(declare-fun m!568079 () Bool)

(assert (=> b!589558 m!568079))

(declare-fun m!568081 () Bool)

(assert (=> b!589558 m!568081))

(declare-fun m!568083 () Bool)

(assert (=> b!589558 m!568083))

(assert (=> b!589558 m!568079))

(declare-fun m!568085 () Bool)

(assert (=> b!589558 m!568085))

(declare-fun m!568087 () Bool)

(assert (=> b!589558 m!568087))

(declare-fun m!568089 () Bool)

(assert (=> b!589558 m!568089))

(declare-fun m!568091 () Bool)

(assert (=> b!589555 m!568091))

(assert (=> b!589555 m!568079))

(assert (=> b!589555 m!568079))

(declare-fun m!568093 () Bool)

(assert (=> b!589555 m!568093))

(assert (=> b!589551 m!568079))

(assert (=> b!589551 m!568079))

(declare-fun m!568095 () Bool)

(assert (=> b!589551 m!568095))

(assert (=> b!589552 m!568081))

(declare-fun m!568097 () Bool)

(assert (=> b!589552 m!568097))

(declare-fun m!568099 () Bool)

(assert (=> b!589561 m!568099))

(declare-fun m!568101 () Bool)

(assert (=> b!589554 m!568101))

(declare-fun m!568103 () Bool)

(assert (=> b!589553 m!568103))

(declare-fun m!568105 () Bool)

(assert (=> start!53976 m!568105))

(declare-fun m!568107 () Bool)

(assert (=> start!53976 m!568107))

(declare-fun m!568109 () Bool)

(assert (=> b!589562 m!568109))

(check-sat (not b!589555) (not b!589562) (not b!589554) (not start!53976) (not b!589556) (not b!589549) (not b!589558) (not b!589551) (not b!589561) (not b!589560))
(check-sat)
