; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47892 () Bool)

(assert start!47892)

(declare-fun b!527328 () Bool)

(declare-fun res!323783 () Bool)

(declare-fun e!307316 () Bool)

(assert (=> b!527328 (=> (not res!323783) (not e!307316))))

(declare-datatypes ((array!33470 0))(
  ( (array!33471 (arr!16085 (Array (_ BitVec 32) (_ BitVec 64))) (size!16450 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33470)

(declare-datatypes ((List!10282 0))(
  ( (Nil!10279) (Cons!10278 (h!11212 (_ BitVec 64)) (t!16501 List!10282)) )
))
(declare-fun arrayNoDuplicates!0 (array!33470 (_ BitVec 32) List!10282) Bool)

(assert (=> b!527328 (= res!323783 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10279))))

(declare-fun b!527329 () Bool)

(declare-fun e!307312 () Bool)

(assert (=> b!527329 (= e!307312 e!307316)))

(declare-fun res!323778 () Bool)

(assert (=> b!527329 (=> (not res!323778) (not e!307316))))

(declare-datatypes ((SeekEntryResult!4549 0))(
  ( (MissingZero!4549 (index!20414 (_ BitVec 32))) (Found!4549 (index!20415 (_ BitVec 32))) (Intermediate!4549 (undefined!5361 Bool) (index!20416 (_ BitVec 32)) (x!49393 (_ BitVec 32))) (Undefined!4549) (MissingVacant!4549 (index!20417 (_ BitVec 32))) )
))
(declare-fun lt!242626 () SeekEntryResult!4549)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527329 (= res!323778 (or (= lt!242626 (MissingZero!4549 i!1204)) (= lt!242626 (MissingVacant!4549 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33470 (_ BitVec 32)) SeekEntryResult!4549)

(assert (=> b!527329 (= lt!242626 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527330 () Bool)

(declare-datatypes ((Unit!16642 0))(
  ( (Unit!16643) )
))
(declare-fun e!307314 () Unit!16642)

(declare-fun Unit!16644 () Unit!16642)

(assert (=> b!527330 (= e!307314 Unit!16644)))

(declare-fun lt!242632 () Unit!16642)

(declare-fun lt!242624 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242630 () SeekEntryResult!4549)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16642)

(assert (=> b!527330 (= lt!242632 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242624 #b00000000000000000000000000000000 (index!20416 lt!242630) (x!49393 lt!242630) mask!3524))))

(declare-fun res!323774 () Bool)

(declare-fun lt!242631 () (_ BitVec 64))

(declare-fun lt!242627 () array!33470)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33470 (_ BitVec 32)) SeekEntryResult!4549)

(assert (=> b!527330 (= res!323774 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242624 lt!242631 lt!242627 mask!3524) (Intermediate!4549 false (index!20416 lt!242630) (x!49393 lt!242630))))))

(declare-fun e!307317 () Bool)

(assert (=> b!527330 (=> (not res!323774) (not e!307317))))

(assert (=> b!527330 e!307317))

(declare-fun b!527332 () Bool)

(declare-fun e!307313 () Bool)

(assert (=> b!527332 (= e!307316 (not e!307313))))

(declare-fun res!323779 () Bool)

(assert (=> b!527332 (=> res!323779 e!307313)))

(declare-fun lt!242623 () (_ BitVec 32))

(assert (=> b!527332 (= res!323779 (= lt!242630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242623 lt!242631 lt!242627 mask!3524)))))

(assert (=> b!527332 (= lt!242630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242624 (select (arr!16085 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527332 (= lt!242623 (toIndex!0 lt!242631 mask!3524))))

(assert (=> b!527332 (= lt!242631 (select (store (arr!16085 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527332 (= lt!242624 (toIndex!0 (select (arr!16085 a!3235) j!176) mask!3524))))

(assert (=> b!527332 (= lt!242627 (array!33471 (store (arr!16085 a!3235) i!1204 k0!2280) (size!16450 a!3235)))))

(declare-fun e!307315 () Bool)

(assert (=> b!527332 e!307315))

(declare-fun res!323773 () Bool)

(assert (=> b!527332 (=> (not res!323773) (not e!307315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33470 (_ BitVec 32)) Bool)

(assert (=> b!527332 (= res!323773 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242628 () Unit!16642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16642)

(assert (=> b!527332 (= lt!242628 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527333 () Bool)

(declare-fun res!323772 () Bool)

(assert (=> b!527333 (=> (not res!323772) (not e!307312))))

(declare-fun arrayContainsKey!0 (array!33470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527333 (= res!323772 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527334 () Bool)

(declare-fun res!323781 () Bool)

(assert (=> b!527334 (=> (not res!323781) (not e!307316))))

(assert (=> b!527334 (= res!323781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527335 () Bool)

(assert (=> b!527335 (= e!307313 true)))

(assert (=> b!527335 (= (index!20416 lt!242630) i!1204)))

(declare-fun lt!242625 () Unit!16642)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16642)

(assert (=> b!527335 (= lt!242625 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242624 #b00000000000000000000000000000000 (index!20416 lt!242630) (x!49393 lt!242630) mask!3524))))

(assert (=> b!527335 (and (or (= (select (arr!16085 a!3235) (index!20416 lt!242630)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16085 a!3235) (index!20416 lt!242630)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16085 a!3235) (index!20416 lt!242630)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16085 a!3235) (index!20416 lt!242630)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242629 () Unit!16642)

(assert (=> b!527335 (= lt!242629 e!307314)))

(declare-fun c!62085 () Bool)

(assert (=> b!527335 (= c!62085 (= (select (arr!16085 a!3235) (index!20416 lt!242630)) (select (arr!16085 a!3235) j!176)))))

(assert (=> b!527335 (and (bvslt (x!49393 lt!242630) #b01111111111111111111111111111110) (or (= (select (arr!16085 a!3235) (index!20416 lt!242630)) (select (arr!16085 a!3235) j!176)) (= (select (arr!16085 a!3235) (index!20416 lt!242630)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16085 a!3235) (index!20416 lt!242630)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527336 () Bool)

(declare-fun res!323782 () Bool)

(assert (=> b!527336 (=> (not res!323782) (not e!307312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527336 (= res!323782 (validKeyInArray!0 k0!2280))))

(declare-fun b!527337 () Bool)

(declare-fun res!323775 () Bool)

(assert (=> b!527337 (=> (not res!323775) (not e!307312))))

(assert (=> b!527337 (= res!323775 (validKeyInArray!0 (select (arr!16085 a!3235) j!176)))))

(declare-fun b!527338 () Bool)

(assert (=> b!527338 (= e!307317 false)))

(declare-fun b!527339 () Bool)

(assert (=> b!527339 (= e!307315 (= (seekEntryOrOpen!0 (select (arr!16085 a!3235) j!176) a!3235 mask!3524) (Found!4549 j!176)))))

(declare-fun b!527331 () Bool)

(declare-fun res!323776 () Bool)

(assert (=> b!527331 (=> (not res!323776) (not e!307312))))

(assert (=> b!527331 (= res!323776 (and (= (size!16450 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16450 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16450 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!323777 () Bool)

(assert (=> start!47892 (=> (not res!323777) (not e!307312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47892 (= res!323777 (validMask!0 mask!3524))))

(assert (=> start!47892 e!307312))

(assert (=> start!47892 true))

(declare-fun array_inv!11968 (array!33470) Bool)

(assert (=> start!47892 (array_inv!11968 a!3235)))

(declare-fun b!527340 () Bool)

(declare-fun res!323780 () Bool)

(assert (=> b!527340 (=> res!323780 e!307313)))

(get-info :version)

(assert (=> b!527340 (= res!323780 (or (undefined!5361 lt!242630) (not ((_ is Intermediate!4549) lt!242630))))))

(declare-fun b!527341 () Bool)

(declare-fun Unit!16645 () Unit!16642)

(assert (=> b!527341 (= e!307314 Unit!16645)))

(assert (= (and start!47892 res!323777) b!527331))

(assert (= (and b!527331 res!323776) b!527337))

(assert (= (and b!527337 res!323775) b!527336))

(assert (= (and b!527336 res!323782) b!527333))

(assert (= (and b!527333 res!323772) b!527329))

(assert (= (and b!527329 res!323778) b!527334))

(assert (= (and b!527334 res!323781) b!527328))

(assert (= (and b!527328 res!323783) b!527332))

(assert (= (and b!527332 res!323773) b!527339))

(assert (= (and b!527332 (not res!323779)) b!527340))

(assert (= (and b!527340 (not res!323780)) b!527335))

(assert (= (and b!527335 c!62085) b!527330))

(assert (= (and b!527335 (not c!62085)) b!527341))

(assert (= (and b!527330 res!323774) b!527338))

(declare-fun m!507505 () Bool)

(assert (=> b!527335 m!507505))

(declare-fun m!507507 () Bool)

(assert (=> b!527335 m!507507))

(declare-fun m!507509 () Bool)

(assert (=> b!527335 m!507509))

(declare-fun m!507511 () Bool)

(assert (=> b!527330 m!507511))

(declare-fun m!507513 () Bool)

(assert (=> b!527330 m!507513))

(declare-fun m!507515 () Bool)

(assert (=> b!527333 m!507515))

(assert (=> b!527339 m!507509))

(assert (=> b!527339 m!507509))

(declare-fun m!507517 () Bool)

(assert (=> b!527339 m!507517))

(declare-fun m!507519 () Bool)

(assert (=> b!527334 m!507519))

(declare-fun m!507521 () Bool)

(assert (=> b!527336 m!507521))

(assert (=> b!527337 m!507509))

(assert (=> b!527337 m!507509))

(declare-fun m!507523 () Bool)

(assert (=> b!527337 m!507523))

(declare-fun m!507525 () Bool)

(assert (=> start!47892 m!507525))

(declare-fun m!507527 () Bool)

(assert (=> start!47892 m!507527))

(declare-fun m!507529 () Bool)

(assert (=> b!527332 m!507529))

(declare-fun m!507531 () Bool)

(assert (=> b!527332 m!507531))

(declare-fun m!507533 () Bool)

(assert (=> b!527332 m!507533))

(assert (=> b!527332 m!507509))

(declare-fun m!507535 () Bool)

(assert (=> b!527332 m!507535))

(assert (=> b!527332 m!507509))

(declare-fun m!507537 () Bool)

(assert (=> b!527332 m!507537))

(assert (=> b!527332 m!507509))

(declare-fun m!507539 () Bool)

(assert (=> b!527332 m!507539))

(declare-fun m!507541 () Bool)

(assert (=> b!527332 m!507541))

(declare-fun m!507543 () Bool)

(assert (=> b!527332 m!507543))

(declare-fun m!507545 () Bool)

(assert (=> b!527328 m!507545))

(declare-fun m!507547 () Bool)

(assert (=> b!527329 m!507547))

(check-sat (not b!527334) (not b!527330) (not b!527339) (not b!527337) (not b!527332) (not b!527335) (not b!527336) (not start!47892) (not b!527329) (not b!527328) (not b!527333))
(check-sat)
