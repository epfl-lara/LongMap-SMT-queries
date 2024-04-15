; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72934 () Bool)

(assert start!72934)

(declare-fun b_free!13867 () Bool)

(declare-fun b_next!13867 () Bool)

(assert (=> start!72934 (= b_free!13867 (not b_next!13867))))

(declare-fun tp!49106 () Bool)

(declare-fun b_and!22927 () Bool)

(assert (=> start!72934 (= tp!49106 b_and!22927)))

(declare-fun b!846950 () Bool)

(declare-fun res!575509 () Bool)

(declare-fun e!472611 () Bool)

(assert (=> b!846950 (=> (not res!575509) (not e!472611))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48215 0))(
  ( (array!48216 (arr!23139 (Array (_ BitVec 32) (_ BitVec 64))) (size!23581 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48215)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846950 (= res!575509 (and (= (select (arr!23139 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846951 () Bool)

(declare-fun res!575504 () Bool)

(assert (=> b!846951 (=> (not res!575504) (not e!472611))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846951 (= res!575504 (validMask!0 mask!1196))))

(declare-fun b!846952 () Bool)

(declare-fun res!575507 () Bool)

(assert (=> b!846952 (=> (not res!575507) (not e!472611))))

(declare-datatypes ((List!16398 0))(
  ( (Nil!16395) (Cons!16394 (h!17525 (_ BitVec 64)) (t!22760 List!16398)) )
))
(declare-fun arrayNoDuplicates!0 (array!48215 (_ BitVec 32) List!16398) Bool)

(assert (=> b!846952 (= res!575507 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16395))))

(declare-fun b!846953 () Bool)

(declare-fun res!575506 () Bool)

(assert (=> b!846953 (=> (not res!575506) (not e!472611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48215 (_ BitVec 32)) Bool)

(assert (=> b!846953 (= res!575506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846954 () Bool)

(declare-fun res!575510 () Bool)

(assert (=> b!846954 (=> (not res!575510) (not e!472611))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26385 0))(
  ( (V!26386 (val!8049 Int)) )
))
(declare-datatypes ((ValueCell!7562 0))(
  ( (ValueCellFull!7562 (v!10468 V!26385)) (EmptyCell!7562) )
))
(declare-datatypes ((array!48217 0))(
  ( (array!48218 (arr!23140 (Array (_ BitVec 32) ValueCell!7562)) (size!23582 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48217)

(assert (=> b!846954 (= res!575510 (and (= (size!23582 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23581 _keys!868) (size!23582 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846955 () Bool)

(declare-fun res!575511 () Bool)

(assert (=> b!846955 (=> (not res!575511) (not e!472611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846955 (= res!575511 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!25604 () Bool)

(declare-fun mapRes!25604 () Bool)

(declare-fun tp!49105 () Bool)

(declare-fun e!472610 () Bool)

(assert (=> mapNonEmpty!25604 (= mapRes!25604 (and tp!49105 e!472610))))

(declare-fun mapValue!25604 () ValueCell!7562)

(declare-fun mapKey!25604 () (_ BitVec 32))

(declare-fun mapRest!25604 () (Array (_ BitVec 32) ValueCell!7562))

(assert (=> mapNonEmpty!25604 (= (arr!23140 _values!688) (store mapRest!25604 mapKey!25604 mapValue!25604))))

(declare-fun res!575505 () Bool)

(assert (=> start!72934 (=> (not res!575505) (not e!472611))))

(assert (=> start!72934 (= res!575505 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23581 _keys!868))))))

(assert (=> start!72934 e!472611))

(declare-fun tp_is_empty!16003 () Bool)

(assert (=> start!72934 tp_is_empty!16003))

(assert (=> start!72934 true))

(assert (=> start!72934 tp!49106))

(declare-fun array_inv!18452 (array!48215) Bool)

(assert (=> start!72934 (array_inv!18452 _keys!868)))

(declare-fun e!472612 () Bool)

(declare-fun array_inv!18453 (array!48217) Bool)

(assert (=> start!72934 (and (array_inv!18453 _values!688) e!472612)))

(declare-fun mapIsEmpty!25604 () Bool)

(assert (=> mapIsEmpty!25604 mapRes!25604))

(declare-fun b!846956 () Bool)

(declare-fun e!472614 () Bool)

(assert (=> b!846956 (= e!472614 tp_is_empty!16003)))

(declare-fun b!846957 () Bool)

(declare-fun res!575508 () Bool)

(assert (=> b!846957 (=> (not res!575508) (not e!472611))))

(assert (=> b!846957 (= res!575508 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23581 _keys!868))))))

(declare-fun b!846958 () Bool)

(assert (=> b!846958 (= e!472612 (and e!472614 mapRes!25604))))

(declare-fun condMapEmpty!25604 () Bool)

(declare-fun mapDefault!25604 () ValueCell!7562)

(assert (=> b!846958 (= condMapEmpty!25604 (= (arr!23140 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7562)) mapDefault!25604)))))

(declare-fun b!846959 () Bool)

(assert (=> b!846959 (= e!472610 tp_is_empty!16003)))

(declare-fun b!846960 () Bool)

(assert (=> b!846960 (= e!472611 false)))

(declare-fun v!557 () V!26385)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26385)

(declare-fun zeroValue!654 () V!26385)

(declare-datatypes ((tuple2!10540 0))(
  ( (tuple2!10541 (_1!5281 (_ BitVec 64)) (_2!5281 V!26385)) )
))
(declare-datatypes ((List!16399 0))(
  ( (Nil!16396) (Cons!16395 (h!17526 tuple2!10540) (t!22761 List!16399)) )
))
(declare-datatypes ((ListLongMap!9299 0))(
  ( (ListLongMap!9300 (toList!4665 List!16399)) )
))
(declare-fun lt!381436 () ListLongMap!9299)

(declare-fun getCurrentListMapNoExtraKeys!2679 (array!48215 array!48217 (_ BitVec 32) (_ BitVec 32) V!26385 V!26385 (_ BitVec 32) Int) ListLongMap!9299)

(assert (=> b!846960 (= lt!381436 (getCurrentListMapNoExtraKeys!2679 _keys!868 (array!48218 (store (arr!23140 _values!688) i!612 (ValueCellFull!7562 v!557)) (size!23582 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381437 () ListLongMap!9299)

(assert (=> b!846960 (= lt!381437 (getCurrentListMapNoExtraKeys!2679 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!72934 res!575505) b!846951))

(assert (= (and b!846951 res!575504) b!846954))

(assert (= (and b!846954 res!575510) b!846953))

(assert (= (and b!846953 res!575506) b!846952))

(assert (= (and b!846952 res!575507) b!846957))

(assert (= (and b!846957 res!575508) b!846955))

(assert (= (and b!846955 res!575511) b!846950))

(assert (= (and b!846950 res!575509) b!846960))

(assert (= (and b!846958 condMapEmpty!25604) mapIsEmpty!25604))

(assert (= (and b!846958 (not condMapEmpty!25604)) mapNonEmpty!25604))

(get-info :version)

(assert (= (and mapNonEmpty!25604 ((_ is ValueCellFull!7562) mapValue!25604)) b!846959))

(assert (= (and b!846958 ((_ is ValueCellFull!7562) mapDefault!25604)) b!846956))

(assert (= start!72934 b!846958))

(declare-fun m!787583 () Bool)

(assert (=> b!846950 m!787583))

(declare-fun m!787585 () Bool)

(assert (=> b!846951 m!787585))

(declare-fun m!787587 () Bool)

(assert (=> b!846960 m!787587))

(declare-fun m!787589 () Bool)

(assert (=> b!846960 m!787589))

(declare-fun m!787591 () Bool)

(assert (=> b!846960 m!787591))

(declare-fun m!787593 () Bool)

(assert (=> start!72934 m!787593))

(declare-fun m!787595 () Bool)

(assert (=> start!72934 m!787595))

(declare-fun m!787597 () Bool)

(assert (=> b!846952 m!787597))

(declare-fun m!787599 () Bool)

(assert (=> b!846953 m!787599))

(declare-fun m!787601 () Bool)

(assert (=> b!846955 m!787601))

(declare-fun m!787603 () Bool)

(assert (=> mapNonEmpty!25604 m!787603))

(check-sat (not mapNonEmpty!25604) (not b!846953) (not b!846955) (not b!846960) (not b_next!13867) (not b!846951) tp_is_empty!16003 (not b!846952) b_and!22927 (not start!72934))
(check-sat b_and!22927 (not b_next!13867))
