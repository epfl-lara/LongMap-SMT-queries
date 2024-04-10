; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29400 () Bool)

(assert start!29400)

(declare-fun b!297727 () Bool)

(declare-fun res!157025 () Bool)

(declare-fun e!188128 () Bool)

(assert (=> b!297727 (=> (not res!157025) (not e!188128))))

(declare-datatypes ((array!15068 0))(
  ( (array!15069 (arr!7140 (Array (_ BitVec 32) (_ BitVec 64))) (size!7492 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15068)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15068 (_ BitVec 32)) Bool)

(assert (=> b!297727 (= res!157025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297728 () Bool)

(declare-fun e!188131 () Bool)

(assert (=> b!297728 (= e!188128 e!188131)))

(declare-fun res!157020 () Bool)

(assert (=> b!297728 (=> (not res!157020) (not e!188131))))

(declare-fun lt!147992 () Bool)

(assert (=> b!297728 (= res!157020 lt!147992)))

(declare-fun lt!147991 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2289 0))(
  ( (MissingZero!2289 (index!11326 (_ BitVec 32))) (Found!2289 (index!11327 (_ BitVec 32))) (Intermediate!2289 (undefined!3101 Bool) (index!11328 (_ BitVec 32)) (x!29543 (_ BitVec 32))) (Undefined!2289) (MissingVacant!2289 (index!11329 (_ BitVec 32))) )
))
(declare-fun lt!147989 () SeekEntryResult!2289)

(declare-fun lt!147986 () array!15068)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15068 (_ BitVec 32)) SeekEntryResult!2289)

(assert (=> b!297728 (= lt!147989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147991 k0!2524 lt!147986 mask!3809))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!297728 (= lt!147986 (array!15069 (store (arr!7140 a!3312) i!1256 k0!2524) (size!7492 a!3312)))))

(declare-fun lt!147987 () SeekEntryResult!2289)

(assert (=> b!297728 (= lt!147987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147991 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297728 (= lt!147991 (toIndex!0 k0!2524 mask!3809))))

(declare-fun e!188134 () Bool)

(declare-fun b!297729 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15068 (_ BitVec 32)) SeekEntryResult!2289)

(assert (=> b!297729 (= e!188134 (not (= (seekEntryOrOpen!0 k0!2524 lt!147986 mask!3809) (Found!2289 i!1256))))))

(declare-fun b!297730 () Bool)

(declare-fun res!157019 () Bool)

(declare-fun e!188130 () Bool)

