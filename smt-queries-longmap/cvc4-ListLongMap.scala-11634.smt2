; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135778 () Bool)

(assert start!135778)

(declare-fun res!1076244 () Bool)

(declare-fun e!878476 () Bool)

(assert (=> start!135778 (=> (not res!1076244) (not e!878476))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135778 (= res!1076244 (validMask!0 mask!898))))

(assert (=> start!135778 e!878476))

(assert (=> start!135778 true))

(declare-datatypes ((array!105364 0))(
  ( (array!105365 (arr!50823 (Array (_ BitVec 32) (_ BitVec 64))) (size!51373 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105364)

(declare-fun array_inv!39550 (array!105364) Bool)

(assert (=> start!135778 (array_inv!39550 _keys!605)))

(declare-fun b!1575100 () Bool)

(declare-fun res!1076243 () Bool)

(assert (=> b!1575100 (=> (not res!1076243) (not e!878476))))

(assert (=> b!1575100 (= res!1076243 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51373 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575101 () Bool)

(declare-fun res!1076242 () Bool)

(assert (=> b!1575101 (=> (not res!1076242) (not e!878476))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575101 (= res!1076242 (validKeyInArray!0 k!761))))

(declare-fun b!1575102 () Bool)

(assert (=> b!1575102 (= e!878476 false)))

(declare-datatypes ((SeekEntryResult!13688 0))(
  ( (MissingZero!13688 (index!57150 (_ BitVec 32))) (Found!13688 (index!57151 (_ BitVec 32))) (Intermediate!13688 (undefined!14500 Bool) (index!57152 (_ BitVec 32)) (x!142104 (_ BitVec 32))) (Undefined!13688) (MissingVacant!13688 (index!57153 (_ BitVec 32))) )
))
(declare-fun lt!675064 () SeekEntryResult!13688)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105364 (_ BitVec 32)) SeekEntryResult!13688)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575102 (= lt!675064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135778 res!1076244) b!1575100))

(assert (= (and b!1575100 res!1076243) b!1575101))

(assert (= (and b!1575101 res!1076242) b!1575102))

(declare-fun m!1448205 () Bool)

(assert (=> start!135778 m!1448205))

(declare-fun m!1448207 () Bool)

(assert (=> start!135778 m!1448207))

(declare-fun m!1448209 () Bool)

(assert (=> b!1575101 m!1448209))

(declare-fun m!1448211 () Bool)

(assert (=> b!1575102 m!1448211))

(assert (=> b!1575102 m!1448211))

(declare-fun m!1448213 () Bool)

(assert (=> b!1575102 m!1448213))

(push 1)

(assert (not start!135778))

(assert (not b!1575102))

(assert (not b!1575101))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

