; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53532 () Bool)

(assert start!53532)

(declare-fun b!582677 () Bool)

(declare-fun res!370640 () Bool)

(declare-fun e!333984 () Bool)

(assert (=> b!582677 (=> (not res!370640) (not e!333984))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582677 (= res!370640 (validKeyInArray!0 k0!1786))))

(declare-fun b!582678 () Bool)

(declare-fun res!370643 () Bool)

(assert (=> b!582678 (=> (not res!370643) (not e!333984))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36447 0))(
  ( (array!36448 (arr!17498 (Array (_ BitVec 32) (_ BitVec 64))) (size!17863 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36447)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582678 (= res!370643 (and (= (size!17863 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17863 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17863 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582679 () Bool)

(declare-fun res!370639 () Bool)

(declare-fun e!333983 () Bool)

(assert (=> b!582679 (=> (not res!370639) (not e!333983))))

(declare-datatypes ((List!11578 0))(
  ( (Nil!11575) (Cons!11574 (h!12619 (_ BitVec 64)) (t!17797 List!11578)) )
))
(declare-fun arrayNoDuplicates!0 (array!36447 (_ BitVec 32) List!11578) Bool)

(assert (=> b!582679 (= res!370639 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11575))))

(declare-fun b!582680 () Bool)

(assert (=> b!582680 (= e!333984 e!333983)))

(declare-fun res!370637 () Bool)

(assert (=> b!582680 (=> (not res!370637) (not e!333983))))

(declare-datatypes ((SeekEntryResult!5935 0))(
  ( (MissingZero!5935 (index!25967 (_ BitVec 32))) (Found!5935 (index!25968 (_ BitVec 32))) (Intermediate!5935 (undefined!6747 Bool) (index!25969 (_ BitVec 32)) (x!54823 (_ BitVec 32))) (Undefined!5935) (MissingVacant!5935 (index!25970 (_ BitVec 32))) )
))
(declare-fun lt!264994 () SeekEntryResult!5935)

(assert (=> b!582680 (= res!370637 (or (= lt!264994 (MissingZero!5935 i!1108)) (= lt!264994 (MissingVacant!5935 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36447 (_ BitVec 32)) SeekEntryResult!5935)

(assert (=> b!582680 (= lt!264994 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582681 () Bool)

(declare-fun res!370642 () Bool)

(assert (=> b!582681 (=> (not res!370642) (not e!333984))))

(assert (=> b!582681 (= res!370642 (validKeyInArray!0 (select (arr!17498 a!2986) j!136)))))

(declare-fun b!582682 () Bool)

(assert (=> b!582682 (= e!333983 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264993 () SeekEntryResult!5935)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36447 (_ BitVec 32)) SeekEntryResult!5935)

(assert (=> b!582682 (= lt!264993 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17498 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!370638 () Bool)

(assert (=> start!53532 (=> (not res!370638) (not e!333984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53532 (= res!370638 (validMask!0 mask!3053))))

(assert (=> start!53532 e!333984))

(assert (=> start!53532 true))

(declare-fun array_inv!13381 (array!36447) Bool)

(assert (=> start!53532 (array_inv!13381 a!2986)))

(declare-fun b!582683 () Bool)

(declare-fun res!370635 () Bool)

(assert (=> b!582683 (=> (not res!370635) (not e!333983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36447 (_ BitVec 32)) Bool)

(assert (=> b!582683 (= res!370635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582684 () Bool)

(declare-fun res!370641 () Bool)

(assert (=> b!582684 (=> (not res!370641) (not e!333983))))

(assert (=> b!582684 (= res!370641 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17498 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17498 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582685 () Bool)

(declare-fun res!370636 () Bool)

(assert (=> b!582685 (=> (not res!370636) (not e!333984))))

(declare-fun arrayContainsKey!0 (array!36447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582685 (= res!370636 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53532 res!370638) b!582678))

(assert (= (and b!582678 res!370643) b!582681))

(assert (= (and b!582681 res!370642) b!582677))

(assert (= (and b!582677 res!370640) b!582685))

(assert (= (and b!582685 res!370636) b!582680))

(assert (= (and b!582680 res!370637) b!582683))

(assert (= (and b!582683 res!370635) b!582679))

(assert (= (and b!582679 res!370639) b!582684))

(assert (= (and b!582684 res!370641) b!582682))

(declare-fun m!560647 () Bool)

(assert (=> b!582685 m!560647))

(declare-fun m!560649 () Bool)

(assert (=> b!582681 m!560649))

(assert (=> b!582681 m!560649))

(declare-fun m!560651 () Bool)

(assert (=> b!582681 m!560651))

(declare-fun m!560653 () Bool)

(assert (=> b!582683 m!560653))

(declare-fun m!560655 () Bool)

(assert (=> b!582684 m!560655))

(declare-fun m!560657 () Bool)

(assert (=> b!582684 m!560657))

(declare-fun m!560659 () Bool)

(assert (=> b!582684 m!560659))

(assert (=> b!582682 m!560649))

(assert (=> b!582682 m!560649))

(declare-fun m!560661 () Bool)

(assert (=> b!582682 m!560661))

(declare-fun m!560663 () Bool)

(assert (=> start!53532 m!560663))

(declare-fun m!560665 () Bool)

(assert (=> start!53532 m!560665))

(declare-fun m!560667 () Bool)

(assert (=> b!582680 m!560667))

(declare-fun m!560669 () Bool)

(assert (=> b!582679 m!560669))

(declare-fun m!560671 () Bool)

(assert (=> b!582677 m!560671))

(check-sat (not b!582682) (not b!582681) (not b!582685) (not b!582679) (not b!582683) (not start!53532) (not b!582680) (not b!582677))
(check-sat)
