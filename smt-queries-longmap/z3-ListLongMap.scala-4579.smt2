; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63942 () Bool)

(assert start!63942)

(declare-fun b!718330 () Bool)

(declare-fun e!403283 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!718330 (= e!403283 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-datatypes ((array!40682 0))(
  ( (array!40683 (arr!19468 (Array (_ BitVec 32) (_ BitVec 64))) (size!19889 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40682)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319340 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718330 (= lt!319340 (toIndex!0 (select (arr!19468 a!3186) j!159) mask!3328))))

(declare-fun res!480817 () Bool)

(declare-fun e!403281 () Bool)

(assert (=> start!63942 (=> (not res!480817) (not e!403281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63942 (= res!480817 (validMask!0 mask!3328))))

(assert (=> start!63942 e!403281))

(assert (=> start!63942 true))

(declare-fun array_inv!15264 (array!40682) Bool)

(assert (=> start!63942 (array_inv!15264 a!3186)))

(declare-fun b!718331 () Bool)

(declare-fun res!480818 () Bool)

(assert (=> b!718331 (=> (not res!480818) (not e!403281))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718331 (= res!480818 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718332 () Bool)

(declare-fun res!480816 () Bool)

(assert (=> b!718332 (=> (not res!480816) (not e!403281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718332 (= res!480816 (validKeyInArray!0 (select (arr!19468 a!3186) j!159)))))

(declare-fun b!718333 () Bool)

(declare-fun res!480812 () Bool)

(assert (=> b!718333 (=> (not res!480812) (not e!403281))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718333 (= res!480812 (and (= (size!19889 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19889 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19889 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718334 () Bool)

(declare-fun res!480814 () Bool)

(assert (=> b!718334 (=> (not res!480814) (not e!403283))))

(declare-datatypes ((List!13470 0))(
  ( (Nil!13467) (Cons!13466 (h!14511 (_ BitVec 64)) (t!19785 List!13470)) )
))
(declare-fun arrayNoDuplicates!0 (array!40682 (_ BitVec 32) List!13470) Bool)

(assert (=> b!718334 (= res!480814 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13467))))

(declare-fun b!718335 () Bool)

(assert (=> b!718335 (= e!403281 e!403283)))

(declare-fun res!480813 () Bool)

(assert (=> b!718335 (=> (not res!480813) (not e!403283))))

(declare-datatypes ((SeekEntryResult!7068 0))(
  ( (MissingZero!7068 (index!30640 (_ BitVec 32))) (Found!7068 (index!30641 (_ BitVec 32))) (Intermediate!7068 (undefined!7880 Bool) (index!30642 (_ BitVec 32)) (x!61656 (_ BitVec 32))) (Undefined!7068) (MissingVacant!7068 (index!30643 (_ BitVec 32))) )
))
(declare-fun lt!319339 () SeekEntryResult!7068)

(assert (=> b!718335 (= res!480813 (or (= lt!319339 (MissingZero!7068 i!1173)) (= lt!319339 (MissingVacant!7068 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40682 (_ BitVec 32)) SeekEntryResult!7068)

(assert (=> b!718335 (= lt!319339 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718336 () Bool)

(declare-fun res!480810 () Bool)

(assert (=> b!718336 (=> (not res!480810) (not e!403281))))

(assert (=> b!718336 (= res!480810 (validKeyInArray!0 k0!2102))))

(declare-fun b!718337 () Bool)

(declare-fun res!480811 () Bool)

(assert (=> b!718337 (=> (not res!480811) (not e!403283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40682 (_ BitVec 32)) Bool)

(assert (=> b!718337 (= res!480811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718338 () Bool)

(declare-fun res!480815 () Bool)

(assert (=> b!718338 (=> (not res!480815) (not e!403283))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718338 (= res!480815 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19889 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19889 a!3186))))))

(assert (= (and start!63942 res!480817) b!718333))

(assert (= (and b!718333 res!480812) b!718332))

(assert (= (and b!718332 res!480816) b!718336))

(assert (= (and b!718336 res!480810) b!718331))

(assert (= (and b!718331 res!480818) b!718335))

(assert (= (and b!718335 res!480813) b!718337))

(assert (= (and b!718337 res!480811) b!718334))

(assert (= (and b!718334 res!480814) b!718338))

(assert (= (and b!718338 res!480815) b!718330))

(declare-fun m!674001 () Bool)

(assert (=> b!718332 m!674001))

(assert (=> b!718332 m!674001))

(declare-fun m!674003 () Bool)

(assert (=> b!718332 m!674003))

(declare-fun m!674005 () Bool)

(assert (=> b!718337 m!674005))

(declare-fun m!674007 () Bool)

(assert (=> b!718334 m!674007))

(declare-fun m!674009 () Bool)

(assert (=> start!63942 m!674009))

(declare-fun m!674011 () Bool)

(assert (=> start!63942 m!674011))

(declare-fun m!674013 () Bool)

(assert (=> b!718331 m!674013))

(declare-fun m!674015 () Bool)

(assert (=> b!718335 m!674015))

(declare-fun m!674017 () Bool)

(assert (=> b!718336 m!674017))

(assert (=> b!718330 m!674001))

(assert (=> b!718330 m!674001))

(declare-fun m!674019 () Bool)

(assert (=> b!718330 m!674019))

(check-sat (not b!718337) (not b!718330) (not b!718336) (not b!718335) (not start!63942) (not b!718334) (not b!718332) (not b!718331))
(check-sat)
