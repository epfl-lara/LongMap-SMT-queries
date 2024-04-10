; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71772 () Bool)

(assert start!71772)

(declare-fun res!567225 () Bool)

(declare-fun e!465408 () Bool)

(assert (=> start!71772 (=> (not res!567225) (not e!465408))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46682 0))(
  ( (array!46683 (arr!22375 (Array (_ BitVec 32) (_ BitVec 64))) (size!22796 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46682)

(assert (=> start!71772 (= res!567225 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22796 a!4227))))))

(assert (=> start!71772 e!465408))

(assert (=> start!71772 true))

(declare-fun array_inv!17822 (array!46682) Bool)

(assert (=> start!71772 (array_inv!17822 a!4227)))

(declare-fun b!834194 () Bool)

(assert (=> b!834194 (= e!465408 false)))

(declare-fun lt!378817 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46682 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834194 (= lt!378817 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378816 () (_ BitVec 32))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834194 (= lt!378816 (arrayCountValidKeys!0 (array!46683 (store (arr!22375 a!4227) i!1466 k0!2968) (size!22796 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834193 () Bool)

(declare-fun res!567226 () Bool)

(assert (=> b!834193 (=> (not res!567226) (not e!465408))))

(assert (=> b!834193 (= res!567226 (and (bvslt (size!22796 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22796 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834192 () Bool)

(declare-fun res!567227 () Bool)

(assert (=> b!834192 (=> (not res!567227) (not e!465408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834192 (= res!567227 (validKeyInArray!0 k0!2968))))

(declare-fun b!834191 () Bool)

(declare-fun res!567224 () Bool)

(assert (=> b!834191 (=> (not res!567224) (not e!465408))))

(assert (=> b!834191 (= res!567224 (not (validKeyInArray!0 (select (arr!22375 a!4227) i!1466))))))

(assert (= (and start!71772 res!567225) b!834191))

(assert (= (and b!834191 res!567224) b!834192))

(assert (= (and b!834192 res!567227) b!834193))

(assert (= (and b!834193 res!567226) b!834194))

(declare-fun m!779133 () Bool)

(assert (=> start!71772 m!779133))

(declare-fun m!779135 () Bool)

(assert (=> b!834194 m!779135))

(declare-fun m!779137 () Bool)

(assert (=> b!834194 m!779137))

(declare-fun m!779139 () Bool)

(assert (=> b!834194 m!779139))

(declare-fun m!779141 () Bool)

(assert (=> b!834192 m!779141))

(declare-fun m!779143 () Bool)

(assert (=> b!834191 m!779143))

(assert (=> b!834191 m!779143))

(declare-fun m!779145 () Bool)

(assert (=> b!834191 m!779145))

(check-sat (not b!834191) (not start!71772) (not b!834194) (not b!834192))
