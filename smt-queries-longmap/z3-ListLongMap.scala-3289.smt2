; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45680 () Bool)

(assert start!45680)

(declare-fun b!504268 () Bool)

(declare-fun res!305483 () Bool)

(declare-fun e!295261 () Bool)

(assert (=> b!504268 (=> (not res!305483) (not e!295261))))

(declare-datatypes ((array!32436 0))(
  ( (array!32437 (arr!15598 (Array (_ BitVec 32) (_ BitVec 64))) (size!15962 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32436)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32436 (_ BitVec 32)) Bool)

(assert (=> b!504268 (= res!305483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504269 () Bool)

(declare-fun e!295262 () Bool)

(declare-fun e!295264 () Bool)

(assert (=> b!504269 (= e!295262 e!295264)))

(declare-fun res!305469 () Bool)

(assert (=> b!504269 (=> res!305469 e!295264)))

(declare-datatypes ((SeekEntryResult!4065 0))(
  ( (MissingZero!4065 (index!18448 (_ BitVec 32))) (Found!4065 (index!18449 (_ BitVec 32))) (Intermediate!4065 (undefined!4877 Bool) (index!18450 (_ BitVec 32)) (x!47466 (_ BitVec 32))) (Undefined!4065) (MissingVacant!4065 (index!18451 (_ BitVec 32))) )
))
(declare-fun lt!229561 () SeekEntryResult!4065)

(declare-fun lt!229564 () (_ BitVec 32))

(assert (=> b!504269 (= res!305469 (or (bvsgt (x!47466 lt!229561) #b01111111111111111111111111111110) (bvslt lt!229564 #b00000000000000000000000000000000) (bvsge lt!229564 (size!15962 a!3235)) (bvslt (index!18450 lt!229561) #b00000000000000000000000000000000) (bvsge (index!18450 lt!229561) (size!15962 a!3235)) (not (= lt!229561 (Intermediate!4065 false (index!18450 lt!229561) (x!47466 lt!229561))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504269 (= (index!18450 lt!229561) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15336 0))(
  ( (Unit!15337) )
))
(declare-fun lt!229565 () Unit!15336)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32436 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15336)

(assert (=> b!504269 (= lt!229565 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229564 #b00000000000000000000000000000000 (index!18450 lt!229561) (x!47466 lt!229561) mask!3524))))

(assert (=> b!504269 (and (or (= (select (arr!15598 a!3235) (index!18450 lt!229561)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15598 a!3235) (index!18450 lt!229561)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15598 a!3235) (index!18450 lt!229561)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15598 a!3235) (index!18450 lt!229561)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229567 () Unit!15336)

(declare-fun e!295263 () Unit!15336)

(assert (=> b!504269 (= lt!229567 e!295263)))

(declare-fun c!59678 () Bool)

(assert (=> b!504269 (= c!59678 (= (select (arr!15598 a!3235) (index!18450 lt!229561)) (select (arr!15598 a!3235) j!176)))))

(assert (=> b!504269 (and (bvslt (x!47466 lt!229561) #b01111111111111111111111111111110) (or (= (select (arr!15598 a!3235) (index!18450 lt!229561)) (select (arr!15598 a!3235) j!176)) (= (select (arr!15598 a!3235) (index!18450 lt!229561)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15598 a!3235) (index!18450 lt!229561)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504270 () Bool)

(declare-fun res!305479 () Bool)

(declare-fun e!295265 () Bool)

(assert (=> b!504270 (=> (not res!305479) (not e!295265))))

(assert (=> b!504270 (= res!305479 (and (= (size!15962 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15962 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15962 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504271 () Bool)

(assert (=> b!504271 (= e!295261 (not e!295262))))

(declare-fun res!305470 () Bool)

(assert (=> b!504271 (=> res!305470 e!295262)))

(declare-fun lt!229568 () array!32436)

(declare-fun lt!229563 () (_ BitVec 32))

(declare-fun lt!229569 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32436 (_ BitVec 32)) SeekEntryResult!4065)

(assert (=> b!504271 (= res!305470 (= lt!229561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229563 lt!229569 lt!229568 mask!3524)))))

(assert (=> b!504271 (= lt!229561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229564 (select (arr!15598 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504271 (= lt!229563 (toIndex!0 lt!229569 mask!3524))))

(assert (=> b!504271 (= lt!229569 (select (store (arr!15598 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504271 (= lt!229564 (toIndex!0 (select (arr!15598 a!3235) j!176) mask!3524))))

(assert (=> b!504271 (= lt!229568 (array!32437 (store (arr!15598 a!3235) i!1204 k0!2280) (size!15962 a!3235)))))

(declare-fun e!295269 () Bool)

(assert (=> b!504271 e!295269))

(declare-fun res!305476 () Bool)

(assert (=> b!504271 (=> (not res!305476) (not e!295269))))

(assert (=> b!504271 (= res!305476 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229566 () Unit!15336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15336)

(assert (=> b!504271 (= lt!229566 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504272 () Bool)

(declare-fun res!305473 () Bool)

(assert (=> b!504272 (=> res!305473 e!295262)))

(get-info :version)

(assert (=> b!504272 (= res!305473 (or (undefined!4877 lt!229561) (not ((_ is Intermediate!4065) lt!229561))))))

(declare-fun b!504273 () Bool)

(declare-fun Unit!15338 () Unit!15336)

(assert (=> b!504273 (= e!295263 Unit!15338)))

(declare-fun b!504274 () Bool)

(declare-fun res!305482 () Bool)

(assert (=> b!504274 (=> res!305482 e!295264)))

(declare-fun e!295267 () Bool)

(assert (=> b!504274 (= res!305482 e!295267)))

(declare-fun res!305474 () Bool)

(assert (=> b!504274 (=> (not res!305474) (not e!295267))))

(assert (=> b!504274 (= res!305474 (bvsgt #b00000000000000000000000000000000 (x!47466 lt!229561)))))

(declare-fun b!504276 () Bool)

(assert (=> b!504276 (= e!295265 e!295261)))

(declare-fun res!305472 () Bool)

(assert (=> b!504276 (=> (not res!305472) (not e!295261))))

(declare-fun lt!229570 () SeekEntryResult!4065)

(assert (=> b!504276 (= res!305472 (or (= lt!229570 (MissingZero!4065 i!1204)) (= lt!229570 (MissingVacant!4065 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32436 (_ BitVec 32)) SeekEntryResult!4065)

(assert (=> b!504276 (= lt!229570 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504277 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32436 (_ BitVec 32)) SeekEntryResult!4065)

(assert (=> b!504277 (= e!295267 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229564 (index!18450 lt!229561) (select (arr!15598 a!3235) j!176) a!3235 mask!3524) (Found!4065 j!176))))))

(declare-fun b!504278 () Bool)

(declare-fun res!305471 () Bool)

(assert (=> b!504278 (=> (not res!305471) (not e!295265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504278 (= res!305471 (validKeyInArray!0 k0!2280))))

(declare-fun b!504279 () Bool)

(assert (=> b!504279 (= e!295264 true)))

(declare-fun lt!229562 () SeekEntryResult!4065)

(assert (=> b!504279 (= lt!229562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229564 lt!229569 lt!229568 mask!3524))))

(declare-fun b!504280 () Bool)

(declare-fun res!305478 () Bool)

(assert (=> b!504280 (=> (not res!305478) (not e!295265))))

(declare-fun arrayContainsKey!0 (array!32436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504280 (= res!305478 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504281 () Bool)

(declare-fun Unit!15339 () Unit!15336)

(assert (=> b!504281 (= e!295263 Unit!15339)))

(declare-fun lt!229560 () Unit!15336)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32436 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15336)

(assert (=> b!504281 (= lt!229560 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229564 #b00000000000000000000000000000000 (index!18450 lt!229561) (x!47466 lt!229561) mask!3524))))

(declare-fun res!305480 () Bool)

(assert (=> b!504281 (= res!305480 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229564 lt!229569 lt!229568 mask!3524) (Intermediate!4065 false (index!18450 lt!229561) (x!47466 lt!229561))))))

(declare-fun e!295268 () Bool)

(assert (=> b!504281 (=> (not res!305480) (not e!295268))))

(assert (=> b!504281 e!295268))

(declare-fun b!504282 () Bool)

(assert (=> b!504282 (= e!295268 false)))

(declare-fun res!305481 () Bool)

(assert (=> start!45680 (=> (not res!305481) (not e!295265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45680 (= res!305481 (validMask!0 mask!3524))))

(assert (=> start!45680 e!295265))

(assert (=> start!45680 true))

(declare-fun array_inv!11394 (array!32436) Bool)

(assert (=> start!45680 (array_inv!11394 a!3235)))

(declare-fun b!504275 () Bool)

(assert (=> b!504275 (= e!295269 (= (seekEntryOrOpen!0 (select (arr!15598 a!3235) j!176) a!3235 mask!3524) (Found!4065 j!176)))))

(declare-fun b!504283 () Bool)

(declare-fun res!305477 () Bool)

(assert (=> b!504283 (=> (not res!305477) (not e!295265))))

(assert (=> b!504283 (= res!305477 (validKeyInArray!0 (select (arr!15598 a!3235) j!176)))))

(declare-fun b!504284 () Bool)

(declare-fun res!305475 () Bool)

(assert (=> b!504284 (=> (not res!305475) (not e!295261))))

(declare-datatypes ((List!9756 0))(
  ( (Nil!9753) (Cons!9752 (h!10629 (_ BitVec 64)) (t!15984 List!9756)) )
))
(declare-fun arrayNoDuplicates!0 (array!32436 (_ BitVec 32) List!9756) Bool)

(assert (=> b!504284 (= res!305475 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9753))))

(assert (= (and start!45680 res!305481) b!504270))

(assert (= (and b!504270 res!305479) b!504283))

(assert (= (and b!504283 res!305477) b!504278))

(assert (= (and b!504278 res!305471) b!504280))

(assert (= (and b!504280 res!305478) b!504276))

(assert (= (and b!504276 res!305472) b!504268))

(assert (= (and b!504268 res!305483) b!504284))

(assert (= (and b!504284 res!305475) b!504271))

(assert (= (and b!504271 res!305476) b!504275))

(assert (= (and b!504271 (not res!305470)) b!504272))

(assert (= (and b!504272 (not res!305473)) b!504269))

(assert (= (and b!504269 c!59678) b!504281))

(assert (= (and b!504269 (not c!59678)) b!504273))

(assert (= (and b!504281 res!305480) b!504282))

(assert (= (and b!504269 (not res!305469)) b!504274))

(assert (= (and b!504274 res!305474) b!504277))

(assert (= (and b!504274 (not res!305482)) b!504279))

(declare-fun m!485023 () Bool)

(assert (=> b!504277 m!485023))

(assert (=> b!504277 m!485023))

(declare-fun m!485025 () Bool)

(assert (=> b!504277 m!485025))

(declare-fun m!485027 () Bool)

(assert (=> b!504271 m!485027))

(declare-fun m!485029 () Bool)

(assert (=> b!504271 m!485029))

(declare-fun m!485031 () Bool)

(assert (=> b!504271 m!485031))

(assert (=> b!504271 m!485023))

(declare-fun m!485033 () Bool)

(assert (=> b!504271 m!485033))

(declare-fun m!485035 () Bool)

(assert (=> b!504271 m!485035))

(assert (=> b!504271 m!485023))

(assert (=> b!504271 m!485023))

(declare-fun m!485037 () Bool)

(assert (=> b!504271 m!485037))

(declare-fun m!485039 () Bool)

(assert (=> b!504271 m!485039))

(declare-fun m!485041 () Bool)

(assert (=> b!504271 m!485041))

(declare-fun m!485043 () Bool)

(assert (=> b!504269 m!485043))

(declare-fun m!485045 () Bool)

(assert (=> b!504269 m!485045))

(assert (=> b!504269 m!485023))

(declare-fun m!485047 () Bool)

(assert (=> start!45680 m!485047))

(declare-fun m!485049 () Bool)

(assert (=> start!45680 m!485049))

(declare-fun m!485051 () Bool)

(assert (=> b!504284 m!485051))

(declare-fun m!485053 () Bool)

(assert (=> b!504279 m!485053))

(declare-fun m!485055 () Bool)

(assert (=> b!504268 m!485055))

(assert (=> b!504283 m!485023))

(assert (=> b!504283 m!485023))

(declare-fun m!485057 () Bool)

(assert (=> b!504283 m!485057))

(assert (=> b!504275 m!485023))

(assert (=> b!504275 m!485023))

(declare-fun m!485059 () Bool)

(assert (=> b!504275 m!485059))

(declare-fun m!485061 () Bool)

(assert (=> b!504280 m!485061))

(declare-fun m!485063 () Bool)

(assert (=> b!504278 m!485063))

(declare-fun m!485065 () Bool)

(assert (=> b!504281 m!485065))

(assert (=> b!504281 m!485053))

(declare-fun m!485067 () Bool)

(assert (=> b!504276 m!485067))

(check-sat (not b!504278) (not b!504284) (not start!45680) (not b!504277) (not b!504269) (not b!504280) (not b!504279) (not b!504275) (not b!504276) (not b!504271) (not b!504283) (not b!504281) (not b!504268))
(check-sat)
