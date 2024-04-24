; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65688 () Bool)

(assert start!65688)

(declare-fun b!749609 () Bool)

(declare-fun e!418401 () Bool)

(declare-fun e!418407 () Bool)

(assert (=> b!749609 (= e!418401 e!418407)))

(declare-fun res!505519 () Bool)

(assert (=> b!749609 (=> (not res!505519) (not e!418407))))

(declare-datatypes ((array!41731 0))(
  ( (array!41732 (arr!19975 (Array (_ BitVec 32) (_ BitVec 64))) (size!20395 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41731)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7531 0))(
  ( (MissingZero!7531 (index!32492 (_ BitVec 32))) (Found!7531 (index!32493 (_ BitVec 32))) (Intermediate!7531 (undefined!8343 Bool) (index!32494 (_ BitVec 32)) (x!63589 (_ BitVec 32))) (Undefined!7531) (MissingVacant!7531 (index!32495 (_ BitVec 32))) )
))
(declare-fun lt!333224 () SeekEntryResult!7531)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41731 (_ BitVec 32)) SeekEntryResult!7531)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749609 (= res!505519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19975 a!3186) j!159) mask!3328) (select (arr!19975 a!3186) j!159) a!3186 mask!3328) lt!333224))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749609 (= lt!333224 (Intermediate!7531 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749610 () Bool)

(declare-fun res!505513 () Bool)

(assert (=> b!749610 (=> (not res!505513) (not e!418401))))

(declare-datatypes ((List!13884 0))(
  ( (Nil!13881) (Cons!13880 (h!14958 (_ BitVec 64)) (t!20191 List!13884)) )
))
(declare-fun arrayNoDuplicates!0 (array!41731 (_ BitVec 32) List!13884) Bool)

(assert (=> b!749610 (= res!505513 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13881))))

(declare-fun b!749611 () Bool)

(declare-fun res!505520 () Bool)

(declare-fun e!418399 () Bool)

