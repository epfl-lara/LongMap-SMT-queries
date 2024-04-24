; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65880 () Bool)

(assert start!65880)

(declare-fun b!756102 () Bool)

(declare-fun e!421714 () Bool)

(declare-fun e!421712 () Bool)

(assert (=> b!756102 (= e!421714 e!421712)))

(declare-fun res!510867 () Bool)

(assert (=> b!756102 (=> (not res!510867) (not e!421712))))

(declare-datatypes ((SeekEntryResult!7627 0))(
  ( (MissingZero!7627 (index!32876 (_ BitVec 32))) (Found!7627 (index!32877 (_ BitVec 32))) (Intermediate!7627 (undefined!8439 Bool) (index!32878 (_ BitVec 32)) (x!63941 (_ BitVec 32))) (Undefined!7627) (MissingVacant!7627 (index!32879 (_ BitVec 32))) )
))
(declare-fun lt!336544 () SeekEntryResult!7627)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756102 (= res!510867 (or (= lt!336544 (MissingZero!7627 i!1173)) (= lt!336544 (MissingVacant!7627 i!1173))))))

(declare-datatypes ((array!41923 0))(
  ( (array!41924 (arr!20071 (Array (_ BitVec 32) (_ BitVec 64))) (size!20491 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41923)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41923 (_ BitVec 32)) SeekEntryResult!7627)

(assert (=> b!756102 (= lt!336544 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756103 () Bool)

(declare-fun res!510854 () Bool)

(assert (=> b!756103 (=> (not res!510854) (not e!421714))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756103 (= res!510854 (validKeyInArray!0 (select (arr!20071 a!3186) j!159)))))

(declare-fun b!756104 () Bool)

(declare-fun res!510858 () Bool)

(assert (=> b!756104 (=> (not res!510858) (not e!421714))))

(assert (=> b!756104 (= res!510858 (and (= (size!20491 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20491 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20491 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!421709 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!756105 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41923 (_ BitVec 32)) SeekEntryResult!7627)

(assert (=> b!756105 (= e!421709 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20071 a!3186) j!159) a!3186 mask!3328) (Found!7627 j!159)))))

(declare-fun b!756106 () Bool)

(declare-fun res!510859 () Bool)

(assert (=> b!756106 (=> (not res!510859) (not e!421712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41923 (_ BitVec 32)) Bool)

(assert (=> b!756106 (= res!510859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756107 () Bool)

(declare-fun res!510868 () Bool)

(assert (=> b!756107 (=> (not res!510868) (not e!421712))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756107 (= res!510868 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20491 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20491 a!3186))))))

(declare-fun b!756108 () Bool)

(declare-fun res!510863 () Bool)

(assert (=> b!756108 (=> (not res!510863) (not e!421714))))

(assert (=> b!756108 (= res!510863 (validKeyInArray!0 k0!2102))))

(declare-fun lt!336541 () SeekEntryResult!7627)

(declare-fun b!756109 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41923 (_ BitVec 32)) SeekEntryResult!7627)

(assert (=> b!756109 (= e!421709 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20071 a!3186) j!159) a!3186 mask!3328) lt!336541))))

(declare-fun res!510870 () Bool)

(assert (=> start!65880 (=> (not res!510870) (not e!421714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65880 (= res!510870 (validMask!0 mask!3328))))

(assert (=> start!65880 e!421714))

(assert (=> start!65880 true))

(declare-fun array_inv!15930 (array!41923) Bool)

(assert (=> start!65880 (array_inv!15930 a!3186)))

(declare-fun b!756110 () Bool)

(declare-datatypes ((Unit!26065 0))(
  ( (Unit!26066) )
))
(declare-fun e!421719 () Unit!26065)

(declare-fun Unit!26067 () Unit!26065)

(assert (=> b!756110 (= e!421719 Unit!26067)))

(assert (=> b!756110 false))

(declare-fun b!756111 () Bool)

(declare-fun e!421717 () Bool)

(assert (=> b!756111 (= e!421712 e!421717)))

(declare-fun res!510855 () Bool)

(assert (=> b!756111 (=> (not res!510855) (not e!421717))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756111 (= res!510855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20071 a!3186) j!159) mask!3328) (select (arr!20071 a!3186) j!159) a!3186 mask!3328) lt!336541))))

