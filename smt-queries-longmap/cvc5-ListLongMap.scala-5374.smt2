; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71826 () Bool)

(assert start!71826)

(declare-fun b!834782 () Bool)

(declare-fun res!567789 () Bool)

(declare-fun e!465734 () Bool)

(assert (=> b!834782 (=> (not res!567789) (not e!465734))))

(declare-datatypes ((array!46725 0))(
  ( (array!46726 (arr!22397 (Array (_ BitVec 32) (_ BitVec 64))) (size!22818 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46725)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834782 (= res!567789 (and (bvslt (size!22818 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22818 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834783 () Bool)

(assert (=> b!834783 (= e!465734 false)))

(declare-fun lt!379403 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46725 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834783 (= lt!379403 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379402 () (_ BitVec 32))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834783 (= lt!379402 (arrayCountValidKeys!0 (array!46726 (store (arr!22397 a!4227) i!1466 k!2968) (size!22818 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!567787 () Bool)

(assert (=> start!71826 (=> (not res!567787) (not e!465734))))

(assert (=> start!71826 (= res!567787 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22818 a!4227))))))

(assert (=> start!71826 e!465734))

(assert (=> start!71826 true))

(declare-fun array_inv!17909 (array!46725) Bool)

(assert (=> start!71826 (array_inv!17909 a!4227)))

(declare-fun b!834780 () Bool)

(declare-fun res!567788 () Bool)

(assert (=> b!834780 (=> (not res!567788) (not e!465734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834780 (= res!567788 (not (validKeyInArray!0 (select (arr!22397 a!4227) i!1466))))))

(declare-fun b!834781 () Bool)

(declare-fun res!567790 () Bool)

(assert (=> b!834781 (=> (not res!567790) (not e!465734))))

(assert (=> b!834781 (= res!567790 (validKeyInArray!0 k!2968))))

(assert (= (and start!71826 res!567787) b!834780))

(assert (= (and b!834780 res!567788) b!834781))

(assert (= (and b!834781 res!567790) b!834782))

(assert (= (and b!834782 res!567789) b!834783))

(declare-fun m!779435 () Bool)

(assert (=> b!834783 m!779435))

(declare-fun m!779437 () Bool)

(assert (=> b!834783 m!779437))

(declare-fun m!779439 () Bool)

(assert (=> b!834783 m!779439))

(declare-fun m!779441 () Bool)

(assert (=> start!71826 m!779441))

(declare-fun m!779443 () Bool)

(assert (=> b!834780 m!779443))

(assert (=> b!834780 m!779443))

(declare-fun m!779445 () Bool)

(assert (=> b!834780 m!779445))

(declare-fun m!779447 () Bool)

(assert (=> b!834781 m!779447))

(push 1)

(assert (not b!834783))

(assert (not start!71826))

(assert (not b!834780))

(assert (not b!834781))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

