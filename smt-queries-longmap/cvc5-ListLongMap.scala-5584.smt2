; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73288 () Bool)

(assert start!73288)

(declare-fun b_free!14203 () Bool)

(declare-fun b_next!14203 () Bool)

(assert (=> start!73288 (= b_free!14203 (not b_next!14203))))

(declare-fun tp!50112 () Bool)

(declare-fun b_and!23559 () Bool)

(assert (=> start!73288 (= tp!50112 b_and!23559)))

(declare-fun b!854875 () Bool)

(declare-fun res!580550 () Bool)

(declare-fun e!476668 () Bool)

(assert (=> b!854875 (=> (not res!580550) (not e!476668))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854875 (= res!580550 (validMask!0 mask!1196))))

(declare-fun b!854876 () Bool)

(declare-fun res!580548 () Bool)

(assert (=> b!854876 (=> (not res!580548) (not e!476668))))

(declare-datatypes ((array!48874 0))(
  ( (array!48875 (arr!23468 (Array (_ BitVec 32) (_ BitVec 64))) (size!23908 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48874)

(declare-datatypes ((List!16636 0))(
  ( (Nil!16633) (Cons!16632 (h!17763 (_ BitVec 64)) (t!23277 List!16636)) )
))
(declare-fun arrayNoDuplicates!0 (array!48874 (_ BitVec 32) List!16636) Bool)

(assert (=> b!854876 (= res!580548 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16633))))

(declare-fun b!854877 () Bool)

(assert (=> b!854877 (= e!476668 false)))

(declare-datatypes ((V!26833 0))(
  ( (V!26834 (val!8217 Int)) )
))
(declare-datatypes ((tuple2!10822 0))(
  ( (tuple2!10823 (_1!5422 (_ BitVec 64)) (_2!5422 V!26833)) )
))
(declare-datatypes ((List!16637 0))(
  ( (Nil!16634) (Cons!16633 (h!17764 tuple2!10822) (t!23278 List!16637)) )
))
(declare-datatypes ((ListLongMap!9591 0))(
  ( (ListLongMap!9592 (toList!4811 List!16637)) )
))
(declare-fun lt!385596 () ListLongMap!9591)

(declare-fun v!557 () V!26833)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7730 0))(
  ( (ValueCellFull!7730 (v!10642 V!26833)) (EmptyCell!7730) )
))
(declare-datatypes ((array!48876 0))(
  ( (array!48877 (arr!23469 (Array (_ BitVec 32) ValueCell!7730)) (size!23909 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48876)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26833)

(declare-fun zeroValue!654 () V!26833)

(declare-fun getCurrentListMapNoExtraKeys!2792 (array!48874 array!48876 (_ BitVec 32) (_ BitVec 32) V!26833 V!26833 (_ BitVec 32) Int) ListLongMap!9591)

(assert (=> b!854877 (= lt!385596 (getCurrentListMapNoExtraKeys!2792 _keys!868 (array!48877 (store (arr!23469 _values!688) i!612 (ValueCellFull!7730 v!557)) (size!23909 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385597 () ListLongMap!9591)

(assert (=> b!854877 (= lt!385597 (getCurrentListMapNoExtraKeys!2792 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854878 () Bool)

(declare-fun e!476665 () Bool)

(declare-fun e!476666 () Bool)

(declare-fun mapRes!26108 () Bool)

(assert (=> b!854878 (= e!476665 (and e!476666 mapRes!26108))))

(declare-fun condMapEmpty!26108 () Bool)

(declare-fun mapDefault!26108 () ValueCell!7730)

