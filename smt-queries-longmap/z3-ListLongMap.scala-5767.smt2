; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74486 () Bool)

(assert start!74486)

(declare-fun b_free!15193 () Bool)

(declare-fun b_next!15193 () Bool)

(assert (=> start!74486 (= b_free!15193 (not b_next!15193))))

(declare-fun tp!53262 () Bool)

(declare-fun b_and!25043 () Bool)

(assert (=> start!74486 (= tp!53262 b_and!25043)))

(declare-fun b!877281 () Bool)

(declare-fun res!596005 () Bool)

(declare-fun e!488335 () Bool)

(assert (=> b!877281 (=> (not res!596005) (not e!488335))))

(declare-datatypes ((array!50981 0))(
  ( (array!50982 (arr!24517 (Array (_ BitVec 32) (_ BitVec 64))) (size!24959 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50981)

(declare-datatypes ((List!17407 0))(
  ( (Nil!17404) (Cons!17403 (h!18534 (_ BitVec 64)) (t!24487 List!17407)) )
))
(declare-fun arrayNoDuplicates!0 (array!50981 (_ BitVec 32) List!17407) Bool)

(assert (=> b!877281 (= res!596005 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17404))))

(declare-fun b!877282 () Bool)

(declare-fun res!596007 () Bool)

(assert (=> b!877282 (=> (not res!596007) (not e!488335))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!877282 (= res!596007 (and (= (select (arr!24517 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877283 () Bool)

(declare-fun res!596009 () Bool)

(assert (=> b!877283 (=> (not res!596009) (not e!488335))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28297 0))(
  ( (V!28298 (val!8766 Int)) )
))
(declare-datatypes ((ValueCell!8279 0))(
  ( (ValueCellFull!8279 (v!11200 V!28297)) (EmptyCell!8279) )
))
(declare-datatypes ((array!50983 0))(
  ( (array!50984 (arr!24518 (Array (_ BitVec 32) ValueCell!8279)) (size!24960 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50983)

(assert (=> b!877283 (= res!596009 (and (= (size!24960 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24959 _keys!868) (size!24960 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877284 () Bool)

(declare-fun res!596003 () Bool)

(assert (=> b!877284 (=> (not res!596003) (not e!488335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50981 (_ BitVec 32)) Bool)

(assert (=> b!877284 (= res!596003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877285 () Bool)

(declare-fun e!488333 () Bool)

(declare-fun tp_is_empty!17437 () Bool)

(assert (=> b!877285 (= e!488333 tp_is_empty!17437)))

(declare-fun res!596006 () Bool)

(assert (=> start!74486 (=> (not res!596006) (not e!488335))))

(assert (=> start!74486 (= res!596006 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24959 _keys!868))))))

(assert (=> start!74486 e!488335))

(assert (=> start!74486 tp_is_empty!17437))

(assert (=> start!74486 true))

(assert (=> start!74486 tp!53262))

(declare-fun array_inv!19366 (array!50981) Bool)

(assert (=> start!74486 (array_inv!19366 _keys!868)))

(declare-fun e!488337 () Bool)

(declare-fun array_inv!19367 (array!50983) Bool)

(assert (=> start!74486 (and (array_inv!19367 _values!688) e!488337)))

(declare-fun b!877286 () Bool)

(declare-fun e!488334 () Bool)

(assert (=> b!877286 (= e!488334 tp_is_empty!17437)))

(declare-fun b!877287 () Bool)

(declare-fun mapRes!27771 () Bool)

(assert (=> b!877287 (= e!488337 (and e!488334 mapRes!27771))))

(declare-fun condMapEmpty!27771 () Bool)

(declare-fun mapDefault!27771 () ValueCell!8279)

(assert (=> b!877287 (= condMapEmpty!27771 (= (arr!24518 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8279)) mapDefault!27771)))))

(declare-fun mapNonEmpty!27771 () Bool)

(declare-fun tp!53261 () Bool)

(assert (=> mapNonEmpty!27771 (= mapRes!27771 (and tp!53261 e!488333))))

(declare-fun mapRest!27771 () (Array (_ BitVec 32) ValueCell!8279))

(declare-fun mapValue!27771 () ValueCell!8279)

(declare-fun mapKey!27771 () (_ BitVec 32))

(assert (=> mapNonEmpty!27771 (= (arr!24518 _values!688) (store mapRest!27771 mapKey!27771 mapValue!27771))))

(declare-fun b!877288 () Bool)

(declare-fun res!596008 () Bool)

(assert (=> b!877288 (=> (not res!596008) (not e!488335))))

(assert (=> b!877288 (= res!596008 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24959 _keys!868))))))

(declare-fun b!877289 () Bool)

(declare-fun res!596010 () Bool)

(assert (=> b!877289 (=> (not res!596010) (not e!488335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877289 (= res!596010 (validKeyInArray!0 k0!854))))

(declare-fun b!877290 () Bool)

(assert (=> b!877290 (= e!488335 false)))

(declare-datatypes ((tuple2!11604 0))(
  ( (tuple2!11605 (_1!5813 (_ BitVec 64)) (_2!5813 V!28297)) )
))
(declare-datatypes ((List!17408 0))(
  ( (Nil!17405) (Cons!17404 (h!18535 tuple2!11604) (t!24488 List!17408)) )
))
(declare-datatypes ((ListLongMap!10363 0))(
  ( (ListLongMap!10364 (toList!5197 List!17408)) )
))
(declare-fun lt!396852 () ListLongMap!10363)

(declare-fun v!557 () V!28297)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28297)

(declare-fun zeroValue!654 () V!28297)

(declare-fun getCurrentListMapNoExtraKeys!3190 (array!50981 array!50983 (_ BitVec 32) (_ BitVec 32) V!28297 V!28297 (_ BitVec 32) Int) ListLongMap!10363)

(assert (=> b!877290 (= lt!396852 (getCurrentListMapNoExtraKeys!3190 _keys!868 (array!50984 (store (arr!24518 _values!688) i!612 (ValueCellFull!8279 v!557)) (size!24960 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396853 () ListLongMap!10363)

(assert (=> b!877290 (= lt!396853 (getCurrentListMapNoExtraKeys!3190 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877291 () Bool)

(declare-fun res!596004 () Bool)

(assert (=> b!877291 (=> (not res!596004) (not e!488335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877291 (= res!596004 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27771 () Bool)

(assert (=> mapIsEmpty!27771 mapRes!27771))

(assert (= (and start!74486 res!596006) b!877291))

(assert (= (and b!877291 res!596004) b!877283))

(assert (= (and b!877283 res!596009) b!877284))

(assert (= (and b!877284 res!596003) b!877281))

(assert (= (and b!877281 res!596005) b!877288))

(assert (= (and b!877288 res!596008) b!877289))

(assert (= (and b!877289 res!596010) b!877282))

(assert (= (and b!877282 res!596007) b!877290))

(assert (= (and b!877287 condMapEmpty!27771) mapIsEmpty!27771))

(assert (= (and b!877287 (not condMapEmpty!27771)) mapNonEmpty!27771))

(get-info :version)

(assert (= (and mapNonEmpty!27771 ((_ is ValueCellFull!8279) mapValue!27771)) b!877285))

(assert (= (and b!877287 ((_ is ValueCellFull!8279) mapDefault!27771)) b!877286))

(assert (= start!74486 b!877287))

(declare-fun m!816939 () Bool)

(assert (=> b!877284 m!816939))

(declare-fun m!816941 () Bool)

(assert (=> mapNonEmpty!27771 m!816941))

(declare-fun m!816943 () Bool)

(assert (=> b!877282 m!816943))

(declare-fun m!816945 () Bool)

(assert (=> b!877289 m!816945))

(declare-fun m!816947 () Bool)

(assert (=> b!877281 m!816947))

(declare-fun m!816949 () Bool)

(assert (=> b!877290 m!816949))

(declare-fun m!816951 () Bool)

(assert (=> b!877290 m!816951))

(declare-fun m!816953 () Bool)

(assert (=> b!877290 m!816953))

(declare-fun m!816955 () Bool)

(assert (=> start!74486 m!816955))

(declare-fun m!816957 () Bool)

(assert (=> start!74486 m!816957))

(declare-fun m!816959 () Bool)

(assert (=> b!877291 m!816959))

(check-sat b_and!25043 (not b!877289) (not mapNonEmpty!27771) (not b!877290) (not b_next!15193) (not b!877281) (not start!74486) (not b!877284) (not b!877291) tp_is_empty!17437)
(check-sat b_and!25043 (not b_next!15193))
