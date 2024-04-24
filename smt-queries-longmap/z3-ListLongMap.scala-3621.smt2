; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49970 () Bool)

(assert start!49970)

(declare-fun b!547860 () Bool)

(declare-fun res!341256 () Bool)

(declare-fun e!316596 () Bool)

(assert (=> b!547860 (=> (not res!341256) (not e!316596))))

(declare-datatypes ((array!34537 0))(
  ( (array!34538 (arr!16588 (Array (_ BitVec 32) (_ BitVec 64))) (size!16952 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34537)

(declare-datatypes ((List!10575 0))(
  ( (Nil!10572) (Cons!10571 (h!11541 (_ BitVec 64)) (t!16795 List!10575)) )
))
(declare-fun arrayNoDuplicates!0 (array!34537 (_ BitVec 32) List!10575) Bool)

(assert (=> b!547860 (= res!341256 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10572))))

(declare-fun res!341253 () Bool)

(declare-fun e!316594 () Bool)

(assert (=> start!49970 (=> (not res!341253) (not e!316594))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49970 (= res!341253 (validMask!0 mask!3119))))

(assert (=> start!49970 e!316594))

(assert (=> start!49970 true))

(declare-fun array_inv!12447 (array!34537) Bool)

(assert (=> start!49970 (array_inv!12447 a!3118)))

(declare-fun b!547861 () Bool)

(declare-fun res!341259 () Bool)

(assert (=> b!547861 (=> (not res!341259) (not e!316594))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547861 (= res!341259 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547862 () Bool)

(assert (=> b!547862 (= e!316594 e!316596)))

(declare-fun res!341254 () Bool)

(assert (=> b!547862 (=> (not res!341254) (not e!316596))))

(declare-datatypes ((SeekEntryResult!4993 0))(
  ( (MissingZero!4993 (index!22199 (_ BitVec 32))) (Found!4993 (index!22200 (_ BitVec 32))) (Intermediate!4993 (undefined!5805 Bool) (index!22201 (_ BitVec 32)) (x!51296 (_ BitVec 32))) (Undefined!4993) (MissingVacant!4993 (index!22202 (_ BitVec 32))) )
))
(declare-fun lt!249724 () SeekEntryResult!4993)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547862 (= res!341254 (or (= lt!249724 (MissingZero!4993 i!1132)) (= lt!249724 (MissingVacant!4993 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34537 (_ BitVec 32)) SeekEntryResult!4993)

(assert (=> b!547862 (= lt!249724 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547863 () Bool)

(declare-fun res!341258 () Bool)

(assert (=> b!547863 (=> (not res!341258) (not e!316594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547863 (= res!341258 (validKeyInArray!0 k0!1914))))

(declare-fun b!547864 () Bool)

(declare-fun res!341257 () Bool)

(assert (=> b!547864 (=> (not res!341257) (not e!316594))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!547864 (= res!341257 (and (= (size!16952 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16952 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16952 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547865 () Bool)

(assert (=> b!547865 (= e!316596 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!547866 () Bool)

(declare-fun res!341260 () Bool)

(assert (=> b!547866 (=> (not res!341260) (not e!316596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34537 (_ BitVec 32)) Bool)

(assert (=> b!547866 (= res!341260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547867 () Bool)

(declare-fun res!341255 () Bool)

(assert (=> b!547867 (=> (not res!341255) (not e!316594))))

(assert (=> b!547867 (= res!341255 (validKeyInArray!0 (select (arr!16588 a!3118) j!142)))))

(assert (= (and start!49970 res!341253) b!547864))

(assert (= (and b!547864 res!341257) b!547867))

(assert (= (and b!547867 res!341255) b!547863))

(assert (= (and b!547863 res!341258) b!547861))

(assert (= (and b!547861 res!341259) b!547862))

(assert (= (and b!547862 res!341254) b!547866))

(assert (= (and b!547866 res!341260) b!547860))

(assert (= (and b!547860 res!341256) b!547865))

(declare-fun m!525235 () Bool)

(assert (=> b!547862 m!525235))

(declare-fun m!525237 () Bool)

(assert (=> b!547861 m!525237))

(declare-fun m!525239 () Bool)

(assert (=> b!547867 m!525239))

(assert (=> b!547867 m!525239))

(declare-fun m!525241 () Bool)

(assert (=> b!547867 m!525241))

(declare-fun m!525243 () Bool)

(assert (=> b!547860 m!525243))

(declare-fun m!525245 () Bool)

(assert (=> b!547866 m!525245))

(declare-fun m!525247 () Bool)

(assert (=> start!49970 m!525247))

(declare-fun m!525249 () Bool)

(assert (=> start!49970 m!525249))

(declare-fun m!525251 () Bool)

(assert (=> b!547863 m!525251))

(check-sat (not b!547867) (not b!547866) (not b!547863) (not b!547862) (not b!547860) (not b!547861) (not start!49970))
(check-sat)
