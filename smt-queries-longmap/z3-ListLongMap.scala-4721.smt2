; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65366 () Bool)

(assert start!65366)

(declare-fun b!743597 () Bool)

(declare-fun res!500793 () Bool)

(declare-fun e!415414 () Bool)

(assert (=> b!743597 (=> (not res!500793) (not e!415414))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41556 0))(
  ( (array!41557 (arr!19892 (Array (_ BitVec 32) (_ BitVec 64))) (size!20313 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41556)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743597 (= res!500793 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19892 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743598 () Bool)

(declare-fun res!500798 () Bool)

(declare-fun e!415416 () Bool)

(assert (=> b!743598 (=> res!500798 e!415416)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7489 0))(
  ( (MissingZero!7489 (index!32324 (_ BitVec 32))) (Found!7489 (index!32325 (_ BitVec 32))) (Intermediate!7489 (undefined!8301 Bool) (index!32326 (_ BitVec 32)) (x!63298 (_ BitVec 32))) (Undefined!7489) (MissingVacant!7489 (index!32327 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41556 (_ BitVec 32)) SeekEntryResult!7489)

(assert (=> b!743598 (= res!500798 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19892 a!3186) j!159) a!3186 mask!3328) (Found!7489 j!159))))))

(declare-fun b!743599 () Bool)

(declare-fun res!500792 () Bool)

(assert (=> b!743599 (=> (not res!500792) (not e!415414))))

(declare-fun e!415413 () Bool)

(assert (=> b!743599 (= res!500792 e!415413)))

(declare-fun c!81786 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743599 (= c!81786 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743600 () Bool)

(declare-fun e!415412 () Bool)

(declare-fun e!415409 () Bool)

(assert (=> b!743600 (= e!415412 e!415409)))

(declare-fun res!500787 () Bool)

(assert (=> b!743600 (=> (not res!500787) (not e!415409))))

(declare-fun lt!330187 () SeekEntryResult!7489)

(assert (=> b!743600 (= res!500787 (or (= lt!330187 (MissingZero!7489 i!1173)) (= lt!330187 (MissingVacant!7489 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41556 (_ BitVec 32)) SeekEntryResult!7489)

(assert (=> b!743600 (= lt!330187 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743601 () Bool)

(declare-fun res!500802 () Bool)

(assert (=> b!743601 (=> (not res!500802) (not e!415412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743601 (= res!500802 (validKeyInArray!0 (select (arr!19892 a!3186) j!159)))))

(declare-fun b!743602 () Bool)

(assert (=> b!743602 (= e!415413 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19892 a!3186) j!159) a!3186 mask!3328) (Found!7489 j!159)))))

(declare-fun b!743603 () Bool)

(assert (=> b!743603 (= e!415409 e!415414)))

(declare-fun res!500799 () Bool)

(assert (=> b!743603 (=> (not res!500799) (not e!415414))))

(declare-fun lt!330190 () SeekEntryResult!7489)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41556 (_ BitVec 32)) SeekEntryResult!7489)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743603 (= res!500799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19892 a!3186) j!159) mask!3328) (select (arr!19892 a!3186) j!159) a!3186 mask!3328) lt!330190))))

(assert (=> b!743603 (= lt!330190 (Intermediate!7489 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!500801 () Bool)

(assert (=> start!65366 (=> (not res!500801) (not e!415412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65366 (= res!500801 (validMask!0 mask!3328))))

(assert (=> start!65366 e!415412))

(assert (=> start!65366 true))

(declare-fun array_inv!15775 (array!41556) Bool)

(assert (=> start!65366 (array_inv!15775 a!3186)))

(declare-fun b!743604 () Bool)

(declare-fun res!500800 () Bool)

(assert (=> b!743604 (=> (not res!500800) (not e!415412))))

(assert (=> b!743604 (= res!500800 (validKeyInArray!0 k0!2102))))

(declare-fun b!743605 () Bool)

(assert (=> b!743605 (= e!415413 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19892 a!3186) j!159) a!3186 mask!3328) lt!330190))))

(declare-fun e!415417 () Bool)

(declare-fun lt!330192 () SeekEntryResult!7489)

(declare-fun b!743606 () Bool)

(assert (=> b!743606 (= e!415417 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19892 a!3186) j!159) a!3186 mask!3328) lt!330192))))

