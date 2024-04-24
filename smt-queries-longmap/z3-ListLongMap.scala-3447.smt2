; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47792 () Bool)

(assert start!47792)

(declare-fun b!526581 () Bool)

(declare-fun res!323237 () Bool)

(declare-fun e!306925 () Bool)

(assert (=> b!526581 (=> res!323237 e!306925)))

(declare-datatypes ((SeekEntryResult!4489 0))(
  ( (MissingZero!4489 (index!20168 (_ BitVec 32))) (Found!4489 (index!20169 (_ BitVec 32))) (Intermediate!4489 (undefined!5301 Bool) (index!20170 (_ BitVec 32)) (x!49283 (_ BitVec 32))) (Undefined!4489) (MissingVacant!4489 (index!20171 (_ BitVec 32))) )
))
(declare-fun lt!242270 () SeekEntryResult!4489)

(get-info :version)

(assert (=> b!526581 (= res!323237 (or (undefined!5301 lt!242270) (not ((_ is Intermediate!4489) lt!242270))))))

(declare-fun b!526582 () Bool)

(declare-fun e!306926 () Bool)

(assert (=> b!526582 (= e!306926 (not e!306925))))

(declare-fun res!323230 () Bool)

(assert (=> b!526582 (=> res!323230 e!306925)))

(declare-fun lt!242272 () (_ BitVec 32))

(declare-fun lt!242267 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33430 0))(
  ( (array!33431 (arr!16066 (Array (_ BitVec 32) (_ BitVec 64))) (size!16430 (_ BitVec 32))) )
))
(declare-fun lt!242274 () array!33430)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33430 (_ BitVec 32)) SeekEntryResult!4489)

(assert (=> b!526582 (= res!323230 (= lt!242270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242272 lt!242267 lt!242274 mask!3524)))))

(declare-fun a!3235 () array!33430)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242269 () (_ BitVec 32))

