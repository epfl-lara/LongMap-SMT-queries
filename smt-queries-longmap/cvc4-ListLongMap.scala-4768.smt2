; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65672 () Bool)

(assert start!65672)

(declare-fun b!752597 () Bool)

(declare-fun e!419795 () Bool)

(declare-fun e!419797 () Bool)

(assert (=> b!752597 (= e!419795 e!419797)))

(declare-fun res!508269 () Bool)

(assert (=> b!752597 (=> (not res!508269) (not e!419797))))

(declare-datatypes ((SeekEntryResult!7636 0))(
  ( (MissingZero!7636 (index!32912 (_ BitVec 32))) (Found!7636 (index!32913 (_ BitVec 32))) (Intermediate!7636 (undefined!8448 Bool) (index!32914 (_ BitVec 32)) (x!63826 (_ BitVec 32))) (Undefined!7636) (MissingVacant!7636 (index!32915 (_ BitVec 32))) )
))
(declare-fun lt!334790 () SeekEntryResult!7636)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752597 (= res!508269 (or (= lt!334790 (MissingZero!7636 i!1173)) (= lt!334790 (MissingVacant!7636 i!1173))))))

(declare-datatypes ((array!41845 0))(
  ( (array!41846 (arr!20036 (Array (_ BitVec 32) (_ BitVec 64))) (size!20457 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41845)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41845 (_ BitVec 32)) SeekEntryResult!7636)

(assert (=> b!752597 (= lt!334790 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!752598 () Bool)

(declare-fun res!508280 () Bool)

(declare-fun e!419793 () Bool)

(assert (=> b!752598 (=> (not res!508280) (not e!419793))))

(declare-fun e!419801 () Bool)

(assert (=> b!752598 (= res!508280 e!419801)))

(declare-fun c!82545 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752598 (= c!82545 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752599 () Bool)

(declare-fun res!508268 () Bool)

(assert (=> b!752599 (=> (not res!508268) (not e!419795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752599 (= res!508268 (validKeyInArray!0 k!2102))))

(declare-fun lt!334785 () SeekEntryResult!7636)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!419800 () Bool)

(declare-fun b!752600 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41845 (_ BitVec 32)) SeekEntryResult!7636)

(assert (=> b!752600 (= e!419800 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20036 a!3186) j!159) a!3186 mask!3328) lt!334785))))

(declare-fun b!752601 () Bool)

(declare-fun e!419792 () Bool)

(assert (=> b!752601 (= e!419793 e!419792)))

(declare-fun res!508279 () Bool)

(assert (=> b!752601 (=> (not res!508279) (not e!419792))))

(declare-fun lt!334793 () SeekEntryResult!7636)

(declare-fun lt!334787 () SeekEntryResult!7636)

(assert (=> b!752601 (= res!508279 (= lt!334793 lt!334787))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!334788 () array!41845)

(declare-fun lt!334783 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41845 (_ BitVec 32)) SeekEntryResult!7636)

(assert (=> b!752601 (= lt!334787 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334783 lt!334788 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752601 (= lt!334793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334783 mask!3328) lt!334783 lt!334788 mask!3328))))

(assert (=> b!752601 (= lt!334783 (select (store (arr!20036 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!752601 (= lt!334788 (array!41846 (store (arr!20036 a!3186) i!1173 k!2102) (size!20457 a!3186)))))

(declare-fun b!752602 () Bool)

(assert (=> b!752602 (= e!419797 e!419793)))

(declare-fun res!508282 () Bool)

(assert (=> b!752602 (=> (not res!508282) (not e!419793))))

(declare-fun lt!334786 () SeekEntryResult!7636)

(assert (=> b!752602 (= res!508282 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20036 a!3186) j!159) mask!3328) (select (arr!20036 a!3186) j!159) a!3186 mask!3328) lt!334786))))

