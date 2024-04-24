; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97104 () Bool)

(assert start!97104)

(declare-fun b_free!23185 () Bool)

(declare-fun b_next!23185 () Bool)

(assert (=> start!97104 (= b_free!23185 (not b_next!23185))))

(declare-fun tp!81511 () Bool)

(declare-fun b_and!37183 () Bool)

(assert (=> start!97104 (= tp!81511 b_and!37183)))

(declare-fun b!1103267 () Bool)

(declare-fun res!735777 () Bool)

(declare-fun e!629824 () Bool)

(assert (=> b!1103267 (=> (not res!735777) (not e!629824))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103267 (= res!735777 (validKeyInArray!0 k0!904))))

(declare-fun b!1103268 () Bool)

(declare-fun e!629827 () Bool)

(assert (=> b!1103268 (= e!629824 e!629827)))

(declare-fun res!735784 () Bool)

(assert (=> b!1103268 (=> (not res!735784) (not e!629827))))

(declare-datatypes ((array!71429 0))(
  ( (array!71430 (arr!34370 (Array (_ BitVec 32) (_ BitVec 64))) (size!34907 (_ BitVec 32))) )
))
(declare-fun lt!494735 () array!71429)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71429 (_ BitVec 32)) Bool)

(assert (=> b!1103268 (= res!735784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494735 mask!1414))))

(declare-fun _keys!1070 () array!71429)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1103268 (= lt!494735 (array!71430 (store (arr!34370 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34907 _keys!1070)))))

(declare-fun res!735786 () Bool)

