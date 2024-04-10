; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67742 () Bool)

(assert start!67742)

(declare-fun res!532397 () Bool)

(declare-fun e!437114 () Bool)

(assert (=> start!67742 (=> (not res!532397) (not e!437114))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67742 (= res!532397 (validMask!0 mask!3328))))

(assert (=> start!67742 e!437114))

(assert (=> start!67742 true))

(declare-datatypes ((array!42782 0))(
  ( (array!42783 (arr!20479 (Array (_ BitVec 32) (_ BitVec 64))) (size!20900 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42782)

(declare-fun array_inv!16275 (array!42782) Bool)

(assert (=> start!67742 (array_inv!16275 a!3186)))

(declare-fun b!786311 () Bool)

(declare-fun res!532382 () Bool)

(declare-fun e!437118 () Bool)

(assert (=> b!786311 (=> (not res!532382) (not e!437118))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!350670 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!350671 () array!42782)

(declare-datatypes ((SeekEntryResult!8079 0))(
  ( (MissingZero!8079 (index!34684 (_ BitVec 32))) (Found!8079 (index!34685 (_ BitVec 32))) (Intermediate!8079 (undefined!8891 Bool) (index!34686 (_ BitVec 32)) (x!65627 (_ BitVec 32))) (Undefined!8079) (MissingVacant!8079 (index!34687 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42782 (_ BitVec 32)) SeekEntryResult!8079)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42782 (_ BitVec 32)) SeekEntryResult!8079)

(assert (=> b!786311 (= res!532382 (= (seekEntryOrOpen!0 lt!350670 lt!350671 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350670 lt!350671 mask!3328)))))

(declare-fun b!786312 () Bool)

(declare-datatypes ((Unit!27204 0))(
  ( (Unit!27205) )
))
(declare-fun e!437115 () Unit!27204)

(declare-fun Unit!27206 () Unit!27204)

(assert (=> b!786312 (= e!437115 Unit!27206)))

(assert (=> b!786312 false))

(declare-fun b!786313 () Bool)

(declare-fun res!532396 () Bool)

(declare-fun e!437109 () Bool)

(assert (=> b!786313 (=> (not res!532396) (not e!437109))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786313 (= res!532396 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20900 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20900 a!3186))))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!437110 () Bool)

(declare-fun b!786314 () Bool)

(declare-fun lt!350672 () SeekEntryResult!8079)

(assert (=> b!786314 (= e!437110 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20479 a!3186) j!159) a!3186 mask!3328) lt!350672))))

(declare-fun b!786315 () Bool)

(declare-fun res!532391 () Bool)

(assert (=> b!786315 (=> (not res!532391) (not e!437114))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786315 (= res!532391 (validKeyInArray!0 k0!2102))))

(declare-fun b!786316 () Bool)

(declare-fun res!532392 () Bool)

(assert (=> b!786316 (=> (not res!532392) (not e!437114))))

