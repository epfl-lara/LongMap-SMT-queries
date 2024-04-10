; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96264 () Bool)

(assert start!96264)

(declare-fun b_free!22917 () Bool)

(declare-fun b_next!22917 () Bool)

(assert (=> start!96264 (= b_free!22917 (not b_next!22917))))

(declare-fun tp!80600 () Bool)

(declare-fun b_and!36509 () Bool)

(assert (=> start!96264 (= tp!80600 b_and!36509)))

(declare-fun b!1093697 () Bool)

(declare-fun e!624465 () Bool)

(assert (=> b!1093697 (= e!624465 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41019 0))(
  ( (V!41020 (val!13516 Int)) )
))
(declare-fun minValue!831 () V!41019)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41019)

(declare-datatypes ((tuple2!17194 0))(
  ( (tuple2!17195 (_1!8608 (_ BitVec 64)) (_2!8608 V!41019)) )
))
(declare-datatypes ((List!23789 0))(
  ( (Nil!23786) (Cons!23785 (h!24994 tuple2!17194) (t!33764 List!23789)) )
))
(declare-datatypes ((ListLongMap!15163 0))(
  ( (ListLongMap!15164 (toList!7597 List!23789)) )
))
(declare-fun lt!489187 () ListLongMap!15163)

(declare-datatypes ((array!70755 0))(
  ( (array!70756 (arr!34051 (Array (_ BitVec 32) (_ BitVec 64))) (size!34587 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70755)

(declare-datatypes ((ValueCell!12750 0))(
  ( (ValueCellFull!12750 (v!16137 V!41019)) (EmptyCell!12750) )
))
(declare-datatypes ((array!70757 0))(
  ( (array!70758 (arr!34052 (Array (_ BitVec 32) ValueCell!12750)) (size!34588 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70757)

(declare-fun getCurrentListMap!4353 (array!70755 array!70757 (_ BitVec 32) (_ BitVec 32) V!41019 V!41019 (_ BitVec 32) Int) ListLongMap!15163)

(assert (=> b!1093697 (= lt!489187 (getCurrentListMap!4353 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489183 () ListLongMap!15163)

(declare-fun lt!489181 () array!70757)

(declare-fun lt!489185 () array!70755)

(assert (=> b!1093697 (= lt!489183 (getCurrentListMap!4353 lt!489185 lt!489181 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489184 () ListLongMap!15163)

(declare-fun lt!489179 () ListLongMap!15163)

(assert (=> b!1093697 (and (= lt!489184 lt!489179) (= lt!489179 lt!489184))))

(declare-fun lt!489180 () ListLongMap!15163)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!916 (ListLongMap!15163 (_ BitVec 64)) ListLongMap!15163)

(assert (=> b!1093697 (= lt!489179 (-!916 lt!489180 k0!904))))

(declare-datatypes ((Unit!35998 0))(
  ( (Unit!35999) )
))
(declare-fun lt!489182 () Unit!35998)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!172 (array!70755 array!70757 (_ BitVec 32) (_ BitVec 32) V!41019 V!41019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35998)

(assert (=> b!1093697 (= lt!489182 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!172 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4113 (array!70755 array!70757 (_ BitVec 32) (_ BitVec 32) V!41019 V!41019 (_ BitVec 32) Int) ListLongMap!15163)

(assert (=> b!1093697 (= lt!489184 (getCurrentListMapNoExtraKeys!4113 lt!489185 lt!489181 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2250 (Int (_ BitVec 64)) V!41019)

(assert (=> b!1093697 (= lt!489181 (array!70758 (store (arr!34052 _values!874) i!650 (ValueCellFull!12750 (dynLambda!2250 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34588 _values!874)))))

(assert (=> b!1093697 (= lt!489180 (getCurrentListMapNoExtraKeys!4113 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093697 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489186 () Unit!35998)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70755 (_ BitVec 64) (_ BitVec 32)) Unit!35998)

(assert (=> b!1093697 (= lt!489186 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093699 () Bool)

(declare-fun res!729839 () Bool)

(declare-fun e!624469 () Bool)

(assert (=> b!1093699 (=> (not res!729839) (not e!624469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70755 (_ BitVec 32)) Bool)

(assert (=> b!1093699 (= res!729839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42133 () Bool)

(declare-fun mapRes!42133 () Bool)

(assert (=> mapIsEmpty!42133 mapRes!42133))

(declare-fun b!1093700 () Bool)

(declare-fun e!624468 () Bool)

(declare-fun tp_is_empty!26919 () Bool)

(assert (=> b!1093700 (= e!624468 tp_is_empty!26919)))

(declare-fun b!1093701 () Bool)

(declare-fun e!624467 () Bool)

(declare-fun e!624470 () Bool)

(assert (=> b!1093701 (= e!624467 (and e!624470 mapRes!42133))))

(declare-fun condMapEmpty!42133 () Bool)

(declare-fun mapDefault!42133 () ValueCell!12750)

(assert (=> b!1093701 (= condMapEmpty!42133 (= (arr!34052 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12750)) mapDefault!42133)))))

(declare-fun b!1093702 () Bool)

(declare-fun res!729845 () Bool)

(assert (=> b!1093702 (=> (not res!729845) (not e!624469))))

(assert (=> b!1093702 (= res!729845 (and (= (size!34588 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34587 _keys!1070) (size!34588 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093703 () Bool)

(assert (=> b!1093703 (= e!624469 e!624465)))

(declare-fun res!729840 () Bool)

(assert (=> b!1093703 (=> (not res!729840) (not e!624465))))

(assert (=> b!1093703 (= res!729840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489185 mask!1414))))

(assert (=> b!1093703 (= lt!489185 (array!70756 (store (arr!34051 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34587 _keys!1070)))))

(declare-fun b!1093704 () Bool)

(declare-fun res!729843 () Bool)

(assert (=> b!1093704 (=> (not res!729843) (not e!624469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093704 (= res!729843 (validKeyInArray!0 k0!904))))

(declare-fun b!1093705 () Bool)

(declare-fun res!729846 () Bool)

(assert (=> b!1093705 (=> (not res!729846) (not e!624469))))

(declare-datatypes ((List!23790 0))(
  ( (Nil!23787) (Cons!23786 (h!24995 (_ BitVec 64)) (t!33765 List!23790)) )
))
(declare-fun arrayNoDuplicates!0 (array!70755 (_ BitVec 32) List!23790) Bool)

(assert (=> b!1093705 (= res!729846 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23787))))

(declare-fun b!1093706 () Bool)

(declare-fun res!729844 () Bool)

(assert (=> b!1093706 (=> (not res!729844) (not e!624469))))

(assert (=> b!1093706 (= res!729844 (= (select (arr!34051 _keys!1070) i!650) k0!904))))

(declare-fun b!1093707 () Bool)

(declare-fun res!729838 () Bool)

(assert (=> b!1093707 (=> (not res!729838) (not e!624469))))

(assert (=> b!1093707 (= res!729838 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34587 _keys!1070))))))

(declare-fun res!729841 () Bool)

(assert (=> start!96264 (=> (not res!729841) (not e!624469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96264 (= res!729841 (validMask!0 mask!1414))))

(assert (=> start!96264 e!624469))

(assert (=> start!96264 tp!80600))

(assert (=> start!96264 true))

(assert (=> start!96264 tp_is_empty!26919))

(declare-fun array_inv!26240 (array!70755) Bool)

(assert (=> start!96264 (array_inv!26240 _keys!1070)))

(declare-fun array_inv!26241 (array!70757) Bool)

(assert (=> start!96264 (and (array_inv!26241 _values!874) e!624467)))

(declare-fun b!1093698 () Bool)

(assert (=> b!1093698 (= e!624470 tp_is_empty!26919)))

(declare-fun mapNonEmpty!42133 () Bool)

(declare-fun tp!80599 () Bool)

(assert (=> mapNonEmpty!42133 (= mapRes!42133 (and tp!80599 e!624468))))

(declare-fun mapKey!42133 () (_ BitVec 32))

(declare-fun mapValue!42133 () ValueCell!12750)

(declare-fun mapRest!42133 () (Array (_ BitVec 32) ValueCell!12750))

(assert (=> mapNonEmpty!42133 (= (arr!34052 _values!874) (store mapRest!42133 mapKey!42133 mapValue!42133))))

(declare-fun b!1093708 () Bool)

(declare-fun res!729842 () Bool)

(assert (=> b!1093708 (=> (not res!729842) (not e!624465))))

(assert (=> b!1093708 (= res!729842 (arrayNoDuplicates!0 lt!489185 #b00000000000000000000000000000000 Nil!23787))))

(assert (= (and start!96264 res!729841) b!1093702))

(assert (= (and b!1093702 res!729845) b!1093699))

(assert (= (and b!1093699 res!729839) b!1093705))

(assert (= (and b!1093705 res!729846) b!1093707))

(assert (= (and b!1093707 res!729838) b!1093704))

(assert (= (and b!1093704 res!729843) b!1093706))

(assert (= (and b!1093706 res!729844) b!1093703))

(assert (= (and b!1093703 res!729840) b!1093708))

(assert (= (and b!1093708 res!729842) b!1093697))

(assert (= (and b!1093701 condMapEmpty!42133) mapIsEmpty!42133))

(assert (= (and b!1093701 (not condMapEmpty!42133)) mapNonEmpty!42133))

(get-info :version)

(assert (= (and mapNonEmpty!42133 ((_ is ValueCellFull!12750) mapValue!42133)) b!1093700))

(assert (= (and b!1093701 ((_ is ValueCellFull!12750) mapDefault!42133)) b!1093698))

(assert (= start!96264 b!1093701))

(declare-fun b_lambda!17587 () Bool)

(assert (=> (not b_lambda!17587) (not b!1093697)))

(declare-fun t!33763 () Bool)

(declare-fun tb!7795 () Bool)

(assert (=> (and start!96264 (= defaultEntry!882 defaultEntry!882) t!33763) tb!7795))

(declare-fun result!16109 () Bool)

(assert (=> tb!7795 (= result!16109 tp_is_empty!26919)))

(assert (=> b!1093697 t!33763))

(declare-fun b_and!36511 () Bool)

(assert (= b_and!36509 (and (=> t!33763 result!16109) b_and!36511)))

(declare-fun m!1013593 () Bool)

(assert (=> b!1093699 m!1013593))

(declare-fun m!1013595 () Bool)

(assert (=> b!1093708 m!1013595))

(declare-fun m!1013597 () Bool)

(assert (=> b!1093704 m!1013597))

(declare-fun m!1013599 () Bool)

(assert (=> b!1093705 m!1013599))

(declare-fun m!1013601 () Bool)

(assert (=> b!1093706 m!1013601))

(declare-fun m!1013603 () Bool)

(assert (=> mapNonEmpty!42133 m!1013603))

(declare-fun m!1013605 () Bool)

(assert (=> b!1093703 m!1013605))

(declare-fun m!1013607 () Bool)

(assert (=> b!1093703 m!1013607))

(declare-fun m!1013609 () Bool)

(assert (=> start!96264 m!1013609))

(declare-fun m!1013611 () Bool)

(assert (=> start!96264 m!1013611))

(declare-fun m!1013613 () Bool)

(assert (=> start!96264 m!1013613))

(declare-fun m!1013615 () Bool)

(assert (=> b!1093697 m!1013615))

(declare-fun m!1013617 () Bool)

(assert (=> b!1093697 m!1013617))

(declare-fun m!1013619 () Bool)

(assert (=> b!1093697 m!1013619))

(declare-fun m!1013621 () Bool)

(assert (=> b!1093697 m!1013621))

(declare-fun m!1013623 () Bool)

(assert (=> b!1093697 m!1013623))

(declare-fun m!1013625 () Bool)

(assert (=> b!1093697 m!1013625))

(declare-fun m!1013627 () Bool)

(assert (=> b!1093697 m!1013627))

(declare-fun m!1013629 () Bool)

(assert (=> b!1093697 m!1013629))

(declare-fun m!1013631 () Bool)

(assert (=> b!1093697 m!1013631))

(declare-fun m!1013633 () Bool)

(assert (=> b!1093697 m!1013633))

(check-sat (not b!1093697) (not b!1093705) b_and!36511 (not b!1093708) tp_is_empty!26919 (not start!96264) (not b!1093704) (not b!1093703) (not b!1093699) (not mapNonEmpty!42133) (not b_lambda!17587) (not b_next!22917))
(check-sat b_and!36511 (not b_next!22917))
