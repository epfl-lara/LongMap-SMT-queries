; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73744 () Bool)

(assert start!73744)

(declare-fun b_free!14677 () Bool)

(declare-fun b_next!14677 () Bool)

(assert (=> start!73744 (= b_free!14677 (not b_next!14677))))

(declare-fun tp!51536 () Bool)

(declare-fun b_and!24307 () Bool)

(assert (=> start!73744 (= tp!51536 b_and!24307)))

(declare-fun b!864937 () Bool)

(declare-datatypes ((Unit!29548 0))(
  ( (Unit!29549) )
))
(declare-fun e!481823 () Unit!29548)

(declare-fun Unit!29550 () Unit!29548)

(assert (=> b!864937 (= e!481823 Unit!29550)))

(declare-fun lt!391676 () Unit!29548)

(declare-datatypes ((array!49779 0))(
  ( (array!49780 (arr!23921 (Array (_ BitVec 32) (_ BitVec 64))) (size!24363 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49779)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49779 (_ BitVec 32) (_ BitVec 32)) Unit!29548)

(assert (=> b!864937 (= lt!391676 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17010 0))(
  ( (Nil!17007) (Cons!17006 (h!18137 (_ BitVec 64)) (t!23944 List!17010)) )
))
(declare-fun arrayNoDuplicates!0 (array!49779 (_ BitVec 32) List!17010) Bool)

(assert (=> b!864937 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17007)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!391673 () Unit!29548)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49779 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29548)

(assert (=> b!864937 (= lt!391673 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864937 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391661 () Unit!29548)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49779 (_ BitVec 64) (_ BitVec 32) List!17010) Unit!29548)

(assert (=> b!864937 (= lt!391661 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17007))))

(assert (=> b!864937 false))

(declare-fun b!864938 () Bool)

(declare-fun e!481817 () Bool)

(declare-fun tp_is_empty!16813 () Bool)

(assert (=> b!864938 (= e!481817 tp_is_empty!16813)))

(declare-fun b!864939 () Bool)

(declare-fun res!587760 () Bool)

(declare-fun e!481824 () Bool)

(assert (=> b!864939 (=> (not res!587760) (not e!481824))))

