; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65504 () Bool)

(assert start!65504)

(declare-fun b!747480 () Bool)

(declare-fun e!417281 () Bool)

(declare-fun e!417284 () Bool)

(assert (=> b!747480 (= e!417281 e!417284)))

(declare-fun res!504184 () Bool)

(assert (=> b!747480 (=> (not res!504184) (not e!417284))))

(declare-datatypes ((SeekEntryResult!7558 0))(
  ( (MissingZero!7558 (index!32600 (_ BitVec 32))) (Found!7558 (index!32601 (_ BitVec 32))) (Intermediate!7558 (undefined!8370 Bool) (index!32602 (_ BitVec 32)) (x!63551 (_ BitVec 32))) (Undefined!7558) (MissingVacant!7558 (index!32603 (_ BitVec 32))) )
))
(declare-fun lt!332126 () SeekEntryResult!7558)

(declare-fun lt!332127 () SeekEntryResult!7558)

(assert (=> b!747480 (= res!504184 (= lt!332126 lt!332127))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41694 0))(
  ( (array!41695 (arr!19961 (Array (_ BitVec 32) (_ BitVec 64))) (size!20382 (_ BitVec 32))) )
))
(declare-fun lt!332133 () array!41694)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!332135 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41694 (_ BitVec 32)) SeekEntryResult!7558)

(assert (=> b!747480 (= lt!332127 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332135 lt!332133 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747480 (= lt!332126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332135 mask!3328) lt!332135 lt!332133 mask!3328))))

(declare-fun a!3186 () array!41694)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!747480 (= lt!332135 (select (store (arr!19961 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747480 (= lt!332133 (array!41695 (store (arr!19961 a!3186) i!1173 k0!2102) (size!20382 a!3186)))))

(declare-fun b!747481 () Bool)

(declare-fun res!504182 () Bool)

(declare-fun e!417287 () Bool)

(assert (=> b!747481 (=> (not res!504182) (not e!417287))))

(declare-fun arrayContainsKey!0 (array!41694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747481 (= res!504182 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747482 () Bool)

(declare-fun e!417289 () Bool)

(assert (=> b!747482 (= e!417287 e!417289)))

(declare-fun res!504190 () Bool)

(assert (=> b!747482 (=> (not res!504190) (not e!417289))))

(declare-fun lt!332128 () SeekEntryResult!7558)

(assert (=> b!747482 (= res!504190 (or (= lt!332128 (MissingZero!7558 i!1173)) (= lt!332128 (MissingVacant!7558 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41694 (_ BitVec 32)) SeekEntryResult!7558)

(assert (=> b!747482 (= lt!332128 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747483 () Bool)

(assert (=> b!747483 (= e!417289 e!417281)))

(declare-fun res!504181 () Bool)

(assert (=> b!747483 (=> (not res!504181) (not e!417281))))

(declare-fun lt!332132 () SeekEntryResult!7558)

(assert (=> b!747483 (= res!504181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19961 a!3186) j!159) mask!3328) (select (arr!19961 a!3186) j!159) a!3186 mask!3328) lt!332132))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747483 (= lt!332132 (Intermediate!7558 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747484 () Bool)

(declare-fun res!504188 () Bool)

(assert (=> b!747484 (=> (not res!504188) (not e!417287))))

(assert (=> b!747484 (= res!504188 (and (= (size!20382 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20382 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20382 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!417288 () Bool)

(declare-fun b!747485 () Bool)

(assert (=> b!747485 (= e!417288 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19961 a!3186) j!159) a!3186 mask!3328) lt!332132))))

(declare-fun b!747486 () Bool)

(declare-fun res!504189 () Bool)

(assert (=> b!747486 (=> (not res!504189) (not e!417287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747486 (= res!504189 (validKeyInArray!0 (select (arr!19961 a!3186) j!159)))))

(declare-fun b!747487 () Bool)

(declare-fun res!504179 () Bool)

(assert (=> b!747487 (=> (not res!504179) (not e!417281))))

(assert (=> b!747487 (= res!504179 e!417288)))

(declare-fun c!82031 () Bool)

(assert (=> b!747487 (= c!82031 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747488 () Bool)

(declare-fun res!504187 () Bool)

(assert (=> b!747488 (=> (not res!504187) (not e!417287))))

(assert (=> b!747488 (= res!504187 (validKeyInArray!0 k0!2102))))

(declare-fun b!747489 () Bool)

(declare-fun res!504191 () Bool)

(assert (=> b!747489 (=> (not res!504191) (not e!417289))))

(assert (=> b!747489 (= res!504191 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20382 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20382 a!3186))))))

(declare-fun res!504192 () Bool)

(assert (=> start!65504 (=> (not res!504192) (not e!417287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65504 (= res!504192 (validMask!0 mask!3328))))

(assert (=> start!65504 e!417287))

(assert (=> start!65504 true))

(declare-fun array_inv!15844 (array!41694) Bool)

(assert (=> start!65504 (array_inv!15844 a!3186)))

(declare-fun b!747490 () Bool)

(declare-fun res!504180 () Bool)

(declare-fun e!417283 () Bool)

(assert (=> b!747490 (=> res!504180 e!417283)))

(assert (=> b!747490 (= res!504180 (= (select (store (arr!19961 a!3186) i!1173 k0!2102) index!1321) lt!332135))))

(declare-fun b!747491 () Bool)

(declare-fun res!504183 () Bool)

(assert (=> b!747491 (=> (not res!504183) (not e!417289))))

(declare-datatypes ((List!14002 0))(
  ( (Nil!13999) (Cons!13998 (h!15070 (_ BitVec 64)) (t!20308 List!14002)) )
))
(declare-fun arrayNoDuplicates!0 (array!41694 (_ BitVec 32) List!14002) Bool)

(assert (=> b!747491 (= res!504183 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13999))))

(declare-fun b!747492 () Bool)

(declare-datatypes ((Unit!25592 0))(
  ( (Unit!25593) )
))
(declare-fun e!417286 () Unit!25592)

(declare-fun Unit!25594 () Unit!25592)

(assert (=> b!747492 (= e!417286 Unit!25594)))

(declare-fun e!417282 () Bool)

(declare-fun b!747493 () Bool)

(declare-fun lt!332129 () SeekEntryResult!7558)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41694 (_ BitVec 32)) SeekEntryResult!7558)

(assert (=> b!747493 (= e!417282 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19961 a!3186) j!159) a!3186 mask!3328) lt!332129))))

(declare-fun b!747494 () Bool)

(declare-fun res!504194 () Bool)

(assert (=> b!747494 (=> res!504194 e!417283)))

(assert (=> b!747494 (= res!504194 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19961 a!3186) j!159) a!3186 mask!3328) lt!332129)))))

