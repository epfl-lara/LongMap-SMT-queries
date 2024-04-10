; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73762 () Bool)

(assert start!73762)

(declare-fun b_free!14677 () Bool)

(declare-fun b_next!14677 () Bool)

(assert (=> start!73762 (= b_free!14677 (not b_next!14677))))

(declare-fun tp!51534 () Bool)

(declare-fun b_and!24333 () Bool)

(assert (=> start!73762 (= tp!51534 b_and!24333)))

(declare-fun b!865175 () Bool)

(declare-fun e!481971 () Bool)

(assert (=> b!865175 (= e!481971 true)))

(declare-datatypes ((V!27465 0))(
  ( (V!27466 (val!8454 Int)) )
))
(declare-datatypes ((tuple2!11204 0))(
  ( (tuple2!11205 (_1!5613 (_ BitVec 64)) (_2!5613 V!27465)) )
))
(declare-datatypes ((List!17007 0))(
  ( (Nil!17004) (Cons!17003 (h!18134 tuple2!11204) (t!23950 List!17007)) )
))
(declare-datatypes ((ListLongMap!9973 0))(
  ( (ListLongMap!9974 (toList!5002 List!17007)) )
))
(declare-fun lt!391907 () ListLongMap!9973)

(declare-fun lt!391905 () ListLongMap!9973)

(declare-fun lt!391901 () tuple2!11204)

(declare-fun lt!391906 () tuple2!11204)

(declare-fun +!2351 (ListLongMap!9973 tuple2!11204) ListLongMap!9973)

(assert (=> b!865175 (= lt!391907 (+!2351 (+!2351 lt!391905 lt!391901) lt!391906))))

(declare-fun v!557 () V!27465)

(declare-fun lt!391902 () V!27465)

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49786 0))(
  ( (array!49787 (arr!23924 (Array (_ BitVec 32) (_ BitVec 64))) (size!24364 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49786)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((Unit!29625 0))(
  ( (Unit!29626) )
))
(declare-fun lt!391912 () Unit!29625)

(declare-fun addCommutativeForDiffKeys!520 (ListLongMap!9973 (_ BitVec 64) V!27465 (_ BitVec 64) V!27465) Unit!29625)

(assert (=> b!865175 (= lt!391912 (addCommutativeForDiffKeys!520 lt!391905 k!854 v!557 (select (arr!23924 _keys!868) from!1053) lt!391902))))

(declare-fun b!865176 () Bool)

(declare-fun e!481968 () Unit!29625)

(declare-fun Unit!29627 () Unit!29625)

(assert (=> b!865176 (= e!481968 Unit!29627)))

(declare-fun b!865177 () Bool)

(declare-fun e!481964 () Bool)

(declare-fun e!481970 () Bool)

(assert (=> b!865177 (= e!481964 e!481970)))

(declare-fun res!587869 () Bool)

(assert (=> b!865177 (=> (not res!587869) (not e!481970))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865177 (= res!587869 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7967 0))(
  ( (ValueCellFull!7967 (v!10879 V!27465)) (EmptyCell!7967) )
))
(declare-datatypes ((array!49788 0))(
  ( (array!49789 (arr!23925 (Array (_ BitVec 32) ValueCell!7967)) (size!24365 (_ BitVec 32))) )
))
(declare-fun lt!391904 () array!49788)

(declare-fun lt!391899 () ListLongMap!9973)

(declare-fun minValue!654 () V!27465)

(declare-fun zeroValue!654 () V!27465)

(declare-fun getCurrentListMapNoExtraKeys!2973 (array!49786 array!49788 (_ BitVec 32) (_ BitVec 32) V!27465 V!27465 (_ BitVec 32) Int) ListLongMap!9973)

(assert (=> b!865177 (= lt!391899 (getCurrentListMapNoExtraKeys!2973 _keys!868 lt!391904 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!49788)

(assert (=> b!865177 (= lt!391904 (array!49789 (store (arr!23925 _values!688) i!612 (ValueCellFull!7967 v!557)) (size!24365 _values!688)))))

(declare-fun lt!391898 () ListLongMap!9973)

(assert (=> b!865177 (= lt!391898 (getCurrentListMapNoExtraKeys!2973 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865178 () Bool)

(declare-fun e!481972 () Bool)

(declare-fun e!481969 () Bool)

(declare-fun mapRes!26819 () Bool)

(assert (=> b!865178 (= e!481972 (and e!481969 mapRes!26819))))

(declare-fun condMapEmpty!26819 () Bool)

(declare-fun mapDefault!26819 () ValueCell!7967)

