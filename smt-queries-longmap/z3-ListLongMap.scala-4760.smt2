; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65600 () Bool)

(assert start!65600)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41790 0))(
  ( (array!41791 (arr!20009 (Array (_ BitVec 32) (_ BitVec 64))) (size!20430 (_ BitVec 32))) )
))
(declare-fun lt!333643 () array!41790)

(declare-fun b!750587 () Bool)

(declare-fun lt!333641 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!418743 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7606 0))(
  ( (MissingZero!7606 (index!32792 (_ BitVec 32))) (Found!7606 (index!32793 (_ BitVec 32))) (Intermediate!7606 (undefined!8418 Bool) (index!32794 (_ BitVec 32)) (x!63727 (_ BitVec 32))) (Undefined!7606) (MissingVacant!7606 (index!32795 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41790 (_ BitVec 32)) SeekEntryResult!7606)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41790 (_ BitVec 32)) SeekEntryResult!7606)

(assert (=> b!750587 (= e!418743 (= (seekEntryOrOpen!0 lt!333641 lt!333643 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333641 lt!333643 mask!3328)))))

(declare-fun b!750588 () Bool)

(declare-fun res!506719 () Bool)

(declare-fun e!418737 () Bool)

(assert (=> b!750588 (=> (not res!506719) (not e!418737))))

(declare-fun a!3186 () array!41790)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750588 (= res!506719 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750589 () Bool)

(declare-fun res!506716 () Bool)

