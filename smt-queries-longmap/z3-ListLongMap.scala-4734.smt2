; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65444 () Bool)

(assert start!65444)

(declare-fun b!745737 () Bool)

(declare-fun res!502696 () Bool)

(declare-fun e!416468 () Bool)

(assert (=> b!745737 (=> (not res!502696) (not e!416468))))

(declare-datatypes ((array!41634 0))(
  ( (array!41635 (arr!19931 (Array (_ BitVec 32) (_ BitVec 64))) (size!20352 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41634)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745737 (= res!502696 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745738 () Bool)

(declare-fun e!416467 () Bool)

(declare-fun e!416463 () Bool)

(assert (=> b!745738 (= e!416467 e!416463)))

(declare-fun res!502697 () Bool)

(assert (=> b!745738 (=> (not res!502697) (not e!416463))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7528 0))(
  ( (MissingZero!7528 (index!32480 (_ BitVec 32))) (Found!7528 (index!32481 (_ BitVec 32))) (Intermediate!7528 (undefined!8340 Bool) (index!32482 (_ BitVec 32)) (x!63441 (_ BitVec 32))) (Undefined!7528) (MissingVacant!7528 (index!32483 (_ BitVec 32))) )
))
(declare-fun lt!331231 () SeekEntryResult!7528)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41634 (_ BitVec 32)) SeekEntryResult!7528)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745738 (= res!502697 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19931 a!3186) j!159) mask!3328) (select (arr!19931 a!3186) j!159) a!3186 mask!3328) lt!331231))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745738 (= lt!331231 (Intermediate!7528 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745739 () Bool)

(declare-fun res!502693 () Bool)

(assert (=> b!745739 (=> (not res!502693) (not e!416468))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745739 (= res!502693 (and (= (size!20352 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20352 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20352 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745740 () Bool)

(declare-fun res!502694 () Bool)

(assert (=> b!745740 (=> (not res!502694) (not e!416467))))

(declare-datatypes ((List!13972 0))(
  ( (Nil!13969) (Cons!13968 (h!15040 (_ BitVec 64)) (t!20278 List!13972)) )
))
(declare-fun arrayNoDuplicates!0 (array!41634 (_ BitVec 32) List!13972) Bool)

(assert (=> b!745740 (= res!502694 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13969))))

(declare-fun e!416465 () Bool)

(declare-fun lt!331233 () SeekEntryResult!7528)

(declare-fun b!745741 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41634 (_ BitVec 32)) SeekEntryResult!7528)

(assert (=> b!745741 (= e!416465 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19931 a!3186) j!159) a!3186 mask!3328) lt!331233))))

(declare-fun b!745742 () Bool)

(declare-fun res!502702 () Bool)

(assert (=> b!745742 (=> (not res!502702) (not e!416463))))

