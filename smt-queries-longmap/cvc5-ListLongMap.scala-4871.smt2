; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67140 () Bool)

(assert start!67140)

(declare-fun b!775786 () Bool)

(declare-fun e!431742 () Bool)

(declare-fun e!431747 () Bool)

(assert (=> b!775786 (= e!431742 e!431747)))

(declare-fun res!524662 () Bool)

(assert (=> b!775786 (=> (not res!524662) (not e!431747))))

(declare-datatypes ((SeekEntryResult!7943 0))(
  ( (MissingZero!7943 (index!34140 (_ BitVec 32))) (Found!7943 (index!34141 (_ BitVec 32))) (Intermediate!7943 (undefined!8755 Bool) (index!34142 (_ BitVec 32)) (x!65086 (_ BitVec 32))) (Undefined!7943) (MissingVacant!7943 (index!34143 (_ BitVec 32))) )
))
(declare-fun lt!345598 () SeekEntryResult!7943)

(declare-fun lt!345596 () SeekEntryResult!7943)

(assert (=> b!775786 (= res!524662 (= lt!345598 lt!345596))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42495 0))(
  ( (array!42496 (arr!20343 (Array (_ BitVec 32) (_ BitVec 64))) (size!20764 (_ BitVec 32))) )
))
(declare-fun lt!345595 () array!42495)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!345594 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42495 (_ BitVec 32)) SeekEntryResult!7943)

(assert (=> b!775786 (= lt!345596 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345594 lt!345595 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775786 (= lt!345598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345594 mask!3328) lt!345594 lt!345595 mask!3328))))

