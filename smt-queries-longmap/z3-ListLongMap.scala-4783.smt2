; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65886 () Bool)

(assert start!65886)

(declare-datatypes ((array!41929 0))(
  ( (array!41930 (arr!20074 (Array (_ BitVec 32) (_ BitVec 64))) (size!20494 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41929)

(declare-datatypes ((SeekEntryResult!7630 0))(
  ( (MissingZero!7630 (index!32888 (_ BitVec 32))) (Found!7630 (index!32889 (_ BitVec 32))) (Intermediate!7630 (undefined!8442 Bool) (index!32890 (_ BitVec 32)) (x!63952 (_ BitVec 32))) (Undefined!7630) (MissingVacant!7630 (index!32891 (_ BitVec 32))) )
))
(declare-fun lt!336652 () SeekEntryResult!7630)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!421821 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!756309 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41929 (_ BitVec 32)) SeekEntryResult!7630)

(assert (=> b!756309 (= e!421821 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20074 a!3186) j!159) a!3186 mask!3328) lt!336652))))

(declare-fun b!756310 () Bool)

(declare-fun e!421818 () Bool)

(declare-fun e!421820 () Bool)

(assert (=> b!756310 (= e!421818 (not e!421820))))

(declare-fun res!511031 () Bool)

(assert (=> b!756310 (=> res!511031 e!421820)))

(declare-fun lt!336649 () SeekEntryResult!7630)

(get-info :version)

(assert (=> b!756310 (= res!511031 (or (not ((_ is Intermediate!7630) lt!336649)) (bvslt x!1131 (x!63952 lt!336649)) (not (= x!1131 (x!63952 lt!336649))) (not (= index!1321 (index!32890 lt!336649)))))))

(declare-fun e!421824 () Bool)

(assert (=> b!756310 e!421824))

(declare-fun res!511027 () Bool)

(assert (=> b!756310 (=> (not res!511027) (not e!421824))))

(declare-fun lt!336651 () SeekEntryResult!7630)

(declare-fun lt!336647 () SeekEntryResult!7630)

(assert (=> b!756310 (= res!511027 (= lt!336651 lt!336647))))

