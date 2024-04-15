; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65084 () Bool)

(assert start!65084)

(declare-fun b!734392 () Bool)

(declare-fun e!410912 () Bool)

(declare-fun e!410914 () Bool)

(assert (=> b!734392 (= e!410912 e!410914)))

(declare-fun res!493400 () Bool)

(assert (=> b!734392 (=> (not res!493400) (not e!410914))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((array!41274 0))(
  ( (array!41275 (arr!19751 (Array (_ BitVec 32) (_ BitVec 64))) (size!20172 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41274)

(declare-datatypes ((SeekEntryResult!7348 0))(
  ( (MissingZero!7348 (index!31760 (_ BitVec 32))) (Found!7348 (index!31761 (_ BitVec 32))) (Intermediate!7348 (undefined!8160 Bool) (index!31762 (_ BitVec 32)) (x!62781 (_ BitVec 32))) (Undefined!7348) (MissingVacant!7348 (index!31763 (_ BitVec 32))) )
))
(declare-fun lt!325351 () SeekEntryResult!7348)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41274 (_ BitVec 32)) SeekEntryResult!7348)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734392 (= res!493400 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19751 a!3186) j!159) mask!3328) (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325351))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734392 (= lt!325351 (Intermediate!7348 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734393 () Bool)

(declare-fun e!410913 () Bool)

(assert (=> b!734393 (= e!410913 e!410912)))

(declare-fun res!493413 () Bool)

(assert (=> b!734393 (=> (not res!493413) (not e!410912))))

(declare-fun lt!325354 () SeekEntryResult!7348)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734393 (= res!493413 (or (= lt!325354 (MissingZero!7348 i!1173)) (= lt!325354 (MissingVacant!7348 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41274 (_ BitVec 32)) SeekEntryResult!7348)

(assert (=> b!734393 (= lt!325354 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!734394 () Bool)

(declare-fun res!493416 () Bool)

(assert (=> b!734394 (=> (not res!493416) (not e!410912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41274 (_ BitVec 32)) Bool)

(assert (=> b!734394 (= res!493416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!410911 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!734395 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41274 (_ BitVec 32)) SeekEntryResult!7348)

(assert (=> b!734395 (= e!410911 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) (Found!7348 j!159)))))

(declare-fun b!734396 () Bool)

(declare-fun e!410915 () Bool)

(declare-fun e!410916 () Bool)

(assert (=> b!734396 (= e!410915 e!410916)))

(declare-fun res!493408 () Bool)

(assert (=> b!734396 (=> (not res!493408) (not e!410916))))

(declare-fun lt!325350 () SeekEntryResult!7348)

(assert (=> b!734396 (= res!493408 (= (seekEntryOrOpen!0 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325350))))

(assert (=> b!734396 (= lt!325350 (Found!7348 j!159))))

(declare-fun b!734397 () Bool)

(declare-fun res!493406 () Bool)

(assert (=> b!734397 (=> (not res!493406) (not e!410913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734397 (= res!493406 (validKeyInArray!0 k0!2102))))

(declare-fun b!734398 () Bool)

(declare-fun res!493412 () Bool)

(assert (=> b!734398 (=> (not res!493412) (not e!410913))))

(assert (=> b!734398 (= res!493412 (validKeyInArray!0 (select (arr!19751 a!3186) j!159)))))

(declare-fun b!734399 () Bool)

(declare-fun res!493405 () Bool)

(assert (=> b!734399 (=> (not res!493405) (not e!410912))))

(declare-datatypes ((List!13792 0))(
  ( (Nil!13789) (Cons!13788 (h!14860 (_ BitVec 64)) (t!20098 List!13792)) )
))
(declare-fun arrayNoDuplicates!0 (array!41274 (_ BitVec 32) List!13792) Bool)

(assert (=> b!734399 (= res!493405 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13789))))

(declare-fun e!410917 () Bool)

(declare-fun lt!325353 () (_ BitVec 32))

(declare-fun b!734400 () Bool)

(assert (=> b!734400 (= e!410917 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!325353 #b00000000000000000000000000000000) (bvsge lt!325353 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!734401 () Bool)

(declare-fun res!493402 () Bool)

(assert (=> b!734401 (=> res!493402 e!410917)))

(assert (=> b!734401 (= res!493402 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) (Found!7348 j!159)))))

(declare-fun b!734402 () Bool)

(declare-fun res!493401 () Bool)

(assert (=> b!734402 (=> (not res!493401) (not e!410913))))

(declare-fun arrayContainsKey!0 (array!41274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734402 (= res!493401 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734403 () Bool)

(declare-fun res!493414 () Bool)

(assert (=> b!734403 (=> (not res!493414) (not e!410913))))

(assert (=> b!734403 (= res!493414 (and (= (size!20172 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20172 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20172 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734404 () Bool)

(assert (=> b!734404 (= e!410911 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325351))))

(declare-fun b!734405 () Bool)

(declare-fun e!410920 () Bool)

(assert (=> b!734405 (= e!410914 e!410920)))

(declare-fun res!493407 () Bool)

(assert (=> b!734405 (=> (not res!493407) (not e!410920))))

(declare-fun lt!325349 () SeekEntryResult!7348)

(declare-fun lt!325355 () SeekEntryResult!7348)

(assert (=> b!734405 (= res!493407 (= lt!325349 lt!325355))))

(declare-fun lt!325352 () (_ BitVec 64))

(declare-fun lt!325347 () array!41274)

(assert (=> b!734405 (= lt!325355 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325352 lt!325347 mask!3328))))

(assert (=> b!734405 (= lt!325349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325352 mask!3328) lt!325352 lt!325347 mask!3328))))

(assert (=> b!734405 (= lt!325352 (select (store (arr!19751 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!734405 (= lt!325347 (array!41275 (store (arr!19751 a!3186) i!1173 k0!2102) (size!20172 a!3186)))))

(declare-fun b!734406 () Bool)

(declare-fun res!493399 () Bool)

(assert (=> b!734406 (=> (not res!493399) (not e!410912))))

(assert (=> b!734406 (= res!493399 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20172 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20172 a!3186))))))

(declare-fun b!734407 () Bool)

(declare-fun res!493411 () Bool)

(assert (=> b!734407 (=> (not res!493411) (not e!410914))))

(assert (=> b!734407 (= res!493411 e!410911)))

(declare-fun c!80877 () Bool)

(assert (=> b!734407 (= c!80877 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!493403 () Bool)

(assert (=> start!65084 (=> (not res!493403) (not e!410913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65084 (= res!493403 (validMask!0 mask!3328))))

(assert (=> start!65084 e!410913))

(assert (=> start!65084 true))

(declare-fun array_inv!15634 (array!41274) Bool)

(assert (=> start!65084 (array_inv!15634 a!3186)))

(declare-fun b!734408 () Bool)

(declare-fun e!410918 () Bool)

(assert (=> b!734408 (= e!410920 (not e!410918))))

(declare-fun res!493409 () Bool)

(assert (=> b!734408 (=> res!493409 e!410918)))

(get-info :version)

(assert (=> b!734408 (= res!493409 (or (not ((_ is Intermediate!7348) lt!325355)) (bvsge x!1131 (x!62781 lt!325355))))))

(assert (=> b!734408 e!410915))

(declare-fun res!493415 () Bool)

(assert (=> b!734408 (=> (not res!493415) (not e!410915))))

(assert (=> b!734408 (= res!493415 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24986 0))(
  ( (Unit!24987) )
))
(declare-fun lt!325348 () Unit!24986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24986)

(assert (=> b!734408 (= lt!325348 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734409 () Bool)

(assert (=> b!734409 (= e!410918 e!410917)))

(declare-fun res!493410 () Bool)

(assert (=> b!734409 (=> res!493410 e!410917)))

(assert (=> b!734409 (= res!493410 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734409 (= lt!325353 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734410 () Bool)

(declare-fun res!493404 () Bool)

(assert (=> b!734410 (=> (not res!493404) (not e!410914))))

(assert (=> b!734410 (= res!493404 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19751 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734411 () Bool)

(assert (=> b!734411 (= e!410916 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325350))))

(assert (= (and start!65084 res!493403) b!734403))

(assert (= (and b!734403 res!493414) b!734398))

(assert (= (and b!734398 res!493412) b!734397))

(assert (= (and b!734397 res!493406) b!734402))

(assert (= (and b!734402 res!493401) b!734393))

(assert (= (and b!734393 res!493413) b!734394))

(assert (= (and b!734394 res!493416) b!734399))

(assert (= (and b!734399 res!493405) b!734406))

(assert (= (and b!734406 res!493399) b!734392))

(assert (= (and b!734392 res!493400) b!734410))

(assert (= (and b!734410 res!493404) b!734407))

(assert (= (and b!734407 c!80877) b!734404))

(assert (= (and b!734407 (not c!80877)) b!734395))

(assert (= (and b!734407 res!493411) b!734405))

(assert (= (and b!734405 res!493407) b!734408))

(assert (= (and b!734408 res!493415) b!734396))

(assert (= (and b!734396 res!493408) b!734411))

(assert (= (and b!734408 (not res!493409)) b!734409))

(assert (= (and b!734409 (not res!493410)) b!734401))

(assert (= (and b!734401 (not res!493402)) b!734400))

(declare-fun m!686429 () Bool)

(assert (=> start!65084 m!686429))

(declare-fun m!686431 () Bool)

(assert (=> start!65084 m!686431))

(declare-fun m!686433 () Bool)

(assert (=> b!734397 m!686433))

(declare-fun m!686435 () Bool)

(assert (=> b!734392 m!686435))

(assert (=> b!734392 m!686435))

(declare-fun m!686437 () Bool)

(assert (=> b!734392 m!686437))

(assert (=> b!734392 m!686437))

(assert (=> b!734392 m!686435))

(declare-fun m!686439 () Bool)

(assert (=> b!734392 m!686439))

(assert (=> b!734404 m!686435))

(assert (=> b!734404 m!686435))

(declare-fun m!686441 () Bool)

(assert (=> b!734404 m!686441))

(declare-fun m!686443 () Bool)

(assert (=> b!734394 m!686443))

(declare-fun m!686445 () Bool)

(assert (=> b!734402 m!686445))

(declare-fun m!686447 () Bool)

(assert (=> b!734405 m!686447))

(declare-fun m!686449 () Bool)

(assert (=> b!734405 m!686449))

(declare-fun m!686451 () Bool)

(assert (=> b!734405 m!686451))

(declare-fun m!686453 () Bool)

(assert (=> b!734405 m!686453))

(assert (=> b!734405 m!686447))

(declare-fun m!686455 () Bool)

(assert (=> b!734405 m!686455))

(assert (=> b!734395 m!686435))

(assert (=> b!734395 m!686435))

(declare-fun m!686457 () Bool)

(assert (=> b!734395 m!686457))

(declare-fun m!686459 () Bool)

(assert (=> b!734410 m!686459))

(declare-fun m!686461 () Bool)

(assert (=> b!734408 m!686461))

(declare-fun m!686463 () Bool)

(assert (=> b!734408 m!686463))

(assert (=> b!734396 m!686435))

(assert (=> b!734396 m!686435))

(declare-fun m!686465 () Bool)

(assert (=> b!734396 m!686465))

(assert (=> b!734401 m!686435))

(assert (=> b!734401 m!686435))

(assert (=> b!734401 m!686457))

(declare-fun m!686467 () Bool)

(assert (=> b!734393 m!686467))

(declare-fun m!686469 () Bool)

(assert (=> b!734399 m!686469))

(declare-fun m!686471 () Bool)

(assert (=> b!734409 m!686471))

(assert (=> b!734398 m!686435))

(assert (=> b!734398 m!686435))

(declare-fun m!686473 () Bool)

(assert (=> b!734398 m!686473))

(assert (=> b!734411 m!686435))

(assert (=> b!734411 m!686435))

(declare-fun m!686475 () Bool)

(assert (=> b!734411 m!686475))

(check-sat (not b!734397) (not b!734394) (not b!734395) (not b!734405) (not b!734408) (not b!734402) (not b!734398) (not start!65084) (not b!734401) (not b!734411) (not b!734393) (not b!734404) (not b!734409) (not b!734399) (not b!734396) (not b!734392))
(check-sat)
