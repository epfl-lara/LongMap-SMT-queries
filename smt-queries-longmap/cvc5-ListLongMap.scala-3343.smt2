; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46050 () Bool)

(assert start!46050)

(declare-fun b!509973 () Bool)

(declare-fun res!310822 () Bool)

(declare-fun e!298159 () Bool)

(assert (=> b!509973 (=> (not res!310822) (not e!298159))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32761 0))(
  ( (array!32762 (arr!15759 (Array (_ BitVec 32) (_ BitVec 64))) (size!16123 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32761)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509973 (= res!310822 (and (= (size!16123 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16123 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16123 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509974 () Bool)

(declare-fun res!310825 () Bool)

(declare-fun e!298158 () Bool)

(assert (=> b!509974 (=> (not res!310825) (not e!298158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32761 (_ BitVec 32)) Bool)

(assert (=> b!509974 (= res!310825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!298161 () Bool)

(declare-fun b!509975 () Bool)

(declare-datatypes ((SeekEntryResult!4226 0))(
  ( (MissingZero!4226 (index!19092 (_ BitVec 32))) (Found!4226 (index!19093 (_ BitVec 32))) (Intermediate!4226 (undefined!5038 Bool) (index!19094 (_ BitVec 32)) (x!48059 (_ BitVec 32))) (Undefined!4226) (MissingVacant!4226 (index!19095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32761 (_ BitVec 32)) SeekEntryResult!4226)

(assert (=> b!509975 (= e!298161 (= (seekEntryOrOpen!0 (select (arr!15759 a!3235) j!176) a!3235 mask!3524) (Found!4226 j!176)))))

(declare-fun b!509976 () Bool)

(declare-fun res!310821 () Bool)

(assert (=> b!509976 (=> (not res!310821) (not e!298159))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509976 (= res!310821 (validKeyInArray!0 k!2280))))

(declare-fun b!509977 () Bool)

(declare-fun res!310823 () Bool)

(assert (=> b!509977 (=> (not res!310823) (not e!298159))))

(declare-fun arrayContainsKey!0 (array!32761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509977 (= res!310823 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!310820 () Bool)

(assert (=> start!46050 (=> (not res!310820) (not e!298159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46050 (= res!310820 (validMask!0 mask!3524))))

(assert (=> start!46050 e!298159))

(assert (=> start!46050 true))

(declare-fun array_inv!11555 (array!32761) Bool)

(assert (=> start!46050 (array_inv!11555 a!3235)))

(declare-fun b!509978 () Bool)

(assert (=> b!509978 (= e!298159 e!298158)))

(declare-fun res!310824 () Bool)

(assert (=> b!509978 (=> (not res!310824) (not e!298158))))

(declare-fun lt!233075 () SeekEntryResult!4226)

(assert (=> b!509978 (= res!310824 (or (= lt!233075 (MissingZero!4226 i!1204)) (= lt!233075 (MissingVacant!4226 i!1204))))))

(assert (=> b!509978 (= lt!233075 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509979 () Bool)

(declare-fun res!310818 () Bool)

(assert (=> b!509979 (=> (not res!310818) (not e!298159))))

(assert (=> b!509979 (= res!310818 (validKeyInArray!0 (select (arr!15759 a!3235) j!176)))))

(declare-fun b!509980 () Bool)

(declare-fun res!310826 () Bool)

(assert (=> b!509980 (=> (not res!310826) (not e!298158))))

(declare-datatypes ((List!9917 0))(
  ( (Nil!9914) (Cons!9913 (h!10790 (_ BitVec 64)) (t!16145 List!9917)) )
))
(declare-fun arrayNoDuplicates!0 (array!32761 (_ BitVec 32) List!9917) Bool)

(assert (=> b!509980 (= res!310826 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9914))))

(declare-fun b!509981 () Bool)

(assert (=> b!509981 (= e!298158 (not true))))

(declare-fun lt!233074 () SeekEntryResult!4226)

(declare-fun lt!233072 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32761 (_ BitVec 32)) SeekEntryResult!4226)

(assert (=> b!509981 (= lt!233074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233072 (select (store (arr!15759 a!3235) i!1204 k!2280) j!176) (array!32762 (store (arr!15759 a!3235) i!1204 k!2280) (size!16123 a!3235)) mask!3524))))

(declare-fun lt!233076 () (_ BitVec 32))

(declare-fun lt!233073 () SeekEntryResult!4226)

(assert (=> b!509981 (= lt!233073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233076 (select (arr!15759 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509981 (= lt!233072 (toIndex!0 (select (store (arr!15759 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509981 (= lt!233076 (toIndex!0 (select (arr!15759 a!3235) j!176) mask!3524))))

(assert (=> b!509981 e!298161))

(declare-fun res!310819 () Bool)

(assert (=> b!509981 (=> (not res!310819) (not e!298161))))

(assert (=> b!509981 (= res!310819 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15710 0))(
  ( (Unit!15711) )
))
(declare-fun lt!233077 () Unit!15710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15710)

(assert (=> b!509981 (= lt!233077 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46050 res!310820) b!509973))

(assert (= (and b!509973 res!310822) b!509979))

(assert (= (and b!509979 res!310818) b!509976))

(assert (= (and b!509976 res!310821) b!509977))

(assert (= (and b!509977 res!310823) b!509978))

(assert (= (and b!509978 res!310824) b!509974))

(assert (= (and b!509974 res!310825) b!509980))

(assert (= (and b!509980 res!310826) b!509981))

(assert (= (and b!509981 res!310819) b!509975))

(declare-fun m!491037 () Bool)

(assert (=> b!509978 m!491037))

(declare-fun m!491039 () Bool)

(assert (=> b!509979 m!491039))

(assert (=> b!509979 m!491039))

(declare-fun m!491041 () Bool)

(assert (=> b!509979 m!491041))

(declare-fun m!491043 () Bool)

(assert (=> b!509974 m!491043))

(assert (=> b!509975 m!491039))

(assert (=> b!509975 m!491039))

(declare-fun m!491045 () Bool)

(assert (=> b!509975 m!491045))

(declare-fun m!491047 () Bool)

(assert (=> b!509976 m!491047))

(declare-fun m!491049 () Bool)

(assert (=> b!509977 m!491049))

(declare-fun m!491051 () Bool)

(assert (=> b!509981 m!491051))

(declare-fun m!491053 () Bool)

(assert (=> b!509981 m!491053))

(declare-fun m!491055 () Bool)

(assert (=> b!509981 m!491055))

(assert (=> b!509981 m!491039))

(declare-fun m!491057 () Bool)

(assert (=> b!509981 m!491057))

(assert (=> b!509981 m!491039))

(declare-fun m!491059 () Bool)

(assert (=> b!509981 m!491059))

(assert (=> b!509981 m!491055))

(declare-fun m!491061 () Bool)

(assert (=> b!509981 m!491061))

(assert (=> b!509981 m!491039))

(declare-fun m!491063 () Bool)

(assert (=> b!509981 m!491063))

(assert (=> b!509981 m!491055))

(declare-fun m!491065 () Bool)

(assert (=> b!509981 m!491065))

(declare-fun m!491067 () Bool)

(assert (=> start!46050 m!491067))

(declare-fun m!491069 () Bool)

(assert (=> start!46050 m!491069))

(declare-fun m!491071 () Bool)

(assert (=> b!509980 m!491071))

(push 1)

