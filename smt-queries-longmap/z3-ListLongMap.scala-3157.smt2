; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44454 () Bool)

(assert start!44454)

(declare-fun res!291421 () Bool)

(declare-fun e!287124 () Bool)

(assert (=> start!44454 (=> (not res!291421) (not e!287124))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44454 (= res!291421 (validMask!0 mask!3524))))

(assert (=> start!44454 e!287124))

(assert (=> start!44454 true))

(declare-datatypes ((array!31619 0))(
  ( (array!31620 (arr!15200 (Array (_ BitVec 32) (_ BitVec 64))) (size!15565 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31619)

(declare-fun array_inv!11083 (array!31619) Bool)

(assert (=> start!44454 (array_inv!11083 a!3235)))

(declare-fun b!488114 () Bool)

(declare-fun res!291420 () Bool)

(assert (=> b!488114 (=> (not res!291420) (not e!287124))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488114 (= res!291420 (validKeyInArray!0 (select (arr!15200 a!3235) j!176)))))

(declare-fun b!488115 () Bool)

(declare-fun res!291423 () Bool)

(assert (=> b!488115 (=> (not res!291423) (not e!287124))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488115 (= res!291423 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488116 () Bool)

(declare-fun res!291422 () Bool)

(declare-fun e!287125 () Bool)

(assert (=> b!488116 (=> (not res!291422) (not e!287125))))

(declare-datatypes ((List!9397 0))(
  ( (Nil!9394) (Cons!9393 (h!10252 (_ BitVec 64)) (t!15616 List!9397)) )
))
(declare-fun arrayNoDuplicates!0 (array!31619 (_ BitVec 32) List!9397) Bool)

(assert (=> b!488116 (= res!291422 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9394))))

(declare-fun b!488117 () Bool)

(declare-fun e!287126 () Bool)

(declare-datatypes ((SeekEntryResult!3664 0))(
  ( (MissingZero!3664 (index!16835 (_ BitVec 32))) (Found!3664 (index!16836 (_ BitVec 32))) (Intermediate!3664 (undefined!4476 Bool) (index!16837 (_ BitVec 32)) (x!45962 (_ BitVec 32))) (Undefined!3664) (MissingVacant!3664 (index!16838 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31619 (_ BitVec 32)) SeekEntryResult!3664)

(assert (=> b!488117 (= e!287126 (= (seekEntryOrOpen!0 (select (arr!15200 a!3235) j!176) a!3235 mask!3524) (Found!3664 j!176)))))

(declare-fun b!488118 () Bool)

(declare-fun res!291418 () Bool)

(assert (=> b!488118 (=> (not res!291418) (not e!287124))))

(assert (=> b!488118 (= res!291418 (validKeyInArray!0 k0!2280))))

(declare-fun b!488119 () Bool)

(declare-fun res!291425 () Bool)

(assert (=> b!488119 (=> (not res!291425) (not e!287124))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488119 (= res!291425 (and (= (size!15565 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15565 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15565 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488120 () Bool)

(declare-fun res!291419 () Bool)

(assert (=> b!488120 (=> (not res!291419) (not e!287125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31619 (_ BitVec 32)) Bool)

(assert (=> b!488120 (= res!291419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488121 () Bool)

(assert (=> b!488121 (= e!287124 e!287125)))

(declare-fun res!291417 () Bool)

(assert (=> b!488121 (=> (not res!291417) (not e!287125))))

(declare-fun lt!220150 () SeekEntryResult!3664)

(assert (=> b!488121 (= res!291417 (or (= lt!220150 (MissingZero!3664 i!1204)) (= lt!220150 (MissingVacant!3664 i!1204))))))

(assert (=> b!488121 (= lt!220150 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488122 () Bool)

(assert (=> b!488122 (= e!287125 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111))))))

(assert (=> b!488122 e!287126))

(declare-fun res!291424 () Bool)

(assert (=> b!488122 (=> (not res!291424) (not e!287126))))

(assert (=> b!488122 (= res!291424 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14260 0))(
  ( (Unit!14261) )
))
(declare-fun lt!220149 () Unit!14260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14260)

(assert (=> b!488122 (= lt!220149 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44454 res!291421) b!488119))

(assert (= (and b!488119 res!291425) b!488114))

(assert (= (and b!488114 res!291420) b!488118))

(assert (= (and b!488118 res!291418) b!488115))

(assert (= (and b!488115 res!291423) b!488121))

(assert (= (and b!488121 res!291417) b!488120))

(assert (= (and b!488120 res!291419) b!488116))

(assert (= (and b!488116 res!291422) b!488122))

(assert (= (and b!488122 res!291424) b!488117))

(declare-fun m!467371 () Bool)

(assert (=> b!488122 m!467371))

(declare-fun m!467373 () Bool)

(assert (=> b!488122 m!467373))

(declare-fun m!467375 () Bool)

(assert (=> b!488114 m!467375))

(assert (=> b!488114 m!467375))

(declare-fun m!467377 () Bool)

(assert (=> b!488114 m!467377))

(declare-fun m!467379 () Bool)

(assert (=> b!488118 m!467379))

(assert (=> b!488117 m!467375))

(assert (=> b!488117 m!467375))

(declare-fun m!467381 () Bool)

(assert (=> b!488117 m!467381))

(declare-fun m!467383 () Bool)

(assert (=> b!488120 m!467383))

(declare-fun m!467385 () Bool)

(assert (=> start!44454 m!467385))

(declare-fun m!467387 () Bool)

(assert (=> start!44454 m!467387))

(declare-fun m!467389 () Bool)

(assert (=> b!488121 m!467389))

(declare-fun m!467391 () Bool)

(assert (=> b!488115 m!467391))

(declare-fun m!467393 () Bool)

(assert (=> b!488116 m!467393))

(check-sat (not start!44454) (not b!488114) (not b!488118) (not b!488117) (not b!488121) (not b!488116) (not b!488120) (not b!488122) (not b!488115))
(check-sat)
(get-model)

(declare-fun b!488187 () Bool)

(declare-fun e!287160 () Bool)

(declare-fun contains!2686 (List!9397 (_ BitVec 64)) Bool)

(assert (=> b!488187 (= e!287160 (contains!2686 Nil!9394 (select (arr!15200 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488188 () Bool)

(declare-fun e!287162 () Bool)

(declare-fun call!31303 () Bool)

(assert (=> b!488188 (= e!287162 call!31303)))

(declare-fun b!488189 () Bool)

(declare-fun e!287163 () Bool)

(declare-fun e!287161 () Bool)

(assert (=> b!488189 (= e!287163 e!287161)))

(declare-fun res!291488 () Bool)

(assert (=> b!488189 (=> (not res!291488) (not e!287161))))

(assert (=> b!488189 (= res!291488 (not e!287160))))

(declare-fun res!291487 () Bool)

(assert (=> b!488189 (=> (not res!291487) (not e!287160))))

(assert (=> b!488189 (= res!291487 (validKeyInArray!0 (select (arr!15200 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488190 () Bool)

(assert (=> b!488190 (= e!287161 e!287162)))

(declare-fun c!58620 () Bool)

(assert (=> b!488190 (= c!58620 (validKeyInArray!0 (select (arr!15200 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488191 () Bool)

(assert (=> b!488191 (= e!287162 call!31303)))

(declare-fun d!77583 () Bool)

(declare-fun res!291486 () Bool)

(assert (=> d!77583 (=> res!291486 e!287163)))

(assert (=> d!77583 (= res!291486 (bvsge #b00000000000000000000000000000000 (size!15565 a!3235)))))

(assert (=> d!77583 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9394) e!287163)))

(declare-fun bm!31300 () Bool)

(assert (=> bm!31300 (= call!31303 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58620 (Cons!9393 (select (arr!15200 a!3235) #b00000000000000000000000000000000) Nil!9394) Nil!9394)))))

(assert (= (and d!77583 (not res!291486)) b!488189))

(assert (= (and b!488189 res!291487) b!488187))

(assert (= (and b!488189 res!291488) b!488190))

(assert (= (and b!488190 c!58620) b!488188))

(assert (= (and b!488190 (not c!58620)) b!488191))

(assert (= (or b!488188 b!488191) bm!31300))

(declare-fun m!467443 () Bool)

(assert (=> b!488187 m!467443))

(assert (=> b!488187 m!467443))

(declare-fun m!467445 () Bool)

(assert (=> b!488187 m!467445))

(assert (=> b!488189 m!467443))

(assert (=> b!488189 m!467443))

(declare-fun m!467447 () Bool)

(assert (=> b!488189 m!467447))

(assert (=> b!488190 m!467443))

(assert (=> b!488190 m!467443))

(assert (=> b!488190 m!467447))

(assert (=> bm!31300 m!467443))

(declare-fun m!467449 () Bool)

(assert (=> bm!31300 m!467449))

(assert (=> b!488116 d!77583))

(declare-fun b!488233 () Bool)

(declare-fun e!287194 () SeekEntryResult!3664)

(declare-fun lt!220177 () SeekEntryResult!3664)

(assert (=> b!488233 (= e!287194 (Found!3664 (index!16837 lt!220177)))))

(declare-fun b!488234 () Bool)

(declare-fun c!58634 () Bool)

(declare-fun lt!220176 () (_ BitVec 64))

(assert (=> b!488234 (= c!58634 (= lt!220176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287195 () SeekEntryResult!3664)

(assert (=> b!488234 (= e!287194 e!287195)))

(declare-fun b!488235 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31619 (_ BitVec 32)) SeekEntryResult!3664)

(assert (=> b!488235 (= e!287195 (seekKeyOrZeroReturnVacant!0 (x!45962 lt!220177) (index!16837 lt!220177) (index!16837 lt!220177) k0!2280 a!3235 mask!3524))))

(declare-fun b!488237 () Bool)

(declare-fun e!287196 () SeekEntryResult!3664)

(assert (=> b!488237 (= e!287196 Undefined!3664)))

(declare-fun b!488238 () Bool)

(assert (=> b!488238 (= e!287196 e!287194)))

(assert (=> b!488238 (= lt!220176 (select (arr!15200 a!3235) (index!16837 lt!220177)))))

(declare-fun c!58633 () Bool)

(assert (=> b!488238 (= c!58633 (= lt!220176 k0!2280))))

(declare-fun b!488236 () Bool)

(assert (=> b!488236 (= e!287195 (MissingZero!3664 (index!16837 lt!220177)))))

(declare-fun d!77585 () Bool)

(declare-fun lt!220175 () SeekEntryResult!3664)

(get-info :version)

(assert (=> d!77585 (and (or ((_ is Undefined!3664) lt!220175) (not ((_ is Found!3664) lt!220175)) (and (bvsge (index!16836 lt!220175) #b00000000000000000000000000000000) (bvslt (index!16836 lt!220175) (size!15565 a!3235)))) (or ((_ is Undefined!3664) lt!220175) ((_ is Found!3664) lt!220175) (not ((_ is MissingZero!3664) lt!220175)) (and (bvsge (index!16835 lt!220175) #b00000000000000000000000000000000) (bvslt (index!16835 lt!220175) (size!15565 a!3235)))) (or ((_ is Undefined!3664) lt!220175) ((_ is Found!3664) lt!220175) ((_ is MissingZero!3664) lt!220175) (not ((_ is MissingVacant!3664) lt!220175)) (and (bvsge (index!16838 lt!220175) #b00000000000000000000000000000000) (bvslt (index!16838 lt!220175) (size!15565 a!3235)))) (or ((_ is Undefined!3664) lt!220175) (ite ((_ is Found!3664) lt!220175) (= (select (arr!15200 a!3235) (index!16836 lt!220175)) k0!2280) (ite ((_ is MissingZero!3664) lt!220175) (= (select (arr!15200 a!3235) (index!16835 lt!220175)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3664) lt!220175) (= (select (arr!15200 a!3235) (index!16838 lt!220175)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77585 (= lt!220175 e!287196)))

(declare-fun c!58632 () Bool)

(assert (=> d!77585 (= c!58632 (and ((_ is Intermediate!3664) lt!220177) (undefined!4476 lt!220177)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31619 (_ BitVec 32)) SeekEntryResult!3664)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77585 (= lt!220177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77585 (validMask!0 mask!3524)))

(assert (=> d!77585 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!220175)))

(assert (= (and d!77585 c!58632) b!488237))

(assert (= (and d!77585 (not c!58632)) b!488238))

(assert (= (and b!488238 c!58633) b!488233))

(assert (= (and b!488238 (not c!58633)) b!488234))

(assert (= (and b!488234 c!58634) b!488236))

(assert (= (and b!488234 (not c!58634)) b!488235))

(declare-fun m!467463 () Bool)

(assert (=> b!488235 m!467463))

(declare-fun m!467465 () Bool)

(assert (=> b!488238 m!467465))

(declare-fun m!467467 () Bool)

(assert (=> d!77585 m!467467))

(declare-fun m!467469 () Bool)

(assert (=> d!77585 m!467469))

(declare-fun m!467471 () Bool)

(assert (=> d!77585 m!467471))

(declare-fun m!467473 () Bool)

(assert (=> d!77585 m!467473))

(declare-fun m!467475 () Bool)

(assert (=> d!77585 m!467475))

(assert (=> d!77585 m!467467))

(assert (=> d!77585 m!467385))

(assert (=> b!488121 d!77585))

(declare-fun d!77597 () Bool)

(declare-fun res!291514 () Bool)

(declare-fun e!287210 () Bool)

(assert (=> d!77597 (=> res!291514 e!287210)))

(assert (=> d!77597 (= res!291514 (= (select (arr!15200 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77597 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!287210)))

(declare-fun b!488259 () Bool)

(declare-fun e!287211 () Bool)

(assert (=> b!488259 (= e!287210 e!287211)))

(declare-fun res!291515 () Bool)

(assert (=> b!488259 (=> (not res!291515) (not e!287211))))

(assert (=> b!488259 (= res!291515 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15565 a!3235)))))

(declare-fun b!488260 () Bool)

(assert (=> b!488260 (= e!287211 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77597 (not res!291514)) b!488259))

(assert (= (and b!488259 res!291515) b!488260))

(assert (=> d!77597 m!467443))

(declare-fun m!467483 () Bool)

(assert (=> b!488260 m!467483))

(assert (=> b!488115 d!77597))

(declare-fun b!488279 () Bool)

(declare-fun e!287224 () Bool)

(declare-fun e!287226 () Bool)

(assert (=> b!488279 (= e!287224 e!287226)))

(declare-fun lt!220204 () (_ BitVec 64))

(assert (=> b!488279 (= lt!220204 (select (arr!15200 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220202 () Unit!14260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31619 (_ BitVec 64) (_ BitVec 32)) Unit!14260)

(assert (=> b!488279 (= lt!220202 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220204 #b00000000000000000000000000000000))))

(assert (=> b!488279 (arrayContainsKey!0 a!3235 lt!220204 #b00000000000000000000000000000000)))

(declare-fun lt!220203 () Unit!14260)

(assert (=> b!488279 (= lt!220203 lt!220202)))

(declare-fun res!291523 () Bool)

(assert (=> b!488279 (= res!291523 (= (seekEntryOrOpen!0 (select (arr!15200 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3664 #b00000000000000000000000000000000)))))

(assert (=> b!488279 (=> (not res!291523) (not e!287226))))

(declare-fun d!77601 () Bool)

(declare-fun res!291522 () Bool)

(declare-fun e!287225 () Bool)

(assert (=> d!77601 (=> res!291522 e!287225)))

(assert (=> d!77601 (= res!291522 (bvsge #b00000000000000000000000000000000 (size!15565 a!3235)))))

(assert (=> d!77601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287225)))

(declare-fun bm!31310 () Bool)

(declare-fun call!31313 () Bool)

(assert (=> bm!31310 (= call!31313 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488280 () Bool)

(assert (=> b!488280 (= e!287226 call!31313)))

(declare-fun b!488281 () Bool)

(assert (=> b!488281 (= e!287224 call!31313)))

(declare-fun b!488282 () Bool)

(assert (=> b!488282 (= e!287225 e!287224)))

(declare-fun c!58648 () Bool)

(assert (=> b!488282 (= c!58648 (validKeyInArray!0 (select (arr!15200 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77601 (not res!291522)) b!488282))

(assert (= (and b!488282 c!58648) b!488279))

(assert (= (and b!488282 (not c!58648)) b!488281))

(assert (= (and b!488279 res!291523) b!488280))

(assert (= (or b!488280 b!488281) bm!31310))

(assert (=> b!488279 m!467443))

(declare-fun m!467509 () Bool)

(assert (=> b!488279 m!467509))

(declare-fun m!467511 () Bool)

(assert (=> b!488279 m!467511))

(assert (=> b!488279 m!467443))

(declare-fun m!467513 () Bool)

(assert (=> b!488279 m!467513))

(declare-fun m!467515 () Bool)

(assert (=> bm!31310 m!467515))

(assert (=> b!488282 m!467443))

(assert (=> b!488282 m!467443))

(assert (=> b!488282 m!467447))

(assert (=> b!488120 d!77601))

(declare-fun d!77609 () Bool)

(assert (=> d!77609 (= (validKeyInArray!0 (select (arr!15200 a!3235) j!176)) (and (not (= (select (arr!15200 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15200 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488114 d!77609))

(declare-fun d!77611 () Bool)

(assert (=> d!77611 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44454 d!77611))

(declare-fun d!77623 () Bool)

(assert (=> d!77623 (= (array_inv!11083 a!3235) (bvsge (size!15565 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44454 d!77623))

(declare-fun d!77625 () Bool)

(assert (=> d!77625 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488118 d!77625))

(declare-fun b!488311 () Bool)

(declare-fun e!287245 () SeekEntryResult!3664)

(declare-fun lt!220228 () SeekEntryResult!3664)

(assert (=> b!488311 (= e!287245 (Found!3664 (index!16837 lt!220228)))))

(declare-fun b!488312 () Bool)

(declare-fun c!58661 () Bool)

(declare-fun lt!220227 () (_ BitVec 64))

(assert (=> b!488312 (= c!58661 (= lt!220227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287246 () SeekEntryResult!3664)

(assert (=> b!488312 (= e!287245 e!287246)))

(declare-fun b!488313 () Bool)

(assert (=> b!488313 (= e!287246 (seekKeyOrZeroReturnVacant!0 (x!45962 lt!220228) (index!16837 lt!220228) (index!16837 lt!220228) (select (arr!15200 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!488315 () Bool)

(declare-fun e!287247 () SeekEntryResult!3664)

(assert (=> b!488315 (= e!287247 Undefined!3664)))

(declare-fun b!488316 () Bool)

(assert (=> b!488316 (= e!287247 e!287245)))

(assert (=> b!488316 (= lt!220227 (select (arr!15200 a!3235) (index!16837 lt!220228)))))

(declare-fun c!58660 () Bool)

(assert (=> b!488316 (= c!58660 (= lt!220227 (select (arr!15200 a!3235) j!176)))))

(declare-fun b!488314 () Bool)

(assert (=> b!488314 (= e!287246 (MissingZero!3664 (index!16837 lt!220228)))))

(declare-fun d!77627 () Bool)

(declare-fun lt!220226 () SeekEntryResult!3664)

(assert (=> d!77627 (and (or ((_ is Undefined!3664) lt!220226) (not ((_ is Found!3664) lt!220226)) (and (bvsge (index!16836 lt!220226) #b00000000000000000000000000000000) (bvslt (index!16836 lt!220226) (size!15565 a!3235)))) (or ((_ is Undefined!3664) lt!220226) ((_ is Found!3664) lt!220226) (not ((_ is MissingZero!3664) lt!220226)) (and (bvsge (index!16835 lt!220226) #b00000000000000000000000000000000) (bvslt (index!16835 lt!220226) (size!15565 a!3235)))) (or ((_ is Undefined!3664) lt!220226) ((_ is Found!3664) lt!220226) ((_ is MissingZero!3664) lt!220226) (not ((_ is MissingVacant!3664) lt!220226)) (and (bvsge (index!16838 lt!220226) #b00000000000000000000000000000000) (bvslt (index!16838 lt!220226) (size!15565 a!3235)))) (or ((_ is Undefined!3664) lt!220226) (ite ((_ is Found!3664) lt!220226) (= (select (arr!15200 a!3235) (index!16836 lt!220226)) (select (arr!15200 a!3235) j!176)) (ite ((_ is MissingZero!3664) lt!220226) (= (select (arr!15200 a!3235) (index!16835 lt!220226)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3664) lt!220226) (= (select (arr!15200 a!3235) (index!16838 lt!220226)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77627 (= lt!220226 e!287247)))

(declare-fun c!58659 () Bool)

(assert (=> d!77627 (= c!58659 (and ((_ is Intermediate!3664) lt!220228) (undefined!4476 lt!220228)))))

(assert (=> d!77627 (= lt!220228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15200 a!3235) j!176) mask!3524) (select (arr!15200 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77627 (validMask!0 mask!3524)))

(assert (=> d!77627 (= (seekEntryOrOpen!0 (select (arr!15200 a!3235) j!176) a!3235 mask!3524) lt!220226)))

(assert (= (and d!77627 c!58659) b!488315))

(assert (= (and d!77627 (not c!58659)) b!488316))

(assert (= (and b!488316 c!58660) b!488311))

(assert (= (and b!488316 (not c!58660)) b!488312))

(assert (= (and b!488312 c!58661) b!488314))

(assert (= (and b!488312 (not c!58661)) b!488313))

(assert (=> b!488313 m!467375))

(declare-fun m!467535 () Bool)

(assert (=> b!488313 m!467535))

(declare-fun m!467537 () Bool)

(assert (=> b!488316 m!467537))

(declare-fun m!467539 () Bool)

(assert (=> d!77627 m!467539))

(assert (=> d!77627 m!467375))

(declare-fun m!467541 () Bool)

(assert (=> d!77627 m!467541))

(declare-fun m!467543 () Bool)

(assert (=> d!77627 m!467543))

(declare-fun m!467545 () Bool)

(assert (=> d!77627 m!467545))

(declare-fun m!467547 () Bool)

(assert (=> d!77627 m!467547))

(assert (=> d!77627 m!467375))

(assert (=> d!77627 m!467539))

(assert (=> d!77627 m!467385))

(assert (=> b!488117 d!77627))

(declare-fun b!488317 () Bool)

(declare-fun e!287248 () Bool)

(declare-fun e!287250 () Bool)

(assert (=> b!488317 (= e!287248 e!287250)))

(declare-fun lt!220231 () (_ BitVec 64))

(assert (=> b!488317 (= lt!220231 (select (arr!15200 a!3235) j!176))))

(declare-fun lt!220229 () Unit!14260)

(assert (=> b!488317 (= lt!220229 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220231 j!176))))

(assert (=> b!488317 (arrayContainsKey!0 a!3235 lt!220231 #b00000000000000000000000000000000)))

(declare-fun lt!220230 () Unit!14260)

(assert (=> b!488317 (= lt!220230 lt!220229)))

(declare-fun res!291533 () Bool)

(assert (=> b!488317 (= res!291533 (= (seekEntryOrOpen!0 (select (arr!15200 a!3235) j!176) a!3235 mask!3524) (Found!3664 j!176)))))

(assert (=> b!488317 (=> (not res!291533) (not e!287250))))

(declare-fun d!77629 () Bool)

(declare-fun res!291532 () Bool)

(declare-fun e!287249 () Bool)

(assert (=> d!77629 (=> res!291532 e!287249)))

(assert (=> d!77629 (= res!291532 (bvsge j!176 (size!15565 a!3235)))))

(assert (=> d!77629 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287249)))

(declare-fun bm!31315 () Bool)

(declare-fun call!31318 () Bool)

(assert (=> bm!31315 (= call!31318 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488318 () Bool)

(assert (=> b!488318 (= e!287250 call!31318)))

(declare-fun b!488319 () Bool)

(assert (=> b!488319 (= e!287248 call!31318)))

(declare-fun b!488320 () Bool)

(assert (=> b!488320 (= e!287249 e!287248)))

(declare-fun c!58662 () Bool)

(assert (=> b!488320 (= c!58662 (validKeyInArray!0 (select (arr!15200 a!3235) j!176)))))

(assert (= (and d!77629 (not res!291532)) b!488320))

(assert (= (and b!488320 c!58662) b!488317))

(assert (= (and b!488320 (not c!58662)) b!488319))

(assert (= (and b!488317 res!291533) b!488318))

(assert (= (or b!488318 b!488319) bm!31315))

(assert (=> b!488317 m!467375))

(declare-fun m!467549 () Bool)

(assert (=> b!488317 m!467549))

(declare-fun m!467551 () Bool)

(assert (=> b!488317 m!467551))

(assert (=> b!488317 m!467375))

(assert (=> b!488317 m!467381))

(declare-fun m!467553 () Bool)

(assert (=> bm!31315 m!467553))

(assert (=> b!488320 m!467375))

(assert (=> b!488320 m!467375))

(assert (=> b!488320 m!467377))

(assert (=> b!488122 d!77629))

(declare-fun d!77631 () Bool)

(assert (=> d!77631 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220237 () Unit!14260)

(declare-fun choose!38 (array!31619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14260)

(assert (=> d!77631 (= lt!220237 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77631 (validMask!0 mask!3524)))

(assert (=> d!77631 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220237)))

(declare-fun bs!15540 () Bool)

(assert (= bs!15540 d!77631))

(assert (=> bs!15540 m!467371))

(declare-fun m!467569 () Bool)

(assert (=> bs!15540 m!467569))

(assert (=> bs!15540 m!467385))

(assert (=> b!488122 d!77631))

(check-sat (not bm!31315) (not b!488190) (not d!77585) (not d!77627) (not d!77631) (not b!488317) (not b!488235) (not b!488313) (not b!488279) (not bm!31310) (not b!488320) (not b!488187) (not b!488260) (not b!488189) (not b!488282) (not bm!31300))
(check-sat)
