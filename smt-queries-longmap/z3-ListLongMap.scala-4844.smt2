; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66764 () Bool)

(assert start!66764)

(declare-fun b!769316 () Bool)

(declare-fun e!428393 () Bool)

(declare-fun e!428394 () Bool)

(assert (=> b!769316 (= e!428393 e!428394)))

(declare-fun res!520261 () Bool)

(assert (=> b!769316 (=> (not res!520261) (not e!428394))))

(declare-datatypes ((SeekEntryResult!7863 0))(
  ( (MissingZero!7863 (index!33820 (_ BitVec 32))) (Found!7863 (index!33821 (_ BitVec 32))) (Intermediate!7863 (undefined!8675 Bool) (index!33822 (_ BitVec 32)) (x!64754 (_ BitVec 32))) (Undefined!7863) (MissingVacant!7863 (index!33823 (_ BitVec 32))) )
))
(declare-fun lt!342277 () SeekEntryResult!7863)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769316 (= res!520261 (or (= lt!342277 (MissingZero!7863 i!1173)) (= lt!342277 (MissingVacant!7863 i!1173))))))

(declare-datatypes ((array!42326 0))(
  ( (array!42327 (arr!20263 (Array (_ BitVec 32) (_ BitVec 64))) (size!20684 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42326)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42326 (_ BitVec 32)) SeekEntryResult!7863)

(assert (=> b!769316 (= lt!342277 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769317 () Bool)

(declare-fun res!520260 () Bool)

(assert (=> b!769317 (=> (not res!520260) (not e!428393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769317 (= res!520260 (validKeyInArray!0 k0!2102))))

(declare-fun b!769318 () Bool)

(declare-fun res!520265 () Bool)

(assert (=> b!769318 (=> (not res!520265) (not e!428393))))

(declare-fun arrayContainsKey!0 (array!42326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769318 (= res!520265 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769319 () Bool)

(declare-fun res!520262 () Bool)

(assert (=> b!769319 (=> (not res!520262) (not e!428394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42326 (_ BitVec 32)) Bool)

(assert (=> b!769319 (= res!520262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769320 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342285 () SeekEntryResult!7863)

(declare-fun e!428395 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42326 (_ BitVec 32)) SeekEntryResult!7863)

(assert (=> b!769320 (= e!428395 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) lt!342285))))

(declare-fun b!769321 () Bool)

(declare-fun res!520253 () Bool)

(assert (=> b!769321 (=> (not res!520253) (not e!428393))))

(assert (=> b!769321 (= res!520253 (and (= (size!20684 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20684 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20684 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!428399 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!769322 () Bool)

(declare-fun lt!342278 () SeekEntryResult!7863)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42326 (_ BitVec 32)) SeekEntryResult!7863)

(assert (=> b!769322 (= e!428399 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) lt!342278))))

(declare-fun b!769323 () Bool)

(declare-fun e!428391 () Bool)

(declare-fun e!428397 () Bool)

(assert (=> b!769323 (= e!428391 (not e!428397))))

(declare-fun res!520263 () Bool)

(assert (=> b!769323 (=> res!520263 e!428397)))

(declare-fun lt!342286 () SeekEntryResult!7863)

(get-info :version)

(assert (=> b!769323 (= res!520263 (or (not ((_ is Intermediate!7863) lt!342286)) (bvsge x!1131 (x!64754 lt!342286))))))

(declare-fun e!428390 () Bool)

(assert (=> b!769323 e!428390))

(declare-fun res!520267 () Bool)

(assert (=> b!769323 (=> (not res!520267) (not e!428390))))

(assert (=> b!769323 (= res!520267 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26466 0))(
  ( (Unit!26467) )
))
(declare-fun lt!342282 () Unit!26466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26466)

(assert (=> b!769323 (= lt!342282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769325 () Bool)

(declare-fun e!428398 () Bool)

(assert (=> b!769325 (= e!428398 e!428391)))

(declare-fun res!520266 () Bool)

(assert (=> b!769325 (=> (not res!520266) (not e!428391))))

(declare-fun lt!342280 () SeekEntryResult!7863)

(assert (=> b!769325 (= res!520266 (= lt!342280 lt!342286))))

(declare-fun lt!342281 () (_ BitVec 64))

(declare-fun lt!342279 () array!42326)

(assert (=> b!769325 (= lt!342286 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342281 lt!342279 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769325 (= lt!342280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342281 mask!3328) lt!342281 lt!342279 mask!3328))))

(assert (=> b!769325 (= lt!342281 (select (store (arr!20263 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769325 (= lt!342279 (array!42327 (store (arr!20263 a!3186) i!1173 k0!2102) (size!20684 a!3186)))))

(declare-fun b!769326 () Bool)

(declare-fun res!520257 () Bool)

(assert (=> b!769326 (=> (not res!520257) (not e!428393))))

(assert (=> b!769326 (= res!520257 (validKeyInArray!0 (select (arr!20263 a!3186) j!159)))))

(declare-fun b!769327 () Bool)

(declare-fun e!428396 () Unit!26466)

(declare-fun Unit!26468 () Unit!26466)

(assert (=> b!769327 (= e!428396 Unit!26468)))

(declare-fun lt!342287 () (_ BitVec 32))

(assert (=> b!769327 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342287 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) lt!342285)))

(declare-fun b!769328 () Bool)

(assert (=> b!769328 (= e!428394 e!428398)))

(declare-fun res!520258 () Bool)

(assert (=> b!769328 (=> (not res!520258) (not e!428398))))

(assert (=> b!769328 (= res!520258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20263 a!3186) j!159) mask!3328) (select (arr!20263 a!3186) j!159) a!3186 mask!3328) lt!342285))))

(assert (=> b!769328 (= lt!342285 (Intermediate!7863 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769329 () Bool)

(declare-fun res!520264 () Bool)

(assert (=> b!769329 (=> (not res!520264) (not e!428394))))

(declare-datatypes ((List!14265 0))(
  ( (Nil!14262) (Cons!14261 (h!15360 (_ BitVec 64)) (t!20580 List!14265)) )
))
(declare-fun arrayNoDuplicates!0 (array!42326 (_ BitVec 32) List!14265) Bool)

(assert (=> b!769329 (= res!520264 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14262))))

(declare-fun b!769330 () Bool)

(assert (=> b!769330 (= e!428395 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) (Found!7863 j!159)))))

(declare-fun b!769331 () Bool)

(declare-fun res!520256 () Bool)

(assert (=> b!769331 (=> (not res!520256) (not e!428398))))

(assert (=> b!769331 (= res!520256 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20263 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769332 () Bool)

(assert (=> b!769332 (= e!428397 true)))

(declare-fun lt!342284 () Unit!26466)

(assert (=> b!769332 (= lt!342284 e!428396)))

(declare-fun c!84927 () Bool)

(assert (=> b!769332 (= c!84927 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769332 (= lt!342287 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769333 () Bool)

(declare-fun Unit!26469 () Unit!26466)

(assert (=> b!769333 (= e!428396 Unit!26469)))

(declare-fun lt!342283 () SeekEntryResult!7863)

(assert (=> b!769333 (= lt!342283 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20263 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769333 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342287 resIntermediateIndex!5 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) (Found!7863 j!159))))

(declare-fun b!769334 () Bool)

(declare-fun res!520259 () Bool)

(assert (=> b!769334 (=> (not res!520259) (not e!428394))))

(assert (=> b!769334 (= res!520259 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20684 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20684 a!3186))))))

(declare-fun b!769335 () Bool)

(assert (=> b!769335 (= e!428390 e!428399)))

(declare-fun res!520254 () Bool)

(assert (=> b!769335 (=> (not res!520254) (not e!428399))))

(assert (=> b!769335 (= res!520254 (= (seekEntryOrOpen!0 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) lt!342278))))

(assert (=> b!769335 (= lt!342278 (Found!7863 j!159))))

(declare-fun res!520268 () Bool)

(assert (=> start!66764 (=> (not res!520268) (not e!428393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66764 (= res!520268 (validMask!0 mask!3328))))

(assert (=> start!66764 e!428393))

(assert (=> start!66764 true))

(declare-fun array_inv!16059 (array!42326) Bool)

(assert (=> start!66764 (array_inv!16059 a!3186)))

(declare-fun b!769324 () Bool)

(declare-fun res!520255 () Bool)

(assert (=> b!769324 (=> (not res!520255) (not e!428398))))

(assert (=> b!769324 (= res!520255 e!428395)))

(declare-fun c!84928 () Bool)

(assert (=> b!769324 (= c!84928 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66764 res!520268) b!769321))

(assert (= (and b!769321 res!520253) b!769326))

(assert (= (and b!769326 res!520257) b!769317))

(assert (= (and b!769317 res!520260) b!769318))

(assert (= (and b!769318 res!520265) b!769316))

(assert (= (and b!769316 res!520261) b!769319))

(assert (= (and b!769319 res!520262) b!769329))

(assert (= (and b!769329 res!520264) b!769334))

(assert (= (and b!769334 res!520259) b!769328))

(assert (= (and b!769328 res!520258) b!769331))

(assert (= (and b!769331 res!520256) b!769324))

(assert (= (and b!769324 c!84928) b!769320))

(assert (= (and b!769324 (not c!84928)) b!769330))

(assert (= (and b!769324 res!520255) b!769325))

(assert (= (and b!769325 res!520266) b!769323))

(assert (= (and b!769323 res!520267) b!769335))

(assert (= (and b!769335 res!520254) b!769322))

(assert (= (and b!769323 (not res!520263)) b!769332))

(assert (= (and b!769332 c!84927) b!769327))

(assert (= (and b!769332 (not c!84927)) b!769333))

(declare-fun m!714747 () Bool)

(assert (=> b!769329 m!714747))

(declare-fun m!714749 () Bool)

(assert (=> b!769327 m!714749))

(assert (=> b!769327 m!714749))

(declare-fun m!714751 () Bool)

(assert (=> b!769327 m!714751))

(assert (=> b!769326 m!714749))

(assert (=> b!769326 m!714749))

(declare-fun m!714753 () Bool)

(assert (=> b!769326 m!714753))

(declare-fun m!714755 () Bool)

(assert (=> b!769323 m!714755))

(declare-fun m!714757 () Bool)

(assert (=> b!769323 m!714757))

(declare-fun m!714759 () Bool)

(assert (=> b!769316 m!714759))

(assert (=> b!769322 m!714749))

(assert (=> b!769322 m!714749))

(declare-fun m!714761 () Bool)

(assert (=> b!769322 m!714761))

(assert (=> b!769333 m!714749))

(assert (=> b!769333 m!714749))

(declare-fun m!714763 () Bool)

(assert (=> b!769333 m!714763))

(assert (=> b!769333 m!714749))

(declare-fun m!714765 () Bool)

(assert (=> b!769333 m!714765))

(declare-fun m!714767 () Bool)

(assert (=> b!769319 m!714767))

(assert (=> b!769320 m!714749))

(assert (=> b!769320 m!714749))

(declare-fun m!714769 () Bool)

(assert (=> b!769320 m!714769))

(declare-fun m!714771 () Bool)

(assert (=> b!769325 m!714771))

(declare-fun m!714773 () Bool)

(assert (=> b!769325 m!714773))

(declare-fun m!714775 () Bool)

(assert (=> b!769325 m!714775))

(assert (=> b!769325 m!714773))

(declare-fun m!714777 () Bool)

(assert (=> b!769325 m!714777))

(declare-fun m!714779 () Bool)

(assert (=> b!769325 m!714779))

(assert (=> b!769328 m!714749))

(assert (=> b!769328 m!714749))

(declare-fun m!714781 () Bool)

(assert (=> b!769328 m!714781))

(assert (=> b!769328 m!714781))

(assert (=> b!769328 m!714749))

(declare-fun m!714783 () Bool)

(assert (=> b!769328 m!714783))

(assert (=> b!769335 m!714749))

(assert (=> b!769335 m!714749))

(declare-fun m!714785 () Bool)

(assert (=> b!769335 m!714785))

(declare-fun m!714787 () Bool)

(assert (=> b!769318 m!714787))

(declare-fun m!714789 () Bool)

(assert (=> start!66764 m!714789))

(declare-fun m!714791 () Bool)

(assert (=> start!66764 m!714791))

(assert (=> b!769330 m!714749))

(assert (=> b!769330 m!714749))

(assert (=> b!769330 m!714763))

(declare-fun m!714793 () Bool)

(assert (=> b!769331 m!714793))

(declare-fun m!714795 () Bool)

(assert (=> b!769332 m!714795))

(declare-fun m!714797 () Bool)

(assert (=> b!769317 m!714797))

(check-sat (not b!769322) (not b!769332) (not b!769318) (not b!769330) (not b!769316) (not b!769317) (not b!769323) (not b!769333) (not b!769328) (not b!769325) (not b!769326) (not start!66764) (not b!769329) (not b!769327) (not b!769320) (not b!769335) (not b!769319))
(check-sat)
