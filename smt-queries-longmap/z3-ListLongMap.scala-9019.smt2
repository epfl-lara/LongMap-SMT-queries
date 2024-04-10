; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108876 () Bool)

(assert start!108876)

(declare-fun b_free!28389 () Bool)

(declare-fun b_next!28389 () Bool)

(assert (=> start!108876 (= b_free!28389 (not b_next!28389))))

(declare-fun tp!100283 () Bool)

(declare-fun b_and!46455 () Bool)

(assert (=> start!108876 (= tp!100283 b_and!46455)))

(declare-fun b!1285846 () Bool)

(declare-fun res!854211 () Bool)

(declare-fun e!734477 () Bool)

(assert (=> b!1285846 (=> (not res!854211) (not e!734477))))

(declare-datatypes ((V!50475 0))(
  ( (V!50476 (val!17089 Int)) )
))
(declare-fun minValue!1387 () V!50475)

(declare-fun zeroValue!1387 () V!50475)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16116 0))(
  ( (ValueCellFull!16116 (v!19691 V!50475)) (EmptyCell!16116) )
))
(declare-datatypes ((array!85112 0))(
  ( (array!85113 (arr!41058 (Array (_ BitVec 32) ValueCell!16116)) (size!41608 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85112)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85114 0))(
  ( (array!85115 (arr!41059 (Array (_ BitVec 32) (_ BitVec 64))) (size!41609 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85114)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21910 0))(
  ( (tuple2!21911 (_1!10966 (_ BitVec 64)) (_2!10966 V!50475)) )
))
(declare-datatypes ((List!29096 0))(
  ( (Nil!29093) (Cons!29092 (h!30301 tuple2!21910) (t!42640 List!29096)) )
))
(declare-datatypes ((ListLongMap!19567 0))(
  ( (ListLongMap!19568 (toList!9799 List!29096)) )
))
(declare-fun contains!7916 (ListLongMap!19567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4877 (array!85114 array!85112 (_ BitVec 32) (_ BitVec 32) V!50475 V!50475 (_ BitVec 32) Int) ListLongMap!19567)

(assert (=> b!1285846 (= res!854211 (contains!7916 (getCurrentListMap!4877 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52601 () Bool)

(declare-fun mapRes!52601 () Bool)

(assert (=> mapIsEmpty!52601 mapRes!52601))

(declare-fun b!1285847 () Bool)

(declare-fun res!854210 () Bool)

(assert (=> b!1285847 (=> (not res!854210) (not e!734477))))

(declare-datatypes ((List!29097 0))(
  ( (Nil!29094) (Cons!29093 (h!30302 (_ BitVec 64)) (t!42641 List!29097)) )
))
(declare-fun arrayNoDuplicates!0 (array!85114 (_ BitVec 32) List!29097) Bool)

(assert (=> b!1285847 (= res!854210 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29094))))

(declare-fun b!1285848 () Bool)

(declare-fun res!854203 () Bool)

(assert (=> b!1285848 (=> (not res!854203) (not e!734477))))

(assert (=> b!1285848 (= res!854203 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41609 _keys!1741))))))

(declare-fun b!1285849 () Bool)

(declare-fun res!854208 () Bool)

(assert (=> b!1285849 (=> (not res!854208) (not e!734477))))

(assert (=> b!1285849 (= res!854208 (and (= (size!41608 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41609 _keys!1741) (size!41608 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285850 () Bool)

(assert (=> b!1285850 (= e!734477 false)))

(declare-fun lt!576952 () Bool)

(declare-fun +!4308 (ListLongMap!19567 tuple2!21910) ListLongMap!19567)

(declare-fun getCurrentListMapNoExtraKeys!5938 (array!85114 array!85112 (_ BitVec 32) (_ BitVec 32) V!50475 V!50475 (_ BitVec 32) Int) ListLongMap!19567)

(assert (=> b!1285850 (= lt!576952 (contains!7916 (+!4308 (getCurrentListMapNoExtraKeys!5938 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1285851 () Bool)

(declare-fun e!734479 () Bool)

(declare-fun e!734478 () Bool)

(assert (=> b!1285851 (= e!734479 (and e!734478 mapRes!52601))))

(declare-fun condMapEmpty!52601 () Bool)

(declare-fun mapDefault!52601 () ValueCell!16116)

(assert (=> b!1285851 (= condMapEmpty!52601 (= (arr!41058 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16116)) mapDefault!52601)))))

(declare-fun b!1285852 () Bool)

(declare-fun res!854207 () Bool)

(assert (=> b!1285852 (=> (not res!854207) (not e!734477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285852 (= res!854207 (validKeyInArray!0 (select (arr!41059 _keys!1741) from!2144)))))

(declare-fun b!1285853 () Bool)

(declare-fun e!734480 () Bool)

(declare-fun tp_is_empty!34029 () Bool)

(assert (=> b!1285853 (= e!734480 tp_is_empty!34029)))

(declare-fun b!1285855 () Bool)

(declare-fun res!854206 () Bool)

(assert (=> b!1285855 (=> (not res!854206) (not e!734477))))

(assert (=> b!1285855 (= res!854206 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41609 _keys!1741))))))

(declare-fun mapNonEmpty!52601 () Bool)

(declare-fun tp!100282 () Bool)

(assert (=> mapNonEmpty!52601 (= mapRes!52601 (and tp!100282 e!734480))))

(declare-fun mapKey!52601 () (_ BitVec 32))

(declare-fun mapRest!52601 () (Array (_ BitVec 32) ValueCell!16116))

(declare-fun mapValue!52601 () ValueCell!16116)

(assert (=> mapNonEmpty!52601 (= (arr!41058 _values!1445) (store mapRest!52601 mapKey!52601 mapValue!52601))))

(declare-fun b!1285854 () Bool)

(declare-fun res!854209 () Bool)

(assert (=> b!1285854 (=> (not res!854209) (not e!734477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85114 (_ BitVec 32)) Bool)

(assert (=> b!1285854 (= res!854209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!854204 () Bool)

(assert (=> start!108876 (=> (not res!854204) (not e!734477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108876 (= res!854204 (validMask!0 mask!2175))))

(assert (=> start!108876 e!734477))

(assert (=> start!108876 tp_is_empty!34029))

(assert (=> start!108876 true))

(declare-fun array_inv!31135 (array!85112) Bool)

(assert (=> start!108876 (and (array_inv!31135 _values!1445) e!734479)))

(declare-fun array_inv!31136 (array!85114) Bool)

(assert (=> start!108876 (array_inv!31136 _keys!1741)))

(assert (=> start!108876 tp!100283))

(declare-fun b!1285856 () Bool)

(assert (=> b!1285856 (= e!734478 tp_is_empty!34029)))

(declare-fun b!1285857 () Bool)

(declare-fun res!854205 () Bool)

(assert (=> b!1285857 (=> (not res!854205) (not e!734477))))

(assert (=> b!1285857 (= res!854205 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!108876 res!854204) b!1285849))

(assert (= (and b!1285849 res!854208) b!1285854))

(assert (= (and b!1285854 res!854209) b!1285847))

(assert (= (and b!1285847 res!854210) b!1285855))

(assert (= (and b!1285855 res!854206) b!1285846))

(assert (= (and b!1285846 res!854211) b!1285848))

(assert (= (and b!1285848 res!854203) b!1285852))

(assert (= (and b!1285852 res!854207) b!1285857))

(assert (= (and b!1285857 res!854205) b!1285850))

(assert (= (and b!1285851 condMapEmpty!52601) mapIsEmpty!52601))

(assert (= (and b!1285851 (not condMapEmpty!52601)) mapNonEmpty!52601))

(get-info :version)

(assert (= (and mapNonEmpty!52601 ((_ is ValueCellFull!16116) mapValue!52601)) b!1285853))

(assert (= (and b!1285851 ((_ is ValueCellFull!16116) mapDefault!52601)) b!1285856))

(assert (= start!108876 b!1285851))

(declare-fun m!1179059 () Bool)

(assert (=> b!1285854 m!1179059))

(declare-fun m!1179061 () Bool)

(assert (=> b!1285852 m!1179061))

(assert (=> b!1285852 m!1179061))

(declare-fun m!1179063 () Bool)

(assert (=> b!1285852 m!1179063))

(declare-fun m!1179065 () Bool)

(assert (=> b!1285850 m!1179065))

(assert (=> b!1285850 m!1179065))

(declare-fun m!1179067 () Bool)

(assert (=> b!1285850 m!1179067))

(assert (=> b!1285850 m!1179067))

(declare-fun m!1179069 () Bool)

(assert (=> b!1285850 m!1179069))

(declare-fun m!1179071 () Bool)

(assert (=> mapNonEmpty!52601 m!1179071))

(declare-fun m!1179073 () Bool)

(assert (=> start!108876 m!1179073))

(declare-fun m!1179075 () Bool)

(assert (=> start!108876 m!1179075))

(declare-fun m!1179077 () Bool)

(assert (=> start!108876 m!1179077))

(declare-fun m!1179079 () Bool)

(assert (=> b!1285847 m!1179079))

(declare-fun m!1179081 () Bool)

(assert (=> b!1285846 m!1179081))

(assert (=> b!1285846 m!1179081))

(declare-fun m!1179083 () Bool)

(assert (=> b!1285846 m!1179083))

(check-sat (not mapNonEmpty!52601) (not b!1285852) (not b_next!28389) (not start!108876) (not b!1285850) (not b!1285847) b_and!46455 tp_is_empty!34029 (not b!1285846) (not b!1285854))
(check-sat b_and!46455 (not b_next!28389))