(declare-fun b!743607 () Bool)

(declare-fun res!500789 () Bool)

(assert (=> b!743607 (=> (not res!500789) (not e!415409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41556 (_ BitVec 32)) Bool)

(assert (=> b!743607 (= res!500789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743608 () Bool)

(declare-fun res!500788 () Bool)

(assert (=> b!743608 (=> (not res!500788) (not e!415409))))

(assert (=> b!743608 (= res!500788 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20313 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20313 a!3186))))))

(declare-fun b!743609 () Bool)

(declare-fun e!415411 () Bool)

(assert (=> b!743609 (= e!415411 e!415417)))

(declare-fun res!500790 () Bool)

(assert (=> b!743609 (=> (not res!500790) (not e!415417))))

(assert (=> b!743609 (= res!500790 (= (seekEntryOrOpen!0 (select (arr!19892 a!3186) j!159) a!3186 mask!3328) lt!330192))))

(assert (=> b!743609 (= lt!330192 (Found!7489 j!159))))

(declare-fun b!743610 () Bool)

(declare-fun res!500794 () Bool)

(assert (=> b!743610 (=> (not res!500794) (not e!415412))))

(assert (=> b!743610 (= res!500794 (and (= (size!20313 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20313 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20313 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743611 () Bool)

(declare-fun res!500797 () Bool)

(assert (=> b!743611 (=> (not res!500797) (not e!415412))))

(declare-fun arrayContainsKey!0 (array!41556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743611 (= res!500797 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743612 () Bool)

(declare-fun res!500791 () Bool)

(assert (=> b!743612 (=> (not res!500791) (not e!415409))))

(declare-datatypes ((List!13933 0))(
  ( (Nil!13930) (Cons!13929 (h!15001 (_ BitVec 64)) (t!20239 List!13933)) )
))
(declare-fun arrayNoDuplicates!0 (array!41556 (_ BitVec 32) List!13933) Bool)

(assert (=> b!743612 (= res!500791 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13930))))

(declare-fun b!743613 () Bool)

(declare-fun e!415415 () Bool)

(assert (=> b!743613 (= e!415414 e!415415)))

(declare-fun res!500796 () Bool)

(assert (=> b!743613 (=> (not res!500796) (not e!415415))))

(declare-fun lt!330188 () SeekEntryResult!7489)

(declare-fun lt!330193 () SeekEntryResult!7489)

(assert (=> b!743613 (= res!500796 (= lt!330188 lt!330193))))

(declare-fun lt!330191 () (_ BitVec 64))

(declare-fun lt!330189 () array!41556)

(assert (=> b!743613 (= lt!330193 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330191 lt!330189 mask!3328))))

(assert (=> b!743613 (= lt!330188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330191 mask!3328) lt!330191 lt!330189 mask!3328))))

(assert (=> b!743613 (= lt!330191 (select (store (arr!19892 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743613 (= lt!330189 (array!41557 (store (arr!19892 a!3186) i!1173 k0!2102) (size!20313 a!3186)))))

(declare-fun b!743614 () Bool)

(assert (=> b!743614 (= e!415416 (or (= (select (store (arr!19892 a!3186) i!1173 k0!2102) index!1321) lt!330191) (not (= (select (store (arr!19892 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!743615 () Bool)

(assert (=> b!743615 (= e!415415 (not e!415416))))

(declare-fun res!500786 () Bool)

(assert (=> b!743615 (=> res!500786 e!415416)))

(get-info :version)

(assert (=> b!743615 (= res!500786 (or (not ((_ is Intermediate!7489) lt!330193)) (bvslt x!1131 (x!63298 lt!330193)) (not (= x!1131 (x!63298 lt!330193))) (not (= index!1321 (index!32326 lt!330193)))))))

(assert (=> b!743615 e!415411))

(declare-fun res!500795 () Bool)

(assert (=> b!743615 (=> (not res!500795) (not e!415411))))

(assert (=> b!743615 (= res!500795 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25430 0))(
  ( (Unit!25431) )
))
(declare-fun lt!330194 () Unit!25430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25430)

(assert (=> b!743615 (= lt!330194 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65366 res!500801) b!743610))

(assert (= (and b!743610 res!500794) b!743601))

(assert (= (and b!743601 res!500802) b!743604))

(assert (= (and b!743604 res!500800) b!743611))

(assert (= (and b!743611 res!500797) b!743600))

(assert (= (and b!743600 res!500787) b!743607))

(assert (= (and b!743607 res!500789) b!743612))

(assert (= (and b!743612 res!500791) b!743608))

(assert (= (and b!743608 res!500788) b!743603))

(assert (= (and b!743603 res!500799) b!743597))

(assert (= (and b!743597 res!500793) b!743599))

(assert (= (and b!743599 c!81786) b!743605))

(assert (= (and b!743599 (not c!81786)) b!743602))

(assert (= (and b!743599 res!500792) b!743613))

(assert (= (and b!743613 res!500796) b!743615))

(assert (= (and b!743615 res!500795) b!743609))

(assert (= (and b!743609 res!500790) b!743606))

(assert (= (and b!743615 (not res!500786)) b!743598))

(assert (= (and b!743598 (not res!500798)) b!743614))

(declare-fun m!693707 () Bool)

(assert (=> b!743613 m!693707))

(assert (=> b!743613 m!693707))

(declare-fun m!693709 () Bool)

(assert (=> b!743613 m!693709))

(declare-fun m!693711 () Bool)

(assert (=> b!743613 m!693711))

(declare-fun m!693713 () Bool)

(assert (=> b!743613 m!693713))

(declare-fun m!693715 () Bool)

(assert (=> b!743613 m!693715))

(declare-fun m!693717 () Bool)

(assert (=> b!743612 m!693717))

(declare-fun m!693719 () Bool)

(assert (=> start!65366 m!693719))

(declare-fun m!693721 () Bool)

(assert (=> start!65366 m!693721))

(declare-fun m!693723 () Bool)

(assert (=> b!743615 m!693723))

(declare-fun m!693725 () Bool)

(assert (=> b!743615 m!693725))

(declare-fun m!693727 () Bool)

(assert (=> b!743609 m!693727))

(assert (=> b!743609 m!693727))

(declare-fun m!693729 () Bool)

(assert (=> b!743609 m!693729))

(assert (=> b!743598 m!693727))

(assert (=> b!743598 m!693727))

(declare-fun m!693731 () Bool)

(assert (=> b!743598 m!693731))

(assert (=> b!743605 m!693727))

(assert (=> b!743605 m!693727))

(declare-fun m!693733 () Bool)

(assert (=> b!743605 m!693733))

(assert (=> b!743603 m!693727))

(assert (=> b!743603 m!693727))

(declare-fun m!693735 () Bool)

(assert (=> b!743603 m!693735))

(assert (=> b!743603 m!693735))

(assert (=> b!743603 m!693727))

(declare-fun m!693737 () Bool)

(assert (=> b!743603 m!693737))

(declare-fun m!693739 () Bool)

(assert (=> b!743600 m!693739))

(declare-fun m!693741 () Bool)

(assert (=> b!743607 m!693741))

(assert (=> b!743606 m!693727))

(assert (=> b!743606 m!693727))

(declare-fun m!693743 () Bool)

(assert (=> b!743606 m!693743))

(declare-fun m!693745 () Bool)

(assert (=> b!743611 m!693745))

(declare-fun m!693747 () Bool)

(assert (=> b!743597 m!693747))

(assert (=> b!743614 m!693711))

(declare-fun m!693749 () Bool)

(assert (=> b!743614 m!693749))

(assert (=> b!743601 m!693727))

(assert (=> b!743601 m!693727))

(declare-fun m!693751 () Bool)

(assert (=> b!743601 m!693751))

(declare-fun m!693753 () Bool)

(assert (=> b!743604 m!693753))

(assert (=> b!743602 m!693727))

(assert (=> b!743602 m!693727))

(assert (=> b!743602 m!693731))

(check-sat (not b!743601) (not b!743598) (not b!743615) (not b!743605) (not b!743600) (not b!743606) (not b!743613) (not b!743603) (not b!743609) (not b!743612) (not b!743611) (not b!743604) (not start!65366) (not b!743607) (not b!743602))
(check-sat)
