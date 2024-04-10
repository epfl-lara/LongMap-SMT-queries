; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65556 () Bool)

(assert start!65556)

(declare-fun b!748738 () Bool)

(declare-fun res!505105 () Bool)

(declare-fun e!417872 () Bool)

(assert (=> b!748738 (=> (not res!505105) (not e!417872))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748738 (= res!505105 (validKeyInArray!0 k0!2102))))

(declare-fun b!748739 () Bool)

(declare-fun res!505113 () Bool)

(declare-fun e!417869 () Bool)

(assert (=> b!748739 (=> (not res!505113) (not e!417869))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41729 0))(
  ( (array!41730 (arr!19978 (Array (_ BitVec 32) (_ BitVec 64))) (size!20399 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41729)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748739 (= res!505113 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19978 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748740 () Bool)

(declare-fun e!417873 () Bool)

(assert (=> b!748740 (= e!417869 e!417873)))

(declare-fun res!505109 () Bool)

(assert (=> b!748740 (=> (not res!505109) (not e!417873))))

(declare-datatypes ((SeekEntryResult!7578 0))(
  ( (MissingZero!7578 (index!32680 (_ BitVec 32))) (Found!7578 (index!32681 (_ BitVec 32))) (Intermediate!7578 (undefined!8390 Bool) (index!32682 (_ BitVec 32)) (x!63616 (_ BitVec 32))) (Undefined!7578) (MissingVacant!7578 (index!32683 (_ BitVec 32))) )
))
(declare-fun lt!332851 () SeekEntryResult!7578)

(declare-fun lt!332853 () SeekEntryResult!7578)

(assert (=> b!748740 (= res!505109 (= lt!332851 lt!332853))))

(declare-fun lt!332848 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!332850 () array!41729)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41729 (_ BitVec 32)) SeekEntryResult!7578)

(assert (=> b!748740 (= lt!332853 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332848 lt!332850 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748740 (= lt!332851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332848 mask!3328) lt!332848 lt!332850 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!748740 (= lt!332848 (select (store (arr!19978 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748740 (= lt!332850 (array!41730 (store (arr!19978 a!3186) i!1173 k0!2102) (size!20399 a!3186)))))

(declare-fun b!748741 () Bool)

(declare-fun res!505106 () Bool)

(declare-fun e!417874 () Bool)

(assert (=> b!748741 (=> (not res!505106) (not e!417874))))

(declare-datatypes ((List!13980 0))(
  ( (Nil!13977) (Cons!13976 (h!15048 (_ BitVec 64)) (t!20295 List!13980)) )
))
(declare-fun arrayNoDuplicates!0 (array!41729 (_ BitVec 32) List!13980) Bool)

(assert (=> b!748741 (= res!505106 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13977))))

(declare-fun b!748742 () Bool)

(declare-datatypes ((Unit!25692 0))(
  ( (Unit!25693) )
))
(declare-fun e!417871 () Unit!25692)

(declare-fun Unit!25694 () Unit!25692)

(assert (=> b!748742 (= e!417871 Unit!25694)))

(assert (=> b!748742 false))

(declare-fun b!748743 () Bool)

(declare-fun res!505120 () Bool)

(declare-fun e!417870 () Bool)

(assert (=> b!748743 (=> res!505120 e!417870)))

(assert (=> b!748743 (= res!505120 (= (select (store (arr!19978 a!3186) i!1173 k0!2102) index!1321) lt!332848))))

(declare-fun res!505117 () Bool)

(assert (=> start!65556 (=> (not res!505117) (not e!417872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65556 (= res!505117 (validMask!0 mask!3328))))

(assert (=> start!65556 e!417872))

(assert (=> start!65556 true))

(declare-fun array_inv!15774 (array!41729) Bool)

(assert (=> start!65556 (array_inv!15774 a!3186)))

(declare-fun b!748744 () Bool)

(assert (=> b!748744 (= e!417873 (not e!417870))))

(declare-fun res!505116 () Bool)

(assert (=> b!748744 (=> res!505116 e!417870)))

(get-info :version)

(assert (=> b!748744 (= res!505116 (or (not ((_ is Intermediate!7578) lt!332853)) (bvslt x!1131 (x!63616 lt!332853)) (not (= x!1131 (x!63616 lt!332853))) (not (= index!1321 (index!32682 lt!332853)))))))

(declare-fun e!417875 () Bool)

(assert (=> b!748744 e!417875))

(declare-fun res!505114 () Bool)

(assert (=> b!748744 (=> (not res!505114) (not e!417875))))

(declare-fun lt!332854 () SeekEntryResult!7578)

(declare-fun lt!332847 () SeekEntryResult!7578)

(assert (=> b!748744 (= res!505114 (= lt!332854 lt!332847))))

(assert (=> b!748744 (= lt!332847 (Found!7578 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41729 (_ BitVec 32)) SeekEntryResult!7578)

(assert (=> b!748744 (= lt!332854 (seekEntryOrOpen!0 (select (arr!19978 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41729 (_ BitVec 32)) Bool)

(assert (=> b!748744 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332846 () Unit!25692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25692)

(assert (=> b!748744 (= lt!332846 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748745 () Bool)

(declare-fun res!505110 () Bool)

(assert (=> b!748745 (=> (not res!505110) (not e!417869))))

(declare-fun e!417867 () Bool)

(assert (=> b!748745 (= res!505110 e!417867)))

(declare-fun c!82198 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748745 (= c!82198 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748746 () Bool)

(assert (=> b!748746 (= e!417874 e!417869)))

(declare-fun res!505119 () Bool)

(assert (=> b!748746 (=> (not res!505119) (not e!417869))))

(declare-fun lt!332852 () SeekEntryResult!7578)

(assert (=> b!748746 (= res!505119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19978 a!3186) j!159) mask!3328) (select (arr!19978 a!3186) j!159) a!3186 mask!3328) lt!332852))))

(assert (=> b!748746 (= lt!332852 (Intermediate!7578 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748747 () Bool)

(declare-fun res!505108 () Bool)

(assert (=> b!748747 (=> res!505108 e!417870)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41729 (_ BitVec 32)) SeekEntryResult!7578)

(assert (=> b!748747 (= res!505108 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19978 a!3186) j!159) a!3186 mask!3328) lt!332847)))))

(declare-fun b!748748 () Bool)

(assert (=> b!748748 (= e!417867 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19978 a!3186) j!159) a!3186 mask!3328) lt!332852))))

(declare-fun b!748749 () Bool)

(declare-fun res!505111 () Bool)

(assert (=> b!748749 (=> (not res!505111) (not e!417874))))

(assert (=> b!748749 (= res!505111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748750 () Bool)

(declare-fun res!505115 () Bool)

(assert (=> b!748750 (=> (not res!505115) (not e!417872))))

(assert (=> b!748750 (= res!505115 (validKeyInArray!0 (select (arr!19978 a!3186) j!159)))))

(declare-fun b!748751 () Bool)

(assert (=> b!748751 (= e!417867 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19978 a!3186) j!159) a!3186 mask!3328) (Found!7578 j!159)))))

(declare-fun b!748752 () Bool)

(declare-fun res!505112 () Bool)

(assert (=> b!748752 (=> (not res!505112) (not e!417872))))

(declare-fun arrayContainsKey!0 (array!41729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748752 (= res!505112 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748753 () Bool)

(assert (=> b!748753 (= e!417870 true)))

(assert (=> b!748753 (= (select (store (arr!19978 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332855 () Unit!25692)

(assert (=> b!748753 (= lt!332855 e!417871)))

(declare-fun c!82197 () Bool)

(assert (=> b!748753 (= c!82197 (= (select (store (arr!19978 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748754 () Bool)

(assert (=> b!748754 (= e!417875 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19978 a!3186) j!159) a!3186 mask!3328) lt!332847))))

(declare-fun b!748755 () Bool)

(assert (=> b!748755 (= e!417872 e!417874)))

(declare-fun res!505107 () Bool)

(assert (=> b!748755 (=> (not res!505107) (not e!417874))))

(declare-fun lt!332849 () SeekEntryResult!7578)

(assert (=> b!748755 (= res!505107 (or (= lt!332849 (MissingZero!7578 i!1173)) (= lt!332849 (MissingVacant!7578 i!1173))))))

(assert (=> b!748755 (= lt!332849 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748756 () Bool)

(declare-fun res!505118 () Bool)

(assert (=> b!748756 (=> (not res!505118) (not e!417872))))

(assert (=> b!748756 (= res!505118 (and (= (size!20399 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20399 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20399 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748757 () Bool)

(declare-fun Unit!25695 () Unit!25692)

(assert (=> b!748757 (= e!417871 Unit!25695)))

(declare-fun b!748758 () Bool)

(declare-fun res!505121 () Bool)

(assert (=> b!748758 (=> (not res!505121) (not e!417874))))

(assert (=> b!748758 (= res!505121 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20399 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20399 a!3186))))))

(assert (= (and start!65556 res!505117) b!748756))

(assert (= (and b!748756 res!505118) b!748750))

(assert (= (and b!748750 res!505115) b!748738))

(assert (= (and b!748738 res!505105) b!748752))

(assert (= (and b!748752 res!505112) b!748755))

(assert (= (and b!748755 res!505107) b!748749))

(assert (= (and b!748749 res!505111) b!748741))

(assert (= (and b!748741 res!505106) b!748758))

(assert (= (and b!748758 res!505121) b!748746))

(assert (= (and b!748746 res!505119) b!748739))

(assert (= (and b!748739 res!505113) b!748745))

(assert (= (and b!748745 c!82198) b!748748))

(assert (= (and b!748745 (not c!82198)) b!748751))

(assert (= (and b!748745 res!505110) b!748740))

(assert (= (and b!748740 res!505109) b!748744))

(assert (= (and b!748744 res!505114) b!748754))

(assert (= (and b!748744 (not res!505116)) b!748747))

(assert (= (and b!748747 (not res!505108)) b!748743))

(assert (= (and b!748743 (not res!505120)) b!748753))

(assert (= (and b!748753 c!82197) b!748742))

(assert (= (and b!748753 (not c!82197)) b!748757))

(declare-fun m!698509 () Bool)

(assert (=> b!748741 m!698509))

(declare-fun m!698511 () Bool)

(assert (=> b!748740 m!698511))

(declare-fun m!698513 () Bool)

(assert (=> b!748740 m!698513))

(declare-fun m!698515 () Bool)

(assert (=> b!748740 m!698515))

(assert (=> b!748740 m!698515))

(declare-fun m!698517 () Bool)

(assert (=> b!748740 m!698517))

(declare-fun m!698519 () Bool)

(assert (=> b!748740 m!698519))

(declare-fun m!698521 () Bool)

(assert (=> start!65556 m!698521))

(declare-fun m!698523 () Bool)

(assert (=> start!65556 m!698523))

(declare-fun m!698525 () Bool)

(assert (=> b!748751 m!698525))

(assert (=> b!748751 m!698525))

(declare-fun m!698527 () Bool)

(assert (=> b!748751 m!698527))

(assert (=> b!748747 m!698525))

(assert (=> b!748747 m!698525))

(assert (=> b!748747 m!698527))

(declare-fun m!698529 () Bool)

(assert (=> b!748755 m!698529))

(assert (=> b!748750 m!698525))

(assert (=> b!748750 m!698525))

(declare-fun m!698531 () Bool)

(assert (=> b!748750 m!698531))

(assert (=> b!748744 m!698525))

(assert (=> b!748744 m!698525))

(declare-fun m!698533 () Bool)

(assert (=> b!748744 m!698533))

(declare-fun m!698535 () Bool)

(assert (=> b!748744 m!698535))

(declare-fun m!698537 () Bool)

(assert (=> b!748744 m!698537))

(declare-fun m!698539 () Bool)

(assert (=> b!748752 m!698539))

(assert (=> b!748748 m!698525))

(assert (=> b!748748 m!698525))

(declare-fun m!698541 () Bool)

(assert (=> b!748748 m!698541))

(declare-fun m!698543 () Bool)

(assert (=> b!748738 m!698543))

(declare-fun m!698545 () Bool)

(assert (=> b!748739 m!698545))

(assert (=> b!748746 m!698525))

(assert (=> b!748746 m!698525))

(declare-fun m!698547 () Bool)

(assert (=> b!748746 m!698547))

(assert (=> b!748746 m!698547))

(assert (=> b!748746 m!698525))

(declare-fun m!698549 () Bool)

(assert (=> b!748746 m!698549))

(assert (=> b!748754 m!698525))

(assert (=> b!748754 m!698525))

(declare-fun m!698551 () Bool)

(assert (=> b!748754 m!698551))

(assert (=> b!748743 m!698511))

(declare-fun m!698553 () Bool)

(assert (=> b!748743 m!698553))

(assert (=> b!748753 m!698511))

(assert (=> b!748753 m!698553))

(declare-fun m!698555 () Bool)

(assert (=> b!748749 m!698555))

(check-sat (not start!65556) (not b!748750) (not b!748741) (not b!748755) (not b!748747) (not b!748746) (not b!748754) (not b!748748) (not b!748738) (not b!748744) (not b!748740) (not b!748751) (not b!748752) (not b!748749))
(check-sat)
