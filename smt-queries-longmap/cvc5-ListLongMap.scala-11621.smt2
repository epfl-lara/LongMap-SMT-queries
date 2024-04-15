; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135572 () Bool)

(assert start!135572)

(declare-fun res!1075672 () Bool)

(declare-fun e!877909 () Bool)

(assert (=> start!135572 (=> (not res!1075672) (not e!877909))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135572 (= res!1075672 (validMask!0 mask!898))))

(assert (=> start!135572 e!877909))

(assert (=> start!135572 true))

(declare-datatypes ((array!105207 0))(
  ( (array!105208 (arr!50749 (Array (_ BitVec 32) (_ BitVec 64))) (size!51301 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105207)

(declare-fun array_inv!39685 (array!105207) Bool)

(assert (=> start!135572 (array_inv!39685 _keys!605)))

(declare-fun b!1574193 () Bool)

(declare-fun res!1075674 () Bool)

(assert (=> b!1574193 (=> (not res!1075674) (not e!877909))))

(assert (=> b!1574193 (= res!1075674 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51301 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574194 () Bool)

(declare-fun res!1075673 () Bool)

(assert (=> b!1574194 (=> (not res!1075673) (not e!877909))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574194 (= res!1075673 (validKeyInArray!0 k!761))))

(declare-fun b!1574195 () Bool)

(assert (=> b!1574195 (= e!877909 false)))

(declare-fun lt!674553 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574195 (= lt!674553 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135572 res!1075672) b!1574193))

(assert (= (and b!1574193 res!1075674) b!1574194))

(assert (= (and b!1574194 res!1075673) b!1574195))

(declare-fun m!1446841 () Bool)

(assert (=> start!135572 m!1446841))

(declare-fun m!1446843 () Bool)

(assert (=> start!135572 m!1446843))

(declare-fun m!1446845 () Bool)

(assert (=> b!1574194 m!1446845))

(declare-fun m!1446847 () Bool)

(assert (=> b!1574195 m!1446847))

(push 1)

(assert (not b!1574194))

(assert (not start!135572))

(assert (not b!1574195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

