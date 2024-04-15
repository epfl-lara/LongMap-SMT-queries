; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74026 () Bool)

(assert start!74026)

(declare-fun b_free!14959 () Bool)

(declare-fun b_next!14959 () Bool)

(assert (=> start!74026 (= b_free!14959 (not b_next!14959))))

(declare-fun tp!52382 () Bool)

(declare-fun b_and!24685 () Bool)

(assert (=> start!74026 (= tp!52382 b_and!24685)))

(declare-fun b!870676 () Bool)

(declare-fun res!591855 () Bool)

(declare-fun e!484781 () Bool)

(assert (=> b!870676 (=> (not res!591855) (not e!484781))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50317 0))(
  ( (array!50318 (arr!24190 (Array (_ BitVec 32) (_ BitVec 64))) (size!24632 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50317)

(assert (=> b!870676 (= res!591855 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24632 _keys!868))))))

(declare-fun mapIsEmpty!27242 () Bool)

(declare-fun mapRes!27242 () Bool)

(assert (=> mapIsEmpty!27242 mapRes!27242))

(declare-fun b!870677 () Bool)

(declare-fun e!484783 () Bool)

(declare-fun tp_is_empty!17095 () Bool)

(assert (=> b!870677 (= e!484783 tp_is_empty!17095)))

(declare-fun b!870678 () Bool)

(declare-fun e!484785 () Bool)

(assert (=> b!870678 (= e!484781 e!484785)))

(declare-fun res!591856 () Bool)

(assert (=> b!870678 (=> (not res!591856) (not e!484785))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!870678 (= res!591856 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27841 0))(
  ( (V!27842 (val!8595 Int)) )
))
(declare-datatypes ((tuple2!11436 0))(
  ( (tuple2!11437 (_1!5729 (_ BitVec 64)) (_2!5729 V!27841)) )
))
(declare-datatypes ((List!17212 0))(
  ( (Nil!17209) (Cons!17208 (h!18339 tuple2!11436) (t!24240 List!17212)) )
))
(declare-datatypes ((ListLongMap!10195 0))(
  ( (ListLongMap!10196 (toList!5113 List!17212)) )
))
(declare-fun lt!395057 () ListLongMap!10195)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8108 0))(
  ( (ValueCellFull!8108 (v!11014 V!27841)) (EmptyCell!8108) )
))
(declare-datatypes ((array!50319 0))(
  ( (array!50320 (arr!24191 (Array (_ BitVec 32) ValueCell!8108)) (size!24633 (_ BitVec 32))) )
))
(declare-fun lt!395058 () array!50319)

(declare-fun minValue!654 () V!27841)

(declare-fun zeroValue!654 () V!27841)

(declare-fun getCurrentListMapNoExtraKeys!3106 (array!50317 array!50319 (_ BitVec 32) (_ BitVec 32) V!27841 V!27841 (_ BitVec 32) Int) ListLongMap!10195)

