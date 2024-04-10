; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65784 () Bool)

(assert start!65784)

(declare-fun b!756461 () Bool)

(declare-datatypes ((Unit!26148 0))(
  ( (Unit!26149) )
))
(declare-fun e!421809 () Unit!26148)

(declare-fun Unit!26150 () Unit!26148)

(assert (=> b!756461 (= e!421809 Unit!26150)))

(declare-fun b!756462 () Bool)

(declare-fun res!511474 () Bool)

(declare-fun e!421808 () Bool)

(assert (=> b!756462 (=> (not res!511474) (not e!421808))))

(declare-datatypes ((array!41957 0))(
  ( (array!41958 (arr!20092 (Array (_ BitVec 32) (_ BitVec 64))) (size!20513 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41957)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!756462 (= res!511474 (and (= (size!20513 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20513 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20513 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756463 () Bool)

(declare-fun res!511478 () Bool)

(declare-fun e!421817 () Bool)

(assert (=> b!756463 (=> (not res!511478) (not e!421817))))

(declare-datatypes ((List!14094 0))(
  ( (Nil!14091) (Cons!14090 (h!15162 (_ BitVec 64)) (t!20409 List!14094)) )
))
(declare-fun arrayNoDuplicates!0 (array!41957 (_ BitVec 32) List!14094) Bool)

(assert (=> b!756463 (= res!511478 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14091))))

(declare-fun b!756464 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7692 0))(
  ( (MissingZero!7692 (index!33136 (_ BitVec 32))) (Found!7692 (index!33137 (_ BitVec 32))) (Intermediate!7692 (undefined!8504 Bool) (index!33138 (_ BitVec 32)) (x!64034 (_ BitVec 32))) (Undefined!7692) (MissingVacant!7692 (index!33139 (_ BitVec 32))) )
))
(declare-fun lt!336801 () SeekEntryResult!7692)

(declare-fun e!421816 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41957 (_ BitVec 32)) SeekEntryResult!7692)

(assert (=> b!756464 (= e!421816 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20092 a!3186) j!159) a!3186 mask!3328) lt!336801))))

(declare-fun b!756465 () Bool)

(declare-fun e!421806 () Bool)

(assert (=> b!756465 (= e!421817 e!421806)))

(declare-fun res!511467 () Bool)

(assert (=> b!756465 (=> (not res!511467) (not e!421806))))

(declare-fun lt!336805 () SeekEntryResult!7692)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41957 (_ BitVec 32)) SeekEntryResult!7692)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756465 (= res!511467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20092 a!3186) j!159) mask!3328) (select (arr!20092 a!3186) j!159) a!3186 mask!3328) lt!336805))))

