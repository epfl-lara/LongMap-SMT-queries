; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71868 () Bool)

(assert start!71868)

(declare-fun b!835177 () Bool)

(declare-fun res!568048 () Bool)

(declare-fun e!465948 () Bool)

(assert (=> b!835177 (=> (not res!568048) (not e!465948))))

(declare-datatypes ((array!46778 0))(
  ( (array!46779 (arr!22423 (Array (_ BitVec 32) (_ BitVec 64))) (size!22844 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46778)

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46778 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835177 (= res!568048 (= (arrayCountValidKeys!0 (array!46779 (store (arr!22423 a!4227) i!1466 k0!2968) (size!22844 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun res!568052 () Bool)

(assert (=> start!71868 (=> (not res!568052) (not e!465948))))

(assert (=> start!71868 (= res!568052 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22844 a!4227))))))

(assert (=> start!71868 e!465948))

(assert (=> start!71868 true))

(declare-fun array_inv!17870 (array!46778) Bool)

(assert (=> start!71868 (array_inv!17870 a!4227)))

(declare-fun b!835178 () Bool)

(declare-fun res!568050 () Bool)

(assert (=> b!835178 (=> (not res!568050) (not e!465948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835178 (= res!568050 (validKeyInArray!0 k0!2968))))

(declare-fun b!835179 () Bool)

(assert (=> b!835179 (= e!465948 (and (not (= to!390 (size!22844 a!4227))) (bvsge to!390 (size!22844 a!4227))))))

(declare-fun b!835180 () Bool)

(declare-fun res!568051 () Bool)

(assert (=> b!835180 (=> (not res!568051) (not e!465948))))

(assert (=> b!835180 (= res!568051 (and (bvslt (size!22844 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22844 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835181 () Bool)

(declare-fun res!568049 () Bool)

(assert (=> b!835181 (=> (not res!568049) (not e!465948))))

(assert (=> b!835181 (= res!568049 (not (validKeyInArray!0 (select (arr!22423 a!4227) i!1466))))))

(assert (= (and start!71868 res!568052) b!835181))

(assert (= (and b!835181 res!568049) b!835178))

(assert (= (and b!835178 res!568050) b!835180))

(assert (= (and b!835180 res!568051) b!835177))

(assert (= (and b!835177 res!568048) b!835179))

(declare-fun m!780341 () Bool)

(assert (=> b!835177 m!780341))

(declare-fun m!780343 () Bool)

(assert (=> b!835177 m!780343))

(declare-fun m!780345 () Bool)

(assert (=> b!835177 m!780345))

(declare-fun m!780347 () Bool)

(assert (=> start!71868 m!780347))

(declare-fun m!780349 () Bool)

(assert (=> b!835178 m!780349))

(declare-fun m!780351 () Bool)

(assert (=> b!835181 m!780351))

(assert (=> b!835181 m!780351))

(declare-fun m!780353 () Bool)

(assert (=> b!835181 m!780353))

(check-sat (not b!835178) (not b!835177) (not start!71868) (not b!835181))
(check-sat)
