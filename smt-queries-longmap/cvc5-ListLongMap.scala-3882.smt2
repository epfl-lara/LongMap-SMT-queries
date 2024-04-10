; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53302 () Bool)

(assert start!53302)

(declare-fun res!367408 () Bool)

(declare-fun e!333050 () Bool)

(assert (=> start!53302 (=> (not res!367408) (not e!333050))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53302 (= res!367408 (validMask!0 mask!3053))))

(assert (=> start!53302 e!333050))

(assert (=> start!53302 true))

(declare-datatypes ((array!36203 0))(
  ( (array!36204 (arr!17376 (Array (_ BitVec 32) (_ BitVec 64))) (size!17740 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36203)

(declare-fun array_inv!13172 (array!36203) Bool)

(assert (=> start!53302 (array_inv!13172 a!2986)))

(declare-fun b!579591 () Bool)

(declare-fun res!367407 () Bool)

(declare-fun e!333049 () Bool)

(assert (=> b!579591 (=> (not res!367407) (not e!333049))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579591 (= res!367407 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17376 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17376 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579592 () Bool)

(assert (=> b!579592 (= e!333050 e!333049)))

(declare-fun res!367414 () Bool)

(assert (=> b!579592 (=> (not res!367414) (not e!333049))))

(declare-datatypes ((SeekEntryResult!5816 0))(
  ( (MissingZero!5816 (index!25491 (_ BitVec 32))) (Found!5816 (index!25492 (_ BitVec 32))) (Intermediate!5816 (undefined!6628 Bool) (index!25493 (_ BitVec 32)) (x!54381 (_ BitVec 32))) (Undefined!5816) (MissingVacant!5816 (index!25494 (_ BitVec 32))) )
))
(declare-fun lt!264517 () SeekEntryResult!5816)

(assert (=> b!579592 (= res!367414 (or (= lt!264517 (MissingZero!5816 i!1108)) (= lt!264517 (MissingVacant!5816 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36203 (_ BitVec 32)) SeekEntryResult!5816)

(assert (=> b!579592 (= lt!264517 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579593 () Bool)

(declare-fun res!367412 () Bool)

(assert (=> b!579593 (=> (not res!367412) (not e!333049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36203 (_ BitVec 32)) Bool)

(assert (=> b!579593 (= res!367412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579594 () Bool)

(assert (=> b!579594 (= e!333049 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!264516 () SeekEntryResult!5816)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36203 (_ BitVec 32)) SeekEntryResult!5816)

(assert (=> b!579594 (= lt!264516 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17376 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579595 () Bool)

(declare-fun res!367411 () Bool)

(assert (=> b!579595 (=> (not res!367411) (not e!333049))))

(declare-datatypes ((List!11417 0))(
  ( (Nil!11414) (Cons!11413 (h!12458 (_ BitVec 64)) (t!17645 List!11417)) )
))
(declare-fun arrayNoDuplicates!0 (array!36203 (_ BitVec 32) List!11417) Bool)

(assert (=> b!579595 (= res!367411 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11414))))

(declare-fun b!579596 () Bool)

(declare-fun res!367415 () Bool)

(assert (=> b!579596 (=> (not res!367415) (not e!333050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579596 (= res!367415 (validKeyInArray!0 k!1786))))

(declare-fun b!579597 () Bool)

(declare-fun res!367410 () Bool)

(assert (=> b!579597 (=> (not res!367410) (not e!333050))))

(assert (=> b!579597 (= res!367410 (validKeyInArray!0 (select (arr!17376 a!2986) j!136)))))

(declare-fun b!579598 () Bool)

(declare-fun res!367413 () Bool)

(assert (=> b!579598 (=> (not res!367413) (not e!333050))))

(declare-fun arrayContainsKey!0 (array!36203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579598 (= res!367413 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579599 () Bool)

(declare-fun res!367409 () Bool)

(assert (=> b!579599 (=> (not res!367409) (not e!333050))))

(assert (=> b!579599 (= res!367409 (and (= (size!17740 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17740 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17740 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53302 res!367408) b!579599))

(assert (= (and b!579599 res!367409) b!579597))

(assert (= (and b!579597 res!367410) b!579596))

(assert (= (and b!579596 res!367415) b!579598))

(assert (= (and b!579598 res!367413) b!579592))

(assert (= (and b!579592 res!367414) b!579593))

(assert (= (and b!579593 res!367412) b!579595))

(assert (= (and b!579595 res!367411) b!579591))

(assert (= (and b!579591 res!367407) b!579594))

(declare-fun m!558205 () Bool)

(assert (=> b!579593 m!558205))

(declare-fun m!558207 () Bool)

(assert (=> b!579591 m!558207))

(declare-fun m!558209 () Bool)

(assert (=> b!579591 m!558209))

(declare-fun m!558211 () Bool)

(assert (=> b!579591 m!558211))

(declare-fun m!558213 () Bool)

(assert (=> start!53302 m!558213))

(declare-fun m!558215 () Bool)

(assert (=> start!53302 m!558215))

(declare-fun m!558217 () Bool)

(assert (=> b!579592 m!558217))

(declare-fun m!558219 () Bool)

(assert (=> b!579594 m!558219))

(assert (=> b!579594 m!558219))

(declare-fun m!558221 () Bool)

(assert (=> b!579594 m!558221))

(declare-fun m!558223 () Bool)

(assert (=> b!579598 m!558223))

(declare-fun m!558225 () Bool)

(assert (=> b!579595 m!558225))

(declare-fun m!558227 () Bool)

(assert (=> b!579596 m!558227))

(assert (=> b!579597 m!558219))

(assert (=> b!579597 m!558219))

(declare-fun m!558229 () Bool)

(assert (=> b!579597 m!558229))

(push 1)

(assert (not b!579593))

(assert (not b!579594))

(assert (not b!579596))

(assert (not b!579592))

(assert (not b!579595))

(assert (not b!579597))

(assert (not b!579598))

(assert (not start!53302))

(check-sat)

