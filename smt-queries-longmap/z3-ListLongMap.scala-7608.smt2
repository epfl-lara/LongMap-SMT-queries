; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96204 () Bool)

(assert start!96204)

(declare-fun b_free!22621 () Bool)

(declare-fun b_next!22621 () Bool)

(assert (=> start!96204 (= b_free!22621 (not b_next!22621))))

(declare-fun tp!79711 () Bool)

(declare-fun b_and!35927 () Bool)

(assert (=> start!96204 (= tp!79711 b_and!35927)))

(declare-fun b!1088729 () Bool)

(declare-fun e!621996 () Bool)

(assert (=> b!1088729 (= e!621996 true)))

(declare-datatypes ((V!40625 0))(
  ( (V!40626 (val!13368 Int)) )
))
(declare-datatypes ((tuple2!16976 0))(
  ( (tuple2!16977 (_1!8499 (_ BitVec 64)) (_2!8499 V!40625)) )
))
(declare-datatypes ((List!23569 0))(
  ( (Nil!23566) (Cons!23565 (h!24783 tuple2!16976) (t!33240 List!23569)) )
))
(declare-datatypes ((ListLongMap!14953 0))(
  ( (ListLongMap!14954 (toList!7492 List!23569)) )
))
(declare-fun lt!484404 () ListLongMap!14953)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!484394 () ListLongMap!14953)

(declare-fun -!804 (ListLongMap!14953 (_ BitVec 64)) ListLongMap!14953)

(assert (=> b!1088729 (= (-!804 lt!484404 k0!904) lt!484394)))

(declare-datatypes ((Unit!35775 0))(
  ( (Unit!35776) )
))
(declare-fun lt!484393 () Unit!35775)

(declare-fun lt!484401 () ListLongMap!14953)

(declare-fun zeroValue!831 () V!40625)

(declare-fun addRemoveCommutativeForDiffKeys!46 (ListLongMap!14953 (_ BitVec 64) V!40625 (_ BitVec 64)) Unit!35775)

