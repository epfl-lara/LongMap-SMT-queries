; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65182 () Bool)

(assert start!65182)

(declare-fun b!737332 () Bool)

(declare-datatypes ((Unit!25160 0))(
  ( (Unit!25161) )
))
(declare-fun e!412420 () Unit!25160)

(declare-fun Unit!25162 () Unit!25160)

(assert (=> b!737332 (= e!412420 Unit!25162)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41355 0))(
  ( (array!41356 (arr!19791 (Array (_ BitVec 32) (_ BitVec 64))) (size!20212 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41355)

(declare-datatypes ((SeekEntryResult!7391 0))(
  ( (MissingZero!7391 (index!31932 (_ BitVec 32))) (Found!7391 (index!31933 (_ BitVec 32))) (Intermediate!7391 (undefined!8203 Bool) (index!31934 (_ BitVec 32)) (x!62933 (_ BitVec 32))) (Undefined!7391) (MissingVacant!7391 (index!31935 (_ BitVec 32))) )
))
(declare-fun lt!327119 () SeekEntryResult!7391)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41355 (_ BitVec 32)) SeekEntryResult!7391)

(assert (=> b!737332 (= lt!327119 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19791 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327118 () SeekEntryResult!7391)

(declare-fun lt!327131 () (_ BitVec 32))

(assert (=> b!737332 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327131 resIntermediateIndex!5 (select (arr!19791 a!3186) j!159) a!3186 mask!3328) lt!327118)))

(declare-fun b!737333 () Bool)

(declare-fun res!495598 () Bool)

(declare-fun e!412430 () Bool)

(assert (=> b!737333 (=> (not res!495598) (not e!412430))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737333 (= res!495598 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19791 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737334 () Bool)

(declare-fun res!495597 () Bool)

(assert (=> b!737334 (=> (not res!495597) (not e!412430))))

(declare-fun e!412421 () Bool)

(assert (=> b!737334 (= res!495597 e!412421)))

(declare-fun c!81250 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737334 (= c!81250 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!327121 () SeekEntryResult!7391)

(declare-fun b!737335 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41355 (_ BitVec 32)) SeekEntryResult!7391)

(assert (=> b!737335 (= e!412421 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19791 a!3186) j!159) a!3186 mask!3328) lt!327121))))

(declare-fun b!737336 () Bool)

(declare-fun e!412426 () Bool)

(declare-fun e!412422 () Bool)

(assert (=> b!737336 (= e!412426 e!412422)))

(declare-fun res!495602 () Bool)

(assert (=> b!737336 (=> (not res!495602) (not e!412422))))

(declare-fun lt!327120 () SeekEntryResult!7391)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41355 (_ BitVec 32)) SeekEntryResult!7391)

(assert (=> b!737336 (= res!495602 (= (seekEntryOrOpen!0 (select (arr!19791 a!3186) j!159) a!3186 mask!3328) lt!327120))))

(assert (=> b!737336 (= lt!327120 (Found!7391 j!159))))

(declare-fun b!737337 () Bool)

(declare-fun Unit!25163 () Unit!25160)

(assert (=> b!737337 (= e!412420 Unit!25163)))

(assert (=> b!737337 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327131 (select (arr!19791 a!3186) j!159) a!3186 mask!3328) lt!327121)))

(declare-fun b!737339 () Bool)

(declare-fun res!495600 () Bool)

(declare-fun e!412424 () Bool)

(assert (=> b!737339 (=> (not res!495600) (not e!412424))))

