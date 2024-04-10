; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53368 () Bool)

(assert start!53368)

(declare-fun b!580482 () Bool)

(declare-fun res!368303 () Bool)

(declare-fun e!333346 () Bool)

(assert (=> b!580482 (=> (not res!368303) (not e!333346))))

(declare-datatypes ((array!36269 0))(
  ( (array!36270 (arr!17409 (Array (_ BitVec 32) (_ BitVec 64))) (size!17773 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36269)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580482 (= res!368303 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580484 () Bool)

(declare-fun res!368299 () Bool)

(declare-fun e!333347 () Bool)

(assert (=> b!580484 (=> (not res!368299) (not e!333347))))

(declare-datatypes ((List!11450 0))(
  ( (Nil!11447) (Cons!11446 (h!12491 (_ BitVec 64)) (t!17678 List!11450)) )
))
(declare-fun arrayNoDuplicates!0 (array!36269 (_ BitVec 32) List!11450) Bool)

(assert (=> b!580484 (= res!368299 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11447))))

(declare-fun b!580485 () Bool)

(declare-fun res!368304 () Bool)

(assert (=> b!580485 (=> (not res!368304) (not e!333346))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580485 (= res!368304 (and (= (size!17773 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17773 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17773 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580486 () Bool)

(declare-fun res!368300 () Bool)

(assert (=> b!580486 (=> (not res!368300) (not e!333347))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580486 (= res!368300 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17409 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17409 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580487 () Bool)

(declare-fun res!368305 () Bool)

(assert (=> b!580487 (=> (not res!368305) (not e!333346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580487 (= res!368305 (validKeyInArray!0 k!1786))))

(declare-fun b!580488 () Bool)

(declare-fun res!368302 () Bool)

(assert (=> b!580488 (=> (not res!368302) (not e!333347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36269 (_ BitVec 32)) Bool)

(assert (=> b!580488 (= res!368302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580489 () Bool)

(declare-fun res!368298 () Bool)

(assert (=> b!580489 (=> (not res!368298) (not e!333346))))

(assert (=> b!580489 (= res!368298 (validKeyInArray!0 (select (arr!17409 a!2986) j!136)))))

(declare-fun b!580490 () Bool)

(assert (=> b!580490 (= e!333347 false)))

(declare-datatypes ((SeekEntryResult!5849 0))(
  ( (MissingZero!5849 (index!25623 (_ BitVec 32))) (Found!5849 (index!25624 (_ BitVec 32))) (Intermediate!5849 (undefined!6661 Bool) (index!25625 (_ BitVec 32)) (x!54502 (_ BitVec 32))) (Undefined!5849) (MissingVacant!5849 (index!25626 (_ BitVec 32))) )
))
(declare-fun lt!264714 () SeekEntryResult!5849)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36269 (_ BitVec 32)) SeekEntryResult!5849)

(assert (=> b!580490 (= lt!264714 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17409 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!368301 () Bool)

(assert (=> start!53368 (=> (not res!368301) (not e!333346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53368 (= res!368301 (validMask!0 mask!3053))))

(assert (=> start!53368 e!333346))

(assert (=> start!53368 true))

(declare-fun array_inv!13205 (array!36269) Bool)

(assert (=> start!53368 (array_inv!13205 a!2986)))

(declare-fun b!580483 () Bool)

(assert (=> b!580483 (= e!333346 e!333347)))

(declare-fun res!368306 () Bool)

(assert (=> b!580483 (=> (not res!368306) (not e!333347))))

(declare-fun lt!264715 () SeekEntryResult!5849)

(assert (=> b!580483 (= res!368306 (or (= lt!264715 (MissingZero!5849 i!1108)) (= lt!264715 (MissingVacant!5849 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36269 (_ BitVec 32)) SeekEntryResult!5849)

(assert (=> b!580483 (= lt!264715 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53368 res!368301) b!580485))

(assert (= (and b!580485 res!368304) b!580489))

(assert (= (and b!580489 res!368298) b!580487))

(assert (= (and b!580487 res!368305) b!580482))

(assert (= (and b!580482 res!368303) b!580483))

(assert (= (and b!580483 res!368306) b!580488))

(assert (= (and b!580488 res!368302) b!580484))

(assert (= (and b!580484 res!368299) b!580486))

(assert (= (and b!580486 res!368300) b!580490))

(declare-fun m!559063 () Bool)

(assert (=> b!580484 m!559063))

(declare-fun m!559065 () Bool)

(assert (=> b!580482 m!559065))

(declare-fun m!559067 () Bool)

(assert (=> b!580489 m!559067))

(assert (=> b!580489 m!559067))

(declare-fun m!559069 () Bool)

(assert (=> b!580489 m!559069))

(declare-fun m!559071 () Bool)

(assert (=> b!580483 m!559071))

(declare-fun m!559073 () Bool)

(assert (=> b!580488 m!559073))

(declare-fun m!559075 () Bool)

(assert (=> b!580487 m!559075))

(assert (=> b!580490 m!559067))

(assert (=> b!580490 m!559067))

(declare-fun m!559077 () Bool)

(assert (=> b!580490 m!559077))

(declare-fun m!559079 () Bool)

(assert (=> start!53368 m!559079))

(declare-fun m!559081 () Bool)

(assert (=> start!53368 m!559081))

(declare-fun m!559083 () Bool)

(assert (=> b!580486 m!559083))

(declare-fun m!559085 () Bool)

(assert (=> b!580486 m!559085))

(declare-fun m!559087 () Bool)

(assert (=> b!580486 m!559087))

(push 1)

