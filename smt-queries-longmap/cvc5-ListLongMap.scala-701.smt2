; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16710 () Bool)

(assert start!16710)

(declare-fun b!167611 () Bool)

(declare-fun b_free!4015 () Bool)

(declare-fun b_next!4015 () Bool)

(assert (=> b!167611 (= b_free!4015 (not b_next!4015))))

(declare-fun tp!14646 () Bool)

(declare-fun b_and!10429 () Bool)

(assert (=> b!167611 (= tp!14646 b_and!10429)))

(declare-fun b!167604 () Bool)

(declare-fun e!110096 () Bool)

(assert (=> b!167604 (= e!110096 true)))

(declare-fun lt!83776 () Bool)

(declare-datatypes ((V!4737 0))(
  ( (V!4738 (val!1953 Int)) )
))
(declare-datatypes ((ValueCell!1565 0))(
  ( (ValueCellFull!1565 (v!3818 V!4737)) (EmptyCell!1565) )
))
(declare-datatypes ((array!6731 0))(
  ( (array!6732 (arr!3201 (Array (_ BitVec 32) (_ BitVec 64))) (size!3489 (_ BitVec 32))) )
))
(declare-datatypes ((array!6733 0))(
  ( (array!6734 (arr!3202 (Array (_ BitVec 32) ValueCell!1565)) (size!3490 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2038 0))(
  ( (LongMapFixedSize!2039 (defaultEntry!3461 Int) (mask!8212 (_ BitVec 32)) (extraKeys!3202 (_ BitVec 32)) (zeroValue!3304 V!4737) (minValue!3304 V!4737) (_size!1068 (_ BitVec 32)) (_keys!5286 array!6731) (_values!3444 array!6733) (_vacant!1068 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2038)

(declare-datatypes ((List!2135 0))(
  ( (Nil!2132) (Cons!2131 (h!2748 (_ BitVec 64)) (t!6937 List!2135)) )
))
(declare-fun arrayNoDuplicates!0 (array!6731 (_ BitVec 32) List!2135) Bool)

(assert (=> b!167604 (= lt!83776 (arrayNoDuplicates!0 (_keys!5286 thiss!1248) #b00000000000000000000000000000000 Nil!2132))))

(declare-fun mapNonEmpty!6444 () Bool)

(declare-fun mapRes!6444 () Bool)

(declare-fun tp!14645 () Bool)

(declare-fun e!110099 () Bool)

(assert (=> mapNonEmpty!6444 (= mapRes!6444 (and tp!14645 e!110099))))

(declare-fun mapRest!6444 () (Array (_ BitVec 32) ValueCell!1565))

(declare-fun mapKey!6444 () (_ BitVec 32))

(declare-fun mapValue!6444 () ValueCell!1565)

(assert (=> mapNonEmpty!6444 (= (arr!3202 (_values!3444 thiss!1248)) (store mapRest!6444 mapKey!6444 mapValue!6444))))

(declare-fun b!167605 () Bool)

(declare-fun e!110093 () Bool)

(declare-fun e!110098 () Bool)

(assert (=> b!167605 (= e!110093 (and e!110098 mapRes!6444))))

(declare-fun condMapEmpty!6444 () Bool)

(declare-fun mapDefault!6444 () ValueCell!1565)

