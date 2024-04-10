; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67898 () Bool)

(assert start!67898)

(declare-fun b!789855 () Bool)

(declare-fun res!535073 () Bool)

(declare-fun e!439003 () Bool)

(assert (=> b!789855 (=> (not res!535073) (not e!439003))))

(declare-datatypes ((array!42875 0))(
  ( (array!42876 (arr!20524 (Array (_ BitVec 32) (_ BitVec 64))) (size!20945 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42875)

(declare-datatypes ((List!14526 0))(
  ( (Nil!14523) (Cons!14522 (h!15648 (_ BitVec 64)) (t!20841 List!14526)) )
))
(declare-fun arrayNoDuplicates!0 (array!42875 (_ BitVec 32) List!14526) Bool)

(assert (=> b!789855 (= res!535073 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14523))))

(declare-fun b!789856 () Bool)

(declare-datatypes ((Unit!27384 0))(
  ( (Unit!27385) )
))
(declare-fun e!439008 () Unit!27384)

(declare-fun Unit!27386 () Unit!27384)

(assert (=> b!789856 (= e!439008 Unit!27386)))

(declare-fun b!789857 () Bool)

(declare-fun e!439006 () Bool)

(declare-fun e!439007 () Bool)

(assert (=> b!789857 (= e!439006 (not e!439007))))

(declare-fun res!535068 () Bool)

(assert (=> b!789857 (=> res!535068 e!439007)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8124 0))(
  ( (MissingZero!8124 (index!34864 (_ BitVec 32))) (Found!8124 (index!34865 (_ BitVec 32))) (Intermediate!8124 (undefined!8936 Bool) (index!34866 (_ BitVec 32)) (x!65801 (_ BitVec 32))) (Undefined!8124) (MissingVacant!8124 (index!34867 (_ BitVec 32))) )
))
(declare-fun lt!352509 () SeekEntryResult!8124)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!789857 (= res!535068 (or (not ((_ is Intermediate!8124) lt!352509)) (bvslt x!1131 (x!65801 lt!352509)) (not (= x!1131 (x!65801 lt!352509))) (not (= index!1321 (index!34866 lt!352509)))))))

(declare-fun e!439009 () Bool)

(assert (=> b!789857 e!439009))

(declare-fun res!535060 () Bool)

(assert (=> b!789857 (=> (not res!535060) (not e!439009))))

(declare-fun lt!352504 () SeekEntryResult!8124)

(declare-fun lt!352505 () SeekEntryResult!8124)

