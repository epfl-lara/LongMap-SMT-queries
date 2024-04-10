; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134898 () Bool)

(assert start!134898)

(declare-fun res!1074126 () Bool)

(declare-fun e!876578 () Bool)

(assert (=> start!134898 (=> (not res!1074126) (not e!876578))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134898 (= res!1074126 (validMask!0 mask!889))))

(assert (=> start!134898 e!876578))

(assert (=> start!134898 true))

(declare-datatypes ((array!104968 0))(
  ( (array!104969 (arr!50652 (Array (_ BitVec 32) (_ BitVec 64))) (size!51202 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104968)

(declare-fun array_inv!39379 (array!104968) Bool)

(assert (=> start!134898 (array_inv!39379 _keys!600)))

(declare-fun b!1572058 () Bool)

(declare-fun res!1074124 () Bool)

(assert (=> b!1572058 (=> (not res!1074124) (not e!876578))))

(assert (=> b!1572058 (= res!1074124 (= (size!51202 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572059 () Bool)

(declare-fun res!1074125 () Bool)

(assert (=> b!1572059 (=> (not res!1074125) (not e!876578))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572059 (= res!1074125 (validKeyInArray!0 k!754))))

(declare-fun b!1572060 () Bool)

(assert (=> b!1572060 (= e!876578 false)))

(declare-datatypes ((SeekEntryResult!13565 0))(
  ( (MissingZero!13565 (index!56658 (_ BitVec 32))) (Found!13565 (index!56659 (_ BitVec 32))) (Intermediate!13565 (undefined!14377 Bool) (index!56660 (_ BitVec 32)) (x!141423 (_ BitVec 32))) (Undefined!13565) (MissingVacant!13565 (index!56661 (_ BitVec 32))) )
))
(declare-fun lt!673840 () SeekEntryResult!13565)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104968 (_ BitVec 32)) SeekEntryResult!13565)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572060 (= lt!673840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134898 res!1074126) b!1572058))

(assert (= (and b!1572058 res!1074124) b!1572059))

(assert (= (and b!1572059 res!1074125) b!1572060))

(declare-fun m!1445907 () Bool)

(assert (=> start!134898 m!1445907))

(declare-fun m!1445909 () Bool)

(assert (=> start!134898 m!1445909))

(declare-fun m!1445911 () Bool)

(assert (=> b!1572059 m!1445911))

(declare-fun m!1445913 () Bool)

(assert (=> b!1572060 m!1445913))

(assert (=> b!1572060 m!1445913))

(declare-fun m!1445915 () Bool)

(assert (=> b!1572060 m!1445915))

(push 1)

(assert (not b!1572059))

(assert (not start!134898))

(assert (not b!1572060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

