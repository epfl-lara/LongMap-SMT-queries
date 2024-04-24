; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74038 () Bool)

(assert start!74038)

(declare-fun b_free!14785 () Bool)

(declare-fun b_next!14785 () Bool)

(assert (=> start!74038 (= b_free!14785 (not b_next!14785))))

(declare-fun tp!51860 () Bool)

(declare-fun b_and!24547 () Bool)

(assert (=> start!74038 (= tp!51860 b_and!24547)))

(declare-fun res!589960 () Bool)

(declare-fun e!483946 () Bool)

(assert (=> start!74038 (=> (not res!589960) (not e!483946))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50051 0))(
  ( (array!50052 (arr!24052 (Array (_ BitVec 32) (_ BitVec 64))) (size!24493 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50051)

(assert (=> start!74038 (= res!589960 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24493 _keys!868))))))

(assert (=> start!74038 e!483946))

(declare-fun tp_is_empty!16921 () Bool)

(assert (=> start!74038 tp_is_empty!16921))

(assert (=> start!74038 true))

(assert (=> start!74038 tp!51860))

(declare-fun array_inv!19056 (array!50051) Bool)

(assert (=> start!74038 (array_inv!19056 _keys!868)))

(declare-datatypes ((V!27609 0))(
  ( (V!27610 (val!8508 Int)) )
))
(declare-datatypes ((ValueCell!8021 0))(
  ( (ValueCellFull!8021 (v!10933 V!27609)) (EmptyCell!8021) )
))
(declare-datatypes ((array!50053 0))(
  ( (array!50054 (arr!24053 (Array (_ BitVec 32) ValueCell!8021)) (size!24494 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50053)

(declare-fun e!483947 () Bool)

(declare-fun array_inv!19057 (array!50053) Bool)

(assert (=> start!74038 (and (array_inv!19057 _values!688) e!483947)))

(declare-fun b!868686 () Bool)

(declare-fun e!483949 () Bool)

(assert (=> b!868686 (= e!483949 (not true))))

(declare-fun lt!394613 () array!50053)

(declare-fun v!557 () V!27609)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!27609)

(declare-fun zeroValue!654 () V!27609)

(declare-datatypes ((tuple2!11216 0))(
  ( (tuple2!11217 (_1!5619 (_ BitVec 64)) (_2!5619 V!27609)) )
))
(declare-datatypes ((List!17044 0))(
  ( (Nil!17041) (Cons!17040 (h!18177 tuple2!11216) (t!24073 List!17044)) )
))
(declare-datatypes ((ListLongMap!9987 0))(
  ( (ListLongMap!9988 (toList!5009 List!17044)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3053 (array!50051 array!50053 (_ BitVec 32) (_ BitVec 32) V!27609 V!27609 (_ BitVec 32) Int) ListLongMap!9987)

(declare-fun +!2410 (ListLongMap!9987 tuple2!11216) ListLongMap!9987)

(assert (=> b!868686 (= (getCurrentListMapNoExtraKeys!3053 _keys!868 lt!394613 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2410 (getCurrentListMapNoExtraKeys!3053 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11217 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29770 0))(
  ( (Unit!29771) )
))
(declare-fun lt!394610 () Unit!29770)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!581 (array!50051 array!50053 (_ BitVec 32) (_ BitVec 32) V!27609 V!27609 (_ BitVec 32) (_ BitVec 64) V!27609 (_ BitVec 32) Int) Unit!29770)

(assert (=> b!868686 (= lt!394610 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!581 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26981 () Bool)

(declare-fun mapRes!26981 () Bool)

(assert (=> mapIsEmpty!26981 mapRes!26981))

(declare-fun b!868687 () Bool)

(declare-fun res!589958 () Bool)

(assert (=> b!868687 (=> (not res!589958) (not e!483946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868687 (= res!589958 (validKeyInArray!0 k0!854))))

(declare-fun b!868688 () Bool)

(declare-fun e!483944 () Bool)

(assert (=> b!868688 (= e!483944 tp_is_empty!16921)))

(declare-fun b!868689 () Bool)

(declare-fun res!589959 () Bool)

(assert (=> b!868689 (=> (not res!589959) (not e!483946))))

(assert (=> b!868689 (= res!589959 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24493 _keys!868))))))

(declare-fun mapNonEmpty!26981 () Bool)

(declare-fun tp!51859 () Bool)

(assert (=> mapNonEmpty!26981 (= mapRes!26981 (and tp!51859 e!483944))))

(declare-fun mapValue!26981 () ValueCell!8021)

(declare-fun mapKey!26981 () (_ BitVec 32))

(declare-fun mapRest!26981 () (Array (_ BitVec 32) ValueCell!8021))

(assert (=> mapNonEmpty!26981 (= (arr!24053 _values!688) (store mapRest!26981 mapKey!26981 mapValue!26981))))

(declare-fun b!868690 () Bool)

(declare-fun res!589955 () Bool)

(assert (=> b!868690 (=> (not res!589955) (not e!483946))))

(assert (=> b!868690 (= res!589955 (and (= (select (arr!24052 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868691 () Bool)

(declare-fun e!483945 () Bool)

(assert (=> b!868691 (= e!483947 (and e!483945 mapRes!26981))))

(declare-fun condMapEmpty!26981 () Bool)

(declare-fun mapDefault!26981 () ValueCell!8021)

(assert (=> b!868691 (= condMapEmpty!26981 (= (arr!24053 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8021)) mapDefault!26981)))))

(declare-fun b!868692 () Bool)

(declare-fun res!589961 () Bool)

(assert (=> b!868692 (=> (not res!589961) (not e!483946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50051 (_ BitVec 32)) Bool)

(assert (=> b!868692 (= res!589961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868693 () Bool)

(declare-fun res!589956 () Bool)

(assert (=> b!868693 (=> (not res!589956) (not e!483946))))

(declare-datatypes ((List!17045 0))(
  ( (Nil!17042) (Cons!17041 (h!18178 (_ BitVec 64)) (t!24074 List!17045)) )
))
(declare-fun arrayNoDuplicates!0 (array!50051 (_ BitVec 32) List!17045) Bool)

(assert (=> b!868693 (= res!589956 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17042))))

(declare-fun b!868694 () Bool)

(assert (=> b!868694 (= e!483945 tp_is_empty!16921)))

(declare-fun b!868695 () Bool)

(declare-fun res!589957 () Bool)

(assert (=> b!868695 (=> (not res!589957) (not e!483946))))

(assert (=> b!868695 (= res!589957 (and (= (size!24494 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24493 _keys!868) (size!24494 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868696 () Bool)

(assert (=> b!868696 (= e!483946 e!483949)))

(declare-fun res!589963 () Bool)

(assert (=> b!868696 (=> (not res!589963) (not e!483949))))

(assert (=> b!868696 (= res!589963 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394611 () ListLongMap!9987)

(assert (=> b!868696 (= lt!394611 (getCurrentListMapNoExtraKeys!3053 _keys!868 lt!394613 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868696 (= lt!394613 (array!50054 (store (arr!24053 _values!688) i!612 (ValueCellFull!8021 v!557)) (size!24494 _values!688)))))

(declare-fun lt!394612 () ListLongMap!9987)

(assert (=> b!868696 (= lt!394612 (getCurrentListMapNoExtraKeys!3053 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868697 () Bool)

(declare-fun res!589962 () Bool)

(assert (=> b!868697 (=> (not res!589962) (not e!483946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868697 (= res!589962 (validMask!0 mask!1196))))

(assert (= (and start!74038 res!589960) b!868697))

(assert (= (and b!868697 res!589962) b!868695))

(assert (= (and b!868695 res!589957) b!868692))

(assert (= (and b!868692 res!589961) b!868693))

(assert (= (and b!868693 res!589956) b!868689))

(assert (= (and b!868689 res!589959) b!868687))

(assert (= (and b!868687 res!589958) b!868690))

(assert (= (and b!868690 res!589955) b!868696))

(assert (= (and b!868696 res!589963) b!868686))

(assert (= (and b!868691 condMapEmpty!26981) mapIsEmpty!26981))

(assert (= (and b!868691 (not condMapEmpty!26981)) mapNonEmpty!26981))

(get-info :version)

(assert (= (and mapNonEmpty!26981 ((_ is ValueCellFull!8021) mapValue!26981)) b!868688))

(assert (= (and b!868691 ((_ is ValueCellFull!8021) mapDefault!26981)) b!868694))

(assert (= start!74038 b!868691))

(declare-fun m!810887 () Bool)

(assert (=> start!74038 m!810887))

(declare-fun m!810889 () Bool)

(assert (=> start!74038 m!810889))

(declare-fun m!810891 () Bool)

(assert (=> b!868690 m!810891))

(declare-fun m!810893 () Bool)

(assert (=> b!868686 m!810893))

(declare-fun m!810895 () Bool)

(assert (=> b!868686 m!810895))

(assert (=> b!868686 m!810895))

(declare-fun m!810897 () Bool)

(assert (=> b!868686 m!810897))

(declare-fun m!810899 () Bool)

(assert (=> b!868686 m!810899))

(declare-fun m!810901 () Bool)

(assert (=> b!868692 m!810901))

(declare-fun m!810903 () Bool)

(assert (=> b!868693 m!810903))

(declare-fun m!810905 () Bool)

(assert (=> mapNonEmpty!26981 m!810905))

(declare-fun m!810907 () Bool)

(assert (=> b!868696 m!810907))

(declare-fun m!810909 () Bool)

(assert (=> b!868696 m!810909))

(declare-fun m!810911 () Bool)

(assert (=> b!868696 m!810911))

(declare-fun m!810913 () Bool)

(assert (=> b!868687 m!810913))

(declare-fun m!810915 () Bool)

(assert (=> b!868697 m!810915))

(check-sat (not b!868692) (not mapNonEmpty!26981) (not b_next!14785) b_and!24547 (not start!74038) (not b!868697) (not b!868696) (not b!868693) (not b!868686) (not b!868687) tp_is_empty!16921)
(check-sat b_and!24547 (not b_next!14785))
