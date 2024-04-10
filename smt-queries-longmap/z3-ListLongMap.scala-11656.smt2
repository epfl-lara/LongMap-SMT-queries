; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136320 () Bool)

(assert start!136320)

(declare-fun b!1577034 () Bool)

(declare-fun e!879632 () Bool)

(assert (=> b!1577034 (= e!879632 false)))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun lt!675916 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577034 (= lt!675916 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577033 () Bool)

(declare-fun res!1077294 () Bool)

(assert (=> b!1577033 (=> (not res!1077294) (not e!879632))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-datatypes ((array!105532 0))(
  ( (array!105533 (arr!50888 (Array (_ BitVec 32) (_ BitVec 64))) (size!51438 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105532)

(assert (=> b!1577033 (= res!1077294 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50888 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50888 _keys!610) ee!12) (select (arr!50888 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577032 () Bool)

(declare-fun res!1077297 () Bool)

(assert (=> b!1577032 (=> (not res!1077297) (not e!879632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577032 (= res!1077297 (validKeyInArray!0 k0!768))))

(declare-fun res!1077296 () Bool)

(assert (=> start!136320 (=> (not res!1077296) (not e!879632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136320 (= res!1077296 (validMask!0 mask!910))))

(assert (=> start!136320 e!879632))

(assert (=> start!136320 true))

(declare-fun array_inv!39615 (array!105532) Bool)

(assert (=> start!136320 (array_inv!39615 _keys!610)))

(declare-fun b!1577031 () Bool)

(declare-fun res!1077295 () Bool)

(assert (=> b!1577031 (=> (not res!1077295) (not e!879632))))

(assert (=> b!1577031 (= res!1077295 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51438 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(assert (= (and start!136320 res!1077296) b!1577031))

(assert (= (and b!1577031 res!1077295) b!1577032))

(assert (= (and b!1577032 res!1077297) b!1577033))

(assert (= (and b!1577033 res!1077294) b!1577034))

(declare-fun m!1449365 () Bool)

(assert (=> b!1577034 m!1449365))

(declare-fun m!1449367 () Bool)

(assert (=> b!1577033 m!1449367))

(declare-fun m!1449369 () Bool)

(assert (=> b!1577032 m!1449369))

(declare-fun m!1449371 () Bool)

(assert (=> start!136320 m!1449371))

(declare-fun m!1449373 () Bool)

(assert (=> start!136320 m!1449373))

(check-sat (not start!136320) (not b!1577032) (not b!1577034))
