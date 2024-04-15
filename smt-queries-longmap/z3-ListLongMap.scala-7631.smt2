; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96100 () Bool)

(assert start!96100)

(declare-fun b_free!22759 () Bool)

(declare-fun b_next!22759 () Bool)

(assert (=> start!96100 (= b_free!22759 (not b_next!22759))))

(declare-fun tp!80125 () Bool)

(declare-fun b_and!36167 () Bool)

(assert (=> start!96100 (= tp!80125 b_and!36167)))

(declare-fun b!1090294 () Bool)

(declare-fun res!727394 () Bool)

(declare-fun e!622702 () Bool)

(assert (=> b!1090294 (=> (not res!727394) (not e!622702))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70364 0))(
  ( (array!70365 (arr!33856 (Array (_ BitVec 32) (_ BitVec 64))) (size!34394 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70364)

(declare-datatypes ((V!40809 0))(
  ( (V!40810 (val!13437 Int)) )
))
(declare-datatypes ((ValueCell!12671 0))(
  ( (ValueCellFull!12671 (v!16057 V!40809)) (EmptyCell!12671) )
))
(declare-datatypes ((array!70366 0))(
  ( (array!70367 (arr!33857 (Array (_ BitVec 32) ValueCell!12671)) (size!34395 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70366)

(assert (=> b!1090294 (= res!727394 (and (= (size!34395 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34394 _keys!1070) (size!34395 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090295 () Bool)

(declare-fun res!727391 () Bool)

(assert (=> b!1090295 (=> (not res!727391) (not e!622702))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090295 (= res!727391 (= (select (arr!33856 _keys!1070) i!650) k0!904))))

(declare-fun b!1090296 () Bool)

(declare-fun res!727388 () Bool)

(assert (=> b!1090296 (=> (not res!727388) (not e!622702))))

(declare-datatypes ((List!23699 0))(
  ( (Nil!23696) (Cons!23695 (h!24904 (_ BitVec 64)) (t!33507 List!23699)) )
))
(declare-fun arrayNoDuplicates!0 (array!70364 (_ BitVec 32) List!23699) Bool)

(assert (=> b!1090296 (= res!727388 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23696))))

(declare-fun b!1090297 () Bool)

(declare-fun e!622709 () Bool)

(declare-fun e!622707 () Bool)

(assert (=> b!1090297 (= e!622709 (not e!622707))))

(declare-fun res!727390 () Bool)

(assert (=> b!1090297 (=> res!727390 e!622707)))

(assert (=> b!1090297 (= res!727390 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40809)

(declare-fun zeroValue!831 () V!40809)

(declare-datatypes ((tuple2!17134 0))(
  ( (tuple2!17135 (_1!8578 (_ BitVec 64)) (_2!8578 V!40809)) )
))
(declare-datatypes ((List!23700 0))(
  ( (Nil!23697) (Cons!23696 (h!24905 tuple2!17134) (t!33508 List!23700)) )
))
(declare-datatypes ((ListLongMap!15103 0))(
  ( (ListLongMap!15104 (toList!7567 List!23700)) )
))
(declare-fun lt!486351 () ListLongMap!15103)

(declare-fun getCurrentListMap!4238 (array!70364 array!70366 (_ BitVec 32) (_ BitVec 32) V!40809 V!40809 (_ BitVec 32) Int) ListLongMap!15103)

(assert (=> b!1090297 (= lt!486351 (getCurrentListMap!4238 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486345 () ListLongMap!15103)

(declare-fun lt!486344 () array!70364)

(declare-fun lt!486342 () array!70366)

(assert (=> b!1090297 (= lt!486345 (getCurrentListMap!4238 lt!486344 lt!486342 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486347 () ListLongMap!15103)

(declare-fun lt!486353 () ListLongMap!15103)

(assert (=> b!1090297 (and (= lt!486347 lt!486353) (= lt!486353 lt!486347))))

(declare-fun lt!486352 () ListLongMap!15103)

(declare-fun -!842 (ListLongMap!15103 (_ BitVec 64)) ListLongMap!15103)

(assert (=> b!1090297 (= lt!486353 (-!842 lt!486352 k0!904))))

(declare-datatypes ((Unit!35719 0))(
  ( (Unit!35720) )
))
(declare-fun lt!486341 () Unit!35719)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!122 (array!70364 array!70366 (_ BitVec 32) (_ BitVec 32) V!40809 V!40809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35719)

(assert (=> b!1090297 (= lt!486341 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!122 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4108 (array!70364 array!70366 (_ BitVec 32) (_ BitVec 32) V!40809 V!40809 (_ BitVec 32) Int) ListLongMap!15103)

(assert (=> b!1090297 (= lt!486347 (getCurrentListMapNoExtraKeys!4108 lt!486344 lt!486342 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2179 (Int (_ BitVec 64)) V!40809)

(assert (=> b!1090297 (= lt!486342 (array!70367 (store (arr!33857 _values!874) i!650 (ValueCellFull!12671 (dynLambda!2179 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34395 _values!874)))))

(assert (=> b!1090297 (= lt!486352 (getCurrentListMapNoExtraKeys!4108 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090297 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486343 () Unit!35719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70364 (_ BitVec 64) (_ BitVec 32)) Unit!35719)

(assert (=> b!1090297 (= lt!486343 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090298 () Bool)

(assert (=> b!1090298 (= e!622702 e!622709)))

(declare-fun res!727392 () Bool)

(assert (=> b!1090298 (=> (not res!727392) (not e!622709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70364 (_ BitVec 32)) Bool)

(assert (=> b!1090298 (= res!727392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486344 mask!1414))))

(assert (=> b!1090298 (= lt!486344 (array!70365 (store (arr!33856 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34394 _keys!1070)))))

(declare-fun b!1090299 () Bool)

(declare-fun res!727398 () Bool)

(assert (=> b!1090299 (=> (not res!727398) (not e!622702))))

(assert (=> b!1090299 (= res!727398 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34394 _keys!1070))))))

(declare-fun b!1090300 () Bool)

(declare-fun e!622706 () Bool)

(declare-fun tp_is_empty!26761 () Bool)

(assert (=> b!1090300 (= e!622706 tp_is_empty!26761)))

(declare-fun b!1090301 () Bool)

(declare-fun res!727396 () Bool)

(assert (=> b!1090301 (=> (not res!727396) (not e!622709))))

(assert (=> b!1090301 (= res!727396 (arrayNoDuplicates!0 lt!486344 #b00000000000000000000000000000000 Nil!23696))))

(declare-fun b!1090302 () Bool)

(declare-fun res!727389 () Bool)

(assert (=> b!1090302 (=> (not res!727389) (not e!622702))))

(assert (=> b!1090302 (= res!727389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090303 () Bool)

(declare-fun res!727395 () Bool)

(assert (=> b!1090303 (=> (not res!727395) (not e!622702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090303 (= res!727395 (validKeyInArray!0 k0!904))))

(declare-fun b!1090304 () Bool)

(declare-fun e!622705 () Bool)

(assert (=> b!1090304 (= e!622707 e!622705)))

(declare-fun res!727397 () Bool)

(assert (=> b!1090304 (=> res!727397 e!622705)))

(assert (=> b!1090304 (= res!727397 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!486348 () ListLongMap!15103)

(assert (=> b!1090304 (= lt!486351 lt!486348)))

(declare-fun lt!486349 () tuple2!17134)

(declare-fun +!3359 (ListLongMap!15103 tuple2!17134) ListLongMap!15103)

(assert (=> b!1090304 (= lt!486348 (+!3359 lt!486352 lt!486349))))

(declare-fun lt!486346 () ListLongMap!15103)

(assert (=> b!1090304 (= lt!486345 lt!486346)))

(assert (=> b!1090304 (= lt!486346 (+!3359 lt!486353 lt!486349))))

(assert (=> b!1090304 (= lt!486345 (+!3359 lt!486347 lt!486349))))

(assert (=> b!1090304 (= lt!486349 (tuple2!17135 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090305 () Bool)

(declare-fun e!622708 () Bool)

(assert (=> b!1090305 (= e!622708 tp_is_empty!26761)))

(declare-fun b!1090306 () Bool)

(declare-fun e!622704 () Bool)

(declare-fun mapRes!41896 () Bool)

(assert (=> b!1090306 (= e!622704 (and e!622706 mapRes!41896))))

(declare-fun condMapEmpty!41896 () Bool)

(declare-fun mapDefault!41896 () ValueCell!12671)

(assert (=> b!1090306 (= condMapEmpty!41896 (= (arr!33857 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12671)) mapDefault!41896)))))

(declare-fun mapIsEmpty!41896 () Bool)

(assert (=> mapIsEmpty!41896 mapRes!41896))

(declare-fun res!727393 () Bool)

(assert (=> start!96100 (=> (not res!727393) (not e!622702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96100 (= res!727393 (validMask!0 mask!1414))))

(assert (=> start!96100 e!622702))

(assert (=> start!96100 tp!80125))

(assert (=> start!96100 true))

(assert (=> start!96100 tp_is_empty!26761))

(declare-fun array_inv!26144 (array!70364) Bool)

(assert (=> start!96100 (array_inv!26144 _keys!1070)))

(declare-fun array_inv!26145 (array!70366) Bool)

(assert (=> start!96100 (and (array_inv!26145 _values!874) e!622704)))

(declare-fun mapNonEmpty!41896 () Bool)

(declare-fun tp!80126 () Bool)

(assert (=> mapNonEmpty!41896 (= mapRes!41896 (and tp!80126 e!622708))))

(declare-fun mapRest!41896 () (Array (_ BitVec 32) ValueCell!12671))

(declare-fun mapValue!41896 () ValueCell!12671)

(declare-fun mapKey!41896 () (_ BitVec 32))

(assert (=> mapNonEmpty!41896 (= (arr!33857 _values!874) (store mapRest!41896 mapKey!41896 mapValue!41896))))

(declare-fun b!1090307 () Bool)

(assert (=> b!1090307 (= e!622705 true)))

(assert (=> b!1090307 (= (-!842 lt!486348 k0!904) lt!486346)))

(declare-fun lt!486350 () Unit!35719)

(declare-fun addRemoveCommutativeForDiffKeys!89 (ListLongMap!15103 (_ BitVec 64) V!40809 (_ BitVec 64)) Unit!35719)

(assert (=> b!1090307 (= lt!486350 (addRemoveCommutativeForDiffKeys!89 lt!486352 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(assert (= (and start!96100 res!727393) b!1090294))

(assert (= (and b!1090294 res!727394) b!1090302))

(assert (= (and b!1090302 res!727389) b!1090296))

(assert (= (and b!1090296 res!727388) b!1090299))

(assert (= (and b!1090299 res!727398) b!1090303))

(assert (= (and b!1090303 res!727395) b!1090295))

(assert (= (and b!1090295 res!727391) b!1090298))

(assert (= (and b!1090298 res!727392) b!1090301))

(assert (= (and b!1090301 res!727396) b!1090297))

(assert (= (and b!1090297 (not res!727390)) b!1090304))

(assert (= (and b!1090304 (not res!727397)) b!1090307))

(assert (= (and b!1090306 condMapEmpty!41896) mapIsEmpty!41896))

(assert (= (and b!1090306 (not condMapEmpty!41896)) mapNonEmpty!41896))

(get-info :version)

(assert (= (and mapNonEmpty!41896 ((_ is ValueCellFull!12671) mapValue!41896)) b!1090305))

(assert (= (and b!1090306 ((_ is ValueCellFull!12671) mapDefault!41896)) b!1090300))

(assert (= start!96100 b!1090306))

(declare-fun b_lambda!17407 () Bool)

(assert (=> (not b_lambda!17407) (not b!1090297)))

(declare-fun t!33506 () Bool)

(declare-fun tb!7629 () Bool)

(assert (=> (and start!96100 (= defaultEntry!882 defaultEntry!882) t!33506) tb!7629))

(declare-fun result!15785 () Bool)

(assert (=> tb!7629 (= result!15785 tp_is_empty!26761)))

(assert (=> b!1090297 t!33506))

(declare-fun b_and!36169 () Bool)

(assert (= b_and!36167 (and (=> t!33506 result!15785) b_and!36169)))

(declare-fun m!1009229 () Bool)

(assert (=> b!1090295 m!1009229))

(declare-fun m!1009231 () Bool)

(assert (=> b!1090302 m!1009231))

(declare-fun m!1009233 () Bool)

(assert (=> b!1090304 m!1009233))

(declare-fun m!1009235 () Bool)

(assert (=> b!1090304 m!1009235))

(declare-fun m!1009237 () Bool)

(assert (=> b!1090304 m!1009237))

(declare-fun m!1009239 () Bool)

(assert (=> start!96100 m!1009239))

(declare-fun m!1009241 () Bool)

(assert (=> start!96100 m!1009241))

(declare-fun m!1009243 () Bool)

(assert (=> start!96100 m!1009243))

(declare-fun m!1009245 () Bool)

(assert (=> b!1090303 m!1009245))

(declare-fun m!1009247 () Bool)

(assert (=> mapNonEmpty!41896 m!1009247))

(declare-fun m!1009249 () Bool)

(assert (=> b!1090296 m!1009249))

(declare-fun m!1009251 () Bool)

(assert (=> b!1090307 m!1009251))

(declare-fun m!1009253 () Bool)

(assert (=> b!1090307 m!1009253))

(declare-fun m!1009255 () Bool)

(assert (=> b!1090301 m!1009255))

(declare-fun m!1009257 () Bool)

(assert (=> b!1090298 m!1009257))

(declare-fun m!1009259 () Bool)

(assert (=> b!1090298 m!1009259))

(declare-fun m!1009261 () Bool)

(assert (=> b!1090297 m!1009261))

(declare-fun m!1009263 () Bool)

(assert (=> b!1090297 m!1009263))

(declare-fun m!1009265 () Bool)

(assert (=> b!1090297 m!1009265))

(declare-fun m!1009267 () Bool)

(assert (=> b!1090297 m!1009267))

(declare-fun m!1009269 () Bool)

(assert (=> b!1090297 m!1009269))

(declare-fun m!1009271 () Bool)

(assert (=> b!1090297 m!1009271))

(declare-fun m!1009273 () Bool)

(assert (=> b!1090297 m!1009273))

(declare-fun m!1009275 () Bool)

(assert (=> b!1090297 m!1009275))

(declare-fun m!1009277 () Bool)

(assert (=> b!1090297 m!1009277))

(declare-fun m!1009279 () Bool)

(assert (=> b!1090297 m!1009279))

(check-sat (not mapNonEmpty!41896) (not b!1090303) (not b_next!22759) (not b!1090304) (not b!1090298) (not start!96100) (not b!1090307) (not b!1090302) b_and!36169 (not b!1090297) (not b!1090296) (not b!1090301) tp_is_empty!26761 (not b_lambda!17407))
(check-sat b_and!36169 (not b_next!22759))
