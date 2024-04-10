; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46090 () Bool)

(assert start!46090)

(declare-fun res!311363 () Bool)

(declare-fun e!298398 () Bool)

(assert (=> start!46090 (=> (not res!311363) (not e!298398))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46090 (= res!311363 (validMask!0 mask!3524))))

(assert (=> start!46090 e!298398))

(assert (=> start!46090 true))

(declare-datatypes ((array!32801 0))(
  ( (array!32802 (arr!15779 (Array (_ BitVec 32) (_ BitVec 64))) (size!16143 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32801)

(declare-fun array_inv!11575 (array!32801) Bool)

(assert (=> start!46090 (array_inv!11575 a!3235)))

(declare-fun b!510513 () Bool)

(declare-fun e!298400 () Bool)

(assert (=> b!510513 (= e!298398 e!298400)))

(declare-fun res!311359 () Bool)

(assert (=> b!510513 (=> (not res!311359) (not e!298400))))

(declare-datatypes ((SeekEntryResult!4246 0))(
  ( (MissingZero!4246 (index!19172 (_ BitVec 32))) (Found!4246 (index!19173 (_ BitVec 32))) (Intermediate!4246 (undefined!5058 Bool) (index!19174 (_ BitVec 32)) (x!48127 (_ BitVec 32))) (Undefined!4246) (MissingVacant!4246 (index!19175 (_ BitVec 32))) )
))
(declare-fun lt!233432 () SeekEntryResult!4246)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510513 (= res!311359 (or (= lt!233432 (MissingZero!4246 i!1204)) (= lt!233432 (MissingVacant!4246 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32801 (_ BitVec 32)) SeekEntryResult!4246)

(assert (=> b!510513 (= lt!233432 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510514 () Bool)

(declare-fun res!311365 () Bool)

(assert (=> b!510514 (=> (not res!311365) (not e!298398))))

(declare-fun arrayContainsKey!0 (array!32801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510514 (= res!311365 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510515 () Bool)

(declare-fun res!311361 () Bool)

(assert (=> b!510515 (=> (not res!311361) (not e!298398))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510515 (= res!311361 (validKeyInArray!0 (select (arr!15779 a!3235) j!176)))))

(declare-fun b!510516 () Bool)

(declare-fun res!311360 () Bool)

(assert (=> b!510516 (=> (not res!311360) (not e!298398))))

(assert (=> b!510516 (= res!311360 (and (= (size!16143 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16143 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16143 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510517 () Bool)

(declare-fun e!298401 () Bool)

(assert (=> b!510517 (= e!298401 true)))

(declare-fun lt!233435 () array!32801)

(declare-fun lt!233434 () SeekEntryResult!4246)

(declare-fun lt!233437 () (_ BitVec 64))

(assert (=> b!510517 (= lt!233434 (seekEntryOrOpen!0 lt!233437 lt!233435 mask!3524))))

(declare-datatypes ((Unit!15750 0))(
  ( (Unit!15751) )
))
(declare-fun lt!233436 () Unit!15750)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15750)

(assert (=> b!510517 (= lt!233436 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510518 () Bool)

(declare-fun res!311362 () Bool)

(assert (=> b!510518 (=> (not res!311362) (not e!298400))))

(declare-datatypes ((List!9937 0))(
  ( (Nil!9934) (Cons!9933 (h!10810 (_ BitVec 64)) (t!16165 List!9937)) )
))
(declare-fun arrayNoDuplicates!0 (array!32801 (_ BitVec 32) List!9937) Bool)

(assert (=> b!510518 (= res!311362 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9934))))

(declare-fun b!510519 () Bool)

(declare-fun res!311358 () Bool)

(assert (=> b!510519 (=> (not res!311358) (not e!298400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32801 (_ BitVec 32)) Bool)

(assert (=> b!510519 (= res!311358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510520 () Bool)

(declare-fun res!311366 () Bool)

(assert (=> b!510520 (=> (not res!311366) (not e!298398))))

(assert (=> b!510520 (= res!311366 (validKeyInArray!0 k!2280))))

(declare-fun b!510521 () Bool)

(assert (=> b!510521 (= e!298400 (not e!298401))))

(declare-fun res!311364 () Bool)

(assert (=> b!510521 (=> res!311364 e!298401)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32801 (_ BitVec 32)) SeekEntryResult!4246)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510521 (= res!311364 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15779 a!3235) j!176) mask!3524) (select (arr!15779 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233437 mask!3524) lt!233437 lt!233435 mask!3524))))))

(assert (=> b!510521 (= lt!233437 (select (store (arr!15779 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510521 (= lt!233435 (array!32802 (store (arr!15779 a!3235) i!1204 k!2280) (size!16143 a!3235)))))

(assert (=> b!510521 (= lt!233434 (Found!4246 j!176))))

(assert (=> b!510521 (= lt!233434 (seekEntryOrOpen!0 (select (arr!15779 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510521 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233433 () Unit!15750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15750)

(assert (=> b!510521 (= lt!233433 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46090 res!311363) b!510516))

(assert (= (and b!510516 res!311360) b!510515))

(assert (= (and b!510515 res!311361) b!510520))

(assert (= (and b!510520 res!311366) b!510514))

(assert (= (and b!510514 res!311365) b!510513))

(assert (= (and b!510513 res!311359) b!510519))

(assert (= (and b!510519 res!311358) b!510518))

(assert (= (and b!510518 res!311362) b!510521))

(assert (= (and b!510521 (not res!311364)) b!510517))

(declare-fun m!491813 () Bool)

(assert (=> b!510518 m!491813))

(declare-fun m!491815 () Bool)

(assert (=> b!510517 m!491815))

(declare-fun m!491817 () Bool)

(assert (=> b!510517 m!491817))

(declare-fun m!491819 () Bool)

(assert (=> b!510519 m!491819))

(declare-fun m!491821 () Bool)

(assert (=> b!510513 m!491821))

(declare-fun m!491823 () Bool)

(assert (=> b!510521 m!491823))

(declare-fun m!491825 () Bool)

(assert (=> b!510521 m!491825))

(declare-fun m!491827 () Bool)

(assert (=> b!510521 m!491827))

(declare-fun m!491829 () Bool)

(assert (=> b!510521 m!491829))

(declare-fun m!491831 () Bool)

(assert (=> b!510521 m!491831))

(assert (=> b!510521 m!491829))

(assert (=> b!510521 m!491827))

(assert (=> b!510521 m!491829))

(declare-fun m!491833 () Bool)

(assert (=> b!510521 m!491833))

(assert (=> b!510521 m!491829))

(declare-fun m!491835 () Bool)

(assert (=> b!510521 m!491835))

(declare-fun m!491837 () Bool)

(assert (=> b!510521 m!491837))

(declare-fun m!491839 () Bool)

(assert (=> b!510521 m!491839))

(assert (=> b!510521 m!491837))

(declare-fun m!491841 () Bool)

(assert (=> b!510521 m!491841))

(declare-fun m!491843 () Bool)

(assert (=> b!510520 m!491843))

(assert (=> b!510515 m!491829))

(assert (=> b!510515 m!491829))

(declare-fun m!491845 () Bool)

(assert (=> b!510515 m!491845))

(declare-fun m!491847 () Bool)

(assert (=> start!46090 m!491847))

(declare-fun m!491849 () Bool)

(assert (=> start!46090 m!491849))

(declare-fun m!491851 () Bool)

(assert (=> b!510514 m!491851))

(push 1)

