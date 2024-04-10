; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3206 () Bool)

(assert start!3206)

(declare-fun b!19521 () Bool)

(declare-fun b_free!683 () Bool)

(declare-fun b_next!683 () Bool)

(assert (=> b!19521 (= b_free!683 (not b_next!683))))

(declare-fun tp!3261 () Bool)

(declare-fun b_and!1343 () Bool)

(assert (=> b!19521 (= tp!3261 b_and!1343)))

(declare-fun mapNonEmpty!877 () Bool)

(declare-fun mapRes!877 () Bool)

(declare-fun tp!3262 () Bool)

(declare-fun e!12632 () Bool)

(assert (=> mapNonEmpty!877 (= mapRes!877 (and tp!3262 e!12632))))

(declare-fun mapKey!877 () (_ BitVec 32))

(declare-datatypes ((V!1087 0))(
  ( (V!1088 (val!500 Int)) )
))
(declare-datatypes ((ValueCell!274 0))(
  ( (ValueCellFull!274 (v!1516 V!1087)) (EmptyCell!274) )
))
(declare-fun mapRest!877 () (Array (_ BitVec 32) ValueCell!274))

(declare-fun mapValue!877 () ValueCell!274)

(declare-datatypes ((array!1109 0))(
  ( (array!1110 (arr!531 (Array (_ BitVec 32) ValueCell!274)) (size!624 (_ BitVec 32))) )
))
(declare-datatypes ((array!1111 0))(
  ( (array!1112 (arr!532 (Array (_ BitVec 32) (_ BitVec 64))) (size!625 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!134 0))(
  ( (LongMapFixedSize!135 (defaultEntry!1686 Int) (mask!4637 (_ BitVec 32)) (extraKeys!1596 (_ BitVec 32)) (zeroValue!1620 V!1087) (minValue!1620 V!1087) (_size!100 (_ BitVec 32)) (_keys!3114 array!1111) (_values!1682 array!1109) (_vacant!100 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!134 0))(
  ( (Cell!135 (v!1517 LongMapFixedSize!134)) )
))
(declare-datatypes ((LongMap!134 0))(
  ( (LongMap!135 (underlying!78 Cell!134)) )
))
(declare-fun thiss!938 () LongMap!134)

(assert (=> mapNonEmpty!877 (= (arr!531 (_values!1682 (v!1517 (underlying!78 thiss!938)))) (store mapRest!877 mapKey!877 mapValue!877))))

(declare-fun tp_is_empty!947 () Bool)

(declare-fun e!12635 () Bool)

(declare-fun e!12630 () Bool)

(declare-fun array_inv!361 (array!1111) Bool)

(declare-fun array_inv!362 (array!1109) Bool)

(assert (=> b!19521 (= e!12630 (and tp!3261 tp_is_empty!947 (array_inv!361 (_keys!3114 (v!1517 (underlying!78 thiss!938)))) (array_inv!362 (_values!1682 (v!1517 (underlying!78 thiss!938)))) e!12635))))

(declare-fun res!13216 () Bool)

(declare-fun e!12631 () Bool)

(assert (=> start!3206 (=> (not res!13216) (not e!12631))))

(declare-fun valid!62 (LongMap!134) Bool)

(assert (=> start!3206 (= res!13216 (valid!62 thiss!938))))

(assert (=> start!3206 e!12631))

(declare-fun e!12628 () Bool)

(assert (=> start!3206 e!12628))

(declare-fun b!19522 () Bool)

(declare-fun e!12633 () Bool)

(assert (=> b!19522 (= e!12635 (and e!12633 mapRes!877))))

(declare-fun condMapEmpty!877 () Bool)

(declare-fun mapDefault!877 () ValueCell!274)

