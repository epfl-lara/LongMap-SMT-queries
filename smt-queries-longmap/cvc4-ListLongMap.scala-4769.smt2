; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65678 () Bool)

(assert start!65678)

(declare-datatypes ((array!41851 0))(
  ( (array!41852 (arr!20039 (Array (_ BitVec 32) (_ BitVec 64))) (size!20460 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41851)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!752804 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!419903 () Bool)

(declare-datatypes ((SeekEntryResult!7639 0))(
  ( (MissingZero!7639 (index!32924 (_ BitVec 32))) (Found!7639 (index!32925 (_ BitVec 32))) (Intermediate!7639 (undefined!8451 Bool) (index!32926 (_ BitVec 32)) (x!63837 (_ BitVec 32))) (Undefined!7639) (MissingVacant!7639 (index!32927 (_ BitVec 32))) )
))
(declare-fun lt!334897 () SeekEntryResult!7639)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41851 (_ BitVec 32)) SeekEntryResult!7639)

(assert (=> b!752804 (= e!419903 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20039 a!3186) j!159) a!3186 mask!3328) lt!334897))))

(declare-fun b!752805 () Bool)

(declare-fun e!419907 () Bool)

(declare-fun e!419899 () Bool)

(assert (=> b!752805 (= e!419907 e!419899)))

(declare-fun res!508452 () Bool)

(assert (=> b!752805 (=> res!508452 e!419899)))

(declare-fun lt!334901 () (_ BitVec 64))

(declare-fun lt!334900 () (_ BitVec 64))

