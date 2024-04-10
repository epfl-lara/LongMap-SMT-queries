; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66480 () Bool)

(assert start!66480)

(declare-fun res!518385 () Bool)

(declare-fun e!426692 () Bool)

(assert (=> start!66480 (=> (not res!518385) (not e!426692))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66480 (= res!518385 (validMask!0 mask!3328))))

(assert (=> start!66480 e!426692))

(assert (=> start!66480 true))

(declare-datatypes ((array!42259 0))(
  ( (array!42260 (arr!20234 (Array (_ BitVec 32) (_ BitVec 64))) (size!20655 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42259)

(declare-fun array_inv!16030 (array!42259) Bool)

(assert (=> start!66480 (array_inv!16030 a!3186)))

(declare-fun b!766221 () Bool)

(declare-fun e!426691 () Bool)

(declare-fun e!426689 () Bool)

(assert (=> b!766221 (= e!426691 e!426689)))

(declare-fun res!518384 () Bool)

(assert (=> b!766221 (=> (not res!518384) (not e!426689))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7834 0))(
  ( (MissingZero!7834 (index!33704 (_ BitVec 32))) (Found!7834 (index!33705 (_ BitVec 32))) (Intermediate!7834 (undefined!8646 Bool) (index!33706 (_ BitVec 32)) (x!64608 (_ BitVec 32))) (Undefined!7834) (MissingVacant!7834 (index!33707 (_ BitVec 32))) )
))
(declare-fun lt!340830 () SeekEntryResult!7834)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42259 (_ BitVec 32)) SeekEntryResult!7834)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766221 (= res!518384 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20234 a!3186) j!159) mask!3328) (select (arr!20234 a!3186) j!159) a!3186 mask!3328) lt!340830))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766221 (= lt!340830 (Intermediate!7834 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766222 () Bool)

(declare-fun e!426685 () Bool)

(declare-fun e!426686 () Bool)

(assert (=> b!766222 (= e!426685 (not e!426686))))

(declare-fun res!518375 () Bool)

(assert (=> b!766222 (=> res!518375 e!426686)))

(declare-fun lt!340831 () SeekEntryResult!7834)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!766222 (= res!518375 (or (not (is-Intermediate!7834 lt!340831)) (bvsge x!1131 (x!64608 lt!340831))))))

(declare-fun e!426693 () Bool)

(assert (=> b!766222 e!426693))

(declare-fun res!518379 () Bool)

(assert (=> b!766222 (=> (not res!518379) (not e!426693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42259 (_ BitVec 32)) Bool)

(assert (=> b!766222 (= res!518379 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26394 0))(
  ( (Unit!26395) )
))
(declare-fun lt!340833 () Unit!26394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26394)

(assert (=> b!766222 (= lt!340833 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766223 () Bool)

(declare-fun res!518389 () Bool)

(assert (=> b!766223 (=> (not res!518389) (not e!426691))))

(declare-datatypes ((List!14236 0))(
  ( (Nil!14233) (Cons!14232 (h!15322 (_ BitVec 64)) (t!20551 List!14236)) )
))
(declare-fun arrayNoDuplicates!0 (array!42259 (_ BitVec 32) List!14236) Bool)

(assert (=> b!766223 (= res!518389 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14233))))

(declare-fun b!766224 () Bool)

(declare-fun res!518376 () Bool)

(assert (=> b!766224 (=> (not res!518376) (not e!426692))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766224 (= res!518376 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766225 () Bool)

(declare-fun lt!340832 () SeekEntryResult!7834)

(declare-fun e!426690 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42259 (_ BitVec 32)) SeekEntryResult!7834)

(assert (=> b!766225 (= e!426690 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20234 a!3186) j!159) a!3186 mask!3328) lt!340832))))

(declare-fun b!766226 () Bool)

(declare-fun res!518380 () Bool)

(assert (=> b!766226 (=> (not res!518380) (not e!426689))))

