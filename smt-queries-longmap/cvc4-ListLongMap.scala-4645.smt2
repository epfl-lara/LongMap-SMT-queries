; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64646 () Bool)

(assert start!64646)

(declare-fun b!728200 () Bool)

(declare-fun res!488744 () Bool)

(declare-fun e!407650 () Bool)

(assert (=> b!728200 (=> (not res!488744) (not e!407650))))

(declare-datatypes ((array!41095 0))(
  ( (array!41096 (arr!19667 (Array (_ BitVec 32) (_ BitVec 64))) (size!20088 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41095)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728200 (= res!488744 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!407645 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!728201 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7267 0))(
  ( (MissingZero!7267 (index!31436 (_ BitVec 32))) (Found!7267 (index!31437 (_ BitVec 32))) (Intermediate!7267 (undefined!8079 Bool) (index!31438 (_ BitVec 32)) (x!62425 (_ BitVec 32))) (Undefined!7267) (MissingVacant!7267 (index!31439 (_ BitVec 32))) )
))
(declare-fun lt!322545 () SeekEntryResult!7267)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41095 (_ BitVec 32)) SeekEntryResult!7267)

(assert (=> b!728201 (= e!407645 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19667 a!3186) j!159) a!3186 mask!3328) lt!322545))))

(declare-fun b!728202 () Bool)

(declare-fun res!488745 () Bool)

(declare-fun e!407647 () Bool)

(assert (=> b!728202 (=> (not res!488745) (not e!407647))))

(assert (=> b!728202 (= res!488745 e!407645)))

(declare-fun c!80104 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728202 (= c!80104 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!407643 () Bool)

(declare-fun b!728203 () Bool)

(declare-fun lt!322543 () SeekEntryResult!7267)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41095 (_ BitVec 32)) SeekEntryResult!7267)

(assert (=> b!728203 (= e!407643 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19667 a!3186) j!159) a!3186 mask!3328) lt!322543))))

(declare-fun b!728205 () Bool)

(declare-fun res!488755 () Bool)

(declare-fun e!407644 () Bool)

(assert (=> b!728205 (=> (not res!488755) (not e!407644))))

(assert (=> b!728205 (= res!488755 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20088 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20088 a!3186))))))

(declare-fun b!728206 () Bool)

(declare-fun res!488753 () Bool)

