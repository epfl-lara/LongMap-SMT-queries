; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53406 () Bool)

(assert start!53406)

(declare-fun b!581004 () Bool)

(declare-fun e!333519 () Bool)

(assert (=> b!581004 (= e!333519 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5868 0))(
  ( (MissingZero!5868 (index!25699 (_ BitVec 32))) (Found!5868 (index!25700 (_ BitVec 32))) (Intermediate!5868 (undefined!6680 Bool) (index!25701 (_ BitVec 32)) (x!54569 (_ BitVec 32))) (Undefined!5868) (MissingVacant!5868 (index!25702 (_ BitVec 32))) )
))
(declare-fun lt!264819 () SeekEntryResult!5868)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36307 0))(
  ( (array!36308 (arr!17428 (Array (_ BitVec 32) (_ BitVec 64))) (size!17792 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36307)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36307 (_ BitVec 32)) SeekEntryResult!5868)

(assert (=> b!581004 (= lt!264819 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17428 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581005 () Bool)

(declare-fun res!368823 () Bool)

(assert (=> b!581005 (=> (not res!368823) (not e!333519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36307 (_ BitVec 32)) Bool)

(assert (=> b!581005 (= res!368823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!368822 () Bool)

(declare-fun e!333518 () Bool)

(assert (=> start!53406 (=> (not res!368822) (not e!333518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53406 (= res!368822 (validMask!0 mask!3053))))

(assert (=> start!53406 e!333518))

(assert (=> start!53406 true))

(declare-fun array_inv!13224 (array!36307) Bool)

(assert (=> start!53406 (array_inv!13224 a!2986)))

(declare-fun b!581006 () Bool)

(declare-fun res!368821 () Bool)

(assert (=> b!581006 (=> (not res!368821) (not e!333518))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581006 (= res!368821 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581007 () Bool)

(declare-fun res!368827 () Bool)

(assert (=> b!581007 (=> (not res!368827) (not e!333519))))

(declare-datatypes ((List!11469 0))(
  ( (Nil!11466) (Cons!11465 (h!12510 (_ BitVec 64)) (t!17697 List!11469)) )
))
(declare-fun arrayNoDuplicates!0 (array!36307 (_ BitVec 32) List!11469) Bool)

(assert (=> b!581007 (= res!368827 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11466))))

(declare-fun b!581008 () Bool)

(declare-fun res!368820 () Bool)

(assert (=> b!581008 (=> (not res!368820) (not e!333518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581008 (= res!368820 (validKeyInArray!0 k0!1786))))

(declare-fun b!581009 () Bool)

(assert (=> b!581009 (= e!333518 e!333519)))

(declare-fun res!368826 () Bool)

(assert (=> b!581009 (=> (not res!368826) (not e!333519))))

(declare-fun lt!264820 () SeekEntryResult!5868)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581009 (= res!368826 (or (= lt!264820 (MissingZero!5868 i!1108)) (= lt!264820 (MissingVacant!5868 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36307 (_ BitVec 32)) SeekEntryResult!5868)

(assert (=> b!581009 (= lt!264820 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581010 () Bool)

(declare-fun res!368824 () Bool)

(assert (=> b!581010 (=> (not res!368824) (not e!333518))))

(assert (=> b!581010 (= res!368824 (and (= (size!17792 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17792 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17792 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581011 () Bool)

(declare-fun res!368825 () Bool)

(assert (=> b!581011 (=> (not res!368825) (not e!333519))))

(assert (=> b!581011 (= res!368825 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17428 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17428 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581012 () Bool)

(declare-fun res!368828 () Bool)

(assert (=> b!581012 (=> (not res!368828) (not e!333518))))

(assert (=> b!581012 (= res!368828 (validKeyInArray!0 (select (arr!17428 a!2986) j!136)))))

(assert (= (and start!53406 res!368822) b!581010))

(assert (= (and b!581010 res!368824) b!581012))

(assert (= (and b!581012 res!368828) b!581008))

(assert (= (and b!581008 res!368820) b!581006))

(assert (= (and b!581006 res!368821) b!581009))

(assert (= (and b!581009 res!368826) b!581005))

(assert (= (and b!581005 res!368823) b!581007))

(assert (= (and b!581007 res!368827) b!581011))

(assert (= (and b!581011 res!368825) b!581004))

(declare-fun m!559563 () Bool)

(assert (=> b!581006 m!559563))

(declare-fun m!559565 () Bool)

(assert (=> b!581007 m!559565))

(declare-fun m!559567 () Bool)

(assert (=> b!581008 m!559567))

(declare-fun m!559569 () Bool)

(assert (=> b!581011 m!559569))

(declare-fun m!559571 () Bool)

(assert (=> b!581011 m!559571))

(declare-fun m!559573 () Bool)

(assert (=> b!581011 m!559573))

(declare-fun m!559575 () Bool)

(assert (=> b!581005 m!559575))

(declare-fun m!559577 () Bool)

(assert (=> start!53406 m!559577))

(declare-fun m!559579 () Bool)

(assert (=> start!53406 m!559579))

(declare-fun m!559581 () Bool)

(assert (=> b!581012 m!559581))

(assert (=> b!581012 m!559581))

(declare-fun m!559583 () Bool)

(assert (=> b!581012 m!559583))

(assert (=> b!581004 m!559581))

(assert (=> b!581004 m!559581))

(declare-fun m!559585 () Bool)

(assert (=> b!581004 m!559585))

(declare-fun m!559587 () Bool)

(assert (=> b!581009 m!559587))

(check-sat (not b!581007) (not b!581004) (not b!581005) (not b!581006) (not start!53406) (not b!581012) (not b!581009) (not b!581008))
(check-sat)
