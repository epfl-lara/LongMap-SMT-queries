; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48900 () Bool)

(assert start!48900)

(declare-fun b!538832 () Bool)

(declare-fun e!312385 () Bool)

(assert (=> b!538832 (= e!312385 false)))

(declare-datatypes ((SeekEntryResult!4855 0))(
  ( (MissingZero!4855 (index!21644 (_ BitVec 32))) (Found!4855 (index!21645 (_ BitVec 32))) (Intermediate!4855 (undefined!5667 Bool) (index!21646 (_ BitVec 32)) (x!50569 (_ BitVec 32))) (Undefined!4855) (MissingVacant!4855 (index!21647 (_ BitVec 32))) )
))
(declare-fun lt!246835 () SeekEntryResult!4855)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34122 0))(
  ( (array!34123 (arr!16400 (Array (_ BitVec 32) (_ BitVec 64))) (size!16765 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34122)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34122 (_ BitVec 32)) SeekEntryResult!4855)

(assert (=> b!538832 (= lt!246835 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16400 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538833 () Bool)

(declare-fun res!334179 () Bool)

(declare-fun e!312387 () Bool)

(assert (=> b!538833 (=> (not res!334179) (not e!312387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538833 (= res!334179 (validKeyInArray!0 (select (arr!16400 a!3154) j!147)))))

(declare-fun b!538834 () Bool)

(declare-fun res!334181 () Bool)

(assert (=> b!538834 (=> (not res!334181) (not e!312387))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!538834 (= res!334181 (validKeyInArray!0 k0!1998))))

(declare-fun b!538835 () Bool)

(declare-fun res!334180 () Bool)

(assert (=> b!538835 (=> (not res!334180) (not e!312385))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!538835 (= res!334180 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16765 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16765 a!3154)) (= (select (arr!16400 a!3154) resIndex!32) (select (arr!16400 a!3154) j!147))))))

(declare-fun res!334182 () Bool)

(assert (=> start!48900 (=> (not res!334182) (not e!312387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48900 (= res!334182 (validMask!0 mask!3216))))

(assert (=> start!48900 e!312387))

(assert (=> start!48900 true))

(declare-fun array_inv!12283 (array!34122) Bool)

(assert (=> start!48900 (array_inv!12283 a!3154)))

(declare-fun b!538836 () Bool)

(declare-fun res!334186 () Bool)

(assert (=> b!538836 (=> (not res!334186) (not e!312385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34122 (_ BitVec 32)) Bool)

(assert (=> b!538836 (= res!334186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538837 () Bool)

(declare-fun res!334183 () Bool)

(assert (=> b!538837 (=> (not res!334183) (not e!312385))))

(declare-datatypes ((List!10558 0))(
  ( (Nil!10555) (Cons!10554 (h!11497 (_ BitVec 64)) (t!16777 List!10558)) )
))
(declare-fun arrayNoDuplicates!0 (array!34122 (_ BitVec 32) List!10558) Bool)

(assert (=> b!538837 (= res!334183 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10555))))

(declare-fun b!538838 () Bool)

(declare-fun res!334187 () Bool)

(assert (=> b!538838 (=> (not res!334187) (not e!312387))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538838 (= res!334187 (and (= (size!16765 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16765 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16765 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538839 () Bool)

(declare-fun res!334184 () Bool)

(assert (=> b!538839 (=> (not res!334184) (not e!312387))))

(declare-fun arrayContainsKey!0 (array!34122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538839 (= res!334184 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538840 () Bool)

(assert (=> b!538840 (= e!312387 e!312385)))

(declare-fun res!334185 () Bool)

(assert (=> b!538840 (=> (not res!334185) (not e!312385))))

(declare-fun lt!246834 () SeekEntryResult!4855)

(assert (=> b!538840 (= res!334185 (or (= lt!246834 (MissingZero!4855 i!1153)) (= lt!246834 (MissingVacant!4855 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34122 (_ BitVec 32)) SeekEntryResult!4855)

(assert (=> b!538840 (= lt!246834 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48900 res!334182) b!538838))

(assert (= (and b!538838 res!334187) b!538833))

(assert (= (and b!538833 res!334179) b!538834))

(assert (= (and b!538834 res!334181) b!538839))

(assert (= (and b!538839 res!334184) b!538840))

(assert (= (and b!538840 res!334185) b!538836))

(assert (= (and b!538836 res!334186) b!538837))

(assert (= (and b!538837 res!334183) b!538835))

(assert (= (and b!538835 res!334180) b!538832))

(declare-fun m!517441 () Bool)

(assert (=> b!538835 m!517441))

(declare-fun m!517443 () Bool)

(assert (=> b!538835 m!517443))

(declare-fun m!517445 () Bool)

(assert (=> b!538836 m!517445))

(declare-fun m!517447 () Bool)

(assert (=> b!538839 m!517447))

(assert (=> b!538833 m!517443))

(assert (=> b!538833 m!517443))

(declare-fun m!517449 () Bool)

(assert (=> b!538833 m!517449))

(declare-fun m!517451 () Bool)

(assert (=> b!538840 m!517451))

(declare-fun m!517453 () Bool)

(assert (=> b!538834 m!517453))

(assert (=> b!538832 m!517443))

(assert (=> b!538832 m!517443))

(declare-fun m!517455 () Bool)

(assert (=> b!538832 m!517455))

(declare-fun m!517457 () Bool)

(assert (=> b!538837 m!517457))

(declare-fun m!517459 () Bool)

(assert (=> start!48900 m!517459))

(declare-fun m!517461 () Bool)

(assert (=> start!48900 m!517461))

(check-sat (not b!538834) (not b!538837) (not start!48900) (not b!538836) (not b!538833) (not b!538832) (not b!538839) (not b!538840))
(check-sat)
