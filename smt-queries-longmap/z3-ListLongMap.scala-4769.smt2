; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65802 () Bool)

(assert start!65802)

(declare-fun b!753411 () Bool)

(declare-fun e!420307 () Bool)

(declare-datatypes ((SeekEntryResult!7588 0))(
  ( (MissingZero!7588 (index!32720 (_ BitVec 32))) (Found!7588 (index!32721 (_ BitVec 32))) (Intermediate!7588 (undefined!8400 Bool) (index!32722 (_ BitVec 32)) (x!63798 (_ BitVec 32))) (Undefined!7588) (MissingVacant!7588 (index!32723 (_ BitVec 32))) )
))
(declare-fun lt!335136 () SeekEntryResult!7588)

(declare-fun lt!335133 () SeekEntryResult!7588)

(assert (=> b!753411 (= e!420307 (= lt!335136 lt!335133))))

(declare-fun b!753412 () Bool)

(declare-fun res!508641 () Bool)

(declare-fun e!420311 () Bool)

(assert (=> b!753412 (=> (not res!508641) (not e!420311))))

(declare-datatypes ((array!41845 0))(
  ( (array!41846 (arr!20032 (Array (_ BitVec 32) (_ BitVec 64))) (size!20452 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41845)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753412 (= res!508641 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753413 () Bool)

(declare-fun res!508645 () Bool)

(assert (=> b!753413 (=> (not res!508645) (not e!420311))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!753413 (= res!508645 (and (= (size!20452 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20452 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20452 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!508633 () Bool)

(assert (=> start!65802 (=> (not res!508633) (not e!420311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65802 (= res!508633 (validMask!0 mask!3328))))

(assert (=> start!65802 e!420311))

(assert (=> start!65802 true))

(declare-fun array_inv!15891 (array!41845) Bool)

(assert (=> start!65802 (array_inv!15891 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!753414 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!420314 () Bool)

(assert (=> b!753414 (= e!420314 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!753414 e!420307))

(declare-fun res!508644 () Bool)

(assert (=> b!753414 (=> (not res!508644) (not e!420307))))

(declare-fun lt!335139 () (_ BitVec 64))

(assert (=> b!753414 (= res!508644 (= lt!335139 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25909 0))(
  ( (Unit!25910) )
))
(declare-fun lt!335131 () Unit!25909)

(declare-fun e!420313 () Unit!25909)

(assert (=> b!753414 (= lt!335131 e!420313)))

(declare-fun c!82775 () Bool)

(assert (=> b!753414 (= c!82775 (= lt!335139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753415 () Bool)

(declare-fun e!420306 () Bool)

(assert (=> b!753415 (= e!420306 e!420314)))

(declare-fun res!508646 () Bool)

(assert (=> b!753415 (=> res!508646 e!420314)))

(declare-fun lt!335141 () (_ BitVec 64))

(assert (=> b!753415 (= res!508646 (= lt!335139 lt!335141))))

(assert (=> b!753415 (= lt!335139 (select (store (arr!20032 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753416 () Bool)

(declare-fun res!508647 () Bool)

(declare-fun e!420304 () Bool)

(assert (=> b!753416 (=> (not res!508647) (not e!420304))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753416 (= res!508647 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20452 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20452 a!3186))))))

(declare-fun b!753417 () Bool)

(declare-fun res!508638 () Bool)

(assert (=> b!753417 (=> (not res!508638) (not e!420307))))

(declare-fun lt!335137 () array!41845)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41845 (_ BitVec 32)) SeekEntryResult!7588)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41845 (_ BitVec 32)) SeekEntryResult!7588)

(assert (=> b!753417 (= res!508638 (= (seekEntryOrOpen!0 lt!335141 lt!335137 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335141 lt!335137 mask!3328)))))

(declare-fun b!753418 () Bool)

(declare-fun res!508631 () Bool)

(assert (=> b!753418 (=> (not res!508631) (not e!420311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753418 (= res!508631 (validKeyInArray!0 (select (arr!20032 a!3186) j!159)))))

(declare-fun b!753419 () Bool)

(assert (=> b!753419 (= e!420311 e!420304)))

(declare-fun res!508632 () Bool)

(assert (=> b!753419 (=> (not res!508632) (not e!420304))))

(declare-fun lt!335140 () SeekEntryResult!7588)

(assert (=> b!753419 (= res!508632 (or (= lt!335140 (MissingZero!7588 i!1173)) (= lt!335140 (MissingVacant!7588 i!1173))))))

(assert (=> b!753419 (= lt!335140 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753420 () Bool)

(declare-fun res!508640 () Bool)

(assert (=> b!753420 (=> (not res!508640) (not e!420304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41845 (_ BitVec 32)) Bool)

(assert (=> b!753420 (= res!508640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753421 () Bool)

(declare-fun res!508642 () Bool)

(declare-fun e!420312 () Bool)

(assert (=> b!753421 (=> (not res!508642) (not e!420312))))

(assert (=> b!753421 (= res!508642 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20032 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753422 () Bool)

(declare-fun e!420305 () Bool)

(assert (=> b!753422 (= e!420305 e!420306)))

(declare-fun res!508643 () Bool)

(assert (=> b!753422 (=> res!508643 e!420306)))

(declare-fun lt!335134 () SeekEntryResult!7588)

(assert (=> b!753422 (= res!508643 (not (= lt!335133 lt!335134)))))

(assert (=> b!753422 (= lt!335133 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20032 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!420309 () Bool)

(declare-fun lt!335132 () SeekEntryResult!7588)

(declare-fun b!753423 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41845 (_ BitVec 32)) SeekEntryResult!7588)

(assert (=> b!753423 (= e!420309 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20032 a!3186) j!159) a!3186 mask!3328) lt!335132))))

(declare-fun b!753424 () Bool)

(declare-fun Unit!25911 () Unit!25909)

(assert (=> b!753424 (= e!420313 Unit!25911)))

(assert (=> b!753424 false))

(declare-fun b!753425 () Bool)

(declare-fun e!420315 () Bool)

(assert (=> b!753425 (= e!420315 (not e!420305))))

(declare-fun res!508637 () Bool)

(assert (=> b!753425 (=> res!508637 e!420305)))

(declare-fun lt!335142 () SeekEntryResult!7588)

(get-info :version)

(assert (=> b!753425 (= res!508637 (or (not ((_ is Intermediate!7588) lt!335142)) (bvslt x!1131 (x!63798 lt!335142)) (not (= x!1131 (x!63798 lt!335142))) (not (= index!1321 (index!32722 lt!335142)))))))

(declare-fun e!420310 () Bool)

(assert (=> b!753425 e!420310))

(declare-fun res!508635 () Bool)

(assert (=> b!753425 (=> (not res!508635) (not e!420310))))

(assert (=> b!753425 (= res!508635 (= lt!335136 lt!335134))))

(assert (=> b!753425 (= lt!335134 (Found!7588 j!159))))

(assert (=> b!753425 (= lt!335136 (seekEntryOrOpen!0 (select (arr!20032 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753425 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335138 () Unit!25909)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25909)

(assert (=> b!753425 (= lt!335138 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753426 () Bool)

(assert (=> b!753426 (= e!420304 e!420312)))

(declare-fun res!508630 () Bool)

(assert (=> b!753426 (=> (not res!508630) (not e!420312))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753426 (= res!508630 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20032 a!3186) j!159) mask!3328) (select (arr!20032 a!3186) j!159) a!3186 mask!3328) lt!335132))))

(assert (=> b!753426 (= lt!335132 (Intermediate!7588 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753427 () Bool)

(declare-fun Unit!25912 () Unit!25909)

(assert (=> b!753427 (= e!420313 Unit!25912)))

(declare-fun b!753428 () Bool)

(declare-fun res!508636 () Bool)

(assert (=> b!753428 (=> (not res!508636) (not e!420304))))

(declare-datatypes ((List!13941 0))(
  ( (Nil!13938) (Cons!13937 (h!15015 (_ BitVec 64)) (t!20248 List!13941)) )
))
(declare-fun arrayNoDuplicates!0 (array!41845 (_ BitVec 32) List!13941) Bool)

(assert (=> b!753428 (= res!508636 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13938))))

(declare-fun b!753429 () Bool)

(assert (=> b!753429 (= e!420312 e!420315)))

(declare-fun res!508648 () Bool)

(assert (=> b!753429 (=> (not res!508648) (not e!420315))))

(declare-fun lt!335135 () SeekEntryResult!7588)

(assert (=> b!753429 (= res!508648 (= lt!335135 lt!335142))))

(assert (=> b!753429 (= lt!335142 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335141 lt!335137 mask!3328))))

(assert (=> b!753429 (= lt!335135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335141 mask!3328) lt!335141 lt!335137 mask!3328))))

(assert (=> b!753429 (= lt!335141 (select (store (arr!20032 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753429 (= lt!335137 (array!41846 (store (arr!20032 a!3186) i!1173 k0!2102) (size!20452 a!3186)))))

(declare-fun b!753430 () Bool)

(declare-fun res!508634 () Bool)

(assert (=> b!753430 (=> (not res!508634) (not e!420311))))

(assert (=> b!753430 (= res!508634 (validKeyInArray!0 k0!2102))))

(declare-fun b!753431 () Bool)

(assert (=> b!753431 (= e!420310 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20032 a!3186) j!159) a!3186 mask!3328) lt!335134))))

(declare-fun b!753432 () Bool)

(assert (=> b!753432 (= e!420309 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20032 a!3186) j!159) a!3186 mask!3328) (Found!7588 j!159)))))

(declare-fun b!753433 () Bool)

(declare-fun res!508639 () Bool)

(assert (=> b!753433 (=> (not res!508639) (not e!420312))))

(assert (=> b!753433 (= res!508639 e!420309)))

(declare-fun c!82774 () Bool)

(assert (=> b!753433 (= c!82774 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65802 res!508633) b!753413))

(assert (= (and b!753413 res!508645) b!753418))

(assert (= (and b!753418 res!508631) b!753430))

(assert (= (and b!753430 res!508634) b!753412))

(assert (= (and b!753412 res!508641) b!753419))

(assert (= (and b!753419 res!508632) b!753420))

(assert (= (and b!753420 res!508640) b!753428))

(assert (= (and b!753428 res!508636) b!753416))

(assert (= (and b!753416 res!508647) b!753426))

(assert (= (and b!753426 res!508630) b!753421))

(assert (= (and b!753421 res!508642) b!753433))

(assert (= (and b!753433 c!82774) b!753423))

(assert (= (and b!753433 (not c!82774)) b!753432))

(assert (= (and b!753433 res!508639) b!753429))

(assert (= (and b!753429 res!508648) b!753425))

(assert (= (and b!753425 res!508635) b!753431))

(assert (= (and b!753425 (not res!508637)) b!753422))

(assert (= (and b!753422 (not res!508643)) b!753415))

(assert (= (and b!753415 (not res!508646)) b!753414))

(assert (= (and b!753414 c!82775) b!753424))

(assert (= (and b!753414 (not c!82775)) b!753427))

(assert (= (and b!753414 res!508644) b!753417))

(assert (= (and b!753417 res!508638) b!753411))

(declare-fun m!702711 () Bool)

(assert (=> b!753415 m!702711))

(declare-fun m!702713 () Bool)

(assert (=> b!753415 m!702713))

(declare-fun m!702715 () Bool)

(assert (=> b!753423 m!702715))

(assert (=> b!753423 m!702715))

(declare-fun m!702717 () Bool)

(assert (=> b!753423 m!702717))

(assert (=> b!753425 m!702715))

(assert (=> b!753425 m!702715))

(declare-fun m!702719 () Bool)

(assert (=> b!753425 m!702719))

(declare-fun m!702721 () Bool)

(assert (=> b!753425 m!702721))

(declare-fun m!702723 () Bool)

(assert (=> b!753425 m!702723))

(assert (=> b!753418 m!702715))

(assert (=> b!753418 m!702715))

(declare-fun m!702725 () Bool)

(assert (=> b!753418 m!702725))

(assert (=> b!753431 m!702715))

(assert (=> b!753431 m!702715))

(declare-fun m!702727 () Bool)

(assert (=> b!753431 m!702727))

(declare-fun m!702729 () Bool)

(assert (=> b!753420 m!702729))

(declare-fun m!702731 () Bool)

(assert (=> b!753430 m!702731))

(declare-fun m!702733 () Bool)

(assert (=> b!753417 m!702733))

(declare-fun m!702735 () Bool)

(assert (=> b!753417 m!702735))

(declare-fun m!702737 () Bool)

(assert (=> b!753412 m!702737))

(declare-fun m!702739 () Bool)

(assert (=> b!753419 m!702739))

(assert (=> b!753426 m!702715))

(assert (=> b!753426 m!702715))

(declare-fun m!702741 () Bool)

(assert (=> b!753426 m!702741))

(assert (=> b!753426 m!702741))

(assert (=> b!753426 m!702715))

(declare-fun m!702743 () Bool)

(assert (=> b!753426 m!702743))

(assert (=> b!753422 m!702715))

(assert (=> b!753422 m!702715))

(declare-fun m!702745 () Bool)

(assert (=> b!753422 m!702745))

(declare-fun m!702747 () Bool)

(assert (=> start!65802 m!702747))

(declare-fun m!702749 () Bool)

(assert (=> start!65802 m!702749))

(declare-fun m!702751 () Bool)

(assert (=> b!753428 m!702751))

(assert (=> b!753432 m!702715))

(assert (=> b!753432 m!702715))

(assert (=> b!753432 m!702745))

(declare-fun m!702753 () Bool)

(assert (=> b!753421 m!702753))

(assert (=> b!753429 m!702711))

(declare-fun m!702755 () Bool)

(assert (=> b!753429 m!702755))

(declare-fun m!702757 () Bool)

(assert (=> b!753429 m!702757))

(declare-fun m!702759 () Bool)

(assert (=> b!753429 m!702759))

(assert (=> b!753429 m!702755))

(declare-fun m!702761 () Bool)

(assert (=> b!753429 m!702761))

(check-sat (not b!753422) (not b!753429) (not b!753425) (not b!753420) (not b!753417) (not b!753418) (not b!753419) (not b!753412) (not b!753430) (not b!753431) (not b!753432) (not b!753426) (not b!753428) (not b!753423) (not start!65802))
(check-sat)
