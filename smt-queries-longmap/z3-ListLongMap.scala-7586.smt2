; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95838 () Bool)

(assert start!95838)

(declare-fun b_free!22491 () Bool)

(declare-fun b_next!22491 () Bool)

(assert (=> start!95838 (= b_free!22491 (not b_next!22491))))

(declare-fun tp!79322 () Bool)

(declare-fun b_and!35657 () Bool)

(assert (=> start!95838 (= tp!79322 b_and!35657)))

(declare-fun mapNonEmpty!41494 () Bool)

(declare-fun mapRes!41494 () Bool)

(declare-fun tp!79321 () Bool)

(declare-fun e!619597 () Bool)

(assert (=> mapNonEmpty!41494 (= mapRes!41494 (and tp!79321 e!619597))))

(declare-datatypes ((V!40451 0))(
  ( (V!40452 (val!13303 Int)) )
))
(declare-datatypes ((ValueCell!12537 0))(
  ( (ValueCellFull!12537 (v!15924 V!40451)) (EmptyCell!12537) )
))
(declare-fun mapValue!41494 () ValueCell!12537)

(declare-fun mapRest!41494 () (Array (_ BitVec 32) ValueCell!12537))

(declare-datatypes ((array!69923 0))(
  ( (array!69924 (arr!33635 (Array (_ BitVec 32) ValueCell!12537)) (size!34171 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69923)

(declare-fun mapKey!41494 () (_ BitVec 32))

(assert (=> mapNonEmpty!41494 (= (arr!33635 _values!874) (store mapRest!41494 mapKey!41494 mapValue!41494))))

(declare-fun b!1084541 () Bool)

(declare-fun e!619601 () Bool)

(declare-datatypes ((array!69925 0))(
  ( (array!69926 (arr!33636 (Array (_ BitVec 32) (_ BitVec 64))) (size!34172 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69925)

(assert (=> b!1084541 (= e!619601 (not (bvsle #b00000000000000000000000000000000 (size!34172 _keys!1070))))))

(declare-fun minValue!831 () V!40451)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16862 0))(
  ( (tuple2!16863 (_1!8442 (_ BitVec 64)) (_2!8442 V!40451)) )
))
(declare-datatypes ((List!23450 0))(
  ( (Nil!23447) (Cons!23446 (h!24655 tuple2!16862) (t!32999 List!23450)) )
))
(declare-datatypes ((ListLongMap!14831 0))(
  ( (ListLongMap!14832 (toList!7431 List!23450)) )
))
(declare-fun lt!480755 () ListLongMap!14831)

(declare-fun lt!480757 () array!69923)

(declare-fun zeroValue!831 () V!40451)

(declare-fun lt!480750 () array!69925)

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun getCurrentListMap!4219 (array!69925 array!69923 (_ BitVec 32) (_ BitVec 32) V!40451 V!40451 (_ BitVec 32) Int) ListLongMap!14831)

(assert (=> b!1084541 (= lt!480755 (getCurrentListMap!4219 lt!480750 lt!480757 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480752 () ListLongMap!14831)

(declare-fun lt!480753 () ListLongMap!14831)

(assert (=> b!1084541 (and (= lt!480752 lt!480753) (= lt!480753 lt!480752))))

(declare-fun lt!480754 () ListLongMap!14831)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!758 (ListLongMap!14831 (_ BitVec 64)) ListLongMap!14831)

(assert (=> b!1084541 (= lt!480753 (-!758 lt!480754 k0!904))))

(declare-datatypes ((Unit!35682 0))(
  ( (Unit!35683) )
))
(declare-fun lt!480756 () Unit!35682)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!38 (array!69925 array!69923 (_ BitVec 32) (_ BitVec 32) V!40451 V!40451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35682)

(assert (=> b!1084541 (= lt!480756 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!38 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3979 (array!69925 array!69923 (_ BitVec 32) (_ BitVec 32) V!40451 V!40451 (_ BitVec 32) Int) ListLongMap!14831)

(assert (=> b!1084541 (= lt!480752 (getCurrentListMapNoExtraKeys!3979 lt!480750 lt!480757 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2116 (Int (_ BitVec 64)) V!40451)

(assert (=> b!1084541 (= lt!480757 (array!69924 (store (arr!33635 _values!874) i!650 (ValueCellFull!12537 (dynLambda!2116 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34171 _values!874)))))

(assert (=> b!1084541 (= lt!480754 (getCurrentListMapNoExtraKeys!3979 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084541 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480751 () Unit!35682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69925 (_ BitVec 64) (_ BitVec 32)) Unit!35682)

(assert (=> b!1084541 (= lt!480751 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084542 () Bool)

(declare-fun tp_is_empty!26493 () Bool)

(assert (=> b!1084542 (= e!619597 tp_is_empty!26493)))

(declare-fun b!1084543 () Bool)

(declare-fun res!723028 () Bool)

(declare-fun e!619596 () Bool)

(assert (=> b!1084543 (=> (not res!723028) (not e!619596))))

(assert (=> b!1084543 (= res!723028 (= (select (arr!33636 _keys!1070) i!650) k0!904))))

(declare-fun b!1084544 () Bool)

(declare-fun res!723027 () Bool)

(assert (=> b!1084544 (=> (not res!723027) (not e!619596))))

(assert (=> b!1084544 (= res!723027 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34172 _keys!1070))))))

(declare-fun b!1084545 () Bool)

(declare-fun res!723032 () Bool)

(assert (=> b!1084545 (=> (not res!723032) (not e!619596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69925 (_ BitVec 32)) Bool)

(assert (=> b!1084545 (= res!723032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!723033 () Bool)

(assert (=> start!95838 (=> (not res!723033) (not e!619596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95838 (= res!723033 (validMask!0 mask!1414))))

(assert (=> start!95838 e!619596))

(assert (=> start!95838 tp!79322))

(assert (=> start!95838 true))

(assert (=> start!95838 tp_is_empty!26493))

(declare-fun array_inv!25958 (array!69925) Bool)

(assert (=> start!95838 (array_inv!25958 _keys!1070)))

(declare-fun e!619598 () Bool)

(declare-fun array_inv!25959 (array!69923) Bool)

(assert (=> start!95838 (and (array_inv!25959 _values!874) e!619598)))

(declare-fun b!1084546 () Bool)

(declare-fun res!723031 () Bool)

(assert (=> b!1084546 (=> (not res!723031) (not e!619596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084546 (= res!723031 (validKeyInArray!0 k0!904))))

(declare-fun b!1084547 () Bool)

(declare-fun res!723025 () Bool)

(assert (=> b!1084547 (=> (not res!723025) (not e!619596))))

(declare-datatypes ((List!23451 0))(
  ( (Nil!23448) (Cons!23447 (h!24656 (_ BitVec 64)) (t!33000 List!23451)) )
))
(declare-fun arrayNoDuplicates!0 (array!69925 (_ BitVec 32) List!23451) Bool)

(assert (=> b!1084547 (= res!723025 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23448))))

(declare-fun b!1084548 () Bool)

(declare-fun e!619600 () Bool)

(assert (=> b!1084548 (= e!619598 (and e!619600 mapRes!41494))))

(declare-fun condMapEmpty!41494 () Bool)

(declare-fun mapDefault!41494 () ValueCell!12537)

(assert (=> b!1084548 (= condMapEmpty!41494 (= (arr!33635 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12537)) mapDefault!41494)))))

(declare-fun b!1084549 () Bool)

(declare-fun res!723030 () Bool)

(assert (=> b!1084549 (=> (not res!723030) (not e!619601))))

(assert (=> b!1084549 (= res!723030 (arrayNoDuplicates!0 lt!480750 #b00000000000000000000000000000000 Nil!23448))))

(declare-fun b!1084550 () Bool)

(declare-fun res!723029 () Bool)

(assert (=> b!1084550 (=> (not res!723029) (not e!619596))))

(assert (=> b!1084550 (= res!723029 (and (= (size!34171 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34172 _keys!1070) (size!34171 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084551 () Bool)

(assert (=> b!1084551 (= e!619600 tp_is_empty!26493)))

(declare-fun b!1084552 () Bool)

(assert (=> b!1084552 (= e!619596 e!619601)))

(declare-fun res!723026 () Bool)

(assert (=> b!1084552 (=> (not res!723026) (not e!619601))))

(assert (=> b!1084552 (= res!723026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480750 mask!1414))))

(assert (=> b!1084552 (= lt!480750 (array!69926 (store (arr!33636 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34172 _keys!1070)))))

(declare-fun mapIsEmpty!41494 () Bool)

(assert (=> mapIsEmpty!41494 mapRes!41494))

(assert (= (and start!95838 res!723033) b!1084550))

(assert (= (and b!1084550 res!723029) b!1084545))

(assert (= (and b!1084545 res!723032) b!1084547))

(assert (= (and b!1084547 res!723025) b!1084544))

(assert (= (and b!1084544 res!723027) b!1084546))

(assert (= (and b!1084546 res!723031) b!1084543))

(assert (= (and b!1084543 res!723028) b!1084552))

(assert (= (and b!1084552 res!723026) b!1084549))

(assert (= (and b!1084549 res!723030) b!1084541))

(assert (= (and b!1084548 condMapEmpty!41494) mapIsEmpty!41494))

(assert (= (and b!1084548 (not condMapEmpty!41494)) mapNonEmpty!41494))

(get-info :version)

(assert (= (and mapNonEmpty!41494 ((_ is ValueCellFull!12537) mapValue!41494)) b!1084542))

(assert (= (and b!1084548 ((_ is ValueCellFull!12537) mapDefault!41494)) b!1084551))

(assert (= start!95838 b!1084548))

(declare-fun b_lambda!17161 () Bool)

(assert (=> (not b_lambda!17161) (not b!1084541)))

(declare-fun t!32998 () Bool)

(declare-fun tb!7369 () Bool)

(assert (=> (and start!95838 (= defaultEntry!882 defaultEntry!882) t!32998) tb!7369))

(declare-fun result!15257 () Bool)

(assert (=> tb!7369 (= result!15257 tp_is_empty!26493)))

(assert (=> b!1084541 t!32998))

(declare-fun b_and!35659 () Bool)

(assert (= b_and!35657 (and (=> t!32998 result!15257) b_and!35659)))

(declare-fun m!1002263 () Bool)

(assert (=> b!1084545 m!1002263))

(declare-fun m!1002265 () Bool)

(assert (=> mapNonEmpty!41494 m!1002265))

(declare-fun m!1002267 () Bool)

(assert (=> b!1084549 m!1002267))

(declare-fun m!1002269 () Bool)

(assert (=> b!1084546 m!1002269))

(declare-fun m!1002271 () Bool)

(assert (=> b!1084552 m!1002271))

(declare-fun m!1002273 () Bool)

(assert (=> b!1084552 m!1002273))

(declare-fun m!1002275 () Bool)

(assert (=> b!1084541 m!1002275))

(declare-fun m!1002277 () Bool)

(assert (=> b!1084541 m!1002277))

(declare-fun m!1002279 () Bool)

(assert (=> b!1084541 m!1002279))

(declare-fun m!1002281 () Bool)

(assert (=> b!1084541 m!1002281))

(declare-fun m!1002283 () Bool)

(assert (=> b!1084541 m!1002283))

(declare-fun m!1002285 () Bool)

(assert (=> b!1084541 m!1002285))

(declare-fun m!1002287 () Bool)

(assert (=> b!1084541 m!1002287))

(declare-fun m!1002289 () Bool)

(assert (=> b!1084541 m!1002289))

(declare-fun m!1002291 () Bool)

(assert (=> b!1084541 m!1002291))

(declare-fun m!1002293 () Bool)

(assert (=> b!1084543 m!1002293))

(declare-fun m!1002295 () Bool)

(assert (=> b!1084547 m!1002295))

(declare-fun m!1002297 () Bool)

(assert (=> start!95838 m!1002297))

(declare-fun m!1002299 () Bool)

(assert (=> start!95838 m!1002299))

(declare-fun m!1002301 () Bool)

(assert (=> start!95838 m!1002301))

(check-sat (not b!1084552) (not b_lambda!17161) b_and!35659 (not b!1084545) (not b!1084549) (not b!1084541) (not b_next!22491) (not mapNonEmpty!41494) (not start!95838) (not b!1084547) tp_is_empty!26493 (not b!1084546))
(check-sat b_and!35659 (not b_next!22491))
