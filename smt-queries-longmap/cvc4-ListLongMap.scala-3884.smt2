; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53318 () Bool)

(assert start!53318)

(declare-fun b!579807 () Bool)

(declare-fun e!333121 () Bool)

(assert (=> b!579807 (= e!333121 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5824 0))(
  ( (MissingZero!5824 (index!25523 (_ BitVec 32))) (Found!5824 (index!25524 (_ BitVec 32))) (Intermediate!5824 (undefined!6636 Bool) (index!25525 (_ BitVec 32)) (x!54405 (_ BitVec 32))) (Undefined!5824) (MissingVacant!5824 (index!25526 (_ BitVec 32))) )
))
(declare-fun lt!264564 () SeekEntryResult!5824)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36219 0))(
  ( (array!36220 (arr!17384 (Array (_ BitVec 32) (_ BitVec 64))) (size!17748 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36219)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36219 (_ BitVec 32)) SeekEntryResult!5824)

(assert (=> b!579807 (= lt!264564 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17384 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579808 () Bool)

(declare-fun res!367629 () Bool)

(declare-fun e!333123 () Bool)

(assert (=> b!579808 (=> (not res!367629) (not e!333123))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579808 (= res!367629 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579809 () Bool)

(declare-fun res!367626 () Bool)

(assert (=> b!579809 (=> (not res!367626) (not e!333123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579809 (= res!367626 (validKeyInArray!0 (select (arr!17384 a!2986) j!136)))))

(declare-fun res!367623 () Bool)

(assert (=> start!53318 (=> (not res!367623) (not e!333123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53318 (= res!367623 (validMask!0 mask!3053))))

(assert (=> start!53318 e!333123))

(assert (=> start!53318 true))

(declare-fun array_inv!13180 (array!36219) Bool)

(assert (=> start!53318 (array_inv!13180 a!2986)))

(declare-fun b!579810 () Bool)

(declare-fun res!367624 () Bool)

(assert (=> b!579810 (=> (not res!367624) (not e!333123))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579810 (= res!367624 (and (= (size!17748 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17748 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17748 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579811 () Bool)

(declare-fun res!367628 () Bool)

(assert (=> b!579811 (=> (not res!367628) (not e!333123))))

(assert (=> b!579811 (= res!367628 (validKeyInArray!0 k!1786))))

(declare-fun b!579812 () Bool)

(assert (=> b!579812 (= e!333123 e!333121)))

(declare-fun res!367627 () Bool)

(assert (=> b!579812 (=> (not res!367627) (not e!333121))))

(declare-fun lt!264565 () SeekEntryResult!5824)

(assert (=> b!579812 (= res!367627 (or (= lt!264565 (MissingZero!5824 i!1108)) (= lt!264565 (MissingVacant!5824 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36219 (_ BitVec 32)) SeekEntryResult!5824)

(assert (=> b!579812 (= lt!264565 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579813 () Bool)

(declare-fun res!367630 () Bool)

(assert (=> b!579813 (=> (not res!367630) (not e!333121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36219 (_ BitVec 32)) Bool)

(assert (=> b!579813 (= res!367630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579814 () Bool)

(declare-fun res!367625 () Bool)

(assert (=> b!579814 (=> (not res!367625) (not e!333121))))

(declare-datatypes ((List!11425 0))(
  ( (Nil!11422) (Cons!11421 (h!12466 (_ BitVec 64)) (t!17653 List!11425)) )
))
(declare-fun arrayNoDuplicates!0 (array!36219 (_ BitVec 32) List!11425) Bool)

(assert (=> b!579814 (= res!367625 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11422))))

(declare-fun b!579815 () Bool)

(declare-fun res!367631 () Bool)

(assert (=> b!579815 (=> (not res!367631) (not e!333121))))

(assert (=> b!579815 (= res!367631 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17384 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17384 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53318 res!367623) b!579810))

(assert (= (and b!579810 res!367624) b!579809))

(assert (= (and b!579809 res!367626) b!579811))

(assert (= (and b!579811 res!367628) b!579808))

(assert (= (and b!579808 res!367629) b!579812))

(assert (= (and b!579812 res!367627) b!579813))

(assert (= (and b!579813 res!367630) b!579814))

(assert (= (and b!579814 res!367625) b!579815))

(assert (= (and b!579815 res!367631) b!579807))

(declare-fun m!558413 () Bool)

(assert (=> b!579808 m!558413))

(declare-fun m!558415 () Bool)

(assert (=> b!579807 m!558415))

(assert (=> b!579807 m!558415))

(declare-fun m!558417 () Bool)

(assert (=> b!579807 m!558417))

(declare-fun m!558419 () Bool)

(assert (=> b!579812 m!558419))

(assert (=> b!579809 m!558415))

(assert (=> b!579809 m!558415))

(declare-fun m!558421 () Bool)

(assert (=> b!579809 m!558421))

(declare-fun m!558423 () Bool)

(assert (=> start!53318 m!558423))

(declare-fun m!558425 () Bool)

(assert (=> start!53318 m!558425))

(declare-fun m!558427 () Bool)

(assert (=> b!579814 m!558427))

(declare-fun m!558429 () Bool)

(assert (=> b!579811 m!558429))

(declare-fun m!558431 () Bool)

(assert (=> b!579815 m!558431))

(declare-fun m!558433 () Bool)

(assert (=> b!579815 m!558433))

(declare-fun m!558435 () Bool)

(assert (=> b!579815 m!558435))

(declare-fun m!558437 () Bool)

(assert (=> b!579813 m!558437))

(push 1)

