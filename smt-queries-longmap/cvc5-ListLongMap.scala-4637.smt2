; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64522 () Bool)

(assert start!64522)

(declare-fun b!726395 () Bool)

(declare-fun res!487392 () Bool)

(declare-fun e!406712 () Bool)

(assert (=> b!726395 (=> (not res!487392) (not e!406712))))

(declare-datatypes ((array!41040 0))(
  ( (array!41041 (arr!19641 (Array (_ BitVec 32) (_ BitVec 64))) (size!20062 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41040)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41040 (_ BitVec 32)) Bool)

(assert (=> b!726395 (= res!487392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726396 () Bool)

(declare-fun res!487384 () Bool)

(declare-fun e!406710 () Bool)

(assert (=> b!726396 (=> (not res!487384) (not e!406710))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726396 (= res!487384 (validKeyInArray!0 k!2102))))

(declare-fun res!487394 () Bool)

(assert (=> start!64522 (=> (not res!487394) (not e!406710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64522 (= res!487394 (validMask!0 mask!3328))))

(assert (=> start!64522 e!406710))

(assert (=> start!64522 true))

(declare-fun array_inv!15437 (array!41040) Bool)

(assert (=> start!64522 (array_inv!15437 a!3186)))

(declare-fun b!726397 () Bool)

(declare-fun res!487386 () Bool)

(assert (=> b!726397 (=> (not res!487386) (not e!406712))))

(declare-datatypes ((List!13643 0))(
  ( (Nil!13640) (Cons!13639 (h!14696 (_ BitVec 64)) (t!19958 List!13643)) )
))
(declare-fun arrayNoDuplicates!0 (array!41040 (_ BitVec 32) List!13643) Bool)

(assert (=> b!726397 (= res!487386 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13640))))

(declare-fun b!726398 () Bool)

(declare-fun res!487389 () Bool)

(declare-fun e!406705 () Bool)

(assert (=> b!726398 (=> (not res!487389) (not e!406705))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!726398 (= res!487389 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19641 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726399 () Bool)

(assert (=> b!726399 (= e!406712 e!406705)))

(declare-fun res!487390 () Bool)

(assert (=> b!726399 (=> (not res!487390) (not e!406705))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7241 0))(
  ( (MissingZero!7241 (index!31332 (_ BitVec 32))) (Found!7241 (index!31333 (_ BitVec 32))) (Intermediate!7241 (undefined!8053 Bool) (index!31334 (_ BitVec 32)) (x!62323 (_ BitVec 32))) (Undefined!7241) (MissingVacant!7241 (index!31335 (_ BitVec 32))) )
))
(declare-fun lt!321702 () SeekEntryResult!7241)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41040 (_ BitVec 32)) SeekEntryResult!7241)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726399 (= res!487390 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19641 a!3186) j!159) mask!3328) (select (arr!19641 a!3186) j!159) a!3186 mask!3328) lt!321702))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726399 (= lt!321702 (Intermediate!7241 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!406708 () Bool)

(declare-fun b!726400 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!726400 (= e!406708 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19641 a!3186) j!159) a!3186 mask!3328) lt!321702))))

(declare-fun b!726401 () Bool)

(declare-fun res!487396 () Bool)

(assert (=> b!726401 (=> (not res!487396) (not e!406710))))

