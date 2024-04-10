; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135886 () Bool)

(assert start!135886)

(declare-fun res!1076520 () Bool)

(declare-fun e!878711 () Bool)

(assert (=> start!135886 (=> (not res!1076520) (not e!878711))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135886 (= res!1076520 (validMask!0 mask!898))))

(assert (=> start!135886 e!878711))

(assert (=> start!135886 true))

(declare-datatypes ((array!105418 0))(
  ( (array!105419 (arr!50847 (Array (_ BitVec 32) (_ BitVec 64))) (size!51397 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105418)

(declare-fun array_inv!39574 (array!105418) Bool)

(assert (=> start!135886 (array_inv!39574 _keys!605)))

(declare-fun b!1575478 () Bool)

(declare-fun res!1076518 () Bool)

(assert (=> b!1575478 (=> (not res!1076518) (not e!878711))))

(assert (=> b!1575478 (= res!1076518 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51397 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575479 () Bool)

(declare-fun res!1076519 () Bool)

(assert (=> b!1575479 (=> (not res!1076519) (not e!878711))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575479 (= res!1076519 (validKeyInArray!0 k!761))))

(declare-fun b!1575480 () Bool)

(assert (=> b!1575480 (= e!878711 false)))

(declare-datatypes ((SeekEntryResult!13712 0))(
  ( (MissingZero!13712 (index!57246 (_ BitVec 32))) (Found!13712 (index!57247 (_ BitVec 32))) (Intermediate!13712 (undefined!14524 Bool) (index!57248 (_ BitVec 32)) (x!142204 (_ BitVec 32))) (Undefined!13712) (MissingVacant!13712 (index!57249 (_ BitVec 32))) )
))
(declare-fun lt!675208 () SeekEntryResult!13712)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105418 (_ BitVec 32)) SeekEntryResult!13712)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575480 (= lt!675208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135886 res!1076520) b!1575478))

(assert (= (and b!1575478 res!1076518) b!1575479))

(assert (= (and b!1575479 res!1076519) b!1575480))

(declare-fun m!1448499 () Bool)

(assert (=> start!135886 m!1448499))

(declare-fun m!1448501 () Bool)

(assert (=> start!135886 m!1448501))

(declare-fun m!1448503 () Bool)

(assert (=> b!1575479 m!1448503))

(declare-fun m!1448505 () Bool)

(assert (=> b!1575480 m!1448505))

(assert (=> b!1575480 m!1448505))

(declare-fun m!1448507 () Bool)

(assert (=> b!1575480 m!1448507))

(push 1)

(assert (not b!1575480))

