; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29392 () Bool)

(assert start!29392)

(declare-fun b!297755 () Bool)

(declare-fun res!157022 () Bool)

(declare-fun e!188145 () Bool)

(assert (=> b!297755 (=> (not res!157022) (not e!188145))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297755 (= res!157022 (validKeyInArray!0 k0!2524))))

(declare-fun b!297756 () Bool)

(declare-fun e!188144 () Bool)

(declare-fun e!188146 () Bool)

(assert (=> b!297756 (= e!188144 e!188146)))

(declare-fun res!157023 () Bool)

(assert (=> b!297756 (=> (not res!157023) (not e!188146))))

(declare-fun lt!148030 () Bool)

(assert (=> b!297756 (= res!157023 lt!148030)))

(declare-datatypes ((array!15063 0))(
  ( (array!15064 (arr!7138 (Array (_ BitVec 32) (_ BitVec 64))) (size!7490 (_ BitVec 32))) )
))
(declare-fun lt!148035 () array!15063)

(declare-fun lt!148034 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2252 0))(
  ( (MissingZero!2252 (index!11178 (_ BitVec 32))) (Found!2252 (index!11179 (_ BitVec 32))) (Intermediate!2252 (undefined!3064 Bool) (index!11180 (_ BitVec 32)) (x!29507 (_ BitVec 32))) (Undefined!2252) (MissingVacant!2252 (index!11181 (_ BitVec 32))) )
))
(declare-fun lt!148029 () SeekEntryResult!2252)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15063 (_ BitVec 32)) SeekEntryResult!2252)

(assert (=> b!297756 (= lt!148029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148034 k0!2524 lt!148035 mask!3809))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun a!3312 () array!15063)

(assert (=> b!297756 (= lt!148035 (array!15064 (store (arr!7138 a!3312) i!1256 k0!2524) (size!7490 a!3312)))))

(declare-fun lt!148032 () SeekEntryResult!2252)

