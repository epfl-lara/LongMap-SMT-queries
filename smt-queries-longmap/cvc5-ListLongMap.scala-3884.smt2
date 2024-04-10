; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53314 () Bool)

(assert start!53314)

(declare-fun res!367574 () Bool)

(declare-fun e!333104 () Bool)

(assert (=> start!53314 (=> (not res!367574) (not e!333104))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53314 (= res!367574 (validMask!0 mask!3053))))

(assert (=> start!53314 e!333104))

(assert (=> start!53314 true))

(declare-datatypes ((array!36215 0))(
  ( (array!36216 (arr!17382 (Array (_ BitVec 32) (_ BitVec 64))) (size!17746 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36215)

(declare-fun array_inv!13178 (array!36215) Bool)

(assert (=> start!53314 (array_inv!13178 a!2986)))

(declare-fun b!579753 () Bool)

(declare-fun res!367576 () Bool)

(assert (=> b!579753 (=> (not res!367576) (not e!333104))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579753 (= res!367576 (validKeyInArray!0 k!1786))))

(declare-fun b!579754 () Bool)

(declare-fun res!367569 () Bool)

(assert (=> b!579754 (=> (not res!367569) (not e!333104))))

(declare-fun arrayContainsKey!0 (array!36215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579754 (= res!367569 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579755 () Bool)

(declare-fun e!333105 () Bool)

(assert (=> b!579755 (= e!333104 e!333105)))

(declare-fun res!367572 () Bool)

(assert (=> b!579755 (=> (not res!367572) (not e!333105))))

(declare-datatypes ((SeekEntryResult!5822 0))(
  ( (MissingZero!5822 (index!25515 (_ BitVec 32))) (Found!5822 (index!25516 (_ BitVec 32))) (Intermediate!5822 (undefined!6634 Bool) (index!25517 (_ BitVec 32)) (x!54403 (_ BitVec 32))) (Undefined!5822) (MissingVacant!5822 (index!25518 (_ BitVec 32))) )
))
(declare-fun lt!264553 () SeekEntryResult!5822)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579755 (= res!367572 (or (= lt!264553 (MissingZero!5822 i!1108)) (= lt!264553 (MissingVacant!5822 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36215 (_ BitVec 32)) SeekEntryResult!5822)

(assert (=> b!579755 (= lt!264553 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579756 () Bool)

(assert (=> b!579756 (= e!333105 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264552 () SeekEntryResult!5822)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36215 (_ BitVec 32)) SeekEntryResult!5822)

(assert (=> b!579756 (= lt!264552 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17382 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579757 () Bool)

(declare-fun res!367575 () Bool)

(assert (=> b!579757 (=> (not res!367575) (not e!333105))))

(declare-datatypes ((List!11423 0))(
  ( (Nil!11420) (Cons!11419 (h!12464 (_ BitVec 64)) (t!17651 List!11423)) )
))
(declare-fun arrayNoDuplicates!0 (array!36215 (_ BitVec 32) List!11423) Bool)

(assert (=> b!579757 (= res!367575 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11420))))

(declare-fun b!579758 () Bool)

(declare-fun res!367577 () Bool)

(assert (=> b!579758 (=> (not res!367577) (not e!333105))))

(assert (=> b!579758 (= res!367577 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17382 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17382 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579759 () Bool)

(declare-fun res!367571 () Bool)

(assert (=> b!579759 (=> (not res!367571) (not e!333104))))

(assert (=> b!579759 (= res!367571 (and (= (size!17746 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17746 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17746 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579760 () Bool)

(declare-fun res!367570 () Bool)

(assert (=> b!579760 (=> (not res!367570) (not e!333105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36215 (_ BitVec 32)) Bool)

(assert (=> b!579760 (= res!367570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579761 () Bool)

(declare-fun res!367573 () Bool)

(assert (=> b!579761 (=> (not res!367573) (not e!333104))))

(assert (=> b!579761 (= res!367573 (validKeyInArray!0 (select (arr!17382 a!2986) j!136)))))

(assert (= (and start!53314 res!367574) b!579759))

(assert (= (and b!579759 res!367571) b!579761))

(assert (= (and b!579761 res!367573) b!579753))

(assert (= (and b!579753 res!367576) b!579754))

(assert (= (and b!579754 res!367569) b!579755))

(assert (= (and b!579755 res!367572) b!579760))

(assert (= (and b!579760 res!367570) b!579757))

(assert (= (and b!579757 res!367575) b!579758))

(assert (= (and b!579758 res!367577) b!579756))

(declare-fun m!558361 () Bool)

(assert (=> b!579757 m!558361))

(declare-fun m!558363 () Bool)

(assert (=> b!579758 m!558363))

(declare-fun m!558365 () Bool)

(assert (=> b!579758 m!558365))

(declare-fun m!558367 () Bool)

(assert (=> b!579758 m!558367))

(declare-fun m!558369 () Bool)

(assert (=> b!579756 m!558369))

(assert (=> b!579756 m!558369))

(declare-fun m!558371 () Bool)

(assert (=> b!579756 m!558371))

(declare-fun m!558373 () Bool)

(assert (=> b!579754 m!558373))

(declare-fun m!558375 () Bool)

(assert (=> b!579753 m!558375))

(assert (=> b!579761 m!558369))

(assert (=> b!579761 m!558369))

(declare-fun m!558377 () Bool)

(assert (=> b!579761 m!558377))

(declare-fun m!558379 () Bool)

(assert (=> start!53314 m!558379))

(declare-fun m!558381 () Bool)

(assert (=> start!53314 m!558381))

(declare-fun m!558383 () Bool)

(assert (=> b!579760 m!558383))

(declare-fun m!558385 () Bool)

(assert (=> b!579755 m!558385))

(push 1)

