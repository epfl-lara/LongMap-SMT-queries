; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45768 () Bool)

(assert start!45768)

(declare-fun b!506455 () Bool)

(declare-fun e!296430 () Bool)

(assert (=> b!506455 (= e!296430 true)))

(assert (=> b!506455 false))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32524 0))(
  ( (array!32525 (arr!15642 (Array (_ BitVec 32) (_ BitVec 64))) (size!16006 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32524)

(declare-fun b!506456 () Bool)

(declare-fun e!296427 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4109 0))(
  ( (MissingZero!4109 (index!18624 (_ BitVec 32))) (Found!4109 (index!18625 (_ BitVec 32))) (Intermediate!4109 (undefined!4921 Bool) (index!18626 (_ BitVec 32)) (x!47630 (_ BitVec 32))) (Undefined!4109) (MissingVacant!4109 (index!18627 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32524 (_ BitVec 32)) SeekEntryResult!4109)

(assert (=> b!506456 (= e!296427 (= (seekEntryOrOpen!0 (select (arr!15642 a!3235) j!176) a!3235 mask!3524) (Found!4109 j!176)))))

(declare-fun b!506457 () Bool)

(declare-fun res!307415 () Bool)

(declare-fun e!296428 () Bool)

(assert (=> b!506457 (=> (not res!307415) (not e!296428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506457 (= res!307415 (validKeyInArray!0 (select (arr!15642 a!3235) j!176)))))

(declare-fun b!506458 () Bool)

(declare-fun res!307421 () Bool)

(declare-fun e!296425 () Bool)

(assert (=> b!506458 (=> (not res!307421) (not e!296425))))

(declare-datatypes ((List!9800 0))(
  ( (Nil!9797) (Cons!9796 (h!10673 (_ BitVec 64)) (t!16028 List!9800)) )
))
(declare-fun arrayNoDuplicates!0 (array!32524 (_ BitVec 32) List!9800) Bool)

(assert (=> b!506458 (= res!307421 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9797))))

(declare-fun b!506459 () Bool)

(declare-fun res!307420 () Bool)

(assert (=> b!506459 (=> (not res!307420) (not e!296428))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!506459 (= res!307420 (validKeyInArray!0 k!2280))))

(declare-fun res!307423 () Bool)

(assert (=> start!45768 (=> (not res!307423) (not e!296428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45768 (= res!307423 (validMask!0 mask!3524))))

(assert (=> start!45768 e!296428))

(assert (=> start!45768 true))

(declare-fun array_inv!11438 (array!32524) Bool)

(assert (=> start!45768 (array_inv!11438 a!3235)))

(declare-fun b!506460 () Bool)

(declare-fun e!296426 () Bool)

(assert (=> b!506460 (= e!296426 e!296430)))

(declare-fun res!307424 () Bool)

(assert (=> b!506460 (=> res!307424 e!296430)))

(declare-fun lt!231105 () Bool)

(declare-fun lt!231103 () SeekEntryResult!4109)

(assert (=> b!506460 (= res!307424 (or (and (not lt!231105) (undefined!4921 lt!231103)) (and (not lt!231105) (not (undefined!4921 lt!231103)))))))

(assert (=> b!506460 (= lt!231105 (not (is-Intermediate!4109 lt!231103)))))

(declare-fun b!506461 () Bool)

(declare-fun res!307422 () Bool)

(assert (=> b!506461 (=> (not res!307422) (not e!296425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32524 (_ BitVec 32)) Bool)

(assert (=> b!506461 (= res!307422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506462 () Bool)

(declare-fun res!307416 () Bool)

(assert (=> b!506462 (=> (not res!307416) (not e!296428))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506462 (= res!307416 (and (= (size!16006 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16006 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16006 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506463 () Bool)

(assert (=> b!506463 (= e!296425 (not e!296426))))

(declare-fun res!307418 () Bool)

(assert (=> b!506463 (=> res!307418 e!296426)))

(declare-fun lt!231101 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32524 (_ BitVec 32)) SeekEntryResult!4109)

(assert (=> b!506463 (= res!307418 (= lt!231103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231101 (select (store (arr!15642 a!3235) i!1204 k!2280) j!176) (array!32525 (store (arr!15642 a!3235) i!1204 k!2280) (size!16006 a!3235)) mask!3524)))))

(declare-fun lt!231104 () (_ BitVec 32))

(assert (=> b!506463 (= lt!231103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231104 (select (arr!15642 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506463 (= lt!231101 (toIndex!0 (select (store (arr!15642 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506463 (= lt!231104 (toIndex!0 (select (arr!15642 a!3235) j!176) mask!3524))))

(assert (=> b!506463 e!296427))

(declare-fun res!307417 () Bool)

(assert (=> b!506463 (=> (not res!307417) (not e!296427))))

(assert (=> b!506463 (= res!307417 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15506 0))(
  ( (Unit!15507) )
))
(declare-fun lt!231102 () Unit!15506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15506)

(assert (=> b!506463 (= lt!231102 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506464 () Bool)

(assert (=> b!506464 (= e!296428 e!296425)))

(declare-fun res!307419 () Bool)

(assert (=> b!506464 (=> (not res!307419) (not e!296425))))

(declare-fun lt!231106 () SeekEntryResult!4109)

(assert (=> b!506464 (= res!307419 (or (= lt!231106 (MissingZero!4109 i!1204)) (= lt!231106 (MissingVacant!4109 i!1204))))))

(assert (=> b!506464 (= lt!231106 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506465 () Bool)

(declare-fun res!307414 () Bool)

(assert (=> b!506465 (=> (not res!307414) (not e!296428))))

(declare-fun arrayContainsKey!0 (array!32524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506465 (= res!307414 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45768 res!307423) b!506462))

(assert (= (and b!506462 res!307416) b!506457))

(assert (= (and b!506457 res!307415) b!506459))

(assert (= (and b!506459 res!307420) b!506465))

(assert (= (and b!506465 res!307414) b!506464))

(assert (= (and b!506464 res!307419) b!506461))

(assert (= (and b!506461 res!307422) b!506458))

(assert (= (and b!506458 res!307421) b!506463))

(assert (= (and b!506463 res!307417) b!506456))

(assert (= (and b!506463 (not res!307418)) b!506460))

(assert (= (and b!506460 (not res!307424)) b!506455))

(declare-fun m!487119 () Bool)

(assert (=> b!506465 m!487119))

(declare-fun m!487121 () Bool)

(assert (=> b!506464 m!487121))

(declare-fun m!487123 () Bool)

(assert (=> b!506461 m!487123))

(declare-fun m!487125 () Bool)

(assert (=> start!45768 m!487125))

(declare-fun m!487127 () Bool)

(assert (=> start!45768 m!487127))

(declare-fun m!487129 () Bool)

(assert (=> b!506457 m!487129))

(assert (=> b!506457 m!487129))

(declare-fun m!487131 () Bool)

(assert (=> b!506457 m!487131))

(declare-fun m!487133 () Bool)

(assert (=> b!506458 m!487133))

(assert (=> b!506456 m!487129))

(assert (=> b!506456 m!487129))

(declare-fun m!487135 () Bool)

(assert (=> b!506456 m!487135))

(declare-fun m!487137 () Bool)

(assert (=> b!506459 m!487137))

(declare-fun m!487139 () Bool)

(assert (=> b!506463 m!487139))

(declare-fun m!487141 () Bool)

(assert (=> b!506463 m!487141))

(declare-fun m!487143 () Bool)

(assert (=> b!506463 m!487143))

(assert (=> b!506463 m!487143))

(declare-fun m!487145 () Bool)

(assert (=> b!506463 m!487145))

(assert (=> b!506463 m!487129))

(declare-fun m!487147 () Bool)

(assert (=> b!506463 m!487147))

(assert (=> b!506463 m!487129))

(assert (=> b!506463 m!487143))

(declare-fun m!487149 () Bool)

(assert (=> b!506463 m!487149))

(assert (=> b!506463 m!487129))

(declare-fun m!487151 () Bool)

(assert (=> b!506463 m!487151))

(declare-fun m!487153 () Bool)

(assert (=> b!506463 m!487153))

(push 1)

