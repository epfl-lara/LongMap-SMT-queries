; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73538 () Bool)

(assert start!73538)

(declare-fun b_free!14453 () Bool)

(declare-fun b_next!14453 () Bool)

(assert (=> start!73538 (= b_free!14453 (not b_next!14453))))

(declare-fun tp!50863 () Bool)

(declare-fun b_and!23885 () Bool)

(assert (=> start!73538 (= tp!50863 b_and!23885)))

(declare-fun b!859601 () Bool)

(declare-fun res!584083 () Bool)

(declare-fun e!479030 () Bool)

(assert (=> b!859601 (=> (not res!584083) (not e!479030))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49354 0))(
  ( (array!49355 (arr!23708 (Array (_ BitVec 32) (_ BitVec 64))) (size!24148 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49354)

(declare-datatypes ((V!27165 0))(
  ( (V!27166 (val!8342 Int)) )
))
(declare-datatypes ((ValueCell!7855 0))(
  ( (ValueCellFull!7855 (v!10767 V!27165)) (EmptyCell!7855) )
))
(declare-datatypes ((array!49356 0))(
  ( (array!49357 (arr!23709 (Array (_ BitVec 32) ValueCell!7855)) (size!24149 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49356)

(assert (=> b!859601 (= res!584083 (and (= (size!24149 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24148 _keys!868) (size!24149 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859602 () Bool)

(declare-fun res!584081 () Bool)

(declare-fun e!479031 () Bool)

(assert (=> b!859602 (=> res!584081 e!479031)))

(declare-datatypes ((List!16825 0))(
  ( (Nil!16822) (Cons!16821 (h!17952 (_ BitVec 64)) (t!23544 List!16825)) )
))
(declare-fun noDuplicate!1303 (List!16825) Bool)

(assert (=> b!859602 (= res!584081 (not (noDuplicate!1303 Nil!16822)))))

(declare-fun b!859603 () Bool)

(declare-fun res!584071 () Bool)

(assert (=> b!859603 (=> res!584071 e!479031)))

(declare-fun contains!4221 (List!16825 (_ BitVec 64)) Bool)

(assert (=> b!859603 (= res!584071 (contains!4221 Nil!16822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859604 () Bool)

(declare-fun res!584080 () Bool)

(assert (=> b!859604 (=> (not res!584080) (not e!479030))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859604 (= res!584080 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24148 _keys!868))))))

(declare-fun b!859605 () Bool)

(declare-fun res!584079 () Bool)

(assert (=> b!859605 (=> (not res!584079) (not e!479030))))

(declare-fun arrayNoDuplicates!0 (array!49354 (_ BitVec 32) List!16825) Bool)

(assert (=> b!859605 (= res!584079 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16822))))

(declare-fun mapIsEmpty!26483 () Bool)

(declare-fun mapRes!26483 () Bool)

(assert (=> mapIsEmpty!26483 mapRes!26483))

(declare-fun mapNonEmpty!26483 () Bool)

(declare-fun tp!50862 () Bool)

(declare-fun e!479035 () Bool)

(assert (=> mapNonEmpty!26483 (= mapRes!26483 (and tp!50862 e!479035))))

(declare-fun mapKey!26483 () (_ BitVec 32))

(declare-fun mapRest!26483 () (Array (_ BitVec 32) ValueCell!7855))

(declare-fun mapValue!26483 () ValueCell!7855)

(assert (=> mapNonEmpty!26483 (= (arr!23709 _values!688) (store mapRest!26483 mapKey!26483 mapValue!26483))))

(declare-fun b!859607 () Bool)

(declare-fun e!479033 () Bool)

(declare-fun e!479032 () Bool)

(assert (=> b!859607 (= e!479033 (not e!479032))))

(declare-fun res!584072 () Bool)

(assert (=> b!859607 (=> res!584072 e!479032)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859607 (= res!584072 (not (validKeyInArray!0 (select (arr!23708 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11016 0))(
  ( (tuple2!11017 (_1!5519 (_ BitVec 64)) (_2!5519 V!27165)) )
))
(declare-datatypes ((List!16826 0))(
  ( (Nil!16823) (Cons!16822 (h!17953 tuple2!11016) (t!23545 List!16826)) )
))
(declare-datatypes ((ListLongMap!9785 0))(
  ( (ListLongMap!9786 (toList!4908 List!16826)) )
))
(declare-fun lt!387364 () ListLongMap!9785)

(declare-fun lt!387361 () ListLongMap!9785)

(assert (=> b!859607 (= lt!387364 lt!387361)))

(declare-fun v!557 () V!27165)

(declare-fun lt!387363 () ListLongMap!9785)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2261 (ListLongMap!9785 tuple2!11016) ListLongMap!9785)

(assert (=> b!859607 (= lt!387361 (+!2261 lt!387363 (tuple2!11017 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387359 () array!49356)

(declare-fun minValue!654 () V!27165)

(declare-fun zeroValue!654 () V!27165)

(declare-fun getCurrentListMapNoExtraKeys!2887 (array!49354 array!49356 (_ BitVec 32) (_ BitVec 32) V!27165 V!27165 (_ BitVec 32) Int) ListLongMap!9785)

(assert (=> b!859607 (= lt!387364 (getCurrentListMapNoExtraKeys!2887 _keys!868 lt!387359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859607 (= lt!387363 (getCurrentListMapNoExtraKeys!2887 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29307 0))(
  ( (Unit!29308) )
))
(declare-fun lt!387356 () Unit!29307)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!477 (array!49354 array!49356 (_ BitVec 32) (_ BitVec 32) V!27165 V!27165 (_ BitVec 32) (_ BitVec 64) V!27165 (_ BitVec 32) Int) Unit!29307)

(assert (=> b!859607 (= lt!387356 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!477 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859608 () Bool)

(declare-fun tp_is_empty!16589 () Bool)

(assert (=> b!859608 (= e!479035 tp_is_empty!16589)))

(declare-fun b!859609 () Bool)

(declare-fun res!584074 () Bool)

(assert (=> b!859609 (=> (not res!584074) (not e!479030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49354 (_ BitVec 32)) Bool)

(assert (=> b!859609 (= res!584074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859610 () Bool)

(declare-fun e!479034 () Bool)

(assert (=> b!859610 (= e!479034 tp_is_empty!16589)))

(declare-fun b!859611 () Bool)

(declare-fun res!584073 () Bool)

(assert (=> b!859611 (=> (not res!584073) (not e!479030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859611 (= res!584073 (validMask!0 mask!1196))))

(declare-fun b!859612 () Bool)

(assert (=> b!859612 (= e!479030 e!479033)))

(declare-fun res!584077 () Bool)

(assert (=> b!859612 (=> (not res!584077) (not e!479033))))

(assert (=> b!859612 (= res!584077 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387357 () ListLongMap!9785)

(assert (=> b!859612 (= lt!387357 (getCurrentListMapNoExtraKeys!2887 _keys!868 lt!387359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859612 (= lt!387359 (array!49357 (store (arr!23709 _values!688) i!612 (ValueCellFull!7855 v!557)) (size!24149 _values!688)))))

(declare-fun lt!387360 () ListLongMap!9785)

(assert (=> b!859612 (= lt!387360 (getCurrentListMapNoExtraKeys!2887 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859613 () Bool)

(declare-fun res!584078 () Bool)

(assert (=> b!859613 (=> (not res!584078) (not e!479030))))

(assert (=> b!859613 (= res!584078 (validKeyInArray!0 k!854))))

(declare-fun b!859614 () Bool)

(declare-fun e!479038 () Bool)

(assert (=> b!859614 (= e!479032 e!479038)))

(declare-fun res!584082 () Bool)

(assert (=> b!859614 (=> res!584082 e!479038)))

(assert (=> b!859614 (= res!584082 (not (= (select (arr!23708 _keys!868) from!1053) k!854)))))

(declare-fun get!12493 (ValueCell!7855 V!27165) V!27165)

(declare-fun dynLambda!1099 (Int (_ BitVec 64)) V!27165)

(assert (=> b!859614 (= lt!387357 (+!2261 lt!387361 (tuple2!11017 (select (arr!23708 _keys!868) from!1053) (get!12493 (select (arr!23709 _values!688) from!1053) (dynLambda!1099 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859615 () Bool)

(assert (=> b!859615 (= e!479038 e!479031)))

(declare-fun res!584075 () Bool)

(assert (=> b!859615 (=> res!584075 e!479031)))

(assert (=> b!859615 (= res!584075 (or (bvsge (size!24148 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24148 _keys!868)) (bvsge from!1053 (size!24148 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859615 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387358 () Unit!29307)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49354 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29307)

(assert (=> b!859615 (= lt!387358 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!859615 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16822)))

(declare-fun lt!387362 () Unit!29307)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49354 (_ BitVec 32) (_ BitVec 32)) Unit!29307)

(assert (=> b!859615 (= lt!387362 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859616 () Bool)

(assert (=> b!859616 (= e!479031 true)))

(declare-fun lt!387355 () Bool)

(assert (=> b!859616 (= lt!387355 (contains!4221 Nil!16822 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859617 () Bool)

(declare-fun e!479037 () Bool)

(assert (=> b!859617 (= e!479037 (and e!479034 mapRes!26483))))

(declare-fun condMapEmpty!26483 () Bool)

(declare-fun mapDefault!26483 () ValueCell!7855)

