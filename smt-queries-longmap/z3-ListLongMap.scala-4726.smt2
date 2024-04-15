; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65396 () Bool)

(assert start!65396)

(declare-fun b!744423 () Bool)

(declare-fun e!415822 () Bool)

(declare-fun e!415817 () Bool)

(assert (=> b!744423 (= e!415822 e!415817)))

(declare-fun res!501530 () Bool)

(assert (=> b!744423 (=> (not res!501530) (not e!415817))))

(declare-datatypes ((array!41586 0))(
  ( (array!41587 (arr!19907 (Array (_ BitVec 32) (_ BitVec 64))) (size!20328 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41586)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7504 0))(
  ( (MissingZero!7504 (index!32384 (_ BitVec 32))) (Found!7504 (index!32385 (_ BitVec 32))) (Intermediate!7504 (undefined!8316 Bool) (index!32386 (_ BitVec 32)) (x!63353 (_ BitVec 32))) (Undefined!7504) (MissingVacant!7504 (index!32387 (_ BitVec 32))) )
))
(declare-fun lt!330576 () SeekEntryResult!7504)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41586 (_ BitVec 32)) SeekEntryResult!7504)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744423 (= res!501530 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19907 a!3186) j!159) mask!3328) (select (arr!19907 a!3186) j!159) a!3186 mask!3328) lt!330576))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744423 (= lt!330576 (Intermediate!7504 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!330583 () SeekEntryResult!7504)

(declare-fun e!415819 () Bool)

(declare-fun b!744424 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41586 (_ BitVec 32)) SeekEntryResult!7504)

(assert (=> b!744424 (= e!415819 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19907 a!3186) j!159) a!3186 mask!3328) lt!330583))))

(declare-fun b!744425 () Bool)

(declare-fun res!501527 () Bool)

(declare-fun e!415814 () Bool)

