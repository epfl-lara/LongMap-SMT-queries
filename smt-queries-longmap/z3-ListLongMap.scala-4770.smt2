; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65682 () Bool)

(assert start!65682)

(declare-fun b!752942 () Bool)

(declare-fun res!508562 () Bool)

(declare-fun e!419975 () Bool)

(assert (=> b!752942 (=> (not res!508562) (not e!419975))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41855 0))(
  ( (array!41856 (arr!20041 (Array (_ BitVec 32) (_ BitVec 64))) (size!20462 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41855)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752942 (= res!508562 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20041 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752943 () Bool)

(declare-fun e!419981 () Bool)

(assert (=> b!752943 (= e!419981 e!419975)))

(declare-fun res!508560 () Bool)

(assert (=> b!752943 (=> (not res!508560) (not e!419975))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7641 0))(
  ( (MissingZero!7641 (index!32932 (_ BitVec 32))) (Found!7641 (index!32933 (_ BitVec 32))) (Intermediate!7641 (undefined!8453 Bool) (index!32934 (_ BitVec 32)) (x!63847 (_ BitVec 32))) (Undefined!7641) (MissingVacant!7641 (index!32935 (_ BitVec 32))) )
))
(declare-fun lt!334968 () SeekEntryResult!7641)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41855 (_ BitVec 32)) SeekEntryResult!7641)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752943 (= res!508560 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20041 a!3186) j!159) mask!3328) (select (arr!20041 a!3186) j!159) a!3186 mask!3328) lt!334968))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752943 (= lt!334968 (Intermediate!7641 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752944 () Bool)

(declare-fun res!508571 () Bool)

(declare-fun e!419972 () Bool)

(assert (=> b!752944 (=> (not res!508571) (not e!419972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752944 (= res!508571 (validKeyInArray!0 (select (arr!20041 a!3186) j!159)))))

(declare-fun b!752945 () Bool)

(declare-fun res!508556 () Bool)

(assert (=> b!752945 (=> (not res!508556) (not e!419972))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752945 (= res!508556 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752946 () Bool)

(declare-fun res!508555 () Bool)

(assert (=> b!752946 (=> (not res!508555) (not e!419972))))

(assert (=> b!752946 (= res!508555 (validKeyInArray!0 k0!2102))))

(declare-fun b!752947 () Bool)

(declare-fun res!508564 () Bool)

(assert (=> b!752947 (=> (not res!508564) (not e!419981))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!752947 (= res!508564 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20462 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20462 a!3186))))))

(declare-fun b!752948 () Bool)

(declare-fun e!419976 () Bool)

(declare-fun lt!334965 () SeekEntryResult!7641)

(declare-fun lt!334973 () SeekEntryResult!7641)

(assert (=> b!752948 (= e!419976 (= lt!334965 lt!334973))))

(declare-fun b!752950 () Bool)

(declare-fun res!508554 () Bool)

(assert (=> b!752950 (=> (not res!508554) (not e!419981))))

(declare-datatypes ((List!14043 0))(
  ( (Nil!14040) (Cons!14039 (h!15111 (_ BitVec 64)) (t!20358 List!14043)) )
))
(declare-fun arrayNoDuplicates!0 (array!41855 (_ BitVec 32) List!14043) Bool)

(assert (=> b!752950 (= res!508554 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14040))))

(declare-fun b!752951 () Bool)

(declare-fun lt!334970 () SeekEntryResult!7641)

(declare-fun e!419978 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41855 (_ BitVec 32)) SeekEntryResult!7641)

(assert (=> b!752951 (= e!419978 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20041 a!3186) j!159) a!3186 mask!3328) lt!334970))))

(declare-fun b!752952 () Bool)

(declare-fun res!508567 () Bool)

(assert (=> b!752952 (=> (not res!508567) (not e!419976))))

(declare-fun lt!334971 () array!41855)

(declare-fun lt!334969 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41855 (_ BitVec 32)) SeekEntryResult!7641)

(assert (=> b!752952 (= res!508567 (= (seekEntryOrOpen!0 lt!334969 lt!334971 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334969 lt!334971 mask!3328)))))

(declare-fun b!752953 () Bool)

(declare-fun res!508558 () Bool)

(assert (=> b!752953 (=> (not res!508558) (not e!419981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41855 (_ BitVec 32)) Bool)

(assert (=> b!752953 (= res!508558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752954 () Bool)

(declare-fun e!419971 () Bool)

(assert (=> b!752954 (= e!419971 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20041 a!3186) j!159) a!3186 mask!3328) (Found!7641 j!159)))))

(declare-fun b!752955 () Bool)

(declare-fun e!419974 () Bool)

(declare-fun e!419973 () Bool)

(assert (=> b!752955 (= e!419974 (not e!419973))))

(declare-fun res!508553 () Bool)

(assert (=> b!752955 (=> res!508553 e!419973)))

