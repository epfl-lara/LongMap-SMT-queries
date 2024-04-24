; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67582 () Bool)

(assert start!67582)

(declare-fun b!781234 () Bool)

(declare-fun res!528438 () Bool)

(declare-fun e!434629 () Bool)

(assert (=> b!781234 (=> (not res!528438) (not e!434629))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42628 0))(
  ( (array!42629 (arr!20401 (Array (_ BitVec 32) (_ BitVec 64))) (size!20821 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42628)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781234 (= res!528438 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20401 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781235 () Bool)

(declare-fun e!434627 () Bool)

(assert (=> b!781235 (= e!434629 e!434627)))

(declare-fun res!528439 () Bool)

(assert (=> b!781235 (=> (not res!528439) (not e!434627))))

(declare-datatypes ((SeekEntryResult!7957 0))(
  ( (MissingZero!7957 (index!34196 (_ BitVec 32))) (Found!7957 (index!34197 (_ BitVec 32))) (Intermediate!7957 (undefined!8769 Bool) (index!34198 (_ BitVec 32)) (x!65306 (_ BitVec 32))) (Undefined!7957) (MissingVacant!7957 (index!34199 (_ BitVec 32))) )
))
(declare-fun lt!348127 () SeekEntryResult!7957)

(declare-fun lt!348134 () SeekEntryResult!7957)

(assert (=> b!781235 (= res!528439 (= lt!348127 lt!348134))))

(declare-fun lt!348135 () array!42628)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!348136 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42628 (_ BitVec 32)) SeekEntryResult!7957)

(assert (=> b!781235 (= lt!348134 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348136 lt!348135 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781235 (= lt!348127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348136 mask!3328) lt!348136 lt!348135 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!781235 (= lt!348136 (select (store (arr!20401 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781235 (= lt!348135 (array!42629 (store (arr!20401 a!3186) i!1173 k0!2102) (size!20821 a!3186)))))

(declare-fun b!781237 () Bool)

(declare-fun res!528436 () Bool)

(declare-fun e!434624 () Bool)

(assert (=> b!781237 (=> (not res!528436) (not e!434624))))

(declare-fun arrayContainsKey!0 (array!42628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781237 (= res!528436 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781238 () Bool)

(declare-fun res!528441 () Bool)

(declare-fun e!434625 () Bool)

(assert (=> b!781238 (=> (not res!528441) (not e!434625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42628 (_ BitVec 32)) Bool)

(assert (=> b!781238 (= res!528441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!434626 () Bool)

(declare-fun b!781239 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42628 (_ BitVec 32)) SeekEntryResult!7957)

(assert (=> b!781239 (= e!434626 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20401 a!3186) j!159) a!3186 mask!3328) (Found!7957 j!159)))))

(declare-fun b!781240 () Bool)

(declare-fun res!528429 () Bool)

(assert (=> b!781240 (=> (not res!528429) (not e!434624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781240 (= res!528429 (validKeyInArray!0 (select (arr!20401 a!3186) j!159)))))

(declare-fun b!781241 () Bool)

(declare-fun res!528440 () Bool)

(assert (=> b!781241 (=> (not res!528440) (not e!434625))))

(declare-datatypes ((List!14310 0))(
  ( (Nil!14307) (Cons!14306 (h!15429 (_ BitVec 64)) (t!20617 List!14310)) )
))
(declare-fun arrayNoDuplicates!0 (array!42628 (_ BitVec 32) List!14310) Bool)

(assert (=> b!781241 (= res!528440 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14307))))

(declare-fun b!781242 () Bool)

(declare-datatypes ((Unit!26893 0))(
  ( (Unit!26894) )
))
(declare-fun e!434621 () Unit!26893)

(declare-fun Unit!26895 () Unit!26893)

(assert (=> b!781242 (= e!434621 Unit!26895)))

(declare-fun b!781243 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!348133 () SeekEntryResult!7957)

(declare-fun e!434622 () Bool)

(assert (=> b!781243 (= e!434622 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20401 a!3186) j!159) a!3186 mask!3328) lt!348133))))

(declare-fun b!781244 () Bool)

(declare-fun res!528437 () Bool)

(assert (=> b!781244 (=> (not res!528437) (not e!434624))))

(assert (=> b!781244 (= res!528437 (validKeyInArray!0 k0!2102))))

(declare-fun b!781245 () Bool)

(declare-fun lt!348132 () SeekEntryResult!7957)

(assert (=> b!781245 (= e!434626 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20401 a!3186) j!159) a!3186 mask!3328) lt!348132))))

