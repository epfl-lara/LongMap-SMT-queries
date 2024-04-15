; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96402 () Bool)

(assert start!96402)

(declare-fun b_free!22987 () Bool)

(declare-fun b_next!22987 () Bool)

(assert (=> start!96402 (= b_free!22987 (not b_next!22987))))

(declare-fun tp!80888 () Bool)

(declare-fun b_and!36611 () Bool)

(assert (=> start!96402 (= tp!80888 b_and!36611)))

(declare-fun b!1095685 () Bool)

(declare-fun res!731279 () Bool)

(declare-fun e!625486 () Bool)

(assert (=> b!1095685 (=> (not res!731279) (not e!625486))))

(declare-datatypes ((array!70900 0))(
  ( (array!70901 (arr!34122 (Array (_ BitVec 32) (_ BitVec 64))) (size!34660 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70900)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70900 (_ BitVec 32)) Bool)

(assert (=> b!1095685 (= res!731279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095686 () Bool)

(declare-fun res!731277 () Bool)

(assert (=> b!1095686 (=> (not res!731277) (not e!625486))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095686 (= res!731277 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34660 _keys!1070))))))

(declare-fun res!731273 () Bool)

(assert (=> start!96402 (=> (not res!731273) (not e!625486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96402 (= res!731273 (validMask!0 mask!1414))))

(assert (=> start!96402 e!625486))

(assert (=> start!96402 tp!80888))

(assert (=> start!96402 true))

(declare-fun tp_is_empty!27037 () Bool)

(assert (=> start!96402 tp_is_empty!27037))

(declare-fun array_inv!26330 (array!70900) Bool)

(assert (=> start!96402 (array_inv!26330 _keys!1070)))

(declare-datatypes ((V!41177 0))(
  ( (V!41178 (val!13575 Int)) )
))
(declare-datatypes ((ValueCell!12809 0))(
  ( (ValueCellFull!12809 (v!16195 V!41177)) (EmptyCell!12809) )
))
(declare-datatypes ((array!70902 0))(
  ( (array!70903 (arr!34123 (Array (_ BitVec 32) ValueCell!12809)) (size!34661 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70902)

(declare-fun e!625481 () Bool)

(declare-fun array_inv!26331 (array!70902) Bool)

(assert (=> start!96402 (and (array_inv!26331 _values!874) e!625481)))

(declare-fun b!1095687 () Bool)

(declare-fun e!625483 () Bool)

(assert (=> b!1095687 (= e!625483 tp_is_empty!27037)))

(declare-fun b!1095688 () Bool)

(declare-fun e!625482 () Bool)

(assert (=> b!1095688 (= e!625486 e!625482)))

(declare-fun res!731274 () Bool)

(assert (=> b!1095688 (=> (not res!731274) (not e!625482))))

(declare-fun lt!489758 () array!70900)

(assert (=> b!1095688 (= res!731274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489758 mask!1414))))

(assert (=> b!1095688 (= lt!489758 (array!70901 (store (arr!34122 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34660 _keys!1070)))))

(declare-fun b!1095689 () Bool)

(declare-fun res!731278 () Bool)

(assert (=> b!1095689 (=> (not res!731278) (not e!625482))))

(declare-datatypes ((List!23891 0))(
  ( (Nil!23888) (Cons!23887 (h!25096 (_ BitVec 64)) (t!33915 List!23891)) )
))
(declare-fun arrayNoDuplicates!0 (array!70900 (_ BitVec 32) List!23891) Bool)

(assert (=> b!1095689 (= res!731278 (arrayNoDuplicates!0 lt!489758 #b00000000000000000000000000000000 Nil!23888))))

(declare-fun mapNonEmpty!42316 () Bool)

(declare-fun mapRes!42316 () Bool)

(declare-fun tp!80887 () Bool)

(declare-fun e!625485 () Bool)

(assert (=> mapNonEmpty!42316 (= mapRes!42316 (and tp!80887 e!625485))))

(declare-fun mapValue!42316 () ValueCell!12809)

(declare-fun mapRest!42316 () (Array (_ BitVec 32) ValueCell!12809))

(declare-fun mapKey!42316 () (_ BitVec 32))

(assert (=> mapNonEmpty!42316 (= (arr!34123 _values!874) (store mapRest!42316 mapKey!42316 mapValue!42316))))

(declare-fun b!1095690 () Bool)

(declare-fun res!731280 () Bool)

(assert (=> b!1095690 (=> (not res!731280) (not e!625486))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095690 (= res!731280 (and (= (size!34661 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34660 _keys!1070) (size!34661 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095691 () Bool)

(assert (=> b!1095691 (= e!625482 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41177)

(declare-datatypes ((tuple2!17296 0))(
  ( (tuple2!17297 (_1!8659 (_ BitVec 64)) (_2!8659 V!41177)) )
))
(declare-datatypes ((List!23892 0))(
  ( (Nil!23889) (Cons!23888 (h!25097 tuple2!17296) (t!33916 List!23892)) )
))
(declare-datatypes ((ListLongMap!15265 0))(
  ( (ListLongMap!15266 (toList!7648 List!23892)) )
))
(declare-fun lt!489759 () ListLongMap!15265)

(declare-fun zeroValue!831 () V!41177)

(declare-fun getCurrentListMapNoExtraKeys!4181 (array!70900 array!70902 (_ BitVec 32) (_ BitVec 32) V!41177 V!41177 (_ BitVec 32) Int) ListLongMap!15265)

(declare-fun dynLambda!2250 (Int (_ BitVec 64)) V!41177)

(assert (=> b!1095691 (= lt!489759 (getCurrentListMapNoExtraKeys!4181 lt!489758 (array!70903 (store (arr!34123 _values!874) i!650 (ValueCellFull!12809 (dynLambda!2250 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34661 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489760 () ListLongMap!15265)

(assert (=> b!1095691 (= lt!489760 (getCurrentListMapNoExtraKeys!4181 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095691 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35883 0))(
  ( (Unit!35884) )
))
(declare-fun lt!489761 () Unit!35883)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70900 (_ BitVec 64) (_ BitVec 32)) Unit!35883)

(assert (=> b!1095691 (= lt!489761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095692 () Bool)

(assert (=> b!1095692 (= e!625485 tp_is_empty!27037)))

(declare-fun b!1095693 () Bool)

(declare-fun res!731281 () Bool)

(assert (=> b!1095693 (=> (not res!731281) (not e!625486))))

(assert (=> b!1095693 (= res!731281 (= (select (arr!34122 _keys!1070) i!650) k0!904))))

(declare-fun b!1095694 () Bool)

(declare-fun res!731276 () Bool)

(assert (=> b!1095694 (=> (not res!731276) (not e!625486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095694 (= res!731276 (validKeyInArray!0 k0!904))))

(declare-fun b!1095695 () Bool)

(declare-fun res!731275 () Bool)

(assert (=> b!1095695 (=> (not res!731275) (not e!625486))))

(assert (=> b!1095695 (= res!731275 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23888))))

(declare-fun b!1095696 () Bool)

(assert (=> b!1095696 (= e!625481 (and e!625483 mapRes!42316))))

(declare-fun condMapEmpty!42316 () Bool)

(declare-fun mapDefault!42316 () ValueCell!12809)

(assert (=> b!1095696 (= condMapEmpty!42316 (= (arr!34123 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12809)) mapDefault!42316)))))

(declare-fun mapIsEmpty!42316 () Bool)

(assert (=> mapIsEmpty!42316 mapRes!42316))

(assert (= (and start!96402 res!731273) b!1095690))

(assert (= (and b!1095690 res!731280) b!1095685))

(assert (= (and b!1095685 res!731279) b!1095695))

(assert (= (and b!1095695 res!731275) b!1095686))

(assert (= (and b!1095686 res!731277) b!1095694))

(assert (= (and b!1095694 res!731276) b!1095693))

(assert (= (and b!1095693 res!731281) b!1095688))

(assert (= (and b!1095688 res!731274) b!1095689))

(assert (= (and b!1095689 res!731278) b!1095691))

(assert (= (and b!1095696 condMapEmpty!42316) mapIsEmpty!42316))

(assert (= (and b!1095696 (not condMapEmpty!42316)) mapNonEmpty!42316))

(get-info :version)

(assert (= (and mapNonEmpty!42316 ((_ is ValueCellFull!12809) mapValue!42316)) b!1095692))

(assert (= (and b!1095696 ((_ is ValueCellFull!12809) mapDefault!42316)) b!1095687))

(assert (= start!96402 b!1095696))

(declare-fun b_lambda!17623 () Bool)

(assert (=> (not b_lambda!17623) (not b!1095691)))

(declare-fun t!33914 () Bool)

(declare-fun tb!7845 () Bool)

(assert (=> (and start!96402 (= defaultEntry!882 defaultEntry!882) t!33914) tb!7845))

(declare-fun result!16221 () Bool)

(assert (=> tb!7845 (= result!16221 tp_is_empty!27037)))

(assert (=> b!1095691 t!33914))

(declare-fun b_and!36613 () Bool)

(assert (= b_and!36611 (and (=> t!33914 result!16221) b_and!36613)))

(declare-fun m!1014807 () Bool)

(assert (=> b!1095689 m!1014807))

(declare-fun m!1014809 () Bool)

(assert (=> b!1095688 m!1014809))

(declare-fun m!1014811 () Bool)

(assert (=> b!1095688 m!1014811))

(declare-fun m!1014813 () Bool)

(assert (=> b!1095693 m!1014813))

(declare-fun m!1014815 () Bool)

(assert (=> b!1095694 m!1014815))

(declare-fun m!1014817 () Bool)

(assert (=> mapNonEmpty!42316 m!1014817))

(declare-fun m!1014819 () Bool)

(assert (=> b!1095695 m!1014819))

(declare-fun m!1014821 () Bool)

(assert (=> b!1095691 m!1014821))

(declare-fun m!1014823 () Bool)

(assert (=> b!1095691 m!1014823))

(declare-fun m!1014825 () Bool)

(assert (=> b!1095691 m!1014825))

(declare-fun m!1014827 () Bool)

(assert (=> b!1095691 m!1014827))

(declare-fun m!1014829 () Bool)

(assert (=> b!1095691 m!1014829))

(declare-fun m!1014831 () Bool)

(assert (=> b!1095691 m!1014831))

(declare-fun m!1014833 () Bool)

(assert (=> start!96402 m!1014833))

(declare-fun m!1014835 () Bool)

(assert (=> start!96402 m!1014835))

(declare-fun m!1014837 () Bool)

(assert (=> start!96402 m!1014837))

(declare-fun m!1014839 () Bool)

(assert (=> b!1095685 m!1014839))

(check-sat (not b!1095689) (not mapNonEmpty!42316) (not b!1095685) b_and!36613 (not b_next!22987) (not b_lambda!17623) (not b!1095695) (not b!1095688) (not start!96402) tp_is_empty!27037 (not b!1095694) (not b!1095691))
(check-sat b_and!36613 (not b_next!22987))
