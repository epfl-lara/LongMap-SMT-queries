; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53352 () Bool)

(assert start!53352)

(declare-fun b!579791 () Bool)

(declare-fun res!367508 () Bool)

(declare-fun e!333179 () Bool)

(assert (=> b!579791 (=> (not res!367508) (not e!333179))))

(declare-datatypes ((array!36198 0))(
  ( (array!36199 (arr!17371 (Array (_ BitVec 32) (_ BitVec 64))) (size!17735 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36198)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36198 (_ BitVec 32)) Bool)

(assert (=> b!579791 (= res!367508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579792 () Bool)

(declare-fun res!367506 () Bool)

(declare-fun e!333180 () Bool)

(assert (=> b!579792 (=> (not res!367506) (not e!333180))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579792 (= res!367506 (validKeyInArray!0 (select (arr!17371 a!2986) j!136)))))

(declare-fun b!579793 () Bool)

(assert (=> b!579793 (= e!333180 e!333179)))

(declare-fun res!367509 () Bool)

(assert (=> b!579793 (=> (not res!367509) (not e!333179))))

(declare-datatypes ((SeekEntryResult!5767 0))(
  ( (MissingZero!5767 (index!25295 (_ BitVec 32))) (Found!5767 (index!25296 (_ BitVec 32))) (Intermediate!5767 (undefined!6579 Bool) (index!25297 (_ BitVec 32)) (x!54335 (_ BitVec 32))) (Undefined!5767) (MissingVacant!5767 (index!25298 (_ BitVec 32))) )
))
(declare-fun lt!264628 () SeekEntryResult!5767)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579793 (= res!367509 (or (= lt!264628 (MissingZero!5767 i!1108)) (= lt!264628 (MissingVacant!5767 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36198 (_ BitVec 32)) SeekEntryResult!5767)

(assert (=> b!579793 (= lt!264628 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579794 () Bool)

(declare-fun res!367503 () Bool)

(assert (=> b!579794 (=> (not res!367503) (not e!333180))))

(declare-fun arrayContainsKey!0 (array!36198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579794 (= res!367503 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579796 () Bool)

(assert (=> b!579796 (= e!333179 false)))

(declare-fun lt!264627 () SeekEntryResult!5767)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36198 (_ BitVec 32)) SeekEntryResult!5767)

(assert (=> b!579796 (= lt!264627 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17371 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579797 () Bool)

(declare-fun res!367502 () Bool)

(assert (=> b!579797 (=> (not res!367502) (not e!333180))))

(assert (=> b!579797 (= res!367502 (and (= (size!17735 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17735 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17735 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579798 () Bool)

(declare-fun res!367505 () Bool)

(assert (=> b!579798 (=> (not res!367505) (not e!333179))))

(declare-datatypes ((List!11319 0))(
  ( (Nil!11316) (Cons!11315 (h!12363 (_ BitVec 64)) (t!17539 List!11319)) )
))
(declare-fun arrayNoDuplicates!0 (array!36198 (_ BitVec 32) List!11319) Bool)

(assert (=> b!579798 (= res!367505 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11316))))

(declare-fun b!579799 () Bool)

(declare-fun res!367504 () Bool)

(assert (=> b!579799 (=> (not res!367504) (not e!333180))))

(assert (=> b!579799 (= res!367504 (validKeyInArray!0 k0!1786))))

(declare-fun res!367507 () Bool)

(assert (=> start!53352 (=> (not res!367507) (not e!333180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53352 (= res!367507 (validMask!0 mask!3053))))

(assert (=> start!53352 e!333180))

(assert (=> start!53352 true))

(declare-fun array_inv!13230 (array!36198) Bool)

(assert (=> start!53352 (array_inv!13230 a!2986)))

(declare-fun b!579795 () Bool)

(declare-fun res!367510 () Bool)

(assert (=> b!579795 (=> (not res!367510) (not e!333179))))

(assert (=> b!579795 (= res!367510 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17371 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17371 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53352 res!367507) b!579797))

(assert (= (and b!579797 res!367502) b!579792))

(assert (= (and b!579792 res!367506) b!579799))

(assert (= (and b!579799 res!367504) b!579794))

(assert (= (and b!579794 res!367503) b!579793))

(assert (= (and b!579793 res!367509) b!579791))

(assert (= (and b!579791 res!367508) b!579798))

(assert (= (and b!579798 res!367505) b!579795))

(assert (= (and b!579795 res!367510) b!579796))

(declare-fun m!558557 () Bool)

(assert (=> b!579792 m!558557))

(assert (=> b!579792 m!558557))

(declare-fun m!558559 () Bool)

(assert (=> b!579792 m!558559))

(declare-fun m!558561 () Bool)

(assert (=> start!53352 m!558561))

(declare-fun m!558563 () Bool)

(assert (=> start!53352 m!558563))

(declare-fun m!558565 () Bool)

(assert (=> b!579798 m!558565))

(declare-fun m!558567 () Bool)

(assert (=> b!579791 m!558567))

(declare-fun m!558569 () Bool)

(assert (=> b!579793 m!558569))

(declare-fun m!558571 () Bool)

(assert (=> b!579794 m!558571))

(assert (=> b!579796 m!558557))

(assert (=> b!579796 m!558557))

(declare-fun m!558573 () Bool)

(assert (=> b!579796 m!558573))

(declare-fun m!558575 () Bool)

(assert (=> b!579795 m!558575))

(declare-fun m!558577 () Bool)

(assert (=> b!579795 m!558577))

(declare-fun m!558579 () Bool)

(assert (=> b!579795 m!558579))

(declare-fun m!558581 () Bool)

(assert (=> b!579799 m!558581))

(check-sat (not b!579798) (not b!579796) (not b!579794) (not b!579793) (not b!579799) (not b!579791) (not start!53352) (not b!579792))
(check-sat)
