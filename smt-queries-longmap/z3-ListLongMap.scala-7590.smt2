; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95854 () Bool)

(assert start!95854)

(declare-fun b_free!22513 () Bool)

(declare-fun b_next!22513 () Bool)

(assert (=> start!95854 (= b_free!22513 (not b_next!22513))))

(declare-fun tp!79387 () Bool)

(declare-fun b_and!35675 () Bool)

(assert (=> start!95854 (= tp!79387 b_and!35675)))

(declare-fun b!1084864 () Bool)

(declare-fun res!723317 () Bool)

(declare-fun e!619757 () Bool)

(assert (=> b!1084864 (=> (not res!723317) (not e!619757))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69890 0))(
  ( (array!69891 (arr!33619 (Array (_ BitVec 32) (_ BitVec 64))) (size!34157 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69890)

(declare-datatypes ((V!40481 0))(
  ( (V!40482 (val!13314 Int)) )
))
(declare-datatypes ((ValueCell!12548 0))(
  ( (ValueCellFull!12548 (v!15934 V!40481)) (EmptyCell!12548) )
))
(declare-datatypes ((array!69892 0))(
  ( (array!69893 (arr!33620 (Array (_ BitVec 32) ValueCell!12548)) (size!34158 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69892)

(assert (=> b!1084864 (= res!723317 (and (= (size!34158 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34157 _keys!1070) (size!34158 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084865 () Bool)

(declare-fun e!619756 () Bool)

(declare-fun tp_is_empty!26515 () Bool)

(assert (=> b!1084865 (= e!619756 tp_is_empty!26515)))

(declare-fun b!1084866 () Bool)

(declare-fun e!619753 () Bool)

(assert (=> b!1084866 (= e!619753 tp_is_empty!26515)))

(declare-fun b!1084867 () Bool)

(declare-fun res!723320 () Bool)

(declare-fun e!619750 () Bool)

(assert (=> b!1084867 (=> (not res!723320) (not e!619750))))

(declare-fun lt!481010 () array!69890)

(declare-datatypes ((List!23505 0))(
  ( (Nil!23502) (Cons!23501 (h!24710 (_ BitVec 64)) (t!33067 List!23505)) )
))
(declare-fun arrayNoDuplicates!0 (array!69890 (_ BitVec 32) List!23505) Bool)

(assert (=> b!1084867 (= res!723320 (arrayNoDuplicates!0 lt!481010 #b00000000000000000000000000000000 Nil!23502))))

(declare-fun b!1084868 () Bool)

(declare-fun e!619754 () Bool)

(declare-fun e!619752 () Bool)

(assert (=> b!1084868 (= e!619754 e!619752)))

(declare-fun res!723314 () Bool)

(assert (=> b!1084868 (=> res!723314 e!619752)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1084868 (= res!723314 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16934 0))(
  ( (tuple2!16935 (_1!8478 (_ BitVec 64)) (_2!8478 V!40481)) )
))
(declare-datatypes ((List!23506 0))(
  ( (Nil!23503) (Cons!23502 (h!24711 tuple2!16934) (t!33068 List!23506)) )
))
(declare-datatypes ((ListLongMap!14903 0))(
  ( (ListLongMap!14904 (toList!7467 List!23506)) )
))
(declare-fun lt!481007 () ListLongMap!14903)

(declare-fun lt!480996 () ListLongMap!14903)

(assert (=> b!1084868 (= lt!481007 lt!480996)))

(declare-fun lt!480994 () ListLongMap!14903)

(declare-fun -!746 (ListLongMap!14903 (_ BitVec 64)) ListLongMap!14903)

(assert (=> b!1084868 (= lt!481007 (-!746 lt!480994 k0!904))))

(declare-datatypes ((Unit!35527 0))(
  ( (Unit!35528) )
))
(declare-fun lt!481001 () Unit!35527)

(declare-fun lt!481008 () ListLongMap!14903)

(declare-fun zeroValue!831 () V!40481)

(declare-fun addRemoveCommutativeForDiffKeys!5 (ListLongMap!14903 (_ BitVec 64) V!40481 (_ BitVec 64)) Unit!35527)

(assert (=> b!1084868 (= lt!481001 (addRemoveCommutativeForDiffKeys!5 lt!481008 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!480997 () ListLongMap!14903)

(declare-fun lt!481004 () tuple2!16934)

(declare-fun +!3276 (ListLongMap!14903 tuple2!16934) ListLongMap!14903)

(assert (=> b!1084868 (= lt!480997 (+!3276 lt!480996 lt!481004))))

(declare-fun lt!481003 () ListLongMap!14903)

(declare-fun lt!481002 () tuple2!16934)

(assert (=> b!1084868 (= lt!480996 (+!3276 lt!481003 lt!481002))))

(declare-fun lt!480998 () ListLongMap!14903)

(declare-fun lt!480995 () ListLongMap!14903)

(assert (=> b!1084868 (= lt!480998 lt!480995)))

(assert (=> b!1084868 (= lt!480995 (+!3276 lt!480994 lt!481004))))

(assert (=> b!1084868 (= lt!480994 (+!3276 lt!481008 lt!481002))))

(declare-fun lt!481009 () ListLongMap!14903)

(assert (=> b!1084868 (= lt!480997 (+!3276 (+!3276 lt!481009 lt!481002) lt!481004))))

(declare-fun minValue!831 () V!40481)

(assert (=> b!1084868 (= lt!481004 (tuple2!16935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1084868 (= lt!481002 (tuple2!16935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!41527 () Bool)

(declare-fun mapRes!41527 () Bool)

(declare-fun tp!79388 () Bool)

(assert (=> mapNonEmpty!41527 (= mapRes!41527 (and tp!79388 e!619753))))

(declare-fun mapValue!41527 () ValueCell!12548)

(declare-fun mapRest!41527 () (Array (_ BitVec 32) ValueCell!12548))

(declare-fun mapKey!41527 () (_ BitVec 32))

(assert (=> mapNonEmpty!41527 (= (arr!33620 _values!874) (store mapRest!41527 mapKey!41527 mapValue!41527))))

(declare-fun res!723313 () Bool)

(assert (=> start!95854 (=> (not res!723313) (not e!619757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95854 (= res!723313 (validMask!0 mask!1414))))

(assert (=> start!95854 e!619757))

(assert (=> start!95854 tp!79387))

(assert (=> start!95854 true))

(assert (=> start!95854 tp_is_empty!26515))

(declare-fun array_inv!25984 (array!69890) Bool)

(assert (=> start!95854 (array_inv!25984 _keys!1070)))

(declare-fun e!619751 () Bool)

(declare-fun array_inv!25985 (array!69892) Bool)

(assert (=> start!95854 (and (array_inv!25985 _values!874) e!619751)))

(declare-fun b!1084869 () Bool)

(declare-fun res!723321 () Bool)

(assert (=> b!1084869 (=> (not res!723321) (not e!619757))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084869 (= res!723321 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34157 _keys!1070))))))

(declare-fun b!1084870 () Bool)

(declare-fun res!723316 () Bool)

(assert (=> b!1084870 (=> (not res!723316) (not e!619757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084870 (= res!723316 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41527 () Bool)

(assert (=> mapIsEmpty!41527 mapRes!41527))

(declare-fun b!1084871 () Bool)

(declare-fun res!723319 () Bool)

(assert (=> b!1084871 (=> (not res!723319) (not e!619757))))

(assert (=> b!1084871 (= res!723319 (= (select (arr!33619 _keys!1070) i!650) k0!904))))

(declare-fun b!1084872 () Bool)

(assert (=> b!1084872 (= e!619750 (not e!619754))))

(declare-fun res!723318 () Bool)

(assert (=> b!1084872 (=> res!723318 e!619754)))

(assert (=> b!1084872 (= res!723318 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4158 (array!69890 array!69892 (_ BitVec 32) (_ BitVec 32) V!40481 V!40481 (_ BitVec 32) Int) ListLongMap!14903)

(assert (=> b!1084872 (= lt!480998 (getCurrentListMap!4158 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481006 () array!69892)

(assert (=> b!1084872 (= lt!480997 (getCurrentListMap!4158 lt!481010 lt!481006 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084872 (and (= lt!481009 lt!481003) (= lt!481003 lt!481009))))

(assert (=> b!1084872 (= lt!481003 (-!746 lt!481008 k0!904))))

(declare-fun lt!481000 () Unit!35527)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!42 (array!69890 array!69892 (_ BitVec 32) (_ BitVec 32) V!40481 V!40481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35527)

(assert (=> b!1084872 (= lt!481000 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!42 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4028 (array!69890 array!69892 (_ BitVec 32) (_ BitVec 32) V!40481 V!40481 (_ BitVec 32) Int) ListLongMap!14903)

(assert (=> b!1084872 (= lt!481009 (getCurrentListMapNoExtraKeys!4028 lt!481010 lt!481006 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2099 (Int (_ BitVec 64)) V!40481)

(assert (=> b!1084872 (= lt!481006 (array!69893 (store (arr!33620 _values!874) i!650 (ValueCellFull!12548 (dynLambda!2099 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34158 _values!874)))))

(assert (=> b!1084872 (= lt!481008 (getCurrentListMapNoExtraKeys!4028 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084872 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480999 () Unit!35527)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69890 (_ BitVec 64) (_ BitVec 32)) Unit!35527)

(assert (=> b!1084872 (= lt!480999 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084873 () Bool)

(assert (=> b!1084873 (= e!619757 e!619750)))

(declare-fun res!723312 () Bool)

(assert (=> b!1084873 (=> (not res!723312) (not e!619750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69890 (_ BitVec 32)) Bool)

(assert (=> b!1084873 (= res!723312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481010 mask!1414))))

(assert (=> b!1084873 (= lt!481010 (array!69891 (store (arr!33619 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34157 _keys!1070)))))

(declare-fun b!1084874 () Bool)

(assert (=> b!1084874 (= e!619751 (and e!619756 mapRes!41527))))

(declare-fun condMapEmpty!41527 () Bool)

(declare-fun mapDefault!41527 () ValueCell!12548)

(assert (=> b!1084874 (= condMapEmpty!41527 (= (arr!33620 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12548)) mapDefault!41527)))))

(declare-fun b!1084875 () Bool)

(declare-fun res!723315 () Bool)

(assert (=> b!1084875 (=> (not res!723315) (not e!619757))))

(assert (=> b!1084875 (= res!723315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084876 () Bool)

(declare-fun res!723311 () Bool)

(assert (=> b!1084876 (=> (not res!723311) (not e!619757))))

(assert (=> b!1084876 (= res!723311 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23502))))

(declare-fun b!1084877 () Bool)

(assert (=> b!1084877 (= e!619752 true)))

(assert (=> b!1084877 (= (-!746 lt!480995 k0!904) (+!3276 lt!481007 lt!481004))))

(declare-fun lt!481005 () Unit!35527)

(assert (=> b!1084877 (= lt!481005 (addRemoveCommutativeForDiffKeys!5 lt!480994 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(assert (= (and start!95854 res!723313) b!1084864))

(assert (= (and b!1084864 res!723317) b!1084875))

(assert (= (and b!1084875 res!723315) b!1084876))

(assert (= (and b!1084876 res!723311) b!1084869))

(assert (= (and b!1084869 res!723321) b!1084870))

(assert (= (and b!1084870 res!723316) b!1084871))

(assert (= (and b!1084871 res!723319) b!1084873))

(assert (= (and b!1084873 res!723312) b!1084867))

(assert (= (and b!1084867 res!723320) b!1084872))

(assert (= (and b!1084872 (not res!723318)) b!1084868))

(assert (= (and b!1084868 (not res!723314)) b!1084877))

(assert (= (and b!1084874 condMapEmpty!41527) mapIsEmpty!41527))

(assert (= (and b!1084874 (not condMapEmpty!41527)) mapNonEmpty!41527))

(get-info :version)

(assert (= (and mapNonEmpty!41527 ((_ is ValueCellFull!12548) mapValue!41527)) b!1084866))

(assert (= (and b!1084874 ((_ is ValueCellFull!12548) mapDefault!41527)) b!1084865))

(assert (= start!95854 b!1084874))

(declare-fun b_lambda!17161 () Bool)

(assert (=> (not b_lambda!17161) (not b!1084872)))

(declare-fun t!33066 () Bool)

(declare-fun tb!7383 () Bool)

(assert (=> (and start!95854 (= defaultEntry!882 defaultEntry!882) t!33066) tb!7383))

(declare-fun result!15293 () Bool)

(assert (=> tb!7383 (= result!15293 tp_is_empty!26515)))

(assert (=> b!1084872 t!33066))

(declare-fun b_and!35677 () Bool)

(assert (= b_and!35675 (and (=> t!33066 result!15293) b_and!35677)))

(declare-fun m!1002245 () Bool)

(assert (=> b!1084868 m!1002245))

(declare-fun m!1002247 () Bool)

(assert (=> b!1084868 m!1002247))

(declare-fun m!1002249 () Bool)

(assert (=> b!1084868 m!1002249))

(declare-fun m!1002251 () Bool)

(assert (=> b!1084868 m!1002251))

(declare-fun m!1002253 () Bool)

(assert (=> b!1084868 m!1002253))

(declare-fun m!1002255 () Bool)

(assert (=> b!1084868 m!1002255))

(assert (=> b!1084868 m!1002255))

(declare-fun m!1002257 () Bool)

(assert (=> b!1084868 m!1002257))

(declare-fun m!1002259 () Bool)

(assert (=> b!1084868 m!1002259))

(declare-fun m!1002261 () Bool)

(assert (=> b!1084876 m!1002261))

(declare-fun m!1002263 () Bool)

(assert (=> mapNonEmpty!41527 m!1002263))

(declare-fun m!1002265 () Bool)

(assert (=> b!1084870 m!1002265))

(declare-fun m!1002267 () Bool)

(assert (=> b!1084877 m!1002267))

(declare-fun m!1002269 () Bool)

(assert (=> b!1084877 m!1002269))

(declare-fun m!1002271 () Bool)

(assert (=> b!1084877 m!1002271))

(declare-fun m!1002273 () Bool)

(assert (=> b!1084867 m!1002273))

(declare-fun m!1002275 () Bool)

(assert (=> b!1084875 m!1002275))

(declare-fun m!1002277 () Bool)

(assert (=> b!1084872 m!1002277))

(declare-fun m!1002279 () Bool)

(assert (=> b!1084872 m!1002279))

(declare-fun m!1002281 () Bool)

(assert (=> b!1084872 m!1002281))

(declare-fun m!1002283 () Bool)

(assert (=> b!1084872 m!1002283))

(declare-fun m!1002285 () Bool)

(assert (=> b!1084872 m!1002285))

(declare-fun m!1002287 () Bool)

(assert (=> b!1084872 m!1002287))

(declare-fun m!1002289 () Bool)

(assert (=> b!1084872 m!1002289))

(declare-fun m!1002291 () Bool)

(assert (=> b!1084872 m!1002291))

(declare-fun m!1002293 () Bool)

(assert (=> b!1084872 m!1002293))

(declare-fun m!1002295 () Bool)

(assert (=> b!1084872 m!1002295))

(declare-fun m!1002297 () Bool)

(assert (=> start!95854 m!1002297))

(declare-fun m!1002299 () Bool)

(assert (=> start!95854 m!1002299))

(declare-fun m!1002301 () Bool)

(assert (=> start!95854 m!1002301))

(declare-fun m!1002303 () Bool)

(assert (=> b!1084871 m!1002303))

(declare-fun m!1002305 () Bool)

(assert (=> b!1084873 m!1002305))

(declare-fun m!1002307 () Bool)

(assert (=> b!1084873 m!1002307))

(check-sat (not b!1084867) (not b!1084876) (not mapNonEmpty!41527) (not b_lambda!17161) (not b!1084877) (not b!1084873) (not b_next!22513) (not start!95854) (not b!1084868) tp_is_empty!26515 b_and!35677 (not b!1084872) (not b!1084870) (not b!1084875))
(check-sat b_and!35677 (not b_next!22513))
