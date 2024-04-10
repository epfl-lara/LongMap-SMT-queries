; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135874 () Bool)

(assert start!135874)

(declare-fun res!1076465 () Bool)

(declare-fun e!878675 () Bool)

(assert (=> start!135874 (=> (not res!1076465) (not e!878675))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135874 (= res!1076465 (validMask!0 mask!898))))

(assert (=> start!135874 e!878675))

(assert (=> start!135874 true))

(declare-datatypes ((array!105406 0))(
  ( (array!105407 (arr!50841 (Array (_ BitVec 32) (_ BitVec 64))) (size!51391 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105406)

(declare-fun array_inv!39568 (array!105406) Bool)

(assert (=> start!135874 (array_inv!39568 _keys!605)))

(declare-fun b!1575424 () Bool)

(declare-fun res!1076464 () Bool)

(assert (=> b!1575424 (=> (not res!1076464) (not e!878675))))

(assert (=> b!1575424 (= res!1076464 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51391 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575425 () Bool)

(declare-fun res!1076466 () Bool)

(assert (=> b!1575425 (=> (not res!1076466) (not e!878675))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575425 (= res!1076466 (validKeyInArray!0 k!761))))

(declare-fun b!1575426 () Bool)

(assert (=> b!1575426 (= e!878675 false)))

(declare-datatypes ((SeekEntryResult!13706 0))(
  ( (MissingZero!13706 (index!57222 (_ BitVec 32))) (Found!13706 (index!57223 (_ BitVec 32))) (Intermediate!13706 (undefined!14518 Bool) (index!57224 (_ BitVec 32)) (x!142182 (_ BitVec 32))) (Undefined!13706) (MissingVacant!13706 (index!57225 (_ BitVec 32))) )
))
(declare-fun lt!675190 () SeekEntryResult!13706)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105406 (_ BitVec 32)) SeekEntryResult!13706)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575426 (= lt!675190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135874 res!1076465) b!1575424))

(assert (= (and b!1575424 res!1076464) b!1575425))

(assert (= (and b!1575425 res!1076466) b!1575426))

(declare-fun m!1448439 () Bool)

(assert (=> start!135874 m!1448439))

(declare-fun m!1448441 () Bool)

(assert (=> start!135874 m!1448441))

(declare-fun m!1448443 () Bool)

(assert (=> b!1575425 m!1448443))

(declare-fun m!1448445 () Bool)

(assert (=> b!1575426 m!1448445))

(assert (=> b!1575426 m!1448445))

(declare-fun m!1448447 () Bool)

(assert (=> b!1575426 m!1448447))

(push 1)

(assert (not b!1575425))

(assert (not start!135874))

(assert (not b!1575426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