(assert (=> b!752805 (= res!508452 (= lt!334901 lt!334900))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!752805 (= lt!334901 (select (store (arr!20039 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!752807 () Bool)

(declare-fun res!508453 () Bool)

(declare-fun e!419898 () Bool)

(assert (=> b!752807 (=> (not res!508453) (not e!419898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752807 (= res!508453 (validKeyInArray!0 k!2102))))

(declare-fun b!752808 () Bool)

(declare-fun res!508450 () Bool)

(declare-fun e!419908 () Bool)

(assert (=> b!752808 (=> (not res!508450) (not e!419908))))

(declare-datatypes ((List!14041 0))(
  ( (Nil!14038) (Cons!14037 (h!15109 (_ BitVec 64)) (t!20356 List!14041)) )
))
(declare-fun arrayNoDuplicates!0 (array!41851 (_ BitVec 32) List!14041) Bool)

(assert (=> b!752808 (= res!508450 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14038))))

(declare-fun b!752809 () Bool)

(declare-fun res!508439 () Bool)

(assert (=> b!752809 (=> (not res!508439) (not e!419898))))

(assert (=> b!752809 (= res!508439 (and (= (size!20460 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20460 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20460 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752810 () Bool)

(declare-fun res!508440 () Bool)

(declare-fun e!419902 () Bool)

(assert (=> b!752810 (=> (not res!508440) (not e!419902))))

(assert (=> b!752810 (= res!508440 e!419903)))

(declare-fun c!82563 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752810 (= c!82563 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752811 () Bool)

(declare-fun res!508443 () Bool)

(assert (=> b!752811 (=> (not res!508443) (not e!419898))))

(assert (=> b!752811 (= res!508443 (validKeyInArray!0 (select (arr!20039 a!3186) j!159)))))

(declare-fun b!752812 () Bool)

(declare-datatypes ((Unit!25936 0))(
  ( (Unit!25937) )
))
(declare-fun e!419904 () Unit!25936)

(declare-fun Unit!25938 () Unit!25936)

(assert (=> b!752812 (= e!419904 Unit!25938)))

(declare-fun b!752813 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!752813 (= e!419899 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!419906 () Bool)

(assert (=> b!752813 e!419906))

(declare-fun res!508456 () Bool)

(assert (=> b!752813 (=> (not res!508456) (not e!419906))))

(assert (=> b!752813 (= res!508456 (= lt!334901 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334890 () Unit!25936)

(assert (=> b!752813 (= lt!334890 e!419904)))

(declare-fun c!82564 () Bool)

(assert (=> b!752813 (= c!82564 (= lt!334901 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752814 () Bool)

(assert (=> b!752814 (= e!419908 e!419902)))

(declare-fun res!508442 () Bool)

(assert (=> b!752814 (=> (not res!508442) (not e!419902))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752814 (= res!508442 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20039 a!3186) j!159) mask!3328) (select (arr!20039 a!3186) j!159) a!3186 mask!3328) lt!334897))))

(assert (=> b!752814 (= lt!334897 (Intermediate!7639 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752815 () Bool)

(assert (=> b!752815 (= e!419898 e!419908)))

(declare-fun res!508448 () Bool)

(assert (=> b!752815 (=> (not res!508448) (not e!419908))))

(declare-fun lt!334893 () SeekEntryResult!7639)

(assert (=> b!752815 (= res!508448 (or (= lt!334893 (MissingZero!7639 i!1173)) (= lt!334893 (MissingVacant!7639 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41851 (_ BitVec 32)) SeekEntryResult!7639)

(assert (=> b!752815 (= lt!334893 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!508441 () Bool)

(assert (=> start!65678 (=> (not res!508441) (not e!419898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65678 (= res!508441 (validMask!0 mask!3328))))

(assert (=> start!65678 e!419898))

(assert (=> start!65678 true))

(declare-fun array_inv!15835 (array!41851) Bool)

(assert (=> start!65678 (array_inv!15835 a!3186)))

(declare-fun b!752806 () Bool)

(declare-fun res!508457 () Bool)

(assert (=> b!752806 (=> (not res!508457) (not e!419898))))

(declare-fun arrayContainsKey!0 (array!41851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752806 (= res!508457 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752816 () Bool)

(declare-fun res!508445 () Bool)

(assert (=> b!752816 (=> (not res!508445) (not e!419908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41851 (_ BitVec 32)) Bool)

(assert (=> b!752816 (= res!508445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752817 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41851 (_ BitVec 32)) SeekEntryResult!7639)

(assert (=> b!752817 (= e!419903 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20039 a!3186) j!159) a!3186 mask!3328) (Found!7639 j!159)))))

(declare-fun b!752818 () Bool)

(declare-fun e!419901 () Bool)

(declare-fun e!419909 () Bool)

(assert (=> b!752818 (= e!419901 (not e!419909))))

(declare-fun res!508454 () Bool)

(assert (=> b!752818 (=> res!508454 e!419909)))

(declare-fun lt!334895 () SeekEntryResult!7639)

(assert (=> b!752818 (= res!508454 (or (not (is-Intermediate!7639 lt!334895)) (bvslt x!1131 (x!63837 lt!334895)) (not (= x!1131 (x!63837 lt!334895))) (not (= index!1321 (index!32926 lt!334895)))))))

(declare-fun e!419905 () Bool)

(assert (=> b!752818 e!419905))

(declare-fun res!508446 () Bool)

(assert (=> b!752818 (=> (not res!508446) (not e!419905))))

(declare-fun lt!334896 () SeekEntryResult!7639)

(declare-fun lt!334899 () SeekEntryResult!7639)

(assert (=> b!752818 (= res!508446 (= lt!334896 lt!334899))))

(assert (=> b!752818 (= lt!334899 (Found!7639 j!159))))

(assert (=> b!752818 (= lt!334896 (seekEntryOrOpen!0 (select (arr!20039 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752818 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334891 () Unit!25936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25936)

(assert (=> b!752818 (= lt!334891 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752819 () Bool)

(declare-fun Unit!25939 () Unit!25936)

(assert (=> b!752819 (= e!419904 Unit!25939)))

(assert (=> b!752819 false))

(declare-fun b!752820 () Bool)

(assert (=> b!752820 (= e!419905 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20039 a!3186) j!159) a!3186 mask!3328) lt!334899))))

(declare-fun b!752821 () Bool)

(declare-fun res!508444 () Bool)

(assert (=> b!752821 (=> (not res!508444) (not e!419902))))

(assert (=> b!752821 (= res!508444 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20039 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752822 () Bool)

(declare-fun res!508447 () Bool)

(assert (=> b!752822 (=> (not res!508447) (not e!419906))))

(declare-fun lt!334898 () array!41851)

(assert (=> b!752822 (= res!508447 (= (seekEntryOrOpen!0 lt!334900 lt!334898 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334900 lt!334898 mask!3328)))))

(declare-fun b!752823 () Bool)

(declare-fun res!508449 () Bool)

(assert (=> b!752823 (=> (not res!508449) (not e!419908))))

(assert (=> b!752823 (= res!508449 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20460 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20460 a!3186))))))

(declare-fun b!752824 () Bool)

(assert (=> b!752824 (= e!419902 e!419901)))

(declare-fun res!508455 () Bool)

(assert (=> b!752824 (=> (not res!508455) (not e!419901))))

(declare-fun lt!334894 () SeekEntryResult!7639)

(assert (=> b!752824 (= res!508455 (= lt!334894 lt!334895))))

(assert (=> b!752824 (= lt!334895 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334900 lt!334898 mask!3328))))

(assert (=> b!752824 (= lt!334894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334900 mask!3328) lt!334900 lt!334898 mask!3328))))

(assert (=> b!752824 (= lt!334900 (select (store (arr!20039 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!752824 (= lt!334898 (array!41852 (store (arr!20039 a!3186) i!1173 k!2102) (size!20460 a!3186)))))

(declare-fun b!752825 () Bool)

(assert (=> b!752825 (= e!419909 e!419907)))

(declare-fun res!508451 () Bool)

(assert (=> b!752825 (=> res!508451 e!419907)))

(declare-fun lt!334892 () SeekEntryResult!7639)

(assert (=> b!752825 (= res!508451 (not (= lt!334892 lt!334899)))))

(assert (=> b!752825 (= lt!334892 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20039 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752826 () Bool)

(assert (=> b!752826 (= e!419906 (= lt!334896 lt!334892))))

(assert (= (and start!65678 res!508441) b!752809))

(assert (= (and b!752809 res!508439) b!752811))

(assert (= (and b!752811 res!508443) b!752807))

(assert (= (and b!752807 res!508453) b!752806))

(assert (= (and b!752806 res!508457) b!752815))

(assert (= (and b!752815 res!508448) b!752816))

(assert (= (and b!752816 res!508445) b!752808))

(assert (= (and b!752808 res!508450) b!752823))

(assert (= (and b!752823 res!508449) b!752814))

(assert (= (and b!752814 res!508442) b!752821))

(assert (= (and b!752821 res!508444) b!752810))

(assert (= (and b!752810 c!82563) b!752804))

(assert (= (and b!752810 (not c!82563)) b!752817))

(assert (= (and b!752810 res!508440) b!752824))

(assert (= (and b!752824 res!508455) b!752818))

(assert (= (and b!752818 res!508446) b!752820))

(assert (= (and b!752818 (not res!508454)) b!752825))

(assert (= (and b!752825 (not res!508451)) b!752805))

(assert (= (and b!752805 (not res!508452)) b!752813))

(assert (= (and b!752813 c!82564) b!752819))

(assert (= (and b!752813 (not c!82564)) b!752812))

(assert (= (and b!752813 res!508456) b!752822))

(assert (= (and b!752822 res!508447) b!752826))

(declare-fun m!701655 () Bool)

(assert (=> b!752821 m!701655))

(declare-fun m!701657 () Bool)

(assert (=> start!65678 m!701657))

(declare-fun m!701659 () Bool)

(assert (=> start!65678 m!701659))

(declare-fun m!701661 () Bool)

(assert (=> b!752820 m!701661))

(assert (=> b!752820 m!701661))

(declare-fun m!701663 () Bool)

(assert (=> b!752820 m!701663))

(assert (=> b!752825 m!701661))

(assert (=> b!752825 m!701661))

(declare-fun m!701665 () Bool)

(assert (=> b!752825 m!701665))

(declare-fun m!701667 () Bool)

(assert (=> b!752816 m!701667))

(declare-fun m!701669 () Bool)

(assert (=> b!752805 m!701669))

(declare-fun m!701671 () Bool)

(assert (=> b!752805 m!701671))

(declare-fun m!701673 () Bool)

(assert (=> b!752807 m!701673))

(assert (=> b!752817 m!701661))

(assert (=> b!752817 m!701661))

(assert (=> b!752817 m!701665))

(assert (=> b!752804 m!701661))

(assert (=> b!752804 m!701661))

(declare-fun m!701675 () Bool)

(assert (=> b!752804 m!701675))

(assert (=> b!752818 m!701661))

(assert (=> b!752818 m!701661))

(declare-fun m!701677 () Bool)

(assert (=> b!752818 m!701677))

(declare-fun m!701679 () Bool)

(assert (=> b!752818 m!701679))

(declare-fun m!701681 () Bool)

(assert (=> b!752818 m!701681))

(declare-fun m!701683 () Bool)

(assert (=> b!752806 m!701683))

(declare-fun m!701685 () Bool)

(assert (=> b!752824 m!701685))

(declare-fun m!701687 () Bool)

(assert (=> b!752824 m!701687))

(declare-fun m!701689 () Bool)

(assert (=> b!752824 m!701689))

(assert (=> b!752824 m!701669))

(declare-fun m!701691 () Bool)

(assert (=> b!752824 m!701691))

(assert (=> b!752824 m!701687))

(declare-fun m!701693 () Bool)

(assert (=> b!752808 m!701693))

(assert (=> b!752814 m!701661))

(assert (=> b!752814 m!701661))

(declare-fun m!701695 () Bool)

(assert (=> b!752814 m!701695))

(assert (=> b!752814 m!701695))

(assert (=> b!752814 m!701661))

(declare-fun m!701697 () Bool)

(assert (=> b!752814 m!701697))

(assert (=> b!752811 m!701661))

(assert (=> b!752811 m!701661))

(declare-fun m!701699 () Bool)

(assert (=> b!752811 m!701699))

(declare-fun m!701701 () Bool)

(assert (=> b!752822 m!701701))

(declare-fun m!701703 () Bool)

(assert (=> b!752822 m!701703))

(declare-fun m!701705 () Bool)

(assert (=> b!752815 m!701705))

(push 1)

(assert (not b!752811))

(assert (not b!752807))

(assert (not b!752804))

(assert (not b!752816))

(assert (not b!752820))

(assert (not b!752825))

(assert (not start!65678))

(assert (not b!752824))

(assert (not b!752817))

(assert (not b!752814))

(assert (not b!752808))

(assert (not b!752818))

(assert (not b!752822))

(assert (not b!752806))

(assert (not b!752815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

