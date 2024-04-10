; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67008 () Bool)

(assert start!67008)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42432 0))(
  ( (array!42433 (arr!20313 (Array (_ BitVec 32) (_ BitVec 64))) (size!20734 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42432)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!430449 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!773240 () Bool)

(declare-datatypes ((SeekEntryResult!7913 0))(
  ( (MissingZero!7913 (index!34020 (_ BitVec 32))) (Found!7913 (index!34021 (_ BitVec 32))) (Intermediate!7913 (undefined!8725 Bool) (index!34022 (_ BitVec 32)) (x!64964 (_ BitVec 32))) (Undefined!7913) (MissingVacant!7913 (index!34023 (_ BitVec 32))) )
))
(declare-fun lt!344308 () SeekEntryResult!7913)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42432 (_ BitVec 32)) SeekEntryResult!7913)

(assert (=> b!773240 (= e!430449 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20313 a!3186) j!159) a!3186 mask!3328) lt!344308))))

(declare-fun b!773241 () Bool)

(declare-fun res!522933 () Bool)

(declare-fun e!430444 () Bool)

(assert (=> b!773241 (=> (not res!522933) (not e!430444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773241 (= res!522933 (validKeyInArray!0 (select (arr!20313 a!3186) j!159)))))

(declare-fun b!773242 () Bool)

(declare-fun res!522924 () Bool)

(declare-fun e!430447 () Bool)

(assert (=> b!773242 (=> (not res!522924) (not e!430447))))

(declare-datatypes ((List!14315 0))(
  ( (Nil!14312) (Cons!14311 (h!15416 (_ BitVec 64)) (t!20630 List!14315)) )
))
(declare-fun arrayNoDuplicates!0 (array!42432 (_ BitVec 32) List!14315) Bool)

(assert (=> b!773242 (= res!522924 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14312))))

(declare-fun b!773243 () Bool)

(declare-datatypes ((Unit!26666 0))(
  ( (Unit!26667) )
))
(declare-fun e!430445 () Unit!26666)

(declare-fun Unit!26668 () Unit!26666)

(assert (=> b!773243 (= e!430445 Unit!26668)))

(declare-fun lt!344305 () SeekEntryResult!7913)

(declare-fun lt!344306 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42432 (_ BitVec 32)) SeekEntryResult!7913)

(assert (=> b!773243 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344306 (select (arr!20313 a!3186) j!159) a!3186 mask!3328) lt!344305)))

(declare-fun b!773244 () Bool)

(declare-fun res!522928 () Bool)

(declare-fun e!430446 () Bool)

