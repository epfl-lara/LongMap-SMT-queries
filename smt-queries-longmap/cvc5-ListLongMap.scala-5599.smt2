; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73378 () Bool)

(assert start!73378)

(declare-fun b_free!14293 () Bool)

(declare-fun b_next!14293 () Bool)

(assert (=> start!73378 (= b_free!14293 (not b_next!14293))))

(declare-fun tp!50382 () Bool)

(declare-fun b_and!23649 () Bool)

(assert (=> start!73378 (= tp!50382 b_and!23649)))

(declare-fun b!856398 () Bool)

(declare-fun e!477379 () Bool)

(declare-fun tp_is_empty!16429 () Bool)

(assert (=> b!856398 (= e!477379 tp_is_empty!16429)))

(declare-fun b!856399 () Bool)

(declare-fun res!581670 () Bool)

(declare-fun e!477381 () Bool)

(assert (=> b!856399 (=> (not res!581670) (not e!477381))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26953 0))(
  ( (V!26954 (val!8262 Int)) )
))
(declare-datatypes ((ValueCell!7775 0))(
  ( (ValueCellFull!7775 (v!10687 V!26953)) (EmptyCell!7775) )
))
(declare-datatypes ((array!49050 0))(
  ( (array!49051 (arr!23556 (Array (_ BitVec 32) ValueCell!7775)) (size!23996 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49050)

(declare-datatypes ((array!49052 0))(
  ( (array!49053 (arr!23557 (Array (_ BitVec 32) (_ BitVec 64))) (size!23997 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49052)

(assert (=> b!856399 (= res!581670 (and (= (size!23996 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23997 _keys!868) (size!23996 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856400 () Bool)

(declare-fun res!581666 () Bool)

(assert (=> b!856400 (=> (not res!581666) (not e!477381))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856400 (= res!581666 (and (= (select (arr!23557 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!856401 () Bool)

(declare-fun res!581671 () Bool)

(assert (=> b!856401 (=> (not res!581671) (not e!477381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856401 (= res!581671 (validKeyInArray!0 k!854))))

(declare-fun res!581668 () Bool)

(assert (=> start!73378 (=> (not res!581668) (not e!477381))))

(assert (=> start!73378 (= res!581668 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23997 _keys!868))))))

(assert (=> start!73378 e!477381))

(assert (=> start!73378 tp_is_empty!16429))

(assert (=> start!73378 true))

(assert (=> start!73378 tp!50382))

(declare-fun array_inv!18660 (array!49052) Bool)

(assert (=> start!73378 (array_inv!18660 _keys!868)))

(declare-fun e!477378 () Bool)

(declare-fun array_inv!18661 (array!49050) Bool)

(assert (=> start!73378 (and (array_inv!18661 _values!688) e!477378)))

(declare-fun mapNonEmpty!26243 () Bool)

(declare-fun mapRes!26243 () Bool)

(declare-fun tp!50383 () Bool)

(assert (=> mapNonEmpty!26243 (= mapRes!26243 (and tp!50383 e!477379))))

(declare-fun mapValue!26243 () ValueCell!7775)

(declare-fun mapRest!26243 () (Array (_ BitVec 32) ValueCell!7775))

(declare-fun mapKey!26243 () (_ BitVec 32))

(assert (=> mapNonEmpty!26243 (= (arr!23556 _values!688) (store mapRest!26243 mapKey!26243 mapValue!26243))))

(declare-fun b!856402 () Bool)

(declare-fun e!477382 () Bool)

(assert (=> b!856402 (= e!477381 e!477382)))

(declare-fun res!581664 () Bool)

(assert (=> b!856402 (=> (not res!581664) (not e!477382))))

(assert (=> b!856402 (= res!581664 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385945 () array!49050)

(declare-fun minValue!654 () V!26953)

(declare-fun zeroValue!654 () V!26953)

(declare-datatypes ((tuple2!10892 0))(
  ( (tuple2!10893 (_1!5457 (_ BitVec 64)) (_2!5457 V!26953)) )
))
(declare-datatypes ((List!16704 0))(
  ( (Nil!16701) (Cons!16700 (h!17831 tuple2!10892) (t!23345 List!16704)) )
))
(declare-datatypes ((ListLongMap!9661 0))(
  ( (ListLongMap!9662 (toList!4846 List!16704)) )
))
(declare-fun lt!385943 () ListLongMap!9661)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2827 (array!49052 array!49050 (_ BitVec 32) (_ BitVec 32) V!26953 V!26953 (_ BitVec 32) Int) ListLongMap!9661)

(assert (=> b!856402 (= lt!385943 (getCurrentListMapNoExtraKeys!2827 _keys!868 lt!385945 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26953)

(assert (=> b!856402 (= lt!385945 (array!49051 (store (arr!23556 _values!688) i!612 (ValueCellFull!7775 v!557)) (size!23996 _values!688)))))

(declare-fun lt!385944 () ListLongMap!9661)

(assert (=> b!856402 (= lt!385944 (getCurrentListMapNoExtraKeys!2827 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856403 () Bool)

(declare-fun res!581669 () Bool)

(assert (=> b!856403 (=> (not res!581669) (not e!477381))))

(assert (=> b!856403 (= res!581669 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23997 _keys!868))))))

(declare-fun b!856404 () Bool)

(declare-fun res!581665 () Bool)

(assert (=> b!856404 (=> (not res!581665) (not e!477381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856404 (= res!581665 (validMask!0 mask!1196))))

(declare-fun b!856405 () Bool)

(declare-fun e!477380 () Bool)

(assert (=> b!856405 (= e!477380 tp_is_empty!16429)))

(declare-fun b!856406 () Bool)

(assert (=> b!856406 (= e!477378 (and e!477380 mapRes!26243))))

(declare-fun condMapEmpty!26243 () Bool)

(declare-fun mapDefault!26243 () ValueCell!7775)

