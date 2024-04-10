; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29402 () Bool)

(assert start!29402)

(declare-fun b!297762 () Bool)

(declare-fun res!157043 () Bool)

(declare-fun e!188152 () Bool)

(assert (=> b!297762 (=> (not res!157043) (not e!188152))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15070 0))(
  ( (array!15071 (arr!7141 (Array (_ BitVec 32) (_ BitVec 64))) (size!7493 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15070)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!297762 (= res!157043 (and (= (size!7493 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7493 a!3312))))))

(declare-fun b!297763 () Bool)

(declare-fun e!188151 () Bool)

(declare-fun e!188153 () Bool)

(assert (=> b!297763 (= e!188151 e!188153)))

(declare-fun res!157050 () Bool)

(assert (=> b!297763 (=> (not res!157050) (not e!188153))))

(declare-fun lt!148014 () Bool)

(assert (=> b!297763 (= res!157050 lt!148014)))

(declare-datatypes ((SeekEntryResult!2290 0))(
  ( (MissingZero!2290 (index!11330 (_ BitVec 32))) (Found!2290 (index!11331 (_ BitVec 32))) (Intermediate!2290 (undefined!3102 Bool) (index!11332 (_ BitVec 32)) (x!29544 (_ BitVec 32))) (Undefined!2290) (MissingVacant!2290 (index!11333 (_ BitVec 32))) )
))
(declare-fun lt!148015 () SeekEntryResult!2290)

(declare-fun lt!148010 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun lt!148013 () array!15070)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15070 (_ BitVec 32)) SeekEntryResult!2290)

(assert (=> b!297763 (= lt!148015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148010 k!2524 lt!148013 mask!3809))))

(assert (=> b!297763 (= lt!148013 (array!15071 (store (arr!7141 a!3312) i!1256 k!2524) (size!7493 a!3312)))))

(declare-fun lt!148012 () SeekEntryResult!2290)

