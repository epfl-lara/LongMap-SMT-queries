; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134892 () Bool)

(assert start!134892)

(declare-fun res!1074097 () Bool)

(declare-fun e!876560 () Bool)

(assert (=> start!134892 (=> (not res!1074097) (not e!876560))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134892 (= res!1074097 (validMask!0 mask!889))))

(assert (=> start!134892 e!876560))

(assert (=> start!134892 true))

(declare-datatypes ((array!104962 0))(
  ( (array!104963 (arr!50649 (Array (_ BitVec 32) (_ BitVec 64))) (size!51199 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104962)

(declare-fun array_inv!39376 (array!104962) Bool)

(assert (=> start!134892 (array_inv!39376 _keys!600)))

(declare-fun b!1572031 () Bool)

(declare-fun res!1074098 () Bool)

(assert (=> b!1572031 (=> (not res!1074098) (not e!876560))))

(assert (=> b!1572031 (= res!1074098 (= (size!51199 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572032 () Bool)

(declare-fun res!1074099 () Bool)

(assert (=> b!1572032 (=> (not res!1074099) (not e!876560))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572032 (= res!1074099 (validKeyInArray!0 k!754))))

(declare-fun b!1572033 () Bool)

(assert (=> b!1572033 (= e!876560 false)))

(declare-datatypes ((SeekEntryResult!13562 0))(
  ( (MissingZero!13562 (index!56646 (_ BitVec 32))) (Found!13562 (index!56647 (_ BitVec 32))) (Intermediate!13562 (undefined!14374 Bool) (index!56648 (_ BitVec 32)) (x!141412 (_ BitVec 32))) (Undefined!13562) (MissingVacant!13562 (index!56649 (_ BitVec 32))) )
))
(declare-fun lt!673831 () SeekEntryResult!13562)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104962 (_ BitVec 32)) SeekEntryResult!13562)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572033 (= lt!673831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134892 res!1074097) b!1572031))

(assert (= (and b!1572031 res!1074098) b!1572032))

(assert (= (and b!1572032 res!1074099) b!1572033))

(declare-fun m!1445877 () Bool)

(assert (=> start!134892 m!1445877))

(declare-fun m!1445879 () Bool)

(assert (=> start!134892 m!1445879))

(declare-fun m!1445881 () Bool)

(assert (=> b!1572032 m!1445881))

(declare-fun m!1445883 () Bool)

(assert (=> b!1572033 m!1445883))

(assert (=> b!1572033 m!1445883))

(declare-fun m!1445885 () Bool)

(assert (=> b!1572033 m!1445885))

(push 1)

(assert (not start!134892))

(assert (not b!1572033))

(assert (not b!1572032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

