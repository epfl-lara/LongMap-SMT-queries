; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64726 () Bool)

(assert start!64726)

(declare-fun b!730360 () Bool)

(declare-fun e!408728 () Bool)

(declare-fun e!408726 () Bool)

(assert (=> b!730360 (= e!408728 (not e!408726))))

(declare-fun res!490671 () Bool)

(assert (=> b!730360 (=> res!490671 e!408726)))

(declare-datatypes ((SeekEntryResult!7307 0))(
  ( (MissingZero!7307 (index!31596 (_ BitVec 32))) (Found!7307 (index!31597 (_ BitVec 32))) (Intermediate!7307 (undefined!8119 Bool) (index!31598 (_ BitVec 32)) (x!62577 (_ BitVec 32))) (Undefined!7307) (MissingVacant!7307 (index!31599 (_ BitVec 32))) )
))
(declare-fun lt!323628 () SeekEntryResult!7307)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!730360 (= res!490671 (or (not (is-Intermediate!7307 lt!323628)) (bvsge x!1131 (x!62577 lt!323628))))))

(declare-fun e!408730 () Bool)

(assert (=> b!730360 e!408730))

(declare-fun res!490673 () Bool)

(assert (=> b!730360 (=> (not res!490673) (not e!408730))))

(declare-datatypes ((array!41175 0))(
  ( (array!41176 (arr!19707 (Array (_ BitVec 32) (_ BitVec 64))) (size!20128 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41175)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41175 (_ BitVec 32)) Bool)

(assert (=> b!730360 (= res!490673 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24932 0))(
  ( (Unit!24933) )
))
(declare-fun lt!323630 () Unit!24932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24932)

(assert (=> b!730360 (= lt!323630 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!408731 () Bool)

(declare-fun lt!323624 () SeekEntryResult!7307)

(declare-fun b!730361 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41175 (_ BitVec 32)) SeekEntryResult!7307)

(assert (=> b!730361 (= e!408731 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19707 a!3186) j!159) a!3186 mask!3328) lt!323624))))

(declare-fun b!730362 () Bool)

(assert (=> b!730362 (= e!408726 true)))

