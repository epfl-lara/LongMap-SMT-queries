; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67154 () Bool)

(assert start!67154)

(declare-fun b!776508 () Bool)

(declare-fun res!525414 () Bool)

(declare-fun e!432074 () Bool)

(assert (=> b!776508 (=> (not res!525414) (not e!432074))))

(declare-fun e!432073 () Bool)

(assert (=> b!776508 (= res!525414 e!432073)))

(declare-fun c!85947 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776508 (= c!85947 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776509 () Bool)

(declare-fun res!525419 () Bool)

(declare-fun e!432071 () Bool)

(assert (=> b!776509 (=> (not res!525419) (not e!432071))))

(declare-datatypes ((array!42528 0))(
  ( (array!42529 (arr!20360 (Array (_ BitVec 32) (_ BitVec 64))) (size!20781 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42528)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!776509 (= res!525419 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20781 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20781 a!3186))))))

(declare-datatypes ((SeekEntryResult!7957 0))(
  ( (MissingZero!7957 (index!34196 (_ BitVec 32))) (Found!7957 (index!34197 (_ BitVec 32))) (Intermediate!7957 (undefined!8769 Bool) (index!34198 (_ BitVec 32)) (x!65143 (_ BitVec 32))) (Undefined!7957) (MissingVacant!7957 (index!34199 (_ BitVec 32))) )
))
(declare-fun lt!345846 () SeekEntryResult!7957)

(declare-fun b!776510 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42528 (_ BitVec 32)) SeekEntryResult!7957)

(assert (=> b!776510 (= e!432073 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20360 a!3186) j!159) a!3186 mask!3328) lt!345846))))

(declare-fun b!776511 () Bool)

(declare-fun res!525422 () Bool)

