; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135608 () Bool)

(assert start!135608)

(declare-fun res!1075792 () Bool)

(declare-fun e!878101 () Bool)

(assert (=> start!135608 (=> (not res!1075792) (not e!878101))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135608 (= res!1075792 (validMask!0 mask!898))))

(assert (=> start!135608 e!878101))

(assert (=> start!135608 true))

(declare-datatypes ((array!105275 0))(
  ( (array!105276 (arr!50783 (Array (_ BitVec 32) (_ BitVec 64))) (size!51333 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105275)

(declare-fun array_inv!39510 (array!105275) Bool)

(assert (=> start!135608 (array_inv!39510 _keys!605)))

(declare-fun b!1574497 () Bool)

(declare-fun res!1075794 () Bool)

(assert (=> b!1574497 (=> (not res!1075794) (not e!878101))))

(assert (=> b!1574497 (= res!1075794 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51333 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574498 () Bool)

(declare-fun res!1075793 () Bool)

(assert (=> b!1574498 (=> (not res!1075793) (not e!878101))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574498 (= res!1075793 (validKeyInArray!0 k0!761))))

(declare-fun b!1574499 () Bool)

(assert (=> b!1574499 (= e!878101 false)))

(declare-fun lt!674836 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574499 (= lt!674836 (toIndex!0 k0!761 mask!898))))

(assert (= (and start!135608 res!1075792) b!1574497))

(assert (= (and b!1574497 res!1075794) b!1574498))

(assert (= (and b!1574498 res!1075793) b!1574499))

(declare-fun m!1447725 () Bool)

(assert (=> start!135608 m!1447725))

(declare-fun m!1447727 () Bool)

(assert (=> start!135608 m!1447727))

(declare-fun m!1447729 () Bool)

(assert (=> b!1574498 m!1447729))

(declare-fun m!1447731 () Bool)

(assert (=> b!1574499 m!1447731))

(check-sat (not b!1574499) (not start!135608) (not b!1574498))
