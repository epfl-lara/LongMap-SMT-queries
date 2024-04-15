; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53322 () Bool)

(assert start!53322)

(declare-fun b!579806 () Bool)

(declare-fun res!367770 () Bool)

(declare-fun e!333039 () Bool)

(assert (=> b!579806 (=> (not res!367770) (not e!333039))))

(declare-datatypes ((array!36237 0))(
  ( (array!36238 (arr!17393 (Array (_ BitVec 32) (_ BitVec 64))) (size!17758 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36237)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36237 (_ BitVec 32)) Bool)

(assert (=> b!579806 (= res!367770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579807 () Bool)

(declare-fun res!367764 () Bool)

(assert (=> b!579807 (=> (not res!367764) (not e!333039))))

(declare-datatypes ((List!11473 0))(
  ( (Nil!11470) (Cons!11469 (h!12514 (_ BitVec 64)) (t!17692 List!11473)) )
))
(declare-fun arrayNoDuplicates!0 (array!36237 (_ BitVec 32) List!11473) Bool)

(assert (=> b!579807 (= res!367764 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11470))))

(declare-fun b!579808 () Bool)

(declare-fun res!367772 () Bool)

(assert (=> b!579808 (=> (not res!367772) (not e!333039))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579808 (= res!367772 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17393 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17393 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579809 () Bool)

(declare-fun res!367767 () Bool)

(declare-fun e!333037 () Bool)

(assert (=> b!579809 (=> (not res!367767) (not e!333037))))

(declare-fun arrayContainsKey!0 (array!36237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579809 (= res!367767 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579810 () Bool)

(declare-fun res!367766 () Bool)

(assert (=> b!579810 (=> (not res!367766) (not e!333037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579810 (= res!367766 (validKeyInArray!0 k0!1786))))

(declare-fun b!579811 () Bool)

(declare-fun res!367771 () Bool)

(assert (=> b!579811 (=> (not res!367771) (not e!333037))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579811 (= res!367771 (validKeyInArray!0 (select (arr!17393 a!2986) j!136)))))

(declare-fun b!579812 () Bool)

(declare-fun res!367768 () Bool)

(assert (=> b!579812 (=> (not res!367768) (not e!333037))))

(assert (=> b!579812 (= res!367768 (and (= (size!17758 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17758 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17758 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!367765 () Bool)

(assert (=> start!53322 (=> (not res!367765) (not e!333037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53322 (= res!367765 (validMask!0 mask!3053))))

(assert (=> start!53322 e!333037))

(assert (=> start!53322 true))

(declare-fun array_inv!13276 (array!36237) Bool)

(assert (=> start!53322 (array_inv!13276 a!2986)))

(declare-fun b!579813 () Bool)

(assert (=> b!579813 (= e!333037 e!333039)))

(declare-fun res!367769 () Bool)

(assert (=> b!579813 (=> (not res!367769) (not e!333039))))

(declare-datatypes ((SeekEntryResult!5830 0))(
  ( (MissingZero!5830 (index!25547 (_ BitVec 32))) (Found!5830 (index!25548 (_ BitVec 32))) (Intermediate!5830 (undefined!6642 Bool) (index!25549 (_ BitVec 32)) (x!54438 (_ BitVec 32))) (Undefined!5830) (MissingVacant!5830 (index!25550 (_ BitVec 32))) )
))
(declare-fun lt!264391 () SeekEntryResult!5830)

(assert (=> b!579813 (= res!367769 (or (= lt!264391 (MissingZero!5830 i!1108)) (= lt!264391 (MissingVacant!5830 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36237 (_ BitVec 32)) SeekEntryResult!5830)

(assert (=> b!579813 (= lt!264391 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579814 () Bool)

(assert (=> b!579814 (= e!333039 false)))

(declare-fun lt!264390 () SeekEntryResult!5830)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36237 (_ BitVec 32)) SeekEntryResult!5830)

(assert (=> b!579814 (= lt!264390 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17393 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53322 res!367765) b!579812))

(assert (= (and b!579812 res!367768) b!579811))

(assert (= (and b!579811 res!367771) b!579810))

(assert (= (and b!579810 res!367766) b!579809))

(assert (= (and b!579809 res!367767) b!579813))

(assert (= (and b!579813 res!367769) b!579806))

(assert (= (and b!579806 res!367770) b!579807))

(assert (= (and b!579807 res!367764) b!579808))

(assert (= (and b!579808 res!367772) b!579814))

(declare-fun m!557887 () Bool)

(assert (=> b!579811 m!557887))

(assert (=> b!579811 m!557887))

(declare-fun m!557889 () Bool)

(assert (=> b!579811 m!557889))

(declare-fun m!557891 () Bool)

(assert (=> start!53322 m!557891))

(declare-fun m!557893 () Bool)

(assert (=> start!53322 m!557893))

(declare-fun m!557895 () Bool)

(assert (=> b!579806 m!557895))

(declare-fun m!557897 () Bool)

(assert (=> b!579813 m!557897))

(declare-fun m!557899 () Bool)

(assert (=> b!579808 m!557899))

(declare-fun m!557901 () Bool)

(assert (=> b!579808 m!557901))

(declare-fun m!557903 () Bool)

(assert (=> b!579808 m!557903))

(declare-fun m!557905 () Bool)

(assert (=> b!579807 m!557905))

(declare-fun m!557907 () Bool)

(assert (=> b!579809 m!557907))

(declare-fun m!557909 () Bool)

(assert (=> b!579810 m!557909))

(assert (=> b!579814 m!557887))

(assert (=> b!579814 m!557887))

(declare-fun m!557911 () Bool)

(assert (=> b!579814 m!557911))

(check-sat (not b!579806) (not start!53322) (not b!579814) (not b!579811) (not b!579807) (not b!579810) (not b!579813) (not b!579809))
(check-sat)
