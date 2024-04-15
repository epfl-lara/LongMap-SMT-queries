; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65804 () Bool)

(assert start!65804)

(declare-fun b!757591 () Bool)

(declare-fun res!512505 () Bool)

(declare-fun e!422372 () Bool)

(assert (=> b!757591 (=> (not res!512505) (not e!422372))))

(declare-fun lt!337284 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41994 0))(
  ( (array!41995 (arr!20111 (Array (_ BitVec 32) (_ BitVec 64))) (size!20532 (_ BitVec 32))) )
))
(declare-fun lt!337280 () array!41994)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7708 0))(
  ( (MissingZero!7708 (index!33200 (_ BitVec 32))) (Found!7708 (index!33201 (_ BitVec 32))) (Intermediate!7708 (undefined!8520 Bool) (index!33202 (_ BitVec 32)) (x!64101 (_ BitVec 32))) (Undefined!7708) (MissingVacant!7708 (index!33203 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41994 (_ BitVec 32)) SeekEntryResult!7708)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41994 (_ BitVec 32)) SeekEntryResult!7708)

(assert (=> b!757591 (= res!512505 (= (seekEntryOrOpen!0 lt!337284 lt!337280 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337284 lt!337280 mask!3328)))))

(declare-fun a!3186 () array!41994)

(declare-fun e!422378 () Bool)

(declare-fun b!757592 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!757592 (= e!422378 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20111 a!3186) j!159) a!3186 mask!3328) (Found!7708 j!159)))))

(declare-fun b!757593 () Bool)

(declare-fun e!422379 () Bool)

(assert (=> b!757593 (= e!422379 true)))

(assert (=> b!757593 e!422372))

(declare-fun res!512506 () Bool)

(assert (=> b!757593 (=> (not res!512506) (not e!422372))))

(declare-fun lt!337282 () (_ BitVec 64))

