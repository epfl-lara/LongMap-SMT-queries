; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64340 () Bool)

(assert start!64340)

(declare-fun b!723359 () Bool)

(declare-fun res!485049 () Bool)

(declare-fun e!405218 () Bool)

(assert (=> b!723359 (=> (not res!485049) (not e!405218))))

(declare-datatypes ((array!40938 0))(
  ( (array!40939 (arr!19592 (Array (_ BitVec 32) (_ BitVec 64))) (size!20013 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40938)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723359 (= res!485049 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723360 () Bool)

(declare-fun e!405221 () Bool)

(declare-fun e!405222 () Bool)

(assert (=> b!723360 (= e!405221 e!405222)))

(declare-fun res!485055 () Bool)

(assert (=> b!723360 (=> (not res!485055) (not e!405222))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!320487 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!320488 () array!40938)

(declare-datatypes ((SeekEntryResult!7189 0))(
  ( (MissingZero!7189 (index!31124 (_ BitVec 32))) (Found!7189 (index!31125 (_ BitVec 32))) (Intermediate!7189 (undefined!8001 Bool) (index!31126 (_ BitVec 32)) (x!62129 (_ BitVec 32))) (Undefined!7189) (MissingVacant!7189 (index!31127 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40938 (_ BitVec 32)) SeekEntryResult!7189)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723360 (= res!485055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320487 mask!3328) lt!320487 lt!320488 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320487 lt!320488 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723360 (= lt!320487 (select (store (arr!19592 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723360 (= lt!320488 (array!40939 (store (arr!19592 a!3186) i!1173 k0!2102) (size!20013 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!723361 () Bool)

(declare-fun e!405220 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40938 (_ BitVec 32)) SeekEntryResult!7189)

(assert (=> b!723361 (= e!405220 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19592 a!3186) j!159) a!3186 mask!3328) (Found!7189 j!159)))))

(declare-fun b!723362 () Bool)

(declare-fun res!485060 () Bool)

(declare-fun e!405217 () Bool)

(assert (=> b!723362 (=> (not res!485060) (not e!405217))))

(declare-datatypes ((List!13633 0))(
  ( (Nil!13630) (Cons!13629 (h!14683 (_ BitVec 64)) (t!19939 List!13633)) )
))
(declare-fun arrayNoDuplicates!0 (array!40938 (_ BitVec 32) List!13633) Bool)

(assert (=> b!723362 (= res!485060 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13630))))

(declare-fun b!723363 () Bool)

(declare-fun res!485058 () Bool)

(assert (=> b!723363 (=> (not res!485058) (not e!405218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723363 (= res!485058 (validKeyInArray!0 (select (arr!19592 a!3186) j!159)))))

(declare-fun b!723364 () Bool)

(assert (=> b!723364 (= e!405217 e!405221)))

(declare-fun res!485057 () Bool)

(assert (=> b!723364 (=> (not res!485057) (not e!405221))))

(declare-fun lt!320489 () SeekEntryResult!7189)

(assert (=> b!723364 (= res!485057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19592 a!3186) j!159) mask!3328) (select (arr!19592 a!3186) j!159) a!3186 mask!3328) lt!320489))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723364 (= lt!320489 (Intermediate!7189 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723365 () Bool)

(declare-fun res!485052 () Bool)

(assert (=> b!723365 (=> (not res!485052) (not e!405217))))

(assert (=> b!723365 (= res!485052 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20013 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20013 a!3186))))))

(declare-fun b!723366 () Bool)

(declare-fun res!485051 () Bool)

(assert (=> b!723366 (=> (not res!485051) (not e!405218))))

(assert (=> b!723366 (= res!485051 (and (= (size!20013 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20013 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20013 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!485061 () Bool)

(assert (=> start!64340 (=> (not res!485061) (not e!405218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64340 (= res!485061 (validMask!0 mask!3328))))

(assert (=> start!64340 e!405218))

(assert (=> start!64340 true))

(declare-fun array_inv!15475 (array!40938) Bool)

(assert (=> start!64340 (array_inv!15475 a!3186)))

(declare-fun b!723367 () Bool)

(assert (=> b!723367 (= e!405222 (not true))))

(declare-fun e!405223 () Bool)

(assert (=> b!723367 e!405223))

(declare-fun res!485048 () Bool)

(assert (=> b!723367 (=> (not res!485048) (not e!405223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40938 (_ BitVec 32)) Bool)

(assert (=> b!723367 (= res!485048 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24668 0))(
  ( (Unit!24669) )
))
(declare-fun lt!320485 () Unit!24668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24668)

(assert (=> b!723367 (= lt!320485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723368 () Bool)

(declare-fun res!485050 () Bool)

(assert (=> b!723368 (=> (not res!485050) (not e!405221))))

(assert (=> b!723368 (= res!485050 e!405220)))

(declare-fun c!79527 () Bool)

(assert (=> b!723368 (= c!79527 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723369 () Bool)

(assert (=> b!723369 (= e!405218 e!405217)))

(declare-fun res!485059 () Bool)

(assert (=> b!723369 (=> (not res!485059) (not e!405217))))

(declare-fun lt!320486 () SeekEntryResult!7189)

(assert (=> b!723369 (= res!485059 (or (= lt!320486 (MissingZero!7189 i!1173)) (= lt!320486 (MissingVacant!7189 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40938 (_ BitVec 32)) SeekEntryResult!7189)

(assert (=> b!723369 (= lt!320486 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723370 () Bool)

(declare-fun res!485053 () Bool)

(assert (=> b!723370 (=> (not res!485053) (not e!405217))))

(assert (=> b!723370 (= res!485053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723371 () Bool)

(assert (=> b!723371 (= e!405220 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19592 a!3186) j!159) a!3186 mask!3328) lt!320489))))

(declare-fun b!723372 () Bool)

(declare-fun res!485054 () Bool)

(assert (=> b!723372 (=> (not res!485054) (not e!405218))))

(assert (=> b!723372 (= res!485054 (validKeyInArray!0 k0!2102))))

(declare-fun b!723373 () Bool)

(assert (=> b!723373 (= e!405223 (= (seekEntryOrOpen!0 (select (arr!19592 a!3186) j!159) a!3186 mask!3328) (Found!7189 j!159)))))

(declare-fun b!723374 () Bool)

(declare-fun res!485056 () Bool)

(assert (=> b!723374 (=> (not res!485056) (not e!405221))))

(assert (=> b!723374 (= res!485056 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19592 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64340 res!485061) b!723366))

(assert (= (and b!723366 res!485051) b!723363))

(assert (= (and b!723363 res!485058) b!723372))

(assert (= (and b!723372 res!485054) b!723359))

(assert (= (and b!723359 res!485049) b!723369))

(assert (= (and b!723369 res!485059) b!723370))

(assert (= (and b!723370 res!485053) b!723362))

(assert (= (and b!723362 res!485060) b!723365))

(assert (= (and b!723365 res!485052) b!723364))

(assert (= (and b!723364 res!485057) b!723374))

(assert (= (and b!723374 res!485056) b!723368))

(assert (= (and b!723368 c!79527) b!723371))

(assert (= (and b!723368 (not c!79527)) b!723361))

(assert (= (and b!723368 res!485050) b!723360))

(assert (= (and b!723360 res!485055) b!723367))

(assert (= (and b!723367 res!485048) b!723373))

(declare-fun m!677279 () Bool)

(assert (=> b!723359 m!677279))

(declare-fun m!677281 () Bool)

(assert (=> b!723370 m!677281))

(declare-fun m!677283 () Bool)

(assert (=> b!723372 m!677283))

(declare-fun m!677285 () Bool)

(assert (=> b!723360 m!677285))

(declare-fun m!677287 () Bool)

(assert (=> b!723360 m!677287))

(declare-fun m!677289 () Bool)

(assert (=> b!723360 m!677289))

(declare-fun m!677291 () Bool)

(assert (=> b!723360 m!677291))

(assert (=> b!723360 m!677285))

(declare-fun m!677293 () Bool)

(assert (=> b!723360 m!677293))

(declare-fun m!677295 () Bool)

(assert (=> b!723369 m!677295))

(declare-fun m!677297 () Bool)

(assert (=> b!723361 m!677297))

(assert (=> b!723361 m!677297))

(declare-fun m!677299 () Bool)

(assert (=> b!723361 m!677299))

(assert (=> b!723363 m!677297))

(assert (=> b!723363 m!677297))

(declare-fun m!677301 () Bool)

(assert (=> b!723363 m!677301))

(assert (=> b!723373 m!677297))

(assert (=> b!723373 m!677297))

(declare-fun m!677303 () Bool)

(assert (=> b!723373 m!677303))

(declare-fun m!677305 () Bool)

(assert (=> b!723367 m!677305))

(declare-fun m!677307 () Bool)

(assert (=> b!723367 m!677307))

(declare-fun m!677309 () Bool)

(assert (=> b!723362 m!677309))

(declare-fun m!677311 () Bool)

(assert (=> start!64340 m!677311))

(declare-fun m!677313 () Bool)

(assert (=> start!64340 m!677313))

(assert (=> b!723371 m!677297))

(assert (=> b!723371 m!677297))

(declare-fun m!677315 () Bool)

(assert (=> b!723371 m!677315))

(assert (=> b!723364 m!677297))

(assert (=> b!723364 m!677297))

(declare-fun m!677317 () Bool)

(assert (=> b!723364 m!677317))

(assert (=> b!723364 m!677317))

(assert (=> b!723364 m!677297))

(declare-fun m!677319 () Bool)

(assert (=> b!723364 m!677319))

(declare-fun m!677321 () Bool)

(assert (=> b!723374 m!677321))

(check-sat (not b!723364) (not b!723363) (not b!723362) (not b!723373) (not b!723372) (not b!723370) (not b!723359) (not b!723360) (not start!64340) (not b!723361) (not b!723369) (not b!723371) (not b!723367))
(check-sat)
