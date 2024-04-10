; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64082 () Bool)

(assert start!64082)

(declare-fun b!719761 () Bool)

(declare-fun res!482155 () Bool)

(declare-fun e!403804 () Bool)

(assert (=> b!719761 (=> (not res!482155) (not e!403804))))

(declare-datatypes ((array!40777 0))(
  ( (array!40778 (arr!19514 (Array (_ BitVec 32) (_ BitVec 64))) (size!19935 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40777)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719761 (= res!482155 (and (= (size!19935 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19935 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19935 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719762 () Bool)

(declare-fun res!482158 () Bool)

(declare-fun e!403805 () Bool)

(assert (=> b!719762 (=> (not res!482158) (not e!403805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40777 (_ BitVec 32)) Bool)

(assert (=> b!719762 (= res!482158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719763 () Bool)

(declare-fun res!482159 () Bool)

(assert (=> b!719763 (=> (not res!482159) (not e!403804))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719763 (= res!482159 (validKeyInArray!0 k!2102))))

(declare-fun b!719764 () Bool)

(assert (=> b!719764 (= e!403804 e!403805)))

(declare-fun res!482154 () Bool)

(assert (=> b!719764 (=> (not res!482154) (not e!403805))))

(declare-datatypes ((SeekEntryResult!7114 0))(
  ( (MissingZero!7114 (index!30824 (_ BitVec 32))) (Found!7114 (index!30825 (_ BitVec 32))) (Intermediate!7114 (undefined!7926 Bool) (index!30826 (_ BitVec 32)) (x!61825 (_ BitVec 32))) (Undefined!7114) (MissingVacant!7114 (index!30827 (_ BitVec 32))) )
))
(declare-fun lt!319652 () SeekEntryResult!7114)

(assert (=> b!719764 (= res!482154 (or (= lt!319652 (MissingZero!7114 i!1173)) (= lt!319652 (MissingVacant!7114 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40777 (_ BitVec 32)) SeekEntryResult!7114)

(assert (=> b!719764 (= lt!319652 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719765 () Bool)

(assert (=> b!719765 (= e!403805 false)))

(declare-fun lt!319651 () SeekEntryResult!7114)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40777 (_ BitVec 32)) SeekEntryResult!7114)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719765 (= lt!319651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19514 a!3186) j!159) mask!3328) (select (arr!19514 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719766 () Bool)

(declare-fun res!482162 () Bool)

(assert (=> b!719766 (=> (not res!482162) (not e!403805))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719766 (= res!482162 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19935 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19935 a!3186))))))

(declare-fun b!719767 () Bool)

(declare-fun res!482156 () Bool)

(assert (=> b!719767 (=> (not res!482156) (not e!403805))))

(declare-datatypes ((List!13516 0))(
  ( (Nil!13513) (Cons!13512 (h!14560 (_ BitVec 64)) (t!19831 List!13516)) )
))
(declare-fun arrayNoDuplicates!0 (array!40777 (_ BitVec 32) List!13516) Bool)

(assert (=> b!719767 (= res!482156 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13513))))

(declare-fun res!482161 () Bool)

(assert (=> start!64082 (=> (not res!482161) (not e!403804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64082 (= res!482161 (validMask!0 mask!3328))))

(assert (=> start!64082 e!403804))

(assert (=> start!64082 true))

(declare-fun array_inv!15310 (array!40777) Bool)

(assert (=> start!64082 (array_inv!15310 a!3186)))

(declare-fun b!719768 () Bool)

(declare-fun res!482160 () Bool)

(assert (=> b!719768 (=> (not res!482160) (not e!403804))))

(declare-fun arrayContainsKey!0 (array!40777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719768 (= res!482160 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719769 () Bool)

(declare-fun res!482157 () Bool)

(assert (=> b!719769 (=> (not res!482157) (not e!403804))))

(assert (=> b!719769 (= res!482157 (validKeyInArray!0 (select (arr!19514 a!3186) j!159)))))

(assert (= (and start!64082 res!482161) b!719761))

(assert (= (and b!719761 res!482155) b!719769))

(assert (= (and b!719769 res!482157) b!719763))

(assert (= (and b!719763 res!482159) b!719768))

(assert (= (and b!719768 res!482160) b!719764))

(assert (= (and b!719764 res!482154) b!719762))

(assert (= (and b!719762 res!482158) b!719767))

(assert (= (and b!719767 res!482156) b!719766))

(assert (= (and b!719766 res!482162) b!719765))

(declare-fun m!675105 () Bool)

(assert (=> b!719769 m!675105))

(assert (=> b!719769 m!675105))

(declare-fun m!675107 () Bool)

(assert (=> b!719769 m!675107))

(declare-fun m!675109 () Bool)

(assert (=> b!719762 m!675109))

(assert (=> b!719765 m!675105))

(assert (=> b!719765 m!675105))

(declare-fun m!675111 () Bool)

(assert (=> b!719765 m!675111))

(assert (=> b!719765 m!675111))

(assert (=> b!719765 m!675105))

(declare-fun m!675113 () Bool)

(assert (=> b!719765 m!675113))

(declare-fun m!675115 () Bool)

(assert (=> b!719767 m!675115))

(declare-fun m!675117 () Bool)

(assert (=> b!719764 m!675117))

(declare-fun m!675119 () Bool)

(assert (=> start!64082 m!675119))

(declare-fun m!675121 () Bool)

(assert (=> start!64082 m!675121))

(declare-fun m!675123 () Bool)

(assert (=> b!719763 m!675123))

(declare-fun m!675125 () Bool)

(assert (=> b!719768 m!675125))

(push 1)

(assert (not b!719769))

(assert (not b!719764))

(assert (not b!719765))

(assert (not b!719768))

(assert (not b!719763))

(assert (not start!64082))

(assert (not b!719762))

(assert (not b!719767))

(check-sat)

