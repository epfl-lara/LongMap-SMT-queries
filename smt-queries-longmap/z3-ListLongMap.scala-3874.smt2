; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53238 () Bool)

(assert start!53238)

(declare-fun b!578672 () Bool)

(declare-fun e!332660 () Bool)

(assert (=> b!578672 (= e!332660 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5788 0))(
  ( (MissingZero!5788 (index!25379 (_ BitVec 32))) (Found!5788 (index!25380 (_ BitVec 32))) (Intermediate!5788 (undefined!6600 Bool) (index!25381 (_ BitVec 32)) (x!54284 (_ BitVec 32))) (Undefined!5788) (MissingVacant!5788 (index!25382 (_ BitVec 32))) )
))
(declare-fun lt!264139 () SeekEntryResult!5788)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36153 0))(
  ( (array!36154 (arr!17351 (Array (_ BitVec 32) (_ BitVec 64))) (size!17716 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36153)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36153 (_ BitVec 32)) SeekEntryResult!5788)

(assert (=> b!578672 (= lt!264139 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17351 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!366638 () Bool)

(declare-fun e!332661 () Bool)

(assert (=> start!53238 (=> (not res!366638) (not e!332661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53238 (= res!366638 (validMask!0 mask!3053))))

(assert (=> start!53238 e!332661))

(assert (=> start!53238 true))

(declare-fun array_inv!13234 (array!36153) Bool)

(assert (=> start!53238 (array_inv!13234 a!2986)))

(declare-fun b!578673 () Bool)

(declare-fun res!366634 () Bool)

(assert (=> b!578673 (=> (not res!366634) (not e!332660))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!578673 (= res!366634 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17351 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17351 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578674 () Bool)

(declare-fun res!366631 () Bool)

(assert (=> b!578674 (=> (not res!366631) (not e!332661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578674 (= res!366631 (validKeyInArray!0 (select (arr!17351 a!2986) j!136)))))

(declare-fun b!578675 () Bool)

(declare-fun res!366635 () Bool)

(assert (=> b!578675 (=> (not res!366635) (not e!332661))))

(assert (=> b!578675 (= res!366635 (validKeyInArray!0 k0!1786))))

(declare-fun b!578676 () Bool)

(assert (=> b!578676 (= e!332661 e!332660)))

(declare-fun res!366636 () Bool)

(assert (=> b!578676 (=> (not res!366636) (not e!332660))))

(declare-fun lt!264138 () SeekEntryResult!5788)

(assert (=> b!578676 (= res!366636 (or (= lt!264138 (MissingZero!5788 i!1108)) (= lt!264138 (MissingVacant!5788 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36153 (_ BitVec 32)) SeekEntryResult!5788)

(assert (=> b!578676 (= lt!264138 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578677 () Bool)

(declare-fun res!366637 () Bool)

(assert (=> b!578677 (=> (not res!366637) (not e!332660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36153 (_ BitVec 32)) Bool)

(assert (=> b!578677 (= res!366637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578678 () Bool)

(declare-fun res!366630 () Bool)

(assert (=> b!578678 (=> (not res!366630) (not e!332660))))

(declare-datatypes ((List!11431 0))(
  ( (Nil!11428) (Cons!11427 (h!12472 (_ BitVec 64)) (t!17650 List!11431)) )
))
(declare-fun arrayNoDuplicates!0 (array!36153 (_ BitVec 32) List!11431) Bool)

(assert (=> b!578678 (= res!366630 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11428))))

(declare-fun b!578679 () Bool)

(declare-fun res!366633 () Bool)

(assert (=> b!578679 (=> (not res!366633) (not e!332661))))

(declare-fun arrayContainsKey!0 (array!36153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578679 (= res!366633 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578680 () Bool)

(declare-fun res!366632 () Bool)

(assert (=> b!578680 (=> (not res!366632) (not e!332661))))

(assert (=> b!578680 (= res!366632 (and (= (size!17716 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17716 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17716 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53238 res!366638) b!578680))

(assert (= (and b!578680 res!366632) b!578674))

(assert (= (and b!578674 res!366631) b!578675))

(assert (= (and b!578675 res!366635) b!578679))

(assert (= (and b!578679 res!366633) b!578676))

(assert (= (and b!578676 res!366636) b!578677))

(assert (= (and b!578677 res!366637) b!578678))

(assert (= (and b!578678 res!366630) b!578673))

(assert (= (and b!578673 res!366634) b!578672))

(declare-fun m!556795 () Bool)

(assert (=> start!53238 m!556795))

(declare-fun m!556797 () Bool)

(assert (=> start!53238 m!556797))

(declare-fun m!556799 () Bool)

(assert (=> b!578678 m!556799))

(declare-fun m!556801 () Bool)

(assert (=> b!578675 m!556801))

(declare-fun m!556803 () Bool)

(assert (=> b!578676 m!556803))

(declare-fun m!556805 () Bool)

(assert (=> b!578677 m!556805))

(declare-fun m!556807 () Bool)

(assert (=> b!578679 m!556807))

(declare-fun m!556809 () Bool)

(assert (=> b!578674 m!556809))

(assert (=> b!578674 m!556809))

(declare-fun m!556811 () Bool)

(assert (=> b!578674 m!556811))

(assert (=> b!578672 m!556809))

(assert (=> b!578672 m!556809))

(declare-fun m!556813 () Bool)

(assert (=> b!578672 m!556813))

(declare-fun m!556815 () Bool)

(assert (=> b!578673 m!556815))

(declare-fun m!556817 () Bool)

(assert (=> b!578673 m!556817))

(declare-fun m!556819 () Bool)

(assert (=> b!578673 m!556819))

(check-sat (not b!578678) (not b!578675) (not b!578674) (not b!578679) (not b!578672) (not start!53238) (not b!578676) (not b!578677))
(check-sat)
