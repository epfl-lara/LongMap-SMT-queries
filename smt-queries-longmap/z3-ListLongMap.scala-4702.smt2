; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65252 () Bool)

(assert start!65252)

(declare-fun b!740342 () Bool)

(declare-fun res!497945 () Bool)

(declare-fun e!413890 () Bool)

(assert (=> b!740342 (=> (not res!497945) (not e!413890))))

(declare-datatypes ((array!41442 0))(
  ( (array!41443 (arr!19835 (Array (_ BitVec 32) (_ BitVec 64))) (size!20256 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41442)

(declare-datatypes ((List!13876 0))(
  ( (Nil!13873) (Cons!13872 (h!14944 (_ BitVec 64)) (t!20182 List!13876)) )
))
(declare-fun arrayNoDuplicates!0 (array!41442 (_ BitVec 32) List!13876) Bool)

(assert (=> b!740342 (= res!497945 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13873))))

(declare-fun b!740343 () Bool)

(declare-fun res!497955 () Bool)

(declare-fun e!413889 () Bool)

(assert (=> b!740343 (=> (not res!497955) (not e!413889))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740343 (= res!497955 (validKeyInArray!0 k0!2102))))

(declare-fun b!740344 () Bool)

(declare-fun res!497938 () Bool)

(assert (=> b!740344 (=> (not res!497938) (not e!413889))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!740344 (= res!497938 (and (= (size!20256 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20256 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20256 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740345 () Bool)

(declare-fun res!497948 () Bool)

(declare-fun e!413896 () Bool)

(assert (=> b!740345 (=> res!497948 e!413896)))

(declare-fun lt!328773 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7432 0))(
  ( (MissingZero!7432 (index!32096 (_ BitVec 32))) (Found!7432 (index!32097 (_ BitVec 32))) (Intermediate!7432 (undefined!8244 Bool) (index!32098 (_ BitVec 32)) (x!63089 (_ BitVec 32))) (Undefined!7432) (MissingVacant!7432 (index!32099 (_ BitVec 32))) )
))
(declare-fun lt!328779 () SeekEntryResult!7432)

(declare-fun lt!328780 () (_ BitVec 64))

(declare-fun lt!328770 () array!41442)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41442 (_ BitVec 32)) SeekEntryResult!7432)

(assert (=> b!740345 (= res!497948 (not (= lt!328779 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328773 lt!328780 lt!328770 mask!3328))))))

(declare-fun res!497947 () Bool)

(assert (=> start!65252 (=> (not res!497947) (not e!413889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65252 (= res!497947 (validMask!0 mask!3328))))

(assert (=> start!65252 e!413889))

(assert (=> start!65252 true))

(declare-fun array_inv!15718 (array!41442) Bool)

(assert (=> start!65252 (array_inv!15718 a!3186)))

(declare-fun b!740346 () Bool)

(declare-fun e!413894 () Bool)

(assert (=> b!740346 (= e!413894 e!413896)))

(declare-fun res!497939 () Bool)

(assert (=> b!740346 (=> res!497939 e!413896)))

(assert (=> b!740346 (= res!497939 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328773 #b00000000000000000000000000000000) (bvsge lt!328773 (size!20256 a!3186))))))

(declare-datatypes ((Unit!25304 0))(
  ( (Unit!25305) )
))
(declare-fun lt!328777 () Unit!25304)

(declare-fun e!413885 () Unit!25304)

(assert (=> b!740346 (= lt!328777 e!413885)))

(declare-fun c!81583 () Bool)

(declare-fun lt!328769 () Bool)

(assert (=> b!740346 (= c!81583 lt!328769)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740346 (= lt!328769 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740346 (= lt!328773 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun e!413891 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!328778 () SeekEntryResult!7432)

(declare-fun b!740347 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41442 (_ BitVec 32)) SeekEntryResult!7432)

(assert (=> b!740347 (= e!413891 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328778))))

(declare-fun e!413888 () Bool)

(declare-fun b!740348 () Bool)

(declare-fun lt!328768 () SeekEntryResult!7432)

(assert (=> b!740348 (= e!413888 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328768))))

(declare-fun b!740349 () Bool)

(declare-fun res!497940 () Bool)

(assert (=> b!740349 (=> (not res!497940) (not e!413890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41442 (_ BitVec 32)) Bool)

(assert (=> b!740349 (= res!497940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740350 () Bool)

(declare-fun Unit!25306 () Unit!25304)

(assert (=> b!740350 (= e!413885 Unit!25306)))

(assert (=> b!740350 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328773 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328768)))

(declare-fun b!740351 () Bool)

(declare-fun e!413892 () Bool)

(declare-fun lt!328775 () SeekEntryResult!7432)

(assert (=> b!740351 (= e!413892 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328773 resIntermediateIndex!5 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328775)))))

(declare-fun b!740352 () Bool)

(declare-fun res!497943 () Bool)

(assert (=> b!740352 (=> (not res!497943) (not e!413889))))

(assert (=> b!740352 (= res!497943 (validKeyInArray!0 (select (arr!19835 a!3186) j!159)))))

(declare-fun b!740353 () Bool)

(declare-fun res!497952 () Bool)

(assert (=> b!740353 (=> res!497952 e!413896)))

(assert (=> b!740353 (= res!497952 e!413892)))

(declare-fun c!81584 () Bool)

(assert (=> b!740353 (= c!81584 lt!328769)))

(declare-fun b!740354 () Bool)

(declare-fun Unit!25307 () Unit!25304)

(assert (=> b!740354 (= e!413885 Unit!25307)))

(declare-fun lt!328774 () SeekEntryResult!7432)

(assert (=> b!740354 (= lt!328774 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19835 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740354 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328773 resIntermediateIndex!5 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328775)))

(declare-fun b!740355 () Bool)

(declare-fun res!497950 () Bool)

(assert (=> b!740355 (=> (not res!497950) (not e!413890))))

(assert (=> b!740355 (= res!497950 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20256 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20256 a!3186))))))

(declare-fun b!740356 () Bool)

(assert (=> b!740356 (= e!413896 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41442 (_ BitVec 32)) SeekEntryResult!7432)

(assert (=> b!740356 (= (seekEntryOrOpen!0 lt!328780 lt!328770 mask!3328) lt!328775)))

(declare-fun lt!328772 () Unit!25304)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41442 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25304)

(assert (=> b!740356 (= lt!328772 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!328773 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740357 () Bool)

(assert (=> b!740357 (= e!413892 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328773 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328768)))))

(declare-fun b!740358 () Bool)

(declare-fun res!497954 () Bool)

(declare-fun e!413886 () Bool)

(assert (=> b!740358 (=> (not res!497954) (not e!413886))))

(assert (=> b!740358 (= res!497954 e!413888)))

(declare-fun c!81585 () Bool)

(assert (=> b!740358 (= c!81585 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740359 () Bool)

(assert (=> b!740359 (= e!413889 e!413890)))

(declare-fun res!497946 () Bool)

(assert (=> b!740359 (=> (not res!497946) (not e!413890))))

(declare-fun lt!328771 () SeekEntryResult!7432)

(assert (=> b!740359 (= res!497946 (or (= lt!328771 (MissingZero!7432 i!1173)) (= lt!328771 (MissingVacant!7432 i!1173))))))

(assert (=> b!740359 (= lt!328771 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740360 () Bool)

(declare-fun e!413893 () Bool)

(assert (=> b!740360 (= e!413886 e!413893)))

(declare-fun res!497944 () Bool)

(assert (=> b!740360 (=> (not res!497944) (not e!413893))))

(declare-fun lt!328781 () SeekEntryResult!7432)

(assert (=> b!740360 (= res!497944 (= lt!328779 lt!328781))))

(assert (=> b!740360 (= lt!328781 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328780 lt!328770 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740360 (= lt!328779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328780 mask!3328) lt!328780 lt!328770 mask!3328))))

(assert (=> b!740360 (= lt!328780 (select (store (arr!19835 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740360 (= lt!328770 (array!41443 (store (arr!19835 a!3186) i!1173 k0!2102) (size!20256 a!3186)))))

(declare-fun b!740361 () Bool)

(declare-fun e!413895 () Bool)

(assert (=> b!740361 (= e!413895 e!413891)))

(declare-fun res!497937 () Bool)

(assert (=> b!740361 (=> (not res!497937) (not e!413891))))

(assert (=> b!740361 (= res!497937 (= (seekEntryOrOpen!0 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328778))))

(assert (=> b!740361 (= lt!328778 (Found!7432 j!159))))

(declare-fun b!740362 () Bool)

(assert (=> b!740362 (= e!413890 e!413886)))

(declare-fun res!497949 () Bool)

(assert (=> b!740362 (=> (not res!497949) (not e!413886))))

(assert (=> b!740362 (= res!497949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19835 a!3186) j!159) mask!3328) (select (arr!19835 a!3186) j!159) a!3186 mask!3328) lt!328768))))

(assert (=> b!740362 (= lt!328768 (Intermediate!7432 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740363 () Bool)

(declare-fun res!497941 () Bool)

(assert (=> b!740363 (=> (not res!497941) (not e!413886))))

(assert (=> b!740363 (= res!497941 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19835 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740364 () Bool)

(assert (=> b!740364 (= e!413888 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19835 a!3186) j!159) a!3186 mask!3328) (Found!7432 j!159)))))

(declare-fun b!740365 () Bool)

(declare-fun res!497942 () Bool)

(assert (=> b!740365 (=> (not res!497942) (not e!413889))))

(declare-fun arrayContainsKey!0 (array!41442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740365 (= res!497942 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740366 () Bool)

(assert (=> b!740366 (= e!413893 (not e!413894))))

(declare-fun res!497951 () Bool)

(assert (=> b!740366 (=> res!497951 e!413894)))

(get-info :version)

(assert (=> b!740366 (= res!497951 (or (not ((_ is Intermediate!7432) lt!328781)) (bvsge x!1131 (x!63089 lt!328781))))))

(assert (=> b!740366 (= lt!328775 (Found!7432 j!159))))

(assert (=> b!740366 e!413895))

(declare-fun res!497953 () Bool)

(assert (=> b!740366 (=> (not res!497953) (not e!413895))))

(assert (=> b!740366 (= res!497953 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328776 () Unit!25304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25304)

(assert (=> b!740366 (= lt!328776 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65252 res!497947) b!740344))

(assert (= (and b!740344 res!497938) b!740352))

(assert (= (and b!740352 res!497943) b!740343))

(assert (= (and b!740343 res!497955) b!740365))

(assert (= (and b!740365 res!497942) b!740359))

(assert (= (and b!740359 res!497946) b!740349))

(assert (= (and b!740349 res!497940) b!740342))

(assert (= (and b!740342 res!497945) b!740355))

(assert (= (and b!740355 res!497950) b!740362))

(assert (= (and b!740362 res!497949) b!740363))

(assert (= (and b!740363 res!497941) b!740358))

(assert (= (and b!740358 c!81585) b!740348))

(assert (= (and b!740358 (not c!81585)) b!740364))

(assert (= (and b!740358 res!497954) b!740360))

(assert (= (and b!740360 res!497944) b!740366))

(assert (= (and b!740366 res!497953) b!740361))

(assert (= (and b!740361 res!497937) b!740347))

(assert (= (and b!740366 (not res!497951)) b!740346))

(assert (= (and b!740346 c!81583) b!740350))

(assert (= (and b!740346 (not c!81583)) b!740354))

(assert (= (and b!740346 (not res!497939)) b!740353))

(assert (= (and b!740353 c!81584) b!740357))

(assert (= (and b!740353 (not c!81584)) b!740351))

(assert (= (and b!740353 (not res!497952)) b!740345))

(assert (= (and b!740345 (not res!497948)) b!740356))

(declare-fun m!690935 () Bool)

(assert (=> b!740347 m!690935))

(assert (=> b!740347 m!690935))

(declare-fun m!690937 () Bool)

(assert (=> b!740347 m!690937))

(declare-fun m!690939 () Bool)

(assert (=> b!740360 m!690939))

(declare-fun m!690941 () Bool)

(assert (=> b!740360 m!690941))

(assert (=> b!740360 m!690939))

(declare-fun m!690943 () Bool)

(assert (=> b!740360 m!690943))

(declare-fun m!690945 () Bool)

(assert (=> b!740360 m!690945))

(declare-fun m!690947 () Bool)

(assert (=> b!740360 m!690947))

(declare-fun m!690949 () Bool)

(assert (=> b!740366 m!690949))

(declare-fun m!690951 () Bool)

(assert (=> b!740366 m!690951))

(declare-fun m!690953 () Bool)

(assert (=> b!740359 m!690953))

(assert (=> b!740352 m!690935))

(assert (=> b!740352 m!690935))

(declare-fun m!690955 () Bool)

(assert (=> b!740352 m!690955))

(declare-fun m!690957 () Bool)

(assert (=> b!740346 m!690957))

(assert (=> b!740351 m!690935))

(assert (=> b!740351 m!690935))

(declare-fun m!690959 () Bool)

(assert (=> b!740351 m!690959))

(assert (=> b!740361 m!690935))

(assert (=> b!740361 m!690935))

(declare-fun m!690961 () Bool)

(assert (=> b!740361 m!690961))

(declare-fun m!690963 () Bool)

(assert (=> b!740363 m!690963))

(assert (=> b!740354 m!690935))

(assert (=> b!740354 m!690935))

(declare-fun m!690965 () Bool)

(assert (=> b!740354 m!690965))

(assert (=> b!740354 m!690935))

(assert (=> b!740354 m!690959))

(declare-fun m!690967 () Bool)

(assert (=> b!740356 m!690967))

(declare-fun m!690969 () Bool)

(assert (=> b!740356 m!690969))

(declare-fun m!690971 () Bool)

(assert (=> b!740342 m!690971))

(declare-fun m!690973 () Bool)

(assert (=> b!740365 m!690973))

(assert (=> b!740350 m!690935))

(assert (=> b!740350 m!690935))

(declare-fun m!690975 () Bool)

(assert (=> b!740350 m!690975))

(declare-fun m!690977 () Bool)

(assert (=> b!740345 m!690977))

(assert (=> b!740362 m!690935))

(assert (=> b!740362 m!690935))

(declare-fun m!690979 () Bool)

(assert (=> b!740362 m!690979))

(assert (=> b!740362 m!690979))

(assert (=> b!740362 m!690935))

(declare-fun m!690981 () Bool)

(assert (=> b!740362 m!690981))

(assert (=> b!740364 m!690935))

(assert (=> b!740364 m!690935))

(assert (=> b!740364 m!690965))

(assert (=> b!740357 m!690935))

(assert (=> b!740357 m!690935))

(assert (=> b!740357 m!690975))

(assert (=> b!740348 m!690935))

(assert (=> b!740348 m!690935))

(declare-fun m!690983 () Bool)

(assert (=> b!740348 m!690983))

(declare-fun m!690985 () Bool)

(assert (=> b!740343 m!690985))

(declare-fun m!690987 () Bool)

(assert (=> start!65252 m!690987))

(declare-fun m!690989 () Bool)

(assert (=> start!65252 m!690989))

(declare-fun m!690991 () Bool)

(assert (=> b!740349 m!690991))

(check-sat (not b!740365) (not b!740364) (not b!740351) (not b!740366) (not b!740349) (not b!740345) (not b!740357) (not b!740356) (not b!740360) (not b!740348) (not b!740342) (not b!740354) (not b!740352) (not b!740343) (not b!740347) (not b!740346) (not b!740359) (not b!740350) (not b!740362) (not start!65252) (not b!740361))
(check-sat)
