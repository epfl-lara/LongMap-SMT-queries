; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97460 () Bool)

(assert start!97460)

(declare-fun b_free!23431 () Bool)

(declare-fun b_next!23431 () Bool)

(assert (=> start!97460 (= b_free!23431 (not b_next!23431))))

(declare-fun tp!82591 () Bool)

(declare-fun b_and!37699 () Bool)

(assert (=> start!97460 (= tp!82591 b_and!37699)))

(declare-fun res!742178 () Bool)

(declare-fun e!634126 () Bool)

(assert (=> start!97460 (=> (not res!742178) (not e!634126))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72295 0))(
  ( (array!72296 (arr!34800 (Array (_ BitVec 32) (_ BitVec 64))) (size!35336 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72295)

(assert (=> start!97460 (= res!742178 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35336 _keys!1208))))))

(assert (=> start!97460 e!634126))

(declare-fun tp_is_empty!27691 () Bool)

(assert (=> start!97460 tp_is_empty!27691))

(declare-fun array_inv!26760 (array!72295) Bool)

(assert (=> start!97460 (array_inv!26760 _keys!1208)))

(assert (=> start!97460 true))

(assert (=> start!97460 tp!82591))

(declare-datatypes ((V!42049 0))(
  ( (V!42050 (val!13902 Int)) )
))
(declare-datatypes ((ValueCell!13136 0))(
  ( (ValueCellFull!13136 (v!16535 V!42049)) (EmptyCell!13136) )
))
(declare-datatypes ((array!72297 0))(
  ( (array!72298 (arr!34801 (Array (_ BitVec 32) ValueCell!13136)) (size!35337 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72297)

(declare-fun e!634128 () Bool)

(declare-fun array_inv!26761 (array!72297) Bool)

(assert (=> start!97460 (and (array_inv!26761 _values!996) e!634128)))

(declare-fun b!1112181 () Bool)

(declare-fun res!742179 () Bool)

(declare-fun e!634125 () Bool)

(assert (=> b!1112181 (=> (not res!742179) (not e!634125))))

(declare-fun lt!496477 () array!72295)

(declare-datatypes ((List!24281 0))(
  ( (Nil!24278) (Cons!24277 (h!25486 (_ BitVec 64)) (t!34758 List!24281)) )
))
(declare-fun arrayNoDuplicates!0 (array!72295 (_ BitVec 32) List!24281) Bool)

(assert (=> b!1112181 (= res!742179 (arrayNoDuplicates!0 lt!496477 #b00000000000000000000000000000000 Nil!24278))))

(declare-fun e!634127 () Bool)

(declare-fun b!1112182 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!17598 0))(
  ( (tuple2!17599 (_1!8810 (_ BitVec 64)) (_2!8810 V!42049)) )
))
(declare-datatypes ((List!24282 0))(
  ( (Nil!24279) (Cons!24278 (h!25487 tuple2!17598) (t!34759 List!24282)) )
))
(declare-datatypes ((ListLongMap!15567 0))(
  ( (ListLongMap!15568 (toList!7799 List!24282)) )
))
(declare-fun call!46989 () ListLongMap!15567)

(declare-fun call!46990 () ListLongMap!15567)

(declare-fun -!1063 (ListLongMap!15567 (_ BitVec 64)) ListLongMap!15567)

(assert (=> b!1112182 (= e!634127 (= call!46990 (-!1063 call!46989 k!934)))))

(declare-fun mapIsEmpty!43354 () Bool)

(declare-fun mapRes!43354 () Bool)

(assert (=> mapIsEmpty!43354 mapRes!43354))

(declare-fun b!1112183 () Bool)

(declare-fun res!742180 () Bool)

(assert (=> b!1112183 (=> (not res!742180) (not e!634126))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112183 (= res!742180 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35336 _keys!1208))))))

(declare-fun b!1112184 () Bool)

(declare-fun e!634131 () Bool)

(assert (=> b!1112184 (= e!634128 (and e!634131 mapRes!43354))))

(declare-fun condMapEmpty!43354 () Bool)

(declare-fun mapDefault!43354 () ValueCell!13136)

