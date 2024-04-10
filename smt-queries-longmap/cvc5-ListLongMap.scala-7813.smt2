; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97622 () Bool)

(assert start!97622)

(declare-fun b!1115367 () Bool)

(declare-fun res!744614 () Bool)

(declare-fun e!635597 () Bool)

(assert (=> b!1115367 (=> (not res!744614) (not e!635597))))

(declare-datatypes ((array!72607 0))(
  ( (array!72608 (arr!34956 (Array (_ BitVec 32) (_ BitVec 64))) (size!35492 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72607)

(declare-datatypes ((List!24346 0))(
  ( (Nil!24343) (Cons!24342 (h!25551 (_ BitVec 64)) (t!34827 List!24346)) )
))
(declare-fun arrayNoDuplicates!0 (array!72607 (_ BitVec 32) List!24346) Bool)

(assert (=> b!1115367 (= res!744614 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24343))))

(declare-fun mapNonEmpty!43597 () Bool)

(declare-fun mapRes!43597 () Bool)

(declare-fun tp!82841 () Bool)

(declare-fun e!635600 () Bool)

(assert (=> mapNonEmpty!43597 (= mapRes!43597 (and tp!82841 e!635600))))

(declare-fun mapKey!43597 () (_ BitVec 32))

(declare-datatypes ((V!42265 0))(
  ( (V!42266 (val!13983 Int)) )
))
(declare-datatypes ((ValueCell!13217 0))(
  ( (ValueCellFull!13217 (v!16616 V!42265)) (EmptyCell!13217) )
))
(declare-fun mapValue!43597 () ValueCell!13217)

(declare-datatypes ((array!72609 0))(
  ( (array!72610 (arr!34957 (Array (_ BitVec 32) ValueCell!13217)) (size!35493 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72609)

(declare-fun mapRest!43597 () (Array (_ BitVec 32) ValueCell!13217))

(assert (=> mapNonEmpty!43597 (= (arr!34957 _values!996) (store mapRest!43597 mapKey!43597 mapValue!43597))))

(declare-fun b!1115368 () Bool)

(declare-fun e!635599 () Bool)

(declare-fun e!635598 () Bool)

(assert (=> b!1115368 (= e!635599 (and e!635598 mapRes!43597))))

(declare-fun condMapEmpty!43597 () Bool)

(declare-fun mapDefault!43597 () ValueCell!13217)

