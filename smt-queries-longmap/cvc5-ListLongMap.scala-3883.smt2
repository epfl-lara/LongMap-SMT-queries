; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53308 () Bool)

(assert start!53308)

(declare-fun b!579672 () Bool)

(declare-fun res!367494 () Bool)

(declare-fun e!333078 () Bool)

(assert (=> b!579672 (=> (not res!367494) (not e!333078))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36209 0))(
  ( (array!36210 (arr!17379 (Array (_ BitVec 32) (_ BitVec 64))) (size!17743 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36209)

(assert (=> b!579672 (= res!367494 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17379 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17379 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579673 () Bool)

(declare-fun res!367488 () Bool)

(declare-fun e!333077 () Bool)

(assert (=> b!579673 (=> (not res!367488) (not e!333077))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579673 (= res!367488 (and (= (size!17743 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17743 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17743 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579674 () Bool)

(declare-fun res!367495 () Bool)

(assert (=> b!579674 (=> (not res!367495) (not e!333077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579674 (= res!367495 (validKeyInArray!0 k!1786))))

(declare-fun b!579675 () Bool)

(declare-fun res!367490 () Bool)

(assert (=> b!579675 (=> (not res!367490) (not e!333077))))

(declare-fun arrayContainsKey!0 (array!36209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579675 (= res!367490 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579676 () Bool)

(assert (=> b!579676 (= e!333077 e!333078)))

(declare-fun res!367493 () Bool)

(assert (=> b!579676 (=> (not res!367493) (not e!333078))))

(declare-datatypes ((SeekEntryResult!5819 0))(
  ( (MissingZero!5819 (index!25503 (_ BitVec 32))) (Found!5819 (index!25504 (_ BitVec 32))) (Intermediate!5819 (undefined!6631 Bool) (index!25505 (_ BitVec 32)) (x!54392 (_ BitVec 32))) (Undefined!5819) (MissingVacant!5819 (index!25506 (_ BitVec 32))) )
))
(declare-fun lt!264535 () SeekEntryResult!5819)

(assert (=> b!579676 (= res!367493 (or (= lt!264535 (MissingZero!5819 i!1108)) (= lt!264535 (MissingVacant!5819 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36209 (_ BitVec 32)) SeekEntryResult!5819)

(assert (=> b!579676 (= lt!264535 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!367496 () Bool)

(assert (=> start!53308 (=> (not res!367496) (not e!333077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53308 (= res!367496 (validMask!0 mask!3053))))

(assert (=> start!53308 e!333077))

(assert (=> start!53308 true))

(declare-fun array_inv!13175 (array!36209) Bool)

(assert (=> start!53308 (array_inv!13175 a!2986)))

(declare-fun b!579677 () Bool)

(declare-fun res!367491 () Bool)

(assert (=> b!579677 (=> (not res!367491) (not e!333078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36209 (_ BitVec 32)) Bool)

(assert (=> b!579677 (= res!367491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579678 () Bool)

(assert (=> b!579678 (= e!333078 false)))

(declare-fun lt!264534 () SeekEntryResult!5819)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36209 (_ BitVec 32)) SeekEntryResult!5819)

(assert (=> b!579678 (= lt!264534 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17379 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579679 () Bool)

(declare-fun res!367492 () Bool)

(assert (=> b!579679 (=> (not res!367492) (not e!333078))))

(declare-datatypes ((List!11420 0))(
  ( (Nil!11417) (Cons!11416 (h!12461 (_ BitVec 64)) (t!17648 List!11420)) )
))
(declare-fun arrayNoDuplicates!0 (array!36209 (_ BitVec 32) List!11420) Bool)

(assert (=> b!579679 (= res!367492 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11417))))

(declare-fun b!579680 () Bool)

(declare-fun res!367489 () Bool)

(assert (=> b!579680 (=> (not res!367489) (not e!333077))))

(assert (=> b!579680 (= res!367489 (validKeyInArray!0 (select (arr!17379 a!2986) j!136)))))

(assert (= (and start!53308 res!367496) b!579673))

(assert (= (and b!579673 res!367488) b!579680))

(assert (= (and b!579680 res!367489) b!579674))

(assert (= (and b!579674 res!367495) b!579675))

(assert (= (and b!579675 res!367490) b!579676))

(assert (= (and b!579676 res!367493) b!579677))

(assert (= (and b!579677 res!367491) b!579679))

(assert (= (and b!579679 res!367492) b!579672))

(assert (= (and b!579672 res!367494) b!579678))

(declare-fun m!558283 () Bool)

(assert (=> b!579672 m!558283))

(declare-fun m!558285 () Bool)

(assert (=> b!579672 m!558285))

(declare-fun m!558287 () Bool)

(assert (=> b!579672 m!558287))

(declare-fun m!558289 () Bool)

(assert (=> b!579679 m!558289))

(declare-fun m!558291 () Bool)

(assert (=> b!579675 m!558291))

(declare-fun m!558293 () Bool)

(assert (=> b!579676 m!558293))

(declare-fun m!558295 () Bool)

(assert (=> start!53308 m!558295))

(declare-fun m!558297 () Bool)

(assert (=> start!53308 m!558297))

(declare-fun m!558299 () Bool)

(assert (=> b!579680 m!558299))

(assert (=> b!579680 m!558299))

(declare-fun m!558301 () Bool)

(assert (=> b!579680 m!558301))

(declare-fun m!558303 () Bool)

(assert (=> b!579677 m!558303))

(assert (=> b!579678 m!558299))

(assert (=> b!579678 m!558299))

(declare-fun m!558305 () Bool)

(assert (=> b!579678 m!558305))

(declare-fun m!558307 () Bool)

(assert (=> b!579674 m!558307))

(push 1)

(assert (not b!579678))

(assert (not b!579676))

(assert (not b!579677))

(assert (not b!579680))

(assert (not b!579674))

(assert (not b!579675))

(assert (not start!53308))

(assert (not b!579679))