(assert (=> b!737339 (= res!495600 (and (= (size!20212 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20212 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20212 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737340 () Bool)

(declare-fun res!495614 () Bool)

(declare-fun e!412425 () Bool)

(assert (=> b!737340 (=> (not res!495614) (not e!412425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41355 (_ BitVec 32)) Bool)

(assert (=> b!737340 (= res!495614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!412419 () Bool)

(declare-fun b!737341 () Bool)

(assert (=> b!737341 (= e!412419 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327131 (select (arr!19791 a!3186) j!159) a!3186 mask!3328) lt!327121)))))

(declare-fun b!737342 () Bool)

(declare-fun e!412429 () Bool)

(assert (=> b!737342 (= e!412430 e!412429)))

(declare-fun res!495603 () Bool)

(assert (=> b!737342 (=> (not res!495603) (not e!412429))))

(declare-fun lt!327124 () SeekEntryResult!7391)

(declare-fun lt!327128 () SeekEntryResult!7391)

(assert (=> b!737342 (= res!495603 (= lt!327124 lt!327128))))

(declare-fun lt!327129 () array!41355)

(declare-fun lt!327123 () (_ BitVec 64))

(assert (=> b!737342 (= lt!327128 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327123 lt!327129 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737342 (= lt!327124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327123 mask!3328) lt!327123 lt!327129 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!737342 (= lt!327123 (select (store (arr!19791 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!737342 (= lt!327129 (array!41356 (store (arr!19791 a!3186) i!1173 k!2102) (size!20212 a!3186)))))

(declare-fun b!737343 () Bool)

(declare-fun res!495608 () Bool)

(declare-fun e!412428 () Bool)

(assert (=> b!737343 (=> res!495608 e!412428)))

(assert (=> b!737343 (= res!495608 e!412419)))

(declare-fun c!81249 () Bool)

(declare-fun lt!327130 () Bool)

(assert (=> b!737343 (= c!81249 lt!327130)))

(declare-fun b!737344 () Bool)

(declare-fun e!412423 () Bool)

(assert (=> b!737344 (= e!412423 e!412428)))

(declare-fun res!495605 () Bool)

(assert (=> b!737344 (=> res!495605 e!412428)))

(assert (=> b!737344 (= res!495605 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327131 #b00000000000000000000000000000000) (bvsge lt!327131 (size!20212 a!3186))))))

(declare-fun lt!327122 () Unit!25160)

(assert (=> b!737344 (= lt!327122 e!412420)))

(declare-fun c!81248 () Bool)

(assert (=> b!737344 (= c!81248 lt!327130)))

(assert (=> b!737344 (= lt!327130 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737344 (= lt!327131 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737345 () Bool)

(assert (=> b!737345 (= e!412425 e!412430)))

(declare-fun res!495613 () Bool)

(assert (=> b!737345 (=> (not res!495613) (not e!412430))))

(assert (=> b!737345 (= res!495613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19791 a!3186) j!159) mask!3328) (select (arr!19791 a!3186) j!159) a!3186 mask!3328) lt!327121))))

(assert (=> b!737345 (= lt!327121 (Intermediate!7391 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737346 () Bool)

(assert (=> b!737346 (= e!412419 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327131 resIntermediateIndex!5 (select (arr!19791 a!3186) j!159) a!3186 mask!3328) lt!327118)))))

(declare-fun b!737347 () Bool)

(declare-fun res!495610 () Bool)

(assert (=> b!737347 (=> (not res!495610) (not e!412425))))

(assert (=> b!737347 (= res!495610 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20212 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20212 a!3186))))))

(declare-fun b!737348 () Bool)

(assert (=> b!737348 (= e!412429 (not e!412423))))

(declare-fun res!495601 () Bool)

(assert (=> b!737348 (=> res!495601 e!412423)))

(assert (=> b!737348 (= res!495601 (or (not (is-Intermediate!7391 lt!327128)) (bvsge x!1131 (x!62933 lt!327128))))))

(assert (=> b!737348 (= lt!327118 (Found!7391 j!159))))

(assert (=> b!737348 e!412426))

(declare-fun res!495606 () Bool)

(assert (=> b!737348 (=> (not res!495606) (not e!412426))))

(assert (=> b!737348 (= res!495606 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327125 () Unit!25160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25160)

(assert (=> b!737348 (= lt!327125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737349 () Bool)

(assert (=> b!737349 (= e!412422 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19791 a!3186) j!159) a!3186 mask!3328) lt!327120))))

(declare-fun b!737350 () Bool)

(assert (=> b!737350 (= e!412421 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19791 a!3186) j!159) a!3186 mask!3328) (Found!7391 j!159)))))

(declare-fun b!737351 () Bool)

(declare-fun res!495609 () Bool)

(assert (=> b!737351 (=> (not res!495609) (not e!412425))))

(declare-datatypes ((List!13793 0))(
  ( (Nil!13790) (Cons!13789 (h!14861 (_ BitVec 64)) (t!20108 List!13793)) )
))
(declare-fun arrayNoDuplicates!0 (array!41355 (_ BitVec 32) List!13793) Bool)

(assert (=> b!737351 (= res!495609 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13790))))

(declare-fun b!737352 () Bool)

(declare-fun res!495611 () Bool)

(assert (=> b!737352 (=> (not res!495611) (not e!412424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737352 (= res!495611 (validKeyInArray!0 (select (arr!19791 a!3186) j!159)))))

(declare-fun b!737353 () Bool)

(declare-fun res!495599 () Bool)

(assert (=> b!737353 (=> (not res!495599) (not e!412424))))

(declare-fun arrayContainsKey!0 (array!41355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737353 (= res!495599 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!495604 () Bool)

(assert (=> start!65182 (=> (not res!495604) (not e!412424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65182 (= res!495604 (validMask!0 mask!3328))))

(assert (=> start!65182 e!412424))

(assert (=> start!65182 true))

(declare-fun array_inv!15587 (array!41355) Bool)

(assert (=> start!65182 (array_inv!15587 a!3186)))

(declare-fun b!737338 () Bool)

(declare-fun res!495607 () Bool)

(assert (=> b!737338 (=> (not res!495607) (not e!412424))))

(assert (=> b!737338 (= res!495607 (validKeyInArray!0 k!2102))))

(declare-fun b!737354 () Bool)

(assert (=> b!737354 (= e!412428 true)))

(declare-fun lt!327126 () SeekEntryResult!7391)

(assert (=> b!737354 (= lt!327126 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327131 lt!327123 lt!327129 mask!3328))))

(declare-fun b!737355 () Bool)

(assert (=> b!737355 (= e!412424 e!412425)))

(declare-fun res!495612 () Bool)

(assert (=> b!737355 (=> (not res!495612) (not e!412425))))

(declare-fun lt!327127 () SeekEntryResult!7391)

(assert (=> b!737355 (= res!495612 (or (= lt!327127 (MissingZero!7391 i!1173)) (= lt!327127 (MissingVacant!7391 i!1173))))))

(assert (=> b!737355 (= lt!327127 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65182 res!495604) b!737339))

(assert (= (and b!737339 res!495600) b!737352))

(assert (= (and b!737352 res!495611) b!737338))

(assert (= (and b!737338 res!495607) b!737353))

(assert (= (and b!737353 res!495599) b!737355))

(assert (= (and b!737355 res!495612) b!737340))

(assert (= (and b!737340 res!495614) b!737351))

(assert (= (and b!737351 res!495609) b!737347))

(assert (= (and b!737347 res!495610) b!737345))

(assert (= (and b!737345 res!495613) b!737333))

(assert (= (and b!737333 res!495598) b!737334))

(assert (= (and b!737334 c!81250) b!737335))

(assert (= (and b!737334 (not c!81250)) b!737350))

(assert (= (and b!737334 res!495597) b!737342))

(assert (= (and b!737342 res!495603) b!737348))

(assert (= (and b!737348 res!495606) b!737336))

(assert (= (and b!737336 res!495602) b!737349))

(assert (= (and b!737348 (not res!495601)) b!737344))

(assert (= (and b!737344 c!81248) b!737337))

(assert (= (and b!737344 (not c!81248)) b!737332))

(assert (= (and b!737344 (not res!495605)) b!737343))

(assert (= (and b!737343 c!81249) b!737341))

(assert (= (and b!737343 (not c!81249)) b!737346))

(assert (= (and b!737343 (not res!495608)) b!737354))

(declare-fun m!689239 () Bool)

(assert (=> start!65182 m!689239))

(declare-fun m!689241 () Bool)

(assert (=> start!65182 m!689241))

(declare-fun m!689243 () Bool)

(assert (=> b!737333 m!689243))

(declare-fun m!689245 () Bool)

(assert (=> b!737344 m!689245))

(declare-fun m!689247 () Bool)

(assert (=> b!737340 m!689247))

(declare-fun m!689249 () Bool)

(assert (=> b!737351 m!689249))

(declare-fun m!689251 () Bool)

(assert (=> b!737338 m!689251))

(declare-fun m!689253 () Bool)

(assert (=> b!737345 m!689253))

(assert (=> b!737345 m!689253))

(declare-fun m!689255 () Bool)

(assert (=> b!737345 m!689255))

(assert (=> b!737345 m!689255))

(assert (=> b!737345 m!689253))

(declare-fun m!689257 () Bool)

(assert (=> b!737345 m!689257))

(assert (=> b!737335 m!689253))

(assert (=> b!737335 m!689253))

(declare-fun m!689259 () Bool)

(assert (=> b!737335 m!689259))

(assert (=> b!737336 m!689253))

(assert (=> b!737336 m!689253))

(declare-fun m!689261 () Bool)

(assert (=> b!737336 m!689261))

(declare-fun m!689263 () Bool)

(assert (=> b!737353 m!689263))

(assert (=> b!737350 m!689253))

(assert (=> b!737350 m!689253))

(declare-fun m!689265 () Bool)

(assert (=> b!737350 m!689265))

(declare-fun m!689267 () Bool)

(assert (=> b!737355 m!689267))

(assert (=> b!737337 m!689253))

(assert (=> b!737337 m!689253))

(declare-fun m!689269 () Bool)

(assert (=> b!737337 m!689269))

(assert (=> b!737346 m!689253))

(assert (=> b!737346 m!689253))

(declare-fun m!689271 () Bool)

(assert (=> b!737346 m!689271))

(assert (=> b!737332 m!689253))

(assert (=> b!737332 m!689253))

(assert (=> b!737332 m!689265))

(assert (=> b!737332 m!689253))

(assert (=> b!737332 m!689271))

(declare-fun m!689273 () Bool)

(assert (=> b!737354 m!689273))

(assert (=> b!737352 m!689253))

(assert (=> b!737352 m!689253))

(declare-fun m!689275 () Bool)

(assert (=> b!737352 m!689275))

(declare-fun m!689277 () Bool)

(assert (=> b!737342 m!689277))

(declare-fun m!689279 () Bool)

(assert (=> b!737342 m!689279))

(declare-fun m!689281 () Bool)

(assert (=> b!737342 m!689281))

(declare-fun m!689283 () Bool)

(assert (=> b!737342 m!689283))

(assert (=> b!737342 m!689277))

(declare-fun m!689285 () Bool)

(assert (=> b!737342 m!689285))

(declare-fun m!689287 () Bool)

(assert (=> b!737348 m!689287))

(declare-fun m!689289 () Bool)

(assert (=> b!737348 m!689289))

(assert (=> b!737341 m!689253))

(assert (=> b!737341 m!689253))

(assert (=> b!737341 m!689269))

(assert (=> b!737349 m!689253))

(assert (=> b!737349 m!689253))

(declare-fun m!689291 () Bool)

(assert (=> b!737349 m!689291))

(push 1)

