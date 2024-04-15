; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95752 () Bool)

(assert start!95752)

(declare-fun b_free!22411 () Bool)

(declare-fun b_next!22411 () Bool)

(assert (=> start!95752 (= b_free!22411 (not b_next!22411))))

(declare-fun tp!79082 () Bool)

(declare-fun b_and!35471 () Bool)

(assert (=> start!95752 (= tp!79082 b_and!35471)))

(declare-fun b!1082868 () Bool)

(declare-fun e!618788 () Bool)

(declare-fun tp_is_empty!26413 () Bool)

(assert (=> b!1082868 (= e!618788 tp_is_empty!26413)))

(declare-fun b!1082869 () Bool)

(declare-fun res!721878 () Bool)

(declare-fun e!618786 () Bool)

(assert (=> b!1082869 (=> (not res!721878) (not e!618786))))

(declare-datatypes ((array!69696 0))(
  ( (array!69697 (arr!33522 (Array (_ BitVec 32) (_ BitVec 64))) (size!34060 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69696)

(declare-datatypes ((List!23433 0))(
  ( (Nil!23430) (Cons!23429 (h!24638 (_ BitVec 64)) (t!32893 List!23433)) )
))
(declare-fun arrayNoDuplicates!0 (array!69696 (_ BitVec 32) List!23433) Bool)

(assert (=> b!1082869 (= res!721878 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23430))))

(declare-fun mapIsEmpty!41374 () Bool)

(declare-fun mapRes!41374 () Bool)

(assert (=> mapIsEmpty!41374 mapRes!41374))

(declare-fun b!1082870 () Bool)

(declare-fun res!721881 () Bool)

(assert (=> b!1082870 (=> (not res!721881) (not e!618786))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082870 (= res!721881 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34060 _keys!1070))))))

(declare-fun b!1082871 () Bool)

(declare-fun res!721883 () Bool)

(assert (=> b!1082871 (=> (not res!721883) (not e!618786))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082871 (= res!721883 (validKeyInArray!0 k0!904))))

(declare-fun b!1082872 () Bool)

(declare-fun e!618785 () Bool)

(declare-fun e!618787 () Bool)

(assert (=> b!1082872 (= e!618785 (and e!618787 mapRes!41374))))

(declare-fun condMapEmpty!41374 () Bool)

(declare-datatypes ((V!40345 0))(
  ( (V!40346 (val!13263 Int)) )
))
(declare-datatypes ((ValueCell!12497 0))(
  ( (ValueCellFull!12497 (v!15883 V!40345)) (EmptyCell!12497) )
))
(declare-datatypes ((array!69698 0))(
  ( (array!69699 (arr!33523 (Array (_ BitVec 32) ValueCell!12497)) (size!34061 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69698)

(declare-fun mapDefault!41374 () ValueCell!12497)

(assert (=> b!1082872 (= condMapEmpty!41374 (= (arr!33523 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12497)) mapDefault!41374)))))

(declare-fun b!1082873 () Bool)

(declare-fun e!618784 () Bool)

(assert (=> b!1082873 (= e!618786 e!618784)))

(declare-fun res!721877 () Bool)

(assert (=> b!1082873 (=> (not res!721877) (not e!618784))))

(declare-fun lt!479681 () array!69696)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69696 (_ BitVec 32)) Bool)

(assert (=> b!1082873 (= res!721877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479681 mask!1414))))

