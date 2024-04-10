; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15766 () Bool)

(assert start!15766)

(declare-fun b!157332 () Bool)

(declare-fun b_free!3433 () Bool)

(declare-fun b_next!3433 () Bool)

(assert (=> b!157332 (= b_free!3433 (not b_next!3433))))

(declare-fun tp!12823 () Bool)

(declare-fun b_and!9847 () Bool)

(assert (=> b!157332 (= tp!12823 b_and!9847)))

(declare-fun b!157330 () Bool)

(declare-fun e!103008 () Bool)

(declare-datatypes ((V!3961 0))(
  ( (V!3962 (val!1662 Int)) )
))
(declare-datatypes ((ValueCell!1274 0))(
  ( (ValueCellFull!1274 (v!3527 V!3961)) (EmptyCell!1274) )
))
(declare-datatypes ((array!5523 0))(
  ( (array!5524 (arr!2619 (Array (_ BitVec 32) (_ BitVec 64))) (size!2897 (_ BitVec 32))) )
))
(declare-datatypes ((array!5525 0))(
  ( (array!5526 (arr!2620 (Array (_ BitVec 32) ValueCell!1274)) (size!2898 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1456 0))(
  ( (LongMapFixedSize!1457 (defaultEntry!3170 Int) (mask!7647 (_ BitVec 32)) (extraKeys!2911 (_ BitVec 32)) (zeroValue!3013 V!3961) (minValue!3013 V!3961) (_size!777 (_ BitVec 32)) (_keys!4945 array!5523) (_values!3153 array!5525) (_vacant!777 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1456)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157330 (= e!103008 (not (validMask!0 (mask!7647 thiss!1248))))))

(declare-fun b!157331 () Bool)

(declare-fun e!103010 () Bool)

(declare-fun tp_is_empty!3235 () Bool)

(assert (=> b!157331 (= e!103010 tp_is_empty!3235)))

(declare-fun e!103006 () Bool)

(declare-fun e!103009 () Bool)

(declare-fun array_inv!1659 (array!5523) Bool)

(declare-fun array_inv!1660 (array!5525) Bool)

(assert (=> b!157332 (= e!103009 (and tp!12823 tp_is_empty!3235 (array_inv!1659 (_keys!4945 thiss!1248)) (array_inv!1660 (_values!3153 thiss!1248)) e!103006))))

(declare-fun mapIsEmpty!5495 () Bool)

(declare-fun mapRes!5495 () Bool)

(assert (=> mapIsEmpty!5495 mapRes!5495))

(declare-fun mapNonEmpty!5495 () Bool)

(declare-fun tp!12824 () Bool)

(declare-fun e!103011 () Bool)

(assert (=> mapNonEmpty!5495 (= mapRes!5495 (and tp!12824 e!103011))))

(declare-fun mapRest!5495 () (Array (_ BitVec 32) ValueCell!1274))

(declare-fun mapKey!5495 () (_ BitVec 32))

(declare-fun mapValue!5495 () ValueCell!1274)

(assert (=> mapNonEmpty!5495 (= (arr!2620 (_values!3153 thiss!1248)) (store mapRest!5495 mapKey!5495 mapValue!5495))))

(declare-fun b!157333 () Bool)

(assert (=> b!157333 (= e!103011 tp_is_empty!3235)))

(declare-fun b!157334 () Bool)

(assert (=> b!157334 (= e!103006 (and e!103010 mapRes!5495))))

(declare-fun condMapEmpty!5495 () Bool)

(declare-fun mapDefault!5495 () ValueCell!1274)

