; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65810 () Bool)

(assert start!65810)

(declare-datatypes ((array!42000 0))(
  ( (array!42001 (arr!20114 (Array (_ BitVec 32) (_ BitVec 64))) (size!20535 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42000)

(declare-datatypes ((SeekEntryResult!7711 0))(
  ( (MissingZero!7711 (index!33212 (_ BitVec 32))) (Found!7711 (index!33213 (_ BitVec 32))) (Intermediate!7711 (undefined!8523 Bool) (index!33214 (_ BitVec 32)) (x!64112 (_ BitVec 32))) (Undefined!7711) (MissingVacant!7711 (index!33215 (_ BitVec 32))) )
))
(declare-fun lt!337391 () SeekEntryResult!7711)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!757798 () Bool)

(declare-fun e!422482 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42000 (_ BitVec 32)) SeekEntryResult!7711)

(assert (=> b!757798 (= e!422482 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20114 a!3186) j!159) a!3186 mask!3328) lt!337391))))

(declare-fun b!757799 () Bool)

(declare-fun e!422488 () Bool)

(declare-fun e!422481 () Bool)

(assert (=> b!757799 (= e!422488 e!422481)))

(declare-fun res!512675 () Bool)

(assert (=> b!757799 (=> (not res!512675) (not e!422481))))

(declare-fun lt!337393 () SeekEntryResult!7711)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757799 (= res!512675 (or (= lt!337393 (MissingZero!7711 i!1173)) (= lt!337393 (MissingVacant!7711 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42000 (_ BitVec 32)) SeekEntryResult!7711)

(assert (=> b!757799 (= lt!337393 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757800 () Bool)

(declare-fun res!512678 () Bool)

(assert (=> b!757800 (=> (not res!512678) (not e!422488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757800 (= res!512678 (validKeyInArray!0 (select (arr!20114 a!3186) j!159)))))

(declare-fun b!757801 () Bool)

(declare-fun res!512666 () Bool)

(declare-fun e!422480 () Bool)

(assert (=> b!757801 (=> (not res!512666) (not e!422480))))

(assert (=> b!757801 (= res!512666 e!422482)))

(declare-fun c!82949 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757801 (= c!82949 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757802 () Bool)

(assert (=> b!757802 (= e!422481 e!422480)))

(declare-fun res!512669 () Bool)

(assert (=> b!757802 (=> (not res!512669) (not e!422480))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757802 (= res!512669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20114 a!3186) j!159) mask!3328) (select (arr!20114 a!3186) j!159) a!3186 mask!3328) lt!337391))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!757802 (= lt!337391 (Intermediate!7711 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757803 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42000 (_ BitVec 32)) SeekEntryResult!7711)

(assert (=> b!757803 (= e!422482 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20114 a!3186) j!159) a!3186 mask!3328) (Found!7711 j!159)))))

(declare-fun b!757804 () Bool)

(declare-fun res!512679 () Bool)

