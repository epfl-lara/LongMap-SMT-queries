; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72376 () Bool)

(assert start!72376)

(declare-fun b_free!13561 () Bool)

(declare-fun b_next!13561 () Bool)

(assert (=> start!72376 (= b_free!13561 (not b_next!13561))))

(declare-fun tp!47781 () Bool)

(declare-fun b_and!22647 () Bool)

(assert (=> start!72376 (= tp!47781 b_and!22647)))

(declare-fun b!838751 () Bool)

(declare-fun res!570325 () Bool)

(declare-fun e!468166 () Bool)

(assert (=> b!838751 (=> (not res!570325) (not e!468166))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47140 0))(
  ( (array!47141 (arr!22601 (Array (_ BitVec 32) (_ BitVec 64))) (size!23041 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47140)

(declare-datatypes ((V!25617 0))(
  ( (V!25618 (val!7761 Int)) )
))
(declare-datatypes ((ValueCell!7274 0))(
  ( (ValueCellFull!7274 (v!10186 V!25617)) (EmptyCell!7274) )
))
(declare-datatypes ((array!47142 0))(
  ( (array!47143 (arr!22602 (Array (_ BitVec 32) ValueCell!7274)) (size!23042 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47142)

(assert (=> b!838751 (= res!570325 (and (= (size!23042 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23041 _keys!868) (size!23042 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838752 () Bool)

(declare-fun res!570329 () Bool)

(assert (=> b!838752 (=> (not res!570329) (not e!468166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47140 (_ BitVec 32)) Bool)

(assert (=> b!838752 (= res!570329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838753 () Bool)

(declare-fun e!468162 () Bool)

(declare-fun tp_is_empty!15427 () Bool)

(assert (=> b!838753 (= e!468162 tp_is_empty!15427)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10268 0))(
  ( (tuple2!10269 (_1!5145 (_ BitVec 64)) (_2!5145 V!25617)) )
))
(declare-datatypes ((List!16069 0))(
  ( (Nil!16066) (Cons!16065 (h!17196 tuple2!10268) (t!22440 List!16069)) )
))
(declare-datatypes ((ListLongMap!9037 0))(
  ( (ListLongMap!9038 (toList!4534 List!16069)) )
))
(declare-fun call!36917 () ListLongMap!9037)

(declare-fun bm!36913 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25617)

(declare-fun zeroValue!654 () V!25617)

(declare-fun getCurrentListMapNoExtraKeys!2526 (array!47140 array!47142 (_ BitVec 32) (_ BitVec 32) V!25617 V!25617 (_ BitVec 32) Int) ListLongMap!9037)

(assert (=> bm!36913 (= call!36917 (getCurrentListMapNoExtraKeys!2526 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838754 () Bool)

(declare-fun res!570327 () Bool)

(assert (=> b!838754 (=> (not res!570327) (not e!468166))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838754 (= res!570327 (validKeyInArray!0 k!854))))

(declare-fun b!838755 () Bool)

(declare-fun res!570323 () Bool)

(assert (=> b!838755 (=> (not res!570323) (not e!468166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838755 (= res!570323 (validMask!0 mask!1196))))

(declare-fun call!36916 () ListLongMap!9037)

(declare-fun v!557 () V!25617)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun bm!36914 () Bool)

(assert (=> bm!36914 (= call!36916 (getCurrentListMapNoExtraKeys!2526 _keys!868 (array!47143 (store (arr!22602 _values!688) i!612 (ValueCellFull!7274 v!557)) (size!23042 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838756 () Bool)

(declare-fun e!468161 () Bool)

(declare-fun +!2007 (ListLongMap!9037 tuple2!10268) ListLongMap!9037)

(assert (=> b!838756 (= e!468161 (= call!36916 (+!2007 call!36917 (tuple2!10269 k!854 v!557))))))

(declare-fun b!838757 () Bool)

(declare-fun e!468164 () Bool)

(declare-fun e!468165 () Bool)

(declare-fun mapRes!24740 () Bool)

(assert (=> b!838757 (= e!468164 (and e!468165 mapRes!24740))))

(declare-fun condMapEmpty!24740 () Bool)

(declare-fun mapDefault!24740 () ValueCell!7274)

