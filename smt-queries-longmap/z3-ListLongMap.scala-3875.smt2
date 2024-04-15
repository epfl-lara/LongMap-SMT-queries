; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53244 () Bool)

(assert start!53244)

(declare-fun b!578753 () Bool)

(declare-fun res!366715 () Bool)

(declare-fun e!332688 () Bool)

(assert (=> b!578753 (=> (not res!366715) (not e!332688))))

(declare-datatypes ((array!36159 0))(
  ( (array!36160 (arr!17354 (Array (_ BitVec 32) (_ BitVec 64))) (size!17719 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36159)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36159 (_ BitVec 32)) Bool)

(assert (=> b!578753 (= res!366715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578754 () Bool)

(declare-fun res!366719 () Bool)

(assert (=> b!578754 (=> (not res!366719) (not e!332688))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578754 (= res!366719 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17354 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17354 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578755 () Bool)

(declare-fun res!366714 () Bool)

(declare-fun e!332686 () Bool)

(assert (=> b!578755 (=> (not res!366714) (not e!332686))))

(declare-fun arrayContainsKey!0 (array!36159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578755 (= res!366714 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578757 () Bool)

(assert (=> b!578757 (= e!332686 e!332688)))

(declare-fun res!366717 () Bool)

(assert (=> b!578757 (=> (not res!366717) (not e!332688))))

(declare-datatypes ((SeekEntryResult!5791 0))(
  ( (MissingZero!5791 (index!25391 (_ BitVec 32))) (Found!5791 (index!25392 (_ BitVec 32))) (Intermediate!5791 (undefined!6603 Bool) (index!25393 (_ BitVec 32)) (x!54295 (_ BitVec 32))) (Undefined!5791) (MissingVacant!5791 (index!25394 (_ BitVec 32))) )
))
(declare-fun lt!264157 () SeekEntryResult!5791)

(assert (=> b!578757 (= res!366717 (or (= lt!264157 (MissingZero!5791 i!1108)) (= lt!264157 (MissingVacant!5791 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36159 (_ BitVec 32)) SeekEntryResult!5791)

(assert (=> b!578757 (= lt!264157 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578758 () Bool)

(declare-fun res!366713 () Bool)

(assert (=> b!578758 (=> (not res!366713) (not e!332688))))

(declare-datatypes ((List!11434 0))(
  ( (Nil!11431) (Cons!11430 (h!12475 (_ BitVec 64)) (t!17653 List!11434)) )
))
(declare-fun arrayNoDuplicates!0 (array!36159 (_ BitVec 32) List!11434) Bool)

(assert (=> b!578758 (= res!366713 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11431))))

(declare-fun b!578759 () Bool)

(declare-fun res!366711 () Bool)

(assert (=> b!578759 (=> (not res!366711) (not e!332686))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578759 (= res!366711 (and (= (size!17719 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17719 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17719 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578760 () Bool)

(declare-fun res!366718 () Bool)

(assert (=> b!578760 (=> (not res!366718) (not e!332686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578760 (= res!366718 (validKeyInArray!0 (select (arr!17354 a!2986) j!136)))))

(declare-fun b!578761 () Bool)

(assert (=> b!578761 (= e!332688 false)))

(declare-fun lt!264156 () SeekEntryResult!5791)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36159 (_ BitVec 32)) SeekEntryResult!5791)

(assert (=> b!578761 (= lt!264156 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17354 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!366712 () Bool)

(assert (=> start!53244 (=> (not res!366712) (not e!332686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53244 (= res!366712 (validMask!0 mask!3053))))

(assert (=> start!53244 e!332686))

(assert (=> start!53244 true))

(declare-fun array_inv!13237 (array!36159) Bool)

(assert (=> start!53244 (array_inv!13237 a!2986)))

(declare-fun b!578756 () Bool)

(declare-fun res!366716 () Bool)

(assert (=> b!578756 (=> (not res!366716) (not e!332686))))

(assert (=> b!578756 (= res!366716 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53244 res!366712) b!578759))

(assert (= (and b!578759 res!366711) b!578760))

(assert (= (and b!578760 res!366718) b!578756))

(assert (= (and b!578756 res!366716) b!578755))

(assert (= (and b!578755 res!366714) b!578757))

(assert (= (and b!578757 res!366717) b!578753))

(assert (= (and b!578753 res!366715) b!578758))

(assert (= (and b!578758 res!366713) b!578754))

(assert (= (and b!578754 res!366719) b!578761))

(declare-fun m!556873 () Bool)

(assert (=> b!578755 m!556873))

(declare-fun m!556875 () Bool)

(assert (=> b!578754 m!556875))

(declare-fun m!556877 () Bool)

(assert (=> b!578754 m!556877))

(declare-fun m!556879 () Bool)

(assert (=> b!578754 m!556879))

(declare-fun m!556881 () Bool)

(assert (=> b!578756 m!556881))

(declare-fun m!556883 () Bool)

(assert (=> b!578761 m!556883))

(assert (=> b!578761 m!556883))

(declare-fun m!556885 () Bool)

(assert (=> b!578761 m!556885))

(declare-fun m!556887 () Bool)

(assert (=> b!578753 m!556887))

(declare-fun m!556889 () Bool)

(assert (=> start!53244 m!556889))

(declare-fun m!556891 () Bool)

(assert (=> start!53244 m!556891))

(declare-fun m!556893 () Bool)

(assert (=> b!578758 m!556893))

(assert (=> b!578760 m!556883))

(assert (=> b!578760 m!556883))

(declare-fun m!556895 () Bool)

(assert (=> b!578760 m!556895))

(declare-fun m!556897 () Bool)

(assert (=> b!578757 m!556897))

(check-sat (not b!578761) (not b!578758) (not b!578753) (not start!53244) (not b!578757) (not b!578755) (not b!578756) (not b!578760))
(check-sat)
