; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45674 () Bool)

(assert start!45674)

(declare-fun b!504309 () Bool)

(declare-fun res!305553 () Bool)

(declare-fun e!295280 () Bool)

(assert (=> b!504309 (=> (not res!305553) (not e!295280))))

(declare-datatypes ((array!32431 0))(
  ( (array!32432 (arr!15595 (Array (_ BitVec 32) (_ BitVec 64))) (size!15959 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32431)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32431 (_ BitVec 32)) Bool)

(assert (=> b!504309 (= res!305553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504310 () Bool)

(declare-fun e!295278 () Bool)

(declare-fun e!295277 () Bool)

(assert (=> b!504310 (= e!295278 e!295277)))

(declare-fun res!305562 () Bool)

(assert (=> b!504310 (=> res!305562 e!295277)))

(declare-fun lt!229642 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4018 0))(
  ( (MissingZero!4018 (index!18260 (_ BitVec 32))) (Found!4018 (index!18261 (_ BitVec 32))) (Intermediate!4018 (undefined!4830 Bool) (index!18262 (_ BitVec 32)) (x!47424 (_ BitVec 32))) (Undefined!4018) (MissingVacant!4018 (index!18263 (_ BitVec 32))) )
))
(declare-fun lt!229643 () SeekEntryResult!4018)

(assert (=> b!504310 (= res!305562 (or (bvsgt (x!47424 lt!229643) #b01111111111111111111111111111110) (bvslt lt!229642 #b00000000000000000000000000000000) (bvsge lt!229642 (size!15959 a!3235)) (bvslt (index!18262 lt!229643) #b00000000000000000000000000000000) (bvsge (index!18262 lt!229643) (size!15959 a!3235)) (not (= lt!229643 (Intermediate!4018 false (index!18262 lt!229643) (x!47424 lt!229643))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504310 (= (index!18262 lt!229643) i!1204)))

(declare-datatypes ((Unit!15307 0))(
  ( (Unit!15308) )
))
(declare-fun lt!229644 () Unit!15307)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15307)

(assert (=> b!504310 (= lt!229644 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229642 #b00000000000000000000000000000000 (index!18262 lt!229643) (x!47424 lt!229643) mask!3524))))

(assert (=> b!504310 (and (or (= (select (arr!15595 a!3235) (index!18262 lt!229643)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15595 a!3235) (index!18262 lt!229643)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15595 a!3235) (index!18262 lt!229643)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15595 a!3235) (index!18262 lt!229643)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229640 () Unit!15307)

(declare-fun e!295284 () Unit!15307)

(assert (=> b!504310 (= lt!229640 e!295284)))

(declare-fun c!59657 () Bool)

(assert (=> b!504310 (= c!59657 (= (select (arr!15595 a!3235) (index!18262 lt!229643)) (select (arr!15595 a!3235) j!176)))))

(assert (=> b!504310 (and (bvslt (x!47424 lt!229643) #b01111111111111111111111111111110) (or (= (select (arr!15595 a!3235) (index!18262 lt!229643)) (select (arr!15595 a!3235) j!176)) (= (select (arr!15595 a!3235) (index!18262 lt!229643)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15595 a!3235) (index!18262 lt!229643)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504312 () Bool)

(declare-fun e!295279 () Bool)

(assert (=> b!504312 (= e!295279 false)))

(declare-fun b!504313 () Bool)

(declare-fun res!305560 () Bool)

(declare-fun e!295283 () Bool)

(assert (=> b!504313 (=> (not res!305560) (not e!295283))))

(assert (=> b!504313 (= res!305560 (and (= (size!15959 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15959 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15959 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!295281 () Bool)

(declare-fun b!504314 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32431 (_ BitVec 32)) SeekEntryResult!4018)

(assert (=> b!504314 (= e!295281 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229642 (index!18262 lt!229643) (select (arr!15595 a!3235) j!176) a!3235 mask!3524) (Found!4018 j!176))))))

(declare-fun b!504315 () Bool)

(declare-fun res!305556 () Bool)

(assert (=> b!504315 (=> (not res!305556) (not e!295283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504315 (= res!305556 (validKeyInArray!0 (select (arr!15595 a!3235) j!176)))))

(declare-fun b!504316 () Bool)

(declare-fun Unit!15309 () Unit!15307)

(assert (=> b!504316 (= e!295284 Unit!15309)))

(declare-fun lt!229641 () Unit!15307)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15307)

(assert (=> b!504316 (= lt!229641 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229642 #b00000000000000000000000000000000 (index!18262 lt!229643) (x!47424 lt!229643) mask!3524))))

(declare-fun lt!229639 () (_ BitVec 64))

(declare-fun lt!229645 () array!32431)

(declare-fun res!305565 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32431 (_ BitVec 32)) SeekEntryResult!4018)

(assert (=> b!504316 (= res!305565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229642 lt!229639 lt!229645 mask!3524) (Intermediate!4018 false (index!18262 lt!229643) (x!47424 lt!229643))))))

(assert (=> b!504316 (=> (not res!305565) (not e!295279))))

(assert (=> b!504316 e!295279))

(declare-fun b!504317 () Bool)

(declare-fun res!305555 () Bool)

(assert (=> b!504317 (=> res!305555 e!295278)))

(get-info :version)

(assert (=> b!504317 (= res!305555 (or (undefined!4830 lt!229643) (not ((_ is Intermediate!4018) lt!229643))))))

(declare-fun b!504318 () Bool)

(declare-fun res!305557 () Bool)

(assert (=> b!504318 (=> (not res!305557) (not e!295280))))

(declare-datatypes ((List!9660 0))(
  ( (Nil!9657) (Cons!9656 (h!10533 (_ BitVec 64)) (t!15880 List!9660)) )
))
(declare-fun arrayNoDuplicates!0 (array!32431 (_ BitVec 32) List!9660) Bool)

(assert (=> b!504318 (= res!305557 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9657))))

(declare-fun b!504319 () Bool)

(assert (=> b!504319 (= e!295283 e!295280)))

(declare-fun res!305554 () Bool)

(assert (=> b!504319 (=> (not res!305554) (not e!295280))))

(declare-fun lt!229638 () SeekEntryResult!4018)

(assert (=> b!504319 (= res!305554 (or (= lt!229638 (MissingZero!4018 i!1204)) (= lt!229638 (MissingVacant!4018 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32431 (_ BitVec 32)) SeekEntryResult!4018)

(assert (=> b!504319 (= lt!229638 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504320 () Bool)

(declare-fun res!305558 () Bool)

(assert (=> b!504320 (=> res!305558 e!295277)))

(assert (=> b!504320 (= res!305558 e!295281)))

(declare-fun res!305559 () Bool)

(assert (=> b!504320 (=> (not res!305559) (not e!295281))))

(assert (=> b!504320 (= res!305559 (bvsgt #b00000000000000000000000000000000 (x!47424 lt!229643)))))

(declare-fun b!504321 () Bool)

(declare-fun res!305564 () Bool)

(assert (=> b!504321 (=> (not res!305564) (not e!295283))))

(declare-fun arrayContainsKey!0 (array!32431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504321 (= res!305564 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504311 () Bool)

(assert (=> b!504311 (= e!295280 (not e!295278))))

(declare-fun res!305552 () Bool)

(assert (=> b!504311 (=> res!305552 e!295278)))

(declare-fun lt!229647 () (_ BitVec 32))

(assert (=> b!504311 (= res!305552 (= lt!229643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229647 lt!229639 lt!229645 mask!3524)))))

(assert (=> b!504311 (= lt!229643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229642 (select (arr!15595 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504311 (= lt!229647 (toIndex!0 lt!229639 mask!3524))))

(assert (=> b!504311 (= lt!229639 (select (store (arr!15595 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504311 (= lt!229642 (toIndex!0 (select (arr!15595 a!3235) j!176) mask!3524))))

(assert (=> b!504311 (= lt!229645 (array!32432 (store (arr!15595 a!3235) i!1204 k0!2280) (size!15959 a!3235)))))

(declare-fun e!295282 () Bool)

(assert (=> b!504311 e!295282))

(declare-fun res!305563 () Bool)

(assert (=> b!504311 (=> (not res!305563) (not e!295282))))

(assert (=> b!504311 (= res!305563 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229648 () Unit!15307)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15307)

(assert (=> b!504311 (= lt!229648 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!305566 () Bool)

(assert (=> start!45674 (=> (not res!305566) (not e!295283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45674 (= res!305566 (validMask!0 mask!3524))))

(assert (=> start!45674 e!295283))

(assert (=> start!45674 true))

(declare-fun array_inv!11454 (array!32431) Bool)

(assert (=> start!45674 (array_inv!11454 a!3235)))

(declare-fun b!504322 () Bool)

(assert (=> b!504322 (= e!295277 true)))

(declare-fun lt!229646 () SeekEntryResult!4018)

(assert (=> b!504322 (= lt!229646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229642 lt!229639 lt!229645 mask!3524))))

(declare-fun b!504323 () Bool)

(assert (=> b!504323 (= e!295282 (= (seekEntryOrOpen!0 (select (arr!15595 a!3235) j!176) a!3235 mask!3524) (Found!4018 j!176)))))

(declare-fun b!504324 () Bool)

(declare-fun Unit!15310 () Unit!15307)

(assert (=> b!504324 (= e!295284 Unit!15310)))

(declare-fun b!504325 () Bool)

(declare-fun res!305561 () Bool)

(assert (=> b!504325 (=> (not res!305561) (not e!295283))))

(assert (=> b!504325 (= res!305561 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45674 res!305566) b!504313))

(assert (= (and b!504313 res!305560) b!504315))

(assert (= (and b!504315 res!305556) b!504325))

(assert (= (and b!504325 res!305561) b!504321))

(assert (= (and b!504321 res!305564) b!504319))

(assert (= (and b!504319 res!305554) b!504309))

(assert (= (and b!504309 res!305553) b!504318))

(assert (= (and b!504318 res!305557) b!504311))

(assert (= (and b!504311 res!305563) b!504323))

(assert (= (and b!504311 (not res!305552)) b!504317))

(assert (= (and b!504317 (not res!305555)) b!504310))

(assert (= (and b!504310 c!59657) b!504316))

(assert (= (and b!504310 (not c!59657)) b!504324))

(assert (= (and b!504316 res!305565) b!504312))

(assert (= (and b!504310 (not res!305562)) b!504320))

(assert (= (and b!504320 res!305559) b!504314))

(assert (= (and b!504320 (not res!305558)) b!504322))

(declare-fun m!485299 () Bool)

(assert (=> b!504310 m!485299))

(declare-fun m!485301 () Bool)

(assert (=> b!504310 m!485301))

(declare-fun m!485303 () Bool)

(assert (=> b!504310 m!485303))

(assert (=> b!504314 m!485303))

(assert (=> b!504314 m!485303))

(declare-fun m!485305 () Bool)

(assert (=> b!504314 m!485305))

(declare-fun m!485307 () Bool)

(assert (=> b!504325 m!485307))

(declare-fun m!485309 () Bool)

(assert (=> b!504319 m!485309))

(declare-fun m!485311 () Bool)

(assert (=> b!504309 m!485311))

(declare-fun m!485313 () Bool)

(assert (=> start!45674 m!485313))

(declare-fun m!485315 () Bool)

(assert (=> start!45674 m!485315))

(declare-fun m!485317 () Bool)

(assert (=> b!504316 m!485317))

(declare-fun m!485319 () Bool)

(assert (=> b!504316 m!485319))

(assert (=> b!504323 m!485303))

(assert (=> b!504323 m!485303))

(declare-fun m!485321 () Bool)

(assert (=> b!504323 m!485321))

(declare-fun m!485323 () Bool)

(assert (=> b!504318 m!485323))

(assert (=> b!504315 m!485303))

(assert (=> b!504315 m!485303))

(declare-fun m!485325 () Bool)

(assert (=> b!504315 m!485325))

(assert (=> b!504322 m!485319))

(declare-fun m!485327 () Bool)

(assert (=> b!504311 m!485327))

(declare-fun m!485329 () Bool)

(assert (=> b!504311 m!485329))

(assert (=> b!504311 m!485303))

(declare-fun m!485331 () Bool)

(assert (=> b!504311 m!485331))

(assert (=> b!504311 m!485303))

(declare-fun m!485333 () Bool)

(assert (=> b!504311 m!485333))

(assert (=> b!504311 m!485303))

(declare-fun m!485335 () Bool)

(assert (=> b!504311 m!485335))

(declare-fun m!485337 () Bool)

(assert (=> b!504311 m!485337))

(declare-fun m!485339 () Bool)

(assert (=> b!504311 m!485339))

(declare-fun m!485341 () Bool)

(assert (=> b!504311 m!485341))

(declare-fun m!485343 () Bool)

(assert (=> b!504321 m!485343))

(check-sat (not start!45674) (not b!504311) (not b!504325) (not b!504310) (not b!504319) (not b!504323) (not b!504309) (not b!504315) (not b!504318) (not b!504322) (not b!504314) (not b!504316) (not b!504321))
(check-sat)
