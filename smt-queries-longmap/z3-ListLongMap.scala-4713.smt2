; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65340 () Bool)

(assert start!65340)

(declare-fun b!742482 () Bool)

(declare-fun res!499679 () Bool)

(declare-fun e!414950 () Bool)

(assert (=> b!742482 (=> (not res!499679) (not e!414950))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41513 0))(
  ( (array!41514 (arr!19870 (Array (_ BitVec 32) (_ BitVec 64))) (size!20291 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41513)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742482 (= res!499679 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19870 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!414946 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!329843 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7470 0))(
  ( (MissingZero!7470 (index!32248 (_ BitVec 32))) (Found!7470 (index!32249 (_ BitVec 32))) (Intermediate!7470 (undefined!8282 Bool) (index!32250 (_ BitVec 32)) (x!63220 (_ BitVec 32))) (Undefined!7470) (MissingVacant!7470 (index!32251 (_ BitVec 32))) )
))
(declare-fun lt!329844 () SeekEntryResult!7470)

(declare-fun b!742483 () Bool)

(assert (=> b!742483 (= e!414946 (or (not (= (select (store (arr!19870 a!3186) i!1173 k0!2102) index!1321) lt!329843)) (undefined!8282 lt!329844) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!742484 () Bool)

(declare-fun res!499674 () Bool)

(declare-fun e!414947 () Bool)

(assert (=> b!742484 (=> (not res!499674) (not e!414947))))

(declare-fun arrayContainsKey!0 (array!41513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742484 (= res!499674 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!414949 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!742485 () Bool)

(declare-fun lt!329842 () SeekEntryResult!7470)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41513 (_ BitVec 32)) SeekEntryResult!7470)

(assert (=> b!742485 (= e!414949 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19870 a!3186) j!159) a!3186 mask!3328) lt!329842))))

(declare-fun b!742486 () Bool)

(declare-fun e!414948 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!742486 (= e!414948 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19870 a!3186) j!159) a!3186 mask!3328) (Found!7470 j!159)))))

(declare-fun b!742487 () Bool)

(declare-fun res!499676 () Bool)

(declare-fun e!414945 () Bool)

(assert (=> b!742487 (=> (not res!499676) (not e!414945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41513 (_ BitVec 32)) Bool)

(assert (=> b!742487 (= res!499676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742488 () Bool)

(declare-fun e!414942 () Bool)

(assert (=> b!742488 (= e!414942 e!414949)))

(declare-fun res!499681 () Bool)

(assert (=> b!742488 (=> (not res!499681) (not e!414949))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41513 (_ BitVec 32)) SeekEntryResult!7470)

(assert (=> b!742488 (= res!499681 (= (seekEntryOrOpen!0 (select (arr!19870 a!3186) j!159) a!3186 mask!3328) lt!329842))))

(assert (=> b!742488 (= lt!329842 (Found!7470 j!159))))

(declare-fun b!742489 () Bool)

(declare-fun res!499675 () Bool)

(assert (=> b!742489 (=> res!499675 e!414946)))

(assert (=> b!742489 (= res!499675 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19870 a!3186) j!159) a!3186 mask!3328) (Found!7470 j!159))))))

(declare-fun b!742490 () Bool)

(declare-fun res!499678 () Bool)

