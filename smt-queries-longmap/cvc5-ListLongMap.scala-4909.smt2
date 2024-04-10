; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67698 () Bool)

(assert start!67698)

(declare-datatypes ((SeekEntryResult!8057 0))(
  ( (MissingZero!8057 (index!34596 (_ BitVec 32))) (Found!8057 (index!34597 (_ BitVec 32))) (Intermediate!8057 (undefined!8869 Bool) (index!34598 (_ BitVec 32)) (x!65549 (_ BitVec 32))) (Undefined!8057) (MissingVacant!8057 (index!34599 (_ BitVec 32))) )
))
(declare-fun lt!349876 () SeekEntryResult!8057)

(declare-datatypes ((array!42738 0))(
  ( (array!42739 (arr!20457 (Array (_ BitVec 32) (_ BitVec 64))) (size!20878 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42738)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!436326 () Bool)

(declare-fun b!784793 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42738 (_ BitVec 32)) SeekEntryResult!8057)

(assert (=> b!784793 (= e!436326 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20457 a!3186) j!159) a!3186 mask!3328) lt!349876))))

(declare-fun b!784794 () Bool)

(declare-fun res!531135 () Bool)

(declare-fun e!436320 () Bool)

(assert (=> b!784794 (=> (not res!531135) (not e!436320))))

(declare-datatypes ((List!14459 0))(
  ( (Nil!14456) (Cons!14455 (h!15578 (_ BitVec 64)) (t!20774 List!14459)) )
))
(declare-fun arrayNoDuplicates!0 (array!42738 (_ BitVec 32) List!14459) Bool)

(assert (=> b!784794 (= res!531135 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14456))))

(declare-fun b!784795 () Bool)

(declare-fun e!436319 () Bool)

(declare-fun e!436328 () Bool)

(assert (=> b!784795 (= e!436319 e!436328)))

(declare-fun res!531144 () Bool)

(assert (=> b!784795 (=> (not res!531144) (not e!436328))))

(declare-fun lt!349874 () SeekEntryResult!8057)

(declare-fun lt!349872 () SeekEntryResult!8057)

(assert (=> b!784795 (= res!531144 (= lt!349874 lt!349872))))

(declare-fun lt!349878 () (_ BitVec 64))

(declare-fun lt!349869 () array!42738)

