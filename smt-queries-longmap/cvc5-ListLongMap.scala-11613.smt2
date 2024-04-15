; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135482 () Bool)

(assert start!135482)

(declare-fun res!1075444 () Bool)

(declare-fun e!877757 () Bool)

(assert (=> start!135482 (=> (not res!1075444) (not e!877757))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135482 (= res!1075444 (validMask!0 mask!877))))

(assert (=> start!135482 e!877757))

(assert (=> start!135482 true))

(declare-datatypes ((array!105153 0))(
  ( (array!105154 (arr!50725 (Array (_ BitVec 32) (_ BitVec 64))) (size!51277 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105153)

(declare-fun array_inv!39661 (array!105153) Bool)

(assert (=> start!135482 (array_inv!39661 _keys!591)))

(declare-fun b!1573968 () Bool)

(declare-fun res!1075446 () Bool)

(assert (=> b!1573968 (=> (not res!1075446) (not e!877757))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573968 (= res!1075446 (and (= (size!51277 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51277 _keys!591)) (bvslt i!537 (size!51277 _keys!591))))))

(declare-fun b!1573969 () Bool)

(declare-fun res!1075445 () Bool)

(assert (=> b!1573969 (=> (not res!1075445) (not e!877757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573969 (= res!1075445 (validKeyInArray!0 (select (arr!50725 _keys!591) i!537)))))

(declare-fun b!1573970 () Bool)

(assert (=> b!1573970 (= e!877757 (not true))))

(declare-fun arrayContainsKey!0 (array!105153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573970 (arrayContainsKey!0 _keys!591 (select (arr!50725 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51975 0))(
  ( (Unit!51976) )
))
(declare-fun lt!674481 () Unit!51975)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105153 (_ BitVec 64) (_ BitVec 32)) Unit!51975)

(assert (=> b!1573970 (= lt!674481 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50725 _keys!591) i!537) i!537))))

(assert (= (and start!135482 res!1075444) b!1573968))

(assert (= (and b!1573968 res!1075446) b!1573969))

(assert (= (and b!1573969 res!1075445) b!1573970))

(declare-fun m!1446633 () Bool)

(assert (=> start!135482 m!1446633))

(declare-fun m!1446635 () Bool)

(assert (=> start!135482 m!1446635))

(declare-fun m!1446637 () Bool)

(assert (=> b!1573969 m!1446637))

(assert (=> b!1573969 m!1446637))

(declare-fun m!1446639 () Bool)

(assert (=> b!1573969 m!1446639))

(assert (=> b!1573970 m!1446637))

(assert (=> b!1573970 m!1446637))

(declare-fun m!1446641 () Bool)

(assert (=> b!1573970 m!1446641))

(assert (=> b!1573970 m!1446637))

(declare-fun m!1446643 () Bool)

(assert (=> b!1573970 m!1446643))

(push 1)

(assert (not start!135482))

(assert (not b!1573969))

(assert (not b!1573970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

