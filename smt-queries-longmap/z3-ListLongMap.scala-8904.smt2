; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108076 () Bool)

(assert start!108076)

(declare-fun b_free!27789 () Bool)

(declare-fun b_next!27789 () Bool)

(assert (=> start!108076 (= b_free!27789 (not b_next!27789))))

(declare-fun tp!98320 () Bool)

(declare-fun b_and!45845 () Bool)

(assert (=> start!108076 (= tp!98320 b_and!45845)))

(declare-fun b!1276355 () Bool)

(declare-fun res!848236 () Bool)

(declare-fun e!728823 () Bool)

(assert (=> b!1276355 (=> (not res!848236) (not e!728823))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83772 0))(
  ( (array!83773 (arr!40397 (Array (_ BitVec 32) (_ BitVec 64))) (size!40947 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83772)

(declare-datatypes ((V!49555 0))(
  ( (V!49556 (val!16744 Int)) )
))
(declare-datatypes ((ValueCell!15771 0))(
  ( (ValueCellFull!15771 (v!19341 V!49555)) (EmptyCell!15771) )
))
(declare-datatypes ((array!83774 0))(
  ( (array!83775 (arr!40398 (Array (_ BitVec 32) ValueCell!15771)) (size!40948 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83774)

(assert (=> b!1276355 (= res!848236 (and (= (size!40948 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40947 _keys!1427) (size!40948 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51539 () Bool)

(declare-fun mapRes!51539 () Bool)

(assert (=> mapIsEmpty!51539 mapRes!51539))

(declare-fun b!1276356 () Bool)

(declare-fun e!728826 () Bool)

(declare-fun tp_is_empty!33339 () Bool)

(assert (=> b!1276356 (= e!728826 tp_is_empty!33339)))

(declare-fun res!848235 () Bool)

(assert (=> start!108076 (=> (not res!848235) (not e!728823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108076 (= res!848235 (validMask!0 mask!1805))))

(assert (=> start!108076 e!728823))

(assert (=> start!108076 true))

(assert (=> start!108076 tp!98320))

(assert (=> start!108076 tp_is_empty!33339))

(declare-fun e!728822 () Bool)

(declare-fun array_inv!30701 (array!83774) Bool)

(assert (=> start!108076 (and (array_inv!30701 _values!1187) e!728822)))

(declare-fun array_inv!30702 (array!83772) Bool)

(assert (=> start!108076 (array_inv!30702 _keys!1427)))

(declare-fun b!1276357 () Bool)

(assert (=> b!1276357 (= e!728823 false)))

(declare-fun lt!575476 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49555)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49555)

(declare-datatypes ((tuple2!21478 0))(
  ( (tuple2!21479 (_1!10750 (_ BitVec 64)) (_2!10750 V!49555)) )
))
(declare-datatypes ((List!28649 0))(
  ( (Nil!28646) (Cons!28645 (h!29854 tuple2!21478) (t!42185 List!28649)) )
))
(declare-datatypes ((ListLongMap!19135 0))(
  ( (ListLongMap!19136 (toList!9583 List!28649)) )
))
(declare-fun contains!7692 (ListLongMap!19135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4667 (array!83772 array!83774 (_ BitVec 32) (_ BitVec 32) V!49555 V!49555 (_ BitVec 32) Int) ListLongMap!19135)

(assert (=> b!1276357 (= lt!575476 (contains!7692 (getCurrentListMap!4667 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276358 () Bool)

(declare-fun res!848237 () Bool)

(assert (=> b!1276358 (=> (not res!848237) (not e!728823))))

(declare-datatypes ((List!28650 0))(
  ( (Nil!28647) (Cons!28646 (h!29855 (_ BitVec 64)) (t!42186 List!28650)) )
))
(declare-fun arrayNoDuplicates!0 (array!83772 (_ BitVec 32) List!28650) Bool)

(assert (=> b!1276358 (= res!848237 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28647))))

(declare-fun b!1276359 () Bool)

(declare-fun e!728825 () Bool)

(assert (=> b!1276359 (= e!728825 tp_is_empty!33339)))

(declare-fun mapNonEmpty!51539 () Bool)

(declare-fun tp!98321 () Bool)

(assert (=> mapNonEmpty!51539 (= mapRes!51539 (and tp!98321 e!728825))))

(declare-fun mapRest!51539 () (Array (_ BitVec 32) ValueCell!15771))

(declare-fun mapValue!51539 () ValueCell!15771)

(declare-fun mapKey!51539 () (_ BitVec 32))

(assert (=> mapNonEmpty!51539 (= (arr!40398 _values!1187) (store mapRest!51539 mapKey!51539 mapValue!51539))))

(declare-fun b!1276360 () Bool)

(assert (=> b!1276360 (= e!728822 (and e!728826 mapRes!51539))))

(declare-fun condMapEmpty!51539 () Bool)

(declare-fun mapDefault!51539 () ValueCell!15771)

(assert (=> b!1276360 (= condMapEmpty!51539 (= (arr!40398 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15771)) mapDefault!51539)))))

(declare-fun b!1276361 () Bool)

(declare-fun res!848238 () Bool)

(assert (=> b!1276361 (=> (not res!848238) (not e!728823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83772 (_ BitVec 32)) Bool)

(assert (=> b!1276361 (= res!848238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108076 res!848235) b!1276355))

(assert (= (and b!1276355 res!848236) b!1276361))

(assert (= (and b!1276361 res!848238) b!1276358))

(assert (= (and b!1276358 res!848237) b!1276357))

(assert (= (and b!1276360 condMapEmpty!51539) mapIsEmpty!51539))

(assert (= (and b!1276360 (not condMapEmpty!51539)) mapNonEmpty!51539))

(get-info :version)

(assert (= (and mapNonEmpty!51539 ((_ is ValueCellFull!15771) mapValue!51539)) b!1276359))

(assert (= (and b!1276360 ((_ is ValueCellFull!15771) mapDefault!51539)) b!1276356))

(assert (= start!108076 b!1276360))

(declare-fun m!1172289 () Bool)

(assert (=> b!1276357 m!1172289))

(assert (=> b!1276357 m!1172289))

(declare-fun m!1172291 () Bool)

(assert (=> b!1276357 m!1172291))

(declare-fun m!1172293 () Bool)

(assert (=> mapNonEmpty!51539 m!1172293))

(declare-fun m!1172295 () Bool)

(assert (=> b!1276358 m!1172295))

(declare-fun m!1172297 () Bool)

(assert (=> start!108076 m!1172297))

(declare-fun m!1172299 () Bool)

(assert (=> start!108076 m!1172299))

(declare-fun m!1172301 () Bool)

(assert (=> start!108076 m!1172301))

(declare-fun m!1172303 () Bool)

(assert (=> b!1276361 m!1172303))

(check-sat (not start!108076) (not mapNonEmpty!51539) (not b_next!27789) (not b!1276358) b_and!45845 (not b!1276357) tp_is_empty!33339 (not b!1276361))
(check-sat b_and!45845 (not b_next!27789))
