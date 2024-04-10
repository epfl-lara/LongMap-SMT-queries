; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22018 () Bool)

(assert start!22018)

(declare-fun b!226849 () Bool)

(declare-fun b_free!6085 () Bool)

(declare-fun b_next!6085 () Bool)

(assert (=> b!226849 (= b_free!6085 (not b_next!6085))))

(declare-fun tp!21397 () Bool)

(declare-fun b_and!12983 () Bool)

(assert (=> b!226849 (= tp!21397 b_and!12983)))

(declare-fun b!226848 () Bool)

(declare-fun e!147166 () Bool)

(declare-fun e!147165 () Bool)

(assert (=> b!226848 (= e!147166 e!147165)))

(declare-fun res!111680 () Bool)

(declare-fun call!21090 () Bool)

(assert (=> b!226848 (= res!111680 call!21090)))

(assert (=> b!226848 (=> (not res!111680) (not e!147165))))

(declare-datatypes ((V!7577 0))(
  ( (V!7578 (val!3018 Int)) )
))
(declare-datatypes ((ValueCell!2630 0))(
  ( (ValueCellFull!2630 (v!5038 V!7577)) (EmptyCell!2630) )
))
(declare-datatypes ((array!11137 0))(
  ( (array!11138 (arr!5288 (Array (_ BitVec 32) ValueCell!2630)) (size!5621 (_ BitVec 32))) )
))
(declare-datatypes ((array!11139 0))(
  ( (array!11140 (arr!5289 (Array (_ BitVec 32) (_ BitVec 64))) (size!5622 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3160 0))(
  ( (LongMapFixedSize!3161 (defaultEntry!4239 Int) (mask!10095 (_ BitVec 32)) (extraKeys!3976 (_ BitVec 32)) (zeroValue!4080 V!7577) (minValue!4080 V!7577) (_size!1629 (_ BitVec 32)) (_keys!6293 array!11139) (_values!4222 array!11137) (_vacant!1629 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3160)

(declare-fun tp_is_empty!5947 () Bool)

(declare-fun e!147171 () Bool)

(declare-fun e!147178 () Bool)

(declare-fun array_inv!3497 (array!11139) Bool)

(declare-fun array_inv!3498 (array!11137) Bool)

(assert (=> b!226849 (= e!147171 (and tp!21397 tp_is_empty!5947 (array_inv!3497 (_keys!6293 thiss!1504)) (array_inv!3498 (_values!4222 thiss!1504)) e!147178))))

(declare-fun b!226850 () Bool)

(declare-datatypes ((Unit!6870 0))(
  ( (Unit!6871) )
))
(declare-fun e!147173 () Unit!6870)

(declare-fun Unit!6872 () Unit!6870)

(assert (=> b!226850 (= e!147173 Unit!6872)))

(declare-fun lt!114166 () Unit!6870)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!259 (array!11139 array!11137 (_ BitVec 32) (_ BitVec 32) V!7577 V!7577 (_ BitVec 64) Int) Unit!6870)

(assert (=> b!226850 (= lt!114166 (lemmaInListMapThenSeekEntryOrOpenFindsIt!259 (_keys!6293 thiss!1504) (_values!4222 thiss!1504) (mask!10095 thiss!1504) (extraKeys!3976 thiss!1504) (zeroValue!4080 thiss!1504) (minValue!4080 thiss!1504) key!932 (defaultEntry!4239 thiss!1504)))))

(assert (=> b!226850 false))

(declare-fun bm!21086 () Bool)

(declare-fun call!21089 () Bool)

(declare-fun arrayContainsKey!0 (array!11139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21086 (= call!21089 (arrayContainsKey!0 (_keys!6293 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226851 () Bool)

(declare-datatypes ((SeekEntryResult!888 0))(
  ( (MissingZero!888 (index!5722 (_ BitVec 32))) (Found!888 (index!5723 (_ BitVec 32))) (Intermediate!888 (undefined!1700 Bool) (index!5724 (_ BitVec 32)) (x!23252 (_ BitVec 32))) (Undefined!888) (MissingVacant!888 (index!5725 (_ BitVec 32))) )
))
(declare-fun lt!114175 () SeekEntryResult!888)

(assert (=> b!226851 (= e!147166 (is-Undefined!888 lt!114175))))

(declare-fun b!226852 () Bool)

(declare-fun res!111679 () Bool)

(declare-fun e!147179 () Bool)

(assert (=> b!226852 (=> res!111679 e!147179)))

(assert (=> b!226852 (= res!111679 (or (not (= (size!5621 (_values!4222 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10095 thiss!1504)))) (not (= (size!5622 (_keys!6293 thiss!1504)) (size!5621 (_values!4222 thiss!1504)))) (bvslt (mask!10095 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3976 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3976 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!226853 () Bool)

(declare-fun res!111686 () Bool)

(assert (=> b!226853 (=> res!111686 e!147179)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11139 (_ BitVec 32)) Bool)

(assert (=> b!226853 (= res!111686 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6293 thiss!1504) (mask!10095 thiss!1504))))))

(declare-fun b!226854 () Bool)

(declare-fun c!37607 () Bool)

(assert (=> b!226854 (= c!37607 (is-MissingVacant!888 lt!114175))))

(declare-fun e!147174 () Bool)

(assert (=> b!226854 (= e!147174 e!147166)))

(declare-fun b!226855 () Bool)

(assert (=> b!226855 (= e!147165 (not call!21089))))

(declare-fun b!226856 () Bool)

(declare-fun e!147172 () Bool)

(assert (=> b!226856 (= e!147172 tp_is_empty!5947)))

(declare-fun res!111678 () Bool)

(declare-fun e!147167 () Bool)

(assert (=> start!22018 (=> (not res!111678) (not e!147167))))

(declare-fun valid!1270 (LongMapFixedSize!3160) Bool)

(assert (=> start!22018 (= res!111678 (valid!1270 thiss!1504))))

(assert (=> start!22018 e!147167))

(assert (=> start!22018 e!147171))

(assert (=> start!22018 true))

(declare-fun b!226857 () Bool)

(declare-fun res!111683 () Bool)

(declare-fun e!147177 () Bool)

(assert (=> b!226857 (=> (not res!111683) (not e!147177))))

(assert (=> b!226857 (= res!111683 call!21090)))

(assert (=> b!226857 (= e!147174 e!147177)))

(declare-fun b!226858 () Bool)

(declare-fun res!111688 () Bool)

(assert (=> b!226858 (=> (not res!111688) (not e!147167))))

(assert (=> b!226858 (= res!111688 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226859 () Bool)

(assert (=> b!226859 (= e!147177 (not call!21089))))

(declare-fun b!226860 () Bool)

(declare-fun e!147176 () Bool)

(assert (=> b!226860 (= e!147167 e!147176)))

(declare-fun res!111684 () Bool)

(assert (=> b!226860 (=> (not res!111684) (not e!147176))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!226860 (= res!111684 (or (= lt!114175 (MissingZero!888 index!297)) (= lt!114175 (MissingVacant!888 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11139 (_ BitVec 32)) SeekEntryResult!888)

(assert (=> b!226860 (= lt!114175 (seekEntryOrOpen!0 key!932 (_keys!6293 thiss!1504) (mask!10095 thiss!1504)))))

(declare-fun mapIsEmpty!10090 () Bool)

(declare-fun mapRes!10090 () Bool)

(assert (=> mapIsEmpty!10090 mapRes!10090))

(declare-fun mapNonEmpty!10090 () Bool)

(declare-fun tp!21396 () Bool)

(declare-fun e!147169 () Bool)

(assert (=> mapNonEmpty!10090 (= mapRes!10090 (and tp!21396 e!147169))))

(declare-fun mapValue!10090 () ValueCell!2630)

(declare-fun mapRest!10090 () (Array (_ BitVec 32) ValueCell!2630))

(declare-fun mapKey!10090 () (_ BitVec 32))

(assert (=> mapNonEmpty!10090 (= (arr!5288 (_values!4222 thiss!1504)) (store mapRest!10090 mapKey!10090 mapValue!10090))))

(declare-fun c!37606 () Bool)

(declare-fun bm!21087 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21087 (= call!21090 (inRange!0 (ite c!37606 (index!5722 lt!114175) (index!5725 lt!114175)) (mask!10095 thiss!1504)))))

(declare-fun b!226861 () Bool)

(assert (=> b!226861 (= e!147169 tp_is_empty!5947)))

(declare-fun b!226862 () Bool)

(declare-fun res!111687 () Bool)

(assert (=> b!226862 (=> (not res!111687) (not e!147177))))

(assert (=> b!226862 (= res!111687 (= (select (arr!5289 (_keys!6293 thiss!1504)) (index!5722 lt!114175)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226863 () Bool)

(declare-fun lt!114172 () Unit!6870)

(assert (=> b!226863 (= e!147173 lt!114172)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!273 (array!11139 array!11137 (_ BitVec 32) (_ BitVec 32) V!7577 V!7577 (_ BitVec 64) Int) Unit!6870)

(assert (=> b!226863 (= lt!114172 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!273 (_keys!6293 thiss!1504) (_values!4222 thiss!1504) (mask!10095 thiss!1504) (extraKeys!3976 thiss!1504) (zeroValue!4080 thiss!1504) (minValue!4080 thiss!1504) key!932 (defaultEntry!4239 thiss!1504)))))

(assert (=> b!226863 (= c!37606 (is-MissingZero!888 lt!114175))))

(assert (=> b!226863 e!147174))

(declare-fun b!226864 () Bool)

(declare-fun res!111682 () Bool)

(assert (=> b!226864 (= res!111682 (= (select (arr!5289 (_keys!6293 thiss!1504)) (index!5725 lt!114175)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226864 (=> (not res!111682) (not e!147165))))

(declare-fun b!226865 () Bool)

(assert (=> b!226865 (= e!147178 (and e!147172 mapRes!10090))))

(declare-fun condMapEmpty!10090 () Bool)

(declare-fun mapDefault!10090 () ValueCell!2630)

