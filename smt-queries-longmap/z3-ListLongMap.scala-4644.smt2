; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64638 () Bool)

(assert start!64638)

(declare-fun res!488557 () Bool)

(declare-fun e!407536 () Bool)

(assert (=> start!64638 (=> (not res!488557) (not e!407536))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64638 (= res!488557 (validMask!0 mask!3328))))

(assert (=> start!64638 e!407536))

(assert (=> start!64638 true))

(declare-datatypes ((array!41087 0))(
  ( (array!41088 (arr!19663 (Array (_ BitVec 32) (_ BitVec 64))) (size!20084 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41087)

(declare-fun array_inv!15459 (array!41087) Bool)

(assert (=> start!64638 (array_inv!15459 a!3186)))

(declare-fun b!727984 () Bool)

(declare-fun res!488556 () Bool)

(assert (=> b!727984 (=> (not res!488556) (not e!407536))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727984 (= res!488556 (validKeyInArray!0 k0!2102))))

(declare-fun b!727985 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!407537 () Bool)

(declare-datatypes ((SeekEntryResult!7263 0))(
  ( (MissingZero!7263 (index!31420 (_ BitVec 32))) (Found!7263 (index!31421 (_ BitVec 32))) (Intermediate!7263 (undefined!8075 Bool) (index!31422 (_ BitVec 32)) (x!62413 (_ BitVec 32))) (Undefined!7263) (MissingVacant!7263 (index!31423 (_ BitVec 32))) )
))
(declare-fun lt!322438 () SeekEntryResult!7263)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41087 (_ BitVec 32)) SeekEntryResult!7263)

(assert (=> b!727985 (= e!407537 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19663 a!3186) j!159) a!3186 mask!3328) lt!322438))))

(declare-fun b!727986 () Bool)

(declare-fun res!488552 () Bool)

(declare-fun e!407540 () Bool)

(assert (=> b!727986 (=> (not res!488552) (not e!407540))))

(assert (=> b!727986 (= res!488552 e!407537)))

(declare-fun c!80092 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727986 (= c!80092 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727987 () Bool)

(declare-fun res!488560 () Bool)

(assert (=> b!727987 (=> (not res!488560) (not e!407540))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727987 (= res!488560 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19663 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727988 () Bool)

(declare-fun e!407542 () Bool)

(assert (=> b!727988 (= e!407542 e!407540)))

(declare-fun res!488561 () Bool)

(assert (=> b!727988 (=> (not res!488561) (not e!407540))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727988 (= res!488561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19663 a!3186) j!159) mask!3328) (select (arr!19663 a!3186) j!159) a!3186 mask!3328) lt!322438))))

(assert (=> b!727988 (= lt!322438 (Intermediate!7263 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727989 () Bool)

(declare-fun e!407538 () Bool)

(assert (=> b!727989 (= e!407540 e!407538)))

(declare-fun res!488554 () Bool)

(assert (=> b!727989 (=> (not res!488554) (not e!407538))))

(declare-fun lt!322441 () SeekEntryResult!7263)

(declare-fun lt!322439 () SeekEntryResult!7263)

(assert (=> b!727989 (= res!488554 (= lt!322441 lt!322439))))

(declare-fun lt!322437 () (_ BitVec 64))

(declare-fun lt!322436 () array!41087)

(assert (=> b!727989 (= lt!322439 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322437 lt!322436 mask!3328))))

(assert (=> b!727989 (= lt!322441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322437 mask!3328) lt!322437 lt!322436 mask!3328))))

(assert (=> b!727989 (= lt!322437 (select (store (arr!19663 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!727989 (= lt!322436 (array!41088 (store (arr!19663 a!3186) i!1173 k0!2102) (size!20084 a!3186)))))

(declare-fun b!727990 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41087 (_ BitVec 32)) SeekEntryResult!7263)

(assert (=> b!727990 (= e!407537 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19663 a!3186) j!159) a!3186 mask!3328) (Found!7263 j!159)))))

(declare-fun b!727991 () Bool)

