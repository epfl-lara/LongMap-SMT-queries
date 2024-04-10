; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67138 () Bool)

(assert start!67138)

(declare-fun b!775733 () Bool)

(declare-fun e!431718 () Bool)

(declare-fun e!431716 () Bool)

(assert (=> b!775733 (= e!431718 e!431716)))

(declare-fun res!524616 () Bool)

(assert (=> b!775733 (=> (not res!524616) (not e!431716))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7942 0))(
  ( (MissingZero!7942 (index!34136 (_ BitVec 32))) (Found!7942 (index!34137 (_ BitVec 32))) (Intermediate!7942 (undefined!8754 Bool) (index!34138 (_ BitVec 32)) (x!65077 (_ BitVec 32))) (Undefined!7942) (MissingVacant!7942 (index!34139 (_ BitVec 32))) )
))
(declare-fun lt!345571 () SeekEntryResult!7942)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42493 0))(
  ( (array!42494 (arr!20342 (Array (_ BitVec 32) (_ BitVec 64))) (size!20763 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42493)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42493 (_ BitVec 32)) SeekEntryResult!7942)

(assert (=> b!775733 (= res!524616 (= (seekEntryOrOpen!0 (select (arr!20342 a!3186) j!159) a!3186 mask!3328) lt!345571))))

(assert (=> b!775733 (= lt!345571 (Found!7942 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!775734 () Bool)

(declare-fun e!431720 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42493 (_ BitVec 32)) SeekEntryResult!7942)

(assert (=> b!775734 (= e!431720 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20342 a!3186) j!159) a!3186 mask!3328) (Found!7942 j!159)))))

(declare-fun b!775735 () Bool)

(declare-fun res!524615 () Bool)

(declare-fun e!431713 () Bool)