(assert (=> b!744425 (=> (not res!501527) (not e!415814))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744425 (= res!501527 (and (= (size!20328 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20328 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20328 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744426 () Bool)

(declare-fun e!415821 () Bool)

(assert (=> b!744426 (= e!415821 e!415819)))

(declare-fun res!501525 () Bool)

(assert (=> b!744426 (=> (not res!501525) (not e!415819))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41586 (_ BitVec 32)) SeekEntryResult!7504)

(assert (=> b!744426 (= res!501525 (= (seekEntryOrOpen!0 (select (arr!19907 a!3186) j!159) a!3186 mask!3328) lt!330583))))

(assert (=> b!744426 (= lt!330583 (Found!7504 j!159))))

(declare-fun b!744427 () Bool)

(assert (=> b!744427 (= e!415814 e!415822)))

(declare-fun res!501524 () Bool)

(assert (=> b!744427 (=> (not res!501524) (not e!415822))))

(declare-fun lt!330577 () SeekEntryResult!7504)

(assert (=> b!744427 (= res!501524 (or (= lt!330577 (MissingZero!7504 i!1173)) (= lt!330577 (MissingVacant!7504 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!744427 (= lt!330577 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744428 () Bool)

(declare-fun res!501522 () Bool)

(assert (=> b!744428 (=> (not res!501522) (not e!415822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41586 (_ BitVec 32)) Bool)

(assert (=> b!744428 (= res!501522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744429 () Bool)

(declare-fun res!501528 () Bool)

(assert (=> b!744429 (=> (not res!501528) (not e!415814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744429 (= res!501528 (validKeyInArray!0 (select (arr!19907 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!744430 () Bool)

(declare-fun e!415820 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!744430 (= e!415820 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19907 a!3186) j!159) a!3186 mask!3328) lt!330576))))

(declare-fun b!744431 () Bool)

(declare-fun res!501535 () Bool)

(assert (=> b!744431 (=> (not res!501535) (not e!415817))))

(assert (=> b!744431 (= res!501535 e!415820)))

(declare-fun c!81831 () Bool)

(assert (=> b!744431 (= c!81831 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744432 () Bool)

(declare-fun res!501532 () Bool)

(assert (=> b!744432 (=> (not res!501532) (not e!415822))))

(assert (=> b!744432 (= res!501532 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20328 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20328 a!3186))))))

(declare-fun b!744433 () Bool)

(declare-fun res!501533 () Bool)

(assert (=> b!744433 (=> (not res!501533) (not e!415817))))

(assert (=> b!744433 (= res!501533 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19907 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744434 () Bool)

(assert (=> b!744434 (= e!415820 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19907 a!3186) j!159) a!3186 mask!3328) (Found!7504 j!159)))))

(declare-fun b!744435 () Bool)

(declare-fun e!415816 () Bool)

(declare-fun e!415815 () Bool)

(assert (=> b!744435 (= e!415816 (not e!415815))))

(declare-fun res!501536 () Bool)

(assert (=> b!744435 (=> res!501536 e!415815)))

(declare-fun lt!330582 () SeekEntryResult!7504)

(get-info :version)

(assert (=> b!744435 (= res!501536 (or (not ((_ is Intermediate!7504) lt!330582)) (bvslt x!1131 (x!63353 lt!330582)) (not (= x!1131 (x!63353 lt!330582))) (not (= index!1321 (index!32386 lt!330582)))))))

(assert (=> b!744435 e!415821))

(declare-fun res!501526 () Bool)

(assert (=> b!744435 (=> (not res!501526) (not e!415821))))

(assert (=> b!744435 (= res!501526 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25460 0))(
  ( (Unit!25461) )
))
(declare-fun lt!330581 () Unit!25460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25460)

(assert (=> b!744435 (= lt!330581 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744436 () Bool)

(assert (=> b!744436 (= e!415817 e!415816)))

(declare-fun res!501523 () Bool)

(assert (=> b!744436 (=> (not res!501523) (not e!415816))))

(declare-fun lt!330579 () SeekEntryResult!7504)

(assert (=> b!744436 (= res!501523 (= lt!330579 lt!330582))))

(declare-fun lt!330578 () array!41586)

(declare-fun lt!330580 () (_ BitVec 64))

(assert (=> b!744436 (= lt!330582 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330580 lt!330578 mask!3328))))

(assert (=> b!744436 (= lt!330579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330580 mask!3328) lt!330580 lt!330578 mask!3328))))

(assert (=> b!744436 (= lt!330580 (select (store (arr!19907 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744436 (= lt!330578 (array!41587 (store (arr!19907 a!3186) i!1173 k0!2102) (size!20328 a!3186)))))

(declare-fun res!501531 () Bool)

(assert (=> start!65396 (=> (not res!501531) (not e!415814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65396 (= res!501531 (validMask!0 mask!3328))))

(assert (=> start!65396 e!415814))

(assert (=> start!65396 true))

(declare-fun array_inv!15790 (array!41586) Bool)

(assert (=> start!65396 (array_inv!15790 a!3186)))

(declare-fun b!744437 () Bool)

(declare-fun res!501537 () Bool)

(assert (=> b!744437 (=> (not res!501537) (not e!415814))))

(declare-fun arrayContainsKey!0 (array!41586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744437 (= res!501537 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744438 () Bool)

(declare-fun res!501529 () Bool)

(assert (=> b!744438 (=> (not res!501529) (not e!415822))))

(declare-datatypes ((List!13948 0))(
  ( (Nil!13945) (Cons!13944 (h!15016 (_ BitVec 64)) (t!20254 List!13948)) )
))
(declare-fun arrayNoDuplicates!0 (array!41586 (_ BitVec 32) List!13948) Bool)

(assert (=> b!744438 (= res!501529 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13945))))

(declare-fun b!744439 () Bool)

(assert (=> b!744439 (= e!415815 true)))

(declare-fun lt!330584 () SeekEntryResult!7504)

(assert (=> b!744439 (= lt!330584 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19907 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744440 () Bool)

(declare-fun res!501534 () Bool)

(assert (=> b!744440 (=> (not res!501534) (not e!415814))))

(assert (=> b!744440 (= res!501534 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65396 res!501531) b!744425))

(assert (= (and b!744425 res!501527) b!744429))

(assert (= (and b!744429 res!501528) b!744440))

(assert (= (and b!744440 res!501534) b!744437))

(assert (= (and b!744437 res!501537) b!744427))

(assert (= (and b!744427 res!501524) b!744428))

(assert (= (and b!744428 res!501522) b!744438))

(assert (= (and b!744438 res!501529) b!744432))

(assert (= (and b!744432 res!501532) b!744423))

(assert (= (and b!744423 res!501530) b!744433))

(assert (= (and b!744433 res!501533) b!744431))

(assert (= (and b!744431 c!81831) b!744430))

(assert (= (and b!744431 (not c!81831)) b!744434))

(assert (= (and b!744431 res!501535) b!744436))

(assert (= (and b!744436 res!501523) b!744435))

(assert (= (and b!744435 res!501526) b!744426))

(assert (= (and b!744426 res!501525) b!744424))

(assert (= (and b!744435 (not res!501536)) b!744439))

(declare-fun m!694409 () Bool)

(assert (=> b!744438 m!694409))

(declare-fun m!694411 () Bool)

(assert (=> b!744440 m!694411))

(declare-fun m!694413 () Bool)

(assert (=> start!65396 m!694413))

(declare-fun m!694415 () Bool)

(assert (=> start!65396 m!694415))

(declare-fun m!694417 () Bool)

(assert (=> b!744437 m!694417))

(declare-fun m!694419 () Bool)

(assert (=> b!744427 m!694419))

(declare-fun m!694421 () Bool)

(assert (=> b!744429 m!694421))

(assert (=> b!744429 m!694421))

(declare-fun m!694423 () Bool)

(assert (=> b!744429 m!694423))

(assert (=> b!744434 m!694421))

(assert (=> b!744434 m!694421))

(declare-fun m!694425 () Bool)

(assert (=> b!744434 m!694425))

(assert (=> b!744423 m!694421))

(assert (=> b!744423 m!694421))

(declare-fun m!694427 () Bool)

(assert (=> b!744423 m!694427))

(assert (=> b!744423 m!694427))

(assert (=> b!744423 m!694421))

(declare-fun m!694429 () Bool)

(assert (=> b!744423 m!694429))

(assert (=> b!744430 m!694421))

(assert (=> b!744430 m!694421))

(declare-fun m!694431 () Bool)

(assert (=> b!744430 m!694431))

(assert (=> b!744426 m!694421))

(assert (=> b!744426 m!694421))

(declare-fun m!694433 () Bool)

(assert (=> b!744426 m!694433))

(assert (=> b!744439 m!694421))

(assert (=> b!744439 m!694421))

(assert (=> b!744439 m!694425))

(declare-fun m!694435 () Bool)

(assert (=> b!744435 m!694435))

(declare-fun m!694437 () Bool)

(assert (=> b!744435 m!694437))

(declare-fun m!694439 () Bool)

(assert (=> b!744436 m!694439))

(declare-fun m!694441 () Bool)

(assert (=> b!744436 m!694441))

(declare-fun m!694443 () Bool)

(assert (=> b!744436 m!694443))

(assert (=> b!744436 m!694441))

(declare-fun m!694445 () Bool)

(assert (=> b!744436 m!694445))

(declare-fun m!694447 () Bool)

(assert (=> b!744436 m!694447))

(declare-fun m!694449 () Bool)

(assert (=> b!744433 m!694449))

(assert (=> b!744424 m!694421))

(assert (=> b!744424 m!694421))

(declare-fun m!694451 () Bool)

(assert (=> b!744424 m!694451))

(declare-fun m!694453 () Bool)

(assert (=> b!744428 m!694453))

(check-sat (not b!744439) (not b!744428) (not b!744440) (not start!65396) (not b!744434) (not b!744429) (not b!744424) (not b!744426) (not b!744430) (not b!744423) (not b!744435) (not b!744427) (not b!744437) (not b!744436) (not b!744438))
(check-sat)