(declare-fun a!3186 () array!42495)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!775786 (= lt!345594 (select (store (arr!20343 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!775786 (= lt!345595 (array!42496 (store (arr!20343 a!3186) i!1173 k!2102) (size!20764 a!3186)))))

(declare-fun b!775787 () Bool)

(declare-fun res!524666 () Bool)

(declare-fun e!431740 () Bool)

(assert (=> b!775787 (=> (not res!524666) (not e!431740))))

(assert (=> b!775787 (= res!524666 (and (= (size!20764 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20764 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20764 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775788 () Bool)

(declare-fun e!431746 () Bool)

(assert (=> b!775788 (= e!431747 (not e!431746))))

(declare-fun res!524665 () Bool)

(assert (=> b!775788 (=> res!524665 e!431746)))

(assert (=> b!775788 (= res!524665 (or (not (is-Intermediate!7943 lt!345596)) (bvslt x!1131 (x!65086 lt!345596)) (not (= x!1131 (x!65086 lt!345596))) (not (= index!1321 (index!34142 lt!345596)))))))

(declare-fun e!431745 () Bool)

(assert (=> b!775788 e!431745))

(declare-fun res!524673 () Bool)

(assert (=> b!775788 (=> (not res!524673) (not e!431745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42495 (_ BitVec 32)) Bool)

(assert (=> b!775788 (= res!524673 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26780 0))(
  ( (Unit!26781) )
))
(declare-fun lt!345600 () Unit!26780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26780)

(assert (=> b!775788 (= lt!345600 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!524660 () Bool)

(assert (=> start!67140 (=> (not res!524660) (not e!431740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67140 (= res!524660 (validMask!0 mask!3328))))

(assert (=> start!67140 e!431740))

(assert (=> start!67140 true))

(declare-fun array_inv!16139 (array!42495) Bool)

(assert (=> start!67140 (array_inv!16139 a!3186)))

(declare-fun b!775789 () Bool)

(declare-fun res!524664 () Bool)

(declare-fun e!431739 () Bool)

(assert (=> b!775789 (=> (not res!524664) (not e!431739))))

(assert (=> b!775789 (= res!524664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!775790 () Bool)

(declare-fun e!431741 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42495 (_ BitVec 32)) SeekEntryResult!7943)

(assert (=> b!775790 (= e!431741 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20343 a!3186) j!159) a!3186 mask!3328) (Found!7943 j!159)))))

(declare-fun lt!345597 () SeekEntryResult!7943)

(declare-fun b!775791 () Bool)

(assert (=> b!775791 (= e!431741 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20343 a!3186) j!159) a!3186 mask!3328) lt!345597))))

(declare-fun b!775792 () Bool)

(assert (=> b!775792 (= e!431746 true)))

(declare-fun lt!345601 () SeekEntryResult!7943)

(assert (=> b!775792 (= lt!345601 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20343 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!431744 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!345599 () SeekEntryResult!7943)

(declare-fun b!775793 () Bool)

(assert (=> b!775793 (= e!431744 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20343 a!3186) j!159) a!3186 mask!3328) lt!345599))))

(declare-fun b!775794 () Bool)

(declare-fun res!524672 () Bool)

(assert (=> b!775794 (=> (not res!524672) (not e!431740))))

(declare-fun arrayContainsKey!0 (array!42495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775794 (= res!524672 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775795 () Bool)

(assert (=> b!775795 (= e!431739 e!431742)))

(declare-fun res!524668 () Bool)

(assert (=> b!775795 (=> (not res!524668) (not e!431742))))

(assert (=> b!775795 (= res!524668 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20343 a!3186) j!159) mask!3328) (select (arr!20343 a!3186) j!159) a!3186 mask!3328) lt!345597))))

(assert (=> b!775795 (= lt!345597 (Intermediate!7943 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775796 () Bool)

(assert (=> b!775796 (= e!431745 e!431744)))

(declare-fun res!524669 () Bool)

(assert (=> b!775796 (=> (not res!524669) (not e!431744))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42495 (_ BitVec 32)) SeekEntryResult!7943)

(assert (=> b!775796 (= res!524669 (= (seekEntryOrOpen!0 (select (arr!20343 a!3186) j!159) a!3186 mask!3328) lt!345599))))

(assert (=> b!775796 (= lt!345599 (Found!7943 j!159))))

(declare-fun b!775797 () Bool)

(assert (=> b!775797 (= e!431740 e!431739)))

(declare-fun res!524675 () Bool)

(assert (=> b!775797 (=> (not res!524675) (not e!431739))))

(declare-fun lt!345602 () SeekEntryResult!7943)

(assert (=> b!775797 (= res!524675 (or (= lt!345602 (MissingZero!7943 i!1173)) (= lt!345602 (MissingVacant!7943 i!1173))))))

(assert (=> b!775797 (= lt!345602 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!775798 () Bool)

(declare-fun res!524674 () Bool)

(assert (=> b!775798 (=> (not res!524674) (not e!431739))))

(assert (=> b!775798 (= res!524674 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20764 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20764 a!3186))))))

(declare-fun b!775799 () Bool)

(declare-fun res!524667 () Bool)

(assert (=> b!775799 (=> (not res!524667) (not e!431742))))

(assert (=> b!775799 (= res!524667 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20343 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775800 () Bool)

(declare-fun res!524671 () Bool)

(assert (=> b!775800 (=> (not res!524671) (not e!431739))))

(declare-datatypes ((List!14345 0))(
  ( (Nil!14342) (Cons!14341 (h!15449 (_ BitVec 64)) (t!20660 List!14345)) )
))
(declare-fun arrayNoDuplicates!0 (array!42495 (_ BitVec 32) List!14345) Bool)

(assert (=> b!775800 (= res!524671 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14342))))

(declare-fun b!775801 () Bool)

(declare-fun res!524661 () Bool)

(assert (=> b!775801 (=> (not res!524661) (not e!431740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775801 (= res!524661 (validKeyInArray!0 (select (arr!20343 a!3186) j!159)))))

(declare-fun b!775802 () Bool)

(declare-fun res!524670 () Bool)

(assert (=> b!775802 (=> (not res!524670) (not e!431740))))

(assert (=> b!775802 (= res!524670 (validKeyInArray!0 k!2102))))

(declare-fun b!775803 () Bool)

(declare-fun res!524663 () Bool)

(assert (=> b!775803 (=> (not res!524663) (not e!431742))))

(assert (=> b!775803 (= res!524663 e!431741)))

(declare-fun c!85963 () Bool)

(assert (=> b!775803 (= c!85963 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67140 res!524660) b!775787))

(assert (= (and b!775787 res!524666) b!775801))

(assert (= (and b!775801 res!524661) b!775802))

(assert (= (and b!775802 res!524670) b!775794))

(assert (= (and b!775794 res!524672) b!775797))

(assert (= (and b!775797 res!524675) b!775789))

(assert (= (and b!775789 res!524664) b!775800))

(assert (= (and b!775800 res!524671) b!775798))

(assert (= (and b!775798 res!524674) b!775795))

(assert (= (and b!775795 res!524668) b!775799))

(assert (= (and b!775799 res!524667) b!775803))

(assert (= (and b!775803 c!85963) b!775791))

(assert (= (and b!775803 (not c!85963)) b!775790))

(assert (= (and b!775803 res!524663) b!775786))

(assert (= (and b!775786 res!524662) b!775788))

(assert (= (and b!775788 res!524673) b!775796))

(assert (= (and b!775796 res!524669) b!775793))

(assert (= (and b!775788 (not res!524665)) b!775792))

(declare-fun m!719963 () Bool)

(assert (=> b!775786 m!719963))

(assert (=> b!775786 m!719963))

(declare-fun m!719965 () Bool)

(assert (=> b!775786 m!719965))

(declare-fun m!719967 () Bool)

(assert (=> b!775786 m!719967))

(declare-fun m!719969 () Bool)

(assert (=> b!775786 m!719969))

(declare-fun m!719971 () Bool)

(assert (=> b!775786 m!719971))

(declare-fun m!719973 () Bool)

(assert (=> b!775802 m!719973))

(declare-fun m!719975 () Bool)

(assert (=> b!775793 m!719975))

(assert (=> b!775793 m!719975))

(declare-fun m!719977 () Bool)

(assert (=> b!775793 m!719977))

(assert (=> b!775801 m!719975))

(assert (=> b!775801 m!719975))

(declare-fun m!719979 () Bool)

(assert (=> b!775801 m!719979))

(declare-fun m!719981 () Bool)

(assert (=> b!775794 m!719981))

(assert (=> b!775791 m!719975))

(assert (=> b!775791 m!719975))

(declare-fun m!719983 () Bool)

(assert (=> b!775791 m!719983))

(declare-fun m!719985 () Bool)

(assert (=> b!775788 m!719985))

(declare-fun m!719987 () Bool)

(assert (=> b!775788 m!719987))

(assert (=> b!775796 m!719975))

(assert (=> b!775796 m!719975))

(declare-fun m!719989 () Bool)

(assert (=> b!775796 m!719989))

(declare-fun m!719991 () Bool)

(assert (=> b!775789 m!719991))

(assert (=> b!775795 m!719975))

(assert (=> b!775795 m!719975))

(declare-fun m!719993 () Bool)

(assert (=> b!775795 m!719993))

(assert (=> b!775795 m!719993))

(assert (=> b!775795 m!719975))

(declare-fun m!719995 () Bool)

(assert (=> b!775795 m!719995))

(declare-fun m!719997 () Bool)

(assert (=> b!775800 m!719997))

(assert (=> b!775792 m!719975))

(assert (=> b!775792 m!719975))

(declare-fun m!719999 () Bool)

(assert (=> b!775792 m!719999))

(declare-fun m!720001 () Bool)

(assert (=> start!67140 m!720001))

(declare-fun m!720003 () Bool)

(assert (=> start!67140 m!720003))

(assert (=> b!775790 m!719975))

(assert (=> b!775790 m!719975))

(assert (=> b!775790 m!719999))

(declare-fun m!720005 () Bool)

(assert (=> b!775797 m!720005))

(declare-fun m!720007 () Bool)

(assert (=> b!775799 m!720007))

(push 1)

