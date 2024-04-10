; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73776 () Bool)

(assert start!73776)

(declare-fun b_free!14691 () Bool)

(declare-fun b_next!14691 () Bool)

(assert (=> start!73776 (= b_free!14691 (not b_next!14691))))

(declare-fun tp!51576 () Bool)

(declare-fun b_and!24361 () Bool)

(assert (=> start!73776 (= tp!51576 b_and!24361)))

(declare-fun b!865525 () Bool)

(declare-fun e!482156 () Bool)

(declare-fun tp_is_empty!16827 () Bool)

(assert (=> b!865525 (= e!482156 tp_is_empty!16827)))

(declare-fun mapIsEmpty!26840 () Bool)

(declare-fun mapRes!26840 () Bool)

(assert (=> mapIsEmpty!26840 mapRes!26840))

(declare-fun b!865526 () Bool)

(declare-fun e!482161 () Bool)

(assert (=> b!865526 (= e!482161 true)))

(declare-datatypes ((V!27483 0))(
  ( (V!27484 (val!8461 Int)) )
))
(declare-datatypes ((tuple2!11214 0))(
  ( (tuple2!11215 (_1!5618 (_ BitVec 64)) (_2!5618 V!27483)) )
))
(declare-fun lt!392239 () tuple2!11214)

(declare-datatypes ((List!17017 0))(
  ( (Nil!17014) (Cons!17013 (h!18144 tuple2!11214) (t!23974 List!17017)) )
))
(declare-datatypes ((ListLongMap!9983 0))(
  ( (ListLongMap!9984 (toList!5007 List!17017)) )
))
(declare-fun lt!392238 () ListLongMap!9983)

(declare-fun lt!392247 () tuple2!11214)

(declare-fun lt!392244 () ListLongMap!9983)

(declare-fun +!2356 (ListLongMap!9983 tuple2!11214) ListLongMap!9983)

(assert (=> b!865526 (= lt!392238 (+!2356 (+!2356 lt!392244 lt!392247) lt!392239))))

(declare-fun v!557 () V!27483)

(declare-datatypes ((Unit!29646 0))(
  ( (Unit!29647) )
))
(declare-fun lt!392236 () Unit!29646)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49814 0))(
  ( (array!49815 (arr!23938 (Array (_ BitVec 32) (_ BitVec 64))) (size!24378 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49814)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!392237 () V!27483)

(declare-fun addCommutativeForDiffKeys!525 (ListLongMap!9983 (_ BitVec 64) V!27483 (_ BitVec 64) V!27483) Unit!29646)

(assert (=> b!865526 (= lt!392236 (addCommutativeForDiffKeys!525 lt!392244 k0!854 v!557 (select (arr!23938 _keys!868) from!1053) lt!392237))))

(declare-fun res!588101 () Bool)

(declare-fun e!482155 () Bool)

(assert (=> start!73776 (=> (not res!588101) (not e!482155))))

(assert (=> start!73776 (= res!588101 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24378 _keys!868))))))

(assert (=> start!73776 e!482155))

(assert (=> start!73776 tp_is_empty!16827))

(assert (=> start!73776 true))

(assert (=> start!73776 tp!51576))

(declare-fun array_inv!18924 (array!49814) Bool)

(assert (=> start!73776 (array_inv!18924 _keys!868)))

