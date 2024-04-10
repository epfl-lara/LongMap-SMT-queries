; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135870 () Bool)

(assert start!135870)

(declare-fun res!1076447 () Bool)

(declare-fun e!878662 () Bool)

(assert (=> start!135870 (=> (not res!1076447) (not e!878662))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135870 (= res!1076447 (validMask!0 mask!898))))

(assert (=> start!135870 e!878662))

(assert (=> start!135870 true))

(declare-datatypes ((array!105402 0))(
  ( (array!105403 (arr!50839 (Array (_ BitVec 32) (_ BitVec 64))) (size!51389 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105402)

(declare-fun array_inv!39566 (array!105402) Bool)

(assert (=> start!135870 (array_inv!39566 _keys!605)))

(declare-fun b!1575406 () Bool)

(declare-fun res!1076446 () Bool)

(assert (=> b!1575406 (=> (not res!1076446) (not e!878662))))

(assert (=> b!1575406 (= res!1076446 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51389 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575407 () Bool)

(declare-fun res!1076448 () Bool)

(assert (=> b!1575407 (=> (not res!1076448) (not e!878662))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575407 (= res!1076448 (validKeyInArray!0 k!761))))

(declare-fun b!1575408 () Bool)

(assert (=> b!1575408 (= e!878662 false)))

(declare-datatypes ((SeekEntryResult!13704 0))(
  ( (MissingZero!13704 (index!57214 (_ BitVec 32))) (Found!13704 (index!57215 (_ BitVec 32))) (Intermediate!13704 (undefined!14516 Bool) (index!57216 (_ BitVec 32)) (x!142180 (_ BitVec 32))) (Undefined!13704) (MissingVacant!13704 (index!57217 (_ BitVec 32))) )
))
(declare-fun lt!675184 () SeekEntryResult!13704)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105402 (_ BitVec 32)) SeekEntryResult!13704)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575408 (= lt!675184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135870 res!1076447) b!1575406))

(assert (= (and b!1575406 res!1076446) b!1575407))

(assert (= (and b!1575407 res!1076448) b!1575408))

(declare-fun m!1448419 () Bool)

(assert (=> start!135870 m!1448419))

(declare-fun m!1448421 () Bool)

(assert (=> start!135870 m!1448421))

(declare-fun m!1448423 () Bool)

(assert (=> b!1575407 m!1448423))

(declare-fun m!1448425 () Bool)

(assert (=> b!1575408 m!1448425))

(assert (=> b!1575408 m!1448425))

(declare-fun m!1448427 () Bool)

(assert (=> b!1575408 m!1448427))

(push 1)

(assert (not b!1575407))

(assert (not start!135870))

(assert (not b!1575408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

