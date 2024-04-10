; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73714 () Bool)

(assert start!73714)

(declare-fun b_free!14629 () Bool)

(declare-fun b_next!14629 () Bool)

(assert (=> start!73714 (= b_free!14629 (not b_next!14629))))

(declare-fun tp!51390 () Bool)

(declare-fun b_and!24237 () Bool)

(assert (=> start!73714 (= tp!51390 b_and!24237)))

(declare-fun b!863975 () Bool)

(declare-fun res!587084 () Bool)

(declare-fun e!481316 () Bool)

(assert (=> b!863975 (=> (not res!587084) (not e!481316))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49692 0))(
  ( (array!49693 (arr!23877 (Array (_ BitVec 32) (_ BitVec 64))) (size!24317 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49692)

(declare-datatypes ((V!27401 0))(
  ( (V!27402 (val!8430 Int)) )
))
(declare-datatypes ((ValueCell!7943 0))(
  ( (ValueCellFull!7943 (v!10855 V!27401)) (EmptyCell!7943) )
))
(declare-datatypes ((array!49694 0))(
  ( (array!49695 (arr!23878 (Array (_ BitVec 32) ValueCell!7943)) (size!24318 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49694)

(assert (=> b!863975 (= res!587084 (and (= (size!24318 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24317 _keys!868) (size!24318 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863976 () Bool)

(declare-fun e!481317 () Bool)

(declare-fun tp_is_empty!16765 () Bool)

(assert (=> b!863976 (= e!481317 tp_is_empty!16765)))

(declare-fun b!863977 () Bool)

(declare-fun res!587080 () Bool)

(assert (=> b!863977 (=> (not res!587080) (not e!481316))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!863977 (= res!587080 (and (= (select (arr!23877 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863978 () Bool)

(declare-fun e!481322 () Bool)

(assert (=> b!863978 (= e!481322 tp_is_empty!16765)))

(declare-fun b!863979 () Bool)

(declare-fun res!587079 () Bool)

(assert (=> b!863979 (=> (not res!587079) (not e!481316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863979 (= res!587079 (validMask!0 mask!1196))))

(declare-fun b!863980 () Bool)

(declare-fun e!481324 () Bool)

(assert (=> b!863980 (= e!481324 true)))

(declare-datatypes ((tuple2!11162 0))(
  ( (tuple2!11163 (_1!5592 (_ BitVec 64)) (_2!5592 V!27401)) )
))
(declare-datatypes ((List!16968 0))(
  ( (Nil!16965) (Cons!16964 (h!18095 tuple2!11162) (t!23863 List!16968)) )
))
(declare-datatypes ((ListLongMap!9931 0))(
  ( (ListLongMap!9932 (toList!4981 List!16968)) )
))
(declare-fun lt!390748 () ListLongMap!9931)

(declare-fun lt!390757 () tuple2!11162)

(declare-fun lt!390752 () ListLongMap!9931)

(declare-fun lt!390745 () tuple2!11162)

(declare-fun +!2330 (ListLongMap!9931 tuple2!11162) ListLongMap!9931)

(assert (=> b!863980 (= lt!390752 (+!2330 (+!2330 lt!390748 lt!390745) lt!390757))))

(declare-fun lt!390760 () V!27401)

(declare-fun v!557 () V!27401)

(declare-datatypes ((Unit!29547 0))(
  ( (Unit!29548) )
))
(declare-fun lt!390758 () Unit!29547)

(declare-fun addCommutativeForDiffKeys!503 (ListLongMap!9931 (_ BitVec 64) V!27401 (_ BitVec 64) V!27401) Unit!29547)

(assert (=> b!863980 (= lt!390758 (addCommutativeForDiffKeys!503 lt!390748 k!854 v!557 (select (arr!23877 _keys!868) from!1053) lt!390760))))

(declare-fun b!863981 () Bool)

(declare-fun e!481321 () Bool)

(declare-fun mapRes!26747 () Bool)

(assert (=> b!863981 (= e!481321 (and e!481317 mapRes!26747))))

(declare-fun condMapEmpty!26747 () Bool)

(declare-fun mapDefault!26747 () ValueCell!7943)

