; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96042 () Bool)

(assert start!96042)

(declare-fun b_free!22459 () Bool)

(declare-fun b_next!22459 () Bool)

(assert (=> start!96042 (= b_free!22459 (not b_next!22459))))

(declare-fun tp!79225 () Bool)

(declare-fun b_and!35603 () Bool)

(assert (=> start!96042 (= tp!79225 b_and!35603)))

(declare-fun b!1085260 () Bool)

(declare-fun res!723120 () Bool)

(declare-fun e!620164 () Bool)

(assert (=> b!1085260 (=> (not res!723120) (not e!620164))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69899 0))(
  ( (array!69900 (arr!33617 (Array (_ BitVec 32) (_ BitVec 64))) (size!34154 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69899)

(assert (=> b!1085260 (= res!723120 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34154 _keys!1070))))))

(declare-fun b!1085261 () Bool)

(declare-fun res!723121 () Bool)

(assert (=> b!1085261 (=> (not res!723121) (not e!620164))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085261 (= res!723121 (validKeyInArray!0 k0!904))))

(declare-fun b!1085262 () Bool)

(declare-fun res!723118 () Bool)

(assert (=> b!1085262 (=> (not res!723118) (not e!620164))))

(assert (=> b!1085262 (= res!723118 (= (select (arr!33617 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41446 () Bool)

(declare-fun mapRes!41446 () Bool)

(assert (=> mapIsEmpty!41446 mapRes!41446))

(declare-fun b!1085263 () Bool)

(declare-fun e!620165 () Bool)

(assert (=> b!1085263 (= e!620164 e!620165)))

(declare-fun res!723122 () Bool)

(assert (=> b!1085263 (=> (not res!723122) (not e!620165))))

(declare-fun lt!480885 () array!69899)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69899 (_ BitVec 32)) Bool)

(assert (=> b!1085263 (= res!723122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480885 mask!1414))))

(assert (=> b!1085263 (= lt!480885 (array!69900 (store (arr!33617 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34154 _keys!1070)))))

(declare-fun res!723116 () Bool)

(assert (=> start!96042 (=> (not res!723116) (not e!620164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96042 (= res!723116 (validMask!0 mask!1414))))

(assert (=> start!96042 e!620164))

(assert (=> start!96042 tp!79225))

(assert (=> start!96042 true))

(declare-fun tp_is_empty!26461 () Bool)

(assert (=> start!96042 tp_is_empty!26461))

(declare-fun array_inv!25988 (array!69899) Bool)

(assert (=> start!96042 (array_inv!25988 _keys!1070)))

(declare-datatypes ((V!40409 0))(
  ( (V!40410 (val!13287 Int)) )
))
(declare-datatypes ((ValueCell!12521 0))(
  ( (ValueCellFull!12521 (v!15904 V!40409)) (EmptyCell!12521) )
))
(declare-datatypes ((array!69901 0))(
  ( (array!69902 (arr!33618 (Array (_ BitVec 32) ValueCell!12521)) (size!34155 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69901)

(declare-fun e!620163 () Bool)

(declare-fun array_inv!25989 (array!69901) Bool)

(assert (=> start!96042 (and (array_inv!25989 _values!874) e!620163)))

(declare-fun b!1085264 () Bool)

(declare-fun res!723119 () Bool)

(assert (=> b!1085264 (=> (not res!723119) (not e!620164))))

(assert (=> b!1085264 (= res!723119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41446 () Bool)

(declare-fun tp!79226 () Bool)

(declare-fun e!620168 () Bool)

(assert (=> mapNonEmpty!41446 (= mapRes!41446 (and tp!79226 e!620168))))

(declare-fun mapKey!41446 () (_ BitVec 32))

(declare-fun mapRest!41446 () (Array (_ BitVec 32) ValueCell!12521))

(declare-fun mapValue!41446 () ValueCell!12521)

(assert (=> mapNonEmpty!41446 (= (arr!33618 _values!874) (store mapRest!41446 mapKey!41446 mapValue!41446))))

(declare-fun b!1085265 () Bool)

(declare-fun e!620166 () Bool)

(assert (=> b!1085265 (= e!620166 tp_is_empty!26461)))

(declare-fun b!1085266 () Bool)

(assert (=> b!1085266 (= e!620165 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40409)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!480883 () array!69901)

(declare-datatypes ((tuple2!16844 0))(
  ( (tuple2!16845 (_1!8433 (_ BitVec 64)) (_2!8433 V!40409)) )
))
(declare-datatypes ((List!23440 0))(
  ( (Nil!23437) (Cons!23436 (h!24654 tuple2!16844) (t!32949 List!23440)) )
))
(declare-datatypes ((ListLongMap!14821 0))(
  ( (ListLongMap!14822 (toList!7426 List!23440)) )
))
(declare-fun lt!480888 () ListLongMap!14821)

(declare-fun zeroValue!831 () V!40409)

(declare-fun getCurrentListMap!4198 (array!69899 array!69901 (_ BitVec 32) (_ BitVec 32) V!40409 V!40409 (_ BitVec 32) Int) ListLongMap!14821)

(assert (=> b!1085266 (= lt!480888 (getCurrentListMap!4198 lt!480885 lt!480883 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480887 () ListLongMap!14821)

(declare-fun lt!480882 () ListLongMap!14821)

(assert (=> b!1085266 (and (= lt!480887 lt!480882) (= lt!480882 lt!480887))))

(declare-fun lt!480886 () ListLongMap!14821)

(declare-fun -!738 (ListLongMap!14821 (_ BitVec 64)) ListLongMap!14821)

(assert (=> b!1085266 (= lt!480882 (-!738 lt!480886 k0!904))))

(declare-datatypes ((Unit!35643 0))(
  ( (Unit!35644) )
))
(declare-fun lt!480884 () Unit!35643)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!27 (array!69899 array!69901 (_ BitVec 32) (_ BitVec 32) V!40409 V!40409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35643)

(assert (=> b!1085266 (= lt!480884 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!27 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4003 (array!69899 array!69901 (_ BitVec 32) (_ BitVec 32) V!40409 V!40409 (_ BitVec 32) Int) ListLongMap!14821)

(assert (=> b!1085266 (= lt!480887 (getCurrentListMapNoExtraKeys!4003 lt!480885 lt!480883 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2124 (Int (_ BitVec 64)) V!40409)

(assert (=> b!1085266 (= lt!480883 (array!69902 (store (arr!33618 _values!874) i!650 (ValueCellFull!12521 (dynLambda!2124 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34155 _values!874)))))

(assert (=> b!1085266 (= lt!480886 (getCurrentListMapNoExtraKeys!4003 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085266 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480881 () Unit!35643)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69899 (_ BitVec 64) (_ BitVec 32)) Unit!35643)

(assert (=> b!1085266 (= lt!480881 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085267 () Bool)

(assert (=> b!1085267 (= e!620168 tp_is_empty!26461)))

(declare-fun b!1085268 () Bool)

(declare-fun res!723123 () Bool)

(assert (=> b!1085268 (=> (not res!723123) (not e!620165))))

(declare-datatypes ((List!23441 0))(
  ( (Nil!23438) (Cons!23437 (h!24655 (_ BitVec 64)) (t!32950 List!23441)) )
))
(declare-fun arrayNoDuplicates!0 (array!69899 (_ BitVec 32) List!23441) Bool)

(assert (=> b!1085268 (= res!723123 (arrayNoDuplicates!0 lt!480885 #b00000000000000000000000000000000 Nil!23438))))

(declare-fun b!1085269 () Bool)

(declare-fun res!723115 () Bool)

(assert (=> b!1085269 (=> (not res!723115) (not e!620164))))

(assert (=> b!1085269 (= res!723115 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23438))))

(declare-fun b!1085270 () Bool)

(declare-fun res!723117 () Bool)

(assert (=> b!1085270 (=> (not res!723117) (not e!620164))))

(assert (=> b!1085270 (= res!723117 (and (= (size!34155 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34154 _keys!1070) (size!34155 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085271 () Bool)

(assert (=> b!1085271 (= e!620163 (and e!620166 mapRes!41446))))

(declare-fun condMapEmpty!41446 () Bool)

(declare-fun mapDefault!41446 () ValueCell!12521)

(assert (=> b!1085271 (= condMapEmpty!41446 (= (arr!33618 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12521)) mapDefault!41446)))))

(assert (= (and start!96042 res!723116) b!1085270))

(assert (= (and b!1085270 res!723117) b!1085264))

(assert (= (and b!1085264 res!723119) b!1085269))

(assert (= (and b!1085269 res!723115) b!1085260))

(assert (= (and b!1085260 res!723120) b!1085261))

(assert (= (and b!1085261 res!723121) b!1085262))

(assert (= (and b!1085262 res!723118) b!1085263))

(assert (= (and b!1085263 res!723122) b!1085268))

(assert (= (and b!1085268 res!723123) b!1085266))

(assert (= (and b!1085271 condMapEmpty!41446) mapIsEmpty!41446))

(assert (= (and b!1085271 (not condMapEmpty!41446)) mapNonEmpty!41446))

(get-info :version)

(assert (= (and mapNonEmpty!41446 ((_ is ValueCellFull!12521) mapValue!41446)) b!1085267))

(assert (= (and b!1085271 ((_ is ValueCellFull!12521) mapDefault!41446)) b!1085265))

(assert (= start!96042 b!1085271))

(declare-fun b_lambda!17139 () Bool)

(assert (=> (not b_lambda!17139) (not b!1085266)))

(declare-fun t!32948 () Bool)

(declare-fun tb!7329 () Bool)

(assert (=> (and start!96042 (= defaultEntry!882 defaultEntry!882) t!32948) tb!7329))

(declare-fun result!15185 () Bool)

(assert (=> tb!7329 (= result!15185 tp_is_empty!26461)))

(assert (=> b!1085266 t!32948))

(declare-fun b_and!35605 () Bool)

(assert (= b_and!35603 (and (=> t!32948 result!15185) b_and!35605)))

(declare-fun m!1003295 () Bool)

(assert (=> b!1085261 m!1003295))

(declare-fun m!1003297 () Bool)

(assert (=> b!1085263 m!1003297))

(declare-fun m!1003299 () Bool)

(assert (=> b!1085263 m!1003299))

(declare-fun m!1003301 () Bool)

(assert (=> start!96042 m!1003301))

(declare-fun m!1003303 () Bool)

(assert (=> start!96042 m!1003303))

(declare-fun m!1003305 () Bool)

(assert (=> start!96042 m!1003305))

(declare-fun m!1003307 () Bool)

(assert (=> b!1085269 m!1003307))

(declare-fun m!1003309 () Bool)

(assert (=> b!1085262 m!1003309))

(declare-fun m!1003311 () Bool)

(assert (=> b!1085264 m!1003311))

(declare-fun m!1003313 () Bool)

(assert (=> mapNonEmpty!41446 m!1003313))

(declare-fun m!1003315 () Bool)

(assert (=> b!1085266 m!1003315))

(declare-fun m!1003317 () Bool)

(assert (=> b!1085266 m!1003317))

(declare-fun m!1003319 () Bool)

(assert (=> b!1085266 m!1003319))

(declare-fun m!1003321 () Bool)

(assert (=> b!1085266 m!1003321))

(declare-fun m!1003323 () Bool)

(assert (=> b!1085266 m!1003323))

(declare-fun m!1003325 () Bool)

(assert (=> b!1085266 m!1003325))

(declare-fun m!1003327 () Bool)

(assert (=> b!1085266 m!1003327))

(declare-fun m!1003329 () Bool)

(assert (=> b!1085266 m!1003329))

(declare-fun m!1003331 () Bool)

(assert (=> b!1085266 m!1003331))

(declare-fun m!1003333 () Bool)

(assert (=> b!1085268 m!1003333))

(check-sat (not mapNonEmpty!41446) (not start!96042) (not b!1085266) tp_is_empty!26461 (not b!1085264) (not b!1085263) (not b!1085268) (not b_lambda!17139) (not b!1085269) b_and!35605 (not b_next!22459) (not b!1085261))
(check-sat b_and!35605 (not b_next!22459))
