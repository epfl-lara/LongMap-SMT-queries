; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65410 () Bool)

(assert start!65410)

(declare-fun res!501481 () Bool)

(declare-fun e!415887 () Bool)

(assert (=> start!65410 (=> (not res!501481) (not e!415887))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65410 (= res!501481 (validMask!0 mask!3328))))

(assert (=> start!65410 e!415887))

(assert (=> start!65410 true))

(declare-datatypes ((array!41583 0))(
  ( (array!41584 (arr!19905 (Array (_ BitVec 32) (_ BitVec 64))) (size!20326 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41583)

(declare-fun array_inv!15701 (array!41583) Bool)

(assert (=> start!65410 (array_inv!15701 a!3186)))

(declare-fun b!744504 () Bool)

(declare-fun res!501493 () Bool)

(declare-fun e!415893 () Bool)

(assert (=> b!744504 (=> (not res!501493) (not e!415893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41583 (_ BitVec 32)) Bool)

(assert (=> b!744504 (= res!501493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!744505 () Bool)

(declare-fun e!415890 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7505 0))(
  ( (MissingZero!7505 (index!32388 (_ BitVec 32))) (Found!7505 (index!32389 (_ BitVec 32))) (Intermediate!7505 (undefined!8317 Bool) (index!32390 (_ BitVec 32)) (x!63351 (_ BitVec 32))) (Undefined!7505) (MissingVacant!7505 (index!32391 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41583 (_ BitVec 32)) SeekEntryResult!7505)

(assert (=> b!744505 (= e!415890 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19905 a!3186) j!159) a!3186 mask!3328) (Found!7505 j!159)))))

(declare-fun lt!330742 () SeekEntryResult!7505)

(declare-fun b!744506 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41583 (_ BitVec 32)) SeekEntryResult!7505)

(assert (=> b!744506 (= e!415890 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19905 a!3186) j!159) a!3186 mask!3328) lt!330742))))

(declare-fun b!744507 () Bool)

(declare-fun res!501496 () Bool)

(assert (=> b!744507 (=> (not res!501496) (not e!415887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744507 (= res!501496 (validKeyInArray!0 (select (arr!19905 a!3186) j!159)))))

(declare-fun b!744508 () Bool)

(declare-fun e!415891 () Bool)

(declare-fun e!415892 () Bool)

(assert (=> b!744508 (= e!415891 e!415892)))

(declare-fun res!501482 () Bool)

(assert (=> b!744508 (=> (not res!501482) (not e!415892))))

(declare-fun lt!330746 () SeekEntryResult!7505)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41583 (_ BitVec 32)) SeekEntryResult!7505)

(assert (=> b!744508 (= res!501482 (= (seekEntryOrOpen!0 (select (arr!19905 a!3186) j!159) a!3186 mask!3328) lt!330746))))

(assert (=> b!744508 (= lt!330746 (Found!7505 j!159))))

(declare-fun b!744509 () Bool)

(assert (=> b!744509 (= e!415887 e!415893)))

(declare-fun res!501495 () Bool)

(assert (=> b!744509 (=> (not res!501495) (not e!415893))))

