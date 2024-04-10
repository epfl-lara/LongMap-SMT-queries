; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96794 () Bool)

(assert start!96794)

(declare-fun b_free!23163 () Bool)

(declare-fun b_next!23163 () Bool)

(assert (=> start!96794 (= b_free!23163 (not b_next!23163))))

(declare-fun tp!81440 () Bool)

(declare-fun b_and!37101 () Bool)

(assert (=> start!96794 (= tp!81440 b_and!37101)))

(declare-fun b!1101049 () Bool)

(declare-fun res!734709 () Bool)

(declare-fun e!628450 () Bool)

(assert (=> b!1101049 (=> (not res!734709) (not e!628450))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71345 0))(
  ( (array!71346 (arr!34336 (Array (_ BitVec 32) (_ BitVec 64))) (size!34872 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71345)

(declare-datatypes ((V!41411 0))(
  ( (V!41412 (val!13663 Int)) )
))
(declare-datatypes ((ValueCell!12897 0))(
  ( (ValueCellFull!12897 (v!16292 V!41411)) (EmptyCell!12897) )
))
(declare-datatypes ((array!71347 0))(
  ( (array!71348 (arr!34337 (Array (_ BitVec 32) ValueCell!12897)) (size!34873 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71347)

(assert (=> b!1101049 (= res!734709 (and (= (size!34873 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34872 _keys!1070) (size!34873 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42604 () Bool)

(declare-fun mapRes!42604 () Bool)

(assert (=> mapIsEmpty!42604 mapRes!42604))

(declare-fun b!1101050 () Bool)

(declare-fun e!628447 () Bool)

(declare-fun e!628446 () Bool)

(assert (=> b!1101050 (= e!628447 (not e!628446))))

(declare-fun res!734714 () Bool)

(assert (=> b!1101050 (=> res!734714 e!628446)))

(assert (=> b!1101050 (= res!734714 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun minValue!831 () V!41411)

(declare-fun zeroValue!831 () V!41411)

(declare-datatypes ((tuple2!17372 0))(
  ( (tuple2!17373 (_1!8697 (_ BitVec 64)) (_2!8697 V!41411)) )
))
(declare-datatypes ((List!23988 0))(
  ( (Nil!23985) (Cons!23984 (h!25193 tuple2!17372) (t!34197 List!23988)) )
))
(declare-datatypes ((ListLongMap!15341 0))(
  ( (ListLongMap!15342 (toList!7686 List!23988)) )
))
(declare-fun lt!493538 () ListLongMap!15341)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4393 (array!71345 array!71347 (_ BitVec 32) (_ BitVec 32) V!41411 V!41411 (_ BitVec 32) Int) ListLongMap!15341)

(assert (=> b!1101050 (= lt!493538 (getCurrentListMap!4393 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493541 () ListLongMap!15341)

(declare-fun lt!493539 () array!71347)

(declare-fun lt!493536 () array!71345)

(assert (=> b!1101050 (= lt!493541 (getCurrentListMap!4393 lt!493536 lt!493539 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493533 () ListLongMap!15341)

(declare-fun lt!493534 () ListLongMap!15341)

(assert (=> b!1101050 (and (= lt!493533 lt!493534) (= lt!493534 lt!493533))))

(declare-fun lt!493537 () ListLongMap!15341)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!971 (ListLongMap!15341 (_ BitVec 64)) ListLongMap!15341)

(assert (=> b!1101050 (= lt!493534 (-!971 lt!493537 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36190 0))(
  ( (Unit!36191) )
))
(declare-fun lt!493532 () Unit!36190)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!219 (array!71345 array!71347 (_ BitVec 32) (_ BitVec 32) V!41411 V!41411 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36190)

(assert (=> b!1101050 (= lt!493532 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!219 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4189 (array!71345 array!71347 (_ BitVec 32) (_ BitVec 32) V!41411 V!41411 (_ BitVec 32) Int) ListLongMap!15341)

(assert (=> b!1101050 (= lt!493533 (getCurrentListMapNoExtraKeys!4189 lt!493536 lt!493539 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2324 (Int (_ BitVec 64)) V!41411)

(assert (=> b!1101050 (= lt!493539 (array!71348 (store (arr!34337 _values!874) i!650 (ValueCellFull!12897 (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34873 _values!874)))))

(assert (=> b!1101050 (= lt!493537 (getCurrentListMapNoExtraKeys!4189 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101050 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493535 () Unit!36190)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71345 (_ BitVec 64) (_ BitVec 32)) Unit!36190)

(assert (=> b!1101050 (= lt!493535 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1101051 () Bool)

(declare-fun res!734707 () Bool)

(assert (=> b!1101051 (=> (not res!734707) (not e!628450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71345 (_ BitVec 32)) Bool)

(assert (=> b!1101051 (= res!734707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101052 () Bool)

(declare-fun e!628452 () Bool)

(declare-fun tp_is_empty!27213 () Bool)

(assert (=> b!1101052 (= e!628452 tp_is_empty!27213)))

(declare-fun b!1101053 () Bool)

(declare-fun e!628449 () Bool)

(assert (=> b!1101053 (= e!628449 (and e!628452 mapRes!42604))))

(declare-fun condMapEmpty!42604 () Bool)

(declare-fun mapDefault!42604 () ValueCell!12897)

(assert (=> b!1101053 (= condMapEmpty!42604 (= (arr!34337 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12897)) mapDefault!42604)))))

(declare-fun b!1101054 () Bool)

(declare-fun e!628448 () Bool)

(assert (=> b!1101054 (= e!628448 tp_is_empty!27213)))

(declare-fun res!734705 () Bool)

(assert (=> start!96794 (=> (not res!734705) (not e!628450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96794 (= res!734705 (validMask!0 mask!1414))))

(assert (=> start!96794 e!628450))

(assert (=> start!96794 tp!81440))

(assert (=> start!96794 true))

(assert (=> start!96794 tp_is_empty!27213))

(declare-fun array_inv!26446 (array!71345) Bool)

(assert (=> start!96794 (array_inv!26446 _keys!1070)))

(declare-fun array_inv!26447 (array!71347) Bool)

(assert (=> start!96794 (and (array_inv!26447 _values!874) e!628449)))

(declare-fun b!1101055 () Bool)

(declare-fun res!734711 () Bool)

(assert (=> b!1101055 (=> (not res!734711) (not e!628450))))

(assert (=> b!1101055 (= res!734711 (= (select (arr!34336 _keys!1070) i!650) k0!904))))

(declare-fun b!1101056 () Bool)

(declare-fun res!734713 () Bool)

(assert (=> b!1101056 (=> (not res!734713) (not e!628447))))

(declare-datatypes ((List!23989 0))(
  ( (Nil!23986) (Cons!23985 (h!25194 (_ BitVec 64)) (t!34198 List!23989)) )
))
(declare-fun arrayNoDuplicates!0 (array!71345 (_ BitVec 32) List!23989) Bool)

(assert (=> b!1101056 (= res!734713 (arrayNoDuplicates!0 lt!493536 #b00000000000000000000000000000000 Nil!23986))))

(declare-fun b!1101057 () Bool)

(declare-fun res!734708 () Bool)

(assert (=> b!1101057 (=> (not res!734708) (not e!628450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101057 (= res!734708 (validKeyInArray!0 k0!904))))

(declare-fun b!1101058 () Bool)

(declare-fun res!734706 () Bool)

(assert (=> b!1101058 (=> (not res!734706) (not e!628450))))

(assert (=> b!1101058 (= res!734706 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23986))))

(declare-fun b!1101059 () Bool)

(declare-fun res!734710 () Bool)

(assert (=> b!1101059 (=> (not res!734710) (not e!628450))))

(assert (=> b!1101059 (= res!734710 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34872 _keys!1070))))))

(declare-fun mapNonEmpty!42604 () Bool)

(declare-fun tp!81439 () Bool)

(assert (=> mapNonEmpty!42604 (= mapRes!42604 (and tp!81439 e!628448))))

(declare-fun mapKey!42604 () (_ BitVec 32))

(declare-fun mapValue!42604 () ValueCell!12897)

(declare-fun mapRest!42604 () (Array (_ BitVec 32) ValueCell!12897))

(assert (=> mapNonEmpty!42604 (= (arr!34337 _values!874) (store mapRest!42604 mapKey!42604 mapValue!42604))))

(declare-fun b!1101060 () Bool)

(assert (=> b!1101060 (= e!628450 e!628447)))

(declare-fun res!734712 () Bool)

(assert (=> b!1101060 (=> (not res!734712) (not e!628447))))

(assert (=> b!1101060 (= res!734712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493536 mask!1414))))

(assert (=> b!1101060 (= lt!493536 (array!71346 (store (arr!34336 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34872 _keys!1070)))))

(declare-fun lt!493540 () tuple2!17372)

(declare-fun b!1101061 () Bool)

(declare-fun +!3391 (ListLongMap!15341 tuple2!17372) ListLongMap!15341)

(assert (=> b!1101061 (= e!628446 (= lt!493541 (+!3391 lt!493534 lt!493540)))))

(assert (=> b!1101061 (= lt!493541 (+!3391 lt!493533 lt!493540))))

(assert (=> b!1101061 (= lt!493540 (tuple2!17373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (= (and start!96794 res!734705) b!1101049))

(assert (= (and b!1101049 res!734709) b!1101051))

(assert (= (and b!1101051 res!734707) b!1101058))

(assert (= (and b!1101058 res!734706) b!1101059))

(assert (= (and b!1101059 res!734710) b!1101057))

(assert (= (and b!1101057 res!734708) b!1101055))

(assert (= (and b!1101055 res!734711) b!1101060))

(assert (= (and b!1101060 res!734712) b!1101056))

(assert (= (and b!1101056 res!734713) b!1101050))

(assert (= (and b!1101050 (not res!734714)) b!1101061))

(assert (= (and b!1101053 condMapEmpty!42604) mapIsEmpty!42604))

(assert (= (and b!1101053 (not condMapEmpty!42604)) mapNonEmpty!42604))

(get-info :version)

(assert (= (and mapNonEmpty!42604 ((_ is ValueCellFull!12897) mapValue!42604)) b!1101054))

(assert (= (and b!1101053 ((_ is ValueCellFull!12897) mapDefault!42604)) b!1101052))

(assert (= start!96794 b!1101053))

(declare-fun b_lambda!18061 () Bool)

(assert (=> (not b_lambda!18061) (not b!1101050)))

(declare-fun t!34196 () Bool)

(declare-fun tb!8029 () Bool)

(assert (=> (and start!96794 (= defaultEntry!882 defaultEntry!882) t!34196) tb!8029))

(declare-fun result!16597 () Bool)

(assert (=> tb!8029 (= result!16597 tp_is_empty!27213)))

(assert (=> b!1101050 t!34196))

(declare-fun b_and!37103 () Bool)

(assert (= b_and!37101 (and (=> t!34196 result!16597) b_and!37103)))

(declare-fun m!1021189 () Bool)

(assert (=> b!1101057 m!1021189))

(declare-fun m!1021191 () Bool)

(assert (=> b!1101058 m!1021191))

(declare-fun m!1021193 () Bool)

(assert (=> b!1101051 m!1021193))

(declare-fun m!1021195 () Bool)

(assert (=> b!1101055 m!1021195))

(declare-fun m!1021197 () Bool)

(assert (=> b!1101061 m!1021197))

(declare-fun m!1021199 () Bool)

(assert (=> b!1101061 m!1021199))

(declare-fun m!1021201 () Bool)

(assert (=> b!1101050 m!1021201))

(declare-fun m!1021203 () Bool)

(assert (=> b!1101050 m!1021203))

(declare-fun m!1021205 () Bool)

(assert (=> b!1101050 m!1021205))

(declare-fun m!1021207 () Bool)

(assert (=> b!1101050 m!1021207))

(declare-fun m!1021209 () Bool)

(assert (=> b!1101050 m!1021209))

(declare-fun m!1021211 () Bool)

(assert (=> b!1101050 m!1021211))

(declare-fun m!1021213 () Bool)

(assert (=> b!1101050 m!1021213))

(declare-fun m!1021215 () Bool)

(assert (=> b!1101050 m!1021215))

(declare-fun m!1021217 () Bool)

(assert (=> b!1101050 m!1021217))

(declare-fun m!1021219 () Bool)

(assert (=> b!1101050 m!1021219))

(declare-fun m!1021221 () Bool)

(assert (=> b!1101060 m!1021221))

(declare-fun m!1021223 () Bool)

(assert (=> b!1101060 m!1021223))

(declare-fun m!1021225 () Bool)

(assert (=> b!1101056 m!1021225))

(declare-fun m!1021227 () Bool)

(assert (=> start!96794 m!1021227))

(declare-fun m!1021229 () Bool)

(assert (=> start!96794 m!1021229))

(declare-fun m!1021231 () Bool)

(assert (=> start!96794 m!1021231))

(declare-fun m!1021233 () Bool)

(assert (=> mapNonEmpty!42604 m!1021233))

(check-sat tp_is_empty!27213 (not b!1101060) (not b!1101057) b_and!37103 (not b_lambda!18061) (not mapNonEmpty!42604) (not b!1101061) (not b!1101056) (not b!1101058) (not b!1101051) (not start!96794) (not b_next!23163) (not b!1101050))
(check-sat b_and!37103 (not b_next!23163))
