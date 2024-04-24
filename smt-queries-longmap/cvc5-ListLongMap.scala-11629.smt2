; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136112 () Bool)

(assert start!136112)

(declare-fun res!1076907 () Bool)

(declare-fun e!879805 () Bool)

(assert (=> start!136112 (=> (not res!1076907) (not e!879805))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136112 (= res!1076907 (validMask!0 mask!898))))

(assert (=> start!136112 e!879805))

(assert (=> start!136112 true))

(declare-datatypes ((array!105453 0))(
  ( (array!105454 (arr!50862 (Array (_ BitVec 32) (_ BitVec 64))) (size!51413 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105453)

(declare-fun array_inv!39817 (array!105453) Bool)

(assert (=> start!136112 (array_inv!39817 _keys!605)))

(declare-fun b!1577239 () Bool)

(declare-fun res!1076908 () Bool)

(assert (=> b!1577239 (=> (not res!1076908) (not e!879805))))

(assert (=> b!1577239 (= res!1076908 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51413 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577240 () Bool)

(declare-fun res!1076909 () Bool)

(assert (=> b!1577240 (=> (not res!1076909) (not e!879805))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577240 (= res!1076909 (validKeyInArray!0 k!761))))

(declare-fun b!1577241 () Bool)

(assert (=> b!1577241 (= e!879805 false)))

(declare-datatypes ((SeekEntryResult!13621 0))(
  ( (MissingZero!13621 (index!56882 (_ BitVec 32))) (Found!13621 (index!56883 (_ BitVec 32))) (Intermediate!13621 (undefined!14433 Bool) (index!56884 (_ BitVec 32)) (x!142036 (_ BitVec 32))) (Undefined!13621) (MissingVacant!13621 (index!56885 (_ BitVec 32))) )
))
(declare-fun lt!675855 () SeekEntryResult!13621)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105453 (_ BitVec 32)) SeekEntryResult!13621)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577241 (= lt!675855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136112 res!1076907) b!1577239))

(assert (= (and b!1577239 res!1076908) b!1577240))

(assert (= (and b!1577240 res!1076909) b!1577241))

(declare-fun m!1450253 () Bool)

(assert (=> start!136112 m!1450253))

(declare-fun m!1450255 () Bool)

(assert (=> start!136112 m!1450255))

(declare-fun m!1450257 () Bool)

(assert (=> b!1577240 m!1450257))

(declare-fun m!1450259 () Bool)

(assert (=> b!1577241 m!1450259))

(assert (=> b!1577241 m!1450259))

(declare-fun m!1450261 () Bool)

(assert (=> b!1577241 m!1450261))

(push 1)

(assert (not start!136112))

(assert (not b!1577240))

(assert (not b!1577241))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

