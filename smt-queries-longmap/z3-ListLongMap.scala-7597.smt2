; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96138 () Bool)

(assert start!96138)

(declare-fun b_free!22555 () Bool)

(declare-fun b_next!22555 () Bool)

(assert (=> start!96138 (= b_free!22555 (not b_next!22555))))

(declare-fun tp!79514 () Bool)

(declare-fun b_and!35795 () Bool)

(assert (=> start!96138 (= tp!79514 b_and!35795)))

(declare-fun b!1087268 () Bool)

(declare-fun res!724601 () Bool)

(declare-fun e!621206 () Bool)

(assert (=> b!1087268 (=> (not res!724601) (not e!621206))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70087 0))(
  ( (array!70088 (arr!33711 (Array (_ BitVec 32) (_ BitVec 64))) (size!34248 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70087)

(declare-datatypes ((V!40537 0))(
  ( (V!40538 (val!13335 Int)) )
))
(declare-datatypes ((ValueCell!12569 0))(
  ( (ValueCellFull!12569 (v!15952 V!40537)) (EmptyCell!12569) )
))
(declare-datatypes ((array!70089 0))(
  ( (array!70090 (arr!33712 (Array (_ BitVec 32) ValueCell!12569)) (size!34249 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70089)

(assert (=> b!1087268 (= res!724601 (and (= (size!34249 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34248 _keys!1070) (size!34249 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41590 () Bool)

(declare-fun mapRes!41590 () Bool)

(declare-fun tp!79513 () Bool)

(declare-fun e!621205 () Bool)

(assert (=> mapNonEmpty!41590 (= mapRes!41590 (and tp!79513 e!621205))))

(declare-fun mapRest!41590 () (Array (_ BitVec 32) ValueCell!12569))

(declare-fun mapKey!41590 () (_ BitVec 32))

(declare-fun mapValue!41590 () ValueCell!12569)

(assert (=> mapNonEmpty!41590 (= (arr!33712 _values!874) (store mapRest!41590 mapKey!41590 mapValue!41590))))

(declare-fun b!1087269 () Bool)

(declare-fun e!621208 () Bool)

(assert (=> b!1087269 (= e!621208 (bvsle #b00000000000000000000000000000000 (size!34248 _keys!1070)))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-datatypes ((tuple2!16920 0))(
  ( (tuple2!16921 (_1!8471 (_ BitVec 64)) (_2!8471 V!40537)) )
))
(declare-fun lt!482793 () tuple2!16920)

(declare-datatypes ((List!23518 0))(
  ( (Nil!23515) (Cons!23514 (h!24732 tuple2!16920) (t!33123 List!23518)) )
))
(declare-datatypes ((ListLongMap!14897 0))(
  ( (ListLongMap!14898 (toList!7464 List!23518)) )
))
(declare-fun lt!482780 () ListLongMap!14897)

(declare-fun lt!482790 () ListLongMap!14897)

(declare-fun -!776 (ListLongMap!14897 (_ BitVec 64)) ListLongMap!14897)

(declare-fun +!3289 (ListLongMap!14897 tuple2!16920) ListLongMap!14897)

(assert (=> b!1087269 (= (-!776 lt!482780 k0!904) (+!3289 lt!482790 lt!482793))))

(declare-fun minValue!831 () V!40537)

(declare-datatypes ((Unit!35719 0))(
  ( (Unit!35720) )
))
(declare-fun lt!482785 () Unit!35719)

(declare-fun lt!482786 () ListLongMap!14897)

(declare-fun addRemoveCommutativeForDiffKeys!23 (ListLongMap!14897 (_ BitVec 64) V!40537 (_ BitVec 64)) Unit!35719)

(assert (=> b!1087269 (= lt!482785 (addRemoveCommutativeForDiffKeys!23 lt!482786 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1087270 () Bool)

(declare-fun e!621209 () Bool)

(assert (=> b!1087270 (= e!621206 e!621209)))

(declare-fun res!724599 () Bool)

(assert (=> b!1087270 (=> (not res!724599) (not e!621209))))

(declare-fun lt!482782 () array!70087)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70087 (_ BitVec 32)) Bool)

(assert (=> b!1087270 (= res!724599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482782 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087270 (= lt!482782 (array!70088 (store (arr!33711 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34248 _keys!1070)))))

(declare-fun b!1087271 () Bool)

(declare-fun tp_is_empty!26557 () Bool)

(assert (=> b!1087271 (= e!621205 tp_is_empty!26557)))

(declare-fun b!1087272 () Bool)

(declare-fun e!621203 () Bool)

(assert (=> b!1087272 (= e!621209 (not e!621203))))

(declare-fun res!724595 () Bool)

(assert (=> b!1087272 (=> res!724595 e!621203)))

(assert (=> b!1087272 (= res!724595 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!482781 () ListLongMap!14897)

(declare-fun zeroValue!831 () V!40537)

(declare-fun getCurrentListMap!4232 (array!70087 array!70089 (_ BitVec 32) (_ BitVec 32) V!40537 V!40537 (_ BitVec 32) Int) ListLongMap!14897)

(assert (=> b!1087272 (= lt!482781 (getCurrentListMap!4232 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482792 () array!70089)

(declare-fun lt!482794 () ListLongMap!14897)

(assert (=> b!1087272 (= lt!482794 (getCurrentListMap!4232 lt!482782 lt!482792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482783 () ListLongMap!14897)

(declare-fun lt!482784 () ListLongMap!14897)

(assert (=> b!1087272 (and (= lt!482783 lt!482784) (= lt!482784 lt!482783))))

(declare-fun lt!482795 () ListLongMap!14897)

(assert (=> b!1087272 (= lt!482784 (-!776 lt!482795 k0!904))))

(declare-fun lt!482796 () Unit!35719)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!61 (array!70087 array!70089 (_ BitVec 32) (_ BitVec 32) V!40537 V!40537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35719)

(assert (=> b!1087272 (= lt!482796 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!61 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4037 (array!70087 array!70089 (_ BitVec 32) (_ BitVec 32) V!40537 V!40537 (_ BitVec 32) Int) ListLongMap!14897)

(assert (=> b!1087272 (= lt!482783 (getCurrentListMapNoExtraKeys!4037 lt!482782 lt!482792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2158 (Int (_ BitVec 64)) V!40537)

(assert (=> b!1087272 (= lt!482792 (array!70090 (store (arr!33712 _values!874) i!650 (ValueCellFull!12569 (dynLambda!2158 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34249 _values!874)))))

(assert (=> b!1087272 (= lt!482795 (getCurrentListMapNoExtraKeys!4037 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087272 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482787 () Unit!35719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70087 (_ BitVec 64) (_ BitVec 32)) Unit!35719)

(assert (=> b!1087272 (= lt!482787 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087273 () Bool)

(declare-fun res!724597 () Bool)

(assert (=> b!1087273 (=> (not res!724597) (not e!621206))))

(declare-datatypes ((List!23519 0))(
  ( (Nil!23516) (Cons!23515 (h!24733 (_ BitVec 64)) (t!33124 List!23519)) )
))
(declare-fun arrayNoDuplicates!0 (array!70087 (_ BitVec 32) List!23519) Bool)

(assert (=> b!1087273 (= res!724597 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23516))))

(declare-fun mapIsEmpty!41590 () Bool)

(assert (=> mapIsEmpty!41590 mapRes!41590))

(declare-fun b!1087274 () Bool)

(declare-fun res!724596 () Bool)

(assert (=> b!1087274 (=> (not res!724596) (not e!621206))))

(assert (=> b!1087274 (= res!724596 (= (select (arr!33711 _keys!1070) i!650) k0!904))))

(declare-fun b!1087275 () Bool)

(declare-fun e!621204 () Bool)

(assert (=> b!1087275 (= e!621204 tp_is_empty!26557)))

(declare-fun b!1087276 () Bool)

(declare-fun e!621207 () Bool)

(assert (=> b!1087276 (= e!621207 (and e!621204 mapRes!41590))))

(declare-fun condMapEmpty!41590 () Bool)

(declare-fun mapDefault!41590 () ValueCell!12569)

(assert (=> b!1087276 (= condMapEmpty!41590 (= (arr!33712 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12569)) mapDefault!41590)))))

(declare-fun b!1087277 () Bool)

(declare-fun res!724605 () Bool)

(assert (=> b!1087277 (=> (not res!724605) (not e!621206))))

(assert (=> b!1087277 (= res!724605 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34248 _keys!1070))))))

(declare-fun res!724603 () Bool)

(assert (=> start!96138 (=> (not res!724603) (not e!621206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96138 (= res!724603 (validMask!0 mask!1414))))

(assert (=> start!96138 e!621206))

(assert (=> start!96138 tp!79514))

(assert (=> start!96138 true))

(assert (=> start!96138 tp_is_empty!26557))

(declare-fun array_inv!26058 (array!70087) Bool)

(assert (=> start!96138 (array_inv!26058 _keys!1070)))

(declare-fun array_inv!26059 (array!70089) Bool)

(assert (=> start!96138 (and (array_inv!26059 _values!874) e!621207)))

(declare-fun b!1087278 () Bool)

(assert (=> b!1087278 (= e!621203 e!621208)))

(declare-fun res!724602 () Bool)

(assert (=> b!1087278 (=> res!724602 e!621208)))

(assert (=> b!1087278 (= res!724602 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482791 () ListLongMap!14897)

(assert (=> b!1087278 (= lt!482790 lt!482791)))

(assert (=> b!1087278 (= lt!482790 (-!776 lt!482786 k0!904))))

(declare-fun lt!482788 () Unit!35719)

(assert (=> b!1087278 (= lt!482788 (addRemoveCommutativeForDiffKeys!23 lt!482795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1087278 (= lt!482794 (+!3289 lt!482791 lt!482793))))

(declare-fun lt!482789 () tuple2!16920)

(assert (=> b!1087278 (= lt!482791 (+!3289 lt!482784 lt!482789))))

(assert (=> b!1087278 (= lt!482781 lt!482780)))

(assert (=> b!1087278 (= lt!482780 (+!3289 lt!482786 lt!482793))))

(assert (=> b!1087278 (= lt!482786 (+!3289 lt!482795 lt!482789))))

(assert (=> b!1087278 (= lt!482794 (+!3289 (+!3289 lt!482783 lt!482789) lt!482793))))

(assert (=> b!1087278 (= lt!482793 (tuple2!16921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087278 (= lt!482789 (tuple2!16921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087279 () Bool)

(declare-fun res!724604 () Bool)

(assert (=> b!1087279 (=> (not res!724604) (not e!621206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087279 (= res!724604 (validKeyInArray!0 k0!904))))

(declare-fun b!1087280 () Bool)

(declare-fun res!724600 () Bool)

(assert (=> b!1087280 (=> (not res!724600) (not e!621209))))

(assert (=> b!1087280 (= res!724600 (arrayNoDuplicates!0 lt!482782 #b00000000000000000000000000000000 Nil!23516))))

(declare-fun b!1087281 () Bool)

(declare-fun res!724598 () Bool)

(assert (=> b!1087281 (=> (not res!724598) (not e!621206))))

(assert (=> b!1087281 (= res!724598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96138 res!724603) b!1087268))

(assert (= (and b!1087268 res!724601) b!1087281))

(assert (= (and b!1087281 res!724598) b!1087273))

(assert (= (and b!1087273 res!724597) b!1087277))

(assert (= (and b!1087277 res!724605) b!1087279))

(assert (= (and b!1087279 res!724604) b!1087274))

(assert (= (and b!1087274 res!724596) b!1087270))

(assert (= (and b!1087270 res!724599) b!1087280))

(assert (= (and b!1087280 res!724600) b!1087272))

(assert (= (and b!1087272 (not res!724595)) b!1087278))

(assert (= (and b!1087278 (not res!724602)) b!1087269))

(assert (= (and b!1087276 condMapEmpty!41590) mapIsEmpty!41590))

(assert (= (and b!1087276 (not condMapEmpty!41590)) mapNonEmpty!41590))

(get-info :version)

(assert (= (and mapNonEmpty!41590 ((_ is ValueCellFull!12569) mapValue!41590)) b!1087271))

(assert (= (and b!1087276 ((_ is ValueCellFull!12569) mapDefault!41590)) b!1087275))

(assert (= start!96138 b!1087276))

(declare-fun b_lambda!17235 () Bool)

(assert (=> (not b_lambda!17235) (not b!1087272)))

(declare-fun t!33122 () Bool)

(declare-fun tb!7425 () Bool)

(assert (=> (and start!96138 (= defaultEntry!882 defaultEntry!882) t!33122) tb!7425))

(declare-fun result!15377 () Bool)

(assert (=> tb!7425 (= result!15377 tp_is_empty!26557)))

(assert (=> b!1087272 t!33122))

(declare-fun b_and!35797 () Bool)

(assert (= b_and!35795 (and (=> t!33122 result!15377) b_and!35797)))

(declare-fun m!1005887 () Bool)

(assert (=> b!1087281 m!1005887))

(declare-fun m!1005889 () Bool)

(assert (=> b!1087269 m!1005889))

(declare-fun m!1005891 () Bool)

(assert (=> b!1087269 m!1005891))

(declare-fun m!1005893 () Bool)

(assert (=> b!1087269 m!1005893))

(declare-fun m!1005895 () Bool)

(assert (=> b!1087274 m!1005895))

(declare-fun m!1005897 () Bool)

(assert (=> b!1087270 m!1005897))

(declare-fun m!1005899 () Bool)

(assert (=> b!1087270 m!1005899))

(declare-fun m!1005901 () Bool)

(assert (=> start!96138 m!1005901))

(declare-fun m!1005903 () Bool)

(assert (=> start!96138 m!1005903))

(declare-fun m!1005905 () Bool)

(assert (=> start!96138 m!1005905))

(declare-fun m!1005907 () Bool)

(assert (=> b!1087278 m!1005907))

(declare-fun m!1005909 () Bool)

(assert (=> b!1087278 m!1005909))

(declare-fun m!1005911 () Bool)

(assert (=> b!1087278 m!1005911))

(assert (=> b!1087278 m!1005909))

(declare-fun m!1005913 () Bool)

(assert (=> b!1087278 m!1005913))

(declare-fun m!1005915 () Bool)

(assert (=> b!1087278 m!1005915))

(declare-fun m!1005917 () Bool)

(assert (=> b!1087278 m!1005917))

(declare-fun m!1005919 () Bool)

(assert (=> b!1087278 m!1005919))

(declare-fun m!1005921 () Bool)

(assert (=> b!1087278 m!1005921))

(declare-fun m!1005923 () Bool)

(assert (=> b!1087273 m!1005923))

(declare-fun m!1005925 () Bool)

(assert (=> b!1087279 m!1005925))

(declare-fun m!1005927 () Bool)

(assert (=> mapNonEmpty!41590 m!1005927))

(declare-fun m!1005929 () Bool)

(assert (=> b!1087280 m!1005929))

(declare-fun m!1005931 () Bool)

(assert (=> b!1087272 m!1005931))

(declare-fun m!1005933 () Bool)

(assert (=> b!1087272 m!1005933))

(declare-fun m!1005935 () Bool)

(assert (=> b!1087272 m!1005935))

(declare-fun m!1005937 () Bool)

(assert (=> b!1087272 m!1005937))

(declare-fun m!1005939 () Bool)

(assert (=> b!1087272 m!1005939))

(declare-fun m!1005941 () Bool)

(assert (=> b!1087272 m!1005941))

(declare-fun m!1005943 () Bool)

(assert (=> b!1087272 m!1005943))

(declare-fun m!1005945 () Bool)

(assert (=> b!1087272 m!1005945))

(declare-fun m!1005947 () Bool)

(assert (=> b!1087272 m!1005947))

(declare-fun m!1005949 () Bool)

(assert (=> b!1087272 m!1005949))

(check-sat (not b!1087269) (not b!1087273) (not b!1087281) (not start!96138) b_and!35797 (not b_next!22555) (not b!1087272) (not b!1087278) (not b!1087280) (not mapNonEmpty!41590) tp_is_empty!26557 (not b_lambda!17235) (not b!1087279) (not b!1087270))
(check-sat b_and!35797 (not b_next!22555))
