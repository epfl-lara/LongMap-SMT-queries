; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53566 () Bool)

(assert start!53566)

(declare-fun b!583191 () Bool)

(declare-fun res!371009 () Bool)

(declare-fun e!334237 () Bool)

(assert (=> b!583191 (=> (not res!371009) (not e!334237))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583191 (= res!371009 (validKeyInArray!0 k!1786))))

(declare-fun b!583192 () Bool)

(declare-fun e!334239 () Bool)

(assert (=> b!583192 (= e!334237 e!334239)))

(declare-fun res!371008 () Bool)

(assert (=> b!583192 (=> (not res!371008) (not e!334239))))

(declare-datatypes ((SeekEntryResult!5948 0))(
  ( (MissingZero!5948 (index!26019 (_ BitVec 32))) (Found!5948 (index!26020 (_ BitVec 32))) (Intermediate!5948 (undefined!6760 Bool) (index!26021 (_ BitVec 32)) (x!54865 (_ BitVec 32))) (Undefined!5948) (MissingVacant!5948 (index!26022 (_ BitVec 32))) )
))
(declare-fun lt!265281 () SeekEntryResult!5948)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583192 (= res!371008 (or (= lt!265281 (MissingZero!5948 i!1108)) (= lt!265281 (MissingVacant!5948 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36467 0))(
  ( (array!36468 (arr!17508 (Array (_ BitVec 32) (_ BitVec 64))) (size!17872 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36467)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36467 (_ BitVec 32)) SeekEntryResult!5948)

(assert (=> b!583192 (= lt!265281 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583193 () Bool)

(declare-fun res!371012 () Bool)

(assert (=> b!583193 (=> (not res!371012) (not e!334237))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583193 (= res!371012 (and (= (size!17872 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17872 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17872 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583194 () Bool)

(declare-fun res!371013 () Bool)

(assert (=> b!583194 (=> (not res!371013) (not e!334239))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583194 (= res!371013 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17508 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17508 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583195 () Bool)

(declare-fun res!371015 () Bool)

(assert (=> b!583195 (=> (not res!371015) (not e!334237))))

(assert (=> b!583195 (= res!371015 (validKeyInArray!0 (select (arr!17508 a!2986) j!136)))))

(declare-fun b!583196 () Bool)

(declare-fun res!371007 () Bool)

(assert (=> b!583196 (=> (not res!371007) (not e!334237))))

(declare-fun arrayContainsKey!0 (array!36467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583196 (= res!371007 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583197 () Bool)

(declare-fun res!371011 () Bool)

(assert (=> b!583197 (=> (not res!371011) (not e!334239))))

(declare-datatypes ((List!11549 0))(
  ( (Nil!11546) (Cons!11545 (h!12590 (_ BitVec 64)) (t!17777 List!11549)) )
))
(declare-fun arrayNoDuplicates!0 (array!36467 (_ BitVec 32) List!11549) Bool)

(assert (=> b!583197 (= res!371011 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11546))))

(declare-fun b!583198 () Bool)

(declare-fun res!371014 () Bool)

(assert (=> b!583198 (=> (not res!371014) (not e!334239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36467 (_ BitVec 32)) Bool)

(assert (=> b!583198 (= res!371014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583199 () Bool)

(assert (=> b!583199 (= e!334239 false)))

(declare-fun lt!265282 () SeekEntryResult!5948)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36467 (_ BitVec 32)) SeekEntryResult!5948)

(assert (=> b!583199 (= lt!265282 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17508 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!371010 () Bool)

(assert (=> start!53566 (=> (not res!371010) (not e!334237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53566 (= res!371010 (validMask!0 mask!3053))))

(assert (=> start!53566 e!334237))

(assert (=> start!53566 true))

(declare-fun array_inv!13304 (array!36467) Bool)

(assert (=> start!53566 (array_inv!13304 a!2986)))

(assert (= (and start!53566 res!371010) b!583193))

(assert (= (and b!583193 res!371012) b!583195))

(assert (= (and b!583195 res!371015) b!583191))

(assert (= (and b!583191 res!371009) b!583196))

(assert (= (and b!583196 res!371007) b!583192))

(assert (= (and b!583192 res!371008) b!583198))

(assert (= (and b!583198 res!371014) b!583197))

(assert (= (and b!583197 res!371011) b!583194))

(assert (= (and b!583194 res!371013) b!583199))

(declare-fun m!561667 () Bool)

(assert (=> b!583197 m!561667))

(declare-fun m!561669 () Bool)

(assert (=> b!583198 m!561669))

(declare-fun m!561671 () Bool)

(assert (=> b!583192 m!561671))

(declare-fun m!561673 () Bool)

(assert (=> b!583195 m!561673))

(assert (=> b!583195 m!561673))

(declare-fun m!561675 () Bool)

(assert (=> b!583195 m!561675))

(declare-fun m!561677 () Bool)

(assert (=> b!583196 m!561677))

(declare-fun m!561679 () Bool)

(assert (=> start!53566 m!561679))

(declare-fun m!561681 () Bool)

(assert (=> start!53566 m!561681))

(assert (=> b!583199 m!561673))

(assert (=> b!583199 m!561673))

(declare-fun m!561683 () Bool)

(assert (=> b!583199 m!561683))

(declare-fun m!561685 () Bool)

(assert (=> b!583194 m!561685))

(declare-fun m!561687 () Bool)

(assert (=> b!583194 m!561687))

(declare-fun m!561689 () Bool)

(assert (=> b!583194 m!561689))

(declare-fun m!561691 () Bool)

(assert (=> b!583191 m!561691))

(push 1)

