; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73144 () Bool)

(assert start!73144)

(declare-fun b_free!14059 () Bool)

(declare-fun b_next!14059 () Bool)

(assert (=> start!73144 (= b_free!14059 (not b_next!14059))))

(declare-fun tp!49681 () Bool)

(declare-fun b_and!23277 () Bool)

(assert (=> start!73144 (= tp!49681 b_and!23277)))

(declare-fun b!851541 () Bool)

(declare-fun e!474970 () Bool)

(declare-fun e!474975 () Bool)

(assert (=> b!851541 (= e!474970 e!474975)))

(declare-fun res!578414 () Bool)

(assert (=> b!851541 (=> (not res!578414) (not e!474975))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851541 (= res!578414 (= from!1053 i!612))))

(declare-datatypes ((V!26641 0))(
  ( (V!26642 (val!8145 Int)) )
))
(declare-datatypes ((tuple2!10686 0))(
  ( (tuple2!10687 (_1!5354 (_ BitVec 64)) (_2!5354 V!26641)) )
))
(declare-datatypes ((List!16523 0))(
  ( (Nil!16520) (Cons!16519 (h!17650 tuple2!10686) (t!23028 List!16523)) )
))
(declare-datatypes ((ListLongMap!9455 0))(
  ( (ListLongMap!9456 (toList!4743 List!16523)) )
))
(declare-fun lt!383525 () ListLongMap!9455)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48590 0))(
  ( (array!48591 (arr!23326 (Array (_ BitVec 32) (_ BitVec 64))) (size!23766 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48590)

(declare-fun minValue!654 () V!26641)

(declare-fun zeroValue!654 () V!26641)

(declare-datatypes ((ValueCell!7658 0))(
  ( (ValueCellFull!7658 (v!10570 V!26641)) (EmptyCell!7658) )
))
(declare-datatypes ((array!48592 0))(
  ( (array!48593 (arr!23327 (Array (_ BitVec 32) ValueCell!7658)) (size!23767 (_ BitVec 32))) )
))
(declare-fun lt!383526 () array!48592)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2725 (array!48590 array!48592 (_ BitVec 32) (_ BitVec 32) V!26641 V!26641 (_ BitVec 32) Int) ListLongMap!9455)

(assert (=> b!851541 (= lt!383525 (getCurrentListMapNoExtraKeys!2725 _keys!868 lt!383526 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26641)

(declare-fun _values!688 () array!48592)

(assert (=> b!851541 (= lt!383526 (array!48593 (store (arr!23327 _values!688) i!612 (ValueCellFull!7658 v!557)) (size!23767 _values!688)))))

(declare-fun lt!383532 () ListLongMap!9455)

(assert (=> b!851541 (= lt!383532 (getCurrentListMapNoExtraKeys!2725 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851542 () Bool)

(declare-fun e!474976 () Bool)

(declare-fun tp_is_empty!16195 () Bool)

(assert (=> b!851542 (= e!474976 tp_is_empty!16195)))

(declare-fun b!851543 () Bool)

(declare-fun e!474973 () Bool)

(declare-fun e!474974 () Bool)

(declare-fun mapRes!25892 () Bool)

(assert (=> b!851543 (= e!474973 (and e!474974 mapRes!25892))))

(declare-fun condMapEmpty!25892 () Bool)

(declare-fun mapDefault!25892 () ValueCell!7658)

