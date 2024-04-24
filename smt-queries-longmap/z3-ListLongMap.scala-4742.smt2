; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65640 () Bool)

(assert start!65640)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41683 0))(
  ( (array!41684 (arr!19951 (Array (_ BitVec 32) (_ BitVec 64))) (size!20371 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41683)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!748088 () Bool)

(declare-datatypes ((SeekEntryResult!7507 0))(
  ( (MissingZero!7507 (index!32396 (_ BitVec 32))) (Found!7507 (index!32397 (_ BitVec 32))) (Intermediate!7507 (undefined!8319 Bool) (index!32398 (_ BitVec 32)) (x!63501 (_ BitVec 32))) (Undefined!7507) (MissingVacant!7507 (index!32399 (_ BitVec 32))) )
))
(declare-fun lt!332505 () SeekEntryResult!7507)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!417749 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41683 (_ BitVec 32)) SeekEntryResult!7507)

(assert (=> b!748088 (= e!417749 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19951 a!3186) j!159) a!3186 mask!3328) lt!332505))))

(declare-fun b!748089 () Bool)

(declare-datatypes ((Unit!25585 0))(
  ( (Unit!25586) )
))
(declare-fun e!417747 () Unit!25585)

(declare-fun Unit!25587 () Unit!25585)

(assert (=> b!748089 (= e!417747 Unit!25587)))

(declare-fun b!748090 () Bool)

(declare-fun res!504291 () Bool)

(declare-fun e!417745 () Bool)

