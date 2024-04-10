; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71894 () Bool)

(assert start!71894)

(declare-fun b!835433 () Bool)

(declare-fun res!568309 () Bool)

(declare-fun e!466053 () Bool)

(assert (=> b!835433 (=> (not res!568309) (not e!466053))))

(declare-datatypes ((array!46804 0))(
  ( (array!46805 (arr!22436 (Array (_ BitVec 32) (_ BitVec 64))) (size!22857 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46804)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835433 (= res!568309 (and (bvslt (size!22857 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22857 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835434 () Bool)

(declare-fun res!568310 () Bool)

(assert (=> b!835434 (=> (not res!568310) (not e!466053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835434 (= res!568310 (not (validKeyInArray!0 (select (arr!22436 a!4227) to!390))))))

(declare-fun b!835435 () Bool)

(declare-fun res!568308 () Bool)

(assert (=> b!835435 (=> (not res!568308) (not e!466053))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46804 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835435 (= res!568308 (= (arrayCountValidKeys!0 (array!46805 (store (arr!22436 a!4227) i!1466 k!2968) (size!22857 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835436 () Bool)

(declare-fun res!568305 () Bool)

(assert (=> b!835436 (=> (not res!568305) (not e!466053))))

(assert (=> b!835436 (= res!568305 (validKeyInArray!0 k!2968))))

(declare-fun b!835437 () Bool)

(assert (=> b!835437 (= e!466053 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvsge to!390 (size!22857 a!4227))))))

(declare-fun res!568306 () Bool)

(assert (=> start!71894 (=> (not res!568306) (not e!466053))))

(assert (=> start!71894 (= res!568306 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22857 a!4227))))))

(assert (=> start!71894 e!466053))

(assert (=> start!71894 true))

(declare-fun array_inv!17883 (array!46804) Bool)

(assert (=> start!71894 (array_inv!17883 a!4227)))

(declare-fun b!835438 () Bool)

(declare-fun res!568304 () Bool)

(assert (=> b!835438 (=> (not res!568304) (not e!466053))))

(assert (=> b!835438 (= res!568304 (not (validKeyInArray!0 (select (arr!22436 a!4227) i!1466))))))

(declare-fun b!835439 () Bool)

(declare-fun res!568307 () Bool)

(assert (=> b!835439 (=> (not res!568307) (not e!466053))))

(assert (=> b!835439 (= res!568307 (not (= to!390 (size!22857 a!4227))))))

(assert (= (and start!71894 res!568306) b!835438))

(assert (= (and b!835438 res!568304) b!835436))

(assert (= (and b!835436 res!568305) b!835433))

(assert (= (and b!835433 res!568309) b!835435))

(assert (= (and b!835435 res!568308) b!835439))

(assert (= (and b!835439 res!568307) b!835434))

(assert (= (and b!835434 res!568310) b!835437))

(declare-fun m!780603 () Bool)

(assert (=> start!71894 m!780603))

(declare-fun m!780605 () Bool)

(assert (=> b!835435 m!780605))

(declare-fun m!780607 () Bool)

(assert (=> b!835435 m!780607))

(declare-fun m!780609 () Bool)

(assert (=> b!835435 m!780609))

(declare-fun m!780611 () Bool)

(assert (=> b!835436 m!780611))

(declare-fun m!780613 () Bool)

(assert (=> b!835434 m!780613))

(assert (=> b!835434 m!780613))

(declare-fun m!780615 () Bool)

(assert (=> b!835434 m!780615))

(declare-fun m!780617 () Bool)

(assert (=> b!835438 m!780617))

(assert (=> b!835438 m!780617))

(declare-fun m!780619 () Bool)

(assert (=> b!835438 m!780619))

(push 1)

(assert (not b!835434))

(assert (not b!835436))

(assert (not b!835435))

(assert (not b!835438))

(assert (not start!71894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

