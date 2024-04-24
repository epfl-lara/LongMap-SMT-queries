; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69884 () Bool)

(assert start!69884)

(declare-fun res!555201 () Bool)

(declare-fun e!449946 () Bool)

(assert (=> start!69884 (=> (not res!555201) (not e!449946))))

(declare-datatypes ((array!44137 0))(
  ( (array!44138 (arr!21133 (Array (_ BitVec 32) (_ BitVec 64))) (size!21553 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44137)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69884 (= res!555201 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21553 a!4395)) (bvslt (size!21553 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000)))))

(assert (=> start!69884 e!449946))

(assert (=> start!69884 true))

(declare-fun array_inv!16992 (array!44137) Bool)

(assert (=> start!69884 (array_inv!16992 a!4395)))

(declare-fun b!812730 () Bool)

(declare-fun arraysEqualsFromTo!0 (array!44137 array!44137 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!812730 (= e!449946 (not (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546)))))

(assert (=> b!812730 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-datatypes ((Unit!27681 0))(
  ( (Unit!27682) )
))
(declare-fun lt!364421 () Unit!27681)

(declare-fun lemmaArrayEqualsFromToReflexivity!0 (array!44137 (_ BitVec 32) (_ BitVec 32)) Unit!27681)

(assert (=> b!812730 (= lt!364421 (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (= (and start!69884 res!555201) b!812730))

(declare-fun m!755617 () Bool)

(assert (=> start!69884 m!755617))

(declare-fun m!755619 () Bool)

(assert (=> b!812730 m!755619))

(declare-fun m!755621 () Bool)

(assert (=> b!812730 m!755621))

(declare-fun m!755623 () Bool)

(assert (=> b!812730 m!755623))

(check-sat (not b!812730) (not start!69884))
(check-sat)
(get-model)

(declare-fun d!104555 () Bool)

(declare-fun res!555212 () Bool)

(declare-fun e!449964 () Bool)

(assert (=> d!104555 (=> res!555212 e!449964)))

(assert (=> d!104555 (= res!555212 (bvsge from!3750 to!546))))

(assert (=> d!104555 (= (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546) e!449964)))

(declare-fun b!812741 () Bool)

(declare-fun e!449965 () Bool)

(assert (=> b!812741 (= e!449964 e!449965)))

(declare-fun res!555213 () Bool)

(assert (=> b!812741 (=> (not res!555213) (not e!449965))))

(assert (=> b!812741 (= res!555213 (not (not (= (select (arr!21133 a!4395) from!3750) (select (arr!21133 a!4395) from!3750)))))))

(declare-fun b!812742 () Bool)

(assert (=> b!812742 (= e!449965 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd from!3750 #b00000000000000000000000000000001) to!546))))

(assert (= (and d!104555 (not res!555212)) b!812741))

(assert (= (and b!812741 res!555213) b!812742))

(declare-fun m!755641 () Bool)

(assert (=> b!812741 m!755641))

(assert (=> b!812741 m!755641))

(declare-fun m!755643 () Bool)

(assert (=> b!812742 m!755643))

(assert (=> b!812730 d!104555))

(declare-fun d!104557 () Bool)

(declare-fun res!555214 () Bool)

(declare-fun e!449966 () Bool)

(assert (=> d!104557 (=> res!555214 e!449966)))

(assert (=> d!104557 (= res!555214 (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (=> d!104557 (= (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546) e!449966)))

(declare-fun b!812743 () Bool)

(declare-fun e!449967 () Bool)

(assert (=> b!812743 (= e!449966 e!449967)))

(declare-fun res!555215 () Bool)

(assert (=> b!812743 (=> (not res!555215) (not e!449967))))

(assert (=> b!812743 (= res!555215 (not (not (= (select (arr!21133 a!4395) (bvadd #b00000000000000000000000000000001 from!3750)) (select (arr!21133 a!4395) (bvadd #b00000000000000000000000000000001 from!3750))))))))

(declare-fun b!812744 () Bool)

(assert (=> b!812744 (= e!449967 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750 #b00000000000000000000000000000001) to!546))))

(assert (= (and d!104557 (not res!555214)) b!812743))

(assert (= (and b!812743 res!555215) b!812744))

(declare-fun m!755645 () Bool)

(assert (=> b!812743 m!755645))

(assert (=> b!812743 m!755645))

(declare-fun m!755647 () Bool)

(assert (=> b!812744 m!755647))

(assert (=> b!812730 d!104557))

(declare-fun d!104559 () Bool)

(assert (=> d!104559 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-fun lt!364430 () Unit!27681)

(declare-fun choose!30 (array!44137 (_ BitVec 32) (_ BitVec 32)) Unit!27681)

(assert (=> d!104559 (= lt!364430 (choose!30 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (=> d!104559 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsle to!546 (size!21553 a!4395)) (bvslt (size!21553 a!4395) #b01111111111111111111111111111111))))

(assert (=> d!104559 (= (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546) lt!364430)))

(declare-fun bs!22520 () Bool)

(assert (= bs!22520 d!104559))

(assert (=> bs!22520 m!755621))

(declare-fun m!755649 () Bool)

(assert (=> bs!22520 m!755649))

(assert (=> b!812730 d!104559))

(declare-fun d!104561 () Bool)

(assert (=> d!104561 (= (array_inv!16992 a!4395) (bvsge (size!21553 a!4395) #b00000000000000000000000000000000))))

(assert (=> start!69884 d!104561))

(check-sat (not d!104559) (not b!812742) (not b!812744))
(check-sat)