(assert (=> b!1088729 (= lt!484393 (addRemoveCommutativeForDiffKeys!46 lt!484401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun mapNonEmpty!41689 () Bool)

(declare-fun mapRes!41689 () Bool)

(declare-fun tp!79712 () Bool)

(declare-fun e!621998 () Bool)

(assert (=> mapNonEmpty!41689 (= mapRes!41689 (and tp!79712 e!621998))))

(declare-datatypes ((ValueCell!12602 0))(
  ( (ValueCellFull!12602 (v!15985 V!40625)) (EmptyCell!12602) )
))
(declare-datatypes ((array!70211 0))(
  ( (array!70212 (arr!33773 (Array (_ BitVec 32) ValueCell!12602)) (size!34310 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70211)

(declare-fun mapValue!41689 () ValueCell!12602)

(declare-fun mapRest!41689 () (Array (_ BitVec 32) ValueCell!12602))

(declare-fun mapKey!41689 () (_ BitVec 32))

(assert (=> mapNonEmpty!41689 (= (arr!33773 _values!874) (store mapRest!41689 mapKey!41689 mapValue!41689))))

(declare-fun b!1088730 () Bool)

(declare-fun tp_is_empty!26623 () Bool)

(assert (=> b!1088730 (= e!621998 tp_is_empty!26623)))

(declare-fun b!1088731 () Bool)

(declare-fun e!622001 () Bool)

(declare-fun e!621997 () Bool)

(assert (=> b!1088731 (= e!622001 e!621997)))

(declare-fun res!725700 () Bool)

(assert (=> b!1088731 (=> (not res!725700) (not e!621997))))

(declare-datatypes ((array!70213 0))(
  ( (array!70214 (arr!33774 (Array (_ BitVec 32) (_ BitVec 64))) (size!34311 (_ BitVec 32))) )
))
(declare-fun lt!484400 () array!70213)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70213 (_ BitVec 32)) Bool)

(assert (=> b!1088731 (= res!725700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484400 mask!1414))))

(declare-fun _keys!1070 () array!70213)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088731 (= lt!484400 (array!70214 (store (arr!33774 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34311 _keys!1070)))))

(declare-fun mapIsEmpty!41689 () Bool)

(assert (=> mapIsEmpty!41689 mapRes!41689))

(declare-fun b!1088732 () Bool)

(declare-fun res!725694 () Bool)

(assert (=> b!1088732 (=> (not res!725694) (not e!621997))))

(declare-datatypes ((List!23570 0))(
  ( (Nil!23567) (Cons!23566 (h!24784 (_ BitVec 64)) (t!33241 List!23570)) )
))
(declare-fun arrayNoDuplicates!0 (array!70213 (_ BitVec 32) List!23570) Bool)

(assert (=> b!1088732 (= res!725694 (arrayNoDuplicates!0 lt!484400 #b00000000000000000000000000000000 Nil!23567))))

(declare-fun b!1088733 () Bool)

(declare-fun e!621994 () Bool)

(assert (=> b!1088733 (= e!621994 tp_is_empty!26623)))

(declare-fun b!1088734 () Bool)

(declare-fun res!725703 () Bool)

(assert (=> b!1088734 (=> (not res!725703) (not e!622001))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088734 (= res!725703 (and (= (size!34310 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34311 _keys!1070) (size!34310 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!725701 () Bool)

(assert (=> start!96204 (=> (not res!725701) (not e!622001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96204 (= res!725701 (validMask!0 mask!1414))))

(assert (=> start!96204 e!622001))

(assert (=> start!96204 tp!79711))

(assert (=> start!96204 true))

(assert (=> start!96204 tp_is_empty!26623))

(declare-fun array_inv!26104 (array!70213) Bool)

(assert (=> start!96204 (array_inv!26104 _keys!1070)))

(declare-fun e!622000 () Bool)

(declare-fun array_inv!26105 (array!70211) Bool)

(assert (=> start!96204 (and (array_inv!26105 _values!874) e!622000)))

(declare-fun b!1088735 () Bool)

(assert (=> b!1088735 (= e!622000 (and e!621994 mapRes!41689))))

(declare-fun condMapEmpty!41689 () Bool)

(declare-fun mapDefault!41689 () ValueCell!12602)

(assert (=> b!1088735 (= condMapEmpty!41689 (= (arr!33773 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12602)) mapDefault!41689)))))

(declare-fun b!1088736 () Bool)

(declare-fun res!725698 () Bool)

(assert (=> b!1088736 (=> (not res!725698) (not e!622001))))

(assert (=> b!1088736 (= res!725698 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34311 _keys!1070))))))

(declare-fun b!1088737 () Bool)

(declare-fun e!621999 () Bool)

(assert (=> b!1088737 (= e!621999 e!621996)))

(declare-fun res!725702 () Bool)

(assert (=> b!1088737 (=> res!725702 e!621996)))

(assert (=> b!1088737 (= res!725702 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484399 () ListLongMap!14953)

(assert (=> b!1088737 (= lt!484399 lt!484394)))

(declare-fun lt!484402 () ListLongMap!14953)

(declare-fun lt!484398 () tuple2!16976)

(declare-fun +!3315 (ListLongMap!14953 tuple2!16976) ListLongMap!14953)

(assert (=> b!1088737 (= lt!484394 (+!3315 lt!484402 lt!484398))))

(declare-fun lt!484395 () ListLongMap!14953)

(assert (=> b!1088737 (= lt!484395 lt!484404)))

(assert (=> b!1088737 (= lt!484404 (+!3315 lt!484401 lt!484398))))

(declare-fun lt!484397 () ListLongMap!14953)

(assert (=> b!1088737 (= lt!484399 (+!3315 lt!484397 lt!484398))))

(assert (=> b!1088737 (= lt!484398 (tuple2!16977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088738 () Bool)

(declare-fun res!725697 () Bool)

(assert (=> b!1088738 (=> (not res!725697) (not e!622001))))

(assert (=> b!1088738 (= res!725697 (= (select (arr!33774 _keys!1070) i!650) k0!904))))

(declare-fun b!1088739 () Bool)

(declare-fun res!725695 () Bool)

(assert (=> b!1088739 (=> (not res!725695) (not e!622001))))

(assert (=> b!1088739 (= res!725695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088740 () Bool)

(declare-fun res!725699 () Bool)

(assert (=> b!1088740 (=> (not res!725699) (not e!622001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088740 (= res!725699 (validKeyInArray!0 k0!904))))

(declare-fun b!1088741 () Bool)

(declare-fun res!725693 () Bool)

(assert (=> b!1088741 (=> (not res!725693) (not e!622001))))

(assert (=> b!1088741 (= res!725693 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23567))))

(declare-fun b!1088742 () Bool)

(assert (=> b!1088742 (= e!621997 (not e!621999))))

(declare-fun res!725696 () Bool)

(assert (=> b!1088742 (=> res!725696 e!621999)))

(assert (=> b!1088742 (= res!725696 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40625)

(declare-fun getCurrentListMap!4255 (array!70213 array!70211 (_ BitVec 32) (_ BitVec 32) V!40625 V!40625 (_ BitVec 32) Int) ListLongMap!14953)

(assert (=> b!1088742 (= lt!484395 (getCurrentListMap!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484403 () array!70211)

(assert (=> b!1088742 (= lt!484399 (getCurrentListMap!4255 lt!484400 lt!484403 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088742 (and (= lt!484397 lt!484402) (= lt!484402 lt!484397))))

(assert (=> b!1088742 (= lt!484402 (-!804 lt!484401 k0!904))))

(declare-fun lt!484392 () Unit!35775)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!84 (array!70213 array!70211 (_ BitVec 32) (_ BitVec 32) V!40625 V!40625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35775)

(assert (=> b!1088742 (= lt!484392 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!84 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4060 (array!70213 array!70211 (_ BitVec 32) (_ BitVec 32) V!40625 V!40625 (_ BitVec 32) Int) ListLongMap!14953)

(assert (=> b!1088742 (= lt!484397 (getCurrentListMapNoExtraKeys!4060 lt!484400 lt!484403 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2181 (Int (_ BitVec 64)) V!40625)

(assert (=> b!1088742 (= lt!484403 (array!70212 (store (arr!33773 _values!874) i!650 (ValueCellFull!12602 (dynLambda!2181 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34310 _values!874)))))

(assert (=> b!1088742 (= lt!484401 (getCurrentListMapNoExtraKeys!4060 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088742 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484396 () Unit!35775)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70213 (_ BitVec 64) (_ BitVec 32)) Unit!35775)

(assert (=> b!1088742 (= lt!484396 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96204 res!725701) b!1088734))

(assert (= (and b!1088734 res!725703) b!1088739))

(assert (= (and b!1088739 res!725695) b!1088741))

(assert (= (and b!1088741 res!725693) b!1088736))

(assert (= (and b!1088736 res!725698) b!1088740))

(assert (= (and b!1088740 res!725699) b!1088738))

(assert (= (and b!1088738 res!725697) b!1088731))

(assert (= (and b!1088731 res!725700) b!1088732))

(assert (= (and b!1088732 res!725694) b!1088742))

(assert (= (and b!1088742 (not res!725696)) b!1088737))

(assert (= (and b!1088737 (not res!725702)) b!1088729))

(assert (= (and b!1088735 condMapEmpty!41689) mapIsEmpty!41689))

(assert (= (and b!1088735 (not condMapEmpty!41689)) mapNonEmpty!41689))

(get-info :version)

(assert (= (and mapNonEmpty!41689 ((_ is ValueCellFull!12602) mapValue!41689)) b!1088730))

(assert (= (and b!1088735 ((_ is ValueCellFull!12602) mapDefault!41689)) b!1088733))

(assert (= start!96204 b!1088735))

(declare-fun b_lambda!17301 () Bool)

(assert (=> (not b_lambda!17301) (not b!1088742)))

(declare-fun t!33239 () Bool)

(declare-fun tb!7491 () Bool)

(assert (=> (and start!96204 (= defaultEntry!882 defaultEntry!882) t!33239) tb!7491))

(declare-fun result!15509 () Bool)

(assert (=> tb!7491 (= result!15509 tp_is_empty!26623)))

(assert (=> b!1088742 t!33239))

(declare-fun b_and!35929 () Bool)

(assert (= b_and!35927 (and (=> t!33239 result!15509) b_and!35929)))

(declare-fun m!1007951 () Bool)

(assert (=> b!1088740 m!1007951))

(declare-fun m!1007953 () Bool)

(assert (=> b!1088737 m!1007953))

(declare-fun m!1007955 () Bool)

(assert (=> b!1088737 m!1007955))

(declare-fun m!1007957 () Bool)

(assert (=> b!1088737 m!1007957))

(declare-fun m!1007959 () Bool)

(assert (=> mapNonEmpty!41689 m!1007959))

(declare-fun m!1007961 () Bool)

(assert (=> b!1088732 m!1007961))

(declare-fun m!1007963 () Bool)

(assert (=> b!1088738 m!1007963))

(declare-fun m!1007965 () Bool)

(assert (=> b!1088742 m!1007965))

(declare-fun m!1007967 () Bool)

(assert (=> b!1088742 m!1007967))

(declare-fun m!1007969 () Bool)

(assert (=> b!1088742 m!1007969))

(declare-fun m!1007971 () Bool)

(assert (=> b!1088742 m!1007971))

(declare-fun m!1007973 () Bool)

(assert (=> b!1088742 m!1007973))

(declare-fun m!1007975 () Bool)

(assert (=> b!1088742 m!1007975))

(declare-fun m!1007977 () Bool)

(assert (=> b!1088742 m!1007977))

(declare-fun m!1007979 () Bool)

(assert (=> b!1088742 m!1007979))

(declare-fun m!1007981 () Bool)

(assert (=> b!1088742 m!1007981))

(declare-fun m!1007983 () Bool)

(assert (=> b!1088742 m!1007983))

(declare-fun m!1007985 () Bool)

(assert (=> b!1088729 m!1007985))

(declare-fun m!1007987 () Bool)

(assert (=> b!1088729 m!1007987))

(declare-fun m!1007989 () Bool)

(assert (=> start!96204 m!1007989))

(declare-fun m!1007991 () Bool)

(assert (=> start!96204 m!1007991))

(declare-fun m!1007993 () Bool)

(assert (=> start!96204 m!1007993))

(declare-fun m!1007995 () Bool)

(assert (=> b!1088741 m!1007995))

(declare-fun m!1007997 () Bool)

(assert (=> b!1088731 m!1007997))

(declare-fun m!1007999 () Bool)

(assert (=> b!1088731 m!1007999))

(declare-fun m!1008001 () Bool)

(assert (=> b!1088739 m!1008001))

(check-sat b_and!35929 (not b!1088739) (not b!1088729) (not b_next!22621) (not b!1088737) (not b!1088741) (not b!1088740) (not start!96204) tp_is_empty!26623 (not mapNonEmpty!41689) (not b!1088732) (not b!1088731) (not b_lambda!17301) (not b!1088742))
(check-sat b_and!35929 (not b_next!22621))
