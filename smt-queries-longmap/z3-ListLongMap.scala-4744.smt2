; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65652 () Bool)

(assert start!65652)

(declare-fun b!748475 () Bool)

(declare-datatypes ((Unit!25609 0))(
  ( (Unit!25610) )
))
(declare-fun e!417915 () Unit!25609)

(declare-fun Unit!25611 () Unit!25609)

(assert (=> b!748475 (= e!417915 Unit!25611)))

(assert (=> b!748475 false))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41695 0))(
  ( (array!41696 (arr!19957 (Array (_ BitVec 32) (_ BitVec 64))) (size!20377 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41695)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!417913 () Bool)

(declare-datatypes ((SeekEntryResult!7513 0))(
  ( (MissingZero!7513 (index!32420 (_ BitVec 32))) (Found!7513 (index!32421 (_ BitVec 32))) (Intermediate!7513 (undefined!8325 Bool) (index!32422 (_ BitVec 32)) (x!63523 (_ BitVec 32))) (Undefined!7513) (MissingVacant!7513 (index!32423 (_ BitVec 32))) )
))
(declare-fun lt!332679 () SeekEntryResult!7513)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!748476 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41695 (_ BitVec 32)) SeekEntryResult!7513)

(assert (=> b!748476 (= e!417913 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19957 a!3186) j!159) a!3186 mask!3328) lt!332679))))

(declare-fun b!748477 () Bool)

(declare-fun res!504609 () Bool)

(declare-fun e!417919 () Bool)

(assert (=> b!748477 (=> res!504609 e!417919)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!332682 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!748477 (= res!504609 (= (select (store (arr!19957 a!3186) i!1173 k0!2102) index!1321) lt!332682))))

(declare-fun b!748478 () Bool)

(declare-fun res!504606 () Bool)

(assert (=> b!748478 (=> res!504606 e!417919)))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!748478 (= res!504606 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19957 a!3186) j!159) a!3186 mask!3328) lt!332679)))))

(declare-fun b!748479 () Bool)

(declare-fun res!504594 () Bool)

(declare-fun e!417921 () Bool)

(assert (=> b!748479 (=> (not res!504594) (not e!417921))))

(assert (=> b!748479 (= res!504594 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20377 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20377 a!3186))))))

(declare-fun b!748480 () Bool)

(declare-fun res!504604 () Bool)

(declare-fun e!417918 () Bool)

