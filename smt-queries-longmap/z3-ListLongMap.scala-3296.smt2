; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45722 () Bool)

(assert start!45722)

(declare-fun b!505339 () Bool)

(declare-fun res!306425 () Bool)

(declare-fun e!295828 () Bool)

(assert (=> b!505339 (=> res!306425 e!295828)))

(declare-fun e!295834 () Bool)

(assert (=> b!505339 (= res!306425 e!295834)))

(declare-fun res!306422 () Bool)

(assert (=> b!505339 (=> (not res!306422) (not e!295834))))

(declare-datatypes ((SeekEntryResult!4086 0))(
  ( (MissingZero!4086 (index!18532 (_ BitVec 32))) (Found!4086 (index!18533 (_ BitVec 32))) (Intermediate!4086 (undefined!4898 Bool) (index!18534 (_ BitVec 32)) (x!47543 (_ BitVec 32))) (Undefined!4086) (MissingVacant!4086 (index!18535 (_ BitVec 32))) )
))
(declare-fun lt!230293 () SeekEntryResult!4086)

(assert (=> b!505339 (= res!306422 (bvsgt #b00000000000000000000000000000000 (x!47543 lt!230293)))))

(declare-fun b!505340 () Bool)

(declare-fun res!306426 () Bool)

(assert (=> b!505340 (=> res!306426 e!295828)))

(declare-fun lt!230285 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!230281 () (_ BitVec 64))

(declare-datatypes ((array!32478 0))(
  ( (array!32479 (arr!15619 (Array (_ BitVec 32) (_ BitVec 64))) (size!15983 (_ BitVec 32))) )
))
(declare-fun lt!230286 () array!32478)

(declare-fun lt!230287 () SeekEntryResult!4086)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32478 (_ BitVec 32)) SeekEntryResult!4086)

(assert (=> b!505340 (= res!306426 (not (= lt!230287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230285 lt!230281 lt!230286 mask!3524))))))

(declare-fun b!505341 () Bool)

(assert (=> b!505341 (= e!295828 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!230290 () SeekEntryResult!4086)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32478 (_ BitVec 32)) SeekEntryResult!4086)

(assert (=> b!505341 (= (seekEntryOrOpen!0 lt!230281 lt!230286 mask!3524) lt!230290)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15420 0))(
  ( (Unit!15421) )
))
(declare-fun lt!230292 () Unit!15420)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun a!3235 () array!32478)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32478 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15420)

