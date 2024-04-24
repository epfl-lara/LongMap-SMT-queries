; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96426 () Bool)

(assert start!96426)

(declare-fun b_free!22843 () Bool)

(declare-fun b_next!22843 () Bool)

(assert (=> start!96426 (= b_free!22843 (not b_next!22843))))

(declare-fun tp!80377 () Bool)

(declare-fun b_and!36371 () Bool)

(assert (=> start!96426 (= tp!80377 b_and!36371)))

(declare-fun b!1093618 () Bool)

(declare-fun res!729364 () Bool)

(declare-fun e!624656 () Bool)

(assert (=> b!1093618 (=> (not res!729364) (not e!624656))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093618 (= res!729364 (validKeyInArray!0 k0!904))))

(declare-fun b!1093619 () Bool)

(declare-fun res!729361 () Bool)

(declare-fun e!624657 () Bool)

(assert (=> b!1093619 (=> (not res!729361) (not e!624657))))

(declare-datatypes ((array!70639 0))(
  ( (array!70640 (arr!33987 (Array (_ BitVec 32) (_ BitVec 64))) (size!34524 (_ BitVec 32))) )
))
(declare-fun lt!488688 () array!70639)

(declare-datatypes ((List!23741 0))(
  ( (Nil!23738) (Cons!23737 (h!24955 (_ BitVec 64)) (t!33634 List!23741)) )
))
(declare-fun arrayNoDuplicates!0 (array!70639 (_ BitVec 32) List!23741) Bool)

