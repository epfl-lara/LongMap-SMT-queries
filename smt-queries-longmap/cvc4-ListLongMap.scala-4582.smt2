; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64010 () Bool)

(assert start!64010)

(declare-fun b!718753 () Bool)

(declare-fun res!481152 () Bool)

(declare-fun e!403479 () Bool)

(assert (=> b!718753 (=> (not res!481152) (not e!403479))))

(declare-datatypes ((array!40705 0))(
  ( (array!40706 (arr!19478 (Array (_ BitVec 32) (_ BitVec 64))) (size!19899 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40705)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718753 (= res!481152 (validKeyInArray!0 (select (arr!19478 a!3186) j!159)))))

(declare-fun b!718754 () Bool)

(declare-fun res!481153 () Bool)

(declare-fun e!403480 () Bool)

(assert (=> b!718754 (=> (not res!481153) (not e!403480))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718754 (= res!481153 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19899 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19899 a!3186))))))

(declare-fun b!718755 () Bool)

(declare-fun res!481147 () Bool)

(assert (=> b!718755 (=> (not res!481147) (not e!403479))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!718755 (= res!481147 (validKeyInArray!0 k!2102))))

(declare-fun b!718756 () Bool)

(declare-fun res!481154 () Bool)

(assert (=> b!718756 (=> (not res!481154) (not e!403480))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40705 (_ BitVec 32)) Bool)

(assert (=> b!718756 (= res!481154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718757 () Bool)

(assert (=> b!718757 (= e!403480 false)))

(declare-fun lt!319472 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718757 (= lt!319472 (toIndex!0 (select (arr!19478 a!3186) j!159) mask!3328))))

(declare-fun b!718758 () Bool)

(declare-fun res!481146 () Bool)

(assert (=> b!718758 (=> (not res!481146) (not e!403480))))

(declare-datatypes ((List!13480 0))(
  ( (Nil!13477) (Cons!13476 (h!14524 (_ BitVec 64)) (t!19795 List!13480)) )
))
(declare-fun arrayNoDuplicates!0 (array!40705 (_ BitVec 32) List!13480) Bool)

(assert (=> b!718758 (= res!481146 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13477))))

(declare-fun b!718759 () Bool)

(declare-fun res!481148 () Bool)

(assert (=> b!718759 (=> (not res!481148) (not e!403479))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718759 (= res!481148 (and (= (size!19899 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19899 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19899 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718760 () Bool)

(assert (=> b!718760 (= e!403479 e!403480)))

(declare-fun res!481150 () Bool)

(assert (=> b!718760 (=> (not res!481150) (not e!403480))))

(declare-datatypes ((SeekEntryResult!7078 0))(
  ( (MissingZero!7078 (index!30680 (_ BitVec 32))) (Found!7078 (index!30681 (_ BitVec 32))) (Intermediate!7078 (undefined!7890 Bool) (index!30682 (_ BitVec 32)) (x!61693 (_ BitVec 32))) (Undefined!7078) (MissingVacant!7078 (index!30683 (_ BitVec 32))) )
))
(declare-fun lt!319471 () SeekEntryResult!7078)

(assert (=> b!718760 (= res!481150 (or (= lt!319471 (MissingZero!7078 i!1173)) (= lt!319471 (MissingVacant!7078 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40705 (_ BitVec 32)) SeekEntryResult!7078)

(assert (=> b!718760 (= lt!319471 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718761 () Bool)

(declare-fun res!481151 () Bool)

(assert (=> b!718761 (=> (not res!481151) (not e!403479))))

(declare-fun arrayContainsKey!0 (array!40705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718761 (= res!481151 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!481149 () Bool)

(assert (=> start!64010 (=> (not res!481149) (not e!403479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64010 (= res!481149 (validMask!0 mask!3328))))

(assert (=> start!64010 e!403479))

(assert (=> start!64010 true))

(declare-fun array_inv!15274 (array!40705) Bool)

(assert (=> start!64010 (array_inv!15274 a!3186)))

(assert (= (and start!64010 res!481149) b!718759))

(assert (= (and b!718759 res!481148) b!718753))

(assert (= (and b!718753 res!481152) b!718755))

(assert (= (and b!718755 res!481147) b!718761))

(assert (= (and b!718761 res!481151) b!718760))

(assert (= (and b!718760 res!481150) b!718756))

(assert (= (and b!718756 res!481154) b!718758))

(assert (= (and b!718758 res!481146) b!718754))

(assert (= (and b!718754 res!481153) b!718757))

(declare-fun m!674297 () Bool)

(assert (=> b!718755 m!674297))

(declare-fun m!674299 () Bool)

(assert (=> start!64010 m!674299))

(declare-fun m!674301 () Bool)

(assert (=> start!64010 m!674301))

(declare-fun m!674303 () Bool)

(assert (=> b!718753 m!674303))

(assert (=> b!718753 m!674303))

(declare-fun m!674305 () Bool)

(assert (=> b!718753 m!674305))

(declare-fun m!674307 () Bool)

(assert (=> b!718756 m!674307))

(assert (=> b!718757 m!674303))

(assert (=> b!718757 m!674303))

(declare-fun m!674309 () Bool)

(assert (=> b!718757 m!674309))

(declare-fun m!674311 () Bool)

(assert (=> b!718761 m!674311))

(declare-fun m!674313 () Bool)

(assert (=> b!718758 m!674313))

(declare-fun m!674315 () Bool)

(assert (=> b!718760 m!674315))

(push 1)

(assert (not b!718756))

(assert (not b!718758))

(assert (not b!718757))

(assert (not b!718755))

(assert (not start!64010))

(assert (not b!718760))

(assert (not b!718753))

(assert (not b!718761))

