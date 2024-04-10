; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64288 () Bool)

(assert start!64288)

(declare-fun b!722057 () Bool)

(declare-fun res!483824 () Bool)

(declare-fun e!404791 () Bool)

(assert (=> b!722057 (=> (not res!483824) (not e!404791))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722057 (= res!483824 (validKeyInArray!0 k!2102))))

(declare-fun b!722058 () Bool)

(declare-fun res!483830 () Bool)

(declare-fun e!404793 () Bool)

(assert (=> b!722058 (=> (not res!483830) (not e!404793))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40869 0))(
  ( (array!40870 (arr!19557 (Array (_ BitVec 32) (_ BitVec 64))) (size!19978 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40869)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722058 (= res!483830 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19557 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722059 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!722059 (= e!404793 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!722060 () Bool)

(declare-fun res!483828 () Bool)

(declare-fun e!404795 () Bool)

(assert (=> b!722060 (=> (not res!483828) (not e!404795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40869 (_ BitVec 32)) Bool)

(assert (=> b!722060 (= res!483828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722061 () Bool)

(declare-fun res!483822 () Bool)

(assert (=> b!722061 (=> (not res!483822) (not e!404791))))

(declare-fun arrayContainsKey!0 (array!40869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722061 (= res!483822 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!483829 () Bool)

(assert (=> start!64288 (=> (not res!483829) (not e!404791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64288 (= res!483829 (validMask!0 mask!3328))))

(assert (=> start!64288 e!404791))

(assert (=> start!64288 true))

(declare-fun array_inv!15353 (array!40869) Bool)

(assert (=> start!64288 (array_inv!15353 a!3186)))

(declare-fun e!404794 () Bool)

(declare-datatypes ((SeekEntryResult!7157 0))(
  ( (MissingZero!7157 (index!30996 (_ BitVec 32))) (Found!7157 (index!30997 (_ BitVec 32))) (Intermediate!7157 (undefined!7969 Bool) (index!30998 (_ BitVec 32)) (x!62006 (_ BitVec 32))) (Undefined!7157) (MissingVacant!7157 (index!30999 (_ BitVec 32))) )
))
(declare-fun lt!320207 () SeekEntryResult!7157)

(declare-fun b!722062 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40869 (_ BitVec 32)) SeekEntryResult!7157)

(assert (=> b!722062 (= e!404794 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19557 a!3186) j!159) a!3186 mask!3328) lt!320207))))

(declare-fun b!722063 () Bool)

(declare-fun res!483825 () Bool)

(assert (=> b!722063 (=> (not res!483825) (not e!404793))))

(assert (=> b!722063 (= res!483825 e!404794)))

(declare-fun c!79489 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722063 (= c!79489 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722064 () Bool)

(declare-fun res!483832 () Bool)

(assert (=> b!722064 (=> (not res!483832) (not e!404791))))

(assert (=> b!722064 (= res!483832 (and (= (size!19978 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19978 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19978 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722065 () Bool)

(declare-fun res!483823 () Bool)

(assert (=> b!722065 (=> (not res!483823) (not e!404795))))

(assert (=> b!722065 (= res!483823 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19978 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19978 a!3186))))))

(declare-fun b!722066 () Bool)

(declare-fun res!483827 () Bool)

(assert (=> b!722066 (=> (not res!483827) (not e!404791))))

(assert (=> b!722066 (= res!483827 (validKeyInArray!0 (select (arr!19557 a!3186) j!159)))))

(declare-fun b!722067 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40869 (_ BitVec 32)) SeekEntryResult!7157)

(assert (=> b!722067 (= e!404794 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19557 a!3186) j!159) a!3186 mask!3328) (Found!7157 j!159)))))

(declare-fun b!722068 () Bool)

(declare-fun res!483831 () Bool)

(assert (=> b!722068 (=> (not res!483831) (not e!404795))))

(declare-datatypes ((List!13559 0))(
  ( (Nil!13556) (Cons!13555 (h!14609 (_ BitVec 64)) (t!19874 List!13559)) )
))
(declare-fun arrayNoDuplicates!0 (array!40869 (_ BitVec 32) List!13559) Bool)

(assert (=> b!722068 (= res!483831 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13556))))

(declare-fun b!722069 () Bool)

(assert (=> b!722069 (= e!404791 e!404795)))

(declare-fun res!483833 () Bool)

(assert (=> b!722069 (=> (not res!483833) (not e!404795))))

(declare-fun lt!320206 () SeekEntryResult!7157)

(assert (=> b!722069 (= res!483833 (or (= lt!320206 (MissingZero!7157 i!1173)) (= lt!320206 (MissingVacant!7157 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40869 (_ BitVec 32)) SeekEntryResult!7157)

(assert (=> b!722069 (= lt!320206 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722070 () Bool)

(assert (=> b!722070 (= e!404795 e!404793)))

(declare-fun res!483826 () Bool)

(assert (=> b!722070 (=> (not res!483826) (not e!404793))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722070 (= res!483826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19557 a!3186) j!159) mask!3328) (select (arr!19557 a!3186) j!159) a!3186 mask!3328) lt!320207))))

(assert (=> b!722070 (= lt!320207 (Intermediate!7157 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64288 res!483829) b!722064))

(assert (= (and b!722064 res!483832) b!722066))

(assert (= (and b!722066 res!483827) b!722057))

(assert (= (and b!722057 res!483824) b!722061))

(assert (= (and b!722061 res!483822) b!722069))

(assert (= (and b!722069 res!483833) b!722060))

(assert (= (and b!722060 res!483828) b!722068))

(assert (= (and b!722068 res!483831) b!722065))

(assert (= (and b!722065 res!483823) b!722070))

(assert (= (and b!722070 res!483826) b!722058))

(assert (= (and b!722058 res!483830) b!722063))

(assert (= (and b!722063 c!79489) b!722062))

(assert (= (and b!722063 (not c!79489)) b!722067))

(assert (= (and b!722063 res!483825) b!722059))

(declare-fun m!676693 () Bool)

(assert (=> b!722070 m!676693))

(assert (=> b!722070 m!676693))

(declare-fun m!676695 () Bool)

(assert (=> b!722070 m!676695))

(assert (=> b!722070 m!676695))

(assert (=> b!722070 m!676693))

(declare-fun m!676697 () Bool)

(assert (=> b!722070 m!676697))

(declare-fun m!676699 () Bool)

(assert (=> b!722068 m!676699))

(assert (=> b!722066 m!676693))

(assert (=> b!722066 m!676693))

(declare-fun m!676701 () Bool)

(assert (=> b!722066 m!676701))

(assert (=> b!722062 m!676693))

(assert (=> b!722062 m!676693))

(declare-fun m!676703 () Bool)

(assert (=> b!722062 m!676703))

(declare-fun m!676705 () Bool)

(assert (=> b!722069 m!676705))

(assert (=> b!722067 m!676693))

(assert (=> b!722067 m!676693))

(declare-fun m!676707 () Bool)

(assert (=> b!722067 m!676707))

(declare-fun m!676709 () Bool)

(assert (=> b!722061 m!676709))

(declare-fun m!676711 () Bool)

(assert (=> b!722057 m!676711))

(declare-fun m!676713 () Bool)

(assert (=> b!722058 m!676713))

(declare-fun m!676715 () Bool)

(assert (=> start!64288 m!676715))

(declare-fun m!676717 () Bool)

(assert (=> start!64288 m!676717))

(declare-fun m!676719 () Bool)

(assert (=> b!722060 m!676719))

(push 1)

(assert (not b!722070))

(assert (not b!722061))

(assert (not b!722060))

(assert (not b!722067))

(assert (not start!64288))

(assert (not b!722066))

(assert (not b!722068))

(assert (not b!722069))

(assert (not b!722057))

(assert (not b!722062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

