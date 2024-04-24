; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66868 () Bool)

(assert start!66868)

(declare-fun b!769541 () Bool)

(declare-datatypes ((Unit!26419 0))(
  ( (Unit!26420) )
))
(declare-fun e!428596 () Unit!26419)

(declare-fun Unit!26421 () Unit!26419)

(assert (=> b!769541 (= e!428596 Unit!26421)))

(declare-datatypes ((array!42310 0))(
  ( (array!42311 (arr!20251 (Array (_ BitVec 32) (_ BitVec 64))) (size!20671 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42310)

(declare-fun lt!342322 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7807 0))(
  ( (MissingZero!7807 (index!33596 (_ BitVec 32))) (Found!7807 (index!33597 (_ BitVec 32))) (Intermediate!7807 (undefined!8619 Bool) (index!33598 (_ BitVec 32)) (x!64693 (_ BitVec 32))) (Undefined!7807) (MissingVacant!7807 (index!33599 (_ BitVec 32))) )
))
(declare-fun lt!342319 () SeekEntryResult!7807)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42310 (_ BitVec 32)) SeekEntryResult!7807)

(assert (=> b!769541 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342322 (select (arr!20251 a!3186) j!159) a!3186 mask!3328) lt!342319)))

(declare-fun b!769542 () Bool)

(declare-fun res!520200 () Bool)

(declare-fun e!428600 () Bool)

(assert (=> b!769542 (=> (not res!520200) (not e!428600))))

(declare-datatypes ((List!14160 0))(
  ( (Nil!14157) (Cons!14156 (h!15261 (_ BitVec 64)) (t!20467 List!14160)) )
))
(declare-fun arrayNoDuplicates!0 (array!42310 (_ BitVec 32) List!14160) Bool)

(assert (=> b!769542 (= res!520200 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14157))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!428605 () Bool)

(declare-fun b!769543 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42310 (_ BitVec 32)) SeekEntryResult!7807)

(assert (=> b!769543 (= e!428605 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20251 a!3186) j!159) a!3186 mask!3328) (Found!7807 j!159)))))

(declare-fun b!769544 () Bool)

(declare-fun res!520188 () Bool)

(declare-fun e!428599 () Bool)

(assert (=> b!769544 (=> (not res!520188) (not e!428599))))

(assert (=> b!769544 (= res!520188 e!428605)))

(declare-fun c!85076 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769544 (= c!85076 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769545 () Bool)

(assert (=> b!769545 (= e!428605 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20251 a!3186) j!159) a!3186 mask!3328) lt!342319))))

(declare-fun b!769546 () Bool)

(declare-fun e!428598 () Bool)

(assert (=> b!769546 (= e!428598 true)))

(declare-fun lt!342325 () Unit!26419)

(assert (=> b!769546 (= lt!342325 e!428596)))

(declare-fun c!85075 () Bool)

(assert (=> b!769546 (= c!85075 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769546 (= lt!342322 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!769547 () Bool)

(declare-fun res!520193 () Bool)

(declare-fun e!428601 () Bool)

(assert (=> b!769547 (=> (not res!520193) (not e!428601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769547 (= res!520193 (validKeyInArray!0 (select (arr!20251 a!3186) j!159)))))

(declare-fun b!769548 () Bool)

(assert (=> b!769548 (= e!428600 e!428599)))

(declare-fun res!520189 () Bool)

(assert (=> b!769548 (=> (not res!520189) (not e!428599))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769548 (= res!520189 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20251 a!3186) j!159) mask!3328) (select (arr!20251 a!3186) j!159) a!3186 mask!3328) lt!342319))))

(assert (=> b!769548 (= lt!342319 (Intermediate!7807 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769549 () Bool)

(declare-fun res!520197 () Bool)

(assert (=> b!769549 (=> (not res!520197) (not e!428600))))

(assert (=> b!769549 (= res!520197 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20671 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20671 a!3186))))))

(declare-fun b!769550 () Bool)

(declare-fun Unit!26422 () Unit!26419)

(assert (=> b!769550 (= e!428596 Unit!26422)))

(declare-fun lt!342327 () SeekEntryResult!7807)

(assert (=> b!769550 (= lt!342327 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20251 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769550 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342322 resIntermediateIndex!5 (select (arr!20251 a!3186) j!159) a!3186 mask!3328) (Found!7807 j!159))))

(declare-fun b!769551 () Bool)

(declare-fun res!520195 () Bool)

