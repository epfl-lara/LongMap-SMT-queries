; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72454 () Bool)

(assert start!72454)

(declare-fun b_free!13639 () Bool)

(declare-fun b_next!13639 () Bool)

(assert (=> start!72454 (= b_free!13639 (not b_next!13639))))

(declare-fun tp!48016 () Bool)

(declare-fun b_and!22725 () Bool)

(assert (=> start!72454 (= tp!48016 b_and!22725)))

(declare-fun b!840272 () Bool)

(declare-fun e!468868 () Bool)

(declare-fun tp_is_empty!15505 () Bool)

(assert (=> b!840272 (= e!468868 tp_is_empty!15505)))

(declare-fun mapNonEmpty!24857 () Bool)

(declare-fun mapRes!24857 () Bool)

(declare-fun tp!48015 () Bool)

(declare-fun e!468867 () Bool)

(assert (=> mapNonEmpty!24857 (= mapRes!24857 (and tp!48015 e!468867))))

(declare-datatypes ((V!25721 0))(
  ( (V!25722 (val!7800 Int)) )
))
(declare-datatypes ((ValueCell!7313 0))(
  ( (ValueCellFull!7313 (v!10225 V!25721)) (EmptyCell!7313) )
))
(declare-fun mapValue!24857 () ValueCell!7313)

(declare-fun mapKey!24857 () (_ BitVec 32))

(declare-fun mapRest!24857 () (Array (_ BitVec 32) ValueCell!7313))

(declare-datatypes ((array!47290 0))(
  ( (array!47291 (arr!22676 (Array (_ BitVec 32) ValueCell!7313)) (size!23116 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47290)

(assert (=> mapNonEmpty!24857 (= (arr!22676 _values!688) (store mapRest!24857 mapKey!24857 mapValue!24857))))

(declare-fun bm!37147 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10336 0))(
  ( (tuple2!10337 (_1!5179 (_ BitVec 64)) (_2!5179 V!25721)) )
))
(declare-datatypes ((List!16128 0))(
  ( (Nil!16125) (Cons!16124 (h!17255 tuple2!10336) (t!22499 List!16128)) )
))
(declare-datatypes ((ListLongMap!9105 0))(
  ( (ListLongMap!9106 (toList!4568 List!16128)) )
))
(declare-fun call!37150 () ListLongMap!9105)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47292 0))(
  ( (array!47293 (arr!22677 (Array (_ BitVec 32) (_ BitVec 64))) (size!23117 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47292)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25721)

(declare-fun zeroValue!654 () V!25721)

(declare-fun getCurrentListMapNoExtraKeys!2556 (array!47292 array!47290 (_ BitVec 32) (_ BitVec 32) V!25721 V!25721 (_ BitVec 32) Int) ListLongMap!9105)

(assert (=> bm!37147 (= call!37150 (getCurrentListMapNoExtraKeys!2556 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840273 () Bool)

(declare-fun res!571261 () Bool)

(declare-fun e!468864 () Bool)

(assert (=> b!840273 (=> (not res!571261) (not e!468864))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!840273 (= res!571261 (and (= (select (arr!22677 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23117 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24857 () Bool)

(assert (=> mapIsEmpty!24857 mapRes!24857))

(declare-fun b!840274 () Bool)

(declare-fun e!468865 () Bool)

(declare-fun call!37151 () ListLongMap!9105)

(assert (=> b!840274 (= e!468865 (= call!37151 call!37150))))

(declare-fun b!840275 () Bool)

(declare-fun res!571262 () Bool)

(assert (=> b!840275 (=> (not res!571262) (not e!468864))))

(declare-datatypes ((List!16129 0))(
  ( (Nil!16126) (Cons!16125 (h!17256 (_ BitVec 64)) (t!22500 List!16129)) )
))
(declare-fun arrayNoDuplicates!0 (array!47292 (_ BitVec 32) List!16129) Bool)

(assert (=> b!840275 (= res!571262 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16126))))

(declare-fun b!840276 () Bool)

(declare-fun res!571263 () Bool)

(assert (=> b!840276 (=> (not res!571263) (not e!468864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840276 (= res!571263 (validKeyInArray!0 k!854))))

(declare-fun v!557 () V!25721)

(declare-fun b!840277 () Bool)

(declare-fun +!2037 (ListLongMap!9105 tuple2!10336) ListLongMap!9105)

(assert (=> b!840277 (= e!468865 (= call!37151 (+!2037 call!37150 (tuple2!10337 k!854 v!557))))))

(declare-fun b!840278 () Bool)

(declare-fun res!571259 () Bool)

(assert (=> b!840278 (=> (not res!571259) (not e!468864))))

(assert (=> b!840278 (= res!571259 (and (= (size!23116 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23117 _keys!868) (size!23116 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840279 () Bool)

(declare-fun e!468866 () Bool)

(assert (=> b!840279 (= e!468866 (and e!468868 mapRes!24857))))

(declare-fun condMapEmpty!24857 () Bool)

(declare-fun mapDefault!24857 () ValueCell!7313)

