; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45716 () Bool)

(assert start!45716)

(declare-fun b!505380 () Bool)

(declare-fun e!295851 () Bool)

(assert (=> b!505380 (= e!295851 true)))

(declare-datatypes ((array!32473 0))(
  ( (array!32474 (arr!15616 (Array (_ BitVec 32) (_ BitVec 64))) (size!15980 (_ BitVec 32))) )
))
(declare-fun lt!230378 () array!32473)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!230375 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4039 0))(
  ( (MissingZero!4039 (index!18344 (_ BitVec 32))) (Found!4039 (index!18345 (_ BitVec 32))) (Intermediate!4039 (undefined!4851 Bool) (index!18346 (_ BitVec 32)) (x!47501 (_ BitVec 32))) (Undefined!4039) (MissingVacant!4039 (index!18347 (_ BitVec 32))) )
))
(declare-fun lt!230379 () SeekEntryResult!4039)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32473 (_ BitVec 32)) SeekEntryResult!4039)

(assert (=> b!505380 (= (seekEntryOrOpen!0 lt!230375 lt!230378 mask!3524) lt!230379)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((Unit!15391 0))(
  ( (Unit!15392) )
))
(declare-fun lt!230374 () Unit!15391)

(declare-fun a!3235 () array!32473)

(declare-fun lt!230371 () SeekEntryResult!4039)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!230382 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15391)

