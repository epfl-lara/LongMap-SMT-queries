; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64484 () Bool)

(assert start!64484)

(declare-fun b!725417 () Bool)

(declare-fun e!406246 () Bool)

(declare-fun e!406243 () Bool)

(assert (=> b!725417 (= e!406246 e!406243)))

(declare-fun res!486522 () Bool)

(assert (=> b!725417 (=> (not res!486522) (not e!406243))))

(declare-datatypes ((array!41002 0))(
  ( (array!41003 (arr!19622 (Array (_ BitVec 32) (_ BitVec 64))) (size!20043 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41002)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7222 0))(
  ( (MissingZero!7222 (index!31256 (_ BitVec 32))) (Found!7222 (index!31257 (_ BitVec 32))) (Intermediate!7222 (undefined!8034 Bool) (index!31258 (_ BitVec 32)) (x!62248 (_ BitVec 32))) (Undefined!7222) (MissingVacant!7222 (index!31259 (_ BitVec 32))) )
))
(declare-fun lt!321339 () SeekEntryResult!7222)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41002 (_ BitVec 32)) SeekEntryResult!7222)

(assert (=> b!725417 (= res!486522 (= (seekEntryOrOpen!0 (select (arr!19622 a!3186) j!159) a!3186 mask!3328) lt!321339))))

(assert (=> b!725417 (= lt!321339 (Found!7222 j!159))))

(declare-fun b!725418 () Bool)

(declare-fun res!486523 () Bool)

(declare-fun e!406247 () Bool)

(assert (=> b!725418 (=> (not res!486523) (not e!406247))))

(declare-fun e!406244 () Bool)

(assert (=> b!725418 (= res!486523 e!406244)))

(declare-fun c!79822 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725418 (= c!79822 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!321340 () SeekEntryResult!7222)

(declare-fun b!725419 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41002 (_ BitVec 32)) SeekEntryResult!7222)

(assert (=> b!725419 (= e!406244 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19622 a!3186) j!159) a!3186 mask!3328) lt!321340))))

(declare-fun b!725420 () Bool)

(declare-fun res!486531 () Bool)

(declare-fun e!406242 () Bool)

