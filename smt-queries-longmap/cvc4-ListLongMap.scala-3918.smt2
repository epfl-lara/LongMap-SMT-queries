; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53522 () Bool)

(assert start!53522)

(declare-fun b!582597 () Bool)

(declare-fun res!370415 () Bool)

(declare-fun e!334041 () Bool)

(assert (=> b!582597 (=> (not res!370415) (not e!334041))))

(declare-datatypes ((array!36423 0))(
  ( (array!36424 (arr!17486 (Array (_ BitVec 32) (_ BitVec 64))) (size!17850 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36423)

(declare-datatypes ((List!11527 0))(
  ( (Nil!11524) (Cons!11523 (h!12568 (_ BitVec 64)) (t!17755 List!11527)) )
))
(declare-fun arrayNoDuplicates!0 (array!36423 (_ BitVec 32) List!11527) Bool)

(assert (=> b!582597 (= res!370415 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11524))))

(declare-fun b!582598 () Bool)

(declare-fun res!370417 () Bool)

(assert (=> b!582598 (=> (not res!370417) (not e!334041))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582598 (= res!370417 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17486 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17486 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582599 () Bool)

(declare-fun res!370413 () Bool)

(declare-fun e!334039 () Bool)

(assert (=> b!582599 (=> (not res!370413) (not e!334039))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582599 (= res!370413 (and (= (size!17850 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17850 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17850 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!370420 () Bool)

(assert (=> start!53522 (=> (not res!370420) (not e!334039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53522 (= res!370420 (validMask!0 mask!3053))))

(assert (=> start!53522 e!334039))

(assert (=> start!53522 true))

(declare-fun array_inv!13282 (array!36423) Bool)

(assert (=> start!53522 (array_inv!13282 a!2986)))

(declare-fun b!582600 () Bool)

(declare-fun res!370419 () Bool)

(assert (=> b!582600 (=> (not res!370419) (not e!334039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582600 (= res!370419 (validKeyInArray!0 k!1786))))

(declare-fun b!582601 () Bool)

(declare-fun res!370416 () Bool)

(assert (=> b!582601 (=> (not res!370416) (not e!334039))))

(declare-fun arrayContainsKey!0 (array!36423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582601 (= res!370416 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582602 () Bool)

(assert (=> b!582602 (= e!334039 e!334041)))

(declare-fun res!370418 () Bool)

(assert (=> b!582602 (=> (not res!370418) (not e!334041))))

(declare-datatypes ((SeekEntryResult!5926 0))(
  ( (MissingZero!5926 (index!25931 (_ BitVec 32))) (Found!5926 (index!25932 (_ BitVec 32))) (Intermediate!5926 (undefined!6738 Bool) (index!25933 (_ BitVec 32)) (x!54779 (_ BitVec 32))) (Undefined!5926) (MissingVacant!5926 (index!25934 (_ BitVec 32))) )
))
(declare-fun lt!265149 () SeekEntryResult!5926)

(assert (=> b!582602 (= res!370418 (or (= lt!265149 (MissingZero!5926 i!1108)) (= lt!265149 (MissingVacant!5926 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36423 (_ BitVec 32)) SeekEntryResult!5926)

(assert (=> b!582602 (= lt!265149 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582603 () Bool)

(declare-fun res!370414 () Bool)

(assert (=> b!582603 (=> (not res!370414) (not e!334041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36423 (_ BitVec 32)) Bool)

(assert (=> b!582603 (= res!370414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582604 () Bool)

(assert (=> b!582604 (= e!334041 false)))

(declare-fun lt!265150 () SeekEntryResult!5926)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36423 (_ BitVec 32)) SeekEntryResult!5926)

(assert (=> b!582604 (= lt!265150 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17486 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582605 () Bool)

(declare-fun res!370421 () Bool)

(assert (=> b!582605 (=> (not res!370421) (not e!334039))))

(assert (=> b!582605 (= res!370421 (validKeyInArray!0 (select (arr!17486 a!2986) j!136)))))

(assert (= (and start!53522 res!370420) b!582599))

(assert (= (and b!582599 res!370413) b!582605))

(assert (= (and b!582605 res!370421) b!582600))

(assert (= (and b!582600 res!370419) b!582601))

(assert (= (and b!582601 res!370416) b!582602))

(assert (= (and b!582602 res!370418) b!582603))

(assert (= (and b!582603 res!370414) b!582597))

(assert (= (and b!582597 res!370415) b!582598))

(assert (= (and b!582598 res!370417) b!582604))

(declare-fun m!561095 () Bool)

(assert (=> start!53522 m!561095))

(declare-fun m!561097 () Bool)

(assert (=> start!53522 m!561097))

(declare-fun m!561099 () Bool)

(assert (=> b!582604 m!561099))

(assert (=> b!582604 m!561099))

(declare-fun m!561101 () Bool)

(assert (=> b!582604 m!561101))

(declare-fun m!561103 () Bool)

(assert (=> b!582601 m!561103))

(declare-fun m!561105 () Bool)

(assert (=> b!582597 m!561105))

(assert (=> b!582605 m!561099))

(assert (=> b!582605 m!561099))

(declare-fun m!561107 () Bool)

(assert (=> b!582605 m!561107))

(declare-fun m!561109 () Bool)

(assert (=> b!582603 m!561109))

(declare-fun m!561111 () Bool)

(assert (=> b!582598 m!561111))

(declare-fun m!561113 () Bool)

(assert (=> b!582598 m!561113))

(declare-fun m!561115 () Bool)

(assert (=> b!582598 m!561115))

(declare-fun m!561117 () Bool)

(assert (=> b!582602 m!561117))

(declare-fun m!561119 () Bool)

(assert (=> b!582600 m!561119))

(push 1)

(assert (not b!582601))

(assert (not b!582602))

(assert (not b!582605))

(assert (not b!582600))

(assert (not b!582597))

(assert (not b!582603))

(assert (not b!582604))

(assert (not start!53522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

