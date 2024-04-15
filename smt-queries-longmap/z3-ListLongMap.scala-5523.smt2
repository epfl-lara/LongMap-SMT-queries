; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72904 () Bool)

(assert start!72904)

(declare-fun b_free!13837 () Bool)

(declare-fun b_next!13837 () Bool)

(assert (=> start!72904 (= b_free!13837 (not b_next!13837))))

(declare-fun tp!49016 () Bool)

(declare-fun b_and!22897 () Bool)

(assert (=> start!72904 (= tp!49016 b_and!22897)))

(declare-fun b!846455 () Bool)

(declare-fun e!472389 () Bool)

(assert (=> b!846455 (= e!472389 false)))

(declare-datatypes ((V!26345 0))(
  ( (V!26346 (val!8034 Int)) )
))
(declare-fun v!557 () V!26345)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48159 0))(
  ( (array!48160 (arr!23111 (Array (_ BitVec 32) (_ BitVec 64))) (size!23553 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48159)

(declare-datatypes ((ValueCell!7547 0))(
  ( (ValueCellFull!7547 (v!10453 V!26345)) (EmptyCell!7547) )
))
(declare-datatypes ((array!48161 0))(
  ( (array!48162 (arr!23112 (Array (_ BitVec 32) ValueCell!7547)) (size!23554 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48161)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26345)

(declare-datatypes ((tuple2!10520 0))(
  ( (tuple2!10521 (_1!5271 (_ BitVec 64)) (_2!5271 V!26345)) )
))
(declare-datatypes ((List!16378 0))(
  ( (Nil!16375) (Cons!16374 (h!17505 tuple2!10520) (t!22740 List!16378)) )
))
(declare-datatypes ((ListLongMap!9279 0))(
  ( (ListLongMap!9280 (toList!4655 List!16378)) )
))
(declare-fun lt!381347 () ListLongMap!9279)

(declare-fun zeroValue!654 () V!26345)

(declare-fun getCurrentListMapNoExtraKeys!2669 (array!48159 array!48161 (_ BitVec 32) (_ BitVec 32) V!26345 V!26345 (_ BitVec 32) Int) ListLongMap!9279)

(assert (=> b!846455 (= lt!381347 (getCurrentListMapNoExtraKeys!2669 _keys!868 (array!48162 (store (arr!23112 _values!688) i!612 (ValueCellFull!7547 v!557)) (size!23554 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381346 () ListLongMap!9279)

(assert (=> b!846455 (= lt!381346 (getCurrentListMapNoExtraKeys!2669 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846456 () Bool)

(declare-fun e!472388 () Bool)

(declare-fun tp_is_empty!15973 () Bool)

(assert (=> b!846456 (= e!472388 tp_is_empty!15973)))

(declare-fun b!846457 () Bool)

(declare-fun res!575147 () Bool)

(assert (=> b!846457 (=> (not res!575147) (not e!472389))))

(declare-datatypes ((List!16379 0))(
  ( (Nil!16376) (Cons!16375 (h!17506 (_ BitVec 64)) (t!22741 List!16379)) )
))
(declare-fun arrayNoDuplicates!0 (array!48159 (_ BitVec 32) List!16379) Bool)

(assert (=> b!846457 (= res!575147 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16376))))

(declare-fun b!846458 () Bool)

(declare-fun e!472385 () Bool)

(assert (=> b!846458 (= e!472385 tp_is_empty!15973)))

(declare-fun b!846459 () Bool)

(declare-fun res!575151 () Bool)

(assert (=> b!846459 (=> (not res!575151) (not e!472389))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846459 (= res!575151 (validKeyInArray!0 k0!854))))

(declare-fun b!846460 () Bool)

(declare-fun res!575146 () Bool)

(assert (=> b!846460 (=> (not res!575146) (not e!472389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48159 (_ BitVec 32)) Bool)

(assert (=> b!846460 (= res!575146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25559 () Bool)

(declare-fun mapRes!25559 () Bool)

(declare-fun tp!49015 () Bool)

(assert (=> mapNonEmpty!25559 (= mapRes!25559 (and tp!49015 e!472385))))

(declare-fun mapValue!25559 () ValueCell!7547)

(declare-fun mapRest!25559 () (Array (_ BitVec 32) ValueCell!7547))

(declare-fun mapKey!25559 () (_ BitVec 32))

(assert (=> mapNonEmpty!25559 (= (arr!23112 _values!688) (store mapRest!25559 mapKey!25559 mapValue!25559))))

(declare-fun res!575144 () Bool)

(assert (=> start!72904 (=> (not res!575144) (not e!472389))))

(assert (=> start!72904 (= res!575144 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23553 _keys!868))))))

(assert (=> start!72904 e!472389))

(assert (=> start!72904 tp_is_empty!15973))

(assert (=> start!72904 true))

(assert (=> start!72904 tp!49016))

(declare-fun array_inv!18432 (array!48159) Bool)

(assert (=> start!72904 (array_inv!18432 _keys!868)))

(declare-fun e!472387 () Bool)

(declare-fun array_inv!18433 (array!48161) Bool)

(assert (=> start!72904 (and (array_inv!18433 _values!688) e!472387)))

(declare-fun b!846461 () Bool)

(assert (=> b!846461 (= e!472387 (and e!472388 mapRes!25559))))

(declare-fun condMapEmpty!25559 () Bool)

(declare-fun mapDefault!25559 () ValueCell!7547)

(assert (=> b!846461 (= condMapEmpty!25559 (= (arr!23112 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7547)) mapDefault!25559)))))

(declare-fun b!846462 () Bool)

(declare-fun res!575150 () Bool)

(assert (=> b!846462 (=> (not res!575150) (not e!472389))))

(assert (=> b!846462 (= res!575150 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23553 _keys!868))))))

(declare-fun mapIsEmpty!25559 () Bool)

(assert (=> mapIsEmpty!25559 mapRes!25559))

(declare-fun b!846463 () Bool)

(declare-fun res!575149 () Bool)

(assert (=> b!846463 (=> (not res!575149) (not e!472389))))

(assert (=> b!846463 (= res!575149 (and (= (size!23554 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23553 _keys!868) (size!23554 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846464 () Bool)

(declare-fun res!575145 () Bool)

(assert (=> b!846464 (=> (not res!575145) (not e!472389))))

(assert (=> b!846464 (= res!575145 (and (= (select (arr!23111 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846465 () Bool)

(declare-fun res!575148 () Bool)

(assert (=> b!846465 (=> (not res!575148) (not e!472389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846465 (= res!575148 (validMask!0 mask!1196))))

(assert (= (and start!72904 res!575144) b!846465))

(assert (= (and b!846465 res!575148) b!846463))

(assert (= (and b!846463 res!575149) b!846460))

(assert (= (and b!846460 res!575146) b!846457))

(assert (= (and b!846457 res!575147) b!846462))

(assert (= (and b!846462 res!575150) b!846459))

(assert (= (and b!846459 res!575151) b!846464))

(assert (= (and b!846464 res!575145) b!846455))

(assert (= (and b!846461 condMapEmpty!25559) mapIsEmpty!25559))

(assert (= (and b!846461 (not condMapEmpty!25559)) mapNonEmpty!25559))

(get-info :version)

(assert (= (and mapNonEmpty!25559 ((_ is ValueCellFull!7547) mapValue!25559)) b!846458))

(assert (= (and b!846461 ((_ is ValueCellFull!7547) mapDefault!25559)) b!846456))

(assert (= start!72904 b!846461))

(declare-fun m!787253 () Bool)

(assert (=> b!846459 m!787253))

(declare-fun m!787255 () Bool)

(assert (=> b!846465 m!787255))

(declare-fun m!787257 () Bool)

(assert (=> mapNonEmpty!25559 m!787257))

(declare-fun m!787259 () Bool)

(assert (=> b!846464 m!787259))

(declare-fun m!787261 () Bool)

(assert (=> b!846457 m!787261))

(declare-fun m!787263 () Bool)

(assert (=> b!846460 m!787263))

(declare-fun m!787265 () Bool)

(assert (=> b!846455 m!787265))

(declare-fun m!787267 () Bool)

(assert (=> b!846455 m!787267))

(declare-fun m!787269 () Bool)

(assert (=> b!846455 m!787269))

(declare-fun m!787271 () Bool)

(assert (=> start!72904 m!787271))

(declare-fun m!787273 () Bool)

(assert (=> start!72904 m!787273))

(check-sat (not b!846457) (not b!846465) (not b!846460) (not b_next!13837) (not start!72904) (not b!846455) tp_is_empty!15973 b_and!22897 (not mapNonEmpty!25559) (not b!846459))
(check-sat b_and!22897 (not b_next!13837))