(assert (=> b!757804 (=> (not res!512679) (not e!422481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42000 (_ BitVec 32)) Bool)

(assert (=> b!757804 (= res!512679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757805 () Bool)

(declare-fun res!512661 () Bool)

(assert (=> b!757805 (=> (not res!512661) (not e!422488))))

(declare-fun arrayContainsKey!0 (array!42000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757805 (= res!512661 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757806 () Bool)

(declare-fun e!422490 () Bool)

(assert (=> b!757806 (= e!422480 e!422490)))

(declare-fun res!512663 () Bool)

(assert (=> b!757806 (=> (not res!512663) (not e!422490))))

(declare-fun lt!337387 () SeekEntryResult!7711)

(declare-fun lt!337390 () SeekEntryResult!7711)

(assert (=> b!757806 (= res!512663 (= lt!337387 lt!337390))))

(declare-fun lt!337396 () (_ BitVec 64))

(declare-fun lt!337388 () array!42000)

(assert (=> b!757806 (= lt!337390 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337396 lt!337388 mask!3328))))

(assert (=> b!757806 (= lt!337387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337396 mask!3328) lt!337396 lt!337388 mask!3328))))

(assert (=> b!757806 (= lt!337396 (select (store (arr!20114 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757806 (= lt!337388 (array!42001 (store (arr!20114 a!3186) i!1173 k0!2102) (size!20535 a!3186)))))

(declare-fun e!422487 () Bool)

(declare-fun lt!337395 () SeekEntryResult!7711)

(declare-fun b!757807 () Bool)

(assert (=> b!757807 (= e!422487 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20114 a!3186) j!159) a!3186 mask!3328) lt!337395))))

(declare-fun b!757808 () Bool)

(declare-fun res!512674 () Bool)

(assert (=> b!757808 (=> (not res!512674) (not e!422481))))

(declare-datatypes ((List!14155 0))(
  ( (Nil!14152) (Cons!14151 (h!15223 (_ BitVec 64)) (t!20461 List!14155)) )
))
(declare-fun arrayNoDuplicates!0 (array!42000 (_ BitVec 32) List!14155) Bool)

(assert (=> b!757808 (= res!512674 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14152))))

(declare-fun b!757809 () Bool)

(declare-fun e!422484 () Bool)

(declare-fun e!422486 () Bool)

(assert (=> b!757809 (= e!422484 e!422486)))

(declare-fun res!512665 () Bool)

(assert (=> b!757809 (=> res!512665 e!422486)))

(declare-fun lt!337392 () (_ BitVec 64))

(assert (=> b!757809 (= res!512665 (= lt!337392 lt!337396))))

(assert (=> b!757809 (= lt!337392 (select (store (arr!20114 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757810 () Bool)

(declare-datatypes ((Unit!26204 0))(
  ( (Unit!26205) )
))
(declare-fun e!422491 () Unit!26204)

(declare-fun Unit!26206 () Unit!26204)

(assert (=> b!757810 (= e!422491 Unit!26206)))

(declare-fun b!757811 () Bool)

(declare-fun e!422483 () Bool)

(assert (=> b!757811 (= e!422490 (not e!422483))))

(declare-fun res!512673 () Bool)

(assert (=> b!757811 (=> res!512673 e!422483)))

(get-info :version)

(assert (=> b!757811 (= res!512673 (or (not ((_ is Intermediate!7711) lt!337390)) (bvslt x!1131 (x!64112 lt!337390)) (not (= x!1131 (x!64112 lt!337390))) (not (= index!1321 (index!33214 lt!337390)))))))

(assert (=> b!757811 e!422487))

(declare-fun res!512670 () Bool)

(assert (=> b!757811 (=> (not res!512670) (not e!422487))))

(declare-fun lt!337386 () SeekEntryResult!7711)

(assert (=> b!757811 (= res!512670 (= lt!337386 lt!337395))))

(assert (=> b!757811 (= lt!337395 (Found!7711 j!159))))

(assert (=> b!757811 (= lt!337386 (seekEntryOrOpen!0 (select (arr!20114 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757811 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337397 () Unit!26204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26204)

(assert (=> b!757811 (= lt!337397 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757812 () Bool)

(declare-fun Unit!26207 () Unit!26204)

(assert (=> b!757812 (= e!422491 Unit!26207)))

(assert (=> b!757812 false))

(declare-fun res!512664 () Bool)

(assert (=> start!65810 (=> (not res!512664) (not e!422488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65810 (= res!512664 (validMask!0 mask!3328))))

(assert (=> start!65810 e!422488))

(assert (=> start!65810 true))

(declare-fun array_inv!15997 (array!42000) Bool)

(assert (=> start!65810 (array_inv!15997 a!3186)))

(declare-fun b!757813 () Bool)

(declare-fun res!512662 () Bool)

(declare-fun e!422485 () Bool)

(assert (=> b!757813 (=> (not res!512662) (not e!422485))))

(assert (=> b!757813 (= res!512662 (= (seekEntryOrOpen!0 lt!337396 lt!337388 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337396 lt!337388 mask!3328)))))

(declare-fun b!757814 () Bool)

(declare-fun res!512672 () Bool)

(assert (=> b!757814 (=> (not res!512672) (not e!422488))))

(assert (=> b!757814 (= res!512672 (and (= (size!20535 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20535 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20535 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757815 () Bool)

(assert (=> b!757815 (= e!422483 e!422484)))

(declare-fun res!512676 () Bool)

(assert (=> b!757815 (=> res!512676 e!422484)))

(declare-fun lt!337394 () SeekEntryResult!7711)

(assert (=> b!757815 (= res!512676 (not (= lt!337394 lt!337395)))))

(assert (=> b!757815 (= lt!337394 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20114 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757816 () Bool)

(assert (=> b!757816 (= e!422486 true)))

(assert (=> b!757816 e!422485))

(declare-fun res!512671 () Bool)

(assert (=> b!757816 (=> (not res!512671) (not e!422485))))

(assert (=> b!757816 (= res!512671 (= lt!337392 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337389 () Unit!26204)

(assert (=> b!757816 (= lt!337389 e!422491)))

(declare-fun c!82950 () Bool)

(assert (=> b!757816 (= c!82950 (= lt!337392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757817 () Bool)

(declare-fun res!512668 () Bool)

(assert (=> b!757817 (=> (not res!512668) (not e!422488))))

(assert (=> b!757817 (= res!512668 (validKeyInArray!0 k0!2102))))

(declare-fun b!757818 () Bool)

(declare-fun res!512677 () Bool)

(assert (=> b!757818 (=> (not res!512677) (not e!422481))))

(assert (=> b!757818 (= res!512677 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20535 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20535 a!3186))))))

(declare-fun b!757819 () Bool)

(declare-fun res!512667 () Bool)

(assert (=> b!757819 (=> (not res!512667) (not e!422480))))

(assert (=> b!757819 (= res!512667 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20114 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757820 () Bool)

(assert (=> b!757820 (= e!422485 (= lt!337386 lt!337394))))

(assert (= (and start!65810 res!512664) b!757814))

(assert (= (and b!757814 res!512672) b!757800))

(assert (= (and b!757800 res!512678) b!757817))

(assert (= (and b!757817 res!512668) b!757805))

(assert (= (and b!757805 res!512661) b!757799))

(assert (= (and b!757799 res!512675) b!757804))

(assert (= (and b!757804 res!512679) b!757808))

(assert (= (and b!757808 res!512674) b!757818))

(assert (= (and b!757818 res!512677) b!757802))

(assert (= (and b!757802 res!512669) b!757819))

(assert (= (and b!757819 res!512667) b!757801))

(assert (= (and b!757801 c!82949) b!757798))

(assert (= (and b!757801 (not c!82949)) b!757803))

(assert (= (and b!757801 res!512666) b!757806))

(assert (= (and b!757806 res!512663) b!757811))

(assert (= (and b!757811 res!512670) b!757807))

(assert (= (and b!757811 (not res!512673)) b!757815))

(assert (= (and b!757815 (not res!512676)) b!757809))

(assert (= (and b!757809 (not res!512665)) b!757816))

(assert (= (and b!757816 c!82950) b!757812))

(assert (= (and b!757816 (not c!82950)) b!757810))

(assert (= (and b!757816 res!512671) b!757813))

(assert (= (and b!757813 res!512662) b!757820))

(declare-fun m!704849 () Bool)

(assert (=> b!757817 m!704849))

(declare-fun m!704851 () Bool)

(assert (=> b!757811 m!704851))

(assert (=> b!757811 m!704851))

(declare-fun m!704853 () Bool)

(assert (=> b!757811 m!704853))

(declare-fun m!704855 () Bool)

(assert (=> b!757811 m!704855))

(declare-fun m!704857 () Bool)

(assert (=> b!757811 m!704857))

(declare-fun m!704859 () Bool)

(assert (=> b!757804 m!704859))

(assert (=> b!757815 m!704851))

(assert (=> b!757815 m!704851))

(declare-fun m!704861 () Bool)

(assert (=> b!757815 m!704861))

(declare-fun m!704863 () Bool)

(assert (=> b!757808 m!704863))

(declare-fun m!704865 () Bool)

(assert (=> b!757805 m!704865))

(assert (=> b!757802 m!704851))

(assert (=> b!757802 m!704851))

(declare-fun m!704867 () Bool)

(assert (=> b!757802 m!704867))

(assert (=> b!757802 m!704867))

(assert (=> b!757802 m!704851))

(declare-fun m!704869 () Bool)

(assert (=> b!757802 m!704869))

(assert (=> b!757807 m!704851))

(assert (=> b!757807 m!704851))

(declare-fun m!704871 () Bool)

(assert (=> b!757807 m!704871))

(declare-fun m!704873 () Bool)

(assert (=> start!65810 m!704873))

(declare-fun m!704875 () Bool)

(assert (=> start!65810 m!704875))

(declare-fun m!704877 () Bool)

(assert (=> b!757819 m!704877))

(declare-fun m!704879 () Bool)

(assert (=> b!757806 m!704879))

(declare-fun m!704881 () Bool)

(assert (=> b!757806 m!704881))

(declare-fun m!704883 () Bool)

(assert (=> b!757806 m!704883))

(declare-fun m!704885 () Bool)

(assert (=> b!757806 m!704885))

(assert (=> b!757806 m!704883))

(declare-fun m!704887 () Bool)

(assert (=> b!757806 m!704887))

(declare-fun m!704889 () Bool)

(assert (=> b!757813 m!704889))

(declare-fun m!704891 () Bool)

(assert (=> b!757813 m!704891))

(declare-fun m!704893 () Bool)

(assert (=> b!757799 m!704893))

(assert (=> b!757803 m!704851))

(assert (=> b!757803 m!704851))

(assert (=> b!757803 m!704861))

(assert (=> b!757809 m!704879))

(declare-fun m!704895 () Bool)

(assert (=> b!757809 m!704895))

(assert (=> b!757800 m!704851))

(assert (=> b!757800 m!704851))

(declare-fun m!704897 () Bool)

(assert (=> b!757800 m!704897))

(assert (=> b!757798 m!704851))

(assert (=> b!757798 m!704851))

(declare-fun m!704899 () Bool)

(assert (=> b!757798 m!704899))

(check-sat (not b!757807) (not b!757815) (not b!757800) (not b!757817) (not b!757799) (not b!757805) (not b!757802) (not b!757813) (not b!757806) (not b!757798) (not b!757808) (not b!757811) (not b!757804) (not start!65810) (not b!757803))
(check-sat)
