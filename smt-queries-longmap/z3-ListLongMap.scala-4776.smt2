; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65844 () Bool)

(assert start!65844)

(declare-fun b!754860 () Bool)

(declare-fun res!509840 () Bool)

(declare-fun e!421068 () Bool)

(assert (=> b!754860 (=> (not res!509840) (not e!421068))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41887 0))(
  ( (array!41888 (arr!20053 (Array (_ BitVec 32) (_ BitVec 64))) (size!20473 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41887)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754860 (= res!509840 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20053 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!509833 () Bool)

(declare-fun e!421061 () Bool)

(assert (=> start!65844 (=> (not res!509833) (not e!421061))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65844 (= res!509833 (validMask!0 mask!3328))))

(assert (=> start!65844 e!421061))

(assert (=> start!65844 true))

(declare-fun array_inv!15912 (array!41887) Bool)

(assert (=> start!65844 (array_inv!15912 a!3186)))

(declare-datatypes ((SeekEntryResult!7609 0))(
  ( (MissingZero!7609 (index!32804 (_ BitVec 32))) (Found!7609 (index!32805 (_ BitVec 32))) (Intermediate!7609 (undefined!8421 Bool) (index!32806 (_ BitVec 32)) (x!63875 (_ BitVec 32))) (Undefined!7609) (MissingVacant!7609 (index!32807 (_ BitVec 32))) )
))
(declare-fun lt!335896 () SeekEntryResult!7609)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!421060 () Bool)

(declare-fun b!754861 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41887 (_ BitVec 32)) SeekEntryResult!7609)

(assert (=> b!754861 (= e!421060 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20053 a!3186) j!159) a!3186 mask!3328) lt!335896))))

(declare-fun b!754862 () Bool)

(declare-fun e!421064 () Bool)

(assert (=> b!754862 (= e!421061 e!421064)))

(declare-fun res!509837 () Bool)

(assert (=> b!754862 (=> (not res!509837) (not e!421064))))

(declare-fun lt!335897 () SeekEntryResult!7609)

