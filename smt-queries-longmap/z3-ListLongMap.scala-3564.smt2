; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48996 () Bool)

(assert start!48996)

(declare-fun res!334913 () Bool)

(declare-fun e!312762 () Bool)

(assert (=> start!48996 (=> (not res!334913) (not e!312762))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48996 (= res!334913 (validMask!0 mask!3216))))

(assert (=> start!48996 e!312762))

(assert (=> start!48996 true))

(declare-datatypes ((array!34167 0))(
  ( (array!34168 (arr!16421 (Array (_ BitVec 32) (_ BitVec 64))) (size!16786 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34167)

(declare-fun array_inv!12304 (array!34167) Bool)

(assert (=> start!48996 (array_inv!12304 a!3154)))

(declare-fun b!539725 () Bool)

(declare-fun res!334917 () Bool)

(declare-fun e!312761 () Bool)

(assert (=> b!539725 (=> (not res!334917) (not e!312761))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4876 0))(
  ( (MissingZero!4876 (index!21728 (_ BitVec 32))) (Found!4876 (index!21729 (_ BitVec 32))) (Intermediate!4876 (undefined!5688 Bool) (index!21730 (_ BitVec 32)) (x!50652 (_ BitVec 32))) (Undefined!4876) (MissingVacant!4876 (index!21731 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34167 (_ BitVec 32)) SeekEntryResult!4876)

(assert (=> b!539725 (= res!334917 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16421 a!3154) j!147) a!3154 mask!3216) (Intermediate!4876 false resIndex!32 resX!32)))))

(declare-fun b!539726 () Bool)

(declare-fun res!334915 () Bool)

(assert (=> b!539726 (=> (not res!334915) (not e!312762))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539726 (= res!334915 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539727 () Bool)

(declare-fun res!334921 () Bool)

(assert (=> b!539727 (=> (not res!334921) (not e!312762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539727 (= res!334921 (validKeyInArray!0 (select (arr!16421 a!3154) j!147)))))

(declare-fun b!539728 () Bool)

(assert (=> b!539728 (= e!312762 e!312761)))

(declare-fun res!334920 () Bool)

(assert (=> b!539728 (=> (not res!334920) (not e!312761))))

(declare-fun lt!247056 () SeekEntryResult!4876)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539728 (= res!334920 (or (= lt!247056 (MissingZero!4876 i!1153)) (= lt!247056 (MissingVacant!4876 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34167 (_ BitVec 32)) SeekEntryResult!4876)

(assert (=> b!539728 (= lt!247056 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539729 () Bool)

(declare-fun res!334922 () Bool)

(assert (=> b!539729 (=> (not res!334922) (not e!312762))))

(assert (=> b!539729 (= res!334922 (validKeyInArray!0 k0!1998))))

(declare-fun b!539730 () Bool)

(assert (=> b!539730 (= e!312761 false)))

(declare-fun lt!247057 () SeekEntryResult!4876)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539730 (= lt!247057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16421 a!3154) j!147) mask!3216) (select (arr!16421 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539731 () Bool)

(declare-fun res!334916 () Bool)

(assert (=> b!539731 (=> (not res!334916) (not e!312761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34167 (_ BitVec 32)) Bool)

(assert (=> b!539731 (= res!334916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539732 () Bool)

(declare-fun res!334919 () Bool)

(assert (=> b!539732 (=> (not res!334919) (not e!312761))))

(assert (=> b!539732 (= res!334919 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16786 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16786 a!3154)) (= (select (arr!16421 a!3154) resIndex!32) (select (arr!16421 a!3154) j!147))))))

(declare-fun b!539733 () Bool)

(declare-fun res!334918 () Bool)

(assert (=> b!539733 (=> (not res!334918) (not e!312762))))

(assert (=> b!539733 (= res!334918 (and (= (size!16786 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16786 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16786 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539734 () Bool)

(declare-fun res!334914 () Bool)

(assert (=> b!539734 (=> (not res!334914) (not e!312761))))

(declare-datatypes ((List!10579 0))(
  ( (Nil!10576) (Cons!10575 (h!11521 (_ BitVec 64)) (t!16798 List!10579)) )
))
(declare-fun arrayNoDuplicates!0 (array!34167 (_ BitVec 32) List!10579) Bool)

(assert (=> b!539734 (= res!334914 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10576))))

(assert (= (and start!48996 res!334913) b!539733))

(assert (= (and b!539733 res!334918) b!539727))

(assert (= (and b!539727 res!334921) b!539729))

(assert (= (and b!539729 res!334922) b!539726))

(assert (= (and b!539726 res!334915) b!539728))

(assert (= (and b!539728 res!334920) b!539731))

(assert (= (and b!539731 res!334916) b!539734))

(assert (= (and b!539734 res!334914) b!539732))

(assert (= (and b!539732 res!334919) b!539725))

(assert (= (and b!539725 res!334917) b!539730))

(declare-fun m!518101 () Bool)

(assert (=> b!539732 m!518101))

(declare-fun m!518103 () Bool)

(assert (=> b!539732 m!518103))

(assert (=> b!539725 m!518103))

(assert (=> b!539725 m!518103))

(declare-fun m!518105 () Bool)

(assert (=> b!539725 m!518105))

(declare-fun m!518107 () Bool)

(assert (=> start!48996 m!518107))

(declare-fun m!518109 () Bool)

(assert (=> start!48996 m!518109))

(declare-fun m!518111 () Bool)

(assert (=> b!539726 m!518111))

(declare-fun m!518113 () Bool)

(assert (=> b!539731 m!518113))

(declare-fun m!518115 () Bool)

(assert (=> b!539728 m!518115))

(assert (=> b!539730 m!518103))

(assert (=> b!539730 m!518103))

(declare-fun m!518117 () Bool)

(assert (=> b!539730 m!518117))

(assert (=> b!539730 m!518117))

(assert (=> b!539730 m!518103))

(declare-fun m!518119 () Bool)

(assert (=> b!539730 m!518119))

(declare-fun m!518121 () Bool)

(assert (=> b!539729 m!518121))

(declare-fun m!518123 () Bool)

(assert (=> b!539734 m!518123))

(assert (=> b!539727 m!518103))

(assert (=> b!539727 m!518103))

(declare-fun m!518125 () Bool)

(assert (=> b!539727 m!518125))

(check-sat (not b!539734) (not b!539725) (not b!539727) (not b!539728) (not b!539729) (not b!539730) (not b!539731) (not b!539726) (not start!48996))
(check-sat)
