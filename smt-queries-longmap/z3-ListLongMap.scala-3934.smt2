; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53598 () Bool)

(assert start!53598)

(declare-fun b!583691 () Bool)

(declare-fun res!371649 () Bool)

(declare-fun e!334317 () Bool)

(assert (=> b!583691 (=> (not res!371649) (not e!334317))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36513 0))(
  ( (array!36514 (arr!17531 (Array (_ BitVec 32) (_ BitVec 64))) (size!17896 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36513)

(assert (=> b!583691 (= res!371649 (and (= (size!17896 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17896 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17896 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583692 () Bool)

(declare-fun res!371654 () Bool)

(declare-fun e!334318 () Bool)

(assert (=> b!583692 (=> (not res!371654) (not e!334318))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583692 (= res!371654 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17531 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17531 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583693 () Bool)

(declare-fun e!334320 () Bool)

(assert (=> b!583693 (= e!334320 false)))

(declare-fun lt!265221 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5968 0))(
  ( (MissingZero!5968 (index!26099 (_ BitVec 32))) (Found!5968 (index!26100 (_ BitVec 32))) (Intermediate!5968 (undefined!6780 Bool) (index!26101 (_ BitVec 32)) (x!54944 (_ BitVec 32))) (Undefined!5968) (MissingVacant!5968 (index!26102 (_ BitVec 32))) )
))
(declare-fun lt!265222 () SeekEntryResult!5968)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36513 (_ BitVec 32)) SeekEntryResult!5968)

(assert (=> b!583693 (= lt!265222 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265221 vacantSpotIndex!68 (select (arr!17531 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583694 () Bool)

(assert (=> b!583694 (= e!334317 e!334318)))

(declare-fun res!371651 () Bool)

(assert (=> b!583694 (=> (not res!371651) (not e!334318))))

(declare-fun lt!265220 () SeekEntryResult!5968)

(assert (=> b!583694 (= res!371651 (or (= lt!265220 (MissingZero!5968 i!1108)) (= lt!265220 (MissingVacant!5968 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36513 (_ BitVec 32)) SeekEntryResult!5968)

(assert (=> b!583694 (= lt!265220 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583695 () Bool)

(assert (=> b!583695 (= e!334318 e!334320)))

(declare-fun res!371660 () Bool)

(assert (=> b!583695 (=> (not res!371660) (not e!334320))))

(assert (=> b!583695 (= res!371660 (and (bvsge lt!265221 #b00000000000000000000000000000000) (bvslt lt!265221 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583695 (= lt!265221 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583696 () Bool)

(declare-fun res!371650 () Bool)

(assert (=> b!583696 (=> (not res!371650) (not e!334318))))

(declare-datatypes ((List!11611 0))(
  ( (Nil!11608) (Cons!11607 (h!12652 (_ BitVec 64)) (t!17830 List!11611)) )
))
(declare-fun arrayNoDuplicates!0 (array!36513 (_ BitVec 32) List!11611) Bool)

(assert (=> b!583696 (= res!371650 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11608))))

(declare-fun b!583697 () Bool)

(declare-fun res!371652 () Bool)

(assert (=> b!583697 (=> (not res!371652) (not e!334317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583697 (= res!371652 (validKeyInArray!0 (select (arr!17531 a!2986) j!136)))))

(declare-fun b!583698 () Bool)

(declare-fun res!371657 () Bool)

(assert (=> b!583698 (=> (not res!371657) (not e!334318))))

(assert (=> b!583698 (= res!371657 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17531 a!2986) j!136) a!2986 mask!3053) (Found!5968 j!136)))))

(declare-fun b!583699 () Bool)

(declare-fun res!371653 () Bool)

(assert (=> b!583699 (=> (not res!371653) (not e!334317))))

(declare-fun arrayContainsKey!0 (array!36513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583699 (= res!371653 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583700 () Bool)

(declare-fun res!371656 () Bool)

(assert (=> b!583700 (=> (not res!371656) (not e!334318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36513 (_ BitVec 32)) Bool)

(assert (=> b!583700 (= res!371656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583701 () Bool)

(declare-fun res!371659 () Bool)

(assert (=> b!583701 (=> (not res!371659) (not e!334318))))

(assert (=> b!583701 (= res!371659 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17531 a!2986) index!984) (select (arr!17531 a!2986) j!136))) (not (= (select (arr!17531 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583702 () Bool)

(declare-fun res!371658 () Bool)

(assert (=> b!583702 (=> (not res!371658) (not e!334317))))

(assert (=> b!583702 (= res!371658 (validKeyInArray!0 k0!1786))))

(declare-fun res!371655 () Bool)

(assert (=> start!53598 (=> (not res!371655) (not e!334317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53598 (= res!371655 (validMask!0 mask!3053))))

(assert (=> start!53598 e!334317))

(assert (=> start!53598 true))

(declare-fun array_inv!13414 (array!36513) Bool)

(assert (=> start!53598 (array_inv!13414 a!2986)))

(assert (= (and start!53598 res!371655) b!583691))

(assert (= (and b!583691 res!371649) b!583697))

(assert (= (and b!583697 res!371652) b!583702))

(assert (= (and b!583702 res!371658) b!583699))

(assert (= (and b!583699 res!371653) b!583694))

(assert (= (and b!583694 res!371651) b!583700))

(assert (= (and b!583700 res!371656) b!583696))

(assert (= (and b!583696 res!371650) b!583692))

(assert (= (and b!583692 res!371654) b!583698))

(assert (= (and b!583698 res!371657) b!583701))

(assert (= (and b!583701 res!371659) b!583695))

(assert (= (and b!583695 res!371660) b!583693))

(declare-fun m!561583 () Bool)

(assert (=> b!583694 m!561583))

(declare-fun m!561585 () Bool)

(assert (=> b!583697 m!561585))

(assert (=> b!583697 m!561585))

(declare-fun m!561587 () Bool)

(assert (=> b!583697 m!561587))

(declare-fun m!561589 () Bool)

(assert (=> b!583696 m!561589))

(declare-fun m!561591 () Bool)

(assert (=> b!583695 m!561591))

(declare-fun m!561593 () Bool)

(assert (=> b!583692 m!561593))

(declare-fun m!561595 () Bool)

(assert (=> b!583692 m!561595))

(declare-fun m!561597 () Bool)

(assert (=> b!583692 m!561597))

(declare-fun m!561599 () Bool)

(assert (=> b!583699 m!561599))

(assert (=> b!583693 m!561585))

(assert (=> b!583693 m!561585))

(declare-fun m!561601 () Bool)

(assert (=> b!583693 m!561601))

(declare-fun m!561603 () Bool)

(assert (=> b!583700 m!561603))

(assert (=> b!583698 m!561585))

(assert (=> b!583698 m!561585))

(declare-fun m!561605 () Bool)

(assert (=> b!583698 m!561605))

(declare-fun m!561607 () Bool)

(assert (=> b!583701 m!561607))

(assert (=> b!583701 m!561585))

(declare-fun m!561609 () Bool)

(assert (=> b!583702 m!561609))

(declare-fun m!561611 () Bool)

(assert (=> start!53598 m!561611))

(declare-fun m!561613 () Bool)

(assert (=> start!53598 m!561613))

(check-sat (not b!583695) (not b!583693) (not b!583702) (not b!583699) (not b!583700) (not b!583696) (not b!583698) (not start!53598) (not b!583697) (not b!583694))
(check-sat)
