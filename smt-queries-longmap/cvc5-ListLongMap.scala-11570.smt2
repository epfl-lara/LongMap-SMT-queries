; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135238 () Bool)

(assert start!135238)

(declare-fun res!1074765 () Bool)

(declare-fun e!877915 () Bool)

(assert (=> start!135238 (=> (not res!1074765) (not e!877915))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135238 (= res!1074765 (validMask!0 mask!889))))

(assert (=> start!135238 e!877915))

(assert (=> start!135238 true))

(declare-datatypes ((array!105045 0))(
  ( (array!105046 (arr!50685 (Array (_ BitVec 32) (_ BitVec 64))) (size!51236 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105045)

(declare-fun array_inv!39640 (array!105045) Bool)

(assert (=> start!135238 (array_inv!39640 _keys!600)))

(declare-fun b!1574224 () Bool)

(declare-fun res!1074766 () Bool)

(assert (=> b!1574224 (=> (not res!1074766) (not e!877915))))

(assert (=> b!1574224 (= res!1074766 (= (size!51236 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574225 () Bool)

(declare-fun res!1074767 () Bool)

(assert (=> b!1574225 (=> (not res!1074767) (not e!877915))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574225 (= res!1074767 (validKeyInArray!0 k!754))))

(declare-fun b!1574226 () Bool)

(assert (=> b!1574226 (= e!877915 false)))

(declare-fun lt!674649 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574226 (= lt!674649 (toIndex!0 k!754 mask!889))))

(assert (= (and start!135238 res!1074765) b!1574224))

(assert (= (and b!1574224 res!1074766) b!1574225))

(assert (= (and b!1574225 res!1074767) b!1574226))

(declare-fun m!1447921 () Bool)

(assert (=> start!135238 m!1447921))

(declare-fun m!1447923 () Bool)

(assert (=> start!135238 m!1447923))

(declare-fun m!1447925 () Bool)

(assert (=> b!1574225 m!1447925))

(declare-fun m!1447927 () Bool)

(assert (=> b!1574226 m!1447927))

(push 1)

(assert (not b!1574225))

(assert (not start!135238))

(assert (not b!1574226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

