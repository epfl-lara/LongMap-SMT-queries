; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135926 () Bool)

(assert start!135926)

(declare-fun res!1076594 () Bool)

(declare-fun e!878786 () Bool)

(assert (=> start!135926 (=> (not res!1076594) (not e!878786))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135926 (= res!1076594 (validMask!0 mask!898))))

(assert (=> start!135926 e!878786))

(assert (=> start!135926 true))

(declare-datatypes ((array!105431 0))(
  ( (array!105432 (arr!50852 (Array (_ BitVec 32) (_ BitVec 64))) (size!51402 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105431)

(declare-fun array_inv!39579 (array!105431) Bool)

(assert (=> start!135926 (array_inv!39579 _keys!605)))

(declare-fun b!1575604 () Bool)

(declare-fun res!1076595 () Bool)

(assert (=> b!1575604 (=> (not res!1076595) (not e!878786))))

(assert (=> b!1575604 (= res!1076595 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51402 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575605 () Bool)

(declare-fun res!1076593 () Bool)

(assert (=> b!1575605 (=> (not res!1076593) (not e!878786))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575605 (= res!1076593 (validKeyInArray!0 k0!761))))

(declare-fun b!1575606 () Bool)

(assert (=> b!1575606 (= e!878786 false)))

(declare-datatypes ((SeekEntryResult!13717 0))(
  ( (MissingZero!13717 (index!57266 (_ BitVec 32))) (Found!13717 (index!57267 (_ BitVec 32))) (Intermediate!13717 (undefined!14529 Bool) (index!57268 (_ BitVec 32)) (x!142231 (_ BitVec 32))) (Undefined!13717) (MissingVacant!13717 (index!57269 (_ BitVec 32))) )
))
(declare-fun lt!675259 () SeekEntryResult!13717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105431 (_ BitVec 32)) SeekEntryResult!13717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575606 (= lt!675259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135926 res!1076594) b!1575604))

(assert (= (and b!1575604 res!1076595) b!1575605))

(assert (= (and b!1575605 res!1076593) b!1575606))

(declare-fun m!1448579 () Bool)

(assert (=> start!135926 m!1448579))

(declare-fun m!1448581 () Bool)

(assert (=> start!135926 m!1448581))

(declare-fun m!1448583 () Bool)

(assert (=> b!1575605 m!1448583))

(declare-fun m!1448585 () Bool)

(assert (=> b!1575606 m!1448585))

(assert (=> b!1575606 m!1448585))

(declare-fun m!1448587 () Bool)

(assert (=> b!1575606 m!1448587))

(check-sat (not start!135926) (not b!1575605) (not b!1575606))
(check-sat)
