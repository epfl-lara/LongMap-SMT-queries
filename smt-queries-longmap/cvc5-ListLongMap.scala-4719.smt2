; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65374 () Bool)

(assert start!65374)

(declare-fun b!743493 () Bool)

(declare-fun res!500597 () Bool)

(declare-fun e!415408 () Bool)

(assert (=> b!743493 (=> (not res!500597) (not e!415408))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41547 0))(
  ( (array!41548 (arr!19887 (Array (_ BitVec 32) (_ BitVec 64))) (size!20308 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41547)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743493 (= res!500597 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20308 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20308 a!3186))))))

(declare-fun b!743494 () Bool)

(declare-fun e!415405 () Bool)

(assert (=> b!743494 (= e!415408 e!415405)))

(declare-fun res!500591 () Bool)

(assert (=> b!743494 (=> (not res!500591) (not e!415405))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7487 0))(
  ( (MissingZero!7487 (index!32316 (_ BitVec 32))) (Found!7487 (index!32317 (_ BitVec 32))) (Intermediate!7487 (undefined!8299 Bool) (index!32318 (_ BitVec 32)) (x!63285 (_ BitVec 32))) (Undefined!7487) (MissingVacant!7487 (index!32319 (_ BitVec 32))) )
))
(declare-fun lt!330274 () SeekEntryResult!7487)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41547 (_ BitVec 32)) SeekEntryResult!7487)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743494 (= res!500591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19887 a!3186) j!159) mask!3328) (select (arr!19887 a!3186) j!159) a!3186 mask!3328) lt!330274))))

