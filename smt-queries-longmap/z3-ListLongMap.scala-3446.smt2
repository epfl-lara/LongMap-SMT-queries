; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47784 () Bool)

(assert start!47784)

(declare-fun b!526245 () Bool)

(declare-fun res!323008 () Bool)

(declare-fun e!306727 () Bool)

(assert (=> b!526245 (=> (not res!323008) (not e!306727))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526245 (= res!323008 (validKeyInArray!0 k0!2280))))

(declare-fun b!526246 () Bool)

(declare-fun e!306729 () Bool)

(assert (=> b!526246 (= e!306727 e!306729)))

(declare-fun res!322998 () Bool)

(assert (=> b!526246 (=> (not res!322998) (not e!306729))))

(declare-datatypes ((SeekEntryResult!4531 0))(
  ( (MissingZero!4531 (index!20336 (_ BitVec 32))) (Found!4531 (index!20337 (_ BitVec 32))) (Intermediate!4531 (undefined!5343 Bool) (index!20338 (_ BitVec 32)) (x!49315 (_ BitVec 32))) (Undefined!4531) (MissingVacant!4531 (index!20339 (_ BitVec 32))) )
))
(declare-fun lt!241933 () SeekEntryResult!4531)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526246 (= res!322998 (or (= lt!241933 (MissingZero!4531 i!1204)) (= lt!241933 (MissingVacant!4531 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33431 0))(
  ( (array!33432 (arr!16067 (Array (_ BitVec 32) (_ BitVec 64))) (size!16432 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33431)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33431 (_ BitVec 32)) SeekEntryResult!4531)

(assert (=> b!526246 (= lt!241933 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526247 () Bool)

(declare-fun res!323000 () Bool)

(assert (=> b!526247 (=> (not res!323000) (not e!306727))))

(declare-fun arrayContainsKey!0 (array!33431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526247 (= res!323000 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun e!306724 () Bool)

(declare-fun b!526248 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526248 (= e!306724 (= (seekEntryOrOpen!0 (select (arr!16067 a!3235) j!176) a!3235 mask!3524) (Found!4531 j!176)))))

(declare-fun b!526249 () Bool)

(declare-fun e!306725 () Bool)

(assert (=> b!526249 (= e!306725 true)))

(declare-fun lt!241930 () SeekEntryResult!4531)

(assert (=> b!526249 (= (index!20338 lt!241930) i!1204)))

(declare-datatypes ((Unit!16570 0))(
  ( (Unit!16571) )
))
(declare-fun lt!241932 () Unit!16570)

(declare-fun lt!241938 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16570)

(assert (=> b!526249 (= lt!241932 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241938 #b00000000000000000000000000000000 (index!20338 lt!241930) (x!49315 lt!241930) mask!3524))))

(assert (=> b!526249 (and (or (= (select (arr!16067 a!3235) (index!20338 lt!241930)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16067 a!3235) (index!20338 lt!241930)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16067 a!3235) (index!20338 lt!241930)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16067 a!3235) (index!20338 lt!241930)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241939 () Unit!16570)

(declare-fun e!306723 () Unit!16570)

(assert (=> b!526249 (= lt!241939 e!306723)))

(declare-fun c!61929 () Bool)

(assert (=> b!526249 (= c!61929 (= (select (arr!16067 a!3235) (index!20338 lt!241930)) (select (arr!16067 a!3235) j!176)))))

(assert (=> b!526249 (and (bvslt (x!49315 lt!241930) #b01111111111111111111111111111110) (or (= (select (arr!16067 a!3235) (index!20338 lt!241930)) (select (arr!16067 a!3235) j!176)) (= (select (arr!16067 a!3235) (index!20338 lt!241930)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16067 a!3235) (index!20338 lt!241930)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526250 () Bool)

(declare-fun Unit!16572 () Unit!16570)

(assert (=> b!526250 (= e!306723 Unit!16572)))

(declare-fun lt!241936 () Unit!16570)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16570)

(assert (=> b!526250 (= lt!241936 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241938 #b00000000000000000000000000000000 (index!20338 lt!241930) (x!49315 lt!241930) mask!3524))))

(declare-fun lt!241937 () array!33431)

(declare-fun lt!241935 () (_ BitVec 64))

(declare-fun res!323001 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33431 (_ BitVec 32)) SeekEntryResult!4531)

(assert (=> b!526250 (= res!323001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241938 lt!241935 lt!241937 mask!3524) (Intermediate!4531 false (index!20338 lt!241930) (x!49315 lt!241930))))))

(declare-fun e!306726 () Bool)

(assert (=> b!526250 (=> (not res!323001) (not e!306726))))

(assert (=> b!526250 e!306726))

(declare-fun b!526251 () Bool)

(declare-fun Unit!16573 () Unit!16570)

(assert (=> b!526251 (= e!306723 Unit!16573)))

(declare-fun b!526252 () Bool)

(assert (=> b!526252 (= e!306729 (not e!306725))))

(declare-fun res!323002 () Bool)

(assert (=> b!526252 (=> res!323002 e!306725)))

(declare-fun lt!241931 () (_ BitVec 32))

(assert (=> b!526252 (= res!323002 (= lt!241930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241931 lt!241935 lt!241937 mask!3524)))))

(assert (=> b!526252 (= lt!241930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241938 (select (arr!16067 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526252 (= lt!241931 (toIndex!0 lt!241935 mask!3524))))

(assert (=> b!526252 (= lt!241935 (select (store (arr!16067 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526252 (= lt!241938 (toIndex!0 (select (arr!16067 a!3235) j!176) mask!3524))))

(assert (=> b!526252 (= lt!241937 (array!33432 (store (arr!16067 a!3235) i!1204 k0!2280) (size!16432 a!3235)))))

(assert (=> b!526252 e!306724))

(declare-fun res!322999 () Bool)

(assert (=> b!526252 (=> (not res!322999) (not e!306724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33431 (_ BitVec 32)) Bool)

(assert (=> b!526252 (= res!322999 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241934 () Unit!16570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16570)

(assert (=> b!526252 (= lt!241934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526253 () Bool)

(declare-fun res!323003 () Bool)

(assert (=> b!526253 (=> (not res!323003) (not e!306727))))

(assert (=> b!526253 (= res!323003 (and (= (size!16432 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16432 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16432 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526254 () Bool)

(declare-fun res!323004 () Bool)

(assert (=> b!526254 (=> (not res!323004) (not e!306727))))

(assert (=> b!526254 (= res!323004 (validKeyInArray!0 (select (arr!16067 a!3235) j!176)))))

(declare-fun b!526255 () Bool)

(declare-fun res!323009 () Bool)

(assert (=> b!526255 (=> res!323009 e!306725)))

(get-info :version)

(assert (=> b!526255 (= res!323009 (or (undefined!5343 lt!241930) (not ((_ is Intermediate!4531) lt!241930))))))

(declare-fun res!323005 () Bool)

(assert (=> start!47784 (=> (not res!323005) (not e!306727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47784 (= res!323005 (validMask!0 mask!3524))))

(assert (=> start!47784 e!306727))

(assert (=> start!47784 true))

(declare-fun array_inv!11950 (array!33431) Bool)

(assert (=> start!47784 (array_inv!11950 a!3235)))

(declare-fun b!526256 () Bool)

(declare-fun res!323007 () Bool)

(assert (=> b!526256 (=> (not res!323007) (not e!306729))))

(assert (=> b!526256 (= res!323007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526257 () Bool)

(assert (=> b!526257 (= e!306726 false)))

(declare-fun b!526258 () Bool)

(declare-fun res!323006 () Bool)

(assert (=> b!526258 (=> (not res!323006) (not e!306729))))

(declare-datatypes ((List!10264 0))(
  ( (Nil!10261) (Cons!10260 (h!11191 (_ BitVec 64)) (t!16483 List!10264)) )
))
(declare-fun arrayNoDuplicates!0 (array!33431 (_ BitVec 32) List!10264) Bool)

(assert (=> b!526258 (= res!323006 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10261))))

(assert (= (and start!47784 res!323005) b!526253))

(assert (= (and b!526253 res!323003) b!526254))

(assert (= (and b!526254 res!323004) b!526245))

(assert (= (and b!526245 res!323008) b!526247))

(assert (= (and b!526247 res!323000) b!526246))

(assert (= (and b!526246 res!322998) b!526256))

(assert (= (and b!526256 res!323007) b!526258))

(assert (= (and b!526258 res!323006) b!526252))

(assert (= (and b!526252 res!322999) b!526248))

(assert (= (and b!526252 (not res!323002)) b!526255))

(assert (= (and b!526255 (not res!323009)) b!526249))

(assert (= (and b!526249 c!61929) b!526250))

(assert (= (and b!526249 (not c!61929)) b!526251))

(assert (= (and b!526250 res!323001) b!526257))

(declare-fun m!506473 () Bool)

(assert (=> b!526256 m!506473))

(declare-fun m!506475 () Bool)

(assert (=> b!526247 m!506475))

(declare-fun m!506477 () Bool)

(assert (=> start!47784 m!506477))

(declare-fun m!506479 () Bool)

(assert (=> start!47784 m!506479))

(declare-fun m!506481 () Bool)

(assert (=> b!526249 m!506481))

(declare-fun m!506483 () Bool)

(assert (=> b!526249 m!506483))

(declare-fun m!506485 () Bool)

(assert (=> b!526249 m!506485))

(assert (=> b!526254 m!506485))

(assert (=> b!526254 m!506485))

(declare-fun m!506487 () Bool)

(assert (=> b!526254 m!506487))

(assert (=> b!526248 m!506485))

(assert (=> b!526248 m!506485))

(declare-fun m!506489 () Bool)

(assert (=> b!526248 m!506489))

(declare-fun m!506491 () Bool)

(assert (=> b!526245 m!506491))

(declare-fun m!506493 () Bool)

(assert (=> b!526252 m!506493))

(declare-fun m!506495 () Bool)

(assert (=> b!526252 m!506495))

(declare-fun m!506497 () Bool)

(assert (=> b!526252 m!506497))

(assert (=> b!526252 m!506485))

(declare-fun m!506499 () Bool)

(assert (=> b!526252 m!506499))

(assert (=> b!526252 m!506485))

(declare-fun m!506501 () Bool)

(assert (=> b!526252 m!506501))

(declare-fun m!506503 () Bool)

(assert (=> b!526252 m!506503))

(assert (=> b!526252 m!506485))

(declare-fun m!506505 () Bool)

(assert (=> b!526252 m!506505))

(declare-fun m!506507 () Bool)

(assert (=> b!526252 m!506507))

(declare-fun m!506509 () Bool)

(assert (=> b!526250 m!506509))

(declare-fun m!506511 () Bool)

(assert (=> b!526250 m!506511))

(declare-fun m!506513 () Bool)

(assert (=> b!526258 m!506513))

(declare-fun m!506515 () Bool)

(assert (=> b!526246 m!506515))

(check-sat (not b!526246) (not start!47784) (not b!526254) (not b!526247) (not b!526250) (not b!526248) (not b!526256) (not b!526245) (not b!526252) (not b!526249) (not b!526258))
(check-sat)
