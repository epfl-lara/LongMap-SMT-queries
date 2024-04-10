; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135770 () Bool)

(assert start!135770)

(declare-fun res!1076207 () Bool)

(declare-fun e!878452 () Bool)

(assert (=> start!135770 (=> (not res!1076207) (not e!878452))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135770 (= res!1076207 (validMask!0 mask!898))))

(assert (=> start!135770 e!878452))

(assert (=> start!135770 true))

(declare-datatypes ((array!105356 0))(
  ( (array!105357 (arr!50819 (Array (_ BitVec 32) (_ BitVec 64))) (size!51369 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105356)

(declare-fun array_inv!39546 (array!105356) Bool)

(assert (=> start!135770 (array_inv!39546 _keys!605)))

(declare-fun b!1575064 () Bool)

(declare-fun res!1076206 () Bool)

(assert (=> b!1575064 (=> (not res!1076206) (not e!878452))))

(assert (=> b!1575064 (= res!1076206 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51369 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575065 () Bool)

(declare-fun res!1076208 () Bool)

(assert (=> b!1575065 (=> (not res!1076208) (not e!878452))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575065 (= res!1076208 (validKeyInArray!0 k0!761))))

(declare-fun b!1575066 () Bool)

(assert (=> b!1575066 (= e!878452 false)))

(declare-datatypes ((SeekEntryResult!13684 0))(
  ( (MissingZero!13684 (index!57134 (_ BitVec 32))) (Found!13684 (index!57135 (_ BitVec 32))) (Intermediate!13684 (undefined!14496 Bool) (index!57136 (_ BitVec 32)) (x!142092 (_ BitVec 32))) (Undefined!13684) (MissingVacant!13684 (index!57137 (_ BitVec 32))) )
))
(declare-fun lt!675052 () SeekEntryResult!13684)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105356 (_ BitVec 32)) SeekEntryResult!13684)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575066 (= lt!675052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135770 res!1076207) b!1575064))

(assert (= (and b!1575064 res!1076206) b!1575065))

(assert (= (and b!1575065 res!1076208) b!1575066))

(declare-fun m!1448165 () Bool)

(assert (=> start!135770 m!1448165))

(declare-fun m!1448167 () Bool)

(assert (=> start!135770 m!1448167))

(declare-fun m!1448169 () Bool)

(assert (=> b!1575065 m!1448169))

(declare-fun m!1448171 () Bool)

(assert (=> b!1575066 m!1448171))

(assert (=> b!1575066 m!1448171))

(declare-fun m!1448173 () Bool)

(assert (=> b!1575066 m!1448173))

(check-sat (not b!1575065) (not b!1575066) (not start!135770))
(check-sat)
