; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29752 () Bool)

(assert start!29752)

(declare-fun b!299818 () Bool)

(declare-fun res!158043 () Bool)

(declare-fun e!189357 () Bool)

(assert (=> b!299818 (=> (not res!158043) (not e!189357))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15135 0))(
  ( (array!15136 (arr!7165 (Array (_ BitVec 32) (_ BitVec 64))) (size!7517 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15135)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!299818 (= res!158043 (and (= (size!7517 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7517 a!3312))))))

(declare-fun b!299819 () Bool)

(declare-fun e!189356 () Bool)

(assert (=> b!299819 (= e!189357 e!189356)))

(declare-fun res!158041 () Bool)

(assert (=> b!299819 (=> (not res!158041) (not e!189356))))

(declare-fun lt!149153 () Bool)

(declare-datatypes ((SeekEntryResult!2279 0))(
  ( (MissingZero!2279 (index!11292 (_ BitVec 32))) (Found!2279 (index!11293 (_ BitVec 32))) (Intermediate!2279 (undefined!3091 Bool) (index!11294 (_ BitVec 32)) (x!29650 (_ BitVec 32))) (Undefined!2279) (MissingVacant!2279 (index!11295 (_ BitVec 32))) )
))
(declare-fun lt!149155 () SeekEntryResult!2279)

(assert (=> b!299819 (= res!158041 (or lt!149153 (= lt!149155 (MissingVacant!2279 i!1256))))))

(assert (=> b!299819 (= lt!149153 (= lt!149155 (MissingZero!2279 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15135 (_ BitVec 32)) SeekEntryResult!2279)

(assert (=> b!299819 (= lt!149155 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!299820 () Bool)

(declare-fun res!158045 () Bool)

(assert (=> b!299820 (=> (not res!158045) (not e!189357))))

(declare-fun arrayContainsKey!0 (array!15135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299820 (= res!158045 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun lt!149154 () SeekEntryResult!2279)

(declare-fun b!299821 () Bool)

(get-info :version)

(assert (=> b!299821 (= e!189356 (and (not lt!149153) (= lt!149155 (MissingVacant!2279 i!1256)) (let ((bdg!6452 (not ((_ is Intermediate!2279) lt!149154)))) (and (or bdg!6452 (not (undefined!3091 lt!149154))) (or bdg!6452 (not (= (select (arr!7165 a!3312) (index!11294 lt!149154)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6452) (= (select (arr!7165 a!3312) (index!11294 lt!149154)) k0!2524)))))))

(declare-fun lt!149157 () (_ BitVec 32))

(declare-fun lt!149156 () SeekEntryResult!2279)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15135 (_ BitVec 32)) SeekEntryResult!2279)

(assert (=> b!299821 (= lt!149156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149157 k0!2524 (array!15136 (store (arr!7165 a!3312) i!1256 k0!2524) (size!7517 a!3312)) mask!3809))))

(assert (=> b!299821 (= lt!149154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149157 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299821 (= lt!149157 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!299822 () Bool)

(declare-fun res!158042 () Bool)

(assert (=> b!299822 (=> (not res!158042) (not e!189356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15135 (_ BitVec 32)) Bool)

(assert (=> b!299822 (= res!158042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299823 () Bool)

(declare-fun res!158046 () Bool)

(assert (=> b!299823 (=> (not res!158046) (not e!189357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299823 (= res!158046 (validKeyInArray!0 k0!2524))))

(declare-fun res!158044 () Bool)

(assert (=> start!29752 (=> (not res!158044) (not e!189357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29752 (= res!158044 (validMask!0 mask!3809))))

(assert (=> start!29752 e!189357))

(assert (=> start!29752 true))

(declare-fun array_inv!5115 (array!15135) Bool)

(assert (=> start!29752 (array_inv!5115 a!3312)))

(assert (= (and start!29752 res!158044) b!299818))

(assert (= (and b!299818 res!158043) b!299823))

(assert (= (and b!299823 res!158046) b!299820))

(assert (= (and b!299820 res!158045) b!299819))

(assert (= (and b!299819 res!158041) b!299822))

(assert (= (and b!299822 res!158042) b!299821))

(declare-fun m!312099 () Bool)

(assert (=> b!299823 m!312099))

(declare-fun m!312101 () Bool)

(assert (=> b!299822 m!312101))

(declare-fun m!312103 () Bool)

(assert (=> b!299819 m!312103))

(declare-fun m!312105 () Bool)

(assert (=> b!299821 m!312105))

(declare-fun m!312107 () Bool)

(assert (=> b!299821 m!312107))

(declare-fun m!312109 () Bool)

(assert (=> b!299821 m!312109))

(declare-fun m!312111 () Bool)

(assert (=> b!299821 m!312111))

(declare-fun m!312113 () Bool)

(assert (=> b!299821 m!312113))

(declare-fun m!312115 () Bool)

(assert (=> start!29752 m!312115))

(declare-fun m!312117 () Bool)

(assert (=> start!29752 m!312117))

(declare-fun m!312119 () Bool)

(assert (=> b!299820 m!312119))

(check-sat (not b!299822) (not b!299820) (not b!299819) (not b!299821) (not start!29752) (not b!299823))
(check-sat)
(get-model)

(declare-fun d!67679 () Bool)

(assert (=> d!67679 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299823 d!67679))

(declare-fun d!67681 () Bool)

(assert (=> d!67681 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29752 d!67681))

(declare-fun d!67683 () Bool)

(assert (=> d!67683 (= (array_inv!5115 a!3312) (bvsge (size!7517 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29752 d!67683))

(declare-fun b!299868 () Bool)

(declare-fun e!189384 () Bool)

(declare-fun call!25826 () Bool)

(assert (=> b!299868 (= e!189384 call!25826)))

(declare-fun bm!25823 () Bool)

(assert (=> bm!25823 (= call!25826 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!299869 () Bool)

(declare-fun e!189382 () Bool)

(assert (=> b!299869 (= e!189382 call!25826)))

(declare-fun d!67685 () Bool)

(declare-fun res!158088 () Bool)

(declare-fun e!189383 () Bool)

(assert (=> d!67685 (=> res!158088 e!189383)))

(assert (=> d!67685 (= res!158088 (bvsge #b00000000000000000000000000000000 (size!7517 a!3312)))))

(assert (=> d!67685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189383)))

(declare-fun b!299870 () Bool)

(assert (=> b!299870 (= e!189383 e!189382)))

(declare-fun c!48482 () Bool)

(assert (=> b!299870 (= c!48482 (validKeyInArray!0 (select (arr!7165 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!299871 () Bool)

(assert (=> b!299871 (= e!189382 e!189384)))

(declare-fun lt!149195 () (_ BitVec 64))

(assert (=> b!299871 (= lt!149195 (select (arr!7165 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9319 0))(
  ( (Unit!9320) )
))
(declare-fun lt!149194 () Unit!9319)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15135 (_ BitVec 64) (_ BitVec 32)) Unit!9319)

(assert (=> b!299871 (= lt!149194 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149195 #b00000000000000000000000000000000))))

(assert (=> b!299871 (arrayContainsKey!0 a!3312 lt!149195 #b00000000000000000000000000000000)))

(declare-fun lt!149196 () Unit!9319)

(assert (=> b!299871 (= lt!149196 lt!149194)))

(declare-fun res!158087 () Bool)

(assert (=> b!299871 (= res!158087 (= (seekEntryOrOpen!0 (select (arr!7165 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2279 #b00000000000000000000000000000000)))))

(assert (=> b!299871 (=> (not res!158087) (not e!189384))))

(assert (= (and d!67685 (not res!158088)) b!299870))

(assert (= (and b!299870 c!48482) b!299871))

(assert (= (and b!299870 (not c!48482)) b!299869))

(assert (= (and b!299871 res!158087) b!299868))

(assert (= (or b!299868 b!299869) bm!25823))

(declare-fun m!312165 () Bool)

(assert (=> bm!25823 m!312165))

(declare-fun m!312167 () Bool)

(assert (=> b!299870 m!312167))

(assert (=> b!299870 m!312167))

(declare-fun m!312169 () Bool)

(assert (=> b!299870 m!312169))

(assert (=> b!299871 m!312167))

(declare-fun m!312171 () Bool)

(assert (=> b!299871 m!312171))

(declare-fun m!312173 () Bool)

(assert (=> b!299871 m!312173))

(assert (=> b!299871 m!312167))

(declare-fun m!312175 () Bool)

(assert (=> b!299871 m!312175))

(assert (=> b!299822 d!67685))

(declare-fun d!67691 () Bool)

(declare-fun e!189411 () Bool)

(assert (=> d!67691 e!189411))

(declare-fun c!48492 () Bool)

(declare-fun lt!149210 () SeekEntryResult!2279)

(assert (=> d!67691 (= c!48492 (and ((_ is Intermediate!2279) lt!149210) (undefined!3091 lt!149210)))))

(declare-fun e!189410 () SeekEntryResult!2279)

(assert (=> d!67691 (= lt!149210 e!189410)))

(declare-fun c!48494 () Bool)

(assert (=> d!67691 (= c!48494 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149211 () (_ BitVec 64))

(assert (=> d!67691 (= lt!149211 (select (arr!7165 (array!15136 (store (arr!7165 a!3312) i!1256 k0!2524) (size!7517 a!3312))) lt!149157))))

(assert (=> d!67691 (validMask!0 mask!3809)))

(assert (=> d!67691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149157 k0!2524 (array!15136 (store (arr!7165 a!3312) i!1256 k0!2524) (size!7517 a!3312)) mask!3809) lt!149210)))

(declare-fun b!299906 () Bool)

(assert (=> b!299906 (= e!189411 (bvsge (x!29650 lt!149210) #b01111111111111111111111111111110))))

(declare-fun b!299907 () Bool)

(declare-fun e!189409 () SeekEntryResult!2279)

(assert (=> b!299907 (= e!189409 (Intermediate!2279 false lt!149157 #b00000000000000000000000000000000))))

(declare-fun b!299908 () Bool)

(assert (=> b!299908 (= e!189410 e!189409)))

(declare-fun c!48493 () Bool)

(assert (=> b!299908 (= c!48493 (or (= lt!149211 k0!2524) (= (bvadd lt!149211 lt!149211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299909 () Bool)

(assert (=> b!299909 (and (bvsge (index!11294 lt!149210) #b00000000000000000000000000000000) (bvslt (index!11294 lt!149210) (size!7517 (array!15136 (store (arr!7165 a!3312) i!1256 k0!2524) (size!7517 a!3312)))))))

(declare-fun e!189408 () Bool)

(assert (=> b!299909 (= e!189408 (= (select (arr!7165 (array!15136 (store (arr!7165 a!3312) i!1256 k0!2524) (size!7517 a!3312))) (index!11294 lt!149210)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299910 () Bool)

(assert (=> b!299910 (= e!189410 (Intermediate!2279 true lt!149157 #b00000000000000000000000000000000))))

(declare-fun b!299911 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299911 (= e!189409 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149157 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15136 (store (arr!7165 a!3312) i!1256 k0!2524) (size!7517 a!3312)) mask!3809))))

(declare-fun b!299912 () Bool)

(assert (=> b!299912 (and (bvsge (index!11294 lt!149210) #b00000000000000000000000000000000) (bvslt (index!11294 lt!149210) (size!7517 (array!15136 (store (arr!7165 a!3312) i!1256 k0!2524) (size!7517 a!3312)))))))

(declare-fun res!158106 () Bool)

(assert (=> b!299912 (= res!158106 (= (select (arr!7165 (array!15136 (store (arr!7165 a!3312) i!1256 k0!2524) (size!7517 a!3312))) (index!11294 lt!149210)) k0!2524))))

(assert (=> b!299912 (=> res!158106 e!189408)))

(declare-fun e!189412 () Bool)

(assert (=> b!299912 (= e!189412 e!189408)))

(declare-fun b!299913 () Bool)

(assert (=> b!299913 (and (bvsge (index!11294 lt!149210) #b00000000000000000000000000000000) (bvslt (index!11294 lt!149210) (size!7517 (array!15136 (store (arr!7165 a!3312) i!1256 k0!2524) (size!7517 a!3312)))))))

(declare-fun res!158105 () Bool)

(assert (=> b!299913 (= res!158105 (= (select (arr!7165 (array!15136 (store (arr!7165 a!3312) i!1256 k0!2524) (size!7517 a!3312))) (index!11294 lt!149210)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299913 (=> res!158105 e!189408)))

(declare-fun b!299914 () Bool)

(assert (=> b!299914 (= e!189411 e!189412)))

(declare-fun res!158107 () Bool)

(assert (=> b!299914 (= res!158107 (and ((_ is Intermediate!2279) lt!149210) (not (undefined!3091 lt!149210)) (bvslt (x!29650 lt!149210) #b01111111111111111111111111111110) (bvsge (x!29650 lt!149210) #b00000000000000000000000000000000) (bvsge (x!29650 lt!149210) #b00000000000000000000000000000000)))))

(assert (=> b!299914 (=> (not res!158107) (not e!189412))))

(assert (= (and d!67691 c!48494) b!299910))

(assert (= (and d!67691 (not c!48494)) b!299908))

(assert (= (and b!299908 c!48493) b!299907))

(assert (= (and b!299908 (not c!48493)) b!299911))

(assert (= (and d!67691 c!48492) b!299906))

(assert (= (and d!67691 (not c!48492)) b!299914))

(assert (= (and b!299914 res!158107) b!299912))

(assert (= (and b!299912 (not res!158106)) b!299913))

(assert (= (and b!299913 (not res!158105)) b!299909))

(declare-fun m!312189 () Bool)

(assert (=> b!299911 m!312189))

(assert (=> b!299911 m!312189))

(declare-fun m!312193 () Bool)

(assert (=> b!299911 m!312193))

(declare-fun m!312197 () Bool)

(assert (=> b!299912 m!312197))

(assert (=> b!299909 m!312197))

(assert (=> b!299913 m!312197))

(declare-fun m!312199 () Bool)

(assert (=> d!67691 m!312199))

(assert (=> d!67691 m!312115))

(assert (=> b!299821 d!67691))

(declare-fun d!67699 () Bool)

(declare-fun e!189418 () Bool)

(assert (=> d!67699 e!189418))

(declare-fun c!48495 () Bool)

(declare-fun lt!149212 () SeekEntryResult!2279)

(assert (=> d!67699 (= c!48495 (and ((_ is Intermediate!2279) lt!149212) (undefined!3091 lt!149212)))))

(declare-fun e!189417 () SeekEntryResult!2279)

(assert (=> d!67699 (= lt!149212 e!189417)))

(declare-fun c!48497 () Bool)

(assert (=> d!67699 (= c!48497 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149213 () (_ BitVec 64))

(assert (=> d!67699 (= lt!149213 (select (arr!7165 a!3312) lt!149157))))

(assert (=> d!67699 (validMask!0 mask!3809)))

(assert (=> d!67699 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149157 k0!2524 a!3312 mask!3809) lt!149212)))

(declare-fun b!299917 () Bool)

(assert (=> b!299917 (= e!189418 (bvsge (x!29650 lt!149212) #b01111111111111111111111111111110))))

(declare-fun b!299918 () Bool)

(declare-fun e!189416 () SeekEntryResult!2279)

(assert (=> b!299918 (= e!189416 (Intermediate!2279 false lt!149157 #b00000000000000000000000000000000))))

(declare-fun b!299919 () Bool)

(assert (=> b!299919 (= e!189417 e!189416)))

(declare-fun c!48496 () Bool)

(assert (=> b!299919 (= c!48496 (or (= lt!149213 k0!2524) (= (bvadd lt!149213 lt!149213) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299920 () Bool)

(assert (=> b!299920 (and (bvsge (index!11294 lt!149212) #b00000000000000000000000000000000) (bvslt (index!11294 lt!149212) (size!7517 a!3312)))))

(declare-fun e!189415 () Bool)

(assert (=> b!299920 (= e!189415 (= (select (arr!7165 a!3312) (index!11294 lt!149212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299921 () Bool)

(assert (=> b!299921 (= e!189417 (Intermediate!2279 true lt!149157 #b00000000000000000000000000000000))))

(declare-fun b!299922 () Bool)

(assert (=> b!299922 (= e!189416 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149157 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!299923 () Bool)

(assert (=> b!299923 (and (bvsge (index!11294 lt!149212) #b00000000000000000000000000000000) (bvslt (index!11294 lt!149212) (size!7517 a!3312)))))

(declare-fun res!158111 () Bool)

(assert (=> b!299923 (= res!158111 (= (select (arr!7165 a!3312) (index!11294 lt!149212)) k0!2524))))

(assert (=> b!299923 (=> res!158111 e!189415)))

(declare-fun e!189419 () Bool)

(assert (=> b!299923 (= e!189419 e!189415)))

(declare-fun b!299924 () Bool)

(assert (=> b!299924 (and (bvsge (index!11294 lt!149212) #b00000000000000000000000000000000) (bvslt (index!11294 lt!149212) (size!7517 a!3312)))))

(declare-fun res!158110 () Bool)

(assert (=> b!299924 (= res!158110 (= (select (arr!7165 a!3312) (index!11294 lt!149212)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299924 (=> res!158110 e!189415)))

(declare-fun b!299925 () Bool)

(assert (=> b!299925 (= e!189418 e!189419)))

(declare-fun res!158112 () Bool)

(assert (=> b!299925 (= res!158112 (and ((_ is Intermediate!2279) lt!149212) (not (undefined!3091 lt!149212)) (bvslt (x!29650 lt!149212) #b01111111111111111111111111111110) (bvsge (x!29650 lt!149212) #b00000000000000000000000000000000) (bvsge (x!29650 lt!149212) #b00000000000000000000000000000000)))))

(assert (=> b!299925 (=> (not res!158112) (not e!189419))))

(assert (= (and d!67699 c!48497) b!299921))

(assert (= (and d!67699 (not c!48497)) b!299919))

(assert (= (and b!299919 c!48496) b!299918))

(assert (= (and b!299919 (not c!48496)) b!299922))

(assert (= (and d!67699 c!48495) b!299917))

(assert (= (and d!67699 (not c!48495)) b!299925))

(assert (= (and b!299925 res!158112) b!299923))

(assert (= (and b!299923 (not res!158111)) b!299924))

(assert (= (and b!299924 (not res!158110)) b!299920))

(assert (=> b!299922 m!312189))

(assert (=> b!299922 m!312189))

(declare-fun m!312201 () Bool)

(assert (=> b!299922 m!312201))

(declare-fun m!312203 () Bool)

(assert (=> b!299923 m!312203))

(assert (=> b!299920 m!312203))

(assert (=> b!299924 m!312203))

(declare-fun m!312205 () Bool)

(assert (=> d!67699 m!312205))

(assert (=> d!67699 m!312115))

(assert (=> b!299821 d!67699))

(declare-fun d!67701 () Bool)

(declare-fun lt!149223 () (_ BitVec 32))

(declare-fun lt!149222 () (_ BitVec 32))

(assert (=> d!67701 (= lt!149223 (bvmul (bvxor lt!149222 (bvlshr lt!149222 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67701 (= lt!149222 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67701 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158113 (let ((h!5231 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29655 (bvmul (bvxor h!5231 (bvlshr h!5231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29655 (bvlshr x!29655 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158113 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158113 #b00000000000000000000000000000000))))))

(assert (=> d!67701 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!149223 (bvlshr lt!149223 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299821 d!67701))

(declare-fun lt!149250 () SeekEntryResult!2279)

(declare-fun e!189455 () SeekEntryResult!2279)

(declare-fun b!299986 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15135 (_ BitVec 32)) SeekEntryResult!2279)

(assert (=> b!299986 (= e!189455 (seekKeyOrZeroReturnVacant!0 (x!29650 lt!149250) (index!11294 lt!149250) (index!11294 lt!149250) k0!2524 a!3312 mask!3809))))

(declare-fun b!299987 () Bool)

(declare-fun e!189456 () SeekEntryResult!2279)

(assert (=> b!299987 (= e!189456 (Found!2279 (index!11294 lt!149250)))))

(declare-fun d!67703 () Bool)

(declare-fun lt!149249 () SeekEntryResult!2279)

(assert (=> d!67703 (and (or ((_ is Undefined!2279) lt!149249) (not ((_ is Found!2279) lt!149249)) (and (bvsge (index!11293 lt!149249) #b00000000000000000000000000000000) (bvslt (index!11293 lt!149249) (size!7517 a!3312)))) (or ((_ is Undefined!2279) lt!149249) ((_ is Found!2279) lt!149249) (not ((_ is MissingZero!2279) lt!149249)) (and (bvsge (index!11292 lt!149249) #b00000000000000000000000000000000) (bvslt (index!11292 lt!149249) (size!7517 a!3312)))) (or ((_ is Undefined!2279) lt!149249) ((_ is Found!2279) lt!149249) ((_ is MissingZero!2279) lt!149249) (not ((_ is MissingVacant!2279) lt!149249)) (and (bvsge (index!11295 lt!149249) #b00000000000000000000000000000000) (bvslt (index!11295 lt!149249) (size!7517 a!3312)))) (or ((_ is Undefined!2279) lt!149249) (ite ((_ is Found!2279) lt!149249) (= (select (arr!7165 a!3312) (index!11293 lt!149249)) k0!2524) (ite ((_ is MissingZero!2279) lt!149249) (= (select (arr!7165 a!3312) (index!11292 lt!149249)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2279) lt!149249) (= (select (arr!7165 a!3312) (index!11295 lt!149249)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!189457 () SeekEntryResult!2279)

(assert (=> d!67703 (= lt!149249 e!189457)))

(declare-fun c!48520 () Bool)

(assert (=> d!67703 (= c!48520 (and ((_ is Intermediate!2279) lt!149250) (undefined!3091 lt!149250)))))

(assert (=> d!67703 (= lt!149250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67703 (validMask!0 mask!3809)))

(assert (=> d!67703 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!149249)))

(declare-fun b!299988 () Bool)

(assert (=> b!299988 (= e!189457 Undefined!2279)))

(declare-fun b!299989 () Bool)

(declare-fun c!48519 () Bool)

(declare-fun lt!149251 () (_ BitVec 64))

(assert (=> b!299989 (= c!48519 (= lt!149251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299989 (= e!189456 e!189455)))

(declare-fun b!299990 () Bool)

(assert (=> b!299990 (= e!189457 e!189456)))

(assert (=> b!299990 (= lt!149251 (select (arr!7165 a!3312) (index!11294 lt!149250)))))

(declare-fun c!48521 () Bool)

(assert (=> b!299990 (= c!48521 (= lt!149251 k0!2524))))

(declare-fun b!299991 () Bool)

(assert (=> b!299991 (= e!189455 (MissingZero!2279 (index!11294 lt!149250)))))

(assert (= (and d!67703 c!48520) b!299988))

(assert (= (and d!67703 (not c!48520)) b!299990))

(assert (= (and b!299990 c!48521) b!299987))

(assert (= (and b!299990 (not c!48521)) b!299989))

(assert (= (and b!299989 c!48519) b!299991))

(assert (= (and b!299989 (not c!48519)) b!299986))

(declare-fun m!312231 () Bool)

(assert (=> b!299986 m!312231))

(declare-fun m!312233 () Bool)

(assert (=> d!67703 m!312233))

(assert (=> d!67703 m!312115))

(declare-fun m!312235 () Bool)

(assert (=> d!67703 m!312235))

(declare-fun m!312237 () Bool)

(assert (=> d!67703 m!312237))

(assert (=> d!67703 m!312113))

(assert (=> d!67703 m!312113))

(declare-fun m!312239 () Bool)

(assert (=> d!67703 m!312239))

(declare-fun m!312241 () Bool)

(assert (=> b!299990 m!312241))

(assert (=> b!299819 d!67703))

(declare-fun d!67713 () Bool)

(declare-fun res!158137 () Bool)

(declare-fun e!189468 () Bool)

(assert (=> d!67713 (=> res!158137 e!189468)))

(assert (=> d!67713 (= res!158137 (= (select (arr!7165 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67713 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189468)))

(declare-fun b!300008 () Bool)

(declare-fun e!189469 () Bool)

(assert (=> b!300008 (= e!189468 e!189469)))

(declare-fun res!158138 () Bool)

(assert (=> b!300008 (=> (not res!158138) (not e!189469))))

(assert (=> b!300008 (= res!158138 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7517 a!3312)))))

(declare-fun b!300009 () Bool)

(assert (=> b!300009 (= e!189469 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67713 (not res!158137)) b!300008))

(assert (= (and b!300008 res!158138) b!300009))

(assert (=> d!67713 m!312167))

(declare-fun m!312243 () Bool)

(assert (=> b!300009 m!312243))

(assert (=> b!299820 d!67713))

(check-sat (not d!67699) (not bm!25823) (not b!299870) (not b!299911) (not b!299922) (not b!299871) (not d!67703) (not d!67691) (not b!300009) (not b!299986))
(check-sat)
