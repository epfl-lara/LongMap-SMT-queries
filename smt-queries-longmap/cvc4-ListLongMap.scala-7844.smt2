; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97812 () Bool)

(assert start!97812)

(declare-fun b_free!23513 () Bool)

(declare-fun b_next!23513 () Bool)

(assert (=> start!97812 (= b_free!23513 (not b_next!23513))))

(declare-fun tp!83242 () Bool)

(declare-fun b_and!37809 () Bool)

(assert (=> start!97812 (= tp!83242 b_and!37809)))

(declare-fun mapNonEmpty!43882 () Bool)

(declare-fun mapRes!43882 () Bool)

(declare-fun tp!83243 () Bool)

(declare-fun e!637422 () Bool)

(assert (=> mapNonEmpty!43882 (= mapRes!43882 (and tp!83243 e!637422))))

(declare-datatypes ((V!42517 0))(
  ( (V!42518 (val!14078 Int)) )
))
(declare-datatypes ((ValueCell!13312 0))(
  ( (ValueCellFull!13312 (v!16711 V!42517)) (EmptyCell!13312) )
))
(declare-fun mapValue!43882 () ValueCell!13312)

(declare-fun mapRest!43882 () (Array (_ BitVec 32) ValueCell!13312))

(declare-datatypes ((array!72973 0))(
  ( (array!72974 (arr!35139 (Array (_ BitVec 32) ValueCell!13312)) (size!35675 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72973)

(declare-fun mapKey!43882 () (_ BitVec 32))

(assert (=> mapNonEmpty!43882 (= (arr!35139 _values!996) (store mapRest!43882 mapKey!43882 mapValue!43882))))

(declare-fun b!1119210 () Bool)

(declare-fun e!637424 () Bool)

(declare-fun e!637423 () Bool)

(assert (=> b!1119210 (= e!637424 (and e!637423 mapRes!43882))))

(declare-fun condMapEmpty!43882 () Bool)

(declare-fun mapDefault!43882 () ValueCell!13312)

