; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67358 () Bool)

(assert start!67358)

(declare-fun b!779403 () Bool)

(declare-fun e!433557 () Bool)

(declare-fun e!433561 () Bool)

(assert (=> b!779403 (= e!433557 e!433561)))

(declare-fun res!527485 () Bool)

(assert (=> b!779403 (=> res!527485 e!433561)))

(declare-datatypes ((SeekEntryResult!7993 0))(
  ( (MissingZero!7993 (index!34340 (_ BitVec 32))) (Found!7993 (index!34341 (_ BitVec 32))) (Intermediate!7993 (undefined!8805 Bool) (index!34342 (_ BitVec 32)) (x!65293 (_ BitVec 32))) (Undefined!7993) (MissingVacant!7993 (index!34343 (_ BitVec 32))) )
))
(declare-fun lt!347184 () SeekEntryResult!7993)

(declare-datatypes ((array!42606 0))(
  ( (array!42607 (arr!20396 (Array (_ BitVec 32) (_ BitVec 64))) (size!20817 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42606)

(declare-fun lt!347183 () SeekEntryResult!7993)

(declare-fun lt!347182 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779403 (= res!527485 (or (not (= lt!347184 lt!347183)) (= (select (store (arr!20396 a!3186) i!1173 k0!2102) index!1321) lt!347182) (not (= (select (store (arr!20396 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42606 (_ BitVec 32)) SeekEntryResult!7993)

(assert (=> b!779403 (= lt!347184 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20396 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779404 () Bool)

(declare-fun res!527480 () Bool)

(declare-fun e!433558 () Bool)

(assert (=> b!779404 (=> (not res!527480) (not e!433558))))

(assert (=> b!779404 (= res!527480 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20396 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779405 () Bool)

(declare-fun e!433562 () Bool)

(declare-fun lt!347181 () SeekEntryResult!7993)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42606 (_ BitVec 32)) SeekEntryResult!7993)

(assert (=> b!779405 (= e!433562 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347181))))

(declare-fun b!779406 () Bool)

(declare-fun res!527478 () Bool)

(declare-fun e!433556 () Bool)

(assert (=> b!779406 (=> (not res!527478) (not e!433556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779406 (= res!527478 (validKeyInArray!0 k0!2102))))

(declare-fun b!779407 () Bool)

(declare-fun res!527477 () Bool)

(assert (=> b!779407 (=> (not res!527477) (not e!433556))))

(assert (=> b!779407 (= res!527477 (validKeyInArray!0 (select (arr!20396 a!3186) j!159)))))

(declare-fun b!779408 () Bool)

(declare-fun e!433564 () Bool)

(assert (=> b!779408 (= e!433556 e!433564)))

(declare-fun res!527481 () Bool)

(assert (=> b!779408 (=> (not res!527481) (not e!433564))))

(declare-fun lt!347185 () SeekEntryResult!7993)

(assert (=> b!779408 (= res!527481 (or (= lt!347185 (MissingZero!7993 i!1173)) (= lt!347185 (MissingVacant!7993 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42606 (_ BitVec 32)) SeekEntryResult!7993)

(assert (=> b!779408 (= lt!347185 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779409 () Bool)

(declare-fun res!527475 () Bool)

(assert (=> b!779409 (=> (not res!527475) (not e!433564))))

(declare-datatypes ((List!14437 0))(
  ( (Nil!14434) (Cons!14433 (h!15547 (_ BitVec 64)) (t!20743 List!14437)) )
))
(declare-fun arrayNoDuplicates!0 (array!42606 (_ BitVec 32) List!14437) Bool)

(assert (=> b!779409 (= res!527475 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14434))))

(declare-fun e!433559 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!779410 () Bool)

(assert (=> b!779410 (= e!433559 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347183))))

(declare-fun b!779412 () Bool)

(assert (=> b!779412 (= e!433564 e!433558)))

(declare-fun res!527486 () Bool)

(assert (=> b!779412 (=> (not res!527486) (not e!433558))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779412 (= res!527486 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20396 a!3186) j!159) mask!3328) (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347181))))

(assert (=> b!779412 (= lt!347181 (Intermediate!7993 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779413 () Bool)

(declare-fun res!527487 () Bool)

(assert (=> b!779413 (=> (not res!527487) (not e!433556))))

(assert (=> b!779413 (= res!527487 (and (= (size!20817 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20817 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20817 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779414 () Bool)

(declare-fun res!527484 () Bool)

(assert (=> b!779414 (=> (not res!527484) (not e!433564))))

(assert (=> b!779414 (= res!527484 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20817 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20817 a!3186))))))

(declare-fun b!779415 () Bool)

(declare-fun res!527482 () Bool)

(assert (=> b!779415 (=> (not res!527482) (not e!433556))))

(declare-fun arrayContainsKey!0 (array!42606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779415 (= res!527482 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779416 () Bool)

(declare-fun res!527476 () Bool)

(assert (=> b!779416 (=> (not res!527476) (not e!433558))))

(assert (=> b!779416 (= res!527476 e!433562)))

(declare-fun c!86367 () Bool)

(assert (=> b!779416 (= c!86367 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779417 () Bool)

(declare-fun e!433560 () Bool)

(assert (=> b!779417 (= e!433558 e!433560)))

(declare-fun res!527483 () Bool)

(assert (=> b!779417 (=> (not res!527483) (not e!433560))))

(declare-fun lt!347188 () SeekEntryResult!7993)

(declare-fun lt!347189 () SeekEntryResult!7993)

(assert (=> b!779417 (= res!527483 (= lt!347188 lt!347189))))

(declare-fun lt!347180 () array!42606)

(assert (=> b!779417 (= lt!347189 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347182 lt!347180 mask!3328))))

(assert (=> b!779417 (= lt!347188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347182 mask!3328) lt!347182 lt!347180 mask!3328))))

(assert (=> b!779417 (= lt!347182 (select (store (arr!20396 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779417 (= lt!347180 (array!42607 (store (arr!20396 a!3186) i!1173 k0!2102) (size!20817 a!3186)))))

(declare-fun b!779418 () Bool)

(assert (=> b!779418 (= e!433562 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) (Found!7993 j!159)))))

(declare-fun b!779419 () Bool)

(assert (=> b!779419 (= e!433560 (not e!433557))))

(declare-fun res!527489 () Bool)

(assert (=> b!779419 (=> res!527489 e!433557)))

(get-info :version)

(assert (=> b!779419 (= res!527489 (or (not ((_ is Intermediate!7993) lt!347189)) (bvslt x!1131 (x!65293 lt!347189)) (not (= x!1131 (x!65293 lt!347189))) (not (= index!1321 (index!34342 lt!347189)))))))

(assert (=> b!779419 e!433559))

(declare-fun res!527479 () Bool)

(assert (=> b!779419 (=> (not res!527479) (not e!433559))))

(declare-fun lt!347186 () SeekEntryResult!7993)

(assert (=> b!779419 (= res!527479 (= lt!347186 lt!347183))))

(assert (=> b!779419 (= lt!347183 (Found!7993 j!159))))

(assert (=> b!779419 (= lt!347186 (seekEntryOrOpen!0 (select (arr!20396 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42606 (_ BitVec 32)) Bool)

(assert (=> b!779419 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26852 0))(
  ( (Unit!26853) )
))
(declare-fun lt!347187 () Unit!26852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26852)

(assert (=> b!779419 (= lt!347187 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779420 () Bool)

(assert (=> b!779420 (= e!433561 (= lt!347184 (MissingVacant!7993 resIntermediateIndex!5)))))

(assert (=> b!779420 (= lt!347186 lt!347184)))

(declare-fun b!779411 () Bool)

(declare-fun res!527488 () Bool)

(assert (=> b!779411 (=> (not res!527488) (not e!433564))))

(assert (=> b!779411 (= res!527488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!527490 () Bool)

(assert (=> start!67358 (=> (not res!527490) (not e!433556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67358 (= res!527490 (validMask!0 mask!3328))))

(assert (=> start!67358 e!433556))

(assert (=> start!67358 true))

(declare-fun array_inv!16279 (array!42606) Bool)

(assert (=> start!67358 (array_inv!16279 a!3186)))

(assert (= (and start!67358 res!527490) b!779413))

(assert (= (and b!779413 res!527487) b!779407))

(assert (= (and b!779407 res!527477) b!779406))

(assert (= (and b!779406 res!527478) b!779415))

(assert (= (and b!779415 res!527482) b!779408))

(assert (= (and b!779408 res!527481) b!779411))

(assert (= (and b!779411 res!527488) b!779409))

(assert (= (and b!779409 res!527475) b!779414))

(assert (= (and b!779414 res!527484) b!779412))

(assert (= (and b!779412 res!527486) b!779404))

(assert (= (and b!779404 res!527480) b!779416))

(assert (= (and b!779416 c!86367) b!779405))

(assert (= (and b!779416 (not c!86367)) b!779418))

(assert (= (and b!779416 res!527476) b!779417))

(assert (= (and b!779417 res!527483) b!779419))

(assert (= (and b!779419 res!527479) b!779410))

(assert (= (and b!779419 (not res!527489)) b!779403))

(assert (= (and b!779403 (not res!527485)) b!779420))

(declare-fun m!722385 () Bool)

(assert (=> b!779419 m!722385))

(assert (=> b!779419 m!722385))

(declare-fun m!722387 () Bool)

(assert (=> b!779419 m!722387))

(declare-fun m!722389 () Bool)

(assert (=> b!779419 m!722389))

(declare-fun m!722391 () Bool)

(assert (=> b!779419 m!722391))

(declare-fun m!722393 () Bool)

(assert (=> b!779415 m!722393))

(declare-fun m!722395 () Bool)

(assert (=> start!67358 m!722395))

(declare-fun m!722397 () Bool)

(assert (=> start!67358 m!722397))

(declare-fun m!722399 () Bool)

(assert (=> b!779408 m!722399))

(assert (=> b!779407 m!722385))

(assert (=> b!779407 m!722385))

(declare-fun m!722401 () Bool)

(assert (=> b!779407 m!722401))

(declare-fun m!722403 () Bool)

(assert (=> b!779411 m!722403))

(assert (=> b!779418 m!722385))

(assert (=> b!779418 m!722385))

(declare-fun m!722405 () Bool)

(assert (=> b!779418 m!722405))

(assert (=> b!779405 m!722385))

(assert (=> b!779405 m!722385))

(declare-fun m!722407 () Bool)

(assert (=> b!779405 m!722407))

(declare-fun m!722409 () Bool)

(assert (=> b!779406 m!722409))

(assert (=> b!779412 m!722385))

(assert (=> b!779412 m!722385))

(declare-fun m!722411 () Bool)

(assert (=> b!779412 m!722411))

(assert (=> b!779412 m!722411))

(assert (=> b!779412 m!722385))

(declare-fun m!722413 () Bool)

(assert (=> b!779412 m!722413))

(assert (=> b!779410 m!722385))

(assert (=> b!779410 m!722385))

(declare-fun m!722415 () Bool)

(assert (=> b!779410 m!722415))

(declare-fun m!722417 () Bool)

(assert (=> b!779417 m!722417))

(declare-fun m!722419 () Bool)

(assert (=> b!779417 m!722419))

(declare-fun m!722421 () Bool)

(assert (=> b!779417 m!722421))

(declare-fun m!722423 () Bool)

(assert (=> b!779417 m!722423))

(assert (=> b!779417 m!722417))

(declare-fun m!722425 () Bool)

(assert (=> b!779417 m!722425))

(assert (=> b!779403 m!722419))

(declare-fun m!722427 () Bool)

(assert (=> b!779403 m!722427))

(assert (=> b!779403 m!722385))

(assert (=> b!779403 m!722385))

(assert (=> b!779403 m!722405))

(declare-fun m!722429 () Bool)

(assert (=> b!779404 m!722429))

(declare-fun m!722431 () Bool)

(assert (=> b!779409 m!722431))

(check-sat (not b!779419) (not b!779409) (not b!779417) (not start!67358) (not b!779408) (not b!779407) (not b!779403) (not b!779418) (not b!779410) (not b!779415) (not b!779405) (not b!779406) (not b!779411) (not b!779412))
(check-sat)
(get-model)

(declare-fun e!433630 () SeekEntryResult!7993)

(declare-fun b!779547 () Bool)

(assert (=> b!779547 (= e!433630 (Intermediate!7993 true (toIndex!0 (select (arr!20396 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!779548 () Bool)

(declare-fun lt!347255 () SeekEntryResult!7993)

(assert (=> b!779548 (and (bvsge (index!34342 lt!347255) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347255) (size!20817 a!3186)))))

(declare-fun res!527594 () Bool)

(assert (=> b!779548 (= res!527594 (= (select (arr!20396 a!3186) (index!34342 lt!347255)) (select (arr!20396 a!3186) j!159)))))

(declare-fun e!433632 () Bool)

(assert (=> b!779548 (=> res!527594 e!433632)))

(declare-fun e!433633 () Bool)

(assert (=> b!779548 (= e!433633 e!433632)))

(declare-fun b!779549 () Bool)

(declare-fun e!433631 () SeekEntryResult!7993)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779549 (= e!433631 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20396 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20396 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779550 () Bool)

(assert (=> b!779550 (and (bvsge (index!34342 lt!347255) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347255) (size!20817 a!3186)))))

(declare-fun res!527595 () Bool)

(assert (=> b!779550 (= res!527595 (= (select (arr!20396 a!3186) (index!34342 lt!347255)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779550 (=> res!527595 e!433632)))

(declare-fun d!102205 () Bool)

(declare-fun e!433629 () Bool)

(assert (=> d!102205 e!433629))

(declare-fun c!86381 () Bool)

(assert (=> d!102205 (= c!86381 (and ((_ is Intermediate!7993) lt!347255) (undefined!8805 lt!347255)))))

(assert (=> d!102205 (= lt!347255 e!433630)))

(declare-fun c!86382 () Bool)

(assert (=> d!102205 (= c!86382 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!347254 () (_ BitVec 64))

(assert (=> d!102205 (= lt!347254 (select (arr!20396 a!3186) (toIndex!0 (select (arr!20396 a!3186) j!159) mask!3328)))))

(assert (=> d!102205 (validMask!0 mask!3328)))

(assert (=> d!102205 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20396 a!3186) j!159) mask!3328) (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347255)))

(declare-fun b!779551 () Bool)

(assert (=> b!779551 (= e!433629 e!433633)))

(declare-fun res!527593 () Bool)

(assert (=> b!779551 (= res!527593 (and ((_ is Intermediate!7993) lt!347255) (not (undefined!8805 lt!347255)) (bvslt (x!65293 lt!347255) #b01111111111111111111111111111110) (bvsge (x!65293 lt!347255) #b00000000000000000000000000000000) (bvsge (x!65293 lt!347255) #b00000000000000000000000000000000)))))

(assert (=> b!779551 (=> (not res!527593) (not e!433633))))

(declare-fun b!779552 () Bool)

(assert (=> b!779552 (= e!433630 e!433631)))

(declare-fun c!86380 () Bool)

(assert (=> b!779552 (= c!86380 (or (= lt!347254 (select (arr!20396 a!3186) j!159)) (= (bvadd lt!347254 lt!347254) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779553 () Bool)

(assert (=> b!779553 (= e!433629 (bvsge (x!65293 lt!347255) #b01111111111111111111111111111110))))

(declare-fun b!779554 () Bool)

(assert (=> b!779554 (= e!433631 (Intermediate!7993 false (toIndex!0 (select (arr!20396 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!779555 () Bool)

(assert (=> b!779555 (and (bvsge (index!34342 lt!347255) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347255) (size!20817 a!3186)))))

(assert (=> b!779555 (= e!433632 (= (select (arr!20396 a!3186) (index!34342 lt!347255)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102205 c!86382) b!779547))

(assert (= (and d!102205 (not c!86382)) b!779552))

(assert (= (and b!779552 c!86380) b!779554))

(assert (= (and b!779552 (not c!86380)) b!779549))

(assert (= (and d!102205 c!86381) b!779553))

(assert (= (and d!102205 (not c!86381)) b!779551))

(assert (= (and b!779551 res!527593) b!779548))

(assert (= (and b!779548 (not res!527594)) b!779550))

(assert (= (and b!779550 (not res!527595)) b!779555))

(declare-fun m!722529 () Bool)

(assert (=> b!779548 m!722529))

(assert (=> b!779550 m!722529))

(assert (=> d!102205 m!722411))

(declare-fun m!722531 () Bool)

(assert (=> d!102205 m!722531))

(assert (=> d!102205 m!722395))

(assert (=> b!779549 m!722411))

(declare-fun m!722533 () Bool)

(assert (=> b!779549 m!722533))

(assert (=> b!779549 m!722533))

(assert (=> b!779549 m!722385))

(declare-fun m!722535 () Bool)

(assert (=> b!779549 m!722535))

(assert (=> b!779555 m!722529))

(assert (=> b!779412 d!102205))

(declare-fun d!102207 () Bool)

(declare-fun lt!347261 () (_ BitVec 32))

(declare-fun lt!347260 () (_ BitVec 32))

(assert (=> d!102207 (= lt!347261 (bvmul (bvxor lt!347260 (bvlshr lt!347260 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102207 (= lt!347260 ((_ extract 31 0) (bvand (bvxor (select (arr!20396 a!3186) j!159) (bvlshr (select (arr!20396 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102207 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!527596 (let ((h!15550 ((_ extract 31 0) (bvand (bvxor (select (arr!20396 a!3186) j!159) (bvlshr (select (arr!20396 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65297 (bvmul (bvxor h!15550 (bvlshr h!15550 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65297 (bvlshr x!65297 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!527596 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!527596 #b00000000000000000000000000000000))))))

(assert (=> d!102207 (= (toIndex!0 (select (arr!20396 a!3186) j!159) mask!3328) (bvand (bvxor lt!347261 (bvlshr lt!347261 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!779412 d!102207))

(declare-fun b!779568 () Bool)

(declare-fun e!433641 () SeekEntryResult!7993)

(assert (=> b!779568 (= e!433641 (MissingVacant!7993 resIntermediateIndex!5))))

(declare-fun b!779569 () Bool)

(declare-fun e!433640 () SeekEntryResult!7993)

(declare-fun e!433642 () SeekEntryResult!7993)

(assert (=> b!779569 (= e!433640 e!433642)))

(declare-fun lt!347267 () (_ BitVec 64))

(declare-fun c!86391 () Bool)

(assert (=> b!779569 (= c!86391 (= lt!347267 (select (arr!20396 a!3186) j!159)))))

(declare-fun b!779570 () Bool)

(declare-fun c!86389 () Bool)

(assert (=> b!779570 (= c!86389 (= lt!347267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779570 (= e!433642 e!433641)))

(declare-fun b!779571 () Bool)

(assert (=> b!779571 (= e!433642 (Found!7993 index!1321))))

(declare-fun b!779572 () Bool)

(assert (=> b!779572 (= e!433640 Undefined!7993)))

(declare-fun b!779573 () Bool)

(assert (=> b!779573 (= e!433641 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20396 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102209 () Bool)

(declare-fun lt!347266 () SeekEntryResult!7993)

(assert (=> d!102209 (and (or ((_ is Undefined!7993) lt!347266) (not ((_ is Found!7993) lt!347266)) (and (bvsge (index!34341 lt!347266) #b00000000000000000000000000000000) (bvslt (index!34341 lt!347266) (size!20817 a!3186)))) (or ((_ is Undefined!7993) lt!347266) ((_ is Found!7993) lt!347266) (not ((_ is MissingVacant!7993) lt!347266)) (not (= (index!34343 lt!347266) resIntermediateIndex!5)) (and (bvsge (index!34343 lt!347266) #b00000000000000000000000000000000) (bvslt (index!34343 lt!347266) (size!20817 a!3186)))) (or ((_ is Undefined!7993) lt!347266) (ite ((_ is Found!7993) lt!347266) (= (select (arr!20396 a!3186) (index!34341 lt!347266)) (select (arr!20396 a!3186) j!159)) (and ((_ is MissingVacant!7993) lt!347266) (= (index!34343 lt!347266) resIntermediateIndex!5) (= (select (arr!20396 a!3186) (index!34343 lt!347266)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102209 (= lt!347266 e!433640)))

(declare-fun c!86390 () Bool)

(assert (=> d!102209 (= c!86390 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102209 (= lt!347267 (select (arr!20396 a!3186) index!1321))))

(assert (=> d!102209 (validMask!0 mask!3328)))

(assert (=> d!102209 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347266)))

(assert (= (and d!102209 c!86390) b!779572))

(assert (= (and d!102209 (not c!86390)) b!779569))

(assert (= (and b!779569 c!86391) b!779571))

(assert (= (and b!779569 (not c!86391)) b!779570))

(assert (= (and b!779570 c!86389) b!779568))

(assert (= (and b!779570 (not c!86389)) b!779573))

(declare-fun m!722537 () Bool)

(assert (=> b!779573 m!722537))

(assert (=> b!779573 m!722537))

(assert (=> b!779573 m!722385))

(declare-fun m!722539 () Bool)

(assert (=> b!779573 m!722539))

(declare-fun m!722541 () Bool)

(assert (=> d!102209 m!722541))

(declare-fun m!722543 () Bool)

(assert (=> d!102209 m!722543))

(declare-fun m!722545 () Bool)

(assert (=> d!102209 m!722545))

(assert (=> d!102209 m!722395))

(assert (=> b!779403 d!102209))

(declare-fun d!102215 () Bool)

(declare-fun res!527601 () Bool)

(declare-fun e!433647 () Bool)

(assert (=> d!102215 (=> res!527601 e!433647)))

(assert (=> d!102215 (= res!527601 (= (select (arr!20396 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102215 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!433647)))

(declare-fun b!779578 () Bool)

(declare-fun e!433648 () Bool)

(assert (=> b!779578 (= e!433647 e!433648)))

(declare-fun res!527602 () Bool)

(assert (=> b!779578 (=> (not res!527602) (not e!433648))))

(assert (=> b!779578 (= res!527602 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20817 a!3186)))))

(declare-fun b!779579 () Bool)

(assert (=> b!779579 (= e!433648 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102215 (not res!527601)) b!779578))

(assert (= (and b!779578 res!527602) b!779579))

(declare-fun m!722547 () Bool)

(assert (=> d!102215 m!722547))

(declare-fun m!722549 () Bool)

(assert (=> b!779579 m!722549))

(assert (=> b!779415 d!102215))

(declare-fun b!779580 () Bool)

(declare-fun e!433650 () SeekEntryResult!7993)

(assert (=> b!779580 (= e!433650 (Intermediate!7993 true index!1321 x!1131))))

(declare-fun b!779581 () Bool)

(declare-fun lt!347269 () SeekEntryResult!7993)

(assert (=> b!779581 (and (bvsge (index!34342 lt!347269) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347269) (size!20817 a!3186)))))

(declare-fun res!527604 () Bool)

(assert (=> b!779581 (= res!527604 (= (select (arr!20396 a!3186) (index!34342 lt!347269)) (select (arr!20396 a!3186) j!159)))))

(declare-fun e!433652 () Bool)

(assert (=> b!779581 (=> res!527604 e!433652)))

(declare-fun e!433653 () Bool)

(assert (=> b!779581 (= e!433653 e!433652)))

(declare-fun b!779582 () Bool)

(declare-fun e!433651 () SeekEntryResult!7993)

(assert (=> b!779582 (= e!433651 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20396 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779583 () Bool)

(assert (=> b!779583 (and (bvsge (index!34342 lt!347269) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347269) (size!20817 a!3186)))))

(declare-fun res!527605 () Bool)

(assert (=> b!779583 (= res!527605 (= (select (arr!20396 a!3186) (index!34342 lt!347269)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779583 (=> res!527605 e!433652)))

(declare-fun d!102217 () Bool)

(declare-fun e!433649 () Bool)

(assert (=> d!102217 e!433649))

(declare-fun c!86393 () Bool)

(assert (=> d!102217 (= c!86393 (and ((_ is Intermediate!7993) lt!347269) (undefined!8805 lt!347269)))))

(assert (=> d!102217 (= lt!347269 e!433650)))

(declare-fun c!86394 () Bool)

(assert (=> d!102217 (= c!86394 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!347268 () (_ BitVec 64))

(assert (=> d!102217 (= lt!347268 (select (arr!20396 a!3186) index!1321))))

(assert (=> d!102217 (validMask!0 mask!3328)))

(assert (=> d!102217 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347269)))

(declare-fun b!779584 () Bool)

(assert (=> b!779584 (= e!433649 e!433653)))

(declare-fun res!527603 () Bool)

(assert (=> b!779584 (= res!527603 (and ((_ is Intermediate!7993) lt!347269) (not (undefined!8805 lt!347269)) (bvslt (x!65293 lt!347269) #b01111111111111111111111111111110) (bvsge (x!65293 lt!347269) #b00000000000000000000000000000000) (bvsge (x!65293 lt!347269) x!1131)))))

(assert (=> b!779584 (=> (not res!527603) (not e!433653))))

(declare-fun b!779585 () Bool)

(assert (=> b!779585 (= e!433650 e!433651)))

(declare-fun c!86392 () Bool)

(assert (=> b!779585 (= c!86392 (or (= lt!347268 (select (arr!20396 a!3186) j!159)) (= (bvadd lt!347268 lt!347268) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779586 () Bool)

(assert (=> b!779586 (= e!433649 (bvsge (x!65293 lt!347269) #b01111111111111111111111111111110))))

(declare-fun b!779587 () Bool)

(assert (=> b!779587 (= e!433651 (Intermediate!7993 false index!1321 x!1131))))

(declare-fun b!779588 () Bool)

(assert (=> b!779588 (and (bvsge (index!34342 lt!347269) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347269) (size!20817 a!3186)))))

(assert (=> b!779588 (= e!433652 (= (select (arr!20396 a!3186) (index!34342 lt!347269)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102217 c!86394) b!779580))

(assert (= (and d!102217 (not c!86394)) b!779585))

(assert (= (and b!779585 c!86392) b!779587))

(assert (= (and b!779585 (not c!86392)) b!779582))

(assert (= (and d!102217 c!86393) b!779586))

(assert (= (and d!102217 (not c!86393)) b!779584))

(assert (= (and b!779584 res!527603) b!779581))

(assert (= (and b!779581 (not res!527604)) b!779583))

(assert (= (and b!779583 (not res!527605)) b!779588))

(declare-fun m!722551 () Bool)

(assert (=> b!779581 m!722551))

(assert (=> b!779583 m!722551))

(assert (=> d!102217 m!722545))

(assert (=> d!102217 m!722395))

(assert (=> b!779582 m!722537))

(assert (=> b!779582 m!722537))

(assert (=> b!779582 m!722385))

(declare-fun m!722553 () Bool)

(assert (=> b!779582 m!722553))

(assert (=> b!779588 m!722551))

(assert (=> b!779405 d!102217))

(declare-fun d!102219 () Bool)

(assert (=> d!102219 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!779406 d!102219))

(declare-fun b!779589 () Bool)

(declare-fun e!433655 () SeekEntryResult!7993)

(assert (=> b!779589 (= e!433655 (Intermediate!7993 true index!1321 x!1131))))

(declare-fun b!779590 () Bool)

(declare-fun lt!347271 () SeekEntryResult!7993)

(assert (=> b!779590 (and (bvsge (index!34342 lt!347271) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347271) (size!20817 lt!347180)))))

(declare-fun res!527607 () Bool)

(assert (=> b!779590 (= res!527607 (= (select (arr!20396 lt!347180) (index!34342 lt!347271)) lt!347182))))

(declare-fun e!433657 () Bool)

(assert (=> b!779590 (=> res!527607 e!433657)))

(declare-fun e!433658 () Bool)

(assert (=> b!779590 (= e!433658 e!433657)))

(declare-fun b!779591 () Bool)

(declare-fun e!433656 () SeekEntryResult!7993)

(assert (=> b!779591 (= e!433656 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!347182 lt!347180 mask!3328))))

(declare-fun b!779592 () Bool)

(assert (=> b!779592 (and (bvsge (index!34342 lt!347271) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347271) (size!20817 lt!347180)))))

(declare-fun res!527608 () Bool)

(assert (=> b!779592 (= res!527608 (= (select (arr!20396 lt!347180) (index!34342 lt!347271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779592 (=> res!527608 e!433657)))

(declare-fun d!102221 () Bool)

(declare-fun e!433654 () Bool)

(assert (=> d!102221 e!433654))

(declare-fun c!86396 () Bool)

(assert (=> d!102221 (= c!86396 (and ((_ is Intermediate!7993) lt!347271) (undefined!8805 lt!347271)))))

(assert (=> d!102221 (= lt!347271 e!433655)))

(declare-fun c!86397 () Bool)

(assert (=> d!102221 (= c!86397 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!347270 () (_ BitVec 64))

(assert (=> d!102221 (= lt!347270 (select (arr!20396 lt!347180) index!1321))))

(assert (=> d!102221 (validMask!0 mask!3328)))

(assert (=> d!102221 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347182 lt!347180 mask!3328) lt!347271)))

(declare-fun b!779593 () Bool)

(assert (=> b!779593 (= e!433654 e!433658)))

(declare-fun res!527606 () Bool)

(assert (=> b!779593 (= res!527606 (and ((_ is Intermediate!7993) lt!347271) (not (undefined!8805 lt!347271)) (bvslt (x!65293 lt!347271) #b01111111111111111111111111111110) (bvsge (x!65293 lt!347271) #b00000000000000000000000000000000) (bvsge (x!65293 lt!347271) x!1131)))))

(assert (=> b!779593 (=> (not res!527606) (not e!433658))))

(declare-fun b!779594 () Bool)

(assert (=> b!779594 (= e!433655 e!433656)))

(declare-fun c!86395 () Bool)

(assert (=> b!779594 (= c!86395 (or (= lt!347270 lt!347182) (= (bvadd lt!347270 lt!347270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779595 () Bool)

(assert (=> b!779595 (= e!433654 (bvsge (x!65293 lt!347271) #b01111111111111111111111111111110))))

(declare-fun b!779596 () Bool)

(assert (=> b!779596 (= e!433656 (Intermediate!7993 false index!1321 x!1131))))

(declare-fun b!779597 () Bool)

(assert (=> b!779597 (and (bvsge (index!34342 lt!347271) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347271) (size!20817 lt!347180)))))

(assert (=> b!779597 (= e!433657 (= (select (arr!20396 lt!347180) (index!34342 lt!347271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102221 c!86397) b!779589))

(assert (= (and d!102221 (not c!86397)) b!779594))

(assert (= (and b!779594 c!86395) b!779596))

(assert (= (and b!779594 (not c!86395)) b!779591))

(assert (= (and d!102221 c!86396) b!779595))

(assert (= (and d!102221 (not c!86396)) b!779593))

(assert (= (and b!779593 res!527606) b!779590))

(assert (= (and b!779590 (not res!527607)) b!779592))

(assert (= (and b!779592 (not res!527608)) b!779597))

(declare-fun m!722555 () Bool)

(assert (=> b!779590 m!722555))

(assert (=> b!779592 m!722555))

(declare-fun m!722557 () Bool)

(assert (=> d!102221 m!722557))

(assert (=> d!102221 m!722395))

(assert (=> b!779591 m!722537))

(assert (=> b!779591 m!722537))

(declare-fun m!722559 () Bool)

(assert (=> b!779591 m!722559))

(assert (=> b!779597 m!722555))

(assert (=> b!779417 d!102221))

(declare-fun b!779598 () Bool)

(declare-fun e!433660 () SeekEntryResult!7993)

(assert (=> b!779598 (= e!433660 (Intermediate!7993 true (toIndex!0 lt!347182 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!779599 () Bool)

(declare-fun lt!347273 () SeekEntryResult!7993)

(assert (=> b!779599 (and (bvsge (index!34342 lt!347273) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347273) (size!20817 lt!347180)))))

(declare-fun res!527610 () Bool)

(assert (=> b!779599 (= res!527610 (= (select (arr!20396 lt!347180) (index!34342 lt!347273)) lt!347182))))

(declare-fun e!433662 () Bool)

(assert (=> b!779599 (=> res!527610 e!433662)))

(declare-fun e!433663 () Bool)

(assert (=> b!779599 (= e!433663 e!433662)))

(declare-fun b!779600 () Bool)

(declare-fun e!433661 () SeekEntryResult!7993)

(assert (=> b!779600 (= e!433661 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!347182 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!347182 lt!347180 mask!3328))))

(declare-fun b!779601 () Bool)

(assert (=> b!779601 (and (bvsge (index!34342 lt!347273) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347273) (size!20817 lt!347180)))))

(declare-fun res!527611 () Bool)

(assert (=> b!779601 (= res!527611 (= (select (arr!20396 lt!347180) (index!34342 lt!347273)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779601 (=> res!527611 e!433662)))

(declare-fun d!102223 () Bool)

(declare-fun e!433659 () Bool)

(assert (=> d!102223 e!433659))

(declare-fun c!86399 () Bool)

(assert (=> d!102223 (= c!86399 (and ((_ is Intermediate!7993) lt!347273) (undefined!8805 lt!347273)))))

(assert (=> d!102223 (= lt!347273 e!433660)))

(declare-fun c!86400 () Bool)

(assert (=> d!102223 (= c!86400 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!347272 () (_ BitVec 64))

(assert (=> d!102223 (= lt!347272 (select (arr!20396 lt!347180) (toIndex!0 lt!347182 mask!3328)))))

(assert (=> d!102223 (validMask!0 mask!3328)))

(assert (=> d!102223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347182 mask!3328) lt!347182 lt!347180 mask!3328) lt!347273)))

(declare-fun b!779602 () Bool)

(assert (=> b!779602 (= e!433659 e!433663)))

(declare-fun res!527609 () Bool)

(assert (=> b!779602 (= res!527609 (and ((_ is Intermediate!7993) lt!347273) (not (undefined!8805 lt!347273)) (bvslt (x!65293 lt!347273) #b01111111111111111111111111111110) (bvsge (x!65293 lt!347273) #b00000000000000000000000000000000) (bvsge (x!65293 lt!347273) #b00000000000000000000000000000000)))))

(assert (=> b!779602 (=> (not res!527609) (not e!433663))))

(declare-fun b!779603 () Bool)

(assert (=> b!779603 (= e!433660 e!433661)))

(declare-fun c!86398 () Bool)

(assert (=> b!779603 (= c!86398 (or (= lt!347272 lt!347182) (= (bvadd lt!347272 lt!347272) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779604 () Bool)

(assert (=> b!779604 (= e!433659 (bvsge (x!65293 lt!347273) #b01111111111111111111111111111110))))

(declare-fun b!779605 () Bool)

(assert (=> b!779605 (= e!433661 (Intermediate!7993 false (toIndex!0 lt!347182 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!779606 () Bool)

(assert (=> b!779606 (and (bvsge (index!34342 lt!347273) #b00000000000000000000000000000000) (bvslt (index!34342 lt!347273) (size!20817 lt!347180)))))

(assert (=> b!779606 (= e!433662 (= (select (arr!20396 lt!347180) (index!34342 lt!347273)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102223 c!86400) b!779598))

(assert (= (and d!102223 (not c!86400)) b!779603))

(assert (= (and b!779603 c!86398) b!779605))

(assert (= (and b!779603 (not c!86398)) b!779600))

(assert (= (and d!102223 c!86399) b!779604))

(assert (= (and d!102223 (not c!86399)) b!779602))

(assert (= (and b!779602 res!527609) b!779599))

(assert (= (and b!779599 (not res!527610)) b!779601))

(assert (= (and b!779601 (not res!527611)) b!779606))

(declare-fun m!722561 () Bool)

(assert (=> b!779599 m!722561))

(assert (=> b!779601 m!722561))

(assert (=> d!102223 m!722417))

(declare-fun m!722563 () Bool)

(assert (=> d!102223 m!722563))

(assert (=> d!102223 m!722395))

(assert (=> b!779600 m!722417))

(declare-fun m!722565 () Bool)

(assert (=> b!779600 m!722565))

(assert (=> b!779600 m!722565))

(declare-fun m!722567 () Bool)

(assert (=> b!779600 m!722567))

(assert (=> b!779606 m!722561))

(assert (=> b!779417 d!102223))

(declare-fun d!102225 () Bool)

(declare-fun lt!347275 () (_ BitVec 32))

(declare-fun lt!347274 () (_ BitVec 32))

(assert (=> d!102225 (= lt!347275 (bvmul (bvxor lt!347274 (bvlshr lt!347274 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102225 (= lt!347274 ((_ extract 31 0) (bvand (bvxor lt!347182 (bvlshr lt!347182 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102225 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!527596 (let ((h!15550 ((_ extract 31 0) (bvand (bvxor lt!347182 (bvlshr lt!347182 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65297 (bvmul (bvxor h!15550 (bvlshr h!15550 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65297 (bvlshr x!65297 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!527596 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!527596 #b00000000000000000000000000000000))))))

(assert (=> d!102225 (= (toIndex!0 lt!347182 mask!3328) (bvand (bvxor lt!347275 (bvlshr lt!347275 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!779417 d!102225))

(declare-fun d!102227 () Bool)

(assert (=> d!102227 (= (validKeyInArray!0 (select (arr!20396 a!3186) j!159)) (and (not (= (select (arr!20396 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20396 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!779407 d!102227))

(assert (=> b!779418 d!102209))

(declare-fun d!102229 () Bool)

(assert (=> d!102229 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67358 d!102229))

(declare-fun d!102233 () Bool)

(assert (=> d!102233 (= (array_inv!16279 a!3186) (bvsge (size!20817 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67358 d!102233))

(declare-fun b!779679 () Bool)

(declare-fun lt!347326 () SeekEntryResult!7993)

(declare-fun e!433707 () SeekEntryResult!7993)

(assert (=> b!779679 (= e!433707 (seekKeyOrZeroReturnVacant!0 (x!65293 lt!347326) (index!34342 lt!347326) (index!34342 lt!347326) k0!2102 a!3186 mask!3328))))

(declare-fun b!779680 () Bool)

(assert (=> b!779680 (= e!433707 (MissingZero!7993 (index!34342 lt!347326)))))

(declare-fun d!102235 () Bool)

(declare-fun lt!347325 () SeekEntryResult!7993)

(assert (=> d!102235 (and (or ((_ is Undefined!7993) lt!347325) (not ((_ is Found!7993) lt!347325)) (and (bvsge (index!34341 lt!347325) #b00000000000000000000000000000000) (bvslt (index!34341 lt!347325) (size!20817 a!3186)))) (or ((_ is Undefined!7993) lt!347325) ((_ is Found!7993) lt!347325) (not ((_ is MissingZero!7993) lt!347325)) (and (bvsge (index!34340 lt!347325) #b00000000000000000000000000000000) (bvslt (index!34340 lt!347325) (size!20817 a!3186)))) (or ((_ is Undefined!7993) lt!347325) ((_ is Found!7993) lt!347325) ((_ is MissingZero!7993) lt!347325) (not ((_ is MissingVacant!7993) lt!347325)) (and (bvsge (index!34343 lt!347325) #b00000000000000000000000000000000) (bvslt (index!34343 lt!347325) (size!20817 a!3186)))) (or ((_ is Undefined!7993) lt!347325) (ite ((_ is Found!7993) lt!347325) (= (select (arr!20396 a!3186) (index!34341 lt!347325)) k0!2102) (ite ((_ is MissingZero!7993) lt!347325) (= (select (arr!20396 a!3186) (index!34340 lt!347325)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7993) lt!347325) (= (select (arr!20396 a!3186) (index!34343 lt!347325)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!433706 () SeekEntryResult!7993)

(assert (=> d!102235 (= lt!347325 e!433706)))

(declare-fun c!86433 () Bool)

(assert (=> d!102235 (= c!86433 (and ((_ is Intermediate!7993) lt!347326) (undefined!8805 lt!347326)))))

(assert (=> d!102235 (= lt!347326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102235 (validMask!0 mask!3328)))

(assert (=> d!102235 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!347325)))

(declare-fun b!779681 () Bool)

(declare-fun e!433708 () SeekEntryResult!7993)

(assert (=> b!779681 (= e!433708 (Found!7993 (index!34342 lt!347326)))))

(declare-fun b!779682 () Bool)

(declare-fun c!86431 () Bool)

(declare-fun lt!347324 () (_ BitVec 64))

(assert (=> b!779682 (= c!86431 (= lt!347324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779682 (= e!433708 e!433707)))

(declare-fun b!779683 () Bool)

(assert (=> b!779683 (= e!433706 e!433708)))

(assert (=> b!779683 (= lt!347324 (select (arr!20396 a!3186) (index!34342 lt!347326)))))

(declare-fun c!86432 () Bool)

(assert (=> b!779683 (= c!86432 (= lt!347324 k0!2102))))

(declare-fun b!779684 () Bool)

(assert (=> b!779684 (= e!433706 Undefined!7993)))

(assert (= (and d!102235 c!86433) b!779684))

(assert (= (and d!102235 (not c!86433)) b!779683))

(assert (= (and b!779683 c!86432) b!779681))

(assert (= (and b!779683 (not c!86432)) b!779682))

(assert (= (and b!779682 c!86431) b!779680))

(assert (= (and b!779682 (not c!86431)) b!779679))

(declare-fun m!722605 () Bool)

(assert (=> b!779679 m!722605))

(declare-fun m!722607 () Bool)

(assert (=> d!102235 m!722607))

(declare-fun m!722609 () Bool)

(assert (=> d!102235 m!722609))

(assert (=> d!102235 m!722395))

(declare-fun m!722611 () Bool)

(assert (=> d!102235 m!722611))

(declare-fun m!722613 () Bool)

(assert (=> d!102235 m!722613))

(assert (=> d!102235 m!722613))

(declare-fun m!722615 () Bool)

(assert (=> d!102235 m!722615))

(declare-fun m!722617 () Bool)

(assert (=> b!779683 m!722617))

(assert (=> b!779408 d!102235))

(declare-fun e!433710 () SeekEntryResult!7993)

(declare-fun b!779685 () Bool)

(declare-fun lt!347329 () SeekEntryResult!7993)

(assert (=> b!779685 (= e!433710 (seekKeyOrZeroReturnVacant!0 (x!65293 lt!347329) (index!34342 lt!347329) (index!34342 lt!347329) (select (arr!20396 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779686 () Bool)

(assert (=> b!779686 (= e!433710 (MissingZero!7993 (index!34342 lt!347329)))))

(declare-fun d!102247 () Bool)

(declare-fun lt!347328 () SeekEntryResult!7993)

(assert (=> d!102247 (and (or ((_ is Undefined!7993) lt!347328) (not ((_ is Found!7993) lt!347328)) (and (bvsge (index!34341 lt!347328) #b00000000000000000000000000000000) (bvslt (index!34341 lt!347328) (size!20817 a!3186)))) (or ((_ is Undefined!7993) lt!347328) ((_ is Found!7993) lt!347328) (not ((_ is MissingZero!7993) lt!347328)) (and (bvsge (index!34340 lt!347328) #b00000000000000000000000000000000) (bvslt (index!34340 lt!347328) (size!20817 a!3186)))) (or ((_ is Undefined!7993) lt!347328) ((_ is Found!7993) lt!347328) ((_ is MissingZero!7993) lt!347328) (not ((_ is MissingVacant!7993) lt!347328)) (and (bvsge (index!34343 lt!347328) #b00000000000000000000000000000000) (bvslt (index!34343 lt!347328) (size!20817 a!3186)))) (or ((_ is Undefined!7993) lt!347328) (ite ((_ is Found!7993) lt!347328) (= (select (arr!20396 a!3186) (index!34341 lt!347328)) (select (arr!20396 a!3186) j!159)) (ite ((_ is MissingZero!7993) lt!347328) (= (select (arr!20396 a!3186) (index!34340 lt!347328)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7993) lt!347328) (= (select (arr!20396 a!3186) (index!34343 lt!347328)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!433709 () SeekEntryResult!7993)

(assert (=> d!102247 (= lt!347328 e!433709)))

(declare-fun c!86436 () Bool)

(assert (=> d!102247 (= c!86436 (and ((_ is Intermediate!7993) lt!347329) (undefined!8805 lt!347329)))))

(assert (=> d!102247 (= lt!347329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20396 a!3186) j!159) mask!3328) (select (arr!20396 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102247 (validMask!0 mask!3328)))

(assert (=> d!102247 (= (seekEntryOrOpen!0 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347328)))

(declare-fun b!779687 () Bool)

(declare-fun e!433711 () SeekEntryResult!7993)

(assert (=> b!779687 (= e!433711 (Found!7993 (index!34342 lt!347329)))))

(declare-fun b!779688 () Bool)

(declare-fun c!86434 () Bool)

(declare-fun lt!347327 () (_ BitVec 64))

(assert (=> b!779688 (= c!86434 (= lt!347327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779688 (= e!433711 e!433710)))

(declare-fun b!779689 () Bool)

(assert (=> b!779689 (= e!433709 e!433711)))

(assert (=> b!779689 (= lt!347327 (select (arr!20396 a!3186) (index!34342 lt!347329)))))

(declare-fun c!86435 () Bool)

(assert (=> b!779689 (= c!86435 (= lt!347327 (select (arr!20396 a!3186) j!159)))))

(declare-fun b!779690 () Bool)

(assert (=> b!779690 (= e!433709 Undefined!7993)))

(assert (= (and d!102247 c!86436) b!779690))

(assert (= (and d!102247 (not c!86436)) b!779689))

(assert (= (and b!779689 c!86435) b!779687))

(assert (= (and b!779689 (not c!86435)) b!779688))

(assert (= (and b!779688 c!86434) b!779686))

(assert (= (and b!779688 (not c!86434)) b!779685))

(assert (=> b!779685 m!722385))

(declare-fun m!722619 () Bool)

(assert (=> b!779685 m!722619))

(declare-fun m!722621 () Bool)

(assert (=> d!102247 m!722621))

(declare-fun m!722623 () Bool)

(assert (=> d!102247 m!722623))

(assert (=> d!102247 m!722395))

(declare-fun m!722625 () Bool)

(assert (=> d!102247 m!722625))

(assert (=> d!102247 m!722385))

(assert (=> d!102247 m!722411))

(assert (=> d!102247 m!722411))

(assert (=> d!102247 m!722385))

(assert (=> d!102247 m!722413))

(declare-fun m!722627 () Bool)

(assert (=> b!779689 m!722627))

(assert (=> b!779419 d!102247))

(declare-fun b!779717 () Bool)

(declare-fun e!433728 () Bool)

(declare-fun call!35197 () Bool)

(assert (=> b!779717 (= e!433728 call!35197)))

(declare-fun b!779718 () Bool)

(declare-fun e!433729 () Bool)

(assert (=> b!779718 (= e!433728 e!433729)))

(declare-fun lt!347342 () (_ BitVec 64))

(assert (=> b!779718 (= lt!347342 (select (arr!20396 a!3186) j!159))))

(declare-fun lt!347341 () Unit!26852)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42606 (_ BitVec 64) (_ BitVec 32)) Unit!26852)

(assert (=> b!779718 (= lt!347341 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347342 j!159))))

(assert (=> b!779718 (arrayContainsKey!0 a!3186 lt!347342 #b00000000000000000000000000000000)))

(declare-fun lt!347340 () Unit!26852)

(assert (=> b!779718 (= lt!347340 lt!347341)))

(declare-fun res!527634 () Bool)

(assert (=> b!779718 (= res!527634 (= (seekEntryOrOpen!0 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) (Found!7993 j!159)))))

(assert (=> b!779718 (=> (not res!527634) (not e!433729))))

(declare-fun d!102249 () Bool)

(declare-fun res!527635 () Bool)

(declare-fun e!433730 () Bool)

(assert (=> d!102249 (=> res!527635 e!433730)))

(assert (=> d!102249 (= res!527635 (bvsge j!159 (size!20817 a!3186)))))

(assert (=> d!102249 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!433730)))

(declare-fun b!779719 () Bool)

(assert (=> b!779719 (= e!433729 call!35197)))

(declare-fun b!779720 () Bool)

(assert (=> b!779720 (= e!433730 e!433728)))

(declare-fun c!86445 () Bool)

(assert (=> b!779720 (= c!86445 (validKeyInArray!0 (select (arr!20396 a!3186) j!159)))))

(declare-fun bm!35194 () Bool)

(assert (=> bm!35194 (= call!35197 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102249 (not res!527635)) b!779720))

(assert (= (and b!779720 c!86445) b!779718))

(assert (= (and b!779720 (not c!86445)) b!779717))

(assert (= (and b!779718 res!527634) b!779719))

(assert (= (or b!779719 b!779717) bm!35194))

(assert (=> b!779718 m!722385))

(declare-fun m!722629 () Bool)

(assert (=> b!779718 m!722629))

(declare-fun m!722631 () Bool)

(assert (=> b!779718 m!722631))

(assert (=> b!779718 m!722385))

(assert (=> b!779718 m!722387))

(assert (=> b!779720 m!722385))

(assert (=> b!779720 m!722385))

(assert (=> b!779720 m!722401))

(declare-fun m!722633 () Bool)

(assert (=> bm!35194 m!722633))

(assert (=> b!779419 d!102249))

(declare-fun d!102251 () Bool)

(assert (=> d!102251 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347351 () Unit!26852)

(declare-fun choose!38 (array!42606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26852)

(assert (=> d!102251 (= lt!347351 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102251 (validMask!0 mask!3328)))

(assert (=> d!102251 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!347351)))

(declare-fun bs!21686 () Bool)

(assert (= bs!21686 d!102251))

(assert (=> bs!21686 m!722389))

(declare-fun m!722643 () Bool)

(assert (=> bs!21686 m!722643))

(assert (=> bs!21686 m!722395))

(assert (=> b!779419 d!102251))

(declare-fun b!779773 () Bool)

(declare-fun e!433762 () Bool)

(declare-fun e!433765 () Bool)

(assert (=> b!779773 (= e!433762 e!433765)))

(declare-fun c!86463 () Bool)

(assert (=> b!779773 (= c!86463 (validKeyInArray!0 (select (arr!20396 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!779774 () Bool)

(declare-fun call!35200 () Bool)

(assert (=> b!779774 (= e!433765 call!35200)))

(declare-fun b!779776 () Bool)

(assert (=> b!779776 (= e!433765 call!35200)))

(declare-fun b!779777 () Bool)

(declare-fun e!433764 () Bool)

(assert (=> b!779777 (= e!433764 e!433762)))

(declare-fun res!527656 () Bool)

(assert (=> b!779777 (=> (not res!527656) (not e!433762))))

(declare-fun e!433763 () Bool)

(assert (=> b!779777 (= res!527656 (not e!433763))))

(declare-fun res!527658 () Bool)

(assert (=> b!779777 (=> (not res!527658) (not e!433763))))

(assert (=> b!779777 (= res!527658 (validKeyInArray!0 (select (arr!20396 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35197 () Bool)

(assert (=> bm!35197 (= call!35200 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86463 (Cons!14433 (select (arr!20396 a!3186) #b00000000000000000000000000000000) Nil!14434) Nil!14434)))))

(declare-fun b!779775 () Bool)

(declare-fun contains!4083 (List!14437 (_ BitVec 64)) Bool)

(assert (=> b!779775 (= e!433763 (contains!4083 Nil!14434 (select (arr!20396 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102255 () Bool)

(declare-fun res!527657 () Bool)

(assert (=> d!102255 (=> res!527657 e!433764)))

(assert (=> d!102255 (= res!527657 (bvsge #b00000000000000000000000000000000 (size!20817 a!3186)))))

(assert (=> d!102255 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14434) e!433764)))

(assert (= (and d!102255 (not res!527657)) b!779777))

(assert (= (and b!779777 res!527658) b!779775))

(assert (= (and b!779777 res!527656) b!779773))

(assert (= (and b!779773 c!86463) b!779774))

(assert (= (and b!779773 (not c!86463)) b!779776))

(assert (= (or b!779774 b!779776) bm!35197))

(assert (=> b!779773 m!722547))

(assert (=> b!779773 m!722547))

(declare-fun m!722667 () Bool)

(assert (=> b!779773 m!722667))

(assert (=> b!779777 m!722547))

(assert (=> b!779777 m!722547))

(assert (=> b!779777 m!722667))

(assert (=> bm!35197 m!722547))

(declare-fun m!722669 () Bool)

(assert (=> bm!35197 m!722669))

(assert (=> b!779775 m!722547))

(assert (=> b!779775 m!722547))

(declare-fun m!722671 () Bool)

(assert (=> b!779775 m!722671))

(assert (=> b!779409 d!102255))

(declare-fun b!779778 () Bool)

(declare-fun e!433767 () SeekEntryResult!7993)

(assert (=> b!779778 (= e!433767 (MissingVacant!7993 resIntermediateIndex!5))))

(declare-fun b!779779 () Bool)

(declare-fun e!433766 () SeekEntryResult!7993)

(declare-fun e!433768 () SeekEntryResult!7993)

(assert (=> b!779779 (= e!433766 e!433768)))

(declare-fun lt!347368 () (_ BitVec 64))

(declare-fun c!86466 () Bool)

(assert (=> b!779779 (= c!86466 (= lt!347368 (select (arr!20396 a!3186) j!159)))))

(declare-fun b!779780 () Bool)

(declare-fun c!86464 () Bool)

(assert (=> b!779780 (= c!86464 (= lt!347368 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779780 (= e!433768 e!433767)))

(declare-fun b!779781 () Bool)

(assert (=> b!779781 (= e!433768 (Found!7993 resIntermediateIndex!5))))

(declare-fun b!779782 () Bool)

(assert (=> b!779782 (= e!433766 Undefined!7993)))

(declare-fun b!779783 () Bool)

(assert (=> b!779783 (= e!433767 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20396 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102263 () Bool)

(declare-fun lt!347367 () SeekEntryResult!7993)

(assert (=> d!102263 (and (or ((_ is Undefined!7993) lt!347367) (not ((_ is Found!7993) lt!347367)) (and (bvsge (index!34341 lt!347367) #b00000000000000000000000000000000) (bvslt (index!34341 lt!347367) (size!20817 a!3186)))) (or ((_ is Undefined!7993) lt!347367) ((_ is Found!7993) lt!347367) (not ((_ is MissingVacant!7993) lt!347367)) (not (= (index!34343 lt!347367) resIntermediateIndex!5)) (and (bvsge (index!34343 lt!347367) #b00000000000000000000000000000000) (bvslt (index!34343 lt!347367) (size!20817 a!3186)))) (or ((_ is Undefined!7993) lt!347367) (ite ((_ is Found!7993) lt!347367) (= (select (arr!20396 a!3186) (index!34341 lt!347367)) (select (arr!20396 a!3186) j!159)) (and ((_ is MissingVacant!7993) lt!347367) (= (index!34343 lt!347367) resIntermediateIndex!5) (= (select (arr!20396 a!3186) (index!34343 lt!347367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102263 (= lt!347367 e!433766)))

(declare-fun c!86465 () Bool)

(assert (=> d!102263 (= c!86465 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102263 (= lt!347368 (select (arr!20396 a!3186) resIntermediateIndex!5))))

(assert (=> d!102263 (validMask!0 mask!3328)))

(assert (=> d!102263 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347367)))

(assert (= (and d!102263 c!86465) b!779782))

(assert (= (and d!102263 (not c!86465)) b!779779))

(assert (= (and b!779779 c!86466) b!779781))

(assert (= (and b!779779 (not c!86466)) b!779780))

(assert (= (and b!779780 c!86464) b!779778))

(assert (= (and b!779780 (not c!86464)) b!779783))

(declare-fun m!722673 () Bool)

(assert (=> b!779783 m!722673))

(assert (=> b!779783 m!722673))

(assert (=> b!779783 m!722385))

(declare-fun m!722675 () Bool)

(assert (=> b!779783 m!722675))

(declare-fun m!722677 () Bool)

(assert (=> d!102263 m!722677))

(declare-fun m!722679 () Bool)

(assert (=> d!102263 m!722679))

(assert (=> d!102263 m!722429))

(assert (=> d!102263 m!722395))

(assert (=> b!779410 d!102263))

(declare-fun b!779784 () Bool)

(declare-fun e!433769 () Bool)

(declare-fun call!35201 () Bool)

(assert (=> b!779784 (= e!433769 call!35201)))

(declare-fun b!779785 () Bool)

(declare-fun e!433770 () Bool)

(assert (=> b!779785 (= e!433769 e!433770)))

(declare-fun lt!347373 () (_ BitVec 64))

(assert (=> b!779785 (= lt!347373 (select (arr!20396 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!347372 () Unit!26852)

(assert (=> b!779785 (= lt!347372 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347373 #b00000000000000000000000000000000))))

(assert (=> b!779785 (arrayContainsKey!0 a!3186 lt!347373 #b00000000000000000000000000000000)))

(declare-fun lt!347371 () Unit!26852)

(assert (=> b!779785 (= lt!347371 lt!347372)))

(declare-fun res!527659 () Bool)

(assert (=> b!779785 (= res!527659 (= (seekEntryOrOpen!0 (select (arr!20396 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7993 #b00000000000000000000000000000000)))))

(assert (=> b!779785 (=> (not res!527659) (not e!433770))))

(declare-fun d!102265 () Bool)

(declare-fun res!527660 () Bool)

(declare-fun e!433771 () Bool)

(assert (=> d!102265 (=> res!527660 e!433771)))

(assert (=> d!102265 (= res!527660 (bvsge #b00000000000000000000000000000000 (size!20817 a!3186)))))

(assert (=> d!102265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!433771)))

(declare-fun b!779786 () Bool)

(assert (=> b!779786 (= e!433770 call!35201)))

(declare-fun b!779787 () Bool)

(assert (=> b!779787 (= e!433771 e!433769)))

(declare-fun c!86467 () Bool)

(assert (=> b!779787 (= c!86467 (validKeyInArray!0 (select (arr!20396 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35198 () Bool)

(assert (=> bm!35198 (= call!35201 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102265 (not res!527660)) b!779787))

(assert (= (and b!779787 c!86467) b!779785))

(assert (= (and b!779787 (not c!86467)) b!779784))

(assert (= (and b!779785 res!527659) b!779786))

(assert (= (or b!779786 b!779784) bm!35198))

(assert (=> b!779785 m!722547))

(declare-fun m!722681 () Bool)

(assert (=> b!779785 m!722681))

(declare-fun m!722683 () Bool)

(assert (=> b!779785 m!722683))

(assert (=> b!779785 m!722547))

(declare-fun m!722685 () Bool)

(assert (=> b!779785 m!722685))

(assert (=> b!779787 m!722547))

(assert (=> b!779787 m!722547))

(assert (=> b!779787 m!722667))

(declare-fun m!722687 () Bool)

(assert (=> bm!35198 m!722687))

(assert (=> b!779411 d!102265))

(check-sat (not bm!35194) (not d!102209) (not b!779787) (not b!779783) (not d!102251) (not d!102235) (not b!779777) (not d!102221) (not b!779679) (not b!779720) (not b!779785) (not d!102217) (not d!102205) (not b!779600) (not bm!35198) (not b!779549) (not b!779718) (not b!779773) (not b!779685) (not bm!35197) (not b!779579) (not b!779591) (not d!102223) (not b!779573) (not b!779775) (not b!779582) (not d!102247) (not d!102263))
(check-sat)
