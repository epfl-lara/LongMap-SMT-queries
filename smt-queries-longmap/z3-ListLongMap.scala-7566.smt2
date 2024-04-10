; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95718 () Bool)

(assert start!95718)

(declare-fun b_free!22371 () Bool)

(declare-fun b_next!22371 () Bool)

(assert (=> start!95718 (= b_free!22371 (not b_next!22371))))

(declare-fun tp!78962 () Bool)

(declare-fun b_and!35417 () Bool)

(assert (=> start!95718 (= tp!78962 b_and!35417)))

(declare-fun b!1082261 () Bool)

(declare-fun res!721406 () Bool)

(declare-fun e!618517 () Bool)

(assert (=> b!1082261 (=> (not res!721406) (not e!618517))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69693 0))(
  ( (array!69694 (arr!33520 (Array (_ BitVec 32) (_ BitVec 64))) (size!34056 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69693)

(declare-datatypes ((V!40291 0))(
  ( (V!40292 (val!13243 Int)) )
))
(declare-datatypes ((ValueCell!12477 0))(
  ( (ValueCellFull!12477 (v!15864 V!40291)) (EmptyCell!12477) )
))
(declare-datatypes ((array!69695 0))(
  ( (array!69696 (arr!33521 (Array (_ BitVec 32) ValueCell!12477)) (size!34057 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69695)

(assert (=> b!1082261 (= res!721406 (and (= (size!34057 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34056 _keys!1070) (size!34057 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082262 () Bool)

(declare-fun e!618520 () Bool)

(declare-fun tp_is_empty!26373 () Bool)

(assert (=> b!1082262 (= e!618520 tp_is_empty!26373)))

(declare-fun b!1082263 () Bool)

(declare-fun res!721409 () Bool)

(assert (=> b!1082263 (=> (not res!721409) (not e!618517))))

(declare-datatypes ((List!23361 0))(
  ( (Nil!23358) (Cons!23357 (h!24566 (_ BitVec 64)) (t!32790 List!23361)) )
))
(declare-fun arrayNoDuplicates!0 (array!69693 (_ BitVec 32) List!23361) Bool)

(assert (=> b!1082263 (= res!721409 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23358))))

(declare-fun b!1082264 () Bool)

(declare-fun e!618518 () Bool)

(assert (=> b!1082264 (= e!618518 (not true))))

(declare-fun minValue!831 () V!40291)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!479560 () array!69693)

(declare-fun zeroValue!831 () V!40291)

(declare-datatypes ((tuple2!16778 0))(
  ( (tuple2!16779 (_1!8400 (_ BitVec 64)) (_2!8400 V!40291)) )
))
(declare-datatypes ((List!23362 0))(
  ( (Nil!23359) (Cons!23358 (h!24567 tuple2!16778) (t!32791 List!23362)) )
))
(declare-datatypes ((ListLongMap!14747 0))(
  ( (ListLongMap!14748 (toList!7389 List!23362)) )
))
(declare-fun lt!479562 () ListLongMap!14747)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3937 (array!69693 array!69695 (_ BitVec 32) (_ BitVec 32) V!40291 V!40291 (_ BitVec 32) Int) ListLongMap!14747)

(declare-fun dynLambda!2074 (Int (_ BitVec 64)) V!40291)

(assert (=> b!1082264 (= lt!479562 (getCurrentListMapNoExtraKeys!3937 lt!479560 (array!69696 (store (arr!33521 _values!874) i!650 (ValueCellFull!12477 (dynLambda!2074 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34057 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479561 () ListLongMap!14747)

(assert (=> b!1082264 (= lt!479561 (getCurrentListMapNoExtraKeys!3937 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082264 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35598 0))(
  ( (Unit!35599) )
))
(declare-fun lt!479563 () Unit!35598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69693 (_ BitVec 64) (_ BitVec 32)) Unit!35598)

(assert (=> b!1082264 (= lt!479563 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082265 () Bool)

(declare-fun res!721408 () Bool)

(assert (=> b!1082265 (=> (not res!721408) (not e!618517))))

(assert (=> b!1082265 (= res!721408 (= (select (arr!33520 _keys!1070) i!650) k0!904))))

(declare-fun b!1082266 () Bool)

(declare-fun res!721410 () Bool)

(assert (=> b!1082266 (=> (not res!721410) (not e!618518))))

(assert (=> b!1082266 (= res!721410 (arrayNoDuplicates!0 lt!479560 #b00000000000000000000000000000000 Nil!23358))))

(declare-fun b!1082267 () Bool)

(declare-fun res!721407 () Bool)

(assert (=> b!1082267 (=> (not res!721407) (not e!618517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082267 (= res!721407 (validKeyInArray!0 k0!904))))

(declare-fun b!1082268 () Bool)

(declare-fun e!618519 () Bool)

(declare-fun e!618521 () Bool)

(declare-fun mapRes!41314 () Bool)

(assert (=> b!1082268 (= e!618519 (and e!618521 mapRes!41314))))

(declare-fun condMapEmpty!41314 () Bool)

(declare-fun mapDefault!41314 () ValueCell!12477)

(assert (=> b!1082268 (= condMapEmpty!41314 (= (arr!33521 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12477)) mapDefault!41314)))))

(declare-fun res!721412 () Bool)

(assert (=> start!95718 (=> (not res!721412) (not e!618517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95718 (= res!721412 (validMask!0 mask!1414))))

(assert (=> start!95718 e!618517))

(assert (=> start!95718 tp!78962))

(assert (=> start!95718 true))

(assert (=> start!95718 tp_is_empty!26373))

(declare-fun array_inv!25876 (array!69693) Bool)

(assert (=> start!95718 (array_inv!25876 _keys!1070)))

(declare-fun array_inv!25877 (array!69695) Bool)

(assert (=> start!95718 (and (array_inv!25877 _values!874) e!618519)))

(declare-fun b!1082269 () Bool)

(declare-fun res!721411 () Bool)

(assert (=> b!1082269 (=> (not res!721411) (not e!618517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69693 (_ BitVec 32)) Bool)

(assert (=> b!1082269 (= res!721411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41314 () Bool)

(declare-fun tp!78961 () Bool)

(assert (=> mapNonEmpty!41314 (= mapRes!41314 (and tp!78961 e!618520))))

(declare-fun mapValue!41314 () ValueCell!12477)

(declare-fun mapRest!41314 () (Array (_ BitVec 32) ValueCell!12477))

(declare-fun mapKey!41314 () (_ BitVec 32))

(assert (=> mapNonEmpty!41314 (= (arr!33521 _values!874) (store mapRest!41314 mapKey!41314 mapValue!41314))))

(declare-fun mapIsEmpty!41314 () Bool)

(assert (=> mapIsEmpty!41314 mapRes!41314))

(declare-fun b!1082270 () Bool)

(assert (=> b!1082270 (= e!618521 tp_is_empty!26373)))

(declare-fun b!1082271 () Bool)

(declare-fun res!721405 () Bool)

(assert (=> b!1082271 (=> (not res!721405) (not e!618517))))

(assert (=> b!1082271 (= res!721405 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34056 _keys!1070))))))

(declare-fun b!1082272 () Bool)

(assert (=> b!1082272 (= e!618517 e!618518)))

(declare-fun res!721413 () Bool)

(assert (=> b!1082272 (=> (not res!721413) (not e!618518))))

(assert (=> b!1082272 (= res!721413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479560 mask!1414))))

(assert (=> b!1082272 (= lt!479560 (array!69694 (store (arr!33520 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34056 _keys!1070)))))

(assert (= (and start!95718 res!721412) b!1082261))

(assert (= (and b!1082261 res!721406) b!1082269))

(assert (= (and b!1082269 res!721411) b!1082263))

(assert (= (and b!1082263 res!721409) b!1082271))

(assert (= (and b!1082271 res!721405) b!1082267))

(assert (= (and b!1082267 res!721407) b!1082265))

(assert (= (and b!1082265 res!721408) b!1082272))

(assert (= (and b!1082272 res!721413) b!1082266))

(assert (= (and b!1082266 res!721410) b!1082264))

(assert (= (and b!1082268 condMapEmpty!41314) mapIsEmpty!41314))

(assert (= (and b!1082268 (not condMapEmpty!41314)) mapNonEmpty!41314))

(get-info :version)

(assert (= (and mapNonEmpty!41314 ((_ is ValueCellFull!12477) mapValue!41314)) b!1082262))

(assert (= (and b!1082268 ((_ is ValueCellFull!12477) mapDefault!41314)) b!1082270))

(assert (= start!95718 b!1082268))

(declare-fun b_lambda!17041 () Bool)

(assert (=> (not b_lambda!17041) (not b!1082264)))

(declare-fun t!32789 () Bool)

(declare-fun tb!7249 () Bool)

(assert (=> (and start!95718 (= defaultEntry!882 defaultEntry!882) t!32789) tb!7249))

(declare-fun result!15017 () Bool)

(assert (=> tb!7249 (= result!15017 tp_is_empty!26373)))

(assert (=> b!1082264 t!32789))

(declare-fun b_and!35419 () Bool)

(assert (= b_and!35417 (and (=> t!32789 result!15017) b_and!35419)))

(declare-fun m!999965 () Bool)

(assert (=> b!1082269 m!999965))

(declare-fun m!999967 () Bool)

(assert (=> b!1082265 m!999967))

(declare-fun m!999969 () Bool)

(assert (=> start!95718 m!999969))

(declare-fun m!999971 () Bool)

(assert (=> start!95718 m!999971))

(declare-fun m!999973 () Bool)

(assert (=> start!95718 m!999973))

(declare-fun m!999975 () Bool)

(assert (=> mapNonEmpty!41314 m!999975))

(declare-fun m!999977 () Bool)

(assert (=> b!1082263 m!999977))

(declare-fun m!999979 () Bool)

(assert (=> b!1082272 m!999979))

(declare-fun m!999981 () Bool)

(assert (=> b!1082272 m!999981))

(declare-fun m!999983 () Bool)

(assert (=> b!1082266 m!999983))

(declare-fun m!999985 () Bool)

(assert (=> b!1082264 m!999985))

(declare-fun m!999987 () Bool)

(assert (=> b!1082264 m!999987))

(declare-fun m!999989 () Bool)

(assert (=> b!1082264 m!999989))

(declare-fun m!999991 () Bool)

(assert (=> b!1082264 m!999991))

(declare-fun m!999993 () Bool)

(assert (=> b!1082264 m!999993))

(declare-fun m!999995 () Bool)

(assert (=> b!1082264 m!999995))

(declare-fun m!999997 () Bool)

(assert (=> b!1082267 m!999997))

(check-sat (not mapNonEmpty!41314) (not b_lambda!17041) tp_is_empty!26373 (not b!1082272) (not start!95718) (not b_next!22371) (not b!1082269) (not b!1082267) (not b!1082266) (not b!1082263) (not b!1082264) b_and!35419)
(check-sat b_and!35419 (not b_next!22371))
