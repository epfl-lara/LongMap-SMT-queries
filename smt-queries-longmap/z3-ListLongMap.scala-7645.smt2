; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96192 () Bool)

(assert start!96192)

(declare-fun b_free!22845 () Bool)

(declare-fun b_next!22845 () Bool)

(assert (=> start!96192 (= b_free!22845 (not b_next!22845))))

(declare-fun tp!80383 () Bool)

(declare-fun b_and!36365 () Bool)

(assert (=> start!96192 (= tp!80383 b_and!36365)))

(declare-fun b!1092329 () Bool)

(declare-fun res!728873 () Bool)

(declare-fun e!623818 () Bool)

(assert (=> b!1092329 (=> (not res!728873) (not e!623818))))

(declare-datatypes ((array!70613 0))(
  ( (array!70614 (arr!33980 (Array (_ BitVec 32) (_ BitVec 64))) (size!34516 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70613)

(declare-datatypes ((List!23736 0))(
  ( (Nil!23733) (Cons!23732 (h!24941 (_ BitVec 64)) (t!33639 List!23736)) )
))
(declare-fun arrayNoDuplicates!0 (array!70613 (_ BitVec 32) List!23736) Bool)

(assert (=> b!1092329 (= res!728873 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23733))))

(declare-fun b!1092330 () Bool)

(declare-fun e!623821 () Bool)

(declare-fun tp_is_empty!26847 () Bool)

(assert (=> b!1092330 (= e!623821 tp_is_empty!26847)))

(declare-fun b!1092331 () Bool)

(declare-fun e!623820 () Bool)

(assert (=> b!1092331 (= e!623820 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40923 0))(
  ( (V!40924 (val!13480 Int)) )
))
(declare-fun minValue!831 () V!40923)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17152 0))(
  ( (tuple2!17153 (_1!8587 (_ BitVec 64)) (_2!8587 V!40923)) )
))
(declare-datatypes ((List!23737 0))(
  ( (Nil!23734) (Cons!23733 (h!24942 tuple2!17152) (t!33640 List!23737)) )
))
(declare-datatypes ((ListLongMap!15121 0))(
  ( (ListLongMap!15122 (toList!7576 List!23737)) )
))
(declare-fun lt!488200 () ListLongMap!15121)

(declare-fun zeroValue!831 () V!40923)

