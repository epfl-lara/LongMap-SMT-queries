; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73250 () Bool)

(assert start!73250)

(declare-fun b_free!14165 () Bool)

(declare-fun b_next!14165 () Bool)

(assert (=> start!73250 (= b_free!14165 (not b_next!14165))))

(declare-fun tp!49998 () Bool)

(declare-fun b_and!23489 () Bool)

(assert (=> start!73250 (= tp!49998 b_and!23489)))

(declare-fun b!854032 () Bool)

(declare-fun e!476241 () Bool)

(declare-fun tp_is_empty!16301 () Bool)

(assert (=> b!854032 (= e!476241 tp_is_empty!16301)))

(declare-fun b!854033 () Bool)

(declare-fun e!476246 () Bool)

(declare-fun e!476247 () Bool)

(assert (=> b!854033 (= e!476246 e!476247)))

(declare-fun res!580006 () Bool)

(assert (=> b!854033 (=> (not res!580006) (not e!476247))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854033 (= res!580006 (= from!1053 i!612))))

(declare-datatypes ((V!26781 0))(
  ( (V!26782 (val!8198 Int)) )
))
(declare-datatypes ((tuple2!10786 0))(
  ( (tuple2!10787 (_1!5404 (_ BitVec 64)) (_2!5404 V!26781)) )
))
(declare-datatypes ((List!16606 0))(
  ( (Nil!16603) (Cons!16602 (h!17733 tuple2!10786) (t!23217 List!16606)) )
))
(declare-datatypes ((ListLongMap!9555 0))(
  ( (ListLongMap!9556 (toList!4793 List!16606)) )
))
(declare-fun lt!385118 () ListLongMap!9555)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7711 0))(
  ( (ValueCellFull!7711 (v!10623 V!26781)) (EmptyCell!7711) )
))
(declare-datatypes ((array!48800 0))(
  ( (array!48801 (arr!23431 (Array (_ BitVec 32) ValueCell!7711)) (size!23871 (_ BitVec 32))) )
))
(declare-fun lt!385122 () array!48800)

(declare-datatypes ((array!48802 0))(
  ( (array!48803 (arr!23432 (Array (_ BitVec 32) (_ BitVec 64))) (size!23872 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48802)

(declare-fun minValue!654 () V!26781)

(declare-fun zeroValue!654 () V!26781)

(declare-fun getCurrentListMapNoExtraKeys!2774 (array!48802 array!48800 (_ BitVec 32) (_ BitVec 32) V!26781 V!26781 (_ BitVec 32) Int) ListLongMap!9555)

(assert (=> b!854033 (= lt!385118 (getCurrentListMapNoExtraKeys!2774 _keys!868 lt!385122 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26781)

(declare-fun _values!688 () array!48800)

(assert (=> b!854033 (= lt!385122 (array!48801 (store (arr!23431 _values!688) i!612 (ValueCellFull!7711 v!557)) (size!23871 _values!688)))))

(declare-fun lt!385115 () ListLongMap!9555)

(assert (=> b!854033 (= lt!385115 (getCurrentListMapNoExtraKeys!2774 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854034 () Bool)

(declare-fun e!476242 () Bool)

(declare-fun mapRes!26051 () Bool)

(assert (=> b!854034 (= e!476242 (and e!476241 mapRes!26051))))

(declare-fun condMapEmpty!26051 () Bool)

(declare-fun mapDefault!26051 () ValueCell!7711)

