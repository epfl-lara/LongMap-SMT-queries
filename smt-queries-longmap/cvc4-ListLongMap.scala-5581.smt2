; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73274 () Bool)

(assert start!73274)

(declare-fun b_free!14189 () Bool)

(declare-fun b_next!14189 () Bool)

(assert (=> start!73274 (= b_free!14189 (not b_next!14189))))

(declare-fun tp!50070 () Bool)

(declare-fun b_and!23537 () Bool)

(assert (=> start!73274 (= tp!50070 b_and!23537)))

(declare-fun b!854596 () Bool)

(declare-fun res!580367 () Bool)

(declare-fun e!476535 () Bool)

(assert (=> b!854596 (=> (not res!580367) (not e!476535))))

(declare-datatypes ((array!48848 0))(
  ( (array!48849 (arr!23455 (Array (_ BitVec 32) (_ BitVec 64))) (size!23895 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48848)

(declare-datatypes ((List!16626 0))(
  ( (Nil!16623) (Cons!16622 (h!17753 (_ BitVec 64)) (t!23261 List!16626)) )
))
(declare-fun arrayNoDuplicates!0 (array!48848 (_ BitVec 32) List!16626) Bool)

(assert (=> b!854596 (= res!580367 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16623))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38419 () Bool)

(declare-datatypes ((V!26813 0))(
  ( (V!26814 (val!8210 Int)) )
))
(declare-datatypes ((ValueCell!7723 0))(
  ( (ValueCellFull!7723 (v!10635 V!26813)) (EmptyCell!7723) )
))
(declare-datatypes ((array!48850 0))(
  ( (array!48851 (arr!23456 (Array (_ BitVec 32) ValueCell!7723)) (size!23896 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48850)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26813)

(declare-fun zeroValue!654 () V!26813)

(declare-datatypes ((tuple2!10810 0))(
  ( (tuple2!10811 (_1!5416 (_ BitVec 64)) (_2!5416 V!26813)) )
))
(declare-datatypes ((List!16627 0))(
  ( (Nil!16624) (Cons!16623 (h!17754 tuple2!10810) (t!23262 List!16627)) )
))
(declare-datatypes ((ListLongMap!9579 0))(
  ( (ListLongMap!9580 (toList!4805 List!16627)) )
))
(declare-fun call!38423 () ListLongMap!9579)

(declare-fun getCurrentListMapNoExtraKeys!2786 (array!48848 array!48850 (_ BitVec 32) (_ BitVec 32) V!26813 V!26813 (_ BitVec 32) Int) ListLongMap!9579)

(assert (=> bm!38419 (= call!38423 (getCurrentListMapNoExtraKeys!2786 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854597 () Bool)

(declare-fun e!476532 () Bool)

(declare-fun e!476529 () Bool)

(declare-fun mapRes!26087 () Bool)

(assert (=> b!854597 (= e!476532 (and e!476529 mapRes!26087))))

(declare-fun condMapEmpty!26087 () Bool)

(declare-fun mapDefault!26087 () ValueCell!7723)

