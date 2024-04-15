; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67736 () Bool)

(assert start!67736)

(declare-fun b!786613 () Bool)

(declare-datatypes ((Unit!27200 0))(
  ( (Unit!27201) )
))
(declare-fun e!437253 () Unit!27200)

(declare-fun Unit!27202 () Unit!27200)

(assert (=> b!786613 (= e!437253 Unit!27202)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42795 0))(
  ( (array!42796 (arr!20486 (Array (_ BitVec 32) (_ BitVec 64))) (size!20907 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42795)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8083 0))(
  ( (MissingZero!8083 (index!34700 (_ BitVec 32))) (Found!8083 (index!34701 (_ BitVec 32))) (Intermediate!8083 (undefined!8895 Bool) (index!34702 (_ BitVec 32)) (x!65650 (_ BitVec 32))) (Undefined!8083) (MissingVacant!8083 (index!34703 (_ BitVec 32))) )
))
(declare-fun lt!350719 () SeekEntryResult!8083)

(declare-fun b!786614 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!437248 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42795 (_ BitVec 32)) SeekEntryResult!8083)

(assert (=> b!786614 (= e!437248 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20486 a!3186) j!159) a!3186 mask!3328) lt!350719))))

(declare-fun b!786615 () Bool)

(declare-fun e!437243 () Bool)

(declare-fun e!437246 () Bool)

(assert (=> b!786615 (= e!437243 e!437246)))

(declare-fun res!532738 () Bool)

(assert (=> b!786615 (=> (not res!532738) (not e!437246))))

(declare-fun lt!350711 () SeekEntryResult!8083)

(declare-fun lt!350712 () SeekEntryResult!8083)

(assert (=> b!786615 (= res!532738 (= lt!350711 lt!350712))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!350718 () (_ BitVec 64))

(declare-fun lt!350717 () array!42795)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42795 (_ BitVec 32)) SeekEntryResult!8083)

(assert (=> b!786615 (= lt!350712 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350718 lt!350717 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786615 (= lt!350711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350718 mask!3328) lt!350718 lt!350717 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786615 (= lt!350718 (select (store (arr!20486 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786615 (= lt!350717 (array!42796 (store (arr!20486 a!3186) i!1173 k0!2102) (size!20907 a!3186)))))

(declare-fun b!786616 () Bool)

(declare-fun e!437250 () Bool)

(assert (=> b!786616 (= e!437250 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20486 a!3186) j!159) a!3186 mask!3328) (Found!8083 j!159)))))

(declare-fun b!786617 () Bool)

(declare-fun res!532731 () Bool)

(declare-fun e!437252 () Bool)

(assert (=> b!786617 (=> (not res!532731) (not e!437252))))

(declare-datatypes ((List!14527 0))(
  ( (Nil!14524) (Cons!14523 (h!15646 (_ BitVec 64)) (t!20833 List!14527)) )
))
(declare-fun arrayNoDuplicates!0 (array!42795 (_ BitVec 32) List!14527) Bool)

(assert (=> b!786617 (= res!532731 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14524))))

(declare-fun b!786618 () Bool)

(declare-fun res!532744 () Bool)

(declare-fun e!437249 () Bool)

