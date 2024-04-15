; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72922 () Bool)

(assert start!72922)

(declare-fun b_free!13855 () Bool)

(declare-fun b_next!13855 () Bool)

(assert (=> start!72922 (= b_free!13855 (not b_next!13855))))

(declare-fun tp!49069 () Bool)

(declare-fun b_and!22915 () Bool)

(assert (=> start!72922 (= tp!49069 b_and!22915)))

(declare-fun b!846752 () Bool)

(declare-fun e!472521 () Bool)

(declare-fun e!472523 () Bool)

(declare-fun mapRes!25586 () Bool)

(assert (=> b!846752 (= e!472521 (and e!472523 mapRes!25586))))

(declare-fun condMapEmpty!25586 () Bool)

(declare-datatypes ((V!26369 0))(
  ( (V!26370 (val!8043 Int)) )
))
(declare-datatypes ((ValueCell!7556 0))(
  ( (ValueCellFull!7556 (v!10462 V!26369)) (EmptyCell!7556) )
))
(declare-datatypes ((array!48193 0))(
  ( (array!48194 (arr!23128 (Array (_ BitVec 32) ValueCell!7556)) (size!23570 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48193)

(declare-fun mapDefault!25586 () ValueCell!7556)

(assert (=> b!846752 (= condMapEmpty!25586 (= (arr!23128 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7556)) mapDefault!25586)))))

(declare-fun b!846753 () Bool)

(declare-fun res!575360 () Bool)

(declare-fun e!472522 () Bool)

(assert (=> b!846753 (=> (not res!575360) (not e!472522))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48195 0))(
  ( (array!48196 (arr!23129 (Array (_ BitVec 32) (_ BitVec 64))) (size!23571 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48195)

(assert (=> b!846753 (= res!575360 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23571 _keys!868))))))

(declare-fun mapIsEmpty!25586 () Bool)

(assert (=> mapIsEmpty!25586 mapRes!25586))

(declare-fun b!846755 () Bool)

(assert (=> b!846755 (= e!472522 false)))

(declare-fun v!557 () V!26369)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26369)

(declare-fun zeroValue!654 () V!26369)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!10534 0))(
  ( (tuple2!10535 (_1!5278 (_ BitVec 64)) (_2!5278 V!26369)) )
))
(declare-datatypes ((List!16391 0))(
  ( (Nil!16388) (Cons!16387 (h!17518 tuple2!10534) (t!22753 List!16391)) )
))
(declare-datatypes ((ListLongMap!9293 0))(
  ( (ListLongMap!9294 (toList!4662 List!16391)) )
))
(declare-fun lt!381401 () ListLongMap!9293)

(declare-fun getCurrentListMapNoExtraKeys!2676 (array!48195 array!48193 (_ BitVec 32) (_ BitVec 32) V!26369 V!26369 (_ BitVec 32) Int) ListLongMap!9293)

