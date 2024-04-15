; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65684 () Bool)

(assert start!65684)

(declare-fun b!753451 () Bool)

(declare-fun e!420212 () Bool)

(declare-fun e!420218 () Bool)

(assert (=> b!753451 (= e!420212 e!420218)))

(declare-fun res!509071 () Bool)

(assert (=> b!753451 (=> (not res!509071) (not e!420218))))

(declare-datatypes ((SeekEntryResult!7648 0))(
  ( (MissingZero!7648 (index!32960 (_ BitVec 32))) (Found!7648 (index!32961 (_ BitVec 32))) (Intermediate!7648 (undefined!8460 Bool) (index!32962 (_ BitVec 32)) (x!63881 (_ BitVec 32))) (Undefined!7648) (MissingVacant!7648 (index!32963 (_ BitVec 32))) )
))
(declare-fun lt!335129 () SeekEntryResult!7648)

(declare-fun lt!335118 () SeekEntryResult!7648)

(assert (=> b!753451 (= res!509071 (= lt!335129 lt!335118))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41874 0))(
  ( (array!41875 (arr!20051 (Array (_ BitVec 32) (_ BitVec 64))) (size!20472 (_ BitVec 32))) )
))
(declare-fun lt!335120 () array!41874)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!335125 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41874 (_ BitVec 32)) SeekEntryResult!7648)

(assert (=> b!753451 (= lt!335118 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335125 lt!335120 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753451 (= lt!335129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335125 mask!3328) lt!335125 lt!335120 mask!3328))))

(declare-fun a!3186 () array!41874)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!753451 (= lt!335125 (select (store (arr!20051 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753451 (= lt!335120 (array!41875 (store (arr!20051 a!3186) i!1173 k0!2102) (size!20472 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!335119 () SeekEntryResult!7648)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!753453 () Bool)

(declare-fun e!420214 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41874 (_ BitVec 32)) SeekEntryResult!7648)

(assert (=> b!753453 (= e!420214 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20051 a!3186) j!159) a!3186 mask!3328) lt!335119))))

(declare-fun b!753454 () Bool)

(declare-fun e!420217 () Bool)

(assert (=> b!753454 (= e!420217 true)))

(declare-fun e!420213 () Bool)

(assert (=> b!753454 e!420213))

(declare-fun res!509076 () Bool)

(assert (=> b!753454 (=> (not res!509076) (not e!420213))))

(declare-fun lt!335128 () (_ BitVec 64))

