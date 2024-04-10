; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95736 () Bool)

(assert start!95736)

(declare-fun b_free!22389 () Bool)

(declare-fun b_next!22389 () Bool)

(assert (=> start!95736 (= b_free!22389 (not b_next!22389))))

(declare-fun tp!79015 () Bool)

(declare-fun b_and!35453 () Bool)

(assert (=> start!95736 (= tp!79015 b_and!35453)))

(declare-fun b!1082603 () Bool)

(declare-fun e!618678 () Bool)

(declare-fun tp_is_empty!26391 () Bool)

(assert (=> b!1082603 (= e!618678 tp_is_empty!26391)))

(declare-fun b!1082604 () Bool)

(declare-fun res!721654 () Bool)

(declare-fun e!618682 () Bool)

(assert (=> b!1082604 (=> (not res!721654) (not e!618682))))

(declare-datatypes ((array!69729 0))(
  ( (array!69730 (arr!33538 (Array (_ BitVec 32) (_ BitVec 64))) (size!34074 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69729)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69729 (_ BitVec 32)) Bool)

(assert (=> b!1082604 (= res!721654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082605 () Bool)

(declare-fun e!618681 () Bool)

(assert (=> b!1082605 (= e!618682 e!618681)))

(declare-fun res!721655 () Bool)

(assert (=> b!1082605 (=> (not res!721655) (not e!618681))))

(declare-fun lt!479679 () array!69729)

(assert (=> b!1082605 (= res!721655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479679 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082605 (= lt!479679 (array!69730 (store (arr!33538 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34074 _keys!1070)))))

(declare-fun b!1082606 () Bool)

(declare-fun res!721652 () Bool)

(assert (=> b!1082606 (=> (not res!721652) (not e!618682))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1082606 (= res!721652 (= (select (arr!33538 _keys!1070) i!650) k0!904))))

(declare-fun res!721649 () Bool)

(assert (=> start!95736 (=> (not res!721649) (not e!618682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95736 (= res!721649 (validMask!0 mask!1414))))

(assert (=> start!95736 e!618682))

(assert (=> start!95736 tp!79015))

(assert (=> start!95736 true))

(assert (=> start!95736 tp_is_empty!26391))

(declare-fun array_inv!25886 (array!69729) Bool)

(assert (=> start!95736 (array_inv!25886 _keys!1070)))

(declare-datatypes ((V!40315 0))(
  ( (V!40316 (val!13252 Int)) )
))
(declare-datatypes ((ValueCell!12486 0))(
  ( (ValueCellFull!12486 (v!15873 V!40315)) (EmptyCell!12486) )
))
(declare-datatypes ((array!69731 0))(
  ( (array!69732 (arr!33539 (Array (_ BitVec 32) ValueCell!12486)) (size!34075 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69731)

(declare-fun e!618680 () Bool)

(declare-fun array_inv!25887 (array!69731) Bool)

(assert (=> start!95736 (and (array_inv!25887 _values!874) e!618680)))

(declare-fun b!1082607 () Bool)

(assert (=> b!1082607 (= e!618681 (not true))))

(declare-datatypes ((tuple2!16790 0))(
  ( (tuple2!16791 (_1!8406 (_ BitVec 64)) (_2!8406 V!40315)) )
))
(declare-datatypes ((List!23376 0))(
  ( (Nil!23373) (Cons!23372 (h!24581 tuple2!16790) (t!32823 List!23376)) )
))
(declare-datatypes ((ListLongMap!14759 0))(
  ( (ListLongMap!14760 (toList!7395 List!23376)) )
))
(declare-fun lt!479683 () ListLongMap!14759)

(declare-fun lt!479680 () ListLongMap!14759)

(assert (=> b!1082607 (and (= lt!479683 lt!479680) (= lt!479680 lt!479683))))

(declare-fun lt!479681 () ListLongMap!14759)

(declare-fun -!722 (ListLongMap!14759 (_ BitVec 64)) ListLongMap!14759)

(assert (=> b!1082607 (= lt!479680 (-!722 lt!479681 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40315)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35610 0))(
  ( (Unit!35611) )
))
(declare-fun lt!479678 () Unit!35610)

(declare-fun zeroValue!831 () V!40315)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!2 (array!69729 array!69731 (_ BitVec 32) (_ BitVec 32) V!40315 V!40315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35610)

(assert (=> b!1082607 (= lt!479678 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!2 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3943 (array!69729 array!69731 (_ BitVec 32) (_ BitVec 32) V!40315 V!40315 (_ BitVec 32) Int) ListLongMap!14759)

(declare-fun dynLambda!2080 (Int (_ BitVec 64)) V!40315)

(assert (=> b!1082607 (= lt!479683 (getCurrentListMapNoExtraKeys!3943 lt!479679 (array!69732 (store (arr!33539 _values!874) i!650 (ValueCellFull!12486 (dynLambda!2080 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34075 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082607 (= lt!479681 (getCurrentListMapNoExtraKeys!3943 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082607 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479682 () Unit!35610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69729 (_ BitVec 64) (_ BitVec 32)) Unit!35610)

(assert (=> b!1082607 (= lt!479682 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082608 () Bool)

(declare-fun res!721650 () Bool)

(assert (=> b!1082608 (=> (not res!721650) (not e!618682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082608 (= res!721650 (validKeyInArray!0 k0!904))))

(declare-fun b!1082609 () Bool)

(declare-fun res!721648 () Bool)

(assert (=> b!1082609 (=> (not res!721648) (not e!618682))))

(assert (=> b!1082609 (= res!721648 (and (= (size!34075 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34074 _keys!1070) (size!34075 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082610 () Bool)

(declare-fun mapRes!41341 () Bool)

(assert (=> b!1082610 (= e!618680 (and e!618678 mapRes!41341))))

(declare-fun condMapEmpty!41341 () Bool)

(declare-fun mapDefault!41341 () ValueCell!12486)

(assert (=> b!1082610 (= condMapEmpty!41341 (= (arr!33539 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12486)) mapDefault!41341)))))

(declare-fun mapIsEmpty!41341 () Bool)

(assert (=> mapIsEmpty!41341 mapRes!41341))

(declare-fun mapNonEmpty!41341 () Bool)

(declare-fun tp!79016 () Bool)

(declare-fun e!618683 () Bool)

(assert (=> mapNonEmpty!41341 (= mapRes!41341 (and tp!79016 e!618683))))

(declare-fun mapKey!41341 () (_ BitVec 32))

(declare-fun mapValue!41341 () ValueCell!12486)

(declare-fun mapRest!41341 () (Array (_ BitVec 32) ValueCell!12486))

(assert (=> mapNonEmpty!41341 (= (arr!33539 _values!874) (store mapRest!41341 mapKey!41341 mapValue!41341))))

(declare-fun b!1082611 () Bool)

(declare-fun res!721651 () Bool)

(assert (=> b!1082611 (=> (not res!721651) (not e!618682))))

(declare-datatypes ((List!23377 0))(
  ( (Nil!23374) (Cons!23373 (h!24582 (_ BitVec 64)) (t!32824 List!23377)) )
))
(declare-fun arrayNoDuplicates!0 (array!69729 (_ BitVec 32) List!23377) Bool)

(assert (=> b!1082611 (= res!721651 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23374))))

(declare-fun b!1082612 () Bool)

(assert (=> b!1082612 (= e!618683 tp_is_empty!26391)))

(declare-fun b!1082613 () Bool)

(declare-fun res!721656 () Bool)

(assert (=> b!1082613 (=> (not res!721656) (not e!618681))))

(assert (=> b!1082613 (= res!721656 (arrayNoDuplicates!0 lt!479679 #b00000000000000000000000000000000 Nil!23374))))

(declare-fun b!1082614 () Bool)

(declare-fun res!721653 () Bool)

(assert (=> b!1082614 (=> (not res!721653) (not e!618682))))

(assert (=> b!1082614 (= res!721653 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34074 _keys!1070))))))

(assert (= (and start!95736 res!721649) b!1082609))

(assert (= (and b!1082609 res!721648) b!1082604))

(assert (= (and b!1082604 res!721654) b!1082611))

(assert (= (and b!1082611 res!721651) b!1082614))

(assert (= (and b!1082614 res!721653) b!1082608))

(assert (= (and b!1082608 res!721650) b!1082606))

(assert (= (and b!1082606 res!721652) b!1082605))

(assert (= (and b!1082605 res!721655) b!1082613))

(assert (= (and b!1082613 res!721656) b!1082607))

(assert (= (and b!1082610 condMapEmpty!41341) mapIsEmpty!41341))

(assert (= (and b!1082610 (not condMapEmpty!41341)) mapNonEmpty!41341))

(get-info :version)

(assert (= (and mapNonEmpty!41341 ((_ is ValueCellFull!12486) mapValue!41341)) b!1082612))

(assert (= (and b!1082610 ((_ is ValueCellFull!12486) mapDefault!41341)) b!1082603))

(assert (= start!95736 b!1082610))

(declare-fun b_lambda!17059 () Bool)

(assert (=> (not b_lambda!17059) (not b!1082607)))

(declare-fun t!32822 () Bool)

(declare-fun tb!7267 () Bool)

(assert (=> (and start!95736 (= defaultEntry!882 defaultEntry!882) t!32822) tb!7267))

(declare-fun result!15053 () Bool)

(assert (=> tb!7267 (= result!15053 tp_is_empty!26391)))

(assert (=> b!1082607 t!32822))

(declare-fun b_and!35455 () Bool)

(assert (= b_and!35453 (and (=> t!32822 result!15053) b_and!35455)))

(declare-fun m!1000275 () Bool)

(assert (=> mapNonEmpty!41341 m!1000275))

(declare-fun m!1000277 () Bool)

(assert (=> b!1082605 m!1000277))

(declare-fun m!1000279 () Bool)

(assert (=> b!1082605 m!1000279))

(declare-fun m!1000281 () Bool)

(assert (=> b!1082606 m!1000281))

(declare-fun m!1000283 () Bool)

(assert (=> start!95736 m!1000283))

(declare-fun m!1000285 () Bool)

(assert (=> start!95736 m!1000285))

(declare-fun m!1000287 () Bool)

(assert (=> start!95736 m!1000287))

(declare-fun m!1000289 () Bool)

(assert (=> b!1082611 m!1000289))

(declare-fun m!1000291 () Bool)

(assert (=> b!1082607 m!1000291))

(declare-fun m!1000293 () Bool)

(assert (=> b!1082607 m!1000293))

(declare-fun m!1000295 () Bool)

(assert (=> b!1082607 m!1000295))

(declare-fun m!1000297 () Bool)

(assert (=> b!1082607 m!1000297))

(declare-fun m!1000299 () Bool)

(assert (=> b!1082607 m!1000299))

(declare-fun m!1000301 () Bool)

(assert (=> b!1082607 m!1000301))

(declare-fun m!1000303 () Bool)

(assert (=> b!1082607 m!1000303))

(declare-fun m!1000305 () Bool)

(assert (=> b!1082607 m!1000305))

(declare-fun m!1000307 () Bool)

(assert (=> b!1082604 m!1000307))

(declare-fun m!1000309 () Bool)

(assert (=> b!1082613 m!1000309))

(declare-fun m!1000311 () Bool)

(assert (=> b!1082608 m!1000311))

(check-sat (not b!1082605) (not b!1082607) b_and!35455 (not b!1082608) (not b!1082611) (not b_next!22389) (not mapNonEmpty!41341) (not b!1082613) (not b_lambda!17059) (not b!1082604) (not start!95736) tp_is_empty!26391)
(check-sat b_and!35455 (not b_next!22389))
