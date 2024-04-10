; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96138 () Bool)

(assert start!96138)

(declare-fun b_free!22791 () Bool)

(declare-fun b_next!22791 () Bool)

(assert (=> start!96138 (= b_free!22791 (not b_next!22791))))

(declare-fun tp!80221 () Bool)

(declare-fun b_and!36257 () Bool)

(assert (=> start!96138 (= tp!80221 b_and!36257)))

(declare-fun mapIsEmpty!41944 () Bool)

(declare-fun mapRes!41944 () Bool)

(assert (=> mapIsEmpty!41944 mapRes!41944))

(declare-fun b!1091152 () Bool)

(declare-fun e!623183 () Bool)

(declare-fun e!623184 () Bool)

(assert (=> b!1091152 (= e!623183 e!623184)))

(declare-fun res!727995 () Bool)

(assert (=> b!1091152 (=> (not res!727995) (not e!623184))))

(declare-datatypes ((array!70505 0))(
  ( (array!70506 (arr!33926 (Array (_ BitVec 32) (_ BitVec 64))) (size!34462 (_ BitVec 32))) )
))
(declare-fun lt!487176 () array!70505)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70505 (_ BitVec 32)) Bool)

(assert (=> b!1091152 (= res!727995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487176 mask!1414))))

(declare-fun _keys!1070 () array!70505)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091152 (= lt!487176 (array!70506 (store (arr!33926 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34462 _keys!1070)))))

(declare-fun b!1091153 () Bool)

(declare-fun res!727990 () Bool)

(assert (=> b!1091153 (=> (not res!727990) (not e!623184))))

(declare-datatypes ((List!23693 0))(
  ( (Nil!23690) (Cons!23689 (h!24898 (_ BitVec 64)) (t!33542 List!23693)) )
))
(declare-fun arrayNoDuplicates!0 (array!70505 (_ BitVec 32) List!23693) Bool)

