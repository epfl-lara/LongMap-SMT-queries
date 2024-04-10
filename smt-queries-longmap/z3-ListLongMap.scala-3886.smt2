; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53328 () Bool)

(assert start!53328)

(declare-fun b!579942 () Bool)

(declare-fun res!367759 () Bool)

(declare-fun e!333168 () Bool)

(assert (=> b!579942 (=> (not res!367759) (not e!333168))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579942 (= res!367759 (validKeyInArray!0 k0!1786))))

(declare-fun b!579943 () Bool)

(declare-fun res!367765 () Bool)

(declare-fun e!333167 () Bool)

(assert (=> b!579943 (=> (not res!367765) (not e!333167))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36229 0))(
  ( (array!36230 (arr!17389 (Array (_ BitVec 32) (_ BitVec 64))) (size!17753 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36229)

(assert (=> b!579943 (= res!367765 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17389 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17389 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579944 () Bool)

(declare-fun res!367760 () Bool)

(assert (=> b!579944 (=> (not res!367760) (not e!333168))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579944 (= res!367760 (and (= (size!17753 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17753 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17753 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579945 () Bool)

(declare-fun res!367766 () Bool)

(assert (=> b!579945 (=> (not res!367766) (not e!333167))))

(declare-datatypes ((List!11430 0))(
  ( (Nil!11427) (Cons!11426 (h!12471 (_ BitVec 64)) (t!17658 List!11430)) )
))
(declare-fun arrayNoDuplicates!0 (array!36229 (_ BitVec 32) List!11430) Bool)

(assert (=> b!579945 (= res!367766 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11427))))

(declare-fun b!579946 () Bool)

(declare-fun res!367764 () Bool)

(assert (=> b!579946 (=> (not res!367764) (not e!333168))))

(declare-fun arrayContainsKey!0 (array!36229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579946 (= res!367764 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579947 () Bool)

(declare-fun res!367762 () Bool)

(assert (=> b!579947 (=> (not res!367762) (not e!333168))))

(assert (=> b!579947 (= res!367762 (validKeyInArray!0 (select (arr!17389 a!2986) j!136)))))

(declare-fun b!579948 () Bool)

(assert (=> b!579948 (= e!333168 e!333167)))

(declare-fun res!367763 () Bool)

(assert (=> b!579948 (=> (not res!367763) (not e!333167))))

(declare-datatypes ((SeekEntryResult!5829 0))(
  ( (MissingZero!5829 (index!25543 (_ BitVec 32))) (Found!5829 (index!25544 (_ BitVec 32))) (Intermediate!5829 (undefined!6641 Bool) (index!25545 (_ BitVec 32)) (x!54426 (_ BitVec 32))) (Undefined!5829) (MissingVacant!5829 (index!25546 (_ BitVec 32))) )
))
(declare-fun lt!264595 () SeekEntryResult!5829)

(assert (=> b!579948 (= res!367763 (or (= lt!264595 (MissingZero!5829 i!1108)) (= lt!264595 (MissingVacant!5829 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36229 (_ BitVec 32)) SeekEntryResult!5829)

(assert (=> b!579948 (= lt!264595 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579949 () Bool)

(declare-fun res!367758 () Bool)

(assert (=> b!579949 (=> (not res!367758) (not e!333167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36229 (_ BitVec 32)) Bool)

(assert (=> b!579949 (= res!367758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!367761 () Bool)

(assert (=> start!53328 (=> (not res!367761) (not e!333168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53328 (= res!367761 (validMask!0 mask!3053))))

(assert (=> start!53328 e!333168))

(assert (=> start!53328 true))

(declare-fun array_inv!13185 (array!36229) Bool)

(assert (=> start!53328 (array_inv!13185 a!2986)))

(declare-fun b!579950 () Bool)

(assert (=> b!579950 (= e!333167 false)))

(declare-fun lt!264594 () SeekEntryResult!5829)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36229 (_ BitVec 32)) SeekEntryResult!5829)

(assert (=> b!579950 (= lt!264594 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17389 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53328 res!367761) b!579944))

(assert (= (and b!579944 res!367760) b!579947))

(assert (= (and b!579947 res!367762) b!579942))

(assert (= (and b!579942 res!367759) b!579946))

(assert (= (and b!579946 res!367764) b!579948))

(assert (= (and b!579948 res!367763) b!579949))

(assert (= (and b!579949 res!367758) b!579945))

(assert (= (and b!579945 res!367766) b!579943))

(assert (= (and b!579943 res!367765) b!579950))

(declare-fun m!558543 () Bool)

(assert (=> b!579945 m!558543))

(declare-fun m!558545 () Bool)

(assert (=> b!579948 m!558545))

(declare-fun m!558547 () Bool)

(assert (=> b!579943 m!558547))

(declare-fun m!558549 () Bool)

(assert (=> b!579943 m!558549))

(declare-fun m!558551 () Bool)

(assert (=> b!579943 m!558551))

(declare-fun m!558553 () Bool)

(assert (=> b!579942 m!558553))

(declare-fun m!558555 () Bool)

(assert (=> b!579950 m!558555))

(assert (=> b!579950 m!558555))

(declare-fun m!558557 () Bool)

(assert (=> b!579950 m!558557))

(declare-fun m!558559 () Bool)

(assert (=> b!579946 m!558559))

(declare-fun m!558561 () Bool)

(assert (=> b!579949 m!558561))

(assert (=> b!579947 m!558555))

(assert (=> b!579947 m!558555))

(declare-fun m!558563 () Bool)

(assert (=> b!579947 m!558563))

(declare-fun m!558565 () Bool)

(assert (=> start!53328 m!558565))

(declare-fun m!558567 () Bool)

(assert (=> start!53328 m!558567))

(check-sat (not b!579948) (not start!53328) (not b!579947) (not b!579945) (not b!579950) (not b!579946) (not b!579949) (not b!579942))
(check-sat)
