; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112964 () Bool)

(assert start!112964)

(declare-fun b!1338979 () Bool)

(declare-fun e!762557 () Bool)

(declare-fun tp_is_empty!37015 () Bool)

(assert (=> b!1338979 (= e!762557 tp_is_empty!37015)))

(declare-fun b!1338980 () Bool)

(declare-fun e!762560 () Bool)

(assert (=> b!1338980 (= e!762560 tp_is_empty!37015)))

(declare-fun b!1338981 () Bool)

(declare-fun e!762556 () Bool)

(declare-fun mapRes!57229 () Bool)

(assert (=> b!1338981 (= e!762556 (and e!762560 mapRes!57229))))

(declare-fun condMapEmpty!57229 () Bool)

(declare-datatypes ((V!54457 0))(
  ( (V!54458 (val!18582 Int)) )
))
(declare-datatypes ((ValueCell!17609 0))(
  ( (ValueCellFull!17609 (v!21229 V!54457)) (EmptyCell!17609) )
))
(declare-datatypes ((array!90837 0))(
  ( (array!90838 (arr!43875 (Array (_ BitVec 32) ValueCell!17609)) (size!44427 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90837)

(declare-fun mapDefault!57229 () ValueCell!17609)

(assert (=> b!1338981 (= condMapEmpty!57229 (= (arr!43875 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17609)) mapDefault!57229)))))

(declare-fun mapNonEmpty!57229 () Bool)

(declare-fun tp!108929 () Bool)

(assert (=> mapNonEmpty!57229 (= mapRes!57229 (and tp!108929 e!762557))))

(declare-fun mapRest!57229 () (Array (_ BitVec 32) ValueCell!17609))

(declare-fun mapValue!57229 () ValueCell!17609)

(declare-fun mapKey!57229 () (_ BitVec 32))

(assert (=> mapNonEmpty!57229 (= (arr!43875 _values!1303) (store mapRest!57229 mapKey!57229 mapValue!57229))))

(declare-fun b!1338982 () Bool)

(declare-fun res!888333 () Bool)

(declare-fun e!762559 () Bool)

(assert (=> b!1338982 (=> (not res!888333) (not e!762559))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90839 0))(
  ( (array!90840 (arr!43876 (Array (_ BitVec 32) (_ BitVec 64))) (size!44428 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90839)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338982 (= res!888333 (and (= (size!44427 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44428 _keys!1571) (size!44427 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888332 () Bool)

(assert (=> start!112964 (=> (not res!888332) (not e!762559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112964 (= res!888332 (validMask!0 mask!1977))))

(assert (=> start!112964 e!762559))

(assert (=> start!112964 true))

(declare-fun array_inv!33277 (array!90837) Bool)

(assert (=> start!112964 (and (array_inv!33277 _values!1303) e!762556)))

(declare-fun array_inv!33278 (array!90839) Bool)

(assert (=> start!112964 (array_inv!33278 _keys!1571)))

(declare-fun b!1338983 () Bool)

(declare-fun res!888334 () Bool)

(assert (=> b!1338983 (=> (not res!888334) (not e!762559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90839 (_ BitVec 32)) Bool)

(assert (=> b!1338983 (= res!888334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57229 () Bool)

(assert (=> mapIsEmpty!57229 mapRes!57229))

(declare-fun b!1338984 () Bool)

(assert (=> b!1338984 (= e!762559 false)))

(declare-fun lt!593640 () Bool)

(declare-datatypes ((List!31139 0))(
  ( (Nil!31136) (Cons!31135 (h!32344 (_ BitVec 64)) (t!45463 List!31139)) )
))
(declare-fun arrayNoDuplicates!0 (array!90839 (_ BitVec 32) List!31139) Bool)

(assert (=> b!1338984 (= lt!593640 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31136))))

(assert (= (and start!112964 res!888332) b!1338982))

(assert (= (and b!1338982 res!888333) b!1338983))

(assert (= (and b!1338983 res!888334) b!1338984))

(assert (= (and b!1338981 condMapEmpty!57229) mapIsEmpty!57229))

(assert (= (and b!1338981 (not condMapEmpty!57229)) mapNonEmpty!57229))

(get-info :version)

(assert (= (and mapNonEmpty!57229 ((_ is ValueCellFull!17609) mapValue!57229)) b!1338979))

(assert (= (and b!1338981 ((_ is ValueCellFull!17609) mapDefault!57229)) b!1338980))

(assert (= start!112964 b!1338981))

(declare-fun m!1226725 () Bool)

(assert (=> mapNonEmpty!57229 m!1226725))

(declare-fun m!1226727 () Bool)

(assert (=> start!112964 m!1226727))

(declare-fun m!1226729 () Bool)

(assert (=> start!112964 m!1226729))

(declare-fun m!1226731 () Bool)

(assert (=> start!112964 m!1226731))

(declare-fun m!1226733 () Bool)

(assert (=> b!1338983 m!1226733))

(declare-fun m!1226735 () Bool)

(assert (=> b!1338984 m!1226735))

(check-sat (not b!1338984) tp_is_empty!37015 (not b!1338983) (not mapNonEmpty!57229) (not start!112964))
(check-sat)
