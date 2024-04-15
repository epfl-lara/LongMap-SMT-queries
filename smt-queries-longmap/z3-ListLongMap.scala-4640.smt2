; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64520 () Bool)

(assert start!64520)

(declare-fun b!726615 () Bool)

(declare-fun res!487704 () Bool)

(declare-fun e!406784 () Bool)

(assert (=> b!726615 (=> (not res!487704) (not e!406784))))

(declare-datatypes ((array!41055 0))(
  ( (array!41056 (arr!19649 (Array (_ BitVec 32) (_ BitVec 64))) (size!20070 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41055)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41055 (_ BitVec 32)) Bool)

(assert (=> b!726615 (= res!487704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-datatypes ((SeekEntryResult!7246 0))(
  ( (MissingZero!7246 (index!31352 (_ BitVec 32))) (Found!7246 (index!31353 (_ BitVec 32))) (Intermediate!7246 (undefined!8058 Bool) (index!31354 (_ BitVec 32)) (x!62347 (_ BitVec 32))) (Undefined!7246) (MissingVacant!7246 (index!31355 (_ BitVec 32))) )
))
(declare-fun lt!321677 () SeekEntryResult!7246)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!406786 () Bool)

(declare-fun b!726616 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41055 (_ BitVec 32)) SeekEntryResult!7246)

(assert (=> b!726616 (= e!406786 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19649 a!3186) j!159) a!3186 mask!3328) lt!321677))))

(declare-fun b!726617 () Bool)

(declare-fun res!487703 () Bool)

(declare-fun e!406780 () Bool)

