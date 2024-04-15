; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65438 () Bool)

(assert start!65438)

(declare-datatypes ((array!41628 0))(
  ( (array!41629 (arr!19928 (Array (_ BitVec 32) (_ BitVec 64))) (size!20349 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41628)

(declare-datatypes ((SeekEntryResult!7525 0))(
  ( (MissingZero!7525 (index!32468 (_ BitVec 32))) (Found!7525 (index!32469 (_ BitVec 32))) (Intermediate!7525 (undefined!8337 Bool) (index!32470 (_ BitVec 32)) (x!63430 (_ BitVec 32))) (Undefined!7525) (MissingVacant!7525 (index!32471 (_ BitVec 32))) )
))
(declare-fun lt!331144 () SeekEntryResult!7525)

(declare-fun b!745575 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!416389 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41628 (_ BitVec 32)) SeekEntryResult!7525)

(assert (=> b!745575 (= e!416389 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19928 a!3186) j!159) a!3186 mask!3328) lt!331144))))

(declare-fun res!502549 () Bool)

(declare-fun e!416382 () Bool)

(assert (=> start!65438 (=> (not res!502549) (not e!416382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65438 (= res!502549 (validMask!0 mask!3328))))

(assert (=> start!65438 e!416382))

(assert (=> start!65438 true))

(declare-fun array_inv!15811 (array!41628) Bool)

(assert (=> start!65438 (array_inv!15811 a!3186)))

(declare-fun b!745576 () Bool)

(declare-fun res!502559 () Bool)

(assert (=> b!745576 (=> (not res!502559) (not e!416382))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745576 (= res!502559 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745577 () Bool)

(declare-fun res!502562 () Bool)

(declare-fun e!416388 () Bool)

(assert (=> b!745577 (=> (not res!502562) (not e!416388))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745577 (= res!502562 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20349 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20349 a!3186))))))

(declare-fun b!745578 () Bool)

(declare-fun res!502558 () Bool)

(assert (=> b!745578 (=> (not res!502558) (not e!416382))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745578 (= res!502558 (and (= (size!20349 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20349 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20349 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745579 () Bool)

(declare-fun res!502560 () Bool)

(assert (=> b!745579 (=> (not res!502560) (not e!416382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745579 (= res!502560 (validKeyInArray!0 k0!2102))))

(declare-fun b!745580 () Bool)

(declare-fun res!502552 () Bool)

(declare-fun e!416383 () Bool)

(assert (=> b!745580 (=> (not res!502552) (not e!416383))))

(assert (=> b!745580 (= res!502552 e!416389)))

(declare-fun c!81894 () Bool)

(assert (=> b!745580 (= c!81894 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745581 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41628 (_ BitVec 32)) SeekEntryResult!7525)

(assert (=> b!745581 (= e!416389 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19928 a!3186) j!159) a!3186 mask!3328) (Found!7525 j!159)))))

(declare-fun b!745582 () Bool)

(declare-fun e!416381 () Bool)

(declare-fun e!416386 () Bool)

(assert (=> b!745582 (= e!416381 e!416386)))

(declare-fun res!502548 () Bool)

(assert (=> b!745582 (=> res!502548 e!416386)))

(declare-fun lt!331145 () (_ BitVec 64))

(declare-fun lt!331140 () SeekEntryResult!7525)

(declare-fun lt!331141 () SeekEntryResult!7525)

(assert (=> b!745582 (= res!502548 (or (not (= lt!331140 lt!331141)) (= (select (store (arr!19928 a!3186) i!1173 k0!2102) index!1321) lt!331145) (not (= (select (store (arr!19928 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!745582 (= lt!331140 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19928 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745583 () Bool)

(declare-fun e!416387 () Bool)

(assert (=> b!745583 (= e!416387 (not e!416381))))

(declare-fun res!502553 () Bool)

(assert (=> b!745583 (=> res!502553 e!416381)))

(declare-fun lt!331137 () SeekEntryResult!7525)

(get-info :version)

(assert (=> b!745583 (= res!502553 (or (not ((_ is Intermediate!7525) lt!331137)) (bvslt x!1131 (x!63430 lt!331137)) (not (= x!1131 (x!63430 lt!331137))) (not (= index!1321 (index!32470 lt!331137)))))))

(declare-fun e!416384 () Bool)

(assert (=> b!745583 e!416384))

(declare-fun res!502550 () Bool)

(assert (=> b!745583 (=> (not res!502550) (not e!416384))))

(declare-fun lt!331139 () SeekEntryResult!7525)

(assert (=> b!745583 (= res!502550 (= lt!331139 lt!331141))))

(assert (=> b!745583 (= lt!331141 (Found!7525 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41628 (_ BitVec 32)) SeekEntryResult!7525)

(assert (=> b!745583 (= lt!331139 (seekEntryOrOpen!0 (select (arr!19928 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41628 (_ BitVec 32)) Bool)

(assert (=> b!745583 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25502 0))(
  ( (Unit!25503) )
))
(declare-fun lt!331136 () Unit!25502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25502)

(assert (=> b!745583 (= lt!331136 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745584 () Bool)

(declare-fun res!502551 () Bool)

(assert (=> b!745584 (=> (not res!502551) (not e!416388))))

(assert (=> b!745584 (= res!502551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745585 () Bool)

(assert (=> b!745585 (= e!416388 e!416383)))

(declare-fun res!502563 () Bool)

(assert (=> b!745585 (=> (not res!502563) (not e!416383))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745585 (= res!502563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19928 a!3186) j!159) mask!3328) (select (arr!19928 a!3186) j!159) a!3186 mask!3328) lt!331144))))

(assert (=> b!745585 (= lt!331144 (Intermediate!7525 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745586 () Bool)

(assert (=> b!745586 (= e!416386 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!745586 (= lt!331139 lt!331140)))

(declare-fun b!745587 () Bool)

(declare-fun res!502555 () Bool)

(assert (=> b!745587 (=> (not res!502555) (not e!416383))))

(assert (=> b!745587 (= res!502555 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19928 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745588 () Bool)

(declare-fun res!502561 () Bool)

(assert (=> b!745588 (=> (not res!502561) (not e!416382))))

(assert (=> b!745588 (= res!502561 (validKeyInArray!0 (select (arr!19928 a!3186) j!159)))))

(declare-fun b!745589 () Bool)

(declare-fun res!502554 () Bool)

(assert (=> b!745589 (=> (not res!502554) (not e!416388))))

(declare-datatypes ((List!13969 0))(
  ( (Nil!13966) (Cons!13965 (h!15037 (_ BitVec 64)) (t!20275 List!13969)) )
))
(declare-fun arrayNoDuplicates!0 (array!41628 (_ BitVec 32) List!13969) Bool)

(assert (=> b!745589 (= res!502554 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13966))))

(declare-fun b!745590 () Bool)

(assert (=> b!745590 (= e!416383 e!416387)))

(declare-fun res!502556 () Bool)

(assert (=> b!745590 (=> (not res!502556) (not e!416387))))

(declare-fun lt!331143 () SeekEntryResult!7525)

(assert (=> b!745590 (= res!502556 (= lt!331143 lt!331137))))

(declare-fun lt!331142 () array!41628)

(assert (=> b!745590 (= lt!331137 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331145 lt!331142 mask!3328))))

(assert (=> b!745590 (= lt!331143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331145 mask!3328) lt!331145 lt!331142 mask!3328))))

(assert (=> b!745590 (= lt!331145 (select (store (arr!19928 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745590 (= lt!331142 (array!41629 (store (arr!19928 a!3186) i!1173 k0!2102) (size!20349 a!3186)))))

(declare-fun b!745591 () Bool)

(assert (=> b!745591 (= e!416384 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19928 a!3186) j!159) a!3186 mask!3328) lt!331141))))

(declare-fun b!745592 () Bool)

(assert (=> b!745592 (= e!416382 e!416388)))

(declare-fun res!502557 () Bool)

(assert (=> b!745592 (=> (not res!502557) (not e!416388))))

(declare-fun lt!331138 () SeekEntryResult!7525)

(assert (=> b!745592 (= res!502557 (or (= lt!331138 (MissingZero!7525 i!1173)) (= lt!331138 (MissingVacant!7525 i!1173))))))

(assert (=> b!745592 (= lt!331138 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65438 res!502549) b!745578))

(assert (= (and b!745578 res!502558) b!745588))

(assert (= (and b!745588 res!502561) b!745579))

(assert (= (and b!745579 res!502560) b!745576))

(assert (= (and b!745576 res!502559) b!745592))

(assert (= (and b!745592 res!502557) b!745584))

(assert (= (and b!745584 res!502551) b!745589))

(assert (= (and b!745589 res!502554) b!745577))

(assert (= (and b!745577 res!502562) b!745585))

(assert (= (and b!745585 res!502563) b!745587))

(assert (= (and b!745587 res!502555) b!745580))

(assert (= (and b!745580 c!81894) b!745575))

(assert (= (and b!745580 (not c!81894)) b!745581))

(assert (= (and b!745580 res!502552) b!745590))

(assert (= (and b!745590 res!502556) b!745583))

(assert (= (and b!745583 res!502550) b!745591))

(assert (= (and b!745583 (not res!502553)) b!745582))

(assert (= (and b!745582 (not res!502548)) b!745586))

(declare-fun m!695393 () Bool)

(assert (=> b!745583 m!695393))

(assert (=> b!745583 m!695393))

(declare-fun m!695395 () Bool)

(assert (=> b!745583 m!695395))

(declare-fun m!695397 () Bool)

(assert (=> b!745583 m!695397))

(declare-fun m!695399 () Bool)

(assert (=> b!745583 m!695399))

(declare-fun m!695401 () Bool)

(assert (=> b!745587 m!695401))

(declare-fun m!695403 () Bool)

(assert (=> b!745590 m!695403))

(declare-fun m!695405 () Bool)

(assert (=> b!745590 m!695405))

(declare-fun m!695407 () Bool)

(assert (=> b!745590 m!695407))

(declare-fun m!695409 () Bool)

(assert (=> b!745590 m!695409))

(assert (=> b!745590 m!695403))

(declare-fun m!695411 () Bool)

(assert (=> b!745590 m!695411))

(assert (=> b!745582 m!695407))

(declare-fun m!695413 () Bool)

(assert (=> b!745582 m!695413))

(assert (=> b!745582 m!695393))

(assert (=> b!745582 m!695393))

(declare-fun m!695415 () Bool)

(assert (=> b!745582 m!695415))

(assert (=> b!745575 m!695393))

(assert (=> b!745575 m!695393))

(declare-fun m!695417 () Bool)

(assert (=> b!745575 m!695417))

(assert (=> b!745588 m!695393))

(assert (=> b!745588 m!695393))

(declare-fun m!695419 () Bool)

(assert (=> b!745588 m!695419))

(declare-fun m!695421 () Bool)

(assert (=> b!745589 m!695421))

(assert (=> b!745591 m!695393))

(assert (=> b!745591 m!695393))

(declare-fun m!695423 () Bool)

(assert (=> b!745591 m!695423))

(assert (=> b!745581 m!695393))

(assert (=> b!745581 m!695393))

(assert (=> b!745581 m!695415))

(declare-fun m!695425 () Bool)

(assert (=> b!745579 m!695425))

(declare-fun m!695427 () Bool)

(assert (=> b!745576 m!695427))

(declare-fun m!695429 () Bool)

(assert (=> b!745584 m!695429))

(declare-fun m!695431 () Bool)

(assert (=> b!745592 m!695431))

(declare-fun m!695433 () Bool)

(assert (=> start!65438 m!695433))

(declare-fun m!695435 () Bool)

(assert (=> start!65438 m!695435))

(assert (=> b!745585 m!695393))

(assert (=> b!745585 m!695393))

(declare-fun m!695437 () Bool)

(assert (=> b!745585 m!695437))

(assert (=> b!745585 m!695437))

(assert (=> b!745585 m!695393))

(declare-fun m!695439 () Bool)

(assert (=> b!745585 m!695439))

(check-sat (not b!745582) (not b!745592) (not b!745588) (not b!745583) (not b!745589) (not b!745591) (not b!745576) (not b!745590) (not start!65438) (not b!745581) (not b!745584) (not b!745575) (not b!745585) (not b!745579))
(check-sat)
