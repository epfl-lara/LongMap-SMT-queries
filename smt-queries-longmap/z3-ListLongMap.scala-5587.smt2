; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73474 () Bool)

(assert start!73474)

(declare-fun b_free!14221 () Bool)

(declare-fun b_next!14221 () Bool)

(assert (=> start!73474 (= b_free!14221 (not b_next!14221))))

(declare-fun tp!50168 () Bool)

(declare-fun b_and!23587 () Bool)

(assert (=> start!73474 (= tp!50168 b_and!23587)))

(declare-fun b!856075 () Bool)

(declare-fun res!581113 () Bool)

(declare-fun e!477385 () Bool)

(assert (=> b!856075 (=> (not res!581113) (not e!477385))))

(declare-datatypes ((array!48957 0))(
  ( (array!48958 (arr!23505 (Array (_ BitVec 32) (_ BitVec 64))) (size!23946 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48957)

(declare-datatypes ((List!16604 0))(
  ( (Nil!16601) (Cons!16600 (h!17737 (_ BitVec 64)) (t!23237 List!16604)) )
))
(declare-fun arrayNoDuplicates!0 (array!48957 (_ BitVec 32) List!16604) Bool)

(assert (=> b!856075 (= res!581113 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16601))))

(declare-fun b!856076 () Bool)

(declare-fun e!477384 () Bool)

(declare-fun tp_is_empty!16357 () Bool)

(assert (=> b!856076 (= e!477384 tp_is_empty!16357)))

(declare-fun b!856077 () Bool)

(declare-fun e!477382 () Bool)

(assert (=> b!856077 (= e!477382 tp_is_empty!16357)))

(declare-fun b!856078 () Bool)

(declare-fun e!477383 () Bool)

(declare-fun mapRes!26135 () Bool)

(assert (=> b!856078 (= e!477383 (and e!477384 mapRes!26135))))

(declare-fun condMapEmpty!26135 () Bool)

(declare-datatypes ((V!26857 0))(
  ( (V!26858 (val!8226 Int)) )
))
(declare-datatypes ((ValueCell!7739 0))(
  ( (ValueCellFull!7739 (v!10651 V!26857)) (EmptyCell!7739) )
))
(declare-datatypes ((array!48959 0))(
  ( (array!48960 (arr!23506 (Array (_ BitVec 32) ValueCell!7739)) (size!23947 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48959)

(declare-fun mapDefault!26135 () ValueCell!7739)

(assert (=> b!856078 (= condMapEmpty!26135 (= (arr!23506 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7739)) mapDefault!26135)))))

(declare-fun mapNonEmpty!26135 () Bool)

(declare-fun tp!50167 () Bool)

(assert (=> mapNonEmpty!26135 (= mapRes!26135 (and tp!50167 e!477382))))

(declare-fun mapValue!26135 () ValueCell!7739)

(declare-fun mapKey!26135 () (_ BitVec 32))

(declare-fun mapRest!26135 () (Array (_ BitVec 32) ValueCell!7739))

(assert (=> mapNonEmpty!26135 (= (arr!23506 _values!688) (store mapRest!26135 mapKey!26135 mapValue!26135))))

(declare-fun b!856079 () Bool)

(declare-fun res!581106 () Bool)

(assert (=> b!856079 (=> (not res!581106) (not e!477385))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856079 (= res!581106 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23946 _keys!868))))))

(declare-fun b!856080 () Bool)

(declare-fun res!581111 () Bool)

(assert (=> b!856080 (=> (not res!581111) (not e!477385))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856080 (= res!581111 (and (= (select (arr!23505 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856081 () Bool)

(assert (=> b!856081 (= e!477385 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26857)

(declare-fun zeroValue!654 () V!26857)

(declare-fun v!557 () V!26857)

(declare-datatypes ((tuple2!10760 0))(
  ( (tuple2!10761 (_1!5391 (_ BitVec 64)) (_2!5391 V!26857)) )
))
(declare-datatypes ((List!16605 0))(
  ( (Nil!16602) (Cons!16601 (h!17738 tuple2!10760) (t!23238 List!16605)) )
))
(declare-datatypes ((ListLongMap!9531 0))(
  ( (ListLongMap!9532 (toList!4781 List!16605)) )
))
(declare-fun lt!386011 () ListLongMap!9531)

(declare-fun getCurrentListMapNoExtraKeys!2837 (array!48957 array!48959 (_ BitVec 32) (_ BitVec 32) V!26857 V!26857 (_ BitVec 32) Int) ListLongMap!9531)

(assert (=> b!856081 (= lt!386011 (getCurrentListMapNoExtraKeys!2837 _keys!868 (array!48960 (store (arr!23506 _values!688) i!612 (ValueCellFull!7739 v!557)) (size!23947 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!386012 () ListLongMap!9531)

(assert (=> b!856081 (= lt!386012 (getCurrentListMapNoExtraKeys!2837 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!581109 () Bool)

(assert (=> start!73474 (=> (not res!581109) (not e!477385))))

(assert (=> start!73474 (= res!581109 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23946 _keys!868))))))

(assert (=> start!73474 e!477385))

(assert (=> start!73474 tp_is_empty!16357))

(assert (=> start!73474 true))

(assert (=> start!73474 tp!50168))

(declare-fun array_inv!18674 (array!48957) Bool)

(assert (=> start!73474 (array_inv!18674 _keys!868)))

(declare-fun array_inv!18675 (array!48959) Bool)

(assert (=> start!73474 (and (array_inv!18675 _values!688) e!477383)))

(declare-fun b!856082 () Bool)

(declare-fun res!581110 () Bool)

(assert (=> b!856082 (=> (not res!581110) (not e!477385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856082 (= res!581110 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26135 () Bool)

(assert (=> mapIsEmpty!26135 mapRes!26135))

(declare-fun b!856083 () Bool)

(declare-fun res!581108 () Bool)

(assert (=> b!856083 (=> (not res!581108) (not e!477385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856083 (= res!581108 (validKeyInArray!0 k0!854))))

(declare-fun b!856084 () Bool)

(declare-fun res!581107 () Bool)

(assert (=> b!856084 (=> (not res!581107) (not e!477385))))

(assert (=> b!856084 (= res!581107 (and (= (size!23947 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23946 _keys!868) (size!23947 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856085 () Bool)

(declare-fun res!581112 () Bool)

(assert (=> b!856085 (=> (not res!581112) (not e!477385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48957 (_ BitVec 32)) Bool)

(assert (=> b!856085 (= res!581112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73474 res!581109) b!856082))

(assert (= (and b!856082 res!581110) b!856084))

(assert (= (and b!856084 res!581107) b!856085))

(assert (= (and b!856085 res!581112) b!856075))

(assert (= (and b!856075 res!581113) b!856079))

(assert (= (and b!856079 res!581106) b!856083))

(assert (= (and b!856083 res!581108) b!856080))

(assert (= (and b!856080 res!581111) b!856081))

(assert (= (and b!856078 condMapEmpty!26135) mapIsEmpty!26135))

(assert (= (and b!856078 (not condMapEmpty!26135)) mapNonEmpty!26135))

(get-info :version)

(assert (= (and mapNonEmpty!26135 ((_ is ValueCellFull!7739) mapValue!26135)) b!856077))

(assert (= (and b!856078 ((_ is ValueCellFull!7739) mapDefault!26135)) b!856076))

(assert (= start!73474 b!856078))

(declare-fun m!797753 () Bool)

(assert (=> mapNonEmpty!26135 m!797753))

(declare-fun m!797755 () Bool)

(assert (=> b!856075 m!797755))

(declare-fun m!797757 () Bool)

(assert (=> start!73474 m!797757))

(declare-fun m!797759 () Bool)

(assert (=> start!73474 m!797759))

(declare-fun m!797761 () Bool)

(assert (=> b!856083 m!797761))

(declare-fun m!797763 () Bool)

(assert (=> b!856085 m!797763))

(declare-fun m!797765 () Bool)

(assert (=> b!856082 m!797765))

(declare-fun m!797767 () Bool)

(assert (=> b!856081 m!797767))

(declare-fun m!797769 () Bool)

(assert (=> b!856081 m!797769))

(declare-fun m!797771 () Bool)

(assert (=> b!856081 m!797771))

(declare-fun m!797773 () Bool)

(assert (=> b!856080 m!797773))

(check-sat b_and!23587 tp_is_empty!16357 (not b!856081) (not b!856082) (not mapNonEmpty!26135) (not b!856083) (not b!856085) (not b_next!14221) (not b!856075) (not start!73474))
(check-sat b_and!23587 (not b_next!14221))