(assert (=> b!864939 (= res!587760 (and (= (select (arr!23921 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864940 () Bool)

(declare-fun e!481821 () Bool)

(declare-fun e!481820 () Bool)

(assert (=> b!864940 (= e!481821 (not e!481820))))

(declare-fun res!587762 () Bool)

(assert (=> b!864940 (=> res!587762 e!481820)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864940 (= res!587762 (not (validKeyInArray!0 (select (arr!23921 _keys!868) from!1053))))))

(declare-datatypes ((V!27465 0))(
  ( (V!27466 (val!8454 Int)) )
))
(declare-datatypes ((tuple2!11218 0))(
  ( (tuple2!11219 (_1!5620 (_ BitVec 64)) (_2!5620 V!27465)) )
))
(declare-datatypes ((List!17011 0))(
  ( (Nil!17008) (Cons!17007 (h!18138 tuple2!11218) (t!23945 List!17011)) )
))
(declare-datatypes ((ListLongMap!9977 0))(
  ( (ListLongMap!9978 (toList!5004 List!17011)) )
))
(declare-fun lt!391666 () ListLongMap!9977)

(declare-fun lt!391674 () ListLongMap!9977)

(assert (=> b!864940 (= lt!391666 lt!391674)))

(declare-fun lt!391669 () ListLongMap!9977)

(declare-fun lt!391672 () tuple2!11218)

(declare-fun +!2372 (ListLongMap!9977 tuple2!11218) ListLongMap!9977)

(assert (=> b!864940 (= lt!391674 (+!2372 lt!391669 lt!391672))))

(declare-datatypes ((ValueCell!7967 0))(
  ( (ValueCellFull!7967 (v!10873 V!27465)) (EmptyCell!7967) )
))
(declare-datatypes ((array!49781 0))(
  ( (array!49782 (arr!23922 (Array (_ BitVec 32) ValueCell!7967)) (size!24364 (_ BitVec 32))) )
))
(declare-fun lt!391668 () array!49781)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27465)

(declare-fun zeroValue!654 () V!27465)

(declare-fun getCurrentListMapNoExtraKeys!3001 (array!49779 array!49781 (_ BitVec 32) (_ BitVec 32) V!27465 V!27465 (_ BitVec 32) Int) ListLongMap!9977)

(assert (=> b!864940 (= lt!391666 (getCurrentListMapNoExtraKeys!3001 _keys!868 lt!391668 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27465)

(assert (=> b!864940 (= lt!391672 (tuple2!11219 k0!854 v!557))))

(declare-fun _values!688 () array!49781)

(assert (=> b!864940 (= lt!391669 (getCurrentListMapNoExtraKeys!3001 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391675 () Unit!29548)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!548 (array!49779 array!49781 (_ BitVec 32) (_ BitVec 32) V!27465 V!27465 (_ BitVec 32) (_ BitVec 64) V!27465 (_ BitVec 32) Int) Unit!29548)

(assert (=> b!864940 (= lt!391675 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!548 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26819 () Bool)

(declare-fun mapRes!26819 () Bool)

(assert (=> mapIsEmpty!26819 mapRes!26819))

(declare-fun b!864941 () Bool)

(assert (=> b!864941 (= e!481824 e!481821)))

(declare-fun res!587769 () Bool)

(assert (=> b!864941 (=> (not res!587769) (not e!481821))))

(assert (=> b!864941 (= res!587769 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!391662 () ListLongMap!9977)

(assert (=> b!864941 (= lt!391662 (getCurrentListMapNoExtraKeys!3001 _keys!868 lt!391668 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864941 (= lt!391668 (array!49782 (store (arr!23922 _values!688) i!612 (ValueCellFull!7967 v!557)) (size!24364 _values!688)))))

(declare-fun lt!391670 () ListLongMap!9977)

(assert (=> b!864941 (= lt!391670 (getCurrentListMapNoExtraKeys!3001 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864942 () Bool)

(declare-fun res!587759 () Bool)

(assert (=> b!864942 (=> (not res!587759) (not e!481824))))

(assert (=> b!864942 (= res!587759 (and (= (size!24364 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24363 _keys!868) (size!24364 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864943 () Bool)

(declare-fun res!587766 () Bool)

(assert (=> b!864943 (=> (not res!587766) (not e!481824))))

(assert (=> b!864943 (= res!587766 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17007))))

(declare-fun b!864936 () Bool)

(declare-fun res!587767 () Bool)

(assert (=> b!864936 (=> (not res!587767) (not e!481824))))

(assert (=> b!864936 (= res!587767 (validKeyInArray!0 k0!854))))

(declare-fun res!587764 () Bool)

(assert (=> start!73744 (=> (not res!587764) (not e!481824))))

(assert (=> start!73744 (= res!587764 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24363 _keys!868))))))

(assert (=> start!73744 e!481824))

(assert (=> start!73744 tp_is_empty!16813))

(assert (=> start!73744 true))

(assert (=> start!73744 tp!51536))

(declare-fun array_inv!18986 (array!49779) Bool)

(assert (=> start!73744 (array_inv!18986 _keys!868)))

(declare-fun e!481816 () Bool)

(declare-fun array_inv!18987 (array!49781) Bool)

(assert (=> start!73744 (and (array_inv!18987 _values!688) e!481816)))

(declare-fun b!864944 () Bool)

(declare-fun e!481818 () Bool)

(assert (=> b!864944 (= e!481818 tp_is_empty!16813)))

(declare-fun b!864945 () Bool)

(declare-fun e!481822 () Bool)

(assert (=> b!864945 (= e!481822 true)))

(declare-fun lt!391667 () tuple2!11218)

(declare-fun lt!391665 () ListLongMap!9977)

(assert (=> b!864945 (= lt!391665 (+!2372 (+!2372 lt!391669 lt!391667) lt!391672))))

(declare-fun lt!391671 () Unit!29548)

(declare-fun lt!391664 () V!27465)

(declare-fun addCommutativeForDiffKeys!514 (ListLongMap!9977 (_ BitVec 64) V!27465 (_ BitVec 64) V!27465) Unit!29548)

(assert (=> b!864945 (= lt!391671 (addCommutativeForDiffKeys!514 lt!391669 k0!854 v!557 (select (arr!23921 _keys!868) from!1053) lt!391664))))

(declare-fun b!864946 () Bool)

(declare-fun res!587763 () Bool)

(assert (=> b!864946 (=> (not res!587763) (not e!481824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49779 (_ BitVec 32)) Bool)

(assert (=> b!864946 (= res!587763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864947 () Bool)

(assert (=> b!864947 (= e!481820 e!481822)))

(declare-fun res!587768 () Bool)

(assert (=> b!864947 (=> res!587768 e!481822)))

(assert (=> b!864947 (= res!587768 (= k0!854 (select (arr!23921 _keys!868) from!1053)))))

(assert (=> b!864947 (not (= (select (arr!23921 _keys!868) from!1053) k0!854))))

(declare-fun lt!391663 () Unit!29548)

(assert (=> b!864947 (= lt!391663 e!481823)))

(declare-fun c!92171 () Bool)

(assert (=> b!864947 (= c!92171 (= (select (arr!23921 _keys!868) from!1053) k0!854))))

(assert (=> b!864947 (= lt!391662 lt!391665)))

(assert (=> b!864947 (= lt!391665 (+!2372 lt!391674 lt!391667))))

(assert (=> b!864947 (= lt!391667 (tuple2!11219 (select (arr!23921 _keys!868) from!1053) lt!391664))))

(declare-fun get!12644 (ValueCell!7967 V!27465) V!27465)

(declare-fun dynLambda!1171 (Int (_ BitVec 64)) V!27465)

(assert (=> b!864947 (= lt!391664 (get!12644 (select (arr!23922 _values!688) from!1053) (dynLambda!1171 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864948 () Bool)

(declare-fun res!587765 () Bool)

(assert (=> b!864948 (=> (not res!587765) (not e!481824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864948 (= res!587765 (validMask!0 mask!1196))))

(declare-fun b!864949 () Bool)

(assert (=> b!864949 (= e!481816 (and e!481817 mapRes!26819))))

(declare-fun condMapEmpty!26819 () Bool)

(declare-fun mapDefault!26819 () ValueCell!7967)

(assert (=> b!864949 (= condMapEmpty!26819 (= (arr!23922 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7967)) mapDefault!26819)))))

(declare-fun b!864950 () Bool)

(declare-fun Unit!29551 () Unit!29548)

(assert (=> b!864950 (= e!481823 Unit!29551)))

(declare-fun b!864951 () Bool)

(declare-fun res!587761 () Bool)

(assert (=> b!864951 (=> (not res!587761) (not e!481824))))

(assert (=> b!864951 (= res!587761 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24363 _keys!868))))))

(declare-fun mapNonEmpty!26819 () Bool)

(declare-fun tp!51535 () Bool)

(assert (=> mapNonEmpty!26819 (= mapRes!26819 (and tp!51535 e!481818))))

(declare-fun mapKey!26819 () (_ BitVec 32))

(declare-fun mapRest!26819 () (Array (_ BitVec 32) ValueCell!7967))

(declare-fun mapValue!26819 () ValueCell!7967)

(assert (=> mapNonEmpty!26819 (= (arr!23922 _values!688) (store mapRest!26819 mapKey!26819 mapValue!26819))))

(assert (= (and start!73744 res!587764) b!864948))

(assert (= (and b!864948 res!587765) b!864942))

(assert (= (and b!864942 res!587759) b!864946))

(assert (= (and b!864946 res!587763) b!864943))

(assert (= (and b!864943 res!587766) b!864951))

(assert (= (and b!864951 res!587761) b!864936))

(assert (= (and b!864936 res!587767) b!864939))

(assert (= (and b!864939 res!587760) b!864941))

(assert (= (and b!864941 res!587769) b!864940))

(assert (= (and b!864940 (not res!587762)) b!864947))

(assert (= (and b!864947 c!92171) b!864937))

(assert (= (and b!864947 (not c!92171)) b!864950))

(assert (= (and b!864947 (not res!587768)) b!864945))

(assert (= (and b!864949 condMapEmpty!26819) mapIsEmpty!26819))

(assert (= (and b!864949 (not condMapEmpty!26819)) mapNonEmpty!26819))

(get-info :version)

(assert (= (and mapNonEmpty!26819 ((_ is ValueCellFull!7967) mapValue!26819)) b!864944))

(assert (= (and b!864949 ((_ is ValueCellFull!7967) mapDefault!26819)) b!864938))

(assert (= start!73744 b!864949))

(declare-fun b_lambda!12011 () Bool)

(assert (=> (not b_lambda!12011) (not b!864947)))

(declare-fun t!23943 () Bool)

(declare-fun tb!4791 () Bool)

(assert (=> (and start!73744 (= defaultEntry!696 defaultEntry!696) t!23943) tb!4791))

(declare-fun result!9201 () Bool)

(assert (=> tb!4791 (= result!9201 tp_is_empty!16813)))

(assert (=> b!864947 t!23943))

(declare-fun b_and!24309 () Bool)

(assert (= b_and!24307 (and (=> t!23943 result!9201) b_and!24309)))

(declare-fun m!805875 () Bool)

(assert (=> b!864943 m!805875))

(declare-fun m!805877 () Bool)

(assert (=> b!864941 m!805877))

(declare-fun m!805879 () Bool)

(assert (=> b!864941 m!805879))

(declare-fun m!805881 () Bool)

(assert (=> b!864941 m!805881))

(declare-fun m!805883 () Bool)

(assert (=> b!864947 m!805883))

(declare-fun m!805885 () Bool)

(assert (=> b!864947 m!805885))

(declare-fun m!805887 () Bool)

(assert (=> b!864947 m!805887))

(declare-fun m!805889 () Bool)

(assert (=> b!864947 m!805889))

(assert (=> b!864947 m!805885))

(declare-fun m!805891 () Bool)

(assert (=> b!864947 m!805891))

(assert (=> b!864947 m!805887))

(declare-fun m!805893 () Bool)

(assert (=> b!864936 m!805893))

(declare-fun m!805895 () Bool)

(assert (=> b!864946 m!805895))

(declare-fun m!805897 () Bool)

(assert (=> mapNonEmpty!26819 m!805897))

(declare-fun m!805899 () Bool)

(assert (=> b!864948 m!805899))

(declare-fun m!805901 () Bool)

(assert (=> b!864945 m!805901))

(assert (=> b!864945 m!805901))

(declare-fun m!805903 () Bool)

(assert (=> b!864945 m!805903))

(assert (=> b!864945 m!805891))

(assert (=> b!864945 m!805891))

(declare-fun m!805905 () Bool)

(assert (=> b!864945 m!805905))

(declare-fun m!805907 () Bool)

(assert (=> start!73744 m!805907))

(declare-fun m!805909 () Bool)

(assert (=> start!73744 m!805909))

(declare-fun m!805911 () Bool)

(assert (=> b!864937 m!805911))

(declare-fun m!805913 () Bool)

(assert (=> b!864937 m!805913))

(declare-fun m!805915 () Bool)

(assert (=> b!864937 m!805915))

(declare-fun m!805917 () Bool)

(assert (=> b!864937 m!805917))

(declare-fun m!805919 () Bool)

(assert (=> b!864937 m!805919))

(declare-fun m!805921 () Bool)

(assert (=> b!864939 m!805921))

(declare-fun m!805923 () Bool)

(assert (=> b!864940 m!805923))

(declare-fun m!805925 () Bool)

(assert (=> b!864940 m!805925))

(assert (=> b!864940 m!805891))

(declare-fun m!805927 () Bool)

(assert (=> b!864940 m!805927))

(assert (=> b!864940 m!805891))

(declare-fun m!805929 () Bool)

(assert (=> b!864940 m!805929))

(declare-fun m!805931 () Bool)

(assert (=> b!864940 m!805931))

(check-sat (not b!864940) (not mapNonEmpty!26819) (not b!864937) (not b!864945) (not start!73744) (not b!864946) (not b!864936) (not b_next!14677) (not b!864943) (not b!864941) (not b!864947) b_and!24309 (not b_lambda!12011) tp_is_empty!16813 (not b!864948))
(check-sat b_and!24309 (not b_next!14677))