(declare-fun b!781246 () Bool)

(declare-fun e!434623 () Bool)

(assert (=> b!781246 (= e!434627 (not e!434623))))

(declare-fun res!528430 () Bool)

(assert (=> b!781246 (=> res!528430 e!434623)))

(get-info :version)

(assert (=> b!781246 (= res!528430 (or (not ((_ is Intermediate!7957) lt!348134)) (bvslt x!1131 (x!65306 lt!348134)) (not (= x!1131 (x!65306 lt!348134))) (not (= index!1321 (index!34198 lt!348134)))))))

(assert (=> b!781246 e!434622))

(declare-fun res!528425 () Bool)

(assert (=> b!781246 (=> (not res!528425) (not e!434622))))

(declare-fun lt!348130 () SeekEntryResult!7957)

(assert (=> b!781246 (= res!528425 (= lt!348130 lt!348133))))

(assert (=> b!781246 (= lt!348133 (Found!7957 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42628 (_ BitVec 32)) SeekEntryResult!7957)

(assert (=> b!781246 (= lt!348130 (seekEntryOrOpen!0 (select (arr!20401 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!781246 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348129 () Unit!26893)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26893)

(assert (=> b!781246 (= lt!348129 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781247 () Bool)

(declare-fun res!528426 () Bool)

(assert (=> b!781247 (=> (not res!528426) (not e!434625))))

(assert (=> b!781247 (= res!528426 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20821 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20821 a!3186))))))

(declare-fun res!528435 () Bool)

(assert (=> start!67582 (=> (not res!528435) (not e!434624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67582 (= res!528435 (validMask!0 mask!3328))))

(assert (=> start!67582 e!434624))

(assert (=> start!67582 true))

(declare-fun array_inv!16260 (array!42628) Bool)

(assert (=> start!67582 (array_inv!16260 a!3186)))

(declare-fun b!781236 () Bool)

(declare-fun res!528431 () Bool)

(assert (=> b!781236 (=> (not res!528431) (not e!434624))))

(assert (=> b!781236 (= res!528431 (and (= (size!20821 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20821 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20821 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781248 () Bool)

(assert (=> b!781248 (= e!434623 true)))

(declare-fun lt!348131 () Unit!26893)

(assert (=> b!781248 (= lt!348131 e!434621)))

(declare-fun c!86812 () Bool)

(assert (=> b!781248 (= c!86812 (= (select (store (arr!20401 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781249 () Bool)

(declare-fun res!528433 () Bool)

(assert (=> b!781249 (=> res!528433 e!434623)))

(assert (=> b!781249 (= res!528433 (= (select (store (arr!20401 a!3186) i!1173 k0!2102) index!1321) lt!348136))))

(declare-fun b!781250 () Bool)

(assert (=> b!781250 (= e!434625 e!434629)))

(declare-fun res!528434 () Bool)

(assert (=> b!781250 (=> (not res!528434) (not e!434629))))

(assert (=> b!781250 (= res!528434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20401 a!3186) j!159) mask!3328) (select (arr!20401 a!3186) j!159) a!3186 mask!3328) lt!348132))))

(assert (=> b!781250 (= lt!348132 (Intermediate!7957 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781251 () Bool)

(declare-fun res!528427 () Bool)

(assert (=> b!781251 (=> res!528427 e!434623)))

(assert (=> b!781251 (= res!528427 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20401 a!3186) j!159) a!3186 mask!3328) lt!348133)))))

(declare-fun b!781252 () Bool)

(assert (=> b!781252 (= e!434624 e!434625)))

(declare-fun res!528432 () Bool)

(assert (=> b!781252 (=> (not res!528432) (not e!434625))))

(declare-fun lt!348128 () SeekEntryResult!7957)

(assert (=> b!781252 (= res!528432 (or (= lt!348128 (MissingZero!7957 i!1173)) (= lt!348128 (MissingVacant!7957 i!1173))))))

(assert (=> b!781252 (= lt!348128 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!781253 () Bool)

(declare-fun res!528428 () Bool)

(assert (=> b!781253 (=> (not res!528428) (not e!434629))))

(assert (=> b!781253 (= res!528428 e!434626)))

(declare-fun c!86813 () Bool)

(assert (=> b!781253 (= c!86813 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781254 () Bool)

(declare-fun Unit!26896 () Unit!26893)

(assert (=> b!781254 (= e!434621 Unit!26896)))

(assert (=> b!781254 false))

(assert (= (and start!67582 res!528435) b!781236))

(assert (= (and b!781236 res!528431) b!781240))

(assert (= (and b!781240 res!528429) b!781244))

(assert (= (and b!781244 res!528437) b!781237))

(assert (= (and b!781237 res!528436) b!781252))

(assert (= (and b!781252 res!528432) b!781238))

(assert (= (and b!781238 res!528441) b!781241))

(assert (= (and b!781241 res!528440) b!781247))

(assert (= (and b!781247 res!528426) b!781250))

(assert (= (and b!781250 res!528434) b!781234))

(assert (= (and b!781234 res!528438) b!781253))

(assert (= (and b!781253 c!86813) b!781245))

(assert (= (and b!781253 (not c!86813)) b!781239))

(assert (= (and b!781253 res!528428) b!781235))

(assert (= (and b!781235 res!528439) b!781246))

(assert (= (and b!781246 res!528425) b!781243))

(assert (= (and b!781246 (not res!528430)) b!781251))

(assert (= (and b!781251 (not res!528427)) b!781249))

(assert (= (and b!781249 (not res!528433)) b!781248))

(assert (= (and b!781248 c!86812) b!781254))

(assert (= (and b!781248 (not c!86812)) b!781242))

(declare-fun m!724919 () Bool)

(assert (=> b!781234 m!724919))

(declare-fun m!724921 () Bool)

(assert (=> start!67582 m!724921))

(declare-fun m!724923 () Bool)

(assert (=> start!67582 m!724923))

(declare-fun m!724925 () Bool)

(assert (=> b!781249 m!724925))

(declare-fun m!724927 () Bool)

(assert (=> b!781249 m!724927))

(declare-fun m!724929 () Bool)

(assert (=> b!781250 m!724929))

(assert (=> b!781250 m!724929))

(declare-fun m!724931 () Bool)

(assert (=> b!781250 m!724931))

(assert (=> b!781250 m!724931))

(assert (=> b!781250 m!724929))

(declare-fun m!724933 () Bool)

(assert (=> b!781250 m!724933))

(assert (=> b!781239 m!724929))

(assert (=> b!781239 m!724929))

(declare-fun m!724935 () Bool)

(assert (=> b!781239 m!724935))

(declare-fun m!724937 () Bool)

(assert (=> b!781252 m!724937))

(declare-fun m!724939 () Bool)

(assert (=> b!781241 m!724939))

(assert (=> b!781243 m!724929))

(assert (=> b!781243 m!724929))

(declare-fun m!724941 () Bool)

(assert (=> b!781243 m!724941))

(declare-fun m!724943 () Bool)

(assert (=> b!781237 m!724943))

(declare-fun m!724945 () Bool)

(assert (=> b!781244 m!724945))

(declare-fun m!724947 () Bool)

(assert (=> b!781235 m!724947))

(declare-fun m!724949 () Bool)

(assert (=> b!781235 m!724949))

(assert (=> b!781235 m!724925))

(assert (=> b!781235 m!724947))

(declare-fun m!724951 () Bool)

(assert (=> b!781235 m!724951))

(declare-fun m!724953 () Bool)

(assert (=> b!781235 m!724953))

(declare-fun m!724955 () Bool)

(assert (=> b!781238 m!724955))

(assert (=> b!781246 m!724929))

(assert (=> b!781246 m!724929))

(declare-fun m!724957 () Bool)

(assert (=> b!781246 m!724957))

(declare-fun m!724959 () Bool)

(assert (=> b!781246 m!724959))

(declare-fun m!724961 () Bool)

(assert (=> b!781246 m!724961))

(assert (=> b!781240 m!724929))

(assert (=> b!781240 m!724929))

(declare-fun m!724963 () Bool)

(assert (=> b!781240 m!724963))

(assert (=> b!781251 m!724929))

(assert (=> b!781251 m!724929))

(assert (=> b!781251 m!724935))

(assert (=> b!781248 m!724925))

(assert (=> b!781248 m!724927))

(assert (=> b!781245 m!724929))

(assert (=> b!781245 m!724929))

(declare-fun m!724965 () Bool)

(assert (=> b!781245 m!724965))

(check-sat (not b!781244) (not b!781240) (not b!781237) (not b!781252) (not b!781245) (not b!781243) (not b!781239) (not b!781241) (not b!781250) (not b!781251) (not b!781238) (not b!781246) (not start!67582) (not b!781235))
(check-sat)
