; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53312 () Bool)

(assert start!53312)

(declare-fun b!579726 () Bool)

(declare-fun e!333096 () Bool)

(declare-fun e!333094 () Bool)

(assert (=> b!579726 (= e!333096 e!333094)))

(declare-fun res!367546 () Bool)

(assert (=> b!579726 (=> (not res!367546) (not e!333094))))

(declare-datatypes ((SeekEntryResult!5821 0))(
  ( (MissingZero!5821 (index!25511 (_ BitVec 32))) (Found!5821 (index!25512 (_ BitVec 32))) (Intermediate!5821 (undefined!6633 Bool) (index!25513 (_ BitVec 32)) (x!54394 (_ BitVec 32))) (Undefined!5821) (MissingVacant!5821 (index!25514 (_ BitVec 32))) )
))
(declare-fun lt!264546 () SeekEntryResult!5821)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579726 (= res!367546 (or (= lt!264546 (MissingZero!5821 i!1108)) (= lt!264546 (MissingVacant!5821 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36213 0))(
  ( (array!36214 (arr!17381 (Array (_ BitVec 32) (_ BitVec 64))) (size!17745 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36213)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36213 (_ BitVec 32)) SeekEntryResult!5821)

(assert (=> b!579726 (= lt!264546 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579727 () Bool)

(declare-fun res!367547 () Bool)

(assert (=> b!579727 (=> (not res!367547) (not e!333096))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579727 (= res!367547 (validKeyInArray!0 (select (arr!17381 a!2986) j!136)))))

(declare-fun b!579728 () Bool)

(declare-fun res!367550 () Bool)

(assert (=> b!579728 (=> (not res!367550) (not e!333096))))

(assert (=> b!579728 (= res!367550 (validKeyInArray!0 k!1786))))

(declare-fun b!579729 () Bool)

(declare-fun res!367542 () Bool)

(assert (=> b!579729 (=> (not res!367542) (not e!333094))))

(declare-datatypes ((List!11422 0))(
  ( (Nil!11419) (Cons!11418 (h!12463 (_ BitVec 64)) (t!17650 List!11422)) )
))
(declare-fun arrayNoDuplicates!0 (array!36213 (_ BitVec 32) List!11422) Bool)

(assert (=> b!579729 (= res!367542 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11419))))

(declare-fun b!579730 () Bool)

(assert (=> b!579730 (= e!333094 false)))

(declare-fun lt!264547 () SeekEntryResult!5821)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36213 (_ BitVec 32)) SeekEntryResult!5821)

(assert (=> b!579730 (= lt!264547 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17381 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579731 () Bool)

(declare-fun res!367548 () Bool)

(assert (=> b!579731 (=> (not res!367548) (not e!333094))))

(assert (=> b!579731 (= res!367548 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17381 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17381 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579732 () Bool)

(declare-fun res!367545 () Bool)

(assert (=> b!579732 (=> (not res!367545) (not e!333094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36213 (_ BitVec 32)) Bool)

(assert (=> b!579732 (= res!367545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579733 () Bool)

(declare-fun res!367544 () Bool)

(assert (=> b!579733 (=> (not res!367544) (not e!333096))))

(assert (=> b!579733 (= res!367544 (and (= (size!17745 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17745 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17745 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!367543 () Bool)

(assert (=> start!53312 (=> (not res!367543) (not e!333096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53312 (= res!367543 (validMask!0 mask!3053))))

(assert (=> start!53312 e!333096))

(assert (=> start!53312 true))

(declare-fun array_inv!13177 (array!36213) Bool)

(assert (=> start!53312 (array_inv!13177 a!2986)))

(declare-fun b!579734 () Bool)

(declare-fun res!367549 () Bool)

(assert (=> b!579734 (=> (not res!367549) (not e!333096))))

(declare-fun arrayContainsKey!0 (array!36213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579734 (= res!367549 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53312 res!367543) b!579733))

(assert (= (and b!579733 res!367544) b!579727))

(assert (= (and b!579727 res!367547) b!579728))

(assert (= (and b!579728 res!367550) b!579734))

(assert (= (and b!579734 res!367549) b!579726))

(assert (= (and b!579726 res!367546) b!579732))

(assert (= (and b!579732 res!367545) b!579729))

(assert (= (and b!579729 res!367542) b!579731))

(assert (= (and b!579731 res!367548) b!579730))

(declare-fun m!558335 () Bool)

(assert (=> start!53312 m!558335))

(declare-fun m!558337 () Bool)

(assert (=> start!53312 m!558337))

(declare-fun m!558339 () Bool)

(assert (=> b!579727 m!558339))

(assert (=> b!579727 m!558339))

(declare-fun m!558341 () Bool)

(assert (=> b!579727 m!558341))

(assert (=> b!579730 m!558339))

(assert (=> b!579730 m!558339))

(declare-fun m!558343 () Bool)

(assert (=> b!579730 m!558343))

(declare-fun m!558345 () Bool)

(assert (=> b!579728 m!558345))

(declare-fun m!558347 () Bool)

(assert (=> b!579732 m!558347))

(declare-fun m!558349 () Bool)

(assert (=> b!579731 m!558349))

(declare-fun m!558351 () Bool)

(assert (=> b!579731 m!558351))

(declare-fun m!558353 () Bool)

(assert (=> b!579731 m!558353))

(declare-fun m!558355 () Bool)

(assert (=> b!579729 m!558355))

(declare-fun m!558357 () Bool)

(assert (=> b!579734 m!558357))

(declare-fun m!558359 () Bool)

(assert (=> b!579726 m!558359))

(push 1)

(assert (not b!579726))

(assert (not b!579729))

(assert (not start!53312))

(assert (not b!579732))

(assert (not b!579727))

(assert (not b!579728))

(assert (not b!579734))

(assert (not b!579730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

