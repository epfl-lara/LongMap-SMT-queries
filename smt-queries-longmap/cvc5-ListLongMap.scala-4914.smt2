; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67728 () Bool)

(assert start!67728)

(declare-fun b!785828 () Bool)

(declare-fun e!436868 () Bool)

(assert (=> b!785828 (= e!436868 true)))

(declare-fun e!436864 () Bool)

(assert (=> b!785828 e!436864))

(declare-fun res!531986 () Bool)

(assert (=> b!785828 (=> (not res!531986) (not e!436864))))

(declare-fun lt!350414 () (_ BitVec 64))

(assert (=> b!785828 (= res!531986 (= lt!350414 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27176 0))(
  ( (Unit!27177) )
))
(declare-fun lt!350416 () Unit!27176)

(declare-fun e!436865 () Unit!27176)

(assert (=> b!785828 (= lt!350416 e!436865)))

(declare-fun c!87331 () Bool)

(assert (=> b!785828 (= c!87331 (= lt!350414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785829 () Bool)

(declare-fun res!531983 () Bool)

(declare-fun e!436857 () Bool)

(assert (=> b!785829 (=> (not res!531983) (not e!436857))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42768 0))(
  ( (array!42769 (arr!20472 (Array (_ BitVec 32) (_ BitVec 64))) (size!20893 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42768)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785829 (= res!531983 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20893 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20893 a!3186))))))

(declare-fun b!785830 () Bool)

(declare-datatypes ((SeekEntryResult!8072 0))(
  ( (MissingZero!8072 (index!34656 (_ BitVec 32))) (Found!8072 (index!34657 (_ BitVec 32))) (Intermediate!8072 (undefined!8884 Bool) (index!34658 (_ BitVec 32)) (x!65604 (_ BitVec 32))) (Undefined!8072) (MissingVacant!8072 (index!34659 (_ BitVec 32))) )
))
(declare-fun lt!350410 () SeekEntryResult!8072)

(declare-fun lt!350418 () SeekEntryResult!8072)

(assert (=> b!785830 (= e!436864 (= lt!350410 lt!350418))))

(declare-fun b!785831 () Bool)

(declare-fun lt!350409 () SeekEntryResult!8072)

(declare-fun e!436863 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42768 (_ BitVec 32)) SeekEntryResult!8072)

(assert (=> b!785831 (= e!436863 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20472 a!3186) j!159) a!3186 mask!3328) lt!350409))))

(declare-fun b!785832 () Bool)

(declare-fun res!531994 () Bool)

(declare-fun e!436867 () Bool)

(assert (=> b!785832 (=> (not res!531994) (not e!436867))))

(assert (=> b!785832 (= res!531994 e!436863)))

(declare-fun c!87330 () Bool)

(assert (=> b!785832 (= c!87330 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785833 () Bool)

(assert (=> b!785833 (= e!436857 e!436867)))

(declare-fun res!531988 () Bool)

(assert (=> b!785833 (=> (not res!531988) (not e!436867))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785833 (= res!531988 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20472 a!3186) j!159) mask!3328) (select (arr!20472 a!3186) j!159) a!3186 mask!3328) lt!350409))))

