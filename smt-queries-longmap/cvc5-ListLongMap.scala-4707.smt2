; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65302 () Bool)

(assert start!65302)

(declare-fun b!741494 () Bool)

(declare-fun res!498802 () Bool)

(declare-fun e!414476 () Bool)

(assert (=> b!741494 (=> (not res!498802) (not e!414476))))

(declare-datatypes ((array!41475 0))(
  ( (array!41476 (arr!19851 (Array (_ BitVec 32) (_ BitVec 64))) (size!20272 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41475)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41475 (_ BitVec 32)) Bool)

(assert (=> b!741494 (= res!498802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!414479 () Bool)

(declare-fun b!741496 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7451 0))(
  ( (MissingZero!7451 (index!32172 (_ BitVec 32))) (Found!7451 (index!32173 (_ BitVec 32))) (Intermediate!7451 (undefined!8263 Bool) (index!32174 (_ BitVec 32)) (x!63153 (_ BitVec 32))) (Undefined!7451) (MissingVacant!7451 (index!32175 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41475 (_ BitVec 32)) SeekEntryResult!7451)

(assert (=> b!741496 (= e!414479 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19851 a!3186) j!159) a!3186 mask!3328) (Found!7451 j!159)))))

(declare-fun b!741497 () Bool)

(declare-fun res!498804 () Bool)

(declare-fun e!414475 () Bool)

(assert (=> b!741497 (=> (not res!498804) (not e!414475))))

(assert (=> b!741497 (= res!498804 e!414479)))

(declare-fun c!81730 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741497 (= c!81730 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741498 () Bool)

(declare-fun e!414473 () Bool)

(declare-fun e!414474 () Bool)

(assert (=> b!741498 (= e!414473 e!414474)))

(declare-fun res!498799 () Bool)

(assert (=> b!741498 (=> (not res!498799) (not e!414474))))

(declare-fun lt!329432 () SeekEntryResult!7451)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41475 (_ BitVec 32)) SeekEntryResult!7451)

(assert (=> b!741498 (= res!498799 (= (seekEntryOrOpen!0 (select (arr!19851 a!3186) j!159) a!3186 mask!3328) lt!329432))))

(assert (=> b!741498 (= lt!329432 (Found!7451 j!159))))

(declare-fun b!741499 () Bool)

(declare-fun e!414478 () Bool)

(assert (=> b!741499 (= e!414478 e!414476)))

(declare-fun res!498798 () Bool)

(assert (=> b!741499 (=> (not res!498798) (not e!414476))))

