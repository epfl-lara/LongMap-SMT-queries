; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69740 () Bool)

(assert start!69740)

(declare-fun res!554894 () Bool)

(declare-fun e!449416 () Bool)

(assert (=> start!69740 (=> (not res!554894) (not e!449416))))

(declare-datatypes ((array!44146 0))(
  ( (array!44147 (arr!21141 (Array (_ BitVec 32) (_ BitVec 64))) (size!21562 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44146)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69740 (= res!554894 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21562 a!4395)) (bvslt (size!21562 a!4395) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546)))))

(assert (=> start!69740 e!449416))

(assert (=> start!69740 true))

(declare-fun array_inv!16937 (array!44146) Bool)

(assert (=> start!69740 (array_inv!16937 a!4395)))

(declare-fun b!811875 () Bool)

(declare-fun arraysEqualsFromTo!0 (array!44146 array!44146 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!811875 (= e!449416 (not (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546)))))

(assert (= (and start!69740 res!554894) b!811875))

(declare-fun m!754385 () Bool)

(assert (=> start!69740 m!754385))

(declare-fun m!754387 () Bool)

(assert (=> b!811875 m!754387))

(push 1)

(assert (not start!69740))

(assert (not b!811875))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104263 () Bool)

(assert (=> d!104263 (= (array_inv!16937 a!4395) (bvsge (size!21562 a!4395) #b00000000000000000000000000000000))))

(assert (=> start!69740 d!104263))

(declare-fun d!104265 () Bool)

(declare-fun res!554911 () Bool)

(declare-fun e!449440 () Bool)

(assert (=> d!104265 (=> res!554911 e!449440)))

(assert (=> d!104265 (= res!554911 (bvsge from!3750 to!546))))

(assert (=> d!104265 (= (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546) e!449440)))

(declare-fun b!811892 () Bool)

(declare-fun e!449441 () Bool)

(assert (=> b!811892 (= e!449440 e!449441)))

(declare-fun res!554912 () Bool)

(assert (=> b!811892 (=> (not res!554912) (not e!449441))))

(assert (=> b!811892 (= res!554912 (not (not (= (select (arr!21141 a!4395) from!3750) (select (arr!21141 a!4395) from!3750)))))))

(declare-fun b!811893 () Bool)

(assert (=> b!811893 (= e!449441 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd from!3750 #b00000000000000000000000000000001) to!546))))

(assert (= (and d!104265 (not res!554911)) b!811892))

(assert (= (and b!811892 res!554912) b!811893))

(declare-fun m!754401 () Bool)

(assert (=> b!811892 m!754401))

(assert (=> b!811892 m!754401))

(declare-fun m!754403 () Bool)

(assert (=> b!811893 m!754403))

(assert (=> b!811875 d!104265))

(push 1)

(assert (not b!811893))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

