; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74092 () Bool)

(assert start!74092)

(declare-fun b_free!14839 () Bool)

(declare-fun b_next!14839 () Bool)

(assert (=> start!74092 (= b_free!14839 (not b_next!14839))))

(declare-fun tp!52021 () Bool)

(declare-fun b_and!24601 () Bool)

(assert (=> start!74092 (= tp!52021 b_and!24601)))

(declare-fun b!869658 () Bool)

(declare-fun e!484434 () Bool)

(declare-fun tp_is_empty!16975 () Bool)

(assert (=> b!869658 (= e!484434 tp_is_empty!16975)))

(declare-fun b!869660 () Bool)

(declare-fun res!590687 () Bool)

(declare-fun e!484430 () Bool)

(assert (=> b!869660 (=> (not res!590687) (not e!484430))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50159 0))(
  ( (array!50160 (arr!24106 (Array (_ BitVec 32) (_ BitVec 64))) (size!24547 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50159)

(assert (=> b!869660 (= res!590687 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24547 _keys!868))))))

(declare-fun b!869661 () Bool)

(declare-fun res!590686 () Bool)

(assert (=> b!869661 (=> (not res!590686) (not e!484430))))

(declare-datatypes ((List!17082 0))(
  ( (Nil!17079) (Cons!17078 (h!18215 (_ BitVec 64)) (t!24111 List!17082)) )
))
(declare-fun arrayNoDuplicates!0 (array!50159 (_ BitVec 32) List!17082) Bool)

(assert (=> b!869661 (= res!590686 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17079))))

(declare-fun b!869662 () Bool)

(declare-fun res!590692 () Bool)

