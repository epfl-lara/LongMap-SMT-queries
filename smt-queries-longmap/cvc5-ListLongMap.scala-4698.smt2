; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65248 () Bool)

(assert start!65248)

(declare-fun b!739708 () Bool)

(declare-datatypes ((Unit!25292 0))(
  ( (Unit!25293) )
))
(declare-fun e!413613 () Unit!25292)

(declare-fun Unit!25294 () Unit!25292)

(assert (=> b!739708 (= e!413613 Unit!25294)))

(declare-datatypes ((array!41421 0))(
  ( (array!41422 (arr!19824 (Array (_ BitVec 32) (_ BitVec 64))) (size!20245 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41421)

(declare-fun lt!328505 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7424 0))(
  ( (MissingZero!7424 (index!32064 (_ BitVec 32))) (Found!7424 (index!32065 (_ BitVec 32))) (Intermediate!7424 (undefined!8236 Bool) (index!32066 (_ BitVec 32)) (x!63054 (_ BitVec 32))) (Undefined!7424) (MissingVacant!7424 (index!32067 (_ BitVec 32))) )
))
(declare-fun lt!328512 () SeekEntryResult!7424)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41421 (_ BitVec 32)) SeekEntryResult!7424)

(assert (=> b!739708 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328505 (select (arr!19824 a!3186) j!159) a!3186 mask!3328) lt!328512)))

(declare-fun b!739710 () Bool)

(declare-fun e!413616 () Bool)

(assert (=> b!739710 (= e!413616 true)))

(declare-fun lt!328506 () array!41421)

(declare-fun lt!328516 () SeekEntryResult!7424)

(declare-fun lt!328514 () (_ BitVec 64))

(assert (=> b!739710 (= lt!328516 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328505 lt!328514 lt!328506 mask!3328))))

(declare-fun b!739711 () Bool)

(declare-fun e!413617 () Bool)

(assert (=> b!739711 (= e!413617 e!413616)))

(declare-fun res!497391 () Bool)

(assert (=> b!739711 (=> res!497391 e!413616)))

