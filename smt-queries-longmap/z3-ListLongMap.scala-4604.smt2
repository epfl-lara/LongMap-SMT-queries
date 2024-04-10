; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64260 () Bool)

(assert start!64260)

(declare-fun res!483338 () Bool)

(declare-fun e!404573 () Bool)

(assert (=> start!64260 (=> (not res!483338) (not e!404573))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64260 (= res!483338 (validMask!0 mask!3328))))

(assert (=> start!64260 e!404573))

(assert (=> start!64260 true))

(declare-datatypes ((array!40841 0))(
  ( (array!40842 (arr!19543 (Array (_ BitVec 32) (_ BitVec 64))) (size!19964 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40841)

(declare-fun array_inv!15339 (array!40841) Bool)

(assert (=> start!64260 (array_inv!15339 a!3186)))

(declare-fun b!721478 () Bool)

(declare-fun res!483331 () Bool)

(assert (=> b!721478 (=> (not res!483331) (not e!404573))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721478 (= res!483331 (and (= (size!19964 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19964 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19964 a!3186)) (not (= i!1173 j!159))))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721479 () Bool)

(declare-fun e!404576 () Bool)

(declare-datatypes ((SeekEntryResult!7143 0))(
  ( (MissingZero!7143 (index!30940 (_ BitVec 32))) (Found!7143 (index!30941 (_ BitVec 32))) (Intermediate!7143 (undefined!7955 Bool) (index!30942 (_ BitVec 32)) (x!61952 (_ BitVec 32))) (Undefined!7143) (MissingVacant!7143 (index!30943 (_ BitVec 32))) )
))
(declare-fun lt!320092 () SeekEntryResult!7143)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40841 (_ BitVec 32)) SeekEntryResult!7143)

(assert (=> b!721479 (= e!404576 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19543 a!3186) j!159) a!3186 mask!3328) lt!320092))))

(declare-fun b!721480 () Bool)

(declare-fun res!483328 () Bool)

