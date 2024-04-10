; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83004 () Bool)

(assert start!83004)

(declare-fun b!968634 () Bool)

(declare-fun e!545926 () Bool)

(declare-datatypes ((array!59923 0))(
  ( (array!59924 (arr!28828 (Array (_ BitVec 32) (_ BitVec 64))) (size!29307 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59923)

(assert (=> b!968634 (= e!545926 (and (bvsle #b00000000000000000000000000000000 (size!29307 _keys!1717)) (bvsge (size!29307 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!34888 () Bool)

(declare-fun mapRes!34888 () Bool)

(declare-fun tp!66456 () Bool)

(declare-fun e!545928 () Bool)

(assert (=> mapNonEmpty!34888 (= mapRes!34888 (and tp!66456 e!545928))))

(declare-datatypes ((V!34217 0))(
  ( (V!34218 (val!11013 Int)) )
))
(declare-datatypes ((ValueCell!10481 0))(
  ( (ValueCellFull!10481 (v!13571 V!34217)) (EmptyCell!10481) )
))
(declare-datatypes ((array!59925 0))(
  ( (array!59926 (arr!28829 (Array (_ BitVec 32) ValueCell!10481)) (size!29308 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59925)

(declare-fun mapRest!34888 () (Array (_ BitVec 32) ValueCell!10481))

(declare-fun mapKey!34888 () (_ BitVec 32))

(declare-fun mapValue!34888 () ValueCell!10481)

(assert (=> mapNonEmpty!34888 (= (arr!28829 _values!1425) (store mapRest!34888 mapKey!34888 mapValue!34888))))

(declare-fun mapIsEmpty!34888 () Bool)

(assert (=> mapIsEmpty!34888 mapRes!34888))

(declare-fun b!968635 () Bool)

(declare-fun e!545927 () Bool)

(declare-fun e!545929 () Bool)

(assert (=> b!968635 (= e!545927 (and e!545929 mapRes!34888))))

(declare-fun condMapEmpty!34888 () Bool)

(declare-fun mapDefault!34888 () ValueCell!10481)