(assert (=> b!785833 (= lt!350409 (Intermediate!8072 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785834 () Bool)

(declare-fun res!531985 () Bool)

(assert (=> b!785834 (=> (not res!531985) (not e!436857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42768 (_ BitVec 32)) Bool)

(assert (=> b!785834 (= res!531985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785835 () Bool)

(declare-fun res!531990 () Bool)

(declare-fun e!436858 () Bool)

(assert (=> b!785835 (=> (not res!531990) (not e!436858))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785835 (= res!531990 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785836 () Bool)

(declare-fun res!531993 () Bool)

(assert (=> b!785836 (=> (not res!531993) (not e!436867))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785836 (= res!531993 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20472 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785837 () Bool)

(declare-fun e!436861 () Bool)

(assert (=> b!785837 (= e!436861 e!436868)))

(declare-fun res!531995 () Bool)

(assert (=> b!785837 (=> res!531995 e!436868)))

(declare-fun lt!350420 () (_ BitVec 64))

(assert (=> b!785837 (= res!531995 (= lt!350414 lt!350420))))

(assert (=> b!785837 (= lt!350414 (select (store (arr!20472 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!785838 () Bool)

(declare-fun res!531984 () Bool)

(assert (=> b!785838 (=> (not res!531984) (not e!436858))))

(assert (=> b!785838 (= res!531984 (and (= (size!20893 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20893 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20893 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785839 () Bool)

(declare-fun res!531987 () Bool)

(assert (=> b!785839 (=> (not res!531987) (not e!436864))))

(declare-fun lt!350417 () array!42768)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42768 (_ BitVec 32)) SeekEntryResult!8072)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42768 (_ BitVec 32)) SeekEntryResult!8072)

(assert (=> b!785839 (= res!531987 (= (seekEntryOrOpen!0 lt!350420 lt!350417 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350420 lt!350417 mask!3328)))))

(declare-fun b!785840 () Bool)

(declare-fun Unit!27178 () Unit!27176)

(assert (=> b!785840 (= e!436865 Unit!27178)))

(assert (=> b!785840 false))

(declare-fun b!785841 () Bool)

(declare-fun res!531991 () Bool)

(assert (=> b!785841 (=> (not res!531991) (not e!436858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785841 (= res!531991 (validKeyInArray!0 (select (arr!20472 a!3186) j!159)))))

(declare-fun res!531996 () Bool)

(assert (=> start!67728 (=> (not res!531996) (not e!436858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67728 (= res!531996 (validMask!0 mask!3328))))

(assert (=> start!67728 e!436858))

(assert (=> start!67728 true))

(declare-fun array_inv!16268 (array!42768) Bool)

(assert (=> start!67728 (array_inv!16268 a!3186)))

(declare-fun b!785842 () Bool)

(declare-fun lt!350413 () SeekEntryResult!8072)

(declare-fun e!436862 () Bool)

(assert (=> b!785842 (= e!436862 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20472 a!3186) j!159) a!3186 mask!3328) lt!350413))))

(declare-fun b!785843 () Bool)

(declare-fun Unit!27179 () Unit!27176)

(assert (=> b!785843 (= e!436865 Unit!27179)))

(declare-fun b!785844 () Bool)

(assert (=> b!785844 (= e!436863 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20472 a!3186) j!159) a!3186 mask!3328) (Found!8072 j!159)))))

(declare-fun b!785845 () Bool)

(declare-fun e!436866 () Bool)

(assert (=> b!785845 (= e!436866 e!436861)))

(declare-fun res!531999 () Bool)

(assert (=> b!785845 (=> res!531999 e!436861)))

(assert (=> b!785845 (= res!531999 (not (= lt!350418 lt!350413)))))

(assert (=> b!785845 (= lt!350418 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20472 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785846 () Bool)

(declare-fun res!531989 () Bool)

(assert (=> b!785846 (=> (not res!531989) (not e!436858))))

(assert (=> b!785846 (= res!531989 (validKeyInArray!0 k!2102))))

(declare-fun b!785847 () Bool)

(declare-fun e!436859 () Bool)

(assert (=> b!785847 (= e!436867 e!436859)))

(declare-fun res!532000 () Bool)

(assert (=> b!785847 (=> (not res!532000) (not e!436859))))

(declare-fun lt!350411 () SeekEntryResult!8072)

(declare-fun lt!350415 () SeekEntryResult!8072)

(assert (=> b!785847 (= res!532000 (= lt!350411 lt!350415))))

(assert (=> b!785847 (= lt!350415 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350420 lt!350417 mask!3328))))

(assert (=> b!785847 (= lt!350411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350420 mask!3328) lt!350420 lt!350417 mask!3328))))

(assert (=> b!785847 (= lt!350420 (select (store (arr!20472 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!785847 (= lt!350417 (array!42769 (store (arr!20472 a!3186) i!1173 k!2102) (size!20893 a!3186)))))

(declare-fun b!785848 () Bool)

(assert (=> b!785848 (= e!436859 (not e!436866))))

(declare-fun res!531997 () Bool)

(assert (=> b!785848 (=> res!531997 e!436866)))

(assert (=> b!785848 (= res!531997 (or (not (is-Intermediate!8072 lt!350415)) (bvslt x!1131 (x!65604 lt!350415)) (not (= x!1131 (x!65604 lt!350415))) (not (= index!1321 (index!34658 lt!350415)))))))

(assert (=> b!785848 e!436862))

(declare-fun res!532001 () Bool)

(assert (=> b!785848 (=> (not res!532001) (not e!436862))))

(assert (=> b!785848 (= res!532001 (= lt!350410 lt!350413))))

(assert (=> b!785848 (= lt!350413 (Found!8072 j!159))))

(assert (=> b!785848 (= lt!350410 (seekEntryOrOpen!0 (select (arr!20472 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785848 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350412 () Unit!27176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27176)

(assert (=> b!785848 (= lt!350412 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785849 () Bool)

(declare-fun res!531998 () Bool)

(assert (=> b!785849 (=> (not res!531998) (not e!436857))))

(declare-datatypes ((List!14474 0))(
  ( (Nil!14471) (Cons!14470 (h!15593 (_ BitVec 64)) (t!20789 List!14474)) )
))
(declare-fun arrayNoDuplicates!0 (array!42768 (_ BitVec 32) List!14474) Bool)

(assert (=> b!785849 (= res!531998 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14471))))

(declare-fun b!785850 () Bool)

(assert (=> b!785850 (= e!436858 e!436857)))

(declare-fun res!531992 () Bool)

(assert (=> b!785850 (=> (not res!531992) (not e!436857))))

(declare-fun lt!350419 () SeekEntryResult!8072)

(assert (=> b!785850 (= res!531992 (or (= lt!350419 (MissingZero!8072 i!1173)) (= lt!350419 (MissingVacant!8072 i!1173))))))

(assert (=> b!785850 (= lt!350419 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!67728 res!531996) b!785838))

(assert (= (and b!785838 res!531984) b!785841))

(assert (= (and b!785841 res!531991) b!785846))

(assert (= (and b!785846 res!531989) b!785835))

(assert (= (and b!785835 res!531990) b!785850))

(assert (= (and b!785850 res!531992) b!785834))

(assert (= (and b!785834 res!531985) b!785849))

(assert (= (and b!785849 res!531998) b!785829))

(assert (= (and b!785829 res!531983) b!785833))

(assert (= (and b!785833 res!531988) b!785836))

(assert (= (and b!785836 res!531993) b!785832))

(assert (= (and b!785832 c!87330) b!785831))

(assert (= (and b!785832 (not c!87330)) b!785844))

(assert (= (and b!785832 res!531994) b!785847))

(assert (= (and b!785847 res!532000) b!785848))

(assert (= (and b!785848 res!532001) b!785842))

(assert (= (and b!785848 (not res!531997)) b!785845))

(assert (= (and b!785845 (not res!531999)) b!785837))

(assert (= (and b!785837 (not res!531995)) b!785828))

(assert (= (and b!785828 c!87331) b!785840))

(assert (= (and b!785828 (not c!87331)) b!785843))

(assert (= (and b!785828 res!531986) b!785839))

(assert (= (and b!785839 res!531987) b!785830))

(declare-fun m!727805 () Bool)

(assert (=> b!785846 m!727805))

(declare-fun m!727807 () Bool)

(assert (=> b!785833 m!727807))

(assert (=> b!785833 m!727807))

(declare-fun m!727809 () Bool)

(assert (=> b!785833 m!727809))

(assert (=> b!785833 m!727809))

(assert (=> b!785833 m!727807))

(declare-fun m!727811 () Bool)

(assert (=> b!785833 m!727811))

(assert (=> b!785831 m!727807))

(assert (=> b!785831 m!727807))

(declare-fun m!727813 () Bool)

(assert (=> b!785831 m!727813))

(declare-fun m!727815 () Bool)

(assert (=> b!785836 m!727815))

(declare-fun m!727817 () Bool)

(assert (=> b!785847 m!727817))

(declare-fun m!727819 () Bool)

(assert (=> b!785847 m!727819))

(declare-fun m!727821 () Bool)

(assert (=> b!785847 m!727821))

(declare-fun m!727823 () Bool)

(assert (=> b!785847 m!727823))

(declare-fun m!727825 () Bool)

(assert (=> b!785847 m!727825))

(assert (=> b!785847 m!727817))

(assert (=> b!785844 m!727807))

(assert (=> b!785844 m!727807))

(declare-fun m!727827 () Bool)

(assert (=> b!785844 m!727827))

(declare-fun m!727829 () Bool)

(assert (=> b!785849 m!727829))

(declare-fun m!727831 () Bool)

(assert (=> start!67728 m!727831))

(declare-fun m!727833 () Bool)

(assert (=> start!67728 m!727833))

(declare-fun m!727835 () Bool)

(assert (=> b!785839 m!727835))

(declare-fun m!727837 () Bool)

(assert (=> b!785839 m!727837))

(declare-fun m!727839 () Bool)

(assert (=> b!785850 m!727839))

(assert (=> b!785845 m!727807))

(assert (=> b!785845 m!727807))

(assert (=> b!785845 m!727827))

(declare-fun m!727841 () Bool)

(assert (=> b!785835 m!727841))

(declare-fun m!727843 () Bool)

(assert (=> b!785834 m!727843))

(assert (=> b!785837 m!727821))

(declare-fun m!727845 () Bool)

(assert (=> b!785837 m!727845))

(assert (=> b!785848 m!727807))

(assert (=> b!785848 m!727807))

(declare-fun m!727847 () Bool)

(assert (=> b!785848 m!727847))

(declare-fun m!727849 () Bool)

(assert (=> b!785848 m!727849))

(declare-fun m!727851 () Bool)

(assert (=> b!785848 m!727851))

(assert (=> b!785841 m!727807))

(assert (=> b!785841 m!727807))

(declare-fun m!727853 () Bool)

(assert (=> b!785841 m!727853))

(assert (=> b!785842 m!727807))

(assert (=> b!785842 m!727807))

(declare-fun m!727855 () Bool)

(assert (=> b!785842 m!727855))

(push 1)

