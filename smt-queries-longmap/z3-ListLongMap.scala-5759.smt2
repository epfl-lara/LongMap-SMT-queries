; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74404 () Bool)

(assert start!74404)

(declare-fun b_free!15147 () Bool)

(declare-fun b_next!15147 () Bool)

(assert (=> start!74404 (= b_free!15147 (not b_next!15147))))

(declare-fun tp!53118 () Bool)

(declare-fun b_and!24947 () Bool)

(assert (=> start!74404 (= tp!53118 b_and!24947)))

(declare-fun b!875965 () Bool)

(declare-fun res!595253 () Bool)

(declare-fun e!487651 () Bool)

(assert (=> b!875965 (=> (not res!595253) (not e!487651))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875965 (= res!595253 (validKeyInArray!0 k0!854))))

(declare-fun b!875966 () Bool)

(declare-fun e!487649 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((V!28235 0))(
  ( (V!28236 (val!8743 Int)) )
))
(declare-datatypes ((ValueCell!8256 0))(
  ( (ValueCellFull!8256 (v!11176 V!28235)) (EmptyCell!8256) )
))
(declare-datatypes ((array!50908 0))(
  ( (array!50909 (arr!24481 (Array (_ BitVec 32) ValueCell!8256)) (size!24921 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50908)

(assert (=> b!875966 (= e!487649 (bvslt i!612 (size!24921 _values!688)))))

(declare-fun lt!396360 () array!50908)

(declare-datatypes ((tuple2!11554 0))(
  ( (tuple2!11555 (_1!5788 (_ BitVec 64)) (_2!5788 V!28235)) )
))
(declare-datatypes ((List!17374 0))(
  ( (Nil!17371) (Cons!17370 (h!18501 tuple2!11554) (t!24425 List!17374)) )
))
(declare-datatypes ((ListLongMap!10323 0))(
  ( (ListLongMap!10324 (toList!5177 List!17374)) )
))
(declare-fun lt!396363 () ListLongMap!10323)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50910 0))(
  ( (array!50911 (arr!24482 (Array (_ BitVec 32) (_ BitVec 64))) (size!24922 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50910)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28235)

(declare-fun zeroValue!654 () V!28235)

(declare-fun +!2479 (ListLongMap!10323 tuple2!11554) ListLongMap!10323)

(declare-fun getCurrentListMapNoExtraKeys!3144 (array!50910 array!50908 (_ BitVec 32) (_ BitVec 32) V!28235 V!28235 (_ BitVec 32) Int) ListLongMap!10323)

(declare-fun get!12871 (ValueCell!8256 V!28235) V!28235)

(declare-fun dynLambda!1207 (Int (_ BitVec 64)) V!28235)

(assert (=> b!875966 (= lt!396363 (+!2479 (getCurrentListMapNoExtraKeys!3144 _keys!868 lt!396360 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11555 (select (arr!24482 _keys!868) from!1053) (get!12871 (select (arr!24481 lt!396360) from!1053) (dynLambda!1207 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!875967 () Bool)

(declare-fun res!595259 () Bool)

(assert (=> b!875967 (=> (not res!595259) (not e!487651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875967 (= res!595259 (validMask!0 mask!1196))))

(declare-fun call!38685 () ListLongMap!10323)

(declare-fun bm!38681 () Bool)

(assert (=> bm!38681 (= call!38685 (getCurrentListMapNoExtraKeys!3144 _keys!868 lt!396360 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875968 () Bool)

(declare-fun res!595255 () Bool)

(assert (=> b!875968 (=> (not res!595255) (not e!487651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50910 (_ BitVec 32)) Bool)

(assert (=> b!875968 (= res!595255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875969 () Bool)

(declare-fun e!487647 () Bool)

(declare-fun call!38684 () ListLongMap!10323)

(assert (=> b!875969 (= e!487647 (= call!38685 call!38684))))

(declare-fun b!875970 () Bool)

(declare-fun res!595250 () Bool)

(assert (=> b!875970 (=> (not res!595250) (not e!487651))))

(declare-datatypes ((List!17375 0))(
  ( (Nil!17372) (Cons!17371 (h!18502 (_ BitVec 64)) (t!24426 List!17375)) )
))
(declare-fun arrayNoDuplicates!0 (array!50910 (_ BitVec 32) List!17375) Bool)

(assert (=> b!875970 (= res!595250 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17372))))

(declare-fun bm!38682 () Bool)

(assert (=> bm!38682 (= call!38684 (getCurrentListMapNoExtraKeys!3144 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875971 () Bool)

(declare-fun res!595256 () Bool)

(assert (=> b!875971 (=> (not res!595256) (not e!487651))))

(assert (=> b!875971 (= res!595256 (and (= (size!24921 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24922 _keys!868) (size!24921 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!595252 () Bool)

(assert (=> start!74404 (=> (not res!595252) (not e!487651))))

(assert (=> start!74404 (= res!595252 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24922 _keys!868))))))

(assert (=> start!74404 e!487651))

(declare-fun tp_is_empty!17391 () Bool)

(assert (=> start!74404 tp_is_empty!17391))

(assert (=> start!74404 true))

(assert (=> start!74404 tp!53118))

(declare-fun array_inv!19302 (array!50910) Bool)

(assert (=> start!74404 (array_inv!19302 _keys!868)))

(declare-fun e!487652 () Bool)

(declare-fun array_inv!19303 (array!50908) Bool)

(assert (=> start!74404 (and (array_inv!19303 _values!688) e!487652)))

(declare-fun b!875972 () Bool)

(declare-fun e!487650 () Bool)

(assert (=> b!875972 (= e!487650 tp_is_empty!17391)))

(declare-fun b!875973 () Bool)

(declare-fun mapRes!27698 () Bool)

(assert (=> b!875973 (= e!487652 (and e!487650 mapRes!27698))))

(declare-fun condMapEmpty!27698 () Bool)

(declare-fun mapDefault!27698 () ValueCell!8256)

(assert (=> b!875973 (= condMapEmpty!27698 (= (arr!24481 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8256)) mapDefault!27698)))))

(declare-fun b!875974 () Bool)

(declare-fun e!487646 () Bool)

(assert (=> b!875974 (= e!487646 tp_is_empty!17391)))

(declare-fun b!875975 () Bool)

(declare-fun e!487648 () Bool)

(assert (=> b!875975 (= e!487651 e!487648)))

(declare-fun res!595258 () Bool)

(assert (=> b!875975 (=> (not res!595258) (not e!487648))))

(assert (=> b!875975 (= res!595258 (= from!1053 i!612))))

(assert (=> b!875975 (= lt!396363 (getCurrentListMapNoExtraKeys!3144 _keys!868 lt!396360 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28235)

(assert (=> b!875975 (= lt!396360 (array!50909 (store (arr!24481 _values!688) i!612 (ValueCellFull!8256 v!557)) (size!24921 _values!688)))))

(declare-fun lt!396362 () ListLongMap!10323)

(assert (=> b!875975 (= lt!396362 (getCurrentListMapNoExtraKeys!3144 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27698 () Bool)

(declare-fun tp!53119 () Bool)

(assert (=> mapNonEmpty!27698 (= mapRes!27698 (and tp!53119 e!487646))))

(declare-fun mapRest!27698 () (Array (_ BitVec 32) ValueCell!8256))

(declare-fun mapValue!27698 () ValueCell!8256)

(declare-fun mapKey!27698 () (_ BitVec 32))

(assert (=> mapNonEmpty!27698 (= (arr!24481 _values!688) (store mapRest!27698 mapKey!27698 mapValue!27698))))

(declare-fun b!875976 () Bool)

(declare-fun res!595254 () Bool)

(assert (=> b!875976 (=> (not res!595254) (not e!487651))))

(assert (=> b!875976 (= res!595254 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24922 _keys!868))))))

(declare-fun mapIsEmpty!27698 () Bool)

(assert (=> mapIsEmpty!27698 mapRes!27698))

(declare-fun b!875977 () Bool)

(assert (=> b!875977 (= e!487648 (not e!487649))))

(declare-fun res!595251 () Bool)

(assert (=> b!875977 (=> res!595251 e!487649)))

(assert (=> b!875977 (= res!595251 (not (validKeyInArray!0 (select (arr!24482 _keys!868) from!1053))))))

(assert (=> b!875977 e!487647))

(declare-fun c!92570 () Bool)

(assert (=> b!875977 (= c!92570 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29956 0))(
  ( (Unit!29957) )
))
(declare-fun lt!396361 () Unit!29956)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!671 (array!50910 array!50908 (_ BitVec 32) (_ BitVec 32) V!28235 V!28235 (_ BitVec 32) (_ BitVec 64) V!28235 (_ BitVec 32) Int) Unit!29956)

(assert (=> b!875977 (= lt!396361 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!671 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875978 () Bool)

(declare-fun res!595257 () Bool)

(assert (=> b!875978 (=> (not res!595257) (not e!487651))))

(assert (=> b!875978 (= res!595257 (and (= (select (arr!24482 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!875979 () Bool)

(assert (=> b!875979 (= e!487647 (= call!38685 (+!2479 call!38684 (tuple2!11555 k0!854 v!557))))))

(assert (= (and start!74404 res!595252) b!875967))

(assert (= (and b!875967 res!595259) b!875971))

(assert (= (and b!875971 res!595256) b!875968))

(assert (= (and b!875968 res!595255) b!875970))

(assert (= (and b!875970 res!595250) b!875976))

(assert (= (and b!875976 res!595254) b!875965))

(assert (= (and b!875965 res!595253) b!875978))

(assert (= (and b!875978 res!595257) b!875975))

(assert (= (and b!875975 res!595258) b!875977))

(assert (= (and b!875977 c!92570) b!875979))

(assert (= (and b!875977 (not c!92570)) b!875969))

(assert (= (or b!875979 b!875969) bm!38682))

(assert (= (or b!875979 b!875969) bm!38681))

(assert (= (and b!875977 (not res!595251)) b!875966))

(assert (= (and b!875973 condMapEmpty!27698) mapIsEmpty!27698))

(assert (= (and b!875973 (not condMapEmpty!27698)) mapNonEmpty!27698))

(get-info :version)

(assert (= (and mapNonEmpty!27698 ((_ is ValueCellFull!8256) mapValue!27698)) b!875974))

(assert (= (and b!875973 ((_ is ValueCellFull!8256) mapDefault!27698)) b!875972))

(assert (= start!74404 b!875973))

(declare-fun b_lambda!12215 () Bool)

(assert (=> (not b_lambda!12215) (not b!875966)))

(declare-fun t!24424 () Bool)

(declare-fun tb!4907 () Bool)

(assert (=> (and start!74404 (= defaultEntry!696 defaultEntry!696) t!24424) tb!4907))

(declare-fun result!9433 () Bool)

(assert (=> tb!4907 (= result!9433 tp_is_empty!17391)))

(assert (=> b!875966 t!24424))

(declare-fun b_and!24949 () Bool)

(assert (= b_and!24947 (and (=> t!24424 result!9433) b_and!24949)))

(declare-fun m!815777 () Bool)

(assert (=> b!875968 m!815777))

(declare-fun m!815779 () Bool)

(assert (=> b!875977 m!815779))

(assert (=> b!875977 m!815779))

(declare-fun m!815781 () Bool)

(assert (=> b!875977 m!815781))

(declare-fun m!815783 () Bool)

(assert (=> b!875977 m!815783))

(declare-fun m!815785 () Bool)

(assert (=> start!74404 m!815785))

(declare-fun m!815787 () Bool)

(assert (=> start!74404 m!815787))

(declare-fun m!815789 () Bool)

(assert (=> bm!38681 m!815789))

(declare-fun m!815791 () Bool)

(assert (=> b!875979 m!815791))

(declare-fun m!815793 () Bool)

(assert (=> b!875967 m!815793))

(declare-fun m!815795 () Bool)

(assert (=> b!875966 m!815795))

(assert (=> b!875966 m!815795))

(declare-fun m!815797 () Bool)

(assert (=> b!875966 m!815797))

(declare-fun m!815799 () Bool)

(assert (=> b!875966 m!815799))

(assert (=> b!875966 m!815779))

(assert (=> b!875966 m!815797))

(assert (=> b!875966 m!815789))

(assert (=> b!875966 m!815789))

(declare-fun m!815801 () Bool)

(assert (=> b!875966 m!815801))

(declare-fun m!815803 () Bool)

(assert (=> mapNonEmpty!27698 m!815803))

(declare-fun m!815805 () Bool)

(assert (=> b!875978 m!815805))

(declare-fun m!815807 () Bool)

(assert (=> b!875970 m!815807))

(declare-fun m!815809 () Bool)

(assert (=> bm!38682 m!815809))

(declare-fun m!815811 () Bool)

(assert (=> b!875975 m!815811))

(declare-fun m!815813 () Bool)

(assert (=> b!875975 m!815813))

(declare-fun m!815815 () Bool)

(assert (=> b!875975 m!815815))

(declare-fun m!815817 () Bool)

(assert (=> b!875965 m!815817))

(check-sat b_and!24949 (not b!875965) (not b!875966) (not bm!38681) (not start!74404) (not mapNonEmpty!27698) (not b!875977) (not b!875968) (not b_lambda!12215) (not bm!38682) (not b_next!15147) (not b!875975) (not b!875967) (not b!875979) (not b!875970) tp_is_empty!17391)
(check-sat b_and!24949 (not b_next!15147))
