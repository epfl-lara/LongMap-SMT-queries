; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53574 () Bool)

(assert start!53574)

(declare-fun res!370543 () Bool)

(declare-fun e!334177 () Bool)

(assert (=> start!53574 (=> (not res!370543) (not e!334177))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53574 (= res!370543 (validMask!0 mask!3053))))

(assert (=> start!53574 e!334177))

(assert (=> start!53574 true))

(declare-datatypes ((array!36420 0))(
  ( (array!36421 (arr!17482 (Array (_ BitVec 32) (_ BitVec 64))) (size!17846 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36420)

(declare-fun array_inv!13341 (array!36420) Bool)

(assert (=> start!53574 (array_inv!13341 a!2986)))

(declare-fun b!582824 () Bool)

(declare-fun res!370540 () Bool)

(declare-fun e!334178 () Bool)

(assert (=> b!582824 (=> (not res!370540) (not e!334178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36420 (_ BitVec 32)) Bool)

(assert (=> b!582824 (= res!370540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582825 () Bool)

(declare-fun res!370541 () Bool)

(assert (=> b!582825 (=> (not res!370541) (not e!334177))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582825 (= res!370541 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582826 () Bool)

(declare-fun res!370537 () Bool)

(assert (=> b!582826 (=> (not res!370537) (not e!334177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582826 (= res!370537 (validKeyInArray!0 k0!1786))))

(declare-fun b!582827 () Bool)

(assert (=> b!582827 (= e!334177 e!334178)))

(declare-fun res!370539 () Bool)

(assert (=> b!582827 (=> (not res!370539) (not e!334178))))

(declare-datatypes ((SeekEntryResult!5878 0))(
  ( (MissingZero!5878 (index!25739 (_ BitVec 32))) (Found!5878 (index!25740 (_ BitVec 32))) (Intermediate!5878 (undefined!6690 Bool) (index!25741 (_ BitVec 32)) (x!54742 (_ BitVec 32))) (Undefined!5878) (MissingVacant!5878 (index!25742 (_ BitVec 32))) )
))
(declare-fun lt!265267 () SeekEntryResult!5878)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582827 (= res!370539 (or (= lt!265267 (MissingZero!5878 i!1108)) (= lt!265267 (MissingVacant!5878 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36420 (_ BitVec 32)) SeekEntryResult!5878)

(assert (=> b!582827 (= lt!265267 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582828 () Bool)

(declare-fun res!370536 () Bool)

(assert (=> b!582828 (=> (not res!370536) (not e!334177))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582828 (= res!370536 (validKeyInArray!0 (select (arr!17482 a!2986) j!136)))))

(declare-fun b!582829 () Bool)

(declare-fun res!370538 () Bool)

(assert (=> b!582829 (=> (not res!370538) (not e!334178))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582829 (= res!370538 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17482 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17482 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582830 () Bool)

(declare-fun res!370535 () Bool)

(assert (=> b!582830 (=> (not res!370535) (not e!334177))))

(assert (=> b!582830 (= res!370535 (and (= (size!17846 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17846 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17846 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582831 () Bool)

(declare-fun res!370542 () Bool)

(assert (=> b!582831 (=> (not res!370542) (not e!334178))))

(declare-datatypes ((List!11430 0))(
  ( (Nil!11427) (Cons!11426 (h!12474 (_ BitVec 64)) (t!17650 List!11430)) )
))
(declare-fun arrayNoDuplicates!0 (array!36420 (_ BitVec 32) List!11430) Bool)

(assert (=> b!582831 (= res!370542 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11427))))

(declare-fun b!582832 () Bool)

(assert (=> b!582832 (= e!334178 false)))

(declare-fun lt!265266 () SeekEntryResult!5878)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36420 (_ BitVec 32)) SeekEntryResult!5878)

(assert (=> b!582832 (= lt!265266 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17482 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53574 res!370543) b!582830))

(assert (= (and b!582830 res!370535) b!582828))

(assert (= (and b!582828 res!370536) b!582826))

(assert (= (and b!582826 res!370537) b!582825))

(assert (= (and b!582825 res!370541) b!582827))

(assert (= (and b!582827 res!370539) b!582824))

(assert (= (and b!582824 res!370540) b!582831))

(assert (= (and b!582831 res!370542) b!582829))

(assert (= (and b!582829 res!370538) b!582832))

(declare-fun m!561473 () Bool)

(assert (=> start!53574 m!561473))

(declare-fun m!561475 () Bool)

(assert (=> start!53574 m!561475))

(declare-fun m!561477 () Bool)

(assert (=> b!582831 m!561477))

(declare-fun m!561479 () Bool)

(assert (=> b!582828 m!561479))

(assert (=> b!582828 m!561479))

(declare-fun m!561481 () Bool)

(assert (=> b!582828 m!561481))

(assert (=> b!582832 m!561479))

(assert (=> b!582832 m!561479))

(declare-fun m!561483 () Bool)

(assert (=> b!582832 m!561483))

(declare-fun m!561485 () Bool)

(assert (=> b!582829 m!561485))

(declare-fun m!561487 () Bool)

(assert (=> b!582829 m!561487))

(declare-fun m!561489 () Bool)

(assert (=> b!582829 m!561489))

(declare-fun m!561491 () Bool)

(assert (=> b!582825 m!561491))

(declare-fun m!561493 () Bool)

(assert (=> b!582826 m!561493))

(declare-fun m!561495 () Bool)

(assert (=> b!582824 m!561495))

(declare-fun m!561497 () Bool)

(assert (=> b!582827 m!561497))

(check-sat (not b!582832) (not b!582826) (not b!582827) (not start!53574) (not b!582828) (not b!582825) (not b!582824) (not b!582831))
(check-sat)
