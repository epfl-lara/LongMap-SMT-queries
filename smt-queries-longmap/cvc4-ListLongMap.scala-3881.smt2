; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53300 () Bool)

(assert start!53300)

(declare-fun b!579564 () Bool)

(declare-fun res!367387 () Bool)

(declare-fun e!333041 () Bool)

(assert (=> b!579564 (=> (not res!367387) (not e!333041))))

(declare-datatypes ((array!36201 0))(
  ( (array!36202 (arr!17375 (Array (_ BitVec 32) (_ BitVec 64))) (size!17739 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36201)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579564 (= res!367387 (validKeyInArray!0 (select (arr!17375 a!2986) j!136)))))

(declare-fun b!579565 () Bool)

(declare-fun res!367385 () Bool)

(assert (=> b!579565 (=> (not res!367385) (not e!333041))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579565 (= res!367385 (and (= (size!17739 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17739 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17739 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!367386 () Bool)

(assert (=> start!53300 (=> (not res!367386) (not e!333041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53300 (= res!367386 (validMask!0 mask!3053))))

(assert (=> start!53300 e!333041))

(assert (=> start!53300 true))

(declare-fun array_inv!13171 (array!36201) Bool)

(assert (=> start!53300 (array_inv!13171 a!2986)))

(declare-fun b!579566 () Bool)

(declare-fun res!367381 () Bool)

(assert (=> b!579566 (=> (not res!367381) (not e!333041))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!579566 (= res!367381 (validKeyInArray!0 k!1786))))

(declare-fun b!579567 () Bool)

(declare-fun e!333040 () Bool)

(assert (=> b!579567 (= e!333040 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5815 0))(
  ( (MissingZero!5815 (index!25487 (_ BitVec 32))) (Found!5815 (index!25488 (_ BitVec 32))) (Intermediate!5815 (undefined!6627 Bool) (index!25489 (_ BitVec 32)) (x!54372 (_ BitVec 32))) (Undefined!5815) (MissingVacant!5815 (index!25490 (_ BitVec 32))) )
))
(declare-fun lt!264510 () SeekEntryResult!5815)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36201 (_ BitVec 32)) SeekEntryResult!5815)

(assert (=> b!579567 (= lt!264510 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17375 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579568 () Bool)

(declare-fun res!367383 () Bool)

(assert (=> b!579568 (=> (not res!367383) (not e!333041))))

(declare-fun arrayContainsKey!0 (array!36201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579568 (= res!367383 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579569 () Bool)

(declare-fun res!367388 () Bool)

(assert (=> b!579569 (=> (not res!367388) (not e!333040))))

(assert (=> b!579569 (= res!367388 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17375 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17375 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579570 () Bool)

(declare-fun res!367380 () Bool)

(assert (=> b!579570 (=> (not res!367380) (not e!333040))))

(declare-datatypes ((List!11416 0))(
  ( (Nil!11413) (Cons!11412 (h!12457 (_ BitVec 64)) (t!17644 List!11416)) )
))
(declare-fun arrayNoDuplicates!0 (array!36201 (_ BitVec 32) List!11416) Bool)

(assert (=> b!579570 (= res!367380 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11413))))

(declare-fun b!579571 () Bool)

(declare-fun res!367384 () Bool)

(assert (=> b!579571 (=> (not res!367384) (not e!333040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36201 (_ BitVec 32)) Bool)

(assert (=> b!579571 (= res!367384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579572 () Bool)

(assert (=> b!579572 (= e!333041 e!333040)))

(declare-fun res!367382 () Bool)

(assert (=> b!579572 (=> (not res!367382) (not e!333040))))

(declare-fun lt!264511 () SeekEntryResult!5815)

(assert (=> b!579572 (= res!367382 (or (= lt!264511 (MissingZero!5815 i!1108)) (= lt!264511 (MissingVacant!5815 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36201 (_ BitVec 32)) SeekEntryResult!5815)

(assert (=> b!579572 (= lt!264511 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53300 res!367386) b!579565))

(assert (= (and b!579565 res!367385) b!579564))

(assert (= (and b!579564 res!367387) b!579566))

(assert (= (and b!579566 res!367381) b!579568))

(assert (= (and b!579568 res!367383) b!579572))

(assert (= (and b!579572 res!367382) b!579571))

(assert (= (and b!579571 res!367384) b!579570))

(assert (= (and b!579570 res!367380) b!579569))

(assert (= (and b!579569 res!367388) b!579567))

(declare-fun m!558179 () Bool)

(assert (=> start!53300 m!558179))

(declare-fun m!558181 () Bool)

(assert (=> start!53300 m!558181))

(declare-fun m!558183 () Bool)

(assert (=> b!579564 m!558183))

(assert (=> b!579564 m!558183))

(declare-fun m!558185 () Bool)

(assert (=> b!579564 m!558185))

(declare-fun m!558187 () Bool)

(assert (=> b!579568 m!558187))

(declare-fun m!558189 () Bool)

(assert (=> b!579571 m!558189))

(declare-fun m!558191 () Bool)

(assert (=> b!579570 m!558191))

(declare-fun m!558193 () Bool)

(assert (=> b!579569 m!558193))

(declare-fun m!558195 () Bool)

(assert (=> b!579569 m!558195))

(declare-fun m!558197 () Bool)

(assert (=> b!579569 m!558197))

(declare-fun m!558199 () Bool)

(assert (=> b!579566 m!558199))

(assert (=> b!579567 m!558183))

(assert (=> b!579567 m!558183))

(declare-fun m!558201 () Bool)

(assert (=> b!579567 m!558201))

(declare-fun m!558203 () Bool)

(assert (=> b!579572 m!558203))

(push 1)

(assert (not start!53300))

(assert (not b!579566))

(assert (not b!579568))

(assert (not b!579571))

(assert (not b!579567))

(assert (not b!579570))

(assert (not b!579572))

(assert (not b!579564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

