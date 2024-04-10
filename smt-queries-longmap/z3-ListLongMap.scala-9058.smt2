; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109134 () Bool)

(assert start!109134)

(declare-fun b_free!28623 () Bool)

(declare-fun b_next!28623 () Bool)

(assert (=> start!109134 (= b_free!28623 (not b_next!28623))))

(declare-fun tp!100987 () Bool)

(declare-fun b_and!46713 () Bool)

(assert (=> start!109134 (= tp!100987 b_and!46713)))

(declare-fun b!1290497 () Bool)

(declare-fun res!857314 () Bool)

(declare-fun e!736746 () Bool)

(assert (=> b!1290497 (=> (not res!857314) (not e!736746))))

(declare-datatypes ((array!85566 0))(
  ( (array!85567 (arr!41284 (Array (_ BitVec 32) (_ BitVec 64))) (size!41834 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85566)

(declare-datatypes ((List!29274 0))(
  ( (Nil!29271) (Cons!29270 (h!30479 (_ BitVec 64)) (t!42838 List!29274)) )
))
(declare-fun arrayNoDuplicates!0 (array!85566 (_ BitVec 32) List!29274) Bool)

(assert (=> b!1290497 (= res!857314 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29271))))

(declare-fun b!1290498 () Bool)

(declare-fun e!736745 () Bool)

(declare-fun tp_is_empty!34263 () Bool)

(assert (=> b!1290498 (= e!736745 tp_is_empty!34263)))

(declare-fun res!857313 () Bool)

(assert (=> start!109134 (=> (not res!857313) (not e!736746))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109134 (= res!857313 (validMask!0 mask!2175))))

(assert (=> start!109134 e!736746))

(assert (=> start!109134 tp_is_empty!34263))

(assert (=> start!109134 true))

(declare-datatypes ((V!50787 0))(
  ( (V!50788 (val!17206 Int)) )
))
(declare-datatypes ((ValueCell!16233 0))(
  ( (ValueCellFull!16233 (v!19809 V!50787)) (EmptyCell!16233) )
))
(declare-datatypes ((array!85568 0))(
  ( (array!85569 (arr!41285 (Array (_ BitVec 32) ValueCell!16233)) (size!41835 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85568)

(declare-fun e!736747 () Bool)

(declare-fun array_inv!31289 (array!85568) Bool)

(assert (=> start!109134 (and (array_inv!31289 _values!1445) e!736747)))

(declare-fun array_inv!31290 (array!85566) Bool)

(assert (=> start!109134 (array_inv!31290 _keys!1741)))

(assert (=> start!109134 tp!100987))

(declare-fun b!1290499 () Bool)

(declare-fun e!736748 () Bool)

(declare-fun mapRes!52955 () Bool)

(assert (=> b!1290499 (= e!736747 (and e!736748 mapRes!52955))))

(declare-fun condMapEmpty!52955 () Bool)

(declare-fun mapDefault!52955 () ValueCell!16233)

(assert (=> b!1290499 (= condMapEmpty!52955 (= (arr!41285 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16233)) mapDefault!52955)))))

(declare-fun b!1290500 () Bool)

(declare-fun res!857317 () Bool)

(assert (=> b!1290500 (=> (not res!857317) (not e!736746))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290500 (= res!857317 (and (= (size!41835 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41834 _keys!1741) (size!41835 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290501 () Bool)

(declare-fun res!857316 () Bool)

(assert (=> b!1290501 (=> (not res!857316) (not e!736746))))

(declare-fun minValue!1387 () V!50787)

(declare-fun zeroValue!1387 () V!50787)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22108 0))(
  ( (tuple2!22109 (_1!11065 (_ BitVec 64)) (_2!11065 V!50787)) )
))
(declare-datatypes ((List!29275 0))(
  ( (Nil!29272) (Cons!29271 (h!30480 tuple2!22108) (t!42839 List!29275)) )
))
(declare-datatypes ((ListLongMap!19765 0))(
  ( (ListLongMap!19766 (toList!9898 List!29275)) )
))
(declare-fun contains!8016 (ListLongMap!19765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4956 (array!85566 array!85568 (_ BitVec 32) (_ BitVec 32) V!50787 V!50787 (_ BitVec 32) Int) ListLongMap!19765)

(assert (=> b!1290501 (= res!857316 (contains!8016 (getCurrentListMap!4956 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290502 () Bool)

(assert (=> b!1290502 (= e!736748 tp_is_empty!34263)))

(declare-fun b!1290503 () Bool)

(declare-fun e!736743 () Bool)

(assert (=> b!1290503 (= e!736743 true)))

(declare-fun lt!578657 () ListLongMap!19765)

(declare-fun lt!578655 () tuple2!22108)

(declare-fun lt!578652 () Bool)

(declare-fun +!4366 (ListLongMap!19765 tuple2!22108) ListLongMap!19765)

(assert (=> b!1290503 (= lt!578652 (contains!8016 (+!4366 lt!578657 lt!578655) k0!1205))))

(declare-fun lt!578654 () ListLongMap!19765)

(assert (=> b!1290503 (not (contains!8016 (+!4366 lt!578654 lt!578655) k0!1205))))

(assert (=> b!1290503 (= lt!578655 (tuple2!22109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-datatypes ((Unit!42710 0))(
  ( (Unit!42711) )
))
(declare-fun lt!578653 () Unit!42710)

(declare-fun addStillNotContains!384 (ListLongMap!19765 (_ BitVec 64) V!50787 (_ BitVec 64)) Unit!42710)

(assert (=> b!1290503 (= lt!578653 (addStillNotContains!384 lt!578654 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290503 (not (contains!8016 lt!578657 k0!1205))))

(assert (=> b!1290503 (= lt!578657 (+!4366 lt!578654 (tuple2!22109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578656 () Unit!42710)

(assert (=> b!1290503 (= lt!578656 (addStillNotContains!384 lt!578654 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5997 (array!85566 array!85568 (_ BitVec 32) (_ BitVec 32) V!50787 V!50787 (_ BitVec 32) Int) ListLongMap!19765)

(assert (=> b!1290503 (= lt!578654 (getCurrentListMapNoExtraKeys!5997 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52955 () Bool)

(assert (=> mapIsEmpty!52955 mapRes!52955))

(declare-fun b!1290504 () Bool)

(declare-fun res!857318 () Bool)

(assert (=> b!1290504 (=> (not res!857318) (not e!736746))))

(assert (=> b!1290504 (= res!857318 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41834 _keys!1741))))))

(declare-fun mapNonEmpty!52955 () Bool)

(declare-fun tp!100988 () Bool)

(assert (=> mapNonEmpty!52955 (= mapRes!52955 (and tp!100988 e!736745))))

(declare-fun mapValue!52955 () ValueCell!16233)

(declare-fun mapRest!52955 () (Array (_ BitVec 32) ValueCell!16233))

(declare-fun mapKey!52955 () (_ BitVec 32))

(assert (=> mapNonEmpty!52955 (= (arr!41285 _values!1445) (store mapRest!52955 mapKey!52955 mapValue!52955))))

(declare-fun b!1290505 () Bool)

(declare-fun res!857319 () Bool)

(assert (=> b!1290505 (=> (not res!857319) (not e!736746))))

(assert (=> b!1290505 (= res!857319 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41834 _keys!1741))))))

(declare-fun b!1290506 () Bool)

(declare-fun res!857311 () Bool)

(assert (=> b!1290506 (=> (not res!857311) (not e!736746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290506 (= res!857311 (not (validKeyInArray!0 (select (arr!41284 _keys!1741) from!2144))))))

(declare-fun b!1290507 () Bool)

(declare-fun res!857312 () Bool)

(assert (=> b!1290507 (=> (not res!857312) (not e!736746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85566 (_ BitVec 32)) Bool)

(assert (=> b!1290507 (= res!857312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290508 () Bool)

(assert (=> b!1290508 (= e!736746 (not e!736743))))

(declare-fun res!857315 () Bool)

(assert (=> b!1290508 (=> res!857315 e!736743)))

(assert (=> b!1290508 (= res!857315 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290508 (not (contains!8016 (ListLongMap!19766 Nil!29272) k0!1205))))

(declare-fun lt!578651 () Unit!42710)

(declare-fun emptyContainsNothing!81 ((_ BitVec 64)) Unit!42710)

(assert (=> b!1290508 (= lt!578651 (emptyContainsNothing!81 k0!1205))))

(assert (= (and start!109134 res!857313) b!1290500))

(assert (= (and b!1290500 res!857317) b!1290507))

(assert (= (and b!1290507 res!857312) b!1290497))

(assert (= (and b!1290497 res!857314) b!1290504))

(assert (= (and b!1290504 res!857318) b!1290501))

(assert (= (and b!1290501 res!857316) b!1290505))

(assert (= (and b!1290505 res!857319) b!1290506))

(assert (= (and b!1290506 res!857311) b!1290508))

(assert (= (and b!1290508 (not res!857315)) b!1290503))

(assert (= (and b!1290499 condMapEmpty!52955) mapIsEmpty!52955))

(assert (= (and b!1290499 (not condMapEmpty!52955)) mapNonEmpty!52955))

(get-info :version)

(assert (= (and mapNonEmpty!52955 ((_ is ValueCellFull!16233) mapValue!52955)) b!1290498))

(assert (= (and b!1290499 ((_ is ValueCellFull!16233) mapDefault!52955)) b!1290502))

(assert (= start!109134 b!1290499))

(declare-fun m!1183091 () Bool)

(assert (=> b!1290497 m!1183091))

(declare-fun m!1183093 () Bool)

(assert (=> b!1290507 m!1183093))

(declare-fun m!1183095 () Bool)

(assert (=> b!1290508 m!1183095))

(declare-fun m!1183097 () Bool)

(assert (=> b!1290508 m!1183097))

(declare-fun m!1183099 () Bool)

(assert (=> mapNonEmpty!52955 m!1183099))

(declare-fun m!1183101 () Bool)

(assert (=> b!1290503 m!1183101))

(declare-fun m!1183103 () Bool)

(assert (=> b!1290503 m!1183103))

(declare-fun m!1183105 () Bool)

(assert (=> b!1290503 m!1183105))

(declare-fun m!1183107 () Bool)

(assert (=> b!1290503 m!1183107))

(declare-fun m!1183109 () Bool)

(assert (=> b!1290503 m!1183109))

(declare-fun m!1183111 () Bool)

(assert (=> b!1290503 m!1183111))

(declare-fun m!1183113 () Bool)

(assert (=> b!1290503 m!1183113))

(assert (=> b!1290503 m!1183101))

(declare-fun m!1183115 () Bool)

(assert (=> b!1290503 m!1183115))

(assert (=> b!1290503 m!1183105))

(declare-fun m!1183117 () Bool)

(assert (=> b!1290503 m!1183117))

(declare-fun m!1183119 () Bool)

(assert (=> start!109134 m!1183119))

(declare-fun m!1183121 () Bool)

(assert (=> start!109134 m!1183121))

(declare-fun m!1183123 () Bool)

(assert (=> start!109134 m!1183123))

(declare-fun m!1183125 () Bool)

(assert (=> b!1290506 m!1183125))

(assert (=> b!1290506 m!1183125))

(declare-fun m!1183127 () Bool)

(assert (=> b!1290506 m!1183127))

(declare-fun m!1183129 () Bool)

(assert (=> b!1290501 m!1183129))

(assert (=> b!1290501 m!1183129))

(declare-fun m!1183131 () Bool)

(assert (=> b!1290501 m!1183131))

(check-sat tp_is_empty!34263 (not b!1290503) (not start!109134) (not b_next!28623) (not b!1290506) b_and!46713 (not mapNonEmpty!52955) (not b!1290501) (not b!1290497) (not b!1290507) (not b!1290508))
(check-sat b_and!46713 (not b_next!28623))
