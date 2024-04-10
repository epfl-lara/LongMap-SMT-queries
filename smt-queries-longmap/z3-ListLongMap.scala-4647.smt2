; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64656 () Bool)

(assert start!64656)

(declare-fun b!728470 () Bool)

(declare-fun res!488983 () Bool)

(declare-fun e!407783 () Bool)

(assert (=> b!728470 (=> (not res!488983) (not e!407783))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41105 0))(
  ( (array!41106 (arr!19672 (Array (_ BitVec 32) (_ BitVec 64))) (size!20093 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41105)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728470 (= res!488983 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19672 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728471 () Bool)

(declare-fun res!488987 () Bool)

(declare-fun e!407785 () Bool)

(assert (=> b!728471 (=> (not res!488987) (not e!407785))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41105 (_ BitVec 32)) Bool)

(assert (=> b!728471 (= res!488987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728472 () Bool)

(assert (=> b!728472 (= e!407785 e!407783)))

(declare-fun res!488991 () Bool)

(assert (=> b!728472 (=> (not res!488991) (not e!407783))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7272 0))(
  ( (MissingZero!7272 (index!31456 (_ BitVec 32))) (Found!7272 (index!31457 (_ BitVec 32))) (Intermediate!7272 (undefined!8084 Bool) (index!31458 (_ BitVec 32)) (x!62446 (_ BitVec 32))) (Undefined!7272) (MissingVacant!7272 (index!31459 (_ BitVec 32))) )
))
(declare-fun lt!322679 () SeekEntryResult!7272)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41105 (_ BitVec 32)) SeekEntryResult!7272)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728472 (= res!488991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19672 a!3186) j!159) mask!3328) (select (arr!19672 a!3186) j!159) a!3186 mask!3328) lt!322679))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728472 (= lt!322679 (Intermediate!7272 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!488996 () Bool)

(declare-fun e!407782 () Bool)

(assert (=> start!64656 (=> (not res!488996) (not e!407782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64656 (= res!488996 (validMask!0 mask!3328))))

(assert (=> start!64656 e!407782))

(assert (=> start!64656 true))

(declare-fun array_inv!15468 (array!41105) Bool)

(assert (=> start!64656 (array_inv!15468 a!3186)))

(declare-fun b!728473 () Bool)

(declare-fun e!407781 () Bool)

(declare-fun e!407779 () Bool)

(assert (=> b!728473 (= e!407781 e!407779)))

(declare-fun res!488986 () Bool)

(assert (=> b!728473 (=> (not res!488986) (not e!407779))))

(declare-fun lt!322682 () SeekEntryResult!7272)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41105 (_ BitVec 32)) SeekEntryResult!7272)

(assert (=> b!728473 (= res!488986 (= (seekEntryOrOpen!0 (select (arr!19672 a!3186) j!159) a!3186 mask!3328) lt!322682))))

(assert (=> b!728473 (= lt!322682 (Found!7272 j!159))))

(declare-fun b!728474 () Bool)

(declare-fun res!488984 () Bool)

(assert (=> b!728474 (=> (not res!488984) (not e!407785))))

(declare-datatypes ((List!13674 0))(
  ( (Nil!13671) (Cons!13670 (h!14730 (_ BitVec 64)) (t!19989 List!13674)) )
))
(declare-fun arrayNoDuplicates!0 (array!41105 (_ BitVec 32) List!13674) Bool)

(assert (=> b!728474 (= res!488984 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13671))))

(declare-fun b!728475 () Bool)

(declare-fun e!407786 () Bool)

(declare-fun e!407780 () Bool)

(assert (=> b!728475 (= e!407786 (not e!407780))))

(declare-fun res!488982 () Bool)

(assert (=> b!728475 (=> res!488982 e!407780)))

(declare-fun lt!322680 () SeekEntryResult!7272)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!728475 (= res!488982 (or (not ((_ is Intermediate!7272) lt!322680)) (bvsge x!1131 (x!62446 lt!322680))))))

