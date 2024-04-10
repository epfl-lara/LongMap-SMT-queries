; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47406 () Bool)

(assert start!47406)

(declare-fun b!521494 () Bool)

(declare-fun res!319288 () Bool)

(declare-fun e!304243 () Bool)

(assert (=> b!521494 (=> res!319288 e!304243)))

(declare-datatypes ((SeekEntryResult!4439 0))(
  ( (MissingZero!4439 (index!19959 (_ BitVec 32))) (Found!4439 (index!19960 (_ BitVec 32))) (Intermediate!4439 (undefined!5251 Bool) (index!19961 (_ BitVec 32)) (x!48945 (_ BitVec 32))) (Undefined!4439) (MissingVacant!4439 (index!19962 (_ BitVec 32))) )
))
(declare-fun lt!238998 () SeekEntryResult!4439)

(assert (=> b!521494 (= res!319288 (or (undefined!5251 lt!238998) (not (is-Intermediate!4439 lt!238998))))))

(declare-fun b!521495 () Bool)

(declare-fun e!304248 () Bool)

(assert (=> b!521495 (= e!304248 (not e!304243))))

(declare-fun res!319284 () Bool)

(assert (=> b!521495 (=> res!319284 e!304243)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!239000 () (_ BitVec 64))

(declare-datatypes ((array!33232 0))(
  ( (array!33233 (arr!15972 (Array (_ BitVec 32) (_ BitVec 64))) (size!16336 (_ BitVec 32))) )
))
(declare-fun lt!239002 () array!33232)

(declare-fun lt!238996 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33232 (_ BitVec 32)) SeekEntryResult!4439)

(assert (=> b!521495 (= res!319284 (= lt!238998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238996 lt!239000 lt!239002 mask!3524)))))

(declare-fun lt!238997 () (_ BitVec 32))