(assert (=> b!756465 (= lt!336805 (Intermediate!7692 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756467 () Bool)

(declare-fun e!421815 () Bool)

(declare-fun e!421811 () Bool)

(assert (=> b!756467 (= e!421815 (not e!421811))))

(declare-fun res!511462 () Bool)

(assert (=> b!756467 (=> res!511462 e!421811)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!336809 () SeekEntryResult!7692)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!756467 (= res!511462 (or (not ((_ is Intermediate!7692) lt!336809)) (bvslt x!1131 (x!64034 lt!336809)) (not (= x!1131 (x!64034 lt!336809))) (not (= index!1321 (index!33138 lt!336809)))))))

(assert (=> b!756467 e!421816))

(declare-fun res!511471 () Bool)

(assert (=> b!756467 (=> (not res!511471) (not e!421816))))

(declare-fun lt!336806 () SeekEntryResult!7692)

(assert (=> b!756467 (= res!511471 (= lt!336806 lt!336801))))

(assert (=> b!756467 (= lt!336801 (Found!7692 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41957 (_ BitVec 32)) SeekEntryResult!7692)

(assert (=> b!756467 (= lt!336806 (seekEntryOrOpen!0 (select (arr!20092 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41957 (_ BitVec 32)) Bool)

(assert (=> b!756467 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336800 () Unit!26148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26148)

(assert (=> b!756467 (= lt!336800 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756468 () Bool)

(declare-fun res!511464 () Bool)

(assert (=> b!756468 (=> (not res!511464) (not e!421817))))

(assert (=> b!756468 (= res!511464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756469 () Bool)

(declare-fun e!421810 () Bool)

(declare-fun lt!336808 () SeekEntryResult!7692)

(assert (=> b!756469 (= e!421810 (= lt!336806 lt!336808))))

(declare-fun b!756470 () Bool)

(declare-fun res!511475 () Bool)

(assert (=> b!756470 (=> (not res!511475) (not e!421806))))

(assert (=> b!756470 (= res!511475 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20092 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756471 () Bool)

(assert (=> b!756471 (= e!421808 e!421817)))

(declare-fun res!511460 () Bool)

(assert (=> b!756471 (=> (not res!511460) (not e!421817))))

(declare-fun lt!336803 () SeekEntryResult!7692)

(assert (=> b!756471 (= res!511460 (or (= lt!336803 (MissingZero!7692 i!1173)) (= lt!336803 (MissingVacant!7692 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!756471 (= lt!336803 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756472 () Bool)

(declare-fun e!421813 () Bool)

(assert (=> b!756472 (= e!421811 e!421813)))

(declare-fun res!511466 () Bool)

(assert (=> b!756472 (=> res!511466 e!421813)))

(assert (=> b!756472 (= res!511466 (not (= lt!336808 lt!336801)))))

(assert (=> b!756472 (= lt!336808 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20092 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756473 () Bool)

(declare-fun res!511468 () Bool)

(assert (=> b!756473 (=> (not res!511468) (not e!421806))))

(declare-fun e!421814 () Bool)

(assert (=> b!756473 (= res!511468 e!421814)))

(declare-fun c!82882 () Bool)

(assert (=> b!756473 (= c!82882 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756474 () Bool)

(declare-fun res!511477 () Bool)

(assert (=> b!756474 (=> (not res!511477) (not e!421817))))

(assert (=> b!756474 (= res!511477 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20513 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20513 a!3186))))))

(declare-fun b!756475 () Bool)

(declare-fun e!421807 () Bool)

(assert (=> b!756475 (= e!421807 true)))

(assert (=> b!756475 e!421810))

(declare-fun res!511469 () Bool)

(assert (=> b!756475 (=> (not res!511469) (not e!421810))))

(declare-fun lt!336798 () (_ BitVec 64))

(assert (=> b!756475 (= res!511469 (= lt!336798 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336799 () Unit!26148)

(assert (=> b!756475 (= lt!336799 e!421809)))

(declare-fun c!82881 () Bool)

(assert (=> b!756475 (= c!82881 (= lt!336798 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756476 () Bool)

(assert (=> b!756476 (= e!421813 e!421807)))

(declare-fun res!511476 () Bool)

(assert (=> b!756476 (=> res!511476 e!421807)))

(declare-fun lt!336804 () (_ BitVec 64))

(assert (=> b!756476 (= res!511476 (= lt!336798 lt!336804))))

(assert (=> b!756476 (= lt!336798 (select (store (arr!20092 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756477 () Bool)

(assert (=> b!756477 (= e!421814 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20092 a!3186) j!159) a!3186 mask!3328) lt!336805))))

(declare-fun res!511465 () Bool)

(assert (=> start!65784 (=> (not res!511465) (not e!421808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65784 (= res!511465 (validMask!0 mask!3328))))

(assert (=> start!65784 e!421808))

(assert (=> start!65784 true))

(declare-fun array_inv!15888 (array!41957) Bool)

(assert (=> start!65784 (array_inv!15888 a!3186)))

(declare-fun b!756466 () Bool)

(declare-fun Unit!26151 () Unit!26148)

(assert (=> b!756466 (= e!421809 Unit!26151)))

(assert (=> b!756466 false))

(declare-fun b!756478 () Bool)

(declare-fun res!511473 () Bool)

(assert (=> b!756478 (=> (not res!511473) (not e!421808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756478 (= res!511473 (validKeyInArray!0 k0!2102))))

(declare-fun b!756479 () Bool)

(declare-fun res!511470 () Bool)

(assert (=> b!756479 (=> (not res!511470) (not e!421810))))

(declare-fun lt!336802 () array!41957)

(assert (=> b!756479 (= res!511470 (= (seekEntryOrOpen!0 lt!336804 lt!336802 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336804 lt!336802 mask!3328)))))

(declare-fun b!756480 () Bool)

(declare-fun res!511461 () Bool)

(assert (=> b!756480 (=> (not res!511461) (not e!421808))))

(assert (=> b!756480 (= res!511461 (validKeyInArray!0 (select (arr!20092 a!3186) j!159)))))

(declare-fun b!756481 () Bool)

(declare-fun res!511472 () Bool)

(assert (=> b!756481 (=> (not res!511472) (not e!421808))))

(declare-fun arrayContainsKey!0 (array!41957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756481 (= res!511472 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756482 () Bool)

(assert (=> b!756482 (= e!421806 e!421815)))

(declare-fun res!511463 () Bool)

(assert (=> b!756482 (=> (not res!511463) (not e!421815))))

(declare-fun lt!336807 () SeekEntryResult!7692)

(assert (=> b!756482 (= res!511463 (= lt!336807 lt!336809))))

(assert (=> b!756482 (= lt!336809 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336804 lt!336802 mask!3328))))

(assert (=> b!756482 (= lt!336807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336804 mask!3328) lt!336804 lt!336802 mask!3328))))

(assert (=> b!756482 (= lt!336804 (select (store (arr!20092 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756482 (= lt!336802 (array!41958 (store (arr!20092 a!3186) i!1173 k0!2102) (size!20513 a!3186)))))

(declare-fun b!756483 () Bool)

(assert (=> b!756483 (= e!421814 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20092 a!3186) j!159) a!3186 mask!3328) (Found!7692 j!159)))))

(assert (= (and start!65784 res!511465) b!756462))

(assert (= (and b!756462 res!511474) b!756480))

(assert (= (and b!756480 res!511461) b!756478))

(assert (= (and b!756478 res!511473) b!756481))

(assert (= (and b!756481 res!511472) b!756471))

(assert (= (and b!756471 res!511460) b!756468))

(assert (= (and b!756468 res!511464) b!756463))

(assert (= (and b!756463 res!511478) b!756474))

(assert (= (and b!756474 res!511477) b!756465))

(assert (= (and b!756465 res!511467) b!756470))

(assert (= (and b!756470 res!511475) b!756473))

(assert (= (and b!756473 c!82882) b!756477))

(assert (= (and b!756473 (not c!82882)) b!756483))

(assert (= (and b!756473 res!511468) b!756482))

(assert (= (and b!756482 res!511463) b!756467))

(assert (= (and b!756467 res!511471) b!756464))

(assert (= (and b!756467 (not res!511462)) b!756472))

(assert (= (and b!756472 (not res!511466)) b!756476))

(assert (= (and b!756476 (not res!511476)) b!756475))

(assert (= (and b!756475 c!82881) b!756466))

(assert (= (and b!756475 (not c!82881)) b!756461))

(assert (= (and b!756475 res!511469) b!756479))

(assert (= (and b!756479 res!511470) b!756469))

(declare-fun m!704411 () Bool)

(assert (=> b!756479 m!704411))

(declare-fun m!704413 () Bool)

(assert (=> b!756479 m!704413))

(declare-fun m!704415 () Bool)

(assert (=> b!756480 m!704415))

(assert (=> b!756480 m!704415))

(declare-fun m!704417 () Bool)

(assert (=> b!756480 m!704417))

(declare-fun m!704419 () Bool)

(assert (=> b!756463 m!704419))

(assert (=> b!756483 m!704415))

(assert (=> b!756483 m!704415))

(declare-fun m!704421 () Bool)

(assert (=> b!756483 m!704421))

(declare-fun m!704423 () Bool)

(assert (=> b!756478 m!704423))

(declare-fun m!704425 () Bool)

(assert (=> b!756482 m!704425))

(declare-fun m!704427 () Bool)

(assert (=> b!756482 m!704427))

(assert (=> b!756482 m!704427))

(declare-fun m!704429 () Bool)

(assert (=> b!756482 m!704429))

(declare-fun m!704431 () Bool)

(assert (=> b!756482 m!704431))

(declare-fun m!704433 () Bool)

(assert (=> b!756482 m!704433))

(declare-fun m!704435 () Bool)

(assert (=> b!756481 m!704435))

(declare-fun m!704437 () Bool)

(assert (=> b!756471 m!704437))

(assert (=> b!756472 m!704415))

(assert (=> b!756472 m!704415))

(assert (=> b!756472 m!704421))

(assert (=> b!756477 m!704415))

(assert (=> b!756477 m!704415))

(declare-fun m!704439 () Bool)

(assert (=> b!756477 m!704439))

(declare-fun m!704441 () Bool)

(assert (=> start!65784 m!704441))

(declare-fun m!704443 () Bool)

(assert (=> start!65784 m!704443))

(assert (=> b!756467 m!704415))

(assert (=> b!756467 m!704415))

(declare-fun m!704445 () Bool)

(assert (=> b!756467 m!704445))

(declare-fun m!704447 () Bool)

(assert (=> b!756467 m!704447))

(declare-fun m!704449 () Bool)

(assert (=> b!756467 m!704449))

(assert (=> b!756464 m!704415))

(assert (=> b!756464 m!704415))

(declare-fun m!704451 () Bool)

(assert (=> b!756464 m!704451))

(declare-fun m!704453 () Bool)

(assert (=> b!756470 m!704453))

(declare-fun m!704455 () Bool)

(assert (=> b!756468 m!704455))

(assert (=> b!756476 m!704425))

(declare-fun m!704457 () Bool)

(assert (=> b!756476 m!704457))

(assert (=> b!756465 m!704415))

(assert (=> b!756465 m!704415))

(declare-fun m!704459 () Bool)

(assert (=> b!756465 m!704459))

(assert (=> b!756465 m!704459))

(assert (=> b!756465 m!704415))

(declare-fun m!704461 () Bool)

(assert (=> b!756465 m!704461))

(check-sat (not b!756463) (not b!756464) (not b!756483) (not b!756467) (not b!756471) (not b!756481) (not b!756472) (not b!756477) (not b!756479) (not b!756465) (not b!756468) (not b!756482) (not start!65784) (not b!756480) (not b!756478))
(check-sat)
