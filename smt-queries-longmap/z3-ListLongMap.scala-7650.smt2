; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96222 () Bool)

(assert start!96222)

(declare-fun b_free!22875 () Bool)

(declare-fun b_next!22875 () Bool)

(assert (=> start!96222 (= b_free!22875 (not b_next!22875))))

(declare-fun tp!80474 () Bool)

(declare-fun b_and!36425 () Bool)

(assert (=> start!96222 (= tp!80474 b_and!36425)))

(declare-fun res!729273 () Bool)

(declare-fun e!624089 () Bool)

(assert (=> start!96222 (=> (not res!729273) (not e!624089))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96222 (= res!729273 (validMask!0 mask!1414))))

(assert (=> start!96222 e!624089))

(assert (=> start!96222 tp!80474))

(assert (=> start!96222 true))

(declare-fun tp_is_empty!26877 () Bool)

(assert (=> start!96222 tp_is_empty!26877))

(declare-datatypes ((array!70673 0))(
  ( (array!70674 (arr!34010 (Array (_ BitVec 32) (_ BitVec 64))) (size!34546 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70673)

(declare-fun array_inv!26216 (array!70673) Bool)

(assert (=> start!96222 (array_inv!26216 _keys!1070)))

(declare-datatypes ((V!40963 0))(
  ( (V!40964 (val!13495 Int)) )
))
(declare-datatypes ((ValueCell!12729 0))(
  ( (ValueCellFull!12729 (v!16116 V!40963)) (EmptyCell!12729) )
))
(declare-datatypes ((array!70675 0))(
  ( (array!70676 (arr!34011 (Array (_ BitVec 32) ValueCell!12729)) (size!34547 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70675)

(declare-fun e!624088 () Bool)

(declare-fun array_inv!26217 (array!70675) Bool)

(assert (=> start!96222 (and (array_inv!26217 _values!874) e!624088)))

(declare-fun b!1092899 () Bool)

(declare-fun res!729275 () Bool)

(assert (=> b!1092899 (=> (not res!729275) (not e!624089))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092899 (= res!729275 (= (select (arr!34010 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42070 () Bool)

(declare-fun mapRes!42070 () Bool)

(assert (=> mapIsEmpty!42070 mapRes!42070))

(declare-fun b!1092900 () Bool)

(declare-fun e!624091 () Bool)

(assert (=> b!1092900 (= e!624091 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40963)

(declare-datatypes ((tuple2!17172 0))(
  ( (tuple2!17173 (_1!8597 (_ BitVec 64)) (_2!8597 V!40963)) )
))
(declare-datatypes ((List!23760 0))(
  ( (Nil!23757) (Cons!23756 (h!24965 tuple2!17172) (t!33693 List!23760)) )
))
(declare-datatypes ((ListLongMap!15141 0))(
  ( (ListLongMap!15142 (toList!7586 List!23760)) )
))
(declare-fun lt!488605 () ListLongMap!15141)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40963)

(declare-fun getCurrentListMap!4342 (array!70673 array!70675 (_ BitVec 32) (_ BitVec 32) V!40963 V!40963 (_ BitVec 32) Int) ListLongMap!15141)

(assert (=> b!1092900 (= lt!488605 (getCurrentListMap!4342 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488607 () array!70673)

(declare-fun lt!488603 () array!70675)

(declare-fun lt!488609 () ListLongMap!15141)

(assert (=> b!1092900 (= lt!488609 (getCurrentListMap!4342 lt!488607 lt!488603 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488611 () ListLongMap!15141)

(declare-fun lt!488604 () ListLongMap!15141)

(assert (=> b!1092900 (and (= lt!488611 lt!488604) (= lt!488604 lt!488611))))

(declare-fun lt!488610 () ListLongMap!15141)

(declare-fun -!905 (ListLongMap!15141 (_ BitVec 64)) ListLongMap!15141)

(assert (=> b!1092900 (= lt!488604 (-!905 lt!488610 k0!904))))

(declare-datatypes ((Unit!35976 0))(
  ( (Unit!35977) )
))
(declare-fun lt!488608 () Unit!35976)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!161 (array!70673 array!70675 (_ BitVec 32) (_ BitVec 32) V!40963 V!40963 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35976)

(assert (=> b!1092900 (= lt!488608 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!161 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4102 (array!70673 array!70675 (_ BitVec 32) (_ BitVec 32) V!40963 V!40963 (_ BitVec 32) Int) ListLongMap!15141)

(assert (=> b!1092900 (= lt!488611 (getCurrentListMapNoExtraKeys!4102 lt!488607 lt!488603 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2239 (Int (_ BitVec 64)) V!40963)

(assert (=> b!1092900 (= lt!488603 (array!70676 (store (arr!34011 _values!874) i!650 (ValueCellFull!12729 (dynLambda!2239 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34547 _values!874)))))

(assert (=> b!1092900 (= lt!488610 (getCurrentListMapNoExtraKeys!4102 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092900 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488606 () Unit!35976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70673 (_ BitVec 64) (_ BitVec 32)) Unit!35976)

(assert (=> b!1092900 (= lt!488606 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092901 () Bool)

(declare-fun e!624087 () Bool)

(assert (=> b!1092901 (= e!624088 (and e!624087 mapRes!42070))))

(declare-fun condMapEmpty!42070 () Bool)

(declare-fun mapDefault!42070 () ValueCell!12729)

(assert (=> b!1092901 (= condMapEmpty!42070 (= (arr!34011 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12729)) mapDefault!42070)))))

(declare-fun b!1092902 () Bool)

(declare-fun res!729276 () Bool)

(assert (=> b!1092902 (=> (not res!729276) (not e!624089))))

(assert (=> b!1092902 (= res!729276 (and (= (size!34547 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34546 _keys!1070) (size!34547 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092903 () Bool)

(declare-fun e!624090 () Bool)

(assert (=> b!1092903 (= e!624090 tp_is_empty!26877)))

(declare-fun b!1092904 () Bool)

(declare-fun res!729277 () Bool)

(assert (=> b!1092904 (=> (not res!729277) (not e!624089))))

(assert (=> b!1092904 (= res!729277 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34546 _keys!1070))))))

(declare-fun mapNonEmpty!42070 () Bool)

(declare-fun tp!80473 () Bool)

(assert (=> mapNonEmpty!42070 (= mapRes!42070 (and tp!80473 e!624090))))

(declare-fun mapValue!42070 () ValueCell!12729)

(declare-fun mapRest!42070 () (Array (_ BitVec 32) ValueCell!12729))

(declare-fun mapKey!42070 () (_ BitVec 32))

(assert (=> mapNonEmpty!42070 (= (arr!34011 _values!874) (store mapRest!42070 mapKey!42070 mapValue!42070))))

(declare-fun b!1092905 () Bool)

(assert (=> b!1092905 (= e!624089 e!624091)))

(declare-fun res!729278 () Bool)

(assert (=> b!1092905 (=> (not res!729278) (not e!624091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70673 (_ BitVec 32)) Bool)

(assert (=> b!1092905 (= res!729278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488607 mask!1414))))

(assert (=> b!1092905 (= lt!488607 (array!70674 (store (arr!34010 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34546 _keys!1070)))))

(declare-fun b!1092906 () Bool)

(declare-fun res!729272 () Bool)

(assert (=> b!1092906 (=> (not res!729272) (not e!624089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092906 (= res!729272 (validKeyInArray!0 k0!904))))

(declare-fun b!1092907 () Bool)

(declare-fun res!729279 () Bool)

(assert (=> b!1092907 (=> (not res!729279) (not e!624089))))

(declare-datatypes ((List!23761 0))(
  ( (Nil!23758) (Cons!23757 (h!24966 (_ BitVec 64)) (t!33694 List!23761)) )
))
(declare-fun arrayNoDuplicates!0 (array!70673 (_ BitVec 32) List!23761) Bool)

(assert (=> b!1092907 (= res!729279 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23758))))

(declare-fun b!1092908 () Bool)

(declare-fun res!729274 () Bool)

(assert (=> b!1092908 (=> (not res!729274) (not e!624089))))

(assert (=> b!1092908 (= res!729274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092909 () Bool)

(assert (=> b!1092909 (= e!624087 tp_is_empty!26877)))

(declare-fun b!1092910 () Bool)

(declare-fun res!729271 () Bool)

(assert (=> b!1092910 (=> (not res!729271) (not e!624091))))

(assert (=> b!1092910 (= res!729271 (arrayNoDuplicates!0 lt!488607 #b00000000000000000000000000000000 Nil!23758))))

(assert (= (and start!96222 res!729273) b!1092902))

(assert (= (and b!1092902 res!729276) b!1092908))

(assert (= (and b!1092908 res!729274) b!1092907))

(assert (= (and b!1092907 res!729279) b!1092904))

(assert (= (and b!1092904 res!729277) b!1092906))

(assert (= (and b!1092906 res!729272) b!1092899))

(assert (= (and b!1092899 res!729275) b!1092905))

(assert (= (and b!1092905 res!729278) b!1092910))

(assert (= (and b!1092910 res!729271) b!1092900))

(assert (= (and b!1092901 condMapEmpty!42070) mapIsEmpty!42070))

(assert (= (and b!1092901 (not condMapEmpty!42070)) mapNonEmpty!42070))

(get-info :version)

(assert (= (and mapNonEmpty!42070 ((_ is ValueCellFull!12729) mapValue!42070)) b!1092903))

(assert (= (and b!1092901 ((_ is ValueCellFull!12729) mapDefault!42070)) b!1092909))

(assert (= start!96222 b!1092901))

(declare-fun b_lambda!17545 () Bool)

(assert (=> (not b_lambda!17545) (not b!1092900)))

(declare-fun t!33692 () Bool)

(declare-fun tb!7753 () Bool)

(assert (=> (and start!96222 (= defaultEntry!882 defaultEntry!882) t!33692) tb!7753))

(declare-fun result!16025 () Bool)

(assert (=> tb!7753 (= result!16025 tp_is_empty!26877)))

(assert (=> b!1092900 t!33692))

(declare-fun b_and!36427 () Bool)

(assert (= b_and!36425 (and (=> t!33692 result!16025) b_and!36427)))

(declare-fun m!1012711 () Bool)

(assert (=> start!96222 m!1012711))

(declare-fun m!1012713 () Bool)

(assert (=> start!96222 m!1012713))

(declare-fun m!1012715 () Bool)

(assert (=> start!96222 m!1012715))

(declare-fun m!1012717 () Bool)

(assert (=> b!1092910 m!1012717))

(declare-fun m!1012719 () Bool)

(assert (=> mapNonEmpty!42070 m!1012719))

(declare-fun m!1012721 () Bool)

(assert (=> b!1092905 m!1012721))

(declare-fun m!1012723 () Bool)

(assert (=> b!1092905 m!1012723))

(declare-fun m!1012725 () Bool)

(assert (=> b!1092899 m!1012725))

(declare-fun m!1012727 () Bool)

(assert (=> b!1092908 m!1012727))

(declare-fun m!1012729 () Bool)

(assert (=> b!1092907 m!1012729))

(declare-fun m!1012731 () Bool)

(assert (=> b!1092900 m!1012731))

(declare-fun m!1012733 () Bool)

(assert (=> b!1092900 m!1012733))

(declare-fun m!1012735 () Bool)

(assert (=> b!1092900 m!1012735))

(declare-fun m!1012737 () Bool)

(assert (=> b!1092900 m!1012737))

(declare-fun m!1012739 () Bool)

(assert (=> b!1092900 m!1012739))

(declare-fun m!1012741 () Bool)

(assert (=> b!1092900 m!1012741))

(declare-fun m!1012743 () Bool)

(assert (=> b!1092900 m!1012743))

(declare-fun m!1012745 () Bool)

(assert (=> b!1092900 m!1012745))

(declare-fun m!1012747 () Bool)

(assert (=> b!1092900 m!1012747))

(declare-fun m!1012749 () Bool)

(assert (=> b!1092900 m!1012749))

(declare-fun m!1012751 () Bool)

(assert (=> b!1092906 m!1012751))

(check-sat (not b!1092908) (not b!1092905) (not b!1092907) (not b_lambda!17545) (not mapNonEmpty!42070) tp_is_empty!26877 b_and!36427 (not b_next!22875) (not start!96222) (not b!1092906) (not b!1092900) (not b!1092910))
(check-sat b_and!36427 (not b_next!22875))
