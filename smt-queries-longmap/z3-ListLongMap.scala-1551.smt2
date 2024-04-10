; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29334 () Bool)

(assert start!29334)

(declare-fun b!297228 () Bool)

(declare-fun res!156758 () Bool)

(declare-fun e!187842 () Bool)

(assert (=> b!297228 (=> (not res!156758) (not e!187842))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!15047 0))(
  ( (array!15048 (arr!7131 (Array (_ BitVec 32) (_ BitVec 64))) (size!7483 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15047)

(assert (=> b!297228 (= res!156758 (and (= (size!7483 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7483 a!3312))))))

(declare-fun b!297229 () Bool)

(declare-fun res!156754 () Bool)

(declare-fun e!187843 () Bool)

(assert (=> b!297229 (=> (not res!156754) (not e!187843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15047 (_ BitVec 32)) Bool)

(assert (=> b!297229 (= res!156754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297230 () Bool)

(declare-fun res!156759 () Bool)

(assert (=> b!297230 (=> (not res!156759) (not e!187842))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297230 (= res!156759 (validKeyInArray!0 k0!2524))))

(declare-fun res!156755 () Bool)

(assert (=> start!29334 (=> (not res!156755) (not e!187842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29334 (= res!156755 (validMask!0 mask!3809))))

(assert (=> start!29334 e!187842))

(assert (=> start!29334 true))

(declare-fun array_inv!5094 (array!15047) Bool)

(assert (=> start!29334 (array_inv!5094 a!3312)))

(declare-fun b!297231 () Bool)

(declare-fun lt!147706 () Bool)

(declare-datatypes ((SeekEntryResult!2280 0))(
  ( (MissingZero!2280 (index!11290 (_ BitVec 32))) (Found!2280 (index!11291 (_ BitVec 32))) (Intermediate!2280 (undefined!3092 Bool) (index!11292 (_ BitVec 32)) (x!29504 (_ BitVec 32))) (Undefined!2280) (MissingVacant!2280 (index!11293 (_ BitVec 32))) )
))
(declare-fun lt!147707 () SeekEntryResult!2280)

(get-info :version)

(assert (=> b!297231 (= e!187843 (and lt!147706 (not ((_ is Intermediate!2280) lt!147707))))))

(declare-fun lt!147708 () (_ BitVec 32))

(declare-fun lt!147705 () SeekEntryResult!2280)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15047 (_ BitVec 32)) SeekEntryResult!2280)

(assert (=> b!297231 (= lt!147705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147708 k0!2524 (array!15048 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7483 a!3312)) mask!3809))))

(assert (=> b!297231 (= lt!147707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147708 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297231 (= lt!147708 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297232 () Bool)

(assert (=> b!297232 (= e!187842 e!187843)))

(declare-fun res!156757 () Bool)

(assert (=> b!297232 (=> (not res!156757) (not e!187843))))

(declare-fun lt!147704 () SeekEntryResult!2280)

(assert (=> b!297232 (= res!156757 (or lt!147706 (= lt!147704 (MissingVacant!2280 i!1256))))))

(assert (=> b!297232 (= lt!147706 (= lt!147704 (MissingZero!2280 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15047 (_ BitVec 32)) SeekEntryResult!2280)

(assert (=> b!297232 (= lt!147704 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297233 () Bool)

(declare-fun res!156756 () Bool)

(assert (=> b!297233 (=> (not res!156756) (not e!187842))))

(declare-fun arrayContainsKey!0 (array!15047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297233 (= res!156756 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29334 res!156755) b!297228))

(assert (= (and b!297228 res!156758) b!297230))

(assert (= (and b!297230 res!156759) b!297233))

(assert (= (and b!297233 res!156756) b!297232))

(assert (= (and b!297232 res!156757) b!297229))

(assert (= (and b!297229 res!156754) b!297231))

(declare-fun m!310061 () Bool)

(assert (=> start!29334 m!310061))

(declare-fun m!310063 () Bool)

(assert (=> start!29334 m!310063))

(declare-fun m!310065 () Bool)

(assert (=> b!297229 m!310065))

(declare-fun m!310067 () Bool)

(assert (=> b!297232 m!310067))

(declare-fun m!310069 () Bool)

(assert (=> b!297233 m!310069))

(declare-fun m!310071 () Bool)

(assert (=> b!297230 m!310071))

(declare-fun m!310073 () Bool)

(assert (=> b!297231 m!310073))

(declare-fun m!310075 () Bool)

(assert (=> b!297231 m!310075))

(declare-fun m!310077 () Bool)

(assert (=> b!297231 m!310077))

(declare-fun m!310079 () Bool)

(assert (=> b!297231 m!310079))

(check-sat (not b!297231) (not start!29334) (not b!297233) (not b!297232) (not b!297229) (not b!297230))
(check-sat)
(get-model)

(declare-fun b!297284 () Bool)

(declare-fun e!187877 () Bool)

(declare-fun lt!147733 () SeekEntryResult!2280)

(assert (=> b!297284 (= e!187877 (bvsge (x!29504 lt!147733) #b01111111111111111111111111111110))))

(declare-fun b!297285 () Bool)

(assert (=> b!297285 (and (bvsge (index!11292 lt!147733) #b00000000000000000000000000000000) (bvslt (index!11292 lt!147733) (size!7483 (array!15048 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7483 a!3312)))))))

(declare-fun e!187873 () Bool)

(assert (=> b!297285 (= e!187873 (= (select (arr!7131 (array!15048 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7483 a!3312))) (index!11292 lt!147733)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297286 () Bool)

(declare-fun e!187874 () Bool)

(assert (=> b!297286 (= e!187877 e!187874)))

(declare-fun res!156792 () Bool)

(assert (=> b!297286 (= res!156792 (and ((_ is Intermediate!2280) lt!147733) (not (undefined!3092 lt!147733)) (bvslt (x!29504 lt!147733) #b01111111111111111111111111111110) (bvsge (x!29504 lt!147733) #b00000000000000000000000000000000) (bvsge (x!29504 lt!147733) #b00000000000000000000000000000000)))))

(assert (=> b!297286 (=> (not res!156792) (not e!187874))))

(declare-fun b!297287 () Bool)

(assert (=> b!297287 (and (bvsge (index!11292 lt!147733) #b00000000000000000000000000000000) (bvslt (index!11292 lt!147733) (size!7483 (array!15048 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7483 a!3312)))))))

(declare-fun res!156791 () Bool)

(assert (=> b!297287 (= res!156791 (= (select (arr!7131 (array!15048 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7483 a!3312))) (index!11292 lt!147733)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297287 (=> res!156791 e!187873)))

(declare-fun b!297288 () Bool)

(declare-fun e!187876 () SeekEntryResult!2280)

(assert (=> b!297288 (= e!187876 (Intermediate!2280 true lt!147708 #b00000000000000000000000000000000))))

(declare-fun b!297289 () Bool)

(assert (=> b!297289 (and (bvsge (index!11292 lt!147733) #b00000000000000000000000000000000) (bvslt (index!11292 lt!147733) (size!7483 (array!15048 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7483 a!3312)))))))

(declare-fun res!156790 () Bool)

(assert (=> b!297289 (= res!156790 (= (select (arr!7131 (array!15048 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7483 a!3312))) (index!11292 lt!147733)) k0!2524))))

(assert (=> b!297289 (=> res!156790 e!187873)))

(assert (=> b!297289 (= e!187874 e!187873)))

(declare-fun b!297290 () Bool)

(declare-fun e!187875 () SeekEntryResult!2280)

(assert (=> b!297290 (= e!187875 (Intermediate!2280 false lt!147708 #b00000000000000000000000000000000))))

(declare-fun b!297291 () Bool)

(assert (=> b!297291 (= e!187876 e!187875)))

(declare-fun c!47829 () Bool)

(declare-fun lt!147732 () (_ BitVec 64))

(assert (=> b!297291 (= c!47829 (or (= lt!147732 k0!2524) (= (bvadd lt!147732 lt!147732) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297292 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297292 (= e!187875 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147708 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15048 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7483 a!3312)) mask!3809))))

(declare-fun d!67163 () Bool)

(assert (=> d!67163 e!187877))

(declare-fun c!47830 () Bool)

(assert (=> d!67163 (= c!47830 (and ((_ is Intermediate!2280) lt!147733) (undefined!3092 lt!147733)))))

(assert (=> d!67163 (= lt!147733 e!187876)))

(declare-fun c!47828 () Bool)

(assert (=> d!67163 (= c!47828 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67163 (= lt!147732 (select (arr!7131 (array!15048 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7483 a!3312))) lt!147708))))

(assert (=> d!67163 (validMask!0 mask!3809)))

(assert (=> d!67163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147708 k0!2524 (array!15048 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7483 a!3312)) mask!3809) lt!147733)))

(assert (= (and d!67163 c!47828) b!297288))

(assert (= (and d!67163 (not c!47828)) b!297291))

(assert (= (and b!297291 c!47829) b!297290))

(assert (= (and b!297291 (not c!47829)) b!297292))

(assert (= (and d!67163 c!47830) b!297284))

(assert (= (and d!67163 (not c!47830)) b!297286))

(assert (= (and b!297286 res!156792) b!297289))

(assert (= (and b!297289 (not res!156790)) b!297287))

(assert (= (and b!297287 (not res!156791)) b!297285))

(declare-fun m!310105 () Bool)

(assert (=> b!297285 m!310105))

(assert (=> b!297289 m!310105))

(declare-fun m!310107 () Bool)

(assert (=> d!67163 m!310107))

(assert (=> d!67163 m!310061))

(assert (=> b!297287 m!310105))

(declare-fun m!310109 () Bool)

(assert (=> b!297292 m!310109))

(assert (=> b!297292 m!310109))

(declare-fun m!310111 () Bool)

(assert (=> b!297292 m!310111))

(assert (=> b!297231 d!67163))

(declare-fun b!297301 () Bool)

(declare-fun e!187888 () Bool)

(declare-fun lt!147735 () SeekEntryResult!2280)

(assert (=> b!297301 (= e!187888 (bvsge (x!29504 lt!147735) #b01111111111111111111111111111110))))

(declare-fun b!297302 () Bool)

(assert (=> b!297302 (and (bvsge (index!11292 lt!147735) #b00000000000000000000000000000000) (bvslt (index!11292 lt!147735) (size!7483 a!3312)))))

(declare-fun e!187884 () Bool)

(assert (=> b!297302 (= e!187884 (= (select (arr!7131 a!3312) (index!11292 lt!147735)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297303 () Bool)

(declare-fun e!187885 () Bool)

(assert (=> b!297303 (= e!187888 e!187885)))

(declare-fun res!156799 () Bool)

(assert (=> b!297303 (= res!156799 (and ((_ is Intermediate!2280) lt!147735) (not (undefined!3092 lt!147735)) (bvslt (x!29504 lt!147735) #b01111111111111111111111111111110) (bvsge (x!29504 lt!147735) #b00000000000000000000000000000000) (bvsge (x!29504 lt!147735) #b00000000000000000000000000000000)))))

(assert (=> b!297303 (=> (not res!156799) (not e!187885))))

(declare-fun b!297304 () Bool)

(assert (=> b!297304 (and (bvsge (index!11292 lt!147735) #b00000000000000000000000000000000) (bvslt (index!11292 lt!147735) (size!7483 a!3312)))))

(declare-fun res!156798 () Bool)

(assert (=> b!297304 (= res!156798 (= (select (arr!7131 a!3312) (index!11292 lt!147735)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297304 (=> res!156798 e!187884)))

(declare-fun b!297305 () Bool)

(declare-fun e!187887 () SeekEntryResult!2280)

(assert (=> b!297305 (= e!187887 (Intermediate!2280 true lt!147708 #b00000000000000000000000000000000))))

(declare-fun b!297306 () Bool)

(assert (=> b!297306 (and (bvsge (index!11292 lt!147735) #b00000000000000000000000000000000) (bvslt (index!11292 lt!147735) (size!7483 a!3312)))))

(declare-fun res!156797 () Bool)

(assert (=> b!297306 (= res!156797 (= (select (arr!7131 a!3312) (index!11292 lt!147735)) k0!2524))))

(assert (=> b!297306 (=> res!156797 e!187884)))

(assert (=> b!297306 (= e!187885 e!187884)))

(declare-fun b!297307 () Bool)

(declare-fun e!187886 () SeekEntryResult!2280)

(assert (=> b!297307 (= e!187886 (Intermediate!2280 false lt!147708 #b00000000000000000000000000000000))))

(declare-fun b!297308 () Bool)

(assert (=> b!297308 (= e!187887 e!187886)))

(declare-fun c!47834 () Bool)

(declare-fun lt!147734 () (_ BitVec 64))

(assert (=> b!297308 (= c!47834 (or (= lt!147734 k0!2524) (= (bvadd lt!147734 lt!147734) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297309 () Bool)

(assert (=> b!297309 (= e!187886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147708 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun d!67173 () Bool)

(assert (=> d!67173 e!187888))

(declare-fun c!47835 () Bool)

(assert (=> d!67173 (= c!47835 (and ((_ is Intermediate!2280) lt!147735) (undefined!3092 lt!147735)))))

(assert (=> d!67173 (= lt!147735 e!187887)))

(declare-fun c!47833 () Bool)

(assert (=> d!67173 (= c!47833 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67173 (= lt!147734 (select (arr!7131 a!3312) lt!147708))))

(assert (=> d!67173 (validMask!0 mask!3809)))

(assert (=> d!67173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147708 k0!2524 a!3312 mask!3809) lt!147735)))

(assert (= (and d!67173 c!47833) b!297305))

(assert (= (and d!67173 (not c!47833)) b!297308))

(assert (= (and b!297308 c!47834) b!297307))

(assert (= (and b!297308 (not c!47834)) b!297309))

(assert (= (and d!67173 c!47835) b!297301))

(assert (= (and d!67173 (not c!47835)) b!297303))

(assert (= (and b!297303 res!156799) b!297306))

(assert (= (and b!297306 (not res!156797)) b!297304))

(assert (= (and b!297304 (not res!156798)) b!297302))

(declare-fun m!310113 () Bool)

(assert (=> b!297302 m!310113))

(assert (=> b!297306 m!310113))

(declare-fun m!310115 () Bool)

(assert (=> d!67173 m!310115))

(assert (=> d!67173 m!310061))

(assert (=> b!297304 m!310113))

(assert (=> b!297309 m!310109))

(assert (=> b!297309 m!310109))

(declare-fun m!310117 () Bool)

(assert (=> b!297309 m!310117))

(assert (=> b!297231 d!67173))

(declare-fun d!67175 () Bool)

(declare-fun lt!147754 () (_ BitVec 32))

(declare-fun lt!147753 () (_ BitVec 32))

(assert (=> d!67175 (= lt!147754 (bvmul (bvxor lt!147753 (bvlshr lt!147753 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67175 (= lt!147753 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67175 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156806 (let ((h!5298 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29508 (bvmul (bvxor h!5298 (bvlshr h!5298 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29508 (bvlshr x!29508 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156806 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156806 #b00000000000000000000000000000000))))))

(assert (=> d!67175 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!147754 (bvlshr lt!147754 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!297231 d!67175))

(declare-fun d!67183 () Bool)

(assert (=> d!67183 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!297230 d!67183))

(declare-fun d!67185 () Bool)

(declare-fun res!156820 () Bool)

(declare-fun e!187916 () Bool)

(assert (=> d!67185 (=> res!156820 e!187916)))

(assert (=> d!67185 (= res!156820 (bvsge #b00000000000000000000000000000000 (size!7483 a!3312)))))

(assert (=> d!67185 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187916)))

(declare-fun bm!25756 () Bool)

(declare-fun call!25759 () Bool)

(assert (=> bm!25756 (= call!25759 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!297350 () Bool)

(declare-fun e!187915 () Bool)

(assert (=> b!297350 (= e!187915 call!25759)))

(declare-fun b!297351 () Bool)

(declare-fun e!187914 () Bool)

(assert (=> b!297351 (= e!187914 call!25759)))

(declare-fun b!297352 () Bool)

(assert (=> b!297352 (= e!187915 e!187914)))

(declare-fun lt!147768 () (_ BitVec 64))

(assert (=> b!297352 (= lt!147768 (select (arr!7131 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9258 0))(
  ( (Unit!9259) )
))
(declare-fun lt!147767 () Unit!9258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15047 (_ BitVec 64) (_ BitVec 32)) Unit!9258)

(assert (=> b!297352 (= lt!147767 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147768 #b00000000000000000000000000000000))))

(assert (=> b!297352 (arrayContainsKey!0 a!3312 lt!147768 #b00000000000000000000000000000000)))

(declare-fun lt!147769 () Unit!9258)

(assert (=> b!297352 (= lt!147769 lt!147767)))

(declare-fun res!156821 () Bool)

(assert (=> b!297352 (= res!156821 (= (seekEntryOrOpen!0 (select (arr!7131 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2280 #b00000000000000000000000000000000)))))

(assert (=> b!297352 (=> (not res!156821) (not e!187914))))

(declare-fun b!297353 () Bool)

(assert (=> b!297353 (= e!187916 e!187915)))

(declare-fun c!47847 () Bool)

(assert (=> b!297353 (= c!47847 (validKeyInArray!0 (select (arr!7131 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!67185 (not res!156820)) b!297353))

(assert (= (and b!297353 c!47847) b!297352))

(assert (= (and b!297353 (not c!47847)) b!297350))

(assert (= (and b!297352 res!156821) b!297351))

(assert (= (or b!297351 b!297350) bm!25756))

(declare-fun m!310143 () Bool)

(assert (=> bm!25756 m!310143))

(declare-fun m!310145 () Bool)

(assert (=> b!297352 m!310145))

(declare-fun m!310147 () Bool)

(assert (=> b!297352 m!310147))

(declare-fun m!310149 () Bool)

(assert (=> b!297352 m!310149))

(assert (=> b!297352 m!310145))

(declare-fun m!310151 () Bool)

(assert (=> b!297352 m!310151))

(assert (=> b!297353 m!310145))

(assert (=> b!297353 m!310145))

(declare-fun m!310153 () Bool)

(assert (=> b!297353 m!310153))

(assert (=> b!297229 d!67185))

(declare-fun d!67193 () Bool)

(declare-fun res!156830 () Bool)

(declare-fun e!187927 () Bool)

(assert (=> d!67193 (=> res!156830 e!187927)))

(assert (=> d!67193 (= res!156830 (= (select (arr!7131 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67193 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!187927)))

(declare-fun b!297366 () Bool)

(declare-fun e!187928 () Bool)

(assert (=> b!297366 (= e!187927 e!187928)))

(declare-fun res!156831 () Bool)

(assert (=> b!297366 (=> (not res!156831) (not e!187928))))

(assert (=> b!297366 (= res!156831 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7483 a!3312)))))

(declare-fun b!297367 () Bool)

(assert (=> b!297367 (= e!187928 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67193 (not res!156830)) b!297366))

(assert (= (and b!297366 res!156831) b!297367))

(assert (=> d!67193 m!310145))

(declare-fun m!310155 () Bool)

(assert (=> b!297367 m!310155))

(assert (=> b!297233 d!67193))

(declare-fun lt!147795 () SeekEntryResult!2280)

(declare-fun e!187964 () SeekEntryResult!2280)

(declare-fun b!297426 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15047 (_ BitVec 32)) SeekEntryResult!2280)

(assert (=> b!297426 (= e!187964 (seekKeyOrZeroReturnVacant!0 (x!29504 lt!147795) (index!11292 lt!147795) (index!11292 lt!147795) k0!2524 a!3312 mask!3809))))

(declare-fun d!67195 () Bool)

(declare-fun lt!147793 () SeekEntryResult!2280)

(assert (=> d!67195 (and (or ((_ is Undefined!2280) lt!147793) (not ((_ is Found!2280) lt!147793)) (and (bvsge (index!11291 lt!147793) #b00000000000000000000000000000000) (bvslt (index!11291 lt!147793) (size!7483 a!3312)))) (or ((_ is Undefined!2280) lt!147793) ((_ is Found!2280) lt!147793) (not ((_ is MissingZero!2280) lt!147793)) (and (bvsge (index!11290 lt!147793) #b00000000000000000000000000000000) (bvslt (index!11290 lt!147793) (size!7483 a!3312)))) (or ((_ is Undefined!2280) lt!147793) ((_ is Found!2280) lt!147793) ((_ is MissingZero!2280) lt!147793) (not ((_ is MissingVacant!2280) lt!147793)) (and (bvsge (index!11293 lt!147793) #b00000000000000000000000000000000) (bvslt (index!11293 lt!147793) (size!7483 a!3312)))) (or ((_ is Undefined!2280) lt!147793) (ite ((_ is Found!2280) lt!147793) (= (select (arr!7131 a!3312) (index!11291 lt!147793)) k0!2524) (ite ((_ is MissingZero!2280) lt!147793) (= (select (arr!7131 a!3312) (index!11290 lt!147793)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2280) lt!147793) (= (select (arr!7131 a!3312) (index!11293 lt!147793)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!187966 () SeekEntryResult!2280)

(assert (=> d!67195 (= lt!147793 e!187966)))

(declare-fun c!47869 () Bool)

(assert (=> d!67195 (= c!47869 (and ((_ is Intermediate!2280) lt!147795) (undefined!3092 lt!147795)))))

(assert (=> d!67195 (= lt!147795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67195 (validMask!0 mask!3809)))

(assert (=> d!67195 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!147793)))

(declare-fun b!297427 () Bool)

(declare-fun c!47871 () Bool)

(declare-fun lt!147794 () (_ BitVec 64))

(assert (=> b!297427 (= c!47871 (= lt!147794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187965 () SeekEntryResult!2280)

(assert (=> b!297427 (= e!187965 e!187964)))

(declare-fun b!297428 () Bool)

(assert (=> b!297428 (= e!187965 (Found!2280 (index!11292 lt!147795)))))

(declare-fun b!297429 () Bool)

(assert (=> b!297429 (= e!187964 (MissingZero!2280 (index!11292 lt!147795)))))

(declare-fun b!297430 () Bool)

(assert (=> b!297430 (= e!187966 Undefined!2280)))

(declare-fun b!297431 () Bool)

(assert (=> b!297431 (= e!187966 e!187965)))

(assert (=> b!297431 (= lt!147794 (select (arr!7131 a!3312) (index!11292 lt!147795)))))

(declare-fun c!47870 () Bool)

(assert (=> b!297431 (= c!47870 (= lt!147794 k0!2524))))

(assert (= (and d!67195 c!47869) b!297430))

(assert (= (and d!67195 (not c!47869)) b!297431))

(assert (= (and b!297431 c!47870) b!297428))

(assert (= (and b!297431 (not c!47870)) b!297427))

(assert (= (and b!297427 c!47871) b!297429))

(assert (= (and b!297427 (not c!47871)) b!297426))

(declare-fun m!310185 () Bool)

(assert (=> b!297426 m!310185))

(declare-fun m!310187 () Bool)

(assert (=> d!67195 m!310187))

(declare-fun m!310189 () Bool)

(assert (=> d!67195 m!310189))

(assert (=> d!67195 m!310079))

(declare-fun m!310191 () Bool)

(assert (=> d!67195 m!310191))

(assert (=> d!67195 m!310079))

(declare-fun m!310193 () Bool)

(assert (=> d!67195 m!310193))

(assert (=> d!67195 m!310061))

(declare-fun m!310195 () Bool)

(assert (=> b!297431 m!310195))

(assert (=> b!297232 d!67195))

(declare-fun d!67211 () Bool)

(assert (=> d!67211 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29334 d!67211))

(declare-fun d!67215 () Bool)

(assert (=> d!67215 (= (array_inv!5094 a!3312) (bvsge (size!7483 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29334 d!67215))

(check-sat (not d!67173) (not b!297309) (not d!67163) (not bm!25756) (not b!297352) (not b!297367) (not b!297353) (not b!297292) (not d!67195) (not b!297426))
(check-sat)
