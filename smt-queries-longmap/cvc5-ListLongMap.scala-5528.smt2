; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72952 () Bool)

(assert start!72952)

(declare-fun b_free!13867 () Bool)

(declare-fun b_next!13867 () Bool)

(assert (=> start!72952 (= b_free!13867 (not b_next!13867))))

(declare-fun tp!49105 () Bool)

(declare-fun b_and!22953 () Bool)

(assert (=> start!72952 (= tp!49105 b_and!22953)))

(declare-fun mapIsEmpty!25604 () Bool)

(declare-fun mapRes!25604 () Bool)

(assert (=> mapIsEmpty!25604 mapRes!25604))

(declare-fun b!847189 () Bool)

(declare-fun res!575621 () Bool)

(declare-fun e!472762 () Bool)

(assert (=> b!847189 (=> (not res!575621) (not e!472762))))

(declare-datatypes ((array!48216 0))(
  ( (array!48217 (arr!23139 (Array (_ BitVec 32) (_ BitVec 64))) (size!23579 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48216)

(declare-datatypes ((List!16370 0))(
  ( (Nil!16367) (Cons!16366 (h!17497 (_ BitVec 64)) (t!22741 List!16370)) )
))
(declare-fun arrayNoDuplicates!0 (array!48216 (_ BitVec 32) List!16370) Bool)

(assert (=> b!847189 (= res!575621 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16367))))

(declare-fun b!847190 () Bool)

(declare-fun res!575617 () Bool)

(assert (=> b!847190 (=> (not res!575617) (not e!472762))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847190 (= res!575617 (and (= (select (arr!23139 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!847191 () Bool)

(declare-fun res!575614 () Bool)

(assert (=> b!847191 (=> (not res!575614) (not e!472762))))

(assert (=> b!847191 (= res!575614 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23579 _keys!868))))))

(declare-fun b!847192 () Bool)

(assert (=> b!847192 (= e!472762 false)))

(declare-datatypes ((V!26385 0))(
  ( (V!26386 (val!8049 Int)) )
))
(declare-fun v!557 () V!26385)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7562 0))(
  ( (ValueCellFull!7562 (v!10474 V!26385)) (EmptyCell!7562) )
))
(declare-datatypes ((array!48218 0))(
  ( (array!48219 (arr!23140 (Array (_ BitVec 32) ValueCell!7562)) (size!23580 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48218)

(declare-fun minValue!654 () V!26385)

(declare-datatypes ((tuple2!10510 0))(
  ( (tuple2!10511 (_1!5266 (_ BitVec 64)) (_2!5266 V!26385)) )
))
(declare-datatypes ((List!16371 0))(
  ( (Nil!16368) (Cons!16367 (h!17498 tuple2!10510) (t!22742 List!16371)) )
))
(declare-datatypes ((ListLongMap!9279 0))(
  ( (ListLongMap!9280 (toList!4655 List!16371)) )
))
(declare-fun lt!381673 () ListLongMap!9279)

(declare-fun zeroValue!654 () V!26385)

(declare-fun getCurrentListMapNoExtraKeys!2640 (array!48216 array!48218 (_ BitVec 32) (_ BitVec 32) V!26385 V!26385 (_ BitVec 32) Int) ListLongMap!9279)

(assert (=> b!847192 (= lt!381673 (getCurrentListMapNoExtraKeys!2640 _keys!868 (array!48219 (store (arr!23140 _values!688) i!612 (ValueCellFull!7562 v!557)) (size!23580 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381672 () ListLongMap!9279)

(assert (=> b!847192 (= lt!381672 (getCurrentListMapNoExtraKeys!2640 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847193 () Bool)

(declare-fun res!575615 () Bool)

(assert (=> b!847193 (=> (not res!575615) (not e!472762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847193 (= res!575615 (validMask!0 mask!1196))))

(declare-fun b!847194 () Bool)

(declare-fun e!472760 () Bool)

(declare-fun tp_is_empty!16003 () Bool)

(assert (=> b!847194 (= e!472760 tp_is_empty!16003)))

(declare-fun b!847195 () Bool)

(declare-fun res!575616 () Bool)

(assert (=> b!847195 (=> (not res!575616) (not e!472762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48216 (_ BitVec 32)) Bool)

(assert (=> b!847195 (= res!575616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25604 () Bool)

(declare-fun tp!49104 () Bool)

(declare-fun e!472758 () Bool)

(assert (=> mapNonEmpty!25604 (= mapRes!25604 (and tp!49104 e!472758))))

(declare-fun mapRest!25604 () (Array (_ BitVec 32) ValueCell!7562))

(declare-fun mapValue!25604 () ValueCell!7562)

(declare-fun mapKey!25604 () (_ BitVec 32))

(assert (=> mapNonEmpty!25604 (= (arr!23140 _values!688) (store mapRest!25604 mapKey!25604 mapValue!25604))))

(declare-fun b!847196 () Bool)

(assert (=> b!847196 (= e!472758 tp_is_empty!16003)))

(declare-fun res!575619 () Bool)

(assert (=> start!72952 (=> (not res!575619) (not e!472762))))

(assert (=> start!72952 (= res!575619 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23579 _keys!868))))))

(assert (=> start!72952 e!472762))

(assert (=> start!72952 tp_is_empty!16003))

(assert (=> start!72952 true))

(assert (=> start!72952 tp!49105))

(declare-fun array_inv!18378 (array!48216) Bool)

(assert (=> start!72952 (array_inv!18378 _keys!868)))

(declare-fun e!472759 () Bool)

(declare-fun array_inv!18379 (array!48218) Bool)

(assert (=> start!72952 (and (array_inv!18379 _values!688) e!472759)))

(declare-fun b!847197 () Bool)

(declare-fun res!575620 () Bool)

(assert (=> b!847197 (=> (not res!575620) (not e!472762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847197 (= res!575620 (validKeyInArray!0 k!854))))

(declare-fun b!847198 () Bool)

(declare-fun res!575618 () Bool)

(assert (=> b!847198 (=> (not res!575618) (not e!472762))))

(assert (=> b!847198 (= res!575618 (and (= (size!23580 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23579 _keys!868) (size!23580 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847199 () Bool)

(assert (=> b!847199 (= e!472759 (and e!472760 mapRes!25604))))

(declare-fun condMapEmpty!25604 () Bool)

(declare-fun mapDefault!25604 () ValueCell!7562)

