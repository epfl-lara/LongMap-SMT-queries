; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63994 () Bool)

(assert start!63994)

(declare-fun b!718557 () Bool)

(declare-fun res!481094 () Bool)

(declare-fun e!403344 () Bool)

(assert (=> b!718557 (=> (not res!481094) (not e!403344))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718557 (= res!481094 (validKeyInArray!0 k!2102))))

(declare-fun b!718559 () Bool)

(declare-fun res!481090 () Bool)

(declare-fun e!403343 () Bool)

(assert (=> b!718559 (=> (not res!481090) (not e!403343))))

(declare-datatypes ((array!40706 0))(
  ( (array!40707 (arr!19479 (Array (_ BitVec 32) (_ BitVec 64))) (size!19900 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40706)

(declare-datatypes ((List!13520 0))(
  ( (Nil!13517) (Cons!13516 (h!14564 (_ BitVec 64)) (t!19826 List!13520)) )
))
(declare-fun arrayNoDuplicates!0 (array!40706 (_ BitVec 32) List!13520) Bool)

(assert (=> b!718559 (= res!481090 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13517))))

(declare-fun b!718560 () Bool)

(declare-fun res!481097 () Bool)

(assert (=> b!718560 (=> (not res!481097) (not e!403343))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718560 (= res!481097 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19900 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19900 a!3186))))))

(declare-fun b!718561 () Bool)

(assert (=> b!718561 (= e!403344 e!403343)))

(declare-fun res!481095 () Bool)

(assert (=> b!718561 (=> (not res!481095) (not e!403343))))

(declare-datatypes ((SeekEntryResult!7076 0))(
  ( (MissingZero!7076 (index!30672 (_ BitVec 32))) (Found!7076 (index!30673 (_ BitVec 32))) (Intermediate!7076 (undefined!7888 Bool) (index!30674 (_ BitVec 32)) (x!61694 (_ BitVec 32))) (Undefined!7076) (MissingVacant!7076 (index!30675 (_ BitVec 32))) )
))
(declare-fun lt!319243 () SeekEntryResult!7076)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718561 (= res!481095 (or (= lt!319243 (MissingZero!7076 i!1173)) (= lt!319243 (MissingVacant!7076 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40706 (_ BitVec 32)) SeekEntryResult!7076)

(assert (=> b!718561 (= lt!319243 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718562 () Bool)

(assert (=> b!718562 (= e!403343 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319244 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718562 (= lt!319244 (toIndex!0 (select (arr!19479 a!3186) j!159) mask!3328))))

(declare-fun b!718563 () Bool)

(declare-fun res!481098 () Bool)

(assert (=> b!718563 (=> (not res!481098) (not e!403344))))

(assert (=> b!718563 (= res!481098 (validKeyInArray!0 (select (arr!19479 a!3186) j!159)))))

(declare-fun b!718558 () Bool)

(declare-fun res!481096 () Bool)

(assert (=> b!718558 (=> (not res!481096) (not e!403344))))

(declare-fun arrayContainsKey!0 (array!40706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718558 (= res!481096 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!481092 () Bool)

(assert (=> start!63994 (=> (not res!481092) (not e!403344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63994 (= res!481092 (validMask!0 mask!3328))))

(assert (=> start!63994 e!403344))

(assert (=> start!63994 true))

(declare-fun array_inv!15362 (array!40706) Bool)

(assert (=> start!63994 (array_inv!15362 a!3186)))

(declare-fun b!718564 () Bool)

(declare-fun res!481091 () Bool)

(assert (=> b!718564 (=> (not res!481091) (not e!403344))))

(assert (=> b!718564 (= res!481091 (and (= (size!19900 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19900 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19900 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718565 () Bool)

(declare-fun res!481093 () Bool)

(assert (=> b!718565 (=> (not res!481093) (not e!403343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40706 (_ BitVec 32)) Bool)

(assert (=> b!718565 (= res!481093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!63994 res!481092) b!718564))

(assert (= (and b!718564 res!481091) b!718563))

(assert (= (and b!718563 res!481098) b!718557))

(assert (= (and b!718557 res!481094) b!718558))

(assert (= (and b!718558 res!481096) b!718561))

(assert (= (and b!718561 res!481095) b!718565))

(assert (= (and b!718565 res!481093) b!718559))

(assert (= (and b!718559 res!481090) b!718560))

(assert (= (and b!718560 res!481097) b!718562))

(declare-fun m!673579 () Bool)

(assert (=> b!718563 m!673579))

(assert (=> b!718563 m!673579))

(declare-fun m!673581 () Bool)

(assert (=> b!718563 m!673581))

(declare-fun m!673583 () Bool)

(assert (=> b!718561 m!673583))

(declare-fun m!673585 () Bool)

(assert (=> b!718558 m!673585))

(declare-fun m!673587 () Bool)

(assert (=> b!718559 m!673587))

(declare-fun m!673589 () Bool)

(assert (=> start!63994 m!673589))

(declare-fun m!673591 () Bool)

(assert (=> start!63994 m!673591))

(assert (=> b!718562 m!673579))

(assert (=> b!718562 m!673579))

(declare-fun m!673593 () Bool)

(assert (=> b!718562 m!673593))

(declare-fun m!673595 () Bool)

(assert (=> b!718565 m!673595))

(declare-fun m!673597 () Bool)

(assert (=> b!718557 m!673597))

(push 1)

(assert (not b!718565))

(assert (not b!718557))

(assert (not b!718559))

(assert (not b!718558))

(assert (not start!63994))

(assert (not b!718562))

(assert (not b!718563))

(assert (not b!718561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

