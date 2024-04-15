; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66764 () Bool)

(assert start!66764)

(declare-fun b!769726 () Bool)

(declare-fun e!428573 () Bool)

(declare-fun e!428566 () Bool)

(assert (=> b!769726 (= e!428573 e!428566)))

(declare-fun res!520674 () Bool)

(assert (=> b!769726 (=> (not res!520674) (not e!428566))))

(declare-datatypes ((array!42345 0))(
  ( (array!42346 (arr!20273 (Array (_ BitVec 32) (_ BitVec 64))) (size!20694 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42345)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7870 0))(
  ( (MissingZero!7870 (index!33848 (_ BitVec 32))) (Found!7870 (index!33849 (_ BitVec 32))) (Intermediate!7870 (undefined!8682 Bool) (index!33850 (_ BitVec 32)) (x!64788 (_ BitVec 32))) (Undefined!7870) (MissingVacant!7870 (index!33851 (_ BitVec 32))) )
))
(declare-fun lt!342403 () SeekEntryResult!7870)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42345 (_ BitVec 32)) SeekEntryResult!7870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769726 (= res!520674 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20273 a!3186) j!159) mask!3328) (select (arr!20273 a!3186) j!159) a!3186 mask!3328) lt!342403))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769726 (= lt!342403 (Intermediate!7870 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769727 () Bool)

(declare-fun e!428567 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42345 (_ BitVec 32)) SeekEntryResult!7870)

(assert (=> b!769727 (= e!428567 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) (Found!7870 j!159)))))

(declare-fun b!769728 () Bool)

(declare-fun e!428569 () Bool)

(assert (=> b!769728 (= e!428569 e!428573)))

(declare-fun res!520679 () Bool)

(assert (=> b!769728 (=> (not res!520679) (not e!428573))))