(assert (=> b!739711 (= res!497391 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328505 #b00000000000000000000000000000000) (bvsge lt!328505 (size!20245 a!3186))))))

(declare-fun lt!328509 () Unit!25292)

(assert (=> b!739711 (= lt!328509 e!413613)))

(declare-fun c!81546 () Bool)

(declare-fun lt!328510 () Bool)

(assert (=> b!739711 (= c!81546 lt!328510)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739711 (= lt!328510 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739711 (= lt!328505 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739712 () Bool)

(declare-fun res!497379 () Bool)

(declare-fun e!413610 () Bool)

(assert (=> b!739712 (=> (not res!497379) (not e!413610))))

(declare-datatypes ((List!13826 0))(
  ( (Nil!13823) (Cons!13822 (h!14894 (_ BitVec 64)) (t!20141 List!13826)) )
))
(declare-fun arrayNoDuplicates!0 (array!41421 (_ BitVec 32) List!13826) Bool)

(assert (=> b!739712 (= res!497379 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13823))))

(declare-fun b!739713 () Bool)

(declare-fun e!413607 () Bool)

(assert (=> b!739713 (= e!413607 (not e!413617))))

(declare-fun res!497393 () Bool)

(assert (=> b!739713 (=> res!497393 e!413617)))

(declare-fun lt!328517 () SeekEntryResult!7424)

(assert (=> b!739713 (= res!497393 (or (not (is-Intermediate!7424 lt!328517)) (bvsge x!1131 (x!63054 lt!328517))))))

(declare-fun lt!328513 () SeekEntryResult!7424)

(assert (=> b!739713 (= lt!328513 (Found!7424 j!159))))

(declare-fun e!413609 () Bool)

(assert (=> b!739713 e!413609))

(declare-fun res!497396 () Bool)

(assert (=> b!739713 (=> (not res!497396) (not e!413609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41421 (_ BitVec 32)) Bool)

(assert (=> b!739713 (= res!497396 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328507 () Unit!25292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25292)

(assert (=> b!739713 (= lt!328507 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!413615 () Bool)

(declare-fun b!739714 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41421 (_ BitVec 32)) SeekEntryResult!7424)

(assert (=> b!739714 (= e!413615 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328505 resIntermediateIndex!5 (select (arr!19824 a!3186) j!159) a!3186 mask!3328) lt!328513)))))

(declare-fun b!739715 () Bool)

(declare-fun res!497392 () Bool)

(assert (=> b!739715 (=> (not res!497392) (not e!413610))))

(assert (=> b!739715 (= res!497392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739716 () Bool)

(declare-fun res!497389 () Bool)

(declare-fun e!413612 () Bool)

(assert (=> b!739716 (=> (not res!497389) (not e!413612))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739716 (= res!497389 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19824 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739717 () Bool)

(declare-fun res!497388 () Bool)

(declare-fun e!413618 () Bool)

(assert (=> b!739717 (=> (not res!497388) (not e!413618))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739717 (= res!497388 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739718 () Bool)

(assert (=> b!739718 (= e!413618 e!413610)))

(declare-fun res!497380 () Bool)

(assert (=> b!739718 (=> (not res!497380) (not e!413610))))

(declare-fun lt!328508 () SeekEntryResult!7424)

(assert (=> b!739718 (= res!497380 (or (= lt!328508 (MissingZero!7424 i!1173)) (= lt!328508 (MissingVacant!7424 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41421 (_ BitVec 32)) SeekEntryResult!7424)

(assert (=> b!739718 (= lt!328508 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!413608 () Bool)

(declare-fun b!739719 () Bool)

(assert (=> b!739719 (= e!413608 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19824 a!3186) j!159) a!3186 mask!3328) lt!328512))))

(declare-fun b!739720 () Bool)

(declare-fun res!497381 () Bool)

(assert (=> b!739720 (=> (not res!497381) (not e!413618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739720 (= res!497381 (validKeyInArray!0 (select (arr!19824 a!3186) j!159)))))

(declare-fun e!413614 () Bool)

(declare-fun lt!328511 () SeekEntryResult!7424)

(declare-fun b!739721 () Bool)

(assert (=> b!739721 (= e!413614 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19824 a!3186) j!159) a!3186 mask!3328) lt!328511))))

(declare-fun b!739722 () Bool)

(assert (=> b!739722 (= e!413608 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19824 a!3186) j!159) a!3186 mask!3328) (Found!7424 j!159)))))

(declare-fun b!739709 () Bool)

(declare-fun res!497394 () Bool)

(assert (=> b!739709 (=> (not res!497394) (not e!413618))))

(assert (=> b!739709 (= res!497394 (validKeyInArray!0 k!2102))))

(declare-fun res!497390 () Bool)

(assert (=> start!65248 (=> (not res!497390) (not e!413618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65248 (= res!497390 (validMask!0 mask!3328))))

(assert (=> start!65248 e!413618))

(assert (=> start!65248 true))

(declare-fun array_inv!15620 (array!41421) Bool)

(assert (=> start!65248 (array_inv!15620 a!3186)))

(declare-fun b!739723 () Bool)

(declare-fun res!497395 () Bool)

(assert (=> b!739723 (=> (not res!497395) (not e!413618))))

(assert (=> b!739723 (= res!497395 (and (= (size!20245 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20245 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20245 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739724 () Bool)

(assert (=> b!739724 (= e!413612 e!413607)))

(declare-fun res!497387 () Bool)

(assert (=> b!739724 (=> (not res!497387) (not e!413607))))

(declare-fun lt!328515 () SeekEntryResult!7424)

(assert (=> b!739724 (= res!497387 (= lt!328515 lt!328517))))

(assert (=> b!739724 (= lt!328517 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328514 lt!328506 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739724 (= lt!328515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328514 mask!3328) lt!328514 lt!328506 mask!3328))))

(assert (=> b!739724 (= lt!328514 (select (store (arr!19824 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!739724 (= lt!328506 (array!41422 (store (arr!19824 a!3186) i!1173 k!2102) (size!20245 a!3186)))))

(declare-fun b!739725 () Bool)

(assert (=> b!739725 (= e!413615 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328505 (select (arr!19824 a!3186) j!159) a!3186 mask!3328) lt!328512)))))

(declare-fun b!739726 () Bool)

(assert (=> b!739726 (= e!413609 e!413614)))

(declare-fun res!497383 () Bool)

(assert (=> b!739726 (=> (not res!497383) (not e!413614))))

(assert (=> b!739726 (= res!497383 (= (seekEntryOrOpen!0 (select (arr!19824 a!3186) j!159) a!3186 mask!3328) lt!328511))))

(assert (=> b!739726 (= lt!328511 (Found!7424 j!159))))

(declare-fun b!739727 () Bool)

(declare-fun Unit!25295 () Unit!25292)

(assert (=> b!739727 (= e!413613 Unit!25295)))

(declare-fun lt!328504 () SeekEntryResult!7424)

(assert (=> b!739727 (= lt!328504 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19824 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739727 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328505 resIntermediateIndex!5 (select (arr!19824 a!3186) j!159) a!3186 mask!3328) lt!328513)))

(declare-fun b!739728 () Bool)

(declare-fun res!497385 () Bool)

(assert (=> b!739728 (=> res!497385 e!413616)))

(assert (=> b!739728 (= res!497385 e!413615)))

(declare-fun c!81545 () Bool)

(assert (=> b!739728 (= c!81545 lt!328510)))

(declare-fun b!739729 () Bool)

(assert (=> b!739729 (= e!413610 e!413612)))

(declare-fun res!497382 () Bool)

(assert (=> b!739729 (=> (not res!497382) (not e!413612))))

(assert (=> b!739729 (= res!497382 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19824 a!3186) j!159) mask!3328) (select (arr!19824 a!3186) j!159) a!3186 mask!3328) lt!328512))))

(assert (=> b!739729 (= lt!328512 (Intermediate!7424 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739730 () Bool)

(declare-fun res!497386 () Bool)

(assert (=> b!739730 (=> (not res!497386) (not e!413610))))

(assert (=> b!739730 (= res!497386 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20245 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20245 a!3186))))))

(declare-fun b!739731 () Bool)

(declare-fun res!497384 () Bool)

(assert (=> b!739731 (=> (not res!497384) (not e!413612))))

(assert (=> b!739731 (= res!497384 e!413608)))

(declare-fun c!81547 () Bool)

(assert (=> b!739731 (= c!81547 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65248 res!497390) b!739723))

(assert (= (and b!739723 res!497395) b!739720))

(assert (= (and b!739720 res!497381) b!739709))

(assert (= (and b!739709 res!497394) b!739717))

(assert (= (and b!739717 res!497388) b!739718))

(assert (= (and b!739718 res!497380) b!739715))

(assert (= (and b!739715 res!497392) b!739712))

(assert (= (and b!739712 res!497379) b!739730))

(assert (= (and b!739730 res!497386) b!739729))

(assert (= (and b!739729 res!497382) b!739716))

(assert (= (and b!739716 res!497389) b!739731))

(assert (= (and b!739731 c!81547) b!739719))

(assert (= (and b!739731 (not c!81547)) b!739722))

(assert (= (and b!739731 res!497384) b!739724))

(assert (= (and b!739724 res!497387) b!739713))

(assert (= (and b!739713 res!497396) b!739726))

(assert (= (and b!739726 res!497383) b!739721))

(assert (= (and b!739713 (not res!497393)) b!739711))

(assert (= (and b!739711 c!81546) b!739708))

(assert (= (and b!739711 (not c!81546)) b!739727))

(assert (= (and b!739711 (not res!497391)) b!739728))

(assert (= (and b!739728 c!81545) b!739725))

(assert (= (and b!739728 (not c!81545)) b!739714))

(assert (= (and b!739728 (not res!497385)) b!739710))

(declare-fun m!691021 () Bool)

(assert (=> b!739712 m!691021))

(declare-fun m!691023 () Bool)

(assert (=> b!739725 m!691023))

(assert (=> b!739725 m!691023))

(declare-fun m!691025 () Bool)

(assert (=> b!739725 m!691025))

(declare-fun m!691027 () Bool)

(assert (=> start!65248 m!691027))

(declare-fun m!691029 () Bool)

(assert (=> start!65248 m!691029))

(declare-fun m!691031 () Bool)

(assert (=> b!739715 m!691031))

(declare-fun m!691033 () Bool)

(assert (=> b!739724 m!691033))

(declare-fun m!691035 () Bool)

(assert (=> b!739724 m!691035))

(declare-fun m!691037 () Bool)

(assert (=> b!739724 m!691037))

(declare-fun m!691039 () Bool)

(assert (=> b!739724 m!691039))

(assert (=> b!739724 m!691033))

(declare-fun m!691041 () Bool)

(assert (=> b!739724 m!691041))

(assert (=> b!739720 m!691023))

(assert (=> b!739720 m!691023))

(declare-fun m!691043 () Bool)

(assert (=> b!739720 m!691043))

(assert (=> b!739719 m!691023))

(assert (=> b!739719 m!691023))

(declare-fun m!691045 () Bool)

(assert (=> b!739719 m!691045))

(assert (=> b!739708 m!691023))

(assert (=> b!739708 m!691023))

(assert (=> b!739708 m!691025))

(declare-fun m!691047 () Bool)

(assert (=> b!739716 m!691047))

(declare-fun m!691049 () Bool)

(assert (=> b!739711 m!691049))

(assert (=> b!739727 m!691023))

(assert (=> b!739727 m!691023))

(declare-fun m!691051 () Bool)

(assert (=> b!739727 m!691051))

(assert (=> b!739727 m!691023))

(declare-fun m!691053 () Bool)

(assert (=> b!739727 m!691053))

(assert (=> b!739729 m!691023))

(assert (=> b!739729 m!691023))

(declare-fun m!691055 () Bool)

(assert (=> b!739729 m!691055))

(assert (=> b!739729 m!691055))

(assert (=> b!739729 m!691023))

(declare-fun m!691057 () Bool)

(assert (=> b!739729 m!691057))

(declare-fun m!691059 () Bool)

(assert (=> b!739717 m!691059))

(assert (=> b!739726 m!691023))

(assert (=> b!739726 m!691023))

(declare-fun m!691061 () Bool)

(assert (=> b!739726 m!691061))

(assert (=> b!739722 m!691023))

(assert (=> b!739722 m!691023))

(assert (=> b!739722 m!691051))

(declare-fun m!691063 () Bool)

(assert (=> b!739709 m!691063))

(declare-fun m!691065 () Bool)

(assert (=> b!739718 m!691065))

(declare-fun m!691067 () Bool)

(assert (=> b!739713 m!691067))

(declare-fun m!691069 () Bool)

(assert (=> b!739713 m!691069))

(declare-fun m!691071 () Bool)

(assert (=> b!739710 m!691071))

(assert (=> b!739721 m!691023))

(assert (=> b!739721 m!691023))

(declare-fun m!691073 () Bool)

(assert (=> b!739721 m!691073))

(assert (=> b!739714 m!691023))

(assert (=> b!739714 m!691023))

(assert (=> b!739714 m!691053))

(push 1)