(assert (=> b!1093619 (= res!729361 (arrayNoDuplicates!0 lt!488688 #b00000000000000000000000000000000 Nil!23738))))

(declare-fun b!1093620 () Bool)

(declare-fun e!624654 () Bool)

(declare-fun e!624658 () Bool)

(declare-fun mapRes!42022 () Bool)

(assert (=> b!1093620 (= e!624654 (and e!624658 mapRes!42022))))

(declare-fun condMapEmpty!42022 () Bool)

(declare-datatypes ((V!40921 0))(
  ( (V!40922 (val!13479 Int)) )
))
(declare-datatypes ((ValueCell!12713 0))(
  ( (ValueCellFull!12713 (v!16096 V!40921)) (EmptyCell!12713) )
))
(declare-datatypes ((array!70641 0))(
  ( (array!70642 (arr!33988 (Array (_ BitVec 32) ValueCell!12713)) (size!34525 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70641)

(declare-fun mapDefault!42022 () ValueCell!12713)

(assert (=> b!1093620 (= condMapEmpty!42022 (= (arr!33988 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12713)) mapDefault!42022)))))

(declare-fun b!1093621 () Bool)

(declare-fun res!729369 () Bool)

(assert (=> b!1093621 (=> (not res!729369) (not e!624656))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70639)

(assert (=> b!1093621 (= res!729369 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34524 _keys!1070))))))

(declare-fun b!1093622 () Bool)

(declare-fun res!729367 () Bool)

(assert (=> b!1093622 (=> (not res!729367) (not e!624656))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70639 (_ BitVec 32)) Bool)

(assert (=> b!1093622 (= res!729367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42022 () Bool)

(assert (=> mapIsEmpty!42022 mapRes!42022))

(declare-fun res!729363 () Bool)

(assert (=> start!96426 (=> (not res!729363) (not e!624656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96426 (= res!729363 (validMask!0 mask!1414))))

(assert (=> start!96426 e!624656))

(assert (=> start!96426 tp!80377))

(assert (=> start!96426 true))

(declare-fun tp_is_empty!26845 () Bool)

(assert (=> start!96426 tp_is_empty!26845))

(declare-fun array_inv!26238 (array!70639) Bool)

(assert (=> start!96426 (array_inv!26238 _keys!1070)))

(declare-fun array_inv!26239 (array!70641) Bool)

(assert (=> start!96426 (and (array_inv!26239 _values!874) e!624654)))

(declare-fun mapNonEmpty!42022 () Bool)

(declare-fun tp!80378 () Bool)

(declare-fun e!624655 () Bool)

(assert (=> mapNonEmpty!42022 (= mapRes!42022 (and tp!80378 e!624655))))

(declare-fun mapRest!42022 () (Array (_ BitVec 32) ValueCell!12713))

(declare-fun mapKey!42022 () (_ BitVec 32))

(declare-fun mapValue!42022 () ValueCell!12713)

(assert (=> mapNonEmpty!42022 (= (arr!33988 _values!874) (store mapRest!42022 mapKey!42022 mapValue!42022))))

(declare-fun b!1093623 () Bool)

(declare-fun res!729368 () Bool)

(assert (=> b!1093623 (=> (not res!729368) (not e!624656))))

(assert (=> b!1093623 (= res!729368 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23738))))

(declare-fun b!1093624 () Bool)

(assert (=> b!1093624 (= e!624656 e!624657)))

(declare-fun res!729362 () Bool)

(assert (=> b!1093624 (=> (not res!729362) (not e!624657))))

(assert (=> b!1093624 (= res!729362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488688 mask!1414))))

(assert (=> b!1093624 (= lt!488688 (array!70640 (store (arr!33987 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34524 _keys!1070)))))

(declare-fun b!1093625 () Bool)

(declare-fun res!729365 () Bool)

(assert (=> b!1093625 (=> (not res!729365) (not e!624656))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093625 (= res!729365 (and (= (size!34525 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34524 _keys!1070) (size!34525 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093626 () Bool)

(declare-fun res!729366 () Bool)

(assert (=> b!1093626 (=> (not res!729366) (not e!624656))))

(assert (=> b!1093626 (= res!729366 (= (select (arr!33987 _keys!1070) i!650) k0!904))))

(declare-fun b!1093627 () Bool)

(assert (=> b!1093627 (= e!624657 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40921)

(declare-datatypes ((tuple2!17150 0))(
  ( (tuple2!17151 (_1!8586 (_ BitVec 64)) (_2!8586 V!40921)) )
))
(declare-datatypes ((List!23742 0))(
  ( (Nil!23739) (Cons!23738 (h!24956 tuple2!17150) (t!33635 List!23742)) )
))
(declare-datatypes ((ListLongMap!15127 0))(
  ( (ListLongMap!15128 (toList!7579 List!23742)) )
))
(declare-fun lt!488690 () ListLongMap!15127)

(declare-fun zeroValue!831 () V!40921)

(declare-fun getCurrentListMap!4327 (array!70639 array!70641 (_ BitVec 32) (_ BitVec 32) V!40921 V!40921 (_ BitVec 32) Int) ListLongMap!15127)

(assert (=> b!1093627 (= lt!488690 (getCurrentListMap!4327 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488686 () ListLongMap!15127)

(declare-fun lt!488691 () array!70641)

(assert (=> b!1093627 (= lt!488686 (getCurrentListMap!4327 lt!488688 lt!488691 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488693 () ListLongMap!15127)

(declare-fun lt!488687 () ListLongMap!15127)

(assert (=> b!1093627 (and (= lt!488693 lt!488687) (= lt!488687 lt!488693))))

(declare-fun lt!488694 () ListLongMap!15127)

(declare-fun -!884 (ListLongMap!15127 (_ BitVec 64)) ListLongMap!15127)

(assert (=> b!1093627 (= lt!488687 (-!884 lt!488694 k0!904))))

(declare-datatypes ((Unit!35935 0))(
  ( (Unit!35936) )
))
(declare-fun lt!488689 () Unit!35935)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!156 (array!70639 array!70641 (_ BitVec 32) (_ BitVec 32) V!40921 V!40921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35935)

(assert (=> b!1093627 (= lt!488689 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!156 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4132 (array!70639 array!70641 (_ BitVec 32) (_ BitVec 32) V!40921 V!40921 (_ BitVec 32) Int) ListLongMap!15127)

(assert (=> b!1093627 (= lt!488693 (getCurrentListMapNoExtraKeys!4132 lt!488688 lt!488691 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2253 (Int (_ BitVec 64)) V!40921)

(assert (=> b!1093627 (= lt!488691 (array!70642 (store (arr!33988 _values!874) i!650 (ValueCellFull!12713 (dynLambda!2253 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34525 _values!874)))))

(assert (=> b!1093627 (= lt!488694 (getCurrentListMapNoExtraKeys!4132 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093627 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488692 () Unit!35935)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70639 (_ BitVec 64) (_ BitVec 32)) Unit!35935)

(assert (=> b!1093627 (= lt!488692 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093628 () Bool)

(assert (=> b!1093628 (= e!624655 tp_is_empty!26845)))

(declare-fun b!1093629 () Bool)

(assert (=> b!1093629 (= e!624658 tp_is_empty!26845)))

(assert (= (and start!96426 res!729363) b!1093625))

(assert (= (and b!1093625 res!729365) b!1093622))

(assert (= (and b!1093622 res!729367) b!1093623))

(assert (= (and b!1093623 res!729368) b!1093621))

(assert (= (and b!1093621 res!729369) b!1093618))

(assert (= (and b!1093618 res!729364) b!1093626))

(assert (= (and b!1093626 res!729366) b!1093624))

(assert (= (and b!1093624 res!729362) b!1093619))

(assert (= (and b!1093619 res!729361) b!1093627))

(assert (= (and b!1093620 condMapEmpty!42022) mapIsEmpty!42022))

(assert (= (and b!1093620 (not condMapEmpty!42022)) mapNonEmpty!42022))

(get-info :version)

(assert (= (and mapNonEmpty!42022 ((_ is ValueCellFull!12713) mapValue!42022)) b!1093628))

(assert (= (and b!1093620 ((_ is ValueCellFull!12713) mapDefault!42022)) b!1093629))

(assert (= start!96426 b!1093620))

(declare-fun b_lambda!17523 () Bool)

(assert (=> (not b_lambda!17523) (not b!1093627)))

(declare-fun t!33633 () Bool)

(declare-fun tb!7713 () Bool)

(assert (=> (and start!96426 (= defaultEntry!882 defaultEntry!882) t!33633) tb!7713))

(declare-fun result!15953 () Bool)

(assert (=> tb!7713 (= result!15953 tp_is_empty!26845)))

(assert (=> b!1093627 t!33633))

(declare-fun b_and!36373 () Bool)

(assert (= b_and!36371 (and (=> t!33633 result!15953) b_and!36373)))

(declare-fun m!1013711 () Bool)

(assert (=> b!1093626 m!1013711))

(declare-fun m!1013713 () Bool)

(assert (=> b!1093619 m!1013713))

(declare-fun m!1013715 () Bool)

(assert (=> b!1093622 m!1013715))

(declare-fun m!1013717 () Bool)

(assert (=> b!1093618 m!1013717))

(declare-fun m!1013719 () Bool)

(assert (=> start!96426 m!1013719))

(declare-fun m!1013721 () Bool)

(assert (=> start!96426 m!1013721))

(declare-fun m!1013723 () Bool)

(assert (=> start!96426 m!1013723))

(declare-fun m!1013725 () Bool)

(assert (=> mapNonEmpty!42022 m!1013725))

(declare-fun m!1013727 () Bool)

(assert (=> b!1093624 m!1013727))

(declare-fun m!1013729 () Bool)

(assert (=> b!1093624 m!1013729))

(declare-fun m!1013731 () Bool)

(assert (=> b!1093623 m!1013731))

(declare-fun m!1013733 () Bool)

(assert (=> b!1093627 m!1013733))

(declare-fun m!1013735 () Bool)

(assert (=> b!1093627 m!1013735))

(declare-fun m!1013737 () Bool)

(assert (=> b!1093627 m!1013737))

(declare-fun m!1013739 () Bool)

(assert (=> b!1093627 m!1013739))

(declare-fun m!1013741 () Bool)

(assert (=> b!1093627 m!1013741))

(declare-fun m!1013743 () Bool)

(assert (=> b!1093627 m!1013743))

(declare-fun m!1013745 () Bool)

(assert (=> b!1093627 m!1013745))

(declare-fun m!1013747 () Bool)

(assert (=> b!1093627 m!1013747))

(declare-fun m!1013749 () Bool)

(assert (=> b!1093627 m!1013749))

(declare-fun m!1013751 () Bool)

(assert (=> b!1093627 m!1013751))

(check-sat (not mapNonEmpty!42022) (not b!1093622) (not b!1093624) (not b_lambda!17523) tp_is_empty!26845 (not b!1093627) b_and!36373 (not b!1093623) (not b_next!22843) (not start!96426) (not b!1093619) (not b!1093618))
(check-sat b_and!36373 (not b_next!22843))
