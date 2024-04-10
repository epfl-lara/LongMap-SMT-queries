; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8250 () Bool)

(assert start!8250)

(declare-fun b!52515 () Bool)

(declare-fun b_free!1665 () Bool)

(declare-fun b_next!1665 () Bool)

(assert (=> b!52515 (= b_free!1665 (not b_next!1665))))

(declare-fun tp!7098 () Bool)

(declare-fun b_and!2875 () Bool)

(assert (=> b!52515 (= tp!7098 b_and!2875)))

(declare-fun b!52507 () Bool)

(declare-fun b_free!1667 () Bool)

(declare-fun b_next!1667 () Bool)

(assert (=> b!52507 (= b_free!1667 (not b_next!1667))))

(declare-fun tp!7097 () Bool)

(declare-fun b_and!2877 () Bool)

(assert (=> b!52507 (= tp!7097 b_and!2877)))

(declare-fun mapNonEmpty!2417 () Bool)

(declare-fun mapRes!2417 () Bool)

(declare-fun tp!7096 () Bool)

(declare-fun e!34217 () Bool)

(assert (=> mapNonEmpty!2417 (= mapRes!2417 (and tp!7096 e!34217))))

(declare-datatypes ((V!2645 0))(
  ( (V!2646 (val!1169 Int)) )
))
(declare-datatypes ((array!3421 0))(
  ( (array!3422 (arr!1633 (Array (_ BitVec 32) (_ BitVec 64))) (size!1862 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!781 0))(
  ( (ValueCellFull!781 (v!2227 V!2645)) (EmptyCell!781) )
))
(declare-datatypes ((array!3423 0))(
  ( (array!3424 (arr!1634 (Array (_ BitVec 32) ValueCell!781)) (size!1863 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!470 0))(
  ( (LongMapFixedSize!471 (defaultEntry!1949 Int) (mask!5774 (_ BitVec 32)) (extraKeys!1840 (_ BitVec 32)) (zeroValue!1867 V!2645) (minValue!1867 V!2645) (_size!284 (_ BitVec 32)) (_keys!3569 array!3421) (_values!1932 array!3423) (_vacant!284 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!292 0))(
  ( (Cell!293 (v!2228 LongMapFixedSize!470)) )
))
(declare-datatypes ((LongMap!292 0))(
  ( (LongMap!293 (underlying!157 Cell!292)) )
))
(declare-fun thiss!992 () LongMap!292)

(declare-fun mapRest!2418 () (Array (_ BitVec 32) ValueCell!781))

(declare-fun mapKey!2417 () (_ BitVec 32))

(declare-fun mapValue!2417 () ValueCell!781)

(assert (=> mapNonEmpty!2417 (= (arr!1634 (_values!1932 (v!2228 (underlying!157 thiss!992)))) (store mapRest!2418 mapKey!2417 mapValue!2417))))

(declare-fun b!52504 () Bool)

(declare-fun e!34211 () Bool)

(declare-fun e!34207 () Bool)

(declare-fun mapRes!2418 () Bool)

(assert (=> b!52504 (= e!34211 (and e!34207 mapRes!2418))))

(declare-fun condMapEmpty!2418 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!470)

(declare-fun mapDefault!2418 () ValueCell!781)

