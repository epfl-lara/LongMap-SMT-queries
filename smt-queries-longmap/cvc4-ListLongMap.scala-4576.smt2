; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63884 () Bool)

(assert start!63884)

(declare-fun b!717971 () Bool)

(declare-fun e!403102 () Bool)

(declare-fun e!403103 () Bool)

(assert (=> b!717971 (= e!403102 e!403103)))

(declare-fun res!480541 () Bool)

(assert (=> b!717971 (=> (not res!480541) (not e!403103))))

(declare-datatypes ((SeekEntryResult!7060 0))(
  ( (MissingZero!7060 (index!30608 (_ BitVec 32))) (Found!7060 (index!30609 (_ BitVec 32))) (Intermediate!7060 (undefined!7872 Bool) (index!30610 (_ BitVec 32)) (x!61624 (_ BitVec 32))) (Undefined!7060) (MissingVacant!7060 (index!30611 (_ BitVec 32))) )
))
(declare-fun lt!319247 () SeekEntryResult!7060)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717971 (= res!480541 (or (= lt!319247 (MissingZero!7060 i!1173)) (= lt!319247 (MissingVacant!7060 i!1173))))))

(declare-datatypes ((array!40663 0))(
  ( (array!40664 (arr!19460 (Array (_ BitVec 32) (_ BitVec 64))) (size!19881 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40663)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40663 (_ BitVec 32)) SeekEntryResult!7060)

(assert (=> b!717971 (= lt!319247 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717972 () Bool)

(declare-fun res!480546 () Bool)

(assert (=> b!717972 (=> (not res!480546) (not e!403102))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717972 (= res!480546 (validKeyInArray!0 (select (arr!19460 a!3186) j!159)))))

(declare-fun b!717973 () Bool)

(declare-fun res!480545 () Bool)

(assert (=> b!717973 (=> (not res!480545) (not e!403102))))

(declare-fun arrayContainsKey!0 (array!40663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717973 (= res!480545 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!717974 () Bool)

(assert (=> b!717974 (= e!403103 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19881 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19881 a!3186)) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!717975 () Bool)

(declare-fun res!480543 () Bool)

(assert (=> b!717975 (=> (not res!480543) (not e!403102))))

(assert (=> b!717975 (= res!480543 (validKeyInArray!0 k!2102))))

(declare-fun b!717976 () Bool)

(declare-fun res!480544 () Bool)

(assert (=> b!717976 (=> (not res!480544) (not e!403103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40663 (_ BitVec 32)) Bool)

(assert (=> b!717976 (= res!480544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!480548 () Bool)

(assert (=> start!63884 (=> (not res!480548) (not e!403102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63884 (= res!480548 (validMask!0 mask!3328))))

(assert (=> start!63884 e!403102))

(assert (=> start!63884 true))

(declare-fun array_inv!15256 (array!40663) Bool)

(assert (=> start!63884 (array_inv!15256 a!3186)))

(declare-fun b!717977 () Bool)

(declare-fun res!480542 () Bool)

(assert (=> b!717977 (=> (not res!480542) (not e!403102))))

(assert (=> b!717977 (= res!480542 (and (= (size!19881 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19881 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19881 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717978 () Bool)

(declare-fun res!480547 () Bool)

(assert (=> b!717978 (=> (not res!480547) (not e!403103))))

(declare-datatypes ((List!13462 0))(
  ( (Nil!13459) (Cons!13458 (h!14503 (_ BitVec 64)) (t!19777 List!13462)) )
))
(declare-fun arrayNoDuplicates!0 (array!40663 (_ BitVec 32) List!13462) Bool)

(assert (=> b!717978 (= res!480547 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13459))))

(assert (= (and start!63884 res!480548) b!717977))

(assert (= (and b!717977 res!480542) b!717972))

(assert (= (and b!717972 res!480546) b!717975))

(assert (= (and b!717975 res!480543) b!717973))

(assert (= (and b!717973 res!480545) b!717971))

(assert (= (and b!717971 res!480541) b!717976))

(assert (= (and b!717976 res!480544) b!717978))

(assert (= (and b!717978 res!480547) b!717974))

(declare-fun m!673753 () Bool)

(assert (=> b!717971 m!673753))

(declare-fun m!673755 () Bool)

(assert (=> b!717972 m!673755))

(assert (=> b!717972 m!673755))

(declare-fun m!673757 () Bool)

(assert (=> b!717972 m!673757))

(declare-fun m!673759 () Bool)

(assert (=> b!717976 m!673759))

(declare-fun m!673761 () Bool)

(assert (=> b!717975 m!673761))

(declare-fun m!673763 () Bool)

(assert (=> start!63884 m!673763))

(declare-fun m!673765 () Bool)

(assert (=> start!63884 m!673765))

(declare-fun m!673767 () Bool)

(assert (=> b!717978 m!673767))

(declare-fun m!673769 () Bool)

(assert (=> b!717973 m!673769))

(push 1)

(assert (not b!717975))

(assert (not b!717973))

(assert (not start!63884))

(assert (not b!717972))

(assert (not b!717971))

(assert (not b!717978))

(assert (not b!717976))

(check-sat)

(pop 1)

(push 1)

(check-sat)

