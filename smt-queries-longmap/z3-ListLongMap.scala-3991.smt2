; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54138 () Bool)

(assert start!54138)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!337500 () Bool)

(declare-datatypes ((array!36868 0))(
  ( (array!36869 (arr!17704 (Array (_ BitVec 32) (_ BitVec 64))) (size!18068 (_ BitVec 32))) )
))
(declare-fun lt!268186 () array!36868)

(declare-fun b!591108 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!36868)

(declare-fun arrayContainsKey!0 (array!36868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591108 (= e!337500 (arrayContainsKey!0 lt!268186 (select (arr!17704 a!2986) j!136) index!984))))

(declare-fun b!591109 () Bool)

(declare-fun e!337503 () Bool)

(declare-fun e!337505 () Bool)

(assert (=> b!591109 (= e!337503 e!337505)))

(declare-fun res!378090 () Bool)

(assert (=> b!591109 (=> (not res!378090) (not e!337505))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!591109 (= res!378090 (= (select (store (arr!17704 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591109 (= lt!268186 (array!36869 (store (arr!17704 a!2986) i!1108 k0!1786) (size!18068 a!2986)))))

(declare-fun b!591111 () Bool)

(declare-fun res!378087 () Bool)

(declare-fun e!337498 () Bool)

(assert (=> b!591111 (=> (not res!378087) (not e!337498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591111 (= res!378087 (validKeyInArray!0 (select (arr!17704 a!2986) j!136)))))

(declare-fun b!591112 () Bool)

(declare-fun e!337506 () Bool)

(assert (=> b!591112 (= e!337506 e!337500)))

(declare-fun res!378086 () Bool)

(assert (=> b!591112 (=> (not res!378086) (not e!337500))))

(assert (=> b!591112 (= res!378086 (arrayContainsKey!0 lt!268186 (select (arr!17704 a!2986) j!136) j!136))))

(declare-fun b!591113 () Bool)

(declare-fun e!337499 () Bool)

(assert (=> b!591113 (= e!337499 e!337506)))

(declare-fun res!378093 () Bool)

(assert (=> b!591113 (=> res!378093 e!337506)))

(declare-fun lt!268183 () (_ BitVec 64))

(declare-fun lt!268185 () (_ BitVec 64))

(assert (=> b!591113 (= res!378093 (or (not (= (select (arr!17704 a!2986) j!136) lt!268183)) (not (= (select (arr!17704 a!2986) j!136) lt!268185)) (bvsge j!136 index!984)))))

(declare-fun b!591114 () Bool)

(declare-fun e!337504 () Bool)

(assert (=> b!591114 (= e!337504 true)))

(assert (=> b!591114 e!337499))

(declare-fun res!378088 () Bool)

(assert (=> b!591114 (=> (not res!378088) (not e!337499))))

(assert (=> b!591114 (= res!378088 (= lt!268185 (select (arr!17704 a!2986) j!136)))))

(assert (=> b!591114 (= lt!268185 (select (store (arr!17704 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591115 () Bool)

(declare-fun res!378094 () Bool)

(assert (=> b!591115 (=> (not res!378094) (not e!337498))))

(assert (=> b!591115 (= res!378094 (validKeyInArray!0 k0!1786))))

(declare-fun b!591116 () Bool)

(declare-fun e!337501 () Bool)

(assert (=> b!591116 (= e!337501 (not e!337504))))

(declare-fun res!378097 () Bool)

(assert (=> b!591116 (=> res!378097 e!337504)))

(declare-datatypes ((SeekEntryResult!6144 0))(
  ( (MissingZero!6144 (index!26812 (_ BitVec 32))) (Found!6144 (index!26813 (_ BitVec 32))) (Intermediate!6144 (undefined!6956 Bool) (index!26814 (_ BitVec 32)) (x!55608 (_ BitVec 32))) (Undefined!6144) (MissingVacant!6144 (index!26815 (_ BitVec 32))) )
))
(declare-fun lt!268188 () SeekEntryResult!6144)

(assert (=> b!591116 (= res!378097 (not (= lt!268188 (Found!6144 index!984))))))

(declare-datatypes ((Unit!18494 0))(
  ( (Unit!18495) )
))
(declare-fun lt!268191 () Unit!18494)

(declare-fun e!337502 () Unit!18494)

(assert (=> b!591116 (= lt!268191 e!337502)))

(declare-fun c!66878 () Bool)

(assert (=> b!591116 (= c!66878 (= lt!268188 Undefined!6144))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36868 (_ BitVec 32)) SeekEntryResult!6144)

(assert (=> b!591116 (= lt!268188 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268183 lt!268186 mask!3053))))

(declare-fun e!337497 () Bool)

(assert (=> b!591116 e!337497))

(declare-fun res!378091 () Bool)

(assert (=> b!591116 (=> (not res!378091) (not e!337497))))

(declare-fun lt!268190 () SeekEntryResult!6144)

(declare-fun lt!268187 () (_ BitVec 32))

(assert (=> b!591116 (= res!378091 (= lt!268190 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268187 vacantSpotIndex!68 lt!268183 lt!268186 mask!3053)))))

(assert (=> b!591116 (= lt!268190 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268187 vacantSpotIndex!68 (select (arr!17704 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591116 (= lt!268183 (select (store (arr!17704 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268189 () Unit!18494)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36868 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18494)

(assert (=> b!591116 (= lt!268189 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268187 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591116 (= lt!268187 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591117 () Bool)

(declare-fun Unit!18496 () Unit!18494)

(assert (=> b!591117 (= e!337502 Unit!18496)))

(assert (=> b!591117 false))

(declare-fun b!591118 () Bool)

(assert (=> b!591118 (= e!337505 e!337501)))

(declare-fun res!378099 () Bool)

(assert (=> b!591118 (=> (not res!378099) (not e!337501))))

(declare-fun lt!268192 () SeekEntryResult!6144)

(assert (=> b!591118 (= res!378099 (and (= lt!268192 (Found!6144 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17704 a!2986) index!984) (select (arr!17704 a!2986) j!136))) (not (= (select (arr!17704 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591118 (= lt!268192 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17704 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591119 () Bool)

(declare-fun res!378101 () Bool)

(assert (=> b!591119 (=> (not res!378101) (not e!337498))))

(assert (=> b!591119 (= res!378101 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591120 () Bool)

(assert (=> b!591120 (= e!337498 e!337503)))

(declare-fun res!378089 () Bool)

(assert (=> b!591120 (=> (not res!378089) (not e!337503))))

(declare-fun lt!268184 () SeekEntryResult!6144)

(assert (=> b!591120 (= res!378089 (or (= lt!268184 (MissingZero!6144 i!1108)) (= lt!268184 (MissingVacant!6144 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36868 (_ BitVec 32)) SeekEntryResult!6144)

(assert (=> b!591120 (= lt!268184 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591121 () Bool)

(declare-fun res!378096 () Bool)

(assert (=> b!591121 (=> (not res!378096) (not e!337503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36868 (_ BitVec 32)) Bool)

(assert (=> b!591121 (= res!378096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591122 () Bool)

(assert (=> b!591122 (= e!337497 (= lt!268192 lt!268190))))

(declare-fun b!591123 () Bool)

(declare-fun res!378100 () Bool)

(assert (=> b!591123 (=> (not res!378100) (not e!337503))))

(declare-datatypes ((List!11745 0))(
  ( (Nil!11742) (Cons!11741 (h!12786 (_ BitVec 64)) (t!17973 List!11745)) )
))
(declare-fun arrayNoDuplicates!0 (array!36868 (_ BitVec 32) List!11745) Bool)

(assert (=> b!591123 (= res!378100 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11742))))

(declare-fun b!591110 () Bool)

(declare-fun res!378095 () Bool)

(assert (=> b!591110 (=> (not res!378095) (not e!337503))))

(assert (=> b!591110 (= res!378095 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17704 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!378092 () Bool)

(assert (=> start!54138 (=> (not res!378092) (not e!337498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54138 (= res!378092 (validMask!0 mask!3053))))

(assert (=> start!54138 e!337498))

(assert (=> start!54138 true))

(declare-fun array_inv!13500 (array!36868) Bool)

(assert (=> start!54138 (array_inv!13500 a!2986)))

(declare-fun b!591124 () Bool)

(declare-fun Unit!18497 () Unit!18494)

(assert (=> b!591124 (= e!337502 Unit!18497)))

(declare-fun b!591125 () Bool)

(declare-fun res!378098 () Bool)

(assert (=> b!591125 (=> (not res!378098) (not e!337498))))

(assert (=> b!591125 (= res!378098 (and (= (size!18068 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18068 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18068 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54138 res!378092) b!591125))

(assert (= (and b!591125 res!378098) b!591111))

(assert (= (and b!591111 res!378087) b!591115))

(assert (= (and b!591115 res!378094) b!591119))

(assert (= (and b!591119 res!378101) b!591120))

(assert (= (and b!591120 res!378089) b!591121))

(assert (= (and b!591121 res!378096) b!591123))

(assert (= (and b!591123 res!378100) b!591110))

(assert (= (and b!591110 res!378095) b!591109))

(assert (= (and b!591109 res!378090) b!591118))

(assert (= (and b!591118 res!378099) b!591116))

(assert (= (and b!591116 res!378091) b!591122))

(assert (= (and b!591116 c!66878) b!591117))

(assert (= (and b!591116 (not c!66878)) b!591124))

(assert (= (and b!591116 (not res!378097)) b!591114))

(assert (= (and b!591114 res!378088) b!591113))

(assert (= (and b!591113 (not res!378093)) b!591112))

(assert (= (and b!591112 res!378086) b!591108))

(declare-fun m!569405 () Bool)

(assert (=> b!591108 m!569405))

(assert (=> b!591108 m!569405))

(declare-fun m!569407 () Bool)

(assert (=> b!591108 m!569407))

(declare-fun m!569409 () Bool)

(assert (=> b!591119 m!569409))

(assert (=> b!591113 m!569405))

(declare-fun m!569411 () Bool)

(assert (=> b!591121 m!569411))

(declare-fun m!569413 () Bool)

(assert (=> b!591116 m!569413))

(declare-fun m!569415 () Bool)

(assert (=> b!591116 m!569415))

(declare-fun m!569417 () Bool)

(assert (=> b!591116 m!569417))

(assert (=> b!591116 m!569405))

(declare-fun m!569419 () Bool)

(assert (=> b!591116 m!569419))

(declare-fun m!569421 () Bool)

(assert (=> b!591116 m!569421))

(assert (=> b!591116 m!569405))

(declare-fun m!569423 () Bool)

(assert (=> b!591116 m!569423))

(declare-fun m!569425 () Bool)

(assert (=> b!591116 m!569425))

(assert (=> b!591112 m!569405))

(assert (=> b!591112 m!569405))

(declare-fun m!569427 () Bool)

(assert (=> b!591112 m!569427))

(declare-fun m!569429 () Bool)

(assert (=> b!591118 m!569429))

(assert (=> b!591118 m!569405))

(assert (=> b!591118 m!569405))

(declare-fun m!569431 () Bool)

(assert (=> b!591118 m!569431))

(declare-fun m!569433 () Bool)

(assert (=> b!591120 m!569433))

(declare-fun m!569435 () Bool)

(assert (=> b!591110 m!569435))

(assert (=> b!591114 m!569405))

(assert (=> b!591114 m!569419))

(declare-fun m!569437 () Bool)

(assert (=> b!591114 m!569437))

(declare-fun m!569439 () Bool)

(assert (=> b!591123 m!569439))

(assert (=> b!591109 m!569419))

(declare-fun m!569441 () Bool)

(assert (=> b!591109 m!569441))

(declare-fun m!569443 () Bool)

(assert (=> b!591115 m!569443))

(declare-fun m!569445 () Bool)

(assert (=> start!54138 m!569445))

(declare-fun m!569447 () Bool)

(assert (=> start!54138 m!569447))

(assert (=> b!591111 m!569405))

(assert (=> b!591111 m!569405))

(declare-fun m!569449 () Bool)

(assert (=> b!591111 m!569449))

(check-sat (not b!591123) (not b!591116) (not b!591111) (not b!591108) (not b!591119) (not b!591120) (not b!591112) (not start!54138) (not b!591121) (not b!591118) (not b!591115))
(check-sat)
