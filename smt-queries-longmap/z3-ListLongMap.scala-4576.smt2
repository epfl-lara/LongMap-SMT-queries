; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63942 () Bool)

(assert start!63942)

(declare-fun b!718251 () Bool)

(declare-fun res!480674 () Bool)

(declare-fun e!403309 () Bool)

(assert (=> b!718251 (=> (not res!480674) (not e!403309))))

(declare-datatypes ((array!40654 0))(
  ( (array!40655 (arr!19453 (Array (_ BitVec 32) (_ BitVec 64))) (size!19873 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40654)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718251 (= res!480674 (validKeyInArray!0 (select (arr!19453 a!3186) j!159)))))

(declare-fun b!718252 () Bool)

(declare-fun res!480679 () Bool)

(declare-fun e!403310 () Bool)

(assert (=> b!718252 (=> (not res!480679) (not e!403310))))

(declare-datatypes ((List!13362 0))(
  ( (Nil!13359) (Cons!13358 (h!14406 (_ BitVec 64)) (t!19669 List!13362)) )
))
(declare-fun arrayNoDuplicates!0 (array!40654 (_ BitVec 32) List!13362) Bool)

(assert (=> b!718252 (= res!480679 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13359))))

(declare-fun b!718253 () Bool)

(declare-fun res!480675 () Bool)

(assert (=> b!718253 (=> (not res!480675) (not e!403309))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718253 (= res!480675 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!480676 () Bool)

(assert (=> start!63942 (=> (not res!480676) (not e!403309))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63942 (= res!480676 (validMask!0 mask!3328))))

(assert (=> start!63942 e!403309))

(assert (=> start!63942 true))

(declare-fun array_inv!15312 (array!40654) Bool)

(assert (=> start!63942 (array_inv!15312 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!718254 () Bool)

(assert (=> b!718254 (= e!403310 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19873 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19873 a!3186)) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!718255 () Bool)

(declare-fun res!480673 () Bool)

(assert (=> b!718255 (=> (not res!480673) (not e!403310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40654 (_ BitVec 32)) Bool)

(assert (=> b!718255 (= res!480673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718256 () Bool)

(declare-fun res!480672 () Bool)

(assert (=> b!718256 (=> (not res!480672) (not e!403309))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718256 (= res!480672 (and (= (size!19873 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19873 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19873 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718257 () Bool)

(declare-fun res!480678 () Bool)

(assert (=> b!718257 (=> (not res!480678) (not e!403309))))

(assert (=> b!718257 (= res!480678 (validKeyInArray!0 k0!2102))))

(declare-fun b!718258 () Bool)

(assert (=> b!718258 (= e!403309 e!403310)))

(declare-fun res!480677 () Bool)

(assert (=> b!718258 (=> (not res!480677) (not e!403310))))

(declare-datatypes ((SeekEntryResult!7009 0))(
  ( (MissingZero!7009 (index!30404 (_ BitVec 32))) (Found!7009 (index!30405 (_ BitVec 32))) (Intermediate!7009 (undefined!7821 Bool) (index!30406 (_ BitVec 32)) (x!61576 (_ BitVec 32))) (Undefined!7009) (MissingVacant!7009 (index!30407 (_ BitVec 32))) )
))
(declare-fun lt!319371 () SeekEntryResult!7009)

(assert (=> b!718258 (= res!480677 (or (= lt!319371 (MissingZero!7009 i!1173)) (= lt!319371 (MissingVacant!7009 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40654 (_ BitVec 32)) SeekEntryResult!7009)

(assert (=> b!718258 (= lt!319371 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!63942 res!480676) b!718256))

(assert (= (and b!718256 res!480672) b!718251))

(assert (= (and b!718251 res!480674) b!718257))

(assert (= (and b!718257 res!480678) b!718253))

(assert (= (and b!718253 res!480675) b!718258))

(assert (= (and b!718258 res!480677) b!718255))

(assert (= (and b!718255 res!480673) b!718252))

(assert (= (and b!718252 res!480679) b!718254))

(declare-fun m!674565 () Bool)

(assert (=> b!718252 m!674565))

(declare-fun m!674567 () Bool)

(assert (=> b!718251 m!674567))

(assert (=> b!718251 m!674567))

(declare-fun m!674569 () Bool)

(assert (=> b!718251 m!674569))

(declare-fun m!674571 () Bool)

(assert (=> b!718258 m!674571))

(declare-fun m!674573 () Bool)

(assert (=> start!63942 m!674573))

(declare-fun m!674575 () Bool)

(assert (=> start!63942 m!674575))

(declare-fun m!674577 () Bool)

(assert (=> b!718253 m!674577))

(declare-fun m!674579 () Bool)

(assert (=> b!718255 m!674579))

(declare-fun m!674581 () Bool)

(assert (=> b!718257 m!674581))

(check-sat (not b!718257) (not b!718253) (not b!718252) (not start!63942) (not b!718251) (not b!718255) (not b!718258))
(check-sat)
