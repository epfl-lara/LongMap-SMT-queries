; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135836 () Bool)

(assert start!135836)

(declare-fun res!1076337 () Bool)

(declare-fun e!878476 () Bool)

(assert (=> start!135836 (=> (not res!1076337) (not e!878476))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135836 (= res!1076337 (validMask!0 mask!898))))

(assert (=> start!135836 e!878476))

(assert (=> start!135836 true))

(declare-datatypes ((array!105336 0))(
  ( (array!105337 (arr!50806 (Array (_ BitVec 32) (_ BitVec 64))) (size!51358 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105336)

(declare-fun array_inv!39742 (array!105336) Bool)

(assert (=> start!135836 (array_inv!39742 _keys!605)))

(declare-fun b!1575111 () Bool)

(declare-fun res!1076335 () Bool)

(assert (=> b!1575111 (=> (not res!1076335) (not e!878476))))

(assert (=> b!1575111 (= res!1076335 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51358 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575112 () Bool)

(declare-fun res!1076336 () Bool)

(assert (=> b!1575112 (=> (not res!1076336) (not e!878476))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575112 (= res!1076336 (validKeyInArray!0 k!761))))

(declare-fun b!1575113 () Bool)

(assert (=> b!1575113 (= e!878476 false)))

(declare-datatypes ((SeekEntryResult!13706 0))(
  ( (MissingZero!13706 (index!57222 (_ BitVec 32))) (Found!13706 (index!57223 (_ BitVec 32))) (Intermediate!13706 (undefined!14518 Bool) (index!57224 (_ BitVec 32)) (x!142177 (_ BitVec 32))) (Undefined!13706) (MissingVacant!13706 (index!57225 (_ BitVec 32))) )
))
(declare-fun lt!674904 () SeekEntryResult!13706)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105336 (_ BitVec 32)) SeekEntryResult!13706)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575113 (= lt!674904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135836 res!1076337) b!1575111))

(assert (= (and b!1575111 res!1076335) b!1575112))

(assert (= (and b!1575112 res!1076336) b!1575113))

(declare-fun m!1447547 () Bool)

(assert (=> start!135836 m!1447547))

(declare-fun m!1447549 () Bool)

(assert (=> start!135836 m!1447549))

(declare-fun m!1447551 () Bool)

(assert (=> b!1575112 m!1447551))

(declare-fun m!1447553 () Bool)

(assert (=> b!1575113 m!1447553))

(assert (=> b!1575113 m!1447553))

(declare-fun m!1447555 () Bool)

(assert (=> b!1575113 m!1447555))

(push 1)

(assert (not b!1575112))

(assert (not b!1575113))

(assert (not start!135836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

