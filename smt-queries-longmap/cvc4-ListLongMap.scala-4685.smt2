; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65174 () Bool)

(assert start!65174)

(declare-fun b!737044 () Bool)

(declare-fun e!412285 () Bool)

(declare-fun e!412284 () Bool)

(assert (=> b!737044 (= e!412285 e!412284)))

(declare-fun res!495393 () Bool)

(assert (=> b!737044 (=> (not res!495393) (not e!412284))))

(declare-datatypes ((array!41347 0))(
  ( (array!41348 (arr!19787 (Array (_ BitVec 32) (_ BitVec 64))) (size!20208 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41347)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7387 0))(
  ( (MissingZero!7387 (index!31916 (_ BitVec 32))) (Found!7387 (index!31917 (_ BitVec 32))) (Intermediate!7387 (undefined!8199 Bool) (index!31918 (_ BitVec 32)) (x!62913 (_ BitVec 32))) (Undefined!7387) (MissingVacant!7387 (index!31919 (_ BitVec 32))) )
))
(declare-fun lt!326958 () SeekEntryResult!7387)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41347 (_ BitVec 32)) SeekEntryResult!7387)

(assert (=> b!737044 (= res!495393 (= (seekEntryOrOpen!0 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326958))))

(assert (=> b!737044 (= lt!326958 (Found!7387 j!159))))

(declare-fun b!737045 () Bool)

(declare-fun lt!326962 () SeekEntryResult!7387)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!326952 () (_ BitVec 32))

(declare-fun e!412279 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41347 (_ BitVec 32)) SeekEntryResult!7387)

(assert (=> b!737045 (= e!412279 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326952 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326962)))))

(declare-fun b!737046 () Bool)

(declare-fun res!495381 () Bool)

(declare-fun e!412281 () Bool)

(assert (=> b!737046 (=> (not res!495381) (not e!412281))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737046 (= res!495381 (validKeyInArray!0 k!2102))))

(declare-fun b!737047 () Bool)

(declare-fun res!495388 () Bool)

(declare-fun e!412280 () Bool)

(assert (=> b!737047 (=> (not res!495388) (not e!412280))))

(declare-datatypes ((List!13789 0))(
  ( (Nil!13786) (Cons!13785 (h!14857 (_ BitVec 64)) (t!20104 List!13789)) )
))
(declare-fun arrayNoDuplicates!0 (array!41347 (_ BitVec 32) List!13789) Bool)

(assert (=> b!737047 (= res!495388 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13786))))

(declare-fun b!737049 () Bool)

(declare-fun res!495387 () Bool)

(declare-fun e!412286 () Bool)

(assert (=> b!737049 (=> (not res!495387) (not e!412286))))

(declare-fun e!412277 () Bool)

(assert (=> b!737049 (= res!495387 e!412277)))

(declare-fun c!81212 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737049 (= c!81212 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737050 () Bool)

(declare-datatypes ((Unit!25144 0))(
  ( (Unit!25145) )
))
(declare-fun e!412275 () Unit!25144)

(declare-fun Unit!25146 () Unit!25144)

(assert (=> b!737050 (= e!412275 Unit!25146)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!326955 () SeekEntryResult!7387)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41347 (_ BitVec 32)) SeekEntryResult!7387)

(assert (=> b!737050 (= lt!326955 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19787 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326950 () SeekEntryResult!7387)

(assert (=> b!737050 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326952 resIntermediateIndex!5 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326950)))

(declare-fun b!737051 () Bool)

(assert (=> b!737051 (= e!412280 e!412286)))

(declare-fun res!495397 () Bool)

(assert (=> b!737051 (=> (not res!495397) (not e!412286))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737051 (= res!495397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19787 a!3186) j!159) mask!3328) (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326962))))

