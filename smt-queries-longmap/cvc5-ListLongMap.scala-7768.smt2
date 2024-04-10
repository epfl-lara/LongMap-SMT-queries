; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97352 () Bool)

(assert start!97352)

(declare-fun b_free!23323 () Bool)

(declare-fun b_next!23323 () Bool)

(assert (=> start!97352 (= b_free!23323 (not b_next!23323))))

(declare-fun tp!82268 () Bool)

(declare-fun b_and!37481 () Bool)

(assert (=> start!97352 (= tp!82268 b_and!37481)))

(declare-fun b!1109469 () Bool)

(declare-fun res!740396 () Bool)

(declare-fun e!632823 () Bool)

(assert (=> b!1109469 (=> (not res!740396) (not e!632823))))

(declare-datatypes ((array!72083 0))(
  ( (array!72084 (arr!34694 (Array (_ BitVec 32) (_ BitVec 64))) (size!35230 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72083)

(declare-datatypes ((List!24189 0))(
  ( (Nil!24186) (Cons!24185 (h!25394 (_ BitVec 64)) (t!34558 List!24189)) )
))
(declare-fun arrayNoDuplicates!0 (array!72083 (_ BitVec 32) List!24189) Bool)

(assert (=> b!1109469 (= res!740396 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24186))))

(declare-fun mapNonEmpty!43192 () Bool)

(declare-fun mapRes!43192 () Bool)

(declare-fun tp!82267 () Bool)

(declare-fun e!632829 () Bool)

(assert (=> mapNonEmpty!43192 (= mapRes!43192 (and tp!82267 e!632829))))

(declare-datatypes ((V!41905 0))(
  ( (V!41906 (val!13848 Int)) )
))
(declare-datatypes ((ValueCell!13082 0))(
  ( (ValueCellFull!13082 (v!16481 V!41905)) (EmptyCell!13082) )
))
(declare-fun mapValue!43192 () ValueCell!13082)

(declare-fun mapRest!43192 () (Array (_ BitVec 32) ValueCell!13082))

(declare-datatypes ((array!72085 0))(
  ( (array!72086 (arr!34695 (Array (_ BitVec 32) ValueCell!13082)) (size!35231 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72085)

(declare-fun mapKey!43192 () (_ BitVec 32))

(assert (=> mapNonEmpty!43192 (= (arr!34695 _values!996) (store mapRest!43192 mapKey!43192 mapValue!43192))))

(declare-fun b!1109470 () Bool)

(declare-fun e!632826 () Bool)

(declare-fun e!632827 () Bool)

(assert (=> b!1109470 (= e!632826 (and e!632827 mapRes!43192))))

(declare-fun condMapEmpty!43192 () Bool)

(declare-fun mapDefault!43192 () ValueCell!13082)