(declare-fun a!3235 () array!33232)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521495 (= lt!238998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238997 (select (arr!15972 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521495 (= lt!238996 (toIndex!0 lt!239000 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521495 (= lt!239000 (select (store (arr!15972 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521495 (= lt!238997 (toIndex!0 (select (arr!15972 a!3235) j!176) mask!3524))))

(assert (=> b!521495 (= lt!239002 (array!33233 (store (arr!15972 a!3235) i!1204 k!2280) (size!16336 a!3235)))))

(declare-fun e!304244 () Bool)

(assert (=> b!521495 e!304244))

(declare-fun res!319293 () Bool)

(assert (=> b!521495 (=> (not res!319293) (not e!304244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33232 (_ BitVec 32)) Bool)

(assert (=> b!521495 (= res!319293 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16208 0))(
  ( (Unit!16209) )
))
(declare-fun lt!238995 () Unit!16208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16208)

(assert (=> b!521495 (= lt!238995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521496 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33232 (_ BitVec 32)) SeekEntryResult!4439)

(assert (=> b!521496 (= e!304244 (= (seekEntryOrOpen!0 (select (arr!15972 a!3235) j!176) a!3235 mask!3524) (Found!4439 j!176)))))

(declare-fun b!521497 () Bool)

(declare-fun res!319292 () Bool)

(declare-fun e!304247 () Bool)

(assert (=> b!521497 (=> (not res!319292) (not e!304247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521497 (= res!319292 (validKeyInArray!0 (select (arr!15972 a!3235) j!176)))))

(declare-fun b!521498 () Bool)

(declare-fun res!319289 () Bool)

(assert (=> b!521498 (=> (not res!319289) (not e!304248))))

(assert (=> b!521498 (= res!319289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521499 () Bool)

(assert (=> b!521499 (= e!304243 true)))

(assert (=> b!521499 (and (or (= (select (arr!15972 a!3235) (index!19961 lt!238998)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15972 a!3235) (index!19961 lt!238998)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15972 a!3235) (index!19961 lt!238998)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15972 a!3235) (index!19961 lt!238998)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239001 () Unit!16208)

(declare-fun e!304242 () Unit!16208)

(assert (=> b!521499 (= lt!239001 e!304242)))

(declare-fun c!61406 () Bool)

(assert (=> b!521499 (= c!61406 (= (select (arr!15972 a!3235) (index!19961 lt!238998)) (select (arr!15972 a!3235) j!176)))))

(assert (=> b!521499 (and (bvslt (x!48945 lt!238998) #b01111111111111111111111111111110) (or (= (select (arr!15972 a!3235) (index!19961 lt!238998)) (select (arr!15972 a!3235) j!176)) (= (select (arr!15972 a!3235) (index!19961 lt!238998)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15972 a!3235) (index!19961 lt!238998)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521500 () Bool)

(declare-fun res!319286 () Bool)

(assert (=> b!521500 (=> (not res!319286) (not e!304247))))

(assert (=> b!521500 (= res!319286 (and (= (size!16336 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16336 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16336 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521501 () Bool)

(declare-fun res!319295 () Bool)

(assert (=> b!521501 (=> (not res!319295) (not e!304248))))

(declare-datatypes ((List!10130 0))(
  ( (Nil!10127) (Cons!10126 (h!11048 (_ BitVec 64)) (t!16358 List!10130)) )
))
(declare-fun arrayNoDuplicates!0 (array!33232 (_ BitVec 32) List!10130) Bool)

(assert (=> b!521501 (= res!319295 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10127))))

(declare-fun res!319291 () Bool)

(assert (=> start!47406 (=> (not res!319291) (not e!304247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47406 (= res!319291 (validMask!0 mask!3524))))

(assert (=> start!47406 e!304247))

(assert (=> start!47406 true))

(declare-fun array_inv!11768 (array!33232) Bool)

(assert (=> start!47406 (array_inv!11768 a!3235)))

(declare-fun b!521502 () Bool)

(declare-fun res!319294 () Bool)

(assert (=> b!521502 (=> (not res!319294) (not e!304247))))

(assert (=> b!521502 (= res!319294 (validKeyInArray!0 k!2280))))

(declare-fun b!521503 () Bool)

(declare-fun Unit!16210 () Unit!16208)

(assert (=> b!521503 (= e!304242 Unit!16210)))

(declare-fun b!521504 () Bool)

(declare-fun res!319287 () Bool)

(assert (=> b!521504 (=> (not res!319287) (not e!304247))))

(declare-fun arrayContainsKey!0 (array!33232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521504 (= res!319287 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521505 () Bool)

(declare-fun e!304246 () Bool)

(assert (=> b!521505 (= e!304246 false)))

(declare-fun b!521506 () Bool)

(declare-fun Unit!16211 () Unit!16208)

(assert (=> b!521506 (= e!304242 Unit!16211)))

(declare-fun lt!238994 () Unit!16208)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33232 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16208)

(assert (=> b!521506 (= lt!238994 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238997 #b00000000000000000000000000000000 (index!19961 lt!238998) (x!48945 lt!238998) mask!3524))))

(declare-fun res!319285 () Bool)

(assert (=> b!521506 (= res!319285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238997 lt!239000 lt!239002 mask!3524) (Intermediate!4439 false (index!19961 lt!238998) (x!48945 lt!238998))))))

(assert (=> b!521506 (=> (not res!319285) (not e!304246))))

(assert (=> b!521506 e!304246))

(declare-fun b!521507 () Bool)

(assert (=> b!521507 (= e!304247 e!304248)))

(declare-fun res!319290 () Bool)

(assert (=> b!521507 (=> (not res!319290) (not e!304248))))

(declare-fun lt!238999 () SeekEntryResult!4439)

(assert (=> b!521507 (= res!319290 (or (= lt!238999 (MissingZero!4439 i!1204)) (= lt!238999 (MissingVacant!4439 i!1204))))))

(assert (=> b!521507 (= lt!238999 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47406 res!319291) b!521500))

(assert (= (and b!521500 res!319286) b!521497))

(assert (= (and b!521497 res!319292) b!521502))

(assert (= (and b!521502 res!319294) b!521504))

(assert (= (and b!521504 res!319287) b!521507))

(assert (= (and b!521507 res!319290) b!521498))

(assert (= (and b!521498 res!319289) b!521501))

(assert (= (and b!521501 res!319295) b!521495))

(assert (= (and b!521495 res!319293) b!521496))

(assert (= (and b!521495 (not res!319284)) b!521494))

(assert (= (and b!521494 (not res!319288)) b!521499))

(assert (= (and b!521499 c!61406) b!521506))

(assert (= (and b!521499 (not c!61406)) b!521503))

(assert (= (and b!521506 res!319285) b!521505))

(declare-fun m!502407 () Bool)

(assert (=> b!521507 m!502407))

(declare-fun m!502409 () Bool)

(assert (=> b!521501 m!502409))

(declare-fun m!502411 () Bool)

(assert (=> b!521498 m!502411))

(declare-fun m!502413 () Bool)

(assert (=> b!521496 m!502413))

(assert (=> b!521496 m!502413))

(declare-fun m!502415 () Bool)

(assert (=> b!521496 m!502415))

(declare-fun m!502417 () Bool)

(assert (=> b!521506 m!502417))

(declare-fun m!502419 () Bool)

(assert (=> b!521506 m!502419))

(declare-fun m!502421 () Bool)

(assert (=> b!521502 m!502421))

(declare-fun m!502423 () Bool)

(assert (=> b!521495 m!502423))

(declare-fun m!502425 () Bool)

(assert (=> b!521495 m!502425))

(declare-fun m!502427 () Bool)

(assert (=> b!521495 m!502427))

(declare-fun m!502429 () Bool)

(assert (=> b!521495 m!502429))

(assert (=> b!521495 m!502413))

(declare-fun m!502431 () Bool)

(assert (=> b!521495 m!502431))

(assert (=> b!521495 m!502413))

(declare-fun m!502433 () Bool)

(assert (=> b!521495 m!502433))

(assert (=> b!521495 m!502413))

(declare-fun m!502435 () Bool)

(assert (=> b!521495 m!502435))

(declare-fun m!502437 () Bool)

(assert (=> b!521495 m!502437))

(declare-fun m!502439 () Bool)

(assert (=> start!47406 m!502439))

(declare-fun m!502441 () Bool)

(assert (=> start!47406 m!502441))

(declare-fun m!502443 () Bool)

(assert (=> b!521504 m!502443))

(declare-fun m!502445 () Bool)

(assert (=> b!521499 m!502445))

(assert (=> b!521499 m!502413))

(assert (=> b!521497 m!502413))

(assert (=> b!521497 m!502413))

(declare-fun m!502447 () Bool)

(assert (=> b!521497 m!502447))

(push 1)

