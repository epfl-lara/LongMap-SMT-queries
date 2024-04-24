; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53544 () Bool)

(assert start!53544)

(declare-fun b!582419 () Bool)

(declare-fun e!334042 () Bool)

(assert (=> b!582419 (= e!334042 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5863 0))(
  ( (MissingZero!5863 (index!25679 (_ BitVec 32))) (Found!5863 (index!25680 (_ BitVec 32))) (Intermediate!5863 (undefined!6675 Bool) (index!25681 (_ BitVec 32)) (x!54687 (_ BitVec 32))) (Undefined!5863) (MissingVacant!5863 (index!25682 (_ BitVec 32))) )
))
(declare-fun lt!265176 () SeekEntryResult!5863)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36390 0))(
  ( (array!36391 (arr!17467 (Array (_ BitVec 32) (_ BitVec 64))) (size!17831 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36390)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36390 (_ BitVec 32)) SeekEntryResult!5863)

(assert (=> b!582419 (= lt!265176 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17467 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582420 () Bool)

(declare-fun res!370136 () Bool)

(declare-fun e!334044 () Bool)

(assert (=> b!582420 (=> (not res!370136) (not e!334044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582420 (= res!370136 (validKeyInArray!0 (select (arr!17467 a!2986) j!136)))))

(declare-fun b!582421 () Bool)

(declare-fun res!370134 () Bool)

(assert (=> b!582421 (=> (not res!370134) (not e!334044))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582421 (= res!370134 (and (= (size!17831 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17831 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17831 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582422 () Bool)

(declare-fun res!370130 () Bool)

(assert (=> b!582422 (=> (not res!370130) (not e!334042))))

(declare-datatypes ((List!11415 0))(
  ( (Nil!11412) (Cons!11411 (h!12459 (_ BitVec 64)) (t!17635 List!11415)) )
))
(declare-fun arrayNoDuplicates!0 (array!36390 (_ BitVec 32) List!11415) Bool)

(assert (=> b!582422 (= res!370130 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11412))))

(declare-fun res!370131 () Bool)

(assert (=> start!53544 (=> (not res!370131) (not e!334044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53544 (= res!370131 (validMask!0 mask!3053))))

(assert (=> start!53544 e!334044))

(assert (=> start!53544 true))

(declare-fun array_inv!13326 (array!36390) Bool)

(assert (=> start!53544 (array_inv!13326 a!2986)))

(declare-fun b!582423 () Bool)

(declare-fun res!370132 () Bool)

(assert (=> b!582423 (=> (not res!370132) (not e!334042))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!582423 (= res!370132 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17467 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17467 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582424 () Bool)

(assert (=> b!582424 (= e!334044 e!334042)))

(declare-fun res!370138 () Bool)

(assert (=> b!582424 (=> (not res!370138) (not e!334042))))

(declare-fun lt!265177 () SeekEntryResult!5863)

(assert (=> b!582424 (= res!370138 (or (= lt!265177 (MissingZero!5863 i!1108)) (= lt!265177 (MissingVacant!5863 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36390 (_ BitVec 32)) SeekEntryResult!5863)

(assert (=> b!582424 (= lt!265177 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582425 () Bool)

(declare-fun res!370135 () Bool)

(assert (=> b!582425 (=> (not res!370135) (not e!334042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36390 (_ BitVec 32)) Bool)

(assert (=> b!582425 (= res!370135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582426 () Bool)

(declare-fun res!370133 () Bool)

(assert (=> b!582426 (=> (not res!370133) (not e!334044))))

(declare-fun arrayContainsKey!0 (array!36390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582426 (= res!370133 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582427 () Bool)

(declare-fun res!370137 () Bool)

(assert (=> b!582427 (=> (not res!370137) (not e!334044))))

(assert (=> b!582427 (= res!370137 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53544 res!370131) b!582421))

(assert (= (and b!582421 res!370134) b!582420))

(assert (= (and b!582420 res!370136) b!582427))

(assert (= (and b!582427 res!370137) b!582426))

(assert (= (and b!582426 res!370133) b!582424))

(assert (= (and b!582424 res!370138) b!582425))

(assert (= (and b!582425 res!370135) b!582422))

(assert (= (and b!582422 res!370130) b!582423))

(assert (= (and b!582423 res!370132) b!582419))

(declare-fun m!561083 () Bool)

(assert (=> b!582422 m!561083))

(declare-fun m!561085 () Bool)

(assert (=> b!582426 m!561085))

(declare-fun m!561087 () Bool)

(assert (=> b!582425 m!561087))

(declare-fun m!561089 () Bool)

(assert (=> b!582419 m!561089))

(assert (=> b!582419 m!561089))

(declare-fun m!561091 () Bool)

(assert (=> b!582419 m!561091))

(declare-fun m!561093 () Bool)

(assert (=> b!582427 m!561093))

(declare-fun m!561095 () Bool)

(assert (=> b!582424 m!561095))

(declare-fun m!561097 () Bool)

(assert (=> b!582423 m!561097))

(declare-fun m!561099 () Bool)

(assert (=> b!582423 m!561099))

(declare-fun m!561101 () Bool)

(assert (=> b!582423 m!561101))

(assert (=> b!582420 m!561089))

(assert (=> b!582420 m!561089))

(declare-fun m!561103 () Bool)

(assert (=> b!582420 m!561103))

(declare-fun m!561105 () Bool)

(assert (=> start!53544 m!561105))

(declare-fun m!561107 () Bool)

(assert (=> start!53544 m!561107))

(check-sat (not b!582427) (not b!582425) (not start!53544) (not b!582422) (not b!582426) (not b!582420) (not b!582424) (not b!582419))
(check-sat)
