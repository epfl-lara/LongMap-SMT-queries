; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65468 () Bool)

(assert start!65468)

(declare-fun b!746095 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41641 0))(
  ( (array!41642 (arr!19934 (Array (_ BitVec 32) (_ BitVec 64))) (size!20355 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41641)

(declare-fun e!416674 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7534 0))(
  ( (MissingZero!7534 (index!32504 (_ BitVec 32))) (Found!7534 (index!32505 (_ BitVec 32))) (Intermediate!7534 (undefined!8346 Bool) (index!32506 (_ BitVec 32)) (x!63452 (_ BitVec 32))) (Undefined!7534) (MissingVacant!7534 (index!32507 (_ BitVec 32))) )
))
(declare-fun lt!331533 () SeekEntryResult!7534)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41641 (_ BitVec 32)) SeekEntryResult!7534)

(assert (=> b!746095 (= e!416674 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19934 a!3186) j!159) a!3186 mask!3328) lt!331533))))

(declare-fun b!746096 () Bool)

(declare-fun res!502910 () Bool)

(declare-fun e!416670 () Bool)

(assert (=> b!746096 (=> (not res!502910) (not e!416670))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746096 (= res!502910 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746097 () Bool)

(declare-fun e!416677 () Bool)

(declare-fun e!416672 () Bool)

(assert (=> b!746097 (= e!416677 (not e!416672))))

(declare-fun res!502902 () Bool)

(assert (=> b!746097 (=> res!502902 e!416672)))

(declare-fun lt!331528 () SeekEntryResult!7534)

(assert (=> b!746097 (= res!502902 (or (not (is-Intermediate!7534 lt!331528)) (bvslt x!1131 (x!63452 lt!331528)) (not (= x!1131 (x!63452 lt!331528))) (not (= index!1321 (index!32506 lt!331528)))))))

(declare-fun e!416676 () Bool)

(assert (=> b!746097 e!416676))

(declare-fun res!502907 () Bool)

(assert (=> b!746097 (=> (not res!502907) (not e!416676))))

(declare-fun lt!331529 () SeekEntryResult!7534)

(declare-fun lt!331535 () SeekEntryResult!7534)

(assert (=> b!746097 (= res!502907 (= lt!331529 lt!331535))))

(assert (=> b!746097 (= lt!331535 (Found!7534 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41641 (_ BitVec 32)) SeekEntryResult!7534)

(assert (=> b!746097 (= lt!331529 (seekEntryOrOpen!0 (select (arr!19934 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41641 (_ BitVec 32)) Bool)

(assert (=> b!746097 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25548 0))(
  ( (Unit!25549) )
))
(declare-fun lt!331526 () Unit!25548)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25548)

(assert (=> b!746097 (= lt!331526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!746098 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41641 (_ BitVec 32)) SeekEntryResult!7534)

(assert (=> b!746098 (= e!416674 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19934 a!3186) j!159) a!3186 mask!3328) (Found!7534 j!159)))))

(declare-fun b!746099 () Bool)

(declare-fun res!502908 () Bool)

(declare-fun e!416671 () Bool)

(assert (=> b!746099 (=> (not res!502908) (not e!416671))))

(declare-datatypes ((List!13936 0))(
  ( (Nil!13933) (Cons!13932 (h!15004 (_ BitVec 64)) (t!20251 List!13936)) )
))
(declare-fun arrayNoDuplicates!0 (array!41641 (_ BitVec 32) List!13936) Bool)

(assert (=> b!746099 (= res!502908 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13933))))

(declare-fun b!746100 () Bool)

(declare-fun res!502899 () Bool)

(assert (=> b!746100 (=> (not res!502899) (not e!416671))))

(assert (=> b!746100 (= res!502899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746101 () Bool)

(declare-fun res!502904 () Bool)

(assert (=> b!746101 (=> (not res!502904) (not e!416670))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746101 (= res!502904 (and (= (size!20355 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20355 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20355 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746102 () Bool)

(declare-fun e!416678 () Bool)

(assert (=> b!746102 (= e!416678 true)))

(declare-fun lt!331527 () SeekEntryResult!7534)

(assert (=> b!746102 (= lt!331529 lt!331527)))

(declare-fun b!746103 () Bool)

(declare-fun e!416673 () Bool)

(assert (=> b!746103 (= e!416673 e!416677)))

(declare-fun res!502911 () Bool)

(assert (=> b!746103 (=> (not res!502911) (not e!416677))))

(declare-fun lt!331531 () SeekEntryResult!7534)

(assert (=> b!746103 (= res!502911 (= lt!331531 lt!331528))))

(declare-fun lt!331534 () (_ BitVec 64))

(declare-fun lt!331530 () array!41641)

(assert (=> b!746103 (= lt!331528 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331534 lt!331530 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746103 (= lt!331531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331534 mask!3328) lt!331534 lt!331530 mask!3328))))

(assert (=> b!746103 (= lt!331534 (select (store (arr!19934 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746103 (= lt!331530 (array!41642 (store (arr!19934 a!3186) i!1173 k!2102) (size!20355 a!3186)))))

(declare-fun b!746105 () Bool)

(assert (=> b!746105 (= e!416672 e!416678)))

(declare-fun res!502913 () Bool)

(assert (=> b!746105 (=> res!502913 e!416678)))

(assert (=> b!746105 (= res!502913 (or (not (= lt!331527 lt!331535)) (= (select (store (arr!19934 a!3186) i!1173 k!2102) index!1321) lt!331534) (not (= (select (store (arr!19934 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746105 (= lt!331527 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19934 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746106 () Bool)

(declare-fun res!502905 () Bool)

(assert (=> b!746106 (=> (not res!502905) (not e!416670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746106 (= res!502905 (validKeyInArray!0 k!2102))))

(declare-fun b!746107 () Bool)

(declare-fun res!502903 () Bool)

(assert (=> b!746107 (=> (not res!502903) (not e!416673))))

(assert (=> b!746107 (= res!502903 e!416674)))

(declare-fun c!81979 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746107 (= c!81979 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746108 () Bool)

(declare-fun res!502909 () Bool)

(assert (=> b!746108 (=> (not res!502909) (not e!416671))))

(assert (=> b!746108 (= res!502909 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20355 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20355 a!3186))))))

(declare-fun b!746109 () Bool)

(assert (=> b!746109 (= e!416676 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19934 a!3186) j!159) a!3186 mask!3328) lt!331535))))

(declare-fun b!746110 () Bool)

(declare-fun res!502901 () Bool)

(assert (=> b!746110 (=> (not res!502901) (not e!416670))))

(assert (=> b!746110 (= res!502901 (validKeyInArray!0 (select (arr!19934 a!3186) j!159)))))

(declare-fun b!746111 () Bool)

(declare-fun res!502900 () Bool)

(assert (=> b!746111 (=> (not res!502900) (not e!416673))))

(assert (=> b!746111 (= res!502900 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19934 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746112 () Bool)

(assert (=> b!746112 (= e!416671 e!416673)))

(declare-fun res!502898 () Bool)

(assert (=> b!746112 (=> (not res!502898) (not e!416673))))

(assert (=> b!746112 (= res!502898 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19934 a!3186) j!159) mask!3328) (select (arr!19934 a!3186) j!159) a!3186 mask!3328) lt!331533))))

(assert (=> b!746112 (= lt!331533 (Intermediate!7534 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!502906 () Bool)

(assert (=> start!65468 (=> (not res!502906) (not e!416670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65468 (= res!502906 (validMask!0 mask!3328))))

(assert (=> start!65468 e!416670))

(assert (=> start!65468 true))

(declare-fun array_inv!15730 (array!41641) Bool)

(assert (=> start!65468 (array_inv!15730 a!3186)))

(declare-fun b!746104 () Bool)

(assert (=> b!746104 (= e!416670 e!416671)))

(declare-fun res!502912 () Bool)

(assert (=> b!746104 (=> (not res!502912) (not e!416671))))

(declare-fun lt!331532 () SeekEntryResult!7534)

(assert (=> b!746104 (= res!502912 (or (= lt!331532 (MissingZero!7534 i!1173)) (= lt!331532 (MissingVacant!7534 i!1173))))))

(assert (=> b!746104 (= lt!331532 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65468 res!502906) b!746101))

(assert (= (and b!746101 res!502904) b!746110))

(assert (= (and b!746110 res!502901) b!746106))

(assert (= (and b!746106 res!502905) b!746096))

(assert (= (and b!746096 res!502910) b!746104))

(assert (= (and b!746104 res!502912) b!746100))

(assert (= (and b!746100 res!502899) b!746099))

(assert (= (and b!746099 res!502908) b!746108))

(assert (= (and b!746108 res!502909) b!746112))

(assert (= (and b!746112 res!502898) b!746111))

(assert (= (and b!746111 res!502900) b!746107))

(assert (= (and b!746107 c!81979) b!746095))

(assert (= (and b!746107 (not c!81979)) b!746098))

(assert (= (and b!746107 res!502903) b!746103))

(assert (= (and b!746103 res!502911) b!746097))

(assert (= (and b!746097 res!502907) b!746109))

(assert (= (and b!746097 (not res!502902)) b!746105))

(assert (= (and b!746105 (not res!502913)) b!746102))

(declare-fun m!696391 () Bool)

(assert (=> b!746097 m!696391))

(assert (=> b!746097 m!696391))

(declare-fun m!696393 () Bool)

(assert (=> b!746097 m!696393))

(declare-fun m!696395 () Bool)

(assert (=> b!746097 m!696395))

(declare-fun m!696397 () Bool)

(assert (=> b!746097 m!696397))

(declare-fun m!696399 () Bool)

(assert (=> b!746103 m!696399))

(assert (=> b!746103 m!696399))

(declare-fun m!696401 () Bool)

(assert (=> b!746103 m!696401))

(declare-fun m!696403 () Bool)

(assert (=> b!746103 m!696403))

(declare-fun m!696405 () Bool)

(assert (=> b!746103 m!696405))

(declare-fun m!696407 () Bool)

(assert (=> b!746103 m!696407))

(declare-fun m!696409 () Bool)

(assert (=> b!746111 m!696409))

(declare-fun m!696411 () Bool)

(assert (=> b!746096 m!696411))

(declare-fun m!696413 () Bool)

(assert (=> start!65468 m!696413))

(declare-fun m!696415 () Bool)

(assert (=> start!65468 m!696415))

(declare-fun m!696417 () Bool)

(assert (=> b!746106 m!696417))

(assert (=> b!746110 m!696391))

(assert (=> b!746110 m!696391))

(declare-fun m!696419 () Bool)

(assert (=> b!746110 m!696419))

(declare-fun m!696421 () Bool)

(assert (=> b!746104 m!696421))

(assert (=> b!746105 m!696403))

(declare-fun m!696423 () Bool)

(assert (=> b!746105 m!696423))

(assert (=> b!746105 m!696391))

(assert (=> b!746105 m!696391))

(declare-fun m!696425 () Bool)

(assert (=> b!746105 m!696425))

(assert (=> b!746112 m!696391))

(assert (=> b!746112 m!696391))

(declare-fun m!696427 () Bool)

(assert (=> b!746112 m!696427))

(assert (=> b!746112 m!696427))

(assert (=> b!746112 m!696391))

(declare-fun m!696429 () Bool)

(assert (=> b!746112 m!696429))

(declare-fun m!696431 () Bool)

(assert (=> b!746099 m!696431))

(declare-fun m!696433 () Bool)

(assert (=> b!746100 m!696433))

(assert (=> b!746095 m!696391))

(assert (=> b!746095 m!696391))

(declare-fun m!696435 () Bool)

(assert (=> b!746095 m!696435))

(assert (=> b!746109 m!696391))

(assert (=> b!746109 m!696391))

(declare-fun m!696437 () Bool)

(assert (=> b!746109 m!696437))

(assert (=> b!746098 m!696391))

(assert (=> b!746098 m!696391))

(assert (=> b!746098 m!696425))

(push 1)

