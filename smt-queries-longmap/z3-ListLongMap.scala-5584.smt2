; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73290 () Bool)

(assert start!73290)

(declare-fun b_free!14205 () Bool)

(declare-fun b_next!14205 () Bool)

(assert (=> start!73290 (= b_free!14205 (not b_next!14205))))

(declare-fun tp!50119 () Bool)

(declare-fun b_and!23561 () Bool)

(assert (=> start!73290 (= tp!50119 b_and!23561)))

(declare-fun b!854908 () Bool)

(declare-fun res!580574 () Bool)

(declare-fun e!476682 () Bool)

(assert (=> b!854908 (=> (not res!580574) (not e!476682))))

(declare-datatypes ((array!48878 0))(
  ( (array!48879 (arr!23470 (Array (_ BitVec 32) (_ BitVec 64))) (size!23910 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48878)

(declare-datatypes ((List!16638 0))(
  ( (Nil!16635) (Cons!16634 (h!17765 (_ BitVec 64)) (t!23279 List!16638)) )
))
(declare-fun arrayNoDuplicates!0 (array!48878 (_ BitVec 32) List!16638) Bool)

(assert (=> b!854908 (= res!580574 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16635))))

(declare-fun b!854909 () Bool)

(declare-fun res!580577 () Bool)

(assert (=> b!854909 (=> (not res!580577) (not e!476682))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854909 (= res!580577 (validMask!0 mask!1196))))

(declare-fun b!854910 () Bool)

(declare-fun e!476683 () Bool)

(declare-fun tp_is_empty!16341 () Bool)

(assert (=> b!854910 (= e!476683 tp_is_empty!16341)))

(declare-fun b!854911 () Bool)

(declare-fun res!580575 () Bool)

(assert (=> b!854911 (=> (not res!580575) (not e!476682))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26835 0))(
  ( (V!26836 (val!8218 Int)) )
))
(declare-datatypes ((ValueCell!7731 0))(
  ( (ValueCellFull!7731 (v!10643 V!26835)) (EmptyCell!7731) )
))
(declare-datatypes ((array!48880 0))(
  ( (array!48881 (arr!23471 (Array (_ BitVec 32) ValueCell!7731)) (size!23911 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48880)

(assert (=> b!854911 (= res!580575 (and (= (size!23911 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23910 _keys!868) (size!23911 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854912 () Bool)

(declare-fun e!476681 () Bool)

(assert (=> b!854912 (= e!476681 tp_is_empty!16341)))

(declare-fun b!854913 () Bool)

(declare-fun res!580573 () Bool)

(assert (=> b!854913 (=> (not res!580573) (not e!476682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48878 (_ BitVec 32)) Bool)

(assert (=> b!854913 (= res!580573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854914 () Bool)

(declare-fun e!476680 () Bool)

(declare-fun mapRes!26111 () Bool)

(assert (=> b!854914 (= e!476680 (and e!476681 mapRes!26111))))

(declare-fun condMapEmpty!26111 () Bool)

(declare-fun mapDefault!26111 () ValueCell!7731)

(assert (=> b!854914 (= condMapEmpty!26111 (= (arr!23471 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7731)) mapDefault!26111)))))

(declare-fun b!854915 () Bool)

(assert (=> b!854915 (= e!476682 false)))

(declare-fun v!557 () V!26835)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26835)

(declare-fun zeroValue!654 () V!26835)

(declare-datatypes ((tuple2!10824 0))(
  ( (tuple2!10825 (_1!5423 (_ BitVec 64)) (_2!5423 V!26835)) )
))
(declare-datatypes ((List!16639 0))(
  ( (Nil!16636) (Cons!16635 (h!17766 tuple2!10824) (t!23280 List!16639)) )
))
(declare-datatypes ((ListLongMap!9593 0))(
  ( (ListLongMap!9594 (toList!4812 List!16639)) )
))
(declare-fun lt!385602 () ListLongMap!9593)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2793 (array!48878 array!48880 (_ BitVec 32) (_ BitVec 32) V!26835 V!26835 (_ BitVec 32) Int) ListLongMap!9593)

(assert (=> b!854915 (= lt!385602 (getCurrentListMapNoExtraKeys!2793 _keys!868 (array!48881 (store (arr!23471 _values!688) i!612 (ValueCellFull!7731 v!557)) (size!23911 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385603 () ListLongMap!9593)

(assert (=> b!854915 (= lt!385603 (getCurrentListMapNoExtraKeys!2793 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!580576 () Bool)

(assert (=> start!73290 (=> (not res!580576) (not e!476682))))

(assert (=> start!73290 (= res!580576 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23910 _keys!868))))))

(assert (=> start!73290 e!476682))

(assert (=> start!73290 tp_is_empty!16341))

(assert (=> start!73290 true))

(assert (=> start!73290 tp!50119))

(declare-fun array_inv!18596 (array!48878) Bool)

(assert (=> start!73290 (array_inv!18596 _keys!868)))

(declare-fun array_inv!18597 (array!48880) Bool)

(assert (=> start!73290 (and (array_inv!18597 _values!688) e!476680)))

(declare-fun mapNonEmpty!26111 () Bool)

(declare-fun tp!50118 () Bool)

(assert (=> mapNonEmpty!26111 (= mapRes!26111 (and tp!50118 e!476683))))

(declare-fun mapRest!26111 () (Array (_ BitVec 32) ValueCell!7731))

(declare-fun mapKey!26111 () (_ BitVec 32))

(declare-fun mapValue!26111 () ValueCell!7731)

(assert (=> mapNonEmpty!26111 (= (arr!23471 _values!688) (store mapRest!26111 mapKey!26111 mapValue!26111))))

(declare-fun b!854916 () Bool)

(declare-fun res!580572 () Bool)

(assert (=> b!854916 (=> (not res!580572) (not e!476682))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854916 (= res!580572 (validKeyInArray!0 k0!854))))

(declare-fun b!854917 () Bool)

(declare-fun res!580570 () Bool)

(assert (=> b!854917 (=> (not res!580570) (not e!476682))))

(assert (=> b!854917 (= res!580570 (and (= (select (arr!23470 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26111 () Bool)

(assert (=> mapIsEmpty!26111 mapRes!26111))

(declare-fun b!854918 () Bool)

(declare-fun res!580571 () Bool)

(assert (=> b!854918 (=> (not res!580571) (not e!476682))))

(assert (=> b!854918 (= res!580571 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23910 _keys!868))))))

(assert (= (and start!73290 res!580576) b!854909))

(assert (= (and b!854909 res!580577) b!854911))

(assert (= (and b!854911 res!580575) b!854913))

(assert (= (and b!854913 res!580573) b!854908))

(assert (= (and b!854908 res!580574) b!854918))

(assert (= (and b!854918 res!580571) b!854916))

(assert (= (and b!854916 res!580572) b!854917))

(assert (= (and b!854917 res!580570) b!854915))

(assert (= (and b!854914 condMapEmpty!26111) mapIsEmpty!26111))

(assert (= (and b!854914 (not condMapEmpty!26111)) mapNonEmpty!26111))

(get-info :version)

(assert (= (and mapNonEmpty!26111 ((_ is ValueCellFull!7731) mapValue!26111)) b!854910))

(assert (= (and b!854914 ((_ is ValueCellFull!7731) mapDefault!26111)) b!854912))

(assert (= start!73290 b!854914))

(declare-fun m!796287 () Bool)

(assert (=> b!854909 m!796287))

(declare-fun m!796289 () Bool)

(assert (=> b!854916 m!796289))

(declare-fun m!796291 () Bool)

(assert (=> mapNonEmpty!26111 m!796291))

(declare-fun m!796293 () Bool)

(assert (=> b!854908 m!796293))

(declare-fun m!796295 () Bool)

(assert (=> b!854915 m!796295))

(declare-fun m!796297 () Bool)

(assert (=> b!854915 m!796297))

(declare-fun m!796299 () Bool)

(assert (=> b!854915 m!796299))

(declare-fun m!796301 () Bool)

(assert (=> start!73290 m!796301))

(declare-fun m!796303 () Bool)

(assert (=> start!73290 m!796303))

(declare-fun m!796305 () Bool)

(assert (=> b!854917 m!796305))

(declare-fun m!796307 () Bool)

(assert (=> b!854913 m!796307))

(check-sat (not b!854915) (not mapNonEmpty!26111) (not b!854916) b_and!23561 (not start!73290) (not b!854909) (not b!854908) (not b!854913) (not b_next!14205) tp_is_empty!16341)
(check-sat b_and!23561 (not b_next!14205))
