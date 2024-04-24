; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66350 () Bool)

(assert start!66350)

(declare-fun b!763421 () Bool)

(declare-fun res!516121 () Bool)

(declare-fun e!425536 () Bool)

(assert (=> b!763421 (=> (not res!516121) (not e!425536))))

(declare-datatypes ((array!42133 0))(
  ( (array!42134 (arr!20170 (Array (_ BitVec 32) (_ BitVec 64))) (size!20590 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42133)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763421 (= res!516121 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763422 () Bool)

(declare-fun e!425540 () Bool)

(assert (=> b!763422 (= e!425536 e!425540)))

(declare-fun res!516127 () Bool)

(assert (=> b!763422 (=> (not res!516127) (not e!425540))))

(declare-datatypes ((SeekEntryResult!7726 0))(
  ( (MissingZero!7726 (index!33272 (_ BitVec 32))) (Found!7726 (index!33273 (_ BitVec 32))) (Intermediate!7726 (undefined!8538 Bool) (index!33274 (_ BitVec 32)) (x!64341 (_ BitVec 32))) (Undefined!7726) (MissingVacant!7726 (index!33275 (_ BitVec 32))) )
))
(declare-fun lt!339919 () SeekEntryResult!7726)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763422 (= res!516127 (or (= lt!339919 (MissingZero!7726 i!1173)) (= lt!339919 (MissingVacant!7726 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42133 (_ BitVec 32)) SeekEntryResult!7726)

(assert (=> b!763422 (= lt!339919 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!763423 () Bool)

(declare-fun e!425538 () Bool)

(declare-fun lt!339921 () SeekEntryResult!7726)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42133 (_ BitVec 32)) SeekEntryResult!7726)

(assert (=> b!763423 (= e!425538 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20170 a!3186) j!159) a!3186 mask!3328) lt!339921)))))

(declare-fun b!763424 () Bool)

(declare-fun res!516126 () Bool)

(assert (=> b!763424 (=> (not res!516126) (not e!425540))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763424 (= res!516126 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20590 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20590 a!3186))))))

(declare-fun b!763425 () Bool)

(declare-fun res!516118 () Bool)

(assert (=> b!763425 (=> (not res!516118) (not e!425536))))

(assert (=> b!763425 (= res!516118 (and (= (size!20590 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20590 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20590 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763426 () Bool)

(declare-fun e!425539 () Bool)

(assert (=> b!763426 (= e!425539 false)))

(declare-fun lt!339920 () Bool)

(assert (=> b!763426 (= lt!339920 e!425538)))

(declare-fun c!84041 () Bool)

(assert (=> b!763426 (= c!84041 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!516124 () Bool)

(assert (=> start!66350 (=> (not res!516124) (not e!425536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66350 (= res!516124 (validMask!0 mask!3328))))

(assert (=> start!66350 e!425536))

(assert (=> start!66350 true))

(declare-fun array_inv!16029 (array!42133) Bool)

(assert (=> start!66350 (array_inv!16029 a!3186)))

(declare-fun b!763427 () Bool)

(declare-fun res!516119 () Bool)

(assert (=> b!763427 (=> (not res!516119) (not e!425540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42133 (_ BitVec 32)) Bool)

(assert (=> b!763427 (= res!516119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763428 () Bool)

(declare-fun res!516125 () Bool)

(assert (=> b!763428 (=> (not res!516125) (not e!425539))))

(assert (=> b!763428 (= res!516125 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20170 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763429 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42133 (_ BitVec 32)) SeekEntryResult!7726)

(assert (=> b!763429 (= e!425538 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20170 a!3186) j!159) a!3186 mask!3328) (Found!7726 j!159))))))

(declare-fun b!763430 () Bool)

(declare-fun res!516120 () Bool)

(assert (=> b!763430 (=> (not res!516120) (not e!425540))))

(declare-datatypes ((List!14079 0))(
  ( (Nil!14076) (Cons!14075 (h!15165 (_ BitVec 64)) (t!20386 List!14079)) )
))
(declare-fun arrayNoDuplicates!0 (array!42133 (_ BitVec 32) List!14079) Bool)

(assert (=> b!763430 (= res!516120 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14076))))

(declare-fun b!763431 () Bool)

(declare-fun res!516122 () Bool)

(assert (=> b!763431 (=> (not res!516122) (not e!425536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763431 (= res!516122 (validKeyInArray!0 k0!2102))))

(declare-fun b!763432 () Bool)

(declare-fun res!516128 () Bool)

(assert (=> b!763432 (=> (not res!516128) (not e!425536))))

(assert (=> b!763432 (= res!516128 (validKeyInArray!0 (select (arr!20170 a!3186) j!159)))))

(declare-fun b!763433 () Bool)

(assert (=> b!763433 (= e!425540 e!425539)))

(declare-fun res!516123 () Bool)

(assert (=> b!763433 (=> (not res!516123) (not e!425539))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763433 (= res!516123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20170 a!3186) j!159) mask!3328) (select (arr!20170 a!3186) j!159) a!3186 mask!3328) lt!339921))))

(assert (=> b!763433 (= lt!339921 (Intermediate!7726 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66350 res!516124) b!763425))

(assert (= (and b!763425 res!516118) b!763432))

(assert (= (and b!763432 res!516128) b!763431))

(assert (= (and b!763431 res!516122) b!763421))

(assert (= (and b!763421 res!516121) b!763422))

(assert (= (and b!763422 res!516127) b!763427))

(assert (= (and b!763427 res!516119) b!763430))

(assert (= (and b!763430 res!516120) b!763424))

(assert (= (and b!763424 res!516126) b!763433))

(assert (= (and b!763433 res!516123) b!763428))

(assert (= (and b!763428 res!516125) b!763426))

(assert (= (and b!763426 c!84041) b!763423))

(assert (= (and b!763426 (not c!84041)) b!763429))

(declare-fun m!710455 () Bool)

(assert (=> b!763421 m!710455))

(declare-fun m!710457 () Bool)

(assert (=> b!763430 m!710457))

(declare-fun m!710459 () Bool)

(assert (=> b!763422 m!710459))

(declare-fun m!710461 () Bool)

(assert (=> b!763431 m!710461))

(declare-fun m!710463 () Bool)

(assert (=> b!763428 m!710463))

(declare-fun m!710465 () Bool)

(assert (=> b!763432 m!710465))

(assert (=> b!763432 m!710465))

(declare-fun m!710467 () Bool)

(assert (=> b!763432 m!710467))

(assert (=> b!763423 m!710465))

(assert (=> b!763423 m!710465))

(declare-fun m!710469 () Bool)

(assert (=> b!763423 m!710469))

(declare-fun m!710471 () Bool)

(assert (=> b!763427 m!710471))

(assert (=> b!763429 m!710465))

(assert (=> b!763429 m!710465))

(declare-fun m!710473 () Bool)

(assert (=> b!763429 m!710473))

(assert (=> b!763433 m!710465))

(assert (=> b!763433 m!710465))

(declare-fun m!710475 () Bool)

(assert (=> b!763433 m!710475))

(assert (=> b!763433 m!710475))

(assert (=> b!763433 m!710465))

(declare-fun m!710477 () Bool)

(assert (=> b!763433 m!710477))

(declare-fun m!710479 () Bool)

(assert (=> start!66350 m!710479))

(declare-fun m!710481 () Bool)

(assert (=> start!66350 m!710481))

(check-sat (not start!66350) (not b!763429) (not b!763431) (not b!763432) (not b!763423) (not b!763427) (not b!763430) (not b!763421) (not b!763433) (not b!763422))
(check-sat)
