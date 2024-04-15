; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74274 () Bool)

(assert start!74274)

(declare-fun b_free!15055 () Bool)

(declare-fun b_next!15055 () Bool)

(assert (=> start!74274 (= b_free!15055 (not b_next!15055))))

(declare-fun tp!52840 () Bool)

(declare-fun b_and!24805 () Bool)

(assert (=> start!74274 (= tp!52840 b_and!24805)))

(declare-fun b!873843 () Bool)

(declare-fun res!593878 () Bool)

(declare-fun e!486558 () Bool)

(assert (=> b!873843 (=> (not res!593878) (not e!486558))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50711 0))(
  ( (array!50712 (arr!24384 (Array (_ BitVec 32) (_ BitVec 64))) (size!24826 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50711)

(declare-datatypes ((V!28113 0))(
  ( (V!28114 (val!8697 Int)) )
))
(declare-datatypes ((ValueCell!8210 0))(
  ( (ValueCellFull!8210 (v!11120 V!28113)) (EmptyCell!8210) )
))
(declare-datatypes ((array!50713 0))(
  ( (array!50714 (arr!24385 (Array (_ BitVec 32) ValueCell!8210)) (size!24827 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50713)

(assert (=> b!873843 (= res!593878 (and (= (size!24827 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24826 _keys!868) (size!24827 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873844 () Bool)

(declare-fun res!593880 () Bool)

(assert (=> b!873844 (=> (not res!593880) (not e!486558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873844 (= res!593880 (validMask!0 mask!1196))))

(declare-fun b!873845 () Bool)

(declare-fun e!486559 () Bool)

(declare-fun e!486561 () Bool)

(declare-fun mapRes!27557 () Bool)

(assert (=> b!873845 (= e!486559 (and e!486561 mapRes!27557))))

(declare-fun condMapEmpty!27557 () Bool)

(declare-fun mapDefault!27557 () ValueCell!8210)

(assert (=> b!873845 (= condMapEmpty!27557 (= (arr!24385 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8210)) mapDefault!27557)))))

(declare-fun b!873846 () Bool)

(declare-fun e!486560 () Bool)

(declare-fun tp_is_empty!17299 () Bool)

(assert (=> b!873846 (= e!486560 tp_is_empty!17299)))

(declare-fun b!873847 () Bool)

(declare-fun res!593883 () Bool)

(assert (=> b!873847 (=> (not res!593883) (not e!486558))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873847 (= res!593883 (validKeyInArray!0 k0!854))))

(declare-fun b!873848 () Bool)

(declare-fun res!593882 () Bool)

(assert (=> b!873848 (=> (not res!593882) (not e!486558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50711 (_ BitVec 32)) Bool)

(assert (=> b!873848 (= res!593882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873849 () Bool)

(declare-fun res!593879 () Bool)

(assert (=> b!873849 (=> (not res!593879) (not e!486558))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!873849 (= res!593879 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24826 _keys!868))))))

(declare-fun b!873850 () Bool)

(assert (=> b!873850 (= e!486558 false)))

(declare-fun v!557 () V!28113)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28113)

(declare-fun zeroValue!654 () V!28113)

(declare-datatypes ((tuple2!11502 0))(
  ( (tuple2!11503 (_1!5762 (_ BitVec 64)) (_2!5762 V!28113)) )
))
(declare-datatypes ((List!17315 0))(
  ( (Nil!17312) (Cons!17311 (h!18442 tuple2!11502) (t!24347 List!17315)) )
))
(declare-datatypes ((ListLongMap!10261 0))(
  ( (ListLongMap!10262 (toList!5146 List!17315)) )
))
(declare-fun lt!395643 () ListLongMap!10261)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3139 (array!50711 array!50713 (_ BitVec 32) (_ BitVec 32) V!28113 V!28113 (_ BitVec 32) Int) ListLongMap!10261)

(assert (=> b!873850 (= lt!395643 (getCurrentListMapNoExtraKeys!3139 _keys!868 (array!50714 (store (arr!24385 _values!688) i!612 (ValueCellFull!8210 v!557)) (size!24827 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395642 () ListLongMap!10261)

(assert (=> b!873850 (= lt!395642 (getCurrentListMapNoExtraKeys!3139 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873851 () Bool)

(assert (=> b!873851 (= e!486561 tp_is_empty!17299)))

(declare-fun mapNonEmpty!27557 () Bool)

(declare-fun tp!52841 () Bool)

(assert (=> mapNonEmpty!27557 (= mapRes!27557 (and tp!52841 e!486560))))

(declare-fun mapKey!27557 () (_ BitVec 32))

(declare-fun mapRest!27557 () (Array (_ BitVec 32) ValueCell!8210))

(declare-fun mapValue!27557 () ValueCell!8210)

(assert (=> mapNonEmpty!27557 (= (arr!24385 _values!688) (store mapRest!27557 mapKey!27557 mapValue!27557))))

(declare-fun b!873853 () Bool)

(declare-fun res!593881 () Bool)

(assert (=> b!873853 (=> (not res!593881) (not e!486558))))

(assert (=> b!873853 (= res!593881 (and (= (select (arr!24384 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27557 () Bool)

(assert (=> mapIsEmpty!27557 mapRes!27557))

(declare-fun b!873852 () Bool)

(declare-fun res!593877 () Bool)

(assert (=> b!873852 (=> (not res!593877) (not e!486558))))

(declare-datatypes ((List!17316 0))(
  ( (Nil!17313) (Cons!17312 (h!18443 (_ BitVec 64)) (t!24348 List!17316)) )
))
(declare-fun arrayNoDuplicates!0 (array!50711 (_ BitVec 32) List!17316) Bool)

(assert (=> b!873852 (= res!593877 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17313))))

(declare-fun res!593884 () Bool)

(assert (=> start!74274 (=> (not res!593884) (not e!486558))))

(assert (=> start!74274 (= res!593884 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24826 _keys!868))))))

(assert (=> start!74274 e!486558))

(assert (=> start!74274 tp_is_empty!17299))

(assert (=> start!74274 true))

(assert (=> start!74274 tp!52840))

(declare-fun array_inv!19286 (array!50711) Bool)

(assert (=> start!74274 (array_inv!19286 _keys!868)))

(declare-fun array_inv!19287 (array!50713) Bool)

(assert (=> start!74274 (and (array_inv!19287 _values!688) e!486559)))

(assert (= (and start!74274 res!593884) b!873844))

(assert (= (and b!873844 res!593880) b!873843))

(assert (= (and b!873843 res!593878) b!873848))

(assert (= (and b!873848 res!593882) b!873852))

(assert (= (and b!873852 res!593877) b!873849))

(assert (= (and b!873849 res!593879) b!873847))

(assert (= (and b!873847 res!593883) b!873853))

(assert (= (and b!873853 res!593881) b!873850))

(assert (= (and b!873845 condMapEmpty!27557) mapIsEmpty!27557))

(assert (= (and b!873845 (not condMapEmpty!27557)) mapNonEmpty!27557))

(get-info :version)

(assert (= (and mapNonEmpty!27557 ((_ is ValueCellFull!8210) mapValue!27557)) b!873846))

(assert (= (and b!873845 ((_ is ValueCellFull!8210) mapDefault!27557)) b!873851))

(assert (= start!74274 b!873845))

(declare-fun m!813611 () Bool)

(assert (=> b!873850 m!813611))

(declare-fun m!813613 () Bool)

(assert (=> b!873850 m!813613))

(declare-fun m!813615 () Bool)

(assert (=> b!873850 m!813615))

(declare-fun m!813617 () Bool)

(assert (=> b!873852 m!813617))

(declare-fun m!813619 () Bool)

(assert (=> b!873844 m!813619))

(declare-fun m!813621 () Bool)

(assert (=> b!873853 m!813621))

(declare-fun m!813623 () Bool)

(assert (=> b!873848 m!813623))

(declare-fun m!813625 () Bool)

(assert (=> b!873847 m!813625))

(declare-fun m!813627 () Bool)

(assert (=> mapNonEmpty!27557 m!813627))

(declare-fun m!813629 () Bool)

(assert (=> start!74274 m!813629))

(declare-fun m!813631 () Bool)

(assert (=> start!74274 m!813631))

(check-sat b_and!24805 (not b_next!15055) (not mapNonEmpty!27557) (not b!873844) (not start!74274) (not b!873850) (not b!873852) tp_is_empty!17299 (not b!873848) (not b!873847))
(check-sat b_and!24805 (not b_next!15055))
