; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65572 () Bool)

(assert start!65572)

(declare-fun b!749253 () Bool)

(declare-fun res!505533 () Bool)

(declare-fun e!418100 () Bool)

(assert (=> b!749253 (=> (not res!505533) (not e!418100))))

(declare-datatypes ((array!41745 0))(
  ( (array!41746 (arr!19986 (Array (_ BitVec 32) (_ BitVec 64))) (size!20407 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41745)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!749253 (= res!505533 (and (= (size!20407 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20407 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20407 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749254 () Bool)

(declare-fun res!505536 () Bool)

(declare-fun e!418102 () Bool)

(assert (=> b!749254 (=> (not res!505536) (not e!418102))))

(declare-fun e!418097 () Bool)

(assert (=> b!749254 (= res!505536 e!418097)))

(declare-fun c!82245 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749254 (= c!82245 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749255 () Bool)

(declare-fun res!505538 () Bool)

(declare-fun e!418104 () Bool)

(assert (=> b!749255 (=> (not res!505538) (not e!418104))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!749255 (= res!505538 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20407 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20407 a!3186))))))

(declare-fun b!749256 () Bool)

(declare-fun e!418101 () Bool)

(declare-fun e!418096 () Bool)

(assert (=> b!749256 (= e!418101 e!418096)))

(declare-fun res!505530 () Bool)

(assert (=> b!749256 (=> res!505530 e!418096)))

(declare-fun lt!333092 () (_ BitVec 64))

(declare-fun lt!333096 () (_ BitVec 64))

(assert (=> b!749256 (= res!505530 (= lt!333092 lt!333096))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!749256 (= lt!333092 (select (store (arr!19986 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!749257 () Bool)

(declare-fun res!505539 () Bool)

(assert (=> b!749257 (=> (not res!505539) (not e!418100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749257 (= res!505539 (validKeyInArray!0 (select (arr!19986 a!3186) j!159)))))

(declare-fun b!749258 () Bool)

(declare-fun e!418106 () Bool)

(declare-datatypes ((SeekEntryResult!7586 0))(
  ( (MissingZero!7586 (index!32712 (_ BitVec 32))) (Found!7586 (index!32713 (_ BitVec 32))) (Intermediate!7586 (undefined!8398 Bool) (index!32714 (_ BitVec 32)) (x!63648 (_ BitVec 32))) (Undefined!7586) (MissingVacant!7586 (index!32715 (_ BitVec 32))) )
))
(declare-fun lt!333097 () SeekEntryResult!7586)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41745 (_ BitVec 32)) SeekEntryResult!7586)

(assert (=> b!749258 (= e!418106 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19986 a!3186) j!159) a!3186 mask!3328) lt!333097))))

(declare-fun b!749259 () Bool)

(assert (=> b!749259 (= e!418100 e!418104)))

(declare-fun res!505534 () Bool)

(assert (=> b!749259 (=> (not res!505534) (not e!418104))))

(declare-fun lt!333098 () SeekEntryResult!7586)

(assert (=> b!749259 (= res!505534 (or (= lt!333098 (MissingZero!7586 i!1173)) (= lt!333098 (MissingVacant!7586 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41745 (_ BitVec 32)) SeekEntryResult!7586)

(assert (=> b!749259 (= lt!333098 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749260 () Bool)

(declare-fun res!505535 () Bool)

(assert (=> b!749260 (=> res!505535 e!418101)))

(assert (=> b!749260 (= res!505535 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19986 a!3186) j!159) a!3186 mask!3328) lt!333097)))))

(declare-fun b!749261 () Bool)

(assert (=> b!749261 (= e!418104 e!418102)))

(declare-fun res!505528 () Bool)

(assert (=> b!749261 (=> (not res!505528) (not e!418102))))

(declare-fun lt!333094 () SeekEntryResult!7586)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41745 (_ BitVec 32)) SeekEntryResult!7586)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749261 (= res!505528 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19986 a!3186) j!159) mask!3328) (select (arr!19986 a!3186) j!159) a!3186 mask!3328) lt!333094))))

(assert (=> b!749261 (= lt!333094 (Intermediate!7586 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749262 () Bool)

(declare-datatypes ((Unit!25724 0))(
  ( (Unit!25725) )
))
(declare-fun e!418098 () Unit!25724)

(declare-fun Unit!25726 () Unit!25724)

(assert (=> b!749262 (= e!418098 Unit!25726)))

(assert (=> b!749262 false))

(declare-fun b!749263 () Bool)

(assert (=> b!749263 (= e!418097 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19986 a!3186) j!159) a!3186 mask!3328) (Found!7586 j!159)))))

