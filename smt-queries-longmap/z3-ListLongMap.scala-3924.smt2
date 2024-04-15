; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53538 () Bool)

(assert start!53538)

(declare-fun b!582758 () Bool)

(declare-fun res!370716 () Bool)

(declare-fun e!334009 () Bool)

(assert (=> b!582758 (=> (not res!370716) (not e!334009))))

(declare-datatypes ((array!36453 0))(
  ( (array!36454 (arr!17501 (Array (_ BitVec 32) (_ BitVec 64))) (size!17866 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36453)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36453 (_ BitVec 32)) Bool)

(assert (=> b!582758 (= res!370716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582759 () Bool)

(declare-fun res!370723 () Bool)

(declare-fun e!334010 () Bool)

(assert (=> b!582759 (=> (not res!370723) (not e!334010))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582759 (= res!370723 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!370721 () Bool)

(assert (=> start!53538 (=> (not res!370721) (not e!334010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53538 (= res!370721 (validMask!0 mask!3053))))

(assert (=> start!53538 e!334010))

(assert (=> start!53538 true))

(declare-fun array_inv!13384 (array!36453) Bool)

(assert (=> start!53538 (array_inv!13384 a!2986)))

(declare-fun b!582760 () Bool)

(declare-fun res!370718 () Bool)

(assert (=> b!582760 (=> (not res!370718) (not e!334010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582760 (= res!370718 (validKeyInArray!0 k0!1786))))

(declare-fun b!582761 () Bool)

(declare-fun res!370722 () Bool)

(assert (=> b!582761 (=> (not res!370722) (not e!334010))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582761 (= res!370722 (and (= (size!17866 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17866 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17866 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582762 () Bool)

(declare-fun res!370724 () Bool)

(assert (=> b!582762 (=> (not res!370724) (not e!334009))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582762 (= res!370724 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17501 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17501 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582763 () Bool)

(assert (=> b!582763 (= e!334009 false)))

(declare-datatypes ((SeekEntryResult!5938 0))(
  ( (MissingZero!5938 (index!25979 (_ BitVec 32))) (Found!5938 (index!25980 (_ BitVec 32))) (Intermediate!5938 (undefined!6750 Bool) (index!25981 (_ BitVec 32)) (x!54834 (_ BitVec 32))) (Undefined!5938) (MissingVacant!5938 (index!25982 (_ BitVec 32))) )
))
(declare-fun lt!265011 () SeekEntryResult!5938)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36453 (_ BitVec 32)) SeekEntryResult!5938)

(assert (=> b!582763 (= lt!265011 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17501 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582764 () Bool)

(assert (=> b!582764 (= e!334010 e!334009)))

(declare-fun res!370717 () Bool)

(assert (=> b!582764 (=> (not res!370717) (not e!334009))))

(declare-fun lt!265012 () SeekEntryResult!5938)

(assert (=> b!582764 (= res!370717 (or (= lt!265012 (MissingZero!5938 i!1108)) (= lt!265012 (MissingVacant!5938 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36453 (_ BitVec 32)) SeekEntryResult!5938)

(assert (=> b!582764 (= lt!265012 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582765 () Bool)

(declare-fun res!370719 () Bool)

(assert (=> b!582765 (=> (not res!370719) (not e!334009))))

(declare-datatypes ((List!11581 0))(
  ( (Nil!11578) (Cons!11577 (h!12622 (_ BitVec 64)) (t!17800 List!11581)) )
))
(declare-fun arrayNoDuplicates!0 (array!36453 (_ BitVec 32) List!11581) Bool)

(assert (=> b!582765 (= res!370719 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11578))))

(declare-fun b!582766 () Bool)

(declare-fun res!370720 () Bool)

(assert (=> b!582766 (=> (not res!370720) (not e!334010))))

(assert (=> b!582766 (= res!370720 (validKeyInArray!0 (select (arr!17501 a!2986) j!136)))))

(assert (= (and start!53538 res!370721) b!582761))

(assert (= (and b!582761 res!370722) b!582766))

(assert (= (and b!582766 res!370720) b!582760))

(assert (= (and b!582760 res!370718) b!582759))

(assert (= (and b!582759 res!370723) b!582764))

(assert (= (and b!582764 res!370717) b!582758))

(assert (= (and b!582758 res!370716) b!582765))

(assert (= (and b!582765 res!370719) b!582762))

(assert (= (and b!582762 res!370724) b!582763))

(declare-fun m!560725 () Bool)

(assert (=> b!582762 m!560725))

(declare-fun m!560727 () Bool)

(assert (=> b!582762 m!560727))

(declare-fun m!560729 () Bool)

(assert (=> b!582762 m!560729))

(declare-fun m!560731 () Bool)

(assert (=> start!53538 m!560731))

(declare-fun m!560733 () Bool)

(assert (=> start!53538 m!560733))

(declare-fun m!560735 () Bool)

(assert (=> b!582760 m!560735))

(declare-fun m!560737 () Bool)

(assert (=> b!582765 m!560737))

(declare-fun m!560739 () Bool)

(assert (=> b!582759 m!560739))

(declare-fun m!560741 () Bool)

(assert (=> b!582766 m!560741))

(assert (=> b!582766 m!560741))

(declare-fun m!560743 () Bool)

(assert (=> b!582766 m!560743))

(declare-fun m!560745 () Bool)

(assert (=> b!582764 m!560745))

(declare-fun m!560747 () Bool)

(assert (=> b!582758 m!560747))

(assert (=> b!582763 m!560741))

(assert (=> b!582763 m!560741))

(declare-fun m!560749 () Bool)

(assert (=> b!582763 m!560749))

(check-sat (not b!582758) (not b!582765) (not b!582760) (not b!582766) (not b!582764) (not b!582759) (not start!53538) (not b!582763))
(check-sat)
