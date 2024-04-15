; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96022 () Bool)

(assert start!96022)

(declare-fun b_free!22681 () Bool)

(declare-fun b_next!22681 () Bool)

(assert (=> start!96022 (= b_free!22681 (not b_next!22681))))

(declare-fun tp!79891 () Bool)

(declare-fun b_and!36011 () Bool)

(assert (=> start!96022 (= tp!79891 b_and!36011)))

(declare-fun b!1088569 () Bool)

(declare-fun res!726100 () Bool)

(declare-fun e!621773 () Bool)

(assert (=> b!1088569 (=> (not res!726100) (not e!621773))))

(declare-datatypes ((array!70214 0))(
  ( (array!70215 (arr!33781 (Array (_ BitVec 32) (_ BitVec 64))) (size!34319 (_ BitVec 32))) )
))
(declare-fun lt!484850 () array!70214)

(declare-datatypes ((List!23638 0))(
  ( (Nil!23635) (Cons!23634 (h!24843 (_ BitVec 64)) (t!33368 List!23638)) )
))
(declare-fun arrayNoDuplicates!0 (array!70214 (_ BitVec 32) List!23638) Bool)

(assert (=> b!1088569 (= res!726100 (arrayNoDuplicates!0 lt!484850 #b00000000000000000000000000000000 Nil!23635))))

(declare-fun b!1088570 () Bool)

(declare-fun e!621769 () Bool)

(assert (=> b!1088570 (= e!621769 true)))

(declare-datatypes ((V!40705 0))(
  ( (V!40706 (val!13398 Int)) )
))
(declare-datatypes ((tuple2!17070 0))(
  ( (tuple2!17071 (_1!8546 (_ BitVec 64)) (_2!8546 V!40705)) )
))
(declare-datatypes ((List!23639 0))(
  ( (Nil!23636) (Cons!23635 (h!24844 tuple2!17070) (t!33369 List!23639)) )
))
(declare-datatypes ((ListLongMap!15039 0))(
  ( (ListLongMap!15040 (toList!7535 List!23639)) )
))
(declare-fun lt!484855 () ListLongMap!15039)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!484849 () ListLongMap!15039)

(declare-fun -!813 (ListLongMap!15039 (_ BitVec 64)) ListLongMap!15039)

(assert (=> b!1088570 (= (-!813 lt!484855 k0!904) lt!484849)))

(declare-datatypes ((Unit!35661 0))(
  ( (Unit!35662) )
))
(declare-fun lt!484848 () Unit!35661)

(declare-fun lt!484859 () ListLongMap!15039)

(declare-fun zeroValue!831 () V!40705)

(declare-fun addRemoveCommutativeForDiffKeys!64 (ListLongMap!15039 (_ BitVec 64) V!40705 (_ BitVec 64)) Unit!35661)

(assert (=> b!1088570 (= lt!484848 (addRemoveCommutativeForDiffKeys!64 lt!484859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088571 () Bool)

(declare-fun e!621768 () Bool)

(assert (=> b!1088571 (= e!621768 e!621769)))

(declare-fun res!726095 () Bool)

(assert (=> b!1088571 (=> res!726095 e!621769)))

(assert (=> b!1088571 (= res!726095 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484853 () ListLongMap!15039)

(assert (=> b!1088571 (= lt!484853 lt!484849)))

(declare-fun lt!484858 () ListLongMap!15039)

(declare-fun lt!484847 () tuple2!17070)

(declare-fun +!3336 (ListLongMap!15039 tuple2!17070) ListLongMap!15039)

(assert (=> b!1088571 (= lt!484849 (+!3336 lt!484858 lt!484847))))

(declare-fun lt!484854 () ListLongMap!15039)

(assert (=> b!1088571 (= lt!484854 lt!484855)))

(assert (=> b!1088571 (= lt!484855 (+!3336 lt!484859 lt!484847))))

(declare-fun lt!484857 () ListLongMap!15039)

(assert (=> b!1088571 (= lt!484853 (+!3336 lt!484857 lt!484847))))

(assert (=> b!1088571 (= lt!484847 (tuple2!17071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088572 () Bool)

(assert (=> b!1088572 (= e!621773 (not e!621768))))

(declare-fun res!726099 () Bool)

(assert (=> b!1088572 (=> res!726099 e!621768)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088572 (= res!726099 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40705)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70214)

(declare-datatypes ((ValueCell!12632 0))(
  ( (ValueCellFull!12632 (v!16018 V!40705)) (EmptyCell!12632) )
))
(declare-datatypes ((array!70216 0))(
  ( (array!70217 (arr!33782 (Array (_ BitVec 32) ValueCell!12632)) (size!34320 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70216)

(declare-fun getCurrentListMap!4215 (array!70214 array!70216 (_ BitVec 32) (_ BitVec 32) V!40705 V!40705 (_ BitVec 32) Int) ListLongMap!15039)

(assert (=> b!1088572 (= lt!484854 (getCurrentListMap!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484852 () array!70216)

(assert (=> b!1088572 (= lt!484853 (getCurrentListMap!4215 lt!484850 lt!484852 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088572 (and (= lt!484857 lt!484858) (= lt!484858 lt!484857))))

(assert (=> b!1088572 (= lt!484858 (-!813 lt!484859 k0!904))))

(declare-fun lt!484856 () Unit!35661)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!99 (array!70214 array!70216 (_ BitVec 32) (_ BitVec 32) V!40705 V!40705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35661)

(assert (=> b!1088572 (= lt!484856 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!99 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4085 (array!70214 array!70216 (_ BitVec 32) (_ BitVec 32) V!40705 V!40705 (_ BitVec 32) Int) ListLongMap!15039)

(assert (=> b!1088572 (= lt!484857 (getCurrentListMapNoExtraKeys!4085 lt!484850 lt!484852 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2156 (Int (_ BitVec 64)) V!40705)

(assert (=> b!1088572 (= lt!484852 (array!70217 (store (arr!33782 _values!874) i!650 (ValueCellFull!12632 (dynLambda!2156 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34320 _values!874)))))

(assert (=> b!1088572 (= lt!484859 (getCurrentListMapNoExtraKeys!4085 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088572 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484851 () Unit!35661)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70214 (_ BitVec 64) (_ BitVec 32)) Unit!35661)

(assert (=> b!1088572 (= lt!484851 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088573 () Bool)

(declare-fun res!726101 () Bool)

(declare-fun e!621766 () Bool)

(assert (=> b!1088573 (=> (not res!726101) (not e!621766))))

(assert (=> b!1088573 (= res!726101 (= (select (arr!33781 _keys!1070) i!650) k0!904))))

(declare-fun b!1088574 () Bool)

(declare-fun e!621772 () Bool)

(declare-fun tp_is_empty!26683 () Bool)

(assert (=> b!1088574 (= e!621772 tp_is_empty!26683)))

(declare-fun b!1088576 () Bool)

(declare-fun res!726098 () Bool)

(assert (=> b!1088576 (=> (not res!726098) (not e!621766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70214 (_ BitVec 32)) Bool)

(assert (=> b!1088576 (= res!726098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088577 () Bool)

(assert (=> b!1088577 (= e!621766 e!621773)))

(declare-fun res!726094 () Bool)

(assert (=> b!1088577 (=> (not res!726094) (not e!621773))))

(assert (=> b!1088577 (= res!726094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484850 mask!1414))))

(assert (=> b!1088577 (= lt!484850 (array!70215 (store (arr!33781 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34319 _keys!1070)))))

(declare-fun mapIsEmpty!41779 () Bool)

(declare-fun mapRes!41779 () Bool)

(assert (=> mapIsEmpty!41779 mapRes!41779))

(declare-fun b!1088578 () Bool)

(declare-fun res!726093 () Bool)

(assert (=> b!1088578 (=> (not res!726093) (not e!621766))))

(assert (=> b!1088578 (= res!726093 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34319 _keys!1070))))))

(declare-fun b!1088579 () Bool)

(declare-fun res!726102 () Bool)

(assert (=> b!1088579 (=> (not res!726102) (not e!621766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088579 (= res!726102 (validKeyInArray!0 k0!904))))

(declare-fun b!1088575 () Bool)

(declare-fun e!621770 () Bool)

(declare-fun e!621771 () Bool)

(assert (=> b!1088575 (= e!621770 (and e!621771 mapRes!41779))))

(declare-fun condMapEmpty!41779 () Bool)

(declare-fun mapDefault!41779 () ValueCell!12632)

(assert (=> b!1088575 (= condMapEmpty!41779 (= (arr!33782 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12632)) mapDefault!41779)))))

(declare-fun res!726096 () Bool)

(assert (=> start!96022 (=> (not res!726096) (not e!621766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96022 (= res!726096 (validMask!0 mask!1414))))

(assert (=> start!96022 e!621766))

(assert (=> start!96022 tp!79891))

(assert (=> start!96022 true))

(assert (=> start!96022 tp_is_empty!26683))

(declare-fun array_inv!26100 (array!70214) Bool)

(assert (=> start!96022 (array_inv!26100 _keys!1070)))

(declare-fun array_inv!26101 (array!70216) Bool)

(assert (=> start!96022 (and (array_inv!26101 _values!874) e!621770)))

(declare-fun mapNonEmpty!41779 () Bool)

(declare-fun tp!79892 () Bool)

(assert (=> mapNonEmpty!41779 (= mapRes!41779 (and tp!79892 e!621772))))

(declare-fun mapKey!41779 () (_ BitVec 32))

(declare-fun mapRest!41779 () (Array (_ BitVec 32) ValueCell!12632))

(declare-fun mapValue!41779 () ValueCell!12632)

(assert (=> mapNonEmpty!41779 (= (arr!33782 _values!874) (store mapRest!41779 mapKey!41779 mapValue!41779))))

(declare-fun b!1088580 () Bool)

(assert (=> b!1088580 (= e!621771 tp_is_empty!26683)))

(declare-fun b!1088581 () Bool)

(declare-fun res!726097 () Bool)

(assert (=> b!1088581 (=> (not res!726097) (not e!621766))))

(assert (=> b!1088581 (= res!726097 (and (= (size!34320 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34319 _keys!1070) (size!34320 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088582 () Bool)

(declare-fun res!726092 () Bool)

(assert (=> b!1088582 (=> (not res!726092) (not e!621766))))

(assert (=> b!1088582 (= res!726092 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23635))))

(assert (= (and start!96022 res!726096) b!1088581))

(assert (= (and b!1088581 res!726097) b!1088576))

(assert (= (and b!1088576 res!726098) b!1088582))

(assert (= (and b!1088582 res!726092) b!1088578))

(assert (= (and b!1088578 res!726093) b!1088579))

(assert (= (and b!1088579 res!726102) b!1088573))

(assert (= (and b!1088573 res!726101) b!1088577))

(assert (= (and b!1088577 res!726094) b!1088569))

(assert (= (and b!1088569 res!726100) b!1088572))

(assert (= (and b!1088572 (not res!726099)) b!1088571))

(assert (= (and b!1088571 (not res!726095)) b!1088570))

(assert (= (and b!1088575 condMapEmpty!41779) mapIsEmpty!41779))

(assert (= (and b!1088575 (not condMapEmpty!41779)) mapNonEmpty!41779))

(get-info :version)

(assert (= (and mapNonEmpty!41779 ((_ is ValueCellFull!12632) mapValue!41779)) b!1088574))

(assert (= (and b!1088575 ((_ is ValueCellFull!12632) mapDefault!41779)) b!1088580))

(assert (= start!96022 b!1088575))

(declare-fun b_lambda!17329 () Bool)

(assert (=> (not b_lambda!17329) (not b!1088572)))

(declare-fun t!33367 () Bool)

(declare-fun tb!7551 () Bool)

(assert (=> (and start!96022 (= defaultEntry!882 defaultEntry!882) t!33367) tb!7551))

(declare-fun result!15629 () Bool)

(assert (=> tb!7551 (= result!15629 tp_is_empty!26683)))

(assert (=> b!1088572 t!33367))

(declare-fun b_and!36013 () Bool)

(assert (= b_and!36011 (and (=> t!33367 result!15629) b_and!36013)))

(declare-fun m!1007213 () Bool)

(assert (=> b!1088569 m!1007213))

(declare-fun m!1007215 () Bool)

(assert (=> mapNonEmpty!41779 m!1007215))

(declare-fun m!1007217 () Bool)

(assert (=> b!1088572 m!1007217))

(declare-fun m!1007219 () Bool)

(assert (=> b!1088572 m!1007219))

(declare-fun m!1007221 () Bool)

(assert (=> b!1088572 m!1007221))

(declare-fun m!1007223 () Bool)

(assert (=> b!1088572 m!1007223))

(declare-fun m!1007225 () Bool)

(assert (=> b!1088572 m!1007225))

(declare-fun m!1007227 () Bool)

(assert (=> b!1088572 m!1007227))

(declare-fun m!1007229 () Bool)

(assert (=> b!1088572 m!1007229))

(declare-fun m!1007231 () Bool)

(assert (=> b!1088572 m!1007231))

(declare-fun m!1007233 () Bool)

(assert (=> b!1088572 m!1007233))

(declare-fun m!1007235 () Bool)

(assert (=> b!1088572 m!1007235))

(declare-fun m!1007237 () Bool)

(assert (=> start!96022 m!1007237))

(declare-fun m!1007239 () Bool)

(assert (=> start!96022 m!1007239))

(declare-fun m!1007241 () Bool)

(assert (=> start!96022 m!1007241))

(declare-fun m!1007243 () Bool)

(assert (=> b!1088570 m!1007243))

(declare-fun m!1007245 () Bool)

(assert (=> b!1088570 m!1007245))

(declare-fun m!1007247 () Bool)

(assert (=> b!1088576 m!1007247))

(declare-fun m!1007249 () Bool)

(assert (=> b!1088571 m!1007249))

(declare-fun m!1007251 () Bool)

(assert (=> b!1088571 m!1007251))

(declare-fun m!1007253 () Bool)

(assert (=> b!1088571 m!1007253))

(declare-fun m!1007255 () Bool)

(assert (=> b!1088582 m!1007255))

(declare-fun m!1007257 () Bool)

(assert (=> b!1088573 m!1007257))

(declare-fun m!1007259 () Bool)

(assert (=> b!1088579 m!1007259))

(declare-fun m!1007261 () Bool)

(assert (=> b!1088577 m!1007261))

(declare-fun m!1007263 () Bool)

(assert (=> b!1088577 m!1007263))

(check-sat (not b!1088569) (not mapNonEmpty!41779) (not b!1088570) b_and!36013 (not b!1088576) (not b_lambda!17329) (not b_next!22681) (not b!1088571) (not b!1088577) (not b!1088579) (not b!1088582) tp_is_empty!26683 (not start!96022) (not b!1088572))
(check-sat b_and!36013 (not b_next!22681))
