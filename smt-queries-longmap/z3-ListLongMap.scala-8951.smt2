; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108434 () Bool)

(assert start!108434)

(declare-fun b_free!27981 () Bool)

(declare-fun b_next!27981 () Bool)

(assert (=> start!108434 (= b_free!27981 (not b_next!27981))))

(declare-fun tp!99052 () Bool)

(declare-fun b_and!46041 () Bool)

(assert (=> start!108434 (= tp!99052 b_and!46041)))

(declare-fun b!1279785 () Bool)

(declare-fun e!731222 () Bool)

(declare-fun tp_is_empty!33621 () Bool)

(assert (=> b!1279785 (= e!731222 tp_is_empty!33621)))

(declare-fun mapNonEmpty!51983 () Bool)

(declare-fun mapRes!51983 () Bool)

(declare-fun tp!99053 () Bool)

(assert (=> mapNonEmpty!51983 (= mapRes!51983 (and tp!99053 e!731222))))

(declare-datatypes ((V!49931 0))(
  ( (V!49932 (val!16885 Int)) )
))
(declare-datatypes ((ValueCell!15912 0))(
  ( (ValueCellFull!15912 (v!19485 V!49931)) (EmptyCell!15912) )
))
(declare-fun mapValue!51983 () ValueCell!15912)

(declare-datatypes ((array!84324 0))(
  ( (array!84325 (arr!40666 (Array (_ BitVec 32) ValueCell!15912)) (size!41216 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84324)

(declare-fun mapRest!51983 () (Array (_ BitVec 32) ValueCell!15912))

(declare-fun mapKey!51983 () (_ BitVec 32))

(assert (=> mapNonEmpty!51983 (= (arr!40666 _values!1445) (store mapRest!51983 mapKey!51983 mapValue!51983))))

(declare-fun res!850126 () Bool)

(declare-fun e!731221 () Bool)

(assert (=> start!108434 (=> (not res!850126) (not e!731221))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108434 (= res!850126 (validMask!0 mask!2175))))

(assert (=> start!108434 e!731221))

(assert (=> start!108434 tp_is_empty!33621))

(assert (=> start!108434 true))

(declare-fun e!731224 () Bool)

(declare-fun array_inv!30871 (array!84324) Bool)

(assert (=> start!108434 (and (array_inv!30871 _values!1445) e!731224)))

(declare-datatypes ((array!84326 0))(
  ( (array!84327 (arr!40667 (Array (_ BitVec 32) (_ BitVec 64))) (size!41217 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84326)

(declare-fun array_inv!30872 (array!84326) Bool)

(assert (=> start!108434 (array_inv!30872 _keys!1741)))

(assert (=> start!108434 tp!99052))

(declare-fun b!1279786 () Bool)

(declare-fun res!850127 () Bool)

(assert (=> b!1279786 (=> (not res!850127) (not e!731221))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279786 (= res!850127 (and (= (size!41216 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41217 _keys!1741) (size!41216 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51983 () Bool)

(assert (=> mapIsEmpty!51983 mapRes!51983))

(declare-fun b!1279787 () Bool)

(assert (=> b!1279787 (= e!731221 false)))

(declare-fun minValue!1387 () V!49931)

(declare-fun zeroValue!1387 () V!49931)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576044 () Bool)

(declare-datatypes ((tuple2!21604 0))(
  ( (tuple2!21605 (_1!10813 (_ BitVec 64)) (_2!10813 V!49931)) )
))
(declare-datatypes ((List!28803 0))(
  ( (Nil!28800) (Cons!28799 (h!30008 tuple2!21604) (t!42343 List!28803)) )
))
(declare-datatypes ((ListLongMap!19261 0))(
  ( (ListLongMap!19262 (toList!9646 List!28803)) )
))
(declare-fun contains!7761 (ListLongMap!19261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4730 (array!84326 array!84324 (_ BitVec 32) (_ BitVec 32) V!49931 V!49931 (_ BitVec 32) Int) ListLongMap!19261)

(assert (=> b!1279787 (= lt!576044 (contains!7761 (getCurrentListMap!4730 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279788 () Bool)

(declare-fun e!731223 () Bool)

(assert (=> b!1279788 (= e!731224 (and e!731223 mapRes!51983))))

(declare-fun condMapEmpty!51983 () Bool)

(declare-fun mapDefault!51983 () ValueCell!15912)

(assert (=> b!1279788 (= condMapEmpty!51983 (= (arr!40666 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15912)) mapDefault!51983)))))

(declare-fun b!1279789 () Bool)

(declare-fun res!850130 () Bool)

(assert (=> b!1279789 (=> (not res!850130) (not e!731221))))

(assert (=> b!1279789 (= res!850130 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41217 _keys!1741))))))

(declare-fun b!1279790 () Bool)

(declare-fun res!850129 () Bool)

(assert (=> b!1279790 (=> (not res!850129) (not e!731221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84326 (_ BitVec 32)) Bool)

(assert (=> b!1279790 (= res!850129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279791 () Bool)

(assert (=> b!1279791 (= e!731223 tp_is_empty!33621)))

(declare-fun b!1279792 () Bool)

(declare-fun res!850128 () Bool)

(assert (=> b!1279792 (=> (not res!850128) (not e!731221))))

(declare-datatypes ((List!28804 0))(
  ( (Nil!28801) (Cons!28800 (h!30009 (_ BitVec 64)) (t!42344 List!28804)) )
))
(declare-fun arrayNoDuplicates!0 (array!84326 (_ BitVec 32) List!28804) Bool)

(assert (=> b!1279792 (= res!850128 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28801))))

(assert (= (and start!108434 res!850126) b!1279786))

(assert (= (and b!1279786 res!850127) b!1279790))

(assert (= (and b!1279790 res!850129) b!1279792))

(assert (= (and b!1279792 res!850128) b!1279789))

(assert (= (and b!1279789 res!850130) b!1279787))

(assert (= (and b!1279788 condMapEmpty!51983) mapIsEmpty!51983))

(assert (= (and b!1279788 (not condMapEmpty!51983)) mapNonEmpty!51983))

(get-info :version)

(assert (= (and mapNonEmpty!51983 ((_ is ValueCellFull!15912) mapValue!51983)) b!1279785))

(assert (= (and b!1279788 ((_ is ValueCellFull!15912) mapDefault!51983)) b!1279791))

(assert (= start!108434 b!1279788))

(declare-fun m!1174629 () Bool)

(assert (=> b!1279790 m!1174629))

(declare-fun m!1174631 () Bool)

(assert (=> start!108434 m!1174631))

(declare-fun m!1174633 () Bool)

(assert (=> start!108434 m!1174633))

(declare-fun m!1174635 () Bool)

(assert (=> start!108434 m!1174635))

(declare-fun m!1174637 () Bool)

(assert (=> mapNonEmpty!51983 m!1174637))

(declare-fun m!1174639 () Bool)

(assert (=> b!1279787 m!1174639))

(assert (=> b!1279787 m!1174639))

(declare-fun m!1174641 () Bool)

(assert (=> b!1279787 m!1174641))

(declare-fun m!1174643 () Bool)

(assert (=> b!1279792 m!1174643))

(check-sat (not b!1279792) (not start!108434) (not mapNonEmpty!51983) (not b!1279787) b_and!46041 (not b_next!27981) (not b!1279790) tp_is_empty!33621)
(check-sat b_and!46041 (not b_next!27981))
