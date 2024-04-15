; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96142 () Bool)

(assert start!96142)

(declare-fun b_free!22801 () Bool)

(declare-fun b_next!22801 () Bool)

(assert (=> start!96142 (= b_free!22801 (not b_next!22801))))

(declare-fun tp!80251 () Bool)

(declare-fun b_and!36251 () Bool)

(assert (=> start!96142 (= tp!80251 b_and!36251)))

(declare-fun mapIsEmpty!41959 () Bool)

(declare-fun mapRes!41959 () Bool)

(assert (=> mapIsEmpty!41959 mapRes!41959))

(declare-fun b!1091218 () Bool)

(declare-fun res!728086 () Bool)

(declare-fun e!623207 () Bool)

(assert (=> b!1091218 (=> (not res!728086) (not e!623207))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091218 (= res!728086 (validKeyInArray!0 k0!904))))

(declare-fun b!1091219 () Bool)

(declare-fun e!623213 () Bool)

(declare-fun tp_is_empty!26803 () Bool)

(assert (=> b!1091219 (= e!623213 tp_is_empty!26803)))

(declare-fun b!1091220 () Bool)

(declare-fun e!623209 () Bool)

(declare-fun e!623208 () Bool)

(assert (=> b!1091220 (= e!623209 (and e!623208 mapRes!41959))))

(declare-fun condMapEmpty!41959 () Bool)