(declare-fun b!747495 () Bool)

(assert (=> b!747495 (= e!417288 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19961 a!3186) j!159) a!3186 mask!3328) (Found!7558 j!159)))))

(declare-fun b!747496 () Bool)

(declare-fun Unit!25595 () Unit!25592)

(assert (=> b!747496 (= e!417286 Unit!25595)))

(assert (=> b!747496 false))

(declare-fun b!747497 () Bool)

(assert (=> b!747497 (= e!417284 (not e!417283))))

(declare-fun res!504186 () Bool)

(assert (=> b!747497 (=> res!504186 e!417283)))

(get-info :version)

(assert (=> b!747497 (= res!504186 (or (not ((_ is Intermediate!7558) lt!332127)) (bvslt x!1131 (x!63551 lt!332127)) (not (= x!1131 (x!63551 lt!332127))) (not (= index!1321 (index!32602 lt!332127)))))))

(assert (=> b!747497 e!417282))

(declare-fun res!504185 () Bool)

(assert (=> b!747497 (=> (not res!504185) (not e!417282))))

(declare-fun lt!332130 () SeekEntryResult!7558)

(assert (=> b!747497 (= res!504185 (= lt!332130 lt!332129))))

(assert (=> b!747497 (= lt!332129 (Found!7558 j!159))))

