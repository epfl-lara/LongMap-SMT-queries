; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65768 () Bool)

(assert start!65768)

(declare-fun b!756349 () Bool)

(declare-fun res!511478 () Bool)

(declare-fun e!421724 () Bool)

(assert (=> b!756349 (=> (not res!511478) (not e!421724))))

(declare-fun e!421731 () Bool)

(assert (=> b!756349 (= res!511478 e!421731)))

(declare-fun c!82823 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756349 (= c!82823 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756350 () Bool)

(declare-fun res!511477 () Bool)

(declare-fun e!421726 () Bool)

(assert (=> b!756350 (=> (not res!511477) (not e!421726))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41958 0))(
  ( (array!41959 (arr!20093 (Array (_ BitVec 32) (_ BitVec 64))) (size!20514 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41958)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!756350 (= res!511477 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20514 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20514 a!3186))))))

(declare-fun b!756351 () Bool)

(declare-datatypes ((Unit!26120 0))(
  ( (Unit!26121) )
))
(declare-fun e!421733 () Unit!26120)

(declare-fun Unit!26122 () Unit!26120)

(assert (=> b!756351 (= e!421733 Unit!26122)))

(assert (=> b!756351 false))

(declare-fun b!756352 () Bool)

(declare-fun res!511466 () Bool)