(assert (=> start!97104 (=> (not res!735786) (not e!629824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!97104 (= res!735786 (validMask!0 mask!1414))))

(assert (=> start!97104 e!629824))

(assert (=> start!97104 tp!81511))

(assert (=> start!97104 true))

(declare-fun tp_is_empty!27235 () Bool)

(assert (=> start!97104 tp_is_empty!27235))

(declare-fun array_inv!26498 (array!71429) Bool)

(assert (=> start!97104 (array_inv!26498 _keys!1070)))

(declare-datatypes ((V!41441 0))(
  ( (V!41442 (val!13674 Int)) )
))
(declare-datatypes ((ValueCell!12908 0))(
  ( (ValueCellFull!12908 (v!16301 V!41441)) (EmptyCell!12908) )
))
(declare-datatypes ((array!71431 0))(
  ( (array!71432 (arr!34371 (Array (_ BitVec 32) ValueCell!12908)) (size!34908 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71431)

(declare-fun e!629825 () Bool)

(declare-fun array_inv!26499 (array!71431) Bool)

(assert (=> start!97104 (and (array_inv!26499 _values!874) e!629825)))

(declare-fun b!1103269 () Bool)

(declare-fun res!735782 () Bool)

(assert (=> b!1103269 (=> (not res!735782) (not e!629824))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1103269 (= res!735782 (and (= (size!34908 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34907 _keys!1070) (size!34908 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1103270 () Bool)

(declare-fun res!735783 () Bool)

(assert (=> b!1103270 (=> (not res!735783) (not e!629824))))

(assert (=> b!1103270 (= res!735783 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34907 _keys!1070))))))

(declare-fun b!1103271 () Bool)

(declare-fun e!629830 () Bool)

(assert (=> b!1103271 (= e!629830 tp_is_empty!27235)))

(declare-fun b!1103272 () Bool)

(declare-fun res!735781 () Bool)

(assert (=> b!1103272 (=> (not res!735781) (not e!629824))))

(declare-datatypes ((List!24029 0))(
  ( (Nil!24026) (Cons!24025 (h!25243 (_ BitVec 64)) (t!34252 List!24029)) )
))
(declare-fun arrayNoDuplicates!0 (array!71429 (_ BitVec 32) List!24029) Bool)

(assert (=> b!1103272 (= res!735781 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24026))))

(declare-fun b!1103273 () Bool)

(declare-fun e!629823 () Bool)

(declare-fun mapRes!42643 () Bool)

(assert (=> b!1103273 (= e!629825 (and e!629823 mapRes!42643))))

(declare-fun condMapEmpty!42643 () Bool)

(declare-fun mapDefault!42643 () ValueCell!12908)

(assert (=> b!1103273 (= condMapEmpty!42643 (= (arr!34371 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12908)) mapDefault!42643)))))

(declare-fun b!1103274 () Bool)

(declare-fun res!735779 () Bool)

(assert (=> b!1103274 (=> (not res!735779) (not e!629824))))

(assert (=> b!1103274 (= res!735779 (= (select (arr!34370 _keys!1070) i!650) k0!904))))

(declare-fun b!1103275 () Bool)

(declare-fun e!629826 () Bool)

(assert (=> b!1103275 (= e!629826 (bvslt i!650 (size!34908 _values!874)))))

(declare-datatypes ((tuple2!17410 0))(
  ( (tuple2!17411 (_1!8716 (_ BitVec 64)) (_2!8716 V!41441)) )
))
(declare-datatypes ((List!24030 0))(
  ( (Nil!24027) (Cons!24026 (h!25244 tuple2!17410) (t!34253 List!24030)) )
))
(declare-datatypes ((ListLongMap!15387 0))(
  ( (ListLongMap!15388 (toList!7709 List!24030)) )
))
(declare-fun lt!494736 () ListLongMap!15387)

(declare-fun lt!494732 () ListLongMap!15387)

(declare-fun -!972 (ListLongMap!15387 (_ BitVec 64)) ListLongMap!15387)

(assert (=> b!1103275 (= (-!972 lt!494736 k0!904) lt!494732)))

(declare-fun minValue!831 () V!41441)

(declare-fun lt!494725 () ListLongMap!15387)

(declare-datatypes ((Unit!36203 0))(
  ( (Unit!36204) )
))
(declare-fun lt!494724 () Unit!36203)

(declare-fun addRemoveCommutativeForDiffKeys!133 (ListLongMap!15387 (_ BitVec 64) V!41441 (_ BitVec 64)) Unit!36203)

(assert (=> b!1103275 (= lt!494724 (addRemoveCommutativeForDiffKeys!133 lt!494725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapNonEmpty!42643 () Bool)

(declare-fun tp!81512 () Bool)

(assert (=> mapNonEmpty!42643 (= mapRes!42643 (and tp!81512 e!629830))))

(declare-fun mapRest!42643 () (Array (_ BitVec 32) ValueCell!12908))

(declare-fun mapValue!42643 () ValueCell!12908)

(declare-fun mapKey!42643 () (_ BitVec 32))

(assert (=> mapNonEmpty!42643 (= (arr!34371 _values!874) (store mapRest!42643 mapKey!42643 mapValue!42643))))

(declare-fun b!1103276 () Bool)

(declare-fun e!629829 () Bool)

(assert (=> b!1103276 (= e!629829 e!629826)))

(declare-fun res!735785 () Bool)

(assert (=> b!1103276 (=> res!735785 e!629826)))

(assert (=> b!1103276 (= res!735785 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!494733 () ListLongMap!15387)

(assert (=> b!1103276 (= lt!494733 lt!494736)))

(declare-fun lt!494731 () tuple2!17410)

(declare-fun +!3437 (ListLongMap!15387 tuple2!17410) ListLongMap!15387)

(assert (=> b!1103276 (= lt!494736 (+!3437 lt!494725 lt!494731))))

(declare-fun lt!494730 () ListLongMap!15387)

(assert (=> b!1103276 (= lt!494730 lt!494732)))

(declare-fun lt!494734 () ListLongMap!15387)

(assert (=> b!1103276 (= lt!494732 (+!3437 lt!494734 lt!494731))))

(declare-fun lt!494728 () ListLongMap!15387)

(assert (=> b!1103276 (= lt!494730 (+!3437 lt!494728 lt!494731))))

(assert (=> b!1103276 (= lt!494731 (tuple2!17411 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1103277 () Bool)

(declare-fun res!735780 () Bool)

(assert (=> b!1103277 (=> (not res!735780) (not e!629827))))

(assert (=> b!1103277 (= res!735780 (arrayNoDuplicates!0 lt!494735 #b00000000000000000000000000000000 Nil!24026))))

(declare-fun b!1103278 () Bool)

(assert (=> b!1103278 (= e!629823 tp_is_empty!27235)))

(declare-fun b!1103279 () Bool)

(declare-fun res!735778 () Bool)

(assert (=> b!1103279 (=> (not res!735778) (not e!629824))))

(assert (=> b!1103279 (= res!735778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1103280 () Bool)

(assert (=> b!1103280 (= e!629827 (not e!629829))))

(declare-fun res!735787 () Bool)

(assert (=> b!1103280 (=> res!735787 e!629829)))

(assert (=> b!1103280 (= res!735787 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41441)

(declare-fun getCurrentListMap!4408 (array!71429 array!71431 (_ BitVec 32) (_ BitVec 32) V!41441 V!41441 (_ BitVec 32) Int) ListLongMap!15387)

(assert (=> b!1103280 (= lt!494733 (getCurrentListMap!4408 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494726 () array!71431)

(assert (=> b!1103280 (= lt!494730 (getCurrentListMap!4408 lt!494735 lt!494726 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1103280 (and (= lt!494728 lt!494734) (= lt!494734 lt!494728))))

(assert (=> b!1103280 (= lt!494734 (-!972 lt!494725 k0!904))))

(declare-fun lt!494729 () Unit!36203)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!242 (array!71429 array!71431 (_ BitVec 32) (_ BitVec 32) V!41441 V!41441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36203)

(assert (=> b!1103280 (= lt!494729 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!242 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4249 (array!71429 array!71431 (_ BitVec 32) (_ BitVec 32) V!41441 V!41441 (_ BitVec 32) Int) ListLongMap!15387)

(assert (=> b!1103280 (= lt!494728 (getCurrentListMapNoExtraKeys!4249 lt!494735 lt!494726 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2367 (Int (_ BitVec 64)) V!41441)

(assert (=> b!1103280 (= lt!494726 (array!71432 (store (arr!34371 _values!874) i!650 (ValueCellFull!12908 (dynLambda!2367 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34908 _values!874)))))

(assert (=> b!1103280 (= lt!494725 (getCurrentListMapNoExtraKeys!4249 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103280 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494727 () Unit!36203)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71429 (_ BitVec 64) (_ BitVec 32)) Unit!36203)

(assert (=> b!1103280 (= lt!494727 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42643 () Bool)

(assert (=> mapIsEmpty!42643 mapRes!42643))

(assert (= (and start!97104 res!735786) b!1103269))

(assert (= (and b!1103269 res!735782) b!1103279))

(assert (= (and b!1103279 res!735778) b!1103272))

(assert (= (and b!1103272 res!735781) b!1103270))

(assert (= (and b!1103270 res!735783) b!1103267))

(assert (= (and b!1103267 res!735777) b!1103274))

(assert (= (and b!1103274 res!735779) b!1103268))

(assert (= (and b!1103268 res!735784) b!1103277))

(assert (= (and b!1103277 res!735780) b!1103280))

(assert (= (and b!1103280 (not res!735787)) b!1103276))

(assert (= (and b!1103276 (not res!735785)) b!1103275))

(assert (= (and b!1103273 condMapEmpty!42643) mapIsEmpty!42643))

(assert (= (and b!1103273 (not condMapEmpty!42643)) mapNonEmpty!42643))

(get-info :version)

(assert (= (and mapNonEmpty!42643 ((_ is ValueCellFull!12908) mapValue!42643)) b!1103271))

(assert (= (and b!1103273 ((_ is ValueCellFull!12908) mapDefault!42643)) b!1103278))

(assert (= start!97104 b!1103273))

(declare-fun b_lambda!18153 () Bool)

(assert (=> (not b_lambda!18153) (not b!1103280)))

(declare-fun t!34251 () Bool)

(declare-fun tb!8043 () Bool)

(assert (=> (and start!97104 (= defaultEntry!882 defaultEntry!882) t!34251) tb!8043))

(declare-fun result!16637 () Bool)

(assert (=> tb!8043 (= result!16637 tp_is_empty!27235)))

(assert (=> b!1103280 t!34251))

(declare-fun b_and!37185 () Bool)

(assert (= b_and!37183 (and (=> t!34251 result!16637) b_and!37185)))

(declare-fun m!1023845 () Bool)

(assert (=> mapNonEmpty!42643 m!1023845))

(declare-fun m!1023847 () Bool)

(assert (=> b!1103275 m!1023847))

(declare-fun m!1023849 () Bool)

(assert (=> b!1103275 m!1023849))

(declare-fun m!1023851 () Bool)

(assert (=> b!1103279 m!1023851))

(declare-fun m!1023853 () Bool)

(assert (=> b!1103274 m!1023853))

(declare-fun m!1023855 () Bool)

(assert (=> b!1103267 m!1023855))

(declare-fun m!1023857 () Bool)

(assert (=> b!1103280 m!1023857))

(declare-fun m!1023859 () Bool)

(assert (=> b!1103280 m!1023859))

(declare-fun m!1023861 () Bool)

(assert (=> b!1103280 m!1023861))

(declare-fun m!1023863 () Bool)

(assert (=> b!1103280 m!1023863))

(declare-fun m!1023865 () Bool)

(assert (=> b!1103280 m!1023865))

(declare-fun m!1023867 () Bool)

(assert (=> b!1103280 m!1023867))

(declare-fun m!1023869 () Bool)

(assert (=> b!1103280 m!1023869))

(declare-fun m!1023871 () Bool)

(assert (=> b!1103280 m!1023871))

(declare-fun m!1023873 () Bool)

(assert (=> b!1103280 m!1023873))

(declare-fun m!1023875 () Bool)

(assert (=> b!1103280 m!1023875))

(declare-fun m!1023877 () Bool)

(assert (=> b!1103268 m!1023877))

(declare-fun m!1023879 () Bool)

(assert (=> b!1103268 m!1023879))

(declare-fun m!1023881 () Bool)

(assert (=> b!1103276 m!1023881))

(declare-fun m!1023883 () Bool)

(assert (=> b!1103276 m!1023883))

(declare-fun m!1023885 () Bool)

(assert (=> b!1103276 m!1023885))

(declare-fun m!1023887 () Bool)

(assert (=> b!1103277 m!1023887))

(declare-fun m!1023889 () Bool)

(assert (=> start!97104 m!1023889))

(declare-fun m!1023891 () Bool)

(assert (=> start!97104 m!1023891))

(declare-fun m!1023893 () Bool)

(assert (=> start!97104 m!1023893))

(declare-fun m!1023895 () Bool)

(assert (=> b!1103272 m!1023895))

(check-sat (not b!1103279) (not b!1103277) (not start!97104) (not b!1103267) b_and!37185 (not b!1103268) (not b!1103272) (not mapNonEmpty!42643) (not b!1103275) (not b!1103280) (not b!1103276) (not b_next!23185) tp_is_empty!27235 (not b_lambda!18153))
(check-sat b_and!37185 (not b_next!23185))