(assert (=> b!728475 e!407781))

(declare-fun res!488990 () Bool)

(assert (=> b!728475 (=> (not res!488990) (not e!407781))))

(assert (=> b!728475 (= res!488990 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24862 0))(
  ( (Unit!24863) )
))
(declare-fun lt!322685 () Unit!24862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24862)

(assert (=> b!728475 (= lt!322685 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728476 () Bool)

(assert (=> b!728476 (= e!407780 true)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!322681 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728476 (= lt!322681 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728477 () Bool)

(declare-fun res!488994 () Bool)

(assert (=> b!728477 (=> (not res!488994) (not e!407782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728477 (= res!488994 (validKeyInArray!0 (select (arr!19672 a!3186) j!159)))))

(declare-fun b!728478 () Bool)

(declare-fun e!407784 () Bool)

(assert (=> b!728478 (= e!407784 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19672 a!3186) j!159) a!3186 mask!3328) lt!322679))))

(declare-fun b!728479 () Bool)

(declare-fun res!488989 () Bool)

(assert (=> b!728479 (=> (not res!488989) (not e!407782))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728479 (= res!488989 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728480 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41105 (_ BitVec 32)) SeekEntryResult!7272)

(assert (=> b!728480 (= e!407779 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19672 a!3186) j!159) a!3186 mask!3328) lt!322682))))

(declare-fun b!728481 () Bool)

(assert (=> b!728481 (= e!407784 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19672 a!3186) j!159) a!3186 mask!3328) (Found!7272 j!159)))))

(declare-fun b!728482 () Bool)

(assert (=> b!728482 (= e!407782 e!407785)))

(declare-fun res!488981 () Bool)

(assert (=> b!728482 (=> (not res!488981) (not e!407785))))

(declare-fun lt!322678 () SeekEntryResult!7272)

(assert (=> b!728482 (= res!488981 (or (= lt!322678 (MissingZero!7272 i!1173)) (= lt!322678 (MissingVacant!7272 i!1173))))))