(assert (=> b!784795 (= lt!349872 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349878 lt!349869 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784795 (= lt!349874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349878 mask!3328) lt!349878 lt!349869 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!784795 (= lt!349878 (select (store (arr!20457 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!784795 (= lt!349869 (array!42739 (store (arr!20457 a!3186) i!1173 k!2102) (size!20878 a!3186)))))

(declare-fun b!784796 () Bool)

(declare-fun res!531136 () Bool)

(assert (=> b!784796 (=> (not res!531136) (not e!436320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42738 (_ BitVec 32)) Bool)

(assert (=> b!784796 (= res!531136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784797 () Bool)

(declare-fun res!531145 () Bool)

(assert (=> b!784797 (=> (not res!531145) (not e!436319))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!784797 (= res!531145 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20457 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784798 () Bool)

(assert (=> b!784798 (= e!436320 e!436319)))

(declare-fun res!531137 () Bool)

(assert (=> b!784798 (=> (not res!531137) (not e!436319))))

(assert (=> b!784798 (= res!531137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20457 a!3186) j!159) mask!3328) (select (arr!20457 a!3186) j!159) a!3186 mask!3328) lt!349876))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784798 (= lt!349876 (Intermediate!8057 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784799 () Bool)

(declare-fun res!531133 () Bool)

(declare-fun e!436322 () Bool)

(assert (=> b!784799 (=> (not res!531133) (not e!436322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784799 (= res!531133 (validKeyInArray!0 (select (arr!20457 a!3186) j!159)))))

(declare-fun b!784800 () Bool)

(declare-fun res!531141 () Bool)

(assert (=> b!784800 (=> (not res!531141) (not e!436322))))

(assert (=> b!784800 (= res!531141 (and (= (size!20878 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20878 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20878 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!349880 () SeekEntryResult!8057)

(declare-fun e!436317 () Bool)

(declare-fun b!784801 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42738 (_ BitVec 32)) SeekEntryResult!8057)

(assert (=> b!784801 (= e!436317 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20457 a!3186) j!159) a!3186 mask!3328) lt!349880))))

(declare-fun b!784802 () Bool)

(declare-datatypes ((Unit!27116 0))(
  ( (Unit!27117) )
))
(declare-fun e!436323 () Unit!27116)

(declare-fun Unit!27118 () Unit!27116)

(assert (=> b!784802 (= e!436323 Unit!27118)))

(assert (=> b!784802 false))

(declare-fun b!784803 () Bool)

(declare-fun res!531142 () Bool)

(declare-fun e!436318 () Bool)

(assert (=> b!784803 (=> (not res!531142) (not e!436318))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42738 (_ BitVec 32)) SeekEntryResult!8057)

(assert (=> b!784803 (= res!531142 (= (seekEntryOrOpen!0 lt!349878 lt!349869 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349878 lt!349869 mask!3328)))))

(declare-fun b!784804 () Bool)

(declare-fun e!436325 () Bool)

(declare-fun e!436327 () Bool)

(assert (=> b!784804 (= e!436325 e!436327)))

(declare-fun res!531128 () Bool)

(assert (=> b!784804 (=> res!531128 e!436327)))

(declare-fun lt!349873 () (_ BitVec 64))

(assert (=> b!784804 (= res!531128 (= lt!349873 lt!349878))))

(assert (=> b!784804 (= lt!349873 (select (store (arr!20457 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!784805 () Bool)

(declare-fun Unit!27119 () Unit!27116)

(assert (=> b!784805 (= e!436323 Unit!27119)))

(declare-fun b!784806 () Bool)

(declare-fun res!531146 () Bool)

(assert (=> b!784806 (=> (not res!531146) (not e!436322))))

(declare-fun arrayContainsKey!0 (array!42738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784806 (= res!531146 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784807 () Bool)

(declare-fun res!531131 () Bool)

(assert (=> b!784807 (=> (not res!531131) (not e!436319))))

(assert (=> b!784807 (= res!531131 e!436326)))

(declare-fun c!87241 () Bool)

(assert (=> b!784807 (= c!87241 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!531134 () Bool)

(assert (=> start!67698 (=> (not res!531134) (not e!436322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67698 (= res!531134 (validMask!0 mask!3328))))

(assert (=> start!67698 e!436322))

(assert (=> start!67698 true))

(declare-fun array_inv!16253 (array!42738) Bool)

(assert (=> start!67698 (array_inv!16253 a!3186)))

(declare-fun b!784808 () Bool)

(declare-fun lt!349879 () SeekEntryResult!8057)

(declare-fun lt!349877 () SeekEntryResult!8057)

(assert (=> b!784808 (= e!436318 (= lt!349879 lt!349877))))

(declare-fun b!784809 () Bool)

(assert (=> b!784809 (= e!436322 e!436320)))

(declare-fun res!531132 () Bool)

(assert (=> b!784809 (=> (not res!531132) (not e!436320))))

(declare-fun lt!349870 () SeekEntryResult!8057)

(assert (=> b!784809 (= res!531132 (or (= lt!349870 (MissingZero!8057 i!1173)) (= lt!349870 (MissingVacant!8057 i!1173))))))

(assert (=> b!784809 (= lt!349870 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!784810 () Bool)

(declare-fun e!436324 () Bool)

(assert (=> b!784810 (= e!436328 (not e!436324))))

(declare-fun res!531130 () Bool)

(assert (=> b!784810 (=> res!531130 e!436324)))

(assert (=> b!784810 (= res!531130 (or (not (is-Intermediate!8057 lt!349872)) (bvslt x!1131 (x!65549 lt!349872)) (not (= x!1131 (x!65549 lt!349872))) (not (= index!1321 (index!34598 lt!349872)))))))

(assert (=> b!784810 e!436317))

(declare-fun res!531138 () Bool)

(assert (=> b!784810 (=> (not res!531138) (not e!436317))))

(assert (=> b!784810 (= res!531138 (= lt!349879 lt!349880))))

(assert (=> b!784810 (= lt!349880 (Found!8057 j!159))))

(assert (=> b!784810 (= lt!349879 (seekEntryOrOpen!0 (select (arr!20457 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784810 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349875 () Unit!27116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27116)

(assert (=> b!784810 (= lt!349875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784811 () Bool)

(assert (=> b!784811 (= e!436326 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20457 a!3186) j!159) a!3186 mask!3328) (Found!8057 j!159)))))

(declare-fun b!784812 () Bool)

(declare-fun res!531143 () Bool)

(assert (=> b!784812 (=> (not res!531143) (not e!436320))))

(assert (=> b!784812 (= res!531143 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20878 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20878 a!3186))))))

(declare-fun b!784813 () Bool)

(declare-fun res!531139 () Bool)

(assert (=> b!784813 (=> (not res!531139) (not e!436322))))

(assert (=> b!784813 (= res!531139 (validKeyInArray!0 k!2102))))

(declare-fun b!784814 () Bool)

(assert (=> b!784814 (= e!436327 true)))

(assert (=> b!784814 e!436318))

(declare-fun res!531140 () Bool)

(assert (=> b!784814 (=> (not res!531140) (not e!436318))))

(assert (=> b!784814 (= res!531140 (= lt!349873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349871 () Unit!27116)

(assert (=> b!784814 (= lt!349871 e!436323)))

(declare-fun c!87240 () Bool)

(assert (=> b!784814 (= c!87240 (= lt!349873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784815 () Bool)

(assert (=> b!784815 (= e!436324 e!436325)))

(declare-fun res!531129 () Bool)

(assert (=> b!784815 (=> res!531129 e!436325)))

(assert (=> b!784815 (= res!531129 (not (= lt!349877 lt!349880)))))

(assert (=> b!784815 (= lt!349877 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20457 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67698 res!531134) b!784800))

(assert (= (and b!784800 res!531141) b!784799))

(assert (= (and b!784799 res!531133) b!784813))

(assert (= (and b!784813 res!531139) b!784806))

(assert (= (and b!784806 res!531146) b!784809))

(assert (= (and b!784809 res!531132) b!784796))

(assert (= (and b!784796 res!531136) b!784794))

(assert (= (and b!784794 res!531135) b!784812))

(assert (= (and b!784812 res!531143) b!784798))

(assert (= (and b!784798 res!531137) b!784797))

(assert (= (and b!784797 res!531145) b!784807))

(assert (= (and b!784807 c!87241) b!784793))

(assert (= (and b!784807 (not c!87241)) b!784811))

(assert (= (and b!784807 res!531131) b!784795))

(assert (= (and b!784795 res!531144) b!784810))

(assert (= (and b!784810 res!531138) b!784801))

(assert (= (and b!784810 (not res!531130)) b!784815))

(assert (= (and b!784815 (not res!531129)) b!784804))

(assert (= (and b!784804 (not res!531128)) b!784814))

(assert (= (and b!784814 c!87240) b!784802))

(assert (= (and b!784814 (not c!87240)) b!784805))

(assert (= (and b!784814 res!531140) b!784803))

(assert (= (and b!784803 res!531142) b!784808))

(declare-fun m!727025 () Bool)

(assert (=> start!67698 m!727025))

(declare-fun m!727027 () Bool)

(assert (=> start!67698 m!727027))

(declare-fun m!727029 () Bool)

(assert (=> b!784804 m!727029))

(declare-fun m!727031 () Bool)

(assert (=> b!784804 m!727031))

(declare-fun m!727033 () Bool)

(assert (=> b!784797 m!727033))

(declare-fun m!727035 () Bool)

(assert (=> b!784796 m!727035))

(declare-fun m!727037 () Bool)

(assert (=> b!784813 m!727037))

(declare-fun m!727039 () Bool)

(assert (=> b!784799 m!727039))

(assert (=> b!784799 m!727039))

(declare-fun m!727041 () Bool)

(assert (=> b!784799 m!727041))

(assert (=> b!784793 m!727039))

(assert (=> b!784793 m!727039))

(declare-fun m!727043 () Bool)

(assert (=> b!784793 m!727043))

(declare-fun m!727045 () Bool)

(assert (=> b!784809 m!727045))

(assert (=> b!784810 m!727039))

(assert (=> b!784810 m!727039))

(declare-fun m!727047 () Bool)

(assert (=> b!784810 m!727047))

(declare-fun m!727049 () Bool)

(assert (=> b!784810 m!727049))

(declare-fun m!727051 () Bool)

(assert (=> b!784810 m!727051))

(declare-fun m!727053 () Bool)

(assert (=> b!784794 m!727053))

(declare-fun m!727055 () Bool)

(assert (=> b!784806 m!727055))

(declare-fun m!727057 () Bool)

(assert (=> b!784795 m!727057))

(assert (=> b!784795 m!727029))

(declare-fun m!727059 () Bool)

(assert (=> b!784795 m!727059))

(declare-fun m!727061 () Bool)

(assert (=> b!784795 m!727061))

(assert (=> b!784795 m!727057))

(declare-fun m!727063 () Bool)

(assert (=> b!784795 m!727063))

(declare-fun m!727065 () Bool)

(assert (=> b!784803 m!727065))

(declare-fun m!727067 () Bool)

(assert (=> b!784803 m!727067))

(assert (=> b!784811 m!727039))

(assert (=> b!784811 m!727039))

(declare-fun m!727069 () Bool)

(assert (=> b!784811 m!727069))

(assert (=> b!784801 m!727039))

(assert (=> b!784801 m!727039))

(declare-fun m!727071 () Bool)

(assert (=> b!784801 m!727071))

(assert (=> b!784798 m!727039))

(assert (=> b!784798 m!727039))

(declare-fun m!727073 () Bool)

(assert (=> b!784798 m!727073))

(assert (=> b!784798 m!727073))

(assert (=> b!784798 m!727039))

(declare-fun m!727075 () Bool)

(assert (=> b!784798 m!727075))

(assert (=> b!784815 m!727039))

(assert (=> b!784815 m!727039))

(assert (=> b!784815 m!727069))

(push 1)

