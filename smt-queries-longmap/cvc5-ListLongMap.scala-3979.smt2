; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53944 () Bool)

(assert start!53944)

(declare-fun b!588872 () Bool)

(declare-fun res!376469 () Bool)

(declare-fun e!336235 () Bool)

(assert (=> b!588872 (=> (not res!376469) (not e!336235))))

(declare-datatypes ((array!36788 0))(
  ( (array!36789 (arr!17667 (Array (_ BitVec 32) (_ BitVec 64))) (size!18031 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36788)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588872 (= res!376469 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588873 () Bool)

(declare-fun e!336240 () Bool)

(declare-datatypes ((SeekEntryResult!6107 0))(
  ( (MissingZero!6107 (index!26658 (_ BitVec 32))) (Found!6107 (index!26659 (_ BitVec 32))) (Intermediate!6107 (undefined!6919 Bool) (index!26660 (_ BitVec 32)) (x!55457 (_ BitVec 32))) (Undefined!6107) (MissingVacant!6107 (index!26661 (_ BitVec 32))) )
))
(declare-fun lt!267019 () SeekEntryResult!6107)

(declare-fun lt!267021 () SeekEntryResult!6107)

(assert (=> b!588873 (= e!336240 (= lt!267019 lt!267021))))

(declare-fun b!588874 () Bool)

(declare-fun e!336236 () Bool)

(assert (=> b!588874 (= e!336236 (not true))))

(declare-datatypes ((Unit!18346 0))(
  ( (Unit!18347) )
))
(declare-fun lt!267016 () Unit!18346)

(declare-fun e!336234 () Unit!18346)

(assert (=> b!588874 (= lt!267016 e!336234)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!267015 () array!36788)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun c!66569 () Bool)

(declare-fun lt!267018 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36788 (_ BitVec 32)) SeekEntryResult!6107)

(assert (=> b!588874 (= c!66569 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267018 lt!267015 mask!3053) Undefined!6107))))

(assert (=> b!588874 e!336240))

(declare-fun res!376468 () Bool)

(assert (=> b!588874 (=> (not res!376468) (not e!336240))))

(declare-fun lt!267017 () (_ BitVec 32))

(assert (=> b!588874 (= res!376468 (= lt!267021 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267017 vacantSpotIndex!68 lt!267018 lt!267015 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!588874 (= lt!267021 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267017 vacantSpotIndex!68 (select (arr!17667 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588874 (= lt!267018 (select (store (arr!17667 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267020 () Unit!18346)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36788 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18346)

(assert (=> b!588874 (= lt!267020 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267017 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588874 (= lt!267017 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588875 () Bool)

(declare-fun Unit!18348 () Unit!18346)

(assert (=> b!588875 (= e!336234 Unit!18348)))

(assert (=> b!588875 false))

(declare-fun b!588876 () Bool)

(declare-fun e!336239 () Bool)

(assert (=> b!588876 (= e!336235 e!336239)))

(declare-fun res!376472 () Bool)

(assert (=> b!588876 (=> (not res!376472) (not e!336239))))

(declare-fun lt!267022 () SeekEntryResult!6107)

(assert (=> b!588876 (= res!376472 (or (= lt!267022 (MissingZero!6107 i!1108)) (= lt!267022 (MissingVacant!6107 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36788 (_ BitVec 32)) SeekEntryResult!6107)

(assert (=> b!588876 (= lt!267022 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588877 () Bool)

(declare-fun res!376467 () Bool)

(assert (=> b!588877 (=> (not res!376467) (not e!336235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588877 (= res!376467 (validKeyInArray!0 (select (arr!17667 a!2986) j!136)))))

(declare-fun b!588878 () Bool)

(declare-fun res!376476 () Bool)

(assert (=> b!588878 (=> (not res!376476) (not e!336239))))

(assert (=> b!588878 (= res!376476 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17667 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588879 () Bool)

(declare-fun res!376471 () Bool)

(assert (=> b!588879 (=> (not res!376471) (not e!336239))))

(declare-datatypes ((List!11708 0))(
  ( (Nil!11705) (Cons!11704 (h!12749 (_ BitVec 64)) (t!17936 List!11708)) )
))
(declare-fun arrayNoDuplicates!0 (array!36788 (_ BitVec 32) List!11708) Bool)

(assert (=> b!588879 (= res!376471 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11705))))

(declare-fun b!588880 () Bool)

(declare-fun e!336237 () Bool)

(assert (=> b!588880 (= e!336237 e!336236)))

(declare-fun res!376470 () Bool)

(assert (=> b!588880 (=> (not res!376470) (not e!336236))))

(assert (=> b!588880 (= res!376470 (and (= lt!267019 (Found!6107 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17667 a!2986) index!984) (select (arr!17667 a!2986) j!136))) (not (= (select (arr!17667 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588880 (= lt!267019 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17667 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588881 () Bool)

(declare-fun Unit!18349 () Unit!18346)

(assert (=> b!588881 (= e!336234 Unit!18349)))

(declare-fun b!588882 () Bool)

(assert (=> b!588882 (= e!336239 e!336237)))

(declare-fun res!376477 () Bool)

(assert (=> b!588882 (=> (not res!376477) (not e!336237))))

(assert (=> b!588882 (= res!376477 (= (select (store (arr!17667 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!588882 (= lt!267015 (array!36789 (store (arr!17667 a!2986) i!1108 k!1786) (size!18031 a!2986)))))

(declare-fun b!588871 () Bool)

(declare-fun res!376473 () Bool)

(assert (=> b!588871 (=> (not res!376473) (not e!336235))))

(assert (=> b!588871 (= res!376473 (validKeyInArray!0 k!1786))))

(declare-fun res!376478 () Bool)

(assert (=> start!53944 (=> (not res!376478) (not e!336235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53944 (= res!376478 (validMask!0 mask!3053))))

(assert (=> start!53944 e!336235))

(assert (=> start!53944 true))

(declare-fun array_inv!13463 (array!36788) Bool)

(assert (=> start!53944 (array_inv!13463 a!2986)))

(declare-fun b!588883 () Bool)

(declare-fun res!376474 () Bool)

(assert (=> b!588883 (=> (not res!376474) (not e!336239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36788 (_ BitVec 32)) Bool)

(assert (=> b!588883 (= res!376474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588884 () Bool)

(declare-fun res!376475 () Bool)

(assert (=> b!588884 (=> (not res!376475) (not e!336235))))

(assert (=> b!588884 (= res!376475 (and (= (size!18031 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18031 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18031 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53944 res!376478) b!588884))

(assert (= (and b!588884 res!376475) b!588877))

(assert (= (and b!588877 res!376467) b!588871))

(assert (= (and b!588871 res!376473) b!588872))

(assert (= (and b!588872 res!376469) b!588876))

(assert (= (and b!588876 res!376472) b!588883))

(assert (= (and b!588883 res!376474) b!588879))

(assert (= (and b!588879 res!376471) b!588878))

(assert (= (and b!588878 res!376476) b!588882))

(assert (= (and b!588882 res!376477) b!588880))

(assert (= (and b!588880 res!376470) b!588874))

(assert (= (and b!588874 res!376468) b!588873))

(assert (= (and b!588874 c!66569) b!588875))

(assert (= (and b!588874 (not c!66569)) b!588881))

(declare-fun m!567427 () Bool)

(assert (=> b!588876 m!567427))

(declare-fun m!567429 () Bool)

(assert (=> b!588878 m!567429))

(declare-fun m!567431 () Bool)

(assert (=> b!588883 m!567431))

(declare-fun m!567433 () Bool)

(assert (=> b!588871 m!567433))

(declare-fun m!567435 () Bool)

(assert (=> b!588874 m!567435))

(declare-fun m!567437 () Bool)

(assert (=> b!588874 m!567437))

(declare-fun m!567439 () Bool)

(assert (=> b!588874 m!567439))

(assert (=> b!588874 m!567439))

(declare-fun m!567441 () Bool)

(assert (=> b!588874 m!567441))

(declare-fun m!567443 () Bool)

(assert (=> b!588874 m!567443))

(declare-fun m!567445 () Bool)

(assert (=> b!588874 m!567445))

(declare-fun m!567447 () Bool)

(assert (=> b!588874 m!567447))

(declare-fun m!567449 () Bool)

(assert (=> b!588874 m!567449))

(declare-fun m!567451 () Bool)

(assert (=> b!588879 m!567451))

(assert (=> b!588877 m!567439))

(assert (=> b!588877 m!567439))

(declare-fun m!567453 () Bool)

(assert (=> b!588877 m!567453))

(declare-fun m!567455 () Bool)

(assert (=> start!53944 m!567455))

(declare-fun m!567457 () Bool)

(assert (=> start!53944 m!567457))

(assert (=> b!588882 m!567445))

(declare-fun m!567459 () Bool)

(assert (=> b!588882 m!567459))

(declare-fun m!567461 () Bool)

(assert (=> b!588880 m!567461))

(assert (=> b!588880 m!567439))

(assert (=> b!588880 m!567439))

(declare-fun m!567463 () Bool)

(assert (=> b!588880 m!567463))

(declare-fun m!567465 () Bool)

(assert (=> b!588872 m!567465))

(push 1)

