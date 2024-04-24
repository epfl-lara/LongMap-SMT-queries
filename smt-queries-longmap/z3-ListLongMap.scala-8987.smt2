; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108906 () Bool)

(assert start!108906)

(declare-fun b_free!28195 () Bool)

(declare-fun b_next!28195 () Bool)

(assert (=> start!108906 (= b_free!28195 (not b_next!28195))))

(declare-fun tp!99700 () Bool)

(declare-fun b_and!46263 () Bool)

(assert (=> start!108906 (= tp!99700 b_and!46263)))

(declare-fun b!1284253 () Bool)

(declare-fun res!852704 () Bool)

(declare-fun e!733869 () Bool)

(assert (=> b!1284253 (=> (not res!852704) (not e!733869))))

(declare-datatypes ((array!84765 0))(
  ( (array!84766 (arr!40880 (Array (_ BitVec 32) (_ BitVec 64))) (size!41431 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84765)

(declare-datatypes ((List!28988 0))(
  ( (Nil!28985) (Cons!28984 (h!30202 (_ BitVec 64)) (t!42524 List!28988)) )
))
(declare-fun arrayNoDuplicates!0 (array!84765 (_ BitVec 32) List!28988) Bool)

(assert (=> b!1284253 (= res!852704 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28985))))

(declare-fun mapIsEmpty!52310 () Bool)

(declare-fun mapRes!52310 () Bool)

(assert (=> mapIsEmpty!52310 mapRes!52310))

(declare-fun b!1284254 () Bool)

(declare-fun res!852705 () Bool)

(assert (=> b!1284254 (=> (not res!852705) (not e!733869))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1284254 (= res!852705 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41431 _keys!1741))))))

(declare-fun mapNonEmpty!52310 () Bool)

(declare-fun tp!99701 () Bool)

(declare-fun e!733870 () Bool)

(assert (=> mapNonEmpty!52310 (= mapRes!52310 (and tp!99701 e!733870))))

(declare-datatypes ((V!50217 0))(
  ( (V!50218 (val!16992 Int)) )
))
(declare-datatypes ((ValueCell!16019 0))(
  ( (ValueCellFull!16019 (v!19589 V!50217)) (EmptyCell!16019) )
))
(declare-fun mapValue!52310 () ValueCell!16019)

