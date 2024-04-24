; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36244 () Bool)

(assert start!36244)

(declare-fun b!363124 () Bool)

(declare-fun res!202402 () Bool)

(declare-fun e!222355 () Bool)

(assert (=> b!363124 (=> (not res!202402) (not e!222355))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363124 (= res!202402 (validKeyInArray!0 k0!2980))))

(declare-fun b!363125 () Bool)

(declare-fun res!202405 () Bool)

(assert (=> b!363125 (=> (not res!202405) (not e!222355))))

(declare-datatypes ((array!20540 0))(
  ( (array!20541 (arr!9750 (Array (_ BitVec 32) (_ BitVec 64))) (size!10102 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20540)

(assert (=> b!363125 (= res!202405 (bvslt (size!10102 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363123 () Bool)

(declare-fun res!202404 () Bool)

(assert (=> b!363123 (=> (not res!202404) (not e!222355))))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363123 (= res!202404 (not (validKeyInArray!0 (select (arr!9750 a!4337) i!1478))))))

(declare-fun res!202403 () Bool)

(assert (=> start!36244 (=> (not res!202403) (not e!222355))))

(assert (=> start!36244 (= res!202403 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10102 a!4337))))))

(assert (=> start!36244 e!222355))

(assert (=> start!36244 true))

(declare-fun array_inv!7222 (array!20540) Bool)

(assert (=> start!36244 (array_inv!7222 a!4337)))

(declare-fun b!363126 () Bool)

(assert (=> b!363126 (= e!222355 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1478) i!1478))))))

(declare-fun arrayCountValidKeys!0 (array!20540 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363126 (= (arrayCountValidKeys!0 (array!20541 (store (arr!9750 a!4337) i!1478 k0!2980) (size!10102 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11197 0))(
  ( (Unit!11198) )
))
(declare-fun lt!167396 () Unit!11197)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20540 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11197)

(assert (=> b!363126 (= lt!167396 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(assert (= (and start!36244 res!202403) b!363123))

(assert (= (and b!363123 res!202404) b!363124))

(assert (= (and b!363124 res!202402) b!363125))

(assert (= (and b!363125 res!202405) b!363126))

(declare-fun m!360289 () Bool)

(assert (=> b!363124 m!360289))

(declare-fun m!360291 () Bool)

(assert (=> b!363123 m!360291))

(assert (=> b!363123 m!360291))

(declare-fun m!360293 () Bool)

(assert (=> b!363123 m!360293))

(declare-fun m!360295 () Bool)

(assert (=> start!36244 m!360295))

(declare-fun m!360297 () Bool)

(assert (=> b!363126 m!360297))

(declare-fun m!360299 () Bool)

(assert (=> b!363126 m!360299))

(declare-fun m!360301 () Bool)

(assert (=> b!363126 m!360301))

(declare-fun m!360303 () Bool)

(assert (=> b!363126 m!360303))

(check-sat (not b!363126) (not b!363123) (not b!363124) (not start!36244))
(check-sat)
