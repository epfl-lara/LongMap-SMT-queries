; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45672 () Bool)

(assert start!45672)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!504099 () Bool)

(declare-datatypes ((array!32438 0))(
  ( (array!32439 (arr!15599 (Array (_ BitVec 32) (_ BitVec 64))) (size!15964 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32438)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!295144 () Bool)

(declare-datatypes ((SeekEntryResult!4063 0))(
  ( (MissingZero!4063 (index!18440 (_ BitVec 32))) (Found!4063 (index!18441 (_ BitVec 32))) (Intermediate!4063 (undefined!4875 Bool) (index!18442 (_ BitVec 32)) (x!47467 (_ BitVec 32))) (Undefined!4063) (MissingVacant!4063 (index!18443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32438 (_ BitVec 32)) SeekEntryResult!4063)

(assert (=> b!504099 (= e!295144 (= (seekEntryOrOpen!0 (select (arr!15599 a!3235) j!176) a!3235 mask!3524) (Found!4063 j!176)))))

(declare-fun b!504100 () Bool)

(declare-fun lt!229394 () (_ BitVec 32))

(declare-fun lt!229396 () SeekEntryResult!4063)

(declare-fun e!295142 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32438 (_ BitVec 32)) SeekEntryResult!4063)

(assert (=> b!504100 (= e!295142 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229394 (index!18442 lt!229396) (select (arr!15599 a!3235) j!176) a!3235 mask!3524) (Found!4063 j!176))))))

(declare-fun b!504101 () Bool)

(declare-fun res!305439 () Bool)

(declare-fun e!295148 () Bool)

(assert (=> b!504101 (=> (not res!305439) (not e!295148))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504101 (= res!305439 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504102 () Bool)

(declare-fun res!305443 () Bool)

(declare-fun e!295146 () Bool)

(assert (=> b!504102 (=> (not res!305443) (not e!295146))))

(declare-datatypes ((List!9796 0))(
  ( (Nil!9793) (Cons!9792 (h!10669 (_ BitVec 64)) (t!16015 List!9796)) )
))
(declare-fun arrayNoDuplicates!0 (array!32438 (_ BitVec 32) List!9796) Bool)

(assert (=> b!504102 (= res!305443 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9793))))

(declare-fun res!305441 () Bool)

(assert (=> start!45672 (=> (not res!305441) (not e!295148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45672 (= res!305441 (validMask!0 mask!3524))))

(assert (=> start!45672 e!295148))

(assert (=> start!45672 true))

(declare-fun array_inv!11482 (array!32438) Bool)

(assert (=> start!45672 (array_inv!11482 a!3235)))

(declare-fun b!504103 () Bool)

(declare-fun e!295141 () Bool)

(assert (=> b!504103 (= e!295141 false)))

(declare-fun b!504104 () Bool)

(declare-fun res!305438 () Bool)

(assert (=> b!504104 (=> (not res!305438) (not e!295148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504104 (= res!305438 (validKeyInArray!0 k0!2280))))

(declare-fun b!504105 () Bool)

(declare-datatypes ((Unit!15322 0))(
  ( (Unit!15323) )
))
(declare-fun e!295143 () Unit!15322)

(declare-fun Unit!15324 () Unit!15322)

(assert (=> b!504105 (= e!295143 Unit!15324)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!229400 () Unit!15322)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32438 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15322)

(assert (=> b!504105 (= lt!229400 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229394 #b00000000000000000000000000000000 (index!18442 lt!229396) (x!47467 lt!229396) mask!3524))))

(declare-fun res!305440 () Bool)

(declare-fun lt!229398 () (_ BitVec 64))

(declare-fun lt!229402 () array!32438)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32438 (_ BitVec 32)) SeekEntryResult!4063)

(assert (=> b!504105 (= res!305440 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229394 lt!229398 lt!229402 mask!3524) (Intermediate!4063 false (index!18442 lt!229396) (x!47467 lt!229396))))))

(assert (=> b!504105 (=> (not res!305440) (not e!295141))))

(assert (=> b!504105 e!295141))

(declare-fun b!504106 () Bool)

(declare-fun Unit!15325 () Unit!15322)

(assert (=> b!504106 (= e!295143 Unit!15325)))

(declare-fun b!504107 () Bool)

(declare-fun e!295147 () Bool)

(assert (=> b!504107 (= e!295146 (not e!295147))))

(declare-fun res!305432 () Bool)

(assert (=> b!504107 (=> res!305432 e!295147)))

(declare-fun lt!229401 () (_ BitVec 32))

(assert (=> b!504107 (= res!305432 (= lt!229396 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229401 lt!229398 lt!229402 mask!3524)))))

(assert (=> b!504107 (= lt!229396 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229394 (select (arr!15599 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504107 (= lt!229401 (toIndex!0 lt!229398 mask!3524))))

(assert (=> b!504107 (= lt!229398 (select (store (arr!15599 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504107 (= lt!229394 (toIndex!0 (select (arr!15599 a!3235) j!176) mask!3524))))

(assert (=> b!504107 (= lt!229402 (array!32439 (store (arr!15599 a!3235) i!1204 k0!2280) (size!15964 a!3235)))))

(assert (=> b!504107 e!295144))

(declare-fun res!305437 () Bool)

(assert (=> b!504107 (=> (not res!305437) (not e!295144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32438 (_ BitVec 32)) Bool)

(assert (=> b!504107 (= res!305437 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229392 () Unit!15322)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15322)

(assert (=> b!504107 (= lt!229392 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504108 () Bool)

(declare-fun e!295145 () Bool)

(assert (=> b!504108 (= e!295145 true)))

(declare-fun lt!229393 () SeekEntryResult!4063)

(assert (=> b!504108 (= lt!229393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229394 lt!229398 lt!229402 mask!3524))))

(declare-fun b!504109 () Bool)

(declare-fun res!305430 () Bool)

(assert (=> b!504109 (=> (not res!305430) (not e!295146))))

(assert (=> b!504109 (= res!305430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504110 () Bool)

(assert (=> b!504110 (= e!295148 e!295146)))

(declare-fun res!305435 () Bool)

(assert (=> b!504110 (=> (not res!305435) (not e!295146))))

(declare-fun lt!229397 () SeekEntryResult!4063)

(assert (=> b!504110 (= res!305435 (or (= lt!229397 (MissingZero!4063 i!1204)) (= lt!229397 (MissingVacant!4063 i!1204))))))

(assert (=> b!504110 (= lt!229397 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504111 () Bool)

(declare-fun res!305434 () Bool)

(assert (=> b!504111 (=> (not res!305434) (not e!295148))))

(assert (=> b!504111 (= res!305434 (and (= (size!15964 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15964 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15964 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504112 () Bool)

(assert (=> b!504112 (= e!295147 e!295145)))

(declare-fun res!305442 () Bool)

(assert (=> b!504112 (=> res!305442 e!295145)))

(assert (=> b!504112 (= res!305442 (or (bvsgt (x!47467 lt!229396) #b01111111111111111111111111111110) (bvslt lt!229394 #b00000000000000000000000000000000) (bvsge lt!229394 (size!15964 a!3235)) (bvslt (index!18442 lt!229396) #b00000000000000000000000000000000) (bvsge (index!18442 lt!229396) (size!15964 a!3235)) (not (= lt!229396 (Intermediate!4063 false (index!18442 lt!229396) (x!47467 lt!229396))))))))

(assert (=> b!504112 (= (index!18442 lt!229396) i!1204)))

(declare-fun lt!229399 () Unit!15322)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32438 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15322)

(assert (=> b!504112 (= lt!229399 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229394 #b00000000000000000000000000000000 (index!18442 lt!229396) (x!47467 lt!229396) mask!3524))))

(assert (=> b!504112 (and (or (= (select (arr!15599 a!3235) (index!18442 lt!229396)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15599 a!3235) (index!18442 lt!229396)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15599 a!3235) (index!18442 lt!229396)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15599 a!3235) (index!18442 lt!229396)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229395 () Unit!15322)

(assert (=> b!504112 (= lt!229395 e!295143)))

(declare-fun c!59613 () Bool)

(assert (=> b!504112 (= c!59613 (= (select (arr!15599 a!3235) (index!18442 lt!229396)) (select (arr!15599 a!3235) j!176)))))

(assert (=> b!504112 (and (bvslt (x!47467 lt!229396) #b01111111111111111111111111111110) (or (= (select (arr!15599 a!3235) (index!18442 lt!229396)) (select (arr!15599 a!3235) j!176)) (= (select (arr!15599 a!3235) (index!18442 lt!229396)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15599 a!3235) (index!18442 lt!229396)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504113 () Bool)

(declare-fun res!305436 () Bool)

(assert (=> b!504113 (=> (not res!305436) (not e!295148))))

(assert (=> b!504113 (= res!305436 (validKeyInArray!0 (select (arr!15599 a!3235) j!176)))))

(declare-fun b!504114 () Bool)

(declare-fun res!305431 () Bool)

(assert (=> b!504114 (=> res!305431 e!295145)))

(assert (=> b!504114 (= res!305431 e!295142)))

(declare-fun res!305433 () Bool)

(assert (=> b!504114 (=> (not res!305433) (not e!295142))))

(assert (=> b!504114 (= res!305433 (bvsgt #b00000000000000000000000000000000 (x!47467 lt!229396)))))

(declare-fun b!504115 () Bool)

(declare-fun res!305444 () Bool)

(assert (=> b!504115 (=> res!305444 e!295147)))

(get-info :version)

(assert (=> b!504115 (= res!305444 (or (undefined!4875 lt!229396) (not ((_ is Intermediate!4063) lt!229396))))))

(assert (= (and start!45672 res!305441) b!504111))

(assert (= (and b!504111 res!305434) b!504113))

(assert (= (and b!504113 res!305436) b!504104))

(assert (= (and b!504104 res!305438) b!504101))

(assert (= (and b!504101 res!305439) b!504110))

(assert (= (and b!504110 res!305435) b!504109))

(assert (= (and b!504109 res!305430) b!504102))

(assert (= (and b!504102 res!305443) b!504107))

(assert (= (and b!504107 res!305437) b!504099))

(assert (= (and b!504107 (not res!305432)) b!504115))

(assert (= (and b!504115 (not res!305444)) b!504112))

(assert (= (and b!504112 c!59613) b!504105))

(assert (= (and b!504112 (not c!59613)) b!504106))

(assert (= (and b!504105 res!305440) b!504103))

(assert (= (and b!504112 (not res!305442)) b!504114))

(assert (= (and b!504114 res!305433) b!504100))

(assert (= (and b!504114 (not res!305431)) b!504108))

(declare-fun m!484363 () Bool)

(assert (=> b!504109 m!484363))

(declare-fun m!484365 () Bool)

(assert (=> b!504105 m!484365))

(declare-fun m!484367 () Bool)

(assert (=> b!504105 m!484367))

(declare-fun m!484369 () Bool)

(assert (=> b!504102 m!484369))

(declare-fun m!484371 () Bool)

(assert (=> b!504113 m!484371))

(assert (=> b!504113 m!484371))

(declare-fun m!484373 () Bool)

(assert (=> b!504113 m!484373))

(declare-fun m!484375 () Bool)

(assert (=> b!504107 m!484375))

(declare-fun m!484377 () Bool)

(assert (=> b!504107 m!484377))

(declare-fun m!484379 () Bool)

(assert (=> b!504107 m!484379))

(declare-fun m!484381 () Bool)

(assert (=> b!504107 m!484381))

(declare-fun m!484383 () Bool)

(assert (=> b!504107 m!484383))

(assert (=> b!504107 m!484371))

(declare-fun m!484385 () Bool)

(assert (=> b!504107 m!484385))

(assert (=> b!504107 m!484371))

(declare-fun m!484387 () Bool)

(assert (=> b!504107 m!484387))

(assert (=> b!504107 m!484371))

(declare-fun m!484389 () Bool)

(assert (=> b!504107 m!484389))

(declare-fun m!484391 () Bool)

(assert (=> b!504112 m!484391))

(declare-fun m!484393 () Bool)

(assert (=> b!504112 m!484393))

(assert (=> b!504112 m!484371))

(assert (=> b!504108 m!484367))

(declare-fun m!484395 () Bool)

(assert (=> b!504101 m!484395))

(declare-fun m!484397 () Bool)

(assert (=> b!504104 m!484397))

(declare-fun m!484399 () Bool)

(assert (=> b!504110 m!484399))

(declare-fun m!484401 () Bool)

(assert (=> start!45672 m!484401))

(declare-fun m!484403 () Bool)

(assert (=> start!45672 m!484403))

(assert (=> b!504099 m!484371))

(assert (=> b!504099 m!484371))

(declare-fun m!484405 () Bool)

(assert (=> b!504099 m!484405))

(assert (=> b!504100 m!484371))

(assert (=> b!504100 m!484371))

(declare-fun m!484407 () Bool)

(assert (=> b!504100 m!484407))

(check-sat (not b!504109) (not b!504099) (not b!504107) (not b!504101) (not b!504112) (not b!504102) (not b!504113) (not b!504110) (not b!504104) (not b!504105) (not start!45672) (not b!504108) (not b!504100))
(check-sat)
