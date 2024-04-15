; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96148 () Bool)

(assert start!96148)

(declare-fun b_free!22807 () Bool)

(declare-fun b_next!22807 () Bool)

(assert (=> start!96148 (= b_free!22807 (not b_next!22807))))

(declare-fun tp!80270 () Bool)

(declare-fun b_and!36263 () Bool)

(assert (=> start!96148 (= tp!80270 b_and!36263)))

(declare-fun b!1091350 () Bool)

(declare-fun e!623279 () Bool)

(declare-fun tp_is_empty!26809 () Bool)

(assert (=> b!1091350 (= e!623279 tp_is_empty!26809)))

(declare-fun b!1091351 () Bool)

(declare-fun e!623281 () Bool)

(assert (=> b!1091351 (= e!623281 true)))

(declare-datatypes ((V!40873 0))(
  ( (V!40874 (val!13461 Int)) )
))
(declare-datatypes ((tuple2!17174 0))(
  ( (tuple2!17175 (_1!8598 (_ BitVec 64)) (_2!8598 V!40873)) )
))
(declare-datatypes ((List!23738 0))(
  ( (Nil!23735) (Cons!23734 (h!24943 tuple2!17174) (t!33594 List!23738)) )
))
(declare-datatypes ((ListLongMap!15143 0))(
  ( (ListLongMap!15144 (toList!7587 List!23738)) )
))
(declare-fun lt!487286 () ListLongMap!15143)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!487277 () ListLongMap!15143)

(declare-fun -!860 (ListLongMap!15143 (_ BitVec 64)) ListLongMap!15143)

(assert (=> b!1091351 (= (-!860 lt!487286 k0!904) lt!487277)))

(declare-fun minValue!831 () V!40873)

(declare-fun lt!487278 () ListLongMap!15143)

(declare-datatypes ((Unit!35755 0))(
  ( (Unit!35756) )
))
(declare-fun lt!487281 () Unit!35755)

(declare-fun addRemoveCommutativeForDiffKeys!104 (ListLongMap!15143 (_ BitVec 64) V!40873 (_ BitVec 64)) Unit!35755)