(assert (=> b!745742 (= res!502702 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19931 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!502700 () Bool)

(assert (=> start!65444 (=> (not res!502700) (not e!416468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65444 (= res!502700 (validMask!0 mask!3328))))

(assert (=> start!65444 e!416468))

(assert (=> start!65444 true))

(declare-fun array_inv!15814 (array!41634) Bool)

(assert (=> start!65444 (array_inv!15814 a!3186)))

(declare-fun b!745743 () Bool)

(declare-fun e!416470 () Bool)

(declare-fun e!416469 () Bool)

(assert (=> b!745743 (= e!416470 e!416469)))

(declare-fun res!502699 () Bool)

(assert (=> b!745743 (=> res!502699 e!416469)))

(declare-fun lt!331232 () SeekEntryResult!7528)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331226 () (_ BitVec 64))

(assert (=> b!745743 (= res!502699 (or (not (= lt!331232 lt!331233)) (= (select (store (arr!19931 a!3186) i!1173 k0!2102) index!1321) lt!331226) (not (= (select (store (arr!19931 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!745743 (= lt!331232 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19931 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745744 () Bool)

(assert (=> b!745744 (= e!416468 e!416467)))

(declare-fun res!502705 () Bool)

(assert (=> b!745744 (=> (not res!502705) (not e!416467))))

(declare-fun lt!331227 () SeekEntryResult!7528)

(assert (=> b!745744 (= res!502705 (or (= lt!331227 (MissingZero!7528 i!1173)) (= lt!331227 (MissingVacant!7528 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41634 (_ BitVec 32)) SeekEntryResult!7528)

(assert (=> b!745744 (= lt!331227 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745745 () Bool)

(assert (=> b!745745 (= e!416469 true)))

(declare-fun lt!331229 () SeekEntryResult!7528)

(assert (=> b!745745 (= lt!331229 lt!331232)))

(declare-fun b!745746 () Bool)

(declare-fun res!502704 () Bool)

(assert (=> b!745746 (=> (not res!502704) (not e!416468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745746 (= res!502704 (validKeyInArray!0 (select (arr!19931 a!3186) j!159)))))

(declare-fun b!745747 () Bool)

(declare-fun e!416466 () Bool)

(assert (=> b!745747 (= e!416466 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19931 a!3186) j!159) a!3186 mask!3328) lt!331231))))

(declare-fun b!745748 () Bool)

(declare-fun res!502701 () Bool)

(assert (=> b!745748 (=> (not res!502701) (not e!416467))))

(assert (=> b!745748 (= res!502701 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20352 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20352 a!3186))))))

(declare-fun b!745749 () Bool)

(declare-fun res!502695 () Bool)

(assert (=> b!745749 (=> (not res!502695) (not e!416468))))

(assert (=> b!745749 (= res!502695 (validKeyInArray!0 k0!2102))))

(declare-fun b!745750 () Bool)

(declare-fun res!502698 () Bool)

(assert (=> b!745750 (=> (not res!502698) (not e!416463))))

(assert (=> b!745750 (= res!502698 e!416466)))

(declare-fun c!81903 () Bool)

(assert (=> b!745750 (= c!81903 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745751 () Bool)

(declare-fun e!416464 () Bool)

(assert (=> b!745751 (= e!416463 e!416464)))

(declare-fun res!502706 () Bool)

(assert (=> b!745751 (=> (not res!502706) (not e!416464))))

(declare-fun lt!331228 () SeekEntryResult!7528)

(declare-fun lt!331234 () SeekEntryResult!7528)

(assert (=> b!745751 (= res!502706 (= lt!331228 lt!331234))))

(declare-fun lt!331230 () array!41634)

(assert (=> b!745751 (= lt!331234 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331226 lt!331230 mask!3328))))

(assert (=> b!745751 (= lt!331228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331226 mask!3328) lt!331226 lt!331230 mask!3328))))

(assert (=> b!745751 (= lt!331226 (select (store (arr!19931 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745751 (= lt!331230 (array!41635 (store (arr!19931 a!3186) i!1173 k0!2102) (size!20352 a!3186)))))

(declare-fun b!745752 () Bool)

(declare-fun res!502707 () Bool)

(assert (=> b!745752 (=> (not res!502707) (not e!416467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41634 (_ BitVec 32)) Bool)

(assert (=> b!745752 (= res!502707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745753 () Bool)

(assert (=> b!745753 (= e!416464 (not e!416470))))

(declare-fun res!502692 () Bool)

(assert (=> b!745753 (=> res!502692 e!416470)))

(get-info :version)

(assert (=> b!745753 (= res!502692 (or (not ((_ is Intermediate!7528) lt!331234)) (bvslt x!1131 (x!63441 lt!331234)) (not (= x!1131 (x!63441 lt!331234))) (not (= index!1321 (index!32482 lt!331234)))))))

(assert (=> b!745753 e!416465))

(declare-fun res!502703 () Bool)

(assert (=> b!745753 (=> (not res!502703) (not e!416465))))

(assert (=> b!745753 (= res!502703 (= lt!331229 lt!331233))))

(assert (=> b!745753 (= lt!331233 (Found!7528 j!159))))

(assert (=> b!745753 (= lt!331229 (seekEntryOrOpen!0 (select (arr!19931 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!745753 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25508 0))(
  ( (Unit!25509) )
))
(declare-fun lt!331235 () Unit!25508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25508)

(assert (=> b!745753 (= lt!331235 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745754 () Bool)

(assert (=> b!745754 (= e!416466 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19931 a!3186) j!159) a!3186 mask!3328) (Found!7528 j!159)))))

(assert (= (and start!65444 res!502700) b!745739))

(assert (= (and b!745739 res!502693) b!745746))

(assert (= (and b!745746 res!502704) b!745749))

(assert (= (and b!745749 res!502695) b!745737))

(assert (= (and b!745737 res!502696) b!745744))

(assert (= (and b!745744 res!502705) b!745752))

(assert (= (and b!745752 res!502707) b!745740))

(assert (= (and b!745740 res!502694) b!745748))

(assert (= (and b!745748 res!502701) b!745738))

(assert (= (and b!745738 res!502697) b!745742))

(assert (= (and b!745742 res!502702) b!745750))

(assert (= (and b!745750 c!81903) b!745747))

(assert (= (and b!745750 (not c!81903)) b!745754))

(assert (= (and b!745750 res!502698) b!745751))

(assert (= (and b!745751 res!502706) b!745753))

(assert (= (and b!745753 res!502703) b!745741))

(assert (= (and b!745753 (not res!502692)) b!745743))

(assert (= (and b!745743 (not res!502699)) b!745745))

(declare-fun m!695537 () Bool)

(assert (=> b!745742 m!695537))

(declare-fun m!695539 () Bool)

(assert (=> b!745754 m!695539))

(assert (=> b!745754 m!695539))

(declare-fun m!695541 () Bool)

(assert (=> b!745754 m!695541))

(assert (=> b!745747 m!695539))

(assert (=> b!745747 m!695539))

(declare-fun m!695543 () Bool)

(assert (=> b!745747 m!695543))

(assert (=> b!745741 m!695539))

(assert (=> b!745741 m!695539))

(declare-fun m!695545 () Bool)

(assert (=> b!745741 m!695545))

(assert (=> b!745753 m!695539))

(assert (=> b!745753 m!695539))

(declare-fun m!695547 () Bool)

(assert (=> b!745753 m!695547))

(declare-fun m!695549 () Bool)

(assert (=> b!745753 m!695549))

(declare-fun m!695551 () Bool)

(assert (=> b!745753 m!695551))

(declare-fun m!695553 () Bool)

(assert (=> b!745749 m!695553))

(declare-fun m!695555 () Bool)

(assert (=> b!745743 m!695555))

(declare-fun m!695557 () Bool)

(assert (=> b!745743 m!695557))

(assert (=> b!745743 m!695539))

(assert (=> b!745743 m!695539))

(assert (=> b!745743 m!695541))

(declare-fun m!695559 () Bool)

(assert (=> b!745752 m!695559))

(declare-fun m!695561 () Bool)

(assert (=> b!745737 m!695561))

(declare-fun m!695563 () Bool)

(assert (=> b!745744 m!695563))

(assert (=> b!745738 m!695539))

(assert (=> b!745738 m!695539))

(declare-fun m!695565 () Bool)

(assert (=> b!745738 m!695565))

(assert (=> b!745738 m!695565))

(assert (=> b!745738 m!695539))

(declare-fun m!695567 () Bool)

(assert (=> b!745738 m!695567))

(assert (=> b!745746 m!695539))

(assert (=> b!745746 m!695539))

(declare-fun m!695569 () Bool)

(assert (=> b!745746 m!695569))

(declare-fun m!695571 () Bool)

(assert (=> b!745740 m!695571))

(declare-fun m!695573 () Bool)

(assert (=> b!745751 m!695573))

(declare-fun m!695575 () Bool)

(assert (=> b!745751 m!695575))

(assert (=> b!745751 m!695573))

(assert (=> b!745751 m!695555))

(declare-fun m!695577 () Bool)

(assert (=> b!745751 m!695577))

(declare-fun m!695579 () Bool)

(assert (=> b!745751 m!695579))

(declare-fun m!695581 () Bool)

(assert (=> start!65444 m!695581))

(declare-fun m!695583 () Bool)

(assert (=> start!65444 m!695583))

(check-sat (not b!745744) (not b!745743) (not b!745741) (not b!745740) (not b!745746) (not b!745747) (not b!745737) (not start!65444) (not b!745749) (not b!745753) (not b!745754) (not b!745752) (not b!745751) (not b!745738))
(check-sat)
