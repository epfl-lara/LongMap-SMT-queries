; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96786 () Bool)

(assert start!96786)

(declare-fun b_free!23077 () Bool)

(declare-fun b_next!23077 () Bool)

(assert (=> start!96786 (= b_free!23077 (not b_next!23077))))

(declare-fun tp!81163 () Bool)

(declare-fun b_and!36855 () Bool)

(assert (=> start!96786 (= tp!81163 b_and!36855)))

(declare-fun b!1099299 () Bool)

(declare-fun res!733287 () Bool)

(declare-fun e!627526 () Bool)

(assert (=> b!1099299 (=> (not res!733287) (not e!627526))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71199 0))(
  ( (array!71200 (arr!34263 (Array (_ BitVec 32) (_ BitVec 64))) (size!34800 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71199)

(declare-datatypes ((V!41297 0))(
  ( (V!41298 (val!13620 Int)) )
))
(declare-datatypes ((ValueCell!12854 0))(
  ( (ValueCellFull!12854 (v!16239 V!41297)) (EmptyCell!12854) )
))
(declare-datatypes ((array!71201 0))(
  ( (array!71202 (arr!34264 (Array (_ BitVec 32) ValueCell!12854)) (size!34801 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71201)

(assert (=> b!1099299 (= res!733287 (and (= (size!34801 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34800 _keys!1070) (size!34801 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42457 () Bool)

(declare-fun mapRes!42457 () Bool)

(declare-fun tp!81164 () Bool)

(declare-fun e!627529 () Bool)

(assert (=> mapNonEmpty!42457 (= mapRes!42457 (and tp!81164 e!627529))))

(declare-fun mapValue!42457 () ValueCell!12854)

(declare-fun mapKey!42457 () (_ BitVec 32))

(declare-fun mapRest!42457 () (Array (_ BitVec 32) ValueCell!12854))

(assert (=> mapNonEmpty!42457 (= (arr!34264 _values!874) (store mapRest!42457 mapKey!42457 mapValue!42457))))

(declare-datatypes ((tuple2!17310 0))(
  ( (tuple2!17311 (_1!8666 (_ BitVec 64)) (_2!8666 V!41297)) )
))
(declare-fun lt!491510 () tuple2!17310)

(declare-fun lt!491505 () tuple2!17310)

(declare-fun b!1099300 () Bool)

(declare-fun e!627528 () Bool)

(declare-datatypes ((List!23934 0))(
  ( (Nil!23931) (Cons!23930 (h!25148 tuple2!17310) (t!34049 List!23934)) )
))
(declare-datatypes ((ListLongMap!15287 0))(
  ( (ListLongMap!15288 (toList!7659 List!23934)) )
))
(declare-fun lt!491509 () ListLongMap!15287)

(declare-fun lt!491512 () ListLongMap!15287)

(declare-fun +!3393 (ListLongMap!15287 tuple2!17310) ListLongMap!15287)

(assert (=> b!1099300 (= e!627528 (= lt!491512 (+!3393 (+!3393 lt!491509 lt!491510) lt!491505)))))

(declare-fun e!627523 () Bool)

(assert (=> b!1099300 e!627523))

(declare-fun res!733286 () Bool)

(assert (=> b!1099300 (=> (not res!733286) (not e!627523))))

(declare-fun lt!491508 () ListLongMap!15287)

(assert (=> b!1099300 (= res!733286 (= lt!491512 (+!3393 (+!3393 lt!491508 lt!491510) lt!491505)))))

(declare-fun minValue!831 () V!41297)

(assert (=> b!1099300 (= lt!491505 (tuple2!17311 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun zeroValue!831 () V!41297)

(assert (=> b!1099300 (= lt!491510 (tuple2!17311 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099301 () Bool)

(declare-fun res!733285 () Bool)

(assert (=> b!1099301 (=> (not res!733285) (not e!627526))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099301 (= res!733285 (= (select (arr!34263 _keys!1070) i!650) k0!904))))

(declare-fun res!733289 () Bool)

(assert (=> start!96786 (=> (not res!733289) (not e!627526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96786 (= res!733289 (validMask!0 mask!1414))))

(assert (=> start!96786 e!627526))

(assert (=> start!96786 tp!81163))

(assert (=> start!96786 true))

(declare-fun tp_is_empty!27127 () Bool)

(assert (=> start!96786 tp_is_empty!27127))

(declare-fun array_inv!26422 (array!71199) Bool)

(assert (=> start!96786 (array_inv!26422 _keys!1070)))

(declare-fun e!627524 () Bool)

(declare-fun array_inv!26423 (array!71201) Bool)

(assert (=> start!96786 (and (array_inv!26423 _values!874) e!627524)))

(declare-fun lt!491513 () ListLongMap!15287)

(declare-fun lt!491507 () ListLongMap!15287)

(declare-fun b!1099302 () Bool)

(assert (=> b!1099302 (= e!627523 (= lt!491507 (+!3393 (+!3393 lt!491513 lt!491510) lt!491505)))))

(declare-fun b!1099303 () Bool)

(declare-fun e!627530 () Bool)

(assert (=> b!1099303 (= e!627530 tp_is_empty!27127)))

(declare-fun b!1099304 () Bool)

(declare-fun e!627525 () Bool)

(assert (=> b!1099304 (= e!627526 e!627525)))

(declare-fun res!733290 () Bool)

(assert (=> b!1099304 (=> (not res!733290) (not e!627525))))

(declare-fun lt!491503 () array!71199)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71199 (_ BitVec 32)) Bool)

(assert (=> b!1099304 (= res!733290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491503 mask!1414))))

(assert (=> b!1099304 (= lt!491503 (array!71200 (store (arr!34263 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34800 _keys!1070)))))

(declare-fun b!1099305 () Bool)

(declare-fun res!733288 () Bool)

(assert (=> b!1099305 (=> (not res!733288) (not e!627525))))

(declare-datatypes ((List!23935 0))(
  ( (Nil!23932) (Cons!23931 (h!25149 (_ BitVec 64)) (t!34050 List!23935)) )
))
(declare-fun arrayNoDuplicates!0 (array!71199 (_ BitVec 32) List!23935) Bool)

(assert (=> b!1099305 (= res!733288 (arrayNoDuplicates!0 lt!491503 #b00000000000000000000000000000000 Nil!23932))))

(declare-fun mapIsEmpty!42457 () Bool)

(assert (=> mapIsEmpty!42457 mapRes!42457))

(declare-fun b!1099306 () Bool)

(declare-fun res!733291 () Bool)

(assert (=> b!1099306 (=> (not res!733291) (not e!627526))))

(assert (=> b!1099306 (= res!733291 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23932))))

(declare-fun b!1099307 () Bool)

(assert (=> b!1099307 (= e!627524 (and e!627530 mapRes!42457))))

(declare-fun condMapEmpty!42457 () Bool)

(declare-fun mapDefault!42457 () ValueCell!12854)

(assert (=> b!1099307 (= condMapEmpty!42457 (= (arr!34264 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12854)) mapDefault!42457)))))

(declare-fun b!1099308 () Bool)

(assert (=> b!1099308 (= e!627525 (not e!627528))))

(declare-fun res!733284 () Bool)

(assert (=> b!1099308 (=> res!733284 e!627528)))

(assert (=> b!1099308 (= res!733284 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4370 (array!71199 array!71201 (_ BitVec 32) (_ BitVec 32) V!41297 V!41297 (_ BitVec 32) Int) ListLongMap!15287)

(assert (=> b!1099308 (= lt!491507 (getCurrentListMap!4370 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491506 () array!71201)

(assert (=> b!1099308 (= lt!491512 (getCurrentListMap!4370 lt!491503 lt!491506 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1099308 (and (= lt!491508 lt!491509) (= lt!491509 lt!491508))))

(declare-fun -!932 (ListLongMap!15287 (_ BitVec 64)) ListLongMap!15287)

(assert (=> b!1099308 (= lt!491509 (-!932 lt!491513 k0!904))))

(declare-datatypes ((Unit!36107 0))(
  ( (Unit!36108) )
))
(declare-fun lt!491511 () Unit!36107)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!204 (array!71199 array!71201 (_ BitVec 32) (_ BitVec 32) V!41297 V!41297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36107)

(assert (=> b!1099308 (= lt!491511 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!204 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4211 (array!71199 array!71201 (_ BitVec 32) (_ BitVec 32) V!41297 V!41297 (_ BitVec 32) Int) ListLongMap!15287)

(assert (=> b!1099308 (= lt!491508 (getCurrentListMapNoExtraKeys!4211 lt!491503 lt!491506 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2329 (Int (_ BitVec 64)) V!41297)

(assert (=> b!1099308 (= lt!491506 (array!71202 (store (arr!34264 _values!874) i!650 (ValueCellFull!12854 (dynLambda!2329 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34801 _values!874)))))

(assert (=> b!1099308 (= lt!491513 (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099308 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491504 () Unit!36107)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71199 (_ BitVec 64) (_ BitVec 32)) Unit!36107)

(assert (=> b!1099308 (= lt!491504 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1099309 () Bool)

(declare-fun res!733293 () Bool)

(assert (=> b!1099309 (=> (not res!733293) (not e!627526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099309 (= res!733293 (validKeyInArray!0 k0!904))))

(declare-fun b!1099310 () Bool)

(declare-fun res!733283 () Bool)

(assert (=> b!1099310 (=> (not res!733283) (not e!627526))))

(assert (=> b!1099310 (= res!733283 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34800 _keys!1070))))))

(declare-fun b!1099311 () Bool)

(assert (=> b!1099311 (= e!627529 tp_is_empty!27127)))

(declare-fun b!1099312 () Bool)

(declare-fun res!733292 () Bool)

(assert (=> b!1099312 (=> (not res!733292) (not e!627526))))

(assert (=> b!1099312 (= res!733292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96786 res!733289) b!1099299))

(assert (= (and b!1099299 res!733287) b!1099312))

(assert (= (and b!1099312 res!733292) b!1099306))

(assert (= (and b!1099306 res!733291) b!1099310))

(assert (= (and b!1099310 res!733283) b!1099309))

(assert (= (and b!1099309 res!733293) b!1099301))

(assert (= (and b!1099301 res!733285) b!1099304))

(assert (= (and b!1099304 res!733290) b!1099305))

(assert (= (and b!1099305 res!733288) b!1099308))

(assert (= (and b!1099308 (not res!733284)) b!1099300))

(assert (= (and b!1099300 res!733286) b!1099302))

(assert (= (and b!1099307 condMapEmpty!42457) mapIsEmpty!42457))

(assert (= (and b!1099307 (not condMapEmpty!42457)) mapNonEmpty!42457))

(get-info :version)

(assert (= (and mapNonEmpty!42457 ((_ is ValueCellFull!12854) mapValue!42457)) b!1099311))

(assert (= (and b!1099307 ((_ is ValueCellFull!12854) mapDefault!42457)) b!1099303))

(assert (= start!96786 b!1099307))

(declare-fun b_lambda!17805 () Bool)

(assert (=> (not b_lambda!17805) (not b!1099308)))

(declare-fun t!34048 () Bool)

(declare-fun tb!7935 () Bool)

(assert (=> (and start!96786 (= defaultEntry!882 defaultEntry!882) t!34048) tb!7935))

(declare-fun result!16405 () Bool)

(assert (=> tb!7935 (= result!16405 tp_is_empty!27127)))

(assert (=> b!1099308 t!34048))

(declare-fun b_and!36857 () Bool)

(assert (= b_and!36855 (and (=> t!34048 result!16405) b_and!36857)))

(declare-fun m!1019203 () Bool)

(assert (=> mapNonEmpty!42457 m!1019203))

(declare-fun m!1019205 () Bool)

(assert (=> start!96786 m!1019205))

(declare-fun m!1019207 () Bool)

(assert (=> start!96786 m!1019207))

(declare-fun m!1019209 () Bool)

(assert (=> start!96786 m!1019209))

(declare-fun m!1019211 () Bool)

(assert (=> b!1099304 m!1019211))

(declare-fun m!1019213 () Bool)

(assert (=> b!1099304 m!1019213))

(declare-fun m!1019215 () Bool)

(assert (=> b!1099309 m!1019215))

(declare-fun m!1019217 () Bool)

(assert (=> b!1099306 m!1019217))

(declare-fun m!1019219 () Bool)

(assert (=> b!1099308 m!1019219))

(declare-fun m!1019221 () Bool)

(assert (=> b!1099308 m!1019221))

(declare-fun m!1019223 () Bool)

(assert (=> b!1099308 m!1019223))

(declare-fun m!1019225 () Bool)

(assert (=> b!1099308 m!1019225))

(declare-fun m!1019227 () Bool)

(assert (=> b!1099308 m!1019227))

(declare-fun m!1019229 () Bool)

(assert (=> b!1099308 m!1019229))

(declare-fun m!1019231 () Bool)

(assert (=> b!1099308 m!1019231))

(declare-fun m!1019233 () Bool)

(assert (=> b!1099308 m!1019233))

(declare-fun m!1019235 () Bool)

(assert (=> b!1099308 m!1019235))

(declare-fun m!1019237 () Bool)

(assert (=> b!1099308 m!1019237))

(declare-fun m!1019239 () Bool)

(assert (=> b!1099300 m!1019239))

(assert (=> b!1099300 m!1019239))

(declare-fun m!1019241 () Bool)

(assert (=> b!1099300 m!1019241))

(declare-fun m!1019243 () Bool)

(assert (=> b!1099300 m!1019243))

(assert (=> b!1099300 m!1019243))

(declare-fun m!1019245 () Bool)

(assert (=> b!1099300 m!1019245))

(declare-fun m!1019247 () Bool)

(assert (=> b!1099312 m!1019247))

(declare-fun m!1019249 () Bool)

(assert (=> b!1099302 m!1019249))

(assert (=> b!1099302 m!1019249))

(declare-fun m!1019251 () Bool)

(assert (=> b!1099302 m!1019251))

(declare-fun m!1019253 () Bool)

(assert (=> b!1099301 m!1019253))

(declare-fun m!1019255 () Bool)

(assert (=> b!1099305 m!1019255))

(check-sat (not b!1099312) (not start!96786) b_and!36857 (not b!1099300) (not b!1099309) (not b!1099306) (not b!1099305) (not b!1099304) (not b!1099302) (not mapNonEmpty!42457) (not b!1099308) tp_is_empty!27127 (not b_lambda!17805) (not b_next!23077))
(check-sat b_and!36857 (not b_next!23077))
