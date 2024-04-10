; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64946 () Bool)

(assert start!64946)

(declare-fun b!733389 () Bool)

(declare-fun res!492882 () Bool)

(declare-fun e!410355 () Bool)

(assert (=> b!733389 (=> (not res!492882) (not e!410355))))

(declare-datatypes ((array!41257 0))(
  ( (array!41258 (arr!19745 (Array (_ BitVec 32) (_ BitVec 64))) (size!20166 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41257)

(declare-datatypes ((List!13747 0))(
  ( (Nil!13744) (Cons!13743 (h!14809 (_ BitVec 64)) (t!20062 List!13747)) )
))
(declare-fun arrayNoDuplicates!0 (array!41257 (_ BitVec 32) List!13747) Bool)

(assert (=> b!733389 (= res!492882 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13744))))

(declare-fun b!733391 () Bool)

(declare-fun e!410353 () Bool)

(assert (=> b!733391 (= e!410353 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7345 0))(
  ( (MissingZero!7345 (index!31748 (_ BitVec 32))) (Found!7345 (index!31749 (_ BitVec 32))) (Intermediate!7345 (undefined!8157 Bool) (index!31750 (_ BitVec 32)) (x!62735 (_ BitVec 32))) (Undefined!7345) (MissingVacant!7345 (index!31751 (_ BitVec 32))) )
))
(declare-fun lt!325051 () SeekEntryResult!7345)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41257 (_ BitVec 32)) SeekEntryResult!7345)

(assert (=> b!733391 (= lt!325051 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19745 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733392 () Bool)

(declare-fun res!492884 () Bool)

(assert (=> b!733392 (=> (not res!492884) (not e!410355))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733392 (= res!492884 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20166 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20166 a!3186))))))

(declare-fun b!733393 () Bool)

(declare-fun e!410358 () Bool)

(declare-fun e!410356 () Bool)

(assert (=> b!733393 (= e!410358 e!410356)))

(declare-fun res!492895 () Bool)

(assert (=> b!733393 (=> (not res!492895) (not e!410356))))

(declare-fun lt!325050 () SeekEntryResult!7345)

(declare-fun lt!325056 () SeekEntryResult!7345)

(assert (=> b!733393 (= res!492895 (= lt!325050 lt!325056))))

(declare-fun lt!325057 () array!41257)

(declare-fun lt!325052 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41257 (_ BitVec 32)) SeekEntryResult!7345)

(assert (=> b!733393 (= lt!325056 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325052 lt!325057 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733393 (= lt!325050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325052 mask!3328) lt!325052 lt!325057 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!733393 (= lt!325052 (select (store (arr!19745 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!733393 (= lt!325057 (array!41258 (store (arr!19745 a!3186) i!1173 k!2102) (size!20166 a!3186)))))

(declare-fun e!410360 () Bool)

(declare-fun lt!325058 () SeekEntryResult!7345)

(declare-fun b!733394 () Bool)

(assert (=> b!733394 (= e!410360 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19745 a!3186) j!159) a!3186 mask!3328) lt!325058))))

(declare-fun b!733395 () Bool)

(declare-fun e!410352 () Bool)

(assert (=> b!733395 (= e!410352 e!410360)))

(declare-fun res!492887 () Bool)

(assert (=> b!733395 (=> (not res!492887) (not e!410360))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41257 (_ BitVec 32)) SeekEntryResult!7345)

(assert (=> b!733395 (= res!492887 (= (seekEntryOrOpen!0 (select (arr!19745 a!3186) j!159) a!3186 mask!3328) lt!325058))))

(assert (=> b!733395 (= lt!325058 (Found!7345 j!159))))

(declare-fun e!410359 () Bool)

(declare-fun lt!325054 () SeekEntryResult!7345)

(declare-fun b!733396 () Bool)

(assert (=> b!733396 (= e!410359 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19745 a!3186) j!159) a!3186 mask!3328) lt!325054))))

(declare-fun b!733397 () Bool)

(declare-fun res!492886 () Bool)

