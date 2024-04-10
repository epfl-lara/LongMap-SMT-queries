; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72500 () Bool)

(assert start!72500)

(declare-fun b_free!13685 () Bool)

(declare-fun b_next!13685 () Bool)

(assert (=> start!72500 (= b_free!13685 (not b_next!13685))))

(declare-fun tp!48153 () Bool)

(declare-fun b_and!22771 () Bool)

(assert (=> start!72500 (= tp!48153 b_and!22771)))

(declare-fun mapIsEmpty!24926 () Bool)

(declare-fun mapRes!24926 () Bool)

(assert (=> mapIsEmpty!24926 mapRes!24926))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37285 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25781 0))(
  ( (V!25782 (val!7823 Int)) )
))
(declare-datatypes ((ValueCell!7336 0))(
  ( (ValueCellFull!7336 (v!10248 V!25781)) (EmptyCell!7336) )
))
(declare-datatypes ((array!47380 0))(
  ( (array!47381 (arr!22721 (Array (_ BitVec 32) ValueCell!7336)) (size!23161 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47380)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25781)

(declare-fun zeroValue!654 () V!25781)

(declare-datatypes ((array!47382 0))(
  ( (array!47383 (arr!22722 (Array (_ BitVec 32) (_ BitVec 64))) (size!23162 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47382)

(declare-datatypes ((tuple2!10378 0))(
  ( (tuple2!10379 (_1!5200 (_ BitVec 64)) (_2!5200 V!25781)) )
))
(declare-datatypes ((List!16162 0))(
  ( (Nil!16159) (Cons!16158 (h!17289 tuple2!10378) (t!22533 List!16162)) )
))
(declare-datatypes ((ListLongMap!9147 0))(
  ( (ListLongMap!9148 (toList!4589 List!16162)) )
))
(declare-fun call!37288 () ListLongMap!9147)

(declare-fun getCurrentListMapNoExtraKeys!2576 (array!47382 array!47380 (_ BitVec 32) (_ BitVec 32) V!25781 V!25781 (_ BitVec 32) Int) ListLongMap!9147)

(assert (=> bm!37285 (= call!37288 (getCurrentListMapNoExtraKeys!2576 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841169 () Bool)

(declare-fun res!571816 () Bool)

(declare-fun e!469280 () Bool)

(assert (=> b!841169 (=> (not res!571816) (not e!469280))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!841169 (= res!571816 (and (= (select (arr!22722 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23162 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841170 () Bool)

(declare-fun res!571817 () Bool)

(assert (=> b!841170 (=> (not res!571817) (not e!469280))))

(declare-datatypes ((List!16163 0))(
  ( (Nil!16160) (Cons!16159 (h!17290 (_ BitVec 64)) (t!22534 List!16163)) )
))
(declare-fun arrayNoDuplicates!0 (array!47382 (_ BitVec 32) List!16163) Bool)

(assert (=> b!841170 (= res!571817 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16160))))

(declare-fun b!841171 () Bool)

(declare-fun e!469281 () Bool)

(declare-fun tp_is_empty!15551 () Bool)

(assert (=> b!841171 (= e!469281 tp_is_empty!15551)))

(declare-fun v!557 () V!25781)

(declare-fun e!469279 () Bool)

(declare-fun call!37289 () ListLongMap!9147)

(declare-fun b!841172 () Bool)

(declare-fun +!2056 (ListLongMap!9147 tuple2!10378) ListLongMap!9147)

(assert (=> b!841172 (= e!469279 (= call!37289 (+!2056 call!37288 (tuple2!10379 k!854 v!557))))))

(declare-fun b!841173 () Bool)

(assert (=> b!841173 (= e!469280 (not true))))

(assert (=> b!841173 e!469279))

(declare-fun c!91387 () Bool)

(assert (=> b!841173 (= c!91387 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28893 0))(
  ( (Unit!28894) )
))
(declare-fun lt!380893 () Unit!28893)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!292 (array!47382 array!47380 (_ BitVec 32) (_ BitVec 32) V!25781 V!25781 (_ BitVec 32) (_ BitVec 64) V!25781 (_ BitVec 32) Int) Unit!28893)

(assert (=> b!841173 (= lt!380893 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!292 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841174 () Bool)

(declare-fun res!571812 () Bool)

(assert (=> b!841174 (=> (not res!571812) (not e!469280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841174 (= res!571812 (validMask!0 mask!1196))))

(declare-fun b!841175 () Bool)

(declare-fun e!469277 () Bool)

(assert (=> b!841175 (= e!469277 tp_is_empty!15551)))

(declare-fun b!841176 () Bool)

(declare-fun res!571810 () Bool)

(assert (=> b!841176 (=> (not res!571810) (not e!469280))))

(assert (=> b!841176 (= res!571810 (and (= (size!23161 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23162 _keys!868) (size!23161 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841177 () Bool)

(declare-fun e!469282 () Bool)

(assert (=> b!841177 (= e!469282 (and e!469277 mapRes!24926))))

(declare-fun condMapEmpty!24926 () Bool)

(declare-fun mapDefault!24926 () ValueCell!7336)

