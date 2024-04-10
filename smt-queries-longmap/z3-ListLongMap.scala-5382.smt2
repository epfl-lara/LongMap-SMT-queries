; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71892 () Bool)

(assert start!71892)

(declare-fun b!835412 () Bool)

(declare-fun res!568283 () Bool)

(declare-fun e!466046 () Bool)

(assert (=> b!835412 (=> (not res!568283) (not e!466046))))

(declare-datatypes ((array!46802 0))(
  ( (array!46803 (arr!22435 (Array (_ BitVec 32) (_ BitVec 64))) (size!22856 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46802)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!835412 (= res!568283 (and (bvslt (size!22856 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22856 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835413 () Bool)

(declare-fun res!568284 () Bool)

(assert (=> b!835413 (=> (not res!568284) (not e!466046))))

(assert (=> b!835413 (= res!568284 (not (= to!390 (size!22856 a!4227))))))

(declare-fun b!835414 () Bool)

(declare-fun res!568289 () Bool)

(assert (=> b!835414 (=> (not res!568289) (not e!466046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835414 (= res!568289 (not (validKeyInArray!0 (select (arr!22435 a!4227) to!390))))))

(declare-fun b!835415 () Bool)

(declare-fun res!568286 () Bool)

(assert (=> b!835415 (=> (not res!568286) (not e!466046))))

(assert (=> b!835415 (= res!568286 (not (validKeyInArray!0 (select (arr!22435 a!4227) i!1466))))))

(declare-fun b!835416 () Bool)

(assert (=> b!835416 (= e!466046 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvsge to!390 (size!22856 a!4227))))))

(declare-fun res!568288 () Bool)

(assert (=> start!71892 (=> (not res!568288) (not e!466046))))

(assert (=> start!71892 (= res!568288 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22856 a!4227))))))

(assert (=> start!71892 e!466046))

(assert (=> start!71892 true))

(declare-fun array_inv!17882 (array!46802) Bool)

(assert (=> start!71892 (array_inv!17882 a!4227)))

(declare-fun b!835417 () Bool)

(declare-fun res!568287 () Bool)

(assert (=> b!835417 (=> (not res!568287) (not e!466046))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46802 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835417 (= res!568287 (= (arrayCountValidKeys!0 (array!46803 (store (arr!22435 a!4227) i!1466 k0!2968) (size!22856 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835418 () Bool)

(declare-fun res!568285 () Bool)

(assert (=> b!835418 (=> (not res!568285) (not e!466046))))

(assert (=> b!835418 (= res!568285 (validKeyInArray!0 k0!2968))))

(assert (= (and start!71892 res!568288) b!835415))

(assert (= (and b!835415 res!568286) b!835418))

(assert (= (and b!835418 res!568285) b!835412))

(assert (= (and b!835412 res!568283) b!835417))

(assert (= (and b!835417 res!568287) b!835413))

(assert (= (and b!835413 res!568284) b!835414))

(assert (= (and b!835414 res!568289) b!835416))

(declare-fun m!780585 () Bool)

(assert (=> start!71892 m!780585))

(declare-fun m!780587 () Bool)

(assert (=> b!835414 m!780587))

(assert (=> b!835414 m!780587))

(declare-fun m!780589 () Bool)

(assert (=> b!835414 m!780589))

(declare-fun m!780591 () Bool)

(assert (=> b!835415 m!780591))

(assert (=> b!835415 m!780591))

(declare-fun m!780593 () Bool)

(assert (=> b!835415 m!780593))

(declare-fun m!780595 () Bool)

(assert (=> b!835418 m!780595))

(declare-fun m!780597 () Bool)

(assert (=> b!835417 m!780597))

(declare-fun m!780599 () Bool)

(assert (=> b!835417 m!780599))

(declare-fun m!780601 () Bool)

(assert (=> b!835417 m!780601))

(check-sat (not b!835417) (not start!71892) (not b!835414) (not b!835418) (not b!835415))
(check-sat)
