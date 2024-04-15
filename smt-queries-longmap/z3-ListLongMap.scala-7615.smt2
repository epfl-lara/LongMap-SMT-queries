; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96004 () Bool)

(assert start!96004)

(declare-fun b_free!22663 () Bool)

(declare-fun b_next!22663 () Bool)

(assert (=> start!96004 (= b_free!22663 (not b_next!22663))))

(declare-fun tp!79837 () Bool)

(declare-fun b_and!35975 () Bool)

(assert (=> start!96004 (= tp!79837 b_and!35975)))

(declare-fun b!1088173 () Bool)

(declare-fun e!621557 () Bool)

(declare-fun tp_is_empty!26665 () Bool)

(assert (=> b!1088173 (= e!621557 tp_is_empty!26665)))

(declare-fun b!1088174 () Bool)

(declare-fun e!621553 () Bool)

(declare-fun e!621554 () Bool)

(assert (=> b!1088174 (= e!621553 (not e!621554))))

(declare-fun res!725804 () Bool)

(assert (=> b!1088174 (=> res!725804 e!621554)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088174 (= res!725804 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40681 0))(
  ( (V!40682 (val!13389 Int)) )
))
(declare-fun minValue!831 () V!40681)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((array!70180 0))(
  ( (array!70181 (arr!33764 (Array (_ BitVec 32) (_ BitVec 64))) (size!34302 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70180)

(declare-datatypes ((ValueCell!12623 0))(
  ( (ValueCellFull!12623 (v!16009 V!40681)) (EmptyCell!12623) )
))
(declare-datatypes ((array!70182 0))(
  ( (array!70183 (arr!33765 (Array (_ BitVec 32) ValueCell!12623)) (size!34303 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70182)

(declare-datatypes ((tuple2!17056 0))(
  ( (tuple2!17057 (_1!8539 (_ BitVec 64)) (_2!8539 V!40681)) )
))
(declare-datatypes ((List!23623 0))(
  ( (Nil!23620) (Cons!23619 (h!24828 tuple2!17056) (t!33335 List!23623)) )
))
(declare-datatypes ((ListLongMap!15025 0))(
  ( (ListLongMap!15026 (toList!7528 List!23623)) )
))
(declare-fun lt!484506 () ListLongMap!15025)

(declare-fun zeroValue!831 () V!40681)

(declare-fun getCurrentListMap!4209 (array!70180 array!70182 (_ BitVec 32) (_ BitVec 32) V!40681 V!40681 (_ BitVec 32) Int) ListLongMap!15025)

(assert (=> b!1088174 (= lt!484506 (getCurrentListMap!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484497 () array!70182)

(declare-fun lt!484503 () array!70180)

(declare-fun lt!484496 () ListLongMap!15025)

(assert (=> b!1088174 (= lt!484496 (getCurrentListMap!4209 lt!484503 lt!484497 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484501 () ListLongMap!15025)

(declare-fun lt!484507 () ListLongMap!15025)

(assert (=> b!1088174 (and (= lt!484501 lt!484507) (= lt!484507 lt!484501))))

(declare-fun lt!484498 () ListLongMap!15025)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!806 (ListLongMap!15025 (_ BitVec 64)) ListLongMap!15025)

(assert (=> b!1088174 (= lt!484507 (-!806 lt!484498 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35647 0))(
  ( (Unit!35648) )
))
(declare-fun lt!484505 () Unit!35647)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!93 (array!70180 array!70182 (_ BitVec 32) (_ BitVec 32) V!40681 V!40681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35647)

(assert (=> b!1088174 (= lt!484505 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!93 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4079 (array!70180 array!70182 (_ BitVec 32) (_ BitVec 32) V!40681 V!40681 (_ BitVec 32) Int) ListLongMap!15025)

(assert (=> b!1088174 (= lt!484501 (getCurrentListMapNoExtraKeys!4079 lt!484503 lt!484497 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2150 (Int (_ BitVec 64)) V!40681)

(assert (=> b!1088174 (= lt!484497 (array!70183 (store (arr!33765 _values!874) i!650 (ValueCellFull!12623 (dynLambda!2150 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34303 _values!874)))))

(assert (=> b!1088174 (= lt!484498 (getCurrentListMapNoExtraKeys!4079 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088174 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484499 () Unit!35647)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70180 (_ BitVec 64) (_ BitVec 32)) Unit!35647)

(assert (=> b!1088174 (= lt!484499 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088175 () Bool)

(declare-fun res!725802 () Bool)

(declare-fun e!621556 () Bool)

(assert (=> b!1088175 (=> (not res!725802) (not e!621556))))

(assert (=> b!1088175 (= res!725802 (and (= (size!34303 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34302 _keys!1070) (size!34303 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088176 () Bool)

(declare-fun res!725803 () Bool)

(assert (=> b!1088176 (=> (not res!725803) (not e!621556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088176 (= res!725803 (validKeyInArray!0 k0!904))))

(declare-fun res!725797 () Bool)

(assert (=> start!96004 (=> (not res!725797) (not e!621556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96004 (= res!725797 (validMask!0 mask!1414))))

(assert (=> start!96004 e!621556))

(assert (=> start!96004 tp!79837))

(assert (=> start!96004 true))

(assert (=> start!96004 tp_is_empty!26665))

(declare-fun array_inv!26090 (array!70180) Bool)

(assert (=> start!96004 (array_inv!26090 _keys!1070)))

(declare-fun e!621555 () Bool)

(declare-fun array_inv!26091 (array!70182) Bool)

(assert (=> start!96004 (and (array_inv!26091 _values!874) e!621555)))

(declare-fun b!1088177 () Bool)

(assert (=> b!1088177 (= e!621556 e!621553)))

(declare-fun res!725805 () Bool)

(assert (=> b!1088177 (=> (not res!725805) (not e!621553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70180 (_ BitVec 32)) Bool)

(assert (=> b!1088177 (= res!725805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484503 mask!1414))))

(assert (=> b!1088177 (= lt!484503 (array!70181 (store (arr!33764 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34302 _keys!1070)))))

(declare-fun b!1088178 () Bool)

(declare-fun res!725801 () Bool)

(assert (=> b!1088178 (=> (not res!725801) (not e!621556))))

(assert (=> b!1088178 (= res!725801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088179 () Bool)

(declare-fun e!621552 () Bool)

(assert (=> b!1088179 (= e!621554 e!621552)))

(declare-fun res!725798 () Bool)

(assert (=> b!1088179 (=> res!725798 e!621552)))

(assert (=> b!1088179 (= res!725798 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484500 () ListLongMap!15025)

(assert (=> b!1088179 (= lt!484496 lt!484500)))

(declare-fun lt!484502 () tuple2!17056)

(declare-fun +!3331 (ListLongMap!15025 tuple2!17056) ListLongMap!15025)

(assert (=> b!1088179 (= lt!484500 (+!3331 lt!484507 lt!484502))))

(declare-fun lt!484508 () ListLongMap!15025)

(assert (=> b!1088179 (= lt!484506 lt!484508)))

(assert (=> b!1088179 (= lt!484508 (+!3331 lt!484498 lt!484502))))

(assert (=> b!1088179 (= lt!484496 (+!3331 lt!484501 lt!484502))))

(assert (=> b!1088179 (= lt!484502 (tuple2!17057 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088180 () Bool)

(declare-fun res!725795 () Bool)

(assert (=> b!1088180 (=> (not res!725795) (not e!621556))))

(declare-datatypes ((List!23624 0))(
  ( (Nil!23621) (Cons!23620 (h!24829 (_ BitVec 64)) (t!33336 List!23624)) )
))
(declare-fun arrayNoDuplicates!0 (array!70180 (_ BitVec 32) List!23624) Bool)

(assert (=> b!1088180 (= res!725795 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23621))))

(declare-fun b!1088181 () Bool)

(declare-fun e!621550 () Bool)

(declare-fun mapRes!41752 () Bool)

(assert (=> b!1088181 (= e!621555 (and e!621550 mapRes!41752))))

(declare-fun condMapEmpty!41752 () Bool)

(declare-fun mapDefault!41752 () ValueCell!12623)

(assert (=> b!1088181 (= condMapEmpty!41752 (= (arr!33765 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12623)) mapDefault!41752)))))

(declare-fun b!1088182 () Bool)

(assert (=> b!1088182 (= e!621550 tp_is_empty!26665)))

(declare-fun b!1088183 () Bool)

(declare-fun res!725799 () Bool)

(assert (=> b!1088183 (=> (not res!725799) (not e!621553))))

(assert (=> b!1088183 (= res!725799 (arrayNoDuplicates!0 lt!484503 #b00000000000000000000000000000000 Nil!23621))))

(declare-fun mapIsEmpty!41752 () Bool)

(assert (=> mapIsEmpty!41752 mapRes!41752))

(declare-fun b!1088184 () Bool)

(declare-fun res!725796 () Bool)

(assert (=> b!1088184 (=> (not res!725796) (not e!621556))))

(assert (=> b!1088184 (= res!725796 (= (select (arr!33764 _keys!1070) i!650) k0!904))))

(declare-fun b!1088185 () Bool)

(assert (=> b!1088185 (= e!621552 true)))

(assert (=> b!1088185 (= (-!806 lt!484508 k0!904) lt!484500)))

(declare-fun lt!484504 () Unit!35647)

(declare-fun addRemoveCommutativeForDiffKeys!58 (ListLongMap!15025 (_ BitVec 64) V!40681 (_ BitVec 64)) Unit!35647)

(assert (=> b!1088185 (= lt!484504 (addRemoveCommutativeForDiffKeys!58 lt!484498 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088186 () Bool)

(declare-fun res!725800 () Bool)

(assert (=> b!1088186 (=> (not res!725800) (not e!621556))))

(assert (=> b!1088186 (= res!725800 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34302 _keys!1070))))))

(declare-fun mapNonEmpty!41752 () Bool)

(declare-fun tp!79838 () Bool)

(assert (=> mapNonEmpty!41752 (= mapRes!41752 (and tp!79838 e!621557))))

(declare-fun mapValue!41752 () ValueCell!12623)

(declare-fun mapKey!41752 () (_ BitVec 32))

(declare-fun mapRest!41752 () (Array (_ BitVec 32) ValueCell!12623))

(assert (=> mapNonEmpty!41752 (= (arr!33765 _values!874) (store mapRest!41752 mapKey!41752 mapValue!41752))))

(assert (= (and start!96004 res!725797) b!1088175))

(assert (= (and b!1088175 res!725802) b!1088178))

(assert (= (and b!1088178 res!725801) b!1088180))

(assert (= (and b!1088180 res!725795) b!1088186))

(assert (= (and b!1088186 res!725800) b!1088176))

(assert (= (and b!1088176 res!725803) b!1088184))

(assert (= (and b!1088184 res!725796) b!1088177))

(assert (= (and b!1088177 res!725805) b!1088183))

(assert (= (and b!1088183 res!725799) b!1088174))

(assert (= (and b!1088174 (not res!725804)) b!1088179))

(assert (= (and b!1088179 (not res!725798)) b!1088185))

(assert (= (and b!1088181 condMapEmpty!41752) mapIsEmpty!41752))

(assert (= (and b!1088181 (not condMapEmpty!41752)) mapNonEmpty!41752))

(get-info :version)

(assert (= (and mapNonEmpty!41752 ((_ is ValueCellFull!12623) mapValue!41752)) b!1088173))

(assert (= (and b!1088181 ((_ is ValueCellFull!12623) mapDefault!41752)) b!1088182))

(assert (= start!96004 b!1088181))

(declare-fun b_lambda!17311 () Bool)

(assert (=> (not b_lambda!17311) (not b!1088174)))

(declare-fun t!33334 () Bool)

(declare-fun tb!7533 () Bool)

(assert (=> (and start!96004 (= defaultEntry!882 defaultEntry!882) t!33334) tb!7533))

(declare-fun result!15593 () Bool)

(assert (=> tb!7533 (= result!15593 tp_is_empty!26665)))

(assert (=> b!1088174 t!33334))

(declare-fun b_and!35977 () Bool)

(assert (= b_and!35975 (and (=> t!33334 result!15593) b_and!35977)))

(declare-fun m!1006745 () Bool)

(assert (=> b!1088176 m!1006745))

(declare-fun m!1006747 () Bool)

(assert (=> b!1088177 m!1006747))

(declare-fun m!1006749 () Bool)

(assert (=> b!1088177 m!1006749))

(declare-fun m!1006751 () Bool)

(assert (=> b!1088178 m!1006751))

(declare-fun m!1006753 () Bool)

(assert (=> b!1088183 m!1006753))

(declare-fun m!1006755 () Bool)

(assert (=> b!1088174 m!1006755))

(declare-fun m!1006757 () Bool)

(assert (=> b!1088174 m!1006757))

(declare-fun m!1006759 () Bool)

(assert (=> b!1088174 m!1006759))

(declare-fun m!1006761 () Bool)

(assert (=> b!1088174 m!1006761))

(declare-fun m!1006763 () Bool)

(assert (=> b!1088174 m!1006763))

(declare-fun m!1006765 () Bool)

(assert (=> b!1088174 m!1006765))

(declare-fun m!1006767 () Bool)

(assert (=> b!1088174 m!1006767))

(declare-fun m!1006769 () Bool)

(assert (=> b!1088174 m!1006769))

(declare-fun m!1006771 () Bool)

(assert (=> b!1088174 m!1006771))

(declare-fun m!1006773 () Bool)

(assert (=> b!1088174 m!1006773))

(declare-fun m!1006775 () Bool)

(assert (=> mapNonEmpty!41752 m!1006775))

(declare-fun m!1006777 () Bool)

(assert (=> b!1088184 m!1006777))

(declare-fun m!1006779 () Bool)

(assert (=> start!96004 m!1006779))

(declare-fun m!1006781 () Bool)

(assert (=> start!96004 m!1006781))

(declare-fun m!1006783 () Bool)

(assert (=> start!96004 m!1006783))

(declare-fun m!1006785 () Bool)

(assert (=> b!1088185 m!1006785))

(declare-fun m!1006787 () Bool)

(assert (=> b!1088185 m!1006787))

(declare-fun m!1006789 () Bool)

(assert (=> b!1088180 m!1006789))

(declare-fun m!1006791 () Bool)

(assert (=> b!1088179 m!1006791))

(declare-fun m!1006793 () Bool)

(assert (=> b!1088179 m!1006793))

(declare-fun m!1006795 () Bool)

(assert (=> b!1088179 m!1006795))

(check-sat (not b_lambda!17311) (not b!1088180) (not b!1088176) (not start!96004) (not b!1088179) b_and!35977 (not b!1088177) (not b!1088178) (not b!1088185) (not b!1088183) (not b_next!22663) tp_is_empty!26665 (not b!1088174) (not mapNonEmpty!41752))
(check-sat b_and!35977 (not b_next!22663))
