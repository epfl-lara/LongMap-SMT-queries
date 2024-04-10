; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15480 () Bool)

(assert start!15480)

(declare-fun b!154003 () Bool)

(declare-fun b_free!3217 () Bool)

(declare-fun b_next!3217 () Bool)

(assert (=> b!154003 (= b_free!3217 (not b_next!3217))))

(declare-fun tp!12171 () Bool)

(declare-fun b_and!9587 () Bool)

(assert (=> b!154003 (= tp!12171 b_and!9587)))

(declare-fun b!153995 () Bool)

(declare-fun b_free!3219 () Bool)

(declare-fun b_next!3219 () Bool)

(assert (=> b!153995 (= b_free!3219 (not b_next!3219))))

(declare-fun tp!12173 () Bool)

(declare-fun b_and!9589 () Bool)

(assert (=> b!153995 (= tp!12173 b_and!9589)))

(declare-fun mapIsEmpty!5165 () Bool)

(declare-fun mapRes!5165 () Bool)

(assert (=> mapIsEmpty!5165 mapRes!5165))

(declare-fun mapNonEmpty!5165 () Bool)

(declare-fun tp!12174 () Bool)

(declare-fun e!100611 () Bool)

(assert (=> mapNonEmpty!5165 (= mapRes!5165 (and tp!12174 e!100611))))

(declare-datatypes ((V!3681 0))(
  ( (V!3682 (val!1557 Int)) )
))
(declare-datatypes ((ValueCell!1169 0))(
  ( (ValueCellFull!1169 (v!3416 V!3681)) (EmptyCell!1169) )
))
(declare-fun mapRest!5165 () (Array (_ BitVec 32) ValueCell!1169))

(declare-datatypes ((array!5101 0))(
  ( (array!5102 (arr!2409 (Array (_ BitVec 32) (_ BitVec 64))) (size!2686 (_ BitVec 32))) )
))
(declare-datatypes ((array!5103 0))(
  ( (array!5104 (arr!2410 (Array (_ BitVec 32) ValueCell!1169)) (size!2687 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1246 0))(
  ( (LongMapFixedSize!1247 (defaultEntry!3063 Int) (mask!7467 (_ BitVec 32)) (extraKeys!2804 (_ BitVec 32)) (zeroValue!2906 V!3681) (minValue!2906 V!3681) (_size!672 (_ BitVec 32)) (_keys!4836 array!5101) (_values!3046 array!5103) (_vacant!672 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1028 0))(
  ( (Cell!1029 (v!3417 LongMapFixedSize!1246)) )
))
(declare-datatypes ((LongMap!1028 0))(
  ( (LongMap!1029 (underlying!525 Cell!1028)) )
))
(declare-fun thiss!992 () LongMap!1028)

(declare-fun mapKey!5166 () (_ BitVec 32))

(declare-fun mapValue!5166 () ValueCell!1169)

(assert (=> mapNonEmpty!5165 (= (arr!2410 (_values!3046 (v!3417 (underlying!525 thiss!992)))) (store mapRest!5165 mapKey!5166 mapValue!5166))))

(declare-fun b!153989 () Bool)

(declare-fun e!100600 () Bool)

(declare-fun e!100609 () Bool)

(assert (=> b!153989 (= e!100600 e!100609)))

(declare-fun b!153990 () Bool)

(declare-fun e!100604 () Bool)

(declare-fun e!100606 () Bool)

(declare-fun mapRes!5166 () Bool)

(assert (=> b!153990 (= e!100604 (and e!100606 mapRes!5166))))

(declare-fun condMapEmpty!5166 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1246)

(declare-fun mapDefault!5166 () ValueCell!1169)

