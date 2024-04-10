; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64048 () Bool)

(assert start!64048)

(declare-fun res!481680 () Bool)

(declare-fun e!403652 () Bool)

(assert (=> start!64048 (=> (not res!481680) (not e!403652))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64048 (= res!481680 (validMask!0 mask!3328))))

(assert (=> start!64048 e!403652))

(assert (=> start!64048 true))

(declare-datatypes ((array!40743 0))(
  ( (array!40744 (arr!19497 (Array (_ BitVec 32) (_ BitVec 64))) (size!19918 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40743)

(declare-fun array_inv!15293 (array!40743) Bool)

(assert (=> start!64048 (array_inv!15293 a!3186)))

(declare-fun b!719284 () Bool)

(declare-fun e!403650 () Bool)

(assert (=> b!719284 (= e!403650 false)))

(declare-datatypes ((SeekEntryResult!7097 0))(
  ( (MissingZero!7097 (index!30756 (_ BitVec 32))) (Found!7097 (index!30757 (_ BitVec 32))) (Intermediate!7097 (undefined!7909 Bool) (index!30758 (_ BitVec 32)) (x!61768 (_ BitVec 32))) (Undefined!7097) (MissingVacant!7097 (index!30759 (_ BitVec 32))) )
))
(declare-fun lt!319568 () SeekEntryResult!7097)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40743 (_ BitVec 32)) SeekEntryResult!7097)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719284 (= lt!319568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19497 a!3186) j!159) mask!3328) (select (arr!19497 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719285 () Bool)

(declare-fun res!481681 () Bool)

(assert (=> b!719285 (=> (not res!481681) (not e!403652))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719285 (= res!481681 (and (= (size!19918 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19918 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19918 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719286 () Bool)

(declare-fun res!481678 () Bool)

(assert (=> b!719286 (=> (not res!481678) (not e!403652))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719286 (= res!481678 (validKeyInArray!0 k!2102))))

(declare-fun b!719287 () Bool)

(declare-fun res!481677 () Bool)

(assert (=> b!719287 (=> (not res!481677) (not e!403650))))

(declare-datatypes ((List!13499 0))(
  ( (Nil!13496) (Cons!13495 (h!14543 (_ BitVec 64)) (t!19814 List!13499)) )
))
(declare-fun arrayNoDuplicates!0 (array!40743 (_ BitVec 32) List!13499) Bool)

(assert (=> b!719287 (= res!481677 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13496))))

(declare-fun b!719288 () Bool)

(declare-fun res!481682 () Bool)

(assert (=> b!719288 (=> (not res!481682) (not e!403650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40743 (_ BitVec 32)) Bool)

(assert (=> b!719288 (= res!481682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719289 () Bool)

(declare-fun res!481684 () Bool)

(assert (=> b!719289 (=> (not res!481684) (not e!403652))))

(declare-fun arrayContainsKey!0 (array!40743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719289 (= res!481684 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719290 () Bool)

(declare-fun res!481683 () Bool)

(assert (=> b!719290 (=> (not res!481683) (not e!403652))))

(assert (=> b!719290 (= res!481683 (validKeyInArray!0 (select (arr!19497 a!3186) j!159)))))

(declare-fun b!719291 () Bool)

(assert (=> b!719291 (= e!403652 e!403650)))

(declare-fun res!481685 () Bool)

(assert (=> b!719291 (=> (not res!481685) (not e!403650))))

(declare-fun lt!319567 () SeekEntryResult!7097)

(assert (=> b!719291 (= res!481685 (or (= lt!319567 (MissingZero!7097 i!1173)) (= lt!319567 (MissingVacant!7097 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40743 (_ BitVec 32)) SeekEntryResult!7097)

(assert (=> b!719291 (= lt!319567 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719292 () Bool)

(declare-fun res!481679 () Bool)

(assert (=> b!719292 (=> (not res!481679) (not e!403650))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719292 (= res!481679 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19918 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19918 a!3186))))))

(assert (= (and start!64048 res!481680) b!719285))

(assert (= (and b!719285 res!481681) b!719290))

(assert (= (and b!719290 res!481683) b!719286))

(assert (= (and b!719286 res!481678) b!719289))

(assert (= (and b!719289 res!481684) b!719291))

(assert (= (and b!719291 res!481685) b!719288))

(assert (= (and b!719288 res!481682) b!719287))

(assert (= (and b!719287 res!481677) b!719292))

(assert (= (and b!719292 res!481679) b!719284))

(declare-fun m!674719 () Bool)

(assert (=> b!719284 m!674719))

(assert (=> b!719284 m!674719))

(declare-fun m!674721 () Bool)

(assert (=> b!719284 m!674721))

(assert (=> b!719284 m!674721))

(assert (=> b!719284 m!674719))

(declare-fun m!674723 () Bool)

(assert (=> b!719284 m!674723))

(assert (=> b!719290 m!674719))

(assert (=> b!719290 m!674719))

(declare-fun m!674725 () Bool)

(assert (=> b!719290 m!674725))

(declare-fun m!674727 () Bool)

(assert (=> b!719286 m!674727))

(declare-fun m!674729 () Bool)

(assert (=> b!719291 m!674729))

(declare-fun m!674731 () Bool)

(assert (=> start!64048 m!674731))

(declare-fun m!674733 () Bool)

(assert (=> start!64048 m!674733))

(declare-fun m!674735 () Bool)

(assert (=> b!719287 m!674735))

(declare-fun m!674737 () Bool)

(assert (=> b!719288 m!674737))

(declare-fun m!674739 () Bool)

(assert (=> b!719289 m!674739))

(push 1)

(assert (not b!719288))

(assert (not b!719290))

(assert (not b!719287))

(assert (not b!719289))

(assert (not b!719286))

(assert (not b!719284))

(assert (not start!64048))

(assert (not b!719291))

(check-sat)

