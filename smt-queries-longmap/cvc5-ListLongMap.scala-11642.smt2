; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135848 () Bool)

(assert start!135848)

(declare-fun res!1076389 () Bool)

(declare-fun e!878513 () Bool)

(assert (=> start!135848 (=> (not res!1076389) (not e!878513))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135848 (= res!1076389 (validMask!0 mask!898))))

(assert (=> start!135848 e!878513))

(assert (=> start!135848 true))

(declare-datatypes ((array!105348 0))(
  ( (array!105349 (arr!50812 (Array (_ BitVec 32) (_ BitVec 64))) (size!51364 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105348)

(declare-fun array_inv!39748 (array!105348) Bool)

(assert (=> start!135848 (array_inv!39748 _keys!605)))

(declare-fun b!1575165 () Bool)

(declare-fun res!1076391 () Bool)

(assert (=> b!1575165 (=> (not res!1076391) (not e!878513))))

(assert (=> b!1575165 (= res!1076391 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51364 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575166 () Bool)

(declare-fun res!1076390 () Bool)

(assert (=> b!1575166 (=> (not res!1076390) (not e!878513))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575166 (= res!1076390 (validKeyInArray!0 k!761))))

(declare-fun b!1575167 () Bool)

(assert (=> b!1575167 (= e!878513 false)))

(declare-datatypes ((SeekEntryResult!13712 0))(
  ( (MissingZero!13712 (index!57246 (_ BitVec 32))) (Found!13712 (index!57247 (_ BitVec 32))) (Intermediate!13712 (undefined!14524 Bool) (index!57248 (_ BitVec 32)) (x!142199 (_ BitVec 32))) (Undefined!13712) (MissingVacant!13712 (index!57249 (_ BitVec 32))) )
))
(declare-fun lt!674922 () SeekEntryResult!13712)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105348 (_ BitVec 32)) SeekEntryResult!13712)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575167 (= lt!674922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135848 res!1076389) b!1575165))

(assert (= (and b!1575165 res!1076391) b!1575166))

(assert (= (and b!1575166 res!1076390) b!1575167))

(declare-fun m!1447607 () Bool)

(assert (=> start!135848 m!1447607))

(declare-fun m!1447609 () Bool)

(assert (=> start!135848 m!1447609))

(declare-fun m!1447611 () Bool)

(assert (=> b!1575166 m!1447611))

(declare-fun m!1447613 () Bool)

(assert (=> b!1575167 m!1447613))

(assert (=> b!1575167 m!1447613))

(declare-fun m!1447615 () Bool)

(assert (=> b!1575167 m!1447615))

(push 1)

(assert (not b!1575166))

(assert (not start!135848))

(assert (not b!1575167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