(assert (=> b!747497 (= lt!332130 (seekEntryOrOpen!0 (select (arr!19961 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41694 (_ BitVec 32)) Bool)

(assert (=> b!747497 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332131 () Unit!25592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25592)

(assert (=> b!747497 (= lt!332131 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747498 () Bool)

(declare-fun res!504193 () Bool)

(assert (=> b!747498 (=> (not res!504193) (not e!417281))))

(assert (=> b!747498 (= res!504193 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19961 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747499 () Bool)

(declare-fun res!504195 () Bool)

(assert (=> b!747499 (=> (not res!504195) (not e!417289))))

(assert (=> b!747499 (= res!504195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747500 () Bool)

(assert (=> b!747500 (= e!417283 true)))

(assert (=> b!747500 (= (select (store (arr!19961 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332134 () Unit!25592)

(assert (=> b!747500 (= lt!332134 e!417286)))

(declare-fun c!82032 () Bool)

(assert (=> b!747500 (= c!82032 (= (select (store (arr!19961 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65504 res!504192) b!747484))

(assert (= (and b!747484 res!504188) b!747486))

(assert (= (and b!747486 res!504189) b!747488))

(assert (= (and b!747488 res!504187) b!747481))

(assert (= (and b!747481 res!504182) b!747482))

(assert (= (and b!747482 res!504190) b!747499))

(assert (= (and b!747499 res!504195) b!747491))

(assert (= (and b!747491 res!504183) b!747489))

(assert (= (and b!747489 res!504191) b!747483))

(assert (= (and b!747483 res!504181) b!747498))

(assert (= (and b!747498 res!504193) b!747487))

(assert (= (and b!747487 c!82031) b!747485))

(assert (= (and b!747487 (not c!82031)) b!747495))

(assert (= (and b!747487 res!504179) b!747480))

(assert (= (and b!747480 res!504184) b!747497))

(assert (= (and b!747497 res!504185) b!747493))

(assert (= (and b!747497 (not res!504186)) b!747494))

(assert (= (and b!747494 (not res!504194)) b!747490))

(assert (= (and b!747490 (not res!504180)) b!747500))

(assert (= (and b!747500 c!82032) b!747496))

(assert (= (and b!747500 (not c!82032)) b!747492))

(declare-fun m!696983 () Bool)

(assert (=> b!747486 m!696983))

(assert (=> b!747486 m!696983))

(declare-fun m!696985 () Bool)

(assert (=> b!747486 m!696985))

(declare-fun m!696987 () Bool)

(assert (=> b!747480 m!696987))

(declare-fun m!696989 () Bool)

(assert (=> b!747480 m!696989))

(assert (=> b!747480 m!696989))

(declare-fun m!696991 () Bool)

(assert (=> b!747480 m!696991))

(declare-fun m!696993 () Bool)

(assert (=> b!747480 m!696993))

(declare-fun m!696995 () Bool)

(assert (=> b!747480 m!696995))

(assert (=> b!747497 m!696983))

(assert (=> b!747497 m!696983))

(declare-fun m!696997 () Bool)

(assert (=> b!747497 m!696997))

(declare-fun m!696999 () Bool)

(assert (=> b!747497 m!696999))

(declare-fun m!697001 () Bool)

(assert (=> b!747497 m!697001))

(declare-fun m!697003 () Bool)

(assert (=> b!747491 m!697003))

(assert (=> b!747493 m!696983))

(assert (=> b!747493 m!696983))

(declare-fun m!697005 () Bool)

(assert (=> b!747493 m!697005))

(declare-fun m!697007 () Bool)

(assert (=> b!747499 m!697007))

(declare-fun m!697009 () Bool)

(assert (=> b!747482 m!697009))

(declare-fun m!697011 () Bool)

(assert (=> b!747481 m!697011))

(declare-fun m!697013 () Bool)

(assert (=> b!747488 m!697013))

(declare-fun m!697015 () Bool)

(assert (=> b!747498 m!697015))

(assert (=> b!747494 m!696983))

(assert (=> b!747494 m!696983))

(declare-fun m!697017 () Bool)

(assert (=> b!747494 m!697017))

(assert (=> b!747485 m!696983))

(assert (=> b!747485 m!696983))

(declare-fun m!697019 () Bool)

(assert (=> b!747485 m!697019))

(assert (=> b!747500 m!696993))

(declare-fun m!697021 () Bool)

(assert (=> b!747500 m!697021))

(assert (=> b!747490 m!696993))

(assert (=> b!747490 m!697021))

(declare-fun m!697023 () Bool)

(assert (=> start!65504 m!697023))

(declare-fun m!697025 () Bool)

(assert (=> start!65504 m!697025))

(assert (=> b!747483 m!696983))

(assert (=> b!747483 m!696983))

(declare-fun m!697027 () Bool)

(assert (=> b!747483 m!697027))

(assert (=> b!747483 m!697027))

(assert (=> b!747483 m!696983))

(declare-fun m!697029 () Bool)

(assert (=> b!747483 m!697029))

(assert (=> b!747495 m!696983))

(assert (=> b!747495 m!696983))

(assert (=> b!747495 m!697017))

(check-sat (not b!747485) (not b!747495) (not b!747483) (not start!65504) (not b!747491) (not b!747499) (not b!747482) (not b!747481) (not b!747480) (not b!747486) (not b!747497) (not b!747493) (not b!747494) (not b!747488))
(check-sat)
