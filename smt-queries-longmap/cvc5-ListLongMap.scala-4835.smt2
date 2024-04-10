; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66482 () Bool)

(assert start!66482)

(declare-fun b!766275 () Bool)

(declare-fun e!426717 () Bool)

(declare-fun e!426720 () Bool)

(assert (=> b!766275 (= e!426717 (not e!426720))))

(declare-fun res!518434 () Bool)

(assert (=> b!766275 (=> res!518434 e!426720)))

(declare-datatypes ((SeekEntryResult!7835 0))(
  ( (MissingZero!7835 (index!33708 (_ BitVec 32))) (Found!7835 (index!33709 (_ BitVec 32))) (Intermediate!7835 (undefined!8647 Bool) (index!33710 (_ BitVec 32)) (x!64617 (_ BitVec 32))) (Undefined!7835) (MissingVacant!7835 (index!33711 (_ BitVec 32))) )
))
(declare-fun lt!340862 () SeekEntryResult!7835)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!766275 (= res!518434 (or (not (is-Intermediate!7835 lt!340862)) (bvsge x!1131 (x!64617 lt!340862))))))

(declare-fun e!426712 () Bool)

(assert (=> b!766275 e!426712))

(declare-fun res!518430 () Bool)

(assert (=> b!766275 (=> (not res!518430) (not e!426712))))

(declare-datatypes ((array!42261 0))(
  ( (array!42262 (arr!20235 (Array (_ BitVec 32) (_ BitVec 64))) (size!20656 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42261)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42261 (_ BitVec 32)) Bool)

(assert (=> b!766275 (= res!518430 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26396 0))(
  ( (Unit!26397) )
))
(declare-fun lt!340863 () Unit!26396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26396)

(assert (=> b!766275 (= lt!340863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!340864 () SeekEntryResult!7835)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!766276 () Bool)

(declare-fun e!426715 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42261 (_ BitVec 32)) SeekEntryResult!7835)

(assert (=> b!766276 (= e!426715 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20235 a!3186) j!159) a!3186 mask!3328) lt!340864))))

(declare-fun b!766277 () Bool)

(declare-fun res!518431 () Bool)

(declare-fun e!426719 () Bool)

(assert (=> b!766277 (=> (not res!518431) (not e!426719))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766277 (= res!518431 (and (= (size!20656 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20656 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20656 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766278 () Bool)

(declare-fun res!518424 () Bool)

(declare-fun e!426718 () Bool)

(assert (=> b!766278 (=> (not res!518424) (not e!426718))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!766278 (= res!518424 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20656 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20656 a!3186))))))

(declare-fun b!766279 () Bool)

(declare-fun e!426716 () Bool)

(assert (=> b!766279 (= e!426718 e!426716)))

(declare-fun res!518422 () Bool)

(assert (=> b!766279 (=> (not res!518422) (not e!426716))))

(declare-fun lt!340860 () SeekEntryResult!7835)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42261 (_ BitVec 32)) SeekEntryResult!7835)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766279 (= res!518422 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20235 a!3186) j!159) mask!3328) (select (arr!20235 a!3186) j!159) a!3186 mask!3328) lt!340860))))