(declare-fun e!407535 () Bool)

(assert (=> b!727991 (= e!407538 (not e!407535))))

(declare-fun res!488559 () Bool)

(assert (=> b!727991 (=> res!488559 e!407535)))

(get-info :version)

(assert (=> b!727991 (= res!488559 (or (not ((_ is Intermediate!7263) lt!322439)) (bvsge x!1131 (x!62413 lt!322439))))))

(declare-fun e!407541 () Bool)

(assert (=> b!727991 e!407541))

(declare-fun res!488553 () Bool)

(assert (=> b!727991 (=> (not res!488553) (not e!407541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41087 (_ BitVec 32)) Bool)

(assert (=> b!727991 (= res!488553 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24844 0))(
  ( (Unit!24845) )
))
(declare-fun lt!322434 () Unit!24844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24844)

(assert (=> b!727991 (= lt!322434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!322435 () SeekEntryResult!7263)

(declare-fun b!727992 () Bool)

(declare-fun e!407543 () Bool)

(assert (=> b!727992 (= e!407543 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19663 a!3186) j!159) a!3186 mask!3328) lt!322435))))

(declare-fun b!727993 () Bool)

(declare-fun res!488562 () Bool)

(assert (=> b!727993 (=> (not res!488562) (not e!407542))))

(assert (=> b!727993 (= res!488562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727994 () Bool)

(declare-fun res!488564 () Bool)

(assert (=> b!727994 (=> (not res!488564) (not e!407542))))

(declare-datatypes ((List!13665 0))(
  ( (Nil!13662) (Cons!13661 (h!14721 (_ BitVec 64)) (t!19980 List!13665)) )
))
(declare-fun arrayNoDuplicates!0 (array!41087 (_ BitVec 32) List!13665) Bool)

(assert (=> b!727994 (= res!488564 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13662))))

(declare-fun b!727995 () Bool)

(assert (=> b!727995 (= e!407536 e!407542)))

(declare-fun res!488551 () Bool)

(assert (=> b!727995 (=> (not res!488551) (not e!407542))))

(declare-fun lt!322442 () SeekEntryResult!7263)

(assert (=> b!727995 (= res!488551 (or (= lt!322442 (MissingZero!7263 i!1173)) (= lt!322442 (MissingVacant!7263 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41087 (_ BitVec 32)) SeekEntryResult!7263)

(assert (=> b!727995 (= lt!322442 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!727996 () Bool)

(assert (=> b!727996 (= e!407541 e!407543)))

(declare-fun res!488555 () Bool)

(assert (=> b!727996 (=> (not res!488555) (not e!407543))))

(assert (=> b!727996 (= res!488555 (= (seekEntryOrOpen!0 (select (arr!19663 a!3186) j!159) a!3186 mask!3328) lt!322435))))

(assert (=> b!727996 (= lt!322435 (Found!7263 j!159))))

(declare-fun b!727997 () Bool)

(declare-fun res!488558 () Bool)

(assert (=> b!727997 (=> (not res!488558) (not e!407542))))

(assert (=> b!727997 (= res!488558 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20084 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20084 a!3186))))))

(declare-fun b!727998 () Bool)

(declare-fun res!488549 () Bool)

(assert (=> b!727998 (=> (not res!488549) (not e!407536))))

(assert (=> b!727998 (= res!488549 (validKeyInArray!0 (select (arr!19663 a!3186) j!159)))))

(declare-fun b!727999 () Bool)

(assert (=> b!727999 (= e!407535 true)))

(declare-fun lt!322440 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727999 (= lt!322440 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728000 () Bool)

(declare-fun res!488563 () Bool)

(assert (=> b!728000 (=> (not res!488563) (not e!407536))))

(declare-fun arrayContainsKey!0 (array!41087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728000 (= res!488563 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728001 () Bool)

(declare-fun res!488550 () Bool)

(assert (=> b!728001 (=> (not res!488550) (not e!407536))))

(assert (=> b!728001 (= res!488550 (and (= (size!20084 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20084 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20084 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64638 res!488557) b!728001))

(assert (= (and b!728001 res!488550) b!727998))

(assert (= (and b!727998 res!488549) b!727984))

(assert (= (and b!727984 res!488556) b!728000))

(assert (= (and b!728000 res!488563) b!727995))

(assert (= (and b!727995 res!488551) b!727993))

(assert (= (and b!727993 res!488562) b!727994))

(assert (= (and b!727994 res!488564) b!727997))

(assert (= (and b!727997 res!488558) b!727988))

(assert (= (and b!727988 res!488561) b!727987))

(assert (= (and b!727987 res!488560) b!727986))

(assert (= (and b!727986 c!80092) b!727985))

(assert (= (and b!727986 (not c!80092)) b!727990))

(assert (= (and b!727986 res!488552) b!727989))

(assert (= (and b!727989 res!488554) b!727991))

(assert (= (and b!727991 res!488553) b!727996))

(assert (= (and b!727996 res!488555) b!727992))

(assert (= (and b!727991 (not res!488559)) b!727999))

(declare-fun m!681787 () Bool)

(assert (=> b!727991 m!681787))

(declare-fun m!681789 () Bool)

(assert (=> b!727991 m!681789))

(declare-fun m!681791 () Bool)

(assert (=> start!64638 m!681791))

(declare-fun m!681793 () Bool)

(assert (=> start!64638 m!681793))

(declare-fun m!681795 () Bool)

(assert (=> b!727992 m!681795))

(assert (=> b!727992 m!681795))

(declare-fun m!681797 () Bool)

(assert (=> b!727992 m!681797))

(declare-fun m!681799 () Bool)

(assert (=> b!727994 m!681799))

(assert (=> b!727985 m!681795))

(assert (=> b!727985 m!681795))

(declare-fun m!681801 () Bool)

(assert (=> b!727985 m!681801))

(declare-fun m!681803 () Bool)

(assert (=> b!728000 m!681803))

(declare-fun m!681805 () Bool)

(assert (=> b!727999 m!681805))

(declare-fun m!681807 () Bool)

(assert (=> b!727993 m!681807))

(assert (=> b!727988 m!681795))

(assert (=> b!727988 m!681795))

(declare-fun m!681809 () Bool)

(assert (=> b!727988 m!681809))

(assert (=> b!727988 m!681809))

(assert (=> b!727988 m!681795))

(declare-fun m!681811 () Bool)

(assert (=> b!727988 m!681811))

(declare-fun m!681813 () Bool)

(assert (=> b!727987 m!681813))

(assert (=> b!727990 m!681795))

(assert (=> b!727990 m!681795))

(declare-fun m!681815 () Bool)

(assert (=> b!727990 m!681815))

(assert (=> b!727996 m!681795))

(assert (=> b!727996 m!681795))

(declare-fun m!681817 () Bool)

(assert (=> b!727996 m!681817))

(declare-fun m!681819 () Bool)

(assert (=> b!727989 m!681819))

(declare-fun m!681821 () Bool)

(assert (=> b!727989 m!681821))

(declare-fun m!681823 () Bool)

(assert (=> b!727989 m!681823))

(declare-fun m!681825 () Bool)

(assert (=> b!727989 m!681825))

(declare-fun m!681827 () Bool)

(assert (=> b!727989 m!681827))

(assert (=> b!727989 m!681819))

(declare-fun m!681829 () Bool)

(assert (=> b!727995 m!681829))

(declare-fun m!681831 () Bool)

(assert (=> b!727984 m!681831))

(assert (=> b!727998 m!681795))

(assert (=> b!727998 m!681795))

(declare-fun m!681833 () Bool)

(assert (=> b!727998 m!681833))

(check-sat (not start!64638) (not b!727984) (not b!727985) (not b!727990) (not b!727999) (not b!727994) (not b!728000) (not b!727996) (not b!727988) (not b!727998) (not b!727992) (not b!727989) (not b!727993) (not b!727995) (not b!727991))
(check-sat)
