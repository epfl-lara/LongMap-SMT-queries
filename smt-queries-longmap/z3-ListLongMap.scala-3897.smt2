; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53394 () Bool)

(assert start!53394)

(declare-fun b!580842 () Bool)

(declare-fun res!368660 () Bool)

(declare-fun e!333463 () Bool)

(assert (=> b!580842 (=> (not res!368660) (not e!333463))))

(declare-datatypes ((array!36295 0))(
  ( (array!36296 (arr!17422 (Array (_ BitVec 32) (_ BitVec 64))) (size!17786 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36295)

(declare-datatypes ((List!11463 0))(
  ( (Nil!11460) (Cons!11459 (h!12504 (_ BitVec 64)) (t!17691 List!11463)) )
))
(declare-fun arrayNoDuplicates!0 (array!36295 (_ BitVec 32) List!11463) Bool)

(assert (=> b!580842 (= res!368660 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11460))))

(declare-fun res!368661 () Bool)

(declare-fun e!333465 () Bool)

(assert (=> start!53394 (=> (not res!368661) (not e!333465))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53394 (= res!368661 (validMask!0 mask!3053))))

(assert (=> start!53394 e!333465))

(assert (=> start!53394 true))

(declare-fun array_inv!13218 (array!36295) Bool)

(assert (=> start!53394 (array_inv!13218 a!2986)))

(declare-fun b!580843 () Bool)

(declare-fun res!368659 () Bool)

(assert (=> b!580843 (=> (not res!368659) (not e!333465))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580843 (= res!368659 (validKeyInArray!0 (select (arr!17422 a!2986) j!136)))))

(declare-fun b!580844 () Bool)

(declare-fun res!368662 () Bool)

(assert (=> b!580844 (=> (not res!368662) (not e!333465))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580844 (= res!368662 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580845 () Bool)

(declare-fun res!368664 () Bool)

(assert (=> b!580845 (=> (not res!368664) (not e!333465))))

(assert (=> b!580845 (= res!368664 (validKeyInArray!0 k0!1786))))

(declare-fun b!580846 () Bool)

(declare-fun res!368658 () Bool)

(assert (=> b!580846 (=> (not res!368658) (not e!333465))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580846 (= res!368658 (and (= (size!17786 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17786 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17786 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580847 () Bool)

(declare-fun res!368665 () Bool)

(assert (=> b!580847 (=> (not res!368665) (not e!333463))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580847 (= res!368665 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17422 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17422 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580848 () Bool)

(assert (=> b!580848 (= e!333465 e!333463)))

(declare-fun res!368666 () Bool)

(assert (=> b!580848 (=> (not res!368666) (not e!333463))))

(declare-datatypes ((SeekEntryResult!5862 0))(
  ( (MissingZero!5862 (index!25675 (_ BitVec 32))) (Found!5862 (index!25676 (_ BitVec 32))) (Intermediate!5862 (undefined!6674 Bool) (index!25677 (_ BitVec 32)) (x!54547 (_ BitVec 32))) (Undefined!5862) (MissingVacant!5862 (index!25678 (_ BitVec 32))) )
))
(declare-fun lt!264783 () SeekEntryResult!5862)

(assert (=> b!580848 (= res!368666 (or (= lt!264783 (MissingZero!5862 i!1108)) (= lt!264783 (MissingVacant!5862 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36295 (_ BitVec 32)) SeekEntryResult!5862)

(assert (=> b!580848 (= lt!264783 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580849 () Bool)

(declare-fun res!368663 () Bool)

(assert (=> b!580849 (=> (not res!368663) (not e!333463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36295 (_ BitVec 32)) Bool)

(assert (=> b!580849 (= res!368663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580850 () Bool)

(assert (=> b!580850 (= e!333463 false)))

(declare-fun lt!264784 () SeekEntryResult!5862)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36295 (_ BitVec 32)) SeekEntryResult!5862)

(assert (=> b!580850 (= lt!264784 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17422 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53394 res!368661) b!580846))

(assert (= (and b!580846 res!368658) b!580843))

(assert (= (and b!580843 res!368659) b!580845))

(assert (= (and b!580845 res!368664) b!580844))

(assert (= (and b!580844 res!368662) b!580848))

(assert (= (and b!580848 res!368666) b!580849))

(assert (= (and b!580849 res!368663) b!580842))

(assert (= (and b!580842 res!368660) b!580847))

(assert (= (and b!580847 res!368665) b!580850))

(declare-fun m!559407 () Bool)

(assert (=> b!580842 m!559407))

(declare-fun m!559409 () Bool)

(assert (=> b!580845 m!559409))

(declare-fun m!559411 () Bool)

(assert (=> b!580848 m!559411))

(declare-fun m!559413 () Bool)

(assert (=> b!580847 m!559413))

(declare-fun m!559415 () Bool)

(assert (=> b!580847 m!559415))

(declare-fun m!559417 () Bool)

(assert (=> b!580847 m!559417))

(declare-fun m!559419 () Bool)

(assert (=> start!53394 m!559419))

(declare-fun m!559421 () Bool)

(assert (=> start!53394 m!559421))

(declare-fun m!559423 () Bool)

(assert (=> b!580844 m!559423))

(declare-fun m!559425 () Bool)

(assert (=> b!580849 m!559425))

(declare-fun m!559427 () Bool)

(assert (=> b!580843 m!559427))

(assert (=> b!580843 m!559427))

(declare-fun m!559429 () Bool)

(assert (=> b!580843 m!559429))

(assert (=> b!580850 m!559427))

(assert (=> b!580850 m!559427))

(declare-fun m!559431 () Bool)

(assert (=> b!580850 m!559431))

(check-sat (not b!580848) (not b!580845) (not b!580849) (not b!580850) (not start!53394) (not b!580842) (not b!580844) (not b!580843))
(check-sat)
