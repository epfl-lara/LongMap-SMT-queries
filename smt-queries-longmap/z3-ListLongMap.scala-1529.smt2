; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28914 () Bool)

(assert start!28914)

(declare-fun e!186113 () Bool)

(declare-fun b!294402 () Bool)

(declare-datatypes ((array!14897 0))(
  ( (array!14898 (arr!7065 (Array (_ BitVec 32) (_ BitVec 64))) (size!7417 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14897)

(declare-datatypes ((SeekEntryResult!2214 0))(
  ( (MissingZero!2214 (index!11026 (_ BitVec 32))) (Found!2214 (index!11027 (_ BitVec 32))) (Intermediate!2214 (undefined!3026 Bool) (index!11028 (_ BitVec 32)) (x!29226 (_ BitVec 32))) (Undefined!2214) (MissingVacant!2214 (index!11029 (_ BitVec 32))) )
))
(declare-fun lt!145940 () SeekEntryResult!2214)

(declare-fun lt!145941 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(get-info :version)

(assert (=> b!294402 (= e!186113 (and lt!145941 (let ((bdg!6235 (not ((_ is Intermediate!2214) lt!145940)))) (and (or bdg!6235 (not (undefined!3026 lt!145940))) (or bdg!6235 (not (= (select (arr!7065 a!3312) (index!11028 lt!145940)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6235) (= (select (arr!7065 a!3312) (index!11028 lt!145940)) k0!2524)))))))

(declare-fun lt!145944 () SeekEntryResult!2214)

(declare-fun lt!145942 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14897 (_ BitVec 32)) SeekEntryResult!2214)

(assert (=> b!294402 (= lt!145944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145942 k0!2524 (array!14898 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7417 a!3312)) mask!3809))))

(assert (=> b!294402 (= lt!145940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145942 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294402 (= lt!145942 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!154776 () Bool)

(declare-fun e!186114 () Bool)

(assert (=> start!28914 (=> (not res!154776) (not e!186114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28914 (= res!154776 (validMask!0 mask!3809))))

(assert (=> start!28914 e!186114))

(assert (=> start!28914 true))

(declare-fun array_inv!5028 (array!14897) Bool)

(assert (=> start!28914 (array_inv!5028 a!3312)))

(declare-fun b!294403 () Bool)

(declare-fun res!154779 () Bool)

(assert (=> b!294403 (=> (not res!154779) (not e!186114))))

(assert (=> b!294403 (= res!154779 (and (= (size!7417 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7417 a!3312))))))

(declare-fun b!294404 () Bool)

(declare-fun res!154777 () Bool)

(assert (=> b!294404 (=> (not res!154777) (not e!186114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294404 (= res!154777 (validKeyInArray!0 k0!2524))))

(declare-fun b!294405 () Bool)

(declare-fun res!154778 () Bool)

(assert (=> b!294405 (=> (not res!154778) (not e!186113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14897 (_ BitVec 32)) Bool)

(assert (=> b!294405 (= res!154778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294406 () Bool)

(declare-fun res!154774 () Bool)

(assert (=> b!294406 (=> (not res!154774) (not e!186114))))

(declare-fun arrayContainsKey!0 (array!14897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294406 (= res!154774 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294407 () Bool)

(assert (=> b!294407 (= e!186114 e!186113)))

(declare-fun res!154775 () Bool)

(assert (=> b!294407 (=> (not res!154775) (not e!186113))))

(declare-fun lt!145943 () SeekEntryResult!2214)

(assert (=> b!294407 (= res!154775 (or lt!145941 (= lt!145943 (MissingVacant!2214 i!1256))))))

(assert (=> b!294407 (= lt!145941 (= lt!145943 (MissingZero!2214 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14897 (_ BitVec 32)) SeekEntryResult!2214)

(assert (=> b!294407 (= lt!145943 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28914 res!154776) b!294403))

(assert (= (and b!294403 res!154779) b!294404))

(assert (= (and b!294404 res!154777) b!294406))

(assert (= (and b!294406 res!154774) b!294407))

(assert (= (and b!294407 res!154775) b!294405))

(assert (= (and b!294405 res!154778) b!294402))

(declare-fun m!307867 () Bool)

(assert (=> b!294402 m!307867))

(declare-fun m!307869 () Bool)

(assert (=> b!294402 m!307869))

(declare-fun m!307871 () Bool)

(assert (=> b!294402 m!307871))

(declare-fun m!307873 () Bool)

(assert (=> b!294402 m!307873))

(declare-fun m!307875 () Bool)

(assert (=> b!294402 m!307875))

(declare-fun m!307877 () Bool)

(assert (=> b!294407 m!307877))

(declare-fun m!307879 () Bool)

(assert (=> b!294406 m!307879))

(declare-fun m!307881 () Bool)

(assert (=> b!294404 m!307881))

(declare-fun m!307883 () Bool)

(assert (=> b!294405 m!307883))

(declare-fun m!307885 () Bool)

(assert (=> start!28914 m!307885))

(declare-fun m!307887 () Bool)

(assert (=> start!28914 m!307887))

(check-sat (not b!294407) (not b!294406) (not b!294405) (not start!28914) (not b!294404) (not b!294402))
(check-sat)
(get-model)

(declare-fun d!66795 () Bool)

(declare-fun res!154802 () Bool)

(declare-fun e!186129 () Bool)

(assert (=> d!66795 (=> res!154802 e!186129)))

(assert (=> d!66795 (= res!154802 (= (select (arr!7065 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66795 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186129)))

(declare-fun b!294430 () Bool)

(declare-fun e!186130 () Bool)

(assert (=> b!294430 (= e!186129 e!186130)))

(declare-fun res!154803 () Bool)

(assert (=> b!294430 (=> (not res!154803) (not e!186130))))

(assert (=> b!294430 (= res!154803 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7417 a!3312)))))

(declare-fun b!294431 () Bool)

(assert (=> b!294431 (= e!186130 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66795 (not res!154802)) b!294430))

(assert (= (and b!294430 res!154803) b!294431))

(declare-fun m!307911 () Bool)

(assert (=> d!66795 m!307911))

(declare-fun m!307913 () Bool)

(assert (=> b!294431 m!307913))

(assert (=> b!294406 d!66795))

(declare-fun d!66797 () Bool)

(assert (=> d!66797 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28914 d!66797))

(declare-fun d!66799 () Bool)

(assert (=> d!66799 (= (array_inv!5028 a!3312) (bvsge (size!7417 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28914 d!66799))

(declare-fun b!294441 () Bool)

(declare-fun e!186138 () Bool)

(declare-fun call!25702 () Bool)

(assert (=> b!294441 (= e!186138 call!25702)))

(declare-fun b!294442 () Bool)

(declare-fun e!186137 () Bool)

(assert (=> b!294442 (= e!186137 e!186138)))

(declare-fun lt!145968 () (_ BitVec 64))

(assert (=> b!294442 (= lt!145968 (select (arr!7065 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9202 0))(
  ( (Unit!9203) )
))
(declare-fun lt!145967 () Unit!9202)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14897 (_ BitVec 64) (_ BitVec 32)) Unit!9202)

(assert (=> b!294442 (= lt!145967 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145968 #b00000000000000000000000000000000))))

(assert (=> b!294442 (arrayContainsKey!0 a!3312 lt!145968 #b00000000000000000000000000000000)))

(declare-fun lt!145966 () Unit!9202)

(assert (=> b!294442 (= lt!145966 lt!145967)))

(declare-fun res!154809 () Bool)

(assert (=> b!294442 (= res!154809 (= (seekEntryOrOpen!0 (select (arr!7065 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2214 #b00000000000000000000000000000000)))))

(assert (=> b!294442 (=> (not res!154809) (not e!186138))))

(declare-fun b!294443 () Bool)

(declare-fun e!186139 () Bool)

(assert (=> b!294443 (= e!186139 e!186137)))

(declare-fun c!47388 () Bool)

(assert (=> b!294443 (= c!47388 (validKeyInArray!0 (select (arr!7065 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25699 () Bool)

(assert (=> bm!25699 (= call!25702 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294440 () Bool)

(assert (=> b!294440 (= e!186137 call!25702)))

(declare-fun d!66801 () Bool)

(declare-fun res!154808 () Bool)

(assert (=> d!66801 (=> res!154808 e!186139)))

(assert (=> d!66801 (= res!154808 (bvsge #b00000000000000000000000000000000 (size!7417 a!3312)))))

(assert (=> d!66801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186139)))

(assert (= (and d!66801 (not res!154808)) b!294443))

(assert (= (and b!294443 c!47388) b!294442))

(assert (= (and b!294443 (not c!47388)) b!294440))

(assert (= (and b!294442 res!154809) b!294441))

(assert (= (or b!294441 b!294440) bm!25699))

(assert (=> b!294442 m!307911))

(declare-fun m!307915 () Bool)

(assert (=> b!294442 m!307915))

(declare-fun m!307917 () Bool)

(assert (=> b!294442 m!307917))

(assert (=> b!294442 m!307911))

(declare-fun m!307919 () Bool)

(assert (=> b!294442 m!307919))

(assert (=> b!294443 m!307911))

(assert (=> b!294443 m!307911))

(declare-fun m!307921 () Bool)

(assert (=> b!294443 m!307921))

(declare-fun m!307923 () Bool)

(assert (=> bm!25699 m!307923))

(assert (=> b!294405 d!66801))

(declare-fun d!66807 () Bool)

(assert (=> d!66807 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294404 d!66807))

(declare-fun e!186171 () SeekEntryResult!2214)

(declare-fun b!294492 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294492 (= e!186171 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145942 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14898 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7417 a!3312)) mask!3809))))

(declare-fun lt!145986 () SeekEntryResult!2214)

(declare-fun b!294493 () Bool)

(assert (=> b!294493 (and (bvsge (index!11028 lt!145986) #b00000000000000000000000000000000) (bvslt (index!11028 lt!145986) (size!7417 (array!14898 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7417 a!3312)))))))

(declare-fun res!154830 () Bool)

(assert (=> b!294493 (= res!154830 (= (select (arr!7065 (array!14898 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7417 a!3312))) (index!11028 lt!145986)) k0!2524))))

(declare-fun e!186173 () Bool)

(assert (=> b!294493 (=> res!154830 e!186173)))

(declare-fun e!186172 () Bool)

(assert (=> b!294493 (= e!186172 e!186173)))

(declare-fun b!294494 () Bool)

(declare-fun e!186170 () Bool)

(assert (=> b!294494 (= e!186170 (bvsge (x!29226 lt!145986) #b01111111111111111111111111111110))))

(declare-fun b!294495 () Bool)

(assert (=> b!294495 (= e!186170 e!186172)))

(declare-fun res!154829 () Bool)

(assert (=> b!294495 (= res!154829 (and ((_ is Intermediate!2214) lt!145986) (not (undefined!3026 lt!145986)) (bvslt (x!29226 lt!145986) #b01111111111111111111111111111110) (bvsge (x!29226 lt!145986) #b00000000000000000000000000000000) (bvsge (x!29226 lt!145986) #b00000000000000000000000000000000)))))

(assert (=> b!294495 (=> (not res!154829) (not e!186172))))

(declare-fun b!294496 () Bool)

(assert (=> b!294496 (= e!186171 (Intermediate!2214 false lt!145942 #b00000000000000000000000000000000))))

(declare-fun b!294497 () Bool)

(declare-fun e!186169 () SeekEntryResult!2214)

(assert (=> b!294497 (= e!186169 e!186171)))

(declare-fun c!47404 () Bool)

(declare-fun lt!145987 () (_ BitVec 64))

(assert (=> b!294497 (= c!47404 (or (= lt!145987 k0!2524) (= (bvadd lt!145987 lt!145987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294498 () Bool)

(assert (=> b!294498 (and (bvsge (index!11028 lt!145986) #b00000000000000000000000000000000) (bvslt (index!11028 lt!145986) (size!7417 (array!14898 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7417 a!3312)))))))

(assert (=> b!294498 (= e!186173 (= (select (arr!7065 (array!14898 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7417 a!3312))) (index!11028 lt!145986)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66809 () Bool)

(assert (=> d!66809 e!186170))

(declare-fun c!47406 () Bool)

(assert (=> d!66809 (= c!47406 (and ((_ is Intermediate!2214) lt!145986) (undefined!3026 lt!145986)))))

(assert (=> d!66809 (= lt!145986 e!186169)))

(declare-fun c!47405 () Bool)

(assert (=> d!66809 (= c!47405 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66809 (= lt!145987 (select (arr!7065 (array!14898 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7417 a!3312))) lt!145942))))

(assert (=> d!66809 (validMask!0 mask!3809)))

(assert (=> d!66809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145942 k0!2524 (array!14898 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7417 a!3312)) mask!3809) lt!145986)))

(declare-fun b!294499 () Bool)

(assert (=> b!294499 (= e!186169 (Intermediate!2214 true lt!145942 #b00000000000000000000000000000000))))

(declare-fun b!294500 () Bool)

(assert (=> b!294500 (and (bvsge (index!11028 lt!145986) #b00000000000000000000000000000000) (bvslt (index!11028 lt!145986) (size!7417 (array!14898 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7417 a!3312)))))))

(declare-fun res!154828 () Bool)

(assert (=> b!294500 (= res!154828 (= (select (arr!7065 (array!14898 (store (arr!7065 a!3312) i!1256 k0!2524) (size!7417 a!3312))) (index!11028 lt!145986)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294500 (=> res!154828 e!186173)))

(assert (= (and d!66809 c!47405) b!294499))

(assert (= (and d!66809 (not c!47405)) b!294497))

(assert (= (and b!294497 c!47404) b!294496))

(assert (= (and b!294497 (not c!47404)) b!294492))

(assert (= (and d!66809 c!47406) b!294494))

(assert (= (and d!66809 (not c!47406)) b!294495))

(assert (= (and b!294495 res!154829) b!294493))

(assert (= (and b!294493 (not res!154830)) b!294500))

(assert (= (and b!294500 (not res!154828)) b!294498))

(declare-fun m!307937 () Bool)

(assert (=> d!66809 m!307937))

(assert (=> d!66809 m!307885))

(declare-fun m!307939 () Bool)

(assert (=> b!294498 m!307939))

(assert (=> b!294500 m!307939))

(assert (=> b!294493 m!307939))

(declare-fun m!307941 () Bool)

(assert (=> b!294492 m!307941))

(assert (=> b!294492 m!307941))

(declare-fun m!307943 () Bool)

(assert (=> b!294492 m!307943))

(assert (=> b!294402 d!66809))

(declare-fun e!186181 () SeekEntryResult!2214)

(declare-fun b!294510 () Bool)

(assert (=> b!294510 (= e!186181 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145942 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!294511 () Bool)

(declare-fun lt!145990 () SeekEntryResult!2214)

(assert (=> b!294511 (and (bvsge (index!11028 lt!145990) #b00000000000000000000000000000000) (bvslt (index!11028 lt!145990) (size!7417 a!3312)))))

(declare-fun res!154836 () Bool)

(assert (=> b!294511 (= res!154836 (= (select (arr!7065 a!3312) (index!11028 lt!145990)) k0!2524))))

(declare-fun e!186183 () Bool)

(assert (=> b!294511 (=> res!154836 e!186183)))

(declare-fun e!186182 () Bool)

(assert (=> b!294511 (= e!186182 e!186183)))

(declare-fun b!294512 () Bool)

(declare-fun e!186180 () Bool)

(assert (=> b!294512 (= e!186180 (bvsge (x!29226 lt!145990) #b01111111111111111111111111111110))))

(declare-fun b!294513 () Bool)

(assert (=> b!294513 (= e!186180 e!186182)))

(declare-fun res!154835 () Bool)

(assert (=> b!294513 (= res!154835 (and ((_ is Intermediate!2214) lt!145990) (not (undefined!3026 lt!145990)) (bvslt (x!29226 lt!145990) #b01111111111111111111111111111110) (bvsge (x!29226 lt!145990) #b00000000000000000000000000000000) (bvsge (x!29226 lt!145990) #b00000000000000000000000000000000)))))

(assert (=> b!294513 (=> (not res!154835) (not e!186182))))

(declare-fun b!294514 () Bool)

(assert (=> b!294514 (= e!186181 (Intermediate!2214 false lt!145942 #b00000000000000000000000000000000))))

(declare-fun b!294515 () Bool)

(declare-fun e!186179 () SeekEntryResult!2214)

(assert (=> b!294515 (= e!186179 e!186181)))

(declare-fun c!47410 () Bool)

(declare-fun lt!145991 () (_ BitVec 64))

(assert (=> b!294515 (= c!47410 (or (= lt!145991 k0!2524) (= (bvadd lt!145991 lt!145991) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294516 () Bool)

(assert (=> b!294516 (and (bvsge (index!11028 lt!145990) #b00000000000000000000000000000000) (bvslt (index!11028 lt!145990) (size!7417 a!3312)))))

(assert (=> b!294516 (= e!186183 (= (select (arr!7065 a!3312) (index!11028 lt!145990)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66823 () Bool)

(assert (=> d!66823 e!186180))

(declare-fun c!47412 () Bool)

(assert (=> d!66823 (= c!47412 (and ((_ is Intermediate!2214) lt!145990) (undefined!3026 lt!145990)))))

(assert (=> d!66823 (= lt!145990 e!186179)))

(declare-fun c!47411 () Bool)

(assert (=> d!66823 (= c!47411 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66823 (= lt!145991 (select (arr!7065 a!3312) lt!145942))))

(assert (=> d!66823 (validMask!0 mask!3809)))

(assert (=> d!66823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145942 k0!2524 a!3312 mask!3809) lt!145990)))

(declare-fun b!294517 () Bool)

(assert (=> b!294517 (= e!186179 (Intermediate!2214 true lt!145942 #b00000000000000000000000000000000))))

(declare-fun b!294518 () Bool)

(assert (=> b!294518 (and (bvsge (index!11028 lt!145990) #b00000000000000000000000000000000) (bvslt (index!11028 lt!145990) (size!7417 a!3312)))))

(declare-fun res!154834 () Bool)

(assert (=> b!294518 (= res!154834 (= (select (arr!7065 a!3312) (index!11028 lt!145990)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294518 (=> res!154834 e!186183)))

(assert (= (and d!66823 c!47411) b!294517))

(assert (= (and d!66823 (not c!47411)) b!294515))

(assert (= (and b!294515 c!47410) b!294514))

(assert (= (and b!294515 (not c!47410)) b!294510))

(assert (= (and d!66823 c!47412) b!294512))

(assert (= (and d!66823 (not c!47412)) b!294513))

(assert (= (and b!294513 res!154835) b!294511))

(assert (= (and b!294511 (not res!154836)) b!294518))

(assert (= (and b!294518 (not res!154834)) b!294516))

(declare-fun m!307949 () Bool)

(assert (=> d!66823 m!307949))

(assert (=> d!66823 m!307885))

(declare-fun m!307953 () Bool)

(assert (=> b!294516 m!307953))

(assert (=> b!294518 m!307953))

(assert (=> b!294511 m!307953))

(assert (=> b!294510 m!307941))

(assert (=> b!294510 m!307941))

(declare-fun m!307957 () Bool)

(assert (=> b!294510 m!307957))

(assert (=> b!294402 d!66823))

(declare-fun d!66827 () Bool)

(declare-fun lt!146005 () (_ BitVec 32))

(declare-fun lt!146004 () (_ BitVec 32))

(assert (=> d!66827 (= lt!146005 (bvmul (bvxor lt!146004 (bvlshr lt!146004 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66827 (= lt!146004 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66827 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154840 (let ((h!5280 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29230 (bvmul (bvxor h!5280 (bvlshr h!5280 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29230 (bvlshr x!29230 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154840 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154840 #b00000000000000000000000000000000))))))

(assert (=> d!66827 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146005 (bvlshr lt!146005 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294402 d!66827))

(declare-fun b!294600 () Bool)

(declare-fun e!186233 () SeekEntryResult!2214)

(declare-fun lt!146034 () SeekEntryResult!2214)

(assert (=> b!294600 (= e!186233 (MissingZero!2214 (index!11028 lt!146034)))))

(declare-fun b!294601 () Bool)

(declare-fun e!186235 () SeekEntryResult!2214)

(assert (=> b!294601 (= e!186235 (Found!2214 (index!11028 lt!146034)))))

(declare-fun b!294602 () Bool)

(declare-fun e!186234 () SeekEntryResult!2214)

(assert (=> b!294602 (= e!186234 Undefined!2214)))

(declare-fun b!294604 () Bool)

(declare-fun c!47441 () Bool)

(declare-fun lt!146033 () (_ BitVec 64))

(assert (=> b!294604 (= c!47441 (= lt!146033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294604 (= e!186235 e!186233)))

(declare-fun b!294605 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14897 (_ BitVec 32)) SeekEntryResult!2214)

(assert (=> b!294605 (= e!186233 (seekKeyOrZeroReturnVacant!0 (x!29226 lt!146034) (index!11028 lt!146034) (index!11028 lt!146034) k0!2524 a!3312 mask!3809))))

(declare-fun d!66831 () Bool)

(declare-fun lt!146032 () SeekEntryResult!2214)

(assert (=> d!66831 (and (or ((_ is Undefined!2214) lt!146032) (not ((_ is Found!2214) lt!146032)) (and (bvsge (index!11027 lt!146032) #b00000000000000000000000000000000) (bvslt (index!11027 lt!146032) (size!7417 a!3312)))) (or ((_ is Undefined!2214) lt!146032) ((_ is Found!2214) lt!146032) (not ((_ is MissingZero!2214) lt!146032)) (and (bvsge (index!11026 lt!146032) #b00000000000000000000000000000000) (bvslt (index!11026 lt!146032) (size!7417 a!3312)))) (or ((_ is Undefined!2214) lt!146032) ((_ is Found!2214) lt!146032) ((_ is MissingZero!2214) lt!146032) (not ((_ is MissingVacant!2214) lt!146032)) (and (bvsge (index!11029 lt!146032) #b00000000000000000000000000000000) (bvslt (index!11029 lt!146032) (size!7417 a!3312)))) (or ((_ is Undefined!2214) lt!146032) (ite ((_ is Found!2214) lt!146032) (= (select (arr!7065 a!3312) (index!11027 lt!146032)) k0!2524) (ite ((_ is MissingZero!2214) lt!146032) (= (select (arr!7065 a!3312) (index!11026 lt!146032)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2214) lt!146032) (= (select (arr!7065 a!3312) (index!11029 lt!146032)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66831 (= lt!146032 e!186234)))

(declare-fun c!47442 () Bool)

(assert (=> d!66831 (= c!47442 (and ((_ is Intermediate!2214) lt!146034) (undefined!3026 lt!146034)))))

(assert (=> d!66831 (= lt!146034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66831 (validMask!0 mask!3809)))

(assert (=> d!66831 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146032)))

(declare-fun b!294603 () Bool)

(assert (=> b!294603 (= e!186234 e!186235)))

(assert (=> b!294603 (= lt!146033 (select (arr!7065 a!3312) (index!11028 lt!146034)))))

(declare-fun c!47440 () Bool)

(assert (=> b!294603 (= c!47440 (= lt!146033 k0!2524))))

(assert (= (and d!66831 c!47442) b!294602))

(assert (= (and d!66831 (not c!47442)) b!294603))

(assert (= (and b!294603 c!47440) b!294601))

(assert (= (and b!294603 (not c!47440)) b!294604))

(assert (= (and b!294604 c!47441) b!294600))

(assert (= (and b!294604 (not c!47441)) b!294605))

(declare-fun m!307985 () Bool)

(assert (=> b!294605 m!307985))

(declare-fun m!307987 () Bool)

(assert (=> d!66831 m!307987))

(declare-fun m!307989 () Bool)

(assert (=> d!66831 m!307989))

(assert (=> d!66831 m!307885))

(assert (=> d!66831 m!307875))

(assert (=> d!66831 m!307875))

(declare-fun m!307991 () Bool)

(assert (=> d!66831 m!307991))

(declare-fun m!307993 () Bool)

(assert (=> d!66831 m!307993))

(declare-fun m!307995 () Bool)

(assert (=> b!294603 m!307995))

(assert (=> b!294407 d!66831))

(check-sat (not b!294605) (not b!294492) (not d!66823) (not b!294510) (not b!294442) (not d!66831) (not b!294431) (not d!66809) (not bm!25699) (not b!294443))
(check-sat)