(assert (=> b!1082873 (= lt!479681 (array!69697 (store (arr!33522 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34060 _keys!1070)))))

(declare-fun res!721884 () Bool)

(assert (=> start!95752 (=> (not res!721884) (not e!618786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95752 (= res!721884 (validMask!0 mask!1414))))

(assert (=> start!95752 e!618786))

(assert (=> start!95752 tp!79082))

(assert (=> start!95752 true))

(assert (=> start!95752 tp_is_empty!26413))

(declare-fun array_inv!25916 (array!69696) Bool)

(assert (=> start!95752 (array_inv!25916 _keys!1070)))

(declare-fun array_inv!25917 (array!69698) Bool)

(assert (=> start!95752 (and (array_inv!25917 _values!874) e!618785)))

(declare-fun mapNonEmpty!41374 () Bool)

(declare-fun tp!79081 () Bool)

(assert (=> mapNonEmpty!41374 (= mapRes!41374 (and tp!79081 e!618788))))

(declare-fun mapKey!41374 () (_ BitVec 32))

(declare-fun mapRest!41374 () (Array (_ BitVec 32) ValueCell!12497))

(declare-fun mapValue!41374 () ValueCell!12497)

(assert (=> mapNonEmpty!41374 (= (arr!33523 _values!874) (store mapRest!41374 mapKey!41374 mapValue!41374))))

(declare-fun b!1082874 () Bool)

(declare-fun res!721882 () Bool)

(assert (=> b!1082874 (=> (not res!721882) (not e!618786))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1082874 (= res!721882 (and (= (size!34061 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34060 _keys!1070) (size!34061 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082875 () Bool)

(assert (=> b!1082875 (= e!618784 (not true))))

(declare-datatypes ((tuple2!16864 0))(
  ( (tuple2!16865 (_1!8443 (_ BitVec 64)) (_2!8443 V!40345)) )
))
(declare-datatypes ((List!23434 0))(
  ( (Nil!23431) (Cons!23430 (h!24639 tuple2!16864) (t!32894 List!23434)) )
))
(declare-datatypes ((ListLongMap!14833 0))(
  ( (ListLongMap!14834 (toList!7432 List!23434)) )
))
(declare-fun lt!479677 () ListLongMap!14833)

(declare-fun lt!479680 () ListLongMap!14833)

(assert (=> b!1082875 (and (= lt!479677 lt!479680) (= lt!479680 lt!479677))))

(declare-fun lt!479678 () ListLongMap!14833)

(declare-fun -!711 (ListLongMap!14833 (_ BitVec 64)) ListLongMap!14833)

(assert (=> b!1082875 (= lt!479680 (-!711 lt!479678 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40345)

(declare-datatypes ((Unit!35457 0))(
  ( (Unit!35458) )
))
(declare-fun lt!479679 () Unit!35457)

(declare-fun zeroValue!831 () V!40345)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!9 (array!69696 array!69698 (_ BitVec 32) (_ BitVec 32) V!40345 V!40345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35457)

(assert (=> b!1082875 (= lt!479679 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!9 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3995 (array!69696 array!69698 (_ BitVec 32) (_ BitVec 32) V!40345 V!40345 (_ BitVec 32) Int) ListLongMap!14833)

(declare-fun dynLambda!2066 (Int (_ BitVec 64)) V!40345)

(assert (=> b!1082875 (= lt!479677 (getCurrentListMapNoExtraKeys!3995 lt!479681 (array!69699 (store (arr!33523 _values!874) i!650 (ValueCellFull!12497 (dynLambda!2066 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34061 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082875 (= lt!479678 (getCurrentListMapNoExtraKeys!3995 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082875 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479676 () Unit!35457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69696 (_ BitVec 64) (_ BitVec 32)) Unit!35457)

(assert (=> b!1082875 (= lt!479676 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082876 () Bool)

(assert (=> b!1082876 (= e!618787 tp_is_empty!26413)))

(declare-fun b!1082877 () Bool)

(declare-fun res!721879 () Bool)

(assert (=> b!1082877 (=> (not res!721879) (not e!618786))))

(assert (=> b!1082877 (= res!721879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082878 () Bool)

(declare-fun res!721880 () Bool)

(assert (=> b!1082878 (=> (not res!721880) (not e!618784))))

(assert (=> b!1082878 (= res!721880 (arrayNoDuplicates!0 lt!479681 #b00000000000000000000000000000000 Nil!23430))))

(declare-fun b!1082879 () Bool)

(declare-fun res!721876 () Bool)

(assert (=> b!1082879 (=> (not res!721876) (not e!618786))))

(assert (=> b!1082879 (= res!721876 (= (select (arr!33522 _keys!1070) i!650) k0!904))))

(assert (= (and start!95752 res!721884) b!1082874))

(assert (= (and b!1082874 res!721882) b!1082877))

(assert (= (and b!1082877 res!721879) b!1082869))

(assert (= (and b!1082869 res!721878) b!1082870))

(assert (= (and b!1082870 res!721881) b!1082871))

(assert (= (and b!1082871 res!721883) b!1082879))

(assert (= (and b!1082879 res!721876) b!1082873))

(assert (= (and b!1082873 res!721877) b!1082878))

(assert (= (and b!1082878 res!721880) b!1082875))

(assert (= (and b!1082872 condMapEmpty!41374) mapIsEmpty!41374))

(assert (= (and b!1082872 (not condMapEmpty!41374)) mapNonEmpty!41374))

(get-info :version)

(assert (= (and mapNonEmpty!41374 ((_ is ValueCellFull!12497) mapValue!41374)) b!1082868))

(assert (= (and b!1082872 ((_ is ValueCellFull!12497) mapDefault!41374)) b!1082876))

(assert (= start!95752 b!1082872))

(declare-fun b_lambda!17059 () Bool)

(assert (=> (not b_lambda!17059) (not b!1082875)))

(declare-fun t!32892 () Bool)

(declare-fun tb!7281 () Bool)

(assert (=> (and start!95752 (= defaultEntry!882 defaultEntry!882) t!32892) tb!7281))

(declare-fun result!15089 () Bool)

(assert (=> tb!7281 (= result!15089 tp_is_empty!26413)))

(assert (=> b!1082875 t!32892))

(declare-fun b_and!35473 () Bool)

(assert (= b_and!35471 (and (=> t!32892 result!15089) b_and!35473)))

(declare-fun m!1000067 () Bool)

(assert (=> b!1082871 m!1000067))

(declare-fun m!1000069 () Bool)

(assert (=> b!1082877 m!1000069))

(declare-fun m!1000071 () Bool)

(assert (=> b!1082879 m!1000071))

(declare-fun m!1000073 () Bool)

(assert (=> b!1082873 m!1000073))

(declare-fun m!1000075 () Bool)

(assert (=> b!1082873 m!1000075))

(declare-fun m!1000077 () Bool)

(assert (=> mapNonEmpty!41374 m!1000077))

(declare-fun m!1000079 () Bool)

(assert (=> start!95752 m!1000079))

(declare-fun m!1000081 () Bool)

(assert (=> start!95752 m!1000081))

(declare-fun m!1000083 () Bool)

(assert (=> start!95752 m!1000083))

(declare-fun m!1000085 () Bool)

(assert (=> b!1082875 m!1000085))

(declare-fun m!1000087 () Bool)

(assert (=> b!1082875 m!1000087))

(declare-fun m!1000089 () Bool)

(assert (=> b!1082875 m!1000089))

(declare-fun m!1000091 () Bool)

(assert (=> b!1082875 m!1000091))

(declare-fun m!1000093 () Bool)

(assert (=> b!1082875 m!1000093))

(declare-fun m!1000095 () Bool)

(assert (=> b!1082875 m!1000095))

(declare-fun m!1000097 () Bool)

(assert (=> b!1082875 m!1000097))

(declare-fun m!1000099 () Bool)

(assert (=> b!1082875 m!1000099))

(declare-fun m!1000101 () Bool)

(assert (=> b!1082869 m!1000101))

(declare-fun m!1000103 () Bool)

(assert (=> b!1082878 m!1000103))

(check-sat (not b!1082873) tp_is_empty!26413 b_and!35473 (not b_lambda!17059) (not start!95752) (not b_next!22411) (not b!1082871) (not b!1082875) (not mapNonEmpty!41374) (not b!1082878) (not b!1082877) (not b!1082869))
(check-sat b_and!35473 (not b_next!22411))
