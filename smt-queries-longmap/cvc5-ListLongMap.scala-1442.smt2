; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27816 () Bool)

(assert start!27816)

(declare-fun b!286342 () Bool)

(declare-fun res!148492 () Bool)

(declare-fun e!181438 () Bool)

(assert (=> b!286342 (=> (not res!148492) (not e!181438))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286342 (= res!148492 (validKeyInArray!0 k!2524))))

(declare-fun b!286343 () Bool)

(declare-fun res!148493 () Bool)

(assert (=> b!286343 (=> (not res!148493) (not e!181438))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14337 0))(
  ( (array!14338 (arr!6803 (Array (_ BitVec 32) (_ BitVec 64))) (size!7155 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14337)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286343 (= res!148493 (and (= (size!7155 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7155 a!3312))))))

(declare-fun b!286344 () Bool)

(declare-fun e!181439 () Bool)

(assert (=> b!286344 (= e!181438 e!181439)))

(declare-fun res!148496 () Bool)

(assert (=> b!286344 (=> (not res!148496) (not e!181439))))

(declare-datatypes ((SeekEntryResult!1952 0))(
  ( (MissingZero!1952 (index!9978 (_ BitVec 32))) (Found!1952 (index!9979 (_ BitVec 32))) (Intermediate!1952 (undefined!2764 Bool) (index!9980 (_ BitVec 32)) (x!28200 (_ BitVec 32))) (Undefined!1952) (MissingVacant!1952 (index!9981 (_ BitVec 32))) )
))
(declare-fun lt!141061 () SeekEntryResult!1952)

(assert (=> b!286344 (= res!148496 (or (= lt!141061 (MissingZero!1952 i!1256)) (= lt!141061 (MissingVacant!1952 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14337 (_ BitVec 32)) SeekEntryResult!1952)

(assert (=> b!286344 (= lt!141061 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286345 () Bool)

(declare-fun res!148495 () Bool)

(assert (=> b!286345 (=> (not res!148495) (not e!181439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14337 (_ BitVec 32)) Bool)

(assert (=> b!286345 (= res!148495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286346 () Bool)

(declare-fun res!148497 () Bool)

(assert (=> b!286346 (=> (not res!148497) (not e!181438))))

(declare-fun arrayContainsKey!0 (array!14337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286346 (= res!148497 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286341 () Bool)

(assert (=> b!286341 (= e!181439 (and (bvsge mask!3809 #b00000000000000000000000000000000) (bvsgt mask!3809 #b00111111111111111111111111111111)))))

(declare-fun res!148494 () Bool)

(assert (=> start!27816 (=> (not res!148494) (not e!181438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27816 (= res!148494 (validMask!0 mask!3809))))

(assert (=> start!27816 e!181438))

(assert (=> start!27816 true))

(declare-fun array_inv!4766 (array!14337) Bool)

(assert (=> start!27816 (array_inv!4766 a!3312)))

(assert (= (and start!27816 res!148494) b!286343))

(assert (= (and b!286343 res!148493) b!286342))

(assert (= (and b!286342 res!148492) b!286346))

(assert (= (and b!286346 res!148497) b!286344))

(assert (= (and b!286344 res!148496) b!286345))

(assert (= (and b!286345 res!148495) b!286341))

(declare-fun m!301041 () Bool)

(assert (=> b!286345 m!301041))

(declare-fun m!301043 () Bool)

(assert (=> b!286344 m!301043))

(declare-fun m!301045 () Bool)

(assert (=> start!27816 m!301045))

(declare-fun m!301047 () Bool)

(assert (=> start!27816 m!301047))

(declare-fun m!301049 () Bool)

(assert (=> b!286346 m!301049))

(declare-fun m!301051 () Bool)

(assert (=> b!286342 m!301051))

(push 1)

(assert (not start!27816))

(assert (not b!286344))

(assert (not b!286346))

(assert (not b!286345))

(assert (not b!286342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65957 () Bool)

(declare-fun res!148538 () Bool)

(declare-fun e!181462 () Bool)

(assert (=> d!65957 (=> res!148538 e!181462)))

(assert (=> d!65957 (= res!148538 (= (select (arr!6803 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!65957 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!181462)))

(declare-fun b!286387 () Bool)

(declare-fun e!181463 () Bool)

(assert (=> b!286387 (= e!181462 e!181463)))

(declare-fun res!148539 () Bool)

(assert (=> b!286387 (=> (not res!148539) (not e!181463))))

(assert (=> b!286387 (= res!148539 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7155 a!3312)))))

(declare-fun b!286388 () Bool)

(assert (=> b!286388 (= e!181463 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65957 (not res!148538)) b!286387))

(assert (= (and b!286387 res!148539) b!286388))

(declare-fun m!301077 () Bool)

(assert (=> d!65957 m!301077))

(declare-fun m!301079 () Bool)

(assert (=> b!286388 m!301079))

(assert (=> b!286346 d!65957))

(declare-fun d!65961 () Bool)

(assert (=> d!65961 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27816 d!65961))

(declare-fun d!65963 () Bool)

(assert (=> d!65963 (= (array_inv!4766 a!3312) (bvsge (size!7155 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27816 d!65963))

(declare-fun b!286421 () Bool)

(declare-fun e!181484 () Bool)

(declare-fun e!181482 () Bool)

(assert (=> b!286421 (= e!181484 e!181482)))

(declare-fun c!46494 () Bool)

(assert (=> b!286421 (= c!46494 (validKeyInArray!0 (select (arr!6803 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!286422 () Bool)

(declare-fun e!181483 () Bool)

(assert (=> b!286422 (= e!181482 e!181483)))

(declare-fun lt!141088 () (_ BitVec 64))

(assert (=> b!286422 (= lt!141088 (select (arr!6803 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9050 0))(
  ( (Unit!9051) )
))
(declare-fun lt!141087 () Unit!9050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14337 (_ BitVec 64) (_ BitVec 32)) Unit!9050)

(assert (=> b!286422 (= lt!141087 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141088 #b00000000000000000000000000000000))))

(assert (=> b!286422 (arrayContainsKey!0 a!3312 lt!141088 #b00000000000000000000000000000000)))

(declare-fun lt!141086 () Unit!9050)

(assert (=> b!286422 (= lt!141086 lt!141087)))

(declare-fun res!148544 () Bool)

(assert (=> b!286422 (= res!148544 (= (seekEntryOrOpen!0 (select (arr!6803 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1952 #b00000000000000000000000000000000)))))

(assert (=> b!286422 (=> (not res!148544) (not e!181483))))

(declare-fun b!286423 () Bool)

(declare-fun call!25591 () Bool)

(assert (=> b!286423 (= e!181482 call!25591)))

(declare-fun b!286424 () Bool)

(assert (=> b!286424 (= e!181483 call!25591)))

(declare-fun d!65965 () Bool)

(declare-fun res!148545 () Bool)

(assert (=> d!65965 (=> res!148545 e!181484)))

(assert (=> d!65965 (= res!148545 (bvsge #b00000000000000000000000000000000 (size!7155 a!3312)))))

(assert (=> d!65965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181484)))

(declare-fun bm!25588 () Bool)

(assert (=> bm!25588 (= call!25591 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!65965 (not res!148545)) b!286421))

(assert (= (and b!286421 c!46494) b!286422))

(assert (= (and b!286421 (not c!46494)) b!286423))

(assert (= (and b!286422 res!148544) b!286424))

(assert (= (or b!286424 b!286423) bm!25588))

(assert (=> b!286421 m!301077))

(assert (=> b!286421 m!301077))

(declare-fun m!301081 () Bool)

(assert (=> b!286421 m!301081))

(assert (=> b!286422 m!301077))

(declare-fun m!301083 () Bool)

(assert (=> b!286422 m!301083))

(declare-fun m!301085 () Bool)

(assert (=> b!286422 m!301085))

(assert (=> b!286422 m!301077))

(declare-fun m!301087 () Bool)

(assert (=> b!286422 m!301087))

(declare-fun m!301091 () Bool)

(assert (=> bm!25588 m!301091))

(assert (=> b!286345 d!65965))

(declare-fun b!286465 () Bool)

(declare-fun e!181512 () SeekEntryResult!1952)

(declare-fun lt!141111 () SeekEntryResult!1952)

(assert (=> b!286465 (= e!181512 (MissingZero!1952 (index!9980 lt!141111)))))

(declare-fun b!286466 () Bool)

(declare-fun e!181510 () SeekEntryResult!1952)

(assert (=> b!286466 (= e!181510 Undefined!1952)))

(declare-fun b!286467 () Bool)

(declare-fun e!181511 () SeekEntryResult!1952)

(assert (=> b!286467 (= e!181510 e!181511)))

(declare-fun lt!141112 () (_ BitVec 64))

(assert (=> b!286467 (= lt!141112 (select (arr!6803 a!3312) (index!9980 lt!141111)))))

(declare-fun c!46510 () Bool)

(assert (=> b!286467 (= c!46510 (= lt!141112 k!2524))))

(declare-fun b!286468 () Bool)

(assert (=> b!286468 (= e!181511 (Found!1952 (index!9980 lt!141111)))))

(declare-fun b!286470 () Bool)

(declare-fun c!46511 () Bool)

(assert (=> b!286470 (= c!46511 (= lt!141112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!286470 (= e!181511 e!181512)))

(declare-fun d!65967 () Bool)

(declare-fun lt!141110 () SeekEntryResult!1952)

(assert (=> d!65967 (and (or (is-Undefined!1952 lt!141110) (not (is-Found!1952 lt!141110)) (and (bvsge (index!9979 lt!141110) #b00000000000000000000000000000000) (bvslt (index!9979 lt!141110) (size!7155 a!3312)))) (or (is-Undefined!1952 lt!141110) (is-Found!1952 lt!141110) (not (is-MissingZero!1952 lt!141110)) (and (bvsge (index!9978 lt!141110) #b00000000000000000000000000000000) (bvslt (index!9978 lt!141110) (size!7155 a!3312)))) (or (is-Undefined!1952 lt!141110) (is-Found!1952 lt!141110) (is-MissingZero!1952 lt!141110) (not (is-MissingVacant!1952 lt!141110)) (and (bvsge (index!9981 lt!141110) #b00000000000000000000000000000000) (bvslt (index!9981 lt!141110) (size!7155 a!3312)))) (or (is-Undefined!1952 lt!141110) (ite (is-Found!1952 lt!141110) (= (select (arr!6803 a!3312) (index!9979 lt!141110)) k!2524) (ite (is-MissingZero!1952 lt!141110) (= (select (arr!6803 a!3312) (index!9978 lt!141110)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1952 lt!141110) (= (select (arr!6803 a!3312) (index!9981 lt!141110)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65967 (= lt!141110 e!181510)))

(declare-fun c!46512 () Bool)

(assert (=> d!65967 (= c!46512 (and (is-Intermediate!1952 lt!141111) (undefined!2764 lt!141111)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14337 (_ BitVec 32)) SeekEntryResult!1952)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65967 (= lt!141111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!65967 (validMask!0 mask!3809)))

(assert (=> d!65967 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!141110)))

(declare-fun b!286469 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14337 (_ BitVec 32)) SeekEntryResult!1952)

(assert (=> b!286469 (= e!181512 (seekKeyOrZeroReturnVacant!0 (x!28200 lt!141111) (index!9980 lt!141111) (index!9980 lt!141111) k!2524 a!3312 mask!3809))))

(assert (= (and d!65967 c!46512) b!286466))

(assert (= (and d!65967 (not c!46512)) b!286467))

(assert (= (and b!286467 c!46510) b!286468))

(assert (= (and b!286467 (not c!46510)) b!286470))

(assert (= (and b!286470 c!46511) b!286465))

(assert (= (and b!286470 (not c!46511)) b!286469))

(declare-fun m!301131 () Bool)

(assert (=> b!286467 m!301131))

(declare-fun m!301133 () Bool)

(assert (=> d!65967 m!301133))

(declare-fun m!301135 () Bool)

(assert (=> d!65967 m!301135))

(declare-fun m!301137 () Bool)

(assert (=> d!65967 m!301137))

(assert (=> d!65967 m!301045))

(assert (=> d!65967 m!301133))

(declare-fun m!301139 () Bool)

(assert (=> d!65967 m!301139))

(declare-fun m!301141 () Bool)

(assert (=> d!65967 m!301141))

(declare-fun m!301145 () Bool)

(assert (=> b!286469 m!301145))

(assert (=> b!286344 d!65967))

(declare-fun d!65983 () Bool)

(assert (=> d!65983 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!286342 d!65983))

(push 1)

(assert (not b!286469))

(assert (not b!286388))

(assert (not b!286422))

(assert (not d!65967))

(assert (not bm!25588))

(assert (not b!286421))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

