; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96198 () Bool)

(assert start!96198)

(declare-fun b_free!22851 () Bool)

(declare-fun b_next!22851 () Bool)

(assert (=> start!96198 (= b_free!22851 (not b_next!22851))))

(declare-fun tp!80402 () Bool)

(declare-fun b_and!36377 () Bool)

(assert (=> start!96198 (= tp!80402 b_and!36377)))

(declare-fun b!1092443 () Bool)

(declare-fun e!623874 () Bool)

(declare-fun tp_is_empty!26853 () Bool)

(assert (=> b!1092443 (= e!623874 tp_is_empty!26853)))

(declare-fun res!728950 () Bool)

(declare-fun e!623876 () Bool)

(assert (=> start!96198 (=> (not res!728950) (not e!623876))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96198 (= res!728950 (validMask!0 mask!1414))))

(assert (=> start!96198 e!623876))

(assert (=> start!96198 tp!80402))

(assert (=> start!96198 true))

(assert (=> start!96198 tp_is_empty!26853))

(declare-datatypes ((array!70625 0))(
  ( (array!70626 (arr!33986 (Array (_ BitVec 32) (_ BitVec 64))) (size!34522 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70625)

(declare-fun array_inv!26202 (array!70625) Bool)

(assert (=> start!96198 (array_inv!26202 _keys!1070)))

(declare-datatypes ((V!40931 0))(
  ( (V!40932 (val!13483 Int)) )
))
(declare-datatypes ((ValueCell!12717 0))(
  ( (ValueCellFull!12717 (v!16104 V!40931)) (EmptyCell!12717) )
))
(declare-datatypes ((array!70627 0))(
  ( (array!70628 (arr!33987 (Array (_ BitVec 32) ValueCell!12717)) (size!34523 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70627)

(declare-fun e!623872 () Bool)

(declare-fun array_inv!26203 (array!70627) Bool)

(assert (=> start!96198 (and (array_inv!26203 _values!874) e!623872)))

(declare-fun b!1092444 () Bool)

(declare-fun e!623873 () Bool)

(assert (=> b!1092444 (= e!623873 tp_is_empty!26853)))

(declare-fun b!1092445 () Bool)

(declare-fun e!623875 () Bool)

(assert (=> b!1092445 (= e!623875 (not true))))

(declare-datatypes ((tuple2!17156 0))(
  ( (tuple2!17157 (_1!8589 (_ BitVec 64)) (_2!8589 V!40931)) )
))
(declare-datatypes ((List!23741 0))(
  ( (Nil!23738) (Cons!23737 (h!24946 tuple2!17156) (t!33650 List!23741)) )
))
(declare-datatypes ((ListLongMap!15125 0))(
  ( (ListLongMap!15126 (toList!7578 List!23741)) )
))
(declare-fun lt!488283 () ListLongMap!15125)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40931)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40931)

(declare-fun getCurrentListMap!4334 (array!70625 array!70627 (_ BitVec 32) (_ BitVec 32) V!40931 V!40931 (_ BitVec 32) Int) ListLongMap!15125)

(assert (=> b!1092445 (= lt!488283 (getCurrentListMap!4334 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488284 () array!70625)

(declare-fun lt!488281 () array!70627)

(declare-fun lt!488286 () ListLongMap!15125)

(assert (=> b!1092445 (= lt!488286 (getCurrentListMap!4334 lt!488284 lt!488281 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488280 () ListLongMap!15125)

(declare-fun lt!488282 () ListLongMap!15125)

(assert (=> b!1092445 (and (= lt!488280 lt!488282) (= lt!488282 lt!488280))))

(declare-fun lt!488287 () ListLongMap!15125)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!897 (ListLongMap!15125 (_ BitVec 64)) ListLongMap!15125)

(assert (=> b!1092445 (= lt!488282 (-!897 lt!488287 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35960 0))(
  ( (Unit!35961) )
))
(declare-fun lt!488285 () Unit!35960)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!153 (array!70625 array!70627 (_ BitVec 32) (_ BitVec 32) V!40931 V!40931 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35960)

(assert (=> b!1092445 (= lt!488285 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!153 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4094 (array!70625 array!70627 (_ BitVec 32) (_ BitVec 32) V!40931 V!40931 (_ BitVec 32) Int) ListLongMap!15125)

(assert (=> b!1092445 (= lt!488280 (getCurrentListMapNoExtraKeys!4094 lt!488284 lt!488281 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2231 (Int (_ BitVec 64)) V!40931)

(assert (=> b!1092445 (= lt!488281 (array!70628 (store (arr!33987 _values!874) i!650 (ValueCellFull!12717 (dynLambda!2231 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34523 _values!874)))))

(assert (=> b!1092445 (= lt!488287 (getCurrentListMapNoExtraKeys!4094 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092445 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488279 () Unit!35960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70625 (_ BitVec 64) (_ BitVec 32)) Unit!35960)

(assert (=> b!1092445 (= lt!488279 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092446 () Bool)

(declare-fun res!728948 () Bool)

(assert (=> b!1092446 (=> (not res!728948) (not e!623876))))

(assert (=> b!1092446 (= res!728948 (= (select (arr!33986 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42034 () Bool)

(declare-fun mapRes!42034 () Bool)

(assert (=> mapIsEmpty!42034 mapRes!42034))

(declare-fun b!1092447 () Bool)

(assert (=> b!1092447 (= e!623872 (and e!623874 mapRes!42034))))

(declare-fun condMapEmpty!42034 () Bool)

(declare-fun mapDefault!42034 () ValueCell!12717)

(assert (=> b!1092447 (= condMapEmpty!42034 (= (arr!33987 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12717)) mapDefault!42034)))))

(declare-fun b!1092448 () Bool)

(declare-fun res!728954 () Bool)

(assert (=> b!1092448 (=> (not res!728954) (not e!623876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70625 (_ BitVec 32)) Bool)

(assert (=> b!1092448 (= res!728954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092449 () Bool)

(assert (=> b!1092449 (= e!623876 e!623875)))

(declare-fun res!728955 () Bool)

(assert (=> b!1092449 (=> (not res!728955) (not e!623875))))

(assert (=> b!1092449 (= res!728955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488284 mask!1414))))

(assert (=> b!1092449 (= lt!488284 (array!70626 (store (arr!33986 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34522 _keys!1070)))))

(declare-fun b!1092450 () Bool)

(declare-fun res!728953 () Bool)

(assert (=> b!1092450 (=> (not res!728953) (not e!623875))))

(declare-datatypes ((List!23742 0))(
  ( (Nil!23739) (Cons!23738 (h!24947 (_ BitVec 64)) (t!33651 List!23742)) )
))
(declare-fun arrayNoDuplicates!0 (array!70625 (_ BitVec 32) List!23742) Bool)

(assert (=> b!1092450 (= res!728953 (arrayNoDuplicates!0 lt!488284 #b00000000000000000000000000000000 Nil!23739))))

(declare-fun b!1092451 () Bool)

(declare-fun res!728947 () Bool)

(assert (=> b!1092451 (=> (not res!728947) (not e!623876))))

(assert (=> b!1092451 (= res!728947 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34522 _keys!1070))))))

(declare-fun mapNonEmpty!42034 () Bool)

(declare-fun tp!80401 () Bool)

(assert (=> mapNonEmpty!42034 (= mapRes!42034 (and tp!80401 e!623873))))

(declare-fun mapValue!42034 () ValueCell!12717)

(declare-fun mapKey!42034 () (_ BitVec 32))

(declare-fun mapRest!42034 () (Array (_ BitVec 32) ValueCell!12717))

(assert (=> mapNonEmpty!42034 (= (arr!33987 _values!874) (store mapRest!42034 mapKey!42034 mapValue!42034))))

(declare-fun b!1092452 () Bool)

(declare-fun res!728951 () Bool)

(assert (=> b!1092452 (=> (not res!728951) (not e!623876))))

(assert (=> b!1092452 (= res!728951 (and (= (size!34523 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34522 _keys!1070) (size!34523 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092453 () Bool)

(declare-fun res!728949 () Bool)

(assert (=> b!1092453 (=> (not res!728949) (not e!623876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092453 (= res!728949 (validKeyInArray!0 k0!904))))

(declare-fun b!1092454 () Bool)

(declare-fun res!728952 () Bool)

(assert (=> b!1092454 (=> (not res!728952) (not e!623876))))

(assert (=> b!1092454 (= res!728952 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23739))))

(assert (= (and start!96198 res!728950) b!1092452))

(assert (= (and b!1092452 res!728951) b!1092448))

(assert (= (and b!1092448 res!728954) b!1092454))

(assert (= (and b!1092454 res!728952) b!1092451))

(assert (= (and b!1092451 res!728947) b!1092453))

(assert (= (and b!1092453 res!728949) b!1092446))

(assert (= (and b!1092446 res!728948) b!1092449))

(assert (= (and b!1092449 res!728955) b!1092450))

(assert (= (and b!1092450 res!728953) b!1092445))

(assert (= (and b!1092447 condMapEmpty!42034) mapIsEmpty!42034))

(assert (= (and b!1092447 (not condMapEmpty!42034)) mapNonEmpty!42034))

(get-info :version)

(assert (= (and mapNonEmpty!42034 ((_ is ValueCellFull!12717) mapValue!42034)) b!1092444))

(assert (= (and b!1092447 ((_ is ValueCellFull!12717) mapDefault!42034)) b!1092443))

(assert (= start!96198 b!1092447))

(declare-fun b_lambda!17521 () Bool)

(assert (=> (not b_lambda!17521) (not b!1092445)))

(declare-fun t!33649 () Bool)

(declare-fun tb!7729 () Bool)

(assert (=> (and start!96198 (= defaultEntry!882 defaultEntry!882) t!33649) tb!7729))

(declare-fun result!15977 () Bool)

(assert (=> tb!7729 (= result!15977 tp_is_empty!26853)))

(assert (=> b!1092445 t!33649))

(declare-fun b_and!36379 () Bool)

(assert (= b_and!36377 (and (=> t!33649 result!15977) b_and!36379)))

(declare-fun m!1012207 () Bool)

(assert (=> b!1092445 m!1012207))

(declare-fun m!1012209 () Bool)

(assert (=> b!1092445 m!1012209))

(declare-fun m!1012211 () Bool)

(assert (=> b!1092445 m!1012211))

(declare-fun m!1012213 () Bool)

(assert (=> b!1092445 m!1012213))

(declare-fun m!1012215 () Bool)

(assert (=> b!1092445 m!1012215))

(declare-fun m!1012217 () Bool)

(assert (=> b!1092445 m!1012217))

(declare-fun m!1012219 () Bool)

(assert (=> b!1092445 m!1012219))

(declare-fun m!1012221 () Bool)

(assert (=> b!1092445 m!1012221))

(declare-fun m!1012223 () Bool)

(assert (=> b!1092445 m!1012223))

(declare-fun m!1012225 () Bool)

(assert (=> b!1092445 m!1012225))

(declare-fun m!1012227 () Bool)

(assert (=> b!1092449 m!1012227))

(declare-fun m!1012229 () Bool)

(assert (=> b!1092449 m!1012229))

(declare-fun m!1012231 () Bool)

(assert (=> b!1092446 m!1012231))

(declare-fun m!1012233 () Bool)

(assert (=> mapNonEmpty!42034 m!1012233))

(declare-fun m!1012235 () Bool)

(assert (=> start!96198 m!1012235))

(declare-fun m!1012237 () Bool)

(assert (=> start!96198 m!1012237))

(declare-fun m!1012239 () Bool)

(assert (=> start!96198 m!1012239))

(declare-fun m!1012241 () Bool)

(assert (=> b!1092450 m!1012241))

(declare-fun m!1012243 () Bool)

(assert (=> b!1092453 m!1012243))

(declare-fun m!1012245 () Bool)

(assert (=> b!1092448 m!1012245))

(declare-fun m!1012247 () Bool)

(assert (=> b!1092454 m!1012247))

(check-sat b_and!36379 (not start!96198) (not b!1092454) (not b!1092448) (not b!1092450) (not b!1092445) (not b_next!22851) (not b!1092449) (not mapNonEmpty!42034) tp_is_empty!26853 (not b!1092453) (not b_lambda!17521))
(check-sat b_and!36379 (not b_next!22851))
