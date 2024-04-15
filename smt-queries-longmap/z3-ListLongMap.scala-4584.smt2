; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63998 () Bool)

(assert start!63998)

(declare-fun res!481146 () Bool)

(declare-fun e!403363 () Bool)

(assert (=> start!63998 (=> (not res!481146) (not e!403363))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63998 (= res!481146 (validMask!0 mask!3328))))

(assert (=> start!63998 e!403363))

(assert (=> start!63998 true))

(declare-datatypes ((array!40710 0))(
  ( (array!40711 (arr!19481 (Array (_ BitVec 32) (_ BitVec 64))) (size!19902 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40710)

(declare-fun array_inv!15364 (array!40710) Bool)

(assert (=> start!63998 (array_inv!15364 a!3186)))

(declare-fun b!718611 () Bool)

(declare-fun res!481147 () Bool)

(assert (=> b!718611 (=> (not res!481147) (not e!403363))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718611 (= res!481147 (validKeyInArray!0 (select (arr!19481 a!3186) j!159)))))

(declare-fun b!718612 () Bool)

(declare-fun res!481148 () Bool)

(assert (=> b!718612 (=> (not res!481148) (not e!403363))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718612 (= res!481148 (and (= (size!19902 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19902 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19902 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718613 () Bool)

(declare-fun res!481150 () Bool)

(declare-fun e!403362 () Bool)

(assert (=> b!718613 (=> (not res!481150) (not e!403362))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718613 (= res!481150 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19902 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19902 a!3186))))))

(declare-fun b!718614 () Bool)

(assert (=> b!718614 (= e!403362 false)))

(declare-datatypes ((SeekEntryResult!7078 0))(
  ( (MissingZero!7078 (index!30680 (_ BitVec 32))) (Found!7078 (index!30681 (_ BitVec 32))) (Intermediate!7078 (undefined!7890 Bool) (index!30682 (_ BitVec 32)) (x!61704 (_ BitVec 32))) (Undefined!7078) (MissingVacant!7078 (index!30683 (_ BitVec 32))) )
))
(declare-fun lt!319255 () SeekEntryResult!7078)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40710 (_ BitVec 32)) SeekEntryResult!7078)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718614 (= lt!319255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19481 a!3186) j!159) mask!3328) (select (arr!19481 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!718615 () Bool)

(declare-fun res!481144 () Bool)

(assert (=> b!718615 (=> (not res!481144) (not e!403362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40710 (_ BitVec 32)) Bool)

(assert (=> b!718615 (= res!481144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718616 () Bool)

(declare-fun res!481149 () Bool)

(assert (=> b!718616 (=> (not res!481149) (not e!403362))))

(declare-datatypes ((List!13522 0))(
  ( (Nil!13519) (Cons!13518 (h!14566 (_ BitVec 64)) (t!19828 List!13522)) )
))
(declare-fun arrayNoDuplicates!0 (array!40710 (_ BitVec 32) List!13522) Bool)

(assert (=> b!718616 (= res!481149 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13519))))

(declare-fun b!718617 () Bool)

(assert (=> b!718617 (= e!403363 e!403362)))

(declare-fun res!481151 () Bool)

(assert (=> b!718617 (=> (not res!481151) (not e!403362))))

(declare-fun lt!319256 () SeekEntryResult!7078)

(assert (=> b!718617 (= res!481151 (or (= lt!319256 (MissingZero!7078 i!1173)) (= lt!319256 (MissingVacant!7078 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40710 (_ BitVec 32)) SeekEntryResult!7078)

(assert (=> b!718617 (= lt!319256 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718618 () Bool)

(declare-fun res!481152 () Bool)

(assert (=> b!718618 (=> (not res!481152) (not e!403363))))

(declare-fun arrayContainsKey!0 (array!40710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718618 (= res!481152 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718619 () Bool)

(declare-fun res!481145 () Bool)

(assert (=> b!718619 (=> (not res!481145) (not e!403363))))

(assert (=> b!718619 (= res!481145 (validKeyInArray!0 k0!2102))))

(assert (= (and start!63998 res!481146) b!718612))

(assert (= (and b!718612 res!481148) b!718611))

(assert (= (and b!718611 res!481147) b!718619))

(assert (= (and b!718619 res!481145) b!718618))

(assert (= (and b!718618 res!481152) b!718617))

(assert (= (and b!718617 res!481151) b!718615))

(assert (= (and b!718615 res!481144) b!718616))

(assert (= (and b!718616 res!481149) b!718613))

(assert (= (and b!718613 res!481150) b!718614))

(declare-fun m!673619 () Bool)

(assert (=> b!718617 m!673619))

(declare-fun m!673621 () Bool)

(assert (=> start!63998 m!673621))

(declare-fun m!673623 () Bool)

(assert (=> start!63998 m!673623))

(declare-fun m!673625 () Bool)

(assert (=> b!718611 m!673625))

(assert (=> b!718611 m!673625))

(declare-fun m!673627 () Bool)

(assert (=> b!718611 m!673627))

(assert (=> b!718614 m!673625))

(assert (=> b!718614 m!673625))

(declare-fun m!673629 () Bool)

(assert (=> b!718614 m!673629))

(assert (=> b!718614 m!673629))

(assert (=> b!718614 m!673625))

(declare-fun m!673631 () Bool)

(assert (=> b!718614 m!673631))

(declare-fun m!673633 () Bool)

(assert (=> b!718619 m!673633))

(declare-fun m!673635 () Bool)

(assert (=> b!718615 m!673635))

(declare-fun m!673637 () Bool)

(assert (=> b!718616 m!673637))

(declare-fun m!673639 () Bool)

(assert (=> b!718618 m!673639))

(check-sat (not b!718611) (not b!718617) (not b!718618) (not start!63998) (not b!718615) (not b!718619) (not b!718616) (not b!718614))
(check-sat)
