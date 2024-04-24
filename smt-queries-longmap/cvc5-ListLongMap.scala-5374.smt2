; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72012 () Bool)

(assert start!72012)

(declare-fun res!568242 () Bool)

(declare-fun e!466461 () Bool)

(assert (=> start!72012 (=> (not res!568242) (not e!466461))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46759 0))(
  ( (array!46760 (arr!22409 (Array (_ BitVec 32) (_ BitVec 64))) (size!22829 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46759)

(assert (=> start!72012 (= res!568242 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22829 a!4227))))))

(assert (=> start!72012 e!466461))

(assert (=> start!72012 true))

(declare-fun array_inv!17895 (array!46759) Bool)

(assert (=> start!72012 (array_inv!17895 a!4227)))

(declare-fun b!835922 () Bool)

(declare-fun res!568239 () Bool)

(assert (=> b!835922 (=> (not res!568239) (not e!466461))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835922 (= res!568239 (and (bvslt (size!22829 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22829 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835921 () Bool)

(declare-fun res!568241 () Bool)

(assert (=> b!835921 (=> (not res!568241) (not e!466461))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835921 (= res!568241 (validKeyInArray!0 k!2968))))

(declare-fun b!835923 () Bool)

(assert (=> b!835923 (= e!466461 false)))

(declare-fun lt!380000 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46759 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835923 (= lt!380000 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379999 () (_ BitVec 32))

(assert (=> b!835923 (= lt!379999 (arrayCountValidKeys!0 (array!46760 (store (arr!22409 a!4227) i!1466 k!2968) (size!22829 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835920 () Bool)

(declare-fun res!568240 () Bool)

(assert (=> b!835920 (=> (not res!568240) (not e!466461))))

(assert (=> b!835920 (= res!568240 (not (validKeyInArray!0 (select (arr!22409 a!4227) i!1466))))))

(assert (= (and start!72012 res!568242) b!835920))

(assert (= (and b!835920 res!568240) b!835921))

(assert (= (and b!835921 res!568241) b!835922))

(assert (= (and b!835922 res!568239) b!835923))

(declare-fun m!781481 () Bool)

(assert (=> start!72012 m!781481))

(declare-fun m!781483 () Bool)

(assert (=> b!835921 m!781483))

(declare-fun m!781485 () Bool)

(assert (=> b!835923 m!781485))

(declare-fun m!781487 () Bool)

(assert (=> b!835923 m!781487))

(declare-fun m!781489 () Bool)

(assert (=> b!835923 m!781489))

(declare-fun m!781491 () Bool)

(assert (=> b!835920 m!781491))

(assert (=> b!835920 m!781491))

(declare-fun m!781493 () Bool)

(assert (=> b!835920 m!781493))

(push 1)

(assert (not b!835923))

(assert (not start!72012))

(assert (not b!835921))

(assert (not b!835920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

