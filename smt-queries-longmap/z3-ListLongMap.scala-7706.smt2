; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96786 () Bool)

(assert start!96786)

(declare-fun b_free!23161 () Bool)

(declare-fun b_next!23161 () Bool)

(assert (=> start!96786 (= b_free!23161 (not b_next!23161))))

(declare-fun tp!81433 () Bool)

(declare-fun b_and!37071 () Bool)

(assert (=> start!96786 (= tp!81433 b_and!37071)))

(declare-fun b!1100855 () Bool)

(declare-fun e!628334 () Bool)

(declare-fun tp_is_empty!27211 () Bool)

(assert (=> b!1100855 (= e!628334 tp_is_empty!27211)))

(declare-fun b!1100856 () Bool)

(declare-fun res!734610 () Bool)

(declare-fun e!628335 () Bool)

(assert (=> b!1100856 (=> (not res!734610) (not e!628335))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71248 0))(
  ( (array!71249 (arr!34288 (Array (_ BitVec 32) (_ BitVec 64))) (size!34826 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71248)

(assert (=> b!1100856 (= res!734610 (= (select (arr!34288 _keys!1070) i!650) k0!904))))

(declare-fun b!1100857 () Bool)

(declare-fun res!734613 () Bool)

(assert (=> b!1100857 (=> (not res!734613) (not e!628335))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41409 0))(
  ( (V!41410 (val!13662 Int)) )
))
(declare-datatypes ((ValueCell!12896 0))(
  ( (ValueCellFull!12896 (v!16290 V!41409)) (EmptyCell!12896) )
))
(declare-datatypes ((array!71250 0))(
  ( (array!71251 (arr!34289 (Array (_ BitVec 32) ValueCell!12896)) (size!34827 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71250)

(assert (=> b!1100857 (= res!734613 (and (= (size!34827 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34826 _keys!1070) (size!34827 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42601 () Bool)

(declare-fun mapRes!42601 () Bool)

(declare-fun tp!81434 () Bool)

(declare-fun e!628338 () Bool)

(assert (=> mapNonEmpty!42601 (= mapRes!42601 (and tp!81434 e!628338))))

(declare-fun mapKey!42601 () (_ BitVec 32))

(declare-fun mapRest!42601 () (Array (_ BitVec 32) ValueCell!12896))

(declare-fun mapValue!42601 () ValueCell!12896)

(assert (=> mapNonEmpty!42601 (= (arr!34289 _values!874) (store mapRest!42601 mapKey!42601 mapValue!42601))))

(declare-fun b!1100858 () Bool)

(declare-fun res!734611 () Bool)

(assert (=> b!1100858 (=> (not res!734611) (not e!628335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71248 (_ BitVec 32)) Bool)

(assert (=> b!1100858 (= res!734611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100859 () Bool)

(declare-fun e!628336 () Bool)

(assert (=> b!1100859 (= e!628335 e!628336)))

(declare-fun res!734608 () Bool)

(assert (=> b!1100859 (=> (not res!734608) (not e!628336))))

(declare-fun lt!493303 () array!71248)

(assert (=> b!1100859 (= res!734608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493303 mask!1414))))

(assert (=> b!1100859 (= lt!493303 (array!71249 (store (arr!34288 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34826 _keys!1070)))))

(declare-fun b!1100860 () Bool)

(declare-fun e!628333 () Bool)

(assert (=> b!1100860 (= e!628336 (not e!628333))))

(declare-fun res!734615 () Bool)

(assert (=> b!1100860 (=> res!734615 e!628333)))

(assert (=> b!1100860 (= res!734615 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41409)

(declare-datatypes ((tuple2!17432 0))(
  ( (tuple2!17433 (_1!8727 (_ BitVec 64)) (_2!8727 V!41409)) )
))
(declare-datatypes ((List!24022 0))(
  ( (Nil!24019) (Cons!24018 (h!25227 tuple2!17432) (t!34220 List!24022)) )
))
(declare-datatypes ((ListLongMap!15401 0))(
  ( (ListLongMap!15402 (toList!7716 List!24022)) )
))
(declare-fun lt!493310 () ListLongMap!15401)

(declare-fun zeroValue!831 () V!41409)

(declare-fun getCurrentListMap!4332 (array!71248 array!71250 (_ BitVec 32) (_ BitVec 32) V!41409 V!41409 (_ BitVec 32) Int) ListLongMap!15401)

(assert (=> b!1100860 (= lt!493310 (getCurrentListMap!4332 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493302 () ListLongMap!15401)

(declare-fun lt!493305 () array!71250)

(assert (=> b!1100860 (= lt!493302 (getCurrentListMap!4332 lt!493303 lt!493305 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493308 () ListLongMap!15401)

(declare-fun lt!493307 () ListLongMap!15401)

(assert (=> b!1100860 (and (= lt!493308 lt!493307) (= lt!493307 lt!493308))))

(declare-fun lt!493304 () ListLongMap!15401)

(declare-fun -!947 (ListLongMap!15401 (_ BitVec 64)) ListLongMap!15401)

(assert (=> b!1100860 (= lt!493307 (-!947 lt!493304 k0!904))))

(declare-datatypes ((Unit!36017 0))(
  ( (Unit!36018) )
))
(declare-fun lt!493311 () Unit!36017)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!221 (array!71248 array!71250 (_ BitVec 32) (_ BitVec 32) V!41409 V!41409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36017)

(assert (=> b!1100860 (= lt!493311 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!221 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4239 (array!71248 array!71250 (_ BitVec 32) (_ BitVec 32) V!41409 V!41409 (_ BitVec 32) Int) ListLongMap!15401)

(assert (=> b!1100860 (= lt!493308 (getCurrentListMapNoExtraKeys!4239 lt!493303 lt!493305 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2308 (Int (_ BitVec 64)) V!41409)

(assert (=> b!1100860 (= lt!493305 (array!71251 (store (arr!34289 _values!874) i!650 (ValueCellFull!12896 (dynLambda!2308 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34827 _values!874)))))

(assert (=> b!1100860 (= lt!493304 (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100860 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493306 () Unit!36017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71248 (_ BitVec 64) (_ BitVec 32)) Unit!36017)

(assert (=> b!1100860 (= lt!493306 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100861 () Bool)

(declare-fun e!628332 () Bool)

(assert (=> b!1100861 (= e!628332 (and e!628334 mapRes!42601))))

(declare-fun condMapEmpty!42601 () Bool)

(declare-fun mapDefault!42601 () ValueCell!12896)

(assert (=> b!1100861 (= condMapEmpty!42601 (= (arr!34289 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12896)) mapDefault!42601)))))

(declare-fun b!1100862 () Bool)

(declare-fun res!734614 () Bool)

(assert (=> b!1100862 (=> (not res!734614) (not e!628335))))

(assert (=> b!1100862 (= res!734614 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34826 _keys!1070))))))

(declare-fun b!1100863 () Bool)

(declare-fun res!734607 () Bool)

(assert (=> b!1100863 (=> (not res!734607) (not e!628335))))

(declare-datatypes ((List!24023 0))(
  ( (Nil!24020) (Cons!24019 (h!25228 (_ BitVec 64)) (t!34221 List!24023)) )
))
(declare-fun arrayNoDuplicates!0 (array!71248 (_ BitVec 32) List!24023) Bool)

(assert (=> b!1100863 (= res!734607 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24020))))

(declare-fun b!1100864 () Bool)

(declare-fun lt!493309 () tuple2!17432)

(declare-fun +!3426 (ListLongMap!15401 tuple2!17432) ListLongMap!15401)

(assert (=> b!1100864 (= e!628333 (= lt!493302 (+!3426 lt!493307 lt!493309)))))

(assert (=> b!1100864 (= lt!493302 (+!3426 lt!493308 lt!493309))))

(assert (=> b!1100864 (= lt!493309 (tuple2!17433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun res!734606 () Bool)

(assert (=> start!96786 (=> (not res!734606) (not e!628335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96786 (= res!734606 (validMask!0 mask!1414))))

(assert (=> start!96786 e!628335))

(assert (=> start!96786 tp!81433))

(assert (=> start!96786 true))

(assert (=> start!96786 tp_is_empty!27211))

(declare-fun array_inv!26440 (array!71248) Bool)

(assert (=> start!96786 (array_inv!26440 _keys!1070)))

(declare-fun array_inv!26441 (array!71250) Bool)

(assert (=> start!96786 (and (array_inv!26441 _values!874) e!628332)))

(declare-fun mapIsEmpty!42601 () Bool)

(assert (=> mapIsEmpty!42601 mapRes!42601))

(declare-fun b!1100865 () Bool)

(declare-fun res!734612 () Bool)

(assert (=> b!1100865 (=> (not res!734612) (not e!628336))))

(assert (=> b!1100865 (= res!734612 (arrayNoDuplicates!0 lt!493303 #b00000000000000000000000000000000 Nil!24020))))

(declare-fun b!1100866 () Bool)

(assert (=> b!1100866 (= e!628338 tp_is_empty!27211)))

(declare-fun b!1100867 () Bool)

(declare-fun res!734609 () Bool)

(assert (=> b!1100867 (=> (not res!734609) (not e!628335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100867 (= res!734609 (validKeyInArray!0 k0!904))))

(assert (= (and start!96786 res!734606) b!1100857))

(assert (= (and b!1100857 res!734613) b!1100858))

(assert (= (and b!1100858 res!734611) b!1100863))

(assert (= (and b!1100863 res!734607) b!1100862))

(assert (= (and b!1100862 res!734614) b!1100867))

(assert (= (and b!1100867 res!734609) b!1100856))

(assert (= (and b!1100856 res!734610) b!1100859))

(assert (= (and b!1100859 res!734608) b!1100865))

(assert (= (and b!1100865 res!734612) b!1100860))

(assert (= (and b!1100860 (not res!734615)) b!1100864))

(assert (= (and b!1100861 condMapEmpty!42601) mapIsEmpty!42601))

(assert (= (and b!1100861 (not condMapEmpty!42601)) mapNonEmpty!42601))

(get-info :version)

(assert (= (and mapNonEmpty!42601 ((_ is ValueCellFull!12896) mapValue!42601)) b!1100866))

(assert (= (and b!1100861 ((_ is ValueCellFull!12896) mapDefault!42601)) b!1100855))

(assert (= start!96786 b!1100861))

(declare-fun b_lambda!18037 () Bool)

(assert (=> (not b_lambda!18037) (not b!1100860)))

(declare-fun t!34219 () Bool)

(declare-fun tb!8019 () Bool)

(assert (=> (and start!96786 (= defaultEntry!882 defaultEntry!882) t!34219) tb!8019))

(declare-fun result!16585 () Bool)

(assert (=> tb!8019 (= result!16585 tp_is_empty!27211)))

(assert (=> b!1100860 t!34219))

(declare-fun b_and!37073 () Bool)

(assert (= b_and!37071 (and (=> t!34219 result!16585) b_and!37073)))

(declare-fun m!1020517 () Bool)

(assert (=> b!1100856 m!1020517))

(declare-fun m!1020519 () Bool)

(assert (=> b!1100867 m!1020519))

(declare-fun m!1020521 () Bool)

(assert (=> b!1100860 m!1020521))

(declare-fun m!1020523 () Bool)

(assert (=> b!1100860 m!1020523))

(declare-fun m!1020525 () Bool)

(assert (=> b!1100860 m!1020525))

(declare-fun m!1020527 () Bool)

(assert (=> b!1100860 m!1020527))

(declare-fun m!1020529 () Bool)

(assert (=> b!1100860 m!1020529))

(declare-fun m!1020531 () Bool)

(assert (=> b!1100860 m!1020531))

(declare-fun m!1020533 () Bool)

(assert (=> b!1100860 m!1020533))

(declare-fun m!1020535 () Bool)

(assert (=> b!1100860 m!1020535))

(declare-fun m!1020537 () Bool)

(assert (=> b!1100860 m!1020537))

(declare-fun m!1020539 () Bool)

(assert (=> b!1100860 m!1020539))

(declare-fun m!1020541 () Bool)

(assert (=> b!1100858 m!1020541))

(declare-fun m!1020543 () Bool)

(assert (=> mapNonEmpty!42601 m!1020543))

(declare-fun m!1020545 () Bool)

(assert (=> start!96786 m!1020545))

(declare-fun m!1020547 () Bool)

(assert (=> start!96786 m!1020547))

(declare-fun m!1020549 () Bool)

(assert (=> start!96786 m!1020549))

(declare-fun m!1020551 () Bool)

(assert (=> b!1100864 m!1020551))

(declare-fun m!1020553 () Bool)

(assert (=> b!1100864 m!1020553))

(declare-fun m!1020555 () Bool)

(assert (=> b!1100865 m!1020555))

(declare-fun m!1020557 () Bool)

(assert (=> b!1100859 m!1020557))

(declare-fun m!1020559 () Bool)

(assert (=> b!1100859 m!1020559))

(declare-fun m!1020561 () Bool)

(assert (=> b!1100863 m!1020561))

(check-sat (not b_next!23161) tp_is_empty!27211 (not mapNonEmpty!42601) (not b!1100860) (not start!96786) (not b!1100865) (not b!1100867) (not b!1100864) b_and!37073 (not b_lambda!18037) (not b!1100858) (not b!1100859) (not b!1100863))
(check-sat b_and!37073 (not b_next!23161))
