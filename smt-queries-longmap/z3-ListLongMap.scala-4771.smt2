; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65814 () Bool)

(assert start!65814)

(declare-fun b!753825 () Bool)

(declare-fun res!508990 () Bool)

(declare-fun e!420520 () Bool)

(assert (=> b!753825 (=> (not res!508990) (not e!420520))))

(declare-fun e!420526 () Bool)

(assert (=> b!753825 (= res!508990 e!420526)))

(declare-fun c!82810 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753825 (= c!82810 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753826 () Bool)

(declare-fun res!508975 () Bool)

(declare-fun e!420531 () Bool)

(assert (=> b!753826 (=> (not res!508975) (not e!420531))))

(declare-datatypes ((array!41857 0))(
  ( (array!41858 (arr!20038 (Array (_ BitVec 32) (_ BitVec 64))) (size!20458 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41857)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753826 (= res!508975 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!753827 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7594 0))(
  ( (MissingZero!7594 (index!32744 (_ BitVec 32))) (Found!7594 (index!32745 (_ BitVec 32))) (Intermediate!7594 (undefined!8406 Bool) (index!32746 (_ BitVec 32)) (x!63820 (_ BitVec 32))) (Undefined!7594) (MissingVacant!7594 (index!32747 (_ BitVec 32))) )
))
(declare-fun lt!335358 () SeekEntryResult!7594)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41857 (_ BitVec 32)) SeekEntryResult!7594)

(assert (=> b!753827 (= e!420526 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20038 a!3186) j!159) a!3186 mask!3328) lt!335358))))

(declare-fun b!753828 () Bool)

(declare-fun res!508982 () Bool)

(assert (=> b!753828 (=> (not res!508982) (not e!420520))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753828 (= res!508982 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20038 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753829 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41857 (_ BitVec 32)) SeekEntryResult!7594)

(assert (=> b!753829 (= e!420526 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20038 a!3186) j!159) a!3186 mask!3328) (Found!7594 j!159)))))

(declare-fun b!753830 () Bool)

(declare-fun res!508974 () Bool)

(declare-fun e!420528 () Bool)

