; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8048 () Bool)

(assert start!8048)

(declare-fun b!50543 () Bool)

(declare-fun b_free!1549 () Bool)

(declare-fun b_next!1549 () Bool)

(assert (=> b!50543 (= b_free!1549 (not b_next!1549))))

(declare-fun tp!6713 () Bool)

(declare-fun b_and!2759 () Bool)

(assert (=> b!50543 (= tp!6713 b_and!2759)))

(declare-fun b!50536 () Bool)

(declare-fun b_free!1551 () Bool)

(declare-fun b_next!1551 () Bool)

(assert (=> b!50536 (= b_free!1551 (not b_next!1551))))

(declare-fun tp!6714 () Bool)

(declare-fun b_and!2761 () Bool)

(assert (=> b!50536 (= tp!6714 b_and!2761)))

(declare-fun b!50532 () Bool)

(declare-fun e!32668 () Bool)

(declare-fun tp_is_empty!2191 () Bool)

(assert (=> b!50532 (= e!32668 tp_is_empty!2191)))

(declare-fun b!50534 () Bool)

(declare-fun e!32665 () Bool)

(assert (=> b!50534 (= e!32665 tp_is_empty!2191)))

(declare-fun b!50535 () Bool)

(declare-fun e!32666 () Bool)

(assert (=> b!50535 (= e!32666 tp_is_empty!2191)))

(declare-fun mapNonEmpty!2207 () Bool)

(declare-fun mapRes!2208 () Bool)

(declare-fun tp!6712 () Bool)

(assert (=> mapNonEmpty!2207 (= mapRes!2208 (and tp!6712 e!32666))))

(declare-datatypes ((V!2569 0))(
  ( (V!2570 (val!1140 Int)) )
))
(declare-datatypes ((ValueCell!752 0))(
  ( (ValueCellFull!752 (v!2167 V!2569)) (EmptyCell!752) )
))
(declare-fun mapValue!2207 () ValueCell!752)

(declare-datatypes ((array!3295 0))(
  ( (array!3296 (arr!1575 (Array (_ BitVec 32) (_ BitVec 64))) (size!1799 (_ BitVec 32))) )
))
(declare-datatypes ((array!3297 0))(
  ( (array!3298 (arr!1576 (Array (_ BitVec 32) ValueCell!752)) (size!1800 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!412 0))(
  ( (LongMapFixedSize!413 (defaultEntry!1920 Int) (mask!5712 (_ BitVec 32)) (extraKeys!1811 (_ BitVec 32)) (zeroValue!1838 V!2569) (minValue!1838 V!2569) (_size!255 (_ BitVec 32)) (_keys!3530 array!3295) (_values!1903 array!3297) (_vacant!255 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!412)

(declare-fun mapRest!2208 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapKey!2207 () (_ BitVec 32))

(assert (=> mapNonEmpty!2207 (= (arr!1576 (_values!1903 newMap!16)) (store mapRest!2208 mapKey!2207 mapValue!2207))))

(declare-fun e!32658 () Bool)

(declare-fun e!32664 () Bool)

(declare-fun array_inv!965 (array!3295) Bool)

(declare-fun array_inv!966 (array!3297) Bool)

(assert (=> b!50536 (= e!32658 (and tp!6714 tp_is_empty!2191 (array_inv!965 (_keys!3530 newMap!16)) (array_inv!966 (_values!1903 newMap!16)) e!32664))))

(declare-fun b!50537 () Bool)

(declare-fun e!32661 () Bool)

(declare-fun e!32657 () Bool)

(assert (=> b!50537 (= e!32661 e!32657)))

(declare-fun b!50538 () Bool)

(declare-fun e!32656 () Bool)

(declare-fun mapRes!2207 () Bool)

(assert (=> b!50538 (= e!32656 (and e!32668 mapRes!2207))))

(declare-fun condMapEmpty!2207 () Bool)

(declare-datatypes ((Cell!238 0))(
  ( (Cell!239 (v!2168 LongMapFixedSize!412)) )
))
(declare-datatypes ((LongMap!238 0))(
  ( (LongMap!239 (underlying!130 Cell!238)) )
))
(declare-fun thiss!992 () LongMap!238)

(declare-fun mapDefault!2208 () ValueCell!752)