(assert (=> b!786618 (=> (not res!532744) (not e!437249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786618 (= res!532744 (validKeyInArray!0 (select (arr!20486 a!3186) j!159)))))

(declare-fun b!786619 () Bool)

(declare-fun res!532732 () Bool)

(assert (=> b!786619 (=> (not res!532732) (not e!437249))))

(declare-fun arrayContainsKey!0 (array!42795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786619 (= res!532732 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786620 () Bool)

(declare-fun res!532728 () Bool)

(assert (=> b!786620 (=> (not res!532728) (not e!437249))))

(assert (=> b!786620 (= res!532728 (and (= (size!20907 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20907 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20907 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786621 () Bool)

(declare-fun res!532737 () Bool)

(assert (=> b!786621 (=> (not res!532737) (not e!437243))))

(assert (=> b!786621 (= res!532737 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20486 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786622 () Bool)

(assert (=> b!786622 (= e!437252 e!437243)))

(declare-fun res!532745 () Bool)

(assert (=> b!786622 (=> (not res!532745) (not e!437243))))

(declare-fun lt!350710 () SeekEntryResult!8083)

(assert (=> b!786622 (= res!532745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20486 a!3186) j!159) mask!3328) (select (arr!20486 a!3186) j!159) a!3186 mask!3328) lt!350710))))

(assert (=> b!786622 (= lt!350710 (Intermediate!8083 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786623 () Bool)

(declare-fun res!532741 () Bool)

(assert (=> b!786623 (=> (not res!532741) (not e!437249))))

(assert (=> b!786623 (= res!532741 (validKeyInArray!0 k0!2102))))

(declare-fun res!532740 () Bool)

(assert (=> start!67736 (=> (not res!532740) (not e!437249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67736 (= res!532740 (validMask!0 mask!3328))))

(assert (=> start!67736 e!437249))

(assert (=> start!67736 true))

(declare-fun array_inv!16369 (array!42795) Bool)

(assert (=> start!67736 (array_inv!16369 a!3186)))

(declare-fun b!786624 () Bool)

(declare-fun e!437254 () Bool)

(declare-fun e!437244 () Bool)

(assert (=> b!786624 (= e!437254 e!437244)))

(declare-fun res!532746 () Bool)

(assert (=> b!786624 (=> res!532746 e!437244)))

(declare-fun lt!350720 () (_ BitVec 64))

(assert (=> b!786624 (= res!532746 (= lt!350720 lt!350718))))

(assert (=> b!786624 (= lt!350720 (select (store (arr!20486 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786625 () Bool)

(declare-fun e!437245 () Bool)

(declare-fun lt!350715 () SeekEntryResult!8083)

(declare-fun lt!350714 () SeekEntryResult!8083)

(assert (=> b!786625 (= e!437245 (= lt!350715 lt!350714))))

(declare-fun b!786626 () Bool)

(declare-fun e!437247 () Bool)

(assert (=> b!786626 (= e!437247 e!437254)))

(declare-fun res!532730 () Bool)

(assert (=> b!786626 (=> res!532730 e!437254)))

(assert (=> b!786626 (= res!532730 (not (= lt!350714 lt!350719)))))

(assert (=> b!786626 (= lt!350714 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20486 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786627 () Bool)

(declare-fun Unit!27203 () Unit!27200)

(assert (=> b!786627 (= e!437253 Unit!27203)))

(assert (=> b!786627 false))

(declare-fun b!786628 () Bool)

(declare-fun res!532734 () Bool)

(assert (=> b!786628 (=> (not res!532734) (not e!437245))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42795 (_ BitVec 32)) SeekEntryResult!8083)

(assert (=> b!786628 (= res!532734 (= (seekEntryOrOpen!0 lt!350718 lt!350717 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350718 lt!350717 mask!3328)))))

(declare-fun b!786629 () Bool)

(declare-fun res!532742 () Bool)

(assert (=> b!786629 (=> (not res!532742) (not e!437252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42795 (_ BitVec 32)) Bool)

(assert (=> b!786629 (= res!532742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786630 () Bool)

(assert (=> b!786630 (= e!437250 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20486 a!3186) j!159) a!3186 mask!3328) lt!350710))))

(declare-fun b!786631 () Bool)

(declare-fun res!532739 () Bool)

(assert (=> b!786631 (=> (not res!532739) (not e!437252))))

(assert (=> b!786631 (= res!532739 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20907 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20907 a!3186))))))

(declare-fun b!786632 () Bool)

(assert (=> b!786632 (= e!437246 (not e!437247))))

(declare-fun res!532729 () Bool)

(assert (=> b!786632 (=> res!532729 e!437247)))

(get-info :version)

(assert (=> b!786632 (= res!532729 (or (not ((_ is Intermediate!8083) lt!350712)) (bvslt x!1131 (x!65650 lt!350712)) (not (= x!1131 (x!65650 lt!350712))) (not (= index!1321 (index!34702 lt!350712)))))))

(assert (=> b!786632 e!437248))

(declare-fun res!532735 () Bool)

(assert (=> b!786632 (=> (not res!532735) (not e!437248))))

(assert (=> b!786632 (= res!532735 (= lt!350715 lt!350719))))

(assert (=> b!786632 (= lt!350719 (Found!8083 j!159))))

(assert (=> b!786632 (= lt!350715 (seekEntryOrOpen!0 (select (arr!20486 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786632 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350709 () Unit!27200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27200)

(assert (=> b!786632 (= lt!350709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786633 () Bool)

(declare-fun res!532743 () Bool)

(assert (=> b!786633 (=> (not res!532743) (not e!437243))))

(assert (=> b!786633 (= res!532743 e!437250)))

(declare-fun c!87350 () Bool)

(assert (=> b!786633 (= c!87350 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786634 () Bool)

(assert (=> b!786634 (= e!437249 e!437252)))

(declare-fun res!532733 () Bool)

(assert (=> b!786634 (=> (not res!532733) (not e!437252))))

(declare-fun lt!350716 () SeekEntryResult!8083)

(assert (=> b!786634 (= res!532733 (or (= lt!350716 (MissingZero!8083 i!1173)) (= lt!350716 (MissingVacant!8083 i!1173))))))

(assert (=> b!786634 (= lt!350716 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786635 () Bool)

(assert (=> b!786635 (= e!437244 true)))

(assert (=> b!786635 e!437245))

(declare-fun res!532736 () Bool)

(assert (=> b!786635 (=> (not res!532736) (not e!437245))))

(assert (=> b!786635 (= res!532736 (= lt!350720 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350713 () Unit!27200)

(assert (=> b!786635 (= lt!350713 e!437253)))

(declare-fun c!87351 () Bool)

(assert (=> b!786635 (= c!87351 (= lt!350720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!67736 res!532740) b!786620))

(assert (= (and b!786620 res!532728) b!786618))

(assert (= (and b!786618 res!532744) b!786623))

(assert (= (and b!786623 res!532741) b!786619))

(assert (= (and b!786619 res!532732) b!786634))

(assert (= (and b!786634 res!532733) b!786629))

(assert (= (and b!786629 res!532742) b!786617))

(assert (= (and b!786617 res!532731) b!786631))

(assert (= (and b!786631 res!532739) b!786622))

(assert (= (and b!786622 res!532745) b!786621))

(assert (= (and b!786621 res!532737) b!786633))

(assert (= (and b!786633 c!87350) b!786630))

(assert (= (and b!786633 (not c!87350)) b!786616))

(assert (= (and b!786633 res!532743) b!786615))

(assert (= (and b!786615 res!532738) b!786632))

(assert (= (and b!786632 res!532735) b!786614))

(assert (= (and b!786632 (not res!532729)) b!786626))

(assert (= (and b!786626 (not res!532730)) b!786624))

(assert (= (and b!786624 (not res!532746)) b!786635))

(assert (= (and b!786635 c!87351) b!786627))

(assert (= (and b!786635 (not c!87351)) b!786613))

(assert (= (and b!786635 res!532736) b!786628))

(assert (= (and b!786628 res!532734) b!786625))

(declare-fun m!727827 () Bool)

(assert (=> b!786614 m!727827))

(assert (=> b!786614 m!727827))

(declare-fun m!727829 () Bool)

(assert (=> b!786614 m!727829))

(assert (=> b!786626 m!727827))

(assert (=> b!786626 m!727827))

(declare-fun m!727831 () Bool)

(assert (=> b!786626 m!727831))

(declare-fun m!727833 () Bool)

(assert (=> b!786628 m!727833))

(declare-fun m!727835 () Bool)

(assert (=> b!786628 m!727835))

(declare-fun m!727837 () Bool)

(assert (=> b!786621 m!727837))

(assert (=> b!786632 m!727827))

(assert (=> b!786632 m!727827))

(declare-fun m!727839 () Bool)

(assert (=> b!786632 m!727839))

(declare-fun m!727841 () Bool)

(assert (=> b!786632 m!727841))

(declare-fun m!727843 () Bool)

(assert (=> b!786632 m!727843))

(declare-fun m!727845 () Bool)

(assert (=> b!786619 m!727845))

(declare-fun m!727847 () Bool)

(assert (=> b!786623 m!727847))

(assert (=> b!786616 m!727827))

(assert (=> b!786616 m!727827))

(assert (=> b!786616 m!727831))

(declare-fun m!727849 () Bool)

(assert (=> start!67736 m!727849))

(declare-fun m!727851 () Bool)

(assert (=> start!67736 m!727851))

(assert (=> b!786622 m!727827))

(assert (=> b!786622 m!727827))

(declare-fun m!727853 () Bool)

(assert (=> b!786622 m!727853))

(assert (=> b!786622 m!727853))

(assert (=> b!786622 m!727827))

(declare-fun m!727855 () Bool)

(assert (=> b!786622 m!727855))

(assert (=> b!786618 m!727827))

(assert (=> b!786618 m!727827))

(declare-fun m!727857 () Bool)

(assert (=> b!786618 m!727857))

(declare-fun m!727859 () Bool)

(assert (=> b!786617 m!727859))

(declare-fun m!727861 () Bool)

(assert (=> b!786615 m!727861))

(declare-fun m!727863 () Bool)

(assert (=> b!786615 m!727863))

(assert (=> b!786615 m!727863))

(declare-fun m!727865 () Bool)

(assert (=> b!786615 m!727865))

(declare-fun m!727867 () Bool)

(assert (=> b!786615 m!727867))

(declare-fun m!727869 () Bool)

(assert (=> b!786615 m!727869))

(declare-fun m!727871 () Bool)

(assert (=> b!786629 m!727871))

(assert (=> b!786624 m!727867))

(declare-fun m!727873 () Bool)

(assert (=> b!786624 m!727873))

(assert (=> b!786630 m!727827))

(assert (=> b!786630 m!727827))

(declare-fun m!727875 () Bool)

(assert (=> b!786630 m!727875))

(declare-fun m!727877 () Bool)

(assert (=> b!786634 m!727877))

(check-sat (not b!786619) (not b!786614) (not b!786616) (not b!786628) (not b!786626) (not b!786615) (not b!786629) (not b!786622) (not start!67736) (not b!786630) (not b!786632) (not b!786617) (not b!786634) (not b!786618) (not b!786623))
(check-sat)
