; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65510 () Bool)

(assert start!65510)

(declare-fun b!747280 () Bool)

(declare-fun res!503925 () Bool)

(declare-fun e!417238 () Bool)

(assert (=> b!747280 (=> res!503925 e!417238)))

(declare-datatypes ((array!41683 0))(
  ( (array!41684 (arr!19955 (Array (_ BitVec 32) (_ BitVec 64))) (size!20376 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41683)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!332156 () (_ BitVec 64))

(assert (=> b!747280 (= res!503925 (= (select (store (arr!19955 a!3186) i!1173 k!2102) index!1321) lt!332156))))

(declare-fun b!747281 () Bool)

(declare-fun res!503928 () Bool)

(assert (=> b!747281 (=> res!503928 e!417238)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7555 0))(
  ( (MissingZero!7555 (index!32588 (_ BitVec 32))) (Found!7555 (index!32589 (_ BitVec 32))) (Intermediate!7555 (undefined!8367 Bool) (index!32590 (_ BitVec 32)) (x!63529 (_ BitVec 32))) (Undefined!7555) (MissingVacant!7555 (index!32591 (_ BitVec 32))) )
))
(declare-fun lt!332161 () SeekEntryResult!7555)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41683 (_ BitVec 32)) SeekEntryResult!7555)

(assert (=> b!747281 (= res!503928 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19955 a!3186) j!159) a!3186 mask!3328) lt!332161)))))

(declare-fun b!747282 () Bool)

(declare-fun res!503934 () Bool)

(declare-fun e!417237 () Bool)

(assert (=> b!747282 (=> (not res!503934) (not e!417237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747282 (= res!503934 (validKeyInArray!0 (select (arr!19955 a!3186) j!159)))))

(declare-fun b!747283 () Bool)

(declare-fun res!503923 () Bool)

(declare-fun e!417244 () Bool)

(assert (=> b!747283 (=> (not res!503923) (not e!417244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41683 (_ BitVec 32)) Bool)

(assert (=> b!747283 (= res!503923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747284 () Bool)

(declare-fun e!417239 () Bool)

(declare-fun e!417243 () Bool)

(assert (=> b!747284 (= e!417239 e!417243)))

(declare-fun res!503924 () Bool)

(assert (=> b!747284 (=> (not res!503924) (not e!417243))))

(declare-fun lt!332158 () SeekEntryResult!7555)

(declare-fun lt!332163 () SeekEntryResult!7555)

(assert (=> b!747284 (= res!503924 (= lt!332158 lt!332163))))

(declare-fun lt!332160 () array!41683)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41683 (_ BitVec 32)) SeekEntryResult!7555)

(assert (=> b!747284 (= lt!332163 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332156 lt!332160 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747284 (= lt!332158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332156 mask!3328) lt!332156 lt!332160 mask!3328))))

(assert (=> b!747284 (= lt!332156 (select (store (arr!19955 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!747284 (= lt!332160 (array!41684 (store (arr!19955 a!3186) i!1173 k!2102) (size!20376 a!3186)))))

(declare-fun res!503935 () Bool)

(assert (=> start!65510 (=> (not res!503935) (not e!417237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65510 (= res!503935 (validMask!0 mask!3328))))

(assert (=> start!65510 e!417237))

(assert (=> start!65510 true))

(declare-fun array_inv!15751 (array!41683) Bool)

(assert (=> start!65510 (array_inv!15751 a!3186)))

(declare-fun e!417241 () Bool)

(declare-fun b!747285 () Bool)

(assert (=> b!747285 (= e!417241 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19955 a!3186) j!159) a!3186 mask!3328) (Found!7555 j!159)))))

(declare-fun b!747286 () Bool)

(declare-fun lt!332162 () SeekEntryResult!7555)

(assert (=> b!747286 (= e!417241 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19955 a!3186) j!159) a!3186 mask!3328) lt!332162))))

(declare-fun b!747287 () Bool)

(declare-datatypes ((Unit!25600 0))(
  ( (Unit!25601) )
))
(declare-fun e!417245 () Unit!25600)

(declare-fun Unit!25602 () Unit!25600)

(assert (=> b!747287 (= e!417245 Unit!25602)))

(declare-fun b!747288 () Bool)

(declare-fun res!503936 () Bool)

(assert (=> b!747288 (=> (not res!503936) (not e!417237))))

(assert (=> b!747288 (= res!503936 (validKeyInArray!0 k!2102))))

(declare-fun b!747289 () Bool)

(declare-fun Unit!25603 () Unit!25600)

(assert (=> b!747289 (= e!417245 Unit!25603)))

(assert (=> b!747289 false))

(declare-fun b!747290 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!417240 () Bool)

(assert (=> b!747290 (= e!417240 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19955 a!3186) j!159) a!3186 mask!3328) lt!332161))))

