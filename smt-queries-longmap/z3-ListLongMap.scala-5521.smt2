; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73078 () Bool)

(assert start!73078)

(declare-fun b_free!13825 () Bool)

(declare-fun b_next!13825 () Bool)

(assert (=> start!73078 (= b_free!13825 (not b_next!13825))))

(declare-fun tp!48979 () Bool)

(declare-fun b_and!22921 () Bool)

(assert (=> start!73078 (= tp!48979 b_and!22921)))

(declare-fun b!847399 () Bool)

(declare-fun res!575461 () Bool)

(declare-fun e!473029 () Bool)

(assert (=> b!847399 (=> (not res!575461) (not e!473029))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847399 (= res!575461 (validKeyInArray!0 k0!854))))

(declare-fun b!847400 () Bool)

(declare-fun e!473028 () Bool)

(declare-fun tp_is_empty!15961 () Bool)

(assert (=> b!847400 (= e!473028 tp_is_empty!15961)))

(declare-fun b!847401 () Bool)

(assert (=> b!847401 (= e!473029 false)))

(declare-datatypes ((V!26329 0))(
  ( (V!26330 (val!8028 Int)) )
))
(declare-fun v!557 () V!26329)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48185 0))(
  ( (array!48186 (arr!23119 (Array (_ BitVec 32) (_ BitVec 64))) (size!23560 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48185)

(declare-datatypes ((tuple2!10404 0))(
  ( (tuple2!10405 (_1!5213 (_ BitVec 64)) (_2!5213 V!26329)) )
))
(declare-datatypes ((List!16277 0))(
  ( (Nil!16274) (Cons!16273 (h!17410 tuple2!10404) (t!22640 List!16277)) )
))
(declare-datatypes ((ListLongMap!9175 0))(
  ( (ListLongMap!9176 (toList!4603 List!16277)) )
))
(declare-fun lt!381907 () ListLongMap!9175)

(declare-datatypes ((ValueCell!7541 0))(
  ( (ValueCellFull!7541 (v!10453 V!26329)) (EmptyCell!7541) )
))
(declare-datatypes ((array!48187 0))(
  ( (array!48188 (arr!23120 (Array (_ BitVec 32) ValueCell!7541)) (size!23561 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48187)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26329)

(declare-fun zeroValue!654 () V!26329)

(declare-fun getCurrentListMapNoExtraKeys!2661 (array!48185 array!48187 (_ BitVec 32) (_ BitVec 32) V!26329 V!26329 (_ BitVec 32) Int) ListLongMap!9175)

(assert (=> b!847401 (= lt!381907 (getCurrentListMapNoExtraKeys!2661 _keys!868 (array!48188 (store (arr!23120 _values!688) i!612 (ValueCellFull!7541 v!557)) (size!23561 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381908 () ListLongMap!9175)

(assert (=> b!847401 (= lt!381908 (getCurrentListMapNoExtraKeys!2661 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25541 () Bool)

(declare-fun mapRes!25541 () Bool)

(declare-fun tp!48980 () Bool)

(assert (=> mapNonEmpty!25541 (= mapRes!25541 (and tp!48980 e!473028))))

(declare-fun mapRest!25541 () (Array (_ BitVec 32) ValueCell!7541))

(declare-fun mapKey!25541 () (_ BitVec 32))

(declare-fun mapValue!25541 () ValueCell!7541)

(assert (=> mapNonEmpty!25541 (= (arr!23120 _values!688) (store mapRest!25541 mapKey!25541 mapValue!25541))))

(declare-fun b!847402 () Bool)

(declare-fun res!575460 () Bool)

(assert (=> b!847402 (=> (not res!575460) (not e!473029))))

(assert (=> b!847402 (= res!575460 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23560 _keys!868))))))

(declare-fun b!847403 () Bool)

(declare-fun res!575454 () Bool)

(assert (=> b!847403 (=> (not res!575454) (not e!473029))))

(declare-datatypes ((List!16278 0))(
  ( (Nil!16275) (Cons!16274 (h!17411 (_ BitVec 64)) (t!22641 List!16278)) )
))
(declare-fun arrayNoDuplicates!0 (array!48185 (_ BitVec 32) List!16278) Bool)

(assert (=> b!847403 (= res!575454 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16275))))

(declare-fun b!847404 () Bool)

(declare-fun res!575459 () Bool)

(assert (=> b!847404 (=> (not res!575459) (not e!473029))))

(assert (=> b!847404 (= res!575459 (and (= (select (arr!23119 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847405 () Bool)

(declare-fun res!575456 () Bool)

(assert (=> b!847405 (=> (not res!575456) (not e!473029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847405 (= res!575456 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25541 () Bool)

(assert (=> mapIsEmpty!25541 mapRes!25541))

(declare-fun res!575455 () Bool)

(assert (=> start!73078 (=> (not res!575455) (not e!473029))))

(assert (=> start!73078 (= res!575455 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23560 _keys!868))))))

(assert (=> start!73078 e!473029))

(assert (=> start!73078 tp_is_empty!15961))

(assert (=> start!73078 true))

(assert (=> start!73078 tp!48979))

(declare-fun array_inv!18418 (array!48185) Bool)

(assert (=> start!73078 (array_inv!18418 _keys!868)))

(declare-fun e!473027 () Bool)

(declare-fun array_inv!18419 (array!48187) Bool)

(assert (=> start!73078 (and (array_inv!18419 _values!688) e!473027)))

(declare-fun b!847406 () Bool)

(declare-fun res!575458 () Bool)

(assert (=> b!847406 (=> (not res!575458) (not e!473029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48185 (_ BitVec 32)) Bool)

(assert (=> b!847406 (= res!575458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847407 () Bool)

(declare-fun res!575457 () Bool)

(assert (=> b!847407 (=> (not res!575457) (not e!473029))))

(assert (=> b!847407 (= res!575457 (and (= (size!23561 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23560 _keys!868) (size!23561 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847408 () Bool)

(declare-fun e!473025 () Bool)

(assert (=> b!847408 (= e!473025 tp_is_empty!15961)))

(declare-fun b!847409 () Bool)

(assert (=> b!847409 (= e!473027 (and e!473025 mapRes!25541))))

(declare-fun condMapEmpty!25541 () Bool)

(declare-fun mapDefault!25541 () ValueCell!7541)

(assert (=> b!847409 (= condMapEmpty!25541 (= (arr!23120 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7541)) mapDefault!25541)))))

(assert (= (and start!73078 res!575455) b!847405))

(assert (= (and b!847405 res!575456) b!847407))

(assert (= (and b!847407 res!575457) b!847406))

(assert (= (and b!847406 res!575458) b!847403))

(assert (= (and b!847403 res!575454) b!847402))

(assert (= (and b!847402 res!575460) b!847399))

(assert (= (and b!847399 res!575461) b!847404))

(assert (= (and b!847404 res!575459) b!847401))

(assert (= (and b!847409 condMapEmpty!25541) mapIsEmpty!25541))

(assert (= (and b!847409 (not condMapEmpty!25541)) mapNonEmpty!25541))

(get-info :version)

(assert (= (and mapNonEmpty!25541 ((_ is ValueCellFull!7541) mapValue!25541)) b!847400))

(assert (= (and b!847409 ((_ is ValueCellFull!7541) mapDefault!25541)) b!847408))

(assert (= start!73078 b!847409))

(declare-fun m!789167 () Bool)

(assert (=> b!847404 m!789167))

(declare-fun m!789169 () Bool)

(assert (=> mapNonEmpty!25541 m!789169))

(declare-fun m!789171 () Bool)

(assert (=> start!73078 m!789171))

(declare-fun m!789173 () Bool)

(assert (=> start!73078 m!789173))

(declare-fun m!789175 () Bool)

(assert (=> b!847401 m!789175))

(declare-fun m!789177 () Bool)

(assert (=> b!847401 m!789177))

(declare-fun m!789179 () Bool)

(assert (=> b!847401 m!789179))

(declare-fun m!789181 () Bool)

(assert (=> b!847403 m!789181))

(declare-fun m!789183 () Bool)

(assert (=> b!847399 m!789183))

(declare-fun m!789185 () Bool)

(assert (=> b!847406 m!789185))

(declare-fun m!789187 () Bool)

(assert (=> b!847405 m!789187))

(check-sat (not b!847403) (not b_next!13825) tp_is_empty!15961 (not b!847405) (not b!847401) (not start!73078) (not b!847399) (not b!847406) b_and!22921 (not mapNonEmpty!25541))
(check-sat b_and!22921 (not b_next!13825))