(assert (=> b!742490 (=> (not res!499678) (not e!414947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742490 (= res!499678 (validKeyInArray!0 k0!2102))))

(declare-fun b!742491 () Bool)

(declare-fun e!414943 () Bool)

(assert (=> b!742491 (= e!414943 (not e!414946))))

(declare-fun res!499682 () Bool)

(assert (=> b!742491 (=> res!499682 e!414946)))

(get-info :version)

(assert (=> b!742491 (= res!499682 (or (not ((_ is Intermediate!7470) lt!329844)) (bvslt x!1131 (x!63220 lt!329844)) (not (= x!1131 (x!63220 lt!329844))) (not (= index!1321 (index!32250 lt!329844)))))))

(assert (=> b!742491 e!414942))

(declare-fun res!499685 () Bool)

(assert (=> b!742491 (=> (not res!499685) (not e!414942))))

(assert (=> b!742491 (= res!499685 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25420 0))(
  ( (Unit!25421) )
))
(declare-fun lt!329845 () Unit!25420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41513 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25420)

(assert (=> b!742491 (= lt!329845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!499671 () Bool)

(assert (=> start!65340 (=> (not res!499671) (not e!414947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65340 (= res!499671 (validMask!0 mask!3328))))

(assert (=> start!65340 e!414947))

(assert (=> start!65340 true))

(declare-fun array_inv!15666 (array!41513) Bool)

(assert (=> start!65340 (array_inv!15666 a!3186)))

(declare-fun b!742492 () Bool)

(assert (=> b!742492 (= e!414945 e!414950)))

(declare-fun res!499673 () Bool)

(assert (=> b!742492 (=> (not res!499673) (not e!414950))))

(declare-fun lt!329839 () SeekEntryResult!7470)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41513 (_ BitVec 32)) SeekEntryResult!7470)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742492 (= res!499673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19870 a!3186) j!159) mask!3328) (select (arr!19870 a!3186) j!159) a!3186 mask!3328) lt!329839))))

(assert (=> b!742492 (= lt!329839 (Intermediate!7470 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742493 () Bool)

(assert (=> b!742493 (= e!414948 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19870 a!3186) j!159) a!3186 mask!3328) lt!329839))))

(declare-fun b!742494 () Bool)

(assert (=> b!742494 (= e!414950 e!414943)))

(declare-fun res!499683 () Bool)

(assert (=> b!742494 (=> (not res!499683) (not e!414943))))

(declare-fun lt!329846 () SeekEntryResult!7470)

(assert (=> b!742494 (= res!499683 (= lt!329846 lt!329844))))

(declare-fun lt!329841 () array!41513)

(assert (=> b!742494 (= lt!329844 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329843 lt!329841 mask!3328))))

(assert (=> b!742494 (= lt!329846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329843 mask!3328) lt!329843 lt!329841 mask!3328))))

