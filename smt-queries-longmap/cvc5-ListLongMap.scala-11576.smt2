; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134842 () Bool)

(assert start!134842)

(declare-fun res!1073968 () Bool)

(declare-fun e!876361 () Bool)

(assert (=> start!134842 (=> (not res!1073968) (not e!876361))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134842 (= res!1073968 (validMask!0 mask!889))))

(assert (=> start!134842 e!876361))

(assert (=> start!134842 true))

(declare-datatypes ((array!104890 0))(
  ( (array!104891 (arr!50614 (Array (_ BitVec 32) (_ BitVec 64))) (size!51166 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104890)

(declare-fun array_inv!39550 (array!104890) Bool)

(assert (=> start!134842 (array_inv!39550 _keys!600)))

(declare-fun b!1571718 () Bool)

(declare-fun res!1073970 () Bool)

(assert (=> b!1571718 (=> (not res!1073970) (not e!876361))))

(assert (=> b!1571718 (= res!1073970 (= (size!51166 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571719 () Bool)

(declare-fun res!1073969 () Bool)

(assert (=> b!1571719 (=> (not res!1073969) (not e!876361))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571719 (= res!1073969 (validKeyInArray!0 k!754))))

(declare-fun b!1571720 () Bool)

(assert (=> b!1571720 (= e!876361 false)))

(declare-datatypes ((SeekEntryResult!13562 0))(
  ( (MissingZero!13562 (index!56646 (_ BitVec 32))) (Found!13562 (index!56647 (_ BitVec 32))) (Intermediate!13562 (undefined!14374 Bool) (index!56648 (_ BitVec 32)) (x!141407 (_ BitVec 32))) (Undefined!13562) (MissingVacant!13562 (index!56649 (_ BitVec 32))) )
))
(declare-fun lt!673545 () SeekEntryResult!13562)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104890 (_ BitVec 32)) SeekEntryResult!13562)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571720 (= lt!673545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134842 res!1073968) b!1571718))

(assert (= (and b!1571718 res!1073970) b!1571719))

(assert (= (and b!1571719 res!1073969) b!1571720))

(declare-fun m!1444985 () Bool)

(assert (=> start!134842 m!1444985))

(declare-fun m!1444987 () Bool)

(assert (=> start!134842 m!1444987))

(declare-fun m!1444989 () Bool)

(assert (=> b!1571719 m!1444989))

(declare-fun m!1444991 () Bool)

(assert (=> b!1571720 m!1444991))

(assert (=> b!1571720 m!1444991))

(declare-fun m!1444993 () Bool)

(assert (=> b!1571720 m!1444993))

(push 1)

(assert (not start!134842))

(assert (not b!1571719))

(assert (not b!1571720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

