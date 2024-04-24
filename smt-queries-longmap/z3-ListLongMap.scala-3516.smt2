; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48658 () Bool)

(assert start!48658)

(declare-fun res!329887 () Bool)

(declare-fun e!310747 () Bool)

(assert (=> start!48658 (=> (not res!329887) (not e!310747))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48658 (= res!329887 (validMask!0 mask!3216))))

(assert (=> start!48658 e!310747))

(assert (=> start!48658 true))

(declare-datatypes ((array!33869 0))(
  ( (array!33870 (arr!16273 (Array (_ BitVec 32) (_ BitVec 64))) (size!16637 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33869)

(declare-fun array_inv!12132 (array!33869) Bool)

(assert (=> start!48658 (array_inv!12132 a!3154)))

(declare-fun b!534625 () Bool)

(declare-fun res!329886 () Bool)

(declare-fun e!310749 () Bool)

(assert (=> b!534625 (=> (not res!329886) (not e!310749))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534625 (= res!329886 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16637 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16637 a!3154)) (= (select (arr!16273 a!3154) resIndex!32) (select (arr!16273 a!3154) j!147))))))

(declare-fun b!534626 () Bool)

(declare-fun res!329885 () Bool)

(assert (=> b!534626 (=> (not res!329885) (not e!310749))))

(declare-datatypes ((SeekEntryResult!4687 0))(
  ( (MissingZero!4687 (index!20972 (_ BitVec 32))) (Found!4687 (index!20973 (_ BitVec 32))) (Intermediate!4687 (undefined!5499 Bool) (index!20974 (_ BitVec 32)) (x!50075 (_ BitVec 32))) (Undefined!4687) (MissingVacant!4687 (index!20975 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33869 (_ BitVec 32)) SeekEntryResult!4687)

(assert (=> b!534626 (= res!329885 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16273 a!3154) j!147) a!3154 mask!3216) (Intermediate!4687 false resIndex!32 resX!32)))))

(declare-fun b!534627 () Bool)

(assert (=> b!534627 (= e!310749 false)))

(declare-fun lt!245695 () SeekEntryResult!4687)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534627 (= lt!245695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16273 a!3154) j!147) mask!3216) (select (arr!16273 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534628 () Bool)

(declare-fun res!329892 () Bool)

(assert (=> b!534628 (=> (not res!329892) (not e!310747))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534628 (= res!329892 (validKeyInArray!0 k0!1998))))

(declare-fun b!534629 () Bool)

(declare-fun res!329893 () Bool)

(assert (=> b!534629 (=> (not res!329893) (not e!310749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33869 (_ BitVec 32)) Bool)

(assert (=> b!534629 (= res!329893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534630 () Bool)

(assert (=> b!534630 (= e!310747 e!310749)))

(declare-fun res!329891 () Bool)

(assert (=> b!534630 (=> (not res!329891) (not e!310749))))

(declare-fun lt!245694 () SeekEntryResult!4687)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534630 (= res!329891 (or (= lt!245694 (MissingZero!4687 i!1153)) (= lt!245694 (MissingVacant!4687 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33869 (_ BitVec 32)) SeekEntryResult!4687)

(assert (=> b!534630 (= lt!245694 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534631 () Bool)

(declare-fun res!329888 () Bool)

(assert (=> b!534631 (=> (not res!329888) (not e!310749))))

(declare-datatypes ((List!10299 0))(
  ( (Nil!10296) (Cons!10295 (h!11238 (_ BitVec 64)) (t!16519 List!10299)) )
))
(declare-fun arrayNoDuplicates!0 (array!33869 (_ BitVec 32) List!10299) Bool)

(assert (=> b!534631 (= res!329888 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10296))))

(declare-fun b!534632 () Bool)

(declare-fun res!329890 () Bool)

(assert (=> b!534632 (=> (not res!329890) (not e!310747))))

(declare-fun arrayContainsKey!0 (array!33869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534632 (= res!329890 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534633 () Bool)

(declare-fun res!329884 () Bool)

(assert (=> b!534633 (=> (not res!329884) (not e!310747))))

(assert (=> b!534633 (= res!329884 (validKeyInArray!0 (select (arr!16273 a!3154) j!147)))))

(declare-fun b!534634 () Bool)

(declare-fun res!329889 () Bool)

(assert (=> b!534634 (=> (not res!329889) (not e!310747))))

(assert (=> b!534634 (= res!329889 (and (= (size!16637 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16637 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16637 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48658 res!329887) b!534634))

(assert (= (and b!534634 res!329889) b!534633))

(assert (= (and b!534633 res!329884) b!534628))

(assert (= (and b!534628 res!329892) b!534632))

(assert (= (and b!534632 res!329890) b!534630))

(assert (= (and b!534630 res!329891) b!534629))

(assert (= (and b!534629 res!329893) b!534631))

(assert (= (and b!534631 res!329888) b!534625))

(assert (= (and b!534625 res!329886) b!534626))

(assert (= (and b!534626 res!329885) b!534627))

(declare-fun m!514555 () Bool)

(assert (=> start!48658 m!514555))

(declare-fun m!514557 () Bool)

(assert (=> start!48658 m!514557))

(declare-fun m!514559 () Bool)

(assert (=> b!534631 m!514559))

(declare-fun m!514561 () Bool)

(assert (=> b!534629 m!514561))

(declare-fun m!514563 () Bool)

(assert (=> b!534632 m!514563))

(declare-fun m!514565 () Bool)

(assert (=> b!534626 m!514565))

(assert (=> b!534626 m!514565))

(declare-fun m!514567 () Bool)

(assert (=> b!534626 m!514567))

(assert (=> b!534633 m!514565))

(assert (=> b!534633 m!514565))

(declare-fun m!514569 () Bool)

(assert (=> b!534633 m!514569))

(declare-fun m!514571 () Bool)

(assert (=> b!534628 m!514571))

(declare-fun m!514573 () Bool)

(assert (=> b!534630 m!514573))

(assert (=> b!534627 m!514565))

(assert (=> b!534627 m!514565))

(declare-fun m!514575 () Bool)

(assert (=> b!534627 m!514575))

(assert (=> b!534627 m!514575))

(assert (=> b!534627 m!514565))

(declare-fun m!514577 () Bool)

(assert (=> b!534627 m!514577))

(declare-fun m!514579 () Bool)

(assert (=> b!534625 m!514579))

(assert (=> b!534625 m!514565))

(check-sat (not b!534633) (not b!534632) (not b!534629) (not b!534630) (not b!534627) (not b!534628) (not b!534631) (not b!534626) (not start!48658))
(check-sat)