(assert (=> b!748480 (=> (not res!504604) (not e!417918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748480 (= res!504604 (validKeyInArray!0 k0!2102))))

(declare-fun b!748481 () Bool)

(declare-fun e!417917 () Bool)

(assert (=> b!748481 (= e!417917 (not e!417919))))

(declare-fun res!504598 () Bool)

(assert (=> b!748481 (=> res!504598 e!417919)))

(declare-fun lt!332688 () SeekEntryResult!7513)

(get-info :version)

(assert (=> b!748481 (= res!504598 (or (not ((_ is Intermediate!7513) lt!332688)) (bvslt x!1131 (x!63523 lt!332688)) (not (= x!1131 (x!63523 lt!332688))) (not (= index!1321 (index!32422 lt!332688)))))))

(assert (=> b!748481 e!417913))

(declare-fun res!504597 () Bool)

(assert (=> b!748481 (=> (not res!504597) (not e!417913))))

(declare-fun lt!332687 () SeekEntryResult!7513)

(assert (=> b!748481 (= res!504597 (= lt!332687 lt!332679))))

(assert (=> b!748481 (= lt!332679 (Found!7513 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41695 (_ BitVec 32)) SeekEntryResult!7513)

(assert (=> b!748481 (= lt!332687 (seekEntryOrOpen!0 (select (arr!19957 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41695 (_ BitVec 32)) Bool)

(assert (=> b!748481 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332681 () Unit!25609)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25609)

(assert (=> b!748481 (= lt!332681 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!504605 () Bool)

(assert (=> start!65652 (=> (not res!504605) (not e!417918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65652 (= res!504605 (validMask!0 mask!3328))))

(assert (=> start!65652 e!417918))

(assert (=> start!65652 true))

(declare-fun array_inv!15816 (array!41695) Bool)

(assert (=> start!65652 (array_inv!15816 a!3186)))

(declare-fun b!748482 () Bool)

(declare-fun res!504601 () Bool)

(assert (=> b!748482 (=> (not res!504601) (not e!417918))))

(assert (=> b!748482 (= res!504601 (and (= (size!20377 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20377 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20377 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748483 () Bool)

(declare-fun res!504600 () Bool)

(assert (=> b!748483 (=> (not res!504600) (not e!417921))))

(assert (=> b!748483 (= res!504600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748484 () Bool)

(assert (=> b!748484 (= e!417919 true)))

(assert (=> b!748484 (= (select (store (arr!19957 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332684 () Unit!25609)

(assert (=> b!748484 (= lt!332684 e!417915)))

(declare-fun c!82325 () Bool)

(assert (=> b!748484 (= c!82325 (= (select (store (arr!19957 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748485 () Bool)

(declare-fun res!504607 () Bool)

(assert (=> b!748485 (=> (not res!504607) (not e!417921))))

(declare-datatypes ((List!13866 0))(
  ( (Nil!13863) (Cons!13862 (h!14940 (_ BitVec 64)) (t!20173 List!13866)) )
))
(declare-fun arrayNoDuplicates!0 (array!41695 (_ BitVec 32) List!13866) Bool)

(assert (=> b!748485 (= res!504607 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13863))))

(declare-fun b!748486 () Bool)

(declare-fun e!417916 () Bool)

(assert (=> b!748486 (= e!417916 e!417917)))

(declare-fun res!504610 () Bool)

(assert (=> b!748486 (=> (not res!504610) (not e!417917))))

(declare-fun lt!332685 () SeekEntryResult!7513)

(assert (=> b!748486 (= res!504610 (= lt!332685 lt!332688))))

(declare-fun lt!332686 () array!41695)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41695 (_ BitVec 32)) SeekEntryResult!7513)

(assert (=> b!748486 (= lt!332688 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332682 lt!332686 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748486 (= lt!332685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332682 mask!3328) lt!332682 lt!332686 mask!3328))))

(assert (=> b!748486 (= lt!332682 (select (store (arr!19957 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748486 (= lt!332686 (array!41696 (store (arr!19957 a!3186) i!1173 k0!2102) (size!20377 a!3186)))))

(declare-fun lt!332683 () SeekEntryResult!7513)

(declare-fun e!417920 () Bool)

(declare-fun b!748487 () Bool)

(assert (=> b!748487 (= e!417920 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19957 a!3186) j!159) a!3186 mask!3328) lt!332683))))

(declare-fun b!748488 () Bool)

(assert (=> b!748488 (= e!417918 e!417921)))

(declare-fun res!504608 () Bool)

(assert (=> b!748488 (=> (not res!504608) (not e!417921))))

(declare-fun lt!332680 () SeekEntryResult!7513)

(assert (=> b!748488 (= res!504608 (or (= lt!332680 (MissingZero!7513 i!1173)) (= lt!332680 (MissingVacant!7513 i!1173))))))

(assert (=> b!748488 (= lt!332680 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748489 () Bool)

(declare-fun res!504596 () Bool)

(assert (=> b!748489 (=> (not res!504596) (not e!417916))))

(assert (=> b!748489 (= res!504596 e!417920)))

(declare-fun c!82324 () Bool)

(assert (=> b!748489 (= c!82324 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748490 () Bool)

(declare-fun Unit!25612 () Unit!25609)

(assert (=> b!748490 (= e!417915 Unit!25612)))

(declare-fun b!748491 () Bool)

(declare-fun res!504595 () Bool)

(assert (=> b!748491 (=> (not res!504595) (not e!417916))))

(assert (=> b!748491 (= res!504595 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19957 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748492 () Bool)

(declare-fun res!504599 () Bool)

(assert (=> b!748492 (=> (not res!504599) (not e!417918))))

(declare-fun arrayContainsKey!0 (array!41695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748492 (= res!504599 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748493 () Bool)

(assert (=> b!748493 (= e!417920 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19957 a!3186) j!159) a!3186 mask!3328) (Found!7513 j!159)))))

(declare-fun b!748494 () Bool)

(declare-fun res!504603 () Bool)

(assert (=> b!748494 (=> (not res!504603) (not e!417918))))

(assert (=> b!748494 (= res!504603 (validKeyInArray!0 (select (arr!19957 a!3186) j!159)))))

(declare-fun b!748495 () Bool)

(assert (=> b!748495 (= e!417921 e!417916)))

(declare-fun res!504602 () Bool)

(assert (=> b!748495 (=> (not res!504602) (not e!417916))))

(assert (=> b!748495 (= res!504602 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19957 a!3186) j!159) mask!3328) (select (arr!19957 a!3186) j!159) a!3186 mask!3328) lt!332683))))

(assert (=> b!748495 (= lt!332683 (Intermediate!7513 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65652 res!504605) b!748482))

(assert (= (and b!748482 res!504601) b!748494))

(assert (= (and b!748494 res!504603) b!748480))

(assert (= (and b!748480 res!504604) b!748492))

(assert (= (and b!748492 res!504599) b!748488))

(assert (= (and b!748488 res!504608) b!748483))

(assert (= (and b!748483 res!504600) b!748485))

(assert (= (and b!748485 res!504607) b!748479))

(assert (= (and b!748479 res!504594) b!748495))

(assert (= (and b!748495 res!504602) b!748491))

(assert (= (and b!748491 res!504595) b!748489))

(assert (= (and b!748489 c!82324) b!748487))

(assert (= (and b!748489 (not c!82324)) b!748493))

(assert (= (and b!748489 res!504596) b!748486))

(assert (= (and b!748486 res!504610) b!748481))

(assert (= (and b!748481 res!504597) b!748476))

(assert (= (and b!748481 (not res!504598)) b!748478))

(assert (= (and b!748478 (not res!504606)) b!748477))

(assert (= (and b!748477 (not res!504609)) b!748484))

(assert (= (and b!748484 c!82325) b!748475))

(assert (= (and b!748484 (not c!82325)) b!748490))

(declare-fun m!698901 () Bool)

(assert (=> b!748480 m!698901))

(declare-fun m!698903 () Bool)

(assert (=> b!748495 m!698903))

(assert (=> b!748495 m!698903))

(declare-fun m!698905 () Bool)

(assert (=> b!748495 m!698905))

(assert (=> b!748495 m!698905))

(assert (=> b!748495 m!698903))

(declare-fun m!698907 () Bool)

(assert (=> b!748495 m!698907))

(assert (=> b!748493 m!698903))

(assert (=> b!748493 m!698903))

(declare-fun m!698909 () Bool)

(assert (=> b!748493 m!698909))

(assert (=> b!748487 m!698903))

(assert (=> b!748487 m!698903))

(declare-fun m!698911 () Bool)

(assert (=> b!748487 m!698911))

(declare-fun m!698913 () Bool)

(assert (=> b!748477 m!698913))

(declare-fun m!698915 () Bool)

(assert (=> b!748477 m!698915))

(declare-fun m!698917 () Bool)

(assert (=> b!748491 m!698917))

(declare-fun m!698919 () Bool)

(assert (=> b!748483 m!698919))

(declare-fun m!698921 () Bool)

(assert (=> b!748488 m!698921))

(assert (=> b!748481 m!698903))

(assert (=> b!748481 m!698903))

(declare-fun m!698923 () Bool)

(assert (=> b!748481 m!698923))

(declare-fun m!698925 () Bool)

(assert (=> b!748481 m!698925))

(declare-fun m!698927 () Bool)

(assert (=> b!748481 m!698927))

(assert (=> b!748478 m!698903))

(assert (=> b!748478 m!698903))

(assert (=> b!748478 m!698909))

(assert (=> b!748476 m!698903))

(assert (=> b!748476 m!698903))

(declare-fun m!698929 () Bool)

(assert (=> b!748476 m!698929))

(declare-fun m!698931 () Bool)

(assert (=> b!748486 m!698931))

(declare-fun m!698933 () Bool)

(assert (=> b!748486 m!698933))

(assert (=> b!748486 m!698913))

(declare-fun m!698935 () Bool)

(assert (=> b!748486 m!698935))

(declare-fun m!698937 () Bool)

(assert (=> b!748486 m!698937))

(assert (=> b!748486 m!698931))

(declare-fun m!698939 () Bool)

(assert (=> b!748485 m!698939))

(assert (=> b!748484 m!698913))

(assert (=> b!748484 m!698915))

(declare-fun m!698941 () Bool)

(assert (=> b!748492 m!698941))

(assert (=> b!748494 m!698903))

(assert (=> b!748494 m!698903))

(declare-fun m!698943 () Bool)

(assert (=> b!748494 m!698943))

(declare-fun m!698945 () Bool)

(assert (=> start!65652 m!698945))

(declare-fun m!698947 () Bool)

(assert (=> start!65652 m!698947))

(check-sat (not b!748486) (not b!748494) (not b!748480) (not b!748485) (not b!748495) (not b!748483) (not b!748493) (not b!748481) (not b!748487) (not b!748492) (not b!748488) (not b!748478) (not b!748476) (not start!65652))
(check-sat)
