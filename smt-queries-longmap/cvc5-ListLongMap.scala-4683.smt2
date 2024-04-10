; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65158 () Bool)

(assert start!65158)

(declare-fun b!736468 () Bool)

(declare-fun e!411989 () Bool)

(assert (=> b!736468 (= e!411989 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!326622 () (_ BitVec 64))

(declare-datatypes ((array!41331 0))(
  ( (array!41332 (arr!19779 (Array (_ BitVec 32) (_ BitVec 64))) (size!20200 (_ BitVec 32))) )
))
(declare-fun lt!326618 () array!41331)

(declare-datatypes ((SeekEntryResult!7379 0))(
  ( (MissingZero!7379 (index!31884 (_ BitVec 32))) (Found!7379 (index!31885 (_ BitVec 32))) (Intermediate!7379 (undefined!8191 Bool) (index!31886 (_ BitVec 32)) (x!62889 (_ BitVec 32))) (Undefined!7379) (MissingVacant!7379 (index!31887 (_ BitVec 32))) )
))
(declare-fun lt!326626 () SeekEntryResult!7379)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!326614 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41331 (_ BitVec 32)) SeekEntryResult!7379)

(assert (=> b!736468 (= lt!326626 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326614 lt!326622 lt!326618 mask!3328))))

(declare-fun lt!326615 () SeekEntryResult!7379)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun a!3186 () array!41331)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!736469 () Bool)

(declare-fun e!411991 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41331 (_ BitVec 32)) SeekEntryResult!7379)

(assert (=> b!736469 (= e!411991 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19779 a!3186) j!159) a!3186 mask!3328) lt!326615))))

(declare-fun b!736470 () Bool)

(declare-fun e!411998 () Bool)

(declare-fun e!411987 () Bool)

(assert (=> b!736470 (= e!411998 e!411987)))

(declare-fun res!494954 () Bool)

(assert (=> b!736470 (=> (not res!494954) (not e!411987))))

(declare-fun lt!326616 () SeekEntryResult!7379)

(declare-fun lt!326627 () SeekEntryResult!7379)

(assert (=> b!736470 (= res!494954 (= lt!326616 lt!326627))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!736470 (= lt!326627 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326622 lt!326618 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736470 (= lt!326616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326622 mask!3328) lt!326622 lt!326618 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!736470 (= lt!326622 (select (store (arr!19779 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!736470 (= lt!326618 (array!41332 (store (arr!19779 a!3186) i!1173 k!2102) (size!20200 a!3186)))))

(declare-fun b!736471 () Bool)

(declare-fun e!411992 () Bool)

(assert (=> b!736471 (= e!411992 e!411991)))

(declare-fun res!494952 () Bool)

(assert (=> b!736471 (=> (not res!494952) (not e!411991))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41331 (_ BitVec 32)) SeekEntryResult!7379)

(assert (=> b!736471 (= res!494952 (= (seekEntryOrOpen!0 (select (arr!19779 a!3186) j!159) a!3186 mask!3328) lt!326615))))

(assert (=> b!736471 (= lt!326615 (Found!7379 j!159))))

(declare-fun b!736472 () Bool)

(declare-fun res!494966 () Bool)

(declare-fun e!411990 () Bool)

(assert (=> b!736472 (=> (not res!494966) (not e!411990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736472 (= res!494966 (validKeyInArray!0 (select (arr!19779 a!3186) j!159)))))

(declare-fun b!736474 () Bool)

(declare-fun res!494949 () Bool)

(assert (=> b!736474 (=> (not res!494949) (not e!411998))))

(declare-fun e!411993 () Bool)

(assert (=> b!736474 (= res!494949 e!411993)))

(declare-fun c!81140 () Bool)

(assert (=> b!736474 (= c!81140 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!411996 () Bool)

(declare-fun lt!326620 () SeekEntryResult!7379)

(declare-fun b!736475 () Bool)

(assert (=> b!736475 (= e!411996 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326614 resIntermediateIndex!5 (select (arr!19779 a!3186) j!159) a!3186 mask!3328) lt!326620)))))

(declare-fun b!736476 () Bool)

(declare-fun res!494955 () Bool)

(assert (=> b!736476 (=> res!494955 e!411989)))

(assert (=> b!736476 (= res!494955 e!411996)))

(declare-fun c!81142 () Bool)

(declare-fun lt!326621 () Bool)

(assert (=> b!736476 (= c!81142 lt!326621)))

(declare-fun b!736477 () Bool)

(assert (=> b!736477 (= e!411993 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19779 a!3186) j!159) a!3186 mask!3328) (Found!7379 j!159)))))

(declare-fun b!736478 () Bool)

(declare-fun e!411994 () Bool)

(assert (=> b!736478 (= e!411994 e!411998)))

(declare-fun res!494962 () Bool)

(assert (=> b!736478 (=> (not res!494962) (not e!411998))))

(declare-fun lt!326619 () SeekEntryResult!7379)

(assert (=> b!736478 (= res!494962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19779 a!3186) j!159) mask!3328) (select (arr!19779 a!3186) j!159) a!3186 mask!3328) lt!326619))))

