; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63986 () Bool)

(assert start!63986)

(declare-fun b!718449 () Bool)

(declare-fun e!403308 () Bool)

(assert (=> b!718449 (= e!403308 false)))

(declare-datatypes ((array!40698 0))(
  ( (array!40699 (arr!19475 (Array (_ BitVec 32) (_ BitVec 64))) (size!19896 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40698)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!319219 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718449 (= lt!319219 (toIndex!0 (select (arr!19475 a!3186) j!159) mask!3328))))

(declare-fun b!718450 () Bool)

(declare-fun e!403309 () Bool)

(assert (=> b!718450 (= e!403309 e!403308)))

(declare-fun res!480988 () Bool)

(assert (=> b!718450 (=> (not res!480988) (not e!403308))))

(declare-datatypes ((SeekEntryResult!7072 0))(
  ( (MissingZero!7072 (index!30656 (_ BitVec 32))) (Found!7072 (index!30657 (_ BitVec 32))) (Intermediate!7072 (undefined!7884 Bool) (index!30658 (_ BitVec 32)) (x!61682 (_ BitVec 32))) (Undefined!7072) (MissingVacant!7072 (index!30659 (_ BitVec 32))) )
))
(declare-fun lt!319220 () SeekEntryResult!7072)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718450 (= res!480988 (or (= lt!319220 (MissingZero!7072 i!1173)) (= lt!319220 (MissingVacant!7072 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40698 (_ BitVec 32)) SeekEntryResult!7072)

(assert (=> b!718450 (= lt!319220 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!480987 () Bool)

(assert (=> start!63986 (=> (not res!480987) (not e!403309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63986 (= res!480987 (validMask!0 mask!3328))))

(assert (=> start!63986 e!403309))

(assert (=> start!63986 true))

(declare-fun array_inv!15358 (array!40698) Bool)

(assert (=> start!63986 (array_inv!15358 a!3186)))

(declare-fun b!718451 () Bool)

(declare-fun res!480983 () Bool)

(assert (=> b!718451 (=> (not res!480983) (not e!403309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718451 (= res!480983 (validKeyInArray!0 (select (arr!19475 a!3186) j!159)))))

(declare-fun b!718452 () Bool)

(declare-fun res!480986 () Bool)

(assert (=> b!718452 (=> (not res!480986) (not e!403309))))

(assert (=> b!718452 (= res!480986 (validKeyInArray!0 k0!2102))))

(declare-fun b!718453 () Bool)

(declare-fun res!480985 () Bool)

(assert (=> b!718453 (=> (not res!480985) (not e!403309))))

(declare-fun arrayContainsKey!0 (array!40698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718453 (= res!480985 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718454 () Bool)

(declare-fun res!480989 () Bool)

(assert (=> b!718454 (=> (not res!480989) (not e!403308))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718454 (= res!480989 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19896 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19896 a!3186))))))

(declare-fun b!718455 () Bool)

(declare-fun res!480984 () Bool)

(assert (=> b!718455 (=> (not res!480984) (not e!403309))))

(assert (=> b!718455 (= res!480984 (and (= (size!19896 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19896 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19896 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718456 () Bool)

(declare-fun res!480990 () Bool)

(assert (=> b!718456 (=> (not res!480990) (not e!403308))))

(declare-datatypes ((List!13516 0))(
  ( (Nil!13513) (Cons!13512 (h!14560 (_ BitVec 64)) (t!19822 List!13516)) )
))
(declare-fun arrayNoDuplicates!0 (array!40698 (_ BitVec 32) List!13516) Bool)

(assert (=> b!718456 (= res!480990 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13513))))

(declare-fun b!718457 () Bool)

(declare-fun res!480982 () Bool)

(assert (=> b!718457 (=> (not res!480982) (not e!403308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40698 (_ BitVec 32)) Bool)

(assert (=> b!718457 (= res!480982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!63986 res!480987) b!718455))

(assert (= (and b!718455 res!480984) b!718451))

(assert (= (and b!718451 res!480983) b!718452))

(assert (= (and b!718452 res!480986) b!718453))

(assert (= (and b!718453 res!480985) b!718450))

(assert (= (and b!718450 res!480988) b!718457))

(assert (= (and b!718457 res!480982) b!718456))

(assert (= (and b!718456 res!480990) b!718454))

(assert (= (and b!718454 res!480989) b!718449))

(declare-fun m!673499 () Bool)

(assert (=> b!718449 m!673499))

(assert (=> b!718449 m!673499))

(declare-fun m!673501 () Bool)

(assert (=> b!718449 m!673501))

(declare-fun m!673503 () Bool)

(assert (=> b!718457 m!673503))

(declare-fun m!673505 () Bool)

(assert (=> b!718456 m!673505))

(declare-fun m!673507 () Bool)

(assert (=> b!718450 m!673507))

(declare-fun m!673509 () Bool)

(assert (=> start!63986 m!673509))

(declare-fun m!673511 () Bool)

(assert (=> start!63986 m!673511))

(assert (=> b!718451 m!673499))

(assert (=> b!718451 m!673499))

(declare-fun m!673513 () Bool)

(assert (=> b!718451 m!673513))

(declare-fun m!673515 () Bool)

(assert (=> b!718452 m!673515))

(declare-fun m!673517 () Bool)

(assert (=> b!718453 m!673517))

(check-sat (not b!718452) (not b!718456) (not b!718453) (not b!718451) (not b!718450) (not b!718449) (not b!718457) (not start!63986))
(check-sat)
