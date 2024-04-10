; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28860 () Bool)

(assert start!28860)

(declare-fun b!294132 () Bool)

(declare-fun res!154645 () Bool)

(declare-fun e!185955 () Bool)

(assert (=> b!294132 (=> (not res!154645) (not e!185955))))

(declare-datatypes ((array!14888 0))(
  ( (array!14889 (arr!7062 (Array (_ BitVec 32) (_ BitVec 64))) (size!7414 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14888)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294132 (= res!154645 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!154650 () Bool)

(assert (=> start!28860 (=> (not res!154650) (not e!185955))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28860 (= res!154650 (validMask!0 mask!3809))))

(assert (=> start!28860 e!185955))

(assert (=> start!28860 true))

(declare-fun array_inv!5025 (array!14888) Bool)

(assert (=> start!28860 (array_inv!5025 a!3312)))

(declare-fun b!294133 () Bool)

(declare-fun e!185956 () Bool)

(assert (=> b!294133 (= e!185955 e!185956)))

(declare-fun res!154648 () Bool)

(assert (=> b!294133 (=> (not res!154648) (not e!185956))))

(declare-fun lt!145802 () Bool)

(declare-datatypes ((SeekEntryResult!2211 0))(
  ( (MissingZero!2211 (index!11014 (_ BitVec 32))) (Found!2211 (index!11015 (_ BitVec 32))) (Intermediate!2211 (undefined!3023 Bool) (index!11016 (_ BitVec 32)) (x!29209 (_ BitVec 32))) (Undefined!2211) (MissingVacant!2211 (index!11017 (_ BitVec 32))) )
))
(declare-fun lt!145803 () SeekEntryResult!2211)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!294133 (= res!154648 (or lt!145802 (= lt!145803 (MissingVacant!2211 i!1256))))))

(assert (=> b!294133 (= lt!145802 (= lt!145803 (MissingZero!2211 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14888 (_ BitVec 32)) SeekEntryResult!2211)

(assert (=> b!294133 (= lt!145803 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!294134 () Bool)

(declare-fun res!154649 () Bool)

(assert (=> b!294134 (=> (not res!154649) (not e!185955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294134 (= res!154649 (validKeyInArray!0 k0!2524))))

(declare-fun b!294135 () Bool)

(declare-fun res!154647 () Bool)

(assert (=> b!294135 (=> (not res!154647) (not e!185955))))

(assert (=> b!294135 (= res!154647 (and (= (size!7414 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7414 a!3312))))))

(declare-fun lt!145800 () SeekEntryResult!2211)

(declare-fun b!294136 () Bool)

(get-info :version)

(assert (=> b!294136 (= e!185956 (and lt!145802 (let ((bdg!6229 (not ((_ is Intermediate!2211) lt!145800)))) (and (or bdg!6229 (not (undefined!3023 lt!145800))) (or bdg!6229 (not (= (select (arr!7062 a!3312) (index!11016 lt!145800)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6229) (or (bvslt (index!11016 lt!145800) #b00000000000000000000000000000000) (bvsge (index!11016 lt!145800) (size!7414 a!3312)))))))))

(declare-fun lt!145799 () (_ BitVec 32))

(declare-fun lt!145801 () SeekEntryResult!2211)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14888 (_ BitVec 32)) SeekEntryResult!2211)

(assert (=> b!294136 (= lt!145801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145799 k0!2524 (array!14889 (store (arr!7062 a!3312) i!1256 k0!2524) (size!7414 a!3312)) mask!3809))))

(assert (=> b!294136 (= lt!145800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145799 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294136 (= lt!145799 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!294137 () Bool)

(declare-fun res!154646 () Bool)

(assert (=> b!294137 (=> (not res!154646) (not e!185956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14888 (_ BitVec 32)) Bool)

(assert (=> b!294137 (= res!154646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28860 res!154650) b!294135))

(assert (= (and b!294135 res!154647) b!294134))

(assert (= (and b!294134 res!154649) b!294132))

(assert (= (and b!294132 res!154645) b!294133))

(assert (= (and b!294133 res!154648) b!294137))

(assert (= (and b!294137 res!154646) b!294136))

(declare-fun m!307681 () Bool)

(assert (=> start!28860 m!307681))

(declare-fun m!307683 () Bool)

(assert (=> start!28860 m!307683))

(declare-fun m!307685 () Bool)

(assert (=> b!294137 m!307685))

(declare-fun m!307687 () Bool)

(assert (=> b!294132 m!307687))

(declare-fun m!307689 () Bool)

(assert (=> b!294133 m!307689))

(declare-fun m!307691 () Bool)

(assert (=> b!294136 m!307691))

(declare-fun m!307693 () Bool)

(assert (=> b!294136 m!307693))

(declare-fun m!307695 () Bool)

(assert (=> b!294136 m!307695))

(declare-fun m!307697 () Bool)

(assert (=> b!294136 m!307697))

(declare-fun m!307699 () Bool)

(assert (=> b!294136 m!307699))

(declare-fun m!307701 () Bool)

(assert (=> b!294134 m!307701))

(check-sat (not b!294134) (not start!28860) (not b!294132) (not b!294137) (not b!294136) (not b!294133))
(check-sat)
(get-model)

(declare-fun b!294168 () Bool)

(declare-fun e!185973 () SeekEntryResult!2211)

(declare-fun lt!145827 () SeekEntryResult!2211)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14888 (_ BitVec 32)) SeekEntryResult!2211)

(assert (=> b!294168 (= e!185973 (seekKeyOrZeroReturnVacant!0 (x!29209 lt!145827) (index!11016 lt!145827) (index!11016 lt!145827) k0!2524 a!3312 mask!3809))))

(declare-fun b!294169 () Bool)

(declare-fun c!47321 () Bool)

(declare-fun lt!145825 () (_ BitVec 64))

(assert (=> b!294169 (= c!47321 (= lt!145825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185972 () SeekEntryResult!2211)

(assert (=> b!294169 (= e!185972 e!185973)))

(declare-fun b!294170 () Bool)

(declare-fun e!185974 () SeekEntryResult!2211)

(assert (=> b!294170 (= e!185974 Undefined!2211)))

(declare-fun b!294171 () Bool)

(assert (=> b!294171 (= e!185974 e!185972)))

(assert (=> b!294171 (= lt!145825 (select (arr!7062 a!3312) (index!11016 lt!145827)))))

(declare-fun c!47322 () Bool)

(assert (=> b!294171 (= c!47322 (= lt!145825 k0!2524))))

(declare-fun b!294172 () Bool)

(assert (=> b!294172 (= e!185972 (Found!2211 (index!11016 lt!145827)))))

(declare-fun d!66739 () Bool)

(declare-fun lt!145826 () SeekEntryResult!2211)

(assert (=> d!66739 (and (or ((_ is Undefined!2211) lt!145826) (not ((_ is Found!2211) lt!145826)) (and (bvsge (index!11015 lt!145826) #b00000000000000000000000000000000) (bvslt (index!11015 lt!145826) (size!7414 a!3312)))) (or ((_ is Undefined!2211) lt!145826) ((_ is Found!2211) lt!145826) (not ((_ is MissingZero!2211) lt!145826)) (and (bvsge (index!11014 lt!145826) #b00000000000000000000000000000000) (bvslt (index!11014 lt!145826) (size!7414 a!3312)))) (or ((_ is Undefined!2211) lt!145826) ((_ is Found!2211) lt!145826) ((_ is MissingZero!2211) lt!145826) (not ((_ is MissingVacant!2211) lt!145826)) (and (bvsge (index!11017 lt!145826) #b00000000000000000000000000000000) (bvslt (index!11017 lt!145826) (size!7414 a!3312)))) (or ((_ is Undefined!2211) lt!145826) (ite ((_ is Found!2211) lt!145826) (= (select (arr!7062 a!3312) (index!11015 lt!145826)) k0!2524) (ite ((_ is MissingZero!2211) lt!145826) (= (select (arr!7062 a!3312) (index!11014 lt!145826)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2211) lt!145826) (= (select (arr!7062 a!3312) (index!11017 lt!145826)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66739 (= lt!145826 e!185974)))

(declare-fun c!47320 () Bool)

(assert (=> d!66739 (= c!47320 (and ((_ is Intermediate!2211) lt!145827) (undefined!3023 lt!145827)))))

(assert (=> d!66739 (= lt!145827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66739 (validMask!0 mask!3809)))

(assert (=> d!66739 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145826)))

(declare-fun b!294173 () Bool)

(assert (=> b!294173 (= e!185973 (MissingZero!2211 (index!11016 lt!145827)))))

(assert (= (and d!66739 c!47320) b!294170))

(assert (= (and d!66739 (not c!47320)) b!294171))

(assert (= (and b!294171 c!47322) b!294172))

(assert (= (and b!294171 (not c!47322)) b!294169))

(assert (= (and b!294169 c!47321) b!294173))

(assert (= (and b!294169 (not c!47321)) b!294168))

(declare-fun m!307725 () Bool)

(assert (=> b!294168 m!307725))

(declare-fun m!307727 () Bool)

(assert (=> b!294171 m!307727))

(declare-fun m!307729 () Bool)

(assert (=> d!66739 m!307729))

(declare-fun m!307731 () Bool)

(assert (=> d!66739 m!307731))

(declare-fun m!307733 () Bool)

(assert (=> d!66739 m!307733))

(assert (=> d!66739 m!307699))

(assert (=> d!66739 m!307681))

(assert (=> d!66739 m!307699))

(declare-fun m!307735 () Bool)

(assert (=> d!66739 m!307735))

(assert (=> b!294133 d!66739))

(declare-fun d!66747 () Bool)

(assert (=> d!66747 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294134 d!66747))

(declare-fun d!66749 () Bool)

(assert (=> d!66749 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28860 d!66749))

(declare-fun d!66755 () Bool)

(assert (=> d!66755 (= (array_inv!5025 a!3312) (bvsge (size!7414 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28860 d!66755))

(declare-fun b!294252 () Bool)

(declare-fun e!186027 () SeekEntryResult!2211)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294252 (= e!186027 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145799 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14889 (store (arr!7062 a!3312) i!1256 k0!2524) (size!7414 a!3312)) mask!3809))))

(declare-fun b!294253 () Bool)

(assert (=> b!294253 (= e!186027 (Intermediate!2211 false lt!145799 #b00000000000000000000000000000000))))

(declare-fun b!294254 () Bool)

(declare-fun e!186028 () Bool)

(declare-fun lt!145860 () SeekEntryResult!2211)

(assert (=> b!294254 (= e!186028 (bvsge (x!29209 lt!145860) #b01111111111111111111111111111110))))

(declare-fun b!294255 () Bool)

(declare-fun e!186026 () SeekEntryResult!2211)

(assert (=> b!294255 (= e!186026 (Intermediate!2211 true lt!145799 #b00000000000000000000000000000000))))

(declare-fun b!294256 () Bool)

(assert (=> b!294256 (and (bvsge (index!11016 lt!145860) #b00000000000000000000000000000000) (bvslt (index!11016 lt!145860) (size!7414 (array!14889 (store (arr!7062 a!3312) i!1256 k0!2524) (size!7414 a!3312)))))))

(declare-fun e!186025 () Bool)

(assert (=> b!294256 (= e!186025 (= (select (arr!7062 (array!14889 (store (arr!7062 a!3312) i!1256 k0!2524) (size!7414 a!3312))) (index!11016 lt!145860)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294257 () Bool)

(assert (=> b!294257 (= e!186026 e!186027)))

(declare-fun c!47350 () Bool)

(declare-fun lt!145859 () (_ BitVec 64))

(assert (=> b!294257 (= c!47350 (or (= lt!145859 k0!2524) (= (bvadd lt!145859 lt!145859) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66757 () Bool)

(assert (=> d!66757 e!186028))

(declare-fun c!47352 () Bool)

(assert (=> d!66757 (= c!47352 (and ((_ is Intermediate!2211) lt!145860) (undefined!3023 lt!145860)))))

(assert (=> d!66757 (= lt!145860 e!186026)))

(declare-fun c!47351 () Bool)

(assert (=> d!66757 (= c!47351 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66757 (= lt!145859 (select (arr!7062 (array!14889 (store (arr!7062 a!3312) i!1256 k0!2524) (size!7414 a!3312))) lt!145799))))

(assert (=> d!66757 (validMask!0 mask!3809)))

(assert (=> d!66757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145799 k0!2524 (array!14889 (store (arr!7062 a!3312) i!1256 k0!2524) (size!7414 a!3312)) mask!3809) lt!145860)))

(declare-fun b!294258 () Bool)

(declare-fun e!186024 () Bool)

(assert (=> b!294258 (= e!186028 e!186024)))

(declare-fun res!154693 () Bool)

(assert (=> b!294258 (= res!154693 (and ((_ is Intermediate!2211) lt!145860) (not (undefined!3023 lt!145860)) (bvslt (x!29209 lt!145860) #b01111111111111111111111111111110) (bvsge (x!29209 lt!145860) #b00000000000000000000000000000000) (bvsge (x!29209 lt!145860) #b00000000000000000000000000000000)))))

(assert (=> b!294258 (=> (not res!154693) (not e!186024))))

(declare-fun b!294259 () Bool)

(assert (=> b!294259 (and (bvsge (index!11016 lt!145860) #b00000000000000000000000000000000) (bvslt (index!11016 lt!145860) (size!7414 (array!14889 (store (arr!7062 a!3312) i!1256 k0!2524) (size!7414 a!3312)))))))

(declare-fun res!154695 () Bool)

(assert (=> b!294259 (= res!154695 (= (select (arr!7062 (array!14889 (store (arr!7062 a!3312) i!1256 k0!2524) (size!7414 a!3312))) (index!11016 lt!145860)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294259 (=> res!154695 e!186025)))

(declare-fun b!294260 () Bool)

(assert (=> b!294260 (and (bvsge (index!11016 lt!145860) #b00000000000000000000000000000000) (bvslt (index!11016 lt!145860) (size!7414 (array!14889 (store (arr!7062 a!3312) i!1256 k0!2524) (size!7414 a!3312)))))))

(declare-fun res!154694 () Bool)

(assert (=> b!294260 (= res!154694 (= (select (arr!7062 (array!14889 (store (arr!7062 a!3312) i!1256 k0!2524) (size!7414 a!3312))) (index!11016 lt!145860)) k0!2524))))

(assert (=> b!294260 (=> res!154694 e!186025)))

(assert (=> b!294260 (= e!186024 e!186025)))

(assert (= (and d!66757 c!47351) b!294255))

(assert (= (and d!66757 (not c!47351)) b!294257))

(assert (= (and b!294257 c!47350) b!294253))

(assert (= (and b!294257 (not c!47350)) b!294252))

(assert (= (and d!66757 c!47352) b!294254))

(assert (= (and d!66757 (not c!47352)) b!294258))

(assert (= (and b!294258 res!154693) b!294260))

(assert (= (and b!294260 (not res!154694)) b!294259))

(assert (= (and b!294259 (not res!154695)) b!294256))

(declare-fun m!307779 () Bool)

(assert (=> b!294252 m!307779))

(assert (=> b!294252 m!307779))

(declare-fun m!307781 () Bool)

(assert (=> b!294252 m!307781))

(declare-fun m!307783 () Bool)

(assert (=> b!294260 m!307783))

(assert (=> b!294256 m!307783))

(assert (=> b!294259 m!307783))

(declare-fun m!307785 () Bool)

(assert (=> d!66757 m!307785))

(assert (=> d!66757 m!307681))

(assert (=> b!294136 d!66757))

(declare-fun e!186032 () SeekEntryResult!2211)

(declare-fun b!294261 () Bool)

(assert (=> b!294261 (= e!186032 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145799 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!294262 () Bool)

(assert (=> b!294262 (= e!186032 (Intermediate!2211 false lt!145799 #b00000000000000000000000000000000))))

(declare-fun b!294263 () Bool)

(declare-fun e!186033 () Bool)

(declare-fun lt!145862 () SeekEntryResult!2211)

(assert (=> b!294263 (= e!186033 (bvsge (x!29209 lt!145862) #b01111111111111111111111111111110))))

(declare-fun b!294264 () Bool)

(declare-fun e!186031 () SeekEntryResult!2211)

(assert (=> b!294264 (= e!186031 (Intermediate!2211 true lt!145799 #b00000000000000000000000000000000))))

(declare-fun b!294265 () Bool)

(assert (=> b!294265 (and (bvsge (index!11016 lt!145862) #b00000000000000000000000000000000) (bvslt (index!11016 lt!145862) (size!7414 a!3312)))))

(declare-fun e!186030 () Bool)

(assert (=> b!294265 (= e!186030 (= (select (arr!7062 a!3312) (index!11016 lt!145862)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294266 () Bool)

(assert (=> b!294266 (= e!186031 e!186032)))

(declare-fun c!47353 () Bool)

(declare-fun lt!145861 () (_ BitVec 64))

(assert (=> b!294266 (= c!47353 (or (= lt!145861 k0!2524) (= (bvadd lt!145861 lt!145861) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66775 () Bool)

(assert (=> d!66775 e!186033))

(declare-fun c!47355 () Bool)

(assert (=> d!66775 (= c!47355 (and ((_ is Intermediate!2211) lt!145862) (undefined!3023 lt!145862)))))

(assert (=> d!66775 (= lt!145862 e!186031)))

(declare-fun c!47354 () Bool)

(assert (=> d!66775 (= c!47354 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66775 (= lt!145861 (select (arr!7062 a!3312) lt!145799))))

(assert (=> d!66775 (validMask!0 mask!3809)))

(assert (=> d!66775 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145799 k0!2524 a!3312 mask!3809) lt!145862)))

(declare-fun b!294267 () Bool)

(declare-fun e!186029 () Bool)

(assert (=> b!294267 (= e!186033 e!186029)))

(declare-fun res!154696 () Bool)

(assert (=> b!294267 (= res!154696 (and ((_ is Intermediate!2211) lt!145862) (not (undefined!3023 lt!145862)) (bvslt (x!29209 lt!145862) #b01111111111111111111111111111110) (bvsge (x!29209 lt!145862) #b00000000000000000000000000000000) (bvsge (x!29209 lt!145862) #b00000000000000000000000000000000)))))

(assert (=> b!294267 (=> (not res!154696) (not e!186029))))

(declare-fun b!294268 () Bool)

(assert (=> b!294268 (and (bvsge (index!11016 lt!145862) #b00000000000000000000000000000000) (bvslt (index!11016 lt!145862) (size!7414 a!3312)))))

(declare-fun res!154698 () Bool)

(assert (=> b!294268 (= res!154698 (= (select (arr!7062 a!3312) (index!11016 lt!145862)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294268 (=> res!154698 e!186030)))

(declare-fun b!294269 () Bool)

(assert (=> b!294269 (and (bvsge (index!11016 lt!145862) #b00000000000000000000000000000000) (bvslt (index!11016 lt!145862) (size!7414 a!3312)))))

(declare-fun res!154697 () Bool)

(assert (=> b!294269 (= res!154697 (= (select (arr!7062 a!3312) (index!11016 lt!145862)) k0!2524))))

(assert (=> b!294269 (=> res!154697 e!186030)))

(assert (=> b!294269 (= e!186029 e!186030)))

(assert (= (and d!66775 c!47354) b!294264))

(assert (= (and d!66775 (not c!47354)) b!294266))

(assert (= (and b!294266 c!47353) b!294262))

(assert (= (and b!294266 (not c!47353)) b!294261))

(assert (= (and d!66775 c!47355) b!294263))

(assert (= (and d!66775 (not c!47355)) b!294267))

(assert (= (and b!294267 res!154696) b!294269))

(assert (= (and b!294269 (not res!154697)) b!294268))

(assert (= (and b!294268 (not res!154698)) b!294265))

(assert (=> b!294261 m!307779))

(assert (=> b!294261 m!307779))

(declare-fun m!307787 () Bool)

(assert (=> b!294261 m!307787))

(declare-fun m!307789 () Bool)

(assert (=> b!294269 m!307789))

(assert (=> b!294265 m!307789))

(assert (=> b!294268 m!307789))

(declare-fun m!307791 () Bool)

(assert (=> d!66775 m!307791))

(assert (=> d!66775 m!307681))

(assert (=> b!294136 d!66775))

(declare-fun d!66777 () Bool)

(declare-fun lt!145868 () (_ BitVec 32))

(declare-fun lt!145867 () (_ BitVec 32))

(assert (=> d!66777 (= lt!145868 (bvmul (bvxor lt!145867 (bvlshr lt!145867 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66777 (= lt!145867 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66777 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154699 (let ((h!5277 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29212 (bvmul (bvxor h!5277 (bvlshr h!5277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29212 (bvlshr x!29212 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154699 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154699 #b00000000000000000000000000000000))))))

(assert (=> d!66777 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145868 (bvlshr lt!145868 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294136 d!66777))

(declare-fun b!294323 () Bool)

(declare-fun e!186065 () Bool)

(declare-fun e!186066 () Bool)

(assert (=> b!294323 (= e!186065 e!186066)))

(declare-fun c!47373 () Bool)

(assert (=> b!294323 (= c!47373 (validKeyInArray!0 (select (arr!7062 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!66779 () Bool)

(declare-fun res!154720 () Bool)

(assert (=> d!66779 (=> res!154720 e!186065)))

(assert (=> d!66779 (= res!154720 (bvsge #b00000000000000000000000000000000 (size!7414 a!3312)))))

(assert (=> d!66779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186065)))

(declare-fun b!294324 () Bool)

(declare-fun call!25696 () Bool)

(assert (=> b!294324 (= e!186066 call!25696)))

(declare-fun bm!25693 () Bool)

(assert (=> bm!25693 (= call!25696 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294325 () Bool)

(declare-fun e!186067 () Bool)

(assert (=> b!294325 (= e!186067 call!25696)))

(declare-fun b!294326 () Bool)

(assert (=> b!294326 (= e!186066 e!186067)))

(declare-fun lt!145887 () (_ BitVec 64))

(assert (=> b!294326 (= lt!145887 (select (arr!7062 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9198 0))(
  ( (Unit!9199) )
))
(declare-fun lt!145886 () Unit!9198)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14888 (_ BitVec 64) (_ BitVec 32)) Unit!9198)

(assert (=> b!294326 (= lt!145886 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145887 #b00000000000000000000000000000000))))

(assert (=> b!294326 (arrayContainsKey!0 a!3312 lt!145887 #b00000000000000000000000000000000)))

(declare-fun lt!145885 () Unit!9198)

(assert (=> b!294326 (= lt!145885 lt!145886)))

(declare-fun res!154719 () Bool)

(assert (=> b!294326 (= res!154719 (= (seekEntryOrOpen!0 (select (arr!7062 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2211 #b00000000000000000000000000000000)))))

(assert (=> b!294326 (=> (not res!154719) (not e!186067))))

(assert (= (and d!66779 (not res!154720)) b!294323))

(assert (= (and b!294323 c!47373) b!294326))

(assert (= (and b!294323 (not c!47373)) b!294324))

(assert (= (and b!294326 res!154719) b!294325))

(assert (= (or b!294325 b!294324) bm!25693))

(declare-fun m!307793 () Bool)

(assert (=> b!294323 m!307793))

(assert (=> b!294323 m!307793))

(declare-fun m!307795 () Bool)

(assert (=> b!294323 m!307795))

(declare-fun m!307797 () Bool)

(assert (=> bm!25693 m!307797))

(assert (=> b!294326 m!307793))

(declare-fun m!307799 () Bool)

(assert (=> b!294326 m!307799))

(declare-fun m!307801 () Bool)

(assert (=> b!294326 m!307801))

(assert (=> b!294326 m!307793))

(declare-fun m!307803 () Bool)

(assert (=> b!294326 m!307803))

(assert (=> b!294137 d!66779))

(declare-fun d!66781 () Bool)

(declare-fun res!154732 () Bool)

(declare-fun e!186082 () Bool)

(assert (=> d!66781 (=> res!154732 e!186082)))

(assert (=> d!66781 (= res!154732 (= (select (arr!7062 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66781 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186082)))

(declare-fun b!294349 () Bool)

(declare-fun e!186083 () Bool)

(assert (=> b!294349 (= e!186082 e!186083)))

(declare-fun res!154733 () Bool)

(assert (=> b!294349 (=> (not res!154733) (not e!186083))))

(assert (=> b!294349 (= res!154733 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7414 a!3312)))))

(declare-fun b!294350 () Bool)

(assert (=> b!294350 (= e!186083 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66781 (not res!154732)) b!294349))

(assert (= (and b!294349 res!154733) b!294350))

(assert (=> d!66781 m!307793))

(declare-fun m!307819 () Bool)

(assert (=> b!294350 m!307819))

(assert (=> b!294132 d!66781))

(check-sat (not b!294323) (not b!294326) (not b!294252) (not b!294350) (not d!66757) (not d!66739) (not d!66775) (not b!294261) (not bm!25693) (not b!294168))
(check-sat)
