; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64700 () Bool)

(assert start!64700)

(declare-fun b!729948 () Bool)

(declare-fun e!408494 () Bool)

(declare-fun e!408492 () Bool)

(assert (=> b!729948 (= e!408494 e!408492)))

(declare-fun res!490418 () Bool)

(assert (=> b!729948 (=> (not res!490418) (not e!408492))))

(declare-datatypes ((array!41166 0))(
  ( (array!41167 (arr!19703 (Array (_ BitVec 32) (_ BitVec 64))) (size!20124 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41166)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7300 0))(
  ( (MissingZero!7300 (index!31568 (_ BitVec 32))) (Found!7300 (index!31569 (_ BitVec 32))) (Intermediate!7300 (undefined!8112 Bool) (index!31570 (_ BitVec 32)) (x!62557 (_ BitVec 32))) (Undefined!7300) (MissingVacant!7300 (index!31571 (_ BitVec 32))) )
))
(declare-fun lt!323306 () SeekEntryResult!7300)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41166 (_ BitVec 32)) SeekEntryResult!7300)

(assert (=> b!729948 (= res!490418 (= (seekEntryOrOpen!0 (select (arr!19703 a!3186) j!159) a!3186 mask!3328) lt!323306))))

(assert (=> b!729948 (= lt!323306 (Found!7300 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!408491 () Bool)

(declare-fun b!729949 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41166 (_ BitVec 32)) SeekEntryResult!7300)

(assert (=> b!729949 (= e!408491 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19703 a!3186) j!159) a!3186 mask!3328) (Found!7300 j!159)))))

(declare-fun b!729950 () Bool)

(declare-fun res!490411 () Bool)

(declare-fun e!408495 () Bool)

(assert (=> b!729950 (=> (not res!490411) (not e!408495))))

(declare-datatypes ((List!13744 0))(
  ( (Nil!13741) (Cons!13740 (h!14800 (_ BitVec 64)) (t!20050 List!13744)) )
))
(declare-fun arrayNoDuplicates!0 (array!41166 (_ BitVec 32) List!13744) Bool)

(assert (=> b!729950 (= res!490411 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13741))))

(declare-fun b!729951 () Bool)

(declare-fun lt!323307 () SeekEntryResult!7300)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41166 (_ BitVec 32)) SeekEntryResult!7300)

(assert (=> b!729951 (= e!408491 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19703 a!3186) j!159) a!3186 mask!3328) lt!323307))))

(declare-fun b!729952 () Bool)

(declare-fun res!490416 () Bool)

(declare-fun e!408493 () Bool)

