; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69720 () Bool)

(assert start!69720)

(declare-fun res!554867 () Bool)

(declare-fun e!449386 () Bool)

(assert (=> start!69720 (=> (not res!554867) (not e!449386))))

(declare-datatypes ((array!44141 0))(
  ( (array!44142 (arr!21140 (Array (_ BitVec 32) (_ BitVec 64))) (size!21561 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44141)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69720 (= res!554867 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21561 a!4395)) (bvslt (size!21561 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000)))))

(assert (=> start!69720 e!449386))

(assert (=> start!69720 true))

(declare-fun array_inv!16936 (array!44141) Bool)

(assert (=> start!69720 (array_inv!16936 a!4395)))

(declare-fun b!811848 () Bool)

(declare-fun arraysEqualsFromTo!0 (array!44141 array!44141 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!811848 (= e!449386 (not (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546)))))

(assert (=> b!811848 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-datatypes ((Unit!27700 0))(
  ( (Unit!27701) )
))
(declare-fun lt!364070 () Unit!27700)

(declare-fun lemmaArrayEqualsFromToReflexivity!0 (array!44141 (_ BitVec 32) (_ BitVec 32)) Unit!27700)

(assert (=> b!811848 (= lt!364070 (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (= (and start!69720 res!554867) b!811848))

(declare-fun m!754347 () Bool)

(assert (=> start!69720 m!754347))

(declare-fun m!754349 () Bool)

(assert (=> b!811848 m!754349))

(declare-fun m!754351 () Bool)

(assert (=> b!811848 m!754351))

(declare-fun m!754353 () Bool)

(assert (=> b!811848 m!754353))

(push 1)

(assert (not b!811848))

(assert (not start!69720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104241 () Bool)

(declare-fun res!554888 () Bool)

(declare-fun e!449408 () Bool)

(assert (=> d!104241 (=> res!554888 e!449408)))

(assert (=> d!104241 (= res!554888 (bvsge from!3750 to!546))))

(assert (=> d!104241 (= (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546) e!449408)))

(declare-fun b!811869 () Bool)

(declare-fun e!449409 () Bool)

(assert (=> b!811869 (= e!449408 e!449409)))

(declare-fun res!554889 () Bool)

(assert (=> b!811869 (=> (not res!554889) (not e!449409))))

(assert (=> b!811869 (= res!554889 (not (not (= (select (arr!21140 a!4395) from!3750) (select (arr!21140 a!4395) from!3750)))))))

(declare-fun b!811870 () Bool)

(assert (=> b!811870 (= e!449409 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd from!3750 #b00000000000000000000000000000001) to!546))))

(assert (= (and d!104241 (not res!554888)) b!811869))

(assert (= (and b!811869 res!554889) b!811870))

(declare-fun m!754373 () Bool)

(assert (=> b!811869 m!754373))

(assert (=> b!811869 m!754373))

(declare-fun m!754375 () Bool)

(assert (=> b!811870 m!754375))

(assert (=> b!811848 d!104241))

(declare-fun d!104249 () Bool)

(declare-fun res!554890 () Bool)

(declare-fun e!449410 () Bool)

(assert (=> d!104249 (=> res!554890 e!449410)))

(assert (=> d!104249 (= res!554890 (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (=> d!104249 (= (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546) e!449410)))

