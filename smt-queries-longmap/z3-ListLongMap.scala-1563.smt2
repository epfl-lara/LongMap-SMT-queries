; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29772 () Bool)

(assert start!29772)

(declare-fun b!299889 () Bool)

(declare-fun e!189400 () Bool)

(declare-fun e!189399 () Bool)

(assert (=> b!299889 (= e!189400 e!189399)))

(declare-fun res!158063 () Bool)

(assert (=> b!299889 (=> (not res!158063) (not e!189399))))

(declare-fun lt!149151 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2316 0))(
  ( (MissingZero!2316 (index!11440 (_ BitVec 32))) (Found!2316 (index!11441 (_ BitVec 32))) (Intermediate!2316 (undefined!3128 Bool) (index!11442 (_ BitVec 32)) (x!29690 (_ BitVec 32))) (Undefined!2316) (MissingVacant!2316 (index!11443 (_ BitVec 32))) )
))
(declare-fun lt!149150 () SeekEntryResult!2316)

(assert (=> b!299889 (= res!158063 (or lt!149151 (= lt!149150 (MissingVacant!2316 i!1256))))))

(assert (=> b!299889 (= lt!149151 (= lt!149150 (MissingZero!2316 i!1256)))))

(declare-datatypes ((array!15140 0))(
  ( (array!15141 (arr!7167 (Array (_ BitVec 32) (_ BitVec 64))) (size!7519 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15140)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15140 (_ BitVec 32)) SeekEntryResult!2316)

(assert (=> b!299889 (= lt!149150 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!299890 () Bool)

(declare-fun res!158065 () Bool)

(assert (=> b!299890 (=> (not res!158065) (not e!189400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299890 (= res!158065 (validKeyInArray!0 k0!2524))))

(declare-fun b!299891 () Bool)

(declare-fun lt!149154 () SeekEntryResult!2316)

(get-info :version)

(assert (=> b!299891 (= e!189399 (and (not lt!149151) (= lt!149150 (MissingVacant!2316 i!1256)) (let ((bdg!6452 (not ((_ is Intermediate!2316) lt!149154)))) (and (or bdg!6452 (not (undefined!3128 lt!149154))) (or bdg!6452 (not (= (select (arr!7167 a!3312) (index!11442 lt!149154)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6452) (= (select (arr!7167 a!3312) (index!11442 lt!149154)) k0!2524)))))))

(declare-fun lt!149153 () (_ BitVec 32))

(declare-fun lt!149152 () SeekEntryResult!2316)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15140 (_ BitVec 32)) SeekEntryResult!2316)

(assert (=> b!299891 (= lt!149152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149153 k0!2524 (array!15141 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7519 a!3312)) mask!3809))))

(assert (=> b!299891 (= lt!149154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149153 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299891 (= lt!149153 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!299892 () Bool)

(declare-fun res!158062 () Bool)

(assert (=> b!299892 (=> (not res!158062) (not e!189399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15140 (_ BitVec 32)) Bool)

(assert (=> b!299892 (= res!158062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!158064 () Bool)

(assert (=> start!29772 (=> (not res!158064) (not e!189400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29772 (= res!158064 (validMask!0 mask!3809))))

(assert (=> start!29772 e!189400))

(assert (=> start!29772 true))

(declare-fun array_inv!5130 (array!15140) Bool)

(assert (=> start!29772 (array_inv!5130 a!3312)))

(declare-fun b!299893 () Bool)

(declare-fun res!158066 () Bool)

(assert (=> b!299893 (=> (not res!158066) (not e!189400))))

(declare-fun arrayContainsKey!0 (array!15140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299893 (= res!158066 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299894 () Bool)

(declare-fun res!158067 () Bool)

(assert (=> b!299894 (=> (not res!158067) (not e!189400))))

(assert (=> b!299894 (= res!158067 (and (= (size!7519 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7519 a!3312))))))

(assert (= (and start!29772 res!158064) b!299894))

(assert (= (and b!299894 res!158067) b!299890))

(assert (= (and b!299890 res!158065) b!299893))

(assert (= (and b!299893 res!158066) b!299889))

(assert (= (and b!299889 res!158063) b!299892))

(assert (= (and b!299892 res!158062) b!299891))

(declare-fun m!312019 () Bool)

(assert (=> b!299893 m!312019))

(declare-fun m!312021 () Bool)

(assert (=> b!299891 m!312021))

(declare-fun m!312023 () Bool)

(assert (=> b!299891 m!312023))

(declare-fun m!312025 () Bool)

(assert (=> b!299891 m!312025))

(declare-fun m!312027 () Bool)

(assert (=> b!299891 m!312027))

(declare-fun m!312029 () Bool)

(assert (=> b!299891 m!312029))

(declare-fun m!312031 () Bool)

(assert (=> start!29772 m!312031))

(declare-fun m!312033 () Bool)

(assert (=> start!29772 m!312033))

(declare-fun m!312035 () Bool)

(assert (=> b!299889 m!312035))

(declare-fun m!312037 () Bool)

(assert (=> b!299892 m!312037))

(declare-fun m!312039 () Bool)

(assert (=> b!299890 m!312039))

(check-sat (not b!299890) (not b!299889) (not b!299892) (not b!299893) (not start!29772) (not b!299891))
(check-sat)
(get-model)

(declare-fun d!67655 () Bool)

(assert (=> d!67655 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29772 d!67655))

(declare-fun d!67661 () Bool)

(assert (=> d!67661 (= (array_inv!5130 a!3312) (bvsge (size!7519 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29772 d!67661))

(declare-fun d!67663 () Bool)

(declare-fun res!158090 () Bool)

(declare-fun e!189414 () Bool)

(assert (=> d!67663 (=> res!158090 e!189414)))

(assert (=> d!67663 (= res!158090 (= (select (arr!7167 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67663 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189414)))

(declare-fun b!299917 () Bool)

(declare-fun e!189415 () Bool)

(assert (=> b!299917 (= e!189414 e!189415)))

(declare-fun res!158091 () Bool)

(assert (=> b!299917 (=> (not res!158091) (not e!189415))))

(assert (=> b!299917 (= res!158091 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7519 a!3312)))))

(declare-fun b!299918 () Bool)

(assert (=> b!299918 (= e!189415 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67663 (not res!158090)) b!299917))

(assert (= (and b!299917 res!158091) b!299918))

(declare-fun m!312063 () Bool)

(assert (=> d!67663 m!312063))

(declare-fun m!312065 () Bool)

(assert (=> b!299918 m!312065))

(assert (=> b!299893 d!67663))

(declare-fun d!67665 () Bool)

(declare-fun lt!149199 () SeekEntryResult!2316)

(assert (=> d!67665 (and (or ((_ is Undefined!2316) lt!149199) (not ((_ is Found!2316) lt!149199)) (and (bvsge (index!11441 lt!149199) #b00000000000000000000000000000000) (bvslt (index!11441 lt!149199) (size!7519 a!3312)))) (or ((_ is Undefined!2316) lt!149199) ((_ is Found!2316) lt!149199) (not ((_ is MissingZero!2316) lt!149199)) (and (bvsge (index!11440 lt!149199) #b00000000000000000000000000000000) (bvslt (index!11440 lt!149199) (size!7519 a!3312)))) (or ((_ is Undefined!2316) lt!149199) ((_ is Found!2316) lt!149199) ((_ is MissingZero!2316) lt!149199) (not ((_ is MissingVacant!2316) lt!149199)) (and (bvsge (index!11443 lt!149199) #b00000000000000000000000000000000) (bvslt (index!11443 lt!149199) (size!7519 a!3312)))) (or ((_ is Undefined!2316) lt!149199) (ite ((_ is Found!2316) lt!149199) (= (select (arr!7167 a!3312) (index!11441 lt!149199)) k0!2524) (ite ((_ is MissingZero!2316) lt!149199) (= (select (arr!7167 a!3312) (index!11440 lt!149199)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2316) lt!149199) (= (select (arr!7167 a!3312) (index!11443 lt!149199)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!189457 () SeekEntryResult!2316)

(assert (=> d!67665 (= lt!149199 e!189457)))

(declare-fun c!48526 () Bool)

(declare-fun lt!149201 () SeekEntryResult!2316)

(assert (=> d!67665 (= c!48526 (and ((_ is Intermediate!2316) lt!149201) (undefined!3128 lt!149201)))))

(assert (=> d!67665 (= lt!149201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67665 (validMask!0 mask!3809)))

(assert (=> d!67665 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!149199)))

(declare-fun b!299985 () Bool)

(assert (=> b!299985 (= e!189457 Undefined!2316)))

(declare-fun b!299986 () Bool)

(declare-fun c!48528 () Bool)

(declare-fun lt!149200 () (_ BitVec 64))

(assert (=> b!299986 (= c!48528 (= lt!149200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189459 () SeekEntryResult!2316)

(declare-fun e!189458 () SeekEntryResult!2316)

(assert (=> b!299986 (= e!189459 e!189458)))

(declare-fun b!299987 () Bool)

(assert (=> b!299987 (= e!189457 e!189459)))

(assert (=> b!299987 (= lt!149200 (select (arr!7167 a!3312) (index!11442 lt!149201)))))

(declare-fun c!48527 () Bool)

(assert (=> b!299987 (= c!48527 (= lt!149200 k0!2524))))

(declare-fun b!299988 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15140 (_ BitVec 32)) SeekEntryResult!2316)

(assert (=> b!299988 (= e!189458 (seekKeyOrZeroReturnVacant!0 (x!29690 lt!149201) (index!11442 lt!149201) (index!11442 lt!149201) k0!2524 a!3312 mask!3809))))

(declare-fun b!299989 () Bool)

(assert (=> b!299989 (= e!189458 (MissingZero!2316 (index!11442 lt!149201)))))

(declare-fun b!299990 () Bool)

(assert (=> b!299990 (= e!189459 (Found!2316 (index!11442 lt!149201)))))

(assert (= (and d!67665 c!48526) b!299985))

(assert (= (and d!67665 (not c!48526)) b!299987))

(assert (= (and b!299987 c!48527) b!299990))

(assert (= (and b!299987 (not c!48527)) b!299986))

(assert (= (and b!299986 c!48528) b!299989))

(assert (= (and b!299986 (not c!48528)) b!299988))

(assert (=> d!67665 m!312031))

(declare-fun m!312097 () Bool)

(assert (=> d!67665 m!312097))

(declare-fun m!312099 () Bool)

(assert (=> d!67665 m!312099))

(assert (=> d!67665 m!312025))

(declare-fun m!312101 () Bool)

(assert (=> d!67665 m!312101))

(assert (=> d!67665 m!312025))

(declare-fun m!312103 () Bool)

(assert (=> d!67665 m!312103))

(declare-fun m!312105 () Bool)

(assert (=> b!299987 m!312105))

(declare-fun m!312107 () Bool)

(assert (=> b!299988 m!312107))

(assert (=> b!299889 d!67665))

(declare-fun b!300069 () Bool)

(declare-fun e!189507 () SeekEntryResult!2316)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300069 (= e!189507 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149153 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15141 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7519 a!3312)) mask!3809))))

(declare-fun b!300070 () Bool)

(assert (=> b!300070 (= e!189507 (Intermediate!2316 false lt!149153 #b00000000000000000000000000000000))))

(declare-fun b!300072 () Bool)

(declare-fun e!189506 () SeekEntryResult!2316)

(assert (=> b!300072 (= e!189506 e!189507)))

(declare-fun c!48556 () Bool)

(declare-fun lt!149236 () (_ BitVec 64))

(assert (=> b!300072 (= c!48556 (or (= lt!149236 k0!2524) (= (bvadd lt!149236 lt!149236) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300073 () Bool)

(declare-fun lt!149235 () SeekEntryResult!2316)

(assert (=> b!300073 (and (bvsge (index!11442 lt!149235) #b00000000000000000000000000000000) (bvslt (index!11442 lt!149235) (size!7519 (array!15141 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7519 a!3312)))))))

(declare-fun e!189508 () Bool)

(assert (=> b!300073 (= e!189508 (= (select (arr!7167 (array!15141 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7519 a!3312))) (index!11442 lt!149235)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300071 () Bool)

(declare-fun e!189509 () Bool)

(declare-fun e!189505 () Bool)

(assert (=> b!300071 (= e!189509 e!189505)))

(declare-fun res!158142 () Bool)

(assert (=> b!300071 (= res!158142 (and ((_ is Intermediate!2316) lt!149235) (not (undefined!3128 lt!149235)) (bvslt (x!29690 lt!149235) #b01111111111111111111111111111110) (bvsge (x!29690 lt!149235) #b00000000000000000000000000000000) (bvsge (x!29690 lt!149235) #b00000000000000000000000000000000)))))

(assert (=> b!300071 (=> (not res!158142) (not e!189505))))

(declare-fun d!67681 () Bool)

(assert (=> d!67681 e!189509))

(declare-fun c!48557 () Bool)

(assert (=> d!67681 (= c!48557 (and ((_ is Intermediate!2316) lt!149235) (undefined!3128 lt!149235)))))

(assert (=> d!67681 (= lt!149235 e!189506)))

(declare-fun c!48558 () Bool)

(assert (=> d!67681 (= c!48558 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67681 (= lt!149236 (select (arr!7167 (array!15141 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7519 a!3312))) lt!149153))))

(assert (=> d!67681 (validMask!0 mask!3809)))

(assert (=> d!67681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149153 k0!2524 (array!15141 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7519 a!3312)) mask!3809) lt!149235)))

(declare-fun b!300074 () Bool)

(assert (=> b!300074 (and (bvsge (index!11442 lt!149235) #b00000000000000000000000000000000) (bvslt (index!11442 lt!149235) (size!7519 (array!15141 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7519 a!3312)))))))

(declare-fun res!158144 () Bool)

(assert (=> b!300074 (= res!158144 (= (select (arr!7167 (array!15141 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7519 a!3312))) (index!11442 lt!149235)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300074 (=> res!158144 e!189508)))

(declare-fun b!300075 () Bool)

(assert (=> b!300075 (= e!189509 (bvsge (x!29690 lt!149235) #b01111111111111111111111111111110))))

(declare-fun b!300076 () Bool)

(assert (=> b!300076 (and (bvsge (index!11442 lt!149235) #b00000000000000000000000000000000) (bvslt (index!11442 lt!149235) (size!7519 (array!15141 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7519 a!3312)))))))

(declare-fun res!158143 () Bool)

(assert (=> b!300076 (= res!158143 (= (select (arr!7167 (array!15141 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7519 a!3312))) (index!11442 lt!149235)) k0!2524))))

(assert (=> b!300076 (=> res!158143 e!189508)))

(assert (=> b!300076 (= e!189505 e!189508)))

(declare-fun b!300077 () Bool)

(assert (=> b!300077 (= e!189506 (Intermediate!2316 true lt!149153 #b00000000000000000000000000000000))))

(assert (= (and d!67681 c!48558) b!300077))

(assert (= (and d!67681 (not c!48558)) b!300072))

(assert (= (and b!300072 c!48556) b!300070))

(assert (= (and b!300072 (not c!48556)) b!300069))

(assert (= (and d!67681 c!48557) b!300075))

(assert (= (and d!67681 (not c!48557)) b!300071))

(assert (= (and b!300071 res!158142) b!300076))

(assert (= (and b!300076 (not res!158143)) b!300074))

(assert (= (and b!300074 (not res!158144)) b!300073))

(declare-fun m!312133 () Bool)

(assert (=> b!300074 m!312133))

(declare-fun m!312135 () Bool)

(assert (=> b!300069 m!312135))

(assert (=> b!300069 m!312135))

(declare-fun m!312137 () Bool)

(assert (=> b!300069 m!312137))

(assert (=> b!300073 m!312133))

(declare-fun m!312139 () Bool)

(assert (=> d!67681 m!312139))

(assert (=> d!67681 m!312031))

(assert (=> b!300076 m!312133))

(assert (=> b!299891 d!67681))

(declare-fun b!300078 () Bool)

(declare-fun e!189512 () SeekEntryResult!2316)

(assert (=> b!300078 (= e!189512 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149153 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!300079 () Bool)

(assert (=> b!300079 (= e!189512 (Intermediate!2316 false lt!149153 #b00000000000000000000000000000000))))

(declare-fun b!300081 () Bool)

(declare-fun e!189511 () SeekEntryResult!2316)

(assert (=> b!300081 (= e!189511 e!189512)))

(declare-fun c!48559 () Bool)

(declare-fun lt!149238 () (_ BitVec 64))

(assert (=> b!300081 (= c!48559 (or (= lt!149238 k0!2524) (= (bvadd lt!149238 lt!149238) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300082 () Bool)

(declare-fun lt!149237 () SeekEntryResult!2316)

(assert (=> b!300082 (and (bvsge (index!11442 lt!149237) #b00000000000000000000000000000000) (bvslt (index!11442 lt!149237) (size!7519 a!3312)))))

(declare-fun e!189513 () Bool)

(assert (=> b!300082 (= e!189513 (= (select (arr!7167 a!3312) (index!11442 lt!149237)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300080 () Bool)

(declare-fun e!189514 () Bool)

(declare-fun e!189510 () Bool)

(assert (=> b!300080 (= e!189514 e!189510)))

(declare-fun res!158145 () Bool)

(assert (=> b!300080 (= res!158145 (and ((_ is Intermediate!2316) lt!149237) (not (undefined!3128 lt!149237)) (bvslt (x!29690 lt!149237) #b01111111111111111111111111111110) (bvsge (x!29690 lt!149237) #b00000000000000000000000000000000) (bvsge (x!29690 lt!149237) #b00000000000000000000000000000000)))))

(assert (=> b!300080 (=> (not res!158145) (not e!189510))))

(declare-fun d!67691 () Bool)

(assert (=> d!67691 e!189514))

(declare-fun c!48560 () Bool)

(assert (=> d!67691 (= c!48560 (and ((_ is Intermediate!2316) lt!149237) (undefined!3128 lt!149237)))))

(assert (=> d!67691 (= lt!149237 e!189511)))

(declare-fun c!48561 () Bool)

(assert (=> d!67691 (= c!48561 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67691 (= lt!149238 (select (arr!7167 a!3312) lt!149153))))

(assert (=> d!67691 (validMask!0 mask!3809)))

(assert (=> d!67691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149153 k0!2524 a!3312 mask!3809) lt!149237)))

(declare-fun b!300083 () Bool)

(assert (=> b!300083 (and (bvsge (index!11442 lt!149237) #b00000000000000000000000000000000) (bvslt (index!11442 lt!149237) (size!7519 a!3312)))))

(declare-fun res!158147 () Bool)

(assert (=> b!300083 (= res!158147 (= (select (arr!7167 a!3312) (index!11442 lt!149237)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300083 (=> res!158147 e!189513)))

(declare-fun b!300084 () Bool)

(assert (=> b!300084 (= e!189514 (bvsge (x!29690 lt!149237) #b01111111111111111111111111111110))))

(declare-fun b!300085 () Bool)

(assert (=> b!300085 (and (bvsge (index!11442 lt!149237) #b00000000000000000000000000000000) (bvslt (index!11442 lt!149237) (size!7519 a!3312)))))

(declare-fun res!158146 () Bool)

(assert (=> b!300085 (= res!158146 (= (select (arr!7167 a!3312) (index!11442 lt!149237)) k0!2524))))

(assert (=> b!300085 (=> res!158146 e!189513)))

(assert (=> b!300085 (= e!189510 e!189513)))

(declare-fun b!300086 () Bool)

(assert (=> b!300086 (= e!189511 (Intermediate!2316 true lt!149153 #b00000000000000000000000000000000))))

(assert (= (and d!67691 c!48561) b!300086))

(assert (= (and d!67691 (not c!48561)) b!300081))

(assert (= (and b!300081 c!48559) b!300079))

(assert (= (and b!300081 (not c!48559)) b!300078))

(assert (= (and d!67691 c!48560) b!300084))

(assert (= (and d!67691 (not c!48560)) b!300080))

(assert (= (and b!300080 res!158145) b!300085))

(assert (= (and b!300085 (not res!158146)) b!300083))

(assert (= (and b!300083 (not res!158147)) b!300082))

(declare-fun m!312143 () Bool)

(assert (=> b!300083 m!312143))

(assert (=> b!300078 m!312135))

(assert (=> b!300078 m!312135))

(declare-fun m!312151 () Bool)

(assert (=> b!300078 m!312151))

(assert (=> b!300082 m!312143))

(declare-fun m!312155 () Bool)

(assert (=> d!67691 m!312155))

(assert (=> d!67691 m!312031))

(assert (=> b!300085 m!312143))

(assert (=> b!299891 d!67691))

(declare-fun d!67695 () Bool)

(declare-fun lt!149253 () (_ BitVec 32))

(declare-fun lt!149252 () (_ BitVec 32))

(assert (=> d!67695 (= lt!149253 (bvmul (bvxor lt!149252 (bvlshr lt!149252 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67695 (= lt!149252 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67695 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158148 (let ((h!5321 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29697 (bvmul (bvxor h!5321 (bvlshr h!5321 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29697 (bvlshr x!29697 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158148 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158148 #b00000000000000000000000000000000))))))

(assert (=> d!67695 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!149253 (bvlshr lt!149253 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299891 d!67695))

(declare-fun d!67697 () Bool)

(assert (=> d!67697 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299890 d!67697))

(declare-fun bm!25843 () Bool)

(declare-fun call!25846 () Bool)

(assert (=> bm!25843 (= call!25846 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!300125 () Bool)

(declare-fun e!189540 () Bool)

(declare-fun e!189541 () Bool)

(assert (=> b!300125 (= e!189540 e!189541)))

(declare-fun lt!149264 () (_ BitVec 64))

(assert (=> b!300125 (= lt!149264 (select (arr!7167 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9359 0))(
  ( (Unit!9360) )
))
(declare-fun lt!149263 () Unit!9359)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15140 (_ BitVec 64) (_ BitVec 32)) Unit!9359)

(assert (=> b!300125 (= lt!149263 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149264 #b00000000000000000000000000000000))))

(assert (=> b!300125 (arrayContainsKey!0 a!3312 lt!149264 #b00000000000000000000000000000000)))

(declare-fun lt!149265 () Unit!9359)

(assert (=> b!300125 (= lt!149265 lt!149263)))

(declare-fun res!158159 () Bool)

(assert (=> b!300125 (= res!158159 (= (seekEntryOrOpen!0 (select (arr!7167 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2316 #b00000000000000000000000000000000)))))

(assert (=> b!300125 (=> (not res!158159) (not e!189541))))

(declare-fun b!300126 () Bool)

(declare-fun e!189539 () Bool)

(assert (=> b!300126 (= e!189539 e!189540)))

(declare-fun c!48576 () Bool)

(assert (=> b!300126 (= c!48576 (validKeyInArray!0 (select (arr!7167 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!300127 () Bool)

(assert (=> b!300127 (= e!189540 call!25846)))

(declare-fun d!67699 () Bool)

(declare-fun res!158160 () Bool)

(assert (=> d!67699 (=> res!158160 e!189539)))

(assert (=> d!67699 (= res!158160 (bvsge #b00000000000000000000000000000000 (size!7519 a!3312)))))

(assert (=> d!67699 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189539)))

(declare-fun b!300128 () Bool)

(assert (=> b!300128 (= e!189541 call!25846)))

(assert (= (and d!67699 (not res!158160)) b!300126))

(assert (= (and b!300126 c!48576) b!300125))

(assert (= (and b!300126 (not c!48576)) b!300127))

(assert (= (and b!300125 res!158159) b!300128))

(assert (= (or b!300128 b!300127) bm!25843))

(declare-fun m!312173 () Bool)

(assert (=> bm!25843 m!312173))

(assert (=> b!300125 m!312063))

(declare-fun m!312175 () Bool)

(assert (=> b!300125 m!312175))

(declare-fun m!312177 () Bool)

(assert (=> b!300125 m!312177))

(assert (=> b!300125 m!312063))

(declare-fun m!312179 () Bool)

(assert (=> b!300125 m!312179))

(assert (=> b!300126 m!312063))

(assert (=> b!300126 m!312063))

(declare-fun m!312181 () Bool)

(assert (=> b!300126 m!312181))

(assert (=> b!299892 d!67699))

(check-sat (not d!67691) (not b!299988) (not b!300069) (not b!299918) (not b!300125) (not b!300078) (not bm!25843) (not b!300126) (not d!67665) (not d!67681))
(check-sat)
