; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108558 () Bool)

(assert start!108558)

(declare-fun b_free!28105 () Bool)

(declare-fun b_next!28105 () Bool)

(assert (=> start!108558 (= b_free!28105 (not b_next!28105))))

(declare-fun tp!99426 () Bool)

(declare-fun b_and!46147 () Bool)

(assert (=> start!108558 (= tp!99426 b_and!46147)))

(declare-fun b!1281423 () Bool)

(declare-fun e!732138 () Bool)

(declare-fun tp_is_empty!33745 () Bool)

(assert (=> b!1281423 (= e!732138 tp_is_empty!33745)))

(declare-fun b!1281424 () Bool)

(declare-fun res!851243 () Bool)

(declare-fun e!732135 () Bool)

(assert (=> b!1281424 (=> (not res!851243) (not e!732135))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84457 0))(
  ( (array!84458 (arr!40733 (Array (_ BitVec 32) (_ BitVec 64))) (size!41285 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84457)

(assert (=> b!1281424 (= res!851243 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41285 _keys!1741))))))

(declare-fun mapIsEmpty!52169 () Bool)

(declare-fun mapRes!52169 () Bool)

(assert (=> mapIsEmpty!52169 mapRes!52169))

(declare-fun b!1281425 () Bool)

(declare-fun e!732137 () Bool)

(assert (=> b!1281425 (= e!732135 (not e!732137))))

(declare-fun res!851245 () Bool)

(assert (=> b!1281425 (=> res!851245 e!732137)))