(assert (=> b!776511 (=> (not res!525422) (not e!432071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42528 (_ BitVec 32)) Bool)

(assert (=> b!776511 (= res!525422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776512 () Bool)

(declare-fun e!432078 () Bool)

(assert (=> b!776512 (= e!432074 e!432078)))

(declare-fun res!525426 () Bool)

(assert (=> b!776512 (=> (not res!525426) (not e!432078))))

(declare-fun lt!345842 () SeekEntryResult!7957)

(declare-fun lt!345845 () SeekEntryResult!7957)

(assert (=> b!776512 (= res!525426 (= lt!345842 lt!345845))))

(declare-fun lt!345848 () array!42528)

(declare-fun lt!345840 () (_ BitVec 64))

(assert (=> b!776512 (= lt!345845 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345840 lt!345848 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776512 (= lt!345842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345840 mask!3328) lt!345840 lt!345848 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!776512 (= lt!345840 (select (store (arr!20360 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776512 (= lt!345848 (array!42529 (store (arr!20360 a!3186) i!1173 k0!2102) (size!20781 a!3186)))))

(declare-fun b!776513 () Bool)

(assert (=> b!776513 (= e!432071 e!432074)))

(declare-fun res!525421 () Bool)

(assert (=> b!776513 (=> (not res!525421) (not e!432074))))

(assert (=> b!776513 (= res!525421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20360 a!3186) j!159) mask!3328) (select (arr!20360 a!3186) j!159) a!3186 mask!3328) lt!345846))))

(assert (=> b!776513 (= lt!345846 (Intermediate!7957 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776514 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42528 (_ BitVec 32)) SeekEntryResult!7957)

(assert (=> b!776514 (= e!432073 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20360 a!3186) j!159) a!3186 mask!3328) (Found!7957 j!159)))))

(declare-fun b!776515 () Bool)

(declare-fun res!525428 () Bool)

(assert (=> b!776515 (=> (not res!525428) (not e!432071))))

(declare-datatypes ((List!14401 0))(
  ( (Nil!14398) (Cons!14397 (h!15505 (_ BitVec 64)) (t!20707 List!14401)) )
))
(declare-fun arrayNoDuplicates!0 (array!42528 (_ BitVec 32) List!14401) Bool)

(assert (=> b!776515 (= res!525428 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14398))))

(declare-fun b!776517 () Bool)

(declare-fun res!525416 () Bool)

(declare-fun e!432076 () Bool)

(assert (=> b!776517 (=> (not res!525416) (not e!432076))))

(declare-fun arrayContainsKey!0 (array!42528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776517 (= res!525416 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776518 () Bool)

(declare-fun res!525425 () Bool)

(assert (=> b!776518 (=> (not res!525425) (not e!432074))))

(assert (=> b!776518 (= res!525425 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20360 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776519 () Bool)

(declare-fun e!432077 () Bool)

(assert (=> b!776519 (= e!432077 true)))

(declare-fun lt!345844 () SeekEntryResult!7957)

(assert (=> b!776519 (= lt!345844 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20360 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776520 () Bool)

(assert (=> b!776520 (= e!432078 (not e!432077))))

(declare-fun res!525424 () Bool)

(assert (=> b!776520 (=> res!525424 e!432077)))

(get-info :version)

(assert (=> b!776520 (= res!525424 (or (not ((_ is Intermediate!7957) lt!345845)) (bvslt x!1131 (x!65143 lt!345845)) (not (= x!1131 (x!65143 lt!345845))) (not (= index!1321 (index!34198 lt!345845)))))))

(declare-fun e!432075 () Bool)

(assert (=> b!776520 e!432075))

(declare-fun res!525415 () Bool)

(assert (=> b!776520 (=> (not res!525415) (not e!432075))))

(assert (=> b!776520 (= res!525415 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26780 0))(
  ( (Unit!26781) )
))
(declare-fun lt!345841 () Unit!26780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26780)

(assert (=> b!776520 (= lt!345841 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776521 () Bool)

(declare-fun res!525420 () Bool)

(assert (=> b!776521 (=> (not res!525420) (not e!432076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776521 (= res!525420 (validKeyInArray!0 k0!2102))))

(declare-fun b!776522 () Bool)

(declare-fun res!525417 () Bool)

(assert (=> b!776522 (=> (not res!525417) (not e!432076))))

(assert (=> b!776522 (= res!525417 (validKeyInArray!0 (select (arr!20360 a!3186) j!159)))))

(declare-fun res!525427 () Bool)

(assert (=> start!67154 (=> (not res!525427) (not e!432076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67154 (= res!525427 (validMask!0 mask!3328))))

(assert (=> start!67154 e!432076))

(assert (=> start!67154 true))

(declare-fun array_inv!16243 (array!42528) Bool)

(assert (=> start!67154 (array_inv!16243 a!3186)))

(declare-fun b!776516 () Bool)

(declare-fun e!432079 () Bool)

(assert (=> b!776516 (= e!432075 e!432079)))

(declare-fun res!525429 () Bool)

(assert (=> b!776516 (=> (not res!525429) (not e!432079))))

(declare-fun lt!345843 () SeekEntryResult!7957)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42528 (_ BitVec 32)) SeekEntryResult!7957)

(assert (=> b!776516 (= res!525429 (= (seekEntryOrOpen!0 (select (arr!20360 a!3186) j!159) a!3186 mask!3328) lt!345843))))

(assert (=> b!776516 (= lt!345843 (Found!7957 j!159))))

(declare-fun b!776523 () Bool)

(assert (=> b!776523 (= e!432076 e!432071)))

(declare-fun res!525418 () Bool)

(assert (=> b!776523 (=> (not res!525418) (not e!432071))))

(declare-fun lt!345847 () SeekEntryResult!7957)

(assert (=> b!776523 (= res!525418 (or (= lt!345847 (MissingZero!7957 i!1173)) (= lt!345847 (MissingVacant!7957 i!1173))))))

(assert (=> b!776523 (= lt!345847 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776524 () Bool)

(assert (=> b!776524 (= e!432079 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20360 a!3186) j!159) a!3186 mask!3328) lt!345843))))

(declare-fun b!776525 () Bool)

(declare-fun res!525423 () Bool)

(assert (=> b!776525 (=> (not res!525423) (not e!432076))))

(assert (=> b!776525 (= res!525423 (and (= (size!20781 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20781 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20781 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67154 res!525427) b!776525))

(assert (= (and b!776525 res!525423) b!776522))

(assert (= (and b!776522 res!525417) b!776521))

(assert (= (and b!776521 res!525420) b!776517))

(assert (= (and b!776517 res!525416) b!776523))

(assert (= (and b!776523 res!525418) b!776511))

(assert (= (and b!776511 res!525422) b!776515))

(assert (= (and b!776515 res!525428) b!776509))

(assert (= (and b!776509 res!525419) b!776513))

(assert (= (and b!776513 res!525421) b!776518))

(assert (= (and b!776518 res!525425) b!776508))

(assert (= (and b!776508 c!85947) b!776510))

(assert (= (and b!776508 (not c!85947)) b!776514))

(assert (= (and b!776508 res!525414) b!776512))

(assert (= (and b!776512 res!525426) b!776520))

(assert (= (and b!776520 res!525415) b!776516))

(assert (= (and b!776516 res!525429) b!776524))

(assert (= (and b!776520 (not res!525424)) b!776519))

(declare-fun m!720033 () Bool)

(assert (=> b!776512 m!720033))

(declare-fun m!720035 () Bool)

(assert (=> b!776512 m!720035))

(assert (=> b!776512 m!720033))

(declare-fun m!720037 () Bool)

(assert (=> b!776512 m!720037))

(declare-fun m!720039 () Bool)

(assert (=> b!776512 m!720039))

(declare-fun m!720041 () Bool)

(assert (=> b!776512 m!720041))

(declare-fun m!720043 () Bool)

(assert (=> b!776511 m!720043))

(declare-fun m!720045 () Bool)

(assert (=> b!776510 m!720045))

(assert (=> b!776510 m!720045))

(declare-fun m!720047 () Bool)

(assert (=> b!776510 m!720047))

(assert (=> b!776524 m!720045))

(assert (=> b!776524 m!720045))

(declare-fun m!720049 () Bool)

(assert (=> b!776524 m!720049))

(assert (=> b!776519 m!720045))

(assert (=> b!776519 m!720045))

(declare-fun m!720051 () Bool)

(assert (=> b!776519 m!720051))

(declare-fun m!720053 () Bool)

(assert (=> b!776517 m!720053))

(assert (=> b!776516 m!720045))

(assert (=> b!776516 m!720045))

(declare-fun m!720055 () Bool)

(assert (=> b!776516 m!720055))

(assert (=> b!776514 m!720045))

(assert (=> b!776514 m!720045))

(assert (=> b!776514 m!720051))

(assert (=> b!776522 m!720045))

(assert (=> b!776522 m!720045))

(declare-fun m!720057 () Bool)

(assert (=> b!776522 m!720057))

(declare-fun m!720059 () Bool)

(assert (=> b!776520 m!720059))

(declare-fun m!720061 () Bool)

(assert (=> b!776520 m!720061))

(declare-fun m!720063 () Bool)

(assert (=> b!776515 m!720063))

(declare-fun m!720065 () Bool)

(assert (=> b!776521 m!720065))

(declare-fun m!720067 () Bool)

(assert (=> b!776518 m!720067))

(declare-fun m!720069 () Bool)

(assert (=> start!67154 m!720069))

(declare-fun m!720071 () Bool)

(assert (=> start!67154 m!720071))

(assert (=> b!776513 m!720045))

(assert (=> b!776513 m!720045))

(declare-fun m!720073 () Bool)

(assert (=> b!776513 m!720073))

(assert (=> b!776513 m!720073))

(assert (=> b!776513 m!720045))

(declare-fun m!720075 () Bool)

(assert (=> b!776513 m!720075))

(declare-fun m!720077 () Bool)

(assert (=> b!776523 m!720077))

(check-sat (not b!776521) (not b!776510) (not b!776515) (not start!67154) (not b!776512) (not b!776511) (not b!776523) (not b!776522) (not b!776519) (not b!776513) (not b!776520) (not b!776524) (not b!776516) (not b!776514) (not b!776517))
(check-sat)
