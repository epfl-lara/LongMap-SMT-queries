; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69384 () Bool)

(assert start!69384)

(declare-fun b!808996 () Bool)

(declare-fun res!552867 () Bool)

(declare-fun e!447807 () Bool)

(assert (=> b!808996 (=> (not res!552867) (not e!447807))))

(declare-datatypes ((array!43999 0))(
  ( (array!44000 (arr!21074 (Array (_ BitVec 32) (_ BitVec 64))) (size!21495 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43999)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808996 (= res!552867 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808997 () Bool)

(declare-fun res!552866 () Bool)

(assert (=> b!808997 (=> (not res!552866) (not e!447807))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!808997 (= res!552866 (and (= (size!21495 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21495 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21495 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808998 () Bool)

(declare-fun e!447806 () Bool)

(declare-fun e!447804 () Bool)

(assert (=> b!808998 (= e!447806 e!447804)))

(declare-fun res!552864 () Bool)

(assert (=> b!808998 (=> (not res!552864) (not e!447804))))

(declare-datatypes ((SeekEntryResult!8662 0))(
  ( (MissingZero!8662 (index!37016 (_ BitVec 32))) (Found!8662 (index!37017 (_ BitVec 32))) (Intermediate!8662 (undefined!9474 Bool) (index!37018 (_ BitVec 32)) (x!67833 (_ BitVec 32))) (Undefined!8662) (MissingVacant!8662 (index!37019 (_ BitVec 32))) )
))
(declare-fun lt!362401 () SeekEntryResult!8662)

(declare-fun lt!362402 () SeekEntryResult!8662)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808998 (= res!552864 (and (= lt!362401 lt!362402) (= lt!362402 (Found!8662 j!153)) (not (= (select (arr!21074 a!3170) index!1236) (select (arr!21074 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43999 (_ BitVec 32)) SeekEntryResult!8662)

(assert (=> b!808998 (= lt!362402 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21074 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43999 (_ BitVec 32)) SeekEntryResult!8662)

(assert (=> b!808998 (= lt!362401 (seekEntryOrOpen!0 (select (arr!21074 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808999 () Bool)

(declare-fun e!447808 () Bool)

(assert (=> b!808999 (= e!447807 e!447808)))

(declare-fun res!552869 () Bool)

(assert (=> b!808999 (=> (not res!552869) (not e!447808))))

(declare-fun lt!362405 () SeekEntryResult!8662)

(assert (=> b!808999 (= res!552869 (or (= lt!362405 (MissingZero!8662 i!1163)) (= lt!362405 (MissingVacant!8662 i!1163))))))

(assert (=> b!808999 (= lt!362405 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!552870 () Bool)

(assert (=> start!69384 (=> (not res!552870) (not e!447807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69384 (= res!552870 (validMask!0 mask!3266))))

(assert (=> start!69384 e!447807))

(assert (=> start!69384 true))

(declare-fun array_inv!16957 (array!43999) Bool)

(assert (=> start!69384 (array_inv!16957 a!3170)))

(declare-fun b!809000 () Bool)

(declare-fun res!552873 () Bool)

(assert (=> b!809000 (=> (not res!552873) (not e!447808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43999 (_ BitVec 32)) Bool)

(assert (=> b!809000 (= res!552873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809001 () Bool)

(declare-fun res!552872 () Bool)

(assert (=> b!809001 (=> (not res!552872) (not e!447807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809001 (= res!552872 (validKeyInArray!0 (select (arr!21074 a!3170) j!153)))))

(declare-fun b!809002 () Bool)

(declare-fun res!552865 () Bool)

(assert (=> b!809002 (=> (not res!552865) (not e!447808))))

(declare-datatypes ((List!15076 0))(
  ( (Nil!15073) (Cons!15072 (h!16201 (_ BitVec 64)) (t!21382 List!15076)) )
))
(declare-fun arrayNoDuplicates!0 (array!43999 (_ BitVec 32) List!15076) Bool)

(assert (=> b!809002 (= res!552865 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15073))))

(declare-fun b!809003 () Bool)

(declare-fun res!552871 () Bool)

(assert (=> b!809003 (=> (not res!552871) (not e!447808))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!809003 (= res!552871 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21495 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21074 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21495 a!3170)) (= (select (arr!21074 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809004 () Bool)

(assert (=> b!809004 (= e!447808 e!447806)))

(declare-fun res!552863 () Bool)

(assert (=> b!809004 (=> (not res!552863) (not e!447806))))

(declare-fun lt!362404 () array!43999)

(declare-fun lt!362403 () (_ BitVec 64))

(assert (=> b!809004 (= res!552863 (= (seekEntryOrOpen!0 lt!362403 lt!362404 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362403 lt!362404 mask!3266)))))

(assert (=> b!809004 (= lt!362403 (select (store (arr!21074 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809004 (= lt!362404 (array!44000 (store (arr!21074 a!3170) i!1163 k0!2044) (size!21495 a!3170)))))

(declare-fun b!809005 () Bool)

(assert (=> b!809005 (= e!447804 false)))

(declare-fun lt!362400 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809005 (= lt!362400 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809006 () Bool)

(declare-fun res!552868 () Bool)

(assert (=> b!809006 (=> (not res!552868) (not e!447807))))

(assert (=> b!809006 (= res!552868 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69384 res!552870) b!808997))

(assert (= (and b!808997 res!552866) b!809001))

(assert (= (and b!809001 res!552872) b!809006))

(assert (= (and b!809006 res!552868) b!808996))

(assert (= (and b!808996 res!552867) b!808999))

(assert (= (and b!808999 res!552869) b!809000))

(assert (= (and b!809000 res!552873) b!809002))

(assert (= (and b!809002 res!552865) b!809003))

(assert (= (and b!809003 res!552871) b!809004))

(assert (= (and b!809004 res!552863) b!808998))

(assert (= (and b!808998 res!552864) b!809005))

(declare-fun m!750667 () Bool)

(assert (=> b!809001 m!750667))

(assert (=> b!809001 m!750667))

(declare-fun m!750669 () Bool)

(assert (=> b!809001 m!750669))

(declare-fun m!750671 () Bool)

(assert (=> b!809002 m!750671))

(declare-fun m!750673 () Bool)

(assert (=> b!809005 m!750673))

(declare-fun m!750675 () Bool)

(assert (=> b!809000 m!750675))

(declare-fun m!750677 () Bool)

(assert (=> b!808998 m!750677))

(assert (=> b!808998 m!750667))

(assert (=> b!808998 m!750667))

(declare-fun m!750679 () Bool)

(assert (=> b!808998 m!750679))

(assert (=> b!808998 m!750667))

(declare-fun m!750681 () Bool)

(assert (=> b!808998 m!750681))

(declare-fun m!750683 () Bool)

(assert (=> b!808996 m!750683))

(declare-fun m!750685 () Bool)

(assert (=> b!809006 m!750685))

(declare-fun m!750687 () Bool)

(assert (=> b!809004 m!750687))

(declare-fun m!750689 () Bool)

(assert (=> b!809004 m!750689))

(declare-fun m!750691 () Bool)

(assert (=> b!809004 m!750691))

(declare-fun m!750693 () Bool)

(assert (=> b!809004 m!750693))

(declare-fun m!750695 () Bool)

(assert (=> b!809003 m!750695))

(declare-fun m!750697 () Bool)

(assert (=> b!809003 m!750697))

(declare-fun m!750699 () Bool)

(assert (=> start!69384 m!750699))

(declare-fun m!750701 () Bool)

(assert (=> start!69384 m!750701))

(declare-fun m!750703 () Bool)

(assert (=> b!808999 m!750703))

(check-sat (not b!809005) (not b!809001) (not b!809006) (not b!808996) (not b!809004) (not start!69384) (not b!809002) (not b!808998) (not b!809000) (not b!808999))
(check-sat)
