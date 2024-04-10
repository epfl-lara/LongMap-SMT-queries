; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54500 () Bool)

(assert start!54500)

(declare-fun b!594619 () Bool)

(declare-fun res!380566 () Bool)

(declare-fun e!339747 () Bool)

(assert (=> b!594619 (=> (not res!380566) (not e!339747))))

(declare-datatypes ((array!36960 0))(
  ( (array!36961 (arr!17744 (Array (_ BitVec 32) (_ BitVec 64))) (size!18108 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36960)

(declare-datatypes ((List!11785 0))(
  ( (Nil!11782) (Cons!11781 (h!12826 (_ BitVec 64)) (t!18013 List!11785)) )
))
(declare-fun arrayNoDuplicates!0 (array!36960 (_ BitVec 32) List!11785) Bool)

(assert (=> b!594619 (= res!380566 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11782))))

(declare-fun b!594620 () Bool)

(declare-fun res!380569 () Bool)

(declare-fun e!339744 () Bool)

(assert (=> b!594620 (=> (not res!380569) (not e!339744))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594620 (= res!380569 (and (= (size!18108 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18108 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18108 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594621 () Bool)

(declare-fun res!380575 () Bool)

(declare-fun e!339750 () Bool)

(assert (=> b!594621 (=> res!380575 e!339750)))

(declare-fun contains!2920 (List!11785 (_ BitVec 64)) Bool)

(assert (=> b!594621 (= res!380575 (contains!2920 Nil!11782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594622 () Bool)

(declare-fun res!380581 () Bool)

(assert (=> b!594622 (=> res!380581 e!339750)))

(declare-fun noDuplicate!239 (List!11785) Bool)

(assert (=> b!594622 (= res!380581 (not (noDuplicate!239 Nil!11782)))))

(declare-fun b!594623 () Bool)

(declare-datatypes ((Unit!18654 0))(
  ( (Unit!18655) )
))
(declare-fun e!339743 () Unit!18654)

(declare-fun Unit!18656 () Unit!18654)

(assert (=> b!594623 (= e!339743 Unit!18656)))

(assert (=> b!594623 false))

(declare-fun b!594624 () Bool)

(declare-fun e!339746 () Bool)

(declare-fun e!339741 () Bool)

(assert (=> b!594624 (= e!339746 e!339741)))

(declare-fun res!380570 () Bool)

(assert (=> b!594624 (=> res!380570 e!339741)))

(declare-fun lt!269942 () (_ BitVec 64))

(declare-fun lt!269950 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594624 (= res!380570 (or (not (= (select (arr!17744 a!2986) j!136) lt!269942)) (not (= (select (arr!17744 a!2986) j!136) lt!269950)) (bvsge j!136 index!984)))))

(declare-fun b!594625 () Bool)

(declare-fun e!339739 () Bool)

(declare-fun lt!269944 () array!36960)

(declare-fun arrayContainsKey!0 (array!36960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594625 (= e!339739 (arrayContainsKey!0 lt!269944 (select (arr!17744 a!2986) j!136) index!984))))

(declare-fun b!594626 () Bool)

(declare-fun e!339738 () Bool)

(declare-fun e!339745 () Bool)

(assert (=> b!594626 (= e!339738 (not e!339745))))

(declare-fun res!380584 () Bool)

(assert (=> b!594626 (=> res!380584 e!339745)))

(declare-datatypes ((SeekEntryResult!6184 0))(
  ( (MissingZero!6184 (index!26984 (_ BitVec 32))) (Found!6184 (index!26985 (_ BitVec 32))) (Intermediate!6184 (undefined!6996 Bool) (index!26986 (_ BitVec 32)) (x!55788 (_ BitVec 32))) (Undefined!6184) (MissingVacant!6184 (index!26987 (_ BitVec 32))) )
))
(declare-fun lt!269946 () SeekEntryResult!6184)

(assert (=> b!594626 (= res!380584 (not (= lt!269946 (Found!6184 index!984))))))

(declare-fun lt!269953 () Unit!18654)

(assert (=> b!594626 (= lt!269953 e!339743)))

(declare-fun c!67394 () Bool)

(assert (=> b!594626 (= c!67394 (= lt!269946 Undefined!6184))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36960 (_ BitVec 32)) SeekEntryResult!6184)

(assert (=> b!594626 (= lt!269946 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269942 lt!269944 mask!3053))))

(declare-fun e!339748 () Bool)

(assert (=> b!594626 e!339748))

(declare-fun res!380571 () Bool)

(assert (=> b!594626 (=> (not res!380571) (not e!339748))))

(declare-fun lt!269947 () (_ BitVec 32))

(declare-fun lt!269952 () SeekEntryResult!6184)

(assert (=> b!594626 (= res!380571 (= lt!269952 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269947 vacantSpotIndex!68 lt!269942 lt!269944 mask!3053)))))

(assert (=> b!594626 (= lt!269952 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269947 vacantSpotIndex!68 (select (arr!17744 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!594626 (= lt!269942 (select (store (arr!17744 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269949 () Unit!18654)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36960 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18654)

(assert (=> b!594626 (= lt!269949 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269947 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594626 (= lt!269947 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594627 () Bool)

(declare-fun res!380579 () Bool)

(assert (=> b!594627 (=> (not res!380579) (not e!339747))))

(assert (=> b!594627 (= res!380579 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17744 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594628 () Bool)

(declare-fun lt!269943 () SeekEntryResult!6184)

(assert (=> b!594628 (= e!339748 (= lt!269943 lt!269952))))

(declare-fun b!594629 () Bool)

(assert (=> b!594629 (= e!339750 true)))

(declare-fun lt!269945 () Bool)

(assert (=> b!594629 (= lt!269945 (contains!2920 Nil!11782 k!1786))))

(declare-fun b!594630 () Bool)

(declare-fun Unit!18657 () Unit!18654)

(assert (=> b!594630 (= e!339743 Unit!18657)))

(declare-fun b!594631 () Bool)

(declare-fun res!380585 () Bool)

(assert (=> b!594631 (=> (not res!380585) (not e!339744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594631 (= res!380585 (validKeyInArray!0 k!1786))))

(declare-fun b!594632 () Bool)

(assert (=> b!594632 (= e!339741 e!339739)))

(declare-fun res!380568 () Bool)

(assert (=> b!594632 (=> (not res!380568) (not e!339739))))

(assert (=> b!594632 (= res!380568 (arrayContainsKey!0 lt!269944 (select (arr!17744 a!2986) j!136) j!136))))

(declare-fun b!594633 () Bool)

(declare-fun e!339749 () Bool)

(assert (=> b!594633 (= e!339745 e!339749)))

(declare-fun res!380576 () Bool)

(assert (=> b!594633 (=> res!380576 e!339749)))

(assert (=> b!594633 (= res!380576 (or (not (= (select (arr!17744 a!2986) j!136) lt!269942)) (not (= (select (arr!17744 a!2986) j!136) lt!269950)) (bvsge j!136 index!984)))))

(assert (=> b!594633 e!339746))

(declare-fun res!380582 () Bool)

(assert (=> b!594633 (=> (not res!380582) (not e!339746))))

(assert (=> b!594633 (= res!380582 (= lt!269950 (select (arr!17744 a!2986) j!136)))))

(assert (=> b!594633 (= lt!269950 (select (store (arr!17744 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!594634 () Bool)

(declare-fun res!380580 () Bool)

(assert (=> b!594634 (=> (not res!380580) (not e!339747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36960 (_ BitVec 32)) Bool)

(assert (=> b!594634 (= res!380580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594635 () Bool)

(assert (=> b!594635 (= e!339749 e!339750)))

(declare-fun res!380578 () Bool)

(assert (=> b!594635 (=> res!380578 e!339750)))

(assert (=> b!594635 (= res!380578 (or (bvsge (size!18108 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18108 a!2986))))))

(assert (=> b!594635 (arrayContainsKey!0 lt!269944 (select (arr!17744 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269951 () Unit!18654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36960 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18654)

(assert (=> b!594635 (= lt!269951 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269944 (select (arr!17744 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!380572 () Bool)

(assert (=> start!54500 (=> (not res!380572) (not e!339744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54500 (= res!380572 (validMask!0 mask!3053))))

(assert (=> start!54500 e!339744))

(assert (=> start!54500 true))

(declare-fun array_inv!13540 (array!36960) Bool)

(assert (=> start!54500 (array_inv!13540 a!2986)))

(declare-fun b!594636 () Bool)

(assert (=> b!594636 (= e!339744 e!339747)))

(declare-fun res!380573 () Bool)

(assert (=> b!594636 (=> (not res!380573) (not e!339747))))

(declare-fun lt!269948 () SeekEntryResult!6184)

(assert (=> b!594636 (= res!380573 (or (= lt!269948 (MissingZero!6184 i!1108)) (= lt!269948 (MissingVacant!6184 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36960 (_ BitVec 32)) SeekEntryResult!6184)

(assert (=> b!594636 (= lt!269948 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!594637 () Bool)

(declare-fun res!380574 () Bool)

(assert (=> b!594637 (=> (not res!380574) (not e!339744))))

(assert (=> b!594637 (= res!380574 (validKeyInArray!0 (select (arr!17744 a!2986) j!136)))))

(declare-fun b!594638 () Bool)

(declare-fun e!339742 () Bool)

(assert (=> b!594638 (= e!339747 e!339742)))

(declare-fun res!380583 () Bool)

(assert (=> b!594638 (=> (not res!380583) (not e!339742))))

(assert (=> b!594638 (= res!380583 (= (select (store (arr!17744 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594638 (= lt!269944 (array!36961 (store (arr!17744 a!2986) i!1108 k!1786) (size!18108 a!2986)))))

(declare-fun b!594639 () Bool)

(declare-fun res!380577 () Bool)

(assert (=> b!594639 (=> res!380577 e!339750)))

(assert (=> b!594639 (= res!380577 (contains!2920 Nil!11782 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594640 () Bool)

(declare-fun res!380567 () Bool)

(assert (=> b!594640 (=> (not res!380567) (not e!339744))))

(assert (=> b!594640 (= res!380567 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594641 () Bool)

(assert (=> b!594641 (= e!339742 e!339738)))

(declare-fun res!380565 () Bool)

(assert (=> b!594641 (=> (not res!380565) (not e!339738))))

(assert (=> b!594641 (= res!380565 (and (= lt!269943 (Found!6184 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17744 a!2986) index!984) (select (arr!17744 a!2986) j!136))) (not (= (select (arr!17744 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!594641 (= lt!269943 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17744 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!54500 res!380572) b!594620))

(assert (= (and b!594620 res!380569) b!594637))

(assert (= (and b!594637 res!380574) b!594631))

(assert (= (and b!594631 res!380585) b!594640))

(assert (= (and b!594640 res!380567) b!594636))

(assert (= (and b!594636 res!380573) b!594634))

(assert (= (and b!594634 res!380580) b!594619))

(assert (= (and b!594619 res!380566) b!594627))

(assert (= (and b!594627 res!380579) b!594638))

(assert (= (and b!594638 res!380583) b!594641))

(assert (= (and b!594641 res!380565) b!594626))

(assert (= (and b!594626 res!380571) b!594628))

(assert (= (and b!594626 c!67394) b!594623))

(assert (= (and b!594626 (not c!67394)) b!594630))

(assert (= (and b!594626 (not res!380584)) b!594633))

(assert (= (and b!594633 res!380582) b!594624))

(assert (= (and b!594624 (not res!380570)) b!594632))

(assert (= (and b!594632 res!380568) b!594625))

(assert (= (and b!594633 (not res!380576)) b!594635))

(assert (= (and b!594635 (not res!380578)) b!594622))

(assert (= (and b!594622 (not res!380581)) b!594621))

(assert (= (and b!594621 (not res!380575)) b!594639))

(assert (= (and b!594639 (not res!380577)) b!594629))

(declare-fun m!572401 () Bool)

(assert (=> b!594625 m!572401))

(assert (=> b!594625 m!572401))

(declare-fun m!572403 () Bool)

(assert (=> b!594625 m!572403))

(declare-fun m!572405 () Bool)

(assert (=> b!594621 m!572405))

(assert (=> b!594635 m!572401))

(assert (=> b!594635 m!572401))

(declare-fun m!572407 () Bool)

(assert (=> b!594635 m!572407))

(assert (=> b!594635 m!572401))

(declare-fun m!572409 () Bool)

(assert (=> b!594635 m!572409))

(declare-fun m!572411 () Bool)

(assert (=> b!594640 m!572411))

(declare-fun m!572413 () Bool)

(assert (=> b!594631 m!572413))

(declare-fun m!572415 () Bool)

(assert (=> b!594639 m!572415))

(declare-fun m!572417 () Bool)

(assert (=> start!54500 m!572417))

(declare-fun m!572419 () Bool)

(assert (=> start!54500 m!572419))

(declare-fun m!572421 () Bool)

(assert (=> b!594627 m!572421))

(declare-fun m!572423 () Bool)

(assert (=> b!594622 m!572423))

(assert (=> b!594633 m!572401))

(declare-fun m!572425 () Bool)

(assert (=> b!594633 m!572425))

(declare-fun m!572427 () Bool)

(assert (=> b!594633 m!572427))

(declare-fun m!572429 () Bool)

(assert (=> b!594634 m!572429))

(declare-fun m!572431 () Bool)

(assert (=> b!594641 m!572431))

(assert (=> b!594641 m!572401))

(assert (=> b!594641 m!572401))

(declare-fun m!572433 () Bool)

(assert (=> b!594641 m!572433))

(declare-fun m!572435 () Bool)

(assert (=> b!594636 m!572435))

(assert (=> b!594632 m!572401))

(assert (=> b!594632 m!572401))

(declare-fun m!572437 () Bool)

(assert (=> b!594632 m!572437))

(assert (=> b!594624 m!572401))

(declare-fun m!572439 () Bool)

(assert (=> b!594629 m!572439))

(assert (=> b!594637 m!572401))

(assert (=> b!594637 m!572401))

(declare-fun m!572441 () Bool)

(assert (=> b!594637 m!572441))

(declare-fun m!572443 () Bool)

(assert (=> b!594619 m!572443))

(declare-fun m!572445 () Bool)

(assert (=> b!594626 m!572445))

(declare-fun m!572447 () Bool)

(assert (=> b!594626 m!572447))

(declare-fun m!572449 () Bool)

(assert (=> b!594626 m!572449))

(assert (=> b!594626 m!572401))

(assert (=> b!594626 m!572425))

(assert (=> b!594626 m!572401))

(declare-fun m!572451 () Bool)

(assert (=> b!594626 m!572451))

(declare-fun m!572453 () Bool)

(assert (=> b!594626 m!572453))

(declare-fun m!572455 () Bool)

(assert (=> b!594626 m!572455))

(assert (=> b!594638 m!572425))

(declare-fun m!572457 () Bool)

(assert (=> b!594638 m!572457))

(push 1)

