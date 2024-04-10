; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16182 () Bool)

(assert start!16182)

(declare-fun b!161375 () Bool)

(declare-fun b_free!3643 () Bool)

(declare-fun b_next!3643 () Bool)

(assert (=> b!161375 (= b_free!3643 (not b_next!3643))))

(declare-fun tp!13499 () Bool)

(declare-fun b_and!10057 () Bool)

(assert (=> b!161375 (= tp!13499 b_and!10057)))

(declare-fun b!161369 () Bool)

(declare-datatypes ((Unit!5010 0))(
  ( (Unit!5011) )
))
(declare-fun e!105456 () Unit!5010)

(declare-datatypes ((V!4241 0))(
  ( (V!4242 (val!1767 Int)) )
))
(declare-datatypes ((ValueCell!1379 0))(
  ( (ValueCellFull!1379 (v!3632 V!4241)) (EmptyCell!1379) )
))
(declare-datatypes ((array!5969 0))(
  ( (array!5970 (arr!2829 (Array (_ BitVec 32) (_ BitVec 64))) (size!3113 (_ BitVec 32))) )
))
(declare-datatypes ((array!5971 0))(
  ( (array!5972 (arr!2830 (Array (_ BitVec 32) ValueCell!1379)) (size!3114 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1666 0))(
  ( (LongMapFixedSize!1667 (defaultEntry!3275 Int) (mask!7865 (_ BitVec 32)) (extraKeys!3016 (_ BitVec 32)) (zeroValue!3118 V!4241) (minValue!3118 V!4241) (_size!882 (_ BitVec 32)) (_keys!5076 array!5969) (_values!3258 array!5971) (_vacant!882 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1666)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!76 (array!5969 array!5971 (_ BitVec 32) (_ BitVec 32) V!4241 V!4241 (_ BitVec 64) Int) Unit!5010)

(assert (=> b!161369 (= e!105456 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!76 (_keys!5076 thiss!1248) (_values!3258 thiss!1248) (mask!7865 thiss!1248) (extraKeys!3016 thiss!1248) (zeroValue!3118 thiss!1248) (minValue!3118 thiss!1248) key!828 (defaultEntry!3275 thiss!1248)))))

(declare-fun b!161370 () Bool)

(declare-fun res!76503 () Bool)

(declare-fun e!105455 () Bool)

(assert (=> b!161370 (=> (not res!76503) (not e!105455))))

(assert (=> b!161370 (= res!76503 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5855 () Bool)

(declare-fun mapRes!5855 () Bool)

(declare-fun tp!13498 () Bool)

(declare-fun e!105454 () Bool)

(assert (=> mapNonEmpty!5855 (= mapRes!5855 (and tp!13498 e!105454))))

(declare-fun mapRest!5855 () (Array (_ BitVec 32) ValueCell!1379))

(declare-fun mapValue!5855 () ValueCell!1379)

(declare-fun mapKey!5855 () (_ BitVec 32))

(assert (=> mapNonEmpty!5855 (= (arr!2830 (_values!3258 thiss!1248)) (store mapRest!5855 mapKey!5855 mapValue!5855))))

(declare-fun b!161371 () Bool)

(declare-fun e!105459 () Bool)

(declare-fun tp_is_empty!3445 () Bool)

(assert (=> b!161371 (= e!105459 tp_is_empty!3445)))

(declare-fun res!76505 () Bool)

(assert (=> start!16182 (=> (not res!76505) (not e!105455))))

(declare-fun valid!764 (LongMapFixedSize!1666) Bool)

(assert (=> start!16182 (= res!76505 (valid!764 thiss!1248))))

(assert (=> start!16182 e!105455))

(declare-fun e!105458 () Bool)

(assert (=> start!16182 e!105458))

(assert (=> start!16182 true))

(declare-fun b!161372 () Bool)

(assert (=> b!161372 (= e!105455 false)))

(declare-fun lt!82198 () Unit!5010)

(assert (=> b!161372 (= lt!82198 e!105456)))

(declare-fun c!29953 () Bool)

(declare-datatypes ((tuple2!2958 0))(
  ( (tuple2!2959 (_1!1490 (_ BitVec 64)) (_2!1490 V!4241)) )
))
(declare-datatypes ((List!1975 0))(
  ( (Nil!1972) (Cons!1971 (h!2584 tuple2!2958) (t!6777 List!1975)) )
))
(declare-datatypes ((ListLongMap!1945 0))(
  ( (ListLongMap!1946 (toList!988 List!1975)) )
))
(declare-fun contains!1024 (ListLongMap!1945 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!652 (array!5969 array!5971 (_ BitVec 32) (_ BitVec 32) V!4241 V!4241 (_ BitVec 32) Int) ListLongMap!1945)

(assert (=> b!161372 (= c!29953 (contains!1024 (getCurrentListMap!652 (_keys!5076 thiss!1248) (_values!3258 thiss!1248) (mask!7865 thiss!1248) (extraKeys!3016 thiss!1248) (zeroValue!3118 thiss!1248) (minValue!3118 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3275 thiss!1248)) key!828))))

(declare-fun b!161373 () Bool)

(assert (=> b!161373 (= e!105454 tp_is_empty!3445)))

(declare-fun b!161374 () Bool)

(declare-fun res!76504 () Bool)

(assert (=> b!161374 (=> (not res!76504) (not e!105455))))

(declare-datatypes ((SeekEntryResult!353 0))(
  ( (MissingZero!353 (index!3580 (_ BitVec 32))) (Found!353 (index!3581 (_ BitVec 32))) (Intermediate!353 (undefined!1165 Bool) (index!3582 (_ BitVec 32)) (x!17809 (_ BitVec 32))) (Undefined!353) (MissingVacant!353 (index!3583 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5969 (_ BitVec 32)) SeekEntryResult!353)

(assert (=> b!161374 (= res!76504 (is-Undefined!353 (seekEntryOrOpen!0 key!828 (_keys!5076 thiss!1248) (mask!7865 thiss!1248))))))

(declare-fun e!105453 () Bool)

(declare-fun array_inv!1809 (array!5969) Bool)

(declare-fun array_inv!1810 (array!5971) Bool)

(assert (=> b!161375 (= e!105458 (and tp!13499 tp_is_empty!3445 (array_inv!1809 (_keys!5076 thiss!1248)) (array_inv!1810 (_values!3258 thiss!1248)) e!105453))))

(declare-fun b!161376 () Bool)

(assert (=> b!161376 (= e!105453 (and e!105459 mapRes!5855))))

(declare-fun condMapEmpty!5855 () Bool)

(declare-fun mapDefault!5855 () ValueCell!1379)

