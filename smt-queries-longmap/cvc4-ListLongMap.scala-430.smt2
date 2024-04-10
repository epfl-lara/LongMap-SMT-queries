; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8052 () Bool)

(assert start!8052)

(declare-fun b!50627 () Bool)

(declare-fun b_free!1557 () Bool)

(declare-fun b_next!1557 () Bool)

(assert (=> b!50627 (= b_free!1557 (not b_next!1557))))

(declare-fun tp!6738 () Bool)

(declare-fun b_and!2767 () Bool)

(assert (=> b!50627 (= tp!6738 b_and!2767)))

(declare-fun b!50636 () Bool)

(declare-fun b_free!1559 () Bool)

(declare-fun b_next!1559 () Bool)

(assert (=> b!50636 (= b_free!1559 (not b_next!1559))))

(declare-fun tp!6737 () Bool)

(declare-fun b_and!2769 () Bool)

(assert (=> b!50636 (= tp!6737 b_and!2769)))

(declare-fun mapNonEmpty!2219 () Bool)

(declare-fun mapRes!2219 () Bool)

(declare-fun tp!6735 () Bool)

(declare-fun e!32738 () Bool)

(assert (=> mapNonEmpty!2219 (= mapRes!2219 (and tp!6735 e!32738))))

(declare-fun mapKey!2220 () (_ BitVec 32))

(declare-datatypes ((V!2573 0))(
  ( (V!2574 (val!1142 Int)) )
))
(declare-datatypes ((ValueCell!754 0))(
  ( (ValueCellFull!754 (v!2171 V!2573)) (EmptyCell!754) )
))
(declare-fun mapRest!2220 () (Array (_ BitVec 32) ValueCell!754))

(declare-fun mapValue!2219 () ValueCell!754)

(declare-datatypes ((array!3303 0))(
  ( (array!3304 (arr!1579 (Array (_ BitVec 32) (_ BitVec 64))) (size!1803 (_ BitVec 32))) )
))
(declare-datatypes ((array!3305 0))(
  ( (array!3306 (arr!1580 (Array (_ BitVec 32) ValueCell!754)) (size!1804 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!416 0))(
  ( (LongMapFixedSize!417 (defaultEntry!1922 Int) (mask!5714 (_ BitVec 32)) (extraKeys!1813 (_ BitVec 32)) (zeroValue!1840 V!2573) (minValue!1840 V!2573) (_size!257 (_ BitVec 32)) (_keys!3532 array!3303) (_values!1905 array!3305) (_vacant!257 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!416)

(assert (=> mapNonEmpty!2219 (= (arr!1580 (_values!1905 newMap!16)) (store mapRest!2220 mapKey!2220 mapValue!2219))))

(declare-fun b!50622 () Bool)

(declare-fun e!32736 () Bool)

(declare-fun e!32745 () Bool)

(assert (=> b!50622 (= e!32736 e!32745)))

(declare-fun b!50623 () Bool)

(declare-fun e!32742 () Bool)

(declare-fun e!32739 () Bool)

(declare-fun mapRes!2220 () Bool)

(assert (=> b!50623 (= e!32742 (and e!32739 mapRes!2220))))

(declare-fun condMapEmpty!2219 () Bool)

(declare-datatypes ((Cell!242 0))(
  ( (Cell!243 (v!2172 LongMapFixedSize!416)) )
))
(declare-datatypes ((LongMap!242 0))(
  ( (LongMap!243 (underlying!132 Cell!242)) )
))
(declare-fun thiss!992 () LongMap!242)

(declare-fun mapDefault!2219 () ValueCell!754)

