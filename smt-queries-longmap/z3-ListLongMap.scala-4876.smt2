; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67172 () Bool)

(assert start!67172)

(declare-fun b!776650 () Bool)

(declare-fun res!525442 () Bool)

(declare-fun e!432174 () Bool)

(assert (=> b!776650 (=> (not res!525442) (not e!432174))))

(declare-datatypes ((array!42527 0))(
  ( (array!42528 (arr!20359 (Array (_ BitVec 32) (_ BitVec 64))) (size!20780 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42527)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!776650 (= res!525442 (and (= (size!20780 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20780 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20780 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!525440 () Bool)

(assert (=> start!67172 (=> (not res!525440) (not e!432174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67172 (= res!525440 (validMask!0 mask!3328))))

(assert (=> start!67172 e!432174))

(assert (=> start!67172 true))

(declare-fun array_inv!16155 (array!42527) Bool)

(assert (=> start!67172 (array_inv!16155 a!3186)))

(declare-fun b!776651 () Bool)

(declare-fun res!525431 () Bool)

(assert (=> b!776651 (=> (not res!525431) (not e!432174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776651 (= res!525431 (validKeyInArray!0 (select (arr!20359 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!776652 () Bool)

(declare-fun e!432177 () Bool)

(declare-datatypes ((SeekEntryResult!7959 0))(
  ( (MissingZero!7959 (index!34204 (_ BitVec 32))) (Found!7959 (index!34205 (_ BitVec 32))) (Intermediate!7959 (undefined!8771 Bool) (index!34206 (_ BitVec 32)) (x!65142 (_ BitVec 32))) (Undefined!7959) (MissingVacant!7959 (index!34207 (_ BitVec 32))) )
))
(declare-fun lt!346032 () SeekEntryResult!7959)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42527 (_ BitVec 32)) SeekEntryResult!7959)

(assert (=> b!776652 (= e!432177 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346032))))

(declare-fun b!776653 () Bool)

(declare-fun e!432176 () Bool)

(assert (=> b!776653 (= e!432176 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!346026 () SeekEntryResult!7959)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42527 (_ BitVec 32)) SeekEntryResult!7959)

(assert (=> b!776653 (= lt!346026 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20359 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776654 () Bool)

(declare-fun e!432175 () Bool)

(declare-fun e!432179 () Bool)

(assert (=> b!776654 (= e!432175 e!432179)))

(declare-fun res!525432 () Bool)

(assert (=> b!776654 (=> (not res!525432) (not e!432179))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776654 (= res!525432 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20359 a!3186) j!159) mask!3328) (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346032))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776654 (= lt!346032 (Intermediate!7959 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776655 () Bool)

(declare-fun res!525430 () Bool)

(assert (=> b!776655 (=> (not res!525430) (not e!432174))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!776655 (= res!525430 (validKeyInArray!0 k0!2102))))

(declare-fun b!776656 () Bool)

(declare-fun res!525434 () Bool)

(assert (=> b!776656 (=> (not res!525434) (not e!432175))))

(declare-datatypes ((List!14361 0))(
  ( (Nil!14358) (Cons!14357 (h!15465 (_ BitVec 64)) (t!20676 List!14361)) )
))
(declare-fun arrayNoDuplicates!0 (array!42527 (_ BitVec 32) List!14361) Bool)

(assert (=> b!776656 (= res!525434 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14358))))

(declare-fun b!776657 () Bool)

(assert (=> b!776657 (= e!432177 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) (Found!7959 j!159)))))

(declare-fun b!776658 () Bool)

(declare-fun res!525428 () Bool)

(assert (=> b!776658 (=> (not res!525428) (not e!432179))))

(assert (=> b!776658 (= res!525428 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20359 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776659 () Bool)

(declare-fun res!525437 () Bool)

(assert (=> b!776659 (=> (not res!525437) (not e!432175))))

(assert (=> b!776659 (= res!525437 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20780 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20780 a!3186))))))

(declare-fun b!776660 () Bool)

(declare-fun e!432173 () Bool)

(assert (=> b!776660 (= e!432179 e!432173)))

(declare-fun res!525443 () Bool)

(assert (=> b!776660 (=> (not res!525443) (not e!432173))))

(declare-fun lt!346028 () SeekEntryResult!7959)

(declare-fun lt!346033 () SeekEntryResult!7959)

(assert (=> b!776660 (= res!525443 (= lt!346028 lt!346033))))

(declare-fun lt!346027 () (_ BitVec 64))

(declare-fun lt!346034 () array!42527)

(assert (=> b!776660 (= lt!346033 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346027 lt!346034 mask!3328))))

(assert (=> b!776660 (= lt!346028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346027 mask!3328) lt!346027 lt!346034 mask!3328))))

(assert (=> b!776660 (= lt!346027 (select (store (arr!20359 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776660 (= lt!346034 (array!42528 (store (arr!20359 a!3186) i!1173 k0!2102) (size!20780 a!3186)))))

(declare-fun lt!346029 () SeekEntryResult!7959)

(declare-fun b!776661 () Bool)

(declare-fun e!432171 () Bool)

(assert (=> b!776661 (= e!432171 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346029))))

(declare-fun b!776662 () Bool)

(assert (=> b!776662 (= e!432173 (not e!432176))))

(declare-fun res!525435 () Bool)

(assert (=> b!776662 (=> res!525435 e!432176)))

(get-info :version)

(assert (=> b!776662 (= res!525435 (or (not ((_ is Intermediate!7959) lt!346033)) (bvslt x!1131 (x!65142 lt!346033)) (not (= x!1131 (x!65142 lt!346033))) (not (= index!1321 (index!34206 lt!346033)))))))

(declare-fun e!432172 () Bool)

(assert (=> b!776662 e!432172))

(declare-fun res!525438 () Bool)

(assert (=> b!776662 (=> (not res!525438) (not e!432172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42527 (_ BitVec 32)) Bool)

(assert (=> b!776662 (= res!525438 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26812 0))(
  ( (Unit!26813) )
))
(declare-fun lt!346031 () Unit!26812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26812)

(assert (=> b!776662 (= lt!346031 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776663 () Bool)

(declare-fun res!525436 () Bool)

(assert (=> b!776663 (=> (not res!525436) (not e!432179))))

(assert (=> b!776663 (= res!525436 e!432177)))

(declare-fun c!86011 () Bool)

(assert (=> b!776663 (= c!86011 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776664 () Bool)

(declare-fun res!525441 () Bool)

(assert (=> b!776664 (=> (not res!525441) (not e!432174))))

(declare-fun arrayContainsKey!0 (array!42527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776664 (= res!525441 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776665 () Bool)

(assert (=> b!776665 (= e!432172 e!432171)))

(declare-fun res!525439 () Bool)

(assert (=> b!776665 (=> (not res!525439) (not e!432171))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42527 (_ BitVec 32)) SeekEntryResult!7959)

(assert (=> b!776665 (= res!525439 (= (seekEntryOrOpen!0 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346029))))

(assert (=> b!776665 (= lt!346029 (Found!7959 j!159))))

(declare-fun b!776666 () Bool)

(declare-fun res!525429 () Bool)

(assert (=> b!776666 (=> (not res!525429) (not e!432175))))

(assert (=> b!776666 (= res!525429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776667 () Bool)

(assert (=> b!776667 (= e!432174 e!432175)))

(declare-fun res!525433 () Bool)

(assert (=> b!776667 (=> (not res!525433) (not e!432175))))

(declare-fun lt!346030 () SeekEntryResult!7959)

(assert (=> b!776667 (= res!525433 (or (= lt!346030 (MissingZero!7959 i!1173)) (= lt!346030 (MissingVacant!7959 i!1173))))))

(assert (=> b!776667 (= lt!346030 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!67172 res!525440) b!776650))

(assert (= (and b!776650 res!525442) b!776651))

(assert (= (and b!776651 res!525431) b!776655))

(assert (= (and b!776655 res!525430) b!776664))

(assert (= (and b!776664 res!525441) b!776667))

(assert (= (and b!776667 res!525433) b!776666))

(assert (= (and b!776666 res!525429) b!776656))

(assert (= (and b!776656 res!525434) b!776659))

(assert (= (and b!776659 res!525437) b!776654))

(assert (= (and b!776654 res!525432) b!776658))

(assert (= (and b!776658 res!525428) b!776663))

(assert (= (and b!776663 c!86011) b!776652))

(assert (= (and b!776663 (not c!86011)) b!776657))

(assert (= (and b!776663 res!525436) b!776660))

(assert (= (and b!776660 res!525443) b!776662))

(assert (= (and b!776662 res!525438) b!776665))

(assert (= (and b!776665 res!525439) b!776661))

(assert (= (and b!776662 (not res!525435)) b!776653))

(declare-fun m!720699 () Bool)

(assert (=> b!776651 m!720699))

(assert (=> b!776651 m!720699))

(declare-fun m!720701 () Bool)

(assert (=> b!776651 m!720701))

(declare-fun m!720703 () Bool)

(assert (=> b!776658 m!720703))

(declare-fun m!720705 () Bool)

(assert (=> b!776656 m!720705))

(declare-fun m!720707 () Bool)

(assert (=> b!776666 m!720707))

(declare-fun m!720709 () Bool)

(assert (=> b!776667 m!720709))

(assert (=> b!776654 m!720699))

(assert (=> b!776654 m!720699))

(declare-fun m!720711 () Bool)

(assert (=> b!776654 m!720711))

(assert (=> b!776654 m!720711))

(assert (=> b!776654 m!720699))

(declare-fun m!720713 () Bool)

(assert (=> b!776654 m!720713))

(declare-fun m!720715 () Bool)

(assert (=> b!776660 m!720715))

(declare-fun m!720717 () Bool)

(assert (=> b!776660 m!720717))

(declare-fun m!720719 () Bool)

(assert (=> b!776660 m!720719))

(declare-fun m!720721 () Bool)

(assert (=> b!776660 m!720721))

(assert (=> b!776660 m!720715))

(declare-fun m!720723 () Bool)

(assert (=> b!776660 m!720723))

(declare-fun m!720725 () Bool)

(assert (=> start!67172 m!720725))

(declare-fun m!720727 () Bool)

(assert (=> start!67172 m!720727))

(declare-fun m!720729 () Bool)

(assert (=> b!776662 m!720729))

(declare-fun m!720731 () Bool)

(assert (=> b!776662 m!720731))

(assert (=> b!776661 m!720699))

(assert (=> b!776661 m!720699))

(declare-fun m!720733 () Bool)

(assert (=> b!776661 m!720733))

(assert (=> b!776653 m!720699))

(assert (=> b!776653 m!720699))

(declare-fun m!720735 () Bool)

(assert (=> b!776653 m!720735))

(assert (=> b!776652 m!720699))

(assert (=> b!776652 m!720699))

(declare-fun m!720737 () Bool)

(assert (=> b!776652 m!720737))

(declare-fun m!720739 () Bool)

(assert (=> b!776664 m!720739))

(declare-fun m!720741 () Bool)

(assert (=> b!776655 m!720741))

(assert (=> b!776657 m!720699))

(assert (=> b!776657 m!720699))

(assert (=> b!776657 m!720735))

(assert (=> b!776665 m!720699))

(assert (=> b!776665 m!720699))

(declare-fun m!720743 () Bool)

(assert (=> b!776665 m!720743))

(check-sat (not b!776665) (not start!67172) (not b!776652) (not b!776667) (not b!776661) (not b!776660) (not b!776655) (not b!776662) (not b!776651) (not b!776653) (not b!776666) (not b!776664) (not b!776656) (not b!776654) (not b!776657))