(assert (=> b!726401 (= res!487396 (and (= (size!20062 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20062 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20062 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726402 () Bool)

(declare-fun e!406707 () Bool)

(declare-fun e!406709 () Bool)

(assert (=> b!726402 (= e!406707 e!406709)))

(declare-fun res!487395 () Bool)

(assert (=> b!726402 (=> (not res!487395) (not e!406709))))

(declare-fun lt!321706 () SeekEntryResult!7241)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41040 (_ BitVec 32)) SeekEntryResult!7241)

(assert (=> b!726402 (= res!487395 (= (seekEntryOrOpen!0 (select (arr!19641 a!3186) j!159) a!3186 mask!3328) lt!321706))))

(assert (=> b!726402 (= lt!321706 (Found!7241 j!159))))

(declare-fun b!726403 () Bool)

(declare-fun res!487387 () Bool)

(assert (=> b!726403 (=> (not res!487387) (not e!406705))))

(assert (=> b!726403 (= res!487387 e!406708)))

(declare-fun c!79879 () Bool)

(assert (=> b!726403 (= c!79879 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726404 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41040 (_ BitVec 32)) SeekEntryResult!7241)

(assert (=> b!726404 (= e!406708 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19641 a!3186) j!159) a!3186 mask!3328) (Found!7241 j!159)))))

(declare-fun b!726405 () Bool)

(declare-fun e!406711 () Bool)

(assert (=> b!726405 (= e!406705 e!406711)))

(declare-fun res!487397 () Bool)

(assert (=> b!726405 (=> (not res!487397) (not e!406711))))

(declare-fun lt!321700 () SeekEntryResult!7241)

(declare-fun lt!321707 () SeekEntryResult!7241)

(assert (=> b!726405 (= res!487397 (= lt!321700 lt!321707))))

(declare-fun lt!321705 () (_ BitVec 64))

(declare-fun lt!321704 () array!41040)

(assert (=> b!726405 (= lt!321707 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321705 lt!321704 mask!3328))))

(assert (=> b!726405 (= lt!321700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321705 mask!3328) lt!321705 lt!321704 mask!3328))))

