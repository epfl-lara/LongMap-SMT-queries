; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21730 () Bool)

(assert start!21730)

(declare-fun b!218574 () Bool)

(declare-fun b_free!5879 () Bool)

(declare-fun b_next!5879 () Bool)

(assert (=> b!218574 (= b_free!5879 (not b_next!5879))))

(declare-fun tp!20771 () Bool)

(declare-fun b_and!12769 () Bool)

(assert (=> b!218574 (= tp!20771 b_and!12769)))

(declare-fun b!218563 () Bool)

(declare-fun res!107160 () Bool)

(declare-datatypes ((V!7301 0))(
  ( (V!7302 (val!2915 Int)) )
))
(declare-datatypes ((ValueCell!2527 0))(
  ( (ValueCellFull!2527 (v!4933 V!7301)) (EmptyCell!2527) )
))
(declare-datatypes ((array!10721 0))(
  ( (array!10722 (arr!5082 (Array (_ BitVec 32) ValueCell!2527)) (size!5414 (_ BitVec 32))) )
))
(declare-datatypes ((array!10723 0))(
  ( (array!10724 (arr!5083 (Array (_ BitVec 32) (_ BitVec 64))) (size!5415 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2954 0))(
  ( (LongMapFixedSize!2955 (defaultEntry!4127 Int) (mask!9904 (_ BitVec 32)) (extraKeys!3864 (_ BitVec 32)) (zeroValue!3968 V!7301) (minValue!3968 V!7301) (_size!1526 (_ BitVec 32)) (_keys!6176 array!10723) (_values!4110 array!10721) (_vacant!1526 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2954)

(declare-datatypes ((SeekEntryResult!790 0))(
  ( (MissingZero!790 (index!5330 (_ BitVec 32))) (Found!790 (index!5331 (_ BitVec 32))) (Intermediate!790 (undefined!1602 Bool) (index!5332 (_ BitVec 32)) (x!22846 (_ BitVec 32))) (Undefined!790) (MissingVacant!790 (index!5333 (_ BitVec 32))) )
))
(declare-fun lt!111561 () SeekEntryResult!790)

(assert (=> b!218563 (= res!107160 (= (select (arr!5083 (_keys!6176 thiss!1504)) (index!5333 lt!111561)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142182 () Bool)

(assert (=> b!218563 (=> (not res!107160) (not e!142182))))

(declare-fun b!218564 () Bool)

(declare-fun e!142188 () Bool)

(declare-fun tp_is_empty!5741 () Bool)

(assert (=> b!218564 (= e!142188 tp_is_empty!5741)))

(declare-fun mapIsEmpty!9774 () Bool)

(declare-fun mapRes!9774 () Bool)

(assert (=> mapIsEmpty!9774 mapRes!9774))

(declare-fun b!218565 () Bool)

(declare-fun call!20400 () Bool)

(assert (=> b!218565 (= e!142182 (not call!20400))))

(declare-fun b!218566 () Bool)

(declare-datatypes ((Unit!6513 0))(
  ( (Unit!6514) )
))
(declare-fun e!142187 () Unit!6513)

(declare-fun lt!111558 () Unit!6513)

(assert (=> b!218566 (= e!142187 lt!111558)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!200 (array!10723 array!10721 (_ BitVec 32) (_ BitVec 32) V!7301 V!7301 (_ BitVec 64) Int) Unit!6513)

(assert (=> b!218566 (= lt!111558 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!200 (_keys!6176 thiss!1504) (_values!4110 thiss!1504) (mask!9904 thiss!1504) (extraKeys!3864 thiss!1504) (zeroValue!3968 thiss!1504) (minValue!3968 thiss!1504) key!932 (defaultEntry!4127 thiss!1504)))))

(declare-fun c!36355 () Bool)

(assert (=> b!218566 (= c!36355 (is-MissingZero!790 lt!111561))))

(declare-fun e!142179 () Bool)

(assert (=> b!218566 e!142179))

(declare-fun mapNonEmpty!9774 () Bool)

(declare-fun tp!20772 () Bool)

(declare-fun e!142178 () Bool)

(assert (=> mapNonEmpty!9774 (= mapRes!9774 (and tp!20772 e!142178))))

(declare-fun mapRest!9774 () (Array (_ BitVec 32) ValueCell!2527))

(declare-fun mapValue!9774 () ValueCell!2527)

(declare-fun mapKey!9774 () (_ BitVec 32))

(assert (=> mapNonEmpty!9774 (= (arr!5082 (_values!4110 thiss!1504)) (store mapRest!9774 mapKey!9774 mapValue!9774))))

(declare-fun b!218567 () Bool)

(declare-fun e!142185 () Bool)

(assert (=> b!218567 (= e!142185 (and e!142188 mapRes!9774))))

(declare-fun condMapEmpty!9774 () Bool)

(declare-fun mapDefault!9774 () ValueCell!2527)

