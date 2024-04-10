; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135788 () Bool)

(assert start!135788)

(declare-fun res!1076288 () Bool)

(declare-fun e!878506 () Bool)

(assert (=> start!135788 (=> (not res!1076288) (not e!878506))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135788 (= res!1076288 (validMask!0 mask!898))))

(assert (=> start!135788 e!878506))

(assert (=> start!135788 true))

(declare-datatypes ((array!105374 0))(
  ( (array!105375 (arr!50828 (Array (_ BitVec 32) (_ BitVec 64))) (size!51378 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105374)

(declare-fun array_inv!39555 (array!105374) Bool)

(assert (=> start!135788 (array_inv!39555 _keys!605)))

(declare-fun b!1575145 () Bool)

(declare-fun res!1076287 () Bool)

(assert (=> b!1575145 (=> (not res!1076287) (not e!878506))))

(assert (=> b!1575145 (= res!1076287 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51378 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575146 () Bool)

(declare-fun res!1076289 () Bool)

(assert (=> b!1575146 (=> (not res!1076289) (not e!878506))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575146 (= res!1076289 (validKeyInArray!0 k0!761))))

(declare-fun b!1575147 () Bool)

(assert (=> b!1575147 (= e!878506 false)))

(declare-datatypes ((SeekEntryResult!13693 0))(
  ( (MissingZero!13693 (index!57170 (_ BitVec 32))) (Found!13693 (index!57171 (_ BitVec 32))) (Intermediate!13693 (undefined!14505 Bool) (index!57172 (_ BitVec 32)) (x!142125 (_ BitVec 32))) (Undefined!13693) (MissingVacant!13693 (index!57173 (_ BitVec 32))) )
))
(declare-fun lt!675079 () SeekEntryResult!13693)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105374 (_ BitVec 32)) SeekEntryResult!13693)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575147 (= lt!675079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135788 res!1076288) b!1575145))

(assert (= (and b!1575145 res!1076287) b!1575146))

(assert (= (and b!1575146 res!1076289) b!1575147))

(declare-fun m!1448255 () Bool)

(assert (=> start!135788 m!1448255))

(declare-fun m!1448257 () Bool)

(assert (=> start!135788 m!1448257))

(declare-fun m!1448259 () Bool)

(assert (=> b!1575146 m!1448259))

(declare-fun m!1448261 () Bool)

(assert (=> b!1575147 m!1448261))

(assert (=> b!1575147 m!1448261))

(declare-fun m!1448263 () Bool)

(assert (=> b!1575147 m!1448263))

(check-sat (not b!1575146) (not b!1575147) (not start!135788))
