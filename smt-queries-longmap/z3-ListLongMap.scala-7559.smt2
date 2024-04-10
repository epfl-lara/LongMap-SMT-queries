; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95676 () Bool)

(assert start!95676)

(declare-fun b_free!22329 () Bool)

(declare-fun b_next!22329 () Bool)

(assert (=> start!95676 (= b_free!22329 (not b_next!22329))))

(declare-fun tp!78836 () Bool)

(declare-fun b_and!35333 () Bool)

(assert (=> start!95676 (= tp!78836 b_and!35333)))

(declare-fun b!1081463 () Bool)

(declare-fun e!618140 () Bool)

(assert (=> b!1081463 (= e!618140 (not true))))

(declare-datatypes ((array!69609 0))(
  ( (array!69610 (arr!33478 (Array (_ BitVec 32) (_ BitVec 64))) (size!34014 (_ BitVec 32))) )
))
(declare-fun lt!479311 () array!69609)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40235 0))(
  ( (V!40236 (val!13222 Int)) )
))
(declare-datatypes ((tuple2!16754 0))(
  ( (tuple2!16755 (_1!8388 (_ BitVec 64)) (_2!8388 V!40235)) )
))
(declare-datatypes ((List!23332 0))(
  ( (Nil!23329) (Cons!23328 (h!24537 tuple2!16754) (t!32719 List!23332)) )
))
(declare-datatypes ((ListLongMap!14723 0))(
  ( (ListLongMap!14724 (toList!7377 List!23332)) )
))
(declare-fun lt!479309 () ListLongMap!14723)