(assert (=> b!297756 (= lt!148032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148034 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297756 (= lt!148034 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297757 () Bool)

(declare-fun e!188143 () Bool)

(assert (=> b!297757 (= e!188146 e!188143)))

(declare-fun res!157028 () Bool)

(assert (=> b!297757 (=> (not res!157028) (not e!188143))))

(assert (=> b!297757 (= res!157028 (= lt!148029 lt!148032))))

(declare-datatypes ((Unit!9248 0))(
  ( (Unit!9249) )
))
(declare-fun lt!148028 () Unit!9248)

(declare-fun e!188142 () Unit!9248)

(assert (=> b!297757 (= lt!148028 e!188142)))

(declare-fun c!47949 () Bool)

(get-info :version)

(assert (=> b!297757 (= c!47949 (or (and ((_ is Intermediate!2252) lt!148032) (undefined!3064 lt!148032)) (and ((_ is Intermediate!2252) lt!148032) (= (select (arr!7138 a!3312) (index!11180 lt!148032)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2252) lt!148032) (= (select (arr!7138 a!3312) (index!11180 lt!148032)) k0!2524))))))

(declare-fun res!157024 () Bool)

(assert (=> start!29392 (=> (not res!157024) (not e!188145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29392 (= res!157024 (validMask!0 mask!3809))))

(assert (=> start!29392 e!188145))

(assert (=> start!29392 true))

(declare-fun array_inv!5088 (array!15063) Bool)

(assert (=> start!29392 (array_inv!5088 a!3312)))

(declare-fun b!297758 () Bool)

(declare-fun res!157027 () Bool)

(assert (=> b!297758 (=> (not res!157027) (not e!188145))))

(assert (=> b!297758 (= res!157027 (and (= (size!7490 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7490 a!3312))))))

(declare-fun b!297759 () Bool)

(declare-fun res!157026 () Bool)

(assert (=> b!297759 (=> (not res!157026) (not e!188145))))

(declare-fun arrayContainsKey!0 (array!15063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297759 (= res!157026 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297760 () Bool)

(declare-fun Unit!9250 () Unit!9248)

(assert (=> b!297760 (= e!188142 Unit!9250)))

(assert (=> b!297760 false))

(declare-fun b!297761 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15063 (_ BitVec 32)) SeekEntryResult!2252)

(assert (=> b!297761 (= e!188143 (not (= (seekEntryOrOpen!0 k0!2524 lt!148035 mask!3809) (Found!2252 i!1256))))))

(declare-fun b!297762 () Bool)

(assert (=> b!297762 (= e!188145 e!188144)))

(declare-fun res!157029 () Bool)

(assert (=> b!297762 (=> (not res!157029) (not e!188144))))

(declare-fun lt!148033 () SeekEntryResult!2252)

(assert (=> b!297762 (= res!157029 (or lt!148030 (= lt!148033 (MissingVacant!2252 i!1256))))))

(assert (=> b!297762 (= lt!148030 (= lt!148033 (MissingZero!2252 i!1256)))))

(assert (=> b!297762 (= lt!148033 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297763 () Bool)

(assert (=> b!297763 (and (= lt!148029 lt!148032) (= (select (store (arr!7138 a!3312) i!1256 k0!2524) (index!11180 lt!148032)) k0!2524))))

(declare-fun lt!148031 () Unit!9248)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15063 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9248)

(assert (=> b!297763 (= lt!148031 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148034 (index!11180 lt!148032) (x!29507 lt!148032) mask!3809))))

(assert (=> b!297763 (and (= (select (arr!7138 a!3312) (index!11180 lt!148032)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11180 lt!148032) i!1256))))

(declare-fun e!188147 () Unit!9248)

(declare-fun Unit!9251 () Unit!9248)

(assert (=> b!297763 (= e!188147 Unit!9251)))

(declare-fun b!297764 () Bool)

(assert (=> b!297764 false))

(declare-fun Unit!9252 () Unit!9248)

(assert (=> b!297764 (= e!188147 Unit!9252)))

(declare-fun b!297765 () Bool)

(declare-fun res!157025 () Bool)

(assert (=> b!297765 (=> (not res!157025) (not e!188144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15063 (_ BitVec 32)) Bool)

(assert (=> b!297765 (= res!157025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297766 () Bool)

(assert (=> b!297766 (= e!188142 e!188147)))

(declare-fun c!47950 () Bool)

(assert (=> b!297766 (= c!47950 ((_ is Intermediate!2252) lt!148032))))

(assert (= (and start!29392 res!157024) b!297758))

(assert (= (and b!297758 res!157027) b!297755))

(assert (= (and b!297755 res!157022) b!297759))

(assert (= (and b!297759 res!157026) b!297762))

(assert (= (and b!297762 res!157029) b!297765))

(assert (= (and b!297765 res!157025) b!297756))

(assert (= (and b!297756 res!157023) b!297757))

(assert (= (and b!297757 c!47949) b!297760))

(assert (= (and b!297757 (not c!47949)) b!297766))

(assert (= (and b!297766 c!47950) b!297763))

(assert (= (and b!297766 (not c!47950)) b!297764))

(assert (= (and b!297757 res!157028) b!297761))

(declare-fun m!310607 () Bool)

(assert (=> b!297765 m!310607))

(declare-fun m!310609 () Bool)

(assert (=> b!297756 m!310609))

(declare-fun m!310611 () Bool)

(assert (=> b!297756 m!310611))

(declare-fun m!310613 () Bool)

(assert (=> b!297756 m!310613))

(declare-fun m!310615 () Bool)

(assert (=> b!297756 m!310615))

(declare-fun m!310617 () Bool)

(assert (=> start!29392 m!310617))

(declare-fun m!310619 () Bool)

(assert (=> start!29392 m!310619))

(declare-fun m!310621 () Bool)

(assert (=> b!297762 m!310621))

(declare-fun m!310623 () Bool)

(assert (=> b!297759 m!310623))

(declare-fun m!310625 () Bool)

(assert (=> b!297757 m!310625))

(assert (=> b!297763 m!310611))

(declare-fun m!310627 () Bool)

(assert (=> b!297763 m!310627))

(declare-fun m!310629 () Bool)

(assert (=> b!297763 m!310629))

(assert (=> b!297763 m!310625))

(declare-fun m!310631 () Bool)

(assert (=> b!297761 m!310631))

(declare-fun m!310633 () Bool)

(assert (=> b!297755 m!310633))

(check-sat (not b!297756) (not b!297755) (not start!29392) (not b!297759) (not b!297761) (not b!297765) (not b!297762) (not b!297763))
(check-sat)
(get-model)

(declare-fun b!297847 () Bool)

(declare-fun e!188196 () Bool)

(declare-fun e!188198 () Bool)

(assert (=> b!297847 (= e!188196 e!188198)))

(declare-fun lt!148090 () (_ BitVec 64))

(assert (=> b!297847 (= lt!148090 (select (arr!7138 a!3312) #b00000000000000000000000000000000))))

(declare-fun lt!148091 () Unit!9248)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15063 (_ BitVec 64) (_ BitVec 32)) Unit!9248)

(assert (=> b!297847 (= lt!148091 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148090 #b00000000000000000000000000000000))))

(assert (=> b!297847 (arrayContainsKey!0 a!3312 lt!148090 #b00000000000000000000000000000000)))

(declare-fun lt!148092 () Unit!9248)

(assert (=> b!297847 (= lt!148092 lt!148091)))

(declare-fun res!157082 () Bool)

(assert (=> b!297847 (= res!157082 (= (seekEntryOrOpen!0 (select (arr!7138 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2252 #b00000000000000000000000000000000)))))

(assert (=> b!297847 (=> (not res!157082) (not e!188198))))

(declare-fun d!67291 () Bool)

(declare-fun res!157083 () Bool)

(declare-fun e!188197 () Bool)

(assert (=> d!67291 (=> res!157083 e!188197)))

(assert (=> d!67291 (= res!157083 (bvsge #b00000000000000000000000000000000 (size!7490 a!3312)))))

(assert (=> d!67291 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188197)))

(declare-fun b!297848 () Bool)

(declare-fun call!25753 () Bool)

(assert (=> b!297848 (= e!188196 call!25753)))

(declare-fun b!297849 () Bool)

(assert (=> b!297849 (= e!188198 call!25753)))

(declare-fun b!297850 () Bool)

(assert (=> b!297850 (= e!188197 e!188196)))

(declare-fun c!47965 () Bool)

(assert (=> b!297850 (= c!47965 (validKeyInArray!0 (select (arr!7138 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25750 () Bool)

(assert (=> bm!25750 (= call!25753 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!67291 (not res!157083)) b!297850))

(assert (= (and b!297850 c!47965) b!297847))

(assert (= (and b!297850 (not c!47965)) b!297848))

(assert (= (and b!297847 res!157082) b!297849))

(assert (= (or b!297849 b!297848) bm!25750))

(declare-fun m!310691 () Bool)

(assert (=> b!297847 m!310691))

(declare-fun m!310693 () Bool)

(assert (=> b!297847 m!310693))

(declare-fun m!310695 () Bool)

(assert (=> b!297847 m!310695))

(assert (=> b!297847 m!310691))

(declare-fun m!310697 () Bool)

(assert (=> b!297847 m!310697))

(assert (=> b!297850 m!310691))

(assert (=> b!297850 m!310691))

(declare-fun m!310699 () Bool)

(assert (=> b!297850 m!310699))

(declare-fun m!310701 () Bool)

(assert (=> bm!25750 m!310701))

(assert (=> b!297765 d!67291))

(declare-fun d!67293 () Bool)

(declare-fun res!157088 () Bool)

(declare-fun e!188203 () Bool)

(assert (=> d!67293 (=> res!157088 e!188203)))

(assert (=> d!67293 (= res!157088 (= (select (arr!7138 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67293 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188203)))

(declare-fun b!297855 () Bool)

(declare-fun e!188204 () Bool)

(assert (=> b!297855 (= e!188203 e!188204)))

(declare-fun res!157089 () Bool)

(assert (=> b!297855 (=> (not res!157089) (not e!188204))))

(assert (=> b!297855 (= res!157089 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7490 a!3312)))))

(declare-fun b!297856 () Bool)

(assert (=> b!297856 (= e!188204 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67293 (not res!157088)) b!297855))

(assert (= (and b!297855 res!157089) b!297856))

(assert (=> d!67293 m!310691))

(declare-fun m!310703 () Bool)

(assert (=> b!297856 m!310703))

(assert (=> b!297759 d!67293))

(declare-fun d!67295 () Bool)

(declare-fun e!188207 () Bool)

(assert (=> d!67295 e!188207))

(declare-fun res!157092 () Bool)

(assert (=> d!67295 (=> (not res!157092) (not e!188207))))

(assert (=> d!67295 (= res!157092 (and (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7490 a!3312))))))

(declare-fun lt!148095 () Unit!9248)

(declare-fun choose!42 (array!15063 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9248)

(assert (=> d!67295 (= lt!148095 (choose!42 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148034 (index!11180 lt!148032) (x!29507 lt!148032) mask!3809))))

(assert (=> d!67295 (validMask!0 mask!3809)))

(assert (=> d!67295 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148034 (index!11180 lt!148032) (x!29507 lt!148032) mask!3809) lt!148095)))

(declare-fun b!297859 () Bool)

(assert (=> b!297859 (= e!188207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148034 k0!2524 (array!15064 (store (arr!7138 a!3312) i!1256 k0!2524) (size!7490 a!3312)) mask!3809) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148034 k0!2524 a!3312 mask!3809)))))

(assert (= (and d!67295 res!157092) b!297859))

(declare-fun m!310705 () Bool)

(assert (=> d!67295 m!310705))

(assert (=> d!67295 m!310617))

(assert (=> b!297859 m!310611))

(declare-fun m!310707 () Bool)

(assert (=> b!297859 m!310707))

(assert (=> b!297859 m!310613))

(assert (=> b!297763 d!67295))

(declare-fun d!67297 () Bool)

(assert (=> d!67297 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29392 d!67297))

(declare-fun d!67301 () Bool)

(assert (=> d!67301 (= (array_inv!5088 a!3312) (bvsge (size!7490 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29392 d!67301))

(declare-fun b!297887 () Bool)

(declare-fun e!188226 () SeekEntryResult!2252)

(declare-fun e!188227 () SeekEntryResult!2252)

(assert (=> b!297887 (= e!188226 e!188227)))

(declare-fun lt!148116 () (_ BitVec 64))

(declare-fun lt!148115 () SeekEntryResult!2252)

(assert (=> b!297887 (= lt!148116 (select (arr!7138 a!3312) (index!11180 lt!148115)))))

(declare-fun c!47975 () Bool)

(assert (=> b!297887 (= c!47975 (= lt!148116 k0!2524))))

(declare-fun b!297888 () Bool)

(declare-fun c!47977 () Bool)

(assert (=> b!297888 (= c!47977 (= lt!148116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188228 () SeekEntryResult!2252)

(assert (=> b!297888 (= e!188227 e!188228)))

(declare-fun b!297889 () Bool)

(assert (=> b!297889 (= e!188227 (Found!2252 (index!11180 lt!148115)))))

(declare-fun b!297890 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15063 (_ BitVec 32)) SeekEntryResult!2252)

(assert (=> b!297890 (= e!188228 (seekKeyOrZeroReturnVacant!0 (x!29507 lt!148115) (index!11180 lt!148115) (index!11180 lt!148115) k0!2524 a!3312 mask!3809))))

(declare-fun b!297891 () Bool)

(assert (=> b!297891 (= e!188226 Undefined!2252)))

(declare-fun d!67303 () Bool)

(declare-fun lt!148114 () SeekEntryResult!2252)

(assert (=> d!67303 (and (or ((_ is Undefined!2252) lt!148114) (not ((_ is Found!2252) lt!148114)) (and (bvsge (index!11179 lt!148114) #b00000000000000000000000000000000) (bvslt (index!11179 lt!148114) (size!7490 a!3312)))) (or ((_ is Undefined!2252) lt!148114) ((_ is Found!2252) lt!148114) (not ((_ is MissingZero!2252) lt!148114)) (and (bvsge (index!11178 lt!148114) #b00000000000000000000000000000000) (bvslt (index!11178 lt!148114) (size!7490 a!3312)))) (or ((_ is Undefined!2252) lt!148114) ((_ is Found!2252) lt!148114) ((_ is MissingZero!2252) lt!148114) (not ((_ is MissingVacant!2252) lt!148114)) (and (bvsge (index!11181 lt!148114) #b00000000000000000000000000000000) (bvslt (index!11181 lt!148114) (size!7490 a!3312)))) (or ((_ is Undefined!2252) lt!148114) (ite ((_ is Found!2252) lt!148114) (= (select (arr!7138 a!3312) (index!11179 lt!148114)) k0!2524) (ite ((_ is MissingZero!2252) lt!148114) (= (select (arr!7138 a!3312) (index!11178 lt!148114)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2252) lt!148114) (= (select (arr!7138 a!3312) (index!11181 lt!148114)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67303 (= lt!148114 e!188226)))

(declare-fun c!47976 () Bool)

(assert (=> d!67303 (= c!47976 (and ((_ is Intermediate!2252) lt!148115) (undefined!3064 lt!148115)))))

(assert (=> d!67303 (= lt!148115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67303 (validMask!0 mask!3809)))

(assert (=> d!67303 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148114)))

(declare-fun b!297892 () Bool)

(assert (=> b!297892 (= e!188228 (MissingZero!2252 (index!11180 lt!148115)))))

(assert (= (and d!67303 c!47976) b!297891))

(assert (= (and d!67303 (not c!47976)) b!297887))

(assert (= (and b!297887 c!47975) b!297889))

(assert (= (and b!297887 (not c!47975)) b!297888))

(assert (= (and b!297888 c!47977) b!297892))

(assert (= (and b!297888 (not c!47977)) b!297890))

(declare-fun m!310725 () Bool)

(assert (=> b!297887 m!310725))

(declare-fun m!310727 () Bool)

(assert (=> b!297890 m!310727))

(assert (=> d!67303 m!310615))

(declare-fun m!310729 () Bool)

(assert (=> d!67303 m!310729))

(declare-fun m!310731 () Bool)

(assert (=> d!67303 m!310731))

(assert (=> d!67303 m!310615))

(declare-fun m!310733 () Bool)

(assert (=> d!67303 m!310733))

(assert (=> d!67303 m!310617))

(declare-fun m!310735 () Bool)

(assert (=> d!67303 m!310735))

(assert (=> b!297762 d!67303))

(declare-fun b!297893 () Bool)

(declare-fun e!188229 () SeekEntryResult!2252)

(declare-fun e!188230 () SeekEntryResult!2252)

(assert (=> b!297893 (= e!188229 e!188230)))

(declare-fun lt!148119 () (_ BitVec 64))

(declare-fun lt!148118 () SeekEntryResult!2252)

(assert (=> b!297893 (= lt!148119 (select (arr!7138 lt!148035) (index!11180 lt!148118)))))

(declare-fun c!47978 () Bool)

(assert (=> b!297893 (= c!47978 (= lt!148119 k0!2524))))

(declare-fun b!297894 () Bool)

(declare-fun c!47980 () Bool)

(assert (=> b!297894 (= c!47980 (= lt!148119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188231 () SeekEntryResult!2252)

(assert (=> b!297894 (= e!188230 e!188231)))

(declare-fun b!297895 () Bool)

(assert (=> b!297895 (= e!188230 (Found!2252 (index!11180 lt!148118)))))

(declare-fun b!297896 () Bool)

(assert (=> b!297896 (= e!188231 (seekKeyOrZeroReturnVacant!0 (x!29507 lt!148118) (index!11180 lt!148118) (index!11180 lt!148118) k0!2524 lt!148035 mask!3809))))

(declare-fun b!297897 () Bool)

(assert (=> b!297897 (= e!188229 Undefined!2252)))

(declare-fun d!67315 () Bool)

(declare-fun lt!148117 () SeekEntryResult!2252)

(assert (=> d!67315 (and (or ((_ is Undefined!2252) lt!148117) (not ((_ is Found!2252) lt!148117)) (and (bvsge (index!11179 lt!148117) #b00000000000000000000000000000000) (bvslt (index!11179 lt!148117) (size!7490 lt!148035)))) (or ((_ is Undefined!2252) lt!148117) ((_ is Found!2252) lt!148117) (not ((_ is MissingZero!2252) lt!148117)) (and (bvsge (index!11178 lt!148117) #b00000000000000000000000000000000) (bvslt (index!11178 lt!148117) (size!7490 lt!148035)))) (or ((_ is Undefined!2252) lt!148117) ((_ is Found!2252) lt!148117) ((_ is MissingZero!2252) lt!148117) (not ((_ is MissingVacant!2252) lt!148117)) (and (bvsge (index!11181 lt!148117) #b00000000000000000000000000000000) (bvslt (index!11181 lt!148117) (size!7490 lt!148035)))) (or ((_ is Undefined!2252) lt!148117) (ite ((_ is Found!2252) lt!148117) (= (select (arr!7138 lt!148035) (index!11179 lt!148117)) k0!2524) (ite ((_ is MissingZero!2252) lt!148117) (= (select (arr!7138 lt!148035) (index!11178 lt!148117)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2252) lt!148117) (= (select (arr!7138 lt!148035) (index!11181 lt!148117)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67315 (= lt!148117 e!188229)))

(declare-fun c!47979 () Bool)

(assert (=> d!67315 (= c!47979 (and ((_ is Intermediate!2252) lt!148118) (undefined!3064 lt!148118)))))

(assert (=> d!67315 (= lt!148118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 lt!148035 mask!3809))))

(assert (=> d!67315 (validMask!0 mask!3809)))

(assert (=> d!67315 (= (seekEntryOrOpen!0 k0!2524 lt!148035 mask!3809) lt!148117)))

(declare-fun b!297898 () Bool)

(assert (=> b!297898 (= e!188231 (MissingZero!2252 (index!11180 lt!148118)))))

(assert (= (and d!67315 c!47979) b!297897))

(assert (= (and d!67315 (not c!47979)) b!297893))

(assert (= (and b!297893 c!47978) b!297895))

(assert (= (and b!297893 (not c!47978)) b!297894))

(assert (= (and b!297894 c!47980) b!297898))

(assert (= (and b!297894 (not c!47980)) b!297896))

(declare-fun m!310737 () Bool)

(assert (=> b!297893 m!310737))

(declare-fun m!310739 () Bool)

(assert (=> b!297896 m!310739))

(assert (=> d!67315 m!310615))

(declare-fun m!310741 () Bool)

(assert (=> d!67315 m!310741))

(declare-fun m!310743 () Bool)

(assert (=> d!67315 m!310743))

(assert (=> d!67315 m!310615))

(declare-fun m!310745 () Bool)

(assert (=> d!67315 m!310745))

(assert (=> d!67315 m!310617))

(declare-fun m!310747 () Bool)

(assert (=> d!67315 m!310747))

(assert (=> b!297761 d!67315))

(declare-fun e!188273 () SeekEntryResult!2252)

(declare-fun b!297963 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297963 (= e!188273 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148034 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 lt!148035 mask!3809))))

(declare-fun b!297964 () Bool)

(assert (=> b!297964 (= e!188273 (Intermediate!2252 false lt!148034 #b00000000000000000000000000000000))))

(declare-fun b!297965 () Bool)

(declare-fun lt!148138 () SeekEntryResult!2252)

(assert (=> b!297965 (and (bvsge (index!11180 lt!148138) #b00000000000000000000000000000000) (bvslt (index!11180 lt!148138) (size!7490 lt!148035)))))

(declare-fun res!157133 () Bool)

(assert (=> b!297965 (= res!157133 (= (select (arr!7138 lt!148035) (index!11180 lt!148138)) k0!2524))))

(declare-fun e!188274 () Bool)

(assert (=> b!297965 (=> res!157133 e!188274)))

(declare-fun e!188275 () Bool)

(assert (=> b!297965 (= e!188275 e!188274)))

(declare-fun b!297966 () Bool)

(declare-fun e!188276 () SeekEntryResult!2252)

(assert (=> b!297966 (= e!188276 (Intermediate!2252 true lt!148034 #b00000000000000000000000000000000))))

(declare-fun b!297967 () Bool)

(assert (=> b!297967 (and (bvsge (index!11180 lt!148138) #b00000000000000000000000000000000) (bvslt (index!11180 lt!148138) (size!7490 lt!148035)))))

(declare-fun res!157132 () Bool)

(assert (=> b!297967 (= res!157132 (= (select (arr!7138 lt!148035) (index!11180 lt!148138)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297967 (=> res!157132 e!188274)))

(declare-fun b!297968 () Bool)

(assert (=> b!297968 (and (bvsge (index!11180 lt!148138) #b00000000000000000000000000000000) (bvslt (index!11180 lt!148138) (size!7490 lt!148035)))))

(assert (=> b!297968 (= e!188274 (= (select (arr!7138 lt!148035) (index!11180 lt!148138)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67317 () Bool)

(declare-fun e!188272 () Bool)

(assert (=> d!67317 e!188272))

(declare-fun c!48001 () Bool)

(assert (=> d!67317 (= c!48001 (and ((_ is Intermediate!2252) lt!148138) (undefined!3064 lt!148138)))))

(assert (=> d!67317 (= lt!148138 e!188276)))

(declare-fun c!48000 () Bool)

(assert (=> d!67317 (= c!48000 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148139 () (_ BitVec 64))

(assert (=> d!67317 (= lt!148139 (select (arr!7138 lt!148035) lt!148034))))

(assert (=> d!67317 (validMask!0 mask!3809)))

(assert (=> d!67317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148034 k0!2524 lt!148035 mask!3809) lt!148138)))

(declare-fun b!297969 () Bool)

(assert (=> b!297969 (= e!188272 e!188275)))

(declare-fun res!157131 () Bool)

(assert (=> b!297969 (= res!157131 (and ((_ is Intermediate!2252) lt!148138) (not (undefined!3064 lt!148138)) (bvslt (x!29507 lt!148138) #b01111111111111111111111111111110) (bvsge (x!29507 lt!148138) #b00000000000000000000000000000000) (bvsge (x!29507 lt!148138) #b00000000000000000000000000000000)))))

(assert (=> b!297969 (=> (not res!157131) (not e!188275))))

(declare-fun b!297970 () Bool)

(assert (=> b!297970 (= e!188272 (bvsge (x!29507 lt!148138) #b01111111111111111111111111111110))))

(declare-fun b!297971 () Bool)

(assert (=> b!297971 (= e!188276 e!188273)))

(declare-fun c!47999 () Bool)

(assert (=> b!297971 (= c!47999 (or (= lt!148139 k0!2524) (= (bvadd lt!148139 lt!148139) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67317 c!48000) b!297966))

(assert (= (and d!67317 (not c!48000)) b!297971))

(assert (= (and b!297971 c!47999) b!297964))

(assert (= (and b!297971 (not c!47999)) b!297963))

(assert (= (and d!67317 c!48001) b!297970))

(assert (= (and d!67317 (not c!48001)) b!297969))

(assert (= (and b!297969 res!157131) b!297965))

(assert (= (and b!297965 (not res!157133)) b!297967))

(assert (= (and b!297967 (not res!157132)) b!297968))

(declare-fun m!310769 () Bool)

(assert (=> b!297963 m!310769))

(assert (=> b!297963 m!310769))

(declare-fun m!310771 () Bool)

(assert (=> b!297963 m!310771))

(declare-fun m!310773 () Bool)

(assert (=> b!297965 m!310773))

(declare-fun m!310775 () Bool)

(assert (=> d!67317 m!310775))

(assert (=> d!67317 m!310617))

(assert (=> b!297967 m!310773))

(assert (=> b!297968 m!310773))

(assert (=> b!297756 d!67317))

(declare-fun b!297986 () Bool)

(declare-fun e!188286 () SeekEntryResult!2252)

(assert (=> b!297986 (= e!188286 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148034 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!297987 () Bool)

(assert (=> b!297987 (= e!188286 (Intermediate!2252 false lt!148034 #b00000000000000000000000000000000))))

(declare-fun b!297988 () Bool)

(declare-fun lt!148146 () SeekEntryResult!2252)

(assert (=> b!297988 (and (bvsge (index!11180 lt!148146) #b00000000000000000000000000000000) (bvslt (index!11180 lt!148146) (size!7490 a!3312)))))

(declare-fun res!157138 () Bool)

(assert (=> b!297988 (= res!157138 (= (select (arr!7138 a!3312) (index!11180 lt!148146)) k0!2524))))

(declare-fun e!188287 () Bool)

(assert (=> b!297988 (=> res!157138 e!188287)))

(declare-fun e!188288 () Bool)

(assert (=> b!297988 (= e!188288 e!188287)))

(declare-fun b!297989 () Bool)

(declare-fun e!188289 () SeekEntryResult!2252)

(assert (=> b!297989 (= e!188289 (Intermediate!2252 true lt!148034 #b00000000000000000000000000000000))))

(declare-fun b!297990 () Bool)

(assert (=> b!297990 (and (bvsge (index!11180 lt!148146) #b00000000000000000000000000000000) (bvslt (index!11180 lt!148146) (size!7490 a!3312)))))

(declare-fun res!157137 () Bool)

(assert (=> b!297990 (= res!157137 (= (select (arr!7138 a!3312) (index!11180 lt!148146)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297990 (=> res!157137 e!188287)))

(declare-fun b!297991 () Bool)

(assert (=> b!297991 (and (bvsge (index!11180 lt!148146) #b00000000000000000000000000000000) (bvslt (index!11180 lt!148146) (size!7490 a!3312)))))

(assert (=> b!297991 (= e!188287 (= (select (arr!7138 a!3312) (index!11180 lt!148146)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67329 () Bool)

(declare-fun e!188285 () Bool)

(assert (=> d!67329 e!188285))

(declare-fun c!48010 () Bool)

(assert (=> d!67329 (= c!48010 (and ((_ is Intermediate!2252) lt!148146) (undefined!3064 lt!148146)))))

(assert (=> d!67329 (= lt!148146 e!188289)))

(declare-fun c!48009 () Bool)

(assert (=> d!67329 (= c!48009 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148147 () (_ BitVec 64))

(assert (=> d!67329 (= lt!148147 (select (arr!7138 a!3312) lt!148034))))

(assert (=> d!67329 (validMask!0 mask!3809)))

(assert (=> d!67329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148034 k0!2524 a!3312 mask!3809) lt!148146)))

(declare-fun b!297992 () Bool)

(assert (=> b!297992 (= e!188285 e!188288)))

(declare-fun res!157136 () Bool)

(assert (=> b!297992 (= res!157136 (and ((_ is Intermediate!2252) lt!148146) (not (undefined!3064 lt!148146)) (bvslt (x!29507 lt!148146) #b01111111111111111111111111111110) (bvsge (x!29507 lt!148146) #b00000000000000000000000000000000) (bvsge (x!29507 lt!148146) #b00000000000000000000000000000000)))))

(assert (=> b!297992 (=> (not res!157136) (not e!188288))))

(declare-fun b!297993 () Bool)

(assert (=> b!297993 (= e!188285 (bvsge (x!29507 lt!148146) #b01111111111111111111111111111110))))

(declare-fun b!297994 () Bool)

(assert (=> b!297994 (= e!188289 e!188286)))

(declare-fun c!48008 () Bool)

(assert (=> b!297994 (= c!48008 (or (= lt!148147 k0!2524) (= (bvadd lt!148147 lt!148147) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67329 c!48009) b!297989))

(assert (= (and d!67329 (not c!48009)) b!297994))

(assert (= (and b!297994 c!48008) b!297987))

(assert (= (and b!297994 (not c!48008)) b!297986))

(assert (= (and d!67329 c!48010) b!297993))

(assert (= (and d!67329 (not c!48010)) b!297992))

(assert (= (and b!297992 res!157136) b!297988))

(assert (= (and b!297988 (not res!157138)) b!297990))

(assert (= (and b!297990 (not res!157137)) b!297991))

(assert (=> b!297986 m!310769))

(assert (=> b!297986 m!310769))

(declare-fun m!310777 () Bool)

(assert (=> b!297986 m!310777))

(declare-fun m!310779 () Bool)

(assert (=> b!297988 m!310779))

(declare-fun m!310781 () Bool)

(assert (=> d!67329 m!310781))

(assert (=> d!67329 m!310617))

(assert (=> b!297990 m!310779))

(assert (=> b!297991 m!310779))

(assert (=> b!297756 d!67329))

(declare-fun d!67331 () Bool)

(declare-fun lt!148156 () (_ BitVec 32))

(declare-fun lt!148155 () (_ BitVec 32))

(assert (=> d!67331 (= lt!148156 (bvmul (bvxor lt!148155 (bvlshr lt!148155 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67331 (= lt!148155 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67331 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157139 (let ((h!5214 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29515 (bvmul (bvxor h!5214 (bvlshr h!5214 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29515 (bvlshr x!29515 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157139 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157139 #b00000000000000000000000000000000))))))

(assert (=> d!67331 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148156 (bvlshr lt!148156 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!297756 d!67331))

(declare-fun d!67335 () Bool)

(assert (=> d!67335 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!297755 d!67335))

(check-sat (not b!297856) (not b!297896) (not b!297986) (not b!297859) (not d!67303) (not bm!25750) (not d!67315) (not b!297963) (not b!297850) (not b!297847) (not d!67317) (not d!67295) (not b!297890) (not d!67329))
(check-sat)
