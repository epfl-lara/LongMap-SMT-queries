; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3922 () Bool)

(assert start!3922)

(declare-fun b_free!827 () Bool)

(declare-fun b_next!827 () Bool)

(assert (=> start!3922 (= b_free!827 (not b_next!827))))

(declare-fun tp!3901 () Bool)

(declare-fun b_and!1637 () Bool)

(assert (=> start!3922 (= tp!3901 b_and!1637)))

(declare-fun b!27786 () Bool)

(declare-fun e!18053 () Bool)

(declare-fun tp_is_empty!1181 () Bool)

(assert (=> b!27786 (= e!18053 tp_is_empty!1181)))

(declare-fun b!27787 () Bool)

(declare-fun res!16485 () Bool)

(declare-fun e!18050 () Bool)

(assert (=> b!27787 (=> (not res!16485) (not e!18050))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27787 (= res!16485 (validKeyInArray!0 k!1304))))

(declare-fun mapNonEmpty!1300 () Bool)

(declare-fun mapRes!1300 () Bool)

(declare-fun tp!3900 () Bool)

(declare-fun e!18051 () Bool)

(assert (=> mapNonEmpty!1300 (= mapRes!1300 (and tp!3900 e!18051))))

(declare-datatypes ((V!1399 0))(
  ( (V!1400 (val!617 Int)) )
))
(declare-datatypes ((ValueCell!391 0))(
  ( (ValueCellFull!391 (v!1706 V!1399)) (EmptyCell!391) )
))
(declare-datatypes ((array!1603 0))(
  ( (array!1604 (arr!755 (Array (_ BitVec 32) ValueCell!391)) (size!856 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1603)

(declare-fun mapKey!1300 () (_ BitVec 32))

(declare-fun mapValue!1300 () ValueCell!391)

(declare-fun mapRest!1300 () (Array (_ BitVec 32) ValueCell!391))

(assert (=> mapNonEmpty!1300 (= (arr!755 _values!1501) (store mapRest!1300 mapKey!1300 mapValue!1300))))

(declare-fun b!27789 () Bool)

(declare-fun res!16484 () Bool)

(assert (=> b!27789 (=> (not res!16484) (not e!18050))))

(declare-datatypes ((array!1605 0))(
  ( (array!1606 (arr!756 (Array (_ BitVec 32) (_ BitVec 64))) (size!857 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1605)

(declare-datatypes ((List!635 0))(
  ( (Nil!632) (Cons!631 (h!1198 (_ BitVec 64)) (t!3328 List!635)) )
))
(declare-fun arrayNoDuplicates!0 (array!1605 (_ BitVec 32) List!635) Bool)

(assert (=> b!27789 (= res!16484 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!632))))

(declare-fun b!27790 () Bool)

(declare-fun e!18049 () Bool)

(assert (=> b!27790 (= e!18049 (and e!18053 mapRes!1300))))

(declare-fun condMapEmpty!1300 () Bool)

(declare-fun mapDefault!1300 () ValueCell!391)

