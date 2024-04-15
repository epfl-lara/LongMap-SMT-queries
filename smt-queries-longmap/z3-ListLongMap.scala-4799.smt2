; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65834 () Bool)

(assert start!65834)

(declare-fun b!758599 () Bool)

(declare-fun res!513323 () Bool)

(declare-fun e!422921 () Bool)

(assert (=> b!758599 (=> (not res!513323) (not e!422921))))

(declare-datatypes ((array!42024 0))(
  ( (array!42025 (arr!20126 (Array (_ BitVec 32) (_ BitVec 64))) (size!20547 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42024)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758599 (= res!513323 (validKeyInArray!0 (select (arr!20126 a!3186) j!159)))))

(declare-fun b!758600 () Bool)

(declare-fun e!422925 () Bool)

(declare-fun e!422918 () Bool)

(assert (=> b!758600 (= e!422925 e!422918)))

(declare-fun res!513332 () Bool)

(assert (=> b!758600 (=> res!513332 e!422918)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!758600 (= res!513332 (or (not (= (select (arr!20126 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-datatypes ((SeekEntryResult!7723 0))(
  ( (MissingZero!7723 (index!33260 (_ BitVec 32))) (Found!7723 (index!33261 (_ BitVec 32))) (Intermediate!7723 (undefined!8535 Bool) (index!33262 (_ BitVec 32)) (x!64156 (_ BitVec 32))) (Undefined!7723) (MissingVacant!7723 (index!33263 (_ BitVec 32))) )
))
(declare-fun lt!337911 () SeekEntryResult!7723)

(declare-fun lt!337906 () SeekEntryResult!7723)

(declare-fun lt!337912 () SeekEntryResult!7723)

(declare-fun lt!337913 () SeekEntryResult!7723)

(assert (=> b!758600 (and (= lt!337911 lt!337906) (= lt!337913 lt!337912))))

(declare-fun lt!337918 () array!42024)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!337917 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42024 (_ BitVec 32)) SeekEntryResult!7723)

(assert (=> b!758600 (= lt!337906 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337917 lt!337918 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42024 (_ BitVec 32)) SeekEntryResult!7723)

(assert (=> b!758600 (= lt!337911 (seekEntryOrOpen!0 lt!337917 lt!337918 mask!3328))))

(declare-fun lt!337909 () (_ BitVec 64))

(assert (=> b!758600 (= lt!337909 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!26252 0))(
  ( (Unit!26253) )
))
(declare-fun lt!337910 () Unit!26252)

(declare-fun e!422920 () Unit!26252)

(assert (=> b!758600 (= lt!337910 e!422920)))

(declare-fun c!83021 () Bool)

(assert (=> b!758600 (= c!83021 (= lt!337909 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!422915 () Bool)

(declare-fun b!758601 () Bool)

(assert (=> b!758601 (= e!422915 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20126 a!3186) j!159) a!3186 mask!3328) (Found!7723 j!159)))))

(declare-fun b!758602 () Bool)

(declare-fun e!422916 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!337915 () SeekEntryResult!7723)

(assert (=> b!758602 (= e!422916 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20126 a!3186) j!159) a!3186 mask!3328) lt!337915))))

(declare-fun b!758603 () Bool)

(declare-fun res!513335 () Bool)

(declare-fun e!422917 () Bool)

(assert (=> b!758603 (=> (not res!513335) (not e!422917))))

(assert (=> b!758603 (= res!513335 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20547 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20547 a!3186))))))

(declare-fun res!513322 () Bool)