(assert (=> b!775735 (=> (not res!524615) (not e!431713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775735 (= res!524615 (validKeyInArray!0 (select (arr!20342 a!3186) j!159)))))

(declare-fun b!775736 () Bool)

(declare-fun e!431715 () Bool)

(declare-fun e!431719 () Bool)

(assert (=> b!775736 (= e!431715 e!431719)))

(declare-fun res!524627 () Bool)

(assert (=> b!775736 (=> (not res!524627) (not e!431719))))

(declare-fun lt!345570 () (_ BitVec 64))

(declare-fun lt!345573 () array!42493)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42493 (_ BitVec 32)) SeekEntryResult!7942)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775736 (= res!524627 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345570 mask!3328) lt!345570 lt!345573 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345570 lt!345573 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!775736 (= lt!345570 (select (store (arr!20342 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!775736 (= lt!345573 (array!42494 (store (arr!20342 a!3186) i!1173 k!2102) (size!20763 a!3186)))))

(declare-fun b!775737 () Bool)

(declare-fun res!524626 () Bool)

(declare-fun e!431714 () Bool)

(assert (=> b!775737 (=> (not res!524626) (not e!431714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42493 (_ BitVec 32)) Bool)

(assert (=> b!775737 (= res!524626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775738 () Bool)

(assert (=> b!775738 (= e!431713 e!431714)))

(declare-fun res!524623 () Bool)

(assert (=> b!775738 (=> (not res!524623) (not e!431714))))

(declare-fun lt!345574 () SeekEntryResult!7942)

(assert (=> b!775738 (= res!524623 (or (= lt!345574 (MissingZero!7942 i!1173)) (= lt!345574 (MissingVacant!7942 i!1173))))))

(assert (=> b!775738 (= lt!345574 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!524613 () Bool)

(assert (=> start!67138 (=> (not res!524613) (not e!431713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67138 (= res!524613 (validMask!0 mask!3328))))

(assert (=> start!67138 e!431713))

(assert (=> start!67138 true))

(declare-fun array_inv!16138 (array!42493) Bool)

(assert (=> start!67138 (array_inv!16138 a!3186)))

(declare-fun b!775739 () Bool)

(declare-fun res!524621 () Bool)

(assert (=> b!775739 (=> (not res!524621) (not e!431714))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775739 (= res!524621 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20763 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20763 a!3186))))))

(declare-fun b!775740 () Bool)

(declare-fun res!524620 () Bool)

(assert (=> b!775740 (=> (not res!524620) (not e!431713))))

(assert (=> b!775740 (= res!524620 (and (= (size!20763 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20763 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20763 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775741 () Bool)

(assert (=> b!775741 (= e!431714 e!431715)))

(declare-fun res!524625 () Bool)

(assert (=> b!775741 (=> (not res!524625) (not e!431715))))

(declare-fun lt!345572 () SeekEntryResult!7942)

(assert (=> b!775741 (= res!524625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20342 a!3186) j!159) mask!3328) (select (arr!20342 a!3186) j!159) a!3186 mask!3328) lt!345572))))

(assert (=> b!775741 (= lt!345572 (Intermediate!7942 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775742 () Bool)

(declare-fun res!524624 () Bool)

(assert (=> b!775742 (=> (not res!524624) (not e!431713))))

(assert (=> b!775742 (= res!524624 (validKeyInArray!0 k!2102))))

(declare-fun b!775743 () Bool)

(assert (=> b!775743 (= e!431716 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20342 a!3186) j!159) a!3186 mask!3328) lt!345571))))

(declare-fun b!775744 () Bool)

(declare-fun res!524622 () Bool)

(assert (=> b!775744 (=> (not res!524622) (not e!431715))))

(assert (=> b!775744 (= res!524622 e!431720)))

(declare-fun c!85960 () Bool)

(assert (=> b!775744 (= c!85960 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775745 () Bool)

(declare-fun res!524619 () Bool)

(assert (=> b!775745 (=> (not res!524619) (not e!431715))))

(assert (=> b!775745 (= res!524619 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20342 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775746 () Bool)

(assert (=> b!775746 (= e!431720 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20342 a!3186) j!159) a!3186 mask!3328) lt!345572))))

(declare-fun b!775747 () Bool)

(assert (=> b!775747 (= e!431719 (not true))))

(assert (=> b!775747 e!431718))

(declare-fun res!524617 () Bool)

(assert (=> b!775747 (=> (not res!524617) (not e!431718))))

(assert (=> b!775747 (= res!524617 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26778 0))(
  ( (Unit!26779) )
))
(declare-fun lt!345575 () Unit!26778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26778)

(assert (=> b!775747 (= lt!345575 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775748 () Bool)

(declare-fun res!524614 () Bool)

(assert (=> b!775748 (=> (not res!524614) (not e!431714))))

(declare-datatypes ((List!14344 0))(
  ( (Nil!14341) (Cons!14340 (h!15448 (_ BitVec 64)) (t!20659 List!14344)) )
))
(declare-fun arrayNoDuplicates!0 (array!42493 (_ BitVec 32) List!14344) Bool)

(assert (=> b!775748 (= res!524614 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14341))))

(declare-fun b!775749 () Bool)

(declare-fun res!524618 () Bool)

(assert (=> b!775749 (=> (not res!524618) (not e!431713))))

(declare-fun arrayContainsKey!0 (array!42493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775749 (= res!524618 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67138 res!524613) b!775740))

(assert (= (and b!775740 res!524620) b!775735))

(assert (= (and b!775735 res!524615) b!775742))

(assert (= (and b!775742 res!524624) b!775749))

(assert (= (and b!775749 res!524618) b!775738))

(assert (= (and b!775738 res!524623) b!775737))

(assert (= (and b!775737 res!524626) b!775748))

(assert (= (and b!775748 res!524614) b!775739))

(assert (= (and b!775739 res!524621) b!775741))

(assert (= (and b!775741 res!524625) b!775745))

(assert (= (and b!775745 res!524619) b!775744))

(assert (= (and b!775744 c!85960) b!775746))

(assert (= (and b!775744 (not c!85960)) b!775734))

(assert (= (and b!775744 res!524622) b!775736))

(assert (= (and b!775736 res!524627) b!775747))

(assert (= (and b!775747 res!524617) b!775733))

(assert (= (and b!775733 res!524616) b!775743))

(declare-fun m!719917 () Bool)

(assert (=> b!775746 m!719917))

(assert (=> b!775746 m!719917))

(declare-fun m!719919 () Bool)

(assert (=> b!775746 m!719919))

(assert (=> b!775734 m!719917))

(assert (=> b!775734 m!719917))

(declare-fun m!719921 () Bool)

(assert (=> b!775734 m!719921))

(declare-fun m!719923 () Bool)

(assert (=> start!67138 m!719923))

(declare-fun m!719925 () Bool)

(assert (=> start!67138 m!719925))

(declare-fun m!719927 () Bool)

(assert (=> b!775747 m!719927))

(declare-fun m!719929 () Bool)

(assert (=> b!775747 m!719929))

(declare-fun m!719931 () Bool)

(assert (=> b!775749 m!719931))

(assert (=> b!775733 m!719917))

(assert (=> b!775733 m!719917))

(declare-fun m!719933 () Bool)

(assert (=> b!775733 m!719933))

(declare-fun m!719935 () Bool)

(assert (=> b!775738 m!719935))

(declare-fun m!719937 () Bool)

(assert (=> b!775745 m!719937))

(assert (=> b!775741 m!719917))

(assert (=> b!775741 m!719917))

(declare-fun m!719939 () Bool)

(assert (=> b!775741 m!719939))

(assert (=> b!775741 m!719939))

(assert (=> b!775741 m!719917))

(declare-fun m!719941 () Bool)

(assert (=> b!775741 m!719941))

(declare-fun m!719943 () Bool)

(assert (=> b!775737 m!719943))

(declare-fun m!719945 () Bool)

(assert (=> b!775736 m!719945))

(declare-fun m!719947 () Bool)

(assert (=> b!775736 m!719947))

(assert (=> b!775736 m!719947))

(declare-fun m!719949 () Bool)

(assert (=> b!775736 m!719949))

(declare-fun m!719951 () Bool)

(assert (=> b!775736 m!719951))

(declare-fun m!719953 () Bool)

(assert (=> b!775736 m!719953))

(declare-fun m!719955 () Bool)

(assert (=> b!775748 m!719955))

(assert (=> b!775743 m!719917))

(assert (=> b!775743 m!719917))

(declare-fun m!719957 () Bool)

(assert (=> b!775743 m!719957))

(declare-fun m!719959 () Bool)

(assert (=> b!775742 m!719959))

(assert (=> b!775735 m!719917))

(assert (=> b!775735 m!719917))

(declare-fun m!719961 () Bool)

(assert (=> b!775735 m!719961))

(push 1)