(assert (=> b!526582 (= lt!242270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242269 (select (arr!16066 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526582 (= lt!242272 (toIndex!0 lt!242267 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!526582 (= lt!242267 (select (store (arr!16066 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526582 (= lt!242269 (toIndex!0 (select (arr!16066 a!3235) j!176) mask!3524))))

(assert (=> b!526582 (= lt!242274 (array!33431 (store (arr!16066 a!3235) i!1204 k0!2280) (size!16430 a!3235)))))

(declare-fun e!306922 () Bool)

(assert (=> b!526582 e!306922))

(declare-fun res!323229 () Bool)

(assert (=> b!526582 (=> (not res!323229) (not e!306922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33430 (_ BitVec 32)) Bool)

(assert (=> b!526582 (= res!323229 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16567 0))(
  ( (Unit!16568) )
))
(declare-fun lt!242273 () Unit!16567)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16567)

(assert (=> b!526582 (= lt!242273 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526583 () Bool)

(declare-fun res!323231 () Bool)

(assert (=> b!526583 (=> (not res!323231) (not e!306926))))

(declare-datatypes ((List!10131 0))(
  ( (Nil!10128) (Cons!10127 (h!11058 (_ BitVec 64)) (t!16351 List!10131)) )
))
(declare-fun arrayNoDuplicates!0 (array!33430 (_ BitVec 32) List!10131) Bool)

(assert (=> b!526583 (= res!323231 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10128))))

(declare-fun b!526584 () Bool)

(declare-fun res!323236 () Bool)

(declare-fun e!306923 () Bool)

(assert (=> b!526584 (=> (not res!323236) (not e!306923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526584 (= res!323236 (validKeyInArray!0 k0!2280))))

(declare-fun b!526585 () Bool)

(declare-fun res!323238 () Bool)

(assert (=> b!526585 (=> (not res!323238) (not e!306923))))

(declare-fun arrayContainsKey!0 (array!33430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526585 (= res!323238 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526586 () Bool)

(assert (=> b!526586 (= e!306923 e!306926)))

(declare-fun res!323232 () Bool)

(assert (=> b!526586 (=> (not res!323232) (not e!306926))))

(declare-fun lt!242266 () SeekEntryResult!4489)

(assert (=> b!526586 (= res!323232 (or (= lt!242266 (MissingZero!4489 i!1204)) (= lt!242266 (MissingVacant!4489 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33430 (_ BitVec 32)) SeekEntryResult!4489)

(assert (=> b!526586 (= lt!242266 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!323239 () Bool)

(assert (=> start!47792 (=> (not res!323239) (not e!306923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47792 (= res!323239 (validMask!0 mask!3524))))

(assert (=> start!47792 e!306923))

(assert (=> start!47792 true))

(declare-fun array_inv!11925 (array!33430) Bool)

(assert (=> start!47792 (array_inv!11925 a!3235)))

(declare-fun b!526587 () Bool)

(assert (=> b!526587 (= e!306922 (= (seekEntryOrOpen!0 (select (arr!16066 a!3235) j!176) a!3235 mask!3524) (Found!4489 j!176)))))

(declare-fun b!526588 () Bool)

(declare-fun res!323235 () Bool)

(assert (=> b!526588 (=> (not res!323235) (not e!306923))))

(assert (=> b!526588 (= res!323235 (and (= (size!16430 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16430 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16430 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526589 () Bool)

(declare-fun e!306927 () Bool)

(assert (=> b!526589 (= e!306927 false)))

(declare-fun b!526590 () Bool)

(assert (=> b!526590 (= e!306925 true)))

(assert (=> b!526590 (= (index!20170 lt!242270) i!1204)))

(declare-fun lt!242271 () Unit!16567)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33430 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16567)

(assert (=> b!526590 (= lt!242271 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242269 #b00000000000000000000000000000000 (index!20170 lt!242270) (x!49283 lt!242270) mask!3524))))

(assert (=> b!526590 (and (or (= (select (arr!16066 a!3235) (index!20170 lt!242270)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16066 a!3235) (index!20170 lt!242270)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16066 a!3235) (index!20170 lt!242270)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16066 a!3235) (index!20170 lt!242270)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242268 () Unit!16567)

(declare-fun e!306921 () Unit!16567)

(assert (=> b!526590 (= lt!242268 e!306921)))

(declare-fun c!61982 () Bool)

(assert (=> b!526590 (= c!61982 (= (select (arr!16066 a!3235) (index!20170 lt!242270)) (select (arr!16066 a!3235) j!176)))))

(assert (=> b!526590 (and (bvslt (x!49283 lt!242270) #b01111111111111111111111111111110) (or (= (select (arr!16066 a!3235) (index!20170 lt!242270)) (select (arr!16066 a!3235) j!176)) (= (select (arr!16066 a!3235) (index!20170 lt!242270)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16066 a!3235) (index!20170 lt!242270)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526591 () Bool)

(declare-fun Unit!16569 () Unit!16567)

(assert (=> b!526591 (= e!306921 Unit!16569)))

(declare-fun lt!242275 () Unit!16567)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33430 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16567)

(assert (=> b!526591 (= lt!242275 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242269 #b00000000000000000000000000000000 (index!20170 lt!242270) (x!49283 lt!242270) mask!3524))))

(declare-fun res!323228 () Bool)

(assert (=> b!526591 (= res!323228 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242269 lt!242267 lt!242274 mask!3524) (Intermediate!4489 false (index!20170 lt!242270) (x!49283 lt!242270))))))

(assert (=> b!526591 (=> (not res!323228) (not e!306927))))

(assert (=> b!526591 e!306927))

(declare-fun b!526592 () Bool)

(declare-fun res!323234 () Bool)

(assert (=> b!526592 (=> (not res!323234) (not e!306926))))

(assert (=> b!526592 (= res!323234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526593 () Bool)

(declare-fun Unit!16570 () Unit!16567)

(assert (=> b!526593 (= e!306921 Unit!16570)))

(declare-fun b!526594 () Bool)

(declare-fun res!323233 () Bool)

(assert (=> b!526594 (=> (not res!323233) (not e!306923))))

(assert (=> b!526594 (= res!323233 (validKeyInArray!0 (select (arr!16066 a!3235) j!176)))))

(assert (= (and start!47792 res!323239) b!526588))

(assert (= (and b!526588 res!323235) b!526594))

(assert (= (and b!526594 res!323233) b!526584))

(assert (= (and b!526584 res!323236) b!526585))

(assert (= (and b!526585 res!323238) b!526586))

(assert (= (and b!526586 res!323232) b!526592))

(assert (= (and b!526592 res!323234) b!526583))

(assert (= (and b!526583 res!323231) b!526582))

(assert (= (and b!526582 res!323229) b!526587))

(assert (= (and b!526582 (not res!323230)) b!526581))

(assert (= (and b!526581 (not res!323237)) b!526590))

(assert (= (and b!526590 c!61982) b!526591))

(assert (= (and b!526590 (not c!61982)) b!526593))

(assert (= (and b!526591 res!323228) b!526589))

(declare-fun m!507541 () Bool)

(assert (=> b!526584 m!507541))

(declare-fun m!507543 () Bool)

(assert (=> b!526594 m!507543))

(assert (=> b!526594 m!507543))

(declare-fun m!507545 () Bool)

(assert (=> b!526594 m!507545))

(declare-fun m!507547 () Bool)

(assert (=> b!526582 m!507547))

(declare-fun m!507549 () Bool)

(assert (=> b!526582 m!507549))

(declare-fun m!507551 () Bool)

(assert (=> b!526582 m!507551))

(declare-fun m!507553 () Bool)

(assert (=> b!526582 m!507553))

(assert (=> b!526582 m!507543))

(declare-fun m!507555 () Bool)

(assert (=> b!526582 m!507555))

(assert (=> b!526582 m!507543))

(declare-fun m!507557 () Bool)

(assert (=> b!526582 m!507557))

(declare-fun m!507559 () Bool)

(assert (=> b!526582 m!507559))

(assert (=> b!526582 m!507543))

(declare-fun m!507561 () Bool)

(assert (=> b!526582 m!507561))

(declare-fun m!507563 () Bool)

(assert (=> b!526583 m!507563))

(declare-fun m!507565 () Bool)

(assert (=> b!526590 m!507565))

(declare-fun m!507567 () Bool)

(assert (=> b!526590 m!507567))

(assert (=> b!526590 m!507543))

(declare-fun m!507569 () Bool)

(assert (=> b!526591 m!507569))

(declare-fun m!507571 () Bool)

(assert (=> b!526591 m!507571))

(declare-fun m!507573 () Bool)

(assert (=> b!526592 m!507573))

(declare-fun m!507575 () Bool)

(assert (=> b!526586 m!507575))

(declare-fun m!507577 () Bool)

(assert (=> start!47792 m!507577))

(declare-fun m!507579 () Bool)

(assert (=> start!47792 m!507579))

(assert (=> b!526587 m!507543))

(assert (=> b!526587 m!507543))

(declare-fun m!507581 () Bool)

(assert (=> b!526587 m!507581))

(declare-fun m!507583 () Bool)

(assert (=> b!526585 m!507583))

(check-sat (not b!526582) (not b!526594) (not b!526583) (not b!526592) (not b!526584) (not b!526587) (not b!526586) (not b!526591) (not b!526590) (not b!526585) (not start!47792))
(check-sat)
