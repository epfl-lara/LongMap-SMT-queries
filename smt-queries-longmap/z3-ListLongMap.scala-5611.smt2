; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73452 () Bool)

(assert start!73452)

(declare-fun b_free!14367 () Bool)

(declare-fun b_next!14367 () Bool)

(assert (=> start!73452 (= b_free!14367 (not b_next!14367))))

(declare-fun tp!50605 () Bool)

(declare-fun b_and!23723 () Bool)

(assert (=> start!73452 (= tp!50605 b_and!23723)))

(declare-fun b!857730 () Bool)

(declare-fun res!582663 () Bool)

(declare-fun e!478045 () Bool)

(assert (=> b!857730 (=> (not res!582663) (not e!478045))))

(declare-datatypes ((array!49196 0))(
  ( (array!49197 (arr!23629 (Array (_ BitVec 32) (_ BitVec 64))) (size!24069 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49196)

(declare-datatypes ((List!16758 0))(
  ( (Nil!16755) (Cons!16754 (h!17885 (_ BitVec 64)) (t!23399 List!16758)) )
))
(declare-fun arrayNoDuplicates!0 (array!49196 (_ BitVec 32) List!16758) Bool)

(assert (=> b!857730 (= res!582663 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16755))))

(declare-fun b!857731 () Bool)

(declare-fun res!582667 () Bool)

(assert (=> b!857731 (=> (not res!582667) (not e!478045))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49196 (_ BitVec 32)) Bool)

(assert (=> b!857731 (= res!582667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857732 () Bool)

(declare-fun res!582671 () Bool)

(assert (=> b!857732 (=> (not res!582671) (not e!478045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857732 (= res!582671 (validMask!0 mask!1196))))

(declare-fun b!857733 () Bool)

(declare-fun e!478046 () Bool)

(declare-fun tp_is_empty!16503 () Bool)

(assert (=> b!857733 (= e!478046 tp_is_empty!16503)))

(declare-fun mapNonEmpty!26354 () Bool)

(declare-fun mapRes!26354 () Bool)

(declare-fun tp!50604 () Bool)

(declare-fun e!478044 () Bool)

(assert (=> mapNonEmpty!26354 (= mapRes!26354 (and tp!50604 e!478044))))

(declare-datatypes ((V!27051 0))(
  ( (V!27052 (val!8299 Int)) )
))
(declare-datatypes ((ValueCell!7812 0))(
  ( (ValueCellFull!7812 (v!10724 V!27051)) (EmptyCell!7812) )
))
(declare-fun mapValue!26354 () ValueCell!7812)

(declare-fun mapRest!26354 () (Array (_ BitVec 32) ValueCell!7812))

(declare-datatypes ((array!49198 0))(
  ( (array!49199 (arr!23630 (Array (_ BitVec 32) ValueCell!7812)) (size!24070 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49198)

(declare-fun mapKey!26354 () (_ BitVec 32))

(assert (=> mapNonEmpty!26354 (= (arr!23630 _values!688) (store mapRest!26354 mapKey!26354 mapValue!26354))))

(declare-fun b!857734 () Bool)

(declare-fun res!582664 () Bool)

(assert (=> b!857734 (=> (not res!582664) (not e!478045))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857734 (= res!582664 (validKeyInArray!0 k0!854))))

(declare-fun b!857735 () Bool)

(declare-fun res!582668 () Bool)

(assert (=> b!857735 (=> (not res!582668) (not e!478045))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857735 (= res!582668 (and (= (select (arr!23629 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857736 () Bool)

(declare-fun res!582665 () Bool)

(assert (=> b!857736 (=> (not res!582665) (not e!478045))))

(assert (=> b!857736 (= res!582665 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24069 _keys!868))))))

(declare-fun b!857737 () Bool)

(declare-fun e!478048 () Bool)

(assert (=> b!857737 (= e!478048 (not true))))

(declare-fun v!557 () V!27051)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!386386 () array!49198)

(declare-fun minValue!654 () V!27051)

(declare-fun zeroValue!654 () V!27051)

(declare-datatypes ((tuple2!10950 0))(
  ( (tuple2!10951 (_1!5486 (_ BitVec 64)) (_2!5486 V!27051)) )
))
(declare-datatypes ((List!16759 0))(
  ( (Nil!16756) (Cons!16755 (h!17886 tuple2!10950) (t!23400 List!16759)) )
))
(declare-datatypes ((ListLongMap!9719 0))(
  ( (ListLongMap!9720 (toList!4875 List!16759)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2856 (array!49196 array!49198 (_ BitVec 32) (_ BitVec 32) V!27051 V!27051 (_ BitVec 32) Int) ListLongMap!9719)

(declare-fun +!2229 (ListLongMap!9719 tuple2!10950) ListLongMap!9719)

(assert (=> b!857737 (= (getCurrentListMapNoExtraKeys!2856 _keys!868 lt!386386 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2229 (getCurrentListMapNoExtraKeys!2856 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10951 k0!854 v!557)))))

(declare-datatypes ((Unit!29245 0))(
  ( (Unit!29246) )
))
(declare-fun lt!386388 () Unit!29245)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!450 (array!49196 array!49198 (_ BitVec 32) (_ BitVec 32) V!27051 V!27051 (_ BitVec 32) (_ BitVec 64) V!27051 (_ BitVec 32) Int) Unit!29245)

(assert (=> b!857737 (= lt!386388 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!450 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857738 () Bool)

(assert (=> b!857738 (= e!478044 tp_is_empty!16503)))

(declare-fun res!582670 () Bool)

(assert (=> start!73452 (=> (not res!582670) (not e!478045))))

(assert (=> start!73452 (= res!582670 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24069 _keys!868))))))

(assert (=> start!73452 e!478045))

(assert (=> start!73452 tp_is_empty!16503))

(assert (=> start!73452 true))

(assert (=> start!73452 tp!50605))

(declare-fun array_inv!18714 (array!49196) Bool)

(assert (=> start!73452 (array_inv!18714 _keys!868)))

(declare-fun e!478047 () Bool)

(declare-fun array_inv!18715 (array!49198) Bool)

(assert (=> start!73452 (and (array_inv!18715 _values!688) e!478047)))

(declare-fun b!857739 () Bool)

(assert (=> b!857739 (= e!478045 e!478048)))

(declare-fun res!582669 () Bool)

(assert (=> b!857739 (=> (not res!582669) (not e!478048))))

(assert (=> b!857739 (= res!582669 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386387 () ListLongMap!9719)

(assert (=> b!857739 (= lt!386387 (getCurrentListMapNoExtraKeys!2856 _keys!868 lt!386386 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857739 (= lt!386386 (array!49199 (store (arr!23630 _values!688) i!612 (ValueCellFull!7812 v!557)) (size!24070 _values!688)))))

(declare-fun lt!386389 () ListLongMap!9719)

(assert (=> b!857739 (= lt!386389 (getCurrentListMapNoExtraKeys!2856 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26354 () Bool)

(assert (=> mapIsEmpty!26354 mapRes!26354))

(declare-fun b!857740 () Bool)

(assert (=> b!857740 (= e!478047 (and e!478046 mapRes!26354))))

(declare-fun condMapEmpty!26354 () Bool)

(declare-fun mapDefault!26354 () ValueCell!7812)

(assert (=> b!857740 (= condMapEmpty!26354 (= (arr!23630 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7812)) mapDefault!26354)))))

(declare-fun b!857741 () Bool)

(declare-fun res!582666 () Bool)

(assert (=> b!857741 (=> (not res!582666) (not e!478045))))

(assert (=> b!857741 (= res!582666 (and (= (size!24070 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24069 _keys!868) (size!24070 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73452 res!582670) b!857732))

(assert (= (and b!857732 res!582671) b!857741))

(assert (= (and b!857741 res!582666) b!857731))

(assert (= (and b!857731 res!582667) b!857730))

(assert (= (and b!857730 res!582663) b!857736))

(assert (= (and b!857736 res!582665) b!857734))

(assert (= (and b!857734 res!582664) b!857735))

(assert (= (and b!857735 res!582668) b!857739))

(assert (= (and b!857739 res!582669) b!857737))

(assert (= (and b!857740 condMapEmpty!26354) mapIsEmpty!26354))

(assert (= (and b!857740 (not condMapEmpty!26354)) mapNonEmpty!26354))

(get-info :version)

(assert (= (and mapNonEmpty!26354 ((_ is ValueCellFull!7812) mapValue!26354)) b!857738))

(assert (= (and b!857740 ((_ is ValueCellFull!7812) mapDefault!26354)) b!857733))

(assert (= start!73452 b!857740))

(declare-fun m!798461 () Bool)

(assert (=> b!857731 m!798461))

(declare-fun m!798463 () Bool)

(assert (=> b!857734 m!798463))

(declare-fun m!798465 () Bool)

(assert (=> b!857730 m!798465))

(declare-fun m!798467 () Bool)

(assert (=> b!857735 m!798467))

(declare-fun m!798469 () Bool)

(assert (=> start!73452 m!798469))

(declare-fun m!798471 () Bool)

(assert (=> start!73452 m!798471))

(declare-fun m!798473 () Bool)

(assert (=> b!857739 m!798473))

(declare-fun m!798475 () Bool)

(assert (=> b!857739 m!798475))

(declare-fun m!798477 () Bool)

(assert (=> b!857739 m!798477))

(declare-fun m!798479 () Bool)

(assert (=> b!857732 m!798479))

(declare-fun m!798481 () Bool)

(assert (=> mapNonEmpty!26354 m!798481))

(declare-fun m!798483 () Bool)

(assert (=> b!857737 m!798483))

(declare-fun m!798485 () Bool)

(assert (=> b!857737 m!798485))

(assert (=> b!857737 m!798485))

(declare-fun m!798487 () Bool)

(assert (=> b!857737 m!798487))

(declare-fun m!798489 () Bool)

(assert (=> b!857737 m!798489))

(check-sat (not start!73452) (not b!857730) (not b!857739) (not mapNonEmpty!26354) (not b!857731) tp_is_empty!16503 (not b!857737) b_and!23723 (not b_next!14367) (not b!857732) (not b!857734))
(check-sat b_and!23723 (not b_next!14367))