(declare-datatypes ((ValueCell!12456 0))(
  ( (ValueCellFull!12456 (v!15843 V!40235)) (EmptyCell!12456) )
))
(declare-datatypes ((array!69611 0))(
  ( (array!69612 (arr!33479 (Array (_ BitVec 32) ValueCell!12456)) (size!34015 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69611)

(declare-fun minValue!831 () V!40235)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40235)

(declare-fun getCurrentListMapNoExtraKeys!3925 (array!69609 array!69611 (_ BitVec 32) (_ BitVec 32) V!40235 V!40235 (_ BitVec 32) Int) ListLongMap!14723)

(declare-fun dynLambda!2062 (Int (_ BitVec 64)) V!40235)

(assert (=> b!1081463 (= lt!479309 (getCurrentListMapNoExtraKeys!3925 lt!479311 (array!69612 (store (arr!33479 _values!874) i!650 (ValueCellFull!12456 (dynLambda!2062 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34015 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479310 () ListLongMap!14723)

(declare-fun _keys!1070 () array!69609)

(assert (=> b!1081463 (= lt!479310 (getCurrentListMapNoExtraKeys!3925 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081463 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35574 0))(
  ( (Unit!35575) )
))
(declare-fun lt!479308 () Unit!35574)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69609 (_ BitVec 64) (_ BitVec 32)) Unit!35574)

(assert (=> b!1081463 (= lt!479308 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081464 () Bool)

(declare-fun res!720840 () Bool)

(declare-fun e!618139 () Bool)

(assert (=> b!1081464 (=> (not res!720840) (not e!618139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69609 (_ BitVec 32)) Bool)

(assert (=> b!1081464 (= res!720840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!720841 () Bool)

(assert (=> start!95676 (=> (not res!720841) (not e!618139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95676 (= res!720841 (validMask!0 mask!1414))))

(assert (=> start!95676 e!618139))

(assert (=> start!95676 tp!78836))

(assert (=> start!95676 true))

(declare-fun tp_is_empty!26331 () Bool)

(assert (=> start!95676 tp_is_empty!26331))

(declare-fun array_inv!25844 (array!69609) Bool)

(assert (=> start!95676 (array_inv!25844 _keys!1070)))

(declare-fun e!618142 () Bool)

(declare-fun array_inv!25845 (array!69611) Bool)

(assert (=> start!95676 (and (array_inv!25845 _values!874) e!618142)))

(declare-fun b!1081465 () Bool)

(declare-fun res!720845 () Bool)

(assert (=> b!1081465 (=> (not res!720845) (not e!618139))))

(assert (=> b!1081465 (= res!720845 (= (select (arr!33478 _keys!1070) i!650) k0!904))))

(declare-fun b!1081466 () Bool)

(declare-fun res!720846 () Bool)

(assert (=> b!1081466 (=> (not res!720846) (not e!618140))))

(declare-datatypes ((List!23333 0))(
  ( (Nil!23330) (Cons!23329 (h!24538 (_ BitVec 64)) (t!32720 List!23333)) )
))
(declare-fun arrayNoDuplicates!0 (array!69609 (_ BitVec 32) List!23333) Bool)

(assert (=> b!1081466 (= res!720846 (arrayNoDuplicates!0 lt!479311 #b00000000000000000000000000000000 Nil!23330))))

(declare-fun mapNonEmpty!41251 () Bool)

(declare-fun mapRes!41251 () Bool)

(declare-fun tp!78835 () Bool)

(declare-fun e!618143 () Bool)

(assert (=> mapNonEmpty!41251 (= mapRes!41251 (and tp!78835 e!618143))))

(declare-fun mapValue!41251 () ValueCell!12456)

(declare-fun mapRest!41251 () (Array (_ BitVec 32) ValueCell!12456))

(declare-fun mapKey!41251 () (_ BitVec 32))

(assert (=> mapNonEmpty!41251 (= (arr!33479 _values!874) (store mapRest!41251 mapKey!41251 mapValue!41251))))

(declare-fun b!1081467 () Bool)

(declare-fun e!618141 () Bool)

(assert (=> b!1081467 (= e!618141 tp_is_empty!26331)))

(declare-fun b!1081468 () Bool)

(declare-fun res!720843 () Bool)

(assert (=> b!1081468 (=> (not res!720843) (not e!618139))))

(assert (=> b!1081468 (= res!720843 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34014 _keys!1070))))))

(declare-fun mapIsEmpty!41251 () Bool)

(assert (=> mapIsEmpty!41251 mapRes!41251))

(declare-fun b!1081469 () Bool)

(assert (=> b!1081469 (= e!618143 tp_is_empty!26331)))

(declare-fun b!1081470 () Bool)

(declare-fun res!720839 () Bool)

(assert (=> b!1081470 (=> (not res!720839) (not e!618139))))

(assert (=> b!1081470 (= res!720839 (and (= (size!34015 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34014 _keys!1070) (size!34015 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081471 () Bool)

(assert (=> b!1081471 (= e!618142 (and e!618141 mapRes!41251))))

(declare-fun condMapEmpty!41251 () Bool)

(declare-fun mapDefault!41251 () ValueCell!12456)

(assert (=> b!1081471 (= condMapEmpty!41251 (= (arr!33479 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12456)) mapDefault!41251)))))

(declare-fun b!1081472 () Bool)

(assert (=> b!1081472 (= e!618139 e!618140)))

(declare-fun res!720838 () Bool)

(assert (=> b!1081472 (=> (not res!720838) (not e!618140))))

(assert (=> b!1081472 (= res!720838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479311 mask!1414))))

(assert (=> b!1081472 (= lt!479311 (array!69610 (store (arr!33478 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34014 _keys!1070)))))

(declare-fun b!1081473 () Bool)

(declare-fun res!720844 () Bool)

(assert (=> b!1081473 (=> (not res!720844) (not e!618139))))

(assert (=> b!1081473 (= res!720844 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23330))))

(declare-fun b!1081474 () Bool)

(declare-fun res!720842 () Bool)

(assert (=> b!1081474 (=> (not res!720842) (not e!618139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081474 (= res!720842 (validKeyInArray!0 k0!904))))

(assert (= (and start!95676 res!720841) b!1081470))

(assert (= (and b!1081470 res!720839) b!1081464))

(assert (= (and b!1081464 res!720840) b!1081473))

(assert (= (and b!1081473 res!720844) b!1081468))

(assert (= (and b!1081468 res!720843) b!1081474))

(assert (= (and b!1081474 res!720842) b!1081465))

(assert (= (and b!1081465 res!720845) b!1081472))

(assert (= (and b!1081472 res!720838) b!1081466))

(assert (= (and b!1081466 res!720846) b!1081463))

(assert (= (and b!1081471 condMapEmpty!41251) mapIsEmpty!41251))

(assert (= (and b!1081471 (not condMapEmpty!41251)) mapNonEmpty!41251))

(get-info :version)

(assert (= (and mapNonEmpty!41251 ((_ is ValueCellFull!12456) mapValue!41251)) b!1081469))

(assert (= (and b!1081471 ((_ is ValueCellFull!12456) mapDefault!41251)) b!1081467))

(assert (= start!95676 b!1081471))

(declare-fun b_lambda!16999 () Bool)

(assert (=> (not b_lambda!16999) (not b!1081463)))

(declare-fun t!32718 () Bool)

(declare-fun tb!7207 () Bool)

(assert (=> (and start!95676 (= defaultEntry!882 defaultEntry!882) t!32718) tb!7207))

(declare-fun result!14933 () Bool)

(assert (=> tb!7207 (= result!14933 tp_is_empty!26331)))

(assert (=> b!1081463 t!32718))

(declare-fun b_and!35335 () Bool)

(assert (= b_and!35333 (and (=> t!32718 result!14933) b_and!35335)))

(declare-fun m!999251 () Bool)

(assert (=> mapNonEmpty!41251 m!999251))

(declare-fun m!999253 () Bool)

(assert (=> start!95676 m!999253))

(declare-fun m!999255 () Bool)

(assert (=> start!95676 m!999255))

(declare-fun m!999257 () Bool)

(assert (=> start!95676 m!999257))

(declare-fun m!999259 () Bool)

(assert (=> b!1081465 m!999259))

(declare-fun m!999261 () Bool)

(assert (=> b!1081466 m!999261))

(declare-fun m!999263 () Bool)

(assert (=> b!1081474 m!999263))

(declare-fun m!999265 () Bool)

(assert (=> b!1081472 m!999265))

(declare-fun m!999267 () Bool)

(assert (=> b!1081472 m!999267))

(declare-fun m!999269 () Bool)

(assert (=> b!1081464 m!999269))

(declare-fun m!999271 () Bool)

(assert (=> b!1081463 m!999271))

(declare-fun m!999273 () Bool)

(assert (=> b!1081463 m!999273))

(declare-fun m!999275 () Bool)

(assert (=> b!1081463 m!999275))

(declare-fun m!999277 () Bool)

(assert (=> b!1081463 m!999277))

(declare-fun m!999279 () Bool)

(assert (=> b!1081463 m!999279))

(declare-fun m!999281 () Bool)

(assert (=> b!1081463 m!999281))

(declare-fun m!999283 () Bool)

(assert (=> b!1081473 m!999283))

(check-sat (not b!1081474) (not b!1081463) tp_is_empty!26331 b_and!35335 (not b_next!22329) (not b_lambda!16999) (not b!1081472) (not b!1081466) (not mapNonEmpty!41251) (not start!95676) (not b!1081464) (not b!1081473))
(check-sat b_and!35335 (not b_next!22329))