(assert (=> start!65834 (=> (not res!513322) (not e!422921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65834 (= res!513322 (validMask!0 mask!3328))))

(assert (=> start!65834 e!422921))

(assert (=> start!65834 true))

(declare-fun array_inv!16009 (array!42024) Bool)

(assert (=> start!65834 (array_inv!16009 a!3186)))

(declare-fun b!758604 () Bool)

(declare-fun Unit!26254 () Unit!26252)

(assert (=> b!758604 (= e!422920 Unit!26254)))

(assert (=> b!758604 false))

(declare-fun b!758605 () Bool)

(declare-fun e!422922 () Bool)

(declare-fun e!422924 () Bool)

(assert (=> b!758605 (= e!422922 e!422924)))

(declare-fun res!513330 () Bool)

(assert (=> b!758605 (=> (not res!513330) (not e!422924))))

(declare-fun lt!337916 () SeekEntryResult!7723)

(declare-fun lt!337905 () SeekEntryResult!7723)

(assert (=> b!758605 (= res!513330 (= lt!337916 lt!337905))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42024 (_ BitVec 32)) SeekEntryResult!7723)

(assert (=> b!758605 (= lt!337905 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337917 lt!337918 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758605 (= lt!337916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337917 mask!3328) lt!337917 lt!337918 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!758605 (= lt!337917 (select (store (arr!20126 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758605 (= lt!337918 (array!42025 (store (arr!20126 a!3186) i!1173 k0!2102) (size!20547 a!3186)))))

(declare-fun b!758606 () Bool)

(declare-fun lt!337919 () SeekEntryResult!7723)

(assert (=> b!758606 (= e!422915 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20126 a!3186) j!159) a!3186 mask!3328) lt!337919))))

(declare-fun b!758607 () Bool)

(declare-fun e!422919 () Bool)

(assert (=> b!758607 (= e!422919 (validKeyInArray!0 lt!337917))))

(declare-fun b!758608 () Bool)

(declare-fun res!513318 () Bool)

(assert (=> b!758608 (=> (not res!513318) (not e!422922))))

(assert (=> b!758608 (= res!513318 e!422915)))

(declare-fun c!83022 () Bool)

(assert (=> b!758608 (= c!83022 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758609 () Bool)

(declare-fun e!422923 () Bool)

(assert (=> b!758609 (= e!422923 e!422925)))

(declare-fun res!513334 () Bool)

(assert (=> b!758609 (=> res!513334 e!422925)))

(assert (=> b!758609 (= res!513334 (= lt!337909 lt!337917))))

(assert (=> b!758609 (= lt!337909 (select (store (arr!20126 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758610 () Bool)

(declare-fun Unit!26255 () Unit!26252)

(assert (=> b!758610 (= e!422920 Unit!26255)))

(declare-fun b!758611 () Bool)

(declare-fun e!422914 () Bool)

(assert (=> b!758611 (= e!422924 (not e!422914))))

(declare-fun res!513321 () Bool)

(assert (=> b!758611 (=> res!513321 e!422914)))

(get-info :version)

(assert (=> b!758611 (= res!513321 (or (not ((_ is Intermediate!7723) lt!337905)) (bvslt x!1131 (x!64156 lt!337905)) (not (= x!1131 (x!64156 lt!337905))) (not (= index!1321 (index!33262 lt!337905)))))))

(assert (=> b!758611 e!422916))

(declare-fun res!513331 () Bool)

(assert (=> b!758611 (=> (not res!513331) (not e!422916))))

(assert (=> b!758611 (= res!513331 (= lt!337913 lt!337915))))

(assert (=> b!758611 (= lt!337915 (Found!7723 j!159))))

(assert (=> b!758611 (= lt!337913 (seekEntryOrOpen!0 (select (arr!20126 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42024 (_ BitVec 32)) Bool)

(assert (=> b!758611 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337914 () Unit!26252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26252)

(assert (=> b!758611 (= lt!337914 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758612 () Bool)

(declare-fun res!513333 () Bool)

(assert (=> b!758612 (=> (not res!513333) (not e!422917))))

(assert (=> b!758612 (= res!513333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758613 () Bool)

(declare-fun res!513336 () Bool)

(assert (=> b!758613 (=> (not res!513336) (not e!422921))))

(declare-fun arrayContainsKey!0 (array!42024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758613 (= res!513336 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758614 () Bool)

(assert (=> b!758614 (= e!422917 e!422922)))

(declare-fun res!513329 () Bool)

(assert (=> b!758614 (=> (not res!513329) (not e!422922))))

(assert (=> b!758614 (= res!513329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20126 a!3186) j!159) mask!3328) (select (arr!20126 a!3186) j!159) a!3186 mask!3328) lt!337919))))

(assert (=> b!758614 (= lt!337919 (Intermediate!7723 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758615 () Bool)

(assert (=> b!758615 (= e!422918 e!422919)))

(declare-fun res!513324 () Bool)

(assert (=> b!758615 (=> res!513324 e!422919)))

(assert (=> b!758615 (= res!513324 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!758615 (= lt!337906 lt!337912)))

(declare-fun lt!337907 () Unit!26252)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42024 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26252)

(assert (=> b!758615 (= lt!337907 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758616 () Bool)

(declare-fun res!513325 () Bool)

(assert (=> b!758616 (=> (not res!513325) (not e!422921))))

(assert (=> b!758616 (= res!513325 (and (= (size!20547 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20547 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20547 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758617 () Bool)

(declare-fun res!513326 () Bool)

(assert (=> b!758617 (=> (not res!513326) (not e!422921))))

(assert (=> b!758617 (= res!513326 (validKeyInArray!0 k0!2102))))

(declare-fun b!758618 () Bool)

(assert (=> b!758618 (= e!422914 e!422923)))

(declare-fun res!513319 () Bool)

(assert (=> b!758618 (=> res!513319 e!422923)))

(assert (=> b!758618 (= res!513319 (not (= lt!337912 lt!337915)))))

(assert (=> b!758618 (= lt!337912 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20126 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758619 () Bool)

(declare-fun res!513320 () Bool)

(assert (=> b!758619 (=> (not res!513320) (not e!422922))))

(assert (=> b!758619 (= res!513320 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20126 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758620 () Bool)

(assert (=> b!758620 (= e!422921 e!422917)))

(declare-fun res!513328 () Bool)

(assert (=> b!758620 (=> (not res!513328) (not e!422917))))

(declare-fun lt!337908 () SeekEntryResult!7723)

(assert (=> b!758620 (= res!513328 (or (= lt!337908 (MissingZero!7723 i!1173)) (= lt!337908 (MissingVacant!7723 i!1173))))))

(assert (=> b!758620 (= lt!337908 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758621 () Bool)

(declare-fun res!513327 () Bool)

(assert (=> b!758621 (=> (not res!513327) (not e!422917))))

(declare-datatypes ((List!14167 0))(
  ( (Nil!14164) (Cons!14163 (h!15235 (_ BitVec 64)) (t!20473 List!14167)) )
))
(declare-fun arrayNoDuplicates!0 (array!42024 (_ BitVec 32) List!14167) Bool)

(assert (=> b!758621 (= res!513327 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14164))))

(assert (= (and start!65834 res!513322) b!758616))

(assert (= (and b!758616 res!513325) b!758599))

(assert (= (and b!758599 res!513323) b!758617))

(assert (= (and b!758617 res!513326) b!758613))

(assert (= (and b!758613 res!513336) b!758620))

(assert (= (and b!758620 res!513328) b!758612))

(assert (= (and b!758612 res!513333) b!758621))

(assert (= (and b!758621 res!513327) b!758603))

(assert (= (and b!758603 res!513335) b!758614))

(assert (= (and b!758614 res!513329) b!758619))

(assert (= (and b!758619 res!513320) b!758608))

(assert (= (and b!758608 c!83022) b!758606))

(assert (= (and b!758608 (not c!83022)) b!758601))

(assert (= (and b!758608 res!513318) b!758605))

(assert (= (and b!758605 res!513330) b!758611))

(assert (= (and b!758611 res!513331) b!758602))

(assert (= (and b!758611 (not res!513321)) b!758618))

(assert (= (and b!758618 (not res!513319)) b!758609))

(assert (= (and b!758609 (not res!513334)) b!758600))

(assert (= (and b!758600 c!83021) b!758604))

(assert (= (and b!758600 (not c!83021)) b!758610))

(assert (= (and b!758600 (not res!513332)) b!758615))

(assert (= (and b!758615 (not res!513324)) b!758607))

(declare-fun m!705509 () Bool)

(assert (=> b!758613 m!705509))

(declare-fun m!705511 () Bool)

(assert (=> b!758618 m!705511))

(assert (=> b!758618 m!705511))

(declare-fun m!705513 () Bool)

(assert (=> b!758618 m!705513))

(assert (=> b!758601 m!705511))

(assert (=> b!758601 m!705511))

(assert (=> b!758601 m!705513))

(declare-fun m!705515 () Bool)

(assert (=> b!758619 m!705515))

(declare-fun m!705517 () Bool)

(assert (=> b!758617 m!705517))

(assert (=> b!758599 m!705511))

(assert (=> b!758599 m!705511))

(declare-fun m!705519 () Bool)

(assert (=> b!758599 m!705519))

(declare-fun m!705521 () Bool)

(assert (=> b!758615 m!705521))

(assert (=> b!758606 m!705511))

(assert (=> b!758606 m!705511))

(declare-fun m!705523 () Bool)

(assert (=> b!758606 m!705523))

(declare-fun m!705525 () Bool)

(assert (=> b!758612 m!705525))

(assert (=> b!758614 m!705511))

(assert (=> b!758614 m!705511))

(declare-fun m!705527 () Bool)

(assert (=> b!758614 m!705527))

(assert (=> b!758614 m!705527))

(assert (=> b!758614 m!705511))

(declare-fun m!705529 () Bool)

(assert (=> b!758614 m!705529))

(assert (=> b!758611 m!705511))

(assert (=> b!758611 m!705511))

(declare-fun m!705531 () Bool)

(assert (=> b!758611 m!705531))

(declare-fun m!705533 () Bool)

(assert (=> b!758611 m!705533))

(declare-fun m!705535 () Bool)

(assert (=> b!758611 m!705535))

(declare-fun m!705537 () Bool)

(assert (=> b!758605 m!705537))

(declare-fun m!705539 () Bool)

(assert (=> b!758605 m!705539))

(declare-fun m!705541 () Bool)

(assert (=> b!758605 m!705541))

(assert (=> b!758605 m!705537))

(declare-fun m!705543 () Bool)

(assert (=> b!758605 m!705543))

(declare-fun m!705545 () Bool)

(assert (=> b!758605 m!705545))

(declare-fun m!705547 () Bool)

(assert (=> start!65834 m!705547))

(declare-fun m!705549 () Bool)

(assert (=> start!65834 m!705549))

(declare-fun m!705551 () Bool)

(assert (=> b!758600 m!705551))

(declare-fun m!705553 () Bool)

(assert (=> b!758600 m!705553))

(declare-fun m!705555 () Bool)

(assert (=> b!758600 m!705555))

(declare-fun m!705557 () Bool)

(assert (=> b!758607 m!705557))

(assert (=> b!758609 m!705539))

(declare-fun m!705559 () Bool)

(assert (=> b!758609 m!705559))

(declare-fun m!705561 () Bool)

(assert (=> b!758620 m!705561))

(assert (=> b!758602 m!705511))

(assert (=> b!758602 m!705511))

(declare-fun m!705563 () Bool)

(assert (=> b!758602 m!705563))

(declare-fun m!705565 () Bool)

(assert (=> b!758621 m!705565))

(check-sat (not b!758605) (not b!758612) (not start!65834) (not b!758615) (not b!758614) (not b!758617) (not b!758620) (not b!758621) (not b!758613) (not b!758602) (not b!758618) (not b!758600) (not b!758607) (not b!758611) (not b!758599) (not b!758606) (not b!758601))
(check-sat)
