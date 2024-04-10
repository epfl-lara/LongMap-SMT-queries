; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72920 () Bool)

(assert start!72920)

(declare-fun b_free!13835 () Bool)

(declare-fun b_next!13835 () Bool)

(assert (=> start!72920 (= b_free!13835 (not b_next!13835))))

(declare-fun tp!49009 () Bool)

(declare-fun b_and!22921 () Bool)

(assert (=> start!72920 (= tp!49009 b_and!22921)))

(declare-fun b!846661 () Bool)

(declare-fun res!575230 () Bool)

(declare-fun e!472519 () Bool)

(assert (=> b!846661 (=> (not res!575230) (not e!472519))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846661 (= res!575230 (validMask!0 mask!1196))))

(declare-fun b!846662 () Bool)

(declare-fun res!575237 () Bool)

(assert (=> b!846662 (=> (not res!575237) (not e!472519))))

(declare-datatypes ((array!48154 0))(
  ( (array!48155 (arr!23108 (Array (_ BitVec 32) (_ BitVec 64))) (size!23548 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48154)

(declare-datatypes ((List!16351 0))(
  ( (Nil!16348) (Cons!16347 (h!17478 (_ BitVec 64)) (t!22722 List!16351)) )
))
(declare-fun arrayNoDuplicates!0 (array!48154 (_ BitVec 32) List!16351) Bool)

(assert (=> b!846662 (= res!575237 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16348))))

(declare-fun b!846663 () Bool)

(declare-fun e!472518 () Bool)

(declare-fun tp_is_empty!15971 () Bool)

(assert (=> b!846663 (= e!472518 tp_is_empty!15971)))

(declare-fun mapNonEmpty!25556 () Bool)

(declare-fun mapRes!25556 () Bool)

(declare-fun tp!49008 () Bool)

(assert (=> mapNonEmpty!25556 (= mapRes!25556 (and tp!49008 e!472518))))

(declare-datatypes ((V!26341 0))(
  ( (V!26342 (val!8033 Int)) )
))
(declare-datatypes ((ValueCell!7546 0))(
  ( (ValueCellFull!7546 (v!10458 V!26341)) (EmptyCell!7546) )
))
(declare-fun mapValue!25556 () ValueCell!7546)

(declare-datatypes ((array!48156 0))(
  ( (array!48157 (arr!23109 (Array (_ BitVec 32) ValueCell!7546)) (size!23549 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48156)

(declare-fun mapRest!25556 () (Array (_ BitVec 32) ValueCell!7546))

(declare-fun mapKey!25556 () (_ BitVec 32))

(assert (=> mapNonEmpty!25556 (= (arr!23109 _values!688) (store mapRest!25556 mapKey!25556 mapValue!25556))))

(declare-fun b!846664 () Bool)

(assert (=> b!846664 (= e!472519 false)))

(declare-fun v!557 () V!26341)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10490 0))(
  ( (tuple2!10491 (_1!5256 (_ BitVec 64)) (_2!5256 V!26341)) )
))
(declare-datatypes ((List!16352 0))(
  ( (Nil!16349) (Cons!16348 (h!17479 tuple2!10490) (t!22723 List!16352)) )
))
(declare-datatypes ((ListLongMap!9259 0))(
  ( (ListLongMap!9260 (toList!4645 List!16352)) )
))
(declare-fun lt!381576 () ListLongMap!9259)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26341)

(declare-fun zeroValue!654 () V!26341)

(declare-fun getCurrentListMapNoExtraKeys!2630 (array!48154 array!48156 (_ BitVec 32) (_ BitVec 32) V!26341 V!26341 (_ BitVec 32) Int) ListLongMap!9259)

(assert (=> b!846664 (= lt!381576 (getCurrentListMapNoExtraKeys!2630 _keys!868 (array!48157 (store (arr!23109 _values!688) i!612 (ValueCellFull!7546 v!557)) (size!23549 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381577 () ListLongMap!9259)

(assert (=> b!846664 (= lt!381577 (getCurrentListMapNoExtraKeys!2630 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846666 () Bool)

(declare-fun res!575232 () Bool)

(assert (=> b!846666 (=> (not res!575232) (not e!472519))))

(assert (=> b!846666 (= res!575232 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23548 _keys!868))))))

(declare-fun b!846667 () Bool)

(declare-fun res!575233 () Bool)

(assert (=> b!846667 (=> (not res!575233) (not e!472519))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846667 (= res!575233 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!25556 () Bool)

(assert (=> mapIsEmpty!25556 mapRes!25556))

(declare-fun b!846668 () Bool)

(declare-fun res!575236 () Bool)

(assert (=> b!846668 (=> (not res!575236) (not e!472519))))

(assert (=> b!846668 (= res!575236 (and (= (size!23549 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23548 _keys!868) (size!23549 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846669 () Bool)

(declare-fun res!575234 () Bool)

(assert (=> b!846669 (=> (not res!575234) (not e!472519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48154 (_ BitVec 32)) Bool)

(assert (=> b!846669 (= res!575234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846670 () Bool)

(declare-fun res!575231 () Bool)

(assert (=> b!846670 (=> (not res!575231) (not e!472519))))

(assert (=> b!846670 (= res!575231 (and (= (select (arr!23108 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!846671 () Bool)

(declare-fun e!472520 () Bool)

(assert (=> b!846671 (= e!472520 tp_is_empty!15971)))

(declare-fun b!846665 () Bool)

(declare-fun e!472521 () Bool)

(assert (=> b!846665 (= e!472521 (and e!472520 mapRes!25556))))

(declare-fun condMapEmpty!25556 () Bool)

(declare-fun mapDefault!25556 () ValueCell!7546)

