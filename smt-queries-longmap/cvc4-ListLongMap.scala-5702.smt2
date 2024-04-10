; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74000 () Bool)

(assert start!74000)

(declare-fun b_free!14915 () Bool)

(declare-fun b_next!14915 () Bool)

(assert (=> start!74000 (= b_free!14915 (not b_next!14915))))

(declare-fun tp!52248 () Bool)

(declare-fun b_and!24667 () Bool)

(assert (=> start!74000 (= tp!52248 b_and!24667)))

(declare-fun b!870123 () Bool)

(declare-fun e!484535 () Bool)

(declare-fun e!484536 () Bool)

(assert (=> b!870123 (= e!484535 e!484536)))

(declare-fun res!591368 () Bool)

(assert (=> b!870123 (=> (not res!591368) (not e!484536))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870123 (= res!591368 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27781 0))(
  ( (V!27782 (val!8573 Int)) )
))
(declare-datatypes ((tuple2!11390 0))(
  ( (tuple2!11391 (_1!5706 (_ BitVec 64)) (_2!5706 V!27781)) )
))
(declare-datatypes ((List!17182 0))(
  ( (Nil!17179) (Cons!17178 (h!18309 tuple2!11390) (t!24219 List!17182)) )
))
(declare-datatypes ((ListLongMap!10159 0))(
  ( (ListLongMap!10160 (toList!5095 List!17182)) )
))
(declare-fun lt!395032 () ListLongMap!10159)

(declare-datatypes ((array!50248 0))(
  ( (array!50249 (arr!24155 (Array (_ BitVec 32) (_ BitVec 64))) (size!24595 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50248)

(declare-datatypes ((ValueCell!8086 0))(
  ( (ValueCellFull!8086 (v!10998 V!27781)) (EmptyCell!8086) )
))
(declare-datatypes ((array!50250 0))(
  ( (array!50251 (arr!24156 (Array (_ BitVec 32) ValueCell!8086)) (size!24596 (_ BitVec 32))) )
))
(declare-fun lt!395030 () array!50250)

(declare-fun minValue!654 () V!27781)

(declare-fun zeroValue!654 () V!27781)

(declare-fun getCurrentListMapNoExtraKeys!3064 (array!50248 array!50250 (_ BitVec 32) (_ BitVec 32) V!27781 V!27781 (_ BitVec 32) Int) ListLongMap!10159)

(assert (=> b!870123 (= lt!395032 (getCurrentListMapNoExtraKeys!3064 _keys!868 lt!395030 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27781)

(declare-fun _values!688 () array!50250)

(assert (=> b!870123 (= lt!395030 (array!50251 (store (arr!24156 _values!688) i!612 (ValueCellFull!8086 v!557)) (size!24596 _values!688)))))

(declare-fun lt!395029 () ListLongMap!10159)

(assert (=> b!870123 (= lt!395029 (getCurrentListMapNoExtraKeys!3064 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870124 () Bool)

(declare-fun e!484533 () Bool)

(declare-fun tp_is_empty!17051 () Bool)

(assert (=> b!870124 (= e!484533 tp_is_empty!17051)))

(declare-fun b!870125 () Bool)

(declare-fun e!484537 () Bool)

(assert (=> b!870125 (= e!484537 tp_is_empty!17051)))

(declare-fun b!870126 () Bool)

(declare-fun res!591373 () Bool)

(assert (=> b!870126 (=> (not res!591373) (not e!484535))))

(assert (=> b!870126 (= res!591373 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24595 _keys!868))))))

(declare-fun b!870127 () Bool)

(declare-fun res!591374 () Bool)

(assert (=> b!870127 (=> (not res!591374) (not e!484535))))

(assert (=> b!870127 (= res!591374 (and (= (size!24596 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24595 _keys!868) (size!24596 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27176 () Bool)

(declare-fun mapRes!27176 () Bool)

(declare-fun tp!52249 () Bool)

(assert (=> mapNonEmpty!27176 (= mapRes!27176 (and tp!52249 e!484537))))

(declare-fun mapRest!27176 () (Array (_ BitVec 32) ValueCell!8086))

(declare-fun mapKey!27176 () (_ BitVec 32))

(declare-fun mapValue!27176 () ValueCell!8086)

(assert (=> mapNonEmpty!27176 (= (arr!24156 _values!688) (store mapRest!27176 mapKey!27176 mapValue!27176))))

(declare-fun b!870128 () Bool)

(declare-fun res!591372 () Bool)

(assert (=> b!870128 (=> (not res!591372) (not e!484535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50248 (_ BitVec 32)) Bool)

(assert (=> b!870128 (= res!591372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870129 () Bool)

(declare-fun res!591369 () Bool)

(assert (=> b!870129 (=> (not res!591369) (not e!484535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870129 (= res!591369 (validMask!0 mask!1196))))

(declare-fun b!870130 () Bool)

(assert (=> b!870130 (= e!484536 (not true))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2435 (ListLongMap!10159 tuple2!11390) ListLongMap!10159)

(assert (=> b!870130 (= (getCurrentListMapNoExtraKeys!3064 _keys!868 lt!395030 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2435 (getCurrentListMapNoExtraKeys!3064 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11391 k!854 v!557)))))

(declare-datatypes ((Unit!29868 0))(
  ( (Unit!29869) )
))
(declare-fun lt!395031 () Unit!29868)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!629 (array!50248 array!50250 (_ BitVec 32) (_ BitVec 32) V!27781 V!27781 (_ BitVec 32) (_ BitVec 64) V!27781 (_ BitVec 32) Int) Unit!29868)

(assert (=> b!870130 (= lt!395031 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!629 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870131 () Bool)

(declare-fun e!484534 () Bool)

(assert (=> b!870131 (= e!484534 (and e!484533 mapRes!27176))))

(declare-fun condMapEmpty!27176 () Bool)

(declare-fun mapDefault!27176 () ValueCell!8086)

