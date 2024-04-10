; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66812 () Bool)

(assert start!66812)

(declare-fun b!770756 () Bool)

(declare-fun res!521411 () Bool)

(declare-fun e!429112 () Bool)

(assert (=> b!770756 (=> (not res!521411) (not e!429112))))

(declare-datatypes ((array!42374 0))(
  ( (array!42375 (arr!20287 (Array (_ BitVec 32) (_ BitVec 64))) (size!20708 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42374)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!770756 (= res!521411 (and (= (size!20708 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20708 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20708 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!521417 () Bool)

(assert (=> start!66812 (=> (not res!521417) (not e!429112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66812 (= res!521417 (validMask!0 mask!3328))))

(assert (=> start!66812 e!429112))

(assert (=> start!66812 true))

(declare-fun array_inv!16083 (array!42374) Bool)

(assert (=> start!66812 (array_inv!16083 a!3186)))

(declare-fun b!770757 () Bool)

(declare-fun res!521408 () Bool)

(assert (=> b!770757 (=> (not res!521408) (not e!429112))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770757 (= res!521408 (validKeyInArray!0 k0!2102))))

(declare-fun b!770758 () Bool)

(declare-fun e!429113 () Bool)

(declare-fun e!429115 () Bool)

(assert (=> b!770758 (= e!429113 e!429115)))

(declare-fun res!521416 () Bool)

(assert (=> b!770758 (=> (not res!521416) (not e!429115))))

(declare-datatypes ((SeekEntryResult!7887 0))(
  ( (MissingZero!7887 (index!33916 (_ BitVec 32))) (Found!7887 (index!33917 (_ BitVec 32))) (Intermediate!7887 (undefined!8699 Bool) (index!33918 (_ BitVec 32)) (x!64842 (_ BitVec 32))) (Undefined!7887) (MissingVacant!7887 (index!33919 (_ BitVec 32))) )
))
(declare-fun lt!343072 () SeekEntryResult!7887)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42374 (_ BitVec 32)) SeekEntryResult!7887)

(assert (=> b!770758 (= res!521416 (= (seekEntryOrOpen!0 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) lt!343072))))

(assert (=> b!770758 (= lt!343072 (Found!7887 j!159))))

(declare-fun b!770759 () Bool)

(declare-fun res!521420 () Bool)

(declare-fun e!429118 () Bool)

(assert (=> b!770759 (=> (not res!521420) (not e!429118))))

(declare-datatypes ((List!14289 0))(
  ( (Nil!14286) (Cons!14285 (h!15384 (_ BitVec 64)) (t!20604 List!14289)) )
))
(declare-fun arrayNoDuplicates!0 (array!42374 (_ BitVec 32) List!14289) Bool)

(assert (=> b!770759 (= res!521420 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14286))))

(declare-fun b!770760 () Bool)

(assert (=> b!770760 (= e!429112 e!429118)))

(declare-fun res!521405 () Bool)

(assert (=> b!770760 (=> (not res!521405) (not e!429118))))

(declare-fun lt!343079 () SeekEntryResult!7887)

(assert (=> b!770760 (= res!521405 (or (= lt!343079 (MissingZero!7887 i!1173)) (= lt!343079 (MissingVacant!7887 i!1173))))))

(assert (=> b!770760 (= lt!343079 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770761 () Bool)

(declare-fun res!521406 () Bool)

(assert (=> b!770761 (=> (not res!521406) (not e!429112))))

(assert (=> b!770761 (= res!521406 (validKeyInArray!0 (select (arr!20287 a!3186) j!159)))))

(declare-fun b!770762 () Bool)

(declare-fun e!429116 () Bool)

(assert (=> b!770762 (= e!429118 e!429116)))

(declare-fun res!521413 () Bool)

(assert (=> b!770762 (=> (not res!521413) (not e!429116))))

(declare-fun lt!343077 () SeekEntryResult!7887)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42374 (_ BitVec 32)) SeekEntryResult!7887)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770762 (= res!521413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20287 a!3186) j!159) mask!3328) (select (arr!20287 a!3186) j!159) a!3186 mask!3328) lt!343077))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770762 (= lt!343077 (Intermediate!7887 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!429111 () Bool)

(declare-fun b!770763 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42374 (_ BitVec 32)) SeekEntryResult!7887)

(assert (=> b!770763 (= e!429111 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) (Found!7887 j!159)))))

(declare-fun b!770764 () Bool)

