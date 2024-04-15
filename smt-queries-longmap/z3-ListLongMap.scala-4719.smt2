; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65354 () Bool)

(assert start!65354)

(declare-fun b!743243 () Bool)

(declare-fun e!415255 () Bool)

(declare-fun lt!330035 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743243 (= e!415255 (validKeyInArray!0 lt!330035))))

(declare-fun b!743244 () Bool)

(declare-fun res!500486 () Bool)

(assert (=> b!743244 (=> res!500486 e!415255)))

(declare-datatypes ((array!41544 0))(
  ( (array!41545 (arr!19886 (Array (_ BitVec 32) (_ BitVec 64))) (size!20307 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41544)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7483 0))(
  ( (MissingZero!7483 (index!32300 (_ BitVec 32))) (Found!7483 (index!32301 (_ BitVec 32))) (Intermediate!7483 (undefined!8295 Bool) (index!32302 (_ BitVec 32)) (x!63276 (_ BitVec 32))) (Undefined!7483) (MissingVacant!7483 (index!32303 (_ BitVec 32))) )
))
(declare-fun lt!330034 () SeekEntryResult!7483)

(assert (=> b!743244 (= res!500486 (or (not (= (select (store (arr!19886 a!3186) i!1173 k0!2102) index!1321) lt!330035)) (undefined!8295 lt!330034)))))

(declare-fun b!743245 () Bool)

(declare-fun res!500476 () Bool)

(assert (=> b!743245 (=> res!500476 e!415255)))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!743245 (= res!500476 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!743246 () Bool)

(declare-fun e!415253 () Bool)

(declare-fun e!415254 () Bool)

(assert (=> b!743246 (= e!415253 e!415254)))

(declare-fun res!500473 () Bool)

(assert (=> b!743246 (=> (not res!500473) (not e!415254))))

(declare-fun lt!330041 () SeekEntryResult!7483)

(assert (=> b!743246 (= res!500473 (= lt!330041 lt!330034))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!330037 () array!41544)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41544 (_ BitVec 32)) SeekEntryResult!7483)

(assert (=> b!743246 (= lt!330034 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330035 lt!330037 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743246 (= lt!330041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330035 mask!3328) lt!330035 lt!330037 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!743246 (= lt!330035 (select (store (arr!19886 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743246 (= lt!330037 (array!41545 (store (arr!19886 a!3186) i!1173 k0!2102) (size!20307 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!415249 () Bool)

(declare-fun b!743247 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41544 (_ BitVec 32)) SeekEntryResult!7483)

(assert (=> b!743247 (= e!415249 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19886 a!3186) j!159) a!3186 mask!3328) (Found!7483 j!159)))))

(declare-fun res!500487 () Bool)

(declare-fun e!415250 () Bool)

(assert (=> start!65354 (=> (not res!500487) (not e!415250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65354 (= res!500487 (validMask!0 mask!3328))))

(assert (=> start!65354 e!415250))

(assert (=> start!65354 true))

(declare-fun array_inv!15769 (array!41544) Bool)

(assert (=> start!65354 (array_inv!15769 a!3186)))

(declare-fun b!743248 () Bool)

(declare-fun res!500480 () Bool)

(assert (=> b!743248 (=> (not res!500480) (not e!415253))))

(assert (=> b!743248 (= res!500480 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19886 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!415252 () Bool)

(declare-fun lt!330039 () SeekEntryResult!7483)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!743249 () Bool)

(assert (=> b!743249 (= e!415252 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19886 a!3186) j!159) a!3186 mask!3328) lt!330039))))

(declare-fun b!743250 () Bool)

(declare-fun res!500482 () Bool)

(declare-fun e!415247 () Bool)

(assert (=> b!743250 (=> (not res!500482) (not e!415247))))

(assert (=> b!743250 (= res!500482 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20307 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20307 a!3186))))))

(declare-fun b!743251 () Bool)

(declare-fun res!500485 () Bool)

(assert (=> b!743251 (=> (not res!500485) (not e!415250))))

(assert (=> b!743251 (= res!500485 (validKeyInArray!0 (select (arr!19886 a!3186) j!159)))))

(declare-fun b!743252 () Bool)

(declare-fun res!500475 () Bool)

(assert (=> b!743252 (=> (not res!500475) (not e!415250))))

(declare-fun arrayContainsKey!0 (array!41544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743252 (= res!500475 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743253 () Bool)

(assert (=> b!743253 (= e!415247 e!415253)))

(declare-fun res!500468 () Bool)

(assert (=> b!743253 (=> (not res!500468) (not e!415253))))

(declare-fun lt!330038 () SeekEntryResult!7483)

(assert (=> b!743253 (= res!500468 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19886 a!3186) j!159) mask!3328) (select (arr!19886 a!3186) j!159) a!3186 mask!3328) lt!330038))))

