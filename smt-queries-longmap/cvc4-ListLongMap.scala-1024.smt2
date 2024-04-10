; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21830 () Bool)

(assert start!21830)

(declare-fun b!219600 () Bool)

(declare-fun b_free!5897 () Bool)

(declare-fun b_next!5897 () Bool)

(assert (=> b!219600 (= b_free!5897 (not b_next!5897))))

(declare-fun tp!20833 () Bool)

(declare-fun b_and!12795 () Bool)

(assert (=> b!219600 (= tp!20833 b_and!12795)))

(declare-fun b!219598 () Bool)

(declare-fun e!142838 () Bool)

(declare-fun e!142834 () Bool)

(assert (=> b!219598 (= e!142838 e!142834)))

(declare-fun res!107635 () Bool)

(assert (=> b!219598 (=> (not res!107635) (not e!142834))))

(declare-datatypes ((SeekEntryResult!799 0))(
  ( (MissingZero!799 (index!5366 (_ BitVec 32))) (Found!799 (index!5367 (_ BitVec 32))) (Intermediate!799 (undefined!1611 Bool) (index!5368 (_ BitVec 32)) (x!22907 (_ BitVec 32))) (Undefined!799) (MissingVacant!799 (index!5369 (_ BitVec 32))) )
))
(declare-fun lt!111992 () SeekEntryResult!799)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!219598 (= res!107635 (or (= lt!111992 (MissingZero!799 index!297)) (= lt!111992 (MissingVacant!799 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7325 0))(
  ( (V!7326 (val!2924 Int)) )
))
(declare-datatypes ((ValueCell!2536 0))(
  ( (ValueCellFull!2536 (v!4944 V!7325)) (EmptyCell!2536) )
))
(declare-datatypes ((array!10761 0))(
  ( (array!10762 (arr!5100 (Array (_ BitVec 32) ValueCell!2536)) (size!5433 (_ BitVec 32))) )
))
(declare-datatypes ((array!10763 0))(
  ( (array!10764 (arr!5101 (Array (_ BitVec 32) (_ BitVec 64))) (size!5434 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2972 0))(
  ( (LongMapFixedSize!2973 (defaultEntry!4145 Int) (mask!9937 (_ BitVec 32)) (extraKeys!3882 (_ BitVec 32)) (zeroValue!3986 V!7325) (minValue!3986 V!7325) (_size!1535 (_ BitVec 32)) (_keys!6199 array!10763) (_values!4128 array!10761) (_vacant!1535 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2972)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10763 (_ BitVec 32)) SeekEntryResult!799)

(assert (=> b!219598 (= lt!111992 (seekEntryOrOpen!0 key!932 (_keys!6199 thiss!1504) (mask!9937 thiss!1504)))))

(declare-fun b!219599 () Bool)

(declare-fun c!36570 () Bool)

(assert (=> b!219599 (= c!36570 (is-MissingVacant!799 lt!111992))))

(declare-fun e!142831 () Bool)

(declare-fun e!142830 () Bool)

(assert (=> b!219599 (= e!142831 e!142830)))

(declare-fun b!219601 () Bool)

(declare-fun res!107633 () Bool)

(declare-fun e!142841 () Bool)

(assert (=> b!219601 (=> (not res!107633) (not e!142841))))

(assert (=> b!219601 (= res!107633 (= (select (arr!5101 (_keys!6199 thiss!1504)) (index!5366 lt!111992)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219602 () Bool)

(declare-fun res!107639 () Bool)

(assert (=> b!219602 (=> (not res!107639) (not e!142841))))

(declare-fun call!20526 () Bool)

(assert (=> b!219602 (= res!107639 call!20526)))

(assert (=> b!219602 (= e!142831 e!142841)))

(declare-fun b!219603 () Bool)

(declare-datatypes ((Unit!6547 0))(
  ( (Unit!6548) )
))
(declare-fun e!142837 () Unit!6547)

(declare-fun lt!111989 () Unit!6547)

(assert (=> b!219603 (= e!142837 lt!111989)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!207 (array!10763 array!10761 (_ BitVec 32) (_ BitVec 32) V!7325 V!7325 (_ BitVec 64) Int) Unit!6547)

(assert (=> b!219603 (= lt!111989 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!207 (_keys!6199 thiss!1504) (_values!4128 thiss!1504) (mask!9937 thiss!1504) (extraKeys!3882 thiss!1504) (zeroValue!3986 thiss!1504) (minValue!3986 thiss!1504) key!932 (defaultEntry!4145 thiss!1504)))))

(declare-fun c!36569 () Bool)

(assert (=> b!219603 (= c!36569 (is-MissingZero!799 lt!111992))))

(assert (=> b!219603 e!142831))

(declare-fun mapIsEmpty!9808 () Bool)

(declare-fun mapRes!9808 () Bool)

(assert (=> mapIsEmpty!9808 mapRes!9808))

(declare-fun bm!20522 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20522 (= call!20526 (inRange!0 (ite c!36569 (index!5366 lt!111992) (index!5369 lt!111992)) (mask!9937 thiss!1504)))))

(declare-fun b!219604 () Bool)

(declare-fun res!107632 () Bool)

(declare-fun e!142839 () Bool)

(assert (=> b!219604 (=> (not res!107632) (not e!142839))))

(assert (=> b!219604 (= res!107632 (and (= (size!5433 (_values!4128 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9937 thiss!1504))) (= (size!5434 (_keys!6199 thiss!1504)) (size!5433 (_values!4128 thiss!1504))) (bvsge (mask!9937 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3882 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3882 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!219605 () Bool)

(declare-fun res!107638 () Bool)

(assert (=> b!219605 (=> (not res!107638) (not e!142839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10763 (_ BitVec 32)) Bool)

(assert (=> b!219605 (= res!107638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6199 thiss!1504) (mask!9937 thiss!1504)))))

(declare-fun b!219606 () Bool)

(declare-fun res!107631 () Bool)

(assert (=> b!219606 (=> (not res!107631) (not e!142839))))

(declare-fun arrayContainsKey!0 (array!10763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!219606 (= res!107631 (arrayContainsKey!0 (_keys!6199 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219607 () Bool)

(declare-fun e!142832 () Bool)

(declare-fun tp_is_empty!5759 () Bool)

(assert (=> b!219607 (= e!142832 tp_is_empty!5759)))

(declare-fun mapNonEmpty!9808 () Bool)

(declare-fun tp!20832 () Bool)

(assert (=> mapNonEmpty!9808 (= mapRes!9808 (and tp!20832 e!142832))))

(declare-fun mapValue!9808 () ValueCell!2536)

(declare-fun mapRest!9808 () (Array (_ BitVec 32) ValueCell!2536))

(declare-fun mapKey!9808 () (_ BitVec 32))

(assert (=> mapNonEmpty!9808 (= (arr!5100 (_values!4128 thiss!1504)) (store mapRest!9808 mapKey!9808 mapValue!9808))))

(declare-fun b!219608 () Bool)

(declare-fun e!142840 () Bool)

(declare-fun e!142829 () Bool)

(assert (=> b!219608 (= e!142840 (and e!142829 mapRes!9808))))

(declare-fun condMapEmpty!9808 () Bool)

(declare-fun mapDefault!9808 () ValueCell!2536)

