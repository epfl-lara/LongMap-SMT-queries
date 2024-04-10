; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53230 () Bool)

(assert start!53230)

(declare-fun b!578610 () Bool)

(declare-fun e!332725 () Bool)

(declare-fun e!332727 () Bool)

(assert (=> b!578610 (= e!332725 e!332727)))

(declare-fun res!366426 () Bool)

(assert (=> b!578610 (=> (not res!366426) (not e!332727))))

(declare-datatypes ((SeekEntryResult!5780 0))(
  ( (MissingZero!5780 (index!25347 (_ BitVec 32))) (Found!5780 (index!25348 (_ BitVec 32))) (Intermediate!5780 (undefined!6592 Bool) (index!25349 (_ BitVec 32)) (x!54249 (_ BitVec 32))) (Undefined!5780) (MissingVacant!5780 (index!25350 (_ BitVec 32))) )
))
(declare-fun lt!264309 () SeekEntryResult!5780)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578610 (= res!366426 (or (= lt!264309 (MissingZero!5780 i!1108)) (= lt!264309 (MissingVacant!5780 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36131 0))(
  ( (array!36132 (arr!17340 (Array (_ BitVec 32) (_ BitVec 64))) (size!17704 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36131)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36131 (_ BitVec 32)) SeekEntryResult!5780)

(assert (=> b!578610 (= lt!264309 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578611 () Bool)

(declare-fun res!366428 () Bool)

(assert (=> b!578611 (=> (not res!366428) (not e!332725))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578611 (= res!366428 (validKeyInArray!0 (select (arr!17340 a!2986) j!136)))))

(declare-fun res!366433 () Bool)

(assert (=> start!53230 (=> (not res!366433) (not e!332725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53230 (= res!366433 (validMask!0 mask!3053))))

(assert (=> start!53230 e!332725))

(assert (=> start!53230 true))

(declare-fun array_inv!13136 (array!36131) Bool)

(assert (=> start!53230 (array_inv!13136 a!2986)))

(declare-fun b!578612 () Bool)

(declare-fun res!366427 () Bool)

(assert (=> b!578612 (=> (not res!366427) (not e!332725))))

(assert (=> b!578612 (= res!366427 (validKeyInArray!0 k!1786))))

(declare-fun b!578613 () Bool)

(declare-fun res!366431 () Bool)

(assert (=> b!578613 (=> (not res!366431) (not e!332725))))

(assert (=> b!578613 (= res!366431 (and (= (size!17704 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17704 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17704 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578614 () Bool)

(declare-fun res!366432 () Bool)

(assert (=> b!578614 (=> (not res!366432) (not e!332727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36131 (_ BitVec 32)) Bool)

(assert (=> b!578614 (= res!366432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578615 () Bool)

(declare-fun res!366429 () Bool)

(assert (=> b!578615 (=> (not res!366429) (not e!332727))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578615 (= res!366429 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17340 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17340 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578616 () Bool)

(assert (=> b!578616 (= e!332727 false)))

(declare-fun lt!264310 () SeekEntryResult!5780)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36131 (_ BitVec 32)) SeekEntryResult!5780)

(assert (=> b!578616 (= lt!264310 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17340 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578617 () Bool)

(declare-fun res!366434 () Bool)

(assert (=> b!578617 (=> (not res!366434) (not e!332727))))

(declare-datatypes ((List!11381 0))(
  ( (Nil!11378) (Cons!11377 (h!12422 (_ BitVec 64)) (t!17609 List!11381)) )
))
(declare-fun arrayNoDuplicates!0 (array!36131 (_ BitVec 32) List!11381) Bool)

(assert (=> b!578617 (= res!366434 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11378))))

(declare-fun b!578618 () Bool)

(declare-fun res!366430 () Bool)

(assert (=> b!578618 (=> (not res!366430) (not e!332725))))

(declare-fun arrayContainsKey!0 (array!36131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578618 (= res!366430 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53230 res!366433) b!578613))

(assert (= (and b!578613 res!366431) b!578611))

(assert (= (and b!578611 res!366428) b!578612))

(assert (= (and b!578612 res!366427) b!578618))

(assert (= (and b!578618 res!366430) b!578610))

(assert (= (and b!578610 res!366426) b!578614))

(assert (= (and b!578614 res!366432) b!578617))

(assert (= (and b!578617 res!366434) b!578615))

(assert (= (and b!578615 res!366429) b!578616))

(declare-fun m!557269 () Bool)

(assert (=> b!578615 m!557269))

(declare-fun m!557271 () Bool)

(assert (=> b!578615 m!557271))

(declare-fun m!557273 () Bool)

(assert (=> b!578615 m!557273))

(declare-fun m!557275 () Bool)

(assert (=> b!578618 m!557275))

(declare-fun m!557277 () Bool)

(assert (=> b!578617 m!557277))

(declare-fun m!557279 () Bool)

(assert (=> b!578616 m!557279))

(assert (=> b!578616 m!557279))

(declare-fun m!557281 () Bool)

(assert (=> b!578616 m!557281))

(declare-fun m!557283 () Bool)

(assert (=> b!578610 m!557283))

(declare-fun m!557285 () Bool)

(assert (=> b!578614 m!557285))

(declare-fun m!557287 () Bool)

(assert (=> b!578612 m!557287))

(assert (=> b!578611 m!557279))

(assert (=> b!578611 m!557279))

(declare-fun m!557289 () Bool)

(assert (=> b!578611 m!557289))

(declare-fun m!557291 () Bool)

(assert (=> start!53230 m!557291))

(declare-fun m!557293 () Bool)

(assert (=> start!53230 m!557293))

(push 1)

