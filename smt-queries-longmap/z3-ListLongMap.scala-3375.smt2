; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46484 () Bool)

(assert start!46484)

(declare-fun b!513946 () Bool)

(declare-fun res!314065 () Bool)

(declare-fun e!300108 () Bool)

(assert (=> b!513946 (=> (not res!314065) (not e!300108))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513946 (= res!314065 (validKeyInArray!0 k0!2280))))

(declare-fun res!314067 () Bool)

(assert (=> start!46484 (=> (not res!314067) (not e!300108))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46484 (= res!314067 (validMask!0 mask!3524))))

(assert (=> start!46484 e!300108))

(assert (=> start!46484 true))

(declare-datatypes ((array!32967 0))(
  ( (array!32968 (arr!15856 (Array (_ BitVec 32) (_ BitVec 64))) (size!16220 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32967)

(declare-fun array_inv!11652 (array!32967) Bool)

(assert (=> start!46484 (array_inv!11652 a!3235)))

(declare-fun b!513947 () Bool)

(declare-fun e!300107 () Bool)

(declare-fun e!300110 () Bool)

(assert (=> b!513947 (= e!300107 (not e!300110))))

(declare-fun res!314066 () Bool)

(assert (=> b!513947 (=> res!314066 e!300110)))

(declare-fun lt!235296 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4323 0))(
  ( (MissingZero!4323 (index!19480 (_ BitVec 32))) (Found!4323 (index!19481 (_ BitVec 32))) (Intermediate!4323 (undefined!5135 Bool) (index!19482 (_ BitVec 32)) (x!48436 (_ BitVec 32))) (Undefined!4323) (MissingVacant!4323 (index!19483 (_ BitVec 32))) )
))
(declare-fun lt!235295 () SeekEntryResult!4323)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32967 (_ BitVec 32)) SeekEntryResult!4323)

(assert (=> b!513947 (= res!314066 (= lt!235295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235296 (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) (array!32968 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)) mask!3524)))))

(declare-fun lt!235294 () (_ BitVec 32))

