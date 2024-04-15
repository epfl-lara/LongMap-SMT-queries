; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95710 () Bool)

(assert start!95710)

(declare-fun b_free!22369 () Bool)

(declare-fun b_next!22369 () Bool)

(assert (=> start!95710 (= b_free!22369 (not b_next!22369))))

(declare-fun tp!78955 () Bool)

(declare-fun b_and!35387 () Bool)

(assert (=> start!95710 (= tp!78955 b_and!35387)))

(declare-fun res!721311 () Bool)

(declare-fun e!618409 () Bool)

(assert (=> start!95710 (=> (not res!721311) (not e!618409))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95710 (= res!721311 (validMask!0 mask!1414))))

(assert (=> start!95710 e!618409))

(assert (=> start!95710 tp!78955))

(assert (=> start!95710 true))

(declare-fun tp_is_empty!26371 () Bool)

(assert (=> start!95710 tp_is_empty!26371))

(declare-datatypes ((array!69612 0))(
  ( (array!69613 (arr!33480 (Array (_ BitVec 32) (_ BitVec 64))) (size!34018 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69612)

(declare-fun array_inv!25880 (array!69612) Bool)

(assert (=> start!95710 (array_inv!25880 _keys!1070)))

(declare-datatypes ((V!40289 0))(
  ( (V!40290 (val!13242 Int)) )
))
(declare-datatypes ((ValueCell!12476 0))(
  ( (ValueCellFull!12476 (v!15862 V!40289)) (EmptyCell!12476) )
))
(declare-datatypes ((array!69614 0))(
  ( (array!69615 (arr!33481 (Array (_ BitVec 32) ValueCell!12476)) (size!34019 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69614)

(declare-fun e!618408 () Bool)

(declare-fun array_inv!25881 (array!69614) Bool)

(assert (=> start!95710 (and (array_inv!25881 _values!874) e!618408)))

(declare-fun b!1082070 () Bool)

(declare-fun e!618405 () Bool)

(assert (=> b!1082070 (= e!618409 e!618405)))

(declare-fun res!721317 () Bool)

(assert (=> b!1082070 (=> (not res!721317) (not e!618405))))

(declare-fun lt!479351 () array!69612)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69612 (_ BitVec 32)) Bool)

(assert (=> b!1082070 (= res!721317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479351 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082070 (= lt!479351 (array!69613 (store (arr!33480 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34018 _keys!1070)))))

(declare-fun b!1082071 () Bool)

(declare-fun e!618410 () Bool)

(assert (=> b!1082071 (= e!618410 tp_is_empty!26371)))

(declare-fun b!1082072 () Bool)

(declare-fun res!721312 () Bool)

(assert (=> b!1082072 (=> (not res!721312) (not e!618409))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1082072 (= res!721312 (and (= (size!34019 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34018 _keys!1070) (size!34019 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082073 () Bool)

(declare-fun res!721314 () Bool)

(assert (=> b!1082073 (=> (not res!721314) (not e!618405))))

(declare-datatypes ((List!23400 0))(
  ( (Nil!23397) (Cons!23396 (h!24605 (_ BitVec 64)) (t!32818 List!23400)) )
))
(declare-fun arrayNoDuplicates!0 (array!69612 (_ BitVec 32) List!23400) Bool)

(assert (=> b!1082073 (= res!721314 (arrayNoDuplicates!0 lt!479351 #b00000000000000000000000000000000 Nil!23397))))

(declare-fun mapNonEmpty!41311 () Bool)

(declare-fun mapRes!41311 () Bool)

(declare-fun tp!78956 () Bool)

(assert (=> mapNonEmpty!41311 (= mapRes!41311 (and tp!78956 e!618410))))

(declare-fun mapValue!41311 () ValueCell!12476)

(declare-fun mapKey!41311 () (_ BitVec 32))

(declare-fun mapRest!41311 () (Array (_ BitVec 32) ValueCell!12476))

(assert (=> mapNonEmpty!41311 (= (arr!33481 _values!874) (store mapRest!41311 mapKey!41311 mapValue!41311))))

(declare-fun b!1082074 () Bool)

(declare-fun res!721309 () Bool)

(assert (=> b!1082074 (=> (not res!721309) (not e!618409))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1082074 (= res!721309 (= (select (arr!33480 _keys!1070) i!650) k0!904))))

(declare-fun b!1082075 () Bool)

(declare-fun e!618407 () Bool)

(assert (=> b!1082075 (= e!618407 tp_is_empty!26371)))

(declare-fun b!1082076 () Bool)

(declare-fun res!721313 () Bool)

(assert (=> b!1082076 (=> (not res!721313) (not e!618409))))

(assert (=> b!1082076 (= res!721313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082077 () Bool)

(assert (=> b!1082077 (= e!618408 (and e!618407 mapRes!41311))))

(declare-fun condMapEmpty!41311 () Bool)

(declare-fun mapDefault!41311 () ValueCell!12476)

(assert (=> b!1082077 (= condMapEmpty!41311 (= (arr!33481 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12476)) mapDefault!41311)))))

(declare-fun b!1082078 () Bool)

(declare-fun res!721310 () Bool)

(assert (=> b!1082078 (=> (not res!721310) (not e!618409))))

(assert (=> b!1082078 (= res!721310 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34018 _keys!1070))))))

(declare-fun mapIsEmpty!41311 () Bool)

(assert (=> mapIsEmpty!41311 mapRes!41311))

(declare-fun b!1082079 () Bool)

(assert (=> b!1082079 (= e!618405 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16836 0))(
  ( (tuple2!16837 (_1!8429 (_ BitVec 64)) (_2!8429 V!40289)) )
))
(declare-datatypes ((List!23401 0))(
  ( (Nil!23398) (Cons!23397 (h!24606 tuple2!16836) (t!32819 List!23401)) )
))
(declare-datatypes ((ListLongMap!14805 0))(
  ( (ListLongMap!14806 (toList!7418 List!23401)) )
))
(declare-fun lt!479348 () ListLongMap!14805)

(declare-fun minValue!831 () V!40289)

(declare-fun zeroValue!831 () V!40289)

(declare-fun getCurrentListMapNoExtraKeys!3981 (array!69612 array!69614 (_ BitVec 32) (_ BitVec 32) V!40289 V!40289 (_ BitVec 32) Int) ListLongMap!14805)

(declare-fun dynLambda!2052 (Int (_ BitVec 64)) V!40289)

(assert (=> b!1082079 (= lt!479348 (getCurrentListMapNoExtraKeys!3981 lt!479351 (array!69615 (store (arr!33481 _values!874) i!650 (ValueCellFull!12476 (dynLambda!2052 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34019 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479350 () ListLongMap!14805)

(assert (=> b!1082079 (= lt!479350 (getCurrentListMapNoExtraKeys!3981 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082079 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35429 0))(
  ( (Unit!35430) )
))
(declare-fun lt!479349 () Unit!35429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69612 (_ BitVec 64) (_ BitVec 32)) Unit!35429)

(assert (=> b!1082079 (= lt!479349 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082080 () Bool)

(declare-fun res!721316 () Bool)

(assert (=> b!1082080 (=> (not res!721316) (not e!618409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082080 (= res!721316 (validKeyInArray!0 k0!904))))

(declare-fun b!1082081 () Bool)

(declare-fun res!721315 () Bool)

(assert (=> b!1082081 (=> (not res!721315) (not e!618409))))

(assert (=> b!1082081 (= res!721315 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23397))))

(assert (= (and start!95710 res!721311) b!1082072))

(assert (= (and b!1082072 res!721312) b!1082076))

(assert (= (and b!1082076 res!721313) b!1082081))

(assert (= (and b!1082081 res!721315) b!1082078))

(assert (= (and b!1082078 res!721310) b!1082080))

(assert (= (and b!1082080 res!721316) b!1082074))

(assert (= (and b!1082074 res!721309) b!1082070))

(assert (= (and b!1082070 res!721317) b!1082073))

(assert (= (and b!1082073 res!721314) b!1082079))

(assert (= (and b!1082077 condMapEmpty!41311) mapIsEmpty!41311))

(assert (= (and b!1082077 (not condMapEmpty!41311)) mapNonEmpty!41311))

(get-info :version)

(assert (= (and mapNonEmpty!41311 ((_ is ValueCellFull!12476) mapValue!41311)) b!1082071))

(assert (= (and b!1082077 ((_ is ValueCellFull!12476) mapDefault!41311)) b!1082075))

(assert (= start!95710 b!1082077))

(declare-fun b_lambda!17017 () Bool)

(assert (=> (not b_lambda!17017) (not b!1082079)))

(declare-fun t!32817 () Bool)

(declare-fun tb!7239 () Bool)

(assert (=> (and start!95710 (= defaultEntry!882 defaultEntry!882) t!32817) tb!7239))

(declare-fun result!15005 () Bool)

(assert (=> tb!7239 (= result!15005 tp_is_empty!26371)))

(assert (=> b!1082079 t!32817))

(declare-fun b_and!35389 () Bool)

(assert (= b_and!35387 (and (=> t!32817 result!15005) b_and!35389)))

(declare-fun m!999305 () Bool)

(assert (=> b!1082074 m!999305))

(declare-fun m!999307 () Bool)

(assert (=> b!1082073 m!999307))

(declare-fun m!999309 () Bool)

(assert (=> b!1082080 m!999309))

(declare-fun m!999311 () Bool)

(assert (=> b!1082081 m!999311))

(declare-fun m!999313 () Bool)

(assert (=> b!1082079 m!999313))

(declare-fun m!999315 () Bool)

(assert (=> b!1082079 m!999315))

(declare-fun m!999317 () Bool)

(assert (=> b!1082079 m!999317))

(declare-fun m!999319 () Bool)

(assert (=> b!1082079 m!999319))

(declare-fun m!999321 () Bool)

(assert (=> b!1082079 m!999321))

(declare-fun m!999323 () Bool)

(assert (=> b!1082079 m!999323))

(declare-fun m!999325 () Bool)

(assert (=> b!1082070 m!999325))

(declare-fun m!999327 () Bool)

(assert (=> b!1082070 m!999327))

(declare-fun m!999329 () Bool)

(assert (=> start!95710 m!999329))

(declare-fun m!999331 () Bool)

(assert (=> start!95710 m!999331))

(declare-fun m!999333 () Bool)

(assert (=> start!95710 m!999333))

(declare-fun m!999335 () Bool)

(assert (=> b!1082076 m!999335))

(declare-fun m!999337 () Bool)

(assert (=> mapNonEmpty!41311 m!999337))

(check-sat (not b!1082070) (not b!1082080) (not b!1082073) (not b_lambda!17017) (not b!1082076) (not b_next!22369) (not mapNonEmpty!41311) (not b!1082081) (not b!1082079) b_and!35389 (not start!95710) tp_is_empty!26371)
(check-sat b_and!35389 (not b_next!22369))
