; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73632 () Bool)

(assert start!73632)

(declare-fun b_free!14547 () Bool)

(declare-fun b_next!14547 () Bool)

(assert (=> start!73632 (= b_free!14547 (not b_next!14547))))

(declare-fun tp!51144 () Bool)

(declare-fun b_and!24073 () Bool)

(assert (=> start!73632 (= tp!51144 b_and!24073)))

(declare-fun mapIsEmpty!26624 () Bool)

(declare-fun mapRes!26624 () Bool)

(assert (=> mapIsEmpty!26624 mapRes!26624))

(declare-fun b!861938 () Bool)

(declare-fun res!585744 () Bool)

(declare-fun e!480223 () Bool)

(assert (=> b!861938 (=> (not res!585744) (not e!480223))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27291 0))(
  ( (V!27292 (val!8389 Int)) )
))
(declare-datatypes ((ValueCell!7902 0))(
  ( (ValueCellFull!7902 (v!10814 V!27291)) (EmptyCell!7902) )
))
(declare-datatypes ((array!49530 0))(
  ( (array!49531 (arr!23796 (Array (_ BitVec 32) ValueCell!7902)) (size!24236 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49530)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49532 0))(
  ( (array!49533 (arr!23797 (Array (_ BitVec 32) (_ BitVec 64))) (size!24237 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49532)

(assert (=> b!861938 (= res!585744 (and (= (size!24236 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24237 _keys!868) (size!24236 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861939 () Bool)

(declare-fun e!480228 () Bool)

(declare-fun tp_is_empty!16683 () Bool)

(assert (=> b!861939 (= e!480228 tp_is_empty!16683)))

(declare-fun mapNonEmpty!26624 () Bool)

(declare-fun tp!51145 () Bool)

(declare-fun e!480225 () Bool)

(assert (=> mapNonEmpty!26624 (= mapRes!26624 (and tp!51145 e!480225))))

(declare-fun mapKey!26624 () (_ BitVec 32))

(declare-fun mapValue!26624 () ValueCell!7902)

(declare-fun mapRest!26624 () (Array (_ BitVec 32) ValueCell!7902))

(assert (=> mapNonEmpty!26624 (= (arr!23796 _values!688) (store mapRest!26624 mapKey!26624 mapValue!26624))))

(declare-fun b!861940 () Bool)

(declare-fun res!585741 () Bool)

(assert (=> b!861940 (=> (not res!585741) (not e!480223))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861940 (= res!585741 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24237 _keys!868))))))

(declare-fun b!861941 () Bool)

(declare-datatypes ((Unit!29413 0))(
  ( (Unit!29414) )
))
(declare-fun e!480227 () Unit!29413)

(declare-fun Unit!29415 () Unit!29413)

(assert (=> b!861941 (= e!480227 Unit!29415)))

(declare-fun lt!388851 () Unit!29413)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49532 (_ BitVec 32) (_ BitVec 32)) Unit!29413)

(assert (=> b!861941 (= lt!388851 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16899 0))(
  ( (Nil!16896) (Cons!16895 (h!18026 (_ BitVec 64)) (t!23712 List!16899)) )
))
(declare-fun arrayNoDuplicates!0 (array!49532 (_ BitVec 32) List!16899) Bool)

(assert (=> b!861941 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16896)))

(declare-fun lt!388848 () Unit!29413)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29413)

(assert (=> b!861941 (= lt!388848 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861941 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388843 () Unit!29413)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49532 (_ BitVec 64) (_ BitVec 32) List!16899) Unit!29413)

(assert (=> b!861941 (= lt!388843 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16896))))

(assert (=> b!861941 false))

(declare-fun b!861942 () Bool)

(declare-fun res!585737 () Bool)

(assert (=> b!861942 (=> (not res!585737) (not e!480223))))

(assert (=> b!861942 (= res!585737 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16896))))

(declare-fun b!861943 () Bool)

(assert (=> b!861943 (= e!480225 tp_is_empty!16683)))

(declare-fun b!861945 () Bool)

(declare-fun res!585738 () Bool)

(assert (=> b!861945 (=> (not res!585738) (not e!480223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861945 (= res!585738 (validKeyInArray!0 k0!854))))

(declare-fun b!861946 () Bool)

(declare-fun res!585742 () Bool)

(assert (=> b!861946 (=> (not res!585742) (not e!480223))))

(assert (=> b!861946 (= res!585742 (and (= (select (arr!23797 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861947 () Bool)

(declare-fun res!585745 () Bool)

(assert (=> b!861947 (=> (not res!585745) (not e!480223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49532 (_ BitVec 32)) Bool)

(assert (=> b!861947 (= res!585745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861948 () Bool)

(declare-fun e!480229 () Bool)

(assert (=> b!861948 (= e!480229 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24237 _keys!868))))))

(assert (=> b!861948 (not (= (select (arr!23797 _keys!868) from!1053) k0!854))))

(declare-fun lt!388842 () Unit!29413)

(assert (=> b!861948 (= lt!388842 e!480227)))

(declare-fun c!92041 () Bool)

(assert (=> b!861948 (= c!92041 (= (select (arr!23797 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11090 0))(
  ( (tuple2!11091 (_1!5556 (_ BitVec 64)) (_2!5556 V!27291)) )
))
(declare-datatypes ((List!16900 0))(
  ( (Nil!16897) (Cons!16896 (h!18027 tuple2!11090) (t!23713 List!16900)) )
))
(declare-datatypes ((ListLongMap!9859 0))(
  ( (ListLongMap!9860 (toList!4945 List!16900)) )
))
(declare-fun lt!388847 () ListLongMap!9859)

(declare-fun lt!388852 () ListLongMap!9859)

(declare-fun +!2295 (ListLongMap!9859 tuple2!11090) ListLongMap!9859)

(declare-fun get!12557 (ValueCell!7902 V!27291) V!27291)

(declare-fun dynLambda!1131 (Int (_ BitVec 64)) V!27291)

(assert (=> b!861948 (= lt!388852 (+!2295 lt!388847 (tuple2!11091 (select (arr!23797 _keys!868) from!1053) (get!12557 (select (arr!23796 _values!688) from!1053) (dynLambda!1131 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861949 () Bool)

(declare-fun res!585739 () Bool)

(assert (=> b!861949 (=> (not res!585739) (not e!480223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861949 (= res!585739 (validMask!0 mask!1196))))

(declare-fun b!861950 () Bool)

(declare-fun e!480224 () Bool)

(assert (=> b!861950 (= e!480224 (and e!480228 mapRes!26624))))

(declare-fun condMapEmpty!26624 () Bool)

(declare-fun mapDefault!26624 () ValueCell!7902)

(assert (=> b!861950 (= condMapEmpty!26624 (= (arr!23796 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7902)) mapDefault!26624)))))

(declare-fun b!861944 () Bool)

(declare-fun Unit!29416 () Unit!29413)

(assert (=> b!861944 (= e!480227 Unit!29416)))

(declare-fun res!585746 () Bool)

(assert (=> start!73632 (=> (not res!585746) (not e!480223))))

(assert (=> start!73632 (= res!585746 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24237 _keys!868))))))

(assert (=> start!73632 e!480223))

(assert (=> start!73632 tp_is_empty!16683))

(assert (=> start!73632 true))

(assert (=> start!73632 tp!51144))

(declare-fun array_inv!18826 (array!49532) Bool)

(assert (=> start!73632 (array_inv!18826 _keys!868)))

(declare-fun array_inv!18827 (array!49530) Bool)

(assert (=> start!73632 (and (array_inv!18827 _values!688) e!480224)))

(declare-fun b!861951 () Bool)

(declare-fun e!480226 () Bool)

(assert (=> b!861951 (= e!480223 e!480226)))

(declare-fun res!585743 () Bool)

(assert (=> b!861951 (=> (not res!585743) (not e!480226))))

(assert (=> b!861951 (= res!585743 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388850 () array!49530)

(declare-fun minValue!654 () V!27291)

(declare-fun zeroValue!654 () V!27291)

(declare-fun getCurrentListMapNoExtraKeys!2921 (array!49532 array!49530 (_ BitVec 32) (_ BitVec 32) V!27291 V!27291 (_ BitVec 32) Int) ListLongMap!9859)

(assert (=> b!861951 (= lt!388852 (getCurrentListMapNoExtraKeys!2921 _keys!868 lt!388850 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27291)

(assert (=> b!861951 (= lt!388850 (array!49531 (store (arr!23796 _values!688) i!612 (ValueCellFull!7902 v!557)) (size!24236 _values!688)))))

(declare-fun lt!388849 () ListLongMap!9859)

(assert (=> b!861951 (= lt!388849 (getCurrentListMapNoExtraKeys!2921 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861952 () Bool)

(assert (=> b!861952 (= e!480226 (not e!480229))))

(declare-fun res!585740 () Bool)

(assert (=> b!861952 (=> res!585740 e!480229)))

(assert (=> b!861952 (= res!585740 (not (validKeyInArray!0 (select (arr!23797 _keys!868) from!1053))))))

(declare-fun lt!388845 () ListLongMap!9859)

(assert (=> b!861952 (= lt!388845 lt!388847)))

(declare-fun lt!388846 () ListLongMap!9859)

(assert (=> b!861952 (= lt!388847 (+!2295 lt!388846 (tuple2!11091 k0!854 v!557)))))

(assert (=> b!861952 (= lt!388845 (getCurrentListMapNoExtraKeys!2921 _keys!868 lt!388850 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861952 (= lt!388846 (getCurrentListMapNoExtraKeys!2921 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388844 () Unit!29413)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!505 (array!49532 array!49530 (_ BitVec 32) (_ BitVec 32) V!27291 V!27291 (_ BitVec 32) (_ BitVec 64) V!27291 (_ BitVec 32) Int) Unit!29413)

(assert (=> b!861952 (= lt!388844 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!505 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73632 res!585746) b!861949))

(assert (= (and b!861949 res!585739) b!861938))

(assert (= (and b!861938 res!585744) b!861947))

(assert (= (and b!861947 res!585745) b!861942))

(assert (= (and b!861942 res!585737) b!861940))

(assert (= (and b!861940 res!585741) b!861945))

(assert (= (and b!861945 res!585738) b!861946))

(assert (= (and b!861946 res!585742) b!861951))

(assert (= (and b!861951 res!585743) b!861952))

(assert (= (and b!861952 (not res!585740)) b!861948))

(assert (= (and b!861948 c!92041) b!861941))

(assert (= (and b!861948 (not c!92041)) b!861944))

(assert (= (and b!861950 condMapEmpty!26624) mapIsEmpty!26624))

(assert (= (and b!861950 (not condMapEmpty!26624)) mapNonEmpty!26624))

(get-info :version)

(assert (= (and mapNonEmpty!26624 ((_ is ValueCellFull!7902) mapValue!26624)) b!861943))

(assert (= (and b!861950 ((_ is ValueCellFull!7902) mapDefault!26624)) b!861939))

(assert (= start!73632 b!861950))

(declare-fun b_lambda!11899 () Bool)

(assert (=> (not b_lambda!11899) (not b!861948)))

(declare-fun t!23711 () Bool)

(declare-fun tb!4669 () Bool)

(assert (=> (and start!73632 (= defaultEntry!696 defaultEntry!696) t!23711) tb!4669))

(declare-fun result!8949 () Bool)

(assert (=> tb!4669 (= result!8949 tp_is_empty!16683)))

(assert (=> b!861948 t!23711))

(declare-fun b_and!24075 () Bool)

(assert (= b_and!24073 (and (=> t!23711 result!8949) b_and!24075)))

(declare-fun m!802893 () Bool)

(assert (=> start!73632 m!802893))

(declare-fun m!802895 () Bool)

(assert (=> start!73632 m!802895))

(declare-fun m!802897 () Bool)

(assert (=> b!861952 m!802897))

(declare-fun m!802899 () Bool)

(assert (=> b!861952 m!802899))

(declare-fun m!802901 () Bool)

(assert (=> b!861952 m!802901))

(declare-fun m!802903 () Bool)

(assert (=> b!861952 m!802903))

(declare-fun m!802905 () Bool)

(assert (=> b!861952 m!802905))

(assert (=> b!861952 m!802899))

(declare-fun m!802907 () Bool)

(assert (=> b!861952 m!802907))

(declare-fun m!802909 () Bool)

(assert (=> b!861945 m!802909))

(declare-fun m!802911 () Bool)

(assert (=> b!861947 m!802911))

(declare-fun m!802913 () Bool)

(assert (=> b!861942 m!802913))

(declare-fun m!802915 () Bool)

(assert (=> b!861951 m!802915))

(declare-fun m!802917 () Bool)

(assert (=> b!861951 m!802917))

(declare-fun m!802919 () Bool)

(assert (=> b!861951 m!802919))

(declare-fun m!802921 () Bool)

(assert (=> b!861949 m!802921))

(declare-fun m!802923 () Bool)

(assert (=> mapNonEmpty!26624 m!802923))

(declare-fun m!802925 () Bool)

(assert (=> b!861948 m!802925))

(declare-fun m!802927 () Bool)

(assert (=> b!861948 m!802927))

(declare-fun m!802929 () Bool)

(assert (=> b!861948 m!802929))

(declare-fun m!802931 () Bool)

(assert (=> b!861948 m!802931))

(assert (=> b!861948 m!802927))

(assert (=> b!861948 m!802899))

(assert (=> b!861948 m!802929))

(declare-fun m!802933 () Bool)

(assert (=> b!861946 m!802933))

(declare-fun m!802935 () Bool)

(assert (=> b!861941 m!802935))

(declare-fun m!802937 () Bool)

(assert (=> b!861941 m!802937))

(declare-fun m!802939 () Bool)

(assert (=> b!861941 m!802939))

(declare-fun m!802941 () Bool)

(assert (=> b!861941 m!802941))

(declare-fun m!802943 () Bool)

(assert (=> b!861941 m!802943))

(check-sat (not b_next!14547) (not mapNonEmpty!26624) (not b!861942) (not b!861947) (not b!861949) (not b!861951) (not b!861948) (not b_lambda!11899) (not b!861952) (not b!861941) b_and!24075 (not start!73632) tp_is_empty!16683 (not b!861945))
(check-sat b_and!24075 (not b_next!14547))
