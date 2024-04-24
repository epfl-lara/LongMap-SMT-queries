; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69392 () Bool)

(assert start!69392)

(declare-fun b!808424 () Bool)

(declare-fun res!552009 () Bool)

(declare-fun e!447669 () Bool)

(assert (=> b!808424 (=> (not res!552009) (not e!447669))))

(declare-datatypes ((array!43924 0))(
  ( (array!43925 (arr!21034 (Array (_ BitVec 32) (_ BitVec 64))) (size!21454 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43924)

(declare-datatypes ((List!14904 0))(
  ( (Nil!14901) (Cons!14900 (h!16035 (_ BitVec 64)) (t!21211 List!14904)) )
))
(declare-fun arrayNoDuplicates!0 (array!43924 (_ BitVec 32) List!14904) Bool)

(assert (=> b!808424 (= res!552009 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14901))))

(declare-fun b!808425 () Bool)

(declare-fun res!552003 () Bool)

(declare-fun e!447666 () Bool)

(assert (=> b!808425 (=> (not res!552003) (not e!447666))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808425 (= res!552003 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808426 () Bool)

(assert (=> b!808426 (= e!447666 e!447669)))

(declare-fun res!552007 () Bool)

(assert (=> b!808426 (=> (not res!552007) (not e!447669))))

(declare-datatypes ((SeekEntryResult!8581 0))(
  ( (MissingZero!8581 (index!36692 (_ BitVec 32))) (Found!8581 (index!36693 (_ BitVec 32))) (Intermediate!8581 (undefined!9393 Bool) (index!36694 (_ BitVec 32)) (x!67663 (_ BitVec 32))) (Undefined!8581) (MissingVacant!8581 (index!36695 (_ BitVec 32))) )
))
(declare-fun lt!362144 () SeekEntryResult!8581)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808426 (= res!552007 (or (= lt!362144 (MissingZero!8581 i!1163)) (= lt!362144 (MissingVacant!8581 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43924 (_ BitVec 32)) SeekEntryResult!8581)

(assert (=> b!808426 (= lt!362144 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808427 () Bool)

(declare-fun res!552006 () Bool)

(assert (=> b!808427 (=> (not res!552006) (not e!447669))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808427 (= res!552006 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21454 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21034 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21454 a!3170)) (= (select (arr!21034 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!551999 () Bool)

(assert (=> start!69392 (=> (not res!551999) (not e!447666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69392 (= res!551999 (validMask!0 mask!3266))))

(assert (=> start!69392 e!447666))

(assert (=> start!69392 true))

(declare-fun array_inv!16893 (array!43924) Bool)

(assert (=> start!69392 (array_inv!16893 a!3170)))

(declare-fun b!808428 () Bool)

(declare-fun e!447667 () Bool)

(assert (=> b!808428 (= e!447669 e!447667)))

(declare-fun res!552001 () Bool)

(assert (=> b!808428 (=> (not res!552001) (not e!447667))))

(declare-fun lt!362139 () (_ BitVec 64))

(declare-fun lt!362143 () array!43924)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43924 (_ BitVec 32)) SeekEntryResult!8581)

(assert (=> b!808428 (= res!552001 (= (seekEntryOrOpen!0 lt!362139 lt!362143 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362139 lt!362143 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808428 (= lt!362139 (select (store (arr!21034 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808428 (= lt!362143 (array!43925 (store (arr!21034 a!3170) i!1163 k0!2044) (size!21454 a!3170)))))

(declare-fun b!808429 () Bool)

(declare-fun res!552000 () Bool)

(assert (=> b!808429 (=> (not res!552000) (not e!447666))))

(assert (=> b!808429 (= res!552000 (and (= (size!21454 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21454 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21454 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808430 () Bool)

(declare-fun e!447668 () Bool)

(assert (=> b!808430 (= e!447668 false)))

(declare-fun lt!362141 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808430 (= lt!362141 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!808431 () Bool)

(declare-fun res!552005 () Bool)

(assert (=> b!808431 (=> (not res!552005) (not e!447666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808431 (= res!552005 (validKeyInArray!0 (select (arr!21034 a!3170) j!153)))))

(declare-fun b!808432 () Bool)

(declare-fun res!552002 () Bool)

(assert (=> b!808432 (=> (not res!552002) (not e!447666))))

(assert (=> b!808432 (= res!552002 (validKeyInArray!0 k0!2044))))

(declare-fun b!808433 () Bool)

(declare-fun res!552004 () Bool)

(assert (=> b!808433 (=> (not res!552004) (not e!447669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43924 (_ BitVec 32)) Bool)

(assert (=> b!808433 (= res!552004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808434 () Bool)

(assert (=> b!808434 (= e!447667 e!447668)))

(declare-fun res!552008 () Bool)

(assert (=> b!808434 (=> (not res!552008) (not e!447668))))

(declare-fun lt!362140 () SeekEntryResult!8581)

(declare-fun lt!362142 () SeekEntryResult!8581)

(assert (=> b!808434 (= res!552008 (and (= lt!362142 lt!362140) (= lt!362140 (Found!8581 j!153)) (not (= (select (arr!21034 a!3170) index!1236) (select (arr!21034 a!3170) j!153)))))))

(assert (=> b!808434 (= lt!362140 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21034 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808434 (= lt!362142 (seekEntryOrOpen!0 (select (arr!21034 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69392 res!551999) b!808429))

(assert (= (and b!808429 res!552000) b!808431))

(assert (= (and b!808431 res!552005) b!808432))

(assert (= (and b!808432 res!552002) b!808425))

(assert (= (and b!808425 res!552003) b!808426))

(assert (= (and b!808426 res!552007) b!808433))

(assert (= (and b!808433 res!552004) b!808424))

(assert (= (and b!808424 res!552009) b!808427))

(assert (= (and b!808427 res!552006) b!808428))

(assert (= (and b!808428 res!552001) b!808434))

(assert (= (and b!808434 res!552008) b!808430))

(declare-fun m!750841 () Bool)

(assert (=> b!808425 m!750841))

(declare-fun m!750843 () Bool)

(assert (=> b!808427 m!750843))

(declare-fun m!750845 () Bool)

(assert (=> b!808427 m!750845))

(declare-fun m!750847 () Bool)

(assert (=> start!69392 m!750847))

(declare-fun m!750849 () Bool)

(assert (=> start!69392 m!750849))

(declare-fun m!750851 () Bool)

(assert (=> b!808430 m!750851))

(declare-fun m!750853 () Bool)

(assert (=> b!808433 m!750853))

(declare-fun m!750855 () Bool)

(assert (=> b!808431 m!750855))

(assert (=> b!808431 m!750855))

(declare-fun m!750857 () Bool)

(assert (=> b!808431 m!750857))

(declare-fun m!750859 () Bool)

(assert (=> b!808424 m!750859))

(declare-fun m!750861 () Bool)

(assert (=> b!808426 m!750861))

(declare-fun m!750863 () Bool)

(assert (=> b!808432 m!750863))

(declare-fun m!750865 () Bool)

(assert (=> b!808428 m!750865))

(declare-fun m!750867 () Bool)

(assert (=> b!808428 m!750867))

(declare-fun m!750869 () Bool)

(assert (=> b!808428 m!750869))

(declare-fun m!750871 () Bool)

(assert (=> b!808428 m!750871))

(declare-fun m!750873 () Bool)

(assert (=> b!808434 m!750873))

(assert (=> b!808434 m!750855))

(assert (=> b!808434 m!750855))

(declare-fun m!750875 () Bool)

(assert (=> b!808434 m!750875))

(assert (=> b!808434 m!750855))

(declare-fun m!750877 () Bool)

(assert (=> b!808434 m!750877))

(check-sat (not b!808433) (not b!808425) (not b!808434) (not b!808430) (not start!69392) (not b!808428) (not b!808432) (not b!808424) (not b!808426) (not b!808431))
(check-sat)
