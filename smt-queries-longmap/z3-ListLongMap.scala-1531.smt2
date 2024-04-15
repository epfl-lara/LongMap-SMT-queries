; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29006 () Bool)

(assert start!29006)

(declare-fun lt!145985 () Bool)

(declare-fun b!294677 () Bool)

(declare-fun e!186265 () Bool)

(declare-datatypes ((array!14902 0))(
  ( (array!14903 (arr!7065 (Array (_ BitVec 32) (_ BitVec 64))) (size!7418 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14902)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2213 0))(
  ( (MissingZero!2213 (index!11022 (_ BitVec 32))) (Found!2213 (index!11023 (_ BitVec 32))) (Intermediate!2213 (undefined!3025 Bool) (index!11024 (_ BitVec 32)) (x!29249 (_ BitVec 32))) (Undefined!2213) (MissingVacant!2213 (index!11025 (_ BitVec 32))) )
))
(declare-fun lt!145986 () SeekEntryResult!2213)

(get-info :version)

(assert (=> b!294677 (= e!186265 (and lt!145985 (let ((bdg!6247 (not ((_ is Intermediate!2213) lt!145986)))) (and (or bdg!6247 (not (undefined!3025 lt!145986))) (or bdg!6247 (not (= (select (arr!7065 a!3312) (index!11024 lt!145986)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6247 (not (= (select (arr!7065 a!3312) (index!11024 lt!145986)) k0!2524))) (not bdg!6247) (not (= (select (arr!7065 a!3312) (index!11024 lt!145986)) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!145988 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145989 () SeekEntryResult!2213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14902 (_ BitVec 32)) SeekEntryResult!2213)

(assert (=> b!294677 (= lt!145989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145988 k0!2524 (array!14903 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7418 a!3312)) mask!3809))))

(assert (=> b!294677 (= lt!145986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145988 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294677 (= lt!145988 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!294678 () Bool)

(declare-fun e!186264 () Bool)

(assert (=> b!294678 (= e!186264 e!186265)))

(declare-fun res!154896 () Bool)

(assert (=> b!294678 (=> (not res!154896) (not e!186265))))

(declare-fun lt!145987 () SeekEntryResult!2213)

(assert (=> b!294678 (= res!154896 (or lt!145985 (= lt!145987 (MissingVacant!2213 i!1256))))))

(assert (=> b!294678 (= lt!145985 (= lt!145987 (MissingZero!2213 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14902 (_ BitVec 32)) SeekEntryResult!2213)

(assert (=> b!294678 (= lt!145987 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!294679 () Bool)

(declare-fun res!154895 () Bool)

(assert (=> b!294679 (=> (not res!154895) (not e!186265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14902 (_ BitVec 32)) Bool)

(assert (=> b!294679 (= res!154895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294680 () Bool)

(declare-fun res!154899 () Bool)

(assert (=> b!294680 (=> (not res!154899) (not e!186264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294680 (= res!154899 (validKeyInArray!0 k0!2524))))

(declare-fun res!154898 () Bool)

(assert (=> start!29006 (=> (not res!154898) (not e!186264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29006 (= res!154898 (validMask!0 mask!3809))))

(assert (=> start!29006 e!186264))

(assert (=> start!29006 true))

(declare-fun array_inv!5037 (array!14902) Bool)

(assert (=> start!29006 (array_inv!5037 a!3312)))

(declare-fun b!294681 () Bool)

(declare-fun res!154897 () Bool)

(assert (=> b!294681 (=> (not res!154897) (not e!186264))))

(declare-fun arrayContainsKey!0 (array!14902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294681 (= res!154897 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294682 () Bool)

(declare-fun res!154900 () Bool)

(assert (=> b!294682 (=> (not res!154900) (not e!186264))))

(assert (=> b!294682 (= res!154900 (and (= (size!7418 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7418 a!3312))))))

(assert (= (and start!29006 res!154898) b!294682))

(assert (= (and b!294682 res!154900) b!294680))

(assert (= (and b!294680 res!154899) b!294681))

(assert (= (and b!294681 res!154897) b!294678))

(assert (= (and b!294678 res!154896) b!294679))

(assert (= (and b!294679 res!154895) b!294677))

(declare-fun m!307521 () Bool)

(assert (=> start!29006 m!307521))

(declare-fun m!307523 () Bool)

(assert (=> start!29006 m!307523))

(declare-fun m!307525 () Bool)

(assert (=> b!294679 m!307525))

(declare-fun m!307527 () Bool)

(assert (=> b!294681 m!307527))

(declare-fun m!307529 () Bool)

(assert (=> b!294678 m!307529))

(declare-fun m!307531 () Bool)

(assert (=> b!294677 m!307531))

(declare-fun m!307533 () Bool)

(assert (=> b!294677 m!307533))

(declare-fun m!307535 () Bool)

(assert (=> b!294677 m!307535))

(declare-fun m!307537 () Bool)

(assert (=> b!294677 m!307537))

(declare-fun m!307539 () Bool)

(assert (=> b!294677 m!307539))

(declare-fun m!307541 () Bool)

(assert (=> b!294680 m!307541))

(check-sat (not b!294677) (not start!29006) (not b!294679) (not b!294678) (not b!294681) (not b!294680))
(check-sat)
(get-model)

(declare-fun d!66713 () Bool)

(assert (=> d!66713 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294680 d!66713))

(declare-fun b!294727 () Bool)

(declare-fun e!186291 () Bool)

(declare-fun e!186290 () Bool)

(assert (=> b!294727 (= e!186291 e!186290)))

(declare-fun lt!146026 () (_ BitVec 64))

(assert (=> b!294727 (= lt!146026 (select (arr!7065 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9166 0))(
  ( (Unit!9167) )
))
(declare-fun lt!146028 () Unit!9166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14902 (_ BitVec 64) (_ BitVec 32)) Unit!9166)

(assert (=> b!294727 (= lt!146028 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146026 #b00000000000000000000000000000000))))

(assert (=> b!294727 (arrayContainsKey!0 a!3312 lt!146026 #b00000000000000000000000000000000)))

(declare-fun lt!146027 () Unit!9166)

(assert (=> b!294727 (= lt!146027 lt!146028)))

(declare-fun res!154941 () Bool)

(assert (=> b!294727 (= res!154941 (= (seekEntryOrOpen!0 (select (arr!7065 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2213 #b00000000000000000000000000000000)))))

(assert (=> b!294727 (=> (not res!154941) (not e!186290))))

(declare-fun b!294728 () Bool)

(declare-fun call!25694 () Bool)

(assert (=> b!294728 (= e!186290 call!25694)))

(declare-fun b!294729 () Bool)

(declare-fun e!186292 () Bool)

(assert (=> b!294729 (= e!186292 e!186291)))

(declare-fun c!47468 () Bool)

(assert (=> b!294729 (= c!47468 (validKeyInArray!0 (select (arr!7065 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294730 () Bool)

(assert (=> b!294730 (= e!186291 call!25694)))

(declare-fun bm!25691 () Bool)

(assert (=> bm!25691 (= call!25694 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66715 () Bool)

(declare-fun res!154942 () Bool)

(assert (=> d!66715 (=> res!154942 e!186292)))

(assert (=> d!66715 (= res!154942 (bvsge #b00000000000000000000000000000000 (size!7418 a!3312)))))

(assert (=> d!66715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186292)))

(assert (= (and d!66715 (not res!154942)) b!294729))

(assert (= (and b!294729 c!47468) b!294727))

(assert (= (and b!294729 (not c!47468)) b!294730))

(assert (= (and b!294727 res!154941) b!294728))

(assert (= (or b!294728 b!294730) bm!25691))

(declare-fun m!307587 () Bool)

(assert (=> b!294727 m!307587))

(declare-fun m!307589 () Bool)

(assert (=> b!294727 m!307589))

(declare-fun m!307591 () Bool)

(assert (=> b!294727 m!307591))

(assert (=> b!294727 m!307587))

(declare-fun m!307593 () Bool)

(assert (=> b!294727 m!307593))

(assert (=> b!294729 m!307587))

(assert (=> b!294729 m!307587))

(declare-fun m!307595 () Bool)

(assert (=> b!294729 m!307595))

(declare-fun m!307597 () Bool)

(assert (=> bm!25691 m!307597))

(assert (=> b!294679 d!66715))

(declare-fun b!294761 () Bool)

(declare-fun e!186310 () SeekEntryResult!2213)

(declare-fun e!186309 () SeekEntryResult!2213)

(assert (=> b!294761 (= e!186310 e!186309)))

(declare-fun lt!146045 () (_ BitVec 64))

(declare-fun lt!146046 () SeekEntryResult!2213)

(assert (=> b!294761 (= lt!146045 (select (arr!7065 a!3312) (index!11024 lt!146046)))))

(declare-fun c!47485 () Bool)

(assert (=> b!294761 (= c!47485 (= lt!146045 k0!2524))))

(declare-fun b!294762 () Bool)

(declare-fun e!186308 () SeekEntryResult!2213)

(assert (=> b!294762 (= e!186308 (MissingZero!2213 (index!11024 lt!146046)))))

(declare-fun b!294763 () Bool)

(declare-fun c!47486 () Bool)

(assert (=> b!294763 (= c!47486 (= lt!146045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294763 (= e!186309 e!186308)))

(declare-fun b!294764 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14902 (_ BitVec 32)) SeekEntryResult!2213)

(assert (=> b!294764 (= e!186308 (seekKeyOrZeroReturnVacant!0 (x!29249 lt!146046) (index!11024 lt!146046) (index!11024 lt!146046) k0!2524 a!3312 mask!3809))))

(declare-fun b!294765 () Bool)

(assert (=> b!294765 (= e!186310 Undefined!2213)))

(declare-fun d!66717 () Bool)

(declare-fun lt!146044 () SeekEntryResult!2213)

(assert (=> d!66717 (and (or ((_ is Undefined!2213) lt!146044) (not ((_ is Found!2213) lt!146044)) (and (bvsge (index!11023 lt!146044) #b00000000000000000000000000000000) (bvslt (index!11023 lt!146044) (size!7418 a!3312)))) (or ((_ is Undefined!2213) lt!146044) ((_ is Found!2213) lt!146044) (not ((_ is MissingZero!2213) lt!146044)) (and (bvsge (index!11022 lt!146044) #b00000000000000000000000000000000) (bvslt (index!11022 lt!146044) (size!7418 a!3312)))) (or ((_ is Undefined!2213) lt!146044) ((_ is Found!2213) lt!146044) ((_ is MissingZero!2213) lt!146044) (not ((_ is MissingVacant!2213) lt!146044)) (and (bvsge (index!11025 lt!146044) #b00000000000000000000000000000000) (bvslt (index!11025 lt!146044) (size!7418 a!3312)))) (or ((_ is Undefined!2213) lt!146044) (ite ((_ is Found!2213) lt!146044) (= (select (arr!7065 a!3312) (index!11023 lt!146044)) k0!2524) (ite ((_ is MissingZero!2213) lt!146044) (= (select (arr!7065 a!3312) (index!11022 lt!146044)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2213) lt!146044) (= (select (arr!7065 a!3312) (index!11025 lt!146044)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66717 (= lt!146044 e!186310)))

(declare-fun c!47484 () Bool)

(assert (=> d!66717 (= c!47484 (and ((_ is Intermediate!2213) lt!146046) (undefined!3025 lt!146046)))))

(assert (=> d!66717 (= lt!146046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66717 (validMask!0 mask!3809)))

(assert (=> d!66717 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146044)))

(declare-fun b!294766 () Bool)

(assert (=> b!294766 (= e!186309 (Found!2213 (index!11024 lt!146046)))))

(assert (= (and d!66717 c!47484) b!294765))

(assert (= (and d!66717 (not c!47484)) b!294761))

(assert (= (and b!294761 c!47485) b!294766))

(assert (= (and b!294761 (not c!47485)) b!294763))

(assert (= (and b!294763 c!47486) b!294762))

(assert (= (and b!294763 (not c!47486)) b!294764))

(declare-fun m!307611 () Bool)

(assert (=> b!294761 m!307611))

(declare-fun m!307613 () Bool)

(assert (=> b!294764 m!307613))

(declare-fun m!307615 () Bool)

(assert (=> d!66717 m!307615))

(assert (=> d!66717 m!307539))

(declare-fun m!307617 () Bool)

(assert (=> d!66717 m!307617))

(assert (=> d!66717 m!307539))

(assert (=> d!66717 m!307521))

(declare-fun m!307619 () Bool)

(assert (=> d!66717 m!307619))

(declare-fun m!307621 () Bool)

(assert (=> d!66717 m!307621))

(assert (=> b!294678 d!66717))

(declare-fun b!294815 () Bool)

(declare-fun e!186345 () SeekEntryResult!2213)

(declare-fun e!186343 () SeekEntryResult!2213)

(assert (=> b!294815 (= e!186345 e!186343)))

(declare-fun c!47504 () Bool)

(declare-fun lt!146066 () (_ BitVec 64))

(assert (=> b!294815 (= c!47504 (or (= lt!146066 k0!2524) (= (bvadd lt!146066 lt!146066) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!146067 () SeekEntryResult!2213)

(declare-fun b!294816 () Bool)

(assert (=> b!294816 (and (bvsge (index!11024 lt!146067) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146067) (size!7418 (array!14903 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7418 a!3312)))))))

(declare-fun res!154963 () Bool)

(assert (=> b!294816 (= res!154963 (= (select (arr!7065 (array!14903 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7418 a!3312))) (index!11024 lt!146067)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186342 () Bool)

(assert (=> b!294816 (=> res!154963 e!186342)))

(declare-fun b!294817 () Bool)

(declare-fun e!186344 () Bool)

(declare-fun e!186346 () Bool)

(assert (=> b!294817 (= e!186344 e!186346)))

(declare-fun res!154962 () Bool)

(assert (=> b!294817 (= res!154962 (and ((_ is Intermediate!2213) lt!146067) (not (undefined!3025 lt!146067)) (bvslt (x!29249 lt!146067) #b01111111111111111111111111111110) (bvsge (x!29249 lt!146067) #b00000000000000000000000000000000) (bvsge (x!29249 lt!146067) #b00000000000000000000000000000000)))))

(assert (=> b!294817 (=> (not res!154962) (not e!186346))))

(declare-fun b!294818 () Bool)

(assert (=> b!294818 (and (bvsge (index!11024 lt!146067) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146067) (size!7418 (array!14903 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7418 a!3312)))))))

(declare-fun res!154961 () Bool)

(assert (=> b!294818 (= res!154961 (= (select (arr!7065 (array!14903 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7418 a!3312))) (index!11024 lt!146067)) k0!2524))))

(assert (=> b!294818 (=> res!154961 e!186342)))

(assert (=> b!294818 (= e!186346 e!186342)))

(declare-fun d!66727 () Bool)

(assert (=> d!66727 e!186344))

(declare-fun c!47503 () Bool)

(assert (=> d!66727 (= c!47503 (and ((_ is Intermediate!2213) lt!146067) (undefined!3025 lt!146067)))))

(assert (=> d!66727 (= lt!146067 e!186345)))

(declare-fun c!47502 () Bool)

(assert (=> d!66727 (= c!47502 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66727 (= lt!146066 (select (arr!7065 (array!14903 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7418 a!3312))) lt!145988))))

(assert (=> d!66727 (validMask!0 mask!3809)))

(assert (=> d!66727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145988 k0!2524 (array!14903 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7418 a!3312)) mask!3809) lt!146067)))

(declare-fun b!294819 () Bool)

(assert (=> b!294819 (and (bvsge (index!11024 lt!146067) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146067) (size!7418 (array!14903 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7418 a!3312)))))))

(assert (=> b!294819 (= e!186342 (= (select (arr!7065 (array!14903 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7418 a!3312))) (index!11024 lt!146067)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294820 () Bool)

(assert (=> b!294820 (= e!186344 (bvsge (x!29249 lt!146067) #b01111111111111111111111111111110))))

(declare-fun b!294821 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294821 (= e!186343 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145988 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14903 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7418 a!3312)) mask!3809))))

(declare-fun b!294822 () Bool)

(assert (=> b!294822 (= e!186343 (Intermediate!2213 false lt!145988 #b00000000000000000000000000000000))))

(declare-fun b!294823 () Bool)

(assert (=> b!294823 (= e!186345 (Intermediate!2213 true lt!145988 #b00000000000000000000000000000000))))

(assert (= (and d!66727 c!47502) b!294823))

(assert (= (and d!66727 (not c!47502)) b!294815))

(assert (= (and b!294815 c!47504) b!294822))

(assert (= (and b!294815 (not c!47504)) b!294821))

(assert (= (and d!66727 c!47503) b!294820))

(assert (= (and d!66727 (not c!47503)) b!294817))

(assert (= (and b!294817 res!154962) b!294818))

(assert (= (and b!294818 (not res!154961)) b!294816))

(assert (= (and b!294816 (not res!154963)) b!294819))

(declare-fun m!307637 () Bool)

(assert (=> d!66727 m!307637))

(assert (=> d!66727 m!307521))

(declare-fun m!307639 () Bool)

(assert (=> b!294818 m!307639))

(assert (=> b!294819 m!307639))

(declare-fun m!307641 () Bool)

(assert (=> b!294821 m!307641))

(assert (=> b!294821 m!307641))

(declare-fun m!307643 () Bool)

(assert (=> b!294821 m!307643))

(assert (=> b!294816 m!307639))

(assert (=> b!294677 d!66727))

(declare-fun b!294830 () Bool)

(declare-fun e!186353 () SeekEntryResult!2213)

(declare-fun e!186351 () SeekEntryResult!2213)

(assert (=> b!294830 (= e!186353 e!186351)))

(declare-fun c!47510 () Bool)

(declare-fun lt!146071 () (_ BitVec 64))

(assert (=> b!294830 (= c!47510 (or (= lt!146071 k0!2524) (= (bvadd lt!146071 lt!146071) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294831 () Bool)

(declare-fun lt!146072 () SeekEntryResult!2213)

(assert (=> b!294831 (and (bvsge (index!11024 lt!146072) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146072) (size!7418 a!3312)))))

(declare-fun res!154966 () Bool)

(assert (=> b!294831 (= res!154966 (= (select (arr!7065 a!3312) (index!11024 lt!146072)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186350 () Bool)

(assert (=> b!294831 (=> res!154966 e!186350)))

(declare-fun b!294832 () Bool)

(declare-fun e!186352 () Bool)

(declare-fun e!186354 () Bool)

(assert (=> b!294832 (= e!186352 e!186354)))

(declare-fun res!154965 () Bool)

(assert (=> b!294832 (= res!154965 (and ((_ is Intermediate!2213) lt!146072) (not (undefined!3025 lt!146072)) (bvslt (x!29249 lt!146072) #b01111111111111111111111111111110) (bvsge (x!29249 lt!146072) #b00000000000000000000000000000000) (bvsge (x!29249 lt!146072) #b00000000000000000000000000000000)))))

(assert (=> b!294832 (=> (not res!154965) (not e!186354))))

(declare-fun b!294833 () Bool)

(assert (=> b!294833 (and (bvsge (index!11024 lt!146072) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146072) (size!7418 a!3312)))))

(declare-fun res!154964 () Bool)

(assert (=> b!294833 (= res!154964 (= (select (arr!7065 a!3312) (index!11024 lt!146072)) k0!2524))))

(assert (=> b!294833 (=> res!154964 e!186350)))

(assert (=> b!294833 (= e!186354 e!186350)))

(declare-fun d!66737 () Bool)

(assert (=> d!66737 e!186352))

(declare-fun c!47509 () Bool)

(assert (=> d!66737 (= c!47509 (and ((_ is Intermediate!2213) lt!146072) (undefined!3025 lt!146072)))))

(assert (=> d!66737 (= lt!146072 e!186353)))

(declare-fun c!47508 () Bool)

(assert (=> d!66737 (= c!47508 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66737 (= lt!146071 (select (arr!7065 a!3312) lt!145988))))

(assert (=> d!66737 (validMask!0 mask!3809)))

(assert (=> d!66737 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145988 k0!2524 a!3312 mask!3809) lt!146072)))

(declare-fun b!294834 () Bool)

(assert (=> b!294834 (and (bvsge (index!11024 lt!146072) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146072) (size!7418 a!3312)))))

(assert (=> b!294834 (= e!186350 (= (select (arr!7065 a!3312) (index!11024 lt!146072)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294835 () Bool)

(assert (=> b!294835 (= e!186352 (bvsge (x!29249 lt!146072) #b01111111111111111111111111111110))))

(declare-fun b!294836 () Bool)

(assert (=> b!294836 (= e!186351 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145988 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!294837 () Bool)

(assert (=> b!294837 (= e!186351 (Intermediate!2213 false lt!145988 #b00000000000000000000000000000000))))

(declare-fun b!294838 () Bool)

(assert (=> b!294838 (= e!186353 (Intermediate!2213 true lt!145988 #b00000000000000000000000000000000))))

(assert (= (and d!66737 c!47508) b!294838))

(assert (= (and d!66737 (not c!47508)) b!294830))

(assert (= (and b!294830 c!47510) b!294837))

(assert (= (and b!294830 (not c!47510)) b!294836))

(assert (= (and d!66737 c!47509) b!294835))

(assert (= (and d!66737 (not c!47509)) b!294832))

(assert (= (and b!294832 res!154965) b!294833))

(assert (= (and b!294833 (not res!154964)) b!294831))

(assert (= (and b!294831 (not res!154966)) b!294834))

(declare-fun m!307653 () Bool)

(assert (=> d!66737 m!307653))

(assert (=> d!66737 m!307521))

(declare-fun m!307657 () Bool)

(assert (=> b!294833 m!307657))

(assert (=> b!294834 m!307657))

(assert (=> b!294836 m!307641))

(assert (=> b!294836 m!307641))

(declare-fun m!307661 () Bool)

(assert (=> b!294836 m!307661))

(assert (=> b!294831 m!307657))

(assert (=> b!294677 d!66737))

(declare-fun d!66741 () Bool)

(declare-fun lt!146082 () (_ BitVec 32))

(declare-fun lt!146081 () (_ BitVec 32))

(assert (=> d!66741 (= lt!146082 (bvmul (bvxor lt!146081 (bvlshr lt!146081 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66741 (= lt!146081 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66741 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154967 (let ((h!5254 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29253 (bvmul (bvxor h!5254 (bvlshr h!5254 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29253 (bvlshr x!29253 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154967 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154967 #b00000000000000000000000000000000))))))

(assert (=> d!66741 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146082 (bvlshr lt!146082 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294677 d!66741))

(declare-fun d!66743 () Bool)

(declare-fun res!154978 () Bool)

(declare-fun e!186369 () Bool)

(assert (=> d!66743 (=> res!154978 e!186369)))

(assert (=> d!66743 (= res!154978 (= (select (arr!7065 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66743 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186369)))

(declare-fun b!294861 () Bool)

(declare-fun e!186370 () Bool)

(assert (=> b!294861 (= e!186369 e!186370)))

(declare-fun res!154979 () Bool)

(assert (=> b!294861 (=> (not res!154979) (not e!186370))))

(assert (=> b!294861 (= res!154979 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7418 a!3312)))))

(declare-fun b!294862 () Bool)

(assert (=> b!294862 (= e!186370 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66743 (not res!154978)) b!294861))

(assert (= (and b!294861 res!154979) b!294862))

(assert (=> d!66743 m!307587))

(declare-fun m!307663 () Bool)

(assert (=> b!294862 m!307663))

(assert (=> b!294681 d!66743))

(declare-fun d!66745 () Bool)

(assert (=> d!66745 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29006 d!66745))

(declare-fun d!66753 () Bool)

(assert (=> d!66753 (= (array_inv!5037 a!3312) (bvsge (size!7418 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29006 d!66753))

(check-sat (not b!294821) (not d!66737) (not b!294862) (not b!294729) (not bm!25691) (not b!294836) (not d!66717) (not d!66727) (not b!294764) (not b!294727))
(check-sat)
