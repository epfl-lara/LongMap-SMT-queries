; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96638 () Bool)

(assert start!96638)

(declare-fun b_free!22981 () Bool)

(declare-fun b_next!22981 () Bool)

(assert (=> start!96638 (= b_free!22981 (not b_next!22981))))

(declare-fun tp!80869 () Bool)

(declare-fun b_and!36635 () Bool)

(assert (=> start!96638 (= tp!80869 b_and!36635)))

(declare-fun b!1097051 () Bool)

(declare-fun e!626378 () Bool)

(declare-fun tp_is_empty!27031 () Bool)

(assert (=> b!1097051 (= e!626378 tp_is_empty!27031)))

(declare-fun b!1097052 () Bool)

(declare-fun res!731783 () Bool)

(declare-fun e!626376 () Bool)

(assert (=> b!1097052 (=> (not res!731783) (not e!626376))))

(declare-datatypes ((array!71005 0))(
  ( (array!71006 (arr!34168 (Array (_ BitVec 32) (_ BitVec 64))) (size!34705 (_ BitVec 32))) )
))
(declare-fun lt!490438 () array!71005)

(declare-datatypes ((List!23862 0))(
  ( (Nil!23859) (Cons!23858 (h!25076 (_ BitVec 64)) (t!33881 List!23862)) )
))
(declare-fun arrayNoDuplicates!0 (array!71005 (_ BitVec 32) List!23862) Bool)

