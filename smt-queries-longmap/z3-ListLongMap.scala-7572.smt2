; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95988 () Bool)

(assert start!95988)

(declare-fun b_free!22405 () Bool)

(declare-fun b_next!22405 () Bool)

(assert (=> start!95988 (= b_free!22405 (not b_next!22405))))

(declare-fun tp!79063 () Bool)

(declare-fun b_and!35495 () Bool)

(assert (=> start!95988 (= tp!79063 b_and!35495)))

(declare-fun b!1084234 () Bool)

(declare-fun e!619678 () Bool)

(declare-fun e!619679 () Bool)

(declare-fun mapRes!41365 () Bool)

(assert (=> b!1084234 (= e!619678 (and e!619679 mapRes!41365))))

(declare-fun condMapEmpty!41365 () Bool)

(declare-datatypes ((V!40337 0))(
  ( (V!40338 (val!13260 Int)) )
))
(declare-datatypes ((ValueCell!12494 0))(
  ( (ValueCellFull!12494 (v!15877 V!40337)) (EmptyCell!12494) )
))
(declare-datatypes ((array!69797 0))(
  ( (array!69798 (arr!33566 (Array (_ BitVec 32) ValueCell!12494)) (size!34103 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69797)

(declare-fun mapDefault!41365 () ValueCell!12494)

(assert (=> b!1084234 (= condMapEmpty!41365 (= (arr!33566 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12494)) mapDefault!41365)))))

(declare-fun b!1084235 () Bool)

(declare-fun res!722390 () Bool)

(declare-fun e!619680 () Bool)

(assert (=> b!1084235 (=> (not res!722390) (not e!619680))))

(declare-datatypes ((array!69799 0))(
  ( (array!69800 (arr!33567 (Array (_ BitVec 32) (_ BitVec 64))) (size!34104 (_ BitVec 32))) )
))
(declare-fun lt!480339 () array!69799)

(declare-datatypes ((List!23398 0))(
  ( (Nil!23395) (Cons!23394 (h!24612 (_ BitVec 64)) (t!32853 List!23398)) )
))
(declare-fun arrayNoDuplicates!0 (array!69799 (_ BitVec 32) List!23398) Bool)

(assert (=> b!1084235 (= res!722390 (arrayNoDuplicates!0 lt!480339 #b00000000000000000000000000000000 Nil!23395))))

(declare-fun mapNonEmpty!41365 () Bool)

(declare-fun tp!79064 () Bool)

(declare-fun e!619682 () Bool)

(assert (=> mapNonEmpty!41365 (= mapRes!41365 (and tp!79064 e!619682))))

(declare-fun mapRest!41365 () (Array (_ BitVec 32) ValueCell!12494))

(declare-fun mapValue!41365 () ValueCell!12494)

(declare-fun mapKey!41365 () (_ BitVec 32))

(assert (=> mapNonEmpty!41365 (= (arr!33566 _values!874) (store mapRest!41365 mapKey!41365 mapValue!41365))))

(declare-fun b!1084236 () Bool)

(declare-fun res!722388 () Bool)

(declare-fun e!619681 () Bool)

(assert (=> b!1084236 (=> (not res!722388) (not e!619681))))

(declare-fun _keys!1070 () array!69799)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69799 (_ BitVec 32)) Bool)

(assert (=> b!1084236 (= res!722388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084238 () Bool)

(declare-fun res!722387 () Bool)

(assert (=> b!1084238 (=> (not res!722387) (not e!619681))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084238 (= res!722387 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34104 _keys!1070))))))

(declare-fun b!1084239 () Bool)

(declare-fun res!722389 () Bool)

(assert (=> b!1084239 (=> (not res!722389) (not e!619681))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084239 (= res!722389 (validKeyInArray!0 k0!904))))

(declare-fun b!1084240 () Bool)

(declare-fun res!722394 () Bool)

(assert (=> b!1084240 (=> (not res!722394) (not e!619681))))

(assert (=> b!1084240 (= res!722394 (= (select (arr!33567 _keys!1070) i!650) k0!904))))

(declare-fun b!1084241 () Bool)

(declare-fun tp_is_empty!26407 () Bool)

(assert (=> b!1084241 (= e!619682 tp_is_empty!26407)))

(declare-fun mapIsEmpty!41365 () Bool)

(assert (=> mapIsEmpty!41365 mapRes!41365))

(declare-fun b!1084242 () Bool)

(assert (=> b!1084242 (= e!619680 (not true))))

(declare-datatypes ((tuple2!16804 0))(
  ( (tuple2!16805 (_1!8413 (_ BitVec 64)) (_2!8413 V!40337)) )
))
(declare-datatypes ((List!23399 0))(
  ( (Nil!23396) (Cons!23395 (h!24613 tuple2!16804) (t!32854 List!23399)) )
))
(declare-datatypes ((ListLongMap!14781 0))(
  ( (ListLongMap!14782 (toList!7406 List!23399)) )
))
(declare-fun lt!480341 () ListLongMap!14781)

(declare-fun lt!480338 () ListLongMap!14781)

(assert (=> b!1084242 (and (= lt!480341 lt!480338) (= lt!480338 lt!480341))))

(declare-fun lt!480340 () ListLongMap!14781)

(declare-fun -!718 (ListLongMap!14781 (_ BitVec 64)) ListLongMap!14781)

(assert (=> b!1084242 (= lt!480338 (-!718 lt!480340 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40337)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40337)

(declare-datatypes ((Unit!35603 0))(
  ( (Unit!35604) )
))
(declare-fun lt!480337 () Unit!35603)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!7 (array!69799 array!69797 (_ BitVec 32) (_ BitVec 32) V!40337 V!40337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35603)

(assert (=> b!1084242 (= lt!480337 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!7 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3983 (array!69799 array!69797 (_ BitVec 32) (_ BitVec 32) V!40337 V!40337 (_ BitVec 32) Int) ListLongMap!14781)

(declare-fun dynLambda!2104 (Int (_ BitVec 64)) V!40337)

(assert (=> b!1084242 (= lt!480341 (getCurrentListMapNoExtraKeys!3983 lt!480339 (array!69798 (store (arr!33566 _values!874) i!650 (ValueCellFull!12494 (dynLambda!2104 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34103 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084242 (= lt!480340 (getCurrentListMapNoExtraKeys!3983 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084242 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480342 () Unit!35603)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69799 (_ BitVec 64) (_ BitVec 32)) Unit!35603)

(assert (=> b!1084242 (= lt!480342 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084243 () Bool)

(declare-fun res!722386 () Bool)

(assert (=> b!1084243 (=> (not res!722386) (not e!619681))))

(assert (=> b!1084243 (= res!722386 (and (= (size!34103 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34104 _keys!1070) (size!34103 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084237 () Bool)

(assert (=> b!1084237 (= e!619681 e!619680)))

(declare-fun res!722392 () Bool)

(assert (=> b!1084237 (=> (not res!722392) (not e!619680))))

(assert (=> b!1084237 (= res!722392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480339 mask!1414))))

(assert (=> b!1084237 (= lt!480339 (array!69800 (store (arr!33567 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34104 _keys!1070)))))

(declare-fun res!722391 () Bool)

(assert (=> start!95988 (=> (not res!722391) (not e!619681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95988 (= res!722391 (validMask!0 mask!1414))))

(assert (=> start!95988 e!619681))

(assert (=> start!95988 tp!79063))

(assert (=> start!95988 true))

(assert (=> start!95988 tp_is_empty!26407))

(declare-fun array_inv!25956 (array!69799) Bool)

(assert (=> start!95988 (array_inv!25956 _keys!1070)))

(declare-fun array_inv!25957 (array!69797) Bool)

(assert (=> start!95988 (and (array_inv!25957 _values!874) e!619678)))

(declare-fun b!1084244 () Bool)

(declare-fun res!722393 () Bool)

(assert (=> b!1084244 (=> (not res!722393) (not e!619681))))

(assert (=> b!1084244 (= res!722393 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23395))))

(declare-fun b!1084245 () Bool)

(assert (=> b!1084245 (= e!619679 tp_is_empty!26407)))

(assert (= (and start!95988 res!722391) b!1084243))

(assert (= (and b!1084243 res!722386) b!1084236))

(assert (= (and b!1084236 res!722388) b!1084244))

(assert (= (and b!1084244 res!722393) b!1084238))

(assert (= (and b!1084238 res!722387) b!1084239))

(assert (= (and b!1084239 res!722389) b!1084240))

(assert (= (and b!1084240 res!722394) b!1084237))

(assert (= (and b!1084237 res!722392) b!1084235))

(assert (= (and b!1084235 res!722390) b!1084242))

(assert (= (and b!1084234 condMapEmpty!41365) mapIsEmpty!41365))

(assert (= (and b!1084234 (not condMapEmpty!41365)) mapNonEmpty!41365))

(get-info :version)

(assert (= (and mapNonEmpty!41365 ((_ is ValueCellFull!12494) mapValue!41365)) b!1084241))

(assert (= (and b!1084234 ((_ is ValueCellFull!12494) mapDefault!41365)) b!1084245))

(assert (= start!95988 b!1084234))

(declare-fun b_lambda!17085 () Bool)

(assert (=> (not b_lambda!17085) (not b!1084242)))

(declare-fun t!32852 () Bool)

(declare-fun tb!7275 () Bool)

(assert (=> (and start!95988 (= defaultEntry!882 defaultEntry!882) t!32852) tb!7275))

(declare-fun result!15077 () Bool)

(assert (=> tb!7275 (= result!15077 tp_is_empty!26407)))

(assert (=> b!1084242 t!32852))

(declare-fun b_and!35497 () Bool)

(assert (= b_and!35495 (and (=> t!32852 result!15077) b_and!35497)))

(declare-fun m!1002251 () Bool)

(assert (=> b!1084235 m!1002251))

(declare-fun m!1002253 () Bool)

(assert (=> b!1084242 m!1002253))

(declare-fun m!1002255 () Bool)

(assert (=> b!1084242 m!1002255))

(declare-fun m!1002257 () Bool)

(assert (=> b!1084242 m!1002257))

(declare-fun m!1002259 () Bool)

(assert (=> b!1084242 m!1002259))

(declare-fun m!1002261 () Bool)

(assert (=> b!1084242 m!1002261))

(declare-fun m!1002263 () Bool)

(assert (=> b!1084242 m!1002263))

(declare-fun m!1002265 () Bool)

(assert (=> b!1084242 m!1002265))

(declare-fun m!1002267 () Bool)

(assert (=> b!1084242 m!1002267))

(declare-fun m!1002269 () Bool)

(assert (=> mapNonEmpty!41365 m!1002269))

(declare-fun m!1002271 () Bool)

(assert (=> start!95988 m!1002271))

(declare-fun m!1002273 () Bool)

(assert (=> start!95988 m!1002273))

(declare-fun m!1002275 () Bool)

(assert (=> start!95988 m!1002275))

(declare-fun m!1002277 () Bool)

(assert (=> b!1084244 m!1002277))

(declare-fun m!1002279 () Bool)

(assert (=> b!1084240 m!1002279))

(declare-fun m!1002281 () Bool)

(assert (=> b!1084236 m!1002281))

(declare-fun m!1002283 () Bool)

(assert (=> b!1084239 m!1002283))

(declare-fun m!1002285 () Bool)

(assert (=> b!1084237 m!1002285))

(declare-fun m!1002287 () Bool)

(assert (=> b!1084237 m!1002287))

(check-sat (not b!1084239) (not start!95988) (not mapNonEmpty!41365) b_and!35497 (not b!1084236) (not b_next!22405) (not b_lambda!17085) (not b!1084235) (not b!1084242) tp_is_empty!26407 (not b!1084237) (not b!1084244))
(check-sat b_and!35497 (not b_next!22405))
