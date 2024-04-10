; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135428 () Bool)

(assert start!135428)

(declare-fun res!1075269 () Bool)

(declare-fun e!877747 () Bool)

(assert (=> start!135428 (=> (not res!1075269) (not e!877747))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135428 (= res!1075269 (validMask!0 mask!877))))

(assert (=> start!135428 e!877747))

(assert (=> start!135428 true))

(declare-datatypes ((array!105159 0))(
  ( (array!105160 (arr!50730 (Array (_ BitVec 32) (_ BitVec 64))) (size!51280 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105159)

(declare-fun array_inv!39457 (array!105159) Bool)

(assert (=> start!135428 (array_inv!39457 _keys!591)))

(declare-fun b!1573975 () Bool)

(declare-fun res!1075268 () Bool)

(assert (=> b!1573975 (=> (not res!1075268) (not e!877747))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573975 (= res!1075268 (and (= (size!51280 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51280 _keys!591)) (bvslt i!537 (size!51280 _keys!591))))))

(declare-fun b!1573976 () Bool)

(declare-fun res!1075267 () Bool)

(assert (=> b!1573976 (=> (not res!1075267) (not e!877747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573976 (= res!1075267 (validKeyInArray!0 (select (arr!50730 _keys!591) i!537)))))

(declare-fun b!1573977 () Bool)

(assert (=> b!1573977 (= e!877747 (not (bvsge mask!877 #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!105159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573977 (arrayContainsKey!0 _keys!591 (select (arr!50730 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52124 0))(
  ( (Unit!52125) )
))
(declare-fun lt!674677 () Unit!52124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105159 (_ BitVec 64) (_ BitVec 32)) Unit!52124)

(assert (=> b!1573977 (= lt!674677 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50730 _keys!591) i!537) i!537))))

(assert (= (and start!135428 res!1075269) b!1573975))

(assert (= (and b!1573975 res!1075268) b!1573976))

(assert (= (and b!1573976 res!1075267) b!1573977))

(declare-fun m!1447165 () Bool)

(assert (=> start!135428 m!1447165))

(declare-fun m!1447167 () Bool)

(assert (=> start!135428 m!1447167))

(declare-fun m!1447169 () Bool)

(assert (=> b!1573976 m!1447169))

(assert (=> b!1573976 m!1447169))

(declare-fun m!1447171 () Bool)

(assert (=> b!1573976 m!1447171))

(assert (=> b!1573977 m!1447169))

(assert (=> b!1573977 m!1447169))

(declare-fun m!1447173 () Bool)

(assert (=> b!1573977 m!1447173))

(assert (=> b!1573977 m!1447169))

(declare-fun m!1447175 () Bool)

(assert (=> b!1573977 m!1447175))

(push 1)

(assert (not b!1573977))

(assert (not b!1573976))

(assert (not start!135428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