(assert (=> b!505380 (= lt!230374 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230382 #b00000000000000000000000000000000 (index!18346 lt!230371) (x!47501 lt!230371) mask!3524))))

(declare-fun b!505381 () Bool)

(declare-fun e!295846 () Bool)

(assert (=> b!505381 (= e!295846 e!295851)))

(declare-fun res!306505 () Bool)

(assert (=> b!505381 (=> res!306505 e!295851)))

(assert (=> b!505381 (= res!306505 (or (bvsgt (x!47501 lt!230371) #b01111111111111111111111111111110) (bvslt lt!230382 #b00000000000000000000000000000000) (bvsge lt!230382 (size!15980 a!3235)) (bvslt (index!18346 lt!230371) #b00000000000000000000000000000000) (bvsge (index!18346 lt!230371) (size!15980 a!3235)) (not (= lt!230371 (Intermediate!4039 false (index!18346 lt!230371) (x!47501 lt!230371))))))))

(assert (=> b!505381 (= (index!18346 lt!230371) i!1204)))

(declare-fun lt!230372 () Unit!15391)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15391)

(assert (=> b!505381 (= lt!230372 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230382 #b00000000000000000000000000000000 (index!18346 lt!230371) (x!47501 lt!230371) mask!3524))))

(assert (=> b!505381 (and (or (= (select (arr!15616 a!3235) (index!18346 lt!230371)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15616 a!3235) (index!18346 lt!230371)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15616 a!3235) (index!18346 lt!230371)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15616 a!3235) (index!18346 lt!230371)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230377 () Unit!15391)

(declare-fun e!295844 () Unit!15391)

(assert (=> b!505381 (= lt!230377 e!295844)))

(declare-fun c!59720 () Bool)

(assert (=> b!505381 (= c!59720 (= (select (arr!15616 a!3235) (index!18346 lt!230371)) (select (arr!15616 a!3235) j!176)))))

(assert (=> b!505381 (and (bvslt (x!47501 lt!230371) #b01111111111111111111111111111110) (or (= (select (arr!15616 a!3235) (index!18346 lt!230371)) (select (arr!15616 a!3235) j!176)) (= (select (arr!15616 a!3235) (index!18346 lt!230371)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15616 a!3235) (index!18346 lt!230371)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505383 () Bool)

(declare-fun Unit!15393 () Unit!15391)

(assert (=> b!505383 (= e!295844 Unit!15393)))

(declare-fun lt!230383 () Unit!15391)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15391)

(assert (=> b!505383 (= lt!230383 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230382 #b00000000000000000000000000000000 (index!18346 lt!230371) (x!47501 lt!230371) mask!3524))))

(declare-fun res!306508 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32473 (_ BitVec 32)) SeekEntryResult!4039)

(assert (=> b!505383 (= res!306508 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230382 lt!230375 lt!230378 mask!3524) (Intermediate!4039 false (index!18346 lt!230371) (x!47501 lt!230371))))))

(declare-fun e!295849 () Bool)

(assert (=> b!505383 (=> (not res!306508) (not e!295849))))

(assert (=> b!505383 e!295849))

(declare-fun b!505384 () Bool)

(declare-fun res!306506 () Bool)

(declare-fun e!295845 () Bool)

(assert (=> b!505384 (=> (not res!306506) (not e!295845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32473 (_ BitVec 32)) Bool)

(assert (=> b!505384 (= res!306506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505385 () Bool)

(declare-fun res!306497 () Bool)

(declare-fun e!295848 () Bool)

(assert (=> b!505385 (=> (not res!306497) (not e!295848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505385 (= res!306497 (validKeyInArray!0 (select (arr!15616 a!3235) j!176)))))

(declare-fun b!505386 () Bool)

(declare-fun Unit!15394 () Unit!15391)

(assert (=> b!505386 (= e!295844 Unit!15394)))

(declare-fun b!505387 () Bool)

(declare-fun res!306499 () Bool)

(assert (=> b!505387 (=> (not res!306499) (not e!295848))))

(assert (=> b!505387 (= res!306499 (validKeyInArray!0 k0!2280))))

(declare-fun b!505388 () Bool)

(declare-fun res!306510 () Bool)

(assert (=> b!505388 (=> (not res!306510) (not e!295848))))

(declare-fun arrayContainsKey!0 (array!32473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505388 (= res!306510 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505389 () Bool)

(assert (=> b!505389 (= e!295849 false)))

(declare-fun res!306504 () Bool)

(assert (=> start!45716 (=> (not res!306504) (not e!295848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45716 (= res!306504 (validMask!0 mask!3524))))

(assert (=> start!45716 e!295848))

(assert (=> start!45716 true))

(declare-fun array_inv!11475 (array!32473) Bool)

(assert (=> start!45716 (array_inv!11475 a!3235)))

(declare-fun b!505382 () Bool)

(declare-fun res!306503 () Bool)

(assert (=> b!505382 (=> res!306503 e!295851)))

(declare-fun lt!230373 () SeekEntryResult!4039)

(assert (=> b!505382 (= res!306503 (not (= lt!230373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230382 lt!230375 lt!230378 mask!3524))))))

(declare-fun b!505390 () Bool)

(declare-fun res!306509 () Bool)

(assert (=> b!505390 (=> res!306509 e!295851)))

(declare-fun e!295847 () Bool)

(assert (=> b!505390 (= res!306509 e!295847)))

(declare-fun res!306498 () Bool)

(assert (=> b!505390 (=> (not res!306498) (not e!295847))))

(assert (=> b!505390 (= res!306498 (bvsgt #b00000000000000000000000000000000 (x!47501 lt!230371)))))

(declare-fun b!505391 () Bool)

(declare-fun res!306511 () Bool)

(assert (=> b!505391 (=> (not res!306511) (not e!295845))))

(declare-datatypes ((List!9681 0))(
  ( (Nil!9678) (Cons!9677 (h!10554 (_ BitVec 64)) (t!15901 List!9681)) )
))
(declare-fun arrayNoDuplicates!0 (array!32473 (_ BitVec 32) List!9681) Bool)

(assert (=> b!505391 (= res!306511 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9678))))

(declare-fun b!505392 () Bool)

(assert (=> b!505392 (= e!295845 (not e!295846))))

(declare-fun res!306507 () Bool)

(assert (=> b!505392 (=> res!306507 e!295846)))

(get-info :version)

(assert (=> b!505392 (= res!306507 (or (= lt!230371 lt!230373) (undefined!4851 lt!230371) (not ((_ is Intermediate!4039) lt!230371))))))

(declare-fun lt!230381 () (_ BitVec 32))

(assert (=> b!505392 (= lt!230373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230381 lt!230375 lt!230378 mask!3524))))

(assert (=> b!505392 (= lt!230371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230382 (select (arr!15616 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505392 (= lt!230381 (toIndex!0 lt!230375 mask!3524))))

(assert (=> b!505392 (= lt!230375 (select (store (arr!15616 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505392 (= lt!230382 (toIndex!0 (select (arr!15616 a!3235) j!176) mask!3524))))

(assert (=> b!505392 (= lt!230378 (array!32474 (store (arr!15616 a!3235) i!1204 k0!2280) (size!15980 a!3235)))))

(assert (=> b!505392 (= lt!230379 (Found!4039 j!176))))

(declare-fun e!295850 () Bool)

(assert (=> b!505392 e!295850))

(declare-fun res!306502 () Bool)

(assert (=> b!505392 (=> (not res!306502) (not e!295850))))

(assert (=> b!505392 (= res!306502 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230380 () Unit!15391)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15391)

(assert (=> b!505392 (= lt!230380 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505393 () Bool)

(assert (=> b!505393 (= e!295848 e!295845)))

(declare-fun res!306500 () Bool)

(assert (=> b!505393 (=> (not res!306500) (not e!295845))))

(declare-fun lt!230376 () SeekEntryResult!4039)

(assert (=> b!505393 (= res!306500 (or (= lt!230376 (MissingZero!4039 i!1204)) (= lt!230376 (MissingVacant!4039 i!1204))))))

(assert (=> b!505393 (= lt!230376 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505394 () Bool)

(assert (=> b!505394 (= e!295850 (= (seekEntryOrOpen!0 (select (arr!15616 a!3235) j!176) a!3235 mask!3524) (Found!4039 j!176)))))

(declare-fun b!505395 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32473 (_ BitVec 32)) SeekEntryResult!4039)

(assert (=> b!505395 (= e!295847 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230382 (index!18346 lt!230371) (select (arr!15616 a!3235) j!176) a!3235 mask!3524) lt!230379)))))

(declare-fun b!505396 () Bool)

(declare-fun res!306501 () Bool)

(assert (=> b!505396 (=> (not res!306501) (not e!295848))))

(assert (=> b!505396 (= res!306501 (and (= (size!15980 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15980 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15980 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45716 res!306504) b!505396))

(assert (= (and b!505396 res!306501) b!505385))

(assert (= (and b!505385 res!306497) b!505387))

(assert (= (and b!505387 res!306499) b!505388))

(assert (= (and b!505388 res!306510) b!505393))

(assert (= (and b!505393 res!306500) b!505384))

(assert (= (and b!505384 res!306506) b!505391))

(assert (= (and b!505391 res!306511) b!505392))

(assert (= (and b!505392 res!306502) b!505394))

(assert (= (and b!505392 (not res!306507)) b!505381))

(assert (= (and b!505381 c!59720) b!505383))

(assert (= (and b!505381 (not c!59720)) b!505386))

(assert (= (and b!505383 res!306508) b!505389))

(assert (= (and b!505381 (not res!306505)) b!505390))

(assert (= (and b!505390 res!306498) b!505395))

(assert (= (and b!505390 (not res!306509)) b!505382))

(assert (= (and b!505382 (not res!306503)) b!505380))

(declare-fun m!486289 () Bool)

(assert (=> start!45716 m!486289))

(declare-fun m!486291 () Bool)

(assert (=> start!45716 m!486291))

(declare-fun m!486293 () Bool)

(assert (=> b!505392 m!486293))

(declare-fun m!486295 () Bool)

(assert (=> b!505392 m!486295))

(declare-fun m!486297 () Bool)

(assert (=> b!505392 m!486297))

(declare-fun m!486299 () Bool)

(assert (=> b!505392 m!486299))

(declare-fun m!486301 () Bool)

(assert (=> b!505392 m!486301))

(declare-fun m!486303 () Bool)

(assert (=> b!505392 m!486303))

(declare-fun m!486305 () Bool)

(assert (=> b!505392 m!486305))

(assert (=> b!505392 m!486303))

(declare-fun m!486307 () Bool)

(assert (=> b!505392 m!486307))

(assert (=> b!505392 m!486303))

(declare-fun m!486309 () Bool)

(assert (=> b!505392 m!486309))

(declare-fun m!486311 () Bool)

(assert (=> b!505387 m!486311))

(declare-fun m!486313 () Bool)

(assert (=> b!505382 m!486313))

(assert (=> b!505395 m!486303))

(assert (=> b!505395 m!486303))

(declare-fun m!486315 () Bool)

(assert (=> b!505395 m!486315))

(assert (=> b!505385 m!486303))

(assert (=> b!505385 m!486303))

(declare-fun m!486317 () Bool)

(assert (=> b!505385 m!486317))

(declare-fun m!486319 () Bool)

(assert (=> b!505381 m!486319))

(declare-fun m!486321 () Bool)

(assert (=> b!505381 m!486321))

(assert (=> b!505381 m!486303))

(declare-fun m!486323 () Bool)

(assert (=> b!505391 m!486323))

(declare-fun m!486325 () Bool)

(assert (=> b!505380 m!486325))

(declare-fun m!486327 () Bool)

(assert (=> b!505380 m!486327))

(declare-fun m!486329 () Bool)

(assert (=> b!505383 m!486329))

(assert (=> b!505383 m!486313))

(declare-fun m!486331 () Bool)

(assert (=> b!505388 m!486331))

(assert (=> b!505394 m!486303))

(assert (=> b!505394 m!486303))

(declare-fun m!486333 () Bool)

(assert (=> b!505394 m!486333))

(declare-fun m!486335 () Bool)

(assert (=> b!505393 m!486335))

(declare-fun m!486337 () Bool)

(assert (=> b!505384 m!486337))

(check-sat (not b!505391) (not start!45716) (not b!505384) (not b!505381) (not b!505388) (not b!505387) (not b!505395) (not b!505393) (not b!505382) (not b!505380) (not b!505385) (not b!505392) (not b!505394) (not b!505383))
(check-sat)
