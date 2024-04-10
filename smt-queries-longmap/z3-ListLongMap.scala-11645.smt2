; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135932 () Bool)

(assert start!135932)

(declare-fun res!1076620 () Bool)

(declare-fun e!878804 () Bool)

(assert (=> start!135932 (=> (not res!1076620) (not e!878804))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135932 (= res!1076620 (validMask!0 mask!898))))

(assert (=> start!135932 e!878804))

(assert (=> start!135932 true))

(declare-datatypes ((array!105437 0))(
  ( (array!105438 (arr!50855 (Array (_ BitVec 32) (_ BitVec 64))) (size!51405 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105437)

(declare-fun array_inv!39582 (array!105437) Bool)

(assert (=> start!135932 (array_inv!39582 _keys!605)))

(declare-fun b!1575631 () Bool)

(declare-fun res!1076622 () Bool)

(assert (=> b!1575631 (=> (not res!1076622) (not e!878804))))

(assert (=> b!1575631 (= res!1076622 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51405 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575632 () Bool)

(declare-fun res!1076621 () Bool)

(assert (=> b!1575632 (=> (not res!1076621) (not e!878804))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575632 (= res!1076621 (validKeyInArray!0 k0!761))))

(declare-fun b!1575633 () Bool)

(assert (=> b!1575633 (= e!878804 false)))

(declare-datatypes ((SeekEntryResult!13720 0))(
  ( (MissingZero!13720 (index!57278 (_ BitVec 32))) (Found!13720 (index!57279 (_ BitVec 32))) (Intermediate!13720 (undefined!14532 Bool) (index!57280 (_ BitVec 32)) (x!142242 (_ BitVec 32))) (Undefined!13720) (MissingVacant!13720 (index!57281 (_ BitVec 32))) )
))
(declare-fun lt!675268 () SeekEntryResult!13720)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105437 (_ BitVec 32)) SeekEntryResult!13720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575633 (= lt!675268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135932 res!1076620) b!1575631))

(assert (= (and b!1575631 res!1076622) b!1575632))

(assert (= (and b!1575632 res!1076621) b!1575633))

(declare-fun m!1448609 () Bool)

(assert (=> start!135932 m!1448609))

(declare-fun m!1448611 () Bool)

(assert (=> start!135932 m!1448611))

(declare-fun m!1448613 () Bool)

(assert (=> b!1575632 m!1448613))

(declare-fun m!1448615 () Bool)

(assert (=> b!1575633 m!1448615))

(assert (=> b!1575633 m!1448615))

(declare-fun m!1448617 () Bool)

(assert (=> b!1575633 m!1448617))

(check-sat (not start!135932) (not b!1575633) (not b!1575632))
(check-sat)
