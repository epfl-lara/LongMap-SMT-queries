; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135868 () Bool)

(assert start!135868)

(declare-fun res!1076235 () Bool)

(declare-fun e!879329 () Bool)

(assert (=> start!135868 (=> (not res!1076235) (not e!879329))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135868 (= res!1076235 (validMask!0 mask!877))))

(assert (=> start!135868 e!879329))

(assert (=> start!135868 true))

(declare-datatypes ((array!105306 0))(
  ( (array!105307 (arr!50796 (Array (_ BitVec 32) (_ BitVec 64))) (size!51347 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105306)

(declare-fun array_inv!39751 (array!105306) Bool)

(assert (=> start!135868 (array_inv!39751 _keys!591)))

(declare-fun b!1576519 () Bool)

(declare-fun res!1076237 () Bool)

(assert (=> b!1576519 (=> (not res!1076237) (not e!879329))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576519 (= res!1076237 (and (= (size!51347 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51347 _keys!591)) (bvslt i!537 (size!51347 _keys!591))))))

(declare-fun b!1576520 () Bool)

(declare-fun res!1076236 () Bool)

(assert (=> b!1576520 (=> (not res!1076236) (not e!879329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576520 (= res!1076236 (validKeyInArray!0 (select (arr!50796 _keys!591) i!537)))))

(declare-fun b!1576521 () Bool)

(assert (=> b!1576521 (= e!879329 (not true))))

(declare-datatypes ((SeekEntryResult!13591 0))(
  ( (MissingZero!13591 (index!56762 (_ BitVec 32))) (Found!13591 (index!56763 (_ BitVec 32))) (Intermediate!13591 (undefined!14403 Bool) (index!56764 (_ BitVec 32)) (x!141821 (_ BitVec 32))) (Undefined!13591) (MissingVacant!13591 (index!56765 (_ BitVec 32))) )
))
(declare-fun lt!675639 () SeekEntryResult!13591)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105306 (_ BitVec 32)) SeekEntryResult!13591)

(assert (=> b!1576521 (= lt!675639 (seekEntryOrOpen!0 (select (arr!50796 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576521 (arrayContainsKey!0 _keys!591 (select (arr!50796 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52057 0))(
  ( (Unit!52058) )
))
(declare-fun lt!675638 () Unit!52057)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105306 (_ BitVec 64) (_ BitVec 32)) Unit!52057)

(assert (=> b!1576521 (= lt!675638 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50796 _keys!591) i!537) i!537))))

(assert (= (and start!135868 res!1076235) b!1576519))

(assert (= (and b!1576519 res!1076237) b!1576520))

(assert (= (and b!1576520 res!1076236) b!1576521))

(declare-fun m!1449577 () Bool)

(assert (=> start!135868 m!1449577))

(declare-fun m!1449579 () Bool)

(assert (=> start!135868 m!1449579))

(declare-fun m!1449581 () Bool)

(assert (=> b!1576520 m!1449581))

(assert (=> b!1576520 m!1449581))

(declare-fun m!1449583 () Bool)

(assert (=> b!1576520 m!1449583))

(assert (=> b!1576521 m!1449581))

(assert (=> b!1576521 m!1449581))

(declare-fun m!1449585 () Bool)

(assert (=> b!1576521 m!1449585))

(assert (=> b!1576521 m!1449581))

(declare-fun m!1449587 () Bool)

(assert (=> b!1576521 m!1449587))

(assert (=> b!1576521 m!1449581))

(declare-fun m!1449589 () Bool)

(assert (=> b!1576521 m!1449589))

(push 1)

(assert (not b!1576520))

(assert (not b!1576521))

(assert (not start!135868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

