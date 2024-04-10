; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96066 () Bool)

(assert start!96066)

(declare-fun b_free!22719 () Bool)

(declare-fun b_next!22719 () Bool)

(assert (=> start!96066 (= b_free!22719 (not b_next!22719))))

(declare-fun tp!80005 () Bool)

(declare-fun b_and!36113 () Bool)

(assert (=> start!96066 (= tp!80005 b_and!36113)))

(declare-fun b!1089558 () Bool)

(declare-fun e!622320 () Bool)

(declare-fun e!622318 () Bool)

(declare-fun mapRes!41836 () Bool)

(assert (=> b!1089558 (= e!622320 (and e!622318 mapRes!41836))))

(declare-fun condMapEmpty!41836 () Bool)

(declare-datatypes ((V!40755 0))(
  ( (V!40756 (val!13417 Int)) )
))
(declare-datatypes ((ValueCell!12651 0))(
  ( (ValueCellFull!12651 (v!16038 V!40755)) (EmptyCell!12651) )
))
(declare-datatypes ((array!70365 0))(
  ( (array!70366 (arr!33856 (Array (_ BitVec 32) ValueCell!12651)) (size!34392 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70365)

(declare-fun mapDefault!41836 () ValueCell!12651)

(assert (=> b!1089558 (= condMapEmpty!41836 (= (arr!33856 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12651)) mapDefault!41836)))))

(declare-fun b!1089559 () Bool)

(declare-fun e!622322 () Bool)

(declare-fun e!622317 () Bool)

(assert (=> b!1089559 (= e!622322 (not e!622317))))

(declare-fun res!726792 () Bool)

(assert (=> b!1089559 (=> res!726792 e!622317)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089559 (= res!726792 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40755)

(declare-datatypes ((array!70367 0))(
  ( (array!70368 (arr!33857 (Array (_ BitVec 32) (_ BitVec 64))) (size!34393 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70367)

(declare-datatypes ((tuple2!17046 0))(
  ( (tuple2!17047 (_1!8534 (_ BitVec 64)) (_2!8534 V!40755)) )
))
(declare-datatypes ((List!23634 0))(
  ( (Nil!23631) (Cons!23630 (h!24839 tuple2!17046) (t!33411 List!23634)) )
))
(declare-datatypes ((ListLongMap!15015 0))(
  ( (ListLongMap!15016 (toList!7523 List!23634)) )
))
(declare-fun lt!485799 () ListLongMap!15015)

(declare-fun minValue!831 () V!40755)

(declare-fun getCurrentListMap!4293 (array!70367 array!70365 (_ BitVec 32) (_ BitVec 32) V!40755 V!40755 (_ BitVec 32) Int) ListLongMap!15015)

(assert (=> b!1089559 (= lt!485799 (getCurrentListMap!4293 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485790 () array!70365)

(declare-fun lt!485793 () array!70367)

(declare-fun lt!485795 () ListLongMap!15015)

(assert (=> b!1089559 (= lt!485795 (getCurrentListMap!4293 lt!485793 lt!485790 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485788 () ListLongMap!15015)

(declare-fun lt!485794 () ListLongMap!15015)

(assert (=> b!1089559 (and (= lt!485788 lt!485794) (= lt!485794 lt!485788))))

(declare-fun lt!485791 () ListLongMap!15015)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!848 (ListLongMap!15015 (_ BitVec 64)) ListLongMap!15015)

(assert (=> b!1089559 (= lt!485794 (-!848 lt!485791 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35862 0))(
  ( (Unit!35863) )
))
(declare-fun lt!485789 () Unit!35862)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!112 (array!70367 array!70365 (_ BitVec 32) (_ BitVec 32) V!40755 V!40755 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35862)

(assert (=> b!1089559 (= lt!485789 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!112 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4053 (array!70367 array!70365 (_ BitVec 32) (_ BitVec 32) V!40755 V!40755 (_ BitVec 32) Int) ListLongMap!15015)

(assert (=> b!1089559 (= lt!485788 (getCurrentListMapNoExtraKeys!4053 lt!485793 lt!485790 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2190 (Int (_ BitVec 64)) V!40755)

(assert (=> b!1089559 (= lt!485790 (array!70366 (store (arr!33856 _values!874) i!650 (ValueCellFull!12651 (dynLambda!2190 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34392 _values!874)))))

(assert (=> b!1089559 (= lt!485791 (getCurrentListMapNoExtraKeys!4053 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089559 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485798 () Unit!35862)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70367 (_ BitVec 64) (_ BitVec 32)) Unit!35862)

(assert (=> b!1089559 (= lt!485798 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089560 () Bool)

(declare-fun res!726798 () Bool)

(declare-fun e!622321 () Bool)

(assert (=> b!1089560 (=> (not res!726798) (not e!622321))))

(assert (=> b!1089560 (= res!726798 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34393 _keys!1070))))))

(declare-fun b!1089561 () Bool)

(declare-fun e!622319 () Bool)

(assert (=> b!1089561 (= e!622317 e!622319)))

(declare-fun res!726796 () Bool)

(assert (=> b!1089561 (=> res!726796 e!622319)))

(assert (=> b!1089561 (= res!726796 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!485792 () ListLongMap!15015)

(assert (=> b!1089561 (= lt!485795 lt!485792)))

(declare-fun lt!485797 () tuple2!17046)

(declare-fun +!3316 (ListLongMap!15015 tuple2!17046) ListLongMap!15015)

(assert (=> b!1089561 (= lt!485792 (+!3316 lt!485794 lt!485797))))

(declare-fun lt!485800 () ListLongMap!15015)

(assert (=> b!1089561 (= lt!485799 lt!485800)))

(assert (=> b!1089561 (= lt!485800 (+!3316 lt!485791 lt!485797))))

(assert (=> b!1089561 (= lt!485795 (+!3316 lt!485788 lt!485797))))

(assert (=> b!1089561 (= lt!485797 (tuple2!17047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089562 () Bool)

(declare-fun res!726789 () Bool)

(assert (=> b!1089562 (=> (not res!726789) (not e!622321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70367 (_ BitVec 32)) Bool)

(assert (=> b!1089562 (= res!726789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089563 () Bool)

(assert (=> b!1089563 (= e!622319 true)))

(assert (=> b!1089563 (= (-!848 lt!485800 k0!904) lt!485792)))

(declare-fun lt!485796 () Unit!35862)

(declare-fun addRemoveCommutativeForDiffKeys!75 (ListLongMap!15015 (_ BitVec 64) V!40755 (_ BitVec 64)) Unit!35862)

(assert (=> b!1089563 (= lt!485796 (addRemoveCommutativeForDiffKeys!75 lt!485791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun mapNonEmpty!41836 () Bool)

(declare-fun tp!80006 () Bool)

(declare-fun e!622316 () Bool)

(assert (=> mapNonEmpty!41836 (= mapRes!41836 (and tp!80006 e!622316))))

(declare-fun mapKey!41836 () (_ BitVec 32))

(declare-fun mapValue!41836 () ValueCell!12651)

(declare-fun mapRest!41836 () (Array (_ BitVec 32) ValueCell!12651))

(assert (=> mapNonEmpty!41836 (= (arr!33856 _values!874) (store mapRest!41836 mapKey!41836 mapValue!41836))))

(declare-fun b!1089564 () Bool)

(assert (=> b!1089564 (= e!622321 e!622322)))

(declare-fun res!726794 () Bool)

(assert (=> b!1089564 (=> (not res!726794) (not e!622322))))

(assert (=> b!1089564 (= res!726794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485793 mask!1414))))

(assert (=> b!1089564 (= lt!485793 (array!70368 (store (arr!33857 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34393 _keys!1070)))))

(declare-fun b!1089565 () Bool)

(declare-fun res!726790 () Bool)

(assert (=> b!1089565 (=> (not res!726790) (not e!622321))))

(assert (=> b!1089565 (= res!726790 (and (= (size!34392 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34393 _keys!1070) (size!34392 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089566 () Bool)

(declare-fun res!726793 () Bool)

(assert (=> b!1089566 (=> (not res!726793) (not e!622321))))

(declare-datatypes ((List!23635 0))(
  ( (Nil!23632) (Cons!23631 (h!24840 (_ BitVec 64)) (t!33412 List!23635)) )
))
(declare-fun arrayNoDuplicates!0 (array!70367 (_ BitVec 32) List!23635) Bool)

(assert (=> b!1089566 (= res!726793 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23632))))

(declare-fun b!1089567 () Bool)

(declare-fun res!726797 () Bool)

(assert (=> b!1089567 (=> (not res!726797) (not e!622321))))

(assert (=> b!1089567 (= res!726797 (= (select (arr!33857 _keys!1070) i!650) k0!904))))

(declare-fun res!726795 () Bool)

(assert (=> start!96066 (=> (not res!726795) (not e!622321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96066 (= res!726795 (validMask!0 mask!1414))))

(assert (=> start!96066 e!622321))

(assert (=> start!96066 tp!80005))

(assert (=> start!96066 true))

(declare-fun tp_is_empty!26721 () Bool)

(assert (=> start!96066 tp_is_empty!26721))

(declare-fun array_inv!26112 (array!70367) Bool)

(assert (=> start!96066 (array_inv!26112 _keys!1070)))

(declare-fun array_inv!26113 (array!70365) Bool)

(assert (=> start!96066 (and (array_inv!26113 _values!874) e!622320)))

(declare-fun mapIsEmpty!41836 () Bool)

(assert (=> mapIsEmpty!41836 mapRes!41836))

(declare-fun b!1089568 () Bool)

(declare-fun res!726788 () Bool)

(assert (=> b!1089568 (=> (not res!726788) (not e!622321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089568 (= res!726788 (validKeyInArray!0 k0!904))))

(declare-fun b!1089569 () Bool)

(assert (=> b!1089569 (= e!622316 tp_is_empty!26721)))

(declare-fun b!1089570 () Bool)

(declare-fun res!726791 () Bool)

(assert (=> b!1089570 (=> (not res!726791) (not e!622322))))

(assert (=> b!1089570 (= res!726791 (arrayNoDuplicates!0 lt!485793 #b00000000000000000000000000000000 Nil!23632))))

(declare-fun b!1089571 () Bool)

(assert (=> b!1089571 (= e!622318 tp_is_empty!26721)))

(assert (= (and start!96066 res!726795) b!1089565))

(assert (= (and b!1089565 res!726790) b!1089562))

(assert (= (and b!1089562 res!726789) b!1089566))

(assert (= (and b!1089566 res!726793) b!1089560))

(assert (= (and b!1089560 res!726798) b!1089568))

(assert (= (and b!1089568 res!726788) b!1089567))

(assert (= (and b!1089567 res!726797) b!1089564))

(assert (= (and b!1089564 res!726794) b!1089570))

(assert (= (and b!1089570 res!726791) b!1089559))

(assert (= (and b!1089559 (not res!726792)) b!1089561))

(assert (= (and b!1089561 (not res!726796)) b!1089563))

(assert (= (and b!1089558 condMapEmpty!41836) mapIsEmpty!41836))

(assert (= (and b!1089558 (not condMapEmpty!41836)) mapNonEmpty!41836))

(get-info :version)

(assert (= (and mapNonEmpty!41836 ((_ is ValueCellFull!12651) mapValue!41836)) b!1089569))

(assert (= (and b!1089558 ((_ is ValueCellFull!12651) mapDefault!41836)) b!1089571))

(assert (= start!96066 b!1089558))

(declare-fun b_lambda!17389 () Bool)

(assert (=> (not b_lambda!17389) (not b!1089559)))

(declare-fun t!33410 () Bool)

(declare-fun tb!7597 () Bool)

(assert (=> (and start!96066 (= defaultEntry!882 defaultEntry!882) t!33410) tb!7597))

(declare-fun result!15713 () Bool)

(assert (=> tb!7597 (= result!15713 tp_is_empty!26721)))

(assert (=> b!1089559 t!33410))

(declare-fun b_and!36115 () Bool)

(assert (= b_and!36113 (and (=> t!33410 result!15713) b_and!36115)))

(declare-fun m!1008827 () Bool)

(assert (=> b!1089562 m!1008827))

(declare-fun m!1008829 () Bool)

(assert (=> b!1089570 m!1008829))

(declare-fun m!1008831 () Bool)

(assert (=> b!1089563 m!1008831))

(declare-fun m!1008833 () Bool)

(assert (=> b!1089563 m!1008833))

(declare-fun m!1008835 () Bool)

(assert (=> b!1089567 m!1008835))

(declare-fun m!1008837 () Bool)

(assert (=> b!1089564 m!1008837))

(declare-fun m!1008839 () Bool)

(assert (=> b!1089564 m!1008839))

(declare-fun m!1008841 () Bool)

(assert (=> start!96066 m!1008841))

(declare-fun m!1008843 () Bool)

(assert (=> start!96066 m!1008843))

(declare-fun m!1008845 () Bool)

(assert (=> start!96066 m!1008845))

(declare-fun m!1008847 () Bool)

(assert (=> b!1089559 m!1008847))

(declare-fun m!1008849 () Bool)

(assert (=> b!1089559 m!1008849))

(declare-fun m!1008851 () Bool)

(assert (=> b!1089559 m!1008851))

(declare-fun m!1008853 () Bool)

(assert (=> b!1089559 m!1008853))

(declare-fun m!1008855 () Bool)

(assert (=> b!1089559 m!1008855))

(declare-fun m!1008857 () Bool)

(assert (=> b!1089559 m!1008857))

(declare-fun m!1008859 () Bool)

(assert (=> b!1089559 m!1008859))

(declare-fun m!1008861 () Bool)

(assert (=> b!1089559 m!1008861))

(declare-fun m!1008863 () Bool)

(assert (=> b!1089559 m!1008863))

(declare-fun m!1008865 () Bool)

(assert (=> b!1089559 m!1008865))

(declare-fun m!1008867 () Bool)

(assert (=> mapNonEmpty!41836 m!1008867))

(declare-fun m!1008869 () Bool)

(assert (=> b!1089566 m!1008869))

(declare-fun m!1008871 () Bool)

(assert (=> b!1089561 m!1008871))

(declare-fun m!1008873 () Bool)

(assert (=> b!1089561 m!1008873))

(declare-fun m!1008875 () Bool)

(assert (=> b!1089561 m!1008875))

(declare-fun m!1008877 () Bool)

(assert (=> b!1089568 m!1008877))

(check-sat (not start!96066) (not b!1089566) (not b!1089561) (not b_next!22719) tp_is_empty!26721 (not b!1089559) (not b_lambda!17389) (not b!1089563) (not b!1089562) (not mapNonEmpty!41836) (not b!1089570) (not b!1089564) (not b!1089568) b_and!36115)
(check-sat b_and!36115 (not b_next!22719))
