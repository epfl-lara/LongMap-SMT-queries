; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135866 () Bool)

(assert start!135866)

(declare-fun res!1076428 () Bool)

(declare-fun e!878650 () Bool)

(assert (=> start!135866 (=> (not res!1076428) (not e!878650))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135866 (= res!1076428 (validMask!0 mask!898))))

(assert (=> start!135866 e!878650))

(assert (=> start!135866 true))

(declare-datatypes ((array!105398 0))(
  ( (array!105399 (arr!50837 (Array (_ BitVec 32) (_ BitVec 64))) (size!51387 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105398)

(declare-fun array_inv!39564 (array!105398) Bool)

(assert (=> start!135866 (array_inv!39564 _keys!605)))

(declare-fun b!1575388 () Bool)

(declare-fun res!1076430 () Bool)

(assert (=> b!1575388 (=> (not res!1076430) (not e!878650))))

(assert (=> b!1575388 (= res!1076430 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51387 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575389 () Bool)

(declare-fun res!1076429 () Bool)

(assert (=> b!1575389 (=> (not res!1076429) (not e!878650))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575389 (= res!1076429 (validKeyInArray!0 k0!761))))

(declare-fun b!1575390 () Bool)

(assert (=> b!1575390 (= e!878650 false)))

(declare-datatypes ((SeekEntryResult!13702 0))(
  ( (MissingZero!13702 (index!57206 (_ BitVec 32))) (Found!13702 (index!57207 (_ BitVec 32))) (Intermediate!13702 (undefined!14514 Bool) (index!57208 (_ BitVec 32)) (x!142170 (_ BitVec 32))) (Undefined!13702) (MissingVacant!13702 (index!57209 (_ BitVec 32))) )
))
(declare-fun lt!675178 () SeekEntryResult!13702)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105398 (_ BitVec 32)) SeekEntryResult!13702)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575390 (= lt!675178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135866 res!1076428) b!1575388))

(assert (= (and b!1575388 res!1076430) b!1575389))

(assert (= (and b!1575389 res!1076429) b!1575390))

(declare-fun m!1448399 () Bool)

(assert (=> start!135866 m!1448399))

(declare-fun m!1448401 () Bool)

(assert (=> start!135866 m!1448401))

(declare-fun m!1448403 () Bool)

(assert (=> b!1575389 m!1448403))

(declare-fun m!1448405 () Bool)

(assert (=> b!1575390 m!1448405))

(assert (=> b!1575390 m!1448405))

(declare-fun m!1448407 () Bool)

(assert (=> b!1575390 m!1448407))

(check-sat (not b!1575389) (not start!135866) (not b!1575390))
