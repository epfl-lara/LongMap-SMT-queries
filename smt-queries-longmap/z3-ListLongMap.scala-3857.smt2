; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53076 () Bool)

(assert start!53076)

(declare-fun b!577572 () Bool)

(declare-fun res!365499 () Bool)

(declare-fun e!332226 () Bool)

(assert (=> b!577572 (=> (not res!365499) (not e!332226))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577572 (= res!365499 (validKeyInArray!0 k0!1786))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5692 0))(
  ( (MissingZero!5692 (index!24995 (_ BitVec 32))) (Found!5692 (index!24996 (_ BitVec 32))) (Intermediate!5692 (undefined!6504 Bool) (index!24997 (_ BitVec 32)) (x!54060 (_ BitVec 32))) (Undefined!5692) (MissingVacant!5692 (index!24998 (_ BitVec 32))) )
))
(declare-fun lt!264064 () SeekEntryResult!5692)

(declare-datatypes ((array!36039 0))(
  ( (array!36040 (arr!17296 (Array (_ BitVec 32) (_ BitVec 64))) (size!17660 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36039)

(declare-fun b!577573 () Bool)

(assert (=> b!577573 (= e!332226 (and (or (= lt!264064 (MissingZero!5692 i!1108)) (= lt!264064 (MissingVacant!5692 i!1108))) (bvsgt #b00000000000000000000000000000000 (size!17660 a!2986))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36039 (_ BitVec 32)) SeekEntryResult!5692)

(assert (=> b!577573 (= lt!264064 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577574 () Bool)

(declare-fun res!365501 () Bool)

(assert (=> b!577574 (=> (not res!365501) (not e!332226))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577574 (= res!365501 (and (= (size!17660 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17660 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17660 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577575 () Bool)

(declare-fun res!365500 () Bool)

(assert (=> b!577575 (=> (not res!365500) (not e!332226))))

(declare-fun arrayContainsKey!0 (array!36039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577575 (= res!365500 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577576 () Bool)

(declare-fun res!365502 () Bool)

(assert (=> b!577576 (=> (not res!365502) (not e!332226))))

(assert (=> b!577576 (= res!365502 (validKeyInArray!0 (select (arr!17296 a!2986) j!136)))))

(declare-fun res!365503 () Bool)

(assert (=> start!53076 (=> (not res!365503) (not e!332226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53076 (= res!365503 (validMask!0 mask!3053))))

(assert (=> start!53076 e!332226))

(assert (=> start!53076 true))

(declare-fun array_inv!13155 (array!36039) Bool)

(assert (=> start!53076 (array_inv!13155 a!2986)))

(assert (= (and start!53076 res!365503) b!577574))

(assert (= (and b!577574 res!365501) b!577576))

(assert (= (and b!577576 res!365502) b!577572))

(assert (= (and b!577572 res!365499) b!577575))

(assert (= (and b!577575 res!365500) b!577573))

(declare-fun m!556607 () Bool)

(assert (=> b!577575 m!556607))

(declare-fun m!556609 () Bool)

(assert (=> b!577572 m!556609))

(declare-fun m!556611 () Bool)

(assert (=> b!577576 m!556611))

(assert (=> b!577576 m!556611))

(declare-fun m!556613 () Bool)

(assert (=> b!577576 m!556613))

(declare-fun m!556615 () Bool)

(assert (=> b!577573 m!556615))

(declare-fun m!556617 () Bool)

(assert (=> start!53076 m!556617))

(declare-fun m!556619 () Bool)

(assert (=> start!53076 m!556619))

(check-sat (not b!577575) (not b!577576) (not start!53076) (not b!577573) (not b!577572))
(check-sat)
