; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73308 () Bool)

(assert start!73308)

(declare-fun b_free!14223 () Bool)

(declare-fun b_next!14223 () Bool)

(assert (=> start!73308 (= b_free!14223 (not b_next!14223))))

(declare-fun tp!50173 () Bool)

(declare-fun b_and!23579 () Bool)

(assert (=> start!73308 (= tp!50173 b_and!23579)))

(declare-fun b!855205 () Bool)

(declare-fun res!580786 () Bool)

(declare-fun e!476814 () Bool)

(assert (=> b!855205 (=> (not res!580786) (not e!476814))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48914 0))(
  ( (array!48915 (arr!23488 (Array (_ BitVec 32) (_ BitVec 64))) (size!23928 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48914)

(assert (=> b!855205 (= res!580786 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23928 _keys!868))))))

(declare-fun b!855206 () Bool)

(assert (=> b!855206 (= e!476814 false)))

(declare-datatypes ((V!26859 0))(
  ( (V!26860 (val!8227 Int)) )
))
(declare-fun v!557 () V!26859)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10840 0))(
  ( (tuple2!10841 (_1!5431 (_ BitVec 64)) (_2!5431 V!26859)) )
))
(declare-datatypes ((List!16652 0))(
  ( (Nil!16649) (Cons!16648 (h!17779 tuple2!10840) (t!23293 List!16652)) )
))
(declare-datatypes ((ListLongMap!9609 0))(
  ( (ListLongMap!9610 (toList!4820 List!16652)) )
))
(declare-fun lt!385656 () ListLongMap!9609)

