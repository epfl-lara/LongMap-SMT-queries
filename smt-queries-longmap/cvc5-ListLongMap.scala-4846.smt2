; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66774 () Bool)

(assert start!66774)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42336 0))(
  ( (array!42337 (arr!20268 (Array (_ BitVec 32) (_ BitVec 64))) (size!20689 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42336)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!769616 () Bool)

(declare-datatypes ((SeekEntryResult!7868 0))(
  ( (MissingZero!7868 (index!33840 (_ BitVec 32))) (Found!7868 (index!33841 (_ BitVec 32))) (Intermediate!7868 (undefined!8680 Bool) (index!33842 (_ BitVec 32)) (x!64775 (_ BitVec 32))) (Undefined!7868) (MissingVacant!7868 (index!33843 (_ BitVec 32))) )
))
(declare-fun lt!342442 () SeekEntryResult!7868)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!428549 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42336 (_ BitVec 32)) SeekEntryResult!7868)

(assert (=> b!769616 (= e!428549 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20268 a!3186) j!159) a!3186 mask!3328) lt!342442))))

(declare-fun b!769617 () Bool)

(declare-fun res!520504 () Bool)

(declare-fun e!428547 () Bool)

(assert (=> b!769617 (=> (not res!520504) (not e!428547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42336 (_ BitVec 32)) Bool)

(assert (=> b!769617 (= res!520504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769618 () Bool)

(declare-datatypes ((Unit!26486 0))(
  ( (Unit!26487) )
))
(declare-fun e!428543 () Unit!26486)

(declare-fun Unit!26488 () Unit!26486)

(assert (=> b!769618 (= e!428543 Unit!26488)))

(declare-fun lt!342444 () (_ BitVec 32))

(declare-fun lt!342451 () SeekEntryResult!7868)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42336 (_ BitVec 32)) SeekEntryResult!7868)

(assert (=> b!769618 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342444 (select (arr!20268 a!3186) j!159) a!3186 mask!3328) lt!342451)))

(declare-fun b!769619 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!428542 () Bool)

(assert (=> b!769619 (= e!428542 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20268 a!3186) j!159) a!3186 mask!3328) (Found!7868 j!159)))))

(declare-fun b!769620 () Bool)

(declare-fun Unit!26489 () Unit!26486)

(assert (=> b!769620 (= e!428543 Unit!26489)))

(declare-fun lt!342448 () SeekEntryResult!7868)

(assert (=> b!769620 (= lt!342448 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20268 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769620 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342444 resIntermediateIndex!5 (select (arr!20268 a!3186) j!159) a!3186 mask!3328) (Found!7868 j!159))))

(declare-fun b!769621 () Bool)

(declare-fun res!520501 () Bool)

(declare-fun e!428545 () Bool)