(assert (=> b!728482 (= lt!322678 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728483 () Bool)

(declare-fun res!488985 () Bool)

(assert (=> b!728483 (=> (not res!488985) (not e!407782))))

(assert (=> b!728483 (= res!488985 (and (= (size!20093 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20093 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20093 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728484 () Bool)

(assert (=> b!728484 (= e!407783 e!407786)))

(declare-fun res!488992 () Bool)

(assert (=> b!728484 (=> (not res!488992) (not e!407786))))

(declare-fun lt!322677 () SeekEntryResult!7272)

(assert (=> b!728484 (= res!488992 (= lt!322677 lt!322680))))

(declare-fun lt!322683 () array!41105)

(declare-fun lt!322684 () (_ BitVec 64))

(assert (=> b!728484 (= lt!322680 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322684 lt!322683 mask!3328))))

(assert (=> b!728484 (= lt!322677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322684 mask!3328) lt!322684 lt!322683 mask!3328))))

(assert (=> b!728484 (= lt!322684 (select (store (arr!19672 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728484 (= lt!322683 (array!41106 (store (arr!19672 a!3186) i!1173 k0!2102) (size!20093 a!3186)))))

(declare-fun b!728485 () Bool)

(declare-fun res!488995 () Bool)

(assert (=> b!728485 (=> (not res!488995) (not e!407783))))

(assert (=> b!728485 (= res!488995 e!407784)))

(declare-fun c!80119 () Bool)

(assert (=> b!728485 (= c!80119 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728486 () Bool)

(declare-fun res!488993 () Bool)

(assert (=> b!728486 (=> (not res!488993) (not e!407782))))

(assert (=> b!728486 (= res!488993 (validKeyInArray!0 k0!2102))))

(declare-fun b!728487 () Bool)

(declare-fun res!488988 () Bool)

(assert (=> b!728487 (=> (not res!488988) (not e!407785))))

(assert (=> b!728487 (= res!488988 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20093 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20093 a!3186))))))

(assert (= (and start!64656 res!488996) b!728483))

(assert (= (and b!728483 res!488985) b!728477))

(assert (= (and b!728477 res!488994) b!728486))

(assert (= (and b!728486 res!488993) b!728479))

(assert (= (and b!728479 res!488989) b!728482))

(assert (= (and b!728482 res!488981) b!728471))

(assert (= (and b!728471 res!488987) b!728474))

(assert (= (and b!728474 res!488984) b!728487))

(assert (= (and b!728487 res!488988) b!728472))

(assert (= (and b!728472 res!488991) b!728470))

(assert (= (and b!728470 res!488983) b!728485))

(assert (= (and b!728485 c!80119) b!728478))

(assert (= (and b!728485 (not c!80119)) b!728481))

(assert (= (and b!728485 res!488995) b!728484))

(assert (= (and b!728484 res!488992) b!728475))

(assert (= (and b!728475 res!488990) b!728473))

(assert (= (and b!728473 res!488986) b!728480))

(assert (= (and b!728475 (not res!488982)) b!728476))

(declare-fun m!682219 () Bool)

(assert (=> b!728477 m!682219))

(assert (=> b!728477 m!682219))

(declare-fun m!682221 () Bool)

(assert (=> b!728477 m!682221))

(assert (=> b!728481 m!682219))

(assert (=> b!728481 m!682219))

(declare-fun m!682223 () Bool)

(assert (=> b!728481 m!682223))

(assert (=> b!728478 m!682219))

(assert (=> b!728478 m!682219))

(declare-fun m!682225 () Bool)

(assert (=> b!728478 m!682225))

(assert (=> b!728473 m!682219))

(assert (=> b!728473 m!682219))

(declare-fun m!682227 () Bool)

(assert (=> b!728473 m!682227))

(declare-fun m!682229 () Bool)

(assert (=> b!728474 m!682229))

(assert (=> b!728480 m!682219))

(assert (=> b!728480 m!682219))

(declare-fun m!682231 () Bool)

(assert (=> b!728480 m!682231))

(declare-fun m!682233 () Bool)

(assert (=> b!728470 m!682233))

(declare-fun m!682235 () Bool)

(assert (=> b!728479 m!682235))

(declare-fun m!682237 () Bool)

(assert (=> start!64656 m!682237))

(declare-fun m!682239 () Bool)

(assert (=> start!64656 m!682239))

(declare-fun m!682241 () Bool)

(assert (=> b!728476 m!682241))

(declare-fun m!682243 () Bool)

(assert (=> b!728471 m!682243))

(declare-fun m!682245 () Bool)

(assert (=> b!728484 m!682245))

(declare-fun m!682247 () Bool)

(assert (=> b!728484 m!682247))

(assert (=> b!728484 m!682245))

(declare-fun m!682249 () Bool)

(assert (=> b!728484 m!682249))

(declare-fun m!682251 () Bool)

(assert (=> b!728484 m!682251))

(declare-fun m!682253 () Bool)

(assert (=> b!728484 m!682253))

(assert (=> b!728472 m!682219))

(assert (=> b!728472 m!682219))

(declare-fun m!682255 () Bool)

(assert (=> b!728472 m!682255))

(assert (=> b!728472 m!682255))

(assert (=> b!728472 m!682219))

(declare-fun m!682257 () Bool)

(assert (=> b!728472 m!682257))

(declare-fun m!682259 () Bool)

(assert (=> b!728475 m!682259))

(declare-fun m!682261 () Bool)

(assert (=> b!728475 m!682261))

(declare-fun m!682263 () Bool)

(assert (=> b!728482 m!682263))

(declare-fun m!682265 () Bool)

(assert (=> b!728486 m!682265))

(check-sat (not b!728474) (not b!728476) (not b!728472) (not b!728482) (not b!728486) (not b!728471) (not b!728478) (not start!64656) (not b!728481) (not b!728480) (not b!728484) (not b!728473) (not b!728477) (not b!728475) (not b!728479))
(check-sat)
