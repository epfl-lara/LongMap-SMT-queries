; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46206 () Bool)

(assert start!46206)

(declare-fun b!511580 () Bool)

(declare-fun e!298920 () Bool)

(declare-fun e!298922 () Bool)

(assert (=> b!511580 (= e!298920 e!298922)))

(declare-fun res!312246 () Bool)

(assert (=> b!511580 (=> (not res!312246) (not e!298922))))

(declare-datatypes ((SeekEntryResult!4274 0))(
  ( (MissingZero!4274 (index!19284 (_ BitVec 32))) (Found!4274 (index!19285 (_ BitVec 32))) (Intermediate!4274 (undefined!5086 Bool) (index!19286 (_ BitVec 32)) (x!48241 (_ BitVec 32))) (Undefined!4274) (MissingVacant!4274 (index!19287 (_ BitVec 32))) )
))
(declare-fun lt!234066 () SeekEntryResult!4274)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511580 (= res!312246 (or (= lt!234066 (MissingZero!4274 i!1204)) (= lt!234066 (MissingVacant!4274 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((array!32860 0))(
  ( (array!32861 (arr!15807 (Array (_ BitVec 32) (_ BitVec 64))) (size!16171 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32860)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32860 (_ BitVec 32)) SeekEntryResult!4274)

(assert (=> b!511580 (= lt!234066 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511581 () Bool)

(declare-fun res!312251 () Bool)

(assert (=> b!511581 (=> (not res!312251) (not e!298920))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511581 (= res!312251 (and (= (size!16171 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16171 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16171 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511582 () Bool)

(declare-fun res!312247 () Bool)

(assert (=> b!511582 (=> (not res!312247) (not e!298922))))

(declare-datatypes ((List!9965 0))(
  ( (Nil!9962) (Cons!9961 (h!10841 (_ BitVec 64)) (t!16193 List!9965)) )
))
(declare-fun arrayNoDuplicates!0 (array!32860 (_ BitVec 32) List!9965) Bool)

(assert (=> b!511582 (= res!312247 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9962))))

(declare-fun res!312248 () Bool)

(assert (=> start!46206 (=> (not res!312248) (not e!298920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46206 (= res!312248 (validMask!0 mask!3524))))

(assert (=> start!46206 e!298920))

(assert (=> start!46206 true))

(declare-fun array_inv!11603 (array!32860) Bool)

(assert (=> start!46206 (array_inv!11603 a!3235)))

(declare-fun b!511583 () Bool)

(declare-fun e!298923 () Bool)

(assert (=> b!511583 (= e!298923 (bvsle #b00000000000000000000000000000000 (size!16171 a!3235)))))

(declare-fun lt!234065 () SeekEntryResult!4274)

(assert (=> b!511583 (= lt!234065 Undefined!4274)))

(declare-fun b!511584 () Bool)

(declare-fun res!312242 () Bool)

(assert (=> b!511584 (=> (not res!312242) (not e!298920))))

(declare-fun arrayContainsKey!0 (array!32860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511584 (= res!312242 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511585 () Bool)

(declare-fun res!312244 () Bool)

(assert (=> b!511585 (=> (not res!312244) (not e!298920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511585 (= res!312244 (validKeyInArray!0 (select (arr!15807 a!3235) j!176)))))

(declare-fun b!511586 () Bool)

(declare-fun res!312249 () Bool)

(assert (=> b!511586 (=> (not res!312249) (not e!298922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32860 (_ BitVec 32)) Bool)

(assert (=> b!511586 (= res!312249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511587 () Bool)

(assert (=> b!511587 (= e!298922 (not e!298923))))

(declare-fun res!312243 () Bool)

(assert (=> b!511587 (=> res!312243 e!298923)))

(declare-fun lt!234068 () (_ BitVec 32))

(declare-fun lt!234069 () SeekEntryResult!4274)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32860 (_ BitVec 32)) SeekEntryResult!4274)

(assert (=> b!511587 (= res!312243 (= lt!234069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234068 (select (store (arr!15807 a!3235) i!1204 k!2280) j!176) (array!32861 (store (arr!15807 a!3235) i!1204 k!2280) (size!16171 a!3235)) mask!3524)))))

(declare-fun lt!234070 () (_ BitVec 32))

(assert (=> b!511587 (= lt!234069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234070 (select (arr!15807 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511587 (= lt!234068 (toIndex!0 (select (store (arr!15807 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511587 (= lt!234070 (toIndex!0 (select (arr!15807 a!3235) j!176) mask!3524))))

(assert (=> b!511587 (= lt!234065 (Found!4274 j!176))))

(assert (=> b!511587 (= lt!234065 (seekEntryOrOpen!0 (select (arr!15807 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511587 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15806 0))(
  ( (Unit!15807) )
))
(declare-fun lt!234067 () Unit!15806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15806)

(assert (=> b!511587 (= lt!234067 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511588 () Bool)

(declare-fun res!312250 () Bool)

(assert (=> b!511588 (=> res!312250 e!298923)))

(assert (=> b!511588 (= res!312250 (or (not (is-Intermediate!4274 lt!234069)) (not (undefined!5086 lt!234069))))))

(declare-fun b!511589 () Bool)

(declare-fun res!312245 () Bool)

(assert (=> b!511589 (=> (not res!312245) (not e!298920))))

(assert (=> b!511589 (= res!312245 (validKeyInArray!0 k!2280))))

(assert (= (and start!46206 res!312248) b!511581))

(assert (= (and b!511581 res!312251) b!511585))

(assert (= (and b!511585 res!312244) b!511589))

(assert (= (and b!511589 res!312245) b!511584))

(assert (= (and b!511584 res!312242) b!511580))

(assert (= (and b!511580 res!312246) b!511586))

(assert (= (and b!511586 res!312249) b!511582))

(assert (= (and b!511582 res!312247) b!511587))

(assert (= (and b!511587 (not res!312243)) b!511588))

(assert (= (and b!511588 (not res!312250)) b!511583))

(declare-fun m!493065 () Bool)

(assert (=> b!511584 m!493065))

(declare-fun m!493067 () Bool)

(assert (=> b!511580 m!493067))

(declare-fun m!493069 () Bool)

(assert (=> b!511586 m!493069))

(declare-fun m!493071 () Bool)

(assert (=> b!511582 m!493071))

(declare-fun m!493073 () Bool)

(assert (=> b!511587 m!493073))

(declare-fun m!493075 () Bool)

(assert (=> b!511587 m!493075))

(declare-fun m!493077 () Bool)

(assert (=> b!511587 m!493077))

(declare-fun m!493079 () Bool)

(assert (=> b!511587 m!493079))

(declare-fun m!493081 () Bool)

(assert (=> b!511587 m!493081))

(assert (=> b!511587 m!493079))

(declare-fun m!493083 () Bool)

(assert (=> b!511587 m!493083))

(assert (=> b!511587 m!493077))

(declare-fun m!493085 () Bool)

(assert (=> b!511587 m!493085))

(assert (=> b!511587 m!493079))

(declare-fun m!493087 () Bool)

(assert (=> b!511587 m!493087))

(assert (=> b!511587 m!493077))

(declare-fun m!493089 () Bool)

(assert (=> b!511587 m!493089))

(assert (=> b!511587 m!493079))

(declare-fun m!493091 () Bool)

(assert (=> b!511587 m!493091))

(assert (=> b!511585 m!493079))

(assert (=> b!511585 m!493079))

(declare-fun m!493093 () Bool)

(assert (=> b!511585 m!493093))

(declare-fun m!493095 () Bool)

(assert (=> b!511589 m!493095))

(declare-fun m!493097 () Bool)

(assert (=> start!46206 m!493097))

(declare-fun m!493099 () Bool)

(assert (=> start!46206 m!493099))

(push 1)

