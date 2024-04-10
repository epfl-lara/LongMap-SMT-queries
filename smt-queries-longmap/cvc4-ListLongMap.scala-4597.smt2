; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64100 () Bool)

(assert start!64100)

(declare-fun b!720013 () Bool)

(declare-fun res!482410 () Bool)

(declare-fun e!403884 () Bool)

(assert (=> b!720013 (=> (not res!482410) (not e!403884))))

(declare-datatypes ((array!40795 0))(
  ( (array!40796 (arr!19523 (Array (_ BitVec 32) (_ BitVec 64))) (size!19944 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40795)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720013 (= res!482410 (validKeyInArray!0 (select (arr!19523 a!3186) j!159)))))

(declare-fun b!720014 () Bool)

(declare-fun e!403886 () Bool)

(assert (=> b!720014 (= e!403886 false)))

(declare-datatypes ((SeekEntryResult!7123 0))(
  ( (MissingZero!7123 (index!30860 (_ BitVec 32))) (Found!7123 (index!30861 (_ BitVec 32))) (Intermediate!7123 (undefined!7935 Bool) (index!30862 (_ BitVec 32)) (x!61858 (_ BitVec 32))) (Undefined!7123) (MissingVacant!7123 (index!30863 (_ BitVec 32))) )
))
(declare-fun lt!319697 () SeekEntryResult!7123)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40795 (_ BitVec 32)) SeekEntryResult!7123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720014 (= lt!319697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19523 a!3186) j!159) mask!3328) (select (arr!19523 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720015 () Bool)

(declare-fun res!482413 () Bool)

(assert (=> b!720015 (=> (not res!482413) (not e!403886))))

(declare-datatypes ((List!13525 0))(
  ( (Nil!13522) (Cons!13521 (h!14569 (_ BitVec 64)) (t!19840 List!13525)) )
))
(declare-fun arrayNoDuplicates!0 (array!40795 (_ BitVec 32) List!13525) Bool)

(assert (=> b!720015 (= res!482413 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13522))))

(declare-fun b!720016 () Bool)

(declare-fun res!482411 () Bool)

(assert (=> b!720016 (=> (not res!482411) (not e!403886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40795 (_ BitVec 32)) Bool)

(assert (=> b!720016 (= res!482411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720017 () Bool)

(declare-fun res!482412 () Bool)

(assert (=> b!720017 (=> (not res!482412) (not e!403884))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!720017 (= res!482412 (validKeyInArray!0 k!2102))))

(declare-fun res!482407 () Bool)

(assert (=> start!64100 (=> (not res!482407) (not e!403884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64100 (= res!482407 (validMask!0 mask!3328))))

(assert (=> start!64100 e!403884))

(assert (=> start!64100 true))

(declare-fun array_inv!15319 (array!40795) Bool)

(assert (=> start!64100 (array_inv!15319 a!3186)))

(declare-fun b!720018 () Bool)

(assert (=> b!720018 (= e!403884 e!403886)))

(declare-fun res!482406 () Bool)

(assert (=> b!720018 (=> (not res!482406) (not e!403886))))

(declare-fun lt!319696 () SeekEntryResult!7123)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720018 (= res!482406 (or (= lt!319696 (MissingZero!7123 i!1173)) (= lt!319696 (MissingVacant!7123 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40795 (_ BitVec 32)) SeekEntryResult!7123)

(assert (=> b!720018 (= lt!319696 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720019 () Bool)

(declare-fun res!482409 () Bool)

(assert (=> b!720019 (=> (not res!482409) (not e!403886))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720019 (= res!482409 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19944 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19944 a!3186))))))

(declare-fun b!720020 () Bool)

(declare-fun res!482408 () Bool)

(assert (=> b!720020 (=> (not res!482408) (not e!403884))))

(declare-fun arrayContainsKey!0 (array!40795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720020 (= res!482408 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720021 () Bool)

(declare-fun res!482414 () Bool)

(assert (=> b!720021 (=> (not res!482414) (not e!403884))))

(assert (=> b!720021 (= res!482414 (and (= (size!19944 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19944 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19944 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64100 res!482407) b!720021))

(assert (= (and b!720021 res!482414) b!720013))

(assert (= (and b!720013 res!482410) b!720017))

(assert (= (and b!720017 res!482412) b!720020))

(assert (= (and b!720020 res!482408) b!720018))

(assert (= (and b!720018 res!482406) b!720016))

(assert (= (and b!720016 res!482411) b!720015))

(assert (= (and b!720015 res!482413) b!720019))

(assert (= (and b!720019 res!482409) b!720014))

(declare-fun m!675309 () Bool)

(assert (=> b!720020 m!675309))

(declare-fun m!675311 () Bool)

(assert (=> b!720013 m!675311))

(assert (=> b!720013 m!675311))

(declare-fun m!675313 () Bool)

(assert (=> b!720013 m!675313))

(assert (=> b!720014 m!675311))

(assert (=> b!720014 m!675311))

(declare-fun m!675315 () Bool)

(assert (=> b!720014 m!675315))

(assert (=> b!720014 m!675315))

(assert (=> b!720014 m!675311))

(declare-fun m!675317 () Bool)

(assert (=> b!720014 m!675317))

(declare-fun m!675319 () Bool)

(assert (=> b!720017 m!675319))

(declare-fun m!675321 () Bool)

(assert (=> b!720016 m!675321))

(declare-fun m!675323 () Bool)

(assert (=> b!720015 m!675323))

(declare-fun m!675325 () Bool)

(assert (=> b!720018 m!675325))

(declare-fun m!675327 () Bool)

(assert (=> start!64100 m!675327))

(declare-fun m!675329 () Bool)

(assert (=> start!64100 m!675329))

(push 1)

(assert (not b!720017))

(assert (not b!720020))

(assert (not b!720015))

(assert (not b!720016))

(assert (not start!64100))

(assert (not b!720013))

(assert (not b!720018))

(assert (not b!720014))

(check-sat)

