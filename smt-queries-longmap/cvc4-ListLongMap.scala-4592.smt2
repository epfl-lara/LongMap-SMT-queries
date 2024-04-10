; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64070 () Bool)

(assert start!64070)

(declare-fun res!481988 () Bool)

(declare-fun e!403749 () Bool)

(assert (=> start!64070 (=> (not res!481988) (not e!403749))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64070 (= res!481988 (validMask!0 mask!3328))))

(assert (=> start!64070 e!403749))

(assert (=> start!64070 true))

(declare-datatypes ((array!40765 0))(
  ( (array!40766 (arr!19508 (Array (_ BitVec 32) (_ BitVec 64))) (size!19929 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40765)

(declare-fun array_inv!15304 (array!40765) Bool)

(assert (=> start!64070 (array_inv!15304 a!3186)))

(declare-fun b!719590 () Bool)

(declare-fun e!403751 () Bool)

(assert (=> b!719590 (= e!403749 e!403751)))

(declare-fun res!481984 () Bool)

(assert (=> b!719590 (=> (not res!481984) (not e!403751))))

(declare-datatypes ((SeekEntryResult!7108 0))(
  ( (MissingZero!7108 (index!30800 (_ BitVec 32))) (Found!7108 (index!30801 (_ BitVec 32))) (Intermediate!7108 (undefined!7920 Bool) (index!30802 (_ BitVec 32)) (x!61803 (_ BitVec 32))) (Undefined!7108) (MissingVacant!7108 (index!30803 (_ BitVec 32))) )
))
(declare-fun lt!319625 () SeekEntryResult!7108)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719590 (= res!481984 (or (= lt!319625 (MissingZero!7108 i!1173)) (= lt!319625 (MissingVacant!7108 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40765 (_ BitVec 32)) SeekEntryResult!7108)

(assert (=> b!719590 (= lt!319625 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719591 () Bool)

(declare-fun res!481987 () Bool)

(assert (=> b!719591 (=> (not res!481987) (not e!403751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40765 (_ BitVec 32)) Bool)

(assert (=> b!719591 (= res!481987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719592 () Bool)

(assert (=> b!719592 (= e!403751 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319624 () SeekEntryResult!7108)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40765 (_ BitVec 32)) SeekEntryResult!7108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719592 (= lt!319624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19508 a!3186) j!159) mask!3328) (select (arr!19508 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719593 () Bool)

(declare-fun res!481983 () Bool)

(assert (=> b!719593 (=> (not res!481983) (not e!403749))))

(declare-fun arrayContainsKey!0 (array!40765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719593 (= res!481983 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719594 () Bool)

(declare-fun res!481990 () Bool)

(assert (=> b!719594 (=> (not res!481990) (not e!403751))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719594 (= res!481990 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19929 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19929 a!3186))))))

(declare-fun b!719595 () Bool)

(declare-fun res!481989 () Bool)

(assert (=> b!719595 (=> (not res!481989) (not e!403749))))

(assert (=> b!719595 (= res!481989 (and (= (size!19929 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19929 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19929 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719596 () Bool)

(declare-fun res!481986 () Bool)

(assert (=> b!719596 (=> (not res!481986) (not e!403751))))

(declare-datatypes ((List!13510 0))(
  ( (Nil!13507) (Cons!13506 (h!14554 (_ BitVec 64)) (t!19825 List!13510)) )
))
(declare-fun arrayNoDuplicates!0 (array!40765 (_ BitVec 32) List!13510) Bool)

(assert (=> b!719596 (= res!481986 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13507))))

(declare-fun b!719597 () Bool)

(declare-fun res!481991 () Bool)

(assert (=> b!719597 (=> (not res!481991) (not e!403749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719597 (= res!481991 (validKeyInArray!0 (select (arr!19508 a!3186) j!159)))))

(declare-fun b!719598 () Bool)

(declare-fun res!481985 () Bool)

(assert (=> b!719598 (=> (not res!481985) (not e!403749))))

(assert (=> b!719598 (= res!481985 (validKeyInArray!0 k!2102))))

(assert (= (and start!64070 res!481988) b!719595))

(assert (= (and b!719595 res!481989) b!719597))

(assert (= (and b!719597 res!481991) b!719598))

(assert (= (and b!719598 res!481985) b!719593))

(assert (= (and b!719593 res!481983) b!719590))

(assert (= (and b!719590 res!481984) b!719591))

(assert (= (and b!719591 res!481987) b!719596))

(assert (= (and b!719596 res!481986) b!719594))

(assert (= (and b!719594 res!481990) b!719592))

(declare-fun m!674967 () Bool)

(assert (=> b!719596 m!674967))

(declare-fun m!674969 () Bool)

(assert (=> b!719597 m!674969))

(assert (=> b!719597 m!674969))

(declare-fun m!674971 () Bool)

(assert (=> b!719597 m!674971))

(declare-fun m!674973 () Bool)

(assert (=> start!64070 m!674973))

(declare-fun m!674975 () Bool)

(assert (=> start!64070 m!674975))

(declare-fun m!674977 () Bool)

(assert (=> b!719593 m!674977))

(assert (=> b!719592 m!674969))

(assert (=> b!719592 m!674969))

(declare-fun m!674979 () Bool)

(assert (=> b!719592 m!674979))

(assert (=> b!719592 m!674979))

(assert (=> b!719592 m!674969))

(declare-fun m!674981 () Bool)

(assert (=> b!719592 m!674981))

(declare-fun m!674983 () Bool)

(assert (=> b!719598 m!674983))

(declare-fun m!674985 () Bool)

(assert (=> b!719591 m!674985))

(declare-fun m!674987 () Bool)

(assert (=> b!719590 m!674987))

(push 1)

(assert (not b!719598))

(assert (not b!719591))

(assert (not b!719596))

(assert (not b!719597))

(assert (not b!719592))

(assert (not b!719593))

(assert (not start!64070))

(assert (not b!719590))

(check-sat)