(assert (=> b!729952 (=> (not res!490416) (not e!408493))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729952 (= res!490416 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19703 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729953 () Bool)

(declare-fun res!490409 () Bool)

(declare-fun e!408490 () Bool)

(assert (=> b!729953 (=> (not res!490409) (not e!408490))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729953 (= res!490409 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729954 () Bool)

(declare-fun res!490412 () Bool)

(assert (=> b!729954 (=> (not res!490412) (not e!408490))))

(assert (=> b!729954 (= res!490412 (and (= (size!20124 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20124 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20124 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729955 () Bool)

(declare-fun e!408489 () Bool)

(assert (=> b!729955 (= e!408493 e!408489)))

(declare-fun res!490422 () Bool)

(assert (=> b!729955 (=> (not res!490422) (not e!408489))))

(declare-fun lt!323301 () SeekEntryResult!7300)

(declare-fun lt!323309 () SeekEntryResult!7300)

(assert (=> b!729955 (= res!490422 (= lt!323301 lt!323309))))

(declare-fun lt!323304 () array!41166)

(declare-fun lt!323302 () (_ BitVec 64))

(assert (=> b!729955 (= lt!323309 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323302 lt!323304 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729955 (= lt!323301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323302 mask!3328) lt!323302 lt!323304 mask!3328))))

(assert (=> b!729955 (= lt!323302 (select (store (arr!19703 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729955 (= lt!323304 (array!41167 (store (arr!19703 a!3186) i!1173 k0!2102) (size!20124 a!3186)))))

(declare-fun b!729956 () Bool)

(declare-fun res!490421 () Bool)

(assert (=> b!729956 (=> (not res!490421) (not e!408490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729956 (= res!490421 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!408496 () Bool)

(declare-fun b!729957 () Bool)

(assert (=> b!729957 (= e!408496 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!323305 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729957 (= lt!323305 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!490419 () Bool)

(assert (=> start!64700 (=> (not res!490419) (not e!408490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64700 (= res!490419 (validMask!0 mask!3328))))

(assert (=> start!64700 e!408490))

(assert (=> start!64700 true))

(declare-fun array_inv!15586 (array!41166) Bool)

(assert (=> start!64700 (array_inv!15586 a!3186)))

(declare-fun b!729958 () Bool)

(declare-fun res!490420 () Bool)

(assert (=> b!729958 (=> (not res!490420) (not e!408493))))

(assert (=> b!729958 (= res!490420 e!408491)))

(declare-fun c!80145 () Bool)

(assert (=> b!729958 (= c!80145 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729959 () Bool)

(assert (=> b!729959 (= e!408495 e!408493)))

(declare-fun res!490413 () Bool)

(assert (=> b!729959 (=> (not res!490413) (not e!408493))))

(assert (=> b!729959 (= res!490413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19703 a!3186) j!159) mask!3328) (select (arr!19703 a!3186) j!159) a!3186 mask!3328) lt!323307))))

(assert (=> b!729959 (= lt!323307 (Intermediate!7300 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729960 () Bool)

(declare-fun res!490410 () Bool)

(assert (=> b!729960 (=> (not res!490410) (not e!408490))))

(assert (=> b!729960 (= res!490410 (validKeyInArray!0 (select (arr!19703 a!3186) j!159)))))

(declare-fun b!729961 () Bool)

(assert (=> b!729961 (= e!408489 (not e!408496))))

(declare-fun res!490415 () Bool)

(assert (=> b!729961 (=> res!490415 e!408496)))

(get-info :version)

(assert (=> b!729961 (= res!490415 (or (not ((_ is Intermediate!7300) lt!323309)) (bvsge x!1131 (x!62557 lt!323309))))))

(assert (=> b!729961 e!408494))

(declare-fun res!490407 () Bool)

(assert (=> b!729961 (=> (not res!490407) (not e!408494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41166 (_ BitVec 32)) Bool)

(assert (=> b!729961 (= res!490407 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24890 0))(
  ( (Unit!24891) )
))
(declare-fun lt!323303 () Unit!24890)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24890)

(assert (=> b!729961 (= lt!323303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729962 () Bool)

(declare-fun res!490417 () Bool)

(assert (=> b!729962 (=> (not res!490417) (not e!408495))))

(assert (=> b!729962 (= res!490417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729963 () Bool)

(assert (=> b!729963 (= e!408492 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19703 a!3186) j!159) a!3186 mask!3328) lt!323306))))

(declare-fun b!729964 () Bool)

(assert (=> b!729964 (= e!408490 e!408495)))

(declare-fun res!490408 () Bool)

(assert (=> b!729964 (=> (not res!490408) (not e!408495))))

(declare-fun lt!323308 () SeekEntryResult!7300)

(assert (=> b!729964 (= res!490408 (or (= lt!323308 (MissingZero!7300 i!1173)) (= lt!323308 (MissingVacant!7300 i!1173))))))

(assert (=> b!729964 (= lt!323308 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729965 () Bool)

(declare-fun res!490414 () Bool)

(assert (=> b!729965 (=> (not res!490414) (not e!408495))))

(assert (=> b!729965 (= res!490414 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20124 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20124 a!3186))))))

(assert (= (and start!64700 res!490419) b!729954))

(assert (= (and b!729954 res!490412) b!729960))

(assert (= (and b!729960 res!490410) b!729956))

(assert (= (and b!729956 res!490421) b!729953))

(assert (= (and b!729953 res!490409) b!729964))

(assert (= (and b!729964 res!490408) b!729962))

(assert (= (and b!729962 res!490417) b!729950))

(assert (= (and b!729950 res!490411) b!729965))

(assert (= (and b!729965 res!490414) b!729959))

(assert (= (and b!729959 res!490413) b!729952))

(assert (= (and b!729952 res!490416) b!729958))

(assert (= (and b!729958 c!80145) b!729951))

(assert (= (and b!729958 (not c!80145)) b!729949))

(assert (= (and b!729958 res!490420) b!729955))

(assert (= (and b!729955 res!490422) b!729961))

(assert (= (and b!729961 res!490407) b!729948))

(assert (= (and b!729948 res!490418) b!729963))

(assert (= (and b!729961 (not res!490415)) b!729957))

(declare-fun m!682997 () Bool)

(assert (=> b!729948 m!682997))

(assert (=> b!729948 m!682997))

(declare-fun m!682999 () Bool)

(assert (=> b!729948 m!682999))

(declare-fun m!683001 () Bool)

(assert (=> start!64700 m!683001))

(declare-fun m!683003 () Bool)

(assert (=> start!64700 m!683003))

(assert (=> b!729959 m!682997))

(assert (=> b!729959 m!682997))

(declare-fun m!683005 () Bool)

(assert (=> b!729959 m!683005))

(assert (=> b!729959 m!683005))

(assert (=> b!729959 m!682997))

(declare-fun m!683007 () Bool)

(assert (=> b!729959 m!683007))

(declare-fun m!683009 () Bool)

(assert (=> b!729956 m!683009))

(assert (=> b!729960 m!682997))

(assert (=> b!729960 m!682997))

(declare-fun m!683011 () Bool)

(assert (=> b!729960 m!683011))

(declare-fun m!683013 () Bool)

(assert (=> b!729953 m!683013))

(declare-fun m!683015 () Bool)

(assert (=> b!729955 m!683015))

(declare-fun m!683017 () Bool)

(assert (=> b!729955 m!683017))

(declare-fun m!683019 () Bool)

(assert (=> b!729955 m!683019))

(declare-fun m!683021 () Bool)

(assert (=> b!729955 m!683021))

(declare-fun m!683023 () Bool)

(assert (=> b!729955 m!683023))

(assert (=> b!729955 m!683015))

(declare-fun m!683025 () Bool)

(assert (=> b!729957 m!683025))

(declare-fun m!683027 () Bool)

(assert (=> b!729962 m!683027))

(assert (=> b!729949 m!682997))

(assert (=> b!729949 m!682997))

(declare-fun m!683029 () Bool)

(assert (=> b!729949 m!683029))

(declare-fun m!683031 () Bool)

(assert (=> b!729952 m!683031))

(declare-fun m!683033 () Bool)

(assert (=> b!729950 m!683033))

(declare-fun m!683035 () Bool)

(assert (=> b!729964 m!683035))

(declare-fun m!683037 () Bool)

(assert (=> b!729961 m!683037))

(declare-fun m!683039 () Bool)

(assert (=> b!729961 m!683039))

(assert (=> b!729963 m!682997))

(assert (=> b!729963 m!682997))

(declare-fun m!683041 () Bool)

(assert (=> b!729963 m!683041))

(assert (=> b!729951 m!682997))

(assert (=> b!729951 m!682997))

(declare-fun m!683043 () Bool)

(assert (=> b!729951 m!683043))

(check-sat (not b!729962) (not b!729964) (not b!729950) (not b!729951) (not b!729961) (not b!729956) (not b!729957) (not b!729953) (not b!729955) (not b!729963) (not b!729948) (not start!64700) (not b!729949) (not b!729959) (not b!729960))
(check-sat)