(declare-datatypes ((ValueCell!7974 0))(
  ( (ValueCellFull!7974 (v!10886 V!27483)) (EmptyCell!7974) )
))
(declare-datatypes ((array!49816 0))(
  ( (array!49817 (arr!23939 (Array (_ BitVec 32) ValueCell!7974)) (size!24379 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49816)

(declare-fun e!482153 () Bool)

(declare-fun array_inv!18925 (array!49816) Bool)

(assert (=> start!73776 (and (array_inv!18925 _values!688) e!482153)))

(declare-fun mapNonEmpty!26840 () Bool)

(declare-fun tp!51577 () Bool)

(assert (=> mapNonEmpty!26840 (= mapRes!26840 (and tp!51577 e!482156))))

(declare-fun mapRest!26840 () (Array (_ BitVec 32) ValueCell!7974))

(declare-fun mapValue!26840 () ValueCell!7974)

(declare-fun mapKey!26840 () (_ BitVec 32))

(assert (=> mapNonEmpty!26840 (= (arr!23939 _values!688) (store mapRest!26840 mapKey!26840 mapValue!26840))))

(declare-fun b!865527 () Bool)

(declare-fun res!588109 () Bool)

(assert (=> b!865527 (=> (not res!588109) (not e!482155))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865527 (= res!588109 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24378 _keys!868))))))

(declare-fun b!865528 () Bool)

(declare-fun res!588100 () Bool)

(assert (=> b!865528 (=> (not res!588100) (not e!482155))))

(declare-datatypes ((List!17018 0))(
  ( (Nil!17015) (Cons!17014 (h!18145 (_ BitVec 64)) (t!23975 List!17018)) )
))
(declare-fun arrayNoDuplicates!0 (array!49814 (_ BitVec 32) List!17018) Bool)

(assert (=> b!865528 (= res!588100 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17015))))

(declare-fun b!865529 () Bool)

(declare-fun res!588104 () Bool)

(assert (=> b!865529 (=> (not res!588104) (not e!482155))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865529 (= res!588104 (validMask!0 mask!1196))))

(declare-fun b!865530 () Bool)

(declare-fun res!588108 () Bool)

(assert (=> b!865530 (=> (not res!588108) (not e!482155))))