(assert (=> b!513947 (= lt!235295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235294 (select (arr!15856 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513947 (= lt!235296 (toIndex!0 (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!513947 (= lt!235294 (toIndex!0 (select (arr!15856 a!3235) j!176) mask!3524))))

(declare-fun e!300109 () Bool)

(assert (=> b!513947 e!300109))

(declare-fun res!314061 () Bool)

(assert (=> b!513947 (=> (not res!314061) (not e!300109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32967 (_ BitVec 32)) Bool)

(assert (=> b!513947 (= res!314061 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15904 0))(
  ( (Unit!15905) )
))
(declare-fun lt!235297 () Unit!15904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15904)

(assert (=> b!513947 (= lt!235297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513948 () Bool)

(declare-fun res!314062 () Bool)

(assert (=> b!513948 (=> (not res!314062) (not e!300107))))

(declare-datatypes ((List!10014 0))(
  ( (Nil!10011) (Cons!10010 (h!10899 (_ BitVec 64)) (t!16242 List!10014)) )
))
(declare-fun arrayNoDuplicates!0 (array!32967 (_ BitVec 32) List!10014) Bool)

(assert (=> b!513948 (= res!314062 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10011))))

(declare-fun b!513949 () Bool)

(declare-fun res!314068 () Bool)

(assert (=> b!513949 (=> (not res!314068) (not e!300108))))

(assert (=> b!513949 (= res!314068 (and (= (size!16220 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16220 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16220 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513950 () Bool)

(declare-fun res!314063 () Bool)

(assert (=> b!513950 (=> (not res!314063) (not e!300108))))

(declare-fun arrayContainsKey!0 (array!32967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513950 (= res!314063 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513951 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32967 (_ BitVec 32)) SeekEntryResult!4323)

(assert (=> b!513951 (= e!300109 (= (seekEntryOrOpen!0 (select (arr!15856 a!3235) j!176) a!3235 mask!3524) (Found!4323 j!176)))))

(declare-fun b!513952 () Bool)

(declare-fun res!314064 () Bool)

(assert (=> b!513952 (=> (not res!314064) (not e!300107))))

(assert (=> b!513952 (= res!314064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513953 () Bool)

(declare-fun res!314059 () Bool)

(assert (=> b!513953 (=> (not res!314059) (not e!300108))))

(assert (=> b!513953 (= res!314059 (validKeyInArray!0 (select (arr!15856 a!3235) j!176)))))

(declare-fun b!513954 () Bool)

(assert (=> b!513954 (= e!300110 (or (= (select (arr!15856 a!3235) (index!19482 lt!235295)) (select (arr!15856 a!3235) j!176)) (= (select (arr!15856 a!3235) (index!19482 lt!235295)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!19482 lt!235295) #b00000000000000000000000000000000) (bvslt (index!19482 lt!235295) (size!16220 a!3235)))))))

(assert (=> b!513954 (bvslt (x!48436 lt!235295) #b01111111111111111111111111111110)))

(declare-fun b!513955 () Bool)

(declare-fun res!314060 () Bool)

(assert (=> b!513955 (=> res!314060 e!300110)))

(get-info :version)

(assert (=> b!513955 (= res!314060 (or (undefined!5135 lt!235295) (not ((_ is Intermediate!4323) lt!235295))))))

(declare-fun b!513956 () Bool)

(assert (=> b!513956 (= e!300108 e!300107)))

(declare-fun res!314069 () Bool)

(assert (=> b!513956 (=> (not res!314069) (not e!300107))))

(declare-fun lt!235293 () SeekEntryResult!4323)

(assert (=> b!513956 (= res!314069 (or (= lt!235293 (MissingZero!4323 i!1204)) (= lt!235293 (MissingVacant!4323 i!1204))))))

(assert (=> b!513956 (= lt!235293 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46484 res!314067) b!513949))

(assert (= (and b!513949 res!314068) b!513953))

(assert (= (and b!513953 res!314059) b!513946))

(assert (= (and b!513946 res!314065) b!513950))

(assert (= (and b!513950 res!314063) b!513956))

(assert (= (and b!513956 res!314069) b!513952))

(assert (= (and b!513952 res!314064) b!513948))

(assert (= (and b!513948 res!314062) b!513947))

(assert (= (and b!513947 res!314061) b!513951))

(assert (= (and b!513947 (not res!314066)) b!513955))

(assert (= (and b!513955 (not res!314060)) b!513954))

(declare-fun m!495449 () Bool)

(assert (=> b!513956 m!495449))

(declare-fun m!495451 () Bool)

(assert (=> b!513948 m!495451))

(declare-fun m!495453 () Bool)

(assert (=> b!513951 m!495453))

(assert (=> b!513951 m!495453))

(declare-fun m!495455 () Bool)

(assert (=> b!513951 m!495455))

(declare-fun m!495457 () Bool)

(assert (=> start!46484 m!495457))

(declare-fun m!495459 () Bool)

(assert (=> start!46484 m!495459))

(declare-fun m!495461 () Bool)

(assert (=> b!513952 m!495461))

(declare-fun m!495463 () Bool)

(assert (=> b!513947 m!495463))

(declare-fun m!495465 () Bool)

(assert (=> b!513947 m!495465))

(declare-fun m!495467 () Bool)

(assert (=> b!513947 m!495467))

(assert (=> b!513947 m!495453))

(declare-fun m!495469 () Bool)

(assert (=> b!513947 m!495469))

(assert (=> b!513947 m!495453))

(declare-fun m!495471 () Bool)

(assert (=> b!513947 m!495471))

(assert (=> b!513947 m!495453))

(declare-fun m!495473 () Bool)

(assert (=> b!513947 m!495473))

(assert (=> b!513947 m!495467))

(declare-fun m!495475 () Bool)

(assert (=> b!513947 m!495475))

(assert (=> b!513947 m!495467))

(declare-fun m!495477 () Bool)

(assert (=> b!513947 m!495477))

(assert (=> b!513953 m!495453))

(assert (=> b!513953 m!495453))

(declare-fun m!495479 () Bool)

(assert (=> b!513953 m!495479))

(declare-fun m!495481 () Bool)

(assert (=> b!513950 m!495481))

(declare-fun m!495483 () Bool)

(assert (=> b!513954 m!495483))

(assert (=> b!513954 m!495453))

(declare-fun m!495485 () Bool)

(assert (=> b!513946 m!495485))

(check-sat (not b!513946) (not b!513956) (not b!513953) (not b!513950) (not b!513952) (not b!513951) (not b!513947) (not b!513948) (not start!46484))
(check-sat)
(get-model)

(declare-fun b!514002 () Bool)

(declare-fun e!300133 () SeekEntryResult!4323)

(declare-fun e!300134 () SeekEntryResult!4323)

(assert (=> b!514002 (= e!300133 e!300134)))

(declare-fun lt!235319 () (_ BitVec 64))

(declare-fun lt!235321 () SeekEntryResult!4323)

(assert (=> b!514002 (= lt!235319 (select (arr!15856 a!3235) (index!19482 lt!235321)))))

(declare-fun c!60235 () Bool)

(assert (=> b!514002 (= c!60235 (= lt!235319 k0!2280))))

(declare-fun b!514003 () Bool)

(assert (=> b!514003 (= e!300134 (Found!4323 (index!19482 lt!235321)))))

(declare-fun b!514004 () Bool)

(declare-fun e!300135 () SeekEntryResult!4323)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32967 (_ BitVec 32)) SeekEntryResult!4323)

(assert (=> b!514004 (= e!300135 (seekKeyOrZeroReturnVacant!0 (x!48436 lt!235321) (index!19482 lt!235321) (index!19482 lt!235321) k0!2280 a!3235 mask!3524))))

(declare-fun b!514005 () Bool)

(assert (=> b!514005 (= e!300133 Undefined!4323)))

(declare-fun d!79267 () Bool)

(declare-fun lt!235320 () SeekEntryResult!4323)

(assert (=> d!79267 (and (or ((_ is Undefined!4323) lt!235320) (not ((_ is Found!4323) lt!235320)) (and (bvsge (index!19481 lt!235320) #b00000000000000000000000000000000) (bvslt (index!19481 lt!235320) (size!16220 a!3235)))) (or ((_ is Undefined!4323) lt!235320) ((_ is Found!4323) lt!235320) (not ((_ is MissingZero!4323) lt!235320)) (and (bvsge (index!19480 lt!235320) #b00000000000000000000000000000000) (bvslt (index!19480 lt!235320) (size!16220 a!3235)))) (or ((_ is Undefined!4323) lt!235320) ((_ is Found!4323) lt!235320) ((_ is MissingZero!4323) lt!235320) (not ((_ is MissingVacant!4323) lt!235320)) (and (bvsge (index!19483 lt!235320) #b00000000000000000000000000000000) (bvslt (index!19483 lt!235320) (size!16220 a!3235)))) (or ((_ is Undefined!4323) lt!235320) (ite ((_ is Found!4323) lt!235320) (= (select (arr!15856 a!3235) (index!19481 lt!235320)) k0!2280) (ite ((_ is MissingZero!4323) lt!235320) (= (select (arr!15856 a!3235) (index!19480 lt!235320)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4323) lt!235320) (= (select (arr!15856 a!3235) (index!19483 lt!235320)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79267 (= lt!235320 e!300133)))

(declare-fun c!60234 () Bool)

(assert (=> d!79267 (= c!60234 (and ((_ is Intermediate!4323) lt!235321) (undefined!5135 lt!235321)))))

(assert (=> d!79267 (= lt!235321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79267 (validMask!0 mask!3524)))

(assert (=> d!79267 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235320)))

(declare-fun b!514006 () Bool)

(declare-fun c!60236 () Bool)

(assert (=> b!514006 (= c!60236 (= lt!235319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514006 (= e!300134 e!300135)))

(declare-fun b!514007 () Bool)

(assert (=> b!514007 (= e!300135 (MissingZero!4323 (index!19482 lt!235321)))))

(assert (= (and d!79267 c!60234) b!514005))

(assert (= (and d!79267 (not c!60234)) b!514002))

(assert (= (and b!514002 c!60235) b!514003))

(assert (= (and b!514002 (not c!60235)) b!514006))

(assert (= (and b!514006 c!60236) b!514007))

(assert (= (and b!514006 (not c!60236)) b!514004))

(declare-fun m!495525 () Bool)

(assert (=> b!514002 m!495525))

(declare-fun m!495527 () Bool)

(assert (=> b!514004 m!495527))

(declare-fun m!495529 () Bool)

(assert (=> d!79267 m!495529))

(declare-fun m!495531 () Bool)

(assert (=> d!79267 m!495531))

(declare-fun m!495533 () Bool)

(assert (=> d!79267 m!495533))

(assert (=> d!79267 m!495529))

(declare-fun m!495535 () Bool)

(assert (=> d!79267 m!495535))

(declare-fun m!495537 () Bool)

(assert (=> d!79267 m!495537))

(assert (=> d!79267 m!495457))

(assert (=> b!513956 d!79267))

(declare-fun d!79269 () Bool)

(assert (=> d!79269 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46484 d!79269))

(declare-fun d!79271 () Bool)

(assert (=> d!79271 (= (array_inv!11652 a!3235) (bvsge (size!16220 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46484 d!79271))

(declare-fun d!79273 () Bool)

(declare-fun res!314107 () Bool)

(declare-fun e!300140 () Bool)

(assert (=> d!79273 (=> res!314107 e!300140)))

(assert (=> d!79273 (= res!314107 (= (select (arr!15856 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79273 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!300140)))

(declare-fun b!514012 () Bool)

(declare-fun e!300141 () Bool)

(assert (=> b!514012 (= e!300140 e!300141)))

(declare-fun res!314108 () Bool)

(assert (=> b!514012 (=> (not res!314108) (not e!300141))))

(assert (=> b!514012 (= res!314108 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16220 a!3235)))))

(declare-fun b!514013 () Bool)

(assert (=> b!514013 (= e!300141 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79273 (not res!314107)) b!514012))

(assert (= (and b!514012 res!314108) b!514013))

(declare-fun m!495539 () Bool)

(assert (=> d!79273 m!495539))

(declare-fun m!495541 () Bool)

(assert (=> b!514013 m!495541))

(assert (=> b!513950 d!79273))

(declare-fun b!514022 () Bool)

(declare-fun e!300148 () Bool)

(declare-fun e!300150 () Bool)

(assert (=> b!514022 (= e!300148 e!300150)))

(declare-fun c!60239 () Bool)

(assert (=> b!514022 (= c!60239 (validKeyInArray!0 (select (arr!15856 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31577 () Bool)

(declare-fun call!31580 () Bool)

(assert (=> bm!31577 (= call!31580 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79277 () Bool)

(declare-fun res!314113 () Bool)

(assert (=> d!79277 (=> res!314113 e!300148)))

(assert (=> d!79277 (= res!314113 (bvsge #b00000000000000000000000000000000 (size!16220 a!3235)))))

(assert (=> d!79277 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300148)))

(declare-fun b!514023 () Bool)

(declare-fun e!300149 () Bool)

(assert (=> b!514023 (= e!300149 call!31580)))

(declare-fun b!514024 () Bool)

(assert (=> b!514024 (= e!300150 e!300149)))

(declare-fun lt!235328 () (_ BitVec 64))

(assert (=> b!514024 (= lt!235328 (select (arr!15856 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235330 () Unit!15904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32967 (_ BitVec 64) (_ BitVec 32)) Unit!15904)

(assert (=> b!514024 (= lt!235330 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235328 #b00000000000000000000000000000000))))

(assert (=> b!514024 (arrayContainsKey!0 a!3235 lt!235328 #b00000000000000000000000000000000)))

(declare-fun lt!235329 () Unit!15904)

(assert (=> b!514024 (= lt!235329 lt!235330)))

(declare-fun res!314114 () Bool)

(assert (=> b!514024 (= res!314114 (= (seekEntryOrOpen!0 (select (arr!15856 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4323 #b00000000000000000000000000000000)))))

(assert (=> b!514024 (=> (not res!314114) (not e!300149))))

(declare-fun b!514025 () Bool)

(assert (=> b!514025 (= e!300150 call!31580)))

(assert (= (and d!79277 (not res!314113)) b!514022))

(assert (= (and b!514022 c!60239) b!514024))

(assert (= (and b!514022 (not c!60239)) b!514025))

(assert (= (and b!514024 res!314114) b!514023))

(assert (= (or b!514023 b!514025) bm!31577))

(assert (=> b!514022 m!495539))

(assert (=> b!514022 m!495539))

(declare-fun m!495543 () Bool)

(assert (=> b!514022 m!495543))

(declare-fun m!495545 () Bool)

(assert (=> bm!31577 m!495545))

(assert (=> b!514024 m!495539))

(declare-fun m!495547 () Bool)

(assert (=> b!514024 m!495547))

(declare-fun m!495549 () Bool)

(assert (=> b!514024 m!495549))

(assert (=> b!514024 m!495539))

(declare-fun m!495551 () Bool)

(assert (=> b!514024 m!495551))

(assert (=> b!513952 d!79277))

(declare-fun d!79283 () Bool)

(assert (=> d!79283 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513946 d!79283))

(declare-fun b!514026 () Bool)

(declare-fun e!300151 () SeekEntryResult!4323)

(declare-fun e!300152 () SeekEntryResult!4323)

(assert (=> b!514026 (= e!300151 e!300152)))

(declare-fun lt!235331 () (_ BitVec 64))

(declare-fun lt!235333 () SeekEntryResult!4323)

(assert (=> b!514026 (= lt!235331 (select (arr!15856 a!3235) (index!19482 lt!235333)))))

(declare-fun c!60241 () Bool)

(assert (=> b!514026 (= c!60241 (= lt!235331 (select (arr!15856 a!3235) j!176)))))

(declare-fun b!514027 () Bool)

(assert (=> b!514027 (= e!300152 (Found!4323 (index!19482 lt!235333)))))

(declare-fun e!300153 () SeekEntryResult!4323)

(declare-fun b!514028 () Bool)

(assert (=> b!514028 (= e!300153 (seekKeyOrZeroReturnVacant!0 (x!48436 lt!235333) (index!19482 lt!235333) (index!19482 lt!235333) (select (arr!15856 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514029 () Bool)

(assert (=> b!514029 (= e!300151 Undefined!4323)))

(declare-fun d!79287 () Bool)

(declare-fun lt!235332 () SeekEntryResult!4323)

(assert (=> d!79287 (and (or ((_ is Undefined!4323) lt!235332) (not ((_ is Found!4323) lt!235332)) (and (bvsge (index!19481 lt!235332) #b00000000000000000000000000000000) (bvslt (index!19481 lt!235332) (size!16220 a!3235)))) (or ((_ is Undefined!4323) lt!235332) ((_ is Found!4323) lt!235332) (not ((_ is MissingZero!4323) lt!235332)) (and (bvsge (index!19480 lt!235332) #b00000000000000000000000000000000) (bvslt (index!19480 lt!235332) (size!16220 a!3235)))) (or ((_ is Undefined!4323) lt!235332) ((_ is Found!4323) lt!235332) ((_ is MissingZero!4323) lt!235332) (not ((_ is MissingVacant!4323) lt!235332)) (and (bvsge (index!19483 lt!235332) #b00000000000000000000000000000000) (bvslt (index!19483 lt!235332) (size!16220 a!3235)))) (or ((_ is Undefined!4323) lt!235332) (ite ((_ is Found!4323) lt!235332) (= (select (arr!15856 a!3235) (index!19481 lt!235332)) (select (arr!15856 a!3235) j!176)) (ite ((_ is MissingZero!4323) lt!235332) (= (select (arr!15856 a!3235) (index!19480 lt!235332)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4323) lt!235332) (= (select (arr!15856 a!3235) (index!19483 lt!235332)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79287 (= lt!235332 e!300151)))

(declare-fun c!60240 () Bool)

(assert (=> d!79287 (= c!60240 (and ((_ is Intermediate!4323) lt!235333) (undefined!5135 lt!235333)))))

(assert (=> d!79287 (= lt!235333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15856 a!3235) j!176) mask!3524) (select (arr!15856 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79287 (validMask!0 mask!3524)))

(assert (=> d!79287 (= (seekEntryOrOpen!0 (select (arr!15856 a!3235) j!176) a!3235 mask!3524) lt!235332)))

(declare-fun b!514030 () Bool)

(declare-fun c!60242 () Bool)

(assert (=> b!514030 (= c!60242 (= lt!235331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514030 (= e!300152 e!300153)))

(declare-fun b!514031 () Bool)

(assert (=> b!514031 (= e!300153 (MissingZero!4323 (index!19482 lt!235333)))))

(assert (= (and d!79287 c!60240) b!514029))

(assert (= (and d!79287 (not c!60240)) b!514026))

(assert (= (and b!514026 c!60241) b!514027))

(assert (= (and b!514026 (not c!60241)) b!514030))

(assert (= (and b!514030 c!60242) b!514031))

(assert (= (and b!514030 (not c!60242)) b!514028))

(declare-fun m!495553 () Bool)

(assert (=> b!514026 m!495553))

(assert (=> b!514028 m!495453))

(declare-fun m!495555 () Bool)

(assert (=> b!514028 m!495555))

(assert (=> d!79287 m!495453))

(assert (=> d!79287 m!495469))

(declare-fun m!495557 () Bool)

(assert (=> d!79287 m!495557))

(declare-fun m!495559 () Bool)

(assert (=> d!79287 m!495559))

(assert (=> d!79287 m!495469))

(assert (=> d!79287 m!495453))

(declare-fun m!495561 () Bool)

(assert (=> d!79287 m!495561))

(declare-fun m!495563 () Bool)

(assert (=> d!79287 m!495563))

(assert (=> d!79287 m!495457))

(assert (=> b!513951 d!79287))

(declare-fun b!514050 () Bool)

(declare-fun e!300170 () Bool)

(declare-fun call!31585 () Bool)

(assert (=> b!514050 (= e!300170 call!31585)))

(declare-fun b!514051 () Bool)

(assert (=> b!514051 (= e!300170 call!31585)))

(declare-fun b!514052 () Bool)

(declare-fun e!300168 () Bool)

(declare-fun e!300171 () Bool)

(assert (=> b!514052 (= e!300168 e!300171)))

(declare-fun res!314126 () Bool)

(assert (=> b!514052 (=> (not res!314126) (not e!300171))))

(declare-fun e!300169 () Bool)

(assert (=> b!514052 (= res!314126 (not e!300169))))

(declare-fun res!314125 () Bool)

(assert (=> b!514052 (=> (not res!314125) (not e!300169))))

(assert (=> b!514052 (= res!314125 (validKeyInArray!0 (select (arr!15856 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514053 () Bool)

(declare-fun contains!2733 (List!10014 (_ BitVec 64)) Bool)

(assert (=> b!514053 (= e!300169 (contains!2733 Nil!10011 (select (arr!15856 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79293 () Bool)

(declare-fun res!314127 () Bool)

(assert (=> d!79293 (=> res!314127 e!300168)))

(assert (=> d!79293 (= res!314127 (bvsge #b00000000000000000000000000000000 (size!16220 a!3235)))))

(assert (=> d!79293 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10011) e!300168)))

(declare-fun bm!31582 () Bool)

(declare-fun c!60247 () Bool)

(assert (=> bm!31582 (= call!31585 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60247 (Cons!10010 (select (arr!15856 a!3235) #b00000000000000000000000000000000) Nil!10011) Nil!10011)))))

(declare-fun b!514054 () Bool)

(assert (=> b!514054 (= e!300171 e!300170)))

(assert (=> b!514054 (= c!60247 (validKeyInArray!0 (select (arr!15856 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79293 (not res!314127)) b!514052))

(assert (= (and b!514052 res!314125) b!514053))

(assert (= (and b!514052 res!314126) b!514054))

(assert (= (and b!514054 c!60247) b!514051))

(assert (= (and b!514054 (not c!60247)) b!514050))

(assert (= (or b!514051 b!514050) bm!31582))

(assert (=> b!514052 m!495539))

(assert (=> b!514052 m!495539))

(assert (=> b!514052 m!495543))

(assert (=> b!514053 m!495539))

(assert (=> b!514053 m!495539))

(declare-fun m!495565 () Bool)

(assert (=> b!514053 m!495565))

(assert (=> bm!31582 m!495539))

(declare-fun m!495567 () Bool)

(assert (=> bm!31582 m!495567))

(assert (=> b!514054 m!495539))

(assert (=> b!514054 m!495539))

(assert (=> b!514054 m!495543))

(assert (=> b!513948 d!79293))

(declare-fun d!79295 () Bool)

(assert (=> d!79295 (= (validKeyInArray!0 (select (arr!15856 a!3235) j!176)) (and (not (= (select (arr!15856 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15856 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513953 d!79295))

(declare-fun d!79297 () Bool)

(declare-fun lt!235354 () (_ BitVec 32))

(declare-fun lt!235353 () (_ BitVec 32))

(assert (=> d!79297 (= lt!235354 (bvmul (bvxor lt!235353 (bvlshr lt!235353 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79297 (= lt!235353 ((_ extract 31 0) (bvand (bvxor (select (arr!15856 a!3235) j!176) (bvlshr (select (arr!15856 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79297 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314128 (let ((h!10901 ((_ extract 31 0) (bvand (bvxor (select (arr!15856 a!3235) j!176) (bvlshr (select (arr!15856 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48438 (bvmul (bvxor h!10901 (bvlshr h!10901 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48438 (bvlshr x!48438 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314128 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314128 #b00000000000000000000000000000000))))))

(assert (=> d!79297 (= (toIndex!0 (select (arr!15856 a!3235) j!176) mask!3524) (bvand (bvxor lt!235354 (bvlshr lt!235354 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513947 d!79297))

(declare-fun b!514125 () Bool)

(declare-fun e!300213 () SeekEntryResult!4323)

(assert (=> b!514125 (= e!300213 (Intermediate!4323 false lt!235296 #b00000000000000000000000000000000))))

(declare-fun b!514126 () Bool)

(declare-fun e!300216 () Bool)

(declare-fun lt!235381 () SeekEntryResult!4323)

(assert (=> b!514126 (= e!300216 (bvsge (x!48436 lt!235381) #b01111111111111111111111111111110))))

(declare-fun b!514127 () Bool)

(assert (=> b!514127 (and (bvsge (index!19482 lt!235381) #b00000000000000000000000000000000) (bvslt (index!19482 lt!235381) (size!16220 (array!32968 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)))))))

(declare-fun res!314150 () Bool)

(assert (=> b!514127 (= res!314150 (= (select (arr!15856 (array!32968 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235))) (index!19482 lt!235381)) (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!300215 () Bool)

(assert (=> b!514127 (=> res!314150 e!300215)))

(declare-fun e!300217 () Bool)

(assert (=> b!514127 (= e!300217 e!300215)))

(declare-fun b!514128 () Bool)

(declare-fun e!300214 () SeekEntryResult!4323)

(assert (=> b!514128 (= e!300214 e!300213)))

(declare-fun lt!235382 () (_ BitVec 64))

(declare-fun c!60275 () Bool)

(assert (=> b!514128 (= c!60275 (or (= lt!235382 (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235382 lt!235382) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79301 () Bool)

(assert (=> d!79301 e!300216))

(declare-fun c!60273 () Bool)

(assert (=> d!79301 (= c!60273 (and ((_ is Intermediate!4323) lt!235381) (undefined!5135 lt!235381)))))

(assert (=> d!79301 (= lt!235381 e!300214)))

(declare-fun c!60274 () Bool)

(assert (=> d!79301 (= c!60274 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79301 (= lt!235382 (select (arr!15856 (array!32968 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235))) lt!235296))))

(assert (=> d!79301 (validMask!0 mask!3524)))

(assert (=> d!79301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235296 (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) (array!32968 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)) mask!3524) lt!235381)))

(declare-fun b!514129 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514129 (= e!300213 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235296 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) (array!32968 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)) mask!3524))))

(declare-fun b!514130 () Bool)

(assert (=> b!514130 (= e!300216 e!300217)))

(declare-fun res!314152 () Bool)

(assert (=> b!514130 (= res!314152 (and ((_ is Intermediate!4323) lt!235381) (not (undefined!5135 lt!235381)) (bvslt (x!48436 lt!235381) #b01111111111111111111111111111110) (bvsge (x!48436 lt!235381) #b00000000000000000000000000000000) (bvsge (x!48436 lt!235381) #b00000000000000000000000000000000)))))

(assert (=> b!514130 (=> (not res!314152) (not e!300217))))

(declare-fun b!514131 () Bool)

(assert (=> b!514131 (and (bvsge (index!19482 lt!235381) #b00000000000000000000000000000000) (bvslt (index!19482 lt!235381) (size!16220 (array!32968 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)))))))

(assert (=> b!514131 (= e!300215 (= (select (arr!15856 (array!32968 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235))) (index!19482 lt!235381)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514132 () Bool)

(assert (=> b!514132 (and (bvsge (index!19482 lt!235381) #b00000000000000000000000000000000) (bvslt (index!19482 lt!235381) (size!16220 (array!32968 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)))))))

(declare-fun res!314151 () Bool)

(assert (=> b!514132 (= res!314151 (= (select (arr!15856 (array!32968 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235))) (index!19482 lt!235381)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514132 (=> res!314151 e!300215)))

(declare-fun b!514133 () Bool)

(assert (=> b!514133 (= e!300214 (Intermediate!4323 true lt!235296 #b00000000000000000000000000000000))))

(assert (= (and d!79301 c!60274) b!514133))

(assert (= (and d!79301 (not c!60274)) b!514128))

(assert (= (and b!514128 c!60275) b!514125))

(assert (= (and b!514128 (not c!60275)) b!514129))

(assert (= (and d!79301 c!60273) b!514126))

(assert (= (and d!79301 (not c!60273)) b!514130))

(assert (= (and b!514130 res!314152) b!514127))

(assert (= (and b!514127 (not res!314150)) b!514132))

(assert (= (and b!514132 (not res!314151)) b!514131))

(declare-fun m!495599 () Bool)

(assert (=> b!514129 m!495599))

(assert (=> b!514129 m!495599))

(assert (=> b!514129 m!495467))

(declare-fun m!495601 () Bool)

(assert (=> b!514129 m!495601))

(declare-fun m!495603 () Bool)

(assert (=> d!79301 m!495603))

(assert (=> d!79301 m!495457))

(declare-fun m!495605 () Bool)

(assert (=> b!514131 m!495605))

(assert (=> b!514127 m!495605))

(assert (=> b!514132 m!495605))

(assert (=> b!513947 d!79301))

(declare-fun d!79315 () Bool)

(assert (=> d!79315 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235390 () Unit!15904)

(declare-fun choose!38 (array!32967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15904)

(assert (=> d!79315 (= lt!235390 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79315 (validMask!0 mask!3524)))

(assert (=> d!79315 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235390)))

(declare-fun bs!16261 () Bool)

(assert (= bs!16261 d!79315))

(assert (=> bs!16261 m!495471))

(declare-fun m!495627 () Bool)

(assert (=> bs!16261 m!495627))

(assert (=> bs!16261 m!495457))

(assert (=> b!513947 d!79315))

(declare-fun d!79321 () Bool)

(declare-fun lt!235392 () (_ BitVec 32))

(declare-fun lt!235391 () (_ BitVec 32))

(assert (=> d!79321 (= lt!235392 (bvmul (bvxor lt!235391 (bvlshr lt!235391 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79321 (= lt!235391 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79321 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314128 (let ((h!10901 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48438 (bvmul (bvxor h!10901 (bvlshr h!10901 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48438 (bvlshr x!48438 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314128 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314128 #b00000000000000000000000000000000))))))

(assert (=> d!79321 (= (toIndex!0 (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235392 (bvlshr lt!235392 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513947 d!79321))

(declare-fun b!514147 () Bool)

(declare-fun e!300226 () SeekEntryResult!4323)

(assert (=> b!514147 (= e!300226 (Intermediate!4323 false lt!235294 #b00000000000000000000000000000000))))

(declare-fun b!514148 () Bool)

(declare-fun e!300229 () Bool)

(declare-fun lt!235393 () SeekEntryResult!4323)

(assert (=> b!514148 (= e!300229 (bvsge (x!48436 lt!235393) #b01111111111111111111111111111110))))

(declare-fun b!514149 () Bool)

(assert (=> b!514149 (and (bvsge (index!19482 lt!235393) #b00000000000000000000000000000000) (bvslt (index!19482 lt!235393) (size!16220 a!3235)))))

(declare-fun res!314159 () Bool)

(assert (=> b!514149 (= res!314159 (= (select (arr!15856 a!3235) (index!19482 lt!235393)) (select (arr!15856 a!3235) j!176)))))

(declare-fun e!300228 () Bool)

(assert (=> b!514149 (=> res!314159 e!300228)))

(declare-fun e!300230 () Bool)

(assert (=> b!514149 (= e!300230 e!300228)))

(declare-fun b!514150 () Bool)

(declare-fun e!300227 () SeekEntryResult!4323)

(assert (=> b!514150 (= e!300227 e!300226)))

(declare-fun c!60282 () Bool)

(declare-fun lt!235394 () (_ BitVec 64))

(assert (=> b!514150 (= c!60282 (or (= lt!235394 (select (arr!15856 a!3235) j!176)) (= (bvadd lt!235394 lt!235394) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79323 () Bool)

(assert (=> d!79323 e!300229))

(declare-fun c!60280 () Bool)

(assert (=> d!79323 (= c!60280 (and ((_ is Intermediate!4323) lt!235393) (undefined!5135 lt!235393)))))

(assert (=> d!79323 (= lt!235393 e!300227)))

(declare-fun c!60281 () Bool)

(assert (=> d!79323 (= c!60281 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79323 (= lt!235394 (select (arr!15856 a!3235) lt!235294))))

(assert (=> d!79323 (validMask!0 mask!3524)))

(assert (=> d!79323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235294 (select (arr!15856 a!3235) j!176) a!3235 mask!3524) lt!235393)))

(declare-fun b!514151 () Bool)

(assert (=> b!514151 (= e!300226 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235294 #b00000000000000000000000000000000 mask!3524) (select (arr!15856 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514152 () Bool)

(assert (=> b!514152 (= e!300229 e!300230)))

(declare-fun res!314161 () Bool)

(assert (=> b!514152 (= res!314161 (and ((_ is Intermediate!4323) lt!235393) (not (undefined!5135 lt!235393)) (bvslt (x!48436 lt!235393) #b01111111111111111111111111111110) (bvsge (x!48436 lt!235393) #b00000000000000000000000000000000) (bvsge (x!48436 lt!235393) #b00000000000000000000000000000000)))))

(assert (=> b!514152 (=> (not res!314161) (not e!300230))))

(declare-fun b!514153 () Bool)

(assert (=> b!514153 (and (bvsge (index!19482 lt!235393) #b00000000000000000000000000000000) (bvslt (index!19482 lt!235393) (size!16220 a!3235)))))

(assert (=> b!514153 (= e!300228 (= (select (arr!15856 a!3235) (index!19482 lt!235393)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514154 () Bool)

(assert (=> b!514154 (and (bvsge (index!19482 lt!235393) #b00000000000000000000000000000000) (bvslt (index!19482 lt!235393) (size!16220 a!3235)))))

(declare-fun res!314160 () Bool)

(assert (=> b!514154 (= res!314160 (= (select (arr!15856 a!3235) (index!19482 lt!235393)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514154 (=> res!314160 e!300228)))

(declare-fun b!514155 () Bool)

(assert (=> b!514155 (= e!300227 (Intermediate!4323 true lt!235294 #b00000000000000000000000000000000))))

(assert (= (and d!79323 c!60281) b!514155))

(assert (= (and d!79323 (not c!60281)) b!514150))

(assert (= (and b!514150 c!60282) b!514147))

(assert (= (and b!514150 (not c!60282)) b!514151))

(assert (= (and d!79323 c!60280) b!514148))

(assert (= (and d!79323 (not c!60280)) b!514152))

(assert (= (and b!514152 res!314161) b!514149))

(assert (= (and b!514149 (not res!314159)) b!514154))

(assert (= (and b!514154 (not res!314160)) b!514153))

(declare-fun m!495629 () Bool)

(assert (=> b!514151 m!495629))

(assert (=> b!514151 m!495629))

(assert (=> b!514151 m!495453))

(declare-fun m!495631 () Bool)

(assert (=> b!514151 m!495631))

(declare-fun m!495633 () Bool)

(assert (=> d!79323 m!495633))

(assert (=> d!79323 m!495457))

(declare-fun m!495635 () Bool)

(assert (=> b!514153 m!495635))

(assert (=> b!514149 m!495635))

(assert (=> b!514154 m!495635))

(assert (=> b!513947 d!79323))

(declare-fun b!514156 () Bool)

(declare-fun e!300231 () Bool)

(declare-fun e!300233 () Bool)

(assert (=> b!514156 (= e!300231 e!300233)))

(declare-fun c!60283 () Bool)

(assert (=> b!514156 (= c!60283 (validKeyInArray!0 (select (arr!15856 a!3235) j!176)))))

(declare-fun call!31591 () Bool)

(declare-fun bm!31588 () Bool)

(assert (=> bm!31588 (= call!31591 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79325 () Bool)

(declare-fun res!314162 () Bool)

(assert (=> d!79325 (=> res!314162 e!300231)))

(assert (=> d!79325 (= res!314162 (bvsge j!176 (size!16220 a!3235)))))

(assert (=> d!79325 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300231)))

(declare-fun b!514157 () Bool)

(declare-fun e!300232 () Bool)

(assert (=> b!514157 (= e!300232 call!31591)))

(declare-fun b!514158 () Bool)

(assert (=> b!514158 (= e!300233 e!300232)))

(declare-fun lt!235401 () (_ BitVec 64))

(assert (=> b!514158 (= lt!235401 (select (arr!15856 a!3235) j!176))))

(declare-fun lt!235405 () Unit!15904)

(assert (=> b!514158 (= lt!235405 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235401 j!176))))

(assert (=> b!514158 (arrayContainsKey!0 a!3235 lt!235401 #b00000000000000000000000000000000)))

(declare-fun lt!235404 () Unit!15904)

(assert (=> b!514158 (= lt!235404 lt!235405)))

(declare-fun res!314163 () Bool)

(assert (=> b!514158 (= res!314163 (= (seekEntryOrOpen!0 (select (arr!15856 a!3235) j!176) a!3235 mask!3524) (Found!4323 j!176)))))

(assert (=> b!514158 (=> (not res!314163) (not e!300232))))

(declare-fun b!514159 () Bool)

(assert (=> b!514159 (= e!300233 call!31591)))

(assert (= (and d!79325 (not res!314162)) b!514156))

(assert (= (and b!514156 c!60283) b!514158))

(assert (= (and b!514156 (not c!60283)) b!514159))

(assert (= (and b!514158 res!314163) b!514157))

(assert (= (or b!514157 b!514159) bm!31588))

(assert (=> b!514156 m!495453))

(assert (=> b!514156 m!495453))

(assert (=> b!514156 m!495479))

(declare-fun m!495637 () Bool)

(assert (=> bm!31588 m!495637))

(assert (=> b!514158 m!495453))

(declare-fun m!495639 () Bool)

(assert (=> b!514158 m!495639))

(declare-fun m!495641 () Bool)

(assert (=> b!514158 m!495641))

(assert (=> b!514158 m!495453))

(assert (=> b!514158 m!495455))

(assert (=> b!513947 d!79325))

(check-sat (not b!514052) (not d!79301) (not d!79323) (not b!514028) (not b!514054) (not d!79267) (not d!79315) (not b!514156) (not b!514013) (not b!514022) (not bm!31582) (not b!514004) (not b!514129) (not bm!31588) (not b!514151) (not d!79287) (not b!514158) (not b!514053) (not b!514024) (not bm!31577))
(check-sat)
