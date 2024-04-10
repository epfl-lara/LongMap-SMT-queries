; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73804 () Bool)

(assert start!73804)

(declare-fun b_free!14719 () Bool)

(declare-fun b_next!14719 () Bool)

(assert (=> start!73804 (= b_free!14719 (not b_next!14719))))

(declare-fun tp!51661 () Bool)

(declare-fun b_and!24417 () Bool)

(assert (=> start!73804 (= tp!51661 b_and!24417)))

(declare-fun b!866225 () Bool)

(declare-fun res!588569 () Bool)

(declare-fun e!482535 () Bool)

(assert (=> b!866225 (=> (not res!588569) (not e!482535))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49870 0))(
  ( (array!49871 (arr!23966 (Array (_ BitVec 32) (_ BitVec 64))) (size!24406 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49870)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866225 (= res!588569 (and (= (select (arr!23966 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!866227 () Bool)

(declare-fun res!588567 () Bool)

(assert (=> b!866227 (=> (not res!588567) (not e!482535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866227 (= res!588567 (validKeyInArray!0 k!854))))

(declare-fun b!866228 () Bool)

(declare-fun e!482538 () Bool)

(assert (=> b!866228 (= e!482535 e!482538)))

(declare-fun res!588568 () Bool)

(assert (=> b!866228 (=> (not res!588568) (not e!482538))))

(assert (=> b!866228 (= res!588568 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27521 0))(
  ( (V!27522 (val!8475 Int)) )
))
(declare-datatypes ((tuple2!11236 0))(
  ( (tuple2!11237 (_1!5629 (_ BitVec 64)) (_2!5629 V!27521)) )
))
(declare-datatypes ((List!17038 0))(
  ( (Nil!17035) (Cons!17034 (h!18165 tuple2!11236) (t!24023 List!17038)) )
))
(declare-datatypes ((ListLongMap!10005 0))(
  ( (ListLongMap!10006 (toList!5018 List!17038)) )
))
(declare-fun lt!392914 () ListLongMap!10005)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7988 0))(
  ( (ValueCellFull!7988 (v!10900 V!27521)) (EmptyCell!7988) )
))
(declare-datatypes ((array!49872 0))(
  ( (array!49873 (arr!23967 (Array (_ BitVec 32) ValueCell!7988)) (size!24407 (_ BitVec 32))) )
))
(declare-fun lt!392909 () array!49872)

(declare-fun minValue!654 () V!27521)

(declare-fun zeroValue!654 () V!27521)

(declare-fun getCurrentListMapNoExtraKeys!2989 (array!49870 array!49872 (_ BitVec 32) (_ BitVec 32) V!27521 V!27521 (_ BitVec 32) Int) ListLongMap!10005)

(assert (=> b!866228 (= lt!392914 (getCurrentListMapNoExtraKeys!2989 _keys!868 lt!392909 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27521)

(declare-fun _values!688 () array!49872)

(assert (=> b!866228 (= lt!392909 (array!49873 (store (arr!23967 _values!688) i!612 (ValueCellFull!7988 v!557)) (size!24407 _values!688)))))

(declare-fun lt!392910 () ListLongMap!10005)

(assert (=> b!866228 (= lt!392910 (getCurrentListMapNoExtraKeys!2989 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866229 () Bool)

(declare-fun e!482533 () Bool)

(declare-fun tp_is_empty!16855 () Bool)

(assert (=> b!866229 (= e!482533 tp_is_empty!16855)))

(declare-fun b!866230 () Bool)

(declare-fun e!482532 () Bool)

(declare-fun e!482539 () Bool)

(declare-fun mapRes!26882 () Bool)

(assert (=> b!866230 (= e!482532 (and e!482539 mapRes!26882))))

(declare-fun condMapEmpty!26882 () Bool)

(declare-fun mapDefault!26882 () ValueCell!7988)

