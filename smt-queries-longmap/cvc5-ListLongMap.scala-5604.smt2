; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73408 () Bool)

(assert start!73408)

(declare-fun b_free!14323 () Bool)

(declare-fun b_next!14323 () Bool)

(assert (=> start!73408 (= b_free!14323 (not b_next!14323))))

(declare-fun tp!50472 () Bool)

(declare-fun b_and!23679 () Bool)

(assert (=> start!73408 (= tp!50472 b_and!23679)))

(declare-fun b!856938 () Bool)

(declare-fun res!582075 () Bool)

(declare-fun e!477648 () Bool)

(assert (=> b!856938 (=> (not res!582075) (not e!477648))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49110 0))(
  ( (array!49111 (arr!23586 (Array (_ BitVec 32) (_ BitVec 64))) (size!24026 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49110)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856938 (= res!582075 (and (= (select (arr!23586 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!856939 () Bool)

(declare-fun res!582074 () Bool)

(assert (=> b!856939 (=> (not res!582074) (not e!477648))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856939 (= res!582074 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26288 () Bool)

(declare-fun mapRes!26288 () Bool)

(declare-fun tp!50473 () Bool)

(declare-fun e!477651 () Bool)

(assert (=> mapNonEmpty!26288 (= mapRes!26288 (and tp!50473 e!477651))))

(declare-datatypes ((V!26993 0))(
  ( (V!26994 (val!8277 Int)) )
))
(declare-datatypes ((ValueCell!7790 0))(
  ( (ValueCellFull!7790 (v!10702 V!26993)) (EmptyCell!7790) )
))
(declare-fun mapValue!26288 () ValueCell!7790)

(declare-fun mapKey!26288 () (_ BitVec 32))

(declare-fun mapRest!26288 () (Array (_ BitVec 32) ValueCell!7790))

(declare-datatypes ((array!49112 0))(
  ( (array!49113 (arr!23587 (Array (_ BitVec 32) ValueCell!7790)) (size!24027 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49112)

(assert (=> mapNonEmpty!26288 (= (arr!23587 _values!688) (store mapRest!26288 mapKey!26288 mapValue!26288))))

(declare-fun b!856940 () Bool)

(declare-fun res!582070 () Bool)

(assert (=> b!856940 (=> (not res!582070) (not e!477648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856940 (= res!582070 (validKeyInArray!0 k!854))))

(declare-fun b!856941 () Bool)

(declare-fun res!582076 () Bool)

(assert (=> b!856941 (=> (not res!582076) (not e!477648))))

(declare-datatypes ((List!16727 0))(
  ( (Nil!16724) (Cons!16723 (h!17854 (_ BitVec 64)) (t!23368 List!16727)) )
))
(declare-fun arrayNoDuplicates!0 (array!49110 (_ BitVec 32) List!16727) Bool)

(assert (=> b!856941 (= res!582076 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16724))))

(declare-fun b!856942 () Bool)

(declare-fun e!477652 () Bool)

(assert (=> b!856942 (= e!477648 e!477652)))

(declare-fun res!582072 () Bool)

(assert (=> b!856942 (=> (not res!582072) (not e!477652))))

(assert (=> b!856942 (= res!582072 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10918 0))(
  ( (tuple2!10919 (_1!5470 (_ BitVec 64)) (_2!5470 V!26993)) )
))
(declare-datatypes ((List!16728 0))(
  ( (Nil!16725) (Cons!16724 (h!17855 tuple2!10918) (t!23369 List!16728)) )
))
(declare-datatypes ((ListLongMap!9687 0))(
  ( (ListLongMap!9688 (toList!4859 List!16728)) )
))
(declare-fun lt!386125 () ListLongMap!9687)

(declare-fun lt!386124 () array!49112)

(declare-fun minValue!654 () V!26993)

(declare-fun zeroValue!654 () V!26993)

(declare-fun getCurrentListMapNoExtraKeys!2840 (array!49110 array!49112 (_ BitVec 32) (_ BitVec 32) V!26993 V!26993 (_ BitVec 32) Int) ListLongMap!9687)

(assert (=> b!856942 (= lt!386125 (getCurrentListMapNoExtraKeys!2840 _keys!868 lt!386124 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26993)

(assert (=> b!856942 (= lt!386124 (array!49113 (store (arr!23587 _values!688) i!612 (ValueCellFull!7790 v!557)) (size!24027 _values!688)))))

(declare-fun lt!386123 () ListLongMap!9687)

(assert (=> b!856942 (= lt!386123 (getCurrentListMapNoExtraKeys!2840 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856943 () Bool)

(assert (=> b!856943 (= e!477652 (not true))))

(declare-fun +!2213 (ListLongMap!9687 tuple2!10918) ListLongMap!9687)

(assert (=> b!856943 (= (getCurrentListMapNoExtraKeys!2840 _keys!868 lt!386124 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2213 (getCurrentListMapNoExtraKeys!2840 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10919 k!854 v!557)))))

(declare-datatypes ((Unit!29213 0))(
  ( (Unit!29214) )
))
(declare-fun lt!386122 () Unit!29213)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!434 (array!49110 array!49112 (_ BitVec 32) (_ BitVec 32) V!26993 V!26993 (_ BitVec 32) (_ BitVec 64) V!26993 (_ BitVec 32) Int) Unit!29213)

(assert (=> b!856943 (= lt!386122 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!434 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26288 () Bool)

(assert (=> mapIsEmpty!26288 mapRes!26288))

(declare-fun res!582071 () Bool)

(assert (=> start!73408 (=> (not res!582071) (not e!477648))))

(assert (=> start!73408 (= res!582071 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24026 _keys!868))))))

(assert (=> start!73408 e!477648))

(declare-fun tp_is_empty!16459 () Bool)

(assert (=> start!73408 tp_is_empty!16459))

(assert (=> start!73408 true))

(assert (=> start!73408 tp!50472))

(declare-fun array_inv!18678 (array!49110) Bool)

(assert (=> start!73408 (array_inv!18678 _keys!868)))

(declare-fun e!477649 () Bool)

(declare-fun array_inv!18679 (array!49112) Bool)

(assert (=> start!73408 (and (array_inv!18679 _values!688) e!477649)))

(declare-fun b!856944 () Bool)

(declare-fun e!477647 () Bool)

(assert (=> b!856944 (= e!477647 tp_is_empty!16459)))

(declare-fun b!856945 () Bool)

(declare-fun res!582069 () Bool)

(assert (=> b!856945 (=> (not res!582069) (not e!477648))))

(assert (=> b!856945 (= res!582069 (and (= (size!24027 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24026 _keys!868) (size!24027 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856946 () Bool)

(assert (=> b!856946 (= e!477649 (and e!477647 mapRes!26288))))

(declare-fun condMapEmpty!26288 () Bool)

(declare-fun mapDefault!26288 () ValueCell!7790)

