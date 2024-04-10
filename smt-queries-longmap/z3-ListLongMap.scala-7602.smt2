; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95934 () Bool)

(assert start!95934)

(declare-fun b_free!22587 () Bool)

(declare-fun b_next!22587 () Bool)

(assert (=> start!95934 (= b_free!22587 (not b_next!22587))))

(declare-fun tp!79610 () Bool)

(declare-fun b_and!35849 () Bool)

(assert (=> start!95934 (= tp!79610 b_and!35849)))

(declare-fun b!1086645 () Bool)

(declare-fun res!724603 () Bool)

(declare-fun e!620737 () Bool)

(assert (=> b!1086645 (=> (not res!724603) (not e!620737))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70111 0))(
  ( (array!70112 (arr!33729 (Array (_ BitVec 32) (_ BitVec 64))) (size!34265 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70111)

(assert (=> b!1086645 (= res!724603 (= (select (arr!33729 _keys!1070) i!650) k0!904))))

(declare-fun b!1086646 () Bool)

(declare-fun res!724601 () Bool)

(assert (=> b!1086646 (=> (not res!724601) (not e!620737))))

(declare-datatypes ((List!23527 0))(
  ( (Nil!23524) (Cons!23523 (h!24732 (_ BitVec 64)) (t!33172 List!23527)) )
))
(declare-fun arrayNoDuplicates!0 (array!70111 (_ BitVec 32) List!23527) Bool)

(assert (=> b!1086646 (= res!724601 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23524))))

(declare-fun mapIsEmpty!41638 () Bool)

(declare-fun mapRes!41638 () Bool)

(assert (=> mapIsEmpty!41638 mapRes!41638))

(declare-fun res!724609 () Bool)

(assert (=> start!95934 (=> (not res!724609) (not e!620737))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95934 (= res!724609 (validMask!0 mask!1414))))

(assert (=> start!95934 e!620737))

(assert (=> start!95934 tp!79610))

(assert (=> start!95934 true))

(declare-fun tp_is_empty!26589 () Bool)

(assert (=> start!95934 tp_is_empty!26589))

(declare-fun array_inv!26024 (array!70111) Bool)

(assert (=> start!95934 (array_inv!26024 _keys!1070)))

(declare-datatypes ((V!40579 0))(
  ( (V!40580 (val!13351 Int)) )
))
(declare-datatypes ((ValueCell!12585 0))(
  ( (ValueCellFull!12585 (v!15972 V!40579)) (EmptyCell!12585) )
))
(declare-datatypes ((array!70113 0))(
  ( (array!70114 (arr!33730 (Array (_ BitVec 32) ValueCell!12585)) (size!34266 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70113)

(declare-fun e!620735 () Bool)

(declare-fun array_inv!26025 (array!70113) Bool)

(assert (=> start!95934 (and (array_inv!26025 _values!874) e!620735)))

(declare-fun b!1086647 () Bool)

(declare-fun e!620732 () Bool)

(declare-fun e!620738 () Bool)

(assert (=> b!1086647 (= e!620732 (not e!620738))))

(declare-fun res!724608 () Bool)

(assert (=> b!1086647 (=> res!724608 e!620738)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086647 (= res!724608 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40579)

(declare-datatypes ((tuple2!16938 0))(
  ( (tuple2!16939 (_1!8480 (_ BitVec 64)) (_2!8480 V!40579)) )
))
(declare-datatypes ((List!23528 0))(
  ( (Nil!23525) (Cons!23524 (h!24733 tuple2!16938) (t!33173 List!23528)) )
))
(declare-datatypes ((ListLongMap!14907 0))(
  ( (ListLongMap!14908 (toList!7469 List!23528)) )
))
(declare-fun lt!483088 () ListLongMap!14907)

(declare-fun zeroValue!831 () V!40579)

(declare-fun getCurrentListMap!4247 (array!70111 array!70113 (_ BitVec 32) (_ BitVec 32) V!40579 V!40579 (_ BitVec 32) Int) ListLongMap!14907)

(assert (=> b!1086647 (= lt!483088 (getCurrentListMap!4247 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483093 () ListLongMap!14907)

(declare-fun lt!483087 () array!70111)

(declare-fun lt!483084 () array!70113)

(assert (=> b!1086647 (= lt!483093 (getCurrentListMap!4247 lt!483087 lt!483084 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483094 () ListLongMap!14907)

(declare-fun lt!483085 () ListLongMap!14907)

(assert (=> b!1086647 (and (= lt!483094 lt!483085) (= lt!483085 lt!483094))))

(declare-fun lt!483089 () ListLongMap!14907)

(declare-fun -!795 (ListLongMap!14907 (_ BitVec 64)) ListLongMap!14907)

(assert (=> b!1086647 (= lt!483085 (-!795 lt!483089 k0!904))))

(declare-datatypes ((Unit!35756 0))(
  ( (Unit!35757) )
))
(declare-fun lt!483082 () Unit!35756)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!66 (array!70111 array!70113 (_ BitVec 32) (_ BitVec 32) V!40579 V!40579 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35756)

(assert (=> b!1086647 (= lt!483082 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!66 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4007 (array!70111 array!70113 (_ BitVec 32) (_ BitVec 32) V!40579 V!40579 (_ BitVec 32) Int) ListLongMap!14907)

(assert (=> b!1086647 (= lt!483094 (getCurrentListMapNoExtraKeys!4007 lt!483087 lt!483084 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2144 (Int (_ BitVec 64)) V!40579)

(assert (=> b!1086647 (= lt!483084 (array!70114 (store (arr!33730 _values!874) i!650 (ValueCellFull!12585 (dynLambda!2144 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34266 _values!874)))))

(assert (=> b!1086647 (= lt!483089 (getCurrentListMapNoExtraKeys!4007 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086647 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483097 () Unit!35756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70111 (_ BitVec 64) (_ BitVec 32)) Unit!35756)

(assert (=> b!1086647 (= lt!483097 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41638 () Bool)

(declare-fun tp!79609 () Bool)

(declare-fun e!620734 () Bool)

(assert (=> mapNonEmpty!41638 (= mapRes!41638 (and tp!79609 e!620734))))

(declare-fun mapKey!41638 () (_ BitVec 32))

(declare-fun mapValue!41638 () ValueCell!12585)

(declare-fun mapRest!41638 () (Array (_ BitVec 32) ValueCell!12585))

(assert (=> mapNonEmpty!41638 (= (arr!33730 _values!874) (store mapRest!41638 mapKey!41638 mapValue!41638))))

(declare-fun b!1086648 () Bool)

(declare-fun res!724611 () Bool)

(assert (=> b!1086648 (=> (not res!724611) (not e!620737))))

(assert (=> b!1086648 (= res!724611 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34265 _keys!1070))))))

(declare-fun b!1086649 () Bool)

(declare-fun res!724604 () Bool)

(assert (=> b!1086649 (=> (not res!724604) (not e!620737))))

(assert (=> b!1086649 (= res!724604 (and (= (size!34266 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34265 _keys!1070) (size!34266 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086650 () Bool)

(declare-fun e!620736 () Bool)

(assert (=> b!1086650 (= e!620736 true)))

(declare-fun lt!483095 () tuple2!16938)

(declare-fun lt!483091 () ListLongMap!14907)

(declare-fun lt!483086 () ListLongMap!14907)

(declare-fun +!3276 (ListLongMap!14907 tuple2!16938) ListLongMap!14907)

(assert (=> b!1086650 (= (-!795 lt!483086 k0!904) (+!3276 lt!483091 lt!483095))))

(declare-fun lt!483081 () Unit!35756)

(declare-fun lt!483090 () ListLongMap!14907)

(declare-fun addRemoveCommutativeForDiffKeys!32 (ListLongMap!14907 (_ BitVec 64) V!40579 (_ BitVec 64)) Unit!35756)

(assert (=> b!1086650 (= lt!483081 (addRemoveCommutativeForDiffKeys!32 lt!483090 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086651 () Bool)

(declare-fun e!620733 () Bool)

(assert (=> b!1086651 (= e!620735 (and e!620733 mapRes!41638))))

(declare-fun condMapEmpty!41638 () Bool)

(declare-fun mapDefault!41638 () ValueCell!12585)

(assert (=> b!1086651 (= condMapEmpty!41638 (= (arr!33730 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12585)) mapDefault!41638)))))

(declare-fun b!1086652 () Bool)

(declare-fun res!724605 () Bool)

(assert (=> b!1086652 (=> (not res!724605) (not e!620732))))

(assert (=> b!1086652 (= res!724605 (arrayNoDuplicates!0 lt!483087 #b00000000000000000000000000000000 Nil!23524))))

(declare-fun b!1086653 () Bool)

(assert (=> b!1086653 (= e!620737 e!620732)))

(declare-fun res!724610 () Bool)

(assert (=> b!1086653 (=> (not res!724610) (not e!620732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70111 (_ BitVec 32)) Bool)

(assert (=> b!1086653 (= res!724610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483087 mask!1414))))

(assert (=> b!1086653 (= lt!483087 (array!70112 (store (arr!33729 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34265 _keys!1070)))))

(declare-fun b!1086654 () Bool)

(declare-fun res!724606 () Bool)

(assert (=> b!1086654 (=> (not res!724606) (not e!620737))))

(assert (=> b!1086654 (= res!724606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086655 () Bool)

(declare-fun res!724602 () Bool)

(assert (=> b!1086655 (=> (not res!724602) (not e!620737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086655 (= res!724602 (validKeyInArray!0 k0!904))))

(declare-fun b!1086656 () Bool)

(assert (=> b!1086656 (= e!620734 tp_is_empty!26589)))

(declare-fun b!1086657 () Bool)

(assert (=> b!1086657 (= e!620733 tp_is_empty!26589)))

(declare-fun b!1086658 () Bool)

(assert (=> b!1086658 (= e!620738 e!620736)))

(declare-fun res!724607 () Bool)

(assert (=> b!1086658 (=> res!724607 e!620736)))

(assert (=> b!1086658 (= res!724607 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483092 () ListLongMap!14907)

(assert (=> b!1086658 (= lt!483091 lt!483092)))

(assert (=> b!1086658 (= lt!483091 (-!795 lt!483090 k0!904))))

(declare-fun lt!483083 () Unit!35756)

(assert (=> b!1086658 (= lt!483083 (addRemoveCommutativeForDiffKeys!32 lt!483089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1086658 (= lt!483093 (+!3276 lt!483092 lt!483095))))

(declare-fun lt!483096 () tuple2!16938)

(assert (=> b!1086658 (= lt!483092 (+!3276 lt!483085 lt!483096))))

(assert (=> b!1086658 (= lt!483088 lt!483086)))

(assert (=> b!1086658 (= lt!483086 (+!3276 lt!483090 lt!483095))))

(assert (=> b!1086658 (= lt!483090 (+!3276 lt!483089 lt!483096))))

(assert (=> b!1086658 (= lt!483093 (+!3276 (+!3276 lt!483094 lt!483096) lt!483095))))

(assert (=> b!1086658 (= lt!483095 (tuple2!16939 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086658 (= lt!483096 (tuple2!16939 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(assert (= (and start!95934 res!724609) b!1086649))

(assert (= (and b!1086649 res!724604) b!1086654))

(assert (= (and b!1086654 res!724606) b!1086646))

(assert (= (and b!1086646 res!724601) b!1086648))

(assert (= (and b!1086648 res!724611) b!1086655))

(assert (= (and b!1086655 res!724602) b!1086645))

(assert (= (and b!1086645 res!724603) b!1086653))

(assert (= (and b!1086653 res!724610) b!1086652))

(assert (= (and b!1086652 res!724605) b!1086647))

(assert (= (and b!1086647 (not res!724608)) b!1086658))

(assert (= (and b!1086658 (not res!724607)) b!1086650))

(assert (= (and b!1086651 condMapEmpty!41638) mapIsEmpty!41638))

(assert (= (and b!1086651 (not condMapEmpty!41638)) mapNonEmpty!41638))

(get-info :version)

(assert (= (and mapNonEmpty!41638 ((_ is ValueCellFull!12585) mapValue!41638)) b!1086656))

(assert (= (and b!1086651 ((_ is ValueCellFull!12585) mapDefault!41638)) b!1086657))

(assert (= start!95934 b!1086651))

(declare-fun b_lambda!17257 () Bool)

(assert (=> (not b_lambda!17257) (not b!1086647)))

(declare-fun t!33171 () Bool)

(declare-fun tb!7465 () Bool)

(assert (=> (and start!95934 (= defaultEntry!882 defaultEntry!882) t!33171) tb!7465))

(declare-fun result!15449 () Bool)

(assert (=> tb!7465 (= result!15449 tp_is_empty!26589)))

(assert (=> b!1086647 t!33171))

(declare-fun b_and!35851 () Bool)

(assert (= b_and!35849 (and (=> t!33171 result!15449) b_and!35851)))

(declare-fun m!1005239 () Bool)

(assert (=> b!1086645 m!1005239))

(declare-fun m!1005241 () Bool)

(assert (=> b!1086652 m!1005241))

(declare-fun m!1005243 () Bool)

(assert (=> start!95934 m!1005243))

(declare-fun m!1005245 () Bool)

(assert (=> start!95934 m!1005245))

(declare-fun m!1005247 () Bool)

(assert (=> start!95934 m!1005247))

(declare-fun m!1005249 () Bool)

(assert (=> b!1086646 m!1005249))

(declare-fun m!1005251 () Bool)

(assert (=> b!1086653 m!1005251))

(declare-fun m!1005253 () Bool)

(assert (=> b!1086653 m!1005253))

(declare-fun m!1005255 () Bool)

(assert (=> b!1086650 m!1005255))

(declare-fun m!1005257 () Bool)

(assert (=> b!1086650 m!1005257))

(declare-fun m!1005259 () Bool)

(assert (=> b!1086650 m!1005259))

(declare-fun m!1005261 () Bool)

(assert (=> b!1086654 m!1005261))

(declare-fun m!1005263 () Bool)

(assert (=> mapNonEmpty!41638 m!1005263))

(declare-fun m!1005265 () Bool)

(assert (=> b!1086655 m!1005265))

(declare-fun m!1005267 () Bool)

(assert (=> b!1086647 m!1005267))

(declare-fun m!1005269 () Bool)

(assert (=> b!1086647 m!1005269))

(declare-fun m!1005271 () Bool)

(assert (=> b!1086647 m!1005271))

(declare-fun m!1005273 () Bool)

(assert (=> b!1086647 m!1005273))

(declare-fun m!1005275 () Bool)

(assert (=> b!1086647 m!1005275))

(declare-fun m!1005277 () Bool)

(assert (=> b!1086647 m!1005277))

(declare-fun m!1005279 () Bool)

(assert (=> b!1086647 m!1005279))

(declare-fun m!1005281 () Bool)

(assert (=> b!1086647 m!1005281))

(declare-fun m!1005283 () Bool)

(assert (=> b!1086647 m!1005283))

(declare-fun m!1005285 () Bool)

(assert (=> b!1086647 m!1005285))

(declare-fun m!1005287 () Bool)

(assert (=> b!1086658 m!1005287))

(declare-fun m!1005289 () Bool)

(assert (=> b!1086658 m!1005289))

(declare-fun m!1005291 () Bool)

(assert (=> b!1086658 m!1005291))

(declare-fun m!1005293 () Bool)

(assert (=> b!1086658 m!1005293))

(declare-fun m!1005295 () Bool)

(assert (=> b!1086658 m!1005295))

(declare-fun m!1005297 () Bool)

(assert (=> b!1086658 m!1005297))

(declare-fun m!1005299 () Bool)

(assert (=> b!1086658 m!1005299))

(assert (=> b!1086658 m!1005295))

(declare-fun m!1005301 () Bool)

(assert (=> b!1086658 m!1005301))

(check-sat (not b!1086654) (not b!1086652) (not b!1086647) (not b!1086646) b_and!35851 tp_is_empty!26589 (not b_next!22587) (not start!95934) (not b!1086655) (not b_lambda!17257) (not mapNonEmpty!41638) (not b!1086650) (not b!1086653) (not b!1086658))
(check-sat b_and!35851 (not b_next!22587))