(declare-fun arrayContainsKey!0 (array!42782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786316 (= res!532392 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786317 () Bool)

(declare-fun e!437113 () Bool)

(declare-fun e!437116 () Bool)

(assert (=> b!786317 (= e!437113 e!437116)))

(declare-fun res!532386 () Bool)

(assert (=> b!786317 (=> (not res!532386) (not e!437116))))

(declare-fun lt!350661 () SeekEntryResult!8079)

(declare-fun lt!350663 () SeekEntryResult!8079)

(assert (=> b!786317 (= res!532386 (= lt!350661 lt!350663))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42782 (_ BitVec 32)) SeekEntryResult!8079)

(assert (=> b!786317 (= lt!350663 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350670 lt!350671 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786317 (= lt!350661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350670 mask!3328) lt!350670 lt!350671 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786317 (= lt!350670 (select (store (arr!20479 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786317 (= lt!350671 (array!42783 (store (arr!20479 a!3186) i!1173 k0!2102) (size!20900 a!3186)))))

(declare-fun b!786318 () Bool)

(declare-fun res!532395 () Bool)

(assert (=> b!786318 (=> (not res!532395) (not e!437113))))

(assert (=> b!786318 (= res!532395 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20479 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786319 () Bool)

(assert (=> b!786319 (= e!437114 e!437109)))

(declare-fun res!532388 () Bool)

(assert (=> b!786319 (=> (not res!532388) (not e!437109))))

(declare-fun lt!350662 () SeekEntryResult!8079)

(assert (=> b!786319 (= res!532388 (or (= lt!350662 (MissingZero!8079 i!1173)) (= lt!350662 (MissingVacant!8079 i!1173))))))

(assert (=> b!786319 (= lt!350662 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786320 () Bool)

(declare-fun e!437117 () Bool)

(assert (=> b!786320 (= e!437117 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20479 a!3186) j!159) a!3186 mask!3328) (Found!8079 j!159)))))

(declare-fun b!786321 () Bool)

(declare-fun e!437119 () Bool)

(assert (=> b!786321 (= e!437116 (not e!437119))))

(declare-fun res!532390 () Bool)

(assert (=> b!786321 (=> res!532390 e!437119)))

(get-info :version)

(assert (=> b!786321 (= res!532390 (or (not ((_ is Intermediate!8079) lt!350663)) (bvslt x!1131 (x!65627 lt!350663)) (not (= x!1131 (x!65627 lt!350663))) (not (= index!1321 (index!34686 lt!350663)))))))

(assert (=> b!786321 e!437110))

(declare-fun res!532398 () Bool)

(assert (=> b!786321 (=> (not res!532398) (not e!437110))))

(declare-fun lt!350664 () SeekEntryResult!8079)

(assert (=> b!786321 (= res!532398 (= lt!350664 lt!350672))))

(assert (=> b!786321 (= lt!350672 (Found!8079 j!159))))

(assert (=> b!786321 (= lt!350664 (seekEntryOrOpen!0 (select (arr!20479 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42782 (_ BitVec 32)) Bool)

(assert (=> b!786321 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350665 () Unit!27204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27204)

(assert (=> b!786321 (= lt!350665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786322 () Bool)

(declare-fun lt!350666 () SeekEntryResult!8079)

(assert (=> b!786322 (= e!437117 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20479 a!3186) j!159) a!3186 mask!3328) lt!350666))))

(declare-fun b!786323 () Bool)

(declare-fun res!532399 () Bool)

(assert (=> b!786323 (=> (not res!532399) (not e!437109))))

(assert (=> b!786323 (= res!532399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786324 () Bool)

(declare-fun e!437120 () Bool)

(assert (=> b!786324 (= e!437119 e!437120)))

(declare-fun res!532393 () Bool)

(assert (=> b!786324 (=> res!532393 e!437120)))

(declare-fun lt!350667 () SeekEntryResult!8079)

(assert (=> b!786324 (= res!532393 (not (= lt!350667 lt!350672)))))

(assert (=> b!786324 (= lt!350667 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20479 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786325 () Bool)

(assert (=> b!786325 (= e!437118 (= lt!350664 lt!350667))))

(declare-fun b!786326 () Bool)

(assert (=> b!786326 (= e!437109 e!437113)))

(declare-fun res!532383 () Bool)

(assert (=> b!786326 (=> (not res!532383) (not e!437113))))

(assert (=> b!786326 (= res!532383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20479 a!3186) j!159) mask!3328) (select (arr!20479 a!3186) j!159) a!3186 mask!3328) lt!350666))))

(assert (=> b!786326 (= lt!350666 (Intermediate!8079 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786327 () Bool)

(declare-fun res!532387 () Bool)

(assert (=> b!786327 (=> (not res!532387) (not e!437109))))

(declare-datatypes ((List!14481 0))(
  ( (Nil!14478) (Cons!14477 (h!15600 (_ BitVec 64)) (t!20796 List!14481)) )
))
(declare-fun arrayNoDuplicates!0 (array!42782 (_ BitVec 32) List!14481) Bool)

(assert (=> b!786327 (= res!532387 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14478))))

(declare-fun b!786328 () Bool)

(declare-fun res!532385 () Bool)

(assert (=> b!786328 (=> (not res!532385) (not e!437114))))

(assert (=> b!786328 (= res!532385 (validKeyInArray!0 (select (arr!20479 a!3186) j!159)))))

(declare-fun b!786329 () Bool)

(declare-fun res!532384 () Bool)

(assert (=> b!786329 (=> (not res!532384) (not e!437114))))

(assert (=> b!786329 (= res!532384 (and (= (size!20900 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20900 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20900 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786330 () Bool)

(declare-fun e!437112 () Bool)

(assert (=> b!786330 (= e!437112 true)))

(assert (=> b!786330 e!437118))

(declare-fun res!532389 () Bool)

(assert (=> b!786330 (=> (not res!532389) (not e!437118))))

(declare-fun lt!350669 () (_ BitVec 64))

(assert (=> b!786330 (= res!532389 (= lt!350669 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350668 () Unit!27204)

(assert (=> b!786330 (= lt!350668 e!437115)))

(declare-fun c!87372 () Bool)

(assert (=> b!786330 (= c!87372 (= lt!350669 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786331 () Bool)

(assert (=> b!786331 (= e!437120 e!437112)))

(declare-fun res!532400 () Bool)

(assert (=> b!786331 (=> res!532400 e!437112)))

(assert (=> b!786331 (= res!532400 (= lt!350669 lt!350670))))

(assert (=> b!786331 (= lt!350669 (select (store (arr!20479 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786332 () Bool)

(declare-fun Unit!27207 () Unit!27204)

(assert (=> b!786332 (= e!437115 Unit!27207)))

(declare-fun b!786333 () Bool)

(declare-fun res!532394 () Bool)

(assert (=> b!786333 (=> (not res!532394) (not e!437113))))

(assert (=> b!786333 (= res!532394 e!437117)))

(declare-fun c!87373 () Bool)

(assert (=> b!786333 (= c!87373 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67742 res!532397) b!786329))

(assert (= (and b!786329 res!532384) b!786328))

(assert (= (and b!786328 res!532385) b!786315))

(assert (= (and b!786315 res!532391) b!786316))

(assert (= (and b!786316 res!532392) b!786319))

(assert (= (and b!786319 res!532388) b!786323))

(assert (= (and b!786323 res!532399) b!786327))

(assert (= (and b!786327 res!532387) b!786313))

(assert (= (and b!786313 res!532396) b!786326))

(assert (= (and b!786326 res!532383) b!786318))

(assert (= (and b!786318 res!532395) b!786333))

(assert (= (and b!786333 c!87373) b!786322))

(assert (= (and b!786333 (not c!87373)) b!786320))

(assert (= (and b!786333 res!532394) b!786317))

(assert (= (and b!786317 res!532386) b!786321))

(assert (= (and b!786321 res!532398) b!786314))

(assert (= (and b!786321 (not res!532390)) b!786324))

(assert (= (and b!786324 (not res!532393)) b!786331))

(assert (= (and b!786331 (not res!532400)) b!786330))

(assert (= (and b!786330 c!87372) b!786312))

(assert (= (and b!786330 (not c!87372)) b!786332))

(assert (= (and b!786330 res!532389) b!786311))

(assert (= (and b!786311 res!532382) b!786325))

(declare-fun m!728169 () Bool)

(assert (=> b!786328 m!728169))

(assert (=> b!786328 m!728169))

(declare-fun m!728171 () Bool)

(assert (=> b!786328 m!728171))

(declare-fun m!728173 () Bool)

(assert (=> b!786317 m!728173))

(declare-fun m!728175 () Bool)

(assert (=> b!786317 m!728175))

(declare-fun m!728177 () Bool)

(assert (=> b!786317 m!728177))

(assert (=> b!786317 m!728175))

(declare-fun m!728179 () Bool)

(assert (=> b!786317 m!728179))

(declare-fun m!728181 () Bool)

(assert (=> b!786317 m!728181))

(assert (=> b!786326 m!728169))

(assert (=> b!786326 m!728169))

(declare-fun m!728183 () Bool)

(assert (=> b!786326 m!728183))

(assert (=> b!786326 m!728183))

(assert (=> b!786326 m!728169))

(declare-fun m!728185 () Bool)

(assert (=> b!786326 m!728185))

(assert (=> b!786331 m!728179))

(declare-fun m!728187 () Bool)

(assert (=> b!786331 m!728187))

(declare-fun m!728189 () Bool)

(assert (=> b!786316 m!728189))

(assert (=> b!786324 m!728169))

(assert (=> b!786324 m!728169))

(declare-fun m!728191 () Bool)

(assert (=> b!786324 m!728191))

(assert (=> b!786322 m!728169))

(assert (=> b!786322 m!728169))

(declare-fun m!728193 () Bool)

(assert (=> b!786322 m!728193))

(declare-fun m!728195 () Bool)

(assert (=> start!67742 m!728195))

(declare-fun m!728197 () Bool)

(assert (=> start!67742 m!728197))

(declare-fun m!728199 () Bool)

(assert (=> b!786311 m!728199))

(declare-fun m!728201 () Bool)

(assert (=> b!786311 m!728201))

(assert (=> b!786314 m!728169))

(assert (=> b!786314 m!728169))

(declare-fun m!728203 () Bool)

(assert (=> b!786314 m!728203))

(declare-fun m!728205 () Bool)

(assert (=> b!786315 m!728205))

(declare-fun m!728207 () Bool)

(assert (=> b!786327 m!728207))

(declare-fun m!728209 () Bool)

(assert (=> b!786323 m!728209))

(assert (=> b!786320 m!728169))

(assert (=> b!786320 m!728169))

(assert (=> b!786320 m!728191))

(declare-fun m!728211 () Bool)

(assert (=> b!786318 m!728211))

(assert (=> b!786321 m!728169))

(assert (=> b!786321 m!728169))

(declare-fun m!728213 () Bool)

(assert (=> b!786321 m!728213))

(declare-fun m!728215 () Bool)

(assert (=> b!786321 m!728215))

(declare-fun m!728217 () Bool)

(assert (=> b!786321 m!728217))

(declare-fun m!728219 () Bool)

(assert (=> b!786319 m!728219))

(check-sat (not b!786314) (not b!786316) (not b!786321) (not b!786320) (not b!786328) (not b!786311) (not b!786319) (not b!786317) (not b!786327) (not b!786315) (not b!786323) (not b!786322) (not start!67742) (not b!786326) (not b!786324))
(check-sat)
