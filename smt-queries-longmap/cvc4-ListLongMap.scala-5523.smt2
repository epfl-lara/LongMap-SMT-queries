; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72926 () Bool)

(assert start!72926)

(declare-fun b_free!13841 () Bool)

(declare-fun b_next!13841 () Bool)

(assert (=> start!72926 (= b_free!13841 (not b_next!13841))))

(declare-fun tp!49026 () Bool)

(declare-fun b_and!22927 () Bool)

(assert (=> start!72926 (= tp!49026 b_and!22927)))

(declare-fun mapNonEmpty!25565 () Bool)

(declare-fun mapRes!25565 () Bool)

(declare-fun tp!49027 () Bool)

(declare-fun e!472565 () Bool)

(assert (=> mapNonEmpty!25565 (= mapRes!25565 (and tp!49027 e!472565))))

(declare-datatypes ((V!26349 0))(
  ( (V!26350 (val!8036 Int)) )
))
(declare-datatypes ((ValueCell!7549 0))(
  ( (ValueCellFull!7549 (v!10461 V!26349)) (EmptyCell!7549) )
))
(declare-fun mapRest!25565 () (Array (_ BitVec 32) ValueCell!7549))

(declare-fun mapKey!25565 () (_ BitVec 32))

(declare-fun mapValue!25565 () ValueCell!7549)

(declare-datatypes ((array!48166 0))(
  ( (array!48167 (arr!23114 (Array (_ BitVec 32) ValueCell!7549)) (size!23554 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48166)

(assert (=> mapNonEmpty!25565 (= (arr!23114 _values!688) (store mapRest!25565 mapKey!25565 mapValue!25565))))

(declare-fun b!846760 () Bool)

(declare-fun res!575303 () Bool)

(declare-fun e!472563 () Bool)

(assert (=> b!846760 (=> (not res!575303) (not e!472563))))

(declare-datatypes ((array!48168 0))(
  ( (array!48169 (arr!23115 (Array (_ BitVec 32) (_ BitVec 64))) (size!23555 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48168)

(declare-datatypes ((List!16356 0))(
  ( (Nil!16353) (Cons!16352 (h!17483 (_ BitVec 64)) (t!22727 List!16356)) )
))
(declare-fun arrayNoDuplicates!0 (array!48168 (_ BitVec 32) List!16356) Bool)

(assert (=> b!846760 (= res!575303 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16353))))

(declare-fun res!575305 () Bool)

(assert (=> start!72926 (=> (not res!575305) (not e!472563))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72926 (= res!575305 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23555 _keys!868))))))

(assert (=> start!72926 e!472563))

(declare-fun tp_is_empty!15977 () Bool)

(assert (=> start!72926 tp_is_empty!15977))

(assert (=> start!72926 true))

(assert (=> start!72926 tp!49026))

(declare-fun array_inv!18358 (array!48168) Bool)

(assert (=> start!72926 (array_inv!18358 _keys!868)))

(declare-fun e!472564 () Bool)

(declare-fun array_inv!18359 (array!48166) Bool)

(assert (=> start!72926 (and (array_inv!18359 _values!688) e!472564)))

(declare-fun b!846761 () Bool)

(assert (=> b!846761 (= e!472563 false)))

(declare-fun v!557 () V!26349)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10494 0))(
  ( (tuple2!10495 (_1!5258 (_ BitVec 64)) (_2!5258 V!26349)) )
))
(declare-datatypes ((List!16357 0))(
  ( (Nil!16354) (Cons!16353 (h!17484 tuple2!10494) (t!22728 List!16357)) )
))
(declare-datatypes ((ListLongMap!9263 0))(
  ( (ListLongMap!9264 (toList!4647 List!16357)) )
))
(declare-fun lt!381595 () ListLongMap!9263)

(declare-fun minValue!654 () V!26349)

(declare-fun zeroValue!654 () V!26349)

(declare-fun getCurrentListMapNoExtraKeys!2632 (array!48168 array!48166 (_ BitVec 32) (_ BitVec 32) V!26349 V!26349 (_ BitVec 32) Int) ListLongMap!9263)

(assert (=> b!846761 (= lt!381595 (getCurrentListMapNoExtraKeys!2632 _keys!868 (array!48167 (store (arr!23114 _values!688) i!612 (ValueCellFull!7549 v!557)) (size!23554 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381594 () ListLongMap!9263)

(assert (=> b!846761 (= lt!381594 (getCurrentListMapNoExtraKeys!2632 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846762 () Bool)

(declare-fun res!575307 () Bool)

(assert (=> b!846762 (=> (not res!575307) (not e!472563))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!846762 (= res!575307 (and (= (select (arr!23115 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!846763 () Bool)

(declare-fun res!575308 () Bool)

(assert (=> b!846763 (=> (not res!575308) (not e!472563))))

(assert (=> b!846763 (= res!575308 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23555 _keys!868))))))

(declare-fun b!846764 () Bool)

(declare-fun res!575302 () Bool)

(assert (=> b!846764 (=> (not res!575302) (not e!472563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846764 (= res!575302 (validMask!0 mask!1196))))

(declare-fun b!846765 () Bool)

(assert (=> b!846765 (= e!472565 tp_is_empty!15977)))

(declare-fun mapIsEmpty!25565 () Bool)

(assert (=> mapIsEmpty!25565 mapRes!25565))

(declare-fun b!846766 () Bool)

(declare-fun res!575306 () Bool)

(assert (=> b!846766 (=> (not res!575306) (not e!472563))))

(assert (=> b!846766 (= res!575306 (and (= (size!23554 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23555 _keys!868) (size!23554 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846767 () Bool)

(declare-fun e!472566 () Bool)

(assert (=> b!846767 (= e!472564 (and e!472566 mapRes!25565))))

(declare-fun condMapEmpty!25565 () Bool)

(declare-fun mapDefault!25565 () ValueCell!7549)

