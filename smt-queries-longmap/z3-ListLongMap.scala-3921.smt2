; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53538 () Bool)

(assert start!53538)

(declare-fun res!370631 () Bool)

(declare-fun e!334113 () Bool)

(assert (=> start!53538 (=> (not res!370631) (not e!334113))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53538 (= res!370631 (validMask!0 mask!3053))))

(assert (=> start!53538 e!334113))

(assert (=> start!53538 true))

(declare-datatypes ((array!36439 0))(
  ( (array!36440 (arr!17494 (Array (_ BitVec 32) (_ BitVec 64))) (size!17858 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36439)

(declare-fun array_inv!13290 (array!36439) Bool)

(assert (=> start!53538 (array_inv!13290 a!2986)))

(declare-fun b!582813 () Bool)

(declare-fun res!370636 () Bool)

(assert (=> b!582813 (=> (not res!370636) (not e!334113))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582813 (= res!370636 (validKeyInArray!0 k0!1786))))

(declare-fun b!582814 () Bool)

(declare-fun e!334111 () Bool)

(assert (=> b!582814 (= e!334111 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5934 0))(
  ( (MissingZero!5934 (index!25963 (_ BitVec 32))) (Found!5934 (index!25964 (_ BitVec 32))) (Intermediate!5934 (undefined!6746 Bool) (index!25965 (_ BitVec 32)) (x!54811 (_ BitVec 32))) (Undefined!5934) (MissingVacant!5934 (index!25966 (_ BitVec 32))) )
))
(declare-fun lt!265197 () SeekEntryResult!5934)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36439 (_ BitVec 32)) SeekEntryResult!5934)

(assert (=> b!582814 (= lt!265197 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17494 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582815 () Bool)

(declare-fun res!370635 () Bool)

(assert (=> b!582815 (=> (not res!370635) (not e!334113))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582815 (= res!370635 (and (= (size!17858 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17858 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17858 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582816 () Bool)

(declare-fun res!370632 () Bool)

(assert (=> b!582816 (=> (not res!370632) (not e!334111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36439 (_ BitVec 32)) Bool)

(assert (=> b!582816 (= res!370632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582817 () Bool)

(assert (=> b!582817 (= e!334113 e!334111)))

(declare-fun res!370629 () Bool)

(assert (=> b!582817 (=> (not res!370629) (not e!334111))))

(declare-fun lt!265198 () SeekEntryResult!5934)

(assert (=> b!582817 (= res!370629 (or (= lt!265198 (MissingZero!5934 i!1108)) (= lt!265198 (MissingVacant!5934 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36439 (_ BitVec 32)) SeekEntryResult!5934)

(assert (=> b!582817 (= lt!265198 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582818 () Bool)

(declare-fun res!370634 () Bool)

(assert (=> b!582818 (=> (not res!370634) (not e!334113))))

(assert (=> b!582818 (= res!370634 (validKeyInArray!0 (select (arr!17494 a!2986) j!136)))))

(declare-fun b!582819 () Bool)

(declare-fun res!370633 () Bool)

(assert (=> b!582819 (=> (not res!370633) (not e!334113))))

(declare-fun arrayContainsKey!0 (array!36439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582819 (= res!370633 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582820 () Bool)

(declare-fun res!370630 () Bool)

(assert (=> b!582820 (=> (not res!370630) (not e!334111))))

(declare-datatypes ((List!11535 0))(
  ( (Nil!11532) (Cons!11531 (h!12576 (_ BitVec 64)) (t!17763 List!11535)) )
))
(declare-fun arrayNoDuplicates!0 (array!36439 (_ BitVec 32) List!11535) Bool)

(assert (=> b!582820 (= res!370630 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11532))))

(declare-fun b!582821 () Bool)

(declare-fun res!370637 () Bool)

(assert (=> b!582821 (=> (not res!370637) (not e!334111))))

(assert (=> b!582821 (= res!370637 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17494 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17494 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53538 res!370631) b!582815))

(assert (= (and b!582815 res!370635) b!582818))

(assert (= (and b!582818 res!370634) b!582813))

(assert (= (and b!582813 res!370636) b!582819))

(assert (= (and b!582819 res!370633) b!582817))

(assert (= (and b!582817 res!370629) b!582816))

(assert (= (and b!582816 res!370632) b!582820))

(assert (= (and b!582820 res!370630) b!582821))

(assert (= (and b!582821 res!370637) b!582814))

(declare-fun m!561303 () Bool)

(assert (=> b!582819 m!561303))

(declare-fun m!561305 () Bool)

(assert (=> b!582821 m!561305))

(declare-fun m!561307 () Bool)

(assert (=> b!582821 m!561307))

(declare-fun m!561309 () Bool)

(assert (=> b!582821 m!561309))

(declare-fun m!561311 () Bool)

(assert (=> b!582818 m!561311))

(assert (=> b!582818 m!561311))

(declare-fun m!561313 () Bool)

(assert (=> b!582818 m!561313))

(declare-fun m!561315 () Bool)

(assert (=> b!582817 m!561315))

(assert (=> b!582814 m!561311))

(assert (=> b!582814 m!561311))

(declare-fun m!561317 () Bool)

(assert (=> b!582814 m!561317))

(declare-fun m!561319 () Bool)

(assert (=> b!582820 m!561319))

(declare-fun m!561321 () Bool)

(assert (=> b!582813 m!561321))

(declare-fun m!561323 () Bool)

(assert (=> start!53538 m!561323))

(declare-fun m!561325 () Bool)

(assert (=> start!53538 m!561325))

(declare-fun m!561327 () Bool)

(assert (=> b!582816 m!561327))

(check-sat (not b!582814) (not b!582818) (not b!582817) (not b!582819) (not b!582820) (not start!53538) (not b!582816) (not b!582813))