(assert (=> b!869662 (=> (not res!590692) (not e!484430))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27681 0))(
  ( (V!27682 (val!8535 Int)) )
))
(declare-datatypes ((ValueCell!8048 0))(
  ( (ValueCellFull!8048 (v!10960 V!27681)) (EmptyCell!8048) )
))
(declare-datatypes ((array!50161 0))(
  ( (array!50162 (arr!24107 (Array (_ BitVec 32) ValueCell!8048)) (size!24548 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50161)

(assert (=> b!869662 (= res!590692 (and (= (size!24548 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24547 _keys!868) (size!24548 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869663 () Bool)

(declare-fun e!484435 () Bool)

(assert (=> b!869663 (= e!484435 (not true))))

(declare-fun v!557 () V!27681)

(declare-fun defaultEntry!696 () Int)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27681)

(declare-fun zeroValue!654 () V!27681)

(declare-fun lt!394934 () array!50161)

(declare-datatypes ((tuple2!11260 0))(
  ( (tuple2!11261 (_1!5641 (_ BitVec 64)) (_2!5641 V!27681)) )
))
(declare-datatypes ((List!17083 0))(
  ( (Nil!17080) (Cons!17079 (h!18216 tuple2!11260) (t!24112 List!17083)) )
))
(declare-datatypes ((ListLongMap!10031 0))(
  ( (ListLongMap!10032 (toList!5031 List!17083)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3075 (array!50159 array!50161 (_ BitVec 32) (_ BitVec 32) V!27681 V!27681 (_ BitVec 32) Int) ListLongMap!10031)

(declare-fun +!2427 (ListLongMap!10031 tuple2!11260) ListLongMap!10031)

(assert (=> b!869663 (= (getCurrentListMapNoExtraKeys!3075 _keys!868 lt!394934 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2427 (getCurrentListMapNoExtraKeys!3075 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11261 k0!854 v!557)))))

(declare-datatypes ((Unit!29804 0))(
  ( (Unit!29805) )
))
(declare-fun lt!394937 () Unit!29804)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!598 (array!50159 array!50161 (_ BitVec 32) (_ BitVec 32) V!27681 V!27681 (_ BitVec 32) (_ BitVec 64) V!27681 (_ BitVec 32) Int) Unit!29804)

(assert (=> b!869663 (= lt!394937 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!598 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869664 () Bool)

(declare-fun res!590688 () Bool)

(assert (=> b!869664 (=> (not res!590688) (not e!484430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50159 (_ BitVec 32)) Bool)

(assert (=> b!869664 (= res!590688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869665 () Bool)

(declare-fun e!484432 () Bool)

(assert (=> b!869665 (= e!484432 tp_is_empty!16975)))

(declare-fun res!590685 () Bool)

(assert (=> start!74092 (=> (not res!590685) (not e!484430))))

(assert (=> start!74092 (= res!590685 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24547 _keys!868))))))

(assert (=> start!74092 e!484430))

(assert (=> start!74092 tp_is_empty!16975))

(assert (=> start!74092 true))

(assert (=> start!74092 tp!52021))

(declare-fun array_inv!19096 (array!50159) Bool)

(assert (=> start!74092 (array_inv!19096 _keys!868)))

(declare-fun e!484433 () Bool)

(declare-fun array_inv!19097 (array!50161) Bool)

(assert (=> start!74092 (and (array_inv!19097 _values!688) e!484433)))

(declare-fun b!869659 () Bool)

(declare-fun res!590690 () Bool)

(assert (=> b!869659 (=> (not res!590690) (not e!484430))))

(assert (=> b!869659 (= res!590690 (and (= (select (arr!24106 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869666 () Bool)

(assert (=> b!869666 (= e!484430 e!484435)))

(declare-fun res!590691 () Bool)

(assert (=> b!869666 (=> (not res!590691) (not e!484435))))

(assert (=> b!869666 (= res!590691 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394936 () ListLongMap!10031)

(assert (=> b!869666 (= lt!394936 (getCurrentListMapNoExtraKeys!3075 _keys!868 lt!394934 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!869666 (= lt!394934 (array!50162 (store (arr!24107 _values!688) i!612 (ValueCellFull!8048 v!557)) (size!24548 _values!688)))))

(declare-fun lt!394935 () ListLongMap!10031)

(assert (=> b!869666 (= lt!394935 (getCurrentListMapNoExtraKeys!3075 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869667 () Bool)

(declare-fun res!590684 () Bool)

(assert (=> b!869667 (=> (not res!590684) (not e!484430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869667 (= res!590684 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27062 () Bool)

(declare-fun mapRes!27062 () Bool)

(assert (=> mapIsEmpty!27062 mapRes!27062))

(declare-fun b!869668 () Bool)

(assert (=> b!869668 (= e!484433 (and e!484432 mapRes!27062))))

(declare-fun condMapEmpty!27062 () Bool)

(declare-fun mapDefault!27062 () ValueCell!8048)

(assert (=> b!869668 (= condMapEmpty!27062 (= (arr!24107 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8048)) mapDefault!27062)))))

(declare-fun b!869669 () Bool)

(declare-fun res!590689 () Bool)

(assert (=> b!869669 (=> (not res!590689) (not e!484430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869669 (= res!590689 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27062 () Bool)

(declare-fun tp!52022 () Bool)

(assert (=> mapNonEmpty!27062 (= mapRes!27062 (and tp!52022 e!484434))))

(declare-fun mapValue!27062 () ValueCell!8048)

(declare-fun mapRest!27062 () (Array (_ BitVec 32) ValueCell!8048))

(declare-fun mapKey!27062 () (_ BitVec 32))

(assert (=> mapNonEmpty!27062 (= (arr!24107 _values!688) (store mapRest!27062 mapKey!27062 mapValue!27062))))

(assert (= (and start!74092 res!590685) b!869667))

(assert (= (and b!869667 res!590684) b!869662))

(assert (= (and b!869662 res!590692) b!869664))

(assert (= (and b!869664 res!590688) b!869661))

(assert (= (and b!869661 res!590686) b!869660))

(assert (= (and b!869660 res!590687) b!869669))

(assert (= (and b!869669 res!590689) b!869659))

(assert (= (and b!869659 res!590690) b!869666))

(assert (= (and b!869666 res!590691) b!869663))

(assert (= (and b!869668 condMapEmpty!27062) mapIsEmpty!27062))

(assert (= (and b!869668 (not condMapEmpty!27062)) mapNonEmpty!27062))

(get-info :version)

(assert (= (and mapNonEmpty!27062 ((_ is ValueCellFull!8048) mapValue!27062)) b!869658))

(assert (= (and b!869668 ((_ is ValueCellFull!8048) mapDefault!27062)) b!869665))

(assert (= start!74092 b!869668))

(declare-fun m!811697 () Bool)

(assert (=> b!869666 m!811697))

(declare-fun m!811699 () Bool)

(assert (=> b!869666 m!811699))

(declare-fun m!811701 () Bool)

(assert (=> b!869666 m!811701))

(declare-fun m!811703 () Bool)

(assert (=> b!869659 m!811703))

(declare-fun m!811705 () Bool)

(assert (=> b!869661 m!811705))

(declare-fun m!811707 () Bool)

(assert (=> b!869664 m!811707))

(declare-fun m!811709 () Bool)

(assert (=> mapNonEmpty!27062 m!811709))

(declare-fun m!811711 () Bool)

(assert (=> b!869663 m!811711))

(declare-fun m!811713 () Bool)

(assert (=> b!869663 m!811713))

(assert (=> b!869663 m!811713))

(declare-fun m!811715 () Bool)

(assert (=> b!869663 m!811715))

(declare-fun m!811717 () Bool)

(assert (=> b!869663 m!811717))

(declare-fun m!811719 () Bool)

(assert (=> start!74092 m!811719))

(declare-fun m!811721 () Bool)

(assert (=> start!74092 m!811721))

(declare-fun m!811723 () Bool)

(assert (=> b!869667 m!811723))

(declare-fun m!811725 () Bool)

(assert (=> b!869669 m!811725))

(check-sat b_and!24601 (not b!869666) (not b!869663) (not b!869664) (not b!869669) (not b!869667) tp_is_empty!16975 (not start!74092) (not b_next!14839) (not mapNonEmpty!27062) (not b!869661))
(check-sat b_and!24601 (not b_next!14839))