(assert (=> b!733397 (=> (not res!492886) (not e!410355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41257 (_ BitVec 32)) Bool)

(assert (=> b!733397 (= res!492886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733398 () Bool)

(declare-fun res!492896 () Bool)

(assert (=> b!733398 (=> (not res!492896) (not e!410358))))

(assert (=> b!733398 (= res!492896 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19745 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733399 () Bool)

(declare-fun e!410351 () Bool)

(assert (=> b!733399 (= e!410356 (not e!410351))))

(declare-fun res!492891 () Bool)

(assert (=> b!733399 (=> res!492891 e!410351)))

(assert (=> b!733399 (= res!492891 (or (not (is-Intermediate!7345 lt!325056)) (bvsge x!1131 (x!62735 lt!325056))))))

(assert (=> b!733399 e!410352))

(declare-fun res!492881 () Bool)

(assert (=> b!733399 (=> (not res!492881) (not e!410352))))

(assert (=> b!733399 (= res!492881 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25008 0))(
  ( (Unit!25009) )
))
(declare-fun lt!325055 () Unit!25008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25008)

(assert (=> b!733399 (= lt!325055 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733400 () Bool)

(declare-fun res!492893 () Bool)

(declare-fun e!410357 () Bool)

(assert (=> b!733400 (=> (not res!492893) (not e!410357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733400 (= res!492893 (validKeyInArray!0 k!2102))))

(declare-fun b!733401 () Bool)

(declare-fun res!492890 () Bool)

(assert (=> b!733401 (=> (not res!492890) (not e!410357))))

(declare-fun arrayContainsKey!0 (array!41257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733401 (= res!492890 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733402 () Bool)

(assert (=> b!733402 (= e!410357 e!410355)))

(declare-fun res!492885 () Bool)

(assert (=> b!733402 (=> (not res!492885) (not e!410355))))

(declare-fun lt!325049 () SeekEntryResult!7345)

(assert (=> b!733402 (= res!492885 (or (= lt!325049 (MissingZero!7345 i!1173)) (= lt!325049 (MissingVacant!7345 i!1173))))))

(assert (=> b!733402 (= lt!325049 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!733390 () Bool)

(assert (=> b!733390 (= e!410359 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19745 a!3186) j!159) a!3186 mask!3328) (Found!7345 j!159)))))

(declare-fun res!492889 () Bool)

(assert (=> start!64946 (=> (not res!492889) (not e!410357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64946 (= res!492889 (validMask!0 mask!3328))))

(assert (=> start!64946 e!410357))

(assert (=> start!64946 true))

(declare-fun array_inv!15541 (array!41257) Bool)

(assert (=> start!64946 (array_inv!15541 a!3186)))

(declare-fun b!733403 () Bool)

(declare-fun res!492883 () Bool)

(assert (=> b!733403 (=> (not res!492883) (not e!410357))))

(assert (=> b!733403 (= res!492883 (validKeyInArray!0 (select (arr!19745 a!3186) j!159)))))

(declare-fun b!733404 () Bool)

(assert (=> b!733404 (= e!410351 e!410353)))

(declare-fun res!492880 () Bool)

(assert (=> b!733404 (=> res!492880 e!410353)))

(assert (=> b!733404 (= res!492880 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325053 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733404 (= lt!325053 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733405 () Bool)

(declare-fun res!492888 () Bool)

(assert (=> b!733405 (=> (not res!492888) (not e!410358))))

(assert (=> b!733405 (= res!492888 e!410359)))

(declare-fun c!80632 () Bool)

(assert (=> b!733405 (= c!80632 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733406 () Bool)

(declare-fun res!492892 () Bool)

(assert (=> b!733406 (=> (not res!492892) (not e!410357))))

(assert (=> b!733406 (= res!492892 (and (= (size!20166 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20166 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20166 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733407 () Bool)

(assert (=> b!733407 (= e!410355 e!410358)))

(declare-fun res!492894 () Bool)

(assert (=> b!733407 (=> (not res!492894) (not e!410358))))

(assert (=> b!733407 (= res!492894 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19745 a!3186) j!159) mask!3328) (select (arr!19745 a!3186) j!159) a!3186 mask!3328) lt!325054))))

(assert (=> b!733407 (= lt!325054 (Intermediate!7345 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64946 res!492889) b!733406))

(assert (= (and b!733406 res!492892) b!733403))

(assert (= (and b!733403 res!492883) b!733400))

(assert (= (and b!733400 res!492893) b!733401))

(assert (= (and b!733401 res!492890) b!733402))

(assert (= (and b!733402 res!492885) b!733397))

(assert (= (and b!733397 res!492886) b!733389))

(assert (= (and b!733389 res!492882) b!733392))

(assert (= (and b!733392 res!492884) b!733407))

(assert (= (and b!733407 res!492894) b!733398))

(assert (= (and b!733398 res!492896) b!733405))

(assert (= (and b!733405 c!80632) b!733396))

(assert (= (and b!733405 (not c!80632)) b!733390))

(assert (= (and b!733405 res!492888) b!733393))

(assert (= (and b!733393 res!492895) b!733399))

(assert (= (and b!733399 res!492881) b!733395))

(assert (= (and b!733395 res!492887) b!733394))

(assert (= (and b!733399 (not res!492891)) b!733404))

(assert (= (and b!733404 (not res!492880)) b!733391))

(declare-fun m!686287 () Bool)

(assert (=> b!733396 m!686287))

(assert (=> b!733396 m!686287))

(declare-fun m!686289 () Bool)

(assert (=> b!733396 m!686289))

(declare-fun m!686291 () Bool)

(assert (=> b!733402 m!686291))

(declare-fun m!686293 () Bool)

(assert (=> b!733398 m!686293))

(assert (=> b!733395 m!686287))

(assert (=> b!733395 m!686287))

(declare-fun m!686295 () Bool)

(assert (=> b!733395 m!686295))

(assert (=> b!733390 m!686287))

(assert (=> b!733390 m!686287))

(declare-fun m!686297 () Bool)

(assert (=> b!733390 m!686297))

(declare-fun m!686299 () Bool)

(assert (=> b!733397 m!686299))

(assert (=> b!733403 m!686287))

(assert (=> b!733403 m!686287))

(declare-fun m!686301 () Bool)

(assert (=> b!733403 m!686301))

(declare-fun m!686303 () Bool)

(assert (=> b!733399 m!686303))

(declare-fun m!686305 () Bool)

(assert (=> b!733399 m!686305))

(assert (=> b!733407 m!686287))

(assert (=> b!733407 m!686287))

(declare-fun m!686307 () Bool)

(assert (=> b!733407 m!686307))

(assert (=> b!733407 m!686307))

(assert (=> b!733407 m!686287))

(declare-fun m!686309 () Bool)

(assert (=> b!733407 m!686309))

(declare-fun m!686311 () Bool)

(assert (=> b!733401 m!686311))

(assert (=> b!733394 m!686287))

(assert (=> b!733394 m!686287))

(declare-fun m!686313 () Bool)

(assert (=> b!733394 m!686313))

(declare-fun m!686315 () Bool)

(assert (=> b!733400 m!686315))

(declare-fun m!686317 () Bool)

(assert (=> start!64946 m!686317))

(declare-fun m!686319 () Bool)

(assert (=> start!64946 m!686319))

(declare-fun m!686321 () Bool)

(assert (=> b!733389 m!686321))

(assert (=> b!733391 m!686287))

(assert (=> b!733391 m!686287))

(assert (=> b!733391 m!686297))

(declare-fun m!686323 () Bool)

(assert (=> b!733393 m!686323))

(declare-fun m!686325 () Bool)

(assert (=> b!733393 m!686325))

(assert (=> b!733393 m!686323))

(declare-fun m!686327 () Bool)

(assert (=> b!733393 m!686327))

(declare-fun m!686329 () Bool)

(assert (=> b!733393 m!686329))

(declare-fun m!686331 () Bool)

(assert (=> b!733393 m!686331))

(declare-fun m!686333 () Bool)

(assert (=> b!733404 m!686333))

(push 1)

