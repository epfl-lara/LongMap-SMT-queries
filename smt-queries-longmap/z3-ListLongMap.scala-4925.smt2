; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67912 () Bool)

(assert start!67912)

(declare-fun b!788750 () Bool)

(declare-fun res!534136 () Bool)

(declare-fun e!438470 () Bool)

(assert (=> b!788750 (=> (not res!534136) (not e!438470))))

(declare-datatypes ((array!42832 0))(
  ( (array!42833 (arr!20500 (Array (_ BitVec 32) (_ BitVec 64))) (size!20920 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42832)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42832 (_ BitVec 32)) Bool)

(assert (=> b!788750 (= res!534136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788751 () Bool)

(declare-datatypes ((Unit!27289 0))(
  ( (Unit!27290) )
))
(declare-fun e!438462 () Unit!27289)

(declare-fun Unit!27291 () Unit!27289)

(assert (=> b!788751 (= e!438462 Unit!27291)))

(declare-fun res!534137 () Bool)

(declare-fun e!438471 () Bool)

(assert (=> start!67912 (=> (not res!534137) (not e!438471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67912 (= res!534137 (validMask!0 mask!3328))))

(assert (=> start!67912 e!438471))

(assert (=> start!67912 true))

(declare-fun array_inv!16359 (array!42832) Bool)

(assert (=> start!67912 (array_inv!16359 a!3186)))

(declare-fun b!788752 () Bool)

(declare-fun e!438468 () Bool)

(assert (=> b!788752 (= e!438470 e!438468)))

(declare-fun res!534146 () Bool)

(assert (=> b!788752 (=> (not res!534146) (not e!438468))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8056 0))(
  ( (MissingZero!8056 (index!34592 (_ BitVec 32))) (Found!8056 (index!34593 (_ BitVec 32))) (Intermediate!8056 (undefined!8868 Bool) (index!34594 (_ BitVec 32)) (x!65687 (_ BitVec 32))) (Undefined!8056) (MissingVacant!8056 (index!34595 (_ BitVec 32))) )
))
(declare-fun lt!351879 () SeekEntryResult!8056)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42832 (_ BitVec 32)) SeekEntryResult!8056)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788752 (= res!534146 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20500 a!3186) j!159) mask!3328) (select (arr!20500 a!3186) j!159) a!3186 mask!3328) lt!351879))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788752 (= lt!351879 (Intermediate!8056 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788753 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!438466 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!788753 (= e!438466 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20500 a!3186) j!159) a!3186 mask!3328) lt!351879))))

(declare-fun b!788754 () Bool)

(declare-fun e!438465 () Bool)

(declare-fun lt!351874 () SeekEntryResult!8056)

(declare-fun lt!351869 () SeekEntryResult!8056)

(assert (=> b!788754 (= e!438465 (= lt!351874 lt!351869))))

(declare-fun b!788755 () Bool)

(declare-fun res!534153 () Bool)

(assert (=> b!788755 (=> (not res!534153) (not e!438465))))

(declare-fun lt!351872 () (_ BitVec 64))

(declare-fun lt!351875 () array!42832)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42832 (_ BitVec 32)) SeekEntryResult!8056)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42832 (_ BitVec 32)) SeekEntryResult!8056)

(assert (=> b!788755 (= res!534153 (= (seekEntryOrOpen!0 lt!351872 lt!351875 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351872 lt!351875 mask!3328)))))

(declare-fun b!788756 () Bool)

(declare-fun res!534140 () Bool)

