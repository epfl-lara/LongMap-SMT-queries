; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97734 () Bool)

(assert start!97734)

(declare-fun mapNonEmpty!43765 () Bool)

(declare-fun mapRes!43765 () Bool)

(declare-fun tp!83009 () Bool)

(declare-fun e!636608 () Bool)

(assert (=> mapNonEmpty!43765 (= mapRes!43765 (and tp!83009 e!636608))))

(declare-datatypes ((V!42413 0))(
  ( (V!42414 (val!14039 Int)) )
))
(declare-datatypes ((ValueCell!13273 0))(
  ( (ValueCellFull!13273 (v!16672 V!42413)) (EmptyCell!13273) )
))
(declare-fun mapValue!43765 () ValueCell!13273)

(declare-fun mapRest!43765 () (Array (_ BitVec 32) ValueCell!13273))

(declare-fun mapKey!43765 () (_ BitVec 32))

(declare-datatypes ((array!72821 0))(
  ( (array!72822 (arr!35063 (Array (_ BitVec 32) ValueCell!13273)) (size!35599 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72821)

(assert (=> mapNonEmpty!43765 (= (arr!35063 _values!996) (store mapRest!43765 mapKey!43765 mapValue!43765))))

(declare-fun b!1117551 () Bool)

(declare-fun tp_is_empty!27965 () Bool)

(assert (=> b!1117551 (= e!636608 tp_is_empty!27965)))

(declare-fun b!1117552 () Bool)

(declare-fun res!746302 () Bool)

(declare-fun e!636606 () Bool)

(assert (=> b!1117552 (=> (not res!746302) (not e!636606))))

(declare-datatypes ((array!72823 0))(
  ( (array!72824 (arr!35064 (Array (_ BitVec 32) (_ BitVec 64))) (size!35600 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72823)

(declare-datatypes ((List!24389 0))(
  ( (Nil!24386) (Cons!24385 (h!25594 (_ BitVec 64)) (t!34870 List!24389)) )
))
(declare-fun arrayNoDuplicates!0 (array!72823 (_ BitVec 32) List!24389) Bool)

(assert (=> b!1117552 (= res!746302 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24386))))

(declare-fun mapIsEmpty!43765 () Bool)

(assert (=> mapIsEmpty!43765 mapRes!43765))

(declare-fun b!1117553 () Bool)

(declare-fun e!636607 () Bool)

(declare-fun e!636604 () Bool)

(assert (=> b!1117553 (= e!636607 (and e!636604 mapRes!43765))))

(declare-fun condMapEmpty!43765 () Bool)

(declare-fun mapDefault!43765 () ValueCell!13273)