(assert (=> b!749611 (=> res!505520 e!418399)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!333219 () (_ BitVec 64))

(assert (=> b!749611 (= res!505520 (= (select (store (arr!19975 a!3186) i!1173 k0!2102) index!1321) lt!333219))))

(declare-fun b!749612 () Bool)

(declare-fun e!418405 () Bool)

(assert (=> b!749612 (= e!418405 e!418401)))

(declare-fun res!505521 () Bool)

(assert (=> b!749612 (=> (not res!505521) (not e!418401))))

(declare-fun lt!333220 () SeekEntryResult!7531)

(assert (=> b!749612 (= res!505521 (or (= lt!333220 (MissingZero!7531 i!1173)) (= lt!333220 (MissingVacant!7531 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41731 (_ BitVec 32)) SeekEntryResult!7531)

(assert (=> b!749612 (= lt!333220 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749614 () Bool)

(declare-datatypes ((Unit!25681 0))(
  ( (Unit!25682) )
))
(declare-fun e!418403 () Unit!25681)

(declare-fun Unit!25683 () Unit!25681)

(assert (=> b!749614 (= e!418403 Unit!25683)))

(assert (=> b!749614 false))

(declare-fun b!749615 () Bool)

(declare-fun res!505514 () Bool)

(assert (=> b!749615 (=> (not res!505514) (not e!418405))))

(assert (=> b!749615 (= res!505514 (and (= (size!20395 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20395 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20395 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!418400 () Bool)

(declare-fun b!749616 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41731 (_ BitVec 32)) SeekEntryResult!7531)

(assert (=> b!749616 (= e!418400 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19975 a!3186) j!159) a!3186 mask!3328) (Found!7531 j!159)))))

(declare-fun b!749617 () Bool)

(declare-fun res!505524 () Bool)

(assert (=> b!749617 (=> (not res!505524) (not e!418405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749617 (= res!505524 (validKeyInArray!0 k0!2102))))

(declare-fun b!749618 () Bool)

(declare-fun res!505523 () Bool)

(assert (=> b!749618 (=> (not res!505523) (not e!418407))))

(assert (=> b!749618 (= res!505523 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19975 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749619 () Bool)

(declare-fun res!505522 () Bool)

(assert (=> b!749619 (=> (not res!505522) (not e!418407))))

(assert (=> b!749619 (= res!505522 e!418400)))

(declare-fun c!82432 () Bool)

(assert (=> b!749619 (= c!82432 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749620 () Bool)

(declare-fun res!505518 () Bool)

(assert (=> b!749620 (=> (not res!505518) (not e!418401))))

(assert (=> b!749620 (= res!505518 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20395 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20395 a!3186))))))

(declare-fun b!749621 () Bool)

(assert (=> b!749621 (= e!418399 true)))

(assert (=> b!749621 (= (select (store (arr!19975 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!333227 () Unit!25681)

(assert (=> b!749621 (= lt!333227 e!418403)))

(declare-fun c!82433 () Bool)

(assert (=> b!749621 (= c!82433 (= (select (store (arr!19975 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749622 () Bool)

(declare-fun e!418406 () Bool)

(assert (=> b!749622 (= e!418406 (not e!418399))))

(declare-fun res!505528 () Bool)

(assert (=> b!749622 (=> res!505528 e!418399)))

(declare-fun lt!333223 () SeekEntryResult!7531)

(get-info :version)

(assert (=> b!749622 (= res!505528 (or (not ((_ is Intermediate!7531) lt!333223)) (bvslt x!1131 (x!63589 lt!333223)) (not (= x!1131 (x!63589 lt!333223))) (not (= index!1321 (index!32494 lt!333223)))))))

(declare-fun e!418404 () Bool)

(assert (=> b!749622 e!418404))

(declare-fun res!505526 () Bool)

(assert (=> b!749622 (=> (not res!505526) (not e!418404))))

(declare-fun lt!333228 () SeekEntryResult!7531)

(declare-fun lt!333225 () SeekEntryResult!7531)

(assert (=> b!749622 (= res!505526 (= lt!333228 lt!333225))))

(assert (=> b!749622 (= lt!333225 (Found!7531 j!159))))

(assert (=> b!749622 (= lt!333228 (seekEntryOrOpen!0 (select (arr!19975 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41731 (_ BitVec 32)) Bool)

(assert (=> b!749622 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333221 () Unit!25681)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25681)

(assert (=> b!749622 (= lt!333221 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749623 () Bool)

(declare-fun res!505516 () Bool)

(assert (=> b!749623 (=> (not res!505516) (not e!418405))))

(assert (=> b!749623 (= res!505516 (validKeyInArray!0 (select (arr!19975 a!3186) j!159)))))

(declare-fun res!505527 () Bool)

(assert (=> start!65688 (=> (not res!505527) (not e!418405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65688 (= res!505527 (validMask!0 mask!3328))))

(assert (=> start!65688 e!418405))

(assert (=> start!65688 true))

(declare-fun array_inv!15834 (array!41731) Bool)

(assert (=> start!65688 (array_inv!15834 a!3186)))

(declare-fun b!749613 () Bool)

(declare-fun res!505517 () Bool)

(assert (=> b!749613 (=> res!505517 e!418399)))

(assert (=> b!749613 (= res!505517 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19975 a!3186) j!159) a!3186 mask!3328) lt!333225)))))

(declare-fun b!749624 () Bool)

(declare-fun res!505512 () Bool)

(assert (=> b!749624 (=> (not res!505512) (not e!418401))))

(assert (=> b!749624 (= res!505512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749625 () Bool)

(assert (=> b!749625 (= e!418404 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19975 a!3186) j!159) a!3186 mask!3328) lt!333225))))

(declare-fun b!749626 () Bool)

(declare-fun Unit!25684 () Unit!25681)

(assert (=> b!749626 (= e!418403 Unit!25684)))

(declare-fun b!749627 () Bool)

(assert (=> b!749627 (= e!418400 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19975 a!3186) j!159) a!3186 mask!3328) lt!333224))))

(declare-fun b!749628 () Bool)

(assert (=> b!749628 (= e!418407 e!418406)))

(declare-fun res!505515 () Bool)

(assert (=> b!749628 (=> (not res!505515) (not e!418406))))

(declare-fun lt!333226 () SeekEntryResult!7531)

(assert (=> b!749628 (= res!505515 (= lt!333226 lt!333223))))

(declare-fun lt!333222 () array!41731)

(assert (=> b!749628 (= lt!333223 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333219 lt!333222 mask!3328))))

(assert (=> b!749628 (= lt!333226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333219 mask!3328) lt!333219 lt!333222 mask!3328))))

(assert (=> b!749628 (= lt!333219 (select (store (arr!19975 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749628 (= lt!333222 (array!41732 (store (arr!19975 a!3186) i!1173 k0!2102) (size!20395 a!3186)))))

(declare-fun b!749629 () Bool)

(declare-fun res!505525 () Bool)

(assert (=> b!749629 (=> (not res!505525) (not e!418405))))

(declare-fun arrayContainsKey!0 (array!41731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749629 (= res!505525 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65688 res!505527) b!749615))

(assert (= (and b!749615 res!505514) b!749623))

(assert (= (and b!749623 res!505516) b!749617))

(assert (= (and b!749617 res!505524) b!749629))

(assert (= (and b!749629 res!505525) b!749612))

(assert (= (and b!749612 res!505521) b!749624))

(assert (= (and b!749624 res!505512) b!749610))

(assert (= (and b!749610 res!505513) b!749620))

(assert (= (and b!749620 res!505518) b!749609))

(assert (= (and b!749609 res!505519) b!749618))

(assert (= (and b!749618 res!505523) b!749619))

(assert (= (and b!749619 c!82432) b!749627))

(assert (= (and b!749619 (not c!82432)) b!749616))

(assert (= (and b!749619 res!505522) b!749628))

(assert (= (and b!749628 res!505515) b!749622))

(assert (= (and b!749622 res!505526) b!749625))

(assert (= (and b!749622 (not res!505528)) b!749613))

(assert (= (and b!749613 (not res!505517)) b!749611))

(assert (= (and b!749611 (not res!505520)) b!749621))

(assert (= (and b!749621 c!82433) b!749614))

(assert (= (and b!749621 (not c!82433)) b!749626))

(declare-fun m!699765 () Bool)

(assert (=> b!749616 m!699765))

(assert (=> b!749616 m!699765))

(declare-fun m!699767 () Bool)

(assert (=> b!749616 m!699767))

(assert (=> b!749627 m!699765))

(assert (=> b!749627 m!699765))

(declare-fun m!699769 () Bool)

(assert (=> b!749627 m!699769))

(declare-fun m!699771 () Bool)

(assert (=> b!749621 m!699771))

(declare-fun m!699773 () Bool)

(assert (=> b!749621 m!699773))

(assert (=> b!749609 m!699765))

(assert (=> b!749609 m!699765))

(declare-fun m!699775 () Bool)

(assert (=> b!749609 m!699775))

(assert (=> b!749609 m!699775))

(assert (=> b!749609 m!699765))

(declare-fun m!699777 () Bool)

(assert (=> b!749609 m!699777))

(declare-fun m!699779 () Bool)

(assert (=> b!749618 m!699779))

(declare-fun m!699781 () Bool)

(assert (=> b!749628 m!699781))

(declare-fun m!699783 () Bool)

(assert (=> b!749628 m!699783))

(assert (=> b!749628 m!699771))

(declare-fun m!699785 () Bool)

(assert (=> b!749628 m!699785))

(assert (=> b!749628 m!699781))

(declare-fun m!699787 () Bool)

(assert (=> b!749628 m!699787))

(declare-fun m!699789 () Bool)

(assert (=> start!65688 m!699789))

(declare-fun m!699791 () Bool)

(assert (=> start!65688 m!699791))

(assert (=> b!749623 m!699765))

(assert (=> b!749623 m!699765))

(declare-fun m!699793 () Bool)

(assert (=> b!749623 m!699793))

(assert (=> b!749625 m!699765))

(assert (=> b!749625 m!699765))

(declare-fun m!699795 () Bool)

(assert (=> b!749625 m!699795))

(assert (=> b!749613 m!699765))

(assert (=> b!749613 m!699765))

(assert (=> b!749613 m!699767))

(declare-fun m!699797 () Bool)

(assert (=> b!749629 m!699797))

(declare-fun m!699799 () Bool)

(assert (=> b!749624 m!699799))

(assert (=> b!749611 m!699771))

(assert (=> b!749611 m!699773))

(declare-fun m!699801 () Bool)

(assert (=> b!749617 m!699801))

(declare-fun m!699803 () Bool)

(assert (=> b!749612 m!699803))

(assert (=> b!749622 m!699765))

(assert (=> b!749622 m!699765))

(declare-fun m!699805 () Bool)

(assert (=> b!749622 m!699805))

(declare-fun m!699807 () Bool)

(assert (=> b!749622 m!699807))

(declare-fun m!699809 () Bool)

(assert (=> b!749622 m!699809))

(declare-fun m!699811 () Bool)

(assert (=> b!749610 m!699811))

(check-sat (not b!749628) (not b!749609) (not start!65688) (not b!749629) (not b!749613) (not b!749625) (not b!749622) (not b!749610) (not b!749612) (not b!749627) (not b!749617) (not b!749623) (not b!749624) (not b!749616))
(check-sat)
