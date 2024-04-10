; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64044 () Bool)

(assert start!64044)

(declare-fun res!481626 () Bool)

(declare-fun e!403633 () Bool)

(assert (=> start!64044 (=> (not res!481626) (not e!403633))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64044 (= res!481626 (validMask!0 mask!3328))))

(assert (=> start!64044 e!403633))

(assert (=> start!64044 true))

(declare-datatypes ((array!40739 0))(
  ( (array!40740 (arr!19495 (Array (_ BitVec 32) (_ BitVec 64))) (size!19916 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40739)

(declare-fun array_inv!15291 (array!40739) Bool)

(assert (=> start!64044 (array_inv!15291 a!3186)))

(declare-fun b!719230 () Bool)

(declare-fun res!481623 () Bool)

(declare-fun e!403632 () Bool)

(assert (=> b!719230 (=> (not res!481623) (not e!403632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40739 (_ BitVec 32)) Bool)

(assert (=> b!719230 (= res!481623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719231 () Bool)

(declare-fun res!481630 () Bool)

(assert (=> b!719231 (=> (not res!481630) (not e!403633))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719231 (= res!481630 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719232 () Bool)

(assert (=> b!719232 (= e!403633 e!403632)))

(declare-fun res!481629 () Bool)

(assert (=> b!719232 (=> (not res!481629) (not e!403632))))

(declare-datatypes ((SeekEntryResult!7095 0))(
  ( (MissingZero!7095 (index!30748 (_ BitVec 32))) (Found!7095 (index!30749 (_ BitVec 32))) (Intermediate!7095 (undefined!7907 Bool) (index!30750 (_ BitVec 32)) (x!61758 (_ BitVec 32))) (Undefined!7095) (MissingVacant!7095 (index!30751 (_ BitVec 32))) )
))
(declare-fun lt!319556 () SeekEntryResult!7095)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719232 (= res!481629 (or (= lt!319556 (MissingZero!7095 i!1173)) (= lt!319556 (MissingVacant!7095 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40739 (_ BitVec 32)) SeekEntryResult!7095)

(assert (=> b!719232 (= lt!319556 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719233 () Bool)

(declare-fun res!481631 () Bool)

(assert (=> b!719233 (=> (not res!481631) (not e!403633))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719233 (= res!481631 (and (= (size!19916 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19916 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19916 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719234 () Bool)

(assert (=> b!719234 (= e!403632 false)))

(declare-fun lt!319555 () SeekEntryResult!7095)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40739 (_ BitVec 32)) SeekEntryResult!7095)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719234 (= lt!319555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19495 a!3186) j!159) mask!3328) (select (arr!19495 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719235 () Bool)

(declare-fun res!481628 () Bool)

(assert (=> b!719235 (=> (not res!481628) (not e!403633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719235 (= res!481628 (validKeyInArray!0 (select (arr!19495 a!3186) j!159)))))

(declare-fun b!719236 () Bool)

(declare-fun res!481625 () Bool)

(assert (=> b!719236 (=> (not res!481625) (not e!403632))))

(declare-datatypes ((List!13497 0))(
  ( (Nil!13494) (Cons!13493 (h!14541 (_ BitVec 64)) (t!19812 List!13497)) )
))
(declare-fun arrayNoDuplicates!0 (array!40739 (_ BitVec 32) List!13497) Bool)

(assert (=> b!719236 (= res!481625 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13494))))

(declare-fun b!719237 () Bool)

(declare-fun res!481624 () Bool)

(assert (=> b!719237 (=> (not res!481624) (not e!403633))))

(assert (=> b!719237 (= res!481624 (validKeyInArray!0 k0!2102))))

(declare-fun b!719238 () Bool)

(declare-fun res!481627 () Bool)

(assert (=> b!719238 (=> (not res!481627) (not e!403632))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719238 (= res!481627 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19916 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19916 a!3186))))))

(assert (= (and start!64044 res!481626) b!719233))

(assert (= (and b!719233 res!481631) b!719235))

(assert (= (and b!719235 res!481628) b!719237))

(assert (= (and b!719237 res!481624) b!719231))

(assert (= (and b!719231 res!481630) b!719232))

(assert (= (and b!719232 res!481629) b!719230))

(assert (= (and b!719230 res!481623) b!719236))

(assert (= (and b!719236 res!481625) b!719238))

(assert (= (and b!719238 res!481627) b!719234))

(declare-fun m!674675 () Bool)

(assert (=> b!719230 m!674675))

(declare-fun m!674677 () Bool)

(assert (=> b!719232 m!674677))

(declare-fun m!674679 () Bool)

(assert (=> b!719237 m!674679))

(declare-fun m!674681 () Bool)

(assert (=> b!719231 m!674681))

(declare-fun m!674683 () Bool)

(assert (=> b!719236 m!674683))

(declare-fun m!674685 () Bool)

(assert (=> start!64044 m!674685))

(declare-fun m!674687 () Bool)

(assert (=> start!64044 m!674687))

(declare-fun m!674689 () Bool)

(assert (=> b!719235 m!674689))

(assert (=> b!719235 m!674689))

(declare-fun m!674691 () Bool)

(assert (=> b!719235 m!674691))

(assert (=> b!719234 m!674689))

(assert (=> b!719234 m!674689))

(declare-fun m!674693 () Bool)

(assert (=> b!719234 m!674693))

(assert (=> b!719234 m!674693))

(assert (=> b!719234 m!674689))

(declare-fun m!674695 () Bool)

(assert (=> b!719234 m!674695))

(check-sat (not b!719235) (not b!719230) (not b!719234) (not b!719236) (not b!719232) (not b!719237) (not start!64044) (not b!719231))
(check-sat)
