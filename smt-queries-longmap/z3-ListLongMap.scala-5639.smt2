; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73600 () Bool)

(assert start!73600)

(declare-fun b_free!14533 () Bool)

(declare-fun b_next!14533 () Bool)

(assert (=> start!73600 (= b_free!14533 (not b_next!14533))))

(declare-fun tp!51103 () Bool)

(declare-fun b_and!24019 () Bool)

(assert (=> start!73600 (= tp!51103 b_and!24019)))

(declare-fun b!861370 () Bool)

(declare-fun e!479911 () Bool)

(declare-fun e!479910 () Bool)

(declare-fun mapRes!26603 () Bool)

(assert (=> b!861370 (= e!479911 (and e!479910 mapRes!26603))))

(declare-fun condMapEmpty!26603 () Bool)

(declare-datatypes ((V!27273 0))(
  ( (V!27274 (val!8382 Int)) )
))
(declare-datatypes ((ValueCell!7895 0))(
  ( (ValueCellFull!7895 (v!10801 V!27273)) (EmptyCell!7895) )
))
(declare-datatypes ((array!49493 0))(
  ( (array!49494 (arr!23778 (Array (_ BitVec 32) ValueCell!7895)) (size!24220 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49493)

(declare-fun mapDefault!26603 () ValueCell!7895)

(assert (=> b!861370 (= condMapEmpty!26603 (= (arr!23778 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7895)) mapDefault!26603)))))

(declare-fun b!861371 () Bool)

(declare-datatypes ((Unit!29318 0))(
  ( (Unit!29319) )
))
(declare-fun e!479908 () Unit!29318)

(declare-fun Unit!29320 () Unit!29318)

(assert (=> b!861371 (= e!479908 Unit!29320)))

(declare-fun mapIsEmpty!26603 () Bool)

(assert (=> mapIsEmpty!26603 mapRes!26603))

(declare-fun mapNonEmpty!26603 () Bool)

(declare-fun tp!51104 () Bool)

(declare-fun e!479906 () Bool)

(assert (=> mapNonEmpty!26603 (= mapRes!26603 (and tp!51104 e!479906))))

(declare-fun mapValue!26603 () ValueCell!7895)

(declare-fun mapRest!26603 () (Array (_ BitVec 32) ValueCell!7895))

(declare-fun mapKey!26603 () (_ BitVec 32))

(assert (=> mapNonEmpty!26603 (= (arr!23778 _values!688) (store mapRest!26603 mapKey!26603 mapValue!26603))))

(declare-fun b!861373 () Bool)

(declare-fun res!585421 () Bool)

(declare-fun e!479913 () Bool)

(assert (=> b!861373 (=> (not res!585421) (not e!479913))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861373 (= res!585421 (validMask!0 mask!1196))))

(declare-fun b!861374 () Bool)

(declare-fun res!585422 () Bool)

(assert (=> b!861374 (=> (not res!585422) (not e!479913))))

(declare-datatypes ((array!49495 0))(
  ( (array!49496 (arr!23779 (Array (_ BitVec 32) (_ BitVec 64))) (size!24221 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49495)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49495 (_ BitVec 32)) Bool)

(assert (=> b!861374 (= res!585422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861375 () Bool)

(declare-fun e!479907 () Bool)

(assert (=> b!861375 (= e!479907 true)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!861375 (not (= (select (arr!23779 _keys!868) from!1053) k0!854))))

(declare-fun lt!388375 () Unit!29318)

(assert (=> b!861375 (= lt!388375 e!479908)))

(declare-fun c!91955 () Bool)

(assert (=> b!861375 (= c!91955 (= (select (arr!23779 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11092 0))(
  ( (tuple2!11093 (_1!5557 (_ BitVec 64)) (_2!5557 V!27273)) )
))
(declare-datatypes ((List!16891 0))(
  ( (Nil!16888) (Cons!16887 (h!18018 tuple2!11092) (t!23681 List!16891)) )
))
(declare-datatypes ((ListLongMap!9851 0))(
  ( (ListLongMap!9852 (toList!4941 List!16891)) )
))
(declare-fun lt!388381 () ListLongMap!9851)

(declare-fun lt!388385 () ListLongMap!9851)

(declare-fun +!2310 (ListLongMap!9851 tuple2!11092) ListLongMap!9851)

(declare-fun get!12545 (ValueCell!7895 V!27273) V!27273)

(declare-fun dynLambda!1120 (Int (_ BitVec 64)) V!27273)

(assert (=> b!861375 (= lt!388381 (+!2310 lt!388385 (tuple2!11093 (select (arr!23779 _keys!868) from!1053) (get!12545 (select (arr!23778 _values!688) from!1053) (dynLambda!1120 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861376 () Bool)

(declare-fun tp_is_empty!16669 () Bool)

(assert (=> b!861376 (= e!479910 tp_is_empty!16669)))

(declare-fun b!861377 () Bool)

(declare-fun res!585423 () Bool)

(assert (=> b!861377 (=> (not res!585423) (not e!479913))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861377 (= res!585423 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24221 _keys!868))))))

(declare-fun b!861378 () Bool)

(declare-fun res!585424 () Bool)

(assert (=> b!861378 (=> (not res!585424) (not e!479913))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!861378 (= res!585424 (and (= (size!24220 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24221 _keys!868) (size!24220 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861379 () Bool)

(declare-fun e!479909 () Bool)

(assert (=> b!861379 (= e!479913 e!479909)))

(declare-fun res!585418 () Bool)

(assert (=> b!861379 (=> (not res!585418) (not e!479909))))

(assert (=> b!861379 (= res!585418 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388379 () array!49493)

(declare-fun minValue!654 () V!27273)

(declare-fun zeroValue!654 () V!27273)

(declare-fun getCurrentListMapNoExtraKeys!2944 (array!49495 array!49493 (_ BitVec 32) (_ BitVec 32) V!27273 V!27273 (_ BitVec 32) Int) ListLongMap!9851)

(assert (=> b!861379 (= lt!388381 (getCurrentListMapNoExtraKeys!2944 _keys!868 lt!388379 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27273)

(assert (=> b!861379 (= lt!388379 (array!49494 (store (arr!23778 _values!688) i!612 (ValueCellFull!7895 v!557)) (size!24220 _values!688)))))

(declare-fun lt!388382 () ListLongMap!9851)

(assert (=> b!861379 (= lt!388382 (getCurrentListMapNoExtraKeys!2944 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861372 () Bool)

(declare-fun res!585420 () Bool)

(assert (=> b!861372 (=> (not res!585420) (not e!479913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861372 (= res!585420 (validKeyInArray!0 k0!854))))

(declare-fun res!585426 () Bool)

(assert (=> start!73600 (=> (not res!585426) (not e!479913))))

(assert (=> start!73600 (= res!585426 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24221 _keys!868))))))

(assert (=> start!73600 e!479913))

(assert (=> start!73600 tp_is_empty!16669))

(assert (=> start!73600 true))

(assert (=> start!73600 tp!51103))

(declare-fun array_inv!18890 (array!49495) Bool)

(assert (=> start!73600 (array_inv!18890 _keys!868)))

(declare-fun array_inv!18891 (array!49493) Bool)

(assert (=> start!73600 (and (array_inv!18891 _values!688) e!479911)))

(declare-fun b!861380 () Bool)

(assert (=> b!861380 (= e!479906 tp_is_empty!16669)))

(declare-fun b!861381 () Bool)

(declare-fun res!585417 () Bool)

(assert (=> b!861381 (=> (not res!585417) (not e!479913))))

(declare-datatypes ((List!16892 0))(
  ( (Nil!16889) (Cons!16888 (h!18019 (_ BitVec 64)) (t!23682 List!16892)) )
))
(declare-fun arrayNoDuplicates!0 (array!49495 (_ BitVec 32) List!16892) Bool)

(assert (=> b!861381 (= res!585417 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16889))))

(declare-fun b!861382 () Bool)

(assert (=> b!861382 (= e!479909 (not e!479907))))

(declare-fun res!585419 () Bool)

(assert (=> b!861382 (=> res!585419 e!479907)))

(assert (=> b!861382 (= res!585419 (not (validKeyInArray!0 (select (arr!23779 _keys!868) from!1053))))))

(declare-fun lt!388378 () ListLongMap!9851)

(assert (=> b!861382 (= lt!388378 lt!388385)))

(declare-fun lt!388380 () ListLongMap!9851)

(assert (=> b!861382 (= lt!388385 (+!2310 lt!388380 (tuple2!11093 k0!854 v!557)))))

(assert (=> b!861382 (= lt!388378 (getCurrentListMapNoExtraKeys!2944 _keys!868 lt!388379 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861382 (= lt!388380 (getCurrentListMapNoExtraKeys!2944 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388383 () Unit!29318)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!500 (array!49495 array!49493 (_ BitVec 32) (_ BitVec 32) V!27273 V!27273 (_ BitVec 32) (_ BitVec 64) V!27273 (_ BitVec 32) Int) Unit!29318)

(assert (=> b!861382 (= lt!388383 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!500 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861383 () Bool)

(declare-fun Unit!29321 () Unit!29318)

(assert (=> b!861383 (= e!479908 Unit!29321)))

(declare-fun lt!388377 () Unit!29318)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49495 (_ BitVec 32) (_ BitVec 32)) Unit!29318)

(assert (=> b!861383 (= lt!388377 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!861383 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16889)))

(declare-fun lt!388384 () Unit!29318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49495 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29318)

(assert (=> b!861383 (= lt!388384 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861383 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388376 () Unit!29318)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49495 (_ BitVec 64) (_ BitVec 32) List!16892) Unit!29318)

(assert (=> b!861383 (= lt!388376 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16889))))

(assert (=> b!861383 false))

(declare-fun b!861384 () Bool)

(declare-fun res!585425 () Bool)

(assert (=> b!861384 (=> (not res!585425) (not e!479913))))

(assert (=> b!861384 (= res!585425 (and (= (select (arr!23779 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73600 res!585426) b!861373))

(assert (= (and b!861373 res!585421) b!861378))

(assert (= (and b!861378 res!585424) b!861374))

(assert (= (and b!861374 res!585422) b!861381))

(assert (= (and b!861381 res!585417) b!861377))

(assert (= (and b!861377 res!585423) b!861372))

(assert (= (and b!861372 res!585420) b!861384))

(assert (= (and b!861384 res!585425) b!861379))

(assert (= (and b!861379 res!585418) b!861382))

(assert (= (and b!861382 (not res!585419)) b!861375))

(assert (= (and b!861375 c!91955) b!861383))

(assert (= (and b!861375 (not c!91955)) b!861371))

(assert (= (and b!861370 condMapEmpty!26603) mapIsEmpty!26603))

(assert (= (and b!861370 (not condMapEmpty!26603)) mapNonEmpty!26603))

(get-info :version)

(assert (= (and mapNonEmpty!26603 ((_ is ValueCellFull!7895) mapValue!26603)) b!861380))

(assert (= (and b!861370 ((_ is ValueCellFull!7895) mapDefault!26603)) b!861376))

(assert (= start!73600 b!861370))

(declare-fun b_lambda!11867 () Bool)

(assert (=> (not b_lambda!11867) (not b!861375)))

(declare-fun t!23680 () Bool)

(declare-fun tb!4647 () Bool)

(assert (=> (and start!73600 (= defaultEntry!696 defaultEntry!696) t!23680) tb!4647))

(declare-fun result!8913 () Bool)

(assert (=> tb!4647 (= result!8913 tp_is_empty!16669)))

(assert (=> b!861375 t!23680))

(declare-fun b_and!24021 () Bool)

(assert (= b_and!24019 (and (=> t!23680 result!8913) b_and!24021)))

(declare-fun m!801771 () Bool)

(assert (=> b!861374 m!801771))

(declare-fun m!801773 () Bool)

(assert (=> b!861382 m!801773))

(declare-fun m!801775 () Bool)

(assert (=> b!861382 m!801775))

(declare-fun m!801777 () Bool)

(assert (=> b!861382 m!801777))

(declare-fun m!801779 () Bool)

(assert (=> b!861382 m!801779))

(assert (=> b!861382 m!801777))

(declare-fun m!801781 () Bool)

(assert (=> b!861382 m!801781))

(declare-fun m!801783 () Bool)

(assert (=> b!861382 m!801783))

(declare-fun m!801785 () Bool)

(assert (=> b!861379 m!801785))

(declare-fun m!801787 () Bool)

(assert (=> b!861379 m!801787))

(declare-fun m!801789 () Bool)

(assert (=> b!861379 m!801789))

(declare-fun m!801791 () Bool)

(assert (=> b!861372 m!801791))

(declare-fun m!801793 () Bool)

(assert (=> b!861373 m!801793))

(declare-fun m!801795 () Bool)

(assert (=> b!861381 m!801795))

(declare-fun m!801797 () Bool)

(assert (=> start!73600 m!801797))

(declare-fun m!801799 () Bool)

(assert (=> start!73600 m!801799))

(declare-fun m!801801 () Bool)

(assert (=> mapNonEmpty!26603 m!801801))

(declare-fun m!801803 () Bool)

(assert (=> b!861383 m!801803))

(declare-fun m!801805 () Bool)

(assert (=> b!861383 m!801805))

(declare-fun m!801807 () Bool)

(assert (=> b!861383 m!801807))

(declare-fun m!801809 () Bool)

(assert (=> b!861383 m!801809))

(declare-fun m!801811 () Bool)

(assert (=> b!861383 m!801811))

(declare-fun m!801813 () Bool)

(assert (=> b!861375 m!801813))

(declare-fun m!801815 () Bool)

(assert (=> b!861375 m!801815))

(declare-fun m!801817 () Bool)

(assert (=> b!861375 m!801817))

(declare-fun m!801819 () Bool)

(assert (=> b!861375 m!801819))

(assert (=> b!861375 m!801815))

(assert (=> b!861375 m!801777))

(assert (=> b!861375 m!801817))

(declare-fun m!801821 () Bool)

(assert (=> b!861384 m!801821))

(check-sat (not b!861382) (not b!861381) b_and!24021 (not b_next!14533) (not mapNonEmpty!26603) (not b!861372) (not b!861379) tp_is_empty!16669 (not start!73600) (not b_lambda!11867) (not b!861373) (not b!861375) (not b!861374) (not b!861383))
(check-sat b_and!24021 (not b_next!14533))
