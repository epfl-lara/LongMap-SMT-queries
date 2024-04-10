; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65492 () Bool)

(assert start!65492)

(declare-fun b!746743 () Bool)

(declare-fun res!503479 () Bool)

(declare-fun e!416995 () Bool)

(assert (=> b!746743 (=> (not res!503479) (not e!416995))))

(declare-datatypes ((array!41665 0))(
  ( (array!41666 (arr!19946 (Array (_ BitVec 32) (_ BitVec 64))) (size!20367 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41665)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41665 (_ BitVec 32)) Bool)

(assert (=> b!746743 (= res!503479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746744 () Bool)

(declare-fun res!503483 () Bool)

(declare-fun e!417002 () Bool)

(assert (=> b!746744 (=> (not res!503483) (not e!417002))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746744 (= res!503483 (validKeyInArray!0 (select (arr!19946 a!3186) j!159)))))

(declare-fun b!746745 () Bool)

(assert (=> b!746745 (= e!417002 e!416995)))

(declare-fun res!503476 () Bool)

(assert (=> b!746745 (=> (not res!503476) (not e!416995))))

(declare-datatypes ((SeekEntryResult!7546 0))(
  ( (MissingZero!7546 (index!32552 (_ BitVec 32))) (Found!7546 (index!32553 (_ BitVec 32))) (Intermediate!7546 (undefined!8358 Bool) (index!32554 (_ BitVec 32)) (x!63496 (_ BitVec 32))) (Undefined!7546) (MissingVacant!7546 (index!32555 (_ BitVec 32))) )
))
(declare-fun lt!331890 () SeekEntryResult!7546)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746745 (= res!503476 (or (= lt!331890 (MissingZero!7546 i!1173)) (= lt!331890 (MissingVacant!7546 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41665 (_ BitVec 32)) SeekEntryResult!7546)

(assert (=> b!746745 (= lt!331890 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746746 () Bool)

(declare-fun e!416997 () Bool)

(declare-fun e!416998 () Bool)

(assert (=> b!746746 (= e!416997 e!416998)))

(declare-fun res!503475 () Bool)

(assert (=> b!746746 (=> (not res!503475) (not e!416998))))

(declare-fun lt!331894 () SeekEntryResult!7546)

(declare-fun lt!331889 () SeekEntryResult!7546)

(assert (=> b!746746 (= res!503475 (= lt!331894 lt!331889))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!331887 () array!41665)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331893 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41665 (_ BitVec 32)) SeekEntryResult!7546)

(assert (=> b!746746 (= lt!331889 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331893 lt!331887 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746746 (= lt!331894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331893 mask!3328) lt!331893 lt!331887 mask!3328))))

(assert (=> b!746746 (= lt!331893 (select (store (arr!19946 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746746 (= lt!331887 (array!41666 (store (arr!19946 a!3186) i!1173 k!2102) (size!20367 a!3186)))))

(declare-fun res!503484 () Bool)

(assert (=> start!65492 (=> (not res!503484) (not e!417002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65492 (= res!503484 (validMask!0 mask!3328))))

(assert (=> start!65492 e!417002))

(assert (=> start!65492 true))

(declare-fun array_inv!15742 (array!41665) Bool)

(assert (=> start!65492 (array_inv!15742 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!746747 () Bool)

(declare-fun e!417001 () Bool)

(declare-fun lt!331891 () SeekEntryResult!7546)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41665 (_ BitVec 32)) SeekEntryResult!7546)

(assert (=> b!746747 (= e!417001 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19946 a!3186) j!159) a!3186 mask!3328) lt!331891))))

(declare-fun b!746748 () Bool)

(assert (=> b!746748 (= e!416995 e!416997)))

(declare-fun res!503488 () Bool)

(assert (=> b!746748 (=> (not res!503488) (not e!416997))))

(declare-fun lt!331892 () SeekEntryResult!7546)

(assert (=> b!746748 (= res!503488 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19946 a!3186) j!159) mask!3328) (select (arr!19946 a!3186) j!159) a!3186 mask!3328) lt!331892))))

(assert (=> b!746748 (= lt!331892 (Intermediate!7546 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746749 () Bool)

(declare-fun res!503477 () Bool)

(assert (=> b!746749 (=> (not res!503477) (not e!416995))))

(assert (=> b!746749 (= res!503477 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20367 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20367 a!3186))))))

(declare-fun b!746750 () Bool)

(declare-fun e!416999 () Bool)

(assert (=> b!746750 (= e!416998 (not e!416999))))

(declare-fun res!503480 () Bool)

(assert (=> b!746750 (=> res!503480 e!416999)))

(assert (=> b!746750 (= res!503480 (or (not (is-Intermediate!7546 lt!331889)) (bvslt x!1131 (x!63496 lt!331889)) (not (= x!1131 (x!63496 lt!331889))) (not (= index!1321 (index!32554 lt!331889)))))))

(assert (=> b!746750 e!417001))

(declare-fun res!503481 () Bool)

(assert (=> b!746750 (=> (not res!503481) (not e!417001))))

(declare-fun lt!331895 () SeekEntryResult!7546)

(assert (=> b!746750 (= res!503481 (= lt!331895 lt!331891))))

(assert (=> b!746750 (= lt!331891 (Found!7546 j!159))))

(assert (=> b!746750 (= lt!331895 (seekEntryOrOpen!0 (select (arr!19946 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746750 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25572 0))(
  ( (Unit!25573) )
))
(declare-fun lt!331886 () Unit!25572)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25572)

(assert (=> b!746750 (= lt!331886 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746751 () Bool)

(declare-fun res!503487 () Bool)

(assert (=> b!746751 (=> (not res!503487) (not e!417002))))

(assert (=> b!746751 (= res!503487 (validKeyInArray!0 k!2102))))

(declare-fun e!417000 () Bool)

(declare-fun b!746752 () Bool)

(assert (=> b!746752 (= e!417000 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19946 a!3186) j!159) a!3186 mask!3328) lt!331892))))

(declare-fun b!746753 () Bool)

(declare-fun res!503485 () Bool)

(assert (=> b!746753 (=> (not res!503485) (not e!416997))))

(assert (=> b!746753 (= res!503485 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19946 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746754 () Bool)

(declare-fun res!503478 () Bool)

(assert (=> b!746754 (=> (not res!503478) (not e!417002))))

(declare-fun arrayContainsKey!0 (array!41665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746754 (= res!503478 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746755 () Bool)

(declare-fun res!503489 () Bool)

(assert (=> b!746755 (=> (not res!503489) (not e!416995))))

(declare-datatypes ((List!13948 0))(
  ( (Nil!13945) (Cons!13944 (h!15016 (_ BitVec 64)) (t!20263 List!13948)) )
))
(declare-fun arrayNoDuplicates!0 (array!41665 (_ BitVec 32) List!13948) Bool)

(assert (=> b!746755 (= res!503489 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13945))))

(declare-fun b!746756 () Bool)

(declare-fun e!416996 () Bool)

(assert (=> b!746756 (= e!416996 true)))

(declare-fun lt!331888 () SeekEntryResult!7546)

(assert (=> b!746756 (= lt!331895 lt!331888)))

(declare-fun b!746757 () Bool)

(declare-fun res!503482 () Bool)

(assert (=> b!746757 (=> (not res!503482) (not e!416997))))

(assert (=> b!746757 (= res!503482 e!417000)))

(declare-fun c!82015 () Bool)

(assert (=> b!746757 (= c!82015 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746758 () Bool)

(assert (=> b!746758 (= e!417000 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19946 a!3186) j!159) a!3186 mask!3328) (Found!7546 j!159)))))

(declare-fun b!746759 () Bool)

(declare-fun res!503474 () Bool)

(assert (=> b!746759 (=> (not res!503474) (not e!417002))))

(assert (=> b!746759 (= res!503474 (and (= (size!20367 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20367 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20367 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746760 () Bool)

(assert (=> b!746760 (= e!416999 e!416996)))

(declare-fun res!503486 () Bool)

(assert (=> b!746760 (=> res!503486 e!416996)))

(assert (=> b!746760 (= res!503486 (or (not (= lt!331888 lt!331891)) (= (select (store (arr!19946 a!3186) i!1173 k!2102) index!1321) lt!331893) (not (= (select (store (arr!19946 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746760 (= lt!331888 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19946 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65492 res!503484) b!746759))

(assert (= (and b!746759 res!503474) b!746744))

(assert (= (and b!746744 res!503483) b!746751))

(assert (= (and b!746751 res!503487) b!746754))

(assert (= (and b!746754 res!503478) b!746745))

(assert (= (and b!746745 res!503476) b!746743))

(assert (= (and b!746743 res!503479) b!746755))

(assert (= (and b!746755 res!503489) b!746749))

(assert (= (and b!746749 res!503477) b!746748))

(assert (= (and b!746748 res!503488) b!746753))

(assert (= (and b!746753 res!503485) b!746757))

(assert (= (and b!746757 c!82015) b!746752))

(assert (= (and b!746757 (not c!82015)) b!746758))

(assert (= (and b!746757 res!503482) b!746746))

(assert (= (and b!746746 res!503475) b!746750))

(assert (= (and b!746750 res!503481) b!746747))

(assert (= (and b!746750 (not res!503480)) b!746760))

(assert (= (and b!746760 (not res!503486)) b!746756))

(declare-fun m!696967 () Bool)

(assert (=> b!746747 m!696967))

(assert (=> b!746747 m!696967))

(declare-fun m!696969 () Bool)

(assert (=> b!746747 m!696969))

(assert (=> b!746748 m!696967))

(assert (=> b!746748 m!696967))

(declare-fun m!696971 () Bool)

(assert (=> b!746748 m!696971))

(assert (=> b!746748 m!696971))

(assert (=> b!746748 m!696967))

(declare-fun m!696973 () Bool)

(assert (=> b!746748 m!696973))

(declare-fun m!696975 () Bool)

(assert (=> b!746746 m!696975))

(declare-fun m!696977 () Bool)

(assert (=> b!746746 m!696977))

(declare-fun m!696979 () Bool)

(assert (=> b!746746 m!696979))

(assert (=> b!746746 m!696977))

(declare-fun m!696981 () Bool)

(assert (=> b!746746 m!696981))

(declare-fun m!696983 () Bool)

(assert (=> b!746746 m!696983))

(declare-fun m!696985 () Bool)

(assert (=> start!65492 m!696985))

(declare-fun m!696987 () Bool)

(assert (=> start!65492 m!696987))

(declare-fun m!696989 () Bool)

(assert (=> b!746745 m!696989))

(declare-fun m!696991 () Bool)

(assert (=> b!746755 m!696991))

(assert (=> b!746760 m!696981))

(declare-fun m!696993 () Bool)

(assert (=> b!746760 m!696993))

(assert (=> b!746760 m!696967))

(assert (=> b!746760 m!696967))

(declare-fun m!696995 () Bool)

(assert (=> b!746760 m!696995))

(declare-fun m!696997 () Bool)

(assert (=> b!746754 m!696997))

(assert (=> b!746752 m!696967))

(assert (=> b!746752 m!696967))

(declare-fun m!696999 () Bool)

(assert (=> b!746752 m!696999))

(assert (=> b!746758 m!696967))

(assert (=> b!746758 m!696967))

(assert (=> b!746758 m!696995))

(declare-fun m!697001 () Bool)

(assert (=> b!746743 m!697001))

(declare-fun m!697003 () Bool)

(assert (=> b!746751 m!697003))

(assert (=> b!746750 m!696967))

(assert (=> b!746750 m!696967))

(declare-fun m!697005 () Bool)

(assert (=> b!746750 m!697005))

(declare-fun m!697007 () Bool)

(assert (=> b!746750 m!697007))

(declare-fun m!697009 () Bool)

(assert (=> b!746750 m!697009))

(assert (=> b!746744 m!696967))

(assert (=> b!746744 m!696967))

(declare-fun m!697011 () Bool)

(assert (=> b!746744 m!697011))

(declare-fun m!697013 () Bool)

(assert (=> b!746753 m!697013))

(push 1)

