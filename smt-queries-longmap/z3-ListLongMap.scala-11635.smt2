; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135782 () Bool)

(assert start!135782)

(declare-fun res!1076261 () Bool)

(declare-fun e!878489 () Bool)

(assert (=> start!135782 (=> (not res!1076261) (not e!878489))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135782 (= res!1076261 (validMask!0 mask!898))))

(assert (=> start!135782 e!878489))

(assert (=> start!135782 true))

(declare-datatypes ((array!105368 0))(
  ( (array!105369 (arr!50825 (Array (_ BitVec 32) (_ BitVec 64))) (size!51375 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105368)

(declare-fun array_inv!39552 (array!105368) Bool)

(assert (=> start!135782 (array_inv!39552 _keys!605)))

(declare-fun b!1575118 () Bool)

(declare-fun res!1076262 () Bool)

(assert (=> b!1575118 (=> (not res!1076262) (not e!878489))))

(assert (=> b!1575118 (= res!1076262 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51375 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575119 () Bool)

(declare-fun res!1076260 () Bool)

(assert (=> b!1575119 (=> (not res!1076260) (not e!878489))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575119 (= res!1076260 (validKeyInArray!0 k0!761))))

(declare-fun b!1575120 () Bool)

(assert (=> b!1575120 (= e!878489 false)))

(declare-datatypes ((SeekEntryResult!13690 0))(
  ( (MissingZero!13690 (index!57158 (_ BitVec 32))) (Found!13690 (index!57159 (_ BitVec 32))) (Intermediate!13690 (undefined!14502 Bool) (index!57160 (_ BitVec 32)) (x!142114 (_ BitVec 32))) (Undefined!13690) (MissingVacant!13690 (index!57161 (_ BitVec 32))) )
))
(declare-fun lt!675070 () SeekEntryResult!13690)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105368 (_ BitVec 32)) SeekEntryResult!13690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575120 (= lt!675070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135782 res!1076261) b!1575118))

(assert (= (and b!1575118 res!1076262) b!1575119))

(assert (= (and b!1575119 res!1076260) b!1575120))

(declare-fun m!1448225 () Bool)

(assert (=> start!135782 m!1448225))

(declare-fun m!1448227 () Bool)

(assert (=> start!135782 m!1448227))

(declare-fun m!1448229 () Bool)

(assert (=> b!1575119 m!1448229))

(declare-fun m!1448231 () Bool)

(assert (=> b!1575120 m!1448231))

(assert (=> b!1575120 m!1448231))

(declare-fun m!1448233 () Bool)

(assert (=> b!1575120 m!1448233))

(check-sat (not b!1575120) (not start!135782) (not b!1575119))
(check-sat)
