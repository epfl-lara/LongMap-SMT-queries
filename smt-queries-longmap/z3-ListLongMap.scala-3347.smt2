; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46076 () Bool)

(assert start!46076)

(declare-fun b!510324 () Bool)

(declare-fun e!298317 () Bool)

(declare-fun e!298315 () Bool)

(assert (=> b!510324 (= e!298317 (not e!298315))))

(declare-fun res!311170 () Bool)

(assert (=> b!510324 (=> res!311170 e!298315)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32787 0))(
  ( (array!32788 (arr!15772 (Array (_ BitVec 32) (_ BitVec 64))) (size!16136 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32787)

(declare-fun lt!233306 () array!32787)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!233307 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4239 0))(
  ( (MissingZero!4239 (index!19144 (_ BitVec 32))) (Found!4239 (index!19145 (_ BitVec 32))) (Intermediate!4239 (undefined!5051 Bool) (index!19146 (_ BitVec 32)) (x!48104 (_ BitVec 32))) (Undefined!4239) (MissingVacant!4239 (index!19147 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32787 (_ BitVec 32)) SeekEntryResult!4239)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510324 (= res!311170 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15772 a!3235) j!176) mask!3524) (select (arr!15772 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233307 mask!3524) lt!233307 lt!233306 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510324 (= lt!233307 (select (store (arr!15772 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510324 (= lt!233306 (array!32788 (store (arr!15772 a!3235) i!1204 k0!2280) (size!16136 a!3235)))))

(declare-fun lt!233309 () SeekEntryResult!4239)

(assert (=> b!510324 (= lt!233309 (Found!4239 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32787 (_ BitVec 32)) SeekEntryResult!4239)

(assert (=> b!510324 (= lt!233309 (seekEntryOrOpen!0 (select (arr!15772 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32787 (_ BitVec 32)) Bool)

(assert (=> b!510324 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15736 0))(
  ( (Unit!15737) )
))
(declare-fun lt!233310 () Unit!15736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15736)

(assert (=> b!510324 (= lt!233310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510325 () Bool)

(declare-fun res!311169 () Bool)

(declare-fun e!298316 () Bool)

(assert (=> b!510325 (=> (not res!311169) (not e!298316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510325 (= res!311169 (validKeyInArray!0 (select (arr!15772 a!3235) j!176)))))

(declare-fun b!510326 () Bool)

(declare-fun res!311176 () Bool)

(assert (=> b!510326 (=> (not res!311176) (not e!298316))))

(assert (=> b!510326 (= res!311176 (validKeyInArray!0 k0!2280))))

(declare-fun b!510328 () Bool)

(declare-fun res!311174 () Bool)

(assert (=> b!510328 (=> (not res!311174) (not e!298317))))

(assert (=> b!510328 (= res!311174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510329 () Bool)

(declare-fun res!311173 () Bool)

(assert (=> b!510329 (=> (not res!311173) (not e!298317))))

(declare-datatypes ((List!9930 0))(
  ( (Nil!9927) (Cons!9926 (h!10803 (_ BitVec 64)) (t!16158 List!9930)) )
))
(declare-fun arrayNoDuplicates!0 (array!32787 (_ BitVec 32) List!9930) Bool)

(assert (=> b!510329 (= res!311173 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9927))))

(declare-fun b!510330 () Bool)

(declare-fun res!311177 () Bool)

(assert (=> b!510330 (=> (not res!311177) (not e!298316))))

(assert (=> b!510330 (= res!311177 (and (= (size!16136 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16136 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16136 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510331 () Bool)

(assert (=> b!510331 (= e!298316 e!298317)))

(declare-fun res!311175 () Bool)

(assert (=> b!510331 (=> (not res!311175) (not e!298317))))

(declare-fun lt!233311 () SeekEntryResult!4239)

(assert (=> b!510331 (= res!311175 (or (= lt!233311 (MissingZero!4239 i!1204)) (= lt!233311 (MissingVacant!4239 i!1204))))))

(assert (=> b!510331 (= lt!233311 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510332 () Bool)

(assert (=> b!510332 (= e!298315 true)))

(assert (=> b!510332 (= lt!233309 (seekEntryOrOpen!0 lt!233307 lt!233306 mask!3524))))

(declare-fun lt!233308 () Unit!15736)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32787 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15736)

(assert (=> b!510332 (= lt!233308 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun res!311172 () Bool)

(assert (=> start!46076 (=> (not res!311172) (not e!298316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46076 (= res!311172 (validMask!0 mask!3524))))

(assert (=> start!46076 e!298316))

(assert (=> start!46076 true))

(declare-fun array_inv!11568 (array!32787) Bool)

(assert (=> start!46076 (array_inv!11568 a!3235)))

(declare-fun b!510327 () Bool)

(declare-fun res!311171 () Bool)

(assert (=> b!510327 (=> (not res!311171) (not e!298316))))

(declare-fun arrayContainsKey!0 (array!32787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510327 (= res!311171 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46076 res!311172) b!510330))

(assert (= (and b!510330 res!311177) b!510325))

(assert (= (and b!510325 res!311169) b!510326))

(assert (= (and b!510326 res!311176) b!510327))

(assert (= (and b!510327 res!311171) b!510331))

(assert (= (and b!510331 res!311175) b!510328))

(assert (= (and b!510328 res!311174) b!510329))

(assert (= (and b!510329 res!311173) b!510324))

(assert (= (and b!510324 (not res!311170)) b!510332))

(declare-fun m!491533 () Bool)

(assert (=> b!510325 m!491533))

(assert (=> b!510325 m!491533))

(declare-fun m!491535 () Bool)

(assert (=> b!510325 m!491535))

(declare-fun m!491537 () Bool)

(assert (=> b!510324 m!491537))

(declare-fun m!491539 () Bool)

(assert (=> b!510324 m!491539))

(declare-fun m!491541 () Bool)

(assert (=> b!510324 m!491541))

(assert (=> b!510324 m!491533))

(declare-fun m!491543 () Bool)

(assert (=> b!510324 m!491543))

(assert (=> b!510324 m!491533))

(declare-fun m!491545 () Bool)

(assert (=> b!510324 m!491545))

(declare-fun m!491547 () Bool)

(assert (=> b!510324 m!491547))

(assert (=> b!510324 m!491533))

(declare-fun m!491549 () Bool)

(assert (=> b!510324 m!491549))

(assert (=> b!510324 m!491543))

(assert (=> b!510324 m!491533))

(declare-fun m!491551 () Bool)

(assert (=> b!510324 m!491551))

(assert (=> b!510324 m!491545))

(declare-fun m!491553 () Bool)

(assert (=> b!510324 m!491553))

(declare-fun m!491555 () Bool)

(assert (=> b!510329 m!491555))

(declare-fun m!491557 () Bool)

(assert (=> b!510327 m!491557))

(declare-fun m!491559 () Bool)

(assert (=> start!46076 m!491559))

(declare-fun m!491561 () Bool)

(assert (=> start!46076 m!491561))

(declare-fun m!491563 () Bool)

(assert (=> b!510328 m!491563))

(declare-fun m!491565 () Bool)

(assert (=> b!510326 m!491565))

(declare-fun m!491567 () Bool)

(assert (=> b!510331 m!491567))

(declare-fun m!491569 () Bool)

(assert (=> b!510332 m!491569))

(declare-fun m!491571 () Bool)

(assert (=> b!510332 m!491571))

(check-sat (not b!510326) (not b!510331) (not start!46076) (not b!510328) (not b!510324) (not b!510329) (not b!510332) (not b!510327) (not b!510325))
(check-sat)