(assert (=> b!846755 (= lt!381401 (getCurrentListMapNoExtraKeys!2676 _keys!868 (array!48194 (store (arr!23128 _values!688) i!612 (ValueCellFull!7556 v!557)) (size!23570 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381400 () ListLongMap!9293)

(assert (=> b!846755 (= lt!381400 (getCurrentListMapNoExtraKeys!2676 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846756 () Bool)

(declare-fun e!472524 () Bool)

(declare-fun tp_is_empty!15991 () Bool)

(assert (=> b!846756 (= e!472524 tp_is_empty!15991)))

(declare-fun b!846757 () Bool)

(declare-fun res!575364 () Bool)

(assert (=> b!846757 (=> (not res!575364) (not e!472522))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846757 (= res!575364 (validKeyInArray!0 k0!854))))

(declare-fun b!846758 () Bool)

(declare-fun res!575367 () Bool)

(assert (=> b!846758 (=> (not res!575367) (not e!472522))))

(assert (=> b!846758 (= res!575367 (and (= (select (arr!23129 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846759 () Bool)

(declare-fun res!575361 () Bool)

(assert (=> b!846759 (=> (not res!575361) (not e!472522))))

(declare-datatypes ((List!16392 0))(
  ( (Nil!16389) (Cons!16388 (h!17519 (_ BitVec 64)) (t!22754 List!16392)) )
))
(declare-fun arrayNoDuplicates!0 (array!48195 (_ BitVec 32) List!16392) Bool)

(assert (=> b!846759 (= res!575361 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16389))))

(declare-fun b!846760 () Bool)

(declare-fun res!575363 () Bool)

(assert (=> b!846760 (=> (not res!575363) (not e!472522))))

(assert (=> b!846760 (= res!575363 (and (= (size!23570 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23571 _keys!868) (size!23570 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846761 () Bool)

(declare-fun res!575365 () Bool)

(assert (=> b!846761 (=> (not res!575365) (not e!472522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48195 (_ BitVec 32)) Bool)

(assert (=> b!846761 (= res!575365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25586 () Bool)

(declare-fun tp!49070 () Bool)

(assert (=> mapNonEmpty!25586 (= mapRes!25586 (and tp!49070 e!472524))))

(declare-fun mapValue!25586 () ValueCell!7556)

(declare-fun mapRest!25586 () (Array (_ BitVec 32) ValueCell!7556))

(declare-fun mapKey!25586 () (_ BitVec 32))

(assert (=> mapNonEmpty!25586 (= (arr!23128 _values!688) (store mapRest!25586 mapKey!25586 mapValue!25586))))

(declare-fun b!846762 () Bool)

(assert (=> b!846762 (= e!472523 tp_is_empty!15991)))

(declare-fun res!575366 () Bool)

(assert (=> start!72922 (=> (not res!575366) (not e!472522))))

(assert (=> start!72922 (= res!575366 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23571 _keys!868))))))

(assert (=> start!72922 e!472522))

(assert (=> start!72922 tp_is_empty!15991))

(assert (=> start!72922 true))

(assert (=> start!72922 tp!49069))

(declare-fun array_inv!18444 (array!48195) Bool)

(assert (=> start!72922 (array_inv!18444 _keys!868)))

(declare-fun array_inv!18445 (array!48193) Bool)

(assert (=> start!72922 (and (array_inv!18445 _values!688) e!472521)))

(declare-fun b!846754 () Bool)

(declare-fun res!575362 () Bool)

(assert (=> b!846754 (=> (not res!575362) (not e!472522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846754 (= res!575362 (validMask!0 mask!1196))))

(assert (= (and start!72922 res!575366) b!846754))

(assert (= (and b!846754 res!575362) b!846760))

(assert (= (and b!846760 res!575363) b!846761))

(assert (= (and b!846761 res!575365) b!846759))

(assert (= (and b!846759 res!575361) b!846753))

(assert (= (and b!846753 res!575360) b!846757))

(assert (= (and b!846757 res!575364) b!846758))

(assert (= (and b!846758 res!575367) b!846755))

(assert (= (and b!846752 condMapEmpty!25586) mapIsEmpty!25586))

(assert (= (and b!846752 (not condMapEmpty!25586)) mapNonEmpty!25586))

(get-info :version)

(assert (= (and mapNonEmpty!25586 ((_ is ValueCellFull!7556) mapValue!25586)) b!846756))

(assert (= (and b!846752 ((_ is ValueCellFull!7556) mapDefault!25586)) b!846762))

(assert (= start!72922 b!846752))

(declare-fun m!787451 () Bool)

(assert (=> b!846759 m!787451))

(declare-fun m!787453 () Bool)

(assert (=> b!846754 m!787453))

(declare-fun m!787455 () Bool)

(assert (=> b!846761 m!787455))

(declare-fun m!787457 () Bool)

(assert (=> b!846758 m!787457))

(declare-fun m!787459 () Bool)

(assert (=> b!846755 m!787459))

(declare-fun m!787461 () Bool)

(assert (=> b!846755 m!787461))

(declare-fun m!787463 () Bool)

(assert (=> b!846755 m!787463))

(declare-fun m!787465 () Bool)

(assert (=> mapNonEmpty!25586 m!787465))

(declare-fun m!787467 () Bool)

(assert (=> b!846757 m!787467))

(declare-fun m!787469 () Bool)

(assert (=> start!72922 m!787469))

(declare-fun m!787471 () Bool)

(assert (=> start!72922 m!787471))

(check-sat (not b!846757) (not b!846759) (not b_next!13855) (not b!846761) b_and!22915 tp_is_empty!15991 (not b!846754) (not mapNonEmpty!25586) (not b!846755) (not start!72922))
(check-sat b_and!22915 (not b_next!13855))
