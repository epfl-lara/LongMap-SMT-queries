; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108816 () Bool)

(assert start!108816)

(declare-fun b_free!28329 () Bool)

(declare-fun b_next!28329 () Bool)

(assert (=> start!108816 (= b_free!28329 (not b_next!28329))))

(declare-fun tp!100103 () Bool)

(declare-fun b_and!46395 () Bool)

(assert (=> start!108816 (= tp!100103 b_and!46395)))

(declare-fun b!1285063 () Bool)

(declare-fun res!853691 () Bool)

(declare-fun e!734028 () Bool)

(assert (=> b!1285063 (=> (not res!853691) (not e!734028))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84996 0))(
  ( (array!84997 (arr!41000 (Array (_ BitVec 32) (_ BitVec 64))) (size!41550 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84996)

(assert (=> b!1285063 (= res!853691 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41550 _keys!1741))))))

(declare-fun b!1285064 () Bool)

(declare-fun res!853698 () Bool)

(assert (=> b!1285064 (=> (not res!853698) (not e!734028))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84996 (_ BitVec 32)) Bool)

(assert (=> b!1285064 (= res!853698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285065 () Bool)

(declare-fun res!853696 () Bool)

(assert (=> b!1285065 (=> (not res!853696) (not e!734028))))

(declare-datatypes ((V!50395 0))(
  ( (V!50396 (val!17059 Int)) )
))
(declare-fun zeroValue!1387 () V!50395)

(declare-datatypes ((ValueCell!16086 0))(
  ( (ValueCellFull!16086 (v!19661 V!50395)) (EmptyCell!16086) )
))
(declare-datatypes ((array!84998 0))(
  ( (array!84999 (arr!41001 (Array (_ BitVec 32) ValueCell!16086)) (size!41551 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84998)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!50395)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21860 0))(
  ( (tuple2!21861 (_1!10941 (_ BitVec 64)) (_2!10941 V!50395)) )
))
(declare-datatypes ((List!29053 0))(
  ( (Nil!29050) (Cons!29049 (h!30258 tuple2!21860) (t!42597 List!29053)) )
))
(declare-datatypes ((ListLongMap!19517 0))(
  ( (ListLongMap!19518 (toList!9774 List!29053)) )
))
(declare-fun contains!7891 (ListLongMap!19517 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4852 (array!84996 array!84998 (_ BitVec 32) (_ BitVec 32) V!50395 V!50395 (_ BitVec 32) Int) ListLongMap!19517)

(assert (=> b!1285065 (= res!853696 (contains!7891 (getCurrentListMap!4852 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285066 () Bool)

(declare-fun res!853697 () Bool)

(assert (=> b!1285066 (=> (not res!853697) (not e!734028))))

(declare-datatypes ((List!29054 0))(
  ( (Nil!29051) (Cons!29050 (h!30259 (_ BitVec 64)) (t!42598 List!29054)) )
))
(declare-fun arrayNoDuplicates!0 (array!84996 (_ BitVec 32) List!29054) Bool)

(assert (=> b!1285066 (= res!853697 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29051))))

(declare-fun mapNonEmpty!52511 () Bool)

(declare-fun mapRes!52511 () Bool)

(declare-fun tp!100102 () Bool)

(declare-fun e!734026 () Bool)

(assert (=> mapNonEmpty!52511 (= mapRes!52511 (and tp!100102 e!734026))))

(declare-fun mapValue!52511 () ValueCell!16086)

(declare-fun mapRest!52511 () (Array (_ BitVec 32) ValueCell!16086))

(declare-fun mapKey!52511 () (_ BitVec 32))

(assert (=> mapNonEmpty!52511 (= (arr!41001 _values!1445) (store mapRest!52511 mapKey!52511 mapValue!52511))))

(declare-fun res!853690 () Bool)

(assert (=> start!108816 (=> (not res!853690) (not e!734028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108816 (= res!853690 (validMask!0 mask!2175))))

(assert (=> start!108816 e!734028))

(declare-fun tp_is_empty!33969 () Bool)

(assert (=> start!108816 tp_is_empty!33969))

(assert (=> start!108816 true))

(declare-fun e!734027 () Bool)

(declare-fun array_inv!31095 (array!84998) Bool)

(assert (=> start!108816 (and (array_inv!31095 _values!1445) e!734027)))

(declare-fun array_inv!31096 (array!84996) Bool)

(assert (=> start!108816 (array_inv!31096 _keys!1741)))

(assert (=> start!108816 tp!100103))

(declare-fun b!1285067 () Bool)

(declare-fun res!853692 () Bool)

(assert (=> b!1285067 (=> (not res!853692) (not e!734028))))

(assert (=> b!1285067 (= res!853692 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1285068 () Bool)

(declare-fun res!853693 () Bool)

(assert (=> b!1285068 (=> (not res!853693) (not e!734028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285068 (= res!853693 (validKeyInArray!0 (select (arr!41000 _keys!1741) from!2144)))))

(declare-fun b!1285069 () Bool)

(declare-fun res!853695 () Bool)

(assert (=> b!1285069 (=> (not res!853695) (not e!734028))))

(assert (=> b!1285069 (= res!853695 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41550 _keys!1741))))))

(declare-fun b!1285070 () Bool)

(assert (=> b!1285070 (= e!734026 tp_is_empty!33969)))

(declare-fun b!1285071 () Bool)

(declare-fun e!734030 () Bool)

(assert (=> b!1285071 (= e!734030 tp_is_empty!33969)))

(declare-fun b!1285072 () Bool)

(declare-fun res!853694 () Bool)

(assert (=> b!1285072 (=> (not res!853694) (not e!734028))))

(assert (=> b!1285072 (= res!853694 (and (= (size!41551 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41550 _keys!1741) (size!41551 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285073 () Bool)

(assert (=> b!1285073 (= e!734027 (and e!734030 mapRes!52511))))

(declare-fun condMapEmpty!52511 () Bool)

(declare-fun mapDefault!52511 () ValueCell!16086)

(assert (=> b!1285073 (= condMapEmpty!52511 (= (arr!41001 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16086)) mapDefault!52511)))))

(declare-fun mapIsEmpty!52511 () Bool)

(assert (=> mapIsEmpty!52511 mapRes!52511))

(declare-fun b!1285074 () Bool)

(assert (=> b!1285074 (= e!734028 false)))

(declare-fun lt!576871 () Bool)

(declare-fun +!4305 (ListLongMap!19517 tuple2!21860) ListLongMap!19517)

(declare-fun getCurrentListMapNoExtraKeys!5935 (array!84996 array!84998 (_ BitVec 32) (_ BitVec 32) V!50395 V!50395 (_ BitVec 32) Int) ListLongMap!19517)

(assert (=> b!1285074 (= lt!576871 (contains!7891 (+!4305 (getCurrentListMapNoExtraKeys!5935 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(assert (= (and start!108816 res!853690) b!1285072))

(assert (= (and b!1285072 res!853694) b!1285064))

(assert (= (and b!1285064 res!853698) b!1285066))

(assert (= (and b!1285066 res!853697) b!1285069))

(assert (= (and b!1285069 res!853695) b!1285065))

(assert (= (and b!1285065 res!853696) b!1285063))

(assert (= (and b!1285063 res!853691) b!1285068))

(assert (= (and b!1285068 res!853693) b!1285067))

(assert (= (and b!1285067 res!853692) b!1285074))

(assert (= (and b!1285073 condMapEmpty!52511) mapIsEmpty!52511))

(assert (= (and b!1285073 (not condMapEmpty!52511)) mapNonEmpty!52511))

(get-info :version)

(assert (= (and mapNonEmpty!52511 ((_ is ValueCellFull!16086) mapValue!52511)) b!1285070))

(assert (= (and b!1285073 ((_ is ValueCellFull!16086) mapDefault!52511)) b!1285071))

(assert (= start!108816 b!1285073))

(declare-fun m!1178537 () Bool)

(assert (=> b!1285068 m!1178537))

(assert (=> b!1285068 m!1178537))

(declare-fun m!1178539 () Bool)

(assert (=> b!1285068 m!1178539))

(declare-fun m!1178541 () Bool)

(assert (=> b!1285066 m!1178541))

(declare-fun m!1178543 () Bool)

(assert (=> start!108816 m!1178543))

(declare-fun m!1178545 () Bool)

(assert (=> start!108816 m!1178545))

(declare-fun m!1178547 () Bool)

(assert (=> start!108816 m!1178547))

(declare-fun m!1178549 () Bool)

(assert (=> b!1285064 m!1178549))

(declare-fun m!1178551 () Bool)

(assert (=> mapNonEmpty!52511 m!1178551))

(declare-fun m!1178553 () Bool)

(assert (=> b!1285065 m!1178553))

(assert (=> b!1285065 m!1178553))

(declare-fun m!1178555 () Bool)

(assert (=> b!1285065 m!1178555))

(declare-fun m!1178557 () Bool)

(assert (=> b!1285074 m!1178557))

(assert (=> b!1285074 m!1178557))

(declare-fun m!1178559 () Bool)

(assert (=> b!1285074 m!1178559))

(assert (=> b!1285074 m!1178559))

(declare-fun m!1178561 () Bool)

(assert (=> b!1285074 m!1178561))

(check-sat (not b!1285064) (not b!1285068) (not b_next!28329) tp_is_empty!33969 (not b!1285065) (not mapNonEmpty!52511) (not b!1285066) b_and!46395 (not b!1285074) (not start!108816))
(check-sat b_and!46395 (not b_next!28329))
