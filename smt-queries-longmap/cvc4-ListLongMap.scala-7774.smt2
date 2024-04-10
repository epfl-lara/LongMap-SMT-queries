; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97392 () Bool)

(assert start!97392)

(declare-fun b_free!23363 () Bool)

(declare-fun b_next!23363 () Bool)

(assert (=> start!97392 (= b_free!23363 (not b_next!23363))))

(declare-fun tp!82388 () Bool)

(declare-fun b_and!37561 () Bool)

(assert (=> start!97392 (= tp!82388 b_and!37561)))

(declare-datatypes ((V!41957 0))(
  ( (V!41958 (val!13868 Int)) )
))
(declare-fun zeroValue!944 () V!41957)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!72163 0))(
  ( (array!72164 (arr!34734 (Array (_ BitVec 32) (_ BitVec 64))) (size!35270 (_ BitVec 32))) )
))
(declare-fun lt!496171 () array!72163)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46782 () Bool)

(declare-datatypes ((ValueCell!13102 0))(
  ( (ValueCellFull!13102 (v!16501 V!41957)) (EmptyCell!13102) )
))
(declare-datatypes ((array!72165 0))(
  ( (array!72166 (arr!34735 (Array (_ BitVec 32) ValueCell!13102)) (size!35271 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72165)

(declare-fun minValue!944 () V!41957)

(declare-datatypes ((tuple2!17538 0))(
  ( (tuple2!17539 (_1!8780 (_ BitVec 64)) (_2!8780 V!41957)) )
))
(declare-datatypes ((List!24223 0))(
  ( (Nil!24220) (Cons!24219 (h!25428 tuple2!17538) (t!34632 List!24223)) )
))
(declare-datatypes ((ListLongMap!15507 0))(
  ( (ListLongMap!15508 (toList!7769 List!24223)) )
))
(declare-fun call!46785 () ListLongMap!15507)

(declare-fun getCurrentListMapNoExtraKeys!4263 (array!72163 array!72165 (_ BitVec 32) (_ BitVec 32) V!41957 V!41957 (_ BitVec 32) Int) ListLongMap!15507)

(declare-fun dynLambda!2391 (Int (_ BitVec 64)) V!41957)

(assert (=> bm!46782 (= call!46785 (getCurrentListMapNoExtraKeys!4263 lt!496171 (array!72166 (store (arr!34735 _values!996) i!673 (ValueCellFull!13102 (dynLambda!2391 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35271 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110469 () Bool)

(declare-fun e!633307 () Bool)

(declare-fun e!633304 () Bool)

(declare-fun mapRes!43252 () Bool)

(assert (=> b!1110469 (= e!633307 (and e!633304 mapRes!43252))))

(declare-fun condMapEmpty!43252 () Bool)

(declare-fun mapDefault!43252 () ValueCell!13102)

