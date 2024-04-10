; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135692 () Bool)

(assert start!135692)

(declare-fun res!1076067 () Bool)

(declare-fun e!878309 () Bool)

(assert (=> start!135692 (=> (not res!1076067) (not e!878309))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135692 (= res!1076067 (validMask!0 mask!898))))

(assert (=> start!135692 e!878309))

(assert (=> start!135692 true))

(declare-datatypes ((array!105332 0))(
  ( (array!105333 (arr!50810 (Array (_ BitVec 32) (_ BitVec 64))) (size!51360 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105332)

(declare-fun array_inv!39537 (array!105332) Bool)

(assert (=> start!135692 (array_inv!39537 _keys!605)))

(declare-fun b!1574821 () Bool)

(declare-fun res!1076066 () Bool)

(assert (=> b!1574821 (=> (not res!1076066) (not e!878309))))

(assert (=> b!1574821 (= res!1076066 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51360 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574822 () Bool)

(declare-fun res!1076065 () Bool)

(assert (=> b!1574822 (=> (not res!1076065) (not e!878309))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574822 (= res!1076065 (validKeyInArray!0 k0!761))))

(declare-fun b!1574823 () Bool)

(assert (=> b!1574823 (= e!878309 false)))

(declare-datatypes ((SeekEntryResult!13675 0))(
  ( (MissingZero!13675 (index!57098 (_ BitVec 32))) (Found!13675 (index!57099 (_ BitVec 32))) (Intermediate!13675 (undefined!14487 Bool) (index!57100 (_ BitVec 32)) (x!142047 (_ BitVec 32))) (Undefined!13675) (MissingVacant!13675 (index!57101 (_ BitVec 32))) )
))
(declare-fun lt!674953 () SeekEntryResult!13675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105332 (_ BitVec 32)) SeekEntryResult!13675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574823 (= lt!674953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135692 res!1076067) b!1574821))

(assert (= (and b!1574821 res!1076066) b!1574822))

(assert (= (and b!1574822 res!1076065) b!1574823))

(declare-fun m!1448015 () Bool)

(assert (=> start!135692 m!1448015))

(declare-fun m!1448017 () Bool)

(assert (=> start!135692 m!1448017))

(declare-fun m!1448019 () Bool)

(assert (=> b!1574822 m!1448019))

(declare-fun m!1448021 () Bool)

(assert (=> b!1574823 m!1448021))

(assert (=> b!1574823 m!1448021))

(declare-fun m!1448023 () Bool)

(assert (=> b!1574823 m!1448023))

(check-sat (not start!135692) (not b!1574823) (not b!1574822))
(check-sat)