(assert (=> b!770764 (= e!429115 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) lt!343072))))

(declare-fun b!770765 () Bool)

(declare-fun res!521418 () Bool)

(assert (=> b!770765 (=> (not res!521418) (not e!429116))))

(assert (=> b!770765 (= res!521418 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20287 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770766 () Bool)

(assert (=> b!770766 (= e!429111 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) lt!343077))))

(declare-fun b!770767 () Bool)

(declare-datatypes ((Unit!26562 0))(
  ( (Unit!26563) )
))
(declare-fun e!429110 () Unit!26562)

(declare-fun Unit!26564 () Unit!26562)

(assert (=> b!770767 (= e!429110 Unit!26564)))

(declare-fun lt!343073 () SeekEntryResult!7887)

(assert (=> b!770767 (= lt!343073 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20287 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343075 () (_ BitVec 32))

(assert (=> b!770767 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343075 resIntermediateIndex!5 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) (Found!7887 j!159))))

(declare-fun b!770768 () Bool)

(declare-fun res!521409 () Bool)

(assert (=> b!770768 (=> (not res!521409) (not e!429118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42374 (_ BitVec 32)) Bool)

(assert (=> b!770768 (= res!521409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770769 () Bool)

(declare-fun e!429117 () Bool)

(assert (=> b!770769 (= e!429117 true)))

(declare-fun lt!343070 () Unit!26562)

(assert (=> b!770769 (= lt!343070 e!429110)))

(declare-fun c!85071 () Bool)

(assert (=> b!770769 (= c!85071 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770769 (= lt!343075 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770770 () Bool)

(declare-fun res!521414 () Bool)

(assert (=> b!770770 (=> (not res!521414) (not e!429116))))

(assert (=> b!770770 (= res!521414 e!429111)))

(declare-fun c!85072 () Bool)

(assert (=> b!770770 (= c!85072 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770771 () Bool)

(declare-fun e!429114 () Bool)

(assert (=> b!770771 (= e!429116 e!429114)))

(declare-fun res!521415 () Bool)

(assert (=> b!770771 (=> (not res!521415) (not e!429114))))

(declare-fun lt!343074 () SeekEntryResult!7887)

(declare-fun lt!343071 () SeekEntryResult!7887)

(assert (=> b!770771 (= res!521415 (= lt!343074 lt!343071))))

(declare-fun lt!343078 () (_ BitVec 64))

(declare-fun lt!343069 () array!42374)

(assert (=> b!770771 (= lt!343071 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343078 lt!343069 mask!3328))))

(assert (=> b!770771 (= lt!343074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343078 mask!3328) lt!343078 lt!343069 mask!3328))))

(assert (=> b!770771 (= lt!343078 (select (store (arr!20287 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770771 (= lt!343069 (array!42375 (store (arr!20287 a!3186) i!1173 k0!2102) (size!20708 a!3186)))))

(declare-fun b!770772 () Bool)

(declare-fun res!521419 () Bool)

(assert (=> b!770772 (=> (not res!521419) (not e!429112))))

(declare-fun arrayContainsKey!0 (array!42374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770772 (= res!521419 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770773 () Bool)

(assert (=> b!770773 (= e!429114 (not e!429117))))

(declare-fun res!521407 () Bool)

(assert (=> b!770773 (=> res!521407 e!429117)))

(get-info :version)

(assert (=> b!770773 (= res!521407 (or (not ((_ is Intermediate!7887) lt!343071)) (bvsge x!1131 (x!64842 lt!343071))))))

(assert (=> b!770773 e!429113))

(declare-fun res!521410 () Bool)

(assert (=> b!770773 (=> (not res!521410) (not e!429113))))

(assert (=> b!770773 (= res!521410 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343076 () Unit!26562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26562)

(assert (=> b!770773 (= lt!343076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770774 () Bool)

(declare-fun Unit!26565 () Unit!26562)

(assert (=> b!770774 (= e!429110 Unit!26565)))

(assert (=> b!770774 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343075 (select (arr!20287 a!3186) j!159) a!3186 mask!3328) lt!343077)))

(declare-fun b!770775 () Bool)

(declare-fun res!521412 () Bool)

(assert (=> b!770775 (=> (not res!521412) (not e!429118))))

(assert (=> b!770775 (= res!521412 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20708 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20708 a!3186))))))

(assert (= (and start!66812 res!521417) b!770756))

(assert (= (and b!770756 res!521411) b!770761))

(assert (= (and b!770761 res!521406) b!770757))

(assert (= (and b!770757 res!521408) b!770772))

(assert (= (and b!770772 res!521419) b!770760))

(assert (= (and b!770760 res!521405) b!770768))

(assert (= (and b!770768 res!521409) b!770759))

(assert (= (and b!770759 res!521420) b!770775))

(assert (= (and b!770775 res!521412) b!770762))

(assert (= (and b!770762 res!521413) b!770765))

(assert (= (and b!770765 res!521418) b!770770))

(assert (= (and b!770770 c!85072) b!770766))

(assert (= (and b!770770 (not c!85072)) b!770763))

(assert (= (and b!770770 res!521414) b!770771))

(assert (= (and b!770771 res!521415) b!770773))

(assert (= (and b!770773 res!521410) b!770758))

(assert (= (and b!770758 res!521416) b!770764))

(assert (= (and b!770773 (not res!521407)) b!770769))

(assert (= (and b!770769 c!85071) b!770774))

(assert (= (and b!770769 (not c!85071)) b!770767))

(declare-fun m!715995 () Bool)

(assert (=> b!770768 m!715995))

(declare-fun m!715997 () Bool)

(assert (=> b!770774 m!715997))

(assert (=> b!770774 m!715997))

(declare-fun m!715999 () Bool)

(assert (=> b!770774 m!715999))

(declare-fun m!716001 () Bool)

(assert (=> b!770765 m!716001))

(declare-fun m!716003 () Bool)

(assert (=> b!770757 m!716003))

(declare-fun m!716005 () Bool)

(assert (=> b!770772 m!716005))

(declare-fun m!716007 () Bool)

(assert (=> b!770773 m!716007))

(declare-fun m!716009 () Bool)

(assert (=> b!770773 m!716009))

(declare-fun m!716011 () Bool)

(assert (=> b!770769 m!716011))

(assert (=> b!770764 m!715997))

(assert (=> b!770764 m!715997))

(declare-fun m!716013 () Bool)

(assert (=> b!770764 m!716013))

(declare-fun m!716015 () Bool)

(assert (=> b!770759 m!716015))

(assert (=> b!770766 m!715997))

(assert (=> b!770766 m!715997))

(declare-fun m!716017 () Bool)

(assert (=> b!770766 m!716017))

(assert (=> b!770761 m!715997))

(assert (=> b!770761 m!715997))

(declare-fun m!716019 () Bool)

(assert (=> b!770761 m!716019))

(assert (=> b!770762 m!715997))

(assert (=> b!770762 m!715997))

(declare-fun m!716021 () Bool)

(assert (=> b!770762 m!716021))

(assert (=> b!770762 m!716021))

(assert (=> b!770762 m!715997))

(declare-fun m!716023 () Bool)

(assert (=> b!770762 m!716023))

(assert (=> b!770758 m!715997))

(assert (=> b!770758 m!715997))

(declare-fun m!716025 () Bool)

(assert (=> b!770758 m!716025))

(assert (=> b!770767 m!715997))

(assert (=> b!770767 m!715997))

(declare-fun m!716027 () Bool)

(assert (=> b!770767 m!716027))

(assert (=> b!770767 m!715997))

(declare-fun m!716029 () Bool)

(assert (=> b!770767 m!716029))

(declare-fun m!716031 () Bool)

(assert (=> start!66812 m!716031))

(declare-fun m!716033 () Bool)

(assert (=> start!66812 m!716033))

(declare-fun m!716035 () Bool)

(assert (=> b!770760 m!716035))

(declare-fun m!716037 () Bool)

(assert (=> b!770771 m!716037))

(declare-fun m!716039 () Bool)

(assert (=> b!770771 m!716039))

(declare-fun m!716041 () Bool)

(assert (=> b!770771 m!716041))

(declare-fun m!716043 () Bool)

(assert (=> b!770771 m!716043))

(declare-fun m!716045 () Bool)

(assert (=> b!770771 m!716045))

(assert (=> b!770771 m!716039))

(assert (=> b!770763 m!715997))

(assert (=> b!770763 m!715997))

(assert (=> b!770763 m!716027))

(check-sat (not b!770761) (not b!770760) (not b!770759) (not b!770766) (not b!770772) (not b!770757) (not b!770767) (not b!770768) (not b!770774) (not b!770773) (not b!770769) (not b!770764) (not b!770771) (not b!770763) (not b!770758) (not start!66812) (not b!770762))
(check-sat)