(declare-fun b!747291 () Bool)

(declare-fun res!503926 () Bool)

(assert (=> b!747291 (=> (not res!503926) (not e!417237))))

(assert (=> b!747291 (= res!503926 (and (= (size!20376 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20376 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20376 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747292 () Bool)

(declare-fun res!503930 () Bool)

(assert (=> b!747292 (=> (not res!503930) (not e!417244))))

(declare-datatypes ((List!13957 0))(
  ( (Nil!13954) (Cons!13953 (h!15025 (_ BitVec 64)) (t!20272 List!13957)) )
))
(declare-fun arrayNoDuplicates!0 (array!41683 (_ BitVec 32) List!13957) Bool)

(assert (=> b!747292 (= res!503930 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13954))))

(declare-fun b!747293 () Bool)

(assert (=> b!747293 (= e!417238 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!747293 (= (select (store (arr!19955 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332159 () Unit!25600)

(assert (=> b!747293 (= lt!332159 e!417245)))

(declare-fun c!82060 () Bool)

(assert (=> b!747293 (= c!82060 (= (select (store (arr!19955 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747294 () Bool)

(declare-fun res!503929 () Bool)

(assert (=> b!747294 (=> (not res!503929) (not e!417237))))

(declare-fun arrayContainsKey!0 (array!41683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747294 (= res!503929 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747295 () Bool)

(assert (=> b!747295 (= e!417243 (not e!417238))))

(declare-fun res!503931 () Bool)

(assert (=> b!747295 (=> res!503931 e!417238)))

(assert (=> b!747295 (= res!503931 (or (not (is-Intermediate!7555 lt!332163)) (bvslt x!1131 (x!63529 lt!332163)) (not (= x!1131 (x!63529 lt!332163))) (not (= index!1321 (index!32590 lt!332163)))))))

(assert (=> b!747295 e!417240))

(declare-fun res!503933 () Bool)

(assert (=> b!747295 (=> (not res!503933) (not e!417240))))

(declare-fun lt!332164 () SeekEntryResult!7555)

(assert (=> b!747295 (= res!503933 (= lt!332164 lt!332161))))

(assert (=> b!747295 (= lt!332161 (Found!7555 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41683 (_ BitVec 32)) SeekEntryResult!7555)

(assert (=> b!747295 (= lt!332164 (seekEntryOrOpen!0 (select (arr!19955 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747295 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332157 () Unit!25600)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25600)

(assert (=> b!747295 (= lt!332157 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747296 () Bool)

(declare-fun res!503939 () Bool)

(assert (=> b!747296 (=> (not res!503939) (not e!417239))))

(assert (=> b!747296 (= res!503939 e!417241)))

(declare-fun c!82059 () Bool)

(assert (=> b!747296 (= c!82059 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747297 () Bool)

(declare-fun res!503938 () Bool)

(assert (=> b!747297 (=> (not res!503938) (not e!417239))))

(assert (=> b!747297 (= res!503938 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19955 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747298 () Bool)

(declare-fun res!503937 () Bool)

(assert (=> b!747298 (=> (not res!503937) (not e!417244))))

(assert (=> b!747298 (= res!503937 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20376 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20376 a!3186))))))

(declare-fun b!747299 () Bool)

(assert (=> b!747299 (= e!417237 e!417244)))

(declare-fun res!503927 () Bool)

(assert (=> b!747299 (=> (not res!503927) (not e!417244))))

(declare-fun lt!332165 () SeekEntryResult!7555)

(assert (=> b!747299 (= res!503927 (or (= lt!332165 (MissingZero!7555 i!1173)) (= lt!332165 (MissingVacant!7555 i!1173))))))

(assert (=> b!747299 (= lt!332165 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!747300 () Bool)

(assert (=> b!747300 (= e!417244 e!417239)))

(declare-fun res!503932 () Bool)

(assert (=> b!747300 (=> (not res!503932) (not e!417239))))

(assert (=> b!747300 (= res!503932 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19955 a!3186) j!159) mask!3328) (select (arr!19955 a!3186) j!159) a!3186 mask!3328) lt!332162))))

(assert (=> b!747300 (= lt!332162 (Intermediate!7555 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65510 res!503935) b!747291))

(assert (= (and b!747291 res!503926) b!747282))

(assert (= (and b!747282 res!503934) b!747288))

(assert (= (and b!747288 res!503936) b!747294))

(assert (= (and b!747294 res!503929) b!747299))

(assert (= (and b!747299 res!503927) b!747283))

(assert (= (and b!747283 res!503923) b!747292))

(assert (= (and b!747292 res!503930) b!747298))

(assert (= (and b!747298 res!503937) b!747300))

(assert (= (and b!747300 res!503932) b!747297))

(assert (= (and b!747297 res!503938) b!747296))

(assert (= (and b!747296 c!82059) b!747286))

(assert (= (and b!747296 (not c!82059)) b!747285))

(assert (= (and b!747296 res!503939) b!747284))

(assert (= (and b!747284 res!503924) b!747295))

(assert (= (and b!747295 res!503933) b!747290))

(assert (= (and b!747295 (not res!503931)) b!747281))

(assert (= (and b!747281 (not res!503928)) b!747280))

(assert (= (and b!747280 (not res!503925)) b!747293))

(assert (= (and b!747293 c!82060) b!747289))

(assert (= (and b!747293 (not c!82060)) b!747287))

(declare-fun m!697399 () Bool)

(assert (=> b!747288 m!697399))

(declare-fun m!697401 () Bool)

(assert (=> b!747286 m!697401))

(assert (=> b!747286 m!697401))

(declare-fun m!697403 () Bool)

(assert (=> b!747286 m!697403))

(assert (=> b!747281 m!697401))

(assert (=> b!747281 m!697401))

(declare-fun m!697405 () Bool)

(assert (=> b!747281 m!697405))

(declare-fun m!697407 () Bool)

(assert (=> b!747292 m!697407))

(declare-fun m!697409 () Bool)

(assert (=> start!65510 m!697409))

(declare-fun m!697411 () Bool)

(assert (=> start!65510 m!697411))

(declare-fun m!697413 () Bool)

(assert (=> b!747299 m!697413))

(declare-fun m!697415 () Bool)

(assert (=> b!747293 m!697415))

(declare-fun m!697417 () Bool)

(assert (=> b!747293 m!697417))

(assert (=> b!747285 m!697401))

(assert (=> b!747285 m!697401))

(assert (=> b!747285 m!697405))

(assert (=> b!747295 m!697401))

(assert (=> b!747295 m!697401))

(declare-fun m!697419 () Bool)

(assert (=> b!747295 m!697419))

(declare-fun m!697421 () Bool)

(assert (=> b!747295 m!697421))

(declare-fun m!697423 () Bool)

(assert (=> b!747295 m!697423))

(declare-fun m!697425 () Bool)

(assert (=> b!747297 m!697425))

(assert (=> b!747290 m!697401))

(assert (=> b!747290 m!697401))

(declare-fun m!697427 () Bool)

(assert (=> b!747290 m!697427))

(assert (=> b!747280 m!697415))

(assert (=> b!747280 m!697417))

(assert (=> b!747282 m!697401))

(assert (=> b!747282 m!697401))

(declare-fun m!697429 () Bool)

(assert (=> b!747282 m!697429))

(declare-fun m!697431 () Bool)

(assert (=> b!747283 m!697431))

(assert (=> b!747300 m!697401))

(assert (=> b!747300 m!697401))

(declare-fun m!697433 () Bool)

(assert (=> b!747300 m!697433))

(assert (=> b!747300 m!697433))

(assert (=> b!747300 m!697401))

(declare-fun m!697435 () Bool)

(assert (=> b!747300 m!697435))

(declare-fun m!697437 () Bool)

(assert (=> b!747284 m!697437))

(declare-fun m!697439 () Bool)

(assert (=> b!747284 m!697439))

(declare-fun m!697441 () Bool)

(assert (=> b!747284 m!697441))

(assert (=> b!747284 m!697415))

(declare-fun m!697443 () Bool)

(assert (=> b!747284 m!697443))

(assert (=> b!747284 m!697437))

(declare-fun m!697445 () Bool)

(assert (=> b!747294 m!697445))

(push 1)

