; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64866 () Bool)

(assert start!64866)

(declare-fun b!731431 () Bool)

(declare-fun res!491263 () Bool)

(declare-fun e!409366 () Bool)

(assert (=> b!731431 (=> (not res!491263) (not e!409366))))

(declare-datatypes ((array!41185 0))(
  ( (array!41186 (arr!19708 (Array (_ BitVec 32) (_ BitVec 64))) (size!20128 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41185)

(declare-datatypes ((List!13617 0))(
  ( (Nil!13614) (Cons!13613 (h!14679 (_ BitVec 64)) (t!19924 List!13617)) )
))
(declare-fun arrayNoDuplicates!0 (array!41185 (_ BitVec 32) List!13617) Bool)

(assert (=> b!731431 (= res!491263 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13614))))

(declare-fun b!731432 () Bool)

(declare-fun e!409372 () Bool)

(declare-fun e!409370 () Bool)

(assert (=> b!731432 (= e!409372 e!409370)))

(declare-fun res!491262 () Bool)

(assert (=> b!731432 (=> res!491262 e!409370)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731432 (= res!491262 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!324103 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731432 (= lt!324103 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!731433 () Bool)

(declare-fun res!491267 () Bool)

(declare-fun e!409367 () Bool)

(assert (=> b!731433 (=> (not res!491267) (not e!409367))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731433 (= res!491267 (validKeyInArray!0 (select (arr!19708 a!3186) j!159)))))

(declare-fun b!731434 () Bool)

(declare-fun res!491257 () Bool)

(declare-fun e!409369 () Bool)

(assert (=> b!731434 (=> (not res!491257) (not e!409369))))

(declare-fun e!409371 () Bool)

(assert (=> b!731434 (= res!491257 e!409371)))

(declare-fun c!80465 () Bool)

(assert (=> b!731434 (= c!80465 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731435 () Bool)

(declare-fun res!491272 () Bool)

(assert (=> b!731435 (=> (not res!491272) (not e!409367))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!731435 (= res!491272 (validKeyInArray!0 k0!2102))))

(declare-fun b!731436 () Bool)

(declare-fun res!491271 () Bool)

(assert (=> b!731436 (=> (not res!491271) (not e!409367))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!731436 (= res!491271 (and (= (size!20128 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20128 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20128 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!491260 () Bool)

(assert (=> start!64866 (=> (not res!491260) (not e!409367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64866 (= res!491260 (validMask!0 mask!3328))))

(assert (=> start!64866 e!409367))

(assert (=> start!64866 true))

(declare-fun array_inv!15567 (array!41185) Bool)

(assert (=> start!64866 (array_inv!15567 a!3186)))

(declare-fun b!731437 () Bool)

(assert (=> b!731437 (= e!409366 e!409369)))

(declare-fun res!491259 () Bool)

(assert (=> b!731437 (=> (not res!491259) (not e!409369))))

(declare-datatypes ((SeekEntryResult!7264 0))(
  ( (MissingZero!7264 (index!31424 (_ BitVec 32))) (Found!7264 (index!31425 (_ BitVec 32))) (Intermediate!7264 (undefined!8076 Bool) (index!31426 (_ BitVec 32)) (x!62562 (_ BitVec 32))) (Undefined!7264) (MissingVacant!7264 (index!31427 (_ BitVec 32))) )
))
(declare-fun lt!324108 () SeekEntryResult!7264)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41185 (_ BitVec 32)) SeekEntryResult!7264)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731437 (= res!491259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19708 a!3186) j!159) mask!3328) (select (arr!19708 a!3186) j!159) a!3186 mask!3328) lt!324108))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!731437 (= lt!324108 (Intermediate!7264 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!324099 () SeekEntryResult!7264)

(declare-fun b!731438 () Bool)

(declare-fun e!409374 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41185 (_ BitVec 32)) SeekEntryResult!7264)

(assert (=> b!731438 (= e!409374 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19708 a!3186) j!159) a!3186 mask!3328) lt!324099))))

(declare-fun b!731439 () Bool)

(assert (=> b!731439 (= e!409371 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19708 a!3186) j!159) a!3186 mask!3328) (Found!7264 j!159)))))

