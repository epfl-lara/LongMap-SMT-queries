; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135532 () Bool)

(assert start!135532)

(declare-fun res!1075638 () Bool)

(declare-fun e!877999 () Bool)

(assert (=> start!135532 (=> (not res!1075638) (not e!877999))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135532 (= res!1075638 (validMask!0 mask!877))))

(assert (=> start!135532 e!877999))

(assert (=> start!135532 true))

(declare-datatypes ((array!105235 0))(
  ( (array!105236 (arr!50766 (Array (_ BitVec 32) (_ BitVec 64))) (size!51316 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105235)

(declare-fun array_inv!39493 (array!105235) Bool)

(assert (=> start!135532 (array_inv!39493 _keys!591)))

(declare-fun b!1574344 () Bool)

(declare-fun res!1075636 () Bool)

(assert (=> b!1574344 (=> (not res!1075636) (not e!877999))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574344 (= res!1075636 (and (= (size!51316 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51316 _keys!591)) (bvslt i!537 (size!51316 _keys!591))))))

(declare-fun b!1574345 () Bool)

(declare-fun res!1075637 () Bool)

(assert (=> b!1574345 (=> (not res!1075637) (not e!877999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574345 (= res!1075637 (not (validKeyInArray!0 (select (arr!50766 _keys!591) i!537))))))

(declare-fun b!1574346 () Bool)

(assert (=> b!1574346 (= e!877999 (bvsge (bvsub (size!51316 _keys!591) (bvadd #b00000000000000000000000000000001 i!537)) (bvsub (size!51316 _keys!591) i!537)))))

(assert (= (and start!135532 res!1075638) b!1574344))

(assert (= (and b!1574344 res!1075636) b!1574345))

(assert (= (and b!1574345 res!1075637) b!1574346))

(declare-fun m!1447595 () Bool)

(assert (=> start!135532 m!1447595))

(declare-fun m!1447597 () Bool)

(assert (=> start!135532 m!1447597))

(declare-fun m!1447599 () Bool)

(assert (=> b!1574345 m!1447599))

(assert (=> b!1574345 m!1447599))

(declare-fun m!1447601 () Bool)

(assert (=> b!1574345 m!1447601))

(push 1)

(assert (not start!135532))

(assert (not b!1574345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

