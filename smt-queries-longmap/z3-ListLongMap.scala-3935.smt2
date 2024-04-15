; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53604 () Bool)

(assert start!53604)

(declare-fun b!583799 () Bool)

(declare-fun res!371761 () Bool)

(declare-fun e!334354 () Bool)

(assert (=> b!583799 (=> (not res!371761) (not e!334354))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36519 0))(
  ( (array!36520 (arr!17534 (Array (_ BitVec 32) (_ BitVec 64))) (size!17899 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36519)

(assert (=> b!583799 (= res!371761 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17534 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17534 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583800 () Bool)

(declare-fun res!371766 () Bool)

(declare-fun e!334353 () Bool)

(assert (=> b!583800 (=> (not res!371766) (not e!334353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583800 (= res!371766 (validKeyInArray!0 k0!1786))))

(declare-fun b!583801 () Bool)

(declare-fun res!371765 () Bool)

(assert (=> b!583801 (=> (not res!371765) (not e!334354))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583801 (= res!371765 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17534 a!2986) index!984) (select (arr!17534 a!2986) j!136))) (not (= (select (arr!17534 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583802 () Bool)

(declare-fun res!371768 () Bool)

(assert (=> b!583802 (=> (not res!371768) (not e!334353))))

(assert (=> b!583802 (= res!371768 (and (= (size!17899 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17899 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17899 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583803 () Bool)

(declare-fun e!334355 () Bool)

(assert (=> b!583803 (= e!334355 false)))

(declare-datatypes ((SeekEntryResult!5971 0))(
  ( (MissingZero!5971 (index!26111 (_ BitVec 32))) (Found!5971 (index!26112 (_ BitVec 32))) (Intermediate!5971 (undefined!6783 Bool) (index!26113 (_ BitVec 32)) (x!54955 (_ BitVec 32))) (Undefined!5971) (MissingVacant!5971 (index!26114 (_ BitVec 32))) )
))
(declare-fun lt!265249 () SeekEntryResult!5971)

(declare-fun lt!265247 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36519 (_ BitVec 32)) SeekEntryResult!5971)

(assert (=> b!583803 (= lt!265249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265247 vacantSpotIndex!68 (select (arr!17534 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583804 () Bool)

(assert (=> b!583804 (= e!334354 e!334355)))

(declare-fun res!371760 () Bool)

(assert (=> b!583804 (=> (not res!371760) (not e!334355))))

(assert (=> b!583804 (= res!371760 (and (bvsge lt!265247 #b00000000000000000000000000000000) (bvslt lt!265247 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583804 (= lt!265247 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583805 () Bool)

(declare-fun res!371759 () Bool)

(assert (=> b!583805 (=> (not res!371759) (not e!334354))))

(assert (=> b!583805 (= res!371759 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17534 a!2986) j!136) a!2986 mask!3053) (Found!5971 j!136)))))

(declare-fun b!583806 () Bool)

(declare-fun res!371757 () Bool)

(assert (=> b!583806 (=> (not res!371757) (not e!334353))))

(assert (=> b!583806 (= res!371757 (validKeyInArray!0 (select (arr!17534 a!2986) j!136)))))

(declare-fun res!371762 () Bool)

(assert (=> start!53604 (=> (not res!371762) (not e!334353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53604 (= res!371762 (validMask!0 mask!3053))))

(assert (=> start!53604 e!334353))

(assert (=> start!53604 true))

(declare-fun array_inv!13417 (array!36519) Bool)

(assert (=> start!53604 (array_inv!13417 a!2986)))

(declare-fun b!583807 () Bool)

(declare-fun res!371764 () Bool)

(assert (=> b!583807 (=> (not res!371764) (not e!334354))))

(declare-datatypes ((List!11614 0))(
  ( (Nil!11611) (Cons!11610 (h!12655 (_ BitVec 64)) (t!17833 List!11614)) )
))
(declare-fun arrayNoDuplicates!0 (array!36519 (_ BitVec 32) List!11614) Bool)

(assert (=> b!583807 (= res!371764 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11611))))

(declare-fun b!583808 () Bool)

(declare-fun res!371767 () Bool)

(assert (=> b!583808 (=> (not res!371767) (not e!334354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36519 (_ BitVec 32)) Bool)

(assert (=> b!583808 (= res!371767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583809 () Bool)

(assert (=> b!583809 (= e!334353 e!334354)))

(declare-fun res!371763 () Bool)

(assert (=> b!583809 (=> (not res!371763) (not e!334354))))

(declare-fun lt!265248 () SeekEntryResult!5971)

(assert (=> b!583809 (= res!371763 (or (= lt!265248 (MissingZero!5971 i!1108)) (= lt!265248 (MissingVacant!5971 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36519 (_ BitVec 32)) SeekEntryResult!5971)

(assert (=> b!583809 (= lt!265248 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583810 () Bool)

(declare-fun res!371758 () Bool)

(assert (=> b!583810 (=> (not res!371758) (not e!334353))))

(declare-fun arrayContainsKey!0 (array!36519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583810 (= res!371758 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53604 res!371762) b!583802))

(assert (= (and b!583802 res!371768) b!583806))

(assert (= (and b!583806 res!371757) b!583800))

(assert (= (and b!583800 res!371766) b!583810))

(assert (= (and b!583810 res!371758) b!583809))

(assert (= (and b!583809 res!371763) b!583808))

(assert (= (and b!583808 res!371767) b!583807))

(assert (= (and b!583807 res!371764) b!583799))

(assert (= (and b!583799 res!371761) b!583805))

(assert (= (and b!583805 res!371759) b!583801))

(assert (= (and b!583801 res!371765) b!583804))

(assert (= (and b!583804 res!371760) b!583803))

(declare-fun m!561679 () Bool)

(assert (=> b!583805 m!561679))

(assert (=> b!583805 m!561679))

(declare-fun m!561681 () Bool)

(assert (=> b!583805 m!561681))

(declare-fun m!561683 () Bool)

(assert (=> b!583808 m!561683))

(assert (=> b!583803 m!561679))

(assert (=> b!583803 m!561679))

(declare-fun m!561685 () Bool)

(assert (=> b!583803 m!561685))

(declare-fun m!561687 () Bool)

(assert (=> b!583810 m!561687))

(declare-fun m!561689 () Bool)

(assert (=> start!53604 m!561689))

(declare-fun m!561691 () Bool)

(assert (=> start!53604 m!561691))

(declare-fun m!561693 () Bool)

(assert (=> b!583800 m!561693))

(assert (=> b!583806 m!561679))

(assert (=> b!583806 m!561679))

(declare-fun m!561695 () Bool)

(assert (=> b!583806 m!561695))

(declare-fun m!561697 () Bool)

(assert (=> b!583801 m!561697))

(assert (=> b!583801 m!561679))

(declare-fun m!561699 () Bool)

(assert (=> b!583807 m!561699))

(declare-fun m!561701 () Bool)

(assert (=> b!583804 m!561701))

(declare-fun m!561703 () Bool)

(assert (=> b!583809 m!561703))

(declare-fun m!561705 () Bool)

(assert (=> b!583799 m!561705))

(declare-fun m!561707 () Bool)

(assert (=> b!583799 m!561707))

(declare-fun m!561709 () Bool)

(assert (=> b!583799 m!561709))

(check-sat (not b!583807) (not b!583805) (not b!583810) (not b!583809) (not b!583803) (not b!583800) (not b!583804) (not b!583808) (not b!583806) (not start!53604))
(check-sat)