(assert (=> b!726405 (= lt!321705 (select (store (arr!19641 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726405 (= lt!321704 (array!41041 (store (arr!19641 a!3186) i!1173 k!2102) (size!20062 a!3186)))))

(declare-fun b!726406 () Bool)

(assert (=> b!726406 (= e!406711 (not (or (not (is-Intermediate!7241 lt!321707)) (bvsge x!1131 (x!62323 lt!321707)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!726406 e!406707))

(declare-fun res!487383 () Bool)

(assert (=> b!726406 (=> (not res!487383) (not e!406707))))

(assert (=> b!726406 (= res!487383 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24800 0))(
  ( (Unit!24801) )
))
(declare-fun lt!321703 () Unit!24800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24800)

(assert (=> b!726406 (= lt!321703 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726407 () Bool)

(declare-fun res!487391 () Bool)

(assert (=> b!726407 (=> (not res!487391) (not e!406710))))

(assert (=> b!726407 (= res!487391 (validKeyInArray!0 (select (arr!19641 a!3186) j!159)))))

(declare-fun b!726408 () Bool)

(assert (=> b!726408 (= e!406710 e!406712)))

(declare-fun res!487388 () Bool)

(assert (=> b!726408 (=> (not res!487388) (not e!406712))))

(declare-fun lt!321701 () SeekEntryResult!7241)

(assert (=> b!726408 (= res!487388 (or (= lt!321701 (MissingZero!7241 i!1173)) (= lt!321701 (MissingVacant!7241 i!1173))))))

(assert (=> b!726408 (= lt!321701 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!726409 () Bool)

(assert (=> b!726409 (= e!406709 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19641 a!3186) j!159) a!3186 mask!3328) lt!321706))))

(declare-fun b!726410 () Bool)

(declare-fun res!487393 () Bool)

(assert (=> b!726410 (=> (not res!487393) (not e!406712))))

(assert (=> b!726410 (= res!487393 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20062 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20062 a!3186))))))

(declare-fun b!726411 () Bool)

(declare-fun res!487385 () Bool)

(assert (=> b!726411 (=> (not res!487385) (not e!406710))))

(declare-fun arrayContainsKey!0 (array!41040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726411 (= res!487385 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64522 res!487394) b!726401))

(assert (= (and b!726401 res!487396) b!726407))

(assert (= (and b!726407 res!487391) b!726396))

(assert (= (and b!726396 res!487384) b!726411))

(assert (= (and b!726411 res!487385) b!726408))

(assert (= (and b!726408 res!487388) b!726395))

(assert (= (and b!726395 res!487392) b!726397))

(assert (= (and b!726397 res!487386) b!726410))

(assert (= (and b!726410 res!487393) b!726399))

(assert (= (and b!726399 res!487390) b!726398))

(assert (= (and b!726398 res!487389) b!726403))

(assert (= (and b!726403 c!79879) b!726400))

(assert (= (and b!726403 (not c!79879)) b!726404))

(assert (= (and b!726403 res!487387) b!726405))

(assert (= (and b!726405 res!487397) b!726406))

(assert (= (and b!726406 res!487383) b!726402))

(assert (= (and b!726402 res!487395) b!726409))

(declare-fun m!680461 () Bool)

(assert (=> b!726397 m!680461))

(declare-fun m!680463 () Bool)

(assert (=> b!726395 m!680463))

(declare-fun m!680465 () Bool)

(assert (=> b!726409 m!680465))

(assert (=> b!726409 m!680465))

(declare-fun m!680467 () Bool)

(assert (=> b!726409 m!680467))

(declare-fun m!680469 () Bool)

(assert (=> b!726398 m!680469))

(assert (=> b!726404 m!680465))

(assert (=> b!726404 m!680465))

(declare-fun m!680471 () Bool)

(assert (=> b!726404 m!680471))

(declare-fun m!680473 () Bool)

(assert (=> b!726406 m!680473))

(declare-fun m!680475 () Bool)

(assert (=> b!726406 m!680475))

(assert (=> b!726402 m!680465))

(assert (=> b!726402 m!680465))

(declare-fun m!680477 () Bool)

(assert (=> b!726402 m!680477))

(assert (=> b!726407 m!680465))

(assert (=> b!726407 m!680465))

(declare-fun m!680479 () Bool)

(assert (=> b!726407 m!680479))

(declare-fun m!680481 () Bool)

(assert (=> b!726405 m!680481))

(declare-fun m!680483 () Bool)

(assert (=> b!726405 m!680483))

(assert (=> b!726405 m!680481))

(declare-fun m!680485 () Bool)

(assert (=> b!726405 m!680485))

(declare-fun m!680487 () Bool)

(assert (=> b!726405 m!680487))

(declare-fun m!680489 () Bool)

(assert (=> b!726405 m!680489))

(declare-fun m!680491 () Bool)

(assert (=> b!726411 m!680491))

(assert (=> b!726399 m!680465))

(assert (=> b!726399 m!680465))

(declare-fun m!680493 () Bool)

(assert (=> b!726399 m!680493))

(assert (=> b!726399 m!680493))

(assert (=> b!726399 m!680465))

(declare-fun m!680495 () Bool)

(assert (=> b!726399 m!680495))

(declare-fun m!680497 () Bool)

(assert (=> start!64522 m!680497))

(declare-fun m!680499 () Bool)

(assert (=> start!64522 m!680499))

(declare-fun m!680501 () Bool)

(assert (=> b!726408 m!680501))

(declare-fun m!680503 () Bool)

(assert (=> b!726396 m!680503))

(assert (=> b!726400 m!680465))

(assert (=> b!726400 m!680465))

(declare-fun m!680505 () Bool)

(assert (=> b!726400 m!680505))

(push 1)

(assert (not b!726400))

(assert (not b!726402))

(assert (not b!726408))

(assert (not b!726404))

(assert (not b!726395))

(assert (not b!726405))

(assert (not b!726411))

(assert (not b!726396))

(assert (not b!726397))

(assert (not start!64522))

(assert (not b!726406))

(assert (not b!726399))

(assert (not b!726407))

(assert (not b!726409))

(check-sat)

(pop 1)

(push 1)

(check-sat)