(assert (=> b!756310 (= lt!336647 (Found!7630 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41929 (_ BitVec 32)) SeekEntryResult!7630)

(assert (=> b!756310 (= lt!336651 (seekEntryOrOpen!0 (select (arr!20074 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41929 (_ BitVec 32)) Bool)

(assert (=> b!756310 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26077 0))(
  ( (Unit!26078) )
))
(declare-fun lt!336648 () Unit!26077)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26077)

(assert (=> b!756310 (= lt!336648 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756311 () Bool)

(declare-fun e!421819 () Bool)

(assert (=> b!756311 (= e!421819 e!421818)))

(declare-fun res!511036 () Bool)

(assert (=> b!756311 (=> (not res!511036) (not e!421818))))

(declare-fun lt!336650 () SeekEntryResult!7630)

(assert (=> b!756311 (= res!511036 (= lt!336650 lt!336649))))

(declare-fun lt!336646 () array!41929)

(declare-fun lt!336644 () (_ BitVec 64))

(assert (=> b!756311 (= lt!336649 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336644 lt!336646 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756311 (= lt!336650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336644 mask!3328) lt!336644 lt!336646 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!756311 (= lt!336644 (select (store (arr!20074 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756311 (= lt!336646 (array!41930 (store (arr!20074 a!3186) i!1173 k0!2102) (size!20494 a!3186)))))

(declare-fun b!756312 () Bool)

(declare-fun res!511029 () Bool)

(declare-fun e!421822 () Bool)

(assert (=> b!756312 (=> (not res!511029) (not e!421822))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41929 (_ BitVec 32)) SeekEntryResult!7630)

(assert (=> b!756312 (= res!511029 (= (seekEntryOrOpen!0 lt!336644 lt!336646 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336644 lt!336646 mask!3328)))))

(declare-fun res!511037 () Bool)

(declare-fun e!421817 () Bool)

(assert (=> start!65886 (=> (not res!511037) (not e!421817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65886 (= res!511037 (validMask!0 mask!3328))))

(assert (=> start!65886 e!421817))

(assert (=> start!65886 true))

(declare-fun array_inv!15933 (array!41929) Bool)

(assert (=> start!65886 (array_inv!15933 a!3186)))

(declare-fun b!756313 () Bool)

(declare-fun res!511040 () Bool)

(assert (=> b!756313 (=> (not res!511040) (not e!421817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756313 (= res!511040 (validKeyInArray!0 k0!2102))))

(declare-fun b!756314 () Bool)

(declare-fun e!421823 () Bool)

(declare-fun e!421825 () Bool)

(assert (=> b!756314 (= e!421823 e!421825)))

(declare-fun res!511035 () Bool)

(assert (=> b!756314 (=> res!511035 e!421825)))

(declare-fun lt!336645 () (_ BitVec 64))

(assert (=> b!756314 (= res!511035 (= lt!336645 lt!336644))))

(assert (=> b!756314 (= lt!336645 (select (store (arr!20074 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756315 () Bool)

(declare-fun lt!336643 () SeekEntryResult!7630)

(assert (=> b!756315 (= e!421822 (= lt!336651 lt!336643))))

(declare-fun b!756316 () Bool)

(assert (=> b!756316 (= e!421825 true)))

(assert (=> b!756316 e!421822))

(declare-fun res!511024 () Bool)

(assert (=> b!756316 (=> (not res!511024) (not e!421822))))

(assert (=> b!756316 (= res!511024 (= lt!336645 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336653 () Unit!26077)

(declare-fun e!421826 () Unit!26077)

(assert (=> b!756316 (= lt!336653 e!421826)))

(declare-fun c!83027 () Bool)

(assert (=> b!756316 (= c!83027 (= lt!336645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756317 () Bool)

(declare-fun Unit!26079 () Unit!26077)

(assert (=> b!756317 (= e!421826 Unit!26079)))

(declare-fun b!756318 () Bool)

(declare-fun res!511042 () Bool)

(declare-fun e!421816 () Bool)

(assert (=> b!756318 (=> (not res!511042) (not e!421816))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756318 (= res!511042 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20494 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20494 a!3186))))))

(declare-fun b!756319 () Bool)

(assert (=> b!756319 (= e!421821 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20074 a!3186) j!159) a!3186 mask!3328) (Found!7630 j!159)))))

(declare-fun b!756320 () Bool)

(declare-fun res!511039 () Bool)

(assert (=> b!756320 (=> (not res!511039) (not e!421816))))

(declare-datatypes ((List!13983 0))(
  ( (Nil!13980) (Cons!13979 (h!15057 (_ BitVec 64)) (t!20290 List!13983)) )
))
(declare-fun arrayNoDuplicates!0 (array!41929 (_ BitVec 32) List!13983) Bool)

(assert (=> b!756320 (= res!511039 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13980))))

(declare-fun b!756321 () Bool)

(declare-fun res!511041 () Bool)

(assert (=> b!756321 (=> (not res!511041) (not e!421817))))

(assert (=> b!756321 (= res!511041 (validKeyInArray!0 (select (arr!20074 a!3186) j!159)))))

(declare-fun b!756322 () Bool)

(assert (=> b!756322 (= e!421820 e!421823)))

(declare-fun res!511034 () Bool)

(assert (=> b!756322 (=> res!511034 e!421823)))

(assert (=> b!756322 (= res!511034 (not (= lt!336643 lt!336647)))))

(assert (=> b!756322 (= lt!336643 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20074 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756323 () Bool)

(declare-fun res!511038 () Bool)

(assert (=> b!756323 (=> (not res!511038) (not e!421816))))

(assert (=> b!756323 (= res!511038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756324 () Bool)

(assert (=> b!756324 (= e!421816 e!421819)))

(declare-fun res!511028 () Bool)

(assert (=> b!756324 (=> (not res!511028) (not e!421819))))

(assert (=> b!756324 (= res!511028 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20074 a!3186) j!159) mask!3328) (select (arr!20074 a!3186) j!159) a!3186 mask!3328) lt!336652))))

(assert (=> b!756324 (= lt!336652 (Intermediate!7630 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756325 () Bool)

(assert (=> b!756325 (= e!421824 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20074 a!3186) j!159) a!3186 mask!3328) lt!336647))))

(declare-fun b!756326 () Bool)

(declare-fun res!511032 () Bool)

(assert (=> b!756326 (=> (not res!511032) (not e!421817))))

(declare-fun arrayContainsKey!0 (array!41929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756326 (= res!511032 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756327 () Bool)

(declare-fun res!511030 () Bool)

(assert (=> b!756327 (=> (not res!511030) (not e!421817))))

(assert (=> b!756327 (= res!511030 (and (= (size!20494 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20494 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20494 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756328 () Bool)

(assert (=> b!756328 (= e!421817 e!421816)))

(declare-fun res!511026 () Bool)

(assert (=> b!756328 (=> (not res!511026) (not e!421816))))

(declare-fun lt!336654 () SeekEntryResult!7630)

(assert (=> b!756328 (= res!511026 (or (= lt!336654 (MissingZero!7630 i!1173)) (= lt!336654 (MissingVacant!7630 i!1173))))))

(assert (=> b!756328 (= lt!336654 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756329 () Bool)

(declare-fun res!511033 () Bool)

(assert (=> b!756329 (=> (not res!511033) (not e!421819))))

(assert (=> b!756329 (= res!511033 e!421821)))

(declare-fun c!83026 () Bool)

(assert (=> b!756329 (= c!83026 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756330 () Bool)

(declare-fun res!511025 () Bool)

(assert (=> b!756330 (=> (not res!511025) (not e!421819))))

(assert (=> b!756330 (= res!511025 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20074 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756331 () Bool)

(declare-fun Unit!26080 () Unit!26077)

(assert (=> b!756331 (= e!421826 Unit!26080)))

(assert (=> b!756331 false))

(assert (= (and start!65886 res!511037) b!756327))

(assert (= (and b!756327 res!511030) b!756321))

(assert (= (and b!756321 res!511041) b!756313))

(assert (= (and b!756313 res!511040) b!756326))

(assert (= (and b!756326 res!511032) b!756328))

(assert (= (and b!756328 res!511026) b!756323))

(assert (= (and b!756323 res!511038) b!756320))

(assert (= (and b!756320 res!511039) b!756318))

(assert (= (and b!756318 res!511042) b!756324))

(assert (= (and b!756324 res!511028) b!756330))

(assert (= (and b!756330 res!511025) b!756329))

(assert (= (and b!756329 c!83026) b!756309))

(assert (= (and b!756329 (not c!83026)) b!756319))

(assert (= (and b!756329 res!511033) b!756311))

(assert (= (and b!756311 res!511036) b!756310))

(assert (= (and b!756310 res!511027) b!756325))

(assert (= (and b!756310 (not res!511031)) b!756322))

(assert (= (and b!756322 (not res!511034)) b!756314))

(assert (= (and b!756314 (not res!511035)) b!756316))

(assert (= (and b!756316 c!83027) b!756331))

(assert (= (and b!756316 (not c!83027)) b!756317))

(assert (= (and b!756316 res!511024) b!756312))

(assert (= (and b!756312 res!511029) b!756315))

(declare-fun m!704895 () Bool)

(assert (=> b!756324 m!704895))

(assert (=> b!756324 m!704895))

(declare-fun m!704897 () Bool)

(assert (=> b!756324 m!704897))

(assert (=> b!756324 m!704897))

(assert (=> b!756324 m!704895))

(declare-fun m!704899 () Bool)

(assert (=> b!756324 m!704899))

(declare-fun m!704901 () Bool)

(assert (=> b!756320 m!704901))

(declare-fun m!704903 () Bool)

(assert (=> b!756313 m!704903))

(declare-fun m!704905 () Bool)

(assert (=> b!756312 m!704905))

(declare-fun m!704907 () Bool)

(assert (=> b!756312 m!704907))

(declare-fun m!704909 () Bool)

(assert (=> b!756326 m!704909))

(assert (=> b!756325 m!704895))

(assert (=> b!756325 m!704895))

(declare-fun m!704911 () Bool)

(assert (=> b!756325 m!704911))

(declare-fun m!704913 () Bool)

(assert (=> start!65886 m!704913))

(declare-fun m!704915 () Bool)

(assert (=> start!65886 m!704915))

(declare-fun m!704917 () Bool)

(assert (=> b!756314 m!704917))

(declare-fun m!704919 () Bool)

(assert (=> b!756314 m!704919))

(assert (=> b!756319 m!704895))

(assert (=> b!756319 m!704895))

(declare-fun m!704921 () Bool)

(assert (=> b!756319 m!704921))

(assert (=> b!756309 m!704895))

(assert (=> b!756309 m!704895))

(declare-fun m!704923 () Bool)

(assert (=> b!756309 m!704923))

(assert (=> b!756311 m!704917))

(declare-fun m!704925 () Bool)

(assert (=> b!756311 m!704925))

(declare-fun m!704927 () Bool)

(assert (=> b!756311 m!704927))

(declare-fun m!704929 () Bool)

(assert (=> b!756311 m!704929))

(assert (=> b!756311 m!704927))

(declare-fun m!704931 () Bool)

(assert (=> b!756311 m!704931))

(declare-fun m!704933 () Bool)

(assert (=> b!756323 m!704933))

(declare-fun m!704935 () Bool)

(assert (=> b!756330 m!704935))

(assert (=> b!756321 m!704895))

(assert (=> b!756321 m!704895))

(declare-fun m!704937 () Bool)

(assert (=> b!756321 m!704937))

(declare-fun m!704939 () Bool)

(assert (=> b!756328 m!704939))

(assert (=> b!756322 m!704895))

(assert (=> b!756322 m!704895))

(assert (=> b!756322 m!704921))

(assert (=> b!756310 m!704895))

(assert (=> b!756310 m!704895))

(declare-fun m!704941 () Bool)

(assert (=> b!756310 m!704941))

(declare-fun m!704943 () Bool)

(assert (=> b!756310 m!704943))

(declare-fun m!704945 () Bool)

(assert (=> b!756310 m!704945))

(check-sat (not b!756320) (not b!756319) (not b!756325) (not start!65886) (not b!756311) (not b!756313) (not b!756312) (not b!756309) (not b!756322) (not b!756323) (not b!756326) (not b!756321) (not b!756328) (not b!756310) (not b!756324))
(check-sat)