(assert (=> b!752602 (= lt!334786 (Intermediate!7636 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752603 () Bool)

(declare-fun e!419794 () Bool)

(declare-fun e!419798 () Bool)

(assert (=> b!752603 (= e!419794 e!419798)))

(declare-fun res!508284 () Bool)

(assert (=> b!752603 (=> res!508284 e!419798)))

(declare-fun lt!334791 () (_ BitVec 64))

(assert (=> b!752603 (= res!508284 (= lt!334791 lt!334783))))

(assert (=> b!752603 (= lt!334791 (select (store (arr!20036 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!752604 () Bool)

(declare-fun res!508270 () Bool)

(assert (=> b!752604 (=> (not res!508270) (not e!419797))))

(declare-datatypes ((List!14038 0))(
  ( (Nil!14035) (Cons!14034 (h!15106 (_ BitVec 64)) (t!20353 List!14038)) )
))
(declare-fun arrayNoDuplicates!0 (array!41845 (_ BitVec 32) List!14038) Bool)

(assert (=> b!752604 (= res!508270 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14035))))

(declare-fun b!752605 () Bool)

(declare-datatypes ((Unit!25924 0))(
  ( (Unit!25925) )
))
(declare-fun e!419790 () Unit!25924)

(declare-fun Unit!25926 () Unit!25924)

(assert (=> b!752605 (= e!419790 Unit!25926)))

(declare-fun b!752606 () Bool)

(assert (=> b!752606 (= e!419801 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20036 a!3186) j!159) a!3186 mask!3328) (Found!7636 j!159)))))

(declare-fun b!752607 () Bool)

(assert (=> b!752607 (= e!419798 true)))

(declare-fun e!419799 () Bool)

(assert (=> b!752607 e!419799))

(declare-fun res!508274 () Bool)

(assert (=> b!752607 (=> (not res!508274) (not e!419799))))

(assert (=> b!752607 (= res!508274 (= lt!334791 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334792 () Unit!25924)

(assert (=> b!752607 (= lt!334792 e!419790)))

(declare-fun c!82546 () Bool)

(assert (=> b!752607 (= c!82546 (= lt!334791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752608 () Bool)

(declare-fun lt!334789 () SeekEntryResult!7636)

(declare-fun lt!334782 () SeekEntryResult!7636)

(assert (=> b!752608 (= e!419799 (= lt!334789 lt!334782))))

(declare-fun b!752609 () Bool)

(declare-fun Unit!25927 () Unit!25924)

(assert (=> b!752609 (= e!419790 Unit!25927)))

(assert (=> b!752609 false))

(declare-fun b!752610 () Bool)

(declare-fun res!508272 () Bool)

(assert (=> b!752610 (=> (not res!508272) (not e!419797))))

(assert (=> b!752610 (= res!508272 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20457 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20457 a!3186))))))

(declare-fun b!752611 () Bool)

(declare-fun res!508276 () Bool)

(assert (=> b!752611 (=> (not res!508276) (not e!419795))))

(assert (=> b!752611 (= res!508276 (and (= (size!20457 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20457 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20457 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752612 () Bool)

(declare-fun res!508271 () Bool)

(assert (=> b!752612 (=> (not res!508271) (not e!419793))))

(assert (=> b!752612 (= res!508271 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20036 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752613 () Bool)

(declare-fun e!419791 () Bool)

(assert (=> b!752613 (= e!419791 e!419794)))

(declare-fun res!508273 () Bool)

(assert (=> b!752613 (=> res!508273 e!419794)))

(assert (=> b!752613 (= res!508273 (not (= lt!334782 lt!334785)))))

(assert (=> b!752613 (= lt!334782 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20036 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752614 () Bool)

(declare-fun res!508285 () Bool)

(assert (=> b!752614 (=> (not res!508285) (not e!419799))))

(assert (=> b!752614 (= res!508285 (= (seekEntryOrOpen!0 lt!334783 lt!334788 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334783 lt!334788 mask!3328)))))

(declare-fun b!752615 () Bool)

(assert (=> b!752615 (= e!419801 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20036 a!3186) j!159) a!3186 mask!3328) lt!334786))))

(declare-fun res!508277 () Bool)

(assert (=> start!65672 (=> (not res!508277) (not e!419795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65672 (= res!508277 (validMask!0 mask!3328))))

(assert (=> start!65672 e!419795))

(assert (=> start!65672 true))

(declare-fun array_inv!15832 (array!41845) Bool)

(assert (=> start!65672 (array_inv!15832 a!3186)))

(declare-fun b!752616 () Bool)

(assert (=> b!752616 (= e!419792 (not e!419791))))

(declare-fun res!508278 () Bool)

(assert (=> b!752616 (=> res!508278 e!419791)))

(assert (=> b!752616 (= res!508278 (or (not (is-Intermediate!7636 lt!334787)) (bvslt x!1131 (x!63826 lt!334787)) (not (= x!1131 (x!63826 lt!334787))) (not (= index!1321 (index!32914 lt!334787)))))))

(assert (=> b!752616 e!419800))

(declare-fun res!508275 () Bool)

(assert (=> b!752616 (=> (not res!508275) (not e!419800))))

(assert (=> b!752616 (= res!508275 (= lt!334789 lt!334785))))

(assert (=> b!752616 (= lt!334785 (Found!7636 j!159))))

(assert (=> b!752616 (= lt!334789 (seekEntryOrOpen!0 (select (arr!20036 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41845 (_ BitVec 32)) Bool)

(assert (=> b!752616 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334784 () Unit!25924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25924)

(assert (=> b!752616 (= lt!334784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752617 () Bool)

(declare-fun res!508286 () Bool)

(assert (=> b!752617 (=> (not res!508286) (not e!419795))))

(declare-fun arrayContainsKey!0 (array!41845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752617 (= res!508286 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752618 () Bool)

(declare-fun res!508283 () Bool)

(assert (=> b!752618 (=> (not res!508283) (not e!419797))))

(assert (=> b!752618 (= res!508283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752619 () Bool)

(declare-fun res!508281 () Bool)

(assert (=> b!752619 (=> (not res!508281) (not e!419795))))

(assert (=> b!752619 (= res!508281 (validKeyInArray!0 (select (arr!20036 a!3186) j!159)))))

(assert (= (and start!65672 res!508277) b!752611))

(assert (= (and b!752611 res!508276) b!752619))

(assert (= (and b!752619 res!508281) b!752599))

(assert (= (and b!752599 res!508268) b!752617))

(assert (= (and b!752617 res!508286) b!752597))

(assert (= (and b!752597 res!508269) b!752618))

(assert (= (and b!752618 res!508283) b!752604))

(assert (= (and b!752604 res!508270) b!752610))

(assert (= (and b!752610 res!508272) b!752602))

(assert (= (and b!752602 res!508282) b!752612))

(assert (= (and b!752612 res!508271) b!752598))

(assert (= (and b!752598 c!82545) b!752615))

(assert (= (and b!752598 (not c!82545)) b!752606))

(assert (= (and b!752598 res!508280) b!752601))

(assert (= (and b!752601 res!508279) b!752616))

(assert (= (and b!752616 res!508275) b!752600))

(assert (= (and b!752616 (not res!508278)) b!752613))

(assert (= (and b!752613 (not res!508273)) b!752603))

(assert (= (and b!752603 (not res!508284)) b!752607))

(assert (= (and b!752607 c!82546) b!752609))

(assert (= (and b!752607 (not c!82546)) b!752605))

(assert (= (and b!752607 res!508274) b!752614))

(assert (= (and b!752614 res!508285) b!752608))

(declare-fun m!701499 () Bool)

(assert (=> b!752617 m!701499))

(declare-fun m!701501 () Bool)

(assert (=> b!752601 m!701501))

(declare-fun m!701503 () Bool)

(assert (=> b!752601 m!701503))

(assert (=> b!752601 m!701503))

(declare-fun m!701505 () Bool)

(assert (=> b!752601 m!701505))

(declare-fun m!701507 () Bool)

(assert (=> b!752601 m!701507))

(declare-fun m!701509 () Bool)

(assert (=> b!752601 m!701509))

(declare-fun m!701511 () Bool)

(assert (=> b!752613 m!701511))

(assert (=> b!752613 m!701511))

(declare-fun m!701513 () Bool)

(assert (=> b!752613 m!701513))

(assert (=> b!752600 m!701511))

(assert (=> b!752600 m!701511))

(declare-fun m!701515 () Bool)

(assert (=> b!752600 m!701515))

(assert (=> b!752602 m!701511))

(assert (=> b!752602 m!701511))

(declare-fun m!701517 () Bool)

(assert (=> b!752602 m!701517))

(assert (=> b!752602 m!701517))

(assert (=> b!752602 m!701511))

(declare-fun m!701519 () Bool)

(assert (=> b!752602 m!701519))

(declare-fun m!701521 () Bool)

(assert (=> b!752597 m!701521))

(declare-fun m!701523 () Bool)

(assert (=> b!752604 m!701523))

(assert (=> b!752615 m!701511))

(assert (=> b!752615 m!701511))

(declare-fun m!701525 () Bool)

(assert (=> b!752615 m!701525))

(declare-fun m!701527 () Bool)

(assert (=> b!752599 m!701527))

(declare-fun m!701529 () Bool)

(assert (=> b!752612 m!701529))

(declare-fun m!701531 () Bool)

(assert (=> start!65672 m!701531))

(declare-fun m!701533 () Bool)

(assert (=> start!65672 m!701533))

(assert (=> b!752616 m!701511))

(assert (=> b!752616 m!701511))

(declare-fun m!701535 () Bool)

(assert (=> b!752616 m!701535))

(declare-fun m!701537 () Bool)

(assert (=> b!752616 m!701537))

(declare-fun m!701539 () Bool)

(assert (=> b!752616 m!701539))

(declare-fun m!701541 () Bool)

(assert (=> b!752614 m!701541))

(declare-fun m!701543 () Bool)

(assert (=> b!752614 m!701543))

(assert (=> b!752603 m!701501))

(declare-fun m!701545 () Bool)

(assert (=> b!752603 m!701545))

(assert (=> b!752619 m!701511))

(assert (=> b!752619 m!701511))

(declare-fun m!701547 () Bool)

(assert (=> b!752619 m!701547))

(declare-fun m!701549 () Bool)

(assert (=> b!752618 m!701549))

(assert (=> b!752606 m!701511))

(assert (=> b!752606 m!701511))

(assert (=> b!752606 m!701513))

(push 1)

