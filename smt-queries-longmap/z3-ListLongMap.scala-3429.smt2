; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47696 () Bool)

(assert start!47696)

(declare-fun b!524407 () Bool)

(declare-fun e!305840 () Bool)

(assert (=> b!524407 (= e!305840 true)))

(declare-datatypes ((array!33333 0))(
  ( (array!33334 (arr!16018 (Array (_ BitVec 32) (_ BitVec 64))) (size!16382 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33333)

(declare-datatypes ((SeekEntryResult!4485 0))(
  ( (MissingZero!4485 (index!20152 (_ BitVec 32))) (Found!4485 (index!20153 (_ BitVec 32))) (Intermediate!4485 (undefined!5297 Bool) (index!20154 (_ BitVec 32)) (x!49138 (_ BitVec 32))) (Undefined!4485) (MissingVacant!4485 (index!20155 (_ BitVec 32))) )
))
(declare-fun lt!240672 () SeekEntryResult!4485)

(assert (=> b!524407 (and (or (= (select (arr!16018 a!3235) (index!20154 lt!240672)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16018 a!3235) (index!20154 lt!240672)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16018 a!3235) (index!20154 lt!240672)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16018 a!3235) (index!20154 lt!240672)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16392 0))(
  ( (Unit!16393) )
))
(declare-fun lt!240670 () Unit!16392)

(declare-fun e!305843 () Unit!16392)

(assert (=> b!524407 (= lt!240670 e!305843)))

(declare-fun c!61850 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!524407 (= c!61850 (= (select (arr!16018 a!3235) (index!20154 lt!240672)) (select (arr!16018 a!3235) j!176)))))

(assert (=> b!524407 (and (bvslt (x!49138 lt!240672) #b01111111111111111111111111111110) (or (= (select (arr!16018 a!3235) (index!20154 lt!240672)) (select (arr!16018 a!3235) j!176)) (= (select (arr!16018 a!3235) (index!20154 lt!240672)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16018 a!3235) (index!20154 lt!240672)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524408 () Bool)

(declare-fun res!321322 () Bool)

(assert (=> b!524408 (=> res!321322 e!305840)))

(get-info :version)

(assert (=> b!524408 (= res!321322 (or (undefined!5297 lt!240672) (not ((_ is Intermediate!4485) lt!240672))))))

(declare-fun res!321328 () Bool)

(declare-fun e!305842 () Bool)

(assert (=> start!47696 (=> (not res!321328) (not e!305842))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47696 (= res!321328 (validMask!0 mask!3524))))

(assert (=> start!47696 e!305842))

(assert (=> start!47696 true))

(declare-fun array_inv!11814 (array!33333) Bool)

(assert (=> start!47696 (array_inv!11814 a!3235)))

(declare-fun b!524409 () Bool)

(declare-fun res!321321 () Bool)

(declare-fun e!305839 () Bool)

(assert (=> b!524409 (=> (not res!321321) (not e!305839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33333 (_ BitVec 32)) Bool)

(assert (=> b!524409 (= res!321321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524410 () Bool)

(declare-fun Unit!16394 () Unit!16392)

(assert (=> b!524410 (= e!305843 Unit!16394)))

(declare-fun e!305838 () Bool)

(declare-fun b!524411 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33333 (_ BitVec 32)) SeekEntryResult!4485)

(assert (=> b!524411 (= e!305838 (= (seekEntryOrOpen!0 (select (arr!16018 a!3235) j!176) a!3235 mask!3524) (Found!4485 j!176)))))

(declare-fun b!524412 () Bool)

(declare-fun res!321327 () Bool)

(assert (=> b!524412 (=> (not res!321327) (not e!305842))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524412 (= res!321327 (validKeyInArray!0 k0!2280))))

(declare-fun b!524413 () Bool)

(assert (=> b!524413 (= e!305839 (not e!305840))))

(declare-fun res!321323 () Bool)

(assert (=> b!524413 (=> res!321323 e!305840)))

(declare-fun lt!240676 () array!33333)

(declare-fun lt!240675 () (_ BitVec 64))

(declare-fun lt!240674 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33333 (_ BitVec 32)) SeekEntryResult!4485)

(assert (=> b!524413 (= res!321323 (= lt!240672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240674 lt!240675 lt!240676 mask!3524)))))

(declare-fun lt!240673 () (_ BitVec 32))

(assert (=> b!524413 (= lt!240672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240673 (select (arr!16018 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524413 (= lt!240674 (toIndex!0 lt!240675 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524413 (= lt!240675 (select (store (arr!16018 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524413 (= lt!240673 (toIndex!0 (select (arr!16018 a!3235) j!176) mask!3524))))

(assert (=> b!524413 (= lt!240676 (array!33334 (store (arr!16018 a!3235) i!1204 k0!2280) (size!16382 a!3235)))))

(assert (=> b!524413 e!305838))

(declare-fun res!321318 () Bool)

(assert (=> b!524413 (=> (not res!321318) (not e!305838))))

(assert (=> b!524413 (= res!321318 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240671 () Unit!16392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16392)

(assert (=> b!524413 (= lt!240671 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524414 () Bool)

(declare-fun res!321329 () Bool)

(assert (=> b!524414 (=> (not res!321329) (not e!305842))))

(assert (=> b!524414 (= res!321329 (and (= (size!16382 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16382 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16382 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524415 () Bool)

(declare-fun Unit!16395 () Unit!16392)

(assert (=> b!524415 (= e!305843 Unit!16395)))

(declare-fun lt!240668 () Unit!16392)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33333 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16392)

(assert (=> b!524415 (= lt!240668 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240673 #b00000000000000000000000000000000 (index!20154 lt!240672) (x!49138 lt!240672) mask!3524))))

(declare-fun res!321325 () Bool)

(assert (=> b!524415 (= res!321325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240673 lt!240675 lt!240676 mask!3524) (Intermediate!4485 false (index!20154 lt!240672) (x!49138 lt!240672))))))

(declare-fun e!305844 () Bool)

(assert (=> b!524415 (=> (not res!321325) (not e!305844))))

(assert (=> b!524415 e!305844))

(declare-fun b!524416 () Bool)

(assert (=> b!524416 (= e!305844 false)))

(declare-fun b!524417 () Bool)

(assert (=> b!524417 (= e!305842 e!305839)))

(declare-fun res!321324 () Bool)

(assert (=> b!524417 (=> (not res!321324) (not e!305839))))

(declare-fun lt!240669 () SeekEntryResult!4485)

(assert (=> b!524417 (= res!321324 (or (= lt!240669 (MissingZero!4485 i!1204)) (= lt!240669 (MissingVacant!4485 i!1204))))))

(assert (=> b!524417 (= lt!240669 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524418 () Bool)

(declare-fun res!321319 () Bool)

(assert (=> b!524418 (=> (not res!321319) (not e!305842))))

(declare-fun arrayContainsKey!0 (array!33333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524418 (= res!321319 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524419 () Bool)

(declare-fun res!321320 () Bool)

(assert (=> b!524419 (=> (not res!321320) (not e!305842))))

(assert (=> b!524419 (= res!321320 (validKeyInArray!0 (select (arr!16018 a!3235) j!176)))))

(declare-fun b!524420 () Bool)

(declare-fun res!321326 () Bool)

(assert (=> b!524420 (=> (not res!321326) (not e!305839))))

(declare-datatypes ((List!10176 0))(
  ( (Nil!10173) (Cons!10172 (h!11103 (_ BitVec 64)) (t!16404 List!10176)) )
))
(declare-fun arrayNoDuplicates!0 (array!33333 (_ BitVec 32) List!10176) Bool)

(assert (=> b!524420 (= res!321326 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10173))))

(assert (= (and start!47696 res!321328) b!524414))

(assert (= (and b!524414 res!321329) b!524419))

(assert (= (and b!524419 res!321320) b!524412))

(assert (= (and b!524412 res!321327) b!524418))

(assert (= (and b!524418 res!321319) b!524417))

(assert (= (and b!524417 res!321324) b!524409))

(assert (= (and b!524409 res!321321) b!524420))

(assert (= (and b!524420 res!321326) b!524413))

(assert (= (and b!524413 res!321318) b!524411))

(assert (= (and b!524413 (not res!321323)) b!524408))

(assert (= (and b!524408 (not res!321322)) b!524407))

(assert (= (and b!524407 c!61850) b!524415))

(assert (= (and b!524407 (not c!61850)) b!524410))

(assert (= (and b!524415 res!321325) b!524416))

(declare-fun m!505041 () Bool)

(assert (=> b!524411 m!505041))

(assert (=> b!524411 m!505041))

(declare-fun m!505043 () Bool)

(assert (=> b!524411 m!505043))

(declare-fun m!505045 () Bool)

(assert (=> b!524420 m!505045))

(declare-fun m!505047 () Bool)

(assert (=> b!524413 m!505047))

(declare-fun m!505049 () Bool)

(assert (=> b!524413 m!505049))

(declare-fun m!505051 () Bool)

(assert (=> b!524413 m!505051))

(assert (=> b!524413 m!505041))

(declare-fun m!505053 () Bool)

(assert (=> b!524413 m!505053))

(assert (=> b!524413 m!505041))

(declare-fun m!505055 () Bool)

(assert (=> b!524413 m!505055))

(assert (=> b!524413 m!505041))

(declare-fun m!505057 () Bool)

(assert (=> b!524413 m!505057))

(declare-fun m!505059 () Bool)

(assert (=> b!524413 m!505059))

(declare-fun m!505061 () Bool)

(assert (=> b!524413 m!505061))

(declare-fun m!505063 () Bool)

(assert (=> b!524409 m!505063))

(declare-fun m!505065 () Bool)

(assert (=> b!524412 m!505065))

(declare-fun m!505067 () Bool)

(assert (=> b!524418 m!505067))

(declare-fun m!505069 () Bool)

(assert (=> b!524407 m!505069))

(assert (=> b!524407 m!505041))

(assert (=> b!524419 m!505041))

(assert (=> b!524419 m!505041))

(declare-fun m!505071 () Bool)

(assert (=> b!524419 m!505071))

(declare-fun m!505073 () Bool)

(assert (=> b!524415 m!505073))

(declare-fun m!505075 () Bool)

(assert (=> b!524415 m!505075))

(declare-fun m!505077 () Bool)

(assert (=> b!524417 m!505077))

(declare-fun m!505079 () Bool)

(assert (=> start!47696 m!505079))

(declare-fun m!505081 () Bool)

(assert (=> start!47696 m!505081))

(check-sat (not b!524415) (not b!524420) (not b!524417) (not b!524413) (not b!524412) (not b!524411) (not b!524419) (not start!47696) (not b!524409) (not b!524418))
(check-sat)