(declare-datatypes ((ValueCell!7740 0))(
  ( (ValueCellFull!7740 (v!10652 V!26859)) (EmptyCell!7740) )
))
(declare-datatypes ((array!48916 0))(
  ( (array!48917 (arr!23489 (Array (_ BitVec 32) ValueCell!7740)) (size!23929 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48916)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26859)

(declare-fun zeroValue!654 () V!26859)

(declare-fun getCurrentListMapNoExtraKeys!2801 (array!48914 array!48916 (_ BitVec 32) (_ BitVec 32) V!26859 V!26859 (_ BitVec 32) Int) ListLongMap!9609)

(assert (=> b!855206 (= lt!385656 (getCurrentListMapNoExtraKeys!2801 _keys!868 (array!48917 (store (arr!23489 _values!688) i!612 (ValueCellFull!7740 v!557)) (size!23929 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385657 () ListLongMap!9609)

(assert (=> b!855206 (= lt!385657 (getCurrentListMapNoExtraKeys!2801 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26138 () Bool)

(declare-fun mapRes!26138 () Bool)

(declare-fun tp!50172 () Bool)

(declare-fun e!476817 () Bool)

(assert (=> mapNonEmpty!26138 (= mapRes!26138 (and tp!50172 e!476817))))

(declare-fun mapRest!26138 () (Array (_ BitVec 32) ValueCell!7740))

(declare-fun mapKey!26138 () (_ BitVec 32))

(declare-fun mapValue!26138 () ValueCell!7740)

(assert (=> mapNonEmpty!26138 (= (arr!23489 _values!688) (store mapRest!26138 mapKey!26138 mapValue!26138))))

(declare-fun res!580793 () Bool)

(assert (=> start!73308 (=> (not res!580793) (not e!476814))))

(assert (=> start!73308 (= res!580793 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23928 _keys!868))))))

(assert (=> start!73308 e!476814))

(declare-fun tp_is_empty!16359 () Bool)

(assert (=> start!73308 tp_is_empty!16359))

(assert (=> start!73308 true))

(assert (=> start!73308 tp!50173))

(declare-fun array_inv!18612 (array!48914) Bool)

(assert (=> start!73308 (array_inv!18612 _keys!868)))

(declare-fun e!476816 () Bool)

(declare-fun array_inv!18613 (array!48916) Bool)

(assert (=> start!73308 (and (array_inv!18613 _values!688) e!476816)))

(declare-fun b!855207 () Bool)

(declare-fun e!476815 () Bool)

(assert (=> b!855207 (= e!476816 (and e!476815 mapRes!26138))))

(declare-fun condMapEmpty!26138 () Bool)

(declare-fun mapDefault!26138 () ValueCell!7740)

(assert (=> b!855207 (= condMapEmpty!26138 (= (arr!23489 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7740)) mapDefault!26138)))))

(declare-fun b!855208 () Bool)

(declare-fun res!580788 () Bool)

(assert (=> b!855208 (=> (not res!580788) (not e!476814))))

(declare-datatypes ((List!16653 0))(
  ( (Nil!16650) (Cons!16649 (h!17780 (_ BitVec 64)) (t!23294 List!16653)) )
))
(declare-fun arrayNoDuplicates!0 (array!48914 (_ BitVec 32) List!16653) Bool)

(assert (=> b!855208 (= res!580788 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16650))))

(declare-fun b!855209 () Bool)

(assert (=> b!855209 (= e!476815 tp_is_empty!16359)))

(declare-fun mapIsEmpty!26138 () Bool)

(assert (=> mapIsEmpty!26138 mapRes!26138))

(declare-fun b!855210 () Bool)

(declare-fun res!580789 () Bool)

(assert (=> b!855210 (=> (not res!580789) (not e!476814))))

(assert (=> b!855210 (= res!580789 (and (= (size!23929 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23928 _keys!868) (size!23929 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855211 () Bool)

(declare-fun res!580787 () Bool)

(assert (=> b!855211 (=> (not res!580787) (not e!476814))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855211 (= res!580787 (validKeyInArray!0 k0!854))))

(declare-fun b!855212 () Bool)

(assert (=> b!855212 (= e!476817 tp_is_empty!16359)))

(declare-fun b!855213 () Bool)

(declare-fun res!580790 () Bool)

(assert (=> b!855213 (=> (not res!580790) (not e!476814))))

(assert (=> b!855213 (= res!580790 (and (= (select (arr!23488 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855214 () Bool)

(declare-fun res!580791 () Bool)

(assert (=> b!855214 (=> (not res!580791) (not e!476814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48914 (_ BitVec 32)) Bool)

(assert (=> b!855214 (= res!580791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855215 () Bool)

(declare-fun res!580792 () Bool)

(assert (=> b!855215 (=> (not res!580792) (not e!476814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855215 (= res!580792 (validMask!0 mask!1196))))

(assert (= (and start!73308 res!580793) b!855215))

(assert (= (and b!855215 res!580792) b!855210))

(assert (= (and b!855210 res!580789) b!855214))

(assert (= (and b!855214 res!580791) b!855208))

(assert (= (and b!855208 res!580788) b!855205))

(assert (= (and b!855205 res!580786) b!855211))

(assert (= (and b!855211 res!580787) b!855213))

(assert (= (and b!855213 res!580790) b!855206))

(assert (= (and b!855207 condMapEmpty!26138) mapIsEmpty!26138))

(assert (= (and b!855207 (not condMapEmpty!26138)) mapNonEmpty!26138))

(get-info :version)

(assert (= (and mapNonEmpty!26138 ((_ is ValueCellFull!7740) mapValue!26138)) b!855212))

(assert (= (and b!855207 ((_ is ValueCellFull!7740) mapDefault!26138)) b!855209))

(assert (= start!73308 b!855207))

(declare-fun m!796485 () Bool)

(assert (=> b!855208 m!796485))

(declare-fun m!796487 () Bool)

(assert (=> b!855206 m!796487))

(declare-fun m!796489 () Bool)

(assert (=> b!855206 m!796489))

(declare-fun m!796491 () Bool)

(assert (=> b!855206 m!796491))

(declare-fun m!796493 () Bool)

(assert (=> b!855213 m!796493))

(declare-fun m!796495 () Bool)

(assert (=> mapNonEmpty!26138 m!796495))

(declare-fun m!796497 () Bool)

(assert (=> b!855214 m!796497))

(declare-fun m!796499 () Bool)

(assert (=> b!855211 m!796499))

(declare-fun m!796501 () Bool)

(assert (=> b!855215 m!796501))

(declare-fun m!796503 () Bool)

(assert (=> start!73308 m!796503))

(declare-fun m!796505 () Bool)

(assert (=> start!73308 m!796505))

(check-sat (not start!73308) (not b!855211) (not b!855206) (not mapNonEmpty!26138) (not b!855214) tp_is_empty!16359 b_and!23579 (not b!855215) (not b_next!14223) (not b!855208))
(check-sat b_and!23579 (not b_next!14223))