(assert (=> b!743253 (= lt!330038 (Intermediate!7483 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743254 () Bool)

(assert (=> b!743254 (= e!415249 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19886 a!3186) j!159) a!3186 mask!3328) lt!330038))))

(declare-fun b!743255 () Bool)

(assert (=> b!743255 (= e!415250 e!415247)))

(declare-fun res!500479 () Bool)

(assert (=> b!743255 (=> (not res!500479) (not e!415247))))

(declare-fun lt!330036 () SeekEntryResult!7483)

(assert (=> b!743255 (= res!500479 (or (= lt!330036 (MissingZero!7483 i!1173)) (= lt!330036 (MissingVacant!7483 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41544 (_ BitVec 32)) SeekEntryResult!7483)

(assert (=> b!743255 (= lt!330036 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743256 () Bool)

(declare-fun res!500484 () Bool)

(assert (=> b!743256 (=> res!500484 e!415255)))

(assert (=> b!743256 (= res!500484 (not (= (seekEntryOrOpen!0 lt!330035 lt!330037 mask!3328) (Found!7483 index!1321))))))

(declare-fun b!743257 () Bool)

(assert (=> b!743257 (= e!415254 (not e!415255))))

(declare-fun res!500477 () Bool)

(assert (=> b!743257 (=> res!500477 e!415255)))

(get-info :version)

(assert (=> b!743257 (= res!500477 (or (not ((_ is Intermediate!7483) lt!330034)) (bvslt x!1131 (x!63276 lt!330034)) (not (= x!1131 (x!63276 lt!330034))) (not (= index!1321 (index!32302 lt!330034)))))))

(declare-fun e!415248 () Bool)

(assert (=> b!743257 e!415248))

(declare-fun res!500472 () Bool)

(assert (=> b!743257 (=> (not res!500472) (not e!415248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41544 (_ BitVec 32)) Bool)

(assert (=> b!743257 (= res!500472 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25418 0))(
  ( (Unit!25419) )
))
(declare-fun lt!330040 () Unit!25418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25418)

(assert (=> b!743257 (= lt!330040 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743258 () Bool)

(declare-fun res!500469 () Bool)

(assert (=> b!743258 (=> res!500469 e!415255)))

(assert (=> b!743258 (= res!500469 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19886 a!3186) j!159) a!3186 mask!3328) (Found!7483 j!159))))))

(declare-fun b!743259 () Bool)

(declare-fun res!500481 () Bool)

(assert (=> b!743259 (=> (not res!500481) (not e!415247))))

(assert (=> b!743259 (= res!500481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743260 () Bool)

(assert (=> b!743260 (= e!415248 e!415252)))

(declare-fun res!500483 () Bool)

(assert (=> b!743260 (=> (not res!500483) (not e!415252))))

(assert (=> b!743260 (= res!500483 (= (seekEntryOrOpen!0 (select (arr!19886 a!3186) j!159) a!3186 mask!3328) lt!330039))))

(assert (=> b!743260 (= lt!330039 (Found!7483 j!159))))

(declare-fun b!743261 () Bool)

(declare-fun res!500470 () Bool)

(assert (=> b!743261 (=> (not res!500470) (not e!415253))))

(assert (=> b!743261 (= res!500470 e!415249)))

(declare-fun c!81768 () Bool)

(assert (=> b!743261 (= c!81768 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743262 () Bool)

(declare-fun res!500471 () Bool)

(assert (=> b!743262 (=> (not res!500471) (not e!415250))))

(assert (=> b!743262 (= res!500471 (and (= (size!20307 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20307 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20307 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743263 () Bool)

(declare-fun res!500474 () Bool)

(assert (=> b!743263 (=> (not res!500474) (not e!415247))))

(declare-datatypes ((List!13927 0))(
  ( (Nil!13924) (Cons!13923 (h!14995 (_ BitVec 64)) (t!20233 List!13927)) )
))
(declare-fun arrayNoDuplicates!0 (array!41544 (_ BitVec 32) List!13927) Bool)

(assert (=> b!743263 (= res!500474 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13924))))

(declare-fun b!743264 () Bool)

(declare-fun res!500478 () Bool)

(assert (=> b!743264 (=> (not res!500478) (not e!415250))))

(assert (=> b!743264 (= res!500478 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65354 res!500487) b!743262))

(assert (= (and b!743262 res!500471) b!743251))

(assert (= (and b!743251 res!500485) b!743264))

(assert (= (and b!743264 res!500478) b!743252))

(assert (= (and b!743252 res!500475) b!743255))

(assert (= (and b!743255 res!500479) b!743259))

(assert (= (and b!743259 res!500481) b!743263))

(assert (= (and b!743263 res!500474) b!743250))

(assert (= (and b!743250 res!500482) b!743253))

(assert (= (and b!743253 res!500468) b!743248))

(assert (= (and b!743248 res!500480) b!743261))

(assert (= (and b!743261 c!81768) b!743254))

(assert (= (and b!743261 (not c!81768)) b!743247))

(assert (= (and b!743261 res!500470) b!743246))

(assert (= (and b!743246 res!500473) b!743257))

(assert (= (and b!743257 res!500472) b!743260))

(assert (= (and b!743260 res!500483) b!743249))

(assert (= (and b!743257 (not res!500477)) b!743258))

(assert (= (and b!743258 (not res!500469)) b!743244))

(assert (= (and b!743244 (not res!500486)) b!743256))

(assert (= (and b!743256 (not res!500484)) b!743245))

(assert (= (and b!743245 (not res!500476)) b!743243))

(declare-fun m!693413 () Bool)

(assert (=> b!743255 m!693413))

(declare-fun m!693415 () Bool)

(assert (=> b!743258 m!693415))

(assert (=> b!743258 m!693415))

(declare-fun m!693417 () Bool)

(assert (=> b!743258 m!693417))

(declare-fun m!693419 () Bool)

(assert (=> b!743248 m!693419))

(declare-fun m!693421 () Bool)

(assert (=> b!743259 m!693421))

(assert (=> b!743249 m!693415))

(assert (=> b!743249 m!693415))

(declare-fun m!693423 () Bool)

(assert (=> b!743249 m!693423))

(declare-fun m!693425 () Bool)

(assert (=> b!743264 m!693425))

(assert (=> b!743254 m!693415))

(assert (=> b!743254 m!693415))

(declare-fun m!693427 () Bool)

(assert (=> b!743254 m!693427))

(declare-fun m!693429 () Bool)

(assert (=> b!743243 m!693429))

(declare-fun m!693431 () Bool)

(assert (=> b!743246 m!693431))

(declare-fun m!693433 () Bool)

(assert (=> b!743246 m!693433))

(assert (=> b!743246 m!693431))

(declare-fun m!693435 () Bool)

(assert (=> b!743246 m!693435))

(declare-fun m!693437 () Bool)

(assert (=> b!743246 m!693437))

(declare-fun m!693439 () Bool)

(assert (=> b!743246 m!693439))

(declare-fun m!693441 () Bool)

(assert (=> b!743256 m!693441))

(declare-fun m!693443 () Bool)

(assert (=> start!65354 m!693443))

(declare-fun m!693445 () Bool)

(assert (=> start!65354 m!693445))

(assert (=> b!743253 m!693415))

(assert (=> b!743253 m!693415))

(declare-fun m!693447 () Bool)

(assert (=> b!743253 m!693447))

(assert (=> b!743253 m!693447))

(assert (=> b!743253 m!693415))

(declare-fun m!693449 () Bool)

(assert (=> b!743253 m!693449))

(assert (=> b!743251 m!693415))

(assert (=> b!743251 m!693415))

(declare-fun m!693451 () Bool)

(assert (=> b!743251 m!693451))

(declare-fun m!693453 () Bool)

(assert (=> b!743257 m!693453))

(declare-fun m!693455 () Bool)

(assert (=> b!743257 m!693455))

(assert (=> b!743260 m!693415))

(assert (=> b!743260 m!693415))

(declare-fun m!693457 () Bool)

(assert (=> b!743260 m!693457))

(assert (=> b!743247 m!693415))

(assert (=> b!743247 m!693415))

(assert (=> b!743247 m!693417))

(declare-fun m!693459 () Bool)

(assert (=> b!743252 m!693459))

(declare-fun m!693461 () Bool)

(assert (=> b!743263 m!693461))

(assert (=> b!743244 m!693437))

(declare-fun m!693463 () Bool)

(assert (=> b!743244 m!693463))

(check-sat (not b!743257) (not b!743243) (not b!743253) (not b!743252) (not start!65354) (not b!743258) (not b!743263) (not b!743264) (not b!743259) (not b!743256) (not b!743255) (not b!743246) (not b!743247) (not b!743249) (not b!743260) (not b!743251) (not b!743254))
(check-sat)
