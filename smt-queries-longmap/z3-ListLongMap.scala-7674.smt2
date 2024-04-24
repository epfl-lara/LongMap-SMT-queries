; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96626 () Bool)

(assert start!96626)

(declare-fun b_free!22969 () Bool)

(declare-fun b_next!22969 () Bool)

(assert (=> start!96626 (= b_free!22969 (not b_next!22969))))

(declare-fun tp!80833 () Bool)

(declare-fun b_and!36611 () Bool)

(assert (=> start!96626 (= tp!80833 b_and!36611)))

(declare-fun b!1096823 () Bool)

(declare-fun res!731622 () Bool)

(declare-fun e!626272 () Bool)

(assert (=> b!1096823 (=> (not res!731622) (not e!626272))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70985 0))(
  ( (array!70986 (arr!34158 (Array (_ BitVec 32) (_ BitVec 64))) (size!34695 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70985)

(assert (=> b!1096823 (= res!731622 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34695 _keys!1070))))))

(declare-fun b!1096824 () Bool)

(declare-fun e!626268 () Bool)

(declare-fun tp_is_empty!27019 () Bool)

(assert (=> b!1096824 (= e!626268 tp_is_empty!27019)))

(declare-fun mapIsEmpty!42289 () Bool)

(declare-fun mapRes!42289 () Bool)

(assert (=> mapIsEmpty!42289 mapRes!42289))

(declare-fun b!1096825 () Bool)

(declare-fun e!626267 () Bool)

(declare-fun e!626269 () Bool)

(assert (=> b!1096825 (= e!626267 (and e!626269 mapRes!42289))))

(declare-fun condMapEmpty!42289 () Bool)

