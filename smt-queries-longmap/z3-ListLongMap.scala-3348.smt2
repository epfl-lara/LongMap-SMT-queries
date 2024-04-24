; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46070 () Bool)

(assert start!46070)

(declare-fun b!510317 () Bool)

(declare-fun res!311216 () Bool)

(declare-fun e!298299 () Bool)

(assert (=> b!510317 (=> (not res!311216) (not e!298299))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510317 (= res!311216 (validKeyInArray!0 k0!2280))))

(declare-fun b!510318 () Bool)

(declare-fun res!311217 () Bool)

(assert (=> b!510318 (=> (not res!311217) (not e!298299))))

(declare-datatypes ((array!32782 0))(
  ( (array!32783 (arr!15769 (Array (_ BitVec 32) (_ BitVec 64))) (size!16133 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32782)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510318 (= res!311217 (validKeyInArray!0 (select (arr!15769 a!3235) j!176)))))

(declare-fun b!510319 () Bool)

(declare-fun res!311223 () Bool)

(declare-fun e!298301 () Bool)

(assert (=> b!510319 (=> (not res!311223) (not e!298301))))

(declare-datatypes ((List!9834 0))(
  ( (Nil!9831) (Cons!9830 (h!10707 (_ BitVec 64)) (t!16054 List!9834)) )
))
(declare-fun arrayNoDuplicates!0 (array!32782 (_ BitVec 32) List!9834) Bool)

(assert (=> b!510319 (= res!311223 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9831))))

(declare-fun b!510320 () Bool)

(declare-fun e!298302 () Bool)

(assert (=> b!510320 (= e!298302 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!233358 () array!32782)

(declare-fun lt!233359 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4192 0))(
  ( (MissingZero!4192 (index!18956 (_ BitVec 32))) (Found!4192 (index!18957 (_ BitVec 32))) (Intermediate!4192 (undefined!5004 Bool) (index!18958 (_ BitVec 32)) (x!48062 (_ BitVec 32))) (Undefined!4192) (MissingVacant!4192 (index!18959 (_ BitVec 32))) )
))
(declare-fun lt!233355 () SeekEntryResult!4192)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32782 (_ BitVec 32)) SeekEntryResult!4192)

(assert (=> b!510320 (= lt!233355 (seekEntryOrOpen!0 lt!233359 lt!233358 mask!3524))))

(declare-datatypes ((Unit!15703 0))(
  ( (Unit!15704) )
))
(declare-fun lt!233357 () Unit!15703)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32782 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15703)

