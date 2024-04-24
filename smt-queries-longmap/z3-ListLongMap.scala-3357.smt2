; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46184 () Bool)

(assert start!46184)

(declare-fun b!511339 () Bool)

(declare-fun res!312063 () Bool)

(declare-fun e!298811 () Bool)

(assert (=> b!511339 (=> res!312063 e!298811)))

(declare-datatypes ((SeekEntryResult!4219 0))(
  ( (MissingZero!4219 (index!19064 (_ BitVec 32))) (Found!4219 (index!19065 (_ BitVec 32))) (Intermediate!4219 (undefined!5031 Bool) (index!19066 (_ BitVec 32)) (x!48167 (_ BitVec 32))) (Undefined!4219) (MissingVacant!4219 (index!19067 (_ BitVec 32))) )
))
(declare-fun lt!233974 () SeekEntryResult!4219)

(get-info :version)

(assert (=> b!511339 (= res!312063 (or (not ((_ is Intermediate!4219) lt!233974)) (not (undefined!5031 lt!233974))))))

(declare-fun b!511341 () Bool)

(declare-fun res!312059 () Bool)

(declare-fun e!298810 () Bool)

(assert (=> b!511341 (=> (not res!312059) (not e!298810))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32839 0))(
  ( (array!32840 (arr!15796 (Array (_ BitVec 32) (_ BitVec 64))) (size!16160 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32839)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511341 (= res!312059 (and (= (size!16160 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16160 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16160 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511342 () Bool)

(declare-fun res!312060 () Bool)

(assert (=> b!511342 (=> (not res!312060) (not e!298810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511342 (= res!312060 (validKeyInArray!0 (select (arr!15796 a!3235) j!176)))))

(declare-fun b!511343 () Bool)

(declare-fun res!312064 () Bool)

(declare-fun e!298809 () Bool)

(assert (=> b!511343 (=> (not res!312064) (not e!298809))))

(declare-datatypes ((List!9861 0))(
  ( (Nil!9858) (Cons!9857 (h!10737 (_ BitVec 64)) (t!16081 List!9861)) )
))
(declare-fun arrayNoDuplicates!0 (array!32839 (_ BitVec 32) List!9861) Bool)

(assert (=> b!511343 (= res!312064 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9858))))

(declare-fun b!511344 () Bool)

(assert (=> b!511344 (= e!298811 true)))

(declare-fun lt!233973 () SeekEntryResult!4219)

(assert (=> b!511344 (= lt!233973 Undefined!4219)))

(declare-fun b!511345 () Bool)

(declare-fun res!312055 () Bool)

(assert (=> b!511345 (=> (not res!312055) (not e!298809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32839 (_ BitVec 32)) Bool)

(assert (=> b!511345 (= res!312055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511346 () Bool)

(assert (=> b!511346 (= e!298810 e!298809)))

(declare-fun res!312062 () Bool)

(assert (=> b!511346 (=> (not res!312062) (not e!298809))))

(declare-fun lt!233970 () SeekEntryResult!4219)

(assert (=> b!511346 (= res!312062 (or (= lt!233970 (MissingZero!4219 i!1204)) (= lt!233970 (MissingVacant!4219 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32839 (_ BitVec 32)) SeekEntryResult!4219)

(assert (=> b!511346 (= lt!233970 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511347 () Bool)

(assert (=> b!511347 (= e!298809 (not e!298811))))

(declare-fun res!312061 () Bool)

(assert (=> b!511347 (=> res!312061 e!298811)))

(declare-fun lt!233971 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32839 (_ BitVec 32)) SeekEntryResult!4219)

(assert (=> b!511347 (= res!312061 (= lt!233974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233971 (select (store (arr!15796 a!3235) i!1204 k0!2280) j!176) (array!32840 (store (arr!15796 a!3235) i!1204 k0!2280) (size!16160 a!3235)) mask!3524)))))

(declare-fun lt!233972 () (_ BitVec 32))

(assert (=> b!511347 (= lt!233974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233972 (select (arr!15796 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511347 (= lt!233971 (toIndex!0 (select (store (arr!15796 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511347 (= lt!233972 (toIndex!0 (select (arr!15796 a!3235) j!176) mask!3524))))

(assert (=> b!511347 (= lt!233973 (Found!4219 j!176))))

(assert (=> b!511347 (= lt!233973 (seekEntryOrOpen!0 (select (arr!15796 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511347 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15757 0))(
  ( (Unit!15758) )
))
(declare-fun lt!233969 () Unit!15757)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32839 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15757)

(assert (=> b!511347 (= lt!233969 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511348 () Bool)

(declare-fun res!312056 () Bool)

(assert (=> b!511348 (=> (not res!312056) (not e!298810))))

(assert (=> b!511348 (= res!312056 (validKeyInArray!0 k0!2280))))

(declare-fun b!511340 () Bool)

(declare-fun res!312058 () Bool)

(assert (=> b!511340 (=> (not res!312058) (not e!298810))))

(declare-fun arrayContainsKey!0 (array!32839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511340 (= res!312058 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!312057 () Bool)

(assert (=> start!46184 (=> (not res!312057) (not e!298810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46184 (= res!312057 (validMask!0 mask!3524))))

(assert (=> start!46184 e!298810))

(assert (=> start!46184 true))

(declare-fun array_inv!11655 (array!32839) Bool)

(assert (=> start!46184 (array_inv!11655 a!3235)))

(assert (= (and start!46184 res!312057) b!511341))

(assert (= (and b!511341 res!312059) b!511342))

(assert (= (and b!511342 res!312060) b!511348))

(assert (= (and b!511348 res!312056) b!511340))

(assert (= (and b!511340 res!312058) b!511346))

(assert (= (and b!511346 res!312062) b!511345))

(assert (= (and b!511345 res!312055) b!511343))

(assert (= (and b!511343 res!312064) b!511347))

(assert (= (and b!511347 (not res!312061)) b!511339))

(assert (= (and b!511339 (not res!312063)) b!511344))

(declare-fun m!493033 () Bool)

(assert (=> b!511343 m!493033))

(declare-fun m!493035 () Bool)

(assert (=> b!511345 m!493035))

(declare-fun m!493037 () Bool)

(assert (=> b!511346 m!493037))

(declare-fun m!493039 () Bool)

(assert (=> start!46184 m!493039))

(declare-fun m!493041 () Bool)

(assert (=> start!46184 m!493041))

(declare-fun m!493043 () Bool)

(assert (=> b!511340 m!493043))

(declare-fun m!493045 () Bool)

(assert (=> b!511347 m!493045))

(declare-fun m!493047 () Bool)

(assert (=> b!511347 m!493047))

(declare-fun m!493049 () Bool)

(assert (=> b!511347 m!493049))

(declare-fun m!493051 () Bool)

(assert (=> b!511347 m!493051))

(declare-fun m!493053 () Bool)

(assert (=> b!511347 m!493053))

(assert (=> b!511347 m!493045))

(declare-fun m!493055 () Bool)

(assert (=> b!511347 m!493055))

(assert (=> b!511347 m!493053))

(declare-fun m!493057 () Bool)

(assert (=> b!511347 m!493057))

(assert (=> b!511347 m!493045))

(declare-fun m!493059 () Bool)

(assert (=> b!511347 m!493059))

(assert (=> b!511347 m!493045))

(declare-fun m!493061 () Bool)

(assert (=> b!511347 m!493061))

(assert (=> b!511347 m!493053))

(declare-fun m!493063 () Bool)

(assert (=> b!511347 m!493063))

(declare-fun m!493065 () Bool)

(assert (=> b!511348 m!493065))

(assert (=> b!511342 m!493045))

(assert (=> b!511342 m!493045))

(declare-fun m!493067 () Bool)

(assert (=> b!511342 m!493067))

(check-sat (not b!511340) (not start!46184) (not b!511347) (not b!511345) (not b!511348) (not b!511346) (not b!511342) (not b!511343))
(check-sat)
