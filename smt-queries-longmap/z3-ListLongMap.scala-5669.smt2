; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73780 () Bool)

(assert start!73780)

(declare-fun b_free!14713 () Bool)

(declare-fun b_next!14713 () Bool)

(assert (=> start!73780 (= b_free!14713 (not b_next!14713))))

(declare-fun tp!51644 () Bool)

(declare-fun b_and!24379 () Bool)

(assert (=> start!73780 (= tp!51644 b_and!24379)))

(declare-fun b!865837 () Bool)

(declare-fun e!482310 () Bool)

(assert (=> b!865837 (= e!482310 true)))

(declare-datatypes ((V!27513 0))(
  ( (V!27514 (val!8472 Int)) )
))
(declare-datatypes ((tuple2!11252 0))(
  ( (tuple2!11253 (_1!5637 (_ BitVec 64)) (_2!5637 V!27513)) )
))
(declare-fun lt!392529 () tuple2!11252)

(declare-datatypes ((List!17040 0))(
  ( (Nil!17037) (Cons!17036 (h!18167 tuple2!11252) (t!24010 List!17040)) )
))
(declare-datatypes ((ListLongMap!10011 0))(
  ( (ListLongMap!10012 (toList!5021 List!17040)) )
))
(declare-fun lt!392535 () ListLongMap!10011)

(declare-fun lt!392525 () ListLongMap!10011)

(declare-fun lt!392534 () tuple2!11252)

(declare-fun +!2389 (ListLongMap!10011 tuple2!11252) ListLongMap!10011)

(assert (=> b!865837 (= lt!392535 (+!2389 (+!2389 lt!392525 lt!392529) lt!392534))))

(declare-fun v!557 () V!27513)

(declare-datatypes ((array!49849 0))(
  ( (array!49850 (arr!23956 (Array (_ BitVec 32) (_ BitVec 64))) (size!24398 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49849)

(declare-datatypes ((Unit!29608 0))(
  ( (Unit!29609) )
))
(declare-fun lt!392531 () Unit!29608)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!392539 () V!27513)

(declare-fun addCommutativeForDiffKeys!527 (ListLongMap!10011 (_ BitVec 64) V!27513 (_ BitVec 64) V!27513) Unit!29608)

(assert (=> b!865837 (= lt!392531 (addCommutativeForDiffKeys!527 lt!392525 k0!854 v!557 (select (arr!23956 _keys!868) from!1053) lt!392539))))

(declare-fun b!865838 () Bool)

(declare-fun e!482305 () Bool)

(declare-fun tp_is_empty!16849 () Bool)

(assert (=> b!865838 (= e!482305 tp_is_empty!16849)))

(declare-fun b!865839 () Bool)

(declare-fun res!588361 () Bool)

(declare-fun e!482307 () Bool)

(assert (=> b!865839 (=> (not res!588361) (not e!482307))))

(declare-datatypes ((List!17041 0))(
  ( (Nil!17038) (Cons!17037 (h!18168 (_ BitVec 64)) (t!24011 List!17041)) )
))
(declare-fun arrayNoDuplicates!0 (array!49849 (_ BitVec 32) List!17041) Bool)

(assert (=> b!865839 (= res!588361 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17038))))

(declare-fun b!865840 () Bool)

(declare-fun e!482304 () Unit!29608)

(declare-fun Unit!29610 () Unit!29608)

(assert (=> b!865840 (= e!482304 Unit!29610)))

(declare-fun lt!392537 () Unit!29608)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49849 (_ BitVec 32) (_ BitVec 32)) Unit!29608)

(assert (=> b!865840 (= lt!392537 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865840 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17038)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!392532 () Unit!29608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49849 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29608)

(assert (=> b!865840 (= lt!392532 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865840 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392540 () Unit!29608)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49849 (_ BitVec 64) (_ BitVec 32) List!17041) Unit!29608)

(assert (=> b!865840 (= lt!392540 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17038))))

(assert (=> b!865840 false))

(declare-fun b!865841 () Bool)

(declare-fun e!482302 () Bool)

(assert (=> b!865841 (= e!482302 tp_is_empty!16849)))

(declare-fun b!865842 () Bool)

