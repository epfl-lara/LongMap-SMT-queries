; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66268 () Bool)

(assert start!66268)

(declare-fun b!763540 () Bool)

(declare-fun res!516497 () Bool)

(declare-fun e!425407 () Bool)

(assert (=> b!763540 (=> (not res!516497) (not e!425407))))

(declare-datatypes ((array!42173 0))(
  ( (array!42174 (arr!20194 (Array (_ BitVec 32) (_ BitVec 64))) (size!20615 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42173)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763540 (= res!516497 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763541 () Bool)

(declare-fun res!516506 () Bool)

(assert (=> b!763541 (=> (not res!516506) (not e!425407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763541 (= res!516506 (validKeyInArray!0 k0!2102))))

(declare-fun b!763542 () Bool)

(declare-fun res!516501 () Bool)

(declare-fun e!425405 () Bool)

(assert (=> b!763542 (=> (not res!516501) (not e!425405))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42173 (_ BitVec 32)) Bool)

(assert (=> b!763542 (= res!516501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763543 () Bool)

(declare-fun res!516508 () Bool)

(declare-fun e!425409 () Bool)

(assert (=> b!763543 (=> (not res!516508) (not e!425409))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763543 (= res!516508 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20194 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763544 () Bool)

(declare-fun res!516502 () Bool)

(assert (=> b!763544 (=> (not res!516502) (not e!425405))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763544 (= res!516502 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20615 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20615 a!3186))))))

(declare-fun b!763545 () Bool)

(declare-fun res!516499 () Bool)

(assert (=> b!763545 (=> (not res!516499) (not e!425405))))

(declare-datatypes ((List!14196 0))(
  ( (Nil!14193) (Cons!14192 (h!15276 (_ BitVec 64)) (t!20511 List!14196)) )
))
(declare-fun arrayNoDuplicates!0 (array!42173 (_ BitVec 32) List!14196) Bool)

(assert (=> b!763545 (= res!516499 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14193))))

(declare-fun b!763546 () Bool)

(declare-fun res!516498 () Bool)

(assert (=> b!763546 (=> (not res!516498) (not e!425409))))

(declare-fun e!425406 () Bool)

(assert (=> b!763546 (= res!516498 e!425406)))

(declare-fun c!83908 () Bool)

(assert (=> b!763546 (= c!83908 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!516507 () Bool)

(assert (=> start!66268 (=> (not res!516507) (not e!425407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66268 (= res!516507 (validMask!0 mask!3328))))

(assert (=> start!66268 e!425407))

(assert (=> start!66268 true))

(declare-fun array_inv!15990 (array!42173) Bool)

(assert (=> start!66268 (array_inv!15990 a!3186)))

(declare-fun b!763547 () Bool)

(assert (=> b!763547 (= e!425409 false)))

(declare-datatypes ((SeekEntryResult!7794 0))(
  ( (MissingZero!7794 (index!33544 (_ BitVec 32))) (Found!7794 (index!33545 (_ BitVec 32))) (Intermediate!7794 (undefined!8606 Bool) (index!33546 (_ BitVec 32)) (x!64446 (_ BitVec 32))) (Undefined!7794) (MissingVacant!7794 (index!33547 (_ BitVec 32))) )
))
(declare-fun lt!339839 () SeekEntryResult!7794)

(declare-fun lt!339837 () (_ BitVec 64))

(declare-fun lt!339834 () array!42173)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42173 (_ BitVec 32)) SeekEntryResult!7794)

(assert (=> b!763547 (= lt!339839 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339837 lt!339834 mask!3328))))

(declare-fun lt!339835 () SeekEntryResult!7794)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763547 (= lt!339835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339837 mask!3328) lt!339837 lt!339834 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!763547 (= lt!339837 (select (store (arr!20194 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!763547 (= lt!339834 (array!42174 (store (arr!20194 a!3186) i!1173 k0!2102) (size!20615 a!3186)))))

(declare-fun b!763548 () Bool)

(declare-fun res!516503 () Bool)

(assert (=> b!763548 (=> (not res!516503) (not e!425407))))

(assert (=> b!763548 (= res!516503 (and (= (size!20615 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20615 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20615 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763549 () Bool)

(declare-fun lt!339838 () SeekEntryResult!7794)

(assert (=> b!763549 (= e!425406 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20194 a!3186) j!159) a!3186 mask!3328) lt!339838))))

(declare-fun b!763550 () Bool)

(assert (=> b!763550 (= e!425407 e!425405)))

(declare-fun res!516505 () Bool)

(assert (=> b!763550 (=> (not res!516505) (not e!425405))))

(declare-fun lt!339836 () SeekEntryResult!7794)

(assert (=> b!763550 (= res!516505 (or (= lt!339836 (MissingZero!7794 i!1173)) (= lt!339836 (MissingVacant!7794 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42173 (_ BitVec 32)) SeekEntryResult!7794)

(assert (=> b!763550 (= lt!339836 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763551 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42173 (_ BitVec 32)) SeekEntryResult!7794)

(assert (=> b!763551 (= e!425406 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20194 a!3186) j!159) a!3186 mask!3328) (Found!7794 j!159)))))

(declare-fun b!763552 () Bool)

(assert (=> b!763552 (= e!425405 e!425409)))

(declare-fun res!516500 () Bool)

(assert (=> b!763552 (=> (not res!516500) (not e!425409))))

(assert (=> b!763552 (= res!516500 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20194 a!3186) j!159) mask!3328) (select (arr!20194 a!3186) j!159) a!3186 mask!3328) lt!339838))))

(assert (=> b!763552 (= lt!339838 (Intermediate!7794 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763553 () Bool)

(declare-fun res!516504 () Bool)

(assert (=> b!763553 (=> (not res!516504) (not e!425407))))

(assert (=> b!763553 (= res!516504 (validKeyInArray!0 (select (arr!20194 a!3186) j!159)))))

(assert (= (and start!66268 res!516507) b!763548))

(assert (= (and b!763548 res!516503) b!763553))

(assert (= (and b!763553 res!516504) b!763541))

(assert (= (and b!763541 res!516506) b!763540))

(assert (= (and b!763540 res!516497) b!763550))

(assert (= (and b!763550 res!516505) b!763542))

(assert (= (and b!763542 res!516501) b!763545))

(assert (= (and b!763545 res!516499) b!763544))

(assert (= (and b!763544 res!516502) b!763552))

(assert (= (and b!763552 res!516500) b!763543))

(assert (= (and b!763543 res!516508) b!763546))

(assert (= (and b!763546 c!83908) b!763549))

(assert (= (and b!763546 (not c!83908)) b!763551))

(assert (= (and b!763546 res!516498) b!763547))

(declare-fun m!710009 () Bool)

(assert (=> b!763551 m!710009))

(assert (=> b!763551 m!710009))

(declare-fun m!710011 () Bool)

(assert (=> b!763551 m!710011))

(declare-fun m!710013 () Bool)

(assert (=> b!763541 m!710013))

(declare-fun m!710015 () Bool)

(assert (=> b!763540 m!710015))

(declare-fun m!710017 () Bool)

(assert (=> b!763545 m!710017))

(assert (=> b!763552 m!710009))

(assert (=> b!763552 m!710009))

(declare-fun m!710019 () Bool)

(assert (=> b!763552 m!710019))

(assert (=> b!763552 m!710019))

(assert (=> b!763552 m!710009))

(declare-fun m!710021 () Bool)

(assert (=> b!763552 m!710021))

(assert (=> b!763549 m!710009))

(assert (=> b!763549 m!710009))

(declare-fun m!710023 () Bool)

(assert (=> b!763549 m!710023))

(declare-fun m!710025 () Bool)

(assert (=> b!763542 m!710025))

(declare-fun m!710027 () Bool)

(assert (=> b!763550 m!710027))

(declare-fun m!710029 () Bool)

(assert (=> b!763547 m!710029))

(declare-fun m!710031 () Bool)

(assert (=> b!763547 m!710031))

(declare-fun m!710033 () Bool)

(assert (=> b!763547 m!710033))

(declare-fun m!710035 () Bool)

(assert (=> b!763547 m!710035))

(assert (=> b!763547 m!710031))

(declare-fun m!710037 () Bool)

(assert (=> b!763547 m!710037))

(declare-fun m!710039 () Bool)

(assert (=> b!763543 m!710039))

(assert (=> b!763553 m!710009))

(assert (=> b!763553 m!710009))

(declare-fun m!710041 () Bool)

(assert (=> b!763553 m!710041))

(declare-fun m!710043 () Bool)

(assert (=> start!66268 m!710043))

(declare-fun m!710045 () Bool)

(assert (=> start!66268 m!710045))

(check-sat (not b!763541) (not b!763545) (not b!763547) (not b!763551) (not b!763552) (not b!763540) (not b!763549) (not start!66268) (not b!763542) (not b!763550) (not b!763553))
(check-sat)
