; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64078 () Bool)

(assert start!64078)

(declare-fun res!482104 () Bool)

(declare-fun e!403787 () Bool)

(assert (=> start!64078 (=> (not res!482104) (not e!403787))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64078 (= res!482104 (validMask!0 mask!3328))))

(assert (=> start!64078 e!403787))

(assert (=> start!64078 true))

(declare-datatypes ((array!40773 0))(
  ( (array!40774 (arr!19512 (Array (_ BitVec 32) (_ BitVec 64))) (size!19933 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40773)

(declare-fun array_inv!15308 (array!40773) Bool)

(assert (=> start!64078 (array_inv!15308 a!3186)))

(declare-fun b!719707 () Bool)

(declare-fun e!403786 () Bool)

(assert (=> b!719707 (= e!403787 e!403786)))

(declare-fun res!482106 () Bool)

(assert (=> b!719707 (=> (not res!482106) (not e!403786))))

(declare-datatypes ((SeekEntryResult!7112 0))(
  ( (MissingZero!7112 (index!30816 (_ BitVec 32))) (Found!7112 (index!30817 (_ BitVec 32))) (Intermediate!7112 (undefined!7924 Bool) (index!30818 (_ BitVec 32)) (x!61823 (_ BitVec 32))) (Undefined!7112) (MissingVacant!7112 (index!30819 (_ BitVec 32))) )
))
(declare-fun lt!319639 () SeekEntryResult!7112)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719707 (= res!482106 (or (= lt!319639 (MissingZero!7112 i!1173)) (= lt!319639 (MissingVacant!7112 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40773 (_ BitVec 32)) SeekEntryResult!7112)

(assert (=> b!719707 (= lt!319639 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719708 () Bool)

(declare-fun res!482103 () Bool)

(assert (=> b!719708 (=> (not res!482103) (not e!403787))))

(declare-fun arrayContainsKey!0 (array!40773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719708 (= res!482103 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719709 () Bool)

(declare-fun res!482101 () Bool)

(assert (=> b!719709 (=> (not res!482101) (not e!403787))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719709 (= res!482101 (and (= (size!19933 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19933 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19933 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719710 () Bool)

(declare-fun res!482100 () Bool)

(assert (=> b!719710 (=> (not res!482100) (not e!403787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719710 (= res!482100 (validKeyInArray!0 k!2102))))

(declare-fun b!719711 () Bool)

(declare-fun res!482108 () Bool)

(assert (=> b!719711 (=> (not res!482108) (not e!403786))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719711 (= res!482108 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19933 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19933 a!3186))))))

(declare-fun b!719712 () Bool)

(declare-fun res!482102 () Bool)

(assert (=> b!719712 (=> (not res!482102) (not e!403786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40773 (_ BitVec 32)) Bool)

(assert (=> b!719712 (= res!482102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719713 () Bool)

(declare-fun res!482107 () Bool)

(assert (=> b!719713 (=> (not res!482107) (not e!403786))))

(declare-datatypes ((List!13514 0))(
  ( (Nil!13511) (Cons!13510 (h!14558 (_ BitVec 64)) (t!19829 List!13514)) )
))
(declare-fun arrayNoDuplicates!0 (array!40773 (_ BitVec 32) List!13514) Bool)

(assert (=> b!719713 (= res!482107 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13511))))

(declare-fun b!719714 () Bool)

(declare-fun res!482105 () Bool)

(assert (=> b!719714 (=> (not res!482105) (not e!403787))))

(assert (=> b!719714 (= res!482105 (validKeyInArray!0 (select (arr!19512 a!3186) j!159)))))

(declare-fun b!719715 () Bool)

(assert (=> b!719715 (= e!403786 false)))

(declare-fun lt!319640 () SeekEntryResult!7112)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40773 (_ BitVec 32)) SeekEntryResult!7112)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719715 (= lt!319640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19512 a!3186) j!159) mask!3328) (select (arr!19512 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!64078 res!482104) b!719709))

(assert (= (and b!719709 res!482101) b!719714))

(assert (= (and b!719714 res!482105) b!719710))

(assert (= (and b!719710 res!482100) b!719708))

(assert (= (and b!719708 res!482103) b!719707))

(assert (= (and b!719707 res!482106) b!719712))

(assert (= (and b!719712 res!482102) b!719713))

(assert (= (and b!719713 res!482107) b!719711))

(assert (= (and b!719711 res!482108) b!719715))

(declare-fun m!675061 () Bool)

(assert (=> b!719708 m!675061))

(declare-fun m!675063 () Bool)

(assert (=> start!64078 m!675063))

(declare-fun m!675065 () Bool)

(assert (=> start!64078 m!675065))

(declare-fun m!675067 () Bool)

(assert (=> b!719712 m!675067))

(declare-fun m!675069 () Bool)

(assert (=> b!719714 m!675069))

(assert (=> b!719714 m!675069))

(declare-fun m!675071 () Bool)

(assert (=> b!719714 m!675071))

(declare-fun m!675073 () Bool)

(assert (=> b!719710 m!675073))

(declare-fun m!675075 () Bool)

(assert (=> b!719707 m!675075))

(declare-fun m!675077 () Bool)

(assert (=> b!719713 m!675077))

(assert (=> b!719715 m!675069))

(assert (=> b!719715 m!675069))

(declare-fun m!675079 () Bool)

(assert (=> b!719715 m!675079))

(assert (=> b!719715 m!675079))

(assert (=> b!719715 m!675069))

(declare-fun m!675081 () Bool)

(assert (=> b!719715 m!675081))

(push 1)