(declare-fun e!482309 () Bool)

(assert (=> b!865842 (= e!482309 e!482310)))

(declare-fun res!588357 () Bool)

(assert (=> b!865842 (=> res!588357 e!482310)))

(assert (=> b!865842 (= res!588357 (= k0!854 (select (arr!23956 _keys!868) from!1053)))))

(assert (=> b!865842 (not (= (select (arr!23956 _keys!868) from!1053) k0!854))))

(declare-fun lt!392526 () Unit!29608)

(assert (=> b!865842 (= lt!392526 e!482304)))

(declare-fun c!92225 () Bool)

(assert (=> b!865842 (= c!92225 (= (select (arr!23956 _keys!868) from!1053) k0!854))))

(declare-fun lt!392536 () ListLongMap!10011)

(assert (=> b!865842 (= lt!392536 lt!392535)))

(declare-fun lt!392527 () ListLongMap!10011)

(assert (=> b!865842 (= lt!392535 (+!2389 lt!392527 lt!392529))))

(assert (=> b!865842 (= lt!392529 (tuple2!11253 (select (arr!23956 _keys!868) from!1053) lt!392539))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7985 0))(
  ( (ValueCellFull!7985 (v!10891 V!27513)) (EmptyCell!7985) )
))
(declare-datatypes ((array!49851 0))(
  ( (array!49852 (arr!23957 (Array (_ BitVec 32) ValueCell!7985)) (size!24399 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49851)

(declare-fun get!12671 (ValueCell!7985 V!27513) V!27513)

(declare-fun dynLambda!1186 (Int (_ BitVec 64)) V!27513)

(assert (=> b!865842 (= lt!392539 (get!12671 (select (arr!23957 _values!688) from!1053) (dynLambda!1186 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!26873 () Bool)

(declare-fun mapRes!26873 () Bool)

(declare-fun tp!51643 () Bool)

(assert (=> mapNonEmpty!26873 (= mapRes!26873 (and tp!51643 e!482302))))

(declare-fun mapValue!26873 () ValueCell!7985)

(declare-fun mapRest!26873 () (Array (_ BitVec 32) ValueCell!7985))

(declare-fun mapKey!26873 () (_ BitVec 32))

(assert (=> mapNonEmpty!26873 (= (arr!23957 _values!688) (store mapRest!26873 mapKey!26873 mapValue!26873))))

(declare-fun b!865843 () Bool)

(declare-fun Unit!29611 () Unit!29608)

(assert (=> b!865843 (= e!482304 Unit!29611)))

(declare-fun b!865844 () Bool)

(declare-fun e!482308 () Bool)

(assert (=> b!865844 (= e!482308 (and e!482305 mapRes!26873))))

(declare-fun condMapEmpty!26873 () Bool)

(declare-fun mapDefault!26873 () ValueCell!7985)

(assert (=> b!865844 (= condMapEmpty!26873 (= (arr!23957 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7985)) mapDefault!26873)))))

(declare-fun mapIsEmpty!26873 () Bool)

(assert (=> mapIsEmpty!26873 mapRes!26873))

(declare-fun b!865845 () Bool)

(declare-fun e!482306 () Bool)

(assert (=> b!865845 (= e!482306 (not e!482309))))

(declare-fun res!588355 () Bool)

(assert (=> b!865845 (=> res!588355 e!482309)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865845 (= res!588355 (not (validKeyInArray!0 (select (arr!23956 _keys!868) from!1053))))))

(declare-fun lt!392528 () ListLongMap!10011)

(assert (=> b!865845 (= lt!392528 lt!392527)))

(assert (=> b!865845 (= lt!392527 (+!2389 lt!392525 lt!392534))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!392533 () array!49851)

(declare-fun minValue!654 () V!27513)

(declare-fun zeroValue!654 () V!27513)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3017 (array!49849 array!49851 (_ BitVec 32) (_ BitVec 32) V!27513 V!27513 (_ BitVec 32) Int) ListLongMap!10011)

(assert (=> b!865845 (= lt!392528 (getCurrentListMapNoExtraKeys!3017 _keys!868 lt!392533 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865845 (= lt!392534 (tuple2!11253 k0!854 v!557))))

(assert (=> b!865845 (= lt!392525 (getCurrentListMapNoExtraKeys!3017 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392538 () Unit!29608)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!561 (array!49849 array!49851 (_ BitVec 32) (_ BitVec 32) V!27513 V!27513 (_ BitVec 32) (_ BitVec 64) V!27513 (_ BitVec 32) Int) Unit!29608)

(assert (=> b!865845 (= lt!392538 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!561 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865846 () Bool)

(declare-fun res!588360 () Bool)

(assert (=> b!865846 (=> (not res!588360) (not e!482307))))

(assert (=> b!865846 (= res!588360 (and (= (size!24399 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24398 _keys!868) (size!24399 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865847 () Bool)

(assert (=> b!865847 (= e!482307 e!482306)))

(declare-fun res!588363 () Bool)

(assert (=> b!865847 (=> (not res!588363) (not e!482306))))

(assert (=> b!865847 (= res!588363 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!865847 (= lt!392536 (getCurrentListMapNoExtraKeys!3017 _keys!868 lt!392533 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865847 (= lt!392533 (array!49852 (store (arr!23957 _values!688) i!612 (ValueCellFull!7985 v!557)) (size!24399 _values!688)))))

(declare-fun lt!392530 () ListLongMap!10011)

(assert (=> b!865847 (= lt!392530 (getCurrentListMapNoExtraKeys!3017 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!588362 () Bool)

(assert (=> start!73780 (=> (not res!588362) (not e!482307))))

(assert (=> start!73780 (= res!588362 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24398 _keys!868))))))

(assert (=> start!73780 e!482307))

(assert (=> start!73780 tp_is_empty!16849))

(assert (=> start!73780 true))

(assert (=> start!73780 tp!51644))

(declare-fun array_inv!19008 (array!49849) Bool)

(assert (=> start!73780 (array_inv!19008 _keys!868)))

(declare-fun array_inv!19009 (array!49851) Bool)

(assert (=> start!73780 (and (array_inv!19009 _values!688) e!482308)))

(declare-fun b!865836 () Bool)

(declare-fun res!588356 () Bool)

(assert (=> b!865836 (=> (not res!588356) (not e!482307))))

(assert (=> b!865836 (= res!588356 (and (= (select (arr!23956 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865848 () Bool)

(declare-fun res!588353 () Bool)

(assert (=> b!865848 (=> (not res!588353) (not e!482307))))

(assert (=> b!865848 (= res!588353 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24398 _keys!868))))))

(declare-fun b!865849 () Bool)

(declare-fun res!588358 () Bool)

(assert (=> b!865849 (=> (not res!588358) (not e!482307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865849 (= res!588358 (validMask!0 mask!1196))))

(declare-fun b!865850 () Bool)

(declare-fun res!588354 () Bool)

(assert (=> b!865850 (=> (not res!588354) (not e!482307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49849 (_ BitVec 32)) Bool)

(assert (=> b!865850 (= res!588354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865851 () Bool)

(declare-fun res!588359 () Bool)

(assert (=> b!865851 (=> (not res!588359) (not e!482307))))

(assert (=> b!865851 (= res!588359 (validKeyInArray!0 k0!854))))

(assert (= (and start!73780 res!588362) b!865849))

(assert (= (and b!865849 res!588358) b!865846))

(assert (= (and b!865846 res!588360) b!865850))

(assert (= (and b!865850 res!588354) b!865839))

(assert (= (and b!865839 res!588361) b!865848))

(assert (= (and b!865848 res!588353) b!865851))

(assert (= (and b!865851 res!588359) b!865836))

(assert (= (and b!865836 res!588356) b!865847))

(assert (= (and b!865847 res!588363) b!865845))

(assert (= (and b!865845 (not res!588355)) b!865842))

(assert (= (and b!865842 c!92225) b!865840))

(assert (= (and b!865842 (not c!92225)) b!865843))

(assert (= (and b!865842 (not res!588357)) b!865837))

(assert (= (and b!865844 condMapEmpty!26873) mapIsEmpty!26873))

(assert (= (and b!865844 (not condMapEmpty!26873)) mapNonEmpty!26873))

(get-info :version)

(assert (= (and mapNonEmpty!26873 ((_ is ValueCellFull!7985) mapValue!26873)) b!865841))

(assert (= (and b!865844 ((_ is ValueCellFull!7985) mapDefault!26873)) b!865838))

(assert (= start!73780 b!865844))

(declare-fun b_lambda!12047 () Bool)

(assert (=> (not b_lambda!12047) (not b!865842)))

(declare-fun t!24009 () Bool)

(declare-fun tb!4827 () Bool)

(assert (=> (and start!73780 (= defaultEntry!696 defaultEntry!696) t!24009) tb!4827))

(declare-fun result!9273 () Bool)

(assert (=> tb!4827 (= result!9273 tp_is_empty!16849)))

(assert (=> b!865842 t!24009))

(declare-fun b_and!24381 () Bool)

(assert (= b_and!24379 (and (=> t!24009 result!9273) b_and!24381)))

(declare-fun m!806919 () Bool)

(assert (=> b!865845 m!806919))

(declare-fun m!806921 () Bool)

(assert (=> b!865845 m!806921))

(declare-fun m!806923 () Bool)

(assert (=> b!865845 m!806923))

(assert (=> b!865845 m!806921))

(declare-fun m!806925 () Bool)

(assert (=> b!865845 m!806925))

(declare-fun m!806927 () Bool)

(assert (=> b!865845 m!806927))

(declare-fun m!806929 () Bool)

(assert (=> b!865845 m!806929))

(declare-fun m!806931 () Bool)

(assert (=> mapNonEmpty!26873 m!806931))

(declare-fun m!806933 () Bool)

(assert (=> b!865839 m!806933))

(declare-fun m!806935 () Bool)

(assert (=> b!865851 m!806935))

(declare-fun m!806937 () Bool)

(assert (=> b!865840 m!806937))

(declare-fun m!806939 () Bool)

(assert (=> b!865840 m!806939))

(declare-fun m!806941 () Bool)

(assert (=> b!865840 m!806941))

(declare-fun m!806943 () Bool)

(assert (=> b!865840 m!806943))

(declare-fun m!806945 () Bool)

(assert (=> b!865840 m!806945))

(declare-fun m!806947 () Bool)

(assert (=> b!865836 m!806947))

(declare-fun m!806949 () Bool)

(assert (=> b!865837 m!806949))

(assert (=> b!865837 m!806949))

(declare-fun m!806951 () Bool)

(assert (=> b!865837 m!806951))

(assert (=> b!865837 m!806921))

(assert (=> b!865837 m!806921))

(declare-fun m!806953 () Bool)

(assert (=> b!865837 m!806953))

(declare-fun m!806955 () Bool)

(assert (=> b!865842 m!806955))

(declare-fun m!806957 () Bool)

(assert (=> b!865842 m!806957))

(declare-fun m!806959 () Bool)

(assert (=> b!865842 m!806959))

(declare-fun m!806961 () Bool)

(assert (=> b!865842 m!806961))

(assert (=> b!865842 m!806957))

(assert (=> b!865842 m!806921))

(assert (=> b!865842 m!806959))

(declare-fun m!806963 () Bool)

(assert (=> b!865850 m!806963))

(declare-fun m!806965 () Bool)

(assert (=> start!73780 m!806965))

(declare-fun m!806967 () Bool)

(assert (=> start!73780 m!806967))

(declare-fun m!806969 () Bool)

(assert (=> b!865847 m!806969))

(declare-fun m!806971 () Bool)

(assert (=> b!865847 m!806971))

(declare-fun m!806973 () Bool)

(assert (=> b!865847 m!806973))

(declare-fun m!806975 () Bool)

(assert (=> b!865849 m!806975))

(check-sat (not b!865845) (not b!865840) (not b!865847) (not start!73780) (not b!865851) (not b_next!14713) (not b!865837) (not b!865849) (not b!865842) tp_is_empty!16849 b_and!24381 (not b_lambda!12047) (not b!865839) (not mapNonEmpty!26873) (not b!865850))
(check-sat b_and!24381 (not b_next!14713))
