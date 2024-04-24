; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64092 () Bool)

(assert start!64092)

(declare-fun b!719360 () Bool)

(declare-fun res!481608 () Bool)

(declare-fun e!403797 () Bool)

(assert (=> b!719360 (=> (not res!481608) (not e!403797))))

(declare-datatypes ((array!40720 0))(
  ( (array!40721 (arr!19483 (Array (_ BitVec 32) (_ BitVec 64))) (size!19903 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40720)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40720 (_ BitVec 32)) Bool)

(assert (=> b!719360 (= res!481608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!481612 () Bool)

(declare-fun e!403796 () Bool)

(assert (=> start!64092 (=> (not res!481612) (not e!403796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64092 (= res!481612 (validMask!0 mask!3328))))

(assert (=> start!64092 e!403796))

(assert (=> start!64092 true))

(declare-fun array_inv!15342 (array!40720) Bool)

(assert (=> start!64092 (array_inv!15342 a!3186)))

(declare-fun b!719361 () Bool)

(declare-fun res!481606 () Bool)

(assert (=> b!719361 (=> (not res!481606) (not e!403797))))

(declare-datatypes ((List!13392 0))(
  ( (Nil!13389) (Cons!13388 (h!14439 (_ BitVec 64)) (t!19699 List!13392)) )
))
(declare-fun arrayNoDuplicates!0 (array!40720 (_ BitVec 32) List!13392) Bool)

(assert (=> b!719361 (= res!481606 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13389))))

(declare-fun b!719362 () Bool)

(declare-fun res!481604 () Bool)

(assert (=> b!719362 (=> (not res!481604) (not e!403796))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719362 (= res!481604 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719363 () Bool)

(declare-fun res!481609 () Bool)

(assert (=> b!719363 (=> (not res!481609) (not e!403797))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719363 (= res!481609 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19903 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19903 a!3186))))))

(declare-fun b!719364 () Bool)

(assert (=> b!719364 (= e!403796 e!403797)))

(declare-fun res!481610 () Bool)

(assert (=> b!719364 (=> (not res!481610) (not e!403797))))

(declare-datatypes ((SeekEntryResult!7039 0))(
  ( (MissingZero!7039 (index!30524 (_ BitVec 32))) (Found!7039 (index!30525 (_ BitVec 32))) (Intermediate!7039 (undefined!7851 Bool) (index!30526 (_ BitVec 32)) (x!61689 (_ BitVec 32))) (Undefined!7039) (MissingVacant!7039 (index!30527 (_ BitVec 32))) )
))
(declare-fun lt!319652 () SeekEntryResult!7039)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719364 (= res!481610 (or (= lt!319652 (MissingZero!7039 i!1173)) (= lt!319652 (MissingVacant!7039 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40720 (_ BitVec 32)) SeekEntryResult!7039)

(assert (=> b!719364 (= lt!319652 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719365 () Bool)

(declare-fun res!481605 () Bool)

(assert (=> b!719365 (=> (not res!481605) (not e!403796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719365 (= res!481605 (validKeyInArray!0 k0!2102))))

(declare-fun b!719366 () Bool)

(assert (=> b!719366 (= e!403797 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319653 () SeekEntryResult!7039)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40720 (_ BitVec 32)) SeekEntryResult!7039)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719366 (= lt!319653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19483 a!3186) j!159) mask!3328) (select (arr!19483 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719367 () Bool)

(declare-fun res!481607 () Bool)

(assert (=> b!719367 (=> (not res!481607) (not e!403796))))

(assert (=> b!719367 (= res!481607 (and (= (size!19903 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19903 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19903 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719368 () Bool)

(declare-fun res!481611 () Bool)

(assert (=> b!719368 (=> (not res!481611) (not e!403796))))

(assert (=> b!719368 (= res!481611 (validKeyInArray!0 (select (arr!19483 a!3186) j!159)))))

(assert (= (and start!64092 res!481612) b!719367))

(assert (= (and b!719367 res!481607) b!719368))

(assert (= (and b!719368 res!481611) b!719365))

(assert (= (and b!719365 res!481605) b!719362))

(assert (= (and b!719362 res!481604) b!719364))

(assert (= (and b!719364 res!481610) b!719360))

(assert (= (and b!719360 res!481608) b!719361))

(assert (= (and b!719361 res!481606) b!719363))

(assert (= (and b!719363 res!481609) b!719366))

(declare-fun m!675363 () Bool)

(assert (=> b!719366 m!675363))

(assert (=> b!719366 m!675363))

(declare-fun m!675365 () Bool)

(assert (=> b!719366 m!675365))

(assert (=> b!719366 m!675365))

(assert (=> b!719366 m!675363))

(declare-fun m!675367 () Bool)

(assert (=> b!719366 m!675367))

(declare-fun m!675369 () Bool)

(assert (=> b!719362 m!675369))

(declare-fun m!675371 () Bool)

(assert (=> b!719361 m!675371))

(assert (=> b!719368 m!675363))

(assert (=> b!719368 m!675363))

(declare-fun m!675373 () Bool)

(assert (=> b!719368 m!675373))

(declare-fun m!675375 () Bool)

(assert (=> b!719365 m!675375))

(declare-fun m!675377 () Bool)

(assert (=> b!719360 m!675377))

(declare-fun m!675379 () Bool)

(assert (=> b!719364 m!675379))

(declare-fun m!675381 () Bool)

(assert (=> start!64092 m!675381))

(declare-fun m!675383 () Bool)

(assert (=> start!64092 m!675383))

(check-sat (not start!64092) (not b!719366) (not b!719360) (not b!719362) (not b!719364) (not b!719365) (not b!719361) (not b!719368))
(check-sat)
