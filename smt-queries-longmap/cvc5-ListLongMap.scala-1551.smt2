; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29332 () Bool)

(assert start!29332)

(declare-fun b!297211 () Bool)

(declare-fun e!187832 () Bool)

(declare-fun e!187834 () Bool)

(assert (=> b!297211 (= e!187832 e!187834)))

(declare-fun res!156738 () Bool)

(assert (=> b!297211 (=> (not res!156738) (not e!187834))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2279 0))(
  ( (MissingZero!2279 (index!11286 (_ BitVec 32))) (Found!2279 (index!11287 (_ BitVec 32))) (Intermediate!2279 (undefined!3091 Bool) (index!11288 (_ BitVec 32)) (x!29503 (_ BitVec 32))) (Undefined!2279) (MissingVacant!2279 (index!11289 (_ BitVec 32))) )
))
(declare-fun lt!147693 () SeekEntryResult!2279)

(declare-fun lt!147691 () Bool)

(assert (=> b!297211 (= res!156738 (or lt!147691 (= lt!147693 (MissingVacant!2279 i!1256))))))

(assert (=> b!297211 (= lt!147691 (= lt!147693 (MissingZero!2279 i!1256)))))

(declare-datatypes ((array!15045 0))(
  ( (array!15046 (arr!7130 (Array (_ BitVec 32) (_ BitVec 64))) (size!7482 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15045)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15045 (_ BitVec 32)) SeekEntryResult!2279)

(assert (=> b!297211 (= lt!147693 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297212 () Bool)

(declare-fun res!156739 () Bool)

(assert (=> b!297212 (=> (not res!156739) (not e!187832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297212 (= res!156739 (validKeyInArray!0 k!2524))))

(declare-fun b!297213 () Bool)

(declare-fun res!156736 () Bool)

(assert (=> b!297213 (=> (not res!156736) (not e!187832))))

(declare-fun arrayContainsKey!0 (array!15045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297213 (= res!156736 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297214 () Bool)

(declare-fun res!156741 () Bool)

(assert (=> b!297214 (=> (not res!156741) (not e!187834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15045 (_ BitVec 32)) Bool)

(assert (=> b!297214 (= res!156741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297215 () Bool)

(declare-fun lt!147689 () SeekEntryResult!2279)

(assert (=> b!297215 (= e!187834 (and lt!147691 (not (is-Intermediate!2279 lt!147689))))))

(declare-fun lt!147690 () (_ BitVec 32))

(declare-fun lt!147692 () SeekEntryResult!2279)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15045 (_ BitVec 32)) SeekEntryResult!2279)

(assert (=> b!297215 (= lt!147692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147690 k!2524 (array!15046 (store (arr!7130 a!3312) i!1256 k!2524) (size!7482 a!3312)) mask!3809))))

(assert (=> b!297215 (= lt!147689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147690 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297215 (= lt!147690 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297210 () Bool)

(declare-fun res!156737 () Bool)

(assert (=> b!297210 (=> (not res!156737) (not e!187832))))

(assert (=> b!297210 (= res!156737 (and (= (size!7482 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7482 a!3312))))))

(declare-fun res!156740 () Bool)

(assert (=> start!29332 (=> (not res!156740) (not e!187832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29332 (= res!156740 (validMask!0 mask!3809))))

(assert (=> start!29332 e!187832))

(assert (=> start!29332 true))

(declare-fun array_inv!5093 (array!15045) Bool)

(assert (=> start!29332 (array_inv!5093 a!3312)))

(assert (= (and start!29332 res!156740) b!297210))

(assert (= (and b!297210 res!156737) b!297212))

(assert (= (and b!297212 res!156739) b!297213))

(assert (= (and b!297213 res!156736) b!297211))

(assert (= (and b!297211 res!156738) b!297214))

(assert (= (and b!297214 res!156741) b!297215))

(declare-fun m!310041 () Bool)

(assert (=> b!297211 m!310041))

(declare-fun m!310043 () Bool)

(assert (=> b!297213 m!310043))

(declare-fun m!310045 () Bool)

(assert (=> b!297212 m!310045))

(declare-fun m!310047 () Bool)

(assert (=> b!297214 m!310047))

(declare-fun m!310049 () Bool)

(assert (=> b!297215 m!310049))

(declare-fun m!310051 () Bool)

(assert (=> b!297215 m!310051))

(declare-fun m!310053 () Bool)

(assert (=> b!297215 m!310053))

(declare-fun m!310055 () Bool)

(assert (=> b!297215 m!310055))

(declare-fun m!310057 () Bool)

(assert (=> start!29332 m!310057))

(declare-fun m!310059 () Bool)

(assert (=> start!29332 m!310059))

(push 1)

(assert (not b!297214))

(assert (not b!297211))

(assert (not b!297213))

(assert (not b!297212))

(assert (not start!29332))

(assert (not b!297215))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!297320 () Bool)

(declare-fun e!187896 () SeekEntryResult!2279)

(assert (=> b!297320 (= e!187896 (Intermediate!2279 true lt!147690 #b00000000000000000000000000000000))))

(declare-fun b!297321 () Bool)

(declare-fun e!187897 () SeekEntryResult!2279)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297321 (= e!187897 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147690 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15046 (store (arr!7130 a!3312) i!1256 k!2524) (size!7482 a!3312)) mask!3809))))

(declare-fun b!297322 () Bool)

(declare-fun e!187899 () Bool)

(declare-fun lt!147742 () SeekEntryResult!2279)

(assert (=> b!297322 (= e!187899 (bvsge (x!29503 lt!147742) #b01111111111111111111111111111110))))

(declare-fun b!297323 () Bool)

(declare-fun e!187898 () Bool)

(assert (=> b!297323 (= e!187899 e!187898)))

(declare-fun res!156807 () Bool)

(assert (=> b!297323 (= res!156807 (and (is-Intermediate!2279 lt!147742) (not (undefined!3091 lt!147742)) (bvslt (x!29503 lt!147742) #b01111111111111111111111111111110) (bvsge (x!29503 lt!147742) #b00000000000000000000000000000000) (bvsge (x!29503 lt!147742) #b00000000000000000000000000000000)))))

(assert (=> b!297323 (=> (not res!156807) (not e!187898))))

(declare-fun d!67165 () Bool)

(assert (=> d!67165 e!187899))

(declare-fun c!47839 () Bool)

(assert (=> d!67165 (= c!47839 (and (is-Intermediate!2279 lt!147742) (undefined!3091 lt!147742)))))

(assert (=> d!67165 (= lt!147742 e!187896)))

(declare-fun c!47840 () Bool)

(assert (=> d!67165 (= c!47840 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147743 () (_ BitVec 64))

(assert (=> d!67165 (= lt!147743 (select (arr!7130 (array!15046 (store (arr!7130 a!3312) i!1256 k!2524) (size!7482 a!3312))) lt!147690))))

(assert (=> d!67165 (validMask!0 mask!3809)))

(assert (=> d!67165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147690 k!2524 (array!15046 (store (arr!7130 a!3312) i!1256 k!2524) (size!7482 a!3312)) mask!3809) lt!147742)))

(declare-fun b!297324 () Bool)

(assert (=> b!297324 (= e!187896 e!187897)))

(declare-fun c!47838 () Bool)

(assert (=> b!297324 (= c!47838 (or (= lt!147743 k!2524) (= (bvadd lt!147743 lt!147743) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297325 () Bool)

(assert (=> b!297325 (and (bvsge (index!11288 lt!147742) #b00000000000000000000000000000000) (bvslt (index!11288 lt!147742) (size!7482 (array!15046 (store (arr!7130 a!3312) i!1256 k!2524) (size!7482 a!3312)))))))

(declare-fun e!187895 () Bool)

(assert (=> b!297325 (= e!187895 (= (select (arr!7130 (array!15046 (store (arr!7130 a!3312) i!1256 k!2524) (size!7482 a!3312))) (index!11288 lt!147742)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297326 () Bool)

(assert (=> b!297326 (and (bvsge (index!11288 lt!147742) #b00000000000000000000000000000000) (bvslt (index!11288 lt!147742) (size!7482 (array!15046 (store (arr!7130 a!3312) i!1256 k!2524) (size!7482 a!3312)))))))

(declare-fun res!156808 () Bool)

(assert (=> b!297326 (= res!156808 (= (select (arr!7130 (array!15046 (store (arr!7130 a!3312) i!1256 k!2524) (size!7482 a!3312))) (index!11288 lt!147742)) k!2524))))

(assert (=> b!297326 (=> res!156808 e!187895)))

(assert (=> b!297326 (= e!187898 e!187895)))

(declare-fun b!297327 () Bool)

(assert (=> b!297327 (and (bvsge (index!11288 lt!147742) #b00000000000000000000000000000000) (bvslt (index!11288 lt!147742) (size!7482 (array!15046 (store (arr!7130 a!3312) i!1256 k!2524) (size!7482 a!3312)))))))

(declare-fun res!156809 () Bool)

(assert (=> b!297327 (= res!156809 (= (select (arr!7130 (array!15046 (store (arr!7130 a!3312) i!1256 k!2524) (size!7482 a!3312))) (index!11288 lt!147742)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297327 (=> res!156809 e!187895)))

(declare-fun b!297328 () Bool)

(assert (=> b!297328 (= e!187897 (Intermediate!2279 false lt!147690 #b00000000000000000000000000000000))))

(assert (= (and d!67165 c!47840) b!297320))

(assert (= (and d!67165 (not c!47840)) b!297324))

(assert (= (and b!297324 c!47838) b!297328))

(assert (= (and b!297324 (not c!47838)) b!297321))

(assert (= (and d!67165 c!47839) b!297322))

(assert (= (and d!67165 (not c!47839)) b!297323))

(assert (= (and b!297323 res!156807) b!297326))

(assert (= (and b!297326 (not res!156808)) b!297327))

(assert (= (and b!297327 (not res!156809)) b!297325))

(declare-fun m!310119 () Bool)

(assert (=> d!67165 m!310119))

(assert (=> d!67165 m!310057))

(declare-fun m!310125 () Bool)

(assert (=> b!297325 m!310125))

(assert (=> b!297327 m!310125))

(declare-fun m!310129 () Bool)

(assert (=> b!297321 m!310129))

(assert (=> b!297321 m!310129))

(declare-fun m!310133 () Bool)

(assert (=> b!297321 m!310133))

(assert (=> b!297326 m!310125))

(assert (=> b!297215 d!67165))

(declare-fun b!297333 () Bool)

(declare-fun e!187904 () SeekEntryResult!2279)

(assert (=> b!297333 (= e!187904 (Intermediate!2279 true lt!147690 #b00000000000000000000000000000000))))

(declare-fun e!187905 () SeekEntryResult!2279)

(declare-fun b!297334 () Bool)

(assert (=> b!297334 (= e!187905 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147690 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!297335 () Bool)

(declare-fun e!187907 () Bool)

(declare-fun lt!147747 () SeekEntryResult!2279)

(assert (=> b!297335 (= e!187907 (bvsge (x!29503 lt!147747) #b01111111111111111111111111111110))))

(declare-fun b!297336 () Bool)

(declare-fun e!187906 () Bool)

(assert (=> b!297336 (= e!187907 e!187906)))

(declare-fun res!156812 () Bool)

(assert (=> b!297336 (= res!156812 (and (is-Intermediate!2279 lt!147747) (not (undefined!3091 lt!147747)) (bvslt (x!29503 lt!147747) #b01111111111111111111111111111110) (bvsge (x!29503 lt!147747) #b00000000000000000000000000000000) (bvsge (x!29503 lt!147747) #b00000000000000000000000000000000)))))

(assert (=> b!297336 (=> (not res!156812) (not e!187906))))

(declare-fun d!67179 () Bool)

(assert (=> d!67179 e!187907))

(declare-fun c!47843 () Bool)

(assert (=> d!67179 (= c!47843 (and (is-Intermediate!2279 lt!147747) (undefined!3091 lt!147747)))))

(assert (=> d!67179 (= lt!147747 e!187904)))

(declare-fun c!47844 () Bool)

(assert (=> d!67179 (= c!47844 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147748 () (_ BitVec 64))

(assert (=> d!67179 (= lt!147748 (select (arr!7130 a!3312) lt!147690))))

(assert (=> d!67179 (validMask!0 mask!3809)))

(assert (=> d!67179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147690 k!2524 a!3312 mask!3809) lt!147747)))

(declare-fun b!297337 () Bool)

(assert (=> b!297337 (= e!187904 e!187905)))

(declare-fun c!47842 () Bool)

(assert (=> b!297337 (= c!47842 (or (= lt!147748 k!2524) (= (bvadd lt!147748 lt!147748) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297338 () Bool)

(assert (=> b!297338 (and (bvsge (index!11288 lt!147747) #b00000000000000000000000000000000) (bvslt (index!11288 lt!147747) (size!7482 a!3312)))))

(declare-fun e!187903 () Bool)

(assert (=> b!297338 (= e!187903 (= (select (arr!7130 a!3312) (index!11288 lt!147747)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297339 () Bool)

(assert (=> b!297339 (and (bvsge (index!11288 lt!147747) #b00000000000000000000000000000000) (bvslt (index!11288 lt!147747) (size!7482 a!3312)))))

(declare-fun res!156813 () Bool)

(assert (=> b!297339 (= res!156813 (= (select (arr!7130 a!3312) (index!11288 lt!147747)) k!2524))))

(assert (=> b!297339 (=> res!156813 e!187903)))

(assert (=> b!297339 (= e!187906 e!187903)))

(declare-fun b!297340 () Bool)

(assert (=> b!297340 (and (bvsge (index!11288 lt!147747) #b00000000000000000000000000000000) (bvslt (index!11288 lt!147747) (size!7482 a!3312)))))

(declare-fun res!156814 () Bool)

(assert (=> b!297340 (= res!156814 (= (select (arr!7130 a!3312) (index!11288 lt!147747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297340 (=> res!156814 e!187903)))

(declare-fun b!297341 () Bool)

(assert (=> b!297341 (= e!187905 (Intermediate!2279 false lt!147690 #b00000000000000000000000000000000))))

(assert (= (and d!67179 c!47844) b!297333))

(assert (= (and d!67179 (not c!47844)) b!297337))

(assert (= (and b!297337 c!47842) b!297341))

(assert (= (and b!297337 (not c!47842)) b!297334))

(assert (= (and d!67179 c!47843) b!297335))

(assert (= (and d!67179 (not c!47843)) b!297336))

(assert (= (and b!297336 res!156812) b!297339))

(assert (= (and b!297339 (not res!156813)) b!297340))

(assert (= (and b!297340 (not res!156814)) b!297338))

(declare-fun m!310137 () Bool)

(assert (=> d!67179 m!310137))

(assert (=> d!67179 m!310057))

(declare-fun m!310139 () Bool)

(assert (=> b!297338 m!310139))

(assert (=> b!297340 m!310139))

(assert (=> b!297334 m!310129))

(assert (=> b!297334 m!310129))

(declare-fun m!310141 () Bool)

(assert (=> b!297334 m!310141))

(assert (=> b!297339 m!310139))

(assert (=> b!297215 d!67179))

(declare-fun d!67181 () Bool)

(declare-fun lt!147760 () (_ BitVec 32))

(declare-fun lt!147759 () (_ BitVec 32))

(assert (=> d!67181 (= lt!147760 (bvmul (bvxor lt!147759 (bvlshr lt!147759 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67181 (= lt!147759 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67181 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156815 (let ((h!5299 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29509 (bvmul (bvxor h!5299 (bvlshr h!5299 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29509 (bvlshr x!29509 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156815 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156815 #b00000000000000000000000000000000))))))

(assert (=> d!67181 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!147760 (bvlshr lt!147760 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!297215 d!67181))

(declare-fun bm!25759 () Bool)

(declare-fun call!25762 () Bool)

(assert (=> bm!25759 (= call!25762 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!297368 () Bool)

(declare-fun e!187929 () Bool)

(declare-fun e!187930 () Bool)

(assert (=> b!297368 (= e!187929 e!187930)))

(declare-fun lt!147777 () (_ BitVec 64))

(assert (=> b!297368 (= lt!147777 (select (arr!7130 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9260 0))(
  ( (Unit!9261) )
))
(declare-fun lt!147778 () Unit!9260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15045 (_ BitVec 64) (_ BitVec 32)) Unit!9260)

(assert (=> b!297368 (= lt!147778 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147777 #b00000000000000000000000000000000))))

(assert (=> b!297368 (arrayContainsKey!0 a!3312 lt!147777 #b00000000000000000000000000000000)))

(declare-fun lt!147776 () Unit!9260)

(assert (=> b!297368 (= lt!147776 lt!147778)))

(declare-fun res!156832 () Bool)

(assert (=> b!297368 (= res!156832 (= (seekEntryOrOpen!0 (select (arr!7130 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2279 #b00000000000000000000000000000000)))))

(assert (=> b!297368 (=> (not res!156832) (not e!187930))))

(declare-fun b!297369 () Bool)

(assert (=> b!297369 (= e!187929 call!25762)))

(declare-fun d!67187 () Bool)

(declare-fun res!156833 () Bool)

(declare-fun e!187931 () Bool)

(assert (=> d!67187 (=> res!156833 e!187931)))

(assert (=> d!67187 (= res!156833 (bvsge #b00000000000000000000000000000000 (size!7482 a!3312)))))

(assert (=> d!67187 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187931)))

(declare-fun b!297370 () Bool)

(assert (=> b!297370 (= e!187931 e!187929)))

(declare-fun c!47850 () Bool)

(assert (=> b!297370 (= c!47850 (validKeyInArray!0 (select (arr!7130 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!297371 () Bool)

(assert (=> b!297371 (= e!187930 call!25762)))

(assert (= (and d!67187 (not res!156833)) b!297370))

(assert (= (and b!297370 c!47850) b!297368))

(assert (= (and b!297370 (not c!47850)) b!297369))

(assert (= (and b!297368 res!156832) b!297371))

(assert (= (or b!297371 b!297369) bm!25759))

(declare-fun m!310157 () Bool)

(assert (=> bm!25759 m!310157))

(declare-fun m!310159 () Bool)

(assert (=> b!297368 m!310159))

(declare-fun m!310161 () Bool)

(assert (=> b!297368 m!310161))

(declare-fun m!310163 () Bool)

(assert (=> b!297368 m!310163))

(assert (=> b!297368 m!310159))

(declare-fun m!310165 () Bool)

(assert (=> b!297368 m!310165))

(assert (=> b!297370 m!310159))

(assert (=> b!297370 m!310159))

(declare-fun m!310167 () Bool)

(assert (=> b!297370 m!310167))

(assert (=> b!297214 d!67187))

(declare-fun d!67197 () Bool)

(assert (=> d!67197 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29332 d!67197))

(declare-fun d!67199 () Bool)

(assert (=> d!67199 (= (array_inv!5093 a!3312) (bvsge (size!7482 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29332 d!67199))

(declare-fun d!67201 () Bool)

(declare-fun res!156844 () Bool)

(declare-fun e!187946 () Bool)

(assert (=> d!67201 (=> res!156844 e!187946)))

(assert (=> d!67201 (= res!156844 (= (select (arr!7130 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67201 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!187946)))

(declare-fun b!297394 () Bool)

(declare-fun e!187947 () Bool)

(assert (=> b!297394 (= e!187946 e!187947)))

(declare-fun res!156845 () Bool)

(assert (=> b!297394 (=> (not res!156845) (not e!187947))))

(assert (=> b!297394 (= res!156845 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7482 a!3312)))))

(declare-fun b!297395 () Bool)

(assert (=> b!297395 (= e!187947 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67201 (not res!156844)) b!297394))

(assert (= (and b!297394 res!156845) b!297395))

(assert (=> d!67201 m!310159))

(declare-fun m!310169 () Bool)

(assert (=> b!297395 m!310169))

(assert (=> b!297213 d!67201))

(declare-fun d!67203 () Bool)

(assert (=> d!67203 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!297212 d!67203))

(declare-fun b!297444 () Bool)

(declare-fun e!187974 () SeekEntryResult!2279)

(declare-fun lt!147810 () SeekEntryResult!2279)

(assert (=> b!297444 (= e!187974 (MissingZero!2279 (index!11288 lt!147810)))))

(declare-fun d!67205 () Bool)

(declare-fun lt!147809 () SeekEntryResult!2279)

(assert (=> d!67205 (and (or (is-Undefined!2279 lt!147809) (not (is-Found!2279 lt!147809)) (and (bvsge (index!11287 lt!147809) #b00000000000000000000000000000000) (bvslt (index!11287 lt!147809) (size!7482 a!3312)))) (or (is-Undefined!2279 lt!147809) (is-Found!2279 lt!147809) (not (is-MissingZero!2279 lt!147809)) (and (bvsge (index!11286 lt!147809) #b00000000000000000000000000000000) (bvslt (index!11286 lt!147809) (size!7482 a!3312)))) (or (is-Undefined!2279 lt!147809) (is-Found!2279 lt!147809) (is-MissingZero!2279 lt!147809) (not (is-MissingVacant!2279 lt!147809)) (and (bvsge (index!11289 lt!147809) #b00000000000000000000000000000000) (bvslt (index!11289 lt!147809) (size!7482 a!3312)))) (or (is-Undefined!2279 lt!147809) (ite (is-Found!2279 lt!147809) (= (select (arr!7130 a!3312) (index!11287 lt!147809)) k!2524) (ite (is-MissingZero!2279 lt!147809) (= (select (arr!7130 a!3312) (index!11286 lt!147809)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2279 lt!147809) (= (select (arr!7130 a!3312) (index!11289 lt!147809)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!187975 () SeekEntryResult!2279)

(assert (=> d!67205 (= lt!147809 e!187975)))

(declare-fun c!47880 () Bool)

(assert (=> d!67205 (= c!47880 (and (is-Intermediate!2279 lt!147810) (undefined!3091 lt!147810)))))

(assert (=> d!67205 (= lt!147810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67205 (validMask!0 mask!3809)))

(assert (=> d!67205 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!147809)))

(declare-fun b!297445 () Bool)

(declare-fun c!47879 () Bool)

(declare-fun lt!147808 () (_ BitVec 64))

(assert (=> b!297445 (= c!47879 (= lt!147808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187973 () SeekEntryResult!2279)

(assert (=> b!297445 (= e!187973 e!187974)))

(declare-fun b!297446 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15045 (_ BitVec 32)) SeekEntryResult!2279)

(assert (=> b!297446 (= e!187974 (seekKeyOrZeroReturnVacant!0 (x!29503 lt!147810) (index!11288 lt!147810) (index!11288 lt!147810) k!2524 a!3312 mask!3809))))

(declare-fun b!297447 () Bool)

(assert (=> b!297447 (= e!187975 Undefined!2279)))

(declare-fun b!297448 () Bool)

(assert (=> b!297448 (= e!187973 (Found!2279 (index!11288 lt!147810)))))

(declare-fun b!297449 () Bool)

(assert (=> b!297449 (= e!187975 e!187973)))

(assert (=> b!297449 (= lt!147808 (select (arr!7130 a!3312) (index!11288 lt!147810)))))

(declare-fun c!47878 () Bool)

(assert (=> b!297449 (= c!47878 (= lt!147808 k!2524))))

(assert (= (and d!67205 c!47880) b!297447))

(assert (= (and d!67205 (not c!47880)) b!297449))

(assert (= (and b!297449 c!47878) b!297448))

(assert (= (and b!297449 (not c!47878)) b!297445))

(assert (= (and b!297445 c!47879) b!297444))

(assert (= (and b!297445 (not c!47879)) b!297446))

(declare-fun m!310197 () Bool)

(assert (=> d!67205 m!310197))

(assert (=> d!67205 m!310055))

(declare-fun m!310199 () Bool)

(assert (=> d!67205 m!310199))

(assert (=> d!67205 m!310055))

(declare-fun m!310201 () Bool)

(assert (=> d!67205 m!310201))

(assert (=> d!67205 m!310057))

(declare-fun m!310203 () Bool)

(assert (=> d!67205 m!310203))

(declare-fun m!310205 () Bool)

(assert (=> b!297446 m!310205))

(declare-fun m!310207 () Bool)

(assert (=> b!297449 m!310207))

(assert (=> b!297211 d!67205))

(push 1)

