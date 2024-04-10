; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69716 () Bool)

(assert start!69716)

(declare-fun res!554861 () Bool)

(declare-fun e!449374 () Bool)

(assert (=> start!69716 (=> (not res!554861) (not e!449374))))

(declare-datatypes ((array!44137 0))(
  ( (array!44138 (arr!21138 (Array (_ BitVec 32) (_ BitVec 64))) (size!21559 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44137)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69716 (= res!554861 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21559 a!4395)) (bvslt (size!21559 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000)))))

(assert (=> start!69716 e!449374))

(assert (=> start!69716 true))

(declare-fun array_inv!16934 (array!44137) Bool)

(assert (=> start!69716 (array_inv!16934 a!4395)))

(declare-fun b!811842 () Bool)

(declare-fun arraysEqualsFromTo!0 (array!44137 array!44137 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!811842 (= e!449374 (not (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546)))))

(assert (=> b!811842 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-datatypes ((Unit!27696 0))(
  ( (Unit!27697) )
))
(declare-fun lt!364064 () Unit!27696)

(declare-fun lemmaArrayEqualsFromToReflexivity!0 (array!44137 (_ BitVec 32) (_ BitVec 32)) Unit!27696)

(assert (=> b!811842 (= lt!364064 (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (= (and start!69716 res!554861) b!811842))

(declare-fun m!754331 () Bool)

(assert (=> start!69716 m!754331))

(declare-fun m!754333 () Bool)

(assert (=> b!811842 m!754333))

(declare-fun m!754335 () Bool)

(assert (=> b!811842 m!754335))

(declare-fun m!754337 () Bool)

(assert (=> b!811842 m!754337))

(push 1)

(assert (not b!811842))

(assert (not start!69716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104239 () Bool)

(declare-fun res!554880 () Bool)

(declare-fun e!449400 () Bool)

(assert (=> d!104239 (=> res!554880 e!449400)))

(assert (=> d!104239 (= res!554880 (bvsge from!3750 to!546))))

(assert (=> d!104239 (= (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546) e!449400)))

(declare-fun b!811861 () Bool)

(declare-fun e!449401 () Bool)

(assert (=> b!811861 (= e!449400 e!449401)))

(declare-fun res!554881 () Bool)

(assert (=> b!811861 (=> (not res!554881) (not e!449401))))

(assert (=> b!811861 (= res!554881 (not (not (= (select (arr!21138 a!4395) from!3750) (select (arr!21138 a!4395) from!3750)))))))

(declare-fun b!811862 () Bool)

(assert (=> b!811862 (= e!449401 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd from!3750 #b00000000000000000000000000000001) to!546))))

(assert (= (and d!104239 (not res!554880)) b!811861))

(assert (= (and b!811861 res!554881) b!811862))

(declare-fun m!754365 () Bool)

(assert (=> b!811861 m!754365))

(assert (=> b!811861 m!754365))

(declare-fun m!754367 () Bool)

(assert (=> b!811862 m!754367))

(assert (=> b!811842 d!104239))

(declare-fun d!104245 () Bool)

(declare-fun res!554884 () Bool)

(declare-fun e!449404 () Bool)

(assert (=> d!104245 (=> res!554884 e!449404)))

(assert (=> d!104245 (= res!554884 (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (=> d!104245 (= (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546) e!449404)))

(declare-fun b!811865 () Bool)

(declare-fun e!449406 () Bool)

(assert (=> b!811865 (= e!449404 e!449406)))

(declare-fun res!554885 () Bool)

(assert (=> b!811865 (=> (not res!554885) (not e!449406))))

(assert (=> b!811865 (= res!554885 (not (not (= (select (arr!21138 a!4395) (bvadd #b00000000000000000000000000000001 from!3750)) (select (arr!21138 a!4395) (bvadd #b00000000000000000000000000000001 from!3750))))))))

(declare-fun b!811866 () Bool)

(assert (=> b!811866 (= e!449406 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750 #b00000000000000000000000000000001) to!546))))

(assert (= (and d!104245 (not res!554884)) b!811865))

(assert (= (and b!811865 res!554885) b!811866))

(declare-fun m!754369 () Bool)

(assert (=> b!811865 m!754369))

(assert (=> b!811865 m!754369))

(declare-fun m!754371 () Bool)

(assert (=> b!811866 m!754371))

(assert (=> b!811842 d!104245))

(declare-fun d!104247 () Bool)

(assert (=> d!104247 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