(assert (=> b!753454 (= res!509076 (= lt!335128 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25952 0))(
  ( (Unit!25953) )
))
(declare-fun lt!335127 () Unit!25952)

(declare-fun e!420220 () Unit!25952)

(assert (=> b!753454 (= lt!335127 e!420220)))

(declare-fun c!82571 () Bool)

(assert (=> b!753454 (= c!82571 (= lt!335128 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753455 () Bool)

(declare-fun res!509077 () Bool)

(assert (=> b!753455 (=> (not res!509077) (not e!420212))))

(assert (=> b!753455 (= res!509077 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20051 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753456 () Bool)

(declare-fun res!509088 () Bool)

(assert (=> b!753456 (=> (not res!509088) (not e!420213))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41874 (_ BitVec 32)) SeekEntryResult!7648)

(assert (=> b!753456 (= res!509088 (= (seekEntryOrOpen!0 lt!335125 lt!335120 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335125 lt!335120 mask!3328)))))

(declare-fun b!753457 () Bool)

(declare-fun lt!335126 () SeekEntryResult!7648)

(declare-fun lt!335121 () SeekEntryResult!7648)

(assert (=> b!753457 (= e!420213 (= lt!335126 lt!335121))))

(declare-fun b!753458 () Bool)

(declare-fun res!509087 () Bool)

(declare-fun e!420215 () Bool)

(assert (=> b!753458 (=> (not res!509087) (not e!420215))))

(declare-datatypes ((List!14092 0))(
  ( (Nil!14089) (Cons!14088 (h!15160 (_ BitVec 64)) (t!20398 List!14092)) )
))
(declare-fun arrayNoDuplicates!0 (array!41874 (_ BitVec 32) List!14092) Bool)

(assert (=> b!753458 (= res!509087 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14089))))

(declare-fun b!753459 () Bool)

(declare-fun res!509073 () Bool)

(assert (=> b!753459 (=> (not res!509073) (not e!420215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41874 (_ BitVec 32)) Bool)

(assert (=> b!753459 (= res!509073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753460 () Bool)

(declare-fun res!509074 () Bool)

(declare-fun e!420219 () Bool)

(assert (=> b!753460 (=> (not res!509074) (not e!420219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753460 (= res!509074 (validKeyInArray!0 (select (arr!20051 a!3186) j!159)))))

(declare-fun lt!335122 () SeekEntryResult!7648)

(declare-fun b!753461 () Bool)

(declare-fun e!420223 () Bool)

(assert (=> b!753461 (= e!420223 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20051 a!3186) j!159) a!3186 mask!3328) lt!335122))))

(declare-fun b!753462 () Bool)

(declare-fun Unit!25954 () Unit!25952)

(assert (=> b!753462 (= e!420220 Unit!25954)))

(declare-fun b!753463 () Bool)

(assert (=> b!753463 (= e!420219 e!420215)))

(declare-fun res!509072 () Bool)

(assert (=> b!753463 (=> (not res!509072) (not e!420215))))

(declare-fun lt!335123 () SeekEntryResult!7648)

(assert (=> b!753463 (= res!509072 (or (= lt!335123 (MissingZero!7648 i!1173)) (= lt!335123 (MissingVacant!7648 i!1173))))))

(assert (=> b!753463 (= lt!335123 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753464 () Bool)

(declare-fun res!509083 () Bool)

(assert (=> b!753464 (=> (not res!509083) (not e!420212))))

(assert (=> b!753464 (= res!509083 e!420223)))

(declare-fun c!82572 () Bool)

(assert (=> b!753464 (= c!82572 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753465 () Bool)

(assert (=> b!753465 (= e!420223 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20051 a!3186) j!159) a!3186 mask!3328) (Found!7648 j!159)))))

(declare-fun res!509070 () Bool)

(assert (=> start!65684 (=> (not res!509070) (not e!420219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65684 (= res!509070 (validMask!0 mask!3328))))

(assert (=> start!65684 e!420219))

(assert (=> start!65684 true))

(declare-fun array_inv!15934 (array!41874) Bool)

(assert (=> start!65684 (array_inv!15934 a!3186)))

(declare-fun b!753452 () Bool)

(declare-fun res!509079 () Bool)

(assert (=> b!753452 (=> (not res!509079) (not e!420215))))

(assert (=> b!753452 (= res!509079 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20472 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20472 a!3186))))))

(declare-fun b!753466 () Bool)

(declare-fun res!509075 () Bool)

(assert (=> b!753466 (=> (not res!509075) (not e!420219))))

(assert (=> b!753466 (= res!509075 (and (= (size!20472 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20472 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20472 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753467 () Bool)

(assert (=> b!753467 (= e!420215 e!420212)))

(declare-fun res!509078 () Bool)

(assert (=> b!753467 (=> (not res!509078) (not e!420212))))

(assert (=> b!753467 (= res!509078 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20051 a!3186) j!159) mask!3328) (select (arr!20051 a!3186) j!159) a!3186 mask!3328) lt!335122))))

(assert (=> b!753467 (= lt!335122 (Intermediate!7648 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753468 () Bool)

(declare-fun e!420216 () Bool)

(assert (=> b!753468 (= e!420216 e!420217)))

(declare-fun res!509082 () Bool)

(assert (=> b!753468 (=> res!509082 e!420217)))

(assert (=> b!753468 (= res!509082 (= lt!335128 lt!335125))))

(assert (=> b!753468 (= lt!335128 (select (store (arr!20051 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753469 () Bool)

(declare-fun Unit!25955 () Unit!25952)

(assert (=> b!753469 (= e!420220 Unit!25955)))

(assert (=> b!753469 false))

(declare-fun b!753470 () Bool)

(declare-fun e!420222 () Bool)

(assert (=> b!753470 (= e!420218 (not e!420222))))

(declare-fun res!509081 () Bool)

(assert (=> b!753470 (=> res!509081 e!420222)))

(get-info :version)

(assert (=> b!753470 (= res!509081 (or (not ((_ is Intermediate!7648) lt!335118)) (bvslt x!1131 (x!63881 lt!335118)) (not (= x!1131 (x!63881 lt!335118))) (not (= index!1321 (index!32962 lt!335118)))))))

(assert (=> b!753470 e!420214))

(declare-fun res!509084 () Bool)

(assert (=> b!753470 (=> (not res!509084) (not e!420214))))

(assert (=> b!753470 (= res!509084 (= lt!335126 lt!335119))))

(assert (=> b!753470 (= lt!335119 (Found!7648 j!159))))

(assert (=> b!753470 (= lt!335126 (seekEntryOrOpen!0 (select (arr!20051 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753470 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335124 () Unit!25952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25952)

(assert (=> b!753470 (= lt!335124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753471 () Bool)

(declare-fun res!509086 () Bool)

(assert (=> b!753471 (=> (not res!509086) (not e!420219))))

(assert (=> b!753471 (= res!509086 (validKeyInArray!0 k0!2102))))

(declare-fun b!753472 () Bool)

(declare-fun res!509080 () Bool)

(assert (=> b!753472 (=> (not res!509080) (not e!420219))))

(declare-fun arrayContainsKey!0 (array!41874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753472 (= res!509080 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753473 () Bool)

(assert (=> b!753473 (= e!420222 e!420216)))

(declare-fun res!509085 () Bool)

(assert (=> b!753473 (=> res!509085 e!420216)))

(assert (=> b!753473 (= res!509085 (not (= lt!335121 lt!335119)))))

(assert (=> b!753473 (= lt!335121 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20051 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65684 res!509070) b!753466))

(assert (= (and b!753466 res!509075) b!753460))

(assert (= (and b!753460 res!509074) b!753471))

(assert (= (and b!753471 res!509086) b!753472))

(assert (= (and b!753472 res!509080) b!753463))

(assert (= (and b!753463 res!509072) b!753459))

(assert (= (and b!753459 res!509073) b!753458))

(assert (= (and b!753458 res!509087) b!753452))

(assert (= (and b!753452 res!509079) b!753467))

(assert (= (and b!753467 res!509078) b!753455))

(assert (= (and b!753455 res!509077) b!753464))

(assert (= (and b!753464 c!82572) b!753461))

(assert (= (and b!753464 (not c!82572)) b!753465))

(assert (= (and b!753464 res!509083) b!753451))

(assert (= (and b!753451 res!509071) b!753470))

(assert (= (and b!753470 res!509084) b!753453))

(assert (= (and b!753470 (not res!509081)) b!753473))

(assert (= (and b!753473 (not res!509085)) b!753468))

(assert (= (and b!753468 (not res!509082)) b!753454))

(assert (= (and b!753454 c!82571) b!753469))

(assert (= (and b!753454 (not c!82571)) b!753462))

(assert (= (and b!753454 res!509076) b!753456))

(assert (= (and b!753456 res!509088) b!753457))

(declare-fun m!701573 () Bool)

(assert (=> b!753468 m!701573))

(declare-fun m!701575 () Bool)

(assert (=> b!753468 m!701575))

(declare-fun m!701577 () Bool)

(assert (=> b!753456 m!701577))

(declare-fun m!701579 () Bool)

(assert (=> b!753456 m!701579))

(declare-fun m!701581 () Bool)

(assert (=> b!753455 m!701581))

(declare-fun m!701583 () Bool)

(assert (=> start!65684 m!701583))

(declare-fun m!701585 () Bool)

(assert (=> start!65684 m!701585))

(declare-fun m!701587 () Bool)

(assert (=> b!753465 m!701587))

(assert (=> b!753465 m!701587))

(declare-fun m!701589 () Bool)

(assert (=> b!753465 m!701589))

(declare-fun m!701591 () Bool)

(assert (=> b!753458 m!701591))

(declare-fun m!701593 () Bool)

(assert (=> b!753472 m!701593))

(assert (=> b!753460 m!701587))

(assert (=> b!753460 m!701587))

(declare-fun m!701595 () Bool)

(assert (=> b!753460 m!701595))

(declare-fun m!701597 () Bool)

(assert (=> b!753459 m!701597))

(assert (=> b!753470 m!701587))

(assert (=> b!753470 m!701587))

(declare-fun m!701599 () Bool)

(assert (=> b!753470 m!701599))

(declare-fun m!701601 () Bool)

(assert (=> b!753470 m!701601))

(declare-fun m!701603 () Bool)

(assert (=> b!753470 m!701603))

(declare-fun m!701605 () Bool)

(assert (=> b!753463 m!701605))

(declare-fun m!701607 () Bool)

(assert (=> b!753451 m!701607))

(assert (=> b!753451 m!701573))

(declare-fun m!701609 () Bool)

(assert (=> b!753451 m!701609))

(assert (=> b!753451 m!701607))

(declare-fun m!701611 () Bool)

(assert (=> b!753451 m!701611))

(declare-fun m!701613 () Bool)

(assert (=> b!753451 m!701613))

(declare-fun m!701615 () Bool)

(assert (=> b!753471 m!701615))

(assert (=> b!753467 m!701587))

(assert (=> b!753467 m!701587))

(declare-fun m!701617 () Bool)

(assert (=> b!753467 m!701617))

(assert (=> b!753467 m!701617))

(assert (=> b!753467 m!701587))

(declare-fun m!701619 () Bool)

(assert (=> b!753467 m!701619))

(assert (=> b!753453 m!701587))

(assert (=> b!753453 m!701587))

(declare-fun m!701621 () Bool)

(assert (=> b!753453 m!701621))

(assert (=> b!753461 m!701587))

(assert (=> b!753461 m!701587))

(declare-fun m!701623 () Bool)

(assert (=> b!753461 m!701623))

(assert (=> b!753473 m!701587))

(assert (=> b!753473 m!701587))

(assert (=> b!753473 m!701589))

(check-sat (not b!753453) (not b!753461) (not b!753460) (not b!753470) (not b!753465) (not b!753471) (not b!753463) (not b!753467) (not start!65684) (not b!753458) (not b!753472) (not b!753456) (not b!753451) (not b!753473) (not b!753459))
(check-sat)
