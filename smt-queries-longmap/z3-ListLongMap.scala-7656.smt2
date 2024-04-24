; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96492 () Bool)

(assert start!96492)

(declare-fun b_free!22909 () Bool)

(declare-fun b_next!22909 () Bool)

(assert (=> start!96492 (= b_free!22909 (not b_next!22909))))

(declare-fun tp!80575 () Bool)

(declare-fun b_and!36503 () Bool)

(assert (=> start!96492 (= tp!80575 b_and!36503)))

(declare-fun mapNonEmpty!42121 () Bool)

(declare-fun mapRes!42121 () Bool)

(declare-fun tp!80576 () Bool)

(declare-fun e!625252 () Bool)

(assert (=> mapNonEmpty!42121 (= mapRes!42121 (and tp!80576 e!625252))))

(declare-datatypes ((V!41009 0))(
  ( (V!41010 (val!13512 Int)) )
))
(declare-datatypes ((ValueCell!12746 0))(
  ( (ValueCellFull!12746 (v!16129 V!41009)) (EmptyCell!12746) )
))
(declare-datatypes ((array!70767 0))(
  ( (array!70768 (arr!34051 (Array (_ BitVec 32) ValueCell!12746)) (size!34588 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70767)

(declare-fun mapRest!42121 () (Array (_ BitVec 32) ValueCell!12746))

(declare-fun mapKey!42121 () (_ BitVec 32))

(declare-fun mapValue!42121 () ValueCell!12746)

(assert (=> mapNonEmpty!42121 (= (arr!34051 _values!874) (store mapRest!42121 mapKey!42121 mapValue!42121))))

(declare-fun b!1094872 () Bool)

(declare-fun res!730257 () Bool)

(declare-fun e!625250 () Bool)

(assert (=> b!1094872 (=> (not res!730257) (not e!625250))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70769 0))(
  ( (array!70770 (arr!34052 (Array (_ BitVec 32) (_ BitVec 64))) (size!34589 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70769)

(assert (=> b!1094872 (= res!730257 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34589 _keys!1070))))))

(declare-fun b!1094873 () Bool)

(declare-fun res!730259 () Bool)

(assert (=> b!1094873 (=> (not res!730259) (not e!625250))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094873 (= res!730259 (and (= (size!34588 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34589 _keys!1070) (size!34588 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094875 () Bool)

(declare-fun e!625253 () Bool)

(declare-fun tp_is_empty!26911 () Bool)

(assert (=> b!1094875 (= e!625253 tp_is_empty!26911)))

(declare-fun b!1094876 () Bool)

(declare-fun e!625249 () Bool)

(assert (=> b!1094876 (= e!625249 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41009)

(declare-datatypes ((tuple2!17196 0))(
  ( (tuple2!17197 (_1!8609 (_ BitVec 64)) (_2!8609 V!41009)) )
))
(declare-datatypes ((List!23791 0))(
  ( (Nil!23788) (Cons!23787 (h!25005 tuple2!17196) (t!33750 List!23791)) )
))
(declare-datatypes ((ListLongMap!15173 0))(
  ( (ListLongMap!15174 (toList!7602 List!23791)) )
))
(declare-fun lt!489593 () ListLongMap!15173)

(declare-fun zeroValue!831 () V!41009)

(declare-fun getCurrentListMap!4350 (array!70769 array!70767 (_ BitVec 32) (_ BitVec 32) V!41009 V!41009 (_ BitVec 32) Int) ListLongMap!15173)

(assert (=> b!1094876 (= lt!489593 (getCurrentListMap!4350 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489590 () array!70769)

(declare-fun lt!489589 () ListLongMap!15173)

(declare-fun lt!489588 () array!70767)

(assert (=> b!1094876 (= lt!489589 (getCurrentListMap!4350 lt!489590 lt!489588 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489587 () ListLongMap!15173)

(declare-fun lt!489591 () ListLongMap!15173)

(assert (=> b!1094876 (and (= lt!489587 lt!489591) (= lt!489591 lt!489587))))

(declare-fun lt!489586 () ListLongMap!15173)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!907 (ListLongMap!15173 (_ BitVec 64)) ListLongMap!15173)

(assert (=> b!1094876 (= lt!489591 (-!907 lt!489586 k0!904))))

(declare-datatypes ((Unit!35981 0))(
  ( (Unit!35982) )
))
(declare-fun lt!489592 () Unit!35981)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!179 (array!70769 array!70767 (_ BitVec 32) (_ BitVec 32) V!41009 V!41009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35981)

(assert (=> b!1094876 (= lt!489592 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!179 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4155 (array!70769 array!70767 (_ BitVec 32) (_ BitVec 32) V!41009 V!41009 (_ BitVec 32) Int) ListLongMap!15173)

(assert (=> b!1094876 (= lt!489587 (getCurrentListMapNoExtraKeys!4155 lt!489590 lt!489588 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2276 (Int (_ BitVec 64)) V!41009)

(assert (=> b!1094876 (= lt!489588 (array!70768 (store (arr!34051 _values!874) i!650 (ValueCellFull!12746 (dynLambda!2276 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34588 _values!874)))))

(assert (=> b!1094876 (= lt!489586 (getCurrentListMapNoExtraKeys!4155 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094876 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489594 () Unit!35981)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70769 (_ BitVec 64) (_ BitVec 32)) Unit!35981)

(assert (=> b!1094876 (= lt!489594 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094877 () Bool)

(declare-fun e!625251 () Bool)

(assert (=> b!1094877 (= e!625251 (and e!625253 mapRes!42121))))

(declare-fun condMapEmpty!42121 () Bool)

(declare-fun mapDefault!42121 () ValueCell!12746)

(assert (=> b!1094877 (= condMapEmpty!42121 (= (arr!34051 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12746)) mapDefault!42121)))))

(declare-fun b!1094878 () Bool)

(declare-fun res!730254 () Bool)

(assert (=> b!1094878 (=> (not res!730254) (not e!625250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70769 (_ BitVec 32)) Bool)

(assert (=> b!1094878 (= res!730254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094879 () Bool)

(declare-fun res!730253 () Bool)

(assert (=> b!1094879 (=> (not res!730253) (not e!625250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094879 (= res!730253 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42121 () Bool)

(assert (=> mapIsEmpty!42121 mapRes!42121))

(declare-fun b!1094880 () Bool)

(declare-fun res!730255 () Bool)

(assert (=> b!1094880 (=> (not res!730255) (not e!625250))))

(assert (=> b!1094880 (= res!730255 (= (select (arr!34052 _keys!1070) i!650) k0!904))))

(declare-fun b!1094881 () Bool)

(assert (=> b!1094881 (= e!625252 tp_is_empty!26911)))

(declare-fun b!1094882 () Bool)

(declare-fun res!730256 () Bool)

(assert (=> b!1094882 (=> (not res!730256) (not e!625250))))

(declare-datatypes ((List!23792 0))(
  ( (Nil!23789) (Cons!23788 (h!25006 (_ BitVec 64)) (t!33751 List!23792)) )
))
(declare-fun arrayNoDuplicates!0 (array!70769 (_ BitVec 32) List!23792) Bool)

(assert (=> b!1094882 (= res!730256 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23789))))

(declare-fun b!1094883 () Bool)

(assert (=> b!1094883 (= e!625250 e!625249)))

(declare-fun res!730252 () Bool)

(assert (=> b!1094883 (=> (not res!730252) (not e!625249))))

(assert (=> b!1094883 (= res!730252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489590 mask!1414))))

(assert (=> b!1094883 (= lt!489590 (array!70770 (store (arr!34052 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34589 _keys!1070)))))

(declare-fun b!1094874 () Bool)

(declare-fun res!730258 () Bool)

(assert (=> b!1094874 (=> (not res!730258) (not e!625249))))

(assert (=> b!1094874 (= res!730258 (arrayNoDuplicates!0 lt!489590 #b00000000000000000000000000000000 Nil!23789))))

(declare-fun res!730260 () Bool)

(assert (=> start!96492 (=> (not res!730260) (not e!625250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96492 (= res!730260 (validMask!0 mask!1414))))

(assert (=> start!96492 e!625250))

(assert (=> start!96492 tp!80575))

(assert (=> start!96492 true))

(assert (=> start!96492 tp_is_empty!26911))

(declare-fun array_inv!26282 (array!70769) Bool)

(assert (=> start!96492 (array_inv!26282 _keys!1070)))

(declare-fun array_inv!26283 (array!70767) Bool)

(assert (=> start!96492 (and (array_inv!26283 _values!874) e!625251)))

(assert (= (and start!96492 res!730260) b!1094873))

(assert (= (and b!1094873 res!730259) b!1094878))

(assert (= (and b!1094878 res!730254) b!1094882))

(assert (= (and b!1094882 res!730256) b!1094872))

(assert (= (and b!1094872 res!730257) b!1094879))

(assert (= (and b!1094879 res!730253) b!1094880))

(assert (= (and b!1094880 res!730255) b!1094883))

(assert (= (and b!1094883 res!730252) b!1094874))

(assert (= (and b!1094874 res!730258) b!1094876))

(assert (= (and b!1094877 condMapEmpty!42121) mapIsEmpty!42121))

(assert (= (and b!1094877 (not condMapEmpty!42121)) mapNonEmpty!42121))

(get-info :version)

(assert (= (and mapNonEmpty!42121 ((_ is ValueCellFull!12746) mapValue!42121)) b!1094881))

(assert (= (and b!1094877 ((_ is ValueCellFull!12746) mapDefault!42121)) b!1094875))

(assert (= start!96492 b!1094877))

(declare-fun b_lambda!17589 () Bool)

(assert (=> (not b_lambda!17589) (not b!1094876)))

(declare-fun t!33749 () Bool)

(declare-fun tb!7779 () Bool)

(assert (=> (and start!96492 (= defaultEntry!882 defaultEntry!882) t!33749) tb!7779))

(declare-fun result!16085 () Bool)

(assert (=> tb!7779 (= result!16085 tp_is_empty!26911)))

(assert (=> b!1094876 t!33749))

(declare-fun b_and!36505 () Bool)

(assert (= b_and!36503 (and (=> t!33749 result!16085) b_and!36505)))

(declare-fun m!1015097 () Bool)

(assert (=> start!96492 m!1015097))

(declare-fun m!1015099 () Bool)

(assert (=> start!96492 m!1015099))

(declare-fun m!1015101 () Bool)

(assert (=> start!96492 m!1015101))

(declare-fun m!1015103 () Bool)

(assert (=> b!1094876 m!1015103))

(declare-fun m!1015105 () Bool)

(assert (=> b!1094876 m!1015105))

(declare-fun m!1015107 () Bool)

(assert (=> b!1094876 m!1015107))

(declare-fun m!1015109 () Bool)

(assert (=> b!1094876 m!1015109))

(declare-fun m!1015111 () Bool)

(assert (=> b!1094876 m!1015111))

(declare-fun m!1015113 () Bool)

(assert (=> b!1094876 m!1015113))

(declare-fun m!1015115 () Bool)

(assert (=> b!1094876 m!1015115))

(declare-fun m!1015117 () Bool)

(assert (=> b!1094876 m!1015117))

(declare-fun m!1015119 () Bool)

(assert (=> b!1094876 m!1015119))

(declare-fun m!1015121 () Bool)

(assert (=> b!1094876 m!1015121))

(declare-fun m!1015123 () Bool)

(assert (=> b!1094874 m!1015123))

(declare-fun m!1015125 () Bool)

(assert (=> b!1094883 m!1015125))

(declare-fun m!1015127 () Bool)

(assert (=> b!1094883 m!1015127))

(declare-fun m!1015129 () Bool)

(assert (=> b!1094880 m!1015129))

(declare-fun m!1015131 () Bool)

(assert (=> b!1094882 m!1015131))

(declare-fun m!1015133 () Bool)

(assert (=> b!1094878 m!1015133))

(declare-fun m!1015135 () Bool)

(assert (=> b!1094879 m!1015135))

(declare-fun m!1015137 () Bool)

(assert (=> mapNonEmpty!42121 m!1015137))

(check-sat (not b!1094883) tp_is_empty!26911 (not start!96492) (not b!1094874) (not b!1094878) (not b_next!22909) (not b!1094879) (not mapNonEmpty!42121) (not b!1094882) (not b_lambda!17589) (not b!1094876) b_and!36505)
(check-sat b_and!36505 (not b_next!22909))