(assert (=> b!789857 (= res!535060 (= lt!352504 lt!352505))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!789857 (= lt!352505 (Found!8124 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42875 (_ BitVec 32)) SeekEntryResult!8124)

(assert (=> b!789857 (= lt!352504 (seekEntryOrOpen!0 (select (arr!20524 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42875 (_ BitVec 32)) Bool)

(assert (=> b!789857 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352510 () Unit!27384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42875 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27384)

(assert (=> b!789857 (= lt!352510 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789858 () Bool)

(declare-fun res!535062 () Bool)

(assert (=> b!789858 (=> (not res!535062) (not e!439003))))

(assert (=> b!789858 (= res!535062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789859 () Bool)

(declare-fun res!535061 () Bool)

(declare-fun e!439000 () Bool)

(assert (=> b!789859 (=> (not res!535061) (not e!439000))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789859 (= res!535061 (and (= (size!20945 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20945 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20945 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789860 () Bool)

(declare-fun res!535063 () Bool)

(declare-fun e!439001 () Bool)

(assert (=> b!789860 (=> (not res!535063) (not e!439001))))

(declare-fun e!439005 () Bool)

(assert (=> b!789860 (= res!535063 e!439005)))

(declare-fun c!87808 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789860 (= c!87808 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!352503 () SeekEntryResult!8124)

(declare-fun b!789861 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42875 (_ BitVec 32)) SeekEntryResult!8124)

(assert (=> b!789861 (= e!439005 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20524 a!3186) j!159) a!3186 mask!3328) lt!352503))))

(declare-fun b!789862 () Bool)

(declare-fun Unit!27387 () Unit!27384)

(assert (=> b!789862 (= e!439008 Unit!27387)))

(assert (=> b!789862 false))

(declare-fun res!535067 () Bool)

(assert (=> start!67898 (=> (not res!535067) (not e!439000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67898 (= res!535067 (validMask!0 mask!3328))))

(assert (=> start!67898 e!439000))

(assert (=> start!67898 true))

(declare-fun array_inv!16320 (array!42875) Bool)

(assert (=> start!67898 (array_inv!16320 a!3186)))

(declare-fun b!789863 () Bool)

(declare-fun e!438999 () Bool)

(declare-fun e!439002 () Bool)

(assert (=> b!789863 (= e!438999 e!439002)))

(declare-fun res!535071 () Bool)

(assert (=> b!789863 (=> res!535071 e!439002)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!789863 (= res!535071 (or (not (= (select (arr!20524 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352511 () SeekEntryResult!8124)

(declare-fun lt!352516 () SeekEntryResult!8124)

(declare-fun lt!352514 () SeekEntryResult!8124)

(assert (=> b!789863 (and (= lt!352514 lt!352511) (= lt!352504 lt!352516))))

(declare-fun lt!352512 () (_ BitVec 64))

(declare-fun lt!352517 () array!42875)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42875 (_ BitVec 32)) SeekEntryResult!8124)

(assert (=> b!789863 (= lt!352511 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352512 lt!352517 mask!3328))))

(assert (=> b!789863 (= lt!352514 (seekEntryOrOpen!0 lt!352512 lt!352517 mask!3328))))

(declare-fun lt!352508 () (_ BitVec 64))

(assert (=> b!789863 (= lt!352508 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352507 () Unit!27384)

(assert (=> b!789863 (= lt!352507 e!439008)))

(declare-fun c!87807 () Bool)

(assert (=> b!789863 (= c!87807 (= lt!352508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789864 () Bool)

(declare-fun res!535072 () Bool)

(assert (=> b!789864 (=> (not res!535072) (not e!439000))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789864 (= res!535072 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789865 () Bool)

(declare-fun e!439004 () Bool)

(assert (=> b!789865 (= e!439007 e!439004)))

(declare-fun res!535064 () Bool)

(assert (=> b!789865 (=> res!535064 e!439004)))

(assert (=> b!789865 (= res!535064 (not (= lt!352516 lt!352505)))))

(assert (=> b!789865 (= lt!352516 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20524 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789866 () Bool)

(declare-fun res!535075 () Bool)

(assert (=> b!789866 (=> (not res!535075) (not e!439000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789866 (= res!535075 (validKeyInArray!0 (select (arr!20524 a!3186) j!159)))))

(declare-fun b!789867 () Bool)

(declare-fun res!535066 () Bool)

(assert (=> b!789867 (=> (not res!535066) (not e!439000))))

(assert (=> b!789867 (= res!535066 (validKeyInArray!0 k0!2102))))

(declare-fun b!789868 () Bool)

(assert (=> b!789868 (= e!439009 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20524 a!3186) j!159) a!3186 mask!3328) lt!352505))))

(declare-fun b!789869 () Bool)

(declare-fun res!535065 () Bool)

(assert (=> b!789869 (=> (not res!535065) (not e!439001))))

(assert (=> b!789869 (= res!535065 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20524 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789870 () Bool)

(assert (=> b!789870 (= e!439000 e!439003)))

(declare-fun res!535069 () Bool)

(assert (=> b!789870 (=> (not res!535069) (not e!439003))))

(declare-fun lt!352506 () SeekEntryResult!8124)

(assert (=> b!789870 (= res!535069 (or (= lt!352506 (MissingZero!8124 i!1173)) (= lt!352506 (MissingVacant!8124 i!1173))))))

(assert (=> b!789870 (= lt!352506 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789871 () Bool)

(declare-fun res!535074 () Bool)

(assert (=> b!789871 (=> (not res!535074) (not e!439003))))

(assert (=> b!789871 (= res!535074 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20945 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20945 a!3186))))))

(declare-fun b!789872 () Bool)

(assert (=> b!789872 (= e!439001 e!439006)))

(declare-fun res!535076 () Bool)

(assert (=> b!789872 (=> (not res!535076) (not e!439006))))

(declare-fun lt!352513 () SeekEntryResult!8124)

(assert (=> b!789872 (= res!535076 (= lt!352513 lt!352509))))

(assert (=> b!789872 (= lt!352509 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352512 lt!352517 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789872 (= lt!352513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352512 mask!3328) lt!352512 lt!352517 mask!3328))))

(assert (=> b!789872 (= lt!352512 (select (store (arr!20524 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789872 (= lt!352517 (array!42876 (store (arr!20524 a!3186) i!1173 k0!2102) (size!20945 a!3186)))))

(declare-fun b!789873 () Bool)

(assert (=> b!789873 (= e!439005 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20524 a!3186) j!159) a!3186 mask!3328) (Found!8124 j!159)))))

(declare-fun b!789874 () Bool)

(assert (=> b!789874 (= e!439002 true)))

(assert (=> b!789874 (= lt!352511 lt!352516)))

(declare-fun lt!352515 () Unit!27384)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42875 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27384)

(assert (=> b!789874 (= lt!352515 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!789875 () Bool)

(assert (=> b!789875 (= e!439003 e!439001)))

(declare-fun res!535070 () Bool)

(assert (=> b!789875 (=> (not res!535070) (not e!439001))))

(assert (=> b!789875 (= res!535070 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20524 a!3186) j!159) mask!3328) (select (arr!20524 a!3186) j!159) a!3186 mask!3328) lt!352503))))

(assert (=> b!789875 (= lt!352503 (Intermediate!8124 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789876 () Bool)

(assert (=> b!789876 (= e!439004 e!438999)))

(declare-fun res!535059 () Bool)

(assert (=> b!789876 (=> res!535059 e!438999)))

(assert (=> b!789876 (= res!535059 (= lt!352508 lt!352512))))

(assert (=> b!789876 (= lt!352508 (select (store (arr!20524 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!67898 res!535067) b!789859))

(assert (= (and b!789859 res!535061) b!789866))

(assert (= (and b!789866 res!535075) b!789867))

(assert (= (and b!789867 res!535066) b!789864))

(assert (= (and b!789864 res!535072) b!789870))

(assert (= (and b!789870 res!535069) b!789858))

(assert (= (and b!789858 res!535062) b!789855))

(assert (= (and b!789855 res!535073) b!789871))

(assert (= (and b!789871 res!535074) b!789875))

(assert (= (and b!789875 res!535070) b!789869))

(assert (= (and b!789869 res!535065) b!789860))

(assert (= (and b!789860 c!87808) b!789861))

(assert (= (and b!789860 (not c!87808)) b!789873))

(assert (= (and b!789860 res!535063) b!789872))

(assert (= (and b!789872 res!535076) b!789857))

(assert (= (and b!789857 res!535060) b!789868))

(assert (= (and b!789857 (not res!535068)) b!789865))

(assert (= (and b!789865 (not res!535064)) b!789876))

(assert (= (and b!789876 (not res!535059)) b!789863))

(assert (= (and b!789863 c!87807) b!789862))

(assert (= (and b!789863 (not c!87807)) b!789856))

(assert (= (and b!789863 (not res!535071)) b!789874))

(declare-fun m!730861 () Bool)

(assert (=> b!789861 m!730861))

(assert (=> b!789861 m!730861))

(declare-fun m!730863 () Bool)

(assert (=> b!789861 m!730863))

(declare-fun m!730865 () Bool)

(assert (=> b!789863 m!730865))

(declare-fun m!730867 () Bool)

(assert (=> b!789863 m!730867))

(declare-fun m!730869 () Bool)

(assert (=> b!789863 m!730869))

(assert (=> b!789866 m!730861))

(assert (=> b!789866 m!730861))

(declare-fun m!730871 () Bool)

(assert (=> b!789866 m!730871))

(declare-fun m!730873 () Bool)

(assert (=> start!67898 m!730873))

(declare-fun m!730875 () Bool)

(assert (=> start!67898 m!730875))

(declare-fun m!730877 () Bool)

(assert (=> b!789855 m!730877))

(declare-fun m!730879 () Bool)

(assert (=> b!789872 m!730879))

(declare-fun m!730881 () Bool)

(assert (=> b!789872 m!730881))

(declare-fun m!730883 () Bool)

(assert (=> b!789872 m!730883))

(declare-fun m!730885 () Bool)

(assert (=> b!789872 m!730885))

(declare-fun m!730887 () Bool)

(assert (=> b!789872 m!730887))

(assert (=> b!789872 m!730879))

(declare-fun m!730889 () Bool)

(assert (=> b!789870 m!730889))

(assert (=> b!789875 m!730861))

(assert (=> b!789875 m!730861))

(declare-fun m!730891 () Bool)

(assert (=> b!789875 m!730891))

(assert (=> b!789875 m!730891))

(assert (=> b!789875 m!730861))

(declare-fun m!730893 () Bool)

(assert (=> b!789875 m!730893))

(assert (=> b!789873 m!730861))

(assert (=> b!789873 m!730861))

(declare-fun m!730895 () Bool)

(assert (=> b!789873 m!730895))

(assert (=> b!789865 m!730861))

(assert (=> b!789865 m!730861))

(assert (=> b!789865 m!730895))

(assert (=> b!789876 m!730885))

(declare-fun m!730897 () Bool)

(assert (=> b!789876 m!730897))

(declare-fun m!730899 () Bool)

(assert (=> b!789858 m!730899))

(declare-fun m!730901 () Bool)

(assert (=> b!789874 m!730901))

(declare-fun m!730903 () Bool)

(assert (=> b!789869 m!730903))

(declare-fun m!730905 () Bool)

(assert (=> b!789864 m!730905))

(assert (=> b!789857 m!730861))

(assert (=> b!789857 m!730861))

(declare-fun m!730907 () Bool)

(assert (=> b!789857 m!730907))

(declare-fun m!730909 () Bool)

(assert (=> b!789857 m!730909))

(declare-fun m!730911 () Bool)

(assert (=> b!789857 m!730911))

(assert (=> b!789868 m!730861))

(assert (=> b!789868 m!730861))

(declare-fun m!730913 () Bool)

(assert (=> b!789868 m!730913))

(declare-fun m!730915 () Bool)

(assert (=> b!789867 m!730915))

(check-sat (not b!789870) (not start!67898) (not b!789868) (not b!789873) (not b!789872) (not b!789865) (not b!789864) (not b!789855) (not b!789875) (not b!789861) (not b!789863) (not b!789866) (not b!789857) (not b!789867) (not b!789858) (not b!789874))
(check-sat)