(assert (=> b!754862 (= res!509837 (or (= lt!335897 (MissingZero!7609 i!1173)) (= lt!335897 (MissingVacant!7609 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41887 (_ BitVec 32)) SeekEntryResult!7609)

(assert (=> b!754862 (= lt!335897 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754863 () Bool)

(declare-fun res!509842 () Bool)

(assert (=> b!754863 (=> (not res!509842) (not e!421064))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754863 (= res!509842 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20473 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20473 a!3186))))))

(declare-fun b!754864 () Bool)

(declare-fun res!509838 () Bool)

(declare-fun e!421069 () Bool)

(assert (=> b!754864 (=> (not res!509838) (not e!421069))))

(declare-fun lt!335894 () array!41887)

(declare-fun lt!335892 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41887 (_ BitVec 32)) SeekEntryResult!7609)

(assert (=> b!754864 (= res!509838 (= (seekEntryOrOpen!0 lt!335892 lt!335894 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335892 lt!335894 mask!3328)))))

(declare-fun b!754865 () Bool)

(declare-fun res!509836 () Bool)

(assert (=> b!754865 (=> (not res!509836) (not e!421064))))

(declare-datatypes ((List!13962 0))(
  ( (Nil!13959) (Cons!13958 (h!15036 (_ BitVec 64)) (t!20269 List!13962)) )
))
(declare-fun arrayNoDuplicates!0 (array!41887 (_ BitVec 32) List!13962) Bool)

(assert (=> b!754865 (= res!509836 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13959))))

(declare-fun b!754866 () Bool)

(declare-fun res!509830 () Bool)

(assert (=> b!754866 (=> (not res!509830) (not e!421064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41887 (_ BitVec 32)) Bool)

(assert (=> b!754866 (= res!509830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754867 () Bool)

(declare-fun res!509839 () Bool)

(assert (=> b!754867 (=> (not res!509839) (not e!421061))))

(assert (=> b!754867 (= res!509839 (and (= (size!20473 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20473 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20473 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754868 () Bool)

(declare-fun e!421066 () Bool)

(declare-fun e!421070 () Bool)

(assert (=> b!754868 (= e!421066 e!421070)))

(declare-fun res!509845 () Bool)

(assert (=> b!754868 (=> res!509845 e!421070)))

(declare-fun lt!335898 () (_ BitVec 64))

(assert (=> b!754868 (= res!509845 (= lt!335898 lt!335892))))

(assert (=> b!754868 (= lt!335898 (select (store (arr!20053 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754869 () Bool)

(assert (=> b!754869 (= e!421060 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20053 a!3186) j!159) a!3186 mask!3328) (Found!7609 j!159)))))

(declare-fun b!754870 () Bool)

(declare-fun res!509841 () Bool)

(assert (=> b!754870 (=> (not res!509841) (not e!421068))))

(assert (=> b!754870 (= res!509841 e!421060)))

(declare-fun c!82901 () Bool)

(assert (=> b!754870 (= c!82901 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754871 () Bool)

(assert (=> b!754871 (= e!421070 true)))

(assert (=> b!754871 e!421069))

(declare-fun res!509828 () Bool)

(assert (=> b!754871 (=> (not res!509828) (not e!421069))))

(assert (=> b!754871 (= res!509828 (= lt!335898 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25993 0))(
  ( (Unit!25994) )
))
(declare-fun lt!335889 () Unit!25993)

(declare-fun e!421062 () Unit!25993)

(assert (=> b!754871 (= lt!335889 e!421062)))

(declare-fun c!82900 () Bool)

(assert (=> b!754871 (= c!82900 (= lt!335898 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754872 () Bool)

(declare-fun res!509831 () Bool)

(assert (=> b!754872 (=> (not res!509831) (not e!421061))))

(declare-fun arrayContainsKey!0 (array!41887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754872 (= res!509831 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754873 () Bool)

(declare-fun e!421067 () Bool)

(assert (=> b!754873 (= e!421068 e!421067)))

(declare-fun res!509843 () Bool)

(assert (=> b!754873 (=> (not res!509843) (not e!421067))))

(declare-fun lt!335890 () SeekEntryResult!7609)

(declare-fun lt!335895 () SeekEntryResult!7609)

(assert (=> b!754873 (= res!509843 (= lt!335890 lt!335895))))

(assert (=> b!754873 (= lt!335895 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335892 lt!335894 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754873 (= lt!335890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335892 mask!3328) lt!335892 lt!335894 mask!3328))))

(assert (=> b!754873 (= lt!335892 (select (store (arr!20053 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754873 (= lt!335894 (array!41888 (store (arr!20053 a!3186) i!1173 k0!2102) (size!20473 a!3186)))))

(declare-fun b!754874 () Bool)

(declare-fun e!421065 () Bool)

(assert (=> b!754874 (= e!421065 e!421066)))

(declare-fun res!509834 () Bool)

(assert (=> b!754874 (=> res!509834 e!421066)))

(declare-fun lt!335888 () SeekEntryResult!7609)

(declare-fun lt!335887 () SeekEntryResult!7609)

(assert (=> b!754874 (= res!509834 (not (= lt!335888 lt!335887)))))

(assert (=> b!754874 (= lt!335888 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20053 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754875 () Bool)

(declare-fun Unit!25995 () Unit!25993)

(assert (=> b!754875 (= e!421062 Unit!25995)))

(assert (=> b!754875 false))

(declare-fun e!421071 () Bool)

(declare-fun b!754876 () Bool)

(assert (=> b!754876 (= e!421071 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20053 a!3186) j!159) a!3186 mask!3328) lt!335887))))

(declare-fun b!754877 () Bool)

(declare-fun lt!335893 () SeekEntryResult!7609)

(assert (=> b!754877 (= e!421069 (= lt!335893 lt!335888))))

(declare-fun b!754878 () Bool)

(declare-fun res!509832 () Bool)

(assert (=> b!754878 (=> (not res!509832) (not e!421061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754878 (= res!509832 (validKeyInArray!0 k0!2102))))

(declare-fun b!754879 () Bool)

(declare-fun res!509835 () Bool)

(assert (=> b!754879 (=> (not res!509835) (not e!421061))))

(assert (=> b!754879 (= res!509835 (validKeyInArray!0 (select (arr!20053 a!3186) j!159)))))

(declare-fun b!754880 () Bool)

(declare-fun Unit!25996 () Unit!25993)

(assert (=> b!754880 (= e!421062 Unit!25996)))

(declare-fun b!754881 () Bool)

(assert (=> b!754881 (= e!421064 e!421068)))

(declare-fun res!509844 () Bool)

(assert (=> b!754881 (=> (not res!509844) (not e!421068))))

(assert (=> b!754881 (= res!509844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20053 a!3186) j!159) mask!3328) (select (arr!20053 a!3186) j!159) a!3186 mask!3328) lt!335896))))

(assert (=> b!754881 (= lt!335896 (Intermediate!7609 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754882 () Bool)

(assert (=> b!754882 (= e!421067 (not e!421065))))

(declare-fun res!509829 () Bool)

(assert (=> b!754882 (=> res!509829 e!421065)))

(get-info :version)

(assert (=> b!754882 (= res!509829 (or (not ((_ is Intermediate!7609) lt!335895)) (bvslt x!1131 (x!63875 lt!335895)) (not (= x!1131 (x!63875 lt!335895))) (not (= index!1321 (index!32806 lt!335895)))))))

(assert (=> b!754882 e!421071))

(declare-fun res!509827 () Bool)

(assert (=> b!754882 (=> (not res!509827) (not e!421071))))

(assert (=> b!754882 (= res!509827 (= lt!335893 lt!335887))))

(assert (=> b!754882 (= lt!335887 (Found!7609 j!159))))

(assert (=> b!754882 (= lt!335893 (seekEntryOrOpen!0 (select (arr!20053 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754882 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335891 () Unit!25993)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25993)

(assert (=> b!754882 (= lt!335891 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65844 res!509833) b!754867))

(assert (= (and b!754867 res!509839) b!754879))

(assert (= (and b!754879 res!509835) b!754878))

(assert (= (and b!754878 res!509832) b!754872))

(assert (= (and b!754872 res!509831) b!754862))

(assert (= (and b!754862 res!509837) b!754866))

(assert (= (and b!754866 res!509830) b!754865))

(assert (= (and b!754865 res!509836) b!754863))

(assert (= (and b!754863 res!509842) b!754881))

(assert (= (and b!754881 res!509844) b!754860))

(assert (= (and b!754860 res!509840) b!754870))

(assert (= (and b!754870 c!82901) b!754861))

(assert (= (and b!754870 (not c!82901)) b!754869))

(assert (= (and b!754870 res!509841) b!754873))

(assert (= (and b!754873 res!509843) b!754882))

(assert (= (and b!754882 res!509827) b!754876))

(assert (= (and b!754882 (not res!509829)) b!754874))

(assert (= (and b!754874 (not res!509834)) b!754868))

(assert (= (and b!754868 (not res!509845)) b!754871))

(assert (= (and b!754871 c!82900) b!754875))

(assert (= (and b!754871 (not c!82900)) b!754880))

(assert (= (and b!754871 res!509828) b!754864))

(assert (= (and b!754864 res!509838) b!754877))

(declare-fun m!703803 () Bool)

(assert (=> b!754861 m!703803))

(assert (=> b!754861 m!703803))

(declare-fun m!703805 () Bool)

(assert (=> b!754861 m!703805))

(declare-fun m!703807 () Bool)

(assert (=> b!754864 m!703807))

(declare-fun m!703809 () Bool)

(assert (=> b!754864 m!703809))

(declare-fun m!703811 () Bool)

(assert (=> b!754862 m!703811))

(assert (=> b!754874 m!703803))

(assert (=> b!754874 m!703803))

(declare-fun m!703813 () Bool)

(assert (=> b!754874 m!703813))

(declare-fun m!703815 () Bool)

(assert (=> b!754860 m!703815))

(declare-fun m!703817 () Bool)

(assert (=> b!754866 m!703817))

(assert (=> b!754879 m!703803))

(assert (=> b!754879 m!703803))

(declare-fun m!703819 () Bool)

(assert (=> b!754879 m!703819))

(assert (=> b!754882 m!703803))

(assert (=> b!754882 m!703803))

(declare-fun m!703821 () Bool)

(assert (=> b!754882 m!703821))

(declare-fun m!703823 () Bool)

(assert (=> b!754882 m!703823))

(declare-fun m!703825 () Bool)

(assert (=> b!754882 m!703825))

(assert (=> b!754869 m!703803))

(assert (=> b!754869 m!703803))

(assert (=> b!754869 m!703813))

(declare-fun m!703827 () Bool)

(assert (=> b!754865 m!703827))

(assert (=> b!754876 m!703803))

(assert (=> b!754876 m!703803))

(declare-fun m!703829 () Bool)

(assert (=> b!754876 m!703829))

(assert (=> b!754881 m!703803))

(assert (=> b!754881 m!703803))

(declare-fun m!703831 () Bool)

(assert (=> b!754881 m!703831))

(assert (=> b!754881 m!703831))

(assert (=> b!754881 m!703803))

(declare-fun m!703833 () Bool)

(assert (=> b!754881 m!703833))

(declare-fun m!703835 () Bool)

(assert (=> b!754872 m!703835))

(declare-fun m!703837 () Bool)

(assert (=> b!754873 m!703837))

(declare-fun m!703839 () Bool)

(assert (=> b!754873 m!703839))

(declare-fun m!703841 () Bool)

(assert (=> b!754873 m!703841))

(declare-fun m!703843 () Bool)

(assert (=> b!754873 m!703843))

(declare-fun m!703845 () Bool)

(assert (=> b!754873 m!703845))

(assert (=> b!754873 m!703837))

(assert (=> b!754868 m!703843))

(declare-fun m!703847 () Bool)

(assert (=> b!754868 m!703847))

(declare-fun m!703849 () Bool)

(assert (=> start!65844 m!703849))

(declare-fun m!703851 () Bool)

(assert (=> start!65844 m!703851))

(declare-fun m!703853 () Bool)

(assert (=> b!754878 m!703853))

(check-sat (not b!754881) (not b!754876) (not b!754866) (not b!754862) (not start!65844) (not b!754869) (not b!754864) (not b!754873) (not b!754879) (not b!754865) (not b!754878) (not b!754872) (not b!754861) (not b!754882) (not b!754874))
(check-sat)
