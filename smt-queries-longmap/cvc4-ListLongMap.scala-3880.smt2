; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53294 () Bool)

(assert start!53294)

(declare-fun b!579483 () Bool)

(declare-fun res!367305 () Bool)

(declare-fun e!333013 () Bool)

(assert (=> b!579483 (=> (not res!367305) (not e!333013))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579483 (= res!367305 (validKeyInArray!0 k!1786))))

(declare-fun b!579484 () Bool)

(declare-fun res!367304 () Bool)

(assert (=> b!579484 (=> (not res!367304) (not e!333013))))

(declare-datatypes ((array!36195 0))(
  ( (array!36196 (arr!17372 (Array (_ BitVec 32) (_ BitVec 64))) (size!17736 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36195)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579484 (= res!367304 (validKeyInArray!0 (select (arr!17372 a!2986) j!136)))))

(declare-fun b!579485 () Bool)

(declare-fun res!367306 () Bool)

(declare-fun e!333014 () Bool)

(assert (=> b!579485 (=> (not res!367306) (not e!333014))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36195 (_ BitVec 32)) Bool)

(assert (=> b!579485 (= res!367306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579486 () Bool)

(declare-fun res!367299 () Bool)

(assert (=> b!579486 (=> (not res!367299) (not e!333014))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579486 (= res!367299 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17372 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17372 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!367302 () Bool)

(assert (=> start!53294 (=> (not res!367302) (not e!333013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53294 (= res!367302 (validMask!0 mask!3053))))

(assert (=> start!53294 e!333013))

(assert (=> start!53294 true))

(declare-fun array_inv!13168 (array!36195) Bool)

(assert (=> start!53294 (array_inv!13168 a!2986)))

(declare-fun b!579487 () Bool)

(declare-fun res!367307 () Bool)

(assert (=> b!579487 (=> (not res!367307) (not e!333013))))

(declare-fun arrayContainsKey!0 (array!36195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579487 (= res!367307 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579488 () Bool)

(declare-fun res!367300 () Bool)

(assert (=> b!579488 (=> (not res!367300) (not e!333014))))

(declare-datatypes ((List!11413 0))(
  ( (Nil!11410) (Cons!11409 (h!12454 (_ BitVec 64)) (t!17641 List!11413)) )
))
(declare-fun arrayNoDuplicates!0 (array!36195 (_ BitVec 32) List!11413) Bool)

(assert (=> b!579488 (= res!367300 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11410))))

(declare-fun b!579489 () Bool)

(declare-fun res!367301 () Bool)

(assert (=> b!579489 (=> (not res!367301) (not e!333013))))

(assert (=> b!579489 (= res!367301 (and (= (size!17736 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17736 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17736 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579490 () Bool)

(assert (=> b!579490 (= e!333014 false)))

(declare-datatypes ((SeekEntryResult!5812 0))(
  ( (MissingZero!5812 (index!25475 (_ BitVec 32))) (Found!5812 (index!25476 (_ BitVec 32))) (Intermediate!5812 (undefined!6624 Bool) (index!25477 (_ BitVec 32)) (x!54361 (_ BitVec 32))) (Undefined!5812) (MissingVacant!5812 (index!25478 (_ BitVec 32))) )
))
(declare-fun lt!264493 () SeekEntryResult!5812)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36195 (_ BitVec 32)) SeekEntryResult!5812)

(assert (=> b!579490 (= lt!264493 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17372 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579491 () Bool)

(assert (=> b!579491 (= e!333013 e!333014)))

(declare-fun res!367303 () Bool)

(assert (=> b!579491 (=> (not res!367303) (not e!333014))))

(declare-fun lt!264492 () SeekEntryResult!5812)

(assert (=> b!579491 (= res!367303 (or (= lt!264492 (MissingZero!5812 i!1108)) (= lt!264492 (MissingVacant!5812 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36195 (_ BitVec 32)) SeekEntryResult!5812)

(assert (=> b!579491 (= lt!264492 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53294 res!367302) b!579489))

(assert (= (and b!579489 res!367301) b!579484))

(assert (= (and b!579484 res!367304) b!579483))

(assert (= (and b!579483 res!367305) b!579487))

(assert (= (and b!579487 res!367307) b!579491))

(assert (= (and b!579491 res!367303) b!579485))

(assert (= (and b!579485 res!367306) b!579488))

(assert (= (and b!579488 res!367300) b!579486))

(assert (= (and b!579486 res!367299) b!579490))

(declare-fun m!558101 () Bool)

(assert (=> b!579483 m!558101))

(declare-fun m!558103 () Bool)

(assert (=> b!579487 m!558103))

(declare-fun m!558105 () Bool)

(assert (=> b!579490 m!558105))

(assert (=> b!579490 m!558105))

(declare-fun m!558107 () Bool)

(assert (=> b!579490 m!558107))

(declare-fun m!558109 () Bool)

(assert (=> b!579491 m!558109))

(declare-fun m!558111 () Bool)

(assert (=> b!579488 m!558111))

(declare-fun m!558113 () Bool)

(assert (=> b!579486 m!558113))

(declare-fun m!558115 () Bool)

(assert (=> b!579486 m!558115))

(declare-fun m!558117 () Bool)

(assert (=> b!579486 m!558117))

(assert (=> b!579484 m!558105))

(assert (=> b!579484 m!558105))

(declare-fun m!558119 () Bool)

(assert (=> b!579484 m!558119))

(declare-fun m!558121 () Bool)

(assert (=> start!53294 m!558121))

(declare-fun m!558123 () Bool)

(assert (=> start!53294 m!558123))

(declare-fun m!558125 () Bool)

(assert (=> b!579485 m!558125))

(push 1)

(assert (not b!579491))

(assert (not start!53294))

(assert (not b!579485))

(assert (not b!579490))

(assert (not b!579483))

(assert (not b!579487))

(assert (not b!579488))

(assert (not b!579484))

(check-sat)

(pop 1)