(assert (=> b!1091153 (= res!727990 (arrayNoDuplicates!0 lt!487176 #b00000000000000000000000000000000 Nil!23690))))

(declare-fun b!1091154 () Bool)

(declare-fun res!727986 () Bool)

(assert (=> b!1091154 (=> (not res!727986) (not e!623183))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40851 0))(
  ( (V!40852 (val!13453 Int)) )
))
(declare-datatypes ((ValueCell!12687 0))(
  ( (ValueCellFull!12687 (v!16074 V!40851)) (EmptyCell!12687) )
))
(declare-datatypes ((array!70507 0))(
  ( (array!70508 (arr!33927 (Array (_ BitVec 32) ValueCell!12687)) (size!34463 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70507)

(assert (=> b!1091154 (= res!727986 (and (= (size!34463 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34462 _keys!1070) (size!34463 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091155 () Bool)

(declare-fun e!623186 () Bool)

(assert (=> b!1091155 (= e!623186 true)))

(declare-datatypes ((tuple2!17108 0))(
  ( (tuple2!17109 (_1!8565 (_ BitVec 64)) (_2!8565 V!40851)) )
))
(declare-datatypes ((List!23694 0))(
  ( (Nil!23691) (Cons!23690 (h!24899 tuple2!17108) (t!33543 List!23694)) )
))
(declare-datatypes ((ListLongMap!15077 0))(
  ( (ListLongMap!15078 (toList!7554 List!23694)) )
))
(declare-fun lt!487174 () ListLongMap!15077)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!487177 () ListLongMap!15077)

(declare-fun -!875 (ListLongMap!15077 (_ BitVec 64)) ListLongMap!15077)

(assert (=> b!1091155 (= (-!875 lt!487174 k0!904) lt!487177)))

(declare-fun minValue!831 () V!40851)

(declare-fun lt!487168 () ListLongMap!15077)

(declare-datatypes ((Unit!35916 0))(
  ( (Unit!35917) )
))
(declare-fun lt!487171 () Unit!35916)

(declare-fun addRemoveCommutativeForDiffKeys!98 (ListLongMap!15077 (_ BitVec 64) V!40851 (_ BitVec 64)) Unit!35916)

(assert (=> b!1091155 (= lt!487171 (addRemoveCommutativeForDiffKeys!98 lt!487168 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091156 () Bool)

(declare-fun e!623185 () Bool)

(declare-fun tp_is_empty!26793 () Bool)

(assert (=> b!1091156 (= e!623185 tp_is_empty!26793)))

(declare-fun b!1091157 () Bool)

(declare-fun res!727993 () Bool)

(assert (=> b!1091157 (=> (not res!727993) (not e!623183))))

(assert (=> b!1091157 (= res!727993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091158 () Bool)

(declare-fun e!623180 () Bool)

(assert (=> b!1091158 (= e!623180 e!623186)))

(declare-fun res!727988 () Bool)

(assert (=> b!1091158 (=> res!727988 e!623186)))

(assert (=> b!1091158 (= res!727988 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!487165 () ListLongMap!15077)

(assert (=> b!1091158 (= lt!487165 lt!487174)))

(declare-fun lt!487175 () tuple2!17108)

(declare-fun +!3340 (ListLongMap!15077 tuple2!17108) ListLongMap!15077)

(assert (=> b!1091158 (= lt!487174 (+!3340 lt!487168 lt!487175))))

(declare-fun lt!487169 () ListLongMap!15077)

(assert (=> b!1091158 (= lt!487169 lt!487177)))

(declare-fun lt!487167 () ListLongMap!15077)

(assert (=> b!1091158 (= lt!487177 (+!3340 lt!487167 lt!487175))))

(declare-fun lt!487166 () ListLongMap!15077)

(assert (=> b!1091158 (= lt!487169 (+!3340 lt!487166 lt!487175))))

(assert (=> b!1091158 (= lt!487175 (tuple2!17109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091159 () Bool)

(assert (=> b!1091159 (= e!623184 (not e!623180))))

(declare-fun res!727992 () Bool)

(assert (=> b!1091159 (=> res!727992 e!623180)))

(assert (=> b!1091159 (= res!727992 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40851)

(declare-fun getCurrentListMap!4316 (array!70505 array!70507 (_ BitVec 32) (_ BitVec 32) V!40851 V!40851 (_ BitVec 32) Int) ListLongMap!15077)

(assert (=> b!1091159 (= lt!487165 (getCurrentListMap!4316 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487173 () array!70507)

(assert (=> b!1091159 (= lt!487169 (getCurrentListMap!4316 lt!487176 lt!487173 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091159 (and (= lt!487166 lt!487167) (= lt!487167 lt!487166))))

(assert (=> b!1091159 (= lt!487167 (-!875 lt!487168 k0!904))))

(declare-fun lt!487172 () Unit!35916)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!135 (array!70505 array!70507 (_ BitVec 32) (_ BitVec 32) V!40851 V!40851 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35916)

(assert (=> b!1091159 (= lt!487172 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!135 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4076 (array!70505 array!70507 (_ BitVec 32) (_ BitVec 32) V!40851 V!40851 (_ BitVec 32) Int) ListLongMap!15077)

(assert (=> b!1091159 (= lt!487166 (getCurrentListMapNoExtraKeys!4076 lt!487176 lt!487173 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2213 (Int (_ BitVec 64)) V!40851)

(assert (=> b!1091159 (= lt!487173 (array!70508 (store (arr!33927 _values!874) i!650 (ValueCellFull!12687 (dynLambda!2213 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34463 _values!874)))))

(assert (=> b!1091159 (= lt!487168 (getCurrentListMapNoExtraKeys!4076 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091159 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487170 () Unit!35916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70505 (_ BitVec 64) (_ BitVec 32)) Unit!35916)

(assert (=> b!1091159 (= lt!487170 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!727987 () Bool)

(assert (=> start!96138 (=> (not res!727987) (not e!623183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96138 (= res!727987 (validMask!0 mask!1414))))

(assert (=> start!96138 e!623183))

(assert (=> start!96138 tp!80221))

(assert (=> start!96138 true))

(assert (=> start!96138 tp_is_empty!26793))

(declare-fun array_inv!26160 (array!70505) Bool)

(assert (=> start!96138 (array_inv!26160 _keys!1070)))

(declare-fun e!623179 () Bool)

(declare-fun array_inv!26161 (array!70507) Bool)

(assert (=> start!96138 (and (array_inv!26161 _values!874) e!623179)))

(declare-fun b!1091151 () Bool)

(declare-fun res!727991 () Bool)

(assert (=> b!1091151 (=> (not res!727991) (not e!623183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091151 (= res!727991 (validKeyInArray!0 k0!904))))

(declare-fun b!1091160 () Bool)

(declare-fun res!727985 () Bool)

(assert (=> b!1091160 (=> (not res!727985) (not e!623183))))

(assert (=> b!1091160 (= res!727985 (= (select (arr!33926 _keys!1070) i!650) k0!904))))

(declare-fun b!1091161 () Bool)

(declare-fun res!727989 () Bool)

(assert (=> b!1091161 (=> (not res!727989) (not e!623183))))

(assert (=> b!1091161 (= res!727989 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23690))))

(declare-fun mapNonEmpty!41944 () Bool)

(declare-fun tp!80222 () Bool)

(assert (=> mapNonEmpty!41944 (= mapRes!41944 (and tp!80222 e!623185))))

(declare-fun mapRest!41944 () (Array (_ BitVec 32) ValueCell!12687))

(declare-fun mapKey!41944 () (_ BitVec 32))

(declare-fun mapValue!41944 () ValueCell!12687)

(assert (=> mapNonEmpty!41944 (= (arr!33927 _values!874) (store mapRest!41944 mapKey!41944 mapValue!41944))))

(declare-fun b!1091162 () Bool)

(declare-fun res!727994 () Bool)

(assert (=> b!1091162 (=> (not res!727994) (not e!623183))))

(assert (=> b!1091162 (= res!727994 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34462 _keys!1070))))))

(declare-fun b!1091163 () Bool)

(declare-fun e!623181 () Bool)

(assert (=> b!1091163 (= e!623179 (and e!623181 mapRes!41944))))

(declare-fun condMapEmpty!41944 () Bool)

(declare-fun mapDefault!41944 () ValueCell!12687)

(assert (=> b!1091163 (= condMapEmpty!41944 (= (arr!33927 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12687)) mapDefault!41944)))))

(declare-fun b!1091164 () Bool)

(assert (=> b!1091164 (= e!623181 tp_is_empty!26793)))

(assert (= (and start!96138 res!727987) b!1091154))

(assert (= (and b!1091154 res!727986) b!1091157))

(assert (= (and b!1091157 res!727993) b!1091161))

(assert (= (and b!1091161 res!727989) b!1091162))

(assert (= (and b!1091162 res!727994) b!1091151))

(assert (= (and b!1091151 res!727991) b!1091160))

(assert (= (and b!1091160 res!727985) b!1091152))

(assert (= (and b!1091152 res!727995) b!1091153))

(assert (= (and b!1091153 res!727990) b!1091159))

(assert (= (and b!1091159 (not res!727992)) b!1091158))

(assert (= (and b!1091158 (not res!727988)) b!1091155))

(assert (= (and b!1091163 condMapEmpty!41944) mapIsEmpty!41944))

(assert (= (and b!1091163 (not condMapEmpty!41944)) mapNonEmpty!41944))

(get-info :version)

(assert (= (and mapNonEmpty!41944 ((_ is ValueCellFull!12687) mapValue!41944)) b!1091156))

(assert (= (and b!1091163 ((_ is ValueCellFull!12687) mapDefault!41944)) b!1091164))

(assert (= start!96138 b!1091163))

(declare-fun b_lambda!17461 () Bool)

(assert (=> (not b_lambda!17461) (not b!1091159)))

(declare-fun t!33541 () Bool)

(declare-fun tb!7669 () Bool)

(assert (=> (and start!96138 (= defaultEntry!882 defaultEntry!882) t!33541) tb!7669))

(declare-fun result!15857 () Bool)

(assert (=> tb!7669 (= result!15857 tp_is_empty!26793)))

(assert (=> b!1091159 t!33541))

(declare-fun b_and!36259 () Bool)

(assert (= b_and!36257 (and (=> t!33541 result!15857) b_and!36259)))

(declare-fun m!1010687 () Bool)

(assert (=> b!1091153 m!1010687))

(declare-fun m!1010689 () Bool)

(assert (=> b!1091159 m!1010689))

(declare-fun m!1010691 () Bool)

(assert (=> b!1091159 m!1010691))

(declare-fun m!1010693 () Bool)

(assert (=> b!1091159 m!1010693))

(declare-fun m!1010695 () Bool)

(assert (=> b!1091159 m!1010695))

(declare-fun m!1010697 () Bool)

(assert (=> b!1091159 m!1010697))

(declare-fun m!1010699 () Bool)

(assert (=> b!1091159 m!1010699))

(declare-fun m!1010701 () Bool)

(assert (=> b!1091159 m!1010701))

(declare-fun m!1010703 () Bool)

(assert (=> b!1091159 m!1010703))

(declare-fun m!1010705 () Bool)

(assert (=> b!1091159 m!1010705))

(declare-fun m!1010707 () Bool)

(assert (=> b!1091159 m!1010707))

(declare-fun m!1010709 () Bool)

(assert (=> b!1091158 m!1010709))

(declare-fun m!1010711 () Bool)

(assert (=> b!1091158 m!1010711))

(declare-fun m!1010713 () Bool)

(assert (=> b!1091158 m!1010713))

(declare-fun m!1010715 () Bool)

(assert (=> b!1091155 m!1010715))

(declare-fun m!1010717 () Bool)

(assert (=> b!1091155 m!1010717))

(declare-fun m!1010719 () Bool)

(assert (=> b!1091157 m!1010719))

(declare-fun m!1010721 () Bool)

(assert (=> b!1091161 m!1010721))

(declare-fun m!1010723 () Bool)

(assert (=> b!1091160 m!1010723))

(declare-fun m!1010725 () Bool)

(assert (=> mapNonEmpty!41944 m!1010725))

(declare-fun m!1010727 () Bool)

(assert (=> b!1091152 m!1010727))

(declare-fun m!1010729 () Bool)

(assert (=> b!1091152 m!1010729))

(declare-fun m!1010731 () Bool)

(assert (=> b!1091151 m!1010731))

(declare-fun m!1010733 () Bool)

(assert (=> start!96138 m!1010733))

(declare-fun m!1010735 () Bool)

(assert (=> start!96138 m!1010735))

(declare-fun m!1010737 () Bool)

(assert (=> start!96138 m!1010737))

(check-sat tp_is_empty!26793 (not b_next!22791) (not b!1091155) (not b!1091151) (not b!1091152) (not b_lambda!17461) (not b!1091158) (not start!96138) (not b!1091161) (not b!1091153) b_and!36259 (not b!1091157) (not mapNonEmpty!41944) (not b!1091159))
(check-sat b_and!36259 (not b_next!22791))