(assert (=> b!743494 (= lt!330274 (Intermediate!7487 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743495 () Bool)

(declare-fun res!500596 () Bool)

(declare-fun e!415403 () Bool)

(assert (=> b!743495 (=> (not res!500596) (not e!415403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743495 (= res!500596 (validKeyInArray!0 (select (arr!19887 a!3186) j!159)))))

(declare-fun b!743496 () Bool)

(declare-fun res!500594 () Bool)

(assert (=> b!743496 (=> (not res!500594) (not e!415405))))

(declare-fun e!415402 () Bool)

(assert (=> b!743496 (= res!500594 e!415402)))

(declare-fun c!81838 () Bool)

(assert (=> b!743496 (= c!81838 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743497 () Bool)

(declare-fun res!500595 () Bool)

(assert (=> b!743497 (=> (not res!500595) (not e!415403))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743497 (= res!500595 (and (= (size!20308 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20308 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20308 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743498 () Bool)

(declare-fun res!500593 () Bool)

(assert (=> b!743498 (=> (not res!500593) (not e!415405))))

(assert (=> b!743498 (= res!500593 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19887 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743499 () Bool)

(declare-fun res!500584 () Bool)

(declare-fun e!415409 () Bool)

(assert (=> b!743499 (=> res!500584 e!415409)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41547 (_ BitVec 32)) SeekEntryResult!7487)

(assert (=> b!743499 (= res!500584 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19887 a!3186) j!159) a!3186 mask!3328) (Found!7487 j!159))))))

(declare-fun b!743500 () Bool)

(assert (=> b!743500 (= e!415402 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19887 a!3186) j!159) a!3186 mask!3328) (Found!7487 j!159)))))

(declare-fun res!500590 () Bool)

(assert (=> start!65374 (=> (not res!500590) (not e!415403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65374 (= res!500590 (validMask!0 mask!3328))))

(assert (=> start!65374 e!415403))

(assert (=> start!65374 true))

(declare-fun array_inv!15683 (array!41547) Bool)

(assert (=> start!65374 (array_inv!15683 a!3186)))

(declare-fun b!743501 () Bool)

(declare-fun res!500586 () Bool)

(assert (=> b!743501 (=> res!500586 e!415409)))

(declare-fun lt!330277 () (_ BitVec 64))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!330278 () SeekEntryResult!7487)

(assert (=> b!743501 (= res!500586 (or (not (= (select (store (arr!19887 a!3186) i!1173 k!2102) index!1321) lt!330277)) (undefined!8299 lt!330278)))))

(declare-fun b!743502 () Bool)

(declare-fun res!500578 () Bool)

(assert (=> b!743502 (=> res!500578 e!415409)))

(declare-fun lt!330279 () array!41547)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41547 (_ BitVec 32)) SeekEntryResult!7487)

(assert (=> b!743502 (= res!500578 (not (= (seekEntryOrOpen!0 lt!330277 lt!330279 mask!3328) (Found!7487 index!1321))))))

(declare-fun b!743503 () Bool)

(declare-fun res!500582 () Bool)

(assert (=> b!743503 (=> (not res!500582) (not e!415408))))

(declare-datatypes ((List!13889 0))(
  ( (Nil!13886) (Cons!13885 (h!14957 (_ BitVec 64)) (t!20204 List!13889)) )
))
(declare-fun arrayNoDuplicates!0 (array!41547 (_ BitVec 32) List!13889) Bool)

(assert (=> b!743503 (= res!500582 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13886))))

(declare-fun b!743504 () Bool)

(declare-fun res!500592 () Bool)

(assert (=> b!743504 (=> (not res!500592) (not e!415408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41547 (_ BitVec 32)) Bool)

(assert (=> b!743504 (= res!500592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743505 () Bool)

(declare-fun e!415401 () Bool)

(assert (=> b!743505 (= e!415401 (not e!415409))))

(declare-fun res!500588 () Bool)

(assert (=> b!743505 (=> res!500588 e!415409)))

(assert (=> b!743505 (= res!500588 (or (not (is-Intermediate!7487 lt!330278)) (bvslt x!1131 (x!63285 lt!330278)) (not (= x!1131 (x!63285 lt!330278))) (not (= index!1321 (index!32318 lt!330278)))))))

(declare-fun e!415404 () Bool)

(assert (=> b!743505 e!415404))

(declare-fun res!500583 () Bool)

(assert (=> b!743505 (=> (not res!500583) (not e!415404))))

(assert (=> b!743505 (= res!500583 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25454 0))(
  ( (Unit!25455) )
))
(declare-fun lt!330276 () Unit!25454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25454)

(assert (=> b!743505 (= lt!330276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743506 () Bool)

(declare-fun e!415407 () Bool)

(assert (=> b!743506 (= e!415404 e!415407)))

(declare-fun res!500581 () Bool)

(assert (=> b!743506 (=> (not res!500581) (not e!415407))))

(declare-fun lt!330280 () SeekEntryResult!7487)

(assert (=> b!743506 (= res!500581 (= (seekEntryOrOpen!0 (select (arr!19887 a!3186) j!159) a!3186 mask!3328) lt!330280))))

(assert (=> b!743506 (= lt!330280 (Found!7487 j!159))))

(declare-fun b!743507 () Bool)

(declare-fun res!500579 () Bool)

(assert (=> b!743507 (=> (not res!500579) (not e!415403))))

(declare-fun arrayContainsKey!0 (array!41547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743507 (= res!500579 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743508 () Bool)

(assert (=> b!743508 (= e!415407 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19887 a!3186) j!159) a!3186 mask!3328) lt!330280))))

(declare-fun b!743509 () Bool)

(assert (=> b!743509 (= e!415409 (validKeyInArray!0 lt!330277))))

(declare-fun b!743510 () Bool)

(assert (=> b!743510 (= e!415402 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19887 a!3186) j!159) a!3186 mask!3328) lt!330274))))

(declare-fun b!743511 () Bool)

(assert (=> b!743511 (= e!415405 e!415401)))

(declare-fun res!500585 () Bool)

(assert (=> b!743511 (=> (not res!500585) (not e!415401))))

(declare-fun lt!330281 () SeekEntryResult!7487)

(assert (=> b!743511 (= res!500585 (= lt!330281 lt!330278))))

(assert (=> b!743511 (= lt!330278 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330277 lt!330279 mask!3328))))

(assert (=> b!743511 (= lt!330281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330277 mask!3328) lt!330277 lt!330279 mask!3328))))