(assert (=> b!297763 (= lt!148012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148010 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297763 (= lt!148010 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297764 () Bool)

(declare-fun e!188154 () Bool)

(assert (=> b!297764 (= e!188153 e!188154)))

(declare-fun res!157046 () Bool)

(assert (=> b!297764 (=> (not res!157046) (not e!188154))))

(assert (=> b!297764 (= res!157046 (= lt!148015 lt!148012))))

(declare-datatypes ((Unit!9302 0))(
  ( (Unit!9303) )
))
(declare-fun lt!148016 () Unit!9302)

(declare-fun e!188150 () Unit!9302)

(assert (=> b!297764 (= lt!148016 e!188150)))

(declare-fun c!47942 () Bool)

(assert (=> b!297764 (= c!47942 (or (and (is-Intermediate!2290 lt!148012) (undefined!3102 lt!148012)) (and (is-Intermediate!2290 lt!148012) (= (select (arr!7141 a!3312) (index!11332 lt!148012)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2290 lt!148012) (= (select (arr!7141 a!3312) (index!11332 lt!148012)) k!2524))))))

(declare-fun b!297765 () Bool)

(assert (=> b!297765 false))

(declare-fun e!188149 () Unit!9302)

(declare-fun Unit!9304 () Unit!9302)

(assert (=> b!297765 (= e!188149 Unit!9304)))

(declare-fun b!297766 () Bool)

(declare-fun res!157048 () Bool)

(assert (=> b!297766 (=> (not res!157048) (not e!188152))))

(declare-fun arrayContainsKey!0 (array!15070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297766 (= res!157048 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297767 () Bool)

(assert (=> b!297767 (= e!188152 e!188151)))

(declare-fun res!157049 () Bool)

(assert (=> b!297767 (=> (not res!157049) (not e!188151))))

(declare-fun lt!148017 () SeekEntryResult!2290)

(assert (=> b!297767 (= res!157049 (or lt!148014 (= lt!148017 (MissingVacant!2290 i!1256))))))

(assert (=> b!297767 (= lt!148014 (= lt!148017 (MissingZero!2290 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15070 (_ BitVec 32)) SeekEntryResult!2290)

(assert (=> b!297767 (= lt!148017 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!157047 () Bool)

(assert (=> start!29402 (=> (not res!157047) (not e!188152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29402 (= res!157047 (validMask!0 mask!3809))))

(assert (=> start!29402 e!188152))

(assert (=> start!29402 true))

(declare-fun array_inv!5104 (array!15070) Bool)

(assert (=> start!29402 (array_inv!5104 a!3312)))

(declare-fun b!297768 () Bool)

(declare-fun res!157044 () Bool)

(assert (=> b!297768 (=> (not res!157044) (not e!188151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15070 (_ BitVec 32)) Bool)

(assert (=> b!297768 (= res!157044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297769 () Bool)

(declare-fun res!157045 () Bool)

(assert (=> b!297769 (=> (not res!157045) (not e!188152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297769 (= res!157045 (validKeyInArray!0 k!2524))))

(declare-fun b!297770 () Bool)

(declare-fun Unit!9305 () Unit!9302)

(assert (=> b!297770 (= e!188150 Unit!9305)))

(assert (=> b!297770 false))

(declare-fun b!297771 () Bool)

(assert (=> b!297771 (and (= lt!148015 lt!148012) (= (select (store (arr!7141 a!3312) i!1256 k!2524) (index!11332 lt!148012)) k!2524))))

(declare-fun lt!148011 () Unit!9302)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15070 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9302)

(assert (=> b!297771 (= lt!148011 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!148010 (index!11332 lt!148012) (x!29544 lt!148012) mask!3809))))

(assert (=> b!297771 (and (= (select (arr!7141 a!3312) (index!11332 lt!148012)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11332 lt!148012) i!1256))))

(declare-fun Unit!9306 () Unit!9302)

(assert (=> b!297771 (= e!188149 Unit!9306)))

(declare-fun b!297772 () Bool)

(assert (=> b!297772 (= e!188150 e!188149)))

(declare-fun c!47943 () Bool)

(assert (=> b!297772 (= c!47943 (is-Intermediate!2290 lt!148012))))

(declare-fun b!297773 () Bool)

(assert (=> b!297773 (= e!188154 (not (= (seekEntryOrOpen!0 k!2524 lt!148013 mask!3809) (Found!2290 i!1256))))))

(assert (= (and start!29402 res!157047) b!297762))

(assert (= (and b!297762 res!157043) b!297769))

(assert (= (and b!297769 res!157045) b!297766))

(assert (= (and b!297766 res!157048) b!297767))

(assert (= (and b!297767 res!157049) b!297768))

(assert (= (and b!297768 res!157044) b!297763))

(assert (= (and b!297763 res!157050) b!297764))

(assert (= (and b!297764 c!47942) b!297770))

(assert (= (and b!297764 (not c!47942)) b!297772))

(assert (= (and b!297772 c!47943) b!297771))

(assert (= (and b!297772 (not c!47943)) b!297765))

(assert (= (and b!297764 res!157046) b!297773))

(declare-fun m!310433 () Bool)

(assert (=> b!297771 m!310433))

(declare-fun m!310435 () Bool)

(assert (=> b!297771 m!310435))

(declare-fun m!310437 () Bool)

(assert (=> b!297771 m!310437))

(declare-fun m!310439 () Bool)

(assert (=> b!297771 m!310439))

(declare-fun m!310441 () Bool)

(assert (=> start!29402 m!310441))

(declare-fun m!310443 () Bool)

(assert (=> start!29402 m!310443))

(declare-fun m!310445 () Bool)

(assert (=> b!297768 m!310445))

(declare-fun m!310447 () Bool)

(assert (=> b!297773 m!310447))

(declare-fun m!310449 () Bool)

(assert (=> b!297767 m!310449))

(declare-fun m!310451 () Bool)

(assert (=> b!297769 m!310451))

(declare-fun m!310453 () Bool)

(assert (=> b!297763 m!310453))

(assert (=> b!297763 m!310433))

(declare-fun m!310455 () Bool)

(assert (=> b!297763 m!310455))

(declare-fun m!310457 () Bool)

(assert (=> b!297763 m!310457))

(declare-fun m!310459 () Bool)

(assert (=> b!297766 m!310459))

(assert (=> b!297764 m!310439))

(push 1)

(assert (not b!297763))

(assert (not b!297773))

(assert (not b!297766))

(assert (not start!29402))

(assert (not b!297767))

(assert (not b!297769))

(assert (not b!297771))

(assert (not b!297768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!25762 () Bool)

(declare-fun call!25765 () Bool)

(assert (=> bm!25762 (= call!25765 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!297803 () Bool)

(declare-fun e!188175 () Bool)

(assert (=> b!297803 (= e!188175 call!25765)))

(declare-fun b!297804 () Bool)

(declare-fun e!188176 () Bool)

(assert (=> b!297804 (= e!188176 call!25765)))

(declare-fun b!297805 () Bool)

(assert (=> b!297805 (= e!188175 e!188176)))

(declare-fun lt!148038 () (_ BitVec 64))

(assert (=> b!297805 (= lt!148038 (select (arr!7141 a!3312) #b00000000000000000000000000000000))))

(declare-fun lt!148037 () Unit!9302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15070 (_ BitVec 64) (_ BitVec 32)) Unit!9302)

(assert (=> b!297805 (= lt!148037 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148038 #b00000000000000000000000000000000))))

(assert (=> b!297805 (arrayContainsKey!0 a!3312 lt!148038 #b00000000000000000000000000000000)))

(declare-fun lt!148036 () Unit!9302)

(assert (=> b!297805 (= lt!148036 lt!148037)))

(declare-fun res!157059 () Bool)

(assert (=> b!297805 (= res!157059 (= (seekEntryOrOpen!0 (select (arr!7141 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2290 #b00000000000000000000000000000000)))))

(assert (=> b!297805 (=> (not res!157059) (not e!188176))))

(declare-fun b!297806 () Bool)

(declare-fun e!188174 () Bool)

(assert (=> b!297806 (= e!188174 e!188175)))

(declare-fun c!47955 () Bool)

(assert (=> b!297806 (= c!47955 (validKeyInArray!0 (select (arr!7141 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67229 () Bool)

(declare-fun res!157058 () Bool)

(assert (=> d!67229 (=> res!157058 e!188174)))

(assert (=> d!67229 (= res!157058 (bvsge #b00000000000000000000000000000000 (size!7493 a!3312)))))

(assert (=> d!67229 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188174)))

(assert (= (and d!67229 (not res!157058)) b!297806))

(assert (= (and b!297806 c!47955) b!297805))

(assert (= (and b!297806 (not c!47955)) b!297803))

(assert (= (and b!297805 res!157059) b!297804))

(assert (= (or b!297804 b!297803) bm!25762))

(declare-fun m!310477 () Bool)

(assert (=> bm!25762 m!310477))

(declare-fun m!310479 () Bool)

(assert (=> b!297805 m!310479))

(declare-fun m!310481 () Bool)

(assert (=> b!297805 m!310481))

(declare-fun m!310483 () Bool)

(assert (=> b!297805 m!310483))

(assert (=> b!297805 m!310479))

(declare-fun m!310485 () Bool)

(assert (=> b!297805 m!310485))

(assert (=> b!297806 m!310479))

(assert (=> b!297806 m!310479))

(declare-fun m!310487 () Bool)

(assert (=> b!297806 m!310487))

(assert (=> b!297768 d!67229))

(declare-fun d!67235 () Bool)

(declare-fun lt!148061 () SeekEntryResult!2290)

(assert (=> d!67235 (and (or (is-Undefined!2290 lt!148061) (not (is-Found!2290 lt!148061)) (and (bvsge (index!11331 lt!148061) #b00000000000000000000000000000000) (bvslt (index!11331 lt!148061) (size!7493 lt!148013)))) (or (is-Undefined!2290 lt!148061) (is-Found!2290 lt!148061) (not (is-MissingZero!2290 lt!148061)) (and (bvsge (index!11330 lt!148061) #b00000000000000000000000000000000) (bvslt (index!11330 lt!148061) (size!7493 lt!148013)))) (or (is-Undefined!2290 lt!148061) (is-Found!2290 lt!148061) (is-MissingZero!2290 lt!148061) (not (is-MissingVacant!2290 lt!148061)) (and (bvsge (index!11333 lt!148061) #b00000000000000000000000000000000) (bvslt (index!11333 lt!148061) (size!7493 lt!148013)))) (or (is-Undefined!2290 lt!148061) (ite (is-Found!2290 lt!148061) (= (select (arr!7141 lt!148013) (index!11331 lt!148061)) k!2524) (ite (is-MissingZero!2290 lt!148061) (= (select (arr!7141 lt!148013) (index!11330 lt!148061)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2290 lt!148061) (= (select (arr!7141 lt!148013) (index!11333 lt!148061)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!188207 () SeekEntryResult!2290)

(assert (=> d!67235 (= lt!148061 e!188207)))

(declare-fun c!47979 () Bool)

(declare-fun lt!148062 () SeekEntryResult!2290)

(assert (=> d!67235 (= c!47979 (and (is-Intermediate!2290 lt!148062) (undefined!3102 lt!148062)))))

(assert (=> d!67235 (= lt!148062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 lt!148013 mask!3809))))

(assert (=> d!67235 (validMask!0 mask!3809)))

(assert (=> d!67235 (= (seekEntryOrOpen!0 k!2524 lt!148013 mask!3809) lt!148061)))

(declare-fun b!297858 () Bool)

(declare-fun e!188206 () SeekEntryResult!2290)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15070 (_ BitVec 32)) SeekEntryResult!2290)

(assert (=> b!297858 (= e!188206 (seekKeyOrZeroReturnVacant!0 (x!29544 lt!148062) (index!11332 lt!148062) (index!11332 lt!148062) k!2524 lt!148013 mask!3809))))

(declare-fun b!297859 () Bool)

(declare-fun e!188205 () SeekEntryResult!2290)

(assert (=> b!297859 (= e!188205 (Found!2290 (index!11332 lt!148062)))))

(declare-fun b!297860 () Bool)

(declare-fun c!47978 () Bool)

(declare-fun lt!148063 () (_ BitVec 64))

(assert (=> b!297860 (= c!47978 (= lt!148063 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297860 (= e!188205 e!188206)))

(declare-fun b!297861 () Bool)

(assert (=> b!297861 (= e!188207 Undefined!2290)))

(declare-fun b!297862 () Bool)

(assert (=> b!297862 (= e!188207 e!188205)))

(assert (=> b!297862 (= lt!148063 (select (arr!7141 lt!148013) (index!11332 lt!148062)))))

(declare-fun c!47977 () Bool)

(assert (=> b!297862 (= c!47977 (= lt!148063 k!2524))))

(declare-fun b!297863 () Bool)

(assert (=> b!297863 (= e!188206 (MissingZero!2290 (index!11332 lt!148062)))))

(assert (= (and d!67235 c!47979) b!297861))

(assert (= (and d!67235 (not c!47979)) b!297862))

(assert (= (and b!297862 c!47977) b!297859))

(assert (= (and b!297862 (not c!47977)) b!297860))

(assert (= (and b!297860 c!47978) b!297863))

(assert (= (and b!297860 (not c!47978)) b!297858))

(declare-fun m!310505 () Bool)

(assert (=> d!67235 m!310505))

(declare-fun m!310507 () Bool)

(assert (=> d!67235 m!310507))

(assert (=> d!67235 m!310457))

(declare-fun m!310509 () Bool)

(assert (=> d!67235 m!310509))

(assert (=> d!67235 m!310441))

(assert (=> d!67235 m!310457))

(declare-fun m!310511 () Bool)

(assert (=> d!67235 m!310511))

(declare-fun m!310513 () Bool)

(assert (=> b!297858 m!310513))

(declare-fun m!310515 () Bool)

(assert (=> b!297862 m!310515))

(assert (=> b!297773 d!67235))

(declare-fun d!67241 () Bool)

(assert (=> d!67241 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29402 d!67241))

(declare-fun d!67251 () Bool)

(assert (=> d!67251 (= (array_inv!5104 a!3312) (bvsge (size!7493 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29402 d!67251))

(declare-fun b!297966 () Bool)

(declare-fun e!188271 () Bool)

(declare-fun e!188269 () Bool)

(assert (=> b!297966 (= e!188271 e!188269)))

(declare-fun res!157107 () Bool)

(declare-fun lt!148107 () SeekEntryResult!2290)

(assert (=> b!297966 (= res!157107 (and (is-Intermediate!2290 lt!148107) (not (undefined!3102 lt!148107)) (bvslt (x!29544 lt!148107) #b01111111111111111111111111111110) (bvsge (x!29544 lt!148107) #b00000000000000000000000000000000) (bvsge (x!29544 lt!148107) #b00000000000000000000000000000000)))))

(assert (=> b!297966 (=> (not res!157107) (not e!188269))))

(declare-fun b!297967 () Bool)

(declare-fun e!188273 () SeekEntryResult!2290)

(declare-fun e!188272 () SeekEntryResult!2290)

(assert (=> b!297967 (= e!188273 e!188272)))

(declare-fun c!48014 () Bool)

(declare-fun lt!148108 () (_ BitVec 64))

(assert (=> b!297967 (= c!48014 (or (= lt!148108 k!2524) (= (bvadd lt!148108 lt!148108) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297969 () Bool)

(assert (=> b!297969 (and (bvsge (index!11332 lt!148107) #b00000000000000000000000000000000) (bvslt (index!11332 lt!148107) (size!7493 lt!148013)))))

(declare-fun res!157108 () Bool)

(assert (=> b!297969 (= res!157108 (= (select (arr!7141 lt!148013) (index!11332 lt!148107)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188270 () Bool)

(assert (=> b!297969 (=> res!157108 e!188270)))

(declare-fun b!297970 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297970 (= e!188272 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148010 #b00000000000000000000000000000000 mask!3809) k!2524 lt!148013 mask!3809))))

(declare-fun b!297971 () Bool)

(assert (=> b!297971 (= e!188273 (Intermediate!2290 true lt!148010 #b00000000000000000000000000000000))))

(declare-fun b!297972 () Bool)

(assert (=> b!297972 (and (bvsge (index!11332 lt!148107) #b00000000000000000000000000000000) (bvslt (index!11332 lt!148107) (size!7493 lt!148013)))))

(declare-fun res!157109 () Bool)

(assert (=> b!297972 (= res!157109 (= (select (arr!7141 lt!148013) (index!11332 lt!148107)) k!2524))))

(assert (=> b!297972 (=> res!157109 e!188270)))

(assert (=> b!297972 (= e!188269 e!188270)))

(declare-fun b!297973 () Bool)

(assert (=> b!297973 (= e!188271 (bvsge (x!29544 lt!148107) #b01111111111111111111111111111110))))

(declare-fun b!297974 () Bool)

(assert (=> b!297974 (= e!188272 (Intermediate!2290 false lt!148010 #b00000000000000000000000000000000))))

(declare-fun b!297968 () Bool)

(assert (=> b!297968 (and (bvsge (index!11332 lt!148107) #b00000000000000000000000000000000) (bvslt (index!11332 lt!148107) (size!7493 lt!148013)))))

(assert (=> b!297968 (= e!188270 (= (select (arr!7141 lt!148013) (index!11332 lt!148107)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67253 () Bool)

(assert (=> d!67253 e!188271))

(declare-fun c!48015 () Bool)

(assert (=> d!67253 (= c!48015 (and (is-Intermediate!2290 lt!148107) (undefined!3102 lt!148107)))))

(assert (=> d!67253 (= lt!148107 e!188273)))

(declare-fun c!48013 () Bool)

(assert (=> d!67253 (= c!48013 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67253 (= lt!148108 (select (arr!7141 lt!148013) lt!148010))))

(assert (=> d!67253 (validMask!0 mask!3809)))

(assert (=> d!67253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148010 k!2524 lt!148013 mask!3809) lt!148107)))

(assert (= (and d!67253 c!48013) b!297971))

(assert (= (and d!67253 (not c!48013)) b!297967))

(assert (= (and b!297967 c!48014) b!297974))

(assert (= (and b!297967 (not c!48014)) b!297970))

(assert (= (and d!67253 c!48015) b!297973))

(assert (= (and d!67253 (not c!48015)) b!297966))

(assert (= (and b!297966 res!157107) b!297972))

(assert (= (and b!297972 (not res!157109)) b!297969))

(assert (= (and b!297969 (not res!157108)) b!297968))

(declare-fun m!310583 () Bool)

(assert (=> b!297969 m!310583))

(declare-fun m!310585 () Bool)

(assert (=> d!67253 m!310585))

(assert (=> d!67253 m!310441))

(assert (=> b!297972 m!310583))

(declare-fun m!310587 () Bool)

(assert (=> b!297970 m!310587))

(assert (=> b!297970 m!310587))

(declare-fun m!310589 () Bool)

(assert (=> b!297970 m!310589))

(assert (=> b!297968 m!310583))

(assert (=> b!297763 d!67253))

(declare-fun b!297975 () Bool)

(declare-fun e!188276 () Bool)

(declare-fun e!188274 () Bool)

(assert (=> b!297975 (= e!188276 e!188274)))

(declare-fun res!157110 () Bool)

(declare-fun lt!148109 () SeekEntryResult!2290)

(assert (=> b!297975 (= res!157110 (and (is-Intermediate!2290 lt!148109) (not (undefined!3102 lt!148109)) (bvslt (x!29544 lt!148109) #b01111111111111111111111111111110) (bvsge (x!29544 lt!148109) #b00000000000000000000000000000000) (bvsge (x!29544 lt!148109) #b00000000000000000000000000000000)))))

(assert (=> b!297975 (=> (not res!157110) (not e!188274))))

(declare-fun b!297976 () Bool)

(declare-fun e!188278 () SeekEntryResult!2290)

(declare-fun e!188277 () SeekEntryResult!2290)

(assert (=> b!297976 (= e!188278 e!188277)))

(declare-fun c!48017 () Bool)

(declare-fun lt!148110 () (_ BitVec 64))

(assert (=> b!297976 (= c!48017 (or (= lt!148110 k!2524) (= (bvadd lt!148110 lt!148110) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297978 () Bool)

(assert (=> b!297978 (and (bvsge (index!11332 lt!148109) #b00000000000000000000000000000000) (bvslt (index!11332 lt!148109) (size!7493 a!3312)))))

(declare-fun res!157111 () Bool)

(assert (=> b!297978 (= res!157111 (= (select (arr!7141 a!3312) (index!11332 lt!148109)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188275 () Bool)

(assert (=> b!297978 (=> res!157111 e!188275)))

(declare-fun b!297979 () Bool)

(assert (=> b!297979 (= e!188277 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148010 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!297980 () Bool)

(assert (=> b!297980 (= e!188278 (Intermediate!2290 true lt!148010 #b00000000000000000000000000000000))))

(declare-fun b!297981 () Bool)

(assert (=> b!297981 (and (bvsge (index!11332 lt!148109) #b00000000000000000000000000000000) (bvslt (index!11332 lt!148109) (size!7493 a!3312)))))

(declare-fun res!157112 () Bool)

(assert (=> b!297981 (= res!157112 (= (select (arr!7141 a!3312) (index!11332 lt!148109)) k!2524))))

(assert (=> b!297981 (=> res!157112 e!188275)))

(assert (=> b!297981 (= e!188274 e!188275)))

(declare-fun b!297982 () Bool)

(assert (=> b!297982 (= e!188276 (bvsge (x!29544 lt!148109) #b01111111111111111111111111111110))))

(declare-fun b!297983 () Bool)

(assert (=> b!297983 (= e!188277 (Intermediate!2290 false lt!148010 #b00000000000000000000000000000000))))

(declare-fun b!297977 () Bool)

(assert (=> b!297977 (and (bvsge (index!11332 lt!148109) #b00000000000000000000000000000000) (bvslt (index!11332 lt!148109) (size!7493 a!3312)))))

(assert (=> b!297977 (= e!188275 (= (select (arr!7141 a!3312) (index!11332 lt!148109)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67271 () Bool)

(assert (=> d!67271 e!188276))

(declare-fun c!48018 () Bool)

(assert (=> d!67271 (= c!48018 (and (is-Intermediate!2290 lt!148109) (undefined!3102 lt!148109)))))

(assert (=> d!67271 (= lt!148109 e!188278)))

(declare-fun c!48016 () Bool)

(assert (=> d!67271 (= c!48016 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67271 (= lt!148110 (select (arr!7141 a!3312) lt!148010))))

(assert (=> d!67271 (validMask!0 mask!3809)))

(assert (=> d!67271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148010 k!2524 a!3312 mask!3809) lt!148109)))

(assert (= (and d!67271 c!48016) b!297980))

(assert (= (and d!67271 (not c!48016)) b!297976))

(assert (= (and b!297976 c!48017) b!297983))

(assert (= (and b!297976 (not c!48017)) b!297979))

(assert (= (and d!67271 c!48018) b!297982))

(assert (= (and d!67271 (not c!48018)) b!297975))

(assert (= (and b!297975 res!157110) b!297981))

(assert (= (and b!297981 (not res!157112)) b!297978))

(assert (= (and b!297978 (not res!157111)) b!297977))

(declare-fun m!310591 () Bool)

(assert (=> b!297978 m!310591))

(declare-fun m!310593 () Bool)

(assert (=> d!67271 m!310593))

(assert (=> d!67271 m!310441))

(assert (=> b!297981 m!310591))

(assert (=> b!297979 m!310587))

(assert (=> b!297979 m!310587))

(declare-fun m!310595 () Bool)

(assert (=> b!297979 m!310595))

(assert (=> b!297977 m!310591))

(assert (=> b!297763 d!67271))

(declare-fun d!67273 () Bool)

(declare-fun lt!148116 () (_ BitVec 32))

(declare-fun lt!148115 () (_ BitVec 32))

(assert (=> d!67273 (= lt!148116 (bvmul (bvxor lt!148115 (bvlshr lt!148115 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67273 (= lt!148115 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67273 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157113 (let ((h!5303 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29552 (bvmul (bvxor h!5303 (bvlshr h!5303 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29552 (bvlshr x!29552 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157113 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157113 #b00000000000000000000000000000000))))))

(assert (=> d!67273 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!148116 (bvlshr lt!148116 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!297763 d!67273))

(declare-fun d!67279 () Bool)

(declare-fun lt!148117 () SeekEntryResult!2290)

(assert (=> d!67279 (and (or (is-Undefined!2290 lt!148117) (not (is-Found!2290 lt!148117)) (and (bvsge (index!11331 lt!148117) #b00000000000000000000000000000000) (bvslt (index!11331 lt!148117) (size!7493 a!3312)))) (or (is-Undefined!2290 lt!148117) (is-Found!2290 lt!148117) (not (is-MissingZero!2290 lt!148117)) (and (bvsge (index!11330 lt!148117) #b00000000000000000000000000000000) (bvslt (index!11330 lt!148117) (size!7493 a!3312)))) (or (is-Undefined!2290 lt!148117) (is-Found!2290 lt!148117) (is-MissingZero!2290 lt!148117) (not (is-MissingVacant!2290 lt!148117)) (and (bvsge (index!11333 lt!148117) #b00000000000000000000000000000000) (bvslt (index!11333 lt!148117) (size!7493 a!3312)))) (or (is-Undefined!2290 lt!148117) (ite (is-Found!2290 lt!148117) (= (select (arr!7141 a!3312) (index!11331 lt!148117)) k!2524) (ite (is-MissingZero!2290 lt!148117) (= (select (arr!7141 a!3312) (index!11330 lt!148117)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2290 lt!148117) (= (select (arr!7141 a!3312) (index!11333 lt!148117)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!188281 () SeekEntryResult!2290)

(assert (=> d!67279 (= lt!148117 e!188281)))

(declare-fun c!48021 () Bool)

(declare-fun lt!148118 () SeekEntryResult!2290)

(assert (=> d!67279 (= c!48021 (and (is-Intermediate!2290 lt!148118) (undefined!3102 lt!148118)))))

(assert (=> d!67279 (= lt!148118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67279 (validMask!0 mask!3809)))

(assert (=> d!67279 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!148117)))

(declare-fun b!297984 () Bool)

(declare-fun e!188280 () SeekEntryResult!2290)

(assert (=> b!297984 (= e!188280 (seekKeyOrZeroReturnVacant!0 (x!29544 lt!148118) (index!11332 lt!148118) (index!11332 lt!148118) k!2524 a!3312 mask!3809))))

(declare-fun b!297985 () Bool)

(declare-fun e!188279 () SeekEntryResult!2290)

(assert (=> b!297985 (= e!188279 (Found!2290 (index!11332 lt!148118)))))

(declare-fun b!297986 () Bool)

(declare-fun c!48020 () Bool)

(declare-fun lt!148119 () (_ BitVec 64))

(assert (=> b!297986 (= c!48020 (= lt!148119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297986 (= e!188279 e!188280)))

(declare-fun b!297987 () Bool)

(assert (=> b!297987 (= e!188281 Undefined!2290)))

(declare-fun b!297988 () Bool)

(assert (=> b!297988 (= e!188281 e!188279)))

(assert (=> b!297988 (= lt!148119 (select (arr!7141 a!3312) (index!11332 lt!148118)))))

(declare-fun c!48019 () Bool)

(assert (=> b!297988 (= c!48019 (= lt!148119 k!2524))))

(declare-fun b!297989 () Bool)

(assert (=> b!297989 (= e!188280 (MissingZero!2290 (index!11332 lt!148118)))))

(assert (= (and d!67279 c!48021) b!297987))

(assert (= (and d!67279 (not c!48021)) b!297988))

(assert (= (and b!297988 c!48019) b!297985))

(assert (= (and b!297988 (not c!48019)) b!297986))

(assert (= (and b!297986 c!48020) b!297989))

(assert (= (and b!297986 (not c!48020)) b!297984))

(declare-fun m!310597 () Bool)

(assert (=> d!67279 m!310597))

(declare-fun m!310599 () Bool)

(assert (=> d!67279 m!310599))

(assert (=> d!67279 m!310457))

(declare-fun m!310601 () Bool)

(assert (=> d!67279 m!310601))

(assert (=> d!67279 m!310441))

(assert (=> d!67279 m!310457))

(declare-fun m!310603 () Bool)

(assert (=> d!67279 m!310603))

(declare-fun m!310605 () Bool)

(assert (=> b!297984 m!310605))

(declare-fun m!310607 () Bool)

(assert (=> b!297988 m!310607))

(assert (=> b!297767 d!67279))

