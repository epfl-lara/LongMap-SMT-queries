; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65274 () Bool)

(assert start!65274)

(declare-fun b!740667 () Bool)

(declare-fun res!498121 () Bool)

(declare-fun e!414078 () Bool)

(assert (=> b!740667 (=> (not res!498121) (not e!414078))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740667 (= res!498121 (validKeyInArray!0 k0!2102))))

(declare-datatypes ((array!41447 0))(
  ( (array!41448 (arr!19837 (Array (_ BitVec 32) (_ BitVec 64))) (size!20258 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41447)

(declare-fun b!740668 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!329059 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!414079 () Bool)

(declare-datatypes ((SeekEntryResult!7437 0))(
  ( (MissingZero!7437 (index!32116 (_ BitVec 32))) (Found!7437 (index!32117 (_ BitVec 32))) (Intermediate!7437 (undefined!8249 Bool) (index!32118 (_ BitVec 32)) (x!63099 (_ BitVec 32))) (Undefined!7437) (MissingVacant!7437 (index!32119 (_ BitVec 32))) )
))
(declare-fun lt!329062 () SeekEntryResult!7437)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41447 (_ BitVec 32)) SeekEntryResult!7437)

(assert (=> b!740668 (= e!414079 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329059 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329062)))))

(declare-fun b!740669 () Bool)

(declare-fun e!414085 () Bool)

(assert (=> b!740669 (= e!414078 e!414085)))

(declare-fun res!498109 () Bool)

(assert (=> b!740669 (=> (not res!498109) (not e!414085))))

