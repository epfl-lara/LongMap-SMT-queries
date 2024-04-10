; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65794 () Bool)

(assert start!65794)

(declare-fun b!756806 () Bool)

(declare-fun res!511757 () Bool)

(declare-fun e!421997 () Bool)

(assert (=> b!756806 (=> (not res!511757) (not e!421997))))

(declare-fun e!421995 () Bool)

(assert (=> b!756806 (= res!511757 e!421995)))

(declare-fun c!82911 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756806 (= c!82911 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!511753 () Bool)

(declare-fun e!421992 () Bool)

(assert (=> start!65794 (=> (not res!511753) (not e!421992))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65794 (= res!511753 (validMask!0 mask!3328))))

(assert (=> start!65794 e!421992))

(assert (=> start!65794 true))

(declare-datatypes ((array!41967 0))(
  ( (array!41968 (arr!20097 (Array (_ BitVec 32) (_ BitVec 64))) (size!20518 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41967)

(declare-fun array_inv!15893 (array!41967) Bool)

(assert (=> start!65794 (array_inv!15893 a!3186)))

(declare-fun b!756807 () Bool)

(declare-fun res!511761 () Bool)

(declare-fun e!421988 () Bool)

(assert (=> b!756807 (=> (not res!511761) (not e!421988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41967 (_ BitVec 32)) Bool)

(assert (=> b!756807 (= res!511761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756808 () Bool)

(assert (=> b!756808 (= e!421988 e!421997)))

(declare-fun res!511749 () Bool)

(assert (=> b!756808 (=> (not res!511749) (not e!421997))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7697 0))(
  ( (MissingZero!7697 (index!33156 (_ BitVec 32))) (Found!7697 (index!33157 (_ BitVec 32))) (Intermediate!7697 (undefined!8509 Bool) (index!33158 (_ BitVec 32)) (x!64055 (_ BitVec 32))) (Undefined!7697) (MissingVacant!7697 (index!33159 (_ BitVec 32))) )
))
(declare-fun lt!336987 () SeekEntryResult!7697)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41967 (_ BitVec 32)) SeekEntryResult!7697)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756808 (= res!511749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20097 a!3186) j!159) mask!3328) (select (arr!20097 a!3186) j!159) a!3186 mask!3328) lt!336987))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!756808 (= lt!336987 (Intermediate!7697 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756809 () Bool)

(declare-fun res!511759 () Bool)

(assert (=> b!756809 (=> (not res!511759) (not e!421992))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756809 (= res!511759 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!756810 () Bool)

(assert (=> b!756810 (= e!421995 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20097 a!3186) j!159) a!3186 mask!3328) lt!336987))))

(declare-fun b!756811 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41967 (_ BitVec 32)) SeekEntryResult!7697)

(assert (=> b!756811 (= e!421995 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20097 a!3186) j!159) a!3186 mask!3328) (Found!7697 j!159)))))

(declare-fun b!756812 () Bool)

(declare-datatypes ((Unit!26168 0))(
  ( (Unit!26169) )
))
(declare-fun e!421986 () Unit!26168)

(declare-fun Unit!26170 () Unit!26168)

(assert (=> b!756812 (= e!421986 Unit!26170)))

(declare-fun b!756813 () Bool)

(declare-fun Unit!26171 () Unit!26168)

(assert (=> b!756813 (= e!421986 Unit!26171)))

(assert (=> b!756813 false))

(declare-fun b!756814 () Bool)

(declare-fun res!511755 () Bool)

