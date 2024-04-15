; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47742 () Bool)

(assert start!47742)

(declare-fun b!525363 () Bool)

(declare-datatypes ((Unit!16486 0))(
  ( (Unit!16487) )
))
(declare-fun e!306288 () Unit!16486)

(declare-fun Unit!16488 () Unit!16486)

(assert (=> b!525363 (= e!306288 Unit!16488)))

(declare-fun lt!241300 () (_ BitVec 32))

(declare-fun lt!241308 () Unit!16486)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4510 0))(
  ( (MissingZero!4510 (index!20252 (_ BitVec 32))) (Found!4510 (index!20253 (_ BitVec 32))) (Intermediate!4510 (undefined!5322 Bool) (index!20254 (_ BitVec 32)) (x!49238 (_ BitVec 32))) (Undefined!4510) (MissingVacant!4510 (index!20255 (_ BitVec 32))) )
))
(declare-fun lt!241304 () SeekEntryResult!4510)

(declare-datatypes ((array!33389 0))(
  ( (array!33390 (arr!16046 (Array (_ BitVec 32) (_ BitVec 64))) (size!16411 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33389)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16486)

(assert (=> b!525363 (= lt!241308 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241300 #b00000000000000000000000000000000 (index!20254 lt!241304) (x!49238 lt!241304) mask!3524))))

(declare-fun lt!241305 () (_ BitVec 64))

(declare-fun lt!241306 () array!33389)

(declare-fun res!322252 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33389 (_ BitVec 32)) SeekEntryResult!4510)

(assert (=> b!525363 (= res!322252 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241300 lt!241305 lt!241306 mask!3524) (Intermediate!4510 false (index!20254 lt!241304) (x!49238 lt!241304))))))

(declare-fun e!306285 () Bool)

(assert (=> b!525363 (=> (not res!322252) (not e!306285))))

(assert (=> b!525363 e!306285))

(declare-fun b!525364 () Bool)

(declare-fun e!306283 () Bool)

(declare-fun e!306284 () Bool)

(assert (=> b!525364 (= e!306283 e!306284)))

(declare-fun res!322250 () Bool)

(assert (=> b!525364 (=> (not res!322250) (not e!306284))))

(declare-fun lt!241301 () SeekEntryResult!4510)

(assert (=> b!525364 (= res!322250 (or (= lt!241301 (MissingZero!4510 i!1204)) (= lt!241301 (MissingVacant!4510 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33389 (_ BitVec 32)) SeekEntryResult!4510)

(assert (=> b!525364 (= lt!241301 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525365 () Bool)

(declare-fun e!306287 () Bool)

(assert (=> b!525365 (= e!306284 (not e!306287))))

(declare-fun res!322251 () Bool)

(assert (=> b!525365 (=> res!322251 e!306287)))

(declare-fun lt!241307 () (_ BitVec 32))

(assert (=> b!525365 (= res!322251 (= lt!241304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241307 lt!241305 lt!241306 mask!3524)))))

(assert (=> b!525365 (= lt!241304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241300 (select (arr!16046 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525365 (= lt!241307 (toIndex!0 lt!241305 mask!3524))))

(assert (=> b!525365 (= lt!241305 (select (store (arr!16046 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525365 (= lt!241300 (toIndex!0 (select (arr!16046 a!3235) j!176) mask!3524))))

(assert (=> b!525365 (= lt!241306 (array!33390 (store (arr!16046 a!3235) i!1204 k0!2280) (size!16411 a!3235)))))

(declare-fun e!306286 () Bool)

(assert (=> b!525365 e!306286))

(declare-fun res!322245 () Bool)

(assert (=> b!525365 (=> (not res!322245) (not e!306286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33389 (_ BitVec 32)) Bool)

(assert (=> b!525365 (= res!322245 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241309 () Unit!16486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16486)

(assert (=> b!525365 (= lt!241309 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525366 () Bool)

(declare-fun res!322249 () Bool)

(assert (=> b!525366 (=> (not res!322249) (not e!306283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525366 (= res!322249 (validKeyInArray!0 (select (arr!16046 a!3235) j!176)))))

(declare-fun b!525367 () Bool)

(declare-fun res!322247 () Bool)

(assert (=> b!525367 (=> (not res!322247) (not e!306283))))

(declare-fun arrayContainsKey!0 (array!33389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525367 (= res!322247 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525368 () Bool)

(assert (=> b!525368 (= e!306287 true)))

(assert (=> b!525368 (= (index!20254 lt!241304) i!1204)))

(declare-fun lt!241303 () Unit!16486)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16486)

(assert (=> b!525368 (= lt!241303 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241300 #b00000000000000000000000000000000 (index!20254 lt!241304) (x!49238 lt!241304) mask!3524))))

(assert (=> b!525368 (and (or (= (select (arr!16046 a!3235) (index!20254 lt!241304)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16046 a!3235) (index!20254 lt!241304)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16046 a!3235) (index!20254 lt!241304)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16046 a!3235) (index!20254 lt!241304)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241302 () Unit!16486)

(assert (=> b!525368 (= lt!241302 e!306288)))

(declare-fun c!61866 () Bool)

(assert (=> b!525368 (= c!61866 (= (select (arr!16046 a!3235) (index!20254 lt!241304)) (select (arr!16046 a!3235) j!176)))))

(assert (=> b!525368 (and (bvslt (x!49238 lt!241304) #b01111111111111111111111111111110) (or (= (select (arr!16046 a!3235) (index!20254 lt!241304)) (select (arr!16046 a!3235) j!176)) (= (select (arr!16046 a!3235) (index!20254 lt!241304)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16046 a!3235) (index!20254 lt!241304)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525369 () Bool)

(assert (=> b!525369 (= e!306285 false)))

(declare-fun b!525371 () Bool)

(declare-fun res!322253 () Bool)

(assert (=> b!525371 (=> (not res!322253) (not e!306283))))

(assert (=> b!525371 (= res!322253 (and (= (size!16411 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16411 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16411 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525370 () Bool)

(declare-fun Unit!16489 () Unit!16486)

(assert (=> b!525370 (= e!306288 Unit!16489)))

(declare-fun res!322248 () Bool)

(assert (=> start!47742 (=> (not res!322248) (not e!306283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47742 (= res!322248 (validMask!0 mask!3524))))

(assert (=> start!47742 e!306283))

(assert (=> start!47742 true))

(declare-fun array_inv!11929 (array!33389) Bool)

(assert (=> start!47742 (array_inv!11929 a!3235)))

(declare-fun b!525372 () Bool)

(declare-fun res!322244 () Bool)

(assert (=> b!525372 (=> (not res!322244) (not e!306283))))

(assert (=> b!525372 (= res!322244 (validKeyInArray!0 k0!2280))))

(declare-fun b!525373 () Bool)

(assert (=> b!525373 (= e!306286 (= (seekEntryOrOpen!0 (select (arr!16046 a!3235) j!176) a!3235 mask!3524) (Found!4510 j!176)))))

(declare-fun b!525374 () Bool)

(declare-fun res!322242 () Bool)

(assert (=> b!525374 (=> (not res!322242) (not e!306284))))

(declare-datatypes ((List!10243 0))(
  ( (Nil!10240) (Cons!10239 (h!11170 (_ BitVec 64)) (t!16462 List!10243)) )
))
(declare-fun arrayNoDuplicates!0 (array!33389 (_ BitVec 32) List!10243) Bool)

(assert (=> b!525374 (= res!322242 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10240))))

(declare-fun b!525375 () Bool)

(declare-fun res!322243 () Bool)

(assert (=> b!525375 (=> res!322243 e!306287)))

(get-info :version)

(assert (=> b!525375 (= res!322243 (or (undefined!5322 lt!241304) (not ((_ is Intermediate!4510) lt!241304))))))

(declare-fun b!525376 () Bool)

(declare-fun res!322246 () Bool)

(assert (=> b!525376 (=> (not res!322246) (not e!306284))))

(assert (=> b!525376 (= res!322246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47742 res!322248) b!525371))

(assert (= (and b!525371 res!322253) b!525366))

(assert (= (and b!525366 res!322249) b!525372))

(assert (= (and b!525372 res!322244) b!525367))

(assert (= (and b!525367 res!322247) b!525364))

(assert (= (and b!525364 res!322250) b!525376))

(assert (= (and b!525376 res!322246) b!525374))

(assert (= (and b!525374 res!322242) b!525365))

(assert (= (and b!525365 res!322245) b!525373))

(assert (= (and b!525365 (not res!322251)) b!525375))

(assert (= (and b!525375 (not res!322243)) b!525368))

(assert (= (and b!525368 c!61866) b!525363))

(assert (= (and b!525368 (not c!61866)) b!525370))

(assert (= (and b!525363 res!322252) b!525369))

(declare-fun m!505549 () Bool)

(assert (=> b!525363 m!505549))

(declare-fun m!505551 () Bool)

(assert (=> b!525363 m!505551))

(declare-fun m!505553 () Bool)

(assert (=> b!525372 m!505553))

(declare-fun m!505555 () Bool)

(assert (=> b!525376 m!505555))

(declare-fun m!505557 () Bool)

(assert (=> b!525368 m!505557))

(declare-fun m!505559 () Bool)

(assert (=> b!525368 m!505559))

(declare-fun m!505561 () Bool)

(assert (=> b!525368 m!505561))

(declare-fun m!505563 () Bool)

(assert (=> b!525367 m!505563))

(declare-fun m!505565 () Bool)

(assert (=> b!525364 m!505565))

(declare-fun m!505567 () Bool)

(assert (=> start!47742 m!505567))

(declare-fun m!505569 () Bool)

(assert (=> start!47742 m!505569))

(declare-fun m!505571 () Bool)

(assert (=> b!525374 m!505571))

(declare-fun m!505573 () Bool)

(assert (=> b!525365 m!505573))

(declare-fun m!505575 () Bool)

(assert (=> b!525365 m!505575))

(declare-fun m!505577 () Bool)

(assert (=> b!525365 m!505577))

(declare-fun m!505579 () Bool)

(assert (=> b!525365 m!505579))

(assert (=> b!525365 m!505561))

(declare-fun m!505581 () Bool)

(assert (=> b!525365 m!505581))

(declare-fun m!505583 () Bool)

(assert (=> b!525365 m!505583))

(assert (=> b!525365 m!505561))

(declare-fun m!505585 () Bool)

(assert (=> b!525365 m!505585))

(assert (=> b!525365 m!505561))

(declare-fun m!505587 () Bool)

(assert (=> b!525365 m!505587))

(assert (=> b!525366 m!505561))

(assert (=> b!525366 m!505561))

(declare-fun m!505589 () Bool)

(assert (=> b!525366 m!505589))

(assert (=> b!525373 m!505561))

(assert (=> b!525373 m!505561))

(declare-fun m!505591 () Bool)

(assert (=> b!525373 m!505591))

(check-sat (not b!525365) (not b!525376) (not b!525367) (not b!525372) (not b!525373) (not b!525374) (not b!525368) (not b!525364) (not b!525366) (not b!525363) (not start!47742))
(check-sat)