(assert (=> b!726617 (=> (not res!487703) (not e!406780))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726617 (= res!487703 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726618 () Bool)

(declare-fun res!487699 () Bool)

(declare-fun e!406785 () Bool)

(assert (=> b!726618 (=> (not res!487699) (not e!406785))))

(assert (=> b!726618 (= res!487699 e!406786)))

(declare-fun c!79836 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726618 (= c!79836 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726619 () Bool)

(declare-fun e!406783 () Bool)

(declare-fun e!406782 () Bool)

(assert (=> b!726619 (= e!406783 e!406782)))

(declare-fun res!487691 () Bool)

(assert (=> b!726619 (=> (not res!487691) (not e!406782))))

(declare-fun lt!321673 () SeekEntryResult!7246)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41055 (_ BitVec 32)) SeekEntryResult!7246)

(assert (=> b!726619 (= res!487691 (= (seekEntryOrOpen!0 (select (arr!19649 a!3186) j!159) a!3186 mask!3328) lt!321673))))

(assert (=> b!726619 (= lt!321673 (Found!7246 j!159))))

(declare-fun b!726621 () Bool)

(declare-fun e!406781 () Bool)

(declare-fun e!406779 () Bool)

(assert (=> b!726621 (= e!406781 (not e!406779))))

(declare-fun res!487698 () Bool)

(assert (=> b!726621 (=> res!487698 e!406779)))

(declare-fun lt!321675 () SeekEntryResult!7246)

(get-info :version)

(assert (=> b!726621 (= res!487698 (or (not ((_ is Intermediate!7246) lt!321675)) (bvsge x!1131 (x!62347 lt!321675))))))

(assert (=> b!726621 e!406783))

(declare-fun res!487690 () Bool)

(assert (=> b!726621 (=> (not res!487690) (not e!406783))))

(assert (=> b!726621 (= res!487690 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24782 0))(
  ( (Unit!24783) )
))
(declare-fun lt!321671 () Unit!24782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24782)

(assert (=> b!726621 (= lt!321671 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726622 () Bool)

(declare-fun res!487701 () Bool)

(assert (=> b!726622 (=> (not res!487701) (not e!406780))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726622 (= res!487701 (and (= (size!20070 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20070 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20070 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726623 () Bool)

(declare-fun res!487700 () Bool)

(assert (=> b!726623 (=> (not res!487700) (not e!406784))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!726623 (= res!487700 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20070 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20070 a!3186))))))

(declare-fun b!726624 () Bool)

(declare-fun res!487694 () Bool)

(assert (=> b!726624 (=> (not res!487694) (not e!406780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726624 (= res!487694 (validKeyInArray!0 (select (arr!19649 a!3186) j!159)))))

(declare-fun b!726625 () Bool)

(assert (=> b!726625 (= e!406779 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun lt!321669 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726625 (= lt!321669 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!726626 () Bool)

(declare-fun res!487702 () Bool)

(assert (=> b!726626 (=> (not res!487702) (not e!406780))))

(assert (=> b!726626 (= res!487702 (validKeyInArray!0 k0!2102))))

(declare-fun b!726627 () Bool)

(declare-fun res!487692 () Bool)

(assert (=> b!726627 (=> (not res!487692) (not e!406784))))

(declare-datatypes ((List!13690 0))(
  ( (Nil!13687) (Cons!13686 (h!14743 (_ BitVec 64)) (t!19996 List!13690)) )
))
(declare-fun arrayNoDuplicates!0 (array!41055 (_ BitVec 32) List!13690) Bool)

(assert (=> b!726627 (= res!487692 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13687))))

(declare-fun b!726628 () Bool)

(declare-fun res!487696 () Bool)

(assert (=> b!726628 (=> (not res!487696) (not e!406785))))

(assert (=> b!726628 (= res!487696 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19649 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726629 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41055 (_ BitVec 32)) SeekEntryResult!7246)

(assert (=> b!726629 (= e!406786 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19649 a!3186) j!159) a!3186 mask!3328) (Found!7246 j!159)))))

(declare-fun b!726630 () Bool)

(assert (=> b!726630 (= e!406782 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19649 a!3186) j!159) a!3186 mask!3328) lt!321673))))

(declare-fun res!487689 () Bool)

(assert (=> start!64520 (=> (not res!487689) (not e!406780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64520 (= res!487689 (validMask!0 mask!3328))))

(assert (=> start!64520 e!406780))

(assert (=> start!64520 true))

(declare-fun array_inv!15532 (array!41055) Bool)

(assert (=> start!64520 (array_inv!15532 a!3186)))

(declare-fun b!726620 () Bool)

(assert (=> b!726620 (= e!406780 e!406784)))

(declare-fun res!487695 () Bool)

(assert (=> b!726620 (=> (not res!487695) (not e!406784))))

(declare-fun lt!321670 () SeekEntryResult!7246)

(assert (=> b!726620 (= res!487695 (or (= lt!321670 (MissingZero!7246 i!1173)) (= lt!321670 (MissingVacant!7246 i!1173))))))

(assert (=> b!726620 (= lt!321670 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726631 () Bool)

(assert (=> b!726631 (= e!406784 e!406785)))

(declare-fun res!487693 () Bool)

(assert (=> b!726631 (=> (not res!487693) (not e!406785))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726631 (= res!487693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19649 a!3186) j!159) mask!3328) (select (arr!19649 a!3186) j!159) a!3186 mask!3328) lt!321677))))

(assert (=> b!726631 (= lt!321677 (Intermediate!7246 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726632 () Bool)

(assert (=> b!726632 (= e!406785 e!406781)))

(declare-fun res!487697 () Bool)

(assert (=> b!726632 (=> (not res!487697) (not e!406781))))

(declare-fun lt!321672 () SeekEntryResult!7246)

(assert (=> b!726632 (= res!487697 (= lt!321672 lt!321675))))

(declare-fun lt!321674 () array!41055)

(declare-fun lt!321676 () (_ BitVec 64))

(assert (=> b!726632 (= lt!321675 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321676 lt!321674 mask!3328))))

(assert (=> b!726632 (= lt!321672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321676 mask!3328) lt!321676 lt!321674 mask!3328))))

(assert (=> b!726632 (= lt!321676 (select (store (arr!19649 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726632 (= lt!321674 (array!41056 (store (arr!19649 a!3186) i!1173 k0!2102) (size!20070 a!3186)))))

(assert (= (and start!64520 res!487689) b!726622))

(assert (= (and b!726622 res!487701) b!726624))

(assert (= (and b!726624 res!487694) b!726626))

(assert (= (and b!726626 res!487702) b!726617))

(assert (= (and b!726617 res!487703) b!726620))

(assert (= (and b!726620 res!487695) b!726615))

(assert (= (and b!726615 res!487704) b!726627))

(assert (= (and b!726627 res!487692) b!726623))

(assert (= (and b!726623 res!487700) b!726631))

(assert (= (and b!726631 res!487693) b!726628))

(assert (= (and b!726628 res!487696) b!726618))

(assert (= (and b!726618 c!79836) b!726616))

(assert (= (and b!726618 (not c!79836)) b!726629))

(assert (= (and b!726618 res!487699) b!726632))

(assert (= (and b!726632 res!487697) b!726621))

(assert (= (and b!726621 res!487690) b!726619))

(assert (= (and b!726619 res!487691) b!726630))

(assert (= (and b!726621 (not res!487698)) b!726625))

(declare-fun m!680123 () Bool)

(assert (=> b!726631 m!680123))

(assert (=> b!726631 m!680123))

(declare-fun m!680125 () Bool)

(assert (=> b!726631 m!680125))

(assert (=> b!726631 m!680125))

(assert (=> b!726631 m!680123))

(declare-fun m!680127 () Bool)

(assert (=> b!726631 m!680127))

(assert (=> b!726630 m!680123))

(assert (=> b!726630 m!680123))

(declare-fun m!680129 () Bool)

(assert (=> b!726630 m!680129))

(declare-fun m!680131 () Bool)

(assert (=> b!726620 m!680131))

(declare-fun m!680133 () Bool)

(assert (=> start!64520 m!680133))

(declare-fun m!680135 () Bool)

(assert (=> start!64520 m!680135))

(assert (=> b!726624 m!680123))

(assert (=> b!726624 m!680123))

(declare-fun m!680137 () Bool)

(assert (=> b!726624 m!680137))

(declare-fun m!680139 () Bool)

(assert (=> b!726625 m!680139))

(assert (=> b!726616 m!680123))

(assert (=> b!726616 m!680123))

(declare-fun m!680141 () Bool)

(assert (=> b!726616 m!680141))

(declare-fun m!680143 () Bool)

(assert (=> b!726628 m!680143))

(declare-fun m!680145 () Bool)

(assert (=> b!726615 m!680145))

(assert (=> b!726619 m!680123))

(assert (=> b!726619 m!680123))

(declare-fun m!680147 () Bool)

(assert (=> b!726619 m!680147))

(declare-fun m!680149 () Bool)

(assert (=> b!726632 m!680149))

(declare-fun m!680151 () Bool)

(assert (=> b!726632 m!680151))

(declare-fun m!680153 () Bool)

(assert (=> b!726632 m!680153))

(declare-fun m!680155 () Bool)

(assert (=> b!726632 m!680155))

(assert (=> b!726632 m!680151))

(declare-fun m!680157 () Bool)

(assert (=> b!726632 m!680157))

(declare-fun m!680159 () Bool)

(assert (=> b!726621 m!680159))

(declare-fun m!680161 () Bool)

(assert (=> b!726621 m!680161))

(declare-fun m!680163 () Bool)

(assert (=> b!726627 m!680163))

(declare-fun m!680165 () Bool)

(assert (=> b!726617 m!680165))

(assert (=> b!726629 m!680123))

(assert (=> b!726629 m!680123))

(declare-fun m!680167 () Bool)

(assert (=> b!726629 m!680167))

(declare-fun m!680169 () Bool)

(assert (=> b!726626 m!680169))

(check-sat (not b!726626) (not b!726629) (not b!726625) (not b!726632) (not b!726631) (not b!726624) (not b!726615) (not b!726621) (not b!726627) (not b!726620) (not b!726619) (not b!726630) (not b!726617) (not start!64520) (not b!726616))
(check-sat)
