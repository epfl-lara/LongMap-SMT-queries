; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53288 () Bool)

(assert start!53288)

(declare-fun res!367219 () Bool)

(declare-fun e!332987 () Bool)

(assert (=> start!53288 (=> (not res!367219) (not e!332987))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53288 (= res!367219 (validMask!0 mask!3053))))

(assert (=> start!53288 e!332987))

(assert (=> start!53288 true))

(declare-datatypes ((array!36189 0))(
  ( (array!36190 (arr!17369 (Array (_ BitVec 32) (_ BitVec 64))) (size!17733 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36189)

(declare-fun array_inv!13165 (array!36189) Bool)

(assert (=> start!53288 (array_inv!13165 a!2986)))

(declare-fun b!579402 () Bool)

(declare-fun res!367225 () Bool)

(declare-fun e!332988 () Bool)

(assert (=> b!579402 (=> (not res!367225) (not e!332988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36189 (_ BitVec 32)) Bool)

(assert (=> b!579402 (= res!367225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579403 () Bool)

(assert (=> b!579403 (= e!332987 e!332988)))

(declare-fun res!367226 () Bool)

(assert (=> b!579403 (=> (not res!367226) (not e!332988))))

(declare-datatypes ((SeekEntryResult!5809 0))(
  ( (MissingZero!5809 (index!25463 (_ BitVec 32))) (Found!5809 (index!25464 (_ BitVec 32))) (Intermediate!5809 (undefined!6621 Bool) (index!25465 (_ BitVec 32)) (x!54350 (_ BitVec 32))) (Undefined!5809) (MissingVacant!5809 (index!25466 (_ BitVec 32))) )
))
(declare-fun lt!264475 () SeekEntryResult!5809)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579403 (= res!367226 (or (= lt!264475 (MissingZero!5809 i!1108)) (= lt!264475 (MissingVacant!5809 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36189 (_ BitVec 32)) SeekEntryResult!5809)

(assert (=> b!579403 (= lt!264475 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579404 () Bool)

(declare-fun res!367224 () Bool)

(assert (=> b!579404 (=> (not res!367224) (not e!332987))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579404 (= res!367224 (and (= (size!17733 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17733 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17733 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579405 () Bool)

(assert (=> b!579405 (= e!332988 false)))

(declare-fun lt!264474 () SeekEntryResult!5809)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36189 (_ BitVec 32)) SeekEntryResult!5809)

(assert (=> b!579405 (= lt!264474 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17369 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579406 () Bool)

(declare-fun res!367218 () Bool)

(assert (=> b!579406 (=> (not res!367218) (not e!332987))))

(declare-fun arrayContainsKey!0 (array!36189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579406 (= res!367218 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579407 () Bool)

(declare-fun res!367223 () Bool)

(assert (=> b!579407 (=> (not res!367223) (not e!332988))))

(declare-datatypes ((List!11410 0))(
  ( (Nil!11407) (Cons!11406 (h!12451 (_ BitVec 64)) (t!17638 List!11410)) )
))
(declare-fun arrayNoDuplicates!0 (array!36189 (_ BitVec 32) List!11410) Bool)

(assert (=> b!579407 (= res!367223 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11407))))

(declare-fun b!579408 () Bool)

(declare-fun res!367220 () Bool)

(assert (=> b!579408 (=> (not res!367220) (not e!332988))))

(assert (=> b!579408 (= res!367220 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17369 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17369 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579409 () Bool)

(declare-fun res!367222 () Bool)

(assert (=> b!579409 (=> (not res!367222) (not e!332987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579409 (= res!367222 (validKeyInArray!0 (select (arr!17369 a!2986) j!136)))))

(declare-fun b!579410 () Bool)

(declare-fun res!367221 () Bool)

(assert (=> b!579410 (=> (not res!367221) (not e!332987))))

(assert (=> b!579410 (= res!367221 (validKeyInArray!0 k!1786))))

(assert (= (and start!53288 res!367219) b!579404))

(assert (= (and b!579404 res!367224) b!579409))

(assert (= (and b!579409 res!367222) b!579410))

(assert (= (and b!579410 res!367221) b!579406))

(assert (= (and b!579406 res!367218) b!579403))

(assert (= (and b!579403 res!367226) b!579402))

(assert (= (and b!579402 res!367225) b!579407))

(assert (= (and b!579407 res!367223) b!579408))

(assert (= (and b!579408 res!367220) b!579405))

(declare-fun m!558023 () Bool)

(assert (=> b!579408 m!558023))

(declare-fun m!558025 () Bool)

(assert (=> b!579408 m!558025))

(declare-fun m!558027 () Bool)

(assert (=> b!579408 m!558027))

(declare-fun m!558029 () Bool)

(assert (=> b!579403 m!558029))

(declare-fun m!558031 () Bool)

(assert (=> b!579407 m!558031))

(declare-fun m!558033 () Bool)

(assert (=> start!53288 m!558033))

(declare-fun m!558035 () Bool)

(assert (=> start!53288 m!558035))

(declare-fun m!558037 () Bool)

(assert (=> b!579410 m!558037))

(declare-fun m!558039 () Bool)

(assert (=> b!579406 m!558039))

(declare-fun m!558041 () Bool)

(assert (=> b!579402 m!558041))

(declare-fun m!558043 () Bool)

(assert (=> b!579405 m!558043))

(assert (=> b!579405 m!558043))

(declare-fun m!558045 () Bool)

(assert (=> b!579405 m!558045))

(assert (=> b!579409 m!558043))

(assert (=> b!579409 m!558043))

(declare-fun m!558047 () Bool)

(assert (=> b!579409 m!558047))

(push 1)