(assert (=> b!870678 (= lt!395057 (getCurrentListMapNoExtraKeys!3106 _keys!868 lt!395058 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27841)

(declare-fun _values!688 () array!50319)

(assert (=> b!870678 (= lt!395058 (array!50320 (store (arr!24191 _values!688) i!612 (ValueCellFull!8108 v!557)) (size!24633 _values!688)))))

(declare-fun lt!395060 () ListLongMap!10195)

(assert (=> b!870678 (= lt!395060 (getCurrentListMapNoExtraKeys!3106 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870679 () Bool)

(declare-fun e!484782 () Bool)

(assert (=> b!870679 (= e!484782 (and e!484783 mapRes!27242))))

(declare-fun condMapEmpty!27242 () Bool)

(declare-fun mapDefault!27242 () ValueCell!8108)

(assert (=> b!870679 (= condMapEmpty!27242 (= (arr!24191 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8108)) mapDefault!27242)))))

(declare-fun b!870681 () Bool)

(declare-fun res!591858 () Bool)

(assert (=> b!870681 (=> (not res!591858) (not e!484781))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870681 (= res!591858 (validKeyInArray!0 k0!854))))

(declare-fun b!870682 () Bool)

(declare-fun res!591850 () Bool)

(assert (=> b!870682 (=> (not res!591850) (not e!484781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870682 (= res!591850 (validMask!0 mask!1196))))

(declare-fun b!870683 () Bool)

(assert (=> b!870683 (= e!484785 (not true))))

(declare-fun +!2472 (ListLongMap!10195 tuple2!11436) ListLongMap!10195)

(assert (=> b!870683 (= (getCurrentListMapNoExtraKeys!3106 _keys!868 lt!395058 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2472 (getCurrentListMapNoExtraKeys!3106 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11437 k0!854 v!557)))))

(declare-datatypes ((Unit!29831 0))(
  ( (Unit!29832) )
))
(declare-fun lt!395059 () Unit!29831)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!640 (array!50317 array!50319 (_ BitVec 32) (_ BitVec 32) V!27841 V!27841 (_ BitVec 32) (_ BitVec 64) V!27841 (_ BitVec 32) Int) Unit!29831)

(assert (=> b!870683 (= lt!395059 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!640 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27242 () Bool)

(declare-fun tp!52381 () Bool)

(declare-fun e!484780 () Bool)

(assert (=> mapNonEmpty!27242 (= mapRes!27242 (and tp!52381 e!484780))))

(declare-fun mapKey!27242 () (_ BitVec 32))

(declare-fun mapValue!27242 () ValueCell!8108)

(declare-fun mapRest!27242 () (Array (_ BitVec 32) ValueCell!8108))

(assert (=> mapNonEmpty!27242 (= (arr!24191 _values!688) (store mapRest!27242 mapKey!27242 mapValue!27242))))

(declare-fun b!870684 () Bool)

(declare-fun res!591857 () Bool)

(assert (=> b!870684 (=> (not res!591857) (not e!484781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50317 (_ BitVec 32)) Bool)

(assert (=> b!870684 (= res!591857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870685 () Bool)

(assert (=> b!870685 (= e!484780 tp_is_empty!17095)))

(declare-fun b!870686 () Bool)

(declare-fun res!591851 () Bool)

(assert (=> b!870686 (=> (not res!591851) (not e!484781))))

(assert (=> b!870686 (= res!591851 (and (= (size!24633 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24632 _keys!868) (size!24633 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870687 () Bool)

(declare-fun res!591854 () Bool)

(assert (=> b!870687 (=> (not res!591854) (not e!484781))))

(declare-datatypes ((List!17213 0))(
  ( (Nil!17210) (Cons!17209 (h!18340 (_ BitVec 64)) (t!24241 List!17213)) )
))
(declare-fun arrayNoDuplicates!0 (array!50317 (_ BitVec 32) List!17213) Bool)

(assert (=> b!870687 (= res!591854 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17210))))

(declare-fun b!870680 () Bool)

(declare-fun res!591852 () Bool)

(assert (=> b!870680 (=> (not res!591852) (not e!484781))))

(assert (=> b!870680 (= res!591852 (and (= (select (arr!24190 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!591853 () Bool)

(assert (=> start!74026 (=> (not res!591853) (not e!484781))))

(assert (=> start!74026 (= res!591853 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24632 _keys!868))))))

(assert (=> start!74026 e!484781))

(assert (=> start!74026 tp_is_empty!17095))

(assert (=> start!74026 true))

(assert (=> start!74026 tp!52382))

(declare-fun array_inv!19160 (array!50317) Bool)

(assert (=> start!74026 (array_inv!19160 _keys!868)))

(declare-fun array_inv!19161 (array!50319) Bool)

(assert (=> start!74026 (and (array_inv!19161 _values!688) e!484782)))

(assert (= (and start!74026 res!591853) b!870682))

(assert (= (and b!870682 res!591850) b!870686))

(assert (= (and b!870686 res!591851) b!870684))

(assert (= (and b!870684 res!591857) b!870687))

(assert (= (and b!870687 res!591854) b!870676))

(assert (= (and b!870676 res!591855) b!870681))

(assert (= (and b!870681 res!591858) b!870680))

(assert (= (and b!870680 res!591852) b!870678))

(assert (= (and b!870678 res!591856) b!870683))

(assert (= (and b!870679 condMapEmpty!27242) mapIsEmpty!27242))

(assert (= (and b!870679 (not condMapEmpty!27242)) mapNonEmpty!27242))

(get-info :version)

(assert (= (and mapNonEmpty!27242 ((_ is ValueCellFull!8108) mapValue!27242)) b!870685))

(assert (= (and b!870679 ((_ is ValueCellFull!8108) mapDefault!27242)) b!870677))

(assert (= start!74026 b!870679))

(declare-fun m!811449 () Bool)

(assert (=> start!74026 m!811449))

(declare-fun m!811451 () Bool)

(assert (=> start!74026 m!811451))

(declare-fun m!811453 () Bool)

(assert (=> mapNonEmpty!27242 m!811453))

(declare-fun m!811455 () Bool)

(assert (=> b!870687 m!811455))

(declare-fun m!811457 () Bool)

(assert (=> b!870680 m!811457))

(declare-fun m!811459 () Bool)

(assert (=> b!870681 m!811459))

(declare-fun m!811461 () Bool)

(assert (=> b!870678 m!811461))

(declare-fun m!811463 () Bool)

(assert (=> b!870678 m!811463))

(declare-fun m!811465 () Bool)

(assert (=> b!870678 m!811465))

(declare-fun m!811467 () Bool)

(assert (=> b!870683 m!811467))

(declare-fun m!811469 () Bool)

(assert (=> b!870683 m!811469))

(assert (=> b!870683 m!811469))

(declare-fun m!811471 () Bool)

(assert (=> b!870683 m!811471))

(declare-fun m!811473 () Bool)

(assert (=> b!870683 m!811473))

(declare-fun m!811475 () Bool)

(assert (=> b!870682 m!811475))

(declare-fun m!811477 () Bool)

(assert (=> b!870684 m!811477))

(check-sat (not b!870684) (not mapNonEmpty!27242) (not b!870678) (not b!870687) tp_is_empty!17095 (not b!870682) (not b_next!14959) (not b!870681) (not start!74026) b_and!24685 (not b!870683))
(check-sat b_and!24685 (not b_next!14959))
