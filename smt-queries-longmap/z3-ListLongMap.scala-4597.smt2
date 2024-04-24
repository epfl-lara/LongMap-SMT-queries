; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64158 () Bool)

(assert start!64158)

(declare-fun b!720287 () Bool)

(declare-fun res!482536 () Bool)

(declare-fun e!404092 () Bool)

(assert (=> b!720287 (=> (not res!482536) (not e!404092))))

(declare-datatypes ((array!40786 0))(
  ( (array!40787 (arr!19516 (Array (_ BitVec 32) (_ BitVec 64))) (size!19936 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40786)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720287 (= res!482536 (validKeyInArray!0 (select (arr!19516 a!3186) j!159)))))

(declare-fun b!720288 () Bool)

(declare-fun res!482532 () Bool)

(assert (=> b!720288 (=> (not res!482532) (not e!404092))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720288 (= res!482532 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720290 () Bool)

(declare-fun res!482539 () Bool)

(assert (=> b!720290 (=> (not res!482539) (not e!404092))))

(assert (=> b!720290 (= res!482539 (validKeyInArray!0 k0!2102))))

(declare-fun b!720291 () Bool)

(declare-fun res!482534 () Bool)

(declare-fun e!404094 () Bool)

(assert (=> b!720291 (=> (not res!482534) (not e!404094))))

(declare-datatypes ((List!13425 0))(
  ( (Nil!13422) (Cons!13421 (h!14472 (_ BitVec 64)) (t!19732 List!13425)) )
))
(declare-fun arrayNoDuplicates!0 (array!40786 (_ BitVec 32) List!13425) Bool)

(assert (=> b!720291 (= res!482534 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13422))))

(declare-fun b!720289 () Bool)

(assert (=> b!720289 (= e!404094 false)))

(declare-datatypes ((SeekEntryResult!7072 0))(
  ( (MissingZero!7072 (index!30656 (_ BitVec 32))) (Found!7072 (index!30657 (_ BitVec 32))) (Intermediate!7072 (undefined!7884 Bool) (index!30658 (_ BitVec 32)) (x!61810 (_ BitVec 32))) (Undefined!7072) (MissingVacant!7072 (index!30659 (_ BitVec 32))) )
))
(declare-fun lt!319814 () SeekEntryResult!7072)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40786 (_ BitVec 32)) SeekEntryResult!7072)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720289 (= lt!319814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19516 a!3186) j!159) mask!3328) (select (arr!19516 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!482533 () Bool)

(assert (=> start!64158 (=> (not res!482533) (not e!404092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64158 (= res!482533 (validMask!0 mask!3328))))

(assert (=> start!64158 e!404092))

(assert (=> start!64158 true))

(declare-fun array_inv!15375 (array!40786) Bool)

(assert (=> start!64158 (array_inv!15375 a!3186)))

(declare-fun b!720292 () Bool)

(declare-fun res!482535 () Bool)

(assert (=> b!720292 (=> (not res!482535) (not e!404094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40786 (_ BitVec 32)) Bool)

(assert (=> b!720292 (= res!482535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720293 () Bool)

(declare-fun res!482537 () Bool)

(assert (=> b!720293 (=> (not res!482537) (not e!404094))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720293 (= res!482537 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19936 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19936 a!3186))))))

(declare-fun b!720294 () Bool)

(declare-fun res!482531 () Bool)

(assert (=> b!720294 (=> (not res!482531) (not e!404092))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720294 (= res!482531 (and (= (size!19936 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19936 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19936 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720295 () Bool)

(assert (=> b!720295 (= e!404092 e!404094)))

(declare-fun res!482538 () Bool)

(assert (=> b!720295 (=> (not res!482538) (not e!404094))))

(declare-fun lt!319815 () SeekEntryResult!7072)

(assert (=> b!720295 (= res!482538 (or (= lt!319815 (MissingZero!7072 i!1173)) (= lt!319815 (MissingVacant!7072 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40786 (_ BitVec 32)) SeekEntryResult!7072)

(assert (=> b!720295 (= lt!319815 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64158 res!482533) b!720294))

(assert (= (and b!720294 res!482531) b!720287))

(assert (= (and b!720287 res!482536) b!720290))

(assert (= (and b!720290 res!482539) b!720288))

(assert (= (and b!720288 res!482532) b!720295))

(assert (= (and b!720295 res!482538) b!720292))

(assert (= (and b!720292 res!482535) b!720291))

(assert (= (and b!720291 res!482534) b!720293))

(assert (= (and b!720293 res!482537) b!720289))

(declare-fun m!676113 () Bool)

(assert (=> b!720291 m!676113))

(declare-fun m!676115 () Bool)

(assert (=> b!720288 m!676115))

(declare-fun m!676117 () Bool)

(assert (=> b!720295 m!676117))

(declare-fun m!676119 () Bool)

(assert (=> b!720287 m!676119))

(assert (=> b!720287 m!676119))

(declare-fun m!676121 () Bool)

(assert (=> b!720287 m!676121))

(declare-fun m!676123 () Bool)

(assert (=> b!720290 m!676123))

(declare-fun m!676125 () Bool)

(assert (=> start!64158 m!676125))

(declare-fun m!676127 () Bool)

(assert (=> start!64158 m!676127))

(assert (=> b!720289 m!676119))

(assert (=> b!720289 m!676119))

(declare-fun m!676129 () Bool)

(assert (=> b!720289 m!676129))

(assert (=> b!720289 m!676129))

(assert (=> b!720289 m!676119))

(declare-fun m!676131 () Bool)

(assert (=> b!720289 m!676131))

(declare-fun m!676133 () Bool)

(assert (=> b!720292 m!676133))

(check-sat (not b!720287) (not b!720291) (not start!64158) (not b!720292) (not b!720290) (not b!720295) (not b!720288) (not b!720289))
(check-sat)
