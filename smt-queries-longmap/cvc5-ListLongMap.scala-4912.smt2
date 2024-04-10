; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67716 () Bool)

(assert start!67716)

(declare-fun b!785414 () Bool)

(declare-fun e!436649 () Bool)

(declare-fun e!436650 () Bool)

(assert (=> b!785414 (= e!436649 e!436650)))

(declare-fun res!531642 () Bool)

(assert (=> b!785414 (=> (not res!531642) (not e!436650))))

(declare-datatypes ((SeekEntryResult!8066 0))(
  ( (MissingZero!8066 (index!34632 (_ BitVec 32))) (Found!8066 (index!34633 (_ BitVec 32))) (Intermediate!8066 (undefined!8878 Bool) (index!34634 (_ BitVec 32)) (x!65582 (_ BitVec 32))) (Undefined!8066) (MissingVacant!8066 (index!34635 (_ BitVec 32))) )
))
(declare-fun lt!350197 () SeekEntryResult!8066)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785414 (= res!531642 (or (= lt!350197 (MissingZero!8066 i!1173)) (= lt!350197 (MissingVacant!8066 i!1173))))))

(declare-datatypes ((array!42756 0))(
  ( (array!42757 (arr!20466 (Array (_ BitVec 32) (_ BitVec 64))) (size!20887 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42756)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42756 (_ BitVec 32)) SeekEntryResult!8066)

(assert (=> b!785414 (= lt!350197 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!785415 () Bool)

(declare-fun e!436641 () Bool)

(declare-fun e!436645 () Bool)

(assert (=> b!785415 (= e!436641 (not e!436645))))

(declare-fun res!531653 () Bool)

(assert (=> b!785415 (=> res!531653 e!436645)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!350201 () SeekEntryResult!8066)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!785415 (= res!531653 (or (not (is-Intermediate!8066 lt!350201)) (bvslt x!1131 (x!65582 lt!350201)) (not (= x!1131 (x!65582 lt!350201))) (not (= index!1321 (index!34634 lt!350201)))))))

(declare-fun e!436647 () Bool)

(assert (=> b!785415 e!436647))

(declare-fun res!531648 () Bool)

(assert (=> b!785415 (=> (not res!531648) (not e!436647))))

(declare-fun lt!350203 () SeekEntryResult!8066)

(declare-fun lt!350196 () SeekEntryResult!8066)

(assert (=> b!785415 (= res!531648 (= lt!350203 lt!350196))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!785415 (= lt!350196 (Found!8066 j!159))))

(assert (=> b!785415 (= lt!350203 (seekEntryOrOpen!0 (select (arr!20466 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42756 (_ BitVec 32)) Bool)

(assert (=> b!785415 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27152 0))(
  ( (Unit!27153) )
))
(declare-fun lt!350198 () Unit!27152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27152)

(assert (=> b!785415 (= lt!350198 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785416 () Bool)

(declare-fun e!436652 () Bool)

(assert (=> b!785416 (= e!436645 e!436652)))

(declare-fun res!531641 () Bool)

(assert (=> b!785416 (=> res!531641 e!436652)))

(declare-fun lt!350199 () SeekEntryResult!8066)

(assert (=> b!785416 (= res!531641 (not (= lt!350199 lt!350196)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42756 (_ BitVec 32)) SeekEntryResult!8066)

(assert (=> b!785416 (= lt!350199 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20466 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785417 () Bool)

(declare-fun e!436644 () Unit!27152)

(declare-fun Unit!27154 () Unit!27152)

(assert (=> b!785417 (= e!436644 Unit!27154)))

(assert (=> b!785417 false))

(declare-fun b!785418 () Bool)

(declare-fun res!531651 () Bool)

(declare-fun e!436651 () Bool)

(assert (=> b!785418 (=> (not res!531651) (not e!436651))))

(assert (=> b!785418 (= res!531651 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20466 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785419 () Bool)

(assert (=> b!785419 (= e!436650 e!436651)))

(declare-fun res!531647 () Bool)

(assert (=> b!785419 (=> (not res!531647) (not e!436651))))

(declare-fun lt!350193 () SeekEntryResult!8066)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42756 (_ BitVec 32)) SeekEntryResult!8066)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785419 (= res!531647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20466 a!3186) j!159) mask!3328) (select (arr!20466 a!3186) j!159) a!3186 mask!3328) lt!350193))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785419 (= lt!350193 (Intermediate!8066 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785421 () Bool)

(declare-fun res!531659 () Bool)

(assert (=> b!785421 (=> (not res!531659) (not e!436649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785421 (= res!531659 (validKeyInArray!0 k!2102))))

(declare-fun b!785422 () Bool)

(declare-fun res!531646 () Bool)

(assert (=> b!785422 (=> (not res!531646) (not e!436650))))

(assert (=> b!785422 (= res!531646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785423 () Bool)

(declare-fun res!531654 () Bool)

(assert (=> b!785423 (=> (not res!531654) (not e!436649))))

(assert (=> b!785423 (= res!531654 (validKeyInArray!0 (select (arr!20466 a!3186) j!159)))))

(declare-fun b!785424 () Bool)

(declare-fun res!531644 () Bool)

(assert (=> b!785424 (=> (not res!531644) (not e!436649))))

(assert (=> b!785424 (= res!531644 (and (= (size!20887 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20887 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20887 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785425 () Bool)

(assert (=> b!785425 (= e!436647 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20466 a!3186) j!159) a!3186 mask!3328) lt!350196))))

(declare-fun b!785426 () Bool)

(declare-fun res!531643 () Bool)

(declare-fun e!436643 () Bool)

(assert (=> b!785426 (=> (not res!531643) (not e!436643))))

(declare-fun lt!350204 () (_ BitVec 64))

(declare-fun lt!350194 () array!42756)

(assert (=> b!785426 (= res!531643 (= (seekEntryOrOpen!0 lt!350204 lt!350194 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350204 lt!350194 mask!3328)))))

(declare-fun b!785427 () Bool)

(declare-fun e!436642 () Bool)

(assert (=> b!785427 (= e!436652 e!436642)))

(declare-fun res!531652 () Bool)

(assert (=> b!785427 (=> res!531652 e!436642)))

(declare-fun lt!350195 () (_ BitVec 64))

(assert (=> b!785427 (= res!531652 (= lt!350195 lt!350204))))

(assert (=> b!785427 (= lt!350195 (select (store (arr!20466 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!785428 () Bool)

(declare-fun e!436646 () Bool)

(assert (=> b!785428 (= e!436646 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20466 a!3186) j!159) a!3186 mask!3328) (Found!8066 j!159)))))

(declare-fun b!785429 () Bool)

(declare-fun res!531645 () Bool)

(assert (=> b!785429 (=> (not res!531645) (not e!436649))))

(declare-fun arrayContainsKey!0 (array!42756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785429 (= res!531645 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785430 () Bool)

(assert (=> b!785430 (= e!436643 (= lt!350203 lt!350199))))

(declare-fun b!785431 () Bool)

(declare-fun res!531656 () Bool)

(assert (=> b!785431 (=> (not res!531656) (not e!436650))))

(declare-datatypes ((List!14468 0))(
  ( (Nil!14465) (Cons!14464 (h!15587 (_ BitVec 64)) (t!20783 List!14468)) )
))
(declare-fun arrayNoDuplicates!0 (array!42756 (_ BitVec 32) List!14468) Bool)

(assert (=> b!785431 (= res!531656 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14465))))

(declare-fun b!785420 () Bool)

(assert (=> b!785420 (= e!436646 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20466 a!3186) j!159) a!3186 mask!3328) lt!350193))))

(declare-fun res!531650 () Bool)

(assert (=> start!67716 (=> (not res!531650) (not e!436649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67716 (= res!531650 (validMask!0 mask!3328))))

(assert (=> start!67716 e!436649))

(assert (=> start!67716 true))

(declare-fun array_inv!16262 (array!42756) Bool)

(assert (=> start!67716 (array_inv!16262 a!3186)))

(declare-fun b!785432 () Bool)

(declare-fun Unit!27155 () Unit!27152)

(assert (=> b!785432 (= e!436644 Unit!27155)))

(declare-fun b!785433 () Bool)

(assert (=> b!785433 (= e!436642 true)))

(assert (=> b!785433 e!436643))

(declare-fun res!531657 () Bool)

(assert (=> b!785433 (=> (not res!531657) (not e!436643))))

(assert (=> b!785433 (= res!531657 (= lt!350195 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350202 () Unit!27152)

(assert (=> b!785433 (= lt!350202 e!436644)))

(declare-fun c!87295 () Bool)

(assert (=> b!785433 (= c!87295 (= lt!350195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785434 () Bool)

(declare-fun res!531649 () Bool)

(assert (=> b!785434 (=> (not res!531649) (not e!436651))))

(assert (=> b!785434 (= res!531649 e!436646)))

(declare-fun c!87294 () Bool)

(assert (=> b!785434 (= c!87294 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785435 () Bool)

(assert (=> b!785435 (= e!436651 e!436641)))

(declare-fun res!531655 () Bool)

(assert (=> b!785435 (=> (not res!531655) (not e!436641))))

(declare-fun lt!350200 () SeekEntryResult!8066)

(assert (=> b!785435 (= res!531655 (= lt!350200 lt!350201))))

(assert (=> b!785435 (= lt!350201 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350204 lt!350194 mask!3328))))

(assert (=> b!785435 (= lt!350200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350204 mask!3328) lt!350204 lt!350194 mask!3328))))

(assert (=> b!785435 (= lt!350204 (select (store (arr!20466 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!785435 (= lt!350194 (array!42757 (store (arr!20466 a!3186) i!1173 k!2102) (size!20887 a!3186)))))

(declare-fun b!785436 () Bool)

(declare-fun res!531658 () Bool)

(assert (=> b!785436 (=> (not res!531658) (not e!436650))))

(assert (=> b!785436 (= res!531658 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20887 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20887 a!3186))))))

(assert (= (and start!67716 res!531650) b!785424))

(assert (= (and b!785424 res!531644) b!785423))

(assert (= (and b!785423 res!531654) b!785421))

(assert (= (and b!785421 res!531659) b!785429))

(assert (= (and b!785429 res!531645) b!785414))

(assert (= (and b!785414 res!531642) b!785422))

(assert (= (and b!785422 res!531646) b!785431))

(assert (= (and b!785431 res!531656) b!785436))

(assert (= (and b!785436 res!531658) b!785419))

(assert (= (and b!785419 res!531647) b!785418))

(assert (= (and b!785418 res!531651) b!785434))

(assert (= (and b!785434 c!87294) b!785420))

(assert (= (and b!785434 (not c!87294)) b!785428))

(assert (= (and b!785434 res!531649) b!785435))

(assert (= (and b!785435 res!531655) b!785415))

(assert (= (and b!785415 res!531648) b!785425))

(assert (= (and b!785415 (not res!531653)) b!785416))

(assert (= (and b!785416 (not res!531641)) b!785427))

(assert (= (and b!785427 (not res!531652)) b!785433))

(assert (= (and b!785433 c!87295) b!785417))

(assert (= (and b!785433 (not c!87295)) b!785432))

(assert (= (and b!785433 res!531657) b!785426))

(assert (= (and b!785426 res!531643) b!785430))

(declare-fun m!727493 () Bool)

(assert (=> b!785435 m!727493))

(declare-fun m!727495 () Bool)

(assert (=> b!785435 m!727495))

(declare-fun m!727497 () Bool)

(assert (=> b!785435 m!727497))

(declare-fun m!727499 () Bool)

(assert (=> b!785435 m!727499))

(assert (=> b!785435 m!727493))

(declare-fun m!727501 () Bool)

(assert (=> b!785435 m!727501))

(declare-fun m!727503 () Bool)

(assert (=> b!785428 m!727503))

(assert (=> b!785428 m!727503))

(declare-fun m!727505 () Bool)

(assert (=> b!785428 m!727505))

(declare-fun m!727507 () Bool)

(assert (=> b!785421 m!727507))

(assert (=> b!785420 m!727503))

(assert (=> b!785420 m!727503))

(declare-fun m!727509 () Bool)

(assert (=> b!785420 m!727509))

(declare-fun m!727511 () Bool)

(assert (=> b!785418 m!727511))

(assert (=> b!785419 m!727503))

(assert (=> b!785419 m!727503))

(declare-fun m!727513 () Bool)

(assert (=> b!785419 m!727513))

(assert (=> b!785419 m!727513))

(assert (=> b!785419 m!727503))

(declare-fun m!727515 () Bool)

(assert (=> b!785419 m!727515))

(assert (=> b!785423 m!727503))

(assert (=> b!785423 m!727503))

(declare-fun m!727517 () Bool)

(assert (=> b!785423 m!727517))

(declare-fun m!727519 () Bool)

(assert (=> b!785431 m!727519))

(assert (=> b!785427 m!727497))

(declare-fun m!727521 () Bool)

(assert (=> b!785427 m!727521))

(declare-fun m!727523 () Bool)

(assert (=> start!67716 m!727523))

(declare-fun m!727525 () Bool)

(assert (=> start!67716 m!727525))

(declare-fun m!727527 () Bool)

(assert (=> b!785414 m!727527))

(declare-fun m!727529 () Bool)

(assert (=> b!785422 m!727529))

(declare-fun m!727531 () Bool)

(assert (=> b!785426 m!727531))

(declare-fun m!727533 () Bool)

(assert (=> b!785426 m!727533))

(declare-fun m!727535 () Bool)

(assert (=> b!785429 m!727535))

(assert (=> b!785415 m!727503))

(assert (=> b!785415 m!727503))

(declare-fun m!727537 () Bool)

(assert (=> b!785415 m!727537))

(declare-fun m!727539 () Bool)

(assert (=> b!785415 m!727539))

(declare-fun m!727541 () Bool)

(assert (=> b!785415 m!727541))

(assert (=> b!785416 m!727503))

(assert (=> b!785416 m!727503))

(assert (=> b!785416 m!727505))

(assert (=> b!785425 m!727503))

(assert (=> b!785425 m!727503))

(declare-fun m!727543 () Bool)

(assert (=> b!785425 m!727543))

(push 1)

