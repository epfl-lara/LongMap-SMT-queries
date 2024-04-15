; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108814 () Bool)

(assert start!108814)

(declare-fun b_free!28327 () Bool)

(declare-fun b_next!28327 () Bool)

(assert (=> start!108814 (= b_free!28327 (not b_next!28327))))

(declare-fun tp!100097 () Bool)

(declare-fun b_and!46375 () Bool)

(assert (=> start!108814 (= tp!100097 b_and!46375)))

(declare-fun b!1284963 () Bool)

(declare-fun e!733982 () Bool)

(declare-fun tp_is_empty!33967 () Bool)

(assert (=> b!1284963 (= e!733982 tp_is_empty!33967)))

(declare-fun b!1284964 () Bool)

(declare-fun res!853640 () Bool)

(declare-fun e!733986 () Bool)

(assert (=> b!1284964 (=> (not res!853640) (not e!733986))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50393 0))(
  ( (V!50394 (val!17058 Int)) )
))
(declare-datatypes ((ValueCell!16085 0))(
  ( (ValueCellFull!16085 (v!19659 V!50393)) (EmptyCell!16085) )
))
(declare-datatypes ((array!84883 0))(
  ( (array!84884 (arr!40944 (Array (_ BitVec 32) ValueCell!16085)) (size!41496 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84883)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84885 0))(
  ( (array!84886 (arr!40945 (Array (_ BitVec 32) (_ BitVec 64))) (size!41497 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84885)

(assert (=> b!1284964 (= res!853640 (and (= (size!41496 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41497 _keys!1741) (size!41496 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52508 () Bool)

(declare-fun mapRes!52508 () Bool)

(assert (=> mapIsEmpty!52508 mapRes!52508))

(declare-fun b!1284965 () Bool)

(declare-fun res!853643 () Bool)

(assert (=> b!1284965 (=> (not res!853643) (not e!733986))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284965 (= res!853643 (validKeyInArray!0 (select (arr!40945 _keys!1741) from!2144)))))

(declare-fun b!1284966 () Bool)

(declare-fun res!853642 () Bool)

(assert (=> b!1284966 (=> (not res!853642) (not e!733986))))

(assert (=> b!1284966 (= res!853642 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41497 _keys!1741))))))

(declare-fun b!1284967 () Bool)

(declare-fun res!853641 () Bool)

(assert (=> b!1284967 (=> (not res!853641) (not e!733986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84885 (_ BitVec 32)) Bool)

(assert (=> b!1284967 (= res!853641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284968 () Bool)

(declare-fun e!733983 () Bool)

(assert (=> b!1284968 (= e!733983 tp_is_empty!33967)))

(declare-fun b!1284969 () Bool)

(declare-fun res!853636 () Bool)

(assert (=> b!1284969 (=> (not res!853636) (not e!733986))))

(assert (=> b!1284969 (= res!853636 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1284970 () Bool)

(declare-fun res!853637 () Bool)

(assert (=> b!1284970 (=> (not res!853637) (not e!733986))))

(declare-datatypes ((List!29111 0))(
  ( (Nil!29108) (Cons!29107 (h!30316 (_ BitVec 64)) (t!42647 List!29111)) )
))
(declare-fun arrayNoDuplicates!0 (array!84885 (_ BitVec 32) List!29111) Bool)

(assert (=> b!1284970 (= res!853637 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29108))))

(declare-fun res!853639 () Bool)

(assert (=> start!108814 (=> (not res!853639) (not e!733986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108814 (= res!853639 (validMask!0 mask!2175))))

(assert (=> start!108814 e!733986))

(assert (=> start!108814 tp_is_empty!33967))

(assert (=> start!108814 true))

(declare-fun e!733985 () Bool)

(declare-fun array_inv!31217 (array!84883) Bool)

(assert (=> start!108814 (and (array_inv!31217 _values!1445) e!733985)))

(declare-fun array_inv!31218 (array!84885) Bool)

(assert (=> start!108814 (array_inv!31218 _keys!1741)))

(assert (=> start!108814 tp!100097))

(declare-fun b!1284971 () Bool)

(assert (=> b!1284971 (= e!733985 (and e!733982 mapRes!52508))))

(declare-fun condMapEmpty!52508 () Bool)

(declare-fun mapDefault!52508 () ValueCell!16085)

(assert (=> b!1284971 (= condMapEmpty!52508 (= (arr!40944 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16085)) mapDefault!52508)))))

(declare-fun b!1284972 () Bool)

(assert (=> b!1284972 (= e!733986 false)))

(declare-fun minValue!1387 () V!50393)

(declare-fun lt!576690 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!50393)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21932 0))(
  ( (tuple2!21933 (_1!10977 (_ BitVec 64)) (_2!10977 V!50393)) )
))
(declare-datatypes ((List!29112 0))(
  ( (Nil!29109) (Cons!29108 (h!30317 tuple2!21932) (t!42648 List!29112)) )
))
(declare-datatypes ((ListLongMap!19589 0))(
  ( (ListLongMap!19590 (toList!9810 List!29112)) )
))
(declare-fun contains!7857 (ListLongMap!19589 (_ BitVec 64)) Bool)

(declare-fun +!4344 (ListLongMap!19589 tuple2!21932) ListLongMap!19589)

(declare-fun getCurrentListMapNoExtraKeys!5975 (array!84885 array!84883 (_ BitVec 32) (_ BitVec 32) V!50393 V!50393 (_ BitVec 32) Int) ListLongMap!19589)

(assert (=> b!1284972 (= lt!576690 (contains!7857 (+!4344 (getCurrentListMapNoExtraKeys!5975 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun b!1284973 () Bool)

(declare-fun res!853644 () Bool)

(assert (=> b!1284973 (=> (not res!853644) (not e!733986))))

(declare-fun getCurrentListMap!4780 (array!84885 array!84883 (_ BitVec 32) (_ BitVec 32) V!50393 V!50393 (_ BitVec 32) Int) ListLongMap!19589)

(assert (=> b!1284973 (= res!853644 (contains!7857 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284974 () Bool)

(declare-fun res!853638 () Bool)

(assert (=> b!1284974 (=> (not res!853638) (not e!733986))))

(assert (=> b!1284974 (= res!853638 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41497 _keys!1741))))))

(declare-fun mapNonEmpty!52508 () Bool)

(declare-fun tp!100098 () Bool)

(assert (=> mapNonEmpty!52508 (= mapRes!52508 (and tp!100098 e!733983))))

(declare-fun mapValue!52508 () ValueCell!16085)

(declare-fun mapRest!52508 () (Array (_ BitVec 32) ValueCell!16085))

(declare-fun mapKey!52508 () (_ BitVec 32))

(assert (=> mapNonEmpty!52508 (= (arr!40944 _values!1445) (store mapRest!52508 mapKey!52508 mapValue!52508))))

(assert (= (and start!108814 res!853639) b!1284964))

(assert (= (and b!1284964 res!853640) b!1284967))

(assert (= (and b!1284967 res!853641) b!1284970))

(assert (= (and b!1284970 res!853637) b!1284966))

(assert (= (and b!1284966 res!853642) b!1284973))

(assert (= (and b!1284973 res!853644) b!1284974))

(assert (= (and b!1284974 res!853638) b!1284965))

(assert (= (and b!1284965 res!853643) b!1284969))

(assert (= (and b!1284969 res!853636) b!1284972))

(assert (= (and b!1284971 condMapEmpty!52508) mapIsEmpty!52508))

(assert (= (and b!1284971 (not condMapEmpty!52508)) mapNonEmpty!52508))

(get-info :version)

(assert (= (and mapNonEmpty!52508 ((_ is ValueCellFull!16085) mapValue!52508)) b!1284968))

(assert (= (and b!1284971 ((_ is ValueCellFull!16085) mapDefault!52508)) b!1284963))

(assert (= start!108814 b!1284971))

(declare-fun m!1178011 () Bool)

(assert (=> b!1284970 m!1178011))

(declare-fun m!1178013 () Bool)

(assert (=> b!1284973 m!1178013))

(assert (=> b!1284973 m!1178013))

(declare-fun m!1178015 () Bool)

(assert (=> b!1284973 m!1178015))

(declare-fun m!1178017 () Bool)

(assert (=> b!1284965 m!1178017))

(assert (=> b!1284965 m!1178017))

(declare-fun m!1178019 () Bool)

(assert (=> b!1284965 m!1178019))

(declare-fun m!1178021 () Bool)

(assert (=> start!108814 m!1178021))

(declare-fun m!1178023 () Bool)

(assert (=> start!108814 m!1178023))

(declare-fun m!1178025 () Bool)

(assert (=> start!108814 m!1178025))

(declare-fun m!1178027 () Bool)

(assert (=> mapNonEmpty!52508 m!1178027))

(declare-fun m!1178029 () Bool)

(assert (=> b!1284972 m!1178029))

(assert (=> b!1284972 m!1178029))

(declare-fun m!1178031 () Bool)

(assert (=> b!1284972 m!1178031))

(assert (=> b!1284972 m!1178031))

(declare-fun m!1178033 () Bool)

(assert (=> b!1284972 m!1178033))

(declare-fun m!1178035 () Bool)

(assert (=> b!1284967 m!1178035))

(check-sat b_and!46375 (not b!1284970) (not b!1284973) (not b!1284972) (not b_next!28327) (not mapNonEmpty!52508) tp_is_empty!33967 (not b!1284967) (not start!108814) (not b!1284965))
(check-sat b_and!46375 (not b_next!28327))
