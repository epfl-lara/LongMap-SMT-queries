; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65408 () Bool)

(assert start!65408)

(declare-fun b!744756 () Bool)

(declare-fun res!501831 () Bool)

(declare-fun e!415977 () Bool)

(assert (=> b!744756 (=> (not res!501831) (not e!415977))))

(declare-datatypes ((array!41598 0))(
  ( (array!41599 (arr!19913 (Array (_ BitVec 32) (_ BitVec 64))) (size!20334 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41598)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!744756 (= res!501831 (and (= (size!20334 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20334 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20334 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!415983 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!744757 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7510 0))(
  ( (MissingZero!7510 (index!32408 (_ BitVec 32))) (Found!7510 (index!32409 (_ BitVec 32))) (Intermediate!7510 (undefined!8322 Bool) (index!32410 (_ BitVec 32)) (x!63375 (_ BitVec 32))) (Undefined!7510) (MissingVacant!7510 (index!32411 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41598 (_ BitVec 32)) SeekEntryResult!7510)

(assert (=> b!744757 (= e!415983 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19913 a!3186) j!159) a!3186 mask!3328) (Found!7510 j!159)))))

(declare-fun b!744758 () Bool)

(declare-fun res!501828 () Bool)

(declare-fun e!415984 () Bool)

(assert (=> b!744758 (=> (not res!501828) (not e!415984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41598 (_ BitVec 32)) Bool)

(assert (=> b!744758 (= res!501828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744759 () Bool)

(declare-fun res!501826 () Bool)

(assert (=> b!744759 (=> (not res!501826) (not e!415977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744759 (= res!501826 (validKeyInArray!0 (select (arr!19913 a!3186) j!159)))))

(declare-fun b!744760 () Bool)

(declare-fun e!415981 () Bool)

(declare-fun e!415976 () Bool)

(assert (=> b!744760 (= e!415981 e!415976)))

(declare-fun res!501832 () Bool)

(assert (=> b!744760 (=> (not res!501832) (not e!415976))))

(declare-fun lt!330733 () SeekEntryResult!7510)

(declare-fun lt!330732 () SeekEntryResult!7510)

(assert (=> b!744760 (= res!501832 (= lt!330733 lt!330732))))

(declare-fun lt!330731 () (_ BitVec 64))

(declare-fun lt!330736 () array!41598)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41598 (_ BitVec 32)) SeekEntryResult!7510)

(assert (=> b!744760 (= lt!330732 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330731 lt!330736 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744760 (= lt!330733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330731 mask!3328) lt!330731 lt!330736 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!744760 (= lt!330731 (select (store (arr!19913 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744760 (= lt!330736 (array!41599 (store (arr!19913 a!3186) i!1173 k0!2102) (size!20334 a!3186)))))

(declare-fun res!501822 () Bool)

(assert (=> start!65408 (=> (not res!501822) (not e!415977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65408 (= res!501822 (validMask!0 mask!3328))))

(assert (=> start!65408 e!415977))

(assert (=> start!65408 true))

(declare-fun array_inv!15796 (array!41598) Bool)

(assert (=> start!65408 (array_inv!15796 a!3186)))

(declare-fun b!744761 () Bool)

(declare-fun res!501819 () Bool)

(assert (=> b!744761 (=> (not res!501819) (not e!415977))))

(declare-fun arrayContainsKey!0 (array!41598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744761 (= res!501819 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!330735 () SeekEntryResult!7510)

(declare-fun b!744762 () Bool)

(assert (=> b!744762 (= e!415983 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19913 a!3186) j!159) a!3186 mask!3328) lt!330735))))

(declare-fun b!744763 () Bool)

(declare-fun res!501820 () Bool)

(assert (=> b!744763 (=> (not res!501820) (not e!415984))))

(declare-datatypes ((List!13954 0))(
  ( (Nil!13951) (Cons!13950 (h!15022 (_ BitVec 64)) (t!20260 List!13954)) )
))
(declare-fun arrayNoDuplicates!0 (array!41598 (_ BitVec 32) List!13954) Bool)

(assert (=> b!744763 (= res!501820 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13951))))

(declare-fun b!744764 () Bool)

(declare-fun e!415980 () Bool)

(declare-fun e!415982 () Bool)

(assert (=> b!744764 (= e!415980 e!415982)))

(declare-fun res!501834 () Bool)

(assert (=> b!744764 (=> (not res!501834) (not e!415982))))

(declare-fun lt!330734 () SeekEntryResult!7510)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41598 (_ BitVec 32)) SeekEntryResult!7510)

(assert (=> b!744764 (= res!501834 (= (seekEntryOrOpen!0 (select (arr!19913 a!3186) j!159) a!3186 mask!3328) lt!330734))))

(assert (=> b!744764 (= lt!330734 (Found!7510 j!159))))

(declare-fun b!744765 () Bool)

(declare-fun res!501829 () Bool)

(assert (=> b!744765 (=> (not res!501829) (not e!415977))))

(assert (=> b!744765 (= res!501829 (validKeyInArray!0 k0!2102))))

(declare-fun b!744766 () Bool)

(declare-fun res!501824 () Bool)

(assert (=> b!744766 (=> (not res!501824) (not e!415981))))

(assert (=> b!744766 (= res!501824 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19913 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744767 () Bool)

(assert (=> b!744767 (= e!415984 e!415981)))

(declare-fun res!501833 () Bool)

(assert (=> b!744767 (=> (not res!501833) (not e!415981))))

(assert (=> b!744767 (= res!501833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19913 a!3186) j!159) mask!3328) (select (arr!19913 a!3186) j!159) a!3186 mask!3328) lt!330735))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744767 (= lt!330735 (Intermediate!7510 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744768 () Bool)

(declare-fun res!501823 () Bool)

(assert (=> b!744768 (=> (not res!501823) (not e!415984))))

(assert (=> b!744768 (= res!501823 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20334 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20334 a!3186))))))

(declare-fun b!744769 () Bool)

(assert (=> b!744769 (= e!415977 e!415984)))

(declare-fun res!501825 () Bool)

(assert (=> b!744769 (=> (not res!501825) (not e!415984))))

(declare-fun lt!330729 () SeekEntryResult!7510)

(assert (=> b!744769 (= res!501825 (or (= lt!330729 (MissingZero!7510 i!1173)) (= lt!330729 (MissingVacant!7510 i!1173))))))

(assert (=> b!744769 (= lt!330729 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744770 () Bool)

(assert (=> b!744770 (= e!415982 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19913 a!3186) j!159) a!3186 mask!3328) lt!330734))))

(declare-fun b!744771 () Bool)

(declare-fun res!501827 () Bool)

(assert (=> b!744771 (=> (not res!501827) (not e!415981))))

(assert (=> b!744771 (= res!501827 e!415983)))

(declare-fun c!81849 () Bool)

(assert (=> b!744771 (= c!81849 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744772 () Bool)

(declare-fun e!415979 () Bool)

(assert (=> b!744772 (= e!415979 true)))

(declare-fun lt!330730 () SeekEntryResult!7510)

(assert (=> b!744772 (= lt!330730 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19913 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744773 () Bool)

(assert (=> b!744773 (= e!415976 (not e!415979))))

(declare-fun res!501830 () Bool)

(assert (=> b!744773 (=> res!501830 e!415979)))

(get-info :version)

(assert (=> b!744773 (= res!501830 (or (not ((_ is Intermediate!7510) lt!330732)) (bvslt x!1131 (x!63375 lt!330732)) (not (= x!1131 (x!63375 lt!330732))) (not (= index!1321 (index!32410 lt!330732)))))))

(assert (=> b!744773 e!415980))

(declare-fun res!501821 () Bool)

(assert (=> b!744773 (=> (not res!501821) (not e!415980))))

(assert (=> b!744773 (= res!501821 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25472 0))(
  ( (Unit!25473) )
))
(declare-fun lt!330737 () Unit!25472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25472)

(assert (=> b!744773 (= lt!330737 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65408 res!501822) b!744756))

(assert (= (and b!744756 res!501831) b!744759))

(assert (= (and b!744759 res!501826) b!744765))

(assert (= (and b!744765 res!501829) b!744761))

(assert (= (and b!744761 res!501819) b!744769))

(assert (= (and b!744769 res!501825) b!744758))

(assert (= (and b!744758 res!501828) b!744763))

(assert (= (and b!744763 res!501820) b!744768))

(assert (= (and b!744768 res!501823) b!744767))

(assert (= (and b!744767 res!501833) b!744766))

(assert (= (and b!744766 res!501824) b!744771))

(assert (= (and b!744771 c!81849) b!744762))

(assert (= (and b!744771 (not c!81849)) b!744757))

(assert (= (and b!744771 res!501827) b!744760))

(assert (= (and b!744760 res!501832) b!744773))

(assert (= (and b!744773 res!501821) b!744764))

(assert (= (and b!744764 res!501834) b!744770))

(assert (= (and b!744773 (not res!501830)) b!744772))

(declare-fun m!694691 () Bool)

(assert (=> b!744766 m!694691))

(declare-fun m!694693 () Bool)

(assert (=> b!744761 m!694693))

(declare-fun m!694695 () Bool)

(assert (=> b!744757 m!694695))

(assert (=> b!744757 m!694695))

(declare-fun m!694697 () Bool)

(assert (=> b!744757 m!694697))

(assert (=> b!744762 m!694695))

(assert (=> b!744762 m!694695))

(declare-fun m!694699 () Bool)

(assert (=> b!744762 m!694699))

(declare-fun m!694701 () Bool)

(assert (=> b!744758 m!694701))

(assert (=> b!744772 m!694695))

(assert (=> b!744772 m!694695))

(assert (=> b!744772 m!694697))

(declare-fun m!694703 () Bool)

(assert (=> b!744763 m!694703))

(assert (=> b!744764 m!694695))

(assert (=> b!744764 m!694695))

(declare-fun m!694705 () Bool)

(assert (=> b!744764 m!694705))

(assert (=> b!744770 m!694695))

(assert (=> b!744770 m!694695))

(declare-fun m!694707 () Bool)

(assert (=> b!744770 m!694707))

(assert (=> b!744767 m!694695))

(assert (=> b!744767 m!694695))

(declare-fun m!694709 () Bool)

(assert (=> b!744767 m!694709))

(assert (=> b!744767 m!694709))

(assert (=> b!744767 m!694695))

(declare-fun m!694711 () Bool)

(assert (=> b!744767 m!694711))

(declare-fun m!694713 () Bool)

(assert (=> start!65408 m!694713))

(declare-fun m!694715 () Bool)

(assert (=> start!65408 m!694715))

(assert (=> b!744759 m!694695))

(assert (=> b!744759 m!694695))

(declare-fun m!694717 () Bool)

(assert (=> b!744759 m!694717))

(declare-fun m!694719 () Bool)

(assert (=> b!744769 m!694719))

(declare-fun m!694721 () Bool)

(assert (=> b!744765 m!694721))

(declare-fun m!694723 () Bool)

(assert (=> b!744760 m!694723))

(declare-fun m!694725 () Bool)

(assert (=> b!744760 m!694725))

(declare-fun m!694727 () Bool)

(assert (=> b!744760 m!694727))

(declare-fun m!694729 () Bool)

(assert (=> b!744760 m!694729))

(assert (=> b!744760 m!694725))

(declare-fun m!694731 () Bool)

(assert (=> b!744760 m!694731))

(declare-fun m!694733 () Bool)

(assert (=> b!744773 m!694733))

(declare-fun m!694735 () Bool)

(assert (=> b!744773 m!694735))

(check-sat (not start!65408) (not b!744765) (not b!744762) (not b!744769) (not b!744760) (not b!744758) (not b!744767) (not b!744759) (not b!744764) (not b!744772) (not b!744770) (not b!744763) (not b!744773) (not b!744757) (not b!744761))
(check-sat)