(assert (=> b!297730 (=> (not res!157019) (not e!188130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297730 (= res!157019 (validKeyInArray!0 k0!2524))))

(declare-fun b!297731 () Bool)

(declare-datatypes ((Unit!9297 0))(
  ( (Unit!9298) )
))
(declare-fun e!188133 () Unit!9297)

(declare-fun e!188132 () Unit!9297)

(assert (=> b!297731 (= e!188133 e!188132)))

(declare-fun c!47937 () Bool)

(get-info :version)

(assert (=> b!297731 (= c!47937 ((_ is Intermediate!2289) lt!147987))))

(declare-fun b!297732 () Bool)

(assert (=> b!297732 (= e!188130 e!188128)))

(declare-fun res!157023 () Bool)

(assert (=> b!297732 (=> (not res!157023) (not e!188128))))

(declare-fun lt!147993 () SeekEntryResult!2289)

(assert (=> b!297732 (= res!157023 (or lt!147992 (= lt!147993 (MissingVacant!2289 i!1256))))))

(assert (=> b!297732 (= lt!147992 (= lt!147993 (MissingZero!2289 i!1256)))))

(assert (=> b!297732 (= lt!147993 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297733 () Bool)

(declare-fun res!157024 () Bool)

(assert (=> b!297733 (=> (not res!157024) (not e!188130))))

(assert (=> b!297733 (= res!157024 (and (= (size!7492 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7492 a!3312))))))

(declare-fun res!157026 () Bool)

(assert (=> start!29400 (=> (not res!157026) (not e!188130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29400 (= res!157026 (validMask!0 mask!3809))))

(assert (=> start!29400 e!188130))

(assert (=> start!29400 true))

(declare-fun array_inv!5103 (array!15068) Bool)

(assert (=> start!29400 (array_inv!5103 a!3312)))

(declare-fun b!297726 () Bool)

(assert (=> b!297726 (and (= lt!147989 lt!147987) (= (select (store (arr!7140 a!3312) i!1256 k0!2524) (index!11328 lt!147987)) k0!2524))))

(declare-fun lt!147990 () Unit!9297)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15068 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9297)

(assert (=> b!297726 (= lt!147990 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147991 (index!11328 lt!147987) (x!29543 lt!147987) mask!3809))))

(assert (=> b!297726 (and (= (select (arr!7140 a!3312) (index!11328 lt!147987)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11328 lt!147987) i!1256))))

(declare-fun Unit!9299 () Unit!9297)

(assert (=> b!297726 (= e!188132 Unit!9299)))

(declare-fun b!297734 () Bool)

(assert (=> b!297734 (= e!188131 e!188134)))

(declare-fun res!157022 () Bool)

(assert (=> b!297734 (=> (not res!157022) (not e!188134))))

(assert (=> b!297734 (= res!157022 (= lt!147989 lt!147987))))

(declare-fun lt!147988 () Unit!9297)

(assert (=> b!297734 (= lt!147988 e!188133)))

(declare-fun c!47936 () Bool)

(assert (=> b!297734 (= c!47936 (or (and ((_ is Intermediate!2289) lt!147987) (undefined!3101 lt!147987)) (and ((_ is Intermediate!2289) lt!147987) (= (select (arr!7140 a!3312) (index!11328 lt!147987)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2289) lt!147987) (= (select (arr!7140 a!3312) (index!11328 lt!147987)) k0!2524))))))

(declare-fun b!297735 () Bool)

(declare-fun Unit!9300 () Unit!9297)

(assert (=> b!297735 (= e!188133 Unit!9300)))

(assert (=> b!297735 false))

(declare-fun b!297736 () Bool)

(assert (=> b!297736 false))

(declare-fun Unit!9301 () Unit!9297)

(assert (=> b!297736 (= e!188132 Unit!9301)))

(declare-fun b!297737 () Bool)

(declare-fun res!157021 () Bool)

(assert (=> b!297737 (=> (not res!157021) (not e!188130))))

(declare-fun arrayContainsKey!0 (array!15068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297737 (= res!157021 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29400 res!157026) b!297733))

(assert (= (and b!297733 res!157024) b!297730))

(assert (= (and b!297730 res!157019) b!297737))

(assert (= (and b!297737 res!157021) b!297732))

(assert (= (and b!297732 res!157023) b!297727))

(assert (= (and b!297727 res!157025) b!297728))

(assert (= (and b!297728 res!157020) b!297734))

(assert (= (and b!297734 c!47936) b!297735))

(assert (= (and b!297734 (not c!47936)) b!297731))

(assert (= (and b!297731 c!47937) b!297726))

(assert (= (and b!297731 (not c!47937)) b!297736))

(assert (= (and b!297734 res!157022) b!297729))

(declare-fun m!310405 () Bool)

(assert (=> b!297728 m!310405))

(declare-fun m!310407 () Bool)

(assert (=> b!297728 m!310407))

(declare-fun m!310409 () Bool)

(assert (=> b!297728 m!310409))

(declare-fun m!310411 () Bool)

(assert (=> b!297728 m!310411))

(declare-fun m!310413 () Bool)

(assert (=> b!297734 m!310413))

(declare-fun m!310415 () Bool)

(assert (=> b!297730 m!310415))

(declare-fun m!310417 () Bool)

(assert (=> b!297727 m!310417))

(declare-fun m!310419 () Bool)

(assert (=> start!29400 m!310419))

(declare-fun m!310421 () Bool)

(assert (=> start!29400 m!310421))

(assert (=> b!297726 m!310407))

(declare-fun m!310423 () Bool)

(assert (=> b!297726 m!310423))

(declare-fun m!310425 () Bool)

(assert (=> b!297726 m!310425))

(assert (=> b!297726 m!310413))

(declare-fun m!310427 () Bool)

(assert (=> b!297732 m!310427))

(declare-fun m!310429 () Bool)

(assert (=> b!297729 m!310429))

(declare-fun m!310431 () Bool)

(assert (=> b!297737 m!310431))

(check-sat (not b!297728) (not b!297727) (not b!297732) (not b!297730) (not b!297726) (not b!297737) (not b!297729) (not start!29400))
(check-sat)
(get-model)

(declare-fun d!67223 () Bool)

(declare-fun e!188158 () Bool)

(assert (=> d!67223 e!188158))

(declare-fun res!157053 () Bool)

(assert (=> d!67223 (=> (not res!157053) (not e!188158))))

(assert (=> d!67223 (= res!157053 (and (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7492 a!3312))))))

(declare-fun lt!148020 () Unit!9297)

(declare-fun choose!42 (array!15068 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9297)

(assert (=> d!67223 (= lt!148020 (choose!42 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147991 (index!11328 lt!147987) (x!29543 lt!147987) mask!3809))))

(assert (=> d!67223 (validMask!0 mask!3809)))

(assert (=> d!67223 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147991 (index!11328 lt!147987) (x!29543 lt!147987) mask!3809) lt!148020)))

(declare-fun b!297776 () Bool)

(assert (=> b!297776 (= e!188158 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147991 k0!2524 (array!15069 (store (arr!7140 a!3312) i!1256 k0!2524) (size!7492 a!3312)) mask!3809) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147991 k0!2524 a!3312 mask!3809)))))

