; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65390 () Bool)

(assert start!65390)

(declare-fun b!744254 () Bool)

(declare-fun res!501374 () Bool)

(declare-fun e!415739 () Bool)

(assert (=> b!744254 (=> (not res!501374) (not e!415739))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41580 0))(
  ( (array!41581 (arr!19904 (Array (_ BitVec 32) (_ BitVec 64))) (size!20325 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41580)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!744254 (= res!501374 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20325 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20325 a!3186))))))

(declare-fun b!744255 () Bool)

(declare-fun res!501373 () Bool)

(declare-fun e!415735 () Bool)

(assert (=> b!744255 (=> (not res!501373) (not e!415735))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744255 (= res!501373 (validKeyInArray!0 k0!2102))))

(declare-fun res!501387 () Bool)

(assert (=> start!65390 (=> (not res!501387) (not e!415735))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65390 (= res!501387 (validMask!0 mask!3328))))

(assert (=> start!65390 e!415735))

(assert (=> start!65390 true))

(declare-fun array_inv!15787 (array!41580) Bool)

(assert (=> start!65390 (array_inv!15787 a!3186)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun e!415738 () Bool)

(declare-fun lt!330506 () (_ BitVec 64))

(declare-fun b!744256 () Bool)

(assert (=> b!744256 (= e!415738 (or (= (select (store (arr!19904 a!3186) i!1173 k0!2102) index!1321) lt!330506) (not (= (select (store (arr!19904 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!744257 () Bool)

(declare-fun res!501384 () Bool)

(assert (=> b!744257 (=> (not res!501384) (not e!415735))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!744257 (= res!501384 (validKeyInArray!0 (select (arr!19904 a!3186) j!159)))))

(declare-fun b!744258 () Bool)

(declare-fun res!501383 () Bool)

(assert (=> b!744258 (=> (not res!501383) (not e!415735))))

(assert (=> b!744258 (= res!501383 (and (= (size!20325 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20325 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20325 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744259 () Bool)

(declare-fun res!501385 () Bool)

(assert (=> b!744259 (=> (not res!501385) (not e!415739))))

(declare-datatypes ((List!13945 0))(
  ( (Nil!13942) (Cons!13941 (h!15013 (_ BitVec 64)) (t!20251 List!13945)) )
))
(declare-fun arrayNoDuplicates!0 (array!41580 (_ BitVec 32) List!13945) Bool)

(assert (=> b!744259 (= res!501385 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13942))))

(declare-datatypes ((SeekEntryResult!7501 0))(
  ( (MissingZero!7501 (index!32372 (_ BitVec 32))) (Found!7501 (index!32373 (_ BitVec 32))) (Intermediate!7501 (undefined!8313 Bool) (index!32374 (_ BitVec 32)) (x!63342 (_ BitVec 32))) (Undefined!7501) (MissingVacant!7501 (index!32375 (_ BitVec 32))) )
))
(declare-fun lt!330505 () SeekEntryResult!7501)

(declare-fun e!415736 () Bool)

(declare-fun b!744260 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41580 (_ BitVec 32)) SeekEntryResult!7501)

(assert (=> b!744260 (= e!415736 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19904 a!3186) j!159) a!3186 mask!3328) lt!330505))))

(declare-fun b!744261 () Bool)

(declare-fun res!501376 () Bool)

(declare-fun e!415737 () Bool)

(assert (=> b!744261 (=> (not res!501376) (not e!415737))))

(declare-fun e!415741 () Bool)

(assert (=> b!744261 (= res!501376 e!415741)))

(declare-fun c!81822 () Bool)

(assert (=> b!744261 (= c!81822 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744262 () Bool)

(assert (=> b!744262 (= e!415735 e!415739)))

(declare-fun res!501380 () Bool)

(assert (=> b!744262 (=> (not res!501380) (not e!415739))))

(declare-fun lt!330509 () SeekEntryResult!7501)

(assert (=> b!744262 (= res!501380 (or (= lt!330509 (MissingZero!7501 i!1173)) (= lt!330509 (MissingVacant!7501 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41580 (_ BitVec 32)) SeekEntryResult!7501)

(assert (=> b!744262 (= lt!330509 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744263 () Bool)

(declare-fun e!415734 () Bool)

(assert (=> b!744263 (= e!415737 e!415734)))

(declare-fun res!501377 () Bool)

(assert (=> b!744263 (=> (not res!501377) (not e!415734))))

(declare-fun lt!330502 () SeekEntryResult!7501)

(declare-fun lt!330503 () SeekEntryResult!7501)

(assert (=> b!744263 (= res!501377 (= lt!330502 lt!330503))))

(declare-fun lt!330504 () array!41580)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41580 (_ BitVec 32)) SeekEntryResult!7501)

(assert (=> b!744263 (= lt!330503 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330506 lt!330504 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744263 (= lt!330502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330506 mask!3328) lt!330506 lt!330504 mask!3328))))

(assert (=> b!744263 (= lt!330506 (select (store (arr!19904 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744263 (= lt!330504 (array!41581 (store (arr!19904 a!3186) i!1173 k0!2102) (size!20325 a!3186)))))

(declare-fun b!744264 () Bool)

(assert (=> b!744264 (= e!415739 e!415737)))

(declare-fun res!501371 () Bool)

(assert (=> b!744264 (=> (not res!501371) (not e!415737))))

(declare-fun lt!330507 () SeekEntryResult!7501)

(assert (=> b!744264 (= res!501371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19904 a!3186) j!159) mask!3328) (select (arr!19904 a!3186) j!159) a!3186 mask!3328) lt!330507))))

(assert (=> b!744264 (= lt!330507 (Intermediate!7501 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744265 () Bool)

(declare-fun res!501381 () Bool)

(assert (=> b!744265 (=> (not res!501381) (not e!415739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41580 (_ BitVec 32)) Bool)

(assert (=> b!744265 (= res!501381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744266 () Bool)

(assert (=> b!744266 (= e!415741 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19904 a!3186) j!159) a!3186 mask!3328) (Found!7501 j!159)))))

(declare-fun b!744267 () Bool)

(declare-fun res!501375 () Bool)

(assert (=> b!744267 (=> (not res!501375) (not e!415737))))

(assert (=> b!744267 (= res!501375 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19904 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744268 () Bool)

(assert (=> b!744268 (= e!415741 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19904 a!3186) j!159) a!3186 mask!3328) lt!330507))))

(declare-fun b!744269 () Bool)

(declare-fun res!501382 () Bool)

(assert (=> b!744269 (=> (not res!501382) (not e!415735))))

(declare-fun arrayContainsKey!0 (array!41580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744269 (= res!501382 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744270 () Bool)

(assert (=> b!744270 (= e!415734 (not e!415738))))

(declare-fun res!501379 () Bool)

(assert (=> b!744270 (=> res!501379 e!415738)))

(get-info :version)

(assert (=> b!744270 (= res!501379 (or (not ((_ is Intermediate!7501) lt!330503)) (bvslt x!1131 (x!63342 lt!330503)) (not (= x!1131 (x!63342 lt!330503))) (not (= index!1321 (index!32374 lt!330503)))))))

(declare-fun e!415740 () Bool)

(assert (=> b!744270 e!415740))

(declare-fun res!501386 () Bool)

(assert (=> b!744270 (=> (not res!501386) (not e!415740))))

(assert (=> b!744270 (= res!501386 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25454 0))(
  ( (Unit!25455) )
))
(declare-fun lt!330508 () Unit!25454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25454)

(assert (=> b!744270 (= lt!330508 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744271 () Bool)

(assert (=> b!744271 (= e!415740 e!415736)))

(declare-fun res!501378 () Bool)

(assert (=> b!744271 (=> (not res!501378) (not e!415736))))

(assert (=> b!744271 (= res!501378 (= (seekEntryOrOpen!0 (select (arr!19904 a!3186) j!159) a!3186 mask!3328) lt!330505))))

(assert (=> b!744271 (= lt!330505 (Found!7501 j!159))))

(declare-fun b!744272 () Bool)

(declare-fun res!501372 () Bool)

(assert (=> b!744272 (=> res!501372 e!415738)))

(assert (=> b!744272 (= res!501372 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19904 a!3186) j!159) a!3186 mask!3328) (Found!7501 j!159))))))

(assert (= (and start!65390 res!501387) b!744258))

(assert (= (and b!744258 res!501383) b!744257))

(assert (= (and b!744257 res!501384) b!744255))

(assert (= (and b!744255 res!501373) b!744269))

(assert (= (and b!744269 res!501382) b!744262))

(assert (= (and b!744262 res!501380) b!744265))

(assert (= (and b!744265 res!501381) b!744259))

(assert (= (and b!744259 res!501385) b!744254))

(assert (= (and b!744254 res!501374) b!744264))

(assert (= (and b!744264 res!501371) b!744267))

(assert (= (and b!744267 res!501375) b!744261))

(assert (= (and b!744261 c!81822) b!744268))

(assert (= (and b!744261 (not c!81822)) b!744266))

(assert (= (and b!744261 res!501376) b!744263))

(assert (= (and b!744263 res!501377) b!744270))

(assert (= (and b!744270 res!501386) b!744271))

(assert (= (and b!744271 res!501378) b!744260))

(assert (= (and b!744270 (not res!501379)) b!744272))

(assert (= (and b!744272 (not res!501372)) b!744256))

(declare-fun m!694265 () Bool)

(assert (=> b!744268 m!694265))

(assert (=> b!744268 m!694265))

(declare-fun m!694267 () Bool)

(assert (=> b!744268 m!694267))

(declare-fun m!694269 () Bool)

(assert (=> b!744270 m!694269))

(declare-fun m!694271 () Bool)

(assert (=> b!744270 m!694271))

(declare-fun m!694273 () Bool)

(assert (=> b!744256 m!694273))

(declare-fun m!694275 () Bool)

(assert (=> b!744256 m!694275))

(assert (=> b!744260 m!694265))

(assert (=> b!744260 m!694265))

(declare-fun m!694277 () Bool)

(assert (=> b!744260 m!694277))

(declare-fun m!694279 () Bool)

(assert (=> b!744267 m!694279))

(declare-fun m!694281 () Bool)

(assert (=> start!65390 m!694281))

(declare-fun m!694283 () Bool)

(assert (=> start!65390 m!694283))

(declare-fun m!694285 () Bool)

(assert (=> b!744255 m!694285))

(declare-fun m!694287 () Bool)

(assert (=> b!744269 m!694287))

(assert (=> b!744266 m!694265))

(assert (=> b!744266 m!694265))

(declare-fun m!694289 () Bool)

(assert (=> b!744266 m!694289))

(assert (=> b!744264 m!694265))

(assert (=> b!744264 m!694265))

(declare-fun m!694291 () Bool)

(assert (=> b!744264 m!694291))

(assert (=> b!744264 m!694291))

(assert (=> b!744264 m!694265))

(declare-fun m!694293 () Bool)

(assert (=> b!744264 m!694293))

(declare-fun m!694295 () Bool)

(assert (=> b!744265 m!694295))

(declare-fun m!694297 () Bool)

(assert (=> b!744263 m!694297))

(declare-fun m!694299 () Bool)

(assert (=> b!744263 m!694299))

(assert (=> b!744263 m!694273))

(declare-fun m!694301 () Bool)

(assert (=> b!744263 m!694301))

(assert (=> b!744263 m!694299))

(declare-fun m!694303 () Bool)

(assert (=> b!744263 m!694303))

(assert (=> b!744272 m!694265))

(assert (=> b!744272 m!694265))

(assert (=> b!744272 m!694289))

(assert (=> b!744271 m!694265))

(assert (=> b!744271 m!694265))

(declare-fun m!694305 () Bool)

(assert (=> b!744271 m!694305))

(declare-fun m!694307 () Bool)

(assert (=> b!744262 m!694307))

(declare-fun m!694309 () Bool)

(assert (=> b!744259 m!694309))

(assert (=> b!744257 m!694265))

(assert (=> b!744257 m!694265))

(declare-fun m!694311 () Bool)

(assert (=> b!744257 m!694311))

(check-sat (not b!744262) (not b!744272) (not b!744263) (not b!744264) (not b!744255) (not b!744260) (not b!744270) (not b!744266) (not b!744268) (not b!744259) (not b!744271) (not b!744257) (not b!744265) (not b!744269) (not start!65390))
(check-sat)