(declare-fun e!426687 () Bool)

(assert (=> b!766226 (= res!518380 e!426687)))

(declare-fun c!84313 () Bool)

(assert (=> b!766226 (= c!84313 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766227 () Bool)

(assert (=> b!766227 (= e!426686 true)))

(declare-fun lt!340837 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766227 (= lt!340837 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766228 () Bool)

(declare-fun res!518382 () Bool)

(assert (=> b!766228 (=> (not res!518382) (not e!426692))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766228 (= res!518382 (and (= (size!20655 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20655 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20655 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766229 () Bool)

(assert (=> b!766229 (= e!426693 e!426690)))

(declare-fun res!518383 () Bool)

(assert (=> b!766229 (=> (not res!518383) (not e!426690))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42259 (_ BitVec 32)) SeekEntryResult!7834)

(assert (=> b!766229 (= res!518383 (= (seekEntryOrOpen!0 (select (arr!20234 a!3186) j!159) a!3186 mask!3328) lt!340832))))

(assert (=> b!766229 (= lt!340832 (Found!7834 j!159))))

(declare-fun b!766230 () Bool)

(assert (=> b!766230 (= e!426687 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20234 a!3186) j!159) a!3186 mask!3328) (Found!7834 j!159)))))

(declare-fun b!766231 () Bool)

(declare-fun res!518374 () Bool)

(assert (=> b!766231 (=> (not res!518374) (not e!426689))))

(assert (=> b!766231 (= res!518374 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20234 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766232 () Bool)

(declare-fun res!518381 () Bool)

(assert (=> b!766232 (=> (not res!518381) (not e!426692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766232 (= res!518381 (validKeyInArray!0 (select (arr!20234 a!3186) j!159)))))

(declare-fun b!766233 () Bool)

(assert (=> b!766233 (= e!426692 e!426691)))

(declare-fun res!518387 () Bool)

(assert (=> b!766233 (=> (not res!518387) (not e!426691))))

(declare-fun lt!340836 () SeekEntryResult!7834)

(assert (=> b!766233 (= res!518387 (or (= lt!340836 (MissingZero!7834 i!1173)) (= lt!340836 (MissingVacant!7834 i!1173))))))

(assert (=> b!766233 (= lt!340836 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!766234 () Bool)

(declare-fun res!518377 () Bool)

(assert (=> b!766234 (=> (not res!518377) (not e!426691))))

(assert (=> b!766234 (= res!518377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766235 () Bool)

(assert (=> b!766235 (= e!426689 e!426685)))

(declare-fun res!518386 () Bool)

(assert (=> b!766235 (=> (not res!518386) (not e!426685))))

(declare-fun lt!340834 () SeekEntryResult!7834)

(assert (=> b!766235 (= res!518386 (= lt!340834 lt!340831))))

(declare-fun lt!340838 () (_ BitVec 64))

(declare-fun lt!340835 () array!42259)

(assert (=> b!766235 (= lt!340831 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340838 lt!340835 mask!3328))))

(assert (=> b!766235 (= lt!340834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340838 mask!3328) lt!340838 lt!340835 mask!3328))))

(assert (=> b!766235 (= lt!340838 (select (store (arr!20234 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!766235 (= lt!340835 (array!42260 (store (arr!20234 a!3186) i!1173 k!2102) (size!20655 a!3186)))))

(declare-fun b!766236 () Bool)

(declare-fun res!518378 () Bool)

(assert (=> b!766236 (=> (not res!518378) (not e!426691))))

(assert (=> b!766236 (= res!518378 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20655 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20655 a!3186))))))

(declare-fun b!766237 () Bool)

(assert (=> b!766237 (= e!426687 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20234 a!3186) j!159) a!3186 mask!3328) lt!340830))))

(declare-fun b!766238 () Bool)

(declare-fun res!518388 () Bool)

(assert (=> b!766238 (=> (not res!518388) (not e!426692))))

(assert (=> b!766238 (= res!518388 (validKeyInArray!0 k!2102))))

(assert (= (and start!66480 res!518385) b!766228))

(assert (= (and b!766228 res!518382) b!766232))

(assert (= (and b!766232 res!518381) b!766238))

(assert (= (and b!766238 res!518388) b!766224))

(assert (= (and b!766224 res!518376) b!766233))

(assert (= (and b!766233 res!518387) b!766234))

(assert (= (and b!766234 res!518377) b!766223))

(assert (= (and b!766223 res!518389) b!766236))

(assert (= (and b!766236 res!518378) b!766221))

(assert (= (and b!766221 res!518384) b!766231))

(assert (= (and b!766231 res!518374) b!766226))

(assert (= (and b!766226 c!84313) b!766237))

(assert (= (and b!766226 (not c!84313)) b!766230))

(assert (= (and b!766226 res!518380) b!766235))

(assert (= (and b!766235 res!518386) b!766222))

(assert (= (and b!766222 res!518379) b!766229))

(assert (= (and b!766229 res!518383) b!766225))

(assert (= (and b!766222 (not res!518375)) b!766227))

(declare-fun m!712233 () Bool)

(assert (=> b!766234 m!712233))

(declare-fun m!712235 () Bool)

(assert (=> start!66480 m!712235))

(declare-fun m!712237 () Bool)

(assert (=> start!66480 m!712237))

(declare-fun m!712239 () Bool)

(assert (=> b!766237 m!712239))

(assert (=> b!766237 m!712239))

(declare-fun m!712241 () Bool)

(assert (=> b!766237 m!712241))

(declare-fun m!712243 () Bool)

(assert (=> b!766227 m!712243))

(assert (=> b!766230 m!712239))

(assert (=> b!766230 m!712239))

(declare-fun m!712245 () Bool)

(assert (=> b!766230 m!712245))

(assert (=> b!766221 m!712239))

(assert (=> b!766221 m!712239))

(declare-fun m!712247 () Bool)

(assert (=> b!766221 m!712247))

(assert (=> b!766221 m!712247))

(assert (=> b!766221 m!712239))

(declare-fun m!712249 () Bool)

(assert (=> b!766221 m!712249))

(declare-fun m!712251 () Bool)

(assert (=> b!766223 m!712251))

(assert (=> b!766229 m!712239))

(assert (=> b!766229 m!712239))

(declare-fun m!712253 () Bool)

(assert (=> b!766229 m!712253))

(assert (=> b!766232 m!712239))

(assert (=> b!766232 m!712239))

(declare-fun m!712255 () Bool)

(assert (=> b!766232 m!712255))

(declare-fun m!712257 () Bool)

(assert (=> b!766222 m!712257))

(declare-fun m!712259 () Bool)

(assert (=> b!766222 m!712259))

(assert (=> b!766225 m!712239))

(assert (=> b!766225 m!712239))

(declare-fun m!712261 () Bool)

(assert (=> b!766225 m!712261))

(declare-fun m!712263 () Bool)

(assert (=> b!766231 m!712263))

(declare-fun m!712265 () Bool)

(assert (=> b!766235 m!712265))

(assert (=> b!766235 m!712265))

(declare-fun m!712267 () Bool)

(assert (=> b!766235 m!712267))

(declare-fun m!712269 () Bool)

(assert (=> b!766235 m!712269))

(declare-fun m!712271 () Bool)

(assert (=> b!766235 m!712271))

(declare-fun m!712273 () Bool)

(assert (=> b!766235 m!712273))

(declare-fun m!712275 () Bool)

(assert (=> b!766224 m!712275))

(declare-fun m!712277 () Bool)

(assert (=> b!766238 m!712277))

(declare-fun m!712279 () Bool)

(assert (=> b!766233 m!712279))

(push 1)

