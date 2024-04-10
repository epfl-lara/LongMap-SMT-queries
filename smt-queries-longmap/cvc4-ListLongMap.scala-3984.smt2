; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53978 () Bool)

(assert start!53978)

(declare-fun b!589593 () Bool)

(declare-fun e!336599 () Bool)

(declare-fun e!336605 () Bool)

(assert (=> b!589593 (= e!336599 e!336605)))

(declare-fun res!377093 () Bool)

(assert (=> b!589593 (=> (not res!377093) (not e!336605))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6124 0))(
  ( (MissingZero!6124 (index!26726 (_ BitVec 32))) (Found!6124 (index!26727 (_ BitVec 32))) (Intermediate!6124 (undefined!6936 Bool) (index!26728 (_ BitVec 32)) (x!55514 (_ BitVec 32))) (Undefined!6124) (MissingVacant!6124 (index!26729 (_ BitVec 32))) )
))
(declare-fun lt!267423 () SeekEntryResult!6124)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36822 0))(
  ( (array!36823 (arr!17684 (Array (_ BitVec 32) (_ BitVec 64))) (size!18048 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36822)

(assert (=> b!589593 (= res!377093 (and (= lt!267423 (Found!6124 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17684 a!2986) index!984) (select (arr!17684 a!2986) j!136))) (not (= (select (arr!17684 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36822 (_ BitVec 32)) SeekEntryResult!6124)

(assert (=> b!589593 (= lt!267423 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17684 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589594 () Bool)

(declare-fun res!377099 () Bool)

(declare-fun e!336603 () Bool)

(assert (=> b!589594 (=> (not res!377099) (not e!336603))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589594 (= res!377099 (validKeyInArray!0 k!1786))))

(declare-fun b!589595 () Bool)

(declare-datatypes ((Unit!18414 0))(
  ( (Unit!18415) )
))
(declare-fun e!336602 () Unit!18414)

(declare-fun Unit!18416 () Unit!18414)

(assert (=> b!589595 (= e!336602 Unit!18416)))

(assert (=> b!589595 false))

(declare-fun b!589596 () Bool)

(declare-fun res!377088 () Bool)

(assert (=> b!589596 (=> (not res!377088) (not e!336603))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589596 (= res!377088 (and (= (size!18048 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18048 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18048 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589597 () Bool)

(declare-fun res!377090 () Bool)

(declare-fun e!336601 () Bool)

(assert (=> b!589597 (=> (not res!377090) (not e!336601))))

(declare-datatypes ((List!11725 0))(
  ( (Nil!11722) (Cons!11721 (h!12766 (_ BitVec 64)) (t!17953 List!11725)) )
))
(declare-fun arrayNoDuplicates!0 (array!36822 (_ BitVec 32) List!11725) Bool)

(assert (=> b!589597 (= res!377090 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11722))))

(declare-fun b!589598 () Bool)

(declare-fun e!336606 () Bool)

(declare-fun lt!267429 () SeekEntryResult!6124)

(assert (=> b!589598 (= e!336606 (= lt!267423 lt!267429))))

(declare-fun b!589599 () Bool)

(declare-fun res!377087 () Bool)

(assert (=> b!589599 (=> (not res!377087) (not e!336603))))

(declare-fun arrayContainsKey!0 (array!36822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589599 (= res!377087 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589600 () Bool)

(declare-fun res!377094 () Bool)

(assert (=> b!589600 (=> (not res!377094) (not e!336603))))

(assert (=> b!589600 (= res!377094 (validKeyInArray!0 (select (arr!17684 a!2986) j!136)))))

(declare-fun b!589601 () Bool)

(declare-fun res!377096 () Bool)

(assert (=> b!589601 (=> (not res!377096) (not e!336601))))

(assert (=> b!589601 (= res!377096 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17684 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589602 () Bool)

(declare-fun Unit!18417 () Unit!18414)

(assert (=> b!589602 (= e!336602 Unit!18417)))

(declare-fun b!589603 () Bool)

(declare-fun e!336604 () Bool)

(declare-fun lt!267427 () (_ BitVec 64))

(assert (=> b!589603 (= e!336604 (validKeyInArray!0 lt!267427))))

(declare-fun b!589604 () Bool)

(declare-fun res!377097 () Bool)

(assert (=> b!589604 (=> (not res!377097) (not e!336601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36822 (_ BitVec 32)) Bool)

(assert (=> b!589604 (= res!377097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589605 () Bool)

(assert (=> b!589605 (= e!336603 e!336601)))

(declare-fun res!377092 () Bool)

(assert (=> b!589605 (=> (not res!377092) (not e!336601))))

(declare-fun lt!267425 () SeekEntryResult!6124)

(assert (=> b!589605 (= res!377092 (or (= lt!267425 (MissingZero!6124 i!1108)) (= lt!267425 (MissingVacant!6124 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36822 (_ BitVec 32)) SeekEntryResult!6124)

(assert (=> b!589605 (= lt!267425 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!377089 () Bool)

(assert (=> start!53978 (=> (not res!377089) (not e!336603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53978 (= res!377089 (validMask!0 mask!3053))))

(assert (=> start!53978 e!336603))

(assert (=> start!53978 true))

(declare-fun array_inv!13480 (array!36822) Bool)

(assert (=> start!53978 (array_inv!13480 a!2986)))

(declare-fun b!589606 () Bool)

(assert (=> b!589606 (= e!336605 (not e!336604))))

(declare-fun res!377098 () Bool)

(assert (=> b!589606 (=> res!377098 e!336604)))

(assert (=> b!589606 (= res!377098 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun lt!267426 () Unit!18414)

(assert (=> b!589606 (= lt!267426 e!336602)))

(declare-fun lt!267424 () array!36822)

(declare-fun c!66620 () Bool)

(assert (=> b!589606 (= c!66620 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267427 lt!267424 mask!3053) Undefined!6124))))

(assert (=> b!589606 e!336606))

(declare-fun res!377095 () Bool)

(assert (=> b!589606 (=> (not res!377095) (not e!336606))))

(declare-fun lt!267428 () (_ BitVec 32))

(assert (=> b!589606 (= res!377095 (= lt!267429 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267428 vacantSpotIndex!68 lt!267427 lt!267424 mask!3053)))))

(assert (=> b!589606 (= lt!267429 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267428 vacantSpotIndex!68 (select (arr!17684 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589606 (= lt!267427 (select (store (arr!17684 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267430 () Unit!18414)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36822 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18414)

(assert (=> b!589606 (= lt!267430 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267428 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589606 (= lt!267428 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589607 () Bool)

(assert (=> b!589607 (= e!336601 e!336599)))

(declare-fun res!377091 () Bool)

(assert (=> b!589607 (=> (not res!377091) (not e!336599))))

(assert (=> b!589607 (= res!377091 (= (select (store (arr!17684 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589607 (= lt!267424 (array!36823 (store (arr!17684 a!2986) i!1108 k!1786) (size!18048 a!2986)))))

(assert (= (and start!53978 res!377089) b!589596))

(assert (= (and b!589596 res!377088) b!589600))

(assert (= (and b!589600 res!377094) b!589594))

(assert (= (and b!589594 res!377099) b!589599))

(assert (= (and b!589599 res!377087) b!589605))

(assert (= (and b!589605 res!377092) b!589604))

(assert (= (and b!589604 res!377097) b!589597))

(assert (= (and b!589597 res!377090) b!589601))

(assert (= (and b!589601 res!377096) b!589607))

(assert (= (and b!589607 res!377091) b!589593))

(assert (= (and b!589593 res!377093) b!589606))

(assert (= (and b!589606 res!377095) b!589598))

(assert (= (and b!589606 c!66620) b!589595))

(assert (= (and b!589606 (not c!66620)) b!589602))

(assert (= (and b!589606 (not res!377098)) b!589603))

(declare-fun m!568111 () Bool)

(assert (=> b!589601 m!568111))

(declare-fun m!568113 () Bool)

(assert (=> b!589593 m!568113))

(declare-fun m!568115 () Bool)

(assert (=> b!589593 m!568115))

(assert (=> b!589593 m!568115))

(declare-fun m!568117 () Bool)

(assert (=> b!589593 m!568117))

(declare-fun m!568119 () Bool)

(assert (=> b!589604 m!568119))

(assert (=> b!589600 m!568115))

(assert (=> b!589600 m!568115))

(declare-fun m!568121 () Bool)

(assert (=> b!589600 m!568121))

(declare-fun m!568123 () Bool)

(assert (=> b!589606 m!568123))

(declare-fun m!568125 () Bool)

(assert (=> b!589606 m!568125))

(declare-fun m!568127 () Bool)

(assert (=> b!589606 m!568127))

(assert (=> b!589606 m!568115))

(assert (=> b!589606 m!568115))

(declare-fun m!568129 () Bool)

(assert (=> b!589606 m!568129))

(declare-fun m!568131 () Bool)

(assert (=> b!589606 m!568131))

(declare-fun m!568133 () Bool)

(assert (=> b!589606 m!568133))

(declare-fun m!568135 () Bool)

(assert (=> b!589606 m!568135))

(assert (=> b!589607 m!568131))

(declare-fun m!568137 () Bool)

(assert (=> b!589607 m!568137))

(declare-fun m!568139 () Bool)

(assert (=> b!589605 m!568139))

(declare-fun m!568141 () Bool)

(assert (=> b!589594 m!568141))

(declare-fun m!568143 () Bool)

(assert (=> b!589599 m!568143))

(declare-fun m!568145 () Bool)

(assert (=> b!589597 m!568145))

(declare-fun m!568147 () Bool)

(assert (=> b!589603 m!568147))

(declare-fun m!568149 () Bool)

(assert (=> start!53978 m!568149))

(declare-fun m!568151 () Bool)

(assert (=> start!53978 m!568151))

(push 1)

(assert (not b!589604))

(assert (not b!589600))

(assert (not b!589597))

(assert (not b!589594))

(assert (not b!589605))

(assert (not 