(declare-fun lt!330748 () SeekEntryResult!7505)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744509 (= res!501495 (or (= lt!330748 (MissingZero!7505 i!1173)) (= lt!330748 (MissingVacant!7505 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!744509 (= lt!330748 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!744510 () Bool)

(declare-fun res!501484 () Bool)

(assert (=> b!744510 (=> (not res!501484) (not e!415887))))

(declare-fun arrayContainsKey!0 (array!41583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744510 (= res!501484 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744511 () Bool)

(declare-fun e!415894 () Bool)

(declare-fun e!415888 () Bool)

(assert (=> b!744511 (= e!415894 (not e!415888))))

(declare-fun res!501489 () Bool)

(assert (=> b!744511 (=> res!501489 e!415888)))

(declare-fun lt!330745 () SeekEntryResult!7505)

(assert (=> b!744511 (= res!501489 (or (not (is-Intermediate!7505 lt!330745)) (bvslt x!1131 (x!63351 lt!330745)) (not (= x!1131 (x!63351 lt!330745))) (not (= index!1321 (index!32390 lt!330745)))))))

(assert (=> b!744511 e!415891))

(declare-fun res!501483 () Bool)

(assert (=> b!744511 (=> (not res!501483) (not e!415891))))

(assert (=> b!744511 (= res!501483 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25490 0))(
  ( (Unit!25491) )
))
(declare-fun lt!330747 () Unit!25490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25490)

(assert (=> b!744511 (= lt!330747 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744512 () Bool)

(declare-fun e!415889 () Bool)

(assert (=> b!744512 (= e!415893 e!415889)))

(declare-fun res!501486 () Bool)

(assert (=> b!744512 (=> (not res!501486) (not e!415889))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744512 (= res!501486 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19905 a!3186) j!159) mask!3328) (select (arr!19905 a!3186) j!159) a!3186 mask!3328) lt!330742))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744512 (= lt!330742 (Intermediate!7505 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744513 () Bool)

(assert (=> b!744513 (= e!415889 e!415894)))

(declare-fun res!501487 () Bool)

(assert (=> b!744513 (=> (not res!501487) (not e!415894))))

(declare-fun lt!330749 () SeekEntryResult!7505)

(assert (=> b!744513 (= res!501487 (= lt!330749 lt!330745))))

(declare-fun lt!330744 () array!41583)

(declare-fun lt!330743 () (_ BitVec 64))

(assert (=> b!744513 (= lt!330745 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330743 lt!330744 mask!3328))))

(assert (=> b!744513 (= lt!330749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330743 mask!3328) lt!330743 lt!330744 mask!3328))))

(assert (=> b!744513 (= lt!330743 (select (store (arr!19905 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744513 (= lt!330744 (array!41584 (store (arr!19905 a!3186) i!1173 k!2102) (size!20326 a!3186)))))

(declare-fun b!744514 () Bool)

(declare-fun res!501485 () Bool)

(assert (=> b!744514 (=> (not res!501485) (not e!415889))))

(assert (=> b!744514 (= res!501485 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19905 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744515 () Bool)

(declare-fun res!501494 () Bool)

(assert (=> b!744515 (=> (not res!501494) (not e!415887))))

(assert (=> b!744515 (= res!501494 (validKeyInArray!0 k!2102))))

(declare-fun b!744516 () Bool)

(declare-fun res!501488 () Bool)

(assert (=> b!744516 (=> (not res!501488) (not e!415893))))

(declare-datatypes ((List!13907 0))(
  ( (Nil!13904) (Cons!13903 (h!14975 (_ BitVec 64)) (t!20222 List!13907)) )
))
(declare-fun arrayNoDuplicates!0 (array!41583 (_ BitVec 32) List!13907) Bool)

(assert (=> b!744516 (= res!501488 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13904))))

(declare-fun b!744517 () Bool)

(declare-fun res!501491 () Bool)

(assert (=> b!744517 (=> (not res!501491) (not e!415893))))

(assert (=> b!744517 (= res!501491 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20326 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20326 a!3186))))))

(declare-fun b!744518 () Bool)

(declare-fun res!501492 () Bool)

(assert (=> b!744518 (=> (not res!501492) (not e!415889))))

(assert (=> b!744518 (= res!501492 e!415890)))

(declare-fun c!81892 () Bool)

(assert (=> b!744518 (= c!81892 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744519 () Bool)

(declare-fun res!501490 () Bool)

(assert (=> b!744519 (=> res!501490 e!415888)))

(assert (=> b!744519 (= res!501490 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19905 a!3186) j!159) a!3186 mask!3328) (Found!7505 j!159))))))

(declare-fun b!744520 () Bool)

(assert (=> b!744520 (= e!415888 (or (= (select (store (arr!19905 a!3186) i!1173 k!2102) index!1321) lt!330743) (not (= (select (store (arr!19905 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!744521 () Bool)

(assert (=> b!744521 (= e!415892 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19905 a!3186) j!159) a!3186 mask!3328) lt!330746))))

(declare-fun b!744522 () Bool)

(declare-fun res!501497 () Bool)

(assert (=> b!744522 (=> (not res!501497) (not e!415887))))

(assert (=> b!744522 (= res!501497 (and (= (size!20326 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20326 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20326 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65410 res!501481) b!744522))

(assert (= (and b!744522 res!501497) b!744507))

(assert (= (and b!744507 res!501496) b!744515))

(assert (= (and b!744515 res!501494) b!744510))

(assert (= (and b!744510 res!501484) b!744509))

(assert (= (and b!744509 res!501495) b!744504))

(assert (= (and b!744504 res!501493) b!744516))

(assert (= (and b!744516 res!501488) b!744517))

(assert (= (and b!744517 res!501491) b!744512))

(assert (= (and b!744512 res!501486) b!744514))

(assert (= (and b!744514 res!501485) b!744518))

(assert (= (and b!744518 c!81892) b!744506))

(assert (= (and b!744518 (not c!81892)) b!744505))

(assert (= (and b!744518 res!501492) b!744513))

(assert (= (and b!744513 res!501487) b!744511))

(assert (= (and b!744511 res!501483) b!744508))

(assert (= (and b!744508 res!501482) b!744521))

(assert (= (and b!744511 (not res!501489)) b!744519))

(assert (= (and b!744519 (not res!501490)) b!744520))

(declare-fun m!695023 () Bool)

(assert (=> b!744506 m!695023))

(assert (=> b!744506 m!695023))

(declare-fun m!695025 () Bool)

(assert (=> b!744506 m!695025))

(declare-fun m!695027 () Bool)

(assert (=> start!65410 m!695027))

(declare-fun m!695029 () Bool)

(assert (=> start!65410 m!695029))

(declare-fun m!695031 () Bool)

(assert (=> b!744515 m!695031))

(declare-fun m!695033 () Bool)

(assert (=> b!744511 m!695033))

(declare-fun m!695035 () Bool)

(assert (=> b!744511 m!695035))

(declare-fun m!695037 () Bool)

(assert (=> b!744509 m!695037))

(declare-fun m!695039 () Bool)

(assert (=> b!744516 m!695039))

(declare-fun m!695041 () Bool)

(assert (=> b!744514 m!695041))

(assert (=> b!744508 m!695023))

(assert (=> b!744508 m!695023))

(declare-fun m!695043 () Bool)

(assert (=> b!744508 m!695043))

(declare-fun m!695045 () Bool)

(assert (=> b!744510 m!695045))

(declare-fun m!695047 () Bool)

(assert (=> b!744504 m!695047))

(assert (=> b!744512 m!695023))

(assert (=> b!744512 m!695023))

(declare-fun m!695049 () Bool)

(assert (=> b!744512 m!695049))

(assert (=> b!744512 m!695049))

(assert (=> b!744512 m!695023))

(declare-fun m!695051 () Bool)

(assert (=> b!744512 m!695051))

(declare-fun m!695053 () Bool)

(assert (=> b!744513 m!695053))

(declare-fun m!695055 () Bool)

(assert (=> b!744513 m!695055))

(declare-fun m!695057 () Bool)

(assert (=> b!744513 m!695057))

(declare-fun m!695059 () Bool)

(assert (=> b!744513 m!695059))

(assert (=> b!744513 m!695053))

(declare-fun m!695061 () Bool)

(assert (=> b!744513 m!695061))

(assert (=> b!744520 m!695055))

(declare-fun m!695063 () Bool)

(assert (=> b!744520 m!695063))

(assert (=> b!744505 m!695023))

(assert (=> b!744505 m!695023))

(declare-fun m!695065 () Bool)

(assert (=> b!744505 m!695065))

(assert (=> b!744519 m!695023))

(assert (=> b!744519 m!695023))

(assert (=> b!744519 m!695065))

(assert (=> b!744521 m!695023))

(assert (=> b!744521 m!695023))

(declare-fun m!695067 () Bool)

(assert (=> b!744521 m!695067))

(assert (=> b!744507 m!695023))

(assert (=> b!744507 m!695023))

(declare-fun m!695069 () Bool)

(assert (=> b!744507 m!695069))

(push 1)

