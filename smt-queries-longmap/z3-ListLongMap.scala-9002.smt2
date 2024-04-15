; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108772 () Bool)

(assert start!108772)

(declare-fun b_free!28285 () Bool)

(declare-fun b_next!28285 () Bool)

(assert (=> start!108772 (= b_free!28285 (not b_next!28285))))

(declare-fun tp!99971 () Bool)

(declare-fun b_and!46333 () Bool)

(assert (=> start!108772 (= tp!99971 b_and!46333)))

(declare-fun b!1284388 () Bool)

(declare-fun e!733670 () Bool)

(declare-fun tp_is_empty!33925 () Bool)

(assert (=> b!1284388 (= e!733670 tp_is_empty!33925)))

(declare-fun b!1284389 () Bool)

(declare-fun res!853250 () Bool)

(declare-fun e!733671 () Bool)

(assert (=> b!1284389 (=> (not res!853250) (not e!733671))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84803 0))(
  ( (array!84804 (arr!40904 (Array (_ BitVec 32) (_ BitVec 64))) (size!41456 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84803)

(assert (=> b!1284389 (= res!853250 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41456 _keys!1741))))))

(declare-fun b!1284390 () Bool)

(declare-fun res!853254 () Bool)

(assert (=> b!1284390 (=> (not res!853254) (not e!733671))))

(declare-datatypes ((List!29079 0))(
  ( (Nil!29076) (Cons!29075 (h!30284 (_ BitVec 64)) (t!42615 List!29079)) )
))
(declare-fun arrayNoDuplicates!0 (array!84803 (_ BitVec 32) List!29079) Bool)

(assert (=> b!1284390 (= res!853254 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29076))))

(declare-fun b!1284391 () Bool)

(declare-fun res!853251 () Bool)

(assert (=> b!1284391 (=> (not res!853251) (not e!733671))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84803 (_ BitVec 32)) Bool)

(assert (=> b!1284391 (= res!853251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52445 () Bool)

(declare-fun mapRes!52445 () Bool)

(assert (=> mapIsEmpty!52445 mapRes!52445))

(declare-fun b!1284393 () Bool)

(declare-fun e!733667 () Bool)

(declare-fun e!733668 () Bool)

(assert (=> b!1284393 (= e!733667 (and e!733668 mapRes!52445))))

(declare-fun condMapEmpty!52445 () Bool)

(declare-datatypes ((V!50337 0))(
  ( (V!50338 (val!17037 Int)) )
))
(declare-datatypes ((ValueCell!16064 0))(
  ( (ValueCellFull!16064 (v!19638 V!50337)) (EmptyCell!16064) )
))
(declare-datatypes ((array!84805 0))(
  ( (array!84806 (arr!40905 (Array (_ BitVec 32) ValueCell!16064)) (size!41457 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84805)

(declare-fun mapDefault!52445 () ValueCell!16064)

(assert (=> b!1284393 (= condMapEmpty!52445 (= (arr!40905 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16064)) mapDefault!52445)))))

(declare-fun b!1284394 () Bool)

(assert (=> b!1284394 (= e!733671 false)))

(declare-fun minValue!1387 () V!50337)

(declare-fun zeroValue!1387 () V!50337)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576636 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21898 0))(
  ( (tuple2!21899 (_1!10960 (_ BitVec 64)) (_2!10960 V!50337)) )
))
(declare-datatypes ((List!29080 0))(
  ( (Nil!29077) (Cons!29076 (h!30285 tuple2!21898) (t!42616 List!29080)) )
))
(declare-datatypes ((ListLongMap!19555 0))(
  ( (ListLongMap!19556 (toList!9793 List!29080)) )
))
(declare-fun contains!7840 (ListLongMap!19555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4763 (array!84803 array!84805 (_ BitVec 32) (_ BitVec 32) V!50337 V!50337 (_ BitVec 32) Int) ListLongMap!19555)

(assert (=> b!1284394 (= lt!576636 (contains!7840 (getCurrentListMap!4763 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284395 () Bool)

(assert (=> b!1284395 (= e!733668 tp_is_empty!33925)))

(declare-fun mapNonEmpty!52445 () Bool)

(declare-fun tp!99972 () Bool)

(assert (=> mapNonEmpty!52445 (= mapRes!52445 (and tp!99972 e!733670))))

(declare-fun mapValue!52445 () ValueCell!16064)

(declare-fun mapRest!52445 () (Array (_ BitVec 32) ValueCell!16064))

(declare-fun mapKey!52445 () (_ BitVec 32))

(assert (=> mapNonEmpty!52445 (= (arr!40905 _values!1445) (store mapRest!52445 mapKey!52445 mapValue!52445))))

(declare-fun res!853253 () Bool)

(assert (=> start!108772 (=> (not res!853253) (not e!733671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108772 (= res!853253 (validMask!0 mask!2175))))

(assert (=> start!108772 e!733671))

(assert (=> start!108772 tp_is_empty!33925))

(assert (=> start!108772 true))

(declare-fun array_inv!31185 (array!84805) Bool)

(assert (=> start!108772 (and (array_inv!31185 _values!1445) e!733667)))

(declare-fun array_inv!31186 (array!84803) Bool)

(assert (=> start!108772 (array_inv!31186 _keys!1741)))

(assert (=> start!108772 tp!99971))

(declare-fun b!1284392 () Bool)

(declare-fun res!853252 () Bool)

(assert (=> b!1284392 (=> (not res!853252) (not e!733671))))

(assert (=> b!1284392 (= res!853252 (and (= (size!41457 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41456 _keys!1741) (size!41457 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108772 res!853253) b!1284392))

(assert (= (and b!1284392 res!853252) b!1284391))

(assert (= (and b!1284391 res!853251) b!1284390))

(assert (= (and b!1284390 res!853254) b!1284389))

(assert (= (and b!1284389 res!853250) b!1284394))

(assert (= (and b!1284393 condMapEmpty!52445) mapIsEmpty!52445))

(assert (= (and b!1284393 (not condMapEmpty!52445)) mapNonEmpty!52445))

(get-info :version)

(assert (= (and mapNonEmpty!52445 ((_ is ValueCellFull!16064) mapValue!52445)) b!1284388))

(assert (= (and b!1284393 ((_ is ValueCellFull!16064) mapDefault!52445)) b!1284395))

(assert (= start!108772 b!1284393))

(declare-fun m!1177633 () Bool)

(assert (=> b!1284390 m!1177633))

(declare-fun m!1177635 () Bool)

(assert (=> b!1284394 m!1177635))

(assert (=> b!1284394 m!1177635))

(declare-fun m!1177637 () Bool)

(assert (=> b!1284394 m!1177637))

(declare-fun m!1177639 () Bool)

(assert (=> mapNonEmpty!52445 m!1177639))

(declare-fun m!1177641 () Bool)

(assert (=> start!108772 m!1177641))

(declare-fun m!1177643 () Bool)

(assert (=> start!108772 m!1177643))

(declare-fun m!1177645 () Bool)

(assert (=> start!108772 m!1177645))

(declare-fun m!1177647 () Bool)

(assert (=> b!1284391 m!1177647))

(check-sat (not b!1284394) (not b_next!28285) (not b!1284391) (not mapNonEmpty!52445) b_and!46333 (not start!108772) tp_is_empty!33925 (not b!1284390))
(check-sat b_and!46333 (not b_next!28285))