(assert (=> b!865530 (= res!588108 (and (= (select (arr!23938 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865531 () Bool)

(declare-fun e!482157 () Unit!29646)

(declare-fun Unit!29648 () Unit!29646)

(assert (=> b!865531 (= e!482157 Unit!29648)))

(declare-fun lt!392235 () Unit!29646)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49814 (_ BitVec 32) (_ BitVec 32)) Unit!29646)

(assert (=> b!865531 (= lt!392235 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865531 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17015)))

(declare-fun lt!392233 () Unit!29646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49814 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29646)

(assert (=> b!865531 (= lt!392233 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865531 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392241 () Unit!29646)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49814 (_ BitVec 64) (_ BitVec 32) List!17018) Unit!29646)

(assert (=> b!865531 (= lt!392241 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17015))))

(assert (=> b!865531 false))

(declare-fun b!865532 () Bool)

(declare-fun Unit!29649 () Unit!29646)

(assert (=> b!865532 (= e!482157 Unit!29649)))

(declare-fun b!865533 () Bool)

(declare-fun e!482160 () Bool)

(assert (=> b!865533 (= e!482155 e!482160)))

(declare-fun res!588105 () Bool)

(assert (=> b!865533 (=> (not res!588105) (not e!482160))))

(assert (=> b!865533 (= res!588105 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392248 () array!49816)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27483)

(declare-fun zeroValue!654 () V!27483)

(declare-fun lt!392245 () ListLongMap!9983)

(declare-fun getCurrentListMapNoExtraKeys!2978 (array!49814 array!49816 (_ BitVec 32) (_ BitVec 32) V!27483 V!27483 (_ BitVec 32) Int) ListLongMap!9983)

(assert (=> b!865533 (= lt!392245 (getCurrentListMapNoExtraKeys!2978 _keys!868 lt!392248 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865533 (= lt!392248 (array!49817 (store (arr!23939 _values!688) i!612 (ValueCellFull!7974 v!557)) (size!24379 _values!688)))))

(declare-fun lt!392246 () ListLongMap!9983)

(assert (=> b!865533 (= lt!392246 (getCurrentListMapNoExtraKeys!2978 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865534 () Bool)

(declare-fun e!482159 () Bool)

(assert (=> b!865534 (= e!482153 (and e!482159 mapRes!26840))))

(declare-fun condMapEmpty!26840 () Bool)

(declare-fun mapDefault!26840 () ValueCell!7974)

(assert (=> b!865534 (= condMapEmpty!26840 (= (arr!23939 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7974)) mapDefault!26840)))))

(declare-fun b!865535 () Bool)

(declare-fun res!588103 () Bool)

(assert (=> b!865535 (=> (not res!588103) (not e!482155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865535 (= res!588103 (validKeyInArray!0 k0!854))))

(declare-fun b!865536 () Bool)

(declare-fun e!482158 () Bool)

(assert (=> b!865536 (= e!482160 (not e!482158))))

(declare-fun res!588107 () Bool)

(assert (=> b!865536 (=> res!588107 e!482158)))

(assert (=> b!865536 (= res!588107 (not (validKeyInArray!0 (select (arr!23938 _keys!868) from!1053))))))

(declare-fun lt!392240 () ListLongMap!9983)

(declare-fun lt!392242 () ListLongMap!9983)

(assert (=> b!865536 (= lt!392240 lt!392242)))

(assert (=> b!865536 (= lt!392242 (+!2356 lt!392244 lt!392239))))

(assert (=> b!865536 (= lt!392240 (getCurrentListMapNoExtraKeys!2978 _keys!868 lt!392248 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865536 (= lt!392239 (tuple2!11215 k0!854 v!557))))

(assert (=> b!865536 (= lt!392244 (getCurrentListMapNoExtraKeys!2978 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392243 () Unit!29646)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!556 (array!49814 array!49816 (_ BitVec 32) (_ BitVec 32) V!27483 V!27483 (_ BitVec 32) (_ BitVec 64) V!27483 (_ BitVec 32) Int) Unit!29646)

(assert (=> b!865536 (= lt!392243 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!556 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865537 () Bool)

(assert (=> b!865537 (= e!482159 tp_is_empty!16827)))

(declare-fun b!865538 () Bool)

(assert (=> b!865538 (= e!482158 e!482161)))

(declare-fun res!588110 () Bool)

(assert (=> b!865538 (=> res!588110 e!482161)))

(assert (=> b!865538 (= res!588110 (= k0!854 (select (arr!23938 _keys!868) from!1053)))))

(assert (=> b!865538 (not (= (select (arr!23938 _keys!868) from!1053) k0!854))))

(declare-fun lt!392234 () Unit!29646)

(assert (=> b!865538 (= lt!392234 e!482157)))

(declare-fun c!92257 () Bool)

(assert (=> b!865538 (= c!92257 (= (select (arr!23938 _keys!868) from!1053) k0!854))))

(assert (=> b!865538 (= lt!392245 lt!392238)))

(assert (=> b!865538 (= lt!392238 (+!2356 lt!392242 lt!392247))))

(assert (=> b!865538 (= lt!392247 (tuple2!11215 (select (arr!23938 _keys!868) from!1053) lt!392237))))

(declare-fun get!12652 (ValueCell!7974 V!27483) V!27483)

(declare-fun dynLambda!1178 (Int (_ BitVec 64)) V!27483)

(assert (=> b!865538 (= lt!392237 (get!12652 (select (arr!23939 _values!688) from!1053) (dynLambda!1178 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865539 () Bool)

(declare-fun res!588106 () Bool)

(assert (=> b!865539 (=> (not res!588106) (not e!482155))))

(assert (=> b!865539 (= res!588106 (and (= (size!24379 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24378 _keys!868) (size!24379 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865540 () Bool)

(declare-fun res!588102 () Bool)

(assert (=> b!865540 (=> (not res!588102) (not e!482155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49814 (_ BitVec 32)) Bool)

(assert (=> b!865540 (= res!588102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73776 res!588101) b!865529))

(assert (= (and b!865529 res!588104) b!865539))

(assert (= (and b!865539 res!588106) b!865540))

(assert (= (and b!865540 res!588102) b!865528))

(assert (= (and b!865528 res!588100) b!865527))

(assert (= (and b!865527 res!588109) b!865535))

(assert (= (and b!865535 res!588103) b!865530))

(assert (= (and b!865530 res!588108) b!865533))

(assert (= (and b!865533 res!588105) b!865536))

(assert (= (and b!865536 (not res!588107)) b!865538))

(assert (= (and b!865538 c!92257) b!865531))

(assert (= (and b!865538 (not c!92257)) b!865532))

(assert (= (and b!865538 (not res!588110)) b!865526))

(assert (= (and b!865534 condMapEmpty!26840) mapIsEmpty!26840))

(assert (= (and b!865534 (not condMapEmpty!26840)) mapNonEmpty!26840))

(get-info :version)

(assert (= (and mapNonEmpty!26840 ((_ is ValueCellFull!7974) mapValue!26840)) b!865525))

(assert (= (and b!865534 ((_ is ValueCellFull!7974) mapDefault!26840)) b!865537))

(assert (= start!73776 b!865534))

(declare-fun b_lambda!12043 () Bool)

(assert (=> (not b_lambda!12043) (not b!865538)))

(declare-fun t!23973 () Bool)

(declare-fun tb!4813 () Bool)

(assert (=> (and start!73776 (= defaultEntry!696 defaultEntry!696) t!23973) tb!4813))

(declare-fun result!9237 () Bool)

(assert (=> tb!4813 (= result!9237 tp_is_empty!16827)))

(assert (=> b!865538 t!23973))

(declare-fun b_and!24363 () Bool)

(assert (= b_and!24361 (and (=> t!23973 result!9237) b_and!24363)))

(declare-fun m!807039 () Bool)

(assert (=> start!73776 m!807039))

(declare-fun m!807041 () Bool)

(assert (=> start!73776 m!807041))

(declare-fun m!807043 () Bool)

(assert (=> b!865531 m!807043))

(declare-fun m!807045 () Bool)

(assert (=> b!865531 m!807045))

(declare-fun m!807047 () Bool)

(assert (=> b!865531 m!807047))

(declare-fun m!807049 () Bool)

(assert (=> b!865531 m!807049))

(declare-fun m!807051 () Bool)

(assert (=> b!865531 m!807051))

(declare-fun m!807053 () Bool)

(assert (=> b!865540 m!807053))

(declare-fun m!807055 () Bool)

(assert (=> b!865535 m!807055))

(declare-fun m!807057 () Bool)

(assert (=> b!865536 m!807057))

(declare-fun m!807059 () Bool)

(assert (=> b!865536 m!807059))

(declare-fun m!807061 () Bool)

(assert (=> b!865536 m!807061))

(assert (=> b!865536 m!807059))

(declare-fun m!807063 () Bool)

(assert (=> b!865536 m!807063))

(declare-fun m!807065 () Bool)

(assert (=> b!865536 m!807065))

(declare-fun m!807067 () Bool)

(assert (=> b!865536 m!807067))

(declare-fun m!807069 () Bool)

(assert (=> b!865533 m!807069))

(declare-fun m!807071 () Bool)

(assert (=> b!865533 m!807071))

(declare-fun m!807073 () Bool)

(assert (=> b!865533 m!807073))

(declare-fun m!807075 () Bool)

(assert (=> mapNonEmpty!26840 m!807075))

(declare-fun m!807077 () Bool)

(assert (=> b!865526 m!807077))

(assert (=> b!865526 m!807077))

(declare-fun m!807079 () Bool)

(assert (=> b!865526 m!807079))

(assert (=> b!865526 m!807059))

(assert (=> b!865526 m!807059))

(declare-fun m!807081 () Bool)

(assert (=> b!865526 m!807081))

(declare-fun m!807083 () Bool)

(assert (=> b!865528 m!807083))

(declare-fun m!807085 () Bool)

(assert (=> b!865538 m!807085))

(declare-fun m!807087 () Bool)

(assert (=> b!865538 m!807087))

(declare-fun m!807089 () Bool)

(assert (=> b!865538 m!807089))

(declare-fun m!807091 () Bool)

(assert (=> b!865538 m!807091))

(assert (=> b!865538 m!807087))

(assert (=> b!865538 m!807059))

(assert (=> b!865538 m!807089))

(declare-fun m!807093 () Bool)

(assert (=> b!865529 m!807093))

(declare-fun m!807095 () Bool)

(assert (=> b!865530 m!807095))

(check-sat (not b!865529) (not b!865531) (not b!865538) (not b_next!14691) b_and!24363 (not b!865533) (not b!865528) (not b!865540) (not b!865536) (not b!865526) (not b_lambda!12043) (not start!73776) (not b!865535) tp_is_empty!16827 (not mapNonEmpty!26840))
(check-sat b_and!24363 (not b_next!14691))
