; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71816 () Bool)

(assert start!71816)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun e!465704 () Bool)

(declare-datatypes ((array!46715 0))(
  ( (array!46716 (arr!22392 (Array (_ BitVec 32) (_ BitVec 64))) (size!22813 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46715)

(declare-fun b!834713 () Bool)

(assert (=> b!834713 (= e!465704 (and (= to!390 (size!22813 a!4227)) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun b!834714 () Bool)

(declare-fun res!567723 () Bool)

(assert (=> b!834714 (=> (not res!567723) (not e!465704))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834714 (= res!567723 (validKeyInArray!0 k0!2968))))

(declare-fun b!834715 () Bool)

(declare-fun res!567722 () Bool)

(assert (=> b!834715 (=> (not res!567722) (not e!465704))))

(assert (=> b!834715 (= res!567722 (not (validKeyInArray!0 (select (arr!22392 a!4227) i!1466))))))

(declare-fun res!567720 () Bool)

(assert (=> start!71816 (=> (not res!567720) (not e!465704))))

(assert (=> start!71816 (= res!567720 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22813 a!4227))))))

(assert (=> start!71816 e!465704))

(assert (=> start!71816 true))

(declare-fun array_inv!17904 (array!46715) Bool)

(assert (=> start!71816 (array_inv!17904 a!4227)))

(declare-fun b!834716 () Bool)

(declare-fun res!567721 () Bool)

(assert (=> b!834716 (=> (not res!567721) (not e!465704))))

(declare-fun arrayCountValidKeys!0 (array!46715 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834716 (= res!567721 (= (arrayCountValidKeys!0 (array!46716 (store (arr!22392 a!4227) i!1466 k0!2968) (size!22813 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!834717 () Bool)

(declare-fun res!567724 () Bool)

(assert (=> b!834717 (=> (not res!567724) (not e!465704))))

(assert (=> b!834717 (= res!567724 (and (bvslt (size!22813 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22813 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71816 res!567720) b!834715))

(assert (= (and b!834715 res!567722) b!834714))

(assert (= (and b!834714 res!567723) b!834717))

(assert (= (and b!834717 res!567724) b!834716))

(assert (= (and b!834716 res!567721) b!834713))

(declare-fun m!779365 () Bool)

(assert (=> b!834714 m!779365))

(declare-fun m!779367 () Bool)

(assert (=> b!834715 m!779367))

(assert (=> b!834715 m!779367))

(declare-fun m!779369 () Bool)

(assert (=> b!834715 m!779369))

(declare-fun m!779371 () Bool)

(assert (=> start!71816 m!779371))

(declare-fun m!779373 () Bool)

(assert (=> b!834716 m!779373))

(declare-fun m!779375 () Bool)

(assert (=> b!834716 m!779375))

(declare-fun m!779377 () Bool)

(assert (=> b!834716 m!779377))

(check-sat (not b!834715) (not b!834716) (not start!71816) (not b!834714))
(check-sat)
