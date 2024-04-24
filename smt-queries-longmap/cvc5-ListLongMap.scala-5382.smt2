; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72060 () Bool)

(assert start!72060)

(declare-datatypes ((array!46807 0))(
  ( (array!46808 (arr!22433 (Array (_ BitVec 32) (_ BitVec 64))) (size!22853 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46807)

(declare-fun b!836331 () Bool)

(declare-fun e!466632 () Bool)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836331 (= e!466632 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvsge to!390 (size!22853 a!4227))))))

(declare-fun b!836332 () Bool)

(declare-fun res!568651 () Bool)

(assert (=> b!836332 (=> (not res!568651) (not e!466632))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46807 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836332 (= res!568651 (= (arrayCountValidKeys!0 (array!46808 (store (arr!22433 a!4227) i!1466 k!2968) (size!22853 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!836333 () Bool)

(declare-fun res!568654 () Bool)

(assert (=> b!836333 (=> (not res!568654) (not e!466632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836333 (= res!568654 (validKeyInArray!0 k!2968))))

(declare-fun b!836334 () Bool)

(declare-fun res!568653 () Bool)

(assert (=> b!836334 (=> (not res!568653) (not e!466632))))

(assert (=> b!836334 (= res!568653 (not (validKeyInArray!0 (select (arr!22433 a!4227) i!1466))))))

(declare-fun b!836335 () Bool)

(declare-fun res!568652 () Bool)

(assert (=> b!836335 (=> (not res!568652) (not e!466632))))

(assert (=> b!836335 (= res!568652 (not (= to!390 (size!22853 a!4227))))))

(declare-fun b!836336 () Bool)

(declare-fun res!568650 () Bool)

(assert (=> b!836336 (=> (not res!568650) (not e!466632))))

(assert (=> b!836336 (= res!568650 (not (validKeyInArray!0 (select (arr!22433 a!4227) to!390))))))

(declare-fun b!836337 () Bool)

(declare-fun res!568656 () Bool)

(assert (=> b!836337 (=> (not res!568656) (not e!466632))))

(assert (=> b!836337 (= res!568656 (and (bvslt (size!22853 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22853 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!568655 () Bool)

(assert (=> start!72060 (=> (not res!568655) (not e!466632))))

(assert (=> start!72060 (= res!568655 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22853 a!4227))))))

(assert (=> start!72060 e!466632))

(assert (=> start!72060 true))

(declare-fun array_inv!17919 (array!46807) Bool)

(assert (=> start!72060 (array_inv!17919 a!4227)))

(assert (= (and start!72060 res!568655) b!836334))

(assert (= (and b!836334 res!568653) b!836333))

(assert (= (and b!836333 res!568654) b!836337))

(assert (= (and b!836337 res!568656) b!836332))

(assert (= (and b!836332 res!568651) b!836335))

(assert (= (and b!836335 res!568652) b!836336))

(assert (= (and b!836336 res!568650) b!836331))

(declare-fun m!781897 () Bool)

(assert (=> b!836333 m!781897))

(declare-fun m!781899 () Bool)

(assert (=> b!836336 m!781899))

(assert (=> b!836336 m!781899))

(declare-fun m!781901 () Bool)

(assert (=> b!836336 m!781901))

(declare-fun m!781903 () Bool)

(assert (=> b!836332 m!781903))

(declare-fun m!781905 () Bool)

(assert (=> b!836332 m!781905))

(declare-fun m!781907 () Bool)

(assert (=> b!836332 m!781907))

(declare-fun m!781909 () Bool)

(assert (=> b!836334 m!781909))

(assert (=> b!836334 m!781909))

(declare-fun m!781911 () Bool)

(assert (=> b!836334 m!781911))

(declare-fun m!781913 () Bool)

(assert (=> start!72060 m!781913))

(push 1)

(assert (not b!836334))

(assert (not b!836336))

(assert (not b!836332))

(assert (not b!836333))

(assert (not start!72060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

