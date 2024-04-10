; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8286 () Bool)

(assert start!8286)

(declare-fun b!53671 () Bool)

(declare-fun b_free!1737 () Bool)

(declare-fun b_next!1737 () Bool)

(assert (=> b!53671 (= b_free!1737 (not b_next!1737))))

(declare-fun tp!7313 () Bool)

(declare-fun b_and!3015 () Bool)

(assert (=> b!53671 (= tp!7313 b_and!3015)))

(declare-fun b!53673 () Bool)

(declare-fun b_free!1739 () Bool)

(declare-fun b_next!1739 () Bool)

(assert (=> b!53673 (= b_free!1739 (not b_next!1739))))

(declare-fun tp!7311 () Bool)

(declare-fun b_and!3017 () Bool)

(assert (=> b!53673 (= tp!7311 b_and!3017)))

(declare-fun mapNonEmpty!2525 () Bool)

(declare-fun mapRes!2526 () Bool)

(declare-fun tp!7314 () Bool)

(declare-fun e!35021 () Bool)

(assert (=> mapNonEmpty!2525 (= mapRes!2526 (and tp!7314 e!35021))))

(declare-datatypes ((V!2693 0))(
  ( (V!2694 (val!1187 Int)) )
))
(declare-datatypes ((ValueCell!799 0))(
  ( (ValueCellFull!799 (v!2261 V!2693)) (EmptyCell!799) )
))
(declare-fun mapRest!2526 () (Array (_ BitVec 32) ValueCell!799))

(declare-fun mapValue!2526 () ValueCell!799)

(declare-fun mapKey!2525 () (_ BitVec 32))

(declare-datatypes ((array!3493 0))(
  ( (array!3494 (arr!1669 (Array (_ BitVec 32) (_ BitVec 64))) (size!1898 (_ BitVec 32))) )
))
(declare-datatypes ((array!3495 0))(
  ( (array!3496 (arr!1670 (Array (_ BitVec 32) ValueCell!799)) (size!1899 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!506 0))(
  ( (LongMapFixedSize!507 (defaultEntry!1967 Int) (mask!5804 (_ BitVec 32)) (extraKeys!1858 (_ BitVec 32)) (zeroValue!1885 V!2693) (minValue!1885 V!2693) (_size!302 (_ BitVec 32)) (_keys!3587 array!3493) (_values!1950 array!3495) (_vacant!302 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!324 0))(
  ( (Cell!325 (v!2262 LongMapFixedSize!506)) )
))
(declare-datatypes ((LongMap!324 0))(
  ( (LongMap!325 (underlying!173 Cell!324)) )
))
(declare-fun thiss!992 () LongMap!324)

(assert (=> mapNonEmpty!2525 (= (arr!1670 (_values!1950 (v!2262 (underlying!173 thiss!992)))) (store mapRest!2526 mapKey!2525 mapValue!2526))))

(declare-fun b!53665 () Bool)

(declare-fun tp_is_empty!2285 () Bool)

(assert (=> b!53665 (= e!35021 tp_is_empty!2285)))

(declare-fun mapIsEmpty!2525 () Bool)

(assert (=> mapIsEmpty!2525 mapRes!2526))

(declare-fun b!53666 () Bool)

(declare-fun res!30416 () Bool)

(declare-fun e!35016 () Bool)

(assert (=> b!53666 (=> (not res!30416) (not e!35016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53666 (= res!30416 (validMask!0 (mask!5804 (v!2262 (underlying!173 thiss!992)))))))

(declare-fun b!53667 () Bool)

(declare-fun res!30412 () Bool)

(assert (=> b!53667 (=> (not res!30412) (not e!35016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3493 (_ BitVec 32)) Bool)

(assert (=> b!53667 (= res!30412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3587 (v!2262 (underlying!173 thiss!992))) (mask!5804 (v!2262 (underlying!173 thiss!992)))))))

(declare-fun b!53668 () Bool)

(declare-fun res!30418 () Bool)

(declare-fun e!35019 () Bool)

(assert (=> b!53668 (=> (not res!30418) (not e!35019))))

(declare-fun newMap!16 () LongMapFixedSize!506)

(assert (=> b!53668 (= res!30418 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5804 newMap!16)) (_size!302 (v!2262 (underlying!173 thiss!992)))))))

(declare-fun b!53670 () Bool)

(declare-fun e!35018 () Bool)

(declare-fun e!35013 () Bool)

(assert (=> b!53670 (= e!35018 (and e!35013 mapRes!2526))))

(declare-fun condMapEmpty!2525 () Bool)

(declare-fun mapDefault!2526 () ValueCell!799)

