; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69718 () Bool)

(assert start!69718)

(declare-fun res!554864 () Bool)

(declare-fun e!449380 () Bool)

(assert (=> start!69718 (=> (not res!554864) (not e!449380))))

(declare-datatypes ((array!44139 0))(
  ( (array!44140 (arr!21139 (Array (_ BitVec 32) (_ BitVec 64))) (size!21560 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44139)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69718 (= res!554864 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21560 a!4395)) (bvslt (size!21560 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000)))))

(assert (=> start!69718 e!449380))

(assert (=> start!69718 true))

(declare-fun array_inv!16935 (array!44139) Bool)

(assert (=> start!69718 (array_inv!16935 a!4395)))

(declare-fun b!811845 () Bool)

(declare-fun arraysEqualsFromTo!0 (array!44139 array!44139 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!811845 (= e!449380 (not (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546)))))

(assert (=> b!811845 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-datatypes ((Unit!27698 0))(
  ( (Unit!27699) )
))
(declare-fun lt!364067 () Unit!27698)

(declare-fun lemmaArrayEqualsFromToReflexivity!0 (array!44139 (_ BitVec 32) (_ BitVec 32)) Unit!27698)

(assert (=> b!811845 (= lt!364067 (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (= (and start!69718 res!554864) b!811845))

(declare-fun m!754339 () Bool)

(assert (=> start!69718 m!754339))

(declare-fun m!754341 () Bool)

(assert (=> b!811845 m!754341))

(declare-fun m!754343 () Bool)

(assert (=> b!811845 m!754343))

(declare-fun m!754345 () Bool)

(assert (=> b!811845 m!754345))

(check-sat (not b!811845) (not start!69718))
(check-sat)
(get-model)

(declare-fun d!104233 () Bool)

(declare-fun res!554872 () Bool)

(declare-fun e!449392 () Bool)

(assert (=> d!104233 (=> res!554872 e!449392)))

(assert (=> d!104233 (= res!554872 (bvsge from!3750 to!546))))

(assert (=> d!104233 (= (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546) e!449392)))

(declare-fun b!811853 () Bool)

(declare-fun e!449393 () Bool)

(assert (=> b!811853 (= e!449392 e!449393)))

(declare-fun res!554873 () Bool)

(assert (=> b!811853 (=> (not res!554873) (not e!449393))))

(assert (=> b!811853 (= res!554873 (not (not (= (select (arr!21139 a!4395) from!3750) (select (arr!21139 a!4395) from!3750)))))))

(declare-fun b!811854 () Bool)

(assert (=> b!811854 (= e!449393 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd from!3750 #b00000000000000000000000000000001) to!546))))

(assert (= (and d!104233 (not res!554872)) b!811853))

(assert (= (and b!811853 res!554873) b!811854))

(declare-fun m!754355 () Bool)

(assert (=> b!811853 m!754355))

(assert (=> b!811853 m!754355))

(declare-fun m!754357 () Bool)

(assert (=> b!811854 m!754357))

(assert (=> b!811845 d!104233))

(declare-fun d!104235 () Bool)

(declare-fun res!554874 () Bool)

(declare-fun e!449394 () Bool)

(assert (=> d!104235 (=> res!554874 e!449394)))

(assert (=> d!104235 (= res!554874 (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (=> d!104235 (= (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546) e!449394)))

(declare-fun b!811855 () Bool)

(declare-fun e!449395 () Bool)

(assert (=> b!811855 (= e!449394 e!449395)))

(declare-fun res!554875 () Bool)

(assert (=> b!811855 (=> (not res!554875) (not e!449395))))

(assert (=> b!811855 (= res!554875 (not (not (= (select (arr!21139 a!4395) (bvadd #b00000000000000000000000000000001 from!3750)) (select (arr!21139 a!4395) (bvadd #b00000000000000000000000000000001 from!3750))))))))

(declare-fun b!811856 () Bool)

(assert (=> b!811856 (= e!449395 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750 #b00000000000000000000000000000001) to!546))))

(assert (= (and d!104235 (not res!554874)) b!811855))

(assert (= (and b!811855 res!554875) b!811856))

(declare-fun m!754359 () Bool)

(assert (=> b!811855 m!754359))

(assert (=> b!811855 m!754359))

(declare-fun m!754361 () Bool)

(assert (=> b!811856 m!754361))

(assert (=> b!811845 d!104235))

(declare-fun d!104237 () Bool)

(assert (=> d!104237 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-fun lt!364073 () Unit!27698)

(declare-fun choose!30 (array!44139 (_ BitVec 32) (_ BitVec 32)) Unit!27698)

(assert (=> d!104237 (= lt!364073 (choose!30 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (=> d!104237 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsle to!546 (size!21560 a!4395)) (bvslt (size!21560 a!4395) #b01111111111111111111111111111111))))

(assert (=> d!104237 (= (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546) lt!364073)))

(declare-fun bs!22504 () Bool)

(assert (= bs!22504 d!104237))

(assert (=> bs!22504 m!754343))

(declare-fun m!754363 () Bool)

(assert (=> bs!22504 m!754363))

(assert (=> b!811845 d!104237))

(declare-fun d!104243 () Bool)

(assert (=> d!104243 (= (array_inv!16935 a!4395) (bvsge (size!21560 a!4395) #b00000000000000000000000000000000))))

(assert (=> start!69718 d!104243))

(check-sat (not b!811854) (not b!811856) (not d!104237))
(check-sat)
