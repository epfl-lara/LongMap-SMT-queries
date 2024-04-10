; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47740 () Bool)

(assert start!47740)

(declare-fun b!525340 () Bool)

(declare-fun res!322122 () Bool)

(declare-fun e!306311 () Bool)

(assert (=> b!525340 (=> (not res!322122) (not e!306311))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33377 0))(
  ( (array!33378 (arr!16040 (Array (_ BitVec 32) (_ BitVec 64))) (size!16404 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33377)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525340 (= res!322122 (and (= (size!16404 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16404 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16404 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525341 () Bool)

(declare-datatypes ((Unit!16480 0))(
  ( (Unit!16481) )
))
(declare-fun e!306314 () Unit!16480)

(declare-fun Unit!16482 () Unit!16480)

(assert (=> b!525341 (= e!306314 Unit!16482)))

(declare-fun b!525342 () Bool)

(declare-fun e!306313 () Bool)

(assert (=> b!525342 (= e!306313 true)))

(declare-datatypes ((SeekEntryResult!4507 0))(
  ( (MissingZero!4507 (index!20240 (_ BitVec 32))) (Found!4507 (index!20241 (_ BitVec 32))) (Intermediate!4507 (undefined!5319 Bool) (index!20242 (_ BitVec 32)) (x!49216 (_ BitVec 32))) (Undefined!4507) (MissingVacant!4507 (index!20243 (_ BitVec 32))) )
))
(declare-fun lt!241333 () SeekEntryResult!4507)

(assert (=> b!525342 (= (index!20242 lt!241333) i!1204)))

(declare-fun lt!241327 () (_ BitVec 32))

(declare-fun lt!241331 () Unit!16480)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16480)

(assert (=> b!525342 (= lt!241331 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241327 #b00000000000000000000000000000000 (index!20242 lt!241333) (x!49216 lt!241333) mask!3524))))

(assert (=> b!525342 (and (or (= (select (arr!16040 a!3235) (index!20242 lt!241333)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16040 a!3235) (index!20242 lt!241333)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16040 a!3235) (index!20242 lt!241333)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16040 a!3235) (index!20242 lt!241333)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241332 () Unit!16480)

(assert (=> b!525342 (= lt!241332 e!306314)))

(declare-fun c!61916 () Bool)

(assert (=> b!525342 (= c!61916 (= (select (arr!16040 a!3235) (index!20242 lt!241333)) (select (arr!16040 a!3235) j!176)))))

(assert (=> b!525342 (and (bvslt (x!49216 lt!241333) #b01111111111111111111111111111110) (or (= (select (arr!16040 a!3235) (index!20242 lt!241333)) (select (arr!16040 a!3235) j!176)) (= (select (arr!16040 a!3235) (index!20242 lt!241333)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16040 a!3235) (index!20242 lt!241333)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525343 () Bool)

(declare-fun res!322121 () Bool)

(assert (=> b!525343 (=> (not res!322121) (not e!306311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525343 (= res!322121 (validKeyInArray!0 (select (arr!16040 a!3235) j!176)))))

(declare-fun b!525344 () Bool)

(declare-fun res!322123 () Bool)

(assert (=> b!525344 (=> (not res!322123) (not e!306311))))

(declare-fun arrayContainsKey!0 (array!33377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525344 (= res!322123 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525345 () Bool)

(declare-fun e!306315 () Bool)

(assert (=> b!525345 (= e!306315 false)))

(declare-fun b!525346 () Bool)

(declare-fun res!322125 () Bool)

(assert (=> b!525346 (=> res!322125 e!306313)))

(assert (=> b!525346 (= res!322125 (or (undefined!5319 lt!241333) (not (is-Intermediate!4507 lt!241333))))))

(declare-fun b!525347 () Bool)

(declare-fun e!306310 () Bool)

(assert (=> b!525347 (= e!306310 (not e!306313))))

(declare-fun res!322128 () Bool)

(assert (=> b!525347 (=> res!322128 e!306313)))

(declare-fun lt!241328 () (_ BitVec 32))

(declare-fun lt!241329 () array!33377)

(declare-fun lt!241330 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33377 (_ BitVec 32)) SeekEntryResult!4507)

(assert (=> b!525347 (= res!322128 (= lt!241333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241328 lt!241330 lt!241329 mask!3524)))))

(assert (=> b!525347 (= lt!241333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241327 (select (arr!16040 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525347 (= lt!241328 (toIndex!0 lt!241330 mask!3524))))

(assert (=> b!525347 (= lt!241330 (select (store (arr!16040 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525347 (= lt!241327 (toIndex!0 (select (arr!16040 a!3235) j!176) mask!3524))))

(assert (=> b!525347 (= lt!241329 (array!33378 (store (arr!16040 a!3235) i!1204 k!2280) (size!16404 a!3235)))))

(declare-fun e!306309 () Bool)

(assert (=> b!525347 e!306309))

(declare-fun res!322126 () Bool)

(assert (=> b!525347 (=> (not res!322126) (not e!306309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33377 (_ BitVec 32)) Bool)

(assert (=> b!525347 (= res!322126 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241325 () Unit!16480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16480)

(assert (=> b!525347 (= lt!241325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525349 () Bool)

(assert (=> b!525349 (= e!306311 e!306310)))

(declare-fun res!322127 () Bool)

(assert (=> b!525349 (=> (not res!322127) (not e!306310))))

(declare-fun lt!241324 () SeekEntryResult!4507)

(assert (=> b!525349 (= res!322127 (or (= lt!241324 (MissingZero!4507 i!1204)) (= lt!241324 (MissingVacant!4507 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33377 (_ BitVec 32)) SeekEntryResult!4507)

(assert (=> b!525349 (= lt!241324 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525350 () Bool)

(declare-fun res!322119 () Bool)

(assert (=> b!525350 (=> (not res!322119) (not e!306311))))

(assert (=> b!525350 (= res!322119 (validKeyInArray!0 k!2280))))

(declare-fun b!525351 () Bool)

(declare-fun res!322120 () Bool)

(assert (=> b!525351 (=> (not res!322120) (not e!306310))))

(declare-datatypes ((List!10198 0))(
  ( (Nil!10195) (Cons!10194 (h!11125 (_ BitVec 64)) (t!16426 List!10198)) )
))
(declare-fun arrayNoDuplicates!0 (array!33377 (_ BitVec 32) List!10198) Bool)

(assert (=> b!525351 (= res!322120 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10195))))

(declare-fun b!525352 () Bool)

(declare-fun res!322129 () Bool)

(assert (=> b!525352 (=> (not res!322129) (not e!306310))))

(assert (=> b!525352 (= res!322129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525353 () Bool)

(declare-fun Unit!16483 () Unit!16480)

(assert (=> b!525353 (= e!306314 Unit!16483)))

(declare-fun lt!241326 () Unit!16480)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16480)

(assert (=> b!525353 (= lt!241326 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241327 #b00000000000000000000000000000000 (index!20242 lt!241333) (x!49216 lt!241333) mask!3524))))

(declare-fun res!322124 () Bool)

(assert (=> b!525353 (= res!322124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241327 lt!241330 lt!241329 mask!3524) (Intermediate!4507 false (index!20242 lt!241333) (x!49216 lt!241333))))))

(assert (=> b!525353 (=> (not res!322124) (not e!306315))))

(assert (=> b!525353 e!306315))

(declare-fun b!525348 () Bool)

(assert (=> b!525348 (= e!306309 (= (seekEntryOrOpen!0 (select (arr!16040 a!3235) j!176) a!3235 mask!3524) (Found!4507 j!176)))))

(declare-fun res!322130 () Bool)

(assert (=> start!47740 (=> (not res!322130) (not e!306311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47740 (= res!322130 (validMask!0 mask!3524))))

(assert (=> start!47740 e!306311))

(assert (=> start!47740 true))

(declare-fun array_inv!11836 (array!33377) Bool)

(assert (=> start!47740 (array_inv!11836 a!3235)))

(assert (= (and start!47740 res!322130) b!525340))

(assert (= (and b!525340 res!322122) b!525343))

(assert (= (and b!525343 res!322121) b!525350))

(assert (= (and b!525350 res!322119) b!525344))

(assert (= (and b!525344 res!322123) b!525349))

(assert (= (and b!525349 res!322127) b!525352))

(assert (= (and b!525352 res!322129) b!525351))

(assert (= (and b!525351 res!322120) b!525347))

(assert (= (and b!525347 res!322126) b!525348))

(assert (= (and b!525347 (not res!322128)) b!525346))

(assert (= (and b!525346 (not res!322125)) b!525342))

(assert (= (and b!525342 c!61916) b!525353))

(assert (= (and b!525342 (not c!61916)) b!525341))

(assert (= (and b!525353 res!322124) b!525345))

(declare-fun m!505993 () Bool)

(assert (=> b!525350 m!505993))

(declare-fun m!505995 () Bool)

(assert (=> b!525343 m!505995))

(assert (=> b!525343 m!505995))

(declare-fun m!505997 () Bool)

(assert (=> b!525343 m!505997))

(declare-fun m!505999 () Bool)

(assert (=> b!525352 m!505999))

(declare-fun m!506001 () Bool)

(assert (=> b!525344 m!506001))

(declare-fun m!506003 () Bool)

(assert (=> b!525351 m!506003))

(declare-fun m!506005 () Bool)

(assert (=> b!525349 m!506005))

(declare-fun m!506007 () Bool)

(assert (=> start!47740 m!506007))

(declare-fun m!506009 () Bool)

(assert (=> start!47740 m!506009))

(declare-fun m!506011 () Bool)

(assert (=> b!525353 m!506011))

(declare-fun m!506013 () Bool)

(assert (=> b!525353 m!506013))

(declare-fun m!506015 () Bool)

(assert (=> b!525342 m!506015))

(declare-fun m!506017 () Bool)

(assert (=> b!525342 m!506017))

(assert (=> b!525342 m!505995))

(assert (=> b!525348 m!505995))

(assert (=> b!525348 m!505995))

(declare-fun m!506019 () Bool)

(assert (=> b!525348 m!506019))

(assert (=> b!525347 m!505995))

(declare-fun m!506021 () Bool)

(assert (=> b!525347 m!506021))

(declare-fun m!506023 () Bool)

(assert (=> b!525347 m!506023))

(declare-fun m!506025 () Bool)

(assert (=> b!525347 m!506025))

(declare-fun m!506027 () Bool)

(assert (=> b!525347 m!506027))

(declare-fun m!506029 () Bool)

(assert (=> b!525347 m!506029))

(declare-fun m!506031 () Bool)

(assert (=> b!525347 m!506031))

(assert (=> b!525347 m!505995))

(declare-fun m!506033 () Bool)

(assert (=> b!525347 m!506033))

(assert (=> b!525347 m!505995))

(declare-fun m!506035 () Bool)

(assert (=> b!525347 m!506035))

(push 1)