(declare-datatypes ((array!84767 0))(
  ( (array!84768 (arr!40881 (Array (_ BitVec 32) ValueCell!16019)) (size!41432 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84767)

(declare-fun mapKey!52310 () (_ BitVec 32))

(declare-fun mapRest!52310 () (Array (_ BitVec 32) ValueCell!16019))

(assert (=> mapNonEmpty!52310 (= (arr!40881 _values!1445) (store mapRest!52310 mapKey!52310 mapValue!52310))))

(declare-fun b!1284255 () Bool)

(declare-fun e!733872 () Bool)

(declare-fun tp_is_empty!33835 () Bool)

(assert (=> b!1284255 (= e!733872 tp_is_empty!33835)))

(declare-fun b!1284256 () Bool)

(declare-fun res!852701 () Bool)

(assert (=> b!1284256 (=> (not res!852701) (not e!733869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284256 (= res!852701 (validKeyInArray!0 (select (arr!40880 _keys!1741) from!2144)))))

(declare-fun b!1284258 () Bool)

(declare-fun res!852699 () Bool)

(assert (=> b!1284258 (=> (not res!852699) (not e!733869))))

(assert (=> b!1284258 (= res!852699 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41431 _keys!1741))))))

(declare-fun b!1284259 () Bool)

(declare-fun res!852700 () Bool)

(assert (=> b!1284259 (=> (not res!852700) (not e!733869))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284259 (= res!852700 (and (= (size!41432 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41431 _keys!1741) (size!41432 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284260 () Bool)

(declare-fun e!733871 () Bool)

(assert (=> b!1284260 (= e!733871 (and e!733872 mapRes!52310))))

(declare-fun condMapEmpty!52310 () Bool)

(declare-fun mapDefault!52310 () ValueCell!16019)

(assert (=> b!1284260 (= condMapEmpty!52310 (= (arr!40881 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16019)) mapDefault!52310)))))

(declare-fun b!1284261 () Bool)

(assert (=> b!1284261 (= e!733869 false)))

(declare-fun minValue!1387 () V!50217)

(declare-fun zeroValue!1387 () V!50217)

(declare-fun lt!577064 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21776 0))(
  ( (tuple2!21777 (_1!10899 (_ BitVec 64)) (_2!10899 V!50217)) )
))
(declare-datatypes ((List!28989 0))(
  ( (Nil!28986) (Cons!28985 (h!30203 tuple2!21776) (t!42525 List!28989)) )
))
(declare-datatypes ((ListLongMap!19441 0))(
  ( (ListLongMap!19442 (toList!9736 List!28989)) )
))
(declare-fun contains!7867 (ListLongMap!19441 (_ BitVec 64)) Bool)

(declare-fun +!4323 (ListLongMap!19441 tuple2!21776) ListLongMap!19441)

(declare-fun getCurrentListMapNoExtraKeys!5955 (array!84765 array!84767 (_ BitVec 32) (_ BitVec 32) V!50217 V!50217 (_ BitVec 32) Int) ListLongMap!19441)

(assert (=> b!1284261 (= lt!577064 (contains!7867 (+!4323 (+!4323 (getCurrentListMapNoExtraKeys!5955 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!21777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1284262 () Bool)

(assert (=> b!1284262 (= e!733870 tp_is_empty!33835)))

(declare-fun b!1284263 () Bool)

(declare-fun res!852703 () Bool)

(assert (=> b!1284263 (=> (not res!852703) (not e!733869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84765 (_ BitVec 32)) Bool)

(assert (=> b!1284263 (= res!852703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284264 () Bool)

(declare-fun res!852706 () Bool)

(assert (=> b!1284264 (=> (not res!852706) (not e!733869))))

(declare-fun getCurrentListMap!4805 (array!84765 array!84767 (_ BitVec 32) (_ BitVec 32) V!50217 V!50217 (_ BitVec 32) Int) ListLongMap!19441)

(assert (=> b!1284264 (= res!852706 (contains!7867 (getCurrentListMap!4805 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!852702 () Bool)

(assert (=> start!108906 (=> (not res!852702) (not e!733869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108906 (= res!852702 (validMask!0 mask!2175))))

(assert (=> start!108906 e!733869))

(assert (=> start!108906 tp_is_empty!33835))

(assert (=> start!108906 true))

(declare-fun array_inv!31221 (array!84767) Bool)

(assert (=> start!108906 (and (array_inv!31221 _values!1445) e!733871)))

(declare-fun array_inv!31222 (array!84765) Bool)

(assert (=> start!108906 (array_inv!31222 _keys!1741)))

(assert (=> start!108906 tp!99700))

(declare-fun b!1284257 () Bool)

(declare-fun res!852698 () Bool)

(assert (=> b!1284257 (=> (not res!852698) (not e!733869))))

(assert (=> b!1284257 (= res!852698 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!108906 res!852702) b!1284259))

(assert (= (and b!1284259 res!852700) b!1284263))

(assert (= (and b!1284263 res!852703) b!1284253))

(assert (= (and b!1284253 res!852704) b!1284258))

(assert (= (and b!1284258 res!852699) b!1284264))

(assert (= (and b!1284264 res!852706) b!1284254))

(assert (= (and b!1284254 res!852705) b!1284256))

(assert (= (and b!1284256 res!852701) b!1284257))

(assert (= (and b!1284257 res!852698) b!1284261))

(assert (= (and b!1284260 condMapEmpty!52310) mapIsEmpty!52310))

(assert (= (and b!1284260 (not condMapEmpty!52310)) mapNonEmpty!52310))

(get-info :version)

(assert (= (and mapNonEmpty!52310 ((_ is ValueCellFull!16019) mapValue!52310)) b!1284262))

(assert (= (and b!1284260 ((_ is ValueCellFull!16019) mapDefault!52310)) b!1284255))

(assert (= start!108906 b!1284260))

(declare-fun m!1178593 () Bool)

(assert (=> b!1284256 m!1178593))

(assert (=> b!1284256 m!1178593))

(declare-fun m!1178595 () Bool)

(assert (=> b!1284256 m!1178595))

(declare-fun m!1178597 () Bool)

(assert (=> start!108906 m!1178597))

(declare-fun m!1178599 () Bool)

(assert (=> start!108906 m!1178599))

(declare-fun m!1178601 () Bool)

(assert (=> start!108906 m!1178601))

(declare-fun m!1178603 () Bool)

(assert (=> b!1284263 m!1178603))

(declare-fun m!1178605 () Bool)

(assert (=> b!1284261 m!1178605))

(assert (=> b!1284261 m!1178605))

(declare-fun m!1178607 () Bool)

(assert (=> b!1284261 m!1178607))

(assert (=> b!1284261 m!1178607))

(declare-fun m!1178609 () Bool)

(assert (=> b!1284261 m!1178609))

(assert (=> b!1284261 m!1178609))

(declare-fun m!1178611 () Bool)

(assert (=> b!1284261 m!1178611))

(declare-fun m!1178613 () Bool)

(assert (=> b!1284264 m!1178613))

(assert (=> b!1284264 m!1178613))

(declare-fun m!1178615 () Bool)

(assert (=> b!1284264 m!1178615))

(declare-fun m!1178617 () Bool)

(assert (=> mapNonEmpty!52310 m!1178617))

(declare-fun m!1178619 () Bool)

(assert (=> b!1284253 m!1178619))

(check-sat (not b!1284263) (not b!1284256) (not mapNonEmpty!52310) (not start!108906) (not b_next!28195) (not b!1284253) b_and!46263 tp_is_empty!33835 (not b!1284261) (not b!1284264))
(check-sat b_and!46263 (not b_next!28195))
