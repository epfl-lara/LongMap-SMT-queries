; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65508 () Bool)

(assert start!65508)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41551 0))(
  ( (array!41552 (arr!19885 (Array (_ BitVec 32) (_ BitVec 64))) (size!20305 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41551)

(declare-fun b!744428 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!415962 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7441 0))(
  ( (MissingZero!7441 (index!32132 (_ BitVec 32))) (Found!7441 (index!32133 (_ BitVec 32))) (Intermediate!7441 (undefined!8253 Bool) (index!32134 (_ BitVec 32)) (x!63259 (_ BitVec 32))) (Undefined!7441) (MissingVacant!7441 (index!32135 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41551 (_ BitVec 32)) SeekEntryResult!7441)

(assert (=> b!744428 (= e!415962 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19885 a!3186) j!159) a!3186 mask!3328) (Found!7441 j!159)))))

(declare-fun lt!330664 () SeekEntryResult!7441)

(declare-fun b!744429 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!415966 () Bool)

(assert (=> b!744429 (= e!415966 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19885 a!3186) j!159) a!3186 mask!3328) lt!330664))))

(declare-fun b!744430 () Bool)

(declare-fun res!501062 () Bool)

(declare-fun e!415963 () Bool)

(assert (=> b!744430 (=> (not res!501062) (not e!415963))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744430 (= res!501062 (and (= (size!20305 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20305 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20305 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744431 () Bool)

(declare-fun e!415967 () Bool)

(assert (=> b!744431 (= e!415967 e!415966)))

(declare-fun res!501055 () Bool)

(assert (=> b!744431 (=> (not res!501055) (not e!415966))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41551 (_ BitVec 32)) SeekEntryResult!7441)

(assert (=> b!744431 (= res!501055 (= (seekEntryOrOpen!0 (select (arr!19885 a!3186) j!159) a!3186 mask!3328) lt!330664))))

(assert (=> b!744431 (= lt!330664 (Found!7441 j!159))))

(declare-fun b!744432 () Bool)

(declare-fun res!501056 () Bool)

(declare-fun e!415965 () Bool)

(assert (=> b!744432 (=> (not res!501056) (not e!415965))))

(assert (=> b!744432 (= res!501056 e!415962)))

(declare-fun c!82070 () Bool)

(assert (=> b!744432 (= c!82070 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744433 () Bool)

(declare-fun res!501065 () Bool)

(assert (=> b!744433 (=> (not res!501065) (not e!415963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744433 (= res!501065 (validKeyInArray!0 (select (arr!19885 a!3186) j!159)))))

(declare-fun b!744434 () Bool)

(declare-fun e!415964 () Bool)

(assert (=> b!744434 (= e!415964 e!415965)))

(declare-fun res!501068 () Bool)

(assert (=> b!744434 (=> (not res!501068) (not e!415965))))

(declare-fun lt!330669 () SeekEntryResult!7441)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41551 (_ BitVec 32)) SeekEntryResult!7441)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744434 (= res!501068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19885 a!3186) j!159) mask!3328) (select (arr!19885 a!3186) j!159) a!3186 mask!3328) lt!330669))))

