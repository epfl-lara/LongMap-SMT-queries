; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64758 () Bool)

(assert start!64758)

(declare-fun b!728513 () Bool)

(declare-fun res!488664 () Bool)

(declare-fun e!407907 () Bool)

(assert (=> b!728513 (=> (not res!488664) (not e!407907))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728513 (= res!488664 (validKeyInArray!0 k0!2102))))

(declare-fun b!728514 () Bool)

(declare-fun e!407913 () Bool)

(assert (=> b!728514 (= e!407907 e!407913)))

(declare-fun res!488663 () Bool)

(assert (=> b!728514 (=> (not res!488663) (not e!407913))))

(declare-datatypes ((SeekEntryResult!7210 0))(
  ( (MissingZero!7210 (index!31208 (_ BitVec 32))) (Found!7210 (index!31209 (_ BitVec 32))) (Intermediate!7210 (undefined!8022 Bool) (index!31210 (_ BitVec 32)) (x!62364 (_ BitVec 32))) (Undefined!7210) (MissingVacant!7210 (index!31211 (_ BitVec 32))) )
))
(declare-fun lt!322639 () SeekEntryResult!7210)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728514 (= res!488663 (or (= lt!322639 (MissingZero!7210 i!1173)) (= lt!322639 (MissingVacant!7210 i!1173))))))

(declare-datatypes ((array!41077 0))(
  ( (array!41078 (arr!19654 (Array (_ BitVec 32) (_ BitVec 64))) (size!20074 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41077)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41077 (_ BitVec 32)) SeekEntryResult!7210)

(assert (=> b!728514 (= lt!322639 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!488676 () Bool)

(assert (=> start!64758 (=> (not res!488676) (not e!407907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64758 (= res!488676 (validMask!0 mask!3328))))

(assert (=> start!64758 e!407907))

(assert (=> start!64758 true))

(declare-fun array_inv!15513 (array!41077) Bool)

(assert (=> start!64758 (array_inv!15513 a!3186)))

(declare-fun b!728515 () Bool)

(declare-fun res!488665 () Bool)

(assert (=> b!728515 (=> (not res!488665) (not e!407913))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!728515 (= res!488665 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20074 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20074 a!3186))))))

(declare-fun lt!322645 () (_ BitVec 32))

(declare-fun e!407910 () Bool)

(declare-fun b!728516 () Bool)

(assert (=> b!728516 (= e!407910 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!322645 #b00000000000000000000000000000000) (bvsge lt!322645 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728516 (= lt!322645 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!728517 () Bool)

(declare-fun res!488666 () Bool)

(assert (=> b!728517 (=> (not res!488666) (not e!407913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41077 (_ BitVec 32)) Bool)

(assert (=> b!728517 (= res!488666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728518 () Bool)

(declare-fun e!407909 () Bool)

(assert (=> b!728518 (= e!407913 e!407909)))

(declare-fun res!488677 () Bool)

(assert (=> b!728518 (=> (not res!488677) (not e!407909))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!322640 () SeekEntryResult!7210)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41077 (_ BitVec 32)) SeekEntryResult!7210)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728518 (= res!488677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19654 a!3186) j!159) mask!3328) (select (arr!19654 a!3186) j!159) a!3186 mask!3328) lt!322640))))

(assert (=> b!728518 (= lt!322640 (Intermediate!7210 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728519 () Bool)

(declare-fun e!407911 () Bool)

(assert (=> b!728519 (= e!407911 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19654 a!3186) j!159) a!3186 mask!3328) lt!322640))))

(declare-fun b!728520 () Bool)

(declare-fun e!407908 () Bool)

(declare-fun e!407912 () Bool)

(assert (=> b!728520 (= e!407908 e!407912)))

(declare-fun res!488673 () Bool)

(assert (=> b!728520 (=> (not res!488673) (not e!407912))))

(declare-fun lt!322642 () SeekEntryResult!7210)

(assert (=> b!728520 (= res!488673 (= (seekEntryOrOpen!0 (select (arr!19654 a!3186) j!159) a!3186 mask!3328) lt!322642))))

(assert (=> b!728520 (= lt!322642 (Found!7210 j!159))))

(declare-fun b!728521 () Bool)

(declare-fun res!488668 () Bool)

(assert (=> b!728521 (=> (not res!488668) (not e!407913))))

(declare-datatypes ((List!13563 0))(
  ( (Nil!13560) (Cons!13559 (h!14625 (_ BitVec 64)) (t!19870 List!13563)) )
))
(declare-fun arrayNoDuplicates!0 (array!41077 (_ BitVec 32) List!13563) Bool)

(assert (=> b!728521 (= res!488668 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13560))))

