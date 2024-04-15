; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95668 () Bool)

(assert start!95668)

(declare-fun b_free!22327 () Bool)

(declare-fun b_next!22327 () Bool)

(assert (=> start!95668 (= b_free!22327 (not b_next!22327))))

(declare-fun tp!78829 () Bool)

(declare-fun b_and!35303 () Bool)

(assert (=> start!95668 (= tp!78829 b_and!35303)))

(declare-fun res!720742 () Bool)

(declare-fun e!618032 () Bool)

(assert (=> start!95668 (=> (not res!720742) (not e!618032))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95668 (= res!720742 (validMask!0 mask!1414))))

(assert (=> start!95668 e!618032))

(assert (=> start!95668 tp!78829))

(assert (=> start!95668 true))

(declare-fun tp_is_empty!26329 () Bool)

(assert (=> start!95668 tp_is_empty!26329))

(declare-datatypes ((array!69538 0))(
  ( (array!69539 (arr!33443 (Array (_ BitVec 32) (_ BitVec 64))) (size!33981 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69538)

(declare-fun array_inv!25854 (array!69538) Bool)

(assert (=> start!95668 (array_inv!25854 _keys!1070)))

(declare-datatypes ((V!40233 0))(
  ( (V!40234 (val!13221 Int)) )
))
(declare-datatypes ((ValueCell!12455 0))(
  ( (ValueCellFull!12455 (v!15841 V!40233)) (EmptyCell!12455) )
))
(declare-datatypes ((array!69540 0))(
  ( (array!69541 (arr!33444 (Array (_ BitVec 32) ValueCell!12455)) (size!33982 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69540)

(declare-fun e!618031 () Bool)

(declare-fun array_inv!25855 (array!69540) Bool)

(assert (=> start!95668 (and (array_inv!25855 _values!874) e!618031)))

(declare-fun b!1081272 () Bool)

(declare-fun res!720743 () Bool)

(assert (=> b!1081272 (=> (not res!720743) (not e!618032))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081272 (= res!720743 (and (= (size!33982 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33981 _keys!1070) (size!33982 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081273 () Bool)

(declare-fun res!720744 () Bool)

(assert (=> b!1081273 (=> (not res!720744) (not e!618032))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081273 (= res!720744 (validKeyInArray!0 k0!904))))

(declare-fun b!1081274 () Bool)

(declare-fun res!720745 () Bool)

(assert (=> b!1081274 (=> (not res!720745) (not e!618032))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081274 (= res!720745 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33981 _keys!1070))))))

(declare-fun b!1081275 () Bool)

(declare-fun e!618028 () Bool)

(assert (=> b!1081275 (= e!618028 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40233)

(declare-datatypes ((tuple2!16814 0))(
  ( (tuple2!16815 (_1!8418 (_ BitVec 64)) (_2!8418 V!40233)) )
))
(declare-datatypes ((List!23377 0))(
  ( (Nil!23374) (Cons!23373 (h!24582 tuple2!16814) (t!32753 List!23377)) )
))
(declare-datatypes ((ListLongMap!14783 0))(
  ( (ListLongMap!14784 (toList!7407 List!23377)) )
))
(declare-fun lt!479099 () ListLongMap!14783)

(declare-fun zeroValue!831 () V!40233)

(declare-fun lt!479098 () array!69538)

(declare-fun getCurrentListMapNoExtraKeys!3970 (array!69538 array!69540 (_ BitVec 32) (_ BitVec 32) V!40233 V!40233 (_ BitVec 32) Int) ListLongMap!14783)

(declare-fun dynLambda!2041 (Int (_ BitVec 64)) V!40233)

(assert (=> b!1081275 (= lt!479099 (getCurrentListMapNoExtraKeys!3970 lt!479098 (array!69541 (store (arr!33444 _values!874) i!650 (ValueCellFull!12455 (dynLambda!2041 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33982 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479097 () ListLongMap!14783)

(assert (=> b!1081275 (= lt!479097 (getCurrentListMapNoExtraKeys!3970 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081275 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35407 0))(
  ( (Unit!35408) )
))
(declare-fun lt!479096 () Unit!35407)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69538 (_ BitVec 64) (_ BitVec 32)) Unit!35407)

(assert (=> b!1081275 (= lt!479096 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081276 () Bool)

(declare-fun e!618027 () Bool)

(assert (=> b!1081276 (= e!618027 tp_is_empty!26329)))

(declare-fun b!1081277 () Bool)

(declare-fun res!720749 () Bool)

(assert (=> b!1081277 (=> (not res!720749) (not e!618032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69538 (_ BitVec 32)) Bool)

(assert (=> b!1081277 (= res!720749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081278 () Bool)

(assert (=> b!1081278 (= e!618032 e!618028)))

(declare-fun res!720746 () Bool)

(assert (=> b!1081278 (=> (not res!720746) (not e!618028))))

(assert (=> b!1081278 (= res!720746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479098 mask!1414))))

(assert (=> b!1081278 (= lt!479098 (array!69539 (store (arr!33443 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33981 _keys!1070)))))

(declare-fun b!1081279 () Bool)

(declare-fun mapRes!41248 () Bool)

(assert (=> b!1081279 (= e!618031 (and e!618027 mapRes!41248))))

(declare-fun condMapEmpty!41248 () Bool)

(declare-fun mapDefault!41248 () ValueCell!12455)

(assert (=> b!1081279 (= condMapEmpty!41248 (= (arr!33444 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12455)) mapDefault!41248)))))

(declare-fun mapNonEmpty!41248 () Bool)

(declare-fun tp!78830 () Bool)

(declare-fun e!618030 () Bool)

(assert (=> mapNonEmpty!41248 (= mapRes!41248 (and tp!78830 e!618030))))

(declare-fun mapKey!41248 () (_ BitVec 32))

(declare-fun mapValue!41248 () ValueCell!12455)

(declare-fun mapRest!41248 () (Array (_ BitVec 32) ValueCell!12455))

(assert (=> mapNonEmpty!41248 (= (arr!33444 _values!874) (store mapRest!41248 mapKey!41248 mapValue!41248))))

(declare-fun b!1081280 () Bool)

(declare-fun res!720747 () Bool)

(assert (=> b!1081280 (=> (not res!720747) (not e!618032))))

(assert (=> b!1081280 (= res!720747 (= (select (arr!33443 _keys!1070) i!650) k0!904))))

(declare-fun b!1081281 () Bool)

(assert (=> b!1081281 (= e!618030 tp_is_empty!26329)))

(declare-fun b!1081282 () Bool)

(declare-fun res!720750 () Bool)

(assert (=> b!1081282 (=> (not res!720750) (not e!618028))))

(declare-datatypes ((List!23378 0))(
  ( (Nil!23375) (Cons!23374 (h!24583 (_ BitVec 64)) (t!32754 List!23378)) )
))
(declare-fun arrayNoDuplicates!0 (array!69538 (_ BitVec 32) List!23378) Bool)

(assert (=> b!1081282 (= res!720750 (arrayNoDuplicates!0 lt!479098 #b00000000000000000000000000000000 Nil!23375))))

(declare-fun b!1081283 () Bool)

(declare-fun res!720748 () Bool)

(assert (=> b!1081283 (=> (not res!720748) (not e!618032))))

(assert (=> b!1081283 (= res!720748 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23375))))

(declare-fun mapIsEmpty!41248 () Bool)

(assert (=> mapIsEmpty!41248 mapRes!41248))

(assert (= (and start!95668 res!720742) b!1081272))

(assert (= (and b!1081272 res!720743) b!1081277))

(assert (= (and b!1081277 res!720749) b!1081283))

(assert (= (and b!1081283 res!720748) b!1081274))

(assert (= (and b!1081274 res!720745) b!1081273))

(assert (= (and b!1081273 res!720744) b!1081280))

(assert (= (and b!1081280 res!720747) b!1081278))

(assert (= (and b!1081278 res!720746) b!1081282))

(assert (= (and b!1081282 res!720750) b!1081275))

(assert (= (and b!1081279 condMapEmpty!41248) mapIsEmpty!41248))

(assert (= (and b!1081279 (not condMapEmpty!41248)) mapNonEmpty!41248))

(get-info :version)

(assert (= (and mapNonEmpty!41248 ((_ is ValueCellFull!12455) mapValue!41248)) b!1081281))

(assert (= (and b!1081279 ((_ is ValueCellFull!12455) mapDefault!41248)) b!1081276))

(assert (= start!95668 b!1081279))

(declare-fun b_lambda!16975 () Bool)

(assert (=> (not b_lambda!16975) (not b!1081275)))

(declare-fun t!32752 () Bool)

(declare-fun tb!7197 () Bool)

(assert (=> (and start!95668 (= defaultEntry!882 defaultEntry!882) t!32752) tb!7197))

(declare-fun result!14921 () Bool)

(assert (=> tb!7197 (= result!14921 tp_is_empty!26329)))

(assert (=> b!1081275 t!32752))

(declare-fun b_and!35305 () Bool)

(assert (= b_and!35303 (and (=> t!32752 result!14921) b_and!35305)))

(declare-fun m!998591 () Bool)

(assert (=> mapNonEmpty!41248 m!998591))

(declare-fun m!998593 () Bool)

(assert (=> b!1081280 m!998593))

(declare-fun m!998595 () Bool)

(assert (=> b!1081277 m!998595))

(declare-fun m!998597 () Bool)

(assert (=> b!1081278 m!998597))

(declare-fun m!998599 () Bool)

(assert (=> b!1081278 m!998599))

(declare-fun m!998601 () Bool)

(assert (=> b!1081275 m!998601))

(declare-fun m!998603 () Bool)

(assert (=> b!1081275 m!998603))

(declare-fun m!998605 () Bool)

(assert (=> b!1081275 m!998605))

(declare-fun m!998607 () Bool)

(assert (=> b!1081275 m!998607))

(declare-fun m!998609 () Bool)

(assert (=> b!1081275 m!998609))

(declare-fun m!998611 () Bool)

(assert (=> b!1081275 m!998611))

(declare-fun m!998613 () Bool)

(assert (=> b!1081283 m!998613))

(declare-fun m!998615 () Bool)

(assert (=> b!1081273 m!998615))

(declare-fun m!998617 () Bool)

(assert (=> start!95668 m!998617))

(declare-fun m!998619 () Bool)

(assert (=> start!95668 m!998619))

(declare-fun m!998621 () Bool)

(assert (=> start!95668 m!998621))

(declare-fun m!998623 () Bool)

(assert (=> b!1081282 m!998623))

(check-sat (not b_lambda!16975) (not b!1081278) (not b_next!22327) (not start!95668) (not b!1081277) (not b!1081275) (not b!1081273) (not mapNonEmpty!41248) (not b!1081283) tp_is_empty!26329 b_and!35305 (not b!1081282))
(check-sat b_and!35305 (not b_next!22327))
