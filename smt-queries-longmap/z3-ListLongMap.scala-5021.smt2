; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68638 () Bool)

(assert start!68638)

(declare-fun b!798780 () Bool)

(declare-fun res!543302 () Bool)

(declare-fun e!443028 () Bool)

(assert (=> b!798780 (=> (not res!543302) (not e!443028))))

(declare-datatypes ((array!43428 0))(
  ( (array!43429 (arr!20794 (Array (_ BitVec 32) (_ BitVec 64))) (size!21215 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43428)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798780 (= res!543302 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!543305 () Bool)

(assert (=> start!68638 (=> (not res!543305) (not e!443028))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68638 (= res!543305 (validMask!0 mask!3266))))

(assert (=> start!68638 e!443028))

(assert (=> start!68638 true))

(declare-fun array_inv!16590 (array!43428) Bool)

(assert (=> start!68638 (array_inv!16590 a!3170)))

(declare-fun b!798781 () Bool)

(declare-fun e!443027 () Bool)

(assert (=> b!798781 (= e!443028 e!443027)))

(declare-fun res!543306 () Bool)

(assert (=> b!798781 (=> (not res!543306) (not e!443027))))

(declare-datatypes ((SeekEntryResult!8385 0))(
  ( (MissingZero!8385 (index!35908 (_ BitVec 32))) (Found!8385 (index!35909 (_ BitVec 32))) (Intermediate!8385 (undefined!9197 Bool) (index!35910 (_ BitVec 32)) (x!66791 (_ BitVec 32))) (Undefined!8385) (MissingVacant!8385 (index!35911 (_ BitVec 32))) )
))
(declare-fun lt!356591 () SeekEntryResult!8385)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798781 (= res!543306 (or (= lt!356591 (MissingZero!8385 i!1163)) (= lt!356591 (MissingVacant!8385 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43428 (_ BitVec 32)) SeekEntryResult!8385)

(assert (=> b!798781 (= lt!356591 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798782 () Bool)

(declare-fun res!543304 () Bool)

(assert (=> b!798782 (=> (not res!543304) (not e!443028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798782 (= res!543304 (validKeyInArray!0 k0!2044))))

(declare-fun b!798783 () Bool)

(declare-fun res!543299 () Bool)

(assert (=> b!798783 (=> (not res!543299) (not e!443027))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798783 (= res!543299 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21215 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20794 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21215 a!3170)) (= (select (arr!20794 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798784 () Bool)

(declare-fun res!543301 () Bool)

(assert (=> b!798784 (=> (not res!543301) (not e!443028))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798784 (= res!543301 (and (= (size!21215 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21215 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21215 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798785 () Bool)

(declare-fun res!543300 () Bool)

(assert (=> b!798785 (=> (not res!543300) (not e!443027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43428 (_ BitVec 32)) Bool)

(assert (=> b!798785 (= res!543300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798786 () Bool)

(declare-fun e!443030 () Bool)

(assert (=> b!798786 (= e!443030 false)))

(declare-fun lt!356594 () SeekEntryResult!8385)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43428 (_ BitVec 32)) SeekEntryResult!8385)

(assert (=> b!798786 (= lt!356594 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20794 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!356590 () SeekEntryResult!8385)

(assert (=> b!798786 (= lt!356590 (seekEntryOrOpen!0 (select (arr!20794 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798787 () Bool)

(declare-fun res!543307 () Bool)

(assert (=> b!798787 (=> (not res!543307) (not e!443027))))

(declare-datatypes ((List!14757 0))(
  ( (Nil!14754) (Cons!14753 (h!15882 (_ BitVec 64)) (t!21072 List!14757)) )
))
(declare-fun arrayNoDuplicates!0 (array!43428 (_ BitVec 32) List!14757) Bool)

(assert (=> b!798787 (= res!543307 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14754))))

(declare-fun b!798788 () Bool)

(assert (=> b!798788 (= e!443027 e!443030)))

(declare-fun res!543303 () Bool)

(assert (=> b!798788 (=> (not res!543303) (not e!443030))))

(declare-fun lt!356592 () (_ BitVec 64))

(declare-fun lt!356593 () array!43428)

(assert (=> b!798788 (= res!543303 (= (seekEntryOrOpen!0 lt!356592 lt!356593 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356592 lt!356593 mask!3266)))))

(assert (=> b!798788 (= lt!356592 (select (store (arr!20794 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798788 (= lt!356593 (array!43429 (store (arr!20794 a!3170) i!1163 k0!2044) (size!21215 a!3170)))))

(declare-fun b!798789 () Bool)

(declare-fun res!543308 () Bool)

(assert (=> b!798789 (=> (not res!543308) (not e!443028))))

(assert (=> b!798789 (= res!543308 (validKeyInArray!0 (select (arr!20794 a!3170) j!153)))))

(assert (= (and start!68638 res!543305) b!798784))

(assert (= (and b!798784 res!543301) b!798789))

(assert (= (and b!798789 res!543308) b!798782))

(assert (= (and b!798782 res!543304) b!798780))

(assert (= (and b!798780 res!543302) b!798781))

(assert (= (and b!798781 res!543306) b!798785))

(assert (= (and b!798785 res!543300) b!798787))

(assert (= (and b!798787 res!543307) b!798783))

(assert (= (and b!798783 res!543299) b!798788))

(assert (= (and b!798788 res!543303) b!798786))

(declare-fun m!739743 () Bool)

(assert (=> b!798789 m!739743))

(assert (=> b!798789 m!739743))

(declare-fun m!739745 () Bool)

(assert (=> b!798789 m!739745))

(declare-fun m!739747 () Bool)

(assert (=> b!798781 m!739747))

(declare-fun m!739749 () Bool)

(assert (=> b!798780 m!739749))

(assert (=> b!798786 m!739743))

(assert (=> b!798786 m!739743))

(declare-fun m!739751 () Bool)

(assert (=> b!798786 m!739751))

(assert (=> b!798786 m!739743))

(declare-fun m!739753 () Bool)

(assert (=> b!798786 m!739753))

(declare-fun m!739755 () Bool)

(assert (=> start!68638 m!739755))

(declare-fun m!739757 () Bool)

(assert (=> start!68638 m!739757))

(declare-fun m!739759 () Bool)

(assert (=> b!798782 m!739759))

(declare-fun m!739761 () Bool)

(assert (=> b!798783 m!739761))

(declare-fun m!739763 () Bool)

(assert (=> b!798783 m!739763))

(declare-fun m!739765 () Bool)

(assert (=> b!798787 m!739765))

(declare-fun m!739767 () Bool)

(assert (=> b!798785 m!739767))

(declare-fun m!739769 () Bool)

(assert (=> b!798788 m!739769))

(declare-fun m!739771 () Bool)

(assert (=> b!798788 m!739771))

(declare-fun m!739773 () Bool)

(assert (=> b!798788 m!739773))

(declare-fun m!739775 () Bool)

(assert (=> b!798788 m!739775))

(check-sat (not start!68638) (not b!798781) (not b!798789) (not b!798788) (not b!798785) (not b!798787) (not b!798780) (not b!798782) (not b!798786))
(check-sat)
