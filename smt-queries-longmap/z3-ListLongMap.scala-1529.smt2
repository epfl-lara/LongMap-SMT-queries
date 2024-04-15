; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28898 () Bool)

(assert start!28898)

(declare-fun b!294137 () Bool)

(declare-fun res!154642 () Bool)

(declare-fun e!185945 () Bool)

(assert (=> b!294137 (=> (not res!154642) (not e!185945))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294137 (= res!154642 (validKeyInArray!0 k0!2524))))

(declare-fun res!154638 () Bool)

(assert (=> start!28898 (=> (not res!154638) (not e!185945))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28898 (= res!154638 (validMask!0 mask!3809))))

(assert (=> start!28898 e!185945))

(assert (=> start!28898 true))

(declare-datatypes ((array!14884 0))(
  ( (array!14885 (arr!7059 (Array (_ BitVec 32) (_ BitVec 64))) (size!7412 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14884)

(declare-fun array_inv!5031 (array!14884) Bool)

(assert (=> start!28898 (array_inv!5031 a!3312)))

(declare-fun b!294138 () Bool)

(declare-fun res!154641 () Bool)

(assert (=> b!294138 (=> (not res!154641) (not e!185945))))

(declare-fun arrayContainsKey!0 (array!14884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294138 (= res!154641 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294139 () Bool)

(declare-fun res!154639 () Bool)

(declare-fun e!185947 () Bool)

(assert (=> b!294139 (=> (not res!154639) (not e!185947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14884 (_ BitVec 32)) Bool)

(assert (=> b!294139 (= res!154639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294140 () Bool)

(assert (=> b!294140 (= e!185945 e!185947)))

(declare-fun res!154637 () Bool)

(assert (=> b!294140 (=> (not res!154637) (not e!185947))))

(declare-fun lt!145706 () Bool)

(declare-datatypes ((SeekEntryResult!2207 0))(
  ( (MissingZero!2207 (index!10998 (_ BitVec 32))) (Found!2207 (index!10999 (_ BitVec 32))) (Intermediate!2207 (undefined!3019 Bool) (index!11000 (_ BitVec 32)) (x!29215 (_ BitVec 32))) (Undefined!2207) (MissingVacant!2207 (index!11001 (_ BitVec 32))) )
))
(declare-fun lt!145704 () SeekEntryResult!2207)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!294140 (= res!154637 (or lt!145706 (= lt!145704 (MissingVacant!2207 i!1256))))))

(assert (=> b!294140 (= lt!145706 (= lt!145704 (MissingZero!2207 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14884 (_ BitVec 32)) SeekEntryResult!2207)

(assert (=> b!294140 (= lt!145704 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!294141 () Bool)

(declare-fun res!154640 () Bool)

(assert (=> b!294141 (=> (not res!154640) (not e!185945))))

(assert (=> b!294141 (= res!154640 (and (= (size!7412 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7412 a!3312))))))

(declare-fun lt!145707 () SeekEntryResult!2207)

(declare-fun b!294142 () Bool)

(get-info :version)

(assert (=> b!294142 (= e!185947 (and lt!145706 (let ((bdg!6235 (not ((_ is Intermediate!2207) lt!145707)))) (and (or bdg!6235 (not (undefined!3019 lt!145707))) (or bdg!6235 (not (= (select (arr!7059 a!3312) (index!11000 lt!145707)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6235) (= (select (arr!7059 a!3312) (index!11000 lt!145707)) k0!2524)))))))

(declare-fun lt!145705 () (_ BitVec 32))

(declare-fun lt!145703 () SeekEntryResult!2207)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14884 (_ BitVec 32)) SeekEntryResult!2207)

(assert (=> b!294142 (= lt!145703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145705 k0!2524 (array!14885 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7412 a!3312)) mask!3809))))

(assert (=> b!294142 (= lt!145707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145705 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294142 (= lt!145705 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28898 res!154638) b!294141))

(assert (= (and b!294141 res!154640) b!294137))

(assert (= (and b!294137 res!154642) b!294138))

(assert (= (and b!294138 res!154641) b!294140))

(assert (= (and b!294140 res!154637) b!294139))

(assert (= (and b!294139 res!154639) b!294142))

(declare-fun m!307149 () Bool)

(assert (=> b!294140 m!307149))

(declare-fun m!307151 () Bool)

(assert (=> b!294138 m!307151))

(declare-fun m!307153 () Bool)

(assert (=> start!28898 m!307153))

(declare-fun m!307155 () Bool)

(assert (=> start!28898 m!307155))

(declare-fun m!307157 () Bool)

(assert (=> b!294142 m!307157))

(declare-fun m!307159 () Bool)

(assert (=> b!294142 m!307159))

(declare-fun m!307161 () Bool)

(assert (=> b!294142 m!307161))

(declare-fun m!307163 () Bool)

(assert (=> b!294142 m!307163))

(declare-fun m!307165 () Bool)

(assert (=> b!294142 m!307165))

(declare-fun m!307167 () Bool)

(assert (=> b!294137 m!307167))

(declare-fun m!307169 () Bool)

(assert (=> b!294139 m!307169))

(check-sat (not b!294139) (not start!28898) (not b!294137) (not b!294138) (not b!294142) (not b!294140))
(check-sat)
(get-model)

(declare-fun d!66601 () Bool)

(declare-fun res!154683 () Bool)

(declare-fun e!185970 () Bool)

(assert (=> d!66601 (=> res!154683 e!185970)))

(assert (=> d!66601 (= res!154683 (= (select (arr!7059 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66601 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!185970)))

(declare-fun b!294183 () Bool)

(declare-fun e!185971 () Bool)

(assert (=> b!294183 (= e!185970 e!185971)))

(declare-fun res!154684 () Bool)

(assert (=> b!294183 (=> (not res!154684) (not e!185971))))

(assert (=> b!294183 (= res!154684 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7412 a!3312)))))

(declare-fun b!294184 () Bool)

(assert (=> b!294184 (= e!185971 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66601 (not res!154683)) b!294183))

(assert (= (and b!294183 res!154684) b!294184))

(declare-fun m!307215 () Bool)

(assert (=> d!66601 m!307215))

(declare-fun m!307217 () Bool)

(assert (=> b!294184 m!307217))

(assert (=> b!294138 d!66601))

(declare-fun d!66603 () Bool)

(declare-fun res!154690 () Bool)

(declare-fun e!185979 () Bool)

(assert (=> d!66603 (=> res!154690 e!185979)))

(assert (=> d!66603 (= res!154690 (bvsge #b00000000000000000000000000000000 (size!7412 a!3312)))))

(assert (=> d!66603 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185979)))

(declare-fun b!294193 () Bool)

(declare-fun e!185978 () Bool)

(declare-fun call!25676 () Bool)

(assert (=> b!294193 (= e!185978 call!25676)))

(declare-fun b!294194 () Bool)

(declare-fun e!185980 () Bool)

(assert (=> b!294194 (= e!185979 e!185980)))

(declare-fun c!47324 () Bool)

(assert (=> b!294194 (= c!47324 (validKeyInArray!0 (select (arr!7059 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25673 () Bool)

(assert (=> bm!25673 (= call!25676 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294195 () Bool)

(assert (=> b!294195 (= e!185980 e!185978)))

(declare-fun lt!145744 () (_ BitVec 64))

(assert (=> b!294195 (= lt!145744 (select (arr!7059 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9154 0))(
  ( (Unit!9155) )
))
(declare-fun lt!145745 () Unit!9154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14884 (_ BitVec 64) (_ BitVec 32)) Unit!9154)

(assert (=> b!294195 (= lt!145745 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145744 #b00000000000000000000000000000000))))

(assert (=> b!294195 (arrayContainsKey!0 a!3312 lt!145744 #b00000000000000000000000000000000)))

(declare-fun lt!145746 () Unit!9154)

(assert (=> b!294195 (= lt!145746 lt!145745)))

(declare-fun res!154689 () Bool)

(assert (=> b!294195 (= res!154689 (= (seekEntryOrOpen!0 (select (arr!7059 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2207 #b00000000000000000000000000000000)))))

(assert (=> b!294195 (=> (not res!154689) (not e!185978))))

(declare-fun b!294196 () Bool)

(assert (=> b!294196 (= e!185980 call!25676)))

(assert (= (and d!66603 (not res!154690)) b!294194))

(assert (= (and b!294194 c!47324) b!294195))

(assert (= (and b!294194 (not c!47324)) b!294196))

(assert (= (and b!294195 res!154689) b!294193))

(assert (= (or b!294193 b!294196) bm!25673))

(assert (=> b!294194 m!307215))

(assert (=> b!294194 m!307215))

(declare-fun m!307219 () Bool)

(assert (=> b!294194 m!307219))

(declare-fun m!307221 () Bool)

(assert (=> bm!25673 m!307221))

(assert (=> b!294195 m!307215))

(declare-fun m!307223 () Bool)

(assert (=> b!294195 m!307223))

(declare-fun m!307225 () Bool)

(assert (=> b!294195 m!307225))

(assert (=> b!294195 m!307215))

(declare-fun m!307227 () Bool)

(assert (=> b!294195 m!307227))

(assert (=> b!294139 d!66603))

(declare-fun d!66605 () Bool)

(declare-fun lt!145759 () SeekEntryResult!2207)

(assert (=> d!66605 (and (or ((_ is Undefined!2207) lt!145759) (not ((_ is Found!2207) lt!145759)) (and (bvsge (index!10999 lt!145759) #b00000000000000000000000000000000) (bvslt (index!10999 lt!145759) (size!7412 a!3312)))) (or ((_ is Undefined!2207) lt!145759) ((_ is Found!2207) lt!145759) (not ((_ is MissingZero!2207) lt!145759)) (and (bvsge (index!10998 lt!145759) #b00000000000000000000000000000000) (bvslt (index!10998 lt!145759) (size!7412 a!3312)))) (or ((_ is Undefined!2207) lt!145759) ((_ is Found!2207) lt!145759) ((_ is MissingZero!2207) lt!145759) (not ((_ is MissingVacant!2207) lt!145759)) (and (bvsge (index!11001 lt!145759) #b00000000000000000000000000000000) (bvslt (index!11001 lt!145759) (size!7412 a!3312)))) (or ((_ is Undefined!2207) lt!145759) (ite ((_ is Found!2207) lt!145759) (= (select (arr!7059 a!3312) (index!10999 lt!145759)) k0!2524) (ite ((_ is MissingZero!2207) lt!145759) (= (select (arr!7059 a!3312) (index!10998 lt!145759)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2207) lt!145759) (= (select (arr!7059 a!3312) (index!11001 lt!145759)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!186001 () SeekEntryResult!2207)

(assert (=> d!66605 (= lt!145759 e!186001)))

(declare-fun c!47333 () Bool)

(declare-fun lt!145760 () SeekEntryResult!2207)

(assert (=> d!66605 (= c!47333 (and ((_ is Intermediate!2207) lt!145760) (undefined!3019 lt!145760)))))

(assert (=> d!66605 (= lt!145760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66605 (validMask!0 mask!3809)))

(assert (=> d!66605 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145759)))

(declare-fun b!294223 () Bool)

(declare-fun e!185999 () SeekEntryResult!2207)

(assert (=> b!294223 (= e!185999 (MissingZero!2207 (index!11000 lt!145760)))))

(declare-fun b!294224 () Bool)

(declare-fun c!47334 () Bool)

(declare-fun lt!145761 () (_ BitVec 64))

(assert (=> b!294224 (= c!47334 (= lt!145761 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186000 () SeekEntryResult!2207)

(assert (=> b!294224 (= e!186000 e!185999)))

(declare-fun b!294225 () Bool)

(assert (=> b!294225 (= e!186000 (Found!2207 (index!11000 lt!145760)))))

(declare-fun b!294226 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14884 (_ BitVec 32)) SeekEntryResult!2207)

(assert (=> b!294226 (= e!185999 (seekKeyOrZeroReturnVacant!0 (x!29215 lt!145760) (index!11000 lt!145760) (index!11000 lt!145760) k0!2524 a!3312 mask!3809))))

(declare-fun b!294227 () Bool)

(assert (=> b!294227 (= e!186001 e!186000)))

(assert (=> b!294227 (= lt!145761 (select (arr!7059 a!3312) (index!11000 lt!145760)))))

(declare-fun c!47335 () Bool)

(assert (=> b!294227 (= c!47335 (= lt!145761 k0!2524))))

(declare-fun b!294228 () Bool)

(assert (=> b!294228 (= e!186001 Undefined!2207)))

(assert (= (and d!66605 c!47333) b!294228))

(assert (= (and d!66605 (not c!47333)) b!294227))

(assert (= (and b!294227 c!47335) b!294225))

(assert (= (and b!294227 (not c!47335)) b!294224))

(assert (= (and b!294224 c!47334) b!294223))

(assert (= (and b!294224 (not c!47334)) b!294226))

(assert (=> d!66605 m!307165))

(declare-fun m!307233 () Bool)

(assert (=> d!66605 m!307233))

(declare-fun m!307235 () Bool)

(assert (=> d!66605 m!307235))

(declare-fun m!307237 () Bool)

(assert (=> d!66605 m!307237))

(assert (=> d!66605 m!307153))

(assert (=> d!66605 m!307165))

(declare-fun m!307239 () Bool)

(assert (=> d!66605 m!307239))

(declare-fun m!307241 () Bool)

(assert (=> b!294226 m!307241))

(declare-fun m!307243 () Bool)

(assert (=> b!294227 m!307243))

(assert (=> b!294140 d!66605))

(declare-fun d!66613 () Bool)

(assert (=> d!66613 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28898 d!66613))

(declare-fun d!66617 () Bool)

(assert (=> d!66617 (= (array_inv!5031 a!3312) (bvsge (size!7412 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28898 d!66617))

(declare-fun d!66619 () Bool)

(declare-fun e!186050 () Bool)

(assert (=> d!66619 e!186050))

(declare-fun c!47364 () Bool)

(declare-fun lt!145792 () SeekEntryResult!2207)

(assert (=> d!66619 (= c!47364 (and ((_ is Intermediate!2207) lt!145792) (undefined!3019 lt!145792)))))

(declare-fun e!186053 () SeekEntryResult!2207)

(assert (=> d!66619 (= lt!145792 e!186053)))

(declare-fun c!47365 () Bool)

(assert (=> d!66619 (= c!47365 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145793 () (_ BitVec 64))

(assert (=> d!66619 (= lt!145793 (select (arr!7059 (array!14885 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7412 a!3312))) lt!145705))))

(assert (=> d!66619 (validMask!0 mask!3809)))

(assert (=> d!66619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145705 k0!2524 (array!14885 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7412 a!3312)) mask!3809) lt!145792)))

(declare-fun b!294311 () Bool)

(assert (=> b!294311 (= e!186053 (Intermediate!2207 true lt!145705 #b00000000000000000000000000000000))))

(declare-fun b!294312 () Bool)

(assert (=> b!294312 (and (bvsge (index!11000 lt!145792) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145792) (size!7412 (array!14885 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7412 a!3312)))))))

(declare-fun res!154729 () Bool)

(assert (=> b!294312 (= res!154729 (= (select (arr!7059 (array!14885 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7412 a!3312))) (index!11000 lt!145792)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186054 () Bool)

(assert (=> b!294312 (=> res!154729 e!186054)))

(declare-fun b!294313 () Bool)

(assert (=> b!294313 (and (bvsge (index!11000 lt!145792) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145792) (size!7412 (array!14885 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7412 a!3312)))))))

(assert (=> b!294313 (= e!186054 (= (select (arr!7059 (array!14885 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7412 a!3312))) (index!11000 lt!145792)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294314 () Bool)

(declare-fun e!186052 () SeekEntryResult!2207)

(assert (=> b!294314 (= e!186053 e!186052)))

(declare-fun c!47366 () Bool)

(assert (=> b!294314 (= c!47366 (or (= lt!145793 k0!2524) (= (bvadd lt!145793 lt!145793) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294315 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294315 (= e!186052 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145705 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14885 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7412 a!3312)) mask!3809))))

(declare-fun b!294316 () Bool)

(assert (=> b!294316 (and (bvsge (index!11000 lt!145792) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145792) (size!7412 (array!14885 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7412 a!3312)))))))

(declare-fun res!154730 () Bool)

(assert (=> b!294316 (= res!154730 (= (select (arr!7059 (array!14885 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7412 a!3312))) (index!11000 lt!145792)) k0!2524))))

(assert (=> b!294316 (=> res!154730 e!186054)))

(declare-fun e!186051 () Bool)

(assert (=> b!294316 (= e!186051 e!186054)))

(declare-fun b!294317 () Bool)

(assert (=> b!294317 (= e!186050 (bvsge (x!29215 lt!145792) #b01111111111111111111111111111110))))

(declare-fun b!294318 () Bool)

(assert (=> b!294318 (= e!186050 e!186051)))

(declare-fun res!154728 () Bool)

(assert (=> b!294318 (= res!154728 (and ((_ is Intermediate!2207) lt!145792) (not (undefined!3019 lt!145792)) (bvslt (x!29215 lt!145792) #b01111111111111111111111111111110) (bvsge (x!29215 lt!145792) #b00000000000000000000000000000000) (bvsge (x!29215 lt!145792) #b00000000000000000000000000000000)))))

(assert (=> b!294318 (=> (not res!154728) (not e!186051))))

(declare-fun b!294319 () Bool)

(assert (=> b!294319 (= e!186052 (Intermediate!2207 false lt!145705 #b00000000000000000000000000000000))))

(assert (= (and d!66619 c!47365) b!294311))

(assert (= (and d!66619 (not c!47365)) b!294314))

(assert (= (and b!294314 c!47366) b!294319))

(assert (= (and b!294314 (not c!47366)) b!294315))

(assert (= (and d!66619 c!47364) b!294317))

(assert (= (and d!66619 (not c!47364)) b!294318))

(assert (= (and b!294318 res!154728) b!294316))

(assert (= (and b!294316 (not res!154730)) b!294312))

(assert (= (and b!294312 (not res!154729)) b!294313))

(declare-fun m!307285 () Bool)

(assert (=> b!294316 m!307285))

(assert (=> b!294313 m!307285))

(declare-fun m!307287 () Bool)

(assert (=> b!294315 m!307287))

(assert (=> b!294315 m!307287))

(declare-fun m!307289 () Bool)

(assert (=> b!294315 m!307289))

(declare-fun m!307291 () Bool)

(assert (=> d!66619 m!307291))

(assert (=> d!66619 m!307153))

(assert (=> b!294312 m!307285))

(assert (=> b!294142 d!66619))

(declare-fun d!66637 () Bool)

(declare-fun e!186055 () Bool)

(assert (=> d!66637 e!186055))

(declare-fun c!47367 () Bool)

(declare-fun lt!145794 () SeekEntryResult!2207)

(assert (=> d!66637 (= c!47367 (and ((_ is Intermediate!2207) lt!145794) (undefined!3019 lt!145794)))))

(declare-fun e!186058 () SeekEntryResult!2207)

(assert (=> d!66637 (= lt!145794 e!186058)))

(declare-fun c!47368 () Bool)

(assert (=> d!66637 (= c!47368 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145795 () (_ BitVec 64))

(assert (=> d!66637 (= lt!145795 (select (arr!7059 a!3312) lt!145705))))

(assert (=> d!66637 (validMask!0 mask!3809)))

(assert (=> d!66637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145705 k0!2524 a!3312 mask!3809) lt!145794)))

(declare-fun b!294320 () Bool)

(assert (=> b!294320 (= e!186058 (Intermediate!2207 true lt!145705 #b00000000000000000000000000000000))))

(declare-fun b!294321 () Bool)

(assert (=> b!294321 (and (bvsge (index!11000 lt!145794) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145794) (size!7412 a!3312)))))

(declare-fun res!154732 () Bool)

(assert (=> b!294321 (= res!154732 (= (select (arr!7059 a!3312) (index!11000 lt!145794)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186059 () Bool)

(assert (=> b!294321 (=> res!154732 e!186059)))

(declare-fun b!294322 () Bool)

(assert (=> b!294322 (and (bvsge (index!11000 lt!145794) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145794) (size!7412 a!3312)))))

(assert (=> b!294322 (= e!186059 (= (select (arr!7059 a!3312) (index!11000 lt!145794)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294323 () Bool)

(declare-fun e!186057 () SeekEntryResult!2207)

(assert (=> b!294323 (= e!186058 e!186057)))

(declare-fun c!47369 () Bool)

(assert (=> b!294323 (= c!47369 (or (= lt!145795 k0!2524) (= (bvadd lt!145795 lt!145795) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294324 () Bool)

(assert (=> b!294324 (= e!186057 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145705 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!294325 () Bool)

(assert (=> b!294325 (and (bvsge (index!11000 lt!145794) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145794) (size!7412 a!3312)))))

(declare-fun res!154733 () Bool)

(assert (=> b!294325 (= res!154733 (= (select (arr!7059 a!3312) (index!11000 lt!145794)) k0!2524))))

(assert (=> b!294325 (=> res!154733 e!186059)))

(declare-fun e!186056 () Bool)

(assert (=> b!294325 (= e!186056 e!186059)))

(declare-fun b!294326 () Bool)

(assert (=> b!294326 (= e!186055 (bvsge (x!29215 lt!145794) #b01111111111111111111111111111110))))

(declare-fun b!294327 () Bool)

(assert (=> b!294327 (= e!186055 e!186056)))

(declare-fun res!154731 () Bool)

(assert (=> b!294327 (= res!154731 (and ((_ is Intermediate!2207) lt!145794) (not (undefined!3019 lt!145794)) (bvslt (x!29215 lt!145794) #b01111111111111111111111111111110) (bvsge (x!29215 lt!145794) #b00000000000000000000000000000000) (bvsge (x!29215 lt!145794) #b00000000000000000000000000000000)))))

(assert (=> b!294327 (=> (not res!154731) (not e!186056))))

(declare-fun b!294328 () Bool)

(assert (=> b!294328 (= e!186057 (Intermediate!2207 false lt!145705 #b00000000000000000000000000000000))))

(assert (= (and d!66637 c!47368) b!294320))

(assert (= (and d!66637 (not c!47368)) b!294323))

(assert (= (and b!294323 c!47369) b!294328))

(assert (= (and b!294323 (not c!47369)) b!294324))

(assert (= (and d!66637 c!47367) b!294326))

(assert (= (and d!66637 (not c!47367)) b!294327))

(assert (= (and b!294327 res!154731) b!294325))

(assert (= (and b!294325 (not res!154733)) b!294321))

(assert (= (and b!294321 (not res!154732)) b!294322))

(declare-fun m!307293 () Bool)

(assert (=> b!294325 m!307293))

(assert (=> b!294322 m!307293))

(assert (=> b!294324 m!307287))

(assert (=> b!294324 m!307287))

(declare-fun m!307295 () Bool)

(assert (=> b!294324 m!307295))

(declare-fun m!307297 () Bool)

(assert (=> d!66637 m!307297))

(assert (=> d!66637 m!307153))

(assert (=> b!294321 m!307293))

(assert (=> b!294142 d!66637))

(declare-fun d!66639 () Bool)

(declare-fun lt!145801 () (_ BitVec 32))

(declare-fun lt!145800 () (_ BitVec 32))

(assert (=> d!66639 (= lt!145801 (bvmul (bvxor lt!145800 (bvlshr lt!145800 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66639 (= lt!145800 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66639 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154734 (let ((h!5249 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29221 (bvmul (bvxor h!5249 (bvlshr h!5249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29221 (bvlshr x!29221 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154734 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154734 #b00000000000000000000000000000000))))))

(assert (=> d!66639 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145801 (bvlshr lt!145801 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294142 d!66639))

(declare-fun d!66641 () Bool)

(assert (=> d!66641 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294137 d!66641))

(check-sat (not b!294184) (not d!66637) (not b!294226) (not b!294324) (not b!294315) (not d!66605) (not b!294195) (not b!294194) (not bm!25673) (not d!66619))
(check-sat)
