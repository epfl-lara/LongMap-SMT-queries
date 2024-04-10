; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28112 () Bool)

(assert start!28112)

(declare-fun b!288061 () Bool)

(declare-fun res!149827 () Bool)

(declare-fun e!182394 () Bool)

(assert (=> b!288061 (=> (not res!149827) (not e!182394))))

(declare-datatypes ((array!14471 0))(
  ( (array!14472 (arr!6864 (Array (_ BitVec 32) (_ BitVec 64))) (size!7216 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14471)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14471 (_ BitVec 32)) Bool)

(assert (=> b!288061 (= res!149827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288062 () Bool)

(declare-fun e!182395 () Bool)

(assert (=> b!288062 (= e!182395 (not (or (bvslt mask!3809 #b00000000000000000000000000000000) (bvsle mask!3809 #b00111111111111111111111111111111))))))

(declare-datatypes ((SeekEntryResult!2013 0))(
  ( (MissingZero!2013 (index!10222 (_ BitVec 32))) (Found!2013 (index!10223 (_ BitVec 32))) (Intermediate!2013 (undefined!2825 Bool) (index!10224 (_ BitVec 32)) (x!28436 (_ BitVec 32))) (Undefined!2013) (MissingVacant!2013 (index!10225 (_ BitVec 32))) )
))
(declare-fun lt!141867 () SeekEntryResult!2013)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288062 (and (= (select (arr!6864 a!3312) (index!10224 lt!141867)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10224 lt!141867) i!1256))))

(declare-fun b!288063 () Bool)

(declare-fun res!149826 () Bool)

(declare-fun e!182396 () Bool)

(assert (=> b!288063 (=> (not res!149826) (not e!182396))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288063 (= res!149826 (validKeyInArray!0 k0!2524))))

(declare-fun res!149825 () Bool)

(assert (=> start!28112 (=> (not res!149825) (not e!182396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28112 (= res!149825 (validMask!0 mask!3809))))

(assert (=> start!28112 e!182396))

(assert (=> start!28112 true))

(declare-fun array_inv!4827 (array!14471) Bool)

(assert (=> start!28112 (array_inv!4827 a!3312)))

(declare-fun b!288064 () Bool)

(declare-fun e!182393 () Bool)

(assert (=> b!288064 (= e!182394 e!182393)))

(declare-fun res!149828 () Bool)

(assert (=> b!288064 (=> (not res!149828) (not e!182393))))

(declare-fun lt!141865 () Bool)

(assert (=> b!288064 (= res!149828 lt!141865)))

(declare-fun lt!141863 () (_ BitVec 32))

(declare-fun lt!141864 () SeekEntryResult!2013)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14471 (_ BitVec 32)) SeekEntryResult!2013)

(assert (=> b!288064 (= lt!141864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141863 k0!2524 (array!14472 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7216 a!3312)) mask!3809))))

(assert (=> b!288064 (= lt!141867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141863 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288064 (= lt!141863 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288065 () Bool)

(declare-fun res!149832 () Bool)

(assert (=> b!288065 (=> (not res!149832) (not e!182396))))

(assert (=> b!288065 (= res!149832 (and (= (size!7216 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7216 a!3312))))))

(declare-fun b!288066 () Bool)

(declare-fun res!149830 () Bool)

(assert (=> b!288066 (=> (not res!149830) (not e!182396))))

(declare-fun arrayContainsKey!0 (array!14471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288066 (= res!149830 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288067 () Bool)

(assert (=> b!288067 (= e!182393 e!182395)))

(declare-fun res!149831 () Bool)

(assert (=> b!288067 (=> (not res!149831) (not e!182395))))

(declare-fun lt!141866 () Bool)

(assert (=> b!288067 (= res!149831 (and (or lt!141866 (not (undefined!2825 lt!141867))) (or lt!141866 (not (= (select (arr!6864 a!3312) (index!10224 lt!141867)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141866 (not (= (select (arr!6864 a!3312) (index!10224 lt!141867)) k0!2524))) (not lt!141866)))))

(get-info :version)

(assert (=> b!288067 (= lt!141866 (not ((_ is Intermediate!2013) lt!141867)))))

(declare-fun b!288068 () Bool)

(assert (=> b!288068 (= e!182396 e!182394)))

(declare-fun res!149829 () Bool)

(assert (=> b!288068 (=> (not res!149829) (not e!182394))))

(declare-fun lt!141868 () SeekEntryResult!2013)

(assert (=> b!288068 (= res!149829 (or lt!141865 (= lt!141868 (MissingVacant!2013 i!1256))))))

(assert (=> b!288068 (= lt!141865 (= lt!141868 (MissingZero!2013 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14471 (_ BitVec 32)) SeekEntryResult!2013)

(assert (=> b!288068 (= lt!141868 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28112 res!149825) b!288065))

(assert (= (and b!288065 res!149832) b!288063))

(assert (= (and b!288063 res!149826) b!288066))

(assert (= (and b!288066 res!149830) b!288068))

(assert (= (and b!288068 res!149829) b!288061))

(assert (= (and b!288061 res!149827) b!288064))

(assert (= (and b!288064 res!149828) b!288067))

(assert (= (and b!288067 res!149831) b!288062))

(declare-fun m!302401 () Bool)

(assert (=> start!28112 m!302401))

(declare-fun m!302403 () Bool)

(assert (=> start!28112 m!302403))

(declare-fun m!302405 () Bool)

(assert (=> b!288067 m!302405))

(declare-fun m!302407 () Bool)

(assert (=> b!288063 m!302407))

(declare-fun m!302409 () Bool)

(assert (=> b!288068 m!302409))

(declare-fun m!302411 () Bool)

(assert (=> b!288061 m!302411))

(declare-fun m!302413 () Bool)

(assert (=> b!288064 m!302413))

(declare-fun m!302415 () Bool)

(assert (=> b!288064 m!302415))

(declare-fun m!302417 () Bool)

(assert (=> b!288064 m!302417))

(declare-fun m!302419 () Bool)

(assert (=> b!288064 m!302419))

(declare-fun m!302421 () Bool)

(assert (=> b!288066 m!302421))

(assert (=> b!288062 m!302405))

(check-sat (not start!28112) (not b!288063) (not b!288061) (not b!288064) (not b!288066) (not b!288068))
(check-sat)
(get-model)

(declare-fun d!66169 () Bool)

(declare-fun res!149861 () Bool)

(declare-fun e!182416 () Bool)

(assert (=> d!66169 (=> res!149861 e!182416)))

(assert (=> d!66169 (= res!149861 (= (select (arr!6864 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66169 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!182416)))

(declare-fun b!288097 () Bool)

(declare-fun e!182417 () Bool)

(assert (=> b!288097 (= e!182416 e!182417)))

(declare-fun res!149862 () Bool)

(assert (=> b!288097 (=> (not res!149862) (not e!182417))))

(assert (=> b!288097 (= res!149862 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7216 a!3312)))))

(declare-fun b!288098 () Bool)

(assert (=> b!288098 (= e!182417 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66169 (not res!149861)) b!288097))

(assert (= (and b!288097 res!149862) b!288098))

(declare-fun m!302445 () Bool)

(assert (=> d!66169 m!302445))

(declare-fun m!302447 () Bool)

(assert (=> b!288098 m!302447))

(assert (=> b!288066 d!66169))

(declare-fun b!288107 () Bool)

(declare-fun e!182425 () Bool)

(declare-fun e!182424 () Bool)

(assert (=> b!288107 (= e!182425 e!182424)))

(declare-fun c!46680 () Bool)

(assert (=> b!288107 (= c!46680 (validKeyInArray!0 (select (arr!6864 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!288108 () Bool)

(declare-fun e!182426 () Bool)

(assert (=> b!288108 (= e!182424 e!182426)))

(declare-fun lt!141894 () (_ BitVec 64))

(assert (=> b!288108 (= lt!141894 (select (arr!6864 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9074 0))(
  ( (Unit!9075) )
))
(declare-fun lt!141893 () Unit!9074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14471 (_ BitVec 64) (_ BitVec 32)) Unit!9074)

(assert (=> b!288108 (= lt!141893 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141894 #b00000000000000000000000000000000))))

(assert (=> b!288108 (arrayContainsKey!0 a!3312 lt!141894 #b00000000000000000000000000000000)))

(declare-fun lt!141895 () Unit!9074)

(assert (=> b!288108 (= lt!141895 lt!141893)))

(declare-fun res!149868 () Bool)

(assert (=> b!288108 (= res!149868 (= (seekEntryOrOpen!0 (select (arr!6864 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2013 #b00000000000000000000000000000000)))))

(assert (=> b!288108 (=> (not res!149868) (not e!182426))))

(declare-fun d!66171 () Bool)

(declare-fun res!149867 () Bool)

(assert (=> d!66171 (=> res!149867 e!182425)))

(assert (=> d!66171 (= res!149867 (bvsge #b00000000000000000000000000000000 (size!7216 a!3312)))))

(assert (=> d!66171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!182425)))

(declare-fun b!288109 () Bool)

(declare-fun call!25627 () Bool)

(assert (=> b!288109 (= e!182424 call!25627)))

(declare-fun b!288110 () Bool)

(assert (=> b!288110 (= e!182426 call!25627)))

(declare-fun bm!25624 () Bool)

(assert (=> bm!25624 (= call!25627 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66171 (not res!149867)) b!288107))

(assert (= (and b!288107 c!46680) b!288108))

(assert (= (and b!288107 (not c!46680)) b!288109))

(assert (= (and b!288108 res!149868) b!288110))

(assert (= (or b!288110 b!288109) bm!25624))

(assert (=> b!288107 m!302445))

(assert (=> b!288107 m!302445))

(declare-fun m!302449 () Bool)

(assert (=> b!288107 m!302449))

(assert (=> b!288108 m!302445))

(declare-fun m!302451 () Bool)

(assert (=> b!288108 m!302451))

(declare-fun m!302453 () Bool)

(assert (=> b!288108 m!302453))

(assert (=> b!288108 m!302445))

(declare-fun m!302455 () Bool)

(assert (=> b!288108 m!302455))

(declare-fun m!302457 () Bool)

(assert (=> bm!25624 m!302457))

(assert (=> b!288061 d!66171))

(declare-fun d!66175 () Bool)

(assert (=> d!66175 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!288063 d!66175))

(declare-fun lt!141907 () SeekEntryResult!2013)

(declare-fun b!288156 () Bool)

(assert (=> b!288156 (and (bvsge (index!10224 lt!141907) #b00000000000000000000000000000000) (bvslt (index!10224 lt!141907) (size!7216 (array!14472 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7216 a!3312)))))))

(declare-fun res!149884 () Bool)

(assert (=> b!288156 (= res!149884 (= (select (arr!6864 (array!14472 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7216 a!3312))) (index!10224 lt!141907)) k0!2524))))

(declare-fun e!182455 () Bool)

(assert (=> b!288156 (=> res!149884 e!182455)))

(declare-fun e!182454 () Bool)

(assert (=> b!288156 (= e!182454 e!182455)))

(declare-fun b!288157 () Bool)

(declare-fun e!182452 () Bool)

(assert (=> b!288157 (= e!182452 e!182454)))

(declare-fun res!149885 () Bool)

(assert (=> b!288157 (= res!149885 (and ((_ is Intermediate!2013) lt!141907) (not (undefined!2825 lt!141907)) (bvslt (x!28436 lt!141907) #b01111111111111111111111111111110) (bvsge (x!28436 lt!141907) #b00000000000000000000000000000000) (bvsge (x!28436 lt!141907) #b00000000000000000000000000000000)))))

(assert (=> b!288157 (=> (not res!149885) (not e!182454))))

(declare-fun b!288158 () Bool)

(assert (=> b!288158 (= e!182452 (bvsge (x!28436 lt!141907) #b01111111111111111111111111111110))))

(declare-fun b!288159 () Bool)

(declare-fun e!182456 () SeekEntryResult!2013)

(assert (=> b!288159 (= e!182456 (Intermediate!2013 false lt!141863 #b00000000000000000000000000000000))))

(declare-fun b!288160 () Bool)

(declare-fun e!182453 () SeekEntryResult!2013)

(assert (=> b!288160 (= e!182453 (Intermediate!2013 true lt!141863 #b00000000000000000000000000000000))))

(declare-fun b!288161 () Bool)

(assert (=> b!288161 (= e!182453 e!182456)))

(declare-fun c!46698 () Bool)

(declare-fun lt!141906 () (_ BitVec 64))

(assert (=> b!288161 (= c!46698 (or (= lt!141906 k0!2524) (= (bvadd lt!141906 lt!141906) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!288162 () Bool)

(assert (=> b!288162 (and (bvsge (index!10224 lt!141907) #b00000000000000000000000000000000) (bvslt (index!10224 lt!141907) (size!7216 (array!14472 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7216 a!3312)))))))

(assert (=> b!288162 (= e!182455 (= (select (arr!6864 (array!14472 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7216 a!3312))) (index!10224 lt!141907)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66177 () Bool)

(assert (=> d!66177 e!182452))

(declare-fun c!46696 () Bool)

(assert (=> d!66177 (= c!46696 (and ((_ is Intermediate!2013) lt!141907) (undefined!2825 lt!141907)))))

(assert (=> d!66177 (= lt!141907 e!182453)))

(declare-fun c!46697 () Bool)

(assert (=> d!66177 (= c!46697 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66177 (= lt!141906 (select (arr!6864 (array!14472 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7216 a!3312))) lt!141863))))

(assert (=> d!66177 (validMask!0 mask!3809)))

(assert (=> d!66177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141863 k0!2524 (array!14472 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7216 a!3312)) mask!3809) lt!141907)))

(declare-fun b!288163 () Bool)

(assert (=> b!288163 (and (bvsge (index!10224 lt!141907) #b00000000000000000000000000000000) (bvslt (index!10224 lt!141907) (size!7216 (array!14472 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7216 a!3312)))))))

(declare-fun res!149886 () Bool)

(assert (=> b!288163 (= res!149886 (= (select (arr!6864 (array!14472 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7216 a!3312))) (index!10224 lt!141907)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!288163 (=> res!149886 e!182455)))

(declare-fun b!288164 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288164 (= e!182456 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141863 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14472 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7216 a!3312)) mask!3809))))

(assert (= (and d!66177 c!46697) b!288160))

(assert (= (and d!66177 (not c!46697)) b!288161))

(assert (= (and b!288161 c!46698) b!288159))

(assert (= (and b!288161 (not c!46698)) b!288164))

(assert (= (and d!66177 c!46696) b!288158))

(assert (= (and d!66177 (not c!46696)) b!288157))

(assert (= (and b!288157 res!149885) b!288156))

(assert (= (and b!288156 (not res!149884)) b!288163))

(assert (= (and b!288163 (not res!149886)) b!288162))

(declare-fun m!302467 () Bool)

(assert (=> b!288164 m!302467))

(assert (=> b!288164 m!302467))

(declare-fun m!302469 () Bool)

(assert (=> b!288164 m!302469))

(declare-fun m!302471 () Bool)

(assert (=> b!288163 m!302471))

(assert (=> b!288156 m!302471))

(assert (=> b!288162 m!302471))

(declare-fun m!302473 () Bool)

(assert (=> d!66177 m!302473))

(assert (=> d!66177 m!302401))

(assert (=> b!288064 d!66177))

(declare-fun b!288174 () Bool)

(declare-fun lt!141911 () SeekEntryResult!2013)

(assert (=> b!288174 (and (bvsge (index!10224 lt!141911) #b00000000000000000000000000000000) (bvslt (index!10224 lt!141911) (size!7216 a!3312)))))

(declare-fun res!149890 () Bool)

(assert (=> b!288174 (= res!149890 (= (select (arr!6864 a!3312) (index!10224 lt!141911)) k0!2524))))

(declare-fun e!182465 () Bool)

(assert (=> b!288174 (=> res!149890 e!182465)))

(declare-fun e!182464 () Bool)

(assert (=> b!288174 (= e!182464 e!182465)))

(declare-fun b!288175 () Bool)

(declare-fun e!182462 () Bool)

(assert (=> b!288175 (= e!182462 e!182464)))

(declare-fun res!149891 () Bool)

(assert (=> b!288175 (= res!149891 (and ((_ is Intermediate!2013) lt!141911) (not (undefined!2825 lt!141911)) (bvslt (x!28436 lt!141911) #b01111111111111111111111111111110) (bvsge (x!28436 lt!141911) #b00000000000000000000000000000000) (bvsge (x!28436 lt!141911) #b00000000000000000000000000000000)))))

(assert (=> b!288175 (=> (not res!149891) (not e!182464))))

(declare-fun b!288176 () Bool)

(assert (=> b!288176 (= e!182462 (bvsge (x!28436 lt!141911) #b01111111111111111111111111111110))))

(declare-fun b!288177 () Bool)

(declare-fun e!182466 () SeekEntryResult!2013)

(assert (=> b!288177 (= e!182466 (Intermediate!2013 false lt!141863 #b00000000000000000000000000000000))))

(declare-fun b!288178 () Bool)

(declare-fun e!182463 () SeekEntryResult!2013)

(assert (=> b!288178 (= e!182463 (Intermediate!2013 true lt!141863 #b00000000000000000000000000000000))))

(declare-fun b!288179 () Bool)

(assert (=> b!288179 (= e!182463 e!182466)))

(declare-fun c!46704 () Bool)

(declare-fun lt!141910 () (_ BitVec 64))

(assert (=> b!288179 (= c!46704 (or (= lt!141910 k0!2524) (= (bvadd lt!141910 lt!141910) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!288180 () Bool)

(assert (=> b!288180 (and (bvsge (index!10224 lt!141911) #b00000000000000000000000000000000) (bvslt (index!10224 lt!141911) (size!7216 a!3312)))))

(assert (=> b!288180 (= e!182465 (= (select (arr!6864 a!3312) (index!10224 lt!141911)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66183 () Bool)

(assert (=> d!66183 e!182462))

(declare-fun c!46702 () Bool)

(assert (=> d!66183 (= c!46702 (and ((_ is Intermediate!2013) lt!141911) (undefined!2825 lt!141911)))))

(assert (=> d!66183 (= lt!141911 e!182463)))

(declare-fun c!46703 () Bool)

(assert (=> d!66183 (= c!46703 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66183 (= lt!141910 (select (arr!6864 a!3312) lt!141863))))

(assert (=> d!66183 (validMask!0 mask!3809)))

(assert (=> d!66183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141863 k0!2524 a!3312 mask!3809) lt!141911)))

(declare-fun b!288181 () Bool)

(assert (=> b!288181 (and (bvsge (index!10224 lt!141911) #b00000000000000000000000000000000) (bvslt (index!10224 lt!141911) (size!7216 a!3312)))))

(declare-fun res!149892 () Bool)

(assert (=> b!288181 (= res!149892 (= (select (arr!6864 a!3312) (index!10224 lt!141911)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!288181 (=> res!149892 e!182465)))

(declare-fun b!288182 () Bool)

(assert (=> b!288182 (= e!182466 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141863 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66183 c!46703) b!288178))

(assert (= (and d!66183 (not c!46703)) b!288179))

(assert (= (and b!288179 c!46704) b!288177))

(assert (= (and b!288179 (not c!46704)) b!288182))

(assert (= (and d!66183 c!46702) b!288176))

(assert (= (and d!66183 (not c!46702)) b!288175))

(assert (= (and b!288175 res!149891) b!288174))

(assert (= (and b!288174 (not res!149890)) b!288181))

(assert (= (and b!288181 (not res!149892)) b!288180))

(assert (=> b!288182 m!302467))

(assert (=> b!288182 m!302467))

(declare-fun m!302481 () Bool)

(assert (=> b!288182 m!302481))

(declare-fun m!302483 () Bool)

(assert (=> b!288181 m!302483))

(assert (=> b!288174 m!302483))

(assert (=> b!288180 m!302483))

(declare-fun m!302485 () Bool)

(assert (=> d!66183 m!302485))

(assert (=> d!66183 m!302401))

(assert (=> b!288064 d!66183))

(declare-fun d!66187 () Bool)

(declare-fun lt!141927 () (_ BitVec 32))

(declare-fun lt!141926 () (_ BitVec 32))

(assert (=> d!66187 (= lt!141927 (bvmul (bvxor lt!141926 (bvlshr lt!141926 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66187 (= lt!141926 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66187 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!149894 (let ((h!5257 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28442 (bvmul (bvxor h!5257 (bvlshr h!5257 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28442 (bvlshr x!28442 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!149894 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!149894 #b00000000000000000000000000000000))))))

(assert (=> d!66187 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!141927 (bvlshr lt!141927 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!288064 d!66187))

(declare-fun d!66191 () Bool)

(assert (=> d!66191 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28112 d!66191))

(declare-fun d!66203 () Bool)

(assert (=> d!66203 (= (array_inv!4827 a!3312) (bvsge (size!7216 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28112 d!66203))

(declare-fun b!288273 () Bool)

(declare-fun e!182525 () SeekEntryResult!2013)

(declare-fun lt!141970 () SeekEntryResult!2013)

(assert (=> b!288273 (= e!182525 (MissingZero!2013 (index!10224 lt!141970)))))

(declare-fun d!66205 () Bool)

(declare-fun lt!141968 () SeekEntryResult!2013)

(assert (=> d!66205 (and (or ((_ is Undefined!2013) lt!141968) (not ((_ is Found!2013) lt!141968)) (and (bvsge (index!10223 lt!141968) #b00000000000000000000000000000000) (bvslt (index!10223 lt!141968) (size!7216 a!3312)))) (or ((_ is Undefined!2013) lt!141968) ((_ is Found!2013) lt!141968) (not ((_ is MissingZero!2013) lt!141968)) (and (bvsge (index!10222 lt!141968) #b00000000000000000000000000000000) (bvslt (index!10222 lt!141968) (size!7216 a!3312)))) (or ((_ is Undefined!2013) lt!141968) ((_ is Found!2013) lt!141968) ((_ is MissingZero!2013) lt!141968) (not ((_ is MissingVacant!2013) lt!141968)) (and (bvsge (index!10225 lt!141968) #b00000000000000000000000000000000) (bvslt (index!10225 lt!141968) (size!7216 a!3312)))) (or ((_ is Undefined!2013) lt!141968) (ite ((_ is Found!2013) lt!141968) (= (select (arr!6864 a!3312) (index!10223 lt!141968)) k0!2524) (ite ((_ is MissingZero!2013) lt!141968) (= (select (arr!6864 a!3312) (index!10222 lt!141968)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2013) lt!141968) (= (select (arr!6864 a!3312) (index!10225 lt!141968)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!182523 () SeekEntryResult!2013)

(assert (=> d!66205 (= lt!141968 e!182523)))

(declare-fun c!46735 () Bool)

(assert (=> d!66205 (= c!46735 (and ((_ is Intermediate!2013) lt!141970) (undefined!2825 lt!141970)))))

(assert (=> d!66205 (= lt!141970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66205 (validMask!0 mask!3809)))

(assert (=> d!66205 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!141968)))

(declare-fun b!288274 () Bool)

(declare-fun e!182524 () SeekEntryResult!2013)

(assert (=> b!288274 (= e!182524 (Found!2013 (index!10224 lt!141970)))))

(declare-fun b!288275 () Bool)

(declare-fun c!46737 () Bool)

(declare-fun lt!141969 () (_ BitVec 64))

(assert (=> b!288275 (= c!46737 (= lt!141969 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!288275 (= e!182524 e!182525)))

(declare-fun b!288276 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14471 (_ BitVec 32)) SeekEntryResult!2013)

(assert (=> b!288276 (= e!182525 (seekKeyOrZeroReturnVacant!0 (x!28436 lt!141970) (index!10224 lt!141970) (index!10224 lt!141970) k0!2524 a!3312 mask!3809))))

(declare-fun b!288277 () Bool)

(assert (=> b!288277 (= e!182523 Undefined!2013)))

(declare-fun b!288278 () Bool)

(assert (=> b!288278 (= e!182523 e!182524)))

(assert (=> b!288278 (= lt!141969 (select (arr!6864 a!3312) (index!10224 lt!141970)))))

(declare-fun c!46736 () Bool)

(assert (=> b!288278 (= c!46736 (= lt!141969 k0!2524))))

(assert (= (and d!66205 c!46735) b!288277))

(assert (= (and d!66205 (not c!46735)) b!288278))

(assert (= (and b!288278 c!46736) b!288274))

(assert (= (and b!288278 (not c!46736)) b!288275))

(assert (= (and b!288275 c!46737) b!288273))

(assert (= (and b!288275 (not c!46737)) b!288276))

(declare-fun m!302527 () Bool)

(assert (=> d!66205 m!302527))

(assert (=> d!66205 m!302419))

(declare-fun m!302529 () Bool)

(assert (=> d!66205 m!302529))

(assert (=> d!66205 m!302401))

(assert (=> d!66205 m!302419))

(declare-fun m!302531 () Bool)

(assert (=> d!66205 m!302531))

(declare-fun m!302533 () Bool)

(assert (=> d!66205 m!302533))

(declare-fun m!302535 () Bool)

(assert (=> b!288276 m!302535))

(declare-fun m!302537 () Bool)

(assert (=> b!288278 m!302537))

(assert (=> b!288068 d!66205))

(check-sat (not bm!25624) (not b!288107) (not b!288164) (not b!288276) (not d!66177) (not d!66205) (not b!288182) (not d!66183) (not b!288108) (not b!288098))
(check-sat)