(declare-fun lt!334963 () SeekEntryResult!7641)

(get-info :version)

(assert (=> b!752955 (= res!508553 (or (not ((_ is Intermediate!7641) lt!334963)) (bvslt x!1131 (x!63847 lt!334963)) (not (= x!1131 (x!63847 lt!334963))) (not (= index!1321 (index!32934 lt!334963)))))))

(assert (=> b!752955 e!419978))

(declare-fun res!508557 () Bool)

(assert (=> b!752955 (=> (not res!508557) (not e!419978))))

(assert (=> b!752955 (= res!508557 (= lt!334965 lt!334970))))

(assert (=> b!752955 (= lt!334970 (Found!7641 j!159))))

(assert (=> b!752955 (= lt!334965 (seekEntryOrOpen!0 (select (arr!20041 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752955 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25944 0))(
  ( (Unit!25945) )
))
(declare-fun lt!334972 () Unit!25944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25944)

(assert (=> b!752955 (= lt!334972 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752956 () Bool)

(declare-fun res!508561 () Bool)

(assert (=> b!752956 (=> (not res!508561) (not e!419975))))

(assert (=> b!752956 (= res!508561 e!419971)))

(declare-fun c!82575 () Bool)

(assert (=> b!752956 (= c!82575 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752957 () Bool)

(assert (=> b!752957 (= e!419972 e!419981)))

(declare-fun res!508570 () Bool)

(assert (=> b!752957 (=> (not res!508570) (not e!419981))))

(declare-fun lt!334964 () SeekEntryResult!7641)

(assert (=> b!752957 (= res!508570 (or (= lt!334964 (MissingZero!7641 i!1173)) (= lt!334964 (MissingVacant!7641 i!1173))))))

(assert (=> b!752957 (= lt!334964 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752958 () Bool)

(declare-fun e!419970 () Bool)

(assert (=> b!752958 (= e!419973 e!419970)))

(declare-fun res!508569 () Bool)

(assert (=> b!752958 (=> res!508569 e!419970)))

(assert (=> b!752958 (= res!508569 (not (= lt!334973 lt!334970)))))

(assert (=> b!752958 (= lt!334973 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20041 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752959 () Bool)

(assert (=> b!752959 (= e!419975 e!419974)))

(declare-fun res!508568 () Bool)

(assert (=> b!752959 (=> (not res!508568) (not e!419974))))

(declare-fun lt!334962 () SeekEntryResult!7641)

(assert (=> b!752959 (= res!508568 (= lt!334962 lt!334963))))

(assert (=> b!752959 (= lt!334963 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334969 lt!334971 mask!3328))))

(assert (=> b!752959 (= lt!334962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334969 mask!3328) lt!334969 lt!334971 mask!3328))))

(assert (=> b!752959 (= lt!334969 (select (store (arr!20041 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752959 (= lt!334971 (array!41856 (store (arr!20041 a!3186) i!1173 k0!2102) (size!20462 a!3186)))))

(declare-fun res!508565 () Bool)

(assert (=> start!65682 (=> (not res!508565) (not e!419972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65682 (= res!508565 (validMask!0 mask!3328))))

(assert (=> start!65682 e!419972))

(assert (=> start!65682 true))

(declare-fun array_inv!15837 (array!41855) Bool)

(assert (=> start!65682 (array_inv!15837 a!3186)))

(declare-fun b!752949 () Bool)

(declare-fun e!419977 () Bool)

(assert (=> b!752949 (= e!419977 true)))

(assert (=> b!752949 e!419976))

(declare-fun res!508566 () Bool)

(assert (=> b!752949 (=> (not res!508566) (not e!419976))))

(declare-fun lt!334966 () (_ BitVec 64))

(assert (=> b!752949 (= res!508566 (= lt!334966 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334967 () Unit!25944)

(declare-fun e!419979 () Unit!25944)

(assert (=> b!752949 (= lt!334967 e!419979)))

(declare-fun c!82576 () Bool)

(assert (=> b!752949 (= c!82576 (= lt!334966 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752960 () Bool)

(assert (=> b!752960 (= e!419970 e!419977)))

(declare-fun res!508559 () Bool)

(assert (=> b!752960 (=> res!508559 e!419977)))

(assert (=> b!752960 (= res!508559 (= lt!334966 lt!334969))))

(assert (=> b!752960 (= lt!334966 (select (store (arr!20041 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752961 () Bool)

(declare-fun res!508563 () Bool)

(assert (=> b!752961 (=> (not res!508563) (not e!419972))))

(assert (=> b!752961 (= res!508563 (and (= (size!20462 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20462 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20462 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752962 () Bool)

(declare-fun Unit!25946 () Unit!25944)

(assert (=> b!752962 (= e!419979 Unit!25946)))

(declare-fun b!752963 () Bool)

(declare-fun Unit!25947 () Unit!25944)

(assert (=> b!752963 (= e!419979 Unit!25947)))

(assert (=> b!752963 false))

(declare-fun b!752964 () Bool)

(assert (=> b!752964 (= e!419971 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20041 a!3186) j!159) a!3186 mask!3328) lt!334968))))

(assert (= (and start!65682 res!508565) b!752961))

(assert (= (and b!752961 res!508563) b!752944))

(assert (= (and b!752944 res!508571) b!752946))

(assert (= (and b!752946 res!508555) b!752945))

(assert (= (and b!752945 res!508556) b!752957))

(assert (= (and b!752957 res!508570) b!752953))

(assert (= (and b!752953 res!508558) b!752950))

(assert (= (and b!752950 res!508554) b!752947))

(assert (= (and b!752947 res!508564) b!752943))

(assert (= (and b!752943 res!508560) b!752942))

(assert (= (and b!752942 res!508562) b!752956))

(assert (= (and b!752956 c!82575) b!752964))

(assert (= (and b!752956 (not c!82575)) b!752954))

(assert (= (and b!752956 res!508561) b!752959))

(assert (= (and b!752959 res!508568) b!752955))

(assert (= (and b!752955 res!508557) b!752951))

(assert (= (and b!752955 (not res!508553)) b!752958))

(assert (= (and b!752958 (not res!508569)) b!752960))

(assert (= (and b!752960 (not res!508559)) b!752949))

(assert (= (and b!752949 c!82576) b!752963))

(assert (= (and b!752949 (not c!82576)) b!752962))

(assert (= (and b!752949 res!508566) b!752952))

(assert (= (and b!752952 res!508567) b!752948))

(declare-fun m!701759 () Bool)

(assert (=> b!752964 m!701759))

(assert (=> b!752964 m!701759))

(declare-fun m!701761 () Bool)

(assert (=> b!752964 m!701761))

(declare-fun m!701763 () Bool)

(assert (=> b!752957 m!701763))

(declare-fun m!701765 () Bool)

(assert (=> b!752942 m!701765))

(assert (=> b!752954 m!701759))

(assert (=> b!752954 m!701759))

(declare-fun m!701767 () Bool)

(assert (=> b!752954 m!701767))

(declare-fun m!701769 () Bool)

(assert (=> b!752950 m!701769))

(declare-fun m!701771 () Bool)

(assert (=> b!752945 m!701771))

(declare-fun m!701773 () Bool)

(assert (=> b!752959 m!701773))

(declare-fun m!701775 () Bool)

(assert (=> b!752959 m!701775))

(declare-fun m!701777 () Bool)

(assert (=> b!752959 m!701777))

(declare-fun m!701779 () Bool)

(assert (=> b!752959 m!701779))

(assert (=> b!752959 m!701775))

(declare-fun m!701781 () Bool)

(assert (=> b!752959 m!701781))

(declare-fun m!701783 () Bool)

(assert (=> b!752953 m!701783))

(declare-fun m!701785 () Bool)

(assert (=> b!752946 m!701785))

(declare-fun m!701787 () Bool)

(assert (=> start!65682 m!701787))

(declare-fun m!701789 () Bool)

(assert (=> start!65682 m!701789))

(assert (=> b!752944 m!701759))

(assert (=> b!752944 m!701759))

(declare-fun m!701791 () Bool)

(assert (=> b!752944 m!701791))

(assert (=> b!752960 m!701777))

(declare-fun m!701793 () Bool)

(assert (=> b!752960 m!701793))

(assert (=> b!752951 m!701759))

(assert (=> b!752951 m!701759))

(declare-fun m!701795 () Bool)

(assert (=> b!752951 m!701795))

(assert (=> b!752955 m!701759))

(assert (=> b!752955 m!701759))

(declare-fun m!701797 () Bool)

(assert (=> b!752955 m!701797))

(declare-fun m!701799 () Bool)

(assert (=> b!752955 m!701799))

(declare-fun m!701801 () Bool)

(assert (=> b!752955 m!701801))

(assert (=> b!752958 m!701759))

(assert (=> b!752958 m!701759))

(assert (=> b!752958 m!701767))

(assert (=> b!752943 m!701759))

(assert (=> b!752943 m!701759))

(declare-fun m!701803 () Bool)

(assert (=> b!752943 m!701803))

(assert (=> b!752943 m!701803))

(assert (=> b!752943 m!701759))

(declare-fun m!701805 () Bool)

(assert (=> b!752943 m!701805))

(declare-fun m!701807 () Bool)

(assert (=> b!752952 m!701807))

(declare-fun m!701809 () Bool)

(assert (=> b!752952 m!701809))

(check-sat (not b!752952) (not b!752955) (not b!752944) (not b!752954) (not b!752953) (not b!752959) (not b!752958) (not b!752957) (not b!752946) (not b!752943) (not start!65682) (not b!752951) (not b!752945) (not b!752964) (not b!752950))
(check-sat)
