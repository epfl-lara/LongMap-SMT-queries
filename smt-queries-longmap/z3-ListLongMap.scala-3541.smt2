; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48862 () Bool)

(assert start!48862)

(declare-fun b!537592 () Bool)

(declare-fun e!311912 () Bool)

(declare-fun e!311910 () Bool)

(assert (=> b!537592 (= e!311912 e!311910)))

(declare-fun res!332700 () Bool)

(assert (=> b!537592 (=> (not res!332700) (not e!311910))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246499 () (_ BitVec 32))

(declare-datatypes ((array!34022 0))(
  ( (array!34023 (arr!16348 (Array (_ BitVec 32) (_ BitVec 64))) (size!16712 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34022)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537592 (= res!332700 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246499 #b00000000000000000000000000000000) (bvslt lt!246499 (size!16712 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537592 (= lt!246499 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!537593 () Bool)

(declare-fun res!332698 () Bool)

(declare-fun e!311909 () Bool)

(assert (=> b!537593 (=> (not res!332698) (not e!311909))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537593 (= res!332698 (validKeyInArray!0 k0!1998))))

(declare-fun b!537594 () Bool)

(declare-fun res!332704 () Bool)

(declare-fun e!311913 () Bool)

(assert (=> b!537594 (=> (not res!332704) (not e!311913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34022 (_ BitVec 32)) Bool)

(assert (=> b!537594 (= res!332704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537595 () Bool)

(declare-fun res!332702 () Bool)

(assert (=> b!537595 (=> (not res!332702) (not e!311913))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!537595 (= res!332702 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16712 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16712 a!3154)) (= (select (arr!16348 a!3154) resIndex!32) (select (arr!16348 a!3154) j!147))))))

(declare-fun b!537596 () Bool)

(declare-fun res!332693 () Bool)

(assert (=> b!537596 (=> (not res!332693) (not e!311909))))

(declare-fun arrayContainsKey!0 (array!34022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537596 (= res!332693 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537597 () Bool)

(declare-fun res!332701 () Bool)

(assert (=> b!537597 (=> (not res!332701) (not e!311912))))

(declare-datatypes ((SeekEntryResult!4762 0))(
  ( (MissingZero!4762 (index!21272 (_ BitVec 32))) (Found!4762 (index!21273 (_ BitVec 32))) (Intermediate!4762 (undefined!5574 Bool) (index!21274 (_ BitVec 32)) (x!50356 (_ BitVec 32))) (Undefined!4762) (MissingVacant!4762 (index!21275 (_ BitVec 32))) )
))
(declare-fun lt!246498 () SeekEntryResult!4762)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34022 (_ BitVec 32)) SeekEntryResult!4762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537597 (= res!332701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16348 a!3154) j!147) mask!3216) (select (arr!16348 a!3154) j!147) a!3154 mask!3216) lt!246498))))

(declare-fun b!537598 () Bool)

(declare-fun res!332695 () Bool)

(assert (=> b!537598 (=> (not res!332695) (not e!311909))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537598 (= res!332695 (and (= (size!16712 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16712 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16712 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537599 () Bool)

(declare-fun res!332699 () Bool)

(assert (=> b!537599 (=> (not res!332699) (not e!311912))))

(assert (=> b!537599 (= res!332699 (and (not (= (select (arr!16348 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16348 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16348 a!3154) index!1177) (select (arr!16348 a!3154) j!147)))))))

(declare-fun b!537600 () Bool)

(declare-fun res!332697 () Bool)

(assert (=> b!537600 (=> (not res!332697) (not e!311909))))

(assert (=> b!537600 (= res!332697 (validKeyInArray!0 (select (arr!16348 a!3154) j!147)))))

(declare-fun b!537601 () Bool)

(assert (=> b!537601 (= e!311910 false)))

(declare-fun lt!246497 () SeekEntryResult!4762)

(assert (=> b!537601 (= lt!246497 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246499 (select (arr!16348 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537602 () Bool)

(assert (=> b!537602 (= e!311913 e!311912)))

(declare-fun res!332692 () Bool)

(assert (=> b!537602 (=> (not res!332692) (not e!311912))))

(assert (=> b!537602 (= res!332692 (= lt!246498 (Intermediate!4762 false resIndex!32 resX!32)))))

(assert (=> b!537602 (= lt!246498 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16348 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537603 () Bool)

(assert (=> b!537603 (= e!311909 e!311913)))

(declare-fun res!332703 () Bool)

(assert (=> b!537603 (=> (not res!332703) (not e!311913))))

(declare-fun lt!246496 () SeekEntryResult!4762)

(assert (=> b!537603 (= res!332703 (or (= lt!246496 (MissingZero!4762 i!1153)) (= lt!246496 (MissingVacant!4762 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34022 (_ BitVec 32)) SeekEntryResult!4762)

(assert (=> b!537603 (= lt!246496 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537604 () Bool)

(declare-fun res!332696 () Bool)

(assert (=> b!537604 (=> (not res!332696) (not e!311913))))

(declare-datatypes ((List!10374 0))(
  ( (Nil!10371) (Cons!10370 (h!11316 (_ BitVec 64)) (t!16594 List!10374)) )
))
(declare-fun arrayNoDuplicates!0 (array!34022 (_ BitVec 32) List!10374) Bool)

(assert (=> b!537604 (= res!332696 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10371))))

(declare-fun res!332694 () Bool)

(assert (=> start!48862 (=> (not res!332694) (not e!311909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48862 (= res!332694 (validMask!0 mask!3216))))

(assert (=> start!48862 e!311909))

(assert (=> start!48862 true))

(declare-fun array_inv!12207 (array!34022) Bool)

(assert (=> start!48862 (array_inv!12207 a!3154)))

(assert (= (and start!48862 res!332694) b!537598))

(assert (= (and b!537598 res!332695) b!537600))

(assert (= (and b!537600 res!332697) b!537593))

(assert (= (and b!537593 res!332698) b!537596))

(assert (= (and b!537596 res!332693) b!537603))

(assert (= (and b!537603 res!332703) b!537594))

(assert (= (and b!537594 res!332704) b!537604))

(assert (= (and b!537604 res!332696) b!537595))

(assert (= (and b!537595 res!332702) b!537602))

(assert (= (and b!537602 res!332692) b!537597))

(assert (= (and b!537597 res!332701) b!537599))

(assert (= (and b!537599 res!332699) b!537592))

(assert (= (and b!537592 res!332700) b!537601))

(declare-fun m!516955 () Bool)

(assert (=> b!537604 m!516955))

(declare-fun m!516957 () Bool)

(assert (=> b!537601 m!516957))

(assert (=> b!537601 m!516957))

(declare-fun m!516959 () Bool)

(assert (=> b!537601 m!516959))

(assert (=> b!537600 m!516957))

(assert (=> b!537600 m!516957))

(declare-fun m!516961 () Bool)

(assert (=> b!537600 m!516961))

(declare-fun m!516963 () Bool)

(assert (=> b!537603 m!516963))

(declare-fun m!516965 () Bool)

(assert (=> start!48862 m!516965))

(declare-fun m!516967 () Bool)

(assert (=> start!48862 m!516967))

(declare-fun m!516969 () Bool)

(assert (=> b!537594 m!516969))

(declare-fun m!516971 () Bool)

(assert (=> b!537596 m!516971))

(declare-fun m!516973 () Bool)

(assert (=> b!537592 m!516973))

(declare-fun m!516975 () Bool)

(assert (=> b!537599 m!516975))

(assert (=> b!537599 m!516957))

(declare-fun m!516977 () Bool)

(assert (=> b!537595 m!516977))

(assert (=> b!537595 m!516957))

(assert (=> b!537597 m!516957))

(assert (=> b!537597 m!516957))

(declare-fun m!516979 () Bool)

(assert (=> b!537597 m!516979))

(assert (=> b!537597 m!516979))

(assert (=> b!537597 m!516957))

(declare-fun m!516981 () Bool)

(assert (=> b!537597 m!516981))

(assert (=> b!537602 m!516957))

(assert (=> b!537602 m!516957))

(declare-fun m!516983 () Bool)

(assert (=> b!537602 m!516983))

(declare-fun m!516985 () Bool)

(assert (=> b!537593 m!516985))

(check-sat (not b!537593) (not b!537600) (not b!537604) (not b!537601) (not b!537596) (not b!537597) (not start!48862) (not b!537603) (not b!537592) (not b!537602) (not b!537594))
(check-sat)
