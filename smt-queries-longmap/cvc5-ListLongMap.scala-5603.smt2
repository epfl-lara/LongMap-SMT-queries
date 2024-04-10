; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73402 () Bool)

(assert start!73402)

(declare-fun b_free!14317 () Bool)

(declare-fun b_next!14317 () Bool)

(assert (=> start!73402 (= b_free!14317 (not b_next!14317))))

(declare-fun tp!50454 () Bool)

(declare-fun b_and!23673 () Bool)

(assert (=> start!73402 (= tp!50454 b_and!23673)))

(declare-fun b!856830 () Bool)

(declare-fun e!477594 () Bool)

(declare-fun e!477595 () Bool)

(assert (=> b!856830 (= e!477594 e!477595)))

(declare-fun res!581994 () Bool)

(assert (=> b!856830 (=> (not res!581994) (not e!477595))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856830 (= res!581994 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26985 0))(
  ( (V!26986 (val!8274 Int)) )
))
(declare-datatypes ((ValueCell!7787 0))(
  ( (ValueCellFull!7787 (v!10699 V!26985)) (EmptyCell!7787) )
))
(declare-datatypes ((array!49098 0))(
  ( (array!49099 (arr!23580 (Array (_ BitVec 32) ValueCell!7787)) (size!24020 (_ BitVec 32))) )
))
(declare-fun lt!386088 () array!49098)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49100 0))(
  ( (array!49101 (arr!23581 (Array (_ BitVec 32) (_ BitVec 64))) (size!24021 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49100)

(declare-fun minValue!654 () V!26985)

(declare-fun zeroValue!654 () V!26985)

(declare-datatypes ((tuple2!10912 0))(
  ( (tuple2!10913 (_1!5467 (_ BitVec 64)) (_2!5467 V!26985)) )
))
(declare-datatypes ((List!16722 0))(
  ( (Nil!16719) (Cons!16718 (h!17849 tuple2!10912) (t!23363 List!16722)) )
))
(declare-datatypes ((ListLongMap!9681 0))(
  ( (ListLongMap!9682 (toList!4856 List!16722)) )
))
(declare-fun lt!386087 () ListLongMap!9681)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2837 (array!49100 array!49098 (_ BitVec 32) (_ BitVec 32) V!26985 V!26985 (_ BitVec 32) Int) ListLongMap!9681)

(assert (=> b!856830 (= lt!386087 (getCurrentListMapNoExtraKeys!2837 _keys!868 lt!386088 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26985)

(declare-fun _values!688 () array!49098)

(assert (=> b!856830 (= lt!386088 (array!49099 (store (arr!23580 _values!688) i!612 (ValueCellFull!7787 v!557)) (size!24020 _values!688)))))

(declare-fun lt!386086 () ListLongMap!9681)

(assert (=> b!856830 (= lt!386086 (getCurrentListMapNoExtraKeys!2837 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856831 () Bool)

(declare-fun res!581996 () Bool)

(assert (=> b!856831 (=> (not res!581996) (not e!477594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856831 (= res!581996 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26279 () Bool)

(declare-fun mapRes!26279 () Bool)

(declare-fun tp!50455 () Bool)

(declare-fun e!477597 () Bool)

(assert (=> mapNonEmpty!26279 (= mapRes!26279 (and tp!50455 e!477597))))

(declare-fun mapKey!26279 () (_ BitVec 32))

(declare-fun mapRest!26279 () (Array (_ BitVec 32) ValueCell!7787))

(declare-fun mapValue!26279 () ValueCell!7787)

(assert (=> mapNonEmpty!26279 (= (arr!23580 _values!688) (store mapRest!26279 mapKey!26279 mapValue!26279))))

(declare-fun b!856832 () Bool)

(declare-fun res!581989 () Bool)

(assert (=> b!856832 (=> (not res!581989) (not e!477594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49100 (_ BitVec 32)) Bool)

(assert (=> b!856832 (= res!581989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856833 () Bool)

(declare-fun e!477593 () Bool)

(declare-fun e!477596 () Bool)

(assert (=> b!856833 (= e!477593 (and e!477596 mapRes!26279))))

(declare-fun condMapEmpty!26279 () Bool)

(declare-fun mapDefault!26279 () ValueCell!7787)

