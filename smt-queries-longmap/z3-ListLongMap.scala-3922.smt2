; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53544 () Bool)

(assert start!53544)

(declare-fun b!582894 () Bool)

(declare-fun res!370715 () Bool)

(declare-fun e!334140 () Bool)

(assert (=> b!582894 (=> (not res!370715) (not e!334140))))

(declare-datatypes ((array!36445 0))(
  ( (array!36446 (arr!17497 (Array (_ BitVec 32) (_ BitVec 64))) (size!17861 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36445)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582894 (= res!370715 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582895 () Bool)

(declare-fun res!370717 () Bool)

(assert (=> b!582895 (=> (not res!370717) (not e!334140))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582895 (= res!370717 (and (= (size!17861 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17861 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17861 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582897 () Bool)

(declare-fun res!370710 () Bool)

(declare-fun e!334138 () Bool)

(assert (=> b!582897 (=> (not res!370710) (not e!334138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36445 (_ BitVec 32)) Bool)

(assert (=> b!582897 (= res!370710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582898 () Bool)

(declare-fun res!370711 () Bool)

(assert (=> b!582898 (=> (not res!370711) (not e!334138))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582898 (= res!370711 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17497 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17497 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582899 () Bool)

(assert (=> b!582899 (= e!334138 false)))

(declare-datatypes ((SeekEntryResult!5937 0))(
  ( (MissingZero!5937 (index!25975 (_ BitVec 32))) (Found!5937 (index!25976 (_ BitVec 32))) (Intermediate!5937 (undefined!6749 Bool) (index!25977 (_ BitVec 32)) (x!54822 (_ BitVec 32))) (Undefined!5937) (MissingVacant!5937 (index!25978 (_ BitVec 32))) )
))
(declare-fun lt!265215 () SeekEntryResult!5937)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36445 (_ BitVec 32)) SeekEntryResult!5937)

(assert (=> b!582899 (= lt!265215 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17497 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582900 () Bool)

(declare-fun res!370716 () Bool)

(assert (=> b!582900 (=> (not res!370716) (not e!334138))))

(declare-datatypes ((List!11538 0))(
  ( (Nil!11535) (Cons!11534 (h!12579 (_ BitVec 64)) (t!17766 List!11538)) )
))
(declare-fun arrayNoDuplicates!0 (array!36445 (_ BitVec 32) List!11538) Bool)

(assert (=> b!582900 (= res!370716 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11535))))

(declare-fun res!370714 () Bool)

(assert (=> start!53544 (=> (not res!370714) (not e!334140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53544 (= res!370714 (validMask!0 mask!3053))))

(assert (=> start!53544 e!334140))

(assert (=> start!53544 true))

(declare-fun array_inv!13293 (array!36445) Bool)

(assert (=> start!53544 (array_inv!13293 a!2986)))

(declare-fun b!582896 () Bool)

(declare-fun res!370713 () Bool)

(assert (=> b!582896 (=> (not res!370713) (not e!334140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582896 (= res!370713 (validKeyInArray!0 k0!1786))))

(declare-fun b!582901 () Bool)

(assert (=> b!582901 (= e!334140 e!334138)))

(declare-fun res!370712 () Bool)

(assert (=> b!582901 (=> (not res!370712) (not e!334138))))

(declare-fun lt!265216 () SeekEntryResult!5937)

(assert (=> b!582901 (= res!370712 (or (= lt!265216 (MissingZero!5937 i!1108)) (= lt!265216 (MissingVacant!5937 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36445 (_ BitVec 32)) SeekEntryResult!5937)

(assert (=> b!582901 (= lt!265216 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582902 () Bool)

(declare-fun res!370718 () Bool)

(assert (=> b!582902 (=> (not res!370718) (not e!334140))))

(assert (=> b!582902 (= res!370718 (validKeyInArray!0 (select (arr!17497 a!2986) j!136)))))

(assert (= (and start!53544 res!370714) b!582895))

(assert (= (and b!582895 res!370717) b!582902))

(assert (= (and b!582902 res!370718) b!582896))

(assert (= (and b!582896 res!370713) b!582894))

(assert (= (and b!582894 res!370715) b!582901))

(assert (= (and b!582901 res!370712) b!582897))

(assert (= (and b!582897 res!370710) b!582900))

(assert (= (and b!582900 res!370716) b!582898))

(assert (= (and b!582898 res!370711) b!582899))

(declare-fun m!561381 () Bool)

(assert (=> b!582896 m!561381))

(declare-fun m!561383 () Bool)

(assert (=> b!582902 m!561383))

(assert (=> b!582902 m!561383))

(declare-fun m!561385 () Bool)

(assert (=> b!582902 m!561385))

(assert (=> b!582899 m!561383))

(assert (=> b!582899 m!561383))

(declare-fun m!561387 () Bool)

(assert (=> b!582899 m!561387))

(declare-fun m!561389 () Bool)

(assert (=> b!582900 m!561389))

(declare-fun m!561391 () Bool)

(assert (=> b!582894 m!561391))

(declare-fun m!561393 () Bool)

(assert (=> b!582897 m!561393))

(declare-fun m!561395 () Bool)

(assert (=> start!53544 m!561395))

(declare-fun m!561397 () Bool)

(assert (=> start!53544 m!561397))

(declare-fun m!561399 () Bool)

(assert (=> b!582898 m!561399))

(declare-fun m!561401 () Bool)

(assert (=> b!582898 m!561401))

(declare-fun m!561403 () Bool)

(assert (=> b!582898 m!561403))

(declare-fun m!561405 () Bool)

(assert (=> b!582901 m!561405))

(check-sat (not b!582900) (not start!53544) (not b!582901) (not b!582894) (not b!582902) (not b!582897) (not b!582899) (not b!582896))
