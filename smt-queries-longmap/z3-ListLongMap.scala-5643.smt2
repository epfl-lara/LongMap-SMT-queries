; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73624 () Bool)

(assert start!73624)

(declare-fun b_free!14557 () Bool)

(declare-fun b_next!14557 () Bool)

(assert (=> start!73624 (= b_free!14557 (not b_next!14557))))

(declare-fun tp!51175 () Bool)

(declare-fun b_and!24067 () Bool)

(assert (=> start!73624 (= tp!51175 b_and!24067)))

(declare-fun b!861936 () Bool)

(declare-fun e!480204 () Bool)

(declare-fun e!480200 () Bool)

(declare-fun mapRes!26639 () Bool)

(assert (=> b!861936 (= e!480204 (and e!480200 mapRes!26639))))

(declare-fun condMapEmpty!26639 () Bool)

(declare-datatypes ((V!27305 0))(
  ( (V!27306 (val!8394 Int)) )
))
(declare-datatypes ((ValueCell!7907 0))(
  ( (ValueCellFull!7907 (v!10813 V!27305)) (EmptyCell!7907) )
))
(declare-datatypes ((array!49539 0))(
  ( (array!49540 (arr!23801 (Array (_ BitVec 32) ValueCell!7907)) (size!24243 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49539)

(declare-fun mapDefault!26639 () ValueCell!7907)

(assert (=> b!861936 (= condMapEmpty!26639 (= (arr!23801 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7907)) mapDefault!26639)))))

(declare-fun b!861937 () Bool)

(declare-fun e!480202 () Bool)

(declare-fun tp_is_empty!16693 () Bool)

(assert (=> b!861937 (= e!480202 tp_is_empty!16693)))

(declare-fun b!861938 () Bool)

(declare-fun res!585789 () Bool)

(declare-fun e!480199 () Bool)

(assert (=> b!861938 (=> (not res!585789) (not e!480199))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49541 0))(
  ( (array!49542 (arr!23802 (Array (_ BitVec 32) (_ BitVec 64))) (size!24244 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49541)

(assert (=> b!861938 (= res!585789 (and (= (size!24243 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24244 _keys!868) (size!24243 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861939 () Bool)

(declare-fun e!480196 () Bool)

(assert (=> b!861939 (= e!480196 true)))

(declare-datatypes ((tuple2!11110 0))(
  ( (tuple2!11111 (_1!5566 (_ BitVec 64)) (_2!5566 V!27305)) )
))
(declare-fun lt!388796 () tuple2!11110)

(declare-datatypes ((List!16907 0))(
  ( (Nil!16904) (Cons!16903 (h!18034 tuple2!11110) (t!23721 List!16907)) )
))
(declare-datatypes ((ListLongMap!9869 0))(
  ( (ListLongMap!9870 (toList!4950 List!16907)) )
))
(declare-fun lt!388781 () ListLongMap!9869)

(declare-fun lt!388790 () ListLongMap!9869)

(declare-fun lt!388792 () tuple2!11110)

(declare-fun +!2319 (ListLongMap!9869 tuple2!11110) ListLongMap!9869)

(assert (=> b!861939 (= lt!388781 (+!2319 (+!2319 lt!388790 lt!388796) lt!388792))))

(declare-fun lt!388782 () V!27305)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun v!557 () V!27305)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!29351 0))(
  ( (Unit!29352) )
))
(declare-fun lt!388794 () Unit!29351)

(declare-fun addCommutativeForDiffKeys!470 (ListLongMap!9869 (_ BitVec 64) V!27305 (_ BitVec 64) V!27305) Unit!29351)

(assert (=> b!861939 (= lt!388794 (addCommutativeForDiffKeys!470 lt!388790 k0!854 v!557 (select (arr!23802 _keys!868) from!1053) lt!388782))))

(declare-fun b!861940 () Bool)

(declare-fun res!585781 () Bool)

(assert (=> b!861940 (=> (not res!585781) (not e!480199))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861940 (= res!585781 (and (= (select (arr!23802 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861941 () Bool)

(declare-fun e!480203 () Bool)

(assert (=> b!861941 (= e!480199 e!480203)))

(declare-fun res!585787 () Bool)

(assert (=> b!861941 (=> (not res!585787) (not e!480203))))

(assert (=> b!861941 (= res!585787 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388787 () array!49539)

(declare-fun minValue!654 () V!27305)

(declare-fun zeroValue!654 () V!27305)

(declare-fun lt!388795 () ListLongMap!9869)

(declare-fun getCurrentListMapNoExtraKeys!2953 (array!49541 array!49539 (_ BitVec 32) (_ BitVec 32) V!27305 V!27305 (_ BitVec 32) Int) ListLongMap!9869)

(assert (=> b!861941 (= lt!388795 (getCurrentListMapNoExtraKeys!2953 _keys!868 lt!388787 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861941 (= lt!388787 (array!49540 (store (arr!23801 _values!688) i!612 (ValueCellFull!7907 v!557)) (size!24243 _values!688)))))

(declare-fun lt!388793 () ListLongMap!9869)

(assert (=> b!861941 (= lt!388793 (getCurrentListMapNoExtraKeys!2953 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861942 () Bool)

(declare-fun res!585785 () Bool)

(assert (=> b!861942 (=> (not res!585785) (not e!480199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49541 (_ BitVec 32)) Bool)

(assert (=> b!861942 (= res!585785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861943 () Bool)

(declare-fun res!585779 () Bool)

(assert (=> b!861943 (=> (not res!585779) (not e!480199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861943 (= res!585779 (validKeyInArray!0 k0!854))))

(declare-fun b!861944 () Bool)

(declare-fun res!585783 () Bool)

(assert (=> b!861944 (=> (not res!585783) (not e!480199))))

(assert (=> b!861944 (= res!585783 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24244 _keys!868))))))

(declare-fun b!861945 () Bool)

(declare-fun res!585786 () Bool)

(assert (=> b!861945 (=> (not res!585786) (not e!480199))))

(declare-datatypes ((List!16908 0))(
  ( (Nil!16905) (Cons!16904 (h!18035 (_ BitVec 64)) (t!23722 List!16908)) )
))
(declare-fun arrayNoDuplicates!0 (array!49541 (_ BitVec 32) List!16908) Bool)

(assert (=> b!861945 (= res!585786 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16905))))

(declare-fun res!585788 () Bool)

(assert (=> start!73624 (=> (not res!585788) (not e!480199))))

(assert (=> start!73624 (= res!585788 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24244 _keys!868))))))

(assert (=> start!73624 e!480199))

(assert (=> start!73624 tp_is_empty!16693))

(assert (=> start!73624 true))

(assert (=> start!73624 tp!51175))

(declare-fun array_inv!18904 (array!49541) Bool)

(assert (=> start!73624 (array_inv!18904 _keys!868)))

(declare-fun array_inv!18905 (array!49539) Bool)

(assert (=> start!73624 (and (array_inv!18905 _values!688) e!480204)))

(declare-fun b!861946 () Bool)

(assert (=> b!861946 (= e!480200 tp_is_empty!16693)))

(declare-fun b!861947 () Bool)

(declare-fun e!480198 () Unit!29351)

(declare-fun Unit!29353 () Unit!29351)

(assert (=> b!861947 (= e!480198 Unit!29353)))

(declare-fun lt!388791 () Unit!29351)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49541 (_ BitVec 32) (_ BitVec 32)) Unit!29351)

(assert (=> b!861947 (= lt!388791 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!861947 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16905)))

(declare-fun lt!388783 () Unit!29351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49541 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29351)

(assert (=> b!861947 (= lt!388783 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861947 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388785 () Unit!29351)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49541 (_ BitVec 64) (_ BitVec 32) List!16908) Unit!29351)

(assert (=> b!861947 (= lt!388785 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16905))))

(assert (=> b!861947 false))

(declare-fun b!861948 () Bool)

(declare-fun Unit!29354 () Unit!29351)

(assert (=> b!861948 (= e!480198 Unit!29354)))

(declare-fun b!861949 () Bool)

(declare-fun e!480197 () Bool)

(assert (=> b!861949 (= e!480203 (not e!480197))))

(declare-fun res!585782 () Bool)

(assert (=> b!861949 (=> res!585782 e!480197)))

(assert (=> b!861949 (= res!585782 (not (validKeyInArray!0 (select (arr!23802 _keys!868) from!1053))))))

(declare-fun lt!388789 () ListLongMap!9869)

(declare-fun lt!388788 () ListLongMap!9869)

(assert (=> b!861949 (= lt!388789 lt!388788)))

(assert (=> b!861949 (= lt!388788 (+!2319 lt!388790 lt!388792))))

(assert (=> b!861949 (= lt!388789 (getCurrentListMapNoExtraKeys!2953 _keys!868 lt!388787 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861949 (= lt!388792 (tuple2!11111 k0!854 v!557))))

(assert (=> b!861949 (= lt!388790 (getCurrentListMapNoExtraKeys!2953 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388784 () Unit!29351)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!508 (array!49541 array!49539 (_ BitVec 32) (_ BitVec 32) V!27305 V!27305 (_ BitVec 32) (_ BitVec 64) V!27305 (_ BitVec 32) Int) Unit!29351)

(assert (=> b!861949 (= lt!388784 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!508 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861950 () Bool)

(declare-fun res!585780 () Bool)

(assert (=> b!861950 (=> (not res!585780) (not e!480199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861950 (= res!585780 (validMask!0 mask!1196))))

(declare-fun b!861951 () Bool)

(assert (=> b!861951 (= e!480197 e!480196)))

(declare-fun res!585784 () Bool)

(assert (=> b!861951 (=> res!585784 e!480196)))

(assert (=> b!861951 (= res!585784 (= k0!854 (select (arr!23802 _keys!868) from!1053)))))

(assert (=> b!861951 (not (= (select (arr!23802 _keys!868) from!1053) k0!854))))

(declare-fun lt!388786 () Unit!29351)

(assert (=> b!861951 (= lt!388786 e!480198)))

(declare-fun c!91991 () Bool)

(assert (=> b!861951 (= c!91991 (= (select (arr!23802 _keys!868) from!1053) k0!854))))

(assert (=> b!861951 (= lt!388795 lt!388781)))

(assert (=> b!861951 (= lt!388781 (+!2319 lt!388788 lt!388796))))

(assert (=> b!861951 (= lt!388796 (tuple2!11111 (select (arr!23802 _keys!868) from!1053) lt!388782))))

(declare-fun get!12559 (ValueCell!7907 V!27305) V!27305)

(declare-fun dynLambda!1126 (Int (_ BitVec 64)) V!27305)

(assert (=> b!861951 (= lt!388782 (get!12559 (select (arr!23801 _values!688) from!1053) (dynLambda!1126 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!26639 () Bool)

(assert (=> mapIsEmpty!26639 mapRes!26639))

(declare-fun mapNonEmpty!26639 () Bool)

(declare-fun tp!51176 () Bool)

(assert (=> mapNonEmpty!26639 (= mapRes!26639 (and tp!51176 e!480202))))

(declare-fun mapKey!26639 () (_ BitVec 32))

(declare-fun mapRest!26639 () (Array (_ BitVec 32) ValueCell!7907))

(declare-fun mapValue!26639 () ValueCell!7907)

(assert (=> mapNonEmpty!26639 (= (arr!23801 _values!688) (store mapRest!26639 mapKey!26639 mapValue!26639))))

(assert (= (and start!73624 res!585788) b!861950))

(assert (= (and b!861950 res!585780) b!861938))

(assert (= (and b!861938 res!585789) b!861942))

(assert (= (and b!861942 res!585785) b!861945))

(assert (= (and b!861945 res!585786) b!861944))

(assert (= (and b!861944 res!585783) b!861943))

(assert (= (and b!861943 res!585779) b!861940))

(assert (= (and b!861940 res!585781) b!861941))

(assert (= (and b!861941 res!585787) b!861949))

(assert (= (and b!861949 (not res!585782)) b!861951))

(assert (= (and b!861951 c!91991) b!861947))

(assert (= (and b!861951 (not c!91991)) b!861948))

(assert (= (and b!861951 (not res!585784)) b!861939))

(assert (= (and b!861936 condMapEmpty!26639) mapIsEmpty!26639))

(assert (= (and b!861936 (not condMapEmpty!26639)) mapNonEmpty!26639))

(get-info :version)

(assert (= (and mapNonEmpty!26639 ((_ is ValueCellFull!7907) mapValue!26639)) b!861937))

(assert (= (and b!861936 ((_ is ValueCellFull!7907) mapDefault!26639)) b!861946))

(assert (= start!73624 b!861936))

(declare-fun b_lambda!11891 () Bool)

(assert (=> (not b_lambda!11891) (not b!861951)))

(declare-fun t!23720 () Bool)

(declare-fun tb!4671 () Bool)

(assert (=> (and start!73624 (= defaultEntry!696 defaultEntry!696) t!23720) tb!4671))

(declare-fun result!8961 () Bool)

(assert (=> tb!4671 (= result!8961 tp_is_empty!16693)))

(assert (=> b!861951 t!23720))

(declare-fun b_and!24069 () Bool)

(assert (= b_and!24067 (and (=> t!23720 result!8961) b_and!24069)))

(declare-fun m!802395 () Bool)

(assert (=> b!861949 m!802395))

(declare-fun m!802397 () Bool)

(assert (=> b!861949 m!802397))

(declare-fun m!802399 () Bool)

(assert (=> b!861949 m!802399))

(declare-fun m!802401 () Bool)

(assert (=> b!861949 m!802401))

(assert (=> b!861949 m!802399))

(declare-fun m!802403 () Bool)

(assert (=> b!861949 m!802403))

(declare-fun m!802405 () Bool)

(assert (=> b!861949 m!802405))

(declare-fun m!802407 () Bool)

(assert (=> b!861940 m!802407))

(declare-fun m!802409 () Bool)

(assert (=> mapNonEmpty!26639 m!802409))

(declare-fun m!802411 () Bool)

(assert (=> b!861945 m!802411))

(declare-fun m!802413 () Bool)

(assert (=> start!73624 m!802413))

(declare-fun m!802415 () Bool)

(assert (=> start!73624 m!802415))

(declare-fun m!802417 () Bool)

(assert (=> b!861951 m!802417))

(declare-fun m!802419 () Bool)

(assert (=> b!861951 m!802419))

(declare-fun m!802421 () Bool)

(assert (=> b!861951 m!802421))

(declare-fun m!802423 () Bool)

(assert (=> b!861951 m!802423))

(assert (=> b!861951 m!802419))

(assert (=> b!861951 m!802399))

(assert (=> b!861951 m!802421))

(declare-fun m!802425 () Bool)

(assert (=> b!861939 m!802425))

(assert (=> b!861939 m!802425))

(declare-fun m!802427 () Bool)

(assert (=> b!861939 m!802427))

(assert (=> b!861939 m!802399))

(assert (=> b!861939 m!802399))

(declare-fun m!802429 () Bool)

(assert (=> b!861939 m!802429))

(declare-fun m!802431 () Bool)

(assert (=> b!861950 m!802431))

(declare-fun m!802433 () Bool)

(assert (=> b!861943 m!802433))

(declare-fun m!802435 () Bool)

(assert (=> b!861947 m!802435))

(declare-fun m!802437 () Bool)

(assert (=> b!861947 m!802437))

(declare-fun m!802439 () Bool)

(assert (=> b!861947 m!802439))

(declare-fun m!802441 () Bool)

(assert (=> b!861947 m!802441))

(declare-fun m!802443 () Bool)

(assert (=> b!861947 m!802443))

(declare-fun m!802445 () Bool)

(assert (=> b!861942 m!802445))

(declare-fun m!802447 () Bool)

(assert (=> b!861941 m!802447))

(declare-fun m!802449 () Bool)

(assert (=> b!861941 m!802449))

(declare-fun m!802451 () Bool)

(assert (=> b!861941 m!802451))

(check-sat (not b!861949) (not b!861942) (not b!861951) (not start!73624) (not b!861945) b_and!24069 (not b!861947) (not b!861950) tp_is_empty!16693 (not b_next!14557) (not b!861939) (not b_lambda!11891) (not b!861943) (not mapNonEmpty!26639) (not b!861941))
(check-sat b_and!24069 (not b_next!14557))