(declare-fun b!728522 () Bool)

(declare-fun e!407906 () Bool)

(assert (=> b!728522 (= e!407906 (not e!407910))))

(declare-fun res!488675 () Bool)

(assert (=> b!728522 (=> res!488675 e!407910)))

(declare-fun lt!322641 () SeekEntryResult!7210)

(get-info :version)

(assert (=> b!728522 (= res!488675 (or (not ((_ is Intermediate!7210) lt!322641)) (bvsge x!1131 (x!62364 lt!322641))))))

(assert (=> b!728522 e!407908))

(declare-fun res!488670 () Bool)

(assert (=> b!728522 (=> (not res!488670) (not e!407908))))

(assert (=> b!728522 (= res!488670 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24817 0))(
  ( (Unit!24818) )
))
(declare-fun lt!322647 () Unit!24817)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24817)

(assert (=> b!728522 (= lt!322647 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728523 () Bool)

(declare-fun res!488674 () Bool)

(assert (=> b!728523 (=> (not res!488674) (not e!407907))))

(assert (=> b!728523 (= res!488674 (validKeyInArray!0 (select (arr!19654 a!3186) j!159)))))

(declare-fun b!728524 () Bool)

(declare-fun res!488671 () Bool)

(assert (=> b!728524 (=> (not res!488671) (not e!407907))))

(declare-fun arrayContainsKey!0 (array!41077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728524 (= res!488671 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728525 () Bool)

(declare-fun res!488669 () Bool)

(assert (=> b!728525 (=> (not res!488669) (not e!407909))))

(assert (=> b!728525 (= res!488669 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19654 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728526 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41077 (_ BitVec 32)) SeekEntryResult!7210)

(assert (=> b!728526 (= e!407912 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19654 a!3186) j!159) a!3186 mask!3328) lt!322642))))

(declare-fun b!728527 () Bool)

(declare-fun res!488672 () Bool)

(assert (=> b!728527 (=> (not res!488672) (not e!407909))))

(assert (=> b!728527 (= res!488672 e!407911)))

(declare-fun c!80303 () Bool)

(assert (=> b!728527 (= c!80303 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728528 () Bool)

(declare-fun res!488667 () Bool)

(assert (=> b!728528 (=> (not res!488667) (not e!407907))))

(assert (=> b!728528 (= res!488667 (and (= (size!20074 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20074 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20074 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728529 () Bool)

(assert (=> b!728529 (= e!407911 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19654 a!3186) j!159) a!3186 mask!3328) (Found!7210 j!159)))))

(declare-fun b!728530 () Bool)

(assert (=> b!728530 (= e!407909 e!407906)))

(declare-fun res!488662 () Bool)

(assert (=> b!728530 (=> (not res!488662) (not e!407906))))

(declare-fun lt!322644 () SeekEntryResult!7210)

(assert (=> b!728530 (= res!488662 (= lt!322644 lt!322641))))

(declare-fun lt!322643 () array!41077)

(declare-fun lt!322646 () (_ BitVec 64))

(assert (=> b!728530 (= lt!322641 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322646 lt!322643 mask!3328))))

(assert (=> b!728530 (= lt!322644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322646 mask!3328) lt!322646 lt!322643 mask!3328))))

(assert (=> b!728530 (= lt!322646 (select (store (arr!19654 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728530 (= lt!322643 (array!41078 (store (arr!19654 a!3186) i!1173 k0!2102) (size!20074 a!3186)))))

(assert (= (and start!64758 res!488676) b!728528))

(assert (= (and b!728528 res!488667) b!728523))

(assert (= (and b!728523 res!488674) b!728513))

(assert (= (and b!728513 res!488664) b!728524))

(assert (= (and b!728524 res!488671) b!728514))

(assert (= (and b!728514 res!488663) b!728517))

(assert (= (and b!728517 res!488666) b!728521))

(assert (= (and b!728521 res!488668) b!728515))

(assert (= (and b!728515 res!488665) b!728518))

(assert (= (and b!728518 res!488677) b!728525))

(assert (= (and b!728525 res!488669) b!728527))

(assert (= (and b!728527 c!80303) b!728519))

(assert (= (and b!728527 (not c!80303)) b!728529))

(assert (= (and b!728527 res!488672) b!728530))

(assert (= (and b!728530 res!488662) b!728522))

(assert (= (and b!728522 res!488670) b!728520))

(assert (= (and b!728520 res!488673) b!728526))

(assert (= (and b!728522 (not res!488675)) b!728516))

(declare-fun m!682731 () Bool)

(assert (=> b!728522 m!682731))

(declare-fun m!682733 () Bool)

(assert (=> b!728522 m!682733))

(declare-fun m!682735 () Bool)

(assert (=> b!728519 m!682735))

(assert (=> b!728519 m!682735))

(declare-fun m!682737 () Bool)

(assert (=> b!728519 m!682737))

(declare-fun m!682739 () Bool)

(assert (=> b!728516 m!682739))

(declare-fun m!682741 () Bool)

(assert (=> b!728524 m!682741))

(declare-fun m!682743 () Bool)

(assert (=> b!728530 m!682743))

(declare-fun m!682745 () Bool)

(assert (=> b!728530 m!682745))

(declare-fun m!682747 () Bool)

(assert (=> b!728530 m!682747))

(declare-fun m!682749 () Bool)

(assert (=> b!728530 m!682749))

(assert (=> b!728530 m!682747))

(declare-fun m!682751 () Bool)

(assert (=> b!728530 m!682751))

(declare-fun m!682753 () Bool)

(assert (=> b!728525 m!682753))

(assert (=> b!728520 m!682735))

(assert (=> b!728520 m!682735))

(declare-fun m!682755 () Bool)

(assert (=> b!728520 m!682755))

(assert (=> b!728523 m!682735))

(assert (=> b!728523 m!682735))

(declare-fun m!682757 () Bool)

(assert (=> b!728523 m!682757))

(declare-fun m!682759 () Bool)

(assert (=> start!64758 m!682759))

(declare-fun m!682761 () Bool)

(assert (=> start!64758 m!682761))

(declare-fun m!682763 () Bool)

(assert (=> b!728514 m!682763))

(assert (=> b!728526 m!682735))

(assert (=> b!728526 m!682735))

(declare-fun m!682765 () Bool)

(assert (=> b!728526 m!682765))

(declare-fun m!682767 () Bool)

(assert (=> b!728517 m!682767))

(declare-fun m!682769 () Bool)

(assert (=> b!728513 m!682769))

(assert (=> b!728529 m!682735))

(assert (=> b!728529 m!682735))

(declare-fun m!682771 () Bool)

(assert (=> b!728529 m!682771))

(declare-fun m!682773 () Bool)

(assert (=> b!728521 m!682773))

(assert (=> b!728518 m!682735))

(assert (=> b!728518 m!682735))

(declare-fun m!682775 () Bool)

(assert (=> b!728518 m!682775))

(assert (=> b!728518 m!682775))

(assert (=> b!728518 m!682735))

(declare-fun m!682777 () Bool)

(assert (=> b!728518 m!682777))

(check-sat (not b!728521) (not start!64758) (not b!728524) (not b!728526) (not b!728519) (not b!728514) (not b!728530) (not b!728516) (not b!728529) (not b!728520) (not b!728518) (not b!728522) (not b!728517) (not b!728513) (not b!728523))
(check-sat)