(assert (=> b!788756 (=> (not res!534140) (not e!438471))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788756 (= res!534140 (and (= (size!20920 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20920 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20920 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788757 () Bool)

(declare-fun res!534144 () Bool)

(assert (=> b!788757 (=> (not res!534144) (not e!438470))))

(assert (=> b!788757 (= res!534144 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20920 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20920 a!3186))))))

(declare-fun b!788758 () Bool)

(declare-fun Unit!27292 () Unit!27289)

(assert (=> b!788758 (= e!438462 Unit!27292)))

(assert (=> b!788758 false))

(declare-fun b!788759 () Bool)

(declare-fun res!534152 () Bool)

(assert (=> b!788759 (=> (not res!534152) (not e!438470))))

(declare-datatypes ((List!14409 0))(
  ( (Nil!14406) (Cons!14405 (h!15534 (_ BitVec 64)) (t!20716 List!14409)) )
))
(declare-fun arrayNoDuplicates!0 (array!42832 (_ BitVec 32) List!14409) Bool)

(assert (=> b!788759 (= res!534152 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14406))))

(declare-fun b!788760 () Bool)

(declare-fun e!438461 () Bool)

(declare-fun e!438469 () Bool)

(assert (=> b!788760 (= e!438461 (not e!438469))))

(declare-fun res!534135 () Bool)

(assert (=> b!788760 (=> res!534135 e!438469)))

(declare-fun lt!351877 () SeekEntryResult!8056)

(get-info :version)

(assert (=> b!788760 (= res!534135 (or (not ((_ is Intermediate!8056) lt!351877)) (bvslt x!1131 (x!65687 lt!351877)) (not (= x!1131 (x!65687 lt!351877))) (not (= index!1321 (index!34594 lt!351877)))))))

(declare-fun e!438467 () Bool)

(assert (=> b!788760 e!438467))

(declare-fun res!534138 () Bool)

(assert (=> b!788760 (=> (not res!534138) (not e!438467))))

(declare-fun lt!351878 () SeekEntryResult!8056)

(assert (=> b!788760 (= res!534138 (= lt!351874 lt!351878))))

(assert (=> b!788760 (= lt!351878 (Found!8056 j!159))))

(assert (=> b!788760 (= lt!351874 (seekEntryOrOpen!0 (select (arr!20500 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788760 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351870 () Unit!27289)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27289)

(assert (=> b!788760 (= lt!351870 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788761 () Bool)

(declare-fun res!534145 () Bool)

(assert (=> b!788761 (=> (not res!534145) (not e!438471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788761 (= res!534145 (validKeyInArray!0 (select (arr!20500 a!3186) j!159)))))

(declare-fun b!788762 () Bool)

(assert (=> b!788762 (= e!438466 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20500 a!3186) j!159) a!3186 mask!3328) (Found!8056 j!159)))))

(declare-fun b!788763 () Bool)

(assert (=> b!788763 (= e!438471 e!438470)))

(declare-fun res!534149 () Bool)

(assert (=> b!788763 (=> (not res!534149) (not e!438470))))

(declare-fun lt!351876 () SeekEntryResult!8056)

(assert (=> b!788763 (= res!534149 (or (= lt!351876 (MissingZero!8056 i!1173)) (= lt!351876 (MissingVacant!8056 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!788763 (= lt!351876 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!788764 () Bool)

(declare-fun e!438472 () Bool)

(assert (=> b!788764 (= e!438472 (= (select (arr!20500 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788764 e!438465))

(declare-fun res!534143 () Bool)

(assert (=> b!788764 (=> (not res!534143) (not e!438465))))

(declare-fun lt!351871 () (_ BitVec 64))

(assert (=> b!788764 (= res!534143 (= lt!351871 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351880 () Unit!27289)

(assert (=> b!788764 (= lt!351880 e!438462)))

(declare-fun c!87719 () Bool)

(assert (=> b!788764 (= c!87719 (= lt!351871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788765 () Bool)

(declare-fun res!534147 () Bool)

(assert (=> b!788765 (=> (not res!534147) (not e!438471))))

(assert (=> b!788765 (= res!534147 (validKeyInArray!0 k0!2102))))

(declare-fun b!788766 () Bool)

(declare-fun res!534148 () Bool)

(assert (=> b!788766 (=> (not res!534148) (not e!438468))))

(assert (=> b!788766 (= res!534148 e!438466)))

(declare-fun c!87718 () Bool)

(assert (=> b!788766 (= c!87718 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788767 () Bool)

(declare-fun res!534139 () Bool)

(assert (=> b!788767 (=> (not res!534139) (not e!438471))))

(declare-fun arrayContainsKey!0 (array!42832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788767 (= res!534139 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788768 () Bool)

(declare-fun e!438464 () Bool)

(assert (=> b!788768 (= e!438464 e!438472)))

(declare-fun res!534151 () Bool)

(assert (=> b!788768 (=> res!534151 e!438472)))

(assert (=> b!788768 (= res!534151 (= lt!351871 lt!351872))))

(assert (=> b!788768 (= lt!351871 (select (store (arr!20500 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!788769 () Bool)

(assert (=> b!788769 (= e!438467 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20500 a!3186) j!159) a!3186 mask!3328) lt!351878))))

(declare-fun b!788770 () Bool)

(declare-fun res!534150 () Bool)

(assert (=> b!788770 (=> (not res!534150) (not e!438468))))

(assert (=> b!788770 (= res!534150 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20500 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788771 () Bool)

(assert (=> b!788771 (= e!438469 e!438464)))

(declare-fun res!534141 () Bool)

(assert (=> b!788771 (=> res!534141 e!438464)))

(assert (=> b!788771 (= res!534141 (not (= lt!351869 lt!351878)))))

(assert (=> b!788771 (= lt!351869 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20500 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788772 () Bool)

(assert (=> b!788772 (= e!438468 e!438461)))

(declare-fun res!534142 () Bool)

(assert (=> b!788772 (=> (not res!534142) (not e!438461))))

(declare-fun lt!351873 () SeekEntryResult!8056)

(assert (=> b!788772 (= res!534142 (= lt!351873 lt!351877))))

(assert (=> b!788772 (= lt!351877 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351872 lt!351875 mask!3328))))

(assert (=> b!788772 (= lt!351873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351872 mask!3328) lt!351872 lt!351875 mask!3328))))

(assert (=> b!788772 (= lt!351872 (select (store (arr!20500 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!788772 (= lt!351875 (array!42833 (store (arr!20500 a!3186) i!1173 k0!2102) (size!20920 a!3186)))))

(assert (= (and start!67912 res!534137) b!788756))

(assert (= (and b!788756 res!534140) b!788761))

(assert (= (and b!788761 res!534145) b!788765))

(assert (= (and b!788765 res!534147) b!788767))

(assert (= (and b!788767 res!534139) b!788763))

(assert (= (and b!788763 res!534149) b!788750))

(assert (= (and b!788750 res!534136) b!788759))

(assert (= (and b!788759 res!534152) b!788757))

(assert (= (and b!788757 res!534144) b!788752))

(assert (= (and b!788752 res!534146) b!788770))

(assert (= (and b!788770 res!534150) b!788766))

(assert (= (and b!788766 c!87718) b!788753))

(assert (= (and b!788766 (not c!87718)) b!788762))

(assert (= (and b!788766 res!534148) b!788772))

(assert (= (and b!788772 res!534142) b!788760))

(assert (= (and b!788760 res!534138) b!788769))

(assert (= (and b!788760 (not res!534135)) b!788771))

(assert (= (and b!788771 (not res!534141)) b!788768))

(assert (= (and b!788768 (not res!534151)) b!788764))

(assert (= (and b!788764 c!87719) b!788758))

(assert (= (and b!788764 (not c!87719)) b!788751))

(assert (= (and b!788764 res!534143) b!788755))

(assert (= (and b!788755 res!534153) b!788754))

(declare-fun m!730583 () Bool)

(assert (=> b!788762 m!730583))

(assert (=> b!788762 m!730583))

(declare-fun m!730585 () Bool)

(assert (=> b!788762 m!730585))

(declare-fun m!730587 () Bool)

(assert (=> b!788772 m!730587))

(declare-fun m!730589 () Bool)

(assert (=> b!788772 m!730589))

(declare-fun m!730591 () Bool)

(assert (=> b!788772 m!730591))

(declare-fun m!730593 () Bool)

(assert (=> b!788772 m!730593))

(declare-fun m!730595 () Bool)

(assert (=> b!788772 m!730595))

(assert (=> b!788772 m!730587))

(declare-fun m!730597 () Bool)

(assert (=> b!788767 m!730597))

(declare-fun m!730599 () Bool)

(assert (=> b!788755 m!730599))

(declare-fun m!730601 () Bool)

(assert (=> b!788755 m!730601))

(assert (=> b!788760 m!730583))

(assert (=> b!788760 m!730583))

(declare-fun m!730603 () Bool)

(assert (=> b!788760 m!730603))

(declare-fun m!730605 () Bool)

(assert (=> b!788760 m!730605))

(declare-fun m!730607 () Bool)

(assert (=> b!788760 m!730607))

(assert (=> b!788771 m!730583))

(assert (=> b!788771 m!730583))

(assert (=> b!788771 m!730585))

(declare-fun m!730609 () Bool)

(assert (=> b!788765 m!730609))

(assert (=> b!788769 m!730583))

(assert (=> b!788769 m!730583))

(declare-fun m!730611 () Bool)

(assert (=> b!788769 m!730611))

(declare-fun m!730613 () Bool)

(assert (=> b!788764 m!730613))

(assert (=> b!788753 m!730583))

(assert (=> b!788753 m!730583))

(declare-fun m!730615 () Bool)

(assert (=> b!788753 m!730615))

(declare-fun m!730617 () Bool)

(assert (=> b!788770 m!730617))

(declare-fun m!730619 () Bool)

(assert (=> b!788763 m!730619))

(declare-fun m!730621 () Bool)

(assert (=> b!788750 m!730621))

(declare-fun m!730623 () Bool)

(assert (=> b!788759 m!730623))

(assert (=> b!788752 m!730583))

(assert (=> b!788752 m!730583))

(declare-fun m!730625 () Bool)

(assert (=> b!788752 m!730625))

(assert (=> b!788752 m!730625))

(assert (=> b!788752 m!730583))

(declare-fun m!730627 () Bool)

(assert (=> b!788752 m!730627))

(assert (=> b!788761 m!730583))

(assert (=> b!788761 m!730583))

(declare-fun m!730629 () Bool)

(assert (=> b!788761 m!730629))

(declare-fun m!730631 () Bool)

(assert (=> start!67912 m!730631))

(declare-fun m!730633 () Bool)

(assert (=> start!67912 m!730633))

(assert (=> b!788768 m!730591))

(declare-fun m!730635 () Bool)

(assert (=> b!788768 m!730635))

(check-sat (not start!67912) (not b!788771) (not b!788761) (not b!788750) (not b!788753) (not b!788752) (not b!788767) (not b!788755) (not b!788762) (not b!788760) (not b!788772) (not b!788759) (not b!788763) (not b!788765) (not b!788769))
(check-sat)
