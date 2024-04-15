; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108736 () Bool)

(assert start!108736)

(declare-fun b_free!28249 () Bool)

(declare-fun b_next!28249 () Bool)

(assert (=> start!108736 (= b_free!28249 (not b_next!28249))))

(declare-fun tp!99864 () Bool)

(declare-fun b_and!46297 () Bool)

(assert (=> start!108736 (= tp!99864 b_and!46297)))

(declare-fun b!1283856 () Bool)

(declare-fun res!852888 () Bool)

(declare-fun e!733401 () Bool)

(assert (=> b!1283856 (=> (not res!852888) (not e!733401))))

(declare-datatypes ((array!84739 0))(
  ( (array!84740 (arr!40872 (Array (_ BitVec 32) (_ BitVec 64))) (size!41424 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84739)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84739 (_ BitVec 32)) Bool)

(assert (=> b!1283856 (= res!852888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!852880 () Bool)

(assert (=> start!108736 (=> (not res!852880) (not e!733401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108736 (= res!852880 (validMask!0 mask!2175))))

(assert (=> start!108736 e!733401))

(declare-fun tp_is_empty!33889 () Bool)

(assert (=> start!108736 tp_is_empty!33889))

(assert (=> start!108736 true))

(declare-datatypes ((V!50289 0))(
  ( (V!50290 (val!17019 Int)) )
))
(declare-datatypes ((ValueCell!16046 0))(
  ( (ValueCellFull!16046 (v!19620 V!50289)) (EmptyCell!16046) )
))
(declare-datatypes ((array!84741 0))(
  ( (array!84742 (arr!40873 (Array (_ BitVec 32) ValueCell!16046)) (size!41425 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84741)

(declare-fun e!733398 () Bool)

(declare-fun array_inv!31161 (array!84741) Bool)

(assert (=> start!108736 (and (array_inv!31161 _values!1445) e!733398)))

(declare-fun array_inv!31162 (array!84739) Bool)

(assert (=> start!108736 (array_inv!31162 _keys!1741)))

(assert (=> start!108736 tp!99864))

(declare-fun b!1283857 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1283857 (= e!733401 (not (bvsle from!2144 (size!41424 _keys!1741))))))

(declare-datatypes ((tuple2!21874 0))(
  ( (tuple2!21875 (_1!10948 (_ BitVec 64)) (_2!10948 V!50289)) )
))
(declare-datatypes ((List!29058 0))(
  ( (Nil!29055) (Cons!29054 (h!30263 tuple2!21874) (t!42594 List!29058)) )
))
(declare-datatypes ((ListLongMap!19531 0))(
  ( (ListLongMap!19532 (toList!9781 List!29058)) )
))
(declare-fun lt!576558 () ListLongMap!19531)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7828 (ListLongMap!19531 (_ BitVec 64)) Bool)

(assert (=> b!1283857 (contains!7828 lt!576558 k0!1205)))

(declare-fun minValue!1387 () V!50289)

(declare-datatypes ((Unit!42343 0))(
  ( (Unit!42344) )
))
(declare-fun lt!576557 () Unit!42343)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!22 ((_ BitVec 64) (_ BitVec 64) V!50289 ListLongMap!19531) Unit!42343)

(assert (=> b!1283857 (= lt!576557 (lemmaInListMapAfterAddingDiffThenInBefore!22 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576558))))

(declare-fun zeroValue!1387 () V!50289)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4337 (ListLongMap!19531 tuple2!21874) ListLongMap!19531)

(declare-fun getCurrentListMapNoExtraKeys!5968 (array!84739 array!84741 (_ BitVec 32) (_ BitVec 32) V!50289 V!50289 (_ BitVec 32) Int) ListLongMap!19531)

(assert (=> b!1283857 (= lt!576558 (+!4337 (getCurrentListMapNoExtraKeys!5968 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283858 () Bool)

(declare-fun e!733399 () Bool)

(assert (=> b!1283858 (= e!733399 tp_is_empty!33889)))

(declare-fun mapIsEmpty!52391 () Bool)

(declare-fun mapRes!52391 () Bool)

(assert (=> mapIsEmpty!52391 mapRes!52391))

(declare-fun b!1283859 () Bool)

(declare-fun res!852886 () Bool)

(assert (=> b!1283859 (=> (not res!852886) (not e!733401))))

(assert (=> b!1283859 (= res!852886 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41424 _keys!1741))))))

(declare-fun b!1283860 () Bool)

(declare-fun res!852881 () Bool)

(assert (=> b!1283860 (=> (not res!852881) (not e!733401))))

(assert (=> b!1283860 (= res!852881 (and (= (size!41425 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41424 _keys!1741) (size!41425 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283861 () Bool)

(declare-fun res!852883 () Bool)

(assert (=> b!1283861 (=> (not res!852883) (not e!733401))))

(assert (=> b!1283861 (= res!852883 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41424 _keys!1741))))))

(declare-fun b!1283862 () Bool)

(declare-fun res!852884 () Bool)

(assert (=> b!1283862 (=> (not res!852884) (not e!733401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283862 (= res!852884 (validKeyInArray!0 (select (arr!40872 _keys!1741) from!2144)))))

(declare-fun b!1283863 () Bool)

(declare-fun e!733397 () Bool)

(assert (=> b!1283863 (= e!733397 tp_is_empty!33889)))

(declare-fun b!1283864 () Bool)

(assert (=> b!1283864 (= e!733398 (and e!733399 mapRes!52391))))

(declare-fun condMapEmpty!52391 () Bool)

(declare-fun mapDefault!52391 () ValueCell!16046)

(assert (=> b!1283864 (= condMapEmpty!52391 (= (arr!40873 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16046)) mapDefault!52391)))))

(declare-fun b!1283865 () Bool)

(declare-fun res!852882 () Bool)

(assert (=> b!1283865 (=> (not res!852882) (not e!733401))))

(assert (=> b!1283865 (= res!852882 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!52391 () Bool)

(declare-fun tp!99863 () Bool)

(assert (=> mapNonEmpty!52391 (= mapRes!52391 (and tp!99863 e!733397))))

(declare-fun mapKey!52391 () (_ BitVec 32))

(declare-fun mapValue!52391 () ValueCell!16046)

(declare-fun mapRest!52391 () (Array (_ BitVec 32) ValueCell!16046))

(assert (=> mapNonEmpty!52391 (= (arr!40873 _values!1445) (store mapRest!52391 mapKey!52391 mapValue!52391))))

(declare-fun b!1283866 () Bool)

(declare-fun res!852885 () Bool)

(assert (=> b!1283866 (=> (not res!852885) (not e!733401))))

(declare-datatypes ((List!29059 0))(
  ( (Nil!29056) (Cons!29055 (h!30264 (_ BitVec 64)) (t!42595 List!29059)) )
))
(declare-fun arrayNoDuplicates!0 (array!84739 (_ BitVec 32) List!29059) Bool)

(assert (=> b!1283866 (= res!852885 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29056))))

(declare-fun b!1283867 () Bool)

(declare-fun res!852887 () Bool)

(assert (=> b!1283867 (=> (not res!852887) (not e!733401))))

(declare-fun getCurrentListMap!4751 (array!84739 array!84741 (_ BitVec 32) (_ BitVec 32) V!50289 V!50289 (_ BitVec 32) Int) ListLongMap!19531)

(assert (=> b!1283867 (= res!852887 (contains!7828 (getCurrentListMap!4751 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108736 res!852880) b!1283860))

(assert (= (and b!1283860 res!852881) b!1283856))

(assert (= (and b!1283856 res!852888) b!1283866))

(assert (= (and b!1283866 res!852885) b!1283861))

(assert (= (and b!1283861 res!852883) b!1283867))

(assert (= (and b!1283867 res!852887) b!1283859))

(assert (= (and b!1283859 res!852886) b!1283862))

(assert (= (and b!1283862 res!852884) b!1283865))

(assert (= (and b!1283865 res!852882) b!1283857))

(assert (= (and b!1283864 condMapEmpty!52391) mapIsEmpty!52391))

(assert (= (and b!1283864 (not condMapEmpty!52391)) mapNonEmpty!52391))

(get-info :version)

(assert (= (and mapNonEmpty!52391 ((_ is ValueCellFull!16046) mapValue!52391)) b!1283863))

(assert (= (and b!1283864 ((_ is ValueCellFull!16046) mapDefault!52391)) b!1283858))

(assert (= start!108736 b!1283864))

(declare-fun m!1177237 () Bool)

(assert (=> b!1283862 m!1177237))

(assert (=> b!1283862 m!1177237))

(declare-fun m!1177239 () Bool)

(assert (=> b!1283862 m!1177239))

(declare-fun m!1177241 () Bool)

(assert (=> mapNonEmpty!52391 m!1177241))

(declare-fun m!1177243 () Bool)

(assert (=> start!108736 m!1177243))

(declare-fun m!1177245 () Bool)

(assert (=> start!108736 m!1177245))

(declare-fun m!1177247 () Bool)

(assert (=> start!108736 m!1177247))

(declare-fun m!1177249 () Bool)

(assert (=> b!1283867 m!1177249))

(assert (=> b!1283867 m!1177249))

(declare-fun m!1177251 () Bool)

(assert (=> b!1283867 m!1177251))

(declare-fun m!1177253 () Bool)

(assert (=> b!1283857 m!1177253))

(declare-fun m!1177255 () Bool)

(assert (=> b!1283857 m!1177255))

(declare-fun m!1177257 () Bool)

(assert (=> b!1283857 m!1177257))

(assert (=> b!1283857 m!1177257))

(declare-fun m!1177259 () Bool)

(assert (=> b!1283857 m!1177259))

(declare-fun m!1177261 () Bool)

(assert (=> b!1283856 m!1177261))

(declare-fun m!1177263 () Bool)

(assert (=> b!1283866 m!1177263))

(check-sat (not start!108736) (not b!1283862) (not b!1283867) (not mapNonEmpty!52391) (not b!1283866) (not b_next!28249) (not b!1283856) (not b!1283857) b_and!46297 tp_is_empty!33889)
(check-sat b_and!46297 (not b_next!28249))