(assert (=> b!725420 (=> (not res!486531) (not e!406242))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725420 (= res!486531 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725421 () Bool)

(declare-fun e!406245 () Bool)

(assert (=> b!725421 (= e!406245 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(assert (=> b!725421 e!406246))

(declare-fun res!486527 () Bool)

(assert (=> b!725421 (=> (not res!486527) (not e!406246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41002 (_ BitVec 32)) Bool)

(assert (=> b!725421 (= res!486527 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24762 0))(
  ( (Unit!24763) )
))
(declare-fun lt!321337 () Unit!24762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24762)

(assert (=> b!725421 (= lt!321337 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725422 () Bool)

(declare-fun res!486520 () Bool)

(assert (=> b!725422 (=> (not res!486520) (not e!406242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725422 (= res!486520 (validKeyInArray!0 (select (arr!19622 a!3186) j!159)))))

(declare-fun b!725423 () Bool)

(declare-fun res!486525 () Bool)

(declare-fun e!406241 () Bool)

(assert (=> b!725423 (=> (not res!486525) (not e!406241))))

(declare-datatypes ((List!13624 0))(
  ( (Nil!13621) (Cons!13620 (h!14677 (_ BitVec 64)) (t!19939 List!13624)) )
))
(declare-fun arrayNoDuplicates!0 (array!41002 (_ BitVec 32) List!13624) Bool)

(assert (=> b!725423 (= res!486525 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13621))))

(declare-fun b!725424 () Bool)

(assert (=> b!725424 (= e!406242 e!406241)))

(declare-fun res!486526 () Bool)

(assert (=> b!725424 (=> (not res!486526) (not e!406241))))

(declare-fun lt!321338 () SeekEntryResult!7222)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725424 (= res!486526 (or (= lt!321338 (MissingZero!7222 i!1173)) (= lt!321338 (MissingVacant!7222 i!1173))))))

(assert (=> b!725424 (= lt!321338 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!725426 () Bool)

(declare-fun res!486532 () Bool)

(assert (=> b!725426 (=> (not res!486532) (not e!406247))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!725426 (= res!486532 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19622 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725427 () Bool)

(declare-fun res!486533 () Bool)

(assert (=> b!725427 (=> (not res!486533) (not e!406241))))

(assert (=> b!725427 (= res!486533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725428 () Bool)

(assert (=> b!725428 (= e!406247 e!406245)))

(declare-fun res!486524 () Bool)

(assert (=> b!725428 (=> (not res!486524) (not e!406245))))

(declare-fun lt!321341 () (_ BitVec 64))

(declare-fun lt!321336 () array!41002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725428 (= res!486524 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321341 mask!3328) lt!321341 lt!321336 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321341 lt!321336 mask!3328)))))

(assert (=> b!725428 (= lt!321341 (select (store (arr!19622 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725428 (= lt!321336 (array!41003 (store (arr!19622 a!3186) i!1173 k!2102) (size!20043 a!3186)))))

(declare-fun b!725429 () Bool)

(declare-fun res!486528 () Bool)

(assert (=> b!725429 (=> (not res!486528) (not e!406242))))

(assert (=> b!725429 (= res!486528 (validKeyInArray!0 k!2102))))

(declare-fun b!725430 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41002 (_ BitVec 32)) SeekEntryResult!7222)

(assert (=> b!725430 (= e!406244 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19622 a!3186) j!159) a!3186 mask!3328) (Found!7222 j!159)))))

(declare-fun b!725431 () Bool)

(assert (=> b!725431 (= e!406241 e!406247)))

(declare-fun res!486521 () Bool)

(assert (=> b!725431 (=> (not res!486521) (not e!406247))))

(assert (=> b!725431 (= res!486521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19622 a!3186) j!159) mask!3328) (select (arr!19622 a!3186) j!159) a!3186 mask!3328) lt!321340))))

(assert (=> b!725431 (= lt!321340 (Intermediate!7222 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725425 () Bool)

(assert (=> b!725425 (= e!406243 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19622 a!3186) j!159) a!3186 mask!3328) lt!321339))))

(declare-fun res!486519 () Bool)

(assert (=> start!64484 (=> (not res!486519) (not e!406242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64484 (= res!486519 (validMask!0 mask!3328))))

(assert (=> start!64484 e!406242))

(assert (=> start!64484 true))

(declare-fun array_inv!15418 (array!41002) Bool)

(assert (=> start!64484 (array_inv!15418 a!3186)))

(declare-fun b!725432 () Bool)

(declare-fun res!486530 () Bool)

(assert (=> b!725432 (=> (not res!486530) (not e!406242))))

(assert (=> b!725432 (= res!486530 (and (= (size!20043 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20043 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20043 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725433 () Bool)

(declare-fun res!486529 () Bool)

(assert (=> b!725433 (=> (not res!486529) (not e!406241))))

(assert (=> b!725433 (= res!486529 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20043 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20043 a!3186))))))

(assert (= (and start!64484 res!486519) b!725432))

(assert (= (and b!725432 res!486530) b!725422))

(assert (= (and b!725422 res!486520) b!725429))

(assert (= (and b!725429 res!486528) b!725420))

(assert (= (and b!725420 res!486531) b!725424))

(assert (= (and b!725424 res!486526) b!725427))

(assert (= (and b!725427 res!486533) b!725423))

(assert (= (and b!725423 res!486525) b!725433))

(assert (= (and b!725433 res!486529) b!725431))

(assert (= (and b!725431 res!486521) b!725426))

(assert (= (and b!725426 res!486532) b!725418))

(assert (= (and b!725418 c!79822) b!725419))

(assert (= (and b!725418 (not c!79822)) b!725430))

(assert (= (and b!725418 res!486523) b!725428))

(assert (= (and b!725428 res!486524) b!725421))

(assert (= (and b!725421 res!486527) b!725417))

(assert (= (and b!725417 res!486522) b!725425))

(declare-fun m!679581 () Bool)

(assert (=> b!725421 m!679581))

(declare-fun m!679583 () Bool)

(assert (=> b!725421 m!679583))

(declare-fun m!679585 () Bool)

(assert (=> b!725426 m!679585))

(declare-fun m!679587 () Bool)

(assert (=> b!725424 m!679587))

(declare-fun m!679589 () Bool)

(assert (=> b!725429 m!679589))

(declare-fun m!679591 () Bool)

(assert (=> b!725420 m!679591))

(declare-fun m!679593 () Bool)

(assert (=> start!64484 m!679593))

(declare-fun m!679595 () Bool)

(assert (=> start!64484 m!679595))

(declare-fun m!679597 () Bool)

(assert (=> b!725431 m!679597))

(assert (=> b!725431 m!679597))

(declare-fun m!679599 () Bool)

(assert (=> b!725431 m!679599))

(assert (=> b!725431 m!679599))

(assert (=> b!725431 m!679597))

(declare-fun m!679601 () Bool)

(assert (=> b!725431 m!679601))

(assert (=> b!725430 m!679597))

(assert (=> b!725430 m!679597))

(declare-fun m!679603 () Bool)

(assert (=> b!725430 m!679603))

(assert (=> b!725419 m!679597))

(assert (=> b!725419 m!679597))

(declare-fun m!679605 () Bool)

(assert (=> b!725419 m!679605))

(declare-fun m!679607 () Bool)

(assert (=> b!725428 m!679607))

(declare-fun m!679609 () Bool)

(assert (=> b!725428 m!679609))

(declare-fun m!679611 () Bool)

(assert (=> b!725428 m!679611))

(assert (=> b!725428 m!679609))

(declare-fun m!679613 () Bool)

(assert (=> b!725428 m!679613))

(declare-fun m!679615 () Bool)

(assert (=> b!725428 m!679615))

(assert (=> b!725422 m!679597))

(assert (=> b!725422 m!679597))

(declare-fun m!679617 () Bool)

(assert (=> b!725422 m!679617))

(declare-fun m!679619 () Bool)

(assert (=> b!725423 m!679619))

(declare-fun m!679621 () Bool)

(assert (=> b!725427 m!679621))

(assert (=> b!725425 m!679597))

(assert (=> b!725425 m!679597))

(declare-fun m!679623 () Bool)

(assert (=> b!725425 m!679623))

(assert (=> b!725417 m!679597))

(assert (=> b!725417 m!679597))

(declare-fun m!679625 () Bool)

(assert (=> b!725417 m!679625))

(push 1)

(assert (not b!725420))

