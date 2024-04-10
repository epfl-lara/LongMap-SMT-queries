; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46058 () Bool)

(assert start!46058)

(declare-fun b!510081 () Bool)

(declare-fun e!298209 () Bool)

(assert (=> b!510081 (= e!298209 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32769 0))(
  ( (array!32770 (arr!15763 (Array (_ BitVec 32) (_ BitVec 64))) (size!16127 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32769)

(declare-datatypes ((SeekEntryResult!4230 0))(
  ( (MissingZero!4230 (index!19108 (_ BitVec 32))) (Found!4230 (index!19109 (_ BitVec 32))) (Intermediate!4230 (undefined!5042 Bool) (index!19110 (_ BitVec 32)) (x!48071 (_ BitVec 32))) (Undefined!4230) (MissingVacant!4230 (index!19111 (_ BitVec 32))) )
))
(declare-fun lt!233148 () SeekEntryResult!4230)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!233149 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32769 (_ BitVec 32)) SeekEntryResult!4230)

(assert (=> b!510081 (= lt!233148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233149 (select (store (arr!15763 a!3235) i!1204 k0!2280) j!176) (array!32770 (store (arr!15763 a!3235) i!1204 k0!2280) (size!16127 a!3235)) mask!3524))))

(declare-fun lt!233146 () SeekEntryResult!4230)

(declare-fun lt!233145 () (_ BitVec 32))

(assert (=> b!510081 (= lt!233146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233145 (select (arr!15763 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510081 (= lt!233149 (toIndex!0 (select (store (arr!15763 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510081 (= lt!233145 (toIndex!0 (select (arr!15763 a!3235) j!176) mask!3524))))

(declare-fun e!298208 () Bool)

(assert (=> b!510081 e!298208))

(declare-fun res!310926 () Bool)

(assert (=> b!510081 (=> (not res!310926) (not e!298208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32769 (_ BitVec 32)) Bool)

(assert (=> b!510081 (= res!310926 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15718 0))(
  ( (Unit!15719) )
))
(declare-fun lt!233147 () Unit!15718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15718)

(assert (=> b!510081 (= lt!233147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510083 () Bool)

(declare-fun res!310932 () Bool)

(declare-fun e!298207 () Bool)

(assert (=> b!510083 (=> (not res!310932) (not e!298207))))

(declare-fun arrayContainsKey!0 (array!32769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510083 (= res!310932 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510084 () Bool)

(declare-fun res!310929 () Bool)

(assert (=> b!510084 (=> (not res!310929) (not e!298207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510084 (= res!310929 (validKeyInArray!0 (select (arr!15763 a!3235) j!176)))))

(declare-fun b!510085 () Bool)

(declare-fun res!310933 () Bool)

(assert (=> b!510085 (=> (not res!310933) (not e!298209))))

(assert (=> b!510085 (= res!310933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510086 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32769 (_ BitVec 32)) SeekEntryResult!4230)

(assert (=> b!510086 (= e!298208 (= (seekEntryOrOpen!0 (select (arr!15763 a!3235) j!176) a!3235 mask!3524) (Found!4230 j!176)))))

(declare-fun b!510087 () Bool)

(declare-fun res!310931 () Bool)

(assert (=> b!510087 (=> (not res!310931) (not e!298207))))

(assert (=> b!510087 (= res!310931 (validKeyInArray!0 k0!2280))))

(declare-fun res!310930 () Bool)

(assert (=> start!46058 (=> (not res!310930) (not e!298207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46058 (= res!310930 (validMask!0 mask!3524))))

(assert (=> start!46058 e!298207))

(assert (=> start!46058 true))

(declare-fun array_inv!11559 (array!32769) Bool)

(assert (=> start!46058 (array_inv!11559 a!3235)))

(declare-fun b!510082 () Bool)

(declare-fun res!310928 () Bool)

(assert (=> b!510082 (=> (not res!310928) (not e!298207))))

(assert (=> b!510082 (= res!310928 (and (= (size!16127 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16127 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16127 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510088 () Bool)

(declare-fun res!310927 () Bool)

(assert (=> b!510088 (=> (not res!310927) (not e!298209))))

(declare-datatypes ((List!9921 0))(
  ( (Nil!9918) (Cons!9917 (h!10794 (_ BitVec 64)) (t!16149 List!9921)) )
))
(declare-fun arrayNoDuplicates!0 (array!32769 (_ BitVec 32) List!9921) Bool)

(assert (=> b!510088 (= res!310927 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9918))))

(declare-fun b!510089 () Bool)

(assert (=> b!510089 (= e!298207 e!298209)))

(declare-fun res!310934 () Bool)

(assert (=> b!510089 (=> (not res!310934) (not e!298209))))

(declare-fun lt!233144 () SeekEntryResult!4230)

(assert (=> b!510089 (= res!310934 (or (= lt!233144 (MissingZero!4230 i!1204)) (= lt!233144 (MissingVacant!4230 i!1204))))))

(assert (=> b!510089 (= lt!233144 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46058 res!310930) b!510082))

(assert (= (and b!510082 res!310928) b!510084))

(assert (= (and b!510084 res!310929) b!510087))

(assert (= (and b!510087 res!310931) b!510083))

(assert (= (and b!510083 res!310932) b!510089))

(assert (= (and b!510089 res!310934) b!510085))

(assert (= (and b!510085 res!310933) b!510088))

(assert (= (and b!510088 res!310927) b!510081))

(assert (= (and b!510081 res!310926) b!510086))

(declare-fun m!491181 () Bool)

(assert (=> b!510085 m!491181))

(declare-fun m!491183 () Bool)

(assert (=> b!510087 m!491183))

(declare-fun m!491185 () Bool)

(assert (=> b!510083 m!491185))

(declare-fun m!491187 () Bool)

(assert (=> b!510081 m!491187))

(declare-fun m!491189 () Bool)

(assert (=> b!510081 m!491189))

(declare-fun m!491191 () Bool)

(assert (=> b!510081 m!491191))

(assert (=> b!510081 m!491191))

(declare-fun m!491193 () Bool)

(assert (=> b!510081 m!491193))

(declare-fun m!491195 () Bool)

(assert (=> b!510081 m!491195))

(declare-fun m!491197 () Bool)

(assert (=> b!510081 m!491197))

(assert (=> b!510081 m!491195))

(declare-fun m!491199 () Bool)

(assert (=> b!510081 m!491199))

(assert (=> b!510081 m!491191))

(declare-fun m!491201 () Bool)

(assert (=> b!510081 m!491201))

(assert (=> b!510081 m!491195))

(declare-fun m!491203 () Bool)

(assert (=> b!510081 m!491203))

(declare-fun m!491205 () Bool)

(assert (=> b!510089 m!491205))

(declare-fun m!491207 () Bool)

(assert (=> start!46058 m!491207))

(declare-fun m!491209 () Bool)

(assert (=> start!46058 m!491209))

(assert (=> b!510086 m!491195))

(assert (=> b!510086 m!491195))

(declare-fun m!491211 () Bool)

(assert (=> b!510086 m!491211))

(assert (=> b!510084 m!491195))

(assert (=> b!510084 m!491195))

(declare-fun m!491213 () Bool)

(assert (=> b!510084 m!491213))

(declare-fun m!491215 () Bool)

(assert (=> b!510088 m!491215))

(check-sat (not b!510083) (not b!510081) (not start!46058) (not b!510087) (not b!510088) (not b!510084) (not b!510086) (not b!510089) (not b!510085))
(check-sat)