(assert (= (and d!67223 res!157053) b!297776))

(declare-fun m!310461 () Bool)

(assert (=> d!67223 m!310461))

(assert (=> d!67223 m!310419))

(assert (=> b!297776 m!310407))

(declare-fun m!310463 () Bool)

(assert (=> b!297776 m!310463))

(assert (=> b!297776 m!310409))

(assert (=> b!297726 d!67223))

(declare-fun b!297798 () Bool)

(declare-fun e!188173 () SeekEntryResult!2289)

(declare-fun e!188171 () SeekEntryResult!2289)

(assert (=> b!297798 (= e!188173 e!188171)))

(declare-fun lt!148034 () (_ BitVec 64))

(declare-fun lt!148033 () SeekEntryResult!2289)

(assert (=> b!297798 (= lt!148034 (select (arr!7140 lt!147986) (index!11328 lt!148033)))))

(declare-fun c!47954 () Bool)

(assert (=> b!297798 (= c!47954 (= lt!148034 k0!2524))))

(declare-fun b!297799 () Bool)

(assert (=> b!297799 (= e!188171 (Found!2289 (index!11328 lt!148033)))))

(declare-fun b!297800 () Bool)

(declare-fun c!47953 () Bool)

(assert (=> b!297800 (= c!47953 (= lt!148034 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188172 () SeekEntryResult!2289)

(assert (=> b!297800 (= e!188171 e!188172)))

(declare-fun b!297797 () Bool)

(assert (=> b!297797 (= e!188173 Undefined!2289)))

(declare-fun d!67225 () Bool)

(declare-fun lt!148035 () SeekEntryResult!2289)

(assert (=> d!67225 (and (or ((_ is Undefined!2289) lt!148035) (not ((_ is Found!2289) lt!148035)) (and (bvsge (index!11327 lt!148035) #b00000000000000000000000000000000) (bvslt (index!11327 lt!148035) (size!7492 lt!147986)))) (or ((_ is Undefined!2289) lt!148035) ((_ is Found!2289) lt!148035) (not ((_ is MissingZero!2289) lt!148035)) (and (bvsge (index!11326 lt!148035) #b00000000000000000000000000000000) (bvslt (index!11326 lt!148035) (size!7492 lt!147986)))) (or ((_ is Undefined!2289) lt!148035) ((_ is Found!2289) lt!148035) ((_ is MissingZero!2289) lt!148035) (not ((_ is MissingVacant!2289) lt!148035)) (and (bvsge (index!11329 lt!148035) #b00000000000000000000000000000000) (bvslt (index!11329 lt!148035) (size!7492 lt!147986)))) (or ((_ is Undefined!2289) lt!148035) (ite ((_ is Found!2289) lt!148035) (= (select (arr!7140 lt!147986) (index!11327 lt!148035)) k0!2524) (ite ((_ is MissingZero!2289) lt!148035) (= (select (arr!7140 lt!147986) (index!11326 lt!148035)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2289) lt!148035) (= (select (arr!7140 lt!147986) (index!11329 lt!148035)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67225 (= lt!148035 e!188173)))

(declare-fun c!47952 () Bool)

(assert (=> d!67225 (= c!47952 (and ((_ is Intermediate!2289) lt!148033) (undefined!3101 lt!148033)))))

(assert (=> d!67225 (= lt!148033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 lt!147986 mask!3809))))

(assert (=> d!67225 (validMask!0 mask!3809)))

(assert (=> d!67225 (= (seekEntryOrOpen!0 k0!2524 lt!147986 mask!3809) lt!148035)))

(declare-fun b!297801 () Bool)

(assert (=> b!297801 (= e!188172 (MissingZero!2289 (index!11328 lt!148033)))))

(declare-fun b!297802 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15068 (_ BitVec 32)) SeekEntryResult!2289)

(assert (=> b!297802 (= e!188172 (seekKeyOrZeroReturnVacant!0 (x!29543 lt!148033) (index!11328 lt!148033) (index!11328 lt!148033) k0!2524 lt!147986 mask!3809))))

(assert (= (and d!67225 c!47952) b!297797))

(assert (= (and d!67225 (not c!47952)) b!297798))

(assert (= (and b!297798 c!47954) b!297799))

(assert (= (and b!297798 (not c!47954)) b!297800))

(assert (= (and b!297800 c!47953) b!297801))

(assert (= (and b!297800 (not c!47953)) b!297802))

(declare-fun m!310465 () Bool)

(assert (=> b!297798 m!310465))

(assert (=> d!67225 m!310411))

(declare-fun m!310467 () Bool)

(assert (=> d!67225 m!310467))

(assert (=> d!67225 m!310411))

(declare-fun m!310469 () Bool)

(assert (=> d!67225 m!310469))

(declare-fun m!310471 () Bool)

(assert (=> d!67225 m!310471))

(assert (=> d!67225 m!310419))

(declare-fun m!310473 () Bool)

(assert (=> d!67225 m!310473))

(declare-fun m!310475 () Bool)

(assert (=> b!297802 m!310475))

(assert (=> b!297729 d!67225))

(declare-fun d!67231 () Bool)

(assert (=> d!67231 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!297730 d!67231))

(declare-fun b!297864 () Bool)

(declare-fun e!188208 () Bool)

(declare-fun e!188210 () Bool)

(assert (=> b!297864 (= e!188208 e!188210)))

(declare-fun res!157070 () Bool)

(declare-fun lt!148064 () SeekEntryResult!2289)

(assert (=> b!297864 (= res!157070 (and ((_ is Intermediate!2289) lt!148064) (not (undefined!3101 lt!148064)) (bvslt (x!29543 lt!148064) #b01111111111111111111111111111110) (bvsge (x!29543 lt!148064) #b00000000000000000000000000000000) (bvsge (x!29543 lt!148064) #b00000000000000000000000000000000)))))

(assert (=> b!297864 (=> (not res!157070) (not e!188210))))

(declare-fun b!297865 () Bool)

(assert (=> b!297865 (= e!188208 (bvsge (x!29543 lt!148064) #b01111111111111111111111111111110))))

(declare-fun b!297866 () Bool)

(assert (=> b!297866 (and (bvsge (index!11328 lt!148064) #b00000000000000000000000000000000) (bvslt (index!11328 lt!148064) (size!7492 lt!147986)))))

(declare-fun e!188212 () Bool)

(assert (=> b!297866 (= e!188212 (= (select (arr!7140 lt!147986) (index!11328 lt!148064)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67233 () Bool)

(assert (=> d!67233 e!188208))

(declare-fun c!47980 () Bool)

(assert (=> d!67233 (= c!47980 (and ((_ is Intermediate!2289) lt!148064) (undefined!3101 lt!148064)))))

(declare-fun e!188209 () SeekEntryResult!2289)

(assert (=> d!67233 (= lt!148064 e!188209)))

(declare-fun c!47982 () Bool)

(assert (=> d!67233 (= c!47982 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148065 () (_ BitVec 64))

(assert (=> d!67233 (= lt!148065 (select (arr!7140 lt!147986) lt!147991))))

(assert (=> d!67233 (validMask!0 mask!3809)))

(assert (=> d!67233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147991 k0!2524 lt!147986 mask!3809) lt!148064)))

(declare-fun e!188211 () SeekEntryResult!2289)

(declare-fun b!297867 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297867 (= e!188211 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147991 #b00000000000000000000000000000000 mask!3809) k0!2524 lt!147986 mask!3809))))

(declare-fun b!297868 () Bool)

(assert (=> b!297868 (and (bvsge (index!11328 lt!148064) #b00000000000000000000000000000000) (bvslt (index!11328 lt!148064) (size!7492 lt!147986)))))

(declare-fun res!157069 () Bool)

(assert (=> b!297868 (= res!157069 (= (select (arr!7140 lt!147986) (index!11328 lt!148064)) k0!2524))))

(assert (=> b!297868 (=> res!157069 e!188212)))

(assert (=> b!297868 (= e!188210 e!188212)))

(declare-fun b!297869 () Bool)

(assert (=> b!297869 (= e!188209 e!188211)))

(declare-fun c!47981 () Bool)

(assert (=> b!297869 (= c!47981 (or (= lt!148065 k0!2524) (= (bvadd lt!148065 lt!148065) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297870 () Bool)

(assert (=> b!297870 (= e!188209 (Intermediate!2289 true lt!147991 #b00000000000000000000000000000000))))

(declare-fun b!297871 () Bool)

(assert (=> b!297871 (and (bvsge (index!11328 lt!148064) #b00000000000000000000000000000000) (bvslt (index!11328 lt!148064) (size!7492 lt!147986)))))

(declare-fun res!157071 () Bool)

(assert (=> b!297871 (= res!157071 (= (select (arr!7140 lt!147986) (index!11328 lt!148064)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297871 (=> res!157071 e!188212)))

(declare-fun b!297872 () Bool)

(assert (=> b!297872 (= e!188211 (Intermediate!2289 false lt!147991 #b00000000000000000000000000000000))))

(assert (= (and d!67233 c!47982) b!297870))

(assert (= (and d!67233 (not c!47982)) b!297869))

(assert (= (and b!297869 c!47981) b!297872))

(assert (= (and b!297869 (not c!47981)) b!297867))

(assert (= (and d!67233 c!47980) b!297865))

(assert (= (and d!67233 (not c!47980)) b!297864))

(assert (= (and b!297864 res!157070) b!297868))

(assert (= (and b!297868 (not res!157069)) b!297871))

(assert (= (and b!297871 (not res!157071)) b!297866))

(declare-fun m!310517 () Bool)

(assert (=> b!297867 m!310517))

(assert (=> b!297867 m!310517))

(declare-fun m!310519 () Bool)

(assert (=> b!297867 m!310519))

(declare-fun m!310521 () Bool)

(assert (=> d!67233 m!310521))

(assert (=> d!67233 m!310419))

(declare-fun m!310523 () Bool)

(assert (=> b!297871 m!310523))

(assert (=> b!297868 m!310523))

(assert (=> b!297866 m!310523))

(assert (=> b!297728 d!67233))

(declare-fun b!297873 () Bool)

(declare-fun e!188213 () Bool)

(declare-fun e!188215 () Bool)

(assert (=> b!297873 (= e!188213 e!188215)))

(declare-fun res!157073 () Bool)

(declare-fun lt!148066 () SeekEntryResult!2289)

(assert (=> b!297873 (= res!157073 (and ((_ is Intermediate!2289) lt!148066) (not (undefined!3101 lt!148066)) (bvslt (x!29543 lt!148066) #b01111111111111111111111111111110) (bvsge (x!29543 lt!148066) #b00000000000000000000000000000000) (bvsge (x!29543 lt!148066) #b00000000000000000000000000000000)))))

(assert (=> b!297873 (=> (not res!157073) (not e!188215))))

(declare-fun b!297874 () Bool)

(assert (=> b!297874 (= e!188213 (bvsge (x!29543 lt!148066) #b01111111111111111111111111111110))))

(declare-fun b!297875 () Bool)

(assert (=> b!297875 (and (bvsge (index!11328 lt!148066) #b00000000000000000000000000000000) (bvslt (index!11328 lt!148066) (size!7492 a!3312)))))

(declare-fun e!188217 () Bool)

(assert (=> b!297875 (= e!188217 (= (select (arr!7140 a!3312) (index!11328 lt!148066)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67243 () Bool)

(assert (=> d!67243 e!188213))

(declare-fun c!47983 () Bool)

(assert (=> d!67243 (= c!47983 (and ((_ is Intermediate!2289) lt!148066) (undefined!3101 lt!148066)))))

(declare-fun e!188214 () SeekEntryResult!2289)

(assert (=> d!67243 (= lt!148066 e!188214)))

(declare-fun c!47985 () Bool)

(assert (=> d!67243 (= c!47985 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148067 () (_ BitVec 64))

(assert (=> d!67243 (= lt!148067 (select (arr!7140 a!3312) lt!147991))))

(assert (=> d!67243 (validMask!0 mask!3809)))

(assert (=> d!67243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147991 k0!2524 a!3312 mask!3809) lt!148066)))

(declare-fun b!297876 () Bool)

(declare-fun e!188216 () SeekEntryResult!2289)

(assert (=> b!297876 (= e!188216 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147991 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!297877 () Bool)

(assert (=> b!297877 (and (bvsge (index!11328 lt!148066) #b00000000000000000000000000000000) (bvslt (index!11328 lt!148066) (size!7492 a!3312)))))

(declare-fun res!157072 () Bool)

(assert (=> b!297877 (= res!157072 (= (select (arr!7140 a!3312) (index!11328 lt!148066)) k0!2524))))

(assert (=> b!297877 (=> res!157072 e!188217)))

(assert (=> b!297877 (= e!188215 e!188217)))

(declare-fun b!297878 () Bool)

(assert (=> b!297878 (= e!188214 e!188216)))

(declare-fun c!47984 () Bool)

(assert (=> b!297878 (= c!47984 (or (= lt!148067 k0!2524) (= (bvadd lt!148067 lt!148067) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297879 () Bool)

(assert (=> b!297879 (= e!188214 (Intermediate!2289 true lt!147991 #b00000000000000000000000000000000))))

(declare-fun b!297880 () Bool)

(assert (=> b!297880 (and (bvsge (index!11328 lt!148066) #b00000000000000000000000000000000) (bvslt (index!11328 lt!148066) (size!7492 a!3312)))))

(declare-fun res!157074 () Bool)

(assert (=> b!297880 (= res!157074 (= (select (arr!7140 a!3312) (index!11328 lt!148066)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297880 (=> res!157074 e!188217)))

(declare-fun b!297881 () Bool)

(assert (=> b!297881 (= e!188216 (Intermediate!2289 false lt!147991 #b00000000000000000000000000000000))))

(assert (= (and d!67243 c!47985) b!297879))

(assert (= (and d!67243 (not c!47985)) b!297878))

(assert (= (and b!297878 c!47984) b!297881))

(assert (= (and b!297878 (not c!47984)) b!297876))

(assert (= (and d!67243 c!47983) b!297874))

(assert (= (and d!67243 (not c!47983)) b!297873))

(assert (= (and b!297873 res!157073) b!297877))

(assert (= (and b!297877 (not res!157072)) b!297880))

(assert (= (and b!297880 (not res!157074)) b!297875))

(assert (=> b!297876 m!310517))

(assert (=> b!297876 m!310517))

(declare-fun m!310525 () Bool)

(assert (=> b!297876 m!310525))

(declare-fun m!310527 () Bool)

(assert (=> d!67243 m!310527))

(assert (=> d!67243 m!310419))

(declare-fun m!310529 () Bool)

(assert (=> b!297880 m!310529))

(assert (=> b!297877 m!310529))

(assert (=> b!297875 m!310529))

(assert (=> b!297728 d!67243))

(declare-fun d!67245 () Bool)

(declare-fun lt!148073 () (_ BitVec 32))

(declare-fun lt!148072 () (_ BitVec 32))

(assert (=> d!67245 (= lt!148073 (bvmul (bvxor lt!148072 (bvlshr lt!148072 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67245 (= lt!148072 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67245 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157075 (let ((h!5301 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29548 (bvmul (bvxor h!5301 (bvlshr h!5301 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29548 (bvlshr x!29548 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157075 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157075 #b00000000000000000000000000000000))))))

(assert (=> d!67245 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148073 (bvlshr lt!148073 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!297728 d!67245))

(declare-fun b!297883 () Bool)

(declare-fun e!188220 () SeekEntryResult!2289)

(declare-fun e!188218 () SeekEntryResult!2289)

(assert (=> b!297883 (= e!188220 e!188218)))

(declare-fun lt!148075 () (_ BitVec 64))

(declare-fun lt!148074 () SeekEntryResult!2289)

(assert (=> b!297883 (= lt!148075 (select (arr!7140 a!3312) (index!11328 lt!148074)))))

(declare-fun c!47988 () Bool)

(assert (=> b!297883 (= c!47988 (= lt!148075 k0!2524))))

(declare-fun b!297884 () Bool)

(assert (=> b!297884 (= e!188218 (Found!2289 (index!11328 lt!148074)))))

(declare-fun b!297885 () Bool)

(declare-fun c!47987 () Bool)

(assert (=> b!297885 (= c!47987 (= lt!148075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188219 () SeekEntryResult!2289)

(assert (=> b!297885 (= e!188218 e!188219)))

(declare-fun b!297882 () Bool)

(assert (=> b!297882 (= e!188220 Undefined!2289)))

(declare-fun d!67247 () Bool)

(declare-fun lt!148076 () SeekEntryResult!2289)

(assert (=> d!67247 (and (or ((_ is Undefined!2289) lt!148076) (not ((_ is Found!2289) lt!148076)) (and (bvsge (index!11327 lt!148076) #b00000000000000000000000000000000) (bvslt (index!11327 lt!148076) (size!7492 a!3312)))) (or ((_ is Undefined!2289) lt!148076) ((_ is Found!2289) lt!148076) (not ((_ is MissingZero!2289) lt!148076)) (and (bvsge (index!11326 lt!148076) #b00000000000000000000000000000000) (bvslt (index!11326 lt!148076) (size!7492 a!3312)))) (or ((_ is Undefined!2289) lt!148076) ((_ is Found!2289) lt!148076) ((_ is MissingZero!2289) lt!148076) (not ((_ is MissingVacant!2289) lt!148076)) (and (bvsge (index!11329 lt!148076) #b00000000000000000000000000000000) (bvslt (index!11329 lt!148076) (size!7492 a!3312)))) (or ((_ is Undefined!2289) lt!148076) (ite ((_ is Found!2289) lt!148076) (= (select (arr!7140 a!3312) (index!11327 lt!148076)) k0!2524) (ite ((_ is MissingZero!2289) lt!148076) (= (select (arr!7140 a!3312) (index!11326 lt!148076)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2289) lt!148076) (= (select (arr!7140 a!3312) (index!11329 lt!148076)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67247 (= lt!148076 e!188220)))

(declare-fun c!47986 () Bool)

(assert (=> d!67247 (= c!47986 (and ((_ is Intermediate!2289) lt!148074) (undefined!3101 lt!148074)))))

(assert (=> d!67247 (= lt!148074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67247 (validMask!0 mask!3809)))

(assert (=> d!67247 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148076)))

(declare-fun b!297886 () Bool)

(assert (=> b!297886 (= e!188219 (MissingZero!2289 (index!11328 lt!148074)))))

(declare-fun b!297887 () Bool)

(assert (=> b!297887 (= e!188219 (seekKeyOrZeroReturnVacant!0 (x!29543 lt!148074) (index!11328 lt!148074) (index!11328 lt!148074) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67247 c!47986) b!297882))

(assert (= (and d!67247 (not c!47986)) b!297883))

(assert (= (and b!297883 c!47988) b!297884))

(assert (= (and b!297883 (not c!47988)) b!297885))

(assert (= (and b!297885 c!47987) b!297886))

(assert (= (and b!297885 (not c!47987)) b!297887))

(declare-fun m!310531 () Bool)

(assert (=> b!297883 m!310531))

(assert (=> d!67247 m!310411))

(declare-fun m!310533 () Bool)

(assert (=> d!67247 m!310533))

(assert (=> d!67247 m!310411))

(declare-fun m!310535 () Bool)

(assert (=> d!67247 m!310535))

(declare-fun m!310537 () Bool)

(assert (=> d!67247 m!310537))

(assert (=> d!67247 m!310419))

(declare-fun m!310539 () Bool)

(assert (=> d!67247 m!310539))

(declare-fun m!310541 () Bool)

(assert (=> b!297887 m!310541))

(assert (=> b!297732 d!67247))

(declare-fun d!67249 () Bool)

(declare-fun res!157086 () Bool)

(declare-fun e!188235 () Bool)

(assert (=> d!67249 (=> res!157086 e!188235)))

(assert (=> d!67249 (= res!157086 (= (select (arr!7140 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67249 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188235)))

(declare-fun b!297908 () Bool)

(declare-fun e!188236 () Bool)

(assert (=> b!297908 (= e!188235 e!188236)))

(declare-fun res!157087 () Bool)

(assert (=> b!297908 (=> (not res!157087) (not e!188236))))

(assert (=> b!297908 (= res!157087 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7492 a!3312)))))

(declare-fun b!297909 () Bool)

(assert (=> b!297909 (= e!188236 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67249 (not res!157086)) b!297908))

(assert (= (and b!297908 res!157087) b!297909))

(declare-fun m!310543 () Bool)

(assert (=> d!67249 m!310543))

(declare-fun m!310545 () Bool)

(assert (=> b!297909 m!310545))

(assert (=> b!297737 d!67249))

(declare-fun d!67255 () Bool)

(assert (=> d!67255 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29400 d!67255))

(declare-fun d!67261 () Bool)

(assert (=> d!67261 (= (array_inv!5103 a!3312) (bvsge (size!7492 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29400 d!67261))

(declare-fun d!67263 () Bool)

(declare-fun res!157105 () Bool)

(declare-fun e!188268 () Bool)

(assert (=> d!67263 (=> res!157105 e!188268)))

(assert (=> d!67263 (= res!157105 (bvsge #b00000000000000000000000000000000 (size!7492 a!3312)))))

(assert (=> d!67263 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188268)))

(declare-fun b!297962 () Bool)

(declare-fun e!188267 () Bool)

(declare-fun e!188266 () Bool)

(assert (=> b!297962 (= e!188267 e!188266)))

(declare-fun lt!148106 () (_ BitVec 64))

(assert (=> b!297962 (= lt!148106 (select (arr!7140 a!3312) #b00000000000000000000000000000000))))

(declare-fun lt!148105 () Unit!9297)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15068 (_ BitVec 64) (_ BitVec 32)) Unit!9297)

(assert (=> b!297962 (= lt!148105 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148106 #b00000000000000000000000000000000))))

(assert (=> b!297962 (arrayContainsKey!0 a!3312 lt!148106 #b00000000000000000000000000000000)))

(declare-fun lt!148104 () Unit!9297)

(assert (=> b!297962 (= lt!148104 lt!148105)))

(declare-fun res!157106 () Bool)

(assert (=> b!297962 (= res!157106 (= (seekEntryOrOpen!0 (select (arr!7140 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2289 #b00000000000000000000000000000000)))))

(assert (=> b!297962 (=> (not res!157106) (not e!188266))))

(declare-fun bm!25765 () Bool)

(declare-fun call!25768 () Bool)

(assert (=> bm!25765 (= call!25768 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!297963 () Bool)

(assert (=> b!297963 (= e!188268 e!188267)))

(declare-fun c!48012 () Bool)

(assert (=> b!297963 (= c!48012 (validKeyInArray!0 (select (arr!7140 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!297964 () Bool)

(assert (=> b!297964 (= e!188267 call!25768)))

(declare-fun b!297965 () Bool)

(assert (=> b!297965 (= e!188266 call!25768)))

(assert (= (and d!67263 (not res!157105)) b!297963))

(assert (= (and b!297963 c!48012) b!297962))

(assert (= (and b!297963 (not c!48012)) b!297964))

(assert (= (and b!297962 res!157106) b!297965))

(assert (= (or b!297965 b!297964) bm!25765))

(assert (=> b!297962 m!310543))

(declare-fun m!310573 () Bool)

(assert (=> b!297962 m!310573))

(declare-fun m!310575 () Bool)

(assert (=> b!297962 m!310575))

(assert (=> b!297962 m!310543))

(declare-fun m!310577 () Bool)

(assert (=> b!297962 m!310577))

(declare-fun m!310579 () Bool)

(assert (=> bm!25765 m!310579))

(assert (=> b!297963 m!310543))

(assert (=> b!297963 m!310543))

(declare-fun m!310581 () Bool)

(assert (=> b!297963 m!310581))

(assert (=> b!297727 d!67263))

(check-sat (not b!297909) (not b!297776) (not b!297962) (not b!297963) (not d!67233) (not d!67223) (not d!67247) (not b!297876) (not b!297802) (not bm!25765) (not b!297887) (not b!297867) (not d!67243) (not d!67225))
(check-sat)