(assert (=> b!721480 (=> (not res!483328) (not e!404573))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721480 (= res!483328 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721481 () Bool)

(declare-fun e!404575 () Bool)

(assert (=> b!721481 (= e!404575 false)))

(declare-fun lt!320093 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721481 (= lt!320093 (toIndex!0 (select (store (arr!19543 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!721482 () Bool)

(declare-fun res!483335 () Bool)

(assert (=> b!721482 (=> (not res!483335) (not e!404575))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!721482 (= res!483335 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19543 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721483 () Bool)

(declare-fun e!404572 () Bool)

(assert (=> b!721483 (= e!404573 e!404572)))

(declare-fun res!483337 () Bool)

(assert (=> b!721483 (=> (not res!483337) (not e!404572))))

(declare-fun lt!320091 () SeekEntryResult!7143)

(assert (=> b!721483 (= res!483337 (or (= lt!320091 (MissingZero!7143 i!1173)) (= lt!320091 (MissingVacant!7143 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40841 (_ BitVec 32)) SeekEntryResult!7143)

(assert (=> b!721483 (= lt!320091 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721484 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40841 (_ BitVec 32)) SeekEntryResult!7143)

(assert (=> b!721484 (= e!404576 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19543 a!3186) j!159) a!3186 mask!3328) (Found!7143 j!159)))))

(declare-fun b!721485 () Bool)

(declare-fun res!483330 () Bool)

(assert (=> b!721485 (=> (not res!483330) (not e!404572))))

(declare-datatypes ((List!13545 0))(
  ( (Nil!13542) (Cons!13541 (h!14595 (_ BitVec 64)) (t!19860 List!13545)) )
))
(declare-fun arrayNoDuplicates!0 (array!40841 (_ BitVec 32) List!13545) Bool)

(assert (=> b!721485 (= res!483330 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13542))))

(declare-fun b!721486 () Bool)

(declare-fun res!483329 () Bool)

(assert (=> b!721486 (=> (not res!483329) (not e!404572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40841 (_ BitVec 32)) Bool)

(assert (=> b!721486 (= res!483329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721487 () Bool)

(assert (=> b!721487 (= e!404572 e!404575)))

(declare-fun res!483332 () Bool)

(assert (=> b!721487 (=> (not res!483332) (not e!404575))))

(assert (=> b!721487 (= res!483332 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19543 a!3186) j!159) mask!3328) (select (arr!19543 a!3186) j!159) a!3186 mask!3328) lt!320092))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721487 (= lt!320092 (Intermediate!7143 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721488 () Bool)

(declare-fun res!483334 () Bool)

(assert (=> b!721488 (=> (not res!483334) (not e!404573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721488 (= res!483334 (validKeyInArray!0 k0!2102))))

(declare-fun b!721489 () Bool)

(declare-fun res!483333 () Bool)

(assert (=> b!721489 (=> (not res!483333) (not e!404575))))

(assert (=> b!721489 (= res!483333 e!404576)))

(declare-fun c!79447 () Bool)

(assert (=> b!721489 (= c!79447 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721490 () Bool)

(declare-fun res!483327 () Bool)

(assert (=> b!721490 (=> (not res!483327) (not e!404573))))

(assert (=> b!721490 (= res!483327 (validKeyInArray!0 (select (arr!19543 a!3186) j!159)))))

(declare-fun b!721491 () Bool)

(declare-fun res!483336 () Bool)

(assert (=> b!721491 (=> (not res!483336) (not e!404572))))

(assert (=> b!721491 (= res!483336 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19964 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19964 a!3186))))))

(assert (= (and start!64260 res!483338) b!721478))

(assert (= (and b!721478 res!483331) b!721490))

(assert (= (and b!721490 res!483327) b!721488))

(assert (= (and b!721488 res!483334) b!721480))

(assert (= (and b!721480 res!483328) b!721483))

(assert (= (and b!721483 res!483337) b!721486))

(assert (= (and b!721486 res!483329) b!721485))

(assert (= (and b!721485 res!483330) b!721491))

(assert (= (and b!721491 res!483336) b!721487))

(assert (= (and b!721487 res!483332) b!721482))

(assert (= (and b!721482 res!483335) b!721489))

(assert (= (and b!721489 c!79447) b!721479))

(assert (= (and b!721489 (not c!79447)) b!721484))

(assert (= (and b!721489 res!483333) b!721481))

(declare-fun m!676265 () Bool)

(assert (=> b!721490 m!676265))

(assert (=> b!721490 m!676265))

(declare-fun m!676267 () Bool)

(assert (=> b!721490 m!676267))

(declare-fun m!676269 () Bool)

(assert (=> b!721488 m!676269))

(declare-fun m!676271 () Bool)

(assert (=> b!721485 m!676271))

(assert (=> b!721479 m!676265))

(assert (=> b!721479 m!676265))

(declare-fun m!676273 () Bool)

(assert (=> b!721479 m!676273))

(declare-fun m!676275 () Bool)

(assert (=> b!721480 m!676275))

(declare-fun m!676277 () Bool)

(assert (=> start!64260 m!676277))

(declare-fun m!676279 () Bool)

(assert (=> start!64260 m!676279))

(declare-fun m!676281 () Bool)

(assert (=> b!721482 m!676281))

(assert (=> b!721487 m!676265))

(assert (=> b!721487 m!676265))

(declare-fun m!676283 () Bool)

(assert (=> b!721487 m!676283))

(assert (=> b!721487 m!676283))

(assert (=> b!721487 m!676265))

(declare-fun m!676285 () Bool)

(assert (=> b!721487 m!676285))

(declare-fun m!676287 () Bool)

(assert (=> b!721486 m!676287))

(declare-fun m!676289 () Bool)

(assert (=> b!721481 m!676289))

(declare-fun m!676291 () Bool)

(assert (=> b!721481 m!676291))

(assert (=> b!721481 m!676291))

(declare-fun m!676293 () Bool)

(assert (=> b!721481 m!676293))

(declare-fun m!676295 () Bool)

(assert (=> b!721483 m!676295))

(assert (=> b!721484 m!676265))

(assert (=> b!721484 m!676265))

(declare-fun m!676297 () Bool)

(assert (=> b!721484 m!676297))

(check-sat (not b!721486) (not b!721483) (not b!721484) (not b!721490) (not start!64260) (not b!721488) (not b!721479) (not b!721480) (not b!721485) (not b!721481) (not b!721487))
(check-sat)
