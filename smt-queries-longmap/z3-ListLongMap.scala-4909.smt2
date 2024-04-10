; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67700 () Bool)

(assert start!67700)

(declare-fun b!784862 () Bool)

(declare-fun e!436361 () Bool)

(declare-fun e!436363 () Bool)

(assert (=> b!784862 (= e!436361 e!436363)))

(declare-fun res!531190 () Bool)

(assert (=> b!784862 (=> res!531190 e!436363)))

(declare-datatypes ((SeekEntryResult!8058 0))(
  ( (MissingZero!8058 (index!34600 (_ BitVec 32))) (Found!8058 (index!34601 (_ BitVec 32))) (Intermediate!8058 (undefined!8870 Bool) (index!34602 (_ BitVec 32)) (x!65550 (_ BitVec 32))) (Undefined!8058) (MissingVacant!8058 (index!34603 (_ BitVec 32))) )
))
(declare-fun lt!349911 () SeekEntryResult!8058)

(declare-fun lt!349916 () SeekEntryResult!8058)

(assert (=> b!784862 (= res!531190 (not (= lt!349911 lt!349916)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42740 0))(
  ( (array!42741 (arr!20458 (Array (_ BitVec 32) (_ BitVec 64))) (size!20879 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42740)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42740 (_ BitVec 32)) SeekEntryResult!8058)

(assert (=> b!784862 (= lt!349911 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20458 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784863 () Bool)

(declare-fun res!531196 () Bool)

(declare-fun e!436356 () Bool)

(assert (=> b!784863 (=> (not res!531196) (not e!436356))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784863 (= res!531196 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784864 () Bool)

(declare-fun res!531189 () Bool)

(assert (=> b!784864 (=> (not res!531189) (not e!436356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784864 (= res!531189 (validKeyInArray!0 (select (arr!20458 a!3186) j!159)))))

(declare-fun b!784865 () Bool)

(declare-fun res!531186 () Bool)

(declare-fun e!436359 () Bool)

(assert (=> b!784865 (=> (not res!531186) (not e!436359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42740 (_ BitVec 32)) Bool)

(assert (=> b!784865 (= res!531186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784866 () Bool)

(declare-fun e!436354 () Bool)

(declare-fun e!436353 () Bool)

(assert (=> b!784866 (= e!436354 e!436353)))

(declare-fun res!531202 () Bool)

(assert (=> b!784866 (=> (not res!531202) (not e!436353))))

(declare-fun lt!349907 () SeekEntryResult!8058)

(declare-fun lt!349906 () SeekEntryResult!8058)

(assert (=> b!784866 (= res!531202 (= lt!349907 lt!349906))))

(declare-fun lt!349909 () array!42740)

(declare-fun lt!349915 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42740 (_ BitVec 32)) SeekEntryResult!8058)

(assert (=> b!784866 (= lt!349906 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349915 lt!349909 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784866 (= lt!349907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349915 mask!3328) lt!349915 lt!349909 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784866 (= lt!349915 (select (store (arr!20458 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784866 (= lt!349909 (array!42741 (store (arr!20458 a!3186) i!1173 k0!2102) (size!20879 a!3186)))))

(declare-fun b!784867 () Bool)

(declare-fun res!531193 () Bool)

(assert (=> b!784867 (=> (not res!531193) (not e!436359))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784867 (= res!531193 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20879 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20879 a!3186))))))

(declare-fun b!784868 () Bool)

(declare-fun res!531188 () Bool)

(assert (=> b!784868 (=> (not res!531188) (not e!436356))))

(assert (=> b!784868 (= res!531188 (and (= (size!20879 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20879 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20879 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784869 () Bool)

(declare-fun e!436364 () Bool)

(declare-fun lt!349905 () SeekEntryResult!8058)

(assert (=> b!784869 (= e!436364 (= lt!349905 lt!349911))))

(declare-fun b!784870 () Bool)

(assert (=> b!784870 (= e!436356 e!436359)))

(declare-fun res!531197 () Bool)

(assert (=> b!784870 (=> (not res!531197) (not e!436359))))

(declare-fun lt!349912 () SeekEntryResult!8058)

(assert (=> b!784870 (= res!531197 (or (= lt!349912 (MissingZero!8058 i!1173)) (= lt!349912 (MissingVacant!8058 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42740 (_ BitVec 32)) SeekEntryResult!8058)

(assert (=> b!784870 (= lt!349912 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784871 () Bool)

(declare-datatypes ((Unit!27120 0))(
  ( (Unit!27121) )
))
(declare-fun e!436362 () Unit!27120)

(declare-fun Unit!27122 () Unit!27120)

(assert (=> b!784871 (= e!436362 Unit!27122)))

(assert (=> b!784871 false))

(declare-fun b!784872 () Bool)

(declare-fun Unit!27123 () Unit!27120)

(assert (=> b!784872 (= e!436362 Unit!27123)))

(declare-fun b!784873 () Bool)

(assert (=> b!784873 (= e!436353 (not e!436361))))

(declare-fun res!531195 () Bool)

(assert (=> b!784873 (=> res!531195 e!436361)))

(get-info :version)

(assert (=> b!784873 (= res!531195 (or (not ((_ is Intermediate!8058) lt!349906)) (bvslt x!1131 (x!65550 lt!349906)) (not (= x!1131 (x!65550 lt!349906))) (not (= index!1321 (index!34602 lt!349906)))))))

(declare-fun e!436355 () Bool)

(assert (=> b!784873 e!436355))

(declare-fun res!531194 () Bool)

(assert (=> b!784873 (=> (not res!531194) (not e!436355))))

(assert (=> b!784873 (= res!531194 (= lt!349905 lt!349916))))

(assert (=> b!784873 (= lt!349916 (Found!8058 j!159))))

(assert (=> b!784873 (= lt!349905 (seekEntryOrOpen!0 (select (arr!20458 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784873 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349913 () Unit!27120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27120)

(assert (=> b!784873 (= lt!349913 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784874 () Bool)

(declare-fun e!436357 () Bool)

(assert (=> b!784874 (= e!436363 e!436357)))

(declare-fun res!531185 () Bool)

(assert (=> b!784874 (=> res!531185 e!436357)))

(declare-fun lt!349910 () (_ BitVec 64))

(assert (=> b!784874 (= res!531185 (= lt!349910 lt!349915))))

(assert (=> b!784874 (= lt!349910 (select (store (arr!20458 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun e!436358 () Bool)

(declare-fun b!784875 () Bool)

(assert (=> b!784875 (= e!436358 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20458 a!3186) j!159) a!3186 mask!3328) (Found!8058 j!159)))))

(declare-fun b!784876 () Bool)

(declare-fun lt!349908 () SeekEntryResult!8058)

(assert (=> b!784876 (= e!436358 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20458 a!3186) j!159) a!3186 mask!3328) lt!349908))))

(declare-fun res!531199 () Bool)

(assert (=> start!67700 (=> (not res!531199) (not e!436356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67700 (= res!531199 (validMask!0 mask!3328))))

(assert (=> start!67700 e!436356))

(assert (=> start!67700 true))

(declare-fun array_inv!16254 (array!42740) Bool)

(assert (=> start!67700 (array_inv!16254 a!3186)))

(declare-fun b!784877 () Bool)

(declare-fun res!531192 () Bool)

(assert (=> b!784877 (=> (not res!531192) (not e!436364))))

(assert (=> b!784877 (= res!531192 (= (seekEntryOrOpen!0 lt!349915 lt!349909 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349915 lt!349909 mask!3328)))))

(declare-fun b!784878 () Bool)

(assert (=> b!784878 (= e!436355 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20458 a!3186) j!159) a!3186 mask!3328) lt!349916))))

(declare-fun b!784879 () Bool)

(assert (=> b!784879 (= e!436357 true)))

(assert (=> b!784879 e!436364))

(declare-fun res!531187 () Bool)

(assert (=> b!784879 (=> (not res!531187) (not e!436364))))

(assert (=> b!784879 (= res!531187 (= lt!349910 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349914 () Unit!27120)

(assert (=> b!784879 (= lt!349914 e!436362)))

(declare-fun c!87246 () Bool)

(assert (=> b!784879 (= c!87246 (= lt!349910 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784880 () Bool)

(declare-fun res!531203 () Bool)

(assert (=> b!784880 (=> (not res!531203) (not e!436354))))

(assert (=> b!784880 (= res!531203 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20458 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784881 () Bool)

(assert (=> b!784881 (= e!436359 e!436354)))

(declare-fun res!531198 () Bool)

(assert (=> b!784881 (=> (not res!531198) (not e!436354))))

(assert (=> b!784881 (= res!531198 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20458 a!3186) j!159) mask!3328) (select (arr!20458 a!3186) j!159) a!3186 mask!3328) lt!349908))))

(assert (=> b!784881 (= lt!349908 (Intermediate!8058 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784882 () Bool)

(declare-fun res!531201 () Bool)

(assert (=> b!784882 (=> (not res!531201) (not e!436359))))

(declare-datatypes ((List!14460 0))(
  ( (Nil!14457) (Cons!14456 (h!15579 (_ BitVec 64)) (t!20775 List!14460)) )
))
(declare-fun arrayNoDuplicates!0 (array!42740 (_ BitVec 32) List!14460) Bool)

(assert (=> b!784882 (= res!531201 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14457))))

(declare-fun b!784883 () Bool)

(declare-fun res!531200 () Bool)

(assert (=> b!784883 (=> (not res!531200) (not e!436356))))

(assert (=> b!784883 (= res!531200 (validKeyInArray!0 k0!2102))))

(declare-fun b!784884 () Bool)

(declare-fun res!531191 () Bool)

(assert (=> b!784884 (=> (not res!531191) (not e!436354))))

(assert (=> b!784884 (= res!531191 e!436358)))

(declare-fun c!87247 () Bool)

(assert (=> b!784884 (= c!87247 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67700 res!531199) b!784868))

(assert (= (and b!784868 res!531188) b!784864))

(assert (= (and b!784864 res!531189) b!784883))

(assert (= (and b!784883 res!531200) b!784863))

(assert (= (and b!784863 res!531196) b!784870))

(assert (= (and b!784870 res!531197) b!784865))

(assert (= (and b!784865 res!531186) b!784882))

(assert (= (and b!784882 res!531201) b!784867))

(assert (= (and b!784867 res!531193) b!784881))

(assert (= (and b!784881 res!531198) b!784880))

(assert (= (and b!784880 res!531203) b!784884))

(assert (= (and b!784884 c!87247) b!784876))

(assert (= (and b!784884 (not c!87247)) b!784875))

(assert (= (and b!784884 res!531191) b!784866))

(assert (= (and b!784866 res!531202) b!784873))

(assert (= (and b!784873 res!531194) b!784878))

(assert (= (and b!784873 (not res!531195)) b!784862))

(assert (= (and b!784862 (not res!531190)) b!784874))

(assert (= (and b!784874 (not res!531185)) b!784879))

(assert (= (and b!784879 c!87246) b!784871))

(assert (= (and b!784879 (not c!87246)) b!784872))

(assert (= (and b!784879 res!531187) b!784877))

(assert (= (and b!784877 res!531192) b!784869))

(declare-fun m!727077 () Bool)

(assert (=> b!784878 m!727077))

(assert (=> b!784878 m!727077))

(declare-fun m!727079 () Bool)

(assert (=> b!784878 m!727079))

(declare-fun m!727081 () Bool)

(assert (=> b!784865 m!727081))

(assert (=> b!784876 m!727077))

(assert (=> b!784876 m!727077))

(declare-fun m!727083 () Bool)

(assert (=> b!784876 m!727083))

(assert (=> b!784864 m!727077))

(assert (=> b!784864 m!727077))

(declare-fun m!727085 () Bool)

(assert (=> b!784864 m!727085))

(assert (=> b!784862 m!727077))

(assert (=> b!784862 m!727077))

(declare-fun m!727087 () Bool)

(assert (=> b!784862 m!727087))

(declare-fun m!727089 () Bool)

(assert (=> b!784880 m!727089))

(declare-fun m!727091 () Bool)

(assert (=> start!67700 m!727091))

(declare-fun m!727093 () Bool)

(assert (=> start!67700 m!727093))

(declare-fun m!727095 () Bool)

(assert (=> b!784866 m!727095))

(declare-fun m!727097 () Bool)

(assert (=> b!784866 m!727097))

(declare-fun m!727099 () Bool)

(assert (=> b!784866 m!727099))

(assert (=> b!784866 m!727095))

(declare-fun m!727101 () Bool)

(assert (=> b!784866 m!727101))

(declare-fun m!727103 () Bool)

(assert (=> b!784866 m!727103))

(declare-fun m!727105 () Bool)

(assert (=> b!784863 m!727105))

(declare-fun m!727107 () Bool)

(assert (=> b!784883 m!727107))

(declare-fun m!727109 () Bool)

(assert (=> b!784882 m!727109))

(assert (=> b!784881 m!727077))

(assert (=> b!784881 m!727077))

(declare-fun m!727111 () Bool)

(assert (=> b!784881 m!727111))

(assert (=> b!784881 m!727111))

(assert (=> b!784881 m!727077))

(declare-fun m!727113 () Bool)

(assert (=> b!784881 m!727113))

(declare-fun m!727115 () Bool)

(assert (=> b!784870 m!727115))

(assert (=> b!784874 m!727103))

(declare-fun m!727117 () Bool)

(assert (=> b!784874 m!727117))

(assert (=> b!784873 m!727077))

(assert (=> b!784873 m!727077))

(declare-fun m!727119 () Bool)

(assert (=> b!784873 m!727119))

(declare-fun m!727121 () Bool)

(assert (=> b!784873 m!727121))

(declare-fun m!727123 () Bool)

(assert (=> b!784873 m!727123))

(assert (=> b!784875 m!727077))

(assert (=> b!784875 m!727077))

(assert (=> b!784875 m!727087))

(declare-fun m!727125 () Bool)

(assert (=> b!784877 m!727125))

(declare-fun m!727127 () Bool)

(assert (=> b!784877 m!727127))

(check-sat (not b!784862) (not b!784863) (not b!784881) (not b!784875) (not b!784865) (not b!784870) (not start!67700) (not b!784882) (not b!784883) (not b!784877) (not b!784866) (not b!784864) (not b!784873) (not b!784876) (not b!784878))
(check-sat)
