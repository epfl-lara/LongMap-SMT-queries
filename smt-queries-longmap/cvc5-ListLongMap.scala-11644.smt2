; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135924 () Bool)

(assert start!135924)

(declare-fun res!1076585 () Bool)

(declare-fun e!878780 () Bool)

(assert (=> start!135924 (=> (not res!1076585) (not e!878780))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135924 (= res!1076585 (validMask!0 mask!898))))

(assert (=> start!135924 e!878780))

(assert (=> start!135924 true))

(declare-datatypes ((array!105429 0))(
  ( (array!105430 (arr!50851 (Array (_ BitVec 32) (_ BitVec 64))) (size!51401 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105429)

(declare-fun array_inv!39578 (array!105429) Bool)

(assert (=> start!135924 (array_inv!39578 _keys!605)))

(declare-fun b!1575595 () Bool)

(declare-fun res!1076584 () Bool)

(assert (=> b!1575595 (=> (not res!1076584) (not e!878780))))

(assert (=> b!1575595 (= res!1076584 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51401 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575596 () Bool)

(declare-fun res!1076586 () Bool)

(assert (=> b!1575596 (=> (not res!1076586) (not e!878780))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575596 (= res!1076586 (validKeyInArray!0 k!761))))

(declare-fun b!1575597 () Bool)

(assert (=> b!1575597 (= e!878780 false)))

(declare-datatypes ((SeekEntryResult!13716 0))(
  ( (MissingZero!13716 (index!57262 (_ BitVec 32))) (Found!13716 (index!57263 (_ BitVec 32))) (Intermediate!13716 (undefined!14528 Bool) (index!57264 (_ BitVec 32)) (x!142230 (_ BitVec 32))) (Undefined!13716) (MissingVacant!13716 (index!57265 (_ BitVec 32))) )
))
(declare-fun lt!675256 () SeekEntryResult!13716)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105429 (_ BitVec 32)) SeekEntryResult!13716)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575597 (= lt!675256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135924 res!1076585) b!1575595))

(assert (= (and b!1575595 res!1076584) b!1575596))

(assert (= (and b!1575596 res!1076586) b!1575597))

(declare-fun m!1448569 () Bool)

(assert (=> start!135924 m!1448569))

(declare-fun m!1448571 () Bool)

(assert (=> start!135924 m!1448571))

(declare-fun m!1448573 () Bool)

(assert (=> b!1575596 m!1448573))

(declare-fun m!1448575 () Bool)

(assert (=> b!1575597 m!1448575))

(assert (=> b!1575597 m!1448575))

(declare-fun m!1448577 () Bool)

(assert (=> b!1575597 m!1448577))

(push 1)

(assert (not b!1575597))

(assert (not start!135924))

(assert (not b!1575596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