(declare-fun lt!342407 () SeekEntryResult!7870)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769728 (= res!520679 (or (= lt!342407 (MissingZero!7870 i!1173)) (= lt!342407 (MissingVacant!7870 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42345 (_ BitVec 32)) SeekEntryResult!7870)

(assert (=> b!769728 (= lt!342407 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769729 () Bool)

(declare-fun res!520675 () Bool)

(assert (=> b!769729 (=> (not res!520675) (not e!428573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42345 (_ BitVec 32)) Bool)

(assert (=> b!769729 (= res!520675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769730 () Bool)

(declare-fun res!520681 () Bool)

(assert (=> b!769730 (=> (not res!520681) (not e!428566))))

(assert (=> b!769730 (= res!520681 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20273 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769731 () Bool)

(declare-fun res!520683 () Bool)

(assert (=> b!769731 (=> (not res!520683) (not e!428566))))

(assert (=> b!769731 (= res!520683 e!428567)))

(declare-fun c!84924 () Bool)

(assert (=> b!769731 (= c!84924 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769732 () Bool)

(declare-fun e!428575 () Bool)

(declare-fun e!428570 () Bool)

(assert (=> b!769732 (= e!428575 (not e!428570))))

(declare-fun res!520680 () Bool)

(assert (=> b!769732 (=> res!520680 e!428570)))

(declare-fun lt!342410 () SeekEntryResult!7870)

(get-info :version)

(assert (=> b!769732 (= res!520680 (or (not ((_ is Intermediate!7870) lt!342410)) (bvsge x!1131 (x!64788 lt!342410))))))

(declare-fun e!428572 () Bool)

(assert (=> b!769732 e!428572))

(declare-fun res!520677 () Bool)

(assert (=> b!769732 (=> (not res!520677) (not e!428572))))

(assert (=> b!769732 (= res!520677 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26474 0))(
  ( (Unit!26475) )
))
(declare-fun lt!342400 () Unit!26474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42345 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26474)

(assert (=> b!769732 (= lt!342400 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769733 () Bool)

(declare-fun res!520682 () Bool)

(assert (=> b!769733 (=> (not res!520682) (not e!428569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769733 (= res!520682 (validKeyInArray!0 k0!2102))))

(declare-fun b!769734 () Bool)

(assert (=> b!769734 (= e!428566 e!428575)))

(declare-fun res!520678 () Bool)

(assert (=> b!769734 (=> (not res!520678) (not e!428575))))

(declare-fun lt!342408 () SeekEntryResult!7870)

(assert (=> b!769734 (= res!520678 (= lt!342408 lt!342410))))

(declare-fun lt!342409 () array!42345)

(declare-fun lt!342404 () (_ BitVec 64))

(assert (=> b!769734 (= lt!342410 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342404 lt!342409 mask!3328))))

(assert (=> b!769734 (= lt!342408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342404 mask!3328) lt!342404 lt!342409 mask!3328))))

(assert (=> b!769734 (= lt!342404 (select (store (arr!20273 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769734 (= lt!342409 (array!42346 (store (arr!20273 a!3186) i!1173 k0!2102) (size!20694 a!3186)))))

(declare-fun b!769736 () Bool)

(assert (=> b!769736 (= e!428570 true)))

(declare-fun lt!342401 () Unit!26474)

(declare-fun e!428568 () Unit!26474)

(assert (=> b!769736 (= lt!342401 e!428568)))

(declare-fun c!84923 () Bool)

(assert (=> b!769736 (= c!84923 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342406 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769736 (= lt!342406 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769737 () Bool)

(declare-fun Unit!26476 () Unit!26474)

(assert (=> b!769737 (= e!428568 Unit!26476)))

(declare-fun lt!342405 () SeekEntryResult!7870)

(assert (=> b!769737 (= lt!342405 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20273 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769737 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342406 resIntermediateIndex!5 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) (Found!7870 j!159))))

(declare-fun b!769738 () Bool)

(declare-fun res!520686 () Bool)

(assert (=> b!769738 (=> (not res!520686) (not e!428569))))

(assert (=> b!769738 (= res!520686 (validKeyInArray!0 (select (arr!20273 a!3186) j!159)))))

(declare-fun b!769739 () Bool)

(declare-fun e!428574 () Bool)

(declare-fun lt!342402 () SeekEntryResult!7870)

(assert (=> b!769739 (= e!428574 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) lt!342402))))

(declare-fun b!769740 () Bool)

(declare-fun Unit!26477 () Unit!26474)

(assert (=> b!769740 (= e!428568 Unit!26477)))

(assert (=> b!769740 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342406 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) lt!342403)))

(declare-fun b!769741 () Bool)

(assert (=> b!769741 (= e!428572 e!428574)))

(declare-fun res!520685 () Bool)

(assert (=> b!769741 (=> (not res!520685) (not e!428574))))

(assert (=> b!769741 (= res!520685 (= (seekEntryOrOpen!0 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) lt!342402))))

(assert (=> b!769741 (= lt!342402 (Found!7870 j!159))))

(declare-fun b!769742 () Bool)

(declare-fun res!520676 () Bool)

(assert (=> b!769742 (=> (not res!520676) (not e!428573))))

(declare-datatypes ((List!14314 0))(
  ( (Nil!14311) (Cons!14310 (h!15409 (_ BitVec 64)) (t!20620 List!14314)) )
))
(declare-fun arrayNoDuplicates!0 (array!42345 (_ BitVec 32) List!14314) Bool)

(assert (=> b!769742 (= res!520676 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14311))))

(declare-fun b!769743 () Bool)

(assert (=> b!769743 (= e!428567 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) lt!342403))))

(declare-fun b!769744 () Bool)

(declare-fun res!520671 () Bool)

(assert (=> b!769744 (=> (not res!520671) (not e!428569))))

(declare-fun arrayContainsKey!0 (array!42345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769744 (= res!520671 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769745 () Bool)

(declare-fun res!520672 () Bool)

(assert (=> b!769745 (=> (not res!520672) (not e!428569))))

(assert (=> b!769745 (= res!520672 (and (= (size!20694 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20694 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20694 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769735 () Bool)

(declare-fun res!520684 () Bool)

(assert (=> b!769735 (=> (not res!520684) (not e!428573))))

(assert (=> b!769735 (= res!520684 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20694 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20694 a!3186))))))

(declare-fun res!520673 () Bool)

(assert (=> start!66764 (=> (not res!520673) (not e!428569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66764 (= res!520673 (validMask!0 mask!3328))))

(assert (=> start!66764 e!428569))

(assert (=> start!66764 true))

(declare-fun array_inv!16156 (array!42345) Bool)

(assert (=> start!66764 (array_inv!16156 a!3186)))

(assert (= (and start!66764 res!520673) b!769745))

(assert (= (and b!769745 res!520672) b!769738))

(assert (= (and b!769738 res!520686) b!769733))

(assert (= (and b!769733 res!520682) b!769744))

(assert (= (and b!769744 res!520671) b!769728))

(assert (= (and b!769728 res!520679) b!769729))

(assert (= (and b!769729 res!520675) b!769742))

(assert (= (and b!769742 res!520676) b!769735))

(assert (= (and b!769735 res!520684) b!769726))

(assert (= (and b!769726 res!520674) b!769730))

(assert (= (and b!769730 res!520681) b!769731))

(assert (= (and b!769731 c!84924) b!769743))

(assert (= (and b!769731 (not c!84924)) b!769727))

(assert (= (and b!769731 res!520683) b!769734))

(assert (= (and b!769734 res!520678) b!769732))

(assert (= (and b!769732 res!520677) b!769741))

(assert (= (and b!769741 res!520685) b!769739))

(assert (= (and b!769732 (not res!520680)) b!769736))

(assert (= (and b!769736 c!84923) b!769740))

(assert (= (and b!769736 (not c!84923)) b!769737))

(declare-fun m!714561 () Bool)

(assert (=> b!769737 m!714561))

(assert (=> b!769737 m!714561))

(declare-fun m!714563 () Bool)

(assert (=> b!769737 m!714563))

(assert (=> b!769737 m!714561))

(declare-fun m!714565 () Bool)

(assert (=> b!769737 m!714565))

(declare-fun m!714567 () Bool)

(assert (=> b!769744 m!714567))

(assert (=> b!769740 m!714561))

(assert (=> b!769740 m!714561))

(declare-fun m!714569 () Bool)

(assert (=> b!769740 m!714569))

(assert (=> b!769743 m!714561))

(assert (=> b!769743 m!714561))

(declare-fun m!714571 () Bool)

(assert (=> b!769743 m!714571))

(declare-fun m!714573 () Bool)

(assert (=> start!66764 m!714573))

(declare-fun m!714575 () Bool)

(assert (=> start!66764 m!714575))

(declare-fun m!714577 () Bool)

(assert (=> b!769732 m!714577))

(declare-fun m!714579 () Bool)

(assert (=> b!769732 m!714579))

(declare-fun m!714581 () Bool)

(assert (=> b!769736 m!714581))

(assert (=> b!769726 m!714561))

(assert (=> b!769726 m!714561))

(declare-fun m!714583 () Bool)

(assert (=> b!769726 m!714583))

(assert (=> b!769726 m!714583))

(assert (=> b!769726 m!714561))

(declare-fun m!714585 () Bool)

(assert (=> b!769726 m!714585))

(declare-fun m!714587 () Bool)

(assert (=> b!769742 m!714587))

(assert (=> b!769738 m!714561))

(assert (=> b!769738 m!714561))

(declare-fun m!714589 () Bool)

(assert (=> b!769738 m!714589))

(assert (=> b!769739 m!714561))

(assert (=> b!769739 m!714561))

(declare-fun m!714591 () Bool)

(assert (=> b!769739 m!714591))

(declare-fun m!714593 () Bool)

(assert (=> b!769734 m!714593))

(declare-fun m!714595 () Bool)

(assert (=> b!769734 m!714595))

(assert (=> b!769734 m!714593))

(declare-fun m!714597 () Bool)

(assert (=> b!769734 m!714597))

(declare-fun m!714599 () Bool)

(assert (=> b!769734 m!714599))

(declare-fun m!714601 () Bool)

(assert (=> b!769734 m!714601))

(assert (=> b!769741 m!714561))

(assert (=> b!769741 m!714561))

(declare-fun m!714603 () Bool)

(assert (=> b!769741 m!714603))

(declare-fun m!714605 () Bool)

(assert (=> b!769728 m!714605))

(declare-fun m!714607 () Bool)

(assert (=> b!769729 m!714607))

(declare-fun m!714609 () Bool)

(assert (=> b!769730 m!714609))

(assert (=> b!769727 m!714561))

(assert (=> b!769727 m!714561))

(assert (=> b!769727 m!714563))

(declare-fun m!714611 () Bool)

(assert (=> b!769733 m!714611))

(check-sat (not start!66764) (not b!769740) (not b!769743) (not b!769729) (not b!769727) (not b!769738) (not b!769744) (not b!769739) (not b!769733) (not b!769737) (not b!769726) (not b!769742) (not b!769741) (not b!769732) (not b!769736) (not b!769728) (not b!769734))
(check-sat)