(assert (=> b!505341 (= lt!230292 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230285 #b00000000000000000000000000000000 (index!18534 lt!230293) (x!47543 lt!230293) mask!3524))))

(declare-fun b!505342 () Bool)

(declare-fun res!306423 () Bool)

(declare-fun e!295833 () Bool)

(assert (=> b!505342 (=> (not res!306423) (not e!295833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505342 (= res!306423 (validKeyInArray!0 k0!2280))))

(declare-fun e!295829 () Bool)

(declare-fun b!505343 () Bool)

(assert (=> b!505343 (= e!295829 (= (seekEntryOrOpen!0 (select (arr!15619 a!3235) j!176) a!3235 mask!3524) (Found!4086 j!176)))))

(declare-fun b!505344 () Bool)

(declare-fun e!295830 () Bool)

(assert (=> b!505344 (= e!295830 false)))

(declare-fun res!306424 () Bool)

(assert (=> start!45722 (=> (not res!306424) (not e!295833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45722 (= res!306424 (validMask!0 mask!3524))))

(assert (=> start!45722 e!295833))

(assert (=> start!45722 true))

(declare-fun array_inv!11415 (array!32478) Bool)

(assert (=> start!45722 (array_inv!11415 a!3235)))

(declare-fun b!505345 () Bool)

(declare-fun e!295835 () Bool)

(assert (=> b!505345 (= e!295833 e!295835)))

(declare-fun res!306418 () Bool)

(assert (=> b!505345 (=> (not res!306418) (not e!295835))))

(declare-fun lt!230282 () SeekEntryResult!4086)

(assert (=> b!505345 (= res!306418 (or (= lt!230282 (MissingZero!4086 i!1204)) (= lt!230282 (MissingVacant!4086 i!1204))))))

(assert (=> b!505345 (= lt!230282 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505346 () Bool)

(declare-fun res!306421 () Bool)

(assert (=> b!505346 (=> (not res!306421) (not e!295833))))

(assert (=> b!505346 (= res!306421 (validKeyInArray!0 (select (arr!15619 a!3235) j!176)))))

(declare-fun b!505347 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32478 (_ BitVec 32)) SeekEntryResult!4086)

(assert (=> b!505347 (= e!295834 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230285 (index!18534 lt!230293) (select (arr!15619 a!3235) j!176) a!3235 mask!3524) lt!230290)))))

(declare-fun b!505348 () Bool)

(declare-fun e!295831 () Unit!15420)

(declare-fun Unit!15422 () Unit!15420)

(assert (=> b!505348 (= e!295831 Unit!15422)))

(declare-fun b!505349 () Bool)

(declare-fun res!306414 () Bool)

(assert (=> b!505349 (=> (not res!306414) (not e!295833))))

(declare-fun arrayContainsKey!0 (array!32478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505349 (= res!306414 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505350 () Bool)

(declare-fun Unit!15423 () Unit!15420)

(assert (=> b!505350 (= e!295831 Unit!15423)))

(declare-fun lt!230283 () Unit!15420)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32478 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15420)

(assert (=> b!505350 (= lt!230283 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230285 #b00000000000000000000000000000000 (index!18534 lt!230293) (x!47543 lt!230293) mask!3524))))

(declare-fun res!306428 () Bool)

(assert (=> b!505350 (= res!306428 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230285 lt!230281 lt!230286 mask!3524) (Intermediate!4086 false (index!18534 lt!230293) (x!47543 lt!230293))))))

(assert (=> b!505350 (=> (not res!306428) (not e!295830))))

(assert (=> b!505350 e!295830))

(declare-fun b!505351 () Bool)

(declare-fun e!295832 () Bool)

(assert (=> b!505351 (= e!295835 (not e!295832))))

(declare-fun res!306427 () Bool)

(assert (=> b!505351 (=> res!306427 e!295832)))

(get-info :version)

(assert (=> b!505351 (= res!306427 (or (= lt!230293 lt!230287) (undefined!4898 lt!230293) (not ((_ is Intermediate!4086) lt!230293))))))

(declare-fun lt!230291 () (_ BitVec 32))

(assert (=> b!505351 (= lt!230287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230291 lt!230281 lt!230286 mask!3524))))

(assert (=> b!505351 (= lt!230293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230285 (select (arr!15619 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505351 (= lt!230291 (toIndex!0 lt!230281 mask!3524))))

(assert (=> b!505351 (= lt!230281 (select (store (arr!15619 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505351 (= lt!230285 (toIndex!0 (select (arr!15619 a!3235) j!176) mask!3524))))

(assert (=> b!505351 (= lt!230286 (array!32479 (store (arr!15619 a!3235) i!1204 k0!2280) (size!15983 a!3235)))))

(assert (=> b!505351 (= lt!230290 (Found!4086 j!176))))

(assert (=> b!505351 e!295829))

(declare-fun res!306415 () Bool)

(assert (=> b!505351 (=> (not res!306415) (not e!295829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32478 (_ BitVec 32)) Bool)

(assert (=> b!505351 (= res!306415 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230288 () Unit!15420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15420)

(assert (=> b!505351 (= lt!230288 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505352 () Bool)

(declare-fun res!306417 () Bool)

(assert (=> b!505352 (=> (not res!306417) (not e!295835))))

(declare-datatypes ((List!9777 0))(
  ( (Nil!9774) (Cons!9773 (h!10650 (_ BitVec 64)) (t!16005 List!9777)) )
))
(declare-fun arrayNoDuplicates!0 (array!32478 (_ BitVec 32) List!9777) Bool)

(assert (=> b!505352 (= res!306417 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9774))))

(declare-fun b!505353 () Bool)

(declare-fun res!306419 () Bool)

(assert (=> b!505353 (=> (not res!306419) (not e!295833))))

(assert (=> b!505353 (= res!306419 (and (= (size!15983 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15983 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15983 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505354 () Bool)

(declare-fun res!306416 () Bool)

(assert (=> b!505354 (=> (not res!306416) (not e!295835))))

(assert (=> b!505354 (= res!306416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505355 () Bool)

(assert (=> b!505355 (= e!295832 e!295828)))

(declare-fun res!306420 () Bool)

(assert (=> b!505355 (=> res!306420 e!295828)))

(assert (=> b!505355 (= res!306420 (or (bvsgt (x!47543 lt!230293) #b01111111111111111111111111111110) (bvslt lt!230285 #b00000000000000000000000000000000) (bvsge lt!230285 (size!15983 a!3235)) (bvslt (index!18534 lt!230293) #b00000000000000000000000000000000) (bvsge (index!18534 lt!230293) (size!15983 a!3235)) (not (= lt!230293 (Intermediate!4086 false (index!18534 lt!230293) (x!47543 lt!230293))))))))

(assert (=> b!505355 (= (index!18534 lt!230293) i!1204)))

(declare-fun lt!230284 () Unit!15420)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32478 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15420)

(assert (=> b!505355 (= lt!230284 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230285 #b00000000000000000000000000000000 (index!18534 lt!230293) (x!47543 lt!230293) mask!3524))))

(assert (=> b!505355 (and (or (= (select (arr!15619 a!3235) (index!18534 lt!230293)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15619 a!3235) (index!18534 lt!230293)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15619 a!3235) (index!18534 lt!230293)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15619 a!3235) (index!18534 lt!230293)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230289 () Unit!15420)

(assert (=> b!505355 (= lt!230289 e!295831)))

(declare-fun c!59741 () Bool)

(assert (=> b!505355 (= c!59741 (= (select (arr!15619 a!3235) (index!18534 lt!230293)) (select (arr!15619 a!3235) j!176)))))

(assert (=> b!505355 (and (bvslt (x!47543 lt!230293) #b01111111111111111111111111111110) (or (= (select (arr!15619 a!3235) (index!18534 lt!230293)) (select (arr!15619 a!3235) j!176)) (= (select (arr!15619 a!3235) (index!18534 lt!230293)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15619 a!3235) (index!18534 lt!230293)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45722 res!306424) b!505353))

(assert (= (and b!505353 res!306419) b!505346))

(assert (= (and b!505346 res!306421) b!505342))

(assert (= (and b!505342 res!306423) b!505349))

(assert (= (and b!505349 res!306414) b!505345))

(assert (= (and b!505345 res!306418) b!505354))

(assert (= (and b!505354 res!306416) b!505352))

(assert (= (and b!505352 res!306417) b!505351))

(assert (= (and b!505351 res!306415) b!505343))

(assert (= (and b!505351 (not res!306427)) b!505355))

(assert (= (and b!505355 c!59741) b!505350))

(assert (= (and b!505355 (not c!59741)) b!505348))

(assert (= (and b!505350 res!306428) b!505344))

(assert (= (and b!505355 (not res!306420)) b!505339))

(assert (= (and b!505339 res!306422) b!505347))

(assert (= (and b!505339 (not res!306425)) b!505340))

(assert (= (and b!505340 (not res!306426)) b!505341))

(declare-fun m!486005 () Bool)

(assert (=> b!505354 m!486005))

(declare-fun m!486007 () Bool)

(assert (=> b!505345 m!486007))

(declare-fun m!486009 () Bool)

(assert (=> b!505352 m!486009))

(declare-fun m!486011 () Bool)

(assert (=> b!505351 m!486011))

(declare-fun m!486013 () Bool)

(assert (=> b!505351 m!486013))

(declare-fun m!486015 () Bool)

(assert (=> b!505351 m!486015))

(declare-fun m!486017 () Bool)

(assert (=> b!505351 m!486017))

(declare-fun m!486019 () Bool)

(assert (=> b!505351 m!486019))

(declare-fun m!486021 () Bool)

(assert (=> b!505351 m!486021))

(declare-fun m!486023 () Bool)

(assert (=> b!505351 m!486023))

(assert (=> b!505351 m!486019))

(declare-fun m!486025 () Bool)

(assert (=> b!505351 m!486025))

(declare-fun m!486027 () Bool)

(assert (=> b!505351 m!486027))

(assert (=> b!505351 m!486019))

(declare-fun m!486029 () Bool)

(assert (=> b!505341 m!486029))

(declare-fun m!486031 () Bool)

(assert (=> b!505341 m!486031))

(assert (=> b!505347 m!486019))

(assert (=> b!505347 m!486019))

(declare-fun m!486033 () Bool)

(assert (=> b!505347 m!486033))

(assert (=> b!505346 m!486019))

(assert (=> b!505346 m!486019))

(declare-fun m!486035 () Bool)

(assert (=> b!505346 m!486035))

(declare-fun m!486037 () Bool)

(assert (=> b!505355 m!486037))

(declare-fun m!486039 () Bool)

(assert (=> b!505355 m!486039))

(assert (=> b!505355 m!486019))

(declare-fun m!486041 () Bool)

(assert (=> b!505349 m!486041))

(assert (=> b!505343 m!486019))

(assert (=> b!505343 m!486019))

(declare-fun m!486043 () Bool)

(assert (=> b!505343 m!486043))

(declare-fun m!486045 () Bool)

(assert (=> start!45722 m!486045))

(declare-fun m!486047 () Bool)

(assert (=> start!45722 m!486047))

(declare-fun m!486049 () Bool)

(assert (=> b!505340 m!486049))

(declare-fun m!486051 () Bool)

(assert (=> b!505350 m!486051))

(assert (=> b!505350 m!486049))

(declare-fun m!486053 () Bool)

(assert (=> b!505342 m!486053))

(check-sat (not b!505342) (not b!505343) (not b!505350) (not b!505352) (not start!45722) (not b!505341) (not b!505349) (not b!505340) (not b!505351) (not b!505354) (not b!505345) (not b!505346) (not b!505355) (not b!505347))
(check-sat)
