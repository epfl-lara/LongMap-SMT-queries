; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71850 () Bool)

(assert start!71850)

(declare-fun b!835051 () Bool)

(declare-fun res!567925 () Bool)

(declare-fun e!465894 () Bool)

(assert (=> b!835051 (=> (not res!567925) (not e!465894))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835051 (= res!567925 (validKeyInArray!0 k0!2968))))

(declare-fun b!835052 () Bool)

(declare-fun res!567924 () Bool)

(assert (=> b!835052 (=> (not res!567924) (not e!465894))))

(declare-datatypes ((array!46760 0))(
  ( (array!46761 (arr!22414 (Array (_ BitVec 32) (_ BitVec 64))) (size!22835 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46760)

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!835052 (= res!567924 (not (validKeyInArray!0 (select (arr!22414 a!4227) i!1466))))))

(declare-fun res!567923 () Bool)

(assert (=> start!71850 (=> (not res!567923) (not e!465894))))

(assert (=> start!71850 (= res!567923 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22835 a!4227))))))

(assert (=> start!71850 e!465894))

(assert (=> start!71850 true))

(declare-fun array_inv!17861 (array!46760) Bool)

(assert (=> start!71850 (array_inv!17861 a!4227)))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun b!835053 () Bool)

(assert (=> b!835053 (= e!465894 (and (= to!390 (size!22835 a!4227)) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun b!835054 () Bool)

(declare-fun res!567922 () Bool)

(assert (=> b!835054 (=> (not res!567922) (not e!465894))))

(assert (=> b!835054 (= res!567922 (and (bvslt (size!22835 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22835 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835055 () Bool)

(declare-fun res!567926 () Bool)

(assert (=> b!835055 (=> (not res!567926) (not e!465894))))

(declare-fun arrayCountValidKeys!0 (array!46760 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835055 (= res!567926 (= (arrayCountValidKeys!0 (array!46761 (store (arr!22414 a!4227) i!1466 k0!2968) (size!22835 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(assert (= (and start!71850 res!567923) b!835052))

(assert (= (and b!835052 res!567924) b!835051))

(assert (= (and b!835051 res!567925) b!835054))

(assert (= (and b!835054 res!567922) b!835055))

(assert (= (and b!835055 res!567926) b!835053))

(declare-fun m!780215 () Bool)

(assert (=> b!835051 m!780215))

(declare-fun m!780217 () Bool)

(assert (=> b!835052 m!780217))

(assert (=> b!835052 m!780217))

(declare-fun m!780219 () Bool)

(assert (=> b!835052 m!780219))

(declare-fun m!780221 () Bool)

(assert (=> start!71850 m!780221))

(declare-fun m!780223 () Bool)

(assert (=> b!835055 m!780223))

(declare-fun m!780225 () Bool)

(assert (=> b!835055 m!780225))

(declare-fun m!780227 () Bool)

(assert (=> b!835055 m!780227))

(check-sat (not b!835055) (not b!835052) (not b!835051) (not start!71850))
(check-sat)
