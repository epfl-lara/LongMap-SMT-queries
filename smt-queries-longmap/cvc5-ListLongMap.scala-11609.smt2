; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135418 () Bool)

(assert start!135418)

(declare-fun res!1075311 () Bool)

(declare-fun e!877666 () Bool)

(assert (=> start!135418 (=> (not res!1075311) (not e!877666))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135418 (= res!1075311 (validMask!0 mask!877))))

(assert (=> start!135418 e!877666))

(assert (=> start!135418 true))

(declare-datatypes ((array!105124 0))(
  ( (array!105125 (arr!50713 (Array (_ BitVec 32) (_ BitVec 64))) (size!51265 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105124)

(declare-fun array_inv!39649 (array!105124) Bool)

(assert (=> start!135418 (array_inv!39649 _keys!591)))

(declare-fun b!1573833 () Bool)

(declare-fun res!1075309 () Bool)

(assert (=> b!1573833 (=> (not res!1075309) (not e!877666))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573833 (= res!1075309 (and (= (size!51265 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51265 _keys!591)) (bvslt i!537 (size!51265 _keys!591))))))

(declare-fun b!1573834 () Bool)

(declare-fun res!1075310 () Bool)

(assert (=> b!1573834 (=> (not res!1075310) (not e!877666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573834 (= res!1075310 (validKeyInArray!0 (select (arr!50713 _keys!591) i!537)))))

(declare-fun b!1573835 () Bool)

(assert (=> b!1573835 (= e!877666 (not true))))

(declare-datatypes ((SeekEntryResult!13649 0))(
  ( (MissingZero!13649 (index!56994 (_ BitVec 32))) (Found!13649 (index!56995 (_ BitVec 32))) (Intermediate!13649 (undefined!14461 Bool) (index!56996 (_ BitVec 32)) (x!141839 (_ BitVec 32))) (Undefined!13649) (MissingVacant!13649 (index!56997 (_ BitVec 32))) )
))
(declare-fun lt!674472 () SeekEntryResult!13649)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105124 (_ BitVec 32)) SeekEntryResult!13649)

(assert (=> b!1573835 (= lt!674472 (seekEntryOrOpen!0 (select (arr!50713 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573835 (arrayContainsKey!0 _keys!591 (select (arr!50713 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51969 0))(
  ( (Unit!51970) )
))
(declare-fun lt!674471 () Unit!51969)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105124 (_ BitVec 64) (_ BitVec 32)) Unit!51969)

(assert (=> b!1573835 (= lt!674471 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50713 _keys!591) i!537) i!537))))

(assert (= (and start!135418 res!1075311) b!1573833))

(assert (= (and b!1573833 res!1075309) b!1573834))

(assert (= (and b!1573834 res!1075310) b!1573835))

(declare-fun m!1446511 () Bool)

(assert (=> start!135418 m!1446511))

(declare-fun m!1446513 () Bool)

(assert (=> start!135418 m!1446513))

(declare-fun m!1446515 () Bool)

(assert (=> b!1573834 m!1446515))

(assert (=> b!1573834 m!1446515))

(declare-fun m!1446517 () Bool)

(assert (=> b!1573834 m!1446517))

(assert (=> b!1573835 m!1446515))

(assert (=> b!1573835 m!1446515))

(declare-fun m!1446519 () Bool)

(assert (=> b!1573835 m!1446519))

(assert (=> b!1573835 m!1446515))

(declare-fun m!1446521 () Bool)

(assert (=> b!1573835 m!1446521))

(assert (=> b!1573835 m!1446515))

(declare-fun m!1446523 () Bool)

(assert (=> b!1573835 m!1446523))

(push 1)

(assert (not b!1573834))

(assert (not start!135418))

(assert (not b!1573835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