(assert (=> b!753830 (=> (not res!508974) (not e!420528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41857 (_ BitVec 32)) Bool)

(assert (=> b!753830 (= res!508974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753831 () Bool)

(declare-fun e!420527 () Bool)

(assert (=> b!753831 (= e!420527 true)))

(declare-fun e!420524 () Bool)

(assert (=> b!753831 e!420524))

(declare-fun res!508987 () Bool)

(assert (=> b!753831 (=> (not res!508987) (not e!420524))))

(declare-fun lt!335355 () (_ BitVec 64))

(assert (=> b!753831 (= res!508987 (= lt!335355 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25933 0))(
  ( (Unit!25934) )
))
(declare-fun lt!335352 () Unit!25933)

(declare-fun e!420530 () Unit!25933)

(assert (=> b!753831 (= lt!335352 e!420530)))

(declare-fun c!82811 () Bool)

(assert (=> b!753831 (= c!82811 (= lt!335355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!508973 () Bool)

(assert (=> start!65814 (=> (not res!508973) (not e!420531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65814 (= res!508973 (validMask!0 mask!3328))))

(assert (=> start!65814 e!420531))

(assert (=> start!65814 true))

(declare-fun array_inv!15897 (array!41857) Bool)

(assert (=> start!65814 (array_inv!15897 a!3186)))

(declare-fun b!753832 () Bool)

(declare-fun res!508979 () Bool)

(assert (=> b!753832 (=> (not res!508979) (not e!420528))))

(declare-datatypes ((List!13947 0))(
  ( (Nil!13944) (Cons!13943 (h!15021 (_ BitVec 64)) (t!20254 List!13947)) )
))
(declare-fun arrayNoDuplicates!0 (array!41857 (_ BitVec 32) List!13947) Bool)

(assert (=> b!753832 (= res!508979 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13944))))

(declare-fun b!753833 () Bool)

(declare-fun Unit!25935 () Unit!25933)

(assert (=> b!753833 (= e!420530 Unit!25935)))

(declare-fun e!420529 () Bool)

(declare-fun lt!335350 () SeekEntryResult!7594)

(declare-fun b!753834 () Bool)

(assert (=> b!753834 (= e!420529 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20038 a!3186) j!159) a!3186 mask!3328) lt!335350))))

(declare-fun b!753835 () Bool)

(declare-fun e!420525 () Bool)

(declare-fun e!420523 () Bool)

(assert (=> b!753835 (= e!420525 (not e!420523))))

(declare-fun res!508986 () Bool)

(assert (=> b!753835 (=> res!508986 e!420523)))

(declare-fun lt!335351 () SeekEntryResult!7594)

(get-info :version)

(assert (=> b!753835 (= res!508986 (or (not ((_ is Intermediate!7594) lt!335351)) (bvslt x!1131 (x!63820 lt!335351)) (not (= x!1131 (x!63820 lt!335351))) (not (= index!1321 (index!32746 lt!335351)))))))

(assert (=> b!753835 e!420529))

(declare-fun res!508977 () Bool)

(assert (=> b!753835 (=> (not res!508977) (not e!420529))))

(declare-fun lt!335354 () SeekEntryResult!7594)

(assert (=> b!753835 (= res!508977 (= lt!335354 lt!335350))))

(assert (=> b!753835 (= lt!335350 (Found!7594 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41857 (_ BitVec 32)) SeekEntryResult!7594)

(assert (=> b!753835 (= lt!335354 (seekEntryOrOpen!0 (select (arr!20038 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753835 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335356 () Unit!25933)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25933)

(assert (=> b!753835 (= lt!335356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753836 () Bool)

(declare-fun e!420522 () Bool)

(assert (=> b!753836 (= e!420523 e!420522)))

(declare-fun res!508988 () Bool)

(assert (=> b!753836 (=> res!508988 e!420522)))

(declare-fun lt!335353 () SeekEntryResult!7594)

(assert (=> b!753836 (= res!508988 (not (= lt!335353 lt!335350)))))

(assert (=> b!753836 (= lt!335353 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20038 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753837 () Bool)

(declare-fun res!508984 () Bool)

(assert (=> b!753837 (=> (not res!508984) (not e!420531))))

(assert (=> b!753837 (= res!508984 (and (= (size!20458 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20458 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20458 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753838 () Bool)

(assert (=> b!753838 (= e!420524 (= lt!335354 lt!335353))))

(declare-fun b!753839 () Bool)

(declare-fun res!508978 () Bool)

(assert (=> b!753839 (=> (not res!508978) (not e!420531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753839 (= res!508978 (validKeyInArray!0 k0!2102))))

(declare-fun b!753840 () Bool)

(declare-fun Unit!25936 () Unit!25933)

(assert (=> b!753840 (= e!420530 Unit!25936)))

(assert (=> b!753840 false))

(declare-fun b!753841 () Bool)

(declare-fun res!508981 () Bool)

(assert (=> b!753841 (=> (not res!508981) (not e!420524))))

(declare-fun lt!335348 () array!41857)

(declare-fun lt!335349 () (_ BitVec 64))

(assert (=> b!753841 (= res!508981 (= (seekEntryOrOpen!0 lt!335349 lt!335348 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335349 lt!335348 mask!3328)))))

(declare-fun b!753842 () Bool)

(assert (=> b!753842 (= e!420522 e!420527)))

(declare-fun res!508989 () Bool)

(assert (=> b!753842 (=> res!508989 e!420527)))

(assert (=> b!753842 (= res!508989 (= lt!335355 lt!335349))))

(assert (=> b!753842 (= lt!335355 (select (store (arr!20038 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753843 () Bool)

(declare-fun res!508985 () Bool)

(assert (=> b!753843 (=> (not res!508985) (not e!420531))))

(assert (=> b!753843 (= res!508985 (validKeyInArray!0 (select (arr!20038 a!3186) j!159)))))

(declare-fun b!753844 () Bool)

(assert (=> b!753844 (= e!420520 e!420525)))

(declare-fun res!508983 () Bool)

(assert (=> b!753844 (=> (not res!508983) (not e!420525))))

(declare-fun lt!335357 () SeekEntryResult!7594)

(assert (=> b!753844 (= res!508983 (= lt!335357 lt!335351))))

(assert (=> b!753844 (= lt!335351 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335349 lt!335348 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753844 (= lt!335357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335349 mask!3328) lt!335349 lt!335348 mask!3328))))

(assert (=> b!753844 (= lt!335349 (select (store (arr!20038 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753844 (= lt!335348 (array!41858 (store (arr!20038 a!3186) i!1173 k0!2102) (size!20458 a!3186)))))

(declare-fun b!753845 () Bool)

(assert (=> b!753845 (= e!420531 e!420528)))

(declare-fun res!508972 () Bool)

(assert (=> b!753845 (=> (not res!508972) (not e!420528))))

(declare-fun lt!335347 () SeekEntryResult!7594)

(assert (=> b!753845 (= res!508972 (or (= lt!335347 (MissingZero!7594 i!1173)) (= lt!335347 (MissingVacant!7594 i!1173))))))

(assert (=> b!753845 (= lt!335347 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753846 () Bool)

(assert (=> b!753846 (= e!420528 e!420520)))

(declare-fun res!508980 () Bool)

(assert (=> b!753846 (=> (not res!508980) (not e!420520))))

(assert (=> b!753846 (= res!508980 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20038 a!3186) j!159) mask!3328) (select (arr!20038 a!3186) j!159) a!3186 mask!3328) lt!335358))))

(assert (=> b!753846 (= lt!335358 (Intermediate!7594 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753847 () Bool)

(declare-fun res!508976 () Bool)

(assert (=> b!753847 (=> (not res!508976) (not e!420528))))

(assert (=> b!753847 (= res!508976 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20458 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20458 a!3186))))))

(assert (= (and start!65814 res!508973) b!753837))

(assert (= (and b!753837 res!508984) b!753843))

(assert (= (and b!753843 res!508985) b!753839))

(assert (= (and b!753839 res!508978) b!753826))

(assert (= (and b!753826 res!508975) b!753845))

(assert (= (and b!753845 res!508972) b!753830))

(assert (= (and b!753830 res!508974) b!753832))

(assert (= (and b!753832 res!508979) b!753847))

(assert (= (and b!753847 res!508976) b!753846))

(assert (= (and b!753846 res!508980) b!753828))

(assert (= (and b!753828 res!508982) b!753825))

(assert (= (and b!753825 c!82810) b!753827))

(assert (= (and b!753825 (not c!82810)) b!753829))

(assert (= (and b!753825 res!508990) b!753844))

(assert (= (and b!753844 res!508983) b!753835))

(assert (= (and b!753835 res!508977) b!753834))

(assert (= (and b!753835 (not res!508986)) b!753836))

(assert (= (and b!753836 (not res!508988)) b!753842))

(assert (= (and b!753842 (not res!508989)) b!753831))

(assert (= (and b!753831 c!82811) b!753840))

(assert (= (and b!753831 (not c!82811)) b!753833))

(assert (= (and b!753831 res!508987) b!753841))

(assert (= (and b!753841 res!508981) b!753838))

(declare-fun m!703023 () Bool)

(assert (=> b!753841 m!703023))

(declare-fun m!703025 () Bool)

(assert (=> b!753841 m!703025))

(declare-fun m!703027 () Bool)

(assert (=> b!753843 m!703027))

(assert (=> b!753843 m!703027))

(declare-fun m!703029 () Bool)

(assert (=> b!753843 m!703029))

(assert (=> b!753846 m!703027))

(assert (=> b!753846 m!703027))

(declare-fun m!703031 () Bool)

(assert (=> b!753846 m!703031))

(assert (=> b!753846 m!703031))

(assert (=> b!753846 m!703027))

(declare-fun m!703033 () Bool)

(assert (=> b!753846 m!703033))

(declare-fun m!703035 () Bool)

(assert (=> b!753844 m!703035))

(declare-fun m!703037 () Bool)

(assert (=> b!753844 m!703037))

(assert (=> b!753844 m!703035))

(declare-fun m!703039 () Bool)

(assert (=> b!753844 m!703039))

(declare-fun m!703041 () Bool)

(assert (=> b!753844 m!703041))

(declare-fun m!703043 () Bool)

(assert (=> b!753844 m!703043))

(declare-fun m!703045 () Bool)

(assert (=> b!753826 m!703045))

(declare-fun m!703047 () Bool)

(assert (=> b!753845 m!703047))

(declare-fun m!703049 () Bool)

(assert (=> b!753839 m!703049))

(declare-fun m!703051 () Bool)

(assert (=> b!753830 m!703051))

(assert (=> b!753827 m!703027))

(assert (=> b!753827 m!703027))

(declare-fun m!703053 () Bool)

(assert (=> b!753827 m!703053))

(assert (=> b!753842 m!703039))

(declare-fun m!703055 () Bool)

(assert (=> b!753842 m!703055))

(declare-fun m!703057 () Bool)

(assert (=> start!65814 m!703057))

(declare-fun m!703059 () Bool)

(assert (=> start!65814 m!703059))

(assert (=> b!753836 m!703027))

(assert (=> b!753836 m!703027))

(declare-fun m!703061 () Bool)

(assert (=> b!753836 m!703061))

(assert (=> b!753835 m!703027))

(assert (=> b!753835 m!703027))

(declare-fun m!703063 () Bool)

(assert (=> b!753835 m!703063))

(declare-fun m!703065 () Bool)

(assert (=> b!753835 m!703065))

(declare-fun m!703067 () Bool)

(assert (=> b!753835 m!703067))

(assert (=> b!753834 m!703027))

(assert (=> b!753834 m!703027))

(declare-fun m!703069 () Bool)

(assert (=> b!753834 m!703069))

(declare-fun m!703071 () Bool)

(assert (=> b!753828 m!703071))

(declare-fun m!703073 () Bool)

(assert (=> b!753832 m!703073))

(assert (=> b!753829 m!703027))

(assert (=> b!753829 m!703027))

(assert (=> b!753829 m!703061))

(check-sat (not b!753835) (not b!753834) (not b!753836) (not b!753845) (not b!753843) (not b!753841) (not b!753829) (not start!65814) (not b!753830) (not b!753826) (not b!753844) (not b!753839) (not b!753832) (not b!753846) (not b!753827))
(check-sat)