(assert (=> b!728206 (=> (not res!488753) (not e!407644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41095 (_ BitVec 32)) Bool)

(assert (=> b!728206 (= res!488753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728207 () Bool)

(declare-fun e!407649 () Bool)

(assert (=> b!728207 (= e!407647 e!407649)))

(declare-fun res!488756 () Bool)

(assert (=> b!728207 (=> (not res!488756) (not e!407649))))

(declare-fun lt!322546 () SeekEntryResult!7267)

(declare-fun lt!322550 () SeekEntryResult!7267)

(assert (=> b!728207 (= res!488756 (= lt!322546 lt!322550))))

(declare-fun lt!322549 () array!41095)

(declare-fun lt!322547 () (_ BitVec 64))

(assert (=> b!728207 (= lt!322550 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322547 lt!322549 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728207 (= lt!322546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322547 mask!3328) lt!322547 lt!322549 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728207 (= lt!322547 (select (store (arr!19667 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728207 (= lt!322549 (array!41096 (store (arr!19667 a!3186) i!1173 k!2102) (size!20088 a!3186)))))

(declare-fun b!728208 () Bool)

(declare-fun e!407646 () Bool)

(assert (=> b!728208 (= e!407646 e!407643)))

(declare-fun res!488752 () Bool)

(assert (=> b!728208 (=> (not res!488752) (not e!407643))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41095 (_ BitVec 32)) SeekEntryResult!7267)

(assert (=> b!728208 (= res!488752 (= (seekEntryOrOpen!0 (select (arr!19667 a!3186) j!159) a!3186 mask!3328) lt!322543))))

(assert (=> b!728208 (= lt!322543 (Found!7267 j!159))))

(declare-fun b!728209 () Bool)

(declare-fun e!407651 () Bool)

(assert (=> b!728209 (= e!407651 true)))

(declare-fun lt!322544 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728209 (= lt!322544 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728210 () Bool)

(assert (=> b!728210 (= e!407644 e!407647)))

(declare-fun res!488742 () Bool)

(assert (=> b!728210 (=> (not res!488742) (not e!407647))))

(assert (=> b!728210 (= res!488742 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19667 a!3186) j!159) mask!3328) (select (arr!19667 a!3186) j!159) a!3186 mask!3328) lt!322545))))

(assert (=> b!728210 (= lt!322545 (Intermediate!7267 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728211 () Bool)

(declare-fun res!488749 () Bool)

(assert (=> b!728211 (=> (not res!488749) (not e!407650))))

(assert (=> b!728211 (= res!488749 (and (= (size!20088 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20088 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20088 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728204 () Bool)

(assert (=> b!728204 (= e!407650 e!407644)))

(declare-fun res!488741 () Bool)

(assert (=> b!728204 (=> (not res!488741) (not e!407644))))

(declare-fun lt!322542 () SeekEntryResult!7267)

(assert (=> b!728204 (= res!488741 (or (= lt!322542 (MissingZero!7267 i!1173)) (= lt!322542 (MissingVacant!7267 i!1173))))))

(assert (=> b!728204 (= lt!322542 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!488748 () Bool)

(assert (=> start!64646 (=> (not res!488748) (not e!407650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64646 (= res!488748 (validMask!0 mask!3328))))

(assert (=> start!64646 e!407650))

(assert (=> start!64646 true))

(declare-fun array_inv!15463 (array!41095) Bool)

(assert (=> start!64646 (array_inv!15463 a!3186)))

(declare-fun b!728212 () Bool)

(assert (=> b!728212 (= e!407645 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19667 a!3186) j!159) a!3186 mask!3328) (Found!7267 j!159)))))

(declare-fun b!728213 () Bool)

(assert (=> b!728213 (= e!407649 (not e!407651))))

(declare-fun res!488747 () Bool)

(assert (=> b!728213 (=> res!488747 e!407651)))

(assert (=> b!728213 (= res!488747 (or (not (is-Intermediate!7267 lt!322550)) (bvsge x!1131 (x!62425 lt!322550))))))

(assert (=> b!728213 e!407646))

(declare-fun res!488746 () Bool)

(assert (=> b!728213 (=> (not res!488746) (not e!407646))))

(assert (=> b!728213 (= res!488746 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24852 0))(
  ( (Unit!24853) )
))
(declare-fun lt!322548 () Unit!24852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24852)

(assert (=> b!728213 (= lt!322548 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728214 () Bool)

(declare-fun res!488743 () Bool)

(assert (=> b!728214 (=> (not res!488743) (not e!407647))))

(assert (=> b!728214 (= res!488743 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19667 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728215 () Bool)

(declare-fun res!488754 () Bool)

(assert (=> b!728215 (=> (not res!488754) (not e!407650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728215 (= res!488754 (validKeyInArray!0 k!2102))))

(declare-fun b!728216 () Bool)

(declare-fun res!488751 () Bool)

(assert (=> b!728216 (=> (not res!488751) (not e!407644))))

(declare-datatypes ((List!13669 0))(
  ( (Nil!13666) (Cons!13665 (h!14725 (_ BitVec 64)) (t!19984 List!13669)) )
))
(declare-fun arrayNoDuplicates!0 (array!41095 (_ BitVec 32) List!13669) Bool)

(assert (=> b!728216 (= res!488751 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13666))))

(declare-fun b!728217 () Bool)

(declare-fun res!488750 () Bool)

(assert (=> b!728217 (=> (not res!488750) (not e!407650))))

(assert (=> b!728217 (= res!488750 (validKeyInArray!0 (select (arr!19667 a!3186) j!159)))))

(assert (= (and start!64646 res!488748) b!728211))

(assert (= (and b!728211 res!488749) b!728217))

(assert (= (and b!728217 res!488750) b!728215))

(assert (= (and b!728215 res!488754) b!728200))

(assert (= (and b!728200 res!488744) b!728204))

(assert (= (and b!728204 res!488741) b!728206))

(assert (= (and b!728206 res!488753) b!728216))

(assert (= (and b!728216 res!488751) b!728205))

(assert (= (and b!728205 res!488755) b!728210))

(assert (= (and b!728210 res!488742) b!728214))

(assert (= (and b!728214 res!488743) b!728202))

(assert (= (and b!728202 c!80104) b!728201))

(assert (= (and b!728202 (not c!80104)) b!728212))

(assert (= (and b!728202 res!488745) b!728207))

(assert (= (and b!728207 res!488756) b!728213))

(assert (= (and b!728213 res!488746) b!728208))

(assert (= (and b!728208 res!488752) b!728203))

(assert (= (and b!728213 (not res!488747)) b!728209))

(declare-fun m!681979 () Bool)

(assert (=> b!728213 m!681979))

(declare-fun m!681981 () Bool)

(assert (=> b!728213 m!681981))

(declare-fun m!681983 () Bool)

(assert (=> b!728200 m!681983))

(declare-fun m!681985 () Bool)

(assert (=> b!728210 m!681985))

(assert (=> b!728210 m!681985))

(declare-fun m!681987 () Bool)

(assert (=> b!728210 m!681987))

(assert (=> b!728210 m!681987))

(assert (=> b!728210 m!681985))

(declare-fun m!681989 () Bool)

(assert (=> b!728210 m!681989))

(declare-fun m!681991 () Bool)

(assert (=> b!728215 m!681991))

(assert (=> b!728201 m!681985))

(assert (=> b!728201 m!681985))

(declare-fun m!681993 () Bool)

(assert (=> b!728201 m!681993))

(assert (=> b!728203 m!681985))

(assert (=> b!728203 m!681985))

(declare-fun m!681995 () Bool)

(assert (=> b!728203 m!681995))

(declare-fun m!681997 () Bool)

(assert (=> b!728206 m!681997))

(assert (=> b!728208 m!681985))

(assert (=> b!728208 m!681985))

(declare-fun m!681999 () Bool)

(assert (=> b!728208 m!681999))

(declare-fun m!682001 () Bool)

(assert (=> b!728207 m!682001))

(declare-fun m!682003 () Bool)

(assert (=> b!728207 m!682003))

(declare-fun m!682005 () Bool)

(assert (=> b!728207 m!682005))

(declare-fun m!682007 () Bool)

(assert (=> b!728207 m!682007))

(assert (=> b!728207 m!682001))

(declare-fun m!682009 () Bool)

(assert (=> b!728207 m!682009))

(assert (=> b!728212 m!681985))

(assert (=> b!728212 m!681985))

(declare-fun m!682011 () Bool)

(assert (=> b!728212 m!682011))

(declare-fun m!682013 () Bool)

(assert (=> b!728214 m!682013))

(declare-fun m!682015 () Bool)

(assert (=> b!728209 m!682015))

(assert (=> b!728217 m!681985))

(assert (=> b!728217 m!681985))

(declare-fun m!682017 () Bool)

(assert (=> b!728217 m!682017))

(declare-fun m!682019 () Bool)

(assert (=> b!728216 m!682019))

(declare-fun m!682021 () Bool)

(assert (=> start!64646 m!682021))

(declare-fun m!682023 () Bool)

(assert (=> start!64646 m!682023))

(declare-fun m!682025 () Bool)

(assert (=> b!728204 m!682025))

(push 1)