(assert (=> b!773244 (=> (not res!522928) (not e!430446))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773244 (= res!522928 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20313 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773245 () Bool)

(assert (=> b!773245 (= e!430444 e!430447)))

(declare-fun res!522937 () Bool)

(assert (=> b!773245 (=> (not res!522937) (not e!430447))))

(declare-fun lt!344303 () SeekEntryResult!7913)

(assert (=> b!773245 (= res!522937 (or (= lt!344303 (MissingZero!7913 i!1173)) (= lt!344303 (MissingVacant!7913 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42432 (_ BitVec 32)) SeekEntryResult!7913)

(assert (=> b!773245 (= lt!344303 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!773246 () Bool)

(declare-fun res!522931 () Bool)

(assert (=> b!773246 (=> (not res!522931) (not e!430444))))

(declare-fun arrayContainsKey!0 (array!42432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773246 (= res!522931 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773248 () Bool)

(declare-fun res!522932 () Bool)

(assert (=> b!773248 (=> (not res!522932) (not e!430447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42432 (_ BitVec 32)) Bool)

(assert (=> b!773248 (= res!522932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773249 () Bool)

(declare-fun e!430450 () Bool)

(assert (=> b!773249 (= e!430450 true)))

(declare-fun lt!344307 () Unit!26666)

(assert (=> b!773249 (= lt!344307 e!430445)))

(declare-fun c!85558 () Bool)

(assert (=> b!773249 (= c!85558 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773249 (= lt!344306 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773250 () Bool)

(declare-fun e!430443 () Bool)

(assert (=> b!773250 (= e!430443 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20313 a!3186) j!159) a!3186 mask!3328) (Found!7913 j!159)))))

(declare-fun b!773251 () Bool)

(declare-fun e!430442 () Bool)

(assert (=> b!773251 (= e!430446 e!430442)))

(declare-fun res!522936 () Bool)

(assert (=> b!773251 (=> (not res!522936) (not e!430442))))

(declare-fun lt!344304 () SeekEntryResult!7913)

(declare-fun lt!344299 () SeekEntryResult!7913)

(assert (=> b!773251 (= res!522936 (= lt!344304 lt!344299))))

(declare-fun lt!344302 () array!42432)

(declare-fun lt!344300 () (_ BitVec 64))

(assert (=> b!773251 (= lt!344299 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344300 lt!344302 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773251 (= lt!344304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344300 mask!3328) lt!344300 lt!344302 mask!3328))))

(assert (=> b!773251 (= lt!344300 (select (store (arr!20313 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773251 (= lt!344302 (array!42433 (store (arr!20313 a!3186) i!1173 k!2102) (size!20734 a!3186)))))

(declare-fun b!773252 () Bool)

(declare-fun res!522926 () Bool)

(assert (=> b!773252 (=> (not res!522926) (not e!430447))))

(assert (=> b!773252 (= res!522926 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20734 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20734 a!3186))))))

(declare-fun b!773253 () Bool)

(declare-fun res!522938 () Bool)

(assert (=> b!773253 (=> (not res!522938) (not e!430446))))

(assert (=> b!773253 (= res!522938 e!430443)))

(declare-fun c!85557 () Bool)

(assert (=> b!773253 (= c!85557 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773254 () Bool)

(assert (=> b!773254 (= e!430447 e!430446)))

(declare-fun res!522925 () Bool)

(assert (=> b!773254 (=> (not res!522925) (not e!430446))))

(assert (=> b!773254 (= res!522925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20313 a!3186) j!159) mask!3328) (select (arr!20313 a!3186) j!159) a!3186 mask!3328) lt!344305))))

(assert (=> b!773254 (= lt!344305 (Intermediate!7913 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773255 () Bool)

(declare-fun res!522923 () Bool)

(assert (=> b!773255 (=> (not res!522923) (not e!430444))))

(assert (=> b!773255 (= res!522923 (and (= (size!20734 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20734 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20734 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773256 () Bool)

(assert (=> b!773256 (= e!430442 (not e!430450))))

(declare-fun res!522927 () Bool)

(assert (=> b!773256 (=> res!522927 e!430450)))

(assert (=> b!773256 (= res!522927 (or (not (is-Intermediate!7913 lt!344299)) (bvsge x!1131 (x!64964 lt!344299))))))

(declare-fun e!430451 () Bool)

(assert (=> b!773256 e!430451))

(declare-fun res!522934 () Bool)

(assert (=> b!773256 (=> (not res!522934) (not e!430451))))

(assert (=> b!773256 (= res!522934 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344301 () Unit!26666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26666)

(assert (=> b!773256 (= lt!344301 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773257 () Bool)

(declare-fun Unit!26669 () Unit!26666)

(assert (=> b!773257 (= e!430445 Unit!26669)))

(declare-fun lt!344309 () SeekEntryResult!7913)

(assert (=> b!773257 (= lt!344309 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20313 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773257 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344306 resIntermediateIndex!5 (select (arr!20313 a!3186) j!159) a!3186 mask!3328) (Found!7913 j!159))))

(declare-fun b!773247 () Bool)

(declare-fun res!522930 () Bool)

(assert (=> b!773247 (=> (not res!522930) (not e!430444))))

(assert (=> b!773247 (= res!522930 (validKeyInArray!0 k!2102))))

(declare-fun res!522929 () Bool)

(assert (=> start!67008 (=> (not res!522929) (not e!430444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67008 (= res!522929 (validMask!0 mask!3328))))

(assert (=> start!67008 e!430444))

(assert (=> start!67008 true))

(declare-fun array_inv!16109 (array!42432) Bool)

(assert (=> start!67008 (array_inv!16109 a!3186)))

(declare-fun b!773258 () Bool)

(assert (=> b!773258 (= e!430451 e!430449)))

(declare-fun res!522935 () Bool)

(assert (=> b!773258 (=> (not res!522935) (not e!430449))))

(assert (=> b!773258 (= res!522935 (= (seekEntryOrOpen!0 (select (arr!20313 a!3186) j!159) a!3186 mask!3328) lt!344308))))

(assert (=> b!773258 (= lt!344308 (Found!7913 j!159))))

(declare-fun b!773259 () Bool)

(assert (=> b!773259 (= e!430443 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20313 a!3186) j!159) a!3186 mask!3328) lt!344305))))

(assert (= (and start!67008 res!522929) b!773255))

(assert (= (and b!773255 res!522923) b!773241))

(assert (= (and b!773241 res!522933) b!773247))

(assert (= (and b!773247 res!522930) b!773246))

(assert (= (and b!773246 res!522931) b!773245))

(assert (= (and b!773245 res!522937) b!773248))

(assert (= (and b!773248 res!522932) b!773242))

(assert (= (and b!773242 res!522924) b!773252))

(assert (= (and b!773252 res!522926) b!773254))

(assert (= (and b!773254 res!522925) b!773244))

(assert (= (and b!773244 res!522928) b!773253))

(assert (= (and b!773253 c!85557) b!773259))

(assert (= (and b!773253 (not c!85557)) b!773250))

(assert (= (and b!773253 res!522938) b!773251))

(assert (= (and b!773251 res!522936) b!773256))

(assert (= (and b!773256 res!522934) b!773258))

(assert (= (and b!773258 res!522935) b!773240))

(assert (= (and b!773256 (not res!522927)) b!773249))

(assert (= (and b!773249 c!85558) b!773243))

(assert (= (and b!773249 (not c!85558)) b!773257))

(declare-fun m!717995 () Bool)

(assert (=> b!773243 m!717995))

(assert (=> b!773243 m!717995))

(declare-fun m!717997 () Bool)

(assert (=> b!773243 m!717997))

(assert (=> b!773259 m!717995))

(assert (=> b!773259 m!717995))

(declare-fun m!717999 () Bool)

(assert (=> b!773259 m!717999))

(assert (=> b!773258 m!717995))

(assert (=> b!773258 m!717995))

(declare-fun m!718001 () Bool)

(assert (=> b!773258 m!718001))

(declare-fun m!718003 () Bool)

(assert (=> b!773242 m!718003))

(declare-fun m!718005 () Bool)

(assert (=> b!773248 m!718005))

(assert (=> b!773257 m!717995))

(assert (=> b!773257 m!717995))

(declare-fun m!718007 () Bool)

(assert (=> b!773257 m!718007))

(assert (=> b!773257 m!717995))

(declare-fun m!718009 () Bool)

(assert (=> b!773257 m!718009))

(assert (=> b!773240 m!717995))

(assert (=> b!773240 m!717995))

(declare-fun m!718011 () Bool)

(assert (=> b!773240 m!718011))

(declare-fun m!718013 () Bool)

(assert (=> b!773245 m!718013))

(declare-fun m!718015 () Bool)

(assert (=> b!773251 m!718015))

(declare-fun m!718017 () Bool)

(assert (=> b!773251 m!718017))

(assert (=> b!773251 m!718015))

(declare-fun m!718019 () Bool)

(assert (=> b!773251 m!718019))

(declare-fun m!718021 () Bool)

(assert (=> b!773251 m!718021))

(declare-fun m!718023 () Bool)

(assert (=> b!773251 m!718023))

(declare-fun m!718025 () Bool)

(assert (=> b!773246 m!718025))

(assert (=> b!773254 m!717995))

(assert (=> b!773254 m!717995))

(declare-fun m!718027 () Bool)

(assert (=> b!773254 m!718027))

(assert (=> b!773254 m!718027))

(assert (=> b!773254 m!717995))

(declare-fun m!718029 () Bool)

(assert (=> b!773254 m!718029))

(declare-fun m!718031 () Bool)

(assert (=> b!773244 m!718031))

(declare-fun m!718033 () Bool)

(assert (=> b!773256 m!718033))

(declare-fun m!718035 () Bool)

(assert (=> b!773256 m!718035))

(declare-fun m!718037 () Bool)

(assert (=> b!773247 m!718037))

(declare-fun m!718039 () Bool)

(assert (=> start!67008 m!718039))

(declare-fun m!718041 () Bool)

(assert (=> start!67008 m!718041))

(declare-fun m!718043 () Bool)

(assert (=> b!773249 m!718043))

(assert (=> b!773241 m!717995))

(assert (=> b!773241 m!717995))

(declare-fun m!718045 () Bool)

(assert (=> b!773241 m!718045))

(assert (=> b!773250 m!717995))

(assert (=> b!773250 m!717995))

(assert (=> b!773250 m!718007))

(push 1)

