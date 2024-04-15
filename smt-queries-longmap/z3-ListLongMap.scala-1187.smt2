; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25466 () Bool)

(assert start!25466)

(declare-fun b!264879 () Bool)

(declare-fun res!129443 () Bool)

(declare-fun e!171538 () Bool)

(assert (=> b!264879 (=> (not res!129443) (not e!171538))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264879 (= res!129443 (validKeyInArray!0 k0!2698))))

(declare-fun res!129446 () Bool)

(assert (=> start!25466 (=> (not res!129446) (not e!171538))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25466 (= res!129446 (validMask!0 mask!4002))))

(assert (=> start!25466 e!171538))

(assert (=> start!25466 true))

(declare-datatypes ((array!12750 0))(
  ( (array!12751 (arr!6033 (Array (_ BitVec 32) (_ BitVec 64))) (size!6386 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12750)

(declare-fun array_inv!4005 (array!12750) Bool)

(assert (=> start!25466 (array_inv!4005 a!3436)))

(declare-fun b!264880 () Bool)

(declare-fun res!129447 () Bool)

(declare-fun e!171539 () Bool)

(assert (=> b!264880 (=> (not res!129447) (not e!171539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12750 (_ BitVec 32)) Bool)

(assert (=> b!264880 (= res!129447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!264881 () Bool)

(declare-fun res!129444 () Bool)

(assert (=> b!264881 (=> (not res!129444) (not e!171538))))

(declare-fun arrayContainsKey!0 (array!12750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264881 (= res!129444 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264882 () Bool)

(assert (=> b!264882 (= e!171538 e!171539)))

(declare-fun res!129445 () Bool)

(assert (=> b!264882 (=> (not res!129445) (not e!171539))))

(declare-datatypes ((SeekEntryResult!1223 0))(
  ( (MissingZero!1223 (index!7062 (_ BitVec 32))) (Found!1223 (index!7063 (_ BitVec 32))) (Intermediate!1223 (undefined!2035 Bool) (index!7064 (_ BitVec 32)) (x!25403 (_ BitVec 32))) (Undefined!1223) (MissingVacant!1223 (index!7065 (_ BitVec 32))) )
))
(declare-fun lt!133779 () SeekEntryResult!1223)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264882 (= res!129445 (or (= lt!133779 (MissingZero!1223 i!1355)) (= lt!133779 (MissingVacant!1223 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12750 (_ BitVec 32)) SeekEntryResult!1223)

(assert (=> b!264882 (= lt!133779 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!264883 () Bool)

(assert (=> b!264883 (= e!171539 (and (bvsle #b00000000000000000000000000000000 (size!6386 a!3436)) (bvsge (size!6386 a!3436) #b01111111111111111111111111111111)))))

(declare-fun b!264884 () Bool)

(declare-fun res!129448 () Bool)

(assert (=> b!264884 (=> (not res!129448) (not e!171538))))

(assert (=> b!264884 (= res!129448 (and (= (size!6386 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6386 a!3436))))))

(assert (= (and start!25466 res!129446) b!264884))

(assert (= (and b!264884 res!129448) b!264879))

(assert (= (and b!264879 res!129443) b!264881))

(assert (= (and b!264881 res!129444) b!264882))

(assert (= (and b!264882 res!129445) b!264880))

(assert (= (and b!264880 res!129447) b!264883))

(declare-fun m!281345 () Bool)

(assert (=> b!264879 m!281345))

(declare-fun m!281347 () Bool)

(assert (=> b!264880 m!281347))

(declare-fun m!281349 () Bool)

(assert (=> b!264881 m!281349))

(declare-fun m!281351 () Bool)

(assert (=> start!25466 m!281351))

(declare-fun m!281353 () Bool)

(assert (=> start!25466 m!281353))

(declare-fun m!281355 () Bool)

(assert (=> b!264882 m!281355))

(check-sat (not b!264879) (not b!264880) (not b!264881) (not b!264882) (not start!25466))
(check-sat)
(get-model)

(declare-fun d!63957 () Bool)

(declare-fun lt!133802 () SeekEntryResult!1223)

(get-info :version)

(assert (=> d!63957 (and (or ((_ is Undefined!1223) lt!133802) (not ((_ is Found!1223) lt!133802)) (and (bvsge (index!7063 lt!133802) #b00000000000000000000000000000000) (bvslt (index!7063 lt!133802) (size!6386 a!3436)))) (or ((_ is Undefined!1223) lt!133802) ((_ is Found!1223) lt!133802) (not ((_ is MissingZero!1223) lt!133802)) (and (bvsge (index!7062 lt!133802) #b00000000000000000000000000000000) (bvslt (index!7062 lt!133802) (size!6386 a!3436)))) (or ((_ is Undefined!1223) lt!133802) ((_ is Found!1223) lt!133802) ((_ is MissingZero!1223) lt!133802) (not ((_ is MissingVacant!1223) lt!133802)) (and (bvsge (index!7065 lt!133802) #b00000000000000000000000000000000) (bvslt (index!7065 lt!133802) (size!6386 a!3436)))) (or ((_ is Undefined!1223) lt!133802) (ite ((_ is Found!1223) lt!133802) (= (select (arr!6033 a!3436) (index!7063 lt!133802)) k0!2698) (ite ((_ is MissingZero!1223) lt!133802) (= (select (arr!6033 a!3436) (index!7062 lt!133802)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1223) lt!133802) (= (select (arr!6033 a!3436) (index!7065 lt!133802)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!171581 () SeekEntryResult!1223)

(assert (=> d!63957 (= lt!133802 e!171581)))

(declare-fun c!45278 () Bool)

(declare-fun lt!133803 () SeekEntryResult!1223)

(assert (=> d!63957 (= c!45278 (and ((_ is Intermediate!1223) lt!133803) (undefined!2035 lt!133803)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12750 (_ BitVec 32)) SeekEntryResult!1223)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!63957 (= lt!133803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2698 mask!4002) k0!2698 a!3436 mask!4002))))

(assert (=> d!63957 (validMask!0 mask!4002)))

(assert (=> d!63957 (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) lt!133802)))

(declare-fun b!264951 () Bool)

(declare-fun e!171582 () SeekEntryResult!1223)

(assert (=> b!264951 (= e!171582 (MissingZero!1223 (index!7064 lt!133803)))))

(declare-fun b!264952 () Bool)

(declare-fun e!171580 () SeekEntryResult!1223)

(assert (=> b!264952 (= e!171581 e!171580)))

(declare-fun lt!133801 () (_ BitVec 64))

(assert (=> b!264952 (= lt!133801 (select (arr!6033 a!3436) (index!7064 lt!133803)))))

(declare-fun c!45280 () Bool)

(assert (=> b!264952 (= c!45280 (= lt!133801 k0!2698))))

(declare-fun b!264953 () Bool)

(assert (=> b!264953 (= e!171581 Undefined!1223)))

(declare-fun b!264954 () Bool)

(declare-fun c!45279 () Bool)

(assert (=> b!264954 (= c!45279 (= lt!133801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264954 (= e!171580 e!171582)))

(declare-fun b!264955 () Bool)

(assert (=> b!264955 (= e!171580 (Found!1223 (index!7064 lt!133803)))))

(declare-fun b!264956 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12750 (_ BitVec 32)) SeekEntryResult!1223)

(assert (=> b!264956 (= e!171582 (seekKeyOrZeroReturnVacant!0 (x!25403 lt!133803) (index!7064 lt!133803) (index!7064 lt!133803) k0!2698 a!3436 mask!4002))))

(assert (= (and d!63957 c!45278) b!264953))

(assert (= (and d!63957 (not c!45278)) b!264952))

(assert (= (and b!264952 c!45280) b!264955))

(assert (= (and b!264952 (not c!45280)) b!264954))

(assert (= (and b!264954 c!45279) b!264951))

(assert (= (and b!264954 (not c!45279)) b!264956))

(declare-fun m!281397 () Bool)

(assert (=> d!63957 m!281397))

(declare-fun m!281399 () Bool)

(assert (=> d!63957 m!281399))

(declare-fun m!281401 () Bool)

(assert (=> d!63957 m!281401))

(declare-fun m!281403 () Bool)

(assert (=> d!63957 m!281403))

(assert (=> d!63957 m!281351))

(assert (=> d!63957 m!281401))

(declare-fun m!281405 () Bool)

(assert (=> d!63957 m!281405))

(declare-fun m!281407 () Bool)

(assert (=> b!264952 m!281407))

(declare-fun m!281409 () Bool)

(assert (=> b!264956 m!281409))

(assert (=> b!264882 d!63957))

(declare-fun d!63971 () Bool)

(declare-fun res!129501 () Bool)

(declare-fun e!171587 () Bool)

(assert (=> d!63971 (=> res!129501 e!171587)))

(assert (=> d!63971 (= res!129501 (= (select (arr!6033 a!3436) #b00000000000000000000000000000000) k0!2698))))

(assert (=> d!63971 (= (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000) e!171587)))

(declare-fun b!264961 () Bool)

(declare-fun e!171588 () Bool)

(assert (=> b!264961 (= e!171587 e!171588)))

(declare-fun res!129502 () Bool)

(assert (=> b!264961 (=> (not res!129502) (not e!171588))))

(assert (=> b!264961 (= res!129502 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6386 a!3436)))))

(declare-fun b!264962 () Bool)

(assert (=> b!264962 (= e!171588 (arrayContainsKey!0 a!3436 k0!2698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63971 (not res!129501)) b!264961))

(assert (= (and b!264961 res!129502) b!264962))

(declare-fun m!281411 () Bool)

(assert (=> d!63971 m!281411))

(declare-fun m!281413 () Bool)

(assert (=> b!264962 m!281413))

(assert (=> b!264881 d!63971))

(declare-fun b!265001 () Bool)

(declare-fun e!171611 () Bool)

(declare-fun e!171612 () Bool)

(assert (=> b!265001 (= e!171611 e!171612)))

(declare-fun lt!133825 () (_ BitVec 64))

(assert (=> b!265001 (= lt!133825 (select (arr!6033 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8209 0))(
  ( (Unit!8210) )
))
(declare-fun lt!133826 () Unit!8209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12750 (_ BitVec 64) (_ BitVec 32)) Unit!8209)

(assert (=> b!265001 (= lt!133826 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!133825 #b00000000000000000000000000000000))))

(assert (=> b!265001 (arrayContainsKey!0 a!3436 lt!133825 #b00000000000000000000000000000000)))

(declare-fun lt!133827 () Unit!8209)

(assert (=> b!265001 (= lt!133827 lt!133826)))

(declare-fun res!129507 () Bool)

(assert (=> b!265001 (= res!129507 (= (seekEntryOrOpen!0 (select (arr!6033 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1223 #b00000000000000000000000000000000)))))

(assert (=> b!265001 (=> (not res!129507) (not e!171612))))

(declare-fun d!63973 () Bool)

(declare-fun res!129508 () Bool)

(declare-fun e!171610 () Bool)

(assert (=> d!63973 (=> res!129508 e!171610)))

(assert (=> d!63973 (= res!129508 (bvsge #b00000000000000000000000000000000 (size!6386 a!3436)))))

(assert (=> d!63973 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171610)))

(declare-fun b!265002 () Bool)

(declare-fun call!25294 () Bool)

(assert (=> b!265002 (= e!171611 call!25294)))

(declare-fun bm!25291 () Bool)

(assert (=> bm!25291 (= call!25294 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun b!265003 () Bool)

(assert (=> b!265003 (= e!171612 call!25294)))

(declare-fun b!265004 () Bool)

(assert (=> b!265004 (= e!171610 e!171611)))

(declare-fun c!45298 () Bool)

(assert (=> b!265004 (= c!45298 (validKeyInArray!0 (select (arr!6033 a!3436) #b00000000000000000000000000000000)))))

(assert (= (and d!63973 (not res!129508)) b!265004))

(assert (= (and b!265004 c!45298) b!265001))

(assert (= (and b!265004 (not c!45298)) b!265002))

(assert (= (and b!265001 res!129507) b!265003))

(assert (= (or b!265003 b!265002) bm!25291))

(assert (=> b!265001 m!281411))

(declare-fun m!281429 () Bool)

(assert (=> b!265001 m!281429))

(declare-fun m!281431 () Bool)

(assert (=> b!265001 m!281431))

(assert (=> b!265001 m!281411))

(declare-fun m!281433 () Bool)

(assert (=> b!265001 m!281433))

(declare-fun m!281435 () Bool)

(assert (=> bm!25291 m!281435))

(assert (=> b!265004 m!281411))

(assert (=> b!265004 m!281411))

(declare-fun m!281437 () Bool)

(assert (=> b!265004 m!281437))

(assert (=> b!264880 d!63973))

(declare-fun d!63979 () Bool)

(assert (=> d!63979 (= (validKeyInArray!0 k0!2698) (and (not (= k0!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!264879 d!63979))

(declare-fun d!63983 () Bool)

(assert (=> d!63983 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25466 d!63983))

(declare-fun d!63991 () Bool)

(assert (=> d!63991 (= (array_inv!4005 a!3436) (bvsge (size!6386 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25466 d!63991))

(check-sat (not b!265001) (not b!264962) (not bm!25291) (not b!264956) (not d!63957) (not b!265004))
(check-sat)
