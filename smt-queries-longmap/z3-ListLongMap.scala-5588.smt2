; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73314 () Bool)

(assert start!73314)

(declare-fun b_free!14229 () Bool)

(declare-fun b_next!14229 () Bool)

(assert (=> start!73314 (= b_free!14229 (not b_next!14229))))

(declare-fun tp!50190 () Bool)

(declare-fun b_and!23585 () Bool)

(assert (=> start!73314 (= tp!50190 b_and!23585)))

(declare-fun b!855304 () Bool)

(declare-fun e!476861 () Bool)

(assert (=> b!855304 (= e!476861 false)))

(declare-datatypes ((V!26867 0))(
  ( (V!26868 (val!8230 Int)) )
))
(declare-fun v!557 () V!26867)

(declare-datatypes ((tuple2!10844 0))(
  ( (tuple2!10845 (_1!5433 (_ BitVec 64)) (_2!5433 V!26867)) )
))
(declare-datatypes ((List!16656 0))(
  ( (Nil!16653) (Cons!16652 (h!17783 tuple2!10844) (t!23297 List!16656)) )
))
(declare-datatypes ((ListLongMap!9613 0))(
  ( (ListLongMap!9614 (toList!4822 List!16656)) )
))
(declare-fun lt!385675 () ListLongMap!9613)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48926 0))(
  ( (array!48927 (arr!23494 (Array (_ BitVec 32) (_ BitVec 64))) (size!23934 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48926)

(declare-datatypes ((ValueCell!7743 0))(
  ( (ValueCellFull!7743 (v!10655 V!26867)) (EmptyCell!7743) )
))
(declare-datatypes ((array!48928 0))(
  ( (array!48929 (arr!23495 (Array (_ BitVec 32) ValueCell!7743)) (size!23935 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48928)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26867)

(declare-fun zeroValue!654 () V!26867)

(declare-fun getCurrentListMapNoExtraKeys!2803 (array!48926 array!48928 (_ BitVec 32) (_ BitVec 32) V!26867 V!26867 (_ BitVec 32) Int) ListLongMap!9613)

(assert (=> b!855304 (= lt!385675 (getCurrentListMapNoExtraKeys!2803 _keys!868 (array!48929 (store (arr!23495 _values!688) i!612 (ValueCellFull!7743 v!557)) (size!23935 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385674 () ListLongMap!9613)

(assert (=> b!855304 (= lt!385674 (getCurrentListMapNoExtraKeys!2803 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855305 () Bool)

(declare-fun e!476862 () Bool)

(declare-fun tp_is_empty!16365 () Bool)

(assert (=> b!855305 (= e!476862 tp_is_empty!16365)))

(declare-fun b!855306 () Bool)

(declare-fun e!476860 () Bool)

(assert (=> b!855306 (= e!476860 tp_is_empty!16365)))

(declare-fun b!855307 () Bool)

(declare-fun res!580864 () Bool)

(assert (=> b!855307 (=> (not res!580864) (not e!476861))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!855307 (= res!580864 (and (= (select (arr!23494 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855308 () Bool)

(declare-fun res!580858 () Bool)

(assert (=> b!855308 (=> (not res!580858) (not e!476861))))

(assert (=> b!855308 (= res!580858 (and (= (size!23935 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23934 _keys!868) (size!23935 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26147 () Bool)

(declare-fun mapRes!26147 () Bool)

(assert (=> mapIsEmpty!26147 mapRes!26147))

(declare-fun b!855309 () Bool)

(declare-fun res!580865 () Bool)

(assert (=> b!855309 (=> (not res!580865) (not e!476861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48926 (_ BitVec 32)) Bool)

(assert (=> b!855309 (= res!580865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855310 () Bool)

(declare-fun e!476863 () Bool)

(assert (=> b!855310 (= e!476863 (and e!476860 mapRes!26147))))

(declare-fun condMapEmpty!26147 () Bool)

(declare-fun mapDefault!26147 () ValueCell!7743)

(assert (=> b!855310 (= condMapEmpty!26147 (= (arr!23495 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7743)) mapDefault!26147)))))

(declare-fun b!855311 () Bool)

(declare-fun res!580862 () Bool)

(assert (=> b!855311 (=> (not res!580862) (not e!476861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855311 (= res!580862 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26147 () Bool)

(declare-fun tp!50191 () Bool)

(assert (=> mapNonEmpty!26147 (= mapRes!26147 (and tp!50191 e!476862))))

(declare-fun mapRest!26147 () (Array (_ BitVec 32) ValueCell!7743))

(declare-fun mapValue!26147 () ValueCell!7743)

(declare-fun mapKey!26147 () (_ BitVec 32))

(assert (=> mapNonEmpty!26147 (= (arr!23495 _values!688) (store mapRest!26147 mapKey!26147 mapValue!26147))))

(declare-fun b!855312 () Bool)

(declare-fun res!580860 () Bool)

(assert (=> b!855312 (=> (not res!580860) (not e!476861))))

(assert (=> b!855312 (= res!580860 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23934 _keys!868))))))

(declare-fun res!580863 () Bool)

(assert (=> start!73314 (=> (not res!580863) (not e!476861))))

(assert (=> start!73314 (= res!580863 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23934 _keys!868))))))

(assert (=> start!73314 e!476861))

(assert (=> start!73314 tp_is_empty!16365))

(assert (=> start!73314 true))

(assert (=> start!73314 tp!50190))

(declare-fun array_inv!18616 (array!48926) Bool)

(assert (=> start!73314 (array_inv!18616 _keys!868)))

(declare-fun array_inv!18617 (array!48928) Bool)

(assert (=> start!73314 (and (array_inv!18617 _values!688) e!476863)))

(declare-fun b!855313 () Bool)

(declare-fun res!580861 () Bool)

(assert (=> b!855313 (=> (not res!580861) (not e!476861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855313 (= res!580861 (validKeyInArray!0 k0!854))))

(declare-fun b!855314 () Bool)

(declare-fun res!580859 () Bool)

(assert (=> b!855314 (=> (not res!580859) (not e!476861))))

(declare-datatypes ((List!16657 0))(
  ( (Nil!16654) (Cons!16653 (h!17784 (_ BitVec 64)) (t!23298 List!16657)) )
))
(declare-fun arrayNoDuplicates!0 (array!48926 (_ BitVec 32) List!16657) Bool)

(assert (=> b!855314 (= res!580859 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16654))))

(assert (= (and start!73314 res!580863) b!855311))

(assert (= (and b!855311 res!580862) b!855308))

(assert (= (and b!855308 res!580858) b!855309))

(assert (= (and b!855309 res!580865) b!855314))

(assert (= (and b!855314 res!580859) b!855312))

(assert (= (and b!855312 res!580860) b!855313))

(assert (= (and b!855313 res!580861) b!855307))

(assert (= (and b!855307 res!580864) b!855304))

(assert (= (and b!855310 condMapEmpty!26147) mapIsEmpty!26147))

(assert (= (and b!855310 (not condMapEmpty!26147)) mapNonEmpty!26147))

(get-info :version)

(assert (= (and mapNonEmpty!26147 ((_ is ValueCellFull!7743) mapValue!26147)) b!855305))

(assert (= (and b!855310 ((_ is ValueCellFull!7743) mapDefault!26147)) b!855306))

(assert (= start!73314 b!855310))

(declare-fun m!796551 () Bool)

(assert (=> b!855311 m!796551))

(declare-fun m!796553 () Bool)

(assert (=> start!73314 m!796553))

(declare-fun m!796555 () Bool)

(assert (=> start!73314 m!796555))

(declare-fun m!796557 () Bool)

(assert (=> b!855304 m!796557))

(declare-fun m!796559 () Bool)

(assert (=> b!855304 m!796559))

(declare-fun m!796561 () Bool)

(assert (=> b!855304 m!796561))

(declare-fun m!796563 () Bool)

(assert (=> b!855313 m!796563))

(declare-fun m!796565 () Bool)

(assert (=> b!855314 m!796565))

(declare-fun m!796567 () Bool)

(assert (=> b!855307 m!796567))

(declare-fun m!796569 () Bool)

(assert (=> mapNonEmpty!26147 m!796569))

(declare-fun m!796571 () Bool)

(assert (=> b!855309 m!796571))

(check-sat (not b!855304) (not b!855313) (not b!855314) (not b!855311) tp_is_empty!16365 (not mapNonEmpty!26147) (not b!855309) (not start!73314) (not b_next!14229) b_and!23585)
(check-sat b_and!23585 (not b_next!14229))