(assert (=> b!744434 (= lt!330669 (Intermediate!7441 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!501057 () Bool)

(assert (=> start!65508 (=> (not res!501057) (not e!415963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65508 (= res!501057 (validMask!0 mask!3328))))

(assert (=> start!65508 e!415963))

(assert (=> start!65508 true))

(declare-fun array_inv!15744 (array!41551) Bool)

(assert (=> start!65508 (array_inv!15744 a!3186)))

(declare-fun b!744435 () Bool)

(declare-fun e!415960 () Bool)

(declare-fun e!415961 () Bool)

(assert (=> b!744435 (= e!415960 (not e!415961))))

(declare-fun res!501059 () Bool)

(assert (=> b!744435 (=> res!501059 e!415961)))

(declare-fun lt!330662 () SeekEntryResult!7441)

(get-info :version)

(assert (=> b!744435 (= res!501059 (or (not ((_ is Intermediate!7441) lt!330662)) (bvslt x!1131 (x!63259 lt!330662)) (not (= x!1131 (x!63259 lt!330662))) (not (= index!1321 (index!32134 lt!330662)))))))

(assert (=> b!744435 e!415967))

(declare-fun res!501063 () Bool)

(assert (=> b!744435 (=> (not res!501063) (not e!415967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41551 (_ BitVec 32)) Bool)

(assert (=> b!744435 (= res!501063 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25441 0))(
  ( (Unit!25442) )
))
(declare-fun lt!330661 () Unit!25441)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25441)

(assert (=> b!744435 (= lt!330661 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744436 () Bool)

(declare-fun res!501066 () Bool)

(assert (=> b!744436 (=> (not res!501066) (not e!415964))))

(declare-datatypes ((List!13794 0))(
  ( (Nil!13791) (Cons!13790 (h!14868 (_ BitVec 64)) (t!20101 List!13794)) )
))
(declare-fun arrayNoDuplicates!0 (array!41551 (_ BitVec 32) List!13794) Bool)

(assert (=> b!744436 (= res!501066 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13791))))

(declare-fun b!744437 () Bool)

(declare-fun res!501067 () Bool)

(assert (=> b!744437 (=> (not res!501067) (not e!415963))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744437 (= res!501067 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744438 () Bool)

(declare-fun res!501069 () Bool)

(assert (=> b!744438 (=> (not res!501069) (not e!415964))))

(assert (=> b!744438 (= res!501069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744439 () Bool)

(declare-fun res!501070 () Bool)

(assert (=> b!744439 (=> (not res!501070) (not e!415965))))

(assert (=> b!744439 (= res!501070 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19885 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744440 () Bool)

(assert (=> b!744440 (= e!415965 e!415960)))

(declare-fun res!501061 () Bool)

(assert (=> b!744440 (=> (not res!501061) (not e!415960))))

(declare-fun lt!330666 () SeekEntryResult!7441)

(assert (=> b!744440 (= res!501061 (= lt!330666 lt!330662))))

(declare-fun lt!330667 () (_ BitVec 64))

(declare-fun lt!330665 () array!41551)

(assert (=> b!744440 (= lt!330662 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330667 lt!330665 mask!3328))))

(assert (=> b!744440 (= lt!330666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330667 mask!3328) lt!330667 lt!330665 mask!3328))))

(assert (=> b!744440 (= lt!330667 (select (store (arr!19885 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744440 (= lt!330665 (array!41552 (store (arr!19885 a!3186) i!1173 k0!2102) (size!20305 a!3186)))))

(declare-fun b!744441 () Bool)

(declare-fun res!501064 () Bool)

(assert (=> b!744441 (=> (not res!501064) (not e!415963))))

(assert (=> b!744441 (= res!501064 (validKeyInArray!0 k0!2102))))

(declare-fun b!744442 () Bool)

(assert (=> b!744442 (= e!415961 true)))

(declare-fun lt!330663 () SeekEntryResult!7441)

(assert (=> b!744442 (= lt!330663 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19885 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744443 () Bool)

(assert (=> b!744443 (= e!415963 e!415964)))

(declare-fun res!501058 () Bool)

(assert (=> b!744443 (=> (not res!501058) (not e!415964))))

(declare-fun lt!330668 () SeekEntryResult!7441)

(assert (=> b!744443 (= res!501058 (or (= lt!330668 (MissingZero!7441 i!1173)) (= lt!330668 (MissingVacant!7441 i!1173))))))

(assert (=> b!744443 (= lt!330668 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744444 () Bool)

(assert (=> b!744444 (= e!415962 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19885 a!3186) j!159) a!3186 mask!3328) lt!330669))))

(declare-fun b!744445 () Bool)

(declare-fun res!501060 () Bool)

(assert (=> b!744445 (=> (not res!501060) (not e!415964))))

(assert (=> b!744445 (= res!501060 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20305 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20305 a!3186))))))

(assert (= (and start!65508 res!501057) b!744430))

(assert (= (and b!744430 res!501062) b!744433))

(assert (= (and b!744433 res!501065) b!744441))

(assert (= (and b!744441 res!501064) b!744437))

(assert (= (and b!744437 res!501067) b!744443))

(assert (= (and b!744443 res!501058) b!744438))

(assert (= (and b!744438 res!501069) b!744436))

(assert (= (and b!744436 res!501066) b!744445))

(assert (= (and b!744445 res!501060) b!744434))

(assert (= (and b!744434 res!501068) b!744439))

(assert (= (and b!744439 res!501070) b!744432))

(assert (= (and b!744432 c!82070) b!744444))

(assert (= (and b!744432 (not c!82070)) b!744428))

(assert (= (and b!744432 res!501056) b!744440))

(assert (= (and b!744440 res!501061) b!744435))

(assert (= (and b!744435 res!501063) b!744431))

(assert (= (and b!744431 res!501055) b!744429))

(assert (= (and b!744435 (not res!501059)) b!744442))

(declare-fun m!695487 () Bool)

(assert (=> b!744444 m!695487))

(assert (=> b!744444 m!695487))

(declare-fun m!695489 () Bool)

(assert (=> b!744444 m!695489))

(declare-fun m!695491 () Bool)

(assert (=> start!65508 m!695491))

(declare-fun m!695493 () Bool)

(assert (=> start!65508 m!695493))

(declare-fun m!695495 () Bool)

(assert (=> b!744435 m!695495))

(declare-fun m!695497 () Bool)

(assert (=> b!744435 m!695497))

(declare-fun m!695499 () Bool)

(assert (=> b!744441 m!695499))

(assert (=> b!744434 m!695487))

(assert (=> b!744434 m!695487))

(declare-fun m!695501 () Bool)

(assert (=> b!744434 m!695501))

(assert (=> b!744434 m!695501))

(assert (=> b!744434 m!695487))

(declare-fun m!695503 () Bool)

(assert (=> b!744434 m!695503))

(declare-fun m!695505 () Bool)

(assert (=> b!744439 m!695505))

(assert (=> b!744431 m!695487))

(assert (=> b!744431 m!695487))

(declare-fun m!695507 () Bool)

(assert (=> b!744431 m!695507))

(declare-fun m!695509 () Bool)

(assert (=> b!744436 m!695509))

(assert (=> b!744429 m!695487))

(assert (=> b!744429 m!695487))

(declare-fun m!695511 () Bool)

(assert (=> b!744429 m!695511))

(declare-fun m!695513 () Bool)

(assert (=> b!744438 m!695513))

(assert (=> b!744442 m!695487))

(assert (=> b!744442 m!695487))

(declare-fun m!695515 () Bool)

(assert (=> b!744442 m!695515))

(declare-fun m!695517 () Bool)

(assert (=> b!744437 m!695517))

(assert (=> b!744433 m!695487))

(assert (=> b!744433 m!695487))

(declare-fun m!695519 () Bool)

(assert (=> b!744433 m!695519))

(declare-fun m!695521 () Bool)

(assert (=> b!744440 m!695521))

(declare-fun m!695523 () Bool)

(assert (=> b!744440 m!695523))

(declare-fun m!695525 () Bool)

(assert (=> b!744440 m!695525))

(declare-fun m!695527 () Bool)

(assert (=> b!744440 m!695527))

(assert (=> b!744440 m!695521))

(declare-fun m!695529 () Bool)

(assert (=> b!744440 m!695529))

(declare-fun m!695531 () Bool)

(assert (=> b!744443 m!695531))

(assert (=> b!744428 m!695487))

(assert (=> b!744428 m!695487))

(assert (=> b!744428 m!695515))

(check-sat (not b!744434) (not b!744428) (not b!744429) (not b!744442) (not b!744435) (not b!744436) (not start!65508) (not b!744433) (not b!744438) (not b!744437) (not b!744431) (not b!744441) (not b!744443) (not b!744444) (not b!744440))
(check-sat)
