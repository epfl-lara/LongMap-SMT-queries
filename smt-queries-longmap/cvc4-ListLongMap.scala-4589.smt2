; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64052 () Bool)

(assert start!64052)

(declare-fun b!719338 () Bool)

(declare-fun e!403670 () Bool)

(declare-fun e!403668 () Bool)

(assert (=> b!719338 (= e!403670 e!403668)))

(declare-fun res!481734 () Bool)

(assert (=> b!719338 (=> (not res!481734) (not e!403668))))

(declare-datatypes ((SeekEntryResult!7099 0))(
  ( (MissingZero!7099 (index!30764 (_ BitVec 32))) (Found!7099 (index!30765 (_ BitVec 32))) (Intermediate!7099 (undefined!7911 Bool) (index!30766 (_ BitVec 32)) (x!61770 (_ BitVec 32))) (Undefined!7099) (MissingVacant!7099 (index!30767 (_ BitVec 32))) )
))
(declare-fun lt!319579 () SeekEntryResult!7099)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719338 (= res!481734 (or (= lt!319579 (MissingZero!7099 i!1173)) (= lt!319579 (MissingVacant!7099 i!1173))))))

(declare-datatypes ((array!40747 0))(
  ( (array!40748 (arr!19499 (Array (_ BitVec 32) (_ BitVec 64))) (size!19920 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40747)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40747 (_ BitVec 32)) SeekEntryResult!7099)

(assert (=> b!719338 (= lt!319579 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719339 () Bool)

(declare-fun res!481738 () Bool)

(assert (=> b!719339 (=> (not res!481738) (not e!403670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719339 (= res!481738 (validKeyInArray!0 k!2102))))

(declare-fun b!719340 () Bool)

(declare-fun res!481739 () Bool)

(assert (=> b!719340 (=> (not res!481739) (not e!403668))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719340 (= res!481739 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19920 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19920 a!3186))))))

(declare-fun b!719341 () Bool)

(declare-fun res!481732 () Bool)

(assert (=> b!719341 (=> (not res!481732) (not e!403670))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719341 (= res!481732 (validKeyInArray!0 (select (arr!19499 a!3186) j!159)))))

(declare-fun b!719342 () Bool)

(declare-fun res!481731 () Bool)

(assert (=> b!719342 (=> (not res!481731) (not e!403668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40747 (_ BitVec 32)) Bool)

(assert (=> b!719342 (= res!481731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719343 () Bool)

(assert (=> b!719343 (= e!403668 false)))

(declare-fun lt!319580 () SeekEntryResult!7099)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40747 (_ BitVec 32)) SeekEntryResult!7099)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719343 (= lt!319580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19499 a!3186) j!159) mask!3328) (select (arr!19499 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719344 () Bool)

(declare-fun res!481737 () Bool)

(assert (=> b!719344 (=> (not res!481737) (not e!403668))))

(declare-datatypes ((List!13501 0))(
  ( (Nil!13498) (Cons!13497 (h!14545 (_ BitVec 64)) (t!19816 List!13501)) )
))
(declare-fun arrayNoDuplicates!0 (array!40747 (_ BitVec 32) List!13501) Bool)

(assert (=> b!719344 (= res!481737 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13498))))

(declare-fun b!719345 () Bool)

(declare-fun res!481733 () Bool)

(assert (=> b!719345 (=> (not res!481733) (not e!403670))))

(declare-fun arrayContainsKey!0 (array!40747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719345 (= res!481733 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!481736 () Bool)

(assert (=> start!64052 (=> (not res!481736) (not e!403670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64052 (= res!481736 (validMask!0 mask!3328))))

(assert (=> start!64052 e!403670))

(assert (=> start!64052 true))

(declare-fun array_inv!15295 (array!40747) Bool)

(assert (=> start!64052 (array_inv!15295 a!3186)))

(declare-fun b!719346 () Bool)

(declare-fun res!481735 () Bool)

(assert (=> b!719346 (=> (not res!481735) (not e!403670))))

(assert (=> b!719346 (= res!481735 (and (= (size!19920 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19920 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19920 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64052 res!481736) b!719346))

(assert (= (and b!719346 res!481735) b!719341))

(assert (= (and b!719341 res!481732) b!719339))

(assert (= (and b!719339 res!481738) b!719345))

(assert (= (and b!719345 res!481733) b!719338))

(assert (= (and b!719338 res!481734) b!719342))

(assert (= (and b!719342 res!481731) b!719344))

(assert (= (and b!719344 res!481737) b!719340))

(assert (= (and b!719340 res!481739) b!719343))

(declare-fun m!674763 () Bool)

(assert (=> b!719344 m!674763))

(declare-fun m!674765 () Bool)

(assert (=> b!719338 m!674765))

(declare-fun m!674767 () Bool)

(assert (=> b!719341 m!674767))

(assert (=> b!719341 m!674767))

(declare-fun m!674769 () Bool)

(assert (=> b!719341 m!674769))

(declare-fun m!674771 () Bool)

(assert (=> b!719342 m!674771))

(declare-fun m!674773 () Bool)

(assert (=> b!719339 m!674773))

(assert (=> b!719343 m!674767))

(assert (=> b!719343 m!674767))

(declare-fun m!674775 () Bool)

(assert (=> b!719343 m!674775))

(assert (=> b!719343 m!674775))

(assert (=> b!719343 m!674767))

(declare-fun m!674777 () Bool)

(assert (=> b!719343 m!674777))

(declare-fun m!674779 () Bool)

(assert (=> b!719345 m!674779))

(declare-fun m!674781 () Bool)

(assert (=> start!64052 m!674781))

(declare-fun m!674783 () Bool)

(assert (=> start!64052 m!674783))

(push 1)

(assert (not start!64052))

(assert (not b!719341))

(assert (not b!719342))

(assert (not b!719338))

(assert (not b!719344))

(assert (not b!719345))

(assert (not b!719339))

(assert (not b!719343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

