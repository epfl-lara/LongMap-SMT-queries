; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19260 () Bool)

(assert start!19260)

(declare-fun b!189540 () Bool)

(declare-fun b_free!4651 () Bool)

(declare-fun b_next!4651 () Bool)

(assert (=> b!189540 (= b_free!4651 (not b_next!4651))))

(declare-fun tp!16785 () Bool)

(declare-fun b_and!11289 () Bool)

(assert (=> b!189540 (= tp!16785 b_and!11289)))

(declare-fun mapIsEmpty!7630 () Bool)

(declare-fun mapRes!7630 () Bool)

(assert (=> mapIsEmpty!7630 mapRes!7630))

(declare-fun mapNonEmpty!7630 () Bool)

(declare-fun tp!16786 () Bool)

(declare-fun e!124721 () Bool)

(assert (=> mapNonEmpty!7630 (= mapRes!7630 (and tp!16786 e!124721))))

(declare-datatypes ((V!5545 0))(
  ( (V!5546 (val!2256 Int)) )
))
(declare-datatypes ((ValueCell!1868 0))(
  ( (ValueCellFull!1868 (v!4177 V!5545)) (EmptyCell!1868) )
))
(declare-fun mapValue!7630 () ValueCell!1868)

(declare-fun mapKey!7630 () (_ BitVec 32))

(declare-datatypes ((array!8075 0))(
  ( (array!8076 (arr!3807 (Array (_ BitVec 32) (_ BitVec 64))) (size!4127 (_ BitVec 32))) )
))
(declare-datatypes ((array!8077 0))(
  ( (array!8078 (arr!3808 (Array (_ BitVec 32) ValueCell!1868)) (size!4128 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2644 0))(
  ( (LongMapFixedSize!2645 (defaultEntry!3866 Int) (mask!9055 (_ BitVec 32)) (extraKeys!3603 (_ BitVec 32)) (zeroValue!3707 V!5545) (minValue!3707 V!5545) (_size!1371 (_ BitVec 32)) (_keys!5833 array!8075) (_values!3849 array!8077) (_vacant!1371 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2644)

(declare-fun mapRest!7630 () (Array (_ BitVec 32) ValueCell!1868))

(assert (=> mapNonEmpty!7630 (= (arr!3808 (_values!3849 thiss!1248)) (store mapRest!7630 mapKey!7630 mapValue!7630))))

(declare-datatypes ((SeekEntryResult!665 0))(
  ( (MissingZero!665 (index!4830 (_ BitVec 32))) (Found!665 (index!4831 (_ BitVec 32))) (Intermediate!665 (undefined!1477 Bool) (index!4832 (_ BitVec 32)) (x!20431 (_ BitVec 32))) (Undefined!665) (MissingVacant!665 (index!4833 (_ BitVec 32))) )
))
(declare-fun lt!93790 () SeekEntryResult!665)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!124727 () Bool)

(declare-fun b!189533 () Bool)

(assert (=> b!189533 (= e!124727 (= (select (arr!3807 (_keys!5833 thiss!1248)) (index!4831 lt!93790)) key!828))))

(declare-fun b!189534 () Bool)

(declare-datatypes ((Unit!5719 0))(
  ( (Unit!5720) )
))
(declare-fun e!124724 () Unit!5719)

(declare-fun lt!93789 () Unit!5719)

(assert (=> b!189534 (= e!124724 lt!93789)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!165 (array!8075 array!8077 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 64) Int) Unit!5719)

(assert (=> b!189534 (= lt!93789 (lemmaInListMapThenSeekEntryOrOpenFindsIt!165 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)))))

(declare-fun res!89632 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189534 (= res!89632 (inRange!0 (index!4831 lt!93790) (mask!9055 thiss!1248)))))

(assert (=> b!189534 (=> (not res!89632) (not e!124727))))

(assert (=> b!189534 e!124727))

(declare-fun b!189535 () Bool)

(declare-fun Unit!5721 () Unit!5719)

(assert (=> b!189535 (= e!124724 Unit!5721)))

(declare-fun lt!93791 () Unit!5719)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!168 (array!8075 array!8077 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 64) Int) Unit!5719)

(assert (=> b!189535 (= lt!93791 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!168 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)))))

(assert (=> b!189535 false))

(declare-fun b!189536 () Bool)

(declare-fun res!89629 () Bool)

(declare-fun e!124723 () Bool)

(assert (=> b!189536 (=> (not res!89629) (not e!124723))))

(assert (=> b!189536 (= res!89629 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189537 () Bool)

(declare-fun tp_is_empty!4423 () Bool)

(assert (=> b!189537 (= e!124721 tp_is_empty!4423)))

(declare-fun res!89631 () Bool)

(assert (=> start!19260 (=> (not res!89631) (not e!124723))))

(declare-fun valid!1085 (LongMapFixedSize!2644) Bool)

(assert (=> start!19260 (= res!89631 (valid!1085 thiss!1248))))

(assert (=> start!19260 e!124723))

(declare-fun e!124722 () Bool)

(assert (=> start!19260 e!124722))

(assert (=> start!19260 true))

(assert (=> start!19260 tp_is_empty!4423))

(declare-fun b!189538 () Bool)

(declare-fun e!124725 () Bool)

(assert (=> b!189538 (= e!124725 tp_is_empty!4423)))

(declare-fun b!189539 () Bool)

(declare-fun e!124720 () Bool)

(assert (=> b!189539 (= e!124720 (and e!124725 mapRes!7630))))

(declare-fun condMapEmpty!7630 () Bool)

(declare-fun mapDefault!7630 () ValueCell!1868)