(declare-datatypes ((V!41153 0))(
  ( (V!41154 (val!13566 Int)) )
))
(declare-datatypes ((ValueCell!12800 0))(
  ( (ValueCellFull!12800 (v!16183 V!41153)) (EmptyCell!12800) )
))
(declare-datatypes ((array!70987 0))(
  ( (array!70988 (arr!34159 (Array (_ BitVec 32) ValueCell!12800)) (size!34696 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70987)

(declare-fun mapDefault!42289 () ValueCell!12800)

(assert (=> b!1096825 (= condMapEmpty!42289 (= (arr!34159 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12800)) mapDefault!42289)))))

(declare-fun b!1096826 () Bool)

(declare-fun res!731628 () Bool)

(assert (=> b!1096826 (=> (not res!731628) (not e!626272))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1096826 (= res!731628 (= (select (arr!34158 _keys!1070) i!650) k0!904))))

(declare-fun b!1096827 () Bool)

(declare-fun res!731627 () Bool)

(assert (=> b!1096827 (=> (not res!731627) (not e!626272))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70985 (_ BitVec 32)) Bool)

(assert (=> b!1096827 (= res!731627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096828 () Bool)

(declare-fun res!731621 () Bool)

(assert (=> b!1096828 (=> (not res!731621) (not e!626272))))

(declare-datatypes ((List!23857 0))(
  ( (Nil!23854) (Cons!23853 (h!25071 (_ BitVec 64)) (t!33864 List!23857)) )
))
(declare-fun arrayNoDuplicates!0 (array!70985 (_ BitVec 32) List!23857) Bool)

(assert (=> b!1096828 (= res!731621 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23854))))

(declare-fun b!1096829 () Bool)

(declare-fun e!626271 () Bool)

(assert (=> b!1096829 (= e!626272 e!626271)))

(declare-fun res!731624 () Bool)

(assert (=> b!1096829 (=> (not res!731624) (not e!626271))))

(declare-fun lt!490365 () array!70985)

(assert (=> b!1096829 (= res!731624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490365 mask!1414))))

(assert (=> b!1096829 (= lt!490365 (array!70986 (store (arr!34158 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34695 _keys!1070)))))

(declare-fun b!1096830 () Bool)

(assert (=> b!1096830 (= e!626269 tp_is_empty!27019)))

(declare-fun b!1096831 () Bool)

(declare-fun res!731626 () Bool)

(assert (=> b!1096831 (=> (not res!731626) (not e!626271))))

(assert (=> b!1096831 (= res!731626 (arrayNoDuplicates!0 lt!490365 #b00000000000000000000000000000000 Nil!23854))))

(declare-fun res!731625 () Bool)

(assert (=> start!96626 (=> (not res!731625) (not e!626272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96626 (= res!731625 (validMask!0 mask!1414))))

(assert (=> start!96626 e!626272))

(assert (=> start!96626 tp!80833))

(assert (=> start!96626 true))

(assert (=> start!96626 tp_is_empty!27019))

(declare-fun array_inv!26354 (array!70985) Bool)

(assert (=> start!96626 (array_inv!26354 _keys!1070)))

(declare-fun array_inv!26355 (array!70987) Bool)

(assert (=> start!96626 (and (array_inv!26355 _values!874) e!626267)))

(declare-fun b!1096832 () Bool)

(declare-fun res!731623 () Bool)

(assert (=> b!1096832 (=> (not res!731623) (not e!626272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096832 (= res!731623 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42289 () Bool)

(declare-fun tp!80834 () Bool)

(assert (=> mapNonEmpty!42289 (= mapRes!42289 (and tp!80834 e!626268))))

(declare-fun mapRest!42289 () (Array (_ BitVec 32) ValueCell!12800))

(declare-fun mapValue!42289 () ValueCell!12800)

(declare-fun mapKey!42289 () (_ BitVec 32))

(assert (=> mapNonEmpty!42289 (= (arr!34159 _values!874) (store mapRest!42289 mapKey!42289 mapValue!42289))))

(declare-fun b!1096833 () Bool)

(assert (=> b!1096833 (= e!626271 (not true))))

(declare-datatypes ((tuple2!17236 0))(
  ( (tuple2!17237 (_1!8629 (_ BitVec 64)) (_2!8629 V!41153)) )
))
(declare-datatypes ((List!23858 0))(
  ( (Nil!23855) (Cons!23854 (h!25072 tuple2!17236) (t!33865 List!23858)) )
))
(declare-datatypes ((ListLongMap!15213 0))(
  ( (ListLongMap!15214 (toList!7622 List!23858)) )
))
(declare-fun lt!490366 () ListLongMap!15213)

(declare-fun minValue!831 () V!41153)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41153)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4175 (array!70985 array!70987 (_ BitVec 32) (_ BitVec 32) V!41153 V!41153 (_ BitVec 32) Int) ListLongMap!15213)

(declare-fun dynLambda!2293 (Int (_ BitVec 64)) V!41153)

(assert (=> b!1096833 (= lt!490366 (getCurrentListMapNoExtraKeys!4175 lt!490365 (array!70988 (store (arr!34159 _values!874) i!650 (ValueCellFull!12800 (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34696 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490368 () ListLongMap!15213)

(assert (=> b!1096833 (= lt!490368 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096833 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36031 0))(
  ( (Unit!36032) )
))
(declare-fun lt!490367 () Unit!36031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70985 (_ BitVec 64) (_ BitVec 32)) Unit!36031)

(assert (=> b!1096833 (= lt!490367 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096834 () Bool)

(declare-fun res!731629 () Bool)

(assert (=> b!1096834 (=> (not res!731629) (not e!626272))))

(assert (=> b!1096834 (= res!731629 (and (= (size!34696 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34695 _keys!1070) (size!34696 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96626 res!731625) b!1096834))

(assert (= (and b!1096834 res!731629) b!1096827))

(assert (= (and b!1096827 res!731627) b!1096828))

(assert (= (and b!1096828 res!731621) b!1096823))

(assert (= (and b!1096823 res!731622) b!1096832))

(assert (= (and b!1096832 res!731623) b!1096826))

(assert (= (and b!1096826 res!731628) b!1096829))

(assert (= (and b!1096829 res!731624) b!1096831))

(assert (= (and b!1096831 res!731626) b!1096833))

(assert (= (and b!1096825 condMapEmpty!42289) mapIsEmpty!42289))

(assert (= (and b!1096825 (not condMapEmpty!42289)) mapNonEmpty!42289))

(get-info :version)

(assert (= (and mapNonEmpty!42289 ((_ is ValueCellFull!12800) mapValue!42289)) b!1096824))

(assert (= (and b!1096825 ((_ is ValueCellFull!12800) mapDefault!42289)) b!1096830))

(assert (= start!96626 b!1096825))

(declare-fun b_lambda!17637 () Bool)

(assert (=> (not b_lambda!17637) (not b!1096833)))

(declare-fun t!33863 () Bool)

(declare-fun tb!7827 () Bool)

(assert (=> (and start!96626 (= defaultEntry!882 defaultEntry!882) t!33863) tb!7827))

(declare-fun result!16185 () Bool)

(assert (=> tb!7827 (= result!16185 tp_is_empty!27019)))

(assert (=> b!1096833 t!33863))

(declare-fun b_and!36613 () Bool)

(assert (= b_and!36611 (and (=> t!33863 result!16185) b_and!36613)))

(declare-fun m!1016799 () Bool)

(assert (=> b!1096831 m!1016799))

(declare-fun m!1016801 () Bool)

(assert (=> b!1096828 m!1016801))

(declare-fun m!1016803 () Bool)

(assert (=> b!1096829 m!1016803))

(declare-fun m!1016805 () Bool)

(assert (=> b!1096829 m!1016805))

(declare-fun m!1016807 () Bool)

(assert (=> b!1096833 m!1016807))

(declare-fun m!1016809 () Bool)

(assert (=> b!1096833 m!1016809))

(declare-fun m!1016811 () Bool)

(assert (=> b!1096833 m!1016811))

(declare-fun m!1016813 () Bool)

(assert (=> b!1096833 m!1016813))

(declare-fun m!1016815 () Bool)

(assert (=> b!1096833 m!1016815))

(declare-fun m!1016817 () Bool)

(assert (=> b!1096833 m!1016817))

(declare-fun m!1016819 () Bool)

(assert (=> start!96626 m!1016819))

(declare-fun m!1016821 () Bool)

(assert (=> start!96626 m!1016821))

(declare-fun m!1016823 () Bool)

(assert (=> start!96626 m!1016823))

(declare-fun m!1016825 () Bool)

(assert (=> b!1096826 m!1016825))

(declare-fun m!1016827 () Bool)

(assert (=> mapNonEmpty!42289 m!1016827))

(declare-fun m!1016829 () Bool)

(assert (=> b!1096832 m!1016829))

(declare-fun m!1016831 () Bool)

(assert (=> b!1096827 m!1016831))

(check-sat (not start!96626) b_and!36613 (not mapNonEmpty!42289) (not b!1096831) (not b_lambda!17637) tp_is_empty!27019 (not b!1096827) (not b!1096832) (not b!1096829) (not b_next!22969) (not b!1096828) (not b!1096833))
(check-sat b_and!36613 (not b_next!22969))
