; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73832 () Bool)

(assert start!73832)

(declare-fun b_free!14747 () Bool)

(declare-fun b_next!14747 () Bool)

(assert (=> start!73832 (= b_free!14747 (not b_next!14747))))

(declare-fun tp!51745 () Bool)

(declare-fun b_and!24473 () Bool)

(assert (=> start!73832 (= tp!51745 b_and!24473)))

(declare-fun b!866925 () Bool)

(declare-fun res!589031 () Bool)

(declare-fun e!482916 () Bool)

(assert (=> b!866925 (=> (not res!589031) (not e!482916))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866925 (= res!589031 (validKeyInArray!0 k!854))))

(declare-fun b!866926 () Bool)

(declare-fun e!482911 () Bool)

(assert (=> b!866926 (= e!482916 e!482911)))

(declare-fun res!589026 () Bool)

(assert (=> b!866926 (=> (not res!589026) (not e!482911))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!866926 (= res!589026 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27557 0))(
  ( (V!27558 (val!8489 Int)) )
))
(declare-datatypes ((ValueCell!8002 0))(
  ( (ValueCellFull!8002 (v!10914 V!27557)) (EmptyCell!8002) )
))
(declare-datatypes ((array!49926 0))(
  ( (array!49927 (arr!23994 (Array (_ BitVec 32) ValueCell!8002)) (size!24434 (_ BitVec 32))) )
))
(declare-fun lt!393580 () array!49926)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49928 0))(
  ( (array!49929 (arr!23995 (Array (_ BitVec 32) (_ BitVec 64))) (size!24435 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49928)

(declare-fun minValue!654 () V!27557)

(declare-fun zeroValue!654 () V!27557)

(declare-datatypes ((tuple2!11260 0))(
  ( (tuple2!11261 (_1!5641 (_ BitVec 64)) (_2!5641 V!27557)) )
))
(declare-datatypes ((List!17059 0))(
  ( (Nil!17056) (Cons!17055 (h!18186 tuple2!11260) (t!24072 List!17059)) )
))
(declare-datatypes ((ListLongMap!10029 0))(
  ( (ListLongMap!10030 (toList!5030 List!17059)) )
))
(declare-fun lt!393582 () ListLongMap!10029)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3000 (array!49928 array!49926 (_ BitVec 32) (_ BitVec 32) V!27557 V!27557 (_ BitVec 32) Int) ListLongMap!10029)

(assert (=> b!866926 (= lt!393582 (getCurrentListMapNoExtraKeys!3000 _keys!868 lt!393580 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27557)

(declare-fun _values!688 () array!49926)

(assert (=> b!866926 (= lt!393580 (array!49927 (store (arr!23994 _values!688) i!612 (ValueCellFull!8002 v!557)) (size!24434 _values!688)))))

(declare-fun lt!393586 () ListLongMap!10029)

(assert (=> b!866926 (= lt!393586 (getCurrentListMapNoExtraKeys!3000 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26924 () Bool)

(declare-fun mapRes!26924 () Bool)

(assert (=> mapIsEmpty!26924 mapRes!26924))

(declare-fun b!866927 () Bool)

(declare-fun e!482915 () Bool)

(declare-fun tp_is_empty!16883 () Bool)

(assert (=> b!866927 (= e!482915 tp_is_empty!16883)))

(declare-fun b!866928 () Bool)

(declare-fun e!482913 () Bool)

(assert (=> b!866928 (= e!482913 tp_is_empty!16883)))

(declare-fun b!866929 () Bool)

(declare-fun e!482914 () Bool)

(declare-fun e!482910 () Bool)

(assert (=> b!866929 (= e!482914 e!482910)))

(declare-fun res!589029 () Bool)

(assert (=> b!866929 (=> res!589029 e!482910)))

(assert (=> b!866929 (= res!589029 (= k!854 (select (arr!23995 _keys!868) from!1053)))))

(assert (=> b!866929 (not (= (select (arr!23995 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!29723 0))(
  ( (Unit!29724) )
))
(declare-fun lt!393584 () Unit!29723)

(declare-fun e!482909 () Unit!29723)

(assert (=> b!866929 (= lt!393584 e!482909)))

(declare-fun c!92341 () Bool)

(assert (=> b!866929 (= c!92341 (= (select (arr!23995 _keys!868) from!1053) k!854))))

(declare-fun lt!393577 () ListLongMap!10029)

(assert (=> b!866929 (= lt!393582 lt!393577)))

(declare-fun lt!393585 () ListLongMap!10029)

(declare-fun lt!393578 () tuple2!11260)

(declare-fun +!2376 (ListLongMap!10029 tuple2!11260) ListLongMap!10029)

(assert (=> b!866929 (= lt!393577 (+!2376 lt!393585 lt!393578))))

(declare-fun lt!393583 () V!27557)

(assert (=> b!866929 (= lt!393578 (tuple2!11261 (select (arr!23995 _keys!868) from!1053) lt!393583))))

(declare-fun get!12686 (ValueCell!8002 V!27557) V!27557)

(declare-fun dynLambda!1194 (Int (_ BitVec 64)) V!27557)

(assert (=> b!866929 (= lt!393583 (get!12686 (select (arr!23994 _values!688) from!1053) (dynLambda!1194 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!589025 () Bool)

(assert (=> start!73832 (=> (not res!589025) (not e!482916))))

(assert (=> start!73832 (= res!589025 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24435 _keys!868))))))

(assert (=> start!73832 e!482916))

(assert (=> start!73832 tp_is_empty!16883))

(assert (=> start!73832 true))

(assert (=> start!73832 tp!51745))

(declare-fun array_inv!18962 (array!49928) Bool)

(assert (=> start!73832 (array_inv!18962 _keys!868)))

(declare-fun e!482912 () Bool)

(declare-fun array_inv!18963 (array!49926) Bool)

(assert (=> start!73832 (and (array_inv!18963 _values!688) e!482912)))

(declare-fun b!866930 () Bool)

(declare-fun res!589034 () Bool)

(assert (=> b!866930 (=> (not res!589034) (not e!482916))))

(assert (=> b!866930 (= res!589034 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24435 _keys!868))))))

(declare-fun b!866931 () Bool)

(assert (=> b!866931 (= e!482910 true)))

(declare-fun lt!393589 () tuple2!11260)

(declare-fun lt!393590 () ListLongMap!10029)

(assert (=> b!866931 (= lt!393577 (+!2376 (+!2376 lt!393590 lt!393578) lt!393589))))

(declare-fun lt!393591 () Unit!29723)

(declare-fun addCommutativeForDiffKeys!543 (ListLongMap!10029 (_ BitVec 64) V!27557 (_ BitVec 64) V!27557) Unit!29723)

(assert (=> b!866931 (= lt!393591 (addCommutativeForDiffKeys!543 lt!393590 k!854 v!557 (select (arr!23995 _keys!868) from!1053) lt!393583))))

(declare-fun b!866932 () Bool)

(declare-fun Unit!29725 () Unit!29723)

(assert (=> b!866932 (= e!482909 Unit!29725)))

(declare-fun b!866933 () Bool)

(assert (=> b!866933 (= e!482912 (and e!482913 mapRes!26924))))

(declare-fun condMapEmpty!26924 () Bool)

(declare-fun mapDefault!26924 () ValueCell!8002)

