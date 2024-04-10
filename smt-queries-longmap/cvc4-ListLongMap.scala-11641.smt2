; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135880 () Bool)

(assert start!135880)

(declare-fun res!1076492 () Bool)

(declare-fun e!878692 () Bool)

(assert (=> start!135880 (=> (not res!1076492) (not e!878692))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135880 (= res!1076492 (validMask!0 mask!898))))

(assert (=> start!135880 e!878692))

(assert (=> start!135880 true))

(declare-datatypes ((array!105412 0))(
  ( (array!105413 (arr!50844 (Array (_ BitVec 32) (_ BitVec 64))) (size!51394 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105412)

(declare-fun array_inv!39571 (array!105412) Bool)

(assert (=> start!135880 (array_inv!39571 _keys!605)))

(declare-fun b!1575451 () Bool)

(declare-fun res!1076493 () Bool)

(assert (=> b!1575451 (=> (not res!1076493) (not e!878692))))

(assert (=> b!1575451 (= res!1076493 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51394 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575452 () Bool)

(declare-fun res!1076491 () Bool)

(assert (=> b!1575452 (=> (not res!1076491) (not e!878692))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575452 (= res!1076491 (validKeyInArray!0 k!761))))

(declare-fun b!1575453 () Bool)

(assert (=> b!1575453 (= e!878692 false)))

(declare-datatypes ((SeekEntryResult!13709 0))(
  ( (MissingZero!13709 (index!57234 (_ BitVec 32))) (Found!13709 (index!57235 (_ BitVec 32))) (Intermediate!13709 (undefined!14521 Bool) (index!57236 (_ BitVec 32)) (x!142193 (_ BitVec 32))) (Undefined!13709) (MissingVacant!13709 (index!57237 (_ BitVec 32))) )
))
(declare-fun lt!675199 () SeekEntryResult!13709)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105412 (_ BitVec 32)) SeekEntryResult!13709)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575453 (= lt!675199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135880 res!1076492) b!1575451))

(assert (= (and b!1575451 res!1076493) b!1575452))

(assert (= (and b!1575452 res!1076491) b!1575453))

(declare-fun m!1448469 () Bool)

(assert (=> start!135880 m!1448469))

(declare-fun m!1448471 () Bool)

(assert (=> start!135880 m!1448471))

(declare-fun m!1448473 () Bool)

(assert (=> b!1575452 m!1448473))

(declare-fun m!1448475 () Bool)

(assert (=> b!1575453 m!1448475))

(assert (=> b!1575453 m!1448475))

(declare-fun m!1448477 () Bool)

(assert (=> b!1575453 m!1448477))

(push 1)

(assert (not b!1575452))

(assert (not b!1575453))

(assert (not start!135880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