(assert (=> b!748090 (=> (not res!504291) (not e!417745))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748090 (= res!504291 (and (= (size!20371 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20371 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20371 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748091 () Bool)

(declare-fun res!504279 () Bool)

(assert (=> b!748091 (=> (not res!504279) (not e!417745))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748091 (= res!504279 (validKeyInArray!0 k0!2102))))

(declare-fun b!748092 () Bool)

(declare-fun e!417744 () Bool)

(assert (=> b!748092 (= e!417745 e!417744)))

(declare-fun res!504287 () Bool)

(assert (=> b!748092 (=> (not res!504287) (not e!417744))))

(declare-fun lt!332502 () SeekEntryResult!7507)

(assert (=> b!748092 (= res!504287 (or (= lt!332502 (MissingZero!7507 i!1173)) (= lt!332502 (MissingVacant!7507 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41683 (_ BitVec 32)) SeekEntryResult!7507)

(assert (=> b!748092 (= lt!332502 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748093 () Bool)

(declare-fun res!504285 () Bool)

(declare-fun e!417743 () Bool)

(assert (=> b!748093 (=> (not res!504285) (not e!417743))))

(declare-fun e!417746 () Bool)

(assert (=> b!748093 (= res!504285 e!417746)))

(declare-fun c!82288 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!748093 (= c!82288 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!332508 () SeekEntryResult!7507)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!748094 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41683 (_ BitVec 32)) SeekEntryResult!7507)

(assert (=> b!748094 (= e!417746 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19951 a!3186) j!159) a!3186 mask!3328) lt!332508))))

(declare-fun b!748095 () Bool)

(declare-fun Unit!25588 () Unit!25585)

(assert (=> b!748095 (= e!417747 Unit!25588)))

(assert (=> b!748095 false))

(declare-fun b!748096 () Bool)

(declare-fun res!504295 () Bool)

(assert (=> b!748096 (=> (not res!504295) (not e!417744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41683 (_ BitVec 32)) Bool)

(assert (=> b!748096 (= res!504295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748097 () Bool)

(declare-fun e!417750 () Bool)

(assert (=> b!748097 (= e!417743 e!417750)))

(declare-fun res!504284 () Bool)

(assert (=> b!748097 (=> (not res!504284) (not e!417750))))

(declare-fun lt!332504 () SeekEntryResult!7507)

(declare-fun lt!332501 () SeekEntryResult!7507)

(assert (=> b!748097 (= res!504284 (= lt!332504 lt!332501))))

(declare-fun lt!332506 () (_ BitVec 64))

(declare-fun lt!332507 () array!41683)

(assert (=> b!748097 (= lt!332501 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332506 lt!332507 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748097 (= lt!332504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332506 mask!3328) lt!332506 lt!332507 mask!3328))))

(assert (=> b!748097 (= lt!332506 (select (store (arr!19951 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748097 (= lt!332507 (array!41684 (store (arr!19951 a!3186) i!1173 k0!2102) (size!20371 a!3186)))))

(declare-fun b!748098 () Bool)

(declare-fun res!504289 () Bool)

(declare-fun e!417748 () Bool)

(assert (=> b!748098 (=> res!504289 e!417748)))

(assert (=> b!748098 (= res!504289 (= (select (store (arr!19951 a!3186) i!1173 k0!2102) index!1321) lt!332506))))

(declare-fun res!504283 () Bool)

(assert (=> start!65640 (=> (not res!504283) (not e!417745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65640 (= res!504283 (validMask!0 mask!3328))))

(assert (=> start!65640 e!417745))

(assert (=> start!65640 true))

(declare-fun array_inv!15810 (array!41683) Bool)

(assert (=> start!65640 (array_inv!15810 a!3186)))

(declare-fun b!748099 () Bool)

(declare-fun res!504280 () Bool)

(assert (=> b!748099 (=> (not res!504280) (not e!417744))))

(declare-datatypes ((List!13860 0))(
  ( (Nil!13857) (Cons!13856 (h!14934 (_ BitVec 64)) (t!20167 List!13860)) )
))
(declare-fun arrayNoDuplicates!0 (array!41683 (_ BitVec 32) List!13860) Bool)

(assert (=> b!748099 (= res!504280 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13857))))

(declare-fun b!748100 () Bool)

(assert (=> b!748100 (= e!417750 (not e!417748))))

(declare-fun res!504290 () Bool)

(assert (=> b!748100 (=> res!504290 e!417748)))

(get-info :version)

(assert (=> b!748100 (= res!504290 (or (not ((_ is Intermediate!7507) lt!332501)) (bvslt x!1131 (x!63501 lt!332501)) (not (= x!1131 (x!63501 lt!332501))) (not (= index!1321 (index!32398 lt!332501)))))))

(assert (=> b!748100 e!417749))

(declare-fun res!504294 () Bool)

(assert (=> b!748100 (=> (not res!504294) (not e!417749))))

(declare-fun lt!332503 () SeekEntryResult!7507)

(assert (=> b!748100 (= res!504294 (= lt!332503 lt!332505))))

(assert (=> b!748100 (= lt!332505 (Found!7507 j!159))))

(assert (=> b!748100 (= lt!332503 (seekEntryOrOpen!0 (select (arr!19951 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748100 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332500 () Unit!25585)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25585)

(assert (=> b!748100 (= lt!332500 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748101 () Bool)

(declare-fun res!504293 () Bool)

(assert (=> b!748101 (=> (not res!504293) (not e!417743))))

(assert (=> b!748101 (= res!504293 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19951 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748102 () Bool)

(declare-fun res!504282 () Bool)

(assert (=> b!748102 (=> (not res!504282) (not e!417745))))

(declare-fun arrayContainsKey!0 (array!41683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748102 (= res!504282 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748103 () Bool)

(declare-fun res!504281 () Bool)

(assert (=> b!748103 (=> (not res!504281) (not e!417744))))

(assert (=> b!748103 (= res!504281 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20371 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20371 a!3186))))))

(declare-fun b!748104 () Bool)

(assert (=> b!748104 (= e!417748 true)))

(assert (=> b!748104 (= (select (store (arr!19951 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332499 () Unit!25585)

(assert (=> b!748104 (= lt!332499 e!417747)))

(declare-fun c!82289 () Bool)

(assert (=> b!748104 (= c!82289 (= (select (store (arr!19951 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748105 () Bool)

(assert (=> b!748105 (= e!417744 e!417743)))

(declare-fun res!504288 () Bool)

(assert (=> b!748105 (=> (not res!504288) (not e!417743))))

(assert (=> b!748105 (= res!504288 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19951 a!3186) j!159) mask!3328) (select (arr!19951 a!3186) j!159) a!3186 mask!3328) lt!332508))))

(assert (=> b!748105 (= lt!332508 (Intermediate!7507 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748106 () Bool)

(assert (=> b!748106 (= e!417746 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19951 a!3186) j!159) a!3186 mask!3328) (Found!7507 j!159)))))

(declare-fun b!748107 () Bool)

(declare-fun res!504286 () Bool)

(assert (=> b!748107 (=> (not res!504286) (not e!417745))))

(assert (=> b!748107 (= res!504286 (validKeyInArray!0 (select (arr!19951 a!3186) j!159)))))

(declare-fun b!748108 () Bool)

(declare-fun res!504292 () Bool)

(assert (=> b!748108 (=> res!504292 e!417748)))

(assert (=> b!748108 (= res!504292 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19951 a!3186) j!159) a!3186 mask!3328) lt!332505)))))

(assert (= (and start!65640 res!504283) b!748090))

(assert (= (and b!748090 res!504291) b!748107))

(assert (= (and b!748107 res!504286) b!748091))

(assert (= (and b!748091 res!504279) b!748102))

(assert (= (and b!748102 res!504282) b!748092))

(assert (= (and b!748092 res!504287) b!748096))

(assert (= (and b!748096 res!504295) b!748099))

(assert (= (and b!748099 res!504280) b!748103))

(assert (= (and b!748103 res!504281) b!748105))

(assert (= (and b!748105 res!504288) b!748101))

(assert (= (and b!748101 res!504293) b!748093))

(assert (= (and b!748093 c!82288) b!748094))

(assert (= (and b!748093 (not c!82288)) b!748106))

(assert (= (and b!748093 res!504285) b!748097))

(assert (= (and b!748097 res!504284) b!748100))

(assert (= (and b!748100 res!504294) b!748088))

(assert (= (and b!748100 (not res!504290)) b!748108))

(assert (= (and b!748108 (not res!504292)) b!748098))

(assert (= (and b!748098 (not res!504289)) b!748104))

(assert (= (and b!748104 c!82289) b!748095))

(assert (= (and b!748104 (not c!82289)) b!748089))

(declare-fun m!698607 () Bool)

(assert (=> b!748092 m!698607))

(declare-fun m!698609 () Bool)

(assert (=> start!65640 m!698609))

(declare-fun m!698611 () Bool)

(assert (=> start!65640 m!698611))

(declare-fun m!698613 () Bool)

(assert (=> b!748104 m!698613))

(declare-fun m!698615 () Bool)

(assert (=> b!748104 m!698615))

(declare-fun m!698617 () Bool)

(assert (=> b!748108 m!698617))

(assert (=> b!748108 m!698617))

(declare-fun m!698619 () Bool)

(assert (=> b!748108 m!698619))

(assert (=> b!748094 m!698617))

(assert (=> b!748094 m!698617))

(declare-fun m!698621 () Bool)

(assert (=> b!748094 m!698621))

(declare-fun m!698623 () Bool)

(assert (=> b!748096 m!698623))

(assert (=> b!748088 m!698617))

(assert (=> b!748088 m!698617))

(declare-fun m!698625 () Bool)

(assert (=> b!748088 m!698625))

(declare-fun m!698627 () Bool)

(assert (=> b!748102 m!698627))

(declare-fun m!698629 () Bool)

(assert (=> b!748091 m!698629))

(assert (=> b!748098 m!698613))

(assert (=> b!748098 m!698615))

(assert (=> b!748100 m!698617))

(assert (=> b!748100 m!698617))

(declare-fun m!698631 () Bool)

(assert (=> b!748100 m!698631))

(declare-fun m!698633 () Bool)

(assert (=> b!748100 m!698633))

(declare-fun m!698635 () Bool)

(assert (=> b!748100 m!698635))

(assert (=> b!748107 m!698617))

(assert (=> b!748107 m!698617))

(declare-fun m!698637 () Bool)

(assert (=> b!748107 m!698637))

(assert (=> b!748106 m!698617))

(assert (=> b!748106 m!698617))

(assert (=> b!748106 m!698619))

(declare-fun m!698639 () Bool)

(assert (=> b!748099 m!698639))

(assert (=> b!748105 m!698617))

(assert (=> b!748105 m!698617))

(declare-fun m!698641 () Bool)

(assert (=> b!748105 m!698641))

(assert (=> b!748105 m!698641))

(assert (=> b!748105 m!698617))

(declare-fun m!698643 () Bool)

(assert (=> b!748105 m!698643))

(declare-fun m!698645 () Bool)

(assert (=> b!748101 m!698645))

(declare-fun m!698647 () Bool)

(assert (=> b!748097 m!698647))

(declare-fun m!698649 () Bool)

(assert (=> b!748097 m!698649))

(assert (=> b!748097 m!698647))

(assert (=> b!748097 m!698613))

(declare-fun m!698651 () Bool)

(assert (=> b!748097 m!698651))

(declare-fun m!698653 () Bool)

(assert (=> b!748097 m!698653))

(check-sat (not b!748099) (not b!748106) (not b!748097) (not start!65640) (not b!748107) (not b!748102) (not b!748100) (not b!748091) (not b!748092) (not b!748096) (not b!748094) (not b!748088) (not b!748108) (not b!748105))
(check-sat)
