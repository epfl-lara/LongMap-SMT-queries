; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73302 () Bool)

(assert start!73302)

(declare-fun b_free!14217 () Bool)

(declare-fun b_next!14217 () Bool)

(assert (=> start!73302 (= b_free!14217 (not b_next!14217))))

(declare-fun tp!50154 () Bool)

(declare-fun b_and!23573 () Bool)

(assert (=> start!73302 (= tp!50154 b_and!23573)))

(declare-fun b!855106 () Bool)

(declare-fun res!580719 () Bool)

(declare-fun e!476769 () Bool)

(assert (=> b!855106 (=> (not res!580719) (not e!476769))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48902 0))(
  ( (array!48903 (arr!23482 (Array (_ BitVec 32) (_ BitVec 64))) (size!23922 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48902)

(declare-datatypes ((V!26851 0))(
  ( (V!26852 (val!8224 Int)) )
))
(declare-datatypes ((ValueCell!7737 0))(
  ( (ValueCellFull!7737 (v!10649 V!26851)) (EmptyCell!7737) )
))
(declare-datatypes ((array!48904 0))(
  ( (array!48905 (arr!23483 (Array (_ BitVec 32) ValueCell!7737)) (size!23923 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48904)

(assert (=> b!855106 (= res!580719 (and (= (size!23923 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23922 _keys!868) (size!23923 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855107 () Bool)

(declare-fun e!476770 () Bool)

(declare-fun e!476772 () Bool)

(declare-fun mapRes!26129 () Bool)

(assert (=> b!855107 (= e!476770 (and e!476772 mapRes!26129))))

(declare-fun condMapEmpty!26129 () Bool)

(declare-fun mapDefault!26129 () ValueCell!7737)

(assert (=> b!855107 (= condMapEmpty!26129 (= (arr!23483 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7737)) mapDefault!26129)))))

(declare-fun b!855108 () Bool)

(declare-fun e!476773 () Bool)

(declare-fun tp_is_empty!16353 () Bool)

(assert (=> b!855108 (= e!476773 tp_is_empty!16353)))

(declare-fun b!855109 () Bool)

(declare-fun res!580714 () Bool)

(assert (=> b!855109 (=> (not res!580714) (not e!476769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48902 (_ BitVec 32)) Bool)

(assert (=> b!855109 (= res!580714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855110 () Bool)

(declare-fun res!580720 () Bool)

(assert (=> b!855110 (=> (not res!580720) (not e!476769))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855110 (= res!580720 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23922 _keys!868))))))

(declare-fun b!855111 () Bool)

(declare-fun res!580715 () Bool)

(assert (=> b!855111 (=> (not res!580715) (not e!476769))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855111 (= res!580715 (and (= (select (arr!23482 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855112 () Bool)

(declare-fun res!580721 () Bool)

(assert (=> b!855112 (=> (not res!580721) (not e!476769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855112 (= res!580721 (validKeyInArray!0 k0!854))))

(declare-fun b!855113 () Bool)

(declare-fun res!580717 () Bool)

(assert (=> b!855113 (=> (not res!580717) (not e!476769))))

(declare-datatypes ((List!16648 0))(
  ( (Nil!16645) (Cons!16644 (h!17775 (_ BitVec 64)) (t!23289 List!16648)) )
))
(declare-fun arrayNoDuplicates!0 (array!48902 (_ BitVec 32) List!16648) Bool)

(assert (=> b!855113 (= res!580717 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16645))))

(declare-fun mapNonEmpty!26129 () Bool)

(declare-fun tp!50155 () Bool)

(assert (=> mapNonEmpty!26129 (= mapRes!26129 (and tp!50155 e!476773))))

(declare-fun mapValue!26129 () ValueCell!7737)

(declare-fun mapKey!26129 () (_ BitVec 32))

(declare-fun mapRest!26129 () (Array (_ BitVec 32) ValueCell!7737))

(assert (=> mapNonEmpty!26129 (= (arr!23483 _values!688) (store mapRest!26129 mapKey!26129 mapValue!26129))))

(declare-fun res!580716 () Bool)

(assert (=> start!73302 (=> (not res!580716) (not e!476769))))

(assert (=> start!73302 (= res!580716 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23922 _keys!868))))))

(assert (=> start!73302 e!476769))

(assert (=> start!73302 tp_is_empty!16353))

(assert (=> start!73302 true))

(assert (=> start!73302 tp!50154))

(declare-fun array_inv!18606 (array!48902) Bool)

(assert (=> start!73302 (array_inv!18606 _keys!868)))

(declare-fun array_inv!18607 (array!48904) Bool)

(assert (=> start!73302 (and (array_inv!18607 _values!688) e!476770)))

(declare-fun b!855114 () Bool)

(assert (=> b!855114 (= e!476769 false)))

(declare-fun v!557 () V!26851)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10834 0))(
  ( (tuple2!10835 (_1!5428 (_ BitVec 64)) (_2!5428 V!26851)) )
))
(declare-datatypes ((List!16649 0))(
  ( (Nil!16646) (Cons!16645 (h!17776 tuple2!10834) (t!23290 List!16649)) )
))
(declare-datatypes ((ListLongMap!9603 0))(
  ( (ListLongMap!9604 (toList!4817 List!16649)) )
))
(declare-fun lt!385638 () ListLongMap!9603)

(declare-fun minValue!654 () V!26851)

(declare-fun zeroValue!654 () V!26851)

(declare-fun getCurrentListMapNoExtraKeys!2798 (array!48902 array!48904 (_ BitVec 32) (_ BitVec 32) V!26851 V!26851 (_ BitVec 32) Int) ListLongMap!9603)

(assert (=> b!855114 (= lt!385638 (getCurrentListMapNoExtraKeys!2798 _keys!868 (array!48905 (store (arr!23483 _values!688) i!612 (ValueCellFull!7737 v!557)) (size!23923 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385639 () ListLongMap!9603)

(assert (=> b!855114 (= lt!385639 (getCurrentListMapNoExtraKeys!2798 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855115 () Bool)

(assert (=> b!855115 (= e!476772 tp_is_empty!16353)))

(declare-fun b!855116 () Bool)

(declare-fun res!580718 () Bool)

(assert (=> b!855116 (=> (not res!580718) (not e!476769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855116 (= res!580718 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26129 () Bool)

(assert (=> mapIsEmpty!26129 mapRes!26129))

(assert (= (and start!73302 res!580716) b!855116))

(assert (= (and b!855116 res!580718) b!855106))

(assert (= (and b!855106 res!580719) b!855109))

(assert (= (and b!855109 res!580714) b!855113))

(assert (= (and b!855113 res!580717) b!855110))

(assert (= (and b!855110 res!580720) b!855112))

(assert (= (and b!855112 res!580721) b!855111))

(assert (= (and b!855111 res!580715) b!855114))

(assert (= (and b!855107 condMapEmpty!26129) mapIsEmpty!26129))

(assert (= (and b!855107 (not condMapEmpty!26129)) mapNonEmpty!26129))

(get-info :version)

(assert (= (and mapNonEmpty!26129 ((_ is ValueCellFull!7737) mapValue!26129)) b!855108))

(assert (= (and b!855107 ((_ is ValueCellFull!7737) mapDefault!26129)) b!855115))

(assert (= start!73302 b!855107))

(declare-fun m!796419 () Bool)

(assert (=> b!855116 m!796419))

(declare-fun m!796421 () Bool)

(assert (=> mapNonEmpty!26129 m!796421))

(declare-fun m!796423 () Bool)

(assert (=> b!855109 m!796423))

(declare-fun m!796425 () Bool)

(assert (=> start!73302 m!796425))

(declare-fun m!796427 () Bool)

(assert (=> start!73302 m!796427))

(declare-fun m!796429 () Bool)

(assert (=> b!855114 m!796429))

(declare-fun m!796431 () Bool)

(assert (=> b!855114 m!796431))

(declare-fun m!796433 () Bool)

(assert (=> b!855114 m!796433))

(declare-fun m!796435 () Bool)

(assert (=> b!855111 m!796435))

(declare-fun m!796437 () Bool)

(assert (=> b!855112 m!796437))

(declare-fun m!796439 () Bool)

(assert (=> b!855113 m!796439))

(check-sat b_and!23573 (not b_next!14217) (not b!855113) (not b!855114) (not b!855109) (not mapNonEmpty!26129) (not b!855116) tp_is_empty!16353 (not b!855112) (not start!73302))
(check-sat b_and!23573 (not b_next!14217))
