; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64088 () Bool)

(assert start!64088)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40783 0))(
  ( (array!40784 (arr!19517 (Array (_ BitVec 32) (_ BitVec 64))) (size!19938 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40783)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!403830 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!719850 () Bool)

(assert (=> b!719850 (= e!403830 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19517 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719851 () Bool)

(declare-fun res!482244 () Bool)

(declare-fun e!403832 () Bool)

(assert (=> b!719851 (=> (not res!482244) (not e!403832))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719851 (= res!482244 (validKeyInArray!0 k!2102))))

(declare-fun b!719852 () Bool)

(assert (=> b!719852 (= e!403832 e!403830)))

(declare-fun res!482249 () Bool)

(assert (=> b!719852 (=> (not res!482249) (not e!403830))))

(declare-datatypes ((SeekEntryResult!7117 0))(
  ( (MissingZero!7117 (index!30836 (_ BitVec 32))) (Found!7117 (index!30837 (_ BitVec 32))) (Intermediate!7117 (undefined!7929 Bool) (index!30838 (_ BitVec 32)) (x!61836 (_ BitVec 32))) (Undefined!7117) (MissingVacant!7117 (index!30839 (_ BitVec 32))) )
))
(declare-fun lt!319661 () SeekEntryResult!7117)

(assert (=> b!719852 (= res!482249 (or (= lt!319661 (MissingZero!7117 i!1173)) (= lt!319661 (MissingVacant!7117 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40783 (_ BitVec 32)) SeekEntryResult!7117)

(assert (=> b!719852 (= lt!319661 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719853 () Bool)

(declare-fun res!482246 () Bool)

(assert (=> b!719853 (=> (not res!482246) (not e!403832))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719853 (= res!482246 (validKeyInArray!0 (select (arr!19517 a!3186) j!159)))))

(declare-fun b!719854 () Bool)

(declare-fun res!482251 () Bool)

(assert (=> b!719854 (=> (not res!482251) (not e!403830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40783 (_ BitVec 32)) Bool)

(assert (=> b!719854 (= res!482251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719855 () Bool)

(declare-fun res!482245 () Bool)

(assert (=> b!719855 (=> (not res!482245) (not e!403830))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40783 (_ BitVec 32)) SeekEntryResult!7117)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719855 (= res!482245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19517 a!3186) j!159) mask!3328) (select (arr!19517 a!3186) j!159) a!3186 mask!3328) (Intermediate!7117 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719856 () Bool)

(declare-fun res!482248 () Bool)

(assert (=> b!719856 (=> (not res!482248) (not e!403830))))

(assert (=> b!719856 (= res!482248 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19938 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19938 a!3186))))))

(declare-fun b!719857 () Bool)

(declare-fun res!482247 () Bool)

(assert (=> b!719857 (=> (not res!482247) (not e!403832))))

(assert (=> b!719857 (= res!482247 (and (= (size!19938 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19938 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19938 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719858 () Bool)

(declare-fun res!482252 () Bool)

(assert (=> b!719858 (=> (not res!482252) (not e!403830))))

(declare-datatypes ((List!13519 0))(
  ( (Nil!13516) (Cons!13515 (h!14563 (_ BitVec 64)) (t!19834 List!13519)) )
))
(declare-fun arrayNoDuplicates!0 (array!40783 (_ BitVec 32) List!13519) Bool)

(assert (=> b!719858 (= res!482252 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13516))))

(declare-fun b!719859 () Bool)

(declare-fun res!482250 () Bool)

(assert (=> b!719859 (=> (not res!482250) (not e!403832))))

(declare-fun arrayContainsKey!0 (array!40783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719859 (= res!482250 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!482243 () Bool)

(assert (=> start!64088 (=> (not res!482243) (not e!403832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64088 (= res!482243 (validMask!0 mask!3328))))

(assert (=> start!64088 e!403832))

(assert (=> start!64088 true))

(declare-fun array_inv!15313 (array!40783) Bool)

(assert (=> start!64088 (array_inv!15313 a!3186)))

(assert (= (and start!64088 res!482243) b!719857))

(assert (= (and b!719857 res!482247) b!719853))

(assert (= (and b!719853 res!482246) b!719851))

(assert (= (and b!719851 res!482244) b!719859))

(assert (= (and b!719859 res!482250) b!719852))

(assert (= (and b!719852 res!482249) b!719854))

(assert (= (and b!719854 res!482251) b!719858))

(assert (= (and b!719858 res!482252) b!719856))

(assert (= (and b!719856 res!482248) b!719855))

(assert (= (and b!719855 res!482245) b!719850))

(declare-fun m!675175 () Bool)

(assert (=> b!719859 m!675175))

(declare-fun m!675177 () Bool)

(assert (=> b!719858 m!675177))

(declare-fun m!675179 () Bool)

(assert (=> b!719852 m!675179))

(declare-fun m!675181 () Bool)

(assert (=> start!64088 m!675181))

(declare-fun m!675183 () Bool)

(assert (=> start!64088 m!675183))

(declare-fun m!675185 () Bool)

(assert (=> b!719853 m!675185))

(assert (=> b!719853 m!675185))

(declare-fun m!675187 () Bool)

(assert (=> b!719853 m!675187))

(declare-fun m!675189 () Bool)

(assert (=> b!719850 m!675189))

(assert (=> b!719855 m!675185))

(assert (=> b!719855 m!675185))

(declare-fun m!675191 () Bool)

(assert (=> b!719855 m!675191))

(assert (=> b!719855 m!675191))

(assert (=> b!719855 m!675185))

(declare-fun m!675193 () Bool)

(assert (=> b!719855 m!675193))

(declare-fun m!675195 () Bool)

(assert (=> b!719854 m!675195))

(declare-fun m!675197 () Bool)

(assert (=> b!719851 m!675197))

(push 1)

(assert (not b!719851))

(assert (not b!719858))

(assert (not b!719859))

(assert (not b!719852))

(assert (not start!64088))

(assert (not b!719853))

(assert (not b!719855))

(assert (not b!719854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

