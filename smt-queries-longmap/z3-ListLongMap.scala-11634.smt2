; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135776 () Bool)

(assert start!135776)

(declare-fun res!1076234 () Bool)

(declare-fun e!878471 () Bool)

(assert (=> start!135776 (=> (not res!1076234) (not e!878471))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135776 (= res!1076234 (validMask!0 mask!898))))

(assert (=> start!135776 e!878471))

(assert (=> start!135776 true))

(declare-datatypes ((array!105362 0))(
  ( (array!105363 (arr!50822 (Array (_ BitVec 32) (_ BitVec 64))) (size!51372 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105362)

(declare-fun array_inv!39549 (array!105362) Bool)

(assert (=> start!135776 (array_inv!39549 _keys!605)))

(declare-fun b!1575091 () Bool)

(declare-fun res!1076233 () Bool)

(assert (=> b!1575091 (=> (not res!1076233) (not e!878471))))

(assert (=> b!1575091 (= res!1076233 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51372 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575092 () Bool)

(declare-fun res!1076235 () Bool)

(assert (=> b!1575092 (=> (not res!1076235) (not e!878471))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575092 (= res!1076235 (validKeyInArray!0 k0!761))))

(declare-fun b!1575093 () Bool)

(assert (=> b!1575093 (= e!878471 false)))

(declare-datatypes ((SeekEntryResult!13687 0))(
  ( (MissingZero!13687 (index!57146 (_ BitVec 32))) (Found!13687 (index!57147 (_ BitVec 32))) (Intermediate!13687 (undefined!14499 Bool) (index!57148 (_ BitVec 32)) (x!142103 (_ BitVec 32))) (Undefined!13687) (MissingVacant!13687 (index!57149 (_ BitVec 32))) )
))
(declare-fun lt!675061 () SeekEntryResult!13687)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105362 (_ BitVec 32)) SeekEntryResult!13687)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575093 (= lt!675061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135776 res!1076234) b!1575091))

(assert (= (and b!1575091 res!1076233) b!1575092))

(assert (= (and b!1575092 res!1076235) b!1575093))

(declare-fun m!1448195 () Bool)

(assert (=> start!135776 m!1448195))

(declare-fun m!1448197 () Bool)

(assert (=> start!135776 m!1448197))

(declare-fun m!1448199 () Bool)

(assert (=> b!1575092 m!1448199))

(declare-fun m!1448201 () Bool)

(assert (=> b!1575093 m!1448201))

(assert (=> b!1575093 m!1448201))

(declare-fun m!1448203 () Bool)

(assert (=> b!1575093 m!1448203))

(check-sat (not start!135776) (not b!1575093) (not b!1575092))
