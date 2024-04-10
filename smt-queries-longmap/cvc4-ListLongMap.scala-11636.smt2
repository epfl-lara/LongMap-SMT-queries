; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135790 () Bool)

(assert start!135790)

(declare-fun res!1076297 () Bool)

(declare-fun e!878513 () Bool)

(assert (=> start!135790 (=> (not res!1076297) (not e!878513))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135790 (= res!1076297 (validMask!0 mask!898))))

(assert (=> start!135790 e!878513))

(assert (=> start!135790 true))

(declare-datatypes ((array!105376 0))(
  ( (array!105377 (arr!50829 (Array (_ BitVec 32) (_ BitVec 64))) (size!51379 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105376)

(declare-fun array_inv!39556 (array!105376) Bool)

(assert (=> start!135790 (array_inv!39556 _keys!605)))

(declare-fun b!1575154 () Bool)

(declare-fun res!1076298 () Bool)

(assert (=> b!1575154 (=> (not res!1076298) (not e!878513))))

(assert (=> b!1575154 (= res!1076298 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51379 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575155 () Bool)

(declare-fun res!1076296 () Bool)

(assert (=> b!1575155 (=> (not res!1076296) (not e!878513))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575155 (= res!1076296 (validKeyInArray!0 k!761))))

(declare-fun b!1575156 () Bool)

(assert (=> b!1575156 (= e!878513 false)))

(declare-datatypes ((SeekEntryResult!13694 0))(
  ( (MissingZero!13694 (index!57174 (_ BitVec 32))) (Found!13694 (index!57175 (_ BitVec 32))) (Intermediate!13694 (undefined!14506 Bool) (index!57176 (_ BitVec 32)) (x!142126 (_ BitVec 32))) (Undefined!13694) (MissingVacant!13694 (index!57177 (_ BitVec 32))) )
))
(declare-fun lt!675082 () SeekEntryResult!13694)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105376 (_ BitVec 32)) SeekEntryResult!13694)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575156 (= lt!675082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135790 res!1076297) b!1575154))

(assert (= (and b!1575154 res!1076298) b!1575155))

(assert (= (and b!1575155 res!1076296) b!1575156))

(declare-fun m!1448265 () Bool)

(assert (=> start!135790 m!1448265))

(declare-fun m!1448267 () Bool)

(assert (=> start!135790 m!1448267))

(declare-fun m!1448269 () Bool)

(assert (=> b!1575155 m!1448269))

(declare-fun m!1448271 () Bool)

(assert (=> b!1575156 m!1448271))

(assert (=> b!1575156 m!1448271))

(declare-fun m!1448273 () Bool)

(assert (=> b!1575156 m!1448273))

(push 1)

(assert (not b!1575156))

(assert (not start!135790))

(assert (not b!1575155))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