(assert (=> b!769621 (=> (not res!520501) (not e!428545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769621 (= res!520501 (validKeyInArray!0 (select (arr!20268 a!3186) j!159)))))

(declare-fun b!769622 () Bool)

(declare-fun e!428546 () Bool)

(declare-fun e!428544 () Bool)

(assert (=> b!769622 (= e!428546 e!428544)))

(declare-fun res!520494 () Bool)

(assert (=> b!769622 (=> (not res!520494) (not e!428544))))

(declare-fun lt!342449 () SeekEntryResult!7868)

(declare-fun lt!342446 () SeekEntryResult!7868)

(assert (=> b!769622 (= res!520494 (= lt!342449 lt!342446))))

(declare-fun lt!342447 () array!42336)

(declare-fun lt!342443 () (_ BitVec 64))

(assert (=> b!769622 (= lt!342446 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342443 lt!342447 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769622 (= lt!342449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342443 mask!3328) lt!342443 lt!342447 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!769622 (= lt!342443 (select (store (arr!20268 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769622 (= lt!342447 (array!42337 (store (arr!20268 a!3186) i!1173 k!2102) (size!20689 a!3186)))))

(declare-fun b!769623 () Bool)

(declare-fun e!428548 () Bool)

(assert (=> b!769623 (= e!428544 (not e!428548))))

(declare-fun res!520502 () Bool)

(assert (=> b!769623 (=> res!520502 e!428548)))

(assert (=> b!769623 (= res!520502 (or (not (is-Intermediate!7868 lt!342446)) (bvsge x!1131 (x!64775 lt!342446))))))

(declare-fun e!428541 () Bool)

(assert (=> b!769623 e!428541))

(declare-fun res!520498 () Bool)

(assert (=> b!769623 (=> (not res!520498) (not e!428541))))

(assert (=> b!769623 (= res!520498 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342445 () Unit!26486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26486)

(assert (=> b!769623 (= lt!342445 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769624 () Bool)

(assert (=> b!769624 (= e!428548 true)))

(declare-fun lt!342452 () Unit!26486)

(assert (=> b!769624 (= lt!342452 e!428543)))

(declare-fun c!84958 () Bool)

(assert (=> b!769624 (= c!84958 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769624 (= lt!342444 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769626 () Bool)

(assert (=> b!769626 (= e!428542 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20268 a!3186) j!159) a!3186 mask!3328) lt!342451))))

(declare-fun b!769627 () Bool)

(assert (=> b!769627 (= e!428547 e!428546)))

(declare-fun res!520507 () Bool)

(assert (=> b!769627 (=> (not res!520507) (not e!428546))))

(assert (=> b!769627 (= res!520507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20268 a!3186) j!159) mask!3328) (select (arr!20268 a!3186) j!159) a!3186 mask!3328) lt!342451))))

(assert (=> b!769627 (= lt!342451 (Intermediate!7868 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769628 () Bool)

(assert (=> b!769628 (= e!428541 e!428549)))

(declare-fun res!520496 () Bool)

(assert (=> b!769628 (=> (not res!520496) (not e!428549))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42336 (_ BitVec 32)) SeekEntryResult!7868)

(assert (=> b!769628 (= res!520496 (= (seekEntryOrOpen!0 (select (arr!20268 a!3186) j!159) a!3186 mask!3328) lt!342442))))

(assert (=> b!769628 (= lt!342442 (Found!7868 j!159))))

(declare-fun b!769629 () Bool)

(declare-fun res!520497 () Bool)

(assert (=> b!769629 (=> (not res!520497) (not e!428547))))

(assert (=> b!769629 (= res!520497 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20689 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20689 a!3186))))))

(declare-fun b!769630 () Bool)

(declare-fun res!520500 () Bool)

(assert (=> b!769630 (=> (not res!520500) (not e!428545))))

(declare-fun arrayContainsKey!0 (array!42336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769630 (= res!520500 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769631 () Bool)

(declare-fun res!520503 () Bool)

(assert (=> b!769631 (=> (not res!520503) (not e!428546))))

(assert (=> b!769631 (= res!520503 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20268 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769632 () Bool)

(declare-fun res!520506 () Bool)

(assert (=> b!769632 (=> (not res!520506) (not e!428546))))

(assert (=> b!769632 (= res!520506 e!428542)))

(declare-fun c!84957 () Bool)

(assert (=> b!769632 (= c!84957 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769633 () Bool)

(assert (=> b!769633 (= e!428545 e!428547)))

(declare-fun res!520508 () Bool)

(assert (=> b!769633 (=> (not res!520508) (not e!428547))))

(declare-fun lt!342450 () SeekEntryResult!7868)

(assert (=> b!769633 (= res!520508 (or (= lt!342450 (MissingZero!7868 i!1173)) (= lt!342450 (MissingVacant!7868 i!1173))))))

(assert (=> b!769633 (= lt!342450 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!520493 () Bool)

(assert (=> start!66774 (=> (not res!520493) (not e!428545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66774 (= res!520493 (validMask!0 mask!3328))))

(assert (=> start!66774 e!428545))

(assert (=> start!66774 true))

(declare-fun array_inv!16064 (array!42336) Bool)

(assert (=> start!66774 (array_inv!16064 a!3186)))

(declare-fun b!769625 () Bool)

(declare-fun res!520505 () Bool)

(assert (=> b!769625 (=> (not res!520505) (not e!428545))))

(assert (=> b!769625 (= res!520505 (validKeyInArray!0 k!2102))))

(declare-fun b!769634 () Bool)

(declare-fun res!520495 () Bool)

(assert (=> b!769634 (=> (not res!520495) (not e!428545))))

(assert (=> b!769634 (= res!520495 (and (= (size!20689 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20689 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20689 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769635 () Bool)

(declare-fun res!520499 () Bool)

(assert (=> b!769635 (=> (not res!520499) (not e!428547))))

(declare-datatypes ((List!14270 0))(
  ( (Nil!14267) (Cons!14266 (h!15365 (_ BitVec 64)) (t!20585 List!14270)) )
))
(declare-fun arrayNoDuplicates!0 (array!42336 (_ BitVec 32) List!14270) Bool)

(assert (=> b!769635 (= res!520499 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14267))))

(assert (= (and start!66774 res!520493) b!769634))

(assert (= (and b!769634 res!520495) b!769621))

(assert (= (and b!769621 res!520501) b!769625))

(assert (= (and b!769625 res!520505) b!769630))

(assert (= (and b!769630 res!520500) b!769633))

(assert (= (and b!769633 res!520508) b!769617))

(assert (= (and b!769617 res!520504) b!769635))

(assert (= (and b!769635 res!520499) b!769629))

(assert (= (and b!769629 res!520497) b!769627))

(assert (= (and b!769627 res!520507) b!769631))

(assert (= (and b!769631 res!520503) b!769632))

(assert (= (and b!769632 c!84957) b!769626))

(assert (= (and b!769632 (not c!84957)) b!769619))

(assert (= (and b!769632 res!520506) b!769622))

(assert (= (and b!769622 res!520494) b!769623))

(assert (= (and b!769623 res!520498) b!769628))

(assert (= (and b!769628 res!520496) b!769616))

(assert (= (and b!769623 (not res!520502)) b!769624))

(assert (= (and b!769624 c!84958) b!769618))

(assert (= (and b!769624 (not c!84958)) b!769620))

(declare-fun m!715007 () Bool)

(assert (=> b!769630 m!715007))

(declare-fun m!715009 () Bool)

(assert (=> b!769631 m!715009))

(declare-fun m!715011 () Bool)

(assert (=> b!769621 m!715011))

(assert (=> b!769621 m!715011))

(declare-fun m!715013 () Bool)

(assert (=> b!769621 m!715013))

(assert (=> b!769618 m!715011))

(assert (=> b!769618 m!715011))

(declare-fun m!715015 () Bool)

(assert (=> b!769618 m!715015))

(declare-fun m!715017 () Bool)

(assert (=> b!769623 m!715017))

(declare-fun m!715019 () Bool)

(assert (=> b!769623 m!715019))

(declare-fun m!715021 () Bool)

(assert (=> b!769633 m!715021))

(assert (=> b!769628 m!715011))

(assert (=> b!769628 m!715011))

(declare-fun m!715023 () Bool)

(assert (=> b!769628 m!715023))

(declare-fun m!715025 () Bool)

(assert (=> b!769625 m!715025))

(assert (=> b!769616 m!715011))

(assert (=> b!769616 m!715011))

(declare-fun m!715027 () Bool)

(assert (=> b!769616 m!715027))

(declare-fun m!715029 () Bool)

(assert (=> b!769617 m!715029))

(declare-fun m!715031 () Bool)

(assert (=> start!66774 m!715031))

(declare-fun m!715033 () Bool)

(assert (=> start!66774 m!715033))

(declare-fun m!715035 () Bool)

(assert (=> b!769635 m!715035))

(assert (=> b!769619 m!715011))

(assert (=> b!769619 m!715011))

(declare-fun m!715037 () Bool)

(assert (=> b!769619 m!715037))

(assert (=> b!769627 m!715011))

(assert (=> b!769627 m!715011))

(declare-fun m!715039 () Bool)

(assert (=> b!769627 m!715039))

(assert (=> b!769627 m!715039))

(assert (=> b!769627 m!715011))

(declare-fun m!715041 () Bool)

(assert (=> b!769627 m!715041))

(declare-fun m!715043 () Bool)

(assert (=> b!769624 m!715043))

(assert (=> b!769626 m!715011))

(assert (=> b!769626 m!715011))

(declare-fun m!715045 () Bool)

(assert (=> b!769626 m!715045))

(declare-fun m!715047 () Bool)

(assert (=> b!769622 m!715047))

(declare-fun m!715049 () Bool)

(assert (=> b!769622 m!715049))

(declare-fun m!715051 () Bool)

(assert (=> b!769622 m!715051))

(declare-fun m!715053 () Bool)

(assert (=> b!769622 m!715053))

(declare-fun m!715055 () Bool)

(assert (=> b!769622 m!715055))

(assert (=> b!769622 m!715047))

(assert (=> b!769620 m!715011))

(assert (=> b!769620 m!715011))

(assert (=> b!769620 m!715037))

(assert (=> b!769620 m!715011))

(declare-fun m!715057 () Bool)

(assert (=> b!769620 m!715057))

(push 1)

