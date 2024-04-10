; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64058 () Bool)

(assert start!64058)

(declare-fun b!719419 () Bool)

(declare-fun res!481813 () Bool)

(declare-fun e!403696 () Bool)

(assert (=> b!719419 (=> (not res!481813) (not e!403696))))

(declare-datatypes ((array!40753 0))(
  ( (array!40754 (arr!19502 (Array (_ BitVec 32) (_ BitVec 64))) (size!19923 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40753)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40753 (_ BitVec 32)) Bool)

(assert (=> b!719419 (= res!481813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719420 () Bool)

(declare-fun res!481814 () Bool)

(assert (=> b!719420 (=> (not res!481814) (not e!403696))))

(declare-datatypes ((List!13504 0))(
  ( (Nil!13501) (Cons!13500 (h!14548 (_ BitVec 64)) (t!19819 List!13504)) )
))
(declare-fun arrayNoDuplicates!0 (array!40753 (_ BitVec 32) List!13504) Bool)

(assert (=> b!719420 (= res!481814 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13501))))

(declare-fun res!481819 () Bool)

(declare-fun e!403695 () Bool)

(assert (=> start!64058 (=> (not res!481819) (not e!403695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64058 (= res!481819 (validMask!0 mask!3328))))

(assert (=> start!64058 e!403695))

(assert (=> start!64058 true))

(declare-fun array_inv!15298 (array!40753) Bool)

(assert (=> start!64058 (array_inv!15298 a!3186)))

(declare-fun b!719421 () Bool)

(declare-fun res!481812 () Bool)

(assert (=> b!719421 (=> (not res!481812) (not e!403695))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719421 (= res!481812 (validKeyInArray!0 k!2102))))

(declare-fun b!719422 () Bool)

(assert (=> b!719422 (= e!403695 e!403696)))

(declare-fun res!481816 () Bool)

(assert (=> b!719422 (=> (not res!481816) (not e!403696))))

(declare-datatypes ((SeekEntryResult!7102 0))(
  ( (MissingZero!7102 (index!30776 (_ BitVec 32))) (Found!7102 (index!30777 (_ BitVec 32))) (Intermediate!7102 (undefined!7914 Bool) (index!30778 (_ BitVec 32)) (x!61781 (_ BitVec 32))) (Undefined!7102) (MissingVacant!7102 (index!30779 (_ BitVec 32))) )
))
(declare-fun lt!319597 () SeekEntryResult!7102)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719422 (= res!481816 (or (= lt!319597 (MissingZero!7102 i!1173)) (= lt!319597 (MissingVacant!7102 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40753 (_ BitVec 32)) SeekEntryResult!7102)

(assert (=> b!719422 (= lt!319597 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719423 () Bool)

(declare-fun res!481818 () Bool)

(assert (=> b!719423 (=> (not res!481818) (not e!403695))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719423 (= res!481818 (validKeyInArray!0 (select (arr!19502 a!3186) j!159)))))

(declare-fun b!719424 () Bool)

(declare-fun res!481817 () Bool)

(assert (=> b!719424 (=> (not res!481817) (not e!403695))))

(assert (=> b!719424 (= res!481817 (and (= (size!19923 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19923 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19923 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719425 () Bool)

(declare-fun res!481815 () Bool)

(assert (=> b!719425 (=> (not res!481815) (not e!403696))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719425 (= res!481815 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19923 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19923 a!3186))))))

(declare-fun b!719426 () Bool)

(assert (=> b!719426 (= e!403696 false)))

(declare-fun lt!319598 () SeekEntryResult!7102)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40753 (_ BitVec 32)) SeekEntryResult!7102)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719426 (= lt!319598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19502 a!3186) j!159) mask!3328) (select (arr!19502 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719427 () Bool)

(declare-fun res!481820 () Bool)

(assert (=> b!719427 (=> (not res!481820) (not e!403695))))

(declare-fun arrayContainsKey!0 (array!40753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719427 (= res!481820 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64058 res!481819) b!719424))

(assert (= (and b!719424 res!481817) b!719423))

(assert (= (and b!719423 res!481818) b!719421))

(assert (= (and b!719421 res!481812) b!719427))

(assert (= (and b!719427 res!481820) b!719422))

(assert (= (and b!719422 res!481816) b!719419))

(assert (= (and b!719419 res!481813) b!719420))

(assert (= (and b!719420 res!481814) b!719425))

(assert (= (and b!719425 res!481815) b!719426))

(declare-fun m!674829 () Bool)

(assert (=> b!719420 m!674829))

(declare-fun m!674831 () Bool)

(assert (=> b!719423 m!674831))

(assert (=> b!719423 m!674831))

(declare-fun m!674833 () Bool)

(assert (=> b!719423 m!674833))

(assert (=> b!719426 m!674831))

(assert (=> b!719426 m!674831))

(declare-fun m!674835 () Bool)

(assert (=> b!719426 m!674835))

(assert (=> b!719426 m!674835))

(assert (=> b!719426 m!674831))

(declare-fun m!674837 () Bool)

(assert (=> b!719426 m!674837))

(declare-fun m!674839 () Bool)

(assert (=> b!719427 m!674839))

(declare-fun m!674841 () Bool)

(assert (=> b!719419 m!674841))

(declare-fun m!674843 () Bool)

(assert (=> b!719421 m!674843))

(declare-fun m!674845 () Bool)

(assert (=> b!719422 m!674845))

(declare-fun m!674847 () Bool)

(assert (=> start!64058 m!674847))

(declare-fun m!674849 () Bool)

(assert (=> start!64058 m!674849))

(push 1)

(assert (not b!719427))

(assert (not b!719419))

(assert (not b!719420))

(assert (not start!64058))

(assert (not b!719421))

(assert (not b!719423))

(assert (not b!719426))

(assert (not b!719422))

(check-sat)

(pop 1)