(assert (=> b!757593 (= res!512506 (= lt!337282 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26192 0))(
  ( (Unit!26193) )
))
(declare-fun lt!337281 () Unit!26192)

(declare-fun e!422381 () Unit!26192)

(assert (=> b!757593 (= lt!337281 e!422381)))

(declare-fun c!82932 () Bool)

(assert (=> b!757593 (= c!82932 (= lt!337282 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757594 () Bool)

(declare-fun e!422375 () Bool)

(assert (=> b!757594 (= e!422375 e!422379)))

(declare-fun res!512495 () Bool)

(assert (=> b!757594 (=> res!512495 e!422379)))

(assert (=> b!757594 (= res!512495 (= lt!337282 lt!337284))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!757594 (= lt!337282 (select (store (arr!20111 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757595 () Bool)

(declare-fun e!422382 () Bool)

(declare-fun e!422373 () Bool)

(assert (=> b!757595 (= e!422382 e!422373)))

(declare-fun res!512500 () Bool)

(assert (=> b!757595 (=> (not res!512500) (not e!422373))))

(declare-fun lt!337279 () SeekEntryResult!7708)

(assert (=> b!757595 (= res!512500 (or (= lt!337279 (MissingZero!7708 i!1173)) (= lt!337279 (MissingVacant!7708 i!1173))))))

(assert (=> b!757595 (= lt!337279 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757596 () Bool)

(declare-fun res!512492 () Bool)

(declare-fun e!422376 () Bool)

(assert (=> b!757596 (=> (not res!512492) (not e!422376))))

(assert (=> b!757596 (= res!512492 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20111 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757597 () Bool)

(assert (=> b!757597 (= e!422373 e!422376)))

(declare-fun res!512494 () Bool)

(assert (=> b!757597 (=> (not res!512494) (not e!422376))))

(declare-fun lt!337285 () SeekEntryResult!7708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41994 (_ BitVec 32)) SeekEntryResult!7708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757597 (= res!512494 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20111 a!3186) j!159) mask!3328) (select (arr!20111 a!3186) j!159) a!3186 mask!3328) lt!337285))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757597 (= lt!337285 (Intermediate!7708 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757598 () Bool)

(declare-fun res!512498 () Bool)

(assert (=> b!757598 (=> (not res!512498) (not e!422373))))

(assert (=> b!757598 (= res!512498 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20532 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20532 a!3186))))))

(declare-fun b!757599 () Bool)

(declare-fun res!512497 () Bool)

(assert (=> b!757599 (=> (not res!512497) (not e!422382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757599 (= res!512497 (validKeyInArray!0 (select (arr!20111 a!3186) j!159)))))

(declare-fun b!757600 () Bool)

(declare-fun res!512504 () Bool)

(assert (=> b!757600 (=> (not res!512504) (not e!422382))))

(assert (=> b!757600 (= res!512504 (validKeyInArray!0 k0!2102))))

(declare-fun b!757601 () Bool)

(declare-fun res!512501 () Bool)

(assert (=> b!757601 (=> (not res!512501) (not e!422382))))

(declare-fun arrayContainsKey!0 (array!41994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757601 (= res!512501 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757602 () Bool)

(declare-fun res!512499 () Bool)

(assert (=> b!757602 (=> (not res!512499) (not e!422382))))

(assert (=> b!757602 (= res!512499 (and (= (size!20532 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20532 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20532 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757603 () Bool)

(declare-fun res!512491 () Bool)

(assert (=> b!757603 (=> (not res!512491) (not e!422376))))

(assert (=> b!757603 (= res!512491 e!422378)))

(declare-fun c!82931 () Bool)

(assert (=> b!757603 (= c!82931 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757604 () Bool)

(declare-fun res!512496 () Bool)

(assert (=> b!757604 (=> (not res!512496) (not e!422373))))

(declare-datatypes ((List!14152 0))(
  ( (Nil!14149) (Cons!14148 (h!15220 (_ BitVec 64)) (t!20458 List!14152)) )
))
(declare-fun arrayNoDuplicates!0 (array!41994 (_ BitVec 32) List!14152) Bool)

(assert (=> b!757604 (= res!512496 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14149))))

(declare-fun b!757605 () Bool)

(declare-fun e!422383 () Bool)

(assert (=> b!757605 (= e!422376 e!422383)))

(declare-fun res!512502 () Bool)

(assert (=> b!757605 (=> (not res!512502) (not e!422383))))

(declare-fun lt!337287 () SeekEntryResult!7708)

(declare-fun lt!337288 () SeekEntryResult!7708)

(assert (=> b!757605 (= res!512502 (= lt!337287 lt!337288))))

(assert (=> b!757605 (= lt!337288 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337284 lt!337280 mask!3328))))

(assert (=> b!757605 (= lt!337287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337284 mask!3328) lt!337284 lt!337280 mask!3328))))

(assert (=> b!757605 (= lt!337284 (select (store (arr!20111 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757605 (= lt!337280 (array!41995 (store (arr!20111 a!3186) i!1173 k0!2102) (size!20532 a!3186)))))

(declare-fun b!757606 () Bool)

(declare-fun e!422374 () Bool)

(assert (=> b!757606 (= e!422374 e!422375)))

(declare-fun res!512490 () Bool)

(assert (=> b!757606 (=> res!512490 e!422375)))

(declare-fun lt!337286 () SeekEntryResult!7708)

(declare-fun lt!337278 () SeekEntryResult!7708)

(assert (=> b!757606 (= res!512490 (not (= lt!337286 lt!337278)))))

(assert (=> b!757606 (= lt!337286 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20111 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757607 () Bool)

(declare-fun Unit!26194 () Unit!26192)

(assert (=> b!757607 (= e!422381 Unit!26194)))

(declare-fun b!757608 () Bool)

(declare-fun e!422377 () Bool)

(assert (=> b!757608 (= e!422377 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20111 a!3186) j!159) a!3186 mask!3328) lt!337278))))

(declare-fun res!512493 () Bool)

(assert (=> start!65804 (=> (not res!512493) (not e!422382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65804 (= res!512493 (validMask!0 mask!3328))))

(assert (=> start!65804 e!422382))

(assert (=> start!65804 true))

(declare-fun array_inv!15994 (array!41994) Bool)

(assert (=> start!65804 (array_inv!15994 a!3186)))

(declare-fun b!757609 () Bool)

(declare-fun Unit!26195 () Unit!26192)

(assert (=> b!757609 (= e!422381 Unit!26195)))

(assert (=> b!757609 false))

(declare-fun b!757610 () Bool)

(assert (=> b!757610 (= e!422383 (not e!422374))))

(declare-fun res!512503 () Bool)

(assert (=> b!757610 (=> res!512503 e!422374)))

(get-info :version)

(assert (=> b!757610 (= res!512503 (or (not ((_ is Intermediate!7708) lt!337288)) (bvslt x!1131 (x!64101 lt!337288)) (not (= x!1131 (x!64101 lt!337288))) (not (= index!1321 (index!33202 lt!337288)))))))

(assert (=> b!757610 e!422377))

(declare-fun res!512507 () Bool)

(assert (=> b!757610 (=> (not res!512507) (not e!422377))))

(declare-fun lt!337283 () SeekEntryResult!7708)

(assert (=> b!757610 (= res!512507 (= lt!337283 lt!337278))))

(assert (=> b!757610 (= lt!337278 (Found!7708 j!159))))

(assert (=> b!757610 (= lt!337283 (seekEntryOrOpen!0 (select (arr!20111 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41994 (_ BitVec 32)) Bool)

(assert (=> b!757610 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337289 () Unit!26192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26192)

(assert (=> b!757610 (= lt!337289 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757611 () Bool)

(assert (=> b!757611 (= e!422378 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20111 a!3186) j!159) a!3186 mask!3328) lt!337285))))

(declare-fun b!757612 () Bool)

(assert (=> b!757612 (= e!422372 (= lt!337283 lt!337286))))

(declare-fun b!757613 () Bool)

(declare-fun res!512508 () Bool)

(assert (=> b!757613 (=> (not res!512508) (not e!422373))))

(assert (=> b!757613 (= res!512508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65804 res!512493) b!757602))

(assert (= (and b!757602 res!512499) b!757599))

(assert (= (and b!757599 res!512497) b!757600))

(assert (= (and b!757600 res!512504) b!757601))

(assert (= (and b!757601 res!512501) b!757595))

(assert (= (and b!757595 res!512500) b!757613))

(assert (= (and b!757613 res!512508) b!757604))

(assert (= (and b!757604 res!512496) b!757598))

(assert (= (and b!757598 res!512498) b!757597))

(assert (= (and b!757597 res!512494) b!757596))

(assert (= (and b!757596 res!512492) b!757603))

(assert (= (and b!757603 c!82931) b!757611))

(assert (= (and b!757603 (not c!82931)) b!757592))

(assert (= (and b!757603 res!512491) b!757605))

(assert (= (and b!757605 res!512502) b!757610))

(assert (= (and b!757610 res!512507) b!757608))

(assert (= (and b!757610 (not res!512503)) b!757606))

(assert (= (and b!757606 (not res!512490)) b!757594))

(assert (= (and b!757594 (not res!512495)) b!757593))

(assert (= (and b!757593 c!82932) b!757609))

(assert (= (and b!757593 (not c!82932)) b!757607))

(assert (= (and b!757593 res!512506) b!757591))

(assert (= (and b!757591 res!512505) b!757612))

(declare-fun m!704693 () Bool)

(assert (=> b!757611 m!704693))

(assert (=> b!757611 m!704693))

(declare-fun m!704695 () Bool)

(assert (=> b!757611 m!704695))

(declare-fun m!704697 () Bool)

(assert (=> start!65804 m!704697))

(declare-fun m!704699 () Bool)

(assert (=> start!65804 m!704699))

(assert (=> b!757597 m!704693))

(assert (=> b!757597 m!704693))

(declare-fun m!704701 () Bool)

(assert (=> b!757597 m!704701))

(assert (=> b!757597 m!704701))

(assert (=> b!757597 m!704693))

(declare-fun m!704703 () Bool)

(assert (=> b!757597 m!704703))

(assert (=> b!757610 m!704693))

(assert (=> b!757610 m!704693))

(declare-fun m!704705 () Bool)

(assert (=> b!757610 m!704705))

(declare-fun m!704707 () Bool)

(assert (=> b!757610 m!704707))

(declare-fun m!704709 () Bool)

(assert (=> b!757610 m!704709))

(declare-fun m!704711 () Bool)

(assert (=> b!757604 m!704711))

(declare-fun m!704713 () Bool)

(assert (=> b!757613 m!704713))

(assert (=> b!757592 m!704693))

(assert (=> b!757592 m!704693))

(declare-fun m!704715 () Bool)

(assert (=> b!757592 m!704715))

(declare-fun m!704717 () Bool)

(assert (=> b!757596 m!704717))

(declare-fun m!704719 () Bool)

(assert (=> b!757605 m!704719))

(declare-fun m!704721 () Bool)

(assert (=> b!757605 m!704721))

(declare-fun m!704723 () Bool)

(assert (=> b!757605 m!704723))

(assert (=> b!757605 m!704723))

(declare-fun m!704725 () Bool)

(assert (=> b!757605 m!704725))

(declare-fun m!704727 () Bool)

(assert (=> b!757605 m!704727))

(assert (=> b!757599 m!704693))

(assert (=> b!757599 m!704693))

(declare-fun m!704729 () Bool)

(assert (=> b!757599 m!704729))

(assert (=> b!757606 m!704693))

(assert (=> b!757606 m!704693))

(assert (=> b!757606 m!704715))

(declare-fun m!704731 () Bool)

(assert (=> b!757600 m!704731))

(assert (=> b!757608 m!704693))

(assert (=> b!757608 m!704693))

(declare-fun m!704733 () Bool)

(assert (=> b!757608 m!704733))

(declare-fun m!704735 () Bool)

(assert (=> b!757591 m!704735))

(declare-fun m!704737 () Bool)

(assert (=> b!757591 m!704737))

(declare-fun m!704739 () Bool)

(assert (=> b!757595 m!704739))

(assert (=> b!757594 m!704719))

(declare-fun m!704741 () Bool)

(assert (=> b!757594 m!704741))

(declare-fun m!704743 () Bool)

(assert (=> b!757601 m!704743))

(check-sat (not b!757595) (not b!757613) (not b!757606) (not start!65804) (not b!757599) (not b!757604) (not b!757611) (not b!757591) (not b!757601) (not b!757592) (not b!757610) (not b!757608) (not b!757600) (not b!757605) (not b!757597))
(check-sat)