(assert (=> b!756814 (=> (not res!511755) (not e!421992))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756814 (= res!511755 (and (= (size!20518 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20518 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20518 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756815 () Bool)

(declare-fun e!421994 () Bool)

(declare-fun lt!336989 () SeekEntryResult!7697)

(declare-fun lt!336982 () SeekEntryResult!7697)

(assert (=> b!756815 (= e!421994 (= lt!336989 lt!336982))))

(declare-fun b!756816 () Bool)

(declare-fun res!511760 () Bool)

(assert (=> b!756816 (=> (not res!511760) (not e!421992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756816 (= res!511760 (validKeyInArray!0 (select (arr!20097 a!3186) j!159)))))

(declare-fun b!756817 () Bool)

(declare-fun res!511752 () Bool)

(assert (=> b!756817 (=> (not res!511752) (not e!421988))))

(declare-datatypes ((List!14099 0))(
  ( (Nil!14096) (Cons!14095 (h!15167 (_ BitVec 64)) (t!20414 List!14099)) )
))
(declare-fun arrayNoDuplicates!0 (array!41967 (_ BitVec 32) List!14099) Bool)

(assert (=> b!756817 (= res!511752 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14096))))

(declare-fun b!756818 () Bool)

(assert (=> b!756818 (= e!421992 e!421988)))

(declare-fun res!511746 () Bool)

(assert (=> b!756818 (=> (not res!511746) (not e!421988))))

(declare-fun lt!336985 () SeekEntryResult!7697)

(assert (=> b!756818 (= res!511746 (or (= lt!336985 (MissingZero!7697 i!1173)) (= lt!336985 (MissingVacant!7697 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41967 (_ BitVec 32)) SeekEntryResult!7697)

(assert (=> b!756818 (= lt!336985 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!756819 () Bool)

(declare-fun lt!336979 () SeekEntryResult!7697)

(declare-fun e!421987 () Bool)

(assert (=> b!756819 (= e!421987 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20097 a!3186) j!159) a!3186 mask!3328) lt!336979))))

(declare-fun b!756820 () Bool)

(declare-fun res!511758 () Bool)

(assert (=> b!756820 (=> (not res!511758) (not e!421997))))

(assert (=> b!756820 (= res!511758 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20097 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756821 () Bool)

(declare-fun e!421989 () Bool)

(declare-fun e!421993 () Bool)

(assert (=> b!756821 (= e!421989 e!421993)))

(declare-fun res!511745 () Bool)

(assert (=> b!756821 (=> res!511745 e!421993)))

(assert (=> b!756821 (= res!511745 (not (= lt!336982 lt!336979)))))

(assert (=> b!756821 (= lt!336982 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20097 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756822 () Bool)

(declare-fun e!421991 () Bool)

(assert (=> b!756822 (= e!421997 e!421991)))

(declare-fun res!511754 () Bool)

(assert (=> b!756822 (=> (not res!511754) (not e!421991))))

(declare-fun lt!336984 () SeekEntryResult!7697)

(declare-fun lt!336986 () SeekEntryResult!7697)

(assert (=> b!756822 (= res!511754 (= lt!336984 lt!336986))))

(declare-fun lt!336981 () (_ BitVec 64))

(declare-fun lt!336980 () array!41967)

(assert (=> b!756822 (= lt!336986 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336981 lt!336980 mask!3328))))

(assert (=> b!756822 (= lt!336984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336981 mask!3328) lt!336981 lt!336980 mask!3328))))

(assert (=> b!756822 (= lt!336981 (select (store (arr!20097 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!756822 (= lt!336980 (array!41968 (store (arr!20097 a!3186) i!1173 k!2102) (size!20518 a!3186)))))

(declare-fun b!756823 () Bool)

(declare-fun res!511756 () Bool)

(assert (=> b!756823 (=> (not res!511756) (not e!421994))))

(assert (=> b!756823 (= res!511756 (= (seekEntryOrOpen!0 lt!336981 lt!336980 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336981 lt!336980 mask!3328)))))

(declare-fun b!756824 () Bool)

(declare-fun res!511750 () Bool)

(assert (=> b!756824 (=> (not res!511750) (not e!421988))))

(assert (=> b!756824 (= res!511750 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20518 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20518 a!3186))))))

(declare-fun b!756825 () Bool)

(declare-fun res!511763 () Bool)

(assert (=> b!756825 (=> (not res!511763) (not e!421992))))

(assert (=> b!756825 (= res!511763 (validKeyInArray!0 k!2102))))

(declare-fun b!756826 () Bool)

(declare-fun e!421996 () Bool)

(assert (=> b!756826 (= e!421996 true)))

(assert (=> b!756826 e!421994))

(declare-fun res!511748 () Bool)

(assert (=> b!756826 (=> (not res!511748) (not e!421994))))

(declare-fun lt!336988 () (_ BitVec 64))

(assert (=> b!756826 (= res!511748 (= lt!336988 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336978 () Unit!26168)

(assert (=> b!756826 (= lt!336978 e!421986)))

(declare-fun c!82912 () Bool)

(assert (=> b!756826 (= c!82912 (= lt!336988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756827 () Bool)

(assert (=> b!756827 (= e!421993 e!421996)))

(declare-fun res!511762 () Bool)

(assert (=> b!756827 (=> res!511762 e!421996)))

(assert (=> b!756827 (= res!511762 (= lt!336988 lt!336981))))

(assert (=> b!756827 (= lt!336988 (select (store (arr!20097 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!756828 () Bool)

(assert (=> b!756828 (= e!421991 (not e!421989))))

(declare-fun res!511747 () Bool)

(assert (=> b!756828 (=> res!511747 e!421989)))

(assert (=> b!756828 (= res!511747 (or (not (is-Intermediate!7697 lt!336986)) (bvslt x!1131 (x!64055 lt!336986)) (not (= x!1131 (x!64055 lt!336986))) (not (= index!1321 (index!33158 lt!336986)))))))

(assert (=> b!756828 e!421987))

(declare-fun res!511751 () Bool)

(assert (=> b!756828 (=> (not res!511751) (not e!421987))))

(assert (=> b!756828 (= res!511751 (= lt!336989 lt!336979))))

(assert (=> b!756828 (= lt!336979 (Found!7697 j!159))))

(assert (=> b!756828 (= lt!336989 (seekEntryOrOpen!0 (select (arr!20097 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756828 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336983 () Unit!26168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26168)

(assert (=> b!756828 (= lt!336983 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65794 res!511753) b!756814))

(assert (= (and b!756814 res!511755) b!756816))

(assert (= (and b!756816 res!511760) b!756825))

(assert (= (and b!756825 res!511763) b!756809))

(assert (= (and b!756809 res!511759) b!756818))

(assert (= (and b!756818 res!511746) b!756807))

(assert (= (and b!756807 res!511761) b!756817))

(assert (= (and b!756817 res!511752) b!756824))

(assert (= (and b!756824 res!511750) b!756808))

(assert (= (and b!756808 res!511749) b!756820))

(assert (= (and b!756820 res!511758) b!756806))

(assert (= (and b!756806 c!82911) b!756810))

(assert (= (and b!756806 (not c!82911)) b!756811))

(assert (= (and b!756806 res!511757) b!756822))

(assert (= (and b!756822 res!511754) b!756828))

(assert (= (and b!756828 res!511751) b!756819))

(assert (= (and b!756828 (not res!511747)) b!756821))

(assert (= (and b!756821 (not res!511745)) b!756827))

(assert (= (and b!756827 (not res!511762)) b!756826))

(assert (= (and b!756826 c!82912) b!756813))

(assert (= (and b!756826 (not c!82912)) b!756812))

(assert (= (and b!756826 res!511748) b!756823))

(assert (= (and b!756823 res!511756) b!756815))

(declare-fun m!704671 () Bool)

(assert (=> b!756822 m!704671))

(declare-fun m!704673 () Bool)

(assert (=> b!756822 m!704673))

(declare-fun m!704675 () Bool)

(assert (=> b!756822 m!704675))

(declare-fun m!704677 () Bool)

(assert (=> b!756822 m!704677))

(assert (=> b!756822 m!704671))

(declare-fun m!704679 () Bool)

(assert (=> b!756822 m!704679))

(declare-fun m!704681 () Bool)

(assert (=> b!756810 m!704681))

(assert (=> b!756810 m!704681))

(declare-fun m!704683 () Bool)

(assert (=> b!756810 m!704683))

(declare-fun m!704685 () Bool)

(assert (=> b!756809 m!704685))

(assert (=> b!756828 m!704681))

(assert (=> b!756828 m!704681))

(declare-fun m!704687 () Bool)

(assert (=> b!756828 m!704687))

(declare-fun m!704689 () Bool)

(assert (=> b!756828 m!704689))

(declare-fun m!704691 () Bool)

(assert (=> b!756828 m!704691))

(declare-fun m!704693 () Bool)

(assert (=> b!756820 m!704693))

(declare-fun m!704695 () Bool)

(assert (=> b!756823 m!704695))

(declare-fun m!704697 () Bool)

(assert (=> b!756823 m!704697))

(declare-fun m!704699 () Bool)

(assert (=> start!65794 m!704699))

(declare-fun m!704701 () Bool)

(assert (=> start!65794 m!704701))

(assert (=> b!756827 m!704675))

(declare-fun m!704703 () Bool)

(assert (=> b!756827 m!704703))

(assert (=> b!756811 m!704681))

(assert (=> b!756811 m!704681))

(declare-fun m!704705 () Bool)

(assert (=> b!756811 m!704705))

(assert (=> b!756821 m!704681))

(assert (=> b!756821 m!704681))

(assert (=> b!756821 m!704705))

(assert (=> b!756808 m!704681))

(assert (=> b!756808 m!704681))

(declare-fun m!704707 () Bool)

(assert (=> b!756808 m!704707))

(assert (=> b!756808 m!704707))

(assert (=> b!756808 m!704681))

(declare-fun m!704709 () Bool)

(assert (=> b!756808 m!704709))

(declare-fun m!704711 () Bool)

(assert (=> b!756807 m!704711))

(declare-fun m!704713 () Bool)

(assert (=> b!756818 m!704713))

(declare-fun m!704715 () Bool)

(assert (=> b!756825 m!704715))

(assert (=> b!756816 m!704681))

(assert (=> b!756816 m!704681))

(declare-fun m!704717 () Bool)

(assert (=> b!756816 m!704717))

(assert (=> b!756819 m!704681))

(assert (=> b!756819 m!704681))

(declare-fun m!704719 () Bool)

(assert (=> b!756819 m!704719))

(declare-fun m!704721 () Bool)

(assert (=> b!756817 m!704721))

(push 1)

