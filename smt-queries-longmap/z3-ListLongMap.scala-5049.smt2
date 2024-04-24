; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68972 () Bool)

(assert start!68972)

(declare-fun b!802835 () Bool)

(declare-fun res!546815 () Bool)

(declare-fun e!445057 () Bool)

(assert (=> b!802835 (=> (not res!546815) (not e!445057))))

(declare-datatypes ((array!43594 0))(
  ( (array!43595 (arr!20872 (Array (_ BitVec 32) (_ BitVec 64))) (size!21292 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43594)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43594 (_ BitVec 32)) Bool)

(assert (=> b!802835 (= res!546815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802836 () Bool)

(declare-fun res!546814 () Bool)

(assert (=> b!802836 (=> (not res!546814) (not e!445057))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802836 (= res!546814 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21292 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20872 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21292 a!3170)) (= (select (arr!20872 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802837 () Bool)

(declare-fun res!546806 () Bool)

(assert (=> b!802837 (=> (not res!546806) (not e!445057))))

(declare-datatypes ((List!14742 0))(
  ( (Nil!14739) (Cons!14738 (h!15873 (_ BitVec 64)) (t!21049 List!14742)) )
))
(declare-fun arrayNoDuplicates!0 (array!43594 (_ BitVec 32) List!14742) Bool)

(assert (=> b!802837 (= res!546806 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14739))))

(declare-fun b!802838 () Bool)

(declare-fun res!546811 () Bool)

(declare-fun e!445059 () Bool)

(assert (=> b!802838 (=> (not res!546811) (not e!445059))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802838 (= res!546811 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802839 () Bool)

(declare-fun res!546816 () Bool)

(assert (=> b!802839 (=> (not res!546816) (not e!445059))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802839 (= res!546816 (validKeyInArray!0 (select (arr!20872 a!3170) j!153)))))

(declare-fun b!802840 () Bool)

(declare-fun res!546807 () Bool)

(assert (=> b!802840 (=> (not res!546807) (not e!445059))))

(assert (=> b!802840 (= res!546807 (validKeyInArray!0 k0!2044))))

(declare-fun b!802841 () Bool)

(declare-fun e!445056 () Bool)

(assert (=> b!802841 (= e!445056 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!358900 () array!43594)

(declare-fun lt!358899 () (_ BitVec 32))

(declare-fun lt!358904 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8419 0))(
  ( (MissingZero!8419 (index!36044 (_ BitVec 32))) (Found!8419 (index!36045 (_ BitVec 32))) (Intermediate!8419 (undefined!9231 Bool) (index!36046 (_ BitVec 32)) (x!67063 (_ BitVec 32))) (Undefined!8419) (MissingVacant!8419 (index!36047 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43594 (_ BitVec 32)) SeekEntryResult!8419)

(assert (=> b!802841 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358899 vacantAfter!23 lt!358904 lt!358900 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358899 vacantBefore!23 (select (arr!20872 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27463 0))(
  ( (Unit!27464) )
))
(declare-fun lt!358902 () Unit!27463)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43594 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27463)

(assert (=> b!802841 (= lt!358902 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358899 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802841 (= lt!358899 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!802842 () Bool)

(assert (=> b!802842 (= e!445059 e!445057)))

(declare-fun res!546813 () Bool)

(assert (=> b!802842 (=> (not res!546813) (not e!445057))))

(declare-fun lt!358901 () SeekEntryResult!8419)

(assert (=> b!802842 (= res!546813 (or (= lt!358901 (MissingZero!8419 i!1163)) (= lt!358901 (MissingVacant!8419 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43594 (_ BitVec 32)) SeekEntryResult!8419)

(assert (=> b!802842 (= lt!358901 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802843 () Bool)

(declare-fun e!445060 () Bool)

(assert (=> b!802843 (= e!445057 e!445060)))

(declare-fun res!546809 () Bool)

(assert (=> b!802843 (=> (not res!546809) (not e!445060))))

(assert (=> b!802843 (= res!546809 (= (seekEntryOrOpen!0 lt!358904 lt!358900 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358904 lt!358900 mask!3266)))))

(assert (=> b!802843 (= lt!358904 (select (store (arr!20872 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802843 (= lt!358900 (array!43595 (store (arr!20872 a!3170) i!1163 k0!2044) (size!21292 a!3170)))))

(declare-fun b!802844 () Bool)

(declare-fun res!546812 () Bool)

(assert (=> b!802844 (=> (not res!546812) (not e!445059))))

(assert (=> b!802844 (= res!546812 (and (= (size!21292 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21292 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21292 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802845 () Bool)

(assert (=> b!802845 (= e!445060 e!445056)))

(declare-fun res!546808 () Bool)

(assert (=> b!802845 (=> (not res!546808) (not e!445056))))

(declare-fun lt!358898 () SeekEntryResult!8419)

(declare-fun lt!358903 () SeekEntryResult!8419)

(assert (=> b!802845 (= res!546808 (and (= lt!358898 lt!358903) (= lt!358903 (Found!8419 j!153)) (not (= (select (arr!20872 a!3170) index!1236) (select (arr!20872 a!3170) j!153)))))))

(assert (=> b!802845 (= lt!358903 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20872 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802845 (= lt!358898 (seekEntryOrOpen!0 (select (arr!20872 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!546810 () Bool)

(assert (=> start!68972 (=> (not res!546810) (not e!445059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68972 (= res!546810 (validMask!0 mask!3266))))

(assert (=> start!68972 e!445059))

(assert (=> start!68972 true))

(declare-fun array_inv!16731 (array!43594) Bool)

(assert (=> start!68972 (array_inv!16731 a!3170)))

(assert (= (and start!68972 res!546810) b!802844))

(assert (= (and b!802844 res!546812) b!802839))

(assert (= (and b!802839 res!546816) b!802840))

(assert (= (and b!802840 res!546807) b!802838))

(assert (= (and b!802838 res!546811) b!802842))

(assert (= (and b!802842 res!546813) b!802835))

(assert (= (and b!802835 res!546815) b!802837))

(assert (= (and b!802837 res!546806) b!802836))

(assert (= (and b!802836 res!546814) b!802843))

(assert (= (and b!802843 res!546809) b!802845))

(assert (= (and b!802845 res!546808) b!802841))

(declare-fun m!744487 () Bool)

(assert (=> b!802836 m!744487))

(declare-fun m!744489 () Bool)

(assert (=> b!802836 m!744489))

(declare-fun m!744491 () Bool)

(assert (=> start!68972 m!744491))

(declare-fun m!744493 () Bool)

(assert (=> start!68972 m!744493))

(declare-fun m!744495 () Bool)

(assert (=> b!802845 m!744495))

(declare-fun m!744497 () Bool)

(assert (=> b!802845 m!744497))

(assert (=> b!802845 m!744497))

(declare-fun m!744499 () Bool)

(assert (=> b!802845 m!744499))

(assert (=> b!802845 m!744497))

(declare-fun m!744501 () Bool)

(assert (=> b!802845 m!744501))

(assert (=> b!802841 m!744497))

(declare-fun m!744503 () Bool)

(assert (=> b!802841 m!744503))

(declare-fun m!744505 () Bool)

(assert (=> b!802841 m!744505))

(assert (=> b!802841 m!744497))

(declare-fun m!744507 () Bool)

(assert (=> b!802841 m!744507))

(declare-fun m!744509 () Bool)

(assert (=> b!802841 m!744509))

(declare-fun m!744511 () Bool)

(assert (=> b!802838 m!744511))

(declare-fun m!744513 () Bool)

(assert (=> b!802835 m!744513))

(assert (=> b!802839 m!744497))

(assert (=> b!802839 m!744497))

(declare-fun m!744515 () Bool)

(assert (=> b!802839 m!744515))

(declare-fun m!744517 () Bool)

(assert (=> b!802843 m!744517))

(declare-fun m!744519 () Bool)

(assert (=> b!802843 m!744519))

(declare-fun m!744521 () Bool)

(assert (=> b!802843 m!744521))

(declare-fun m!744523 () Bool)

(assert (=> b!802843 m!744523))

(declare-fun m!744525 () Bool)

(assert (=> b!802842 m!744525))

(declare-fun m!744527 () Bool)

(assert (=> b!802837 m!744527))

(declare-fun m!744529 () Bool)

(assert (=> b!802840 m!744529))

(check-sat (not b!802843) (not b!802838) (not start!68972) (not b!802835) (not b!802845) (not b!802842) (not b!802837) (not b!802839) (not b!802840) (not b!802841))
(check-sat)