(declare-fun b!749264 () Bool)

(declare-fun Unit!25727 () Unit!25724)

(assert (=> b!749264 (= e!418098 Unit!25727)))

(declare-fun b!749265 () Bool)

(declare-fun e!418105 () Bool)

(assert (=> b!749265 (= e!418105 (not e!418101))))

(declare-fun res!505529 () Bool)

(assert (=> b!749265 (=> res!505529 e!418101)))

(declare-fun lt!333090 () SeekEntryResult!7586)

(assert (=> b!749265 (= res!505529 (or (not (is-Intermediate!7586 lt!333090)) (bvslt x!1131 (x!63648 lt!333090)) (not (= x!1131 (x!63648 lt!333090))) (not (= index!1321 (index!32714 lt!333090)))))))

(assert (=> b!749265 e!418106))

(declare-fun res!505525 () Bool)

(assert (=> b!749265 (=> (not res!505525) (not e!418106))))

(declare-fun lt!333089 () SeekEntryResult!7586)

(assert (=> b!749265 (= res!505525 (= lt!333089 lt!333097))))

(assert (=> b!749265 (= lt!333097 (Found!7586 j!159))))

(assert (=> b!749265 (= lt!333089 (seekEntryOrOpen!0 (select (arr!19986 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41745 (_ BitVec 32)) Bool)

(assert (=> b!749265 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333095 () Unit!25724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25724)

(assert (=> b!749265 (= lt!333095 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749266 () Bool)

(declare-fun res!505524 () Bool)

(assert (=> b!749266 (=> (not res!505524) (not e!418100))))

(assert (=> b!749266 (= res!505524 (validKeyInArray!0 k!2102))))

(declare-fun lt!333093 () array!41745)

(declare-fun e!418099 () Bool)

(declare-fun b!749267 () Bool)

(assert (=> b!749267 (= e!418099 (= (seekEntryOrOpen!0 lt!333096 lt!333093 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333096 lt!333093 mask!3328)))))

(declare-fun b!749268 () Bool)

(declare-fun res!505531 () Bool)

(assert (=> b!749268 (=> (not res!505531) (not e!418104))))

(assert (=> b!749268 (= res!505531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749269 () Bool)

(declare-fun res!505540 () Bool)

(assert (=> b!749269 (=> (not res!505540) (not e!418100))))

(declare-fun arrayContainsKey!0 (array!41745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749269 (= res!505540 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!505541 () Bool)

(assert (=> start!65572 (=> (not res!505541) (not e!418100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65572 (= res!505541 (validMask!0 mask!3328))))

(assert (=> start!65572 e!418100))

(assert (=> start!65572 true))

(declare-fun array_inv!15782 (array!41745) Bool)

(assert (=> start!65572 (array_inv!15782 a!3186)))

(declare-fun b!749270 () Bool)

(assert (=> b!749270 (= e!418097 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19986 a!3186) j!159) a!3186 mask!3328) lt!333094))))

(declare-fun b!749271 () Bool)

(declare-fun res!505532 () Bool)

(assert (=> b!749271 (=> (not res!505532) (not e!418102))))

(assert (=> b!749271 (= res!505532 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19986 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749272 () Bool)

(declare-fun res!505537 () Bool)

(assert (=> b!749272 (=> (not res!505537) (not e!418104))))

(declare-datatypes ((List!13988 0))(
  ( (Nil!13985) (Cons!13984 (h!15056 (_ BitVec 64)) (t!20303 List!13988)) )
))
(declare-fun arrayNoDuplicates!0 (array!41745 (_ BitVec 32) List!13988) Bool)

(assert (=> b!749272 (= res!505537 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13985))))

(declare-fun b!749273 () Bool)

(assert (=> b!749273 (= e!418096 true)))

(assert (=> b!749273 e!418099))

(declare-fun res!505527 () Bool)

(assert (=> b!749273 (=> (not res!505527) (not e!418099))))

(assert (=> b!749273 (= res!505527 (= lt!333092 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333088 () Unit!25724)

(assert (=> b!749273 (= lt!333088 e!418098)))

(declare-fun c!82246 () Bool)

(assert (=> b!749273 (= c!82246 (= lt!333092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749274 () Bool)

(assert (=> b!749274 (= e!418102 e!418105)))

(declare-fun res!505526 () Bool)

(assert (=> b!749274 (=> (not res!505526) (not e!418105))))

(declare-fun lt!333091 () SeekEntryResult!7586)

(assert (=> b!749274 (= res!505526 (= lt!333091 lt!333090))))

(assert (=> b!749274 (= lt!333090 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333096 lt!333093 mask!3328))))

(assert (=> b!749274 (= lt!333091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333096 mask!3328) lt!333096 lt!333093 mask!3328))))

(assert (=> b!749274 (= lt!333096 (select (store (arr!19986 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!749274 (= lt!333093 (array!41746 (store (arr!19986 a!3186) i!1173 k!2102) (size!20407 a!3186)))))

(assert (= (and start!65572 res!505541) b!749253))

(assert (= (and b!749253 res!505533) b!749257))

(assert (= (and b!749257 res!505539) b!749266))

(assert (= (and b!749266 res!505524) b!749269))

(assert (= (and b!749269 res!505540) b!749259))

(assert (= (and b!749259 res!505534) b!749268))

(assert (= (and b!749268 res!505531) b!749272))

(assert (= (and b!749272 res!505537) b!749255))

(assert (= (and b!749255 res!505538) b!749261))

(assert (= (and b!749261 res!505528) b!749271))

(assert (= (and b!749271 res!505532) b!749254))

(assert (= (and b!749254 c!82245) b!749270))

(assert (= (and b!749254 (not c!82245)) b!749263))

(assert (= (and b!749254 res!505536) b!749274))

(assert (= (and b!749274 res!505526) b!749265))

(assert (= (and b!749265 res!505525) b!749258))

(assert (= (and b!749265 (not res!505529)) b!749260))

(assert (= (and b!749260 (not res!505535)) b!749256))

(assert (= (and b!749256 (not res!505530)) b!749273))

(assert (= (and b!749273 c!82246) b!749262))

(assert (= (and b!749273 (not c!82246)) b!749264))

(assert (= (and b!749273 res!505527) b!749267))

(declare-fun m!698899 () Bool)

(assert (=> b!749258 m!698899))

(assert (=> b!749258 m!698899))

(declare-fun m!698901 () Bool)

(assert (=> b!749258 m!698901))

(declare-fun m!698903 () Bool)

(assert (=> b!749268 m!698903))

(declare-fun m!698905 () Bool)

(assert (=> b!749271 m!698905))

(declare-fun m!698907 () Bool)

(assert (=> b!749259 m!698907))

(declare-fun m!698909 () Bool)

(assert (=> start!65572 m!698909))

(declare-fun m!698911 () Bool)

(assert (=> start!65572 m!698911))

(assert (=> b!749265 m!698899))

(assert (=> b!749265 m!698899))

(declare-fun m!698913 () Bool)

(assert (=> b!749265 m!698913))

(declare-fun m!698915 () Bool)

(assert (=> b!749265 m!698915))

(declare-fun m!698917 () Bool)

(assert (=> b!749265 m!698917))

(declare-fun m!698919 () Bool)

(assert (=> b!749269 m!698919))

(assert (=> b!749260 m!698899))

(assert (=> b!749260 m!698899))

(declare-fun m!698921 () Bool)

(assert (=> b!749260 m!698921))

(declare-fun m!698923 () Bool)

(assert (=> b!749266 m!698923))

(declare-fun m!698925 () Bool)

(assert (=> b!749274 m!698925))

(declare-fun m!698927 () Bool)

(assert (=> b!749274 m!698927))

(declare-fun m!698929 () Bool)

(assert (=> b!749274 m!698929))

(assert (=> b!749274 m!698927))

(declare-fun m!698931 () Bool)

(assert (=> b!749274 m!698931))

(declare-fun m!698933 () Bool)

(assert (=> b!749274 m!698933))

(declare-fun m!698935 () Bool)

(assert (=> b!749267 m!698935))

(declare-fun m!698937 () Bool)

(assert (=> b!749267 m!698937))

(assert (=> b!749261 m!698899))

(assert (=> b!749261 m!698899))

(declare-fun m!698939 () Bool)

(assert (=> b!749261 m!698939))

(assert (=> b!749261 m!698939))

(assert (=> b!749261 m!698899))

(declare-fun m!698941 () Bool)

(assert (=> b!749261 m!698941))

(assert (=> b!749270 m!698899))

(assert (=> b!749270 m!698899))

(declare-fun m!698943 () Bool)

(assert (=> b!749270 m!698943))

(assert (=> b!749256 m!698931))

(declare-fun m!698945 () Bool)

(assert (=> b!749256 m!698945))

(declare-fun m!698947 () Bool)

(assert (=> b!749272 m!698947))

(assert (=> b!749263 m!698899))

(assert (=> b!749263 m!698899))

(assert (=> b!749263 m!698921))

(assert (=> b!749257 m!698899))

(assert (=> b!749257 m!698899))

(declare-fun m!698949 () Bool)

(assert (=> b!749257 m!698949))

(push 1)

