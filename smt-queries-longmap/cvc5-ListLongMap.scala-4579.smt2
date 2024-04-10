; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63940 () Bool)

(assert start!63940)

(declare-fun b!718303 () Bool)

(declare-fun res!480789 () Bool)

(declare-fun e!403274 () Bool)

(assert (=> b!718303 (=> (not res!480789) (not e!403274))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718303 (= res!480789 (validKeyInArray!0 k!2102))))

(declare-fun b!718304 () Bool)

(declare-fun res!480786 () Bool)

(declare-fun e!403272 () Bool)

(assert (=> b!718304 (=> (not res!480786) (not e!403272))))

(declare-datatypes ((array!40680 0))(
  ( (array!40681 (arr!19467 (Array (_ BitVec 32) (_ BitVec 64))) (size!19888 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40680)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40680 (_ BitVec 32)) Bool)

(assert (=> b!718304 (= res!480786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718305 () Bool)

(declare-fun res!480783 () Bool)

(assert (=> b!718305 (=> (not res!480783) (not e!403272))))

(declare-datatypes ((List!13469 0))(
  ( (Nil!13466) (Cons!13465 (h!14510 (_ BitVec 64)) (t!19784 List!13469)) )
))
(declare-fun arrayNoDuplicates!0 (array!40680 (_ BitVec 32) List!13469) Bool)

(assert (=> b!718305 (= res!480783 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13466))))

(declare-fun b!718306 () Bool)

(declare-fun res!480791 () Bool)

(assert (=> b!718306 (=> (not res!480791) (not e!403274))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718306 (= res!480791 (validKeyInArray!0 (select (arr!19467 a!3186) j!159)))))

(declare-fun res!480788 () Bool)

(assert (=> start!63940 (=> (not res!480788) (not e!403274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63940 (= res!480788 (validMask!0 mask!3328))))

(assert (=> start!63940 e!403274))

(assert (=> start!63940 true))

(declare-fun array_inv!15263 (array!40680) Bool)

(assert (=> start!63940 (array_inv!15263 a!3186)))

(declare-fun b!718307 () Bool)

(assert (=> b!718307 (= e!403274 e!403272)))

(declare-fun res!480787 () Bool)

(assert (=> b!718307 (=> (not res!480787) (not e!403272))))

(declare-datatypes ((SeekEntryResult!7067 0))(
  ( (MissingZero!7067 (index!30636 (_ BitVec 32))) (Found!7067 (index!30637 (_ BitVec 32))) (Intermediate!7067 (undefined!7879 Bool) (index!30638 (_ BitVec 32)) (x!61655 (_ BitVec 32))) (Undefined!7067) (MissingVacant!7067 (index!30639 (_ BitVec 32))) )
))
(declare-fun lt!319334 () SeekEntryResult!7067)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718307 (= res!480787 (or (= lt!319334 (MissingZero!7067 i!1173)) (= lt!319334 (MissingVacant!7067 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40680 (_ BitVec 32)) SeekEntryResult!7067)

(assert (=> b!718307 (= lt!319334 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718308 () Bool)

(assert (=> b!718308 (= e!403272 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!319333 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718308 (= lt!319333 (toIndex!0 (select (arr!19467 a!3186) j!159) mask!3328))))

(declare-fun b!718309 () Bool)

(declare-fun res!480784 () Bool)

(assert (=> b!718309 (=> (not res!480784) (not e!403274))))

(declare-fun arrayContainsKey!0 (array!40680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718309 (= res!480784 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718310 () Bool)

(declare-fun res!480785 () Bool)

(assert (=> b!718310 (=> (not res!480785) (not e!403272))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718310 (= res!480785 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19888 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19888 a!3186))))))

(declare-fun b!718311 () Bool)

(declare-fun res!480790 () Bool)

(assert (=> b!718311 (=> (not res!480790) (not e!403274))))

(assert (=> b!718311 (= res!480790 (and (= (size!19888 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19888 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19888 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63940 res!480788) b!718311))

(assert (= (and b!718311 res!480790) b!718306))

(assert (= (and b!718306 res!480791) b!718303))

(assert (= (and b!718303 res!480789) b!718309))

(assert (= (and b!718309 res!480784) b!718307))

(assert (= (and b!718307 res!480787) b!718304))

(assert (= (and b!718304 res!480786) b!718305))

(assert (= (and b!718305 res!480783) b!718310))

(assert (= (and b!718310 res!480785) b!718308))

(declare-fun m!673981 () Bool)

(assert (=> b!718308 m!673981))

(assert (=> b!718308 m!673981))

(declare-fun m!673983 () Bool)

(assert (=> b!718308 m!673983))

(assert (=> b!718306 m!673981))

(assert (=> b!718306 m!673981))

(declare-fun m!673985 () Bool)

(assert (=> b!718306 m!673985))

(declare-fun m!673987 () Bool)

(assert (=> b!718305 m!673987))

(declare-fun m!673989 () Bool)

(assert (=> b!718309 m!673989))

(declare-fun m!673991 () Bool)

(assert (=> b!718303 m!673991))

(declare-fun m!673993 () Bool)

(assert (=> b!718307 m!673993))

(declare-fun m!673995 () Bool)

(assert (=> start!63940 m!673995))

(declare-fun m!673997 () Bool)

(assert (=> start!63940 m!673997))

(declare-fun m!673999 () Bool)

(assert (=> b!718304 m!673999))

(push 1)

(assert (not b!718305))

(assert (not b!718306))

(assert (not b!718307))

(assert (not b!718309))

(assert (not b!718308))

(assert (not start!63940))

(assert (not b!718304))

(assert (not b!718303))

