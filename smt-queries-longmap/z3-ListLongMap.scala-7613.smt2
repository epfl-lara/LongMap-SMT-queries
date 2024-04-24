; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96234 () Bool)

(assert start!96234)

(declare-fun b_free!22651 () Bool)

(declare-fun b_next!22651 () Bool)

(assert (=> start!96234 (= b_free!22651 (not b_next!22651))))

(declare-fun tp!79802 () Bool)

(declare-fun b_and!35987 () Bool)

(assert (=> start!96234 (= tp!79802 b_and!35987)))

(declare-fun res!726197 () Bool)

(declare-fun e!622361 () Bool)

(assert (=> start!96234 (=> (not res!726197) (not e!622361))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96234 (= res!726197 (validMask!0 mask!1414))))

(assert (=> start!96234 e!622361))

(assert (=> start!96234 tp!79802))

(assert (=> start!96234 true))

(declare-fun tp_is_empty!26653 () Bool)

(assert (=> start!96234 tp_is_empty!26653))

(declare-datatypes ((array!70271 0))(
  ( (array!70272 (arr!33803 (Array (_ BitVec 32) (_ BitVec 64))) (size!34340 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70271)

(declare-fun array_inv!26124 (array!70271) Bool)

(assert (=> start!96234 (array_inv!26124 _keys!1070)))

(declare-datatypes ((V!40665 0))(
  ( (V!40666 (val!13383 Int)) )
))
(declare-datatypes ((ValueCell!12617 0))(
  ( (ValueCellFull!12617 (v!16000 V!40665)) (EmptyCell!12617) )
))
(declare-datatypes ((array!70273 0))(
  ( (array!70274 (arr!33804 (Array (_ BitVec 32) ValueCell!12617)) (size!34341 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70273)

(declare-fun e!622359 () Bool)

(declare-fun array_inv!26125 (array!70273) Bool)

(assert (=> start!96234 (and (array_inv!26125 _values!874) e!622359)))

(declare-fun b!1089389 () Bool)

(declare-fun e!622360 () Bool)

(assert (=> b!1089389 (= e!622360 tp_is_empty!26653)))

(declare-fun b!1089390 () Bool)

(declare-fun e!622356 () Bool)

(declare-fun e!622354 () Bool)

(assert (=> b!1089390 (= e!622356 (not e!622354))))

(declare-fun res!726190 () Bool)

(assert (=> b!1089390 (=> res!726190 e!622354)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089390 (= res!726190 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40665)

(declare-datatypes ((tuple2!17002 0))(
  ( (tuple2!17003 (_1!8512 (_ BitVec 64)) (_2!8512 V!40665)) )
))
(declare-datatypes ((List!23595 0))(
  ( (Nil!23592) (Cons!23591 (h!24809 tuple2!17002) (t!33296 List!23595)) )
))
(declare-datatypes ((ListLongMap!14979 0))(
  ( (ListLongMap!14980 (toList!7505 List!23595)) )
))
(declare-fun lt!484983 () ListLongMap!14979)

(declare-fun zeroValue!831 () V!40665)

(declare-fun getCurrentListMap!4264 (array!70271 array!70273 (_ BitVec 32) (_ BitVec 32) V!40665 V!40665 (_ BitVec 32) Int) ListLongMap!14979)

(assert (=> b!1089390 (= lt!484983 (getCurrentListMap!4264 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484985 () array!70271)

(declare-fun lt!484984 () ListLongMap!14979)

(declare-fun lt!484989 () array!70273)

(assert (=> b!1089390 (= lt!484984 (getCurrentListMap!4264 lt!484985 lt!484989 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484977 () ListLongMap!14979)

(declare-fun lt!484988 () ListLongMap!14979)

(assert (=> b!1089390 (and (= lt!484977 lt!484988) (= lt!484988 lt!484977))))

(declare-fun lt!484980 () ListLongMap!14979)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!816 (ListLongMap!14979 (_ BitVec 64)) ListLongMap!14979)

(assert (=> b!1089390 (= lt!484988 (-!816 lt!484980 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35799 0))(
  ( (Unit!35800) )
))
(declare-fun lt!484981 () Unit!35799)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!93 (array!70271 array!70273 (_ BitVec 32) (_ BitVec 32) V!40665 V!40665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35799)

(assert (=> b!1089390 (= lt!484981 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!93 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4069 (array!70271 array!70273 (_ BitVec 32) (_ BitVec 32) V!40665 V!40665 (_ BitVec 32) Int) ListLongMap!14979)

(assert (=> b!1089390 (= lt!484977 (getCurrentListMapNoExtraKeys!4069 lt!484985 lt!484989 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2190 (Int (_ BitVec 64)) V!40665)

(assert (=> b!1089390 (= lt!484989 (array!70274 (store (arr!33804 _values!874) i!650 (ValueCellFull!12617 (dynLambda!2190 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34341 _values!874)))))

(assert (=> b!1089390 (= lt!484980 (getCurrentListMapNoExtraKeys!4069 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089390 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484982 () Unit!35799)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70271 (_ BitVec 64) (_ BitVec 32)) Unit!35799)

(assert (=> b!1089390 (= lt!484982 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41734 () Bool)

(declare-fun mapRes!41734 () Bool)

(declare-fun tp!79801 () Bool)

(assert (=> mapNonEmpty!41734 (= mapRes!41734 (and tp!79801 e!622360))))

(declare-fun mapValue!41734 () ValueCell!12617)

(declare-fun mapRest!41734 () (Array (_ BitVec 32) ValueCell!12617))

(declare-fun mapKey!41734 () (_ BitVec 32))

(assert (=> mapNonEmpty!41734 (= (arr!33804 _values!874) (store mapRest!41734 mapKey!41734 mapValue!41734))))

(declare-fun b!1089391 () Bool)

(declare-fun res!726189 () Bool)

(assert (=> b!1089391 (=> (not res!726189) (not e!622361))))

(declare-datatypes ((List!23596 0))(
  ( (Nil!23593) (Cons!23592 (h!24810 (_ BitVec 64)) (t!33297 List!23596)) )
))
(declare-fun arrayNoDuplicates!0 (array!70271 (_ BitVec 32) List!23596) Bool)

(assert (=> b!1089391 (= res!726189 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23593))))

(declare-fun b!1089392 () Bool)

(assert (=> b!1089392 (= e!622361 e!622356)))

(declare-fun res!726188 () Bool)

(assert (=> b!1089392 (=> (not res!726188) (not e!622356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70271 (_ BitVec 32)) Bool)

(assert (=> b!1089392 (= res!726188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484985 mask!1414))))

(assert (=> b!1089392 (= lt!484985 (array!70272 (store (arr!33803 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34340 _keys!1070)))))

(declare-fun b!1089393 () Bool)

(declare-fun res!726191 () Bool)

(assert (=> b!1089393 (=> (not res!726191) (not e!622361))))

(assert (=> b!1089393 (= res!726191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41734 () Bool)

(assert (=> mapIsEmpty!41734 mapRes!41734))

(declare-fun b!1089394 () Bool)

(declare-fun e!622357 () Bool)

(assert (=> b!1089394 (= e!622359 (and e!622357 mapRes!41734))))

(declare-fun condMapEmpty!41734 () Bool)

(declare-fun mapDefault!41734 () ValueCell!12617)

(assert (=> b!1089394 (= condMapEmpty!41734 (= (arr!33804 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12617)) mapDefault!41734)))))

(declare-fun b!1089395 () Bool)

(assert (=> b!1089395 (= e!622357 tp_is_empty!26653)))

(declare-fun b!1089396 () Bool)

(declare-fun res!726195 () Bool)

(assert (=> b!1089396 (=> (not res!726195) (not e!622356))))

(assert (=> b!1089396 (= res!726195 (arrayNoDuplicates!0 lt!484985 #b00000000000000000000000000000000 Nil!23593))))

(declare-fun b!1089397 () Bool)

(declare-fun res!726198 () Bool)

(assert (=> b!1089397 (=> (not res!726198) (not e!622361))))

(assert (=> b!1089397 (= res!726198 (and (= (size!34341 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34340 _keys!1070) (size!34341 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089398 () Bool)

(declare-fun e!622358 () Bool)

(assert (=> b!1089398 (= e!622354 e!622358)))

(declare-fun res!726194 () Bool)

(assert (=> b!1089398 (=> res!726194 e!622358)))

(assert (=> b!1089398 (= res!726194 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484987 () ListLongMap!14979)

(assert (=> b!1089398 (= lt!484984 lt!484987)))

(declare-fun lt!484978 () tuple2!17002)

(declare-fun +!3327 (ListLongMap!14979 tuple2!17002) ListLongMap!14979)

(assert (=> b!1089398 (= lt!484987 (+!3327 lt!484988 lt!484978))))

(declare-fun lt!484986 () ListLongMap!14979)

(assert (=> b!1089398 (= lt!484983 lt!484986)))

(assert (=> b!1089398 (= lt!484986 (+!3327 lt!484980 lt!484978))))

(assert (=> b!1089398 (= lt!484984 (+!3327 lt!484977 lt!484978))))

(assert (=> b!1089398 (= lt!484978 (tuple2!17003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089399 () Bool)

(declare-fun res!726196 () Bool)

(assert (=> b!1089399 (=> (not res!726196) (not e!622361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089399 (= res!726196 (validKeyInArray!0 k0!904))))

(declare-fun b!1089400 () Bool)

(assert (=> b!1089400 (= e!622358 true)))

(assert (=> b!1089400 (= (-!816 lt!484986 k0!904) lt!484987)))

(declare-fun lt!484979 () Unit!35799)

(declare-fun addRemoveCommutativeForDiffKeys!58 (ListLongMap!14979 (_ BitVec 64) V!40665 (_ BitVec 64)) Unit!35799)

(assert (=> b!1089400 (= lt!484979 (addRemoveCommutativeForDiffKeys!58 lt!484980 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089401 () Bool)

(declare-fun res!726192 () Bool)

(assert (=> b!1089401 (=> (not res!726192) (not e!622361))))

(assert (=> b!1089401 (= res!726192 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34340 _keys!1070))))))

(declare-fun b!1089402 () Bool)

(declare-fun res!726193 () Bool)

(assert (=> b!1089402 (=> (not res!726193) (not e!622361))))

(assert (=> b!1089402 (= res!726193 (= (select (arr!33803 _keys!1070) i!650) k0!904))))

(assert (= (and start!96234 res!726197) b!1089397))

(assert (= (and b!1089397 res!726198) b!1089393))

(assert (= (and b!1089393 res!726191) b!1089391))

(assert (= (and b!1089391 res!726189) b!1089401))

(assert (= (and b!1089401 res!726192) b!1089399))

(assert (= (and b!1089399 res!726196) b!1089402))

(assert (= (and b!1089402 res!726193) b!1089392))

(assert (= (and b!1089392 res!726188) b!1089396))

(assert (= (and b!1089396 res!726195) b!1089390))

(assert (= (and b!1089390 (not res!726190)) b!1089398))

(assert (= (and b!1089398 (not res!726194)) b!1089400))

(assert (= (and b!1089394 condMapEmpty!41734) mapIsEmpty!41734))

(assert (= (and b!1089394 (not condMapEmpty!41734)) mapNonEmpty!41734))

(get-info :version)

(assert (= (and mapNonEmpty!41734 ((_ is ValueCellFull!12617) mapValue!41734)) b!1089389))

(assert (= (and b!1089394 ((_ is ValueCellFull!12617) mapDefault!41734)) b!1089395))

(assert (= start!96234 b!1089394))

(declare-fun b_lambda!17331 () Bool)

(assert (=> (not b_lambda!17331) (not b!1089390)))

(declare-fun t!33295 () Bool)

(declare-fun tb!7521 () Bool)

(assert (=> (and start!96234 (= defaultEntry!882 defaultEntry!882) t!33295) tb!7521))

(declare-fun result!15569 () Bool)

(assert (=> tb!7521 (= result!15569 tp_is_empty!26653)))

(assert (=> b!1089390 t!33295))

(declare-fun b_and!35989 () Bool)

(assert (= b_and!35987 (and (=> t!33295 result!15569) b_and!35989)))

(declare-fun m!1008731 () Bool)

(assert (=> b!1089399 m!1008731))

(declare-fun m!1008733 () Bool)

(assert (=> b!1089402 m!1008733))

(declare-fun m!1008735 () Bool)

(assert (=> b!1089400 m!1008735))

(declare-fun m!1008737 () Bool)

(assert (=> b!1089400 m!1008737))

(declare-fun m!1008739 () Bool)

(assert (=> b!1089398 m!1008739))

(declare-fun m!1008741 () Bool)

(assert (=> b!1089398 m!1008741))

(declare-fun m!1008743 () Bool)

(assert (=> b!1089398 m!1008743))

(declare-fun m!1008745 () Bool)

(assert (=> b!1089390 m!1008745))

(declare-fun m!1008747 () Bool)

(assert (=> b!1089390 m!1008747))

(declare-fun m!1008749 () Bool)

(assert (=> b!1089390 m!1008749))

(declare-fun m!1008751 () Bool)

(assert (=> b!1089390 m!1008751))

(declare-fun m!1008753 () Bool)

(assert (=> b!1089390 m!1008753))

(declare-fun m!1008755 () Bool)

(assert (=> b!1089390 m!1008755))

(declare-fun m!1008757 () Bool)

(assert (=> b!1089390 m!1008757))

(declare-fun m!1008759 () Bool)

(assert (=> b!1089390 m!1008759))

(declare-fun m!1008761 () Bool)

(assert (=> b!1089390 m!1008761))

(declare-fun m!1008763 () Bool)

(assert (=> b!1089390 m!1008763))

(declare-fun m!1008765 () Bool)

(assert (=> b!1089392 m!1008765))

(declare-fun m!1008767 () Bool)

(assert (=> b!1089392 m!1008767))

(declare-fun m!1008769 () Bool)

(assert (=> b!1089393 m!1008769))

(declare-fun m!1008771 () Bool)

(assert (=> b!1089396 m!1008771))

(declare-fun m!1008773 () Bool)

(assert (=> b!1089391 m!1008773))

(declare-fun m!1008775 () Bool)

(assert (=> mapNonEmpty!41734 m!1008775))

(declare-fun m!1008777 () Bool)

(assert (=> start!96234 m!1008777))

(declare-fun m!1008779 () Bool)

(assert (=> start!96234 m!1008779))

(declare-fun m!1008781 () Bool)

(assert (=> start!96234 m!1008781))

(check-sat (not b!1089392) (not start!96234) tp_is_empty!26653 b_and!35989 (not b!1089391) (not b!1089398) (not b!1089400) (not mapNonEmpty!41734) (not b_next!22651) (not b!1089396) (not b!1089393) (not b_lambda!17331) (not b!1089399) (not b!1089390))
(check-sat b_and!35989 (not b_next!22651))
