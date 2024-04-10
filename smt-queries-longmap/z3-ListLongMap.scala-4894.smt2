; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67544 () Bool)

(assert start!67544)

(declare-fun b!781447 () Bool)

(declare-fun res!528642 () Bool)

(declare-fun e!434650 () Bool)

(assert (=> b!781447 (=> res!528642 e!434650)))

(declare-datatypes ((array!42647 0))(
  ( (array!42648 (arr!20413 (Array (_ BitVec 32) (_ BitVec 64))) (size!20834 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42647)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!348235 () (_ BitVec 64))

(assert (=> b!781447 (= res!528642 (= (select (store (arr!20413 a!3186) i!1173 k0!2102) index!1321) lt!348235))))

(declare-fun b!781448 () Bool)

(declare-datatypes ((Unit!26940 0))(
  ( (Unit!26941) )
))
(declare-fun e!434652 () Unit!26940)

(declare-fun Unit!26942 () Unit!26940)

(assert (=> b!781448 (= e!434652 Unit!26942)))

(declare-fun b!781449 () Bool)

(declare-fun e!434651 () Bool)

(declare-fun e!434646 () Bool)

(assert (=> b!781449 (= e!434651 e!434646)))

(declare-fun res!528645 () Bool)

(assert (=> b!781449 (=> (not res!528645) (not e!434646))))

(declare-datatypes ((SeekEntryResult!8013 0))(
  ( (MissingZero!8013 (index!34420 (_ BitVec 32))) (Found!8013 (index!34421 (_ BitVec 32))) (Intermediate!8013 (undefined!8825 Bool) (index!34422 (_ BitVec 32)) (x!65376 (_ BitVec 32))) (Undefined!8013) (MissingVacant!8013 (index!34423 (_ BitVec 32))) )
))
(declare-fun lt!348234 () SeekEntryResult!8013)

(assert (=> b!781449 (= res!528645 (or (= lt!348234 (MissingZero!8013 i!1173)) (= lt!348234 (MissingVacant!8013 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42647 (_ BitVec 32)) SeekEntryResult!8013)

(assert (=> b!781449 (= lt!348234 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!781450 () Bool)

(declare-fun res!528637 () Bool)

(assert (=> b!781450 (=> (not res!528637) (not e!434651))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!781450 (= res!528637 (and (= (size!20834 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20834 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20834 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781451 () Bool)

(declare-fun res!528653 () Bool)

(assert (=> b!781451 (=> (not res!528653) (not e!434651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781451 (= res!528653 (validKeyInArray!0 (select (arr!20413 a!3186) j!159)))))

(declare-fun res!528650 () Bool)

(assert (=> start!67544 (=> (not res!528650) (not e!434651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67544 (= res!528650 (validMask!0 mask!3328))))

(assert (=> start!67544 e!434651))

(assert (=> start!67544 true))

(declare-fun array_inv!16209 (array!42647) Bool)

(assert (=> start!67544 (array_inv!16209 a!3186)))

(declare-fun b!781452 () Bool)

(declare-fun e!434653 () Bool)

(assert (=> b!781452 (= e!434646 e!434653)))

(declare-fun res!528644 () Bool)

(assert (=> b!781452 (=> (not res!528644) (not e!434653))))

(declare-fun lt!348231 () SeekEntryResult!8013)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42647 (_ BitVec 32)) SeekEntryResult!8013)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781452 (= res!528644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20413 a!3186) j!159) mask!3328) (select (arr!20413 a!3186) j!159) a!3186 mask!3328) lt!348231))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781452 (= lt!348231 (Intermediate!8013 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781453 () Bool)

(declare-fun e!434649 () Bool)

(assert (=> b!781453 (= e!434653 e!434649)))

(declare-fun res!528640 () Bool)

(assert (=> b!781453 (=> (not res!528640) (not e!434649))))

(declare-fun lt!348230 () SeekEntryResult!8013)

(declare-fun lt!348239 () SeekEntryResult!8013)

(assert (=> b!781453 (= res!528640 (= lt!348230 lt!348239))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!348238 () array!42647)

(assert (=> b!781453 (= lt!348239 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348235 lt!348238 mask!3328))))

(assert (=> b!781453 (= lt!348230 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348235 mask!3328) lt!348235 lt!348238 mask!3328))))

(assert (=> b!781453 (= lt!348235 (select (store (arr!20413 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781453 (= lt!348238 (array!42648 (store (arr!20413 a!3186) i!1173 k0!2102) (size!20834 a!3186)))))

(declare-fun b!781454 () Bool)

(declare-fun res!528646 () Bool)

(assert (=> b!781454 (=> res!528646 e!434650)))

(declare-fun lt!348232 () SeekEntryResult!8013)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42647 (_ BitVec 32)) SeekEntryResult!8013)

(assert (=> b!781454 (= res!528646 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20413 a!3186) j!159) a!3186 mask!3328) lt!348232)))))

(declare-fun b!781455 () Bool)

(declare-fun res!528639 () Bool)

(assert (=> b!781455 (=> (not res!528639) (not e!434653))))

(assert (=> b!781455 (= res!528639 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20413 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781456 () Bool)

(declare-fun Unit!26943 () Unit!26940)

(assert (=> b!781456 (= e!434652 Unit!26943)))

(assert (=> b!781456 false))

(declare-fun b!781457 () Bool)

(declare-fun res!528648 () Bool)

(assert (=> b!781457 (=> (not res!528648) (not e!434646))))

(declare-datatypes ((List!14415 0))(
  ( (Nil!14412) (Cons!14411 (h!15531 (_ BitVec 64)) (t!20730 List!14415)) )
))
(declare-fun arrayNoDuplicates!0 (array!42647 (_ BitVec 32) List!14415) Bool)

(assert (=> b!781457 (= res!528648 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14412))))

(declare-fun b!781458 () Bool)

(assert (=> b!781458 (= e!434649 (not e!434650))))

(declare-fun res!528649 () Bool)

(assert (=> b!781458 (=> res!528649 e!434650)))

(get-info :version)

(assert (=> b!781458 (= res!528649 (or (not ((_ is Intermediate!8013) lt!348239)) (bvslt x!1131 (x!65376 lt!348239)) (not (= x!1131 (x!65376 lt!348239))) (not (= index!1321 (index!34422 lt!348239)))))))

(declare-fun e!434648 () Bool)

(assert (=> b!781458 e!434648))

(declare-fun res!528641 () Bool)

(assert (=> b!781458 (=> (not res!528641) (not e!434648))))

(declare-fun lt!348236 () SeekEntryResult!8013)

(assert (=> b!781458 (= res!528641 (= lt!348236 lt!348232))))

(assert (=> b!781458 (= lt!348232 (Found!8013 j!159))))

(assert (=> b!781458 (= lt!348236 (seekEntryOrOpen!0 (select (arr!20413 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42647 (_ BitVec 32)) Bool)

(assert (=> b!781458 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348233 () Unit!26940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26940)

(assert (=> b!781458 (= lt!348233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781459 () Bool)

(assert (=> b!781459 (= e!434648 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20413 a!3186) j!159) a!3186 mask!3328) lt!348232))))

(declare-fun b!781460 () Bool)

(assert (=> b!781460 (= e!434650 true)))

(assert (=> b!781460 (= (select (store (arr!20413 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348237 () Unit!26940)

(assert (=> b!781460 (= lt!348237 e!434652)))

(declare-fun c!86811 () Bool)

(assert (=> b!781460 (= c!86811 (= (select (store (arr!20413 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781461 () Bool)

(declare-fun res!528651 () Bool)

(assert (=> b!781461 (=> (not res!528651) (not e!434646))))

(assert (=> b!781461 (= res!528651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781462 () Bool)

(declare-fun res!528652 () Bool)

(assert (=> b!781462 (=> (not res!528652) (not e!434651))))

(declare-fun arrayContainsKey!0 (array!42647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781462 (= res!528652 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781463 () Bool)

(declare-fun res!528647 () Bool)

(assert (=> b!781463 (=> (not res!528647) (not e!434646))))

(assert (=> b!781463 (= res!528647 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20834 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20834 a!3186))))))

(declare-fun b!781464 () Bool)

(declare-fun e!434647 () Bool)

(assert (=> b!781464 (= e!434647 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20413 a!3186) j!159) a!3186 mask!3328) (Found!8013 j!159)))))

(declare-fun b!781465 () Bool)

(assert (=> b!781465 (= e!434647 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20413 a!3186) j!159) a!3186 mask!3328) lt!348231))))

(declare-fun b!781466 () Bool)

(declare-fun res!528638 () Bool)

(assert (=> b!781466 (=> (not res!528638) (not e!434653))))

(assert (=> b!781466 (= res!528638 e!434647)))

(declare-fun c!86812 () Bool)

(assert (=> b!781466 (= c!86812 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781467 () Bool)

(declare-fun res!528643 () Bool)

(assert (=> b!781467 (=> (not res!528643) (not e!434651))))

(assert (=> b!781467 (= res!528643 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67544 res!528650) b!781450))

(assert (= (and b!781450 res!528637) b!781451))

(assert (= (and b!781451 res!528653) b!781467))

(assert (= (and b!781467 res!528643) b!781462))

(assert (= (and b!781462 res!528652) b!781449))

(assert (= (and b!781449 res!528645) b!781461))

(assert (= (and b!781461 res!528651) b!781457))

(assert (= (and b!781457 res!528648) b!781463))

(assert (= (and b!781463 res!528647) b!781452))

(assert (= (and b!781452 res!528644) b!781455))

(assert (= (and b!781455 res!528639) b!781466))

(assert (= (and b!781466 c!86812) b!781465))

(assert (= (and b!781466 (not c!86812)) b!781464))

(assert (= (and b!781466 res!528638) b!781453))

(assert (= (and b!781453 res!528640) b!781458))

(assert (= (and b!781458 res!528641) b!781459))

(assert (= (and b!781458 (not res!528649)) b!781454))

(assert (= (and b!781454 (not res!528646)) b!781447))

(assert (= (and b!781447 (not res!528642)) b!781460))

(assert (= (and b!781460 c!86811) b!781456))

(assert (= (and b!781460 (not c!86811)) b!781448))

(declare-fun m!724475 () Bool)

(assert (=> b!781467 m!724475))

(declare-fun m!724477 () Bool)

(assert (=> b!781455 m!724477))

(declare-fun m!724479 () Bool)

(assert (=> b!781464 m!724479))

(assert (=> b!781464 m!724479))

(declare-fun m!724481 () Bool)

(assert (=> b!781464 m!724481))

(assert (=> b!781454 m!724479))

(assert (=> b!781454 m!724479))

(assert (=> b!781454 m!724481))

(assert (=> b!781459 m!724479))

(assert (=> b!781459 m!724479))

(declare-fun m!724483 () Bool)

(assert (=> b!781459 m!724483))

(declare-fun m!724485 () Bool)

(assert (=> b!781462 m!724485))

(declare-fun m!724487 () Bool)

(assert (=> b!781449 m!724487))

(assert (=> b!781458 m!724479))

(assert (=> b!781458 m!724479))

(declare-fun m!724489 () Bool)

(assert (=> b!781458 m!724489))

(declare-fun m!724491 () Bool)

(assert (=> b!781458 m!724491))

(declare-fun m!724493 () Bool)

(assert (=> b!781458 m!724493))

(declare-fun m!724495 () Bool)

(assert (=> b!781460 m!724495))

(declare-fun m!724497 () Bool)

(assert (=> b!781460 m!724497))

(declare-fun m!724499 () Bool)

(assert (=> b!781461 m!724499))

(assert (=> b!781451 m!724479))

(assert (=> b!781451 m!724479))

(declare-fun m!724501 () Bool)

(assert (=> b!781451 m!724501))

(declare-fun m!724503 () Bool)

(assert (=> b!781453 m!724503))

(declare-fun m!724505 () Bool)

(assert (=> b!781453 m!724505))

(assert (=> b!781453 m!724503))

(declare-fun m!724507 () Bool)

(assert (=> b!781453 m!724507))

(assert (=> b!781453 m!724495))

(declare-fun m!724509 () Bool)

(assert (=> b!781453 m!724509))

(assert (=> b!781452 m!724479))

(assert (=> b!781452 m!724479))

(declare-fun m!724511 () Bool)

(assert (=> b!781452 m!724511))

(assert (=> b!781452 m!724511))

(assert (=> b!781452 m!724479))

(declare-fun m!724513 () Bool)

(assert (=> b!781452 m!724513))

(assert (=> b!781465 m!724479))

(assert (=> b!781465 m!724479))

(declare-fun m!724515 () Bool)

(assert (=> b!781465 m!724515))

(declare-fun m!724517 () Bool)

(assert (=> start!67544 m!724517))

(declare-fun m!724519 () Bool)

(assert (=> start!67544 m!724519))

(assert (=> b!781447 m!724495))

(assert (=> b!781447 m!724497))

(declare-fun m!724521 () Bool)

(assert (=> b!781457 m!724521))

(check-sat (not b!781454) (not b!781451) (not b!781458) (not b!781464) (not b!781453) (not b!781462) (not b!781457) (not start!67544) (not b!781467) (not b!781449) (not b!781465) (not b!781461) (not b!781452) (not b!781459))
(check-sat)