(assert (=> b!1281425 (= res!851245 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-datatypes ((V!50097 0))(
  ( (V!50098 (val!16947 Int)) )
))
(declare-fun minValue!1387 () V!50097)

(declare-fun zeroValue!1387 () V!50097)

(declare-datatypes ((ValueCell!15974 0))(
  ( (ValueCellFull!15974 (v!19546 V!50097)) (EmptyCell!15974) )
))
(declare-datatypes ((array!84459 0))(
  ( (array!84460 (arr!40734 (Array (_ BitVec 32) ValueCell!15974)) (size!41286 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84459)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21772 0))(
  ( (tuple2!21773 (_1!10897 (_ BitVec 64)) (_2!10897 V!50097)) )
))
(declare-datatypes ((List!28960 0))(
  ( (Nil!28957) (Cons!28956 (h!30165 tuple2!21772) (t!42492 List!28960)) )
))
(declare-datatypes ((ListLongMap!19429 0))(
  ( (ListLongMap!19430 (toList!9730 List!28960)) )
))
(declare-fun contains!7775 (ListLongMap!19429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4704 (array!84457 array!84459 (_ BitVec 32) (_ BitVec 32) V!50097 V!50097 (_ BitVec 32) Int) ListLongMap!19429)

(assert (=> b!1281425 (contains!7775 (getCurrentListMap!4704 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42283 0))(
  ( (Unit!42284) )
))
(declare-fun lt!576063 () Unit!42283)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!22 (array!84457 array!84459 (_ BitVec 32) (_ BitVec 32) V!50097 V!50097 (_ BitVec 64) (_ BitVec 32) Int) Unit!42283)

(assert (=> b!1281425 (= lt!576063 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!22 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281426 () Bool)

(assert (=> b!1281426 (= e!732137 true)))

(declare-fun arrayContainsKey!0 (array!84457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1281426 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!576064 () Unit!42283)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!624 (array!84457 array!84459 (_ BitVec 32) (_ BitVec 32) V!50097 V!50097 (_ BitVec 64) (_ BitVec 32) Int) Unit!42283)

(assert (=> b!1281426 (= lt!576064 (lemmaListMapContainsThenArrayContainsFrom!624 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1281427 () Bool)

(declare-fun res!851247 () Bool)

(assert (=> b!1281427 (=> (not res!851247) (not e!732135))))

(assert (=> b!1281427 (= res!851247 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41285 _keys!1741)) (not (= (select (arr!40733 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1281428 () Bool)

(declare-fun e!732136 () Bool)

(assert (=> b!1281428 (= e!732136 tp_is_empty!33745)))

(declare-fun b!1281429 () Bool)

(declare-fun e!732133 () Bool)

(assert (=> b!1281429 (= e!732133 (and e!732136 mapRes!52169))))

(declare-fun condMapEmpty!52169 () Bool)

(declare-fun mapDefault!52169 () ValueCell!15974)

(assert (=> b!1281429 (= condMapEmpty!52169 (= (arr!40734 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15974)) mapDefault!52169)))))

(declare-fun b!1281422 () Bool)

(declare-fun res!851244 () Bool)

(assert (=> b!1281422 (=> (not res!851244) (not e!732135))))

(declare-datatypes ((List!28961 0))(
  ( (Nil!28958) (Cons!28957 (h!30166 (_ BitVec 64)) (t!42493 List!28961)) )
))
(declare-fun arrayNoDuplicates!0 (array!84457 (_ BitVec 32) List!28961) Bool)

(assert (=> b!1281422 (= res!851244 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28958))))

(declare-fun res!851246 () Bool)

(assert (=> start!108558 (=> (not res!851246) (not e!732135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108558 (= res!851246 (validMask!0 mask!2175))))

(assert (=> start!108558 e!732135))

(assert (=> start!108558 tp_is_empty!33745))

(assert (=> start!108558 true))

(declare-fun array_inv!31069 (array!84459) Bool)

(assert (=> start!108558 (and (array_inv!31069 _values!1445) e!732133)))

(declare-fun array_inv!31070 (array!84457) Bool)

(assert (=> start!108558 (array_inv!31070 _keys!1741)))

(assert (=> start!108558 tp!99426))

(declare-fun b!1281430 () Bool)

(declare-fun res!851249 () Bool)

(assert (=> b!1281430 (=> (not res!851249) (not e!732135))))

(assert (=> b!1281430 (= res!851249 (contains!7775 (getCurrentListMap!4704 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281431 () Bool)

(declare-fun res!851242 () Bool)

(assert (=> b!1281431 (=> (not res!851242) (not e!732135))))

(assert (=> b!1281431 (= res!851242 (and (= (size!41286 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41285 _keys!1741) (size!41286 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281432 () Bool)

(declare-fun res!851248 () Bool)

(assert (=> b!1281432 (=> (not res!851248) (not e!732135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84457 (_ BitVec 32)) Bool)

(assert (=> b!1281432 (= res!851248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52169 () Bool)

(declare-fun tp!99425 () Bool)

(assert (=> mapNonEmpty!52169 (= mapRes!52169 (and tp!99425 e!732138))))

(declare-fun mapRest!52169 () (Array (_ BitVec 32) ValueCell!15974))

(declare-fun mapKey!52169 () (_ BitVec 32))

(declare-fun mapValue!52169 () ValueCell!15974)

(assert (=> mapNonEmpty!52169 (= (arr!40734 _values!1445) (store mapRest!52169 mapKey!52169 mapValue!52169))))

(assert (= (and start!108558 res!851246) b!1281431))

(assert (= (and b!1281431 res!851242) b!1281432))

(assert (= (and b!1281432 res!851248) b!1281422))

(assert (= (and b!1281422 res!851244) b!1281424))

(assert (= (and b!1281424 res!851243) b!1281430))

(assert (= (and b!1281430 res!851249) b!1281427))

(assert (= (and b!1281427 res!851247) b!1281425))

(assert (= (and b!1281425 (not res!851245)) b!1281426))

(assert (= (and b!1281429 condMapEmpty!52169) mapIsEmpty!52169))

(assert (= (and b!1281429 (not condMapEmpty!52169)) mapNonEmpty!52169))

(get-info :version)

(assert (= (and mapNonEmpty!52169 ((_ is ValueCellFull!15974) mapValue!52169)) b!1281423))

(assert (= (and b!1281429 ((_ is ValueCellFull!15974) mapDefault!52169)) b!1281428))

(assert (= start!108558 b!1281429))

(declare-fun m!1175397 () Bool)

(assert (=> b!1281427 m!1175397))

(declare-fun m!1175399 () Bool)

(assert (=> b!1281425 m!1175399))

(assert (=> b!1281425 m!1175399))

(declare-fun m!1175401 () Bool)

(assert (=> b!1281425 m!1175401))

(declare-fun m!1175403 () Bool)

(assert (=> b!1281425 m!1175403))

(declare-fun m!1175405 () Bool)

(assert (=> b!1281430 m!1175405))

(assert (=> b!1281430 m!1175405))

(declare-fun m!1175407 () Bool)

(assert (=> b!1281430 m!1175407))

(declare-fun m!1175409 () Bool)

(assert (=> b!1281432 m!1175409))

(declare-fun m!1175411 () Bool)

(assert (=> b!1281422 m!1175411))

(declare-fun m!1175413 () Bool)

(assert (=> mapNonEmpty!52169 m!1175413))

(declare-fun m!1175415 () Bool)

(assert (=> start!108558 m!1175415))

(declare-fun m!1175417 () Bool)

(assert (=> start!108558 m!1175417))

(declare-fun m!1175419 () Bool)

(assert (=> start!108558 m!1175419))

(declare-fun m!1175421 () Bool)

(assert (=> b!1281426 m!1175421))

(declare-fun m!1175423 () Bool)

(assert (=> b!1281426 m!1175423))

(check-sat (not b_next!28105) (not b!1281422) (not b!1281426) b_and!46147 (not b!1281425) tp_is_empty!33745 (not b!1281430) (not start!108558) (not b!1281432) (not mapNonEmpty!52169))
(check-sat b_and!46147 (not b_next!28105))
