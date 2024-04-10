; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53454 () Bool)

(assert start!53454)

(declare-fun b!581661 () Bool)

(declare-fun e!333733 () Bool)

(declare-fun e!333734 () Bool)

(assert (=> b!581661 (= e!333733 e!333734)))

(declare-fun res!369485 () Bool)

(assert (=> b!581661 (=> (not res!369485) (not e!333734))))

(declare-datatypes ((SeekEntryResult!5892 0))(
  ( (MissingZero!5892 (index!25795 (_ BitVec 32))) (Found!5892 (index!25796 (_ BitVec 32))) (Intermediate!5892 (undefined!6704 Bool) (index!25797 (_ BitVec 32)) (x!54657 (_ BitVec 32))) (Undefined!5892) (MissingVacant!5892 (index!25798 (_ BitVec 32))) )
))
(declare-fun lt!264954 () SeekEntryResult!5892)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581661 (= res!369485 (or (= lt!264954 (MissingZero!5892 i!1108)) (= lt!264954 (MissingVacant!5892 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36355 0))(
  ( (array!36356 (arr!17452 (Array (_ BitVec 32) (_ BitVec 64))) (size!17816 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36355)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36355 (_ BitVec 32)) SeekEntryResult!5892)

(assert (=> b!581661 (= lt!264954 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!369480 () Bool)

(assert (=> start!53454 (=> (not res!369480) (not e!333733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53454 (= res!369480 (validMask!0 mask!3053))))

(assert (=> start!53454 e!333733))

(assert (=> start!53454 true))

(declare-fun array_inv!13248 (array!36355) Bool)

(assert (=> start!53454 (array_inv!13248 a!2986)))

(declare-fun b!581662 () Bool)

(assert (=> b!581662 (= e!333734 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264955 () SeekEntryResult!5892)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36355 (_ BitVec 32)) SeekEntryResult!5892)

(assert (=> b!581662 (= lt!264955 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17452 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581663 () Bool)

(declare-fun res!369479 () Bool)

(assert (=> b!581663 (=> (not res!369479) (not e!333733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581663 (= res!369479 (validKeyInArray!0 k0!1786))))

(declare-fun b!581664 () Bool)

(declare-fun res!369484 () Bool)

(assert (=> b!581664 (=> (not res!369484) (not e!333733))))

(declare-fun arrayContainsKey!0 (array!36355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581664 (= res!369484 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581665 () Bool)

(declare-fun res!369477 () Bool)

(assert (=> b!581665 (=> (not res!369477) (not e!333734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36355 (_ BitVec 32)) Bool)

(assert (=> b!581665 (= res!369477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581666 () Bool)

(declare-fun res!369482 () Bool)

(assert (=> b!581666 (=> (not res!369482) (not e!333734))))

(assert (=> b!581666 (= res!369482 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17452 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17452 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581667 () Bool)

(declare-fun res!369481 () Bool)

(assert (=> b!581667 (=> (not res!369481) (not e!333733))))

(assert (=> b!581667 (= res!369481 (validKeyInArray!0 (select (arr!17452 a!2986) j!136)))))

(declare-fun b!581668 () Bool)

(declare-fun res!369483 () Bool)

(assert (=> b!581668 (=> (not res!369483) (not e!333733))))

(assert (=> b!581668 (= res!369483 (and (= (size!17816 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17816 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17816 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581669 () Bool)

(declare-fun res!369478 () Bool)

(assert (=> b!581669 (=> (not res!369478) (not e!333734))))

(declare-datatypes ((List!11493 0))(
  ( (Nil!11490) (Cons!11489 (h!12534 (_ BitVec 64)) (t!17721 List!11493)) )
))
(declare-fun arrayNoDuplicates!0 (array!36355 (_ BitVec 32) List!11493) Bool)

(assert (=> b!581669 (= res!369478 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11490))))

(assert (= (and start!53454 res!369480) b!581668))

(assert (= (and b!581668 res!369483) b!581667))

(assert (= (and b!581667 res!369481) b!581663))

(assert (= (and b!581663 res!369479) b!581664))

(assert (= (and b!581664 res!369484) b!581661))

(assert (= (and b!581661 res!369485) b!581665))

(assert (= (and b!581665 res!369477) b!581669))

(assert (= (and b!581669 res!369478) b!581666))

(assert (= (and b!581666 res!369482) b!581662))

(declare-fun m!560193 () Bool)

(assert (=> b!581669 m!560193))

(declare-fun m!560195 () Bool)

(assert (=> b!581664 m!560195))

(declare-fun m!560197 () Bool)

(assert (=> b!581662 m!560197))

(assert (=> b!581662 m!560197))

(declare-fun m!560199 () Bool)

(assert (=> b!581662 m!560199))

(declare-fun m!560201 () Bool)

(assert (=> b!581666 m!560201))

(declare-fun m!560203 () Bool)

(assert (=> b!581666 m!560203))

(declare-fun m!560205 () Bool)

(assert (=> b!581666 m!560205))

(declare-fun m!560207 () Bool)

(assert (=> b!581663 m!560207))

(declare-fun m!560209 () Bool)

(assert (=> start!53454 m!560209))

(declare-fun m!560211 () Bool)

(assert (=> start!53454 m!560211))

(declare-fun m!560213 () Bool)

(assert (=> b!581665 m!560213))

(declare-fun m!560215 () Bool)

(assert (=> b!581661 m!560215))

(assert (=> b!581667 m!560197))

(assert (=> b!581667 m!560197))

(declare-fun m!560217 () Bool)

(assert (=> b!581667 m!560217))

(check-sat (not b!581664) (not b!581665) (not b!581669) (not b!581663) (not start!53454) (not b!581667) (not b!581661) (not b!581662))
(check-sat)
