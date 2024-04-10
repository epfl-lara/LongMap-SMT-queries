; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64038 () Bool)

(assert start!64038)

(declare-fun b!719145 () Bool)

(declare-fun e!403606 () Bool)

(declare-fun e!403607 () Bool)

(assert (=> b!719145 (= e!403606 e!403607)))

(declare-fun res!481544 () Bool)

(assert (=> b!719145 (=> (not res!481544) (not e!403607))))

(declare-datatypes ((SeekEntryResult!7092 0))(
  ( (MissingZero!7092 (index!30736 (_ BitVec 32))) (Found!7092 (index!30737 (_ BitVec 32))) (Intermediate!7092 (undefined!7904 Bool) (index!30738 (_ BitVec 32)) (x!61747 (_ BitVec 32))) (Undefined!7092) (MissingVacant!7092 (index!30739 (_ BitVec 32))) )
))
(declare-fun lt!319541 () SeekEntryResult!7092)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719145 (= res!481544 (or (= lt!319541 (MissingZero!7092 i!1173)) (= lt!319541 (MissingVacant!7092 i!1173))))))

(declare-datatypes ((array!40733 0))(
  ( (array!40734 (arr!19492 (Array (_ BitVec 32) (_ BitVec 64))) (size!19913 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40733)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40733 (_ BitVec 32)) SeekEntryResult!7092)

(assert (=> b!719145 (= lt!319541 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719146 () Bool)

(declare-fun res!481540 () Bool)

(assert (=> b!719146 (=> (not res!481540) (not e!403606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719146 (= res!481540 (validKeyInArray!0 k0!2102))))

(declare-fun b!719147 () Bool)

(declare-fun res!481539 () Bool)

(assert (=> b!719147 (=> (not res!481539) (not e!403606))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719147 (= res!481539 (and (= (size!19913 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19913 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19913 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719148 () Bool)

(declare-fun res!481546 () Bool)

(assert (=> b!719148 (=> (not res!481546) (not e!403606))))

(assert (=> b!719148 (= res!481546 (validKeyInArray!0 (select (arr!19492 a!3186) j!159)))))

(declare-fun b!719149 () Bool)

(declare-fun res!481538 () Bool)

(assert (=> b!719149 (=> (not res!481538) (not e!403607))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719149 (= res!481538 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19913 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19913 a!3186))))))

(declare-fun b!719150 () Bool)

(declare-fun res!481542 () Bool)

(assert (=> b!719150 (=> (not res!481542) (not e!403607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40733 (_ BitVec 32)) Bool)

(assert (=> b!719150 (= res!481542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!481547 () Bool)

(assert (=> start!64038 (=> (not res!481547) (not e!403606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64038 (= res!481547 (validMask!0 mask!3328))))

(assert (=> start!64038 e!403606))

(assert (=> start!64038 true))

(declare-fun array_inv!15288 (array!40733) Bool)

(assert (=> start!64038 (array_inv!15288 a!3186)))

(declare-fun b!719151 () Bool)

(declare-fun res!481545 () Bool)

(assert (=> b!719151 (=> (not res!481545) (not e!403607))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40733 (_ BitVec 32)) SeekEntryResult!7092)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719151 (= res!481545 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19492 a!3186) j!159) mask!3328) (select (arr!19492 a!3186) j!159) a!3186 mask!3328) (Intermediate!7092 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719152 () Bool)

(declare-fun res!481543 () Bool)

(assert (=> b!719152 (=> (not res!481543) (not e!403607))))

(declare-datatypes ((List!13494 0))(
  ( (Nil!13491) (Cons!13490 (h!14538 (_ BitVec 64)) (t!19809 List!13494)) )
))
(declare-fun arrayNoDuplicates!0 (array!40733 (_ BitVec 32) List!13494) Bool)

(assert (=> b!719152 (= res!481543 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13491))))

(declare-fun b!719153 () Bool)

(assert (=> b!719153 (= e!403607 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19492 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsle x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719154 () Bool)

(declare-fun res!481541 () Bool)

(assert (=> b!719154 (=> (not res!481541) (not e!403606))))

(declare-fun arrayContainsKey!0 (array!40733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719154 (= res!481541 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64038 res!481547) b!719147))

(assert (= (and b!719147 res!481539) b!719148))

(assert (= (and b!719148 res!481546) b!719146))

(assert (= (and b!719146 res!481540) b!719154))

(assert (= (and b!719154 res!481541) b!719145))

(assert (= (and b!719145 res!481544) b!719150))

(assert (= (and b!719150 res!481542) b!719152))

(assert (= (and b!719152 res!481543) b!719149))

(assert (= (and b!719149 res!481538) b!719151))

(assert (= (and b!719151 res!481545) b!719153))

(declare-fun m!674605 () Bool)

(assert (=> b!719153 m!674605))

(declare-fun m!674607 () Bool)

(assert (=> b!719146 m!674607))

(declare-fun m!674609 () Bool)

(assert (=> b!719154 m!674609))

(declare-fun m!674611 () Bool)

(assert (=> start!64038 m!674611))

(declare-fun m!674613 () Bool)

(assert (=> start!64038 m!674613))

(declare-fun m!674615 () Bool)

(assert (=> b!719152 m!674615))

(declare-fun m!674617 () Bool)

(assert (=> b!719150 m!674617))

(declare-fun m!674619 () Bool)

(assert (=> b!719145 m!674619))

(declare-fun m!674621 () Bool)

(assert (=> b!719151 m!674621))

(assert (=> b!719151 m!674621))

(declare-fun m!674623 () Bool)

(assert (=> b!719151 m!674623))

(assert (=> b!719151 m!674623))

(assert (=> b!719151 m!674621))

(declare-fun m!674625 () Bool)

(assert (=> b!719151 m!674625))

(assert (=> b!719148 m!674621))

(assert (=> b!719148 m!674621))

(declare-fun m!674627 () Bool)

(assert (=> b!719148 m!674627))

(check-sat (not start!64038) (not b!719151) (not b!719150) (not b!719145) (not b!719154) (not b!719152) (not b!719146) (not b!719148))
(check-sat)
