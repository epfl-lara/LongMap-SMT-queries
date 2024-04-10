; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64012 () Bool)

(assert start!64012)

(declare-fun b!718780 () Bool)

(declare-fun res!481181 () Bool)

(declare-fun e!403490 () Bool)

(assert (=> b!718780 (=> (not res!481181) (not e!403490))))

(declare-datatypes ((array!40707 0))(
  ( (array!40708 (arr!19479 (Array (_ BitVec 32) (_ BitVec 64))) (size!19900 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40707)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718780 (= res!481181 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718781 () Bool)

(declare-fun res!481180 () Bool)

(assert (=> b!718781 (=> (not res!481180) (not e!403490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718781 (= res!481180 (validKeyInArray!0 k!2102))))

(declare-fun b!718782 () Bool)

(declare-fun res!481179 () Bool)

(declare-fun e!403488 () Bool)

(assert (=> b!718782 (=> (not res!481179) (not e!403488))))

(declare-datatypes ((List!13481 0))(
  ( (Nil!13478) (Cons!13477 (h!14525 (_ BitVec 64)) (t!19796 List!13481)) )
))
(declare-fun arrayNoDuplicates!0 (array!40707 (_ BitVec 32) List!13481) Bool)

(assert (=> b!718782 (= res!481179 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13478))))

(declare-fun b!718783 () Bool)

(assert (=> b!718783 (= e!403488 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!319477 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718783 (= lt!319477 (toIndex!0 (select (arr!19479 a!3186) j!159) mask!3328))))

(declare-fun res!481178 () Bool)

(assert (=> start!64012 (=> (not res!481178) (not e!403490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64012 (= res!481178 (validMask!0 mask!3328))))

(assert (=> start!64012 e!403490))

(assert (=> start!64012 true))

(declare-fun array_inv!15275 (array!40707) Bool)

(assert (=> start!64012 (array_inv!15275 a!3186)))

(declare-fun b!718784 () Bool)

(declare-fun res!481174 () Bool)

(assert (=> b!718784 (=> (not res!481174) (not e!403488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40707 (_ BitVec 32)) Bool)

(assert (=> b!718784 (= res!481174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718785 () Bool)

(declare-fun res!481173 () Bool)

(assert (=> b!718785 (=> (not res!481173) (not e!403488))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!718785 (= res!481173 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19900 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19900 a!3186))))))

(declare-fun b!718786 () Bool)

(assert (=> b!718786 (= e!403490 e!403488)))

(declare-fun res!481176 () Bool)

(assert (=> b!718786 (=> (not res!481176) (not e!403488))))

(declare-datatypes ((SeekEntryResult!7079 0))(
  ( (MissingZero!7079 (index!30684 (_ BitVec 32))) (Found!7079 (index!30685 (_ BitVec 32))) (Intermediate!7079 (undefined!7891 Bool) (index!30686 (_ BitVec 32)) (x!61702 (_ BitVec 32))) (Undefined!7079) (MissingVacant!7079 (index!30687 (_ BitVec 32))) )
))
(declare-fun lt!319478 () SeekEntryResult!7079)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718786 (= res!481176 (or (= lt!319478 (MissingZero!7079 i!1173)) (= lt!319478 (MissingVacant!7079 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40707 (_ BitVec 32)) SeekEntryResult!7079)

(assert (=> b!718786 (= lt!319478 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718787 () Bool)

(declare-fun res!481175 () Bool)

(assert (=> b!718787 (=> (not res!481175) (not e!403490))))

(assert (=> b!718787 (= res!481175 (and (= (size!19900 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19900 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19900 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718788 () Bool)

(declare-fun res!481177 () Bool)

(assert (=> b!718788 (=> (not res!481177) (not e!403490))))

(assert (=> b!718788 (= res!481177 (validKeyInArray!0 (select (arr!19479 a!3186) j!159)))))

(assert (= (and start!64012 res!481178) b!718787))

(assert (= (and b!718787 res!481175) b!718788))

(assert (= (and b!718788 res!481177) b!718781))

(assert (= (and b!718781 res!481180) b!718780))

(assert (= (and b!718780 res!481181) b!718786))

(assert (= (and b!718786 res!481176) b!718784))

(assert (= (and b!718784 res!481174) b!718782))

(assert (= (and b!718782 res!481179) b!718785))

(assert (= (and b!718785 res!481173) b!718783))

(declare-fun m!674317 () Bool)

(assert (=> b!718783 m!674317))

(assert (=> b!718783 m!674317))

(declare-fun m!674319 () Bool)

(assert (=> b!718783 m!674319))

(declare-fun m!674321 () Bool)

(assert (=> start!64012 m!674321))

(declare-fun m!674323 () Bool)

(assert (=> start!64012 m!674323))

(declare-fun m!674325 () Bool)

(assert (=> b!718780 m!674325))

(declare-fun m!674327 () Bool)

(assert (=> b!718781 m!674327))

(declare-fun m!674329 () Bool)

(assert (=> b!718784 m!674329))

(assert (=> b!718788 m!674317))

(assert (=> b!718788 m!674317))

(declare-fun m!674331 () Bool)

(assert (=> b!718788 m!674331))

(declare-fun m!674333 () Bool)

(assert (=> b!718786 m!674333))

(declare-fun m!674335 () Bool)

(assert (=> b!718782 m!674335))

(push 1)

(assert (not b!718782))

(assert (not start!64012))

(assert (not b!718780))

(assert (not b!718784))

(assert (not b!718783))

(assert (not b!718788))

(assert (not b!718781))

(assert (not b!718786))

(check-sat)

