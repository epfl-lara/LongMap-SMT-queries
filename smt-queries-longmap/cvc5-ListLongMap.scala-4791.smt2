; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65806 () Bool)

(assert start!65806)

(declare-fun b!757220 () Bool)

(declare-fun res!512087 () Bool)

(declare-fun e!422212 () Bool)

(assert (=> b!757220 (=> (not res!512087) (not e!422212))))

(declare-datatypes ((array!41979 0))(
  ( (array!41980 (arr!20103 (Array (_ BitVec 32) (_ BitVec 64))) (size!20524 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41979)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757220 (= res!512087 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757221 () Bool)

(declare-fun e!422207 () Bool)

(declare-fun e!422211 () Bool)

(assert (=> b!757221 (= e!422207 e!422211)))

(declare-fun res!512093 () Bool)

(assert (=> b!757221 (=> res!512093 e!422211)))

(declare-fun lt!337200 () (_ BitVec 64))

(declare-fun lt!337201 () (_ BitVec 64))

(assert (=> b!757221 (= res!512093 (= lt!337200 lt!337201))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!757221 (= lt!337200 (select (store (arr!20103 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!757222 () Bool)

(declare-datatypes ((Unit!26192 0))(
  ( (Unit!26193) )
))
(declare-fun e!422206 () Unit!26192)

(declare-fun Unit!26194 () Unit!26192)

(assert (=> b!757222 (= e!422206 Unit!26194)))

(declare-fun b!757223 () Bool)

(declare-fun e!422203 () Bool)

(assert (=> b!757223 (= e!422212 e!422203)))

(declare-fun res!512092 () Bool)

(assert (=> b!757223 (=> (not res!512092) (not e!422203))))

(declare-datatypes ((SeekEntryResult!7703 0))(
  ( (MissingZero!7703 (index!33180 (_ BitVec 32))) (Found!7703 (index!33181 (_ BitVec 32))) (Intermediate!7703 (undefined!8515 Bool) (index!33182 (_ BitVec 32)) (x!64077 (_ BitVec 32))) (Undefined!7703) (MissingVacant!7703 (index!33183 (_ BitVec 32))) )
))
(declare-fun lt!337196 () SeekEntryResult!7703)

(assert (=> b!757223 (= res!512092 (or (= lt!337196 (MissingZero!7703 i!1173)) (= lt!337196 (MissingVacant!7703 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41979 (_ BitVec 32)) SeekEntryResult!7703)

(assert (=> b!757223 (= lt!337196 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!757224 () Bool)

(declare-fun res!512101 () Bool)

(assert (=> b!757224 (=> (not res!512101) (not e!422203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41979 (_ BitVec 32)) Bool)

(assert (=> b!757224 (= res!512101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757225 () Bool)

(declare-fun e!422208 () Bool)

(declare-fun lt!337195 () SeekEntryResult!7703)

(declare-fun lt!337198 () SeekEntryResult!7703)

(assert (=> b!757225 (= e!422208 (= lt!337195 lt!337198))))

(declare-fun lt!337194 () SeekEntryResult!7703)

(declare-fun b!757226 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!422213 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41979 (_ BitVec 32)) SeekEntryResult!7703)

(assert (=> b!757226 (= e!422213 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20103 a!3186) j!159) a!3186 mask!3328) lt!337194))))

(declare-fun b!757227 () Bool)

(declare-fun e!422205 () Bool)

(assert (=> b!757227 (= e!422205 e!422207)))

(declare-fun res!512098 () Bool)

(assert (=> b!757227 (=> res!512098 e!422207)))

(declare-fun lt!337204 () SeekEntryResult!7703)

(assert (=> b!757227 (= res!512098 (not (= lt!337198 lt!337204)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41979 (_ BitVec 32)) SeekEntryResult!7703)

(assert (=> b!757227 (= lt!337198 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20103 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757228 () Bool)

(declare-fun res!512095 () Bool)

(declare-fun e!422202 () Bool)

(assert (=> b!757228 (=> (not res!512095) (not e!422202))))

(assert (=> b!757228 (= res!512095 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20103 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757229 () Bool)

(assert (=> b!757229 (= e!422203 e!422202)))

(declare-fun res!512091 () Bool)

(assert (=> b!757229 (=> (not res!512091) (not e!422202))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757229 (= res!512091 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20103 a!3186) j!159) mask!3328) (select (arr!20103 a!3186) j!159) a!3186 mask!3328) lt!337194))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757229 (= lt!337194 (Intermediate!7703 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757230 () Bool)

(declare-fun res!512097 () Bool)

(assert (=> b!757230 (=> (not res!512097) (not e!422208))))

(declare-fun lt!337199 () array!41979)

(assert (=> b!757230 (= res!512097 (= (seekEntryOrOpen!0 lt!337201 lt!337199 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337201 lt!337199 mask!3328)))))

(declare-fun res!512102 () Bool)

(assert (=> start!65806 (=> (not res!512102) (not e!422212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65806 (= res!512102 (validMask!0 mask!3328))))

(assert (=> start!65806 e!422212))

(assert (=> start!65806 true))

(declare-fun array_inv!15899 (array!41979) Bool)

(assert (=> start!65806 (array_inv!15899 a!3186)))

(declare-fun b!757231 () Bool)

(declare-fun e!422209 () Bool)

(assert (=> b!757231 (= e!422202 e!422209)))

(declare-fun res!512100 () Bool)

(assert (=> b!757231 (=> (not res!512100) (not e!422209))))

(declare-fun lt!337202 () SeekEntryResult!7703)

(declare-fun lt!337197 () SeekEntryResult!7703)

(assert (=> b!757231 (= res!512100 (= lt!337202 lt!337197))))

(assert (=> b!757231 (= lt!337197 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337201 lt!337199 mask!3328))))

(assert (=> b!757231 (= lt!337202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337201 mask!3328) lt!337201 lt!337199 mask!3328))))

(assert (=> b!757231 (= lt!337201 (select (store (arr!20103 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!757231 (= lt!337199 (array!41980 (store (arr!20103 a!3186) i!1173 k!2102) (size!20524 a!3186)))))

(declare-fun b!757232 () Bool)

(assert (=> b!757232 (= e!422209 (not e!422205))))

(declare-fun res!512094 () Bool)

(assert (=> b!757232 (=> res!512094 e!422205)))

(assert (=> b!757232 (= res!512094 (or (not (is-Intermediate!7703 lt!337197)) (bvslt x!1131 (x!64077 lt!337197)) (not (= x!1131 (x!64077 lt!337197))) (not (= index!1321 (index!33182 lt!337197)))))))

(declare-fun e!422210 () Bool)

(assert (=> b!757232 e!422210))

(declare-fun res!512096 () Bool)

(assert (=> b!757232 (=> (not res!512096) (not e!422210))))

(assert (=> b!757232 (= res!512096 (= lt!337195 lt!337204))))

(assert (=> b!757232 (= lt!337204 (Found!7703 j!159))))

(assert (=> b!757232 (= lt!337195 (seekEntryOrOpen!0 (select (arr!20103 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757232 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337203 () Unit!26192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26192)

(assert (=> b!757232 (= lt!337203 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757233 () Bool)

(declare-fun Unit!26195 () Unit!26192)

(assert (=> b!757233 (= e!422206 Unit!26195)))

(assert (=> b!757233 false))

(declare-fun b!757234 () Bool)

(assert (=> b!757234 (= e!422213 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20103 a!3186) j!159) a!3186 mask!3328) (Found!7703 j!159)))))

(declare-fun b!757235 () Bool)

(assert (=> b!757235 (= e!422210 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20103 a!3186) j!159) a!3186 mask!3328) lt!337204))))

(declare-fun b!757236 () Bool)

(declare-fun res!512088 () Bool)

(assert (=> b!757236 (=> (not res!512088) (not e!422212))))

(assert (=> b!757236 (= res!512088 (and (= (size!20524 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20524 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20524 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757237 () Bool)

(declare-fun res!512099 () Bool)

(assert (=> b!757237 (=> (not res!512099) (not e!422212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757237 (= res!512099 (validKeyInArray!0 k!2102))))

(declare-fun b!757238 () Bool)

(declare-fun res!512089 () Bool)

(assert (=> b!757238 (=> (not res!512089) (not e!422202))))

(assert (=> b!757238 (= res!512089 e!422213)))

(declare-fun c!82948 () Bool)

(assert (=> b!757238 (= c!82948 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757239 () Bool)

(assert (=> b!757239 (= e!422211 true)))

(assert (=> b!757239 e!422208))

(declare-fun res!512103 () Bool)

(assert (=> b!757239 (=> (not res!512103) (not e!422208))))

(assert (=> b!757239 (= res!512103 (= lt!337200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337205 () Unit!26192)

(assert (=> b!757239 (= lt!337205 e!422206)))

(declare-fun c!82947 () Bool)

(assert (=> b!757239 (= c!82947 (= lt!337200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757240 () Bool)

(declare-fun res!512104 () Bool)

(assert (=> b!757240 (=> (not res!512104) (not e!422203))))

(declare-datatypes ((List!14105 0))(
  ( (Nil!14102) (Cons!14101 (h!15173 (_ BitVec 64)) (t!20420 List!14105)) )
))
(declare-fun arrayNoDuplicates!0 (array!41979 (_ BitVec 32) List!14105) Bool)

(assert (=> b!757240 (= res!512104 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14102))))

(declare-fun b!757241 () Bool)

(declare-fun res!512105 () Bool)

(assert (=> b!757241 (=> (not res!512105) (not e!422203))))

(assert (=> b!757241 (= res!512105 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20524 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20524 a!3186))))))

(declare-fun b!757242 () Bool)

(declare-fun res!512090 () Bool)

(assert (=> b!757242 (=> (not res!512090) (not e!422212))))

(assert (=> b!757242 (= res!512090 (validKeyInArray!0 (select (arr!20103 a!3186) j!159)))))

(assert (= (and start!65806 res!512102) b!757236))

(assert (= (and b!757236 res!512088) b!757242))

(assert (= (and b!757242 res!512090) b!757237))

(assert (= (and b!757237 res!512099) b!757220))

(assert (= (and b!757220 res!512087) b!757223))

(assert (= (and b!757223 res!512092) b!757224))

(assert (= (and b!757224 res!512101) b!757240))

(assert (= (and b!757240 res!512104) b!757241))

(assert (= (and b!757241 res!512105) b!757229))

(assert (= (and b!757229 res!512091) b!757228))

(assert (= (and b!757228 res!512095) b!757238))

(assert (= (and b!757238 c!82948) b!757226))

(assert (= (and b!757238 (not c!82948)) b!757234))

(assert (= (and b!757238 res!512089) b!757231))

(assert (= (and b!757231 res!512100) b!757232))

(assert (= (and b!757232 res!512096) b!757235))

(assert (= (and b!757232 (not res!512094)) b!757227))

(assert (= (and b!757227 (not res!512098)) b!757221))

(assert (= (and b!757221 (not res!512093)) b!757239))

(assert (= (and b!757239 c!82947) b!757233))

(assert (= (and b!757239 (not c!82947)) b!757222))

(assert (= (and b!757239 res!512103) b!757230))

(assert (= (and b!757230 res!512097) b!757225))

(declare-fun m!704983 () Bool)

(assert (=> b!757228 m!704983))

(declare-fun m!704985 () Bool)

(assert (=> b!757230 m!704985))

(declare-fun m!704987 () Bool)

(assert (=> b!757230 m!704987))

(declare-fun m!704989 () Bool)

(assert (=> b!757232 m!704989))

(assert (=> b!757232 m!704989))

(declare-fun m!704991 () Bool)

(assert (=> b!757232 m!704991))

(declare-fun m!704993 () Bool)

(assert (=> b!757232 m!704993))

(declare-fun m!704995 () Bool)

(assert (=> b!757232 m!704995))

(declare-fun m!704997 () Bool)

(assert (=> b!757224 m!704997))

(declare-fun m!704999 () Bool)

(assert (=> b!757223 m!704999))

(assert (=> b!757235 m!704989))

(assert (=> b!757235 m!704989))

(declare-fun m!705001 () Bool)

(assert (=> b!757235 m!705001))

(declare-fun m!705003 () Bool)

(assert (=> b!757221 m!705003))

(declare-fun m!705005 () Bool)

(assert (=> b!757221 m!705005))

(declare-fun m!705007 () Bool)

(assert (=> b!757240 m!705007))

(declare-fun m!705009 () Bool)

(assert (=> start!65806 m!705009))

(declare-fun m!705011 () Bool)

(assert (=> start!65806 m!705011))

(declare-fun m!705013 () Bool)

(assert (=> b!757231 m!705013))

(declare-fun m!705015 () Bool)

(assert (=> b!757231 m!705015))

(declare-fun m!705017 () Bool)

(assert (=> b!757231 m!705017))

(assert (=> b!757231 m!705003))

(declare-fun m!705019 () Bool)

(assert (=> b!757231 m!705019))

(assert (=> b!757231 m!705013))

(assert (=> b!757227 m!704989))

(assert (=> b!757227 m!704989))

(declare-fun m!705021 () Bool)

(assert (=> b!757227 m!705021))

(assert (=> b!757242 m!704989))

(assert (=> b!757242 m!704989))

(declare-fun m!705023 () Bool)

(assert (=> b!757242 m!705023))

(declare-fun m!705025 () Bool)

(assert (=> b!757237 m!705025))

(assert (=> b!757229 m!704989))

(assert (=> b!757229 m!704989))

(declare-fun m!705027 () Bool)

(assert (=> b!757229 m!705027))

(assert (=> b!757229 m!705027))

(assert (=> b!757229 m!704989))

(declare-fun m!705029 () Bool)

(assert (=> b!757229 m!705029))

(declare-fun m!705031 () Bool)

(assert (=> b!757220 m!705031))

(assert (=> b!757226 m!704989))

(assert (=> b!757226 m!704989))

(declare-fun m!705033 () Bool)

(assert (=> b!757226 m!705033))

(assert (=> b!757234 m!704989))

(assert (=> b!757234 m!704989))

(assert (=> b!757234 m!705021))

(push 1)