(assert (=> b!756111 (= lt!336541 (Intermediate!7627 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756112 () Bool)

(declare-fun e!421708 () Bool)

(assert (=> b!756112 (= e!421708 true)))

(declare-fun e!421715 () Bool)

(assert (=> b!756112 e!421715))

(declare-fun res!510853 () Bool)

(assert (=> b!756112 (=> (not res!510853) (not e!421715))))

(declare-fun lt!336538 () (_ BitVec 64))

(assert (=> b!756112 (= res!510853 (= lt!336538 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336537 () Unit!26065)

(assert (=> b!756112 (= lt!336537 e!421719)))

(declare-fun c!83008 () Bool)

(assert (=> b!756112 (= c!83008 (= lt!336538 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756113 () Bool)

(declare-fun res!510864 () Bool)

(assert (=> b!756113 (=> (not res!510864) (not e!421714))))

(declare-fun arrayContainsKey!0 (array!41923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756113 (= res!510864 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756114 () Bool)

(declare-fun e!421710 () Bool)

(assert (=> b!756114 (= e!421717 e!421710)))

(declare-fun res!510856 () Bool)

(assert (=> b!756114 (=> (not res!510856) (not e!421710))))

(declare-fun lt!336540 () SeekEntryResult!7627)

(declare-fun lt!336542 () SeekEntryResult!7627)

(assert (=> b!756114 (= res!510856 (= lt!336540 lt!336542))))

(declare-fun lt!336546 () (_ BitVec 64))

(declare-fun lt!336535 () array!41923)

(assert (=> b!756114 (= lt!336542 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336546 lt!336535 mask!3328))))

(assert (=> b!756114 (= lt!336540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336546 mask!3328) lt!336546 lt!336535 mask!3328))))

(assert (=> b!756114 (= lt!336546 (select (store (arr!20071 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756114 (= lt!336535 (array!41924 (store (arr!20071 a!3186) i!1173 k0!2102) (size!20491 a!3186)))))

(declare-fun b!756115 () Bool)

(declare-fun e!421713 () Bool)

(assert (=> b!756115 (= e!421713 e!421708)))

(declare-fun res!510861 () Bool)

(assert (=> b!756115 (=> res!510861 e!421708)))

(assert (=> b!756115 (= res!510861 (= lt!336538 lt!336546))))

(assert (=> b!756115 (= lt!336538 (select (store (arr!20071 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun lt!336545 () SeekEntryResult!7627)

(declare-fun e!421718 () Bool)

(declare-fun b!756116 () Bool)

(assert (=> b!756116 (= e!421718 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20071 a!3186) j!159) a!3186 mask!3328) lt!336545))))

(declare-fun b!756117 () Bool)

(declare-fun lt!336539 () SeekEntryResult!7627)

(declare-fun lt!336543 () SeekEntryResult!7627)

(assert (=> b!756117 (= e!421715 (= lt!336539 lt!336543))))

(declare-fun b!756118 () Bool)

(declare-fun res!510857 () Bool)

(assert (=> b!756118 (=> (not res!510857) (not e!421717))))

(assert (=> b!756118 (= res!510857 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20071 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756119 () Bool)

(declare-fun res!510862 () Bool)

(assert (=> b!756119 (=> (not res!510862) (not e!421715))))

(assert (=> b!756119 (= res!510862 (= (seekEntryOrOpen!0 lt!336546 lt!336535 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336546 lt!336535 mask!3328)))))

(declare-fun b!756120 () Bool)

(declare-fun Unit!26068 () Unit!26065)

(assert (=> b!756120 (= e!421719 Unit!26068)))

(declare-fun b!756121 () Bool)

(declare-fun res!510866 () Bool)

(assert (=> b!756121 (=> (not res!510866) (not e!421717))))

(assert (=> b!756121 (= res!510866 e!421709)))

(declare-fun c!83009 () Bool)

(assert (=> b!756121 (= c!83009 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756122 () Bool)

(declare-fun res!510869 () Bool)

(assert (=> b!756122 (=> (not res!510869) (not e!421712))))

(declare-datatypes ((List!13980 0))(
  ( (Nil!13977) (Cons!13976 (h!15054 (_ BitVec 64)) (t!20287 List!13980)) )
))
(declare-fun arrayNoDuplicates!0 (array!41923 (_ BitVec 32) List!13980) Bool)

(assert (=> b!756122 (= res!510869 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13977))))

(declare-fun b!756123 () Bool)

(declare-fun e!421716 () Bool)

(assert (=> b!756123 (= e!421710 (not e!421716))))

(declare-fun res!510871 () Bool)

(assert (=> b!756123 (=> res!510871 e!421716)))

(get-info :version)

(assert (=> b!756123 (= res!510871 (or (not ((_ is Intermediate!7627) lt!336542)) (bvslt x!1131 (x!63941 lt!336542)) (not (= x!1131 (x!63941 lt!336542))) (not (= index!1321 (index!32878 lt!336542)))))))

(assert (=> b!756123 e!421718))

(declare-fun res!510865 () Bool)

(assert (=> b!756123 (=> (not res!510865) (not e!421718))))

(assert (=> b!756123 (= res!510865 (= lt!336539 lt!336545))))

(assert (=> b!756123 (= lt!336545 (Found!7627 j!159))))

(assert (=> b!756123 (= lt!336539 (seekEntryOrOpen!0 (select (arr!20071 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756123 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336536 () Unit!26065)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26065)

(assert (=> b!756123 (= lt!336536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756124 () Bool)

(assert (=> b!756124 (= e!421716 e!421713)))

(declare-fun res!510860 () Bool)

(assert (=> b!756124 (=> res!510860 e!421713)))

(assert (=> b!756124 (= res!510860 (not (= lt!336543 lt!336545)))))

(assert (=> b!756124 (= lt!336543 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20071 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65880 res!510870) b!756104))

(assert (= (and b!756104 res!510858) b!756103))

(assert (= (and b!756103 res!510854) b!756108))

(assert (= (and b!756108 res!510863) b!756113))

(assert (= (and b!756113 res!510864) b!756102))

(assert (= (and b!756102 res!510867) b!756106))

(assert (= (and b!756106 res!510859) b!756122))

(assert (= (and b!756122 res!510869) b!756107))

(assert (= (and b!756107 res!510868) b!756111))

(assert (= (and b!756111 res!510855) b!756118))

(assert (= (and b!756118 res!510857) b!756121))

(assert (= (and b!756121 c!83009) b!756109))

(assert (= (and b!756121 (not c!83009)) b!756105))

(assert (= (and b!756121 res!510866) b!756114))

(assert (= (and b!756114 res!510856) b!756123))

(assert (= (and b!756123 res!510865) b!756116))

(assert (= (and b!756123 (not res!510871)) b!756124))

(assert (= (and b!756124 (not res!510860)) b!756115))

(assert (= (and b!756115 (not res!510861)) b!756112))

(assert (= (and b!756112 c!83008) b!756110))

(assert (= (and b!756112 (not c!83008)) b!756120))

(assert (= (and b!756112 res!510853) b!756119))

(assert (= (and b!756119 res!510862) b!756117))

(declare-fun m!704739 () Bool)

(assert (=> b!756109 m!704739))

(assert (=> b!756109 m!704739))

(declare-fun m!704741 () Bool)

(assert (=> b!756109 m!704741))

(declare-fun m!704743 () Bool)

(assert (=> b!756108 m!704743))

(assert (=> b!756111 m!704739))

(assert (=> b!756111 m!704739))

(declare-fun m!704745 () Bool)

(assert (=> b!756111 m!704745))

(assert (=> b!756111 m!704745))

(assert (=> b!756111 m!704739))

(declare-fun m!704747 () Bool)

(assert (=> b!756111 m!704747))

(assert (=> b!756105 m!704739))

(assert (=> b!756105 m!704739))

(declare-fun m!704749 () Bool)

(assert (=> b!756105 m!704749))

(declare-fun m!704751 () Bool)

(assert (=> b!756113 m!704751))

(declare-fun m!704753 () Bool)

(assert (=> b!756114 m!704753))

(declare-fun m!704755 () Bool)

(assert (=> b!756114 m!704755))

(declare-fun m!704757 () Bool)

(assert (=> b!756114 m!704757))

(declare-fun m!704759 () Bool)

(assert (=> b!756114 m!704759))

(declare-fun m!704761 () Bool)

(assert (=> b!756114 m!704761))

(assert (=> b!756114 m!704753))

(assert (=> b!756116 m!704739))

(assert (=> b!756116 m!704739))

(declare-fun m!704763 () Bool)

(assert (=> b!756116 m!704763))

(declare-fun m!704765 () Bool)

(assert (=> b!756102 m!704765))

(declare-fun m!704767 () Bool)

(assert (=> b!756106 m!704767))

(assert (=> b!756103 m!704739))

(assert (=> b!756103 m!704739))

(declare-fun m!704769 () Bool)

(assert (=> b!756103 m!704769))

(declare-fun m!704771 () Bool)

(assert (=> start!65880 m!704771))

(declare-fun m!704773 () Bool)

(assert (=> start!65880 m!704773))

(declare-fun m!704775 () Bool)

(assert (=> b!756122 m!704775))

(assert (=> b!756115 m!704759))

(declare-fun m!704777 () Bool)

(assert (=> b!756115 m!704777))

(assert (=> b!756124 m!704739))

(assert (=> b!756124 m!704739))

(assert (=> b!756124 m!704749))

(declare-fun m!704779 () Bool)

(assert (=> b!756118 m!704779))

(assert (=> b!756123 m!704739))

(assert (=> b!756123 m!704739))

(declare-fun m!704781 () Bool)

(assert (=> b!756123 m!704781))

(declare-fun m!704783 () Bool)

(assert (=> b!756123 m!704783))

(declare-fun m!704785 () Bool)

(assert (=> b!756123 m!704785))

(declare-fun m!704787 () Bool)

(assert (=> b!756119 m!704787))

(declare-fun m!704789 () Bool)

(assert (=> b!756119 m!704789))

(check-sat (not b!756111) (not b!756123) (not b!756105) (not b!756122) (not b!756116) (not b!756119) (not b!756109) (not b!756106) (not b!756103) (not b!756108) (not b!756124) (not b!756113) (not start!65880) (not b!756102) (not b!756114))
(check-sat)
