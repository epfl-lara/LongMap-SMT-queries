; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65414 () Bool)

(assert start!65414)

(declare-fun b!744920 () Bool)

(declare-fun res!501976 () Bool)

(declare-fun e!416057 () Bool)

(assert (=> b!744920 (=> (not res!501976) (not e!416057))))

(declare-datatypes ((array!41604 0))(
  ( (array!41605 (arr!19916 (Array (_ BitVec 32) (_ BitVec 64))) (size!20337 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41604)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!744920 (= res!501976 (and (= (size!20337 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20337 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20337 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!501969 () Bool)

(assert (=> start!65414 (=> (not res!501969) (not e!416057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65414 (= res!501969 (validMask!0 mask!3328))))

(assert (=> start!65414 e!416057))

(assert (=> start!65414 true))

(declare-fun array_inv!15799 (array!41604) Bool)

(assert (=> start!65414 (array_inv!15799 a!3186)))

(declare-fun b!744921 () Bool)

(declare-fun e!416065 () Bool)

(declare-fun e!416059 () Bool)

(assert (=> b!744921 (= e!416065 e!416059)))

(declare-fun res!501975 () Bool)

(assert (=> b!744921 (=> (not res!501975) (not e!416059))))

(declare-datatypes ((SeekEntryResult!7513 0))(
  ( (MissingZero!7513 (index!32420 (_ BitVec 32))) (Found!7513 (index!32421 (_ BitVec 32))) (Intermediate!7513 (undefined!8325 Bool) (index!32422 (_ BitVec 32)) (x!63386 (_ BitVec 32))) (Undefined!7513) (MissingVacant!7513 (index!32423 (_ BitVec 32))) )
))
(declare-fun lt!330814 () SeekEntryResult!7513)

(declare-fun lt!330808 () SeekEntryResult!7513)

(assert (=> b!744921 (= res!501975 (= lt!330814 lt!330808))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!330811 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!330815 () array!41604)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41604 (_ BitVec 32)) SeekEntryResult!7513)

(assert (=> b!744921 (= lt!330808 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330811 lt!330815 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744921 (= lt!330814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330811 mask!3328) lt!330811 lt!330815 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!744921 (= lt!330811 (select (store (arr!19916 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744921 (= lt!330815 (array!41605 (store (arr!19916 a!3186) i!1173 k0!2102) (size!20337 a!3186)))))

(declare-fun b!744922 () Bool)

(declare-fun res!501967 () Bool)

(assert (=> b!744922 (=> (not res!501967) (not e!416057))))

(declare-fun arrayContainsKey!0 (array!41604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744922 (= res!501967 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744923 () Bool)

(declare-fun res!501966 () Bool)

(assert (=> b!744923 (=> (not res!501966) (not e!416065))))

(declare-fun e!416062 () Bool)

(assert (=> b!744923 (= res!501966 e!416062)))

(declare-fun c!81858 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744923 (= c!81858 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744924 () Bool)

(declare-fun res!501970 () Bool)

(assert (=> b!744924 (=> (not res!501970) (not e!416057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744924 (= res!501970 (validKeyInArray!0 (select (arr!19916 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!744925 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41604 (_ BitVec 32)) SeekEntryResult!7513)

(assert (=> b!744925 (= e!416062 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19916 a!3186) j!159) a!3186 mask!3328) (Found!7513 j!159)))))

(declare-fun b!744926 () Bool)

(declare-fun e!416063 () Bool)

(assert (=> b!744926 (= e!416059 (not e!416063))))

(declare-fun res!501981 () Bool)

(assert (=> b!744926 (=> res!501981 e!416063)))

(get-info :version)

(assert (=> b!744926 (= res!501981 (or (not ((_ is Intermediate!7513) lt!330808)) (bvslt x!1131 (x!63386 lt!330808)) (not (= x!1131 (x!63386 lt!330808))) (not (= index!1321 (index!32422 lt!330808)))))))

(declare-fun e!416060 () Bool)

(assert (=> b!744926 e!416060))

(declare-fun res!501968 () Bool)

(assert (=> b!744926 (=> (not res!501968) (not e!416060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41604 (_ BitVec 32)) Bool)

(assert (=> b!744926 (= res!501968 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25478 0))(
  ( (Unit!25479) )
))
(declare-fun lt!330810 () Unit!25478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25478)

(assert (=> b!744926 (= lt!330810 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744927 () Bool)

(declare-fun res!501965 () Bool)

(declare-fun e!416064 () Bool)

(assert (=> b!744927 (=> (not res!501965) (not e!416064))))

(assert (=> b!744927 (= res!501965 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20337 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20337 a!3186))))))

(declare-fun b!744928 () Bool)

(declare-fun res!501972 () Bool)

(assert (=> b!744928 (=> (not res!501972) (not e!416064))))

(assert (=> b!744928 (= res!501972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744929 () Bool)

(assert (=> b!744929 (= e!416063 (or (= (select (store (arr!19916 a!3186) i!1173 k0!2102) index!1321) lt!330811) (not (= (select (store (arr!19916 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!416058 () Bool)

(declare-fun b!744930 () Bool)

(declare-fun lt!330809 () SeekEntryResult!7513)

(assert (=> b!744930 (= e!416058 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19916 a!3186) j!159) a!3186 mask!3328) lt!330809))))

(declare-fun b!744931 () Bool)

(declare-fun res!501979 () Bool)

(assert (=> b!744931 (=> (not res!501979) (not e!416057))))

(assert (=> b!744931 (= res!501979 (validKeyInArray!0 k0!2102))))

(declare-fun b!744932 () Bool)

(declare-fun res!501977 () Bool)

(assert (=> b!744932 (=> (not res!501977) (not e!416064))))

(declare-datatypes ((List!13957 0))(
  ( (Nil!13954) (Cons!13953 (h!15025 (_ BitVec 64)) (t!20263 List!13957)) )
))
(declare-fun arrayNoDuplicates!0 (array!41604 (_ BitVec 32) List!13957) Bool)

(assert (=> b!744932 (= res!501977 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13954))))

(declare-fun b!744933 () Bool)

(assert (=> b!744933 (= e!416060 e!416058)))

(declare-fun res!501973 () Bool)

(assert (=> b!744933 (=> (not res!501973) (not e!416058))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41604 (_ BitVec 32)) SeekEntryResult!7513)

(assert (=> b!744933 (= res!501973 (= (seekEntryOrOpen!0 (select (arr!19916 a!3186) j!159) a!3186 mask!3328) lt!330809))))

(assert (=> b!744933 (= lt!330809 (Found!7513 j!159))))

(declare-fun b!744934 () Bool)

(declare-fun res!501974 () Bool)

(assert (=> b!744934 (=> res!501974 e!416063)))

(assert (=> b!744934 (= res!501974 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19916 a!3186) j!159) a!3186 mask!3328) (Found!7513 j!159))))))

(declare-fun b!744935 () Bool)

(declare-fun lt!330812 () SeekEntryResult!7513)

(assert (=> b!744935 (= e!416062 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19916 a!3186) j!159) a!3186 mask!3328) lt!330812))))

(declare-fun b!744936 () Bool)

(declare-fun res!501980 () Bool)

(assert (=> b!744936 (=> (not res!501980) (not e!416065))))

(assert (=> b!744936 (= res!501980 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19916 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744937 () Bool)

(assert (=> b!744937 (= e!416064 e!416065)))

(declare-fun res!501978 () Bool)

(assert (=> b!744937 (=> (not res!501978) (not e!416065))))

(assert (=> b!744937 (= res!501978 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19916 a!3186) j!159) mask!3328) (select (arr!19916 a!3186) j!159) a!3186 mask!3328) lt!330812))))

(assert (=> b!744937 (= lt!330812 (Intermediate!7513 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744938 () Bool)

(assert (=> b!744938 (= e!416057 e!416064)))

(declare-fun res!501971 () Bool)

(assert (=> b!744938 (=> (not res!501971) (not e!416064))))

(declare-fun lt!330813 () SeekEntryResult!7513)

(assert (=> b!744938 (= res!501971 (or (= lt!330813 (MissingZero!7513 i!1173)) (= lt!330813 (MissingVacant!7513 i!1173))))))

(assert (=> b!744938 (= lt!330813 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65414 res!501969) b!744920))

(assert (= (and b!744920 res!501976) b!744924))

(assert (= (and b!744924 res!501970) b!744931))

(assert (= (and b!744931 res!501979) b!744922))

(assert (= (and b!744922 res!501967) b!744938))

(assert (= (and b!744938 res!501971) b!744928))

(assert (= (and b!744928 res!501972) b!744932))

(assert (= (and b!744932 res!501977) b!744927))

(assert (= (and b!744927 res!501965) b!744937))

(assert (= (and b!744937 res!501978) b!744936))

(assert (= (and b!744936 res!501980) b!744923))

(assert (= (and b!744923 c!81858) b!744935))

(assert (= (and b!744923 (not c!81858)) b!744925))

(assert (= (and b!744923 res!501966) b!744921))

(assert (= (and b!744921 res!501975) b!744926))

(assert (= (and b!744926 res!501968) b!744933))

(assert (= (and b!744933 res!501973) b!744930))

(assert (= (and b!744926 (not res!501981)) b!744934))

(assert (= (and b!744934 (not res!501974)) b!744929))

(declare-fun m!694829 () Bool)

(assert (=> b!744938 m!694829))

(declare-fun m!694831 () Bool)

(assert (=> b!744929 m!694831))

(declare-fun m!694833 () Bool)

(assert (=> b!744929 m!694833))

(declare-fun m!694835 () Bool)

(assert (=> b!744922 m!694835))

(declare-fun m!694837 () Bool)

(assert (=> start!65414 m!694837))

(declare-fun m!694839 () Bool)

(assert (=> start!65414 m!694839))

(assert (=> b!744921 m!694831))

(declare-fun m!694841 () Bool)

(assert (=> b!744921 m!694841))

(declare-fun m!694843 () Bool)

(assert (=> b!744921 m!694843))

(declare-fun m!694845 () Bool)

(assert (=> b!744921 m!694845))

(assert (=> b!744921 m!694841))

(declare-fun m!694847 () Bool)

(assert (=> b!744921 m!694847))

(declare-fun m!694849 () Bool)

(assert (=> b!744933 m!694849))

(assert (=> b!744933 m!694849))

(declare-fun m!694851 () Bool)

(assert (=> b!744933 m!694851))

(declare-fun m!694853 () Bool)

(assert (=> b!744926 m!694853))

(declare-fun m!694855 () Bool)

(assert (=> b!744926 m!694855))

(assert (=> b!744937 m!694849))

(assert (=> b!744937 m!694849))

(declare-fun m!694857 () Bool)

(assert (=> b!744937 m!694857))

(assert (=> b!744937 m!694857))

(assert (=> b!744937 m!694849))

(declare-fun m!694859 () Bool)

(assert (=> b!744937 m!694859))

(assert (=> b!744934 m!694849))

(assert (=> b!744934 m!694849))

(declare-fun m!694861 () Bool)

(assert (=> b!744934 m!694861))

(declare-fun m!694863 () Bool)

(assert (=> b!744936 m!694863))

(declare-fun m!694865 () Bool)

(assert (=> b!744932 m!694865))

(declare-fun m!694867 () Bool)

(assert (=> b!744928 m!694867))

(assert (=> b!744925 m!694849))

(assert (=> b!744925 m!694849))

(assert (=> b!744925 m!694861))

(assert (=> b!744935 m!694849))

(assert (=> b!744935 m!694849))

(declare-fun m!694869 () Bool)

(assert (=> b!744935 m!694869))

(declare-fun m!694871 () Bool)

(assert (=> b!744931 m!694871))

(assert (=> b!744924 m!694849))

(assert (=> b!744924 m!694849))

(declare-fun m!694873 () Bool)

(assert (=> b!744924 m!694873))

(assert (=> b!744930 m!694849))

(assert (=> b!744930 m!694849))

(declare-fun m!694875 () Bool)

(assert (=> b!744930 m!694875))

(check-sat (not b!744932) (not b!744924) (not b!744933) (not b!744925) (not b!744938) (not b!744922) (not b!744937) (not b!744930) (not b!744934) (not b!744931) (not b!744935) (not b!744928) (not b!744926) (not b!744921) (not start!65414))
(check-sat)
