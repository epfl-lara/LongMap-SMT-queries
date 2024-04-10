; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53322 () Bool)

(assert start!53322)

(declare-fun res!367685 () Bool)

(declare-fun e!333140 () Bool)

(assert (=> start!53322 (=> (not res!367685) (not e!333140))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53322 (= res!367685 (validMask!0 mask!3053))))

(assert (=> start!53322 e!333140))

(assert (=> start!53322 true))

(declare-datatypes ((array!36223 0))(
  ( (array!36224 (arr!17386 (Array (_ BitVec 32) (_ BitVec 64))) (size!17750 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36223)

(declare-fun array_inv!13182 (array!36223) Bool)

(assert (=> start!53322 (array_inv!13182 a!2986)))

(declare-fun b!579861 () Bool)

(declare-fun res!367683 () Bool)

(assert (=> b!579861 (=> (not res!367683) (not e!333140))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579861 (= res!367683 (validKeyInArray!0 (select (arr!17386 a!2986) j!136)))))

(declare-fun b!579862 () Bool)

(declare-fun res!367680 () Bool)

(assert (=> b!579862 (=> (not res!367680) (not e!333140))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579862 (= res!367680 (and (= (size!17750 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17750 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17750 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579863 () Bool)

(declare-fun res!367684 () Bool)

(declare-fun e!333141 () Bool)

(assert (=> b!579863 (=> (not res!367684) (not e!333141))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579863 (= res!367684 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17386 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17386 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579864 () Bool)

(declare-fun res!367681 () Bool)

(assert (=> b!579864 (=> (not res!367681) (not e!333140))))

(declare-fun arrayContainsKey!0 (array!36223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579864 (= res!367681 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579865 () Bool)

(declare-fun res!367678 () Bool)

(assert (=> b!579865 (=> (not res!367678) (not e!333140))))

(assert (=> b!579865 (= res!367678 (validKeyInArray!0 k0!1786))))

(declare-fun b!579866 () Bool)

(assert (=> b!579866 (= e!333141 false)))

(declare-datatypes ((SeekEntryResult!5826 0))(
  ( (MissingZero!5826 (index!25531 (_ BitVec 32))) (Found!5826 (index!25532 (_ BitVec 32))) (Intermediate!5826 (undefined!6638 Bool) (index!25533 (_ BitVec 32)) (x!54415 (_ BitVec 32))) (Undefined!5826) (MissingVacant!5826 (index!25534 (_ BitVec 32))) )
))
(declare-fun lt!264576 () SeekEntryResult!5826)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36223 (_ BitVec 32)) SeekEntryResult!5826)

(assert (=> b!579866 (= lt!264576 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17386 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579867 () Bool)

(declare-fun res!367677 () Bool)

(assert (=> b!579867 (=> (not res!367677) (not e!333141))))

(declare-datatypes ((List!11427 0))(
  ( (Nil!11424) (Cons!11423 (h!12468 (_ BitVec 64)) (t!17655 List!11427)) )
))
(declare-fun arrayNoDuplicates!0 (array!36223 (_ BitVec 32) List!11427) Bool)

(assert (=> b!579867 (= res!367677 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11424))))

(declare-fun b!579868 () Bool)

(assert (=> b!579868 (= e!333140 e!333141)))

(declare-fun res!367682 () Bool)

(assert (=> b!579868 (=> (not res!367682) (not e!333141))))

(declare-fun lt!264577 () SeekEntryResult!5826)

(assert (=> b!579868 (= res!367682 (or (= lt!264577 (MissingZero!5826 i!1108)) (= lt!264577 (MissingVacant!5826 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36223 (_ BitVec 32)) SeekEntryResult!5826)

(assert (=> b!579868 (= lt!264577 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579869 () Bool)

(declare-fun res!367679 () Bool)

(assert (=> b!579869 (=> (not res!367679) (not e!333141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36223 (_ BitVec 32)) Bool)

(assert (=> b!579869 (= res!367679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53322 res!367685) b!579862))

(assert (= (and b!579862 res!367680) b!579861))

(assert (= (and b!579861 res!367683) b!579865))

(assert (= (and b!579865 res!367678) b!579864))

(assert (= (and b!579864 res!367681) b!579868))

(assert (= (and b!579868 res!367682) b!579869))

(assert (= (and b!579869 res!367679) b!579867))

(assert (= (and b!579867 res!367677) b!579863))

(assert (= (and b!579863 res!367684) b!579866))

(declare-fun m!558465 () Bool)

(assert (=> b!579868 m!558465))

(declare-fun m!558467 () Bool)

(assert (=> b!579866 m!558467))

(assert (=> b!579866 m!558467))

(declare-fun m!558469 () Bool)

(assert (=> b!579866 m!558469))

(declare-fun m!558471 () Bool)

(assert (=> b!579864 m!558471))

(declare-fun m!558473 () Bool)

(assert (=> b!579869 m!558473))

(declare-fun m!558475 () Bool)

(assert (=> b!579867 m!558475))

(declare-fun m!558477 () Bool)

(assert (=> b!579863 m!558477))

(declare-fun m!558479 () Bool)

(assert (=> b!579863 m!558479))

(declare-fun m!558481 () Bool)

(assert (=> b!579863 m!558481))

(declare-fun m!558483 () Bool)

(assert (=> start!53322 m!558483))

(declare-fun m!558485 () Bool)

(assert (=> start!53322 m!558485))

(assert (=> b!579861 m!558467))

(assert (=> b!579861 m!558467))

(declare-fun m!558487 () Bool)

(assert (=> b!579861 m!558487))

(declare-fun m!558489 () Bool)

(assert (=> b!579865 m!558489))

(check-sat (not b!579867) (not b!579865) (not b!579861) (not b!579868) (not b!579866) (not b!579864) (not b!579869) (not start!53322))
(check-sat)