(assert (=> b!769551 (=> (not res!520195) (not e!428601))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!769551 (= res!520195 (validKeyInArray!0 k0!2102))))

(declare-fun b!769552 () Bool)

(assert (=> b!769552 (= e!428601 e!428600)))

(declare-fun res!520202 () Bool)

(assert (=> b!769552 (=> (not res!520202) (not e!428600))))

(declare-fun lt!342328 () SeekEntryResult!7807)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769552 (= res!520202 (or (= lt!342328 (MissingZero!7807 i!1173)) (= lt!342328 (MissingVacant!7807 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42310 (_ BitVec 32)) SeekEntryResult!7807)

(assert (=> b!769552 (= lt!342328 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769553 () Bool)

(declare-fun e!428603 () Bool)

(assert (=> b!769553 (= e!428603 (not e!428598))))

(declare-fun res!520194 () Bool)

(assert (=> b!769553 (=> res!520194 e!428598)))

(declare-fun lt!342326 () SeekEntryResult!7807)

(get-info :version)

(assert (=> b!769553 (= res!520194 (or (not ((_ is Intermediate!7807) lt!342326)) (bvsge x!1131 (x!64693 lt!342326))))))

(declare-fun e!428597 () Bool)

(assert (=> b!769553 e!428597))

(declare-fun res!520196 () Bool)

(assert (=> b!769553 (=> (not res!520196) (not e!428597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42310 (_ BitVec 32)) Bool)

(assert (=> b!769553 (= res!520196 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342323 () Unit!26419)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26419)

(assert (=> b!769553 (= lt!342323 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769554 () Bool)

(declare-fun res!520190 () Bool)

(assert (=> b!769554 (=> (not res!520190) (not e!428601))))

(assert (=> b!769554 (= res!520190 (and (= (size!20671 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20671 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20671 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!342320 () SeekEntryResult!7807)

(declare-fun b!769556 () Bool)

(declare-fun e!428604 () Bool)

(assert (=> b!769556 (= e!428604 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20251 a!3186) j!159) a!3186 mask!3328) lt!342320))))

(declare-fun b!769555 () Bool)

(assert (=> b!769555 (= e!428599 e!428603)))

(declare-fun res!520201 () Bool)

(assert (=> b!769555 (=> (not res!520201) (not e!428603))))

(declare-fun lt!342324 () SeekEntryResult!7807)

(assert (=> b!769555 (= res!520201 (= lt!342324 lt!342326))))

(declare-fun lt!342318 () (_ BitVec 64))

(declare-fun lt!342321 () array!42310)

(assert (=> b!769555 (= lt!342326 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342318 lt!342321 mask!3328))))

(assert (=> b!769555 (= lt!342324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342318 mask!3328) lt!342318 lt!342321 mask!3328))))

(assert (=> b!769555 (= lt!342318 (select (store (arr!20251 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769555 (= lt!342321 (array!42311 (store (arr!20251 a!3186) i!1173 k0!2102) (size!20671 a!3186)))))

(declare-fun res!520191 () Bool)

(assert (=> start!66868 (=> (not res!520191) (not e!428601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66868 (= res!520191 (validMask!0 mask!3328))))

(assert (=> start!66868 e!428601))

(assert (=> start!66868 true))

(declare-fun array_inv!16110 (array!42310) Bool)

(assert (=> start!66868 (array_inv!16110 a!3186)))

(declare-fun b!769557 () Bool)

(declare-fun res!520192 () Bool)

(assert (=> b!769557 (=> (not res!520192) (not e!428600))))

(assert (=> b!769557 (= res!520192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769558 () Bool)

(declare-fun res!520198 () Bool)

(assert (=> b!769558 (=> (not res!520198) (not e!428599))))

(assert (=> b!769558 (= res!520198 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20251 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769559 () Bool)

(assert (=> b!769559 (= e!428597 e!428604)))

(declare-fun res!520199 () Bool)

(assert (=> b!769559 (=> (not res!520199) (not e!428604))))

(assert (=> b!769559 (= res!520199 (= (seekEntryOrOpen!0 (select (arr!20251 a!3186) j!159) a!3186 mask!3328) lt!342320))))

(assert (=> b!769559 (= lt!342320 (Found!7807 j!159))))

(declare-fun b!769560 () Bool)

(declare-fun res!520203 () Bool)

(assert (=> b!769560 (=> (not res!520203) (not e!428601))))

(declare-fun arrayContainsKey!0 (array!42310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769560 (= res!520203 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66868 res!520191) b!769554))

(assert (= (and b!769554 res!520190) b!769547))

(assert (= (and b!769547 res!520193) b!769551))

(assert (= (and b!769551 res!520195) b!769560))

(assert (= (and b!769560 res!520203) b!769552))

(assert (= (and b!769552 res!520202) b!769557))

(assert (= (and b!769557 res!520192) b!769542))

(assert (= (and b!769542 res!520200) b!769549))

(assert (= (and b!769549 res!520197) b!769548))

(assert (= (and b!769548 res!520189) b!769558))

(assert (= (and b!769558 res!520198) b!769544))

(assert (= (and b!769544 c!85076) b!769545))

(assert (= (and b!769544 (not c!85076)) b!769543))

(assert (= (and b!769544 res!520188) b!769555))

(assert (= (and b!769555 res!520201) b!769553))

(assert (= (and b!769553 res!520196) b!769559))

(assert (= (and b!769559 res!520199) b!769556))

(assert (= (and b!769553 (not res!520194)) b!769546))

(assert (= (and b!769546 c!85075) b!769541))

(assert (= (and b!769546 (not c!85075)) b!769550))

(declare-fun m!715427 () Bool)

(assert (=> b!769558 m!715427))

(declare-fun m!715429 () Bool)

(assert (=> b!769559 m!715429))

(assert (=> b!769559 m!715429))

(declare-fun m!715431 () Bool)

(assert (=> b!769559 m!715431))

(declare-fun m!715433 () Bool)

(assert (=> b!769557 m!715433))

(assert (=> b!769556 m!715429))

(assert (=> b!769556 m!715429))

(declare-fun m!715435 () Bool)

(assert (=> b!769556 m!715435))

(declare-fun m!715437 () Bool)

(assert (=> start!66868 m!715437))

(declare-fun m!715439 () Bool)

(assert (=> start!66868 m!715439))

(assert (=> b!769550 m!715429))

(assert (=> b!769550 m!715429))

(declare-fun m!715441 () Bool)

(assert (=> b!769550 m!715441))

(assert (=> b!769550 m!715429))

(declare-fun m!715443 () Bool)

(assert (=> b!769550 m!715443))

(assert (=> b!769543 m!715429))

(assert (=> b!769543 m!715429))

(assert (=> b!769543 m!715441))

(declare-fun m!715445 () Bool)

(assert (=> b!769546 m!715445))

(declare-fun m!715447 () Bool)

(assert (=> b!769555 m!715447))

(declare-fun m!715449 () Bool)

(assert (=> b!769555 m!715449))

(declare-fun m!715451 () Bool)

(assert (=> b!769555 m!715451))

(declare-fun m!715453 () Bool)

(assert (=> b!769555 m!715453))

(assert (=> b!769555 m!715449))

(declare-fun m!715455 () Bool)

(assert (=> b!769555 m!715455))

(assert (=> b!769545 m!715429))

(assert (=> b!769545 m!715429))

(declare-fun m!715457 () Bool)

(assert (=> b!769545 m!715457))

(assert (=> b!769547 m!715429))

(assert (=> b!769547 m!715429))

(declare-fun m!715459 () Bool)

(assert (=> b!769547 m!715459))

(assert (=> b!769541 m!715429))

(assert (=> b!769541 m!715429))

(declare-fun m!715461 () Bool)

(assert (=> b!769541 m!715461))

(assert (=> b!769548 m!715429))

(assert (=> b!769548 m!715429))

(declare-fun m!715463 () Bool)

(assert (=> b!769548 m!715463))

(assert (=> b!769548 m!715463))

(assert (=> b!769548 m!715429))

(declare-fun m!715465 () Bool)

(assert (=> b!769548 m!715465))

(declare-fun m!715467 () Bool)

(assert (=> b!769560 m!715467))

(declare-fun m!715469 () Bool)

(assert (=> b!769551 m!715469))

(declare-fun m!715471 () Bool)

(assert (=> b!769552 m!715471))

(declare-fun m!715473 () Bool)

(assert (=> b!769553 m!715473))

(declare-fun m!715475 () Bool)

(assert (=> b!769553 m!715475))

(declare-fun m!715477 () Bool)

(assert (=> b!769542 m!715477))

(check-sat (not b!769547) (not b!769560) (not b!769543) (not b!769557) (not b!769551) (not b!769546) (not b!769556) (not b!769541) (not b!769542) (not b!769550) (not start!66868) (not b!769545) (not b!769548) (not b!769552) (not b!769553) (not b!769559) (not b!769555))
(check-sat)
