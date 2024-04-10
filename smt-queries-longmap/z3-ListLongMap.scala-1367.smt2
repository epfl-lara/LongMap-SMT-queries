; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26858 () Bool)

(assert start!26858)

(declare-fun b!278637 () Bool)

(declare-fun res!142070 () Bool)

(declare-fun e!177705 () Bool)

(assert (=> b!278637 (=> (not res!142070) (not e!177705))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278637 (= res!142070 (validKeyInArray!0 k0!2581))))

(declare-fun b!278638 () Bool)

(declare-fun res!142073 () Bool)

(assert (=> b!278638 (=> (not res!142073) (not e!177705))))

(declare-datatypes ((array!13862 0))(
  ( (array!13863 (arr!6579 (Array (_ BitVec 32) (_ BitVec 64))) (size!6931 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13862)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!278638 (= res!142073 (and (= (size!6931 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6931 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6931 a!3325))))))

(declare-fun b!278639 () Bool)

(declare-fun res!142068 () Bool)

(assert (=> b!278639 (=> (not res!142068) (not e!177705))))

(declare-fun arrayContainsKey!0 (array!13862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278639 (= res!142068 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278640 () Bool)

(declare-fun e!177707 () Bool)

(assert (=> b!278640 (= e!177707 (bvsge (size!6931 a!3325) #b01111111111111111111111111111111))))

(declare-fun res!142071 () Bool)

(assert (=> start!26858 (=> (not res!142071) (not e!177705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26858 (= res!142071 (validMask!0 mask!3868))))

(assert (=> start!26858 e!177705))

(declare-fun array_inv!4542 (array!13862) Bool)

(assert (=> start!26858 (array_inv!4542 a!3325)))

(assert (=> start!26858 true))

(declare-fun b!278641 () Bool)

(declare-fun res!142072 () Bool)

(assert (=> b!278641 (=> (not res!142072) (not e!177707))))

(assert (=> b!278641 (= res!142072 (not (= startIndex!26 i!1267)))))

(declare-fun b!278642 () Bool)

(assert (=> b!278642 (= e!177705 e!177707)))

(declare-fun res!142066 () Bool)

(assert (=> b!278642 (=> (not res!142066) (not e!177707))))

(declare-datatypes ((SeekEntryResult!1737 0))(
  ( (MissingZero!1737 (index!9118 (_ BitVec 32))) (Found!1737 (index!9119 (_ BitVec 32))) (Intermediate!1737 (undefined!2549 Bool) (index!9120 (_ BitVec 32)) (x!27367 (_ BitVec 32))) (Undefined!1737) (MissingVacant!1737 (index!9121 (_ BitVec 32))) )
))
(declare-fun lt!138433 () SeekEntryResult!1737)

(assert (=> b!278642 (= res!142066 (or (= lt!138433 (MissingZero!1737 i!1267)) (= lt!138433 (MissingVacant!1737 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13862 (_ BitVec 32)) SeekEntryResult!1737)

(assert (=> b!278642 (= lt!138433 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!278643 () Bool)

(declare-fun res!142069 () Bool)

(assert (=> b!278643 (=> (not res!142069) (not e!177707))))

(assert (=> b!278643 (= res!142069 (validKeyInArray!0 (select (arr!6579 a!3325) startIndex!26)))))

(declare-fun b!278644 () Bool)

(declare-fun res!142074 () Bool)

(assert (=> b!278644 (=> (not res!142074) (not e!177707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13862 (_ BitVec 32)) Bool)

(assert (=> b!278644 (= res!142074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278645 () Bool)

(declare-fun res!142067 () Bool)

(assert (=> b!278645 (=> (not res!142067) (not e!177705))))

(declare-datatypes ((List!4387 0))(
  ( (Nil!4384) (Cons!4383 (h!5053 (_ BitVec 64)) (t!9469 List!4387)) )
))
(declare-fun arrayNoDuplicates!0 (array!13862 (_ BitVec 32) List!4387) Bool)

(assert (=> b!278645 (= res!142067 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4384))))

(assert (= (and start!26858 res!142071) b!278638))

(assert (= (and b!278638 res!142073) b!278637))

(assert (= (and b!278637 res!142070) b!278645))

(assert (= (and b!278645 res!142067) b!278639))

(assert (= (and b!278639 res!142068) b!278642))

(assert (= (and b!278642 res!142066) b!278644))

(assert (= (and b!278644 res!142074) b!278641))

(assert (= (and b!278641 res!142072) b!278643))

(assert (= (and b!278643 res!142069) b!278640))

(declare-fun m!293655 () Bool)

(assert (=> b!278644 m!293655))

(declare-fun m!293657 () Bool)

(assert (=> b!278642 m!293657))

(declare-fun m!293659 () Bool)

(assert (=> b!278643 m!293659))

(assert (=> b!278643 m!293659))

(declare-fun m!293661 () Bool)

(assert (=> b!278643 m!293661))

(declare-fun m!293663 () Bool)

(assert (=> start!26858 m!293663))

(declare-fun m!293665 () Bool)

(assert (=> start!26858 m!293665))

(declare-fun m!293667 () Bool)

(assert (=> b!278639 m!293667))

(declare-fun m!293669 () Bool)

(assert (=> b!278645 m!293669))

(declare-fun m!293671 () Bool)

(assert (=> b!278637 m!293671))

(check-sat (not b!278639) (not b!278643) (not b!278645) (not b!278637) (not start!26858) (not b!278642) (not b!278644))
(check-sat)
(get-model)

(declare-fun b!278683 () Bool)

(declare-fun e!177726 () Bool)

(declare-fun call!25390 () Bool)

(assert (=> b!278683 (= e!177726 call!25390)))

(declare-fun b!278685 () Bool)

(declare-fun e!177725 () Bool)

(declare-fun e!177728 () Bool)

(assert (=> b!278685 (= e!177725 e!177728)))

(declare-fun res!142110 () Bool)

(assert (=> b!278685 (=> (not res!142110) (not e!177728))))

(declare-fun e!177727 () Bool)

(assert (=> b!278685 (= res!142110 (not e!177727))))

(declare-fun res!142108 () Bool)

(assert (=> b!278685 (=> (not res!142108) (not e!177727))))

(assert (=> b!278685 (= res!142108 (validKeyInArray!0 (select (arr!6579 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25387 () Bool)

(declare-fun c!45840 () Bool)

(assert (=> bm!25387 (= call!25390 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45840 (Cons!4383 (select (arr!6579 a!3325) #b00000000000000000000000000000000) Nil!4384) Nil!4384)))))

(declare-fun b!278686 () Bool)

(assert (=> b!278686 (= e!177726 call!25390)))

(declare-fun b!278687 () Bool)

(declare-fun contains!1964 (List!4387 (_ BitVec 64)) Bool)

(assert (=> b!278687 (= e!177727 (contains!1964 Nil!4384 (select (arr!6579 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278684 () Bool)

(assert (=> b!278684 (= e!177728 e!177726)))

(assert (=> b!278684 (= c!45840 (validKeyInArray!0 (select (arr!6579 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64929 () Bool)

(declare-fun res!142109 () Bool)

(assert (=> d!64929 (=> res!142109 e!177725)))

(assert (=> d!64929 (= res!142109 (bvsge #b00000000000000000000000000000000 (size!6931 a!3325)))))

(assert (=> d!64929 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4384) e!177725)))

(assert (= (and d!64929 (not res!142109)) b!278685))

(assert (= (and b!278685 res!142108) b!278687))

(assert (= (and b!278685 res!142110) b!278684))

(assert (= (and b!278684 c!45840) b!278683))

(assert (= (and b!278684 (not c!45840)) b!278686))

(assert (= (or b!278683 b!278686) bm!25387))

(declare-fun m!293691 () Bool)

(assert (=> b!278685 m!293691))

(assert (=> b!278685 m!293691))

(declare-fun m!293693 () Bool)

(assert (=> b!278685 m!293693))

(assert (=> bm!25387 m!293691))

(declare-fun m!293695 () Bool)

(assert (=> bm!25387 m!293695))

(assert (=> b!278687 m!293691))

(assert (=> b!278687 m!293691))

(declare-fun m!293697 () Bool)

(assert (=> b!278687 m!293697))

(assert (=> b!278684 m!293691))

(assert (=> b!278684 m!293691))

(assert (=> b!278684 m!293693))

(assert (=> b!278645 d!64929))

(declare-fun d!64931 () Bool)

(assert (=> d!64931 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26858 d!64931))

(declare-fun d!64939 () Bool)

(assert (=> d!64939 (= (array_inv!4542 a!3325) (bvsge (size!6931 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26858 d!64939))

(declare-fun d!64943 () Bool)

(assert (=> d!64943 (= (validKeyInArray!0 (select (arr!6579 a!3325) startIndex!26)) (and (not (= (select (arr!6579 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6579 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278643 d!64943))

(declare-fun e!177783 () SeekEntryResult!1737)

(declare-fun b!278760 () Bool)

(declare-fun lt!138463 () SeekEntryResult!1737)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13862 (_ BitVec 32)) SeekEntryResult!1737)

(assert (=> b!278760 (= e!177783 (seekKeyOrZeroReturnVacant!0 (x!27367 lt!138463) (index!9120 lt!138463) (index!9120 lt!138463) k0!2581 a!3325 mask!3868))))

(declare-fun b!278761 () Bool)

(assert (=> b!278761 (= e!177783 (MissingZero!1737 (index!9120 lt!138463)))))

(declare-fun b!278762 () Bool)

(declare-fun e!177784 () SeekEntryResult!1737)

(assert (=> b!278762 (= e!177784 (Found!1737 (index!9120 lt!138463)))))

(declare-fun d!64945 () Bool)

(declare-fun lt!138462 () SeekEntryResult!1737)

(get-info :version)

(assert (=> d!64945 (and (or ((_ is Undefined!1737) lt!138462) (not ((_ is Found!1737) lt!138462)) (and (bvsge (index!9119 lt!138462) #b00000000000000000000000000000000) (bvslt (index!9119 lt!138462) (size!6931 a!3325)))) (or ((_ is Undefined!1737) lt!138462) ((_ is Found!1737) lt!138462) (not ((_ is MissingZero!1737) lt!138462)) (and (bvsge (index!9118 lt!138462) #b00000000000000000000000000000000) (bvslt (index!9118 lt!138462) (size!6931 a!3325)))) (or ((_ is Undefined!1737) lt!138462) ((_ is Found!1737) lt!138462) ((_ is MissingZero!1737) lt!138462) (not ((_ is MissingVacant!1737) lt!138462)) (and (bvsge (index!9121 lt!138462) #b00000000000000000000000000000000) (bvslt (index!9121 lt!138462) (size!6931 a!3325)))) (or ((_ is Undefined!1737) lt!138462) (ite ((_ is Found!1737) lt!138462) (= (select (arr!6579 a!3325) (index!9119 lt!138462)) k0!2581) (ite ((_ is MissingZero!1737) lt!138462) (= (select (arr!6579 a!3325) (index!9118 lt!138462)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1737) lt!138462) (= (select (arr!6579 a!3325) (index!9121 lt!138462)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!177785 () SeekEntryResult!1737)

(assert (=> d!64945 (= lt!138462 e!177785)))

(declare-fun c!45861 () Bool)

(assert (=> d!64945 (= c!45861 (and ((_ is Intermediate!1737) lt!138463) (undefined!2549 lt!138463)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13862 (_ BitVec 32)) SeekEntryResult!1737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64945 (= lt!138463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!64945 (validMask!0 mask!3868)))

(assert (=> d!64945 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138462)))

(declare-fun b!278763 () Bool)

(assert (=> b!278763 (= e!177785 e!177784)))

(declare-fun lt!138461 () (_ BitVec 64))

(assert (=> b!278763 (= lt!138461 (select (arr!6579 a!3325) (index!9120 lt!138463)))))

(declare-fun c!45859 () Bool)

(assert (=> b!278763 (= c!45859 (= lt!138461 k0!2581))))

(declare-fun b!278764 () Bool)

(assert (=> b!278764 (= e!177785 Undefined!1737)))

(declare-fun b!278765 () Bool)

(declare-fun c!45860 () Bool)

(assert (=> b!278765 (= c!45860 (= lt!138461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278765 (= e!177784 e!177783)))

(assert (= (and d!64945 c!45861) b!278764))

(assert (= (and d!64945 (not c!45861)) b!278763))

(assert (= (and b!278763 c!45859) b!278762))

(assert (= (and b!278763 (not c!45859)) b!278765))

(assert (= (and b!278765 c!45860) b!278761))

(assert (= (and b!278765 (not c!45860)) b!278760))

(declare-fun m!293733 () Bool)

(assert (=> b!278760 m!293733))

(declare-fun m!293735 () Bool)

(assert (=> d!64945 m!293735))

(declare-fun m!293737 () Bool)

(assert (=> d!64945 m!293737))

(assert (=> d!64945 m!293663))

(declare-fun m!293739 () Bool)

(assert (=> d!64945 m!293739))

(declare-fun m!293741 () Bool)

(assert (=> d!64945 m!293741))

(assert (=> d!64945 m!293737))

(declare-fun m!293743 () Bool)

(assert (=> d!64945 m!293743))

(declare-fun m!293745 () Bool)

(assert (=> b!278763 m!293745))

(assert (=> b!278642 d!64945))

(declare-fun d!64959 () Bool)

(assert (=> d!64959 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278637 d!64959))

(declare-fun bm!25402 () Bool)

(declare-fun call!25405 () Bool)

(assert (=> bm!25402 (= call!25405 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!278786 () Bool)

(declare-fun e!177799 () Bool)

(declare-fun e!177800 () Bool)

(assert (=> b!278786 (= e!177799 e!177800)))

(declare-fun c!45870 () Bool)

(assert (=> b!278786 (= c!45870 (validKeyInArray!0 (select (arr!6579 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278787 () Bool)

(declare-fun e!177798 () Bool)

(assert (=> b!278787 (= e!177798 call!25405)))

(declare-fun d!64961 () Bool)

(declare-fun res!142152 () Bool)

(assert (=> d!64961 (=> res!142152 e!177799)))

(assert (=> d!64961 (= res!142152 (bvsge #b00000000000000000000000000000000 (size!6931 a!3325)))))

(assert (=> d!64961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177799)))

(declare-fun b!278788 () Bool)

(assert (=> b!278788 (= e!177800 call!25405)))

(declare-fun b!278789 () Bool)

(assert (=> b!278789 (= e!177800 e!177798)))

(declare-fun lt!138477 () (_ BitVec 64))

(assert (=> b!278789 (= lt!138477 (select (arr!6579 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8802 0))(
  ( (Unit!8803) )
))
(declare-fun lt!138476 () Unit!8802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13862 (_ BitVec 64) (_ BitVec 32)) Unit!8802)

(assert (=> b!278789 (= lt!138476 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138477 #b00000000000000000000000000000000))))

(assert (=> b!278789 (arrayContainsKey!0 a!3325 lt!138477 #b00000000000000000000000000000000)))

(declare-fun lt!138478 () Unit!8802)

(assert (=> b!278789 (= lt!138478 lt!138476)))

(declare-fun res!142151 () Bool)

(assert (=> b!278789 (= res!142151 (= (seekEntryOrOpen!0 (select (arr!6579 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1737 #b00000000000000000000000000000000)))))

(assert (=> b!278789 (=> (not res!142151) (not e!177798))))

(assert (= (and d!64961 (not res!142152)) b!278786))

(assert (= (and b!278786 c!45870) b!278789))

(assert (= (and b!278786 (not c!45870)) b!278788))

(assert (= (and b!278789 res!142151) b!278787))

(assert (= (or b!278787 b!278788) bm!25402))

(declare-fun m!293747 () Bool)

(assert (=> bm!25402 m!293747))

(assert (=> b!278786 m!293691))

(assert (=> b!278786 m!293691))

(assert (=> b!278786 m!293693))

(assert (=> b!278789 m!293691))

(declare-fun m!293749 () Bool)

(assert (=> b!278789 m!293749))

(declare-fun m!293751 () Bool)

(assert (=> b!278789 m!293751))

(assert (=> b!278789 m!293691))

(declare-fun m!293753 () Bool)

(assert (=> b!278789 m!293753))

(assert (=> b!278644 d!64961))

(declare-fun d!64963 () Bool)

(declare-fun res!142157 () Bool)

(declare-fun e!177808 () Bool)

(assert (=> d!64963 (=> res!142157 e!177808)))

(assert (=> d!64963 (= res!142157 (= (select (arr!6579 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!64963 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!177808)))

(declare-fun b!278800 () Bool)

(declare-fun e!177809 () Bool)

(assert (=> b!278800 (= e!177808 e!177809)))

(declare-fun res!142158 () Bool)

(assert (=> b!278800 (=> (not res!142158) (not e!177809))))

(assert (=> b!278800 (= res!142158 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6931 a!3325)))))

(declare-fun b!278801 () Bool)

(assert (=> b!278801 (= e!177809 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64963 (not res!142157)) b!278800))

(assert (= (and b!278800 res!142158) b!278801))

(assert (=> d!64963 m!293691))

(declare-fun m!293769 () Bool)

(assert (=> b!278801 m!293769))

(assert (=> b!278639 d!64963))

(check-sat (not b!278685) (not b!278687) (not bm!25402) (not bm!25387) (not b!278786) (not b!278801) (not b!278789) (not d!64945) (not b!278684) (not b!278760))
(check-sat)
