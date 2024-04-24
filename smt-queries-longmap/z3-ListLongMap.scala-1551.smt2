; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29326 () Bool)

(assert start!29326)

(declare-fun res!156766 () Bool)

(declare-fun e!187868 () Bool)

(assert (=> start!29326 (=> (not res!156766) (not e!187868))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29326 (= res!156766 (validMask!0 mask!3809))))

(assert (=> start!29326 e!187868))

(assert (=> start!29326 true))

(declare-datatypes ((array!15042 0))(
  ( (array!15043 (arr!7129 (Array (_ BitVec 32) (_ BitVec 64))) (size!7481 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15042)

(declare-fun array_inv!5079 (array!15042) Bool)

(assert (=> start!29326 (array_inv!5079 a!3312)))

(declare-fun b!297275 () Bool)

(declare-fun e!187866 () Bool)

(assert (=> b!297275 (= e!187868 e!187866)))

(declare-fun res!156768 () Bool)

(assert (=> b!297275 (=> (not res!156768) (not e!187866))))

(declare-datatypes ((SeekEntryResult!2243 0))(
  ( (MissingZero!2243 (index!11142 (_ BitVec 32))) (Found!2243 (index!11143 (_ BitVec 32))) (Intermediate!2243 (undefined!3055 Bool) (index!11144 (_ BitVec 32)) (x!29468 (_ BitVec 32))) (Undefined!2243) (MissingVacant!2243 (index!11145 (_ BitVec 32))) )
))
(declare-fun lt!147759 () SeekEntryResult!2243)

(declare-fun lt!147756 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!297275 (= res!156768 (or lt!147756 (= lt!147759 (MissingVacant!2243 i!1256))))))

(assert (=> b!297275 (= lt!147756 (= lt!147759 (MissingZero!2243 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15042 (_ BitVec 32)) SeekEntryResult!2243)

(assert (=> b!297275 (= lt!147759 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297276 () Bool)

(declare-fun res!156764 () Bool)

(assert (=> b!297276 (=> (not res!156764) (not e!187868))))

(declare-fun arrayContainsKey!0 (array!15042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297276 (= res!156764 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297277 () Bool)

(declare-fun lt!147758 () SeekEntryResult!2243)

(get-info :version)

(assert (=> b!297277 (= e!187866 (and lt!147756 (not ((_ is Intermediate!2243) lt!147758))))))

(declare-fun lt!147757 () SeekEntryResult!2243)

(declare-fun lt!147755 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15042 (_ BitVec 32)) SeekEntryResult!2243)

(assert (=> b!297277 (= lt!147757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147755 k0!2524 (array!15043 (store (arr!7129 a!3312) i!1256 k0!2524) (size!7481 a!3312)) mask!3809))))

(assert (=> b!297277 (= lt!147758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147755 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297277 (= lt!147755 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297278 () Bool)

(declare-fun res!156763 () Bool)

(assert (=> b!297278 (=> (not res!156763) (not e!187866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15042 (_ BitVec 32)) Bool)

(assert (=> b!297278 (= res!156763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297279 () Bool)

(declare-fun res!156765 () Bool)

(assert (=> b!297279 (=> (not res!156765) (not e!187868))))

(assert (=> b!297279 (= res!156765 (and (= (size!7481 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7481 a!3312))))))

(declare-fun b!297280 () Bool)

(declare-fun res!156767 () Bool)

(assert (=> b!297280 (=> (not res!156767) (not e!187868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297280 (= res!156767 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29326 res!156766) b!297279))

(assert (= (and b!297279 res!156765) b!297280))

(assert (= (and b!297280 res!156767) b!297276))

(assert (= (and b!297276 res!156764) b!297275))

(assert (= (and b!297275 res!156768) b!297278))

(assert (= (and b!297278 res!156763) b!297277))

(declare-fun m!310271 () Bool)

(assert (=> b!297277 m!310271))

(declare-fun m!310273 () Bool)

(assert (=> b!297277 m!310273))

(declare-fun m!310275 () Bool)

(assert (=> b!297277 m!310275))

(declare-fun m!310277 () Bool)

(assert (=> b!297277 m!310277))

(declare-fun m!310279 () Bool)

(assert (=> b!297278 m!310279))

(declare-fun m!310281 () Bool)

(assert (=> b!297275 m!310281))

(declare-fun m!310283 () Bool)

(assert (=> b!297276 m!310283))

(declare-fun m!310285 () Bool)

(assert (=> start!29326 m!310285))

(declare-fun m!310287 () Bool)

(assert (=> start!29326 m!310287))

(declare-fun m!310289 () Bool)

(assert (=> b!297280 m!310289))

(check-sat (not start!29326) (not b!297276) (not b!297277) (not b!297275) (not b!297280) (not b!297278))
(check-sat)
(get-model)

(declare-fun b!297329 () Bool)

(declare-fun c!47843 () Bool)

(declare-fun lt!147797 () (_ BitVec 64))

(assert (=> b!297329 (= c!47843 (= lt!147797 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187894 () SeekEntryResult!2243)

(declare-fun e!187893 () SeekEntryResult!2243)

(assert (=> b!297329 (= e!187894 e!187893)))

(declare-fun lt!147798 () SeekEntryResult!2243)

(declare-fun b!297330 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15042 (_ BitVec 32)) SeekEntryResult!2243)

(assert (=> b!297330 (= e!187893 (seekKeyOrZeroReturnVacant!0 (x!29468 lt!147798) (index!11144 lt!147798) (index!11144 lt!147798) k0!2524 a!3312 mask!3809))))

(declare-fun b!297331 () Bool)

(declare-fun e!187895 () SeekEntryResult!2243)

(assert (=> b!297331 (= e!187895 Undefined!2243)))

(declare-fun b!297332 () Bool)

(assert (=> b!297332 (= e!187893 (MissingZero!2243 (index!11144 lt!147798)))))

(declare-fun d!67231 () Bool)

(declare-fun lt!147796 () SeekEntryResult!2243)

(assert (=> d!67231 (and (or ((_ is Undefined!2243) lt!147796) (not ((_ is Found!2243) lt!147796)) (and (bvsge (index!11143 lt!147796) #b00000000000000000000000000000000) (bvslt (index!11143 lt!147796) (size!7481 a!3312)))) (or ((_ is Undefined!2243) lt!147796) ((_ is Found!2243) lt!147796) (not ((_ is MissingZero!2243) lt!147796)) (and (bvsge (index!11142 lt!147796) #b00000000000000000000000000000000) (bvslt (index!11142 lt!147796) (size!7481 a!3312)))) (or ((_ is Undefined!2243) lt!147796) ((_ is Found!2243) lt!147796) ((_ is MissingZero!2243) lt!147796) (not ((_ is MissingVacant!2243) lt!147796)) (and (bvsge (index!11145 lt!147796) #b00000000000000000000000000000000) (bvslt (index!11145 lt!147796) (size!7481 a!3312)))) (or ((_ is Undefined!2243) lt!147796) (ite ((_ is Found!2243) lt!147796) (= (select (arr!7129 a!3312) (index!11143 lt!147796)) k0!2524) (ite ((_ is MissingZero!2243) lt!147796) (= (select (arr!7129 a!3312) (index!11142 lt!147796)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2243) lt!147796) (= (select (arr!7129 a!3312) (index!11145 lt!147796)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67231 (= lt!147796 e!187895)))

(declare-fun c!47844 () Bool)

(assert (=> d!67231 (= c!47844 (and ((_ is Intermediate!2243) lt!147798) (undefined!3055 lt!147798)))))

(assert (=> d!67231 (= lt!147798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67231 (validMask!0 mask!3809)))

(assert (=> d!67231 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!147796)))

(declare-fun b!297333 () Bool)

(assert (=> b!297333 (= e!187894 (Found!2243 (index!11144 lt!147798)))))

(declare-fun b!297334 () Bool)

(assert (=> b!297334 (= e!187895 e!187894)))

(assert (=> b!297334 (= lt!147797 (select (arr!7129 a!3312) (index!11144 lt!147798)))))

(declare-fun c!47845 () Bool)

(assert (=> b!297334 (= c!47845 (= lt!147797 k0!2524))))

(assert (= (and d!67231 c!47844) b!297331))

(assert (= (and d!67231 (not c!47844)) b!297334))

(assert (= (and b!297334 c!47845) b!297333))

(assert (= (and b!297334 (not c!47845)) b!297329))

(assert (= (and b!297329 c!47843) b!297332))

(assert (= (and b!297329 (not c!47843)) b!297330))

(declare-fun m!310331 () Bool)

(assert (=> b!297330 m!310331))

(assert (=> d!67231 m!310277))

(declare-fun m!310333 () Bool)

(assert (=> d!67231 m!310333))

(assert (=> d!67231 m!310277))

(assert (=> d!67231 m!310285))

(declare-fun m!310335 () Bool)

(assert (=> d!67231 m!310335))

(declare-fun m!310337 () Bool)

(assert (=> d!67231 m!310337))

(declare-fun m!310339 () Bool)

(assert (=> d!67231 m!310339))

(declare-fun m!310341 () Bool)

(assert (=> b!297334 m!310341))

(assert (=> b!297275 d!67231))

(declare-fun d!67243 () Bool)

(declare-fun res!156815 () Bool)

(declare-fun e!187906 () Bool)

(assert (=> d!67243 (=> res!156815 e!187906)))

(assert (=> d!67243 (= res!156815 (= (select (arr!7129 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67243 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!187906)))

(declare-fun b!297345 () Bool)

(declare-fun e!187907 () Bool)

(assert (=> b!297345 (= e!187906 e!187907)))

(declare-fun res!156816 () Bool)

(assert (=> b!297345 (=> (not res!156816) (not e!187907))))

(assert (=> b!297345 (= res!156816 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7481 a!3312)))))

(declare-fun b!297346 () Bool)

(assert (=> b!297346 (= e!187907 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67243 (not res!156815)) b!297345))

(assert (= (and b!297345 res!156816) b!297346))

(declare-fun m!310347 () Bool)

(assert (=> d!67243 m!310347))

(declare-fun m!310349 () Bool)

(assert (=> b!297346 m!310349))

(assert (=> b!297276 d!67243))

(declare-fun b!297402 () Bool)

(declare-fun e!187940 () SeekEntryResult!2243)

(declare-fun e!187936 () SeekEntryResult!2243)

(assert (=> b!297402 (= e!187940 e!187936)))

(declare-fun c!47871 () Bool)

(declare-fun lt!147822 () (_ BitVec 64))

(assert (=> b!297402 (= c!47871 (or (= lt!147822 k0!2524) (= (bvadd lt!147822 lt!147822) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297403 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297403 (= e!187936 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147755 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15043 (store (arr!7129 a!3312) i!1256 k0!2524) (size!7481 a!3312)) mask!3809))))

(declare-fun lt!147821 () SeekEntryResult!2243)

(declare-fun b!297404 () Bool)

(assert (=> b!297404 (and (bvsge (index!11144 lt!147821) #b00000000000000000000000000000000) (bvslt (index!11144 lt!147821) (size!7481 (array!15043 (store (arr!7129 a!3312) i!1256 k0!2524) (size!7481 a!3312)))))))

(declare-fun e!187938 () Bool)

(assert (=> b!297404 (= e!187938 (= (select (arr!7129 (array!15043 (store (arr!7129 a!3312) i!1256 k0!2524) (size!7481 a!3312))) (index!11144 lt!147821)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297405 () Bool)

(declare-fun e!187939 () Bool)

(assert (=> b!297405 (= e!187939 (bvsge (x!29468 lt!147821) #b01111111111111111111111111111110))))

(declare-fun b!297406 () Bool)

(assert (=> b!297406 (= e!187940 (Intermediate!2243 true lt!147755 #b00000000000000000000000000000000))))

(declare-fun b!297407 () Bool)

(assert (=> b!297407 (and (bvsge (index!11144 lt!147821) #b00000000000000000000000000000000) (bvslt (index!11144 lt!147821) (size!7481 (array!15043 (store (arr!7129 a!3312) i!1256 k0!2524) (size!7481 a!3312)))))))

(declare-fun res!156825 () Bool)

(assert (=> b!297407 (= res!156825 (= (select (arr!7129 (array!15043 (store (arr!7129 a!3312) i!1256 k0!2524) (size!7481 a!3312))) (index!11144 lt!147821)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297407 (=> res!156825 e!187938)))

(declare-fun b!297408 () Bool)

(assert (=> b!297408 (and (bvsge (index!11144 lt!147821) #b00000000000000000000000000000000) (bvslt (index!11144 lt!147821) (size!7481 (array!15043 (store (arr!7129 a!3312) i!1256 k0!2524) (size!7481 a!3312)))))))

(declare-fun res!156824 () Bool)

(assert (=> b!297408 (= res!156824 (= (select (arr!7129 (array!15043 (store (arr!7129 a!3312) i!1256 k0!2524) (size!7481 a!3312))) (index!11144 lt!147821)) k0!2524))))

(assert (=> b!297408 (=> res!156824 e!187938)))

(declare-fun e!187937 () Bool)

(assert (=> b!297408 (= e!187937 e!187938)))

(declare-fun b!297409 () Bool)

(assert (=> b!297409 (= e!187936 (Intermediate!2243 false lt!147755 #b00000000000000000000000000000000))))

(declare-fun d!67247 () Bool)

(assert (=> d!67247 e!187939))

(declare-fun c!47872 () Bool)

(assert (=> d!67247 (= c!47872 (and ((_ is Intermediate!2243) lt!147821) (undefined!3055 lt!147821)))))

(assert (=> d!67247 (= lt!147821 e!187940)))

(declare-fun c!47870 () Bool)

(assert (=> d!67247 (= c!47870 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67247 (= lt!147822 (select (arr!7129 (array!15043 (store (arr!7129 a!3312) i!1256 k0!2524) (size!7481 a!3312))) lt!147755))))

(assert (=> d!67247 (validMask!0 mask!3809)))

(assert (=> d!67247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147755 k0!2524 (array!15043 (store (arr!7129 a!3312) i!1256 k0!2524) (size!7481 a!3312)) mask!3809) lt!147821)))

(declare-fun b!297401 () Bool)

(assert (=> b!297401 (= e!187939 e!187937)))

(declare-fun res!156823 () Bool)

(assert (=> b!297401 (= res!156823 (and ((_ is Intermediate!2243) lt!147821) (not (undefined!3055 lt!147821)) (bvslt (x!29468 lt!147821) #b01111111111111111111111111111110) (bvsge (x!29468 lt!147821) #b00000000000000000000000000000000) (bvsge (x!29468 lt!147821) #b00000000000000000000000000000000)))))

(assert (=> b!297401 (=> (not res!156823) (not e!187937))))

(assert (= (and d!67247 c!47870) b!297406))

(assert (= (and d!67247 (not c!47870)) b!297402))

(assert (= (and b!297402 c!47871) b!297409))

(assert (= (and b!297402 (not c!47871)) b!297403))

(assert (= (and d!67247 c!47872) b!297405))

(assert (= (and d!67247 (not c!47872)) b!297401))

(assert (= (and b!297401 res!156823) b!297408))

(assert (= (and b!297408 (not res!156824)) b!297407))

(assert (= (and b!297407 (not res!156825)) b!297404))

(declare-fun m!310375 () Bool)

(assert (=> b!297403 m!310375))

(assert (=> b!297403 m!310375))

(declare-fun m!310377 () Bool)

(assert (=> b!297403 m!310377))

(declare-fun m!310379 () Bool)

(assert (=> b!297404 m!310379))

(assert (=> b!297408 m!310379))

(assert (=> b!297407 m!310379))

(declare-fun m!310381 () Bool)

(assert (=> d!67247 m!310381))

(assert (=> d!67247 m!310285))

(assert (=> b!297277 d!67247))

(declare-fun b!297411 () Bool)

(declare-fun e!187945 () SeekEntryResult!2243)

(declare-fun e!187941 () SeekEntryResult!2243)

(assert (=> b!297411 (= e!187945 e!187941)))

(declare-fun c!47874 () Bool)

(declare-fun lt!147824 () (_ BitVec 64))

(assert (=> b!297411 (= c!47874 (or (= lt!147824 k0!2524) (= (bvadd lt!147824 lt!147824) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297412 () Bool)

(assert (=> b!297412 (= e!187941 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147755 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!297413 () Bool)

(declare-fun lt!147823 () SeekEntryResult!2243)

(assert (=> b!297413 (and (bvsge (index!11144 lt!147823) #b00000000000000000000000000000000) (bvslt (index!11144 lt!147823) (size!7481 a!3312)))))

(declare-fun e!187943 () Bool)

(assert (=> b!297413 (= e!187943 (= (select (arr!7129 a!3312) (index!11144 lt!147823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297414 () Bool)

(declare-fun e!187944 () Bool)

(assert (=> b!297414 (= e!187944 (bvsge (x!29468 lt!147823) #b01111111111111111111111111111110))))

(declare-fun b!297415 () Bool)

(assert (=> b!297415 (= e!187945 (Intermediate!2243 true lt!147755 #b00000000000000000000000000000000))))

(declare-fun b!297416 () Bool)

(assert (=> b!297416 (and (bvsge (index!11144 lt!147823) #b00000000000000000000000000000000) (bvslt (index!11144 lt!147823) (size!7481 a!3312)))))

(declare-fun res!156828 () Bool)

(assert (=> b!297416 (= res!156828 (= (select (arr!7129 a!3312) (index!11144 lt!147823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297416 (=> res!156828 e!187943)))

(declare-fun b!297417 () Bool)

(assert (=> b!297417 (and (bvsge (index!11144 lt!147823) #b00000000000000000000000000000000) (bvslt (index!11144 lt!147823) (size!7481 a!3312)))))

(declare-fun res!156827 () Bool)

(assert (=> b!297417 (= res!156827 (= (select (arr!7129 a!3312) (index!11144 lt!147823)) k0!2524))))

(assert (=> b!297417 (=> res!156827 e!187943)))

(declare-fun e!187942 () Bool)

(assert (=> b!297417 (= e!187942 e!187943)))

(declare-fun b!297418 () Bool)

(assert (=> b!297418 (= e!187941 (Intermediate!2243 false lt!147755 #b00000000000000000000000000000000))))

(declare-fun d!67253 () Bool)

(assert (=> d!67253 e!187944))

(declare-fun c!47875 () Bool)

(assert (=> d!67253 (= c!47875 (and ((_ is Intermediate!2243) lt!147823) (undefined!3055 lt!147823)))))

(assert (=> d!67253 (= lt!147823 e!187945)))

(declare-fun c!47873 () Bool)

(assert (=> d!67253 (= c!47873 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67253 (= lt!147824 (select (arr!7129 a!3312) lt!147755))))

(assert (=> d!67253 (validMask!0 mask!3809)))

(assert (=> d!67253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147755 k0!2524 a!3312 mask!3809) lt!147823)))

(declare-fun b!297410 () Bool)

(assert (=> b!297410 (= e!187944 e!187942)))

(declare-fun res!156826 () Bool)

(assert (=> b!297410 (= res!156826 (and ((_ is Intermediate!2243) lt!147823) (not (undefined!3055 lt!147823)) (bvslt (x!29468 lt!147823) #b01111111111111111111111111111110) (bvsge (x!29468 lt!147823) #b00000000000000000000000000000000) (bvsge (x!29468 lt!147823) #b00000000000000000000000000000000)))))

(assert (=> b!297410 (=> (not res!156826) (not e!187942))))

(assert (= (and d!67253 c!47873) b!297415))

(assert (= (and d!67253 (not c!47873)) b!297411))

(assert (= (and b!297411 c!47874) b!297418))

(assert (= (and b!297411 (not c!47874)) b!297412))

(assert (= (and d!67253 c!47875) b!297414))

(assert (= (and d!67253 (not c!47875)) b!297410))

(assert (= (and b!297410 res!156826) b!297417))

(assert (= (and b!297417 (not res!156827)) b!297416))

(assert (= (and b!297416 (not res!156828)) b!297413))

(assert (=> b!297412 m!310375))

(assert (=> b!297412 m!310375))

(declare-fun m!310383 () Bool)

(assert (=> b!297412 m!310383))

(declare-fun m!310385 () Bool)

(assert (=> b!297413 m!310385))

(assert (=> b!297417 m!310385))

(assert (=> b!297416 m!310385))

(declare-fun m!310387 () Bool)

(assert (=> d!67253 m!310387))

(assert (=> d!67253 m!310285))

(assert (=> b!297277 d!67253))

(declare-fun d!67255 () Bool)

(declare-fun lt!147836 () (_ BitVec 32))

(declare-fun lt!147835 () (_ BitVec 32))

(assert (=> d!67255 (= lt!147836 (bvmul (bvxor lt!147835 (bvlshr lt!147835 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67255 (= lt!147835 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67255 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156829 (let ((h!5210 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29472 (bvmul (bvxor h!5210 (bvlshr h!5210 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29472 (bvlshr x!29472 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156829 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156829 #b00000000000000000000000000000000))))))

(assert (=> d!67255 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!147836 (bvlshr lt!147836 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!297277 d!67255))

(declare-fun b!297447 () Bool)

(declare-fun e!187967 () Bool)

(declare-fun e!187966 () Bool)

(assert (=> b!297447 (= e!187967 e!187966)))

(declare-fun c!47885 () Bool)

(assert (=> b!297447 (= c!47885 (validKeyInArray!0 (select (arr!7129 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67257 () Bool)

(declare-fun res!156841 () Bool)

(assert (=> d!67257 (=> res!156841 e!187967)))

(assert (=> d!67257 (= res!156841 (bvsge #b00000000000000000000000000000000 (size!7481 a!3312)))))

(assert (=> d!67257 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187967)))

(declare-fun bm!25744 () Bool)

(declare-fun call!25747 () Bool)

(assert (=> bm!25744 (= call!25747 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!297448 () Bool)

(declare-fun e!187965 () Bool)

(assert (=> b!297448 (= e!187966 e!187965)))

(declare-fun lt!147852 () (_ BitVec 64))

(assert (=> b!297448 (= lt!147852 (select (arr!7129 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9216 0))(
  ( (Unit!9217) )
))
(declare-fun lt!147850 () Unit!9216)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15042 (_ BitVec 64) (_ BitVec 32)) Unit!9216)

(assert (=> b!297448 (= lt!147850 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147852 #b00000000000000000000000000000000))))

(assert (=> b!297448 (arrayContainsKey!0 a!3312 lt!147852 #b00000000000000000000000000000000)))

(declare-fun lt!147851 () Unit!9216)

(assert (=> b!297448 (= lt!147851 lt!147850)))

(declare-fun res!156840 () Bool)

(assert (=> b!297448 (= res!156840 (= (seekEntryOrOpen!0 (select (arr!7129 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2243 #b00000000000000000000000000000000)))))

(assert (=> b!297448 (=> (not res!156840) (not e!187965))))

(declare-fun b!297449 () Bool)

(assert (=> b!297449 (= e!187966 call!25747)))

(declare-fun b!297450 () Bool)

(assert (=> b!297450 (= e!187965 call!25747)))

(assert (= (and d!67257 (not res!156841)) b!297447))

(assert (= (and b!297447 c!47885) b!297448))

(assert (= (and b!297447 (not c!47885)) b!297449))

(assert (= (and b!297448 res!156840) b!297450))

(assert (= (or b!297450 b!297449) bm!25744))

(assert (=> b!297447 m!310347))

(assert (=> b!297447 m!310347))

(declare-fun m!310399 () Bool)

(assert (=> b!297447 m!310399))

(declare-fun m!310401 () Bool)

(assert (=> bm!25744 m!310401))

(assert (=> b!297448 m!310347))

(declare-fun m!310403 () Bool)

(assert (=> b!297448 m!310403))

(declare-fun m!310405 () Bool)

(assert (=> b!297448 m!310405))

(assert (=> b!297448 m!310347))

(declare-fun m!310407 () Bool)

(assert (=> b!297448 m!310407))

(assert (=> b!297278 d!67257))

(declare-fun d!67261 () Bool)

(assert (=> d!67261 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29326 d!67261))

(declare-fun d!67267 () Bool)

(assert (=> d!67267 (= (array_inv!5079 a!3312) (bvsge (size!7481 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29326 d!67267))

(declare-fun d!67269 () Bool)

(assert (=> d!67269 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!297280 d!67269))

(check-sat (not b!297447) (not d!67253) (not b!297403) (not d!67247) (not b!297448) (not b!297346) (not b!297412) (not d!67231) (not bm!25744) (not b!297330))
(check-sat)
