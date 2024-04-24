; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96674 () Bool)

(assert start!96674)

(declare-fun b_free!23017 () Bool)

(declare-fun b_next!23017 () Bool)

(assert (=> start!96674 (= b_free!23017 (not b_next!23017))))

(declare-fun tp!80977 () Bool)

(declare-fun b_and!36707 () Bool)

(assert (=> start!96674 (= tp!80977 b_and!36707)))

(declare-fun res!732277 () Bool)

(declare-fun e!626703 () Bool)

(assert (=> start!96674 (=> (not res!732277) (not e!626703))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96674 (= res!732277 (validMask!0 mask!1414))))

(assert (=> start!96674 e!626703))

(assert (=> start!96674 tp!80977))

(assert (=> start!96674 true))

(declare-fun tp_is_empty!27067 () Bool)

(assert (=> start!96674 tp_is_empty!27067))

(declare-datatypes ((array!71075 0))(
  ( (array!71076 (arr!34203 (Array (_ BitVec 32) (_ BitVec 64))) (size!34740 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71075)

(declare-fun array_inv!26386 (array!71075) Bool)

(assert (=> start!96674 (array_inv!26386 _keys!1070)))

(declare-datatypes ((V!41217 0))(
  ( (V!41218 (val!13590 Int)) )
))
(declare-datatypes ((ValueCell!12824 0))(
  ( (ValueCellFull!12824 (v!16207 V!41217)) (EmptyCell!12824) )
))
(declare-datatypes ((array!71077 0))(
  ( (array!71078 (arr!34204 (Array (_ BitVec 32) ValueCell!12824)) (size!34741 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71077)

(declare-fun e!626702 () Bool)

(declare-fun array_inv!26387 (array!71077) Bool)

(assert (=> start!96674 (and (array_inv!26387 _values!874) e!626702)))

(declare-fun b!1097735 () Bool)

(declare-fun res!732269 () Bool)

(assert (=> b!1097735 (=> (not res!732269) (not e!626703))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097735 (= res!732269 (and (= (size!34741 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34740 _keys!1070) (size!34741 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097736 () Bool)

(declare-fun res!732273 () Bool)

(declare-fun e!626699 () Bool)

(assert (=> b!1097736 (=> (not res!732273) (not e!626699))))

(declare-fun lt!490656 () array!71075)

(declare-datatypes ((List!23889 0))(
  ( (Nil!23886) (Cons!23885 (h!25103 (_ BitVec 64)) (t!33944 List!23889)) )
))
(declare-fun arrayNoDuplicates!0 (array!71075 (_ BitVec 32) List!23889) Bool)

(assert (=> b!1097736 (= res!732273 (arrayNoDuplicates!0 lt!490656 #b00000000000000000000000000000000 Nil!23886))))

(declare-fun b!1097737 () Bool)

(declare-fun res!732271 () Bool)

(assert (=> b!1097737 (=> (not res!732271) (not e!626703))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097737 (= res!732271 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34740 _keys!1070))))))

(declare-fun b!1097738 () Bool)

(assert (=> b!1097738 (= e!626703 e!626699)))

(declare-fun res!732270 () Bool)

(assert (=> b!1097738 (=> (not res!732270) (not e!626699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71075 (_ BitVec 32)) Bool)

(assert (=> b!1097738 (= res!732270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490656 mask!1414))))

(assert (=> b!1097738 (= lt!490656 (array!71076 (store (arr!34203 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34740 _keys!1070)))))

(declare-fun b!1097739 () Bool)

(declare-fun res!732272 () Bool)

(assert (=> b!1097739 (=> (not res!732272) (not e!626703))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097739 (= res!732272 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42361 () Bool)

(declare-fun mapRes!42361 () Bool)

(assert (=> mapIsEmpty!42361 mapRes!42361))

(declare-fun b!1097740 () Bool)

(declare-fun e!626701 () Bool)

(assert (=> b!1097740 (= e!626701 tp_is_empty!27067)))

(declare-fun mapNonEmpty!42361 () Bool)

(declare-fun tp!80978 () Bool)

(declare-fun e!626700 () Bool)

(assert (=> mapNonEmpty!42361 (= mapRes!42361 (and tp!80978 e!626700))))

(declare-fun mapKey!42361 () (_ BitVec 32))

(declare-fun mapRest!42361 () (Array (_ BitVec 32) ValueCell!12824))

(declare-fun mapValue!42361 () ValueCell!12824)

(assert (=> mapNonEmpty!42361 (= (arr!34204 _values!874) (store mapRest!42361 mapKey!42361 mapValue!42361))))

(declare-fun b!1097741 () Bool)

(assert (=> b!1097741 (= e!626702 (and e!626701 mapRes!42361))))

(declare-fun condMapEmpty!42361 () Bool)

(declare-fun mapDefault!42361 () ValueCell!12824)

(assert (=> b!1097741 (= condMapEmpty!42361 (= (arr!34204 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12824)) mapDefault!42361)))))

(declare-fun b!1097742 () Bool)

(declare-fun res!732275 () Bool)

(assert (=> b!1097742 (=> (not res!732275) (not e!626703))))

(assert (=> b!1097742 (= res!732275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097743 () Bool)

(declare-fun res!732274 () Bool)

(assert (=> b!1097743 (=> (not res!732274) (not e!626703))))

(assert (=> b!1097743 (= res!732274 (= (select (arr!34203 _keys!1070) i!650) k0!904))))

(declare-fun b!1097744 () Bool)

(assert (=> b!1097744 (= e!626699 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41217)

(declare-datatypes ((tuple2!17266 0))(
  ( (tuple2!17267 (_1!8644 (_ BitVec 64)) (_2!8644 V!41217)) )
))
(declare-datatypes ((List!23890 0))(
  ( (Nil!23887) (Cons!23886 (h!25104 tuple2!17266) (t!33945 List!23890)) )
))
(declare-datatypes ((ListLongMap!15243 0))(
  ( (ListLongMap!15244 (toList!7637 List!23890)) )
))
(declare-fun lt!490655 () ListLongMap!15243)

(declare-fun zeroValue!831 () V!41217)

(declare-fun getCurrentListMapNoExtraKeys!4190 (array!71075 array!71077 (_ BitVec 32) (_ BitVec 32) V!41217 V!41217 (_ BitVec 32) Int) ListLongMap!15243)

(declare-fun dynLambda!2308 (Int (_ BitVec 64)) V!41217)

(assert (=> b!1097744 (= lt!490655 (getCurrentListMapNoExtraKeys!4190 lt!490656 (array!71078 (store (arr!34204 _values!874) i!650 (ValueCellFull!12824 (dynLambda!2308 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34741 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490653 () ListLongMap!15243)

(assert (=> b!1097744 (= lt!490653 (getCurrentListMapNoExtraKeys!4190 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097744 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36061 0))(
  ( (Unit!36062) )
))
(declare-fun lt!490654 () Unit!36061)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71075 (_ BitVec 64) (_ BitVec 32)) Unit!36061)

(assert (=> b!1097744 (= lt!490654 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097745 () Bool)

(declare-fun res!732276 () Bool)

(assert (=> b!1097745 (=> (not res!732276) (not e!626703))))

(assert (=> b!1097745 (= res!732276 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23886))))

(declare-fun b!1097746 () Bool)

(assert (=> b!1097746 (= e!626700 tp_is_empty!27067)))

(assert (= (and start!96674 res!732277) b!1097735))

(assert (= (and b!1097735 res!732269) b!1097742))

(assert (= (and b!1097742 res!732275) b!1097745))

(assert (= (and b!1097745 res!732276) b!1097737))

(assert (= (and b!1097737 res!732271) b!1097739))

(assert (= (and b!1097739 res!732272) b!1097743))

(assert (= (and b!1097743 res!732274) b!1097738))

(assert (= (and b!1097738 res!732270) b!1097736))

(assert (= (and b!1097736 res!732273) b!1097744))

(assert (= (and b!1097741 condMapEmpty!42361) mapIsEmpty!42361))

(assert (= (and b!1097741 (not condMapEmpty!42361)) mapNonEmpty!42361))

(get-info :version)

(assert (= (and mapNonEmpty!42361 ((_ is ValueCellFull!12824) mapValue!42361)) b!1097746))

(assert (= (and b!1097741 ((_ is ValueCellFull!12824) mapDefault!42361)) b!1097740))

(assert (= start!96674 b!1097741))

(declare-fun b_lambda!17685 () Bool)

(assert (=> (not b_lambda!17685) (not b!1097744)))

(declare-fun t!33943 () Bool)

(declare-fun tb!7875 () Bool)

(assert (=> (and start!96674 (= defaultEntry!882 defaultEntry!882) t!33943) tb!7875))

(declare-fun result!16281 () Bool)

(assert (=> tb!7875 (= result!16281 tp_is_empty!27067)))

(assert (=> b!1097744 t!33943))

(declare-fun b_and!36709 () Bool)

(assert (= b_and!36707 (and (=> t!33943 result!16281) b_and!36709)))

(declare-fun m!1017615 () Bool)

(assert (=> b!1097742 m!1017615))

(declare-fun m!1017617 () Bool)

(assert (=> b!1097743 m!1017617))

(declare-fun m!1017619 () Bool)

(assert (=> b!1097739 m!1017619))

(declare-fun m!1017621 () Bool)

(assert (=> start!96674 m!1017621))

(declare-fun m!1017623 () Bool)

(assert (=> start!96674 m!1017623))

(declare-fun m!1017625 () Bool)

(assert (=> start!96674 m!1017625))

(declare-fun m!1017627 () Bool)

(assert (=> mapNonEmpty!42361 m!1017627))

(declare-fun m!1017629 () Bool)

(assert (=> b!1097736 m!1017629))

(declare-fun m!1017631 () Bool)

(assert (=> b!1097738 m!1017631))

(declare-fun m!1017633 () Bool)

(assert (=> b!1097738 m!1017633))

(declare-fun m!1017635 () Bool)

(assert (=> b!1097745 m!1017635))

(declare-fun m!1017637 () Bool)

(assert (=> b!1097744 m!1017637))

(declare-fun m!1017639 () Bool)

(assert (=> b!1097744 m!1017639))

(declare-fun m!1017641 () Bool)

(assert (=> b!1097744 m!1017641))

(declare-fun m!1017643 () Bool)

(assert (=> b!1097744 m!1017643))

(declare-fun m!1017645 () Bool)

(assert (=> b!1097744 m!1017645))

(declare-fun m!1017647 () Bool)

(assert (=> b!1097744 m!1017647))

(check-sat (not b!1097736) b_and!36709 (not b!1097738) tp_is_empty!27067 (not start!96674) (not mapNonEmpty!42361) (not b!1097745) (not b!1097744) (not b_lambda!17685) (not b_next!23017) (not b!1097739) (not b!1097742))
(check-sat b_and!36709 (not b_next!23017))