(declare-fun b!731440 () Bool)

(declare-fun e!409365 () Bool)

(assert (=> b!731440 (= e!409369 e!409365)))

(declare-fun res!491256 () Bool)

(assert (=> b!731440 (=> (not res!491256) (not e!409365))))

(declare-fun lt!324107 () SeekEntryResult!7264)

(declare-fun lt!324101 () SeekEntryResult!7264)

(assert (=> b!731440 (= res!491256 (= lt!324107 lt!324101))))

(declare-fun lt!324106 () array!41185)

(declare-fun lt!324100 () (_ BitVec 64))

(assert (=> b!731440 (= lt!324101 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324100 lt!324106 mask!3328))))

(assert (=> b!731440 (= lt!324107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324100 mask!3328) lt!324100 lt!324106 mask!3328))))

(assert (=> b!731440 (= lt!324100 (select (store (arr!19708 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!731440 (= lt!324106 (array!41186 (store (arr!19708 a!3186) i!1173 k0!2102) (size!20128 a!3186)))))

(declare-fun b!731441 () Bool)

(assert (=> b!731441 (= e!409365 (not e!409372))))

(declare-fun res!491268 () Bool)

(assert (=> b!731441 (=> res!491268 e!409372)))

(get-info :version)

(assert (=> b!731441 (= res!491268 (or (not ((_ is Intermediate!7264) lt!324101)) (bvsge x!1131 (x!62562 lt!324101))))))

(declare-fun e!409368 () Bool)

(assert (=> b!731441 e!409368))

(declare-fun res!491261 () Bool)

(assert (=> b!731441 (=> (not res!491261) (not e!409368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41185 (_ BitVec 32)) Bool)

(assert (=> b!731441 (= res!491261 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24925 0))(
  ( (Unit!24926) )
))
(declare-fun lt!324105 () Unit!24925)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24925)

(assert (=> b!731441 (= lt!324105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731442 () Bool)

(declare-fun res!491264 () Bool)

(assert (=> b!731442 (=> (not res!491264) (not e!409369))))

(assert (=> b!731442 (= res!491264 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19708 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731443 () Bool)

(assert (=> b!731443 (= e!409367 e!409366)))

(declare-fun res!491258 () Bool)

(assert (=> b!731443 (=> (not res!491258) (not e!409366))))

(declare-fun lt!324104 () SeekEntryResult!7264)

(assert (=> b!731443 (= res!491258 (or (= lt!324104 (MissingZero!7264 i!1173)) (= lt!324104 (MissingVacant!7264 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41185 (_ BitVec 32)) SeekEntryResult!7264)

(assert (=> b!731443 (= lt!324104 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!731444 () Bool)

(assert (=> b!731444 (= e!409371 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19708 a!3186) j!159) a!3186 mask!3328) lt!324108))))

(declare-fun b!731445 () Bool)

(assert (=> b!731445 (= e!409368 e!409374)))

(declare-fun res!491269 () Bool)

(assert (=> b!731445 (=> (not res!491269) (not e!409374))))

(assert (=> b!731445 (= res!491269 (= (seekEntryOrOpen!0 (select (arr!19708 a!3186) j!159) a!3186 mask!3328) lt!324099))))

(assert (=> b!731445 (= lt!324099 (Found!7264 j!159))))

(declare-fun b!731446 () Bool)

(assert (=> b!731446 (= e!409370 true)))

(declare-fun lt!324102 () SeekEntryResult!7264)

(assert (=> b!731446 (= lt!324102 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19708 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731447 () Bool)

(declare-fun res!491266 () Bool)

(assert (=> b!731447 (=> (not res!491266) (not e!409367))))

(declare-fun arrayContainsKey!0 (array!41185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731447 (= res!491266 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731448 () Bool)

(declare-fun res!491270 () Bool)

(assert (=> b!731448 (=> (not res!491270) (not e!409366))))

(assert (=> b!731448 (= res!491270 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20128 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20128 a!3186))))))

(declare-fun b!731449 () Bool)

(declare-fun res!491265 () Bool)

(assert (=> b!731449 (=> (not res!491265) (not e!409366))))

(assert (=> b!731449 (= res!491265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64866 res!491260) b!731436))

(assert (= (and b!731436 res!491271) b!731433))

(assert (= (and b!731433 res!491267) b!731435))

(assert (= (and b!731435 res!491272) b!731447))

(assert (= (and b!731447 res!491266) b!731443))

(assert (= (and b!731443 res!491258) b!731449))

(assert (= (and b!731449 res!491265) b!731431))

(assert (= (and b!731431 res!491263) b!731448))

(assert (= (and b!731448 res!491270) b!731437))

(assert (= (and b!731437 res!491259) b!731442))

(assert (= (and b!731442 res!491264) b!731434))

(assert (= (and b!731434 c!80465) b!731444))

(assert (= (and b!731434 (not c!80465)) b!731439))

(assert (= (and b!731434 res!491257) b!731440))

(assert (= (and b!731440 res!491256) b!731441))

(assert (= (and b!731441 res!491261) b!731445))

(assert (= (and b!731445 res!491269) b!731438))

(assert (= (and b!731441 (not res!491268)) b!731432))

(assert (= (and b!731432 (not res!491262)) b!731446))

(declare-fun m!685323 () Bool)

(assert (=> b!731447 m!685323))

(declare-fun m!685325 () Bool)

(assert (=> b!731437 m!685325))

(assert (=> b!731437 m!685325))

(declare-fun m!685327 () Bool)

(assert (=> b!731437 m!685327))

(assert (=> b!731437 m!685327))

(assert (=> b!731437 m!685325))

(declare-fun m!685329 () Bool)

(assert (=> b!731437 m!685329))

(assert (=> b!731444 m!685325))

(assert (=> b!731444 m!685325))

(declare-fun m!685331 () Bool)

(assert (=> b!731444 m!685331))

(declare-fun m!685333 () Bool)

(assert (=> b!731435 m!685333))

(declare-fun m!685335 () Bool)

(assert (=> b!731431 m!685335))

(assert (=> b!731438 m!685325))

(assert (=> b!731438 m!685325))

(declare-fun m!685337 () Bool)

(assert (=> b!731438 m!685337))

(declare-fun m!685339 () Bool)

(assert (=> start!64866 m!685339))

(declare-fun m!685341 () Bool)

(assert (=> start!64866 m!685341))

(declare-fun m!685343 () Bool)

(assert (=> b!731441 m!685343))

(declare-fun m!685345 () Bool)

(assert (=> b!731441 m!685345))

(assert (=> b!731439 m!685325))

(assert (=> b!731439 m!685325))

(declare-fun m!685347 () Bool)

(assert (=> b!731439 m!685347))

(declare-fun m!685349 () Bool)

(assert (=> b!731449 m!685349))

(assert (=> b!731433 m!685325))

(assert (=> b!731433 m!685325))

(declare-fun m!685351 () Bool)

(assert (=> b!731433 m!685351))

(assert (=> b!731446 m!685325))

(assert (=> b!731446 m!685325))

(assert (=> b!731446 m!685347))

(declare-fun m!685353 () Bool)

(assert (=> b!731432 m!685353))

(declare-fun m!685355 () Bool)

(assert (=> b!731442 m!685355))

(assert (=> b!731445 m!685325))

(assert (=> b!731445 m!685325))

(declare-fun m!685357 () Bool)

(assert (=> b!731445 m!685357))

(declare-fun m!685359 () Bool)

(assert (=> b!731440 m!685359))

(declare-fun m!685361 () Bool)

(assert (=> b!731440 m!685361))

(declare-fun m!685363 () Bool)

(assert (=> b!731440 m!685363))

(declare-fun m!685365 () Bool)

(assert (=> b!731440 m!685365))

(assert (=> b!731440 m!685363))

(declare-fun m!685367 () Bool)

(assert (=> b!731440 m!685367))

(declare-fun m!685369 () Bool)

(assert (=> b!731443 m!685369))

(check-sat (not b!731449) (not b!731431) (not b!731440) (not b!731439) (not b!731443) (not b!731445) (not b!731438) (not b!731446) (not b!731444) (not start!64866) (not b!731435) (not b!731447) (not b!731433) (not b!731432) (not b!731441) (not b!731437))
(check-sat)