(assert (=> b!756352 (=> (not res!511466) (not e!421724))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756352 (= res!511466 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20093 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756353 () Bool)

(declare-fun e!421727 () Bool)

(assert (=> b!756353 (= e!421727 e!421726)))

(declare-fun res!511472 () Bool)

(assert (=> b!756353 (=> (not res!511472) (not e!421726))))

(declare-datatypes ((SeekEntryResult!7690 0))(
  ( (MissingZero!7690 (index!33128 (_ BitVec 32))) (Found!7690 (index!33129 (_ BitVec 32))) (Intermediate!7690 (undefined!8502 Bool) (index!33130 (_ BitVec 32)) (x!64035 (_ BitVec 32))) (Undefined!7690) (MissingVacant!7690 (index!33131 (_ BitVec 32))) )
))
(declare-fun lt!336634 () SeekEntryResult!7690)

(assert (=> b!756353 (= res!511472 (or (= lt!336634 (MissingZero!7690 i!1173)) (= lt!336634 (MissingVacant!7690 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41958 (_ BitVec 32)) SeekEntryResult!7690)

(assert (=> b!756353 (= lt!336634 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756354 () Bool)

(declare-fun e!421732 () Bool)

(declare-fun e!421728 () Bool)

(assert (=> b!756354 (= e!421732 e!421728)))

(declare-fun res!511476 () Bool)

(assert (=> b!756354 (=> res!511476 e!421728)))

(declare-fun lt!336635 () (_ BitVec 64))

(declare-fun lt!336636 () (_ BitVec 64))

(assert (=> b!756354 (= res!511476 (= lt!336635 lt!336636))))

(assert (=> b!756354 (= lt!336635 (select (store (arr!20093 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756355 () Bool)

(declare-fun e!421734 () Bool)

(declare-fun e!421729 () Bool)

(assert (=> b!756355 (= e!421734 (not e!421729))))

(declare-fun res!511465 () Bool)

(assert (=> b!756355 (=> res!511465 e!421729)))

(declare-fun lt!336638 () SeekEntryResult!7690)

(get-info :version)

(assert (=> b!756355 (= res!511465 (or (not ((_ is Intermediate!7690) lt!336638)) (bvslt x!1131 (x!64035 lt!336638)) (not (= x!1131 (x!64035 lt!336638))) (not (= index!1321 (index!33130 lt!336638)))))))

(declare-fun e!421735 () Bool)

(assert (=> b!756355 e!421735))

(declare-fun res!511479 () Bool)

(assert (=> b!756355 (=> (not res!511479) (not e!421735))))

(declare-fun lt!336637 () SeekEntryResult!7690)

(declare-fun lt!336631 () SeekEntryResult!7690)

(assert (=> b!756355 (= res!511479 (= lt!336637 lt!336631))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!756355 (= lt!336631 (Found!7690 j!159))))

(assert (=> b!756355 (= lt!336637 (seekEntryOrOpen!0 (select (arr!20093 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41958 (_ BitVec 32)) Bool)

(assert (=> b!756355 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336630 () Unit!26120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41958 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26120)

(assert (=> b!756355 (= lt!336630 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756356 () Bool)

(declare-fun res!511464 () Bool)

(assert (=> b!756356 (=> (not res!511464) (not e!421727))))

(declare-fun arrayContainsKey!0 (array!41958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756356 (= res!511464 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756357 () Bool)

(declare-fun Unit!26123 () Unit!26120)

(assert (=> b!756357 (= e!421733 Unit!26123)))

(declare-fun b!756358 () Bool)

(assert (=> b!756358 (= e!421728 true)))

(declare-fun e!421730 () Bool)

(assert (=> b!756358 e!421730))

(declare-fun res!511480 () Bool)

(assert (=> b!756358 (=> (not res!511480) (not e!421730))))

(assert (=> b!756358 (= res!511480 (= lt!336635 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336632 () Unit!26120)

(assert (=> b!756358 (= lt!336632 e!421733)))

(declare-fun c!82824 () Bool)

(assert (=> b!756358 (= c!82824 (= lt!336635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756359 () Bool)

(declare-fun res!511470 () Bool)

(assert (=> b!756359 (=> (not res!511470) (not e!421726))))

(assert (=> b!756359 (= res!511470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756360 () Bool)

(declare-fun res!511474 () Bool)

(assert (=> b!756360 (=> (not res!511474) (not e!421727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756360 (= res!511474 (validKeyInArray!0 k0!2102))))

(declare-fun res!511475 () Bool)

(assert (=> start!65768 (=> (not res!511475) (not e!421727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65768 (= res!511475 (validMask!0 mask!3328))))

(assert (=> start!65768 e!421727))

(assert (=> start!65768 true))

(declare-fun array_inv!15976 (array!41958) Bool)

(assert (=> start!65768 (array_inv!15976 a!3186)))

(declare-fun b!756361 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41958 (_ BitVec 32)) SeekEntryResult!7690)

(assert (=> b!756361 (= e!421735 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20093 a!3186) j!159) a!3186 mask!3328) lt!336631))))

(declare-fun b!756362 () Bool)

(assert (=> b!756362 (= e!421726 e!421724)))

(declare-fun res!511469 () Bool)

(assert (=> b!756362 (=> (not res!511469) (not e!421724))))

(declare-fun lt!336641 () SeekEntryResult!7690)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41958 (_ BitVec 32)) SeekEntryResult!7690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756362 (= res!511469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20093 a!3186) j!159) mask!3328) (select (arr!20093 a!3186) j!159) a!3186 mask!3328) lt!336641))))

(assert (=> b!756362 (= lt!336641 (Intermediate!7690 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756363 () Bool)

(declare-fun lt!336639 () SeekEntryResult!7690)

(assert (=> b!756363 (= e!421730 (= lt!336637 lt!336639))))

(declare-fun b!756364 () Bool)

(declare-fun res!511468 () Bool)

(assert (=> b!756364 (=> (not res!511468) (not e!421730))))

(declare-fun lt!336633 () array!41958)

(assert (=> b!756364 (= res!511468 (= (seekEntryOrOpen!0 lt!336636 lt!336633 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336636 lt!336633 mask!3328)))))

(declare-fun b!756365 () Bool)

(declare-fun res!511473 () Bool)

(assert (=> b!756365 (=> (not res!511473) (not e!421727))))

(assert (=> b!756365 (= res!511473 (and (= (size!20514 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20514 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20514 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756366 () Bool)

(assert (=> b!756366 (= e!421729 e!421732)))

(declare-fun res!511467 () Bool)

(assert (=> b!756366 (=> res!511467 e!421732)))

(assert (=> b!756366 (= res!511467 (not (= lt!336639 lt!336631)))))

(assert (=> b!756366 (= lt!336639 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20093 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756367 () Bool)

(declare-fun res!511482 () Bool)

(assert (=> b!756367 (=> (not res!511482) (not e!421727))))

(assert (=> b!756367 (= res!511482 (validKeyInArray!0 (select (arr!20093 a!3186) j!159)))))

(declare-fun b!756368 () Bool)

(assert (=> b!756368 (= e!421731 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20093 a!3186) j!159) a!3186 mask!3328) lt!336641))))

(declare-fun b!756369 () Bool)

(assert (=> b!756369 (= e!421724 e!421734)))

(declare-fun res!511481 () Bool)

(assert (=> b!756369 (=> (not res!511481) (not e!421734))))

(declare-fun lt!336640 () SeekEntryResult!7690)

(assert (=> b!756369 (= res!511481 (= lt!336640 lt!336638))))

(assert (=> b!756369 (= lt!336638 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336636 lt!336633 mask!3328))))

(assert (=> b!756369 (= lt!336640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336636 mask!3328) lt!336636 lt!336633 mask!3328))))

(assert (=> b!756369 (= lt!336636 (select (store (arr!20093 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756369 (= lt!336633 (array!41959 (store (arr!20093 a!3186) i!1173 k0!2102) (size!20514 a!3186)))))

(declare-fun b!756370 () Bool)

(assert (=> b!756370 (= e!421731 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20093 a!3186) j!159) a!3186 mask!3328) (Found!7690 j!159)))))

(declare-fun b!756371 () Bool)

(declare-fun res!511471 () Bool)

(assert (=> b!756371 (=> (not res!511471) (not e!421726))))

(declare-datatypes ((List!14134 0))(
  ( (Nil!14131) (Cons!14130 (h!15202 (_ BitVec 64)) (t!20440 List!14134)) )
))
(declare-fun arrayNoDuplicates!0 (array!41958 (_ BitVec 32) List!14134) Bool)

(assert (=> b!756371 (= res!511471 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14131))))

(assert (= (and start!65768 res!511475) b!756365))

(assert (= (and b!756365 res!511473) b!756367))

(assert (= (and b!756367 res!511482) b!756360))

(assert (= (and b!756360 res!511474) b!756356))

(assert (= (and b!756356 res!511464) b!756353))

(assert (= (and b!756353 res!511472) b!756359))

(assert (= (and b!756359 res!511470) b!756371))

(assert (= (and b!756371 res!511471) b!756350))

(assert (= (and b!756350 res!511477) b!756362))

(assert (= (and b!756362 res!511469) b!756352))

(assert (= (and b!756352 res!511466) b!756349))

(assert (= (and b!756349 c!82823) b!756368))

(assert (= (and b!756349 (not c!82823)) b!756370))

(assert (= (and b!756349 res!511478) b!756369))

(assert (= (and b!756369 res!511481) b!756355))

(assert (= (and b!756355 res!511479) b!756361))

(assert (= (and b!756355 (not res!511465)) b!756366))

(assert (= (and b!756366 (not res!511467)) b!756354))

(assert (= (and b!756354 (not res!511476)) b!756358))

(assert (= (and b!756358 c!82824) b!756351))

(assert (= (and b!756358 (not c!82824)) b!756357))

(assert (= (and b!756358 res!511480) b!756364))

(assert (= (and b!756364 res!511468) b!756363))

(declare-fun m!703757 () Bool)

(assert (=> b!756370 m!703757))

(assert (=> b!756370 m!703757))

(declare-fun m!703759 () Bool)

(assert (=> b!756370 m!703759))

(declare-fun m!703761 () Bool)

(assert (=> b!756352 m!703761))

(declare-fun m!703763 () Bool)

(assert (=> b!756371 m!703763))

(declare-fun m!703765 () Bool)

(assert (=> b!756354 m!703765))

(declare-fun m!703767 () Bool)

(assert (=> b!756354 m!703767))

(assert (=> b!756362 m!703757))

(assert (=> b!756362 m!703757))

(declare-fun m!703769 () Bool)

(assert (=> b!756362 m!703769))

(assert (=> b!756362 m!703769))

(assert (=> b!756362 m!703757))

(declare-fun m!703771 () Bool)

(assert (=> b!756362 m!703771))

(declare-fun m!703773 () Bool)

(assert (=> b!756353 m!703773))

(declare-fun m!703775 () Bool)

(assert (=> b!756359 m!703775))

(assert (=> b!756366 m!703757))

(assert (=> b!756366 m!703757))

(assert (=> b!756366 m!703759))

(assert (=> b!756368 m!703757))

(assert (=> b!756368 m!703757))

(declare-fun m!703777 () Bool)

(assert (=> b!756368 m!703777))

(declare-fun m!703779 () Bool)

(assert (=> b!756369 m!703779))

(assert (=> b!756369 m!703779))

(declare-fun m!703781 () Bool)

(assert (=> b!756369 m!703781))

(assert (=> b!756369 m!703765))

(declare-fun m!703783 () Bool)

(assert (=> b!756369 m!703783))

(declare-fun m!703785 () Bool)

(assert (=> b!756369 m!703785))

(assert (=> b!756367 m!703757))

(assert (=> b!756367 m!703757))

(declare-fun m!703787 () Bool)

(assert (=> b!756367 m!703787))

(declare-fun m!703789 () Bool)

(assert (=> b!756364 m!703789))

(declare-fun m!703791 () Bool)

(assert (=> b!756364 m!703791))

(declare-fun m!703793 () Bool)

(assert (=> start!65768 m!703793))

(declare-fun m!703795 () Bool)

(assert (=> start!65768 m!703795))

(assert (=> b!756355 m!703757))

(assert (=> b!756355 m!703757))

(declare-fun m!703797 () Bool)

(assert (=> b!756355 m!703797))

(declare-fun m!703799 () Bool)

(assert (=> b!756355 m!703799))

(declare-fun m!703801 () Bool)

(assert (=> b!756355 m!703801))

(assert (=> b!756361 m!703757))

(assert (=> b!756361 m!703757))

(declare-fun m!703803 () Bool)

(assert (=> b!756361 m!703803))

(declare-fun m!703805 () Bool)

(assert (=> b!756360 m!703805))

(declare-fun m!703807 () Bool)

(assert (=> b!756356 m!703807))

(check-sat (not b!756353) (not b!756370) (not b!756364) (not b!756366) (not b!756360) (not b!756369) (not b!756356) (not start!65768) (not b!756361) (not b!756355) (not b!756371) (not b!756367) (not b!756359) (not b!756362) (not b!756368))
(check-sat)
