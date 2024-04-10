; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67370 () Bool)

(assert start!67370)

(declare-fun e!433583 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42599 0))(
  ( (array!42600 (arr!20392 (Array (_ BitVec 32) (_ BitVec 64))) (size!20813 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42599)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!779387 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7992 0))(
  ( (MissingZero!7992 (index!34336 (_ BitVec 32))) (Found!7992 (index!34337 (_ BitVec 32))) (Intermediate!7992 (undefined!8804 Bool) (index!34338 (_ BitVec 32)) (x!65281 (_ BitVec 32))) (Undefined!7992) (MissingVacant!7992 (index!34339 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42599 (_ BitVec 32)) SeekEntryResult!7992)

(assert (=> b!779387 (= e!433583 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) (Found!7992 j!159)))))

(declare-fun b!779388 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!433580 () Bool)

(declare-fun lt!347276 () SeekEntryResult!7992)

(assert (=> b!779388 (= e!433580 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347276))))

(declare-fun b!779389 () Bool)

(declare-fun res!527349 () Bool)

(declare-fun e!433579 () Bool)

(assert (=> b!779389 (=> (not res!527349) (not e!433579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42599 (_ BitVec 32)) Bool)

(assert (=> b!779389 (= res!527349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779390 () Bool)

(declare-fun res!527358 () Bool)

(declare-fun e!433584 () Bool)

(assert (=> b!779390 (=> (not res!527358) (not e!433584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779390 (= res!527358 (validKeyInArray!0 (select (arr!20392 a!3186) j!159)))))

(declare-fun b!779391 () Bool)

(assert (=> b!779391 (= e!433584 e!433579)))

(declare-fun res!527355 () Bool)

(assert (=> b!779391 (=> (not res!527355) (not e!433579))))

(declare-fun lt!347274 () SeekEntryResult!7992)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779391 (= res!527355 (or (= lt!347274 (MissingZero!7992 i!1173)) (= lt!347274 (MissingVacant!7992 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42599 (_ BitVec 32)) SeekEntryResult!7992)

(assert (=> b!779391 (= lt!347274 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779392 () Bool)

(declare-fun res!527359 () Bool)

(assert (=> b!779392 (=> (not res!527359) (not e!433584))))

(assert (=> b!779392 (= res!527359 (and (= (size!20813 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20813 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20813 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779393 () Bool)

(declare-fun res!527350 () Bool)

(declare-fun e!433586 () Bool)

(assert (=> b!779393 (=> (not res!527350) (not e!433586))))

(assert (=> b!779393 (= res!527350 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20392 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!347272 () SeekEntryResult!7992)

(declare-fun b!779394 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42599 (_ BitVec 32)) SeekEntryResult!7992)

(assert (=> b!779394 (= e!433583 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347272))))

(declare-fun b!779395 () Bool)

(declare-fun res!527356 () Bool)

(assert (=> b!779395 (=> (not res!527356) (not e!433579))))

(assert (=> b!779395 (= res!527356 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20813 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20813 a!3186))))))

(declare-fun lt!347279 () (_ BitVec 64))

(declare-fun lt!347275 () SeekEntryResult!7992)

(declare-fun e!433582 () Bool)

(declare-fun lt!347278 () SeekEntryResult!7992)

(declare-fun b!779396 () Bool)

(assert (=> b!779396 (= e!433582 (or (not (= lt!347278 lt!347276)) (= (select (store (arr!20392 a!3186) i!1173 k0!2102) index!1321) lt!347279) (not (= (select (store (arr!20392 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!347275 lt!347278)))))

(assert (=> b!779396 (= lt!347278 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20392 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779397 () Bool)

(declare-fun res!527351 () Bool)

(assert (=> b!779397 (=> (not res!527351) (not e!433584))))

(declare-fun arrayContainsKey!0 (array!42599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779397 (= res!527351 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!527363 () Bool)

(assert (=> start!67370 (=> (not res!527363) (not e!433584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67370 (= res!527363 (validMask!0 mask!3328))))

(assert (=> start!67370 e!433584))

(assert (=> start!67370 true))

(declare-fun array_inv!16188 (array!42599) Bool)

(assert (=> start!67370 (array_inv!16188 a!3186)))

(declare-fun b!779398 () Bool)

(declare-fun e!433585 () Bool)

(assert (=> b!779398 (= e!433586 e!433585)))

(declare-fun res!527352 () Bool)

(assert (=> b!779398 (=> (not res!527352) (not e!433585))))

(declare-fun lt!347273 () SeekEntryResult!7992)

(declare-fun lt!347271 () SeekEntryResult!7992)

(assert (=> b!779398 (= res!527352 (= lt!347273 lt!347271))))

(declare-fun lt!347270 () array!42599)

(assert (=> b!779398 (= lt!347271 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347279 lt!347270 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779398 (= lt!347273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347279 mask!3328) lt!347279 lt!347270 mask!3328))))

(assert (=> b!779398 (= lt!347279 (select (store (arr!20392 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779398 (= lt!347270 (array!42600 (store (arr!20392 a!3186) i!1173 k0!2102) (size!20813 a!3186)))))

(declare-fun b!779399 () Bool)

(declare-fun res!527360 () Bool)

(assert (=> b!779399 (=> (not res!527360) (not e!433586))))

(assert (=> b!779399 (= res!527360 e!433583)))

(declare-fun c!86422 () Bool)

(assert (=> b!779399 (= c!86422 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779400 () Bool)

(declare-fun res!527361 () Bool)

(assert (=> b!779400 (=> (not res!527361) (not e!433584))))

(assert (=> b!779400 (= res!527361 (validKeyInArray!0 k0!2102))))

(declare-fun b!779401 () Bool)

(assert (=> b!779401 (= e!433579 e!433586)))

(declare-fun res!527362 () Bool)

(assert (=> b!779401 (=> (not res!527362) (not e!433586))))

(assert (=> b!779401 (= res!527362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20392 a!3186) j!159) mask!3328) (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347272))))

(assert (=> b!779401 (= lt!347272 (Intermediate!7992 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779402 () Bool)

(assert (=> b!779402 (= e!433585 (not e!433582))))

(declare-fun res!527357 () Bool)

(assert (=> b!779402 (=> res!527357 e!433582)))

(get-info :version)

(assert (=> b!779402 (= res!527357 (or (not ((_ is Intermediate!7992) lt!347271)) (bvslt x!1131 (x!65281 lt!347271)) (not (= x!1131 (x!65281 lt!347271))) (not (= index!1321 (index!34338 lt!347271)))))))

(assert (=> b!779402 e!433580))

(declare-fun res!527354 () Bool)

(assert (=> b!779402 (=> (not res!527354) (not e!433580))))

(assert (=> b!779402 (= res!527354 (= lt!347275 lt!347276))))

(assert (=> b!779402 (= lt!347276 (Found!7992 j!159))))

(assert (=> b!779402 (= lt!347275 (seekEntryOrOpen!0 (select (arr!20392 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!779402 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26878 0))(
  ( (Unit!26879) )
))
(declare-fun lt!347277 () Unit!26878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26878)

(assert (=> b!779402 (= lt!347277 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779403 () Bool)

(declare-fun res!527353 () Bool)

(assert (=> b!779403 (=> (not res!527353) (not e!433579))))

(declare-datatypes ((List!14394 0))(
  ( (Nil!14391) (Cons!14390 (h!15504 (_ BitVec 64)) (t!20709 List!14394)) )
))
(declare-fun arrayNoDuplicates!0 (array!42599 (_ BitVec 32) List!14394) Bool)

(assert (=> b!779403 (= res!527353 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14391))))

(assert (= (and start!67370 res!527363) b!779392))

(assert (= (and b!779392 res!527359) b!779390))

(assert (= (and b!779390 res!527358) b!779400))

(assert (= (and b!779400 res!527361) b!779397))

(assert (= (and b!779397 res!527351) b!779391))

(assert (= (and b!779391 res!527355) b!779389))

(assert (= (and b!779389 res!527349) b!779403))

(assert (= (and b!779403 res!527353) b!779395))

(assert (= (and b!779395 res!527356) b!779401))

(assert (= (and b!779401 res!527362) b!779393))

(assert (= (and b!779393 res!527350) b!779399))

(assert (= (and b!779399 c!86422) b!779394))

(assert (= (and b!779399 (not c!86422)) b!779387))

(assert (= (and b!779399 res!527360) b!779398))

(assert (= (and b!779398 res!527352) b!779402))

(assert (= (and b!779402 res!527354) b!779388))

(assert (= (and b!779402 (not res!527357)) b!779396))

(declare-fun m!722903 () Bool)

(assert (=> b!779394 m!722903))

(assert (=> b!779394 m!722903))

(declare-fun m!722905 () Bool)

(assert (=> b!779394 m!722905))

(declare-fun m!722907 () Bool)

(assert (=> b!779391 m!722907))

(declare-fun m!722909 () Bool)

(assert (=> b!779400 m!722909))

(assert (=> b!779402 m!722903))

(assert (=> b!779402 m!722903))

(declare-fun m!722911 () Bool)

(assert (=> b!779402 m!722911))

(declare-fun m!722913 () Bool)

(assert (=> b!779402 m!722913))

(declare-fun m!722915 () Bool)

(assert (=> b!779402 m!722915))

(assert (=> b!779401 m!722903))

(assert (=> b!779401 m!722903))

(declare-fun m!722917 () Bool)

(assert (=> b!779401 m!722917))

(assert (=> b!779401 m!722917))

(assert (=> b!779401 m!722903))

(declare-fun m!722919 () Bool)

(assert (=> b!779401 m!722919))

(declare-fun m!722921 () Bool)

(assert (=> b!779396 m!722921))

(declare-fun m!722923 () Bool)

(assert (=> b!779396 m!722923))

(assert (=> b!779396 m!722903))

(assert (=> b!779396 m!722903))

(declare-fun m!722925 () Bool)

(assert (=> b!779396 m!722925))

(declare-fun m!722927 () Bool)

(assert (=> b!779398 m!722927))

(declare-fun m!722929 () Bool)

(assert (=> b!779398 m!722929))

(assert (=> b!779398 m!722929))

(declare-fun m!722931 () Bool)

(assert (=> b!779398 m!722931))

(assert (=> b!779398 m!722921))

(declare-fun m!722933 () Bool)

(assert (=> b!779398 m!722933))

(declare-fun m!722935 () Bool)

(assert (=> start!67370 m!722935))

(declare-fun m!722937 () Bool)

(assert (=> start!67370 m!722937))

(assert (=> b!779390 m!722903))

(assert (=> b!779390 m!722903))

(declare-fun m!722939 () Bool)

(assert (=> b!779390 m!722939))

(declare-fun m!722941 () Bool)

(assert (=> b!779393 m!722941))

(assert (=> b!779387 m!722903))

(assert (=> b!779387 m!722903))

(assert (=> b!779387 m!722925))

(declare-fun m!722943 () Bool)

(assert (=> b!779403 m!722943))

(declare-fun m!722945 () Bool)

(assert (=> b!779397 m!722945))

(declare-fun m!722947 () Bool)

(assert (=> b!779389 m!722947))

(assert (=> b!779388 m!722903))

(assert (=> b!779388 m!722903))

(declare-fun m!722949 () Bool)

(assert (=> b!779388 m!722949))

(check-sat (not b!779397) (not b!779396) (not b!779389) (not b!779388) (not b!779401) (not b!779390) (not b!779387) (not b!779398) (not b!779391) (not b!779394) (not start!67370) (not b!779403) (not b!779402) (not b!779400))
(check-sat)
