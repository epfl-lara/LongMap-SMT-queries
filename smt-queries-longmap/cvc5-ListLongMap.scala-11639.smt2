; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135864 () Bool)

(assert start!135864)

(declare-fun res!1076419 () Bool)

(declare-fun e!878645 () Bool)

(assert (=> start!135864 (=> (not res!1076419) (not e!878645))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135864 (= res!1076419 (validMask!0 mask!898))))

(assert (=> start!135864 e!878645))

(assert (=> start!135864 true))

(declare-datatypes ((array!105396 0))(
  ( (array!105397 (arr!50836 (Array (_ BitVec 32) (_ BitVec 64))) (size!51386 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105396)

(declare-fun array_inv!39563 (array!105396) Bool)

(assert (=> start!135864 (array_inv!39563 _keys!605)))

(declare-fun b!1575379 () Bool)

(declare-fun res!1076421 () Bool)

(assert (=> b!1575379 (=> (not res!1076421) (not e!878645))))

(assert (=> b!1575379 (= res!1076421 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51386 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575380 () Bool)

(declare-fun res!1076420 () Bool)

(assert (=> b!1575380 (=> (not res!1076420) (not e!878645))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575380 (= res!1076420 (validKeyInArray!0 k!761))))

(declare-fun b!1575381 () Bool)

(assert (=> b!1575381 (= e!878645 false)))

(declare-datatypes ((SeekEntryResult!13701 0))(
  ( (MissingZero!13701 (index!57202 (_ BitVec 32))) (Found!13701 (index!57203 (_ BitVec 32))) (Intermediate!13701 (undefined!14513 Bool) (index!57204 (_ BitVec 32)) (x!142169 (_ BitVec 32))) (Undefined!13701) (MissingVacant!13701 (index!57205 (_ BitVec 32))) )
))
(declare-fun lt!675175 () SeekEntryResult!13701)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105396 (_ BitVec 32)) SeekEntryResult!13701)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575381 (= lt!675175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135864 res!1076419) b!1575379))

(assert (= (and b!1575379 res!1076421) b!1575380))

(assert (= (and b!1575380 res!1076420) b!1575381))

(declare-fun m!1448389 () Bool)

(assert (=> start!135864 m!1448389))

(declare-fun m!1448391 () Bool)

(assert (=> start!135864 m!1448391))

(declare-fun m!1448393 () Bool)

(assert (=> b!1575380 m!1448393))

(declare-fun m!1448395 () Bool)

(assert (=> b!1575381 m!1448395))

(assert (=> b!1575381 m!1448395))

(declare-fun m!1448397 () Bool)

(assert (=> b!1575381 m!1448397))

(push 1)

(assert (not b!1575381))

(assert (not b!1575380))

(assert (not start!135864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

