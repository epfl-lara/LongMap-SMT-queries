; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53558 () Bool)

(assert start!53558)

(declare-fun b!583083 () Bool)

(declare-fun res!370902 () Bool)

(declare-fun e!334201 () Bool)

(assert (=> b!583083 (=> (not res!370902) (not e!334201))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36459 0))(
  ( (array!36460 (arr!17504 (Array (_ BitVec 32) (_ BitVec 64))) (size!17868 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36459)

(assert (=> b!583083 (= res!370902 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17504 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17504 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583084 () Bool)

(assert (=> b!583084 (= e!334201 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5944 0))(
  ( (MissingZero!5944 (index!26003 (_ BitVec 32))) (Found!5944 (index!26004 (_ BitVec 32))) (Intermediate!5944 (undefined!6756 Bool) (index!26005 (_ BitVec 32)) (x!54845 (_ BitVec 32))) (Undefined!5944) (MissingVacant!5944 (index!26006 (_ BitVec 32))) )
))
(declare-fun lt!265258 () SeekEntryResult!5944)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36459 (_ BitVec 32)) SeekEntryResult!5944)

(assert (=> b!583084 (= lt!265258 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17504 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!370906 () Bool)

(declare-fun e!334202 () Bool)

(assert (=> start!53558 (=> (not res!370906) (not e!334202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53558 (= res!370906 (validMask!0 mask!3053))))

(assert (=> start!53558 e!334202))

(assert (=> start!53558 true))

(declare-fun array_inv!13300 (array!36459) Bool)

(assert (=> start!53558 (array_inv!13300 a!2986)))

(declare-fun b!583085 () Bool)

(declare-fun res!370901 () Bool)

(assert (=> b!583085 (=> (not res!370901) (not e!334201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36459 (_ BitVec 32)) Bool)

(assert (=> b!583085 (= res!370901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583086 () Bool)

(declare-fun res!370907 () Bool)

(assert (=> b!583086 (=> (not res!370907) (not e!334202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583086 (= res!370907 (validKeyInArray!0 (select (arr!17504 a!2986) j!136)))))

(declare-fun b!583087 () Bool)

(assert (=> b!583087 (= e!334202 e!334201)))

(declare-fun res!370899 () Bool)

(assert (=> b!583087 (=> (not res!370899) (not e!334201))))

(declare-fun lt!265257 () SeekEntryResult!5944)

(assert (=> b!583087 (= res!370899 (or (= lt!265257 (MissingZero!5944 i!1108)) (= lt!265257 (MissingVacant!5944 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36459 (_ BitVec 32)) SeekEntryResult!5944)

(assert (=> b!583087 (= lt!265257 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583088 () Bool)

(declare-fun res!370900 () Bool)

(assert (=> b!583088 (=> (not res!370900) (not e!334202))))

(declare-fun arrayContainsKey!0 (array!36459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583088 (= res!370900 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583089 () Bool)

(declare-fun res!370903 () Bool)

(assert (=> b!583089 (=> (not res!370903) (not e!334202))))

(assert (=> b!583089 (= res!370903 (and (= (size!17868 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17868 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17868 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583090 () Bool)

(declare-fun res!370904 () Bool)

(assert (=> b!583090 (=> (not res!370904) (not e!334201))))

(declare-datatypes ((List!11545 0))(
  ( (Nil!11542) (Cons!11541 (h!12586 (_ BitVec 64)) (t!17773 List!11545)) )
))
(declare-fun arrayNoDuplicates!0 (array!36459 (_ BitVec 32) List!11545) Bool)

(assert (=> b!583090 (= res!370904 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11542))))

(declare-fun b!583091 () Bool)

(declare-fun res!370905 () Bool)

(assert (=> b!583091 (=> (not res!370905) (not e!334202))))

(assert (=> b!583091 (= res!370905 (validKeyInArray!0 k!1786))))

(assert (= (and start!53558 res!370906) b!583089))

(assert (= (and b!583089 res!370903) b!583086))

(assert (= (and b!583086 res!370907) b!583091))

(assert (= (and b!583091 res!370905) b!583088))

(assert (= (and b!583088 res!370900) b!583087))

(assert (= (and b!583087 res!370899) b!583085))

(assert (= (and b!583085 res!370901) b!583090))

(assert (= (and b!583090 res!370904) b!583083))

(assert (= (and b!583083 res!370902) b!583084))

(declare-fun m!561563 () Bool)

(assert (=> b!583090 m!561563))

(declare-fun m!561565 () Bool)

(assert (=> b!583086 m!561565))

(assert (=> b!583086 m!561565))

(declare-fun m!561567 () Bool)

(assert (=> b!583086 m!561567))

(declare-fun m!561569 () Bool)

(assert (=> b!583088 m!561569))

(declare-fun m!561571 () Bool)

(assert (=> b!583087 m!561571))

(declare-fun m!561573 () Bool)

(assert (=> b!583085 m!561573))

(declare-fun m!561575 () Bool)

(assert (=> b!583083 m!561575))

(declare-fun m!561577 () Bool)

(assert (=> b!583083 m!561577))

(declare-fun m!561579 () Bool)

(assert (=> b!583083 m!561579))

(declare-fun m!561581 () Bool)

(assert (=> b!583091 m!561581))

(assert (=> b!583084 m!561565))

(assert (=> b!583084 m!561565))

(declare-fun m!561583 () Bool)

(assert (=> b!583084 m!561583))

(declare-fun m!561585 () Bool)

(assert (=> start!53558 m!561585))

(declare-fun m!561587 () Bool)

(assert (=> start!53558 m!561587))

(push 1)

(assert (not b!583091))

(assert (not b!583084))

(assert (not b!583085))

(assert (not b!583087))

(assert (not b!583088))

(assert (not start!53558))

(assert (not b!583086))

(assert (not b!583090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