(assert (=> b!736478 (= lt!326619 (Intermediate!7379 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736479 () Bool)

(declare-fun res!494960 () Bool)

(assert (=> b!736479 (=> (not res!494960) (not e!411998))))

(assert (=> b!736479 (= res!494960 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19779 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736480 () Bool)

(declare-datatypes ((Unit!25112 0))(
  ( (Unit!25113) )
))
(declare-fun e!411988 () Unit!25112)

(declare-fun Unit!25114 () Unit!25112)

(assert (=> b!736480 (= e!411988 Unit!25114)))

(declare-fun lt!326625 () SeekEntryResult!7379)

(assert (=> b!736480 (= lt!326625 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19779 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736480 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326614 resIntermediateIndex!5 (select (arr!19779 a!3186) j!159) a!3186 mask!3328) lt!326620)))

(declare-fun b!736481 () Bool)

(declare-fun res!494957 () Bool)

(assert (=> b!736481 (=> (not res!494957) (not e!411990))))

(assert (=> b!736481 (= res!494957 (validKeyInArray!0 k!2102))))

(declare-fun b!736482 () Bool)

(declare-fun e!411997 () Bool)

(assert (=> b!736482 (= e!411987 (not e!411997))))

(declare-fun res!494953 () Bool)

(assert (=> b!736482 (=> res!494953 e!411997)))

(assert (=> b!736482 (= res!494953 (or (not (is-Intermediate!7379 lt!326627)) (bvsge x!1131 (x!62889 lt!326627))))))

(assert (=> b!736482 (= lt!326620 (Found!7379 j!159))))

(assert (=> b!736482 e!411992))

(declare-fun res!494951 () Bool)

(assert (=> b!736482 (=> (not res!494951) (not e!411992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41331 (_ BitVec 32)) Bool)

(assert (=> b!736482 (= res!494951 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326623 () Unit!25112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25112)

(assert (=> b!736482 (= lt!326623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736483 () Bool)

(declare-fun res!494958 () Bool)

(assert (=> b!736483 (=> (not res!494958) (not e!411994))))

(assert (=> b!736483 (= res!494958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736484 () Bool)

(assert (=> b!736484 (= e!411997 e!411989)))

(declare-fun res!494959 () Bool)

(assert (=> b!736484 (=> res!494959 e!411989)))

(assert (=> b!736484 (= res!494959 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326614 #b00000000000000000000000000000000) (bvsge lt!326614 (size!20200 a!3186))))))

(declare-fun lt!326617 () Unit!25112)

(assert (=> b!736484 (= lt!326617 e!411988)))

(declare-fun c!81141 () Bool)

(assert (=> b!736484 (= c!81141 lt!326621)))

(assert (=> b!736484 (= lt!326621 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736484 (= lt!326614 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736485 () Bool)

(declare-fun res!494963 () Bool)

(assert (=> b!736485 (=> (not res!494963) (not e!411994))))

(declare-datatypes ((List!13781 0))(
  ( (Nil!13778) (Cons!13777 (h!14849 (_ BitVec 64)) (t!20096 List!13781)) )
))
(declare-fun arrayNoDuplicates!0 (array!41331 (_ BitVec 32) List!13781) Bool)

(assert (=> b!736485 (= res!494963 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13778))))

(declare-fun b!736473 () Bool)

(declare-fun res!494965 () Bool)

(assert (=> b!736473 (=> (not res!494965) (not e!411990))))

(declare-fun arrayContainsKey!0 (array!41331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736473 (= res!494965 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!494961 () Bool)

(assert (=> start!65158 (=> (not res!494961) (not e!411990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65158 (= res!494961 (validMask!0 mask!3328))))

(assert (=> start!65158 e!411990))

(assert (=> start!65158 true))

(declare-fun array_inv!15575 (array!41331) Bool)

(assert (=> start!65158 (array_inv!15575 a!3186)))

(declare-fun b!736486 () Bool)

(assert (=> b!736486 (= e!411990 e!411994)))

(declare-fun res!494956 () Bool)

(assert (=> b!736486 (=> (not res!494956) (not e!411994))))

(declare-fun lt!326624 () SeekEntryResult!7379)

(assert (=> b!736486 (= res!494956 (or (= lt!326624 (MissingZero!7379 i!1173)) (= lt!326624 (MissingVacant!7379 i!1173))))))

(assert (=> b!736486 (= lt!326624 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!736487 () Bool)

(assert (=> b!736487 (= e!411993 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19779 a!3186) j!159) a!3186 mask!3328) lt!326619))))

(declare-fun b!736488 () Bool)

(declare-fun res!494950 () Bool)

(assert (=> b!736488 (=> (not res!494950) (not e!411994))))

(assert (=> b!736488 (= res!494950 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20200 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20200 a!3186))))))

(declare-fun b!736489 () Bool)

(declare-fun Unit!25115 () Unit!25112)

(assert (=> b!736489 (= e!411988 Unit!25115)))

(assert (=> b!736489 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326614 (select (arr!19779 a!3186) j!159) a!3186 mask!3328) lt!326619)))

(declare-fun b!736490 () Bool)

(assert (=> b!736490 (= e!411996 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326614 (select (arr!19779 a!3186) j!159) a!3186 mask!3328) lt!326619)))))

(declare-fun b!736491 () Bool)

(declare-fun res!494964 () Bool)

(assert (=> b!736491 (=> (not res!494964) (not e!411990))))

(assert (=> b!736491 (= res!494964 (and (= (size!20200 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20200 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20200 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65158 res!494961) b!736491))

(assert (= (and b!736491 res!494964) b!736472))

(assert (= (and b!736472 res!494966) b!736481))

(assert (= (and b!736481 res!494957) b!736473))

(assert (= (and b!736473 res!494965) b!736486))

(assert (= (and b!736486 res!494956) b!736483))

(assert (= (and b!736483 res!494958) b!736485))

(assert (= (and b!736485 res!494963) b!736488))

(assert (= (and b!736488 res!494950) b!736478))

(assert (= (and b!736478 res!494962) b!736479))

(assert (= (and b!736479 res!494960) b!736474))

(assert (= (and b!736474 c!81140) b!736487))

(assert (= (and b!736474 (not c!81140)) b!736477))

(assert (= (and b!736474 res!494949) b!736470))

(assert (= (and b!736470 res!494954) b!736482))

(assert (= (and b!736482 res!494951) b!736471))

(assert (= (and b!736471 res!494952) b!736469))

(assert (= (and b!736482 (not res!494953)) b!736484))

(assert (= (and b!736484 c!81141) b!736489))

(assert (= (and b!736484 (not c!81141)) b!736480))

(assert (= (and b!736484 (not res!494959)) b!736476))

(assert (= (and b!736476 c!81142) b!736490))

(assert (= (and b!736476 (not c!81142)) b!736475))

(assert (= (and b!736476 (not res!494955)) b!736468))

(declare-fun m!688591 () Bool)

(assert (=> b!736478 m!688591))

(assert (=> b!736478 m!688591))

(declare-fun m!688593 () Bool)

(assert (=> b!736478 m!688593))

(assert (=> b!736478 m!688593))

(assert (=> b!736478 m!688591))

(declare-fun m!688595 () Bool)

(assert (=> b!736478 m!688595))

(declare-fun m!688597 () Bool)

(assert (=> b!736483 m!688597))

(declare-fun m!688599 () Bool)

(assert (=> b!736479 m!688599))

(declare-fun m!688601 () Bool)

(assert (=> start!65158 m!688601))

(declare-fun m!688603 () Bool)

(assert (=> start!65158 m!688603))

(declare-fun m!688605 () Bool)

(assert (=> b!736473 m!688605))

(declare-fun m!688607 () Bool)

(assert (=> b!736481 m!688607))

(assert (=> b!736489 m!688591))

(assert (=> b!736489 m!688591))

(declare-fun m!688609 () Bool)

(assert (=> b!736489 m!688609))

(declare-fun m!688611 () Bool)

(assert (=> b!736468 m!688611))

(assert (=> b!736475 m!688591))

(assert (=> b!736475 m!688591))

(declare-fun m!688613 () Bool)

(assert (=> b!736475 m!688613))

(declare-fun m!688615 () Bool)

(assert (=> b!736485 m!688615))

(declare-fun m!688617 () Bool)

(assert (=> b!736470 m!688617))

(declare-fun m!688619 () Bool)

(assert (=> b!736470 m!688619))

(declare-fun m!688621 () Bool)

(assert (=> b!736470 m!688621))

(declare-fun m!688623 () Bool)

(assert (=> b!736470 m!688623))

(declare-fun m!688625 () Bool)

(assert (=> b!736470 m!688625))

(assert (=> b!736470 m!688621))

(declare-fun m!688627 () Bool)

(assert (=> b!736486 m!688627))

(assert (=> b!736490 m!688591))

(assert (=> b!736490 m!688591))

(assert (=> b!736490 m!688609))

(assert (=> b!736480 m!688591))

(assert (=> b!736480 m!688591))

(declare-fun m!688629 () Bool)

(assert (=> b!736480 m!688629))

(assert (=> b!736480 m!688591))

(assert (=> b!736480 m!688613))

(declare-fun m!688631 () Bool)

(assert (=> b!736482 m!688631))

(declare-fun m!688633 () Bool)

(assert (=> b!736482 m!688633))

(assert (=> b!736477 m!688591))

(assert (=> b!736477 m!688591))

(assert (=> b!736477 m!688629))

(assert (=> b!736471 m!688591))

(assert (=> b!736471 m!688591))

(declare-fun m!688635 () Bool)

(assert (=> b!736471 m!688635))

(declare-fun m!688637 () Bool)

(assert (=> b!736484 m!688637))

(assert (=> b!736469 m!688591))

(assert (=> b!736469 m!688591))

(declare-fun m!688639 () Bool)

(assert (=> b!736469 m!688639))

(assert (=> b!736487 m!688591))

(assert (=> b!736487 m!688591))

(declare-fun m!688641 () Bool)

(assert (=> b!736487 m!688641))

(assert (=> b!736472 m!688591))

(assert (=> b!736472 m!688591))

(declare-fun m!688643 () Bool)

(assert (=> b!736472 m!688643))

(push 1)

