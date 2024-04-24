; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73636 () Bool)

(assert start!73636)

(declare-fun b_free!14383 () Bool)

(declare-fun b_next!14383 () Bool)

(assert (=> start!73636 (= b_free!14383 (not b_next!14383))))

(declare-fun tp!50654 () Bool)

(declare-fun b_and!23755 () Bool)

(assert (=> start!73636 (= tp!50654 b_and!23755)))

(declare-fun b!858947 () Bool)

(declare-fun e!478794 () Bool)

(declare-fun e!478795 () Bool)

(declare-fun mapRes!26378 () Bool)

(assert (=> b!858947 (= e!478794 (and e!478795 mapRes!26378))))

(declare-fun condMapEmpty!26378 () Bool)

(declare-datatypes ((V!27073 0))(
  ( (V!27074 (val!8307 Int)) )
))
(declare-datatypes ((ValueCell!7820 0))(
  ( (ValueCellFull!7820 (v!10732 V!27073)) (EmptyCell!7820) )
))
(declare-datatypes ((array!49269 0))(
  ( (array!49270 (arr!23661 (Array (_ BitVec 32) ValueCell!7820)) (size!24102 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49269)

(declare-fun mapDefault!26378 () ValueCell!7820)

(assert (=> b!858947 (= condMapEmpty!26378 (= (arr!23661 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7820)) mapDefault!26378)))))

(declare-fun b!858949 () Bool)

(declare-fun res!583251 () Bool)

(declare-fun e!478789 () Bool)

(assert (=> b!858949 (=> (not res!583251) (not e!478789))))

(declare-datatypes ((array!49271 0))(
  ( (array!49272 (arr!23662 (Array (_ BitVec 32) (_ BitVec 64))) (size!24103 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49271)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49271 (_ BitVec 32)) Bool)

(assert (=> b!858949 (= res!583251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858950 () Bool)

(declare-fun e!478792 () Bool)

(declare-fun e!478793 () Bool)

(assert (=> b!858950 (= e!478792 (not e!478793))))

(declare-fun res!583250 () Bool)

(assert (=> b!858950 (=> res!583250 e!478793)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858950 (= res!583250 (not (validKeyInArray!0 (select (arr!23662 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!10886 0))(
  ( (tuple2!10887 (_1!5454 (_ BitVec 64)) (_2!5454 V!27073)) )
))
(declare-datatypes ((List!16727 0))(
  ( (Nil!16724) (Cons!16723 (h!17860 tuple2!10886) (t!23368 List!16727)) )
))
(declare-datatypes ((ListLongMap!9657 0))(
  ( (ListLongMap!9658 (toList!4844 List!16727)) )
))
(declare-fun lt!386877 () ListLongMap!9657)

(declare-fun lt!386882 () ListLongMap!9657)

(assert (=> b!858950 (= lt!386877 lt!386882)))

(declare-fun v!557 () V!27073)

(declare-fun lt!386881 () ListLongMap!9657)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2251 (ListLongMap!9657 tuple2!10886) ListLongMap!9657)

(assert (=> b!858950 (= lt!386882 (+!2251 lt!386881 (tuple2!10887 k0!854 v!557)))))

(declare-fun lt!386879 () array!49269)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27073)

(declare-fun zeroValue!654 () V!27073)

(declare-fun getCurrentListMapNoExtraKeys!2900 (array!49271 array!49269 (_ BitVec 32) (_ BitVec 32) V!27073 V!27073 (_ BitVec 32) Int) ListLongMap!9657)

(assert (=> b!858950 (= lt!386877 (getCurrentListMapNoExtraKeys!2900 _keys!868 lt!386879 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858950 (= lt!386881 (getCurrentListMapNoExtraKeys!2900 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29256 0))(
  ( (Unit!29257) )
))
(declare-fun lt!386878 () Unit!29256)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!448 (array!49271 array!49269 (_ BitVec 32) (_ BitVec 32) V!27073 V!27073 (_ BitVec 32) (_ BitVec 64) V!27073 (_ BitVec 32) Int) Unit!29256)

(assert (=> b!858950 (= lt!386878 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!448 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858951 () Bool)

(declare-fun res!583244 () Bool)

(assert (=> b!858951 (=> (not res!583244) (not e!478789))))

(assert (=> b!858951 (= res!583244 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24103 _keys!868))))))

(declare-fun b!858952 () Bool)

(declare-fun tp_is_empty!16519 () Bool)

(assert (=> b!858952 (= e!478795 tp_is_empty!16519)))

(declare-fun b!858953 () Bool)

(declare-fun res!583246 () Bool)

(assert (=> b!858953 (=> (not res!583246) (not e!478789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858953 (= res!583246 (validMask!0 mask!1196))))

(declare-fun b!858954 () Bool)

(declare-fun res!583247 () Bool)

(assert (=> b!858954 (=> (not res!583247) (not e!478789))))

(assert (=> b!858954 (= res!583247 (validKeyInArray!0 k0!854))))

(declare-fun b!858955 () Bool)

(declare-fun e!478790 () Bool)

(assert (=> b!858955 (= e!478790 tp_is_empty!16519)))

(declare-fun b!858956 () Bool)

(declare-fun res!583245 () Bool)

(assert (=> b!858956 (=> (not res!583245) (not e!478789))))

(assert (=> b!858956 (= res!583245 (and (= (size!24102 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24103 _keys!868) (size!24102 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858948 () Bool)

(assert (=> b!858948 (= e!478793 true)))

(declare-fun lt!386876 () ListLongMap!9657)

(declare-fun get!12464 (ValueCell!7820 V!27073) V!27073)

(declare-fun dynLambda!1086 (Int (_ BitVec 64)) V!27073)

(assert (=> b!858948 (= lt!386876 (+!2251 lt!386882 (tuple2!10887 (select (arr!23662 _keys!868) from!1053) (get!12464 (select (arr!23661 _values!688) from!1053) (dynLambda!1086 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!583249 () Bool)

(assert (=> start!73636 (=> (not res!583249) (not e!478789))))

(assert (=> start!73636 (= res!583249 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24103 _keys!868))))))

(assert (=> start!73636 e!478789))

(assert (=> start!73636 tp_is_empty!16519))

(assert (=> start!73636 true))

(assert (=> start!73636 tp!50654))

(declare-fun array_inv!18788 (array!49271) Bool)

(assert (=> start!73636 (array_inv!18788 _keys!868)))

(declare-fun array_inv!18789 (array!49269) Bool)

(assert (=> start!73636 (and (array_inv!18789 _values!688) e!478794)))

(declare-fun b!858957 () Bool)

(assert (=> b!858957 (= e!478789 e!478792)))

(declare-fun res!583252 () Bool)

(assert (=> b!858957 (=> (not res!583252) (not e!478792))))

(assert (=> b!858957 (= res!583252 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!858957 (= lt!386876 (getCurrentListMapNoExtraKeys!2900 _keys!868 lt!386879 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858957 (= lt!386879 (array!49270 (store (arr!23661 _values!688) i!612 (ValueCellFull!7820 v!557)) (size!24102 _values!688)))))

(declare-fun lt!386880 () ListLongMap!9657)

(assert (=> b!858957 (= lt!386880 (getCurrentListMapNoExtraKeys!2900 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858958 () Bool)

(declare-fun res!583248 () Bool)

(assert (=> b!858958 (=> (not res!583248) (not e!478789))))

(declare-datatypes ((List!16728 0))(
  ( (Nil!16725) (Cons!16724 (h!17861 (_ BitVec 64)) (t!23369 List!16728)) )
))
(declare-fun arrayNoDuplicates!0 (array!49271 (_ BitVec 32) List!16728) Bool)

(assert (=> b!858958 (= res!583248 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16725))))

(declare-fun b!858959 () Bool)

(declare-fun res!583243 () Bool)

(assert (=> b!858959 (=> (not res!583243) (not e!478789))))

(assert (=> b!858959 (= res!583243 (and (= (select (arr!23662 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26378 () Bool)

(assert (=> mapIsEmpty!26378 mapRes!26378))

(declare-fun mapNonEmpty!26378 () Bool)

(declare-fun tp!50653 () Bool)

(assert (=> mapNonEmpty!26378 (= mapRes!26378 (and tp!50653 e!478790))))

(declare-fun mapKey!26378 () (_ BitVec 32))

(declare-fun mapValue!26378 () ValueCell!7820)

(declare-fun mapRest!26378 () (Array (_ BitVec 32) ValueCell!7820))

(assert (=> mapNonEmpty!26378 (= (arr!23661 _values!688) (store mapRest!26378 mapKey!26378 mapValue!26378))))

(assert (= (and start!73636 res!583249) b!858953))

(assert (= (and b!858953 res!583246) b!858956))

(assert (= (and b!858956 res!583245) b!858949))

(assert (= (and b!858949 res!583251) b!858958))

(assert (= (and b!858958 res!583248) b!858951))

(assert (= (and b!858951 res!583244) b!858954))

(assert (= (and b!858954 res!583247) b!858959))

(assert (= (and b!858959 res!583243) b!858957))

(assert (= (and b!858957 res!583252) b!858950))

(assert (= (and b!858950 (not res!583250)) b!858948))

(assert (= (and b!858947 condMapEmpty!26378) mapIsEmpty!26378))

(assert (= (and b!858947 (not condMapEmpty!26378)) mapNonEmpty!26378))

(get-info :version)

(assert (= (and mapNonEmpty!26378 ((_ is ValueCellFull!7820) mapValue!26378)) b!858955))

(assert (= (and b!858947 ((_ is ValueCellFull!7820) mapDefault!26378)) b!858952))

(assert (= start!73636 b!858947))

(declare-fun b_lambda!11749 () Bool)

(assert (=> (not b_lambda!11749) (not b!858948)))

(declare-fun t!23367 () Bool)

(declare-fun tb!4497 () Bool)

(assert (=> (and start!73636 (= defaultEntry!696 defaultEntry!696) t!23367) tb!4497))

(declare-fun result!8613 () Bool)

(assert (=> tb!4497 (= result!8613 tp_is_empty!16519)))

(assert (=> b!858948 t!23367))

(declare-fun b_and!23757 () Bool)

(assert (= b_and!23755 (and (=> t!23367 result!8613) b_and!23757)))

(declare-fun m!800039 () Bool)

(assert (=> b!858959 m!800039))

(declare-fun m!800041 () Bool)

(assert (=> b!858953 m!800041))

(declare-fun m!800043 () Bool)

(assert (=> b!858954 m!800043))

(declare-fun m!800045 () Bool)

(assert (=> b!858949 m!800045))

(declare-fun m!800047 () Bool)

(assert (=> b!858957 m!800047))

(declare-fun m!800049 () Bool)

(assert (=> b!858957 m!800049))

(declare-fun m!800051 () Bool)

(assert (=> b!858957 m!800051))

(declare-fun m!800053 () Bool)

(assert (=> b!858950 m!800053))

(declare-fun m!800055 () Bool)

(assert (=> b!858950 m!800055))

(declare-fun m!800057 () Bool)

(assert (=> b!858950 m!800057))

(declare-fun m!800059 () Bool)

(assert (=> b!858950 m!800059))

(assert (=> b!858950 m!800057))

(declare-fun m!800061 () Bool)

(assert (=> b!858950 m!800061))

(declare-fun m!800063 () Bool)

(assert (=> b!858950 m!800063))

(declare-fun m!800065 () Bool)

(assert (=> mapNonEmpty!26378 m!800065))

(declare-fun m!800067 () Bool)

(assert (=> start!73636 m!800067))

(declare-fun m!800069 () Bool)

(assert (=> start!73636 m!800069))

(declare-fun m!800071 () Bool)

(assert (=> b!858958 m!800071))

(declare-fun m!800073 () Bool)

(assert (=> b!858948 m!800073))

(declare-fun m!800075 () Bool)

(assert (=> b!858948 m!800075))

(declare-fun m!800077 () Bool)

(assert (=> b!858948 m!800077))

(declare-fun m!800079 () Bool)

(assert (=> b!858948 m!800079))

(assert (=> b!858948 m!800075))

(assert (=> b!858948 m!800057))

(assert (=> b!858948 m!800077))

(check-sat (not b!858958) (not b!858950) (not b_next!14383) (not b!858957) (not b_lambda!11749) tp_is_empty!16519 (not mapNonEmpty!26378) b_and!23757 (not start!73636) (not b!858953) (not b!858948) (not b!858949) (not b!858954))
(check-sat b_and!23757 (not b_next!14383))
