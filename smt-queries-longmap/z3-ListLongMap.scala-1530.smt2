; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28960 () Bool)

(assert start!28960)

(declare-fun b!294720 () Bool)

(declare-fun e!186297 () Bool)

(declare-fun e!186299 () Bool)

(assert (=> b!294720 (= e!186297 e!186299)))

(declare-fun res!154915 () Bool)

(assert (=> b!294720 (=> (not res!154915) (not e!186299))))

(declare-fun lt!146134 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2180 0))(
  ( (MissingZero!2180 (index!10890 (_ BitVec 32))) (Found!2180 (index!10891 (_ BitVec 32))) (Intermediate!2180 (undefined!2992 Bool) (index!10892 (_ BitVec 32)) (x!29207 (_ BitVec 32))) (Undefined!2180) (MissingVacant!2180 (index!10893 (_ BitVec 32))) )
))
(declare-fun lt!146132 () SeekEntryResult!2180)

(assert (=> b!294720 (= res!154915 (or lt!146134 (= lt!146132 (MissingVacant!2180 i!1256))))))

(assert (=> b!294720 (= lt!146134 (= lt!146132 (MissingZero!2180 i!1256)))))

(declare-datatypes ((array!14901 0))(
  ( (array!14902 (arr!7066 (Array (_ BitVec 32) (_ BitVec 64))) (size!7418 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14901)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14901 (_ BitVec 32)) SeekEntryResult!2180)

(assert (=> b!294720 (= lt!146132 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!294721 () Bool)

(declare-fun res!154916 () Bool)

(assert (=> b!294721 (=> (not res!154916) (not e!186297))))

(assert (=> b!294721 (= res!154916 (and (= (size!7418 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7418 a!3312))))))

(declare-fun b!294722 () Bool)

(declare-fun res!154917 () Bool)

(assert (=> b!294722 (=> (not res!154917) (not e!186299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14901 (_ BitVec 32)) Bool)

(assert (=> b!294722 (= res!154917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!154914 () Bool)

(assert (=> start!28960 (=> (not res!154914) (not e!186297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28960 (= res!154914 (validMask!0 mask!3809))))

(assert (=> start!28960 e!186297))

(assert (=> start!28960 true))

(declare-fun array_inv!5016 (array!14901) Bool)

(assert (=> start!28960 (array_inv!5016 a!3312)))

(declare-fun b!294719 () Bool)

(declare-fun res!154912 () Bool)

(assert (=> b!294719 (=> (not res!154912) (not e!186297))))

(declare-fun arrayContainsKey!0 (array!14901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294719 (= res!154912 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294723 () Bool)

(declare-fun res!154913 () Bool)

(assert (=> b!294723 (=> (not res!154913) (not e!186297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294723 (= res!154913 (validKeyInArray!0 k0!2524))))

(declare-fun b!294724 () Bool)

(declare-fun lt!146133 () SeekEntryResult!2180)

(get-info :version)

(assert (=> b!294724 (= e!186299 (and lt!146134 (let ((bdg!6241 (not ((_ is Intermediate!2180) lt!146133)))) (and (or bdg!6241 (not (undefined!2992 lt!146133))) (or bdg!6241 (not (= (select (arr!7066 a!3312) (index!10892 lt!146133)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6241 (not (= (select (arr!7066 a!3312) (index!10892 lt!146133)) k0!2524))) (not bdg!6241) (or (bvslt (index!10892 lt!146133) #b00000000000000000000000000000000) (bvsge (index!10892 lt!146133) (size!7418 a!3312)))))))))

(declare-fun lt!146136 () (_ BitVec 32))

(declare-fun lt!146135 () SeekEntryResult!2180)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14901 (_ BitVec 32)) SeekEntryResult!2180)

(assert (=> b!294724 (= lt!146135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146136 k0!2524 (array!14902 (store (arr!7066 a!3312) i!1256 k0!2524) (size!7418 a!3312)) mask!3809))))

(assert (=> b!294724 (= lt!146133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146136 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294724 (= lt!146136 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28960 res!154914) b!294721))

(assert (= (and b!294721 res!154916) b!294723))

(assert (= (and b!294723 res!154913) b!294719))

(assert (= (and b!294719 res!154912) b!294720))

(assert (= (and b!294720 res!154915) b!294722))

(assert (= (and b!294722 res!154917) b!294724))

(declare-fun m!308261 () Bool)

(assert (=> b!294719 m!308261))

(declare-fun m!308263 () Bool)

(assert (=> b!294723 m!308263))

(declare-fun m!308265 () Bool)

(assert (=> b!294722 m!308265))

(declare-fun m!308267 () Bool)

(assert (=> b!294724 m!308267))

(declare-fun m!308269 () Bool)

(assert (=> b!294724 m!308269))

(declare-fun m!308271 () Bool)

(assert (=> b!294724 m!308271))

(declare-fun m!308273 () Bool)

(assert (=> b!294724 m!308273))

(declare-fun m!308275 () Bool)

(assert (=> b!294724 m!308275))

(declare-fun m!308277 () Bool)

(assert (=> start!28960 m!308277))

(declare-fun m!308279 () Bool)

(assert (=> start!28960 m!308279))

(declare-fun m!308281 () Bool)

(assert (=> b!294720 m!308281))

(check-sat (not start!28960) (not b!294724) (not b!294720) (not b!294722) (not b!294719) (not b!294723))
(check-sat)
(get-model)

(declare-fun b!294773 () Bool)

(declare-fun e!186324 () SeekEntryResult!2180)

(assert (=> b!294773 (= e!186324 Undefined!2180)))

(declare-fun b!294774 () Bool)

(declare-fun c!47484 () Bool)

(declare-fun lt!146175 () (_ BitVec 64))

(assert (=> b!294774 (= c!47484 (= lt!146175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186325 () SeekEntryResult!2180)

(declare-fun e!186326 () SeekEntryResult!2180)

(assert (=> b!294774 (= e!186325 e!186326)))

(declare-fun b!294775 () Bool)

(assert (=> b!294775 (= e!186324 e!186325)))

(declare-fun lt!146174 () SeekEntryResult!2180)

(assert (=> b!294775 (= lt!146175 (select (arr!7066 a!3312) (index!10892 lt!146174)))))

(declare-fun c!47485 () Bool)

(assert (=> b!294775 (= c!47485 (= lt!146175 k0!2524))))

(declare-fun d!66919 () Bool)

(declare-fun lt!146173 () SeekEntryResult!2180)

(assert (=> d!66919 (and (or ((_ is Undefined!2180) lt!146173) (not ((_ is Found!2180) lt!146173)) (and (bvsge (index!10891 lt!146173) #b00000000000000000000000000000000) (bvslt (index!10891 lt!146173) (size!7418 a!3312)))) (or ((_ is Undefined!2180) lt!146173) ((_ is Found!2180) lt!146173) (not ((_ is MissingZero!2180) lt!146173)) (and (bvsge (index!10890 lt!146173) #b00000000000000000000000000000000) (bvslt (index!10890 lt!146173) (size!7418 a!3312)))) (or ((_ is Undefined!2180) lt!146173) ((_ is Found!2180) lt!146173) ((_ is MissingZero!2180) lt!146173) (not ((_ is MissingVacant!2180) lt!146173)) (and (bvsge (index!10893 lt!146173) #b00000000000000000000000000000000) (bvslt (index!10893 lt!146173) (size!7418 a!3312)))) (or ((_ is Undefined!2180) lt!146173) (ite ((_ is Found!2180) lt!146173) (= (select (arr!7066 a!3312) (index!10891 lt!146173)) k0!2524) (ite ((_ is MissingZero!2180) lt!146173) (= (select (arr!7066 a!3312) (index!10890 lt!146173)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2180) lt!146173) (= (select (arr!7066 a!3312) (index!10893 lt!146173)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66919 (= lt!146173 e!186324)))

(declare-fun c!47483 () Bool)

(assert (=> d!66919 (= c!47483 (and ((_ is Intermediate!2180) lt!146174) (undefined!2992 lt!146174)))))

(assert (=> d!66919 (= lt!146174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66919 (validMask!0 mask!3809)))

(assert (=> d!66919 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146173)))

(declare-fun b!294776 () Bool)

(assert (=> b!294776 (= e!186326 (MissingZero!2180 (index!10892 lt!146174)))))

(declare-fun b!294777 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14901 (_ BitVec 32)) SeekEntryResult!2180)

(assert (=> b!294777 (= e!186326 (seekKeyOrZeroReturnVacant!0 (x!29207 lt!146174) (index!10892 lt!146174) (index!10892 lt!146174) k0!2524 a!3312 mask!3809))))

(declare-fun b!294778 () Bool)

(assert (=> b!294778 (= e!186325 (Found!2180 (index!10892 lt!146174)))))

(assert (= (and d!66919 c!47483) b!294773))

(assert (= (and d!66919 (not c!47483)) b!294775))

(assert (= (and b!294775 c!47485) b!294778))

(assert (= (and b!294775 (not c!47485)) b!294774))

(assert (= (and b!294774 c!47484) b!294776))

(assert (= (and b!294774 (not c!47484)) b!294777))

(declare-fun m!308327 () Bool)

(assert (=> b!294775 m!308327))

(declare-fun m!308329 () Bool)

(assert (=> d!66919 m!308329))

(declare-fun m!308331 () Bool)

(assert (=> d!66919 m!308331))

(assert (=> d!66919 m!308275))

(declare-fun m!308333 () Bool)

(assert (=> d!66919 m!308333))

(assert (=> d!66919 m!308275))

(assert (=> d!66919 m!308277))

(declare-fun m!308335 () Bool)

(assert (=> d!66919 m!308335))

(declare-fun m!308337 () Bool)

(assert (=> b!294777 m!308337))

(assert (=> b!294720 d!66919))

(declare-fun b!294815 () Bool)

(declare-fun lt!146186 () SeekEntryResult!2180)

(assert (=> b!294815 (and (bvsge (index!10892 lt!146186) #b00000000000000000000000000000000) (bvslt (index!10892 lt!146186) (size!7418 (array!14902 (store (arr!7066 a!3312) i!1256 k0!2524) (size!7418 a!3312)))))))

(declare-fun res!154966 () Bool)

(assert (=> b!294815 (= res!154966 (= (select (arr!7066 (array!14902 (store (arr!7066 a!3312) i!1256 k0!2524) (size!7418 a!3312))) (index!10892 lt!146186)) k0!2524))))

(declare-fun e!186352 () Bool)

(assert (=> b!294815 (=> res!154966 e!186352)))

(declare-fun e!186353 () Bool)

(assert (=> b!294815 (= e!186353 e!186352)))

(declare-fun b!294816 () Bool)

(declare-fun e!186351 () Bool)

(assert (=> b!294816 (= e!186351 (bvsge (x!29207 lt!146186) #b01111111111111111111111111111110))))

(declare-fun b!294817 () Bool)

(assert (=> b!294817 (and (bvsge (index!10892 lt!146186) #b00000000000000000000000000000000) (bvslt (index!10892 lt!146186) (size!7418 (array!14902 (store (arr!7066 a!3312) i!1256 k0!2524) (size!7418 a!3312)))))))

(declare-fun res!154967 () Bool)

(assert (=> b!294817 (= res!154967 (= (select (arr!7066 (array!14902 (store (arr!7066 a!3312) i!1256 k0!2524) (size!7418 a!3312))) (index!10892 lt!146186)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294817 (=> res!154967 e!186352)))

(declare-fun e!186349 () SeekEntryResult!2180)

(declare-fun b!294819 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294819 (= e!186349 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146136 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14902 (store (arr!7066 a!3312) i!1256 k0!2524) (size!7418 a!3312)) mask!3809))))

(declare-fun b!294820 () Bool)

(declare-fun e!186350 () SeekEntryResult!2180)

(assert (=> b!294820 (= e!186350 e!186349)))

(declare-fun c!47500 () Bool)

(declare-fun lt!146187 () (_ BitVec 64))

(assert (=> b!294820 (= c!47500 (or (= lt!146187 k0!2524) (= (bvadd lt!146187 lt!146187) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294821 () Bool)

(assert (=> b!294821 (= e!186349 (Intermediate!2180 false lt!146136 #b00000000000000000000000000000000))))

(declare-fun b!294818 () Bool)

(assert (=> b!294818 (and (bvsge (index!10892 lt!146186) #b00000000000000000000000000000000) (bvslt (index!10892 lt!146186) (size!7418 (array!14902 (store (arr!7066 a!3312) i!1256 k0!2524) (size!7418 a!3312)))))))

(assert (=> b!294818 (= e!186352 (= (select (arr!7066 (array!14902 (store (arr!7066 a!3312) i!1256 k0!2524) (size!7418 a!3312))) (index!10892 lt!146186)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66921 () Bool)

(assert (=> d!66921 e!186351))

(declare-fun c!47499 () Bool)

(assert (=> d!66921 (= c!47499 (and ((_ is Intermediate!2180) lt!146186) (undefined!2992 lt!146186)))))

(assert (=> d!66921 (= lt!146186 e!186350)))

(declare-fun c!47498 () Bool)

(assert (=> d!66921 (= c!47498 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66921 (= lt!146187 (select (arr!7066 (array!14902 (store (arr!7066 a!3312) i!1256 k0!2524) (size!7418 a!3312))) lt!146136))))

(assert (=> d!66921 (validMask!0 mask!3809)))

(assert (=> d!66921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146136 k0!2524 (array!14902 (store (arr!7066 a!3312) i!1256 k0!2524) (size!7418 a!3312)) mask!3809) lt!146186)))

(declare-fun b!294822 () Bool)

(assert (=> b!294822 (= e!186350 (Intermediate!2180 true lt!146136 #b00000000000000000000000000000000))))

(declare-fun b!294823 () Bool)

(assert (=> b!294823 (= e!186351 e!186353)))

(declare-fun res!154968 () Bool)

(assert (=> b!294823 (= res!154968 (and ((_ is Intermediate!2180) lt!146186) (not (undefined!2992 lt!146186)) (bvslt (x!29207 lt!146186) #b01111111111111111111111111111110) (bvsge (x!29207 lt!146186) #b00000000000000000000000000000000) (bvsge (x!29207 lt!146186) #b00000000000000000000000000000000)))))

(assert (=> b!294823 (=> (not res!154968) (not e!186353))))

(assert (= (and d!66921 c!47498) b!294822))

(assert (= (and d!66921 (not c!47498)) b!294820))

(assert (= (and b!294820 c!47500) b!294821))

(assert (= (and b!294820 (not c!47500)) b!294819))

(assert (= (and d!66921 c!47499) b!294816))

(assert (= (and d!66921 (not c!47499)) b!294823))

(assert (= (and b!294823 res!154968) b!294815))

(assert (= (and b!294815 (not res!154966)) b!294817))

(assert (= (and b!294817 (not res!154967)) b!294818))

(declare-fun m!308343 () Bool)

(assert (=> b!294815 m!308343))

(declare-fun m!308345 () Bool)

(assert (=> b!294819 m!308345))

(assert (=> b!294819 m!308345))

(declare-fun m!308347 () Bool)

(assert (=> b!294819 m!308347))

(assert (=> b!294817 m!308343))

(assert (=> b!294818 m!308343))

(declare-fun m!308349 () Bool)

(assert (=> d!66921 m!308349))

(assert (=> d!66921 m!308277))

(assert (=> b!294724 d!66921))

(declare-fun b!294824 () Bool)

(declare-fun lt!146188 () SeekEntryResult!2180)

(assert (=> b!294824 (and (bvsge (index!10892 lt!146188) #b00000000000000000000000000000000) (bvslt (index!10892 lt!146188) (size!7418 a!3312)))))

(declare-fun res!154969 () Bool)

(assert (=> b!294824 (= res!154969 (= (select (arr!7066 a!3312) (index!10892 lt!146188)) k0!2524))))

(declare-fun e!186357 () Bool)

(assert (=> b!294824 (=> res!154969 e!186357)))

(declare-fun e!186358 () Bool)

(assert (=> b!294824 (= e!186358 e!186357)))

(declare-fun b!294825 () Bool)

(declare-fun e!186356 () Bool)

(assert (=> b!294825 (= e!186356 (bvsge (x!29207 lt!146188) #b01111111111111111111111111111110))))

(declare-fun b!294826 () Bool)

(assert (=> b!294826 (and (bvsge (index!10892 lt!146188) #b00000000000000000000000000000000) (bvslt (index!10892 lt!146188) (size!7418 a!3312)))))

(declare-fun res!154970 () Bool)

(assert (=> b!294826 (= res!154970 (= (select (arr!7066 a!3312) (index!10892 lt!146188)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294826 (=> res!154970 e!186357)))

(declare-fun e!186354 () SeekEntryResult!2180)

(declare-fun b!294828 () Bool)

(assert (=> b!294828 (= e!186354 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146136 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!294829 () Bool)

(declare-fun e!186355 () SeekEntryResult!2180)

(assert (=> b!294829 (= e!186355 e!186354)))

(declare-fun c!47503 () Bool)

(declare-fun lt!146189 () (_ BitVec 64))

(assert (=> b!294829 (= c!47503 (or (= lt!146189 k0!2524) (= (bvadd lt!146189 lt!146189) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294830 () Bool)

(assert (=> b!294830 (= e!186354 (Intermediate!2180 false lt!146136 #b00000000000000000000000000000000))))

(declare-fun b!294827 () Bool)

(assert (=> b!294827 (and (bvsge (index!10892 lt!146188) #b00000000000000000000000000000000) (bvslt (index!10892 lt!146188) (size!7418 a!3312)))))

(assert (=> b!294827 (= e!186357 (= (select (arr!7066 a!3312) (index!10892 lt!146188)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66931 () Bool)

(assert (=> d!66931 e!186356))

(declare-fun c!47502 () Bool)

(assert (=> d!66931 (= c!47502 (and ((_ is Intermediate!2180) lt!146188) (undefined!2992 lt!146188)))))

(assert (=> d!66931 (= lt!146188 e!186355)))

(declare-fun c!47501 () Bool)

(assert (=> d!66931 (= c!47501 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66931 (= lt!146189 (select (arr!7066 a!3312) lt!146136))))

(assert (=> d!66931 (validMask!0 mask!3809)))

(assert (=> d!66931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146136 k0!2524 a!3312 mask!3809) lt!146188)))

(declare-fun b!294831 () Bool)

(assert (=> b!294831 (= e!186355 (Intermediate!2180 true lt!146136 #b00000000000000000000000000000000))))

(declare-fun b!294832 () Bool)

(assert (=> b!294832 (= e!186356 e!186358)))

(declare-fun res!154971 () Bool)

(assert (=> b!294832 (= res!154971 (and ((_ is Intermediate!2180) lt!146188) (not (undefined!2992 lt!146188)) (bvslt (x!29207 lt!146188) #b01111111111111111111111111111110) (bvsge (x!29207 lt!146188) #b00000000000000000000000000000000) (bvsge (x!29207 lt!146188) #b00000000000000000000000000000000)))))

(assert (=> b!294832 (=> (not res!154971) (not e!186358))))

(assert (= (and d!66931 c!47501) b!294831))

(assert (= (and d!66931 (not c!47501)) b!294829))

(assert (= (and b!294829 c!47503) b!294830))

(assert (= (and b!294829 (not c!47503)) b!294828))

(assert (= (and d!66931 c!47502) b!294825))

(assert (= (and d!66931 (not c!47502)) b!294832))

(assert (= (and b!294832 res!154971) b!294824))

(assert (= (and b!294824 (not res!154969)) b!294826))

(assert (= (and b!294826 (not res!154970)) b!294827))

(declare-fun m!308351 () Bool)

(assert (=> b!294824 m!308351))

(assert (=> b!294828 m!308345))

(assert (=> b!294828 m!308345))

(declare-fun m!308353 () Bool)

(assert (=> b!294828 m!308353))

(assert (=> b!294826 m!308351))

(assert (=> b!294827 m!308351))

(declare-fun m!308355 () Bool)

(assert (=> d!66931 m!308355))

(assert (=> d!66931 m!308277))

(assert (=> b!294724 d!66931))

(declare-fun d!66933 () Bool)

(declare-fun lt!146204 () (_ BitVec 32))

(declare-fun lt!146203 () (_ BitVec 32))

(assert (=> d!66933 (= lt!146204 (bvmul (bvxor lt!146203 (bvlshr lt!146203 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66933 (= lt!146203 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66933 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154974 (let ((h!5195 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29211 (bvmul (bvxor h!5195 (bvlshr h!5195 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29211 (bvlshr x!29211 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154974 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154974 #b00000000000000000000000000000000))))))

(assert (=> d!66933 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146204 (bvlshr lt!146204 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294724 d!66933))

(declare-fun d!66937 () Bool)

(declare-fun res!154983 () Bool)

(declare-fun e!186375 () Bool)

(assert (=> d!66937 (=> res!154983 e!186375)))

(assert (=> d!66937 (= res!154983 (= (select (arr!7066 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66937 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186375)))

(declare-fun b!294855 () Bool)

(declare-fun e!186376 () Bool)

(assert (=> b!294855 (= e!186375 e!186376)))

(declare-fun res!154984 () Bool)

(assert (=> b!294855 (=> (not res!154984) (not e!186376))))

(assert (=> b!294855 (= res!154984 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7418 a!3312)))))

(declare-fun b!294856 () Bool)

(assert (=> b!294856 (= e!186376 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66937 (not res!154983)) b!294855))

(assert (= (and b!294855 res!154984) b!294856))

(declare-fun m!308379 () Bool)

(assert (=> d!66937 m!308379))

(declare-fun m!308381 () Bool)

(assert (=> b!294856 m!308381))

(assert (=> b!294719 d!66937))

(declare-fun d!66941 () Bool)

(assert (=> d!66941 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28960 d!66941))

(declare-fun d!66945 () Bool)

(assert (=> d!66945 (= (array_inv!5016 a!3312) (bvsge (size!7418 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28960 d!66945))

(declare-fun d!66947 () Bool)

(assert (=> d!66947 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294723 d!66947))

(declare-fun d!66949 () Bool)

(declare-fun res!155001 () Bool)

(declare-fun e!186403 () Bool)

(assert (=> d!66949 (=> res!155001 e!186403)))

(assert (=> d!66949 (= res!155001 (bvsge #b00000000000000000000000000000000 (size!7418 a!3312)))))

(assert (=> d!66949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186403)))

(declare-fun b!294895 () Bool)

(declare-fun e!186402 () Bool)

(assert (=> b!294895 (= e!186403 e!186402)))

(declare-fun c!47521 () Bool)

(assert (=> b!294895 (= c!47521 (validKeyInArray!0 (select (arr!7066 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294896 () Bool)

(declare-fun call!25705 () Bool)

(assert (=> b!294896 (= e!186402 call!25705)))

(declare-fun b!294897 () Bool)

(declare-fun e!186404 () Bool)

(assert (=> b!294897 (= e!186404 call!25705)))

(declare-fun b!294898 () Bool)

(assert (=> b!294898 (= e!186402 e!186404)))

(declare-fun lt!146227 () (_ BitVec 64))

(assert (=> b!294898 (= lt!146227 (select (arr!7066 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9176 0))(
  ( (Unit!9177) )
))
(declare-fun lt!146228 () Unit!9176)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14901 (_ BitVec 64) (_ BitVec 32)) Unit!9176)

(assert (=> b!294898 (= lt!146228 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146227 #b00000000000000000000000000000000))))

(assert (=> b!294898 (arrayContainsKey!0 a!3312 lt!146227 #b00000000000000000000000000000000)))

(declare-fun lt!146229 () Unit!9176)

(assert (=> b!294898 (= lt!146229 lt!146228)))

(declare-fun res!155002 () Bool)

(assert (=> b!294898 (= res!155002 (= (seekEntryOrOpen!0 (select (arr!7066 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2180 #b00000000000000000000000000000000)))))

(assert (=> b!294898 (=> (not res!155002) (not e!186404))))

(declare-fun bm!25702 () Bool)

(assert (=> bm!25702 (= call!25705 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66949 (not res!155001)) b!294895))

(assert (= (and b!294895 c!47521) b!294898))

(assert (= (and b!294895 (not c!47521)) b!294896))

(assert (= (and b!294898 res!155002) b!294897))

(assert (= (or b!294897 b!294896) bm!25702))

(assert (=> b!294895 m!308379))

(assert (=> b!294895 m!308379))

(declare-fun m!308395 () Bool)

(assert (=> b!294895 m!308395))

(assert (=> b!294898 m!308379))

(declare-fun m!308397 () Bool)

(assert (=> b!294898 m!308397))

(declare-fun m!308399 () Bool)

(assert (=> b!294898 m!308399))

(assert (=> b!294898 m!308379))

(declare-fun m!308401 () Bool)

(assert (=> b!294898 m!308401))

(declare-fun m!308403 () Bool)

(assert (=> bm!25702 m!308403))

(assert (=> b!294722 d!66949))

(check-sat (not b!294819) (not b!294895) (not d!66921) (not b!294856) (not b!294828) (not bm!25702) (not b!294777) (not d!66931) (not d!66919) (not b!294898))
(check-sat)
