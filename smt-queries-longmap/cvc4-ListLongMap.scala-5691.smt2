; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73934 () Bool)

(assert start!73934)

(declare-fun b_free!14849 () Bool)

(declare-fun b_next!14849 () Bool)

(assert (=> start!73934 (= b_free!14849 (not b_next!14849))))

(declare-fun tp!52050 () Bool)

(declare-fun b_and!24601 () Bool)

(assert (=> start!73934 (= tp!52050 b_and!24601)))

(declare-fun b!868935 () Bool)

(declare-fun e!483938 () Bool)

(declare-fun tp_is_empty!16985 () Bool)

(assert (=> b!868935 (= e!483938 tp_is_empty!16985)))

(declare-fun b!868936 () Bool)

(declare-fun res!590475 () Bool)

(declare-fun e!483941 () Bool)

(assert (=> b!868936 (=> (not res!590475) (not e!483941))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50120 0))(
  ( (array!50121 (arr!24091 (Array (_ BitVec 32) (_ BitVec 64))) (size!24531 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50120)

(declare-datatypes ((V!27693 0))(
  ( (V!27694 (val!8540 Int)) )
))
(declare-datatypes ((ValueCell!8053 0))(
  ( (ValueCellFull!8053 (v!10965 V!27693)) (EmptyCell!8053) )
))
(declare-datatypes ((array!50122 0))(
  ( (array!50123 (arr!24092 (Array (_ BitVec 32) ValueCell!8053)) (size!24532 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50122)

(assert (=> b!868936 (= res!590475 (and (= (size!24532 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24531 _keys!868) (size!24532 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868937 () Bool)

(declare-fun res!590478 () Bool)

(assert (=> b!868937 (=> (not res!590478) (not e!483941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868937 (= res!590478 (validMask!0 mask!1196))))

(declare-fun b!868938 () Bool)

(declare-fun res!590477 () Bool)

(assert (=> b!868938 (=> (not res!590477) (not e!483941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50120 (_ BitVec 32)) Bool)

(assert (=> b!868938 (= res!590477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868939 () Bool)

(declare-fun e!483943 () Bool)

(assert (=> b!868939 (= e!483943 (not true))))

(declare-fun v!557 () V!27693)

(declare-fun defaultEntry!696 () Int)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27693)

(declare-fun zeroValue!654 () V!27693)

(declare-fun lt!394635 () array!50122)

(declare-datatypes ((tuple2!11340 0))(
  ( (tuple2!11341 (_1!5681 (_ BitVec 64)) (_2!5681 V!27693)) )
))
(declare-datatypes ((List!17134 0))(
  ( (Nil!17131) (Cons!17130 (h!18261 tuple2!11340) (t!24171 List!17134)) )
))
(declare-datatypes ((ListLongMap!10109 0))(
  ( (ListLongMap!10110 (toList!5070 List!17134)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3039 (array!50120 array!50122 (_ BitVec 32) (_ BitVec 32) V!27693 V!27693 (_ BitVec 32) Int) ListLongMap!10109)

(declare-fun +!2411 (ListLongMap!10109 tuple2!11340) ListLongMap!10109)

(assert (=> b!868939 (= (getCurrentListMapNoExtraKeys!3039 _keys!868 lt!394635 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2411 (getCurrentListMapNoExtraKeys!3039 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11341 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29820 0))(
  ( (Unit!29821) )
))
(declare-fun lt!394636 () Unit!29820)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!605 (array!50120 array!50122 (_ BitVec 32) (_ BitVec 32) V!27693 V!27693 (_ BitVec 32) (_ BitVec 64) V!27693 (_ BitVec 32) Int) Unit!29820)

(assert (=> b!868939 (= lt!394636 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!605 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868940 () Bool)

(declare-fun res!590476 () Bool)

(assert (=> b!868940 (=> (not res!590476) (not e!483941))))

(assert (=> b!868940 (= res!590476 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24531 _keys!868))))))

(declare-fun b!868941 () Bool)

(declare-fun res!590481 () Bool)

(assert (=> b!868941 (=> (not res!590481) (not e!483941))))

(declare-datatypes ((List!17135 0))(
  ( (Nil!17132) (Cons!17131 (h!18262 (_ BitVec 64)) (t!24172 List!17135)) )
))
(declare-fun arrayNoDuplicates!0 (array!50120 (_ BitVec 32) List!17135) Bool)

(assert (=> b!868941 (= res!590481 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17132))))

(declare-fun b!868942 () Bool)

(declare-fun res!590479 () Bool)

(assert (=> b!868942 (=> (not res!590479) (not e!483941))))

(assert (=> b!868942 (= res!590479 (and (= (select (arr!24091 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!868943 () Bool)

(declare-fun res!590482 () Bool)

(assert (=> b!868943 (=> (not res!590482) (not e!483941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868943 (= res!590482 (validKeyInArray!0 k!854))))

(declare-fun res!590480 () Bool)

(assert (=> start!73934 (=> (not res!590480) (not e!483941))))

(assert (=> start!73934 (= res!590480 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24531 _keys!868))))))

(assert (=> start!73934 e!483941))

(assert (=> start!73934 tp_is_empty!16985))

(assert (=> start!73934 true))

(assert (=> start!73934 tp!52050))

(declare-fun array_inv!19030 (array!50120) Bool)

(assert (=> start!73934 (array_inv!19030 _keys!868)))

(declare-fun e!483939 () Bool)

(declare-fun array_inv!19031 (array!50122) Bool)

(assert (=> start!73934 (and (array_inv!19031 _values!688) e!483939)))

(declare-fun mapNonEmpty!27077 () Bool)

(declare-fun mapRes!27077 () Bool)

(declare-fun tp!52051 () Bool)

(declare-fun e!483940 () Bool)

(assert (=> mapNonEmpty!27077 (= mapRes!27077 (and tp!52051 e!483940))))

(declare-fun mapKey!27077 () (_ BitVec 32))

(declare-fun mapRest!27077 () (Array (_ BitVec 32) ValueCell!8053))

(declare-fun mapValue!27077 () ValueCell!8053)

(assert (=> mapNonEmpty!27077 (= (arr!24092 _values!688) (store mapRest!27077 mapKey!27077 mapValue!27077))))

(declare-fun b!868944 () Bool)

(assert (=> b!868944 (= e!483939 (and e!483938 mapRes!27077))))

(declare-fun condMapEmpty!27077 () Bool)

(declare-fun mapDefault!27077 () ValueCell!8053)

