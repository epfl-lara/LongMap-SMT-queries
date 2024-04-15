; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108778 () Bool)

(assert start!108778)

(declare-fun b_free!28291 () Bool)

(declare-fun b_next!28291 () Bool)

(assert (=> start!108778 (= b_free!28291 (not b_next!28291))))

(declare-fun tp!99990 () Bool)

(declare-fun b_and!46339 () Bool)

(assert (=> start!108778 (= tp!99990 b_and!46339)))

(declare-fun mapIsEmpty!52454 () Bool)

(declare-fun mapRes!52454 () Bool)

(assert (=> mapIsEmpty!52454 mapRes!52454))

(declare-fun b!1284461 () Bool)

(declare-fun res!853299 () Bool)

(declare-fun e!733716 () Bool)

(assert (=> b!1284461 (=> (not res!853299) (not e!733716))))

(declare-datatypes ((array!84815 0))(
  ( (array!84816 (arr!40910 (Array (_ BitVec 32) (_ BitVec 64))) (size!41462 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84815)

(declare-datatypes ((List!29083 0))(
  ( (Nil!29080) (Cons!29079 (h!30288 (_ BitVec 64)) (t!42619 List!29083)) )
))
(declare-fun arrayNoDuplicates!0 (array!84815 (_ BitVec 32) List!29083) Bool)

(assert (=> b!1284461 (= res!853299 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29080))))

(declare-fun mapNonEmpty!52454 () Bool)

(declare-fun tp!99989 () Bool)

(declare-fun e!733715 () Bool)

(assert (=> mapNonEmpty!52454 (= mapRes!52454 (and tp!99989 e!733715))))

(declare-datatypes ((V!50345 0))(
  ( (V!50346 (val!17040 Int)) )
))
(declare-datatypes ((ValueCell!16067 0))(
  ( (ValueCellFull!16067 (v!19641 V!50345)) (EmptyCell!16067) )
))
(declare-fun mapValue!52454 () ValueCell!16067)

(declare-fun mapRest!52454 () (Array (_ BitVec 32) ValueCell!16067))

(declare-datatypes ((array!84817 0))(
  ( (array!84818 (arr!40911 (Array (_ BitVec 32) ValueCell!16067)) (size!41463 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84817)

(declare-fun mapKey!52454 () (_ BitVec 32))

(assert (=> mapNonEmpty!52454 (= (arr!40911 _values!1445) (store mapRest!52454 mapKey!52454 mapValue!52454))))

(declare-fun b!1284462 () Bool)

(declare-fun tp_is_empty!33931 () Bool)

(assert (=> b!1284462 (= e!733715 tp_is_empty!33931)))

(declare-fun b!1284463 () Bool)

(declare-fun e!733712 () Bool)

(assert (=> b!1284463 (= e!733712 tp_is_empty!33931)))

(declare-fun b!1284464 () Bool)

(declare-fun res!853298 () Bool)

(assert (=> b!1284464 (=> (not res!853298) (not e!733716))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284464 (= res!853298 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41462 _keys!1741))))))

(declare-fun b!1284465 () Bool)

(declare-fun res!853297 () Bool)

(assert (=> b!1284465 (=> (not res!853297) (not e!733716))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84815 (_ BitVec 32)) Bool)

(assert (=> b!1284465 (= res!853297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284460 () Bool)

(assert (=> b!1284460 (= e!733716 false)))

(declare-fun minValue!1387 () V!50345)

(declare-fun zeroValue!1387 () V!50345)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576645 () Bool)

(declare-datatypes ((tuple2!21902 0))(
  ( (tuple2!21903 (_1!10962 (_ BitVec 64)) (_2!10962 V!50345)) )
))
(declare-datatypes ((List!29084 0))(
  ( (Nil!29081) (Cons!29080 (h!30289 tuple2!21902) (t!42620 List!29084)) )
))
(declare-datatypes ((ListLongMap!19559 0))(
  ( (ListLongMap!19560 (toList!9795 List!29084)) )
))
(declare-fun contains!7842 (ListLongMap!19559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4765 (array!84815 array!84817 (_ BitVec 32) (_ BitVec 32) V!50345 V!50345 (_ BitVec 32) Int) ListLongMap!19559)

(assert (=> b!1284460 (= lt!576645 (contains!7842 (getCurrentListMap!4765 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!853295 () Bool)

(assert (=> start!108778 (=> (not res!853295) (not e!733716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108778 (= res!853295 (validMask!0 mask!2175))))

(assert (=> start!108778 e!733716))

(assert (=> start!108778 tp_is_empty!33931))

(assert (=> start!108778 true))

(declare-fun e!733713 () Bool)

(declare-fun array_inv!31191 (array!84817) Bool)

(assert (=> start!108778 (and (array_inv!31191 _values!1445) e!733713)))

(declare-fun array_inv!31192 (array!84815) Bool)

(assert (=> start!108778 (array_inv!31192 _keys!1741)))

(assert (=> start!108778 tp!99990))

(declare-fun b!1284466 () Bool)

(assert (=> b!1284466 (= e!733713 (and e!733712 mapRes!52454))))

(declare-fun condMapEmpty!52454 () Bool)

(declare-fun mapDefault!52454 () ValueCell!16067)

(assert (=> b!1284466 (= condMapEmpty!52454 (= (arr!40911 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16067)) mapDefault!52454)))))

(declare-fun b!1284467 () Bool)

(declare-fun res!853296 () Bool)

(assert (=> b!1284467 (=> (not res!853296) (not e!733716))))

(assert (=> b!1284467 (= res!853296 (and (= (size!41463 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41462 _keys!1741) (size!41463 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108778 res!853295) b!1284467))

(assert (= (and b!1284467 res!853296) b!1284465))

(assert (= (and b!1284465 res!853297) b!1284461))

(assert (= (and b!1284461 res!853299) b!1284464))

(assert (= (and b!1284464 res!853298) b!1284460))

(assert (= (and b!1284466 condMapEmpty!52454) mapIsEmpty!52454))

(assert (= (and b!1284466 (not condMapEmpty!52454)) mapNonEmpty!52454))

(get-info :version)

(assert (= (and mapNonEmpty!52454 ((_ is ValueCellFull!16067) mapValue!52454)) b!1284462))

(assert (= (and b!1284466 ((_ is ValueCellFull!16067) mapDefault!52454)) b!1284463))

(assert (= start!108778 b!1284466))

(declare-fun m!1177681 () Bool)

(assert (=> b!1284461 m!1177681))

(declare-fun m!1177683 () Bool)

(assert (=> mapNonEmpty!52454 m!1177683))

(declare-fun m!1177685 () Bool)

(assert (=> b!1284465 m!1177685))

(declare-fun m!1177687 () Bool)

(assert (=> b!1284460 m!1177687))

(assert (=> b!1284460 m!1177687))

(declare-fun m!1177689 () Bool)

(assert (=> b!1284460 m!1177689))

(declare-fun m!1177691 () Bool)

(assert (=> start!108778 m!1177691))

(declare-fun m!1177693 () Bool)

(assert (=> start!108778 m!1177693))

(declare-fun m!1177695 () Bool)

(assert (=> start!108778 m!1177695))

(check-sat (not start!108778) (not b!1284460) (not b_next!28291) (not b!1284465) (not b!1284461) tp_is_empty!33931 b_and!46339 (not mapNonEmpty!52454))
(check-sat b_and!46339 (not b_next!28291))
