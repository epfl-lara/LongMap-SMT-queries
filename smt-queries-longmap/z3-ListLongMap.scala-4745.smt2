; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65658 () Bool)

(assert start!65658)

(declare-fun b!748664 () Bool)

(declare-datatypes ((Unit!25621 0))(
  ( (Unit!25622) )
))
(declare-fun e!417996 () Unit!25621)

(declare-fun Unit!25623 () Unit!25621)

(assert (=> b!748664 (= e!417996 Unit!25623)))

(declare-fun b!748665 () Bool)

(declare-fun res!504755 () Bool)

(declare-fun e!417994 () Bool)

(assert (=> b!748665 (=> (not res!504755) (not e!417994))))

(declare-datatypes ((array!41701 0))(
  ( (array!41702 (arr!19960 (Array (_ BitVec 32) (_ BitVec 64))) (size!20380 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41701)

(declare-datatypes ((List!13869 0))(
  ( (Nil!13866) (Cons!13865 (h!14943 (_ BitVec 64)) (t!20176 List!13869)) )
))
(declare-fun arrayNoDuplicates!0 (array!41701 (_ BitVec 32) List!13869) Bool)

(assert (=> b!748665 (= res!504755 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13866))))

(declare-fun b!748666 () Bool)

(declare-fun e!417997 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!748666 (= e!417997 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!748666 (= (select (store (arr!19960 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332771 () Unit!25621)

(assert (=> b!748666 (= lt!332771 e!417996)))

(declare-fun c!82343 () Bool)

(assert (=> b!748666 (= c!82343 (= (select (store (arr!19960 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748667 () Bool)

(declare-fun res!504749 () Bool)

(assert (=> b!748667 (=> (not res!504749) (not e!417994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41701 (_ BitVec 32)) Bool)

(assert (=> b!748667 (= res!504749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748668 () Bool)

(declare-fun e!417999 () Bool)

(assert (=> b!748668 (= e!417999 e!417994)))

(declare-fun res!504758 () Bool)

(assert (=> b!748668 (=> (not res!504758) (not e!417994))))

(declare-datatypes ((SeekEntryResult!7516 0))(
  ( (MissingZero!7516 (index!32432 (_ BitVec 32))) (Found!7516 (index!32433 (_ BitVec 32))) (Intermediate!7516 (undefined!8328 Bool) (index!32434 (_ BitVec 32)) (x!63534 (_ BitVec 32))) (Undefined!7516) (MissingVacant!7516 (index!32435 (_ BitVec 32))) )
))
(declare-fun lt!332773 () SeekEntryResult!7516)

(assert (=> b!748668 (= res!504758 (or (= lt!332773 (MissingZero!7516 i!1173)) (= lt!332773 (MissingVacant!7516 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41701 (_ BitVec 32)) SeekEntryResult!7516)

(assert (=> b!748668 (= lt!332773 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748669 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!332772 () SeekEntryResult!7516)

(declare-fun e!418002 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41701 (_ BitVec 32)) SeekEntryResult!7516)

(assert (=> b!748669 (= e!418002 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19960 a!3186) j!159) a!3186 mask!3328) lt!332772))))

(declare-fun b!748670 () Bool)

(declare-fun res!504760 () Bool)

(assert (=> b!748670 (=> (not res!504760) (not e!417994))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!748670 (= res!504760 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20380 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20380 a!3186))))))

(declare-fun b!748671 () Bool)

(declare-fun e!417998 () Bool)

(assert (=> b!748671 (= e!417994 e!417998)))

(declare-fun res!504759 () Bool)

(assert (=> b!748671 (=> (not res!504759) (not e!417998))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748671 (= res!504759 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19960 a!3186) j!159) mask!3328) (select (arr!19960 a!3186) j!159) a!3186 mask!3328) lt!332772))))

(assert (=> b!748671 (= lt!332772 (Intermediate!7516 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748672 () Bool)

(declare-fun e!418000 () Bool)

(assert (=> b!748672 (= e!417998 e!418000)))

(declare-fun res!504762 () Bool)

(assert (=> b!748672 (=> (not res!504762) (not e!418000))))

(declare-fun lt!332774 () SeekEntryResult!7516)

(declare-fun lt!332776 () SeekEntryResult!7516)

(assert (=> b!748672 (= res!504762 (= lt!332774 lt!332776))))

(declare-fun lt!332770 () (_ BitVec 64))

(declare-fun lt!332775 () array!41701)

(assert (=> b!748672 (= lt!332776 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332770 lt!332775 mask!3328))))

(assert (=> b!748672 (= lt!332774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332770 mask!3328) lt!332770 lt!332775 mask!3328))))

(assert (=> b!748672 (= lt!332770 (select (store (arr!19960 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748672 (= lt!332775 (array!41702 (store (arr!19960 a!3186) i!1173 k0!2102) (size!20380 a!3186)))))

(declare-fun b!748674 () Bool)

(declare-fun res!504748 () Bool)

(assert (=> b!748674 (=> (not res!504748) (not e!417998))))

(assert (=> b!748674 (= res!504748 e!418002)))

(declare-fun c!82342 () Bool)

(assert (=> b!748674 (= c!82342 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748675 () Bool)

(declare-fun Unit!25624 () Unit!25621)

(assert (=> b!748675 (= e!417996 Unit!25624)))

(assert (=> b!748675 false))

(declare-fun b!748676 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41701 (_ BitVec 32)) SeekEntryResult!7516)

(assert (=> b!748676 (= e!418002 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19960 a!3186) j!159) a!3186 mask!3328) (Found!7516 j!159)))))

(declare-fun b!748677 () Bool)

(declare-fun res!504752 () Bool)

(assert (=> b!748677 (=> res!504752 e!417997)))

(declare-fun lt!332769 () SeekEntryResult!7516)

(assert (=> b!748677 (= res!504752 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19960 a!3186) j!159) a!3186 mask!3328) lt!332769)))))

(declare-fun b!748678 () Bool)

(declare-fun res!504753 () Bool)

(assert (=> b!748678 (=> (not res!504753) (not e!417998))))

(assert (=> b!748678 (= res!504753 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19960 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748679 () Bool)

(declare-fun res!504747 () Bool)

(assert (=> b!748679 (=> (not res!504747) (not e!417999))))

(assert (=> b!748679 (= res!504747 (and (= (size!20380 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20380 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20380 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748680 () Bool)

(declare-fun res!504761 () Bool)

(assert (=> b!748680 (=> (not res!504761) (not e!417999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748680 (= res!504761 (validKeyInArray!0 k0!2102))))

(declare-fun b!748681 () Bool)

(declare-fun res!504754 () Bool)

(assert (=> b!748681 (=> res!504754 e!417997)))

(assert (=> b!748681 (= res!504754 (= (select (store (arr!19960 a!3186) i!1173 k0!2102) index!1321) lt!332770))))

(declare-fun b!748673 () Bool)

(declare-fun res!504751 () Bool)

(assert (=> b!748673 (=> (not res!504751) (not e!417999))))

(declare-fun arrayContainsKey!0 (array!41701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748673 (= res!504751 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!504756 () Bool)

(assert (=> start!65658 (=> (not res!504756) (not e!417999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65658 (= res!504756 (validMask!0 mask!3328))))

(assert (=> start!65658 e!417999))

(assert (=> start!65658 true))

(declare-fun array_inv!15819 (array!41701) Bool)

(assert (=> start!65658 (array_inv!15819 a!3186)))

(declare-fun e!417995 () Bool)

(declare-fun b!748682 () Bool)

(assert (=> b!748682 (= e!417995 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19960 a!3186) j!159) a!3186 mask!3328) lt!332769))))

(declare-fun b!748683 () Bool)

(declare-fun res!504763 () Bool)

(assert (=> b!748683 (=> (not res!504763) (not e!417999))))

(assert (=> b!748683 (= res!504763 (validKeyInArray!0 (select (arr!19960 a!3186) j!159)))))

(declare-fun b!748684 () Bool)

(assert (=> b!748684 (= e!418000 (not e!417997))))

(declare-fun res!504750 () Bool)

(assert (=> b!748684 (=> res!504750 e!417997)))

(get-info :version)

(assert (=> b!748684 (= res!504750 (or (not ((_ is Intermediate!7516) lt!332776)) (bvslt x!1131 (x!63534 lt!332776)) (not (= x!1131 (x!63534 lt!332776))) (not (= index!1321 (index!32434 lt!332776)))))))

(assert (=> b!748684 e!417995))

(declare-fun res!504757 () Bool)

(assert (=> b!748684 (=> (not res!504757) (not e!417995))))

(declare-fun lt!332778 () SeekEntryResult!7516)

(assert (=> b!748684 (= res!504757 (= lt!332778 lt!332769))))

(assert (=> b!748684 (= lt!332769 (Found!7516 j!159))))

(assert (=> b!748684 (= lt!332778 (seekEntryOrOpen!0 (select (arr!19960 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748684 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332777 () Unit!25621)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25621)

(assert (=> b!748684 (= lt!332777 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65658 res!504756) b!748679))

(assert (= (and b!748679 res!504747) b!748683))

(assert (= (and b!748683 res!504763) b!748680))

(assert (= (and b!748680 res!504761) b!748673))

(assert (= (and b!748673 res!504751) b!748668))

(assert (= (and b!748668 res!504758) b!748667))

(assert (= (and b!748667 res!504749) b!748665))

(assert (= (and b!748665 res!504755) b!748670))

(assert (= (and b!748670 res!504760) b!748671))

(assert (= (and b!748671 res!504759) b!748678))

(assert (= (and b!748678 res!504753) b!748674))

(assert (= (and b!748674 c!82342) b!748669))

(assert (= (and b!748674 (not c!82342)) b!748676))

(assert (= (and b!748674 res!504748) b!748672))

(assert (= (and b!748672 res!504762) b!748684))

(assert (= (and b!748684 res!504757) b!748682))

(assert (= (and b!748684 (not res!504750)) b!748677))

(assert (= (and b!748677 (not res!504752)) b!748681))

(assert (= (and b!748681 (not res!504754)) b!748666))

(assert (= (and b!748666 c!82343) b!748675))

(assert (= (and b!748666 (not c!82343)) b!748664))

(declare-fun m!699045 () Bool)

(assert (=> b!748676 m!699045))

(assert (=> b!748676 m!699045))

(declare-fun m!699047 () Bool)

(assert (=> b!748676 m!699047))

(declare-fun m!699049 () Bool)

(assert (=> b!748667 m!699049))

(declare-fun m!699051 () Bool)

(assert (=> b!748665 m!699051))

(declare-fun m!699053 () Bool)

(assert (=> b!748672 m!699053))

(declare-fun m!699055 () Bool)

(assert (=> b!748672 m!699055))

(declare-fun m!699057 () Bool)

(assert (=> b!748672 m!699057))

(assert (=> b!748672 m!699053))

(declare-fun m!699059 () Bool)

(assert (=> b!748672 m!699059))

(declare-fun m!699061 () Bool)

(assert (=> b!748672 m!699061))

(assert (=> b!748677 m!699045))

(assert (=> b!748677 m!699045))

(assert (=> b!748677 m!699047))

(assert (=> b!748684 m!699045))

(assert (=> b!748684 m!699045))

(declare-fun m!699063 () Bool)

(assert (=> b!748684 m!699063))

(declare-fun m!699065 () Bool)

(assert (=> b!748684 m!699065))

(declare-fun m!699067 () Bool)

(assert (=> b!748684 m!699067))

(declare-fun m!699069 () Bool)

(assert (=> b!748680 m!699069))

(declare-fun m!699071 () Bool)

(assert (=> start!65658 m!699071))

(declare-fun m!699073 () Bool)

(assert (=> start!65658 m!699073))

(assert (=> b!748681 m!699055))

(declare-fun m!699075 () Bool)

(assert (=> b!748681 m!699075))

(assert (=> b!748671 m!699045))

(assert (=> b!748671 m!699045))

(declare-fun m!699077 () Bool)

(assert (=> b!748671 m!699077))

(assert (=> b!748671 m!699077))

(assert (=> b!748671 m!699045))

(declare-fun m!699079 () Bool)

(assert (=> b!748671 m!699079))

(assert (=> b!748669 m!699045))

(assert (=> b!748669 m!699045))

(declare-fun m!699081 () Bool)

(assert (=> b!748669 m!699081))

(assert (=> b!748682 m!699045))

(assert (=> b!748682 m!699045))

(declare-fun m!699083 () Bool)

(assert (=> b!748682 m!699083))

(assert (=> b!748666 m!699055))

(assert (=> b!748666 m!699075))

(declare-fun m!699085 () Bool)

(assert (=> b!748678 m!699085))

(assert (=> b!748683 m!699045))

(assert (=> b!748683 m!699045))

(declare-fun m!699087 () Bool)

(assert (=> b!748683 m!699087))

(declare-fun m!699089 () Bool)

(assert (=> b!748668 m!699089))

(declare-fun m!699091 () Bool)

(assert (=> b!748673 m!699091))

(check-sat (not start!65658) (not b!748676) (not b!748668) (not b!748683) (not b!748684) (not b!748671) (not b!748677) (not b!748682) (not b!748667) (not b!748669) (not b!748672) (not b!748680) (not b!748665) (not b!748673))
(check-sat)
