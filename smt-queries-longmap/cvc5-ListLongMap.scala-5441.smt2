; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72430 () Bool)

(assert start!72430)

(declare-fun b_free!13615 () Bool)

(declare-fun b_next!13615 () Bool)

(assert (=> start!72430 (= b_free!13615 (not b_next!13615))))

(declare-fun tp!47943 () Bool)

(declare-fun b_and!22701 () Bool)

(assert (=> start!72430 (= tp!47943 b_and!22701)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!37075 () Bool)

(declare-datatypes ((V!25689 0))(
  ( (V!25690 (val!7788 Int)) )
))
(declare-datatypes ((tuple2!10316 0))(
  ( (tuple2!10317 (_1!5169 (_ BitVec 64)) (_2!5169 V!25689)) )
))
(declare-datatypes ((List!16112 0))(
  ( (Nil!16109) (Cons!16108 (h!17239 tuple2!10316) (t!22483 List!16112)) )
))
(declare-datatypes ((ListLongMap!9085 0))(
  ( (ListLongMap!9086 (toList!4558 List!16112)) )
))
(declare-fun call!37079 () ListLongMap!9085)

(declare-datatypes ((array!47244 0))(
  ( (array!47245 (arr!22653 (Array (_ BitVec 32) (_ BitVec 64))) (size!23093 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47244)

(declare-datatypes ((ValueCell!7301 0))(
  ( (ValueCellFull!7301 (v!10213 V!25689)) (EmptyCell!7301) )
))
(declare-datatypes ((array!47246 0))(
  ( (array!47247 (arr!22654 (Array (_ BitVec 32) ValueCell!7301)) (size!23094 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47246)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25689)

(declare-fun zeroValue!654 () V!25689)

(declare-fun getCurrentListMapNoExtraKeys!2547 (array!47244 array!47246 (_ BitVec 32) (_ BitVec 32) V!25689 V!25689 (_ BitVec 32) Int) ListLongMap!9085)

(assert (=> bm!37075 (= call!37079 (getCurrentListMapNoExtraKeys!2547 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839804 () Bool)

(declare-fun res!570974 () Bool)

(declare-fun e!468651 () Bool)

(assert (=> b!839804 (=> (not res!570974) (not e!468651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47244 (_ BitVec 32)) Bool)

(assert (=> b!839804 (= res!570974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun v!557 () V!25689)

(declare-fun call!37078 () ListLongMap!9085)

(declare-fun e!468650 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun b!839805 () Bool)

(declare-fun +!2028 (ListLongMap!9085 tuple2!10316) ListLongMap!9085)

(assert (=> b!839805 (= e!468650 (= call!37078 (+!2028 call!37079 (tuple2!10317 k!854 v!557))))))

(declare-fun b!839806 () Bool)

(declare-fun res!570970 () Bool)

(assert (=> b!839806 (=> (not res!570970) (not e!468651))))

(declare-datatypes ((List!16113 0))(
  ( (Nil!16110) (Cons!16109 (h!17240 (_ BitVec 64)) (t!22484 List!16113)) )
))
(declare-fun arrayNoDuplicates!0 (array!47244 (_ BitVec 32) List!16113) Bool)

(assert (=> b!839806 (= res!570970 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16110))))

(declare-fun b!839807 () Bool)

(declare-fun e!468652 () Bool)

(declare-fun e!468648 () Bool)

(declare-fun mapRes!24821 () Bool)

(assert (=> b!839807 (= e!468652 (and e!468648 mapRes!24821))))

(declare-fun condMapEmpty!24821 () Bool)

(declare-fun mapDefault!24821 () ValueCell!7301)