(assert (=> b!750589 (=> (not res!506716) (not e!418737))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750589 (= res!506716 (and (= (size!20430 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20430 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20430 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750590 () Bool)

(declare-fun e!418742 () Bool)

(declare-fun e!418735 () Bool)

(assert (=> b!750590 (= e!418742 e!418735)))

(declare-fun res!506714 () Bool)

(assert (=> b!750590 (=> res!506714 e!418735)))

(declare-fun lt!333648 () (_ BitVec 64))

(assert (=> b!750590 (= res!506714 (= lt!333648 lt!333641))))

(assert (=> b!750590 (= lt!333648 (select (store (arr!20009 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750591 () Bool)

(declare-fun res!506712 () Bool)

(declare-fun e!418741 () Bool)

(assert (=> b!750591 (=> (not res!506712) (not e!418741))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!750591 (= res!506712 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20009 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750592 () Bool)

(declare-fun e!418740 () Bool)

(assert (=> b!750592 (= e!418740 (not e!418742))))

(declare-fun res!506721 () Bool)

(assert (=> b!750592 (=> res!506721 e!418742)))

(declare-fun lt!333642 () SeekEntryResult!7606)

(get-info :version)

(assert (=> b!750592 (= res!506721 (or (not ((_ is Intermediate!7606) lt!333642)) (bvslt x!1131 (x!63727 lt!333642)) (not (= x!1131 (x!63727 lt!333642))) (not (= index!1321 (index!32794 lt!333642)))))))

(declare-fun e!418738 () Bool)

(assert (=> b!750592 e!418738))

(declare-fun res!506710 () Bool)

(assert (=> b!750592 (=> (not res!506710) (not e!418738))))

(declare-fun lt!333650 () SeekEntryResult!7606)

(declare-fun lt!333649 () SeekEntryResult!7606)

(assert (=> b!750592 (= res!506710 (= lt!333650 lt!333649))))

(assert (=> b!750592 (= lt!333649 (Found!7606 j!159))))

(assert (=> b!750592 (= lt!333650 (seekEntryOrOpen!0 (select (arr!20009 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41790 (_ BitVec 32)) Bool)

(assert (=> b!750592 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25784 0))(
  ( (Unit!25785) )
))
(declare-fun lt!333645 () Unit!25784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25784)

(assert (=> b!750592 (= lt!333645 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!506727 () Bool)

(assert (=> start!65600 (=> (not res!506727) (not e!418737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65600 (= res!506727 (validMask!0 mask!3328))))

(assert (=> start!65600 e!418737))

(assert (=> start!65600 true))

(declare-fun array_inv!15892 (array!41790) Bool)

(assert (=> start!65600 (array_inv!15892 a!3186)))

(declare-fun b!750593 () Bool)

(declare-fun e!418739 () Unit!25784)

(declare-fun Unit!25786 () Unit!25784)

(assert (=> b!750593 (= e!418739 Unit!25786)))

(assert (=> b!750593 false))

(declare-fun b!750594 () Bool)

(declare-fun res!506713 () Bool)

(assert (=> b!750594 (=> (not res!506713) (not e!418737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750594 (= res!506713 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!750595 () Bool)

(assert (=> b!750595 (= e!418738 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20009 a!3186) j!159) a!3186 mask!3328) lt!333649))))

(declare-fun b!750596 () Bool)

(declare-fun res!506722 () Bool)

(assert (=> b!750596 (=> (not res!506722) (not e!418737))))

(assert (=> b!750596 (= res!506722 (validKeyInArray!0 (select (arr!20009 a!3186) j!159)))))

(declare-fun e!418744 () Bool)

(declare-fun b!750597 () Bool)

(assert (=> b!750597 (= e!418744 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20009 a!3186) j!159) a!3186 mask!3328) (Found!7606 j!159)))))

(declare-fun b!750598 () Bool)

(declare-fun res!506723 () Bool)

(declare-fun e!418734 () Bool)

(assert (=> b!750598 (=> (not res!506723) (not e!418734))))

(declare-datatypes ((List!14050 0))(
  ( (Nil!14047) (Cons!14046 (h!15118 (_ BitVec 64)) (t!20356 List!14050)) )
))
(declare-fun arrayNoDuplicates!0 (array!41790 (_ BitVec 32) List!14050) Bool)

(assert (=> b!750598 (= res!506723 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14047))))

(declare-fun b!750599 () Bool)

(declare-fun res!506711 () Bool)

(assert (=> b!750599 (=> (not res!506711) (not e!418741))))

(assert (=> b!750599 (= res!506711 e!418744)))

(declare-fun c!82319 () Bool)

(assert (=> b!750599 (= c!82319 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750600 () Bool)

(declare-fun Unit!25787 () Unit!25784)

(assert (=> b!750600 (= e!418739 Unit!25787)))

(declare-fun b!750601 () Bool)

(assert (=> b!750601 (= e!418734 e!418741)))

(declare-fun res!506718 () Bool)

(assert (=> b!750601 (=> (not res!506718) (not e!418741))))

(declare-fun lt!333646 () SeekEntryResult!7606)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41790 (_ BitVec 32)) SeekEntryResult!7606)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750601 (= res!506718 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20009 a!3186) j!159) mask!3328) (select (arr!20009 a!3186) j!159) a!3186 mask!3328) lt!333646))))

(assert (=> b!750601 (= lt!333646 (Intermediate!7606 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750602 () Bool)

(assert (=> b!750602 (= e!418737 e!418734)))

(declare-fun res!506726 () Bool)

(assert (=> b!750602 (=> (not res!506726) (not e!418734))))

(declare-fun lt!333644 () SeekEntryResult!7606)

(assert (=> b!750602 (= res!506726 (or (= lt!333644 (MissingZero!7606 i!1173)) (= lt!333644 (MissingVacant!7606 i!1173))))))

(assert (=> b!750602 (= lt!333644 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750603 () Bool)

(assert (=> b!750603 (= e!418744 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20009 a!3186) j!159) a!3186 mask!3328) lt!333646))))

(declare-fun b!750604 () Bool)

(assert (=> b!750604 (= e!418735 true)))

(assert (=> b!750604 e!418743))

(declare-fun res!506717 () Bool)

(assert (=> b!750604 (=> (not res!506717) (not e!418743))))

(assert (=> b!750604 (= res!506717 (= lt!333648 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333640 () Unit!25784)

(assert (=> b!750604 (= lt!333640 e!418739)))

(declare-fun c!82320 () Bool)

(assert (=> b!750604 (= c!82320 (= lt!333648 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750605 () Bool)

(declare-fun res!506720 () Bool)

(assert (=> b!750605 (=> (not res!506720) (not e!418734))))

(assert (=> b!750605 (= res!506720 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20430 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20430 a!3186))))))

(declare-fun b!750606 () Bool)

(declare-fun res!506725 () Bool)

(assert (=> b!750606 (=> res!506725 e!418742)))

(assert (=> b!750606 (= res!506725 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20009 a!3186) j!159) a!3186 mask!3328) lt!333649)))))

(declare-fun b!750607 () Bool)

(assert (=> b!750607 (= e!418741 e!418740)))

(declare-fun res!506724 () Bool)

(assert (=> b!750607 (=> (not res!506724) (not e!418740))))

(declare-fun lt!333647 () SeekEntryResult!7606)

(assert (=> b!750607 (= res!506724 (= lt!333647 lt!333642))))

(assert (=> b!750607 (= lt!333642 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333641 lt!333643 mask!3328))))

(assert (=> b!750607 (= lt!333647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333641 mask!3328) lt!333641 lt!333643 mask!3328))))

(assert (=> b!750607 (= lt!333641 (select (store (arr!20009 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750607 (= lt!333643 (array!41791 (store (arr!20009 a!3186) i!1173 k0!2102) (size!20430 a!3186)))))

(declare-fun b!750608 () Bool)

(declare-fun res!506715 () Bool)

(assert (=> b!750608 (=> (not res!506715) (not e!418734))))

(assert (=> b!750608 (= res!506715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65600 res!506727) b!750589))

(assert (= (and b!750589 res!506716) b!750596))

(assert (= (and b!750596 res!506722) b!750594))

(assert (= (and b!750594 res!506713) b!750588))

(assert (= (and b!750588 res!506719) b!750602))

(assert (= (and b!750602 res!506726) b!750608))

(assert (= (and b!750608 res!506715) b!750598))

(assert (= (and b!750598 res!506723) b!750605))

(assert (= (and b!750605 res!506720) b!750601))

(assert (= (and b!750601 res!506718) b!750591))

(assert (= (and b!750591 res!506712) b!750599))

(assert (= (and b!750599 c!82319) b!750603))

(assert (= (and b!750599 (not c!82319)) b!750597))

(assert (= (and b!750599 res!506711) b!750607))

(assert (= (and b!750607 res!506724) b!750592))

(assert (= (and b!750592 res!506710) b!750595))

(assert (= (and b!750592 (not res!506721)) b!750606))

(assert (= (and b!750606 (not res!506725)) b!750590))

(assert (= (and b!750590 (not res!506714)) b!750604))

(assert (= (and b!750604 c!82320) b!750593))

(assert (= (and b!750604 (not c!82320)) b!750600))

(assert (= (and b!750604 res!506717) b!750587))

(declare-fun m!699389 () Bool)

(assert (=> b!750592 m!699389))

(assert (=> b!750592 m!699389))

(declare-fun m!699391 () Bool)

(assert (=> b!750592 m!699391))

(declare-fun m!699393 () Bool)

(assert (=> b!750592 m!699393))

(declare-fun m!699395 () Bool)

(assert (=> b!750592 m!699395))

(assert (=> b!750595 m!699389))

(assert (=> b!750595 m!699389))

(declare-fun m!699397 () Bool)

(assert (=> b!750595 m!699397))

(declare-fun m!699399 () Bool)

(assert (=> b!750607 m!699399))

(declare-fun m!699401 () Bool)

(assert (=> b!750607 m!699401))

(assert (=> b!750607 m!699399))

(declare-fun m!699403 () Bool)

(assert (=> b!750607 m!699403))

(declare-fun m!699405 () Bool)

(assert (=> b!750607 m!699405))

(declare-fun m!699407 () Bool)

(assert (=> b!750607 m!699407))

(declare-fun m!699409 () Bool)

(assert (=> b!750591 m!699409))

(declare-fun m!699411 () Bool)

(assert (=> b!750598 m!699411))

(declare-fun m!699413 () Bool)

(assert (=> b!750588 m!699413))

(declare-fun m!699415 () Bool)

(assert (=> b!750608 m!699415))

(assert (=> b!750603 m!699389))

(assert (=> b!750603 m!699389))

(declare-fun m!699417 () Bool)

(assert (=> b!750603 m!699417))

(assert (=> b!750597 m!699389))

(assert (=> b!750597 m!699389))

(declare-fun m!699419 () Bool)

(assert (=> b!750597 m!699419))

(assert (=> b!750601 m!699389))

(assert (=> b!750601 m!699389))

(declare-fun m!699421 () Bool)

(assert (=> b!750601 m!699421))

(assert (=> b!750601 m!699421))

(assert (=> b!750601 m!699389))

(declare-fun m!699423 () Bool)

(assert (=> b!750601 m!699423))

(assert (=> b!750596 m!699389))

(assert (=> b!750596 m!699389))

(declare-fun m!699425 () Bool)

(assert (=> b!750596 m!699425))

(declare-fun m!699427 () Bool)

(assert (=> start!65600 m!699427))

(declare-fun m!699429 () Bool)

(assert (=> start!65600 m!699429))

(assert (=> b!750606 m!699389))

(assert (=> b!750606 m!699389))

(assert (=> b!750606 m!699419))

(declare-fun m!699431 () Bool)

(assert (=> b!750602 m!699431))

(declare-fun m!699433 () Bool)

(assert (=> b!750587 m!699433))

(declare-fun m!699435 () Bool)

(assert (=> b!750587 m!699435))

(declare-fun m!699437 () Bool)

(assert (=> b!750594 m!699437))

(assert (=> b!750590 m!699403))

(declare-fun m!699439 () Bool)

(assert (=> b!750590 m!699439))

(check-sat (not b!750602) (not b!750596) (not b!750601) (not b!750603) (not b!750588) (not b!750595) (not b!750587) (not b!750594) (not b!750597) (not b!750606) (not b!750608) (not start!65600) (not b!750598) (not b!750592) (not b!750607))
(check-sat)
