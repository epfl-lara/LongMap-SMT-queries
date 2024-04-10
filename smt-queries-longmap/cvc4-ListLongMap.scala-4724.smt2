; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65408 () Bool)

(assert start!65408)

(declare-fun b!744448 () Bool)

(declare-fun res!501441 () Bool)

(declare-fun e!415868 () Bool)

(assert (=> b!744448 (=> (not res!501441) (not e!415868))))

(declare-datatypes ((array!41581 0))(
  ( (array!41582 (arr!19904 (Array (_ BitVec 32) (_ BitVec 64))) (size!20325 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41581)

(declare-datatypes ((List!13906 0))(
  ( (Nil!13903) (Cons!13902 (h!14974 (_ BitVec 64)) (t!20221 List!13906)) )
))
(declare-fun arrayNoDuplicates!0 (array!41581 (_ BitVec 32) List!13906) Bool)

(assert (=> b!744448 (= res!501441 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13903))))

(declare-fun b!744449 () Bool)

(declare-fun res!501446 () Bool)

(declare-fun e!415866 () Bool)

(assert (=> b!744449 (=> (not res!501446) (not e!415866))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744449 (= res!501446 (validKeyInArray!0 (select (arr!19904 a!3186) j!159)))))

(declare-fun b!744450 () Bool)

(assert (=> b!744450 (= e!415866 e!415868)))

(declare-fun res!501443 () Bool)

(assert (=> b!744450 (=> (not res!501443) (not e!415868))))

(declare-datatypes ((SeekEntryResult!7504 0))(
  ( (MissingZero!7504 (index!32384 (_ BitVec 32))) (Found!7504 (index!32385 (_ BitVec 32))) (Intermediate!7504 (undefined!8316 Bool) (index!32386 (_ BitVec 32)) (x!63342 (_ BitVec 32))) (Undefined!7504) (MissingVacant!7504 (index!32387 (_ BitVec 32))) )
))
(declare-fun lt!330718 () SeekEntryResult!7504)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744450 (= res!501443 (or (= lt!330718 (MissingZero!7504 i!1173)) (= lt!330718 (MissingVacant!7504 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41581 (_ BitVec 32)) SeekEntryResult!7504)

(assert (=> b!744450 (= lt!330718 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!744451 () Bool)

(declare-fun res!501439 () Bool)

(assert (=> b!744451 (=> (not res!501439) (not e!415868))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744451 (= res!501439 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20325 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20325 a!3186))))))

(declare-fun b!744452 () Bool)

(declare-fun res!501438 () Bool)

(assert (=> b!744452 (=> (not res!501438) (not e!415866))))

(assert (=> b!744452 (= res!501438 (and (= (size!20325 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20325 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20325 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744453 () Bool)

(declare-fun e!415861 () Bool)

(declare-fun e!415864 () Bool)

(assert (=> b!744453 (= e!415861 e!415864)))

(declare-fun res!501440 () Bool)

(assert (=> b!744453 (=> (not res!501440) (not e!415864))))

(declare-fun lt!330723 () SeekEntryResult!7504)

(assert (=> b!744453 (= res!501440 (= (seekEntryOrOpen!0 (select (arr!19904 a!3186) j!159) a!3186 mask!3328) lt!330723))))

(assert (=> b!744453 (= lt!330723 (Found!7504 j!159))))

(declare-fun res!501442 () Bool)

(assert (=> start!65408 (=> (not res!501442) (not e!415866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65408 (= res!501442 (validMask!0 mask!3328))))

(assert (=> start!65408 e!415866))

(assert (=> start!65408 true))

(declare-fun array_inv!15700 (array!41581) Bool)

(assert (=> start!65408 (array_inv!15700 a!3186)))

(declare-fun b!744454 () Bool)

(declare-fun res!501431 () Bool)

(declare-fun e!415862 () Bool)

(assert (=> b!744454 (=> (not res!501431) (not e!415862))))

(declare-fun e!415867 () Bool)

(assert (=> b!744454 (= res!501431 e!415867)))

(declare-fun c!81889 () Bool)

(assert (=> b!744454 (= c!81889 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744455 () Bool)

(declare-fun res!501434 () Bool)

(assert (=> b!744455 (=> (not res!501434) (not e!415866))))

(assert (=> b!744455 (= res!501434 (validKeyInArray!0 k!2102))))

(declare-fun b!744456 () Bool)

(assert (=> b!744456 (= e!415868 e!415862)))

(declare-fun res!501437 () Bool)

(assert (=> b!744456 (=> (not res!501437) (not e!415862))))

(declare-fun lt!330725 () SeekEntryResult!7504)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41581 (_ BitVec 32)) SeekEntryResult!7504)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744456 (= res!501437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19904 a!3186) j!159) mask!3328) (select (arr!19904 a!3186) j!159) a!3186 mask!3328) lt!330725))))

(assert (=> b!744456 (= lt!330725 (Intermediate!7504 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744457 () Bool)

(declare-fun res!501433 () Bool)

(assert (=> b!744457 (=> (not res!501433) (not e!415868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41581 (_ BitVec 32)) Bool)

(assert (=> b!744457 (= res!501433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744458 () Bool)

(declare-fun res!501432 () Bool)

(assert (=> b!744458 (=> (not res!501432) (not e!415866))))

(declare-fun arrayContainsKey!0 (array!41581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744458 (= res!501432 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744459 () Bool)

(declare-fun e!415860 () Bool)

(assert (=> b!744459 (= e!415862 e!415860)))

(declare-fun res!501445 () Bool)

(assert (=> b!744459 (=> (not res!501445) (not e!415860))))

(declare-fun lt!330717 () SeekEntryResult!7504)

(declare-fun lt!330720 () SeekEntryResult!7504)

(assert (=> b!744459 (= res!501445 (= lt!330717 lt!330720))))

(declare-fun lt!330724 () (_ BitVec 64))

(declare-fun lt!330721 () array!41581)

(assert (=> b!744459 (= lt!330720 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330724 lt!330721 mask!3328))))

(assert (=> b!744459 (= lt!330717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330724 mask!3328) lt!330724 lt!330721 mask!3328))))

(assert (=> b!744459 (= lt!330724 (select (store (arr!19904 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744459 (= lt!330721 (array!41582 (store (arr!19904 a!3186) i!1173 k!2102) (size!20325 a!3186)))))

(declare-fun b!744460 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41581 (_ BitVec 32)) SeekEntryResult!7504)

(assert (=> b!744460 (= e!415867 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19904 a!3186) j!159) a!3186 mask!3328) (Found!7504 j!159)))))

(declare-fun b!744461 () Bool)

(declare-fun e!415865 () Bool)

(assert (=> b!744461 (= e!415860 (not e!415865))))

(declare-fun res!501435 () Bool)

(assert (=> b!744461 (=> res!501435 e!415865)))

(assert (=> b!744461 (= res!501435 (or (not (is-Intermediate!7504 lt!330720)) (bvslt x!1131 (x!63342 lt!330720)) (not (= x!1131 (x!63342 lt!330720))) (not (= index!1321 (index!32386 lt!330720)))))))

(assert (=> b!744461 e!415861))

(declare-fun res!501444 () Bool)

(assert (=> b!744461 (=> (not res!501444) (not e!415861))))

(assert (=> b!744461 (= res!501444 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25488 0))(
  ( (Unit!25489) )
))
(declare-fun lt!330722 () Unit!25488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25488)

(assert (=> b!744461 (= lt!330722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744462 () Bool)

(assert (=> b!744462 (= e!415865 true)))

(declare-fun lt!330719 () SeekEntryResult!7504)

(assert (=> b!744462 (= lt!330719 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19904 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744463 () Bool)

(assert (=> b!744463 (= e!415864 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19904 a!3186) j!159) a!3186 mask!3328) lt!330723))))

(declare-fun b!744464 () Bool)

(assert (=> b!744464 (= e!415867 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19904 a!3186) j!159) a!3186 mask!3328) lt!330725))))

(declare-fun b!744465 () Bool)

(declare-fun res!501436 () Bool)

(assert (=> b!744465 (=> (not res!501436) (not e!415862))))

(assert (=> b!744465 (= res!501436 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19904 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65408 res!501442) b!744452))

(assert (= (and b!744452 res!501438) b!744449))

(assert (= (and b!744449 res!501446) b!744455))

(assert (= (and b!744455 res!501434) b!744458))

(assert (= (and b!744458 res!501432) b!744450))

(assert (= (and b!744450 res!501443) b!744457))

(assert (= (and b!744457 res!501433) b!744448))

(assert (= (and b!744448 res!501441) b!744451))

(assert (= (and b!744451 res!501439) b!744456))

(assert (= (and b!744456 res!501437) b!744465))

(assert (= (and b!744465 res!501436) b!744454))

(assert (= (and b!744454 c!81889) b!744464))

(assert (= (and b!744454 (not c!81889)) b!744460))

(assert (= (and b!744454 res!501431) b!744459))

(assert (= (and b!744459 res!501445) b!744461))

(assert (= (and b!744461 res!501444) b!744453))

(assert (= (and b!744453 res!501440) b!744463))

(assert (= (and b!744461 (not res!501435)) b!744462))

(declare-fun m!694977 () Bool)

(assert (=> b!744465 m!694977))

(declare-fun m!694979 () Bool)

(assert (=> start!65408 m!694979))

(declare-fun m!694981 () Bool)

(assert (=> start!65408 m!694981))

(declare-fun m!694983 () Bool)

(assert (=> b!744459 m!694983))

(assert (=> b!744459 m!694983))

(declare-fun m!694985 () Bool)

(assert (=> b!744459 m!694985))

(declare-fun m!694987 () Bool)

(assert (=> b!744459 m!694987))

(declare-fun m!694989 () Bool)

(assert (=> b!744459 m!694989))

(declare-fun m!694991 () Bool)

(assert (=> b!744459 m!694991))

(declare-fun m!694993 () Bool)

(assert (=> b!744456 m!694993))

(assert (=> b!744456 m!694993))

(declare-fun m!694995 () Bool)

(assert (=> b!744456 m!694995))

(assert (=> b!744456 m!694995))

(assert (=> b!744456 m!694993))

(declare-fun m!694997 () Bool)

(assert (=> b!744456 m!694997))

(assert (=> b!744449 m!694993))

(assert (=> b!744449 m!694993))

(declare-fun m!694999 () Bool)

(assert (=> b!744449 m!694999))

(assert (=> b!744464 m!694993))

(assert (=> b!744464 m!694993))

(declare-fun m!695001 () Bool)

(assert (=> b!744464 m!695001))

(declare-fun m!695003 () Bool)

(assert (=> b!744458 m!695003))

(declare-fun m!695005 () Bool)

(assert (=> b!744461 m!695005))

(declare-fun m!695007 () Bool)

(assert (=> b!744461 m!695007))

(declare-fun m!695009 () Bool)

(assert (=> b!744450 m!695009))

(assert (=> b!744463 m!694993))

(assert (=> b!744463 m!694993))

(declare-fun m!695011 () Bool)

(assert (=> b!744463 m!695011))

(declare-fun m!695013 () Bool)

(assert (=> b!744448 m!695013))

(assert (=> b!744462 m!694993))

(assert (=> b!744462 m!694993))

(declare-fun m!695015 () Bool)

(assert (=> b!744462 m!695015))

(assert (=> b!744460 m!694993))

(assert (=> b!744460 m!694993))

(assert (=> b!744460 m!695015))

(declare-fun m!695017 () Bool)

(assert (=> b!744457 m!695017))

(assert (=> b!744453 m!694993))

(assert (=> b!744453 m!694993))

(declare-fun m!695019 () Bool)

(assert (=> b!744453 m!695019))

(declare-fun m!695021 () Bool)

(assert (=> b!744455 m!695021))

(push 1)