(assert (=> b!1091351 (= lt!487281 (addRemoveCommutativeForDiffKeys!104 lt!487278 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091352 () Bool)

(declare-fun res!728190 () Bool)

(declare-fun e!623278 () Bool)

(assert (=> b!1091352 (=> (not res!728190) (not e!623278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091352 (= res!728190 (validKeyInArray!0 k0!904))))

(declare-fun b!1091353 () Bool)

(declare-fun res!728183 () Bool)

(assert (=> b!1091353 (=> (not res!728183) (not e!623278))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70458 0))(
  ( (array!70459 (arr!33903 (Array (_ BitVec 32) (_ BitVec 64))) (size!34441 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70458)

(assert (=> b!1091353 (= res!728183 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34441 _keys!1070))))))

(declare-fun b!1091354 () Bool)

(declare-fun e!623284 () Bool)

(assert (=> b!1091354 (= e!623284 e!623281)))

(declare-fun res!728187 () Bool)

(assert (=> b!1091354 (=> res!728187 e!623281)))

(assert (=> b!1091354 (= res!728187 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!487289 () ListLongMap!15143)

(assert (=> b!1091354 (= lt!487289 lt!487286)))

(declare-fun lt!487287 () tuple2!17174)

(declare-fun +!3376 (ListLongMap!15143 tuple2!17174) ListLongMap!15143)

(assert (=> b!1091354 (= lt!487286 (+!3376 lt!487278 lt!487287))))

(declare-fun lt!487283 () ListLongMap!15143)

(assert (=> b!1091354 (= lt!487283 lt!487277)))

(declare-fun lt!487285 () ListLongMap!15143)

(assert (=> b!1091354 (= lt!487277 (+!3376 lt!487285 lt!487287))))

(declare-fun lt!487288 () ListLongMap!15143)

(assert (=> b!1091354 (= lt!487283 (+!3376 lt!487288 lt!487287))))

(assert (=> b!1091354 (= lt!487287 (tuple2!17175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091355 () Bool)

(declare-fun res!728180 () Bool)

(assert (=> b!1091355 (=> (not res!728180) (not e!623278))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70458 (_ BitVec 32)) Bool)

(assert (=> b!1091355 (= res!728180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091356 () Bool)

(declare-fun res!728181 () Bool)

(assert (=> b!1091356 (=> (not res!728181) (not e!623278))))

(declare-datatypes ((List!23739 0))(
  ( (Nil!23736) (Cons!23735 (h!24944 (_ BitVec 64)) (t!33595 List!23739)) )
))
(declare-fun arrayNoDuplicates!0 (array!70458 (_ BitVec 32) List!23739) Bool)

(assert (=> b!1091356 (= res!728181 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23736))))

(declare-fun b!1091357 () Bool)

(declare-fun e!623283 () Bool)

(assert (=> b!1091357 (= e!623278 e!623283)))

(declare-fun res!728185 () Bool)

(assert (=> b!1091357 (=> (not res!728185) (not e!623283))))

(declare-fun lt!487282 () array!70458)

(assert (=> b!1091357 (= res!728185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487282 mask!1414))))

(assert (=> b!1091357 (= lt!487282 (array!70459 (store (arr!33903 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34441 _keys!1070)))))

(declare-fun b!1091358 () Bool)

(declare-fun res!728188 () Bool)

(assert (=> b!1091358 (=> (not res!728188) (not e!623278))))

(assert (=> b!1091358 (= res!728188 (= (select (arr!33903 _keys!1070) i!650) k0!904))))

(declare-fun res!728186 () Bool)

(assert (=> start!96148 (=> (not res!728186) (not e!623278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96148 (= res!728186 (validMask!0 mask!1414))))

(assert (=> start!96148 e!623278))

(assert (=> start!96148 tp!80270))

(assert (=> start!96148 true))

(assert (=> start!96148 tp_is_empty!26809))

(declare-fun array_inv!26180 (array!70458) Bool)

(assert (=> start!96148 (array_inv!26180 _keys!1070)))

(declare-datatypes ((ValueCell!12695 0))(
  ( (ValueCellFull!12695 (v!16081 V!40873)) (EmptyCell!12695) )
))
(declare-datatypes ((array!70460 0))(
  ( (array!70461 (arr!33904 (Array (_ BitVec 32) ValueCell!12695)) (size!34442 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70460)

(declare-fun e!623285 () Bool)

(declare-fun array_inv!26181 (array!70460) Bool)

(assert (=> start!96148 (and (array_inv!26181 _values!874) e!623285)))

(declare-fun b!1091359 () Bool)

(declare-fun res!728184 () Bool)

(assert (=> b!1091359 (=> (not res!728184) (not e!623283))))

(assert (=> b!1091359 (= res!728184 (arrayNoDuplicates!0 lt!487282 #b00000000000000000000000000000000 Nil!23736))))

(declare-fun mapNonEmpty!41968 () Bool)

(declare-fun mapRes!41968 () Bool)

(declare-fun tp!80269 () Bool)

(assert (=> mapNonEmpty!41968 (= mapRes!41968 (and tp!80269 e!623279))))

(declare-fun mapKey!41968 () (_ BitVec 32))

(declare-fun mapValue!41968 () ValueCell!12695)

(declare-fun mapRest!41968 () (Array (_ BitVec 32) ValueCell!12695))

(assert (=> mapNonEmpty!41968 (= (arr!33904 _values!874) (store mapRest!41968 mapKey!41968 mapValue!41968))))

(declare-fun b!1091360 () Bool)

(assert (=> b!1091360 (= e!623283 (not e!623284))))

(declare-fun res!728182 () Bool)

(assert (=> b!1091360 (=> res!728182 e!623284)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091360 (= res!728182 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40873)

(declare-fun getCurrentListMap!4254 (array!70458 array!70460 (_ BitVec 32) (_ BitVec 32) V!40873 V!40873 (_ BitVec 32) Int) ListLongMap!15143)

(assert (=> b!1091360 (= lt!487289 (getCurrentListMap!4254 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487280 () array!70460)

(assert (=> b!1091360 (= lt!487283 (getCurrentListMap!4254 lt!487282 lt!487280 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091360 (and (= lt!487288 lt!487285) (= lt!487285 lt!487288))))

(assert (=> b!1091360 (= lt!487285 (-!860 lt!487278 k0!904))))

(declare-fun lt!487279 () Unit!35755)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!138 (array!70458 array!70460 (_ BitVec 32) (_ BitVec 32) V!40873 V!40873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35755)

(assert (=> b!1091360 (= lt!487279 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!138 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4124 (array!70458 array!70460 (_ BitVec 32) (_ BitVec 32) V!40873 V!40873 (_ BitVec 32) Int) ListLongMap!15143)

(assert (=> b!1091360 (= lt!487288 (getCurrentListMapNoExtraKeys!4124 lt!487282 lt!487280 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2195 (Int (_ BitVec 64)) V!40873)

(assert (=> b!1091360 (= lt!487280 (array!70461 (store (arr!33904 _values!874) i!650 (ValueCellFull!12695 (dynLambda!2195 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34442 _values!874)))))

(assert (=> b!1091360 (= lt!487278 (getCurrentListMapNoExtraKeys!4124 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091360 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487284 () Unit!35755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70458 (_ BitVec 64) (_ BitVec 32)) Unit!35755)

(assert (=> b!1091360 (= lt!487284 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091361 () Bool)

(declare-fun res!728189 () Bool)

(assert (=> b!1091361 (=> (not res!728189) (not e!623278))))

(assert (=> b!1091361 (= res!728189 (and (= (size!34442 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34441 _keys!1070) (size!34442 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091362 () Bool)

(declare-fun e!623280 () Bool)

(assert (=> b!1091362 (= e!623280 tp_is_empty!26809)))

(declare-fun b!1091363 () Bool)

(assert (=> b!1091363 (= e!623285 (and e!623280 mapRes!41968))))

(declare-fun condMapEmpty!41968 () Bool)

(declare-fun mapDefault!41968 () ValueCell!12695)

(assert (=> b!1091363 (= condMapEmpty!41968 (= (arr!33904 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12695)) mapDefault!41968)))))

(declare-fun mapIsEmpty!41968 () Bool)

(assert (=> mapIsEmpty!41968 mapRes!41968))

(assert (= (and start!96148 res!728186) b!1091361))

(assert (= (and b!1091361 res!728189) b!1091355))

(assert (= (and b!1091355 res!728180) b!1091356))

(assert (= (and b!1091356 res!728181) b!1091353))

(assert (= (and b!1091353 res!728183) b!1091352))

(assert (= (and b!1091352 res!728190) b!1091358))

(assert (= (and b!1091358 res!728188) b!1091357))

(assert (= (and b!1091357 res!728185) b!1091359))

(assert (= (and b!1091359 res!728184) b!1091360))

(assert (= (and b!1091360 (not res!728182)) b!1091354))

(assert (= (and b!1091354 (not res!728187)) b!1091351))

(assert (= (and b!1091363 condMapEmpty!41968) mapIsEmpty!41968))

(assert (= (and b!1091363 (not condMapEmpty!41968)) mapNonEmpty!41968))

(get-info :version)

(assert (= (and mapNonEmpty!41968 ((_ is ValueCellFull!12695) mapValue!41968)) b!1091350))

(assert (= (and b!1091363 ((_ is ValueCellFull!12695) mapDefault!41968)) b!1091362))

(assert (= start!96148 b!1091363))

(declare-fun b_lambda!17455 () Bool)

(assert (=> (not b_lambda!17455) (not b!1091360)))

(declare-fun t!33593 () Bool)

(declare-fun tb!7677 () Bool)

(assert (=> (and start!96148 (= defaultEntry!882 defaultEntry!882) t!33593) tb!7677))

(declare-fun result!15881 () Bool)

(assert (=> tb!7677 (= result!15881 tp_is_empty!26809)))

(assert (=> b!1091360 t!33593))

(declare-fun b_and!36265 () Bool)

(assert (= b_and!36263 (and (=> t!33593 result!15881) b_and!36265)))

(declare-fun m!1010477 () Bool)

(assert (=> b!1091358 m!1010477))

(declare-fun m!1010479 () Bool)

(assert (=> b!1091355 m!1010479))

(declare-fun m!1010481 () Bool)

(assert (=> b!1091359 m!1010481))

(declare-fun m!1010483 () Bool)

(assert (=> start!96148 m!1010483))

(declare-fun m!1010485 () Bool)

(assert (=> start!96148 m!1010485))

(declare-fun m!1010487 () Bool)

(assert (=> start!96148 m!1010487))

(declare-fun m!1010489 () Bool)

(assert (=> b!1091357 m!1010489))

(declare-fun m!1010491 () Bool)

(assert (=> b!1091357 m!1010491))

(declare-fun m!1010493 () Bool)

(assert (=> mapNonEmpty!41968 m!1010493))

(declare-fun m!1010495 () Bool)

(assert (=> b!1091354 m!1010495))

(declare-fun m!1010497 () Bool)

(assert (=> b!1091354 m!1010497))

(declare-fun m!1010499 () Bool)

(assert (=> b!1091354 m!1010499))

(declare-fun m!1010501 () Bool)

(assert (=> b!1091356 m!1010501))

(declare-fun m!1010503 () Bool)

(assert (=> b!1091352 m!1010503))

(declare-fun m!1010505 () Bool)

(assert (=> b!1091360 m!1010505))

(declare-fun m!1010507 () Bool)

(assert (=> b!1091360 m!1010507))

(declare-fun m!1010509 () Bool)

(assert (=> b!1091360 m!1010509))

(declare-fun m!1010511 () Bool)

(assert (=> b!1091360 m!1010511))

(declare-fun m!1010513 () Bool)

(assert (=> b!1091360 m!1010513))

(declare-fun m!1010515 () Bool)

(assert (=> b!1091360 m!1010515))

(declare-fun m!1010517 () Bool)

(assert (=> b!1091360 m!1010517))

(declare-fun m!1010519 () Bool)

(assert (=> b!1091360 m!1010519))

(declare-fun m!1010521 () Bool)

(assert (=> b!1091360 m!1010521))

(declare-fun m!1010523 () Bool)

(assert (=> b!1091360 m!1010523))

(declare-fun m!1010525 () Bool)

(assert (=> b!1091351 m!1010525))

(declare-fun m!1010527 () Bool)

(assert (=> b!1091351 m!1010527))

(check-sat (not start!96148) (not b!1091359) (not b!1091352) tp_is_empty!26809 (not b!1091354) (not b_next!22807) (not b!1091357) (not b!1091356) b_and!36265 (not mapNonEmpty!41968) (not b!1091355) (not b_lambda!17455) (not b!1091351) (not b!1091360))
(check-sat b_and!36265 (not b_next!22807))
