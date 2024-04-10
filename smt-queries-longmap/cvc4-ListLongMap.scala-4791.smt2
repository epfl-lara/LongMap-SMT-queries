; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65810 () Bool)

(assert start!65810)

(declare-fun b!757358 () Bool)

(declare-fun e!422284 () Bool)

(declare-fun e!422285 () Bool)

(assert (=> b!757358 (= e!422284 e!422285)))

(declare-fun res!512212 () Bool)

(assert (=> b!757358 (=> (not res!512212) (not e!422285))))

(declare-datatypes ((array!41983 0))(
  ( (array!41984 (arr!20105 (Array (_ BitVec 32) (_ BitVec 64))) (size!20526 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41983)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7705 0))(
  ( (MissingZero!7705 (index!33188 (_ BitVec 32))) (Found!7705 (index!33189 (_ BitVec 32))) (Intermediate!7705 (undefined!8517 Bool) (index!33190 (_ BitVec 32)) (x!64079 (_ BitVec 32))) (Undefined!7705) (MissingVacant!7705 (index!33191 (_ BitVec 32))) )
))
(declare-fun lt!337273 () SeekEntryResult!7705)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41983 (_ BitVec 32)) SeekEntryResult!7705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757358 (= res!512212 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20105 a!3186) j!159) mask!3328) (select (arr!20105 a!3186) j!159) a!3186 mask!3328) lt!337273))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757358 (= lt!337273 (Intermediate!7705 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757359 () Bool)

(declare-fun res!512209 () Bool)

(declare-fun e!422279 () Bool)

(assert (=> b!757359 (=> (not res!512209) (not e!422279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757359 (= res!512209 (validKeyInArray!0 (select (arr!20105 a!3186) j!159)))))

(declare-fun b!757360 () Bool)

(declare-fun res!512205 () Bool)

(assert (=> b!757360 (=> (not res!512205) (not e!422279))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757360 (= res!512205 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757362 () Bool)

(declare-fun res!512215 () Bool)

(assert (=> b!757362 (=> (not res!512215) (not e!422279))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757362 (= res!512215 (and (= (size!20526 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20526 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20526 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757363 () Bool)

(declare-fun e!422278 () Bool)

(assert (=> b!757363 (= e!422285 e!422278)))

(declare-fun res!512213 () Bool)

(assert (=> b!757363 (=> (not res!512213) (not e!422278))))

(declare-fun lt!337272 () SeekEntryResult!7705)

(declare-fun lt!337267 () SeekEntryResult!7705)

(assert (=> b!757363 (= res!512213 (= lt!337272 lt!337267))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337271 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!337276 () array!41983)

(assert (=> b!757363 (= lt!337267 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337271 lt!337276 mask!3328))))

(assert (=> b!757363 (= lt!337272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337271 mask!3328) lt!337271 lt!337276 mask!3328))))

(assert (=> b!757363 (= lt!337271 (select (store (arr!20105 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!757363 (= lt!337276 (array!41984 (store (arr!20105 a!3186) i!1173 k!2102) (size!20526 a!3186)))))

(declare-fun b!757364 () Bool)

(declare-fun e!422282 () Bool)

(declare-fun lt!337270 () SeekEntryResult!7705)

(declare-fun lt!337268 () SeekEntryResult!7705)

(assert (=> b!757364 (= e!422282 (= lt!337270 lt!337268))))

(declare-fun b!757365 () Bool)

(declare-fun res!512203 () Bool)

(assert (=> b!757365 (=> (not res!512203) (not e!422285))))

(assert (=> b!757365 (= res!512203 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20105 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!422276 () Bool)

(declare-fun b!757366 () Bool)

(assert (=> b!757366 (= e!422276 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20105 a!3186) j!159) a!3186 mask!3328) lt!337273))))

(declare-fun e!422274 () Bool)

(declare-fun b!757367 () Bool)

(declare-fun lt!337269 () SeekEntryResult!7705)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41983 (_ BitVec 32)) SeekEntryResult!7705)

(assert (=> b!757367 (= e!422274 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20105 a!3186) j!159) a!3186 mask!3328) lt!337269))))

(declare-fun b!757368 () Bool)

(assert (=> b!757368 (= e!422279 e!422284)))

(declare-fun res!512211 () Bool)

(assert (=> b!757368 (=> (not res!512211) (not e!422284))))

(declare-fun lt!337275 () SeekEntryResult!7705)

(assert (=> b!757368 (= res!512211 (or (= lt!337275 (MissingZero!7705 i!1173)) (= lt!337275 (MissingVacant!7705 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41983 (_ BitVec 32)) SeekEntryResult!7705)

(assert (=> b!757368 (= lt!337275 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!757361 () Bool)

(declare-fun e!422275 () Bool)

(assert (=> b!757361 (= e!422275 true)))

(assert (=> b!757361 e!422282))

(declare-fun res!512206 () Bool)

(assert (=> b!757361 (=> (not res!512206) (not e!422282))))

(declare-fun lt!337274 () (_ BitVec 64))

(assert (=> b!757361 (= res!512206 (= lt!337274 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26200 0))(
  ( (Unit!26201) )
))
(declare-fun lt!337266 () Unit!26200)

(declare-fun e!422283 () Unit!26200)

(assert (=> b!757361 (= lt!337266 e!422283)))

(declare-fun c!82959 () Bool)

(assert (=> b!757361 (= c!82959 (= lt!337274 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!512207 () Bool)

(assert (=> start!65810 (=> (not res!512207) (not e!422279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65810 (= res!512207 (validMask!0 mask!3328))))

(assert (=> start!65810 e!422279))

(assert (=> start!65810 true))

(declare-fun array_inv!15901 (array!41983) Bool)

(assert (=> start!65810 (array_inv!15901 a!3186)))

(declare-fun b!757369 () Bool)

(declare-fun res!512214 () Bool)

(assert (=> b!757369 (=> (not res!512214) (not e!422279))))

(assert (=> b!757369 (= res!512214 (validKeyInArray!0 k!2102))))

(declare-fun b!757370 () Bool)

(declare-fun Unit!26202 () Unit!26200)

(assert (=> b!757370 (= e!422283 Unit!26202)))

(declare-fun b!757371 () Bool)

(declare-fun e!422277 () Bool)

(declare-fun e!422281 () Bool)

(assert (=> b!757371 (= e!422277 e!422281)))

(declare-fun res!512219 () Bool)

(assert (=> b!757371 (=> res!512219 e!422281)))

(assert (=> b!757371 (= res!512219 (not (= lt!337268 lt!337269)))))

(assert (=> b!757371 (= lt!337268 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20105 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757372 () Bool)

(assert (=> b!757372 (= e!422278 (not e!422277))))

(declare-fun res!512218 () Bool)

(assert (=> b!757372 (=> res!512218 e!422277)))

(assert (=> b!757372 (= res!512218 (or (not (is-Intermediate!7705 lt!337267)) (bvslt x!1131 (x!64079 lt!337267)) (not (= x!1131 (x!64079 lt!337267))) (not (= index!1321 (index!33190 lt!337267)))))))

(assert (=> b!757372 e!422274))

(declare-fun res!512202 () Bool)

(assert (=> b!757372 (=> (not res!512202) (not e!422274))))

(assert (=> b!757372 (= res!512202 (= lt!337270 lt!337269))))

(assert (=> b!757372 (= lt!337269 (Found!7705 j!159))))

(assert (=> b!757372 (= lt!337270 (seekEntryOrOpen!0 (select (arr!20105 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41983 (_ BitVec 32)) Bool)

(assert (=> b!757372 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337277 () Unit!26200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26200)

(assert (=> b!757372 (= lt!337277 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757373 () Bool)

(assert (=> b!757373 (= e!422276 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20105 a!3186) j!159) a!3186 mask!3328) (Found!7705 j!159)))))

(declare-fun b!757374 () Bool)

(declare-fun res!512217 () Bool)

(assert (=> b!757374 (=> (not res!512217) (not e!422284))))

(assert (=> b!757374 (= res!512217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757375 () Bool)

(declare-fun res!512210 () Bool)

(assert (=> b!757375 (=> (not res!512210) (not e!422284))))

(declare-datatypes ((List!14107 0))(
  ( (Nil!14104) (Cons!14103 (h!15175 (_ BitVec 64)) (t!20422 List!14107)) )
))
(declare-fun arrayNoDuplicates!0 (array!41983 (_ BitVec 32) List!14107) Bool)

(assert (=> b!757375 (= res!512210 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14104))))

(declare-fun b!757376 () Bool)

(assert (=> b!757376 (= e!422281 e!422275)))

(declare-fun res!512216 () Bool)

(assert (=> b!757376 (=> res!512216 e!422275)))

(assert (=> b!757376 (= res!512216 (= lt!337274 lt!337271))))

(assert (=> b!757376 (= lt!337274 (select (store (arr!20105 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!757377 () Bool)

(declare-fun res!512201 () Bool)

(assert (=> b!757377 (=> (not res!512201) (not e!422285))))

(assert (=> b!757377 (= res!512201 e!422276)))

(declare-fun c!82960 () Bool)

(assert (=> b!757377 (= c!82960 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757378 () Bool)

(declare-fun Unit!26203 () Unit!26200)

(assert (=> b!757378 (= e!422283 Unit!26203)))

(assert (=> b!757378 false))

(declare-fun b!757379 () Bool)

(declare-fun res!512208 () Bool)

(assert (=> b!757379 (=> (not res!512208) (not e!422284))))

(assert (=> b!757379 (= res!512208 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20526 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20526 a!3186))))))

(declare-fun b!757380 () Bool)

(declare-fun res!512204 () Bool)

(assert (=> b!757380 (=> (not res!512204) (not e!422282))))

(assert (=> b!757380 (= res!512204 (= (seekEntryOrOpen!0 lt!337271 lt!337276 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337271 lt!337276 mask!3328)))))

(assert (= (and start!65810 res!512207) b!757362))

(assert (= (and b!757362 res!512215) b!757359))

(assert (= (and b!757359 res!512209) b!757369))

(assert (= (and b!757369 res!512214) b!757360))

(assert (= (and b!757360 res!512205) b!757368))

(assert (= (and b!757368 res!512211) b!757374))

(assert (= (and b!757374 res!512217) b!757375))

(assert (= (and b!757375 res!512210) b!757379))

(assert (= (and b!757379 res!512208) b!757358))

(assert (= (and b!757358 res!512212) b!757365))

(assert (= (and b!757365 res!512203) b!757377))

(assert (= (and b!757377 c!82960) b!757366))

(assert (= (and b!757377 (not c!82960)) b!757373))

(assert (= (and b!757377 res!512201) b!757363))

(assert (= (and b!757363 res!512213) b!757372))

(assert (= (and b!757372 res!512202) b!757367))

(assert (= (and b!757372 (not res!512218)) b!757371))

(assert (= (and b!757371 (not res!512219)) b!757376))

(assert (= (and b!757376 (not res!512216)) b!757361))

(assert (= (and b!757361 c!82959) b!757378))

(assert (= (and b!757361 (not c!82959)) b!757370))

(assert (= (and b!757361 res!512206) b!757380))

(assert (= (and b!757380 res!512204) b!757364))

(declare-fun m!705087 () Bool)

(assert (=> b!757360 m!705087))

(declare-fun m!705089 () Bool)

(assert (=> b!757375 m!705089))

(declare-fun m!705091 () Bool)

(assert (=> b!757363 m!705091))

(declare-fun m!705093 () Bool)

(assert (=> b!757363 m!705093))

(declare-fun m!705095 () Bool)

(assert (=> b!757363 m!705095))

(declare-fun m!705097 () Bool)

(assert (=> b!757363 m!705097))

(declare-fun m!705099 () Bool)

(assert (=> b!757363 m!705099))

(assert (=> b!757363 m!705091))

(declare-fun m!705101 () Bool)

(assert (=> b!757369 m!705101))

(declare-fun m!705103 () Bool)

(assert (=> b!757371 m!705103))

(assert (=> b!757371 m!705103))

(declare-fun m!705105 () Bool)

(assert (=> b!757371 m!705105))

(declare-fun m!705107 () Bool)

(assert (=> b!757365 m!705107))

(declare-fun m!705109 () Bool)

(assert (=> b!757368 m!705109))

(assert (=> b!757372 m!705103))

(assert (=> b!757372 m!705103))

(declare-fun m!705111 () Bool)

(assert (=> b!757372 m!705111))

(declare-fun m!705113 () Bool)

(assert (=> b!757372 m!705113))

(declare-fun m!705115 () Bool)

(assert (=> b!757372 m!705115))

(declare-fun m!705117 () Bool)

(assert (=> start!65810 m!705117))

(declare-fun m!705119 () Bool)

(assert (=> start!65810 m!705119))

(assert (=> b!757373 m!705103))

(assert (=> b!757373 m!705103))

(assert (=> b!757373 m!705105))

(assert (=> b!757367 m!705103))

(assert (=> b!757367 m!705103))

(declare-fun m!705121 () Bool)

(assert (=> b!757367 m!705121))

(assert (=> b!757366 m!705103))

(assert (=> b!757366 m!705103))

(declare-fun m!705123 () Bool)

(assert (=> b!757366 m!705123))

(assert (=> b!757359 m!705103))

(assert (=> b!757359 m!705103))

(declare-fun m!705125 () Bool)

(assert (=> b!757359 m!705125))

(assert (=> b!757376 m!705095))

(declare-fun m!705127 () Bool)

(assert (=> b!757376 m!705127))

(declare-fun m!705129 () Bool)

(assert (=> b!757374 m!705129))

(assert (=> b!757358 m!705103))

(assert (=> b!757358 m!705103))

(declare-fun m!705131 () Bool)

(assert (=> b!757358 m!705131))

(assert (=> b!757358 m!705131))

(assert (=> b!757358 m!705103))

(declare-fun m!705133 () Bool)

(assert (=> b!757358 m!705133))

(declare-fun m!705135 () Bool)

(assert (=> b!757380 m!705135))

(declare-fun m!705137 () Bool)

(assert (=> b!757380 m!705137))

(push 1)