(assert (=> b!510320 (= lt!233357 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun res!311219 () Bool)

(assert (=> start!46070 (=> (not res!311219) (not e!298299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46070 (= res!311219 (validMask!0 mask!3524))))

(assert (=> start!46070 e!298299))

(assert (=> start!46070 true))

(declare-fun array_inv!11628 (array!32782) Bool)

(assert (=> start!46070 (array_inv!11628 a!3235)))

(declare-fun b!510321 () Bool)

(declare-fun res!311218 () Bool)

(assert (=> b!510321 (=> (not res!311218) (not e!298299))))

(declare-fun arrayContainsKey!0 (array!32782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510321 (= res!311218 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510322 () Bool)

(declare-fun res!311224 () Bool)

(assert (=> b!510322 (=> (not res!311224) (not e!298301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32782 (_ BitVec 32)) Bool)

(assert (=> b!510322 (= res!311224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510323 () Bool)

(assert (=> b!510323 (= e!298299 e!298301)))

(declare-fun res!311222 () Bool)

(assert (=> b!510323 (=> (not res!311222) (not e!298301))))

(declare-fun lt!233354 () SeekEntryResult!4192)

(assert (=> b!510323 (= res!311222 (or (= lt!233354 (MissingZero!4192 i!1204)) (= lt!233354 (MissingVacant!4192 i!1204))))))

(assert (=> b!510323 (= lt!233354 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510324 () Bool)

(declare-fun res!311221 () Bool)

(assert (=> b!510324 (=> (not res!311221) (not e!298299))))

(assert (=> b!510324 (= res!311221 (and (= (size!16133 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16133 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16133 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510325 () Bool)

(assert (=> b!510325 (= e!298301 (not e!298302))))

(declare-fun res!311220 () Bool)

(assert (=> b!510325 (=> res!311220 e!298302)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32782 (_ BitVec 32)) SeekEntryResult!4192)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510325 (= res!311220 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15769 a!3235) j!176) mask!3524) (select (arr!15769 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233359 mask!3524) lt!233359 lt!233358 mask!3524))))))

(assert (=> b!510325 (= lt!233359 (select (store (arr!15769 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510325 (= lt!233358 (array!32783 (store (arr!15769 a!3235) i!1204 k0!2280) (size!16133 a!3235)))))

(assert (=> b!510325 (= lt!233355 (Found!4192 j!176))))

(assert (=> b!510325 (= lt!233355 (seekEntryOrOpen!0 (select (arr!15769 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510325 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233356 () Unit!15703)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15703)

(assert (=> b!510325 (= lt!233356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46070 res!311219) b!510324))

(assert (= (and b!510324 res!311221) b!510318))

(assert (= (and b!510318 res!311217) b!510317))

(assert (= (and b!510317 res!311216) b!510321))

(assert (= (and b!510321 res!311218) b!510323))

(assert (= (and b!510323 res!311222) b!510322))

(assert (= (and b!510322 res!311224) b!510319))

(assert (= (and b!510319 res!311223) b!510325))

(assert (= (and b!510325 (not res!311220)) b!510320))

(declare-fun m!491797 () Bool)

(assert (=> b!510317 m!491797))

(declare-fun m!491799 () Bool)

(assert (=> start!46070 m!491799))

(declare-fun m!491801 () Bool)

(assert (=> start!46070 m!491801))

(declare-fun m!491803 () Bool)

(assert (=> b!510319 m!491803))

(declare-fun m!491805 () Bool)

(assert (=> b!510323 m!491805))

(declare-fun m!491807 () Bool)

(assert (=> b!510325 m!491807))

(declare-fun m!491809 () Bool)

(assert (=> b!510325 m!491809))

(declare-fun m!491811 () Bool)

(assert (=> b!510325 m!491811))

(declare-fun m!491813 () Bool)

(assert (=> b!510325 m!491813))

(declare-fun m!491815 () Bool)

(assert (=> b!510325 m!491815))

(declare-fun m!491817 () Bool)

(assert (=> b!510325 m!491817))

(declare-fun m!491819 () Bool)

(assert (=> b!510325 m!491819))

(assert (=> b!510325 m!491817))

(assert (=> b!510325 m!491815))

(assert (=> b!510325 m!491817))

(declare-fun m!491821 () Bool)

(assert (=> b!510325 m!491821))

(assert (=> b!510325 m!491817))

(declare-fun m!491823 () Bool)

(assert (=> b!510325 m!491823))

(assert (=> b!510325 m!491807))

(declare-fun m!491825 () Bool)

(assert (=> b!510325 m!491825))

(declare-fun m!491827 () Bool)

(assert (=> b!510320 m!491827))

(declare-fun m!491829 () Bool)

(assert (=> b!510320 m!491829))

(assert (=> b!510318 m!491817))

(assert (=> b!510318 m!491817))

(declare-fun m!491831 () Bool)

(assert (=> b!510318 m!491831))

(declare-fun m!491833 () Bool)

(assert (=> b!510321 m!491833))

(declare-fun m!491835 () Bool)

(assert (=> b!510322 m!491835))

(check-sat (not b!510322) (not b!510320) (not start!46070) (not b!510319) (not b!510318) (not b!510317) (not b!510323) (not b!510321) (not b!510325))
(check-sat)
