; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69696 () Bool)

(assert start!69696)

(declare-fun res!554751 () Bool)

(declare-fun e!449220 () Bool)

(assert (=> start!69696 (=> (not res!554751) (not e!449220))))

(declare-datatypes ((array!44134 0))(
  ( (array!44135 (arr!21137 (Array (_ BitVec 32) (_ BitVec 64))) (size!21558 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44134)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69696 (= res!554751 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21558 a!4395)) (bvslt (size!21558 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000)))))

(assert (=> start!69696 e!449220))

(assert (=> start!69696 true))

(declare-fun array_inv!17020 (array!44134) Bool)

(assert (=> start!69696 (array_inv!17020 a!4395)))

(declare-fun b!811592 () Bool)

(declare-fun arraysEqualsFromTo!0 (array!44134 array!44134 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!811592 (= e!449220 (not (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546)))))

(assert (=> b!811592 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-datatypes ((Unit!27654 0))(
  ( (Unit!27655) )
))
(declare-fun lt!363824 () Unit!27654)

(declare-fun lemmaArrayEqualsFromToReflexivity!0 (array!44134 (_ BitVec 32) (_ BitVec 32)) Unit!27654)

(assert (=> b!811592 (= lt!363824 (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (= (and start!69696 res!554751) b!811592))

(declare-fun m!753589 () Bool)

(assert (=> start!69696 m!753589))

(declare-fun m!753591 () Bool)

(assert (=> b!811592 m!753591))

(declare-fun m!753593 () Bool)

(assert (=> b!811592 m!753593))

(declare-fun m!753595 () Bool)

(assert (=> b!811592 m!753595))

(check-sat (not b!811592) (not start!69696))
(check-sat)
(get-model)

(declare-fun d!104039 () Bool)

(declare-fun res!554762 () Bool)

(declare-fun e!449238 () Bool)

(assert (=> d!104039 (=> res!554762 e!449238)))

(assert (=> d!104039 (= res!554762 (bvsge from!3750 to!546))))

(assert (=> d!104039 (= (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546) e!449238)))

(declare-fun b!811603 () Bool)

(declare-fun e!449239 () Bool)

(assert (=> b!811603 (= e!449238 e!449239)))

(declare-fun res!554763 () Bool)

(assert (=> b!811603 (=> (not res!554763) (not e!449239))))

(assert (=> b!811603 (= res!554763 (not (not (= (select (arr!21137 a!4395) from!3750) (select (arr!21137 a!4395) from!3750)))))))

(declare-fun b!811604 () Bool)

(assert (=> b!811604 (= e!449239 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd from!3750 #b00000000000000000000000000000001) to!546))))

(assert (= (and d!104039 (not res!554762)) b!811603))

(assert (= (and b!811603 res!554763) b!811604))

(declare-fun m!753613 () Bool)

(assert (=> b!811603 m!753613))

(assert (=> b!811603 m!753613))

(declare-fun m!753615 () Bool)

(assert (=> b!811604 m!753615))

(assert (=> b!811592 d!104039))

(declare-fun d!104041 () Bool)

(declare-fun res!554764 () Bool)

(declare-fun e!449240 () Bool)

(assert (=> d!104041 (=> res!554764 e!449240)))

(assert (=> d!104041 (= res!554764 (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (=> d!104041 (= (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546) e!449240)))

(declare-fun b!811605 () Bool)

(declare-fun e!449241 () Bool)

(assert (=> b!811605 (= e!449240 e!449241)))

(declare-fun res!554765 () Bool)

(assert (=> b!811605 (=> (not res!554765) (not e!449241))))

(assert (=> b!811605 (= res!554765 (not (not (= (select (arr!21137 a!4395) (bvadd #b00000000000000000000000000000001 from!3750)) (select (arr!21137 a!4395) (bvadd #b00000000000000000000000000000001 from!3750))))))))

(declare-fun b!811606 () Bool)

(assert (=> b!811606 (= e!449241 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750 #b00000000000000000000000000000001) to!546))))

(assert (= (and d!104041 (not res!554764)) b!811605))

(assert (= (and b!811605 res!554765) b!811606))

(declare-fun m!753617 () Bool)

(assert (=> b!811605 m!753617))

(assert (=> b!811605 m!753617))

(declare-fun m!753619 () Bool)

(assert (=> b!811606 m!753619))

(assert (=> b!811592 d!104041))

(declare-fun d!104043 () Bool)

(assert (=> d!104043 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-fun lt!363833 () Unit!27654)

(declare-fun choose!30 (array!44134 (_ BitVec 32) (_ BitVec 32)) Unit!27654)

(assert (=> d!104043 (= lt!363833 (choose!30 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (=> d!104043 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsle to!546 (size!21558 a!4395)) (bvslt (size!21558 a!4395) #b01111111111111111111111111111111))))

(assert (=> d!104043 (= (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546) lt!363833)))

(declare-fun bs!22473 () Bool)

(assert (= bs!22473 d!104043))

(assert (=> bs!22473 m!753593))

(declare-fun m!753621 () Bool)

(assert (=> bs!22473 m!753621))

(assert (=> b!811592 d!104043))

(declare-fun d!104047 () Bool)

(assert (=> d!104047 (= (array_inv!17020 a!4395) (bvsge (size!21558 a!4395) #b00000000000000000000000000000000))))

(assert (=> start!69696 d!104047))

(check-sat (not b!811606) (not b!811604) (not d!104043))
(check-sat)