(assert (=> b!743511 (= lt!330277 (select (store (arr!19887 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743511 (= lt!330279 (array!41548 (store (arr!19887 a!3186) i!1173 k!2102) (size!20308 a!3186)))))

(declare-fun b!743512 () Bool)

(declare-fun res!500587 () Bool)

(assert (=> b!743512 (=> res!500587 e!415409)))

(assert (=> b!743512 (= res!500587 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!743513 () Bool)

(assert (=> b!743513 (= e!415403 e!415408)))

(declare-fun res!500580 () Bool)

(assert (=> b!743513 (=> (not res!500580) (not e!415408))))

(declare-fun lt!330275 () SeekEntryResult!7487)

(assert (=> b!743513 (= res!500580 (or (= lt!330275 (MissingZero!7487 i!1173)) (= lt!330275 (MissingVacant!7487 i!1173))))))

(assert (=> b!743513 (= lt!330275 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!743514 () Bool)

(declare-fun res!500589 () Bool)

(assert (=> b!743514 (=> (not res!500589) (not e!415403))))

(assert (=> b!743514 (= res!500589 (validKeyInArray!0 k!2102))))

(assert (= (and start!65374 res!500590) b!743497))

(assert (= (and b!743497 res!500595) b!743495))

(assert (= (and b!743495 res!500596) b!743514))

(assert (= (and b!743514 res!500589) b!743507))

(assert (= (and b!743507 res!500579) b!743513))

(assert (= (and b!743513 res!500580) b!743504))

(assert (= (and b!743504 res!500592) b!743503))

(assert (= (and b!743503 res!500582) b!743493))

(assert (= (and b!743493 res!500597) b!743494))

(assert (= (and b!743494 res!500591) b!743498))

(assert (= (and b!743498 res!500593) b!743496))

(assert (= (and b!743496 c!81838) b!743510))

(assert (= (and b!743496 (not c!81838)) b!743500))

(assert (= (and b!743496 res!500594) b!743511))

(assert (= (and b!743511 res!500585) b!743505))

(assert (= (and b!743505 res!500583) b!743506))

(assert (= (and b!743506 res!500581) b!743508))

(assert (= (and b!743505 (not res!500588)) b!743499))

(assert (= (and b!743499 (not res!500584)) b!743501))

(assert (= (and b!743501 (not res!500586)) b!743502))

(assert (= (and b!743502 (not res!500578)) b!743512))

(assert (= (and b!743512 (not res!500587)) b!743509))

(declare-fun m!694171 () Bool)

(assert (=> b!743506 m!694171))

(assert (=> b!743506 m!694171))

(declare-fun m!694173 () Bool)

(assert (=> b!743506 m!694173))

(declare-fun m!694175 () Bool)

(assert (=> b!743498 m!694175))

(assert (=> b!743510 m!694171))

(assert (=> b!743510 m!694171))

(declare-fun m!694177 () Bool)

(assert (=> b!743510 m!694177))

(assert (=> b!743499 m!694171))

(assert (=> b!743499 m!694171))

(declare-fun m!694179 () Bool)

(assert (=> b!743499 m!694179))

(declare-fun m!694181 () Bool)

(assert (=> b!743504 m!694181))

(declare-fun m!694183 () Bool)

(assert (=> b!743511 m!694183))

(declare-fun m!694185 () Bool)

(assert (=> b!743511 m!694185))

(assert (=> b!743511 m!694183))

(declare-fun m!694187 () Bool)

(assert (=> b!743511 m!694187))

(declare-fun m!694189 () Bool)

(assert (=> b!743511 m!694189))

(declare-fun m!694191 () Bool)

(assert (=> b!743511 m!694191))

(declare-fun m!694193 () Bool)

(assert (=> b!743514 m!694193))

(assert (=> b!743508 m!694171))

(assert (=> b!743508 m!694171))

(declare-fun m!694195 () Bool)

(assert (=> b!743508 m!694195))

(declare-fun m!694197 () Bool)

(assert (=> start!65374 m!694197))

(declare-fun m!694199 () Bool)

(assert (=> start!65374 m!694199))

(declare-fun m!694201 () Bool)

(assert (=> b!743503 m!694201))

(declare-fun m!694203 () Bool)

(assert (=> b!743502 m!694203))

(assert (=> b!743494 m!694171))

(assert (=> b!743494 m!694171))

(declare-fun m!694205 () Bool)

(assert (=> b!743494 m!694205))

(assert (=> b!743494 m!694205))

(assert (=> b!743494 m!694171))

(declare-fun m!694207 () Bool)

(assert (=> b!743494 m!694207))

(assert (=> b!743501 m!694185))

(declare-fun m!694209 () Bool)

(assert (=> b!743501 m!694209))

(assert (=> b!743500 m!694171))

(assert (=> b!743500 m!694171))

(assert (=> b!743500 m!694179))

(declare-fun m!694211 () Bool)

(assert (=> b!743505 m!694211))

(declare-fun m!694213 () Bool)

(assert (=> b!743505 m!694213))

(assert (=> b!743495 m!694171))

(assert (=> b!743495 m!694171))

(declare-fun m!694215 () Bool)

(assert (=> b!743495 m!694215))

(declare-fun m!694217 () Bool)

(assert (=> b!743507 m!694217))

(declare-fun m!694219 () Bool)

(assert (=> b!743513 m!694219))

(declare-fun m!694221 () Bool)

(assert (=> b!743509 m!694221))

(push 1)