(assert (=> b!742494 (= lt!329843 (select (store (arr!19870 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742494 (= lt!329841 (array!41514 (store (arr!19870 a!3186) i!1173 k0!2102) (size!20291 a!3186)))))

(declare-fun b!742495 () Bool)

(declare-fun res!499684 () Bool)

(assert (=> b!742495 (=> (not res!499684) (not e!414950))))

(assert (=> b!742495 (= res!499684 e!414948)))

(declare-fun c!81787 () Bool)

(assert (=> b!742495 (= c!81787 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742496 () Bool)

(declare-fun res!499680 () Bool)

(assert (=> b!742496 (=> (not res!499680) (not e!414947))))

(assert (=> b!742496 (= res!499680 (and (= (size!20291 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20291 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20291 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742497 () Bool)

(assert (=> b!742497 (= e!414947 e!414945)))

(declare-fun res!499672 () Bool)

(assert (=> b!742497 (=> (not res!499672) (not e!414945))))

(declare-fun lt!329840 () SeekEntryResult!7470)

(assert (=> b!742497 (= res!499672 (or (= lt!329840 (MissingZero!7470 i!1173)) (= lt!329840 (MissingVacant!7470 i!1173))))))

(assert (=> b!742497 (= lt!329840 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742498 () Bool)

(declare-fun res!499677 () Bool)

(assert (=> b!742498 (=> (not res!499677) (not e!414945))))

(declare-datatypes ((List!13872 0))(
  ( (Nil!13869) (Cons!13868 (h!14940 (_ BitVec 64)) (t!20187 List!13872)) )
))
(declare-fun arrayNoDuplicates!0 (array!41513 (_ BitVec 32) List!13872) Bool)

(assert (=> b!742498 (= res!499677 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13869))))

(declare-fun b!742499 () Bool)

(declare-fun res!499670 () Bool)

(assert (=> b!742499 (=> (not res!499670) (not e!414945))))

(assert (=> b!742499 (= res!499670 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20291 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20291 a!3186))))))

(declare-fun b!742500 () Bool)

(declare-fun res!499669 () Bool)

(assert (=> b!742500 (=> (not res!499669) (not e!414947))))

(assert (=> b!742500 (= res!499669 (validKeyInArray!0 (select (arr!19870 a!3186) j!159)))))

(assert (= (and start!65340 res!499671) b!742496))

(assert (= (and b!742496 res!499680) b!742500))

(assert (= (and b!742500 res!499669) b!742490))

(assert (= (and b!742490 res!499678) b!742484))

(assert (= (and b!742484 res!499674) b!742497))

(assert (= (and b!742497 res!499672) b!742487))

(assert (= (and b!742487 res!499676) b!742498))

(assert (= (and b!742498 res!499677) b!742499))

(assert (= (and b!742499 res!499670) b!742492))

(assert (= (and b!742492 res!499673) b!742482))

(assert (= (and b!742482 res!499679) b!742495))

(assert (= (and b!742495 c!81787) b!742493))

(assert (= (and b!742495 (not c!81787)) b!742486))

(assert (= (and b!742495 res!499684) b!742494))

(assert (= (and b!742494 res!499683) b!742491))

(assert (= (and b!742491 res!499685) b!742488))

(assert (= (and b!742488 res!499681) b!742485))

(assert (= (and b!742491 (not res!499682)) b!742489))

(assert (= (and b!742489 (not res!499675)) b!742483))

(declare-fun m!693337 () Bool)

(assert (=> b!742486 m!693337))

(assert (=> b!742486 m!693337))

(declare-fun m!693339 () Bool)

(assert (=> b!742486 m!693339))

(declare-fun m!693341 () Bool)

(assert (=> b!742498 m!693341))

(declare-fun m!693343 () Bool)

(assert (=> b!742487 m!693343))

(assert (=> b!742500 m!693337))

(assert (=> b!742500 m!693337))

(declare-fun m!693345 () Bool)

(assert (=> b!742500 m!693345))

(declare-fun m!693347 () Bool)

(assert (=> b!742497 m!693347))

(assert (=> b!742492 m!693337))

(assert (=> b!742492 m!693337))

(declare-fun m!693349 () Bool)

(assert (=> b!742492 m!693349))

(assert (=> b!742492 m!693349))

(assert (=> b!742492 m!693337))

(declare-fun m!693351 () Bool)

(assert (=> b!742492 m!693351))

(declare-fun m!693353 () Bool)

(assert (=> b!742494 m!693353))

(declare-fun m!693355 () Bool)

(assert (=> b!742494 m!693355))

(declare-fun m!693357 () Bool)

(assert (=> b!742494 m!693357))

(assert (=> b!742494 m!693353))

(declare-fun m!693359 () Bool)

(assert (=> b!742494 m!693359))

(declare-fun m!693361 () Bool)

(assert (=> b!742494 m!693361))

(declare-fun m!693363 () Bool)

(assert (=> b!742482 m!693363))

(assert (=> b!742489 m!693337))

(assert (=> b!742489 m!693337))

(assert (=> b!742489 m!693339))

(assert (=> b!742493 m!693337))

(assert (=> b!742493 m!693337))

(declare-fun m!693365 () Bool)

(assert (=> b!742493 m!693365))

(assert (=> b!742483 m!693359))

(declare-fun m!693367 () Bool)

(assert (=> b!742483 m!693367))

(assert (=> b!742485 m!693337))

(assert (=> b!742485 m!693337))

(declare-fun m!693369 () Bool)

(assert (=> b!742485 m!693369))

(declare-fun m!693371 () Bool)

(assert (=> b!742490 m!693371))

(declare-fun m!693373 () Bool)

(assert (=> b!742491 m!693373))

(declare-fun m!693375 () Bool)

(assert (=> b!742491 m!693375))

(declare-fun m!693377 () Bool)

(assert (=> b!742484 m!693377))

(assert (=> b!742488 m!693337))

(assert (=> b!742488 m!693337))

(declare-fun m!693379 () Bool)

(assert (=> b!742488 m!693379))

(declare-fun m!693381 () Bool)

(assert (=> start!65340 m!693381))

(declare-fun m!693383 () Bool)

(assert (=> start!65340 m!693383))

(check-sat (not b!742491) (not b!742485) (not b!742493) (not b!742487) (not b!742497) (not b!742484) (not b!742488) (not b!742490) (not start!65340) (not b!742494) (not b!742492) (not b!742489) (not b!742500) (not b!742486) (not b!742498))
(check-sat)
