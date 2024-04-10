; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48662 () Bool)

(assert start!48662)

(declare-fun b!534626 () Bool)

(declare-fun res!329837 () Bool)

(declare-fun e!310769 () Bool)

(assert (=> b!534626 (=> (not res!329837) (not e!310769))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33874 0))(
  ( (array!33875 (arr!16276 (Array (_ BitVec 32) (_ BitVec 64))) (size!16640 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33874)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4734 0))(
  ( (MissingZero!4734 (index!21160 (_ BitVec 32))) (Found!4734 (index!21161 (_ BitVec 32))) (Intermediate!4734 (undefined!5546 Bool) (index!21162 (_ BitVec 32)) (x!50117 (_ BitVec 32))) (Undefined!4734) (MissingVacant!4734 (index!21163 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33874 (_ BitVec 32)) SeekEntryResult!4734)

(assert (=> b!534626 (= res!329837 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16276 a!3154) j!147) a!3154 mask!3216) (Intermediate!4734 false resIndex!32 resX!32)))))

(declare-fun b!534627 () Bool)

(declare-fun res!329838 () Bool)

(assert (=> b!534627 (=> (not res!329838) (not e!310769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33874 (_ BitVec 32)) Bool)

(assert (=> b!534627 (= res!329838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534628 () Bool)

(declare-fun res!329833 () Bool)

(assert (=> b!534628 (=> (not res!329833) (not e!310769))))

(declare-datatypes ((List!10395 0))(
  ( (Nil!10392) (Cons!10391 (h!11334 (_ BitVec 64)) (t!16623 List!10395)) )
))
(declare-fun arrayNoDuplicates!0 (array!33874 (_ BitVec 32) List!10395) Bool)

(assert (=> b!534628 (= res!329833 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10392))))

(declare-fun b!534629 () Bool)

(declare-fun res!329831 () Bool)

(declare-fun e!310768 () Bool)

(assert (=> b!534629 (=> (not res!329831) (not e!310768))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534629 (= res!329831 (and (= (size!16640 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16640 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16640 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534630 () Bool)

(declare-fun res!329834 () Bool)

(assert (=> b!534630 (=> (not res!329834) (not e!310769))))

(assert (=> b!534630 (= res!329834 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16640 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16640 a!3154)) (= (select (arr!16276 a!3154) resIndex!32) (select (arr!16276 a!3154) j!147))))))

(declare-fun b!534631 () Bool)

(declare-fun res!329835 () Bool)

(assert (=> b!534631 (=> (not res!329835) (not e!310768))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534631 (= res!329835 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534632 () Bool)

(declare-fun res!329836 () Bool)

(assert (=> b!534632 (=> (not res!329836) (not e!310768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534632 (= res!329836 (validKeyInArray!0 k0!1998))))

(declare-fun b!534633 () Bool)

(assert (=> b!534633 (= e!310768 e!310769)))

(declare-fun res!329839 () Bool)

(assert (=> b!534633 (=> (not res!329839) (not e!310769))))

(declare-fun lt!245670 () SeekEntryResult!4734)

(assert (=> b!534633 (= res!329839 (or (= lt!245670 (MissingZero!4734 i!1153)) (= lt!245670 (MissingVacant!4734 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33874 (_ BitVec 32)) SeekEntryResult!4734)

(assert (=> b!534633 (= lt!245670 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534634 () Bool)

(declare-fun res!329840 () Bool)

(assert (=> b!534634 (=> (not res!329840) (not e!310768))))

(assert (=> b!534634 (= res!329840 (validKeyInArray!0 (select (arr!16276 a!3154) j!147)))))

(declare-fun res!329832 () Bool)

(assert (=> start!48662 (=> (not res!329832) (not e!310768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48662 (= res!329832 (validMask!0 mask!3216))))

(assert (=> start!48662 e!310768))

(assert (=> start!48662 true))

(declare-fun array_inv!12072 (array!33874) Bool)

(assert (=> start!48662 (array_inv!12072 a!3154)))

(declare-fun b!534635 () Bool)

(assert (=> b!534635 (= e!310769 false)))

(declare-fun lt!245671 () SeekEntryResult!4734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534635 (= lt!245671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16276 a!3154) j!147) mask!3216) (select (arr!16276 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48662 res!329832) b!534629))

(assert (= (and b!534629 res!329831) b!534634))

(assert (= (and b!534634 res!329840) b!534632))

(assert (= (and b!534632 res!329836) b!534631))

(assert (= (and b!534631 res!329835) b!534633))

(assert (= (and b!534633 res!329839) b!534627))

(assert (= (and b!534627 res!329838) b!534628))

(assert (= (and b!534628 res!329833) b!534630))

(assert (= (and b!534630 res!329834) b!534626))

(assert (= (and b!534626 res!329837) b!534635))

(declare-fun m!514319 () Bool)

(assert (=> b!534626 m!514319))

(assert (=> b!534626 m!514319))

(declare-fun m!514321 () Bool)

(assert (=> b!534626 m!514321))

(assert (=> b!534635 m!514319))

(assert (=> b!534635 m!514319))

(declare-fun m!514323 () Bool)

(assert (=> b!534635 m!514323))

(assert (=> b!534635 m!514323))

(assert (=> b!534635 m!514319))

(declare-fun m!514325 () Bool)

(assert (=> b!534635 m!514325))

(declare-fun m!514327 () Bool)

(assert (=> b!534632 m!514327))

(declare-fun m!514329 () Bool)

(assert (=> b!534630 m!514329))

(assert (=> b!534630 m!514319))

(declare-fun m!514331 () Bool)

(assert (=> b!534627 m!514331))

(declare-fun m!514333 () Bool)

(assert (=> b!534628 m!514333))

(declare-fun m!514335 () Bool)

(assert (=> b!534631 m!514335))

(declare-fun m!514337 () Bool)

(assert (=> b!534633 m!514337))

(assert (=> b!534634 m!514319))

(assert (=> b!534634 m!514319))

(declare-fun m!514339 () Bool)

(assert (=> b!534634 m!514339))

(declare-fun m!514341 () Bool)

(assert (=> start!48662 m!514341))

(declare-fun m!514343 () Bool)

(assert (=> start!48662 m!514343))

(check-sat (not start!48662) (not b!534635) (not b!534627) (not b!534632) (not b!534628) (not b!534626) (not b!534634) (not b!534631) (not b!534633))
(check-sat)
