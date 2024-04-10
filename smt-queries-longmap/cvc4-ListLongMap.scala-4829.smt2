; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66384 () Bool)

(assert start!66384)

(declare-fun b!765041 () Bool)

(declare-fun res!517586 () Bool)

(declare-fun e!426079 () Bool)

(assert (=> b!765041 (=> (not res!517586) (not e!426079))))

(declare-datatypes ((array!42226 0))(
  ( (array!42227 (arr!20219 (Array (_ BitVec 32) (_ BitVec 64))) (size!20640 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42226)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!765041 (= res!517586 (and (= (size!20640 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20640 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20640 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765042 () Bool)

(declare-fun e!426076 () Bool)

(declare-datatypes ((SeekEntryResult!7819 0))(
  ( (MissingZero!7819 (index!33644 (_ BitVec 32))) (Found!7819 (index!33645 (_ BitVec 32))) (Intermediate!7819 (undefined!8631 Bool) (index!33646 (_ BitVec 32)) (x!64544 (_ BitVec 32))) (Undefined!7819) (MissingVacant!7819 (index!33647 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42226 (_ BitVec 32)) SeekEntryResult!7819)

(assert (=> b!765042 (= e!426076 (= (seekEntryOrOpen!0 (select (arr!20219 a!3186) j!159) a!3186 mask!3328) (Found!7819 j!159)))))

(declare-fun b!765043 () Bool)

(declare-fun res!517580 () Bool)

(declare-fun e!426081 () Bool)

(assert (=> b!765043 (=> (not res!517580) (not e!426081))))

(declare-datatypes ((List!14221 0))(
  ( (Nil!14218) (Cons!14217 (h!15304 (_ BitVec 64)) (t!20536 List!14221)) )
))
(declare-fun arrayNoDuplicates!0 (array!42226 (_ BitVec 32) List!14221) Bool)

(assert (=> b!765043 (= res!517580 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14218))))

(declare-fun b!765044 () Bool)

(declare-fun res!517583 () Bool)

(assert (=> b!765044 (=> (not res!517583) (not e!426081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42226 (_ BitVec 32)) Bool)

(assert (=> b!765044 (= res!517583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765045 () Bool)

(declare-fun res!517579 () Bool)

(assert (=> b!765045 (=> (not res!517579) (not e!426081))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765045 (= res!517579 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20640 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20640 a!3186))))))

(declare-fun b!765046 () Bool)

(declare-fun res!517577 () Bool)

(assert (=> b!765046 (=> (not res!517577) (not e!426079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765046 (= res!517577 (validKeyInArray!0 (select (arr!20219 a!3186) j!159)))))

(declare-fun b!765047 () Bool)

(declare-fun res!517582 () Bool)

(declare-fun e!426075 () Bool)

(assert (=> b!765047 (=> (not res!517582) (not e!426075))))

(assert (=> b!765047 (= res!517582 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20219 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765048 () Bool)

(declare-fun res!517585 () Bool)

(assert (=> b!765048 (=> (not res!517585) (not e!426079))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!765048 (= res!517585 (validKeyInArray!0 k!2102))))

(declare-fun res!517576 () Bool)

(assert (=> start!66384 (=> (not res!517576) (not e!426079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66384 (= res!517576 (validMask!0 mask!3328))))

(assert (=> start!66384 e!426079))

(assert (=> start!66384 true))

(declare-fun array_inv!16015 (array!42226) Bool)

(assert (=> start!66384 (array_inv!16015 a!3186)))

(declare-fun b!765049 () Bool)

(declare-fun res!517588 () Bool)

(assert (=> b!765049 (=> (not res!517588) (not e!426079))))

(declare-fun arrayContainsKey!0 (array!42226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765049 (= res!517588 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765050 () Bool)

(declare-fun e!426077 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42226 (_ BitVec 32)) SeekEntryResult!7819)

(assert (=> b!765050 (= e!426077 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20219 a!3186) j!159) a!3186 mask!3328) (Found!7819 j!159)))))

(declare-fun lt!340385 () SeekEntryResult!7819)

(declare-fun b!765051 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42226 (_ BitVec 32)) SeekEntryResult!7819)

(assert (=> b!765051 (= e!426077 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20219 a!3186) j!159) a!3186 mask!3328) lt!340385))))

(declare-fun b!765052 () Bool)

(declare-fun e!426080 () Bool)

(assert (=> b!765052 (= e!426080 (not true))))

(assert (=> b!765052 e!426076))

(declare-fun res!517581 () Bool)

(assert (=> b!765052 (=> (not res!517581) (not e!426076))))

(assert (=> b!765052 (= res!517581 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26364 0))(
  ( (Unit!26365) )
))
(declare-fun lt!340383 () Unit!26364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26364)

(assert (=> b!765052 (= lt!340383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765053 () Bool)

(assert (=> b!765053 (= e!426079 e!426081)))

(declare-fun res!517584 () Bool)

(assert (=> b!765053 (=> (not res!517584) (not e!426081))))

(declare-fun lt!340381 () SeekEntryResult!7819)

(assert (=> b!765053 (= res!517584 (or (= lt!340381 (MissingZero!7819 i!1173)) (= lt!340381 (MissingVacant!7819 i!1173))))))

(assert (=> b!765053 (= lt!340381 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!765054 () Bool)

(assert (=> b!765054 (= e!426081 e!426075)))

(declare-fun res!517578 () Bool)

(assert (=> b!765054 (=> (not res!517578) (not e!426075))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765054 (= res!517578 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20219 a!3186) j!159) mask!3328) (select (arr!20219 a!3186) j!159) a!3186 mask!3328) lt!340385))))

(assert (=> b!765054 (= lt!340385 (Intermediate!7819 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765055 () Bool)

(declare-fun res!517587 () Bool)

(assert (=> b!765055 (=> (not res!517587) (not e!426075))))

(assert (=> b!765055 (= res!517587 e!426077)))

(declare-fun c!84121 () Bool)

(assert (=> b!765055 (= c!84121 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765056 () Bool)

(assert (=> b!765056 (= e!426075 e!426080)))

(declare-fun res!517575 () Bool)

(assert (=> b!765056 (=> (not res!517575) (not e!426080))))

(declare-fun lt!340382 () array!42226)

(declare-fun lt!340384 () (_ BitVec 64))

(assert (=> b!765056 (= res!517575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340384 mask!3328) lt!340384 lt!340382 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340384 lt!340382 mask!3328)))))

(assert (=> b!765056 (= lt!340384 (select (store (arr!20219 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!765056 (= lt!340382 (array!42227 (store (arr!20219 a!3186) i!1173 k!2102) (size!20640 a!3186)))))

(assert (= (and start!66384 res!517576) b!765041))

(assert (= (and b!765041 res!517586) b!765046))

(assert (= (and b!765046 res!517577) b!765048))

(assert (= (and b!765048 res!517585) b!765049))

(assert (= (and b!765049 res!517588) b!765053))

(assert (= (and b!765053 res!517584) b!765044))

(assert (= (and b!765044 res!517583) b!765043))

(assert (= (and b!765043 res!517580) b!765045))

(assert (= (and b!765045 res!517579) b!765054))

(assert (= (and b!765054 res!517578) b!765047))

(assert (= (and b!765047 res!517582) b!765055))

(assert (= (and b!765055 c!84121) b!765051))

(assert (= (and b!765055 (not c!84121)) b!765050))

(assert (= (and b!765055 res!517587) b!765056))

(assert (= (and b!765056 res!517575) b!765052))

(assert (= (and b!765052 res!517581) b!765042))

(declare-fun m!711259 () Bool)

(assert (=> b!765049 m!711259))

(declare-fun m!711261 () Bool)

(assert (=> b!765046 m!711261))

(assert (=> b!765046 m!711261))

(declare-fun m!711263 () Bool)

(assert (=> b!765046 m!711263))

(declare-fun m!711265 () Bool)

(assert (=> b!765047 m!711265))

(assert (=> b!765051 m!711261))

(assert (=> b!765051 m!711261))

(declare-fun m!711267 () Bool)

(assert (=> b!765051 m!711267))

(declare-fun m!711269 () Bool)

(assert (=> b!765048 m!711269))

(declare-fun m!711271 () Bool)

(assert (=> b!765052 m!711271))

(declare-fun m!711273 () Bool)

(assert (=> b!765052 m!711273))

(declare-fun m!711275 () Bool)

(assert (=> b!765056 m!711275))

(declare-fun m!711277 () Bool)

(assert (=> b!765056 m!711277))

(declare-fun m!711279 () Bool)

(assert (=> b!765056 m!711279))

(declare-fun m!711281 () Bool)

(assert (=> b!765056 m!711281))

(assert (=> b!765056 m!711275))

(declare-fun m!711283 () Bool)

(assert (=> b!765056 m!711283))

(declare-fun m!711285 () Bool)

(assert (=> b!765053 m!711285))

(assert (=> b!765050 m!711261))

(assert (=> b!765050 m!711261))

(declare-fun m!711287 () Bool)

(assert (=> b!765050 m!711287))

(assert (=> b!765054 m!711261))

(assert (=> b!765054 m!711261))

(declare-fun m!711289 () Bool)

(assert (=> b!765054 m!711289))

(assert (=> b!765054 m!711289))

(assert (=> b!765054 m!711261))

(declare-fun m!711291 () Bool)

(assert (=> b!765054 m!711291))

(declare-fun m!711293 () Bool)

(assert (=> start!66384 m!711293))

(declare-fun m!711295 () Bool)

(assert (=> start!66384 m!711295))

(declare-fun m!711297 () Bool)

(assert (=> b!765043 m!711297))

(declare-fun m!711299 () Bool)

(assert (=> b!765044 m!711299))

(assert (=> b!765042 m!711261))

(assert (=> b!765042 m!711261))

(declare-fun m!711301 () Bool)

(assert (=> b!765042 m!711301))

(push 1)