(assert (=> b!737051 (= lt!326962 (Intermediate!7387 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737052 () Bool)

(declare-fun Unit!25147 () Unit!25144)

(assert (=> b!737052 (= e!412275 Unit!25147)))

(assert (=> b!737052 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326952 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326962)))

(declare-fun b!737053 () Bool)

(declare-fun e!412283 () Bool)

(assert (=> b!737053 (= e!412286 e!412283)))

(declare-fun res!495389 () Bool)

(assert (=> b!737053 (=> (not res!495389) (not e!412283))))

(declare-fun lt!326961 () SeekEntryResult!7387)

(declare-fun lt!326963 () SeekEntryResult!7387)

(assert (=> b!737053 (= res!495389 (= lt!326961 lt!326963))))

(declare-fun lt!326959 () array!41347)

(declare-fun lt!326956 () (_ BitVec 64))

(assert (=> b!737053 (= lt!326963 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326956 lt!326959 mask!3328))))

(assert (=> b!737053 (= lt!326961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326956 mask!3328) lt!326956 lt!326959 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737053 (= lt!326956 (select (store (arr!19787 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!737053 (= lt!326959 (array!41348 (store (arr!19787 a!3186) i!1173 k!2102) (size!20208 a!3186)))))

(declare-fun b!737054 () Bool)

(declare-fun res!495396 () Bool)

(assert (=> b!737054 (=> (not res!495396) (not e!412281))))

(declare-fun arrayContainsKey!0 (array!41347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737054 (= res!495396 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737055 () Bool)

(declare-fun e!412278 () Bool)

(assert (=> b!737055 (= e!412278 true)))

(declare-fun lt!326957 () SeekEntryResult!7387)

(assert (=> b!737055 (= lt!326957 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326952 lt!326956 lt!326959 mask!3328))))

(declare-fun b!737056 () Bool)

(assert (=> b!737056 (= e!412277 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) (Found!7387 j!159)))))

(declare-fun b!737057 () Bool)

(declare-fun res!495391 () Bool)

(assert (=> b!737057 (=> (not res!495391) (not e!412281))))

(assert (=> b!737057 (= res!495391 (validKeyInArray!0 (select (arr!19787 a!3186) j!159)))))

(declare-fun b!737058 () Bool)

(declare-fun res!495390 () Bool)

(assert (=> b!737058 (=> (not res!495390) (not e!412281))))

(assert (=> b!737058 (= res!495390 (and (= (size!20208 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20208 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20208 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737059 () Bool)

(declare-fun e!412282 () Bool)

(assert (=> b!737059 (= e!412282 e!412278)))

(declare-fun res!495395 () Bool)

(assert (=> b!737059 (=> res!495395 e!412278)))

(assert (=> b!737059 (= res!495395 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326952 #b00000000000000000000000000000000) (bvsge lt!326952 (size!20208 a!3186))))))

(declare-fun lt!326954 () Unit!25144)

(assert (=> b!737059 (= lt!326954 e!412275)))

(declare-fun c!81214 () Bool)

(declare-fun lt!326960 () Bool)

(assert (=> b!737059 (= c!81214 lt!326960)))

(assert (=> b!737059 (= lt!326960 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737059 (= lt!326952 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737060 () Bool)

(declare-fun res!495382 () Bool)

(assert (=> b!737060 (=> (not res!495382) (not e!412280))))

(assert (=> b!737060 (= res!495382 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20208 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20208 a!3186))))))

(declare-fun b!737061 () Bool)

(declare-fun res!495386 () Bool)

(assert (=> b!737061 (=> (not res!495386) (not e!412280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41347 (_ BitVec 32)) Bool)

(assert (=> b!737061 (= res!495386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737062 () Bool)

(declare-fun res!495394 () Bool)

(assert (=> b!737062 (=> res!495394 e!412278)))

(assert (=> b!737062 (= res!495394 e!412279)))

(declare-fun c!81213 () Bool)

(assert (=> b!737062 (= c!81213 lt!326960)))

(declare-fun b!737048 () Bool)

(assert (=> b!737048 (= e!412281 e!412280)))

(declare-fun res!495383 () Bool)

(assert (=> b!737048 (=> (not res!495383) (not e!412280))))

(declare-fun lt!326953 () SeekEntryResult!7387)

(assert (=> b!737048 (= res!495383 (or (= lt!326953 (MissingZero!7387 i!1173)) (= lt!326953 (MissingVacant!7387 i!1173))))))

(assert (=> b!737048 (= lt!326953 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!495385 () Bool)

(assert (=> start!65174 (=> (not res!495385) (not e!412281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65174 (= res!495385 (validMask!0 mask!3328))))

(assert (=> start!65174 e!412281))

(assert (=> start!65174 true))

(declare-fun array_inv!15583 (array!41347) Bool)

(assert (=> start!65174 (array_inv!15583 a!3186)))

(declare-fun b!737063 () Bool)

(assert (=> b!737063 (= e!412284 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326958))))

(declare-fun b!737064 () Bool)

(declare-fun res!495392 () Bool)

(assert (=> b!737064 (=> (not res!495392) (not e!412286))))

(assert (=> b!737064 (= res!495392 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19787 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737065 () Bool)

(assert (=> b!737065 (= e!412283 (not e!412282))))

(declare-fun res!495398 () Bool)

(assert (=> b!737065 (=> res!495398 e!412282)))

(assert (=> b!737065 (= res!495398 (or (not (is-Intermediate!7387 lt!326963)) (bvsge x!1131 (x!62913 lt!326963))))))

(assert (=> b!737065 (= lt!326950 (Found!7387 j!159))))

(assert (=> b!737065 e!412285))

(declare-fun res!495384 () Bool)

(assert (=> b!737065 (=> (not res!495384) (not e!412285))))

(assert (=> b!737065 (= res!495384 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326951 () Unit!25144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25144)

(assert (=> b!737065 (= lt!326951 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737066 () Bool)

(assert (=> b!737066 (= e!412277 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326962))))

(declare-fun b!737067 () Bool)

(assert (=> b!737067 (= e!412279 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326952 resIntermediateIndex!5 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326950)))))

(assert (= (and start!65174 res!495385) b!737058))

(assert (= (and b!737058 res!495390) b!737057))

(assert (= (and b!737057 res!495391) b!737046))

(assert (= (and b!737046 res!495381) b!737054))

(assert (= (and b!737054 res!495396) b!737048))

(assert (= (and b!737048 res!495383) b!737061))

(assert (= (and b!737061 res!495386) b!737047))

(assert (= (and b!737047 res!495388) b!737060))

(assert (= (and b!737060 res!495382) b!737051))

(assert (= (and b!737051 res!495397) b!737064))

(assert (= (and b!737064 res!495392) b!737049))

(assert (= (and b!737049 c!81212) b!737066))

(assert (= (and b!737049 (not c!81212)) b!737056))

(assert (= (and b!737049 res!495387) b!737053))

(assert (= (and b!737053 res!495389) b!737065))

(assert (= (and b!737065 res!495384) b!737044))

(assert (= (and b!737044 res!495393) b!737063))

(assert (= (and b!737065 (not res!495398)) b!737059))

(assert (= (and b!737059 c!81214) b!737052))

(assert (= (and b!737059 (not c!81214)) b!737050))

(assert (= (and b!737059 (not res!495395)) b!737062))

(assert (= (and b!737062 c!81213) b!737045))

(assert (= (and b!737062 (not c!81213)) b!737067))

(assert (= (and b!737062 (not res!495394)) b!737055))

(declare-fun m!689023 () Bool)

(assert (=> start!65174 m!689023))

(declare-fun m!689025 () Bool)

(assert (=> start!65174 m!689025))

(declare-fun m!689027 () Bool)

(assert (=> b!737053 m!689027))

(declare-fun m!689029 () Bool)

(assert (=> b!737053 m!689029))

(declare-fun m!689031 () Bool)

(assert (=> b!737053 m!689031))

(assert (=> b!737053 m!689027))

(declare-fun m!689033 () Bool)

(assert (=> b!737053 m!689033))

(declare-fun m!689035 () Bool)

(assert (=> b!737053 m!689035))

(declare-fun m!689037 () Bool)

(assert (=> b!737052 m!689037))

(assert (=> b!737052 m!689037))

(declare-fun m!689039 () Bool)

(assert (=> b!737052 m!689039))

(assert (=> b!737051 m!689037))

(assert (=> b!737051 m!689037))

(declare-fun m!689041 () Bool)

(assert (=> b!737051 m!689041))

(assert (=> b!737051 m!689041))

(assert (=> b!737051 m!689037))

(declare-fun m!689043 () Bool)

(assert (=> b!737051 m!689043))

(declare-fun m!689045 () Bool)

(assert (=> b!737055 m!689045))

(assert (=> b!737045 m!689037))

(assert (=> b!737045 m!689037))

(assert (=> b!737045 m!689039))

(assert (=> b!737067 m!689037))

(assert (=> b!737067 m!689037))

(declare-fun m!689047 () Bool)

(assert (=> b!737067 m!689047))

(assert (=> b!737057 m!689037))

(assert (=> b!737057 m!689037))

(declare-fun m!689049 () Bool)

(assert (=> b!737057 m!689049))

(declare-fun m!689051 () Bool)

(assert (=> b!737059 m!689051))

(assert (=> b!737044 m!689037))

(assert (=> b!737044 m!689037))

(declare-fun m!689053 () Bool)

(assert (=> b!737044 m!689053))

(assert (=> b!737050 m!689037))

(assert (=> b!737050 m!689037))

(declare-fun m!689055 () Bool)

(assert (=> b!737050 m!689055))

(assert (=> b!737050 m!689037))

(assert (=> b!737050 m!689047))

(declare-fun m!689057 () Bool)

(assert (=> b!737048 m!689057))

(declare-fun m!689059 () Bool)

(assert (=> b!737065 m!689059))

(declare-fun m!689061 () Bool)

(assert (=> b!737065 m!689061))

(assert (=> b!737066 m!689037))

(assert (=> b!737066 m!689037))

(declare-fun m!689063 () Bool)

(assert (=> b!737066 m!689063))

(declare-fun m!689065 () Bool)

(assert (=> b!737061 m!689065))

(assert (=> b!737063 m!689037))

(assert (=> b!737063 m!689037))

(declare-fun m!689067 () Bool)

(assert (=> b!737063 m!689067))

(declare-fun m!689069 () Bool)

(assert (=> b!737064 m!689069))

(declare-fun m!689071 () Bool)

(assert (=> b!737047 m!689071))

(declare-fun m!689073 () Bool)

(assert (=> b!737054 m!689073))

(assert (=> b!737056 m!689037))

(assert (=> b!737056 m!689037))

(assert (=> b!737056 m!689055))

(declare-fun m!689075 () Bool)

(assert (=> b!737046 m!689075))

(push 1)

