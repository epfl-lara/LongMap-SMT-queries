; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96300 () Bool)

(assert start!96300)

(declare-fun b_free!22717 () Bool)

(declare-fun b_next!22717 () Bool)

(assert (=> start!96300 (= b_free!22717 (not b_next!22717))))

(declare-fun tp!79999 () Bool)

(declare-fun b_and!36119 () Bool)

(assert (=> start!96300 (= tp!79999 b_and!36119)))

(declare-fun b!1090841 () Bool)

(declare-fun res!727286 () Bool)

(declare-fun e!623151 () Bool)

(assert (=> b!1090841 (=> (not res!727286) (not e!623151))))

(declare-datatypes ((array!70399 0))(
  ( (array!70400 (arr!33867 (Array (_ BitVec 32) (_ BitVec 64))) (size!34404 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70399)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70399 (_ BitVec 32)) Bool)

(assert (=> b!1090841 (= res!727286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090842 () Bool)

(declare-fun e!623148 () Bool)

(declare-fun e!623146 () Bool)

(assert (=> b!1090842 (= e!623148 e!623146)))

(declare-fun res!727282 () Bool)

(assert (=> b!1090842 (=> res!727282 e!623146)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1090842 (= res!727282 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40753 0))(
  ( (V!40754 (val!13416 Int)) )
))
(declare-datatypes ((tuple2!17056 0))(
  ( (tuple2!17057 (_1!8539 (_ BitVec 64)) (_2!8539 V!40753)) )
))
(declare-datatypes ((List!23648 0))(
  ( (Nil!23645) (Cons!23644 (h!24862 tuple2!17056) (t!33415 List!23648)) )
))
(declare-datatypes ((ListLongMap!15033 0))(
  ( (ListLongMap!15034 (toList!7532 List!23648)) )
))
(declare-fun lt!486271 () ListLongMap!15033)

(declare-fun lt!486275 () ListLongMap!15033)

(assert (=> b!1090842 (= lt!486271 lt!486275)))

(declare-fun lt!486264 () ListLongMap!15033)

(declare-fun lt!486276 () tuple2!17056)

(declare-fun +!3350 (ListLongMap!15033 tuple2!17056) ListLongMap!15033)

(assert (=> b!1090842 (= lt!486275 (+!3350 lt!486264 lt!486276))))

(declare-fun lt!486269 () ListLongMap!15033)

(declare-fun lt!486274 () ListLongMap!15033)

(assert (=> b!1090842 (= lt!486269 lt!486274)))

(declare-fun lt!486267 () ListLongMap!15033)

(assert (=> b!1090842 (= lt!486274 (+!3350 lt!486267 lt!486276))))

(declare-fun lt!486273 () ListLongMap!15033)

(assert (=> b!1090842 (= lt!486271 (+!3350 lt!486273 lt!486276))))

(declare-fun zeroValue!831 () V!40753)

(assert (=> b!1090842 (= lt!486276 (tuple2!17057 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1090843 () Bool)

(declare-fun e!623153 () Bool)

(declare-fun tp_is_empty!26719 () Bool)

(assert (=> b!1090843 (= e!623153 tp_is_empty!26719)))

(declare-fun b!1090844 () Bool)

(declare-fun e!623149 () Bool)

(assert (=> b!1090844 (= e!623149 (not e!623148))))

(declare-fun res!727284 () Bool)

(assert (=> b!1090844 (=> res!727284 e!623148)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090844 (= res!727284 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40753)

(declare-datatypes ((ValueCell!12650 0))(
  ( (ValueCellFull!12650 (v!16033 V!40753)) (EmptyCell!12650) )
))
(declare-datatypes ((array!70401 0))(
  ( (array!70402 (arr!33868 (Array (_ BitVec 32) ValueCell!12650)) (size!34405 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70401)

(declare-fun getCurrentListMap!4288 (array!70399 array!70401 (_ BitVec 32) (_ BitVec 32) V!40753 V!40753 (_ BitVec 32) Int) ListLongMap!15033)

(assert (=> b!1090844 (= lt!486269 (getCurrentListMap!4288 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486272 () array!70401)

(declare-fun lt!486265 () array!70399)

(assert (=> b!1090844 (= lt!486271 (getCurrentListMap!4288 lt!486265 lt!486272 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090844 (and (= lt!486273 lt!486264) (= lt!486264 lt!486273))))

(declare-fun -!841 (ListLongMap!15033 (_ BitVec 64)) ListLongMap!15033)

(assert (=> b!1090844 (= lt!486264 (-!841 lt!486267 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35849 0))(
  ( (Unit!35850) )
))
(declare-fun lt!486270 () Unit!35849)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!117 (array!70399 array!70401 (_ BitVec 32) (_ BitVec 32) V!40753 V!40753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35849)

(assert (=> b!1090844 (= lt!486270 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!117 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4093 (array!70399 array!70401 (_ BitVec 32) (_ BitVec 32) V!40753 V!40753 (_ BitVec 32) Int) ListLongMap!15033)

(assert (=> b!1090844 (= lt!486273 (getCurrentListMapNoExtraKeys!4093 lt!486265 lt!486272 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2214 (Int (_ BitVec 64)) V!40753)

(assert (=> b!1090844 (= lt!486272 (array!70402 (store (arr!33868 _values!874) i!650 (ValueCellFull!12650 (dynLambda!2214 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34405 _values!874)))))

(assert (=> b!1090844 (= lt!486267 (getCurrentListMapNoExtraKeys!4093 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090844 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486268 () Unit!35849)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70399 (_ BitVec 64) (_ BitVec 32)) Unit!35849)

(assert (=> b!1090844 (= lt!486268 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090845 () Bool)

(declare-fun e!623150 () Bool)

(assert (=> b!1090845 (= e!623150 tp_is_empty!26719)))

(declare-fun b!1090846 () Bool)

(declare-fun e!623152 () Bool)

(declare-fun mapRes!41833 () Bool)

(assert (=> b!1090846 (= e!623152 (and e!623153 mapRes!41833))))

(declare-fun condMapEmpty!41833 () Bool)

(declare-fun mapDefault!41833 () ValueCell!12650)

(assert (=> b!1090846 (= condMapEmpty!41833 (= (arr!33868 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12650)) mapDefault!41833)))))

(declare-fun b!1090847 () Bool)

(assert (=> b!1090847 (= e!623151 e!623149)))

(declare-fun res!727280 () Bool)

(assert (=> b!1090847 (=> (not res!727280) (not e!623149))))

(assert (=> b!1090847 (= res!727280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486265 mask!1414))))

(assert (=> b!1090847 (= lt!486265 (array!70400 (store (arr!33867 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34404 _keys!1070)))))

(declare-fun res!727287 () Bool)

(assert (=> start!96300 (=> (not res!727287) (not e!623151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96300 (= res!727287 (validMask!0 mask!1414))))

(assert (=> start!96300 e!623151))

(assert (=> start!96300 tp!79999))

(assert (=> start!96300 true))

(assert (=> start!96300 tp_is_empty!26719))

(declare-fun array_inv!26168 (array!70399) Bool)

(assert (=> start!96300 (array_inv!26168 _keys!1070)))

(declare-fun array_inv!26169 (array!70401) Bool)

(assert (=> start!96300 (and (array_inv!26169 _values!874) e!623152)))

(declare-fun b!1090848 () Bool)

(declare-fun res!727278 () Bool)

(assert (=> b!1090848 (=> (not res!727278) (not e!623149))))

(declare-datatypes ((List!23649 0))(
  ( (Nil!23646) (Cons!23645 (h!24863 (_ BitVec 64)) (t!33416 List!23649)) )
))
(declare-fun arrayNoDuplicates!0 (array!70399 (_ BitVec 32) List!23649) Bool)

(assert (=> b!1090848 (= res!727278 (arrayNoDuplicates!0 lt!486265 #b00000000000000000000000000000000 Nil!23646))))

(declare-fun b!1090849 () Bool)

(declare-fun res!727285 () Bool)

(assert (=> b!1090849 (=> (not res!727285) (not e!623151))))

(assert (=> b!1090849 (= res!727285 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23646))))

(declare-fun b!1090850 () Bool)

(declare-fun res!727277 () Bool)

(assert (=> b!1090850 (=> (not res!727277) (not e!623151))))

(assert (=> b!1090850 (= res!727277 (= (select (arr!33867 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41833 () Bool)

(declare-fun tp!80000 () Bool)

(assert (=> mapNonEmpty!41833 (= mapRes!41833 (and tp!80000 e!623150))))

(declare-fun mapValue!41833 () ValueCell!12650)

(declare-fun mapRest!41833 () (Array (_ BitVec 32) ValueCell!12650))

(declare-fun mapKey!41833 () (_ BitVec 32))

(assert (=> mapNonEmpty!41833 (= (arr!33868 _values!874) (store mapRest!41833 mapKey!41833 mapValue!41833))))

(declare-fun b!1090851 () Bool)

(declare-fun res!727283 () Bool)

(assert (=> b!1090851 (=> (not res!727283) (not e!623151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090851 (= res!727283 (validKeyInArray!0 k0!904))))

(declare-fun b!1090852 () Bool)

(declare-fun res!727279 () Bool)

(assert (=> b!1090852 (=> (not res!727279) (not e!623151))))

(assert (=> b!1090852 (= res!727279 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34404 _keys!1070))))))

(declare-fun mapIsEmpty!41833 () Bool)

(assert (=> mapIsEmpty!41833 mapRes!41833))

(declare-fun b!1090853 () Bool)

(declare-fun res!727281 () Bool)

(assert (=> b!1090853 (=> (not res!727281) (not e!623151))))

(assert (=> b!1090853 (= res!727281 (and (= (size!34405 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34404 _keys!1070) (size!34405 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090854 () Bool)

(assert (=> b!1090854 (= e!623146 true)))

(assert (=> b!1090854 (= (-!841 lt!486274 k0!904) lt!486275)))

(declare-fun lt!486266 () Unit!35849)

(declare-fun addRemoveCommutativeForDiffKeys!79 (ListLongMap!15033 (_ BitVec 64) V!40753 (_ BitVec 64)) Unit!35849)

(assert (=> b!1090854 (= lt!486266 (addRemoveCommutativeForDiffKeys!79 lt!486267 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (= (and start!96300 res!727287) b!1090853))

(assert (= (and b!1090853 res!727281) b!1090841))

(assert (= (and b!1090841 res!727286) b!1090849))

(assert (= (and b!1090849 res!727285) b!1090852))

(assert (= (and b!1090852 res!727279) b!1090851))

(assert (= (and b!1090851 res!727283) b!1090850))

(assert (= (and b!1090850 res!727277) b!1090847))

(assert (= (and b!1090847 res!727280) b!1090848))

(assert (= (and b!1090848 res!727278) b!1090844))

(assert (= (and b!1090844 (not res!727284)) b!1090842))

(assert (= (and b!1090842 (not res!727282)) b!1090854))

(assert (= (and b!1090846 condMapEmpty!41833) mapIsEmpty!41833))

(assert (= (and b!1090846 (not condMapEmpty!41833)) mapNonEmpty!41833))

(get-info :version)

(assert (= (and mapNonEmpty!41833 ((_ is ValueCellFull!12650) mapValue!41833)) b!1090845))

(assert (= (and b!1090846 ((_ is ValueCellFull!12650) mapDefault!41833)) b!1090843))

(assert (= start!96300 b!1090846))

(declare-fun b_lambda!17397 () Bool)

(assert (=> (not b_lambda!17397) (not b!1090844)))

(declare-fun t!33414 () Bool)

(declare-fun tb!7587 () Bool)

(assert (=> (and start!96300 (= defaultEntry!882 defaultEntry!882) t!33414) tb!7587))

(declare-fun result!15701 () Bool)

(assert (=> tb!7587 (= result!15701 tp_is_empty!26719)))

(assert (=> b!1090844 t!33414))

(declare-fun b_and!36121 () Bool)

(assert (= b_and!36119 (and (=> t!33414 result!15701) b_and!36121)))

(declare-fun m!1010447 () Bool)

(assert (=> b!1090844 m!1010447))

(declare-fun m!1010449 () Bool)

(assert (=> b!1090844 m!1010449))

(declare-fun m!1010451 () Bool)

(assert (=> b!1090844 m!1010451))

(declare-fun m!1010453 () Bool)

(assert (=> b!1090844 m!1010453))

(declare-fun m!1010455 () Bool)

(assert (=> b!1090844 m!1010455))

(declare-fun m!1010457 () Bool)

(assert (=> b!1090844 m!1010457))

(declare-fun m!1010459 () Bool)

(assert (=> b!1090844 m!1010459))

(declare-fun m!1010461 () Bool)

(assert (=> b!1090844 m!1010461))

(declare-fun m!1010463 () Bool)

(assert (=> b!1090844 m!1010463))

(declare-fun m!1010465 () Bool)

(assert (=> b!1090844 m!1010465))

(declare-fun m!1010467 () Bool)

(assert (=> b!1090854 m!1010467))

(declare-fun m!1010469 () Bool)

(assert (=> b!1090854 m!1010469))

(declare-fun m!1010471 () Bool)

(assert (=> mapNonEmpty!41833 m!1010471))

(declare-fun m!1010473 () Bool)

(assert (=> b!1090850 m!1010473))

(declare-fun m!1010475 () Bool)

(assert (=> b!1090841 m!1010475))

(declare-fun m!1010477 () Bool)

(assert (=> b!1090842 m!1010477))

(declare-fun m!1010479 () Bool)

(assert (=> b!1090842 m!1010479))

(declare-fun m!1010481 () Bool)

(assert (=> b!1090842 m!1010481))

(declare-fun m!1010483 () Bool)

(assert (=> b!1090847 m!1010483))

(declare-fun m!1010485 () Bool)

(assert (=> b!1090847 m!1010485))

(declare-fun m!1010487 () Bool)

(assert (=> start!96300 m!1010487))

(declare-fun m!1010489 () Bool)

(assert (=> start!96300 m!1010489))

(declare-fun m!1010491 () Bool)

(assert (=> start!96300 m!1010491))

(declare-fun m!1010493 () Bool)

(assert (=> b!1090848 m!1010493))

(declare-fun m!1010495 () Bool)

(assert (=> b!1090849 m!1010495))

(declare-fun m!1010497 () Bool)

(assert (=> b!1090851 m!1010497))

(check-sat (not b!1090851) (not start!96300) (not mapNonEmpty!41833) (not b!1090842) b_and!36121 (not b_lambda!17397) (not b!1090841) (not b!1090844) (not b_next!22717) (not b!1090848) tp_is_empty!26719 (not b!1090854) (not b!1090849) (not b!1090847))
(check-sat b_and!36121 (not b_next!22717))
