; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135860 () Bool)

(assert start!135860)

(declare-fun res!1076200 () Bool)

(declare-fun e!879305 () Bool)

(assert (=> start!135860 (=> (not res!1076200) (not e!879305))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135860 (= res!1076200 (validMask!0 mask!877))))

(assert (=> start!135860 e!879305))

(assert (=> start!135860 true))

(declare-datatypes ((array!105298 0))(
  ( (array!105299 (arr!50792 (Array (_ BitVec 32) (_ BitVec 64))) (size!51343 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105298)

(declare-fun array_inv!39747 (array!105298) Bool)

(assert (=> start!135860 (array_inv!39747 _keys!591)))

(declare-fun b!1576483 () Bool)

(declare-fun res!1076201 () Bool)

(assert (=> b!1576483 (=> (not res!1076201) (not e!879305))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576483 (= res!1076201 (and (= (size!51343 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51343 _keys!591)) (bvslt i!537 (size!51343 _keys!591))))))

(declare-fun b!1576484 () Bool)

(declare-fun res!1076199 () Bool)

(assert (=> b!1576484 (=> (not res!1076199) (not e!879305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576484 (= res!1076199 (validKeyInArray!0 (select (arr!50792 _keys!591) i!537)))))

(declare-fun b!1576485 () Bool)

(assert (=> b!1576485 (= e!879305 (not true))))

(declare-datatypes ((SeekEntryResult!13587 0))(
  ( (MissingZero!13587 (index!56746 (_ BitVec 32))) (Found!13587 (index!56747 (_ BitVec 32))) (Intermediate!13587 (undefined!14399 Bool) (index!56748 (_ BitVec 32)) (x!141809 (_ BitVec 32))) (Undefined!13587) (MissingVacant!13587 (index!56749 (_ BitVec 32))) )
))
(declare-fun lt!675614 () SeekEntryResult!13587)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105298 (_ BitVec 32)) SeekEntryResult!13587)

(assert (=> b!1576485 (= lt!675614 (seekEntryOrOpen!0 (select (arr!50792 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576485 (arrayContainsKey!0 _keys!591 (select (arr!50792 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52049 0))(
  ( (Unit!52050) )
))
(declare-fun lt!675615 () Unit!52049)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105298 (_ BitVec 64) (_ BitVec 32)) Unit!52049)

(assert (=> b!1576485 (= lt!675615 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50792 _keys!591) i!537) i!537))))

(assert (= (and start!135860 res!1076200) b!1576483))

(assert (= (and b!1576483 res!1076201) b!1576484))

(assert (= (and b!1576484 res!1076199) b!1576485))

(declare-fun m!1449521 () Bool)

(assert (=> start!135860 m!1449521))

(declare-fun m!1449523 () Bool)

(assert (=> start!135860 m!1449523))

(declare-fun m!1449525 () Bool)

(assert (=> b!1576484 m!1449525))

(assert (=> b!1576484 m!1449525))

(declare-fun m!1449527 () Bool)

(assert (=> b!1576484 m!1449527))

(assert (=> b!1576485 m!1449525))

(assert (=> b!1576485 m!1449525))

(declare-fun m!1449529 () Bool)

(assert (=> b!1576485 m!1449529))

(assert (=> b!1576485 m!1449525))

(declare-fun m!1449531 () Bool)

(assert (=> b!1576485 m!1449531))

(assert (=> b!1576485 m!1449525))

(declare-fun m!1449533 () Bool)

(assert (=> b!1576485 m!1449533))

(push 1)

(assert (not b!1576484))

(assert (not b!1576485))

(assert (not start!135860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

