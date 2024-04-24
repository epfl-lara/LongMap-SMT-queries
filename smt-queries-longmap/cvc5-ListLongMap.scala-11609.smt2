; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135880 () Bool)

(assert start!135880)

(declare-fun res!1076298 () Bool)

(declare-fun e!879373 () Bool)

(assert (=> start!135880 (=> (not res!1076298) (not e!879373))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135880 (= res!1076298 (validMask!0 mask!877))))

(assert (=> start!135880 e!879373))

(assert (=> start!135880 true))

(declare-datatypes ((array!105318 0))(
  ( (array!105319 (arr!50802 (Array (_ BitVec 32) (_ BitVec 64))) (size!51353 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105318)

(declare-fun array_inv!39757 (array!105318) Bool)

(assert (=> start!135880 (array_inv!39757 _keys!591)))

(declare-fun b!1576582 () Bool)

(declare-fun res!1076299 () Bool)

(assert (=> b!1576582 (=> (not res!1076299) (not e!879373))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576582 (= res!1076299 (and (= (size!51353 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51353 _keys!591)) (bvslt i!537 (size!51353 _keys!591))))))

(declare-fun b!1576583 () Bool)

(declare-fun res!1076300 () Bool)

(assert (=> b!1576583 (=> (not res!1076300) (not e!879373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576583 (= res!1076300 (validKeyInArray!0 (select (arr!50802 _keys!591) i!537)))))

(declare-fun b!1576584 () Bool)

(assert (=> b!1576584 (= e!879373 (not true))))

(declare-datatypes ((SeekEntryResult!13597 0))(
  ( (MissingZero!13597 (index!56786 (_ BitVec 32))) (Found!13597 (index!56787 (_ BitVec 32))) (Intermediate!13597 (undefined!14409 Bool) (index!56788 (_ BitVec 32)) (x!141843 (_ BitVec 32))) (Undefined!13597) (MissingVacant!13597 (index!56789 (_ BitVec 32))) )
))
(declare-fun lt!675665 () SeekEntryResult!13597)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105318 (_ BitVec 32)) SeekEntryResult!13597)

(assert (=> b!1576584 (= lt!675665 (seekEntryOrOpen!0 (select (arr!50802 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576584 (arrayContainsKey!0 _keys!591 (select (arr!50802 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52069 0))(
  ( (Unit!52070) )
))
(declare-fun lt!675666 () Unit!52069)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105318 (_ BitVec 64) (_ BitVec 32)) Unit!52069)

(assert (=> b!1576584 (= lt!675666 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50802 _keys!591) i!537) i!537))))

(assert (= (and start!135880 res!1076298) b!1576582))

(assert (= (and b!1576582 res!1076299) b!1576583))

(assert (= (and b!1576583 res!1076300) b!1576584))

(declare-fun m!1449661 () Bool)

(assert (=> start!135880 m!1449661))

(declare-fun m!1449663 () Bool)

(assert (=> start!135880 m!1449663))

(declare-fun m!1449665 () Bool)

(assert (=> b!1576583 m!1449665))

(assert (=> b!1576583 m!1449665))

(declare-fun m!1449667 () Bool)

(assert (=> b!1576583 m!1449667))

(assert (=> b!1576584 m!1449665))

(assert (=> b!1576584 m!1449665))

(declare-fun m!1449669 () Bool)

(assert (=> b!1576584 m!1449669))

(assert (=> b!1576584 m!1449665))

(declare-fun m!1449671 () Bool)

(assert (=> b!1576584 m!1449671))

(assert (=> b!1576584 m!1449665))

(declare-fun m!1449673 () Bool)

(assert (=> b!1576584 m!1449673))

(push 1)

(assert (not start!135880))

(assert (not b!1576584))

(assert (not b!1576583))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