(declare-fun lt!329430 () SeekEntryResult!7451)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741499 (= res!498798 (or (= lt!329430 (MissingZero!7451 i!1173)) (= lt!329430 (MissingVacant!7451 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!741499 (= lt!329430 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!741500 () Bool)

(declare-fun e!414472 () Bool)

(assert (=> b!741500 (= e!414475 e!414472)))

(declare-fun res!498801 () Bool)

(assert (=> b!741500 (=> (not res!498801) (not e!414472))))

(declare-fun lt!329433 () SeekEntryResult!7451)

(declare-fun lt!329428 () SeekEntryResult!7451)

(assert (=> b!741500 (= res!498801 (= lt!329433 lt!329428))))

(declare-fun lt!329435 () (_ BitVec 64))

(declare-fun lt!329434 () array!41475)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41475 (_ BitVec 32)) SeekEntryResult!7451)

(assert (=> b!741500 (= lt!329428 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329435 lt!329434 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741500 (= lt!329433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329435 mask!3328) lt!329435 lt!329434 mask!3328))))

(assert (=> b!741500 (= lt!329435 (select (store (arr!19851 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741500 (= lt!329434 (array!41476 (store (arr!19851 a!3186) i!1173 k!2102) (size!20272 a!3186)))))

(declare-fun b!741501 () Bool)

(declare-fun res!498807 () Bool)

(assert (=> b!741501 (=> (not res!498807) (not e!414476))))

(assert (=> b!741501 (= res!498807 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20272 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20272 a!3186))))))

(declare-fun b!741502 () Bool)

(declare-fun res!498795 () Bool)

(assert (=> b!741502 (=> (not res!498795) (not e!414478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741502 (= res!498795 (validKeyInArray!0 k!2102))))

(declare-fun b!741503 () Bool)

(declare-fun res!498800 () Bool)

(assert (=> b!741503 (=> (not res!498800) (not e!414478))))

(declare-fun arrayContainsKey!0 (array!41475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741503 (= res!498800 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!329431 () SeekEntryResult!7451)

(declare-fun b!741504 () Bool)

(assert (=> b!741504 (= e!414479 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19851 a!3186) j!159) a!3186 mask!3328) lt!329431))))

(declare-fun res!498808 () Bool)

(assert (=> start!65302 (=> (not res!498808) (not e!414478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65302 (= res!498808 (validMask!0 mask!3328))))

(assert (=> start!65302 e!414478))

(assert (=> start!65302 true))

(declare-fun array_inv!15647 (array!41475) Bool)

(assert (=> start!65302 (array_inv!15647 a!3186)))

(declare-fun b!741495 () Bool)

(assert (=> b!741495 (= e!414472 (not (or (not (is-Intermediate!7451 lt!329428)) (not (= x!1131 (x!63153 lt!329428))) (not (= index!1321 (index!32174 lt!329428))) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!741495 e!414473))

(declare-fun res!498803 () Bool)

(assert (=> b!741495 (=> (not res!498803) (not e!414473))))

(assert (=> b!741495 (= res!498803 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25382 0))(
  ( (Unit!25383) )
))
(declare-fun lt!329429 () Unit!25382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25382)

(assert (=> b!741495 (= lt!329429 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741505 () Bool)

(assert (=> b!741505 (= e!414474 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19851 a!3186) j!159) a!3186 mask!3328) lt!329432))))

(declare-fun b!741506 () Bool)

(declare-fun res!498797 () Bool)

(assert (=> b!741506 (=> (not res!498797) (not e!414478))))

(assert (=> b!741506 (= res!498797 (and (= (size!20272 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20272 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20272 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741507 () Bool)

(declare-fun res!498805 () Bool)

(assert (=> b!741507 (=> (not res!498805) (not e!414478))))

(assert (=> b!741507 (= res!498805 (validKeyInArray!0 (select (arr!19851 a!3186) j!159)))))

(declare-fun b!741508 () Bool)

(declare-fun res!498806 () Bool)

(assert (=> b!741508 (=> (not res!498806) (not e!414476))))

(declare-datatypes ((List!13853 0))(
  ( (Nil!13850) (Cons!13849 (h!14921 (_ BitVec 64)) (t!20168 List!13853)) )
))
(declare-fun arrayNoDuplicates!0 (array!41475 (_ BitVec 32) List!13853) Bool)

(assert (=> b!741508 (= res!498806 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13850))))

(declare-fun b!741509 () Bool)

(assert (=> b!741509 (= e!414476 e!414475)))

(declare-fun res!498796 () Bool)

(assert (=> b!741509 (=> (not res!498796) (not e!414475))))

(assert (=> b!741509 (= res!498796 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19851 a!3186) j!159) mask!3328) (select (arr!19851 a!3186) j!159) a!3186 mask!3328) lt!329431))))

(assert (=> b!741509 (= lt!329431 (Intermediate!7451 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741510 () Bool)

(declare-fun res!498809 () Bool)

(assert (=> b!741510 (=> (not res!498809) (not e!414475))))

(assert (=> b!741510 (= res!498809 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19851 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65302 res!498808) b!741506))

(assert (= (and b!741506 res!498797) b!741507))

(assert (= (and b!741507 res!498805) b!741502))

(assert (= (and b!741502 res!498795) b!741503))

(assert (= (and b!741503 res!498800) b!741499))

(assert (= (and b!741499 res!498798) b!741494))

(assert (= (and b!741494 res!498802) b!741508))

(assert (= (and b!741508 res!498806) b!741501))

(assert (= (and b!741501 res!498807) b!741509))

(assert (= (and b!741509 res!498796) b!741510))

(assert (= (and b!741510 res!498809) b!741497))

(assert (= (and b!741497 c!81730) b!741504))

(assert (= (and b!741497 (not c!81730)) b!741496))

(assert (= (and b!741497 res!498804) b!741500))

(assert (= (and b!741500 res!498801) b!741495))

(assert (= (and b!741495 res!498803) b!741498))

(assert (= (and b!741498 res!498799) b!741505))

(declare-fun m!692461 () Bool)

(assert (=> b!741498 m!692461))

(assert (=> b!741498 m!692461))

(declare-fun m!692463 () Bool)

(assert (=> b!741498 m!692463))

(declare-fun m!692465 () Bool)

(assert (=> start!65302 m!692465))

(declare-fun m!692467 () Bool)

(assert (=> start!65302 m!692467))

(declare-fun m!692469 () Bool)

(assert (=> b!741510 m!692469))

(assert (=> b!741496 m!692461))

(assert (=> b!741496 m!692461))

(declare-fun m!692471 () Bool)

(assert (=> b!741496 m!692471))

(declare-fun m!692473 () Bool)

(assert (=> b!741503 m!692473))

(declare-fun m!692475 () Bool)

(assert (=> b!741502 m!692475))

(declare-fun m!692477 () Bool)

(assert (=> b!741494 m!692477))

(assert (=> b!741504 m!692461))

(assert (=> b!741504 m!692461))

(declare-fun m!692479 () Bool)

(assert (=> b!741504 m!692479))

(declare-fun m!692481 () Bool)

(assert (=> b!741500 m!692481))

(declare-fun m!692483 () Bool)

(assert (=> b!741500 m!692483))

(declare-fun m!692485 () Bool)

(assert (=> b!741500 m!692485))

(declare-fun m!692487 () Bool)

(assert (=> b!741500 m!692487))

(assert (=> b!741500 m!692481))

(declare-fun m!692489 () Bool)

(assert (=> b!741500 m!692489))

(assert (=> b!741507 m!692461))

(assert (=> b!741507 m!692461))

(declare-fun m!692491 () Bool)

(assert (=> b!741507 m!692491))

(declare-fun m!692493 () Bool)

(assert (=> b!741495 m!692493))

(declare-fun m!692495 () Bool)

(assert (=> b!741495 m!692495))

(declare-fun m!692497 () Bool)

(assert (=> b!741499 m!692497))

(assert (=> b!741509 m!692461))

(assert (=> b!741509 m!692461))

(declare-fun m!692499 () Bool)

(assert (=> b!741509 m!692499))

(assert (=> b!741509 m!692499))

(assert (=> b!741509 m!692461))

(declare-fun m!692501 () Bool)

(assert (=> b!741509 m!692501))

(declare-fun m!692503 () Bool)

(assert (=> b!741508 m!692503))

(assert (=> b!741505 m!692461))

(assert (=> b!741505 m!692461))

(declare-fun m!692505 () Bool)

(assert (=> b!741505 m!692505))

(push 1)

(assert (not b!741494))

(assert (not b!741507))

(assert (not b!741495))

(assert (not b!741502))

(assert (not b!741504))

(assert (not b!741509))

(assert (not b!741499))

(assert (not b!741496))

(assert (not b!741500))

(assert (not b!741503))

(assert (not b!741508))

(assert (not start!65302))

(assert (not b!741505))

(assert (not b!741498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

