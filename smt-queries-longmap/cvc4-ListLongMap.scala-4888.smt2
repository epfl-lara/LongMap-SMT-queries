; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67378 () Bool)

(assert start!67378)

(declare-fun b!779599 () Bool)

(declare-fun e!433691 () Bool)

(declare-fun e!433687 () Bool)

(assert (=> b!779599 (= e!433691 e!433687)))

(declare-fun res!527537 () Bool)

(assert (=> b!779599 (=> (not res!527537) (not e!433687))))

(declare-datatypes ((SeekEntryResult!7996 0))(
  ( (MissingZero!7996 (index!34352 (_ BitVec 32))) (Found!7996 (index!34353 (_ BitVec 32))) (Intermediate!7996 (undefined!8808 Bool) (index!34354 (_ BitVec 32)) (x!65293 (_ BitVec 32))) (Undefined!7996) (MissingVacant!7996 (index!34355 (_ BitVec 32))) )
))
(declare-fun lt!347391 () SeekEntryResult!7996)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779599 (= res!527537 (or (= lt!347391 (MissingZero!7996 i!1173)) (= lt!347391 (MissingVacant!7996 i!1173))))))

(declare-datatypes ((array!42607 0))(
  ( (array!42608 (arr!20396 (Array (_ BitVec 32) (_ BitVec 64))) (size!20817 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42607)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42607 (_ BitVec 32)) SeekEntryResult!7996)

(assert (=> b!779599 (= lt!347391 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!779600 () Bool)

(declare-fun res!527543 () Bool)

(declare-fun e!433683 () Bool)

(assert (=> b!779600 (=> (not res!527543) (not e!433683))))

(declare-fun e!433688 () Bool)

(assert (=> b!779600 (= res!527543 e!433688)))

(declare-fun c!86434 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779600 (= c!86434 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779601 () Bool)

(declare-fun res!527542 () Bool)

(assert (=> b!779601 (=> (not res!527542) (not e!433687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42607 (_ BitVec 32)) Bool)

(assert (=> b!779601 (= res!527542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779602 () Bool)

(declare-fun res!527549 () Bool)

(assert (=> b!779602 (=> (not res!527549) (not e!433683))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!779602 (= res!527549 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20396 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779603 () Bool)

(declare-fun res!527548 () Bool)

(assert (=> b!779603 (=> (not res!527548) (not e!433691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779603 (= res!527548 (validKeyInArray!0 k!2102))))

(declare-fun b!779604 () Bool)

(declare-fun e!433689 () Bool)

(declare-fun e!433685 () Bool)

(assert (=> b!779604 (= e!433689 (not e!433685))))

(declare-fun res!527547 () Bool)

(assert (=> b!779604 (=> res!527547 e!433685)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!347396 () SeekEntryResult!7996)

(assert (=> b!779604 (= res!527547 (or (not (is-Intermediate!7996 lt!347396)) (bvslt x!1131 (x!65293 lt!347396)) (not (= x!1131 (x!65293 lt!347396))) (not (= index!1321 (index!34354 lt!347396)))))))

(declare-fun e!433690 () Bool)

(assert (=> b!779604 e!433690))

(declare-fun res!527544 () Bool)

(assert (=> b!779604 (=> (not res!527544) (not e!433690))))

(declare-fun lt!347390 () SeekEntryResult!7996)

(declare-fun lt!347393 () SeekEntryResult!7996)

(assert (=> b!779604 (= res!527544 (= lt!347390 lt!347393))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!779604 (= lt!347393 (Found!7996 j!159))))

(assert (=> b!779604 (= lt!347390 (seekEntryOrOpen!0 (select (arr!20396 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!779604 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26886 0))(
  ( (Unit!26887) )
))
(declare-fun lt!347399 () Unit!26886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26886)

(assert (=> b!779604 (= lt!347399 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779605 () Bool)

(declare-fun e!433686 () Bool)

(assert (=> b!779605 (= e!433686 true)))

(declare-fun lt!347392 () SeekEntryResult!7996)

(assert (=> b!779605 (= lt!347390 lt!347392)))

(declare-fun b!779606 () Bool)

(declare-fun res!527550 () Bool)

(assert (=> b!779606 (=> (not res!527550) (not e!433691))))

(declare-fun arrayContainsKey!0 (array!42607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779606 (= res!527550 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779607 () Bool)

(assert (=> b!779607 (= e!433685 e!433686)))

(declare-fun res!527551 () Bool)

(assert (=> b!779607 (=> res!527551 e!433686)))

(declare-fun lt!347398 () (_ BitVec 64))

(assert (=> b!779607 (= res!527551 (or (not (= lt!347392 lt!347393)) (= (select (store (arr!20396 a!3186) i!1173 k!2102) index!1321) lt!347398) (not (= (select (store (arr!20396 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42607 (_ BitVec 32)) SeekEntryResult!7996)

(assert (=> b!779607 (= lt!347392 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20396 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!347394 () SeekEntryResult!7996)

(declare-fun b!779608 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42607 (_ BitVec 32)) SeekEntryResult!7996)

(assert (=> b!779608 (= e!433688 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347394))))

(declare-fun b!779609 () Bool)

(declare-fun res!527552 () Bool)

(assert (=> b!779609 (=> (not res!527552) (not e!433691))))

(assert (=> b!779609 (= res!527552 (validKeyInArray!0 (select (arr!20396 a!3186) j!159)))))

(declare-fun b!779610 () Bool)

(assert (=> b!779610 (= e!433687 e!433683)))

(declare-fun res!527539 () Bool)

(assert (=> b!779610 (=> (not res!527539) (not e!433683))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779610 (= res!527539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20396 a!3186) j!159) mask!3328) (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347394))))

(assert (=> b!779610 (= lt!347394 (Intermediate!7996 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!527546 () Bool)

(assert (=> start!67378 (=> (not res!527546) (not e!433691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67378 (= res!527546 (validMask!0 mask!3328))))

(assert (=> start!67378 e!433691))

(assert (=> start!67378 true))

(declare-fun array_inv!16192 (array!42607) Bool)

(assert (=> start!67378 (array_inv!16192 a!3186)))

(declare-fun b!779611 () Bool)

(assert (=> b!779611 (= e!433690 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) lt!347393))))

(declare-fun b!779612 () Bool)

(declare-fun res!527541 () Bool)

(assert (=> b!779612 (=> (not res!527541) (not e!433691))))

(assert (=> b!779612 (= res!527541 (and (= (size!20817 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20817 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20817 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779613 () Bool)

(declare-fun res!527545 () Bool)

(assert (=> b!779613 (=> (not res!527545) (not e!433687))))

(assert (=> b!779613 (= res!527545 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20817 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20817 a!3186))))))

(declare-fun b!779614 () Bool)

(assert (=> b!779614 (= e!433688 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20396 a!3186) j!159) a!3186 mask!3328) (Found!7996 j!159)))))

(declare-fun b!779615 () Bool)

(assert (=> b!779615 (= e!433683 e!433689)))

(declare-fun res!527538 () Bool)

(assert (=> b!779615 (=> (not res!527538) (not e!433689))))

(declare-fun lt!347395 () SeekEntryResult!7996)

(assert (=> b!779615 (= res!527538 (= lt!347395 lt!347396))))

(declare-fun lt!347397 () array!42607)

(assert (=> b!779615 (= lt!347396 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347398 lt!347397 mask!3328))))

(assert (=> b!779615 (= lt!347395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347398 mask!3328) lt!347398 lt!347397 mask!3328))))

(assert (=> b!779615 (= lt!347398 (select (store (arr!20396 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!779615 (= lt!347397 (array!42608 (store (arr!20396 a!3186) i!1173 k!2102) (size!20817 a!3186)))))

(declare-fun b!779616 () Bool)

(declare-fun res!527540 () Bool)

(assert (=> b!779616 (=> (not res!527540) (not e!433687))))

(declare-datatypes ((List!14398 0))(
  ( (Nil!14395) (Cons!14394 (h!15508 (_ BitVec 64)) (t!20713 List!14398)) )
))
(declare-fun arrayNoDuplicates!0 (array!42607 (_ BitVec 32) List!14398) Bool)

(assert (=> b!779616 (= res!527540 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14395))))

(assert (= (and start!67378 res!527546) b!779612))

(assert (= (and b!779612 res!527541) b!779609))

(assert (= (and b!779609 res!527552) b!779603))

(assert (= (and b!779603 res!527548) b!779606))

(assert (= (and b!779606 res!527550) b!779599))

(assert (= (and b!779599 res!527537) b!779601))

(assert (= (and b!779601 res!527542) b!779616))

(assert (= (and b!779616 res!527540) b!779613))

(assert (= (and b!779613 res!527545) b!779610))

(assert (= (and b!779610 res!527539) b!779602))

(assert (= (and b!779602 res!527549) b!779600))

(assert (= (and b!779600 c!86434) b!779608))

(assert (= (and b!779600 (not c!86434)) b!779614))

(assert (= (and b!779600 res!527543) b!779615))

(assert (= (and b!779615 res!527538) b!779604))

(assert (= (and b!779604 res!527544) b!779611))

(assert (= (and b!779604 (not res!527547)) b!779607))

(assert (= (and b!779607 (not res!527551)) b!779605))

(declare-fun m!723095 () Bool)

(assert (=> b!779601 m!723095))

(declare-fun m!723097 () Bool)

(assert (=> b!779610 m!723097))

(assert (=> b!779610 m!723097))

(declare-fun m!723099 () Bool)

(assert (=> b!779610 m!723099))

(assert (=> b!779610 m!723099))

(assert (=> b!779610 m!723097))

(declare-fun m!723101 () Bool)

(assert (=> b!779610 m!723101))

(assert (=> b!779609 m!723097))

(assert (=> b!779609 m!723097))

(declare-fun m!723103 () Bool)

(assert (=> b!779609 m!723103))

(declare-fun m!723105 () Bool)

(assert (=> b!779602 m!723105))

(declare-fun m!723107 () Bool)

(assert (=> b!779603 m!723107))

(assert (=> b!779604 m!723097))

(assert (=> b!779604 m!723097))

(declare-fun m!723109 () Bool)

(assert (=> b!779604 m!723109))

(declare-fun m!723111 () Bool)

(assert (=> b!779604 m!723111))

(declare-fun m!723113 () Bool)

(assert (=> b!779604 m!723113))

(declare-fun m!723115 () Bool)

(assert (=> start!67378 m!723115))

(declare-fun m!723117 () Bool)

(assert (=> start!67378 m!723117))

(assert (=> b!779611 m!723097))

(assert (=> b!779611 m!723097))

(declare-fun m!723119 () Bool)

(assert (=> b!779611 m!723119))

(declare-fun m!723121 () Bool)

(assert (=> b!779606 m!723121))

(assert (=> b!779608 m!723097))

(assert (=> b!779608 m!723097))

(declare-fun m!723123 () Bool)

(assert (=> b!779608 m!723123))

(declare-fun m!723125 () Bool)

(assert (=> b!779599 m!723125))

(declare-fun m!723127 () Bool)

(assert (=> b!779616 m!723127))

(assert (=> b!779614 m!723097))

(assert (=> b!779614 m!723097))

(declare-fun m!723129 () Bool)

(assert (=> b!779614 m!723129))

(declare-fun m!723131 () Bool)

(assert (=> b!779607 m!723131))

(declare-fun m!723133 () Bool)

(assert (=> b!779607 m!723133))

(assert (=> b!779607 m!723097))

(assert (=> b!779607 m!723097))

(assert (=> b!779607 m!723129))

(declare-fun m!723135 () Bool)

(assert (=> b!779615 m!723135))

(assert (=> b!779615 m!723131))

(declare-fun m!723137 () Bool)

(assert (=> b!779615 m!723137))

(declare-fun m!723139 () Bool)

(assert (=> b!779615 m!723139))

(declare-fun m!723141 () Bool)

(assert (=> b!779615 m!723141))

(assert (=> b!779615 m!723137))

(push 1)

