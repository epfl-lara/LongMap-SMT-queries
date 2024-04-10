; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46056 () Bool)

(assert start!46056)

(declare-fun e!298196 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!510054 () Bool)

(declare-datatypes ((array!32767 0))(
  ( (array!32768 (arr!15762 (Array (_ BitVec 32) (_ BitVec 64))) (size!16126 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32767)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4229 0))(
  ( (MissingZero!4229 (index!19104 (_ BitVec 32))) (Found!4229 (index!19105 (_ BitVec 32))) (Intermediate!4229 (undefined!5041 Bool) (index!19106 (_ BitVec 32)) (x!48070 (_ BitVec 32))) (Undefined!4229) (MissingVacant!4229 (index!19107 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32767 (_ BitVec 32)) SeekEntryResult!4229)

(assert (=> b!510054 (= e!298196 (= (seekEntryOrOpen!0 (select (arr!15762 a!3235) j!176) a!3235 mask!3524) (Found!4229 j!176)))))

(declare-fun b!510055 () Bool)

(declare-fun res!310902 () Bool)

(declare-fun e!298197 () Bool)

(assert (=> b!510055 (=> (not res!310902) (not e!298197))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510055 (= res!310902 (validKeyInArray!0 k!2280))))

(declare-fun res!310907 () Bool)

(assert (=> start!46056 (=> (not res!310907) (not e!298197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46056 (= res!310907 (validMask!0 mask!3524))))

(assert (=> start!46056 e!298197))

(assert (=> start!46056 true))

(declare-fun array_inv!11558 (array!32767) Bool)

(assert (=> start!46056 (array_inv!11558 a!3235)))

(declare-fun b!510056 () Bool)

(declare-fun res!310899 () Bool)

(declare-fun e!298194 () Bool)

(assert (=> b!510056 (=> (not res!310899) (not e!298194))))

(declare-datatypes ((List!9920 0))(
  ( (Nil!9917) (Cons!9916 (h!10793 (_ BitVec 64)) (t!16148 List!9920)) )
))
(declare-fun arrayNoDuplicates!0 (array!32767 (_ BitVec 32) List!9920) Bool)

(assert (=> b!510056 (= res!310899 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9917))))

(declare-fun b!510057 () Bool)

(declare-fun res!310900 () Bool)

(assert (=> b!510057 (=> (not res!310900) (not e!298197))))

(assert (=> b!510057 (= res!310900 (validKeyInArray!0 (select (arr!15762 a!3235) j!176)))))

(declare-fun b!510058 () Bool)

(declare-fun res!310906 () Bool)

(assert (=> b!510058 (=> (not res!310906) (not e!298194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32767 (_ BitVec 32)) Bool)

(assert (=> b!510058 (= res!310906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510059 () Bool)

(declare-fun res!310905 () Bool)

(assert (=> b!510059 (=> (not res!310905) (not e!298197))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510059 (= res!310905 (and (= (size!16126 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16126 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16126 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510060 () Bool)

(assert (=> b!510060 (= e!298197 e!298194)))

(declare-fun res!310903 () Bool)

(assert (=> b!510060 (=> (not res!310903) (not e!298194))))

(declare-fun lt!233131 () SeekEntryResult!4229)

(assert (=> b!510060 (= res!310903 (or (= lt!233131 (MissingZero!4229 i!1204)) (= lt!233131 (MissingVacant!4229 i!1204))))))

(assert (=> b!510060 (= lt!233131 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510061 () Bool)

(declare-fun res!310904 () Bool)

(assert (=> b!510061 (=> (not res!310904) (not e!298197))))

(declare-fun arrayContainsKey!0 (array!32767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510061 (= res!310904 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510062 () Bool)

(assert (=> b!510062 (= e!298194 (not true))))

(declare-fun lt!233128 () (_ BitVec 32))

(declare-fun lt!233129 () SeekEntryResult!4229)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32767 (_ BitVec 32)) SeekEntryResult!4229)

(assert (=> b!510062 (= lt!233129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233128 (select (store (arr!15762 a!3235) i!1204 k!2280) j!176) (array!32768 (store (arr!15762 a!3235) i!1204 k!2280) (size!16126 a!3235)) mask!3524))))

(declare-fun lt!233127 () (_ BitVec 32))

(declare-fun lt!233126 () SeekEntryResult!4229)

(assert (=> b!510062 (= lt!233126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233127 (select (arr!15762 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510062 (= lt!233128 (toIndex!0 (select (store (arr!15762 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!510062 (= lt!233127 (toIndex!0 (select (arr!15762 a!3235) j!176) mask!3524))))

(assert (=> b!510062 e!298196))

(declare-fun res!310901 () Bool)

(assert (=> b!510062 (=> (not res!310901) (not e!298196))))

(assert (=> b!510062 (= res!310901 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15716 0))(
  ( (Unit!15717) )
))
(declare-fun lt!233130 () Unit!15716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15716)

(assert (=> b!510062 (= lt!233130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46056 res!310907) b!510059))

(assert (= (and b!510059 res!310905) b!510057))

(assert (= (and b!510057 res!310900) b!510055))

(assert (= (and b!510055 res!310902) b!510061))

(assert (= (and b!510061 res!310904) b!510060))

(assert (= (and b!510060 res!310903) b!510058))

(assert (= (and b!510058 res!310906) b!510056))

(assert (= (and b!510056 res!310899) b!510062))

(assert (= (and b!510062 res!310901) b!510054))

(declare-fun m!491145 () Bool)

(assert (=> b!510055 m!491145))

(declare-fun m!491147 () Bool)

(assert (=> b!510056 m!491147))

(declare-fun m!491149 () Bool)

(assert (=> b!510060 m!491149))

(declare-fun m!491151 () Bool)

(assert (=> b!510057 m!491151))

(assert (=> b!510057 m!491151))

(declare-fun m!491153 () Bool)

(assert (=> b!510057 m!491153))

(declare-fun m!491155 () Bool)

(assert (=> start!46056 m!491155))

(declare-fun m!491157 () Bool)

(assert (=> start!46056 m!491157))

(assert (=> b!510054 m!491151))

(assert (=> b!510054 m!491151))

(declare-fun m!491159 () Bool)

(assert (=> b!510054 m!491159))

(declare-fun m!491161 () Bool)

(assert (=> b!510058 m!491161))

(declare-fun m!491163 () Bool)

(assert (=> b!510062 m!491163))

(assert (=> b!510062 m!491151))

(declare-fun m!491165 () Bool)

(assert (=> b!510062 m!491165))

(declare-fun m!491167 () Bool)

(assert (=> b!510062 m!491167))

(declare-fun m!491169 () Bool)

(assert (=> b!510062 m!491169))

(declare-fun m!491171 () Bool)

(assert (=> b!510062 m!491171))

(assert (=> b!510062 m!491167))

(assert (=> b!510062 m!491151))

(declare-fun m!491173 () Bool)

(assert (=> b!510062 m!491173))

(assert (=> b!510062 m!491151))

(declare-fun m!491175 () Bool)

(assert (=> b!510062 m!491175))

(assert (=> b!510062 m!491167))

(declare-fun m!491177 () Bool)

(assert (=> b!510062 m!491177))

(declare-fun m!491179 () Bool)

(assert (=> b!510061 m!491179))

(push 1)

