; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65738 () Bool)

(assert start!65738)

(declare-fun b!755314 () Bool)

(declare-fun res!510609 () Bool)

(declare-fun e!421187 () Bool)

(assert (=> b!755314 (=> (not res!510609) (not e!421187))))

(declare-datatypes ((array!41928 0))(
  ( (array!41929 (arr!20078 (Array (_ BitVec 32) (_ BitVec 64))) (size!20499 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41928)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41928 (_ BitVec 32)) Bool)

(assert (=> b!755314 (= res!510609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755315 () Bool)

(declare-fun e!421193 () Bool)

(declare-fun e!421189 () Bool)

(assert (=> b!755315 (= e!421193 (not e!421189))))

(declare-fun res!510611 () Bool)

(assert (=> b!755315 (=> res!510611 e!421189)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7675 0))(
  ( (MissingZero!7675 (index!33068 (_ BitVec 32))) (Found!7675 (index!33069 (_ BitVec 32))) (Intermediate!7675 (undefined!8487 Bool) (index!33070 (_ BitVec 32)) (x!63980 (_ BitVec 32))) (Undefined!7675) (MissingVacant!7675 (index!33071 (_ BitVec 32))) )
))
(declare-fun lt!336101 () SeekEntryResult!7675)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!755315 (= res!510611 (or (not ((_ is Intermediate!7675) lt!336101)) (bvslt x!1131 (x!63980 lt!336101)) (not (= x!1131 (x!63980 lt!336101))) (not (= index!1321 (index!33070 lt!336101)))))))

(declare-fun e!421194 () Bool)

(assert (=> b!755315 e!421194))

(declare-fun res!510625 () Bool)

(assert (=> b!755315 (=> (not res!510625) (not e!421194))))

(declare-fun lt!336091 () SeekEntryResult!7675)

(declare-fun lt!336093 () SeekEntryResult!7675)

(assert (=> b!755315 (= res!510625 (= lt!336091 lt!336093))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!755315 (= lt!336093 (Found!7675 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41928 (_ BitVec 32)) SeekEntryResult!7675)

(assert (=> b!755315 (= lt!336091 (seekEntryOrOpen!0 (select (arr!20078 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755315 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26060 0))(
  ( (Unit!26061) )
))
(declare-fun lt!336098 () Unit!26060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26060)

(assert (=> b!755315 (= lt!336098 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755316 () Bool)

(declare-fun e!421185 () Bool)

(assert (=> b!755316 (= e!421185 e!421187)))

(declare-fun res!510613 () Bool)

(assert (=> b!755316 (=> (not res!510613) (not e!421187))))

(declare-fun lt!336097 () SeekEntryResult!7675)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755316 (= res!510613 (or (= lt!336097 (MissingZero!7675 i!1173)) (= lt!336097 (MissingVacant!7675 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!755316 (= lt!336097 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755317 () Bool)

(declare-fun res!510621 () Bool)

(assert (=> b!755317 (=> (not res!510621) (not e!421187))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755317 (= res!510621 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20499 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20499 a!3186))))))

(declare-fun b!755318 () Bool)

(declare-fun e!421190 () Unit!26060)

(declare-fun Unit!26062 () Unit!26060)

(assert (=> b!755318 (= e!421190 Unit!26062)))

(assert (=> b!755318 false))

(declare-fun b!755320 () Bool)

(declare-fun res!510616 () Bool)

(assert (=> b!755320 (=> (not res!510616) (not e!421187))))

(declare-datatypes ((List!14119 0))(
  ( (Nil!14116) (Cons!14115 (h!15187 (_ BitVec 64)) (t!20425 List!14119)) )
))
(declare-fun arrayNoDuplicates!0 (array!41928 (_ BitVec 32) List!14119) Bool)

(assert (=> b!755320 (= res!510616 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14116))))

(declare-fun b!755321 () Bool)

(declare-fun res!510623 () Bool)

(declare-fun e!421188 () Bool)

(assert (=> b!755321 (=> (not res!510623) (not e!421188))))

(assert (=> b!755321 (= res!510623 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20078 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755322 () Bool)

(declare-fun Unit!26063 () Unit!26060)

(assert (=> b!755322 (= e!421190 Unit!26063)))

(declare-fun b!755323 () Bool)

(declare-fun e!421184 () Bool)

(declare-fun lt!336094 () SeekEntryResult!7675)

(assert (=> b!755323 (= e!421184 (= lt!336091 lt!336094))))

(declare-fun b!755324 () Bool)

(declare-fun e!421191 () Bool)

(assert (=> b!755324 (= e!421191 true)))

(assert (=> b!755324 e!421184))

(declare-fun res!510626 () Bool)

(assert (=> b!755324 (=> (not res!510626) (not e!421184))))

(declare-fun lt!336100 () (_ BitVec 64))

(assert (=> b!755324 (= res!510626 (= lt!336100 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336090 () Unit!26060)

(assert (=> b!755324 (= lt!336090 e!421190)))

(declare-fun c!82734 () Bool)

(assert (=> b!755324 (= c!82734 (= lt!336100 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755325 () Bool)

(assert (=> b!755325 (= e!421187 e!421188)))

(declare-fun res!510618 () Bool)

(assert (=> b!755325 (=> (not res!510618) (not e!421188))))

(declare-fun lt!336099 () SeekEntryResult!7675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41928 (_ BitVec 32)) SeekEntryResult!7675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755325 (= res!510618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20078 a!3186) j!159) mask!3328) (select (arr!20078 a!3186) j!159) a!3186 mask!3328) lt!336099))))

(assert (=> b!755325 (= lt!336099 (Intermediate!7675 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755326 () Bool)

(declare-fun e!421195 () Bool)

(assert (=> b!755326 (= e!421189 e!421195)))

(declare-fun res!510627 () Bool)

(assert (=> b!755326 (=> res!510627 e!421195)))

(assert (=> b!755326 (= res!510627 (not (= lt!336094 lt!336093)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41928 (_ BitVec 32)) SeekEntryResult!7675)

(assert (=> b!755326 (= lt!336094 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20078 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755327 () Bool)

(declare-fun res!510617 () Bool)

(assert (=> b!755327 (=> (not res!510617) (not e!421188))))

(declare-fun e!421186 () Bool)

(assert (=> b!755327 (= res!510617 e!421186)))

(declare-fun c!82733 () Bool)

(assert (=> b!755327 (= c!82733 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755328 () Bool)

(assert (=> b!755328 (= e!421186 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20078 a!3186) j!159) a!3186 mask!3328) (Found!7675 j!159)))))

(declare-fun b!755329 () Bool)

(declare-fun res!510610 () Bool)

(assert (=> b!755329 (=> (not res!510610) (not e!421185))))

(assert (=> b!755329 (= res!510610 (and (= (size!20499 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20499 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20499 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755330 () Bool)

(declare-fun res!510620 () Bool)

(assert (=> b!755330 (=> (not res!510620) (not e!421185))))

(declare-fun arrayContainsKey!0 (array!41928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755330 (= res!510620 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755331 () Bool)

(assert (=> b!755331 (= e!421194 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20078 a!3186) j!159) a!3186 mask!3328) lt!336093))))

(declare-fun b!755332 () Bool)

(assert (=> b!755332 (= e!421188 e!421193)))

(declare-fun res!510622 () Bool)

(assert (=> b!755332 (=> (not res!510622) (not e!421193))))

(declare-fun lt!336092 () SeekEntryResult!7675)

(assert (=> b!755332 (= res!510622 (= lt!336092 lt!336101))))

(declare-fun lt!336095 () (_ BitVec 64))

(declare-fun lt!336096 () array!41928)

(assert (=> b!755332 (= lt!336101 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336095 lt!336096 mask!3328))))

(assert (=> b!755332 (= lt!336092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336095 mask!3328) lt!336095 lt!336096 mask!3328))))

(assert (=> b!755332 (= lt!336095 (select (store (arr!20078 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755332 (= lt!336096 (array!41929 (store (arr!20078 a!3186) i!1173 k0!2102) (size!20499 a!3186)))))

(declare-fun b!755333 () Bool)

(declare-fun res!510612 () Bool)

(assert (=> b!755333 (=> (not res!510612) (not e!421184))))

(assert (=> b!755333 (= res!510612 (= (seekEntryOrOpen!0 lt!336095 lt!336096 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336095 lt!336096 mask!3328)))))

(declare-fun b!755334 () Bool)

(assert (=> b!755334 (= e!421195 e!421191)))

(declare-fun res!510619 () Bool)

(assert (=> b!755334 (=> res!510619 e!421191)))

(assert (=> b!755334 (= res!510619 (= lt!336100 lt!336095))))

(assert (=> b!755334 (= lt!336100 (select (store (arr!20078 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755335 () Bool)

(declare-fun res!510624 () Bool)

(assert (=> b!755335 (=> (not res!510624) (not e!421185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755335 (= res!510624 (validKeyInArray!0 k0!2102))))

(declare-fun b!755336 () Bool)

(declare-fun res!510614 () Bool)

(assert (=> b!755336 (=> (not res!510614) (not e!421185))))

(assert (=> b!755336 (= res!510614 (validKeyInArray!0 (select (arr!20078 a!3186) j!159)))))

(declare-fun b!755319 () Bool)

(assert (=> b!755319 (= e!421186 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20078 a!3186) j!159) a!3186 mask!3328) lt!336099))))

(declare-fun res!510615 () Bool)

(assert (=> start!65738 (=> (not res!510615) (not e!421185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65738 (= res!510615 (validMask!0 mask!3328))))

(assert (=> start!65738 e!421185))

(assert (=> start!65738 true))

(declare-fun array_inv!15961 (array!41928) Bool)

(assert (=> start!65738 (array_inv!15961 a!3186)))

(assert (= (and start!65738 res!510615) b!755329))

(assert (= (and b!755329 res!510610) b!755336))

(assert (= (and b!755336 res!510614) b!755335))

(assert (= (and b!755335 res!510624) b!755330))

(assert (= (and b!755330 res!510620) b!755316))

(assert (= (and b!755316 res!510613) b!755314))

(assert (= (and b!755314 res!510609) b!755320))

(assert (= (and b!755320 res!510616) b!755317))

(assert (= (and b!755317 res!510621) b!755325))

(assert (= (and b!755325 res!510618) b!755321))

(assert (= (and b!755321 res!510623) b!755327))

(assert (= (and b!755327 c!82733) b!755319))

(assert (= (and b!755327 (not c!82733)) b!755328))

(assert (= (and b!755327 res!510617) b!755332))

(assert (= (and b!755332 res!510622) b!755315))

(assert (= (and b!755315 res!510625) b!755331))

(assert (= (and b!755315 (not res!510611)) b!755326))

(assert (= (and b!755326 (not res!510627)) b!755334))

(assert (= (and b!755334 (not res!510619)) b!755324))

(assert (= (and b!755324 c!82734) b!755318))

(assert (= (and b!755324 (not c!82734)) b!755322))

(assert (= (and b!755324 res!510626) b!755333))

(assert (= (and b!755333 res!510612) b!755323))

(declare-fun m!702977 () Bool)

(assert (=> b!755333 m!702977))

(declare-fun m!702979 () Bool)

(assert (=> b!755333 m!702979))

(declare-fun m!702981 () Bool)

(assert (=> b!755335 m!702981))

(declare-fun m!702983 () Bool)

(assert (=> b!755316 m!702983))

(declare-fun m!702985 () Bool)

(assert (=> b!755314 m!702985))

(declare-fun m!702987 () Bool)

(assert (=> b!755330 m!702987))

(declare-fun m!702989 () Bool)

(assert (=> b!755320 m!702989))

(declare-fun m!702991 () Bool)

(assert (=> start!65738 m!702991))

(declare-fun m!702993 () Bool)

(assert (=> start!65738 m!702993))

(declare-fun m!702995 () Bool)

(assert (=> b!755334 m!702995))

(declare-fun m!702997 () Bool)

(assert (=> b!755334 m!702997))

(declare-fun m!702999 () Bool)

(assert (=> b!755321 m!702999))

(declare-fun m!703001 () Bool)

(assert (=> b!755331 m!703001))

(assert (=> b!755331 m!703001))

(declare-fun m!703003 () Bool)

(assert (=> b!755331 m!703003))

(assert (=> b!755328 m!703001))

(assert (=> b!755328 m!703001))

(declare-fun m!703005 () Bool)

(assert (=> b!755328 m!703005))

(assert (=> b!755319 m!703001))

(assert (=> b!755319 m!703001))

(declare-fun m!703007 () Bool)

(assert (=> b!755319 m!703007))

(assert (=> b!755315 m!703001))

(assert (=> b!755315 m!703001))

(declare-fun m!703009 () Bool)

(assert (=> b!755315 m!703009))

(declare-fun m!703011 () Bool)

(assert (=> b!755315 m!703011))

(declare-fun m!703013 () Bool)

(assert (=> b!755315 m!703013))

(assert (=> b!755325 m!703001))

(assert (=> b!755325 m!703001))

(declare-fun m!703015 () Bool)

(assert (=> b!755325 m!703015))

(assert (=> b!755325 m!703015))

(assert (=> b!755325 m!703001))

(declare-fun m!703017 () Bool)

(assert (=> b!755325 m!703017))

(assert (=> b!755326 m!703001))

(assert (=> b!755326 m!703001))

(assert (=> b!755326 m!703005))

(declare-fun m!703019 () Bool)

(assert (=> b!755332 m!703019))

(declare-fun m!703021 () Bool)

(assert (=> b!755332 m!703021))

(assert (=> b!755332 m!703019))

(declare-fun m!703023 () Bool)

(assert (=> b!755332 m!703023))

(assert (=> b!755332 m!702995))

(declare-fun m!703025 () Bool)

(assert (=> b!755332 m!703025))

(assert (=> b!755336 m!703001))

(assert (=> b!755336 m!703001))

(declare-fun m!703027 () Bool)

(assert (=> b!755336 m!703027))

(check-sat (not b!755335) (not b!755315) (not b!755330) (not b!755319) (not b!755320) (not b!755314) (not b!755333) (not b!755316) (not start!65738) (not b!755325) (not b!755331) (not b!755326) (not b!755332) (not b!755328) (not b!755336))
(check-sat)
