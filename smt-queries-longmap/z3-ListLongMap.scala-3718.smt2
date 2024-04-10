; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51106 () Bool)

(assert start!51106)

(declare-fun res!350492 () Bool)

(declare-fun e!321801 () Bool)

(assert (=> start!51106 (=> (not res!350492) (not e!321801))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51106 (= res!350492 (validMask!0 mask!3119))))

(assert (=> start!51106 e!321801))

(assert (=> start!51106 true))

(declare-datatypes ((array!35160 0))(
  ( (array!35161 (arr!16885 (Array (_ BitVec 32) (_ BitVec 64))) (size!17249 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35160)

(declare-fun array_inv!12681 (array!35160) Bool)

(assert (=> start!51106 (array_inv!12681 a!3118)))

(declare-fun b!558619 () Bool)

(declare-fun e!321797 () Bool)

(declare-fun e!321800 () Bool)

(assert (=> b!558619 (= e!321797 e!321800)))

(declare-fun res!350485 () Bool)

(assert (=> b!558619 (=> res!350485 e!321800)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5334 0))(
  ( (MissingZero!5334 (index!23563 (_ BitVec 32))) (Found!5334 (index!23564 (_ BitVec 32))) (Intermediate!5334 (undefined!6146 Bool) (index!23565 (_ BitVec 32)) (x!52458 (_ BitVec 32))) (Undefined!5334) (MissingVacant!5334 (index!23566 (_ BitVec 32))) )
))
(declare-fun lt!253874 () SeekEntryResult!5334)

(get-info :version)

(assert (=> b!558619 (= res!350485 (or (undefined!6146 lt!253874) (not ((_ is Intermediate!5334) lt!253874)) (= (select (arr!16885 a!3118) (index!23565 lt!253874)) (select (arr!16885 a!3118) j!142)) (= (select (arr!16885 a!3118) (index!23565 lt!253874)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558620 () Bool)

(declare-fun res!350483 () Bool)

(declare-fun e!321798 () Bool)

(assert (=> b!558620 (=> (not res!350483) (not e!321798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35160 (_ BitVec 32)) Bool)

(assert (=> b!558620 (= res!350483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558621 () Bool)

(declare-fun res!350487 () Bool)

(assert (=> b!558621 (=> (not res!350487) (not e!321801))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558621 (= res!350487 (and (= (size!17249 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17249 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17249 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558622 () Bool)

(declare-fun res!350490 () Bool)

(assert (=> b!558622 (=> (not res!350490) (not e!321798))))

(declare-datatypes ((List!10965 0))(
  ( (Nil!10962) (Cons!10961 (h!11955 (_ BitVec 64)) (t!17193 List!10965)) )
))
(declare-fun arrayNoDuplicates!0 (array!35160 (_ BitVec 32) List!10965) Bool)

(assert (=> b!558622 (= res!350490 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10962))))

(declare-fun b!558623 () Bool)

(declare-fun e!321796 () Bool)

(assert (=> b!558623 (= e!321796 (not (or (undefined!6146 lt!253874) (not ((_ is Intermediate!5334) lt!253874)) (= (select (arr!16885 a!3118) (index!23565 lt!253874)) (select (arr!16885 a!3118) j!142)) (= (select (arr!16885 a!3118) (index!23565 lt!253874)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge (index!23565 lt!253874) #b00000000000000000000000000000000) (bvslt (index!23565 lt!253874) (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(assert (=> b!558623 e!321797))

(declare-fun res!350488 () Bool)

(assert (=> b!558623 (=> (not res!350488) (not e!321797))))

(declare-fun lt!253878 () SeekEntryResult!5334)

(assert (=> b!558623 (= res!350488 (= lt!253878 (Found!5334 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35160 (_ BitVec 32)) SeekEntryResult!5334)

(assert (=> b!558623 (= lt!253878 (seekEntryOrOpen!0 (select (arr!16885 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558623 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17442 0))(
  ( (Unit!17443) )
))
(declare-fun lt!253875 () Unit!17442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17442)

(assert (=> b!558623 (= lt!253875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558624 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35160 (_ BitVec 32)) SeekEntryResult!5334)

(assert (=> b!558624 (= e!321800 (= lt!253878 (seekKeyOrZeroReturnVacant!0 (x!52458 lt!253874) (index!23565 lt!253874) (index!23565 lt!253874) (select (arr!16885 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558625 () Bool)

(assert (=> b!558625 (= e!321798 e!321796)))

(declare-fun res!350491 () Bool)

(assert (=> b!558625 (=> (not res!350491) (not e!321796))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!253876 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35160 (_ BitVec 32)) SeekEntryResult!5334)

(assert (=> b!558625 (= res!350491 (= lt!253874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253876 (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) (array!35161 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118)) mask!3119)))))

(declare-fun lt!253877 () (_ BitVec 32))

(assert (=> b!558625 (= lt!253874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253877 (select (arr!16885 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558625 (= lt!253876 (toIndex!0 (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558625 (= lt!253877 (toIndex!0 (select (arr!16885 a!3118) j!142) mask!3119))))

(declare-fun b!558626 () Bool)

(assert (=> b!558626 (= e!321801 e!321798)))

(declare-fun res!350484 () Bool)

(assert (=> b!558626 (=> (not res!350484) (not e!321798))))

(declare-fun lt!253879 () SeekEntryResult!5334)

(assert (=> b!558626 (= res!350484 (or (= lt!253879 (MissingZero!5334 i!1132)) (= lt!253879 (MissingVacant!5334 i!1132))))))

(assert (=> b!558626 (= lt!253879 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558627 () Bool)

(declare-fun res!350486 () Bool)

(assert (=> b!558627 (=> (not res!350486) (not e!321801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558627 (= res!350486 (validKeyInArray!0 k0!1914))))

(declare-fun b!558628 () Bool)

(declare-fun res!350482 () Bool)

(assert (=> b!558628 (=> (not res!350482) (not e!321801))))

(declare-fun arrayContainsKey!0 (array!35160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558628 (= res!350482 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558629 () Bool)

(declare-fun res!350489 () Bool)

(assert (=> b!558629 (=> (not res!350489) (not e!321801))))

(assert (=> b!558629 (= res!350489 (validKeyInArray!0 (select (arr!16885 a!3118) j!142)))))

(assert (= (and start!51106 res!350492) b!558621))

(assert (= (and b!558621 res!350487) b!558629))

(assert (= (and b!558629 res!350489) b!558627))

(assert (= (and b!558627 res!350486) b!558628))

(assert (= (and b!558628 res!350482) b!558626))

(assert (= (and b!558626 res!350484) b!558620))

(assert (= (and b!558620 res!350483) b!558622))

(assert (= (and b!558622 res!350490) b!558625))

(assert (= (and b!558625 res!350491) b!558623))

(assert (= (and b!558623 res!350488) b!558619))

(assert (= (and b!558619 (not res!350485)) b!558624))

(declare-fun m!536635 () Bool)

(assert (=> b!558623 m!536635))

(declare-fun m!536637 () Bool)

(assert (=> b!558623 m!536637))

(declare-fun m!536639 () Bool)

(assert (=> b!558623 m!536639))

(declare-fun m!536641 () Bool)

(assert (=> b!558623 m!536641))

(assert (=> b!558623 m!536637))

(declare-fun m!536643 () Bool)

(assert (=> b!558623 m!536643))

(declare-fun m!536645 () Bool)

(assert (=> b!558622 m!536645))

(declare-fun m!536647 () Bool)

(assert (=> b!558627 m!536647))

(assert (=> b!558624 m!536637))

(assert (=> b!558624 m!536637))

(declare-fun m!536649 () Bool)

(assert (=> b!558624 m!536649))

(assert (=> b!558625 m!536637))

(declare-fun m!536651 () Bool)

(assert (=> b!558625 m!536651))

(declare-fun m!536653 () Bool)

(assert (=> b!558625 m!536653))

(declare-fun m!536655 () Bool)

(assert (=> b!558625 m!536655))

(assert (=> b!558625 m!536637))

(assert (=> b!558625 m!536653))

(declare-fun m!536657 () Bool)

(assert (=> b!558625 m!536657))

(assert (=> b!558625 m!536637))

(declare-fun m!536659 () Bool)

(assert (=> b!558625 m!536659))

(assert (=> b!558625 m!536653))

(declare-fun m!536661 () Bool)

(assert (=> b!558625 m!536661))

(declare-fun m!536663 () Bool)

(assert (=> b!558626 m!536663))

(assert (=> b!558629 m!536637))

(assert (=> b!558629 m!536637))

(declare-fun m!536665 () Bool)

(assert (=> b!558629 m!536665))

(declare-fun m!536667 () Bool)

(assert (=> b!558620 m!536667))

(assert (=> b!558619 m!536635))

(assert (=> b!558619 m!536637))

(declare-fun m!536669 () Bool)

(assert (=> start!51106 m!536669))

(declare-fun m!536671 () Bool)

(assert (=> start!51106 m!536671))

(declare-fun m!536673 () Bool)

(assert (=> b!558628 m!536673))

(check-sat (not b!558629) (not b!558627) (not b!558620) (not b!558628) (not b!558623) (not b!558626) (not start!51106) (not b!558624) (not b!558625) (not b!558622))
(check-sat)
(get-model)

(declare-fun b!558675 () Bool)

(declare-fun e!321827 () SeekEntryResult!5334)

(assert (=> b!558675 (= e!321827 Undefined!5334)))

(declare-fun b!558676 () Bool)

(declare-fun e!321826 () SeekEntryResult!5334)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558676 (= e!321826 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52458 lt!253874) #b00000000000000000000000000000001) (nextIndex!0 (index!23565 lt!253874) (x!52458 lt!253874) mask!3119) (index!23565 lt!253874) (select (arr!16885 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558677 () Bool)

(declare-fun c!64418 () Bool)

(declare-fun lt!253902 () (_ BitVec 64))

(assert (=> b!558677 (= c!64418 (= lt!253902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321828 () SeekEntryResult!5334)

(assert (=> b!558677 (= e!321828 e!321826)))

(declare-fun b!558679 () Bool)

(assert (=> b!558679 (= e!321828 (Found!5334 (index!23565 lt!253874)))))

(declare-fun b!558680 () Bool)

(assert (=> b!558680 (= e!321826 (MissingVacant!5334 (index!23565 lt!253874)))))

(declare-fun d!83581 () Bool)

(declare-fun lt!253903 () SeekEntryResult!5334)

(assert (=> d!83581 (and (or ((_ is Undefined!5334) lt!253903) (not ((_ is Found!5334) lt!253903)) (and (bvsge (index!23564 lt!253903) #b00000000000000000000000000000000) (bvslt (index!23564 lt!253903) (size!17249 a!3118)))) (or ((_ is Undefined!5334) lt!253903) ((_ is Found!5334) lt!253903) (not ((_ is MissingVacant!5334) lt!253903)) (not (= (index!23566 lt!253903) (index!23565 lt!253874))) (and (bvsge (index!23566 lt!253903) #b00000000000000000000000000000000) (bvslt (index!23566 lt!253903) (size!17249 a!3118)))) (or ((_ is Undefined!5334) lt!253903) (ite ((_ is Found!5334) lt!253903) (= (select (arr!16885 a!3118) (index!23564 lt!253903)) (select (arr!16885 a!3118) j!142)) (and ((_ is MissingVacant!5334) lt!253903) (= (index!23566 lt!253903) (index!23565 lt!253874)) (= (select (arr!16885 a!3118) (index!23566 lt!253903)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!83581 (= lt!253903 e!321827)))

(declare-fun c!64416 () Bool)

(assert (=> d!83581 (= c!64416 (bvsge (x!52458 lt!253874) #b01111111111111111111111111111110))))

(assert (=> d!83581 (= lt!253902 (select (arr!16885 a!3118) (index!23565 lt!253874)))))

(assert (=> d!83581 (validMask!0 mask!3119)))

(assert (=> d!83581 (= (seekKeyOrZeroReturnVacant!0 (x!52458 lt!253874) (index!23565 lt!253874) (index!23565 lt!253874) (select (arr!16885 a!3118) j!142) a!3118 mask!3119) lt!253903)))

(declare-fun b!558678 () Bool)

(assert (=> b!558678 (= e!321827 e!321828)))

(declare-fun c!64417 () Bool)

(assert (=> b!558678 (= c!64417 (= lt!253902 (select (arr!16885 a!3118) j!142)))))

(assert (= (and d!83581 c!64416) b!558675))

(assert (= (and d!83581 (not c!64416)) b!558678))

(assert (= (and b!558678 c!64417) b!558679))

(assert (= (and b!558678 (not c!64417)) b!558677))

(assert (= (and b!558677 c!64418) b!558680))

(assert (= (and b!558677 (not c!64418)) b!558676))

(declare-fun m!536715 () Bool)

(assert (=> b!558676 m!536715))

(assert (=> b!558676 m!536715))

(assert (=> b!558676 m!536637))

(declare-fun m!536717 () Bool)

(assert (=> b!558676 m!536717))

(declare-fun m!536719 () Bool)

(assert (=> d!83581 m!536719))

(declare-fun m!536721 () Bool)

(assert (=> d!83581 m!536721))

(assert (=> d!83581 m!536635))

(assert (=> d!83581 m!536669))

(assert (=> b!558624 d!83581))

(declare-fun d!83583 () Bool)

(assert (=> d!83583 (= (validKeyInArray!0 (select (arr!16885 a!3118) j!142)) (and (not (= (select (arr!16885 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16885 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558629 d!83583))

(declare-fun d!83587 () Bool)

(declare-fun res!350530 () Bool)

(declare-fun e!321833 () Bool)

(assert (=> d!83587 (=> res!350530 e!321833)))

(assert (=> d!83587 (= res!350530 (= (select (arr!16885 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83587 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!321833)))

(declare-fun b!558685 () Bool)

(declare-fun e!321834 () Bool)

(assert (=> b!558685 (= e!321833 e!321834)))

(declare-fun res!350531 () Bool)

(assert (=> b!558685 (=> (not res!350531) (not e!321834))))

(assert (=> b!558685 (= res!350531 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17249 a!3118)))))

(declare-fun b!558686 () Bool)

(assert (=> b!558686 (= e!321834 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83587 (not res!350530)) b!558685))

(assert (= (and b!558685 res!350531) b!558686))

(declare-fun m!536723 () Bool)

(assert (=> d!83587 m!536723))

(declare-fun m!536725 () Bool)

(assert (=> b!558686 m!536725))

(assert (=> b!558628 d!83587))

(declare-fun b!558735 () Bool)

(declare-fun e!321866 () SeekEntryResult!5334)

(declare-fun lt!253927 () SeekEntryResult!5334)

(assert (=> b!558735 (= e!321866 (MissingZero!5334 (index!23565 lt!253927)))))

(declare-fun b!558737 () Bool)

(declare-fun c!64437 () Bool)

(declare-fun lt!253926 () (_ BitVec 64))

(assert (=> b!558737 (= c!64437 (= lt!253926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321865 () SeekEntryResult!5334)

(assert (=> b!558737 (= e!321865 e!321866)))

(declare-fun b!558738 () Bool)

(assert (=> b!558738 (= e!321866 (seekKeyOrZeroReturnVacant!0 (x!52458 lt!253927) (index!23565 lt!253927) (index!23565 lt!253927) (select (arr!16885 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558739 () Bool)

(assert (=> b!558739 (= e!321865 (Found!5334 (index!23565 lt!253927)))))

(declare-fun b!558740 () Bool)

(declare-fun e!321867 () SeekEntryResult!5334)

(assert (=> b!558740 (= e!321867 e!321865)))

(assert (=> b!558740 (= lt!253926 (select (arr!16885 a!3118) (index!23565 lt!253927)))))

(declare-fun c!64438 () Bool)

(assert (=> b!558740 (= c!64438 (= lt!253926 (select (arr!16885 a!3118) j!142)))))

(declare-fun b!558736 () Bool)

(assert (=> b!558736 (= e!321867 Undefined!5334)))

(declare-fun d!83589 () Bool)

(declare-fun lt!253925 () SeekEntryResult!5334)

(assert (=> d!83589 (and (or ((_ is Undefined!5334) lt!253925) (not ((_ is Found!5334) lt!253925)) (and (bvsge (index!23564 lt!253925) #b00000000000000000000000000000000) (bvslt (index!23564 lt!253925) (size!17249 a!3118)))) (or ((_ is Undefined!5334) lt!253925) ((_ is Found!5334) lt!253925) (not ((_ is MissingZero!5334) lt!253925)) (and (bvsge (index!23563 lt!253925) #b00000000000000000000000000000000) (bvslt (index!23563 lt!253925) (size!17249 a!3118)))) (or ((_ is Undefined!5334) lt!253925) ((_ is Found!5334) lt!253925) ((_ is MissingZero!5334) lt!253925) (not ((_ is MissingVacant!5334) lt!253925)) (and (bvsge (index!23566 lt!253925) #b00000000000000000000000000000000) (bvslt (index!23566 lt!253925) (size!17249 a!3118)))) (or ((_ is Undefined!5334) lt!253925) (ite ((_ is Found!5334) lt!253925) (= (select (arr!16885 a!3118) (index!23564 lt!253925)) (select (arr!16885 a!3118) j!142)) (ite ((_ is MissingZero!5334) lt!253925) (= (select (arr!16885 a!3118) (index!23563 lt!253925)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5334) lt!253925) (= (select (arr!16885 a!3118) (index!23566 lt!253925)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83589 (= lt!253925 e!321867)))

(declare-fun c!64439 () Bool)

(assert (=> d!83589 (= c!64439 (and ((_ is Intermediate!5334) lt!253927) (undefined!6146 lt!253927)))))

(assert (=> d!83589 (= lt!253927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16885 a!3118) j!142) mask!3119) (select (arr!16885 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83589 (validMask!0 mask!3119)))

(assert (=> d!83589 (= (seekEntryOrOpen!0 (select (arr!16885 a!3118) j!142) a!3118 mask!3119) lt!253925)))

(assert (= (and d!83589 c!64439) b!558736))

(assert (= (and d!83589 (not c!64439)) b!558740))

(assert (= (and b!558740 c!64438) b!558739))

(assert (= (and b!558740 (not c!64438)) b!558737))

(assert (= (and b!558737 c!64437) b!558735))

(assert (= (and b!558737 (not c!64437)) b!558738))

(assert (=> b!558738 m!536637))

(declare-fun m!536749 () Bool)

(assert (=> b!558738 m!536749))

(declare-fun m!536751 () Bool)

(assert (=> b!558740 m!536751))

(assert (=> d!83589 m!536669))

(assert (=> d!83589 m!536651))

(assert (=> d!83589 m!536637))

(declare-fun m!536753 () Bool)

(assert (=> d!83589 m!536753))

(declare-fun m!536755 () Bool)

(assert (=> d!83589 m!536755))

(declare-fun m!536757 () Bool)

(assert (=> d!83589 m!536757))

(declare-fun m!536759 () Bool)

(assert (=> d!83589 m!536759))

(assert (=> d!83589 m!536637))

(assert (=> d!83589 m!536651))

(assert (=> b!558623 d!83589))

(declare-fun b!558779 () Bool)

(declare-fun e!321891 () Bool)

(declare-fun e!321890 () Bool)

(assert (=> b!558779 (= e!321891 e!321890)))

(declare-fun c!64457 () Bool)

(assert (=> b!558779 (= c!64457 (validKeyInArray!0 (select (arr!16885 a!3118) j!142)))))

(declare-fun bm!32396 () Bool)

(declare-fun call!32399 () Bool)

(assert (=> bm!32396 (= call!32399 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!558780 () Bool)

(assert (=> b!558780 (= e!321890 call!32399)))

(declare-fun b!558781 () Bool)

(declare-fun e!321889 () Bool)

(assert (=> b!558781 (= e!321890 e!321889)))

(declare-fun lt!253950 () (_ BitVec 64))

(assert (=> b!558781 (= lt!253950 (select (arr!16885 a!3118) j!142))))

(declare-fun lt!253951 () Unit!17442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35160 (_ BitVec 64) (_ BitVec 32)) Unit!17442)

(assert (=> b!558781 (= lt!253951 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253950 j!142))))

(assert (=> b!558781 (arrayContainsKey!0 a!3118 lt!253950 #b00000000000000000000000000000000)))

(declare-fun lt!253949 () Unit!17442)

(assert (=> b!558781 (= lt!253949 lt!253951)))

(declare-fun res!350549 () Bool)

(assert (=> b!558781 (= res!350549 (= (seekEntryOrOpen!0 (select (arr!16885 a!3118) j!142) a!3118 mask!3119) (Found!5334 j!142)))))

(assert (=> b!558781 (=> (not res!350549) (not e!321889))))

(declare-fun b!558782 () Bool)

(assert (=> b!558782 (= e!321889 call!32399)))

(declare-fun d!83601 () Bool)

(declare-fun res!350548 () Bool)

(assert (=> d!83601 (=> res!350548 e!321891)))

(assert (=> d!83601 (= res!350548 (bvsge j!142 (size!17249 a!3118)))))

(assert (=> d!83601 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!321891)))

(assert (= (and d!83601 (not res!350548)) b!558779))

(assert (= (and b!558779 c!64457) b!558781))

(assert (= (and b!558779 (not c!64457)) b!558780))

(assert (= (and b!558781 res!350549) b!558782))

(assert (= (or b!558782 b!558780) bm!32396))

(assert (=> b!558779 m!536637))

(assert (=> b!558779 m!536637))

(assert (=> b!558779 m!536665))

(declare-fun m!536773 () Bool)

(assert (=> bm!32396 m!536773))

(assert (=> b!558781 m!536637))

(declare-fun m!536775 () Bool)

(assert (=> b!558781 m!536775))

(declare-fun m!536777 () Bool)

(assert (=> b!558781 m!536777))

(assert (=> b!558781 m!536637))

(assert (=> b!558781 m!536643))

(assert (=> b!558623 d!83601))

(declare-fun d!83605 () Bool)

(assert (=> d!83605 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253971 () Unit!17442)

(declare-fun choose!38 (array!35160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17442)

(assert (=> d!83605 (= lt!253971 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83605 (validMask!0 mask!3119)))

(assert (=> d!83605 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253971)))

(declare-fun bs!17386 () Bool)

(assert (= bs!17386 d!83605))

(assert (=> bs!17386 m!536639))

(declare-fun m!536811 () Bool)

(assert (=> bs!17386 m!536811))

(assert (=> bs!17386 m!536669))

(assert (=> b!558623 d!83605))

(declare-fun d!83613 () Bool)

(assert (=> d!83613 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51106 d!83613))

(declare-fun d!83629 () Bool)

(assert (=> d!83629 (= (array_inv!12681 a!3118) (bvsge (size!17249 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51106 d!83629))

(declare-fun b!558836 () Bool)

(declare-fun e!321931 () Bool)

(declare-fun e!321933 () Bool)

(assert (=> b!558836 (= e!321931 e!321933)))

(declare-fun c!64473 () Bool)

(assert (=> b!558836 (= c!64473 (validKeyInArray!0 (select (arr!16885 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83631 () Bool)

(declare-fun res!350575 () Bool)

(declare-fun e!321930 () Bool)

(assert (=> d!83631 (=> res!350575 e!321930)))

(assert (=> d!83631 (= res!350575 (bvsge #b00000000000000000000000000000000 (size!17249 a!3118)))))

(assert (=> d!83631 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10962) e!321930)))

(declare-fun b!558837 () Bool)

(declare-fun call!32409 () Bool)

(assert (=> b!558837 (= e!321933 call!32409)))

(declare-fun b!558838 () Bool)

(assert (=> b!558838 (= e!321930 e!321931)))

(declare-fun res!350574 () Bool)

(assert (=> b!558838 (=> (not res!350574) (not e!321931))))

(declare-fun e!321932 () Bool)

(assert (=> b!558838 (= res!350574 (not e!321932))))

(declare-fun res!350573 () Bool)

(assert (=> b!558838 (=> (not res!350573) (not e!321932))))

(assert (=> b!558838 (= res!350573 (validKeyInArray!0 (select (arr!16885 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32406 () Bool)

(assert (=> bm!32406 (= call!32409 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64473 (Cons!10961 (select (arr!16885 a!3118) #b00000000000000000000000000000000) Nil!10962) Nil!10962)))))

(declare-fun b!558839 () Bool)

(assert (=> b!558839 (= e!321933 call!32409)))

(declare-fun b!558840 () Bool)

(declare-fun contains!2855 (List!10965 (_ BitVec 64)) Bool)

(assert (=> b!558840 (= e!321932 (contains!2855 Nil!10962 (select (arr!16885 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83631 (not res!350575)) b!558838))

(assert (= (and b!558838 res!350573) b!558840))

(assert (= (and b!558838 res!350574) b!558836))

(assert (= (and b!558836 c!64473) b!558839))

(assert (= (and b!558836 (not c!64473)) b!558837))

(assert (= (or b!558839 b!558837) bm!32406))

(assert (=> b!558836 m!536723))

(assert (=> b!558836 m!536723))

(declare-fun m!536827 () Bool)

(assert (=> b!558836 m!536827))

(assert (=> b!558838 m!536723))

(assert (=> b!558838 m!536723))

(assert (=> b!558838 m!536827))

(assert (=> bm!32406 m!536723))

(declare-fun m!536829 () Bool)

(assert (=> bm!32406 m!536829))

(assert (=> b!558840 m!536723))

(assert (=> b!558840 m!536723))

(declare-fun m!536831 () Bool)

(assert (=> b!558840 m!536831))

(assert (=> b!558622 d!83631))

(declare-fun d!83635 () Bool)

(assert (=> d!83635 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558627 d!83635))

(declare-fun b!558841 () Bool)

(declare-fun e!321935 () SeekEntryResult!5334)

(declare-fun lt!253981 () SeekEntryResult!5334)

(assert (=> b!558841 (= e!321935 (MissingZero!5334 (index!23565 lt!253981)))))

(declare-fun b!558843 () Bool)

(declare-fun c!64474 () Bool)

(declare-fun lt!253980 () (_ BitVec 64))

(assert (=> b!558843 (= c!64474 (= lt!253980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321934 () SeekEntryResult!5334)

(assert (=> b!558843 (= e!321934 e!321935)))

(declare-fun b!558844 () Bool)

(assert (=> b!558844 (= e!321935 (seekKeyOrZeroReturnVacant!0 (x!52458 lt!253981) (index!23565 lt!253981) (index!23565 lt!253981) k0!1914 a!3118 mask!3119))))

(declare-fun b!558845 () Bool)

(assert (=> b!558845 (= e!321934 (Found!5334 (index!23565 lt!253981)))))

(declare-fun b!558846 () Bool)

(declare-fun e!321936 () SeekEntryResult!5334)

(assert (=> b!558846 (= e!321936 e!321934)))

(assert (=> b!558846 (= lt!253980 (select (arr!16885 a!3118) (index!23565 lt!253981)))))

(declare-fun c!64475 () Bool)

(assert (=> b!558846 (= c!64475 (= lt!253980 k0!1914))))

(declare-fun b!558842 () Bool)

(assert (=> b!558842 (= e!321936 Undefined!5334)))

(declare-fun d!83637 () Bool)

(declare-fun lt!253979 () SeekEntryResult!5334)

(assert (=> d!83637 (and (or ((_ is Undefined!5334) lt!253979) (not ((_ is Found!5334) lt!253979)) (and (bvsge (index!23564 lt!253979) #b00000000000000000000000000000000) (bvslt (index!23564 lt!253979) (size!17249 a!3118)))) (or ((_ is Undefined!5334) lt!253979) ((_ is Found!5334) lt!253979) (not ((_ is MissingZero!5334) lt!253979)) (and (bvsge (index!23563 lt!253979) #b00000000000000000000000000000000) (bvslt (index!23563 lt!253979) (size!17249 a!3118)))) (or ((_ is Undefined!5334) lt!253979) ((_ is Found!5334) lt!253979) ((_ is MissingZero!5334) lt!253979) (not ((_ is MissingVacant!5334) lt!253979)) (and (bvsge (index!23566 lt!253979) #b00000000000000000000000000000000) (bvslt (index!23566 lt!253979) (size!17249 a!3118)))) (or ((_ is Undefined!5334) lt!253979) (ite ((_ is Found!5334) lt!253979) (= (select (arr!16885 a!3118) (index!23564 lt!253979)) k0!1914) (ite ((_ is MissingZero!5334) lt!253979) (= (select (arr!16885 a!3118) (index!23563 lt!253979)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5334) lt!253979) (= (select (arr!16885 a!3118) (index!23566 lt!253979)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83637 (= lt!253979 e!321936)))

(declare-fun c!64476 () Bool)

(assert (=> d!83637 (= c!64476 (and ((_ is Intermediate!5334) lt!253981) (undefined!6146 lt!253981)))))

(assert (=> d!83637 (= lt!253981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83637 (validMask!0 mask!3119)))

(assert (=> d!83637 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!253979)))

(assert (= (and d!83637 c!64476) b!558842))

(assert (= (and d!83637 (not c!64476)) b!558846))

(assert (= (and b!558846 c!64475) b!558845))

(assert (= (and b!558846 (not c!64475)) b!558843))

(assert (= (and b!558843 c!64474) b!558841))

(assert (= (and b!558843 (not c!64474)) b!558844))

(declare-fun m!536833 () Bool)

(assert (=> b!558844 m!536833))

(declare-fun m!536835 () Bool)

(assert (=> b!558846 m!536835))

(assert (=> d!83637 m!536669))

(declare-fun m!536837 () Bool)

(assert (=> d!83637 m!536837))

(declare-fun m!536839 () Bool)

(assert (=> d!83637 m!536839))

(declare-fun m!536841 () Bool)

(assert (=> d!83637 m!536841))

(declare-fun m!536843 () Bool)

(assert (=> d!83637 m!536843))

(declare-fun m!536845 () Bool)

(assert (=> d!83637 m!536845))

(assert (=> d!83637 m!536837))

(assert (=> b!558626 d!83637))

(declare-fun b!558847 () Bool)

(declare-fun e!321939 () Bool)

(declare-fun e!321938 () Bool)

(assert (=> b!558847 (= e!321939 e!321938)))

(declare-fun c!64477 () Bool)

(assert (=> b!558847 (= c!64477 (validKeyInArray!0 (select (arr!16885 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32407 () Bool)

(declare-fun call!32410 () Bool)

(assert (=> bm!32407 (= call!32410 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!558848 () Bool)

(assert (=> b!558848 (= e!321938 call!32410)))

(declare-fun b!558849 () Bool)

(declare-fun e!321937 () Bool)

(assert (=> b!558849 (= e!321938 e!321937)))

(declare-fun lt!253983 () (_ BitVec 64))

(assert (=> b!558849 (= lt!253983 (select (arr!16885 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253984 () Unit!17442)

(assert (=> b!558849 (= lt!253984 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253983 #b00000000000000000000000000000000))))

(assert (=> b!558849 (arrayContainsKey!0 a!3118 lt!253983 #b00000000000000000000000000000000)))

(declare-fun lt!253982 () Unit!17442)

(assert (=> b!558849 (= lt!253982 lt!253984)))

(declare-fun res!350577 () Bool)

(assert (=> b!558849 (= res!350577 (= (seekEntryOrOpen!0 (select (arr!16885 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5334 #b00000000000000000000000000000000)))))

(assert (=> b!558849 (=> (not res!350577) (not e!321937))))

(declare-fun b!558850 () Bool)

(assert (=> b!558850 (= e!321937 call!32410)))

(declare-fun d!83639 () Bool)

(declare-fun res!350576 () Bool)

(assert (=> d!83639 (=> res!350576 e!321939)))

(assert (=> d!83639 (= res!350576 (bvsge #b00000000000000000000000000000000 (size!17249 a!3118)))))

(assert (=> d!83639 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!321939)))

(assert (= (and d!83639 (not res!350576)) b!558847))

(assert (= (and b!558847 c!64477) b!558849))

(assert (= (and b!558847 (not c!64477)) b!558848))

(assert (= (and b!558849 res!350577) b!558850))

(assert (= (or b!558850 b!558848) bm!32407))

(assert (=> b!558847 m!536723))

(assert (=> b!558847 m!536723))

(assert (=> b!558847 m!536827))

(declare-fun m!536847 () Bool)

(assert (=> bm!32407 m!536847))

(assert (=> b!558849 m!536723))

(declare-fun m!536849 () Bool)

(assert (=> b!558849 m!536849))

(declare-fun m!536851 () Bool)

(assert (=> b!558849 m!536851))

(assert (=> b!558849 m!536723))

(declare-fun m!536853 () Bool)

(assert (=> b!558849 m!536853))

(assert (=> b!558620 d!83639))

(declare-fun lt!254024 () SeekEntryResult!5334)

(declare-fun b!558957 () Bool)

(assert (=> b!558957 (and (bvsge (index!23565 lt!254024) #b00000000000000000000000000000000) (bvslt (index!23565 lt!254024) (size!17249 (array!35161 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118)))))))

(declare-fun res!350616 () Bool)

(assert (=> b!558957 (= res!350616 (= (select (arr!16885 (array!35161 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118))) (index!23565 lt!254024)) (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!322005 () Bool)

(assert (=> b!558957 (=> res!350616 e!322005)))

(declare-fun e!322004 () Bool)

(assert (=> b!558957 (= e!322004 e!322005)))

(declare-fun b!558958 () Bool)

(assert (=> b!558958 (and (bvsge (index!23565 lt!254024) #b00000000000000000000000000000000) (bvslt (index!23565 lt!254024) (size!17249 (array!35161 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118)))))))

(assert (=> b!558958 (= e!322005 (= (select (arr!16885 (array!35161 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118))) (index!23565 lt!254024)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!558959 () Bool)

(declare-fun e!322002 () SeekEntryResult!5334)

(declare-fun e!322001 () SeekEntryResult!5334)

(assert (=> b!558959 (= e!322002 e!322001)))

(declare-fun lt!254025 () (_ BitVec 64))

(declare-fun c!64513 () Bool)

(assert (=> b!558959 (= c!64513 (or (= lt!254025 (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!254025 lt!254025) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558960 () Bool)

(assert (=> b!558960 (= e!322001 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253876 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) (array!35161 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118)) mask!3119))))

(declare-fun d!83641 () Bool)

(declare-fun e!322003 () Bool)

(assert (=> d!83641 e!322003))

(declare-fun c!64515 () Bool)

(assert (=> d!83641 (= c!64515 (and ((_ is Intermediate!5334) lt!254024) (undefined!6146 lt!254024)))))

(assert (=> d!83641 (= lt!254024 e!322002)))

(declare-fun c!64514 () Bool)

(assert (=> d!83641 (= c!64514 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83641 (= lt!254025 (select (arr!16885 (array!35161 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118))) lt!253876))))

(assert (=> d!83641 (validMask!0 mask!3119)))

(assert (=> d!83641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253876 (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) (array!35161 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118)) mask!3119) lt!254024)))

(declare-fun b!558961 () Bool)

(assert (=> b!558961 (= e!322001 (Intermediate!5334 false lt!253876 #b00000000000000000000000000000000))))

(declare-fun b!558962 () Bool)

(assert (=> b!558962 (= e!322002 (Intermediate!5334 true lt!253876 #b00000000000000000000000000000000))))

(declare-fun b!558963 () Bool)

(assert (=> b!558963 (= e!322003 e!322004)))

(declare-fun res!350617 () Bool)

(assert (=> b!558963 (= res!350617 (and ((_ is Intermediate!5334) lt!254024) (not (undefined!6146 lt!254024)) (bvslt (x!52458 lt!254024) #b01111111111111111111111111111110) (bvsge (x!52458 lt!254024) #b00000000000000000000000000000000) (bvsge (x!52458 lt!254024) #b00000000000000000000000000000000)))))

(assert (=> b!558963 (=> (not res!350617) (not e!322004))))

(declare-fun b!558964 () Bool)

(assert (=> b!558964 (and (bvsge (index!23565 lt!254024) #b00000000000000000000000000000000) (bvslt (index!23565 lt!254024) (size!17249 (array!35161 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118)))))))

(declare-fun res!350618 () Bool)

(assert (=> b!558964 (= res!350618 (= (select (arr!16885 (array!35161 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118))) (index!23565 lt!254024)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558964 (=> res!350618 e!322005)))

(declare-fun b!558965 () Bool)

(assert (=> b!558965 (= e!322003 (bvsge (x!52458 lt!254024) #b01111111111111111111111111111110))))

(assert (= (and d!83641 c!64514) b!558962))

(assert (= (and d!83641 (not c!64514)) b!558959))

(assert (= (and b!558959 c!64513) b!558961))

(assert (= (and b!558959 (not c!64513)) b!558960))

(assert (= (and d!83641 c!64515) b!558965))

(assert (= (and d!83641 (not c!64515)) b!558963))

(assert (= (and b!558963 res!350617) b!558957))

(assert (= (and b!558957 (not res!350616)) b!558964))

(assert (= (and b!558964 (not res!350618)) b!558958))

(declare-fun m!536901 () Bool)

(assert (=> b!558958 m!536901))

(assert (=> b!558964 m!536901))

(declare-fun m!536903 () Bool)

(assert (=> d!83641 m!536903))

(assert (=> d!83641 m!536669))

(assert (=> b!558957 m!536901))

(declare-fun m!536905 () Bool)

(assert (=> b!558960 m!536905))

(assert (=> b!558960 m!536905))

(assert (=> b!558960 m!536653))

(declare-fun m!536907 () Bool)

(assert (=> b!558960 m!536907))

(assert (=> b!558625 d!83641))

(declare-fun b!558966 () Bool)

(declare-fun lt!254026 () SeekEntryResult!5334)

(assert (=> b!558966 (and (bvsge (index!23565 lt!254026) #b00000000000000000000000000000000) (bvslt (index!23565 lt!254026) (size!17249 a!3118)))))

(declare-fun res!350619 () Bool)

(assert (=> b!558966 (= res!350619 (= (select (arr!16885 a!3118) (index!23565 lt!254026)) (select (arr!16885 a!3118) j!142)))))

(declare-fun e!322010 () Bool)

(assert (=> b!558966 (=> res!350619 e!322010)))

(declare-fun e!322009 () Bool)

(assert (=> b!558966 (= e!322009 e!322010)))

(declare-fun b!558967 () Bool)

(assert (=> b!558967 (and (bvsge (index!23565 lt!254026) #b00000000000000000000000000000000) (bvslt (index!23565 lt!254026) (size!17249 a!3118)))))

(assert (=> b!558967 (= e!322010 (= (select (arr!16885 a!3118) (index!23565 lt!254026)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!558968 () Bool)

(declare-fun e!322007 () SeekEntryResult!5334)

(declare-fun e!322006 () SeekEntryResult!5334)

(assert (=> b!558968 (= e!322007 e!322006)))

(declare-fun c!64516 () Bool)

(declare-fun lt!254027 () (_ BitVec 64))

(assert (=> b!558968 (= c!64516 (or (= lt!254027 (select (arr!16885 a!3118) j!142)) (= (bvadd lt!254027 lt!254027) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558969 () Bool)

(assert (=> b!558969 (= e!322006 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253877 #b00000000000000000000000000000000 mask!3119) (select (arr!16885 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83659 () Bool)

(declare-fun e!322008 () Bool)

(assert (=> d!83659 e!322008))

(declare-fun c!64518 () Bool)

(assert (=> d!83659 (= c!64518 (and ((_ is Intermediate!5334) lt!254026) (undefined!6146 lt!254026)))))

(assert (=> d!83659 (= lt!254026 e!322007)))

(declare-fun c!64517 () Bool)

(assert (=> d!83659 (= c!64517 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83659 (= lt!254027 (select (arr!16885 a!3118) lt!253877))))

(assert (=> d!83659 (validMask!0 mask!3119)))

(assert (=> d!83659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253877 (select (arr!16885 a!3118) j!142) a!3118 mask!3119) lt!254026)))

(declare-fun b!558970 () Bool)

(assert (=> b!558970 (= e!322006 (Intermediate!5334 false lt!253877 #b00000000000000000000000000000000))))

(declare-fun b!558971 () Bool)

(assert (=> b!558971 (= e!322007 (Intermediate!5334 true lt!253877 #b00000000000000000000000000000000))))

(declare-fun b!558972 () Bool)

(assert (=> b!558972 (= e!322008 e!322009)))

(declare-fun res!350620 () Bool)

(assert (=> b!558972 (= res!350620 (and ((_ is Intermediate!5334) lt!254026) (not (undefined!6146 lt!254026)) (bvslt (x!52458 lt!254026) #b01111111111111111111111111111110) (bvsge (x!52458 lt!254026) #b00000000000000000000000000000000) (bvsge (x!52458 lt!254026) #b00000000000000000000000000000000)))))

(assert (=> b!558972 (=> (not res!350620) (not e!322009))))

(declare-fun b!558973 () Bool)

(assert (=> b!558973 (and (bvsge (index!23565 lt!254026) #b00000000000000000000000000000000) (bvslt (index!23565 lt!254026) (size!17249 a!3118)))))

(declare-fun res!350621 () Bool)

(assert (=> b!558973 (= res!350621 (= (select (arr!16885 a!3118) (index!23565 lt!254026)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558973 (=> res!350621 e!322010)))

(declare-fun b!558974 () Bool)

(assert (=> b!558974 (= e!322008 (bvsge (x!52458 lt!254026) #b01111111111111111111111111111110))))

(assert (= (and d!83659 c!64517) b!558971))

(assert (= (and d!83659 (not c!64517)) b!558968))

(assert (= (and b!558968 c!64516) b!558970))

(assert (= (and b!558968 (not c!64516)) b!558969))

(assert (= (and d!83659 c!64518) b!558974))

(assert (= (and d!83659 (not c!64518)) b!558972))

(assert (= (and b!558972 res!350620) b!558966))

(assert (= (and b!558966 (not res!350619)) b!558973))

(assert (= (and b!558973 (not res!350621)) b!558967))

(declare-fun m!536909 () Bool)

(assert (=> b!558967 m!536909))

(assert (=> b!558973 m!536909))

(declare-fun m!536911 () Bool)

(assert (=> d!83659 m!536911))

(assert (=> d!83659 m!536669))

(assert (=> b!558966 m!536909))

(declare-fun m!536913 () Bool)

(assert (=> b!558969 m!536913))

(assert (=> b!558969 m!536913))

(assert (=> b!558969 m!536637))

(declare-fun m!536915 () Bool)

(assert (=> b!558969 m!536915))

(assert (=> b!558625 d!83659))

(declare-fun d!83661 () Bool)

(declare-fun lt!254036 () (_ BitVec 32))

(declare-fun lt!254035 () (_ BitVec 32))

(assert (=> d!83661 (= lt!254036 (bvmul (bvxor lt!254035 (bvlshr lt!254035 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83661 (= lt!254035 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83661 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350625 (let ((h!11959 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52467 (bvmul (bvxor h!11959 (bvlshr h!11959 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52467 (bvlshr x!52467 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350625 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350625 #b00000000000000000000000000000000))))))

(assert (=> d!83661 (= (toIndex!0 (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!254036 (bvlshr lt!254036 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558625 d!83661))

(declare-fun d!83669 () Bool)

(declare-fun lt!254038 () (_ BitVec 32))

(declare-fun lt!254037 () (_ BitVec 32))

(assert (=> d!83669 (= lt!254038 (bvmul (bvxor lt!254037 (bvlshr lt!254037 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83669 (= lt!254037 ((_ extract 31 0) (bvand (bvxor (select (arr!16885 a!3118) j!142) (bvlshr (select (arr!16885 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83669 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350625 (let ((h!11959 ((_ extract 31 0) (bvand (bvxor (select (arr!16885 a!3118) j!142) (bvlshr (select (arr!16885 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52467 (bvmul (bvxor h!11959 (bvlshr h!11959 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52467 (bvlshr x!52467 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350625 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350625 #b00000000000000000000000000000000))))))

(assert (=> d!83669 (= (toIndex!0 (select (arr!16885 a!3118) j!142) mask!3119) (bvand (bvxor lt!254038 (bvlshr lt!254038 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558625 d!83669))

(check-sat (not b!558849) (not b!558738) (not d!83637) (not d!83581) (not b!558844) (not bm!32396) (not bm!32406) (not d!83605) (not bm!32407) (not b!558836) (not d!83589) (not b!558676) (not d!83641) (not b!558960) (not b!558686) (not d!83659) (not b!558779) (not b!558969) (not b!558840) (not b!558781) (not b!558847) (not b!558838))
(check-sat)