(assert (=> b!766279 (= lt!340860 (Intermediate!7835 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!518436 () Bool)

(assert (=> start!66482 (=> (not res!518436) (not e!426719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66482 (= res!518436 (validMask!0 mask!3328))))

(assert (=> start!66482 e!426719))

(assert (=> start!66482 true))

(declare-fun array_inv!16031 (array!42261) Bool)

(assert (=> start!66482 (array_inv!16031 a!3186)))

(declare-fun b!766280 () Bool)

(declare-fun res!518429 () Bool)

(assert (=> b!766280 (=> (not res!518429) (not e!426716))))

(assert (=> b!766280 (= res!518429 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20235 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766281 () Bool)

(declare-fun res!518432 () Bool)

(assert (=> b!766281 (=> (not res!518432) (not e!426718))))

(assert (=> b!766281 (= res!518432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766282 () Bool)

(assert (=> b!766282 (= e!426716 e!426717)))

(declare-fun res!518425 () Bool)

(assert (=> b!766282 (=> (not res!518425) (not e!426717))))

(declare-fun lt!340865 () SeekEntryResult!7835)

(assert (=> b!766282 (= res!518425 (= lt!340865 lt!340862))))

(declare-fun lt!340857 () (_ BitVec 64))

(declare-fun lt!340858 () array!42261)

(assert (=> b!766282 (= lt!340862 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340857 lt!340858 mask!3328))))

(assert (=> b!766282 (= lt!340865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340857 mask!3328) lt!340857 lt!340858 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!766282 (= lt!340857 (select (store (arr!20235 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!766282 (= lt!340858 (array!42262 (store (arr!20235 a!3186) i!1173 k!2102) (size!20656 a!3186)))))

(declare-fun b!766283 () Bool)

(declare-fun res!518423 () Bool)

(assert (=> b!766283 (=> (not res!518423) (not e!426719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766283 (= res!518423 (validKeyInArray!0 (select (arr!20235 a!3186) j!159)))))

(declare-fun b!766284 () Bool)

(declare-fun res!518435 () Bool)

(assert (=> b!766284 (=> (not res!518435) (not e!426719))))

(declare-fun arrayContainsKey!0 (array!42261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766284 (= res!518435 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766285 () Bool)

(assert (=> b!766285 (= e!426719 e!426718)))

(declare-fun res!518433 () Bool)

(assert (=> b!766285 (=> (not res!518433) (not e!426718))))

(declare-fun lt!340861 () SeekEntryResult!7835)

(assert (=> b!766285 (= res!518433 (or (= lt!340861 (MissingZero!7835 i!1173)) (= lt!340861 (MissingVacant!7835 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42261 (_ BitVec 32)) SeekEntryResult!7835)

(assert (=> b!766285 (= lt!340861 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!766286 () Bool)

(assert (=> b!766286 (= e!426712 e!426715)))

(declare-fun res!518426 () Bool)

(assert (=> b!766286 (=> (not res!518426) (not e!426715))))

(assert (=> b!766286 (= res!518426 (= (seekEntryOrOpen!0 (select (arr!20235 a!3186) j!159) a!3186 mask!3328) lt!340864))))

(assert (=> b!766286 (= lt!340864 (Found!7835 j!159))))

(declare-fun b!766287 () Bool)

(declare-fun e!426713 () Bool)

(assert (=> b!766287 (= e!426713 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20235 a!3186) j!159) a!3186 mask!3328) (Found!7835 j!159)))))

(declare-fun b!766288 () Bool)

(declare-fun res!518427 () Bool)

(assert (=> b!766288 (=> (not res!518427) (not e!426716))))

(assert (=> b!766288 (= res!518427 e!426713)))

(declare-fun c!84316 () Bool)

(assert (=> b!766288 (= c!84316 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766289 () Bool)

(declare-fun res!518437 () Bool)

(assert (=> b!766289 (=> (not res!518437) (not e!426718))))

(declare-datatypes ((List!14237 0))(
  ( (Nil!14234) (Cons!14233 (h!15323 (_ BitVec 64)) (t!20552 List!14237)) )
))
(declare-fun arrayNoDuplicates!0 (array!42261 (_ BitVec 32) List!14237) Bool)

(assert (=> b!766289 (= res!518437 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14234))))

(declare-fun b!766290 () Bool)

(assert (=> b!766290 (= e!426720 true)))

(declare-fun lt!340859 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766290 (= lt!340859 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766291 () Bool)

(assert (=> b!766291 (= e!426713 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20235 a!3186) j!159) a!3186 mask!3328) lt!340860))))

(declare-fun b!766292 () Bool)

(declare-fun res!518428 () Bool)

(assert (=> b!766292 (=> (not res!518428) (not e!426719))))

(assert (=> b!766292 (= res!518428 (validKeyInArray!0 k!2102))))

(assert (= (and start!66482 res!518436) b!766277))

(assert (= (and b!766277 res!518431) b!766283))

(assert (= (and b!766283 res!518423) b!766292))

(assert (= (and b!766292 res!518428) b!766284))

(assert (= (and b!766284 res!518435) b!766285))

(assert (= (and b!766285 res!518433) b!766281))

(assert (= (and b!766281 res!518432) b!766289))

(assert (= (and b!766289 res!518437) b!766278))

(assert (= (and b!766278 res!518424) b!766279))

(assert (= (and b!766279 res!518422) b!766280))

(assert (= (and b!766280 res!518429) b!766288))

(assert (= (and b!766288 c!84316) b!766291))

(assert (= (and b!766288 (not c!84316)) b!766287))

(assert (= (and b!766288 res!518427) b!766282))

(assert (= (and b!766282 res!518425) b!766275))

(assert (= (and b!766275 res!518430) b!766286))

(assert (= (and b!766286 res!518426) b!766276))

(assert (= (and b!766275 (not res!518434)) b!766290))

(declare-fun m!712281 () Bool)

(assert (=> b!766276 m!712281))

(assert (=> b!766276 m!712281))

(declare-fun m!712283 () Bool)

(assert (=> b!766276 m!712283))

(declare-fun m!712285 () Bool)

(assert (=> b!766284 m!712285))

(declare-fun m!712287 () Bool)

(assert (=> b!766275 m!712287))

(declare-fun m!712289 () Bool)

(assert (=> b!766275 m!712289))

(assert (=> b!766287 m!712281))

(assert (=> b!766287 m!712281))

(declare-fun m!712291 () Bool)

(assert (=> b!766287 m!712291))

(declare-fun m!712293 () Bool)

(assert (=> b!766289 m!712293))

(declare-fun m!712295 () Bool)

(assert (=> b!766280 m!712295))

(declare-fun m!712297 () Bool)

(assert (=> b!766282 m!712297))

(declare-fun m!712299 () Bool)

(assert (=> b!766282 m!712299))

(assert (=> b!766282 m!712299))

(declare-fun m!712301 () Bool)

(assert (=> b!766282 m!712301))

(declare-fun m!712303 () Bool)

(assert (=> b!766282 m!712303))

(declare-fun m!712305 () Bool)

(assert (=> b!766282 m!712305))

(assert (=> b!766286 m!712281))

(assert (=> b!766286 m!712281))

(declare-fun m!712307 () Bool)

(assert (=> b!766286 m!712307))

(declare-fun m!712309 () Bool)

(assert (=> b!766292 m!712309))

(declare-fun m!712311 () Bool)

(assert (=> b!766281 m!712311))

(declare-fun m!712313 () Bool)

(assert (=> b!766290 m!712313))

(assert (=> b!766291 m!712281))

(assert (=> b!766291 m!712281))

(declare-fun m!712315 () Bool)

(assert (=> b!766291 m!712315))

(declare-fun m!712317 () Bool)

(assert (=> start!66482 m!712317))

(declare-fun m!712319 () Bool)

(assert (=> start!66482 m!712319))

(assert (=> b!766279 m!712281))

(assert (=> b!766279 m!712281))

(declare-fun m!712321 () Bool)

(assert (=> b!766279 m!712321))

(assert (=> b!766279 m!712321))

(assert (=> b!766279 m!712281))

(declare-fun m!712323 () Bool)

(assert (=> b!766279 m!712323))

(assert (=> b!766283 m!712281))

(assert (=> b!766283 m!712281))

(declare-fun m!712325 () Bool)

(assert (=> b!766283 m!712325))

(declare-fun m!712327 () Bool)

(assert (=> b!766285 m!712327))

(push 1)