(assert (=> b!1097052 (= res!731783 (arrayNoDuplicates!0 lt!490438 #b00000000000000000000000000000000 Nil!23859))))

(declare-fun b!1097053 () Bool)

(declare-fun e!626377 () Bool)

(assert (=> b!1097053 (= e!626377 tp_is_empty!27031)))

(declare-fun b!1097054 () Bool)

(declare-fun res!731784 () Bool)

(declare-fun e!626380 () Bool)

(assert (=> b!1097054 (=> (not res!731784) (not e!626380))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097054 (= res!731784 (validKeyInArray!0 k0!904))))

(declare-fun b!1097055 () Bool)

(declare-fun res!731790 () Bool)

(assert (=> b!1097055 (=> (not res!731790) (not e!626380))))

(declare-fun _keys!1070 () array!71005)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097055 (= res!731790 (= (select (arr!34168 _keys!1070) i!650) k0!904))))

(declare-fun b!1097056 () Bool)

(declare-fun res!731786 () Bool)

(assert (=> b!1097056 (=> (not res!731786) (not e!626380))))

(assert (=> b!1097056 (= res!731786 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23859))))

(declare-fun mapNonEmpty!42307 () Bool)

(declare-fun mapRes!42307 () Bool)

(declare-fun tp!80870 () Bool)

(assert (=> mapNonEmpty!42307 (= mapRes!42307 (and tp!80870 e!626378))))

(declare-datatypes ((V!41169 0))(
  ( (V!41170 (val!13572 Int)) )
))
(declare-datatypes ((ValueCell!12806 0))(
  ( (ValueCellFull!12806 (v!16189 V!41169)) (EmptyCell!12806) )
))
(declare-fun mapValue!42307 () ValueCell!12806)

(declare-datatypes ((array!71007 0))(
  ( (array!71008 (arr!34169 (Array (_ BitVec 32) ValueCell!12806)) (size!34706 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71007)

(declare-fun mapKey!42307 () (_ BitVec 32))

(declare-fun mapRest!42307 () (Array (_ BitVec 32) ValueCell!12806))

(assert (=> mapNonEmpty!42307 (= (arr!34169 _values!874) (store mapRest!42307 mapKey!42307 mapValue!42307))))

(declare-fun b!1097057 () Bool)

(declare-fun res!731789 () Bool)

(assert (=> b!1097057 (=> (not res!731789) (not e!626380))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71005 (_ BitVec 32)) Bool)

(assert (=> b!1097057 (= res!731789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097058 () Bool)

(assert (=> b!1097058 (= e!626380 e!626376)))

(declare-fun res!731788 () Bool)

(assert (=> b!1097058 (=> (not res!731788) (not e!626376))))

(assert (=> b!1097058 (= res!731788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490438 mask!1414))))

(assert (=> b!1097058 (= lt!490438 (array!71006 (store (arr!34168 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34705 _keys!1070)))))

(declare-fun res!731785 () Bool)

(assert (=> start!96638 (=> (not res!731785) (not e!626380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96638 (= res!731785 (validMask!0 mask!1414))))

(assert (=> start!96638 e!626380))

(assert (=> start!96638 tp!80869))

(assert (=> start!96638 true))

(assert (=> start!96638 tp_is_empty!27031))

(declare-fun array_inv!26360 (array!71005) Bool)

(assert (=> start!96638 (array_inv!26360 _keys!1070)))

(declare-fun e!626379 () Bool)

(declare-fun array_inv!26361 (array!71007) Bool)

(assert (=> start!96638 (and (array_inv!26361 _values!874) e!626379)))

(declare-fun mapIsEmpty!42307 () Bool)

(assert (=> mapIsEmpty!42307 mapRes!42307))

(declare-fun b!1097059 () Bool)

(declare-fun res!731787 () Bool)

(assert (=> b!1097059 (=> (not res!731787) (not e!626380))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097059 (= res!731787 (and (= (size!34706 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34705 _keys!1070) (size!34706 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097060 () Bool)

(declare-fun res!731791 () Bool)

(assert (=> b!1097060 (=> (not res!731791) (not e!626380))))

(assert (=> b!1097060 (= res!731791 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34705 _keys!1070))))))

(declare-fun b!1097061 () Bool)

(assert (=> b!1097061 (= e!626379 (and e!626377 mapRes!42307))))

(declare-fun condMapEmpty!42307 () Bool)

(declare-fun mapDefault!42307 () ValueCell!12806)

(assert (=> b!1097061 (= condMapEmpty!42307 (= (arr!34169 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12806)) mapDefault!42307)))))

(declare-fun b!1097062 () Bool)

(assert (=> b!1097062 (= e!626376 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41169)

(declare-datatypes ((tuple2!17242 0))(
  ( (tuple2!17243 (_1!8632 (_ BitVec 64)) (_2!8632 V!41169)) )
))
(declare-datatypes ((List!23863 0))(
  ( (Nil!23860) (Cons!23859 (h!25077 tuple2!17242) (t!33882 List!23863)) )
))
(declare-datatypes ((ListLongMap!15219 0))(
  ( (ListLongMap!15220 (toList!7625 List!23863)) )
))
(declare-fun lt!490439 () ListLongMap!15219)

(declare-fun zeroValue!831 () V!41169)

(declare-fun getCurrentListMapNoExtraKeys!4178 (array!71005 array!71007 (_ BitVec 32) (_ BitVec 32) V!41169 V!41169 (_ BitVec 32) Int) ListLongMap!15219)

(declare-fun dynLambda!2296 (Int (_ BitVec 64)) V!41169)

(assert (=> b!1097062 (= lt!490439 (getCurrentListMapNoExtraKeys!4178 lt!490438 (array!71008 (store (arr!34169 _values!874) i!650 (ValueCellFull!12806 (dynLambda!2296 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34706 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490437 () ListLongMap!15219)

(assert (=> b!1097062 (= lt!490437 (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097062 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36037 0))(
  ( (Unit!36038) )
))
(declare-fun lt!490440 () Unit!36037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71005 (_ BitVec 64) (_ BitVec 32)) Unit!36037)

(assert (=> b!1097062 (= lt!490440 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96638 res!731785) b!1097059))

(assert (= (and b!1097059 res!731787) b!1097057))

(assert (= (and b!1097057 res!731789) b!1097056))

(assert (= (and b!1097056 res!731786) b!1097060))

(assert (= (and b!1097060 res!731791) b!1097054))

(assert (= (and b!1097054 res!731784) b!1097055))

(assert (= (and b!1097055 res!731790) b!1097058))

(assert (= (and b!1097058 res!731788) b!1097052))

(assert (= (and b!1097052 res!731783) b!1097062))

(assert (= (and b!1097061 condMapEmpty!42307) mapIsEmpty!42307))

(assert (= (and b!1097061 (not condMapEmpty!42307)) mapNonEmpty!42307))

(get-info :version)

(assert (= (and mapNonEmpty!42307 ((_ is ValueCellFull!12806) mapValue!42307)) b!1097051))

(assert (= (and b!1097061 ((_ is ValueCellFull!12806) mapDefault!42307)) b!1097053))

(assert (= start!96638 b!1097061))

(declare-fun b_lambda!17649 () Bool)

(assert (=> (not b_lambda!17649) (not b!1097062)))

(declare-fun t!33880 () Bool)

(declare-fun tb!7839 () Bool)

(assert (=> (and start!96638 (= defaultEntry!882 defaultEntry!882) t!33880) tb!7839))

(declare-fun result!16209 () Bool)

(assert (=> tb!7839 (= result!16209 tp_is_empty!27031)))

(assert (=> b!1097062 t!33880))

(declare-fun b_and!36637 () Bool)

(assert (= b_and!36635 (and (=> t!33880 result!16209) b_and!36637)))

(declare-fun m!1017003 () Bool)

(assert (=> b!1097054 m!1017003))

(declare-fun m!1017005 () Bool)

(assert (=> b!1097062 m!1017005))

(declare-fun m!1017007 () Bool)

(assert (=> b!1097062 m!1017007))

(declare-fun m!1017009 () Bool)

(assert (=> b!1097062 m!1017009))

(declare-fun m!1017011 () Bool)

(assert (=> b!1097062 m!1017011))

(declare-fun m!1017013 () Bool)

(assert (=> b!1097062 m!1017013))

(declare-fun m!1017015 () Bool)

(assert (=> b!1097062 m!1017015))

(declare-fun m!1017017 () Bool)

(assert (=> mapNonEmpty!42307 m!1017017))

(declare-fun m!1017019 () Bool)

(assert (=> b!1097057 m!1017019))

(declare-fun m!1017021 () Bool)

(assert (=> b!1097056 m!1017021))

(declare-fun m!1017023 () Bool)

(assert (=> b!1097058 m!1017023))

(declare-fun m!1017025 () Bool)

(assert (=> b!1097058 m!1017025))

(declare-fun m!1017027 () Bool)

(assert (=> start!96638 m!1017027))

(declare-fun m!1017029 () Bool)

(assert (=> start!96638 m!1017029))

(declare-fun m!1017031 () Bool)

(assert (=> start!96638 m!1017031))

(declare-fun m!1017033 () Bool)

(assert (=> b!1097055 m!1017033))

(declare-fun m!1017035 () Bool)

(assert (=> b!1097052 m!1017035))

(check-sat b_and!36637 (not b_lambda!17649) (not b!1097056) (not b_next!22981) (not mapNonEmpty!42307) (not b!1097052) (not b!1097062) tp_is_empty!27031 (not b!1097054) (not b!1097057) (not b!1097058) (not start!96638))
(check-sat b_and!36637 (not b_next!22981))
