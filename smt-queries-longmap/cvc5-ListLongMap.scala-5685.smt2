; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73894 () Bool)

(assert start!73894)

(declare-fun b_free!14809 () Bool)

(declare-fun b_next!14809 () Bool)

(assert (=> start!73894 (= b_free!14809 (not b_next!14809))))

(declare-fun tp!51931 () Bool)

(declare-fun b_and!24561 () Bool)

(assert (=> start!73894 (= tp!51931 b_and!24561)))

(declare-fun b!868215 () Bool)

(declare-fun res!589941 () Bool)

(declare-fun e!483578 () Bool)

(assert (=> b!868215 (=> (not res!589941) (not e!483578))))

(declare-datatypes ((array!50046 0))(
  ( (array!50047 (arr!24054 (Array (_ BitVec 32) (_ BitVec 64))) (size!24494 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50046)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50046 (_ BitVec 32)) Bool)

(assert (=> b!868215 (= res!589941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868216 () Bool)

(declare-fun e!483579 () Bool)

(declare-fun tp_is_empty!16945 () Bool)

(assert (=> b!868216 (= e!483579 tp_is_empty!16945)))

(declare-fun b!868217 () Bool)

(declare-fun res!589937 () Bool)

(assert (=> b!868217 (=> (not res!589937) (not e!483578))))

(declare-datatypes ((List!17105 0))(
  ( (Nil!17102) (Cons!17101 (h!18232 (_ BitVec 64)) (t!24142 List!17105)) )
))
(declare-fun arrayNoDuplicates!0 (array!50046 (_ BitVec 32) List!17105) Bool)

(assert (=> b!868217 (= res!589937 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17102))))

(declare-fun b!868218 () Bool)

(declare-fun res!589940 () Bool)

(assert (=> b!868218 (=> (not res!589940) (not e!483578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868218 (= res!589940 (validMask!0 mask!1196))))

(declare-fun b!868220 () Bool)

(declare-fun e!483582 () Bool)

(assert (=> b!868220 (= e!483578 e!483582)))

(declare-fun res!589943 () Bool)

(assert (=> b!868220 (=> (not res!589943) (not e!483582))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868220 (= res!589943 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27641 0))(
  ( (V!27642 (val!8520 Int)) )
))
(declare-datatypes ((ValueCell!8033 0))(
  ( (ValueCellFull!8033 (v!10945 V!27641)) (EmptyCell!8033) )
))
(declare-datatypes ((array!50048 0))(
  ( (array!50049 (arr!24055 (Array (_ BitVec 32) ValueCell!8033)) (size!24495 (_ BitVec 32))) )
))
(declare-fun lt!394393 () array!50048)

(declare-datatypes ((tuple2!11308 0))(
  ( (tuple2!11309 (_1!5665 (_ BitVec 64)) (_2!5665 V!27641)) )
))
(declare-datatypes ((List!17106 0))(
  ( (Nil!17103) (Cons!17102 (h!18233 tuple2!11308) (t!24143 List!17106)) )
))
(declare-datatypes ((ListLongMap!10077 0))(
  ( (ListLongMap!10078 (toList!5054 List!17106)) )
))
(declare-fun lt!394396 () ListLongMap!10077)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27641)

(declare-fun zeroValue!654 () V!27641)

(declare-fun getCurrentListMapNoExtraKeys!3023 (array!50046 array!50048 (_ BitVec 32) (_ BitVec 32) V!27641 V!27641 (_ BitVec 32) Int) ListLongMap!10077)

(assert (=> b!868220 (= lt!394396 (getCurrentListMapNoExtraKeys!3023 _keys!868 lt!394393 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27641)

(declare-fun _values!688 () array!50048)

(assert (=> b!868220 (= lt!394393 (array!50049 (store (arr!24055 _values!688) i!612 (ValueCellFull!8033 v!557)) (size!24495 _values!688)))))

(declare-fun lt!394394 () ListLongMap!10077)

(assert (=> b!868220 (= lt!394394 (getCurrentListMapNoExtraKeys!3023 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868221 () Bool)

(declare-fun res!589935 () Bool)

(assert (=> b!868221 (=> (not res!589935) (not e!483578))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868221 (= res!589935 (validKeyInArray!0 k!854))))

(declare-fun b!868222 () Bool)

(declare-fun e!483581 () Bool)

(declare-fun mapRes!27017 () Bool)

(assert (=> b!868222 (= e!483581 (and e!483579 mapRes!27017))))

(declare-fun condMapEmpty!27017 () Bool)

(declare-fun mapDefault!27017 () ValueCell!8033)

