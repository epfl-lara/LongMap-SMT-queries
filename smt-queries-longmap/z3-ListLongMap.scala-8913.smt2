; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108352 () Bool)

(assert start!108352)

(declare-fun b_free!27841 () Bool)

(declare-fun b_next!27841 () Bool)

(assert (=> start!108352 (= b_free!27841 (not b_next!27841))))

(declare-fun tp!98476 () Bool)

(declare-fun b_and!45899 () Bool)

(assert (=> start!108352 (= tp!98476 b_and!45899)))

(declare-fun b!1278250 () Bool)

(declare-fun e!730075 () Bool)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1278250 (= e!730075 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1278251 () Bool)

(declare-fun e!730071 () Bool)

(declare-fun e!730072 () Bool)

(declare-fun mapRes!51617 () Bool)

(assert (=> b!1278251 (= e!730071 (and e!730072 mapRes!51617))))

(declare-fun condMapEmpty!51617 () Bool)

(declare-datatypes ((V!49625 0))(
  ( (V!49626 (val!16770 Int)) )
))
(declare-datatypes ((ValueCell!15797 0))(
  ( (ValueCellFull!15797 (v!19362 V!49625)) (EmptyCell!15797) )
))
(declare-datatypes ((array!83903 0))(
  ( (array!83904 (arr!40458 (Array (_ BitVec 32) ValueCell!15797)) (size!41009 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83903)

(declare-fun mapDefault!51617 () ValueCell!15797)

(assert (=> b!1278251 (= condMapEmpty!51617 (= (arr!40458 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15797)) mapDefault!51617)))))

(declare-fun b!1278252 () Bool)

(declare-fun res!849092 () Bool)

(declare-fun e!730070 () Bool)

(assert (=> b!1278252 (=> (not res!849092) (not e!730070))))

(declare-datatypes ((array!83905 0))(
  ( (array!83906 (arr!40459 (Array (_ BitVec 32) (_ BitVec 64))) (size!41010 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83905)

(assert (=> b!1278252 (= res!849092 (bvslt #b00000000000000000000000000000000 (size!41010 _keys!1427)))))

(declare-fun b!1278253 () Bool)

(declare-fun arrayContainsKey!0 (array!83905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278253 (= e!730075 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun b!1278254 () Bool)

(declare-fun res!849089 () Bool)

(assert (=> b!1278254 (=> (not res!849089) (not e!730070))))

(declare-fun mask!1805 () (_ BitVec 32))

(assert (=> b!1278254 (= res!849089 (and (= (size!41009 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41010 _keys!1427) (size!41009 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1278255 () Bool)

(declare-fun res!849091 () Bool)

(assert (=> b!1278255 (=> (not res!849091) (not e!730070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83905 (_ BitVec 32)) Bool)

(assert (=> b!1278255 (= res!849091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51617 () Bool)

(assert (=> mapIsEmpty!51617 mapRes!51617))

(declare-fun b!1278256 () Bool)

(declare-fun e!730074 () Bool)

(declare-fun tp_is_empty!33391 () Bool)

(assert (=> b!1278256 (= e!730074 tp_is_empty!33391)))

(declare-fun b!1278257 () Bool)

(assert (=> b!1278257 (= e!730072 tp_is_empty!33391)))

(declare-fun res!849094 () Bool)

(assert (=> start!108352 (=> (not res!849094) (not e!730070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108352 (= res!849094 (validMask!0 mask!1805))))

(assert (=> start!108352 e!730070))

(assert (=> start!108352 true))

(assert (=> start!108352 tp!98476))

(assert (=> start!108352 tp_is_empty!33391))

(declare-fun array_inv!30927 (array!83903) Bool)

(assert (=> start!108352 (and (array_inv!30927 _values!1187) e!730071)))

(declare-fun array_inv!30928 (array!83905) Bool)

(assert (=> start!108352 (array_inv!30928 _keys!1427)))

(declare-fun b!1278258 () Bool)

(declare-fun res!849090 () Bool)

(assert (=> b!1278258 (=> (not res!849090) (not e!730070))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49625)

(declare-fun zeroValue!1129 () V!49625)

(declare-datatypes ((tuple2!21528 0))(
  ( (tuple2!21529 (_1!10775 (_ BitVec 64)) (_2!10775 V!49625)) )
))
(declare-datatypes ((List!28717 0))(
  ( (Nil!28714) (Cons!28713 (h!29931 tuple2!21528) (t!42245 List!28717)) )
))
(declare-datatypes ((ListLongMap!19193 0))(
  ( (ListLongMap!19194 (toList!9612 List!28717)) )
))
(declare-fun contains!7736 (ListLongMap!19193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4681 (array!83905 array!83903 (_ BitVec 32) (_ BitVec 32) V!49625 V!49625 (_ BitVec 32) Int) ListLongMap!19193)

(assert (=> b!1278258 (= res!849090 (contains!7736 (getCurrentListMap!4681 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1278259 () Bool)

(assert (=> b!1278259 (= e!730070 (not true))))

(assert (=> b!1278259 e!730075))

(declare-fun c!124345 () Bool)

(assert (=> b!1278259 (= c!124345 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!42334 0))(
  ( (Unit!42335) )
))
(declare-fun lt!576038 () Unit!42334)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!630 (array!83905 array!83903 (_ BitVec 32) (_ BitVec 32) V!49625 V!49625 (_ BitVec 64) (_ BitVec 32) Int) Unit!42334)

(assert (=> b!1278259 (= lt!576038 (lemmaListMapContainsThenArrayContainsFrom!630 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun mapNonEmpty!51617 () Bool)

(declare-fun tp!98477 () Bool)

(assert (=> mapNonEmpty!51617 (= mapRes!51617 (and tp!98477 e!730074))))

(declare-fun mapKey!51617 () (_ BitVec 32))

(declare-fun mapValue!51617 () ValueCell!15797)

(declare-fun mapRest!51617 () (Array (_ BitVec 32) ValueCell!15797))

(assert (=> mapNonEmpty!51617 (= (arr!40458 _values!1187) (store mapRest!51617 mapKey!51617 mapValue!51617))))

(declare-fun b!1278260 () Bool)

(declare-fun res!849093 () Bool)

(assert (=> b!1278260 (=> (not res!849093) (not e!730070))))

(declare-datatypes ((List!28718 0))(
  ( (Nil!28715) (Cons!28714 (h!29932 (_ BitVec 64)) (t!42246 List!28718)) )
))
(declare-fun arrayNoDuplicates!0 (array!83905 (_ BitVec 32) List!28718) Bool)

(assert (=> b!1278260 (= res!849093 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28715))))

(assert (= (and start!108352 res!849094) b!1278254))

(assert (= (and b!1278254 res!849089) b!1278255))

(assert (= (and b!1278255 res!849091) b!1278260))

(assert (= (and b!1278260 res!849093) b!1278258))

(assert (= (and b!1278258 res!849090) b!1278252))

(assert (= (and b!1278252 res!849092) b!1278259))

(assert (= (and b!1278259 c!124345) b!1278253))

(assert (= (and b!1278259 (not c!124345)) b!1278250))

(assert (= (and b!1278251 condMapEmpty!51617) mapIsEmpty!51617))

(assert (= (and b!1278251 (not condMapEmpty!51617)) mapNonEmpty!51617))

(get-info :version)

(assert (= (and mapNonEmpty!51617 ((_ is ValueCellFull!15797) mapValue!51617)) b!1278256))

(assert (= (and b!1278251 ((_ is ValueCellFull!15797) mapDefault!51617)) b!1278257))

(assert (= start!108352 b!1278251))

(declare-fun m!1174329 () Bool)

(assert (=> start!108352 m!1174329))

(declare-fun m!1174331 () Bool)

(assert (=> start!108352 m!1174331))

(declare-fun m!1174333 () Bool)

(assert (=> start!108352 m!1174333))

(declare-fun m!1174335 () Bool)

(assert (=> b!1278259 m!1174335))

(declare-fun m!1174337 () Bool)

(assert (=> b!1278255 m!1174337))

(declare-fun m!1174339 () Bool)

(assert (=> b!1278260 m!1174339))

(declare-fun m!1174341 () Bool)

(assert (=> b!1278258 m!1174341))

(assert (=> b!1278258 m!1174341))

(declare-fun m!1174343 () Bool)

(assert (=> b!1278258 m!1174343))

(declare-fun m!1174345 () Bool)

(assert (=> mapNonEmpty!51617 m!1174345))

(declare-fun m!1174347 () Bool)

(assert (=> b!1278253 m!1174347))

(check-sat (not b!1278258) (not b!1278260) (not b!1278259) (not b_next!27841) tp_is_empty!33391 (not mapNonEmpty!51617) (not start!108352) (not b!1278255) b_and!45899 (not b!1278253))
(check-sat b_and!45899 (not b_next!27841))
