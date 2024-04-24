; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71918 () Bool)

(assert start!71918)

(declare-fun res!567439 () Bool)

(declare-fun e!465918 () Bool)

(assert (=> start!71918 (=> (not res!567439) (not e!465918))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46665 0))(
  ( (array!46666 (arr!22362 (Array (_ BitVec 32) (_ BitVec 64))) (size!22782 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46665)

(assert (=> start!71918 (= res!567439 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22782 a!4227))))))

(assert (=> start!71918 e!465918))

(assert (=> start!71918 true))

(declare-fun array_inv!17848 (array!46665) Bool)

(assert (=> start!71918 (array_inv!17848 a!4227)))

(declare-fun b!834958 () Bool)

(declare-fun res!567441 () Bool)

(assert (=> b!834958 (=> (not res!567441) (not e!465918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834958 (= res!567441 (not (validKeyInArray!0 (select (arr!22362 a!4227) i!1466))))))

(declare-fun b!834959 () Bool)

(declare-fun res!567440 () Bool)

(assert (=> b!834959 (=> (not res!567440) (not e!465918))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834959 (= res!567440 (validKeyInArray!0 k0!2968))))

(declare-fun b!834960 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834960 (= e!465918 (and (bvslt (size!22782 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22782 a!4227)) (bvsgt to!390 i!1466) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!71918 res!567439) b!834958))

(assert (= (and b!834958 res!567441) b!834959))

(assert (= (and b!834959 res!567440) b!834960))

(declare-fun m!780273 () Bool)

(assert (=> start!71918 m!780273))

(declare-fun m!780275 () Bool)

(assert (=> b!834958 m!780275))

(assert (=> b!834958 m!780275))

(declare-fun m!780277 () Bool)

(assert (=> b!834958 m!780277))

(declare-fun m!780279 () Bool)

(assert (=> b!834959 m!780279))

(check-sat (not start!71918) (not b!834959) (not b!834958))
(check-sat)