(declare-fun lt!323629 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730362 (= lt!323629 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730363 () Bool)

(declare-fun e!408723 () Bool)

(declare-fun e!408725 () Bool)

(assert (=> b!730363 (= e!408723 e!408725)))

(declare-fun res!490666 () Bool)

(assert (=> b!730363 (=> (not res!490666) (not e!408725))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730363 (= res!490666 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19707 a!3186) j!159) mask!3328) (select (arr!19707 a!3186) j!159) a!3186 mask!3328) lt!323624))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730363 (= lt!323624 (Intermediate!7307 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730364 () Bool)

(declare-fun res!490676 () Bool)

(assert (=> b!730364 (=> (not res!490676) (not e!408723))))

(assert (=> b!730364 (= res!490676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730365 () Bool)

(declare-fun e!408724 () Bool)

(assert (=> b!730365 (= e!408730 e!408724)))

(declare-fun res!490668 () Bool)

(assert (=> b!730365 (=> (not res!490668) (not e!408724))))

(declare-fun lt!323623 () SeekEntryResult!7307)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41175 (_ BitVec 32)) SeekEntryResult!7307)

(assert (=> b!730365 (= res!490668 (= (seekEntryOrOpen!0 (select (arr!19707 a!3186) j!159) a!3186 mask!3328) lt!323623))))

(assert (=> b!730365 (= lt!323623 (Found!7307 j!159))))

(declare-fun b!730366 () Bool)

(declare-fun res!490672 () Bool)

(assert (=> b!730366 (=> (not res!490672) (not e!408725))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730366 (= res!490672 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19707 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730367 () Bool)

(declare-fun res!490665 () Bool)

(assert (=> b!730367 (=> (not res!490665) (not e!408723))))

(declare-datatypes ((List!13709 0))(
  ( (Nil!13706) (Cons!13705 (h!14765 (_ BitVec 64)) (t!20024 List!13709)) )
))
(declare-fun arrayNoDuplicates!0 (array!41175 (_ BitVec 32) List!13709) Bool)

(assert (=> b!730367 (= res!490665 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13706))))

(declare-fun b!730368 () Bool)

(assert (=> b!730368 (= e!408725 e!408728)))

(declare-fun res!490670 () Bool)

(assert (=> b!730368 (=> (not res!490670) (not e!408728))))

(declare-fun lt!323626 () SeekEntryResult!7307)

(assert (=> b!730368 (= res!490670 (= lt!323626 lt!323628))))

(declare-fun lt!323627 () (_ BitVec 64))

(declare-fun lt!323622 () array!41175)

(assert (=> b!730368 (= lt!323628 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323627 lt!323622 mask!3328))))

(assert (=> b!730368 (= lt!323626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323627 mask!3328) lt!323627 lt!323622 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!730368 (= lt!323627 (select (store (arr!19707 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730368 (= lt!323622 (array!41176 (store (arr!19707 a!3186) i!1173 k!2102) (size!20128 a!3186)))))

(declare-fun b!730369 () Bool)

(declare-fun res!490661 () Bool)

(assert (=> b!730369 (=> (not res!490661) (not e!408725))))

(assert (=> b!730369 (= res!490661 e!408731)))

(declare-fun c!80224 () Bool)

(assert (=> b!730369 (= c!80224 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730370 () Bool)

(declare-fun res!490674 () Bool)

(assert (=> b!730370 (=> (not res!490674) (not e!408723))))

(assert (=> b!730370 (= res!490674 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20128 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20128 a!3186))))))

(declare-fun b!730371 () Bool)

(declare-fun e!408727 () Bool)

(assert (=> b!730371 (= e!408727 e!408723)))

(declare-fun res!490662 () Bool)

(assert (=> b!730371 (=> (not res!490662) (not e!408723))))

(declare-fun lt!323625 () SeekEntryResult!7307)

(assert (=> b!730371 (= res!490662 (or (= lt!323625 (MissingZero!7307 i!1173)) (= lt!323625 (MissingVacant!7307 i!1173))))))

(assert (=> b!730371 (= lt!323625 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730372 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41175 (_ BitVec 32)) SeekEntryResult!7307)

(assert (=> b!730372 (= e!408724 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19707 a!3186) j!159) a!3186 mask!3328) lt!323623))))

(declare-fun res!490663 () Bool)

(assert (=> start!64726 (=> (not res!490663) (not e!408727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64726 (= res!490663 (validMask!0 mask!3328))))

(assert (=> start!64726 e!408727))

(assert (=> start!64726 true))

(declare-fun array_inv!15503 (array!41175) Bool)

(assert (=> start!64726 (array_inv!15503 a!3186)))

(declare-fun b!730373 () Bool)

(declare-fun res!490669 () Bool)

(assert (=> b!730373 (=> (not res!490669) (not e!408727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730373 (= res!490669 (validKeyInArray!0 k!2102))))

(declare-fun b!730374 () Bool)

(declare-fun res!490675 () Bool)

(assert (=> b!730374 (=> (not res!490675) (not e!408727))))

(assert (=> b!730374 (= res!490675 (and (= (size!20128 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20128 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20128 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730375 () Bool)

(assert (=> b!730375 (= e!408731 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19707 a!3186) j!159) a!3186 mask!3328) (Found!7307 j!159)))))

(declare-fun b!730376 () Bool)

(declare-fun res!490664 () Bool)

(assert (=> b!730376 (=> (not res!490664) (not e!408727))))

(assert (=> b!730376 (= res!490664 (validKeyInArray!0 (select (arr!19707 a!3186) j!159)))))

(declare-fun b!730377 () Bool)

(declare-fun res!490667 () Bool)

(assert (=> b!730377 (=> (not res!490667) (not e!408727))))

(declare-fun arrayContainsKey!0 (array!41175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730377 (= res!490667 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64726 res!490663) b!730374))

(assert (= (and b!730374 res!490675) b!730376))

(assert (= (and b!730376 res!490664) b!730373))

(assert (= (and b!730373 res!490669) b!730377))

(assert (= (and b!730377 res!490667) b!730371))

(assert (= (and b!730371 res!490662) b!730364))

(assert (= (and b!730364 res!490676) b!730367))

(assert (= (and b!730367 res!490665) b!730370))

(assert (= (and b!730370 res!490674) b!730363))

(assert (= (and b!730363 res!490666) b!730366))

(assert (= (and b!730366 res!490672) b!730369))

(assert (= (and b!730369 c!80224) b!730361))

(assert (= (and b!730369 (not c!80224)) b!730375))

(assert (= (and b!730369 res!490661) b!730368))

(assert (= (and b!730368 res!490670) b!730360))

(assert (= (and b!730360 res!490673) b!730365))

(assert (= (and b!730365 res!490668) b!730372))

(assert (= (and b!730360 (not res!490671)) b!730362))

(declare-fun m!683899 () Bool)

(assert (=> b!730365 m!683899))

(assert (=> b!730365 m!683899))

(declare-fun m!683901 () Bool)

(assert (=> b!730365 m!683901))

(declare-fun m!683903 () Bool)

(assert (=> b!730364 m!683903))

(assert (=> b!730376 m!683899))

(assert (=> b!730376 m!683899))

(declare-fun m!683905 () Bool)

(assert (=> b!730376 m!683905))

(declare-fun m!683907 () Bool)

(assert (=> b!730366 m!683907))

(declare-fun m!683909 () Bool)

(assert (=> b!730373 m!683909))

(declare-fun m!683911 () Bool)

(assert (=> b!730360 m!683911))

(declare-fun m!683913 () Bool)

(assert (=> b!730360 m!683913))

(assert (=> b!730363 m!683899))

(assert (=> b!730363 m!683899))

(declare-fun m!683915 () Bool)

(assert (=> b!730363 m!683915))

(assert (=> b!730363 m!683915))

(assert (=> b!730363 m!683899))

(declare-fun m!683917 () Bool)

(assert (=> b!730363 m!683917))

(declare-fun m!683919 () Bool)

(assert (=> b!730368 m!683919))

(declare-fun m!683921 () Bool)

(assert (=> b!730368 m!683921))

(declare-fun m!683923 () Bool)

(assert (=> b!730368 m!683923))

(assert (=> b!730368 m!683919))

(declare-fun m!683925 () Bool)

(assert (=> b!730368 m!683925))

(declare-fun m!683927 () Bool)

(assert (=> b!730368 m!683927))

(assert (=> b!730372 m!683899))

(assert (=> b!730372 m!683899))

(declare-fun m!683929 () Bool)

(assert (=> b!730372 m!683929))

(declare-fun m!683931 () Bool)

(assert (=> b!730377 m!683931))

(declare-fun m!683933 () Bool)

(assert (=> b!730367 m!683933))

(declare-fun m!683935 () Bool)

(assert (=> start!64726 m!683935))

(declare-fun m!683937 () Bool)

(assert (=> start!64726 m!683937))

(declare-fun m!683939 () Bool)

(assert (=> b!730362 m!683939))

(assert (=> b!730361 m!683899))

(assert (=> b!730361 m!683899))

(declare-fun m!683941 () Bool)

(assert (=> b!730361 m!683941))

(assert (=> b!730375 m!683899))

(assert (=> b!730375 m!683899))

(declare-fun m!683943 () Bool)

(assert (=> b!730375 m!683943))

(declare-fun m!683945 () Bool)

(assert (=> b!730371 m!683945))

(push 1)