(declare-datatypes ((ValueCell!12714 0))(
  ( (ValueCellFull!12714 (v!16101 V!40923)) (EmptyCell!12714) )
))
(declare-datatypes ((array!70615 0))(
  ( (array!70616 (arr!33981 (Array (_ BitVec 32) ValueCell!12714)) (size!34517 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70615)

(declare-fun getCurrentListMap!4332 (array!70613 array!70615 (_ BitVec 32) (_ BitVec 32) V!40923 V!40923 (_ BitVec 32) Int) ListLongMap!15121)

(assert (=> b!1092331 (= lt!488200 (getCurrentListMap!4332 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488205 () array!70615)

(declare-fun lt!488198 () ListLongMap!15121)

(declare-fun lt!488199 () array!70613)

(assert (=> b!1092331 (= lt!488198 (getCurrentListMap!4332 lt!488199 lt!488205 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488203 () ListLongMap!15121)

(declare-fun lt!488201 () ListLongMap!15121)

(assert (=> b!1092331 (and (= lt!488203 lt!488201) (= lt!488201 lt!488203))))

(declare-fun lt!488204 () ListLongMap!15121)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!895 (ListLongMap!15121 (_ BitVec 64)) ListLongMap!15121)

(assert (=> b!1092331 (= lt!488201 (-!895 lt!488204 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35956 0))(
  ( (Unit!35957) )
))
(declare-fun lt!488202 () Unit!35956)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!151 (array!70613 array!70615 (_ BitVec 32) (_ BitVec 32) V!40923 V!40923 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35956)

(assert (=> b!1092331 (= lt!488202 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!151 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4092 (array!70613 array!70615 (_ BitVec 32) (_ BitVec 32) V!40923 V!40923 (_ BitVec 32) Int) ListLongMap!15121)

(assert (=> b!1092331 (= lt!488203 (getCurrentListMapNoExtraKeys!4092 lt!488199 lt!488205 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2229 (Int (_ BitVec 64)) V!40923)

(assert (=> b!1092331 (= lt!488205 (array!70616 (store (arr!33981 _values!874) i!650 (ValueCellFull!12714 (dynLambda!2229 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34517 _values!874)))))

(assert (=> b!1092331 (= lt!488204 (getCurrentListMapNoExtraKeys!4092 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092331 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488206 () Unit!35956)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70613 (_ BitVec 64) (_ BitVec 32)) Unit!35956)

(assert (=> b!1092331 (= lt!488206 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42025 () Bool)

(declare-fun mapRes!42025 () Bool)

(assert (=> mapIsEmpty!42025 mapRes!42025))

(declare-fun b!1092332 () Bool)

(declare-fun res!728869 () Bool)

(assert (=> b!1092332 (=> (not res!728869) (not e!623818))))

(assert (=> b!1092332 (= res!728869 (and (= (size!34517 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34516 _keys!1070) (size!34517 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092333 () Bool)

(declare-fun res!728868 () Bool)

(assert (=> b!1092333 (=> (not res!728868) (not e!623818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092333 (= res!728868 (validKeyInArray!0 k0!904))))

(declare-fun b!1092335 () Bool)

(declare-fun e!623822 () Bool)

(assert (=> b!1092335 (= e!623822 tp_is_empty!26847)))

(declare-fun b!1092336 () Bool)

(assert (=> b!1092336 (= e!623818 e!623820)))

(declare-fun res!728871 () Bool)

(assert (=> b!1092336 (=> (not res!728871) (not e!623820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70613 (_ BitVec 32)) Bool)

(assert (=> b!1092336 (= res!728871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488199 mask!1414))))

(assert (=> b!1092336 (= lt!488199 (array!70614 (store (arr!33980 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34516 _keys!1070)))))

(declare-fun b!1092337 () Bool)

(declare-fun res!728866 () Bool)

(assert (=> b!1092337 (=> (not res!728866) (not e!623818))))

(assert (=> b!1092337 (= res!728866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092338 () Bool)

(declare-fun res!728874 () Bool)

(assert (=> b!1092338 (=> (not res!728874) (not e!623818))))

(assert (=> b!1092338 (= res!728874 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34516 _keys!1070))))))

(declare-fun b!1092339 () Bool)

(declare-fun e!623819 () Bool)

(assert (=> b!1092339 (= e!623819 (and e!623821 mapRes!42025))))

(declare-fun condMapEmpty!42025 () Bool)

(declare-fun mapDefault!42025 () ValueCell!12714)

(assert (=> b!1092339 (= condMapEmpty!42025 (= (arr!33981 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12714)) mapDefault!42025)))))

(declare-fun mapNonEmpty!42025 () Bool)

(declare-fun tp!80384 () Bool)

(assert (=> mapNonEmpty!42025 (= mapRes!42025 (and tp!80384 e!623822))))

(declare-fun mapRest!42025 () (Array (_ BitVec 32) ValueCell!12714))

(declare-fun mapValue!42025 () ValueCell!12714)

(declare-fun mapKey!42025 () (_ BitVec 32))

(assert (=> mapNonEmpty!42025 (= (arr!33981 _values!874) (store mapRest!42025 mapKey!42025 mapValue!42025))))

(declare-fun b!1092340 () Bool)

(declare-fun res!728867 () Bool)

(assert (=> b!1092340 (=> (not res!728867) (not e!623820))))

(assert (=> b!1092340 (= res!728867 (arrayNoDuplicates!0 lt!488199 #b00000000000000000000000000000000 Nil!23733))))

(declare-fun b!1092334 () Bool)

(declare-fun res!728872 () Bool)

(assert (=> b!1092334 (=> (not res!728872) (not e!623818))))

(assert (=> b!1092334 (= res!728872 (= (select (arr!33980 _keys!1070) i!650) k0!904))))

(declare-fun res!728870 () Bool)

(assert (=> start!96192 (=> (not res!728870) (not e!623818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96192 (= res!728870 (validMask!0 mask!1414))))

(assert (=> start!96192 e!623818))

(assert (=> start!96192 tp!80383))

(assert (=> start!96192 true))

(assert (=> start!96192 tp_is_empty!26847))

(declare-fun array_inv!26198 (array!70613) Bool)

(assert (=> start!96192 (array_inv!26198 _keys!1070)))

(declare-fun array_inv!26199 (array!70615) Bool)

(assert (=> start!96192 (and (array_inv!26199 _values!874) e!623819)))

(assert (= (and start!96192 res!728870) b!1092332))

(assert (= (and b!1092332 res!728869) b!1092337))

(assert (= (and b!1092337 res!728866) b!1092329))

(assert (= (and b!1092329 res!728873) b!1092338))

(assert (= (and b!1092338 res!728874) b!1092333))

(assert (= (and b!1092333 res!728868) b!1092334))

(assert (= (and b!1092334 res!728872) b!1092336))

(assert (= (and b!1092336 res!728871) b!1092340))

(assert (= (and b!1092340 res!728867) b!1092331))

(assert (= (and b!1092339 condMapEmpty!42025) mapIsEmpty!42025))

(assert (= (and b!1092339 (not condMapEmpty!42025)) mapNonEmpty!42025))

(get-info :version)

(assert (= (and mapNonEmpty!42025 ((_ is ValueCellFull!12714) mapValue!42025)) b!1092335))

(assert (= (and b!1092339 ((_ is ValueCellFull!12714) mapDefault!42025)) b!1092330))

(assert (= start!96192 b!1092339))

(declare-fun b_lambda!17515 () Bool)

(assert (=> (not b_lambda!17515) (not b!1092331)))

(declare-fun t!33638 () Bool)

(declare-fun tb!7723 () Bool)

(assert (=> (and start!96192 (= defaultEntry!882 defaultEntry!882) t!33638) tb!7723))

(declare-fun result!15965 () Bool)

(assert (=> tb!7723 (= result!15965 tp_is_empty!26847)))

(assert (=> b!1092331 t!33638))

(declare-fun b_and!36367 () Bool)

(assert (= b_and!36365 (and (=> t!33638 result!15965) b_and!36367)))

(declare-fun m!1012081 () Bool)

(assert (=> b!1092337 m!1012081))

(declare-fun m!1012083 () Bool)

(assert (=> mapNonEmpty!42025 m!1012083))

(declare-fun m!1012085 () Bool)

(assert (=> b!1092329 m!1012085))

(declare-fun m!1012087 () Bool)

(assert (=> start!96192 m!1012087))

(declare-fun m!1012089 () Bool)

(assert (=> start!96192 m!1012089))

(declare-fun m!1012091 () Bool)

(assert (=> start!96192 m!1012091))

(declare-fun m!1012093 () Bool)

(assert (=> b!1092334 m!1012093))

(declare-fun m!1012095 () Bool)

(assert (=> b!1092336 m!1012095))

(declare-fun m!1012097 () Bool)

(assert (=> b!1092336 m!1012097))

(declare-fun m!1012099 () Bool)

(assert (=> b!1092340 m!1012099))

(declare-fun m!1012101 () Bool)

(assert (=> b!1092331 m!1012101))

(declare-fun m!1012103 () Bool)

(assert (=> b!1092331 m!1012103))

(declare-fun m!1012105 () Bool)

(assert (=> b!1092331 m!1012105))

(declare-fun m!1012107 () Bool)

(assert (=> b!1092331 m!1012107))

(declare-fun m!1012109 () Bool)

(assert (=> b!1092331 m!1012109))

(declare-fun m!1012111 () Bool)

(assert (=> b!1092331 m!1012111))

(declare-fun m!1012113 () Bool)

(assert (=> b!1092331 m!1012113))

(declare-fun m!1012115 () Bool)

(assert (=> b!1092331 m!1012115))

(declare-fun m!1012117 () Bool)

(assert (=> b!1092331 m!1012117))

(declare-fun m!1012119 () Bool)

(assert (=> b!1092331 m!1012119))

(declare-fun m!1012121 () Bool)

(assert (=> b!1092333 m!1012121))

(check-sat (not b_lambda!17515) (not start!96192) (not b!1092337) (not b!1092331) (not mapNonEmpty!42025) tp_is_empty!26847 b_and!36367 (not b!1092336) (not b!1092329) (not b!1092340) (not b!1092333) (not b_next!22845))
(check-sat b_and!36367 (not b_next!22845))
