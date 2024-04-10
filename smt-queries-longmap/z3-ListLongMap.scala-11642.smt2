; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135884 () Bool)

(assert start!135884)

(declare-fun res!1076511 () Bool)

(declare-fun e!878705 () Bool)

(assert (=> start!135884 (=> (not res!1076511) (not e!878705))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135884 (= res!1076511 (validMask!0 mask!898))))

(assert (=> start!135884 e!878705))

(assert (=> start!135884 true))

(declare-datatypes ((array!105416 0))(
  ( (array!105417 (arr!50846 (Array (_ BitVec 32) (_ BitVec 64))) (size!51396 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105416)

(declare-fun array_inv!39573 (array!105416) Bool)

(assert (=> start!135884 (array_inv!39573 _keys!605)))

(declare-fun b!1575469 () Bool)

(declare-fun res!1076510 () Bool)

(assert (=> b!1575469 (=> (not res!1076510) (not e!878705))))

(assert (=> b!1575469 (= res!1076510 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51396 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575470 () Bool)

(declare-fun res!1076509 () Bool)

(assert (=> b!1575470 (=> (not res!1076509) (not e!878705))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575470 (= res!1076509 (validKeyInArray!0 k0!761))))

(declare-fun b!1575471 () Bool)

(assert (=> b!1575471 (= e!878705 false)))

(declare-datatypes ((SeekEntryResult!13711 0))(
  ( (MissingZero!13711 (index!57242 (_ BitVec 32))) (Found!13711 (index!57243 (_ BitVec 32))) (Intermediate!13711 (undefined!14523 Bool) (index!57244 (_ BitVec 32)) (x!142203 (_ BitVec 32))) (Undefined!13711) (MissingVacant!13711 (index!57245 (_ BitVec 32))) )
))
(declare-fun lt!675205 () SeekEntryResult!13711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105416 (_ BitVec 32)) SeekEntryResult!13711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575471 (= lt!675205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135884 res!1076511) b!1575469))

(assert (= (and b!1575469 res!1076510) b!1575470))

(assert (= (and b!1575470 res!1076509) b!1575471))

(declare-fun m!1448489 () Bool)

(assert (=> start!135884 m!1448489))

(declare-fun m!1448491 () Bool)

(assert (=> start!135884 m!1448491))

(declare-fun m!1448493 () Bool)

(assert (=> b!1575470 m!1448493))

(declare-fun m!1448495 () Bool)

(assert (=> b!1575471 m!1448495))

(assert (=> b!1575471 m!1448495))

(declare-fun m!1448497 () Bool)

(assert (=> b!1575471 m!1448497))

(check-sat (not b!1575471) (not start!135884) (not b!1575470))
(check-sat)