(declare-datatypes ((V!40865 0))(
  ( (V!40866 (val!13458 Int)) )
))
(declare-datatypes ((ValueCell!12692 0))(
  ( (ValueCellFull!12692 (v!16078 V!40865)) (EmptyCell!12692) )
))
(declare-datatypes ((array!70446 0))(
  ( (array!70447 (arr!33897 (Array (_ BitVec 32) ValueCell!12692)) (size!34435 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70446)

(declare-fun mapDefault!41959 () ValueCell!12692)

(assert (=> b!1091220 (= condMapEmpty!41959 (= (arr!33897 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12692)) mapDefault!41959)))))

(declare-fun b!1091221 () Bool)

(assert (=> b!1091221 (= e!623208 tp_is_empty!26803)))

(declare-fun b!1091222 () Bool)

(declare-fun e!623206 () Bool)

(declare-fun e!623211 () Bool)

(assert (=> b!1091222 (= e!623206 e!623211)))

(declare-fun res!728091 () Bool)

(assert (=> b!1091222 (=> res!728091 e!623211)))

(assert (=> b!1091222 (= res!728091 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17168 0))(
  ( (tuple2!17169 (_1!8595 (_ BitVec 64)) (_2!8595 V!40865)) )
))
(declare-datatypes ((List!23733 0))(
  ( (Nil!23730) (Cons!23729 (h!24938 tuple2!17168) (t!33583 List!23733)) )
))
(declare-datatypes ((ListLongMap!15137 0))(
  ( (ListLongMap!15138 (toList!7584 List!23733)) )
))
(declare-fun lt!487168 () ListLongMap!15137)

(declare-fun lt!487160 () ListLongMap!15137)

(assert (=> b!1091222 (= lt!487168 lt!487160)))

(declare-fun lt!487170 () ListLongMap!15137)

(declare-fun lt!487166 () tuple2!17168)

(declare-fun +!3374 (ListLongMap!15137 tuple2!17168) ListLongMap!15137)

(assert (=> b!1091222 (= lt!487160 (+!3374 lt!487170 lt!487166))))

(declare-fun lt!487167 () ListLongMap!15137)

(declare-fun lt!487163 () ListLongMap!15137)

(assert (=> b!1091222 (= lt!487167 lt!487163)))

(declare-fun lt!487162 () ListLongMap!15137)

(assert (=> b!1091222 (= lt!487163 (+!3374 lt!487162 lt!487166))))

(declare-fun lt!487169 () ListLongMap!15137)

(assert (=> b!1091222 (= lt!487167 (+!3374 lt!487169 lt!487166))))

(declare-fun minValue!831 () V!40865)

(assert (=> b!1091222 (= lt!487166 (tuple2!17169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091223 () Bool)

(declare-fun res!728084 () Bool)

(declare-fun e!623212 () Bool)

(assert (=> b!1091223 (=> (not res!728084) (not e!623212))))

(declare-datatypes ((array!70448 0))(
  ( (array!70449 (arr!33898 (Array (_ BitVec 32) (_ BitVec 64))) (size!34436 (_ BitVec 32))) )
))
(declare-fun lt!487172 () array!70448)

(declare-datatypes ((List!23734 0))(
  ( (Nil!23731) (Cons!23730 (h!24939 (_ BitVec 64)) (t!33584 List!23734)) )
))
(declare-fun arrayNoDuplicates!0 (array!70448 (_ BitVec 32) List!23734) Bool)

(assert (=> b!1091223 (= res!728084 (arrayNoDuplicates!0 lt!487172 #b00000000000000000000000000000000 Nil!23731))))

(declare-fun b!1091224 () Bool)

(declare-fun res!728087 () Bool)

(assert (=> b!1091224 (=> (not res!728087) (not e!623207))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70448)

(assert (=> b!1091224 (= res!728087 (and (= (size!34435 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34436 _keys!1070) (size!34435 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!728082 () Bool)

(assert (=> start!96142 (=> (not res!728082) (not e!623207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96142 (= res!728082 (validMask!0 mask!1414))))

(assert (=> start!96142 e!623207))

(assert (=> start!96142 tp!80251))

(assert (=> start!96142 true))

(assert (=> start!96142 tp_is_empty!26803))

(declare-fun array_inv!26176 (array!70448) Bool)

(assert (=> start!96142 (array_inv!26176 _keys!1070)))

(declare-fun array_inv!26177 (array!70446) Bool)

(assert (=> start!96142 (and (array_inv!26177 _values!874) e!623209)))

(declare-fun mapNonEmpty!41959 () Bool)

(declare-fun tp!80252 () Bool)

(assert (=> mapNonEmpty!41959 (= mapRes!41959 (and tp!80252 e!623213))))

(declare-fun mapValue!41959 () ValueCell!12692)

(declare-fun mapKey!41959 () (_ BitVec 32))

(declare-fun mapRest!41959 () (Array (_ BitVec 32) ValueCell!12692))

(assert (=> mapNonEmpty!41959 (= (arr!33897 _values!874) (store mapRest!41959 mapKey!41959 mapValue!41959))))

(declare-fun b!1091225 () Bool)

(assert (=> b!1091225 (= e!623207 e!623212)))

(declare-fun res!728089 () Bool)

(assert (=> b!1091225 (=> (not res!728089) (not e!623212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70448 (_ BitVec 32)) Bool)

(assert (=> b!1091225 (= res!728089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487172 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091225 (= lt!487172 (array!70449 (store (arr!33898 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34436 _keys!1070)))))

(declare-fun b!1091226 () Bool)

(declare-fun res!728083 () Bool)

(assert (=> b!1091226 (=> (not res!728083) (not e!623207))))

(assert (=> b!1091226 (= res!728083 (= (select (arr!33898 _keys!1070) i!650) k0!904))))

(declare-fun b!1091227 () Bool)

(declare-fun res!728085 () Bool)

(assert (=> b!1091227 (=> (not res!728085) (not e!623207))))

(assert (=> b!1091227 (= res!728085 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34436 _keys!1070))))))

(declare-fun b!1091228 () Bool)

(declare-fun res!728081 () Bool)

(assert (=> b!1091228 (=> (not res!728081) (not e!623207))))

(assert (=> b!1091228 (= res!728081 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23731))))

(declare-fun b!1091229 () Bool)

(declare-fun res!728088 () Bool)

(assert (=> b!1091229 (=> (not res!728088) (not e!623207))))

(assert (=> b!1091229 (= res!728088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091230 () Bool)

(assert (=> b!1091230 (= e!623211 true)))

(declare-fun -!857 (ListLongMap!15137 (_ BitVec 64)) ListLongMap!15137)

(assert (=> b!1091230 (= (-!857 lt!487160 k0!904) lt!487163)))

(declare-datatypes ((Unit!35749 0))(
  ( (Unit!35750) )
))
(declare-fun lt!487161 () Unit!35749)

(declare-fun addRemoveCommutativeForDiffKeys!101 (ListLongMap!15137 (_ BitVec 64) V!40865 (_ BitVec 64)) Unit!35749)

(assert (=> b!1091230 (= lt!487161 (addRemoveCommutativeForDiffKeys!101 lt!487170 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091231 () Bool)

(assert (=> b!1091231 (= e!623212 (not e!623206))))

(declare-fun res!728090 () Bool)

(assert (=> b!1091231 (=> res!728090 e!623206)))

(assert (=> b!1091231 (= res!728090 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40865)

(declare-fun getCurrentListMap!4252 (array!70448 array!70446 (_ BitVec 32) (_ BitVec 32) V!40865 V!40865 (_ BitVec 32) Int) ListLongMap!15137)

(assert (=> b!1091231 (= lt!487168 (getCurrentListMap!4252 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487165 () array!70446)

(assert (=> b!1091231 (= lt!487167 (getCurrentListMap!4252 lt!487172 lt!487165 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091231 (and (= lt!487169 lt!487162) (= lt!487162 lt!487169))))

(assert (=> b!1091231 (= lt!487162 (-!857 lt!487170 k0!904))))

(declare-fun lt!487171 () Unit!35749)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!136 (array!70448 array!70446 (_ BitVec 32) (_ BitVec 32) V!40865 V!40865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35749)

(assert (=> b!1091231 (= lt!487171 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!136 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4122 (array!70448 array!70446 (_ BitVec 32) (_ BitVec 32) V!40865 V!40865 (_ BitVec 32) Int) ListLongMap!15137)

(assert (=> b!1091231 (= lt!487169 (getCurrentListMapNoExtraKeys!4122 lt!487172 lt!487165 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2193 (Int (_ BitVec 64)) V!40865)

(assert (=> b!1091231 (= lt!487165 (array!70447 (store (arr!33897 _values!874) i!650 (ValueCellFull!12692 (dynLambda!2193 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34435 _values!874)))))

(assert (=> b!1091231 (= lt!487170 (getCurrentListMapNoExtraKeys!4122 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091231 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487164 () Unit!35749)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70448 (_ BitVec 64) (_ BitVec 32)) Unit!35749)

(assert (=> b!1091231 (= lt!487164 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96142 res!728082) b!1091224))

(assert (= (and b!1091224 res!728087) b!1091229))

(assert (= (and b!1091229 res!728088) b!1091228))

(assert (= (and b!1091228 res!728081) b!1091227))

(assert (= (and b!1091227 res!728085) b!1091218))

(assert (= (and b!1091218 res!728086) b!1091226))

(assert (= (and b!1091226 res!728083) b!1091225))

(assert (= (and b!1091225 res!728089) b!1091223))

(assert (= (and b!1091223 res!728084) b!1091231))

(assert (= (and b!1091231 (not res!728090)) b!1091222))

(assert (= (and b!1091222 (not res!728091)) b!1091230))

(assert (= (and b!1091220 condMapEmpty!41959) mapIsEmpty!41959))

(assert (= (and b!1091220 (not condMapEmpty!41959)) mapNonEmpty!41959))

(get-info :version)

(assert (= (and mapNonEmpty!41959 ((_ is ValueCellFull!12692) mapValue!41959)) b!1091219))

(assert (= (and b!1091220 ((_ is ValueCellFull!12692) mapDefault!41959)) b!1091221))

(assert (= start!96142 b!1091220))

(declare-fun b_lambda!17449 () Bool)

(assert (=> (not b_lambda!17449) (not b!1091231)))

(declare-fun t!33582 () Bool)

(declare-fun tb!7671 () Bool)

(assert (=> (and start!96142 (= defaultEntry!882 defaultEntry!882) t!33582) tb!7671))

(declare-fun result!15869 () Bool)

(assert (=> tb!7671 (= result!15869 tp_is_empty!26803)))

(assert (=> b!1091231 t!33582))

(declare-fun b_and!36253 () Bool)

(assert (= b_and!36251 (and (=> t!33582 result!15869) b_and!36253)))

(declare-fun m!1010321 () Bool)

(assert (=> b!1091222 m!1010321))

(declare-fun m!1010323 () Bool)

(assert (=> b!1091222 m!1010323))

(declare-fun m!1010325 () Bool)

(assert (=> b!1091222 m!1010325))

(declare-fun m!1010327 () Bool)

(assert (=> b!1091223 m!1010327))

(declare-fun m!1010329 () Bool)

(assert (=> b!1091231 m!1010329))

(declare-fun m!1010331 () Bool)

(assert (=> b!1091231 m!1010331))

(declare-fun m!1010333 () Bool)

(assert (=> b!1091231 m!1010333))

(declare-fun m!1010335 () Bool)

(assert (=> b!1091231 m!1010335))

(declare-fun m!1010337 () Bool)

(assert (=> b!1091231 m!1010337))

(declare-fun m!1010339 () Bool)

(assert (=> b!1091231 m!1010339))

(declare-fun m!1010341 () Bool)

(assert (=> b!1091231 m!1010341))

(declare-fun m!1010343 () Bool)

(assert (=> b!1091231 m!1010343))

(declare-fun m!1010345 () Bool)

(assert (=> b!1091231 m!1010345))

(declare-fun m!1010347 () Bool)

(assert (=> b!1091231 m!1010347))

(declare-fun m!1010349 () Bool)

(assert (=> b!1091230 m!1010349))

(declare-fun m!1010351 () Bool)

(assert (=> b!1091230 m!1010351))

(declare-fun m!1010353 () Bool)

(assert (=> b!1091226 m!1010353))

(declare-fun m!1010355 () Bool)

(assert (=> b!1091218 m!1010355))

(declare-fun m!1010357 () Bool)

(assert (=> b!1091229 m!1010357))

(declare-fun m!1010359 () Bool)

(assert (=> b!1091225 m!1010359))

(declare-fun m!1010361 () Bool)

(assert (=> b!1091225 m!1010361))

(declare-fun m!1010363 () Bool)

(assert (=> start!96142 m!1010363))

(declare-fun m!1010365 () Bool)

(assert (=> start!96142 m!1010365))

(declare-fun m!1010367 () Bool)

(assert (=> start!96142 m!1010367))

(declare-fun m!1010369 () Bool)

(assert (=> b!1091228 m!1010369))

(declare-fun m!1010371 () Bool)

(assert (=> mapNonEmpty!41959 m!1010371))

(check-sat (not b!1091231) (not b!1091228) (not b_lambda!17449) (not b!1091230) (not mapNonEmpty!41959) (not b_next!22801) (not b!1091229) (not b!1091222) (not b!1091218) (not b!1091223) tp_is_empty!26803 (not b!1091225) (not start!96142) b_and!36253)
(check-sat b_and!36253 (not b_next!22801))
