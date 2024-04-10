; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64036 () Bool)

(assert start!64036)

(declare-fun b!719115 () Bool)

(declare-fun res!481510 () Bool)

(declare-fun e!403596 () Bool)

(assert (=> b!719115 (=> (not res!481510) (not e!403596))))

(declare-datatypes ((array!40731 0))(
  ( (array!40732 (arr!19491 (Array (_ BitVec 32) (_ BitVec 64))) (size!19912 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40731)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719115 (= res!481510 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719116 () Bool)

(declare-fun res!481513 () Bool)

(declare-fun e!403597 () Bool)

(assert (=> b!719116 (=> (not res!481513) (not e!403597))))

(declare-datatypes ((List!13493 0))(
  ( (Nil!13490) (Cons!13489 (h!14537 (_ BitVec 64)) (t!19808 List!13493)) )
))
(declare-fun arrayNoDuplicates!0 (array!40731 (_ BitVec 32) List!13493) Bool)

(assert (=> b!719116 (= res!481513 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13490))))

(declare-fun b!719117 () Bool)

(declare-fun res!481515 () Bool)

(assert (=> b!719117 (=> (not res!481515) (not e!403596))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719117 (= res!481515 (and (= (size!19912 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19912 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19912 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719118 () Bool)

(declare-fun res!481516 () Bool)

(assert (=> b!719118 (=> (not res!481516) (not e!403597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40731 (_ BitVec 32)) Bool)

(assert (=> b!719118 (= res!481516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719119 () Bool)

(declare-fun res!481512 () Bool)

(assert (=> b!719119 (=> (not res!481512) (not e!403596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719119 (= res!481512 (validKeyInArray!0 k!2102))))

(declare-fun b!719120 () Bool)

(declare-fun res!481514 () Bool)

(assert (=> b!719120 (=> (not res!481514) (not e!403596))))

(assert (=> b!719120 (= res!481514 (validKeyInArray!0 (select (arr!19491 a!3186) j!159)))))

(declare-fun b!719121 () Bool)

(declare-fun res!481508 () Bool)

(assert (=> b!719121 (=> (not res!481508) (not e!403597))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7091 0))(
  ( (MissingZero!7091 (index!30732 (_ BitVec 32))) (Found!7091 (index!30733 (_ BitVec 32))) (Intermediate!7091 (undefined!7903 Bool) (index!30734 (_ BitVec 32)) (x!61746 (_ BitVec 32))) (Undefined!7091) (MissingVacant!7091 (index!30735 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40731 (_ BitVec 32)) SeekEntryResult!7091)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719121 (= res!481508 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19491 a!3186) j!159) mask!3328) (select (arr!19491 a!3186) j!159) a!3186 mask!3328) (Intermediate!7091 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun res!481517 () Bool)

(assert (=> start!64036 (=> (not res!481517) (not e!403596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64036 (= res!481517 (validMask!0 mask!3328))))

(assert (=> start!64036 e!403596))

(assert (=> start!64036 true))

(declare-fun array_inv!15287 (array!40731) Bool)

(assert (=> start!64036 (array_inv!15287 a!3186)))

(declare-fun b!719122 () Bool)

(assert (=> b!719122 (= e!403596 e!403597)))

(declare-fun res!481511 () Bool)

(assert (=> b!719122 (=> (not res!481511) (not e!403597))))

(declare-fun lt!319538 () SeekEntryResult!7091)

(assert (=> b!719122 (= res!481511 (or (= lt!319538 (MissingZero!7091 i!1173)) (= lt!319538 (MissingVacant!7091 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40731 (_ BitVec 32)) SeekEntryResult!7091)

(assert (=> b!719122 (= lt!319538 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!719123 () Bool)

(assert (=> b!719123 (= e!403597 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19491 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsle x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719124 () Bool)

(declare-fun res!481509 () Bool)

(assert (=> b!719124 (=> (not res!481509) (not e!403597))))

(assert (=> b!719124 (= res!481509 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19912 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19912 a!3186))))))

(assert (= (and start!64036 res!481517) b!719117))

(assert (= (and b!719117 res!481515) b!719120))

(assert (= (and b!719120 res!481514) b!719119))

(assert (= (and b!719119 res!481512) b!719115))

(assert (= (and b!719115 res!481510) b!719122))

(assert (= (and b!719122 res!481511) b!719118))

(assert (= (and b!719118 res!481516) b!719116))

(assert (= (and b!719116 res!481513) b!719124))

(assert (= (and b!719124 res!481509) b!719121))

(assert (= (and b!719121 res!481508) b!719123))

(declare-fun m!674581 () Bool)

(assert (=> b!719121 m!674581))

(assert (=> b!719121 m!674581))

(declare-fun m!674583 () Bool)

(assert (=> b!719121 m!674583))

(assert (=> b!719121 m!674583))

(assert (=> b!719121 m!674581))

(declare-fun m!674585 () Bool)

(assert (=> b!719121 m!674585))

(declare-fun m!674587 () Bool)

(assert (=> b!719122 m!674587))

(declare-fun m!674589 () Bool)

(assert (=> b!719119 m!674589))

(declare-fun m!674591 () Bool)

(assert (=> b!719118 m!674591))

(declare-fun m!674593 () Bool)

(assert (=> b!719116 m!674593))

(declare-fun m!674595 () Bool)

(assert (=> b!719115 m!674595))

(declare-fun m!674597 () Bool)

(assert (=> start!64036 m!674597))

(declare-fun m!674599 () Bool)

(assert (=> start!64036 m!674599))

(declare-fun m!674601 () Bool)

(assert (=> b!719123 m!674601))

(assert (=> b!719120 m!674581))

(assert (=> b!719120 m!674581))

(declare-fun m!674603 () Bool)

(assert (=> b!719120 m!674603))

(push 1)

(assert (not b!719118))

(assert (not b!719122))

(assert (not b!719119))

(assert (not start!64036))

(assert (not b!719121))

(assert (not b!719115))

(assert (not b!719116))

(assert (not b!719120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