(declare-fun lt!329053 () SeekEntryResult!7437)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740669 (= res!498109 (or (= lt!329053 (MissingZero!7437 i!1173)) (= lt!329053 (MissingVacant!7437 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41447 (_ BitVec 32)) SeekEntryResult!7437)

(assert (=> b!740669 (= lt!329053 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740670 () Bool)

(declare-fun res!498106 () Bool)

(declare-fun e!414080 () Bool)

(assert (=> b!740670 (=> (not res!498106) (not e!414080))))

(declare-fun e!414076 () Bool)

(assert (=> b!740670 (= res!498106 e!414076)))

(declare-fun c!81664 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740670 (= c!81664 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740671 () Bool)

(declare-fun res!498116 () Bool)

(declare-fun e!414081 () Bool)

(assert (=> b!740671 (=> res!498116 e!414081)))

(declare-fun lt!329057 () SeekEntryResult!7437)

(declare-fun lt!329055 () array!41447)

(declare-fun lt!329052 () (_ BitVec 64))

(assert (=> b!740671 (= res!498116 (not (= lt!329057 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329059 lt!329052 lt!329055 mask!3328))))))

(declare-fun b!740672 () Bool)

(declare-fun e!414086 () Bool)

(declare-fun e!414075 () Bool)

(assert (=> b!740672 (= e!414086 e!414075)))

(declare-fun res!498119 () Bool)

(assert (=> b!740672 (=> (not res!498119) (not e!414075))))

(declare-fun lt!329061 () SeekEntryResult!7437)

(assert (=> b!740672 (= res!498119 (= (seekEntryOrOpen!0 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329061))))

(assert (=> b!740672 (= lt!329061 (Found!7437 j!159))))

(declare-fun res!498111 () Bool)

(assert (=> start!65274 (=> (not res!498111) (not e!414078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65274 (= res!498111 (validMask!0 mask!3328))))

(assert (=> start!65274 e!414078))

(assert (=> start!65274 true))

(declare-fun array_inv!15633 (array!41447) Bool)

(assert (=> start!65274 (array_inv!15633 a!3186)))

(declare-fun b!740673 () Bool)

(declare-datatypes ((Unit!25344 0))(
  ( (Unit!25345) )
))
(declare-fun e!414084 () Unit!25344)

(declare-fun Unit!25346 () Unit!25344)

(assert (=> b!740673 (= e!414084 Unit!25346)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!329054 () SeekEntryResult!7437)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41447 (_ BitVec 32)) SeekEntryResult!7437)

(assert (=> b!740673 (= lt!329054 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19837 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!329058 () SeekEntryResult!7437)

(assert (=> b!740673 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329059 resIntermediateIndex!5 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329058)))

(declare-fun b!740674 () Bool)

(assert (=> b!740674 (= e!414081 true)))

(assert (=> b!740674 (= (seekEntryOrOpen!0 lt!329052 lt!329055 mask!3328) lt!329058)))

(declare-fun lt!329050 () Unit!25344)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41447 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25344)

(assert (=> b!740674 (= lt!329050 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!329059 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740675 () Bool)

(declare-fun res!498114 () Bool)

(assert (=> b!740675 (=> (not res!498114) (not e!414078))))

(declare-fun arrayContainsKey!0 (array!41447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740675 (= res!498114 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740676 () Bool)

(declare-fun e!414083 () Bool)

(assert (=> b!740676 (= e!414083 e!414081)))

(declare-fun res!498104 () Bool)

(assert (=> b!740676 (=> res!498104 e!414081)))

(assert (=> b!740676 (= res!498104 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!329059 #b00000000000000000000000000000000) (bvsge lt!329059 (size!20258 a!3186))))))

(declare-fun lt!329051 () Unit!25344)

(assert (=> b!740676 (= lt!329051 e!414084)))

(declare-fun c!81662 () Bool)

(declare-fun lt!329056 () Bool)

(assert (=> b!740676 (= c!81662 lt!329056)))

(assert (=> b!740676 (= lt!329056 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740676 (= lt!329059 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740677 () Bool)

(declare-fun e!414082 () Bool)

(assert (=> b!740677 (= e!414082 (not e!414083))))

(declare-fun res!498108 () Bool)

(assert (=> b!740677 (=> res!498108 e!414083)))

(declare-fun lt!329063 () SeekEntryResult!7437)

(get-info :version)

(assert (=> b!740677 (= res!498108 (or (not ((_ is Intermediate!7437) lt!329063)) (bvsge x!1131 (x!63099 lt!329063))))))

(assert (=> b!740677 (= lt!329058 (Found!7437 j!159))))

(assert (=> b!740677 e!414086))

(declare-fun res!498110 () Bool)

(assert (=> b!740677 (=> (not res!498110) (not e!414086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41447 (_ BitVec 32)) Bool)

(assert (=> b!740677 (= res!498110 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!329060 () Unit!25344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25344)

(assert (=> b!740677 (= lt!329060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740678 () Bool)

(declare-fun res!498105 () Bool)

(assert (=> b!740678 (=> (not res!498105) (not e!414078))))

(assert (=> b!740678 (= res!498105 (validKeyInArray!0 (select (arr!19837 a!3186) j!159)))))

(declare-fun b!740679 () Bool)

(assert (=> b!740679 (= e!414076 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) (Found!7437 j!159)))))

(declare-fun b!740680 () Bool)

(assert (=> b!740680 (= e!414076 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329062))))

(declare-fun b!740681 () Bool)

(declare-fun res!498118 () Bool)

(assert (=> b!740681 (=> res!498118 e!414081)))

(assert (=> b!740681 (= res!498118 e!414079)))

(declare-fun c!81663 () Bool)

(assert (=> b!740681 (= c!81663 lt!329056)))

(declare-fun b!740682 () Bool)

(assert (=> b!740682 (= e!414075 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329061))))

(declare-fun b!740683 () Bool)

(assert (=> b!740683 (= e!414079 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329059 resIntermediateIndex!5 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329058)))))

(declare-fun b!740684 () Bool)

(assert (=> b!740684 (= e!414085 e!414080)))

(declare-fun res!498120 () Bool)

(assert (=> b!740684 (=> (not res!498120) (not e!414080))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740684 (= res!498120 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19837 a!3186) j!159) mask!3328) (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329062))))

(assert (=> b!740684 (= lt!329062 (Intermediate!7437 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740685 () Bool)

(declare-fun res!498107 () Bool)

(assert (=> b!740685 (=> (not res!498107) (not e!414085))))

(declare-datatypes ((List!13839 0))(
  ( (Nil!13836) (Cons!13835 (h!14907 (_ BitVec 64)) (t!20154 List!13839)) )
))
(declare-fun arrayNoDuplicates!0 (array!41447 (_ BitVec 32) List!13839) Bool)

(assert (=> b!740685 (= res!498107 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13836))))

(declare-fun b!740686 () Bool)

(declare-fun res!498117 () Bool)

(assert (=> b!740686 (=> (not res!498117) (not e!414085))))

(assert (=> b!740686 (= res!498117 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20258 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20258 a!3186))))))

(declare-fun b!740687 () Bool)

(declare-fun res!498115 () Bool)

(assert (=> b!740687 (=> (not res!498115) (not e!414085))))

(assert (=> b!740687 (= res!498115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740688 () Bool)

(declare-fun res!498113 () Bool)

(assert (=> b!740688 (=> (not res!498113) (not e!414080))))

(assert (=> b!740688 (= res!498113 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19837 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740689 () Bool)

(declare-fun Unit!25347 () Unit!25344)

(assert (=> b!740689 (= e!414084 Unit!25347)))

(assert (=> b!740689 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329059 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329062)))

(declare-fun b!740690 () Bool)

(declare-fun res!498112 () Bool)

(assert (=> b!740690 (=> (not res!498112) (not e!414078))))

(assert (=> b!740690 (= res!498112 (and (= (size!20258 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20258 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20258 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740691 () Bool)

(assert (=> b!740691 (= e!414080 e!414082)))

(declare-fun res!498122 () Bool)

(assert (=> b!740691 (=> (not res!498122) (not e!414082))))

(assert (=> b!740691 (= res!498122 (= lt!329057 lt!329063))))

(assert (=> b!740691 (= lt!329063 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329052 lt!329055 mask!3328))))

(assert (=> b!740691 (= lt!329057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329052 mask!3328) lt!329052 lt!329055 mask!3328))))

(assert (=> b!740691 (= lt!329052 (select (store (arr!19837 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740691 (= lt!329055 (array!41448 (store (arr!19837 a!3186) i!1173 k0!2102) (size!20258 a!3186)))))

(assert (= (and start!65274 res!498111) b!740690))

(assert (= (and b!740690 res!498112) b!740678))

(assert (= (and b!740678 res!498105) b!740667))

(assert (= (and b!740667 res!498121) b!740675))

(assert (= (and b!740675 res!498114) b!740669))

(assert (= (and b!740669 res!498109) b!740687))

(assert (= (and b!740687 res!498115) b!740685))

(assert (= (and b!740685 res!498107) b!740686))

(assert (= (and b!740686 res!498117) b!740684))

(assert (= (and b!740684 res!498120) b!740688))

(assert (= (and b!740688 res!498113) b!740670))

(assert (= (and b!740670 c!81664) b!740680))

(assert (= (and b!740670 (not c!81664)) b!740679))

(assert (= (and b!740670 res!498106) b!740691))

(assert (= (and b!740691 res!498122) b!740677))

(assert (= (and b!740677 res!498110) b!740672))

(assert (= (and b!740672 res!498119) b!740682))

(assert (= (and b!740677 (not res!498108)) b!740676))

(assert (= (and b!740676 c!81662) b!740689))

(assert (= (and b!740676 (not c!81662)) b!740673))

(assert (= (and b!740676 (not res!498104)) b!740681))

(assert (= (and b!740681 c!81663) b!740668))

(assert (= (and b!740681 (not c!81663)) b!740683))

(assert (= (and b!740681 (not res!498118)) b!740671))

(assert (= (and b!740671 (not res!498116)) b!740674))

(declare-fun m!691751 () Bool)

(assert (=> start!65274 m!691751))

(declare-fun m!691753 () Bool)

(assert (=> start!65274 m!691753))

(declare-fun m!691755 () Bool)

(assert (=> b!740669 m!691755))

(declare-fun m!691757 () Bool)

(assert (=> b!740672 m!691757))

(assert (=> b!740672 m!691757))

(declare-fun m!691759 () Bool)

(assert (=> b!740672 m!691759))

(assert (=> b!740678 m!691757))

(assert (=> b!740678 m!691757))

(declare-fun m!691761 () Bool)

(assert (=> b!740678 m!691761))

(declare-fun m!691763 () Bool)

(assert (=> b!740688 m!691763))

(declare-fun m!691765 () Bool)

(assert (=> b!740675 m!691765))

(declare-fun m!691767 () Bool)

(assert (=> b!740677 m!691767))

(declare-fun m!691769 () Bool)

(assert (=> b!740677 m!691769))

(declare-fun m!691771 () Bool)

(assert (=> b!740691 m!691771))

(declare-fun m!691773 () Bool)

(assert (=> b!740691 m!691773))

(assert (=> b!740691 m!691771))

(declare-fun m!691775 () Bool)

(assert (=> b!740691 m!691775))

(declare-fun m!691777 () Bool)

(assert (=> b!740691 m!691777))

(declare-fun m!691779 () Bool)

(assert (=> b!740691 m!691779))

(assert (=> b!740684 m!691757))

(assert (=> b!740684 m!691757))

(declare-fun m!691781 () Bool)

(assert (=> b!740684 m!691781))

(assert (=> b!740684 m!691781))

(assert (=> b!740684 m!691757))

(declare-fun m!691783 () Bool)

(assert (=> b!740684 m!691783))

(assert (=> b!740682 m!691757))

(assert (=> b!740682 m!691757))

(declare-fun m!691785 () Bool)

(assert (=> b!740682 m!691785))

(assert (=> b!740689 m!691757))

(assert (=> b!740689 m!691757))

(declare-fun m!691787 () Bool)

(assert (=> b!740689 m!691787))

(declare-fun m!691789 () Bool)

(assert (=> b!740674 m!691789))

(declare-fun m!691791 () Bool)

(assert (=> b!740674 m!691791))

(declare-fun m!691793 () Bool)

(assert (=> b!740667 m!691793))

(declare-fun m!691795 () Bool)

(assert (=> b!740676 m!691795))

(declare-fun m!691797 () Bool)

(assert (=> b!740685 m!691797))

(declare-fun m!691799 () Bool)

(assert (=> b!740687 m!691799))

(assert (=> b!740683 m!691757))

(assert (=> b!740683 m!691757))

(declare-fun m!691801 () Bool)

(assert (=> b!740683 m!691801))

(assert (=> b!740673 m!691757))

(assert (=> b!740673 m!691757))

(declare-fun m!691803 () Bool)

(assert (=> b!740673 m!691803))

(assert (=> b!740673 m!691757))

(assert (=> b!740673 m!691801))

(assert (=> b!740680 m!691757))

(assert (=> b!740680 m!691757))

(declare-fun m!691805 () Bool)

(assert (=> b!740680 m!691805))

(assert (=> b!740679 m!691757))

(assert (=> b!740679 m!691757))

(assert (=> b!740679 m!691803))

(declare-fun m!691807 () Bool)

(assert (=> b!740671 m!691807))

(assert (=> b!740668 m!691757))

(assert (=> b!740668 m!691757))

(assert (=> b!740668 m!691787))

(check-sat (not b!740683) (not b!740691) (not b!740678) (not start!65274) (not b!740677) (not b!740674) (not b!740667) (not b!740668) (not b!740676) (not b!740680) (not b!740689) (not b!740673) (not b!740679) (not b!740669) (not b!740685) (not b!740684) (not b!740682) (not b!740675) (not b!740671) (not b!740687) (not b!740672))
(check-sat)
